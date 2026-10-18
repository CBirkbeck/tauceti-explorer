# Stable reduction, Part II — MC.1: the unpointed Deligne–Mumford construction

This part supplies the missing proof contracts for the tricanonical presentation of the stack of stable unpointed curves. Fix an integer genus g≥2. The goal is the proper smooth Deligne–Mumford stack M̄_g over Spec Z, of relative dimension 3g−3, with dense open M_g and a relative normal-crossing boundary. The original thirteen targets remain in the [parent packet](../packets/StableReductionPartII.json). The [refinement packet](../packets/StableReductionPartII--MC.1.json) adds twelve targets and maps every original target to its inputs. It changes none of the parent IDs.

The planning pass is complete, with MC.1 coverage **planned**. It is not closed: eight generic supplier contracts Q1–Q8 and the transitive supplier gaps below remain explicit. These are mathematical contracts for other owners, rather than invented library implementations. All nodes have implementation status unchecked. The [suggested file](../suggested/StableReductionPartII--MC.1.lean) elaborates at the recorded pins; it contains the real numerical polynomial and its API and examples. The geometric carriers remain targets in this document, following the roadmap shape prescribed in WORKERS.md.

## Scope, conventions and ownership

A curve family is proper, flat and finitely presented, with geometrically connected nodal fibres of pure dimension one and constant arithmetic genus g. Stability means relative ampleness of the dualizing line ω. These are the existing StableReduction Layer 3 notions. All moduli statements quantify over arbitrary schemes. Where a construction starts on a Noetherian Hilbert scheme, its representing property still tests all schemes mapping to it. The passage from the existing locally Noetherian cohomology package to arbitrary bases is isolated in Q1 and `refinement-arbitrary-base`.

Write r=5g−5. The projective bundle P(E)=Proj Sym(E) represents invertible quotients of E. Thus the tricanonical evaluation f*E→ω³ embeds C in P(E), with E=f_*ω³. The standard ambient space is P(O^r)=P^{r−1}, of dimension 5g−6. PGL_r is indexed by the rank r; the original paper sometimes indexes its notation by projective dimension instead. PGL_r here is a smooth group scheme and fppf quotient, with dimension r²−1. A quotient of matrix groups on the points of each ring is not its definition.

A projective frame is an isomorphism P(E)≅P(O^r). A linear basis of E is stronger data. In a projectively framed embedded family the hyperplane line has the form O_C(1)≅ω³⊗f*L for a line L on the base. Neither a trivialization of L nor a separately chosen polarization-line isomorphism belongs to the moduli problem. This distinction controls both the Hilbert locus and its Isom scheme.

The moduli object retains isomorphisms of curves and automorphism groups. A deformation of a particular C/k carries an identification of its special fibre with C; this removes special-fibre relabelling from deformation morphisms, while the moduli stack still retains the automorphisms of C. The absence of infinitesimal automorphisms does not mean that all automorphisms vanish.

The following boundaries govern reuse:

- Current TauCetiRoadmap **StableReduction**, Layers 1–3, supplies nodes, normalization, coherent curve theory, stable families, tricanonical positivity and the zero-vector-field theorem. Layer 8 supplies stable reduction for a smooth generic curve, allowing a finite fraction-field extension, and same-DVR uniqueness between two existing stable models with smooth generic fibre. Their proofs are imported unchanged. The marked and nodal-generic extension work of its Layer 9 is outside this unpointed construction.
- **AlgebraicVectorBundles** supplies the finite locally free carrier, tensor operations and duals. Its actual current library files were read. These do not already provide a relative Hilbert scheme, derived pushforward, a projective-linear group scheme, or the coherent deformation sequence. Generic projective geometry belongs to R09.1 and SF.5.
- **AlgebraicModuliForArithmeticGeometry** owns the Hilbert and fixed-polynomial Isom construction (R09.2), universal cohomology rank strata (A0-extension), projective bundles and rank loci (R09.1), and comparison of deformation functors with completed local rings (R09.6). In particular, the determinantal rank stratum is imported, not defined again here.
- **SchemeAndStackFoundations** owns quotient stacks and atlas criteria (SF.1), coherent Ext (SF.2), deformation/effectivity and relative normal-crossing criteria (SF.4). SF.4 already has `stable-curve-stack`, `isom-stable-curves`, `stable-curve-stack-algebraic` and `stable-curve-stack-smooth`. The last three overlap terminal MC.1 claims. At assembly those terminal statements should have one owner, with the unpointed proof refinements here attached to their n=0 specialization. No new terminal copy is introduced in this packet, and no proof below assumes one of those terminal theorems.

The supplied read-only roadmap checkout was inspected at `0d144d044dacebca17b654695b6f1ad58f159b27`, including StableReduction, JacobianChallenge and AlgebraicVectorBundles. The current Tau Ceti library was inspected at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These observations supplement the pinned audit; they do not change its commits. The tier guide describes foundations as merged, whereas the supplied checkout has no SchemeAndStackFoundations or AlgebraicModuliForArithmeticGeometry directory. This discrepancy is recorded for the maintainer; atlas supplier nodes are treated as plans with their actual gaps.

## Construction and dependency order

First extend the tricanonical comparison to arbitrary bases. On the stable open of the fixed Hilbert scheme, impose that O_C(1)⊗ω^−3 comes from a line on the base. This uses a universal rank stratum followed by an evaluation-isomorphism open. Impose completeness of the coordinate linear series by one more determinant open. The resulting U_g represents projective frames. Its universal Isom relation is U_g×PGL_r, and effective descent gives the quotient presentation of the already defined curve stack.

The deformation sequence is independent of the Isom properness argument. It gives unobstructed curve deformations and independent node directions; the projective frame adds r²−1 formally smooth directions. Comparing these with the completion of the existing Hilbert scheme proves smoothness and source density. The universal source-generic trait test can then prove properness of Isom. Combining that with geometric unramifiedness gives a finite diagonal and the étale-atlas criterion. This order does not assume a finite diagonal in order to prove the Hilbert atlas smooth.

For the boundary, use the actual finite unramified singular scheme of the universal curve. Étale splitting gives algebraic branch ideals. Their completed ideals are the individual node parameters. Cartier and relative smooth-intersection properties descend from that comparison, and relative coordinates give the normal-crossing divisor. This approach does not assume that an arbitrary factorization in a completed ring descends to algebraic functions.

Finally, finite type, separatedness and the dense smooth open permit the stack valuative criterion. Stable reduction supplies existence after a finite fraction-field extension; separatedness supplies uniqueness separately. The finite diagonal and properness over Spec Z are distinct conclusions with distinct trait tests.

## Targets, APIs and checks

All IDs in the following subsections have prefix `StableReductionPartII:MC.1/`. Definition and construction APIs are specified in full, with distinguishing tests. The numerical definition is the only new carrier available at the pins and therefore the only definition placed in the suggested Lean file. Heavy geometry stays in the roadmap document.

### 1. The tricanonical Hilbert polynomial

ID: `refinement-polynomial`. Kind: definition.

For g a natural number define P_g in Z[T] by P_g(T)=(g−1)(6T−1), with the subtraction performed in Z. The geometric use assumes g≥2. Its linear coefficient is 6(g−1), its value at zero is 1−g, and P_g(1)=5(g−1).

**Hypotheses and conventions.** g is a natural number; stable-curve applications assume g≥2.

**Construction or proof.** Use the existing constant and variable polynomials, rather than introducing a new polynomial carrier. Apply Riemann–Roch for ω³ on a stable genus-g curve from StableReduction Layer 2 to identify this numerical profile with its Hilbert polynomial.

**API.**

- `tricanonicalHilbertPolynomial.eval` (simp): P_g(a)=(g−1)(6a−1) for every integer a.
- `tricanonicalHilbertPolynomial.coeff_one` (data): The coefficient of T is 6(g−1).
- `tricanonicalHilbertPolynomial.eval_zero` (simp): P_g(0)=1−g.
- `tricanonicalHilbertPolynomial.eval_one` (compatibility): P_g(1)=5(g−1), the rank of the tricanonical pushforward.
- `tricanonicalHilbertPolynomial.eval_two_mul` (compatibility): P_g(2a)=(g−1)(12a−1), the polynomial for an isomorphism graph with product polarization.

