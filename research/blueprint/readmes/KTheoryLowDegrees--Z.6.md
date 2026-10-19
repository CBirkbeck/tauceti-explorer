# Explicit K₀ — Z.6: degree-zero comparison and tests

This part identifies the **maps** between projective, vector-bundle, perfect-complex and spectrum descriptions of K₀. An abstract group isomorphism would not suffice: the comparison must carry a projective to its object class, a supported complex to its alternating class, and the Cartan map to the existing categorical Cartan map. The determinant comparison must also remember automorphisms, grading and the homotopies used for additivity.

This is a continuation of the accepted [Z.3 packet](../packets/KTheoryLowDegrees--Z.3.json), whose scope already includes 25 Z.6 targets. Their IDs are retained and imported. The [new packet](../packets/KTheoryLowDegrees--Z.6.json) gives eight refinements of their comparison contracts, not new versions of RingK0, categorical K₀, projective-bundle K-theory or a second determinant. Its `targetDisposition` accounts for all 25 earlier targets. Coverage is **planned**: the complete planning pass retains three explicit supplier gaps and four precise requests. None of these statements is claimed to be formalised.

## Conventions and owners

All rings are unital. Modules are left modules; a ring map A→B acts by B⊗_A−. Scheme statements require commutative rings. The noncommutative perfect-complex comparison uses the module category and Gillet–Waldhausen, without using Spec of a noncommutative ring. The K-spectrum is connective unless the support/localisation supplier explicitly uses its nonconnective model; degree zero agrees with the indicated idempotent-complete perfect-category K₀. No surjectivity onto the last K₀ of a general localisation sequence is assumed.

Complexes are cochain complexes. A resolution of M[0] has projectives in degrees ≤0, so a two-term resolution I→A has Euler class [A]−[I]. A global termwise formula for a perfect complex requires a given bounded vector-bundle representative. General perfect complexes use local representatives and descent. A qcqs scheme without the resolution property still has its perfect-complex determinant; the comparison from vector-bundle K₀ is not silently declared an isomorphism.

Write a graded Picard object as (L,f), line first and locally constant integer grade second. Its tensor is (L⊗M,f+g); its symmetry is the line flip multiplied by (−1)^(fg). Its components are written (f,[L]) in H⁰(X,ℤ)⊕Pic(X). Direct sum in K maps to this tensor. The ring tensor product on K₀ is a different operation: on rank–Pic components it is (r,L)(s,M)=(rs,L^s⊗M^r), including locally constant exponents on disconnected schemes. Forgetting the grade gives a homomorphism of component groups, but does not preserve the signed symmetry at the groupoid/spectrum level.

The owners are fixed as follows.

