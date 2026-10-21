# Ramified norms and quadratic traces

This part constructs the comparisons and obstruction calculations used by ramified geometric class field theory. Its two conclusions have separate proofs. The norm complex produces two torsor fibre sequences and precise descent obstructions. The Frobenius trace of the quadratic character sheaf is identified with the quadratic idele character by evaluating at closed points and moving signed divisors away from the branch. The trace argument uses no exactness assertion about Picard stacks.

The accepted parent targets keep their existing identifiers. The eighteen targets below refine their geometric comparisons, obstruction data, approximation input and cyclic trace calculation. Every target is a plan, with implementation status unchecked. The planning pass is complete and GC.6 is planned; the supplier and carrier frontiers below prevent a claim of closure.

## Conventions and imported objects

Unless a target explicitly has weaker hypotheses, let k be a finite field of characteristic p different from 2, X/k a smooth projective geometrically connected curve, R a reduced finite divisor and U=X minus R. Empty R is allowed. A double cover nu:Xprime to X is finite flat of degree two, with Xprime smooth projective geometrically connected and involution sigma. Here R is its reduced branch divisor and the reduced ramification divisor Rprime maps isomorphically to R. The scheme-theoretic inverse image of R is generally nonreduced. Family statements allow any k-scheme T, including nonreduced T; they use X_T, R_T and the base-changed cover. Support moving and idele character determination are statements over k, not relative support-moving assertions for all T.

On the small etale site of X_T put