**Uses.** StableReductionPartII:MC.1/tricanonical-hilbert: Fixes the Hilbert scheme and its ambient projective dimension. StableReductionPartII:MC.1/refinement-bounded-graphs: Bounds the entire stable-curve Isom functor in one graph-polynomial component.

**Unit tests.**

- `tricanonicalHilbertPolynomial.genus_two`: P_2=6T−1 and P_2(1)=5.
- `tricanonicalHilbertPolynomial.genus_three`: P_3=12T−2 and P_3(1)=10.
- `tricanonicalHilbertPolynomial.genus_one`: P_1=0; this numerical extension is not a genus-one stable-curve atlas.
- `tricanonicalHilbertPolynomial.genus_zero`: P_0=1−6T, detecting subtraction in Z rather than truncated natural subtraction.

**Acceptance.** For g≥2, P_g(1)>0 and the ambient projective dimension is P_g(1)−1, not P_g(1).

**Direct dependencies.** `mathlib:Polynomial.C`; `mathlib:Polynomial.X`; `mathlib:Polynomial.eval`; `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

**Sources.** [DM] §1, pp. 77–78, tricanonical Hilbert construction preceding Theorem 1.6: The tricanonical dimension and degree give this linear polynomial.

### 2. Arbitrary-base tricanonical comparison

ID: `refinement-arbitrary-base`. Kind: theorem.

Let f:C→S be a proper flat finitely presented family of geometrically connected nodal curves, of constant arithmetic genus g≥2, with relatively ample dualizing line bundle ω. Then ω is invertible and compatible with arbitrary base change; Rf_*ω³ is the finite locally free sheaf E=f_*ω³ in degree zero, of rank r=5g−5, and formation of E commutes with every base change. The evaluation f*E→ω³ gives a closed immersion C→P_S(E). The polynomial with respect to ω³ is P_g and deg(ω³)=6g−6.

**Hypotheses and conventions.** No Noetherian hypothesis on S. Projective bundles use invertible quotients; g is constant on S.

**Construction or proof.** Import the geometric very-ampleness and H¹(ω³)=0 computations from StableReduction Layers 2–3; do not plan their proofs again. Use the requested arbitrary-base Gorenstein dualizing comparison, proper perfect pushforward and the single-degree free-locus criterion. Fibre vanishing makes the degree-zero locus all of S. Apply the relative very-ampleness criterion to evaluation. On affine qcqs bases, descend the finitely presented family, nodality, stability and the polarization to a Noetherian model; glue the base-change-compatible comparison. The precise dualizing and very-ampleness extension is request Q1.

**Acceptance.** For g=2, E has rank 5 and evaluation embeds in P⁴ with degree 6. The result applies to nonreduced and non-Noetherian bases, without silently restricting the moduli functor.

**Direct dependencies.** `StableReductionPartII:MC.1/refinement-polynomial`; `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`; `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`; `AlgebraicModuliForArithmeticGeometry:A0-extension/perfect-proper-pushforward`; `AlgebraicModuliForArithmeticGeometry:A0-extension/single-degree-free-locus`; `SchemeAndStackFoundations:SF.0/noetherian-approximation`; `SchemeAndStackFoundations:SF.5/projective-bundle`; `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Sources.** [DM] §1, pp. 76–78, duality and tricanonical embedding: Provides the stable-fibre calculation, with relative conclusions whose arbitrary-base extension is made explicit here. [MC] Lemmas 109.19.1 and 109.19.3 (0E6R), pp. 19–21: Gorenstein curve families have an invertible relative dualizing sheaf compatible with unrestricted base change. [PERF] Lemma 75.25.1(1) (0A1P), pp. 60–61; Lemma 75.26.4, pp. 64–65: Perfect pushforward and its degree-concentration locus give the required bundle universally.

### 3. The universal relative polarization locus

ID: `refinement-polarization-locus`. Kind: construction.

Put r=5g−5 and let V be the open locus of stable genus-g curves in Hilb^{P_g}(P^{r−1}_Z). On its universal family f:C_V→V put H=O_C(1) and F=H⊗ω^−3. Form the locally closed universal lowest-cohomology rank-one stratum Z⊂V for Rf_*F. On Z let L=f_*F, with universal base change. Define W⊂Z by requiring the evaluation f*L→F to be an isomorphism. Then W→V is locally closed of finite presentation and, for every T→V, factorization through W is equivalent to existence of a base line bundle L_T with F_T≅f_T*L_T. No such isomorphism or trivialization is retained as extra data.

**Hypotheses and conventions.** g≥2; all Hilbert objects have polynomial P_g. V is Noetherian and of finite type over Z; testing schemes T are arbitrary. The rank stratum represents the universal base-change condition, not the pointwise equation h⁰=1.

**Construction or proof.** Stability is open in the universal proper flat Hilbert family; use the existing stable-family definition and the openness part of Q1. Rf_*F is perfect of Tor amplitude [0,1]. Apply the existing lowest-degree rank-stratum node with a=0, r=1. Locally a two-term free complex represents it and the rank of its differential is rk(K⁰)−1. This is a scheme-theoretic condition. On Z, remove the proper image of the non-isomorphism support of f*L→F; this produces the open W in Z. Universal base change makes this construction stable under every pullback. If F_T=f_T*B for a line B, universal f_*O=O identifies f_*F_T with B, so T factors through Z and the counit is invertible. Conversely the counit on W supplies the required pullback line. The groupoid of such (B,isomorphism) is contractible, rather than providing a chosen trivialization.

**API.**

- `RelativeTricanonicalLocus.toHilbert` (projection): W→V→Hilb is a locally closed immersion of finite presentation.
- `RelativeTricanonicalLocus.baseLine` (data): L=f_*F is invertible on W with evaluation f*L≅F.
- `RelativeTricanonicalLocus.factors_iff` (universal-property): A morphism T→V factors uniquely through W iff F_T is pulled back from a line on T.
- `RelativeTricanonicalLocus.baseChange` (functoriality): W, L and evaluation pull back to the corresponding construction for every T; the comparison satisfies identity and composition laws.
- `RelativeTricanonicalLocus.line_unique` (extensionality): For a specified presentation F_T≅f_T*B the identification B≅(f_T)_*F_T is the one induced by adjunction; any two presentations have a unique compatible isomorphism.

**Uses.** StableReductionPartII:MC.1/refinement-complete-series: Separates the relative polarization condition from completeness of the ambient linear series. StableReductionPartII:MC.1/tricanonical-hilbert: Constructs the scheme structure missing from the parent target.

**Unit tests.**

- `RelativeTricanonicalLocus.constant`: A tricanonically embedded constant stable curve has F=O and factors through W.
- `RelativeTricanonicalLocus.noncanonical_twist`: Over an algebraically closed field take a smooth genus-g curve and a nontrivial degree-zero line A. The very ample H=ω³⊗A has polynomial P_g, but F=A is not pulled back from the field and the point is excluded.
- `RelativeTricanonicalLocus.infinitesimal`: For a smooth curve C/k and a nonzero class in H¹(C,O), the associated deformation F of O on C×Spec(k[ε]/ε²) is trivial on the geometric fibre but is not pulled back from the base. Whenever H=ω³⊗F is embedded by a lifted complete frame, the resulting Hilbert map does not factor through W.
- `RelativeTricanonicalLocus.base_line`: If F=f*B for a nontrivial base line B, then the family factors through W and f_*F≅B.

**Acceptance.** The universal property quantifies over arbitrary, including infinitesimal, T→V. The base line is allowed to be nontrivial.

