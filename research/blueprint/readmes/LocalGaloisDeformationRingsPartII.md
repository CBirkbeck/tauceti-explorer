# Local Galois deformation rings and their components, Part II

## Explicit tame GL₂ rings of small Hodge type

The goal is an explicit integral description of certain local deformation rings that enter patching. Let K/Q_p be unramified of degree f and let ρ̄ be a sufficiently generic semisimple two-dimensional representation of G_K. For each relevant tame inertial type, the first presentation identifies the framed potentially crystalline ring, up to specified smooth variables, with a completed tensor product of rank-two gauge charts. Its components are indexed by the two Hodge profiles (3,0) and (2,1) at each embedding. The second presentation places all types containing one Serre weight in common coordinates. A final relation between their component ideals puts the integer prime p in a particular sum involving an intersection. This integral relation, rather than just the number of components after inverting p, is the input used in the patched-module gluing argument of BHHMS, Theorem 8.3.9, equations (78)–(79), pp. 101–102.

This extends `LocalGaloisDeformationRings`. That roadmap already owns universal framed deformation rings, fixed Hodge and inertial conditions, their reduced flat closures, their generic dimensions and the height-lattice moduli problem. Here the new material is the explicit rank-two gauge calculation, effective control of monodromy equations, and the simultaneous comparison of component ideals. The two Hodge profiles differ from the height-one Barsotti–Tate profile (1,0). The informal “potentially Barsotti–Tate” name of the incoming route must therefore not restrict the actual statement: this roadmap includes (3,0) and the determinant twist (2,1).

The independent unrestricted-ring continuation, based on Böckle–Iyengar–Paškūnas and Paškūnas–Quast, is assigned to `LocalGaloisDeformationRingsPartIIComponentsAndNormality`. The weight-zero crystalline/Emerton–Gee continuation is assigned to `WeightZeroCrystallineLiftingRings`. The split proposal retains their source-route item sets and the required existing ComponentsAndNormality brief. Neither direction is an input to these explicit tame presentations.

## Conventions that every layer retains

The prime p is rational; ϖ is a uniformizer of O=O_E for a sufficiently large finite E/Q_p, and F is its finite residue field. They need not generate the same ideal. Coefficient extensions used to split characters or obtain lifts are finite, and their effect is compared through the imported coefficient-change maps. The unramified field K has residue k=F_q, q=p^f. Choose σ_0 and index embeddings by σ_j=σ_0∘Frob_p^j. The Hodge–Tate weight of the cyclotomic character ε is +1. All deformations are framed, continuous and determinant-unrestricted.

The fundamental character uses geometric Artin reciprocity. Tau Ceti’s arithmetic Artin convention is inverted at this interface. The unramified character nr(α) sends **arithmetic** Frobenius to α. These two convention statements are consistent and both are needed. The coefficient module realization is contravariant, written V*_K or T*_dd. The Kummer tower begins at p_0=−p, with p_n^p=p_{n−1}. The tame splitting field is K′((−p)^{1/e′}), where f′ is f or 2f and e′=p^{f′}−1. The Kisin parameter satisfies v=(u′)^{e′} and E(u′)=v+p. In this document λ is a Hodge profile or an analytic product only when the context explicitly says which; write λ_an for the analytic product when both appear.

The alcove depth, Serre weights F(λ), the translation map and W(ρ̄) are the objects of `ModpRepresentationsOfGL2OverLocalFields:MP.3`. We do not define them a second time. In particular N-deep means the strict inequalities N<λ_{j,1}−λ_{j,2}+1<p−N. Lowest-alcove genericity has an existential presentation; changing to another lowest-alcove presentation can cost one unit. Genericity of a representation is a condition on semisimplified inertia. The presentation theorems impose semisimplicity of ρ̄ separately.

Starting at T.4, fix normalized data ρ̄|_{I_K}=τ(s,μ), μ_j=(r_j+2,1), N<r_j+1<p−N, N≥12. All s_j are trivial except s_0=w exactly when ρ̄ is irreducible. A central tame twist permits this normalization. The statement is about these data; the source explains that a 13-generic residual representation admits them. It does not turn every arbitrary 12-generic presentation into normalized 12-deep data without a loss. The strict inequalities force p≥29 at N=12.

There are two related embedding indices. A table with index j describes the Kisin matrix at embedding f−1−j. Its Hodge component is labelled λ_{f−1−j}, and the extreme-shape selector is θ(σ)_{f−1−j}. An index reversal in a star operation cannot be suppressed even though all displayed products in S₂ happen to commute. The norm-determinant character N_{k/F_p}∘det is included in every comparison between the Serre weight σ and the compact-type reduction. Erasing that twist changes the central character.

## Inputs and boundaries

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet lists the declarations whose actual statements were read at those pins. Formal power series use Mathlib’s `MvPowerSeries`, constants and variables; polynomial matrices use the existing matrix and polynomial carriers; ideals and quotients use `Ideal.span` and the existing quotient ring. No new generic completed-ring, matrix or representation carrier is proposed here. Weierstrass preparation is already available and is imported for the irreducibility argument.

The reviewed library-coverage file has no audit entry for this Part II or its parent. That absence is not a negative audit verdict. Direct searches of the current Tau Ceti library and the current TauCetiRoadmap Suggested files found no tame Kisin gauge or explicit monodromy-chart development. The newer `LocalGaloisGroups` and `ProfiniteArithmetic` roadmaps are treated as existing work. Their general Galois/topological-group foundations are inherited through the suppliers; no second local-Galois foundation is planned here. The current `ModpRepresentationsOfGL2OverLocalFields` packet, in contrast, explicitly supplies the depth, translation and tame-weight objects needed below.

The exact deformation inputs are `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `R08.3/hodge-and-galois-types`, `R08.3/hodge-type-components`, `R08.3/pst-deformation-ring`, `R08.3/pcris-generic-smooth`, and `L7/height-lattice-moduli`. The parent’s rank-three Kisin-coordinate nodes are not rank-two gauge-chart APIs and are not used as if they were. The R07.4 inputs are its Breuil–Kisin coefficient ring, finite-height modules and Kummer/étale realization; its finite-coefficient and height-one statements are extended only through the precise supplier request below.

Completed tensor products, point detection of reduced O-flat quotients, regular-local UFDs, and square-free monomial component computations come from `DeformationAndDerivedPatchingAlgebra:R03.1`, `R03.3`, `R03.4` and `R03.6`, through the exact nodes listed under each target. This roadmap owns the three explicit hypersurface factors and their substitutions, while the general commutative algebra remains with that supplier. The finite projective and adjoint-tensor calculation is imported from `ModpRepresentationsOfGL2OverLocalFields:MP.5/projective-adjoint`.

There are six explicit supplier contracts, reproduced at the end of this document. They distinguish an existing exact node from a requested interface. In particular the GHLS existence theorem needs a crystalline extended-Fontaine–Laffaille seed; dimension and generic smoothness cannot manufacture one. GHLS uses HT(ε)=−1, while this roadmap uses +1. Its type, algebraic highest-weight and residual-weight conversion is a stated supplier obligation, not an implicit sign choice.

## Build order and acceptance

T.0 fixes tame characteristic-zero types and their weight labels. T.1 gives the rank-two gauge coordinates on the imported Kisin category. T.2 makes monodromy an effective finite-jet condition. T.3 classifies the residual monomial representations and controls restriction to K∞. T.4 selects the admissible types and residual modules. T.5 separates the exact polynomial model, analytic quotient, approximation map and one ambient coordinate automorphism. T.6 gives the single-type presentations and special fibres. T.7 constructs the common charts and proves the union and ideal-intersection results.

Every definition or construction below has named API targets and at least three Checks. The signatures requiring future Kisin, compact-type or deformation-condition carriers live in this reader. The compact Suggested file contains only light definitions over carriers present at the pins, representative chart identities, the finite admissible-set count and the square-free crossing milestone. Its standard note states this boundary; it is not an implementation claim. All packet nodes have implementation status unchecked. The proof plans close at exact baseline declarations, existing packet nodes, or one of the named supplier contracts. The eight layers are planned rather than closed while those contracts remain open.

All locators in BHHMS refer to arXiv:2009.03127v7’s printed preprint page numbers, not the journal pagination. Each mathematical statement below is written in our own words and organized by the construction it serves.


## Layer T.0: Tame types and their weight labels

The integral models need actual characteristic-zero inertial types, while their component labels come from mod-p weights. Keep these interfaces separate. First build the Teichmüller character sum and its orientation; then compare the compact-type reduction with the imported weight coordinates. The orientation orders weighted exponents a′, and has upper product endpoint f′−1−j′. Both details feed the monodromy constants.

**Direct stage inputs.** `ModpRepresentationsOfGL2OverLocalFields:MP.3`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `LocalGaloisDeformationRings:R08.3`.


### Tame inertial types

Target `LocalGaloisDeformationRingsPartII:T.0/tame-type` (construction).

For s∈(S₂)^f and μ∈(Z²)^f, let sτ=s₀s_{f−1}⋯s₁, r=ord(sτ), f′=rf, e′=p^{f′}−1. Put α′_j=(s₁⁻¹⋯s_j⁻¹)(μ_j+η), η=(1,0), with periodic indices modulo f and α′_{j+kf}=sτ^{−k}α′_j. Set a′^(j)=Σ_{i=0}^{f′−1}p^i α′_{−j+i}. The characteristic-zero inertial type τ(s,μ+η) is the sum of the two Teichmüller lifts of ω_{f′}^{a′^(0)_i}. Here ω_{f′} uses geometric Artin reciprocity; its inverse is used when importing the arithmetic Artin convention. This refines the existing mod-p τ(s,μ+η), and is not a second definition of that mod-p type.

**Construction or proof.**

1. Use the tame quotient and local reciprocity to obtain the fundamental characters, with the geometric/arithmetic inverse made explicit.
2. Form the two integer exponents and Teichmüller lifts; Frobenius permutes them, so the sum extends to a Weil representation with open inertia kernel.
3. Reduction of each Teichmüller character recovers the MP.3 tame-character formula.

**API.**

- `TauCeti.TameGL2.tameType` (constructor): The two-character sum with its Weil-extension property.
- `TauCeti.TameGL2.tameType_reduce` (compatibility): Reduction is the imported mod-p tame type with the same s and μ+η, as an inertia representation.
- `TauCeti.TameGL2.tameType_centralShift` (functoriality): Adding (b_j,b_j) twists both characters by the corresponding rank-one tame character; the Weyl data do not change.

**Checks.**

- `TauCeti.TameGL2.tameType_split` (computation): For f=1 and s=1, the characters are ω̃₁^{μ₁+1} and ω̃₁^{μ₂}.
- `TauCeti.TameGL2.tameType_nonsplit` (computation): For f=1 and s=w, the exponents at niveau two are μ₁+1+pμ₂ and μ₂+p(μ₁+1), interchanged by p-Frobenius.
- `TauCeti.TameGL2.tameType_modp` (compatibility): For f=1, p=7, s=1 and μ=(0,0), reduction gives ω₁⊕1, exactly as in MP.3/tame-weight-set. Using arithmetic reciprocity without inversion gives ω₁⁻¹⊕1, a different character multiset.

**Uses.** T.0/orientation and T.4/admissible-types: The ordered lowest-alcove presentation chooses both the gauge conjugation and the types of the deformation problems. BHHMS Proposition 4.2.1, pp. 28–33: σ(τ) and its reduction label the nonempty potentially crystalline components.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `ModpRepresentationsOfGL2OverLocalFields:MP.3/tame-weight-set`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `LocalGaloisDeformationRings:R08.3/hodge-and-galois-types`.

**Sources.** BHHMS23, Definition 2.3.1, equations (11)–(12), p. 14; §2.2, p. 13.


### Generic tame types

Target `LocalGaloisDeformationRingsPartII:T.0/genericity` (definition).

A tame type is N-generic if it has a presentation τ(s,μ+η) with μ N-deep in C₀ in the imported MP.3 convention: N<μ_{j,1}−μ_{j,2}+1<p−N for all j. A lowest-alcove presentation has μ 0-deep. A continuous residual representation ρ is N-generic when (ρ|_{I_K})^ss is the imported mod-p τ(s,μ) for some μ−η N-deep. This predicate uses semisimplified inertia and does not assert that ρ itself is semisimple.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. N≥0 is an integer; the strict depth convention is imported from MP.3/weight-coordinates.

**Construction or proof.**

1. Use the existing depth and mod-p tame-type predicates; take existence of a presentation for each genericity predicate.
2. Keep the η-shift different for the type input and for the residual input, so both assert depth of the same alcove coordinate.

**API.**

- `TauCeti.TameGL2.typeGeneric_iff` (characterisation): Type genericity is existence of an N-deep presentation, including the η shift.
- `TauCeti.TameGL2.residualGeneric_ss` (simp): Residual genericity is invariant under semisimplification and under isomorphism.
- `TauCeti.TameGL2.generic_mono` (relation): N-generic implies M-generic for 0≤M≤N; no converse is asserted.

**Checks.**

- `TauCeti.TameGL2.generic_strict_boundary` (non-example): A presentation with μ₁−μ₂+1=N is not N-deep; the endpoint N+1 passes the lower inequality if below p−N.
- `TauCeti.TameGL2.generic_prime_bound` (non-example): Existence of an integer depth coordinate at N=12 forces p≥29; p=23 cannot satisfy 12<d<11.
- `TauCeti.TameGL2.generic_extension` (compatibility): A nonsplit extension and the split sum with the same semisimplified inertia have the same residual genericity, while only the latter meets the semisimplicity hypothesis of T.4.

**Uses.** T.1/gauge-existence: The explicit bound (h+1)-generic gives a contracting basis correction. T.4 and T.5: N≥12 controls every denominator and the accuracy N−8 of the ambient comparison.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.0/tame-type`, `ModpRepresentationsOfGL2OverLocalFields:MP.3/weight-coordinates`, `ModpRepresentationsOfGL2OverLocalFields:MP.3/tame-weight-set`.

**Sources.** BHHMS23, Definitions 2.3.3–2.3.4, pp. 14–15.


### Orientation of a tame type

Target `LocalGaloisDeformationRingsPartII:T.0/orientation` (construction).

For a fixed lowest-alcove presentation define s′_{or,j′}=s₁⁻¹⋯s_{f′−1−j′}⁻¹, with indices on s read modulo f and the empty product equal to 1. If μ is 0-deep, this is the unique permutation for which (s′_{or,j′})⁻¹ a′^(j′) is dominant. In particular (s′_{or,−j′})⁻¹ α′_{j′}=s_{j′}⁻¹(μ_{j′}+η). The orientation is periodic modulo f only with the prescribed Frobenius twisting; the normalized A matrices, rather than the raw s′ sequence, become f-periodic.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. The ordered presentation, not just the isomorphism class of τ, is fixed.

**Construction or proof.**

1. Expand the weighted digit sum defining a′. Strict alcove inequalities ensure that the leading distinct digit selects a unique ordering.
2. Cancel the adjacent partial products to obtain equation (13); retain f′−1−j′ as the orientation upper endpoint.

**API.**

- `TauCeti.TameGL2.orientation` (constructor): The specified partial product in S₂.
- `TauCeti.TameGL2.orientation_dominant` (characterisation): Its inverse orders a′^(j′) decreasingly, uniquely under the strict alcove hypothesis.
- `TauCeti.TameGL2.orientation_alpha` (relation): The equation with α′ and index −j′ used to reduce the monodromy diagonal modulo p.

