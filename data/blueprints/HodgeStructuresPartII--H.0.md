# Hodge structures, Part II: Higgs and parameter connections (H.0)

This part supplies the algebra needed to move between parameter connections, Higgs fields, filtered flat bundles and their tensor operations. It extends the [accepted design](HodgeStructuresPartII.md); it does not replace that design or the existing Tau Ceti Hodge-structure roadmap. The accepted packet has 569 declaration targets. Their original identifiers, statements, APIs and tests remain prerequisites. The present packet adds seven targets: an ordered tensor-valued shuffle, a vanishing lemma, its expansion theorem, the arbitrary-coefficient tensor nilpotence bound, two rank bounds, and a parameter residue construction.

H.0 is **planned**, with seven precisely stated gaps. This is a complete planning pass at target granularity, rather than a closed formalisation. Each target has a new declaration, an exact accepted prerequisite, or a supplier contract and gap recorded below. The suggested Lean file checks the types of the new affine signatures and acceptance examples. It neither implements them nor supplies the missing global sheaf signatures. Every new node has implementation status `unchecked`.

The distinction between the local algebra and its intrinsic interpretation is part of the mathematics. A sheaf tensor product cannot be computed by tensoring the modules of global sections. A local nilpotence exponent need not have a uniform bound on an infinite cover. A finite Rees module cannot represent the unbounded period filtration merely by changing its name. These three distinctions determine the interfaces requested from the neighbouring roadmaps.

## Scope, ownership and sources

H.0 owns the parameter/Higgs operator, its curvature and horizontal maps, tensor, dual and pullback formulas, ordered nilpotence, and the filtered-flat-to-Higgs construction. Generic sheaf tensor and exterior constructions belong to EnhancedDerivedSheaves:E1. Generic filtered and Rees algebra belongs to DerivedDeRhamCohomology:DD.1. The common geometric variation carrier belongs to ShimuraData:D3; its geometric comparisons are H.2 targets. Ordinary relative connections and their comparison with crystals belong to CrystallineCohomology:CR.1. ColemanPowerSeries:L1 supplies the integral derivation-of-determinant identity. None of these objects is recreated here.

The scope contains no complex or p-adic Simpson correspondence, Hodge moduli space, canonical extension, period-map theorem, parabolic rank estimate, rigidity-to-integrality theorem, limiting mixed Hodge structure, definability theorem or real Noether–Lefschetz theorem. Those are H.1–H.8 and their named consumers. This part exports the operator and coherence data they need. It cannot take their correspondence theorems as prerequisites for constructing those data.

Four freely accessible sources determine the relevant conventions. The packet records their editions, passage ranges and, for the PDFs, content hashes. Reading claims cover the passages specified here, rather than all the results in each paper.