**Direct dependencies.** `StableReductionPartII:MC.1/refinement-arbitrary-base`; `AlgebraicModuliForArithmeticGeometry:R09.2/hilbert-scheme`; `AlgebraicModuliForArithmeticGeometry:A0-extension/perfect-proper-pushforward`; `AlgebraicModuliForArithmeticGeometry:A0-extension/lowest-degree-rank-stratum`; `AlgebraicModuliForArithmeticGeometry:A0-extension/universal-functions`; `SchemeAndStackFoundations:SF.0/coherent-scheme-support`; `AlgebraicModuliForArithmeticGeometry:R09.1/rank-locus`; `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Sources.** [DM] §1, pp. 77–78, locally closed tricanonical Hilbert locus: The claimed locus is refined into universal rank and evaluation conditions. [PERF] Lemma 75.26.6 (0D21), p. 65; Lemma 75.26.7, pp. 65–66: Supplies the universal lowest-cohomology stratum and connected reduced-fibre pushforward of functions. [MC] Lemmas 109.22.1, 109.22.3 and 109.22.5, pp. 25–27: Stability and genus cut out the initial Hilbert open.

### 4. The complete tricanonical Hilbert locus

ID: `refinement-complete-series`. Kind: construction.

Over W the bundle f_*H≅E⊗L has rank r. Let a:O_W^r→f_*H be induced by the ambient homogeneous coordinates. Define U_g⊂W as the open where a is an isomorphism, cut out by invertibility of its determinant. Thus U_g is locally closed and of finite type over Z. A T-point is precisely an embedded stable family satisfying H≅ω³⊗f*L and the completeness condition a_T an isomorphism.

**Hypotheses and conventions.** Use W and its base line from refinement-polarization-locus. The map a is the actual coordinate restriction, not a freely chosen trivialization.

**Construction or proof.** Use projection formula and refinement-arbitrary-base to identify f_*H with E⊗L and its arbitrary-base comparison. Use the existing scheme-theoretic rank locus for a morphism between rank-r bundles. Intersect this open with W; the two universal properties give exactly the parent tricanonical-hilbert target.

**API.**

- `CompleteTricanonicalLocus.toPolarizationLocus` (projection): U_g→W is the determinant-open immersion.
- `CompleteTricanonicalLocus.coordinates` (data): The coordinate restriction O^r≅f_*H is canonical on U_g.
- `CompleteTricanonicalLocus.factors_iff` (characterisation): A W-valued family factors through U_g exactly when coordinate restriction is an isomorphism.
- `CompleteTricanonicalLocus.baseChange` (functoriality): The determinant open, universal curve and coordinate restriction commute with arbitrary base change.

**Uses.** StableReductionPartII:MC.1/refinement-frame-comparison: Turns an embedded polarization into a projective frame. StableReductionPartII:MC.1/hilbert-quotient: Supplies the actual finite-type scheme used as a smooth atlas.

**Unit tests.**

- `CompleteTricanonicalLocus.genus_two`: The complete genus-two tricanonical embedding belongs to U_2⊂Hilb^{6T−1}(P⁴).
- `CompleteTricanonicalLocus.incomplete`: On a smooth genus-two curve, project a tricanonical embedding in P⁴ from a point outside its secant variety to P³ and include P³ as a hyperplane in P⁴. The resulting embedding has H=ω³ and the same polynomial, but a has rank at most 4, so it is excluded.
- `CompleteTricanonicalLocus.scalar`: Multiplying every homogeneous coordinate by the same unit leaves the embedded point and its projective frame unchanged.
- `CompleteTricanonicalLocus.pullback`: For every T→W the complete-series locus is U_g×_W T, including when T is nonreduced.

**Acceptance.** The map U_g→Hilb is locally closed; its points retain an embedded subscheme, not an extra basis of a line.

**Direct dependencies.** `StableReductionPartII:MC.1/refinement-polarization-locus`; `StableReductionPartII:MC.1/refinement-arbitrary-base`; `AlgebraicModuliForArithmeticGeometry:R09.1/rank-locus`.

**Sources.** [DM] §1, pp. 77–78, tricanonical Hilbert scheme: A tricanonical embedding uses all r sections; the determinant condition enforces this over every base.

### 5. Projective frames and the base-line twist

ID: `refinement-frame-comparison`. Kind: comparison.

For every scheme T, U_g(T) is naturally equivalent to the groupoid of stable genus-g C/T with an isomorphism α:P_T(f_*ω³)≅P_T(O_T^r), where an isomorphism of curves must carry α to α. This groupoid is discrete up to unique isomorphism. The induced embedding satisfies H≅ω³⊗f*L for a base line L; L and its trivialization are not extra moduli. For fixed C/T the sheaf of such frames is represented by Isom_T(P(E),P(O^r)), a smooth surjective PGL_r-torsor of relative dimension r²−1.

**Hypotheses and conventions.** Projective-bundle convention is invertible quotients. PGL_r denotes the group scheme, equivalently the fppf quotient GL_r/G_m, rather than the quotient of matrices on every ring of points.

**Construction or proof.** On U_g the identity f_*H≅E⊗L and the coordinate isomorphism give P(E)≅P(E⊗L)≅P(O^r). Conversely, apply the requested projective-bundle line-twist comparison Q2 to α and the tricanonical immersion. The coordinate restriction is complete by construction, so the resulting embedded curve factors through U_g. Use functoriality of ω and its pushforward to identify the two constructions and all isomorphisms. Faithfulness of the closed immersion makes an automorphism preserving the frame the identity. Apply the smooth group-scheme and projective-frame torsor statement in Q2. For torsor representability use only part (a) of SF.1/torsor-representability: PGL_r is affine, so affine fpqc descent represents its torsors by affine schemes. The general non-affine-group algebraic-space bootstrap is not used.

**Acceptance.** Projective frames exist fppf locally even when E has no global linear frame. A simultaneous scalar change is invisible; an independent automorphism of C need not be invisible. Over a base with a nontrivial line L and E⊗L≅O^r, the frame is admitted without imposing L≅O.

**Direct dependencies.** `StableReductionPartII:MC.1/refinement-complete-series`; `StableReductionPartII:MC.1/refinement-arbitrary-base`; `SchemeAndStackFoundations:SF.5/projective-bundle`; `SchemeAndStackFoundations:SF.1/torsor`; `SchemeAndStackFoundations:SF.1/torsor-representability`; `SchemeAndStackFoundations:SF.1/affine-fpqc-descent`; `SchemeAndStackFoundations:SF.2/quasi-coherent-algebra-descent`; `SchemeAndStackFoundations:SF.2/azumaya-trivialization-gerbe`; `AlgebraicModuliForArithmeticGeometry:R09.1`.

**Sources.** [DM] §1, pp. 78 and 82–83, projective action; §5, Proposition 5.1, p. 104: Connects tricanonical coordinates, the projective linear action and the atlas; the generic relative line-twist proof is an explicit supplier request.

### 6. A single graph polynomial for stable-curve isomorphisms

ID: `refinement-bounded-graphs`. Kind: theorem.

For two stable genus-g curves C,D over S, the full unpolarized Isom_S(C,D) lies in the graph-Hilbert component of C×_S D with polynomial Q_g(n)=P_g(2n)=(g−1)(12n−1), computed using pr_C*ω_C³⊗pr_D*ω_D³. Consequently it is represented, locally on S and compatibly with descent, by a quasi-projective scheme of finite presentation. No isomorphism between chosen polarization lines is included as extra data.

**Hypotheses and conventions.** g≥2; the relative ω³ lines are canonical and ample. Use the Noetherian projective graph construction first, followed by finite-presentation approximation and gluing; arbitrary S is allowed.

**Construction or proof.** Functoriality of the relative dualizing line gives φ*ω_D≅ω_C for every curve isomorphism φ. The product polarization on its graph is therefore ω_C^6, so its Hilbert polynomial is Q_g. Choose local tricanonical embeddings after trivializing the relevant vector bundles. Apply the fixed-graph-polynomial Isom-representability node of R09.2; this is finite presentation, whereas the unbounded Isom theorem is only locally of finite presentation. The representing schemes and their canonical functors descend on overlaps. Use Q1 to descend the curve and dualizing data to Noetherian affine models and recover arbitrary-base finite presentation. Do not invoke polarized-isom-representability for pairs (φ,line-isomorphism): that adds a G_m worth of data.

**Acceptance.** For genus two the graph polynomial is 12n−1. An automorphism contributes one Isom point; choosing a scalar identification of polarization lines must not multiply it by G_m. The finite-presentation conclusion does not come from treating an arbitrary unbounded Hilbert union as finite type.

**Direct dependencies.** `StableReductionPartII:MC.1/refinement-polynomial`; `StableReductionPartII:MC.1/refinement-arbitrary-base`; `AlgebraicModuliForArithmeticGeometry:R09.2/isom-representability`; `AlgebraicModuliForArithmeticGeometry:R09.2/graph-isomorphism-open`; `SchemeAndStackFoundations:SF.0/noetherian-approximation`; `SchemeAndStackFoundations:SF.1/torsor-representability`.

**Sources.** [DM] §1, Theorem 1.11 and its proof, pp. 84–85: Represents stable Isom and uses preservation of the canonical polarization to control the graph. [DM] §1, pp. 77–78: Riemann–Roch determines Q_g by doubling the twist exponent.

### 7. The universal Isom scheme as an action groupoid

ID: `refinement-action-groupoid`. Kind: construction.

Let C_U→U=U_g be the universal curve and R=Isom_{U×U}(pr_1*C_U,pr_2*C_U). There is a canonical isomorphism U×PGL_r≅R sending (u,h) to (u,h·u,h restricted to C_u). Its source is u, its target is h·u, its unit is (u,1), its inverse is (h·u,h^−1), and composition of h_1 followed by h_2 is h_2h_1. These formulas identify the scheme groupoid with the projective-coordinate action, functorially on all schemes.

**Hypotheses and conventions.** Use complete projective frames, not bases of E. R is the bounded bare Isom scheme of refinement-bounded-graphs.

**Construction or proof.** Every isomorphism of universal curves induces an isomorphism of their tricanonical bundles; frame comparison extends it uniquely to an ambient projective transformation. Conversely restrict an ambient transformation carrying one embedded curve to the other. The two maps are inverse on every test scheme, so Yoneda identifies the schemes. Transport identities, inverses and composition through this bijection. The fppf frame-torsor description then identifies [U/PGL_r] with the already defined stable-curve stack; generic quotient-stack theory is imported from SF.1, not redeveloped.

**API.**

- `TricanonicalActionGroupoid.relationIso` (equivalence): U×PGL_r≅R over U×U with (s,t)(u,h)=(u,h·u).
- `TricanonicalActionGroupoid.identity` (simp): The identity arrow at u is (u,1).
- `TricanonicalActionGroupoid.comp` (simp): The composite (u,h_1) then (h_1·u,h_2) is (u,h_2h_1).
- `TricanonicalActionGroupoid.inverse` (structure): The inverse of (u,h) is (h·u,h^−1).
- `TricanonicalActionGroupoid.baseChange` (functoriality): The comparison commutes with pullback of schemes and with both groupoid projections.

**Uses.** StableReductionPartII:MC.1/refinement-source-valuative: Identifies the dense smooth-curve open in the SOURCE of the universal Isom morphism. StableReductionPartII:MC.1/hilbert-quotient: Verifies the quotient is the moduli stack including descent and stabilizers.

**Unit tests.**

- `TricanonicalActionGroupoid.identity`: Restricting the identity projective transformation gives the identity curve isomorphism.
- `TricanonicalActionGroupoid.stabilizer`: For a curve with a nontrivial automorphism, the stabilizer of its Hilbert point has the corresponding distinct element; the quotient is not an orbit set.
- `TricanonicalActionGroupoid.scalar`: A scalar matrix represents the identity element of PGL_r and produces the identity relation arrow.
- `TricanonicalActionGroupoid.composition`: For two successive coordinate changes the order is h_2h_1, as verified by restriction to the embedded curve.

**Acceptance.** The relation has dimension dim(U)+r²−1 when U is smooth, even though R→U×U has zero-dimensional geometric fibres.

**Direct dependencies.** `StableReductionPartII:MC.1/refinement-frame-comparison`; `StableReductionPartII:MC.1/refinement-bounded-graphs`; `SchemeAndStackFoundations:SF.1/quotient-stack`; `SchemeAndStackFoundations:SF.1/stack-presentation`; `SchemeAndStackFoundations:SF.4/stable-curve-stack`; `StableReductionPartII:MC.0/effective-descent`.

**Sources.** [DM] §1, pp. 82–83, projective action; §5, Proposition 5.1, p. 104: The projective action gives the moduli presentation; this target supplies the all-test-scheme relation identification.

### 8. The normalization sequence and the deformation dimension

ID: `refinement-deformation-sequence`. Kind: theorem.

Let C/k be a stable connected nodal genus-g curve over an algebraically closed field, and ν:⊔C_v→C its normalization. Let D_v be the reduced divisor of branches above nodes and N_q=T_{q+}C_v⊗_k T_{q−}C_w (also when both branches lie on one component). Then T_C≅ν_*(⊔T_{C_v}(−D_v)), Ext⁰_C(Ω_C,O_C)=0, Ext²_C(Ω_C,O_C)=0, and there is a natural exact sequence 0→⊕_v H¹(C_v,T_{C_v}(−D_v))→Ext¹_C(Ω_C,O_C)→⊕_q N_q→0. Its middle dimension is 3g−3. The sequence has no asserted canonical splitting.

**Hypotheses and conventions.** All characteristics are allowed. Ext is coherent sheaf Ext over O_C followed by global derived Hom; Ω_C is algebraic Kähler differentials on the finite-type curve. N_q is a tensor product of tangent lines, not a chosen copy of k until branch parameters are fixed.

**Construction or proof.** Use normalization at nodes from StableReduction Layer 1: a derivation on the node lifts to derivations vanishing on both branches. The local hypersurface resolution gives sheaf Ext¹ supported at nodes with fibres N_q and sheaf Ext^i=0 for i≥2. On the reduced nodal curve the conormal map in the hypersurface presentation is injective, so the cotangent complex is quasi-isomorphic to Ω_C for this computation. Use the local-to-global coherent Ext spectral sequence requested in Q3, together with cohomological dimension one from StableReduction Layer 2. This gives the exact sequence and vanishing; the zero-dimensional support kills H¹ of sheaf Ext¹. Stability implies H⁰(T_{C_v}(−D_v))=0. Riemann–Roch gives h¹=3g_v−3+deg D_v. Use Σdeg D_v=2δ and g=Σg_v+δ−|vertices|+1 to obtain Σh¹+δ=3g−3. The resulting global-to-local tangent map is surjective, which makes the δ local smoothing parameters independent. No averaging over automorphism groups is used.

**Acceptance.** For smooth genus two, the local-node sum is zero and h¹(T_C)=3. For an irreducible one-nodal genus-two curve, the normalization has genus one: h¹(T_E(−p−q))=2 and the local contribution is 1. For the genus-two theta curve consisting of two P¹s meeting at three nodes, both H¹(T_{P¹}(−3 points)) vanish, and the three local directions give dimension 3. Ordinary algebraic differentials of k[[u,v]] must not replace continuous deformation theory of a complete local algebra.

**Direct dependencies.** `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`; `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`; `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`; `SchemeAndStackFoundations:SF.4/algebra-deformation-classes`; `SchemeAndStackFoundations:SF.4/node-versal-deformation`; `SchemeAndStackFoundations:SF.2`.

**Sources.** [DM] §1, Lemmas 1.3–1.4 and Proposition 1.5, pp. 79–82; Theorem 1.6, p. 83: The obstruction calculation and independent node parameters are expanded into the normalization and local-to-global sequence. [DEF] Lemmas 93.16.2–93.16.4 (0DZP, 0DZQ), pp. 28–29: Relates isolated algebraic singularities to their completed local deformation hulls and supplies unobstructedness in dimension one.

### 9. Completed framed Hilbert charts

ID: `refinement-completed-atlas`. Kind: comparison.

Let C/k and δ nodes be as above. Choose Λ=k in characteristic zero and Λ=W(k) in characteristic p. The deformation groupoid over Artinian local Λ-algebras with residue k and a fixed special-fibre identification has no infinitesimal automorphisms; its isomorphism-class functor is prorepresented by R_C≅Λ[[t_1,…,t_{3g−3}]], noncanonically, with the node equations uv=t_i for 1≤i≤δ. At a chosen framed point u of (U_g)_Λ(k), the completed local ring is noncanonically R_C[[z_1,…,z_{r²−1}]]. Hence U_g→Spec Z is smooth of relative dimension (3g−3)+(r²−1), and its smooth-curve open U_g^sm is dense in every irreducible component.

**Hypotheses and conventions.** The chosen special-fibre identification is part of a deformation object; automorphisms of C are not discarded from the moduli stack. The displayed completed ring is that of the Λ-base-changed Hilbert scheme at its k-rational point. It is not claimed to be the completion of a finite-type Z-point with residue field an arbitrary algebraically closed k. The identifications of power-series rings and node parameters involve choices.

**Construction or proof.** Import the existing node-versal-deformation theorem from SF.4 and the exact sequence above, using the continuous-versus-algebraic comparison of Lemma 93.16.2 for the completed node. Schlessinger prorepresentability uses H⁰(T_C)=0, not absence of finite automorphisms of C. Compare the deformation functor of the existing Hilbert scheme with deformations of C and a lift of its projective frame. The frame torsor is smooth of dimension r²−1, so frame liftings contribute exactly that many formal variables. Use the scheme-formal comparison of R09.6 after base change to Λ; u is a finite-type point over Λ. The ample compatible ω³ and SF.4 Grothendieck algebraization give effectivity and full faithfulness of the formal family, without invoking a generic algebraization theorem whose finite-type-residue hypothesis over Z fails for k=F_p-bar. Apply the infinitesimal lifting criterion for the finitely presented atlas, coefficient-ring descent, and the dimension comparison in Q4. This supplies native scheme smoothness rather than equating formal smoothness with smoothness without finite presentation. In each such completion the nonsmooth-curve locus is the union t_1…t_δ=0; the complement is dense. Faithful-flat local comparison gives density in each irreducible component of U. This conclusion uses no properness of Isom or of the moduli stack.

**Acceptance.** For genus two the miniversal curve deformation has 3 variables; the P⁴ Hilbert atlas has 3+24=27 relative variables. The Hilbert atlas is smooth of positive relative dimension over the moduli stack; it is not declared étale. The construction remains valid at a stable curve whose automorphism group has order divisible by the residue characteristic.

**Direct dependencies.** `StableReductionPartII:MC.1/refinement-deformation-sequence`; `StableReductionPartII:MC.1/refinement-frame-comparison`; `SchemeAndStackFoundations:SF.4/node-versal-deformation`; `SchemeAndStackFoundations:SF.4/schlessinger-theorem`; `SchemeAndStackFoundations:SF.4/grothendieck-algebraization`; `SchemeAndStackFoundations:SF.4/infinitesimal-lifting-criterion`; `AlgebraicModuliForArithmeticGeometry:R09.6/scheme-formal-comparison`; `AlgebraicModuliForArithmeticGeometry:R09.6/atlas-versality`; `AlgebraicModuliForArithmeticGeometry:R09.6`.

**Sources.** [DM] Deformation argument, pp. 78–83; Theorem 1.6 and Corollary 1.7, p. 83: Supplies the smooth deformation picture, embedding directions and local node equations. [DEF] Lemmas 93.16.2–93.16.4, pp. 28–29: The completed node hull computes the local deformation tangent and obstruction problem. [MC] §109.15, Lemma 109.15.1, pp. 15–16; Lemmas 109.22.6 and 109.22.8, pp. 26–27: Explains the Cohen-coefficient lifting argument for smoothness over Z and density of smooth curves.

### 10. Algebraic labelled boundary branches

ID: `refinement-labelled-branches`. Kind: construction.

Let u be a geometric point of U_g whose curve has δ nodes. Pull back the finite unramified singular scheme Σ=Sing(C_U/U), already defined by Fitt_1(Ω), to an étale neighbourhood T→U of u. After shrinking T, it splits as a disjoint union of δ closed immersions Z_i→T. The labels are auxiliary; the ideals I_i defining Z_i are actual algebraic ideals. After the completed framed comparison each I_i becomes the ideal (t_i). The nonsmooth-curve locus on T has underlying set ⋃|Z_i|, and its reduced effective Cartier divisor structure will be identified by refinement-relative-boundary.

**Hypotheses and conventions.** T contains the chosen geometric lift of u and no additional singular branches meeting that lift. Σ is finite unramified, not necessarily flat or étale over U.

**Construction or proof.** Import the finite unramified singular scheme from SF.4/split-prestable-curve. In a node chart xy=a its ideal is (x,y), and its map to the base is the closed immersion a=0. Apply the finite-unramified splitting theorem 41.17.3 requested in Q5; shrink to remove pieces with no point over u. Identify each branch ideal after the Λ-completed local comparison by the node equation xy=t_i. Keep these algebraic ideals for the boundary argument, rather than postulating descent of arbitrary factors of a formal equation.

**API.**

- `StableBoundaryBranches.singularDecomposition` (equivalence): Σ_T≅⊔_{i=1}^δ Z_i over T, with each Z_i→T a closed immersion.
- `StableBoundaryBranches.ideal` (data): I_i is the finite-presentation ideal of Z_i; after completed framed comparison it generates (t_i).
- `StableBoundaryBranches.support` (characterisation): A point of T represents a smooth curve iff it lies in no Z_i.
- `StableBoundaryBranches.relabel` (functoriality): Refining T or permuting node labels pulls back or permutes the ideals; their union and eventual product divisor are label-independent.

**Uses.** StableReductionPartII:MC.1/refinement-relative-boundary: Supplies algebraic branch equations whose Cartier and transversality properties can be checked faithfully flat locally. StableReductionPartII:MC.1/normal-crossing-boundary: Closes the gap between completed node equations and étale boundary charts.

**Unit tests.**

- `StableBoundaryBranches.smooth`: For a smooth curve δ=0, Σ_T is empty and the branch family is empty.
- `StableBoundaryBranches.one_node`: For a one-node versal chart xy=t, Σ is Spec(A/(t)) and its base ideal is (t). It is not an étale cover of Spec A.
- `StableBoundaryBranches.two_nodes`: For two independent nodes, Σ_T=V(t_1)⊔V(t_2). The divisors intersect in T, but the two components of Σ_T are disjoint.
- `StableBoundaryBranches.monodromy`: A permutation of two nodes interchanges I_1,I_2 and preserves I_1I_2 and the smooth-curve open.

**Acceptance.** Every geometric node yields one branch at the chosen lift, while monodromy may permute labels on overlaps.

**Direct dependencies.** `StableReductionPartII:MC.1/refinement-completed-atlas`; `SchemeAndStackFoundations:SF.4/split-prestable-curve`; `SchemeAndStackFoundations:SF.0`.

**Sources.** [ETALE] Lemma 41.17.3 (04HJ), pp. 19–20: Finite unramified maps split into closed immersions after étale target localization. [DM] Theorem 1.6 and Corollary 1.9, pp. 78–83: Independent node equations identify the completed ideals of the labelled branches.

### 11. Transverse relative boundary charts

ID: `refinement-relative-boundary`. Kind: theorem.

At the geometric point u above, choose T and I_1,…,I_δ as in refinement-labelled-branches. After shrinking, each I_i is generated by a nonzerodivisor a_i, every intersection V(a_i:i∈J) is smooth over Z of relative codimension |J| in T, and (a_1,…,a_δ):T→A^δ_Z is smooth near u. Étale locally this extends to relative étale coordinates on T. Thus the effective Cartier divisor with ideal ∏I_i is reduced, has support equal to the complement of U^sm in T, and has equation a_1…a_δ=0 in these coordinates. These divisors descend to the relative normal-crossing boundary of the stable-curve stack. Global strict normal crossings and globally labelled branches are not asserted.

**Hypotheses and conventions.** g≥2; U is smooth of relative dimension N=3g−3+r²−1 by refinement-completed-atlas. Relative normal crossings over Z means étale locally the union of coordinate hyperplanes in a scheme étale over A^N_Z; it is stronger than absolute regularity of intersections.

**Construction or proof.** Use actual algebraic ideals I_i, and the faithful-flat coefficient-completion comparison in Q4 to detect invertibility and injectivity of I_i→O_T from their completed ideals (t_i). Apply the same comparison to all finite intersections: their completed rings are Λ[[remaining t,z]], so the intersections are smooth over Z of the stated codimensions. Q4 explicitly includes descent of these native scheme properties. Relative conormal independence makes the differential of (a_1,…,a_δ) surjective. The smooth coordinate criterion in Q6 gives a smooth map to A^δ_Z and then étale coordinates after adjoining N−δ functions. The product ideal defines a reduced effective Cartier divisor and is independent of choices of generators and labels. The intrinsic singular scheme makes its ideals agree on refinements of the relation groupoid. Use the relative-normal-crossing descent contract in Q6 to descend the divisor along the smooth atlas and obtain the parent boundary target. The generic absolute-normal-crossings node alone is insufficient.

**Acceptance.** For δ=0 the product ideal is O_T and the divisor is empty. For two nodes the boundary equation is a_1a_2, each component has relative codimension 1 and their intersection has relative codimension 2. Over Z_p, the vertical divisor p=0 in a smooth chart is not a relative boundary branch: it fails relative smoothness and cannot serve as a_i. Automorphisms may exchange the branches, so the descended boundary need not be globally strict normal crossing.

**Direct dependencies.** `StableReductionPartII:MC.1/refinement-labelled-branches`; `StableReductionPartII:MC.1/refinement-completed-atlas`; `SchemeAndStackFoundations:SF.4`; `SchemeAndStackFoundations:SF.1`.

**Sources.** [DM] Definition 1.8 and Corollary 1.9, p. 83; §5, Proposition 5.1, p. 104: The boundary is described by independent node parameters and transported to moduli. [ETALE] §41.21, Lemmas 41.21.2–41.21.7 (0CBN, 0CBR, 0CBS), pp. 26–29: Gives the algebraic branch/intersection approach to normal crossings; the relative smooth-intersection enhancement is kept as an explicit request.

### 12. The universal source-density valuative test

ID: `refinement-source-valuative`. Kind: application.

For the universal Isom morphism R=U_g×PGL_r→U_g×U_g, the open R^sm=U_g^sm×PGL_r is dense in every irreducible component of its SOURCE. The refined source-generic DVR properness test therefore involves two stable families whose common generic curve is smooth. Smooth-generic stable uniqueness over the same DVR supplies the unique lift, so R→U_g×U_g is proper. Fppf local projective frames and base change then imply properness of Isom_S(C,D) for every pair of stable curves over arbitrary S, including those with nodal generic fibre.

**Hypotheses and conventions.** U_g is of finite type over Z; its universal relation is finite type by the bounded graph theorem. The refined test fixes A⊂κ(η), Frac(A)=κ(η), for a generic point η of an irreducible component of R. Use the same-DVR uniqueness theorem for two existing stable models; no extension of the fraction field is allowed in this Isom test.

**Construction or proof.** Smoothness of PGL_r makes its projection from R open and surjective. Density of U^sm in U therefore pulls back to density in every component of R. A generic point of R lies in R^sm, independently of whether its image is generic in U×U. Apply SF.0/refined-valuative-criterion, whose proof is supplied in Stacks 32.15.3, not by the source paper’s unproved generic assertion. For its canonical generic-point top arrow, both universal curves have a smooth generic fibre. The upstream StableReduction Layer 8 uniqueness theorem extends this isomorphism uniquely across A. The extension is a point of the full bare Isom scheme, with its original two frames. Conclude properness over U×U and descend on an fppf cover of S on which C and D acquire projective frames. Properness is stable under base change and local on the target in this topology. This covers nodal generic fibres without incorrectly applying smooth-generic uniqueness directly to them.

**Acceptance.** Density in the target U×U alone does not supply the hypothesis. A test pair with nodal generic fibre is covered by descent of universal properness, not by a false smooth-generic reduction on that pair. After the unramified criterion, proper plus locally quasi-finite gives finite by the existing native Mathlib declaration.

**Direct dependencies.** `StableReductionPartII:MC.1/refinement-action-groupoid`; `StableReductionPartII:MC.1/refinement-completed-atlas`; `StableReductionPartII:MC.1/refinement-bounded-graphs`; `SchemeAndStackFoundations:SF.0/refined-valuative-criterion`; `tauceti:TauCetiRoadmap/StableReduction#layer-8-canonical-contraction-and-unpointed-stable-reduction`; `SchemeAndStackFoundations:SF.1/stack-morphism-properties`.