**Checks.**

- `TauCeti.TameGL2.orientation_empty` (degenerate): At j′=f′−1 the product is empty and the orientation is 1.
- `TauCeti.TameGL2.orientation_quadratic` (computation): For f=1 and s=w, f′=2 and the two orientations are w and 1 in that order; the formula with upper endpoint j′ fails.
- `TauCeti.TameGL2.orientation_weighted` (computation): For f=1, p=5, s=w and μ=(1,0), α′₀=(2,0), α′₁=(0,2), a′^(0)=(2,10) and a′^(1)=(10,2). The orientations are w and 1; ordering α′₀ instead of a′^(0) would incorrectly give 1 at index 0.

**Uses.** Definition 3.1.1, p. 18: Conjugates Frobenius matrices into R[[v]] with an Iwahori reduction. Equation (16) and the proof of Proposition 4.2.1, pp. 21, 29: Determines the diagonal commutator and the residue of each a_i.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.0/tame-type`, `LocalGaloisDeformationRingsPartII:T.0/genericity`.

**Sources.** BHHMS23, Remark 2.3.6 and equation (13), p. 15.


### Depth under change of presentation

Target `LocalGaloisDeformationRingsPartII:T.0/presentation-depth` (lemma).

If τ is N-generic, N≥1, every lowest-alcove presentation of τ is (N−1)-deep. The same one-unit allowance permits a 13-generic semisimple residual representation to be put in the 12-deep normalized presentation required in T.4. No theorem here substitutes an arbitrary 12-generic representation for the explicitly normalized 12-deep input.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. τ is tame and the indicated lowest-alcove presentation exists.

**Construction or proof.**

1. Compare the two lowest-alcove representatives through the Weyl action and the (p−π) central ambiguity imported from MP.3.
2. A chamber crossing changes the root coordinate by at most one; central shifts preserve it. Apply this at each embedding.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.0/genericity`, `ModpRepresentationsOfGL2OverLocalFields:MP.3/weight-coordinates`, `ModpRepresentationsOfGL2OverLocalFields:MP.3/translation-map`.

**Sources.** BHHMS23, Remark 2.3.5, p. 15; §4.1, pp. 24–25.


### Weights of a tame type

Target `LocalGaloisDeformationRingsPartII:T.0/type-jordan-holder` (theorem).

Let τ=τ(sw⁻¹,μ−sw⁻¹ν), with ν∈η+Λ_R, and assume μ−sw⁻¹ν−η is 1-deep. In the imported weight lattice, Σ={0,1}^f and the translation map t_{μ−η} are those of MP.3. Then JH(σ̄(τ))={F(t_{μ−η}(sw⁻¹(ω−ν̄))):ω∈Σ}. The compact type σ(τ), its integral lattice and inertial-local-Langlands normalization are supplied by the R08.3 request. Reduction is semisimplified, so JH is independent of the lattice; no claim of canonical lattices is made.

**Construction or proof.**

1. Use the R08.3 requested tame compact-type/Deligne–Lusztig comparison at 1-generic type and the MP.3 requested finite-group Deligne–Lusztig reduction formula.
2. The depth hypothesis puts sw⁻¹(Σ−ν̄) inside the translation domain. Apply the requested finite-group reduction formula and the MP.3 translation convention.
3. Check the η shift and determinant twist before using the formula to label deformation components.

**Acceptance.** For f=1 the two allowable weights agree with the translation formula, including determinant exponents. The formula is unavailable at a wall or for a scalar inertial type without its stated 1-deep hypothesis.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.0/tame-type`, `LocalGaloisDeformationRingsPartII:T.0/genericity`, `ModpRepresentationsOfGL2OverLocalFields:MP.3/translation-map`, `ModpRepresentationsOfGL2OverLocalFields:MP.3/weight-coordinates`, `LocalGaloisDeformationRings:R08.3`, `ModpRepresentationsOfGL2OverLocalFields:MP.3`.

**Sources.** BHHMS23, Proposition 2.4.3, p. 16; Remark 2.4.5(iv), p. 17.


## Layer T.1: Rank-two Kisin gauge charts

The category and its coefficient base change are supplied by R07.4. This layer owns only the rank-two coordinate descriptions on that category. The negative embedding index in the coefficient decomposition ensures Frobenius advances the component by one. Gauge coordinates are polynomial normal forms relative to a residual gauge basis, with a diagonal torsor of choices.

**Direct stage inputs.** `LocalGaloisDeformationRingsPartII:T.0`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `DeformationAndDerivedPatchingAlgebra:R03.1`.


### Eigenbasis Frobenius matrices

Target `LocalGaloisDeformationRingsPartII:T.1/eigenbasis-matrices` (construction).

Let M be rank two in the imported Y^[0,h],τ(R), with eigenbasis β for a fixed 1-deep lowest-alcove presentation (s,μ). Put K′/K unramified of degree r, L′=K′((−p)^{1/e′}), v=(u′)^{e′}, E(u′)=v+p. Decompose S_{L′,R}=(W(k′)⊗_{Z_p}R)[[u′]] by σ_{−j′}, so φ sends M^(j′) to M^(j′+1). Define C by β^(j′+1)C^(j′)=φ_M(φ*β^(j′)). Define A^(j′)=Ad((ṡ′_{or,j′+1})⁻¹(u′)^{−a′^(j′+1)})(C^(j′)). The order of the two conjugations is part of the definition. Then A belongs to M₂(R[[v]]), is upper triangular modulo v, and is f-periodic. On O-flat p-complete R, the imported Hodge-bound subfunctor Y^≤λ,τ is tested by divisibility of i-minors by (v+p)^{Σ of the smallest i entries of λ_j}.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. R is complete Noetherian local over O with residue F; the coefficient-ring and tame-descent extensions requested from R07.4 are inputs. For h=3 and determinant valuation 3, det A is a unit times (v+p)³; the profiles dominated by (3,0) with that sum are exactly (3,0) and (2,1).

**Construction or proof.**

1. Decompose the coefficient ring using σ_{−j′}; use the imported semilinear Frobenius and descent action to define C.
2. Conjugate in the stated order. The descent-character exponents force v-integrality; orientation forces the lower-left entry to vanish modulo v.
3. Transport the general Hodge-bound minor criterion from the supplier to these rank-two matrices. This is a chart description, not a reconstruction of the general Kisin category.

**API.**

- `TauCeti.TameGL2.eigenbasisMatrix_C` (projection): The semilinear matrix identity defining C.
- `TauCeti.TameGL2.eigenbasisMatrix_A` (constructor): The ordered conjugation defining the normalized A.
- `TauCeti.TameGL2.eigenbasisMatrix_descent` (compatibility): A is f-periodic over R[[v]] and agrees with the imported Kisin Frobenius after the indicated eigencharacter conjugation.
- `TauCeti.TameGL2.hodgeBound_minors` (characterisation): The stated minor divisibilities characterize the existing Hodge-bound condition on O-flat p-complete coefficient rings.

**Checks.**

- `TauCeti.TameGL2.matrix_embedding_sign` (computation): For f=f′=3, the summand j′=1 uses σ₂=σ_{−1}, and φ carries it to summand 2. Replacing σ_{−j′} by σ_{j′} would use σ₁ at summand 1 and reverse the cyclic transition. Degree 2 alone cannot detect the sign.
- `TauCeti.TameGL2.matrix_conjugation_order` (computation): Over Q, put P=[[0,1],[1,0]], D=diag(1,2) and C=[[0,1],[0,0]]. Then Ad(P⁻¹D)(C)=[[0,0],[1/2,0]], whereas Ad(DP⁻¹)(C)=[[0,0],[2,0]]. The off-diagonal entry detects the order; diagonal C would not.
- `TauCeti.TameGL2.matrix_height_profiles` (computation): For λ=(2,1), all entries are divisible by v+p and det A by (v+p)³; for λ=(3,0), no common entry factor is required.

**Uses.** T.1/gauge-basis and T.2/jet-equations: The normalized matrices have polynomial gauge forms and a well-defined derivative in v. T.5/chart-models: The three eight-variable charts are coefficient parametrizations of these matrices.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.0/tame-type`, `LocalGaloisDeformationRingsPartII:T.0/orientation`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules`.

**Sources.** BHHMS23, Definition 3.1.1 and Remarks 3.1.2–3.1.3, pp. 18–19.


### Shape of a Kisin module

Target `LocalGaloisDeformationRingsPartII:T.1/shape` (definition).

Over F, let I⊂GL₂(F[[v]]) be the inverse image of the upper triangular subgroup modulo v. The residual Kisin module M has shape w̃=(w_j t^{ν_j})_j when I A^(j) I=I w̃_j I inside GL₂(F((v))) for every j. Here a monomial representative is ẇ_j diag(v^{ν_{j,1}},v^{ν_{j,2}}). The condition is independent of eigenbasis, for a fixed lowest-alcove presentation of τ.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. M∈Y^[0,h],τ(F); τ has the fixed 1-deep presentation used for A.

**Construction or proof.**

1. Apply the descent-compatible eigenbasis-change formula to A. Its two factors lie in I on the left and right, so its I-double coset is unchanged.
2. Use the imported valuation and matrix algebra to read a monomial representative of that coset.

**API.**

- `TauCeti.TameGL2.hasShape` (characterisation): Membership in the specified I-double coset at every embedding.
- `TauCeti.TameGL2.hasShape_basisIndependent` (compatibility): Every eigenbasis gives the same shape when the presentation of τ is fixed.
- `TauCeti.TameGL2.monomial_hasShape` (example): A=D_j w̃_j with D_j diagonal over F× has shape w̃_j.

**Checks.**

- `TauCeti.TameGL2.shape_diagonal` (computation): diag(v²,v) has shape t^(2,1).
- `TauCeti.TameGL2.shape_middle` (computation): The matrix [[0,v],[v²,0]] has shape w t^(2,1), and not either diagonal translation.
- `TauCeti.TameGL2.shape_I_invariance` (compatibility): Multiplication on either side by an upper-triangular-mod-v invertible matrix preserves shape; swapping the two diagonal powers without such factors changes the extreme shape.

**Uses.** T.1/gauge-basis: The shape exponents determine the degree bounds. T.4/residual-kisin-module: The three admissible shapes distinguish the residual chart at each type.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.1/eigenbasis-matrices`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Sources.** BHHMS23, Definition 3.1.4 and the preceding minor criterion, p. 19.


### Gauge basis

Target `LocalGaloisDeformationRingsPartII:T.1/gauge-basis` (definition).

Fix a residual module M̄ with a residual gauge eigenbasis β̄ and shape w̃_j=w_jt^{ν_j}. A gauge basis of a lift M with a specified M⊗F≅M̄ is an eigenbasis β reducing to β̄ such that A^(j)_{ik}∈v^{[i>k]}R[v+p], deg_v A^(j)_{ik}≤ν_{j,k}−[i<w_j(k)], and the bound is an equality at i=w_j(k), for i,k∈{1,2}. A negative upper bound forces the entry to vanish. The leading coefficients in the equality positions are units by the fixed residual shape.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. R is complete Noetherian local over O with residue F; the shape and residual basis are fixed.

**Construction or proof.**

1. Impose the polynomial entry, degree and leading-term conditions on the existing eigenbasis, with no new module carrier.
2. The residual gauge basis itself is characterized by the same conditions over F, up to an arbitrary f-periodic diagonal scaling.

**API.**

- `TauCeti.TameGL2.isGaugeBasis` (characterisation): The polynomial degree and reduction conditions above.
- `TauCeti.TameGL2.gauge_entry_degree` (projection): Each entry has its stated degree bound, and each pivot has the exact bound with a unit leading coefficient.
- `TauCeti.TameGL2.gauge_diagonal_action` (relation): An f-periodic diagonal scaling reducing to 1 preserves the gauge predicate and the specified residual basis.

**Checks.**

- `TauCeti.TameGL2.gauge_lower_left` (characterisation): For every gauge matrix the lower-left entry is divisible by v, even when a polynomial of the same degree without that factor has the correct determinant.
- `TauCeti.TameGL2.gauge_extreme_degrees` (computation): For t^(2,1), the pivot degrees are 2 and 1 and the upper-right entry has degree at most 0.
- `TauCeti.TameGL2.gauge_torus_not_unique` (non-example): A nontrivial diagonal element in ker(T(R)→T(F)), repeated modulo f, gives another gauge basis; literal uniqueness would fail.

**Uses.** T.5/chart-models: Only eight scalar coefficients per embedding survive the rank-two gauge bounds. Proposition 4.2.1 proof, pp. 28–30: Adding a gauge basis contributes 2f smooth variables to the deformation comparison.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.1/eigenbasis-matrices`, `LocalGaloisDeformationRingsPartII:T.1/shape`.

**Sources.** BHHMS23, Definition 3.1.6 and Proposition 3.1.5(i)–(ii), pp. 19–20.


### Existence of gauge bases

Target `LocalGaloisDeformationRingsPartII:T.1/gauge-existence` (theorem).

If τ is (h+1)-generic and M∈Y^[0,h],τ(R) reduces to the fixed residual gauged module, a gauge basis lifting β̄ exists. Any two differ by a unique f-periodic tuple in ker(T(R)→T(F)); thus the set of bases is a torsor for that diagonal group, not a singleton.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. R is complete Noetherian local over O with residue F; h≥0; the residual module has shape w̃ and the chosen residual gauge basis.

**Construction or proof.**

1. Use the Iwahori/eigenbasis-change formula and the height bound to remove coefficients above the allowed degrees, successively in the maximal-adic filtration.
2. The (h+1)-generic inequalities make the unwanted off-diagonal corrections strictly contracting. Completeness gives a limiting eigenbasis satisfying the degree conditions.
3. Apply the same estimates to the ratio of two such bases: every nonconstant/off-diagonal term vanishes, leaving precisely the residual-trivial periodic diagonal scalings.

**Acceptance.** At h=3 the type bound is 4-generic; the 11-deep types used in T.4 meet it. Over F the ambiguity is the full periodic diagonal torus; over a fixed residual basis it is its reduction kernel.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.1/gauge-basis`, `LocalGaloisDeformationRingsPartII:T.0/genericity`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `DeformationAndDerivedPatchingAlgebra:R03.1/artinian-limit-and-quotient-cofinality`.

**Sources.** BHHMS23, Proposition 3.1.5, p. 19.


## Layer T.2: Monodromy and its finite jets

Monodromy is initially analytic. Its Frobenius recursion produces one particular infinite series; the finite jet approximation must retain the error coming from that series. In the presentation range h=3, the value and derivative equations carry different p-adic accuracies. A valuation bound alone does not authorize replacing the errors by unrelated small perturbations.

