# NC.3 — Continuous nonabelian cohomology and Selmer varieties

This layer supplies the cohomological domain of the nonabelian Chabauty period map. We write \(U_n\) for NC.2’s \(U\langle n\rangle=U/\Gamma_{n+1}U\): \(U_0=1\), and \(U_1\) is the abelianized group. Kim’s source index is shifted by one, so his first nontrivial quotient is \(U_2\). Its input is the lower-central tower of geometric unipotent groups from NC.2, equipped with its actual Galois action. Its outputs are continuous torsor classes, their central lifting obstructions, local unramified and crystalline conditions, and the global Selmer functor. Representability turns that functor into an affine variety only after proving the stated cochain, descent and local-condition hypotheses. The resulting dimension bound comes from central fibres and linear Selmer spaces; it is not part of the definition of a Selmer variety.

This is a complete **target-level planning pass**, with NC.3 coverage **planned**, not closed. The four gaps at the end name the remaining proof inputs and signature work. Every declaration is unchecked. NC.4 consumes the local and global Selmer varieties and localization morphisms for the period map. NC.5 consumes the dimension inequalities for arithmetic applications. Neither the period comparison nor an arithmetic finiteness conclusion is established merely by constructing the cohomology functor here.

The accepted parent packet already plans continuous cocycles, gauge classes, coefficient and source functoriality, twisting, nonnormal invariant-coset connecting maps, native kernel actions and orbit fibres, finite-quotient descent, and nonempty topological torsor classification. Those node identifiers remain dependencies of this part. Their hundreds of proof lemmas are not replicated. The new targets strengthen the exact interfaces left open by that packet and supply the geometric representability and Selmer statements. An assembly must import the parent dependencies as well as this part; substituting this file for the entire parent would discard needed mathematics.

## Conventions and existing library interfaces

A topological group (G) acts on a topological group (U) by automorphisms, and the action is jointly continuous. A continuous one-cocycle satisfies

\[
c(gh)=c(g)\,g(c(h)).
\]

The gauge action is ( (u\cdot c)(g)=u\,c(g)\,g(u)^{-1} ). Its orbit set is (H^1(G,U)), pointed by the constant cocycle. It is a pointed set for general (U). A quotient of classes cannot be given an additive group law just because central vector layers are additive. A right (U)-torsor with a compatible left (G)-action gives a cocycle through (gp=p\,c_p(g)); changing (p) to (pu) applies the gauge (u^{-1}). This is the convention of the parent's `torsor-classification` node.

Write vector coefficients additively. The pinned Tau Ceti differential is

\[
d^1a(g,h)=g\cdot a(h)-a(gh)+a(g).
\]

Its explicit (Z^2) consists of continuous two-cochains satisfying

\[
g\cdot f(h,k)-f(gh,k)+f(g,hk)-f(g,h)=0.
\]

Its (B^2) is the image of (d^1) on **continuous** one-cochains. Consequently, an arbitrary primitive in abstract group cohomology does not establish vanishing in this continuous (H^2). The definitions and membership theorems in `TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree` supply exactly these carriers. The packet records the checked declarations and their statement boundaries.

For a topological additive abelian module (M), the canonical comparison

\[
\alpha_{G,M}:H^1(G,\operatorname{Multiplicative}M)
  \simeq \operatorname{ContCohomology.H1}(G,M)
\]

is induced by the unchanged underlying function, expressed through `toAdd`. Gauge by (m) adds (m-gm=-d^0m). The subgroup of boundaries is unchanged by this sign, and (alpha(1)=0). For a compatible continuous source map (arphi:H\to G) and continuous additive coefficient map (f:M\to N), the square with Tau Ceti's `explicitMap1` commutes. The compatibility hypothesis is (f(\varphi(h)m)=h f(m)). This is stronger than selecting an unspecified bijection of cohomology sets and is the bridge used by all vector-layer calculations.

Finite-quotient comparisons have a separate coefficient regime. When (G) is compact Hausdorff and (M) is discrete, a class can be represented at a finite level (G/N) with coefficient invariants (M^N). A transition for (V\le U) runs from the (U)-level to the finer (V)-level, using quotient pullback and inclusion of invariants. The parent Set-valued colimit and the underlying set of the pinned additive colimit agree through the canonical comparisons. Descent of a cocycle requires it to be pointwise neutral on (N). If only its restricted class is neutral, the parent gauge-killing result supplies the corrected representative first. These finite-quotient results do not identify continuous (\mathbf Q_p)-cohomology with a discrete coefficient colimit.

The pins are Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The existing smooth-unipotent affine group-scheme category is imported. Current Tau Ceti and the current TauCetiRoadmap documents were screened as well: ReductiveGroups already owns the group-scheme dictionary, quotients and unipotent theory; ProfiniteCohomology owns the discrete continuous-cohomology direction. Their constructions are not new NC.3 nodes. ArithmeticGaloisDuality D7 owns the compact and rational coefficient extension, and SelmerIwasawaCohomology owns the linear unramified and Bloch–Kato conditions.

## Central obstructions use actual continuous cochains

Let (i:\operatorname{Multiplicative}M\hookrightarrow B) be a continuous equivariant central embedding, and let (q:B\to C) be a surjective equivariant homomorphism with kernel exactly the image of (i). When comparing arbitrary lifts, require (i) to be a homeomorphism onto that kernel. A continuous set section of (q) supplies a continuous lift of every continuous (C)-valued cocycle. A surjective homomorphism alone does not supply a continuous set section in this general coefficient regime.

For a lift (b:G\to B), use the positive left-ordered defect

\[
D_b(g,h)=b(g)\,g(b(h))\,b(gh)^{-1}.
\]

If (q\circ b) is a cocycle, the defect lies in the kernel. The kernel homeomorphism expresses it as a continuous (M)-valued cochain (f_b). Associating the triple product (b(g)g(b(h))gh(b(k))) in the two ways, and moving central defects past the remaining factors, gives the displayed additive two-cocycle identity. Thus (f_b) belongs to the pinned (Z^2). The proposed `centralDefect_mem_Z2` signature tests this calculation directly with an injective central coefficient map; it does not assume the conclusion as a field of some auxiliary structure.