- Esnault–Groechenig, [*Rigid connections and F-isocrystals*, author-hosted preprint](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf), §2.1, printed pp.5–6, and §4.2, pp.23–24: the Higgs and parameter Leibniz equations, scaling, and the special fixed-determinant convention. This edition has 44 pages; it has not been collated here with the published Acta edition. Its rigidity statements belong to H.5.
- Liu–Zhu, [*Rigidity and a Riemann–Hilbert correspondence for p-adic local systems*, arXiv:1602.06282v3](https://arxiv.org/pdf/1602.06282v3), Theorem 2.1 and its setup, pp.6–8; Lemma 2.15 and its complete printed proof, pp.18–19; Definitions 3.5–3.6, pp.21–22; and Remark 3.2, p.24. These specify the Tate-valued Higgs field, semilinear action, tensor/dual/pullback formulas, filtered period bundle and t-connection. The shuffle and rank results below are authored algebraic deductions; they are not attributed to this paper as theorems in this generality.
- Heuer, [*A p-adic Simpson correspondence for smooth proper rigid varieties*, published PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01321-4.pdf), Inventiones mathematicae 240 (2025), 261–312: Definition 1.2(2), p.262; Definition 2.1 and the following paragraph, pp.267–268; Definition 4.1 and Remark 4.2, pp.297–298. These passages give the analytic twisted Higgs definition, symmetric action, image algebra and canonical coefficient section. The spectral Picard construction and correspondence are consumer targets.
- The Stacks Project, [Connections, tag 07J5](https://stacks.math.columbia.edu/tag/07J5), opening definitions and Lemma 60.15.1 with its displayed proof, read 8 October 2026: the additive connection, exterior extension and integrability convention. The crystalline example does not identify every arbitrary-site connection with a crystal.

The accepted extraction has 149 routed items. The packet gives each one a scope disposition. Exactly five concern H.0 directly: PAPER-HEUER-25/3, PAPER-LIU-ZHU-17/H02 and H03, and PAPER-ESNAULT-GROECHENIG-20/004 and /061. Their actual carriers and formulas are considered here. The other 144 are retained as sibling-stage source targets, not asserted proved or fully read. Their routing entries express scope decisions and do not modify the accepted extraction. In particular, H.8 and its real Noether–Lefschetz target remain mandatory.

## Baseline and imported interfaces

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The declarations cited in the packet were read with their ambient hypotheses at those commits. Mathlib already supplies binary tensor products, indexed tensor products, tensor powers, their reindexing equivalences, bases and quotient modules. Tau Ceti already supplies its fibrewise Hodge-structure carrier. Those are library citations, never new definition nodes.

The reviewed library-coverage rows for HodgeStructures L0–L3, EnhancedDerivedSheaves E1 and ShimuraData D3 were read with their evidence and duplication notes. The Hodge-structure linear algebra is existing work; the incomplete categorical kernel/cokernel audit does not license redoing it. E1 contains native underived sheaf-related operations, but its derived presentability/tensor target does not alone give every ordinary tensor, exterior and descent interface used here. There is no dedicated reviewed HodgeStructuresPartII, CR.1 or DD.1 row.

The current supplier packets were also read. CR.1/integrable-connection describes an affine differential quotient and crystalline connections; it does not state the general ringed-site comparison needed by H.0. E1/presentability-and-derived-tensor is a derived target. DD.1/filtered-modules and DD.1/rees-description describe filtered enhanced derived objects and a graded derived Rees equivalence. A derived t-cofiber is not, without an additional theorem, the ordinary finite locally free Rees fiber. The CR.0 and DD packets have `needs_changes` reviews; the partial E0 packet has no review object as of 8 October 2026. Citing their requested stages records interfaces to be supplied.

The bounded exact-pin searches in the packet found no native Higgs, parameter-connection or ordered-shuffle implementation. This is a bounded search report. It is not a claim about every declaration or every upstream discussion. No existing blueprint link map named this successor in the screened tree; the roadmap's stage requirements and its accepted eight joining briefs supply the cross-roadmap direction.

Two local parent interfaces are restated under `Imported` in the suggested file solely to let this delta elaborate independently. They refer to H.0/affine-ordered-iterate and H.0/affine-tensor-field, with the equations in the next section. They are admitted parent planning declarations, not native Mathlib definitions and not new nodes. The parent suggested file remains the source of its other affine APIs. Its 36 omitted intrinsic signatures remain omitted against their actual missing carriers; they are listed at the end of this reader.

## Intrinsic parameter and Higgs conventions

The inherited setting is a commutative ringed Grothendieck site with a supplied relative differential calculus. Its degree-zero sheaf is the ring sheaf O, its degree-n sheaf is the exterior power Ωⁿ of Ω¹, and its differential is additive, restriction-compatible, squares to zero and obeys the graded Leibniz rule. The parameter λ is a global central section with dλ=0. The underlying module sheaf E is finite locally free, with locally constant rank. A trivialization is a chart for a calculation, never a field of the intrinsic object.

A preconnection is an additive sheaf map D:E→E⊗Ω¹ satisfying

\[
D(ae)=aD(e)+\lambda(e\otimes da).
\]

The exterior extension on a local elementary tensor is

\[
D_k(e\otimes\omega)=D(e)\wedge\omega+\lambda e\otimes d\omega.
\]

Balancing over O follows from the Leibniz equation, and restriction compatibility must be preserved before gluing. The curvature is D₁D₀:E→E⊗Ω². Expanding the scalar terms, using dλ=0 and d²=0, proves its O-linearity. An integrable parameter connection has this actual curvature map zero. The equation for the square of the extension gives the inherited flat-extension target. A proposition stating that curvature exists is not a carrier for this operator.

At λ=0 the additive operator is O-linear, so it is a Higgs field; its exterior square is zero exactly when it is integrable. At λ=1 it is an ordinary relative connection, with the CR.1 comparison in G1. If λ is invertible and relatively constant, λ⁻¹D is an ordinary connection and its curvature is λ⁻² times the parameter curvature. These conclusions do not impose characteristic zero, reducedness or crystalline quasi-nilpotence on the definition. If λ is not relatively constant, the displayed exterior-square arguments acquire additional derivative terms and are not this target.

A horizontal morphism f:E→F is O-linear and satisfies D_F f=(f⊗1)D_E. The unit object has underlying O and operator λd. On an elementary tensor, the tensor operator is D_E(e)⊗f+e⊗D_F(f), with the final differential coefficient placed on the right through the specified associators. Moving a scalar between the factors produces the same λ-scaled derivative term, proving balancing. Its curvature is the sum of the two factor curvatures. For finite locally free E the dual connection is uniquely determined by horizontality of evaluation; locally, its matrix is the negative transpose. Pullback uses the supplied map of differential calculi, the ordinary sheaf pullback tensor comparison and the parameter image. These inherited targets need the actual underived E1 carriers and coherence in G2.

In a basis, write D=λd+A. A gauge change conjugates the operator and introduces the λ-scaled derivative of the gauge matrix; curvature transforms by conjugation. The intrinsic operator and its matrix presentation agree through the parent coordinate-comparison target. The gauge identities are integral polynomial and differential identities. No division by a factorial, rank or nilpotence bound is permitted merely to simplify a coordinate formula.

A twisted Higgs field has coefficient sheaf Q=Ω¹⊗L for an invertible line L; its square lands in the appropriate Ω²⊗L² target. Local frames of L give comparisons, not a global trivialization. In a p-adic application L is the Tate line O(−1), carrying its stipulated semilinear character. Choosing a basis of compatible roots is a noncanonical coordinate choice. It cannot erase the Galois action from the intrinsic coefficient data. Heuer's Definition 2.1 explicitly motivates retaining this distinction.

## Ordered tensors and what nilpotence means

For the new affine targets let R be a commutative ring and E,F,Q arbitrary R-modules. Write Qⁿ for the native tensor power indexed by Fin n. In degree zero Q⁰ is the tensor unit R, even when Q is zero. The parent ordered iterate Iₙ(θ):E→E⊗Qⁿ starts with e↦e⊗1. Its successor applies θ to the E factor and inserts the new Q coefficient as the first, or slot-zero, factor. It does not pass to a symmetric or exterior quotient.

For a dual tuple v₀,…,vₙ₋₁, contraction of Iₙ gives A(v₀)⋯A(vₙ₋₁), where A(v) is contraction of θ by v. The rightmost operator acts first. This fixes both the tensor convention and the coefficient word convention. Individual scalar factors commute; the endomorphisms need not commute. The inherited basis-coordinate vanishing criterion says that, for a specified finite basis of Q, Iₙ=0 exactly when every length-n coefficient word vanishes.

An ordered bound is a positive N with I_N=0. The parent monotonicity lemma gives I_m=0 for m≥N. Bound zero is deliberately excluded: I₀ is the tensor-unit identity and vanishes only when E is zero. Integrability concerns the alternating square and does not imply ordered nilpotence. A nonzero scalar field on a line has zero alternating square but no positive ordered bound. Likewise, nilpotence of each selected contraction is not substituted for vanishing of every ordered word.

For finite locally free Q, the inherited integrable Higgs and symmetric-action targets compare the commuting coefficient algebra with the tensor definition. The augmentation ideal and its powers give the nilpotence filtration, with the degree-zero unit and the exact word length retained. The augmentation/ordered equivalence uses finite duality and genuine coefficient reconstruction. The kernels that result are module subsheaves. Their being finite locally free subbundles is an extra geometric claim, absent in general.

The arbitrary-Q extension below is essential because dual contractions can lose all information. Over R=Z, every linear functional Z/2→Z is zero, while Z⊗_Z Z/2 is nonzero. Thus a proof checking only contractions cannot establish equality of arbitrary tensor-valued maps. The new proof uses tensor universal properties, pure tensors and tensor induction. It has no basis or flatness hypothesis.

## The integral shuffle

Given s⊆Fin n, put a=|s| and b=|sᶜ|. Increasing enumeration defines a bijection σ_s:Fin a⊔Fin b→Fin n, sending the left indices to s and the right indices to its complement. Increasing enumeration preserves the chronological order within each factor's iterate. The coefficient equivalence Sh_s:Qᵃ⊗Qᵇ→Qⁿ is native indexed-tensor concatenation followed by reindexing through σ_s. On elementary families it takes their disjoint union and composes it with σ_s⁻¹. There is no alternating sign.

Define L_s(θ,ψ) by first applying I_a(θ)⊗I_b(ψ), then the native four-factor interchange (E⊗Qᵃ)⊗(F⊗Qᵇ)≅(E⊗F)⊗(Qᵃ⊗Qᵇ), then 1⊗Sh_s. This is a single actual R-linear map. The subordinate slot and coefficient constructors are its API; they are not separate target nodes merely because their definitions have names.

The expansion is

\[
I_n(T(\theta,\psi))=\sum_{s\subseteq\operatorname{Fin}(n)}L_s(\theta,\psi).
\]

Here T is the inherited tensor field, every subset occurs once and its scalar coefficient is 1. At n=0 the one subset gives the tensor-unit map. For the successor, apply the newest factor action to the previous expansion and separate its left and right summands. Subsets of Fin(n+1) split according to membership of zero; removing zero and lowering all other indices recovers the previous subset. The slot equations identify the two summands with the asserted L_s. The tensor equations are checked on generators and extended by tensor induction, rather than using commutativity of the factor operators.

If I_N(θ)=I_M(ψ)=0 and |s|≥N or |sᶜ|≥M, one factor iterate is zero by monotonicity, so L_s=0. This has its own lemma node because it is invoked by the bound theorem. When N,M>0 and n=N+M−1, each subset satisfies one of these inequalities: otherwise the two cardinalities sum to at most N+M−2. The expansion is therefore a sum of zero maps. The bound N+M−1 is valid over arbitrary commutative rings and coefficient modules, even without integrability.

The characteristic-two test distinguishes this expansion from a tempting binomial formula. Let X be the square-zero rank-two Jordan operator on each factor, and let q₀,q₁ be independent vectors in Q=F₂². Set θ=X⊗q₀ and ψ=X⊗q₁. The degree-two mixed term has coefficient q₀⊗q₁+q₁⊗q₀ and nonzero endomorphism X⊗X. The coefficient is nonzero in the ordered tensor power. It would disappear if one erroneously identified the two tensor slots before calculating, since 2=0. The tensor field has bound three and not two. This checks both the exponent and the retained coefficient order.

The coefficient naturality equation holds for every u:Q→P as an equality of full linear maps, and horizontal maps on E,F intertwine L_s. These equations are precisely what a sheaf restriction adapter needs. To use the affine theorem intrinsically, G2 must identify tensor powers on free charts, preserve every reindexing/associator under restriction, detect equality locally, and glue the entire map equality. It is insufficient to prove the formula just for global sections or to ask duals to detect tensors without hypotheses.

## Rank bounds and their local meaning

Over a field K let V,P be finite-dimensional and suppose θ:V→V⊗P already has some positive ordered bound. The new theorem lowers the bound to max(1,dim V). It does not deduce the existence of the original bound from geometry, Galois symmetry or the individual nilpotence of coefficients. Choose a finite basis of P. Every sufficiently long coefficient word vanishes by the parent coefficient criterion.

If V is nonzero, choose a nonzero value of a coefficient word acting on a vector whose word length is maximal. Such a length exists because all words of the supplied bound vanish. Every coefficient kills the resulting vector: otherwise prepending that coefficient produces a longer nonzero value. Its span is a common-kernel line. Each operator descends to V divided by this line, where the original joint bound still holds. Induction on dimension gives a bound of dim V−1 on the quotient. Words of that length on V land in the common-kernel line, and one further coefficient kills them. The zero-dimensional case uses positive bound one. This proof needs no commutation assumption because joint ordered nilpotence already supplies the common kernel.

For a reduced commutative ring R, specified finite bases of E and Q, and r=rank E, the bound becomes max(1,r). For each prime ideal p, extend to the fraction field of R/p. The inherited scalar-extension theorem preserves the initial ordered bound, and the base-changed bases retain their sizes. Apply the field theorem. Each coefficient-word matrix entry then maps to zero in that field. The domain embedding R/p→Frac(R/p) makes the entry zero modulo p. Being in every prime makes it nilpotent; reducedness makes it zero. The finite basis criterion converts these coefficient equations back to the full ordered tensor map. The zero ring has only zero modules and satisfies the same assertion.

This is not reflection along one arbitrary base change: there is a family of prime tests followed by reduced-ring detection. The reducedness premise is indispensable. On the rank-one module over Z/4, multiplication by 2 gives a field with degree two zero but degree one nonzero. Over a field the size-three Jordan example has bound three and not two, so the positive dimension estimate is sharp. Rank zero is represented by max(1,0)=1.

For sheaves, this conclusion is chartwise. Locally free E has locally constant rank, which can vary between components; Q must also have the finite local bases used by the coefficient criterion. A finite cover of reduced free charts gives a uniform maximum of their bounds, and local equality detection then gives a global exponent. A cover with bounded ranks gives the same conclusion when its equality test applies. On an infinite disjoint union of points with Jordan blocks of sizes tending to infinity there is a bound on each component and no finite bound on their union. G6 retains this exact uniformity issue. Neither coherence nor local freeness of the nilpotence kernels follows from the rank argument.

## Griffiths filtration, finite Rees and linear residue

The inherited finite Griffiths target has a decreasing Z-indexed filtration FᵖE by locally split subbundles, equal to E below an integer a and zero above b, with finite locally free graded pieces. An ordinary flat connection satisfies ∇Fᵖ⊆Fᵖ⁻¹⊗Ω¹. Its degree-minus-one symbol on Gᵖ=Fᵖ/Fᵖ⁺¹ sends [e] to [∇e]. Replacing e by an element of Fᵖ⁺¹ changes ∇e by Fᵖ⊗Ω¹, so this class is well defined. The derivative term e⊗da is also in Fᵖ⊗Ω¹ and disappears. Hence the symbol is O-linear, rather than an ordinary connection. Flatness supplies its alternating-square integrability, while the finite degree range supplies ordered nilpotence with bound b−a+1 when a≤b.

The ordinary finite Rees sheaf sits in E[t,t⁻¹] as the O[t]-module generated by t⁻ᵖFᵖE. The infinite written filtration is eventually constant at E and zero, so finitely many weighted local splitting summands give a finite locally free module. The relative derivative kills t. Griffiths transversality makes t∇ preserve this Rees module: applying it to t⁻ᵖe produces t⁻⁽ᵖ⁻¹⁾∇e. Its parameter is t. The zero fiber is the associated graded with its symbol; the fiber at t=1 is E with ∇; after inverting t it is the localized bundle with rescaled operator t∇, which becomes ∇ on dividing by t. DD.1 must give these actual carrier identifications and operator compatibilities; G3 records their absence from the derived supplier target.

The new residue construction isolates the elementary part that does not require a Rees carrier. For t∈R, additive d:R→Q and additive D:E→E⊗Q with D(ae)=aD(e)+t(e⊗d(a)), it gives

\[
\operatorname{res}_t(D):E/tE\longrightarrow (E\otimes_RQ)/t(E\otimes_RQ),
\qquad [e]\longmapsto[D(e)].
\]

Here tM is the range of multiplication by t, and both quotients are native module quotients. Composing D with the target quotient makes it R-linear, since its derivative term is killed. Moreover D(te)=tD(e)+t(e⊗d(t)), so this composite kills tE even if d(t) is nonzero. The linear quotient universal property then descends it. No regularity of t, flatness, integrability, finite filtration or derivation condition is needed for this elementary descent. A geometric relative connection imposes a derivation and d(t)=0 for its exterior and flatness formulas, separately from this proof.

The generator equation, uniqueness, equality criterion and naturality under intertwining module and coefficient maps form its API. The quotient maps are native Submodule.mapQ maps; generator equations also give their identity and composition compatibility. Equality of the residues of D,D′ is equivalent to D(e)−D′(e) lying in t(E⊗Q) for every e. Surjectivity of the quotient projection proves uniqueness. At t=0 the map agrees with a native linear field under quotient by zero. At t=1 both quotients vanish. This latter residue is not the fiber of a polynomial parameter family evaluated at one: that fiber quotients by t−1 instead. For R=E=Q=Z and t=2, the linear map e↦e⊗1 gives a nonzero residue, ruling out the zero-map construction.

To regard the residue as an R/(t)-linear Higgs coefficient map one also identifies its target with (E/tE)⊗_{R/(t)}(Q/tQ), through the actual tensor/quotient equivalence. At the affine module level this is ordinary right-exact quotient algebra; it does not need flatness. The intrinsic sheaf version, its restriction maps and its exterior compatibility are E1 requests. The linearity statement alone does not transport integrability or identify the graded symbol.

Liu–Zhu's period lattice has a different filtration. Their X⁺ has coefficient sheaf O_X completed-tensored with B_dR⁺; X inverts t. A finite locally free lattice E⁺ determines a bundle on X with a decreasing unbounded filtration satisfying tⁱFilʲ=Filⁱ⁺ʲ. Negative powers live on X after localization. Their relative B_dR-linear Griffiths connection gives the t-connection t∇ on the lattice; its residue is a linear field. The identification of this quotient with the actual graded-base Higgs bundle and Ω¹_X(−1) must preserve the semilinear Galois action and Tate character. G5 requests these precise adapters. The bounded finite Rees construction is not asserted to supply them. Likewise, Lemma 2.15 proves nilpotence using the source's Galois scaling of log γ; the rank theorem here begins with nilpotence and does not replace that geometric proof.

## Determinant and symmetric-action boundaries

On a constant-rank chart, the determinant connection is the alternating sum of D acting on the factors of a top wedge. Its Leibniz equation has parameter λ; in a basis its connection form is tr A. A determinant gauge change uses the integral Jacobi identity supplied by ColemanPowerSeries:L1/derivation-determinant-unit. That node's characteristic-free polynomial/derivation identity is the input; it does not grant an inverse factorial or a field assumption. The horizontal compatibility between chart determinant lines is what makes the connection descend when rank varies locally.

The required cross-ring exterior comparison is, for any R→S and module Q,

\[
S\otimes_R\bigwedge_R^nQ\simeq\bigwedge_S^n(S\otimes_RQ),
\]

characterized on decomposable wedges. It does not require S flat. E1 owns this generic quotient/universal-property theorem. H.0 must show its connection operators agree after transport through the supplied differential map. The parent receiving-ring exterior-square calculations do not already give this universal comparison for every n and Q. G4 records its use for determinant and pullback compatibility.

A specified determinant condition is a horizontal isomorphism det(E)≅L with a specified parameter connection on L. Trace zero is appropriate only after choosing the fixed trivial determinant with its stated operator. It is not a condition on every Higgs bundle. The Esnault–Groechenig scaling/rigidity argument is read with its special fixed-determinant hypotheses; its moduli and rigidity conclusions are H.5 targets. Arbitrary Higgs fields here keep their determinant field.

Heuer's contraction construction gives a symmetric-algebra action on E when the coefficient is finite locally free and the field is integrable. Definition 4.1 additionally uses the image algebra B_θ inside End(E) and a coefficient-valued section reconstructed through finite local duality. In its analytic setting B_θ is coherent, and an invertible B_θ-module supplies a twist whose operator is reconstructed from that coefficient section. These coherent-image, spectral and Picard constructions are source-specific p-adic consumer work. E1 supplies generic sheaf images and tensor operations; H.0 exports its symmetric action and coefficient naturality. An image inside a finite locally free endomorphism sheaf is not automatically finite locally free on an arbitrary site, nor does a nonflat base change automatically commute with the image. G7 preserves those conditions instead of silently assuming them.

## New declaration catalogue

The following entries are generated from the packet's seven new nodes. All names are proposed declarations in `TauCeti.Hodge.ParameterConnection.H0`. Hypotheses, proof steps, APIs and test statements are mathematical specifications. The suggested file gives their native Lean signatures with admitted bodies. A test is an obligation that distinguishes a correct construction from the stated plausible error; compilation does not prove it.

### Ordered tensor-valued shuffle summand

**Node:** `HodgeStructuresPartII:H.0/h0-tensor-valued-shuffle`. **Declaration:** `orderedShuffleTerm`. **Kind:** construction.

For n≥0 and a subset s of Fin n, let a=|s|, b=|sᶜ|. Define the increasing slot equivalence σ_s:Fin a ⊔ Fin b ≃ Fin n, with its two branches enumerating s and its complement in increasing order. The coefficient equivalence Sh_s:Q^a tensor Q^b ≃ Q^n is native disjoint-sum tensor multiplication followed by reindexing through σ_s. Define L_s=(id_{E tensor F} tensor Sh_s) ∘ fourfoldComm ∘ (I_a(θ) tensor I_b(ψ)), an actual R-linear map E tensor F → (E tensor F) tensor Q^n. Reassociation introduces no sign.

**Hypotheses.** R is a commutative ring; E,F,Q are arbitrary R-modules with additive commutative group structures. I_n(θ) is the parent ordered iterate. Its newest coefficient is at slot 0; I_0 sends e to e tensor 1 in E tensor Q^0. No integrability, finite generation, freeness, projectivity, flatness, reducedness or characteristic restriction is imposed.

**Prerequisites.** `HodgeStructuresPartII:H.0/affine-ordered-iterate`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-natural`, `mathlib:TensorPower`, `mathlib:TensorPower.algebraMap₀`, `mathlib:Finset.orderIsoOfFin`, `mathlib:Finset.orderEmbOfFin`, `mathlib:PiTensorProduct.tmulEquiv`, `mathlib:PiTensorProduct.tmulEquiv_apply`, `mathlib:PiTensorProduct.reindex`, `mathlib:PiTensorProduct.reindex_tprod`, `mathlib:PiTensorProduct.ext`, `mathlib:PiTensorProduct.map`, `mathlib:PiTensorProduct.map_tprod`, `mathlib:TensorProduct.map`, `mathlib:TensorProduct.tensorTensorTensorComm`, `mathlib:TensorProduct.tensorTensorTensorComm_tmul`.

**Proof route.**

1. Construct σ_s using Finset.orderIsoOfFin for s and sᶜ; membership decides the inverse branch. The two increasing enumerations are disjoint, jointly exhaustive and preserve the relative order of each factor.
2. Compose PiTensorProduct.tmulEquiv with PiTensorProduct.reindex. Their generator equations determine Sh_s uniquely on the full tensor products by PiTensorProduct.ext; it is not merely a formula on dual contractions.
3. Tensor the two parent iterates and apply native tensorTensorTensorComm followed by id tensor Sh_s. This defines L_s on arbitrary elements using the native linear maps.
4. The empty coefficient powers use TensorPower.algebraMap₀. Native map/reindex equations prove coefficient naturality. Parent all-order horizontal naturality proves naturality in E and F without inserting a basis.

**Acceptance.**

- For s={0,2} in Fin 4, the second left slot is 2 and the first right slot is 1.
- At n=0 the single summand is the tensor-unit identification, not zero.
- For s={1} in Fin 2, the output coefficients are right then left. A sign or a reversal within a factor fails the tests.
- An R-linear functional family may miss tensors: Hom_Z(Z/2,Z)=0, but Z tensor_Z Z/2 is nonzero.

**Uses.**

- HodgeStructuresPartII:H.0/tensor-nilpotence: Supplies genuine tensor-valued expansion instead of relying on all dual or self-contractions.
- LZ17 Theorem 2.1(iv); Heuer Definition 2.1: Preserves arbitrary coefficient modules and the order of the Tate-twisted coefficient tensor factors.
- HodgeStructuresPartII:H.0 intrinsic tensor and restriction targets: Native horizontal and coefficient naturality are the affine equations to transport through the E1 sheaf tensor-power comparison.

**API.**

- `shuffleSlots` (constructor): The slot equivalence from the increasing finite enumerations of s and sᶜ.
- `shuffleSlots_inl` (simp): σ_s(inl i) is s.orderEmbOfFin(i).
- `shuffleSlots_inr` (simp): σ_s(inr i) is sᶜ.orderEmbOfFin(i).
- `shuffleCoefficients` (constructor): The actual R-linear equivalence Sh_s from the disjoint coefficient powers to the ordered total power.
- `shuffleCoefficients_def` (compatibility): Sh_s equals PiTensorProduct.tmulEquiv followed by PiTensorProduct.reindex through σ_s.
- `shuffleCoefficients_tprod` (simp): Sh_s(tprod a tensor tprod b)=tprod(i↦Sum.elim(a,b)(σ_s⁻¹(i))).
- `shuffleCoefficients_natural` (functoriality): For every R-linear u:Q→P, u^n ∘ Sh_s^Q=Sh_s^P ∘ (u^a tensor u^b); this equality is between full linear maps.
- `orderedShuffleTerm_def` (characterisation): L_s equals the displayed composition of the two parent iterates, native fourfold commutation and id tensor Sh_s.
- `orderedShuffleTerm_horizontal` (functoriality): Horizontal maps f:E→E′ and g:F→F′ with fixed Q satisfy L_s(θ′,ψ′) ∘ (f tensor g)=((f tensor g) tensor id_{Q^n}) ∘ L_s(θ,ψ).

**Unit tests.**

- `H0.shuffle.test_stable_left` (computation): σ_{0,2}(inl 1)=2 in Fin 4.
- `H0.shuffle.test_stable_right` (computation): σ_{0,2}(inr 0)=1 in Fin 4.
- `H0.shuffle.test_empty_tensor_unit` (degenerate): At n=0, Sh_∅(algebraMap₀(2) tensor algebraMap₀(3))=algebraMap₀(6).
- `H0.shuffle.test_mixed_order` (computation): For s={1}⊂Fin 2, singleton pure coefficient families q on the left and r on the right are sent to tprod [r,q].
- `H0.shuffle.test_zero_length` (degenerate): L_∅ at n=0 sends e tensor f to (e tensor f) tensor algebraMap₀(1), for all fields θ,ψ.
- `H0.shuffle.test_torsion_duals_miss_tensor` (non-example): All Z-linear functionals Z/2→Z are zero, while e↦e tensor 1 from Z to Z tensor_Z Z/2 is nonzero.
- `H0.shuffle.test_zero_factor_bound` (compatibility): If M>0 and I_M(ψ)=0, then I_M(T(0,ψ))=0 for arbitrary E,F,Q.
- `H0.shuffle.test_char_two_sharp` (non-example): Over F₂, use the rank-two square-zero Jordan operator X on each factor, with independent coefficient vectors q₀ and q₁ in F₂². Both fields have bound 2, their tensor field has bound 3, and its degree-two ordered tensor is nonzero.

**Source match.** Theorem 2.1(iv), printed pp.7–8; Theorem 2.1(i), printed p.7. The source motivates the tensor field and preservation of nilpotence. The integral tensor-valued shuffle over arbitrary rings and coefficient modules is an authored deduction from the parent ordered-iterate convention, not a quoted source theorem.


### Shuffle summand vanishes at a factor bound

**Node:** `HodgeStructuresPartII:H.0/h0-shuffle-term-vanishing`. **Declaration:** `orderedShuffleTerm_eq_zero`. **Kind:** lemma.

If I_N(θ)=0 and I_M(ψ)=0, and N≤|s| or M≤|sᶜ|, then L_s(θ,ψ)=0. This includes a zero exponent premise when the corresponding module is zero.

**Hypotheses.** R is a commutative ring; E,F,Q are arbitrary R-modules with additive commutative group structures. I_n(θ) is the parent ordered iterate. Its newest coefficient is at slot 0; I_0 sends e to e tensor 1 in E tensor Q^0. No integrability, finite generation, freeness, projectivity, flatness, reducedness or characteristic restriction is imposed.

**Prerequisites.** `HodgeStructuresPartII:H.0/h0-tensor-valued-shuffle`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-mono`, `mathlib:TensorProduct.map_tmul`, `mathlib:TensorProduct.induction_on`.

**Proof route.**

1. Use the parent affineOrderedIterate_mono to increase the relevant exponent to |s| or |sᶜ|.
2. The corresponding factor in the defining tensor map is zero. Native tensor map evaluation on elementary tensors and additive generation imply that the entire factor map, hence its composite L_s, is zero.

**Acceptance.**

- No injectivity or detection by coefficient duals is needed.
- Only one sufficiently large factor is required.

**Source match.** Theorem 2.1(iv), printed pp.7–8; Theorem 2.1(i), printed p.7. The source motivates the tensor field and preservation of nilpotence. The integral tensor-valued shuffle over arbitrary rings and coefficient modules is an authored deduction from the parent ordered-iterate convention, not a quoted source theorem.


### Integral ordered tensor shuffle expansion

**Node:** `HodgeStructuresPartII:H.0/h0-ordered-shuffle-expansion`. **Declaration:** `orderedShuffle_expansion`. **Kind:** theorem.

For every n≥0, I_n(T(θ,ψ))=Σ_{s⊆Fin n} L_s(θ,ψ) as R-linear maps E tensor F → (E tensor F) tensor Q^n. Each subset occurs exactly once, with coefficient 1 and no sign.

**Hypotheses.** R is a commutative ring; E,F,Q are arbitrary R-modules with additive commutative group structures. I_n(θ) is the parent ordered iterate. Its newest coefficient is at slot 0; I_0 sends e to e tensor 1 in E tensor Q^0. No integrability, finite generation, freeness, projectivity, flatness, reducedness or characteristic restriction is imposed.

**Prerequisites.** `HodgeStructuresPartII:H.0/h0-tensor-valued-shuffle`, `HodgeStructuresPartII:H.0/affine-tensor-field`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-succ`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-unit`, `mathlib:TensorProduct.induction_on`, `mathlib:PiTensorProduct.induction_on`.

**Proof route.**

1. At n=0, the unique subset is empty, and the parent tensor-unit iterate gives the equality.
2. For n+1, apply the parent successor step to the n-fold expansion. Expand the next tensor-field action into its left and right actions using the exact parent affine-tensor-field formula.
3. Partition subsets of Fin(n+1) according to whether the newest position 0 belongs to s. Remove that position and shift the remaining positions down by one. This is a bijection with a left copy and a right copy of the subsets of Fin n.
4. The increasing slot equations identify the two resulting summands with L_s. Verify every rearrangement on elementary tensors using the native fourfold and indexed reindex equations, then extend by binary and indexed tensor induction. No commutation of coefficient slots or within-factor operators is invoked.

**Acceptance.**

- At n=1 the two subsets give exactly the two terms in the parent tensor field.
- At n=2 the mixed slots produce q tensor r and r tensor q separately. In characteristic two their sum need not vanish.

**Source match.** Theorem 2.1(iv), printed pp.7–8; Theorem 2.1(i), printed p.7. The source motivates the tensor field and preservation of nilpotence. The integral tensor-valued shuffle over arbitrary rings and coefficient modules is an authored deduction from the parent ordered-iterate convention, not a quoted source theorem.


### Tensor nilpotence bound for arbitrary coefficients

**Node:** `HodgeStructuresPartII:H.0/h0-arbitrary-coefficient-tensor-bound`. **Declaration:** `tensor_bound_arbitrary`. **Kind:** theorem.

For positive N,M, I_N(θ)=0 and I_M(ψ)=0 imply I_{N+M−1}(T(θ,ψ))=0 for arbitrary coefficient Q. This is the affine arbitrary-module input to the parent global tensor-nilpotence theorem, whose sheaf descent premise remains G2.

**Hypotheses.** R is a commutative ring; E,F,Q are arbitrary R-modules with additive commutative group structures. I_n(θ) is the parent ordered iterate. Its newest coefficient is at slot 0; I_0 sends e to e tensor 1 in E tensor Q^0. No integrability, finite generation, freeness, projectivity, flatness, reducedness or characteristic restriction is imposed. N and M are positive natural numbers.

**Prerequisites.** `HodgeStructuresPartII:H.0/h0-ordered-shuffle-expansion`, `HodgeStructuresPartII:H.0/h0-shuffle-term-vanishing`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-mono`.

**Proof route.**

1. Set n=N+M−1. For every subset s of Fin n, |s|+|sᶜ|=n. If both |s|<N and |sᶜ|<M, their sum is at most N+M−2, a contradiction.
2. Apply h0-shuffle-term-vanishing to each summand. The actual linear-map equality h0-ordered-shuffle-expansion is now a finite sum of zero maps.
3. Retain the same stated exponent. Bigger exponents follow from the parent monotonicity theorem; no conversion through exterior or symmetric powers is used.

**Acceptance.**

- Zero on one factor has bound 1 and leaves the other specified bound unchanged.
- The rank-two characteristic-two test realizes degree two nonzero and degree three zero.
- Neither factor needs to be an integrable Higgs field for this ordered-tensor conclusion.

**Source match.** Theorem 2.1(iv), printed pp.7–8; Theorem 2.1(i), printed p.7. The source motivates the tensor field and preservation of nilpotence. The integral tensor-valued shuffle over arbitrary rings and coefficient modules is an authored deduction from the parent ordered-iterate convention, not a quoted source theorem.


### Ordered nilpotence bound by vector-space dimension

**Node:** `HodgeStructuresPartII:H.0/h0-field-rank-bound`. **Declaration:** `field_rank_bound`. **Kind:** theorem.

Let K be a field, V and P finite-dimensional K-vector spaces, and θ:V→V tensor_K P. If I_N(θ)=0 for some positive N, then I_{max(1,dim_K V)}(θ)=0. No integrability or commuting-contraction hypothesis is required; an ordered nilpotence bound is the premise.

**Hypotheses.** K is a field; V,P are actual K-modules with Module.Finite K V and Module.Finite K P. A positive ordered nilpotence bound exists. Individual nilpotence of chosen contractions is not substituted for it.

**Prerequisites.** `HodgeStructuresPartII:H.0/affine-ordered-iterate-vanishing`, `mathlib:Module.Finite`, `mathlib:Module.Basis`, `mathlib:Module.Basis.coord`, `mathlib:Module.finrank`, `mathlib:Submodule.mkQ`, `mathlib:Submodule.mkQ_surjective`, `mathlib:Module.finBasis`, `mathlib:finrank_span_singleton`, `mathlib:Submodule.finrank_quotient_add_finrank`.

**Proof route.**

1. Choose Module.finBasis K P and use the parent all-order coefficient criterion: I_N=0 says every coefficient word of length N is zero. Longer words vanish by factoring off a length-N block. This gives joint nilpotence of the finite coefficient family.
2. If V is nonzero, choose a nonzero vector and a coefficient word of maximal length whose action on it is nonzero. Lengths are bounded by N−1. Its resulting nonzero vector is killed by every coefficient operator; adding any operator on the left would contradict maximality. The resulting common-kernel line is invariant and killed, without a commutativity assumption.
3. Pass each coefficient operator to V divided by the common-kernel line and reconstruct the quotient field with the chosen finite coefficient basis. Every length-N quotient word is zero, so the parent coefficient criterion gives its ordered nilpotence premise. The line has finrank one by finrank_span_singleton, and Submodule.finrank_quotient_add_finrank makes the quotient dimension dim V−1. If dim V=1, the line is all of V and every operator is already zero. If dim V>1, induction gives zero quotient words of length dim V−1; the lifted words therefore land in the line and one more operator kills them. The dimension-zero case is the zero module and has positive bound 1.
4. Apply the parent basis coefficient criterion in the reverse direction at exponent max(1,dim V). This proves the tensor-valued assertion, not merely powers of a single contraction.

**Acceptance.**

- A nilpotent field on a one-dimensional space is zero.
- The size-three Jordan block with one coefficient has degree-three zero and degree-two nonzero, so the positive-rank bound is sharp.
- No algebraic closure or characteristic-zero hypothesis occurs.

**Source match.** Theorem 2.1(i), p.7; Lemma 2.15 and proof, pp.18–19. The source supplies motivation for finite-rank nilpotence, with its own Galois and period hypotheses. The ordered-rank bounds here start with a specified ordered nilpotence premise and follow by common-kernel dimension induction and reduced-ring coefficient detection. They do not prove the source nilpotence premise.


### Ordered nilpotence bound over a reduced ring

**Node:** `HodgeStructuresPartII:H.0/h0-reduced-free-rank-bound`. **Declaration:** `reduced_free_rank_bound`. **Kind:** theorem.

Let R be a reduced commutative ring and let b:Fin r→E and c:Fin d→Q be bases of R-modules. If θ:E→E tensor_R Q has some positive ordered nilpotence bound, then I_{max(1,r)}(θ)=0. The intrinsic application is chartwise on locally free E,Q; locally varying rank is preserved.

**Hypotheses.** R is commutative and IsReduced R; no domain or Noetherian premise is required. E and Q have the displayed finite bases. The general locally free sheaf conclusion is conditioned on G2 and the finite-cover/uniformity gap G6. A positive ordered nilpotence bound exists.

**Prerequisites.** `HodgeStructuresPartII:H.0/h0-field-rank-bound`, `HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary`, `HodgeStructuresPartII:H.0/affine-base-change-contraction`, `HodgeStructuresPartII:H.0/affine-base-change-word`, `HodgeStructuresPartII:H.0/affine-ordered-iterate-vanishing`, `mathlib:IsReduced`, `mathlib:nilpotent_iff_mem_prime`, `mathlib:nilradical_eq_zero`, `mathlib:Module.Basis.forall_coord_eq_zero_iff`, `mathlib:Module.finrank_eq_card_basis`, `mathlib:Ideal.Quotient.isDomain_iff_prime`, `mathlib:IsFractionRing.injective`, `mathlib:Ideal.Quotient.eq_zero_iff_mem`.

**Proof route.**

1. For each prime ideal p, Ideal.Quotient.isDomain_iff_prime makes R/p a domain; pass to its fraction field. Parent scalar-extension transport preserves the given ordered exponent, without reflecting zero back to R. The transported bases have ranks r,d by Module.finrank_eq_card_basis.
2. Apply h0-field-rank-bound over that field, so every length-max(1,r) coefficient-word matrix entry maps to zero. IsFractionRing.injective detects zero in R/p; Ideal.Quotient.eq_zero_iff_mem then puts each source entry in p.
3. Each entry lies in every prime ideal, hence is nilpotent by nilpotent_iff_mem_prime. IsReduced makes it zero; equivalently use nilradical_eq_zero. The zero ring is handled by subsingleton modules.
4. Basis coordinates detect zero for the ordered tensor target, or equivalently invoke the parent coefficient criterion after all word matrices vanish. Do not claim that one arbitrary residue map reflects curvature or any other source tensor.

**Acceptance.**

- Over Z/4 the rank-one scalar 2 has degree-two zero and degree-one nonzero, so reducedness cannot be removed.
- A free rank-zero module has positive bound 1.
- This local free theorem does not identify rank on disconnected sheaf components with one fixed integer.

**Source match.** Theorem 2.1(i), p.7; Lemma 2.15 and proof, pp.18–19. The source supplies motivation for finite-rank nilpotence, with its own Galois and period hypotheses. The ordered-rank bounds here start with a specified ordered nilpotence premise and follow by common-kernel dimension induction and reduced-ring coefficient detection. They do not prove the source nilpotence premise.


### Linear residue of a parameter connection

**Node:** `HodgeStructuresPartII:H.0/h0-parameter-residue`. **Declaration:** `parameterResidue`. **Kind:** construction.

For t∈R, an additive d:R→Q and an additive D:E→E tensor_R Q satisfying D(ae)=aD(e)+t(e tensor d(a)), construct the unique R-linear map res_t(D):E/tE→(E tensor_R Q)/t(E tensor_R Q) sending [e] to [D(e)]. Here tM is the range of t times the identity linear map. Both quotient modules are naturally annihilated by t. When identified through the supplier tensor-quotient comparison, this is the linear zero-fiber field over R/(t).

**Hypotheses.** R is a commutative ring; E,Q are arbitrary R-modules. Only the displayed additive Leibniz equation is required for descent. No regularity of t, flatness of Q, filtration bounds or integrability premise is imposed. For a geometric relative parameter connection d is a derivation with d(t)=0. These additional conditions are needed by the flatness/exterior extension targets, not by the elementary linear residue map itself.

**Prerequisites.** `mathlib:Submodule.mkQ`, `mathlib:Submodule.mkQ_surjective`, `mathlib:Submodule.liftQ`, `mathlib:Submodule.Quotient.eq`, `HodgeStructuresPartII:H.0/intrinsic-preconnection`, `mathlib:Submodule.mapQ`.

**Proof route.**

1. Let T=E tensor Q and π:T→T/tT be the native module quotient. The composite πD is additive. Applying the Leibniz equation shows πD(ae)=aπD(e), because t(e tensor d(a)) is in tT; package πD as a genuine R-linear map.
2. Apply the same formula at a=t: D(te)=tD(e)+t(e tensor d(t)), so πD vanishes on tE even if d(t)≠0. Use Submodule.liftQ to descend the now-linear map.
3. The generator equation follows from liftQ. Surjectivity of mkQ gives uniqueness, and Submodule.Quotient.eq gives the comparison criterion for two D with the same parameter and differential. Linear f and f⊗u preserve multiplication-by-t images, so Submodule.mapQ constructs their quotient maps. The intertwining equation and the generator formula give naturality; quotient surjectivity proves equality on the whole module, as well as identity and composition compatibility.
4. The quotient field cannot be identified with a sheaf tensor of quotients by identifying global-section tensors. E1 supplies the actual quotient/base-change equivalence; exterior integrability requires its wedge compatibility and remains G5.

**Acceptance.**

- At t=0 it is the original linear field under the quotient-by-zero identification.
- At t=1 both quotients are zero and the residue is zero; this is not the ordinary t=1 connection fiber.
- For R=E=Q=Z, t=2 and D(e)=e tensor 1 with d=0, the residue is nonzero on the class of 1.

**Uses.**

- LZ17 Remark 3.2; routed PAPER-LIU-ZHU-17/H03: Separates the actual zero-fiber linear map from the period lattice and Tate comparison.
- HodgeStructuresPartII:H.0/rees-specialization: Provides the local quotient descent equation at the finite Rees zero fiber, while DD.1 owns the finite Rees carrier and its identifications.
- HodgeStructuresPartII:H.0/zero-fiber: Relates specialization of a nonzero parameter to the zero-parameter field; the t=1 quotient is zero and must not be mistaken for evaluating the family at 1.

**API.**

- `parameterResidue_mk` (simp): res_t(D)([e])=[D(e)] for the native module quotient projections.
- `parameterResidue_unique` (universal-property): Any R-linear map on E/tE satisfying the same generator equation is res_t(D).
- `parameterResidue_eq_iff` (extensionality): For fixed t,d and D,D′ with the displayed Leibniz equations, res_t(D)=res_t(D′) iff D(e)−D′(e) lies in t(E tensor Q) for every e.
- `parameterResidue_natural` (functoriality): For linear f:E→F and u:Q→P, write f̄:E/tE→F/tF and (f⊗u)̄:(E⊗Q)/t(E⊗Q)→(F⊗P)/t(F⊗P) for native Submodule.mapQ maps. Given parameter operators D,D′ with the same t and their displayed Leibniz equations, if D′(f(e))=(f⊗u)(D(e)) for every e, then res_t(D′)∘f̄=(f⊗u)̄∘res_t(D). Quotient-map identity and composition laws follow on generators.

**Unit tests.**

- `H0.parameterResidue.test_zero_parameter` (compatibility): At t=0, a native linear map D descends with exactly its generator values through the native zero-submodule quotients.
- `H0.parameterResidue.test_unit_parameter` (degenerate): At t=1 the parameterResidue linear map is zero for every D satisfying the displayed equation.
- `H0.parameterResidue.test_nonzero_residue` (computation): For Z, t=2, Q=E=Z, d=0 and D(e)=e tensor 1, the parameter residue is nonzero.

**Source match.** Definitions 3.5–3.6, printed pp.21–22; Remark 3.2, printed p.24. The source forms a t-connection on a period lattice and identifies its zero fiber. The elementary module quotient construction here isolates the linear residue without claiming the period-sheaf, exterior-curvature or Tate identification. It is an authored affine deduction of the parameter Leibniz equation.


## Stage closure ledger

Every H.0 target is accounted for below. Identifiers without the new h0- prefix are exact imported declarations from the accepted parent, rather than copies in this part. Their full definitions, API and tests remain in the parent reader and packet. Gap references are explicit endpoints of the plan; none asserts an available native carrier.

| Target | Declaration endpoints | Gaps |
| --- | --- | --- |
| Finite locally free lambda and Higgs carriers on a supplied differential site | `HodgeStructuresPartII:key/higgs-parameter-connections`; `HodgeStructuresPartII:H.0/intrinsic-preconnection`; `HodgeStructuresPartII:H.0/twisted-higgs` | G1, G2 |
| Extended exterior differential, intrinsic curvature and integrability | `HodgeStructuresPartII:H.0/extension-balancing`; `HodgeStructuresPartII:H.0/exterior-extension`; `HodgeStructuresPartII:H.0/intrinsic-curvature`; `HodgeStructuresPartII:H.0/curvature-linearity`; `HodgeStructuresPartII:H.0/flat-extension-square` | G2 |
| Horizontal maps, unit, tensor, dual and pullback | `HodgeStructuresPartII:H.0/connection-morphism`; `HodgeStructuresPartII:H.0/unit-connection`; `HodgeStructuresPartII:H.0/intrinsic-tensor`; `HodgeStructuresPartII:H.0/tensor-curvature`; `HodgeStructuresPartII:H.0/intrinsic-dual`; `HodgeStructuresPartII:H.0/dual-curvature`; `HodgeStructuresPartII:H.0/intrinsic-pullback`; `HodgeStructuresPartII:H.0/local-descent` | G1, G2 |
| Coordinate, gauge, zero/one and invertible-parameter comparisons | `HodgeStructuresPartII:H.0/coordinate-comparison`; `HodgeStructuresPartII:H.0/zero-fiber`; `HodgeStructuresPartII:H.0/ordinary-fiber`; `HodgeStructuresPartII:H.0/intrinsic-rescale`; `HodgeStructuresPartII:H.0/gauge-curvature` | G1, G2 |
| Ordered tensors and nilpotence filtration; augmentation equivalence | `HodgeStructuresPartII:H.0/ordered-iterate`; `HodgeStructuresPartII:H.0/nilpotence-filtration`; `HodgeStructuresPartII:H.0/nilpotence-equivalence`; `HodgeStructuresPartII:H.0/ordered-augmentation-nilpotence`; `HodgeStructuresPartII:H.0/truncated-symmetric-action` | G2, G6 |
| Integral tensor bound with arbitrary coefficients | `HodgeStructuresPartII:H.0/h0-tensor-valued-shuffle`; `HodgeStructuresPartII:H.0/h0-ordered-shuffle-expansion`; `HodgeStructuresPartII:H.0/h0-shuffle-term-vanishing`; `HodgeStructuresPartII:H.0/h0-arbitrary-coefficient-tensor-bound`; `HodgeStructuresPartII:H.0/tensor-nilpotence` | G2 |
| Dual and pullback specified nilpotence bounds | `HodgeStructuresPartII:H.0/dual-nilpotence`; `HodgeStructuresPartII:H.0/pullback-nilpotence`; `HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary`; `HodgeStructuresPartII:H.0/affine-base-change-bound-arbitrary-faithful` | G2 |
| Field/reduced finite-rank bounds and reduced line test | `HodgeStructuresPartII:H.0/h0-field-rank-bound`; `HodgeStructuresPartII:H.0/h0-reduced-free-rank-bound`; `HodgeStructuresPartII:H.0/reduced-line-nilpotence` | G2, G6 |
| Griffiths filtration, associated graded and finite Rees connection | `HodgeStructuresPartII:H.0/griffiths-filtration`; `HodgeStructuresPartII:H.0/graded-higgs`; `HodgeStructuresPartII:H.0/graded-higgs-integrable`; `HodgeStructuresPartII:H.0/rees-parameter`; `HodgeStructuresPartII:H.0/rees-specialization`; `HodgeStructuresPartII:H.0/h0-parameter-residue` | G2, G3 |
| Coordinate and global determinant, specified line and wedge pullback | `HodgeStructuresPartII:H.0/determinant-coordinate`; `HodgeStructuresPartII:H.0/determinant-alternating-operator`; `HodgeStructuresPartII:H.0/determinant-gauge`; `HodgeStructuresPartII:H.0/determinant-flat`; `HodgeStructuresPartII:H.0/determinant-tensor` | G2, G4 |
| Universal cross-ring exterior-power comparison | `HodgeStructuresPartII:H.0/intrinsic-pullback`; `HodgeStructuresPartII:H.0/affine-exterior-square` | G2, G4 |
| Tate twists, unbounded filtered period lattice and zero-fiber symbol | `HodgeStructuresPartII:H.0/twisted-higgs`; `HodgeStructuresPartII:H.0/graded-higgs`; `HodgeStructuresPartII:H.0/h0-parameter-residue` | G5 |
| Symmetric action and spectral image/coherence/twisting export | `HodgeStructuresPartII:H.0/higgs-commuting`; `HodgeStructuresPartII:H.0/symmetric-action`; `HodgeStructuresPartII:H.0/affine-symmetric-action` | G2, G7 |
| Native affine coordinate, scalar, tensor, monoidal pullback and dual coherence | `HodgeStructuresPartII:H.0/affine-ordered-iterate`; `HodgeStructuresPartII:H.0/affine-ordered-base-change`; `HodgeStructuresPartII:H.0/affine-ordered-iterate-base-change-comparison`; `HodgeStructuresPartII:H.0/affine-tensor-base-change`; `HodgeStructuresPartII:H.0/monoidal-pullback-monoidal`; `HodgeStructuresPartII:H.0/affine-monoidal-comparison-braided`; `HodgeStructuresPartII:H.0/dual-coherence-comparison-tower`; `HodgeStructuresPartII:H.0/dual-three-step-tripleequiv-coherence` | G2, G4 |

## Supplier contracts and exact remaining work

The four requests below are specification exports, not claims that their supplier packets already discharge the hypotheses. They point in the existing roadmap direction. Source-specific correspondence proofs are never used to define generic operator data.

### CrystallineCohomology:CR.1

Extend/export an ordinary integrable relative connection on any supplied commutative ringed differential site, with additive sheaf operator, exact section Leibniz equation, exterior extension and curvature; identify its lambda=1 maps with the parent carrier. The current CR.1/integrable-connection node covers affine differential quotients and the crystalline site, not this general site. Keep PD lifts and quasi-nilpotence only in crystal comparison theorems.

Needed by: `HodgeStructuresPartII:H.0/ordinary-fiber`, `HodgeStructuresPartII:H.0/intrinsic-preconnection`.

### EnhancedDerivedSheaves:E1

Supply underived tensor sheaves on the actual SheafOfModules carrier over a commutative ring sheaf, as sheafification of the presheaf tensor with its bilinear universal property; restriction-compatible tensor powers, dual/evaluation/coevaluation for finite locally free modules, symmetric/endomorphism/augmentation quotient sheaves, exterior powers and determinant lines with locally varying rank, pullback coherence, local equality detection and effective gluing. Include S tensor_R exteriorPower_R(n,Q) ≃ exteriorPower_S(n,S tensor_R Q), even for nonflat S and arbitrary Q, characterized on decomposable wedges; include the tensor-quotient comparison for res_t(D). Derived tensor is not substituted for these degree-zero operations.

Needed by: `HodgeStructuresPartII:H.0`, `HodgeStructuresPartII:H.0/h0-tensor-valued-shuffle`, `HodgeStructuresPartII:H.0/h0-reduced-free-rank-bound`, `HodgeStructuresPartII:H.0/h0-parameter-residue`.

### DerivedDeRhamCohomology:DD.1

Export a bounded locally split subbundle filtration on an ordinary finite locally free sheaf, its finite Rees sheaf over O[t] and actual fibers at t=0, t=1 and t inverted, with tensor/quotient compatibility and local freeness. The enhanced filtered derived carrier and derived t-cofiber do not by themselves give this underived carrier. Also export the generic unbounded filtered-module/associated-graded change-of-base interfaces needed for the LZ period lattice, without asserting boundedness or local splitting there.

Needed by: `HodgeStructuresPartII:H.0/griffiths-filtration`, `HodgeStructuresPartII:H.0/rees-parameter`, `HodgeStructuresPartII:H.0/rees-specialization`, `HodgeStructuresPartII:H.0/h0-parameter-residue`.

### ShimuraData:D3

Export the ordinary underlying filtered flat bundle and Griffiths equation of the common variation carrier, with complex/real/integral distinctions explicit. H.0 owns only the algebraic filtered-to-Higgs operation; H.2 owns geometric variation comparisons, so no variation carrier is reconstructed in H.0.

Needed by: `HodgeStructuresPartII:H.0/griffiths-filtration`, `HodgeStructuresPartII:H.0/graded-higgs`.

### G1: General-site ordinary-connection comparison

CR.1/integrable-connection explicitly covers affine quotient differential modules and crystalline sheaves. An exact supplier identifying the additive operator and all exterior extensions on arbitrary supplied differential sites is still required. No crystalline quasi-nilpotence is inserted into LambdaBundle. The affine lambda=1 equations already in the parent do not discharge this global comparison.

Needed by: `HodgeStructuresPartII:H.0/ordinary-fiber`.

### G2: Native underived sheaf tensor, exterior and descent contract

Transport the full linear-map shuffle equality and chartwise rank bounds through restriction-compatible sheaf tensor powers, their local bilinear generation and equality detection, then glue. Construct or import E1’s exact sheaf tensor/dual/exterior/determinant/symmetric-quotient interfaces and their pullback coherence. Presheaf tensorObj and the ordinary sheaf pullback are native, but a presheaf tensor object is not automatically a sheaf and tensoring global sections does not calculate sheaf tensor sections. All 36 parent omitted global signatures, their API and tests remain conditional on these actual carriers and G1/G3.

Needed by: `HodgeStructuresPartII:H.0/local-descent`, `HodgeStructuresPartII:H.0/tensor-nilpotence`, `HodgeStructuresPartII:H.0/h0-tensor-valued-shuffle`, `HodgeStructuresPartII:H.0/h0-reduced-free-rank-bound`.

### G3: Finite split Griffiths–Rees sheaf contract

DD.1 must give the finite locally split ordinary Rees module sheaf and the t=0, t=1 and t-inverted operator-compatible identifications, with finite locally free graded pieces and tensor/quotient coherence. Local weighted summands show the intended formulas, but the derived filtered/Rees equivalence does not alone supply those finite sheaf objects. res_t(D) isolates quotient linearity and does not supply any of these identifications.

Needed by: `HodgeStructuresPartII:H.0/rees-parameter`, `HodgeStructuresPartII:H.0/rees-specialization`.

### G4: Global determinant, specified determinant and universal wedge transport

Use the E1 top exterior power on each constant-rank chart, construct its lambda-connection by the alternating sum of D, and glue via the determinant gauge theorem, using the exact ColemanPowerSeries:L1/derivation-determinant-unit node for integral Jacobi. Prove arbitrary ring-change exterior-power comparison on decomposable wedges and its horizontal operator/exterior compatibility; then compare with a specified determinant line L and its prescribed lambda-connection through a horizontal isomorphism det(E)≃L. Trace zero is a special fixed-trivial-determinant convention, never a generic Higgs field condition. The actual globally varying rank determinant and the specified-line horizontal isomorphism still lack native signatures.

Needed by: `HodgeStructuresPartII:H.0/determinant-coordinate`, `HodgeStructuresPartII:H.0/determinant-gauge`, `HodgeStructuresPartII:H.0/intrinsic-pullback`.

### G5: Unbounded period-lattice, graded-base and Tate identification

For the LZ ringed space X+ with O_X completed tensor B_dR+, its localized X with t inverted and a finite locally free lattice E+, retain the decreasing filtration in the localized bundle with t^i Fil^j=Fil^{i+j}, with negative i interpreted in the localized carrier. For a relative flat B_dR-linear Griffiths connection, t times the connection preserves the lattice and res_t(D) is its linear residue. Identify this actual quotient with the graded filtered symbol and Ω¹_X(-1), preserving semilinear Galois/Tate characters and exterior curvature. Generic filtered algebra is requested from DD.1 and actual sheaf quotient tensor from E1; period sheaves, t/Tate identification and the source RH functor are imported from the named p-adic consumer’s foundations, with no reverse dependency on its correspondence. Exact graded-base/Tate adapter signatures and integrability transport remain a gap, rather than an invented bounded filtration or a chosen trivial Tate character.

Needed by: `HodgeStructuresPartII:H.0/twisted-higgs`, `HodgeStructuresPartII:H.0/graded-higgs`, `HodgeStructuresPartII:H.0/h0-parameter-residue`.

### G6: Sheaf nilpotence uniformity and locally varying rank

On a cover with bounds N_i, local ordered iterates glue to one global exponent only when one uniform N dominates every N_i; a finite subcover gives max_i N_i. On an infinite disjoint union with Jordan blocks of sizes tending to infinity there is local nilpotence and no finite global bound. The new rank bound holds on each reduced free chart; a global max(1,r) requires a globally bounded rank. Nilpotence kernels are subsheaves, and without extra hypotheses are not subbundles. Nonflat base change need not commute with images of the symmetric action.

Needed by: `HodgeStructuresPartII:H.0/ordered-iterate`, `HodgeStructuresPartII:H.0/nilpotence-filtration`, `HodgeStructuresPartII:H.0/h0-field-rank-bound`, `HodgeStructuresPartII:H.0/h0-reduced-free-rank-bound`.

### G7: Spectral image and coefficient-equivariant consumer adapter

The parent exact symmetric action imports the analytic instance of Heuer Definitions 1.2/2.1. Definition 4.1 additionally needs its actual coherent image algebra B_theta inside End(E), the canonical coefficient-valued section reconstructed using finite local duality, and restriction-compatible twisting by an invertible B_theta-module. Generic sheaf images and tensor operations stay E1 inputs; no coherence is deduced for an arbitrary ringed site. The p-adic spectral cover/Picard and twisting correspondence belong to PadicHodgeTheoryPartIIPadicSimpson, so H.0 exports the symmetric-action and coefficient-natural tensor data but does not depend on that consumer’s proof. Source-specific coherent/Tate comparison and nonflat image-change hypotheses remain explicit.

Needed by: `HodgeStructuresPartII:H.0/symmetric-action`, `HodgeStructuresPartII:H.0/twisted-higgs`.


## Intrinsic signature omissions and planets

The exact 36 parent targets below retain their mathematical specifications and inherited API/tests, but no global Lean signature is supplied until its native carriers and named comparison maps can be stated. The omission is not filled by a Prop-valued field, a module of global sections, or an affine replacement. G1–G3 give the principal carrier contracts; G4–G7 specify the determinant, period and uniformity refinements.

- `HodgeStructuresPartII:H.0/intrinsic-preconnection`
- `HodgeStructuresPartII:H.0/extension-balancing`
- `HodgeStructuresPartII:H.0/exterior-extension`
- `HodgeStructuresPartII:H.0/intrinsic-curvature`
- `HodgeStructuresPartII:H.0/curvature-linearity`
- `HodgeStructuresPartII:H.0/flat-extension-square`
- `HodgeStructuresPartII:key/higgs-parameter-connections`
- `HodgeStructuresPartII:H.0/connection-morphism`
- `HodgeStructuresPartII:H.0/unit-connection`
- `HodgeStructuresPartII:H.0/zero-fiber`
- `HodgeStructuresPartII:H.0/ordinary-fiber`
- `HodgeStructuresPartII:H.0/tensor-balancing`
- `HodgeStructuresPartII:H.0/intrinsic-tensor`
- `HodgeStructuresPartII:H.0/tensor-curvature`
- `HodgeStructuresPartII:H.0/intrinsic-dual`
- `HodgeStructuresPartII:H.0/dual-curvature`
- `HodgeStructuresPartII:H.0/intrinsic-pullback`
- `HodgeStructuresPartII:H.0/local-descent`
- `HodgeStructuresPartII:H.0/coordinate-comparison`
- `HodgeStructuresPartII:H.0/intrinsic-rescale`
- `HodgeStructuresPartII:H.0/twisted-higgs`
- `HodgeStructuresPartII:H.0/higgs-commuting`
- `HodgeStructuresPartII:H.0/symmetric-action`
- `HodgeStructuresPartII:H.0/ordered-iterate`
- `HodgeStructuresPartII:H.0/nilpotence-filtration`
- `HodgeStructuresPartII:H.0/nilpotence-equivalence`
- `HodgeStructuresPartII:H.0/tensor-nilpotence`
- `HodgeStructuresPartII:H.0/dual-nilpotence`
- `HodgeStructuresPartII:H.0/pullback-nilpotence`
- `HodgeStructuresPartII:H.0/reduced-line-nilpotence`
- `HodgeStructuresPartII:H.0/griffiths-filtration`
- `HodgeStructuresPartII:H.0/graded-higgs`
- `HodgeStructuresPartII:H.0/graded-higgs-integrable`
- `HodgeStructuresPartII:H.0/rees-parameter`
- `HodgeStructuresPartII:H.0/rees-specialization`
- `HodgeStructuresPartII:H.0/ordered-augmentation-nilpotence`

The six inherited H.0 planets remain the atlas display. This part adds no seventh planet and does not turn a counterexample or interface check into a planet.

| Planet | Exact parent node |
| --- | --- |
| Joint Higgs nilpotence | `HodgeStructuresPartII:H.0/joint-nilpotence` |
| Higgs and λ-connections | `HodgeStructuresPartII:key/higgs-parameter-connections` |
| Twisted Higgs bundles | `HodgeStructuresPartII:H.0/twisted-higgs` |
| Griffiths filtrations | `HodgeStructuresPartII:H.0/griffiths-filtration` |
| Graded Higgs field | `HodgeStructuresPartII:H.0/graded-higgs` |
| Rees parameter connection | `HodgeStructuresPartII:H.0/rees-parameter` |

## Validation boundary

The packet has seven new nodes (two constructions, one lemma and four theorems), thirteen API entries, eleven construction tests and thirty-eight individually inspected baseline declarations. The suggested file includes three additional theorem acceptance instances. There are seven explicit gaps and four supplier requests. H.0 coverage is planned, with its full remaining list; it is not closed. The other stages are outside the job scope.

The blueprint checker and exact-file Lean elaboration receipts are recorded in the handoff. Lean checks only the signatures with admitted bodies, including the two exact imported affine planning interfaces. It establishes no theorem proof, no sheaf comparison and no period correspondence. All new implementation statuses remain unchecked.