**Direct stage inputs.** `LocalGaloisDeformationRingsPartII:T.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `LocalGaloisDeformationRingsPartII:T.0`.


### Monodromy derivation

Target `LocalGaloisDeformationRingsPartII:T.2/monodromy-derivation` (construction).

For a p-complete O-flat coefficient algebra R topologically of finite type, use the R07.4 relative open-disc ring O_R^rig and λ=∏_{n≥0}φ^n((v+p)/p). On M^rig[1/λ], there is a unique derivation N_M over N_∇=−u′λ d/du′ with N_Mφ_M=E(u′)φ_MN_M and N_M≡0 modulo u′. Its matrix is relative to β, and the construction commutes with coefficient maps for which the supplier’s relative analytic base-change comparison applies.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. M∈Y^[0,h],τ(R); h≥0; O_R^rig is the inverse limit of the open-disc subrings R[[u′,u′^n/p]][1/p], with the specified inclusions. For complete local deformation bases, apply the supplier’s extension through admissible p-complete finite-type thickenings; do not assume analytic base change for arbitrary R.

**Construction or proof.**

1. Iterate the Frobenius-compatibility equation, beginning with the derivative of C and the required zero constant term.
2. The growing Frobenius powers of u′ make the resulting series converge on each smaller disc after inverting λ.
3. A difference of two solutions satisfies the homogeneous contracting equation and zero constant term, so vanishes.

**API.**

- `TauCeti.TameGL2.monodromyDerivation` (constructor): The unique derivation on M^rig[1/λ] with the stated normalization.
- `TauCeti.TameGL2.monodromy_leibniz` (relation): N_M(am)=N_∇(a)m+aN_M(m).
- `TauCeti.TameGL2.monodromy_frobenius` (relation): N_Mφ_M=Eφ_MN_M, retaining the factor E.
- `TauCeti.TameGL2.monodromy_changeBasis` (compatibility): A basis change B sends the matrix N to B⁻¹NB+B⁻¹N_∇(B), so regularity is basis independent.

**Checks.**

- `TauCeti.TameGL2.monodromy_constant_basis` (degenerate): For a Frobenius-constant rank-one summand, the basis vector has N_M=0 and N_M(ae)=N_∇(a)e.
- `TauCeti.TameGL2.monodromy_E_factor` (computation): For the trivial rank-one module with φ_M(e)=e, apply the compatibility to u′e. Its two sides agree by N_∇((u′)^p)=−p(u′)^pλ_an and λ_an=(E/p)φ(λ_an). Omitting E would instead give −p(u′)^pφ(λ_an), which is different.
- `TauCeti.TameGL2.monodromy_basis_derivative` (computation): For N_M(e)=0 and the analytic unit B=1+u′, the new basis eB has monodromy coefficient B⁻¹N_∇(B)=−u′λ_an/(1+u′). Conjugating the zero matrix alone would still give zero.

**Uses.** T.2/monodromy-condition: Regularity of this derivation is the potentially crystalline comparison condition. T.2/jet-equations: Its Frobenius series determines the error terms; they are not freely chosen perturbations.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.1/eigenbasis-matrices`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`.

**Sources.** BHHMS23, Proposition 3.1.7 and the series preceding (16), pp. 20–21.


### Monodromy condition

Target `LocalGaloisDeformationRingsPartII:T.2/monodromy-condition` (definition).

For h≥1, M satisfies monodromy when λ^{h−1}N_M,β^(j′) has a zero of order at least h−1 at u′=(−p)^{1/e′} for every j′. This is equivalent to N_M(M^rig)⊂M^rig, independent of eigenbasis, and is f-periodic. Under the imported Breuil–Kisin comparison with tame descent this is the condition cutting out potentially crystalline lifts in the present tame-type charts; it does not replace a general potentially semistable condition by N=0 on a Kisin module.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. The analytic coefficient hypotheses of T.2/monodromy-derivation hold, or its stated supplier extension to the complete local base is being used. At h=1 the order-zero vanishing test imposes no equation.

**Construction or proof.**

1. The only possible poles occur at Frobenius translates of E=0. Frobenius compatibility propagates regularity from the chosen root to those translates.
2. Multiplication by λ^{h−1} cancels the possible pole order; vanishing of its first h−1 jets removes that pole. Apply the supplier’s crystalline comparison.

**API.**

- `TauCeti.TameGL2.monodromyCondition` (characterisation): The order h−1 vanishing condition at the root of E.
- `TauCeti.TameGL2.monodromy_regular_iff` (equivalence): The condition holds exactly when N_M preserves M^rig.
- `TauCeti.TameGL2.monodromy_periodic` (simp): It suffices to check j′ modulo f rather than all f′ indices.

**Checks.**

- `TauCeti.TameGL2.monodromy_height_one` (degenerate): At h=1 the jet list is empty, matching automatic regularity in this formulation.
- `TauCeti.TameGL2.monodromy_height_three` (computation): At h=3 both value and first derivative must vanish; testing only the value admits a simple zero and is insufficient.
- `TauCeti.TameGL2.monodromy_basis_invariant` (compatibility): An analytic integral change of eigenbasis preserves the regularity formulation despite the additional derivative term in its matrix formula.

**Uses.** T.5/chart-models and T.6/single-presentation: This condition, after reduced O-flat closure, cuts out the actual deformation chart. T.2/jet-equations: Finite jets replace an analytic infinite series with explicit polynomial leading terms and controlled remainders.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.2/monodromy-derivation`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Sources.** BHHMS23, Definition 3.1.8 and following paragraph, p. 20.


### Explicit monodromy equations

Target `LocalGaloisDeformationRingsPartII:T.2/jet-equations` (theorem).

Write D_j=Diag((s′_{or,j})⁻¹a′^(j)) and P_N(A^(j−1))=(−e′v(dA^(j−1)/dv)−[D_j,A^(j−1)])(v+p)^h(A^(j−1))⁻¹. The monodromy condition is equivalent to the u′-jets of Ad((ṡ′_{or,j′})⁻¹(u′)^{−a′^(j′)})(λ^{h−1}N_M,β^(j′)) vanishing for t=0,…,h−2. If τ is L-generic, L≥2h−3 and (L−1)(p−1)≥h, those equations are (d/dv)^t P_N(A^(j−1))|_{v=−p}+ε_{j,t}=0, with the specific Frobenius-series remainder ε_{j,t}∈p^{L−(h−1)−t}M₂(R). The ε may depend on every embedding. They cannot be varied independently. For the types in T.4, L=N−1 and h=3 give errors p^{N−3−t}.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. Use the analytic hypotheses and basis conventions of T.2; the matrix product is interpreted after inverting v+p before taking its regular jets.

**Construction or proof.**

1. Apply the coordinate conjugation to the first term in the Frobenius series for N_M. The rest has extra powers of v from the genericity inequalities.
2. Differentiate t times and evaluate at v=−p; each derivative loses at most one power of p. The inequalities on L ensure every remaining series converges with the asserted valuation.
3. Use invertibility of u′ at E=0 after p is inverted to pass between u′-jets and v-jets without changing the zero condition.

**Acceptance.** For h=3 and N=12, the value and derivative remainders lie in p⁹ and p⁸, respectively. Preserve the commutator order [D,A]=DA−AD and the shifted index j−1. No test treats ε as arbitrary elements with a valuation bound.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.2/monodromy-derivation`, `LocalGaloisDeformationRingsPartII:T.2/monodromy-condition`, `LocalGaloisDeformationRingsPartII:T.0/orientation`, `LocalGaloisDeformationRingsPartII:T.0/genericity`, `mathlib:Polynomial.derivative`.

**Sources.** BHHMS23, Equation (16), Proposition 3.1.9, pp. 21–22; proof of Proposition 4.2.1, p. 29.


## Layer T.3: Residual representations and restriction

The normalized residual modules are built from monomial Frobenius matrices. Their classification is a tame representation statement with a primitivity hypothesis. Restriction to the Kummer tower is treated twice: full faithfulness on Hom requires a cyclotomic-free tensor, while the genericity hypothesis only yields a statement about Isom sets once a restricted isomorphism exists.

**Direct stage inputs.** `LocalGaloisDeformationRingsPartII:T.0`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `ModpRepresentationsOfGL2OverLocalFields:MP.3`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `LocalGaloisDeformationRings:R08.1`.


### Good tame presentations

Target `LocalGaloisDeformationRingsPartII:T.3/good-pair` (definition).

For (s,μ)∈(S₂)^f×(Z²)^f with cyclic indices, let d(i) be the orbit length of i under sτ. The pair is good if, for each i and each proper divisor d of d(i), Σ_{j=0}^{fd(i)−1}p^j(s₁⁻¹⋯s_j⁻¹ μ_j)_i is not divisible by (q^{d(i)}−1)/(q^d−1). For rank two this imposes no condition on a singleton orbit; for a two-cycle the test is nondivisibility by q+1. This is the primitiveness condition on each tame inertia orbit.

**Construction or proof.**

1. Build the integer orbit sum; this construction uses μ itself, with no additional η inserted.
2. Translate Frobenius invariance under a proper suborbit into divisibility of the character exponent.

**API.**

- `TauCeti.TameGL2.goodPair_iff` (characterisation): The orbit-sum nondivisibility test.
- `TauCeti.TameGL2.goodPair_split` (simp): If sτ=1, all orbit conditions are empty, hence the pair is good.
- `TauCeti.TameGL2.goodPair_nonsplit` (characterisation): For sτ=w the two-cycle exponent must not be divisible by q+1.

**Checks.**

- `TauCeti.TameGL2.goodPair_singletons` (degenerate): For f=1,s=1, every pair of integer exponents passes the good-pair test.
- `TauCeti.TameGL2.goodPair_bad_scalar` (non-example): For f=1,s=w, μ=(a,a) yields exponent (p+1)a and fails the test.
- `TauCeti.TameGL2.goodPair_nonsplit_example` (computation): For f=1,s=w, μ=(1,0) yields exponents 1 and p, neither divisible by p+1, and gives a primitive niveau-two orbit.

**Uses.** T.3/tame-classification: Primitiveness ensures the monomial representation is semisimple with the prescribed irreducible inertia orbits. T.4/residual-kisin-module: Deepness supplies a good normalized residual type.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.0/tame-type`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.

**Sources.** BHHMS23, Definition 3.2.1 and Remark 3.2.2, p. 22.


### Alcove presentations are good

Target `LocalGaloisDeformationRingsPartII:T.3/deep-pair-good` (lemma).

If μ−η∈C₀, then (s,μ) is good. In rank two the strict inequalities are 0<μ_{j,1}−μ_{j,2}<p. The assertion is a property of the chosen presentation, so it can be applied to the normalized semisimple residual input without strengthening the definition of genericity.

**Construction or proof.**

1. For a two-cycle, write the exponent as c₀+qc₁. The digit inequalities give 0<|c₀−c₁|<q.
2. Modulo q+1 the exponent is c₀−c₁, which is nonzero and smaller in absolute value than q+1. Singleton orbits impose no condition.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.3/good-pair`, `ModpRepresentationsOfGL2OverLocalFields:MP.3/weight-coordinates`.

**Sources.** BHHMS23, Lemma 3.2.3 and proof, p. 22.


### Monomial étale φ-modules

Target `LocalGaloisDeformationRingsPartII:T.3/monomial-etale-module` (construction).

For a tuple w̃_j=w_jt^{ν_j} of rank-two monomial matrices and D=(D_j)∈(T(F))^f, define M(w̃,D) as the free rank-two module over k((v))⊗_{F_p}F whose semilinear φ matrix on component j is D_j w̃_j. Extend coefficients through the R07.4 étale φ-module category; the F object here is its residual specialization. For the star convention used in type comparisons, (s t^μ)^*_j=t^{μ_{f−1−j}}s_{f−1−j}^{−1}; this reverses products.

**Construction or proof.**

1. Use the existing étale φ-module carrier, its component decomposition and tensor operations. Invertibility of each monomial matrix makes φ linearization an isomorphism.
2. Record the star operation on monomial tuples explicitly; it is an anti-isomorphism, not an index-preserving group homomorphism.

**API.**

- `TauCeti.TameGL2.monomialEtaleModule` (constructor): The imported étale module equipped with the standard component bases and matrices D_j w̃_j.
- `TauCeti.TameGL2.monomialEtale_phi` (projection): Its Frobenius matrix on component j is exactly D_j w̃_j.
- `TauCeti.TameGL2.monomialEtale_coefficients` (compatibility): It is the residual specialization of the R07.4 coefficient category and uses its semilinearity convention.
- `TauCeti.TameGL2.monomialEtale_diagonalChange` (relation): A diagonal basis change B_j transforms matrices by B_{j+1}⁻¹D_jw̃_jφ(B_j).

**Checks.**

- `TauCeti.TameGL2.etale_identity` (degenerate): For every w̃_j=1 and D_j=1, the module is a sum of two trivial rank-one étale modules.
- `TauCeti.TameGL2.etale_negative_power` (non-example): diag(v^{−1},1) is allowed over k((v)); demanding polynomial entries would incorrectly reject it.
- `TauCeti.TameGL2.star_reversal` (computation): For f=2, the index 0 star factor uses the original index 1; a product becomes the product in reversed order.

**Uses.** T.3/tame-representation: The contravariant étale realization attaches the residual Galois representation. T.4/residual-kisin-module: The formula D w̃(s w⁻¹)^*t^{(μ−sw⁻¹ν)^*}=D s^*t^{μ^*} makes the residual Galois type independent of the admissible shape.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-with-coefficients`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kummer-etale-phi-modules`, `mathlib:Matrix.det_fin_two`.

**Sources.** BHHMS23, Definition 3.2.4, p. 22; end of §2.1, p. 13.


### Tame monomial representations

Target `LocalGaloisDeformationRingsPartII:T.3/tame-representation` (construction).

Let K∞=⋃_n K(p_n), with p₀=−p and p_n^p=p_{n−1}. Define V(w̃,D) to be the unique tame continuous F-representation of G_K whose restriction to G_{K∞} is the contravariant realization V*_K(M(w̃,D)). Uniqueness means up to the isomorphism fixed by the tame restriction equivalence, not a preferred basis. For arbitrary w̃ this definition does not claim semisimplicity.

**Construction or proof.**

1. Apply R07.4’s exact contravariant étale realization.
2. The tame quotient map induced by G_{K∞}→G_K is an isomorphism, since K∞/K is a totally ramified p-power tower. Monomial modules give tame representations on that quotient.
3. Extend through that quotient equivalence; the Frobenius cycle and monomial exponents determine the inertial characters.

**API.**

- `TauCeti.TameGL2.tameMonomialRep` (constructor): The tame extension of V*_K(M(w̃,D)).
- `TauCeti.TameGL2.tameMonomialRep_restrict` (compatibility): Its K∞ restriction is the supplier’s contravariant realization, with the chosen −p Kummer tower.
- `TauCeti.TameGL2.tameMonomialRep_inertia` (projection): If w̃*=t^{μ′}s′, its inertia is the imported τ(s′,μ′).

**Checks.**

- `TauCeti.TameGL2.tameRep_trivial` (degenerate): w̃=1,D=1 gives the two-dimensional trivial representation.
- `TauCeti.TameGL2.tameRep_two_cycle` (computation): A primitive two-cycle gives an irreducible tame representation of niveau 2f, rather than a split sum over G_K.
- `TauCeti.TameGL2.tameRep_no_inverse_twist` (computation): For a rank-one cycle with product α of the D entries, the arithmetic Frobenius eigenvalue is α, not α⁻¹, under this contravariant convention.

**Uses.** T.3/tame-classification: Classifies semisimple residual representations with fixed inertia. T.4/residual-kisin-module: Chooses D producing the prescribed semisimple residual representation.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.3/monomial-etale-module`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.

**Sources.** BHHMS23, Definition 3.2.5 and preceding paragraph, pp. 22–23.


### Unramified twists

Target `LocalGaloisDeformationRingsPartII:T.3/unramified-twist` (lemma).

For λ=(λ_j)∈(F×)^f, V(w̃,λD)≅V(w̃,D)⊗nr(∏_jλ_j), where nr(α) sends arithmetic Frobenius to α. Scaling all components by the same λ gives nr(λ^f), not nr(λ).

