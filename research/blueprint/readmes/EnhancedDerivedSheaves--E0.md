# Enhanced derived categories of sheaves

Ordinary derived categories retain cohomology, shifts and distinguished triangles. Many operations on sheaves also depend on the homotopies between maps and on coherent compatibility among those homotopies. The purpose of this roadmap is to give unbounded derived sheaves a concrete enhancement, compare it with the existing ordinary category, and build the operations needed for descent and adic coefficients in that enhancement. Limits, colimits, adjoints and descent equivalences are required on mapping spaces as well as on objects.

The five layers covered here are the concrete higher-category foundation (E0), unbounded derived sheaves (E1), convergence and descent (E2), coherent diagrams and adjoints (E3), and the application of generic completion to sheaves and coefficient systems (E4). The algebraic, operadic and Ind constructions in E5 have their own scope. Ordinary scheme and site constructions come from their existing owners. A geometric application must prove the relevant site hypotheses before applying one of the abstract results below.

## Conventions and existing mathematics

The comparison baseline is Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. Mathlib supplies simplicial sets, the inner-horn quasicategory predicate, Kan complexes, the QCat homotopy bicategory, ordinary nerves, sheaves of modules, Grothendieck abelian categories, unbounded ordinary derived categories, shifts and truncations. Tau Ceti supplies the signed linear Hom complex and its enrichment. The appendix names the precise existing interfaces. None of these carriers is to be reconstructed privately.

Cochain differentials raise degree. An object A of the heart has A[1] concentrated in cohomological degree −1. The homological Hom convention used for the differential graded nerve is obtained by reindexing degree m to cohomological degree −m. Good truncation puts cycles in degree zero. The resulting mapping space has π_i equal to H^(−i) of derived Hom for i≥0. Negative cohomological information is therefore visible in positive homotopy groups of a mapping space.

Mathlib orders enriched composition as Hom(x,y)⊗Hom(y,z)→Hom(x,z). The existing Tau Ceti closed composition uses the opposite factor order. Its Koszul braiding is the required comparison, including the sign on homogeneous factors. Suspension, cofibres and the rotation of distinguished triangles must agree with the chosen cochain shift and mapping cone. An equivalence of homotopy categories that ignores this comparison does not establish the desired enhancement.

Work in a fixed sufficiently large universe for each small site and diagram. Increasing a cardinal cutoff is accompanied by explicit comparison functors. Presentability means accessibility at some regular cardinal together with small colimits. It does not mean ω-compact generation on every site. A choice of K-injective or K-flat replacement must respect the chosen universe, and its functoriality is a separate requirement from objectwise existence.

Ordinary sheaf/topos interfaces are supplied by `DiamondsAndVStacks:D0`; E1 owns their derived enhancement and ringed functors. E2 owns coherent inverse limits, Postnikov convergence and enhanced hypercover descent. E3 owns generic Kan, adjoint, localization and cutoff arguments. `DerivedDeRhamCohomology:DD.1` supplies generic algebraic completion, Koszul and telescope comparisons, generator independence and completed tensor. E4 extends that interface to sheaves. The DGAInfinity layers on signed infrastructure and DG categories supply the general enriched carriers. This ownership keeps the dependency order acyclic: E0/E1 foundations feed the abstract E5 consumers; an E2 use of E5 module descent imports only the algebraic tensor-nilpotence theorem.

## E0 — A concrete enhancement and higher-category operations

The basic space is a Kan complex. The basic higher category is a quasicategory, and a categorical equivalence has a quasi-inverse and two invertible coherent transformations in the existing QCat bicategory. Mapping-space full faithfulness and essential surjectivity characterize the same equivalences. The homotopy category by itself is not a detecting invariant: projecting the one-object DG algebra ℤ⊕ℤε, with ε in cohomological degree −1 and square zero, to ℤ preserves degree-zero homology but destroys a mapping-space π₁.

Use the oriented join K⋆L to construct cones and slices: K vertices precede L vertices. A diagram p:K→C has a cone category C_/p represented by maps Y⋆K→C extending p; reversing the join gives cocones. Limits are terminal cones and colimits are initial cocones. Their universal properties use equivalences of spaces. For example, *×_{K(ℤ,1)}* is a homotopy pullback with components ℤ, whereas pulling back only sets of components loses this information.

The functor category is the existing simplicial internal Hom. Its edges encode natural transformations with their coherent squares, and evaluation detects invertibility. Stability requires a zero object, fibres and cofibres and their compatibility; it supplies finite limits and colimits and identifies pushout squares with pullback squares. These operations underpin the cochain comparison and every inverse-limit calculation.

The dg nerve is the concrete model used for derived sheaves. Its simplices consist of objects, closed degree-zero edges and higher Hom elements satisfying the signed differential equation. Collapsed edges become identities; larger collapsed coherences become zero. The construction must be compared both with the degree-zero homology category and with the homotopy-coherent nerve of the Dold–Kan enrichment. Those are distinct comparison theorems. Restricted straightening is needed over interval, simplicial, tower and refinement nerves; it is specified with coCartesian sections and is not an ordinary diagram category in the homotopy category.


### Right mapping space

For a quasicategory C and vertices x,y, define Hom^R_C(x,y) as the simplicial set of maps Δ[n+1]→C whose restriction to the first n+1 vertices is constant at x and whose final vertex is y. Its simplicial operators extend α:[m]→[n] by sending the final vertex to the final vertex. The Kan property and comparison with other mapping-space models are separate obligations.

Construction or proof: Take the specified subset of maps of standard simplices in each degree. Restriction along the extended monotone maps preserves both endpoint conditions and satisfies the simplicial identities.

Required API:

- **rightMappingSpace**: The endpoint-constrained simplicial set Hom^R_C(x,y).
- **rightMappingSpace_vertices**: Vertices are precisely edges x→y.
- **rightMappingSpace_map**: A simplicial map C→D sends endpoint-constrained simplices to the corresponding endpoint-constrained simplices, compatibly with composition.

Unit tests:

- **rightMappingSpace_point**: For the terminal simplicial set and its unique vertex, the right mapping space is terminal.
- **rightMappingSpace_ordinary**: For the nerve of an ordinary category A, Hom^R(x,y) is the constant simplicial set on Hom_A(x,y).
- **rightMappingSpace_two_simplex**: A 1-simplex is a triangle with first edge id_x and final vertex y, not an arbitrary triangle in C.

Uses: `EnhancedDerivedSheaves:E0/dg-nerve-mapping-space`: Dold–Kan identifies this specified mapping model; `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`: Mapping-space universal properties.

Direct inputs: `mathlib:SSet`, `mathlib:SSet.Quasicategory`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Remark 1.3.1.12, p. 83.

### Right mapping spaces are spaces

For a quasicategory C and vertices x,y, Hom^R_C(x,y) is Kan. A categorical equivalence C→D induces a weak homotopy equivalence on these mapping spaces; conversely these equivalences together with essential surjectivity imply categorical equivalence. For Kan complexes weak homotopy equivalence agrees with categorical equivalence.

Construction or proof: Convert each outer mapping-space horn to an inner horn with fixed initial face in C. Use the Q-cosimplicial comparison to the simplicial localization and its equivalence criterion.

Direct inputs: `EnhancedDerivedSheaves:E0/right-mapping-space`, `EnhancedDerivedSheaves:E0/categorical-equivalences`, `mathlib:SSet.KanComplex`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Proposition 1.2.2.3, PDF p. 45; Propositions 2.2.2.7, 2.2.2.9 and 2.2.2.13, PDF pp. 94–96; Theorem 2.2.5.1, PDF p. 107.

Acceptance: For N(A), the mapping space is the discrete set Hom_A(x,y). For the square-zero dg algebra with cohomology in degree −1 the self-mapping π₁ is nonzero.

### Categorical equivalences

A simplicial map F:C→D between quasicategories is a categorical equivalence when it has a quasi-inverse G together with natural equivalences GF≃id_C and FG≃id_D, in the pinned homotopy bicategory of quasicategories. This is equivalent to essential surjectivity on hD and equivalences on all mapping spaces. Equivalence of homotopy categories alone is insufficient.

Construction or proof: Express the inverse and two natural isomorphisms in the existing homotopy bicategory. The comparison with the mapping-space criterion uses right mapping spaces and the coherent nerve/Joyal comparison.

Required API:

- **IsCategoricalEquivalence**: Existence of a quasi-inverse and the two natural equivalences.
- **categoricalEquivalence_comp**: Categorical equivalences are closed under composition and satisfy two-out-of-three.
- **categoricalEquivalence_nerve**: N(F) is a categorical equivalence exactly when the ordinary functor F is an equivalence.

Unit tests:

- **categoricalEquivalence_identity**: id_C is a categorical equivalence.
- **categoricalEquivalence_skeleton**: The nerve of a skeleton inclusion into an ordinary category is a categorical equivalence.
- **categoricalEquivalence_not_homotopyCategory**: The one-object dg algebra ℤ⊕ℤε, |ε|=−1 cohomologically, ε²=dε=0, has the same h-category as its projection to ℤ but its mapping π₁ changes from ℤ to zero; that projection is not a categorical equivalence.

Uses: `EnhancedDerivedSheaves:E1/enhanced-derived-category`: quasi-isomorphisms must become equivalences in the enhancement.

Direct inputs: `mathlib:SSet.QCat.bicategory`, `mathlib:SSet.QCat.strictBicategory`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Definition 1.2.10.1 and Remark 1.2.10.2, PDF p. 61; Theorem 2.2.5.1, PDF p. 107.

### The simplicial join

For simplicial sets K,L, construct K⋆L with n-simplices the disjoint union K_n ⊔ L_n ⊔ ⨿_{a+b+1=n} K_a×L_b. Equivalently use augmented simplicial degrees with K_{−1}=L_{−1}=*. Faces and degeneracies act in the indicated factor and, at a boundary, pass into the other factor. This convention places every K vertex before every L vertex.

Construction or proof: Define operators by splitting an ordered simplex at its last K vertex. Verify the simplicial identities by restriction of the same ordered map. Identify Δ[a]⋆Δ[b] with Δ[a+b+1].

Required API:

- **join**: The functorial join K⋆L.
- **join_inclusions**: Canonical inclusions of K and L.
- **join_map**: Maps on each factor give a map of joins; identity and composition hold.

Unit tests:

- **join_empty**: ∅⋆K≅K≅K⋆∅.
- **join_points**: Δ[0]⋆Δ[0]≅Δ[1], with the first factor its source vertex.
- **join_simplices**: Δ[a]⋆Δ[b]≅Δ[a+b+1].

Uses: `EnhancedDerivedSheaves:E0/slices-and-cones`: joins represent the two slice constructions.

Direct inputs: `mathlib:SSet`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), §1.2.8, PDF pp. 58–59 (9 April 2017 copy).

### Slices and cone categories

For p:K→C, define C_{/p} by Hom(Y,C_{/p})≅{q:Y⋆K→C | q|K=p}; define C_{p/} using K⋆Y. For a quasicategory C these are quasicategories. Their vertices are coherent cones with a vertex before, respectively after, p; their projection to C remembers the cone vertex.

Construction or proof: Construct degree n by the displayed relative join maps. Extend an inner horn using the join inner-anodyne inclusion. Transport slice objects and maps under composition with a functor.

Required API:

- **overDiagram**: The cone category C_{/p}.
- **underDiagram**: The cocone category C_{p/}.
- **slice_vertex**: The forgetful simplicial map to C.
- **slice_joinEquiv**: The natural representing bijections above.

Unit tests:

- **slice_empty**: For K=∅ both slice categories are C.
- **slice_point**: For C=N(A) and p a single object a, these are N(A/a) and N(a/A).
- **slice_discrete_two**: For K two discrete vertices, a cone has two edges from its vertex; it does not impose an arrow between the two prescribed vertices.

Uses: `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`: initial and terminal cones define enhanced colimits and limits.

