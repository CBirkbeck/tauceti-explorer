# Finite native root stacks — FunctionFieldArithmeticPartII, RS.1

This layer connects the accepted native line-and-section root data to geometric
root stacks. Its outputs are effective descent of those data, a coherent
comparison with the upstream universal root, two compatible affine
presentations, and the precise fibre, coarse-space, regularity and
Deligne–Mumford statements used by finite and infinite root constructions.
The packet is a completed target-level planning pass. RS.1 is **planned**:
the finite-diagonalizable coarse-quotient input and the geometric signature
integration boundary below remain explicit. Every node has implementation
status unchecked.

## Ownership and the starting point

The canonical definition is already owned by
`FunctionFieldArithmeticPartII:key/root-stacks`. It is an import in this layer,
not a second definition. Likewise the accepted parent's three invariant-ring
nodes remain the owners of the native Hopf-coaction coefficient calculation.
RS.0 owns tensor-power recursion, root pullback, labelled framed arrows,
normalization covers, coordinate change and their universe adapter. RS.2 owns
infinite root towers, reindexing and inverse limits. This layer constructs no
infinite tower and no general stackification, quotient, Picard groupoid or
quasi-coherent descent theory.

Current TauCetiRoadmap already owns those general theories and finite root
stacks in **Scheme and stack foundations**, §§1.1, 1.18–1.23 and 3.4.
Its §1.21 supplies the root 2-pullback, universal data, affine chart, base change,
index-one comparison, complement of the zero locus and invertible-index DM
result. Each use here is an import through the exact corresponding
`SchemeAndStackFoundations` node. New nodes compare that output with the
accepted native presentation or prove the remaining root-specific consequences.
The proposed narrowing in the packet records this ownership change for assembly;
it does not edit upstream or any accepted parent file.

