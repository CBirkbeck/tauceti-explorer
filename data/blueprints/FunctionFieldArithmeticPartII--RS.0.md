# FunctionFieldArithmeticPartII: root-object and affine-chart interfaces

RS.0 connects native invertible sheaves with the affine charts used in finite root stacks. Its output is a comparison which preserves sections, power identifications and every isomorphism, and which commutes with arbitrary changes of the test scheme. It supplies the interface for RS.1's geometric root stack and RS.2's finite levels, and for the section-root data used in the ramified Picard constructions of GC.0–GC.1. For example, Yun–Zhang, Appendix A, Definition A.2, p.515, uses a square root of a restricted line together with a section whose square is the restricted global section. The equation and its isomorphisms are precisely the data retained here.

The accepted [parent packet](../packets/FunctionFieldArithmeticPartII.json) and [parent reader](FunctionFieldArithmeticPartII.md) specify the root powers, affine quotient algebra, action/coaction, coordinate groupoids and normalization covers. This document gives the native comparisons those targets consume. Parent node IDs are dependencies, not definitions copied into this continuation. Generic line bundles, their local frames and scalar automorphisms, tensor sections, monoidal module pullback, descent and stackification retain their existing owners.

## Objects and conventions

Let T be a scheme. Write O_T for the native trivial invertible sheaf, identified with the structure-module unit through the canonical free-PUnit isomorphism. For a native invertible sheaf M, the parent recursion is M^0=O_T and M^(n+1)=M^n⊗M. It fixes parentheses. Its section powers begin with the unit section1; the successor is the imported tensorSection of the preceding power and t. Tensor powers of actual line isomorphisms, together with c_n:O_T^n≅O_T, use the same recursion.

For n≥1, a root of a line with section (L,s) is (M,t,φ), where M is an invertible sheaf, t∈Γ(T,M) and φ:M^n≅L satisfies φ(t^n)=s. A root arrow h:(M,t,φ)→(N,r,ψ) is a line isomorphism satisfying h(t)=r and ψ∘h^n=φ. The root groupoid is not the full category of invertible sheaves: the latter also has noninvertible module maps. Nor is it the set of root isomorphism classes. These conventions reuse parent nodes `RS.0/root-object`, `RS.0/tensor-power`, `RS.0/section-power`, `RS.0/trivial-power-isomorphism` and `RS.0/section-power-transport`.

On Spec B with a chosen target frame l:L≅O and root frame e:M≅O, read the sections through the actual ΓSpec isomorphism. Put y=coord(e(t)), f=coord(l(s)). The automorphism

\[
l\circ\varphi\circ(e^{-1})^n\circ c_n^{-1}:O\longrightarrow O
\]

is multiplication by a unit u, and the root equation becomes

\[
u y^n=f.
\]

An arrow h from framed root p to framed root q has unit label w, the scalar of e_q∘h∘e_p^{-1}. Its two equations are

\[
y_q=w y_p,\qquad u_q w^n=u_p.
\]

Every label is retained. At a zero section the first equation imposes no restriction on w, but the second still does. Losing the second equation turns general units into false root automorphisms. Replacing arrows by their effect on y identifies different stabilizers. The parent `root-identification-unit`, `root-trivialization-equation`, `root-arrow-scalars` and `framed-groupoid` supply these contracts. The native equivalence below gives their inverse and actual unit/counit.

The geometric exponent is always positive, including exponents divisible by the residue characteristic. There is no reducedness, noetherianity or nonzero-section assumption. Arbitrary test changes may be nonflat and noninjective. The zero ring is allowed; its spectrum and coverings have their native empty-scheme interpretation. Exponent zero is used for tensor recursion and for the parent's scheme comparison of normalization algebras, with no assertion that its unit-root algebra is a covering algebra.

## Dependency and ownership boundary

The compilation baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet's twelve baseline declarations were read at those pins; the eight source files containing them match the exact pinned GitHub bytes. They supply native schemes, modules, invertible sheaves, local rank-one frames, module pullback, ΓSpec and native pullback uniqueness. Abstract stack/descent types alone do not supply a root-stack implementation.

Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` adds native trivializationCoordinate and its restriction/generator laws, unit transition functions and local frames in LineBundle/Basic; globalSectionsActionRingEquiv and unitsGlobalSectionsMulEquivAut in LineBundle/Endomorphisms; ordinary InvertibleSheaf.pullback and its identity/composition isomorphisms in LineBundle/Pullback and Functoriality. These existing generic constructions are imports. They are not claimed at the old pins or given new blueprint nodes.

Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` has **AlgebraicVectorBundles L0A–L0B**: tensorSection, tensorUnitIso, coherent strong symmetric monoidal module pullback, and the comparison of finite locally free rank-one sheaves with native InvertibleSheaf. Its representative section pullback is expressed as O→M using the unit comparison and native pullback composition. This convention agrees with Γ(T,M), after the existing unit/free-module comparison. Import these targets through `SchemeAndStackFoundations:SF.3/picard-groupoid` and the exact JAC-A-RS0 section comparison request. The general symmetric monoidal category, section tensor product and rank-one preservation are not root-stack targets. JacobianChallenge Layer A is the existing line-bundle/Picard owner.

The reviewed audit in `data/library-coverage.json` identifies native fppf/fpqc topologies and abstract descent as existing ingredients, while global effective module descent and geometric stacks require their named suppliers. There is no separate reviewed audit entry for this Part II. Its accepted parent is the audited starting contract. The extension uses the parent `RS.1/root-fpqc-descent` as its root descent theorem, whose exact suppliers are `AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent` and `R09.3/finite-locally-free-descent`. It does not plan effective root descent again. `DiamondsAndVStacks:D0/stackification` and `D0/groupoid-quotients-and-two-fibre-products` supply the generic associated stack and quotient machinery. SF.1 supplies the affine-basis comparison. SF.0 and D0 supply the generic universe adapters.

All accepted parent RS.0 algebra targets are reused, including its universal Hopf coaction, weighted action-comparison kernel/cokernel, monic bases, coefficient maps and affine chart/stabilizer examples. The parent `RS.2/root-point-groupoid` owns the actual finite point-action groupoid already consumed by the parent RS.0 chart embedding. The present native chart functor imports that groupoid; this is not a claim that the infinite tower is an RS.0 target. Infinite coherent reindexing, genuine 2-limits and infinite quotient descent belong to RS.2. Algebraicity, atlas properties, closed fibres, coarse spaces and Deligne–Mumford criteria belong to RS.1 and its geometric suppliers. No tame or etale conclusion follows solely from a positive exponent.

## The comparison architecture

The native groupoid with a chosen root frame has **all root arrows**, rather than only frame-preserving arrows. Its coordinate functor is an equivalence with FramedRoot. Forgetting its frame is fully faithful, with essential image the roots whose root line is trivializable. This leaves the global root-line obstruction visible. A normalized affine chart has coefficient1; the parent fully faithful inclusion into FramedRoot remains the exact normalized inclusion.

For a framed root (u,y), the specified normalization algebra is D=B[T]/(T^n−u). The adjoined root r=T is a unit because u is a unit and n≥1; its inverse is u^{-1}r^{n−1}. The pulled root (u,y) is isomorphic to (1,r*y), with label r, since r^n=u. The parent supplies its finite basis, faithful flatness, finite presentation, actual singleton scheme fppf cover, functor on labelled arrows and Cartesian coefficient changes. Their use after native local line frames proves local essential surjectivity. The resulting associated-stack comparison uses the actual descent theorem and D0's stackification; it does not infer a stack from a set of chart points.

Both local obstructions matter. The root line can fail to be trivial on an affine test. Even if it is trivial, its coefficient u need not be an n-th power in Bˣ. The normalized chart misses the latter roots objectwise. Taking a Zariski cover for the line, followed by the specified fppf Kummer cover for u, removes the two obstructions and preserves all arrows. Different frames and different unit roots produce modifications rather than equality of all choices. This is what makes the local presentation independent of its choices.

For example, over B=Z/4, n=2, f=3, the coordinate data u=3,y=1 give a root with trivial line. Squares in B are0 or1, so the normalized chart has no B-point. In D=B[T]/(T²−3) that object becomes the normalized root with sectionT. The associated stack has the original root as a global object, despite the empty raw chart-point groupoid on B. A claim of objectwise essential surjectivity would fail this example.

At f=0 over Z/9, the sections3 and0 both have square zero. They are not isomorphic as root sections: multiplication by a unit cannot carry the nonzero3 to0. Replacing the full fibre by a reduced gerbe erases this distinction. AGV B.2, p.53, explicitly distinguishes the full nilpotent neighbourhood from its gerbe. This is also the correction required for Yun–Zhang A.1.3, pp.515–516, as inherited in source finding E2.