**Sources.** [DM] Theorem 1.11, pp. 84–85; Theorem 4.19, p. 103; §5, proof of Theorem 5.2, pp. 104–105: Uses smooth generic curves to prove universal separatedness; the source-density quantifiers are made explicit. [LIMITS] Lemmas 32.15.2–32.15.3 (0207, 0208), pp. 39–42: Proves that actual generic points of irreducible components of the source suffice for the DVR criterion.

## Resolution of the thirteen inherited targets

The following is a proof-contract map, not a set of duplicate theorem declarations. The original statements keep their parent IDs. Bare names in the first column have prefix `StableReductionPartII:MC.1/`.

| Parent target | Inputs and resulting proof contract |
| --- | --- |

| `tricanonical-cohomology` | The arbitrary-base extension supplies exactly the rank, evaluation and base-change comparison missing from the old locally Noetherian curve cohomology scope. Inputs: `StableReductionPartII:MC.1/refinement-arbitrary-base`. |

| `tricanonical-hilbert` | The locally closed rank/evaluation locus followed by the determinant open represents complete projective tricanonical frames, allowing base-line twists. Inputs: `StableReductionPartII:MC.1/refinement-polarization-locus`, `StableReductionPartII:MC.1/refinement-complete-series`, `StableReductionPartII:MC.1/refinement-frame-comparison`. |

