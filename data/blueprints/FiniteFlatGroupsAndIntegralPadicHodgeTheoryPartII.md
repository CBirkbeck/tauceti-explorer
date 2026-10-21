# Finite flat group schemes and integral p-adic Hodge theory, Part II

This continuation develops integral tensor structures on displays, the corrected adapted deformation theorem, and explicit ordinary lifts. Its endpoint is a lift carrying the entire rational σ-centralizer action in the isogeny category. The base roadmap owns finite flat groups, p-divisible groups, the field Dieudonné classification, height-one Breuil–Kisin modules and their integral crystalline comparisons. This roadmap begins with the additional display and tensor structures those theories need. Every assertion here is a mathematical target, with implementation status unchecked.

The ten routed briefs divide into three independent developments. The six tensor briefs contribute 179 routed items and are reconciled here. The 33 Lubin–Tate/quasi-canonical items and 153 divisible-module-period items remain assigned, by their original item IDs, to the two continuations proposed in the packet’s restructuring ledger. Those proposals preserve their full original briefs as the design inputs. They are not discarded targets of an allegedly completed period theory.

## Conventions and ownership

Throughout p>2. TD.0–TD.1 allow a perfect residue field k of characteristic p; TD.2–TD.4 and TD.6 use k=F̄_p. TD.5 states its perfect, separably closed or finite-residue hypotheses explicitly. W=W(k), K₀=W[1/p], and K/K₀ is finite totally ramified unless a finite residue extension is displayed. E is a reflex field, Ĕ its completed maximal unramified base with residue k, and π_E its uniformizer. All complete-local maps are continuous local maps over the stated coefficient ring.

D(H) is contravariant. For a p-divisible group of height h and dimension d its Hodge submodule Fil¹ has rank d; D(Q_p/Z_p) has F=σ and D(μ_{p∞}) has F=pσ. The linear dual Tate lattice is L=Hom_Zp(T_pH,Z_p)=T_p(H*)⊗Z_p(−1). Cartier duality gives D(H*)=D(H)∨(−1). When μ_y induces the weight-(0,1) filtration, the local-model convention is μ_y⁻¹. In the hyperspecial notation μ₀ is the inverse Hodge cocharacter and υ₀=σ(μ₀⁻¹). Hoff’s weight-(0,−1) convention is translated before a comparison is used.

Write G for the connected reductive generic group. Gscr=G̃ denotes the smooth full integral fixer cut out scheme-theoretically by the chosen mixed tensors. Gscr° is its connected parahoric. These groups cannot be interchanged in tensor torsors. The generic-neutral schematic closure used in TD.3/neutral-closure is a separate smooth closure, with its own stated hypotheses. For Hoff’s parahoric display and for the ordinary construction require Gscr=Gscr°. A cutting family means equality of group functors on all coefficient algebras, rather than equality on geometric points. Mixed tensors include both covariant and dual factors; their transport uses inverse dual maps.

The three coefficient rings have different roles. 𝔖=W[[u]] is the Eisenstein Breuil–Kisin ring with φ(u)=uᵖ; S is its imported completed PD evaluation ring; Ŵ(R) is the Zink coefficient ring of a complete-local base. An elementary modification modulo E(u), a tilde module over a frame, and the image in φ*M coincide only through the stated comparison. In particular the map diag(1,p) need not be injective on a torsion base. The first-order quotient of a local model is R_G/(m_G²+π_E R_G), and c must be base-changed on both sides to that same ring.

This plan checked the reviewed audit: there is no audit entry for this new continuation. The base roadmap’s accepted plan and package were read. At the pinned Mathlib and Tau Ceti commits, Witt-vector operations and divided powers exist; integral displays and the tensor deformation theory were not found. The baseline below lists only declarations whose statements were read. Current upstream main and the current Tau Ceti source tree were also checked. In particular current ReductiveGroups Part II already owns the classical algebraic lattice constructions, and AlgebraicVectorBundles owns the general vector-bundle direction. Their work is imported. The nine newer upstream roadmaps were screened; no display or tensor-deformation development was found there.

The current base R07.4/bk-integral-comparisons supplies the contravariant height-one equivalence and its integral φ*𝔐/u, φ*𝔐/E and PD comparisons. R07.4/bms-kisin-functor supplies a fully faithful tensor functor, with whole-ring nonexactness retained. R07.2 supplies smooth-base de Jong theory. CR.0/fontaine-envelope supplies the actual period carrier; CR.7’s fine evaluation and variance nodes supply its crystal interfaces. General Grassmannians, formal completions, descent and Hartogs remain with SchemeAndStackFoundations. Current RG2.3 supplies fixers and lattice chains; BunG’s fine ordinary and σ-centralizer targets supply the Newton theory. The requests below name the exact statements still required from these suppliers. An unregistered routed roadmap name is never used as a prerequisite.

The local-model ring is always taken from a supplied geometric datum. Normality, flatness and generic regularity are hypotheses of that datum until G1 is supplied; they are not inferred from smoothness of Gscr. Likewise an integral pointwise tensor comparison, representability of its isomorphism scheme, flatness of that scheme, and triviality of its torsor are four different assertions. G2–G4 keep their supplier obligations visible.

## Layer sequence and implementation shape

TD.0 constructs invariant frame algebra. TD.1 uses it for canonical transport and universality. TD.2 puts tensor structures on these objects. TD.3 proves the corrected very-good criteria and the allowed existence cases. TD.4 proves the adapted deformation and integral recognition theorems. TD.5 isolates the hyperspecial, period-comparison and lattice-specialization interfaces. TD.6 performs the explicit ordinary construction and states precisely what it exports to a Levi application.

The suggested file follows the fixed upstream shape: light definitions on existing carriers, terminal statements expressible there, and a few mathematical examples. Heavy display, group-torsor, local-model and p-divisible carriers remain targets in this document. No claim of formalization follows from elaboration of that small native-carrier fragment. The fragment tests the first-order ideal, the two-block scaling phenomenon and tensor-family transport; it does not replace the planned definitions with propositions having missing data.

## Worked checks

For a rank-two normal pair M=Se₁⊕Se₂ with M₁=Se₁⊕Ie₂, a preserving map has lower-left entry in I. Its tilde matrix scales the upper-right Frobenius entry by p and divides the lower-left through φ₁. Over D_{k[ε]}, a graph coordinate Z=Vε produces c with lower-left ε. Reducing the comparison diag(1,p) modulo p erases that direction. This simultaneously tests the four-block formula, the canonical construction of c, and the need for very-goodness before prescribing a tensor section.

For H₀=μ_{p∞}⊕Q_p/Z_p, the contravariant module has one slope1 and one slope0 direction. Fil¹ is its multiplicative line. The elementary Eisenstein lattice is 𝔖e₁⊕E𝔖e₂ in this order. The diagonal Newton Levi preserves this filtration, so its central ordinary modification gives an adapted lift. A scalar p in J_b(Q_p) acts by a self-quasi-isogeny of the lift and cannot act as an integral unit automorphism. These tests detect a reversed Hodge rank, a missing Tate dual twist, and an overstrong automorphism claim.

For the hyperspecial rank-one lattice of G_m, a Tate-lattice change by p specializes to a crystal-lattice coset of valuation1. Its Kottwitz invariant is1 on both sides. Requiring the specializing matrix to lie in G(W) would force valuation0 and contradict this example. For GL₂, an arbitrary change of the bounded Frobenius representative can move the Hodge line; a simultaneous framing by a separately fixed μ-line must be checked, not inferred from the double coset.

For a ramified reflex field, π_E can annihilate a first-order direction that p alone does not. Thus TD.1 constructs c modulo m²+pR and then reduces both modules and tensors modulo m²+π_ER. A formula that compares the two sides over different quotients fails this base-ring check even when its special-fibre matrix happens to agree.


## TD.0. Frames and contravariant displays

Starting with pinned Witt vectors and divided powers, construct the Zink ring, relative logarithmic PD frames and the normal-pair tilde functor with matrix [[φA,pφB],[φ₁C,φD]]. Keep its map diag(1,p) to φ*M separate from its image in torsion rings. Define contravariant displays and base change, establish the complete-local p-divisible anti-equivalence and perfect-ring finite-projective Dieudonné comparison, and export the height-one GL-shtuka interface.


### zink-ring — Zink coefficient ring

**Definition.** For a complete Noetherian local ring R with perfect residue field k of characteristic p>2, use the canonical Frobenius-stable subring Ŵ(R) of W(R) whose reduction to W(k) is surjective and whose kernel consists of Witt coordinates tending to zero in the maximal-ideal topology. Its canonical additive splitting is W(k) ⊕ Ŵ(m_R); this does not assume a ring section k→R. Put Î_R=ker(w₀:Ŵ(R)→R). Frobenius and Verschiebung restrict and V:Ŵ(R)→Î_R is an additive bijection.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/zink-ring.

**Direct prerequisites:** mathlib:WittVector; mathlib:WittVector.frobenius; mathlib:WittVector.verschiebung.

**Construction or proof.** Construct first on Artin quotients, identify the decaying-coordinate kernel and pass to the inverse limit. Prove closure under Witt operations and compatibility with the canonical W(k) lift; use the restricted Witt identities, rather than coordinatewise multiplication.

**API.**

- ZinkRing.include (coercion): The inclusion into W(R) is an injective ring homomorphism.
- ZinkRing.reduction (projection): Reduction to W(k) has decaying-coordinate kernel and commutes with φ and V.
- ZinkRing.inverseLimit (equivalence): Ŵ(R) identifies with the inverse limit of Ŵ(R/m_Rⁿ).
- ZinkRing.inverseV (characterisation): V inverse on Î_R is additive and φ-semilinear; φ(a)=p V⁻¹(a) on Î_R.

**Unit tests.**

- perfectField (compatibility): For R=k, Ŵ(R)=W(k), Î_R=VW(k).
- decay (non-example): A Witt vector with every coordinate the same nonzero nilpotent ε over k[ε]/ε² is excluded, whereas one with finitely many ε coordinates is allowed.
- mixedCharacteristic (computation): R=W(k) is permitted although no characteristic-p ring section k→R exists.

**Uses.** TD.0/display: The coefficient ring must support V inverse.; TD.1/connection-comparison: The inverse-limit construction controls square-zero reductions.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.1, pp.47–48.

**Atlas planet:** Zink ring.


### frame — Display frame

**Definition.** A p-frame in this roadmap is (S,I,φ,φ₁), with S a commutative ring, I an ideal, I+pS⊂Jac(S), φ:S→S lifting p-power Frobenius modulo p, and a φ-semilinear additive map φ₁:I→S whose image generates S and with φ|I=pφ₁. A strict map carries I into I′ and commutes with φ and φ₁. This is the θ=p class of frames; nonstrict crystalline/Breuil frame morphisms are not included in its base-change theorem.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/frame.

**Direct prerequisites:** mathlib:DividedPowers; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/zink-ring.

**Construction or proof.** Package the listed axioms and strict morphisms; check composition and identity directly. Construct the Dieudonné–Witt instance using the preceding ring, and the power-series instance separately.

**API.**

- Frame.ofWitt (constructor): D_R=(Ŵ(R),Î_R,φ,V⁻¹) is a p-frame.
- Frame.strictMap (structure): Strict maps form a category and induce maps on residue rings S/I.
- Frame.frobeniusOnIdeal (simp): For a∈I, φ(a)=pφ₁(a).
- Frame.powerSeries (constructor): For W(k)[[u]], I=(p), φ(u)=uᵖ and φ₁(pa)=φ(a), obtain a p-frame.
- Frame.ext (extensionality): On a fixed ring S and ideal I, two p-frame structures with the same φ and φ₁ are equal; equality of their axiom proofs is irrelevant.

**Unit tests.**

- witt (computation): D_k has I=VW(k) and φ₁(Vx)=x.
- powerSeries (computation): φ₁(pu)=uᵖ, not puᵖ.
- nonstrict (non-example): A map multiplying divided Frobenius by a unit other than 1 is excluded from strict morphisms.

**Uses.** TD.0/tilde-functor: The lower-left block uses φ₁.; TD.3/arithmetic-criterion: Keeps strict and nonstrict comparison arguments distinct.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.1.1–5.1.2, pp.47–49.

**Atlas planet:** Display frames.


### perfect-dieudonne — Dieudonné modules over perfect rings

**Comparison.** For a perfect F_p-algebra R, contravariant Dieudonné theory is an anti-equivalence between p-divisible groups over Spec R and finite projective W(R)-modules M with σ-linear F and σ⁻¹-linear V satisfying FV=VF=p. Equivalently the linearization β:σ*M→M obeys pM⊂β(σ*M)⊂M and becomes an isomorphism after inverting p. Height is locally constant; do not impose a global basis or confuse perfect with a general reduced smooth base.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/perfect-dieudonne.

**Direct prerequisites:** mathlib:WittVector; mathlib:WittVector.frobenius; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible.

**Construction or proof.** Lemma2.4 identifies the finite-projective Dieudonné and display categories over perfect rings; Gabber’s theorem gives the group. Apply Cartier duality for our convention. Prove local projectivity of the F/V quotients, rather than adding a freeness assumption.

**Check.** Recover the perfect-field base theorem, permit disconnected perfect rings of locally varying rank, and export the induced GL-shtuka β with its height-one bound.

**Sources.** Lau14, Lemma2.4, p.2216 and Theorem5.3, p.2243; vanHoften24, Example2.2.10, p.14.


### pd-logarithm — Logarithmic Witt coordinates on a PD kernel

**Construction.** For a surjective Artin local map B→R with perfect residue k and nilpotent PD kernel b compatible with the canonical p-divided powers, construct the logarithmic copy [b] in ker(Ŵ(B)→R) and the additive decomposition Î_{B/R}=Î_B⊕[b]. In these coordinates the extension of the divided Frobenius is V⁻¹ on Î_B and zero on [b]. The bracket here denotes PD logarithmic coordinates, not a multiplicative Teichmüller section.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/pd-logarithm.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/zink-ring; mathlib:DividedPowers.

**Construction or proof.** Use the PD Witt logarithm for nilpotent divided powers; check the formula on finite-coordinate vectors and then the Artin limit. Verify φ=pφ₁, including φ([b])=0 for this relative frame.

**API.**

- PdLogarithm.split (equivalence): Every element of Î_{B/R} has a unique sum i+[x], with i∈Î_B and x∈b.
- PdLogarithm.dividedFrobenius (data): The extended φ₁(i+[x]) is V⁻¹(i).
- PdLogarithm.map (functoriality): Compatible PD maps preserve the splitting and φ₁.

**Unit tests.**

- zeroKernel (degenerate): For b=0 one recovers Î_B and V⁻¹.
- squareZero (computation): For B=k[ε]/ε²→k with trivial higher PD operations, the logarithmic ε direction is killed by φ₁.
- notTeichmuller (characterisation): For x,y∈b, [x+y]_log=[x]_log+[y]_log and [0]_log=0 in Î_{B/R}; the brackets use logarithmic coordinates, not Teichmüller representatives.

**Uses.** TD.0/relative-frame: Extends the divided Frobenius.; TD.1/connection-comparison: Supplies the square-zero comparison independently of a noninjective matrix.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.1.1(b), p.48; Hoff23, Lemma1.21, p.13.


### normal-pair — Normal-decomposable frame pair

**Definition.** Over a p-frame let M be finite free and M₁⊂M satisfy IM⊂M₁ with M=L⊕T and M₁=L⊕IT for finite free summands of specified ranks d and h−d. Morphisms are S-linear maps preserving M₁. Existence of such a normal decomposition is a property; a selected decomposition is a coordinate witness, not invariant data. Record M/M₁ as a free S/I-module of rank h−d.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/normal-pair.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/frame.

**Construction or proof.** Construct coordinate witnesses from a split filtration modulo I, and prove two witnesses describe the same pair category. A preserving map has lower-left block in I.

**API.**

- NormalPair.ofFiltration (constructor): The inverse image of a rank-d direct summand of M/IM is a pair when a normal splitting exists.
- NormalPair.quotientRank (projection): M/M₁ is finite free over S/I of rank h−d.
- NormalPair.mapBlocks (characterisation): In normal coordinates a preserving map has blocks A,B,C,D with C having entries in I.
- NormalPair.changeSplitting (equivalence): Changing the normal decomposition induces the identity on the underlying pair.
- NormalPair.hom_ext (extensionality): Two morphisms of fixed normal pairs are equal if their underlying S-linear maps on M agree; preserving the distinguished submodule is a property.

**Unit tests.**

- zeroWeight (degenerate): d=0 gives M₁=IM, not zero.
- fullWeight (degenerate): d=h gives M₁=M.
- forbiddenBlock (non-example): For M=S² and M₁=Se₁⊕Ie₂, a map e₁↦e₂ is excluded when 1∉I.

**Uses.** TD.0/tilde-functor: Provides the normal block formula.; TD.1/universal-filtered-pair: Constructs the pair from the universal Grassmannian filtration.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.1.2, pp.48–49.

**Atlas planet:** Normal pairs.


### height-one-shtuka — Perfect-ring height-one shtuka comparison

**Comparison.** Over a perfect F̄_p-algebra R, a finite projective W(R)-module M with F:σ*M→M satisfying pM⊂F(σ*M)⊂M determines V uniquely with FV=VF=p, and conversely. The resulting anti-equivalence with p-divisible groups is the perfect-ring theorem already planned here. This is the height-one local GL_n-shtuka interface; the general local-shtuka moduli problem remains with its owner.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/height-one-shtuka.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/perfect-dieudonne; mathlib:WittVector; mathlib:WittVector.frobenius.

**Construction or proof.** Use that W(R) is p-torsion-free for perfect R and that σ is invertible. Define V=F⁻¹p on the rational module and use the height bound for its integral image, with the correct semilinearity. Invoke the existing perfect-ring anti-equivalence.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** vanHoften24, Example2.2.10, p.14; Zhu17, §3.2 and proof of Proposition3.11, pp.461–463.


### tilde-functor — Invariant tilde module

**Construction.** Construct τ_F(M,M₁), denoted M̃₁, as a finite free S-module functorial in a normal pair. In normal coordinates it is φ*L⊕φ*T. On a preserving map [[A,B],[C,D]] its matrix is [[φ(A),pφ(B)],[φ₁(C),φ(D)]]. This formula descends through changes of normal decomposition, so the functor does not retain a chosen splitting.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-functor.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/normal-pair.

**Construction or proof.** Check composition using φ(C)=pφ₁(C) and semilinearity; coordinate changes therefore give coherent isomorphisms. Glue the coordinate constructions to the pair category. This computation is a proof step, not a second planned matrix theory.

**API.**

- TildeFunctor.normalForm (characterisation): Normal coordinates identify τ with φ*L⊕φ*T.
- TildeFunctor.map (functoriality): The displayed four-block formula preserves identities and composition.
- TildeFunctor.changeNormalForm (compatibility): Coordinate changes induce coherent natural isomorphisms, independent of intermediate choices.
- TildeFunctor.rank (simp): rank τ equals rank M.

**Unit tests.**

- upperRight (computation): A map with only upper-right entry b gives pφ(b) there; omitting p fails.
- lowerLeft (computation): A lower-left entry Vx over D_R is sent to x, not φ(Vx).
- torsionBase (non-example): Over a characteristic-p coefficient quotient, τ remains free even when its comparison to φ*M has kernel.

**Uses.** TD.0/display: Ψ has domain τ.; TD.2/tilde-tensor-torsor: Tensors must lie in this integral lattice.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.1.2, (5.1.3), pp.48–49.

**Atlas planet:** Tilde functor.


### relative-frame — Relative Dieudonné–Witt frame

**Construction.** For an Artin local PD surjection B→R as in the logarithmic Witt construction, put D_{B/R}=(Ŵ(B),Î_{B/R},φ,φ₁), with φ₁(i+[x])=V⁻¹(i). There are strict frame maps D_B→D_{B/R}→D_R. Extend to continuous complete local PD thickenings by compatible Artin quotients when the kernel topology and divided powers satisfy Hoff Notation1.19.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/relative-frame.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/frame; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/pd-logarithm.

**Construction or proof.** Verify the frame axioms in logarithmic coordinates. Establish continuity and inverse-limit compatibility before using complete rings.

**API.**

- RelativeFrame.ofPDThickening (constructor): A compatible nilpotent PD thickening produces the relative frame.
- RelativeFrame.fromAbsolute (data): D_B→D_{B/R} is strict with underlying identity on Ŵ(B).
- RelativeFrame.toQuotient (data): D_{B/R}→D_R is strict and functorial in PD diagrams.

**Unit tests.**

- identity (degenerate): B=R gives the absolute frame.
- relativeEpsilon (computation): For k[ε]→k, φ₁ kills the logarithmic ε summand.
- pdCompatibility (non-example): An arbitrary kernel without compatible divided powers supplies no relative frame by this construction.

**Uses.** TD.1/relative-comparison: Enlarging the frame ideal factors τ.; TD.1/display-deformations: Crystalline descent is along the relative frame.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.1.1(b), p.48; Hoff23, Notation1.19–Lemma1.21, pp.13–14.


### tilde-base-change — Strict base change of tilde modules

**Theorem.** For every strict p-frame map F→F′ and normal pair P, the canonical map τ_F(P)⊗_S S′→τ_{F′}(P⊗_S S′) is an isomorphism natural in P and compatible with successive strict maps and normal-coordinate changes. The induced pair uses the extended filtration, not an unsupported injection M₁⊗S′⊂M⊗S′.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-base-change.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-functor.

**Construction or proof.** In normal coordinates both sides are φ′*L′⊕φ′*T′; strictness identifies all four blocks. Check cocycles before removing the coordinates.

**Check.** Verify the comparison for a nonflat quotient and a two-step base change. Do not use this theorem for a nonstrict Breuil frame map.

**Sources.** KPZ26, (5.1.4), p.49.


### tilde-frobenius-map — Comparison with Frobenius pullback

**Construction.** There is a natural S-linear map j:M̃₁→φ*M, represented in normal coordinates by diag(1,p). After inverting p it is an isomorphism. If S is p-torsion-free, j is injective and its image is the image of φ*M₁→φ*M. Without that hypothesis retain j as a map; do not identify its domain with its image.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-frobenius-map.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-functor.

**Construction or proof.** Check compatibility with the four-block functor formula. The normal form proves the injection and image statement precisely under p-torsion-freeness.

**API.**

- TildeFrobeniusMap.toFrobenius (data): j has normal matrix diag(1,p).
- TildeFrobeniusMap.invertP (equivalence): j[1/p] is an isomorphism.
- TildeFrobeniusMap.image (characterisation): For p-torsion-free S, image(j)=image(φ*M₁→φ*M).