**Construction or proof.**

1. Tensor the monomial module with the rank-one module having φ_j=λ_j.
2. A diagonal basis change concentrates all λ_j in the last component. Contravariant realization in the fixed convention gives arithmetic Frobenius equal to their product.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.3/monomial-etale-module`, `LocalGaloisDeformationRingsPartII:T.3/tame-representation`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

**Sources.** BHHMS23, Lemma 3.2.6, p. 23.


### Classification with fixed tame inertia

Target `LocalGaloisDeformationRingsPartII:T.3/tame-classification` (theorem).

If w̃*=t^{μ′}s′ and (s′,μ′) is good, the isomorphism classes of semisimple ρ:G_K→GL₂(F) with ρ|_{I_K}≅τ(s′,μ′) are exactly {V(w̃,D):D∈T(F)^f}/≅. Coefficients are enlarged finitely where necessary so all unramified scalar twists used in the classification are defined. No injectivity of the parametrization by D is asserted.

**Construction or proof.**

1. Split the permutation into its singleton or two-cycle orbits. Goodness makes each orbit an irreducible inertia system, so its tame extension is irreducible.
2. For an irreducible orbit any two G_K extensions with the same inertia differ by an unramified twist; realize that twist by the preceding product formula.
3. Take the direct sum over the orbits. Reversing this argument proves all monomial representations in the family have the required semisimple inertia.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.3/good-pair`, `LocalGaloisDeformationRingsPartII:T.3/monomial-etale-module`, `LocalGaloisDeformationRingsPartII:T.3/tame-representation`, `LocalGaloisDeformationRingsPartII:T.3/unramified-twist`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.

**Sources.** BHHMS23, Proposition 3.2.7 and equation (19), p. 23.


### Cyclotomic-free representations

Target `LocalGaloisDeformationRingsPartII:T.3/cyclotomic-free` (definition).

A finite-dimensional continuous F-representation ρ of G_K is cyclotomic free when, after an unramified extension K′/K of degree prime to p, it is upper triangular and H⁰(G_{K′},(ρ|_{G_{K′}})^ss⊗ω⁻¹)=0. The choice of K′ is existential. In the upper-triangular restriction this excludes the mod-p cyclotomic character as a diagonal constituent; it does not exclude the trivial character.

**Construction or proof.**

1. Express the condition on the existing representation carrier through restriction, semisimplification and invariants.
2. Use characters on a triangular restriction to test H⁰; retain the prime-to-p condition on the extension degree.

**API.**

- `TauCeti.TameGL2.cyclotomicFree_iff` (characterisation): Existence of an unramified prime-to-p triangularizing extension with the stated invariant vanishing.
- `TauCeti.TameGL2.cyclotomicFree_iso` (compatibility): The predicate is invariant under representation isomorphism.
- `TauCeti.TameGL2.cyclotomicFree_characters` (characterisation): On an allowed triangularizing extension, no semisimple diagonal character is ω.

**Checks.**

- `TauCeti.TameGL2.cyclofree_trivial` (degenerate): For p>2 and K unramified, the trivial character is cyclotomic free because ω is nontrivial.
- `TauCeti.TameGL2.cyclofree_cyclotomic` (non-example): The character ω fails: tensoring with ω⁻¹ gives a nonzero invariant.
- `TauCeti.TameGL2.cyclofree_tensor_needed` (non-example): For p>2 and unramified K, take ρ₁=1 and ρ₂=ω. Then ρ₁ is cyclotomic free, but ρ₁∨⊗ρ₂=ω is not: tensoring it with ω⁻¹ has a nonzero invariant. The Hom-descent hypothesis must test the tensor representation.

**Uses.** T.3/restriction-hom: The tensor condition ensures every K∞-equivariant map descends. T.6/single-presentation: The 2-generic residual adjoint is cyclotomic free, which identifies the Galois and Kisin deformation groupoids.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.

**Sources.** BHHMS23, Paragraph before Lemma 3.2.8, p. 23.


### Cyclotomic-free restriction on Hom

Target `LocalGaloisDeformationRingsPartII:T.3/restriction-hom` (theorem).

If ρ₁∨⊗ρ₂ is cyclotomic free, restriction induces an isomorphism Hom_{G_K}(ρ₁,ρ₂)→Hom_{G_{K∞}}(ρ₁|,ρ₂|). The tensor hypothesis is required. In particular the result does not assert full faithfulness for all residual representations.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ₁ and ρ₂ are finite-dimensional continuous F-representations.

**Construction or proof.**

1. Regard an equivariant Hom as an invariant in ρ₁∨⊗ρ₂. Restrict to an unramified prime-to-p triangularizing extension from the cyclotomic-free condition.
2. Apply the R07.4 requested Kummer restriction invariant theorem excluding ω in the semisimplification; descend through the prime-to-p unramified extension.
3. Restriction is injective as a map of underlying linear maps, so this proves the asserted bijection.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.3/cyclotomic-free`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Sources.** BHHMS23, Lemma 3.2.8, pp. 23–24.


### Descent of isomorphisms

Target `LocalGaloisDeformationRingsPartII:T.3/restriction-isom` (theorem).

If ρ₁ is 2-generic and ρ₂ is any finite-dimensional continuous F-representation of the same dimension, Isom_{G_K}(ρ₁,ρ₂)→Isom_{G_{K∞}}(ρ₁|,ρ₂|) is bijective. If the right-hand set is nonempty, the two semisimplifications agree and the tensor hypothesis for Hom descent follows. The conclusion concerns isomorphisms; 2-genericity of ρ₁ alone is not a statement about every Hom to every ρ₂.

**Construction or proof.**

1. Semisimple representations factor through the tame quotient, which is unchanged by the Kummer tower. Thus an isomorphism after restriction forces equality of semisimplifications.
2. The 2-generic exponent inequalities imply ad(ρ₁) is cyclotomic free, so the same holds for the tensor once the semisimplifications agree.
3. Apply restriction-hom and note that the descended underlying invertible linear map has an equivariant inverse. If there is no restricted isomorphism, both sets are empty.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.0/genericity`, `LocalGaloisDeformationRingsPartII:T.3/tame-representation`, `LocalGaloisDeformationRingsPartII:T.3/cyclotomic-free`, `LocalGaloisDeformationRingsPartII:T.3/restriction-hom`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.

**Sources.** BHHMS23, Corollary 3.2.9 and proof, p. 24.


## Layer T.4: Admissible types and residual Kisin modules

From this layer onward the normalized semisimple N-deep data in the conventions are mandatory. A type is attached to every tuple of the three displayed shapes. The two extreme shapes, together with the reversed embedding index, encode the Serre weights. This supplies the exact finite type set used in the union ring.

**Direct stage inputs.** `LocalGaloisDeformationRingsPartII:T.0`, `LocalGaloisDeformationRingsPartII:T.3`, `ModpRepresentationsOfGL2OverLocalFields:MP.3`, `LocalGaloisDeformationRingsPartII:T.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `ModpRepresentationsOfGL2OverLocalFields:MP.5`, `LocalGaloisDeformationRings:R08.3`.


### Admissible tame types

Target `LocalGaloisDeformationRingsPartII:T.4/admissible-types` (construction).

Write U₁=t^(2,1), U₂=w t^(2,1), U₃=t^(1,2), and Adm∨={U₁,U₂,U₃}^f. For w̃∈Adm∨ write w̃*=t^νw and set τ_{w̃}=τ(sw⁻¹,μ−sw⁻¹ν), with lowest-alcove coordinate μ(τ)=μ−sw⁻¹ν−η. These are (N−1)-generic types. The star operation reverses the embedding index f−1−j as fixed in T.3; i(w̃)_j∈{1,2,3} records the displayed shape, not its star image.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Use the three explicit monomial matrices and the star operation to compute ν and w. This is the rank-two admissible set needed here and requires no new general affine-Weyl-group development.
2. Subtract sw⁻¹ν and η and check the depth inequalities entrywise. The shifts lose at most one unit of depth.

**API.**

- `TauCeti.TameGL2.admissibleType` (constructor): The type τ_{w̃} for a tuple of the three displayed shapes.
- `TauCeti.TameGL2.admissibleType_presentation` (projection): Its presentation is (sw⁻¹,μ−sw⁻¹ν−η).
- `TauCeti.TameGL2.admissibleType_depth` (relation): The chosen presentation is (N−1)-deep, sufficient for the gauge and monodromy inequalities.

**Checks.**

- `TauCeti.TameGL2.admissible_three` (computation): At f=1, the admissible set consists of exactly U₁,U₂,U₃, not a fourth shape.
- `TauCeti.TameGL2.admissible_middle_star` (computation): At f=1, U₂*=t^(2,1)w, whereas U₁*=t^(2,1); multiplication order distinguishes their presentations.
- `TauCeti.TameGL2.admissible_depth` (computation): At N=12 the chosen type coordinates are at least 11-deep, satisfying the h=3 gauge bound and L=11 monodromy bound.

**Uses.** T.4/residual-kisin-module: Each type has one semisimple residual Kisin module in the indicated shape. T.6 and T.7: These are all the types occurring in the one-weight union.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.0/tame-type`, `LocalGaloisDeformationRingsPartII:T.0/genericity`, `LocalGaloisDeformationRingsPartII:T.3/monomial-etale-module`, `ModpRepresentationsOfGL2OverLocalFields:MP.3/weight-coordinates`.

**Sources.** BHHMS23, §4.1, equations and discussion before Lemma 4.1.1, p. 25.


### Semisimple residual Kisin modules

Target `LocalGaloisDeformationRingsPartII:T.4/residual-kisin-module` (theorem).

For every w̃∈Adm∨ there is, up to isomorphism, a unique semisimple M̄∈Y^≤(3,0),τ_{w̃}(F) with shape w̃ and T*_dd(M̄)≅ρ̄|_{G_{K∞}}. It has a gauge eigenbasis with A^(j)=D_jw̃_j for diagonal D_j∈T(F). Uniqueness is not asserted for every nonsemisimple Kisin module of that type.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Build the monomial gauge module with A=Dw̃. The three shapes obey the (3,0) Hodge bound.
2. Its associated étale matrix is (D w̃(sw⁻¹)^*t^{(μ−sw⁻¹ν)^*})_j=(D s^*t^{μ^*})_j. Deep-pair-good and tame classification choose D realizing ρ̄.
3. For uniqueness, compare two height lattices in that étale module. The inequalities 3<⟨μ(τ)_j+η,α∨⟩<p−4 force all nonconstant change-of-lattice coefficients to vanish by the same contracting degree estimates used for gauge bases; the remaining diagonal changes give an isomorphism.

**Acceptance.** Both split semisimple and irreducible residual representations are included. The result is uniqueness of an isomorphism class, not uniqueness of D or of a gauge basis.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.4/admissible-types`, `LocalGaloisDeformationRingsPartII:T.1/shape`, `LocalGaloisDeformationRingsPartII:T.1/gauge-basis`, `LocalGaloisDeformationRingsPartII:T.1/gauge-existence`, `LocalGaloisDeformationRingsPartII:T.3/deep-pair-good`, `LocalGaloisDeformationRingsPartII:T.3/tame-classification`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Sources.** BHHMS23, Lemma 4.1.1 and proof, pp. 25–26.


### Weights and extreme shapes

Target `LocalGaloisDeformationRingsPartII:T.4/weight-shape-bijection` (theorem).

There is a unique bijection θ:W(ρ̄)→{U₁,U₃}^f such that σ∈JH(σ̄(τ_{w̃})⊗(N_{k/F_p}∘det)) iff w̃_j≠θ(σ)_j for every j. For any tame inertial type τ, the twisted JH set meets W(ρ̄) iff τ≅τ_{w̃} for some w̃∈Adm∨. Thus X(σ)={w̃:∀j,w̃_j≠θ(σ)_j} has cardinal 2^f, and τ_{w̃}, w̃∈X(σ), are pairwise distinct. If σ=F(t_{μ−η}(sω)), then θ(σ)_j=U₃ when ω_{f−1−j}=0 and U₁ when that coordinate is η.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Combine the imported formula for W(ρ̄) with T.0/type-jordan-holder. The norm-determinant twist adds (1,1) to the type parameter and must be retained.
2. For f=1 compare ω∈{0,η} with the three shapes: θ(0)=U₃ and θ(η)=U₁. Take the product over embeddings with reversal f−1−j; vary a single non-middle coordinate to prove uniqueness.
3. The MP.5 projective-adjoint node gives the generic finite projective lift exactly 2^f pairwise distinct characteristic-zero constituents. The 2^f types already found exhaust them, using the requested compact-type comparison. This proves no additional tame types meet the weight.

**Acceptance.** For f=1, θ(0)=U₃ allows U₁,U₂ and excludes U₃; θ(η)=U₁ allows U₂,U₃. For f=2, X(σ) has four elements, with the two weight coordinates reversed when selecting the local tables. Dropping N∘det changes the central character and fails the formula.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.4/admissible-types`, `LocalGaloisDeformationRingsPartII:T.0/type-jordan-holder`, `ModpRepresentationsOfGL2OverLocalFields:MP.3/tame-weight-set`, `ModpRepresentationsOfGL2OverLocalFields:MP.3/translation-map`, `ModpRepresentationsOfGL2OverLocalFields:MP.5/projective-adjoint`, `LocalGaloisDeformationRings:R08.3`.

**Sources.** BHHMS23, Lemma 4.1.2 and equations (20)–(21), pp. 26–27.


## Layer T.5: Polynomial charts and effective comparison

First define the small-Hodge finite union from the existing fixed-profile rings. The finite height and monodromy equations define an actual reduced O-flat chart. Their five simplified polynomial equations define a separate model. The p³ Jacobian calculation produces a correction modulo p^(N−8); nonemptiness for every Hodge profile proves that the corrected surjection is an isomorphism. One ambient automorphism transports all equations and all prime factors together. The gauge/Galois comparison is stated separately so the component-counting proof does not silently assume the final presentation.

**Direct stage inputs.** `LocalGaloisDeformationRings:R08.1`, `LocalGaloisDeformationRings:R08.3`, `DeformationAndDerivedPatchingAlgebra:R03.4`, `LocalGaloisDeformationRingsPartII:T.1`, `LocalGaloisDeformationRingsPartII:T.2`, `LocalGaloisDeformationRingsPartII:T.4`, `LocalGaloisDeformationRingsPartII:T.0`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `ModpRepresentationsOfGL2OverLocalFields:MP.5`, `LocalGaloisDeformationRingsPartII:T.3`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `LocalGaloisDeformationRings:L7`.


### Small-Hodge deformation quotients

Target `LocalGaloisDeformationRingsPartII:T.5/small-hodge-quotient` (construction).

In the existing universal framed deformation ring R□_{ρ̄}, intersect the kernels of the fixed potentially crystalline quotients R_{ρ̄}^{λ,τ}, as λ runs over {(3,0),(2,1)}^f. Define R_{ρ̄}^{≤30,τ} to be the quotient by that intersection. It is the maximal reduced O-flat quotient with characteristic-zero points of inertial type τ and exactly those labelled Hodge profiles. Each fixed-profile ring is imported from R08.3, not reconstructed here. The notation ≤30 is this finite union with total weight 3; it does not include arbitrary weights in [0,3].

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Use the existing fixed-(λ,τ) rings and their kernel ideals in R□_{ρ̄}.
2. A finite intersection of reduced O-flat quotient ideals is again radical and p-saturated: embed its quotient in the product of the fixed-profile rings. The imported characteristic-zero point criterion identifies the union.