| Input | Existing owner and exact interface |
| --- | --- |
| Projective K₀ and scalar extension | `KTheoryLowDegrees:Z.1/ring-k0-exact`, `…/ring-k0-map` |
| Categorical K₀, finite resolutions, Cartan | Current **GrothendieckEulerForms**, Layers 2–4; pinned `TauCeti.ExactK0.hom_ext`, `TauCeti.moduleEulerClassOf`, `TauCeti.moduleResolutionEquiv`, `TauCeti.cartanMap` |
| Quillen object-class comparison | `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`, `…/K-groups-of-exact-categories`; the plus model remains K.2's work |
| Perfect-complex/projective comparison | `GeneralAlgebraicKTheory:K.4/gillet-waldhausen`; `SchemeKTheoryOperations:S.2/affine-k-theory-comparison`, `…/vector-bundle-k-theory-comparison`, `…/k-zero-of-a-scheme` |
| Vector-bundle geometry | Current **AlgebraicVectorBundles**, L0A–L0C: tensor and pullback, finite locally free sheaves and affine comparison, exterior powers and determinant. Its README and relevant Suggested signatures were read at current roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27`. This work is imported, never replanned here. |
| Rank–Pic coordinates and Dedekind/curve inputs | Existing Z.2, Z.4 and Z.5 nodes; in particular `Z.4/rank-pic-equivalence`, `Z.4/nonprincipal-ideal-class`, `Z.5/curve-rank-determinant-equivalence`, `Z.5/skyscraper-class` |
| Scheme Cartan | `SchemeKTheoryOperations:S.2/cartan-map`, `…/cartan-degree-zero-compatibility`; the map is compared to the pinned categorical map |
| Projective-line basis | `SchemeKTheoryOperations:S.5/projective-line-k-theory`; its proof and projective-bundle geometry stay with their owners |
| Ring support for an arbitrary multiplicative set | `GeneralAlgebraicKTheory:K.5/relative-K-theory-and-excision-boundary`; the scheme-support comparison applies when the complement is quasi-compact open |
| Signed affine determinant | Existing Z.3 `graded-line-groupoid`, `ring-spectrum-det`, `zariski-sheafified-det`, `graded-pic-v-descent` |
| Witt support and special-fibre map | `SchemeKTheoryOperations:S.3/witt-supported-perfect-complexes`, `…/witt-special-fibre-k-map` |
| Perfect scheme site and supported comparison | `SchemeKTheoryOperations:S.4/perfect-scheme-h-and-v-sites`, `…/witt-k-one-truncation-sheafification` |

The reviewed library audit was read before planning. The exact pin is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` with Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The relevant pinned Cartan source has Git blob `2fee1cb54d9c3b880174857c3bc0a4169c25ab51`, identical to the existing shared checking build. The declarations and their enclosing exact structures were read. Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` still has these maps, now in `CartanMap/Basic.lean`; it does not supply the enhanced determinant comparison planned here. No library was built.

## Imported constructions: API and discriminating tests

There are no new definition or construction nodes in this continuation. These are the three inherited Z.6 construction contracts and their required APIs. Their names remain those of the old packet; all generic support categories and sites are imported from the exact nodes above.

**`Z.6/scheme-spectrum-det`.** For qcqs X, `Det_X:K(Perf X)→Pic^ℤ(X)` is natural in derived pullback. The API `TauCeti.GradedDeterminant.scheme_spectrum_det_…` has suffixes `affine` (the specified affine comparison), `object` (E[0] maps to (det E,rk E)), `pullback` (a coherent comparison with derived pullback), `shift` (dual line and negative grade), and `triangle` (enhanced cofiber additivity, with refinement coherence). The affine maps and overlap comparisons determine the descended map, including its natural isomorphisms. This is used by the Witt extension and by the Euler/rank–Pic square; equality on component classes alone is too weak.

Checks a wrong definition must fail:

1. A line L[0] maps to (L,1), the zero complex to (O,0), and O[1] to (O,−1).
2. Swapping two rank-one summands multiplies the determinant by −1 in characteristic different from two. A determinant with ordinary unsigned symmetry fails.
3. The construction exists on the doubled affine plane, although replacing perfect K with vector-bundle K there would be invalid. The nonseparated doubled **line** is not this counterexample.
4. On a strictly perfect representative the grade and line are the alternating rank and determinant; changing to a quasi-isomorphic representative preserves the descended data.

**`Z.6/witt-supported-input`.** Its category and map α are now imported from S.3's exact Witt nodes. For a perfect F_p-algebra R, the affine category is Perf(W(R)) with complexes acyclic after p inversion. For general perfect qcqs X, W(X) is the p-adic **formal** scheme assembled from W_n(X); it is not treated as an ordinary scheme. The map α comes from restriction of scalars along W(R)→R, with R a perfect supported W(R)-complex. The API `TauCeti.GradedDeterminant.witt_supported_input_…` retains suffixes `support`, `alpha`, `object`, `natural`, `zero`. Naturality uses the specified derived base-change comparison on perfect schemes, rather than unrestricted underived tensor formulas.

Checks:

1. For perfect field k, the residue module k has the supported resolution W(k) —p→ W(k) in degrees −1,0.
2. Zero is supported; W(k)[0] is not, since it survives p inversion. This uses a nonzero field k.
3. W(k)/p² has two k graded pieces in its p-adic filtration. It is a supported input even though its W(k)-projective virtual rank is zero.
4. Pullback of a residue perfect complex agrees with restriction of scalars of its derived pullback; α sends the basepoint to the basepoint.

**`Z.6/witt-supported-det`.** The existing target is a natural `Det~:K(W(X) on X)→Pic^ℤ(X)`, together with its specified extension homotopy `Det~∘α≃Det`. The API `TauCeti.GradedDeterminant.witt_supported_det_…` has suffixes `extension`, `pullback`, `additivity`, `zero`, `unique`. The last concerns the space of **natural extending maps with their extension homotopies**. It does not assert uniqueness of every map at an individual X. Filtration comparison uses enhanced additivity paths and supplied cofiber identifications, not just a sum in K₀.

Checks:

1. α(k) maps to (k,1), whereas W(k)/p² has grade two. A construction using ordinary W(k)-rank gives zero and fails.
2. Zero maps to the graded tensor unit. The support construction supplies no value on the unsupported W(k)[0].
3. A finite-length constant W(k)-module Q gives a line pulled back from k, hence a trivializable line; its grade is length Q. This does not choose a basis or make the graded object the unit.
4. Multiplication by a nontrivial u∈k× acts on the residue determinant line. Discarding automorphisms would lose this test and invalidate the uniqueness argument.

## Comparison refinements

Each subsection below is one node of the new packet. Its short ID is appended to `KTheoryLowDegrees:Z.6/`. Earlier targets named in the packet's `refines` lists remain prerequisites. These are theorem contracts and proof plans, not an implementation diary.

### Naturality of the affine degree-zero comparison diagram

`affine-comparison-diagram`

Write c_A for the existing comparison RingK0(A) ≅ ExactK0(P(A)) ≅ π₀K(P(A)). For every unital ring map f:A→B, c_B ∘ RingK0.map(f) = π₀K(B⊗_A−) ∘ c_A. For commutative A the affine sheafification comparison and E↦E[0] identify this SAME map with K₀(Vect(Spec A))→π₀K(Perf(Spec A)); the diagram remains commutative after base change. On commutative rings all comparisons preserve tensor products and units. The noncommutative version uses perfect module complexes, without invoking Spec A.

Hypotheses. P(A) is the essentially small exact category of finite projective left A-modules with its induced split exact structure. Fix universe/small-model transports as in K.1. The scheme comparison is asserted only for commutative unital rings. No flatness of f is needed on projectives: their exact sequences split.

Proof plan. Use the old Z.1 equivalence with ExactK0 and K.1’s loop-class normalisation. Both composites on [P] give the loop class of B⊗_A P; ExactK0.hom_ext proves equality. For commutative A use S.2/affine-k-theory-comparison and the finite-projective/sheaf equivalence imported by Z.5. The object P sheafifies to P~ and both routes give P~[0]. Check tensor comparison on pairs of projective classes using the imported biexact pairing, and the unit on [A]. For general rings use K.4/gillet-waldhausen and Weibel V.2.7.2, not S.2’s scheme-only affine statement.

Checks:

- The zero ring has zero K₀; no integer-rank isomorphism is claimed for it.
- For a field extension F→E, the resulting ℤ→ℤ map is the identity, not multiplication by [E:F].
- For F×F→F the first projection sends the two idempotent projectives to F and 0.

Sources. Kbook.2013, II.2, book pp.68–69 (PDF pp.76–77); IV Proposition 6.2, book p.319 (PDF p.327); IV Corollary 7.2, book p.328 (PDF p.336); V.2.7.2, book p.383 (PDF p.391). These locators give scalar extension, the object-class loop, the plus/Q comparison and the ring-complex model, respectively.

### The Euler and Cartan comparison square

`resolution-euler-cartan-square`

Let R be a ring, M a module admitting a finite resolution by finite projectives, and h the corresponding admitsFiniteResolution witness. Under c_R, the class of a bounded cochain resolution P•→M[0] (P^i=0 for i>0) is moduleEulerClassOf(R,h)=Σ_i(−1)^i[P^i]. Applying the EXISTING cartanMap sends it to the class of M in ExactK0(finiteModulesExactStructure R). For commutative noetherian R this is precisely π₀ of the scheme Cartan map on Spec R. For flat maps between commutative noetherian rings the resulting Euler/Cartan square commutes with scalar extension on both sides.

Hypotheses. No global regularity assumption on R is required for a single M with the stated finite resolution. The scheme/G-theory and flat-base-change assertions assume commutative noetherian rings. Arbitrary scalar extension on all finitely generated modules is not used as an exact G₀ functor.

Proof plan. Import the finite-resolution equivalence, its inverse-on-classes formula, and moduleEulerClassOf_eq from the pin. Do not construct another resolution class. The pinned factorisation cartanMap = fromFiniteProjectiveResolution ∘ moduleResolutionEquiv sends the inverse image of [M] to [M]; this proves the native identity without assuming every finite module has a finite resolution. K.4/gillet-waldhausen and the alternating truncation filtration identify the perfect-complex class with that resolution class. S.2/cartan-degree-zero-compatibility identifies the affine target map. Flat scalar extension preserves the resolution and is exact on finite modules; compare generators. More general finite-Tor-dimension derived G-pullback belongs to S.2, not to this elementary square.

Checks:

- The one-term projective resolution gives cartanMap([P])=[P].
- For ℤ/p, the two terms ℤ in degrees −1 and 0 cancel, so its G₀(ℤ) class is zero.
- For k[ε]/ε², the map in projective-rank/simple-length bases is ×2; no inverse or finite projective resolution of its residue field is inferred.

Sources. Kbook.2013, II Theorem 9.2.2 and proof, book pp.162–163 (PDF pp.170–171); II.9.7.5, book p.169 (PDF p.177). The class of a bounded projective complex is the alternating class of its terms. TauCeti.pin, CartanMap.lean: moduleEulerClassOf_eq, moduleResolutionEquiv_symm_of, fromFiniteProjectiveResolution_of and cartanMap_apply (lines358–409). These existing formulas give the comparison with the same Cartan map, including its exact structures.

### Localisation, support and rank–Pic coordinates

`localisation-rank-pic-square`

For a commutative ring A and multiplicative set S, the degree-zero support-forgetful and restriction maps form K₀(A on S)→RingK0(A)→RingK0(S⁻¹A), exact at the middle. A supported strictly perfect cochain complex maps to its alternating class and then to zero; [P] restricts to [S⁻¹P]. If A is Dedekind, under the existing rank–Pic isomorphisms restriction is (r,L)↦(r,S⁻¹L) for S not containing zero; the rank–Pic coordinates of a supported Euler class are (Σ(−1)^i rk P^i, ⊗_i det(P^i)^{(−1)^i}). The affine scheme diagram and the Cartan diagram for this flat localisation commute.

Hypotheses. For a single open-support localisation sequence on schemes require a qcqs open complement; arbitrary S uses the ring localisation model, not an unproved quasi-compactness assertion for Spec S⁻¹A→Spec A. The rank–Pic equivalence is imported only in its Dedekind hypotheses. If 0∈S the target ring is zero and there is no target rank copy of ℤ.

Proof plan. For arbitrary S import the ring support category and exact degree-zero sequence from K.5/relative-K-theory-and-excision-boundary (Weibel II.9.8 and V.2.6.3); the commutative ring makes S central. Use S.3/affine-support-comparison and connective-localisation-sequence only for the scheme diagram with a quasi-compact open complement. No filtered-limit theorem is needed for the ring-support statement. Compare restriction on projectives using affine-comparison-diagram; use the finite-complex Euler formula for the forgetful arrow. For Dedekind A apply Z.4/k0-localization to the rank and determinant maps. Extension of invertible modules respects tensor and dual, hence the indicated Pic map. Flatness of localisation gives resolution-euler-cartan-square. Compare the determinant formula term by term with rank-pic-determinant-square. Exactness at K₀(A) never adds an unsupported surjectivity assertion on K₀(S⁻¹A).

Checks:

- For A=ℤ and S=ℤ\{0}, restriction is identity on ℤ and the support-forgetful map is zero.
- For A=F×F and S generated by (1,0), restriction (a,b)↦a kills [0×F].
- For I=(2,1+√−5) in ℤ[√−5], the resolution I→A in degrees −1,0 forgets to [A]−[I], with determinant I⁻¹. It dies over the fraction field, although its global class is nonzero.

Sources. Kbook.2013, II.9.7.5–9.8.1, book pp.169–170 (PDF pp.177–178); V Theorem2.6.3, book p.382 (PDF p.390); II Theorem8.1, book pp.145–146 (PDF pp.153–154). Supported perfect complexes forget by Euler class; localisation is exact at the middle and rank/determinant are additive invariants.

### Components of the graded determinant agree with Euler rank and Picard class

`rank-pic-determinant-square`

For qcqs X, the map π₀Det_X:π₀K(Perf X)→π₀Pic^ℤ(X)=H⁰(X,ℤ)⊕Pic(X) has, on a strictly perfect cochain representative P•, value (Σ_i(−1)^i rk P^i, ⊗_i det P^i to exponent (−1)^i). Precomposition with K₀(Vect X)→π₀K(Perf X) is exactly the existing rank–determinant map of Z.5; when X has the resolution property this is a comparison through an isomorphism. This equality is natural for derived pullback. Composing only the component-group map with Pic projection gives the ordinary determinant homomorphism, without a symmetric-monoidal forget-grade factorisation.

Hypotheses. Rank is a locally constant integer function. Do not replace H⁰(X,ℤ) by ℤ unless X is nonempty and connected. A global term formula is used only when a global bounded vector-bundle representative is given; general perfect objects use descent of the local formulas. Pic^ℤ uses the symmetry (−1)^{fg} times the line-bundle flip, with line first and grade second when writing a Picard object (L,f).

Proof plan. Use old bounded-complex-det and graded-det-pi-zero, identifying their projective and affine normalisations by affine-comparison-diagram. The tensor product in Pic^ℤ is the image of direct sum in K, not the K-ring product. On a bundle E[0] the formula is (rk E,det E), so generator extensionality identifies it with Z.5’s map. Shift introduces the additive inverse and line dual; triangle additivity gives the Euler sum. Pullback preserves the imported finite-locally-free determinant and the coherent spectrum map. The sign survives passage to automorphisms; forgetting it is valid only after taking components.

Checks:

- On F×F, [F×0] has grade (1,0), not an integer constant.
- O_X[1] has object (O_X,−1), while the zero complex has (O_X,0).
- Over a field of characteristic ≠2, interchanging two rank-one summands acts as −1 on their determinant line. An unsigned Picard target fails this check.
- On ℙ¹, z=[O]−[O(−1)] has components (0,O(1)); its rank is zero but its determinant is nontrivial.

Sources. BS17.v3, §5, Construction5.1 and Proposition5.3, pp.18–19; §12, Example12.2(iii) and Corollary12.17, pp.54–55,59. The signed graded determinant preserves direct sums and has the stated affine/scheme normalisation. Kbook.2013, II Theorem8.1, book pp.145–146 (PDF pp.153–154). Its rank and determinant maps are the component invariants compared here.

### Functorial comparison of the two projective-line coordinate systems

`projective-line-functorial-coordinates`

Use the existing projective-bundle coordinates x=a[O]+b[O(−1)] on K₀(ℙ¹_F), and the existing rank–determinant coordinates (r,d). For every field extension F→E, base change is the identity on BOTH copies of ℤ² and conjugates the comparison (a,b)↦(a+b,−b). Under it proper pushforward π_* is (a,b)↦a=(r,d)↦r+d and either standard section pullback σ* is (a,b)↦a+b=(r,d)↦r. These assertions use the SAME π₀K comparison and Cartan equivalence as the affine tests. The ring product in rank–degree coordinates is (r,d)(s,e)=(rs,re+sd).

Hypotheses. F and E are fields, ℙ¹ has O(−1) as its projective-bundle generator. Pushforward is the existing proper perfect pushforward. The coordinate statements concern K₀, not a direct-sum splitting of graded Picard spectra or an origin-free genus-one formula.

Proof plan. Import S.5/projective-line-k-theory and the three existing Z.6 projective-line nodes, rather than reproving the projective bundle theorem or Pic(ℙ¹). Evaluate pullback of O and O(−1) under the field extension, preserving these two ordered generators. Their coordinate columns prove both identities and the commuting base-change diagram. Use π_*O=1, π_*O(−1)=0 and σ*O=σ*O(−1)=1 from S.5. Substitution gives π_*=r+d and σ*=r. The Z.5 ring formula transports the product.

Checks:

- O(m) has (a,b)=(m+1,−m), (r,d)=(1,m), including m=−2 where π_* is −1.
- The rational skyscraper z has (1,−1) and (0,1); π_*z=1, σ*z=0 in K₀, and z²=0. Section pullback here is DERIVED; naive restriction of the skyscraper at the section would give the wrong answer.
- The coordinate matrix [[1,1],[0,−1]] squares to identity. Swapping the O(1)/O(−1) convention changes the signs and fails the preceding tests.

Sources. Kbook.2013, II Theorem8.5 and Corollary8.6, book p.149 (PDF p.157); V Theorem1.5.4, book p.371 (PDF p.379). These give the ordered two-generator basis and its twisting relation; the functorial coordinate comparison is obtained by applying the imported pullbacks and pushforward.

### Affine descent comparison for the scheme determinant

`scheme-determinant-gluing-coherence`

The ordinary scheme determinant already specified in scheme-spectrum-det is the Zariski descent of the affine signed determinant with its scalar-extension comparison. Its affine restriction comparison is compatible with identity/composition of pullbacks, the zero object, shifts, and additivity paths for enhanced cofiber sequences. Consequently its component map is the one in rank-pic-determinant-square. A change of affine presentation gives equivalent determinant data through the descent comparison, not merely an equality of Picard classes.

Hypotheses. X is qcqs; no regularity or resolution property is needed for Det on Perf(X). Use enhanced Perf and mapping spaces (or Picard-groupoid pseudofunctors with monoidal natural isomorphisms after truncation). A bare triangulated category does not supply canonical triangle/octahedral comparison data. The coherent generic truncation/descent and filtered additivity interfaces are explicit supplier requests; no new generic spectra theory is owned here.

Proof plan. Import the affine map and its Zariski-sheafified normalisation from Z.3. Identify scalar-extension restrictions by affine-comparison-diagram and the finite-locally-free pullback/determinant operations owned by AlgebraicVectorBundles L0A–L0C. Pic^ℤ is a Zariski stack; the affine normalisations and their overlap isomorphisms descend to a map K(Perf X)→Pic^ℤ(X), as in BS17 Prop5.3. This only needs descent for maps INTO the stack; no claim that an arbitrary connective K presheaf is itself hypercomplete is required. Use K.4’s requested coherent additivity to transport enhanced triangles and filtrations, retaining the extension paths. Apply π₀ to recover the earlier Euler comparison.

Checks:

- On a singular affine scheme the map still exists, without identifying Vect K and Perf K on all schemes.
- On the doubled affine plane the Perf determinant exists; the failed Vect→Perf equivalence must not be used to define it.
- A swap of two degree-zero lines has sign −1 in characteristic ≠2; neither descent nor passing to a new representative erases that automorphism.

Sources. BS17.v3, §5 Proposition5.3 and its proof, pp.18–19; §12 Corollary12.17 and Proposition12.18, p.59. The scheme map is obtained from the affine determinant and Zariski descent, with a groupoid/spectrum-valued target.

### The sheafified comparison defining the supported Witt determinant

`witt-determinant-sheafification-square`

On the site of perfect qcqs F_p-schemes let A=τ≤1K(Perf−), B=τ≤1K(W(−) on −), P=Pic^ℤ, and a_v denote sheafification in 1-truncated connective spectra/Picard groupoids. The supplier gives a_vα:a_vA≃a_vB, and ordinary determinant gives a_vA≃P. Define e:a_vB≃P as their composite using the inverse of a_vα. The EXISTING supported determinant is K(W(−) on −)→B→a_vB→e P. Restriction along α identifies it with Det, including the extension homotopy. Precomposition along α induces an equivalence of natural mapping spaces into P; its homotopy fibre over the specified ordinary Det is contractible. This is uniqueness of NATURAL extensions with the extension homotopy.

Hypotheses. p is prime, W denotes p-typical Witt vectors, and the support input is the S.3 enhanced formal-Witt category. P is a v-stack; use the universal properties of τ≤1 and sheafification at the level of mapping groupoids/spaces, requested from the indicated suppliers. There is no assertion that α_X is an equivalence for every X, nor that all maps out of the supported K-spectrum at a fixed X form a contractible space.

Proof plan. Replace the old broad support/site edges by S.3/witt-supported-perfect-complexes, S.3/witt-special-fibre-k-map, S.4/perfect-scheme-h-and-v-sites and S.4/witt-k-one-truncation-sheafification. Keep W(X) formal; on affines its model is Spec W(R) with p support. Use Z.3/graded-pic-v-descent and ordinary Det normalisation. The maps A→P and α become equivalences after sheafification; their inverse/composite gives e. For a 1-truncated sheaf P, natural maps from supported K to P factor through B and then a_vB. Precomposition by a_vα is an equivalence; a fibre of an equivalence over a specified point is contractible. This proves the extension property and its coherent uniqueness together. The h-local proof of the α comparison uses regular finite-type perfections and alterations, so the smooth case suffices. The broader arbitrary regular Cor5.6 claim remains subject to the supplier’s Popescu/continuity gap; do not reproduce its faulty blanket smooth-lift step.

Checks:

- Over a perfect field k, the residue module α(k) maps to (k,1).
- W(k)/p² has supported determinant grade2 even though its ordinary W(k)-projective resolution has virtual W(k)-rank0. The two determinant targets differ.
- The zero object has (O,0). W(k)[0] is not a supported input when k is a nonzero field.
- The mapping-space argument retains the chosen extension homotopy; equality on π₀ is insufficient to prove uniqueness.

Sources. BS17.v3, §5 Theorem5.7 and proof, pp.19–20; Proposition12.18, p.59. The proof sheafifies the one-truncations and determines the supported extension with its natural homotopy; it does not give objectwise equivalence for all perfect schemes.

### Filtration and base-change comparisons for supported determinants

`witt-filtered-base-change-square`

For a finite enhanced filtration 0=C₀→⋯→C_n=C in Perf(W(X) on X), supplied identifications cofib(C_{j−1}→C_j)≃α_X(D_j) give Det~(C)≃⊗_{j=1}^n Det(D_j), ordered by increasing filtration index. These isomorphisms commute with perfect-scheme derived pullback and with specified refinement diagrams through the K-theory additivity paths. In particular, for perfect k, a finite-length W(k)-module Q, and perfect qcqs k-scheme X, a finite filtration of Q_X by finite projective O_X-graded pieces has product determinant line pulled back from the k-line underlying Det~(Q). It is trivializable, with locally constant grade length_{W(k)}Q. No canonical basis or individual triviality of every graded determinant is asserted.

Hypotheses. The filtration includes actual enhanced maps, cofiber identifications and refinement comparisons; a list of equal component classes is insufficient. In the constant-module clause k is a nonzero perfect field, X is a perfect k-scheme, Q_X is the derived Witt base change, agreeing with the ordinary tensor module here; W(O_X) is flat over the DVR W(k) on affines. For arbitrary filtrations, comparison follows the specified paths. Contractible uniqueness of the global natural extension is not a claim that every automorphism of each determinant line is trivial.

Proof plan. Use the requested coherent Waldhausen additivity to obtain the path [C]=Σ[α(D_j)] in supported K, then apply the SAME Det~ of witt-determinant-sheafification-square and its specified extension homotopy. Naturality of additivity and of Det~ gives the base-change square. The octahedral/refinement coherence is imported from K.4, not inferred from the triangulated axioms alone. For constant Q, naturality identifies Det~(Q_X) with pullback of Det~(Q). Every line over k has a basis, hence its pullback is trivializable. A composition series of Q has length ℓ and k-graded pieces, giving grade ℓ. Any other specified filtration gives the same determinant via additivity.

Checks:

- Q=0 gives the empty tensor product and grade0.
- Q=k gives a trivializable line with grade1; Q=W(k)/p² gives grade2, not the graded tensor unit.
- A nontrivial automorphism u∈k× acts on the residue-line determinant; trivializable does not mean canonically trivialized.
- Refining the length-two p-adic filtration preserves its ordered determinant comparison and commutes with base change to any perfect k-scheme.

Sources. BS17.v3, §5 Theorem5.7, pp.19–20; Lemma6.11 and its K-theoretic proof, pp.24–25. The constant Witt-torsion determinant is a pullback of a field line; coherent additivity converts a filtration to its product determinant without selecting a basis.

## Degree-zero regression suite

These tests import the earlier application targets. They check the entire comparison diagram, not just an abstract answer for the groups. The field and PID computations come from Weibel II.2, printed pp.68–69 (PDF pp.76–77); the curve/skyscraper calculation is II.8.2.1 and its proof, printed pp.146–147 (PDF pp.154–155). The projective-line basis and relation are II.8.5–8.6, printed p.149 (PDF p.157), and V.1.5.4, printed p.371 (PDF p.379). Dedekind and elliptic geometry are imported from the exact owner nodes below rather than replanned from a new source.

| Input and inherited target | Expected comparison and failure detected |
| --- | --- |
| Field F — `Z.6/field-test` | Projective, vector-bundle, perfect and spectrum K₀ all give ℤ by dimension; Cartan is identity and Pic(F)=0. A field extension preserves the generator 1. For a bounded complex, the alternating term dimension equals the alternating cohomology dimension. |
| ℤ — `Z.6/integers-test` | All rank models give ℤ. The resolution ℤ —p→ ℤ of ℤ/p gives zero in K₀(ℤ), hence zero in G₀(ℤ). Restriction to ℚ is identity on ℤ. A class of a torsion module must not be assigned its nonzero finite length in G₀(ℤ). |
| F×F — `Z.6/field-product-test` | The two idempotent projectives have ranks (1,0),(0,1); the unit has rank (1,1). Localisation at (1,0) is first projection. Pic is zero, but rank is not a single constant integer. |
| A=ℤ[√−5], I=(2,1+√−5) — `Z.6/nonprincipal-ideal-test` | x=[I]−[A] is nonzero of order two, with rank zero and determinant I. The supported resolution I→A forgets to −x and maps by Cartan to [A/I]≠0. All prime localisations kill x because I becomes free. A rank-only or stalkwise-injective implementation fails. |
| ℙ¹_F — `Z.6/projective-line-regular-curve`, `…/projective-line-rank-pic`, `…/projective-line-change-of-basis` | [O(m)] has rank–degree (1,m), projective-bundle coordinates (m+1,−m), pushforward m+1, and section pullback 1. z=[O]−[O(−1)] has coordinates (0,1), square zero and pushforward one. The sign of its determinant degree detects an inversion error. |
| Elliptic E with rational origin O — `Z.6/elliptic-test` | Import `EllipticKTheory:E.2/K0-of-an-elliptic-curve` and `…/picard-decomposition-and-the-point-group`. K₀(E)=ℤ⊕Pic(E)=ℤ²⊕E(F) with determinant O(P+(d−1)O). A rational skyscraper has coordinates (0,1,P). Its difference with the origin skyscraper has rank and degree zero but need not vanish. |
| Real conic C:X²+Y²+Z²=0 — `Z.6/pointless-conic-test` | The curve rank–Pic comparison still applies. Every closed point has residue degree two, and the determinant-degree image is 2ℤ. O_C(1) becomes O(2) after C_ℂ≅ℙ¹_ℂ. Rank and degree do not identify K₀(C) with all of ℤ²; the rational-point basis of ℙ¹ does not descend. |
| Perfect field k, Witt torsion — existing Witt construction tests | The same supported determinant gives k grade one, W(k)/p² grade two, and zero grade zero. Its ordinary line is trivializable over k. Ordinary W(k)-projective rank and supported grade are different invariants. |

Two calculations make the nontrivial tests reproducible. In A=ℤ[s]/(s²+5), reduction s↦1 mod2 gives A/I≅𝔽₂, so I has norm two. If I were principal its generator would have norm a²+5b²=2, which has no integer solutions. Moreover I² is generated by 4, 2+2s, −4+2s; these lie in (2), and their integer combinations contain 2 because (2+2s)−(−4+2s)−4=2. Thus I²=(2). The existing Dedekind rank–Pic equivalence gives x≠0 and 2x=0. This example alone cannot detect the sign of x because x=−x. The projective-line degree-one test supplies that missing sign check.

For the elliptic example y²=x³−x over 𝔽₅, the rational points are O, (0,0), (1,0), (2,1), (2,4), (3,2), (3,3), (4,0). The cubic is nonsingular. The point Q=(2,1) satisfies 2Q=(0,0), so Q has order four; exactly three nonidentity points have order two, giving E(𝔽₅)≅ℤ/4⊕ℤ/2. The class of O_Q minus O_O is (0,0,Q), with double (0,0,(0,0)) and fourth multiple zero. Its negative corresponds to (2,4) and is distinct. This detects loss of the Picard component and inversion of that component, which rank and degree cannot detect. The finite enumeration and group-law arithmetic are independently executable; the interpretation in K₀ uses the imported E.2 theorem. No origin-free decomposition is asserted for a genus-one torsor.

For the section test on ℙ¹, a skyscraper at that section has derived pullback with a degree-zero and a degree-minus-one copy of the residue field. Its class is zero. This explains why σ*z=0 while π_*z=1, and makes the underived-pullback error visible.

## Target accounting, dependencies and remaining supplier work

All 25 inherited targets have a disposition:

- Five ordinary comparisons: `ring-k-zero-pi-zero`, `vector-bundle-k-zero-pi-zero`, `perfect-complex-euler-class`, `localisation-projective-class`, `cartan-map-comparison`.
- Nine applications: `field-test`, `integers-test`, `field-product-test`, `nonprincipal-ideal-test`, the three `projective-line-…` nodes, `elliptic-test`, `pointless-conic-test`.
- Four ordinary determinant targets: `scheme-spectrum-det`, `determinant-triangle`, `bounded-complex-det`, `graded-det-pi-zero`.
- Seven Witt targets: `witt-supported-input`, `witt-regular-perfection-comparison`, `v-sheafified-first-k`, `witt-supported-det`, `witt-det-uniqueness`, `witt-filtration-det`, `finite-length-det-trivial`.

The comparison chain is affine normalisation → Euler/Cartan and rank–Pic component comparisons → localisation and projective-line functorial tests. The determinant chain is the early signed affine determinant → scheme comparison → the S.4 one-truncation support comparison → supported determinant → filtered/base-change comparison. In particular S.4 imports early Z.3 signed determinant inputs, not this downstream Z.6 extension. No S.6 or S.7 operation theorem is used, so no downstream λ-operation or Adams-operation cycle is introduced. The cross-packet dependency check is recorded in the handoff.

The following requests are part of this completed plan; none is represented by a fabricated native carrier.

1. **H.5 Picard comparison and enriched truncation.** The existing `StableHomotopyKTheory:H.5:spectra/picard-one-truncated-spectra` contract retains an unread comparison gap. It must expose symmetric monoidal functors and monoidal natural isomorphisms as mapping groupoids, and the universal property of τ≤1 compatibly with functor-category limits. An equivalence of homotopy categories would not prove contractibility of the space of natural extensions.
2. **S.4 sheafification mapping interface.** `SchemeKTheoryOperations:S.4/witt-k-one-truncation-sheafification` supplies the sheafified equivalence. Expose the corresponding mapping-groupoid adjunction into a Picard v-stack, including units and extension homotopies. This is an interface request to the same owner, not another site or comparison construction.
3. **K.4 coherent additivity.** `GeneralAlgebraicKTheory:K.4/waldhausen-additivity` must provide natural paths for enhanced cofiber sequences and finite filtrations, with empty-filtration, refinement and octahedral coherence. A relation in TriangulatedK0 proves the component formula but does not by itself supply these isomorphisms.
4. **S.3 arbitrary regular comparison.** The existing `SchemeKTheoryOperations:S.3/witt-regular-perfection-devissage` contract explicitly retains the Popescu/supported-continuity bridge for arbitrary regular noetherian F_p-algebras. Its smooth finite-type lift argument cannot be applied to every regular algebra. This inherited gap affects the broader Corollary5.6 target. The smooth alteration-basis argument suffices for the supported determinant descent route. This records the already known `PAPER-BHATT-SCHOLZE-17/E31` correction, not a new source finding.

The three gap records group requests 1–2 together, coherent additivity separately, and the inherited arbitrary-regular comparison separately. General vector-bundle tensor, dual and pullback work formerly requested by the old packet is now routed to current AlgebraicVectorBundles; it is not repeated as a Z.6 construction. The eight new nodes are comparison theorems. The earlier projective-line planet is retained; the three new planets are **Degree-zero K-theory comparison**, **Rank and graded determinant**, and **Determinant of Witt torsion**. The layer therefore has four planets, below its limit of six.

## Suggested file and source record

The [111-line suggested file](../suggested/KTheoryLowDegrees--Z.6.lean) uses only existing pinned carriers. It states the categorical Euler/Cartan identity, the existing Cartan inverse normalisation under its actual finite-resolution hypothesis, and a few projective and integer-coordinate checks. The integer calculations are explicitly only arithmetic consequences of the imported ℙ¹ theorem; they do not define K(ℙ¹). Every full target whose RingK0, Perf, spectrum, signed Picard, support or site carrier is absent has an explicit omission entry in the file and packet. The imported construction APIs/tests remain reader targets until those carriers exist. There are no data definitions with admitted bodies and no opaque proposition substitutes.

`lean-check research/blueprint/suggested/KTheoryLowDegrees--Z.6.lean` elaborated the whole file at the pinned shared build, exit zero, with nine intentional proof-admission warnings and no other warnings. The blueprint checker also reports zero errors and zero warnings using the pinned declaration index. These receipts establish signature elaboration and packet consistency, not the mathematical truth or implementation of the admitted statements.

Sources actually read for this continuation:

- Charles A. Weibel, [*The K-book*](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), author-hosted combined draft dated 29 August 2013. Locators above use printed draft pages; add eight for the PDF page. The SHA-256 is `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
- Bhargav Bhatt and Peter Scholze, [*Projectivity of the Witt vector affine Grassmannian*, arXiv v3](https://arxiv.org/pdf/1507.06490v3), 21 February 2017: the determinant targets use §5, Construction5.1, Propositions5.2–5.3, Theorem5.5, Corollary5.6 and Theorem5.7, pp.18–20; Lemma6.11, pp.24–25; and the signed/group-completion comparisons in §12, pp.54–59, especially Corollary12.17 and Proposition12.18, p.59. SHA-256 `b4d5a4e0a6591971c6b8521d790e5db6e61112f1350a0e4a05a8d98b6e0b961e`.
- [Pinned Tau Ceti CartanMap source](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Category/ModuleCat/CartanMap.lean), especially `moduleEulerClassOf_eq`, `moduleResolutionEquiv_symm_of`, `fromFiniteProjectiveResolution_of`, `cartanMap_apply`, and the induced exact structures on their domains.

The source texts were read on 2026-10-19. This is a target-directed reading, not a summary of each source section. No source passages or source files are included in the repository. No new erratum is proposed, and no published/preprint collation is claimed.