**Unit tests.**

- weightZero (degenerate): For d=0, j is multiplication by p on φ*M.
- weightOne (degenerate): For d=h, j is the identity.
- torsionKernel (non-example): For S=F_p and d=0, j=0 although τ is nonzero; injectivity cannot survive this quotient.

**Uses.** TD.2/horizontal-tensors: Defines rational tilde tensors.; TD.1/connection-comparison: Shows why its commutative square is not a uniqueness principle.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.1.7, p.49.


### display — Contravariant Dieudonné display

**Definition.** A display over D_R is a normal pair (M,M₁) with an isomorphism Ψ:M̃₁→M. Equivalently it has φ-semilinear Φ:M→M and Φ₁:M₁→M with Φ₁(ax)=φ₁(a)Φ(x), Φ|M₁=pΦ₁ and images of Φ₁ generating M. Use the contravariant normalization D(H); rank M is the height of H and rank(M₁/Î_R M) is dim H. Keep this normalization in duality and Hodge cocharacters.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-functor; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-frobenius-map.

**Construction or proof.** Use a normal decomposition to recover Φ and Φ₁ from Ψ and conversely; show these constructions commute with change of normal decomposition. They do not require an injective j after torsion base change.

**API.**

- Display.ofPsi (constructor): An invertible Ψ on τ determines the display maps.
- Display.psiEquivalence (equivalence): The Ψ and divided-Frobenius descriptions are equivalent.
- Display.morphism (characterisation): A pair map is a display map exactly when it commutes with Ψ after τ.
- Display.dual (structure): The Cartier-dual display uses the contravariant normalization and the standard Tate pairing.
- Display.hom_iff (characterisation): A map of underlying normal pairs is a display morphism exactly when its induced tilde map commutes with Ψ. An invertible such pair map is a display isomorphism.

**Unit tests.**

- etale (compatibility): For Q_p/Z_p over k, Φ=σ and M₁=pM.
- multiplicative (compatibility): For μ_{p∞}, Φ=pσ and M₁=M.
- heightDimension (computation): The ordinary height-two example has rank M=2 and rank(M₁/ÎM)=1; swapping the two ranks changes dim H.

**Uses.** TD.1/universal-display: Ψ is lifted with fixed first-order value.; TD.4/versal-adapted: Produces the p-divisible deformation.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Hoff23, Definition1.10, p.10; Theorem1.29 and Remark1.30, pp.15–16.

**Atlas planet:** Dieudonné displays.


### display-base-change — Base change of displays

**Construction.** A strict frame map sends (M,M₁,Ψ) to the base-changed pair and Ψ′ obtained using the inverse strict base-change isomorphism for τ. This is functorial on display morphisms and preserves the residual marking. For R→R′ complete local maps inducing perfect residue-field maps, apply the induced strict Zink frame map.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display-base-change.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-base-change.

**Construction or proof.** Transport Ψ by the canonical τ comparison. Identity and composition follow from its cocycle; quotient maps need no flatness.

**API.**

- DisplayBaseChange.map (functoriality): A strict map gives a functor on displays.
- DisplayBaseChange.residue (projection): Reduction to k gives the marked residual display.
- DisplayBaseChange.compose (compatibility): Two successive base changes agree by the canonical τ isomorphism.

**Unit tests.**

- identity (degenerate): Identity base change preserves the given Ψ.
- nonflat (computation): Reduction R→R/m² is allowed and retains a free tilde module.
- doubleQuotient (compatibility): Reduction through R/m³→R/m² agrees with direct reduction.

**Uses.** TD.1/constant-first-order: Reduces Ψ on both sides of c.; TD.2/adapted-deformation: Tests the DVR deformation against its special fibre.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Hoff23, §1.1, pp.8–10; KPZ26, §5.1.19, p.52.


### display-classification — Displays and p-divisible groups

**Comparison.** For a complete Noetherian local ring R with perfect residue field of characteristic p>2, the contravariant Dieudonné display functor H↦D̂(H) is an anti-equivalence between p-divisible groups over R and Dieudonné displays over D_R. It is compatible with Cartier duality, residue reduction, and the crystalline D(H) over a perfect field. This is an extension of the base roadmap’s field Dieudonné classification, not a second definition of p-divisible groups.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display-classification.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display-base-change; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible; CrystallineCohomology:CR.7/dieudonne-evaluation.

**Construction or proof.** Use Lau’s equivalence over admissible topological rings, then Cartier duality to change from the source covariant normalization. Compare perfect-field evaluations to the imported D(H).

**Check.** Check Q_p/Z_p and μ_{p∞}, including which module is Fil¹; identify arrows contravariantly, not merely object isomorphism classes.

**Sources.** Hoff23, Theorem1.29 and Remark1.30, pp.15–16; Lau14, Corollaries5.5–5.6, p.2244.


## TD.1. Canonical first-order transport and universal displays

Construct c through relative-frame factorization for a=m²+pR, and base change both sides to m²+π_ER in local-model applications. Define first-order constancy by Ψ̄c=Ψ₀. Construct the Grassmannian filtration pair, prove universality of the chosen display and crystalline deformation comparison, and construct the canonical rational Frobenius section using the corrected p-adic lattice topology.


### universal-filtered-pair — Universal marked filtration pair

**Construction.** Let H₀/k have height h and dimension d and choose a residual frame M₀≅Λ⊗W(k). Over a complete DVR O_F with perfect residue k, let R_GL be the completed local ring of Gr(d,Λ)_{O_F} at its residual Hodge point. Set M=Λ⊗Ŵ(R_GL) and let M₁ be the inverse image of the universal rank-d summand. This is a normal pair and represents marked filtration lifts in the chosen module frame; R_GL is noncanonically O_F[[t₁,…,t_{d(h−d)}]].

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/universal-filtered-pair.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/normal-pair; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/zink-ring; SchemeAndStackFoundations:SF.4.

**Construction or proof.** Import the Grassmannian universal summand and its formal completion; the complete-local splitting lifts the residual normal basis. Prove the stated functorial description of its points.

**API.**

- UniversalFilteredPair.universalPair (constructor): Pulling back its pair gives the prescribed filtration.
- UniversalFilteredPair.classify (universal-property): Marked filtration lifts correspond to continuous local maps from R_GL.
- UniversalFilteredPair.dimension (characterisation): The relative tangent space is Hom_k(Fil¹,M₀,k/Fil¹), of dimension d(h−d).

**Unit tests.**

- heightOne (degenerate): For h=1,d=0 or1, the parameter ring is O_F.
- ordinaryTwo (computation): For h=2,d=1, the ring is a one-variable formal power-series ring.
- rankConvention (characterisation): A rank-d filtration gives dim H=d, not h−d.

**Uses.** TD.1/universal-display: Supports the universal Ψ.; TD.2/orbit-deformation-ring: Supplies the ambient ring and quotient map.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Hoff23, Construction1.27, p.15; KP18, §3.1.8, pp.165–166.

**Atlas planet:** Universal filtration.


### relative-comparison — Tilde factorization through an enlarged frame ideal

**Construction.** For frames on the same S with I⊂I′ and φ₁′ extending φ₁, a normal pair P has an induced I′-pair P′, and there is a canonical natural isomorphism τ_F(P)≅τ_{F′}(P′). In the relative PD situation this factors the tilde functor through the relative pair, rather than through the image inside φ*M.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/relative-comparison.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/relative-frame; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-functor.

**Construction or proof.** Extend a normal decomposition and compare the four blocks. Prove transitivity for I⊂I′⊂I″. Apply this to the relative frame before reducing to the residue frame.

**API.**

- RelativeComparison.factor (equivalence): The induced pair and τ isomorphism are functorial.
- RelativeComparison.sameRing (characterisation): The comparison has underlying coefficient-ring identity.
- RelativeComparison.transitive (compatibility): Successive ideal enlargements give the direct comparison.

**Unit tests.**

- equalIdeal (degenerate): I=I′ gives identity.
- epsilon (computation): D_{k[ε]}→D_{k[ε]/k} forgets the first-order filtration direction before τ.
- threeIdeals (compatibility): The comparison for a three-ideal chain is independent of the intermediate ideal.

**Uses.** TD.1/connection-comparison: Constructs the canonical first-order transport.; TD.1/display-deformations: Supplies the relative linear algebra.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.1.8–Lemma5.1.9, p.50.


### connection-comparison — Canonical first-order comparison

**Construction.** Fix a pair over D_R and a trivialization M≅M₀⊗_{W(k)}Ŵ(R) lifting its residual identity. Put a=m_R²+pR. Relative-frame factorization followed by strict base change defines c: M̃_{0,1}⊗_{W(k)}Ŵ(R/a)≅M̃₁⊗_{Ŵ(R)}Ŵ(R/a). It is natural for maps preserving the trivialization. In adapted bases c=[[1,0],[V⁻¹(Z̄),1]]. It makes the Frobenius comparison square commute, but that square does not uniquely determine it.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/connection-comparison.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/relative-comparison; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-base-change; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-frobenius-map.

**Construction or proof.** Use I′=ker(Ŵ(R/a)→W(k)→k) and the chosen residual-module trivialization; construct c via the split relative frame. Compute the lower-unipotent formula only after constructing it invariantly. Check the base rings on both sides of every comparison.

**API.**

- ConnectionComparison.canonical (data): The specified frame/trivialization data produce c without a choice of horizontal inverse.
- ConnectionComparison.matrix (characterisation): An adapted graph matrix Z yields lower-left V⁻¹(Z̄).
- ConnectionComparison.naturality (functoriality): Compatible marked local maps pull c back to c′.
- ConnectionComparison.furtherQuotient (compatibility): For a⊂b, c base changes to an isomorphism over Ŵ(R/b).

**Unit tests.**

- constantPair (degenerate): For the constant pair in the constant trivialization, c is identity.
- epsilonGraph (computation): For a rank-one graph direction Z=Vε, c has lower-left ε; identity transport would fail.
- squareNotUnique (non-example): After a p-torsion quotient diag(1,p) has kernel, so a commuting square alone cannot select the lower-left block.

**Uses.** TD.2/very-good: Tests tensor horizontality.; TD.1/constant-first-order: Defines constancy of Ψ correctly.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, Lemma5.1.11, Lemma5.1.15, Remark5.1.17 and (5.1.18), pp.50–52.

**Atlas planet:** Canonical first-order comparison.


### rational-section — Canonical rational Witt section

**Construction.** For a complete local p-torsion-free W(k)-algebra A with m_Aᴺ⊂pA for some N, and a marked display deformation, construct the unique Frobenius-equivariant rational section D(H₀)[1/p]→M_A[1/p] reducing to the residual identity. Convergence is measured using the lattice neighborhoods pⁿŴ(A) inside the localization, as corrected in KPZ26; do not use a topology defined by powers of the unit ideal (p) in Ŵ(A)[1/p]. Its specialization to A=O_K yields the filtered K-vector-space identification.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/rational-section.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/zink-ring; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons.

**Construction or proof.** Iterate Frobenius on the maximal-ideal error and use decaying Witt logarithmic coordinates to obtain p-adic lattice convergence for p>2. Uniqueness follows by the same contraction. Identify the evaluation through the Breuil PD comparison, not by equating S and Ŵ(O_K).

**API.**

- RationalSection.section (data): The rational map is φ-equivariant and lifts the identity.
- RationalSection.unique (characterisation): These conditions determine the section under the contraction hypotheses.
- RationalSection.dvrEvaluation (compatibility): Evaluation to K agrees with the filtered crystalline comparison of H/O_K.

**Unit tests.**

- constant (degenerate): For a constant display the section is the constant embedding.
- topology (non-example): Inverting p does not make lattice neighborhoods pⁿŴ(A) equal to the whole underlying additive space.
- dvr (compatibility): For A=O_K the evaluation retains the deformation Hodge filtration rather than the constant residual one.

**Uses.** TD.4/adapted-tangent: Identifies the correct Fil⁰ tensor condition.; TD.2/adapted-deformation: Defines the generic cocharacter type using the canonical comparison.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KP18, Lemma3.1.17 and §3.1.18, pp.169–170; KPZ26, §7.3.1(2), pp.85–86.

**Atlas planet:** Rational Frobenius section.


### constant-first-order — Constancy of a display to first order

**Definition.** In a marked module trivialization as above, call Ψ constant modulo a precisely when Ψ̄∘c=Ψ₀⊗1 as maps from M̃_{0,1}⊗Ŵ(R/a) to M₀⊗Ŵ(R/a). For an O_Ĕ-local model use a_G=m_G²+π_E R_G and first base change both ends of c along R_G/a→R_G/a_G. Constancy is relative to this marked trivialization; it is not literal equality of arbitrary normal-decomposition matrices.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/constant-first-order.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/connection-comparison; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display-base-change.

**Construction or proof.** Define the equality in the common coefficient ring. Derive its transformation rule under a marked change of trivialization by naturality of c.

**API.**

- ConstantFirstOrder.equation (characterisation): Constancy is the equation Ψ̄c=Ψ₀.
- ConstantFirstOrder.transport (compatibility): A change of marked frame transforms Ψ and c together.
- ConstantFirstOrder.quotient (functoriality): Constancy descends to larger first-order quotient ideals.

**Unit tests.**

- nontrivialC (computation): When c has lower-left ε, the constant Ψ is Ψ₀c⁻¹, not generally Ψ₀ in that coordinate basis.
- reflexUniformizer (compatibility): For ramified E the quotient uses π_E, which can kill more than p.
- residue (degenerate): Reduction to the residue display satisfies the equation identically.

**Uses.** TD.1/universal-display: Selects the universal display lift.; TD.4/tensor-section: Makes the lifted tensor isomorphism an adapted deformation.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.1.19, p.52 and (5.2.2), pp.53–54; Hoff23, Remark2.37, p.29.

**Atlas planet:** First-order rigid displays.


### rational-section-tensors — The rational section preserves lifted tensors

**Lemma.** If integral φ-invariant tensors on a deformation reduce to the residual tensors and admit a tensor-preserving integral frame, the canonical rational section carries the residual tensors to those lifted tensors. In particular its induced K-filtration can be tested on the original tensor family. No equality of arbitrary integral lattices follows merely from the rational section.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/rational-section-tensors.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/rational-section.

**Construction or proof.** Extend the tensor-frame trivialization and use uniqueness of the φ-equivariant rational section on each mixed tensor construction. The identity modulo the maximal ideal fixes the residual values.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KP18, Lemma3.2.13, p.174.


### display-deformations — Crystalline deformation of displays

**Comparison.** For continuous complete local PD thickenings S→R satisfying Hoff Notation1.19, passing from displays on the relative Dieudonné frame D_{S/R} to displays on D_R is an equivalence. Combined with Grothendieck–Messing, lifting a marked display across a nilpotent PD thickening amounts to lifting its Hodge direct summand. Retain the nilpotence, continuity and perfect-residue hypotheses; this is not a claim about arbitrary ideal quotients.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/display-deformations.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display-classification; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/relative-comparison; CrystallineCohomology:CR.7/dieudonne-evaluation; CrystallineCohomology:CR.7/messing-filtration-interface.

**Construction or proof.** Apply relative-frame crystalline descent, then recover the Hodge lift from the absolute frame pair. Use the imported crystalline site and GM functor, with the contravariant convention checked on the two rank-one displays.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Hoff23, Theorem1.23 and Proposition1.26, pp.14–15.


### universal-display — Universal display with rigid first order

**Theorem.** Over R_GL choose an isomorphism Ψ:M̃₁→M lifting Ψ₀ and constant modulo a=m_GL²+m_F R_GL via c. The resulting marked display is universal for deformations of H₀ over complete local O_F-algebras with residue k. Universality concerns marked display/group deformations, not filtration lifts in an arbitrary unmarked frame.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/universal-display.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/universal-filtered-pair; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/constant-first-order; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/display-deformations.

**Construction or proof.** Lift the prescribed first-order isomorphism using smoothness of GL. GM identifies the tangent map with the Grassmannian tangent isomorphism. Prorepresentability and formal smoothness then show the classifying map is an isomorphism.

**Check.** State the residual marking and O_F base; verify the d=0,h case and the h=2,d=1 tangent dimension.

**Sources.** Hoff23, Construction1.27 and Theorem1.28, p.15; KPZ26, §5.1.19, p.52.


## TD.2. Integral tensors and very-good embeddings

Package a smooth full-fixer tensor datum with its supplied good normal flat local-model embedding; distinguish its connected parahoric. Form the completed orbit ring, elementary filtration lattice and integral tensor torsors, using explicit purity and normal-section inputs. Define horizontality, very-goodness, chain and unramified variants, parahoric G-displays and adapted lifts independently of the desired quotient theorem.


### tensor-datum — Integral tensor and local-model datum

**Definition.** Fix p>2, k=F̄_p, W=W(k), a finite free Z_p-module Λ, and a family s_a in the direct sum of mixed tensor powers of Λ and Λ∨. Require a smooth affine full fixer G̃⊂GL(Λ), with connected reductive generic fibre G, cut out scheme-theoretically by s_a on every Z_p-algebra. Write Gscr=G̃ for this full fixer and Gscr° for its connected parahoric subgroup. A good integral Hodge embedding includes scalars, a minuscule weight-(0,1) conjugacy class and a compatible closed immersion of its supplied flat normal local model into Gr(d,Λ). A point x and a tensor frame D(H₀)≅Λ_W complete the marked datum. For generic-fixer and cocharacter statements retain the full fixer even when Gscr°≠Gscr.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum.

**Direct prerequisites:** ReductiveGroupsPartII:RG2.3; SchemeAndStackFoundations:SF.1; BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible.

**Construction or proof.** Use the scheme stabilizer rather than only its Z_p-points. Import the group scheme and local-model carriers; package their specified embedding as input. The missing existence/local-model supplier extension is recorded as a gap, so this definition does not assert that every parahoric datum has a good embedding.

**API.**

- TensorDatum.mixedTensor (data): Mixed tensor degrees include dual factors and transport under finite-free base change.
- TensorDatum.fixer (characterisation): For every coefficient algebra A, G̃(A) consists exactly of automorphisms fixing every s_a⊗1.
- TensorDatum.localModel (projection): The chosen local model and Grassmannian immersion are named data with the stated flatness and normality hypotheses.
- TensorDatum.replaceTensors (equivalence): Two cutting families with the same closed group scheme give the same tensor-isomorphism torsors.

**Unit tests.**

- emptyFamily (degenerate): The empty family has fixer GL(Λ).
- endomorphism (characterisation): An endomorphism tensor has centralizer as fixer; this does not demand commuting with its values only at geometric points.
- fullFixer (non-example): If the integral fixer is disconnected, identifying it with its connected parahoric is rejected.
- dual (compatibility): The identity in Λ⊗Λ∨ is fixed by every automorphism; treating Λ∨ as another covariant copy fails.

**Uses.** TD.2/very-good: Defines which integral group c must preserve.; TD.4/etale-adaptedness: Requires the same integral tensor type on the deformation.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.2, pp.52–54; KZ25, §3.2.1–3.2.3, pp.22–23.

**Atlas planet:** Integral tensor data.


### filtration-lattice — Height-one tensor filtration lattice

**Construction.** For K/W(k)[1/p] finite totally ramified, choose uniformizer π and Eisenstein E(u), and set 𝔖=W(k)[[u]]. A local-model filtration point y over O_K defines a direct summand in D⊗O_K. Its inverse image F in D⊗𝔖 under u↦π is finite free of full rank with E(D⊗𝔖)⊂F⊂D⊗𝔖. Residual tensors define rational tensors in F[1/E]; do not identify F with φ*F or with the tilde module before the relevant comparison.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/filtration-lattice.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/normal-pair.

**Construction or proof.** Use the elementary modification associated with the O_K direct summand and a normal basis to prove freeness. The generic local-model orbit gives the cocharacter description after completion at E.

**API.**

- FiltrationLattice.preimage (constructor): F is the inverse image of Fil¹ under evaluation modulo E.
- FiltrationLattice.bounds (projection): E·(D⊗𝔖)⊂F⊂D⊗𝔖.
- FiltrationLattice.baseChange (compatibility): A compatible choice of uniformizer and coefficient map transports the elementary modification; comparison maps are explicit.

**Unit tests.**

- etale (degenerate): For Fil¹=0, F=E·(D⊗𝔖).
- multiplicative (degenerate): For full Fil¹, F=D⊗𝔖.
- ordinary (computation): For a split height-two filtration, F=𝔖e₁⊕E𝔖e₂; replacing E by p changes its O_K quotient.

**Uses.** TD.2/filtration-tensor-torsor: Extends the rational tensor reduction integrally.; TD.6/central-bk-lift: Constructs the ordinary height-one module.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KP18, Lemma3.2.6 and its lattice construction, pp.171–172; Hoff23, Lemma2.7, pp.18–19.


### orbit-deformation-ring — Completed orbit deformation ring

**Construction.** For the supplied good embedding and x, let R_G be the completed local ring of Mloc_{Gscr,μ} at x after completion of the reflex field’s maximal unramified base to residue k. Let R_E be the corresponding completed Grassmannian ring. The embedding gives a continuous local surjection R_E→R_G; R_G is flat over O_Ĕ, normal, and its generic fibre is the prescribed orbit closure. The universal pair on R_E restricts to a pair on R_G. This construction assumes the named local-model geometric inputs and does not prove them by flatness of a universal group.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/orbit-deformation-ring.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/universal-filtered-pair; SchemeAndStackFoundations:SF.4.

**Construction or proof.** Take the indicated completed local rings and pull back the universal summand. Obtain flatness, normality and the orbit description from the local-model input, which the geometry gap enumerates; formal completion alone does not establish these properties.

**API.**

- OrbitDeformationRing.quotient (data): The local-model immersion induces R_E→R_G.
- OrbitDeformationRing.universalPair (constructor): The pulled-back pair has underlying module Λ⊗Ŵ(R_G).
- OrbitDeformationRing.points (universal-property): Continuous maps R_G→A classify nearby filtration points lying in the supplied local model.

**Unit tests.**

- GL (degenerate): For Gscr=GL(Λ) and the full Grassmannian, R_G=R_E.
- closedCondition (non-example): A filtration outside the local-model closed subscheme does not correspond to a map from R_G.
- reflexBase (compatibility): For ramified E the base is O_Ĕ, not W(k) with the ramification silently removed.

**Uses.** TD.4/versal-adapted: Defines the proposed deformation quotient.; TD.2/horizontal-tensors: Specifies a_G and the first-order tensor comparison.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.2.1, pp.52–53; KZ25, §3.2.3, p.23.