**API.**

- `TauCeti.TameGL2.smallHodgeRing` (constructor): The finite-union quotient by the intersection of the fixed-profile kernels.
- `TauCeti.TameGL2.smallHodgeRing_toProfile` (projection): There is a natural surjection onto each R^{λ,τ}, preserving its given framing.
- `TauCeti.TameGL2.smallHodgeRing_points` (characterisation): An O′-valued point for a finite extension E′/E is a framed potentially crystalline lift of type τ and one of the indicated labelled profiles.
- `TauCeti.TameGL2.smallHodgeRing_existing` (compatibility): Its fixed-profile quotient maps are the imported R08.3 maps; determinant remains unrestricted.

**Checks.**

- `TauCeti.TameGL2.smallHodge_one_embedding` (non-example): At f=1, the allowed profiles are exactly (3,0) and (2,1), excluding (2,0) and (3,1).
- `TauCeti.TameGL2.smallHodge_union_kernel` (characterisation): For two distinct nonzero profile kernels I,J the union uses I∩J, while I+J parametrizes their scheme-theoretic intersection.
- `TauCeti.TameGL2.smallHodge_no_determinant` (non-example): An allowed unramified determinant twist remains in the framed functor when its inertia and weights are unchanged; a fixed determinant functor would remove that parameter.

**Uses.** T.6/single-presentation: Names the Galois side of the one-type stable presentation. T.7/weight-union: Forms the further finite union over the tame types containing σ.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`, `LocalGaloisDeformationRings:R08.3/hodge-type-components`, `DeformationAndDerivedPatchingAlgebra:R03.4/flat-reduced-quotients-by-points`, `mathlib:Ideal.Quotient.ring`.

**Sources.** BHHMS23, Opening of §4.2, pp. 27–28.


### Polynomial gauge charts

Target `LocalGaloisDeformationRingsPartII:T.5/chart-models` (construction).

For each embedding table index j put z=v+p. Each local ambient ring R_j is O[[eight variables]], with the two starred coefficients equal to their fixed nonzero residual Teichmüller values plus formal variables; every other displayed coefficient is a formal variable. Define the three matrices
A₁=[[z²e₁₁*+zd₁₁+c₁₁,c₁₂],[v(zd₂₁+c₂₁),zd₂₂*+c₂₂]],
A₂=[[zd₁₁+c₁₁,zd₁₂*+c₁₂],[v(zd₂₁*+c₂₁),zd₂₂+c₂₂]],
A₃=[[zd₁₁*+c₁₁,zd₁₂+c₁₂],[vc₂₁,z²e₂₂*+zd₂₂+c₂₂]].
The matrices are at embedding f−1−j. The constants a₁,a₂,a₃∈Z_(p) are the actual oriented exponent differences divided by e′ in the monodromy computation; modulo p they are respectively −sgn(s_j)(r_j+1)+1, sgn(s_j)(r_j+1)+1, −sgn(s_j)(r_j+1)−1. They depend on the whole type. All displayed denominators are units under section4 hypotheses.
For A₁ set u=e₁₁*, d=d₂₂*, a=a₁, x=c₁₂d₂₁/(ud). Its ordered polynomial equations G₁,…,G₅ are
(d₁₁+(a−2)c₁₂d₂₁/d,
 c₂₂−(a−1)c₁₂d₂₁/u,
 c₂₁+(a−1)(a−2)c₁₂d₂₁²/(aud),
 c₁₁−(c₁₂d₂₁/d)((a−1)²(a−2)x/a−p),
 c₁₂((a−1)(a−2)x−2p)).
For A₂ set u=d₁₂*, d=d₂₁*, a=a₂, t=d₁₁d₂₂/(ud). The list is
(c₂₁+(a−1)d(t+p),
 c₁₂−au(t+p),
 c₁₁+a(a−1)d₁₁(t+p)/(a+1),
 c₂₂−a(a−1)d₂₂(t+p)/(a−2),
 (t+p)(a(a−1)t/((a−2)(a+1))+p)).
For A₃ set u=d₁₁*, d=e₂₂*, a=a₃, x=d₁₂c₂₁/(ud). The list is
(d₂₂−(a+1)d₁₂c₂₁/u,
 c₁₁+ad₁₂c₂₁/d,
 c₁₂−a(a+1)d₁₂²c₂₁/((a−1)ud),
 c₂₂−(d₁₂c₂₁/u)(a²(a+1)x/(a−1)−p),
 c₂₁(a(a+1)x−2p)).
Let I^poly_j be the ideal of these five equations. Its two polynomial component ideals P^poly_{j,21}, P^poly_{j,30} are I^poly_j plus, respectively, the first and second factor of G₅. Fractions mean multiplication by the indicated units. In each chart the dense polynomial subring uses c₁₂/e₁₁*,d₂₁/d₂₂* in chart 1; d₁₁/d₁₂*,d₂₂/d₂₁* in chart 2; and d₁₂/d₁₁*,c₂₁/e₂₂* in chart 3, with the remaining coordinates unchanged. It is a polynomial algebra in eight parameters. Let R=⊗̂_O R_j and I^poly=Σ_j I^poly_j R.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data. A type w̃ and a semisimple residual gauge module from T.4 are fixed. The two residual unit values may vary with j.

**Construction or proof.**

1. Apply the rank-two gauge degree bounds to obtain A₁,A₂,A₃ and exactly eight independent scalar parameters per embedding.
2. Expand det A−(its leading unit)z³ to obtain the three finite-height coefficient equations; use the h=3 leading monodromy jets for the eight monodromy equations.
3. Use p-saturation and elimination in the actual reduced O-flat quotient to deduce G_i∈(I∞,p^{N−5}), where I∞ denotes the actual finite-height and monodromy closure. These five equations define the polynomial model, not yet the actual ideal.
4. The first four G_i eliminate four parameters; G₅ factors as displayed. Preserve the dense polynomial coordinates so the subsequent approximation is finite-presentation algebra.

**API.**

- `TauCeti.TameGL2.gaugeChartMatrix` (constructor): The indicated matrix A_i over the existing polynomial ring; the light finite-index encoding uses 0,1,2 for shapes U₁,U₂,U₃.
- `TauCeti.TameGL2.polynomialChartIdeal` (constructor): The ideal generated by the displayed five equations in the dense polynomial ring, then extended to R_j.
- `TauCeti.TameGL2.polynomialComponentIdeal` (constructor): Add the selected (2,1) or (3,0) factor of G₅ to I^poly_j.
- `TauCeti.TameGL2.chart_height_coefficients` (compatibility): The three lower coefficients of det A−(leading unit)z³ give the finite-height ideal, agreeing with the imported height condition.
- `TauCeti.TameGL2.chart_model_accuracy` (relation): Every G_i maps into p^{N−5}(R/I∞); the model is not identified with I∞ by deleting tails.
- `TauCeti.TameGL2.gaugeChartMatrix_lowerLeft` (relation): For arbitrary coefficient values in a commutative ring, v divides the lower-left entry of each of the three displayed matrices.
- `TauCeti.TameGL2.middleChartHypersurface` (data): For a unit b, the remaining middle hypersurface is b⁻¹(xy+p)(xy+bp); the source value b=(a₂−2)(a₂+1)/(a₂(a₂−1)) is used for the model chart.

**Checks.**

- `TauCeti.TameGL2.chart_residual` (computation): Reduce modulo ϖ and set all eight formal parameters to zero, including the increments of both starred coefficients. The starred values remain their fixed nonzero residues, and the three matrices become D U_i with their prescribed residual diagonal D.
- `TauCeti.TameGL2.chart_middle_factors` (computation): After eliminating four variables in chart 2, set x=d₁₁/d₁₂*,y=d₂₂/d₂₁*, b=(a−2)(a+1)/(a(a−1)); G₅=b⁻¹(xy+p)(xy+bp), with b−1=−2/(a(a−1)) a unit.
- `TauCeti.TameGL2.chart_outer_factors` (computation): In chart 1 the (2,1) factor is c₁₂ and in chart 3 it is c₂₁; swapping these labels changes the Hodge component.
- `TauCeti.TameGL2.chart_table_index` (computation): For f=2 and λ₀≠λ₁, table index j=0 describes A^(1) and its factor carries λ₁; table index j=1 describes A^(0) and carries λ₀. Labelling table j by λ_j swaps these two Hodge conditions.
- `TauCeti.TameGL2.hypersurface_origin` (degenerate): At x=y=0 the middle hypersurface is p² for every unit b.
- `TauCeti.TameGL2.hypersurface_integer` (computation): Over Z with p=3,b=−1,x=2,y=3, the hypersurface value is −27.
- `TauCeti.TameGL2.hypersurface_repeated_factor` (degenerate): At b=1 the hypersurface is (xy+p)². This degenerate test does not satisfy the unit b−1 hypothesis of the Jacobian bound.

**Uses.** T.5/jacobian-bound and T.5/chart-approximation: The five finite polynomial equations allow an effective p-adic Newton correction. T.6 and T.7: Transported component factors give explicit kernels and the integral p-membership witnesses.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.1/gauge-basis`, `LocalGaloisDeformationRingsPartII:T.1/gauge-existence`, `LocalGaloisDeformationRingsPartII:T.2/jet-equations`, `LocalGaloisDeformationRingsPartII:T.4/residual-kisin-module`, `LocalGaloisDeformationRingsPartII:T.0/orientation`, `mathlib:MvPowerSeries`, `mathlib:Ideal.span`, `mathlib:Matrix.det_fin_two`, `DeformationAndDerivedPatchingAlgebra:R03.1/completed-tensor-products`.

**Sources.** BHHMS23, Tables 1–3, pp. 41–43; proof of Proposition 4.2.1 and equation (23), pp. 28–31.


### Irreducible crossing equations

Target `LocalGaloisDeformationRingsPartII:T.5/irreducible-crossing` (lemma).

Let O be a complete DVR, A=O[[x₁,…,x_n]], n≥2, d>0, and u∈A×. Then x₁x₂+ϖ^d u is irreducible and generates a prime ideal. That ideal differs from (x₁). If u₁ and u₂ have different residues in A/m_A, their associated principal ideals differ. This is a sufficient residue test, not an equivalence for all u₁,u₂.

**Hypotheses.** O is any complete DVR here; the section4 prime and genericity bounds are unnecessary.

**Construction or proof.**

1. Replace x₂ by x₁+x₂ and apply the pinned Weierstrass preparation/division theorem in x₁ over O[[x₂,…,x_n]]. Any proper factor forces a root b in that coefficient ring’s maximal ideal.
2. The equation b²+bx₂+ϖ^d u(b,…)=0 implies ϖ^d divides b or b+x₂, since x₂ is not divisible by ϖ. Dividing gives a contradiction to u being a unit.
3. The imported regular-local UFD theorem makes irreducible elements prime. Compare Weierstrass factors and constant coefficients to distinguish the indicated ideals.

**Acceptance.** The unit hypothesis excludes x₁x₂+ϖx₁, which is reducible. Ramified O is allowed: p is a positive uniformizer power times a unit, so the lemma applies to xy+up.

**Dependencies.** `mathlib:PowerSeries.exists_isWeierstrassFactorization`, `mathlib:PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod`, `DeformationAndDerivedPatchingAlgebra:R03.3/regularity-localization-and-descent`.

**Sources.** BHHMS23, Lemma 3.3.1 and proof, p. 24.


### Effective Jacobian bound

Target `LocalGaloisDeformationRingsPartII:T.5/jacobian-bound` (theorem).

For each dense eight-variable chart with ideal (G₁,…,G₅), let J₅ be the ideal of the 5×5 minors of its Jacobian matrix. Then p³∈I^poly_j+J₅; in charts 1 and 3 even p² lies in that ideal. For chart 2 put x=d₁₁/d₁₂*,y=d₂₂/d₂₁*, b=(a₂−2)(a₂+1)/(a₂(a₂−1)), F=b⁻¹(xy+p)(xy+bp). Eliminating G₁,…,G₄ identifies the relevant minors with F_x,F_y. The identity (2(b+1)xy+p(b−1)²)F−((b+1)xy+p(b²+1))xF_x=p³(b−1)² proves the assertion, since b and b−1 are units.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Use the normalized polynomial coordinates and the four coefficient equations that are linear with unit pivots. Appropriate 5×5 minors recover the derivatives of the remaining hypersurface equation modulo I^poly_j.
2. Verify the displayed polynomial identity after multiplying by b to clear its unit denominator. Since p>2 and a₂,a₂−1 are units, b−1=−2/(a₂(a₂−1)) is a unit.
3. For the outer charts the remaining hypersurface is a unit multiple of X(XY−up), with u a unit. Its value and partial derivatives give p²; multiply by p for the uniform p³ bound.

**Acceptance.** No replacement of p by ϖ is made in the exponent 3. Check the identity with x=y=0: both sides equal p³(b−1)². All denominators are units using the stated N-deep inequalities.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.5/chart-models`, `mathlib:Polynomial.derivative`, `mathlib:Ideal.span_le`.

**Sources.** BHHMS23, Lemma 4.2.3, p. 31.


### Effective chart approximation

Target `LocalGaloisDeformationRingsPartII:T.5/chart-approximation` (theorem).

Let A be a p-adically complete Noetherian p-torsion-free O-algebra. For one of the three normalized chart systems G in eight variables and an approximate point a∈A⁸ in its fixed residual chart, suppose G(a)∈p^n A⁵ and n>6. There is an exact point a° with G(a°)=0 and a°−a∈p^{n−3}A⁸. Consequently, for n=N−5 the actual reduced O-flat chart A=R/I∞ receives an O-map R/I^poly→A congruent to the natural coordinate map modulo p^{N−8}; it is a surjection for N≥12. This is the specific chart consequence of Elkik’s lemma, rather than a new plan for arbitrary henselian approximation.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Evaluate the Jacobian bound: p³ belongs to the evaluated Jacobian-minor ideal, since G(a) is divisible by p^n and 1−p^{n−3}c is a unit. Adjugate matrices give a right inverse to the Jacobian after division by p³.
2. Correct the approximate point by an element in p^{n−3}A⁸. Taylor expansion raises the error exponent to 2(n−3)>n. The Jacobian bound persists because the correction is divisible by p⁴. Iterate; p-completeness gives a zero with the asserted precision.
3. Apply this to every j in the actual quotient, where model accuracy gives n=N−5≥7. Tensor the maps, extend continuously to the completed tensor product, and use identity on the relative cotangent space to get surjectivity.

**Acceptance.** At N=12, n=7>6 and the coordinate correction is p⁴. At n=6 the stated iteration need not improve the error; it is deliberately excluded. A singularity bound alone does not identify the quotient: T.5/nonempty-profiles and component counting are still required.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.5/chart-models`, `LocalGaloisDeformationRingsPartII:T.5/jacobian-bound`, `mathlib:IsAdicComplete`, `DeformationAndDerivedPatchingAlgebra:R03.1/continuous-power-series-evaluation`, `DeformationAndDerivedPatchingAlgebra:R03.1/completed-tensor-products`, `DeformationAndDerivedPatchingAlgebra:R03.1/artinian-limit-and-quotient-cofinality`.

**Sources.** BHHMS23, Proof of Proposition 4.2.1, pp. 31–32; Elkik73, §0.2 and Lemme 1, pp. 555–557.