| `frame-torsor` | The fibre over C is the smooth PGL_r projective-frame torsor, not a GL_r basis torsor. Inputs: `StableReductionPartII:MC.1/refinement-frame-comparison`, `SchemeAndStackFoundations:SF.1/torsor-representability`. |

| `hilbert-quotient` | Effective fppf descent is the existing MC.0 input; the smooth action-groupoid presentation identifies the quotient with the already defined stack. Only the smooth-groupoid case of stack-presentation is used. Inputs: `StableReductionPartII:MC.1/refinement-action-groupoid`, `SchemeAndStackFoundations:SF.1/quotient-stack`, `SchemeAndStackFoundations:SF.1/stack-presentation`, `SchemeAndStackFoundations:SF.4/stable-curve-stack`. |

| `isom-representable` | Preservation of ω bounds the entire bare Isom in one fixed graph-polynomial component, not an unbounded locally-finite-presentation union. Inputs: `StableReductionPartII:MC.1/refinement-bounded-graphs`. |

| `isom-unramified` | For each geometric Isom point, transport its tangent space to H⁰(C,T_C)=0. The imported locally-finite-type geometric criterion then gives unramifiedness and locally quasi-finiteness. The native all-square-zero hom-ext theorem alone would not prove this step. Inputs: `StableReductionPartII:MC.1/refinement-bounded-graphs`, `SchemeAndStackFoundations:SF.0/unramified-criteria`, `tauceti:TauCetiRoadmap/StableReduction#layer-3-prestable-semistable-stable-and-pointed-curves`. |