**Atlas planet:** Tensor deformation ring.


### filtration-tensor-torsor — Integral tensors on the filtration lattice

**Theorem.** For a good integral Hodge embedding and the height-one lattice F associated with y∈Mloc(O_K), the rational cutting tensors lie in F^⊗ and their isomorphism scheme with (Λ,s_a) over 𝔖 is a trivial Gscr-torsor, provided the full-fixer/component compatibility and the punctured-spectrum parahoric purity input hold. Under the older KP18 setup one may instead assume the explicit vanishing H¹(Spec𝔖\{(p,u)},Gscr)=1 together with its stated scalar and connected-generic-fibre conditions. The modern route uses Anschütz Proposition10.3 in its actual coefficient-ring generality.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/filtration-tensor-torsor.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/filtration-lattice; SchemeAndStackFoundations:SF.1; ReductiveGroupsPartII:RG2.3.

**Construction or proof.** Construct the G-structure on F[1/E] by its inclusion in the original module. On the E-adic completion of 𝔖[1/p], use the generic cocharacter and its Henselian coefficient section to obtain a second reduction. Glue on the punctured spectrum by the precise Beauville–Laszlo theorem, extend using parahoric purity, and identify the resulting tensor lattice by Hartogs. Trivialize the smooth torsor using the algebraically closed residue field. Purity is a separately recorded supplier gap, not an elementary consequence of reductivity.

**Check.** Distinguish integrality, torsor representability, torsor extension and existence of an integral frame as separate assertions. No theorem here changes an arbitrary full fixer to its connected parahoric.

**Sources.** KP18, Lemma3.2.6 and proof, pp.171–172; Hoff23, Lemma2.7, pp.18–19; Anschuetz22, Proposition10.3, p.33.


### bk-witt-lattice-comparison — Breuil–Kisin to tilde lattice comparison

**Comparison.** For the preceding O_K filtration lattice F, the map 𝔖→Ŵ(O_K), u↦[π], identifies Ŵ(O_K)⊗_{φ,𝔖}F with the tilde module for the corresponding pair. The comparison of Frobenius modifications uses φ(E([π]))=p times a unit; φ(E([π])) itself is a non-zero-divisor and is not a unit. Transport the integral Gscr-structure along this isomorphism.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/bk-witt-lattice-comparison.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/filtration-tensor-torsor; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-frobenius-map; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons.

**Construction or proof.** Evaluate the Eisenstein polynomial in Ŵ(O_K), apply the divided Frobenius and check its W(k) reduction is a unit. In normal coordinates the scaled E block becomes the p block. State this as a lattice comparison, not as a strict map between incompatible frames.

**Check.** Check both rank-one filtrations; do not invert φ(E([π])) inside Ŵ(O_K).

**Sources.** KP18, Lemma3.2.9 and (3.2.10), pp.172–173; Hoff23, Lemma2.7, p.18.


### tilde-tensor-torsor — Integral tilde tensors and tensor frames

**Theorem.** For the universal R_G-pair of a good embedding, the rational tensors s̃_a=φ*(s_a⊗1), viewed using j[1/p], are integral in M̃₁^⊗. Their tensor-isomorphism scheme T=Isom_{s̃,s}(M̃₁,Λ⊗Ŵ(R_G)) is a trivial Gscr-torsor, independent of the chosen cutting family. For Z_p coefficients the displayed φ* is harmless notation; for a nontrivial unramified coefficient ring it must remain. The result uses normality of R_G and the named pointwise integrality/flatness descent inputs.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/orbit-deformation-ring; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/bk-witt-lattice-comparison; SchemeAndStackFoundations:SF.1; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-frobenius-map; SchemeAndStackFoundations:SF.0.

**Construction or proof.** At the special point use M̃_{0,1}=gΛ_W for g∈G(W[1/p]); g fixes the tensors, proving special-fibre integrality. At every DVR-valued point use the preceding lattice comparison. Apply the explicit normal-base integral-section criterion and the pointwise-flatness criterion of KP18, whose supplier gap retains their hypotheses. Establish the smooth torsor, then trivialize it over the complete local Zink ring.

**Check.** Separate the normality argument from the pointwise flatness argument; an integral tensor at closed points alone is not a proof of a flat torsor.

**Sources.** KPZ26, §5.2.1, p.53; KP18, Lemma3.2.6, Lemma3.2.9 and Corollary3.2.11, pp.171–173.


### horizontal-tensors — First-order tensor horizontality

**Definition.** Set a_G=m_G²+π_E R_G. For a Gscr-invariant t∈Λ^⊗ let t̃=φ*(t⊗1) in the integral tilde tensor module. Call it horizontal at x if c(t̃₀⊗1)=t̃⊗1 over Ŵ(R_G/a_G), with c base-changed on both sides from the comparison modulo m_G²+pR_G. This first-order display condition is distinct from an unspecified integrable connection on all of Spec R_G.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/horizontal-tensors.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/connection-comparison.

**Construction or proof.** Define the equality in the mixed tensor algebra of the tilde module; tensor transport includes inverse dual maps. Naturality follows from the canonical construction of c.

**API.**

- HorizontalTensors.equation (characterisation): Horizontality is precisely c(t̃₀)=t̃ in the indicated quotient.
- HorizontalTensors.pullback (functoriality): A compatible marked local-model map preserves horizontality.
- HorizontalTensors.tensorOperations (compatibility): Horizontal tensors are closed under sums in a fixed degree, products, dual contractions and invariant linear operations.

**Unit tests.**

- identityEndomorphism (compatibility): The identity endomorphism is horizontal by functoriality of c.
- wrongQuotient (non-example): As a test of the transport equation on an ambient module, take A=k[ε]/ε², c=1+εE₂₁ and t₀=t=E₁₁ in End_A(A²). Then ct₀c⁻¹=t+εE₂₁≠t, although the tensors agree after reduction to k. This tests detection of first-order transport; it does not assert that these data form a good local-model tensor datum.
- dualTransport (compatibility): An evaluation tensor in Λ⊗Λ∨ is transported using c and its inverse dual, hence remains the evaluation tensor.

**Uses.** TD.2/very-good: Defines very-goodness.; TD.3/curve-criterion: Tests equality on curve-generated tangent directions.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.2.2, (5.2.2), pp.53–54.

**Atlas planet:** Horizontal display tensors.


### g-display — Dieudonné display with parahoric structure

**Definition.** In this node require Gscr=Gscr° to be the connected parahoric, with Hoff’s local-model embedding hypotheses. For the local-model datum and a complete Noetherian local O_Ĕ-algebra R with residue k, a Dieudonné (Gscr,μ)-pair is a Gscr-torsor P over Ŵ(R) and a Gscr-equivariant map P_R→Mloc. Its associated normal pair has a canonical tilde Gscr-torsor P̃, obtained by integral tensor extension, not by naively tensoring φ₁ on arbitrary mixed tensors. A Dieudonné (Gscr,μ)-display is (P,q,Ψ:P̃≅P), with Ψ a Gscr-torsor isomorphism. Translate Hoff’s weights (0,−1) to the inverse cocharacter of our weight-(0,1) filtration convention.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/g-display.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/filtration-tensor-torsor; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display; SchemeAndStackFoundations:SF.1.

**Construction or proof.** Construct the tilde torsor by the universal local-model pair and descent; use the DVR tensor extension plus flat normal input, then extend to torsion rings through suitable lifts. Show uniqueness and independence of the good embedding under the stated local-model compatibility. Arbitrary invariant higher tensors do not carry a direct φ₁ formula.

**API.**

- GDisplay.pair (projection): Forget Ψ to obtain a Gscr-pair and hence a normal pair.
- GDisplay.underlying (functoriality): A faithful integral embedding gives the underlying Dieudonné display.
- GDisplay.baseChange (functoriality): Compatible complete local maps pull back P,q and Ψ, using the canonical tilde comparison.
- GDisplay.changeGroup (compatibility): A compatible local-model group immersion induces a change-of-group functor on displays.

**Unit tests.**

- GL (compatibility): For Gscr=GL_h and its Grassmannian, recover ordinary displays of type (h,d).
- torsion (non-example): Over R/p, define Ψ as a torsor isomorphism; do not recover it uniquely from rational Frobenius, which has lost information.
- endomorphisms (characterisation): For an endomorphism-cut group, Ψ must commute with the induced endomorphisms of the pair and tilde pair.

**Uses.** TD.4/g-display-universality: Represents the marked G-display deformation functor.; TD.4/hoff-compatibility: Identifies the tensor and torsor definitions under very-goodness.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Hoff23, Definitions2.3 and2.11, Proposition2.6 and Remark2.9, pp.17–20.

**Atlas planet:** Parahoric displays.


### very-good — Very good integral Hodge embedding

**Definition.** A supplied good integral Hodge embedding is very good at x if one scheme-theoretically cutting tensor family is horizontal there. Equivalently c is an isomorphism of the associated Gscr-torsors over Ŵ(R_G/a_G). Say very good at all points when this holds for every geometric special-fibre x. The existence of integral tensor frames on each side does not by itself imply that c preserves them.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/horizontal-tensors; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum.

**Construction or proof.** Use the tensor-isomorphism torsors to identify tensor preservation with reduction of the structure group. The independent-family theorem below makes this invariant under replacing the cutting family.

**API.**

- VeryGood.atPoint (characterisation): A cutting family is horizontal iff c is a Gscr-torsor isomorphism.
- VeryGood.allPoints (projection): A globally very-good embedding specializes to a very-good embedding at every x.
- VeryGood.changeFrame (compatibility): A marked change of coordinates transports the condition and preserves its truth value.

**Unit tests.**

- GL (degenerate): For GL with empty cutting family, every good embedding is very good.
- tensorFrameNotEnough (non-example): Two integral Gscr-torsors with a GL isomorphism not preserving a defining endomorphism fail the condition.
- pointwise (characterisation): A proof at one x does not establish the quantified all-points predicate.

**Uses.** TD.4/tensor-section: Allows the residual tensor-frame section to lift with constant first order.; TD.3/nonexceptional-embedding: This is the conclusion of the embedding existence theorem.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, Definition5.2.5, p.54.

**Atlas planet:** Very good embeddings.


### adapted-deformation — Adapted p-divisible deformation

**Definition.** Fix a marked H₀/k with φ-invariant integral tensors in Fil⁰ and integral type (Λ,s_a), and a Hodge cocharacter μ_y from a local-model lift. For finite K/Ĕ, a marked lift H/O_K is (Gscr,μ_y)-adapted if the tensors lift to integral φ-invariant tensors of its Dieudonné display over Ŵ(O_K), admit a tensor-preserving integral frame lifting the marked residual one, and its generic Hodge filtration under the canonical rational section is induced by a G-valued cocharacter conjugate to μ_y. Keep the inverse convention when expressing this using the orbit local model Mloc_{G,μ_y⁻¹}.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/adapted-deformation.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/rational-section; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/rational-section-tensors; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display-classification.

**Construction or proof.** Package the integral lift, frame and generic filtration condition together. Compare with the torsor and Breuil-PD versions via the named integral comparisons, rather than defining adaptedness to mean factorization through the desired quotient.

**API.**

- AdaptedDeformation.tensorLift (projection): An adapted lift supplies the integral φ-invariant tensors and marked frame.
- AdaptedDeformation.filtrationType (projection): Its generic filtration lies in the specified G-conjugacy class.
- AdaptedDeformation.extendDVR (functoriality): Finite extensions of K preserve adaptedness with the transported marking.
- AdaptedDeformation.tensorPresentation (compatibility): Equivalent integral cutting families give the same property.

**Unit tests.**

- GL (degenerate): For empty tensors, adaptedness reduces to the usual prescribed height/dimension deformation type.
- integralType (non-example): Rational tensors with a different integral stabilizer type do not satisfy the integral-frame requirement.
- inverseCocharacter (compatibility): For μ_{p∞}, Fil¹ is the whole rank-one module; changing μ_y to its inverse changes the local-model convention and must be recorded.

**Uses.** TD.4/versal-adapted: Its DVR points are characterized by a quotient ring.; TD.6/ordinary-adapted-lift: The explicit ordinary lift must satisfy this independently defined condition.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KZ25, Definition3.2.4, pp.22–23; KP18, Proposition3.2.17, pp.175–177 (antecedent integral tensors and filtration conditions).

**Atlas planet:** Adapted deformations.


### tensor-family-independence — Independence of the defining tensors

**Theorem.** If one cutting family for a good embedding is horizontal at x, then every Gscr-invariant mixed tensor is horizontal there. Consequently all cutting families define the same very-good condition, and the tensor-frame torsor used in that condition is independent of the presentation.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-family-independence.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor.

**Construction or proof.** A Gscr-torsor isomorphism acts trivially on every invariant tensor in its associated mixed tensor bundles. This uses the scheme-theoretic stabilizer, not only pointwise group equality.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, Lemma5.2.3, p.54.


### very-good-unramified — Unramified coefficient detection

**Comparison.** For a good Z_p embedding and O=W(F_q) a finite unramified extension, extend scalars and the reflex field to their compositum. The original embedding is very good at x if and only if its O-version is very good at the corresponding point. Use φ*(s⊗1) for the coefficient-twisted tilde tensors and faithfully flat descent of their equality.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good-unramified.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-base-change.

**Construction or proof.** Compare the two completed local models after the reflex-ring base change, use strict base change of τ and the natural first-order c, then descend equality by faithful flatness. Do not identify the coefficient Frobenius with the identity.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.2.6–Lemma5.2.7, p.54.


### very-good-lattice-chain — Very-good periodic lattice-chain embedding

**Definition.** For a periodic Z_p-lattice chain L in V, a determining segment has r lattices and total module tot(L)=⊕_{i=1}^r Λ_i in V^{⊕r}. A good embedding into GL(L) is very good at x when its diagonal representation on tot(L) is very good there. The group-scheme lattice-chain stabilizer and its transition maps are imported from RG2.3. A chain may be selfdual as an indexed chain without every individual lattice being selfdual.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good-lattice-chain.

**Direct prerequisites:** ReductiveGroupsPartII:RG2.3; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good; ReductiveGroupsPartII:RG2.3/lattice-chain-stabilizer-schemes.

**Construction or proof.** Use a determining segment to define the property. Segment independence is proved in TD.3/chain-segment-independence, after the isomorphic-sum criterion.

**API.**

- VeryGoodLatticeChain.total (data): A segment gives the indicated finite direct sum and diagonal action.
- VeryGoodLatticeChain.atPoint (characterisation): The chain condition is the total-representation condition.
- VeryGoodLatticeChain.segmentTransport (compatibility): Changing the determining segment preserves very-goodness by the periodic lattice isomorphisms and isomorphic-sum criterion.

**Unit tests.**

- singleLattice (degenerate): A one-step chain reduces to its single integral representation.
- periodShift (compatibility): Replacing Λ_i by the periodic copies pΛ_i yields an isomorphic segment representation and the same condition.
- selfdualChain (non-example): A paired chain Λ_i⊕Λ_{−i}^⊥ can be selfdual without Λ_i=Λ_i^⊥; requiring equality of every lattice is too strong.

**Uses.** TD.3/nonexceptional-embedding: States the lattice-chain existence output.; TD.3/A-central-cover: Uses the paired indexing in the symplectic construction.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.2.4, p.54; §6.1.1, p.62.


## TD.3. Criteria and existence of very-good embeddings

Prove the endomorphism, scheme-intersection, summand, isomorphic-copy, product and segment criteria. Prove formal-curve and arithmetic-curve tangent detection, retaining the nonstrict Breuil comparison. Import existing RG2 algebraic lattices to obtain the nonexceptional, paired, Dᴴ PEL, specified Dᴴ central-enlargement, standard wild type-A and specified symplectic type-A very-good conclusions, with every representation and ramification hypothesis.


### power-series-integrality — Integral tensors along a formal curve

**Lemma.** Let a:Spec k[[u]]→Mloc pass through x. In S=W(k)[[u]] form M_S=Λ⊗S and the inverse image M_{S,1} of the induced filtration modulo p. Then pM_S⊂M_{S,1}⊂M_S, M_{S,1} is finite free, and the invariant tensors in its rationalization lie in M_{S,1}^⊗. This is the p-frame curve lattice; it is not the Eisenstein modification for an arbitrary ramified O_K.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/power-series-integrality.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/frame; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum.

**Construction or proof.** Over W(K), K an algebraic closure of k((u)), the local-model lattice is gΛ with g∈G(W(K)[1/p]), so invariant tensors are integral there. In the common fraction object use W(k)[[u]][1/p]∩W(K)=W(k)[[u]] coefficientwise. Flatness of the quotient filtration proves the elementary-modification freeness.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, Lemma5.3.13, pp.57–58.


### invariant-endomorphisms — Invariant endomorphisms are horizontal

**Lemma.** For a good integral embedding, every Gscr-fixed endomorphism t of Λ preserves the universal filtration pair and its induced tilde endomorphism is horizontal under c at each point. This is special to functorial endomorphisms; arbitrary higher tensors require the integral torsor argument.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/invariant-endomorphisms.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/horizontal-tensors; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/connection-comparison.

**Construction or proof.** The generic cocharacter commutes with t, so t preserves the generic universal filtration. The flat local-model closure extends preservation integrally. Apply naturality of τ and c to the resulting pair endomorphism.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, Lemma5.3.2, pp.54–55.


### curvewise-horizontal — Curvewise horizontality of the canonical comparison

**Lemma.** For a special-fibre tangent vector v at x that is the first jet of a k[[u]]-curve, the pullback of c to Ŵ(k[ε]/ε²) preserves the cutting tilde tensors. One does not assume every tangent vector individually lifts to a curve. The statement compares the canonical relative-frame c, not an arbitrary map satisfying its Frobenius square.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/curvewise-horizontal.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/power-series-integrality; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/connection-comparison; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-base-change.

**Construction or proof.** Compare the p-frame W(k)[[u]] with its dual-number p-frame and enlarged relative (p,ε)-frame, where φ(ε)=φ₁(ε)=0. The rational comparison preserves tensors; integrality and p-torsion-freeness give the integral equality. Strict maps to the Zink frames identify this with canonical c. Do not deduce integral equality in a torsion ring solely from rational equality.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, Proof of Proposition5.3.11, (5.3.12)–(5.3.14), pp.56–60.


### summand-very-good — Very-goodness descends to a summand

**Theorem.** Let Λ=Λ₁⊕Λ₂ with compatible local-model representations, with the representation on Λ₁ good. If the diagonal representation on Λ is good and very good at x, then the good representation on Λ₁ is very good at x. The projection idempotent and inclusions define pair maps, so c restricts to the first tilde summand.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/summand-very-good.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/invariant-endomorphisms.

**Construction or proof.** Compare the local-model filtrations under direct sum, then use the idempotent to split τ and c. Tensor-family independence tests the induced first-summand tensors.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, Lemma5.3.7(a), p.55.


### product-very-good — Products preserve very-goodness

**Theorem.** For separate groups Gscr₁,Gscr₂ with good very-good embeddings on Λ₁,Λ₂, their product acting on Λ₁⊕Λ₂ is good and very good. Its local model is the product for the product cocharacter class. This concerns the product group, rather than the diagonal image of one group in two unrelated representations.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/product-very-good.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor.

**Construction or proof.** The product universal pair decomposes; τ and c respect this decomposition. Transport the two cutting tensor systems and the summand idempotents.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, Lemma5.3.9, p.56.


### curve-criterion — Curve-spanned tangent criterion

**Theorem.** If a good embedding’s special-fibre tangent space at x is spanned by images of tangent spaces of maps Spec k[[u]]→Mloc through x, the embedding is very good at x. In particular a smooth special-fibre point is very good. The hypothesis is linear spanning by curve directions, not that every tangent direction has a prescribed simultaneous formal lift.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/curve-criterion.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/curvewise-horizontal; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good.

**Construction or proof.** The curve directions inject the cotangent m/(m²,π_E) into the product of their one-dimensional jet quotients. Zink logarithmic coordinates on a square-zero p-killed ideal are the direct sum of that ideal, so these jets detect the difference c(s̃₀)−s̃. Apply the previous curvewise lemma. Use the supplied smooth-point formal coordinates for the corollary.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, Proposition5.3.11 and Corollary5.3.16, pp.56–60.

**Atlas planet:** Curve tangent criterion.


### neutral-closure — Very-goodness for the generic neutral closure

**Theorem.** Let Gscr be smooth affine of finite type over Z_p, with reductive generic neutral group G°. Assume its schematic closure Gscr⁰ in Gscr is a smooth stabilizer scheme, μ factors through G°, and both induced embeddings have the supplied good local-model properties, over their respective reflex bases. If c for Gscr preserves a cutting family, the induced Gscr⁰ embedding is very good. Gscr⁰ denotes this smooth schematic closure, not an unproved equality with the fibrewise identity component.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/neutral-closure.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor; ReductiveGroupsPartII:RG2.3.

**Construction or proof.** Induce the relevant tensor torsors from Gscr⁰ to Gscr and compare them after the possible reflex-field extension. Over the square-zero Zink kernel, smoothness and equality of generic dimensions identify the two congruence kernels. The comparison point therefore lies in Gscr⁰.

**Check.** Record the reflex extension E⊂E° and prove the smooth-closure hypothesis separately; do not replace it by generic connectedness.

**Sources.** KPZ26, §5.3.19–Proposition5.3.20, pp.61–62.


### centralizer-very-good — Endomorphism and centralizer criterion

**Theorem.** A good embedding cut out scheme-theoretically by endomorphisms is very good at every point. More generally, if Gscr⊂Gscr′⊂GL(Λ), the composite and Gscr′ embeddings are good, and Gscr is the intersection of Gscr′ with the centralizers of specified endomorphisms, very-goodness of Gscr′ at the image of x implies very-goodness of Gscr at x.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/centralizer-very-good.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/invariant-endomorphisms; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-family-independence.

**Construction or proof.** Use the preceding lemma for the new endomorphism equations; the old equations are preserved by the very-good Gscr′ comparison. Their union cuts out the scheme-theoretic intersection.

**Check.** Require both good local-model immersions and scheme-theoretic intersection; group equality on Q_p-points is insufficient.

**Sources.** KPZ26, Corollaries5.3.3–5.3.4, p.55.

**Atlas planet:** Endomorphism criterion.


### arithmetic-criterion — Arithmetic-curve criterion