### Nonempty Hodge profiles

Target `LocalGaloisDeformationRingsPartII:T.5/nonempty-profiles` (application).

For every w̃∈Adm∨ and every λ∈{(3,0),(2,1)}^f, ρ̄ admits a potentially crystalline characteristic-zero lift of inertial type τ_{w̃} and labelled Hodge–Tate weights λ, after a finite extension of E. Thus all 2^f Hodge-labelled generic loci are nonempty. The input lifting-existence contract is the R08.3 request: the GHLS extended-Fontaine–Laffaille seed and the compact-type constituent criterion, translated to cyclotomic weight +1 as used by BHHMS equation (26). This existence assertion is not deduced from the dimension or smoothness theorem alone.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. T.4/weight-shape-bijection gives a weight in JH(σ̄(τ)⊗Norm∘det)∩W(ρ̄).
2. For λ_j=(3,0), tensor a deep type constituent with the algebraic representation of highest weight (2,0). The decomposition of that tensor product includes its determinant twist, corresponding to the middle relative shift (1,1). For λ_j=(2,1), tensoring with the one-dimensional determinant representation gives this twist directly. Use MP.5/projective-adjoint and the fact that all type constituents are 7-deep to justify the decomposition and its lattice comparison.
3. The resulting constituent lies in W(ρ̄), and its crystalline extended-Fontaine–Laffaille realization is the requested seed for GHLS. Apply the requested, convention-translated lifting theorem to obtain a point of the fixed (λ,τ) ring.

**Acceptance.** All 2^f profiles, including mixed (3,0)/(2,1), must be realized. The GHLS seed is an explicit supplier obligation, not an omitted hypothesis.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.4/weight-shape-bijection`, `LocalGaloisDeformationRingsPartII:T.0/type-jordan-holder`, `ModpRepresentationsOfGL2OverLocalFields:MP.5/projective-adjoint`, `LocalGaloisDeformationRings:R08.3`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`.

**Sources.** BHHMS23, Proof of Proposition 4.2.1 and equation (26), p. 32; GHLS17, Theorem D, p. 4; §1.2, pp. 5–6; Theorem 3.1.5, p. 21.


### Gauge and Galois deformation comparison

Target `LocalGaloisDeformationRingsPartII:T.5/gauge-galois-comparison` (comparison).

For the fixed residual module and type, write A∞=R/I∞ for the maximal reduced O-flat height-and-monodromy chart. Use the small-Hodge finite-union quotient R_{ρ̄}^{≤30,τ} with profiles (3,0) or (2,1) at each embedding. There is an O-algebra isomorphism R_{ρ̄}^{≤30,τ}[[X₁,…,X_{2f}]]≅A∞[[Y₁,…,Y₄]]. It respects every additional Hodge-bound condition. The 2f variables account for diagonal gauge choices and the four variables for the Galois framing; there is no fixed-determinant reduction.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Use the R07.4 requested relative Breuil–Kisin comparison with tame descent, height bounds and monodromy, together with the unique residual chart from T.4.
2. Cyclotomic-free restriction identifies morphisms of the underlying Galois deformations with those of their K∞ restrictions. The deep lattice estimates identify the relevant integral lattices.
3. The scheme of residual-trivial diagonal gauge choices is formally smooth of relative dimension 2f, and the choice of a Galois framing is formally smooth of relative dimension 4. Apply continuous power-series evaluation to their representing complete local rings.
4. The construction is functorial for the minor/Hodge-bound conditions; it can therefore be used to count and identify their characteristic-zero components.

**Acceptance.** Check 2f versus 2²=4, rather than the rank-three variable counts of the cited precursor. The construction compares reduced O-flat quotients and all additional Hodge bounds.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.5/small-hodge-quotient`, `LocalGaloisDeformationRingsPartII:T.4/residual-kisin-module`, `LocalGaloisDeformationRingsPartII:T.1/gauge-existence`, `LocalGaloisDeformationRingsPartII:T.2/monodromy-condition`, `LocalGaloisDeformationRingsPartII:T.3/restriction-hom`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`, `LocalGaloisDeformationRings:L7/height-lattice-moduli`, `DeformationAndDerivedPatchingAlgebra:R03.1/continuous-power-series-evaluation`.

**Sources.** BHHMS23, Equation (22) and its explanation, p. 29.


### Effective ambient comparison

Target `LocalGaloisDeformationRingsPartII:T.5/ambient-automorphism` (theorem).

Let I∞⊂R be the kernel of the maximal reduced O-flat quotient of the finite-height and actual monodromy equations for the fixed gauged residual module. The approximation map R/I^poly→R/I∞ is an isomorphism. It lifts to an O-algebra automorphism ψ:R≅R with ψ≡id mod p^{N−8} and ψ(I^poly)=I∞. Define I_j=ψ(I^poly_jR) and P_{j,λ}=ψ(P^poly_{j,λ}R) using this one ψ for the entire type. Then I∞=ΣI_j and Σ_jP_{j,λ_{f−1−j}} are exactly its distinct minimal primes. Although I^poly_j lies in R_j, I_j and P_{j,λ} generally do not: their tails involve all embeddings.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Eliminate four variables in each local model and apply irreducible-crossing to its two remaining factors. Each model is reduced O-flat, with two geometrically integral components of relative dimension 3.
2. The imported completed-tensor component theorem gives 2^f components of relative dimension 3f for R/I^poly. The actual generic ring has the same dimension and at least 2^f components from nonempty-profiles and the imported fixed-type dimension theorem.
3. The surjection cannot lose or shrink any component: its kernel is contained in all the model’s minimal primes, whose intersection is zero.
4. Lift the quotient isomorphism by ψ(X_i)=X_i+p^{N−8}ε_i. Its invertible linear term and complete local power-series evaluation give an ambient automorphism. Transport every factor and equation by the same ψ.

**Acceptance.** The congruence is modulo p^{N−8}, hence at least p⁴ in the stated range. Do not independently choose a small perturbation for each factor or each embedding. The isomorphism compares the maximal reduced flat closure, rather than the raw height-plus-jet quotient.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.5/chart-models`, `LocalGaloisDeformationRingsPartII:T.5/irreducible-crossing`, `LocalGaloisDeformationRingsPartII:T.5/chart-approximation`, `LocalGaloisDeformationRingsPartII:T.5/nonempty-profiles`, `LocalGaloisDeformationRings:R08.3/pcris-generic-smooth`, `DeformationAndDerivedPatchingAlgebra:R03.4/completed-tensor-domains-and-components`, `DeformationAndDerivedPatchingAlgebra:R03.1/continuous-power-series-evaluation`, `LocalGaloisDeformationRings:L7/height-lattice-moduli`, `LocalGaloisDeformationRingsPartII:T.3/restriction-hom`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `LocalGaloisDeformationRingsPartII:T.5/gauge-galois-comparison`.

**Sources.** BHHMS23, Lemma 4.2.4 and proof of Proposition 4.2.1, pp. 30–33.


## Layer T.6: Single-type rings and their special fibres

The potentially crystalline ring of a fixed Hodge profile is an input from R08.3, and T.5 defines their finite union by intersecting kernel ideals in the framed ring. The explicit presentation identifies those kernels, and the special-fibre calculation reduces the exact-profile charts to disjoint products of pairs of variables. Formal smoothness belongs to each component; it need not hold for their union.

**Direct stage inputs.** `LocalGaloisDeformationRingsPartII:T.5`, `DeformationAndDerivedPatchingAlgebra:R03.4`, `LocalGaloisDeformationRings:R08.3`, `DeformationAndDerivedPatchingAlgebra:R03.6`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `DeformationAndDerivedPatchingAlgebra:R03.1`.


### Single-type deformation presentation

Target `LocalGaloisDeformationRingsPartII:T.6/single-presentation` (theorem).

For each w̃∈Adm∨, use the common ψ of T.5 and its actual ideals I_j and P_{j,λ}. There is an O-algebra isomorphism R_{ρ̄}^{≤30,τ_{w̃}}[[X₁,…,X_{2f}]]≅(R/Σ_jI_j)[[Y₁,…,Y₄]]. For each exact profile λ, the kernel of the map to R_{ρ̄}^{λ,τ_{w̃}}[[X]] corresponds to the image of Σ_jP_{j,λ_{f−1−j}} on the right. Those sums, not individual local ideals, are the globally meaningful prime kernels.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Combine gauge-galois-comparison with the effective ambient comparison.
2. Nonempty-profiles gives 2^f distinct Hodge-labelled generic components. To identify a (2,1) coordinate, require each entry of A at that embedding to be divisible by z.
3. If this coordinate were labelled (3,0) on a surviving component, the explicit factor equations and finite-height relations force p into its prime ideal, contradicting O-flatness. Induct over embeddings to identify the complete profile kernel.

**Acceptance.** The embedding index in the prime sum is λ_{f−1−j}. The same isomorphism handles all profiles λ; choosing a separate coordinate comparison per component is insufficient.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.5/small-hodge-quotient`, `LocalGaloisDeformationRingsPartII:T.5/gauge-galois-comparison`, `LocalGaloisDeformationRingsPartII:T.5/ambient-automorphism`, `LocalGaloisDeformationRingsPartII:T.5/nonempty-profiles`, `LocalGaloisDeformationRingsPartII:T.5/chart-models`, `DeformationAndDerivedPatchingAlgebra:R03.4/flat-reduced-quotients-by-points`.

**Sources.** BHHMS23, Proposition 4.2.1, pp. 28–33.


### Hodge-labelled components

Target `LocalGaloisDeformationRingsPartII:T.6/single-components` (theorem).

The ring R_{ρ̄}^{≤30,τ_{w̃}} is reduced and O-flat with exactly 2^f irreducible components, each Spec R_{ρ̄}^{λ,τ_{w̃}} for one λ∈{30,21}^f. Each component is a domain of relative dimension f+4, geometrically integral under finite coefficient extensions allowed by the source’s coefficient-enlargement convention. Each exact-profile generic fibre is formally smooth at characteristic-zero points. This is a local formal-scheme assertion; it does not claim the complete local ring is a finite-type algebraic smooth E-scheme.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Use the prime-factor description of the model and the completed-tensor component theorem; ψ preserves reducedness, flatness and all components.
2. Pass across the smooth-variable comparison: the chart component dimension is 3f, so the framed component dimension is 3f+4−2f=f+4.
3. Apply the imported potentially crystalline generic-smoothness theorem for the distinct weights (3,0) and (2,1).

**Acceptance.** At f=1 there are two components of relative dimension 5, while the local gauged chart has relative dimension 3. Unfixed determinant is necessary for the stated dimension f+4.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.6/single-presentation`, `LocalGaloisDeformationRingsPartII:T.5/ambient-automorphism`, `DeformationAndDerivedPatchingAlgebra:R03.4/completed-tensor-domains-and-components`, `LocalGaloisDeformationRings:R08.3/pcris-generic-smooth`.

**Sources.** BHHMS23, Proposition 4.2.1, pp. 28–33; dimension statements in the proof of Proposition 4.3.1, p. 38.


### Reduced special fibres

Target `LocalGaloisDeformationRingsPartII:T.6/special-fibres` (theorem).

For each exact profile λ, R_{ρ̄}^{λ,τ_{w̃}}/ϖ is reduced and every irreducible component is formally smooth over F. More precisely, for some 0≤m≤f it is noncanonically F-isomorphic to F[[U₁,…,U_{f+4+m}]]/(U₁U₂,…,U_{2m−1}U_{2m}). The stable version follows directly from the chart presentation; cancelling formal variables to obtain the displayed unstable form uses the explicit R03.3 power-invariance request. For m>0 the whole special fibre is singular at the crossing even though its components are formally smooth.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Reduce the exact-profile polynomial factor charts modulo ϖ. Four eliminations leave a formal power-series ring in 3+m_j variables modulo m_j disjoint quadratic monomials, with m_j∈{0,1}.
2. Completed tensor products combine these into the same model with m=Σm_j≤f. The square-free monomial theorem gives radicality and coordinate minimal primes; their quotients are power-series rings.
3. The stable single-type presentation adds 2f variables on one side and four on the other. Apply the requested Hamann local power-invariance cancellation, adding harmless formal variables as necessary; finite-residue-field coefficient automorphisms can be corrected on the normal-form side to make the resulting isomorphism F-linear.
4. Regularity and reducedness also descend along the faithfully flat formal-variable extensions, so the geometric assertion is independently checked without relying on a preferred cancellation map.

**Acceptance.** The normal form has dimension f+4 after quotienting by m equations. For m=0 the special fibre is formally smooth; for m=1 it has two smooth coordinate components meeting along a codimension-one crossing. Reducedness of each exact-profile special fibre is asserted, not merely generic reducedness.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.6/single-presentation`, `LocalGaloisDeformationRingsPartII:T.5/ambient-automorphism`, `DeformationAndDerivedPatchingAlgebra:R03.6/monomial-components-and-cycles`, `DeformationAndDerivedPatchingAlgebra:R03.3/regularity-localization-and-descent`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `DeformationAndDerivedPatchingAlgebra:R03.1/flat-completion-and-finite-module-comparison`.

**Sources.** BHHMS23, Corollary 4.2.6 and equations (27)–(28), pp. 33–34; Lemma 8.1.2, p. 88; Hamann75, Theorem 4 and proof, pp. 155–156.


## Layer T.7: Several tame types and component intersections

For one Serre weight there are 2^f allowed tame types. The common charts put their étale modules in a single ambient power-series ring. Extra linear relations recover the non-middle one-type charts. The resulting union uses an intersection over whole type tuples of sums over embeddings. The final p-membership relation is integral and uses the exact Q ideals together with the actual, globally transported component ideal.

**Direct stage inputs.** `LocalGaloisDeformationRingsPartII:T.4`, `LocalGaloisDeformationRingsPartII:T.5`, `LocalGaloisDeformationRingsPartII:T.3`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `DeformationAndDerivedPatchingAlgebra:R03.4`, `LocalGaloisDeformationRingsPartII:T.6`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `LocalGaloisDeformationRingsPartII:T.1`.


### Common charts for several types

Target `LocalGaloisDeformationRingsPartII:T.7/common-charts` (construction).