At n=2,y=0 over Z/4, unit labels1 and−1 give different automorphisms. Under Z/4→Z/2 they become equal. Native pullback and coordinate change still commute, so this is a required nonfaithfulness example, not a failure of naturality. The parent normalization functor's faithfulness is a separate assertion using its adjoined unit and faithful flatness; it does not imply faithfulness of arbitrary coefficient change. In characteristic p, over F_p[ε]/(ε²), the unit1+ε has p-th power1. At a zero section it is a visible infinitesimal μ_p automorphism. Wild exponents must therefore be tested on rings with nilpotents, not only on geometric field points.

## Targets, APIs and tests

Every ID below starts with `FunctionFieldArithmeticPartII:RS.0/`. The displayed declaration names are proposed names for root-specific interfaces. Parent and supplier references specify mathematical contracts; each new target has implementation status unchecked. Proof outlines distinguish imported generic operations from root-specific consequences.

### 1. Section-compatible pullback of root tensor powers

Target `native-power-pullback` (construction); proposed declaration `TauCeti.RootStack.powerPullbackIso`.

For h:Y→T, an invertible sheaf M on T and n≥0, construct κ(h,M,n):(h*M)^n≅h*(M^n), natural in actual line isomorphisms. Use the inverse of the unit comparison at n=0 and the tensor comparison recursively at n+1, with M^0=O and M^(n+1)=M^n⊗M. It carries (h*t)^n to h*(t^n). Under any chosen frames its section equation is the image under the coefficient ring map of z^n; it is compatible with identity and composite pullback through the supplier’s strong monoidal comparisons.

**Hypotheses and conventions.**

- T is an arbitrary scheme; no reducedness, noetherianity or flatness of test changes is assumed.
- Invertible sheaves, sections, tensor products and isomorphisms use the native Tau Ceti/Mathlib carriers.
- The exponent may be zero. Global-section pullback is the map obtained from the unit of module pullback–pushforward, or equivalently from the image of a morphism O→M, not an assumed isomorphism on global sections.
- Fix the imported comparison directions as β₀:h*O_T≅O_Y and β₂:h*(M⊗N)≅h*M⊗h*N. Thus κ₀=β₀⁻¹ and each successor uses β₂⁻¹; these are inverses of the strong monoidal structural maps where that convention is used.

**Proof or construction.**

1. Import the strong monoidal module pullback and tensorSection from AlgebraicVectorBundles L0A, restricted to native rank one by L0B/SF.3. This is the existing generic operation, not a new monoidal structure.
2. At zero use O_Y≅h*O_T; in the successor step use κ_n⊗id followed by the inverse of the strong monoidal tensor comparison. The parent fixes parentheses and transport of line isomorphisms.
3. Apply the imported sectionwise tensor/pullback equation at each successor and the unit-section equation at zero. This induction supplies the root-specific section law; it does not require global sections to commute with tensor products as an isomorphism.
4. Identity/composition compatibility follows from the supplier’s monoidal unit and tensor diagrams, not from declaring different tensor powers equal.

**Direct dependencies.** `FunctionFieldArithmeticPartII:RS.0/tensor-power`, `FunctionFieldArithmeticPartII:RS.0/section-power`, `FunctionFieldArithmeticPartII:RS.0/section-power-transport`, `SchemeAndStackFoundations:SF.3/picard-groupoid`, `SchemeAndStackFoundations:SF.3`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`.

**Uses.** AGV Appendix B.1–B.2: Pulling root data to another scheme uses both its line-power identification and its section equation.; FunctionFieldArithmeticPartII:RS.0/native-root-pullback: The root identification is transported using κ, in its forward direction.

**API.**

| Declaration | Role and statement |
| --- | --- |
| `TauCeti.RootStack.powerPullbackIso` | constructor: The recursively specified κ(h,M,n), with its forward and inverse maps. |
| `TauCeti.RootStack.powerPullbackIso_zero` | simp: κ(h,M,0) is the inverse unit comparison O_Y≅h*O_T. |
| `TauCeti.RootStack.powerPullbackIso_succ` | simp: κ at n+1 is κ_n⊗id followed by the comparison (h*M^n)⊗h*M≅h*(M^n⊗M). |
| `TauCeti.RootStack.powerPullbackIso_section` | compatibility: κ(h,M,n) sends the n-th power of the pulled section to the pullback of its n-th power. |
| `TauCeti.RootStack.powerPullbackIso_naturality` | functoriality: κ intertwines power transport of every actual line isomorphism. |
| `TauCeti.RootStack.powerPullbackIso_comp` | compatibility: For k:Z→Y, the direct κ for h∘k equals the iterated κ after the supplier’s monoidal pullback-composition comparisons. |

**Unit tests.**

- `TauCeti.RootStack.powerPullbackIso.test_zero` (degenerate): For n=0 and t=0, the section comparison is 1=1; it cannot use 0 as the zero-th power.
- `TauCeti.RootStack.powerPullbackIso.test_two` (compatibility): For a trivial line with coordinate z, n=2 and coefficient map ψ, both routes have coordinate ψ(z)^2=ψ(z^2).
- `TauCeti.RootStack.powerPullbackIso.test_nonflat` (non-example): For Z/4→Z/2 and z=2, the pulled section is zero; κ is still an isomorphism of line powers, with no injectivity assertion about sections.
- `TauCeti.RootStack.powerPullbackIso.test_unit` (computation): For n=1, the comparison agrees with ordinary line pullback after the canonical tensor-unit identifications.

**Acceptance.**

- The n=0 section is one under the actual unit comparison.
- The comparison retains its direction (h*M)^n→h*(M^n).

**Source support.** [AGV08](https://arxiv.org/pdf/math/0603151v2), Appendix B.1–B.2, printed pp. 52–54: Root identifications require transporting actual tensor powers across a test-scheme morphism. The displayed section equation is our recursive deduction, not a separately numbered theorem in Appendix B.; [AVB](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md), L0A–L0B; Suggested.lean tensorSection, tensorUnitIso, pullbackModulesMonoidal and pullbackFiniteLocallyFreeObjIso (unpaginated): Imports the general tensor-section and monoidal pullback operations; only their application to the parent’s fixed root-power recursion is specified here.

### 2. Pullback of native root objects and arrows

Target `native-root-pullback` (construction); proposed declaration `TauCeti.RootStack.RootObject.pullback`.

For n≥1 and (L,s) on T, define h*:Root(T,L,s,n)→Root(Y,h*L,h*s,n). Send (M,t,φ) to (h*M,h*t,h*φ∘κ(h,M,n)); send a root arrow a to h*a. The two arrow conditions are preservation of the section and φ_target∘a^n=φ_source. The resulting functor preserves both conditions and all automorphism labels. Given an isomorphism of target pairs, transport the last identification by that isomorphism; do not change the root section.

**Hypotheses and conventions.**

- T is an arbitrary scheme; no reducedness, noetherianity or flatness of test changes is assumed.
- Invertible sheaves, sections, tensor products and isomorphisms use the native Tau Ceti/Mathlib carriers.
- n≥1; Root is the parent’s root-object groupoid, with only invertible line maps as arrows.

**Proof or construction.**

1. Use the parent root-object definition without redefining its carrier. Apply native line pullback to M and every isomorphism, and the supplier’s section pullback to t and s.
2. Compose κ with the pulled φ. The power-pullback section equation and functoriality give φ′(t′^n)=s′.
3. Apply pullback to each arrow square and use κ’s naturality; the separate pulled section equation proves the other arrow condition. Identity and composition are the inherited functor laws.
4. An isomorphism of target pairs gives a root functor by composing φ with the target line isomorphism; the assertion on s verifies its object equation.

**Direct dependencies.** `FunctionFieldArithmeticPartII:RS.0/root-object`, `FunctionFieldArithmeticPartII:RS.0/native-power-pullback`, `FunctionFieldArithmeticPartII:RS.0/section-power-transport`, `SchemeAndStackFoundations:SF.3/picard-groupoid`.

**Uses.** TV Proposition 3.4: Root data vary contravariantly with the test scheme.; FunctionFieldArithmeticPartII:RS.0/native-coefficient-naturality: Identifies native pullback with the parent coefficient-change functor.

**API.**

| Declaration | Role and statement |
| --- | --- |
| `TauCeti.RootStack.RootObject.pullback` | constructor: The functor on root objects and actual root arrows described above. |
| `TauCeti.RootStack.RootObject.pullback_line` | projection: The root line is h*M, using the existing rank-one pullback. |
| `TauCeti.RootStack.RootObject.pullback_section` | projection: The root section is h*t, through the actual section-pullback map. |
| `TauCeti.RootStack.RootObject.pullback_identification` | projection: The identification is h*φ∘κ(h,M,n), including the indicated comparison of its domain. |
| `TauCeti.RootStack.RootObject.pullback_arrow` | simp: The underlying line isomorphism of a pulled arrow is h*a. |
| `TauCeti.RootStack.RootObject.transportTarget` | functoriality: An isomorphism (L,s)≅(L′,s′) acts by postcomposing φ; identity and composite target transports agree. |

**Unit tests.**

- `TauCeti.RootStack.RootObject.pullback.test_identity` (compatibility): Pullback by id is naturally isomorphic to the original root, via the native line-pullback identity isomorphism.
- `TauCeti.RootStack.RootObject.pullback.test_nilpotent` (computation): The normalized root y=2 over Z/4, n=2, f=0 pulls to y=0 over Z/2.
- `TauCeti.RootStack.RootObject.pullback.test_stabilizer` (non-example): At y=0 over Z/4, n=2, the unit −1 labels an automorphism distinct from identity; its Z/2 pullback is identity.
- `TauCeti.RootStack.RootObject.pullback.test_target` (compatibility): Changing the target frame by unit b multiplies the power-identification coefficient and f by b and leaves y unchanged.

**Acceptance.**

- No flatness condition is imposed on h.
- A nonidentity automorphism can become identity under pullback.

**Source support.** [AGV08](https://arxiv.org/pdf/math/0603151v2), Appendix B.1–B.2, printed pp. 52–54: The root moduli problems pull back along test morphisms; these explicit formulas spell out the native functor and the two equations which the source leaves implicit.

### 3. Coherent root pullback on the scheme site

Target `native-root-coherence` (theorem); proposed declaration `TauCeti.RootStack.RootObject.pullback_coherent`.

For a fixed scheme X and (L,s) on X, T→X maps to Root(T,L_T,s_T,n) with L_T=T*L and s_T=T*s. The root pullback functors form a groupoid-valued pseudofunctor on (Sch/X)^op. Its identity and composition natural isomorphisms have the native line-pullback identity and composition isomorphisms as underlying components, corrected on the target L_T by the same comparisons. They preserve sections and root identifications. The triangle and pentagon hold, and every finite iterated pullback agrees with direct pullback through these specified comparisons.

**Hypotheses and conventions.**

- T is an arbitrary scheme; no reducedness, noetherianity or flatness of test changes is assumed.
- Invertible sheaves, sections, tensor products and isomorphisms use the native Tau Ceti/Mathlib carriers.
- Fix n≥1. Coherence is equality of the specified natural transformations after associators; no strict equality of chosen pullback objects is asserted.

**Proof or construction.**

1. Restrict the supplier’s coherent native Picard pullback to roots using the section law and κ-composition law. Correct both the root line and the pulled target line; correcting only M gives an ill-typed φ square.
2. For identities use the native unit comparison. For a pair of morphisms use the native composition comparison on M and L and its compatibility with the n-th power.
3. Underlying line isomorphisms satisfy triangle and pentagon by the supplier’s coherence. Equality of root arrows reduces to their underlying line maps, because the two preservation conditions are properties.
4. Induct on a finite chain; the pentagon compares all bracketings. This is the general root-object coherence target beyond the parent’s chosen affine two- and three-step comparisons.

**Direct dependencies.** `FunctionFieldArithmeticPartII:RS.0/native-root-pullback`, `FunctionFieldArithmeticPartII:RS.0/native-power-pullback`, `SchemeAndStackFoundations:SF.3/picard-groupoid`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullbackId`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullbackComp`.

**Acceptance.**

- The n=1 root functor has the identity-pair groupoid behaviour.
- A four-map chain has equal composite comparison arrows for all parenthesizations.
- Nonflat coefficient change preserves these diagrams even when it identifies distinct arrows.

**Source support.** [AGV08](https://arxiv.org/pdf/math/0603151v2), Appendix B.1–B.2, printed pp. 52–54: The object description is base-change compatible. Our proof uses the imported monoidal pseudofunctor coherence to make this compatibility precise.; [TV17](https://arxiv.org/pdf/1410.1164v2), §3, Remark 3.1 and Proposition 3.4, pp. 12–13; Corollary 3.13, p. 16: Proposition 3.4 gives finite root base-change compatibility in the logarithmic setting; it motivates, rather than supplies in native Lean, the pair-level comparison here.

### 4. Native root objects with chosen line frames

Target `native-framed-category` (definition); proposed declaration `TauCeti.RootStack.FramedNativeRoot`.

Fix a commutative ring B, n≥1 and a target pair (L,s) on Spec B with specified frame l:L≅O. Let f∈B be the coordinate of s through l and Scheme.ΓSpecIso. A FramedNativeRoot object is a parent root object (M,t,φ) together with e:M≅O. A morphism between (a,e_a) and (b,e_b) is any root arrow a→b: it need not preserve e_a,e_b. Composition and inverses are those of the parent root groupoid. Forgetting e is fully faithful; its essential image consists exactly of roots whose line M is globally trivializable.

**Hypotheses and conventions.**

- B may be the zero ring, or nonreduced; f is arbitrary.
- The target frame l is fixed. Frames are data on objects, not an additional preservation condition on arrows.

**Proof or construction.**

1. Add e as object data and use the parent Hom type unchanged, so the groupoid laws are inherited.
2. The forgetful Hom map is the identity on actual root arrows and hence fully faithful. Essential-image membership is exactly existence of e; no affine Picard group is presumed zero.
3. For two frames on the same root, the identity root arrow is an isomorphism of the two framed objects. A frame-preserving arrow restriction would destroy this comparison.

**Direct dependencies.** `FunctionFieldArithmeticPartII:RS.0/root-object`, `mathlib:AlgebraicGeometry.Scheme.ΓSpecIso`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial`.