Direct inputs: `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `mathlib:SSet.Quasicategory`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), §1.2.9, Proposition 1.2.9.3, PDF pp. 60–61.

### Functor quasicategories and transformations

For a simplicial set K and quasicategory C, Fun(K,C) is the simplicial internal Hom: its n-simplices are maps K×Δ[n]→C. It is a quasicategory. Its edges are coherent natural transformations, and an edge is invertible if and only if its evaluation at every vertex of K is invertible.

Construction or proof: Reuse the pinned simplicial enrichment for the internal Hom. Extend inner horns by the product inner-anodyne theorem. Use vertexwise equivalence extension across K to prove the evaluation criterion.

Required API:

- **coherentFun**: The internal-Hom simplicial set, with its quasicategory instance.
- **coherentFun_eval**: Evaluation at a vertex, as a functor.
- **coherentNatTrans**: Edges are maps K×Δ[1]→C with the specified two endpoint restrictions.
- **coherentFun_pointwiseEquiv**: A transformation is invertible precisely when every vertex component is invertible.

Unit tests:

- **coherentFun_point**: Fun(Δ[0],C)≅C.
- **coherentFun_ordinary**: Fun(N(A),N(B))≅N(A⥤B) for ordinary small categories.
- **coherentFun_interval**: Vertices of Fun(Δ[1],C) are edges of C; its edges include a square and its filling coherence, not four unrelated arrows.

Uses: `EnhancedDerivedSheaves:E3/left-kan-extension-along-a-full-inclusion`: restriction and extension are functors between coherent functor categories; `PAPER-BHATT-ETAL-23/triangulated-limit-warning`: retains the diagram coherences lost by an ordinary triangulated diagram.

Direct inputs: `mathlib:SSet`, `mathlib:SSet.QCat.bicategory`, `EnhancedDerivedSheaves:E0/categorical-equivalences`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Proposition 1.2.7.3, PDF p. 57; Theorem 2.2.5.1, PDF p. 107; equivalence extension in §2.4.4.

### Enhanced limits and colimits

A cone c∈C_{/p} is limiting when c is terminal in that quasicategory; a cocone c∈C_{p/} is colimiting when c is initial. Initial means that every outgoing mapping space is contractible, terminal means the corresponding incoming condition. Thus for every z the maps Map_C(z,lim p)→lim_k Map_C(z,p(k)) and Map_C(colim p,z)→lim_k Map_C(p(k),z) are equivalences of spaces, naturally in z.

Construction or proof: Use contractibility of cone mapping spaces to characterize initial/terminal cones. Identify the space of maps into or out of a cone with the coherent space of compatible maps. Deduce uniqueness as a contractible space of choices.

Required API:

- **IsEnhancedLimit**: Terminality of a cone in C_{/p}.
- **IsEnhancedColimit**: Initiality of a cocone in C_{p/}.
- **enhancedLimit_mapEquiv**: The natural mapping-space equivalence for a limiting cone.
- **enhancedColimit_mapEquiv**: The dual equivalence for a colimiting cocone.
- **enhancedLimit_nerve**: Ordinary limiting cones in N(A) agree with Mathlib IsLimit; dually for colimits.

Unit tests:

- **enhancedLimit_empty**: An empty-diagram limit is terminal and its colimit is initial.
- **enhancedLimit_ordinary_product**: The product cone for two sets in N(Type) is their ordinary cartesian product.
- **enhancedLimit_loop**: The homotopy pullback *×_{K(ℤ,1)}* is K(ℤ,0), not a point; computing only the pullback of π₀ misses it.

Uses: `EnhancedDerivedSheaves:E2/coherent-towers-and-roos`: inverse limits use this universal property; `EnhancedDerivedSheaves:E4/compatible-coefficient-systems`: coherent categorical limits retain coefficient-change data.

Direct inputs: `EnhancedDerivedSheaves:E0/slices-and-cones`, `EnhancedDerivedSheaves:E0/right-mapping-space`, `EnhancedDerivedSheaves:E0/mapping-space-kan-and-equivalences`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Definition 1.2.12.1, PDF pp. 62–63; Definition 1.2.13.4 and Remark 1.2.13.3, PDF p. 65; Lemma 4.2.4.3, PDF p. 275.

### Stable quasicategories

A stable quasicategory is pointed, has all finite limits and finite colimits, and a commutative square is a pullback exactly when it is a pushout. Define fibre and cofibre by the squares over/from zero, suspension as cofib(x→0), and loop as fib(0→x). An exact functor is one preserving finite limits, equivalently finite colimits, between stable categories.

Construction or proof: Build the pointed finite-limit/finite-colimit operations. Prove the fibre/cofibre criterion and that loop and suspension are inverse equivalences. Identify exactness in its two forms using bicartesian squares.

Required API:

- **IsStable**: Pointedness, finite limits/colimits and equality of pullback and pushout squares.
- **stable_fibre_cofibre**: Fibre and cofibre functors with their canonical maps.
- **stable_suspension_loop**: Suspension and loop are inverse categorical equivalences.
- **stable_exact_iff**: Preserving finite limits is equivalent to preserving finite colimits.

Unit tests:

- **stable_zero**: The one-object, one-morphism category is stable.
- **stable_not_modules**: N(Mod_ℤ) is not stable: the pullback square of 0→ℤ←0 is not a pushout square.
- **stable_complex_shift**: In the enhancement of complexes, ΣK agrees with K[1], including the sign on its differential.

Uses: `EnhancedDerivedSheaves:E1/enhanced-derived-category`: stability follows from the dg cone and shift; `EnhancedDerivedSheaves:E3/exact-coproducts-colimits`: finite exactness and coproducts control all colimits.

Direct inputs: `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/categorical-equivalences`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Definition 1.1.1.9 and Proposition 1.1.3.4, pp. 19–20 and 31–32; Proposition 1.1.4.1, p. 33.

### The differential graded nerve

Let C be a differential graded category. The differential graded nerve N_dg(C) is the simplicial set whose n-simplices are the ordered pairs ({X_i}_{0 <= i <= n}, {f_I}) where: (a) for 0 <= i <= n, X_i is an object of C; and (b) for every subset I = {i_- < i_m < i_{m-1} < ... < i_1 < i_+} of [n] with m >= 0, f_I is an element of Map_C(X_{i_-}, X_{i_+})_m satisfying d f_I = sum over 1 <= j <= m of (-1)^j (f_{I - {i_j}} - f_{{i_j < ... < i_1 < i_+}} composed with f_{{i_- < i_m < ... < i_j}}). For a nondecreasing alpha : [m] -> [n] the induced map sends ({X_i},{f_I}) to ({X_{alpha(j)}}, {g_J}) with g_J = f_{alpha(J)} if alpha restricted to J is injective, the identity of X_i if J = {j,j'} with alpha(j) = alpha(j') = i, and 0 otherwise.

Hypotheses and conventions: Homological grading in HA: differential lowers degree. Imported DG categories use cohomological grading; the reindexing and composition-order comparison is an explicit required comparison input. A DG category over any commutative ring is viewed over ℤ by restriction of scalars. Higher chain data alone do not imply inequivalence with an ordinary nerve; a nonzero positive homology group of a mapping complex supplies the obstruction.

Construction or proof: Use the simplex data and differential equation displayed in the statement. Check preservation of the equation by the three-case simplicial-operator formula, including collapsed edges; verify identity and composition. The inner-horn result is the separate dg-nerve-inner-horns node.

Required API:

- **dgNerve**: Simplicial set of the stated DG coherence data.
- **dgNerve_vertices**: Vertices identify with objects of C.
- **dgNerve_edges**: Edges x→y identify with closed degree-zero elements of Map_C(x,y).
- **dgNerve_degeneracy**: A collapsed edge is an identity; a larger noninjectively indexed coherence is zero.

Unit tests:

- **dgNerve_triangle**: For edges f:x→y, g:y→z, h:x→z, a triangle carries z in Map_C(x,z)_1 with dz=g∘f−h.
- **dgNerve_constant_edge**: The degeneracy of x is id_x, not zero.
- **dgNerve_degree_zero**: For a preadditive category with Hom complexes concentrated in degree zero, the dg nerve is isomorphic to its ordinary nerve.
- **dgNerve_higher_homology**: For the one-object DG ℤ-algebra ℤ⊕ℤε with |ε|=1, ε²=0 and d=0 in homological grading, π₁ of its self-mapping space is ℤ; it cannot be equivalent to an ordinary-category nerve.

Uses: `EnhancedDerivedSheaves:E0/dg-nerve-homotopy-category-and-mapping-spaces`: the mapping spaces and homotopy category are computed from it; `EnhancedDerivedSheaves:E1`: the enhanced derived category is the dg nerve of a K-injective model; `EtaleDualityAndPerverseSheaves:EDC.0`: the etale-duality roadmap consumes the same enhancement.

Direct inputs: `mathlib:SSet`, `mathlib:CategoryTheory.Preadditive`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Construction 1.3.1.6, p. 81; Example 1.3.1.8, p. 82.

### Inner horn filling for the dg nerve

For every DG category C, N_dg(C) satisfies the inner horn-filling condition. For Λⁿⱼ with 0<j<n, choose f_[n]=0 and f_[n]−{j}=Σ_(0<p<n)(−1)^(p−j)f_{p,…,n}∘f_{0,…,p}−Σ_(0<p<n,p≠j)(−1)^(p−j)f_[n]−{p}.

Construction or proof: The horn specifies all coherence entries except the full set and its j-th face. The displayed formula solves the equation on the full set. Apply d, the Leibniz rule and the already known proper-face equations to verify the remaining equation.

Direct inputs: `EnhancedDerivedSheaves:E0/dg-nerve`, `mathlib:SSet.Quasicategory`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Proposition 1.3.1.10, p. 82.

Acceptance: For n=2,j=1 choose h=g∘f and homotopy zero. Do not assert outer horn filling.

### Homotopy category of the dg nerve

The canonical functor hC→hN_dg(C) is an isomorphism, identity on objects and identifying morphisms with H₀(Map_C(x,y)). Here hC is the degree-zero homology category of the DG category, not its category of closed degree-zero maps.

Construction or proof: Edges are degree-zero cycles. The relation supplied by triangles with a degenerate edge is exactly difference by a degree-one boundary. The DG Leibniz rule makes composition descend; vertices and resulting morphism sets agree.

Direct inputs: `EnhancedDerivedSheaves:E0/dg-nerve`, `EnhancedDerivedSheaves:E0/dg-nerve-inner-horns`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Remarks 1.3.1.5 and 1.3.1.11, pp. 81, 83.

Acceptance: For Hom concentrated in degree zero this is the original preadditive category.

### Dold–Kan mapping-space comparison

For x,y in a DG category in homological grading there is an isomorphism of simplicial sets Hom^R_{N_dg(C)}(x,y)≅DK(τ≥0 Map_C(x,y)), using good connective truncation (cycles at degree zero).

Construction or proof: Restrict the dg simplex equation to a simplex constant on its first face; only coherences containing the final vertex can remain nonzero. The sign change identifies these families with chain maps N_*(ℤΔ[n])→Map_C(x,y). Apply the normalized-chain/Dold–Kan evaluation comparison from HA 1.2.3.12; the pinned normalization and composition-order comparison remains a required bridge.

Direct inputs: `EnhancedDerivedSheaves:E0/right-mapping-space`, `EnhancedDerivedSheaves:E0/dg-nerve`, `mathlib:CategoryTheory.Abelian.DoldKan.equivalence`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Remark 1.3.1.12, p. 83.

Acceptance: Degree-zero-only Hom gives a discrete mapping space. A homological degree-one copy of ℤ contributes π₁=ℤ.

### Simplicial enrichment of a DG category

Given a DG category C in homological grading, construct C_Δ with the same objects and simplicial Hom sets underlying DK(τ≥0 Map_C(x,y)). Composition is induced by the right-lax monoidal truncation and Dold–Kan functors, using Alexander–Whitney, followed by forgetting abelian groups.

Construction or proof: Transport enriched composition through the right-lax monoidal functors. Use their unit/associativity constraints to verify the enriched-category axioms. Simplicial abelian groups are Kan, so all mapping spaces are fibrant; the proof of this general fact remains to be decomposed.

Required API:

- **dgSimplicialCategory**: C_Δ with the stated objects and mapping objects.
- **dgSimplicialCategory_hom**: Its Hom(x,y) is the underlying DK of good connective truncation.
- **dgSimplicialCategory_unit**: The enriched unit is the constant simplex associated to id_x.

Unit tests:

- **dgSimplicialCategory_degree_zero**: For Hom concentrated in degree zero, every mapping simplicial set is constant.
- **dgSimplicialCategory_zero_hom**: A zero Hom complex gives the one-point simplicial abelian group.
- **dgSimplicialCategory_composition_zero**: On 0-simplices the composition is the original composition of closed degree-zero maps.

Uses: `EnhancedDerivedSheaves:E0/dg-nerve-coherent-comparison`: Input to the existing SimplicialNerve.

Direct inputs: `mathlib:CategoryTheory.Abelian.DoldKan.equivalence`, `EnhancedDerivedSheaves:E0/dg-nerve`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Construction 1.3.1.13 and Remark 1.3.1.14, pp. 83–84.

### Homotopy-coherent nerve comparison

For every DG category C, the canonical map θ:N(C_Δ)→N_dg(C) is an equivalence of quasicategories. Here N is the homotopy-coherent simplicial nerve and C_Δ is the simplicial enrichment. This is not a statement about the ordinary nerve of the underlying category.

Construction or proof: Define θ on each coherence f_I by the alternating sum over permutations of the interior vertices of I, evaluated on the chains of subsets in C[Δⁿ]. Verify faces and degeneracies. θ is identity on vertices. Identify source right mapping spaces as Sing_Q DK(τ≥0 Map), and target ones by the dg mapping-space comparison. HTT 2.2.2.7, 2.2.2.9 and 2.2.2.13 identify the Q-cosimplicial mapping model and prove the comparison fully faithful. The signed normalized-chain bridge with the pinned enrichment is a separate required comparison.

Direct inputs: `EnhancedDerivedSheaves:E0/dold-kan-simplicial-enrichment`, `EnhancedDerivedSheaves:E0/dg-nerve-mapping-space`, `EnhancedDerivedSheaves:E0/dg-nerve-inner-horns`, `mathlib:CategoryTheory.SimplicialNerve`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Construction 1.3.1.16 and Proposition 1.3.1.17, pp. 84–85.

Acceptance: θ is bijective in dimensions ≤2; do not upgrade it to an isomorphism in all dimensions. Recover the degree-zero preadditive case.

### The stable API, and the comparison of shifts and cone signs with the cochain convention

In the concrete dg-nerve model, identify suspension with the pinned cochain shift and cofibre with the pinned mapping cone, including their signs; identify the resulting triangulated homotopy-category structure with the existing pretriangulated structure. The elementary stable-category foundation is required in E0 before E5’s monoidal theory can use it.

Hypotheses and conventions: The dg category is closed under zero, shifts and mapping cones, or is the full K-injective replacement model with those operations transported through replacement. Cochain grading, suspension A[1] in degree −1, the pinned cone differential and enriched composition order are fixed.

Construction or proof: Construct zero objects, fibres, cofibres and suspension in the dg nerve of complexes. Identify the suspension with the shift of cochain complexes and the cofibre with the mapping cone. Compare the resulting triangulated structure on the homotopy category with the pinned pretriangulated structure, including the signs.

Direct inputs: `EnhancedDerivedSheaves:E0/dg-nerve-homotopy-category-and-mapping-spaces`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `mathlib:CategoryTheory.Pretriangulated`, `mathlib:CategoryTheory.HasShift`, `mathlib:DerivedCategory`, `mathlib:CategoryTheory.Limits.HasZeroObject`, `EnhancedDerivedSheaves:E0/dg-nerve-mapping-space`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Definition 1.1.1.9 and Theorem 1.1.2.14, printed pp. 19 and 27.

Acceptance: Check that the suspension is the cochain shift, with the pinned convention Check that the cofibre is the mapping cone, with its signs Check that the triangulated structure agrees with the pinned pretriangulated one Check that no alternative convention is adopted to make the comparison trivial

### CoCartesian fibrations

For an inner fibration p:E→B, an edge e:x→y over a:u→v is p-coCartesian when for every z the square Map_E(y,z)→Map_E(x,z) over Map_B(v,pz)→Map_B(u,pz) is a homotopy pullback. The fibration is coCartesian when each pair (x,a:px→v) has such a lift. A coCartesian section is a section B→E sending every edge of B to a p-coCartesian edge.

Construction or proof: Use the dual of the slice trivial-fibration definition and prove its mapping-space characterization. Construct the simplicial subset of sections with the edge condition. Prove that composition and equivalences preserve coCartesian edges.

Required API:

- **IsCoCartesianEdge**: The stated homotopy-pullback condition.
- **IsCoCartesianFibration**: An inner fibration with a lift for every outgoing base edge.
- **coCartesianSections**: The full coherent category of edge-preserving sections.
- **coCartesianEdge_comp**: Composites of coCartesian edges are coCartesian.

Unit tests:

- **cocartesian_product**: B×C→B is coCartesian; a lifted edge is coCartesian exactly when its C component is invertible.
- **cocartesian_ordinary**: For the nerve of the Grothendieck construction of F:A→Cat, the canonical transport edges are coCartesian.
- **cocartesian_sections_interval**: For an interval-classified functor T:C→D, a coCartesian section is an object x∈C together with an equivalence T(x)≃y∈D, not an arbitrary map T(x)→y.

Uses: `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`: classification uses the edge condition; `EnhancedDerivedSheaves:E4/compatible-coefficient-systems`: systems are coCartesian sections of the reduction diagram.

Direct inputs: `mathlib:SSet.InnerFibration`, `EnhancedDerivedSheaves:E0/mapping-space-kan-and-equivalences`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Definitions 2.4.1.1 and 2.4.2.1, PDF pp. 133 and 139; Proposition 2.4.4.3, PDF p. 149 (apply the opposite-category dual).

### Restricted straightening and sections

For each small base B used here (NΔ, N(ℕᵒᵖ), their interval products, and small hypercover-refinement categories), straightening and unstraightening identify functors B→Cat∞ with coCartesian fibrations over B. The fibre at b identifies with the value at b, transport with the assigned functor, and base change with restriction. The category of coCartesian sections is the limit of the classified diagram.

Construction or proof: Use marked simplicial sets whose marked edges are the coCartesian edges. Construct relative coherent realization and its nerve; prove the marked-model Quillen equivalence and restrict its derived equivalence to the listed small bases. Identify sections by their fibrewise universal property.

Direct inputs: `EnhancedDerivedSheaves:E0/cocartesian-edges-and-fibrations`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `mathlib:CategoryTheory.Grothendieck`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Theorem 3.2.0.1, PDF p. 187; Corollary 3.3.3.2, PDF p. 234, with the coCartesian dual.

Acceptance: For an ordinary Cat-valued diagram recover its Grothendieck construction. For a constant diagram the coCartesian section category is Fun(B^gpd,C), equivalently the full subcategory of Fun(B,C) sending every base edge to an equivalence; for B an interval it is equivalent to C. For an inverse sequence the result retains coherent transition equivalences; h(lim C_n) need not equal lim h(C_n).

### Accessible and presentable quasicategories

For a regular cardinal κ, an object c is κ-compact when Map(c,−) preserves κ-filtered colimits. C is κ-accessible when it admits these colimits and is generated under them by a small full subcategory of κ-compact objects. A functor is accessible when it preserves κ-filtered colimits for some common regular κ. A presentable category is accessible and admits all small colimits in the chosen universe.

Construction or proof: State compactness using mapping spaces, not sets of homotopy classes. Specify the universe and regular cardinal consistently for diagrams, generators and accessibility.

Required API:

- **IsKappaCompact**: Preservation of κ-filtered colimits by Map(c,−).
- **IsAccessible**: A small κ-compact generating family for a regular κ.
- **IsPresentable**: Accessibility together with all small colimits.
- **presentable_universe**: All diagrams and generating families are taken in the specified universe; a change of universe is recorded explicitly.

Unit tests:

- **compact_finite_free**: A finite free R-module in degree zero is compact in D(R).
- **compact_infinite_free**: ⊕_{n∈ℕ}ℤ[0] is not compact in D(ℤ): its identity does not factor through a finite subsum.
- **presentable_zero**: The zero stable category is presentable and its zero object is compact.

Uses: `EnhancedDerivedSheaves:E1/derived-presentability`: combinatorial localization supplies this property; `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`: the abstract adjoint theorem needs presentability.

Direct inputs: `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/mapping-space-kan-and-equivalences`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Definition 5.3.4.5, PDF p. 414; Definition 5.4.2.1 and Proposition 5.4.2.2, PDF p. 441; Definition 5.5.0.1, PDF p. 474.

## E1 — Unbounded derived sheaves and presentability

Sheaves of modules on a small ringed site already form a Grothendieck abelian category. Build the enhancement from the dg category of K-injective complexes of injectives and identify its homotopy category with the existing quasi-isomorphism localization. The localization comparison requires mapping-space full faithfulness and essential surjectivity from replacements. Cohomology detects equivalences after this comparison; it is not a substitute for constructing it.

K-flatness is the requirement that tensor with every acyclic complex is acyclic. Bounded-above flat complexes provide the finite steps, and a filtered staircase gives replacements for arbitrary unbounded complexes. Tensor uses the existing signed direct-sum totalization. Replacements must be chosen functorially and with a regular-cardinal bound. K-injective models need not be tensor closed. Internal Hom is constructed with a K-injective second argument, compared with the tensor/Hom mapping-space adjunction, and made compatible with restriction to slices.

On a small ringed site the enhancement is presentable. Filtered derived colimits are represented degreewise, and cohomology commutes with them. Slice-free generators and their shifts detect objects; their compactness holds at a sufficiently large cardinal. Ringed inverse image includes derived scalar extension, and its pushforward is K-injective right derivation. Exact inverse image occurs when the coefficient sheaf is pulled back unchanged. A coefficient map ℤ→ℤ/p illustrates why scalar extension cannot be replaced by ordinary tensor.

Perfect F_p-rings supply additional algebraic input. The radical principal ideal is a union of Frobenius-root ideals and a filtered colimit of free modules with explicit transition multipliers. This yields perfect-algebra Tor independence even for nonflat quotient maps. It does not imply that arbitrary modules over a perfect ring are Tor independent. Finite perfect presentation gives a number-of-equations Tor bound; finite global dimension needs a regular Noetherian presentation of finite Krull dimension. The intrinsic corrected bound concerns Tor dimension, and the announced stronger global-dimension claim requires its own proof.

Dqc(X) means the unbounded enhancement of complexes with quasicoherent cohomology. Affine comparison, pullback and pushforward use the same sheaf enhancement. Perfect schemes have the additional base-change theorem arising from perfect-ring Tor independence. The valuation-module lemma retains spherical completeness, the full nonzero real value group, boundedness and saturation. Boundedness is Mathlib's existing bounded-set predicate. The splitting application retains connectivity: the H⁰ comparison for derived base change is stated for a connective complex, and the obstruction to a splitting is tracked through the resulting triangle.


### DG comparison for complexes of module sheaves

For a small ringed site, use the pinned Grothendieck abelian category SheafOfModules O and instantiate the existing ℤ-linear Hom-complex enrichment on its unbounded cochain complexes. Compare its reindexed homological Hom complex Hom_m(F,G)=Hom^(−m)(F,G) and braiding-adjusted composition with HA 1.3.2.1, so that the dg-nerve construction applies to this existing carrier.

Hypotheses and conventions: O is a sheaf of rings on a small site; ℤ-linearity follows from preadditivity. The Grothendieck instance is already in Mathlib; it is not a planned declaration. The homological/cohomological reindexing and the order of tensor factors must both be compared.

Construction or proof: Import the pinned SheafOfModules Grothendieck instance and Tau Ceti enrichment. Reindex the Hom differential by m↦−m and compare closed degree-zero maps with cochain maps. Use the Koszul braiding to translate Mathlib enriched composition to the composition order in HA.

Uses: `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`: the replacements are constructed in this Grothendieck abelian category; `EnhancedDerivedSheaves:E1/enhanced-derived-category`: the enhancement is the dg nerve of a model in this category; `DiamondEtaleCohomology:C0`: the diamond sites instantiate it.

Direct inputs: `mathlib:SheafOfModules`, `mathlib:CategoryTheory.IsGrothendieckAbelian`, `tauceti:TauCeti.linearHomComplexEnrichedCategory`, `mathlib:CategoryTheory.Preadditive`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Definition 1.3.2.1 and Remark 1.3.2.2, p. 88.

Acceptance: Closed degree-zero elements are exactly chain maps. Degree-one homological boundaries identify homotopic maps. The ordinary underlying category remains the pinned cochain-complex category.

### Unbounded K-injective replacement

For a Grothendieck abelian category A in the specified universe, unbounded complexes admit a functorial monomorphic quasi-isomorphism K→J(K), where J(K) is K-injective. The injective model structure on complexes has quasi-isomorphisms as weak equivalences and monomorphisms as cofibrations, is combinatorial, and its fibrant objects are K-injective complexes of injectives. A sufficiently large regular cardinal bounds the generating lifting problems.

Construction or proof: Use a generator and AB5 to choose a regular cardinal bounding small subcomplexes and their closure under differentials. Apply the injective small-object construction to factor K→0. Identify fibrancy using Hom from acyclic complexes and componentwise injectivity. The factorization is functorial by the chosen generating set.

Direct inputs: `EnhancedDerivedSheaves:E1/sheaves-of-modules-and-the-grothendieck-property`, `mathlib:CochainComplex.IsKInjective`, `mathlib:CategoryTheory.IsGrothendieckAbelian`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Proposition 1.3.5.3, Remarks 1.3.5.4–1.3.5.7 and Lemma 1.3.5.11, pp. 122–126.

Acceptance: The replacement applies to a complex with nonzero terms in arbitrarily negative degrees. A quasi-isomorphism between K-injective complexes is a chain homotopy equivalence. The size bound uses one regular cardinal for the site and ring, not one chosen separately for each map.

### K-flat complexes of module sheaves

A complex P of module sheaves over a commutative sheaf of rings O is K-flat when, for every acyclic complex A of O-modules, the direct-sum total tensor A⊗_O P is acyclic. This is a homological condition on all unbounded test complexes. Termwise flatness alone is not its definition.

Construction or proof: Use sheafification of the total tensor with the cochain Koszul signs. Express acyclicity using the pinned homology functors.

Required API:

- **IsKFlat**: Tensor with every acyclic complex is acyclic.
- **isKFlat_boundedAbove**: A bounded-above complex of flat module sheaves is K-flat.
- **isKFlat_tensor**: The total tensor of two K-flat complexes is K-flat.
- **isKFlat_quasiIso_tensor**: A quasi-isomorphism between K-flat complexes remains a quasi-isomorphism after tensoring with any complex.

Unit tests:

- **kFlat_unit**: O[0] is K-flat.
- **kFlat_flat_shift**: A flat module F placed in any single degree is K-flat.
- **kFlat_not_Zmodp**: For p prime, (ℤ/p)[0] is not K-flat over ℤ: tensoring the acyclic cone of [ℤ --p→ ℤ]→(ℤ/p)[0] gives nonzero cohomology.

Uses: `EnhancedDerivedSheaves:E1/k-flat-replacement`: the target replacement must satisfy this universal acyclicity condition; `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`: the localization tensor is constructed on K-flat models.

Direct inputs: `mathlib:CochainComplex`, `mathlib:SheafOfModules`, `mathlib:CategoryTheory.Abelian`.

Source: [The Stacks Project, Cohomology on Sites](https://stacks.math.columbia.edu/download/sites-cohomology.pdf), Cohomology on Sites, Definition 21.17.2 (06YN), Lemmas 21.17.4–6 (0E8K, 07A2, 07A3), PDF p. 29.

### Unbounded K-flat replacement

On a small ringed site every unbounded O-complex K admits a termwise epimorphic quasi-isomorphism P(K)→K with P(K) termwise flat and K-flat. The free-module-cover staircase can be chosen functorially after fixing a universe and a generating covering family; the resulting diagrams have cardinality bounded by the input, site, coefficient sheaf and one regular closure cardinal.

Construction or proof: Cover modules using sums of slice-free modules and resolve bounded-above truncation complexes by these flat covers. Arrange the maps in a staircase with degreewise split monomorphisms between the flat approximations. Its filtered colimit is K-flat by AB5 and resolves K. Use the sum of all free cover maps rather than an objectwise arbitrary choice to obtain functoriality; record the regular-cardinal closure argument.

Direct inputs: `EnhancedDerivedSheaves:E1/k-flat-complexes`, `EnhancedDerivedSheaves:E1/sheaves-of-modules-and-the-grothendieck-property`, `DiamondsAndVStacks:D0`.

Source: [The Stacks Project, Cohomology on Sites](https://stacks.math.columbia.edu/download/sites-cohomology.pdf), Cohomology on Sites, Lemmas 21.17.8–12 (06YQ, 06YR, 077J, 06YS, 06YT), PDF pp. 30–31.

Acceptance: No lower boundedness on K is imposed. Tensoring two replacements computes the derived tensor, and replacing either model changes the result by a quasi-isomorphism. Functoriality and the single-universe cardinal bound are part of the construction, not consequences of objectwise existence alone.

### The enhanced derived category

Let A be a Grothendieck abelian category. D∞(A) is the dg nerve of the full dg category of K-injective complexes of injectives. Its homotopy category is equivalent to the pinned DerivedCategory A through the quasi-isomorphism localization; the comparison sends a complex to its K-injective replacement. Map(K,L) is Dold–Kan of the nonnegative homological truncation of derived Hom(K,L), with π_i=H^(−i)RHom(K,L) for i≥0. It is stable, with the pinned cone/shift convention.

Construction or proof: Compare the ordinary nerve of complexes localized at quasi-isomorphisms with the dg nerve of fibrant complexes. Use K-injective replacement for essential surjectivity and the Hom-acyclic lifting argument for mapping-space full faithfulness. Identify the ordinary localization with Mathlib DerivedCategory. Zero, cones and shifts verify stability.

Required API:

- **enhancedDerived**: The dg nerve of the full K-injective dg model.
- **enhancedDerived.homotopyCategory**: The canonical equivalence hD∞(A)≌DerivedCategory A.
- **enhancedDerived.mappingSpaces**: The Dold–Kan computation and π_i=H^(−i)RHom formula.
- **enhancedDerived.isStable**: The stable-category instance with its cone/shift comparison.
- **detection**: A complex map becomes an equivalence precisely when it is a quasi-isomorphism; equivalences are detected by every integer cohomology object.

Unit tests:

- **enhancedDerived_zero**: The zero complex is a zero object and its self-mapping space is contractible.
- **enhancedDerived_Zmodp**: For p prime, Map_D(ℤ/p,ℤ/p[1]) has π₁≅ℤ/p as well as π₀≅Ext¹_ℤ(ℤ/p,ℤ/p); a discrete Hom set loses the π₁.
- **enhancedDerived_ordinary**: The equivalence of homotopy categories carries the localization of any complex map to DerivedCategory.Q.map of that map.

Uses: `EnhancedDerivedSheaves:E2/coherent-towers-and-roos`: inverse limits take place in this enhancement; `AInfCohomology:AI.1`: unbounded sheaf tensor and descent use this common enhancement.

Direct inputs: `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `EnhancedDerivedSheaves:E1/sheaves-of-modules-and-the-grothendieck-property`, `EnhancedDerivedSheaves:E0/dg-nerve`, `EnhancedDerivedSheaves:E0/dg-nerve-mapping-space`, `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`, `EnhancedDerivedSheaves:E0/stable-categories`, `mathlib:DerivedCategory`, `mathlib:DerivedCategory.isIso_iff`, `mathlib:DerivedCategory.isIso_Q_map_iff_quasiIso`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Definition 1.3.5.8, Proposition 1.3.5.9 and Proposition 1.3.5.15, pp. 124–127.

### Presentability of unbounded derived sheaves

For a small ringed site D∞(O) is presentable. Its localization functor from complexes inverts exactly quasi-isomorphisms and is accessible. Filtered homotopy colimits are represented by degreewise filtered colimits of complexes; cohomology commutes with them. Shifts of slice-free sheaf generators form a small detecting family, enlarged to κ-compact generators for a sufficiently large regular κ. This asserts accessibility, not compact generation for every site.

Construction or proof: Identify D∞ with the localization of the injective combinatorial model. Its small generating cofibrations and lifting maps provide an accessibility cardinal. AB5 identifies filtered homotopy colimits with degreewise colimits. A sheaf generator and all its shifts detect cohomology; choose a larger regular cardinal making their derived mapping functors κ-continuous.

Direct inputs: `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`, `mathlib:CategoryTheory.IsGrothendieckAbelian`, `DiamondsAndVStacks:D0`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Proposition 1.3.5.21 and Warning 1.3.5.22, pp. 128–130.

Acceptance: Infinite coproducts are represented by degreewise sums of complexes. Do not infer ω-compactness from the existence of a sheaf generator. The profinite-group counterexample to left completeness remains compatible with presentability.

### Derived sheaf tensor

For a commutative sheaf of rings O, define K⊗ᴸ_O L by the direct-sum total tensor of K-flat replacements and transfer it through the dg localization to D∞(O). It is independent of replacements, symmetric, associative and unital up to their coherent derived equivalences, and preserves small colimits separately. The cochain differential is d(x⊗y)=dx⊗y+(−1)^deg(x)x⊗dy.

Construction or proof: Tensor quasi-isomorphisms between K-flat models remain quasi-isomorphisms. Localize the multivariable K-flat relative category, retaining its symmetric-monoidal associators, unitors and braiding. Compare the resulting localization with the K-injective enhancement; tensor never requires K-injectives to be tensor-closed. A point-free coherence extension is recorded as a precise gap.

Required API:

- **derivedTensor**: The enhanced bifunctor from the K-flat localization.
- **derivedTensor_map**: Coherent tensor of maps, with identity and composition.
- **derivedTensor_unit**: O[0] is the tensor unit; associativity and the Koszul symmetry are coherent.
- **derivedTensor_ordinary**: Passing to hD∞ gives the ordinary K-flat-derived tensor.
- **derivedTensor_colimits**: Each tensor variable preserves small colimits.

Unit tests:

- **derivedTensor_unit_test**: O[0]⊗ᴸK≃K.
- **derivedTensor_Zmodp**: Over ℤ, (ℤ/p)⊗ᴸ(ℤ/p) has ℤ/p in degrees −1 and 0, and no other cohomology.
- **derivedTensor_flat**: For a flat sheaf F in degree zero, F⊗ᴸK is represented by the ordinary tensor F⊗K.
- **derivedTensor_sign**: Interchanging two degree-one homogeneous elements introduces the sign −1.

Uses: `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`: completion is applied to this tensor; `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`: ringed pullback includes this scalar extension.

Direct inputs: `EnhancedDerivedSheaves:E1/k-flat-complexes`, `EnhancedDerivedSheaves:E1/k-flat-replacement`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/derived-presentability`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:HomologicalComplex.monoidalCategory`.