Fix σ∈W(ρ̄), write θ=θ(σ), and put X(σ)={w̃∈Adm∨:∀j,w̃_j≠θ_j}. At each table index j take S_j=O[[c₁₁,d₁₁,c₁₂,x₁₂*,c₂₁,x₂₁*,c₂₂,d₂₂,b]], with d₁₂*,d₂₁* residual units plus x variables. If θ_{f−1−j}=U₃, write b=b₁₂ and b₂₁=0 (table 4); if θ_{f−1−j}=U₁, write b=b₂₁ and b₁₂=0 (table 5). The common étale φ matrix is
[[zd₁₂*+c₁₂+b₁₂/v,(zd₁₁+c₁₁)/v],[zd₂₂+c₂₂,zd₂₁*+c₂₁+b₂₁/v]] s_j⁻¹ diag(v^{r_j+1},1).
Let S=⊗̂_O S_j. For each whole tuple w̃∈X(σ), transport the actual ideals from T.5 into S by these substitutions:
U₁ into table 4: (e₁₁*,d₁₁,c₁₁,d₂₁,c₁₂,c₂₁,d₂₂*,c₂₂)↦(d₁₂*,c₁₂−pd₁₂*,b₁₂−pc₁₂,d₂₂,d₁₁,c₂₂,d₂₁*,c₂₁), and impose c₁₁+pd₁₁=0.
U₂ into either table: keep the eight middle-chart parameters and impose b=0.
U₃ into table 5: (d₁₁*,c₁₁,d₁₂,c₁₂,c₂₁,e₂₂*,d₂₂,c₂₂)↦(d₁₂*,c₁₂,d₁₁,c₁₁,d₂₂,d₂₁*,c₂₁−pd₂₁*,b₂₁−pc₂₁), and impose c₂₂+pd₂₂=0.
Apply the substitutions to the full coupled series of each type, with its constants a_i; do not substitute in independent one-embedding approximations. Write I_{w̃,j} and P_{w̃,j,λ} for the transported ideals including the indicated extra relation, and I_{w̃}=Σ_j I_{w̃,j}. Then S/I_{w̃}≅R_{w̃}/Σ I_j, compatibly with the associated étale φ modules.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Use the extreme-shape bijection to select tables 4 or 5 embedding by embedding. Choose the common residual unit values and the nine independent parameters.
2. Match the three single-type étale matrices with the displayed common matrix, including the extra linear relation in each non-middle case. Figure 2 gives the eight-coordinate substitutions.
3. Extend these maps continuously to the whole ambient completed rings before transporting all tails. The resulting type quotient is precisely the one-type chart, as an étale φ-module chart as well as a ring.

**API.**

- `TauCeti.TameGL2.commonTypeChart` (constructor): The nine-variable chart and its displayed étale φ matrix for the chosen extreme shape.
- `TauCeti.TameGL2.commonTypeIdeal` (constructor): For a whole type tuple, substitute its actual one-type ideals and add the chart relation.
- `TauCeti.TameGL2.commonChart_singleType` (equivalence): S/I_{w̃} is the corresponding one-type chart with its étale realization.
- `TauCeti.TameGL2.commonChart_coefficients` (compatibility): The substitutions preserve the O-structure, the fixed residual matrix and the contravariant étale realization.

**Checks.**

- `TauCeti.TameGL2.commonChart_nine` (characterisation): Each table has one b variable and eight other parameters, not both b₁₂ and b₂₁ as independent variables.
- `TauCeti.TameGL2.commonChart_linear_relation` (characterisation): The U₁/table-4 quotient has c₁₁=−pd₁₁, and U₃/table-5 has c₂₂=−pd₂₂. Omitting this equation leaves an extra dimension.
- `TauCeti.TameGL2.commonChart_middle` (computation): For U₂, setting b=0 recovers the middle one-type étale matrix without either outer coordinate change.
- `TauCeti.TameGL2.commonChart_tails_global` (non-example): Changing a shape at a different embedding may change this embedding’s transported tail and a_i; equality of local shape codes alone is insufficient.

**Uses.** T.7/multiple-presentation: The intersection of the type ideals represents the union in one ambient ring. T.7/exact-q-ideals and T.7/p-membership: All component-intersection identities must be interpreted in this common ring.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.4/weight-shape-bijection`, `LocalGaloisDeformationRingsPartII:T.5/ambient-automorphism`, `LocalGaloisDeformationRingsPartII:T.5/chart-models`, `LocalGaloisDeformationRingsPartII:T.3/monomial-etale-module`, `DeformationAndDerivedPatchingAlgebra:R03.1/continuous-power-series-evaluation`, `DeformationAndDerivedPatchingAlgebra:R03.1/completed-tensor-products`.

**Sources.** BHHMS23, Proposition 4.3.1, pp. 34–38; Figure 2, p. 38; Tables 4–5, pp. 44–45.


### Deformation union for a Serre weight

Target `LocalGaloisDeformationRingsPartII:T.7/weight-union` (construction).

For σ∈W(ρ̄), define R_{ρ̄}^{≤30,σ} as the quotient of R□_{ρ̄} by the intersection of the kernels of R□_{ρ̄}→R_{ρ̄}^{≤30,τ_{w̃}} for w̃∈X(σ). Equivalently it is the maximal reduced O-flat quotient parametrizing potentially crystalline lifts with the two allowed Hodge profiles and a tame type τ such that σ∈JH(σ̄(τ)⊗N∘det). The equivalence uses the exhaustion theorem T.4/weight-shape-bijection.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Take the finite intersection of the already constructed single-type kernel ideals.
2. Use the reduced-flat valued-point criterion and exhaustion of types to identify its deformation condition. Every allowed point lies on at least one type quotient.

**API.**

- `TauCeti.TameGL2.weightUnionRing` (constructor): The quotient by the intersection of the 2^f single-type kernels.
- `TauCeti.TameGL2.weightUnion_toType` (projection): The natural surjection onto every allowed single-type quotient.
- `TauCeti.TameGL2.weightUnion_points` (characterisation): The stated characteristic-zero point criterion, with the norm-determinant twist.
- `TauCeti.TameGL2.weightUnion_existing` (compatibility): All maps are induced from the same universal framed ring and agree with the imported fixed-(λ,τ) quotients.

**Checks.**

- `TauCeti.TameGL2.weightUnion_f_one` (computation): At f=1 and θ=U₃ the union uses exactly the U₁ and U₂ type rings; U₃ is excluded.
- `TauCeti.TameGL2.weightUnion_intersection` (characterisation): A point of either allowed type factors through the intersection kernel; a sum of those kernels would demand both types at once.
- `TauCeti.TameGL2.weightUnion_f_two` (computation): At f=2 there are four single-type quotient maps, while there are sixteen pairs (λ,w̃) indexing components.

**Uses.** T.7/multiple-presentation: Names the Galois quotient presented by the common charts. BHHMS Theorem 8.3.9 proof, pp. 101–102: Its Hodge/type components are the local supports used in patched-module freeness.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.5/small-hodge-quotient`, `LocalGaloisDeformationRingsPartII:T.4/weight-shape-bijection`, `DeformationAndDerivedPatchingAlgebra:R03.4/flat-reduced-quotients-by-points`, `mathlib:Ideal.Quotient.ring`.

**Sources.** BHHMS23, Opening of §4.3, p. 34.


### Multiple-type deformation presentation

Target `LocalGaloisDeformationRingsPartII:T.7/multiple-presentation` (theorem).

With S the common ambient ring, R_{ρ̄}^{≤30,σ}[[X₁,…,X_{2f}]]≅(S/⋂_{w̃∈X(σ)}I_{w̃})[[Y₁,…,Y₄]] as O-algebras. It respects each single-type quotient. The ring is reduced O-flat, has 4^f distinct irreducible components indexed by (λ,w̃)∈{30,21}^f×X(σ), with kernels represented by Σ_jP_{w̃,j,λ_{f−1−j}}, and every component has relative dimension f+4. Distinct type ideals have a sum containing p, so the generic type loci are disjoint; these ideals need not be comaximal in the integral local ring.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. The common étale module gives a map from the framed deformation ring of the K∞ restriction into the chart with four framing variables. Prove surjectivity on complete local rings by injectivity on tangent spaces.
2. For an infinitesimal basis change 1+εM_j let k_j measure its worst v-pole. The matrix equation gives pk_j≤k_{j−1}+r_j+3<k_{j−1}+p−1, so max k_j≤0. Entry comparison then kills the negative-degree perturbations. Fix the residual diagonal/framing normalization and use restriction-hom to kill the remaining endomorphism.
3. Every characteristic-zero point of the intersection quotient lies on some single-type branch, where the single-presentation theorem identifies it as potentially crystalline. Restriction-isom descends the framed K∞ identification to G_K. The imported reduced O-flat point criterion makes the resulting maps inverse.
4. For distinct w̃,w̃′ choose an embedding with different allowed shape and use the explicit common equations to obtain p∈I_{w̃}+I_{w̃′}. Thus generic type branches are disjoint. Combine the single-type component calculation and add/subtract the smooth variables to get 4^f components of relative dimension f+4.

**Acceptance.** Union uses intersection over complete type tuples of sums over embeddings: ⋂_{w̃}(Σ_jI_{w̃,j}). Neither order of these operations may be swapped. At f=1 there are four components of relative dimension 5. The tangent argument retains the r_j+3 bound and its strict inequality with p−1.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.7/common-charts`, `LocalGaloisDeformationRingsPartII:T.7/weight-union`, `LocalGaloisDeformationRingsPartII:T.6/single-presentation`, `LocalGaloisDeformationRingsPartII:T.6/single-components`, `LocalGaloisDeformationRingsPartII:T.3/restriction-hom`, `LocalGaloisDeformationRingsPartII:T.3/restriction-isom`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `DeformationAndDerivedPatchingAlgebra:R03.1/relative-cotangent-space`, `DeformationAndDerivedPatchingAlgebra:R03.4/flat-reduced-quotients-by-points`.

**Sources.** BHHMS23, Proposition 4.3.1 and proof, pp. 34–38.


### Exact small-weight ideals

Target `LocalGaloisDeformationRingsPartII:T.7/exact-q-ideals` (construction).

In a table-4 local ambient ring define
Q₁=(b₁₂−pc₁₂,c₁₁,c₁₂−pd₁₂*,c₂₁,c₂₂,d₁₁),
Q₂=(b₁₂,c₁₁,c₁₂,c₂₁,c₂₂,d₁₁d₂₂/(d₁₂*d₂₁*)+p).
In a table-5 local ring define
Q₂=(b₂₁,c₁₁,c₁₂,c₂₁,c₂₂,d₁₁d₂₂/(d₁₂*d₂₁*)+p),
Q₃=(b₂₁−pc₂₁,c₁₁,c₁₂,c₂₁−pd₂₁*,c₂₂,d₂₂).
These are exact ideals of S_j, then extended to S. For λ_{f−1−j}=(2,1), Q_{i(w̃)_{f−1−j}}⊂Σ_{j′}P_{w̃,j′,λ_{f−1−j′}}. If every Hodge coordinate is (2,1), Σ_jQ_{i(w̃)_{f−1−j}}=Σ_jP_{w̃,j,21}. This does not assert that each individual Q equals its transported local P: the latter can have tails in other embeddings.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. Impose exact divisibility of every Kisin matrix entry by z at a (2,1) embedding. The three finite-height equations give the additional d variable or d₁₁d₂₂/(d₁₂*d₂₁*)+p constraint.
2. Apply the common-chart substitutions and their extra linear relation. This gives exactly the six generators of the displayed Q ideals.
3. The constraints lie in the global Hodge-profile prime. When every profile is (2,1), monodromy gives no additional condition and the summed ideals coincide; equivalently use the explicit dimensions of the resulting complete local rings.

**API.**

- `TauCeti.TameGL2.exactWeight21Ideal` (constructor): The six-generator local ideal Q_i in the appropriate common chart.
- `TauCeti.TameGL2.exactWeight21_leProfile` (relation): A Q_i constraint at one (2,1) embedding lies in the full profile prime sum.
- `TauCeti.TameGL2.exactWeight21_all` (characterisation): For the all-(2,1) profile, the sums of the exact Q and actual transported P ideals agree.
- `TauCeti.TameGL2.exactWeight21_local` (compatibility): Q_i is an ideal in the local S_j power-series ring, unlike a general transported P_{w̃,j,λ}.
- `TauCeti.TameGL2.exactWeight21_table4_common` (relation): The common c₂₁ coordinate belongs to Q₁∩Q₂ in table 4.
- `TauCeti.TameGL2.exactWeight21_table5_common` (relation): The common c₁₂ coordinate belongs to Q₂∩Q₃ in table 5.
- `TauCeti.TameGL2.exactWeight21_middle_agrees` (compatibility): Evaluating the middle six-generator formula in one ring with identical parameters gives the same ideal from either side.

**Checks.**

- `TauCeti.TameGL2.q_middle_contains_c21` (computation): In table 4, both Q₁ and Q₂ contain c₂₁ exactly; the corresponding table-5 common generator is c₁₂.
- `TauCeti.TameGL2.q_middle_relation` (computation): The middle Q₂ kills all four c entries and imposes t=−p; omitting the +p changes its characteristic-zero points.
- `TauCeti.TameGL2.q_outer_shift` (computation): Q₁ includes c₁₂−pd₁₂* and b₁₂−pc₁₂; Q₃ includes c₂₁−pd₂₁* and b₂₁−pc₂₁. Setting those shifted entries simply to zero gives a different ideal.
- `TauCeti.TameGL2.q_global_equality` (characterisation): Only the all-(2,1) profile gives the equality of summed ideals; a mixed profile supplies the stated containment instead.
- `TauCeti.TameGL2.q_outer_point` (computation): Over Z with p=5 and both units 1, table-4 Q₁ is zero at (c₁₁,d₁₁,c₁₂,c₂₁,c₂₂,d₂₂,b)=(0,0,5,0,0,0,25).
- `TauCeti.TameGL2.q_middle_point` (computation): With the same ring and units, Q₂ is zero at (0,1,0,0,0,−5,0).
- `TauCeti.TameGL2.q_other_outer_point` (computation): Table-5 Q₃ is zero at (0,0,0,5,0,0,25).

**Uses.** T.7/p-membership: An exact common c entry in Q₁∩Q₂ or Q₂∩Q₃ combines with the actual middle (3,0) generator. BHHMS Theorem 8.3.9 proof, equations (78)–(79), pp. 101–102: These ideal containments identify the local support relation needed in the patched-module gluing argument.

**Acceptance.** Check the statement with its stated coefficient, genericity and indexing hypotheses; use the worked checks in the reader.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.7/common-charts`, `LocalGaloisDeformationRingsPartII:T.7/multiple-presentation`, `LocalGaloisDeformationRingsPartII:T.6/single-presentation`, `LocalGaloisDeformationRingsPartII:T.1/eigenbasis-matrices`, `mathlib:Ideal.span`.

**Sources.** BHHMS23, Lemma 4.3.2, p. 39; Remark 4.2.5, p. 33.


### Integral component intersection

Target `LocalGaloisDeformationRingsPartII:T.7/p-membership` (theorem).

Fix j and w̃∈X(σ) with i(w̃)_{f−1−j}=2. In the common ambient S, if θ_{f−1−j}=U₃ then p∈(Q₁^(j)∩Q₂^(j))+P_{w̃,j,30}; if θ_{f−1−j}=U₁ then p∈(Q₂^(j)∩Q₃^(j))+P_{w̃,j,30}. Intersections here are of the extended local Q ideals inside S; P is the actual transported ideal with its coupled tails. The scalar is the integer prime p, not a chosen coefficient uniformizer ϖ.

**Hypotheses.** p is prime; K/Q_p is unramified of degree f≥1, q=p^f; E/Q_p is finite and sufficiently large; O=O_E has uniformizer ϖ and finite residue field F. σ_j=σ_0∘Frob_p^j indexes embeddings cyclically; cyclotomic Hodge–Tate weight is +1; no determinant is fixed. ρ̄:G_K→GL₂(F) is semisimple. Fix (s,μ) with ρ̄|_{I_K}≅τ(s,μ), s_j=1 except s₀=w exactly in the irreducible case. After a central tame twist, μ_j=(r_j+2,1), with N<r_j+1<p−N for every j and N≥12. The normalized presentation is part of the data.

**Construction or proof.**