Replacing the lift by (b'(g)=i(a(g))b(g)) changes its additive defect by (d^1a). Every lift comparison used on the quotient must produce a continuous (a). This is where the topology of the kernel identification enters. Tau Ceti's `mem_B2_iff` and `H2pi_eq_iff` then prove equality of the actual continuous (H^2) classes. If (f_b=d^1t), correct the lift using (a=-t). The sign matters: correction by (+t) doubles rather than cancels the defect in characteristic zero.

To descend from cocycles to (H^1(G,C)), compare a gauge-changed cocycle with the lift obtained by gauging (b) by a chosen lift of its gauge element in (B). Centrality makes the defect unchanged. The remaining difference between chosen sections is a continuous central cochain, already handled above. This constructs

\[
\delta:H^1(G,C)\longrightarrow H^2_{\mathrm{cont}}(G,M)
\]

independently of representatives and sections. Its zero fibre is exactly the image of (H^1(G,B)). A compatible morphism of central sequences commutes with (delta), because it preserves the positive defect before passage to cohomology.

Kim's 2005 preprint uses the inverse defect, so its additive connecting class has the opposite sign. Both signs have the same zero fibre. We use the positive sign throughout because it matches Tau Ceti's `d1`. The relevant source is Kim2005, section 1, printed p. 5 and the Proposition 2 induction on printed pp. 7–9. The central action on (H^1), already planned in the parent, does not replace this (H^2) construction: an orbit statement without the continuous primitive cannot prove lift exactness.

The defect API evaluates the product, states its continuity, characterizes zero defect and proves the quotient-kernel formula. Its tests include a genuine cocycle, an unnormalized lift evaluated at ((1,1)), and the explicit inverse product. In particular (D_b(1,1)=b(1)), so the construction must not silently normalize the lift. All test signatures occur in the suggested file.

## Twisted fibres retain invariant orbits

For an arbitrary continuous cocycle (c:G\to U), inner twisting gives the action (g\star u=c(g)g(u)c(g)^{-1}). For a surjective equivariant (f:U\to V), write (K_c=\ker(f_c)) in this twist and (A_c=H^0(G,V_{f\circ c})). The parent constructs an actual (A_c)-action on (H^1(G,K_c)) using lifts of invariant quotient elements. Its class is independent of the lift, although a representative need not be. The parent orbit quotient is equivalent to the fibre over ([f\circ c]).

A named kernel subgroup or an abstract embedded kernel has its own topology and carrier. The parent already supplies the continuous multiplicative equivalence to the native kernel and the induced pointed (H^1)-equivalence (E). Define the transported action by (v\cdot a=E^{-1}(v\cdot E(a))). This proves equivariance, orbit quotient comparison and equality of stabilizers through the same actual map. The inclusion triangle ensures that an orbit represented by (d) maps to the class of (g\mapsto i(d(g))c(g)), in that order. The neutral kernel orbit maps to ([c]); the latter can be nonneutral.

When (c) is changed by a gauge element (u), conjugation by (u) identifies the twists, their kernels and invariant quotient groups. The transported action comparison must include that identification of acting groups. It is insufficient to assert merely that the two fibres have the same cardinality. Nor may equality in a coefficient fibre be strengthened to equality of kernel (H^1) classes: the correct assertion is equality of invariant orbits. These transport statements import the parent's native action and named/embedded equivalences; their assembled signatures remain named in G4.

## Algebra-valued points and cohomology

The generic `GaloisCoefficientFamily` interface packages exactly what a continuous cohomology functor needs. For every commutative (K)-algebra (R), it provides a topological group (P(R)), a jointly continuous (G)-action by automorphisms and, for every algebra homomorphism (a:R\to S), a continuous equivariant group homomorphism (P(a)). Identity and composition laws hold. Its data do not include an assertion that the resulting cohomology is representable. Group, topology, action and coefficient maps are native structures, rather than predicates that could hide the constructions.

For this family define (F_P(R)=H^1(G,P(R))). The map on (a) sends ([c]) to ([P(a)\circ c]). The parent gauge quotient makes this map well-defined. Its API exposes the object value, representative evaluation, neutral class and identity/composition laws. The tests distinguish gauge classes from raw cocycles and ensure that changing coefficients does not move the neutral class.

The geometric specialization is (P_n(R)=U_n(B\otimes_K R)). Here (B) is a complete Hausdorff topological field of characteristic zero, (G) is compact Hausdorff and acts continuously by field automorphisms, (F=B^G), (K\subset F), and ([F:K]<\infty). The coordinate Hopf algebra has an exhaustive (G)-stable filtration with finite-dimensional pieces, and each finite-depth quotient is finite type. The tensor coefficient ring carries the final topology from finite-dimensional (B)-subspaces. Polynomial point charts induce the group topology. Chart independence, coefficient-map continuity and joint action continuity must be proved with this topology. Kim2005, section 1, Lemmas 1–3 and 5, printed pp. 2–4, supply the method. The NC.2 tower is lower-central; its length filtration of universal modules does not by itself define that tower.

Regular sections of central vector quotients become continuous on points by this topology theorem. ReductiveGroups supplies the native algebraic unipotent direction and the central vector splitting refinements requested below. The existing smooth-unipotent group-scheme category remains the carrier. An abstract subgroup lower-central series, or the word “unipotent” in a predicate, does not prove that an algebraic quotient is a vector group with a regular section.

For vector coefficients, the key input is continuous cochain scalar extension. A continuous map from compact (G^j) into (V\otimes_K R) must use finitely many coefficient directions in the specified topology. With this compact-image theorem, coefficient coordinates identify

\[
C^j_{\mathrm{cont}}(G,V)\otimes_K R
 \simeq C^j_{\mathrm{cont}}(G,V\otimes_K R),\qquad 0\le j\le3.
\]

The differential is coefficientwise. Since (K) is a field, tensoring is exact, and the comparison passes to (Z^1,B^1,H^1) and (H^2). The compact-image condition is required separately for vector period quotients in the invariant-coset argument. Kim2005 Lemma 4, printed p. 3, and the vector base case of Proposition 2, printed pp. 7–8, motivate the field case. They do not establish the needed period-ring topology by changing the letter (B). Gap G1 records this exact boundary.

## Affine torsors and cohomology varieties

Geometric torsors are equivariant affine right (U_n)-torsors over (B\otimes_K R), with a strict exhaustive filtration on their coordinate rings whose graded ranks agree with those of (U_n). Isomorphisms preserve the affine torsor, filtration and semilinear (G)-action. Every finite filtration piece carries the required continuous action. This is the category used in Kim2005 Proposition 1, printed pp. 4–7.

A nonempty topological torsor on points is insufficient to construct this object. The algebraic supplier must prove that the split-unipotent fppf torsor over the affine coefficient base has a point, that its trivialization preserves the specified filtration, and that the required algebraic descent is effective. The standard vector induction uses vanishing of affine quasi-coherent first cohomology and the central vector quotients. Once these inputs hold, a point defines the same cocycle as the parent point-torsor classification. Conversely, twisting the affine coaction by a continuous cocycle reconstructs the filtered affine torsor. Natural comparison with the parent (H^1) classification then follows, rather than assuming that a homeomorphism on points is a filtered algebra isomorphism. These inputs constitute G2.

Assume that every central vector layer (V_i) has finite-dimensional continuous (H^j(G,V_i(B))) over (K) for (j=0,1,2), and that (H^0(G,V_i(B))=0). The finite field extension (B^G/K) is part of the finiteness convention. Also require the point-topology, scalar-extension, filtered torsor and regular-section hypotheses above. Kim2005 Proposition 2, printed pp. 7–9, then gives the finite-level affine representability theorem.

The vector first level is the affine space of its (H^1). Inductively, a universal class over the representing algebra admits a chosen cocycle representative. Its central defect gives a morphism to the finite-dimensional (H^2(V_i)) vector space. Form its **scheme-theoretic** zero fibre (I_i). This retains nilpotent coefficient algebras and need not be smooth. A linear splitting of (C^1\to B^2), restricted to its image, gives a continuous primitive for the universal obstruction-zero cochain. The corrected universal lift supplies a section over (I_i).

Vanishing of every graded (H^0) implies vanishing of twisted invariants in the preceding unipotent quotient by central induction; inner twisting acts trivially on the central graded layers. The parent's central (H^1(V_i))-action is therefore free. Consequently the next cohomology functor is noncanonically the product (H^1(V_i)\times I_i). This proves affineness and finite type. A choice enters the product description, but not the cohomology functor or its obstruction zero fibre. If (H^2(V_i)=0), the obstruction target is zero and (I_i) is the whole preceding level. Vanishing (H^2) is not assumed generally. The inverse-depth system is affine proalgebraic; finite-depth varieties, rather than an unqualified finite-dimensional infinite object, are the arithmetic inputs.

ArithmeticGaloisDuality's D7 nodes supply local rational coefficient duality and invariant maps. Its compact/rational direction and geometric arithmetic hypotheses supply the global cohomology finiteness needed here. R02.6's Taylor–Wiles numerical statements alone are not that input. The graded invariant vanishing must be checked for the actual NC.2 geometric representations; it is not a general property of all unipotent Galois groups.

## Invariant cosets and crystalline local loci

Let the tower be defined over (K). Regard (U_n(R)\subset U_n(B\otimes_K R)) as an embedded (G)-stable subgroup. The quotient is the coset set of elements (bU_n(R)), with the inherited (G)-action. The subgroup can be nonnormal, so this is not automatically a quotient group. The parent `connecting-map` and `invariant-coset-kernel` nodes provide the nonnormal connecting construction. Effectivity and comparison with sheaf quotients on all coefficient algebras remain inputs to the representability theorem.

For the central vector layer put (W_i=V_i(B)/V_i(K)). Require continuous quotient cochain scalar extension and finite-dimensional (H^0(G,W_i)) and (H^1(G,W_i)) over (K). The obstruction from the previous invariant-coset functor lands in (H^1(G,W_i)). Its zero fibre (I_i) consists of liftable invariant cosets. The kernel acting on each fibre is the vector invariant functor (H^0(G,W_i\otimes_K R)). A universal section gives the product (H^0(G,W_i)\times I_i), proving affine finite-type representability.

This uses the correction of Kim2005 Proposition 3, printed p. 10, already independently reviewed as parent source issue E1. The product factor is the **central vector quotient** invariant space, not a second copy of the previous unipotent level. This part relies on that recorded correction and does not assert a new independent erratum review. If (B=K), the invariant coset functor is a point; if (U=V) is a vector group, it is the invariant quotient (H^0(G,V(B)/V(K))). These computations expose the wrong induction factor.

A local condition is first a functorial neutral fibre. For a natural map (f:F\to T) and a natural neutral point (e) of (T), define `neutralLocus` by (\{x\in F(R):f_R(x)=e_R\}\). Its API gives membership, extensionality, coefficient-map values, inclusion and the unique factorization of every neutralized natural map. Its tests reject a nonneutral class, verify the neutral image and check coefficient changes. Closedness is a theorem about this functor, not a consequence of the definition.

At a local field (k_v/\mathbf Q_p), period coefficient extension defines

\[
H^1_g=\ker\bigl(H^1(G_v,U_n)\to H^1(G_v,U_n(B_{\mathrm{dR}}))\bigr),
\quad
H^1_f=\ker\bigl(H^1(G_v,U_n)\to H^1(G_v,U_n(B_{\mathrm{cris}}))\bigr).
\]

These kernels mean neutral fibres of pointed sets, with (R)-points understood in both expressions. The period inclusion gives (H^1_f\subset H^1_g). Kim2009, section 2, printed pp. 18–20, distinguishes these conditions; the de Rham condition bearing an older (H_f) notation in the earlier source must not be imported as the crystalline one. PadicHodgeTheory supplies the actual period rings, actions and coefficient compatibility. SelmerIwasawaCohomology `L4/bloch-kato-condition` supplies the vector finite condition; its `L2/unramified-condition` supplies the vector inertia kernel.

Kim2009 Lemma 5 uses invariant period cosets and their connecting boundary to describe crystalline classes. To conclude a represented **closed** all-algebra locus, prove effective quotient descent and central lifting compatibility. An image of a morphism on field points can fail to be closed and need not determine a functor on arbitrary algebras. Moreover (B_{\mathrm{cris}}) cannot be treated silently as the complete field (B) in the earlier representability theorem. G3 requires the period-quotient inputs and the geometric closedness induction explicitly. The plan targets that theorem rather than claiming it follows from the word “image”.

Unramifiedness is neutral restriction to inertia. If inertia acts trivially on coefficients, the neutral restricted class has a cocycle identically one: a gauge coboundary is then trivial. Without trivial inertia action, it is only a neutral class and must be treated by the correct gauge relation. Potential local conditions use specified open finite-index subgroups (H_v), as in Kim2009 section 3, printed pp. 25–26. Taking a varying union over every finite extension is a different functor and has no closedness assertion here.

## Global Selmer geometry and its dimension

Fix a number field (k), a finite ramification set (T) containing places above (p), infinity and the coefficient ramification, and a finite local index set (\Sigma) retaining the selected bad places. Let (F_T(R)=H^1(G_{k,T},U_n(R))). For each (v\in\Sigma), fix the actual localization (r_v:F_T\to L_v) and a coefficient-stable local condition (C_v\subset L_v). Define

\[
\operatorname{Sel}_T(U_n)(R)=
\{x\in F_T(R): r_v(x)\in C_v(R)\text{ for every }v\in\Sigma\}.
\]

At good places outside (T), the global group already encodes unramifiedness. At the selected bad places every specified local condition remains in the intersection; crystallinity at (p) cannot make a failed bad-place condition disappear. The generic `selmerFunctor` prototype takes arbitrary localization natural transformations and coefficient-stable subsets, so it does not presuppose schemes. Its tests include an empty index set, universally permissive conditions and rejection at a single bad place.

If the global and local functors are affine finite type and every (C_v\hookrightarrow L_v) is a represented closed subfunctor, the finite intersection is the iterated scheme fibre product. It is therefore closed affine finite type. Yoneda identifies its functor of all algebras, including dual numbers, with the displayed intersection. Localizations, depth projections and coefficient maps become morphisms by their natural transformations. Enlarging the ramification set uses the homomorphism (G_{k,T'}\to G_{k,T}) and preserves the chosen conditions at newly permitted places. It is not an instruction to remove those places from the local intersection.

For a central extension (1\to V\to U_{n+1}\to U_n\to1), a nonempty global cohomology fibre is an (H^1(V))-orbit. Vanishing of twisted global quotient invariants makes that action free. To restrict it to Selmer classes, prove that the difference of two local lifts satisfies the linear local condition and that adding such a vector class preserves every local condition. At (p), the argument compares two period trivializations and lifts the resulting quotient invariant. It requires surjectivity

\[
U_{n+1}(B_{\mathrm{cris}})^{H_v}\longrightarrow
U_n(B_{\mathrm{cris}})^{H_v}
\]

in the actual fixed local setting. It is not enough that the underlying point projection be surjective. The corresponding fixed inertia conditions must also be checked. This is the local compatibility part of G3.

After these conditions hold, every nonempty geometric fibre of the Selmer depth projection is a torsor under the vector Selmer space of (V), compatibly under residue-field extensions. Finite-type scheme dimension theory gives

\[
\dim\operatorname{Sel}_T(U_{n+1})\le
\dim\operatorname{Sel}_T(U_n)+\dim_{\mathbf Q_p}\operatorname{Sel}_T(V).
\]

The obstruction zero fibre can make this strict. No smoothness or equality is claimed merely from the inequality. The geometric-fibre statement, rather than a count of (\mathbf Q_p)-point orbits, is what permits the dimension argument. Kim2009 section 3, printed pp. 25–26, supplies this central Selmer method with the local invariant-lifting input visible.

At depth one, use NC.2's `depth-one-jacobian` comparison and its exact dual/Tate conventions. For a proper curve the group is the vector realization of the Jacobian Tate module; an open curve retains its puncture contribution. The canonical additive comparison intertwines global/local maps and gives the same linear Selmer space. The geometric class of ([x-b]) agrees with the rational p-adic Kummer map. HeightsRationalPointsAndObstructions RP.1 owns finite abelian descent; the rational Tate-module passage and its local comparisons are requested precisely, since a finite (\mu_m) Selmer group is not the desired target. SelmerIwasawaCohomology supplies the linear conditions, and the geometric path identification remains NC.2's responsibility.

A concrete nonzero depth-two test uses a Heisenberg group. For a continuous equivariant bilinear pairing (\beta:X\times Y\to Z), set

\[
(x,y,z)(x',y',z')=(x+x',y+y',z+z'+\beta(x,y')).
\]

The projection to (X\times Y) has central kernel (Z) and continuous set section (z=0). For one-cocycles (a,b), the positive defect of their section is (\beta(a(g),g b(h))), the oriented continuous cup product. Thus the pair lifts exactly when that (H^2) class is zero. For actual local Galois (G_k), take (X=\mathbf Q_p), (Y=Z=\mathbf Q_p(1)) and scalar multiplication. The imported rational local Tate pairing supplies a nonzero dual pair; its cup class in (H^2(G_k,\mathbf Q_p(1))\simeq\mathbf Q_p) obstructs lifting. The required explicit cup-to-low-degree comparison is requested from the generic compact/rational cohomology owner.

An elementary check uses discrete (G=\mathbf Z^2), trivial rational coefficients and the two coordinate homomorphisms. The defect takes values (1) and (0) on the swapped coordinate generators. All trivial-action coboundaries on an abelian group are symmetric, so this class is nonzero. This checks orientation without replacing the actual Galois test. The Heisenberg example has a trivial (X)-summand with nonzero invariants; it tests the obstruction theorem and is not an instance of the graded-(H^0)-vanishing representability theorem.

## Closure boundaries and review acceptance

The prerequisite graph imports native library declarations, parent and NC.2 nodes, the existing arithmetic and linear Selmer nodes, and eight precise supplier-stage requests. The packet's four gaps are:

- **G1:** prove the compact-image and quotient-cochain topology statements for the specified coefficient and period quotients;
- **G2:** verify affine unipotent torsor triviality, strict filtered trivializations and effective algebraic/coset descent on all coefficient algebras;
- **G3:** establish represented closed crystalline loci and the local invariant-lifting/difference theorem for the actual geometric central tower;
- **G4:** assemble the inherited and native geometric interfaces and add the fourteen individually identified omitted theorem signatures.

The suggested file elaborates the concrete positive-defect and continuous-(H^2) bridge signatures, the coefficient-family structure, the actual gauge-orbit cohomology functor, neutral-locus functor and Selmer intersection functor. Definitions have their API signatures and discriminating examples. It repeats only minimal parent supplier types required to make this part standalone; these are not new packet nodes. The remaining named geometric signatures are explicitly absent until the supplier interfaces can express their hypotheses. No arbitrary proposition stands in for those hypotheses, and elaboration of the concrete file does not imply that the geometric targets were prototyped.

Independent review should check the positive defect and continuous primitive, verify the all-algebra representability and coset interpretation, confirm the scope of the imported local duality and linear-condition nodes, and test the bad-place and depth-two examples. A follow-up closes G1–G3, validates the hypotheses on the NC.2 geometric tower, and completes G4. Only then can NC.3 be marked closed. This pass is complete because each stage target and its prerequisite boundary is recorded; it is not a claim that the requested inputs are already supplied.

## Declaration and test register

Node slugs refer to `AnabelianGeometryAndNonabelianChabauty:NC.3/<slug>`.
Proposed API and test names are in `TauCeti.NonabelianCohomology.NC3`.
The source locators use printed preprint pagination. The following register agrees
with the packet; the structural family projections are generated by its Lean structure.

### Canonical additive comparison

`canonical-comparison-naturality` — comparison. For a continuous G-action on an additive topological abelian group M, use the parent comparison α: H1(G,Multiplicative M) ≃ ContCohomology.H1 G M induced by c↦toAdd∘c, with α(1)=0. For a compatible pair φ:H→G and continuous additive f:M→N, α_H,N∘(φ,f)_*=explicitMap1(φ,f)∘α_G,M. On cocycles the gauge by m translates by −d0(m); hence the quotient comparison is independent of the sign of the B1 generator. The comparison is the identity on underlying cocycle functions, not an arbitrary bijection.

Acceptance: The neutral class maps to zero; cocycle representatives remain unchanged after writing the operation additively.

Sources: kim2005, Section 1, continuous cochains and gauge equivalence, printed pp. 4–6.

### Abelian finite-quotient transport

`finite-quotient-comparison` — comparison. For profinite G (compact Hausdorff and totally disconnected) and discrete additive M with continuous G-action, the canonical comparisons identify parent nonabelian descent, inflation and reverse-inclusion transition H1(G/U,(Multiplicative M)^U)→H1(G/V,(Multiplicative M)^V), V≤U, with Tau Ceti descendZ1, explicitInfl1 and explicitFiniteQuotientTransition1, after the canonical invariant-coefficient identification. They induce the comparison of the Set-colimit with the underlying set of explicitFiniteQuotientColimit1. Descent requires a representative pointwise neutral on U; neutral restriction of its class alone first requires a gauge correction.

Acceptance: The transition for U=V is identity; a finer level inflates to the same global class; no discrete-coefficient theorem is invoked for Qp.

Sources: kim2005, Section 1, cochain conventions, printed pp. 4–6.

### Positive central defect

`positive-defect` — construction. For topological groups G,B with continuous G-action by automorphisms and a function b:G→B define D_b(g,h)=b(g)·g(b(h))·b(gh)−1 in that order. It is continuous if b is continuous. If q:B→C is an equivariant homomorphism and q∘b is a cocycle then D_b takes values in ker(q).

API:

- `positiveDefect_apply` (simp): Evaluation is b(g)·g(b(h))·b(gh)−1.
- `positiveDefect_continuous` (structure): A continuous b has continuous D on G×G.
- `positiveDefect_eq_one_iff` (characterisation): D is identically one iff b is a cocycle.
- `positiveDefect_kernel` (compatibility): If q∘b is a cocycle then q(D_b(g,h))=1.

Tests:

- `positiveDefect_cocycle` (degenerate): For c∈Z1(G,B), D_c(g,h)=1.
- `positiveDefect_identity` (computation): For any b, D_b(1,1)=b(1), detecting an unjustified normalization.
- `positiveDefect_inverse` (compatibility): D_b(g,h)−1=b(gh)·g(b(h))−1·b(g)−1, detecting the opposite source sign.
- `positiveDefect_additive` (compatibility): For B=Multiplicative M and the induced additive action, toAdd(D_ofAdd(a)(g,h))=d1(a)(g,h), with the positive sign.

Acceptance: Positive defect becomes d1 in an additive central group.

Sources: kim2005, Section 1, obstruction differential, printed p. 5.

### Continuous central H2 bridge

`continuous-central-obstruction` — theorem. Let i:Multiplicative M→B be injective, equivariant and central. If a continuous f:G×G→M satisfies i(ofAdd(f(g,h)))=D_b(g,h), then f lies in ContCohomology.Z2 G M. Replacing b by i(ofAdd(a(g)))b(g), for a continuous a:G→M, changes f by d1(a). Therefore its actual continuous H2 class is unchanged.

Acceptance: A discontinuous primitive does not prove equality in this H2; positive and source inverse defects have opposite additive classes.

Sources: kim2005, Section 1, obstruction cochains and Proposition 2 induction, printed pp. 5, 7–9.

### Continuous lift exactness

`central-lift-exactness` — theorem. In the preceding central situation, [f]=0 in continuous H2 iff there is a continuous a:G→M such that i(ofAdd(a(g)))b(g) is a cocycle. If q∘b=c and q∘i=1, that corrected cocycle is a continuous lift of c. Conversely every continuous lift differs from b by a continuous M-valued cochain provided i is a homeomorphism onto ker(q).

Acceptance: The correction has sign −t; its quotient cocycle is unchanged.

Sources: kim2005, Section 1, Proposition 2 obstruction induction, printed pp. 7–9.

### Obstruction on gauge classes

`central-obstruction-descent` — theorem. For a central G-equivariant exact sequence 1→Multiplicative M→B→C→1 with the kernel identification a homeomorphism, q surjective and a continuous set section, D_{s∘c} defines δ:H1(G,C)→ContCohomology.H2 G M. It is independent of the section and of the cocycle representative. Its zero fibre is the image of H1(G,B), and δ is natural for continuous equivariant morphisms of such central sequences. The inverse source convention changes δ to −δ without changing the zero fibre.

Acceptance: A choice of an algebraic section supplies continuity only after the point-topology theorem; exactness is not inferred from an orbit-fibre theorem lacking H2.

Sources: kim2005, Section 1, Proposition 2 proof, printed pp. 7–9.

### Invariant orbit transport

`invariant-orbit-transport` — comparison. For a surjective continuous equivariant f:U→V and c∈Z1(G,U), let K_c be the native kernel in the inner twist and A_c=H0(G,V_{f∘c}). Transport the parent A_c-action along its named-kernel or embedded-kernel H1 equivalence E, defining v·a=E−1(v·E(a)). E is orbit-equivariant and induces an equivalence of actual orbit quotients with the fibre f_*−1([f∘c]); its representative maps to [g↦i(d(g))c(g)]. Inclusion squares, stabilizers and conjugate actions under change of c commute. No equality of kernel classes is claimed when only invariant orbits agree.

Acceptance: Transported stabilizers equal native stabilizers; the orbit of the neutral kernel class maps to [c], which can be nonneutral.

Sources: kim2005, Section 1, twisting and nonabelian exactness, printed pp. 4–6.

### Galois coefficient family

`galois-coefficient-family` — definition. For a commutative ring K and topological group G, a GaloisCoefficientFamily P assigns to each commutative K-algebra R a topological group P(R) with jointly continuous G-action by automorphisms. Each algebra map f:R→S gives a continuous equivariant group homomorphism P(f), with identity and composition laws. This packages the family supplied by actual unipotent points; it does not assert any algebraicity or representability.

API:

- `GaloisCoefficientFamily.equivariance` (compatibility): P(f)(g·x)=g·P(f)(x).
- `GaloisCoefficientFamily.identity` (functoriality): P(id_R)(x)=x.
- `GaloisCoefficientFamily.composition` (functoriality): P(g∘f)(x)=P(g)(P(f)(x)).
- `GaloisCoefficientFamily.continuous` (structure): P(f) is continuous in the supplied point topologies.
- `GaloisCoefficientFamily.obj` (data): For each R, the actual point type P(R).
- `GaloisCoefficientFamily.group` (structure): The native group structure on every P(R).
- `GaloisCoefficientFamily.topology` (structure): The native point topology on every P(R).
- `GaloisCoefficientFamily.action` (structure): The G-action by group automorphisms on every P(R).
- `GaloisCoefficientFamily.map` (projection): Each algebra map gives the actual continuous group homomorphism P(R)→P(S).

Tests:

- `GaloisCoefficientFamily.map_mul_test` (characterisation): P(f)(xy)=P(f)(x)P(f)(y).
- `GaloisCoefficientFamily.map_one_test` (degenerate): P(f)(1)=1.
- `GaloisCoefficientFamily.semilinear_test` (compatibility): Coefficient change commutes with the semilinear G-action, not merely with multiplication.
- `GaloisCoefficientFamily.identity_test` (compatibility): P(id_R)(x)=x for every point, excluding a constant coefficient-map family.

Acceptance: The interface does not identify H1 with Hom(G,P(R)) unless the action is trivial.

Sources: kim2005, Section 1, Lemmas 1–5, printed pp. 2–4.

### Continuous unipotent points

`unipotent-point-topology` — theorem. Instantiate GaloisCoefficientFamily by P_n(R)=U_n(B⊗_K R), using the native smooth-unipotent Hopf/group-scheme dictionary, a finite-type filtered G-stable coordinate Hopf algebra and its polynomial point charts. Here B is a complete Hausdorff characteristic-zero topological field with continuous semilinear G-action, K⊂F=B^G and [F:K]<∞. Put the final topology on B⊗_K R from its finite-dimensional B-subspaces. The chart topology is independent of the embedding, polynomial maps and coefficient changes are continuous, and G×P_n(R)→P_n(R) is jointly continuous. Central vector quotient sections that are regular maps are continuous on points.

Acceptance: An arbitrary change of an algebraic chart gives the same topology; the NC.2 depth tower is lower-central, not the augmentation-length tower.

Sources: kim2005, Section 1, Lemmas 1–3 and 5, printed pp. 2–4.

### Nonabelian cohomology functor

`cohomology-functor` — construction. For a GaloisCoefficientFamily P define F_P:CommAlgCat K→Set by F_P(R)=H1(G,P(R)); on f send [c] to [P(f)∘c]. The identity, composition and neutral-class laws hold. It is a pointed set-valued functor; it need not carry a group law when P is noncommutative.

API:

- `cohomologyFunctor_obj` (data): The value at R is the actual gauge-orbit H1(G,P(R)).
- `cohomologyFunctor_map_class` (simp): The image of [c] is [P(f)∘c].
- `cohomologyFunctor_map_one` (simp): The image of the neutral class is neutral.
- `cohomologyFunctor_map_id` (functoriality): The map for id_R is identity.
- `cohomologyFunctor_map_comp` (functoriality): The map for g∘f is the composite of the two maps.

Tests:

- `cohomologyFunctor_neutral_test` (degenerate): The trivial cocycle maps to the neutral class.
- `cohomologyFunctor_identity_test` (compatibility): Identity coefficient change fixes every gauge class.
- `cohomologyFunctor_gauge_test` (characterisation): [x·c] and [c] have the same image under every coefficient map.

Acceptance: Gauge-equivalent representatives give equal outputs.

Sources: kim2005, Section 1, Proposition 2 and the preceding cocycle functor, printed pp. 4–9.

### Cochain scalar extension

`cochain-scalar-extension` — theorem. For a finite-dimensional B-vector G-module V of the specified semilinear type and every K-algebra R with the finite-subspace final topology, the canonical map C^j_cont(G,V)⊗_K R→C^j_cont(G,V⊗_K R) is an isomorphism for j=0,1,2,3, compatible with differentials. Consequently continuous Z1, B1 and H1 commute with this scalar extension; H2 has the analogous comparison. H^j(G,V) is considered over K through F=B^G. Compact image containment in a finite-dimensional coefficient subspace is an explicit required input, not a property of arbitrary tensor-product topologies.

Acceptance: For R=K the comparison is identity; for dual numbers K[ε]/ε² it retains both coefficient components; no unrestricted topological tensor assertion is made.

Sources: kim2005, Section 1, Lemma 4 printed p. 3; Proposition 2 vector base case printed pp. 7–8.

### Filtered affine torsor comparison

`filtered-affine-torsor-comparison` — comparison. For the filtered finite-type unipotent U_n over B⊗_K R, classify equivariant affine right U_n-torsors with a strict exhaustive coordinate filtration whose graded ranks match U_n and with continuous semilinear G-action on every finite filtration piece. Isomorphisms are equivariant filtered affine torsor isomorphisms. Under the supplier theorem that these split-unipotent fppf torsors over the affine coefficient base have a point and that trivializations preserve this filtration, evaluation at a point gives a natural bijection of their isomorphism classes with H1(G,U_n(B⊗R)). Require effectivity of coefficient-base descent and compatibility of the filtered affine structure; the parent nonempty topological torsor bijection alone supplies neither.

Acceptance: An empty point space is excluded only after the affine triviality theorem; filtered algebra isomorphism must be proved, not inferred from a homeomorphism.

Sources: kim2005, Section 1, filtered torsor definition and Proposition 1, printed pp. 4–7.

### Finite-level representability

`finite-level-representability` — theorem. Let U_n be a finite-depth tower of characteristic-zero smooth split unipotent groups over B, with central vector layers V_i, regular sections of U_{i+1}→U_i, continuous semilinear G-action and the coefficient topology above. Assume [B^G:K]<∞, finite-dimensional K-vector H^j_cont(G,V_i(B)) for j=0,1,2, and H0(G,V_i(B))=0 for every i. Then R↦H1(G,U_n(B⊗_K R)) is corepresented by a finitely generated commutative K-algebra. At each extension the positive obstruction gives a morphism δ_i:H1(U_i)→H2(V_i); its scheme-theoretic zero fibre I_i is closed affine, and a noncanonical universal choice of continuous primitive gives H1(U_{i+1})≅H1(V_i)×I_i as functors of all K-algebras. The inverse-depth limit is an affine proalgebraic functor.

Acceptance: If H2=0, the next level is a product with H1(V_i); if δ is nonzero its zero fibre is retained; neither vanishing H2 nor smoothness of I_i is assumed.

Sources: kim2005, Section 1, Proposition 2 and its induction, printed pp. 7–9.

### Invariant coset representability

`invariant-coset-representability` — theorem. Suppose U is as above and defined over K, with the G-stable subgroup U_n(R)⊂U_n(B⊗_K R). The quotient here is the coset G-set of elements bH, even when the subgroup is nonnormal. With continuous vector-quotient cochains commuting with coefficient extension and finite-dimensional K-vector invariants and H1 for W_i=V_i(B)/V_i(K), the functor R↦H0(G,U_n(B⊗R)/U_n(R)) is affine finite type. In the central induction its kernel is H0(G,W_i⊗_K R) and its image is I_i=ker(ob_i) inside the previous invariant-coset variety, with ob_i landing in H1(G,W_i). A choice of universal section yields the product H0(G,W_i)×I_i.

Acceptance: For U=V additive the answer is H0(G,V(B)/V(K)); for B=K the quotient is a point; never require U_n(R) normal.

Sources: kim2005, Section 1, Proposition 3 and its induction, printed pp. 9–10; corrected by inherited source issue E1.

### Local neutral locus

`local-neutral-locus` — construction. For set-valued algebra functors F,T, a natural transformation f:F→T and a natural neutral point e of T, define neutralLocus(R)={x∈F(R):f_R(x)=e_R}. Its algebra maps are restrictions of F maps. For an inertia restriction map this gives H1_un; for extension of coefficients Qp→B_dR or Qp→B_cris it gives H1_g or H1_f respectively, once the actual continuous cohomology functors are supplied. The definition uses every coefficient algebra R; it asserts no representability or closedness.

API:

- `neutralLocus_mem` (characterisation): A class lies in the subtype iff f_R(x)=e_R.
- `neutralLocus_ext` (extensionality): Two subtype elements are equal iff their underlying F(R) values are equal.
- `neutralLocus_map_val` (functoriality): Coefficient maps have underlying value F(a)(x).
- `neutralLocus_inclusion` (projection): The natural inclusion into F is pointwise injective.
- `neutralLocus_lift` (universal-property): Every natural a:E→F with f∘a=e factors uniquely through neutralLocus.
- `neutralLocus_inclusion_val` (simp): The inclusion sends x to its underlying F(R) value.
- `neutralLocus_inclusion_injective` (characterisation): The inclusion is injective at every R.
- `neutralLocus_lift_comp` (universal-property): The lifted natural map composed with inclusion is the original a:E→F.
- `neutralLocus_lift_unique` (universal-property): Any b:E→neutralLocus with inclusion composite a equals the constructed lift.

Tests:

- `neutralLocus_reject_test` (non-example): If f_R(x)≠e_R, no element has underlying value x.
- `neutralLocus_neutral_test` (characterisation): Every element has exactly neutral image under f_R.
- `neutralLocus_basechange_test` (compatibility): The underlying image after coefficient change a is exactly F(a)(x).

Acceptance: BDR-neutralization is H1_g; crystalline neutralization is H1_f and implies H1_g through Bcris→BDR.

Sources: kim2009, Section 2, de Rham/crystalline torsors and local H1_g,H1_f, printed pp. 18–20.

### Local condition geometry

`local-condition-geometry` — theorem. For the geometric étale U_n and a fixed local p-adic field k_v, construct represented local H1 and show the crystalline neutralLocus is represented by an affine finite-type closed subfunctor under the needed finite vector cohomology, vanishing-invariant and period-quotient descent hypotheses. Compare this functor with filtered affine torsors trivial over B_cris. The invariant-coset boundary from H0(G_v,U_n(B_cris⊗R)/U_n(R)) has this neutral locus as its image on all R only after proving the effective quotient and base-change lifting statement. The analogous fixed unramified or fixed-H_v condition is represented closed when its vector conditions and central compatibility satisfy the same induction.

Acceptance: Keep H1_f distinct from H1_g; if inertia acts trivially a neutral restricted class has representative identically one; potential conditions use a fixed H_v, not an uncontrolled union.

Sources: kim2009, Section 2, Lemma 5 and the crystalline boundary discussion, printed pp. 18–20; section 3, printed pp. 25–26.

### Selmer functor

`selmer-functor` — construction. Given the global algebra functor F_T(R)=H1(G_{k,T},U_n(R)), a finite set of local indices Σ including all chosen bad and p-adic places, local functors L_v, localization natural transformations r_v and coefficient-stable subsets C_v(R), define Sel_T(U_n)(R)={x∈F_T(R):r_v(x)∈C_v(R) for every v∈Σ}. At good places outside T unramifiedness is already in G_{k,T}; at bad places retain the specified local conditions, and at p use crystalline neutralization where its hypotheses apply.

API:

- `selmerFunctor_mem` (characterisation): Membership is every displayed local condition.
- `selmerFunctor_ext` (extensionality): Equality is equality of the underlying global H1 class.
- `selmerFunctor_inclusion` (projection): There is a natural pointwise injective inclusion into global H1.
- `selmerFunctor_localization` (projection): Localization at v is r_v applied to the underlying global class.
- `selmerFunctor_map_val` (functoriality): Coefficient change has underlying value F_T(a)(x).
- `selmerFunctor_inclusion_val` (simp): The global inclusion sends x to its underlying global cohomology class.
- `selmerFunctor_inclusion_injective` (characterisation): The global inclusion is injective at every R.
- `selmerFunctor_localization_val` (simp): Localization sends x to r_v(x.val).

Tests:

- `selmerFunctor_empty_test` (degenerate): An empty local index type gives the full global functor.
- `selmerFunctor_bad_place_test` (non-example): A class failing any single specified local condition is rejected.
- `selmerFunctor_universal_test` (characterisation): If every C_v is the full local functor, Sel_T(U_n) is the global functor.

Acceptance: A class failing one bad-place condition fails the Selmer condition even if it is crystalline at p.

Sources: kim2009, Section 3, global Selmer varieties and bad-place conditions, printed pp. 25–26.

### Selmer representability

`selmer-representability` — theorem. If the global F_T and each local L_v are represented affine finite type over Qp, their localization natural transformations are represented morphisms, and each C_v is a represented closed subfunctor for the fixed finite Σ, then Sel_T(U_n) is the iterated fibre product of F_T with all C_v over all L_v, hence a closed affine finite-type scheme. Its functor of all commutative Qp-algebras is exactly selmerFunctor, including nilpotent coefficients.

Acceptance: Dual-number points satisfy the same local conditions; rational-point intersections alone are insufficient.

Sources: kim2009, Section 2 printed pp. 18–20 and section 3 printed pp. 25–26.

### Localization and depth functoriality

`selmer-localization-naturality` — theorem. For equivariant morphisms of the geometric unipotent towers preserving every chosen local condition, all depth projections and coefficient maps induce Selmer morphisms, commute with localization, preserve neutral classes and compose correctly. Enlarging T compares global groups through the actual quotient homomorphism G_{k,T′}→G_{k,T}; it does not discard local conditions at newly permitted bad places. The central positive obstruction commutes with localization and coefficient change.

Acceptance: The p-localization square agrees on representatives; a newly ramified place still appears among the conditions.

Sources: kim2009, Section 2 local/global diagrams printed pp. 18–20; section 3 central tower printed pp. 25–26.

### Central Selmer dimension bound

`central-selmer-dimension` — theorem. For 1→V→U_{n+1}→U_n→1 with V a vector group, assume represented finite-type Selmer schemes, vanishing twisted H0(G_{k,T},U_n) and local compatibility making the difference of two Selmer lifts a class in the LINEAR Selmer group Sel_T(V). At p require surjectivity on invariant B_cris points U_{n+1}(B_cris)^{H_v}→U_n(B_cris)^{H_v}; at fixed unramified places prove the analogous difference condition. Then every nonempty geometric fibre of Sel_T(U_{n+1})→Sel_T(U_n) is a torsor under the vector Sel_T(V), compatibly after residue-field extensions. Thus dim Sel_T(U_{n+1})≤dim Sel_T(U_n)+dim_Qp Sel_T(V). The obstruction zero fibre may make the inequality strict.

Acceptance: At depth one the bound reduces to the linear Selmer dimension; no equality or smoothness of all fibres is asserted; local invariant surjectivity cannot be omitted.

Sources: kim2009, Section 3, central Selmer fibres and dimension calculation, printed pp. 25–26.

### Depth-one Kummer and Selmer comparison

`depth-one-selmer-comparison` — comparison. For the geometric U_1 supplied by NC.2, identify it with the vector realization of the abelianized geometric fundamental group, using NC.2’s Jacobian/Tate-module conventions (and its puncture contribution for an open curve). The canonical additive H1 comparison intertwines global restriction, local unramified/crystalline conditions and the resulting linear Selmer subgroup. For a proper curve and its Jacobian J this is the rational Tate-module Selmer space with the actual Kummer map from J(k)⊗Qp; path classes of [x−b] agree with that map under the NC.2 comparison. Do not replace rational p-adic Selmer by a finite μ_m Selmer group.

Acceptance: For the identity Jacobian point the path class is neutral; depth-one classes obey the identical local conditions; boundary Tate terms are retained for an open curve.

Sources: kim2009, Introduction, printed p. 5, and section 2 local/global Albanese diagrams, printed pp. 18–20.

### A nonzero depth-two obstruction

`depth-two-cup-obstruction` — application. Let X,Y,Z be continuous topological additive G-modules and β:X×Y→Z a continuous G-equivariant bilinear pairing. The Heisenberg extension U=X×Y×Z has law (x,y,z)(x′,y′,z′)=(x+x′,y+y′,z+z′+β(x,y′)). For cocycles a∈Z1(G,X), b∈Z1(G,Y), the section g↦(a(g),b(g),0) has positive defect β(a(g),g·b(h)); its H2 class is the oriented cup product [a]∪_β[b]. It lifts iff that class is zero. For actual local Galois G=G_k with k/Qp finite, X=Qp, Y=Z=Qp(1) and the scalar pairing, local Tate duality supplies a,b with nonzero cup product in H2(G_k,Qp(1))≃Qp; that depth-two class does not lift. This example tests obstruction theory, not the H0-vanishing representability hypothesis, since X has nonzero invariants.

Acceptance: The cup order is a(g) paired with g·b(h); swapping source sign negates its H2 class but preserves nonliftability; the actual Galois example requires the requested p-adic duality theorem.

Sources: kim2005, Section 1, central obstruction and exactness, printed pp. 5, 7–9; kim2009, Section 3, central quotient obstruction and Selmer induction, printed pp. 25–26.

## Source records

- [The motivic fundamental group of P1 minus {0,1,infinity} and the theorem of Siegel](https://arxiv.org/pdf/math/0409456v1), Minhyong Kim; arXiv math/0409456v1, 2004 preprint of Inventiones Mathematicae 161 (2005), 629–656. Read on 2026-10-11. SHA-256 `00efa6e96091d564f7afa2ad9fb917a34cc0a55b7e258164383519b4e93ba941`.
- [The unipotent Albanese map and Selmer varieties for curves](https://arxiv.org/pdf/math/0510441v4), Minhyong Kim; arXiv math/0510441v4, preprint of Publications RIMS 45 (2009), 89–133. Read on 2026-10-11. SHA-256 `7b404331925f1d8e9bce81e9b16473f0d65a7f1ac2948ccff0db3a6e7b0d0f19`.