**Theorem.** A good embedding is very good at x if its mod-π_E tangent space is spanned by the tangent images of maps Spec O_K→Mloc through x, with K/Ĕ finite. Each source tangent is taken modulo its induced O_Ĕ structure. This arithmetic variant uses the height-one Breuil–Kisin lattice comparison, whose frame map is nonstrict; strict-frame base change alone cannot prove it.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/arithmetic-criterion.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/curve-criterion; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/bk-witt-lattice-comparison; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/connection-comparison.

**Construction or proof.** Repeat cotangent detection for the arithmetic-curve jets. Compare the Eisenstein-frame modification with the p-frame after its explicit divided-Frobenius scaling, then use integral tensor preservation. Keep the nonstrict scaling as part of the comparison rather than invoking TD.0/tilde-base-change. This is a separate proof from the smooth formal-curve criterion.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.3.17–Proposition5.3.18, pp.60–61.


### isomorphic-sums — Isomorphic copies preserve very-goodness

**Theorem.** If Λ₁≅Λ₂ intertwines the integral group action and local-model cocharacter types, and the first good representation is very good at x, then so is the second and their diagonal sum. Inductively any finite direct sum of isomorphic copies is very good. This theorem makes no assertion for the diagonal sum of two unrelated very-good representations of the same group.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/isomorphic-sums.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/centralizer-very-good.

**Construction or proof.** Transfer tensors across the intertwiner; projections and the intertwiner give the endomorphism equations cutting out the diagonal group inside a product. Apply the centralizer criterion.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, Lemma5.3.7(b) and Remark5.3.8, pp.55–56.

**Atlas planet:** Isomorphic-sum criterion.


### nonexceptional-embedding — Very-good chains in the nonexceptional cases

**Theorem.** Let (G,{μ},Gscr) satisfy p>2, local abelian type, and essentially tame classical adjoint factors, excluding triality. Assume (NE): no Dᴴ factor and no type-A adjoint factor Res_{F/Q_p}PGL_m(D) with p dividing ind(D). Let Gscr be the stabilizer of a point generic in its facet, let the centralizer of a maximal Q̆_p-split torus be R-smooth, and let p∤|π₁(Gder)|. Suppose G⊂G′=∏Res_{F_i/Q_p}H_i with equal derived groups, each H_i tamely split over F_i, and faithful minuscule representations ρ_i whose total ρ′ and restriction ρ are Hodge embeddings. There is a periodic Z_p-chain L in V such that the extension to GL(L), equivalently ρ^{⊕r} on tot(L), is good and very good at every local-model point.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/nonexceptional-embedding.

**Direct prerequisites:** ReductiveGroupsPartII:RG2.3; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/curve-criterion; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/centralizer-very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/summand-very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good-unramified; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/chain-segment-independence.

**Construction or proof.** Import the tame hyperspecial realization, fixed-point models, lattice-chain stabilizers and total-lattice direct-summand statements already owned by current RG2.3.5. Do not re-plan their constructions here. Use the supplied local-model adjoint/restriction comparison and curve-spanned tangent theorem for the split classical model to get very-goodness of the ambient restriction-of-scalars embedding. Cut G out by endomorphisms; use summand descent and unramified detection to obtain the required total representation. The geometric tangent input is a recorded supplier gap.

**Check.** Retain the Q̆_p-split-torus R-smoothness hypothesis and every representation condition; do not assert this for all wild type-A central quotients.

**Sources.** KPZ26, Standard assumptions3.1.5, p.16; Theorem6.1.1, pp.62–65.

**Atlas planet:** Nonexceptional very-good chains.


### D-PEL — Very-good Dᴴ PEL representations

**Theorem.** For the Dᴴ case n≥4 over K/Q_p, use G=Res_{K/Q_p}GO⁺(V,h), or the quaternionic GU⁺(T,φ) with anti-Hermitian φ. For the specified PEL representations V₀⊗_K V (V₀ alternating), or T₀⊗_D T (T₀ right-D Hermitian with the trace alternating form), a fixer at a point generic in its facet admits a periodic selfdual chain giving a very-good integral embedding at every point. Maintain the type-D and representation hypotheses of §6.2, and use the trace/different form after restriction of scalars.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/D-PEL.

**Direct prerequisites:** ReductiveGroupsPartII:RG2.3; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/neutral-closure; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/centralizer-very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good-unramified; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/nonexceptional-embedding; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/isomorphic-sums; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/summand-very-good.

**Construction or proof.** Import current RG2.3.5’s GO⁺ lattice rescaling, Γ-stable selfdual lattice and quaternionic Morita/hermitian-basis reductions. Reduce repeated copies by the isomorphic-sum and summand criteria. The ambient restriction-of-scalars GSp embedding is very good by the nonexceptional theorem applied to GSp. Cut out GO by its endomorphism equations inside GSp, then pass to the smooth generic-neutral GO⁺ closure. Apply the fixed-point, total-lattice summand and unramified descent argument as in Theorem6.2.3. These are display consequences of the imported algebraic lattices.

**Check.** The RG supplier owns the algebraic lattice theorem. Verify connected-closure and pairing assumptions before invoking TD.3/neutral-closure.

**Sources.** KPZ26, §6.2.1–Theorem6.2.3, pp.67–69.


### A-standard — Standard wild type-A representations

**Theorem.** For K/Q_p finite and a central division K-algebra D, put G=Res_{K/Q_p}GL_m(D), with standard representation on D^m or its specified opposite-dual representation. Every building point has a right-O_D periodic chain realizing its fixer; for the weight-(0,1) Hodge cocharacter types of this standard representation, the resulting good integral embedding is very good at all points. This includes p|ind(D) for these representations and does not cover arbitrary central quotients or other fundamental-weight representations.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/A-standard.

**Direct prerequisites:** ReductiveGroupsPartII:RG2.3; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/centralizer-very-good.

**Construction or proof.** Import the lattice-chain stabilizer from RG2.3 and the stated good local-model immersion from the missing local-model extension. The standard integral group is cut out by the right-O_D endomorphisms, so apply the endomorphism criterion. The opposite action is the contragredient action, with its matching cocharacter sign.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §6.3.1–Proposition6.3.2 and Remark6.3.3, pp.70–71; good-embedding input Theorem3.3.25, p.26.


### chain-segment-independence — Independence of the determining segment

**Theorem.** Very-goodness of a periodic chain embedding is independent of its determining segment. Adding complete periodic repeats only adds isomorphic representations; removing them uses summand descent. Shifting the segment uses the periodicity isomorphisms of its lattices. All comparisons retain the chain’s transition maps and the induced local-model good embedding.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/chain-segment-independence.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good-lattice-chain; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/isomorphic-sums; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/summand-very-good.

**Construction or proof.** Place two determining segments in a common finite repeated segment. Use the periodic lattice scaling isomorphisms, then the two established very-goodness criteria. This supplies the segment API promised in TD.2.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §5.2.4 and Lemma5.3.7, pp.54–56.


### D-central-cover — Dᴴ central enlargement with very-good chains

**Theorem.** For the central enlargement G₁′ and representation σ₁ of KPZ26 §6.2.8–6.2.9, obtained by adjoining the indicated two scalar factors in the split case or the unramified quadratic-field scalar action in the quaternionic case, every s≥1 copies of σ₁ at a generic-facet fixer admit a periodic selfdual chain with very-good integral embedding. The enlargement and balanced scalar weights are part of the input; do not replace it by an arbitrary central extension of a Dᴴ group.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/D-central-cover.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/D-PEL; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/isomorphic-sums; ReductiveGroupsPartII:RG2.3; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/product-very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/summand-very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/nonexceptional-embedding.

**Construction or proof.** Use the specified scalar enlargement and classical lattice model from RG2.3.5. From D-PEL and summand descent obtain the very-good single GO⁺ representation, then use the product criterion for GO⁺×GO⁺. Its scheme-theoretic intersection with the ambient GSp is the required enlarged group. The GSp embedding is very good by the nonexceptional theorem applied to GSp. The union of the two cutting tensor families is horizontal and cuts out the intersection. Descend as in D-PEL and use isomorphic sums for s copies; keep the balanced Hodge weights.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KPZ26, §6.2.8–Corollary6.2.10, pp.69–70.


### A-central-cover — Symplectic type-A central enlargement

**Theorem.** Let V=D^m and V̄=(Dopp)^m be the paired standard and opposite-dual modules. On W=V⊕V̄ use the alternating trace form defined by the factor-swap involution τ and ξ=(a,−a), as in §6.3.4. For the group G₁ generated by diagonal GL_m(D) and the two scalar factors, its representation and any s≥1 isomorphic copies have periodic selfdual chains with very-good embeddings. The paired chain has terms Λ_i⊕(Λ_{−i})^⊥; an arbitrary term Λ_i⊕Λ_i^⊥ need not form the required indexed selfdual chain.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/A-central-cover.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/A-standard; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/isomorphic-sums; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/centralizer-very-good; ReductiveGroupsPartII:RG2.3; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/product-very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/nonexceptional-embedding.

**Construction or proof.** Import the involutive trace-pairing and indexed paired lattice chain from RG2.3. The two standard representations give a very-good product embedding by A-standard and the product criterion. Check G₁=(G×G)∩GSp scheme-theoretically. The ambient GSp embedding is very good by the nonexceptional theorem applied to GSp. The union of the product and GSp cutting families is horizontal and defines this intersection. Apply isomorphic sums for s copies. Endomorphism equations alone do not impose the alternating similitude condition.

**Check.** State the inverse indexing explicitly and test duality of the i-th and −i-th terms.

**Sources.** KPZ26, §6.3.4–Corollary6.3.5, p.71.


### polarized-chain — Very-good chains with a perfect pairing

**Theorem.** In the nonexceptional setting suppose the H_i representations have perfect alternating F_i-pairings ψ_i and ρ(G) lies in the symplectic similitude group for ψ=Σ_i Tr_{F_i/Q_p}(δ_i⁻¹ψ_i), where δ_i generates the different. The chain L can be chosen so that L, its ψ-dual L∨, and the specified paired chain L⊕L∨ have very-good total representations; the paired chain is selfdual with its required indexing. This is a theorem about this controlled dual construction, not a general rule for arbitrary sums of two good representations.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/polarized-chain.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/nonexceptional-embedding; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/isomorphic-sums; ReductiveGroupsPartII:RG2.3.

**Construction or proof.** Import the Γ-stable hyperspecial paired lattices and the tame duality formula (M^Γ)∨=(δ⁻¹M∨)^Γ. Apply very-goodness to the paired ambient construction, then descend to the required summands. Keep the trace/different normalization and the chain duality indexing.

**Check.** A lattice dual here is with respect to ψ; it is not the abstract linear-module dual without the pairing identification.

**Sources.** KPZ26, Theorem6.1.9 and (6.1.10)–(6.1.11), pp.66–67.


## TD.4. Versal adapted deformations and integral tensor comparison

Use very-good c to lift a tensor section. Prove the four infinitesimal adaptedness criteria and DVR factorization by interpolation and integral ideal contraction. Obtain the versal quotient under assumptions(A),(B),(C), integral crystalline/Witt tensors using punctured exactness, Kottwitz image and tensor frames, and étale recognition with fixed integral type. Compare Hoff Assumption2.28 to very-goodness and prove the marked G-display universality under it.


### punctured-exactness — Exactness of the integral functor on the punctured disc

**Comparison.** For the imported crystalline-lattice functor T↦𝔐(T) over 𝔖, restriction to U=Spec𝔖\{(p,u)} is an exact faithful tensor functor on finite free integral representations in its stated range. Its rational and integral specialization maps are those of the base roadmap. Do not promote this assertion to exactness on all of Spec𝔖 for arbitrary crystalline lattices.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/punctured-exactness.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bms-kisin-functor; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons; SchemeAndStackFoundations:SF.1.

**Construction or proof.** Use the imported fully faithful tensor functor and the exactness theorem on the punctured spectrum, checked after its height-one localizations. Record the exact structure needed by the Tannakian torsor construction rather than assuming whole-ring exactness.

**Check.** A nonexact sequence at the closed point is not ruled out by this export; each specialization agrees with the imported functor.

**Sources.** KP18, Theorem3.3.2 and its opening discussion, pp.177–178.


### kottwitz-image — The crystalline Galois image has trivial Kottwitz invariant

**Lemma.** Let k be algebraically closed, K/W(k)[1/p] finite, and L a crystalline lattice with Γ_K-invariant tensors cutting out a smooth integral group Gscr with connected reductive generic G. The associated representation Γ_K→Gscr(Z_p)⊂G(Q_p) has image in ker κ_G, for the Kottwitz homomorphism over the completed maximal unramified field. With the fixer/parahoric component characterization, its image lies in Gscr°(Z_p).

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/kottwitz-image.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bms-kisin-functor; ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism; ReductiveGroupsPartII:RG2.3/parahoric-kottwitz-characterization.

**Construction or proof.** Use functoriality of κ_G and the crystalline representation’s tensor module to reduce the character/cocharacter obstruction. Apply the precise full-fixer intersection with ker κ_G to deduce the connected-parahoric image. This is where disconnected integral fixers require extra bookkeeping.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KP18, §3.3.3–Proposition3.3.4, pp.178–179.


### integral-tensor-frame — Tensor frames for crystalline lattices

**Theorem.** For a crystalline Γ_K-lattice L and invariant cutting tensors with smooth full fixer Gscr and connected reductive generic G, suppose the image lies in Gscr°(Z_p) and H¹(U,Gscr°)=1 for U=Spec𝔖\{(p,u)}. Then 𝔐(L) has an integral tensor-preserving frame L⊗𝔖≅𝔐(L). Modern parahoric purity supplies the vanishing for the connected parahoric in its coefficient-ring range; the tame/no-E₈ conditions of KP18 Corollary3.3.6 are a valid older sufficient case, not hypotheses silently needed in KZ25.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/integral-tensor-frame.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/punctured-exactness; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/kottwitz-image; SchemeAndStackFoundations:SF.1; ReductiveGroupsPartII:RG2.3; SchemeAndStackFoundations:SF.0/hartogs-regular-sequence; SchemeAndStackFoundations:SF.0/hartogs-affine-sections.

**Construction or proof.** Apply the Dedekind-base integral Tannakian torsor theorem to the exact faithful tensor functor on U, using finite-rank stable pieces of the group coordinate algebra. Kill its connected-parahoric torsor by the stated H¹ vanishing, then extend the tensor frame through the puncture by Hartogs for finite free modules. Tannakian representability and purity remain separate supplier obligations.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KP18, Lemma3.3.5 and Corollary3.3.6, pp.179–180; KZ25, Proposition3.3.2, p.25; Anschuetz22, Proposition10.3, p.33.

**Atlas planet:** Integral crystalline tensor frames.


### crystalline-tensor-integrality — Integral crystalline and Witt tensor comparison

**Theorem.** Let H/O_K be p-divisible, L=Hom_Zp(T_pH,Z_p)=T_p(H*)⊗Z_p(−1), and let Γ_K-invariant tensors in L^⊗ have the specified smooth full-fixer type with connected reductive generic fibre. Under the tensor-frame hypotheses just stated, their crystalline comparison images lie in D(H₀)(W)^⊗, lift canonically to φ-invariant tensors in D̂(H)(Ŵ(O_K))^⊗, and lie in Fil⁰ after evaluation to O_K. A tensor-preserving integral frame identifies D̂(H) with L⊗Ŵ(O_K) and its reduction with L⊗W. The word dual always means the linear dual L here.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/crystalline-tensor-integrality.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/integral-tensor-frame; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/rational-section-tensors.

**Construction or proof.** Apply the imported Breuil–Kisin functor to tensor maps from the unit, use its integral tensor frame and the φ-pullback/Witt comparison. Full faithfulness and the de Rham specialization give φ-invariance and Fil⁰. Reduce to W and compare to the canonical rational section.

**Check.** Check the Cartier-dual Tate twist on μ_{p∞}; do not replace L by T_p(H*) without (−1).

**Sources.** KZ25, Proposition3.3.2(1), p.25; KP18, Proposition3.3.8, p.180.


### tensor-section — A tensor-preserving first-order rigid section

**Construction.** Assume the tensor datum’s local-model acceptability and good-embedding conditions, and very-goodness at x. There is a section Ψ_G:M̃₁≅M of the tensor-frame torsor on Ŵ(R_G) with Ψ̄_Gc=Ψ₀ over Ŵ(R_G/a_G). It extends to a GL section Ψ_E over R_E with the same first-order condition. Its R_G-restriction preserves every invariant tensor. The choices of lifts are not asserted to be canonical.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/tensor-section.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/constant-first-order; SchemeAndStackFoundations:SF.1; SchemeAndStackFoundations:SF.4/smooth-lifting-torsor.

**Construction or proof.** Very-goodness makes Ψ₀c⁻¹ a point of the reduced Gscr-torsor. Smoothness and complete-local lifting extend it to Ψ_G. Extend across the ambient closed immersion using the GL torsor, respecting its prescribed first-order reduction.

**API.**

- TensorSection.choose (constructor): Produce Ψ_G with a recorded first-order value.
- TensorSection.ambientLift (data): Produce Ψ_E reducing to Ψ_G and satisfying the same c-equation.
- TensorSection.tensorCompatibility (compatibility): The chosen Ψ_G carries all invariant tilde tensors to their constant tensors.

**Unit tests.**

- nonVeryGood (non-example): Without tensor compatibility of c the prescribed reduced section need not lie in the Gscr-torsor.
- GL (degenerate): For empty tensors this is the ordinary first-order rigid GL lift.
- choice (characterisation): Two allowable lifts may differ by a Gscr congruence element; the construction is existence with specified reduction, not uniqueness.

**Uses.** TD.4/versal-adapted: Defines the versal ambient deformation and its quotient.; TD.4/g-display-universality: Supplies Hoff’s universal G-display candidate.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KZ25, §3.2.5–3.2.6, p.23; KP18, §3.2.12, pp.173–174 (requires the correction in KPZ26 §5.2 and §7.1.4(1), p.73).

**Atlas planet:** Tensor-preserving display section.


### cocharacter-splitting — Tensor Hodge filtrations and residual lifts

**Theorem.** In the integral crystalline-tensor setting over O_K, the generic Hodge filtration is induced by a cocharacter of G_K. There is a representative μ_y defined over K whose induced filtration on D(H₀)⊗K extends to an integral direct-summand filtration on D(H₀)⊗O_K lifting the special Hodge filtration, and the canonical generic filtration is G(K)-conjugate to that representative. Its geometric conjugacy class has a reflex field E/K₀ contained in a field of definition; μ_y need not be defined over K₀=W(k)[1/p]. No integral G(O_K)-conjugacy of the canonical generic filtration is asserted.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/cocharacter-splitting.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/crystalline-tensor-integrality; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum; ReductiveGroupsPartII:RG2.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bt-type-equivalence.

**Construction or proof.** Split the filtered fibre functor on the tensor category generated by the representation over K. An integral tensor frame lifting the identity on the special fibre transports the actual Hodge direct summand to D(H₀)⊗O_K. The rational comparison differs from that frame by G(K), giving the stated conjugacy. A cocharacter valued in G_{K₀} is allowed a field of definition larger than K₀; the reflex field is not silently made unramified.

**Check.** Export both the generic conjugacy and the integral residual-filtration lift; neither is shorthand for the other.

**Sources.** KZ25, Proposition3.3.2(2), p.25; KP18, Corollary3.3.10, pp.180–181 and §3.2.5 footnote4, pp.170–171.


### hoff-compatibility — Hoff’s infinitesimal compatibility condition

**Comparison.** For the same good integral embedding, identify the underlying module comparison of Hoff Lemma1.21 over Ŵ(R_G/a_G) with the canonical c used here, after inverting the cocharacter sign convention. Hoff Assumption2.28 is exactly the assertion that this comparison preserves the Gscr structures. Under the integral tensor-torsor identification, it is equivalent to very-goodness at x. It is an explicit condition on the embedding, not a consequence of naming a G-display.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/hoff-compatibility.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/g-display; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/connection-comparison.

**Construction or proof.** Compare both maps through the relative-frame construction, including their first-order quotient and marked module trivialization. Use tensor-family independence to translate compatibility with the structure group into the cutting tensor equations.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Hoff23, Assumption2.28 and Remark2.29, pp.24–25; KPZ26, Definition5.2.5, p.54.


### dvr-tangent — Tangent lifting at a DVR point

**Comparison.** For the chosen universal ambient marked deformation over R_E and a continuous local point ξ:R_E→O_K, lifts ξ_ε:R_E→O_K[ε]/ε² are in bijection with marked deformation classes of H_ξ over O_K[ε], with its fixed reduction to O_K. The induced identification of tangent modules is O_K-linear. This uses universality and the marking; it is not a bijection between arbitrary unmarked filtration coordinates.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/dvr-tangent.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/universal-display; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/display-deformations.

**Construction or proof.** Apply the universal deformation functor and rigidification over nilpotent PD thickenings. GM identifies its tangent module with lifts of the Hodge summand; verify compatibility with the prescribed ξ and its complete-local topology.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KP18, Lemma3.1.15 and §3.1.14, pp.168–169.


### adapted-interpolation — Interpolation of two tensor displays

**Construction.** Suppose two marked adapted displays over O_K have identified underlying tensor filtration pairs and the same residual display. For S=O_K[[T]], the surjection S→O_K×_k O_K sending T↦(0,π_K) lifts their two Ψ maps to a tensor-preserving Ψ_S. It gives an interpolating marked display with the required two endpoint specializations. Surjectivity is onto the fibre product, not onto O_K×O_K.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/adapted-interpolation.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/tensor-section; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display-base-change.

**Construction or proof.** Check the coefficient and Zink-Witt fibre-product surjections. Smoothness of the tensor-isomorphism torsor lifts its point along their complete-local kernel. Use ambient universality to lift the interpolation to a map R_E→S.

**API.**

- AdaptedInterpolation.interpolate (constructor): Produce Ψ_S with endpoints Ψ and Ψ′ after the stated identification of pairs.
- AdaptedInterpolation.endpoints (simp): Evaluation at T=0 and T=π_K returns the two marked displays.
- AdaptedInterpolation.ambientClassify (compatibility): The universal ambient display classifies the interpolating family by a continuous map R_E→S.

**Unit tests.**

- residueMismatch (non-example): Displays with incompatible residual Ψ cannot define a point over O_K×_k O_K.
- constantEndpoints (degenerate): For identical endpoint Ψ the constant display is an allowed interpolation.
- notProduct (non-example): The pair (0,1) does not belong to O_K×_k O_K, so the endpoint map is not claimed surjective onto the unrestricted product.