1. In table 4 the actual middle (3,0) equations yield c₂₁+(2p/a₂)d₂₁*+p^{N−8}ε∈P_{w̃,j,30}, by eliminating t+p with the second factor of G₅.
2. Since c₂₁∈Q₁∩Q₂, the sum contains p((2/a₂)d₂₁*+p^{N−9}ε). The parenthesis is a unit for N≥12, proving p-membership.
3. For table 5 use c₁₂−(2p/(a₂−1))d₁₂*+p^{N−8}ε and c₁₂∈Q₂∩Q₃. The same unit argument applies. Alternatively interchange matrix indices and a_i↦1−a_{4−i}.

**Acceptance.** At N=12 the tail after dividing by p is in p³, so it cannot change the nonzero residue of the unit coefficient. The theorem does not claim ϖ lies in the ideal when O is ramified. The conclusion uses an intersection of the two exact Q ideals, not their sum.

**Dependencies.** `LocalGaloisDeformationRingsPartII:T.7/exact-q-ideals`, `LocalGaloisDeformationRingsPartII:T.7/common-charts`, `LocalGaloisDeformationRingsPartII:T.5/ambient-automorphism`, `LocalGaloisDeformationRingsPartII:T.5/chart-models`, `mathlib:IsLocalRing.maximalIdeal`, `mathlib:IsLocalRing.notMem_maximalIdeal`.

**Sources.** BHHMS23, Proposition 4.3.3 and proof, pp. 39–40.


## Supplier interfaces

Each entry below is a requested contract in the supplier’s own direction. Existing exact nodes remain the inputs listed above. These requests account for the planning status; they are not implementation assertions.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`

Use the existing arithmetic local Artin isomorphism and its geometric inverse. Supply the finite-residue fundamental-character normalization comparison used here: geometric uniformizer convention for ω_f, arithmetic Frobenius α for nr(α), and the Teichmüller lift/reduction compatibility. This is a normalization interface to Layer 7, not another reciprocity theorem.

Direct consumers: `LocalGaloisDeformationRingsPartII:T.0/tame-type`, `LocalGaloisDeformationRingsPartII:T.3/unramified-twist`.

### `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`

Use Layer 4’s tame quotient with generators and q-Frobenius action to construct fundamental characters over a sufficiently large finite coefficient field. Supply the comparison induced by G_{K∞}→G_K on tame quotients for K∞=⋃K((-p)^{1/p^n}); the map is an isomorphism and preserves the chosen unramified Frobenius. This comparison is needed for tame extensions and semisimplification under restriction.

Direct consumers: `LocalGaloisDeformationRingsPartII:T.0/tame-type`, `LocalGaloisDeformationRingsPartII:T.3/good-pair`, `LocalGaloisDeformationRingsPartII:T.3/tame-representation`, `LocalGaloisDeformationRingsPartII:T.3/tame-classification`, `LocalGaloisDeformationRingsPartII:T.3/cyclotomic-free`, `LocalGaloisDeformationRingsPartII:T.3/restriction-isom`.

### `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`

Extend the existing R07.4 coefficient Kisin/étale categories from finite Artinian coefficients and height one to finite free rank n, arbitrary finite height h, complete Noetherian local O coefficients by compatible Artinian towers, and tame descent over L′/K. Supply the contravariant realization T*_dd and its compatibility with the displayed normalized eigenbasis matrices. Supply the relative open-disc base change and finite-height/minor comparison over the admissible p-complete bases used for monodromy, and the equivalence between preservation by the monodromy derivation and potentially crystalline G_K lifts, including its complete-local reduced-flat deformation comparison. Supply the Kummer restriction invariant theorem for a prime-to-p unramified triangularizing extension when ω is absent from the semisimplification; our rank-two Hom/isomorphism consequences are T.3. Existing bk-coefficient-rings, kisin-modules, kummer-etale-phi-modules and etale-phi-modules-with-coefficients are retained unchanged as inputs; the request identifies their additional family and descent interfaces rather than pretending their finite-coefficient statements suffice.

Direct consumers: `LocalGaloisDeformationRingsPartII:T.1/eigenbasis-matrices`, `LocalGaloisDeformationRingsPartII:T.1/shape`, `LocalGaloisDeformationRingsPartII:T.1/gauge-existence`, `LocalGaloisDeformationRingsPartII:T.2/monodromy-derivation`, `LocalGaloisDeformationRingsPartII:T.2/monodromy-condition`, `LocalGaloisDeformationRingsPartII:T.3/tame-representation`, `LocalGaloisDeformationRingsPartII:T.3/restriction-hom`, `LocalGaloisDeformationRingsPartII:T.4/residual-kisin-module`, `LocalGaloisDeformationRingsPartII:T.5/gauge-galois-comparison`, `LocalGaloisDeformationRingsPartII:T.5/ambient-automorphism`, `LocalGaloisDeformationRingsPartII:T.7/multiple-presentation`.

### `LocalGaloisDeformationRings:R08.3`

Supply two interfaces in the existing Hodge/inertial-type direction. (i) For regular tame rank-two τ, the inertial-local-Langlands compact type σ(τ), integral lattices with lattice-independent semisimplified reduction, the chosen Deligne–Lusztig normalization and determinant-twist compatibility. (ii) The GHLS Theorem D / Theorem 3.1.5 existence criterion together with the crystalline extended-Fontaine–Laffaille realization of every sufficiently deep obvious weight in W(ρ̄), for semisimple rank-two ρ̄ over unramified K. In native GHLS notation require n≠p, a crystalline seed of extended FL Serre weight F_a with a_{κ,1}−a_{κ,n}≤p−n, and F_a in JH(σ(λ,τ)); translate the Galois duals, inertial type, algebraic highest weight and mod-p weight labels to HT(ε)=+1 so the criterion is exactly BHHMS equation (26), p. 32. This requests the seed and sign dictionary explicitly; the current Q_p reducible R08.6/serre-weight-crystalline-lift node and the generic dimension theorem do not supply it.

Direct consumers: `LocalGaloisDeformationRingsPartII:T.0/type-jordan-holder`, `LocalGaloisDeformationRingsPartII:T.4/weight-shape-bijection`, `LocalGaloisDeformationRingsPartII:T.5/nonempty-profiles`.

### `ModpRepresentationsOfGL2OverLocalFields:MP.3`

Supply the finite GL₂(k) reduction formula for the regular Deligne–Lusztig representation corresponding to a 1-generic tame type: its constituents in the existing MP.3 translation coordinates are F(t_{μ−η}(sw⁻¹(ω−ν̄))) for ω∈Σ, under μ−sw⁻¹ν−η 1-deep and ν∈η+Λ_R. The general finite-group reduction and lattice independence belong here; T.0/type-jordan-holder composes it with R08.3’s compact-type normalization. Retain the existing MP.3 weight, translation and tame-W objects rather than rebuilding them.

Direct consumers: `LocalGaloisDeformationRingsPartII:T.0/type-jordan-holder`.

### `DeformationAndDerivedPatchingAlgebra:R03.3`

Supply local power-series cancellation in the generality of Hamann Theorem 4 (1975), pp. 155–156: if local rings A and B have isomorphic one-variable formal power-series rings, then A≅B as rings. Iteration cancels equally many finite variables. For complete local F-algebras with finite residue F, give the coefficient-field correction needed to make the crossing-model isomorphism F-linear; no canonical retraction compatibility is asserted. The stable crossing presentation and the reducedness/formal-smooth-component conclusions do not depend on a preferred cancellation map.

Direct consumers: `LocalGaloisDeformationRingsPartII:T.6/special-fibres`.


## Routed-item coverage

The incoming BHHMS route has 34 items. The table gives the owner of each; in particular the tame Serre-weight set remains in MP.3. The unrestricted-ring and Bianchi routes are assigned only by the separate split proposal, with their item sets preserved there.

| BHHMS route item | Target or exact import |
| --- | --- |
| generic | `LocalGaloisDeformationRingsPartII:T.0/genericity` |
| kisin-descent | `LocalGaloisDeformationRingsPartII:T.1/eigenbasis-matrices`, `LocalGaloisDeformationRingsPartII:T.1/gauge-basis`, `LocalGaloisDeformationRingsPartII:T.2/monodromy-condition` |
| def-rings | `LocalGaloisDeformationRingsPartII:T.5/small-hodge-quotient`, `LocalGaloisDeformationRingsPartII:T.7/weight-union`, `LocalGaloisDeformationRingsPartII:T.6/single-presentation`, `LocalGaloisDeformationRingsPartII:T.7/multiple-presentation` |
| tame-type-tau | `LocalGaloisDeformationRingsPartII:T.0/tame-type` |
| n-generic-type | `LocalGaloisDeformationRingsPartII:T.0/genericity` |
| n-generic-rhobar | `LocalGaloisDeformationRingsPartII:T.0/genericity` |
| orientation | `LocalGaloisDeformationRingsPartII:T.0/orientation` |
| serre-weights-tame | `ModpRepresentationsOfGL2OverLocalFields:MP.3/tame-weight-set` |
| jh-factors-type | `LocalGaloisDeformationRingsPartII:T.0/type-jordan-holder` |
| kisin-matrices | `LocalGaloisDeformationRingsPartII:T.1/eigenbasis-matrices` |
| kisin-shape | `LocalGaloisDeformationRingsPartII:T.1/shape` |
| gauge-basis-exists | `LocalGaloisDeformationRingsPartII:T.1/gauge-existence` |
| gauge-basis | `LocalGaloisDeformationRingsPartII:T.1/gauge-basis` |
| monodromy-derivation | `LocalGaloisDeformationRingsPartII:T.2/monodromy-derivation` |
| monodromy-condition | `LocalGaloisDeformationRingsPartII:T.2/monodromy-condition` |
| monodromy-explicit | `LocalGaloisDeformationRingsPartII:T.2/jet-equations` |
| good-pair | `LocalGaloisDeformationRingsPartII:T.3/good-pair` |
| good-deep | `LocalGaloisDeformationRingsPartII:T.3/deep-pair-good` |
| etale-module-w-D | `LocalGaloisDeformationRingsPartII:T.3/monomial-etale-module` |
| tame-rep-w-D | `LocalGaloisDeformationRingsPartII:T.3/tame-representation` |
| unramified-twist-V | `LocalGaloisDeformationRingsPartII:T.3/unramified-twist` |
| tame-classification | `LocalGaloisDeformationRingsPartII:T.3/tame-classification` |
| cyclotomic-free-hom | `LocalGaloisDeformationRingsPartII:T.3/restriction-hom` |
| isom-descent | `LocalGaloisDeformationRingsPartII:T.3/restriction-isom` |
| irreducibility-lemma | `LocalGaloisDeformationRingsPartII:T.5/irreducible-crossing` |
| kisin-unique | `LocalGaloisDeformationRingsPartII:T.4/residual-kisin-module` |
| theta-bijection | `LocalGaloisDeformationRingsPartII:T.4/weight-shape-bijection` |
| def-ring-single | `LocalGaloisDeformationRingsPartII:T.6/single-presentation` |
| p3-in-H | `LocalGaloisDeformationRingsPartII:T.5/jacobian-bound` |
| ring-automorphism | `LocalGaloisDeformationRingsPartII:T.5/ambient-automorphism` |
| special-fibre-reduced | `LocalGaloisDeformationRingsPartII:T.6/special-fibres` |
| def-ring-multi | `LocalGaloisDeformationRingsPartII:T.7/multiple-presentation` |
| q-ideals | `LocalGaloisDeformationRingsPartII:T.7/exact-q-ideals` |
| p-membership-multi | `LocalGaloisDeformationRingsPartII:T.7/p-membership` |

## Independent review, 19 October 2026

The target-level plan is accepted after independent review of all 40 nodes, the 14 pinned baseline declarations, the direct supplier statements, the six outstanding interface requests and the incoming routes. All eight layers remain **planned**. Acceptance of this design does not discharge a supplier request or claim an implementation. The per-node verdicts and complete change log are in [REV-DESIGN-LocalGaloisDeformationRingsPartII](../reviews/REV-DESIGN-LocalGaloisDeformationRingsPartII.md).

The review corrected the star-convention locator to the end of §2.1, p. 13; classified all 63 Checks by the protocol's test kinds; and made nine Checks concrete. In particular, the conjugation-order check now uses an off-diagonal matrix, since diagonal matrices cannot distinguish the orders. The suggested file includes its two rational matrix products.

Two source slips are recorded and confirmed in the packet's `sourceIssues`:

- **E1:** BHHMS v7, Table 5 final note, p. 45, should refer to Tables 2–3 for its U₂,U₃ coefficients and transported tails. Figure 2 and the displayed formulas already use those branches.
- **E2:** In the displayed type-label bijection in the proof of Theorem 8.3.9, p. 102, the twist on σ_v should be Norm∘det⁻¹. This agrees with the type-indexing condition immediately above the bijection and with §4.3. The roadmap already uses this convention.

Both slips remain in the [Herzig author copy](https://www.math.toronto.edu/~herzig/GK.pdf), at Table 5, p. 47 and Theorem 8.3.9 proof, p. 105. That copy was checked on 19 October 2026; its SHA-256 is `b72458bd849101318871fe68f37f6ff2c0c9beac5e7f0e38bcfc6db34aff51dc`. The arXiv history, publisher/Crossref metadata and the Herzig, Breuil and Schraen publication pages supplied no linked correction for these slips. The [publisher page](https://link.springer.com/article/10.1007/s00222-023-01202-8) offered subscription access and its PDF endpoint served HTML. The journal full text was not read: these findings concern the specified preprint and author copy only, and change no conclusion of this roadmap.

## Sources

- Christophe Breuil, Florian Herzig, Yongquan Hu, Stefano Morra and Benjamin Schraen, [Gelfand–Kirillov dimension and mod p cohomology for GL₂](https://arxiv.org/pdf/2009.03127v7), arXiv:2009.03127v7, 9 June 2023; preprint pagination, 112 pages; published in Inventiones Mathematicae 234 (2023), 1–128. Read: §§2–4, pp. 10–45; Lemma 8.1.2, p. 88; Theorem 8.3.9 proof, equations (78)–(79), pp. 101–102; References, pp. 110–112. Accessed 2026-10-19. SHA-256 `8f06c68bbb85aa3d13420181197167b3ce9158dc117e96da6299718765f99e7a`.
- Renée Elkik, [Solutions d’équations à coefficients dans un anneau hensélien](https://www.numdam.org/item/10.24033/asens.1258.pdf), Annales scientifiques de l’École Normale Supérieure (4) 6 (1973), 553–603. Read: §0.2 and Lemme 1, pp. 555–557. Accessed 2026-10-19. SHA-256 `74ddbf6a04ca9fb4e6b9ef0da537231045a293d56242571749cda079349d40c5`.
- Toby Gee, Florian Herzig, Tong Liu and David Savitt, [Potentially crystalline lifts of certain prescribed types](https://arxiv.org/pdf/1506.01050v3), arXiv:1506.01050v3, 7 February 2017; preprint pagination, 22 pages. Read: Theorem D, p. 4; §1.2, pp. 5–6; Theorem 3.1.5 and proof, p. 21. Accessed 2026-10-19. SHA-256 `a216ee78611548869ea2211c7ee7808e6c3ec627aea78d90216e39c0497e3a85`.
- Eloise Hamann, [On power-invariance](https://msp.org/pjm/1975/61-1/pjm-v61-n1-p17-p.pdf), Pacific Journal of Mathematics 61 (1975), 153–159. Read: Theorem 4 and proof, pp. 155–156. Accessed 2026-10-19. SHA-256 `29b601cf166b3c8c9771a1e57e659b77f8b731f61fca6d484db8900cedd52931`.