Source: [The Stacks Project, Cohomology on Sites](https://stacks.math.columbia.edu/download/sites-cohomology.pdf), Cohomology on Sites, Lemmas 21.17.5 and 21.17.12 (07A2, 06YT), Definition 21.17.13 (06YU), PDF pp. 29–31.

Source: [Enhanced six operations and base change theorem for higher Artin stacks](https://arxiv.org/abs/1211.5948), §3.1–§3.2, Proposition 3.1.3 and Lemma 3.2.2, pp. 84–87.

### Derived internal Hom

For K,L∈D∞(O), construct RHom_O(K,L) as the right adjoint in L to −⊗ᴸK, or by a compared K-injective internal Hom model. There is a natural mapping-space adjunction Map(M⊗ᴸK,L)≃Map(M,RHom(K,L)). Global sections give the derived Hom complex used by the mapping-space computation. Restriction to a slice preserves internal Hom.

Construction or proof: Construct the internal Hom using a K-injective replacement of the second argument and compare after a K-flat replacement of the first. The ordinary tensor/Hom adjunction descends to natural equivalences on all derived mapping spaces. The K-injective Hom lifting argument gives the representing comparison and coherent functoriality; the presentable Yoneda argument is a second proof, not an assumed adjoint field. Use slice-free test generators to prove restriction compatibility.

Required API:

- **derivedInternalHom**: The contravariant/covariant enhanced internal Hom.
- **derivedInternalHom_mapEquiv**: The natural tensor/Hom mapping-space adjunction.
- **derivedInternalHom_unit**: RHom(O,L)≃L.
- **derivedInternalHom_ordinary**: Its ordinary shadow is the K-injective-derived sheaf Hom.

Unit tests:

- **derivedHom_zero**: RHom(0,L)≃0 and RHom(K,0)≃0.
- **derivedHom_unit**: RHom(O,L)≃L.
- **derivedHom_Zmodp**: Over ℤ, RHom(ℤ/p,ℤ) has ℤ/p in degree 1 and zero in all other degrees.

Uses: `EnhancedDerivedSheaves:E4/complete-internal-hom`: completeness in the second variable is proved using the adjunction.

Direct inputs: `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Proposition 5.5.2.2 and Corollary 5.5.2.9, PDF pp. 481–484 (alternative Yoneda proof).

Source: [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4), Lemma 17.8, p. 100.

### Enhanced ringed pullback and pushforward

For a morphism of ringed topoi f:(Y,S)→(X,R), with ring map f^(−1)R→S, define Lf* K=S⊗ᴸ_{f^(−1)R}f^(−1)K and Rf* by K-injective right derivation of f*. They form an enhanced adjunction. When S=f^(−1)R, Lf* agrees with the exact inverse-image functor. Composition of ringed morphisms gives coherent composition equivalences.

Construction or proof: Use exact inverse image of sheaves and the K-flat scalar extension. Inverse image preserves flat sheaves and K-flat models. Its right adjoint sends K-injectives to K-injectives, by Hom adjunction. Transfer both functors and the derived mapping-space adjunction through localization, retaining coherent ringed composition.

Required API:

- **enhancedPullback**: The functor Lf*.
- **enhancedPushforward**: The functor Rf*.
- **enhancedPullPush_mapEquiv**: Map_Y(Lf*K,L)≃Map_X(K,Rf*L).
- **enhancedPullback_comp**: The ringed composition equivalence with associativity coherence.
- **enhancedPullback_constant**: At identical inverse-image coefficients it agrees with exact sheaf inverse image.

Unit tests:

- **pullPush_identity**: Both functors for the identity ringed morphism are identity.
- **pullPush_point**: For a point topos and ℤ→ℤ/p, pullback is derived scalar extension; pushforward is restriction of scalars.
- **pullback_not_underived**: Pulling back (ℤ/p)[0] along ℤ→ℤ/p produces cohomology in degrees −1 and 0, so ordinary scalar extension is insufficient.

Uses: `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`: coherent pullback diagrams are assembled from these functors.

Direct inputs: `EnhancedDerivedSheaves:E1/k-flat-replacement`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E0/coherent-functors`, `DiamondsAndVStacks:D0`.

Source: [The Stacks Project, Cohomology on Sites](https://stacks.math.columbia.edu/download/sites-cohomology.pdf), Cohomology on Sites, Lemmas 21.18.1–3 (0G7E, 06YY, 0D6D), PDF pp. 33–34; Lemmas 21.19.1–2 (07A6, 0D6E), PDF p. 37; Lemma 21.20.2 (0D6F), PDF pp. 40–41.

Source: [Enhanced six operations and base change theorem for higher Artin stacks](https://arxiv.org/abs/1211.5948), §3.2, construction preceding Lemma 3.2.2, pp. 85–87.

### Coefficient change and the perfect action

For a map of commutative coefficient sheaves R→S, enhanced extension of scalars −⊗ᴸ_R S is left adjoint to restriction of scalars, with coherent identities and compositions. The D∞(R)-action on its module categories restricts to Perf(R), the thick idempotent-complete subcategory generated by R. For a coherently R-linear exact functor, compatibility with the Perf(R)-action is proved by finite sums, cones, shifts and retracts.

Construction or proof: Apply the ringed adjunction to the identity underlying topos. Prove coefficient associativity on K-flat models. Define the perfect subcategory by finite cell constructions and retract closure; use exact R-linearity to extend the comparison from R to every perfect complex.

Required API:

- **enhancedCoeffChange**: Derived scalar extension with its restriction right adjoint.
- **enhancedCoeffChange_comp**: (K⊗ᴸ_R S)⊗ᴸ_S T≃K⊗ᴸ_R T coherently.
- **enhancedCoeffChange_ordinary**: Restriction agrees with pinned SheafOfModules.restrictScalars on degree-zero objects.
- **perfectAction_exactFunctor**: A coherent R-linear exact functor commutes with tensor by perfect R-complexes.

Unit tests:

- **coeffChange_identity**: Changing coefficients along R→R is the identity.
- **coeffChange_finite_free**: Changing R^r[0] to S gives S^r[0].
- **perfectAction_shift**: Tensor by R[1] agrees with suspension, and an exact R-linear functor commutes with it.

Uses: `EnhancedDerivedSheaves:E4/perfect-coefficient-change`: all quotient powers are handled by their proved perfection, not a claim that each ideal power is regular.

Direct inputs: `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E0/stable-categories`, `mathlib:SheafOfModules.restrictScalars`.

Source: [Enhanced six operations and base change theorem for higher Artin stacks](https://arxiv.org/abs/1211.5948), Lemma 3.2.8, pp. 87–88.

### Frobenius-root ideals

Let R be a perfect F_p-algebra and f∈R. Define J_f=√(f)=⋃_n(f^(1/p^n)). The module map from the sequential colimit of copies of R, whose n→n+1 map is multiplication by f^(1/p^n−1/p^(n+1)), to J_f sends a at stage n to f^(1/p^n)a and is an isomorphism. In particular J_f is flat and idempotent, even when R has zero divisors.

Construction or proof: Perfectness supplies unique roots. The stage maps have the same image element after transition. If f^(1/p^n)a=0, taking a pth root and using reducedness shows that a is killed at some larger index. This proves injectivity as well as surjectivity; filtered colimits of free modules give flatness.

Required API:

- **frobeniusRootIdeal**: The union of the root-generated ideals.
- **frobeniusRootIdeal_radical**: J_f equals √(f).
- **frobeniusRootIdeal_colimit**: The stated colimit of free R-modules identifies with J_f.
- **frobeniusRootIdeal_flat**: J_f is flat and J_f²=J_f.

Unit tests:

- **rootIdeal_zero**: J_0=0 in a perfect ring.
- **rootIdeal_unit**: J_1=R.
- **rootIdeal_nonprincipal**: In F_p[t^(1/p∞)], t^(1/p)∈J_t but t^(1/p)∉(t).

Uses: `EnhancedDerivedSheaves:E1/perfect-ring-tor`: the flat root ideals resolve radical quotient steps.

Direct inputs: `mathlib:CategoryTheory.Limits.HasFilteredColimits`, `mathlib:PerfectRing`, `mathlib:frobeniusEquiv`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Proof of Lemma 3.16, p. 14.

### Tor independence of perfect algebras

For perfect F_p-algebras B←A→C, Tor_i^A(B,C)=0 for every i>0; equivalently the derived tensor of their degree-zero underlying modules is concentrated in degree zero and equals B⊗_A C. This requires all three rings to be perfect, not arbitrary modules over a perfect base.

Construction or proof: Factor A→B into a perfect polynomial extension and a radical quotient. Perfect polynomial extension is a filtered colimit of free polynomial extensions, hence flat. Reduce the radical ideal by filtered colimits to finitely many root generators and then to one generator. Tensor its flat root-ideal resolution; the tensor ideal identifies with the corresponding root ideal of C, and injects into C.

Direct inputs: `EnhancedDerivedSheaves:E1/frobenius-root-ideal`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `mathlib:CategoryTheory.Tor`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Lemma 3.16, p. 14; Lemma 11.10, p. 42.

Acceptance: The result includes perfect quotient rings that are not flat as A-modules. For arbitrary modules over (k[x,y]/xy)^perf, Tor₂ can be nonzero. The ordinary tensor is still a perfect ring, whereas the statement only identifies its underlying derived module here.

### Finite Tor dimension for perfect presentations

If R is perfect and S is the perfection of R[X₁,…,X_n]/(f₁,…,f_m), then the underlying R-module S has Tor dimension at most m. In particular every perfectly finitely presented map of perfect rings has finite Tor dimension. Also R/√(f₁,…,f_m) has Tor dimension at most m over R.

Construction or proof: Perfect polynomial extensions are flat. A root-principal quotient has a flat resolution of length one. Successively kill the m root generators and compose the Tor-amplitude bounds.

Direct inputs: `EnhancedDerivedSheaves:E1/frobenius-root-ideal`, `EnhancedDerivedSheaves:E1/perfect-ring-tor`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Remark 3.17, p. 14; Proposition 11.29, pp. 47–48.

Acceptance: m=0 gives a flat perfect polynomial extension. The bound is the number of defining equations, not a claim that every perfect finite-presentation map is flat.

### Finite global dimension after perfection

Let k=k₀^perf with k₀ a regular Noetherian F_p-algebra of finite Krull dimension, and let R be perfectly finitely presented over k. Choose a surjection P=P₀^perf→R with P₀ regular Noetherian of dimension d. Every R-module has projective dimension at most d+1. The dimension d belongs to the chosen regular presentation; it is not dim R.

Construction or proof: Regularity makes the Frobenius steps P_n→P flat, by the classical forward Kunz theorem. For a P-module M put F_n=M|P_n⊗_{P_n}P; each has projective dimension ≤d and colim F_n=M. The sequential direct-sum telescope gives pd_P(M)≤d+1. The homological epimorphism P→R from perfect Tor independence gives M≃M⊗ᴸ_P R and transports a projective resolution to R.

Direct inputs: `EnhancedDerivedSheaves:E1/perfect-ring-tor`, `EnhancedDerivedSheaves:E1/perfect-finite-tor-dimension`, `EnhancedDerivedSheaves:E1/derived-presentability`, `mathlib:CategoryTheory.HasProjectiveDimensionLE`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Proposition 11.31 and Remark 11.32, p. 48.

Acceptance: For a perfect field and R=k the result gives a finite bound and the sharper actual global dimension is zero. The proof requires an ordinary regular presentation and its finite dimension.

### Intrinsic dimension bounds and their correction

Under the preceding finite-dimensional perfect-presentation hypotheses, every R-module has Tor dimension at most 2dim R. The announced global-dimension refinement is at most 2dim R+1; its proof is an explicit separate gap. The stronger Tor bound dim R is false: for R=(k[x,y]/xy)^perf with k perfect, Tor₂^R(R/(x),R/(y))≠0 although dim R=1.

Construction or proof: Reduce to perfections of complete Noetherian local rings and use a regular Noether normalization P₀→R₀. Away from a nonzero f this is finite étale; tensoring with the flat idempotent root ideal I_f turns modules into retracts of complexes induced from P. Set J=I_fR and use the exact sequences with Tor₁^R(R/J,M), J⊗M, JM and M/JM; induction drops the quotient dimension and gives the 2dim R bound. This proof needs the precise localization/retraction bridge recorded in gaps. For the counterexample, Ann(x) is the ideal of positive y-root monomials. The class of y is nonzero in Ann(x)/yAnn(x) and maps to zero in R/(y), providing the Tor₂ witness. Do not infer the unproved intrinsic global bound from the presentation bound.

Direct inputs: `EnhancedDerivedSheaves:E1/perfect-finite-global-dimension`, `EnhancedDerivedSheaves:E1/frobenius-root-ideal`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Remark 11.33 and footnotes 24–25, p. 49.

Acceptance: The modules in the Tor₂ example are ordinary nonperfect quotient modules. The printed correction and its announced unproved global refinement are distinguishable.

### The converse Kunz criterion via perfection

For a Noetherian F_p-algebra R, flatness of absolute Frobenius implies that R is regular. The classical regular⇒Frobenius-flat theorem is an input to the finite-global-dimension proof, so this converse cannot be used to establish that input.

Construction or proof: Pass to complete local rings, verifying preservation of Frobenius flatness under completion. Choose a Cohen regular presentation of the complete local ring. Flat Frobenius gives faithful flatness of R→R^perf. Apply finite global dimension to the perfection and descend finite Tor dimension, then apply the ordinary homological regularity criterion.

Direct inputs: `EnhancedDerivedSheaves:E1/perfect-finite-global-dimension`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Corollary 11.35, pp. 49–50.

Acceptance: For F_p[t] the Frobenius module is free of rank p. For F_p[ε]/ε² Frobenius is not flat.

### Bounded saturated valuation modules

Let K be a complete nonarchimedean field, V its valuation ring, m its maximal ideal, and M⊂K^r a V-submodule. Boundedness is Mathlib Bornology.IsBounded on the underlying subset of the finite normed power; equivalently its coordinate norms have a common real bound. It is m-saturated when the multiplication map M→Hom_V(m,M), sending x to (a↦ax), is an isomorphism. The finite-freeness theorem additionally requires spherical completeness and full nonzero real value group.

Construction or proof: Use the existing normed-field and valuation-ring notions, the ordinary submodule carrier, and the linear multiplication comparison. Transport through V-linear ambient isomorphisms which preserve bounded sets.

Required API:

- **valuationModule_isBounded_iff**: Mathlib boundedness of M⊂K^r is equivalent to one common upper bound on its coordinate norms; reuse Bornology.IsBounded rather than a private bound predicate.
- **valuationSaturationMap**: The canonical linear map M→Hom_V(m,M).
- **IsValuationSaturated**: Bijectivity of that multiplication map.
- **valuationSaturation_transport**: Boundedness and saturation transport under a V-linear ambient isomorphism.

Unit tests:

- **valuationModule_zero**: The zero submodule is bounded and saturated.
- **valuationModule_closed_ball**: For full real value group, a nonzero closed ball of finite radius in K is principal and saturated.
- **valuationModule_open_ball**: A nonzero open ball of finite radius fails saturation: its Hom from m is the corresponding closed ball.

Uses: `EnhancedDerivedSheaves:E1/valuation-saturated-finite-free`: makes the exact additional hypotheses of the valuation lemma reusable.

Direct inputs: `mathlib:CategoryTheory.Abelian`, `mathlib:Bornology.IsBounded`, `mathlib:isBounded_iff_forall_norm_le'`, `mathlib:ValuationSubring`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Lemma 6.14, pp. 25–26.

### Finite freeness of saturated lattices

If K is spherically complete with full nonzero real value group and M⊂K^r is bounded and m-saturated, then M is a finite free V-module of rank at most r.

Construction or proof: For r=1, bounded submodules are open or closed balls. Saturation excludes the open ball, and the value-group condition makes the remaining ball principal. For general r, intersect with K^(r−1). Spherical completeness gives Ext¹_V(m,V)=0 and therefore saturation of the one-dimensional quotient. The finite free quotient splits the extension.

Direct inputs: `EnhancedDerivedSheaves:E1/bounded-saturated-valuation-modules`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Lemma 6.14, pp. 25–26.

Acceptance: Rank zero gives the zero module. Omitting saturation allows a nonprincipal open ball. Neither spherical completeness nor the full value-group hypothesis is discarded.

### Quasicoherent derived sheaves

For an ordinary qcqs scheme X define Dqc(X) as the full subcategory of D∞(O_X) on complexes with quasicoherent cohomology in every integer degree. Perf(X) is its full subcategory of objects locally represented by bounded complexes of finite projective modules. For X=Spec R the usual affine sheafification/global-sections comparison identifies Dqc(X) with D∞(R), including unbounded complexes.

Construction or proof: Use the ordinary scheme/module sheaf definition of quasicoherence. Define the full enhanced subcategory and verify that the affine unbounded derived equivalence extends the module equivalence, using affine acyclicity and truncation convergence. Ordinary affine geometry inputs are specified as a required interface where the current baseline lacks the required API.

Required API:

- **QuasicoherentDerived**: The full enhanced subcategory with quasicoherent cohomology.
- **quasicoherentDerived_affine**: Dqc(Spec R)≃D∞(R).
- **quasicoherentDerived_restrict**: Restriction to opens preserves the subcategory.
- **PerfectDerived**: Local bounded finite-projective representability.

Unit tests:

- **dqc_affine_unit**: O_SpecR corresponds to R[0].
- **dqc_zero**: The zero complex is quasicoherent and perfect.
- **dqc_not_all_perfect**: On Spec ℤ, ⊕_{n∈ℕ}ℤ[0] is quasicoherent but is not perfect.

Uses: `EnhancedDerivedSheaves:E1/perfect-scheme-base-change`: the unrestricted base-change statement is in this ordinary quasicoherent subcategory; `EnhancedDerivedSheaves:E2/perfect-h-hyperdescent`: h-hyperdescent takes values in this enhancement.

Direct inputs: `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Discussion following Lemma 3.18, p. 15; §11.1, pp. 40–41.

### Derived base change on perfect schemes

For a cartesian square X′→X over Y′→Y of perfect qcqs F_p-schemes, Lg*Rf*K→Rf′*Lg′*K is an equivalence for every K∈Dqc(X), without a flatness assumption on g or a boundedness assumption on K.

Construction or proof: For X=Spec A, Y=Spec B, Y′=Spec B′, the required identity is A⊗ᴸ_B B′≃A′. Derive it from perfect-ring Tor independence. Cover the qcqs schemes by finitely many affines and use Čech descent and the finite cohomological bounds to transport the identity to unbounded quasicoherent complexes.

Direct inputs: `EnhancedDerivedSheaves:E1/quasicoherent-derived-sheaves`, `EnhancedDerivedSheaves:E1/perfect-ring-tor`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Lemma 3.18, pp. 14–15.

Acceptance: The ring identity has base B: reversing the A and B factors would be ill-typed. The analogous ordinary square over ℤ with both sides ℤ/p is not Tor independent.

### The cohomology base-change map

For a commutative ring map A→B and K∈D≥0(A), the canonical map H⁰(K)[0]→K induces H⁰(K)⊗_A B→H⁰(K⊗ᴸ_A B). It is functorial in K and in B, and compatible with successive scalar extensions. Flat B makes it an isomorphism; without flatness it can fail.

Construction or proof: Identify H⁰(K)[0] with τ≤0K using K∈D≥0. Tensor the canonical truncation map and apply H⁰. Identify H⁰ of the degree-zero module tensor with the ordinary tensor. Naturality gives identity/composition; flatness follows from exact tensor.

Required API:

- **cohomologyBaseChange**: The natural degree-zero comparison.
- **cohomologyBaseChange_comp**: Successive scalar changes give the same comparison as their composite.
- **cohomologyBaseChange_flat**: It is an isomorphism for flat B.

Unit tests:

- **cohomBaseChange_identity**: For A→A the comparison is identity.
- **cohomBaseChange_module**: For K=M[0], the degree-zero comparison is the usual isomorphism M⊗B≅H⁰(M⊗ᴸB).
- **cohomBaseChange_nonflat**: For A=ℤ, B=ℤ/p and K=(ℤ/p)[−1] with H¹=ℤ/p, its source is zero and its target H⁰ is ℤ/p.

Uses: `EnhancedDerivedSheaves:E1/splitting-through-comparison`: splitting obstructions are transported by this specified map.

Direct inputs: `EnhancedDerivedSheaves:E1/coefficient-change-and-perfect-action`, `mathlib:CategoryTheory.Triangulated.TStructure.eTruncGE`.

Source: [On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882), Lemma 5.3 and proof of Theorem 5.4, pp. 9–10.

### Splitting obstructions in a distinguished triangle

For a distinguished triangle A→B→Q --δ→ A[1] in the chosen derived category, a map s:M→Q lifts to M→B if and only if δ∘s=0. In particular B→Q has a right inverse if and only if δ=0. An exact comparison functor carries this obstruction to the corresponding obstruction in the comparison triangle; vanishing after comparison implies vanishing before comparison only when the induced map on the relevant Hom group is injective.

Construction or proof: Apply Hom(M,−) to the triangle and use exactness at Hom(M,Q). Specialize to s=id_Q. Transport the triangle by an exact functor and use its Hom comparison, keeping the injectivity condition explicit.

Direct inputs: `EnhancedDerivedSheaves:E1/cohomology-base-change-map`, `EnhancedDerivedSheaves:E0/stable-api-and-the-sign-comparison`, `mathlib:CategoryTheory.Pretriangulated`.

Source: [On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882), Proof of Theorem 5.4, pp. 9–10.

Acceptance: For the split triangle A→A⊕Q→Q the connecting map is zero. For 0→ℤ --p→ℤ→ℤ/p→0 the associated triangle does not split for p prime. A nonconservative comparison functor cannot by itself certify an original splitting.

## E2 — Repleteness, inverse limits, Postnikov convergence and descent

A topos is replete when an epimorphic inverse sequence has epimorphic limit projections. This is sequential repleteness. Sets satisfy it by countable choice, and presheaf categories satisfy it pointwise. It does not assert exactness of all cofiltered limits: finite injections of subsets of an uncountable set into ℤ form a surjective cofiltered system without a global compatible injection. The distinction is essential to the countable product and inverse-limit arguments.

A coherent tower is a functor from the nerve of the inverse integers to the enhancement. Its homotopy inverse limit is the fibre of 1−shift on the derived product. Exact countable products give the Milnor sequence in each integer degree. Pro-zero means that every fixed target stage is killed by a sufficiently late transition. It is stronger than vanishing ordinary inverse limit: repeated multiplication by p on ℤ has lim=0 and lim¹=ℤ_p/ℤ. Degreewise pro-zero error towers give derived-limit invariance under the exact-product hypotheses. Tensoring a varying unbounded coefficient tower requires the separate uniform finite-amplitude argument.

Postnikov completion consists of coherent towers K_n in degrees ≥−n with τ≥−n K_{n+1} equivalent to K_n. The truncation functor and its derived-limit adjoint are constructed before asserting that they are inverse. Repleteness supplies the unit and counit arguments, with eventual constancy checked separately for every integer degree. A second route uses local finite cohomological dimension or a uniform bound for the negative cohomology sheaves of a fixed complex. The latter proves convergence of that complex; a category-wide conclusion quantifies over all complexes.

Weakly contractible objects split every epimorphism onto them. Coherent weakly contractible covers give exact sections and compact detecting objects under the stated coherent-site hypotheses. Space-valued sheaves are covering-local presheaves of Kan spaces. Hypercompletion and effective Postnikov completion remain separate notions; local finite homotopy dimension supplies convergent towers. The corresponding space-level convergence statement requires its own higher-sheaf interfaces.

A hypercover includes all augmented matching maps, with degree one compared to the existing OneHypercover. Bounded-below Cartesian descent holds without repleteness. The unbounded augmentation unit also holds without repleteness; Cartesian effectivity in the asserted unbounded theorem uses repleteness. Refinement independence follows by comparing both augmentations with the original enhanced category. Finite-dimension hypotheses and repleteness are two distinct convergence routes.

For perfect schemes, keep h-Čech descent of unbounded Dqc, h-hyperdescent of Perf, boundedness detection and unbounded h-hyperdescent as distinct targets. The final unbounded hyperdescent theorem is over the perfection of a regular Noetherian F_p-base of finite dimension, with perfectly finitely presented schemes. Its tensor/totalization step applies to a cosimplicial family of ordinary degree-zero modules with bounded totalization and a finite global-dimension bound; it is not unrestricted tensor preservation of totalizations.


### Replete topoi

For a topos X, repleteness means: for every inverse sequence F with epimorphic successor transitions, every projection lim F→F_n is epimorphic. Use the ordinary category of sheaves and categorical limits; this definition requires neither derived categories nor an enhancement.

Hypotheses and conventions: A fixed Grothendieck topos with countable limits. The analogous categorical property can be stated for any category with sequential limits. No repleteness assumption is made about arbitrary geometric sites.

Construction or proof: Define the property using all limit cones of inverse sequences, avoiding dependence on chosen limit objects.

Required API:

- **IsReplete**: Every limit-cone projection of an epimorphic inverse sequence is epimorphic.
- **IsReplete.projection**: Apply repleteness at any index n of an inverse sequence.
- **IsReplete.of_equivalence**: An equivalence of categories transports the sequential epimorphism property.
- **IsReplete.types**: The category of sets is replete, using countable choice.

Unit tests:

- **replete_sets**: Set is replete: extend a chosen element recursively along surjective transitions.
- **replete_presheaves**: Presheaves of sets on any small category are replete, since limits and epimorphisms are pointwise.
- **replete_not_all_cofiltered**: For an uncountable set T, the system of injections S→ℤ indexed by finite subsets S⊆T has surjective restrictions but empty limit; replacing sequential by all cofiltered limits would reject Set.

Uses: `EnhancedDerivedSheaves:E2/countable-products-and-inverse-limits`: Countable products of epimorphisms; `EnhancedDerivedSheaves:E2/left-completion`: Postnikov reconstruction; `DiamondEtaleCohomology:C0`: Consumer must prove its site satisfies the abstract hypothesis.

Direct inputs: `mathlib:CategoryTheory.Sheaf`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Limits.HasLimits`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Definition 3.1.1, p. 16.

### Countable products in a replete topos

In a replete topos, the product of a countable family of epimorphisms is an epimorphism. Consequently countable products of abelian sheaves are exact.

Construction or proof: Apply inverse-limit-relative-epis to finite partial products of the given arrows. Finite products are exact in a topos; the relative lifting hypotheses follow. Products preserve kernels, so preservation of epimorphisms proves exactness for abelian sheaves.

Direct inputs: `EnhancedDerivedSheaves:E2/inverse-limit-relative-epis`, `mathlib:CategoryTheory.CountableAB4Star`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.1.9, p. 17.

Acceptance: For Set this is the usual countable product of surjections. Do not infer exactness of arbitrary uncountable products from this argument.

### Left completeness for replete topoi

If X is a replete topos, Ψ:D(X)→D̂(X) is an equivalence with inverse Rlim.

Construction or proof: The adjunction unit is invertible by replete-postnikov-unit. The counit is termwise invertible by replete-postnikov-counit; evaluations detect equivalences of coherent systems.

Direct inputs: `EnhancedDerivedSheaves:E2/completion-adjunction`, `EnhancedDerivedSheaves:E2/replete-postnikov-unit`, `EnhancedDerivedSheaves:E2/replete-postnikov-counit`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.3.3, p. 19.

Acceptance: The theorem specializes to D(Ab) because Set is replete. Repleteness alone is not asserted to give convergence of Postnikov towers of spaces; BS 3.1.12 asks that as a separate question.

### Local weak contractibility implies repleteness

A locally weakly contractible topos is replete.

Construction or proof: Test each limit projection on weakly contractible objects; sections commute with limits. An epi gives a surjection on such sections, so inverse-sequence lifting in Set proves the result.

Direct inputs: `EnhancedDerivedSheaves:E2/locally-weakly-contractible`, `EnhancedDerivedSheaves:E2/replete-topoi`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.2.3(1), p. 18.

Acceptance: Recover repleteness of Set. This argument does not prove the converse.

### Cartesian derived systems on a hypercover

For a hypercover f:U_•→1 in X, form the enhanced derived category of its simplicial topos and its full subcategory D_cart(U_•). A complex K is Cartesian when every simplicial transition α:[n]→[m] induces an equivalence α* K_n→K_m. Pullback f* sends K∈D(X) to its restrictions on X/U_n.

Construction or proof: Construct the derived diagram of the slice topoi with the compatible pullbacks. Take the full subcategory defined by the transition equivalences. Slice pullbacks are exact and preserve limits/colimits via their two adjoints; establish this interface before proving descent.

Required API:

- **cartesianDerivedSystem**: The full subcategory defined by the transition equivalences.
- **cartesianDerivedSystem_transition**: Each transition map after pullback is an equivalence.
- **hypercoverPullback**: The coherent family K|U_n attached to K.
- **cartesianDerivedSystem_truncate**: Good truncation preserves the Cartesian condition because slice pullbacks are exact.

Unit tests:

- **cartesian_identity_hypercover**: For the identity hypercover, the Cartesian category identifies with D(X).
- **cartesian_pullback**: The family of restrictions of a single complex is Cartesian.
- **cartesian_bad_transition**: On the identity hypercover of Set, the cosimplicial diagram [n]↦ℤ[Hom_Δ([0],[n])] in degree zero is not Cartesian: a coface gives ℤ→ℤ², not an isomorphism.

Uses: `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`: Bounded-below comparison; `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`: Unbounded comparison for replete X.

Direct inputs: `EnhancedDerivedSheaves:E2/hypercover`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.3.6, p. 20, notation before proof.

### Slices of replete topoi

If X is replete and U is an object of X, the slice topos X/U is replete.

Construction or proof: Forget a sequence in X/U to X. Its limit in the slice has the same underlying object because the indexing category is connected. Epimorphisms are detected in X.

Direct inputs: `EnhancedDerivedSheaves:E2/replete-topoi`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.1.2, p. 16.

Acceptance: The slice at the terminal object recovers X.

### Repleteness detected on a cover

If U→1 is an epimorphism in a topos X and X/U is replete, then X is replete.

Construction or proof: Base change the tower to U; pullback commutes with the relevant limits. Its projections are epimorphic in X/U. An arrow in X is epimorphic if its pullback along U→1 is.

Direct inputs: `EnhancedDerivedSheaves:E2/replete-topoi`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.1.3, p. 16.

Acceptance: Together with replete-slice this gives the source iff statement.

### Epimorphisms of inverse limits

In a replete topos, a map F→G of inverse sequences induces an epimorphism lim F→lim G if F_i→G_i and F_{i+1}→F_i×_{G_i}G_{i+1} are epimorphisms for every i.

Construction or proof: For V→lim G start with V₀=V×_{G₀}F₀. Set V_{n+1}=V_n×_{F_n×_{G_n}G_{n+1}}F_{n+1}; the maps V_{n+1}→V_n are epimorphisms. Repleteness gives an epimorphism lim V_n→V carrying a compatible lift to lim F.

Direct inputs: `EnhancedDerivedSheaves:E2/replete-topoi`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.1.8, p. 17.

Acceptance: If every F_i=G_i the limit map is identity. Levelwise epimorphisms alone are not the stated hypothesis.

### Derived limit of an epimorphic system

For an inverse sequence F of abelian sheaves on a replete topos with epimorphic transitions, the canonical lim F→Rlim F is an equivalence (F is placed in degree zero).

Construction or proof: Exact countable products identify derived products with ordinary products. In the Rlim fibre triangle, show t−1 on the product is epimorphic using the relative-lifting lemma on finite difference maps. Its kernel is lim F; the triangle therefore has no higher cohomology.

Direct inputs: `EnhancedDerivedSheaves:E2/countable-products-and-inverse-limits`, `EnhancedDerivedSheaves:E2/inverse-limit-relative-epis`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.1.10, p. 17.

Acceptance: Surjectivity of transitions is essential; no claim for every inverse system.

### Cohomological amplitude of sequential limits

For any inverse sequence F of abelian sheaves on a replete topos, Rlim F has cohomology only in degrees 0 and 1.

Construction or proof: Use the fibre of t−1 between the two ordinary products, justified by exact products. The long exact cohomology sequence gives vanishing outside [0,1].

Direct inputs: `EnhancedDerivedSheaves:E2/countable-products-and-inverse-limits`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.1.11, p. 17.

Acceptance: An epimorphic-transition system specializes to the preceding theorem with degree-one cohomology zero.

### Postnikov left completion

Let D(X) be the enhanced derived category of abelian sheaves. Its left completion is the full subcategory of the coherent derived category of inverse systems whose terms satisfy K_n∈D≥−n and whose transition induces τ≥−n K_{n+1}≃K_n. Define Ψ(K)_n=τ≥−n K. This construction is defined without assuming Ψ is an equivalence.

Construction or proof: Use the existing ordinary truncation functors as comparison targets for the enhanced truncation tower. Form the full subcategory cut out by the two conditions and the coherent truncation functor Ψ. The diagram/enhancement comparison requires the E1/E0 comparison.

Required API:

- **postnikovCompletion**: Full subcategory of compatible connective towers.
- **postnikovCompletion_eval**: Evaluation at n lands in D≥−n.
- **postnikovFunctor**: Ψ sends K to its tower τ≥−n K.
- **postnikovFunctor_eval**: Evaluation of Ψ(K) at n is τ≥−n K, including its canonical transition.

Unit tests:

- **postnikov_zero**: Ψ(0) is the zero tower.
- **postnikov_heart**: For an abelian sheaf A in degree zero, Ψ(A) is constant at A.
- **postnikov_negative_shift**: For A[1] with A≠0 in the heart, Ψ(A[1])₀=0 and Ψ(A[1])_n=A[1] for n≥1; the constant A[1] tower fails the n=0 connectivity condition.

Uses: `EnhancedDerivedSheaves:E2/completion-adjunction`: Domain of the derived-limit right adjoint; `EnhancedDerivedSheaves:E2/left-completion`: Equivalence for replete topoi; `EnhancedDerivedSheaves:E4`: Keep Postnikov completion distinct from adic completion.

Direct inputs: `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `EnhancedDerivedSheaves:E0/limits-colimits-and-slices`, `mathlib:CategoryTheory.Triangulated.TStructure.eTruncGE`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Definition 3.3.1, p. 18.

### Derived limit adjunction

The derived-limit functor from the Postnikov left completion to D(X) is right adjoint to Ψ.

Construction or proof: Compute mapping spaces of coherent derived systems using the homotopy equalizer of products. Truncation adjunction identifies the relevant mapping spaces into the connective objects L_n. Do not assert equality of untruncated derived Hom complexes in every degree. Pass to the inverse limit of mapping spaces to identify Map(ΨK,L) with Map(K,Rlim L). The diagram K-injective and coherent-limit comparison remains an explicit input.

Direct inputs: `EnhancedDerivedSheaves:E2/postnikov-left-completion`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.3.2, p. 18.

Acceptance: The unit is K→Rlim τ≥−nK. An adjunction alone does not make this unit invertible.

### Postnikov reconstruction in a replete topos

If X is replete, K→Rlim τ≥−nK is an equivalence for every K∈D(X).

Construction or proof: Choose any complex I representing K. Exact products make the product of its truncations compute the derived product. The good-truncation tower has termwise epimorphic transitions and ordinary termwise limit I. Apply the difference-map argument degreewise to identify the derived limit with I.

Direct inputs: `EnhancedDerivedSheaves:E2/completion-adjunction`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`, `EnhancedDerivedSheaves:E2/countable-products-and-inverse-limits`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.3.3, p. 19, full-faithfulness argument.

Acceptance: No boundedness hypothesis on I. This is reconstruction of one object; essential surjectivity of Ψ still needs the next lemma.

### Reconstruction of a compatible truncation tower

For X replete and a tower L in the Postnikov left completion, the canonical map τ≥−n Rlim L→L_n is an equivalence for every n≥0.

Construction or proof: For each integer m, compatibility makes H^m(L_n) constant once n≥max(0,−m). The product/difference fibre triangle and exact products give the Milnor sequence on cohomology. Both H^m and H^(m−1) towers are eventually constant, so their R¹lim terms vanish. Thus H^m(Rlim L)≅H^m(L_n) whenever m≥−n. Compare the canonical map on all cohomology groups after truncation. Do not discard a finite product prefix as an equality of products.

Direct inputs: `EnhancedDerivedSheaves:E2/postnikov-left-completion`, `EnhancedDerivedSheaves:E2/countable-products-and-inverse-limits`, `EnhancedDerivedSheaves:E2/inverse-limit-amplitude`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.3.3, p. 19, essential-surjectivity argument.

Acceptance: Test L=Ψ(A[1]) to force a negative degree. For m≥0 stabilization starts at n=0.

### Weakly contractible object

An object U of a topos X is weakly contractible if every epimorphism V→U admits a section.

Construction or proof: Use the categorical epi and section conditions in the existing sheaf category.

Required API:

- **IsWeaklyContractible**: Every epimorphism to U splits.
- **IsWeaklyContractible.section**: For an epimorphism V→U, obtain a section U→V.
- **IsWeaklyContractible.sections_exact**: For a weakly contractible U, Γ(U,−) on abelian sheaves is exact.

Unit tests:

- **weaklyContractible_singleton**: The one-point set is weakly contractible in Set.
- **weaklyContractible_sets**: Every set is weakly contractible in Set, using choice.
- **weaklyContractible_BG_nonexample**: For a nontrivial finite group G, the terminal G-set is not weakly contractible: the epimorphism from the free transitive G-set has no equivariant section.

Uses: `EnhancedDerivedSheaves:E2/locally-weakly-contractible`: Generators with exact section functors; `EnhancedDerivedSheaves:E2/locally-weakly-contractible-topoi`: Test epimorphisms on these objects.

Direct inputs: `mathlib:CategoryTheory.Sheaf`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Definition 3.2.1, p. 17.

### Locally weakly contractible topos

A topos X is locally weakly contractible if every object admits an epimorphism from a coproduct of coherent weakly contractible objects.

Construction or proof: Express the covering property in the existing topos. The coherent-object predicate and its sheaf-theoretic API are unresolved ordinary-site inputs.

Required API:

- **IsLocallyWeaklyContractible**: The stated coherent weakly contractible covering property.
- **IsLocallyWeaklyContractible.cover**: Choose an epimorphic family of coherent weakly contractible objects over a given object.
- **IsLocallyWeaklyContractible.detect_epi**: A map is epi iff sections on all weakly contractible test objects are surjective.

Unit tests:

- **locallyWeaklyContractible_sets**: Set is locally weakly contractible via singleton covers.
- **locallyWeaklyContractible_finite_BG**: For a finite group G, G-sets admit covers by free transitive G-sets, which are coherent and weakly contractible.
- **locallyWeaklyContractible_cover_terminal**: For the terminal topos Set, one singleton already covers its terminal object.

Uses: `EnhancedDerivedSheaves:E2/locally-weakly-contractible-topoi`: Supplies repleteness; `EnhancedDerivedSheaves:E2/weakly-contractible-compact-generators`: Coherence supplies compactness.

Direct inputs: `EnhancedDerivedSheaves:E2/weakly-contractible-object`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Definition 3.2.1 and Example 3.2.2, pp. 17–18.

### Compact generators from weakly contractible objects

If X is locally weakly contractible, D(X,ℤ) is compactly generated by j_!ℤ for coherent weakly contractible objects j:U→1, with one generator for each object in a small covering family.

Construction or proof: Identify maps from shifts of j_!ℤ with cohomology of sections on U. Exactness of Γ(U,−) and commutation with coproducts for coherent U make j_!ℤ compact. If all maps from shifts of these generators vanish, every cohomology sheaf vanishes on a covering family, hence the object is zero. The sheaf coproduct and size lemmas remain explicit proof inputs.

Direct inputs: `EnhancedDerivedSheaves:E2/locally-weakly-contractible`, `EnhancedDerivedSheaves:E1/derived-presentability`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.2.3(2), p. 18.

Acceptance: For Set use ℤ as generator of D(Ab).

### Postnikov convergence for sheaves of spaces

For a locally weakly contractible topos, Postnikov towers converge in its associated hypercomplete infinity-topos.

Construction or proof: Evaluate on weakly contractible objects U. The source identifies homotopy sheaves evaluated on U with homotopy groups of F(U). Use convergence for spaces and the detecting family of U. HTT 7.2.1.10 and the sheaves-of-spaces foundation are unresolved proof inputs.

Direct inputs: `EnhancedDerivedSheaves:E2/locally-weakly-contractible`, `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.2.3(3), p. 18.

Acceptance: On Set this is convergence of the usual Postnikov tower of a space. No claim that mere repleteness suffices for this statement.

### Hypercover in a topos

An augmented simplicial object U_•→1 in X is a hypercover if U₀→1 is epimorphic and U_n→(cosk_{n−1}U)_n is epimorphic for every n>0, with the coskeleton taken in augmented simplicial objects.

Construction or proof: Use augmented simplicial objects and their matching objects. Impose the matching epimorphism conditions; prove the comparison with the existing degree-one cover data.

Required API:

- **Hypercover**: Augmented simplicial object with all matching maps epimorphic.
- **Hypercover.matching_epi**: The matching map at every degree is epi.
- **Hypercover.oneHypercover**: Extract the degree-zero and degree-one data for the pinned OneHypercover after choosing representable covers on a site.

Unit tests:

- **hypercover_identity**: The constant simplicial terminal object is a hypercover.
- **hypercover_cech**: The Cech nerve of an epimorphism U→1 is a hypercover.
- **hypercover_matching_failure**: In Set, the constant simplicial two-element set augmented to 1 has surjective degree-zero map but degree-one diagonal {0,1}→{0,1}² is not surjective, so it is not a hypercover.

Uses: `EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent`: Indexing object for Cartesian derived systems.

Direct inputs: `mathlib:CategoryTheory.GrothendieckTopology.OneHypercover`, `mathlib:SSet`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.3.6 and following notation, p. 20.

### Bounded-below hypercover descent

For a hypercover in a topos, f* gives an equivalence D⁺(X)≃D⁺_cart(U_•), where the lower bound is uniform across simplicial degrees. Repleteness is not required.

Construction or proof: Prove ordinary sheaf hypercover descent and its bounded-below derived totalization comparison with a uniform lower bound. This proof must still be read and decomposed; the present node states the exact input used by BS.

Direct inputs: `EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.3.6 proof of (1) and (3), p. 20.

Acceptance: The identity hypercover gives the identity equivalence. Do not replace a uniform lower bound by a separate bound in each degree.

### Full faithfulness of unbounded hypercover pullback

For any hypercover in a topos X, the unit K→Rf_*f*K is an equivalence for every K∈D∞(X). Repleteness is not needed for this unit; it is still required for the stated unbounded Cartesian effectivity theorem.

Construction or proof: Resolve by K-injectives and compare the product-total hypercover Hom double complex. The augmented free-module hypercover complex is acyclic, so the comparison is a quasi-isomorphism in every degree; identify this with the enhanced unit by the mapping-space computation.

Direct inputs: `EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent`, `EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`.

Source: [The Stacks Project, Simplicial Spaces](https://stacks.math.columbia.edu/download/spaces-simplicial.pdf), Simplicial Spaces, Lemma 85.17.3 (0D8G) and proof, PDF pp. 39–40.

Acceptance: No uniform global cohomological-dimension bound is required in this replete case.

### Hypercover left-adjoint counit

For a hypercover in a replete topos and the adjunction f_!⊣f*, the counit f_!f*→id is an equivalence on D(X).

Construction or proof: Construct f_! using the presentable adjoint-functor theorem for this pullback. Its prerequisite proof is still open. A fully faithful right adjoint has invertible counit; apply this to f* in f_!⊣f*.

Direct inputs: `EnhancedDerivedSheaves:E2/unbounded-hypercover-unit`, `EnhancedDerivedSheaves:E2/hypercovers-and-cohomological-descent`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.3.6(2), p. 20.

Acceptance: Do not replace f_! by f_* in this counit.

### Unbounded hypercover descent

For a hypercover in a replete topos X, f* gives an equivalence D(X)≃D_cart(U_•).

Construction or proof: Full faithfulness is unbounded-hypercover-unit. Truncate a Cartesian system uniformly; exact slice pullbacks keep it Cartesian. Bounded-below descent supplies the tower on X. Reconstruct its limit; preservation of inverse limits by slice pullback and repleteness of every slice identify its image with the original system.

Direct inputs: `EnhancedDerivedSheaves:E2/unbounded-hypercover-unit`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`, `EnhancedDerivedSheaves:E2/replete-slice`, `EnhancedDerivedSheaves:E2/replete-postnikov-counit`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.3.6(3), p. 20.

Acceptance: For the identity hypercover this reduces to Postnikov reconstruction. General refinement coherence and independence must still be decomposed, not inferred from existence of one equivalence.

### Local injectivity for derived inverse limits

Let K_n be an inverse system on a ringed site, V an object and m an integer. Suppose a cofinal system of covers {V_i→V} and one N≥0 satisfy R¹lim H^(m−1)(V_i,K_n)=0 and injectivity of H^m(V_i,K_n)→H^m(V_i,K_N) for all n≥N. Then H^m(Rlim K_n)(V)→H^m(K_N)(V) is injective.

Construction or proof: Represent a cohomology-sheaf section locally by hypercohomology classes. Refine in the cofinal family until their images at stage N vanish. The Milnor exact sequence and the two hypotheses make the map from each local limit class injective into the stage-N group. All local classes vanish, so the original sheaf section vanishes.

Direct inputs: `DiamondsAndVStacks:D0`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`.

Source: [The Stacks Project, Tag 0D6L](https://stacks.math.columbia.edu/tag/0D6L), Tag 0D6L (read 2026-09-26).

Acceptance: A single chosen cover without cofinal refinements does not discharge the hypothesis.

### Uniform stabilization of truncation cohomology

On a ringed site let E∈D(O). For an object V suppose a cofinal family Cov_V of covers and an integer-valued b_V(t) satisfy H^p(V_i,H^(t−p)(E))=0 for p>b_V(t), every t and every member of every cover in Cov_V. Fix m. Set N=max(0,1+max(−m,b_V(m−1)−m,b_V(m)−m−1,b_V(m+1)−m−2)). For n≥N the transitions of K_n=τ≥−nE induce isomorphisms on H^(m−1)(V_i,−) and H^m(V_i,−), uniformly in the covering members.

Construction or proof: Use the triangle H^(−n−1)(E)[n+1]→K_{n+1}→K_n→H^(−n−1)(E)[n+2]. The obstructing groups have cohomological degrees m+n, m+n+1, m+n+2; their corresponding total degrees are m−1,m,m+1. The stated strict inequalities kill all three groups. The long exact sequence gives the two adjacent-degree isomorphisms.

Direct inputs: `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `DiamondsAndVStacks:D0`, `mathlib:CategoryTheory.Triangulated.TStructure.eTruncGE`.

Source: [The Stacks Project, Tag 0D6M](https://stacks.math.columbia.edu/tag/0D6M), Tag 0D6M (read 2026-09-26).

Acceptance: For b_V(t)=0 and m=0 the displayed sufficient bound is N=1. Controlling only total degree m misses the two adjacent groups.

### Postnikov convergence from diagonal cohomology bounds

Let B cover a ringed site and E∈D(O). If each V∈B has a cofinal family Cov_V and bounds b_V(t) as in postnikov-uniform-window, then E→Rlim τ≥−nE is an equivalence.

Construction or proof: Fix m and V. Stabilization in degrees m−1,m gives the two local-injectivity hypotheses, with eventually constant towers having R¹lim zero. E→K_N induces an isomorphism on H^m for N≥−m. Since H^m(Rlim K_n)(V)→H^m(K_N)(V) is injective, the composite proves H^m(E)(V)→H^m(Rlim K_n)(V) bijective. The family B covers every object, so the maps of cohomology sheaves are isomorphisms; apply cohomology detection.

Direct inputs: `EnhancedDerivedSheaves:E2/postnikov-uniform-window`, `EnhancedDerivedSheaves:E2/postnikov-local-injectivity`, `mathlib:DerivedCategory.isIso_iff`, `DiamondsAndVStacks:D0`.

Source: [The Stacks Project, Tag 0D6M](https://stacks.math.columbia.edu/tag/0D6M), Tag 0D6M (read 2026-09-26).

Acceptance: No exactness of products of arbitrary sheaves is assumed.

### Postnikov convergence from local dimension bounds

Let E∈D(O) on a ringed site with covering family B. Suppose for every V∈B there are d_V≥0 and a cofinal family Cov_V with H^p(V_i,H^q(E))=0 whenever p>d_V and q<0. Then E→Rlim τ≥−nE is an equivalence.

Construction or proof: Set b_V(t)=d_V+max(0,t). If p>b_V(t), then p>d_V and t−p<0, so the diagonal vanishing hypothesis holds. Apply postnikov-diagonal-bound.

Direct inputs: `EnhancedDerivedSheaves:E2/postnikov-diagonal-bound`.

Source: [The Stacks Project, Tag 0D6N](https://stacks.math.columbia.edu/tag/0D6N), Tag 0D6N (read 2026-09-26).

Acceptance: Different basis objects may have different finite bounds.

### Finite cohomological dimension criterion

Let E∈D(O) on a ringed site. Suppose B is a covering family and d≥0 satisfies H^p(V,H^q(E))=0 for every V∈B, p>d and q<0. Then E→Rlim τ≥−nE is an equivalence. This is a theorem about E; a left-completeness statement for the entire derived category requires the criterion for every E.

Construction or proof: For V∈B, use covers whose members are in B; they form a cofinal system by refining each member of any cover. Apply the local finite-dimension criterion with d_V=d.

Direct inputs: `EnhancedDerivedSheaves:E2/postnikov-local-finite-dimension`.

Source: [The Stacks Project, Tag 0D6P](https://stacks.math.columbia.edu/tag/0D6P), Tag 0D6P (read 2026-09-26).

Acceptance: For weakly contractible covering objects take d=0. A bound only for one E does not prove left completeness of D(O).

### Postnikov comparison under exact sections

If Γ(U,−) on abelian sheaves of X is exact, then RΓ(U,K)→Rlim RΓ(U,τ≥−nK) is an equivalence for every K∈D(X).

Construction or proof: Compute derived sections by sections of any representative complex because the section functor is exact. Exactness commutes with good truncations. Use left completeness of D(Ab), obtained from Set being replete.

Direct inputs: `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `EnhancedDerivedSheaves:E2/coherent-towers-and-roos`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.3.7(1), p. 20.

Acceptance: This does not imply K reconstructs unless the exact section functors detect equivalences.

### Coherent inverse towers and the product–difference formula

For a stable enhanced category with countable products and a coherent inverse tower K:N(ℕᵒᵖ)→C, construct its homotopy limit as fib(1−s:∏_n K_n→∏_n K_n), where the nth component of s is the transition K_(n+1)→K_n after projection. This construction includes the projection cone and its mapping-space universal property. A strict tower of complexes or modules maps to a coherent tower by localization; an arbitrary ordinary diagram in hC is not silently substituted for it.

Construction or proof: Construct the shift map from the coherent tower transitions. Its fibre carries compatible projections. Apply mapping spaces from any test object; the homotopy equalizer of product and shifted product is the inverse limit of the mapping-space tower. This proves the cone universal property and functoriality.

Required API:

- **coherentTower**: The coherent functor category Fun(Nℕᵒᵖ,C).
- **towerDifference**: The product endomorphism 1−s.
- **derivedTowerLimit**: The fibre of towerDifference.
- **derivedTowerLimit_projection**: Its coherent limit cone projections.
- **derivedTowerLimit_mapEquiv**: Map(z,Rlim K)≃lim_n Map(z,K_n).

Unit tests:

- **tower_constant**: The constant identity-transition tower has Rlim≃K.
- **tower_zero_transitions**: If every transition is zero, 1−s is identity and Rlim=0.
- **tower_not_ordinary_limit**: The tower ℤ --×p←ℤ --×p←⋯ has lim=0 but lim¹=ℤ_p/ℤ for p prime, so its derived limit is nonzero in degree 1.

Uses: `EnhancedDerivedSheaves:E2/tower-milnor`: the fibre triangle yields the cohomology sequence; `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`: reconstruction uses this coherent homotopy limit; `CompletedCohomologyPartII:CC.2`: the generic sequential construction is supplied here.

Direct inputs: `EnhancedDerivedSheaves:E0/stable-categories`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

Source: [The Stacks Project, Derived Categories](https://stacks.math.columbia.edu/download/derived.pdf), Derived Categories, Definition 13.34.1 (08TC), Lemma 13.34.2 (07KC), Remark 13.34.4 (0H9J), PDF pp. 105–106; Cohomology on Sites, Lemma 21.23.1 (0941), PDF pp. 47–48.

Source: [On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882), §3, Definition 3.2 and Lemma 3.4, pp. 5–6.

### Milnor exact sequence

For a coherent tower K_n in D∞(O) on a replete topos, every integer q has a natural exact sequence 0→lim¹_n H^(q−1)(K_n)→H^q(Rlim_n K_n)→lim_n H^q(K_n)→0. Here lim¹ for a module-sheaf tower is the cokernel of its product–difference map. On an arbitrary topos use derived products instead; the simple sequence requires countable product exactness.

Construction or proof: Exact countable products imply that cohomology of the product is the product of cohomology in every degree. The long exact sequence of the fibre triangle then separates into kernel and cokernel of 1−s. Identify those as lim and lim¹.

Direct inputs: `EnhancedDerivedSheaves:E2/coherent-towers-and-roos`, `EnhancedDerivedSheaves:E2/countable-products-and-inverse-limits`, `EnhancedDerivedSheaves:E2/inverse-limit-amplitude`.

Source: [The Stacks Project, Cohomology on Sites](https://stacks.math.columbia.edu/download/sites-cohomology.pdf), Cohomology on Sites, Lemma 21.23.2 (0D6K), PDF p. 48; use exact countable products for the sheaf-cohomology version.

Acceptance: For an eventually constant cohomology tower, the lim¹ term vanishes. The statement covers negative and positive q alike. For strict module towers in the point topos this is the ordinary module Milnor sequence.

### Ordinary pro-zero towers and pro-isomorphisms

An ordinary module-sheaf tower M is pro-zero when for every n there is m≥n such that the transition M_m→M_n is zero. A morphism of ordinary module towers is a pro-isomorphism when its kernel and cokernel towers are pro-zero. For a morphism of coherent derived towers the required degreewise condition is that every cohomology tower of its cone is pro-zero; a uniform vanishing stage across all degrees is a stronger condition and is not part of this definition.

Construction or proof: Use actual transition maps, not merely vanishing inverse limits. Form kernel, cokernel and cohomology towers functorially. Prove stability under cofinal reindexing and short exact sequences of ordinary towers.

Required API:

- **IsProZero**: Each fixed target stage is killed by a sufficiently late transition.
- **IsProIsomorphism**: Kernel and cokernel towers are pro-zero.
- **proZero_cofinal**: The property is invariant under cofinal monotone reindexing.
- **proIso_comp**: Pro-isomorphisms satisfy composition and two-out-of-three.

Unit tests:

- **proZero_zero**: The zero tower is pro-zero.
- **proZero_zero_maps**: An arbitrary nonzero family with zero transition maps is pro-zero.
- **proZero_not_p_multiplication**: For the tower ℤ with ×p transitions no transition into a fixed stage is zero; the tower is not pro-zero although lim is zero.

Uses: `EnhancedDerivedSheaves:E2/pro-zero-derived-limit`: this is the condition needed to deduce vanishing of the derived limit; `ArithmeticGaloisDuality:D7`: imports the ordinary criterion from E2, without an almost clause.

Direct inputs: `EnhancedDerivedSheaves:E2/coherent-towers-and-roos`, `mathlib:CategoryTheory.Abelian`.

Source: [On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882), Definition 3.2, Lemmas 3.4–3.6 and Lemma 5.3, pp. 5–6 and 9.

### Derived inverse-limit invariance under pro-zero errors

In a replete topos, a pro-zero ordinary module-sheaf tower has lim=lim¹=0. Hence a coherent derived tower whose every cohomology tower is pro-zero has Rlim=0. A morphism whose cone has this degreewise property induces an equivalence on Rlim. The strict pro-Tor error of unbounded coefficient systems must separately be shown degreewise pro-zero by the uniform finite-amplitude algebraic argument from DD.1.

Construction or proof: For a pro-zero tower, solve (1−s)x=y by a finite sum in each component, since only finitely many composites into that fixed component are nonzero. Its kernel is zero; this proves both lim and lim¹ vanish. Apply Milnor in every integer degree to the cohomology towers of the cone, then use cohomology detection.

Direct inputs: `EnhancedDerivedSheaves:E2/pro-towers`, `EnhancedDerivedSheaves:E2/tower-milnor`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

Source: [On the direct summand conjecture and its derived variant](https://arxiv.org/pdf/1608.08882), Lemmas 3.4–3.6 and Lemma 5.3, pp. 5–6 and 9.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.5.4, p. 25.

Acceptance: The chosen killing stage may depend on n and on the cohomology degree. Do not infer invariance after tensoring a variable unbounded tower solely from a degreewise pro-isomorphism of coefficient rings.

### Independence under hypercover refinement

For a refinement V_•→U_• of hypercovers of X in a replete topos, pullback gives an equivalence D_cart(U_•)→D_cart(V_•), coherently compatible with refinement composition. Under either descent equivalence it identifies with id_{D∞(X)}. On the uniformly bounded-below Cartesian subcategories the same holds on an arbitrary topos.

Construction or proof: Compose refinement pullback with augmentation pullback from D∞(X). The canonical comparison with the second augmentation is an equivalence. Apply the descent equivalences to deduce refinement equivalence; contractible inverse choices yield composition coherence.

Direct inputs: `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`, `EnhancedDerivedSheaves:E2/bounded-below-hypercover-descent`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.3.6, p. 20.

Source: [The Stacks Project, Simplicial Spaces](https://stacks.math.columbia.edu/download/spaces-simplicial.pdf), Simplicial Spaces, Lemmas 85.18.4 (0DA2) and 85.20.4 (0DA7), PDF pp. 43–45.

Acceptance: The identity refinement acts by identity. Two successive refinements give the same functor as their composite up to the prescribed natural equivalence. Refinement independence is stated for coherent Cartesian systems, not arbitrary simplicial derived objects.

### Space-valued sheaves and Postnikov convergence

For a small site, use the quasicategory of presheaves of Kan spaces and its accessible localization at covering descent maps to construct sheaves of spaces; localizing further at all hypercovers gives the hypercomplete subcategory. Form τ≤n and the coherent Postnikov tower there. Hypercompleteness means descent along all hypercovers; Postnikov completeness is the stronger convergence/effectivity assertion used here and is not automatic for every hypercomplete topos.

Construction or proof: Construct space-valued presheaves using the coherent functor category and the Kan mapping-space model. Impose covering descent by accessible localization. Build truncation from n-truncated mapping targets and assemble its tower. Use exact weakly contractible sections or finite homotopy dimension for convergence; record the size of the hypercover localization and the effective-tower proof as explicit higher-sheaf inputs.

Required API:

- **spaceSheaves**: The covering-descent full subcategory of space-valued presheaves.
- **hypercompleteSpaceSheaves**: The hypercover-local subcategory.
- **spacePostnikovTower**: The coherent truncation tower and its canonical unit.
- **spacePostnikov_convergence**: Convergence is the equivalence F→lim_nτ≤nF, with tower effectivity required for categorical completeness.

Unit tests:

- **spaceSheaf_point**: On the point site, sheaves are spaces and every Postnikov tower converges.
- **spaceSheaf_discrete**: A zero-truncated sheaf of spaces is the nerve of an ordinary sheaf of sets.
- **spaceSheaf_KZn**: For n≥1, τ≤(n−1)K(ℤ,n) is a point while τ≤nK(ℤ,n)≃K(ℤ,n).

Uses: `EnhancedDerivedSheaves:E2/weakly-contractible-space-postnikov`: weakly contractible sections verify this convergence; `EnhancedDerivedSheaves:E2/perfect-h-hyperdescent`: space-level effectivity controls the categorical descent datum.

Direct inputs: `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `EnhancedDerivedSheaves:E3/accessible-localizations`, `EnhancedDerivedSheaves:E2/hypercover`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Definitions 6.2.2.1 and 6.2.2.6, Proposition 6.2.2.7 and Construction 6.2.2.9, PDF pp. 595–599; Proposition 6.5.2.8 and the hypercompletion construction, PDF pp. 686–687; Theorem 6.5.3.12 and Corollary 6.5.3.13, PDF p. 698; Definition 5.5.6.23 and Proposition 5.5.6.26, PDF pp. 516–517; Proposition 7.2.1.10 and proof, PDF pp. 738–739.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.2.3, p. 18.

### The h-topology on perfect schemes

On perfect qcqs F_p-schemes, h-covers are perfections of h-covers of ordinary qcqs F_p-schemes; the ordinary h-topology is generated by faithfully flat finite-presentation covers and proper surjective finite-presentation covers. On perfectly finitely presented schemes over a fixed perfect base restrict to those morphisms. All cutoffs are specified so that the site is small.

Construction or proof: Use ordinary scheme perfection and the finite-presentation h-cover generators. Verify pullback/composition closure after perfection and restrict to a fixed adequate cardinal cutoff.

Required API:

- **perfectHTopology**: The h-topology with these cover generators.
- **perfectHCovers_pullback**: Pullback of an h-cover is an h-cover.
- **perfectHCovers_perfection**: Perfection of an ordinary h-cover is a cover in the perfect h-site.

Unit tests:

- **perfectH_identity**: The identity map is an h-cover.
- **perfectH_fppf**: The perfection of an fppf cover is an h-cover.
- **perfectH_empty**: The empty scheme does not h-cover a nonempty scheme.

Uses: `EnhancedDerivedSheaves:E2/perfect-h-cech-descent`: the cover conditions specify the descent problem.

Direct inputs: `EnhancedDerivedSheaves:E1/quasicoherent-derived-sheaves`, `DiamondsAndVStacks:D0`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Definition 11.1, p. 40; Theorem 2.9 and §2, pp. 6–8.

### h-descent for quasicoherent and perfect complexes

The functor X↦Dqc(X) on perfect qcqs F_p-schemes satisfies h-Čech descent. Perf(X) satisfies h-hyperdescent. For perfectly finitely presented maps the bounded subcategory Dqcᵇ is functorial and satisfies h-descent, because finite Tor dimension preserves boundedness and h-covers detect boundedness. These statements do not assert unbounded h-hyperdescent over arbitrary perfect bases.

Construction or proof: Use the quantitative descendability/module-descent theorem from the E5 abstract owner together with the h-cover cohomology input to obtain Čech effectivity; the acyclic supplier interface is specified as a required interface. Restrict to finite perfect amplitude: such spaces are truncated, and a Cartesian hypercover datum retains the amplitude of its degree-zero member. Finite Tor dimension and h-boundedness detection handle Dqcᵇ.

Direct inputs: `EnhancedDerivedSheaves:E2/perfect-h-topology`, `EnhancedDerivedSheaves:E1/perfect-scheme-base-change`, `EnhancedDerivedSheaves:E1/perfect-finite-tor-dimension`, `EnhancedDerivedSheaves:E2/perfect-h-boundedness`, `EnhancedDerivedSheaves:E1/quasicoherent-derived-sheaves`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Theorem 11.2(1)–(3), p. 40; proof in §11.3, pp. 46–48.

Acceptance: Perfect complexes carry a uniform local finite amplitude along the hypercover. Do not replace an h-Čech theorem for unbounded Dqc by a hyperdescent theorem without the finite-dimensional base condition.

### Boundedness detected by perfect h-covers

For an h-cover f:X→Y of perfect qcqs schemes and K∈Dqc(Y), if Lf*K is bounded, K is bounded. On perfectly finitely presented schemes finite Tor dimension also proves that pullback preserves bounded complexes.

Construction or proof: For the perfection of an fppf cover use faithful-flat detection on cohomology. For proper covers refine to modifications and induct on the closed complement. The proper-modification pullback square for structure sheaves, projection formula and finite cohomological dimension identify K as a finite pullback of bounded complexes. The scheme-theoretic refinement theorem is an ordinary-geometry proof input recorded in gaps.

Direct inputs: `EnhancedDerivedSheaves:E2/perfect-h-topology`, `EnhancedDerivedSheaves:E1/perfect-finite-tor-dimension`, `EnhancedDerivedSheaves:E1/perfect-scheme-base-change`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Lemma 11.30 and proof of Theorem 11.2(3), pp. 47–48.

Acceptance: The theorem detects a two-sided bound of K; it does not say arbitrary ring maps reflect boundedness. The finite-presentation condition is kept in the separate preservation statement.

### Tensor and bounded cosimplicial totalization

If R has finite global dimension, N• is a cosimplicial ordinary R-module (each term in degree zero), and Tot N• is bounded, then for any unbounded M∈D∞(R) the canonical map M⊗ᴸ_R Tot N•→Tot(M⊗ᴸ_R N•) is an equivalence. It does not assert that arbitrary tensor products preserve arbitrary totalizations of unbounded cosimplicial complexes.

Construction or proof: Use the common global-dimension bound to compare tensor of unbounded M with its cochain truncations against bounded complexes. For bounded M reduce to projective modules; Dold–Kan computes the totalization. Then use uniform cohomological bounds on Tot N• and on degree-zero N^n to pass through truncation towers degree by degree.

Direct inputs: `EnhancedDerivedSheaves:E1/perfect-finite-global-dimension`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E2/coherent-towers-and-roos`, `EnhancedDerivedSheaves:E2/tower-milnor`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Lemma 11.36, pp. 50–51.

Acceptance: For a constant cosimplicial module N this is the identity comparison. The boundedness of Tot N• and the degree-zero condition on N^n are both retained.

### Unbounded h-hyperdescent over a finite-dimensional perfect base

Let k be the perfection of a regular Noetherian F_p-algebra of finite Krull dimension. On perfectly finitely presented perfect k-schemes, X↦Dqc(X) satisfies h-hyperdescent. For an h-hypercover X•→Y and any K∈Dqc(Y), RΓ(Y,K)≃Tot RΓ(X•,K|X•); every coherent Cartesian Dqc datum is effective.

Construction or proof: Refine to an affine hypercover. The structure-sheaf totalization is the degree-zero base ring; finite global dimension and the tensor-totalization theorem give RΓ hyperdescent for any K. For a Cartesian datum define its hypercomplete sheaf by totalization after every base change; it restricts to the prescribed terms. Restrict to X⁰ and use already-proved h-Čech effectivity to obtain a quasicoherent object on Y.

Direct inputs: `EnhancedDerivedSheaves:E2/perfect-h-cech-descent`, `EnhancedDerivedSheaves:E2/tensor-bounded-totalization`, `EnhancedDerivedSheaves:E1/quasicoherent-derived-sheaves`, `EnhancedDerivedSheaves:E2/space-sheaves-and-postnikov`.

Source: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf), Theorem 11.2(4), p. 40; Lemmas 11.37–11.38 and Remark 11.39, pp. 50–51.

Acceptance: The bound is on the ordinary regular presentation of the perfect base; it is not an assertion for every perfect ring. The conclusion is an enhanced categorical equivalence, including mapping spaces and essential surjectivity.

## E3 — Coherent diagrams, Kan extensions and adjoints

Kan extensions are universal properties in coherent functor categories. For a full inclusion, the extension formula uses the appropriate slice colimit; existence and contractible uniqueness come from the relative cone restriction theorem. Fibrewise cofinality is proved by a comma-category contractibility criterion, and preservation of coCartesian edges is tested by the universal mapping-space square. These statements control diagrams of ringed topoi before geometric six-operation hypotheses enter.

For enough-points topoi, the Liu–Zheng construction gives coherent derived diagrams with varying coefficients and partial adjoints. Arbitrary replete topoi need a point-free comparison of the variable-coefficient Cartesian model with the enhanced categorical limit. Constant-model diagram localization is an input to that comparison; it does not automatically prove it. Both mapping-space full faithfulness and essential surjectivity are required.

Space-valued representability constructs adjoints. A functor between presentable categories has a right adjoint exactly when it preserves small colimits; a left adjoint requires accessibility and small-limit preservation. Accessible localizations impose a small family of local conditions. Limits of diagrams of presentable categories must retain whether the transition functors are left or right adjoints. In a stable category, exactness plus coproduct preservation implies all-colimit preservation. If the source is compactly generated, a right adjoint preserves coproducts exactly when its left adjoint preserves compact objects.

The finite bicategorical mate correspondence and its vertical pasting law already apply to QCat. Use those declarations for finite squares. The new target is the coherent Beck–Chevalley datum for ringed diagrams and the verification of invertibility in applications. At cardinal cutoffs, uniqueness of representing objects supplies coherent comparison of right adjoints when the test source is fixed. If the source changes too, the right adjoint must carry the smaller ambient category into the smaller source; full faithfulness alone does not ensure this.


### Left Kan extension along a full inclusion

Let i:C₀→C be a full inclusion, p:D→B an inner fibration, and a prescribed base functor C→B. A lift F₀:C₀→D extends by relative left Kan extension if the diagram (C₀)_{/c}→D admits the required p-colimit for every c. Restriction from the full quasicategory of relative left Kan extensions to the extendible F₀ is a trivial fibration. The pointwise value is that relative colimit, and the space of extensions of a fixed F₀ is contractible.

Construction or proof: Build the restriction simplicial map on relative functor categories. Extend successively over simplices using the prescribed slice colimits and their contractible spaces of choices. Lemmas 4.3.2.12–13 give boundary lifting and identify the full image; this proves the trivial fibration and coherent uniqueness.

Direct inputs: `EnhancedDerivedSheaves:E0/slices-and-cones`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `mathlib:CategoryTheory.Functor.IsLeftKanExtension`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Definition 4.3.2.2, PDF p. 289; Lemmas 4.3.2.12–13 and Propositions 4.3.2.15–17, PDF pp. 297–303.

Acceptance: When p:D→* the value at c is colim_{(x→c)∈C₀/c}F₀(x). For c in C₀ the slice has a final object id_c, so extension restricts to F₀. For ordinary category nerves this recovers pinned IsLeftKanExtension, with its ordinary comma-category formula.

### Cofinality of the terminal fibre

If p:E→B is coCartesian and b is terminal in B, inclusion E_b→E is final. More generally E_b→E×_B B_{/b} is final. Therefore the colimit of a diagram on the latter total category can be computed on E_b, whenever either colimit exists.

Construction or proof: For x over u transport x along u→b. This gives an initial object of the comma category x/E_b up to contractible choice. Apply the quasicategorical Theorem A finality criterion. Replace B by B/b for the general version.

Direct inputs: `EnhancedDerivedSheaves:E0/cocartesian-edges-and-fibrations`, `EnhancedDerivedSheaves:E0/slices-and-cones`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Theorem 4.1.3.1 and Lemma 4.1.3.2, PDF pp. 254–256; §4.3.2, PDF pp. 297–303.

Acceptance: For an interval diagram C→D the terminal fibre D computes colimits over its Grothendieck total category. The initial fibre C is not in general final.

### The fibrewise edge-preservation criterion

For coCartesian fibrations E,E′ over B and a functor F:E→E′ over B, F preserves coCartesian edges if and only if for every a:b→c and x∈E_b the canonical comparison a′_!F_b(x)→F_c(a_!x) is an equivalence. Such a functor corresponds under straightening to a coherent natural transformation of the classified diagrams.

Construction or proof: Factor the image of a coCartesian lift through a chosen lift in E′. The image is coCartesian exactly when the remaining vertical edge is an equivalence. Independence of choices follows from contractibility of lift spaces; straightening retains the naturality coherences.

Direct inputs: `EnhancedDerivedSheaves:E0/cocartesian-edges-and-fibrations`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `EnhancedDerivedSheaves:E0/categorical-equivalences`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Proposition 2.4.4.3, PDF p. 149; §2.4.5 and Theorem 3.2.0.1, PDF pp. 150–155 and 187.

Acceptance: For a constant product fibration, an arbitrary fibre functor preserves transport edges exactly when its transport comparisons are equivalences. A fibrewise functor together with noninvertible transport comparisons does not pass the criterion.

### Coherent ringed-topos diagrams

For a small poset Ξ and a diagram of ringed topoi with enough points, localize the relative diagram of dg-flat complexes at quasi-isomorphisms. It gives a coherent diagram ξ↦D∞(X_ξ,R_ξ) whose transitions are the enhanced derived ringed pullbacks. For a fixed topos X and Λ:Ξᵒᵖ→CommRing, define D∞(X,Λ) by the enhancement of module sheaves on Fun(Ξᵒᵖ,X). Cartesian objects are the sections whose derived scalar-transition maps are equivalences. The enough-points assumption belongs to the cited flat-model construction.

Construction or proof: Use dg-flat complexes and mark quasi-isomorphisms before taking the multisimplicial nerve. Pullback preserves these marked maps. Relative localization and straightening assemble a coherent diagram. Compare the fibrewise localization with the K-injective enhancement. For constant Λ identify the diagram category with Fun(NΞᵒᵖ,D∞(X,Λ)); variable coefficients use the Cartesian scalar-change condition.

Required API:

- **ringedDiagramDerived**: The enhanced derived category for the ringed diagram.
- **ringedDiagram_eval**: Evaluation at each ξ and each transition pullback.
- **ringedDiagram_constant**: For constant coefficients and fixed X, D∞(X,Λ_Ξ)≃Fun(NΞᵒᵖ,D∞(X,Λ)).
- **ringedDiagram_cartesian**: The full subcategory of sections with invertible derived transition maps.

Unit tests:

- **ringedDiagram_point**: For a one-object Ξ the category is D∞(X,R).
- **ringedDiagram_interval**: For Ξ=[1] with constant coefficients it is the enhanced arrow category, retaining homotopies of commuting squares.
- **ringedDiagram_nonflat_coefficients**: For ℤ→ℤ/p, a Cartesian transition from (ℤ/p)[0] is its derived reduction with degrees −1 and 0; replacing it by the ordinary tensor does not give a Cartesian section.

Uses: `DiamondSixOperations:S2`: supplies coherent pullback diagrams before geometric six-operation input; `EnhancedDerivedSheaves:E4/compatible-coefficient-systems`: the variable-coefficient point-free comparison is stated separately.

Direct inputs: `EnhancedDerivedSheaves:E1/ringed-pullback-pushforward`, `EnhancedDerivedSheaves:E1/k-flat-replacement`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `EnhancedDerivedSheaves:E0/coherent-functors`.

Source: [Enhanced six operations and base change theorem for higher Artin stacks](https://arxiv.org/abs/1211.5948), Proposition 3.1.3; Definitions 3.2.1 and 3.2.5; Lemmas 3.2.2 and 3.2.10, pp. 84–88.

### Point-free coefficient-system comparison

For a small topos X and a sequence of sheaves of commutative rings R_n, the Cartesian full subcategory of the enhancement of R_•-module sheaves on Fun(ℕᵒᵖ,X) identifies, on mapping spaces as well as objects, with lim_n D∞(X,R_n) along derived scalar extension. This statement imposes no enough-points assumption; its localization proof is a separate required proof rather than an inference from the enough-points theorem.

Construction or proof: Use the point-free injective model for ringed diagram sheaves and localize the derived transition maps. Identify its homotopy-coherent Cartesian sections by mapping-space localization. Prove both fully faithful mapping-space comparison and essential surjectivity of systems; the constant-diagram theorem alone does not prove the variable-coefficient case.

Direct inputs: `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/coefficient-change-and-perfect-action`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Proposition 1.3.4.25, pp. 115–116.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Definition 3.5.3 and Lemma 3.5.7, pp. 24–25.

Acceptance: For constant rings this is the constant diagram localization comparison. For the coefficient tower R/I^n all transition tensors are derived. An equivalence of triangulated homotopy categories is insufficient.

### Space-valued representability

If C is presentable, a functor F:Cᵒᵖ→Spaces is representable exactly when it preserves small limits. The space of representing objects with the representing equivalence is contractible. Presentable categories consequently admit small limits.

Construction or proof: Express C as an accessible localization of a presheaf category. A limit-preserving space-valued functor extends to a representable presheaf functor; the local condition puts the representing object in C. Fully faithful Yoneda gives contractible uniqueness.

Direct inputs: `EnhancedDerivedSheaves:E0/accessible-and-presentable`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Proposition 5.5.2.2 and Corollary 5.5.2.4, PDF pp. 481–482.

Acceptance: For Map_C(−,c) the representing object is c. The theorem is about space-valued functors, including all higher mapping homotopy groups.

### The enhanced adjoint functor theorem

For a functor F:C→D between presentable quasicategories, F has a right adjoint if and only if it preserves all small colimits; F has a left adjoint if and only if it is accessible and preserves all small limits. The resulting adjunction is space-valued and unique up to contractible coherent choice. A full presentable subcategory whose inclusion preserves colimits has a right adjoint to that inclusion.

Construction or proof: For d∈D represent c↦Map_D(Fc,d) to construct Gd; coherent Yoneda assembles G and its mapping-space adjunction. For a left adjoint use accessibility to reduce its solution-set argument to one regular cardinal and limit preservation. Yoneda supplies uniqueness and both triangular coherences.

Direct inputs: `EnhancedDerivedSheaves:E3/representability`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E1/derived-presentability`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Corollary 5.5.2.9, PDF p. 484.

Acceptance: For the inclusion of étale objects, the supplied colimit-closure hypothesis constructs a right adjoint (coreflection). An arbitrary fully faithful inclusion need not have a right adjoint. Ordinary categories viewed by nerves recover ordinary adjunctions, while the enhanced statement retains mapping spaces.

### Accessible localization and coreflection

Let C be presentable and S a small set of morphisms. An S-local object x is one for which Map(v,x)→Map(u,x) is an equivalence for every s:u→v in S. The full local subcategory C_S is presentable and its inclusion has an accessible left adjoint L_S. Separately, an accessible full presentable subcategory A⊂C closed under small colimits has a right adjoint G to its inclusion. These two adjoint directions are stated distinctly.

Construction or proof: Run the accessible localization construction for the set S, or the equivalent presentable solution-set argument. Identify local objects by mapping-space orthogonality and the idempotent unit. For coreflection apply the right-adjoint theorem to the inclusion and identify its fully faithful counit.

Required API:

- **IsLocalObject**: Mapping-space orthogonality to S.
- **accessibleLocalization**: The reflector L_S with its unit.
- **localization_mapEquiv**: For local x, Map(L_Sc,x)≃Map(c,x).
- **presentableCoreflector**: The right adjoint G under accessibility and colimit closure.
- **localization_idempotent**: L_SL_S≃L_S; for the coreflector G i≃id_A.

Unit tests:

- **localization_empty**: For S=∅, C_S=C and L_S is identity.
- **localization_zero**: In a stable C, localizing at all generator maps g→0 gives the zero category when the generators detect zero objects.
- **coreflection_direction**: For a colimit-closed presentable A, Map_C(i a,c)≃Map_A(a,Gc); exchanging the two Hom variables gives the wrong direction.

Uses: `EnhancedDerivedSheaves:E4/the-imported-completion-interface`: completion is reflective; its inclusion need not preserve colimits; `DiamondEtaleCohomology:C2`: the étale inclusion must supply its actual accessibility and colimit-closure hypotheses.

Direct inputs: `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E0/mapping-space-kan-and-equivalences`, `EnhancedDerivedSheaves:E0/accessible-and-presentable`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Proposition 5.5.4.15, PDF pp. 500–501; Corollary 5.5.2.9, PDF p. 484.

### Limits of presentable categories

A homotopy pullback of presentable categories along left-adjoint functors is presentable, its projection functors are left adjoints, and its colimits are evaluated componentwise. More generally Prᴸ admits all small limits, and the forgetful functor Prᴸ→Cat∞ preserves them. Thus a coherent inverse limit of D∞(X,R/I^n) along scalar-change left adjoints is presentable.

Construction or proof: For a pullback, lift objects together with an equivalence of their images; use a sufficiently large common accessibility cardinal to prove accessibility, and compute colimits componentwise. Products and homotopy pullbacks give all small limits. The coCartesian-sections comparison identifies the underlying coherent category.

Direct inputs: `EnhancedDerivedSheaves:E0/accessible-and-presentable`, `EnhancedDerivedSheaves:E0/cocartesian-fibrations-and-restricted-straightening`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`.

Source: [Higher Topos Theory](https://www.math.ias.edu/~lurie/papers/HTT.pdf), Propositions 5.5.3.12–13 and Corollary 5.5.3.14, PDF pp. 487–488.

Acceptance: The product of a small family of presentable categories is presentable. A limit of ordinary homotopy categories does not supply this result. Inclusion of the completed sheaf category into the ambient category can fail colimit preservation although the category itself is presentable.

### Exactness and coproduct preservation

An exact functor between stable quasicategories admitting small coproducts preserves all small colimits if and only if it preserves small coproducts. These stable categories admit all small colimits.

Construction or proof: Express sequential colimits by the cofiber of 1−shift on a coproduct. Express a general colimit as the geometric realization of its simplicial replacement, and each realization as the sequential colimit of finite skeleta. Exactness handles finite skeleta and cofibres; coproduct preservation handles the remaining sums.

Direct inputs: `EnhancedDerivedSheaves:E0/stable-categories`, `EnhancedDerivedSheaves:E0/limits-colimits-universal-properties`, `EnhancedDerivedSheaves:E0/coherent-functors`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Proposition 1.4.4.1(1)–(2) and proof, p. 154.

Acceptance: Derived scalar extension is exact and coproduct-preserving, hence colimit-preserving. An exact right adjoint need not preserve coproducts.

### The compact-generation adjoint criterion

Let F:C⇄D:G be an adjunction of stable categories, with C compactly generated by a small set of compact objects and both categories admitting coproducts. If F sends the compact generators to compact objects, G preserves coproducts. Conversely, if G preserves coproducts, F sends every compact object to a compact object.

Construction or proof: For each compact generator c compare Map_C(c,⊕Gy_i) with Map_D(Fc,⊕y_i) using adjunction and compactness. The comparison is an equivalence on mapping spaces, so generator detection proves ⊕Gy_i→G(⊕y_i) is an equivalence. For the converse use the same adjunction for any compact c and arbitrary coproducts.

Direct inputs: `EnhancedDerivedSheaves:E0/accessible-and-presentable`, `EnhancedDerivedSheaves:E0/stable-categories`, `EnhancedDerivedSheaves:E3/exact-coproducts-colimits`, `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`.

Source: [Higher Algebra](https://www.math.ias.edu/~lurie/papers/HA.pdf), Proposition 1.4.4.1(3) and proof, p. 154; compact-generator detection in §1.4.4, pp. 155–156.

Source: [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4), Proposition 23.7 and its use, pp. 144–146.

Acceptance: For finite free R→S scalar extension, the restriction right adjoint preserves coproducts. Compact generation of C is the detecting hypothesis; presentability alone does not replace it.

### Adjoints at cardinal cutoffs

Suppose a filtered system D_κ has fully faithful transition functors, a fixed presentable C, and compatible colimit-preserving functors i_κ:C→D_κ. Let G_κ be the constructed right adjoints. Then G_λ restricted along D_κ→D_λ is naturally equivalent to G_κ, with all three-cutoff coherences. They assemble on the category of objects belonging to some adequate cutoff. If the source also varies as C_κ, additionally require that G_λ sends D_κ into the essential image of C_κ; compatibility is not automatic without this condition.

Construction or proof: For y∈D_κ, adjunction and full faithfulness show that G_κy and G_λy represent the same functor on C. Yoneda produces the comparison, and its contractible uniqueness gives identity, composition and triple-cutoff coherence. Check the image condition separately when both source and target vary.

Direct inputs: `EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`.

Source: [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4), Lemma 17.1 and Corollary 17.2, pp. 96–97.

Acceptance: The fixed-source étale coreflection setup has compatible right adjoints. A larger ambient site does not by itself prove that a varying-source right adjoint has a small value.

### Coherent Beck–Chevalley comparisons

For enhanced adjunctions L₁⊣R₁ and L₂⊣R₂ and a square α:gL₂→L₁h, the pinned bicategorical mate in QCat gives R₁g→hR₂ by unit, α and counit pasting. Beck–Chevalley means invertibility of this mate. Identity and finite pasting laws are imported from the bicategorical API. The additional target is a representative coherent natural transformation and its compatibility with the relative-localization diagram construction.

Construction or proof: Reuse the existing Bicategory.mateEquiv on QCat for the finite mate map and Bicategory.mateEquiv_vcomp for vertical pasting. Compare its unit/counit formula with the scalar/pullback squares from E1. The new enhanced target is functorial higher coherent Beck–Chevalley data in ringed diagrams and verification of its invertibility in applications; a finite bicategorical map alone does not prove that target.

Required API:

- **coherentMate**: A coherent representative of the pinned mate, with its bicategorical class.
- **beckChevalley**: The representative is invertible exactly when its mate class is invertible.
- **coherentMate_pasting**: Evaluation of coherent pasting agrees with pinned mateEquiv_vcomp.
- **coherentMate_ordinary**: For ordinary category nerves the construction agrees with CategoryTheory.mateEquiv.

Unit tests:

- **mate_identity_square**: For identity adjunctions the mate of α is α.
- **mate_pasting_test**: Vertical composition of two squares has mate equal to the composite of their two mates, with the prescribed whiskering.
- **mate_not_automatic_equivalence**: For extension/restriction along ℤ→ℤ/p in the self-base-change square, the derived multiplication (ℤ/p)⊗ᴸ_ℤ(ℤ/p)→ℤ/p has nonzero degree −1 fibre; the base-change mate is not an equivalence.

Uses: `DiamondSixOperations:S2`: base-change transformations must compose coherently; `AdicCoefficientsAndComparisons:L0`: the coefficient-system construction pastes these comparisons.

Direct inputs: `mathlib:SSet.QCat.bicategory`, `mathlib:CategoryTheory.Bicategory.mateEquiv`, `mathlib:CategoryTheory.Bicategory.mateEquiv_vcomp`, `EnhancedDerivedSheaves:E0/coherent-functors`, `EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`.

Source: [Enhanced six operations and base change theorem for higher Artin stacks](https://arxiv.org/abs/1211.5948), Proposition 2.2.4 and its proof, pp. 79–81.

## E4 — Derived completion of sheaves and coefficient reconstruction

Generic derived completion is imported from DD.1. A sheaf complex is complete when every local scalar telescope for the ideal has zero homotopy inverse limit. Local finite generators suffice to test the condition. Slice-free localization generators give the orthogonality description, and the finite sequential reflector glues by enhanced hypercover descent. Limits of complete objects remain complete. Colimits are ambient colimits followed by the reflector, so their existence does not imply that the inclusion preserves them.

Complete module sheaves form a weak Serre subcategory: kernels, cokernels and extensions between complete modules remain complete. This is not closure under arbitrary submodules and arbitrary quotients. A complex is complete exactly when all its integer cohomology sheaves are complete. Classical completion agrees with derived completeness plus adic separatedness. Internal Hom into a complete target is complete, and completed tensor is the ambient derived tensor followed by completion. Its adjunction and monoidal structure are proved from the imported comparison, rather than inserted as assumed structure fields.

For coefficient reconstruction take a constant commutative ring R and I generated by a finite regular sequence, including the empty sequence at I=0. Compatible systems are the enhanced limit of D(X,R/I^n) along derived scalar extension. An object has transition equivalences and all their coherences. Reduction sends K to K⊗ᴸ_R R/I^n. Reconstruction first forgets the coefficients and takes the coherent derived inverse limit. Uniform regular-sequence pro-Tor control proves its reduction counit and the completion unit for unbounded complexes.

The resulting equivalence of stable enhanced categories holds on a replete topos without Noetherianity or boundedness. Its completed coefficient object is the inverse limit of constant quotient sheaves inside the topos. Even if the ordinary ring R is complete, its constant sheaf need not equal this limit. Coherent R-linear exact functors commute with tensor by perfect R-complexes through finite cell and retract constructions. The perfection of each quotient power is part of the generic regular-ideal input. Reduction modulo I detects equivalences between complete objects. Étale coreflection belongs to the geometric consumer and is not built into the ambient coefficient category.


### Derived complete sheaves

Dcomp(X,R,I) is the full enhanced subcategory of D(X,R) consisting of K such that, for every U∈X and every x∈I(U), the homotopy inverse limit T(K|U,x) of the tower with every term K|U and every transition multiplication by x is zero. This applies DD.1’s completeness condition on every slice; it does not redefine generic algebraic completion.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; size universes are fixed. R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified. D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

Construction or proof: Apply the imported scalar-telescope test in each ringed slice. Take the full subcategory on the objects satisfying all slice tests; fullness retains the mapping spaces of D(X,R).

Required API:

- **DerivedCompleteSheaves**: The full enhanced subcategory with its fully faithful inclusion.
- **derivedCompleteSheaf_iff**: Membership is the vanishing of every local scalar telescope.
- **derivedCompleteSheaf_restrict**: Restriction to a slice preserves membership, coherently under successive restriction.
- **derivedCompleteSheaf_zero**: The zero complex belongs to Dcomp.

Unit tests:

- **derivedCompleteSheaf_zeroIdeal**: For I=0 every complex is complete: a tower with zero transition maps has zero homotopy limit.
- **derivedCompleteSheaf_sets**: For X=Set the condition agrees with DD.1’s derived I-completeness for R-modules.
- **derivedCompleteSheaf_inverted**: For X=Set, R=ℤ and I=(p), the nonzero complex ℤ[1/p] is not derived complete: its p-telescope is equivalent to itself.

Uses: `EnhancedDerivedSheaves:E4/the-imported-completion-interface`: Target of the sheaf completion reflector; `EnhancedDerivedSheaves:E4/coefficient-system-reconstruction`: Domain of coefficient reconstruction; `AdicCoefficientsAndComparisons:L0`: Adds the étale condition after reduction; that condition is owned by L0.

Direct inputs: `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E2/replete-topoi`, `EnhancedDerivedSheaves:E2/replete-slice`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Definition 3.4.1 and the paragraph following it, p. 21.

### Local generator criterion

For a cover {U_a→1} on which I has finite generators f_a,1,…,f_a,r(a), K is derived I-complete if and only if T(K|U_a,f_a,j)=0 for every a,j. Thus a different finite generating family gives the same full subcategory.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; size universes are fixed. R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified. D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

Construction or proof: Vanishing for all slices implies the displayed finite tests. For the converse use DD.1’s localization orthogonality and localization Mayer–Vietoris argument on each slice: vanishing is stable under scalar multiples and finite sums of generators. Restriction commutes with the relevant homotopy limits, and equivalences are local on a cover. The sheaf localization/Mayer–Vietoris bridge is an explicit required comparison input.

Direct inputs: `EnhancedDerivedSheaves:E4/derived-complete-sheaves`, `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E2/replete-slice`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemmas 3.4.6–8, pp. 21–22; Lemma 3.4.12, pp. 22–23.

Acceptance: For I=0 an empty generating family imposes no condition. A test only on global sections is not substituted for the slice condition.

### Limits of complete sheaves

The inclusion Dcomp(X,R,I)→D(X,R) creates small limits and is exact: limits of complete objects, zero objects, shifts and finite cofibres are complete.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; size universes are fixed. R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified. D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

Construction or proof: On every slice, restriction and T(−,x) commute with limits, so a limit of zero telescope objects is zero. The telescope functor is exact in the stable category, so its kernel is closed under shifts and finite cofibres.

Direct inputs: `EnhancedDerivedSheaves:E4/derived-complete-sheaves`, `EnhancedDerivedSheaves:E2/coherent-towers-and-roos`, `EnhancedDerivedSheaves:E2/tower-milnor`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Paragraph after Definition 3.4.1, p. 21; proof of Lemma 3.4.13, p. 23.

Acceptance: An arbitrary coproduct in D(X,R) need not be complete. Nilpotently I-annihilated objects and limits of such objects are complete.

### Sheaf completion reflector

Extend DD.1’s completion to a functor L_I:D(X,R)→Dcomp(X,R,I), left adjoint to the full inclusion. It commutes with slice restriction. If I=(f₁,…,fᵣ) globally, put F₀(K)=K and F_j(K)=cofib(T(F_{j−1}(K),f_j)→F_{j−1}(K)); then L_I K=Fᵣ(K). For a locally generated ideal these local reflectors glue by hypercover descent. The adjunction makes the result independent of the choices.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; size universes are fixed. R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified. D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

Construction or proof: Import the one-generator reflector and its localization-orthogonality proof from DD.1. Apply the one-generator functors successively. Orthogonality proves that each step preserves completeness for earlier generators and has the required universal map into objects complete for the enlarged ideal. Use restriction compatibility and the E2/E3 coherent hypercover descent equivalence to glue the locally defined functors and units. Check the mapping-space adjunction locally and descend it. Fullness gives idempotence. The enhanced descent of the adjunction, beyond the source’s triangulated formulation, is specified as a required interface.

Required API:

- **completeSheaf**: The reflector L_I and its unit η_K:K→L_I K.
- **completeSheaf_map**: Completion sends maps to maps, preserving identity and composition coherently.
- **completeSheaf_mapEquiv**: For complete L, Map(L_I K,L)≃Map(K,L), induced by η_K.
- **completeSheaf_restrict**: Restricting L_I K to X/U agrees with completing K|U for I|U.
- **completeSheaf_idempotent**: The unit L_I K→L_I L_I K is an equivalence.

Unit tests:

- **completeSheaf_zeroIdeal**: For I=0 the reflector and its unit are the identity.
- **completeSheaf_inverted**: For X=Set, completion of ℤ[1/p] along (p) is zero.
- **completeSheaf_integer**: For X=Set the derived (p)-completion of ℤ[0] is ℤ_p[0].
- **completeSheaf_alreadyComplete**: For any complete K the unit K→L_I K is an equivalence.

Uses: `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`: Complete the ambient derived tensor product; `EnhancedDerivedSheaves:E4/completed-colimits`: Complete ambient colimits; `EnhancedDerivedSheaves:E4/reconstruction-unit`: Recognize the inverse-limit unit.

Direct inputs: `EnhancedDerivedSheaves:E4/derived-complete-sheaves`, `EnhancedDerivedSheaves:E4/local-generator-criterion`, `EnhancedDerivedSheaves:E4/complete-sheaves-limits`, `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E3/point-free-ringed-system-comparison`, `EnhancedDerivedSheaves:E3/presentable-category-limits`, `EnhancedDerivedSheaves:E2/unbounded-hypercover-descent`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.4.9, pp. 21–22.

### Kernels and cokernels of complete modules

The derived I-complete R-module sheaves, viewed in degree zero, contain zero and are closed under extensions, and under kernels and cokernels of morphisms between such modules. This is weak Serre closure. It does not assert closure under all subobjects or all quotients in Mod_R(X).

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; size universes are fixed. R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified. D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

Construction or proof: For f:M→N between complete modules, apply T to the triangle ker(f)[1]→[M→N]→coker(f). The middle telescope is zero. Repleteness gives cohomological amplitude [0,1] for Rlim on degree-zero towers. The left and right terms lie on opposite sides of the t-structure; their shifted identification forces both to vanish. Repeat on every slice. Exactness of T gives extension closure.

Direct inputs: `EnhancedDerivedSheaves:E4/derived-complete-sheaves`, `EnhancedDerivedSheaves:E4/complete-sheaves-limits`, `EnhancedDerivedSheaves:E2/inverse-limit-amplitude`, `EnhancedDerivedSheaves:E2/replete-slice`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.4.14 and its proof, p. 23.

Acceptance: For X=Set, R=ℤ, I=(2), ℤ₂ is derived complete but its submodule ℤ is not; do not construct an IsSerreClass instance. The statement concerns kernels and cokernels of maps whose two endpoints are complete.

### Completeness of cohomology sheaves

A complex K∈D(X,R) is derived I-complete if and only if every H^m(K), m∈ℤ, is a derived I-complete module sheaf.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; size universes are fixed. R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified. D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

Construction or proof: If the cohomology modules are complete, finite truncations are complete by extensions. E2 left completeness identifies each bounded-above truncation with the limit of its finite truncations. Applying T to the upper-truncation triangles then makes T(K,x) arbitrarily connective, hence zero by nondegeneracy. Conversely use the Rlim amplitude bound in the truncation triangles to prove completeness of the relevant truncations and their degree-zero cohomology. Shift and repeat on all slices.

Direct inputs: `EnhancedDerivedSheaves:E4/derived-complete-sheaves`, `EnhancedDerivedSheaves:E4/complete-sheaves-limits`, `EnhancedDerivedSheaves:E4/complete-module-weak-serre`, `EnhancedDerivedSheaves:E2/left-completion`, `EnhancedDerivedSheaves:E2/inverse-limit-amplitude`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.4.4, p. 21; full proof on p. 23.

Acceptance: All integer cohomological degrees are quantified. Completeness is stable under good truncation and shift.

### Classical and derived completeness

For an R-module sheaf M, the canonical map M→lim_n M/I^nM is an isomorphism if and only if M[0] is derived I-complete and M is I-adically separated, meaning that the intersection of the subsheaves I^nM is zero.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; size universes are fixed. R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified. D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

Construction or proof: Classical completeness expresses M as the ordinary limit of its epimorphic quotient tower. Repleteness identifies this with the derived limit, and nilpotent quotients are complete. Conversely use DD.1’s derived Koszul-tower formula locally, apply the E2 Milnor exact sequence in degree zero and identify H⁰ of each Koszul reduction. The resulting map to the classical completion is surjective. Separatedness makes it injective. Descend the isomorphism.

Direct inputs: `EnhancedDerivedSheaves:E4/derived-complete-sheaves`, `EnhancedDerivedSheaves:E4/complete-sheaves-limits`, `EnhancedDerivedSheaves:E4/local-generator-criterion`, `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.4.2 and Remark 3.4.3, p. 21; Lemma 3.4.13, p. 23; proof of 3.4.2, p. 24.

Acceptance: For X=Set, the left side is the condition represented by pinned IsAdicComplete; the carrier AdicCompletion is classical. Do not identify all degree-zero derived complete modules with classically complete modules.

### Complete internal Hom

For K∈D(X,R) arbitrary and L∈Dcomp(X,R,I), the internal derived Hom RHom_R(K,L) is derived I-complete.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; size universes are fixed. R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified. D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

Construction or proof: For every local x, commute the homotopy limit defining T through internal Hom in its second variable: T(RHom(K,L),x)≃RHom(K,T(L,x)). Apply the same identity on every slice, using the internal-Hom restriction comparison and completeness of L.

Direct inputs: `EnhancedDerivedSheaves:E4/derived-complete-sheaves`, `EnhancedDerivedSheaves:E2/coherent-towers-and-roos`, `EnhancedDerivedSheaves:E2/tower-milnor`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.4.11, p. 22.

Acceptance: Taking K=R recovers completeness of L. The proof does not assert tensor products of complete objects are automatically complete.

### Completed sheaf tensor product

For K,L∈Dcomp(X,R,I), define K⊗̂_R L=L_I(K⊗ᴸ_R L). This is the sheaf application of DD.1’s completed tensor construction, using the E1 derived sheaf tensor and the sheaf reflector.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; size universes are fixed. R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified. D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

Construction or proof: Apply the ambient derived tensor bifunctor and then the reflector. Transport functoriality along these two functors. Symmetric monoidal coherence and the unit L_I R require the monoidal-localization input recorded below, not merely the object formula.

Required API:

- **completedSheafTensor**: The bifunctor (K,L)↦L_I(K⊗ᴸ_R L).
- **completedSheafTensor_map**: Pairs of maps induce maps of completed tensors, with identity and composition laws.
- **completedSheafTensor_comparison**: The unit of completion gives K⊗ᴸ_R L→K⊗̂_R L.
- **completedSheafTensor_unit**: After proving the monoidal-localization comparison, L_I R is the tensor unit.

Unit tests:

- **completedSheafTensor_zero**: Tensoring either variable with zero gives zero.
- **completedSheafTensor_zeroIdeal**: For I=0 it is the ambient derived tensor.
- **completedSheafTensor_torsion**: For X=Set, R=ℤ_p, I=(p), the tensor of two copies of ℤ/p[0] has H⁰=ℤ/p and H^(−1)=ℤ/p and no other cohomology; completion leaves it unchanged.

Uses: `EnhancedDerivedSheaves:E4/completed-tensor-hom-adjunction`: Closed tensor/Hom adjunction; `AdicCoefficientsAndComparisons:L0`: Uses this tensor on its étale full subcategory after verifying closure.

Direct inputs: `EnhancedDerivedSheaves:E4/the-imported-completion-interface`, `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E1/coefficient-change-and-perfect-action`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Definition 3.4.10, p. 22.

### Completed tensor and Hom adjunction

For K,K′,L∈Dcomp(X,R,I), the ambient tensor/Hom adjunction and the completion unit give Map(K′⊗̂_R K,L)≃Map(K′,RHom_R(K,L)), where the internal Hom belongs to Dcomp.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; size universes are fixed. R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified. D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

Construction or proof: Apply the completion adjunction to the complete target L. Apply E1’s mapping-space tensor/Hom adjunction and the full-subcategory inclusion. Use complete-internal-hom to identify its target with an object of Dcomp.

Direct inputs: `EnhancedDerivedSheaves:E4/completed-sheaf-tensor`, `EnhancedDerivedSheaves:E4/complete-internal-hom`, `EnhancedDerivedSheaves:E4/the-imported-completion-interface`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.4.11, p. 22.

Acceptance: The equivalence is natural in all three variables. The internal-Hom argument does not require compactness of K.

### Compatible coefficient systems

Define Sys_I(X,R) as the limit of the enhanced categories D(X,R_n), with transition functors −⊗ᴸ_{R_{n+1}}R_n. Equivalently, use the full category of coCartesian sections of their classifying fibration over the positive inverse integers. An object consists of K_n∈D(X,R_n), equivalences K_{n+1}⊗ᴸ_{R_{n+1}}R_n≃K_n and all composition coherences. An ordinary inverse limit of homotopy categories is not this category.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X. I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed. Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.

Construction or proof: Use E1’s coherent derived coefficient-change functors. Apply the E3 enhanced category-limit/coCartesian-section construction. Its comparison with the Cartesian objects in the derived category of the ringed diagram topos is an explicit required comparison input.

Required API:

- **CompatibleCoefficientSystems**: The limit category of the coefficient-change diagram.
- **coefficientSystem_eval**: Evaluation at n gives an object of D(X,R_n).
- **coefficientSystem_transition**: The specified derived reduction equivalence at each successor, with coherent composites.
- **coefficientSystem_mapEquiv**: A map of systems is an equivalence exactly when every component is an equivalence.

Unit tests:

- **coefficientSystem_zero**: The all-zero coherent system is the zero object.
- **coefficientSystem_unit**: The objects R_n[0], with the canonical base-change equivalences, form a system.
- **coefficientSystem_notUnderived**: For X=Set, R=ℤ_p and I=(p), the tower having ℤ/p[0] at every n with identity underlying transitions is not a compatible derived coefficient system: reduction from ℤ/p² to ℤ/p has nonzero higher Tor.

Uses: `EnhancedDerivedSheaves:E4/coefficient-reduction`: Target of the reductions functor; `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`: Input of the inverse-limit functor.

Direct inputs: `EnhancedDerivedSheaves:E3/point-free-ringed-system-comparison`, `EnhancedDerivedSheaves:E3/presentable-category-limits`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Definition 3.5.3, p. 24; Lemma 3.5.7, pp. 25–26.

Source: [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4), Proposition 26.2 and proof, p. 162.

### Coefficient reduction functor

Define Red:Dcomp(X,R,I)→Sys_I(X,R) by Red(K)_n=K⊗ᴸ_R R_n. Derived associativity supplies the transition equivalences and their coherences.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X. I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed. Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.

Construction or proof: For each n apply derived extension of scalars. Use (K⊗ᴸ_R R_{n+1})⊗ᴸ_{R_{n+1}}R_n≃K⊗ᴸ_R R_n and the associative coherence of the E1 monoidal enhancement.

Required API:

- **coefficientReduction**: The reduction functor Red.
- **coefficientReduction_eval**: Evaluation at n is −⊗ᴸ_R R_n.
- **coefficientReduction_map**: A map K→L gives compatible derived reductions, respecting identity and composition.

Unit tests:

- **coefficientReduction_zero**: Red(0) is the zero system.
- **coefficientReduction_zeroIdeal**: For I=0 it is the constant system with identity transitions.
- **coefficientReduction_tor**: For X=Set, R=ℤ_p and K=ℤ/p[0], every derived reduction modulo p^n has cohomology ℤ/p in degrees 0 and −1. It is not the underived constant tower ℤ/p[0].

Uses: `EnhancedDerivedSheaves:E4/reconstruction-unit`: Builds the unit tower; `EnhancedDerivedSheaves:E4/coefficient-system-reconstruction`: One direction of the equivalence.

Direct inputs: `EnhancedDerivedSheaves:E4/derived-complete-sheaves`, `EnhancedDerivedSheaves:E4/compatible-coefficient-systems`, `EnhancedDerivedSheaves:E3/point-free-ringed-system-comparison`, `EnhancedDerivedSheaves:E3/presentable-category-limits`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.5.7, p. 25.

Source: [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4), Proposition 26.2, p. 162.

### Inverse limit of a coefficient system

Define Rec:Sys_I(X,R)→Dcomp(X,R,I) by Rec(K_•)=Rlim_n K_n after restriction of each coefficient ring to R. The coherent underlying transitions come from the unit to reduction followed by the specified system equivalence.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X. I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed. Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.

Construction or proof: Construct the underlying R-linear coherent tower. Each K_n is I^n-annihilated as an R_n-module object; the nilpotent telescope criterion makes it complete. Take its homotopy limit and apply complete-sheaves-limits.

Required API:

- **reconstructCoefficientSystem**: The inverse-limit functor Rec.
- **reconstructCoefficientSystem_projection**: The compatible projection Rec(K_•)→K_n as an R-linear map.
- **reconstructCoefficientSystem_map**: A coherent map of systems induces a map of their homotopy limits.
- **reconstructCoefficientSystem_complete**: The result satisfies every slice telescope test.

Unit tests:

- **reconstructCoefficientSystem_zero**: The zero system reconstructs zero.
- **reconstructCoefficientSystem_padic**: For X=Set, R=ℤ_p, the system ℤ/p^n[0] reconstructs ℤ_p[0].
- **reconstructCoefficientSystem_zeroIdeal**: For I=0 the coherent constant system at K reconstructs K.

Uses: `EnhancedDerivedSheaves:E4/reconstruction-counit`: Construct the reduction of the inverse limit; `EnhancedDerivedSheaves:E4/coefficient-system-reconstruction`: Inverse direction of the equivalence.

Direct inputs: `EnhancedDerivedSheaves:E4/compatible-coefficient-systems`, `EnhancedDerivedSheaves:E4/complete-sheaves-limits`, `EnhancedDerivedSheaves:E2/coherent-towers-and-roos`, `EnhancedDerivedSheaves:E2/tower-milnor`, `EnhancedDerivedSheaves:E3/point-free-ringed-system-comparison`, `EnhancedDerivedSheaves:E3/presentable-category-limits`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proof of Lemma 3.5.7, p. 25.

### Pro-Tor coefficient comparison

For a coherent system of complexes K_n of R_n-modules under the regular-sequence hypotheses, the change-of-rings maps induce a pro-equivalence {K_n⊗ᴸ_R R/I}→{K_n⊗ᴸ_{R_n}R/I}, and hence an equivalence of their homotopy inverse limits. The complexes may be unbounded.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X. I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed. Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.

Construction or proof: Import from DD.1 the cofinality of J_n=(f₁^n,…,fᵣ^n) and I^n and the uniformly bounded perfect Koszul resolutions for R/J_n. Use the strict pro-Tor comparison from DD.1. Its uniform finite amplitude, not a boundedness assumption on K_n, is what permits tensoring with the varying unbounded complexes. Apply the E2 derived inverse-limit comparison for these pro-zero error towers. This pro-descent input remains an explicit gap rather than being inferred from the word “pro”.

Direct inputs: `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E2/coherent-towers-and-roos`, `EnhancedDerivedSheaves:E2/tower-milnor`, `EnhancedDerivedSheaves:E3/point-free-ringed-system-comparison`, `EnhancedDerivedSheaves:E3/presentable-category-limits`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E2/pro-zero-derived-limit`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.5.4 and regular-ideal paragraph, p. 25.

Source: [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4), Proof of Proposition 26.2, p. 162.

Acceptance: Uniform amplitude is independent of n. Do not apply the general noetherian bounded-above argument to an arbitrary unbounded system.

### Reduction of the reconstructed limit

For K_•∈Sys_I(X,R) and every k≥1, the canonical map (Rlim_n K_n)⊗ᴸ_R R/I^k→K_k is an equivalence.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X. I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed. Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.

Construction or proof: For k=1, R/I is perfect over R by the finite regular sequence, so tensoring with it commutes with Rlim. Apply coefficient-pro-tor-comparison; compatibility identifies the tower {K_n⊗ᴸ_{R_n}R/I} with the constant coherent tower K₁. For general k, use the exact sequences with successive quotients I^j/I^(j+1). DD.1 supplies their finite-free R/I description and the coherent devissage of the comparison map. Induct on k. This proves equivalence of every counit component; E3 must supply the natural transformation with its coherences.

Direct inputs: `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`, `EnhancedDerivedSheaves:E4/coefficient-pro-tor-comparison`, `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E2/coherent-towers-and-roos`, `EnhancedDerivedSheaves:E2/tower-milnor`, `EnhancedDerivedSheaves:E3/point-free-ringed-system-comparison`, `EnhancedDerivedSheaves:E3/presentable-category-limits`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E2/pro-zero-derived-limit`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.5.5 and proof, p. 25.

Acceptance: I^k is not assumed to be generated by a regular sequence. For R=k[[x,y]], I=(x,y), the case k=2 must work even though I² has three minimal generators and is not a regular-sequence ideal.

### Recovery from derived reductions

For K∈Dcomp(X,R,I), the canonical map K→Rlim_n(K⊗ᴸ_R R/I^n) is an equivalence under the finite regular-sequence hypotheses.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X. I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed. Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.

Construction or proof: DD.1 supplies the derived Koszul completion formula and, under the regular-sequence hypothesis, its comparison with ordinary quotient-ring reductions. Apply this comparison locally in the sheaf category and use restriction compatibility to identify the resulting unit with the displayed map. Use that the completion unit is an equivalence on complete objects.

Direct inputs: `EnhancedDerivedSheaves:E4/coefficient-reduction`, `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`, `EnhancedDerivedSheaves:E4/the-imported-completion-interface`, `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E2/coherent-towers-and-roos`, `EnhancedDerivedSheaves:E2/tower-milnor`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E2/pro-zero-derived-limit`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Proposition 3.5.1, p. 24; Lemma 3.5.7(2), p. 25.

Source: [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4), Proof of Proposition 26.2, p. 162.

Acceptance: For nonregular ideals an additional valid comparison hypothesis is required. For X=Set this is DD.1’s algebraic comparison, not a new generic completion construction.

### Completed coefficient sheaf comparison

Let R̂_X=lim_n(R/I^n)_X in X. Then R̂_X⊗ᴸ_R R/I^k≃R/I^k for all k≥1, and restriction of scalars identifies the full derived I-complete subcategories for R̂_X and for the constant ring object R. Even when R is I-adically complete as an ordinary ring, the constant ring sheaf R_X need not equal R̂_X.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X. I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed. Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.

Construction or proof: Apply reconstruction-counit to the system R_n[0]. Repleteness makes its ordinary epimorphic limit agree with its derived limit. Apply the derived scalar-change adjunction. Its unit and counit are equivalences after all reductions, using the quotient comparison just proved. Use DD.1’s conservativity of reductions on complete objects, extended locally to sheaves.

Direct inputs: `EnhancedDerivedSheaves:E4/reconstruction-counit`, `EnhancedDerivedSheaves:E4/reconstruction-unit`, `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E2/surjective-system-derived-limit`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Definition 3.5.2, p. 24; Lemma 3.5.6, p. 25.

Acceptance: For X=Set and R already complete, R̂_X=R. The equality of constant and completed coefficient sheaves is not assumed on a general topos.

### Coefficient-system reconstruction

For a replete topos X and a commutative ring R with I generated by a finite regular sequence (also allowing I=0), Red and Rec give an equivalence of stable enhanced categories Dcomp(X,R,I)≃lim_n D(X,R/I^n). No Noetherianity or boundedness is required. By completed-coefficient-ring the same complete category can be expressed using R̂_X. In particular this applies to I-adically complete nonnoetherian coefficient rings Λ; the additional étale subcategory is the responsibility of L0.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X. I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed. Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.

Construction or proof: E3 supplies the enhanced diagram-category identification and the reduction/inverse-limit adjunction. The reconstruction-unit and reconstruction-counit lemmas make both coherent transformations equivalences. Apply the enhanced equivalence criterion. Do not deduce this result merely from an equivalence of homotopy categories.

Direct inputs: `EnhancedDerivedSheaves:E4/coefficient-reduction`, `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`, `EnhancedDerivedSheaves:E4/reconstruction-unit`, `EnhancedDerivedSheaves:E4/reconstruction-counit`, `EnhancedDerivedSheaves:E4/completed-coefficient-ring`, `EnhancedDerivedSheaves:E3/point-free-ringed-system-comparison`, `EnhancedDerivedSheaves:E3/presentable-category-limits`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.5.7, pp. 25–26.

Source: [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4), Proposition 26.2 and proof, p. 162.

Acceptance: For I=0 the diagram is constant with identity transitions and the equivalence is the identity. For R=(∏_{m≥0}𝔽_p)[[t]] and I=(t), R is complete, nonnoetherian and t is a non-zero-divisor; the theorem still applies. Retain the uniform Tor-amplitude and coherent diagram inputs as unresolved leaves until their suppliers are decomposed.

### Colimits of complete sheaves

For a small enhanced diagram F:J→Dcomp(X,R,I), its colimit is L_I(colim_J iF), where i is the full inclusion. Thus Dcomp has small colimits. This formula does not assert that i preserves them.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; size universes are fixed. R is a commutative ring object and I is a locally finitely generated ideal unless a constant coefficient ring is specified. D(X,R) denotes the enhanced unbounded derived category supplied by E1, with cohomological grading.

Construction or proof: For complete L, the reflector adjunction identifies Map(L_I colim iF,L) with Map(colim iF,L). The ambient colimit universal property identifies this with lim_j Map(F_j,L), giving the required colimit in the full subcategory.

Direct inputs: `EnhancedDerivedSheaves:E4/the-imported-completion-interface`, `EnhancedDerivedSheaves:E3/point-free-ringed-system-comparison`, `EnhancedDerivedSheaves:E3/presentable-category-limits`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [The pro-étale topology for schemes](https://people.mpim-bonn.mpg.de/scholze/proetale.pdf), Lemma 3.4.9, pp. 21–22.

Source: [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4), Proposition 26.2, p. 162.

Acceptance: For X=Set and R=ℤ_p, the colimit of ℤ_p --p→ ℤ_p --p→ ⋯ is ℚ_p in D(R), but is zero in Dcomp(R,(p)). In the zero-ideal case the formula is the ordinary colimit.

### Perfect coefficient change for exact functors

Let C,D be stable R-linear enhanced categories with their compatible Perf(R)-actions, and let F:C→D be an exact functor with coherent R-linear structure. For every perfect R-complex P and K∈C there is a natural equivalence F(K⊗_R P)≃F(K)⊗_R P. In particular this holds for P=R/I^n under the finite regular-sequence hypotheses. Comparing to a separately defined finite-level functor additionally requires identification of that functor with this scalar extension; exactness of an arbitrary right adjoint alone is not enough.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. Stable enhanced R-linear categories and a coherent exact R-linear functor, with compatible actions of perfect R-complexes. For the quotient application, I is generated by a finite regular sequence. No assertion is made that I^n is a regular-sequence ideal.

Construction or proof: For P=R, and for finite sums and shifts of R, use the coherent R-linear structure and exactness. Extend across finite cofibres and retracts to all perfect complexes, with naturality from the Perf(R)-action. DD.1 supplies perfection of R/I from the Koszul resolution and of all R/I^n by the filtration with finite-free R/I graded pieces. L0 verifies the hypotheses and the finite-level identifications for each six-operation functor separately.

Direct inputs: `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E3/point-free-ringed-system-comparison`, `EnhancedDerivedSheaves:E3/presentable-category-limits`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`, `EnhancedDerivedSheaves:E1/coefficient-change-and-perfect-action`.

Source: [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4), Remark 26.3, p. 162.

Acceptance: Check the argument for a two-term perfect complex as preservation of its cofiber. A right adjoint that has not been shown R-linear with the required coherent action does not satisfy the hypotheses. No geometric six-operation construction is duplicated in E4.

### Equivalences detected modulo the ideal

A map f:K→L of derived I-complete sheaves is an equivalence if and only if f⊗ᴸ_R R/I is an equivalence, under the finite regular-sequence hypotheses.

Hypotheses and conventions: X is a replete Grothendieck topos presented by a small site and R is a commutative coefficient sheaf; I is locally finitely generated. For coefficient reconstruction and reductions R/I^n, R is a constant commutative ring and I has a finite regular generating sequence, including the empty sequence for I=0. X is a replete Grothendieck topos; R is a commutative ring, used as a constant ring object on X. I=(f₁,…,fᵣ) is generated by a finite regular sequence in R. No Noetherian hypothesis is imposed. The case I=0 is also allowed. Indices n range over positive integers, R_n=R/I^n. All tensors are derived. Enhancement, coherent diagrams and homotopy limits are supplied by E0–E3.

Construction or proof: Take the complete cofiber C of f. If C⊗ᴸ_R R/I=0, devissage using the finite-free graded pieces I^j/I^(j+1) gives C⊗ᴸ_R R/I^n=0 for every n. Reconstruction-unit gives C=0. The converse follows by functoriality.

Direct inputs: `EnhancedDerivedSheaves:E4/derived-complete-sheaves`, `EnhancedDerivedSheaves:E4/complete-sheaves-limits`, `EnhancedDerivedSheaves:E4/reconstruction-unit`, `DerivedDeRhamCohomology:DD.1`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`, `EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: [Étale cohomology of diamonds](https://arxiv.org/pdf/1709.07343v4), Remark 26.3, p. 162.

Acceptance: The completeness assumption cannot be dropped: 0→ℚ_p over ℤ_p becomes an equivalence modulo p, but is not an equivalence before reduction. The zero test is for derived reduction, not ordinary module quotient.

## Required cross-roadmap interfaces

**DiamondsAndVStacks:D0**. Ordinary coherent-site/topos and slice interfaces: free module-sheaf generators and their extensions by zero; exact/filtered-colimit section computations; ordinary scheme-perfection, quasicoherence, h-cover refinements and cohomology of structure sheaves under proper modifications. E1 owns derived functors and E2 owns coherent Rlim/Milnor. Reuse D0 nodes when their statements match; do not rebuild pinned SheafOfModules.

**EnhancedDerivedSheaves:E5:abstract**. Only quantitative descendability and generic module-descent for a commutative algebra map whose fibre becomes tensor-nilpotent (BS Witt §§11.2–11.3, Theorem 11.15). E2 consumes this for h-Čech effectivity. Extract an acyclic declaration-level interface depending on E0/E1 foundations, without importing geometric h-descent back into its own proof. General monoidal/operadic, animation and Ind theories remain E5-owned.

**tauceti:TauCetiRoadmap/DGAInfinity#layer-1-dg-algebras-categories-modules-and-bimodules**. The general small DG-category carrier, degree-zero homology category and DG functors; import the existing upstream roadmap, not a second private DG carrier.

**tauceti:TauCetiRoadmap/DGAInfinity#layer-0-signed-graded-multilinear-and-tensor-coalgebra-infrastructure**. Reindexing from cohomological to homological grading and the Koszul-braiding comparison between enriched composition factor orders; the existing enrichment is cited separately.

**DerivedDeRhamCohomology:DD.1**. Import generic module completion and its telescope/Koszul criterion, localization orthogonality, generator independence, reflector and tensor compatibility. For a finite regular sequence in an arbitrary commutative ring, supply cofinality of (f₁^n,…,fᵣ^n) and I^n, uniform perfect Koszul resolutions, the strict pro-Tor comparison compatible with varying unbounded coefficient complexes, comparison of Koszul completion with Rlim of ordinary quotient-ring reductions, gr_I R≃(R/I)[T₁,…,Tᵣ], perfection of R/I^n, and derived-complete reduction conservativity. Keep these generic algebraic declarations in DD.1; none is constructed afresh in E4.

## Source conventions and corrected statements

HTT locators above use PDF pages in the author copy dated 9 April 2017; its main printed pagination is 18 pages lower. HA and the Bhatt–Scholze author papers use their printed page numbers. Stacks chapter references specify chapter and tag as well as PDF pagination.

**The pro-étale topology for schemes, Author copy SHA-256 99b418…14c7, Proposition 3.3.3, p. 19, essential-surjectivity paragraph and product display.** Treat each cohomological degree m∈ℤ. The tower H^m(K_n) stabilizes for n≥max(0,−m); apply the product-difference/Milnor calculation to its eventual constant tail. Do not identify the full product with the tail by dropping a finite prefix. Checking only nonnegative i misses every negative cohomology group. The completion tower of A[1] has nonzero H^(−1). Moreover the displayed equality dropping factors with n<i is not justified: for the constant tower A[−1] and i=1 the omitted first H¹ factor is A, and the projection dropping it is not injective. The corrected argument uses eventual constancy separately in m and m−1 and proves the intended theorem.

**The pro-étale topology for schemes, Author copy SHA-256 99b418…14c7, Proposition 3.3.7(2), p. 20. Published target pages unavailable.** For the fixed complex K in the statement, conclude K≃Rlim τ≥−nK under a precise local bound uniform over its negative cohomology sheaves. To conclude that the category is left-complete, require the convergence condition for every complex, and verify reconstruction of compatible towers. The printed premise quantifies only the cohomology sheaves of one fixed K. Taking K=0 satisfies it in every topos, whereas Example 3.3.4 in the same author copy gives a topos with a non-left-complete derived category. Stacks 0D6P supplies the correctly quantified site-level object statement. The packet uses that statement and does not infer a category-wide theorem from one K.

**Projectivity of the Witt vector affine Grassmannian, Author PDF Witt.pdf, SHA-256 774032…7e7b64, proof of Lemma 3.18, p. 15, final derived-tensor display.** With X=Spec A, Y=Spec B, Y′=Spec B′ and X′=Spec A′, use A⊗ᴸ_B B′≃A′. Then K⊗ᴸ_A A′≃K⊗ᴸ_B B′ by derived tensor associativity. The given morphism of schemes supplies B→A and B→B′; it supplies no A-module structure on B. Lemma 3.16 applies to the actual span A←B→B′. Visual inspection of the PDF confirms that this is not text-extraction reordering.

## Existing library interfaces

Each item below is a baseline dependency. The associated new targets concern its enhanced comparison or its application with the specified additional hypotheses.

- [mathlib:CategoryTheory.Abelian](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/Basic.lean#L112): Abelian categories. The module sheaves form one, and the derived category is built from it.
- [mathlib:CategoryTheory.CountableAB4Star](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/Basic.lean#L280): Countable AB4*, at the pins, which is what makes the light-condensed instance work. It is the ordinary form of the exactness of countable products that Bhatt-Scholze 3.1.9 proves for replete topoi.
- [mathlib:CategoryTheory.Functor](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Functor/Basic.lean#L40): Functors. The ordinary notion the comparison discipline refers back to.
- [mathlib:CategoryTheory.Functor.IsLeftKanExtension](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Functor/KanExtension/Basic.lean#L171): Left Kan extensions with their universal property, at the pins, for ordinary categories, together with the pointwise versions and the fully faithful case. The ordinary shadow of HTT 4.3.2.
- [mathlib:CategoryTheory.Grothendieck](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Grothendieck.lean#L73): The Grothendieck construction, at the pins. This is the ordinary shadow of the restricted straightening comparison.
- [mathlib:CategoryTheory.GrothendieckTopology](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Grothendieck.lean#L72): Grothendieck topologies, at the pins; the sites of this family are instances.
- [mathlib:CategoryTheory.GrothendieckTopology.OneHypercover](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Hypercover/One.lean#L909): Degree-one hypercovers used for the sheaf condition; E2 extends their matching-object interface to all simplicial degrees.
- [mathlib:CategoryTheory.HasShift](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Shift/Basic.lean#L64): Shift functors, at the pins. The suspension of the enhancement must be identified with the cochain shift, with this convention.
- [mathlib:CategoryTheory.IsGrothendieckAbelian](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean#L70): The Grothendieck axioms, at the pins, with an instance for sheaves of modules on small sites. That instance supplies the generator, the exactness of filtered colimits and enough injectives that the transfinite K-injective construction needs.
- [mathlib:CategoryTheory.Limits.Cocone](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Cones.lean#L133): Cocones. The mapping-space universal property of a colimit is a statement about the space of cocones.
- [mathlib:CategoryTheory.Limits.HasFilteredColimits](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Filtered.lean#L92): Filtered colimits, at the pins. Compact generation, accessibility and the transfinite constructions all rest on them.
- [mathlib:CategoryTheory.Limits.HasLimits](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/HasLimits.lean#L151): Existence of limits. Totalisations, inverse limits of Postnikov towers and homotopy fixed points are limits.
- [mathlib:CategoryTheory.Limits.HasZeroObject](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Shapes/ZeroObjects.lean#L174): Zero objects, the first condition of stability.
- [mathlib:CategoryTheory.Limits.PreservesLimits](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Preserves/Basic.lean#L90): Preservation of limits. Exactness of a functor between stable categories is preservation of finite limits.
- [mathlib:CategoryTheory.MonoidalCategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Category.lean#L162): The 1-categorical monoidal structure; the derived tensor product's symmetric monoidal coherence is compared against it.
- [mathlib:CategoryTheory.Nerve.quasicategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/Quasicategory/Nerve.lean#L32): That the nerve of an ordinary category is a quasicategory, at the pins. This is the comparison every ordinary construction is compared against.
- [mathlib:CategoryTheory.Preadditive](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Preadditive/Basic.lean#L63): Preadditive categories. The DG categories whose nerves are taken are preadditive, and Tau Ceti's enrichment of cochain complexes is over them.
- [mathlib:CategoryTheory.Pretriangulated](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean#L65): Pretriangulated categories, at the pins, with the structure on the homotopy category of complexes. The sign comparison of E0 is made against this structure.
- [mathlib:CategoryTheory.Sheaf](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Sheaf.lean#L301): Sheaves on a site, at the pins.
- [mathlib:CategoryTheory.Triangulated.TStructure](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean#L55): t-structures, at the pins, including the canonical one on D(A). The truncations of the Postnikov tower are taken with it.
- [mathlib:CategoryTheory.Triangulated.TStructure.eTruncGE](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/TStructure/ETrunc.lean#L85): The ordinary truncation tower, together with eTruncLT; E2 compares it with coherent Postnikov towers and their derived limits.
- [mathlib:CategoryTheory.coherentTopology.epi_π_app_zero_of_epi](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/Coherent/SequentialLimit.lean#L113): Sequential limit epimorphisms for a particular topos: a sequential limit of epimorphisms of sheaves is epimorphic, for the coherent topology on a preregular finitary extensive category whose sequential limits preserve effective epimorphisms. An instance of Bhatt-Scholze's Definition 3.1.1, not the general notion.
- [mathlib:CategoryTheory.mateEquiv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Adjunction/Mates.lean#L84): The ordinary functor-adjunction mate correspondence. The separate Bicategory.mateEquiv supplies the general bicategorical version, which already applies to QCat.
- [mathlib:CochainComplex.IsKInjective](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean#L42): K-injective complexes with right-orthogonality and derived-Hom detection. E1 supplies the unbounded functorial replacement and its model comparison.
- [mathlib:CommRing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Ring/Defs.lean#L414): Commutative rings. The coefficient rings Lambda and their quotients Lambda/I^n.
- [mathlib:DerivedCategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean#L87): The ordinary unbounded derived category, at the pins, as a 1-categorical localisation, triangulated. It is the category the enhancement's homotopy category must be identified with - the comparison the stage text demands instead of a second private carrier.
- [mathlib:DerivedCategory.isIso_Q_map_iff_quasiIso](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean#L283): That a morphism of complexes becomes an isomorphism in D(A) iff it is a quasi-isomorphism. The other half.
- [mathlib:DerivedCategory.isIso_iff](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean#L88): That a morphism of D(A) is an isomorphism iff it induces isomorphisms on all cohomology objects - cohomology sheaves when A is a sheaf category. One half of the detection package the comparison is made against.
- [mathlib:LightCondensed.epi_π_app_zero_of_epi](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Condensed/Light/Epi.lean#L109): The corresponding sequential epimorphism theorem for light condensed modules.
- [mathlib:Module.Flat](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean#L113): Flatness. The K-flat model is the flat resolution the derived tensor product is computed on.
- [mathlib:RingTheory.Sequence.IsRegular](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Regular/RegularSequence.lean#L146): REGULAR SEQUENCES, at the pins. The reconstruction theorem of E4 carries a regular-sequence hypothesis, and AUDIT-22 records that only classical adic completion and regular sequences exist, the Koszul complex being a Mathlib TODO.
- [mathlib:SSet](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean#L36): Simplicial sets, the carrier of every infinity-category here and of the dg nerve.
- [mathlib:SSet.InnerFibration](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/Quasicategory/InnerFibration.lean#L72): Inner fibrations, at the pins. The relative form of the quasicategory condition, and the setting of HTT's relative left Kan extensions.
- [mathlib:SSet.QCat.bicategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/Quasicategory/StrictBicategory.lean#L66): The HOMOTOPY 2-CATEGORY of quasicategories, at the pins. AUDIT-22 records that equivalences can be expressed in it through Bicategory.Equivalence, which is the shape the missing equivalence API should take.
- [mathlib:SSet.QCat.strictBicategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/Quasicategory/StrictBicategory.lean#L70): The strict form of the same, at the pins.
- [mathlib:SSet.Quasicategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/Quasicategory/Basic.lean#L41): QUASICATEGORIES, at the pins. The model this whole family fixes. The file itself records the universe restriction as a TODO, which is why extended universe support is E0's own obligation.
- [mathlib:SSet.quasicategory_iff_innerFibration](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/Quasicategory/InnerFibration.lean#L78): The comparison between the absolute and relative conditions, at the pins.
- [mathlib:SheafOfModules](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf.lean#L33): SHEAVES OF MODULES over a sheaf of rings, at the pins. AUDIT-22 marks E1's first target 'mathlib' outright on the strength of this and the next declaration, and notes that it is MORE GENERAL than the constant coefficient ring the stage asks for.
- [mathlib:SheafOfModules.restrictScalars](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf/ChangeOfRings.lean#L36): UNDERIVED change of coefficients, at the pins. AUDIT-22 names it as what exists; the derived version and the monoidal structure are E1's obligation.
- [mathlib:CategoryTheory.SimplicialNerve](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SimplicialNerve.lean#L191): Existing homotopy-coherent simplicial nerve of a simplicially enriched category, using enriched functors from simplicial thickenings. This is not the ordinary categorical nerve.
- [mathlib:CategoryTheory.Abelian.DoldKan.equivalence](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean#L168): Equivalence between simplicial objects of an abelian category and nonnegative chain complexes. This alone does not supply the lax monoidal comparison needed to transport enriched composition.
- [tauceti:TauCeti.linearHomComplexEnrichedCategory](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Homology/LinearHomComplex/Enrichment.lean#L126): Cochain complexes in an R-linear preadditive category enriched in cochain complexes of R-modules; enriched composition has Mathlib factor order and the Koszul braiding.
- [mathlib:CategoryTheory.ObjectProperty.IsSerreClass](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean#L47): Strong Serre closure requires closure under every subobject and quotient. It is a compatibility countercheck, not an instance supplied for derived-complete modules.
- [mathlib:SSet.KanComplex](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean#L41): The genuine all-horn fibrancy predicate on simplicial sets; Kan spaces are quasicategories by the pinned instance.
- [mathlib:CochainComplex](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomologicalComplex.lean#L157): The abbreviation HomologicalComplex C (ComplexShape.up α); for α=ℤ the differential raises cohomological degree.
- [mathlib:CategoryTheory.Bicategory.mateEquiv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Bicategory/Adjunction/Mate.lean#L146): For two bicategorical adjunctions, maps g≫l₂→l₁≫h are equivalent to maps r₁≫g→h≫r₂, with the unit/counit pasting formula. It specializes to the existing QCat bicategory.
- [mathlib:CategoryTheory.Bicategory.mateEquiv_vcomp](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Bicategory/Adjunction/Mate.lean#L214): Vertical pasting of left-adjoint squares maps to vertical pasting of their mates; supplies the finite QCat law directly.
- [mathlib:PerfectRing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Perfect.lean#L44): Bijectivity of x↦x^p, with separate characteristic/prime hypotheses; this is the perfect F_p-ring predicate, not Bass perfectness.
- [mathlib:frobeniusEquiv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Perfect.lean#L122): For a commutative semiring of exponential characteristic p with PerfectRing R p, the Frobenius ring automorphism and inverse roots.
- [mathlib:HomologicalComplex.monoidalCategory](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/Monoidal.lean#L333): The existing signed total tensor on cochain complexes, with its zero/coproduct/additive tensor hypotheses. Module complexes reuse it; no second totalization definition is needed.
- [mathlib:CategoryTheory.Tor](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Tor.lean#L44): Left derived functors of tensor in its second variable for an abelian monoidal category with projective resolutions. Tor versus Tor' and K-flat comparisons are additional interfaces, not asserted by this declaration.
- [mathlib:CategoryTheory.HasProjectiveDimensionLE](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/Projective/Dimension.lean#L52): The existing Ext-vanishing projective-dimension predicate; compare with the explicit finite free/projective resolutions before using the perfection bound.
- [mathlib:ModuleCat.projectiveDimension_eq_of_linearEquiv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/ProjectiveDimension.lean#L139): Projective dimension is invariant under a linear equivalence, including different module universes over a small ring.
- [mathlib:Bornology.IsBounded](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Bornology/Basic.lean#L99): The bounded-set predicate, used directly for submodules of a finite normed power; no private one-line bound predicate.
- [mathlib:isBounded_iff_forall_norm_le'](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Normed/Group/Bounded.lean#L72): The norm upper-bound criterion in the explicit multiplicative declaration, together with its generated additive counterpart; boundedness of a finite normed power is compared with one common coordinate bound.
- [mathlib:ValuationSubring](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/ValuationSubring.lean#L41): A subring of a field containing x or its inverse for every field element, with its commutative-ring and valuation-ring instances.