**Uses.** TD.4/dvr-factorization: Reduces the global ideal inclusion to infinitesimal criteria along a one-parameter family.; TD.4/g-display-universality: Proves the DVR-point part of representability.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KP18, Proof of Proposition3.2.17, pp.176–177; Hoff23, Lemma2.34, p.28.


### adapted-tangent — Four infinitesimal adaptedness criteria

**Theorem.** In the corrected tensor-section setup, let ξ:R_G→O_K and a marked O_K[ε]-display deformation of H_ξ be given. The following are equivalent: one ambient lift representing it factors through R_G; every such ambient lift factors through R_G; the canonical rationally transported tensors lie in Fil⁰; and those transported tensors are integral φ-invariant Fil⁰ tensors. The integral condition includes the marked integral tensor type. The G-tangent modules have rank dim G/(G∩P_ξ).

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/adapted-tangent.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/dvr-tangent; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/tensor-section; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/rational-section-tensors; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/display-deformations; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bt-type-equivalence.

**Construction or proof.** GM represents the deformation by a filtration graph. Strictness of morphisms of weakly admissible tensor modules identifies the rational Fil⁰ constraint with Lie G+Lie P_ξ. Compare the two free O_K tangent modules using ambient universality. Their injection and equal ranks give a finite torsion cokernel, not automatically an isomorphism. Scale ε by a suitable pⁿ to put the class in the image; factorization for the original class follows by the injective map O_K[ε]→O_K[ε], ε↦pⁿε and the closed equations.

**Check.** Do not infer equality of integral tangent lattices from equal ranks alone; retain the scaling argument and p-torsion-free coefficient ring.

**Sources.** KP18, Lemma3.2.14, (3.2.16) and proof, pp.174–175.

**Atlas planet:** Infinitesimal adaptedness criterion.


### dvr-factorization — Adapted DVR points factor through the local-model quotient

**Theorem.** Under the corrected setup, normality and generic regularity of R_G, every continuous local map ξ:R_E→O_K whose induced deformation is (Gscr,μ_y)-adapted factors through R_G. Thus factorization is independent of the ambient coordinate map inducing the marked deformation. The converse follows by the tensor-preserving display section. The proof requires the named formal-completion, point-detection and separatedness inputs; they are not supplied merely by smoothness of the group.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/dvr-factorization.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/adapted-tangent; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/adapted-interpolation; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/rational-section-tensors; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/orbit-deformation-ring; SchemeAndStackFoundations:SF.4.

**Construction or proof.** After a finite scalar extension and a marked Gscr frame change, identify the two O_K filtration points. Interpolate their Ψ maps over O_K[[T]]. For I_n=ker(R_E→S/Tⁿ), J_G=ker(R_E→R_G), and J_Gⁿ=ker(R_E→(R_G/n_yⁿ)[1/p]), apply the tangent criterion to the indicated common quotients. Over the fraction field the relevant descending finite-dimensional tangent subspaces stabilize. Generic regularity turns their equality into the needed completed-ideal containment. Contract through the p-torsion-free quotients, obtain J_G⊂I_n for every n and use ∩I_n=ker(R_E→S). Specialization at the second endpoint gives factorization.

**Check.** List precisely where regularity of R_G[1/p], finite-dimensional stabilization, p-torsion-freeness and T-adic separatedness are used.

**Sources.** KP18, Proposition3.2.17, pp.175–177; KZ25, Proposition3.2.7, pp.24–25.


### versal-adapted — Versal adapted deformation theorem

**Theorem.** Under (A) local-model acceptability, (B) the specified good integral Hodge embedding of the full fixer, and (C) very-goodness at x, the ambient deformation over R_E obtained from a first-order rigid tensor section is versal. For every finite K/Ĕ and every local ξ:R_E→O_K, its deformation is (G̃,μ_y)-adapted if and only if ξ factors through R_G. It is this chosen quotient inside a versal ambient family, not an assertion that any good embedding automatically represents a tensor deformation problem.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/versal-adapted.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/tensor-section; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/universal-display; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/dvr-factorization.

**Construction or proof.** Apply the universal display theorem to Ψ_E. Its restriction to R_G has integral invariant tensors and generic cocharacter type; the reverse direction is the preceding factorization theorem with the corrected c.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KZ25, Proposition3.2.7, pp.24–25; KPZ26, §7.1.3, pp.72–74.

**Atlas planet:** Versal adapted deformations.


### g-display-universality — Universal marked parahoric display

**Theorem.** For Hoff’s parahoric local-model datum, assume the integral Hodge embedding conditions, the residual marked Gscr-display and Assumption2.28 (equivalently very-goodness via the preceding comparison). The chosen first-order rigid Gscr-display over R_G represents its marked deformation groupoid on complete Noetherian local O_Ĕ-algebras with residue k. The associated map to ordinary display deformations has the local-model quotient image. This does not assert a representation theorem for all parahorics without the infinitesimal compatibility hypothesis.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/g-display-universality.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/hoff-compatibility; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/tensor-section; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/adapted-interpolation; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/dvr-factorization; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/g-display.

**Construction or proof.** First prove equality of DVR-valued points using interpolation. Lift arbitrary deformations to reduced p-torsion-free bases as in Lemma2.35, detect them by DVR points and then descend the unique G-structure. Record the needed reduced-point detection in the formal-geometry supplier request.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Hoff23, Construction2.27 and Theorem2.36, pp.24–29.

**Atlas planet:** Universal parahoric display.


### etale-adaptedness — Recognition from integral étale tensors

**Theorem.** In the versal adapted setup, let H′/O_K be a marked deformation whose generic Hodge filtration has the prescribed G-conjugacy type. Suppose there are Γ_K-invariant tensors in (T_pH′∨)^⊗ corresponding to the residual crystalline tensors and that their integral tensor type is isomorphic to the fixed (Λ,s_a) type. Then H′ is adapted and every ambient map inducing it factors through R_G. The integral-type assumption ensures the new stabilizer satisfies the tensor comparison hypotheses; rational comparison alone does not provide it.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/etale-adaptedness.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/crystalline-tensor-integrality; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/cocharacter-splitting; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/versal-adapted.

**Construction or proof.** Transport the integral group hypotheses along the assumed type isomorphism, apply integral crystalline tensor comparison and the independently given generic type, then the adapted factorization theorem. This retains the extra hypothesis missing from the printed recognition statement.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KZ25, Proposition3.3.4, p.25; KP18, Proposition3.3.13, pp.181–182.

**Atlas planet:** Étale adaptedness criterion.


## TD.5. Hyperspecial lifts, horizontal loci and specialization

Give the reductive hyperspecial specialization with its residue-field frame hypotheses, the explicit height-one Frobenius matrix and correctly framed special group. Define and identify the corrected rational horizontal Fil⁰ locus and smooth adapted quotient. Evaluate the existing Fontaine envelope on the chosen geometric normal cover, request the missing relative comparison, and produce universal étale tensors. Prove rational tensor-torsor independence, realize admissible isogenous lifts, specialize Tate lattices with their Kottwitz and central-quotient compatibility, and make connections integral after Frobenius pullback. Retain the toral-admissibility and geometric-Hodge supplier obligations.


### hyperspecial-tensor-frame — Hyperspecial Breuil–Kisin tensor frames

**Theorem.** Let k be perfect, K/W(k)[1/p] finite totally ramified, and L a crystalline Z_p-lattice with invariant tensors cutting out a reductive group over Z_p. Their images cut out a reductive group on the imported module 𝔐(L) for every such k. A tensor-preserving frame L⊗𝔖≅𝔐(L) exists if k is separably closed, or if k is finite and the integral group is connected. These additional residue-field hypotheses also accompany the resulting integral W-frame; they are not needed just for reductivity.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-tensor-frame.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bms-kisin-functor; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons; ReductiveGroupsPartII:RG2.3; SchemeAndStackFoundations:SF.1.

**Construction or proof.** Use the imported crystalline-lattice functor and integral reductive tensor-descent theorem. Trivialize its reductive torsor by strict henselianity in the first case and the finite-field connected-group vanishing in the second. Compare φ*𝔐/u with the contravariant crystal.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, Theorem1.1.4 and Corollary1.1.7, pp.7–8.

**Atlas planet:** Hyperspecial tensor frames.


### relative-period-realization — Relative evaluation of the crystalline period construction

**Construction.** Let R be a normal Noetherian integral p-adically complete p-torsion-free ring with R/p nonzero, in the relative comparison range of Kisin17 §1.1.15. In a chosen algebraic closure of Frac R take the directed union R̄ of its normalizations in finite extensions étale over R[1/p], and let R̂̄ be its p-adic completion. Apply CrystallineCohomology:CR.0/fontaine-envelope to R̂̄ to obtain θ and A_cris(R). The notation A_cris(R) here includes the chosen geometric cover; it does not construct a second PD envelope or assert its absolute perfect-field properties for arbitrary R.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/relative-period-realization.

**Direct prerequisites:** CrystallineCohomology:CR.0/fontaine-envelope; SchemeAndStackFoundations:SF.0; CrystallineCohomology:CR.7/dieudonne-evaluation.

**Construction or proof.** Build the normal-cover system and its compatible Galois action, check the hypotheses making θ onto in this setting, and evaluate the existing Fontaine-envelope construction. All PD-envelope algebra remains with CR.0. The needed relative comparison is separately recorded as a gap.

**API.**

- RelativePeriodRealization.evaluateEnvelope (compatibility): The coefficient ring is the existing Fontaine-envelope applied to R̂̄.
- RelativePeriodRealization.galoisAction (structure): Automorphisms of the chosen geometric cover act compatibly with θ, φ and divided powers.
- RelativePeriodRealization.specialize (functoriality): A compatible map of geometric cover systems induces the crystalline coefficient specialization.

**Unit tests.**

- absoluteDVR (computation): For R=W(k), use the completed algebraic integral closure before applying the envelope; do not replace it by W(k) itself.
- coverChoice (compatibility): Changing the geometric closure transports the construction by an isomorphism, with the expected conjugacy of the Galois action.
- nonNormal (non-example): A nonnormal coefficient algebra does not satisfy this input specification without first replacing its cover construction.

**Uses.** TD.5/relative-period-comparison: Provides its coefficient ring using the lower crystalline owner.; TD.5/global-etale-tensors: Evaluates parallel tensors on the geometric cover.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, §1.1.15, p.10.


### toral-admissibility — Weak admissibility of the toral filtration

**Theorem.** In Kisin17 Theorem2.2.3’s isocrystal situation, let T⊂I_p⊂J_δ be a maximal Q_p-torus and let μ_T be a T-cocharacter conjugate to the Hodge cocharacter with torus-average equal to ν_δ⁻¹. Its inverse defines a weakly admissible filtration over a field of definition; the imported weak-admissible-to-admissible theorem makes it admissible. This statement retains the embedding in the σ-centralizer and the average equality, rather than asserting that an arbitrary toral Hodge filtration is admissible.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/toral-admissibility.

**Direct prerequisites:** BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/semistable-finite-height; BunGAndNewtonStrata:BG1/transferred-torus-specialness.

**Construction or proof.** Reduce the degree and subobject inequalities to the torus weights and Newton average in the stated centralizer setting. A proof with this exact normalization from a cleared primary source is not established here: record the toral-admissibility source gap, not an invented Rapoport–Zink quotation.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, Proof of Theorem2.2.3, p.32 (citing Rapoport–Zink Proposition1.21).


### hyperspecial-adapted — Hyperspecial adapted lift

**Definition.** For H₀/k with φ-invariant tensors in D₀=D(H₀)(W), reductive fixer G_W, and Hodge filtration given by μ₀⁻¹, an adapted lift H/O_K has φ-invariant tensors in D(H)(S)^⊗ lifting the given ones, whose schematic fixer is reductive over S and whose images lie in Fil⁰ over O_K. Here S is the imported p-completed Eisenstein PD ring, not 𝔖. The unique rational φ-equivariant identification with D₀⊗S[1/p] takes the residual tensors to the lifted tensors.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-adapted.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum.

**Construction or proof.** Form the tensor condition on the imported PD crystal, then use rational crystalline rigidity to compare its special fibre. Filtration splitting in Rep(G) gives generic G-conjugacy of the lifting cocharacter.

**API.**

- HyperspecialAdapted.pdTensors (data): The lifted tensors are integral in the S-crystal and φ-invariant.
- HyperspecialAdapted.genericFiltration (characterisation): Their Fil⁰ condition is the tensor condition for a filtration induced by a G_K-cocharacter conjugate to μ₀⁻¹.
- HyperspecialAdapted.wittComparison (compatibility): For a common integral tensor type, the PD formulation and TD.2/adapted-deformation agree via the imported crystal/Witt comparison.

**Unit tests.**

- GL (degenerate): Without cutting tensors this is an ordinary lift with the given Hodge type.
- wrongRing (non-example): An element integral only after inverting E(u) in 𝔖 does not qualify as an integral S-crystal tensor.
- linearDual (compatibility): For μ_{p∞} use T_p(H)∨=Z_p(−1), matching contravariant D(H); omitting the Cartier-dual twist gives the wrong comparison.

**Uses.** TD.5/hyperspecial-adapted-quotient: Specifies the functor cut out by the smooth quotient.; TD.5/isogenous-admissible-lift: Specifies the tensor structure after changing an integral lattice.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, §1.1.5–1.1.9, pp.7–9.

**Atlas planet:** Hyperspecial adapted lifts.


### relative-period-comparison — Relative comparison for p-divisible coefficients

**Comparison.** For the normal coefficient rings and geometric cover of the preceding construction, the natural map T_pH⊗A_cris(R)→Hom_{A_cris(R)}(D(H)(A_cris(R)),A_cris(R)) is an isomorphism after inverting the standard period t. Moreover (Fil⁰ A_cris(R)[1/t])^{φ=1}=Q_p in this comparison setting. State naturality, tensor compatibility and the linear-dual variance. Proper smooth cohomology comparisons alone do not supply either assertion for these relative coefficients.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/relative-period-comparison.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/relative-period-realization; CrystallineCohomology:CR.7/dieudonne-evaluation; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-tate-module; CrystallineCohomology:CR.7.

**Construction or proof.** Request the relative finite-projective crystalline coefficient comparison and constants theorem from the lower crystalline owner. The paper invokes Faltings at precisely these two steps; its citation by itself is not a proof from the present suppliers. This input remains the explicit relative-comparison gap.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, (1.1.16) and proof of Lemma1.1.17, pp.10–11.


### hodge-double-coset — Hodge cocharacter and Frobenius double coset

**Theorem.** Suppose a Z_p tensor lattice U identifies with D₀ over W, the fixer is reductive and φ=bσ preserves the tensor family. The special Hodge filtration is induced by a G_W-cocharacter μ₀⁻¹ and, putting υ₀=σ(μ₀⁻¹), one may choose its lift so that b=h·p^{υ₀} with h∈G(W). In particular b∈G(W)p^{υ₀}G(W). The stronger one-sided form is needed for the explicit lift; an arbitrary representative of the conjugacy class need not satisfy it.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hodge-double-coset.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-adapted; ReductiveGroupsPartII:RG2.3; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/perfect-dieudonne.

**Construction or proof.** Identify Fil¹D₀(k) with the kernel of the reduced Frobenius, lift its parabolic and cocharacter over W, and compare the two height-one lattices. Choose the lifted cocharacter in this factorization, rather than fixing an unrelated μ₀ in advance.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, Lemma1.1.12 and proof, p.9.


### explicit-hyperspecial-lift — Explicit height-one adapted lift

**Construction.** In the preceding Z_p-framed setting put 𝔐=σ⁻¹*D₀⊗_W𝔖, identify φ*𝔐 with D₀⊗𝔖 and identify 𝔐 with φ*𝔐 using U. For μ=μ₀ over 𝔖 and c=σ⁻¹(b)μ₀(E(0))∈G(W), give 𝔐 Frobenius matrix c μ⁻¹(E(u)). It is height one, its residual crystal is D₀, its S-filtration is induced by μ⁻¹, and the imported equivalence produces an adapted p-divisible lift over every such O_K. The tensor sections are the constant U-tensors.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/explicit-hyperspecial-lift.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hodge-double-coset; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings.

**Construction or proof.** The one-sided factorization and E(0)/p∈W× give c integral. The two Hodge weights ensure the cokernel is killed by E(u). Check residual Frobenius in the σ⁻¹ pullback convention and transfer the module through the existing height-one equivalence.

**API.**

- ExplicitHyperspecialLift.frobeniusMatrix (data): The matrix is c μ⁻¹(E(u)), with c defined above.
- ExplicitHyperspecialLift.residualCrystal (compatibility): φ*𝔐/u identifies with D₀ with its given Frobenius and tensors.
- ExplicitHyperspecialLift.adaptedLift (constructor): The corresponding H/O_K is hyperspecial-adapted and has the prescribed generic filtration type.

**Unit tests.**

- etale (computation): The weight-zero rank-one case gives invertible Frobenius.
- multiplicative (computation): The rank-one Hodge-weight-one case has cokernel killed by E(u), not Frobenius invertible over 𝔖.
- Ezero (non-example): Replacing μ₀(E(0)) by μ₀(p) without its unit correction can change the residual φ-module; test with E(0)=ap and a≠1.

**Uses.** TD.5/global-etale-tensors: Provides a point where rational tensors are integral.; TD.5/isogenous-admissible-lift: Supplies the reference adapted representation for comparing torsors.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, Proof of Proposition1.1.13, pp.9–10.

**Atlas planet:** Explicit adapted height-one lift.


### integral-connection — Frobenius pullback makes the lattice connection integral

**Theorem.** Let R be a smooth integral F̄_p-algebra with the frame ℛ of Kisin17 §1.4.5, and g∈G(ℛ[1/p]) with g⁻¹bσ(g)∈G(ℛ)p^υG(ℛ). For sufficiently large n, on the σⁿ-twisted base R_n the lattice g(D₀⊗ℛ_n), interpreted through that twist, is stable under F,V and ∇=1⊗d. It therefore comes from a p-divisible group over R_n with a quasi-isogeny to the constant group and the specified conjugate Hodge filtration.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/integral-connection.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/de-jong-dieudonne-equivalence; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hodge-double-coset; ReductiveGroupsPartII:RG2.3; CrystallineCohomology:CR.7/dieudonne-evaluation.

**Construction or proof.** Bound denominators of g⁻¹dg by p^r. Frobenius sends differentials into pΩ, so its n-th pullback makes the connection integral. The double coset gives F,V stability and the filtration. Invoke the existing smooth-base Dieudonné equivalence, rather than re-plan it.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, §1.4.5 and Lemma1.4.6, pp.24–25.


### framed-hyperspecial-data — A correctly framed hyperspecial Dieudonné datum

**Construction.** Over k=F̄_p let Λ be a faithful reductive tensor lattice and b∈G(W[1/p]) with pΛ_W⊂bΛ_W⊂Λ_W. Define D=Λ_W with F=bσ and V=pF⁻¹; its Hodge filtration is ker(F modulo p), equivalently the reduction of σ⁻¹(b⁻¹)pΛ_W. The perfect-field anti-equivalence realizes it by a p-divisible H₀ with this marked crystal. A prescribed μ-filtration can be included only when it equals that computed filtration in the chosen frame; a double coset for b alone does not force that equality. Isomorphisms preserve the marking.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/framed-hyperspecial-data.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/perfect-dieudonne; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hodge-double-coset.

**Construction or proof.** Verify the height-one F,V relations, apply the contravariant equivalence, and compute its Hodge lattice from F. State separately the compatibility needed for an independently specified cocharacter filtration. This corrects the overly rigid simultaneous framing in Zhu’s setup.

**API.**

- FramedHyperspecialData.fromFrobenius (constructor): The bounded b defines the marked p-divisible group through its F,V module.
- FramedHyperspecialData.hodgeLattice (characterisation): The inverse-image Hodge lattice is σ⁻¹(b⁻¹)pΛ_W.
- FramedHyperspecialData.compatibleMu (compatibility): A specified μ-filtration belongs to the same framing exactly under the displayed Hodge-lattice equality.

**Unit tests.**

- etale (computation): b=1 has zero Fil¹.
- multiplicative (computation): b=p has full Fil¹.
- ordinaryFrame (non-example): Conjugating diag(p,1) by a basis change can move Fil¹; fixing the original coordinate line while changing b fails unless the compatibility is rechecked.

**Uses.** TD.5/hyperspecial-adapted: Supplies a marked special group and its actual filtration.; HeckeStacksAndLocalShtukas:HS2: Exports the corrected hyperspecial framing for local deformation moduli.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Zhu17, §3.2, pp.460–461; KZ25, §3.4.1, p.26.


### horizontal-fil0-locus — Horizontal Fil⁰ deformation locus

**Definition.** In the hyperspecial ambient deformation ring R and reductive quotient R_G, complete R[1/p] and R_G[1/p] at the common deformation origin to A and A_G. Parallel transport the constant crystalline tensors by the universal integrable connection to sections σ_a on A. Let A′_G be the largest closed formal subscheme of Spf A on which every σ_a lies in Fil⁰. This is a quotient of the rational completion, not an integral quotient defined by assumed convergent coordinates.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/horizontal-fil0-locus.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-adapted; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/rational-section-tensors; SchemeAndStackFoundations:SF.4; CrystallineCohomology:CR.7/dieudonne-evaluation.

**Construction or proof.** Construct the connection using the φ-stable Lie algebra in the corrected iteration. Formal characteristic-zero integration gives parallel sections. Express their images in the finite locally free quotient by Fil⁰ and take the closed ideal of their coefficients.

**API.**

- HorizontalFil0Locus.parallelTensors (data): Each σ_a is horizontal and has its specified value at the origin.
- HorizontalFil0Locus.quotient (constructor): The Fil⁰ coefficient ideal defines A′_G.
- HorizontalFil0Locus.factorization (universal-property): A continuous A-map to a formal test algebra factors through A′_G exactly when all transported tensors are Fil⁰.

**Unit tests.**

- origin (degenerate): The origin factors through A′_G.
- emptyFamily (degenerate): No tensors impose the zero ideal and A′_G=A.
- LieAlgebra (non-example): Connection coefficients must lie in Lie(G), and need not lie in the Lie algebra of its opposite unipotent; reject the latter replacement.

**Uses.** TD.5/horizontal-locus-equality: Provides the independently defined tensor locus.; TD.5/hyperspecial-adapted-quotient: Repairs the adapted factorization argument.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, Errata E.1–E.3, p.96.


### horizontal-locus-equality — Corrected equality of the horizontal and adapted loci