| `isom-proper` | Apply the source-generic trait criterion to the universal relation before descending to every pair of curves. Inputs: `StableReductionPartII:MC.1/refinement-source-valuative`. |

| `finite-unramified-diagonal` | Proper plus locally quasi-finite gives a finite diagonal; the existing smooth quotient atlas and the unramified-diagonal criterion give an étale atlas. The Hilbert atlas itself is not étale. Inputs: `StableReductionPartII:MC.1/refinement-source-valuative`, `SchemeAndStackFoundations:SF.0/unramified-criteria`, `mathlib:AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`, `SchemeAndStackFoundations:SF.1/deligne-mumford-stack`. |

| `obstruction-vanishing` | The local-to-global sequence and one-dimensional coherent cohomology give Ext²=0 and surjectivity onto the independent local smoothing lines. Inputs: `StableReductionPartII:MC.1/refinement-deformation-sequence`. |

| `versal-node-parameters` | Import the existing miniversal curve hull; identify the actual framed Hilbert completion and its extra r²−1 variables. Inputs: `StableReductionPartII:MC.1/refinement-deformation-sequence`, `StableReductionPartII:MC.1/refinement-completed-atlas`, `SchemeAndStackFoundations:SF.4/node-versal-deformation`. |

| `smooth-dimension` | Smoothness descends along the smooth PGL_r atlas. Q8 applies the stack dimension formula on geometric fibres and subtracts r²−1 to give relative dimension 3g−3; density descends from U^sm. No finite-diagonal hypothesis is used to establish U smoothness, so the Isom properness route is acyclic. Inputs: `StableReductionPartII:MC.1/refinement-completed-atlas`, `SchemeAndStackFoundations:SF.1/stack-morphism-properties`. |

| `normal-crossing-boundary` | Algebraic branch ideals, coefficient-completion descent and relative coordinates prove the relative NC assertion, with branch permutation allowed. Inputs: `StableReductionPartII:MC.1/refinement-labelled-branches`, `StableReductionPartII:MC.1/refinement-relative-boundary`. |