\[
 A=\mathbf G_m,\qquad B=\nu_*\mathbf G_m,\qquad
 C=\mathbf G_m^{\sqrt R},\qquad
 N=(\operatorname{Nm},\operatorname{res}_{R'}),\qquad K=\ker N.
\]

In a framed chart a section of C is a pair of units (u,v) with res(u)=v². The inclusion j:K to B and quotient map q:B to K satisfy j q(b)=b/sigma(b). The invariant inclusion is i:A to B. Cohomology is written additively and means the existing abelian sheaf cohomology, not a newly defined group. The two short exact sequences are

\[
 0\longrightarrow A\xrightarrow{i}B\xrightarrow{q}K\longrightarrow0,
 \qquad
 0\longrightarrow K\xrightarrow{j}B\xrightarrow{N}C\longrightarrow0.
\]

An object of the root Picard groupoid is (M,J,alpha), where M is a line on X_T, J is a line on R_T and alpha:J² isomorphic to M|R_T. An arrow includes both line isomorphisms and their compatibility with alpha. These are the imported parent `GC.0/root-picard` and `GC.6/root-multiplicative-sheaf`; the first two targets below compare their actual carriers. The full section stack also remembers s in M and t in J with alpha(t²)=s|R_T. Its zero section retains J. Fibrewise nonzero sections form a separate open. The section norm is required on the whole stack.

Tors(H) means the groupoid of locally nonempty sheaves with a simply transitive H-action and equivariant isomorphisms. A based homotopy fibre retains a quotient trivialization and arrows commuting with it. Thus

\[
 \operatorname{Tors}(K)\simeq
 \operatorname{hofib}_{1}\bigl(\operatorname{Tors}(B)\to\operatorname{Tors}(C)\bigr),
 \quad
 \operatorname{Tors}(A)\simeq
 \operatorname{hofib}_{1}\bigl(\operatorname{Tors}(B)\to\operatorname{Tors}(K)\bigr).
\]

Neither formula is ordinary kernel/image exactness on line-bundle classes. In particular the second target is Tors(K), not Tors(B) under 1-sigma. A chosen quotient trivialization is essential.

For the trace targets fix a prime ell different from p and coefficients Qbar_ell. Ell=2 is allowed: these coefficients have characteristic zero. Every Frobenius is geometric. The general input L is a rank-one lisse sheaf on the square-root curve with k-descent; no quadratic-monodromy restriction is imposed until the quadratic specialization. Its all-integer-degree root-Picard character extension P has the coherent multiplication and normalized unit of GC.5. At a closed point x of U write alpha_x=Tr(Fr_x,L_x), where Fr_x is geometric Frobenius over k(x), not a single k-Frobenius on an arbitrarily selected conjugate stalk.

For F=k(X), let I_F be the ordinary function-field idele group and let H be the **image** of the parent modified-unit group in I_F. Set

\[
 Q=I_F/(F^\times H).
\]

The groupoid before taking isomorphism classes retains the kernel of the modified-unit homomorphism. At a branch point this kernel contains the two residue-root labels; replacing the homomorphism by an inclusion loses them. With the parent valuation convention E(a)=sum ord_x(a_x)[x], the associated line is O_X(-E(a)). In particular an inverse uniformizer represents O_X(x)^natural. This is also the normalization under which arithmetic Artin on an inverse uniformizer acts as geometric Frobenius. Signed divisors and closed points of arbitrary degree are used throughout.

## Library boundary and dependencies

The pinned baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 with Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Eighteen exact declarations are recorded in the packet after reading their source statements. In particular:

- `MonoidHom.eqLocus`, `Units.map` and `powMonoidHom` provide the subgroup operations for root-unit coordinates. Squaring is a unit-group homomorphism, never a ring homomorphism.
- `TauCeti.Place.exists_forall_ord_sub_eq` already supplies simultaneous finite valuation approximation, and `TauCeti.Place.exists_forall_residue_eq` already supplies arbitrary finite residue interpolation at distinct places. This part only extracts the nonzero/empty-family corollary and its geometric use.
- `CategoryTheory.Sheaf.additiveUnitsFunctor` and its section formula already form the units of an actual commutative ring sheaf. The missing geometry is not a missing generic units-sheaf definition.
- `CategoryTheory.Sheaf.H`, `H.map`, `CategoryTheory.Abelian.Ext.covariantSequence`, `covariantSequence_exact` and `covariant_sequence_exact₃` supply the cohomology carrier, coefficient maps, connecting sequence and lift exactness. The proposed connecting maps specialize this interface.
- Native `TauCeti.AlgebraicGeometry.InvertibleSheaf` and its tensor product are used through their Core for the Picard groupoid. The category of all line-module maps itself is not a groupoid.
- `PiTensorProduct.map`, `PiTensorProduct.reindex`, `LinearMap.trace` and `finRotate` state the cyclic calculation on real tensor carriers.

Ordinary geometry is imported from the exact SF.3 nodes `picard-groupoid`, `picard-stack-curve`, `picard-cohomological`, `line-bundle-norm` and `universal-section-stack`. Their mathematical contracts were read; their supplier packet has a needs-changes review, so they are plans rather than implemented or accepted-review claims. SF.1 supplies `small-etale-site`, `sheaf-stack` and `qcoh-fpqc-descent`. SF.2 supplies `abelian-torsor-h1` and `site-cohomology-pullback`. D0 supplies `groupoid-quotients-and-two-fibre-products`. No classification theorem for arbitrary banded gerbes is required by the abelian long exact sequence argument.

Current TauCetiRoadmap main at 0d144d044dacebca17b654695b6f1ad58f159b27 was also checked. General tensor sections, strong monoidal pullback and rank-one preservation belong to AlgebraicVectorBundles L0A/L0B/L0C. Picard/divisor/degree interfaces belong to JacobianChallenge A/B/D/F; the curve/function-field comparison belongs to AlgebraicCurves Layer12. SF.3 integrates these contracts. None is planned again here.

FunctionFieldArithmetic supplies the exact nodes `FA.2/projective-ideles`, `FA.2/idele-divisor-exact-sequence`, `FA.4/local-abelian-existence` and `FA.4/global-artin-norm-isomorphism`. The last uses arithmetic Artin normalization and already includes principal reciprocity. The remaining local residue-character adapter is requested separately, rather than rebuilding reciprocity. GC.2 supplies the root-unit and adelic groupoids. GC.3 supplies the tame lisse input, with its recorded root-stack frontier. The GC.5 follow-up supplies the exact `signed-divisor-line` and `signed-character-translation` contracts; their tensor, dual, Frobenius and translation coherence are imported unchanged.

All proposed declaration names below lie in `TauCeti.RamifiedClassField.GC6`. The short label GC6 refers to this namespace. A node identifier is the parent stage `FunctionFieldArithmeticPartII:GC.6` followed by the displayed slug. Dependency lists use exact node identifiers, except the two explicit stage requests.

## 1. Root-unit coordinates

**Target:** `root-unit-coordinates`. **Name:** `TauCeti.RamifiedClassField.GC6.rootUnitCoordinates`.

**Hypotheses.** A0 and B0 are commutative rings in arbitrary universes; r is a ring homomorphism. No nontriviality, reducedness, surjectivity of r or invertibility of 2 is needed for this coordinate definition.

For a homomorphism r:A0 to B0 of commutative rings, rootUnitCoordinates(r) is the native subgroup of A0^units times B0^units cut out by Units.map(r)(u)=v^2. It is the equalizer of the restriction of the first projection and the square of the second projection. It retains both coordinates and their unit proofs. On a framed etale chart this is the section formula for the imported root multiplicative sheaf, not a substitute for its sheaf or stack.

**Proof or construction.**

1. Compose the two native product projections with Units.map(r) and the power homomorphism.
2. Take their existing subgroup equalizer. Restriction maps preserve the defining equality; the geometric comparison is supplied by root-torsor-comparison.

**API.**

- `TauCeti.RamifiedClassField.GC6.mem_rootUnitCoordinates` (characterisation): Membership of (u,v) is equivalent to Units.map(r)(u)=v^2.
- `TauCeti.RamifiedClassField.GC6.rootUnitCoordinates_ext` (extensionality): Two bundled coordinates are equal exactly when both unit coordinates agree.
- `TauCeti.RamifiedClassField.GC6.rootUnitCoordinates_fst_kernel` (characterisation): The elements over u=1 are precisely (1,v) with v^2=1.
- `TauCeti.RamifiedClassField.GC6.rootUnitCoordinates_empty_residue` (compatibility): If B0 is a subsingleton ring, the subgroup is the entire product. Consequently its first projection is the canonical equivalence with A0^units; the suggested signature states the subgroup equality.
- `TauCeti.RamifiedClassField.GC6.rootUnitCoordinates_mk` (constructor): Given units u,v and h:Units.map(r)(u)=v^2, bundle (u,v) as a coordinate; both projections recover the given units. The multiplication, inverse, identity and their projection formulas are inherited from the native subgroup.
- `TauCeti.RamifiedClassField.GC6.rootUnitCoordinates_map` (functoriality): For ring maps f:A0 to A1 and g:B0 to B1 with g composed with r = r1 composed with f, map (u,v) to (Units.map(f)(u),Units.map(g)(v)). This is a group homomorphism, with identity and composition laws and both projection formulas. It supplies restriction between framed charts.

**Uses.** Evaluates actual sheaf sections on a chosen chart and tests that root labels survive. See `FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf; root-torsor-comparison below`. Separates the root-unit group from its image in ordinary ideles. See `FunctionFieldArithmeticPartII:GC.2/root-units; actual-unit-image-determination below`.

**Unit tests.**

- `TauCeti.RamifiedClassField.GC6.coordinates_empty_residue` (degenerate): When B0 is the zero ring there is no residue-root constraint; rootUnitCoordinates(r) is the whole product.
- `TauCeti.RamifiedClassField.GC6.coordinates_two_roots` (computation): For r=id_Z, (1,1) and (1,-1) are distinct members. An implementation identifying them loses the relative mu_2.
- `TauCeti.RamifiedClassField.GC6.coordinates_not_arbitrary` (non-example): For r=id_Z, (-1,1) is not a member.

**Checks.**

- The square operation is on units; it is never treated as a ring homomorphism.
- The first projection need not be injective, and forgetting the second coordinate is not the definition.

**Prerequisites.** `mathlib:MonoidHom.eqLocus`, `mathlib:powMonoidHom`, `mathlib:Units.map`.

**Sources.** [YZ19](#yz19), A.3.1, p. 524, fibre-product sheaf formula. The source gives the sheaf formula; the native subgroup is its framed section adapter. [NATIVE-PINS](#native-pins), MonoidHom.eqLocus; Units.map; powMonoidHom at the recorded pins. Use the existing equalizer and homomorphisms rather than rebuilding their group laws.

**Suggested file.** Native real-bodied subgroup with four representative API signatures and examples for all three tests. The constructor and chart-change API are specified here in the README; native subgroup operations are inherited.

## 2. Root frames and the torsor stack

**Target:** `root-torsor-comparison`. **Name:** `TauCeti.RamifiedClassField.GC6.root_torsor_comparison`.

**Hypotheses.** The curve, cover and sheaf conventions above.

For every T, the groupoid of C-torsors on (X_T)_et is naturally equivalent to the groupoid of triples (M,J,alpha:J^2 isomorphic to M restricted to R_T). It sends a triple to the sheaf of simultaneous frames (e,f) with alpha(f^2)=e|R_T. Its automorphisms are actual compatible frame changes (u,v) with res(u)=v^2. Likewise B-torsors identify with line bundles on Xprime_T; A-torsors identify with line bundles on X_T. These are symmetric monoidal equivalences natural under arbitrary base change and on all arrows.

**Proof or construction.**

1. Choose local frames of the two lines. The discrepancy in alpha is a unit on R_T; after an etale refinement lift its square root, using 2 invertible, to obtain simultaneous frames. This proves local nonemptiness of the frame sheaf.
2. The coordinate subgroup acts simply transitively on simultaneous frames. Conversely extend a C-torsor through the two projections and glue the two trivial lines; the defining equality gives alpha. Cocycle descent makes these inverse on objects and arrows.
3. For B, apply Stacks Lemma 31.18.1 (0BUT): a line on the inverse image of a finite morphism becomes trivial over the inverse image of a Zariski neighbourhood on the base. Thus its B-frame sheaf is already locally nonempty in the etale topology, for arbitrary T.
4. Tensor the frame torsors and compare both constructions locally to get monoidal and base-change coherence. Import general descent, never re-plan it.

**Checks.**

- For R empty recover the ordinary Picard groupoid, with its scalar automorphisms.
- At a geometric point of R keep both roots of unity as arrow labels.
- The result concerns torsors, not arbitrary sections with a square-zero root; no full root-section fibre is replaced by a gerbe.

**Prerequisites.** `FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf`, `FunctionFieldArithmeticPartII:GC.0/root-picard`, `SchemeAndStackFoundations:SF.3/picard-groupoid`, `SchemeAndStackFoundations:SF.3/picard-stack-curve`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `tauceti:CategoryTheory.Sheaf.additiveUnitsFunctor`, `tauceti:CategoryTheory.Sheaf.additiveUnitsFunctor_obj_obj`, `FunctionFieldArithmeticPartII:GC.6/root-unit-coordinates`, `SchemeAndStackFoundations:SF.1/small-etale-site`, `SchemeAndStackFoundations:SF.1/sheaf-stack`, `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`, `SchemeAndStackFoundations:SF.3/picard-cohomological`.

**Sources.** [YZ19](#yz19), A.3.1, p. 524; Definition A.1, p. 514. The paper identifies root Picard objects with torsors. The simultaneous-frame equivalence and its arrows are the explicit descent verification. [STACKS-TORSORS](#stacks-torsors), Definition 21.4.1 and Lemma 95.14.2, tags 03AG and04UJ. Tag 03AG supplies torsor local triviality. Lemma 95.14.2 (04UJ) is stated on the big fppf site; its gluing proof is applied here on the small etale site through the generic SF.1/sheaf-stack contract, descending the sheaf, action and local torsor condition. The root-frame and based-fibre comparisons are authored deductions. [MILNE-LEC](#milne-lec), Theorem 11.4, pp. 78–79. Rank-one locally free modules and G_m torsors agree; the finite-cover frame argument supplies the direct-image version.

[STACKS-NORMS](#stacks-norms), Lemma 31.18.1, tag 0BUT: Line bundles over a finite inverse image trivialize over inverse images of base Zariski neighbourhoods; this proves local nonemptiness of the B-frame torsor without a limit argument.

**Suggested file.** README target: actual etale ring sheaf, frame torsors, base-change coherence and root Picard equivalence require the named geometry suppliers.

## 3. Ramified determinant and residue square

**Target:** `ramified-determinant-chart`. **Name:** `TauCeti.RamifiedClassField.GC6.ramified_determinant_chart`.

**Hypotheses.** The curve and double-cover conventions above. A0 is a local chart ring, a cuts out the branch divisor, and the pulled-back cover is the displayed quadratic algebra. After arbitrary base change a need not be a non-zero-divisor; the determinant identity still holds.

On a quadratic chart S0=A0[t]/(t^2-a) with 2 invertible and involution t mapped to -t, the norm of c+d*t is c^2-a*d^2. Modulo a the norm is the square of the image of c. The reduced branch section has t=0; after every base change this gives res Nm(u)=(res_Rprime u)^2 on units and the natural isomorphism (Mprime|Rprime_T)^2 isomorphic to Nm(Mprime)|R_T on lines. For a norm-one unit with residue1 at the branch, w=1+u is locally invertible there and u=w/sigma(w); ordinary norm-one without residue1 does not suffice.

**Proof or construction.**

1. In the basis (1,t), multiplication by c+d*t has matrix with rows (c,a*d) and (d,c); compute its determinant.
2. Reduce modulo a and use t=0 for the specified Rprime section, retaining the nonreduced inverse-image algebra with t^2=0. Apply the formula to transition units of Mprime, not just to one trivial line.
3. The residue of w is2. The identity sigma(u)=u inverse gives sigma(w)=w/u, hence local surjectivity of q onto K near R. Away from R split the etale double cover. For ker q, write b=c+d*t: sigma(b)=b forces 2*d=0 and hence d=0, so b is an invariant unit; this remains true after nonflat base change. The invariant inclusion is injective because the chart is free with basis (1,t). Together these calculations give exactness at every term of the parent sheaf complex.
4. For a target (u,v) in C, choose etale-locally a square root z of u whose restriction along R is v. Such a branch choice extends etale-locally because z squared=u is etale with 2 and u invertible. Then the invariant unit nu^*z has norm u and branch residue v. Away from R the split cover gives surjectivity directly. This proves epimorphism of sheaves, not global sections.

**Checks.**

- For c=0,d=1 the norm is -a, including the sign; its branch restriction is0.
- At a=0 the upstairs algebra has t^2=0 and is not replaced by its reduction.
- For u=-1, ordinary norm is1 but branch residue is-1; such u is not in ker N when the branch is nonempty.
- Etale surjectivity of N is checked by lifting a square root of the first coordinate with the prescribed branch value. It is not asserted on all global sections.

**Prerequisites.** `SchemeAndStackFoundations:SF.3/line-bundle-norm`, `FunctionFieldArithmeticPartII:GC.6/root-unit-coordinates`, `FunctionFieldArithmeticPartII:GC.6/root-multiplicative-sheaf`.

**Sources.** [YZ19](#yz19), A.3.1 and A.3.3, pp. 524–525. The residue-square and sheaf exactness assertions are expanded by this chart calculation. [STACKS-NORMS](#stacks-norms), Lemma 31.18.6, tag 0BD2. Finite locally free norm is the multiplication determinant and commutes with base change.

**Suggested file.** README geometric/chart theorem. The general finite-flat norm is imported; no quadratic-algebra development is included in Suggested.lean.

## 4. Root norm, torsors and sections agree

**Target:** `norm-section-comparison`. **Name:** `TauCeti.RamifiedClassField.GC6.norm_section_comparison`.

**Hypotheses.** The curve and double-cover conventions above.

Under root-torsor-comparison, extension of B-torsors through N sends Mprime to (Nm Mprime, Mprime|Rprime_T, alpha), with alpha from the residue-square comparison. This equivalence intertwines tensor product, unit, pullback of T and all their associativity comparisons. On the parent whole section stack it sends (Mprime,sprime) to (Nm Mprime,Mprime|Rprime_T,alpha,Nm sprime,sprime|Rprime_T); the root-section square, the forgetful Abel–Jacobi square and tensor multiplication square commute. This holds also for zero sections. On the fibrewise nonzero open, divisors are pushed forward with residue-field multiplicities.

**Proof or construction.**

1. Apply the norm to transition units in a simultaneous frame. The two resulting cocycles are precisely Nm of the line transition and its branch restriction, so identify the extension torsor with the parent root norm.
2. The determinant and transition formulas commute with every coefficient change. Check the tensor and unit comparisons in frames, then descend equality of the whole comparisons.
3. For a section use the determinant of its multiplication map in those frames. The residue-square identity gives the root section. It is polynomial and applies when the section is zero or nilpotent.
4. On fibrewise nonzero sections use the imported finite-flat divisor norm formula. Degree is preserved by the norm and doubled by pullback, with degrees weighted by residue degrees.

**Checks.**

- Norm(O_Xprime(1))=O_X(1) for the cover P1 to P1, t mapped to t^2; norm is not degree doubling.
- A zero section maps to a zero section but its root line is still Mprime|Rprime_T.
- A closed point of residue degree f above its image contributes multiplicity f to pushforward; no degree-one-point assumption is made.

**Prerequisites.** `FunctionFieldArithmeticPartII:GC.6/root-torsor-comparison`, `FunctionFieldArithmeticPartII:GC.6/ramified-determinant-chart`, `FunctionFieldArithmeticPartII:GC.6/root-norm`, `FunctionFieldArithmeticPartII:GC.6/hat-root-norm`, `SchemeAndStackFoundations:SF.3/line-bundle-norm`, `SchemeAndStackFoundations:SF.3/universal-section-stack`.

**Sources.** [YZ19](#yz19), A.3.1–A.3.2, p. 524, display(A.10). These are the norm and section diagrams; the comparison with torsor extension and full coherence are explicit refinements. [STACKS-NORMS](#stacks-norms), Lemmas31.18.2–31.18.3 and31.18.6, tags 0BCY,0BCZ,0BD2. Norms of line transition maps and sections provide the ordinary construction and base change.

**Suggested file.** README target: finite-flat line/section norms and the whole geometric section stacks are not native carriers at the pins.

## 5. Canonical trivialization of the norm of a difference

**Target:** `difference-norm-nullhomotopy`. **Name:** `TauCeti.RamifiedClassField.GC6.difference_norm_nullhomotopy`.

**Hypotheses.** The curve, cover and sheaf conventions above.

For d(M)=M tensor (sigma^*M)^dual, construct a symmetric monoidal natural trivialization tau_M:N(d(M)) isomorphic to 1_C. Its ordinary norm component is cancellation using Nm(sigma^*M) isomorphic to Nm(M); its branch-root component is the identity between the restrictions of M and sigma^*M along sigma|Rprime=id. The square of the latter component equals the restriction of the former. The resulting functor M mapped to (d(M),tau_M) is the composite of extension through q:B to K and j:K to B with its canonical norm trivialization.

**Proof or construction.**

1. In a line frame with transition b, the transition of d(M) is b/sigma(b). Its norm is1 and its branch restriction is1, giving a simultaneous unit frame, not merely an isomorphism class.
2. Descend these compatible frames to tau_M. Norm invariance and evaluation on a line and its dual supply the two components intrinsically.
3. The local coordinate identity is preserved by every frame change, tensor product and pullback. Descent then supplies naturality and all unit/associativity comparisons.

**API.**

- `TauCeti.RamifiedClassField.GC6.differenceNormTrivialization` (data): For every M, the two compatible trivializations constituting tau_M.
- `TauCeti.RamifiedClassField.GC6.differenceNormTrivialization_natural` (functoriality): Every isomorphism M to M2 induces a commuting square with tau_M and tau_M2; identity and composition are preserved.
- `TauCeti.RamifiedClassField.GC6.differenceNormTrivialization_tensor` (compatibility): tau_(M tensor M2) is the tensor of tau_M and tau_M2 under the specified norm and dual comparisons; unit and associativity diagrams commute.
- `TauCeti.RamifiedClassField.GC6.differenceNormTrivialization_pullback` (compatibility): Pullback of tau_M is tau_(M_T2) under the norm base-change and branch restriction comparisons.
- `TauCeti.RamifiedClassField.GC6.differenceNormTrivialization_extension` (equivalence): The K-torsor corresponding to (d(M),tau_M) is extension of the frame B-torsor of M through q.

**Uses.** Defines the actual nullhomotopic composite, including its branch frame. See `FunctionFieldArithmeticPartII:GC.6/torsor-fibre-sequences`. Specifies which norm trivialization a difference line carries. See `FunctionFieldArithmeticPartII:GC.6/norm-descent-obstruction`.

**Unit tests.**

- `TauCeti.RamifiedClassField.GC6.difference_unit` (degenerate): For M=O the image is (O,canonical unit trivialization).
- `TauCeti.RamifiedClassField.GC6.difference_branch_frame` (computation): At a ramified chart the ratio of a frame with its sigma-pullback restricts to1, even when its original root frame is not1.
- `TauCeti.RamifiedClassField.GC6.difference_tensor_coherence` (compatibility): For three lines the two iterated tensor comparisons of tau agree; agreement only on isomorphism classes fails this check.

**Checks.**

- At the branch, trivialize the root line as well as the norm line.
- Replacing tau_M by an unrelated norm trivialization is a different datum and must enter the obstruction calculation.
- For M=1 the specified trivialization is the unit one, not an arbitrary scalar.

**Prerequisites.** `FunctionFieldArithmeticPartII:GC.6/norm-section-comparison`, `FunctionFieldArithmeticPartII:GC.6/root-torsor-comparison`, `FunctionFieldArithmeticPartII:GC.6/exact-sheaf-complex`, `SchemeAndStackFoundations:SF.3/picard-groupoid`.

**Sources.** [YZ19](#yz19), A.3.3, pp. 524–525, four-term sheaf complex before (A.11). The sheaf maps give N composed with(1-sigma)=1. This node supplies the compatible line-level nullhomotopy missing from an unqualified exactness claim.

**Suggested file.** README construction over actual torsor and line-groupoid carriers; omitted from Lean with its full API retained here and in the reader.

## 6. The two torsor fibre sequences

**Target:** `torsor-fibre-sequences`. **Name:** `TauCeti.RamifiedClassField.GC6.torsor_fibre_sequences`.

**Hypotheses.** The curve, cover and sheaf conventions above.

The exact sheaf complex splits into 0 to A to B to K to0 and 0 to K to B to C to0. On every X_T there are natural symmetric monoidal equivalences Tors(K) equivalent to hofib(Tors(B) to Tors(C)) at the unit C-torsor, and Tors(A) equivalent to hofib(Tors(B) to Tors(K)) at the unit K-torsor. A point of the first fibre is (L,tau:N(L) isomorphic to1); its arrows commute with tau. A point of the second is (M,beta:q_*M isomorphic to1); its arrows commute with beta. The second target is Tors(K), not Tors(B) under d=j q. Both equivalences are effective descent equivalences, natural in T.

**Proof or construction.**

1. For a short exact sequence of abelian sheaves, extend an H-torsor through the inclusion to a G-torsor with its canonical quotient trivialization.
2. Conversely take the inverse image of the unit section under the given quotient trivialization; local surjectivity makes this an H-torsor. Use actual sheaf pullbacks, so morphisms and inverse comparisons are determined on sections.
3. Apply this argument to the two short exact sequences. Effective descent glues both torsors and arrows; the constructions commute with restriction and tensor product.
4. Identify the first fibre geometrically by root-torsor-comparison. Difference-norm-nullhomotopy identifies its distinguished image from Tors(B).

**Checks.**

- Do not replace either homotopy fibre by the ordinary kernel on pi_0.
- The automorphisms in the first fibre are H0(K), while those of a descent in the second are H0(A).
- Over a split unramified chart q sends (u,v) to(u/v,v/u), and the first kernel is the diagonal copy of A.

**Prerequisites.** `FunctionFieldArithmeticPartII:GC.6/exact-sheaf-complex`, `FunctionFieldArithmeticPartII:GC.6/root-torsor-comparison`, `FunctionFieldArithmeticPartII:GC.6/difference-norm-nullhomotopy`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `SchemeAndStackFoundations:SF.1/small-etale-site`, `SchemeAndStackFoundations:SF.1/sheaf-stack`, `SchemeAndStackFoundations:SF.1/qcoh-fpqc-descent`.

**Sources.** [STACKS-TORSORS](#stacks-torsors), Definition 21.4.1, Lemmas21.4.2–21.4.3 and Lemma 95.14.2, tags 03AG/04UJ. Tag 03AG supplies torsor local triviality. Lemma 95.14.2 (04UJ) is stated on the big fppf site; its gluing proof is applied here on the small etale site through the generic SF.1/sheaf-stack contract, descending the sheaf, action and local torsor condition. The root-frame and based-fibre comparisons are authored deductions. [YZ19](#yz19), A.3.3, pp. 524–525, sheaf complex and (A.11). Replace the ambiguous displayed stack exactness by these precisely based fibres.

**Suggested file.** README comparison. Generic ordinary two-fibre products are imported from D0, not rebuilt.

## 7. Connecting maps for the two norm sequences

**Target:** `connecting-maps`. **Name:** `TauCeti.RamifiedClassField.GC6.connecting_maps`.

**Hypotheses.** The curve, cover and sheaf conventions above.

Specialize the long exact sequences in the existing abelian sheaf cohomology H to delta_q^n:H^n(K) to H^(n+1)(A) and delta_N^n:H^n(C) to H^(n+1)(K), for all n at least0. For n=0, delta_q(k) is the A-torsor q inverse image(k), and delta_N(c) is the K-torsor N inverse image(c). The identification of torsor classes with the existing H1 intertwines these formulas with the derived connecting maps. In degree1 exactness gives an effective lift criterion, with specified quotient identification, for a K-torsor through B and for a C-torsor through B.

**Proof or construction.**

1. Specialize native Ext.covariantSequence and covariantSequence_exact to the constant integers sheaf and each short exact sheaf complex. Its boundary is postcomposition with hS.extClass. Thus no generic long exact sequence, H carrier or gerbe classification is new work here.
2. For degree0 compare the local choices of lifts with their difference cocycle: transition ratios are in A or K. This fixes the boundary sign convention and identifies the fibres with torsor H1.
3. For degree1 use exactness and the torsor/H1 equivalence: a vanishing connecting class is equivalent to a B-torsor and an isomorphism of its quotient with the prescribed torsor. Check functoriality through the comparison, rather than asserting Cech cohomology equals H2 on arbitrary covers.

**API.**

- `TauCeti.RamifiedClassField.GC6.normConnecting_q` (data): The homomorphism delta_q^n in existing H for each n.
- `TauCeti.RamifiedClassField.GC6.normConnecting_N` (data): The homomorphism delta_N^n in existing H for each n.
- `TauCeti.RamifiedClassField.GC6.normConnecting_zero_add` (structure): Both boundaries preserve zero, sums and negatives.
- `TauCeti.RamifiedClassField.GC6.normConnecting_fibre` (characterisation): In degree0 the boundary is the class of the specified sheaf fibre, with transition ratios of local lifts.
- `TauCeti.RamifiedClassField.GC6.normConnecting_lift_iff` (characterisation): In degree1 a boundary vanishes if and only if the given quotient torsor has a B-torsor lift with quotient identification.
- `TauCeti.RamifiedClassField.GC6.normConnecting_natural` (functoriality): Morphisms of these short exact sequences, including the relevant site restriction maps, commute with all boundaries and existing H.map.

**Uses.** Tests lifting C-torsors and difference lines, and measures change of norm trivialization. See `FunctionFieldArithmeticPartII:GC.6/norm-descent-obstruction`. Separates invariant line classes from actual descent. See `FunctionFieldArithmeticPartII:GC.6/invariance-versus-descent`.

**Unit tests.**

- `TauCeti.RamifiedClassField.GC6.connecting_lifted_section` (computation): delta_N(N(b))=0 and delta_q(q(b))=0 for every global b.
- `TauCeti.RamifiedClassField.GC6.connecting_nontrivial_fibre` (non-example): A section c with no global preimage has a nontrivial fibre torsor; its boundary is nonzero.
- `TauCeti.RamifiedClassField.GC6.connecting_Kummer_case` (compatibility): For the etale Kummer sequence over F_q with q odd, the degree0 boundary of a nonsquare is the nontrivial mu_2 torsor; this tests the common supplier comparison, not an identification of that sequence with the norm sequence.

**Checks.**

- The maps are homomorphisms with zero, addition and inverse laws.
- Restriction/base-change maps of sites commute with the boundaries via the relevant unit and norm comparisons.
- For a globally liftable c or k its boundary is zero. No global surjectivity of q or N on sections is inferred.

**Prerequisites.** `FunctionFieldArithmeticPartII:GC.6/torsor-fibre-sequences`, `mathlib:CategoryTheory.Sheaf.H`, `mathlib:CategoryTheory.Sheaf.H.map`, `SchemeAndStackFoundations:SF.2/abelian-torsor-h1`, `SchemeAndStackFoundations:SF.2/site-cohomology-pullback`, `mathlib:CategoryTheory.Abelian.Ext.covariantSequence`, `mathlib:CategoryTheory.Abelian.Ext.covariantSequence_exact`, `mathlib:CategoryTheory.Abelian.Ext.covariant_sequence_exact₃`.

**Sources.** [MILNE-LEC](#milne-lec), Section9 property(c), p. 64, Remark 9.3 p. 65, Example 9.5 p. 66; Proposition 11.1 p. 77. The long exact sequence and torsor cocycle interpretation supply the maps and exactness; this is their specialization to the two norm sequences. [STACKS-TORSORS](#stacks-torsors), Lemma 21.4.3, tag 03AG; Lemma 21.11.1, tag 0CJZ. Use torsor H1. The latter local-obstruction lemma has extra acyclicity hypotheses, so no universal Cech-H2 or gerbe-classification assertion is imported.

**Suggested file.** README specialization. Existing H and H.map are native; the sheaf/torsor comparison, exact-sequence adapters and geometric sheaves require SF.2/SF.1.

## 8. Norm lifts and their secondary obstruction

**Target:** `norm-descent-obstruction`. **Name:** `TauCeti.RamifiedClassField.GC6.norm_descent_obstruction`.

**Hypotheses.** The curve, cover and sheaf conventions above.

For a C-torsor Q a B-torsor lift with a quotient identification exists exactly when delta_N^1[Q]=0 in H2(K). If nonempty, this lift groupoid is acted on simply transitively by Tors(K), hence is equivalent to Tors(K) after choosing one lift; its class set is a torsor under H1(K) and its automorphisms are H0(K). For a line L upstairs with norm trivialization tau, write P_tau for the corresponding K-torsor. Then (L,tau) is isomorphic to (d(M),tau_M) for some M exactly when delta_q^1[P_tau]=0 in H2(A). On the underlying norm-trivial line class define omega(L) as delta_q^1[P_tau] modulo the image of delta_q^1 composed with delta_N^0:H0(C) to H2(A). This class is independent of tau, and vanishes exactly when [L] is in the image of d_* on H1(B).

**Proof or construction.**

1. The first lift criterion is exactness at H1(C). Tensoring a lift by a K-torsor with its canonical quotient trivialization gives the action; taking the quotient of two lifts gives its inverse.
2. For a fixed tau, lift P_tau through q by the second long exact sequence. Identify the resulting norm-trivialized line with the canonical d(M) using the nullhomotopy comparison.
3. Fix the convention that changing tau by c means tau_new=c inverse times tau. The inverse-image-of-unit definition gives [P_tau_new]=[P_tau]+delta_N^0(c). Thus the displayed quotient class is independent of the choice.
4. If its representative is in the boundary image, alter tau by the opposite c, then lift P_tau through q. Conversely an isomorphism L isomorphic to d(M) transports tau_M to a trivialization with zero representative. This proves the underlying-class criterion.

**Checks.**

- H2(A) is not declared zero; no Brauer vanishing over X_T is assumed.
- A merely trivial norm class does not supply a canonical tau.
- The fixed-trivialization and underlying-class criteria use different obstruction groups.
- For Q=1 with its unit B-lift the lift groupoid is Tors(K), including H0(K) automorphisms.

**Prerequisites.** `FunctionFieldArithmeticPartII:GC.6/connecting-maps`, `FunctionFieldArithmeticPartII:GC.6/difference-norm-nullhomotopy`, `FunctionFieldArithmeticPartII:GC.6/torsor-fibre-sequences`, `SchemeAndStackFoundations:SF.2/abelian-torsor-h1`.

**Sources.** [MILNE-LEC](#milne-lec), Section9 property(c), p. 64 and Section11, pp. 76–79. Exactness and the torsor interpretation prove the primary obstruction and the secondary calculation. [YZ19](#yz19), A.3.3, p. 525, display(A.11). This is an authored, obstruction-sensitive replacement for the recorded interpretation gap E8; it is not attributed as a theorem stated there.

**Suggested file.** README theorem. The quotient is an existing abelian-group quotient after the geometric cohomology adapters are supplied; no stand-in H2 or vanishing hypothesis is introduced.

## 9. Invariant lines and descent data

**Target:** `invariance-versus-descent`. **Name:** `TauCeti.RamifiedClassField.GC6.invariance_versus_descent`.

**Hypotheses.** The curve, cover and sheaf conventions above.

For an upstairs line M, descent to a line on X_T is equivalent to q_*[M]=0 in H1(K). Sigma-invariance of its class is equivalent to q_*[M] lying in the image of delta_N^0:H0(C) to H1(K). The kernel of pullback i_*:H1(A) to H1(B) equals the image of delta_q^0:H0(K) to H1(A). A chosen trivialization of q_*M determines an effective descent object. The full fibre groupoid of pairs (M,beta), allowing isomorphisms of M compatible with beta, is Tors(A) and retains H0(A) automorphisms; this is not the fibre with both M and a specified pullback identification fixed. In particular a chosen isomorphism M isomorphic to sigma^*M alone is not descent data.

**Proof or construction.**

1. Apply exactness to H1(A) to H1(B) to H1(K) for the descent criterion and to H0(K) to H1(A) for the pullback kernel.
2. The class of d(M) is j_* q_*[M]. By the other long exact sequence its vanishing is equivalent to q_*[M] belonging to image(delta_N^0).
3. Use the second torsor fibre equivalence for the actual descended line and arrows; do not extract descent solely from the vanishing of d(M).

**Checks.**

- If M is pulled back, its q-torsor has the canonical trivialization.
- An invariant M may have nonzero q_*[M]; the next degree test forces this possibility.
- If a descent exists, changing its specified isomorphism upstairs need not preserve a previously chosen descent structure.

**Prerequisites.** `FunctionFieldArithmeticPartII:GC.6/connecting-maps`, `FunctionFieldArithmeticPartII:GC.6/torsor-fibre-sequences`.

**Sources.** [YZ19](#yz19), A.3.3, p. 525, display(A.11). The source display motivates the question; the two long exact sequences supply the corrected distinction. [MILNE-LEC](#milne-lec), Section9 property(c), p. 64; Theorem 11.4, pp. 78–79. The exactness and line/torsor comparison give the stated criteria.

**Suggested file.** README geometric statement; no claim of ordinary kernel/image exactness on Picard classes.

## 10. The double projective line degree test

**Target:** `degree-descent-counterexample`. **Name:** `TauCeti.RamifiedClassField.GC6.degree_descent_counterexample`.

**Hypotheses.** k is a finite field of characteristic different from2; both projective lines and the displayed finite flat double cover are defined over k.

Let k be finite of odd characteristic and nu:P1_k to P1_k be t mapped to t^2, with sigma(t)=-t and R={0,infinity}. The line O(1) upstairs is sigma-invariant but is not pulled back from the base: pullback multiplies degree by2. Hence q_*[O(1)] is nonzero although j_*q_*[O(1)]=0, and lies in image(delta_N^0). The same holds for O(-1). Norm preserves degree and sends O(1) to O(1); these statements do not contradict the obstruction-sensitive torsor fibres.

**Proof or construction.**

1. Automorphisms of P1 preserve O(1). The degree of nu^*O(m) is2m, so O(1) and O(-1) cannot descend.
2. Use the corrected invariance criterion to locate their nonzero K-torsor classes in image(delta_N^0).
3. The ordinary finite-flat norm sends the degree-one point0 upstairs to the degree-one point0 downstairs. The line/divisor norm comparison gives Nm O(1)=O(1).

**Checks.**

- A statement identifying invariant line classes with pullback classes must fail this test.
- A norm formula doubling degrees must fail this test.
- The negative-degree version prevents a hidden effective-divisor restriction.

**Prerequisites.** `FunctionFieldArithmeticPartII:GC.6/invariance-versus-descent`, `FunctionFieldArithmeticPartII:GC.6/norm-section-comparison`, `SchemeAndStackFoundations:SF.3/line-bundle-norm`, `SchemeAndStackFoundations:SF.3`.

**Sources.** [YZ19](#yz19), A.3.3, p. 525, display(A.11). This authored example tests the unqualified interpretation of the display, not every coherent interpretation of it. [STACKS-NORMS](#stacks-norms), Lemmas31.18.2 and31.18.6, tags 0BCY/0BD2. These give the ordinary line norm and its determinant. The divisor-pushforward comparison is imported from SF.3/line-bundle-norm through GC6-CURVE-DICTIONARY; it is not asserted in these two Stacks lemmas.

**Suggested file.** README example: ordinary P1 Picard/degree and the closed-point divisor dictionary are supplied through SF.3/upstream AlgebraicCurves.

## 11. Nonzero residue interpolation

**Target:** `unit-residue-approximation`. **Name:** `TauCeti.RamifiedClassField.GC6.exists_unit_with_residues`.

**Hypotheses.** k and F are fields, F is a k-algebra, i ranges over a finite type, and i mapped to P_i is injective. No finite constant field, global function-field instance or completion is needed for the native statement.

For fields k and F with a k-algebra structure, a finite injective family P_i of native TauCeti places and units y_i in their residue fields, there is a unit g in F, integral at every P_i, with residue y_i at every P_i. This includes the empty family. With chosen local rational line frames, the existing order approximation theorem also gives every finite required precision for the section coefficients.

**Proof or construction.**

1. Apply the existing residue theorem to the underlying residues. If the family is nonempty, one prescribed nonzero residue shows g is not0 and hence defines a unit.
2. If the family is empty choose g=1 explicitly; do not try to infer nonzeroness from a nonexistent residue.
3. For greater precision apply exists_forall_ord_sub_eq to the finitely many rational coefficient targets with orders exceeding the needed local bounds. The geometric place/frame dictionary is a separate input to support moving.

**Checks.**

- Two distinct places can be assigned different nonzero residues.
- No prescribed residue is required to be a square; the root-framing use supplies its own values.
- The empty-family proof still returns a unit.

**Prerequisites.** `tauceti:TauCeti.Place.exists_forall_residue_eq`, `tauceti:TauCeti.Place.exists_forall_ord_sub_eq`.

**Sources.** [NATIVE-PINS](#native-pins), TauCeti.Place.exists_forall_residue_eq and exists_forall_ord_sub_eq, Approximation.lean at f790474. The two theorems are already implemented; only the nonzero/empty-case corollary is new. [YZ19](#yz19), Lemma A.5 and (A.4), p. 518. The adelic presentation fixes the root framing and inverse-uniformizer convention. The nonzero residue corollary and its support-moving use are authored deductions from native approximation, not statements of Lemma A.5.

**Suggested file.** Native theorem signature and the empty-case example in Suggested.lean; the pinned general approximation theorems are imports.

## 12. Moving a root-framed line away from the branch

**Target:** `root-framed-support-moving`. **Name:** `TauCeti.RamifiedClassField.GC6.root_framed_support_moving`.

**Hypotheses.** The curve conventions above. The ordinary signed divisor-line comparison and the identification of closed points with native function-field places are supplied through SF.3. Here T=Spec k; family support moving over arbitrary T is not asserted.

Every k-object (M,J,alpha) of the root Picard stack has a presentation O_X(D)^natural for a signed k-rational divisor D supported in U. More precisely, choose a nonzero frame e_J of J on the finite etale k-scheme R. There is a nonzero rational section s of M, regular and nonvanishing at R, with s|R=alpha(e_J squared). Its signed divisor D avoids R, and the isomorphism O_X(D) to M sending the canonical rational section to s, together with 1 mapped to e_J, is an isomorphism of root Picard objects. Its degree is deg M; no effective-degree or rational-basepoint hypothesis is imposed.

**Proof or construction.**

1. An invertible module on each residue field of R is free, so choose e_J componentwise. Choose any rational frame of M.
2. Choose local regular frames at the finitely many branch points. Translate the target alpha(e_J squared) into nonzero residue coefficients in those frames and then into finite approximation conditions on the rational frame coefficient. Native weak approximation supplies them, including the precision needed to cancel any pole of the original frame.
3. The resulting s has order0 and the prescribed value at each branch point. Its divisor is signed and k-rational with support in U. The ordinary divisor-line comparison and the stated root frame give the desired isomorphism.
4. When R is empty choose any nonzero rational section and recover the ordinary comparison. All divisor degrees, including negative ones, are allowed.

**Checks.**

- For M=O,J=O,alpha=1 take D=0,s=1,e_J=1.
- For negative-degree M the representative generally has negative coefficients; an effective-only assertion is false.
- If alpha is multiplied by a nonsquare residue unit, the prescribed value of s changes accordingly. Replacing the target by an arbitrary nonzero residue loses the root isomorphism.
- The construction chooses no degree-one point and works for closed points of any residue degree.

**Prerequisites.** `FunctionFieldArithmeticPartII:GC.6/unit-residue-approximation`, `FunctionFieldArithmeticPartII:GC.0/root-picard`, `FunctionFieldArithmeticPartII:GC.2/root-divisor-groupoid`, `SchemeAndStackFoundations:SF.3`.

**Sources.** [YZ19](#yz19), Lemma A.5 and (A.4), p. 518; A.3.4, p. 525. Lemma A.5 gives the root-framed adelic presentation. The signed divisor representative with support away from R is an authored deduction using native approximation; the root frames and their prescribed values are retained. [NATIVE-PINS](#native-pins), Place/Approximation.lean, the two pinned approximation theorems. Finite local coefficient conditions are within the native weak approximation interface once the geometric dictionary is supplied.

**Suggested file.** README theorem. The rational-section/divisor/place dictionary is not replaced by abstract residue data in Lean.

## 13. Characters determined away from the branch

**Target:** `actual-unit-image-determination`. **Name:** `TauCeti.RamifiedClassField.GC6.actual_unit_image_determination`.

**Hypotheses.** The curve conventions above. F=k(X). Use the parent adelic-root-groupoid equivalence with its inverse-uniformizer convention, and the FA.2 function-field ideles. All homomorphisms in the determination statement are actual homomorphisms on Q; no density or continuity argument substitutes for surjectivity.

Let H be the image of O_sqrtR^units to the ordinary idele group I_F, and Q=I_F/(F^units times H). At a branch place this image consists of local integral units whose residue is a square; off R it is all integral units. The map from signed divisors supported in U to Q sends [x] to the inverse-uniformizer class and is surjective. Hence homomorphisms Q to any abelian group are equal when they agree on every such class. For trace characters use Qbar_ell^units. The root-unit kernel, a product of mu_2 on R, survives as arrow labels in the double action groupoid even though Q is its class quotient.

**Proof or construction.**

1. Use the root-unit coordinate equation res(u)=v squared to compute the actual image and its kernel. Squares in every finite residue field are tested componentwise.
2. Use the imported adelic root groupoid to identify isomorphism classes with Q. Apply root-framed-support-moving to a representative root Picard object to get a signed divisor in U.
3. The associated class is the product of the inverse-uniformizer classes to their signed multiplicities. Evaluate both characters on this finite product. There is no passage to a profinite completion.

**Checks.**

- Using the full ordinary unit subgroup at R discards the square-residue distinction and changes Q.
- For R empty recover the ordinary idele/Picard-class determination.
- A negative multiplicity gives the inverse character value.
- All closed points, rather than only k-rational points, are required.

**Prerequisites.** `FunctionFieldArithmeticPartII:GC.6/root-framed-support-moving`, `FunctionFieldArithmeticPartII:GC.2/root-units`, `FunctionFieldArithmeticPartII:GC.2/adelic-root-groupoid`, `FunctionFieldArithmetic:FA.2/projective-ideles`, `FunctionFieldArithmetic:FA.2/idele-divisor-exact-sequence`.

**Sources.** [YZ19](#yz19), Lemma A.5 and (A.4), p. 518; A.3.4, p. 525. The adelic root quotient and approximation justify the determination step; the statement keeps the actual unit image rather than forgetting its branch condition.

**Suggested file.** README theorem. FA.2 owns ideles and the parent GC.2 owns the double action groupoid. Their carriers are not replicated.

## 14. Quadratic reciprocity factors through the root quotient

**Target:** `reciprocity-root-unit-triviality`. **Name:** `TauCeti.RamifiedClassField.GC6.reciprocity_root_unit_triviality`.

**Hypotheses.** The curve and double-cover conventions above. Use arithmetic local Artin maps in FA.4, so an inverse uniformizer corresponds to geometric Frobenius. Values are mapped from {+1,-1} into Qbar_ell^units with ell different from p.

Let eta be the quadratic idele character associated with the given double cover, obtained from the finite Artin norm quotient. It is trivial on principal ideles and on H, the actual modified-unit image. At every x in U it takes the inverse uniformizer to the trace of geometric Frobenius on the quadratic rank-one local system: +1 at split x and -1 at inert x. At x in R the local character on integral units is the quadratic character of the residue field, so every square-residue unit is killed. Thus eta defines a character of Q.

**Proof or construction.**

1. Import the finite global Artin norm quotient, which supplies principal triviality. The quadratic representation takes its values in the two signs.
2. At unramified places integral units act trivially. At a tame ramified place the determinant chart shows that the residue of the norm of a unit is a square. Conversely a square-residue unit is a square in the complete local field by Hensel with 2 invertible, hence is the norm of its invariant square root. A unit norm can only come from a unit in this totally ramified degree-two extension. The local norm quotient from FA.4 therefore gives exactly the residue quadratic character. Request the completion/Hensel/residue adapter there.
3. Multiply the local values in the finite quotient; only finitely many are nontrivial. Invert the arithmetic uniformizer action to get geometric Frobenius. On the two geometric points above an unramified x this action is the identity in the split case and exchanges the points in the inert case, hence acts on their anti-invariant line by +1 and -1 respectively. This argument does not assume the parent quadratic-input conclusion that eta kills H.

**Checks.**

- An ordinary local unit with nonsquare residue at a branch point has value-1 and cannot be added to H.
- At a degree-two inert closed point the inverse uniformizer still has value-1.
- No isomorphism between the uncompleted idele class group and the absolute Galois group is asserted.
- The same sign formula holds for ell=2, since Qbar_2 has characteristic0.

**Prerequisites.** `FunctionFieldArithmetic:FA.4/global-artin-norm-isomorphism`, `FunctionFieldArithmetic:FA.4/local-abelian-existence`, `FunctionFieldArithmetic:FA.4`, `FunctionFieldArithmeticPartII:GC.2/root-units`, `FunctionFieldArithmeticPartII:GC.6/ramified-determinant-chart`.

**Sources.** [YZ19](#yz19), A.3.4, p. 525, first paragraph and proof of Proposition A.12. The quadratic input and local evaluations are used here; the existing FA.4 finite Artin theorem supplies global reciprocity. The tame residue adapter remains a precise request.

**Suggested file.** README theorem; finite Artin maps are imported from FA.4 and its local residue comparison is requested there.

## 15. Cyclic tensor trace in rank one

**Target:** `rank-one-cyclic-tensor-trace`. **Name:** `TauCeti.RamifiedClassField.GC6.rankOne_cyclicTensor_trace`.

**Hypotheses.** E is a field in arbitrary universe, V is an E-module with additive group, finite-dimensional with finrank E V=1, n is a natural number and a is any scalar, including0. No characteristic or a squared=1 assumption.

Let E be a field, V a finite-dimensional E-vector space with dim V=1, d=n+1 a positive integer and a in E. On the native tensor product over Fin d, let T be cyclic left shift followed by multiplication by a on the last factor. Thus T(v_0 tensor ... tensor v_(d-1))=v_1 tensor ... tensor v_(d-1) tensor a*v_0, including d=1. Then Tr(T)=a. In particular it is not a raised to the closed-point degree. Different one-dimensional stalk factors with isomorphisms around a cycle reduce to this statement by transporting bases; a is the scalar of their composite around one cycle.

**Proof or construction.**

1. Choose a basis vector e of V; the pure tensor of d copies of e is a basis of the one-dimensional tensor product.
2. Reindex by the inverse finRotate so the new factor i is the old forward-cyclic factor. Apply a times identity at the last factor and identity elsewhere. The basis tensor goes to a times itself.
3. Take the native linear trace. For distinct stalks transport all factors along the cycle; exactly one remaining map is the full-cycle scalar.

**Checks.**

- For d=1 the operator is a times identity and trace=a.
- For d=2 and a=-1 the trace is-1, whereas a squared=1.
- For d=3 over Q with a=2 the trace is2, not8.
- For a=0 the trace is0; invertibility is not a hidden linear-algebra hypothesis.

**Prerequisites.** `mathlib:PiTensorProduct.map`, `mathlib:PiTensorProduct.reindex`, `mathlib:LinearMap.trace`, `mathlib:finRotate`.

**Sources.** [YZ19](#yz19), A.3.4, pp. 525–526,(A.12). The source cyclic operator applies one full local Frobenius in the cycle. This node isolates its rank-one linear-algebra trace, with degree and orientation explicit. [NATIVE-PINS](#native-pins), PiTensorProduct.map/reindex, LinearMap.trace and finRotate at Mathlib082e2d3. These give honest native tensor and trace carriers for the suggested signature.

**Suggested file.** Native theorem signature plus degree-two inert and degree-three nonquadratic examples. The geometric stalk transport remains in signed-divisor-trace.

## 16. Frobenius trace on every signed divisor

**Target:** `signed-divisor-trace`. **Name:** `TauCeti.RamifiedClassField.GC6.signed_divisor_trace`.

**Hypotheses.** The curve, rank-one lisse and all-degree character conventions above.

For the rank-one lisse sheaf L and its all-degree character extension P, set alpha_x=Tr(Fr_x,L_x) for every closed point x of U, with Fr_x geometric. For a signed divisor D=sum_x n_x[x] supported in U, the trace of geometric k-Frobenius on P at O_X(D)^natural is the product of alpha_x raised to n_x. For a single closed point of degree d, the Frobenius operator on the tensor of its d conjugate stalks is the cyclic operator with one full Fr_x and its trace is alpha_x. Unit, addition and inverse formulas follow from the chosen all-degree multiplication and unit, not from an effective-only comparison.

**Proof or construction.**

1. Use the k-defined GC.5 signed translation isomorphism at the unit to identify P at O(D)^natural with the Frobenius line Lambda_D. Its descent datum cyclically permutes conjugate stalks at every closed point.
2. For a positive point transport the stalk factors around the Frobenius cycle. Apply the native cyclic trace theorem, with the full-cycle scalar equal to alpha_x.
3. For n_x negative use the dual line with its dual Frobenius, whose scalar is alpha_x inverse. The coherent unit has trace1. Tensor multiplication gives the finite signed product.

**Checks.**

- D=0 has trace1 in degree0.
- For D=-[x], the trace is alpha_x inverse; a nonquadratic L distinguishes this from alpha_x.
- At degree-two inert x the quadratic trace is-1, not1.
- No trivialization of every stalk and no globally quadratic hypothesis is used for the general formula.

**Prerequisites.** `FunctionFieldArithmeticPartII:GC.6/rank-one-cyclic-tensor-trace`, `FunctionFieldArithmeticPartII:GC.5/signed-divisor-line`, `FunctionFieldArithmeticPartII:GC.5/signed-character-translation`, `FunctionFieldArithmeticPartII:GC.5/unit-trivialization`, `FunctionFieldArithmeticPartII:GC.5/character-associativity`, `FunctionFieldArithmeticPartII:GC.5/character-symmetry-unit`, `FunctionFieldArithmeticPartII:GC.6/trace-character`.

**Sources.** [YZ19](#yz19), A.3.4,(A.12), pp. 525–526. Closed-point cyclic Frobenius is the source input. The signed/all-degree extension is the precise GC.5 transport, correcting any effective-only or Frobenius-inversion shortcut.

**Suggested file.** README geometric trace theorem with a native linear-algebra input; GC.5 signed Frobenius lines are imported, not rebuilt.

## 17. Split and inert Frobenius signs

**Target:** `quadratic-local-values`. **Name:** `TauCeti.RamifiedClassField.GC6.quadratic_local_values`.

**Hypotheses.** The curve and double-cover conventions above. ell is a prime different from char k, including2; coefficients are Qbar_ell and the anti-invariant projector is (1-sigma)/2. Only U, where nu is etale, is used for this fibre calculation.

On U, the anti-invariant summand of nu_*Qbar_ell is a rank-one lisse sheaf. At every closed point x, geometric Frobenius acts on its fibre by+1 if the two-point etale fibre splits over k(x), and by-1 if it is inert. The same scalar is eta(inverse_uniformizer_x). This identifies the local trace values needed in the quadratic trace theorem, including non-rational closed points.

**Proof or construction.**

1. The stalk is the permutation representation on the two geometric points of the fibre. Its anti-invariant line is generated by their difference.
2. The geometric Frobenius permutation is identity in the split case and the transposition in the inert case. The difference vector has the stated eigenvalue, independent of the degree over k.
3. Compare with the local Artin description for the quadratic extension. Geometric and arithmetic Frobenius are inverse; for these signs their eigenvalues coincide, while the global convention is still fixed.

**Checks.**

- The split two-point fibre has anti-invariant trace+1, not the full permutation trace2.
- The inert fibre has anti-invariant trace-1, not the full permutation trace0.
- The argument remains valid for ell=2 because the coefficient field contains1/2.

**Prerequisites.** `FunctionFieldArithmeticPartII:GC.6/reciprocity-root-unit-triviality`, `FunctionFieldArithmeticPartII:GC.3/tame-local-systems`, `FunctionFieldArithmeticPartII:GC.6/quadratic-input`.

**Sources.** [YZ19](#yz19), A.3.4, pp. 525–526, definition of L and proof of Proposition A.12. The quadratic sign is computed on the anti-invariant rank-one summand, which is the local system used by the character construction.

**Suggested file.** README lisse/stalk comparison; finite-cover lisse sheaves are an inherited GC.3 supplier frontier.

## 18. The quadratic trace character on the root quotient

**Target:** `all-degree-character-identification`. **Name:** `TauCeti.RamifiedClassField.GC6.all_degree_character_identification`.

**Hypotheses.** The curve, rank-one lisse and all-degree character conventions above. P is the all-degree extension of L used in signed-divisor-trace; chi is defined on the actual quotient Q. The quadratic specialization uses the cover hypotheses of quadratic-local-values.

Let P be any rank-one character sheaf on the root Picard stack with its coherent unit and all-integer-degree multiplication, and suppose its closed-point eigenvalues alpha_x agree with chi(inverse_uniformizer_x) for a homomorphism chi:Q to Qbar_ell^units. Then its Frobenius trace character equals chi on every k-object. For the quadratic local system of the given double cover, quadratic-local-values and reciprocity-root-unit-triviality supply this condition with chi=eta, proving the parent quadratic-trace target. The argument makes no use of the ambiguous Picard-stack exactness display.

**Proof or construction.**

1. The coherent multiplication and unit make Frobenius trace a homomorphism on isomorphism classes Q, as in the imported trace-character target.
2. For O(D)^natural use the signed-divisor trace formula and the assumed values of chi to get the same finite signed product. Every object has such a presentation by root-framed-support-moving.
3. Equivalently apply actual-unit-image-determination to the two homomorphisms. Insert the quadratic local eigenvalues and finite reciprocity character for the stated specialization.

**Checks.**

- The unit trace is1, excluding a free constant Frobenius twist.
- All integer degree components are tested by signed presentations, without a chosen rational point.
- The proof uses neither descent of every invariant line nor vanishing of H2(A).
- A general nonquadratic chi distinguishes inverse uniformizers from uniformizers; the quadratic sign alone would not.

**Prerequisites.** `FunctionFieldArithmeticPartII:GC.6/actual-unit-image-determination`, `FunctionFieldArithmeticPartII:GC.6/signed-divisor-trace`, `FunctionFieldArithmeticPartII:GC.6/quadratic-local-values`, `FunctionFieldArithmeticPartII:GC.6/trace-character`.

**Sources.** [YZ19](#yz19), A.3.4, Proposition A.12 proof, pp. 525–526; (A.4), p. 518. The source proves the quadratic trace identity by local evaluations and character determination. This target records the all-degree and actual-unit-image conditions explicitly.

**Suggested file.** README final target. Its native cyclic trace input elaborates separately; no lisse or stack carrier is invented.

## Obstruction convention and the source interpretation

The nullhomotopy target fixes the trivialization carried by a difference line d(M)=M tensor (sigma^*M)^dual. This matters even if the underlying norm class vanishes. If tau:N(L) isomorphic to 1 is a chosen norm trivialization, define P_tau as the preimage of the unit in the corresponding B-torsor. A change of convention is pinned as

\[
 \tau_{\mathrm{new}}=c^{-1}\tau,\qquad
 [P_{\tau_{\mathrm{new}}}]=[P_\tau]+\delta_N^0(c).
\]

Consequently

\[
 \omega(L)=
 [\delta_q^1(P_\tau)]\ \in\
 H^2(A)/\operatorname{im}(\delta_q^1\delta_N^0)
\]

is independent of tau. Its vanishing is the criterion for the *underlying* line class to be a difference. For a *fixed* tau, the criterion is instead delta_q^1[P_tau]=0 in H²(A) itself. The proof is a pair of applications of exactness in the already existing derived cohomology, followed by the imported torsor/H¹ comparison. It requires no assumption that a chosen ordinary covering computes H², and no claim that every obstruction gerbe has already been classified.

The full fibre groupoid of pairs (M,beta:q_*M isomorphic to 1), allowing isomorphisms of M that preserve beta, is Tors(A) and has H⁰(A) automorphisms. This does not say that, after fixing both M and an identification of a descent's pullback with M, the resulting groupoid still has every scalar automorphism. That distinction prevents a further loss of the specified descent data.

The parent source issue `FunctionFieldArithmeticPartII/E8` concerns the unqualified Picard-stack exactness display (A.11) in Yun–Zhang, A.3.3, printed p.525. Its confirmed interpretation gap is inherited without creating a duplicate finding. The two based torsor fibres and the obstruction formulas above are the precise replacement used here. They do not assert that every possible intended coherent interpretation of the source display is false. The published author-hosted copy was reread on 18 October 2026; the correction search recorded by the parent is dated 2 October 2026 and is not claimed as a new search. No new source issue was found in this pass. The quadratic trace proof depends on multiplication, Frobenius transport and support moving, independently of this display.

## Coverage of the parent targets

| Parent GC.6 target | Refinement or import |
| --- | --- |
| root-multiplicative-sheaf | Targets1–2; the parent sheaf and GC.0 root Picard object are imported |
| norm-residue-square | Target3, determinant and branch restriction |
| root-norm | Target4, torsor/norm comparison |
| root-norm-surjective | Target3, etale-local lifts with prescribed root |
| norm-kernel | Target3, residue-one kernel near ramification |
| exact-sheaf-complex | Targets3 and6; parent sheaf complex retained |
| picard-descent-obstructions | Targets5–10; compatible nullhomotopy, fibres and boundaries |
| hat-root-norm | Target4, whole section stack and its diagrams |
| quadratic-input | Targets14 and17, finite reciprocity and the two-point stalk |
| trace-character | Exact parent node imported: coherent GC.5 multiplication and unit already give its proof |
| closed-point-trace | Targets15–16, native cycle and signed Frobenius line |
| away-ramification-generation | Targets11–13, native approximation and the actual quotient |
| quadratic-trace | Target18, local comparison on every integer-degree component |

The parent already selects five GC.6 planets. This refinement adds only **Norm descent obstructions**, giving six across the combined layer. The coordinate adapter and the proof-level trace calculation do not become extra planets. Parent identifiers, sources and planet choices are unchanged.

## Precise supplier frontiers

1. **GC6-CURVE-DICTIONARY — SchemeAndStackFoundations:SF.3.** Integrate the existing AlgebraicCurves Layer12 and JacobianChallenge LayerA contracts. The required output identifies closed points with native places, their residue fields and valuations; turns a rational line section into its signed divisor and its O(div s) isomorphism; identifies a regular frame's value with the residue; and preserves degree under the norm while doubling it under degree-two pullback. The support-moving target needs this at non-rational branch points and with negative divisor coefficients. Generic weak approximation, ordinary tensor products and general line norms are already imports.
2. **GC6-TAME-RESIDUE — FunctionFieldArithmetic:FA.4.** Export the ramified quadratic local-unit formula in odd residue characteristic from ClassFieldTheory's local Artin/conductor interface. A unit's character value is the quadratic character of its residue. Compare arithmetic uniformizers with geometric inverse uniformizers. The existing finite global norm quotient already supplies principal reciprocity and is not requested again.
3. **Inherited root-stack lisse/Frobenius frontier.** Parent ST-LISSE/ST-OPS and the GC.5 signed transport contract still require real lisse sheaves on the tame root stack, finite-cover stalks, and Frobenius-compatible tensor/dual transport. A native tensor identity does not create these carriers. Conversely this stage does not require a complete stack six-functor formalism, a cohomological trace formula, or general nonabelian gerbe classification.

The first two entries are explicit cross-roadmap requests. The third records an inherited gap rather than assigning another roadmap's objects to GC.6. Exact SF.1/SF.2/SF.3 nodes supply the ordinary sites, torsor descent, cohomology comparisons, Picard groupoids and line norms as planning leaves. Their realization is not claimed by this packet. All targets in this stage have statements, prerequisites, proof sketches and checks, so the pass is complete and the stage is planned; these frontiers remain precise work for suppliers and the independent review.

## Suggested Lean file and omission ledger

The 132-line suggested file states a small part of this plan on carriers that exist at the pins. It contains one real-bodied subgroup definition; four representative API target statements; five coordinate examples covering all three tests; the nonzero residue theorem and its actual empty-family specialization; and the cyclic tensor trace theorem with degree-two and degree-three examples. Independent lean-check elaboration on 18 October 2026 returned exit 0 and fourteen warnings, all declaration uses of sorry. No data definition has an unproved body. The constructor and chart-change API remain README specifications. These are roadmap signatures and make no implementation claim.

| Target(s) | What the suggested file states | What remains specified here |
| --- | --- | --- |
| root-unit-coordinates | Actual native subgroup, four representative API statements, zero-residue, both-root and non-member examples | The constructor and chart-change API and geometric sheaf identification (target2); the subsingleton-residue API states subgroup equality, from which the first-projection equivalence is immediate |
| root-torsor-comparison | No substitute carrier | Simultaneous frames, actual torsors, lines and all arrows/coherence |
| ramified-determinant-chart; norm-section-comparison | No quadratic-algebra or norm development | Local determinant, nonreduced branch, arbitrary base change, line/section norm diagrams |
| difference-norm-nullhomotopy | No substitute carrier | Full five-item API, unit/branch/tensor tests and geometric natural trivialization |
| torsor-fibre-sequences | No artificial groupoid with assigned homotopy groups | Both based fibres and effective inverse functors |
| connecting-maps | No new H¹/H² carrier | Full six-item API, liftable-section/nontrivial-fibre/Kummer tests, specialization of native Ext and imported torsor comparison |
| norm-descent-obstruction; invariance-versus-descent; degree-descent-counterexample | No assertion about arbitrary predicates | The primary and secondary obstructions, choice convention, automorphisms and P1 degree computation |
| unit-residue-approximation | Native theorem on actual TauCeti places and residue units | Local-frame/valuation dictionary in target12 |
| root-framed-support-moving; actual-unit-image-determination | No replacement for root Picard points or ideles | Signed support, exact root-frame constraint, class quotient and retained groupoid kernel |
| reciprocity-root-unit-triviality; quadratic-local-values | No fake character or stalk object | Exact FA.4 imports, tame residue request and actual two-point anti-invariant fibre |
| rank-one-cyclic-tensor-trace | Actual PiTensorProduct map/reindex and LinearMap.trace, scalar on the last factor | Transport between distinct conjugate stalks in target16 |
| signed-divisor-trace; all-degree-character-identification | No unconstructed lisse/sheaf carrier | GC.5 signed translation, negative powers, normalized unit and all-degree quadratic comparison |

## Sources read

### YZ19

Zhiwei Yun and Wei Zhang, *Shtukas and the Taylor expansion of L-functions (II)*, Annals of Mathematics189 (2019),393–526. [Published author-hosted copy](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), read18 October2026, SHA-256 `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`. The mathematical receipts are AppendixA, printed pp.514–526: DefinitionA.1 p.514; Lemma A.5 and (A.4) p.518; LemmasA.8 andA.10 and PropositionA.11 pp.520–523; the norm constructions and exact sheaf complex A.3.1–A.3.3 pp.524–525; PropositionA.12 and(A.12) pp.525–526. PropositionA.11 constructs the character sheaf; PropositionA.12 identifies the quadratic trace character. Authored deductions above are distinguished from statements actually made there.

### STACKS-TORSORS

The Stacks Project, [tag03AG](https://stacks.math.columbia.edu/tag/03AG), Definition21.4.1 and Lemmas21.4.2–21.4.3; [tag04UJ](https://stacks.math.columbia.edu/tag/04UJ), Lemma95.14.2 (big fppf; its gluing proof is used through the generic SF.1/sheaf-stack contract on the small etale site); [tag0CJZ](https://stacks.math.columbia.edu/tag/0CJZ), Lemma21.11.1, read18 October2026. The last result has explicit cofinal-acyclicity assumptions and is not cited as a general classification of gerbes by derived H². Stable tags identify the results if section numbering changes.

### STACKS-NORMS

The Stacks Project, [tag0BCX](https://stacks.math.columbia.edu/tag/0BCX), section31.18, Lemmas31.18.1–31.18.3 (0BUT,0BCY,0BCZ) and31.18.6 (0BD2), read18 October2026. Finite locally free determinant norms, line transition maps and section norms commute with arbitrary base change.

### MILNE-LEC

James S. Milne, [*Lectures on Etale Cohomology*](https://www.jmilne.org/math/CourseNotes/LEC.pdf), version2.21,22 March2013, read18 October2026. Section9 property(c), p.64, Remark9.3 p.65 and Example9.5 p.66 provide the cohomology/Ext sequence; Section11, Proposition11.1 p.77 and Theorem11.4 pp.78–79 supply torsor cocycles and the line comparison. These are used only with the stated abelian sheaves and the two specified short exact sequences.

### NATIVE-PINS

The exact Mathlib and Tau Ceti declarations listed in the packet baseline were read in their source files at the recorded pins. In particular the [pinned Tau Ceti approximation file](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/FunctionField/Place/Approximation.lean) already proves the finite-place approximation used here. Tau Ceti approximation, units-sheaf and line-bundle files were compared with the raw pinned files, and the shared Mathlib source commit was checked. Current upstream roadmaps and library files were inspected read-only as a duplication check. No restricted book or unavailable source was needed.