**Uses.** AGV B.2, p. 54: Local trivializations give quotient descriptions but need not exist globally on every affine test.; FunctionFieldArithmeticPartII:RS.0/native-framed-equivalence: The comparison can read every native root arrow as a unit label.

**API.**

| Declaration | Role and statement |
| --- | --- |
| `TauCeti.RootStack.FramedNativeRoot` | constructor: Pairs consisting of an actual root object and a line frame e:M≅O. |
| `TauCeti.RootStack.FramedNativeRoot.root` | projection: The parent root object, with its line, section and power identification. |
| `TauCeti.RootStack.FramedNativeRoot.frame` | projection: The specified line isomorphism e; it is not a quotient of choices. |
| `TauCeti.RootStack.FramedNativeRoot.forget` | functoriality: Forget the chosen frame; act as identity on underlying root arrows. |
| `TauCeti.RootStack.FramedNativeRoot.homEquiv` | equivalence: The Hom set is exactly the Hom set of the underlying parent roots. |
| `TauCeti.RootStack.FramedNativeRoot.essentialImage` | characterisation: A root is in the forgetful essential image if and only if its root line admits a global frame. |

**Unit tests.**

- `TauCeti.RootStack.FramedNativeRoot.test_zero` (non-example): For a zero section and n=2 over Z/4, the −1 automorphism remains an arrow between a framed object and itself; requiring its frame to be fixed would incorrectly delete it.
- `TauCeti.RootStack.FramedNativeRoot.test_two_frames` (compatibility): Two frames of the same root are isomorphic by the identity root arrow, including frames differing by a unit a with a^n≠1.
- `TauCeti.RootStack.FramedNativeRoot.test_one` (degenerate): At n=1 a root has no nonidentity automorphism, since φ is an isomorphism and φ∘h=φ forces h=id.
- `TauCeti.RootStack.FramedNativeRoot.test_nontrivial_line` (non-example): If Spec B has a nontrivial invertible sheaf M with a specified isomorphism M^n≅O for n≥2, then (M,0,φ) is a root of (O,0) but is outside the forgetful essential image. An affine base and a framed target alone cannot justify a frame of M.

**Acceptance.**

- Both e_a,e_b appear when computing the scalar label of an arrow.
- The category is not the groupoid of roots with frame-preserving arrows.