| `proper-moduli` | The stack is separated by its proper diagonal, and finite type by U. Its smooth-curve open is finite type and dense. Q7 reduces existence to DVR diagrams with smooth generic curve; upstream stable reduction supplies an extension after a finite fraction-field extension and a dominating DVR. Uniqueness is supplied separately by separatedness; no universal stable model over the original trait is asserted. Inputs: `StableReductionPartII:MC.1/refinement-source-valuative`, `StableReductionPartII:MC.1/refinement-completed-atlas`, `SchemeAndStackFoundations:SF.1`, `tauceti:TauCetiRoadmap/StableReduction#layer-8-canonical-contraction-and-unpointed-stable-reduction`. |


For the finite diagonal, the native Mathlib theorem `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite` is read in **ZariskisMainTheorem**, not inferred from the finite-morphism file name. It requires properness and local quasi-finiteness. The geometric tangent-space criterion giving unramifiedness needs local finite type, supplied by the bounded graph construction. The native `FormallyUnramified.of_hom_ext` instead tests all square-zero affine thickenings; a check on geometric tangent spaces alone is not an application of that theorem. The SF.0 criterion is therefore a necessary imported input.

For properness of the moduli stack, Q7 is the precise replacement for invoking the paper’s generic criteria without their proofs. Take h:M_g→M̄_g and f:M̄_g→Spec Z. The Hilbert atlas gives finite type. The diagonal argument gives separatedness. The completion calculation gives density of h. In each DVR test after factoring the generic object through h, the curve over the fraction field is smooth, so upstream stable reduction applies after a finite field extension. Choose a dominating extension DVR as supplied by the existing stable-reduction interface. Do not identify an arbitrary integral closure with a single DVR. Retain the generic-fibre identification and the 2-isomorphism in the stack diagram. The criterion then yields properness without proving existence for a stable family over the original trait.

## Exact supplier frontier

These eight extension requests are the remaining generic work. Four additional packet requests merely acknowledge the already existing StableReduction Layers 1, 2, 3 and 8 contracts, to make the stage-level imports explicit to the checker. They do not ask to replan those layers.

### Q1 — `AlgebraicModuliForArithmeticGeometry:R09.1`

For proper flat finitely presented Gorenstein curves over arbitrary schemes: an invertible relative dualizing sheaf with unrestricted base-change comparison and functoriality for curve isomorphisms; nodality, fixed genus and ampleness of ω give base-change-compatible open loci in a projective flat finitely presented family; geometric very ampleness plus the universally commuting H⁰ bundle gives a relative closed immersion. Supply the Noetherian-approximation compatibility of this package. Stable-fibre vanishing and positivity themselves remain imported from StableReduction Layers 2–3. Sources: Stacks 109.19.1/3, pp.19–21 and 109.22.1/3/5, pp.25–27.

Consumers: `StableReductionPartII:MC.1/refinement-arbitrary-base`, `StableReductionPartII:MC.1/refinement-polarization-locus`.

### Q2 — `AlgebraicModuliForArithmeticGeometry:R09.1`

For finite locally free E,F of the same rank r≥2, represent Isom(P(E),P(F)); identify a projective-bundle isomorphism with an isomorphism E⊗L≅F modulo isomorphism of the base line L and its scalar ambiguity, with the quotient convention fixed. Build on SF.2/quasi-coherent-algebra-descent (the affine Aut_alg(Mat_r) scheme) and SF.2/azumaya-trivialization-gerbe (the scalar central extension); identify this existing PGL_r model with projective-space automorphisms and establish its smoothness and relative dimension. Use PGL_r=GL_r/G_m as the smooth affine group scheme of relative dimension r²−1, and prove that Isom(P(E),P(O^r)) is a smooth surjective PGL_r-torsor. This is a relative all-test-scheme statement, not the abstract quotient of GL_r(R) by R-units. DM §1, pp.82–83 and §5, p.104 use the action and frame scheme but does not prove this generic supplier contract.

Consumers: `StableReductionPartII:MC.1/refinement-frame-comparison`.

### Q3 — `SchemeAndStackFoundations:SF.2`

For coherent modules on a proper nodal curve, provide sheaf Ext, global Ext, the local-to-global Ext spectral sequence E₂^{p,q}=H^p(sheaf Ext^q)⇒Ext^{p+q}, functorial edge maps, and compatibility with the lci cotangent-complex deformation groups when L_{C/k}≃Ω_C. Must combine with curve cohomological dimension one and finite-support cohomology, without interpreting algebraic Kähler differentials of a power-series ring as continuous differentials. DM §1 pp.78–83 and Stacks93.16.2–4, pp.28–29. No sufficient generic node was found in the existing SF.2 packet.

Consumers: `StableReductionPartII:MC.1/refinement-deformation-sequence`.

### Q4 — `AlgebraicModuliForArithmeticGeometry:R09.6`

Complete the geometric comparison used at an existing finite-presentation Hilbert atlas: after Λ=k (char0) or W(k) (charp), compare its completed local ring at a k-rational point with the Artinian framed deformation functor; show a formally smooth projective-frame factor contributes r²−1 power-series variables. Descend smoothness over Z, relative dimension, Cartier branch ideals, and smoothness of every branch intersection from these coefficient-completed local charts. Include the faithfully flat local comparison and finite-presentation hypotheses. A k algebraically closed over F_p need not be finite type over Z, so R09.6/versal-algebraization cannot be applied over Z with that residue field. Existing scheme-formal-comparison applies after Λ-base change; node-versal-deformation and Grothendieck effectivity belong to SF.4. Stacks109.15.1, pp.15–16 supplies the coefficient-ring argument.

Consumers: `StableReductionPartII:MC.1/refinement-completed-atlas`, `StableReductionPartII:MC.1/refinement-relative-boundary`.

### Q5 — `SchemeAndStackFoundations:SF.0`

For a finite unramified morphism X→S and a geometric point of S, construct an étale neighbourhood T→S on which X_T is a finite disjoint union of closed immersions into T. Permit shrinking away pieces absent at the chosen fibre. Do not replace unramified with étale or assume flatness. Stacks41.17.3 (04HJ), pp.19–20.

Consumers: `StableReductionPartII:MC.1/refinement-labelled-branches`.

### Q6 — `SchemeAndStackFoundations:SF.4`

Define relative normal crossings on a scheme smooth over B by étale coordinate hyperplanes relative to B. Prove that effective Cartier branches with all intersections smooth over B of relative codimension equal to the number of branches admit such coordinates; equivalently independent relative conormals make the branch-equation map to affine space smooth. Supply compatibility under smooth pullback and descent of the effective divisor and relative NC property along smooth algebraic-stack atlases. Absolute regularity in SF.4/strict-normal-crossings does not suffice over B=Spec Z. Stacks41.21, pp.26–29 is the absolute model; DM Definition1.8 and Corollary1.9, p.83 is the relative application.

Consumers: `StableReductionPartII:MC.1/refinement-relative-boundary`.

### Q7 — `SchemeAndStackFoundations:SF.1`

Prove the algebraic-stack properness criterion used in parent MC.1/proper-moduli, with 2-isomorphisms retained: if f:X→S is separated and finite type over a locally Noetherian base and h:U→X is finite type with dense image, existence for every DVR diagram whose generic object factors through h after a field extension and a dominating valuation ring suffices for properness. Include the usual finite-extension-of-fraction-field sufficient form and properness descent. Source: Stacks106.11.3 (0CQM), pp.28–30, whose proof was read. The generic source DM Theorem4.19, p.103 is not a proof.

Consumers: `StableReductionPartII:MC.1/proper-moduli`.

### Q8 — `SchemeAndStackFoundations:SF.1`

For a locally Noetherian algebraic stack X and a smooth presentation U→X, define stack dimension and prove dim_x X=dim_u U−dim_u U_x, invariant under the choices of lift and field representative. Supply relative dimension by field-valued fibres and its base-change invariance. Applied after base change to each geometric point of Spec Z, a smooth PGL_r-torsor atlas of relative dimension r²−1 and a scheme U smooth of relative dimension 3g−3+r²−1 give stack relative dimension 3g−3. Stack-morphism-properties supplies smooth descent but does not state this dimension contract. Stacks Definitions107.5.2/7 and Lemmas107.5.4/5/9/10, pp.10–13 (0DRG,0DRJ,0DRN,0DRP). Use the subtraction in the lemma statement and proof conclusion; the proof-opening sign misprint is recorded in sourceIssues.

