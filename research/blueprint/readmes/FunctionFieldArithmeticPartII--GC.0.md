# Root Picard stacks — FunctionFieldArithmeticPartII, GC.0

This layer supplies the geometric recipient of ramified Abel–Jacobi maps: a line
bundle on a curve together with a square root of its restriction to the finite
ramification locus. Its second recipient remembers a section of that root line
on the ramification locus. These objects retain all isomorphisms and all integer
degrees. They support the tensor operations used by ramified geometric class
field theory.

The definitions begin with actual invertible sheaves. Ordinary Picard stacks,
relative Picard sheaves, native tensor/dual operations, and generic stacks and
torsors have their existing owners. The new work is the root-specific fibre,
coherence, quotient comparison and inertia calculation. The source is
[Yun–Zhang, *Shtukas and the Taylor expansion of L-functions (II)*](https://math.mit.edu/~zyun/GZW_ramified_published.pdf),
Definition A.1, printed p. 514, and A.1.1–A.1.2, p. 515. The statements below
are specifications, and assert no formal implementation.

## Conventions and supplier boundary

Let k be a field of characteristic different from 2, X/k a smooth projective
geometrically connected curve, and i:R→X a closed immersion with R finite étale
over k, possibly empty. Write ρ=rank(R/k). Over an algebraic closure, R has ρ geometric points.
The finite-field application of the parent roadmap satisfies these hypotheses:
a reduced finite divisor over a finite field is finite étale. Yun–Zhang work
over a finite field of odd characteristic. The general-field statements here
are justified by the displayed native tensor, frame and descent arguments,
which use finite étaleness and invertibility of 2, without Frobenius or a
finite-field argument. Over an imperfect field, “reduced” alone is not the
hypothesis used here.

For a k-scheme S write X_S=X×_k S, R_S=R×_k S, and i_S:R_S→X_S. S may be
disconnected, nonreduced and non-Noetherian. Work on the big fppf scheme site;
the ordinary fpqc descent suppliers restrict to it. Every base-change operation
includes its specified identity and composition isomorphisms. No coefficients,
Frobenius, global effective section, chosen rational point or degree-one divisor
are inputs to GC.0.

A line bundle means `TauCeti.AlgebraicGeometry.InvertibleSheaf`. The pinned
category has all module morphisms between its objects. Its **core** retains all
objects and only isomorphisms; this is Mathlib's `CategoryTheory.Core`, not its
set of isomorphism classes. Denote the native sheaf tensor by ⊗ and the
structure sheaf by O. The trivial line in the pinned library is presented by a
free rank-one module; its identification with O uses the native unit
isomorphism. These comparisons must appear in root identifications rather than
being treated as definitional equalities.

The exact imports are:

| Owner | Imported contract |
| --- | --- |
| `SchemeAndStackFoundations:SF.3/picard-groupoid` | Native Picard core, coherent tensor and dual, symmetric monoidal pullback, effective descent. Its general module infrastructure comes from current upstream AlgebraicVectorBundles L0A/L0B. |
| `SchemeAndStackFoundations:SF.3/picard-stack-curve` | Ordinary Picard stack on the actual scheme site, its universal scalar automorphisms, algebraicity and all degree components. |
| `SchemeAndStackFoundations:SF.3/picard-scheme-without-point` | Picard-sheaf components as torsors under Pic^0 without choosing X(k). Only that torsor contract is used here. |
| `SchemeAndStackFoundations:SF.1/stack-in-groupoids` | Mathlib pseudofunctors on the locally discrete opposite scheme category, groupoid fibres and IsStack; strong transformations and modifications give morphisms and 2-morphisms. |
| `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products` | Ordinary groupoid quotient stackification and 2-fibre products with a specified comparison isomorphism. |
| `SchemeAndStackFoundations:SF.1/two-fibre-product` | The same scheme-site 2-pullback in explicit categorical-pullback triples. |
| `SchemeAndStackFoundations:SF.1/affine-fpqc-descent` | Affine schemes and their morphisms descend effectively. |
| `SchemeAndStackFoundations:SF.2/fppf-kummer-sequence` | Positive-exponent Kummer lifting, used at exponent two, including its étale form when 2 is invertible. |

The three integration requests at the end identify the still required adapters.
These imports are planning contracts, not claims that their code exists at the
pins. In particular the SF.3 packet's review does not certify an implemented
Picard stack. Generic coherent sheaf tensor/dual theory is not rebuilt here.

## The inherited GC.0 targets

The following accepted parent targets are imported by their existing IDs. This
part refines their native carriers and comparisons and does not redeclare the
parent IDs. The parent packet is unchanged.


### The graded root Picard stack

`FunctionFieldArithmeticPartII:GC.0/root-picard`

Pic_X^√R(S) is the groupoid of (L,K_R,ι), where L is a line bundle on X×S, K_R a line bundle on R×S and ι:K_R²≅L|_{R×S}. Its degree-d component imposes degree d on every geometric fibre; d ranges over all integers. Tensor product and dual give the graded commutative Picard stack.

The negative-degree check concerns permitted components and geometric nonemptiness. It does not assert a k-valued line bundle in every degree on every curve. The refinement below states this qualification explicitly.

Imported API:

- `TauCeti.RamifiedClassField.rootPicard.object`: Create (L,K_R,ι) from the two line bundles and the square identification.

- `TauCeti.RamifiedClassField.rootPicard.degree`: The degree is the fibrewise degree of L, additive under tensor product.

- `TauCeti.RamifiedClassField.rootPicard.tensor`: Tensor two objects and their root identifications; dual gives inverse up to coherent isomorphism.

- `TauCeti.RamifiedClassField.rootPicard.forget`: Forget K_R,ι to the ordinary Picard stack.


Imported checks:

- `TauCeti.RamifiedClassField.rootPicard.test_empty_R`: At R=∅ this is the ordinary graded Picard stack.

- `TauCeti.RamifiedClassField.rootPicard.test_degree_minus_one`: Negative-degree components contain line bundles and are not declared empty.

- `TauCeti.RamifiedClassField.rootPicard.test_stabilizer`: Over an algebraically closed field with r geometric branch points, forgetting roots has relative stabilizer μ₂^r.


### Square-action presentation of the root Picard stack

`FunctionFieldArithmeticPartII:GC.0/square-action-quotient`

Let Pic_{X,R} classify (L,γ:L|_R≅O_R). Then Pic_X^√R≃[Pic_{X,R}/[2]Res_{R/k}G_m], where the acting group changes the rigidification through its square. The forgetful morphism to Pic_X is a Res_{R/k}μ₂-gerbe.


### The root Picard stack with a root section

`FunctionFieldArithmeticPartII:GC.0/root-picard-section`

Pic_X^{√R;√R}(S) additionally carries α_R∈Γ(R×S,K_R). It does not carry a global section of L. The zero root section is allowed.

Imported API:

- `TauCeti.RamifiedClassField.rootPicardSection.object`: Adjoin α_R to a root-Picard object, including α_R=0.

- `TauCeti.RamifiedClassField.rootPicardSection.forget`: Forget α_R to Pic_X^√R.

- `TauCeti.RamifiedClassField.rootPicardSection.squareEvaluation`: The squared section ι(α_R²) lies in L|_R.


Imported checks:

- `TauCeti.RamifiedClassField.rootPicardSection.test_zero`: Every root-Picard object admits the zero root section.

- `TauCeti.RamifiedClassField.rootPicardSection.test_empty_R`: At R=∅ the forgetful map is an equivalence.

- `TauCeti.RamifiedClassField.rootPicardSection.test_weights`: In the rigidified quotient α_R has weight one while the rigidification has weight two.


The parent planets are **Root Picard stack**, **Square-action Picard quotient**
and **Root Picard sections**. This part adds no planet, so the combined GC.0
layer has three. The refinements have their own stable IDs below.

## The native fibre and its arrows

For any actual scheme arrow j:Z→Y, the light native data type has fields

\[
 L\in\operatorname{InvertibleSheaf}(Y),\qquad
 K\in\operatorname{InvertibleSheaf}(Z),\qquad
 \iota:(K\otimes K).\mathrm{obj}\xrightarrow{\sim}
       (\operatorname{Modules.pullback}j)(L.\mathrm{obj}).
\]

GC.0 specializes j to i_S. An arrow to (L′,K′,ι′) consists of two
isomorphisms f:L≅L′ and v:K≅K′ subject to

\[
 \iota'\circ(v\otimes v)=i_S^*f\circ\iota.
\]

Every term lives in the native category of modules on R_S. Tensor congruence
on its left and right factors is already present at the pins. Identity,
composition and inverse of these compatible pairs give the root groupoid. This
retains the scalar automorphisms that the coarse Picard group forgets. A
restriction isomorphism has no section field, so it does not impose the
line-with-section root equation from RS.0.

For h:S′→S, with h_X and h_R the product maps, form h_X*L and h_R*K. The
new square is the composite

\[
 (h_R^*K)^2\xrightarrow{\sim}h_R^*(K^2)
 \xrightarrow{h_R^*\iota}h_R^*i_S^*L
 \xrightarrow{\sim}i_{S'}^*h_X^*L.
\]

The last isomorphism uses the commuting square and native pullback composition.
The first uses the imported strong monoidal pullback. Tensor and pullback
comparisons must be coherent: equality of objectwise isomorphism classes cannot
supply a pseudofunctor. Effective invertible-sheaf and morphism descent descend
the entire triple and the arrow equation, giving the stack.

## Tensor, dual and degree conventions

For two root triples A=(L,K,ι) and B=(M,N,κ), tensor the lines separately. To
identify (K⊗N)² with (L⊗M)|R, first move its middle N and K past one another,
then use ι⊗κ, and finally the inverse of the strong monoidal restriction
comparison. This uses the ordinary unsigned symmetry of line bundles. The
integer degree is an external grading; it does not turn this into the signed
Picard groupoid of graded determinant lines.

For the inverse root use (L∨,K∨). Dualizing ι gives a map in the opposite
direction, so the required square comparison uses **the inverse of ι∨** after
identifying the tensor square of K∨ with (K²)∨. Native evaluation gives
A⊗A∨≅1. The associativity, unit, symmetry and duality diagrams can be checked
on their two underlying line isomorphisms, because these determine a root
arrow. This imports the coherent module structure instead of constructing it
a second time.

The degree of A is the ordinary degree of L on every geometric fibre, not half
that degree. The stack in degree d is the 2-pullback of the ordinary degree-d
Picard stack. Arbitrary families have a locally constant integer degree;
separate components of S may have different integers. Tensor adds degree and
dual negates it. All d∈Z occur geometrically. A rational point is useful for
an example over an algebraic closure, not an assumption in the definition.
The Picard sheaf's Pic^d is a torsor; neither a trivialization of that torsor nor
a universal line bundle is inferred from its notation.

## Square-action orientation and descent

Import the native rigidified-line interface. Its objects are (L,γ) with
γ:L|R≅O_R, and its arrows satisfy γ′∘f|R=γ. Put

\[
 T(S)=\Gamma(R_S,O)^\times,\qquad V(S)=\Gamma(R_S,O).
\]

The generic supplier identifies these with the finite-étale restrictions of
scalars Res_R/k G_m and Res_R/k A¹. After an étale splitting of R they are
G_m^ρ and A^ρ. A degree-two closed point has T(k)=κ(x)×, not a product indexed
by k-rational points.

Fix γ in the direction L|R→O. The root atlas sends it to
(L,O,γ⁻¹), with the unit-square isomorphism inserted. For a root frame
e:O≅K of an intrinsic triple, its extracted rigidification is
γ=(ι∘e²)⁻¹. Replacing e by e′=e u⁻¹ gives

\[
 \gamma'=u^2\gamma.
\]

Consequently the square-action comparison from the old atlas object to the
new one is (f,v)=(1,u), since

\[
 (u^2\gamma)^{-1}u^2=\gamma^{-1}.
\]

The current native rigidified-line rescaling already composes γ with
multiplication by a unit. GC.0 uses that existing action through the square map;
it does not plan general rigidification or rescaling anew.

Frames of K form a T-torsor over S, and need not have an S-point. They do have
fppf-local frames, and each frame produces a rigidified line. The frame
transition units satisfy their cocycle and give the full quotient object. In
the reverse direction an equivariant rigidified line on a T-torsor descends to
a root triple. The local frame identifications give the unit and counit, with
the triangle identities checked on the cover and descended. Thus the comparison
is an equivalence on all arrows as well as on objects:

\[
 [\operatorname{Pic}_{X,R}/T]\simeq\operatorname{RootPic}_{X,R},
 \qquad (L,\gamma)\cdot u=(L,u^2\gamma).
\]

The quotient is a stack quotient, including torsors and their descent arrows.
A pointwise orbit set would miss nontrivial root lines and their inertia.
For R≠∅, rigidifying kills ordinary scalar automorphisms, since R_S→S is
faithfully flat and the curve has only base functions universally. This gives
the algebraic-space rigidified Picard supplier to which quotient algebraicity
applies. For R=∅ the rigidified object is the ordinary Picard **stack**, and the
acting group is trivial. That case retains G_m inertia and is handled directly.

## The relative gerbe

Over a fixed L, the 2-fibre consists of K with K²≅L|R, including a specified
identification of the forgotten line with L. Its automorphisms therefore act
over the identity of L. They are exactly u with u²=1, giving the band

\[
 H=\operatorname{Res}_{R/k}\mu_2.
\]

A finite étale cover splits R; then local frames of L|R give roots. Kummer
lifting gives local comparison arrows between roots. These prove the gerbe
conditions. A chosen root identifies this fibre with BH_S; the choice is part
of the neutrality statement. No canonical global splitting is required.
Even over F₅, square identifications 1 and 2 of a fixed trivial root line are
not isomorphic over a fixed identity on L until a square root is adjoined.
The gerbe assertion is local and does not assert surjectivity of square maps
on k-points. At R=∅ the band is trivial and forgetting roots is an equivalence.

## Sections on R and their weight-one chart

The second fibre adds α∈Γ(R_S,K) and requires v(α)=α′ on arrows. It adds no
global section of L. The square evaluation ι(α⊗α) is a section of L|R;
there is no extension-to-X operation in this API. On P¹ with R a rational point,
L=O(−1) admits root data and a nonzero α on R although L has no nonzero global
section. Definition A.2 on p. 515 belongs to GC.1: it separately adds a global
section a and imposes ι(α²)=a|R. Forgetting a, and forgetting α, are distinct
maps in A.1.5, p. 517.

If α=e(a), changing the root frame to e u⁻¹ changes a to u a. Combining this
with γ′=u²γ gives

\[
 \operatorname{RootPicSection}_{X,R}
 \simeq[(\operatorname{Pic}_{X,R}\times V)/T],\qquad
 (\gamma,a)\cdot u=(u^2\gamma,u a).
\]

The value γ⁻¹a² in the framed L_R is unchanged, because its two factors have
opposite total weight. For γ=a=1 and u=2 over F₅, the new pair is (4,2), and
its squared evaluation is still 1. Weight two on a, weight one on γ, or the
opposite convention for only one factor would fail this calculation.

The fibre of the forgetful map over a **fixed root object** is its actual
section sheaf, without a further quotient by its automorphisms. Splitting R
and framing K makes it A^ρ over the base. The linear transition maps descend
to an affine morphism with a closed zero section. The zero-section functor
exists for every degree. Tensor of sections makes a commutative monoid stack.
For R_S≠∅ the zero section has no tensor inverse. If S is empty, R_S is
empty even when R is not, and the unique section is a frame. A section is
tensor-invertible exactly when it is a frame everywhere on R_S; duality of a general section
cannot supply an inverse.

Nonreduced sections are retained. Over F₅[ε]/(ε²), the section ε of the trivial
root line is nonzero and has square zero. This lies on an actual k-scheme base,
and the native type accepts it. Neither square evaluation nor section descent
replaces it by its reduction.

## Inertia equations on every test scheme

The universal equality of functions Γ(X_S,O)=Γ(S,O) identifies full
line-bundle automorphisms with c∈Γ(S,O)×. Root-line automorphisms are
u∈Γ(R_S,O)×. The defining arrow equation gives

\[
 u^2=c|_{R_S};\qquad\text{with section: }u\alpha=\alpha.
\]

These equations hold as group sheaves on all S′→S. For relative inertia over
an identity on L set c=1. At geometric split points they become u_j²=c and
u_j a_j=a_j. A nonzero a_j over a field forces u_j=1 and hence c=1. At zero
coordinates the relative μ₂ remains. On arbitrary rings retain the equations;
a nonzero section need not be cancellable.

For one branch point the full root inertia is G_m via u↦(u²,u), whereas its
relative inertia is μ₂. For two branch points and α=(1,0), the full section
inertia is μ₂ on the second coordinate. If there is at least one branch point
and all coordinates are nonzero it is trivial. For the zero section all full root automorphisms remain. For no branch
points the full inertia is still G_m and the relative inertia is trivial.
The phrase “μ₂^ρ stabilizer” in the parent applies to forgetting roots over a
fixed ordinary line, not to full inertia.

## Target inventory, API and checks

In the following inventory each ID refines the imported parent contract.
Names have prefix `TauCeti.RamifiedClassField.GC0`. The common hypotheses and
conventions above apply to every target. APIs describe the genuine stack and
native sheaf interfaces; an absence from the compact suggested file is recorded
in its exhaustive omission ledger, rather than replaced by an arbitrary type.


### 1. Native root Picard fibres and descent

`FunctionFieldArithmeticPartII:GC.0/native-root-fibres` — definition.

For i_S:R_S→X_S a root object is (L,K,ι), with L∈InvertibleSheaf(X_S), K∈InvertibleSheaf(R_S), and ι:(K⊗K).obj≅(Modules.pullback i_S).obj L.obj. An arrow to (L′,K′,ι′) is a pair of native isomorphisms (f:L≅L′,v:K≅K′) satisfying ι′∘(v⊗v)=i_S* f∘ι in R_S.Modules. Componentwise identities, composition and inverse make these a groupoid. Along S′→S pull back both lines and transport ι using the canonical tensor and pullback-composition comparisons. This defines the actual scheme-site stack refining the imported parent root-picard; its projection to the ordinary Picard stack forgets K and ι. No section of either line is part of this definition.

Uses that determine the interface:

- Yun–Zhang, Definition A.1 and A.1.1, pp. 514–515: The moduli groupoid and its actual arrows are needed for the square quotient and relative gerbe.

- FunctionFieldArithmeticPartII:GC.0/root-picard and FunctionFieldArithmeticPartII:GC.1/root-symmetric-space: These fibres underlie both the degree grading and the target obtained by forgetting a global effective section.


API:

- `TauCeti.RamifiedClassField.GC0.nativeFibres` (constructor): The groupoid of the displayed native triples and compatible pairs of isomorphisms over S; objects are the specialization RootPicardData i_S.

- `TauCeti.RamifiedClassField.GC0.nativeIso` (characterisation): Hom between two triples is exactly RootPicardData.Iso with the displayed square. Two arrows are equal if and only if their L- and K-isomorphisms agree; identity, composition and inverse project to the corresponding operations on both components.

- `TauCeti.RamifiedClassField.GC0.pullback` (functoriality): For h:S′→S, send (L,K,ι) to (h_X*L,h_R*K,h_R*ι transported through tensor/restriction comparisons), and arrows to their pulled pairs. The pullback-identity and pullback-composition isomorphisms project to the native ones on both lines and satisfy the pseudofunctor triangle and associativity laws.

- `TauCeti.RamifiedClassField.GC0.baseChange` (compatibility): For k′/k, the root stack for (X_k′,R_k′) identifies with restriction to k′-schemes, compatibly with forget and pullback.

- `TauCeti.RamifiedClassField.GC0.descent` (equivalence): The restriction functor to each fppf descent groupoid is an equivalence, on objects and all arrows.

- `TauCeti.RamifiedClassField.GC0.forget` (projection): Forget K and ι to the imported ordinary line-bundle stack; on arrows retain f, without quotienting its scalars.


Discriminating checks:

- `TauCeti.RamifiedClassField.GC0.check_native_empty`: If R is empty, the unique invertible sheaf and unique comparison on R_S give an equivalence with the ordinary Picard groupoid of X_S.

- `TauCeti.RamifiedClassField.GC0.check_native_negative`: For X=P¹_k, R a rational point and L=O(−1), choose a frame of L|R and K=O_R. The resulting root object has degree −1; no square root of L on all of X is required.

- `TauCeti.RamifiedClassField.GC0.check_native_nonsquare_arrow`: Over k=F₅, X=P¹ and R one rational point, fix L=O and ι=1. The pair f=1, v=2 is not a root arrow because 2²=4≠1; f=4, v=2 is a full root automorphism.

- `TauCeti.RamifiedClassField.GC0.check_native_nontrivial_root`: Let S be an elliptic curve over an algebraically closed field of characteristic ≠2 with a nontrivial order-two invertible sheaf M and chosen M²≅O. For X=P¹ and rational R, L=O_XS and K=M give a root object without a global root-line frame.


Construction or proof route:

1. Use native invertible sheaves for each object field and native module isomorphisms for ι. The arrow equation is a fixed typed equality of module morphisms. Use tensor congruence to compose and invert it; no isomorphism-class quotient is taken.

2. Import the coherent symmetric monoidal pullback on the native Picard core from SF.3/picard-groupoid, including its AlgebraicVectorBundles L0A/L0B dependencies. For the Cartesian base-change square, compare restriction-after-pullback and pullback-after-restriction using Modules.pullbackComp and equality of the composites.

3. Descend L and K by the imported effective invertible-sheaf descent. Descend ι and its invertibility by the sheaf condition for module morphisms. Descend compatible pairs of arrows by the same condition; all cocycles are retained.


Acceptance:

- The forgetful functor has the full native ordinary Picard fibre as its codomain.

- Native data and native arrow structures in the suggested file elaborate without admitted data. The groupoid and pseudofunctor instances are geometric README targets.


Direct prerequisites: `FunctionFieldArithmeticPartII:GC.0/root-picard`, `SchemeAndStackFoundations:SF.3/picard-groupoid`, `SchemeAndStackFoundations:SF.1/stack-in-groupoids`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrLeft`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductCongrRight`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullbackId`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullbackComp`, `mathlib:CategoryTheory.Core`.


Sources: YZ19, Definition A.1, printed p. 514; A.1.1, p. 515 — The two lines and square identification define the root Picard groupoid. The native arrow square and descent formulation make its functor-of-groupoids statement precise. The cited application is over a finite field; the displayed native and descent arguments justify the stated general-field, finite-étale extension; StacksPic, Section 95.16, Lemma 95.16.1, tag 0372; online edition, no fixed page — Effective descent of line bundles and their isomorphisms supplies the ordinary Picard stack; it is imported and applied to both factors.


### 2. Coherent tensor product and dual of root data

`FunctionFieldArithmeticPartII:GC.0/root-tensor-coherence` — theorem.

The native root stack is a symmetric monoidal stack of Picard groupoids. Tensor sends (L,K,ι),(M,N,κ) to (L⊗M,K⊗N, (K⊗N)²≅K²⊗N²→L|R⊗M|R≅(L⊗M)|R); the first comparison reorders the middle factors by the ordinary symmetry. The unit is (O_X,O_R,canonical O_R²≅O_X|R). The dual is (L∨,K∨, (K∨)²≅(K²)∨→(L|R)∨≅L∨|R), where the middle map is (ι∨)⁻¹. Associators, ordinary unsigned symmetry, unitors, evaluation and double dual descend from the native lines, satisfy triangle, pentagon, hexagon and inverse laws, and commute coherently with arbitrary base change and the forgetful functor. The degree grading introduces no Koszul sign.

Milestone: `TauCeti.RamifiedClassField.GC0.tensorDualCoherence`.


Construction or proof route:

1. Import the coherent monoidal, rank-one dual and pullback interface from the native Picard groupoid supplier; do not redevelop sheaf tensor products or duals.

2. Define the displayed tensor square using associators and the middle-factor interchange. Apply duality to ι and invert it to obtain the correctly oriented dual comparison.

3. The ordinary coherence isomorphisms of both line factors satisfy the root-arrow square by naturality. Their underlying equalities prove every required root coherence diagram because an arrow is determined by its two line isomorphisms. Pullback comparisons follow the same argument.


Acceptance:

- For a root object A, A⊗A∨ is canonically isomorphic to the root unit, with its square identification respected.

- On three root objects the underlying L and K associators are the native ones; fourfold products satisfy the pentagon.

- Over an odd field a degree-one object exchanged with itself has ordinary symmetry, not multiplication by −1.


Direct prerequisites: `FunctionFieldArithmeticPartII:GC.0/native-root-fibres`, `SchemeAndStackFoundations:SF.3/picard-groupoid`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductAssoc`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProductComm`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialLeftIso`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorTrivialRightIso`.


Sources: YZ19, Definition A.1, p. 514; A.2.2, pp. 521–522 — The all-degree root Picard objects support tensor translations and inverses. The explicit coherence is the categorical refinement of those operations, using the imported native Picard structure. The cited application is over a finite field; the displayed native and descent arguments justify the stated general-field, finite-étale extension.


### 3. Root degree components in every integer degree

`FunctionFieldArithmeticPartII:GC.0/root-degree-components` — theorem.

Define the fibrewise locally constant integer degree of (L,K,ι) to be deg(L), with no division by two. For every d∈Z, the root degree-d stack is the 2-pullback of ordinary Picard^d along forget. These open-and-closed components decompose the root stack as a coproduct indexed by Z. Tensor maps degrees (d,e) to d+e; dual maps d to −d. The decomposition commutes with arbitrary k-scheme base change. Ordinary Picard^d is imported as a G_m-gerbe over its Picard-sheaf torsor Pic^d under Pic^0. This neither chooses X(k) nor supplies a k-object in every component. Over an algebraic closure every integer component has objects.

Milestone: `TauCeti.RamifiedClassField.GC0.degreeComponents`.


Construction or proof route:

1. Import the ordinary family degree and its open-and-closed components from SF.3/picard-stack-curve, and pull those components back along forget. Families with several degrees on disconnected bases correspond to the coproduct, not to a single fixed-degree fibre.

2. Compute tensor and dual degree on L via the imported ordinary degree formulas. Restriction to the zero-dimensional R imposes no parity condition on this degree.

3. Over an algebraic closure choose a point of X to exhibit O(d x); its restriction to finite reduced R has a square root. This is a test proof of geometric nonemptiness, not a point included in the definition over k. Keep Pic^d as the supplier torsor.


Acceptance:

- The object O(−1) in the native negative-degree test lies in component −1.

- After base extension, the degree-d component is the pullback of the original degree-d component.

- No equivalence Pic^d≃Pic^0 is asserted without a chosen degree-d class; no universal line is inferred from a rational point of the Picard sheaf.


Direct prerequisites: `FunctionFieldArithmeticPartII:GC.0/native-root-fibres`, `FunctionFieldArithmeticPartII:GC.0/root-tensor-coherence`, `SchemeAndStackFoundations:SF.3/picard-stack-curve`, `SchemeAndStackFoundations:SF.3/picard-scheme-without-point`, `SchemeAndStackFoundations:SF.1/two-fibre-product`.


Sources: YZ19, Definition A.1, p. 514; A.2.2, pp. 521–522 — The definition ranges over all integers, and tensor translation by signed away divisors uses those components. The ordinary torsor and family-degree results are imports from SF.3. The cited application is over a finite field; the displayed native and descent arguments justify the stated general-field, finite-étale extension.


### 4. Root frames and the square action

`FunctionFieldArithmeticPartII:GC.0/root-frame-action` — construction.

Import Pic_{X,R}, the groupoid of (L,γ:i_S*L≅O_RS), with arrows f satisfying γ′∘i_S*f=γ. Put T=Res_R/k G_m. For u∈T(S), set (L,γ)·u=(L,u²γ). The map to root triples sends (L,γ) to (L,O_RS,γ⁻¹), using the canonical O_RS²≅O_RS. For an intrinsic root triple, its root frames e:O_RS≅K form a T-torsor. Extract γ=(ι∘e²)⁻¹. Changing frame by e′=e∘mul(u⁻¹) changes γ to u²γ; this fixes the sign convention. This construction is natural in S, retains arrows on L, and identifies the atlas map Pic_{X,R}→RootPic with a T-torsor after every scheme base change. Rigidified line bundles themselves are imported, including the current native RigidifiedLineBundle carrier, not defined again here.

Uses that determine the interface:

- Yun–Zhang A.1.1–A.1.2, p. 515: The frame atlas gives both the square quotient and the weight-one section chart.

- FunctionFieldArithmeticPartII:GC.0/square-action-quotient: Its quotient equivalence requires torsor descent rather than an orbit set on S-points.


API:

- `TauCeti.RamifiedClassField.GC0.frameAtlas` (constructor): Send (L,γ) to (L,O,γ⁻¹), with the canonical unit-square comparison inserted.

- `TauCeti.RamifiedClassField.GC0.rescale` (structure): The right action is (L,γ)·u=(L,u²γ), acts identically on underlying f, and satisfies action identity/composition.

- `TauCeti.RamifiedClassField.GC0.frameChange` (characterisation): Frames differing by u⁻¹ give γ′=u²γ and the root arrow (1,u) between the resulting atlas objects.

- `TauCeti.RamifiedClassField.GC0.frameBaseChange` (functoriality): Root frames, their T-action and the atlas square commute with arbitrary S′→S, including nonflat maps.

- `TauCeti.RamifiedClassField.GC0.frameTorsor` (equivalence): The 2-fibre of frameAtlas over A is the T-torsor of frames of its actual K; no global frame is chosen.


Discriminating checks:

- `TauCeti.RamifiedClassField.GC0.check_frame_empty`: For R=∅, T is the trivial group scheme, Pic_{X,R} is the ordinary Picard stack and the atlas is its identity up to equivalence.

- `TauCeti.RamifiedClassField.GC0.check_frame_weights`: Over F₅ with a fixed frame of L_R, u=2 changes γ=1 to γ′=4. The comparison on K is multiplication by 2, since 4⁻¹·2²=1; changing γ by 2 instead fails this square.

- `TauCeti.RamifiedClassField.GC0.check_frame_nonsplit`: For R=Spec F_{q²}, T(F_q)=F_{q²}×, not F_q××F_q×. Frames and all formulas use this actual algebra.

- `TauCeti.RamifiedClassField.GC0.check_frame_torsor_descent`: The nontrivial order-two root line M in native_nontrivial_root gives a frame torsor with no S-section, but it has local sections and descends to the original root triple.


Construction or proof route:

1. Use the imported native rigidified-line groupoid along i_S. Finite-étale Weil restriction supplies the frame functor and T, with arbitrary base-change compatibility; this is the precise GC0-WEIL-FRAMES request.

2. Over a frame, apply ι to e² and invert to extract γ. Compare e and e′ to obtain the formula γ′=u²γ, including its identity and product laws.

3. For a map S→RootPic, objects of the 2-fibre product with Pic_{X,R} are rigidified lines together with a specified root isomorphism to the given triple. Sending this datum to its induced frame gives the frame torsor, including its arrows; the inverse uses that frame. Descent supplies frames locally even when K is not globally trivial.


Acceptance:

- The ordinary rigidification-change action without squaring would lose the relative μ₂ stabilizer.

- The inverse square orientation is fixed by γ:L|R→O: (u²γ)⁻¹ u²=γ⁻¹.

- A finite non-split R is treated by restriction of scalars and not by a chosen list of k-points.


Direct prerequisites: `FunctionFieldArithmeticPartII:GC.0/native-root-fibres`, `SchemeAndStackFoundations:SF.3/picard-groupoid`, `SchemeAndStackFoundations:SF.3/picard-stack-curve`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.1/torsor-representability`, `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`.


Sources: YZ19, A.1.1, p. 515 — The rigidified Picard stack and the square of its usual rigidification action present the root Picard stack; the frame calculation makes the chosen direction explicit. The cited application is over a finite field; the displayed native and descent arguments justify the stated general-field, finite-étale extension; StacksRes, Section 97.11, Lemmas 97.11.1–97.11.3 and Proposition 97.11.5, tag 05Y8; online edition, no fixed page — Restriction of scalars is a sheaf, commutes with base change and has the representability and local-lifting properties used for finite-étale root frames.


### 5. Square quotient equivalence on objects and arrows

`FunctionFieldArithmeticPartII:GC.0/square-quotient-comparison` — theorem.

The root-frame atlas induces a base-change-compatible equivalence [Pic_{X,R}/T]≃RootPic_{X,R}, where T acts by γ↦u²γ. The quotient means the stackification of the action groupoid, equivalently T-torsors with equivariant maps to the rigidified Picard stack, with full descent isomorphisms. The equivalence commutes with the map to the ordinary Picard stack and restricts to every d∈Z. On the atlas it is the stated (L,O,γ⁻¹) functor; on a change by u its root isomorphism is (1,u). The inverse uses the torsor of actual root-line frames, with unit and counit recovered by descent of the frame identification. For nonempty R the rigidified Picard stack has trivial inertia and is an algebraic space; SF.3 ordinary Picard algebraicity and SF.1 quotient algebraicity give algebraicity of RootPic. For empty R the statement reduces to the ordinary Picard stack, without treating it as an algebraic space.

Milestone: `TauCeti.RamifiedClassField.GC0.squareQuotient`.


Construction or proof route:

1. The arrow (1,u) satisfies the square by (u²γ)⁻¹u²=γ⁻¹, so the atlas functor is equivariant with the specified comparison and cocycle.

2. Identify its 2-kernel pair with the T-action groupoid using the frame torsor. Apply the imported quotient stackification universal property to obtain the comparison.

3. An intrinsic root triple supplies its frame torsor and equivariant rigidification. The local frame identifications descend to the counit; reconstructing the same frame torsor gives the unit. Check both triangle identities on the covering torsor, then descend. This proves full faithfulness as well as local essential surjectivity.

4. For algebraicity, the frame morphism over the ordinary algebraic Picard stack is representable by finite-étale restriction of line-frame spaces. If R≠∅, an automorphism of L trivial on R is the identity because Γ(X_S,O)=Γ(S,O) universally and R_S→S is faithfully flat. Thus Pic_{X,R} is an algebraic space. Apply the imported smooth-T quotient theorem; handle R=∅ separately.


Acceptance:

- The equivalence identifies full arrow groupoids, not just isomorphism classes.

- The nontrivial root-line example is in its essential image through a nontrivial frame torsor.

- Its composite with forget is the usual quotient induced by square T→T, not a map discarding ordinary scalar arrows.


Direct prerequisites: `FunctionFieldArithmeticPartII:GC.0/root-frame-action`, `FunctionFieldArithmeticPartII:GC.0/root-degree-components`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.3/picard-stack-curve`, `SchemeAndStackFoundations:SF.1/quotient-stack-algebraic`, `SchemeAndStackFoundations:SF.1/setoid-criterion`.


Sources: YZ19, A.1.1, p. 515 — The square-action quotient statement is implemented through the intrinsic root frames; its descent and full-arrow form are the needed refinement. The cited application is over a finite field; the displayed native and descent arguments justify the stated general-field, finite-étale extension.


### 6. The forgetful root gerbe and its band

`FunctionFieldArithmeticPartII:GC.0/relative-root-gerbe` — theorem.

The forgetful morphism RootPic_{X,R}→Pic_X is a gerbe banded by H=Res_R/k μ₂, compatibly with arbitrary scheme base change and degree components. For a fixed L on X_S, the 2-fibre is the groupoid of (K,ι:K²≅L_R); its arrows act over the identity of L. For every such object, relative automorphisms are exactly units u on R_S with u²=1. Root objects exist fppf-locally, and any two are locally isomorphic. A chosen root trivializes this gerbe as BH_S; no canonical global root or product splitting is asserted. H is finite étale of rank 2^ρ for ρ=rank(R/k). Over an algebraic closure with r branch points the relative inertia is μ₂^r. The entire root stack has the ordinary scalar automorphisms in addition, as the full-stabilizer theorem specifies.

Milestone: `TauCeti.RamifiedClassField.GC0.relativeGerbe`.


Construction or proof route:

1. In the 2-fibre over L include a specified identification of the underlying line with L, so the root-arrow equation is over the identity, not an unrestricted scalar on L.

2. Finite-étale-locally split R_S and trivialize L_R; trivial lines then give a local root. Isomorphisms between two roots are locally frames with a prescribed square, and the n=2 Kummer epimorphism supplies them.

3. The same arrow square identifies every relative automorphism with a unit on R_S whose square is one. Finite-étale restriction of scalars gives H and all base-change comparisons. Composition is unit multiplication, which is commutative, so it supplies the canonical band.

4. Choose one root only to describe the equivalence with H-torsors: send another root to the sheaf of root isomorphisms from the chosen one, and descend the inverse twist. This is a conditional neutrality statement.


Acceptance:

- At R=∅ the band is trivial and forget is an equivalence.

- Over F₅, with R a rational point and L=O fixed, root identifications 1 and 2 are not isomorphic over that fixed L: 2 is not a square. They become isomorphic after a quadratic extension; being a gerbe is a local assertion.

- For nonempty R, μ₂ relative inertia prevents the forgetful morphism from being representable by algebraic spaces.


Direct prerequisites: `FunctionFieldArithmeticPartII:GC.0/native-root-fibres`, `FunctionFieldArithmeticPartII:GC.0/square-quotient-comparison`, `SchemeAndStackFoundations:SF.2/fppf-kummer-sequence`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.1/torsor-representability`.


Sources: YZ19, A.1.1, p. 515 — The forgetful map is the restriction-of-scalars μ₂-gerbe. The fixed-underlying-line qualification isolates the stated band. The cited application is over a finite field; the displayed native and descent arguments justify the stated general-field, finite-étale extension; StacksKummer, Section 59.28, Lemma 59.28.1, tag 03PL, and Lemma 59.28.3, tag 040N; online edition, no fixed page — Lemma 59.28.3 supplies positive n=2 fppf Kummer lifting; the separate Lemma 59.28.1 supplies étale lifting because 2 is invertible. These give the local comparison arrows after finite-étale splitting of R.


### 7. Native root data with a section only on R

`FunctionFieldArithmeticPartII:GC.0/native-root-section-fibres` — definition.

The root-section fibre has objects (A,α) where A=(L,K,ι) is a native root object and α∈Γ(R_S,K); arrows are root arrows (f,v) with v(α)=α′. There is no section a of L on X_S and no equation against a|R. This is the native RootPicardSectionData i_S and its displayed Iso type, organized into an fppf stack using the native section pullback and descent. Forgetting α is a morphism to RootPic and has the zero-section right inverse. The squared evaluation is ι(α⊗α)∈Γ(R_S,L_R), using the imported native tensorSection operation; it need not extend to X_S. Tensor sends (A,α),(B,β) to (A⊗B,α⊗β), making a commutative monoid stack with unit section 1. The zero-section object is not tensor-invertible when R_S≠∅. On the empty R_S even its zero section is a frame. The tensor-invertible objects are exactly those with α a frame of K.

Uses that determine the interface:

- Yun–Zhang A.1.2, p. 515: The section quotient has root-section weight one and rigidification weight two.

- Yun–Zhang A.1.5, p. 517; FunctionFieldArithmeticPartII:GC.1/root-symmetric-space: Forget the global effective section a while retaining α_R, then forget α_R. These are distinct maps.


API:

- `TauCeti.RamifiedClassField.GC0.nativeSectionFibres` (constructor): The groupoid of native RootPicardSectionData i_S, including any α in the actual section module.

- `TauCeti.RamifiedClassField.GC0.sectionIso` (characterisation): An isomorphism consists of RootPicardData.Iso and v(α)=α′, exactly as in RootPicardSectionData.Iso. Two section arrows are equal if and only if their underlying root arrows agree; identities and composition project to those of the root groupoid.

- `TauCeti.RamifiedClassField.GC0.forgetSection` (projection): Forget only α; on arrows keep the full root isomorphism.

- `TauCeti.RamifiedClassField.GC0.RootPicardSectionData.zero` (constructor): Send A to (A,0); its root is A and its root section is zero, as in zero_forget and zero_section.

- `TauCeti.RamifiedClassField.GC0.sectionPullback` (functoriality): Pull back α along R_S′→R_S with the native section pullback, respecting identity, composition and arbitrary base change.

- `TauCeti.RamifiedClassField.GC0.squareEvaluation` (projection): Evaluate ι on the tensor square of α to obtain a section of i_S*L, naturally under root-section isomorphisms and pullback.

- `TauCeti.RamifiedClassField.GC0.sectionTensor` (structure): Tensor root triples and their root sections, with the ordinary symmetric monoid coherence and section 1 as unit; inverses exist precisely on the frame locus.


Discriminating checks:

- `TauCeti.RamifiedClassField.GC0.check_section_negative`: For X=P¹, R a rational point and L=O(−1), choose K=k and ι and take α=1. This is a root-section object although H⁰(P¹,O(−1))=0, so it cannot encode an effective global section.

- `TauCeti.RamifiedClassField.GC0.check_section_zero`: Every root object admits α=0, even in negative degree; when R_S is nonempty this object is not tensor-invertible. This requires the ramification scheme after base change, not just R, to be nonempty.

- `TauCeti.RamifiedClassField.GC0.check_section_nilpotent`: Over k=F₅ and S=Spec k[ε]/(ε²), take X=P¹_k, R a rational point, K=O_RS and α=ε. Then α≠0 and α²=0. The definition accepts this section and does not replace its module by reduced points.

- `TauCeti.RamifiedClassField.GC0.check_section_empty`: For R=∅, the unique section on the empty scheme makes forgetSection an equivalence with RootPic≃Pic_X.

- `TauCeti.RamifiedClassField.GC0.check_section_empty_base`: For S=∅ and any R, both X_S and R_S are empty. The root-section fibre is the terminal groupoid and its zero section is a frame and tensor-invertible, even if R itself is nonempty.


Construction or proof route:

1. Use the actual module global-section type on R_S. The arrow condition is equality after the native sheaf isomorphism evaluated on the top open.

2. Pull back α with the native section unit map, then use the same line comparisons as for root pullback. Effective section descent follows from descent of module morphisms O→K and of the root data.

3. The zero section needs no existence theorem for global sections of L. For tensor, use imported tensorSection and the root tensor comparison. Tensor coherence follows by the imported section compatibility. An inverse section exists precisely when α generates the rank-one module at every point of R_S; use its inverse frame, not the dual of an arbitrary section.


Acceptance:

- The forgetful map and zero section preserve the underlying root triple.

- Square evaluation lands only in sections on R_S; no extension map to sections on X_S is fabricated.

- Its monoidal structure is distinguished from the Picard structure of the stack obtained by forgetting α.


Direct prerequisites: `FunctionFieldArithmeticPartII:GC.0/root-picard-section`, `FunctionFieldArithmeticPartII:GC.0/native-root-fibres`, `FunctionFieldArithmeticPartII:GC.0/root-tensor-coherence`, `SchemeAndStackFoundations:SF.3/picard-groupoid`, `SchemeAndStackFoundations:SF.1/stack-in-groupoids`, `FunctionFieldArithmeticPartII:RS.0/section-power`.


Sources: YZ19, A.1.2 and Definition A.2, p. 515; A.1.5, p. 517 — The variant adds a root section only. The effective symmetric-space definition adds a different global section and a compatibility equation; its forgetful maps explain the two separate interfaces. The cited application is over a finite field; the displayed native and descent arguments justify the stated general-field, finite-étale extension.


### 8. The section quotient and affine root-section charts

`FunctionFieldArithmeticPartII:GC.0/section-quotient-comparison` — theorem.

Let V=Res_R/k A¹, with T-action a↦u a. Then RootPicSection≃[(Pic_{X,R}×V)/T] for the diagonal right action (γ,a)·u=(u²γ,u a). On the atlas this sends (L,γ,a) to (L,O,γ⁻¹,a); forgetting a is the square quotient comparison, and a=0 is the zero section. In frames the squared evaluation has coordinate γ⁻¹ a² in L_R, unchanged by (γ,a)↦(u²γ,u a). The forgetful map RootPicSection→RootPic is representable and affine, fppf-locally the projection A^ρ→S obtained by trivializing the actual K on the finite-étale R_S. Its zero section is a closed immersion. The comparison and all these maps commute with arbitrary base change and every integer degree.

Milestone: `TauCeti.RamifiedClassField.GC0.sectionQuotient`.


Construction or proof route:

1. In a root frame e write α=e(a). With e′=e u⁻¹, its coordinate is a′=u a while γ′=u²γ. These formulas supply an equivariant atlas functor with the same root comparison (1,u).

2. Apply the same frame-torsor descent inverse as in square-quotient-comparison, now retaining the equivariant coordinate a. Unit and counit preserve α because they are induced by its actual frames.

3. For a fixed root object over S, its 2-fibre of sections is the sheaf S′↦Γ(R_S′,K_S′), not a quotient by root automorphisms. Split R and frame K locally to identify it with A^ρ. The transition maps are invertible linear maps, so the affine schemes and zero sections descend by SF.1/affine-fpqc-descent.

4. Use the square/weight-one identity to check squared evaluation and the compatibility of both forgetting maps. Since all formulas are on R_S, they add no global section to L.


Acceptance:

- Over one split branch point and F₅, (γ,a)=(1,1) and u=2 yield (4,2). Both have squared evaluation 1, since 4⁻¹·2²=1.

- At a=0 the relative μ₂ inertia survives; at a frame it is killed. Thus the section variant is not uniformly the same μ₂-gerbe over ordinary Pic_X.

- When R=∅, V is the final scheme and the section quotient is the ordinary Picard stack.


Direct prerequisites: `FunctionFieldArithmeticPartII:GC.0/native-root-section-fibres`, `FunctionFieldArithmeticPartII:GC.0/root-frame-action`, `FunctionFieldArithmeticPartII:GC.0/square-quotient-comparison`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`, `SchemeAndStackFoundations:SF.1`.


Sources: YZ19, A.1.2, p. 515 — The associated quotient uses the square action on the rigidification and the dilation action on the root-section coordinate. Its affine chart is descent of those actual root sections. The cited application is over a finite field; the displayed native and descent arguments justify the stated general-field, finite-étale extension.


### 9. Full and relative inertia, including root sections

`FunctionFieldArithmeticPartII:GC.0/root-stabilizers` — theorem.

For any root object over S, its full automorphism sheaf consists of c∈Γ(S,O_S)× and u∈Γ(R_S,O_RS)× satisfying u²=c|R_S; here c acts on L via the universal identity Γ(X_S,O)=Γ(S,O). Relative to a fixed L and its identity, impose c=1, giving Res μ₂. With root section α, add uα=α. These are equalities of sheaves on every S′→S, including nonreduced S′. After base change to an algebraically closed field with r branch points and compatible frames, full inertia is {(c,u_1,…,u_r):u_j²=c}, and the section inertia additionally has u_j a_j=a_j. Relative section inertia is μ₂ on exactly the zero coordinates and trivial on nonzero coordinates over that field. If any a_j≠0 then c=1 in the full section inertia; if r>0 and every coordinate is nonzero the full section inertia is trivial. For r=0 the full inertia remains G_m, while relative inertia is trivial.

Milestone: `TauCeti.RamifiedClassField.GC0.inertiaEquations`.


Construction or proof route:

1. An automorphism of an invertible sheaf is multiplication by a unique unit. The imported universal global-functions identity for X_S identifies the unit on L with c from S; the root line has unit u on R_S.

2. Translate the root-arrow square to u²=c|R. Translate preservation of α to uα=α. These equations are functorial on all S′, so they compute group sheaves, not only geometric point groups.

3. Set c=1 for relative inertia. In split geometric coordinates, a nonzero field element cancels in u_j a_j=a_j, forcing u_j=1 and c=1 if any such coordinate exists. Do not cancel α over arbitrary rings; retain the equations there.


Acceptance:

- With one split branch point, full root inertia is G_m via u↦(u²,u), whereas relative inertia is μ₂.

- Over F₅ at α=0, u=−1 is a relative automorphism; at α=1 it is not.

- For r=2 and α=(1,0), the full section inertia is μ₂ on the second coordinate. At α=(0,0) it also contains varying c.

- Over F₅[ε]/(ε²) with α=ε, the equations apply without declaring α zero because α²=0: u=−1 does not fix α, since −ε≠ε.

- For r=0, all section-coordinate equations are vacuous and the full inertia is G_m. The coordinate full-triviality milestone explicitly assumes r>0, while the relative frame-stabilizer milestone needs no nonempty-index assumption.


Direct prerequisites: `FunctionFieldArithmeticPartII:GC.0/native-root-fibres`, `FunctionFieldArithmeticPartII:GC.0/native-root-section-fibres`, `FunctionFieldArithmeticPartII:GC.0/relative-root-gerbe`, `FunctionFieldArithmeticPartII:GC.0/section-quotient-comparison`, `SchemeAndStackFoundations:SF.3/picard-stack-curve`.


Sources: YZ19, Definition A.1, p. 514; A.1.1–A.1.2, p. 515 — Taking automorphisms in the defining groupoids gives the full scalar-square equation and its section-preservation equation. The gerbe statement specifies only the relative group. The cited application is over a finite field; the displayed native and descent arguments justify the stated general-field, finite-étale extension.


## Dependency closure and ownership

The nine refinements form an acyclic target-level graph. Native fibres import
the parent definition, native carriers and the ordinary Picard core. Tensor and
degree consume those fibres and their existing suppliers. Root frames consume
finite-étale restriction of scalars and ordinary rigidification; the quotient
consumes frames and ordinary stackification; the gerbe consumes that comparison
and Kummer lifting. Native section fibres consume the root fibre and imported
section tensor operations. Their quotient consumes the same frame torsor. Full
inertia is then calculated in the already specified groupoids. Routine scalar
algebra and descent checks stay in those proof routes, without separate lemma
nodes.

The stack can also be recognized intrinsically as the 2-pullback of the
restriction functor Pic(X_S)→Pic(R_S) and the square functor
Pic(R_S)→Pic(R_S). This uses Picard groupoids and actual comparison
isomorphisms, not their sets of classes. The quotient and the root gerbe
are consequences of this native root data, so no general line-with-section
root stack is required as a new construction here.

The all-degree character and signed-divisor translation theory remains in
GC.5. The effective symmetric spaces and the additional global section remain
in GC.1. Ordinary torsors and Picard representability remain in SF.3 and
JacobianChallenge. The finite-étale restriction-of-scalars and frame functors
remain in SF.1. No roadmap or layer is created or moved by this part.

### Exact supplier requests


**GC0-WEIL-FRAMES** — `SchemeAndStackFoundations:SF.1`. For finite étale R→Spec k of rank ρ, give the actual scheme-site functors T(S)=Γ(R_S,O)× and V(S)=Γ(R_S,O), represent them by Res_R/k G_m and Res_R/k A¹, and identify after an étale splitting with G_m^ρ and A^ρ. Formation must commute with arbitrary S′→S. For each native invertible K on R_S, represent the relative frame functor S′↦Isom(O_R_S′,K_S′) as an affine T_S-torsor, locally inhabited on the fppf (indeed étale) site; compare its arrows with native isomorphisms, and descend its linear section charts. These are generic finite-étale Weil-restriction/frame inputs, not a new GC.0 construction of generic rigidified line bundles.


Consumers: `FunctionFieldArithmeticPartII:GC.0/root-frame-action`, `FunctionFieldArithmeticPartII:GC.0/relative-root-gerbe`, `FunctionFieldArithmeticPartII:GC.0/section-quotient-comparison`.


**GC0-NATIVE-INTEGRATION** — `SchemeAndStackFoundations:SF.3`. Realize the existing SF.3/picard-groupoid and picard-stack-curve contracts on the same native InvertibleSheaf fibres used here, with explicit comparison of the new current-library InvertibleSheaf.pullback, RigidifiedLineBundle and eulerDegree interfaces to the atlas-pin module pullback, tensor/unit and full isomorphism groupoids. Restriction to R_S, pullback in S, native duality and tensorSection must share coherent identity/composition, tensor and unit comparisons. Identify fibrewise integer degree with the ordinary degree-d substack. Keep the ordinary Picard stack, Picard sheaf and rigidified Picard functor distinct, and retain Pic^d torsors without any chosen degree-one point. This asks integration of existing owners (JacobianChallenge A/D; AlgebraicVectorBundles L0A/L0B), not their replanning.


Consumers: `FunctionFieldArithmeticPartII:GC.0/native-root-fibres`, `FunctionFieldArithmeticPartII:GC.0/root-tensor-coherence`, `FunctionFieldArithmeticPartII:GC.0/root-degree-components`, `FunctionFieldArithmeticPartII:GC.0/native-root-section-fibres`.


**GC0-ORDINARY-SITE** — `SchemeAndStackFoundations:SF.1/stack-in-groupoids`. On the actual big scheme fppf site, identify the native invertible-sheaf pseudofunctors and their root-arrow groupoids with the supplier stack carrier. Connect D0/groupoid-quotients-and-two-fibre-products to SF.1/two-fibre-product and quotient-stack on this site, preserving the explicit isomorphism in each two-fibre object and all torsor descent arrows. Provide the ordinary quotient universal property for the rigidified Picard groupoid, including the R=empty stack case; the nonempty-R algebraic-space reduction uses the imported setoid criterion. This is a comparison between existing ordinary stack interfaces, not diamond geometry.


Consumers: `FunctionFieldArithmeticPartII:GC.0/native-root-fibres`, `FunctionFieldArithmeticPartII:GC.0/square-quotient-comparison`, `FunctionFieldArithmeticPartII:GC.0/section-quotient-comparison`.


These refine the GC.0 portions of parent CURVE-GEOM, STACK-GEOM, ORDINARY-STACKS
and JAC-A. The broader parent requests have consumers in other stages and are
not declared resolved by this part.

## Native suggested fragment and omission ledger

The suggested file uses actual native sheaves and modules. Its two object
structures and two arrow structures have concrete fields, and the zero-section
constructor has a real body. It gives the zero-section equations and four
coordinate milestones: inverse-square frame compatibility, square covariance
of a weight-one section, trivial relative inertia at a frame and trivial full
inertia at frame coordinates when their index set is nonempty. Six examples
cover zero sections, retained μ₂ at zero, removal at a nonzero field section,
nonzero nilpotents over dual numbers, weights over F₅ and surviving ordinary
scalars when there are no branch coordinates.
The groupoid, stack and geometric operations are specified above; no
instance for them is claimed by the suggested file.

The fixed 2026-10-12 shape in WORKERS.md permits only light real-bodied
native definitions, readily stated end milestones and a few examples. The
following ledger is exhaustive for the geometric families:

| Family | Omitted signature/API/checks | Required actual interfaces |
| --- | --- | --- |
| Parent `root-picard` | object, degree, tensor, forget; empty-R, negative-degree and relative-stabilizer checks | Native Picard pseudofunctor, family degree and coherent monoidal restriction |
| Parent `square-action-quotient` | Equivalence and forgetful gerbe | Ordinary scheme-stack quotient and torsor interfaces |
| Parent `root-picard-section` | object, forget, squareEvaluation; zero, empty-R and weight checks | Root stack and native tensor-section pullback |
| `native-root-fibres` | nativeFibres, nativeIso, pullback, baseChange, descent, forget; four checks. Only the data and arrow structures are present in Lean. | Integrated pseudofunctor and effective descent; root-arrow groupoid instances |
| `root-tensor-coherence` | tensorDualCoherence, including tensor, unit, dual and coherence | The supplier's coherent rank-one monoidal, dual and pullback structure |
| `root-degree-components` | degreeComponents and the displayed degree/component identities | Family degree and ordinary Picard component morphisms |
| `root-frame-action` | frameAtlas, rescale, frameChange, frameBaseChange, frameTorsor; four checks. Only the scalar inverse-square equality is present in Lean. | Native rigidified groupoid, finite-étale Res and frame torsors |
| `square-quotient-comparison` | squareQuotient, unit/counit and descent | Genuine action groupoid, stackification and 2-fibre comparisons |
| `relative-root-gerbe` | relativeGerbe, its band, local neutrality and checks | Gerbe and sheaf-of-automorphisms interfaces on the actual site |
| `native-root-section-fibres` | nativeSectionFibres, sectionIso, forgetSection, sectionPullback, squareEvaluation, sectionTensor; five geometric checks. Native data/arrows and zero with its two equations are present in Lean. | Groupoid/stack instances, native section pullback/tensor and descent |
| `section-quotient-comparison` | sectionQuotient, affine charts, zero-section immersion and checks. Only square covariance and sample weights are present in Lean. | Root frame torsors, quotient comparison, affine descent |
| `root-stabilizers` | inertiaEquations as an isomorphism of automorphism sheaves, all geometric instances. Only the scalar frame-stabilizer consequences, including their nonempty-index hypothesis, and sample ring checks are present in Lean. | Full stack arrow and relative 2-fibre interfaces |

The missing family is recorded as `GC0-LEAN-GEOMETRY`. It identifies the exact
GC.0 restriction of the inherited native-geometry leaf. There is no mathematical
source gap in the frame/descent proof. There is an interface integration
obligation before the geometric end signatures can elaborate at the pins.
The stage is **planned**, and the planning pass is **complete**. These words
mean every target has an explicit dependency chain ending in the baseline, an
identified supplier node or one of the exact recorded leaves. They do not mean
that the layer is closed or that a theorem has been implemented.

## Baseline and current upstream evidence

The pinned baseline is Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The thirteen cited declarations
were read in their source files and checked against the exact pinned bytes:

| Pinned source | Interface used |
| --- | --- |
| `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean` | Native InvertibleSheaf and trivial line |
| `TauCeti/AlgebraicGeometry/LineBundle/TensorProduct.lean` | tensorProduct, left/right congruence, associator, commutor and both unit isomorphisms |
| `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | Module pullback and its identity/composition comparisons |
| `Mathlib/CategoryTheory/Core.lean` | Groupoid retaining the isomorphisms of a category |

The native data use these existing carriers directly. The baseline tensor
isomorphisms alone do not establish the full coherent monoidal pullback and
rank-one dual interface; that is imported from its owner.

The current read-only TauCetiRoadmap main was also checked, at
`0d144d044dacebca17b654695b6f1ad58f159b27`. JacobianChallenge owns the ordinary
line-bundle/Picard/degree and relative Picard targets. AlgebraicVectorBundles
L0A/L0B owns native tensorSection, strong monoidal pullback, finite locally free
sheaves and duals. Its current Suggested interfaces were inspected with their
README contracts. The nine roadmaps newer than the atlas snapshot were screened
for overlapping root-Picard targets; none supplies the GC.0 root quotient.

Current Tau Ceti main at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already has native invertible-sheaf
pullback, generic rigidified line bundles and rescaling, the set-valued
rigidified Picard functor for a chosen section, and Euler degree. These are
existing code and are imported through the supplier integration contract.
A chosen-section, set-valued rigidified functor does not retain the ordinary
Picard stack's scalar arrows and does not supply the root quotient. None of
these current declarations is falsely claimed as present at the older pins.

The reviewed library audit has no FunctionFieldArithmeticPartII entry. The
reviewed AUDIT-20 entries for FunctionFieldArithmetic FA.0–FA.1 show that
arithmetic divisors, weighted degree and function-field Riemann–Roch are
existing material. Those are not a replacement for family Picard geometry and
are not replanned here.

## Sources and reading boundary

- **Yun–Zhang 2019**, Annals of Mathematics 189, 393–526, author-hosted published
  PDF linked above, read 2026-10-18. Definition A.1, p. 514; A.1.1–A.1.2 and
  Definition A.2, p. 515; A.1.3–A.1.5, pp. 515–517; A.2.2, pp. 521–522; and
  A.3.1, pp. 523–524, were read for the targets and their consumers. SHA-256:
  `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`.
- **The Stacks Project**, [Section 95.16, Lemma 95.16.1, tag 0372](https://stacks.math.columbia.edu/tag/0372):
  ordinary line-bundle stack and effective descent.
- **The Stacks Project**, [Section 97.11, Lemmas 97.11.1–97.11.3 and Proposition 97.11.5, tag 05Y8](https://stacks.math.columbia.edu/tag/05Y8):
  restriction of scalars, base change and local lifting/representability.
- **The Stacks Project**, [Section 59.28](https://stacks.math.columbia.edu/tag/03PK),
  Lemma 59.28.1 (tag 03PL) and Lemma 59.28.3 (tag 040N): étale lifting when 2
  is invertible, and fppf Kummer exactness, both used at exponent two. These online
  sections were read on 2026-10-18 and have no fixed pagination.

No private book was needed and no source file is included. No new source error
was found in the GC.0 statements. The parent's E2 correction concerns the
nonreduced effective fibre in GC.1; this part keeps all nilpotent root sections
and does not restate that incorrect fibre description. This review independently
confirmed E2 in the published A.1.3, pp. 515–516, against its square-map
diagram (A.1), p. 516: the full zero factor is
[Spec K[t]/(t²)/μ₂], whose reduced substack is Bμ₂. The packet records the
published version read and the review verdict; no new source error is claimed.

## Independent review

Accepted by `REV-FunctionFieldArithmeticPartII--GC.0` on 2026-10-18 after
checking all nine targets and thirteen baseline declarations. The corrections
and each node verdict are recorded in the companion packet and
[review report](../reviews/REV-FunctionFieldArithmeticPartII--GC.0.md).
The three supplier integration requests and `GC0-LEAN-GEOMETRY` remain explicit;
acceptance certifies this planning pass, with coverage planned rather than closed.