**Source support.** [AGV08](https://arxiv.org/pdf/math/0603151v2), Appendix B.1–B.2, printed pp. 52–54: Appendix B.2 supplies the native triples. Adding a chosen line frame and retaining all root arrows is our coordinate-comparison construction, not a source definition of a globally trivial root stack.

### 5. Equivalence of native framed roots and coordinate roots

Target `native-framed-equivalence` (construction); proposed declaration `TauCeti.RootStack.framedNativeEquiv`.

With B,f,n,l as in FramedNativeRoot, construct a groupoid equivalence E_l:FramedNativeRoot(B,L,s,n,l)≌FramedRoot(f,n,B) from the parent. For (M,t,φ,e), set y=coord(e(t)), and let u be the unit coefficient of l∘φ∘(e^{-1})^n∘c_n^{-1}:O≅O. Then u*y^n=f. For an arrow h:a→b, its label w is the unit scalar of e_b∘h∘e_a^{-1}. The label satisfies y_b=w*y_a and u_b*w^n=u_a. Conversely any such w gives exactly the root arrow e_b^{-1}∘mul(w)∘e_a. The inverse on objects uses M=O, t with coordinate y, e=id, and φ=l^{-1}∘mul(u)∘c_n. Unit and counit are actual root isomorphisms with the underlying frames; both triangles hold.

**Hypotheses and conventions.**

- n≥1, B arbitrary commutative, l a specified target line frame.
- Coordinates include the canonical free-PUnit-to-unit and ΓSpec comparisons; Γ(Spec B,O) is not identified definitionally with B.

**Proof or construction.**

1. Reuse current native line coordinates and unit-scalar automorphism equivalence; at the old pins the coordinate bridge is the parent’s freeHomEquiv/freePUnitIsoUnit route. Generic tensorSection and section/unit comparisons are imported through JAC-A-RS0.
2. The parent section-power-in-trivialization law turns the root equation into u*y^n=f. Its proof is induction: zero has coordinate1 and successor uses the imported pure-tensor coordinate multiplication, then c_(n+1).
3. The parent root-arrow scalar law gives both arrow equations. In the reverse direction, the section equation verifies h(t_a)=t_b and the coefficient equation verifies φ_b∘h^n=φ_a on the basis of O^n. Checking only a section does not verify the power-identification square.
4. Every automorphism of the trivial module is multiplication by a unique unit, so the two Hom maps are inverse and preserve labels, identities, composition and inverses.
5. Construct the inverse objects as stated. The frame e gives the native root isomorphism to the reconstructed object; the unit/counit triangles reduce to actual line-frame inverse identities.

**Direct dependencies.** `FunctionFieldArithmeticPartII:RS.0/native-framed-category`, `FunctionFieldArithmeticPartII:RS.0/root-identification-unit`, `FunctionFieldArithmeticPartII:RS.0/root-trivialization-equation`, `FunctionFieldArithmeticPartII:RS.0/root-arrow-scalars`, `FunctionFieldArithmeticPartII:RS.0/section-power-in-trivialization`, `FunctionFieldArithmeticPartII:RS.0/section-power-transport`, `FunctionFieldArithmeticPartII:RS.0/framed-groupoid`, `SchemeAndStackFoundations:SF.3`, `mathlib:AlgebraicGeometry.Scheme.ΓSpecIso`, `tauceti:TauCeti.SheafOfModules.freePUnitIsoUnit`.

**Uses.** AGV B.2, pp.53–54: The native line-root data must agree with affine local coordinates without discarding automorphisms.; FunctionFieldArithmeticPartII:RS.0/native-chart-realization: Realizes the accepted coordinate chart as actual native root data.

**API.**

| Declaration | Role and statement |
| --- | --- |
| `TauCeti.RootStack.framedNativeEquiv` | constructor: The groupoid equivalence E_l with the explicitly prescribed inverse. |
| `TauCeti.RootStack.framedNativeEquiv_coordinate` | projection: The root coordinate is coord(e(t)); the unit coefficient is that of lφ(e^{-1})^n c_n^{-1}. |
| `TauCeti.RootStack.framedNativeEquiv_arrow` | projection: The arrow label is the scalar of e_b h e_a^{-1}, satisfying both displayed equations. |
| `TauCeti.RootStack.framedNativeEquiv_inverse` | constructor: A coordinate pair gives O, the section with coordinate y and identification l^{-1} mul(u) c_n. |
| `TauCeti.RootStack.framedNativeEquiv_homEquiv` | equivalence: The unit-label formula and w↦e_b^{-1} mul(w) e_a are mutually inverse Hom maps. |
| `TauCeti.RootStack.framedNativeEquiv_unitCounit` | compatibility: The actual frame isomorphisms give unit and counit, preserving t and φ and satisfying the triangles. |

**Unit tests.**

- `TauCeti.RootStack.framedNativeEquiv.test_nonnormalized` (non-example): Over Z/4,n=2,f=3,u=3,y=1 the equivalence produces a native root despite absence of a normalized chart point.
- `TauCeti.RootStack.framedNativeEquiv.test_zero_arrows` (non-example): For n=2,y=0 over Z/4 the distinct unit labels1 and−1 remain distinct actual root arrows.
- `TauCeti.RootStack.framedNativeEquiv.test_nilpotent` (computation): For n=2,f=0 over Z/9 the native roots with coordinates3 and0 are not isomorphic.
- `TauCeti.RootStack.framedNativeEquiv.test_recovery` (compatibility): Applying the coordinate equivalence to its prescribed inverse recovers the same (u,y) and every unit arrow w.

**Acceptance.**

- Full faithfulness is a bijection of labelled arrows, including at y=0.
- No n-th root of u is chosen in this equivalence.
- For u=3,y=1,n=2,f=3 over Z/4 the equivalence has an object, although the normalized chart has no B-point.
- For n=2,f=0 over Z/9 the roots y=3 and y=0 remain nonisomorphic.

**Source support.** [AGV08](https://arxiv.org/pdf/math/0603151v2), Appendix B.1–B.2, printed pp. 52–54: The triple definition and local quotient calculation support this coordinate deduction. The unit coefficient and complete Hom equivalence make the implicit trivialization computation explicit. The corrected exponent d from inherited E12 is used.

### 6. Coordinates under changes of source and target frames

Target `native-frame-change` (comparison); proposed declaration `TauCeti.RootStack.framedNativeEquiv.changeFrames`.

If e′=mul(a)∘e and l′=mul(b)∘l for units a,b∈Bˣ, the same root has coordinates y′=a*y, u′=b*u*a^{-n}, f′=b*f. This induces a groupoid equivalence from the framed coordinates for l to those for l′, with object formula (u,y)↦(b*u,y) when e is retained. Changing root frames e_p,e_q by a_p,a_q changes an arrow label to w′=a_q*w*a_p^{-1}. Both arrow equations are preserved. Root-frame changes with b=1 are connected by the identity native root arrow, whose coordinate label between the two readings is a. These comparisons have inverse unit formulas and composition cocycles.

**Hypotheses and conventions.**

- Use the conventions of native-framed-equivalence. n≥1; no condition on section y.
- The target unit b is common to the source and target of a root arrow.

**Proof or construction.**

1. Conjugate the scalar power identification by c_n and the two changed frames. The parent section-power transport gives (mul(a))^n=mul(a^n) under c_n, so the coefficient becomes b*u*a^{-n}.
2. Conjugating e_q∘h∘e_p^{-1} gives w′=a_q*w*a_p^{-1}. Substitute this into both arrow equations; cancel only the named units.
3. Compose frame changes by multiplying a and b. The identity native root arrow compares different readings of the same root, and its power square supplies u′*a^n=b*u.
4. These are calculations from the imported section/unit comparison, not new general scalar-automorphism or tensor coherence APIs.

**Direct dependencies.** `FunctionFieldArithmeticPartII:RS.0/native-framed-equivalence`, `FunctionFieldArithmeticPartII:RS.0/section-power-transport`, `FunctionFieldArithmeticPartII:RS.0/root-identification-unit`, `FunctionFieldArithmeticPartII:RS.0/framed-groupoid`.

**Acceptance.**

- At y=0 the u equation still carries information.
- Over Q, n=2, u=1,y=1,f=1, a=2,b=1 gives u′=1/4,y′=2; omitting a^{-n} breaks the root equation.
- For e_p changed by2 and e_q unchanged, w=1 becomes w′=1/2.
- Target-frame changes require no root of b until one insists on normalized coefficient1.

**Source support.** [AGV08](https://arxiv.org/pdf/math/0603151v2), Appendix B.1–B.2, printed pp. 52–54: The G_m quotient and power action in B.1–B.2 lead to these gauge formulas. The signs and factors are authored computations with the fixed source/target coordinate conventions.

### 7. Native coordinates commute with arbitrary test-algebra change

Target `native-coefficient-naturality` (comparison); proposed declaration `TauCeti.RootStack.framedNativeEquiv.baseChange`.

Fix A,f,n≥1 and the trivial target pair on Spec A. For every A-algebra map ψ:B→C, pull chosen native root frames along Spec ψ using the canonical pulled-unit comparison. The square between E_B,E_C, native framed-root pullback and the parent framedRootChange(ψ) commutes by a specified natural isomorphism. Coordinates become (ψ(u),ψ(y)); every arrow label becomes ψ(w). The natural isomorphism preserves both section and power identification, has the native pullback comparison as underlying line map, and obeys identity/composition coherence in ψ. It is compatible with the parent normalizationBaseChangeNatIso and normalization chart triangles.

**Hypotheses and conventions.**

- A,B,C are arbitrary commutative rings, with the stated algebra maps; ψ need not be injective or flat.
- The chosen target frame on every test is pulled from Spec A, so the coordinate of the target section is the image of f.

**Proof or construction.**

1. The supplier’s pulled-unit comparison transports e to a frame of the pulled line. The section map and ΓSpecIso_naturality identify its coordinate with ψ(y).
2. Transport the actual power-identification automorphism using κ; the unit and tensor coherence identify its image-of-one coefficient with ψ(u). The same argument for e_q∘h∘e_p^{-1} gives ψ(w).
3. Use the parent framed change functor rather than redefining ring substitution. Construct the square’s comparison as the actual pulled-line comparison and verify the two root-arrow equations.
4. Root pseudofunctor coherence proves identity/composition compatibility. The normalization algebra sends coefficients through ψ and T to T by the parent’s construction; its generator equations identify the normalization and chart triangles.

**Direct dependencies.** `FunctionFieldArithmeticPartII:RS.0/native-root-coherence`, `FunctionFieldArithmeticPartII:RS.0/native-framed-equivalence`, `FunctionFieldArithmeticPartII:RS.0/native-power-pullback`, `FunctionFieldArithmeticPartII:RS.0/framed-normalization-change`, `FunctionFieldArithmeticPartII:RS.0/normalization-base-change-natural-iso`, `FunctionFieldArithmeticPartII:RS.0/normalization-change-chart-factorization`, `mathlib:AlgebraicGeometry.Scheme.ΓSpecIso_naturality`, `SchemeAndStackFoundations:SF.3`.

**Acceptance.**

- Z/4→Z/2 kills y=2 and the nonidentity label−1 while all comparison diagrams commute.
- The zero-ring spectrum gives empty-site computations without a Nontrivial ring assumption.
- Wild characteristic is permitted; no assertion that μ_n is etale is used.

**Source support.** [AGV08](https://arxiv.org/pdf/math/0603151v2), Appendix B.1–B.2, printed pp. 52–54: Base change of the triple is described in Appendix B; coordinate naturality is deduced using the imported section and unit comparisons.; [TV17](https://arxiv.org/pdf/1410.1164v2), §3, Remark 3.1 and Proposition 3.4, pp. 12–13; Corollary 3.13, p. 16: Proposition 3.4 confirms the expected finite-root base-change behaviour; our pair-level square explicitly includes all arrows.

### 8. The affine chart as actual native root data

Target `native-chart-realization` (construction); proposed declaration `TauCeti.RootStack.rootChartRealization`.

For A,f,n≥1 and every A-algebra B, construct C_B from the parent root-point action groupoid Q(B) to Root(Spec B,O,f,n). A point z with z^n=f becomes M=O, the section with coordinate z, and φ=c_n. An arrow labelled ζ∈μ_n(B) acts by multiplication by ζ on O. Its section and power squares give the actual root arrow. This is the composite of the parent normalized chart embedding, E_B^{-1} and forgetting the frame. It is fully faithful, but it need not be essentially surjective on B. These functors are pseudonatural on arbitrary test-algebra maps with the native comparisons of the preceding targets.

**Hypotheses and conventions.**

- Q(B) is FunctionFieldArithmeticPartII:RS.2/root-point-groupoid, retaining labelled arrows; use its actual root-point carrier.
- The point z lies in the parent affine ring A[Z]/(Z^n−f) functor of points. No effective Cartier divisor hypothesis is used.

**Proof or construction.**

1. Apply the existing normalized chart embedding into FramedRoot; its coefficient is1 and its root coordinate is z.
2. Use the inverse native coordinate equivalence and forget the chosen frame. This gives the exact trivial line, section and c_n identification, with all scalar arrows intact.
3. Full faithfulness is the composite of the parent’s fully faithful embedding, the equivalence, and the fully faithful forgetful functor. Naturality uses native-coefficient-naturality.
4. The Z/4 obstruction and nontrivial root lines show why objectwise essential surjectivity is not asserted; the local normalization theorem supplies the relevant local statement.

**Direct dependencies.** `FunctionFieldArithmeticPartII:RS.0/framed-chart-embedding`, `FunctionFieldArithmeticPartII:RS.0/framed-fully-faithful`, `FunctionFieldArithmeticPartII:RS.2/root-point-groupoid`, `FunctionFieldArithmeticPartII:RS.0/native-framed-equivalence`, `FunctionFieldArithmeticPartII:RS.0/native-framed-category`, `FunctionFieldArithmeticPartII:RS.0/native-coefficient-naturality`, `FunctionFieldArithmeticPartII:RS.0/trivial-power-isomorphism`.

**Uses.** AGV B.2, p.54: The affine presentation has an actual map to the root moduli groupoid.; FunctionFieldArithmeticPartII:RS.0/native-stackification-equivalence: Full faithfulness and local essential surjectivity identify the associated stack.

**API.**

| Declaration | Role and statement |
| --- | --- |
| `TauCeti.RootStack.rootChartRealization` | constructor: The actual root-object functor C_B, with its pseudonatural comparison maps. |
| `TauCeti.RootStack.rootChartRealization_line` | projection: The line of every chart image is native O. |
| `TauCeti.RootStack.rootChartRealization_section` | projection: The section coordinate is the actual point’s root image z. |
| `TauCeti.RootStack.rootChartRealization_identification` | projection: Its power identification is c_n and hence has coefficient1. |
| `TauCeti.RootStack.rootChartRealization_arrow` | simp: A μ_n arrow is the actual line automorphism multiplication by its unit label. |
| `TauCeti.RootStack.rootChartRealization_fullyFaithful` | equivalence: For each pair of chart points the Hom map is bijective and preserves unit labels; it is not a quotient by their action on sections. |

**Unit tests.**

- `TauCeti.RootStack.rootChartRealization.test_one` (degenerate): For n=1, the chart point is f and every automorphism label is1.
- `TauCeti.RootStack.rootChartRealization.test_stabilizer` (non-example): At n=2,z=0 over Z/4 the labels1 and−1 remain different native arrows.
- `TauCeti.RootStack.rootChartRealization.test_not_surjective` (non-example): Over Z/4,n=2,f=3 the native root with trivial line,u=3,y=1 exists, but z^2=3 has no solution, so C_B is not essentially surjective.
- `TauCeti.RootStack.rootChartRealization.test_nilpotent` (computation): Over Z/9,n=2,f=0, z=3 and z=0 give nonisomorphic roots: a unit cannot send3 to0.

**Acceptance.**

- The full Hom bijection retains every stabilizer label.
- The construction agrees with the native O and with the parent normalized FramedRoot inclusion.

**Source support.** [AGV08](https://arxiv.org/pdf/math/0603151v2), Appendix B.1–B.2, printed pp. 52–54: Appendix B.2, p.54 gives the affine root equation and quotient description; this construction supplies its native root-object functor.

### 9. Every native root has local normalized affine coordinates

Target `native-local-normalization` (theorem); proposed declaration `TauCeti.RootStack.RootObject.exists_fppf_chart`.

For any scheme T and native root (M,t,φ) of (L,s), n≥1, there is an fppf covering of T refining an affine Zariski covering which trivializes both M and L. On each affine member Spec B, native coordinates give (u,y) with u∈Bˣ and u*y^n=f. Refine it by the parent singleton cover Spec D→Spec B, D=B[T]/(T^n−u). The existing unit r=T in D has r^n=u, and the pulled root is isomorphic to the native chart image with coordinate r*y and coefficient1. The root isomorphism has label r. The construction retains both arrow equations and is stable under arbitrary pullback of test schemes; it asserts existence of local frames, not a functorially chosen global frame.

**Hypotheses and conventions.**

- T is an arbitrary scheme; no reducedness, noetherianity or flatness of test changes is assumed.
- Invertible sheaves, sections, tensor products and isomorphisms use the native Tau Ceti/Mathlib carriers.
- n≥1. The family of affine trivializing opens can have arbitrary size allowed by the site; T need not be quasi-compact.
- A positive exponent is essential for the finite-free unit-root cover; zero is not a covering exponent.

**Proof or construction.**

1. Use the existing local trivialization atlases of M and L, intersect their opens, and refine by affine opens. Restriction/pullback comparison with native modules comes from AlgebraicVectorBundles, not a new general local-freeness theory.
2. Read the two frames through the native equivalence. Apply the parent positive-exponent finite-free, finite-presentation and singleton-cover package to the unit coefficient u.
3. The parent normalized framed isomorphism has label r; its equations are r*y for the section and 1*r^n=u for the identification. Transport it back to a native root isomorphism using the Hom equivalence.
4. Zariski covers are fppf and the fppf precoverage is closed under composition and base change. Pull chosen covers back and use the parent Cartesian normalization square; no canonical global choice or flatness of the test change is needed.

**Direct dependencies.** `tauceti:TauCeti.SheafOfModules.LocalTrivializations.ofIsInvertible`, `FunctionFieldArithmeticPartII:RS.0/native-root-pullback`, `FunctionFieldArithmeticPartII:RS.0/native-framed-equivalence`, `FunctionFieldArithmeticPartII:RS.0/native-chart-realization`, `FunctionFieldArithmeticPartII:RS.0/native-coefficient-naturality`, `FunctionFieldArithmeticPartII:RS.0/framed-fppf-cover`, `FunctionFieldArithmeticPartII:RS.0/framed-normalization-iso`, `mathlib:AlgebraicGeometry.Scheme.zariskiPrecoverage_le_fppfPrecoverage`, `mathlib:AlgebraicGeometry.Scheme.affineCover`.

**Acceptance.**

- Z/4,n=2,u=3,y=1 normalizes over D although it cannot normalize over B.
- If n=p in characteristic p, D still gives a valid fppf cover; no etale assertion is made.
- At y=0 no cancellation by y occurs, so all μ_n stabilizers survive.
- For a nonzero square-zero y its normalization r*y remains nonzero under the faithfully flat cover because r is a unit.

**Source support.** [AGV08](https://arxiv.org/pdf/math/0603151v2), Appendix B.1–B.2, printed pp. 52–54: The quotient presentation relies on local trivializations; this target supplies the exact root-specific cover and isomorphism.; [STACKS-KUMMER](https://stacks.math.columbia.edu/tag/040N), Lemma 59.28.3, Tag 040N, complete proof; online, no fixed pagination: For positive n the unit-root algebra is finite free of rank n and gives a faithfully flat finitely presented cover. Applying that cover after line trivialization is our pair-level deduction.

### 10. Affine action charts stackify to native root objects

Target `native-stackification-equivalence` (theorem); proposed declaration `TauCeti.RootStack.rootChart_stackification_isEquivalence`.

Fix A,f and n≥1. On the fppf site of affine A-schemes let Q be the parent μ_n action-groupoid prestack of points of Spec A[Z]/(Z^n−f), and R the restriction of the native root-object pseudofunctor for (O,f). The native chart realization Q→R is fully faithful on every fibre and locally essentially surjective. Using the parent root-fpqc-descent theorem and the imported stackification, its extension a_fppf(Q)→R is an equivalence of stacks in groupoids. Its unit/counit and base-change comparisons lift the actual labelled chart arrows and are pseudonatural in arbitrary coefficient maps. Restriction from the scheme site to the affine basis gives the same stack through the supplier’s site-basis comparison. This is the native comparison underlying the parent RS.1 affine-chart statement, not a new generic quotient or algebraicity theorem.

**Hypotheses and conventions.**

- A is any commutative ring, including nonreduced rings; n≥1 and f arbitrary.
- Use the fppf topology and actual groupoid-valued pseudofunctors; the objectwise orbit set is not the input.
- The native root stack is supplied by the parent descent target. Algebraic atlases, coarse spaces and DM criteria remain owned by RS.1 and its suppliers.

**Proof or construction.**

1. Reuse the parent fpqc root-descent theorem; its restriction is an fppf stack. Its exact module-descent supplier is R09.3, so effective descent is not inferred merely from a chart.
2. Full faithfulness follows from native-chart-realization and the Hom equations. Local essential surjectivity is native-local-normalization on the affine basis.
3. Apply Stacks Lemma8.9.1 via D0’s stackification: Q has sheaf Hom sets since it embeds fully faithfully into the stack R. The morphism Q→R has the two characterizing properties, so the induced stackification comparison is an equivalence.
4. The universal property gives the actual equivalence and invertible modifications; it also compares the coefficient-change extensions. Use the requested affine-basis comparison to extend to test schemes, rather than equating an affine site with the full site.

**Direct dependencies.** `FunctionFieldArithmeticPartII:RS.0/native-root-coherence`, `FunctionFieldArithmeticPartII:RS.0/native-chart-realization`, `FunctionFieldArithmeticPartII:RS.0/native-local-normalization`, `FunctionFieldArithmeticPartII:RS.0/native-coefficient-naturality`, `FunctionFieldArithmeticPartII:RS.1/root-fpqc-descent`, `DiamondsAndVStacks:D0/stackification`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `SchemeAndStackFoundations:SF.1`, `mathlib:AlgebraicGeometry.Scheme.fppfTopology`.

**Acceptance.**

- The Z/4,f=3,n=2 root is a global object of the associated stack even though Q(B) is empty.
- The zero-section automorphism sheaf is μ_n and persists after stackification.
- Nonzero nilpotent root sections are not replaced by zero-section data.
- The wild characteristic p dual-number unit1+ε survives as an arrow when ε^2=0 and n=p.

**Source support.** [AGV08](https://arxiv.org/pdf/math/0603151v2), Appendix B.1–B.2, printed pp. 52–54: The root-with-section affine quotient is the motivating statement; our comparison proves that it uses native triples and their arrows.; [STACKIFICATION](https://stacks.math.columbia.edu/tag/02ZO), Lemmas 8.9.1–8.9.3, §8.9 Tag 02ZO and Lemma 8.9.1 Tag 02ZP; online, no fixed pagination: Stackification retains sheafified Hom sets and adds locally represented objects; its universal property gives the comparison. No isomorphism-class sheaf replaces it.

### 11. Descent comparison for different target-line frames

Target `native-chart-frame-independence` (comparison); proposed declaration `TauCeti.RootStack.rootChartFrameEquiv`.

For an affine open with two target frames l and l′=mul(b)∘l, n≥1, the associated stacks of normalized charts with equations z^n=f and z′^n=b*f are canonically equivalent through their respective native-root comparisons. Explicitly, over B[R]/(R^n−b), the comparison is z′=R*z, and its inverse is z=R^{-1}*z′. On two choices R_1,R_2 the ratio R_2/R_1 lies in μ_n and supplies the chart-arrow modification. On triple frame overlaps those modifications satisfy the root-arrow cocycle, so the associated stack glues to the native root-object stack for a nontrivial target line. No global n-th root of b, equality of the two raw affine charts or globally selected compatible frame roots is required.

**Hypotheses and conventions.**

- The frames concern the same target line with section; transitions are actual units. n≥1.
- Charts are compared after fppf stackification; all comparison arrows and their cocycles are retained.

**Proof or construction.**

1. Use native-frame-change to identify framed coordinates under l,l′. The two stackification equivalences land in the same native root groupoid, so their composite defines the canonical stack equivalence.
2. Normalize the changed coefficient b with the positive-exponent Kummer cover. The direct native identity-arrow comparison reads as multiplication by R on normalized chart coordinates.
3. Ratios of two unit roots have n-th power1. They are the invertible modification between local chart maps; at zero sections their labels must still be recorded.
4. On triple overlaps compose the identity native root arrows; full faithfulness recovers their coordinate cocycle, even when chosen roots do not multiply strictly. Descend the equivalence, not an arbitrary chosen global root of the transition unit.

**Direct dependencies.** `FunctionFieldArithmeticPartII:RS.0/native-frame-change`, `FunctionFieldArithmeticPartII:RS.0/native-stackification-equivalence`, `FunctionFieldArithmeticPartII:RS.0/native-local-normalization`, `FunctionFieldArithmeticPartII:RS.0/framed-normalization-iso`, `DiamondsAndVStacks:D0/stackification`.

**Acceptance.**

- Over Q,n=2,b=−1 the normalized raw chart equations f=1 and f′=−1 have different Q-points but their associated stacks describe the same native pair through the two target frames.
- At z=0 two roots R_1,R_2 induce different μ_n modification labels although both section maps give0.
- A four-open refinement gives the same descended comparison after the specified modifications.

**Source support.** [AGV08](https://arxiv.org/pdf/math/0603151v2), Appendix B.1–B.2, printed pp. 52–54: B.1–B.2 express the root moduli problem independently of trivializations. The transition-cover and ratio formulas are authored coordinate deductions.; [STACKIFICATION](https://stacks.math.columbia.edu/tag/02ZO), Lemmas 8.9.1–8.9.3, §8.9 Tag 02ZO and Lemma 8.9.1 Tag 02ZP; online, no fixed pagination: The universal comparison makes the frame-independent equivalence an equivalence of stacks, retaining the local modifications.

### 12. Coherence of normalization covers for arbitrary finite chains

Target `native-finite-normalization-coherence` (comparison); proposed declaration `TauCeti.RootStack.normalizationFiniteBaseChange_coherent`.

For a fixed parent framed root p and a finite chain of arbitrary test-algebra maps B_0→…→B_m, m≥0, use the parent normalization change maps to compare the normalization of the fully changed p with every parenthesization of the iterated chosen scheme pullback of its original cover. The comparison is the unique isomorphism with the prescribed projections to Spec B_m and the original normalization scheme. It agrees with the direct parent normalizationBaseChangeIso for the composite chain after each canonical pullback collapse. All forward/inverse projection formulas, naturality for every labelled framed arrow, insertion of identities and composition of chains agree; for n≥1 the normalized-chart triangle agrees as well. The scheme comparison alone allows n=0. This extends the accepted two- and three-step specifications rather than restating them.

**Hypotheses and conventions.**

- No flatness or injectivity is imposed on any B_i→B_(i+1).
- Use the native chosen pullbacks and their actual associator/pasting isomorphisms; no definitional equality of different chosen limits is asserted.
- For n=0 no fppf-cover or chart-normalization claim is made.
- Scheme-level arrow naturality uses the parent's `normalization-change-arrow`, valid for every natural exponent. Its bundled `normalization-base-change-natural-iso` is used only for n≥1.

**Proof or construction.**

1. Compose the parent normalization-change algebra maps. Identity and composition are already specified there, so coefficients and the adjoined root identify the direct composite map.
2. Inductively paste the Cartesian coefficient squares and use the native pullback universal property to form the comparison to each chosen bracketing.
3. Every comparison has the same two composite projections. Repeated pullback.hom_ext proves equality of comparison morphisms, inverses and all rebracketing diagrams. For every n, the parent's normalization-change-arrow proves the arrow square before taking Spec: coefficients follow the test-algebra map and the target adjoined root maps to the source adjoined root times the inverse unit label. Applying Spec and comparing both pullback projections proves arrow naturality. For n≥1 this agrees with the parent's bundled natural isomorphism.
4. For n≥1 the parent chart triangle and the same projection characterization carry the normalized chart map through the finite composite. The proof never cancels the root section.

**Direct dependencies.** `FunctionFieldArithmeticPartII:RS.0/normalization-change-map`, `FunctionFieldArithmeticPartII:RS.0/normalization-change-identity`, `FunctionFieldArithmeticPartII:RS.0/normalization-change-composition`, `FunctionFieldArithmeticPartII:RS.0/normalization-change-arrow`, `FunctionFieldArithmeticPartII:RS.0/normalization-base-change-natural-iso`, `FunctionFieldArithmeticPartII:RS.0/normalization-change-iso`, `FunctionFieldArithmeticPartII:RS.0/normalization-change-chart-factorization`, `mathlib:CategoryTheory.Limits.pullback.hom_ext`.

**Acceptance.**

- m=0 gives the identity comparison, after the empty-chain convention.
- m=2 and m=3 reproduce the parent comparisons on both projections and both inverse projections.
- For a chain Z/4→Z/2→Z/2→Z/2→Z/2 all formulas hold although nilpotent sections and the −1 stabilizer collapse at its first map.
- The n=0 algebra comparison remains valid without being a cover.
- At n=0 over Q, with u=f=2, the normalization algebra is Q[T]/(1−2)=0. Its empty spectrum still satisfies the base-change comparison, but cannot cover Spec Q.

**Source support.** [TV17](https://arxiv.org/pdf/1410.1164v2), §3, Remark 3.1 and Proposition 3.4, pp. 12–13; Corollary 3.13, p. 16: Proposition 3.4 motivates coefficient compatibility. The arbitrary finite chosen-limit coherence is our induction from the parent’s ring-map universality and native pullback uniqueness, not a printed root-stack theorem.

### 13. Root comparisons under coherent enlargement of ambient universes

Target `native-universe-adapter` (construction); proposed declaration `TauCeti.RootStack.RootObject.universeEquiv`.

For a small scheme site and an enlargement u≤v, import the coherent universe-lift functor on schemes, native modules and invertible sheaves, together with section, tensor, Spec/Γ and pullback comparisons. Restrict the enlarged test site to the essential image of the original site. Applying these comparisons to the parent root data gives an equivalence between the original root groupoid and the lifted root groupoid, commuting with all arrows, frames, κ, chart realization and stackification. On a ring B this is the comparison with ULift B via the actual ring equivalence; units and root coordinates map through that equivalence. Identity and successive enlargement comparisons satisfy triangle/pentagon coherence. This statement is not an equivalence between all small and all larger test schemes.

**Hypotheses and conventions.**

- Specify u≤v and the essential-image site, or an explicit small skeleton and its induced topology.
- The supplier’s lift preserves the native geometric carriers and covering families and comes with coherent operation comparisons; a scalar-point wrapper alone is insufficient.
- On every matched test scheme, require an equivalence of the full invertible-sheaf groupoids and bijections on their sections and arrows. Every enlarged invertible sheaf must be isomorphic to a lifted small one. An inverse defined only on the image of the module lift does not establish this requirement; no equivalence of all module categories across universes is assumed.

**Proof or construction.**

1. Request generic native scheme/module universe comparisons from SF.0 and descent transport along the resulting equivalence of sites from D0. Those generic constructions are owned there, not recreated here.
2. Lift M,t,φ using the section and tensor comparisons; these carry φ(t^n)=s to the identical typed root equation in the enlarged universe. Lift h and both arrow squares in the same way.
3. Use essential surjectivity of the supplied invertible-sheaf lift on each matched scheme to recover a small root line. Its section bijection recovers t; full faithfulness, together with the tensor and target-line comparisons, recovers φ and every root arrow. Faithfulness reflects the section equation and both arrow equations. Thus the inverse recovers all enlarged roots on that test scheme, rather than only roots already in the lift's image.
4. The supplier’s pullback comparisons transport the root pseudofunctor, κ and frame equivalence; D0’s equivalent-site transport and stackification universal property transport native-stackification-equivalence.
5. Underlying coherent lift maps satisfy triangle/pentagon, hence so do their root restrictions. Genuine new larger test objects are handled by the formula of the native root pseudofunctor at that universe, not asserted to come from the small site.

**Direct dependencies.** `FunctionFieldArithmeticPartII:RS.0/native-root-coherence`, `FunctionFieldArithmeticPartII:RS.0/native-framed-equivalence`, `FunctionFieldArithmeticPartII:RS.0/native-coefficient-naturality`, `FunctionFieldArithmeticPartII:RS.0/native-stackification-equivalence`, `SchemeAndStackFoundations:SF.0`, `DiamondsAndVStacks:D0`.

**Uses.** FunctionFieldArithmeticPartII:RS.0, higher-universe adapters: Makes native root comparisons usable at the site universes of ordinary stack suppliers.; FunctionFieldArithmeticPartII:RS.2: Supplies finite-level typed root comparisons; coherent infinite reindexing and genuine 2-limits remain RS.2 targets.

**API.**

| Declaration | Role and statement |
| --- | --- |
| `TauCeti.RootStack.RootObject.universeEquiv` | constructor: The equivalence on matched native test schemes built from the supplier’s carrier lifts. |
| `TauCeti.RootStack.RootObject.universeEquiv_line` | projection: Its line is the lifted native invertible sheaf. |
| `TauCeti.RootStack.RootObject.universeEquiv_section` | compatibility: The actual lifted section is compared through the supplier’s section equivalence. |
| `TauCeti.RootStack.RootObject.universeEquiv_identification` | compatibility: The lifted identification uses the tensor-power comparison, with direction fixed as in κ. |
| `TauCeti.RootStack.RootObject.universeEquiv_arrow` | functoriality: Lift an actual line isomorphism and both root-arrow equations, preserving identities and composition. |
| `TauCeti.RootStack.RootObject.universeEquiv_comp` | compatibility: Two successive enlargements agree with the direct enlargement through the supplier’s coherent natural isomorphism. |

**Unit tests.**

- `TauCeti.RootStack.RootObject.universeEquiv.test_identity` (degenerate): An identity universe enlargement gives the identity root equivalence through the stated unit comparison.
- `TauCeti.RootStack.RootObject.universeEquiv.test_ring` (compatibility): For B and ULift B the coordinates (u,y,w) become their images under the actual ring and unit equivalences; the equations are mapped literally.
- `TauCeti.RootStack.RootObject.universeEquiv.test_stabilizer` (non-example): The distinct labels1 and−1 at y=0 over Z/4 remain distinct after enlargement.
- `TauCeti.RootStack.RootObject.universeEquiv.test_site` (non-example): An enlarged-universe test scheme outside the essential image is not declared equivalent to a small test scheme merely because the root formulas look the same.

**Acceptance.**

- The site being compared must be named, not silently enlarged.
- Unit labels, including stabilizers, are transported bijectively on each matched test object.
- On a matched test scheme the inverse must recover any enlarged invertible root line up to isomorphism, not only lines presented as lifts; this is required from UNIVERSE-GEOMETRY-RS0.

**Source support.** [AGV08](https://arxiv.org/pdf/math/0603151v2), Appendix B.1–B.2, printed pp. 52–54: The root datum is intrinsic line, section and isomorphism data; universe transport is an authored formalization adapter based on the requested carrier equivalences, not a theorem printed in Appendix B.; [STACKIFICATION](https://stacks.math.columbia.edu/tag/02ZO), Lemmas 8.9.1–8.9.3, §8.9 Tag 02ZO and Lemma 8.9.1 Tag 02ZP; online, no fixed pagination: The stackification universal characterization transports across equivalent sites; it does not identify sites with different objects.

## Native signatures and the compilation boundary

The suggested file uses real ring, unit, native scheme/module and invertible-sheaf types at the atlas pins. It contains coordinate end conditions for changes of frames and coefficients, normalization and transition-root ratios, together with native carrier checks and worked examples. Those scalar signatures are representative consequences of the native targets. They neither define a replacement root groupoid nor certify its geometric comparison.

The complete native domains and codomains are pinned by the thirteen target statements above: κ is an isomorphism between actual invertible sheaf powers; root pullback is a functor between actual Root groupoids; coherence concerns their specified natural transformations; FramedNativeRoot has actual native roots and frames, with unchanged Hom sets; E_l is a groupoid equivalence; the coefficient comparison is a natural isomorphism between actual pullback/coordinate functors; the chart realization is a fully faithful functor from the parent's action groupoid; local normalization is a covering-and-root-isomorphism theorem; stackification is an equivalence of groupoid-valued stacks; chart-frame independence compares those actual stacks and their modifications; finite normalization coherence is equality of actual chosen-pullback comparison isomorphisms; the universe adapter is a groupoid equivalence on matched lifted test objects.

All thirteen whole native signatures are README targets at the old compilation pins. Their root carriers or requested monoidal/section, stackification or universe comparisons are absent there. Each of the six definition/construction targets has all six API items and all four tests listed by exact name above; every one of those native API/test signatures belongs to the same README-only carrier boundary. The other seven theorem/comparison targets have their complete hypotheses, proof outline, dependencies and acceptance conditions above. This is the exhaustive omission ledger: no target or API/test is replaced by an arbitrary proposition or admitted data definition. The suggested file lists the same thirteen targets individually.

The coordinate end conditions are `frameChange_equation`, `frameChange_arrow`, `coefficientChange_equation`, `coefficientChange_arrow`, `localNormalization_equation` and `transitionRoot_ratio` in the suggested namespace `TauCeti.RootStack.RS0NativeSuggested`. Their names identify representative scalar statements; the proposed native names in the target list remain the interface names. Current upstream native coordinates and ordinary line pullback are imported by the plan, not copied into a file compiled at the older pins.

## Supplier contracts and discharge criteria

- **JAC-A-RS0**, supplier `SchemeAndStackFoundations:SF.3`: Integrate, without replanning, AlgebraicVectorBundles L0A–L0B tensorSection, the unit comparison and coherent strong symmetric monoidal module pullback on native InvertibleSheaf. Supply explicit pure-tensor coordinate multiplication, unit-section coordinate1, naturality under actual module maps and section-pullback compatibility with unit/tensor and identity/composition comparisons. Reuse current native trivializationCoordinate and unitsGlobalSectionsMulEquivAut; their generic definitions are already implemented. This refines parent JAC-A only at its still-needed section/tensor comparison boundary. Fix β₀:h*O_T≅O_Y and β₂:h*(M⊗N)≅h*M⊗h*N, so the root-power recursion uses their inverses. Consumers: `native-power-pullback`, `native-framed-equivalence`, `native-coefficient-naturality`.
- **AFFINE-BASIS-RS0**, supplier `SchemeAndStackFoundations:SF.1`: Supply restriction/extension equivalence for groupoid-valued stacks between the scheme fppf site over X and its affine test basis, with the topology induced by covering refinements, and compatibility with the chosen native module and section pullbacks. Reuse native fppf/fpqc topologies and effective module descent from R09.3; this is a generic site-basis adapter, not a second root-stack or quotient definition. Consumers: `native-stackification-equivalence`.
- **UNIVERSE-GEOMETRY-RS0**, supplier `SchemeAndStackFoundations:SF.0`: Coherent ambient-universe lifts of native schemes/modules/invertible sheaves on a fixed small site, with inverse equivalences on their essential images and comparison isomorphisms for sections, units, tensor, Spec/Γ and pullback. On each matched test scheme, additionally require essential surjectivity onto the full enlarged invertible-sheaf groupoid, full faithfulness and section bijections, compatible with those comparisons. An image-only inverse for module lifts is insufficient for the root-groupoid equivalence; no equivalence of all module categories across universes is requested. Specify actual carriers and identity/composition diagrams. Restrict the test-site equivalence to the lifted site, not all genuinely larger test schemes. Consumers: `native-universe-adapter`.
- **UNIVERSE-STACKS-RS0**, supplier `DiamondsAndVStacks:D0`: Transport groupoid-valued pseudofunctors, covering topologies, IsStack and stackification across an equivalence with the essential-image lifted site, including strong transformations and invertible modifications. Root-specific transport uses this generic adapter; no equality between all universe levels of schemes is asserted. Consumers: `native-universe-adapter`.

The monoidal section request must supply its actual maps and equations before κ's section law can be instantiated. An abstract assertion that line pullback exists is not this input. The affine-basis request must compare the induced covering topologies and descent categories; restricting scalar tests alone is not a basis theorem. The universe requests must give native carrier and operation comparisons, the equivalence of the named essential-image sites, and an equivalence on all invertible sheaves in each matched fibre. The latter may be established using small affine trivializing covers and descent in the supplier; it is an explicit input here. They make no assertion about unrelated larger test objects.

With those supplied interfaces, all targets in the stage are planned at target level. Its coverage status is planned, with the exact supplier integration and native signature boundary recorded. The packet is a complete planning pass; it is not a closed or implemented library. RS.1 and RS.2 have their own geometric and infinite targets and suppliers. Formal proofs are the work the assembled roadmap specifies, rather than an additional blueprint node for each routine induction step.

A discharge of RS.0 must verify both section and power-identification squares for every functor and natural comparison; retain labelled Hom bijections; prove local normalization using the actual positive-exponent cover; identify the associated stack via full faithfulness and local essential surjectivity into the already supplied root stack; and prove identity/composition, frame-transition and universe diagrams with their actual comparison maps. The tests over Z/4, Z/9, nonflat coefficient changes, infinitesimal μ_p, zero rings and exponent-zero tensor recursion are required at this boundary. Compiling coordinate signatures alone discharges none of the geometric assertions.

The four new atlas planets are Pullback of root objects, Root-coordinate equivalence, Local normalization of roots and Root-chart stackification. Together with the accepted parent’s Affine root coaction and Root objects in coordinates they give six planets for RS.0. The parent is unchanged.

## Sources and source corrections

The mathematics is stated in our own words. Appendix B of Abramovich–Graber–Vistoli supplies the line/section root data and quotient interpretation, with actual nilpotent section data; it does not state the native Lean comparison or universe adapters. Talpo–Vistoli's finite-root base-change and local-chart statements support the expected variance and arbitrary-characteristic comparison. Their logarithmic conventions do not replace the general line-with-section datum by an effective Cartier divisor hypothesis. The Stacks Kummer proof is used with n≥1; it supplies the unit-root cover even in wild characteristic. The native coefficient, frame, finite-chain and universe comparisons are deductions from those root definitions and the named imported interfaces, with the proofs outlined above.

- **AGV08**: Dan Abramovich, Tom Graber and Angelo Vistoli, [Gromov–Witten theory of Deligne–Mumford stacks](https://arxiv.org/pdf/math/0603151v2). arXiv:math/0603151v2, 13 April 2008; Appendix B. Read2026-10-14: Appendix B.1–B.2, printed pp.52–54, full root-definition and local-quotient passages; corrected exponent from inherited E12.
- **TV17**: Mattia Talpo and Angelo Vistoli, [Infinite root stacks and quasi-coherent sheaves on logarithmic schemes](https://arxiv.org/pdf/1410.1164v2). arXiv:1410.1164v2, 12 December 2017; published Proc. London Math. Soc. 116 (2018), 1187–1243. Read2026-10-14: §3 opening and Remark3.1, printed pp.12–13; Proposition3.4, p.13; finite-level local models and Corollary3.13, pp.14–16. Infinite-root results are read for the finite comparison context and are not newly planned.
- **YZ19**: Zhiwei Yun and Wei Zhang, [Shtukas and the Taylor expansion of L-functions (II)](https://math.mit.edu/~zyun/GZW_ramified_published.pdf). Annals of Mathematics 189 (2019), 393–526, published author-hosted copy. Read2026-10-14: Appendix A.1, DefinitionA.1 and A.1.1–A.1.3, printed pp.514–516; concrete section-root consumers and inherited E2/E5. No whole-paper audit.
- **STACKS-KUMMER**: The Stacks Project authors, [The Stacks Project: Kummer theory](https://stacks.math.columbia.edu/tag/040N). Online Lemma59.28.3, Tag040N; read2026-10-14. Read2026-10-14: Complete statement and proof of Lemma59.28.3, interpreted with n≥1 in the cover proof; the rank-n argument requires positivity.
- **STACKIFICATION**: The Stacks Project authors, [The Stacks Project: stackification of categories fibred in groupoids](https://stacks.math.columbia.edu/tag/02ZO). Online §8.9, Tags02ZO/02ZP; read2026-10-14. Read2026-10-14: Lemmas8.9.1–8.9.3, complete displayed statements and proofs; characterization, universal property and two-fibre-product compatibility. Tag04Y1, Lemma8.8.4 proof of compatibility, also read.
- **AVB**: The Tau Ceti roadmap contributors, [Tau Ceti roadmap: algebraic vector bundles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/AlgebraicVectorBundles/README.md). Current main 0d144d044dacebca17b654695b6f1ad58f159b27; read2026-10-14. Read2026-10-14: Inventory and native conventions; L0A–L0B; Suggested.lean tensorSection/tensorUnitIso, native monoidal pullback and rank-one comparisons, and the pullbackSectionMap/totalSpace universal-section interface. Not a claim that these targets are implemented at the atlas pins.

Three relevant accepted parent findings are retained, with their corresponding passages reread and no new erratum-search claim. **E12**, AGV arXiv v2, B.2 item(3), p.53: use the same root exponent as the power identification; the preprint's mismatched exponent is ill-typed. **E5**, Yun–Zhang Definition A.2, p.515: the section a_R is the restriction of the global a. **E2**, Yun–Zhang A.1.3, pp.515–516: the full zero fibre retains square-zero sections; its reduced substack is Bμ_2, while the full root fibre is the quotient of Spec K[t]/(t²). The inherited correction does not change the root comparison into a reduced-fibre statement.

The byte hashes and precise reading scope are in the packet. No unrestricted book was needed for this stage, no source passages are copied, and no whole-paper source audit is asserted.