Consumers: `StableReductionPartII:MC.1/smooth-dimension`.


The generic local deformation theorem already belongs to `SchemeAndStackFoundations:SF.4/node-versal-deformation`. Its packet records a continuous-versus-algebraic completion gap. The current pass reads Stacks Lemmas 93.16.2–93.16.4 to identify the needed comparison, without claiming the generic owner is now closed. Likewise, SF.0, SF.1 and SF.4 supplier packets are not treated as accepted gap-free formal libraries. The smooth PGL groupoid only uses the smooth case of `SF.1/stack-presentation`; the separate bootstrap problem for merely flat groupoids is not required here. Torsor representability uses only the affine-group part (a) of `SF.1/torsor-representability`, supplied by `SF.1/affine-fpqc-descent`, since PGL_r is affine. It does not use the general non-affine-group algebraic-space bootstrap.

The rank-stratum source has already recorded errata in the A0-extension owner. The present use takes a=0 and the universally quantified form of the lowest-cohomology stratum. No printed nonzero-degree H⁰ clause is used, and the same erratum is not filed again. One new misprint is recorded as `StableReductionPartII/E-MC1-001`: Stacks Lemma 107.5.5 (0DRJ), p. 11, adds instead of subtracting the atlas-fibre dimension in its proof opening. Its statement and proof conclusion already use subtraction. For the point stack, the identity atlas gives zero while the A¹ atlas would give two with the printed sum; subtraction gives zero for both. The official tag has no comments and the current source retains the sign. This finding awaits independent review and affects no intended result.

## Pinned library boundary and suggested-file acceptance

The reviewed library audit reports partial projective/coherent infrastructure, without the full Hilbert, relative moduli, effectivity and deformation interfaces this construction needs. The baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The current library’s finite locally free category and invertible-sheaf carrier were also inspected; its absolute module cohomology does not supply relative coherent Ext or its spectral sequence. None of those missing geometric objects is replaced by an assumed proposition or dummy data structure in Lean.

The five baseline references recorded in the packet are `Polynomial.C`, `Polynomial.X`, `Polynomial.eval`, `AlgebraicGeometry.FormallyUnramified.of_hom_ext`, and `AlgebraicGeometry.IsFinite.of_isProper_of_locallyQuasiFinite`. Their definitions or full statements were read at the pins. The first three support the light polynomial definition. The last two clarify the inherited diagonal proof and its limits. The polynomial definition uses integer subtraction, so its genus-zero numerical extension is 1−6T; geometric conclusions still assume g≥2. Its five API signatures and four examples elaborate at the shared pinned build. Compilation permits only the expected proof-placeholder warnings; it makes no implementation claim.

The full mathematical acceptance suite includes a nontrivial degree-zero polarization twist, a nontrivial infinitesimal deformation of the trivial line, an incomplete ambient linear series, scalar changes of coordinates, a curve with nontrivial stabilizer, three genus-two deformation types, a finite unramified branch that is not étale, and a vertical divisor excluded by relative smoothness. Each distinguishes an incorrect definition or an insufficient hypothesis.

## Planet policy and assembly

The parent already selects six MC.1 planets: Tricanonical Hilbert locus; Hilbert quotient presentation; Deligne–Mumford moduli stack; Node-smoothing parameters; Normal-crossings boundary; Properness of stable moduli. This part adds zero planets and preserves those choices, so assembly stays within the six-per-layer limit.

Assembly should retain these refinement IDs, splice the thirteen-entry target-resolution map into the parent proof routes, and consolidate the terminal SF.4 overlap with the maintainer. Generic suppliers keep their ownership. The existing input definition of the moduli groupoid and effective descent is `StableReductionPartII:key/moduli-curves` and `StableReductionPartII:MC.0/effective-descent`; it must be identified with the corresponding SF.4 definition, not silently duplicated. The independent generic proof frontier remains Q1–Q8. Coverage is planned until these contracts and the transitive gaps are resolved; the present pass does not label MC.1 closed.

## Sources and bounded reading receipts

Results throughout this document are stated in the worker’s own words. Printed page numbers refer to the downloaded editions below. The readings cover the passages needed for these targets; they do not claim a complete rereading of DM §§2–3, the GIT book, or every transitive source. The four deliverables contain no source excerpts, PDF data or extracted text. All URLs were accessed on 2026-10-18.

- **[DM]** Pierre Deligne; David Mumford, [The irreducibility of the space of curves of given genus](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1969c--IrredModCurves-Deligne-Numdam.pdf), Publications Mathématiques IHÉS 36 (1969), pp. 75–109. Read: §1, pp. 76–85: duality, tricanonical Hilbert construction, deformation and Isom; §4, pp. 97–104: stack definitions and criteria 4.19 and 4.21; §5, Proposition 5.1 and Theorem 5.2, pp. 104–105. SHA-256: `d779973708ecef9a098db863df766f173740d75302f15655e4bbc9dd7df739e7`.

- **[MC]** The Stacks Project Authors, [Moduli of Curves](https://stacks.math.columbia.edu/download/moduli-curves.pdf), Stacks Project ed88ff78, compiled 2026-07-14. Read: §109.15, pp. 15–16; §109.19, pp. 19–21; §109.22, pp. 25–27. SHA-256: `8d47dce5cba7d820384aa749f2c3bd44ca8100ea97ae7c7f40eef0dfbae15947`.

- **[PERF]** The Stacks Project Authors, [Derived Categories of Spaces](https://stacks.math.columbia.edu/download/spaces-perfect.pdf), Stacks Project ed88ff78, compiled 2026-07-14. Read: §75.25, Lemma 75.25.1 and remarks, pp. 60–62; §75.26, Lemmas 75.26.4–75.26.7, pp. 64–66. SHA-256: `99304b1a36799044a20cb7c74ad12e1a73e06ca2cd3b132b6c37a9b869a41a29`.

- **[DEF]** The Stacks Project Authors, [Examples of Deformation Problems](https://stacks.math.columbia.edu/download/examples-defos.pdf), Stacks Project ed88ff78, compiled 2026-07-14. Read: §93.16, Lemmas 93.16.2–93.16.4, pp. 28–29. SHA-256: `6628c6bb54013573e46922057a717a8d53c3ac9e126f0dba87290ffe8e3ad3d8`.

- **[LIMITS]** The Stacks Project Authors, [Limits of Schemes](https://stacks.math.columbia.edu/download/limits.pdf), Stacks Project ed88ff78, compiled 2026-07-14. Read: §32.15, Lemmas 32.15.2–32.15.3 and proofs, pp. 39–42. SHA-256: `a575d9eddea143ae00b39df8e0d98a66c6c9b2adcdace9d004c0ed5bc47f9d1e`.

- **[ETALE]** The Stacks Project Authors, [Étale Morphisms of Schemes](https://stacks.math.columbia.edu/download/etale.pdf), Stacks Project ed88ff78, compiled 2026-07-14. Read: §41.17, Lemmas 41.17.1–41.17.3, pp. 19–20; §41.21, definitions and Lemmas 41.21.2–41.21.7, pp. 26–29. SHA-256: `cfe0581a0bfe38522726f6a233ab4cd30d5f283bef86c4f136fc2ee34c8ecc99`.

- **[STACKDIM]** The Stacks Project Authors, [The Geometry of Algebraic Stacks](https://stacks.math.columbia.edu/download/stacks-geometry.pdf), Stacks Project ed88ff78, compiled 2026-07-14. Read: §107.5, Definitions 107.5.2/7 and Lemmas 107.5.4–107.5.11 with proofs, pp. 10–13. SHA-256: `e050cfe7852eee1c3cec2df32a54971203bcc94bdf88a954cfd62bb02f317091`.

- **[STACKVAL]** The Stacks Project Authors, [More on Morphisms of Stacks](https://stacks.math.columbia.edu/download/stacks-more-morphisms.pdf), Stacks Project ed88ff78, compiled 2026-07-14. Read: §106.11, Lemmas 106.11.1–106.11.3 and proofs, pp. 27–30. SHA-256: `d2f054f8b2f6c3a58f6c9154cc5536c05778b32960aa5afa7ba57d69c725aafa`.