**Theorem.** With the corrected universal connection, A′_G=A_G. The iterative connection lemma requires its coefficient Lie algebra Lie(H) to be stable under h↦φhφ⁻¹. The universal application has coefficients in Lie(G), not necessarily Lie(U_G°); the deleted original Lemma1.5.3 is not an input. This equality is over the rational completed rings just defined.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/horizontal-locus-equality.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/horizontal-fil0-locus; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/adapted-tangent.

**Construction or proof.** Use Frobenius-compatible dual-number maps to identify the tensor-locus tangent space with the G-orbit tangent space. The corrected connection gives A_G→A′_G, and formal regularity of A_G plus the tangent calculation gives equality. Track the augmentation used for completion.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, Errata E.1 and Lemma E.3, p.96.

**Atlas planet:** Horizontal adapted locus.


### hyperspecial-adapted-quotient — Formally smooth hyperspecial adapted deformation space

**Theorem.** For H₀ and reductive crystalline tensor data as in the hyperspecial definition, the universal marked deformation ring R has a quotient R_G formally smooth over W. For every finite totally ramified K/W[1/p], a W-map R→O_K factors through R_G exactly when its lift is adapted. Its relative dimension is dim G/P_{μ₀}. Use the corrected horizontal locus argument, or the very-good smooth local-model argument after identifying its conventions.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-adapted-quotient.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/horizontal-locus-equality; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/dvr-factorization; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/curve-criterion; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-adapted.

**Construction or proof.** The reductive flag variety gives a smooth local-model quotient. On rational completions use A′_G=A_G and horizontality of φ-invariant tensors, then descend the factorization to the p-torsion-free integral quotient. This replaces the deleted connection argument.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, Proposition1.1.10, p.9 and Errata E.2–E.4, p.96.

**Atlas planet:** Smooth adapted deformation space.


### global-etale-tensors — Étale tensors in the hyperspecial universal family

**Construction.** Assume the relative comparison and constants theorem, and the corrected parallel integral crystalline tensors on the universal family over R_G. They determine rational invariant étale tensor sections on Spec R_G[1/p] whose pullbacks at each DVR-valued point are the usual comparison tensors. Their integral tensor type is constant on the connected family once it is checked at the explicit adapted lift, so the sections are integral with that type throughout.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/global-etale-tensors.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/relative-period-comparison; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-adapted-quotient; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/explicit-hyperspecial-lift; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/horizontal-locus-equality; SchemeAndStackFoundations:SF.1.

**Construction or proof.** Transport the horizontal φ-invariant Fil⁰ tensors through the relative comparison; the constants theorem descends them to Q_p-local-system sections. Test their integral lattice at the explicit lift and use the connected étale-local tensor sheaf to propagate the integral type.

**API.**

- GlobalEtaleTensors.sections (constructor): Produce the rational étale tensor sections from the parallel crystalline sections.
- GlobalEtaleTensors.dvrSpecialization (compatibility): Their pullback at R_G→O_K is the B_cris comparison tensor.
- GlobalEtaleTensors.integrality (characterisation): One integral frame of the connected tensor local system propagates its integral tensor type.

**Unit tests.**

- explicitPoint (compatibility): Specialization at TD.5/explicit-hyperspecial-lift recovers its constant lattice tensors.
- connectedness (non-example): For a disconnected base one point cannot control the integral type on a different component.
- dualVariance (compatibility): The tensor local system is formed from Hom(T_pH,Z_p), consistent with the displayed comparison map.

**Uses.** TD.5/hyperspecial-etale-recognition: Gives the adapted-to-étale implication.; ShimuraVarietiesAndIntegralModels: Supplies the p-divisible part of comparison with global Hodge tensors.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, Lemma1.1.17, pp.10–11 and proof of Proposition1.1.13, pp.9–10.


### hyperspecial-etale-recognition — Hyperspecial étale recognition

**Theorem.** Under the residue-field hypotheses for integral hyperspecial frames and the Z_p tensor datum, a marked lift is hyperspecial-adapted if and only if its comparison tensors are integral étale tensors of that fixed reductive integral type. In that case D(H₀)(W)≅T_pH∨⊗W carries the tensors to each other. The fixed integral type and the frame hypotheses are retained explicitly; the printed covariant Tate-module tensor notation is corrected to the linear dual.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-etale-recognition.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/global-etale-tensors; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-tensor-frame; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/etale-adaptedness; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-adapted.

**Construction or proof.** For an adapted lift use the universal tensor sections; for the converse use the integral tensor comparison, then the corrected adapted factorization. The W-frame is obtained using the stated residue-field torsor triviality.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, Proposition1.1.13 and (1.1.14), pp.9–10.


### realization-tensor-interface — Comparison with geometric realization tensors

**Application.** For a Hodge-type geometric family with its independently constructed absolute-Hodge realization tensors, the p-adic comparison identifies its integral generic étale tensors with the de Rham tensors and the residual contravariant crystalline tensors. The local p-divisible assertions are TD.4/crystalline-tensor-integrality and TD.5/global-etale-tensors. The existence and extension of the global Hodge tensors, including the prime-to-p realizations, belong to the Shimura integral-model owner and are an explicitly unresolved supplier interface, not constructed by a display theorem.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/realization-tensor-interface.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/crystalline-tensor-integrality; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/global-etale-tensors.

**Construction or proof.** Import the geometric family and its Hodge tensors, compare their generic realization maps, and specialize its p-divisible crystal using the stated integral comparison. Record the Blasius–Wintenberger absolute-Hodge comparison as a global supplier gap until its precise owner provides it.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** vanHoften24, §3.1.5–3.1.7, pp.27–28; Kisin17, proof of Proposition1.3.9, p.21.


### comparison-torsor-independence — Rational tensor torsor for conjugate admissible filtrations

**Theorem.** For a connected reductive Q_p-group G and a fixed crystalline G-isocrystal, take two admissible filtrations with G-conjugate defining cocharacters, realized by crystalline representations with their corresponding tensor data. The Q_p-torsor of tensor-preserving isomorphisms of the underlying representations has trivial class. This applies to the two p-divisible representations in Kisin17 Proposition1.1.19; it does not state that every G-torsor is trivial.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/comparison-torsor-independence.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-etale-recognition; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/semistable-finite-height; BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G; ReductiveGroupsPartII:RG2.3.

**Construction or proof.** Use weakly-admissible implies admissible and the Wintenberger torsor-class formula: its class is determined by the fixed isocrystal and the cocharacter coinvariant. Conjugate filtrations give the same class, so their relative isomorphism torsor is neutral. The often cited Corollary4.5.3 is the unnumbered corollary following Proposition4.5.3. To use Wintenberger’s algebraically closed residue setup, restrict the two crystalline representations to a compatible complete extension with algebraically closed residue: their underlying Q_p tensor fibre functors, hence the isomorphism torsor, are unchanged.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Wintenberger97, §4.5.2–Proposition4.5.3 and following unnumbered corollary, pp.1330–1332; Kisin17, proof of Proposition1.1.19, p.11.


### lattice-specialization — Specialization of a tensor-compatible Tate lattice

**Construction.** For an adapted H/O_K with k=F̄_p and a fixed tensor W-frame, let g∈G(Q_p). Let L=Hom_Zp(T_pH,Z_p), with G acting on L. After a finite extension making gL Galois-stable, form the isogenous p-divisible group with dual Tate lattice gL (its Tate lattice is (gL)∨), form its Breuil–Kisin lattice, and reduce at u=0. The inverse notation on Tate modules is interpreted via this dual action. This gives g₀G(W)∈G(W[1/p])/G(W), depending only on gG(Z_p). Changing the initial W-frame changes the map by left multiplication by G(W). The output is a rational-lattice coset; g₀ is not required to lie in G(W).

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/lattice-specialization.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-etale-recognition; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-tensor-frame.

**Construction or proof.** An open stabilizer of the finite-index lattice gives the finite field extension. Apply the existing integral classification and tensor frame, then specialize its matrix. Show independence from further extensions and from right multiplication by G(Z_p).

**API.**

- LatticeSpecialization.specialize (constructor): Produce the rational crystal lattice coset attached to gG(Z_p).
- LatticeSpecialization.quotient (characterisation): Right G(Z_p)-equivalent g give the same output coset.
- LatticeSpecialization.changeFrame (compatibility): Changing the W-frame left-translates all outputs by its element of G(W).

**Unit tests.**

- identity (degenerate): The identity Tate lattice specializes to the residual crystal lattice.
- centralP (computation): For g=p in G_m, the output has the same nonzero valuation; it cannot be represented by an integral unit.
- rightCoset (compatibility): Replacing g by gh with h∈G(Z_p) does not change the lattice or output coset.

**Uses.** TD.5/specialization-kottwitz: Relates the specialized lattice to the ADLV and component invariant.; TD.5/specialization-central-quotient: Controls quotient maps when the quotient Galois image is central.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, §1.2.16–Lemma1.2.18, pp.15–16.


### isogenous-admissible-lift — An admissible filtration produces an adapted isogenous lift

**Construction.** In the hyperspecial Z_p-framed setting and its integral-frame residue-field range, let μ be a G_K-cocharacter conjugate to μ₀ whose inverse induces an admissible filtration on D₀⊗K. There are a finite K′/K with residue k′, a lift H′/O_K′ and a quasi-isogeny over k′ identifying its rational crystal with D₀ and its filtration with μ⁻¹. The new integral lattice is gD₀ with g∈G(W(k′)[1/p]), and g⁻¹bσ(g) lies in G(W(k′))p^{υ₀}G(W(k′)). H′ is adapted for the conjugated integral fixer. The original integral lattice need not remain fixed.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/isogenous-admissible-lift.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-01-is-bt; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/comparison-torsor-independence; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-tensor-frame; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hodge-double-coset.

**Construction or proof.** Use the imported weight-[0,1] admissible-to-p-divisible realization, compare the rational tensor representations by the neutral torsor above, choose an integral lattice after finite extension, and read its crystal as gD₀. The height-one Hodge bound gives the double coset. Extension of the base realization theorem from finite Q_p-extensions to the perfect-residue range is a named gap if its supplier has not provided it.

**API.**

- IsogenousAdmissibleLift.realize (constructor): Produce K′, H′ and the quasi-isogeny with the specified filtration.
- IsogenousAdmissibleLift.lattice (data): The chosen crystal lattice is gD₀ for g over W(k′)[1/p].
- IsogenousAdmissibleLift.conjugatedType (compatibility): The integral tensors cut out gG_{W(k′)}g⁻¹ on this lattice.

**Unit tests.**

- originalFiltration (degenerate): For the explicit reference filtration one may take its adapted lift and the identity quasi-isogeny.
- rationalLattice (non-example): A p-power isogeny may change the integral lattice; requiring g∈G(W(k′)) loses such examples.
- residueExtension (compatibility): A ramified finite extension may be insufficient to trivialize all required integral tensor data; retain the finite extension and its residue k′.

**Uses.** TD.5/toral-admissibility: Realizes the resulting toral filtration.; ShimuraVarietiesAndIntegralModels: Provides the local p-divisible input to special-point lifts.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, Proposition1.1.19 and proof, pp.11–12.


### specialization-kottwitz — Hodge bound and Kottwitz invariant under specialization

**Theorem.** For the specialization map just defined, g₀ belongs to X_{υ₀}(b), and κ_G(g₀)=κ_G(g) in π₁(G)^Γ. The coset is defined up to the previously stated frame change, which has zero Kottwitz invariant. The Frobenius bound is read with υ₀=σ(μ₀⁻¹).

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/specialization-kottwitz.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/lattice-specialization; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hodge-double-coset; ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism; BunGAndNewtonStrata:BG1/family-kottwitz-local-constancy; GeometricSatakeAndFusion:GS0:Witt-geometry.

**Construction or proof.** Height one gives the double coset after crystal specialization. Compare the generic and special Kottwitz classes along the tensor Breuil–Kisin family, using the imported component invariance. This is not the false assertion that the specializing matrix is in G(W).

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, Lemma1.2.18 and proof, pp.15–16.


### specialization-central-quotient — Specialization through a quotient with central Galois image

**Theorem.** Let f:G_Zp→H_Zp be a surjection of reductive groups in the preceding setting. If the quotient Galois representation has image in Z_H(Q_p), the tensor W-frame can be chosen so that f(g) and f(g₀) define the same H(W[1/p])/H(W) coset for every g∈G(Q_p). This conclusion concerns a suitable common frame and quotient cosets, not equality of arbitrarily selected matrices.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/specialization-central-quotient.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/specialization-kottwitz; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bms-kisin-functor; ReductiveGroupsPartII:RG2.3.

**Construction or proof.** Apply the integral unramified period comparison to the quotient tensor representations. Centrality removes the conjugation ambiguity; choose the common frame there and descend its coset identity.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Kisin17, Lemma1.2.19, p.16.


## TD.6. Ordinary lifts and rational symmetries

Import the ordinary σ-straight/Newton-Levi normalization. Prove its connected fixer and central filtration statements; use the central elementary Breuil–Kisin modification for an adapted ordinary lift over each allowed O_K. Lift all of J_b(Q_p) in the isogeny category. Export a separate conditional M-adapted interface for nonordinary basic-Levi applications, retaining its M-valued filtration and corrected very-good compatibility.


### ordinary-tensor-datum — Ordinary tensor datum

**Definition.** Take k=F̄_p, p>2 and the acceptable good tensor local-model datum of TD.2, now requiring that the full fixer equals the connected parahoric. Normalize its σ-conjugacy class to b=σ(ṫ_{μ′}), where t_{μ′} is σ-straight and σ⁻¹(b) is μ_y-ordinary with its required admissible double-coset condition. Let M be the Newton Levi and choose the central M-cocharacter λ̃ lifting the special Hodge filtration as in KZ25 §3.4.2. Its field of definition is retained as part of the datum. Very-goodness is not an extra hypothesis for the explicit ordinary construction.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/ordinary-tensor-datum.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum; BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G; ReductiveGroupsPartII:RG2.3; BunGAndNewtonStrata:BG1/ordinary-class; BunGAndNewtonStrata:BG1/ordinary-straight-translation; BunGAndNewtonStrata:BG1/ordinary-integral-conjugacy.

**Construction or proof.** Import σ-straightness, Newton centralizers and the μ-ordinary normalization. Package the central filtration and tensor lattice; do not define a second Newton stratification or a second ordinary locus.

**API.**

- OrdinaryTensorDatum.newtonLevi (projection): M is the imported centralizer of the Newton cocharacter.
- OrdinaryTensorDatum.centralCocharacter (data): λ̃ is central in M, with the specified Hodge and field-of-definition conditions.
- OrdinaryTensorDatum.forget (compatibility): Forgetting the ordinary normalization returns the marked tensor local-model datum.

**Unit tests.**

- ordinaryGL2 (computation): For the height-two ordinary group M is the diagonal Levi and the two slopes are 0 and 1.
- supersingular (non-example): A height-two supersingular group is not μ-ordinary for the ordinary GL₂ Hodge type.
- components (non-example): A disconnected full fixer cannot be silently substituted for the connected parahoric required here.

**Uses.** TD.6/central-bk-lift: Supplies the central filtration used in the height-one modification.; TD.6/sigma-centralizer-action: Identifies the rational automorphism group of the ordinary lift.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KZ25, §3.4.1–3.4.2, pp.26–27.

**Atlas planet:** Ordinary tensor datum.


### levi-full-fixer — The ordinary Levi has connected full fixer

**Theorem.** For the Newton Levi M and the ordinary datum, its integral model satisfies M(W)=M(W[1/p])∩Gscr(W), and its full fixer is its connected parahoric. Retain the σ-straight ordinary representative and the ambient full-fixer-equals-parahoric assumption. This is the integral Levi statement used to attach its tensor lattice, not a claim that arbitrary Levi fixer component groups vanish.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/levi-full-fixer.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/ordinary-tensor-datum; ReductiveGroupsPartII:RG2.3/parahoric-kottwitz-characterization; ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism.

**Construction or proof.** Use the Newton centralizer’s fixer intersection, compare its Kottwitz kernel with that of G, and use the torsion-freeness statement for the relevant cocharacter quotient. This group-theoretic input is a supplier request in RG2.3, not a second construction of its parahoric model.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KZ25, §3.4.2, pp.26–27.


### central-filtration — Central Hodge filtration in the ordinary Levi

**Theorem.** In the ordinary normalization the special Hodge filtration lifts to an M-valued cocharacter λ̃ central in M, G-conjugate to the prescribed Hodge cocharacter. It is defined over a finite extension of the completed reflex base. For the toral local model of this central type, its chosen point yields an M-invariant direct-summand filtration after every allowed O_K extension.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/central-filtration.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/ordinary-tensor-datum; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/levi-full-fixer; ReductiveGroupsPartII:RG2.3.

**Construction or proof.** Import the σ-straight Levi normalization and its central cocharacter. Use the one-point generic torus orbit and its flat closure to lift the special filtration. The local-model existence statement is retained in the geometry gap.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KZ25, Lemma3.4.3, p.27.


### central-bk-lift — Central ordinary Breuil–Kisin lift

**Construction.** Let K/W(k)[1/p] be finite with the field of definition of λ̃ contained in K. Put 𝔐=σ⁻¹*D₀⊗𝔖 and identify φ*𝔐 with D₀⊗𝔖. Let F⊂φ*𝔐 be the inverse image of the λ̃ Hodge summand modulo E(u). The M-tensor torsor and parahoric purity give an M-compatible identification of this elementary modification with 𝔐. Compose with the residual Frobenius, using λ̃’s centrality, to get a height-one φ-module with residual crystal (D₀,bσ), integral tensors and the desired filtration. The resulting p-divisible group is an adapted ordinary lift.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/central-bk-lift.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/central-filtration; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/levi-full-fixer; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/filtration-lattice; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/filtration-tensor-torsor.

**Construction or proof.** Apply the elementary filtration-lattice tensor-torsor construction to the Newton Levi M and its central Hodge cocharacter. Apply G2’s precise parahoric purity input over 𝔖 and trivialize the extended torsor on the strictly local base. This step precedes construction of a crystalline Galois representation and does not invoke its tensor-frame theorem. Centrality of λ̃ makes the modification M-equivariant. Compose with residual Frobenius, verify the height-one bound, and transfer through the existing integral equivalence to the marked adapted lift.

**API.**

- CentralBkLift.modifiedLattice (constructor): F is the inverse image of the central Hodge filtration modulo E(u).
- CentralBkLift.frobenius (data): The tensor-preserving φ-linear map has height one and prescribed residual bσ.
- CentralBkLift.pDivisibleLift (compatibility): The imported classification yields the adapted lift and its chosen special-fibre identification.

**Unit tests.**

- etaleFactor (computation): The slope-zero factor has invertible Frobenius.
- multiplicativeFactor (computation): The slope-one factor has the E(u) factor and correct Hodge summand.
- noncentral (non-example): If λ̃ is not central in M, the assertion that every M-endomorphism preserves the modification fails, so the construction cannot be used unchanged.

**Uses.** TD.6/ordinary-adapted-lift: Provides the ordinary adapted lift over each allowed O_K.; TD.6/sigma-centralizer-action: Centrality carries rational M-symmetries through the modification.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KZ25, Theorem3.4.5 and proof, pp.27–28.

**Atlas planet:** Central ordinary lift.


### ordinary-adapted-lift — Existence of the adapted ordinary lift

**Theorem.** For an ordinary tensor datum with assumptions (A) acceptable local model, (B) good embedding, and full fixer equal to its connected parahoric, every finite K/W(k)[1/p] containing the field of definition of λ̃ admits a (Gscr,μ_y)-adapted lift of H₀. No very-goodness hypothesis is imposed: this is the explicit central construction, not an application of the versal theorem with assumption (C) dropped.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/ordinary-adapted-lift.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/central-bk-lift; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/adapted-deformation.

**Construction or proof.** Check that the lift’s integral φ-invariant tensors and generic filtration satisfy exactly the independently stated adaptedness definition. Preserve the chosen field of definition and the special-fibre marking.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** KZ25, Theorem3.4.5 and proof, pp.27–28.

**Atlas planet:** Adapted ordinary lift.


### sigma-centralizer-action — Rational σ-centralizer action on the ordinary lift

**Theorem.** The explicit ordinary adapted lift can be chosen so that every element of J_b(Q_p), the σ-centralizer of b, lifts to a self-quasi-isogeny over O_K with its prescribed special-fibre action. The assertion is in the isogeny category. It does not assert integral automorphisms for all of J_b(Q_p), a unique lift, or an action on an arbitrary adapted deformation.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/sigma-centralizer-action.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/ordinary-adapted-lift; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/central-bk-lift; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible; BunGAndNewtonStrata:BG0/sigma-centralizer-J-b.

**Construction or proof.** The basic M-isocrystal identifies J_b with the relevant inner form of M. Its rational endomorphisms preserve the central λ̃ filtration, hence the height-one module after inverting p. Full faithfulness of the integral classification up to isogeny transfers them to quasi-isogenies of the lift.

**Check.** For a central element p, verify that the lift gives a quasi-isogeny and not a unit automorphism.

**Sources.** KZ25, Theorem3.4.5 and proof, pp.27–28.

**Atlas planet:** Ordinary σ-centralizer action.


### levi-adapted-interface — Adapted lift compatible with a specified Levi filtration

**Application.** Let M⊂G be a reductive subgroup containing b, whose fixer intersection is the specified parahoric, and suppose the special Hodge filtration lifts to an M-valued cocharacter G-conjugate to μ_y. If its M-embedding has the corrected very-good infinitesimal compatibility and the tensor-frame hypotheses, an M-adapted lift is also G-adapted and its étale tensors extend the G-tensor family. This supplies the p-divisible input used by van Hoften; existence of that M-filtration and any global component-surjectivity theorem are separate inputs.

**Declaration:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/levi-adapted-interface.

**Direct prerequisites:** FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/versal-adapted; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/crystalline-tensor-integrality; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/etale-adaptedness; ReductiveGroupsPartII:RG2.3.

**Construction or proof.** Enlarge the invariant tensor family to cut out M. Apply the corrected versal theorem for M, compare the M and G local-model filtration maps, and forget the extra tensors. This retains the filtration assumption in Zhou; the general basic-Levi application cannot be inferred just from the μ-ordinary case.

**Check.** Prove the stated comparison with all displayed base rings and conventions; expose the actual maps, not only an existence proposition.

**Sources.** Zhou20, Author arXiv v2, §5.5, pp.18–19; vanHoften24, AppendixA.4.3, pp.64–65.


## Supplier requests and explicit gaps