The provided read-only upstream checkout is at `0d144d0`, predating the merged
Scheme and stack foundations document. The current public README and suggested
file were therefore read at immutable commit
[`350e970`](https://github.com/TauCetiProject/TauCetiRoadmap/tree/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/SchemeAndStackFoundations).
The supplied Algebraic vector bundles and Jacobian challenge READMEs were read
in full as nearby style and ownership references. Algebraic vector bundles
L0A/L0B supplies tensor sections, strong monoidal pullback and rank-one
comparisons; these are not new RS.1 targets.

The atlas compilation baseline remains Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The current Tau Ceti library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` was also checked: native line
pullback, frames, coordinates and scalar automorphisms are reusable interfaces,
but no geometric root/quotient/coarse implementation was located. The reviewed
audit has no Part II entry. Its SF.1/SF.3 and R09.3–R09.5 records distinguish the
existing sites and affine algebra from absent global geometric carriers. A
roadmap target is an ownership promise; it is not a baseline implementation.
There is no blueprint link file mentioning this Part II; the roadmap's stage
edges, accepted parent and RS.0/RS.2 packets supply its consumer boundaries.

## Conventions and the geometric interfaces

Fix a universe-bounded site of schemes. Category values may occupy a larger
universe. Enlargement is the existing RS.0 native-universe-adapter restricted
to the essential image of the original test site; it is not an equivalence
between all schemes in two different universes. The fpqc topology and its fppf
subtopology are Mathlib's native topologies. The geometry is stated for positive
integers n. An étale root construction is insufficient at a wild branch point.

Write R_n(X;L,s) for the **imported** native root stack. For a scheme T and
x:T→X, its roots are a native invertible sheaf M, a section t and an isomorphism
φ:M^n≅x*L with φ(t^n)=x*s. Invertible sheaves use Tau Ceti's actual
`InvertibleSheaf T`; root isomorphisms use its core, rather than all module
maps. Tensor powers and sections use the fixed RS.0 recursion and the supplier
monoidal pullback comparisons. Over a fixed x, an arrow b:M≅M′ must satisfy
b(t)=t′ and φ′∘b^n=φ. For a stack base an arrow a:x→x′ also occurs, and its
induced identification of pulled target lines is included in the second square.

For example, after framing the target line by l and the root line by e, write
φ(e^n)=u·l and t=y e. The equation is u y^n=f with u a unit, where s=f·l.
A source-to-target root arrow of unit label w satisfies y′=wy and u′w^n=u.
Both equations matter when y=0 or y is nilpotent. The full root groupoid cannot
be recovered from the single section equation by cancelling y.

The upstream stack A=[A¹/G_m] classifies native line-section pairs. Its power
map θ_n sends (M,t) to (M^n,t^n). The root is its 2-pullback along (L,s):X→A.
In particular the comparison isomorphism in a 2-pullback is part of the object.
Maps, arrows, universal triples and base changes below are all compared with
that datum retained. A map into a stack is never replaced by a point of an
orbit set.

## Coverage of the accepted targets

The IDs in this table are relative to `FunctionFieldArithmeticPartII` unless
they explicitly name a supplier. Every existing parent target remains an import
or is refined by the indicated new node; its accepted file is unchanged.

| Accepted target | Exact supplier or new comparison |
| --- | --- |
| `key/root-stacks` | Reserved canonical owner; upstream `SF.1/root-stack`; new `RS.1/native-upstream-equivalence` compares their presentations. |
| `RS.1/root-fpqc-descent` | `SF.1/qcoh-fpqc-descent`, rank-one descent, and new `native-effective-descent`. |
| `RS.1/two-pullback` | `SF.1/two-fibre-product`, `SF.1/line-bundle-section-stack`, `SF.1/root-stack`; new equivalence and universal comparison. |
| `RS.1/base-change` | Existing upstream root base-change API and new `native-basechange-square`. |
| `RS.1/affine-chart` | Existing upstream affineChart; new `native-quotient-comparison` identifies its actual torsors with native roots. |
| `RS.1/affine-invariants` | Accepted parent node unchanged; its all-character coefficient criterion and algebra equivalence below supply the exact API. |
| `RS.1/affine-invariant-coefficient-criterion` | Accepted parent node unchanged; the proof uses the universal Hopf coaction. |
| `RS.1/affine-invariant-algebra-equivalence` | Accepted parent node unchanged; its coefficient-map equivalence is the input to `native-coarse-space`. |
| `RS.1/closed-fibre` | New `native-geometric-fibres`, preserving the nilpotent thickening and intrinsic gerbe. |
| `RS.1/coarse-space` | New `native-coarse-space`, conditional on the single precise diagonalizable-quotient supplier request. |
| `RS.1/regular-dm` | New `native-smooth-presentation`, `native-regularity` and `native-dm-locus`; the DM criterion is sharpened to invertibility along V(s). |

In particular the old broad requests STACK-GEOM, JAC-A and ORDINARY-STACKS
are now satisfied at planning level by existing upstream carriers, AVB L0A/L0B,
SF.3 Picard and RS.0's native coherence. ROOT-ALGEBRAIC is supplied by upstream
quotient/root geometry with the native comparison below. ROOT-COARSE is reduced
to the exact missing nonreduced diagonalizable quotient generality, rather than
being treated as covered by a finite abstract-group theorem.

## The residual target graph

The targets are named below for implementation in
`TauCeti/AlgebraicGeometry/RootStack/NativeComparison`. The namespace is
`TauCeti.FiniteRoot`. They are mathematical specifications. A signature whose
carrier is absent from the compilation baseline belongs here; its absence from
the compact suggested file is accounted for in the signature ledger.

### 1. Effective descent of the native root data

Packet ID: `FunctionFieldArithmeticPartII:RS.1/native-effective-descent`. Kind: construction. Proposed declaration: `FiniteRoot.descentEquiv`.

For a scheme T, a native pair (L,s), an integer n≥1 and any fpqc cover U={T_i→T}, the canonical functor D_U:Root_n(T;L,s)→Desc_U(Root_n(L,s)) is an equivalence of groupoids. Its underlying module comparison is the restriction of the imported equivalence QCoh(T)≃Desc_U(QCoh), not a descent functor on chosen frames. The equivalence descends the root line, its section, its power identification and every root arrow, with the native tensor and pullback comparisons. It is compatible, up to specified natural isomorphisms, with refinement of covers and arbitrary base change of T.

**Hypotheses and scope.** Schemes and covers lie in one fixed universe-bounded site; category values may lie in a larger universe. No Noetherian, separation, finiteness or flatness hypothesis on a subsequent base-change map.

**Construction or proof.**

1. Use SF.1/qcoh-fpqc-descent on all quasi-coherent modules and all linear maps. Descend M_i and the transition isomorphisms; finite-locally-free-descent, including rank, makes the result a native invertible sheaf.
2. Through the imported strong symmetric monoidal pullback, identify the descended tensor power with M^n and the descended unit with O_T. Descend t_i as maps O→M and descend φ_i:M_i^n→L_i and φ_i inverse. Faithfulness checks that these maps are inverse and that φ(t^n)=s.
3. Fullness descends each compatible root arrow and its inverse; faithfulness detects its two defining squares, equality and the cocycle. This proves full faithfulness as well as essential surjectivity.
4. Compare two effective descents by the unique isomorphism inducing their local comparison. The same uniqueness proves refinement, base-change, identity and composition coherence; no chosen global frame enters.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:key/root-stacks`, `FunctionFieldArithmeticPartII:RS.0/native-root-coherence`, `SchemeAndStackFoundations:SF.1/qcoh-pseudofunctor`, `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`, `AlgebraicModuliForArithmeticGeometry:R09.3/finite-locally-free-descent`, `SchemeAndStackFoundations:SF.3/picard-groupoid`, `mathlib:AlgebraicGeometry.Scheme.fpqcTopology`, `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`, `mathlib:AlgebraicGeometry.Scheme.fppfTopology`.

**Uses.** RS.1 native-quotient-comparison and RS.0 native-stackification-equivalence: Makes the native root pseudofunctor an fpqc stack before identifying it with a geometric quotient. RS.2 root towers: Supplies effective finite-level descent without imposing a global frame.

**API.**

- `FiniteRoot.descentEquiv` (equivalence): The functor D_U is an equivalence; its unit and counit are root isomorphisms with the native underlying module descent unit and counit.
- `FiniteRoot.descentEquiv_section` (compatibility): The counit identifies the restriction of the descended t:O_T→M with t_i, through the unit and line-pullback comparisons.
- `FiniteRoot.descentEquiv_powerIso` (compatibility): After the tensor-power pullback comparison, the counit carries the restricted descended φ and its inverse to φ_i and φ_i inverse.
- `FiniteRoot.descentEquiv_hom` (characterisation): Compatible local isomorphisms descend uniquely to an isomorphism carrying t to t′ and satisfying φ′∘a^n=φ; neither condition is omitted.
- `FiniteRoot.descentEquiv_refine` (functoriality): For a refinement V→U, the two effective-descent equivalences are compared by their unique root isomorphism inducing the refinement counit; identity and composite refinements satisfy the triangle and pentagon.
- `FiniteRoot.descentEquiv_baseChange` (functoriality): Pulling the descent datum to Y→T and then descending is naturally isomorphic to pulling the descended root to Y; the comparison preserves t,φ and has the native pullback identity/composition laws.

**Unit tests.** Each statement is a test of the actual construction.

- `FiniteRoot.descent_identity` (degenerate): For the singleton identity cover, D_U is equivalent to the identity root functor with its native pullback-unit isomorphism.
- `FiniteRoot.descent_zero_automorphism` (non-example): For n=2 over Q and the zero root section, the arrows with unit labels 1 and −1 remain distinct after descent along any fpqc cover; replacing the fibres by isomorphism classes fails this test.
- `FiniteRoot.descent_nontrivial_line` (compatibility): For the Zariski cover of P¹_Q by its two standard affines, descend local frames of M=O(1), t=0, φ:M^2≅L=O(2). The descended root line is O(1), which has no global frame.
- `FiniteRoot.descent_nonflat_change` (compatibility): For the root (O,t=2,φ=identity) of (O,4) over Z and n=2, base change to F₂ descends to the zero-section root. The comparison does not cancel t or require Z→F₂ flat.

**Acceptance.** Every descent object is recovered with its section and power identification. D_U induces a bijection on every Hom set, including the automorphisms of a zero-section root.

**Sources.** Stacks, Proposition 35.5.2 (023T) and Lemma 35.7.6 (05B2); tag pages, no fixed pagination: Effective descent includes noninvertible module morphisms; finite locally free rank is fpqc local. Restricting these statements and the tensor comparison yields this root-specific equivalence. SSF, §1.1, §1.18 and §3.4; Markdown headings, no fixed pagination: The supplier owns arbitrary-QCoh descent, stack comparison and the native Picard core; this target only restricts and compares their output to the accepted root data.

### 2. Comparison with the upstream root stack

Packet ID: `FunctionFieldArithmeticPartII:RS.1/native-upstream-equivalence`. Kind: construction. Proposed declaration: `FiniteRoot.nativeEquiv`.

For an algebraic stack X with an invertible sheaf L and section s, and n≥1, compare the accepted native root stack R_n(X;L,s) with the already owned upstream rootStack n (L,s)=X×_{[A¹/G_m],θ_n}[A¹/G_m]. There is a strong equivalence E over X. At T, it sends (x,M,t,φ) to the 2-pullback object (x,(M,t),φ), using the native line-section comparison; it sends (a:x→x′,b:M≅M′) to the corresponding pair of arrows with the same compatibility square. For a stack base, the square uses a to identify x*L with x′*L. The quasi-inverse retains the actual isomorphism φ and its section equation. E is pseudonatural in T and in isomorphisms of target pairs.

**Hypotheses and scope.** X is a scheme or an algebraic stack on the fixed universe-bounded fppf site. For a stack base, L and s mean compatible native sheaves and sections on all scheme test objects, as in SF.1/stack-quasi-coherent.

**Construction or proof.**

1. Use the existing equivalence [A¹/G_m](T)≃{native line,section}. The power functor is compared with the fixed native tensor-power recursion using the imported monoidal coherence.
2. Apply the objectwise categorical-pullback universal property, retaining the comparison isomorphism and its section-preservation equation. On arrows use exactly the root-arrow square, including the arrow of X.
3. Full faithfulness of the line-section equivalence and the 2-pullback give full faithfulness of E; lifting a line-section object and its identification gives essential surjectivity.
4. The root pullback coherence and the strong naturality of the imported comparison supply the identity/composition modifications. For a stack base evaluate on every T→X; QCoh pullback compatibility and native-effective-descent glue the comparisons.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:key/root-stacks`, `FunctionFieldArithmeticPartII:RS.1/native-effective-descent`, `FunctionFieldArithmeticPartII:RS.0/native-root-coherence`, `FunctionFieldArithmeticPartII:RS.0/native-power-pullback`, `FunctionFieldArithmeticPartII:RS.0/native-universe-adapter`, `SchemeAndStackFoundations:SF.1/line-bundle-section-stack`, `SchemeAndStackFoundations:SF.1/root-stack`, `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/stack-quasi-coherent`.

**Uses.** Every RS.1 geometric target: Transfers upstream stack geometry to the accepted native finite roots. Stack-base form of RS.2: Retains 2-isomorphisms of the base and the native universal root.

**API.**

- `FiniteRoot.nativeEquiv` (equivalence): E:R_n(X;L,s)≃rootStack n (L,s) is a strong equivalence over X, with root-preserving unit and counit.
- `FiniteRoot.nativeEquiv_obj` (simp): At T and x:T→X, E sends (M,t,φ) to (x,(M,t),φ) through the native line-section and tensor-power comparisons.
- `FiniteRoot.nativeEquiv_hom` (characterisation): The map on Hom sets is bijective and retains both the root section square and power-identification square, as well as the arrow of X.
- `FiniteRoot.nativeEquiv_pullback` (functoriality): For h:Y→T the strong naturality isomorphism has underlying native line-pullback comparison; its identity and composition modifications satisfy triangle and pentagon.
- `FiniteRoot.nativeEquiv_targetIso` (functoriality): An isomorphism (L,s)≅(L′,s′) postcomposes φ and commutes with E; identity and composition comparisons use those of the native tensor/pullback API.
- `FiniteRoot.nativeEquiv_overStack` (compatibility): For every scheme T→X, restriction of E is the scheme-base comparison for (L_T,s_T), with compatibility along all arrows of the test category of X.

**Unit tests.** Each statement is a test of the actual construction.

- `FiniteRoot.nativeEquiv_one` (degenerate): For n=1, E followed by upstream rootStack.one identifies (M,t,φ) with its base object; M,t are identified with L,s by φ.
- `FiniteRoot.nativeEquiv_zero_stabilizer` (characterisation): At a geometric zero of s, E identifies the relative automorphism group of the zero-section root with the group scheme μ_n, even when the geometric field has characteristic dividing n.
- `FiniteRoot.nativeEquiv_stack_base` (non-example): For X=BG_m, L=O_X, s=1 and any n≥1, R_n≃X over X. The absolute automorphism group of the trivial base torsor is still G_m, whereas the relative automorphism group is trivial.
- `FiniteRoot.nativeEquiv_nontrivial_pair` (compatibility): Over P¹_Q, the root (O(1),0,φ:O(1)^2≅O(2)) is carried to the 2-pullback object with that same line. Replacing all root lines by O fails.

**Acceptance.** The projections to X agree up to the specified 2-isomorphism. For X=BG_m and n=1 the comparison gives X itself, preserving the base automorphisms.

**Sources.** AGV08, Appendix B.2, pp.53–54: The isomorphism in the root triple is exactly the datum retained in the 2-fibre-product presentation. SSF, §1.18, §1.21 and §1.22; no fixed pagination: The stack, quotient, root and compatible sheaf carriers already have an upstream owner. This node compares them with the accepted native presentation rather than defining them again.

### 3. Universal root and its classifying property

Packet ID: `FunctionFieldArithmeticPartII:RS.1/native-universal-root-comparison`. Kind: theorem. Proposed declaration: `FiniteRoot.nativeUniversalRoot`.

Under E, the upstream universal line U_n, section τ_n and power identification α_n:U_n^n≅π*L pull back to the accepted universal native root. For any scheme T→X, giving a map T→R_n over X with its base 2-identification is equivalent, naturally in T, to giving a native root (M,t,φ) on T; arrows of maps correspond to root isomorphisms. Pullback of the universal triple gives this equivalence and identifies both φ(t^n)=s and the two equations on arrows. Universality is a groupoid equivalence, not a bijection on isomorphism classes.

**Hypotheses and scope.** Same X,L,s,n and universe bounds as native-upstream-equivalence.

**Construction or proof.**

1. Evaluate the second projection of the upstream 2-pullback and its structural 2-isomorphism. The line-section comparison gives U_n,τ_n,α_n.
2. Apply the 2-Yoneda equivalence to native-upstream-equivalence. Naturality yields the classifying map and its action on arrows; full faithfulness gives uniqueness up to unique compatible 2-isomorphism.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:RS.1/native-upstream-equivalence`, `FunctionFieldArithmeticPartII:key/root-stacks`, `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/line-bundle-section-stack`.

**Acceptance.** Pullback along a classifying map recovers the whole input root triple, including φ. For s=0 over a field, universal automorphisms retain their μ_n labels.

**Sources.** AGV08, Appendix B.1–B.2, pp.52–54: The tautological root line in the quotient and 2-pullback presentations gives the universal triple; the native comparison identifies that triple.

### 4. Coherent arbitrary base change of the comparison

Packet ID: `FunctionFieldArithmeticPartII:RS.1/native-basechange-square`. Kind: comparison. Proposed declaration: `FiniteRoot.nativeBaseChangeComparison`.

For any 1-morphism g:Y→X of algebraic stacks, the accepted native base-change equivalence R_n(Y;g*L,g*s)≃Y×_X R_n(X;L,s), the upstream rootStack.baseChange equivalence, and E_Y,E_X form a 2-commutative square over Y. Its comparison is specified by the native line-pullback isomorphism and the structural 2-pullback isomorphism. It carries the universal triple to its pullback. Identity, composable base changes and 2-isomorphic base changes satisfy the unit, associativity and modification laws. No flatness is assumed.

**Hypotheses and scope.** Use 2-pullbacks throughout; g may be nonrepresentable or nonflat.

**Construction or proof.**

1. Use associativity of the imported 2-pullback, not a strict pullback of object sets. On each test scheme compare (M,t,φ) by the native pullback and tensor-power comparison.
2. Both paths have the same projections and structural isomorphism. The 2-universal property determines their comparison, and its full faithfulness proves coherence for identity, composition and 2-cells.
3. Use native-universal-root-comparison to identify the universal section and power isomorphism in this square.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:RS.1/native-upstream-equivalence`, `FunctionFieldArithmeticPartII:RS.1/native-universal-root-comparison`, `FunctionFieldArithmeticPartII:RS.0/native-root-coherence`, `SchemeAndStackFoundations:SF.1/two-fibre-product`, `SchemeAndStackFoundations:SF.1/root-stack`.

**Acceptance.** Z→F_p is allowed, including a change that sends a nonzero section to zero. For X=BG_m the square compares groupoids over Y, without discarding the base 2-isomorphism.

**Sources.** AGV08, Appendix B.1–B.2, pp.52–54: Both root constructions commute with pulling back the target pair. TV17, Proposition 3.4, p.13; positive finite-index specialization: The root-stack base-change comparison is canonical; this target adds its comparison with native pullback and coherent 2-cells.

### 5. Native affine roots and the torsor quotient

Packet ID: `FunctionFieldArithmeticPartII:RS.1/native-quotient-comparison`. Kind: theorem. Proposed declaration: `FiniteRoot.nativeAffineQuotient`.

Let X=Spec A, choose a frame l of L and write s=f·l. Put W=Spec A[z]/(z^n−f), with the weight-one μ_n action on z. Under E the native root stack is equivalent to the existing quotient [W/μ_n] over X, naturally in arbitrary ring maps and compatibly with changes of l. For a native root, the sheaf P of frames e of M satisfying φ(e^n)=l is a μ_n-torsor; the coordinate t=z e defines a map P→W. With right action e·ζ=ζe, its coordinate satisfies z(e·ζ)=ζ^−1 z(e); this is equivariance for the left weight-one action on W. Conversely a torsor and such a map descend O_P,t and φ. This is an equivalence of groupoids, including torsor isomorphisms, not just an orbit-set calculation.

**Hypotheses and scope.** A is any commutative ring and n≥1. The frame l is local data; changes of l use the native frame-change comparisons, not globally chosen n-th roots.

**Construction or proof.**

1. The normalized-frame sheaf is locally nonempty by RS.0/native-local-normalization; two frames differ by a unique μ_n section, proving the torsor identity. This uses fppf covers even in wild characteristic.
2. On P the root is trivialized; its section and power isomorphism satisfy the displayed equations. Effective descent constructs the inverse on objects and arrows.
3. Compare with the upstream affineChart via its tautological normalized root. The equality on frames and arrows determines the natural isomorphism by full faithfulness.
4. Use native-basechange-square and the RS.0 frame-change/coefficient comparisons for arbitrary ring maps and noncanonical frame changes; the cocycles are root isomorphisms.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:RS.1/native-effective-descent`, `FunctionFieldArithmeticPartII:RS.1/native-upstream-equivalence`, `FunctionFieldArithmeticPartII:RS.1/native-basechange-square`, `FunctionFieldArithmeticPartII:RS.0/native-local-normalization`, `FunctionFieldArithmeticPartII:RS.0/native-framed-equivalence`, `FunctionFieldArithmeticPartII:RS.0/native-frame-change`, `FunctionFieldArithmeticPartII:RS.0/native-coefficient-naturality`, `SchemeAndStackFoundations:SF.1/quotient-stack`, `SchemeAndStackFoundations:SF.1/root-stack`.

**Acceptance.** For f=0 and n>1, W→Spec A is not a μ_n-torsor in general; W→[W/μ_n] is the torsor used here. For A=Z/4, n=2, the root with t=0 and φ coefficient 3 need not have an A-valued normalized frame; its torsor still gives an object of the quotient. The formula z(e·ζ)=ζ^−1z(e) prevents reversing the associated-line convention.

**Sources.** AGV08, Appendix B.2, pp.53–54: The affine equation and the quotient presentation are obtained by normalizing the power identification of the root line. TV17, Corollary 3.13, p.16, rank-one chart P=N: The finite logarithmic root chart is a finite diagonalizable torsor quotient; the rank-one case agrees with this affine root chart.

### 6. A smooth presentation valid for wild roots

Packet ID: `FunctionFieldArithmeticPartII:RS.1/native-smooth-presentation`. Kind: construction. Proposed declaration: `FiniteRoot.smoothPresentation`.

For the affine pair (A,f) put V_n(f)=Spec A[z,q,q^−1]/(z^n−q f). Give it the left G_m action λ·(z,q)=(λz,λ^nq). The map V_n(f)→R_n(Spec A;O,f) sends (z,q) to the trivial root line with section z and power identification of coefficient q^−1. It exhibits V_n(f) as the G_m-torsor of arbitrary frames of the universal root, hence is representable, smooth and surjective. There is an equivalence [V_n(f)/G_m]≃R_n and a comparison V_n(f)≃W×^{μ_n}G_m, where W has its weight-one action and μ_n acts on W×G_m by ζ·(w,λ)=(ζw,λζ^−1); the latter comparison sends (w,λ) to (λw,λ^n).

**Hypotheses and scope.** Any commutative A, f∈A and positive n; no invertibility of n. V_n(f) is a presentation over Spec A, not a claim that V_n(f)→Spec A is smooth.

**Construction or proof.**

1. A frame e of the root line gives t=z e and φ(e^n)=q^−1, so the root equation is z^n=qf. Conversely these coordinates construct a root with its frame.
2. Forgetting an arbitrary frame is a G_m-torsor on each test scheme by native line local triviality; G_m is smooth, so this is a smooth atlas. Its action on the trivial root is the arrow of unit label λ.
3. The generic torsor quotient equivalence identifies [V/G_m] with the root stack. Normalizing q by a μ_n cover gives the contracted-product comparison; descend the invariant map (w,λ)↦(λw,λ^n). For representability view the power map G_m→G_m, λ↦q=λ^n, as the μ_n-torsor over the q-base and form its associated W-bundle; W itself is not asserted to be a torsor.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:RS.1/native-quotient-comparison`, `FunctionFieldArithmeticPartII:RS.1/native-effective-descent`, `SchemeAndStackFoundations:SF.1/quotient-stack`, `SchemeAndStackFoundations:SF.1/quotient-stack-algebraic`, `SchemeAndStackFoundations:SF.1/torsor-representability`, `SchemeAndStackFoundations:SF.1/contracted-product`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`.

**Uses.** RS.1 native-regularity: Provides the actual smooth scheme atlas needed for regularity without treating μ_p as smooth. RS.1 native-algebraicity: Identifies the geometric presentation with the native universal-root frame torsor.

**API.**

- `FiniteRoot.smoothPresentation` (data): The chosen affine frame l identifies the universal-root frame torsor with V_n(f), by the coordinate equations z^n=qf and φ coefficient q^−1.
- `FiniteRoot.smoothPresentation_action` (simp): Changing a frame by e↦λ^−1 e sends (z,q) to (λz,λ^nq); the induced root arrow has label λ.
- `FiniteRoot.smoothPresentation_torsor` (characterisation): V→R is a representable G_m-torsor; V×_R V≃G_m×V with the source, target and composition of this action.
- `FiniteRoot.smoothPresentation_quotient` (equivalence): The quotient [V/G_m]→R is an equivalence over Spec A, sending the tautological root to the native universal root.
- `FiniteRoot.smoothPresentation_finiteChart` (compatibility): The map W×G_m→V, (w,λ)↦(λw,λ^n), induces V≃W×^{μ_n}G_m with the stated inverse action on λ.
- `FiniteRoot.smoothPresentation_baseChange` (functoriality): Every A→B identifies the base change of V_n(f) and its atlas/action with V_n(f_B), with identity and composition comparisons induced on both coordinates.

**Unit tests.** Each statement is a test of the actual construction.

- `FiniteRoot.smoothPresentation_one` (degenerate): For n=1, eliminate z=qf: V_1(f)≅Spec A[q,q^−1]; its map to the root stack is the ordinary frame G_m-torsor over Spec A.
- `FiniteRoot.smoothPresentation_zero` (computation): For f=0, V_n(0)=Spec A[z,q,q^−1]/(z^n). For a field and n>1 this atlas is nonreduced, although its map to the root stack is smooth.
- `FiniteRoot.smoothPresentation_wild` (non-example): For A=F_p[x], f=x and n=p, the atlas is Spec F_p[z,q,q^−1], via x=q^−1z^p, and is regular. The finite chart W→R is a μ_p-torsor and is not smooth.
- `FiniteRoot.smoothPresentation_unit` (compatibility): For f a unit, eliminate q=z^n/f to obtain V_n(f)≅Spec A[z,z^−1]; the G_m action scales z and its quotient is Spec A.

**Acceptance.** The atlas is smooth as a map to the stack in characteristic p with n=p.

**Sources.** AGV08, Appendix B.2, pp.53–54, presentation as [V_σ/G_m]: The frame presentation uses a smooth G_m atlas even when the finite root group is not smooth. Our q is the inverse of the coefficient of the power identification. SSF, §1.15–§1.16 and §1.21; no fixed pagination: Representability of torsors, contracted products and smooth quotient atlases are imported general results.

### 7. Algebraicity and finite relative diagonal

Packet ID: `FunctionFieldArithmeticPartII:RS.1/native-algebraicity`. Kind: application. Proposed declaration: `FiniteRoot.nativeAlgebraic`.

The native root stack of any pair on an algebraic stack X is algebraic. Its projection π:R_n→X is flat and locally of finite presentation, with finite relative diagonal. For scheme X its absolute inertia is finite. For a general stack base, these are relative assertions; no finiteness or triviality of the absolute stabilizers of X is assumed. On an affine frame chart W→R is a finite locally free μ_n-torsor of rank n; W→X is finite locally free of rank n, whereas W→X is generally not a torsor.

**Hypotheses and scope.** X is algebraic, L invertible, s arbitrary, n≥1. Finite diagonal means representable and finite, without asserting flatness of the Isom spaces after imposing the section equation.

**Construction or proof.**

1. For a scheme base use native-smooth-presentation and the upstream quotient algebraicity theorem, or transport the existing rootStack geometry along E. For a stack base use its smooth scheme atlas and native-basechange-square.
2. The finite chart W→R is a μ_n-torsor and W→X is defined by a monic degree-n equation. Flatness and local finite presentation of π follow fppf locally from these two maps.
3. For two roots over the same T, isomorphisms of their n-th-power data form a μ_n-torsor locally. The extra equation a(t)=t′ cuts out a closed subscheme. Thus the relative Isom space is finite, but need not be flat. For X a scheme this gives finite inertia.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:RS.1/native-upstream-equivalence`, `FunctionFieldArithmeticPartII:RS.1/native-basechange-square`, `FunctionFieldArithmeticPartII:RS.1/native-quotient-comparison`, `FunctionFieldArithmeticPartII:RS.1/native-smooth-presentation`, `SchemeAndStackFoundations:SF.1/root-stack`, `SchemeAndStackFoundations:SF.1/quotient-stack-algebraic`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`, `SchemeAndStackFoundations:SF.1/inertia`, `mathlib:Polynomial.Monic.free_adjoinRoot`, `mathlib:Polynomial.Monic.finite_adjoinRoot`, `mathlib:AdjoinRoot.powerBasis'`.

**Acceptance.** At a wild branch point over F_p the stack is algebraic with finite nonreduced relative inertia. For X=BG_m and n=1, π is the identity, so the absolute inertia is G_m rather than finite.

**Sources.** AGV08, Appendix B.2, pp.53–54: The finite root chart and smooth frame presentation give the root-specific algebraicity and local finite flat covers. SSF, §1.19–§1.21; no fixed pagination: Algebraicity, relative properties and inertia are owned by the supplier; this is their transport to native roots.

### 8. The relative coarse space of native roots

Packet ID: `FunctionFieldArithmeticPartII:RS.1/native-coarse-space`. Kind: theorem. Proposed declaration: `FiniteRoot.nativeCoarseSpace`.

For a scheme X, the native projection π:R_n(X;L,s)→X is a coarse moduli morphism: it is categorical for maps to every algebraic space, and induces a bijection on geometric isomorphism classes over every algebraically closed field. Its formation commutes with arbitrary base change, including nonflat base change, and its quasi-coherent pushforward is exact. For an algebraic-stack base X these statements hold after every scheme T→X and coherently on their overlaps. In particular π has the corresponding relative universal property for algebraic spaces over X (representable targets over X), interpreted with compatible 2-isomorphisms. It does not assert that X is an absolute algebraic space or an absolute coarse space.

**Hypotheses and scope.** Any n≥1 and arbitrary section; a Cartier or regularity hypothesis is unnecessary. The generic finite-diagonalizable coarse quotient theorem in request RS1-DIAGONALIZABLE-COARSE is a required supplier input. A constant finite-group theorem is insufficient when n is not invertible.

**Construction or proof.**

1. On an affine trivialization use native-quotient-comparison. The accepted parent affine-invariant-algebra-equivalence identifies the Hopf-coaction equalizer in A[z]/(z^n−f) with A; this calculation uses all characters, not μ_n(A)-points.
2. Apply the requested finite-diagonalizable quotient coarse universal property, including maps to nonaffine algebraic spaces, to conclude that the candidate Spec A is coarse. The degree-zero projection on graded equivariant modules makes invariants exact and compatible with arbitrary tensor base change, including wild μ_p. This is the supplier input, not an inference from the invariant ring alone.
3. Glue the coarse identifications on affine overlaps by the uniqueness of the coarse universal property. Their agreement with arbitrary base change follows either from the supplier theorem or from its tame-base-change corollary after the chartwise exactness.
4. For a stack base, apply the scheme statement to each T→X and use native-basechange-square to make the comparisons coherent. Descent for morphisms to representable targets over X gives the relative universal property.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:RS.1/native-algebraicity`, `FunctionFieldArithmeticPartII:RS.1/native-quotient-comparison`, `FunctionFieldArithmeticPartII:RS.1/native-basechange-square`, `FunctionFieldArithmeticPartII:RS.1/affine-invariant-algebra-equivalence`, `SchemeAndStackFoundations:SF.1/coarse-moduli-space`, `SchemeAndStackFoundations:SF.1/stack-quasi-coherent`, `SchemeAndStackFoundations:SF.1/tame-local-structure`, `SchemeAndStackFoundations:SF.1`.

**Acceptance.** For X=Spec F_p and s=0,n=p, the full nonreduced fibre still has coarse space Spec F_p. For X=BG_m and s=1 the projection is the identity of BG_m; the assertion is relative and does not manufacture an absolute algebraic-space coarse target. For A=Z/4,n=2,f=0 and base change A→F₂, the invariant algebra remains the new coefficient ring; there is no averaging by 1/2.

**Sources.** AOV08, Proposition 2.7, p.1067; Theorem 3.2, p.1077; Corollaries 3.3–3.4 and proof, pp.1078–1079: Diagonalizable groups are linearly reductive even in wild characteristic. For tame stacks coarse spaces commute with arbitrary base change. The affine invariants argument in the proof must be supplied in full group-scheme generality. AGV08, Appendix B.2, pp.53–54: The root presentation reduces the coarse-space claim to finite diagonalizable affine quotients.

### 9. Full geometric fibres and the zero-section gerbe

Packet ID: `FunctionFieldArithmeticPartII:RS.1/native-geometric-fibres`. Kind: comparison. Proposed declaration: `FiniteRoot.nativeGeometricFibre`.

For a geometric point x:Spec K→X (K algebraically closed), the 2-fibre of the native projection is [Spec K[z]/(z^n−f_x)/μ_n] after choosing a frame of L_x. If s_x≠0 it is equivalent to Spec K. If s_x=0 it contains the zero-root-section gerbe G_x of n-th roots of L_x as a closed substack cut out by the universal root section; its ideal is nilpotent with n-th power zero. After choosing a frame of L_x this gerbe is B_K μ_n and is the reduction of the full fibre. For n>1 the full fibre is nonreduced and differs from G_x. This remains true when char K divides n; Bμ_n itself is reduced as an algebraic stack, despite μ_n possibly being nonreduced.

**Hypotheses and scope.** The assertion concerns the relative 2-fibre along the specified geometric point even when X is a stack. Neutralization G_x≃Bμ_n depends on a frame of L_x; the gerbe itself is intrinsic.

**Construction or proof.**

1. Use native-basechange-square and native-quotient-comparison for the full fibre. If f_x is a unit, z is a unit on the chart and the μ_n action is free with quotient Spec K.
2. When f_x=0, the equivariant ideal (z) is nilpotent of exponent n; its quotient stack is the zero-section root gerbe. A frame of L_x identifies this gerbe with Bμ_n.
3. The smooth G_m atlas of Bμ_n is G_m via the power action, so that gerbe is reduced even for μ_p. The full fibre has smooth atlas Spec K[z,q,q^−1]/z^n from native-smooth-presentation. For n>1 its z is nonzero nilpotent, proving the distinction without using K-valued points alone.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:RS.1/native-basechange-square`, `FunctionFieldArithmeticPartII:RS.1/native-quotient-comparison`, `FunctionFieldArithmeticPartII:RS.1/native-smooth-presentation`, `SchemeAndStackFoundations:SF.1/quotient-stack`, `SchemeAndStackFoundations:SF.1/stack-presentation`, `mathlib:AdjoinRoot`, `mathlib:AdjoinRoot.eval₂_root`.

**Acceptance.** Over K[ε]/ε² with n=2, the trivial root with section ε is an object over the zero target section but is not isomorphic to the zero-section root. For n=1 and f_x=0 the fibre and its gerbe are both Spec K. For char K=p,n=p, the dual-number unit 1+ε is a nonidentity automorphism of the zero root, although μ_p(K) has one point.

**Sources.** AGV08, Appendix B.2, p.53, nilpotent closed embedding and infinitesimal-neighbourhood description: The full zero fibre allows nilpotent root sections. The root gerbe is its zero-section closed substack, not the full fibre. SSF, §1.21 checks; no fixed pagination: The owned root stack explicitly distinguishes the full infinitesimal fibre from its reduced gerbe; this target transports that distinction to native data.

### 10. Regular roots of regular Cartier divisors

Packet ID: `FunctionFieldArithmeticPartII:RS.1/native-regularity`. Kind: theorem. Proposed declaration: `FiniteRoot.nativeRegular`.

Let X be a regular scheme and D a regular effective Cartier divisor. For every positive integer n, the native root stack R_n(X;O(D),s_D) is a regular algebraic stack, where regularity is checked on a smooth surjective scheme atlas. No invertibility of n is required. On an affine trivialization with equation f, the actual smooth-presentation ring A[z,q,q^−1]/(z^n−qf) is regular whenever A is a regular ring, f is a nonzerodivisor and A/(f) is regular.

**Hypotheses and scope.** Regular schemes are locally Noetherian with regular local rings. D is effective Cartier and itself regular; an arbitrary Cartier divisor is insufficient. Regularity of X is absolute; regularity after arbitrary base change is not asserted.

**Construction or proof.**

1. Cover X by affine opens framing O(D). The chosen smooth atlas is native-smooth-presentation; using the finite μ_n atlas as if it were smooth would be invalid in wild characteristic.
2. For n=1 eliminate z=qf. For n≥2 work in the regular ambient A[z,q,q^−1]. At a prime containing z, also f lies in the prime; since A/(f) is regular and f is a nonzerodivisor, f is a local regular parameter. Equivalently, quotienting the ambient regular local ring by f is regular, so its class in the cotangent space is nonzero.
3. The class of z^n−qf in the ambient cotangent space equals −qf and is nonzero. Extend it to a regular system of parameters; quotient by this parameter is regular. This uses Stacks Lemmas 10.106.3–10.106.4.
4. On z≠0, f is invertible and the equation eliminates q: the ring is A_f[z,z^−1], which is regular. Glue these local regularity statements and apply the smooth-local property/atlas independence of regularity.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:RS.1/native-smooth-presentation`, `FunctionFieldArithmeticPartII:RS.1/native-algebraicity`, `SchemeAndStackFoundations:SF.1/stack-presentation`, `SchemeAndStackFoundations:SF.4/regular-scheme`, `mathlib:IsRegularRing`, `mathlib:IsRegularLocalRing`, `mathlib:Localization.Away`.

**Acceptance.** For X=A¹_F_p,D=(x),n=p, the smooth atlas is Spec F_p[z,q,q^−1] and is regular although the root stack is not DM over D. For a unit f, the atlas is A[z,z^−1] and the stack is X, in every characteristic. For X=A¹_k,D=(x²),n=2,char k≠2, D is Cartier but not regular and the root chart at x=z=0 is nodal. Thus the hypothesis that D is regular cannot be dropped.

**Sources.** AGV08, Appendix B.2, pp.53–54, G_m-presentation: Supplies the smooth frame atlas. The regularity argument here is a deduction from that atlas, not a regularity theorem attributed to AGV. Stacks, Lemmas 10.106.3–10.106.4 (00NN); Lemma 10.163.10 (07NF); §100.7, Lemma 100.7.1, Definition 100.7.2 and Remark 100.7.3 (04YE/04YG); tag pages, no fixed pagination: Quotients by a regular parameter stay regular, smooth algebras over regular bases are regular, and regularity of algebraic stacks is a smooth-local property.

### 11. The exact Deligne–Mumford locus

Packet ID: `FunctionFieldArithmeticPartII:RS.1/native-dm-locus`. Kind: theorem. Proposed declaration: `FiniteRoot.nativeDMLocus`.

For a scheme X and any pair (L,s), write D=V(s) for its scheme-theoretic zero locus, without assuming Cartier or regularity. The native root stack is Deligne–Mumford if and only if n is a unit on D. Its DM locus is exactly the inverse image of (X∖|D|)∪D(n), where D(n) is the open subset on which the integer n is invertible. At a geometric branch point its relative inertia is μ_n; away from D it is trivial. For an algebraic-stack base this is a criterion for π:R_n→X to be a DM morphism; the whole root stack is DM if X is DM and this condition holds. No assertion about the absolute DM locus of an arbitrary non-DM base is made.

**Hypotheses and scope.** Positive n; arbitrary section. Empty D gives the whole base even if n is not a unit on X. At general nonreduced test objects, the relative automorphism sheaf of a root is the subgroup of G_m given by λ^n=1 and (λ−1)t=0, not identically μ_n.

**Construction or proof.**

1. Under native-quotient-comparison, compute geometric stabilizers: a nonzero section forces λ=1, and a zero section leaves precisely μ_n. Use the supplier inertia and quotient DM criterion.
2. The group scheme μ_n over a field is unramified exactly when n is nonzero in that field. At wild branch points the tangent unit 1+ε gives a nonzero tangent vector, proving failure of unramifiedness even though the geometric point group may have one element.
3. Unramifiedness of the relative diagonal is a local property. Its locus therefore consists precisely of the preimage of the displayed base open. Testing every point of D is equivalent to n being invertible on D.
4. For a stack base make the same calculation after every scheme test map using native-basechange-square; combine a DM morphism with a DM base for the stated absolute conclusion.

**Direct prerequisites.** `FunctionFieldArithmeticPartII:RS.1/native-algebraicity`, `FunctionFieldArithmeticPartII:RS.1/native-geometric-fibres`, `FunctionFieldArithmeticPartII:RS.1/native-basechange-square`, `SchemeAndStackFoundations:SF.1/inertia`, `SchemeAndStackFoundations:SF.1/quotient-stack-algebraic`, `SchemeAndStackFoundations:SF.1/deligne-mumford-stack`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`.

**Acceptance.** For X=Spec Z, s=p,n=p (p prime), the root stack is DM off p and is not DM above p. For X=Spec Z,s=1,n=p, the root stack is X and is DM everywhere. For X=Spec Z,s=2,n=3, n is not a unit on X but is a unit on V(2); the root stack is DM everywhere. For char K=p,n=p, (1+ε)^p=1 in K[ε]/ε² detects nonreduced inertia; pointwise roots of unity do not detect the failure.

**Sources.** SSF, §1.19–§1.21; rootStack.DM_of_invertible and wild/unit checks; no fixed pagination: The upstream stabilizer criterion and invertible-index theorem supply the geometric input; this sharpens the native statement to invertibility only on the zero locus. AGV08, Appendix B.2, p.53, complement of the zero locus and zero-root gerbe: The complement has no extra root inertia, whereas branch points retain μ_n.

## Worked geometric checks

Take A=Z/4, n=2 and the trivial root line with section zero and power
identification coefficient 3. A normalized frame would require a unit r with
r²=3. No element of Z/4 satisfies this. The root nevertheless exists, and its
normalization cover is finite locally free and fppf. Consequently the quotient
must allow nontrivial torsors and effective descent. A quotient of A-valued
chart points by μ₂(A) misses this root. This also separates two different maps:
W→R is a μ₂-torsor, whereas W→Spec A is just the monic root cover and need not
be a torsor.

For a zero target section over a field K and n=2, take the test ring
K[ε]/ε². The root with t=ε has square zero, but cannot be isomorphic to the
root with t=0: an invertible module map cannot kill ε. The two roots have the
same reduced point. This is why the full fibre is the quotient of the
nilpotent chart and the closed gerbe is obtained by imposing t=0, a stronger
equation. For char K=p and n=p the group μ_p has only the identity K-point,
but the dual-number unit 1+ε is a nonidentity μ_p-point. Geometric-point
cardinality alone detects neither the full fibre nor the DM obstruction.

For X=A¹_F_p, D=(x) and n=p, the frame atlas has equation z^p=qx.
Eliminating x identifies it with Spec F_p[z,q,q^−1]. It is a regular smooth
atlas of the root stack. The finite chart itself is a μ_p-torsor over the
stack and is not a smooth atlas. Thus the root stack is regular, algebraic and
tame, but is not DM at its branch point. Regularity and the DM condition use
different hypotheses. Taking s=1 instead gives X for every n, with trivial
relative inertia even in characteristic p.

Over Spec Z with s=2,n=3, the only branch locus is V(2), where 3 is a unit.
The root stack is DM everywhere although 3 is not a unit on the whole base.
This concrete case detects the unnecessarily strong global invertibility
condition. For a stack base BG_m with s=1, all root fibres are trivial relative
to the base, but the base automorphisms remain. Relative coarse and relative
DM assertions cannot silently become absolute ones.

## Supplier closure and the remaining input

There is exactly one new cross-roadmap request, **RS1-DIAGONALIZABLE-COARSE**,
to `SchemeAndStackFoundations:SF.1`. Its complete contract is:

For a finite abelian character group H and any commutative A, let B be an
H-graded commutative A-algebra, finite locally free as an A-module, with its
coefficient map identifying A with B₀. The action of D_A(H) has coarse
projection [Spec B/D_A(H)]→Spec A, categorical for maps to every algebraic
space and bijective on geometric isomorphism classes. The QCoh direct image
is degree zero, is exact and commutes with arbitrary coefficient base change.
The comparison with the existing finite constant étale-group theorem must be
supplied when both descriptions apply. There is no Noetherian or invertible
order assumption.

The root application uses H=Z/n and B=A[z]/(z^n−f). The parent already gives
the Hopf-invariant algebra equivalence. Decomposing any graded module by H
makes its degree-zero functor exact without division by n, and scalar
extension commutes with that direct-summand projection. These facts explain
the required exactness and base-change conclusion; they do not replace the
categorical quotient theorem for arbitrary algebraic-space targets. Current
upstream §1.23 explicitly states the affine coarse quotient for finite groups.
Its tame base-change theorem is conditional on a coarse space. The missing
finite nonreduced group-scheme generality therefore remains a precise supplier
boundary. AOV08 Proposition 2.7, Theorem 3.2 and Corollary 3.3, with the locators
above, motivate and support this extension.

The packet proposes this general extension as **Scheme and stack foundations,
Part II: finite diagonalizable coarse quotients**, with the existing upstream
roadmap as its first prerequisite. It creates no extension files or competing
generic quotient nodes. The root-specific use belongs to this layer. Assembly
should replace the older broad ROOT-COARSE supplier label by this contract,
and point the other generic requests at their current upstream owners.

The second recorded gap, **RS1-NATIVE-SIGNATURES**, is the exact separation
between the compilation pins and the specified geometry. It includes no
unstated mathematical target: every new target, hypothesis, API and test is in
this reader, and the suggested file records the exhaustive omission ledger.
RS.1 remains planned rather than closed because of these two boundaries.
There is no claim that the supplier request has been implemented or that a
Lean check proves any of the stack geometry.

## Compact suggested forms and signature ledger

The suggested file contains two light, real-bodied abbreviations over native
polynomial/quotient/localization types: `presentationRelation` names
z^n−qf, and `smoothPresentationRing` localizes its quotient at q. The retained
end theorem `smoothPresentationRing_regular` states the actual ring milestone
of native-regularity with native regular-ring predicates. It assumes A
regular, f a nonzerodivisor, A/(f) regular and n positive. It does not assert
that the finite chart A[z]/(z^n−f) is regular for a unit f in wild
characteristic. The retained `zeroFibre_nonreduced` and
`wildInertia_tangent` state the native polynomial-quotient end conditions
used in the geometric checks.

The other retained statements are a few examples: the n=1 equation, unit
section stabilizer, nilpotent section in Z/9, the absent square root of 3 in
Z/4, and the exponent invertible on the branch divisor of the Z example.
These statements use existing carriers and make no surrogate root stack.
The geometric signatures excluded at these pins are exactly:

| Target family | Missing actual carrier/interface; retained form |
| --- | --- |
| `native-effective-descent`, all six `descentEquiv*` API items and its four tests | Native root/descent categories and strong monoidal comparisons. All six domains and their equations are specified above. |
| `native-upstream-equivalence`, all six `nativeEquiv*` API items and its four tests | Root and line-section stack carriers, strong transformations and the native 2-pullback. |
| `native-universal-root-comparison`, `native-basechange-square` | Actual universal triple, structural 2-isomorphisms and modifications. |
| `native-quotient-comparison` | Actual μ_n torsor quotient and associated-line descent; Z/4 retains its global-normalization obstruction. |
| `native-smooth-presentation`, all six `smoothPresentation*` API items and its four tests | Actual frame torsor, quotient map and contracted-product comparison; the retained abbreviations name only its ring. |
| `native-algebraicity` | Algebraic-stack and relative morphism-property carriers. |
| `native-coarse-space` | Actual coarse universal property, geometric classes and QCoh right adjoint, plus the stated supplier contract. |
| `native-geometric-fibres` | Actual 2-fibre, closed substack, reduction and gerbe; its ring end condition is retained. |
| `native-regularity` | Smooth-local regularity on actual stacks; its smooth-atlas-ring milestone is retained. |
| `native-dm-locus` | Actual relative diagonal/DM/inertia loci; the tangent and unit/branch checks are retained. |

Every API/test omitted from Lean is grouped explicitly in this table and in
the file's own ledger. No admitted data definition, axiom, predicate-field
stand-in or chain of auxiliary lemmas is introduced. The 5,000-line limit is
respected from the outset.

## Sources and source-faithfulness record

All statements and explanations here are in our own words. Locators refer to
the selected editions, not a claim to have read every cited work in full.
The packet records SHA-256 values of the three publicly downloaded PDFs and
the immutable upstream README, together with the date and exact reading scope.
No restricted book was needed.

- **AGV08.** Dan Abramovich, Tom Graber and Angelo Vistoli, [Gromov–Witten theory of Deligne–Mumford stacks](https://arxiv.org/pdf/math/0603151v2), arXiv:math/0603151v2 (13 April 2008), printed pp.52–54. Read 2026-10-18: Appendix B.1–B.2, pp.52–54, line roots, section roots, universal line, nilpotent closed gerbe and both quotient presentations.

- **TV17.** Mattia Talpo and Angelo Vistoli, [Infinite root stacks and quasi-coherent sheaves on logarithmic schemes](https://arxiv.org/pdf/1410.1164v2), arXiv:1410.1164v2 (12 December 2017). Read 2026-10-18: §3–§3.1, pp.12–16, especially finite base change Proposition 3.4, diagonalizable local models and Corollary 3.13; infinite-index conclusions are outside this packet.

- **AOV08.** Dan Abramovich, Martin Olsson and Angelo Vistoli, [Tame stacks in positive characteristic](https://www.numdam.org/item/10.5802/aif.2378.pdf), Annales de l’Institut Fourier 58 (2008), 1057–1091; version of record. Read 2026-10-18: §2.3, Proposition 2.7 and proof, pp.1066–1067; §3, Definition 3.1, Theorem 3.2, Corollaries 3.3–3.5 and proof of Corollary 3.3, pp.1077–1079.

- **Stacks.** The Stacks Project Authors, [The Stacks Project](https://stacks.math.columbia.edu), Tag pages accessed 2026-10-18; section/lemma numbers as served; no fixed pagination. Read 2026-10-18: Proposition 35.5.2 (023T) with proof; Lemma 35.7.6 (05B2) with proof. §10.106 (00NN), in particular Lemmas 10.106.3–10.106.4; Lemma 10.163.10 (07NF). §100.7 (04YE), Lemma 100.7.1, Definition 100.7.2 (04YG), Remark 100.7.3.

- **SSF.** Tau Ceti roadmap contributors, [Scheme and stack foundations](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/SchemeAndStackFoundations/README.md), TauCetiRoadmap main 350e970ce49f707a327909beac0b7b7c782cc7ee; Markdown, no fixed pagination. Read 2026-10-18: §1.1; §1.18–§1.23; §3.4 Picard groupoids; §4.13 regular schemes. Suggested.lean: corresponding stack-in-groupoids declaration and absence of retained heavy root/quotient declarations; README owns the omitted carriers.

- **AVB.** Tau Ceti roadmap contributors, [Algebraic vector bundles](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/AlgebraicVectorBundles/README.md), Provided TauCetiRoadmap checkout 0d144d044dacebca17b654695b6f1ad58f159b27; Markdown, no fixed pagination. Read 2026-10-18: README in full: native module tensor/section/pullback L0A, rank-one and finite locally free L0B, relative Spec and bundle equivalences; Suggested.lean inspected.

- **JAC.** Tau Ceti roadmap contributors, [Jacobian challenge](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0d144d044dacebca17b654695b6f1ad58f159b27/TauCetiRoadmap/JacobianChallenge/README.md), Provided TauCetiRoadmap checkout 0d144d044dacebca17b654695b6f1ad58f159b27; Markdown, no fixed pagination. Read 2026-10-18: README in full; native invertible sheaves, Picard and tensor infrastructure are supplier mathematics.

The accepted parent's source finding `FunctionFieldArithmeticPartII/E12` is
inherited with its provenance: AGV's selected preprint p.53 uses an unbound
exponent in the section equation. The definition uses the same exponent n as
its power identification. The selected passage was reread; this job makes no
new erratum-search or version-of-record claim. It found no additional source
error. The full-fibre distinction above follows AGV's correct nilpotent
embedding, so it does not rely on the erroneous full-fibre identification
recorded elsewhere in the parent.

The five planets are Root stack comparison, Universal root, Affine root
quotient, Coarse space of a root stack and Regular root stack. They show the
layer's principal mathematical objects and results. Its ownership boundary,
source checks and remaining supplier work stay in the reader and handoff.