**ReductiveGroupsPartII:RG2.3.** Import current RG2.3.5 lattice-chain stabilizers, hodge-type fixer immersions, tame hyperspecial realization, paired classical lattices and scalar-enlargement models. Add finite cutting-tensor presentations for the specified smooth full fixers, ordinary Levi fixer intersections, and the separately identified purity/component extension G2. The existing algebraic lattice constructions are not new targets here. Consumers: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/filtration-tensor-torsor, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/nonexceptional-embedding, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/polarized-chain, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/D-PEL, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/D-central-cover, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/A-standard, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/A-central-cover, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/levi-full-fixer.


**SchemeAndStackFoundations:SF.1.** Import fpqc tensor-frame descent, affine torsor representability, and extension of sections over complete local bases. Add the exact integral Tannakian recognition statement G4 and the E-adic Beauville–Laszlo patching statement used in the lattice proof; general torsor representability is already supplied by SF.1/torsor-representability. Consumers: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/filtration-tensor-torsor, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/integral-tensor-frame, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/tensor-section.


**SchemeAndStackFoundations:SF.4.** Export completed Grassmannian charts, formal smoothness and prorepresentability for marked deformation functors, excellent local completion/generic regularity comparisons, and DVR-point detection on the reduced p-torsion-free lifting bases in Hoff Lemma2.35. The tangent interpolation proof uses separatedness and contraction of ideals explicitly. Consumers: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/universal-filtered-pair, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/orbit-deformation-ring, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/dvr-factorization, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/horizontal-fil0-locus, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/g-display-universality.


**SchemeAndStackFoundations:SF.0.** Supply normalization in directed finite generic-étale extensions and its compatible maps. For universal tensor descent provide G3’s normal-section and pointwise-flatness criteria with their exact hypotheses; Hartogs itself is imported from the existing fine nodes. Consumers: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/relative-period-realization, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor.


**CrystallineCohomology:CR.7.** Extend the existing arithmetic coefficient interfaces to G5’s relative p-divisible comparison and constants theorem on the chosen generic-étale normal cover. Existing fine nodes supply Dieudonné evaluations and GM; neither is claimed to contain this new result. Consumers: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/relative-period-comparison, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/global-etale-tensors.


**FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-01-is-bt.** Extend the existing finite-K/Q_p admissible-to-p-divisible realization to finite extensions of W(k)[1/p] with perfect k as specified in G6. Consumers: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/isogenous-admissible-lift.


**GeometricSatakeAndFusion:GS0:Witt-geometry.** Import the bounded perfect Witt Grassmannian and relative-position lattice interface for TD.5/specialization-kottwitz. This request does not ascribe G1’s absent integral local-model theorems to GS0. Consumers: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/specialization-kottwitz.


### G1. Integral local-model geometry and good-embedding existence

The briefs name GeometricSatakeLocalModelsPartII, which has no registered stages or packet in this checkout. GS0 supplies bounded/Witt Grassmannians, not the required normal flat parahoric local models, minuscule Hodge immersions, reduced fibres, generic regularity or tangent spanning by curves. Supply these with the precise KPZ26 standard assumptions and their restriction/adjoint comparisons. Until then TD.2 takes a LocalModelDatum with these named properties as input; TD.3 existence conclusions and TD.6 central-filtration specialization retain this obligation.

Needed by FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/orbit-deformation-ring, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/nonexceptional-embedding, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/D-PEL, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/A-standard, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/dvr-factorization, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/central-filtration.


### G2. Parahoric purity with full-fixer component descent

Current RG2.3 owns integral stabilizers and lattice realizations, but the precise extension/vanishing theorem needed here is not a supplied node. Establish H¹(SpecO_E[[u]] minus its closed point,𝒫)=1 in the strictly local perfect-residue range for connected parahoric 𝒫, or extension plus the needed base torsor triviality; keep Anschütz22 Proposition10.3’s coefficient-ring hypotheses. Treat the generic-trivial component torsor separately for a disconnected full fixer. Also export the patching theorem used for the E-adic lattice. The obsolete routed owner ReductiveGroupsPartIIGrothendieckSerre cannot be cited as an existing supplier.

Needed by FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/filtration-tensor-torsor, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/integral-tensor-frame, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/central-bk-lift.


### G3. Normal-base tensor-section and flatness descent

KP18 Corollary3.2.11 invokes de Jong7.3.6 to extend integral crystalline sections over the normal base and Raynaud–Gruson4.1.2 to establish flatness of their tensor-isomorphism scheme. Pointwise tensor integrality alone does not prove the latter. Extract the exact normality, finite-presentation, flattening and completion hypotheses and attach the two distinct supplier statements before claiming the universal tilde tensor torsor is proved.

Needed by FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/neutral-closure.


### G4. Integral Tannakian representability on the punctured disc

The required Broshi-type theorem identifies the tensor-isomorphism functor of an exact faithful Rep(𝒢) functor on the Dedekind punctured spectrum with a 𝒢-torsor, using finite-rank stable pieces of its coordinate algebra. SF.1 supplies torsor descent and representability of a torsor already known to be a torsor, not this recognition theorem. Provide the exact base and group hypotheses; do not infer it from rational Tannaka duality.

Needed by FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/integral-tensor-frame, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-tensor-frame.


### G5. Relative crystalline period comparison and constants

CR.0/fontaine-envelope supplies the ring and CR.7 supplies evaluated coefficients. Neither supplies Faltings’ relative p-divisible comparison after t inversion nor (Fil⁰ A_cris(R)[1/t])^{φ=1}=Q_p for Kisin17 §1.1.15’s normal coefficient rings. Give a primary-source proof with its exact ring range and geometric-cover hypotheses, and a lower-owner extension. A proper smooth cohomology comparison cannot substitute for it. Parallel universal crystalline tensors must be constructed using the corrected connection before this comparison is applied.

Needed by FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/relative-period-comparison, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/global-etale-tensors.


### G6. Perfect-residue extension of admissible-to-Barsotti–Tate realization

The imported R07.4/crystalline-01-is-bt target is explicitly for finite K/Q_p. TD.5/isogenous-admissible-lift needs finite K/W(k)[1/p] with perfect residue k, including k=F̄_p. Extend that existing owner’s theorem to this range, or prove and record the required descent argument there, retaining the contravariant weight convention.

Needed by FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/isogenous-admissible-lift.


### G7. Toral weak admissibility in the centralizer normalization

Kisin17 p.32 cites Rapoport–Zink Proposition1.21 for the Newton-average criterion. No cleared copy of that book was available in the library index, and no uncleared copy was used. Wintenberger97 proves a torsor-class formula, which does not by itself establish all subobject inequalities in this criterion. Supply a freely readable primary proof or a cleared source and check the inverse-cocharacter convention.

Needed by FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/toral-admissibility.


### G8. Global Hodge-realization input

The six tensor routes include vanHoften24 M04 and Kisin17’s Blasius–Wintenberger comparison. These are global Hodge tensor statements, not consequences of integral displays. Existing ShimuraVarieties V6 plans canonical-model inheritance, not their integral de Rham/étale extension and comparison. Assign an integral-model continuation with the absolute-Hodge comparison and specialization theorem; this packet owns only its p-divisible comparison interface.

Needed by FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/realization-tensor-interface.


### G9. Very-good Levi input in the nonordinary application

vanHoften24 AppendixA.4.3 invokes Zhou’s M-valued filtration and adapted lifting. The v2 §5.5 assumption was read directly; its older adapted-lift construction does not remove the infinitesimal tensor compatibility subsequently corrected by KPZ26. For that general basic-Levi application, prove the specified M-filtration and very-good compatible embedding under the application’s very-special/tame hypotheses. The explicit μ-ordinary theorem does not cover every basic Levi point.

Needed by FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/levi-adapted-interface.


## Source corrections

The following are independent-review-confirmed paraphrases, with no source excerpts. Proof-hypothesis gaps below do not assert counterexamples to the printed conclusions.

**E01 — KP18 Lemma3.1.9, p.166; KPZ26 Remark5.1.17, p.52; editions as specified in sources and sourceVersions.** The old construction treats the Frobenius-image comparison square as determining c. Construct c using relative-frame factorization; retain diag(1,p) only as its comparison map. That matrix has a kernel after p-torsion base change, so its square cannot determine the lower-left block. Published correction: KPZ26 §§5.1–5.2.

Review: confirmed. Confirmed against KP18 Lemma3.1.9 and KPZ26 Lemma5.1.15/Remark5.1.17: the p-torsion comparison square does not determine c; relative-frame factorization does.

**E02 — KP18 Lemma3.1.17, p.169; KPZ26 §7.3.1(2), p.86; editions as specified in sources and sourceVersions.** The convergence argument uses a localization topology for which completeness was assumed. Use the p-adic lattice topology on Ŵ(A)[1/p] and the logarithmic contraction proof. Convergence in the original incomplete topology does not justify the limiting section. Published correction: KPZ26 §7.3.1(2).

Review: confirmed. Confirmed by the explicit published topology correction in KPZ26 §7.3.1(2), p.86 and its contraction argument.

**E03 — KP18 §3.2.12, p.173; KPZ26 §7.1.4(1), p.73 and Definition5.2.5, p.54; Hoff23 Assumption2.28, p.25; editions as specified in sources and sourceVersions.** The tensor section is assigned the prescribed first-order comparison without an added compatibility condition. Require very-goodness, equivalently the explicit G-compatibility of c. Integral tensor torsors do not imply every underlying GL comparison preserves their reductions. Published correction: KPZ26 §7.1.4(1), p.73 explicitly covers KP18 and KZ25; §7.3.2, p.87 treats the related Pappas argument. Hoff23 states the compatibility as Assumption2.28.

Review: confirmed. Confirmed by KPZ26 §7.1.4(1), p.73, which explicitly identifies the omitted first-order condition in KP18 and KZ25. Corrected the locator; smooth torsor lifting applies only after c preserves tensors.

**E04 — KP18 Proposition3.3.13, pp.181–182; KZ25 Proposition3.3.4, p.25; editions as specified in sources and sourceVersions.** The recognition criterion mentions corresponding étale tensors without requiring their fixed integral stabilizer type. Require an isomorphism of the integral tensor lattice with the fixed smooth full-fixer type, as in TD.4/etale-adaptedness. Rational identification and residual tensors do not prove smoothness of the new integral stabilizer. The proof invokes KP18 Proposition3.3.8, respectively KZ25 Proposition3.3.2, for the new tensor lattice without separately checking that hypothesis. This is a proof-hypothesis gap, not a demonstrated counterexample to either conclusion. Recorded in the routed independent source review; no further correction established in the versions read.

Review: confirmed. Confirmed only as the proof-hypothesis gap now stated: the recognition proofs apply a smooth-integral-stabilizer result to a new tensor lattice. Fixed integral type is a sufficient correction; no falsity of the printed conclusion is established.

**E06 — Kisin17 Errata E.1, p.96, correcting Kisin2010 §1.5; editions as specified in sources and sourceVersions.** The earlier connection iteration omitted φ-stability and put universal coefficients in too small a Lie algebra. Assume Lie(H) stable under conjugate Frobenius, use Lie(G) for the universal connection, and remove the deleted Lemma1.5.3. Iteration must stay in its Lie algebra; the smaller opposite-unipotent algebra need not contain the connection. Published correction: Kisin17 Errata E.1–E.4.

Review: confirmed. Confirmed directly against Kisin17 Errata E.1–E.4, p.96, including Frobenius-stability, Lie(G) coefficients and deletion of Lemma1.5.3.

**E07 — Kisin17 Proposition1.1.13 and (1.1.14), pp.9–10; Proposition1.1.19, pp.11–12; editions as specified in sources and sourceVersions.** The integral W-frame is used without repeating its residue-field torsor-triviality hypotheses. Retain k separably closed, or k finite and the reductive integral group connected, when that frame theorem is applied. Theorem1.1.4(2) has these hypotheses; part(1) only proves reductivity and cannot replace the missing frame. The later invocation does not repeat or establish the needed torsor triviality for a general perfect residue field. This finding records the unsupported use, not a counterexample to the proposition. Identified by the routed independent extraction; no published extension found in the versions read.

Review: confirmed. Confirmed as an unverified hypothesis in the cited proof: Theorem1.1.4(2)/Corollary1.1.7 impose residue-field conditions absent from the general-perfect-field application. The roadmap safely retains those conditions.

**E08 — Kisin17 Proposition1.1.13, p.9, and inherited notation; footnote8, p.7; editions as specified in sources and sourceVersions.** Several tensor formulas use a covariant Tate-module expression for a contravariant crystal. Use Hom_Zp(T_pH,Z_p)=T_p(H*)⊗Z_p(−1). The multiplicative rank-one case tests both the direction and the Tate twist. Kisin17 footnote8 prints the twist correction to Kisin2010; TD conventions apply it consistently.

Review: confirmed. Confirmed by the dual-Tate comparison and footnote8. For μ_{p∞}, the contravariant crystalline representation is the linear dual Z_p(−1); a covariant Tate lattice reverses this normalization.

**E09 — Zhu17 §3.2, pp.460–461; editions as specified in sources and sourceVersions.** The framing fixes an arbitrary bounded b and an independently chosen μ-weight filtration simultaneously. Compute the Hodge lattice σ⁻¹(b⁻¹)pΛ_W; require the prescribed filtration to equal its reduction, or adjust b and the frame together. The double coset fixes relative position, not the chosen coordinate subspace. A GL₂ basis change moves that subspace. Explicitly, for GL₂ and μ(z)=diag(z,1), b=[[p,0],[p−1,1]] is integrally σ-conjugate to diag(p,1), but the reduction of p b⁻¹Λ has line k(e₁+e₂), not ke₁. Routed source review identifies this compatibility issue; no correction established in the source read.

Review: confirmed. Confirmed by the explicit GL₂ calculation in the reason: the double coset does not fix the coordinate Hodge line. The source’s simultaneous framing requires compatibility or a joint choice of b and μ.

**E10 — Kisin17 proof of Lemma1.2.18, p.16; editions as specified in sources and sourceVersions.** The proof places g₀ in G(O_L) and later the matrix g̃ in G(𝔖), although it is a change between rational lattices. Use g₀∈G(W[1/p]) and g̃∈G(𝔖[1/p]); the output is the coset g₀G(W). Integrality of a lattice relative to itself does not make its change matrix integral relative to the original lattice. For a scalar p in G_m its Kottwitz invariant is1, incompatible with an integral unit. The same scalar p also has no inverse integral over 𝔖, so the later G(𝔖) membership has the same localization omission. The surrounding statement and construction require the rational group.

Review: confirmed. Confirmed both localization omissions in the proof on p.16. The scalar-p example detects the incorrect integral-group memberships while preserving the rational-coset statement.

**Edition and scaling note.** KP18 Lemma3.2.9 and (3.2.10), pp.172–173: the proof computes the Eisenstein-scaled image as the p-scaled lattice. The useful formula is φ(E([π]))=p times a unit. This scaling check is not a claim of a printed unit misstatement.

**Edition and scaling note.** vanHoften24 AppendixA.4.3, pp.64–65 uses published Zhou numbering. The author arXiv v2 read here instead supplies the lift construction in §5.5, pp.18–19, with its explicit M-valued filtration-lift assumption. Its Definition6.11 is unrelated. This is an edition reconciliation, not an error attributed to the published citation.

## Route coverage and separate continuations

Every routed tensor item appears below once, with its precise target assignments. The machine-readable packet carries the same ledger. Imported targets are dependencies, not duplicate declarations.


**PAPER-KISIN-ZHOU-25 (19 items).**

- D01 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum.
- D02 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/orbit-deformation-ring.
- D03 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/zink-ring.
- D04 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display.
- D05 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/adapted-deformation.
- D06 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor.
- D07 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good.
- D08 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-family-independence.
- D09 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/tensor-section.
- D10 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/versal-adapted.
- D11 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/crystalline-tensor-integrality.
- D12 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/cocharacter-splitting.
- D13 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/cocharacter-splitting.
- D14 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/etale-adaptedness.
- D15 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/levi-full-fixer.
- D16 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/central-filtration.
- D18 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/central-bk-lift.
- D19 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/ordinary-adapted-lift.
- D20 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/sigma-centralizer-action.

**PAPER-ZHU-17 (3 items).**

- R01 → CrystallineCohomology:CR.7/dieudonne-evaluation, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/perfect-dieudonne.
- R02 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/framed-hyperspecial-data.
- gabber-dieudonne-over-perfect-rings → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/perfect-dieudonne.

**PAPER-VANHOFTEN-24 (6 items).**

- S04 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/height-one-shtuka.
- S05 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/perfect-dieudonne.
- M04 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/realization-tensor-interface.
- D01 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/hoff-compatibility.
- A24 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/levi-adapted-interface.
- A25 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.6/levi-adapted-interface.

**PAPER-KISIN-PAPPAS-ZHOU-26 (63 items).**

- F01 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/zink-ring.
- F02 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/frame.
- F03 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/normal-pair.
- F04 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-functor.
- F05 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-base-change.
- F06 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-frobenius-map.
- F07 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/relative-frame.
- F08 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/relative-comparison.
- F34 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/connection-comparison.
- F09 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display.
- F10 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/connection-comparison.
- F11 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/universal-display.
- F12 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum.
- F13 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/orbit-deformation-ring, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/horizontal-tensors.
- F14 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor.
- F15 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good.
- F16 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-family-independence.
- F17 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good-unramified.
- F18 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/invariant-endomorphisms.
- F19 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/centralizer-very-good.
- F20 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/centralizer-very-good.
- F21 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/summand-very-good.
- F22 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/isomorphic-sums.
- F23 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/product-very-good.
- F24 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/frame, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/curvewise-horizontal.
- F25 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/power-series-integrality.
- F26 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/curvewise-horizontal.
- F27 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/curve-criterion.
- F28 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/curve-criterion.
- F29 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/arithmetic-criterion.
- F30 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/neutral-closure.
- F32 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display-classification.
- V03 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/nonexceptional-embedding.
- V04 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/polarized-chain.
- V05 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/polarized-chain.
- V07 → ReductiveGroupsPartII:RG2.3, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/D-PEL.
- V08 → ReductiveGroupsPartII:RG2.3, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/D-PEL.
- V09 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/D-PEL.
- V10 → ReductiveGroupsPartII:RG2.3, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/D-central-cover.
- V11 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/D-central-cover.
- V12 → ReductiveGroupsPartII:RG2.3, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/A-standard.
- V13 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/A-standard.
- V14 → ReductiveGroupsPartII:RG2.3, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/A-central-cover.
- V15 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/A-central-cover.
- S02 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/adapted-deformation, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/versal-adapted.
- E02 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/rational-section.
- E04 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/hoff-compatibility.
- F33 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good-lattice-chain.
- dieudonne-witt-pairs-and-tilde-base-change → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/normal-pair, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-base-change.
- dieudonne-frames-square-zero → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/relative-frame, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/connection-comparison.
- psi-constant-modulo-a → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/constant-first-order.
- horizontal-tensors-at-x → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/horizontal-tensors.
- very-good-lattice-chain → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good-lattice-chain.
- very-good-unramified-O → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/very-good-unramified.
- cutting-tensors-exist → ReductiveGroupsPartII:RG2.3.
- kp18-3-2-5-filtration-stable → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/invariant-endomorphisms.
- zink-log-coordinates-square-zero → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/pd-logarithm.
- tensor-torsor-disconnected-G → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/neutral-closure.
- remark-6-1-10-excluded-types → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/nonexceptional-embedding.
- thm-6-1-1-galois-stable-lattice-and-chain → ReductiveGroupsPartII:RG2.3.
- tame-descent-of-duals → ReductiveGroupsPartII:RG2.3.
- orthogonal-in-symplectic-scheme-intersection → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.3/D-PEL, ReductiveGroupsPartII:RG2.3.
- versal-deformation-adaptedness → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/versal-adapted.

**PAPER-KISIN-PAPPAS-18 (52 items).**

- D01 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/zink-ring.
- D02 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display.
- D03 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/tilde-functor.
- D04 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display-base-change.
- D05 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display-classification.
- D06 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/universal-filtered-pair.
- D08 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/universal-display.
- D09 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/dvr-tangent.
- D10 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/rational-section.
- D11 → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons.
- D12 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum.
- D13 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/orbit-deformation-ring, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/cocharacter-splitting.
- D14 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/filtration-lattice.
- D15 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/filtration-tensor-torsor.
- D16 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/bk-witt-lattice-comparison.
- D17 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor.
- D18 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/tensor-section.
- D19 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/rational-section-tensors.
- D20 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/adapted-tangent.
- D21 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/dvr-factorization.
- D22 → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bms-kisin-functor.
- D23 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/punctured-exactness.
- D24 → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bms-kisin-functor.
- D25 → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons.
- D26 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/kottwitz-image.
- D27 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/integral-tensor-frame.
- D28 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/integral-tensor-frame.
- D29 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/crystalline-tensor-integrality.
- D30 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/cocharacter-splitting.
- D31 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/etale-adaptedness.
- normal-decomposition → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/normal-pair.
- display-base-change-and-deformation → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.0/display-base-change, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/display-deformations.
- kp18-lemma-3-1-9 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/connection-comparison.
- psi-constant-mod-a → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/constant-first-order.
- zink-thm-3-extension → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/display-deformations.
- zink-thm-4-deformations → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/display-deformations.
- deformation-functor-notation → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/dvr-tangent.
- breuil-prop-5-1-3 → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons.
- kisin10-lemma-1-4-5-g-splitting → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/cocharacter-splitting.
- component-group-sequence-3-2-7 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/filtration-tensor-torsor.
- de-jong-integrality-normal-7-3-6 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor.
- raynaud-gruson-flatness-4-1-2 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tilde-tensor-torsor.
- display-deformations-over-dual-numbers-3-2-16 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/adapted-tangent.
- wa-tensor-strictness → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/adapted-tangent.
- tangent-modules-def-G → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/adapted-tangent.
- regularity-of-RG-generic-fibre → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/orbit-deformation-ring, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/dvr-factorization.
- interpolating-display-over-OK-T → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/adapted-interpolation.
- kisin-module-tensors-3-3-3 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/crystalline-tensor-integrality.
- broshi-tannakian-torsors → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/integral-tensor-frame.
- crystalline-tensors-and-standing-assumptions-3-3-7 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/crystalline-tensor-integrality.
- group-over-W-3-3-9 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/cocharacter-splitting.
- etale-cycle-deformation-setup-3-3-11 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/etale-adaptedness.

**PAPER-KISIN-17 (36 items).**

- D01 → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings.
- D02 → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules.
- D03 → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bms-kisin-functor.
- D04 → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons.
- D05 → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bms-kisin-functor.
- D06 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-tensor-frame.
- D07 → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons.
- D08 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-adapted.
- D09 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-adapted-quotient.
- D10 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-etale-recognition.
- D11 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/relative-period-realization.
- D12 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/relative-period-comparison, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/global-etale-tensors.
- D13 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/explicit-hyperspecial-lift.
- D14 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/isogenous-admissible-lift.
- D15 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/specialization-kottwitz.
- D16 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/specialization-central-quotient.
- S06 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/integral-connection.
- E01 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/horizontal-locus-equality.
- E02 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/horizontal-fil0-locus.
- E03 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/horizontal-fil0-locus.
- E04 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/horizontal-locus-equality.
- E05 → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-adapted-quotient.
- D07a → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-tensor-frame, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/cocharacter-splitting.
- D10a → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hodge-double-coset.
- tensor-algebra-and-crystalline-tensors → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bms-kisin-functor.
- tensors-cut-out-flat-subgroups → ReductiveGroupsPartII:RG2.3.
- S-module-of-a-BT-module → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons.
- rational-crystal-rigidity-for-deformations → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.1/rational-section, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-integral-comparisons.
- adapted-filtration-conjugacy → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hyperspecial-adapted, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.4/cocharacter-splitting.
- Zp-structure-and-Frobenius-element → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.2/tensor-datum, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/hodge-double-coset.
- isogeny-category-and-quasi-isogeny → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible.
- p-divisible-group-from-admissible-filtration → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-01-is-bt.
- wintenberger-torsor-triviality → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/comparison-torsor-independence.
- blasius-wintenberger → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/realization-tensor-interface.
- dejong-dieudonne-over-smooth-base → FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/de-jong-dieudonne-equivalence.
- rz-weak-admissibility → FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII:TD.5/toral-admissibility.

**Split: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, LubinTateFormalModulesAndQuasiCanonicalLifts, FiniteFlatGroupsPartIIPeriodsOfDivisibleModules.** The ten briefs contain three independent continuations. Tensor displays, corrected deformation theory and ordinary lifts form this packet; rank-one formal-module reciprocity and universal-cover period geometry need independent carrier developments. Keep TD.0–TD.6 here, resolving the candidate name FiniteFlatGroupsWithTensorsPartII to this issue’s canonical id. Create LubinTateFormalModulesAndQuasiCanonicalLifts with layers for O_E formal modules and reciprocity, explicit rank-one Breuil–Kisin/Dieudonné realizations, Honda endomorphisms and quasi-canonical lifts, and the Lubin–Tate boundary pairing/cokernel interface. Retain all 33 routed IDs in splitRouteLedger. Create FiniteFlatGroupsPartIIPeriodsOfDivisibleModules with layers for π-divisible O-modules over perfect rings, coefficient displays, universal covers and rigidity, formal affine/vector objects, flat connections and quasi-logarithms, universal extensions, finite-dimensional period spaces and admissible/weakly admissible period maps, and their modification/vector-bundle comparisons. Retain all 153 routed IDs in splitRouteLedger. Both import the base R07 classification and current upstream formal geometry; neither is a claim of a completed blueprint.


**Rescope: GeometricSatakeAndFusion, GeometricSatakeLocalModelsPartII.** The routed local-model supplier name has no registered stages; the current GS0 Witt geometry is strictly weaker than the geometry required here. Register the proposed local-model continuation with normal flat minuscule local models, good integral Hodge embeddings, local-model adjoint and unramified comparisons, the reduced classical special-fibre tangent-spanning theorem, and central-torus point specialization. G1 lists consuming targets. Keep all display/tensor consequences in TD.2–TD.6.


**Rescope: ReductiveGroupsPartII, ReductiveGroupsPartIIGrothendieckSerre.** Current main already plans the algebraic lattice and fixer constructions. This packet imports them and requires the punctured parahoric purity extension G2. Register a new continuation of ReductiveGroupsPartII for the precisely scoped parahoric purity/component result and modern Anschütz input; ReductiveGroupsPartIIGrothendieckSerre is the routed candidate name, not an existing supplier. Keep current upstream ReductiveGroupsPartII unchanged. Do not duplicate current RG2.3.5’s lattice-chain stabilizers, tame hyperspecial realization, paired orthogonal/quaternionic lattices or scalar enlargements.


**Rescope: CrystallineCohomology.** The lower crystalline owner supplies Fontaine envelopes and evaluated coefficient crystals, but relative p-divisible period comparison is additional mathematics. Add G5’s normal-base geometric-cover comparison and constants theorem to the arithmetic coefficient continuation. Keep the actual Fontaine-envelope carrier in CR.0, and evaluated Dieudonné crystals in CR.7. No dependency on the higher PadicHodgeTheory comparison stage is introduced.


**Rescope: ShimuraVarieties.** Global absolute-Hodge realization tensors in two routes exceed the current canonical-model stages. Use the Shimura integral-model continuation for G8’s de Rham, p-adic and prime-to-p tensor extensions and absolute-Hodge comparison. Import TD.5/realization-tensor-interface as its p-divisible bridge; do not define global Shimura models inside a finite-flat roadmap.


**Retained for LubinTateFormalModulesAndQuasiCanonicalLifts: PAPER-BURUNGALE-KOBAYASHI-OTA-21.** PAPER-BURUNGALE-KOBAYASHI-OTA-21/lt-module, PAPER-BURUNGALE-KOBAYASHI-OTA-21/lt-tate, PAPER-BURUNGALE-KOBAYASHI-OTA-21/lt-delta, PAPER-BURUNGALE-KOBAYASHI-OTA-21/local-dihedral, PAPER-BURUNGALE-KOBAYASHI-OTA-21/elliptic-lt-comparison, PAPER-BURUNGALE-KOBAYASHI-OTA-21/honda-lift, PAPER-BURUNGALE-KOBAYASHI-OTA-21/formal-module-deformation, PAPER-BURUNGALE-KOBAYASHI-OTA-21/lattice-isogeny, PAPER-BURUNGALE-KOBAYASHI-OTA-21/quasicanonical-lift, PAPER-BURUNGALE-KOBAYASHI-OTA-21/quasicanonical-field, PAPER-BURUNGALE-KOBAYASHI-OTA-21/ringclass-local-tower, PAPER-BURUNGALE-KOBAYASHI-OTA-21/lt-lift-identification.


**Retained for LubinTateFormalModulesAndQuasiCanonicalLifts: PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18.** PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/lt-module, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/lt-bk, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/lt-realization, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/special-line, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/special-line-rank, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/special-rank, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/special-inert, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/special-ramified, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/denominator-torsor, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/denominator-existence, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/obstruction, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/obstruction-lift, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/depth-shift, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/depth-one-obstructed, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/lift-depth, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/rev-the-valuation-ord-e-on, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/rev-filtered-module-of-the-lubin, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/rev-lubin-tate-description-of-local, PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/rev-adic-order-of-a-special.


**Retained for LubinTateFormalModulesAndQuasiCanonicalLifts: PAPER-FARGUES-SCHOLZE-21.** PAPER-FARGUES-SCHOLZE-21/c2a-constr-lubin-tate-G, PAPER-FARGUES-SCHOLZE-21/c2a-fact-LT-log-exact-sequence.


**Retained for FiniteFlatGroupsPartIIPeriodsOfDivisibleModules: PAPER-FARGUES-FONTAINE-18.** PAPER-FARGUES-FONTAINE-18/129, PAPER-FARGUES-FONTAINE-18/393, PAPER-FARGUES-FONTAINE-18/416, PAPER-FARGUES-FONTAINE-18/417, PAPER-FARGUES-FONTAINE-18/418, PAPER-FARGUES-FONTAINE-18/419, PAPER-FARGUES-FONTAINE-18/420, PAPER-FARGUES-FONTAINE-18/421, PAPER-FARGUES-FONTAINE-18/422, PAPER-FARGUES-FONTAINE-18/423, PAPER-FARGUES-FONTAINE-18/424, PAPER-FARGUES-FONTAINE-18/425, PAPER-FARGUES-FONTAINE-18/426, PAPER-FARGUES-FONTAINE-18/427, PAPER-FARGUES-FONTAINE-18/428, PAPER-FARGUES-FONTAINE-18/429, PAPER-FARGUES-FONTAINE-18/430, PAPER-FARGUES-FONTAINE-18/431, PAPER-FARGUES-FONTAINE-18/432, PAPER-FARGUES-FONTAINE-18/433, PAPER-FARGUES-FONTAINE-18/434, PAPER-FARGUES-FONTAINE-18/435, PAPER-FARGUES-FONTAINE-18/436, PAPER-FARGUES-FONTAINE-18/437, PAPER-FARGUES-FONTAINE-18/438, PAPER-FARGUES-FONTAINE-18/439, PAPER-FARGUES-FONTAINE-18/440, PAPER-FARGUES-FONTAINE-18/441, PAPER-FARGUES-FONTAINE-18/442, PAPER-FARGUES-FONTAINE-18/443, PAPER-FARGUES-FONTAINE-18/444, PAPER-FARGUES-FONTAINE-18/445, PAPER-FARGUES-FONTAINE-18/446, PAPER-FARGUES-FONTAINE-18/447, PAPER-FARGUES-FONTAINE-18/448, PAPER-FARGUES-FONTAINE-18/449, PAPER-FARGUES-FONTAINE-18/450, PAPER-FARGUES-FONTAINE-18/451, PAPER-FARGUES-FONTAINE-18/452, PAPER-FARGUES-FONTAINE-18/453, PAPER-FARGUES-FONTAINE-18/454, PAPER-FARGUES-FONTAINE-18/455, PAPER-FARGUES-FONTAINE-18/456, PAPER-FARGUES-FONTAINE-18/457, PAPER-FARGUES-FONTAINE-18/458, PAPER-FARGUES-FONTAINE-18/459, PAPER-FARGUES-FONTAINE-18/460, PAPER-FARGUES-FONTAINE-18/461, PAPER-FARGUES-FONTAINE-18/462, PAPER-FARGUES-FONTAINE-18/463, PAPER-FARGUES-FONTAINE-18/464, PAPER-FARGUES-FONTAINE-18/465, PAPER-FARGUES-FONTAINE-18/466, PAPER-FARGUES-FONTAINE-18/467, PAPER-FARGUES-FONTAINE-18/468, PAPER-FARGUES-FONTAINE-18/469, PAPER-FARGUES-FONTAINE-18/470, PAPER-FARGUES-FONTAINE-18/471, PAPER-FARGUES-FONTAINE-18/472, PAPER-FARGUES-FONTAINE-18/473, PAPER-FARGUES-FONTAINE-18/474, PAPER-FARGUES-FONTAINE-18/476, PAPER-FARGUES-FONTAINE-18/477, PAPER-FARGUES-FONTAINE-18/478, PAPER-FARGUES-FONTAINE-18/479, PAPER-FARGUES-FONTAINE-18/480, PAPER-FARGUES-FONTAINE-18/481, PAPER-FARGUES-FONTAINE-18/482, PAPER-FARGUES-FONTAINE-18/483, PAPER-FARGUES-FONTAINE-18/484, PAPER-FARGUES-FONTAINE-18/485, PAPER-FARGUES-FONTAINE-18/486, PAPER-FARGUES-FONTAINE-18/488, PAPER-FARGUES-FONTAINE-18/489, PAPER-FARGUES-FONTAINE-18/490, PAPER-FARGUES-FONTAINE-18/491, PAPER-FARGUES-FONTAINE-18/492, PAPER-FARGUES-FONTAINE-18/493, PAPER-FARGUES-FONTAINE-18/494, PAPER-FARGUES-FONTAINE-18/495, PAPER-FARGUES-FONTAINE-18/496, PAPER-FARGUES-FONTAINE-18/497, PAPER-FARGUES-FONTAINE-18/498, PAPER-FARGUES-FONTAINE-18/499, PAPER-FARGUES-FONTAINE-18/500, PAPER-FARGUES-FONTAINE-18/501, PAPER-FARGUES-FONTAINE-18/502, PAPER-FARGUES-FONTAINE-18/503, PAPER-FARGUES-FONTAINE-18/504, PAPER-FARGUES-FONTAINE-18/505, PAPER-FARGUES-FONTAINE-18/506, PAPER-FARGUES-FONTAINE-18/507, PAPER-FARGUES-FONTAINE-18/508, PAPER-FARGUES-FONTAINE-18/509, PAPER-FARGUES-FONTAINE-18/510, PAPER-FARGUES-FONTAINE-18/512, PAPER-FARGUES-FONTAINE-18/513, PAPER-FARGUES-FONTAINE-18/514, PAPER-FARGUES-FONTAINE-18/515, PAPER-FARGUES-FONTAINE-18/516, PAPER-FARGUES-FONTAINE-18/517, PAPER-FARGUES-FONTAINE-18/518, PAPER-FARGUES-FONTAINE-18/519, PAPER-FARGUES-FONTAINE-18/520, PAPER-FARGUES-FONTAINE-18/521, PAPER-FARGUES-FONTAINE-18/522, PAPER-FARGUES-FONTAINE-18/523, PAPER-FARGUES-FONTAINE-18/524, PAPER-FARGUES-FONTAINE-18/525, PAPER-FARGUES-FONTAINE-18/526, PAPER-FARGUES-FONTAINE-18/527, PAPER-FARGUES-FONTAINE-18/528, PAPER-FARGUES-FONTAINE-18/529, PAPER-FARGUES-FONTAINE-18/530, PAPER-FARGUES-FONTAINE-18/531, PAPER-FARGUES-FONTAINE-18/532, PAPER-FARGUES-FONTAINE-18/533, PAPER-FARGUES-FONTAINE-18/534, PAPER-FARGUES-FONTAINE-18/535, PAPER-FARGUES-FONTAINE-18/536, PAPER-FARGUES-FONTAINE-18/537, PAPER-FARGUES-FONTAINE-18/538, PAPER-FARGUES-FONTAINE-18/614, PAPER-FARGUES-FONTAINE-18/615, PAPER-FARGUES-FONTAINE-18/774, PAPER-FARGUES-FONTAINE-18/775, PAPER-FARGUES-FONTAINE-18/776, PAPER-FARGUES-FONTAINE-18/777, PAPER-FARGUES-FONTAINE-18/778, PAPER-FARGUES-FONTAINE-18/781, PAPER-FARGUES-FONTAINE-18/782, PAPER-FARGUES-FONTAINE-18/784, PAPER-FARGUES-FONTAINE-18/785, PAPER-FARGUES-FONTAINE-18/786, PAPER-FARGUES-FONTAINE-18/787, PAPER-FARGUES-FONTAINE-18/817, PAPER-FARGUES-FONTAINE-18/818, PAPER-FARGUES-FONTAINE-18/819, PAPER-FARGUES-FONTAINE-18/820, PAPER-FARGUES-FONTAINE-18/821, PAPER-FARGUES-FONTAINE-18/822, PAPER-FARGUES-FONTAINE-18/823, PAPER-FARGUES-FONTAINE-18/824, PAPER-FARGUES-FONTAINE-18/826, PAPER-FARGUES-FONTAINE-18/827, PAPER-FARGUES-FONTAINE-18/828, PAPER-FARGUES-FONTAINE-18/829, PAPER-FARGUES-FONTAINE-18/830, PAPER-FARGUES-FONTAINE-18/831, PAPER-FARGUES-FONTAINE-18/832, PAPER-FARGUES-FONTAINE-18/833, PAPER-FARGUES-FONTAINE-18/834, PAPER-FARGUES-FONTAINE-18/835.


## Pinned baseline and sources read


- mathlib:WittVector in Mathlib/RingTheory/WittVector/Defs.lean: The Witt-vector carrier for every coefficient ring, with coefficients indexed by natural numbers.

- mathlib:WittVector.frobenius in Mathlib/RingTheory/WittVector/Frobenius.lean: The Witt Frobenius ring homomorphism for a prime p, not an isomorphism for arbitrary coefficients.

- mathlib:WittVector.verschiebung in Mathlib/RingTheory/WittVector/Verschiebung.lean: The additive Verschiebung with coefficient zero at index0 and shifted higher coordinates.

- mathlib:DividedPowers in Mathlib/RingTheory/DividedPowers/Basic.lean: A divided-power structure on an ideal, including its domain conditions; no PD-envelope carrier is supplied.

- mathlib:WittVector.frobenius_verschiebung in Mathlib/RingTheory/WittVector/Identities.lean: For a prime p and commutative coefficient ring, Frobenius composed with Verschiebung is multiplication by p.

**KPZ26.** Mark Kisin, Georgios Pappas and Rong Zhou. Integral models of Shimura varieties with parahoric level structure, II. Forum of Mathematics, Pi (2026), published 89-page PDF. [Public source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6C2640CC5856BDF975AF97EE30CA7906/S2050508626100316a.pdf/div-class-title-integral-models-of-shimura-varieties-with-parahoric-level-structure-ii-div.pdf). Accessed 2026-10-19. Read: §§3.1.5,3.1.10; §§5.1–5.3, pp.47–62; §§6.1–6.3, pp.62–71; §7.1.3–7.1.6, pp.72–74; §7.3.1(2), p.86 and §7.3.2, p.87. SHA-256: d0438498fbe4501e6d9c0cc7cf3ea9fc02ba5e11d326f2d77dd42715658a198b.


**KP18.** Mark Kisin and Georgios Pappas. Integral models of Shimura varieties with parahoric level structure. Publications Mathématiques de l’IHÉS 128 (2018), pp.121–218. [Public source](https://www.numdam.org/item/10.1007/s10240-018-0100-0.pdf). Accessed 2026-10-19. Read: §§3.1–3.3, pp.162–182, including proofs of Lemmas3.1.9,3.1.17,3.2.6,3.2.14 and Proposition3.2.17. SHA-256: e2b4a0763f216be82da950f4c0dd2800adea8a0d911b12bfacf2b7e493b4618b.


**KZ25.** Mark Kisin and Rong Zhou. Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties. arXiv:2103.09945v2,7 October2024,63-page author version; published Annals202 (2025). [Public source](https://arxiv.org/pdf/2103.09945v2). Accessed 2026-10-19. Read: §§3.2–3.4, pp.22–28; the numbering here is the author version: Lemma3.4.3 and Theorem3.4.5. SHA-256: 62d26eb931f271404c333c4b9a929e85239222788834cf16dcec1dff230c34c8.


**Kisin17.** Mark Kisin. Mod p points on Shimura varieties of abelian type. Author 99-page version dated27 August2016; JAMS30 (2017),819–914; page numbers below are author pages. [Public source](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf). Accessed 2026-10-19. Read: §§1.1–1.2, pp.5–16; proof of Proposition1.3.9, p.21; §1.4.5–Lemma1.4.6, pp.24–25; proof of Theorem2.2.3, p.32; Errata E.1–E.4, p.96. SHA-256: d3c19cddc9e8b073428de559a7215aae4f793490227b6c71d87477ccdb5d994a.


**Zhu17.** Xinwen Zhu. Affine Grassmannians and the geometric Satake in mixed characteristic. Annals of Mathematics185 (2017),403–492. [Public source](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf). Accessed 2026-10-19. Read: §0.3, p.410; §3.2 and proof of Proposition3.11, pp.460–463. SHA-256: 5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7.


**vanHoften24.** Pol van Hoften. Mod p points on Shimura varieties of parahoric level. Forum of Mathematics, Pi12 (2024), e20, published67-page PDF. [Public source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/EC6F7AD8C8B489FEB8FC4D64485ABE1D/S2050508624000222a.pdf/mod_p_points_on_shimura_varieties_of_parahoric_level.pdf). Accessed 2026-10-19. Read: Example2.2.10, p.14; §§3.1.5–3.1.7, pp.27–28; AppendixA.4.3, pp.64–65. SHA-256: d86da9a0e35c93d22df291979be37a5acf1ddc44fbd762e11f2a5f6c92961be0.


**Hoff23.** Manuel Hoff. On parahoric (G,μ)-displays. arXiv:2311.00127v1,2023,37 pages. [Public source](https://arxiv.org/pdf/2311.00127v1). Accessed 2026-10-19. Read: §1.3–1.5, pp.13–16; §2.1, pp.16–20; §2.3, pp.24–29, particularly Assumption2.28 and Theorem2.36. SHA-256: 4ada497769174b02d9229818e1120be14ccf4d5157ab8c2c87c64dd20f74b98c.


**Lau14.** Eike Lau. Relations between Dieudonné displays and crystalline Dieudonné theory. Algebra & Number Theory8 (2014),2201–2262. [Public source](https://msp.org/ant/2014/8-9/ant-v8-n9-p04-p.pdf). Accessed 2026-10-19. Read: Lemma2.4, p.2216; Theorem5.3 and Corollaries5.5–5.6, pp.2243–2244. SHA-256: f650eaf6a47c7e74b3d0b1007e3dd3bd2e90c32be0d3aeb4ed57bc8a517563b8.


**Anschuetz22.** Johannes Anschütz. Extending torsors on the punctured Spec(A_inf). arXiv:1804.06356v2,21 October2020; published J. Reine Angew. Math.783 (2022),227–268. [Public source](https://arxiv.org/pdf/1804.06356v2). Accessed 2026-10-19. Read: Proposition10.3 and proof, author p.33: extension of parahoric torsors over punctured O_E[[z]]. SHA-256: 27c2e6fef2d1fd82ad825b087dbf19b1cd496b8bfc7a60ce6bdba8deaca08354.


**Wintenberger97.** Jean-Pierre Wintenberger. Propriétés du groupe tannakien des structures de Hodge p-adiques et torseur entre cohomologies cristalline et étale. Annales de l’Institut Fourier47 (1997),1289–1334. [Public source](https://aif.centre-mersenne.org/item/10.5802/aif.1600.pdf). Accessed 2026-10-19. Read: §4.1.2, p.1320; Corollary4.4.2 and remarks, pp.1327–1329; §4.5, pp.1329–1333, particularly Proposition4.5.3 and following unnumbered corollary. SHA-256: 4049036e27703b422c1fe78465aa4c5ae4ce938b532383a5c6335016687f0c64.


**Zhou20.** Rong Zhou. Mod p isogeny classes on Shimura varieties with parahoric level structure. arXiv:1707.09685v2,February2018 author version; published2020; use v2 numbering explicitly. [Public source](https://arxiv.org/pdf/1707.09685v2). Accessed 2026-10-19. Read: §5.5, pp.18–19, the M-valued filtration assumption and conditional adapted lift; compare published-number citation in vanHoften24 AppendixA.4.3. SHA-256: 2c42c35bc35469c33cfd8a10462b8089db681c57d39b84563bc3b119bb749722.
