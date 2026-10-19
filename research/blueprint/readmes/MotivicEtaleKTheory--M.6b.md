# Motivic and étale methods for arithmetic K-theory: operations, descent and regulators

This part specifies the passage from the support tower to its operations and convergence, the arithmetic étale comparison with its real-place exceptions, and the regulator interfaces needed for integral lattices, Euler relations and Selmer determinants. Its three layers are M.6b, M.7 and M.8. The output is a mathematical plan. Every declaration has implementation status `unchecked`.

The [M.5d target packet](../packets/MotivicEtaleKTheory--M.5d.json) and its [reader](MotivicEtaleKTheory--M.5d.md) supply the existing targets in these layers. Their identifiers are imports, not a second set of definitions. The targets below refine the product/coherence, source-proof and arithmetic application obligations of those imports. M.6a owns the support tower and layer equivalences; M.6 is its assembly with M.6b. The assembly combines both packets and selects at most six planets per layer.

## Conventions and ownership

Use cohomological motivic notation H^h_M(X,Z(j))=CH^j(X,2j−h). The support tower is decreasing: F^(p+1)K→F^pK, with layer L^p=cofib(F^(p+1)→F^p). Native coordinates are support weight p and K degree m. Public coordinates are (a,b)=(p−m,−p), so the motivic sequence starts on E₂, has weight j=−b and abutment degree −a−b. Its differential has bidegree (r,1−r). The étale descent sequence instead uses (s,t), with degree t−s and differential (r,r−1).

Finite coefficients mean the actual Moore-coefficient spectrum, derived completion means a homotopy inverse limit of those spectra, and continuous cohomology means derived inverse-limit cohomology. Identify the completed K group with tensoring by Z_ℓ only with the finite-generation and coefficient-limit theorem. For a finite set S of places of a number field F, O_(F,S) inverts its finite primes; S includes the archimedean places whenever real restrictions are discussed.

At an unramified place, Fr denotes arithmetic Frobenius and Φ=Fr⁻¹ geometric Frobenius. The cyclotomic character takes Fr to q. The elliptic Tate module is homological; H¹(E_bar,Q_ℓ)=V_ℓE^∨. A Rubin Euler polynomial uses the Tate dual T*=Hom(T,Z_ℓ(1)). The coefficient Frobenius and the Galois-group element substituted into an Euler polynomial have different roles.

For real Deligne cohomology use R(j)=(2πi)^j R and the logarithmic Deligne–Beilinson complex of the Hodge-direction supplier. An integral Deligne target with Z(j) is different. All determinant lines are graded determinant lines; the arithmetic convention is inverse determinant of compact support. Local-condition maps, not only predicates on H¹, define the Selmer complex.

| Material | Owner and precise use |
| --- | --- |
| Spectra, exact couples, coefficient triangles, Milnor sequences and convergence | `StableHomotopyKTheory:H.6`; instantiate its supplied constructions on support diagrams. |
| Coherent support diagrams and spectral sheaf descent | `EnhancedDerivedSheaves:E3/E2`; supply the concrete diagram/hypercompletion interfaces. |
| Support products, higher Adams operations and finite-weight eigenspaces | `SchemeKTheoryOperations:S.6`; the support application compares its operations, including connecting maps. |
| Generic cycle complexes, moving, products and localization | `MotivicEtaleKTheory:M.4`; use the existing simplicial/cubical complexes and their comparison. |
| Real-place restrictions and arithmetic cohomology | `MotivicEtaleKTheory:M.2`, `ArithmeticGaloisDuality:R02.3/R02.4`. Ordinary, positive and Tate-modified cohomology remain distinct. |
| Real topological K-theory | The existing **Refined trace methods, Part II: Real topological K-theory** request, starting from RT.4. Complex KU does not supply KO. |
| Logarithmic Deligne complexes and compactification independence | The existing **Hodge structures, Part II: Deligne–Beilinson realization** request, based on the upstream mixed-Hodge milestone. |
| Native Tate modules and elliptic good-reduction Frobenius | Current Tau Ceti EllipticCurves Layers 2–4 and the `ArithmeticGaloisRepresentations:R01.6` adapters. |
| Selmer mapping fibres and finite local conditions | `SelmerIwasawaCohomology:L2/L4`; the rational period-ring condition comes from `PadicHodgeRegulators:L1`. |
| Syntomic/local higher-weight comparisons | `PadicHodgeRegulators:D.2/D.5`; use their stated weight and reduction regimes. |
| Perfect determinant functor and coefficient change | `PadicMeasuresIwasawaAlgebras:L5`, with compact-support perfection from `ArithmeticGaloisDuality:D7`. |
| Independent realization and period spaces | `MotivesAndAlgebraicCycles:MC.2` and `PeriodsAndSpecialValues:PS.0`. PS.3/PS.4 consume the regulator comparison. |

Current Tau Ceti roadmaps are imports, including AlgebraicVectorBundles for finite-projective geometry and EllipticCurves for the native elliptic objects. The determinant of a finite projective sheaf is not a substitute for the requested determinant functor on perfect arithmetic complexes. No target in those upstream roadmaps is reconstructed here.

## Pinned library interface

The programme baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The following declarations were read at those pins.

| Declaration | Available interface and limit of its use |
| --- | --- |
| `mathlib:CategoryTheory.E₂CohomologicalSpectralSequence` in `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean` | Spectral sequences in an abelian category with page r differential of bidegree (r,1−r), starting at page 2. |
| `mathlib:CategoryTheory.Abelian.SpectralObject` in `Mathlib/Algebra/Homology/SpectralObject/Basic.lean` | Interval-valued cohomological data and connecting maps satisfying the long exactness axiom; an algebraic target interface, not a stable support tower. |
| `mathlib:Module.End.mem_eigenspace_iff` in `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` | Membership in the eigenspace of f at μ is equivalent to f x = μ • x. |
| `mathlib:ZLattice.covolume_div_covolume_eq_relIndex` in `Mathlib/Algebra/Module/ZLattice/Covolume.lean` | For discrete full Z-lattices L₁≤L₂ in a finite real coordinate space, covolume(L₁)/covolume(L₂) is their relative index. This is the existing numerical input to the arithmetic Chern-image comparison. |

The algebraic spectral-sequence carrier already has pages, homology-to-next-page isomorphisms and morphisms. It is the target of an index transport; it does not supply the missing spectrum tower or motivic layers. Eigenspace membership is tested against an actual linear endomorphism. No spectral, K-theoretic or motivic carrier is replaced by a parameter with a suggestive name in the suggested file.

## M.6b — Exact couples, convergence and operations

### Imported target contracts

The five following identifiers belong to the M.5d packet.

- `MotivicEtaleKTheory:M.6b/motivic-exact-couple`: form D₁^(p,m)=π_m F^pK and E₁^(p,m)=π_m L^pK from the localization triangles. The native connecting map lands in D₁^(p+1,m−1), and d_s lands in E_s^(p+s,m−1). The coordinate transport below produces the public E₂ convention.
- `MotivicEtaleKTheory:M.6b/motivic-strong-convergence`: in the admitted smooth perfect-field class of dimension d, the support connectivity argument gives π_m F^p=0 for p>d+m, m≥0, and F^(d+n+1)K_n=0 for n≥0. It includes the Milnor lim¹ check; its support/dévissage proof obligations remain named.
- `MotivicEtaleKTheory:M.6b/filtered-motivic-products`: the filtered product is compatible with layers, the cycle cup product and the abutment. Its concrete functorial roof and boundary compatibility are specified below. At finite coefficients use the supplied Moore pairing or module structure and its coherence restrictions, rather than assuming every coefficient spectrum is a commutative ring.
- `MotivicEtaleKTheory:M.6b/filtered-adams-operations`: the actual higher Adams action agrees with the weight-j scalar k^j on E₂ and the scheme operation on K. Its integral K-space construction is distinguished below from an integral stable λ map.
- `MotivicEtaleKTheory:M.6b/rational-motivic-degeneration`: after the layer, convergence and Adams theorems, higher differentials vanish over Q and the finite filtration identifies with the genuine Adams eigenspaces. The splitting is canonical through those operations, not a chosen complement of a filtration.

Use `MotivicEtaleKTheory:M.6a/coniveau-cycle-layer` and `M.6a/global-model-comparison` as their layer/filtered-model prerequisites. The latter is a filtered zigzag with augmentation and layer compatibility, not merely an equality of page formulas. The five new declarations in this layer make the required proof interfaces explicit.

### Motivic spectral-sequence coordinates

Declaration: `MotivicEtaleKTheory:M.6b/motivic-native-index-transport` (definition).

For native support-tower coordinates (p,m), define (a,b)=(p−m,−p), inverse (p,m)=(−b,−a−b). The native page s≥1 is public page r=s+1≥2. Thus π_m L^p(X)=H^(2p−m)(X,Z(p)) is E₂^(a,b), with m=−a−b, weight j=−b and differential (a,b)↦(a+r,b−r+1). Transport only after supplying M.6a’s layer equivalence; this integer bijection by itself constructs no spectral sequence.

**Hypotheses.** X is in the admitted smooth perfect-field class of the imported tower; integer coordinates, s≥1.

**Proof or construction.**

1. Use motivic-exact-couple: d_s changes (p,m) to (p+s,m−1). Substitute both coordinates to get a′=a+s+1 and b′=b−s.
2. Use the inverse formulas to identify the abutment degree and layer cohomological degree a−b. Feed these indices into the existing Mathlib E₂ shape; H.6 supplies page/homology transport.

**Uses.** M.7/bott-etale-descent and M.6 assembly: Translate motivic and étale filtrations before comparing degree ranges. Mathlib E₂CohomologicalSpectralSequence: Match the actual differential shape already present at the pin.

**Planning API.**

- `MotivicIndex.toPage` (constructor): Send (p,m) to (p−m,−p).
- `MotivicIndex.ofPage` (constructor): Send (a,b) to (−b,−a−b).
- `MotivicIndex.inverse` (equivalence): Both composites are the identity on Z×Z.
- `MotivicIndex.differential` (compatibility): Native (p+s,m−1) transports to (a+s+1,b−s).
- `MotivicIndex.degree_weight` (projection): K degree is −a−b and motivic weight is −b.

**Definition tests.**

- `MotivicIndex.field_unit` (example): (p,m)=(0,0) gives (a,b)=(0,0), the weight-zero K₀ unit.
- `MotivicIndex.first_boundary` (example): (p,m)=(2,3), s=1 gives (−1,−2)→(1,−3), changing total K degree 3→2.
- `MotivicIndex.inverse_negative` (example): (a,b)=(−3,−2) returns (p,m)=(2,5), not (2,1); negative public indices remain integers.

**Check.** The first native boundary d₁ has public bidegree (2,−1), not (1,0). The public differential lowers K degree by one and raises weight by r−1.

**Dependencies.** `MotivicEtaleKTheory:M.6b/motivic-exact-couple`, `StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence`, `mathlib:CategoryTheory.E₂CohomologicalSpectralSequence`, `mathlib:CategoryTheory.Abelian.SpectralObject`.

**Source.** [Levine2001] Appendix D.1, pp.93–94; Theorem 14.7, pp.73–74: The tower page starts one page before the motivic convention; the stated substitution translates its boundary and layer formulas. [Weibel2013] VI (4.2), pp.480–481: The public convention has E₂=H^(a−b)(X,Z(−b)) abutting to K_(−a−b).

### Simultaneous moving product

Declaration: `MotivicEtaleKTheory:M.6b/simultaneously-moved-product-roof` (construction).

For X smooth quasi-projective over a perfect field in Levine’s admitted support model, construct a finite functorial zigzag defining F^pK(X)∧F^qK(X)→F^(p+q)K(X). Replace pairs of supports by the subdiagram meeting every relevant face and shuffle inverse image properly; do not choose a moving representative separately on each homotopy group. For each common width u≥1 the induced quotient product is (F^p/F^(p+u))∧(F^q/F^(q+u))→F^(p+q)/F^(p+q+u). The diagram respects both support-inclusion maps and both localization triangles, including connecting maps. It supplies a product of exact couples and hence of all pages and the abutment. Finite-coefficient products use H.6’s actual Moore pairing or module structure, with its coherence restrictions.

**Hypotheses.** p,q≥0; u≥1. Use a filtered global model with its augmentation and cycle-layer comparison; M.6a/global-model-comparison is a named outstanding prerequisite. Tensor products use Tor-independent/flat resolutions in the precise hypotheses of Levine Appendix C; smoothness alone is not permission to ignore support intersections.

**Proof or construction.**

1. Start with S.6 support-product-pairings and external-product on the exact categories of support perfect complexes; Appendix C.3 realizes them as finite functorial diagrams of bisimplicial spectra.
2. Use Levine Lemmas 11.3–11.4 and Proposition 11.5: generic translation and the simultaneous good-position diagram give weak-equivalence legs compatible with faces and shuffle maps. Take diagonals/realizations on the entire diagram through H.6/EDS.
3. Use Proposition 11.8 and Lemma C.4 to commute the resulting products with the two localization boundaries. The proof expresses the boundary through a fibre then a cofiber, which must be preserved by the supplied exact smash functor.
4. For quotients, kill the pushout-product subobject F^(p+u)∧F^q ∪ F^p∧F^(q+u); both images lie in F^(p+q+u). Use that common width, rather than an unjustified sum of two independent quotient cutoffs.
5. Apply the imported multiplicative exact-couple machinery. The sign is the Koszul sign in total K degree m; the source’s Appendix D.6 sentence about the sphere interchange has a recorded exponent misprint.

**Uses.** M.6b/filtered-motivic-products and rational-motivic-degeneration: Supply the coherent product, rather than just multiplication on the associated groups. M.8/chern-functoriality: Compare the filtered K product with the cycle and regulator products.

**Planning API.**

- `MotivicProduct.supportRoof` (constructor): A product roof of support diagrams, with objectwise weak-equivalence legs and all face/shuffle maps.
- `MotivicProduct.quotient` (constructor): For common width u, the two quotient inputs map to the quotient with cutoff p+q+u.
- `MotivicProduct.boundary_left` (compatibility): The left localization connecting map commutes with the product.
- `MotivicProduct.boundary_right` (compatibility): The right boundary commutes after the canonical suspension interchange.
- `MotivicProduct.transitions` (functoriality): Products commute with inclusions of supports and interval transitions.
- `MotivicProduct.augmentation` (compatibility): The map to K carries the product to the actual K product.

**Definition tests.**

- `MotivicProduct.unit` (example): The weight-zero class of O_X acts as the identity on each filtered quotient.
- `MotivicProduct.cutoff` (non-example): Taking u=1, a class from F^(p+1) times a class from F^q dies modulo F^(p+q+1); no claim that it dies modulo F^(p+q+2).
- `MotivicProduct.odd_sign` (relation): For homogeneous K-degrees m=n=1, interchanging the two factors multiplies by −1. A sign (−1)^(m+n) fails this test.
- `MotivicProduct.empty_support` (example): A product with the zero spectrum for empty support is zero before realization and on every page.

**Check.** Both boundary squares commute with the prescribed suspension sign. Quotient products agree under u→u+1 and support/filtration transition maps. At the augmentation F⁰≃K the product is the ordinary K-theory tensor product.

**Dependencies.** `MotivicEtaleKTheory:M.6a/global-model-comparison`, `SchemeKTheoryOperations:S.6/support-product-pairings`, `SchemeKTheoryOperations:S.6/external-product`, `StableHomotopyKTheory:H.6/filtered-spectrum`, `StableHomotopyKTheory:H.6/moore-spectrum-multiplication`, `EnhancedDerivedSheaves:E3`.

**Source.** [Levine2001] §11.2–11.8, pp.43–48; Appendix C.3–C.4, pp.90–91; D.4–D.7, pp.94–96: Simultaneous moving gives a diagram-level product and its localization compatibility; the common-width quotient is the form used in §11.5.

### Multiplicative cycle-layer comparison

Declaration: `MotivicEtaleKTheory:M.6b/product-cycle-layer-identification` (comparison).

In the same admitted smooth perfect-field model, the cycle-layer equivalences identify the product on gr^p_F K∧gr^q_F K with Bloch’s properly intersecting external product followed by diagonal pullback and the signed shuffle. Consequently the product on E₂ is the motivic cup product H^h(X,Z(p))×H^h′(X,Z(q))→H^(h+h′)(X,Z(p+q)); the product on K is the ordinary one. The page differential satisfies d_r(xy)=d_r(x)y+(−1)^m x d_r(y), where m is x’s total K degree.

**Hypotheses.** Use the product roof above, not independently chosen representatives. All cycle complexes and diagonal moves are those of M.4/products and M.4/moving-lemma.

**Proof or construction.**

1. For properly intersecting supports use Serre intersection multiplicities: the alternating Tor lengths of tensor resolutions give the intersection cycle. This identifies the support-layer class map with cycle multiplication.
2. Use all shuffle maps in the simultaneous diagram to extend the identification to the normalized chain differential; use §11.15 to identify the shuffle construction with the imported Bloch product.
3. Apply H.6’s multiplicative exact-couple theorem and the index transport. The Leibniz sign comes from moving one suspension past a sphere of degree m.

**Check.** On CH¹ of projective space the layer product of the hyperplane class is its intersection square. The boundary formula uses total degree, not motivic weight alone.

**Dependencies.** `MotivicEtaleKTheory:M.6b/simultaneously-moved-product-roof`, `MotivicEtaleKTheory:M.6a/coniveau-cycle-layer`, `MotivicEtaleKTheory:M.4/products`, `MotivicEtaleKTheory:M.4/moving-lemma`, `StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence`.

**Source.** [Levine2001] §11.14–11.15, pp.51–52; Lemma D.6, pp.95–96: The support cycle map respects products via intersection multiplicity; its shuffle product agrees with Bloch’s, and the boundary gives the Leibniz rule.

### Adams operations on support exact couples

Declaration: `MotivicEtaleKTheory:M.6b/adams-support-boundary-comparison` (theorem).

For every integer k≥2, the established higher Adams operation ψ^k induces compatible additive operations on the support exact couple and all its derived couples. It agrees at K_n(X) with S.6’s scheme operation and acts on weight j of E₂ as k^j. For r≥2 and weight j≥0, (k^(j+r−1)−k^j)d_r=0 on that weight. After rationalization all differentials vanish and the finite filtration splits canonically into the actual simultaneous Adams eigenspaces, as in rational-motivic-degeneration. The integral construction is on compatible K-spaces, finite cover diagrams and their homotopy groups: it does not assert that every integral λ-operation is a map of stable spectra.

**Hypotheses.** X belongs to the imported support-tower class. Use S.6 higher λ/Adams operations, not only a K₀ Chern character. The operations must commute with refinement, cover truncation and localization connecting maps.

**Proof or construction.**

1. Use the finite cover approximations of §12.5–12.9 and their functorial support fibres. On finite diagrams the special λ-ring operations commute with restriction and support-triple boundaries by §12.10 and Remark 12.11.
2. Use the additive Adams polynomials to descend to maps of exact couples on homotopy groups. Identify their augmentation with S.6’s existing operation through the same exact-category construction; the finite-diagram comparison is an explicit S.6 supplier obligation.
3. Apply Theorem 12.12 to the cycle layer: weight is j=−b, so the eigenvalue is k^j. Reuse the previously reviewed correction MotivicEtaleKTheory/E8 to the printed exponent.
4. Compare ψ^k d_r and d_r ψ^k, using that the target has weight j+r−1. Over Q their scalar difference is nonzero; use convergence and S.6’s actual finite-weight decomposition to split the abutment, not an arbitrary choice of a vector-space complement.

**Check.** On a unit in K₁(F), ψ^k(u)=u^k in multiplicative notation and has motivic weight one. On E₂ of weight zero the operation is the identity. Weight j=1 and r=2 gives the annihilator k²−k; k=2 yields 2 d₂=0, not integral degeneration.

**Dependencies.** `MotivicEtaleKTheory:M.6b/motivic-native-index-transport`, `MotivicEtaleKTheory:M.6b/rational-motivic-degeneration`, `SchemeKTheoryOperations:S.6/soule-scheme-operations`, `SchemeKTheoryOperations:S.6/scheme-weight-decomposition`, `mathlib:Module.End.mem_eigenspace_iff`.

**Source.** [Levine2001] §12.5–12.12, pp.54–59; Theorem 14.7, pp.73–74: Finite functorial K-space operations commute with boundaries and act with the motivic weight. §12.7 explicitly distinguishes unstable λ operations from stable maps. [Weibel2013] VI §4.9, pp.485–486: Commuting Adams operations with differentials gives the weight-difference annihilator and rational degeneration.

### Completion of the motivic quotient tower

Declaration: `MotivicEtaleKTheory:M.6b/motivic-quotient-completion` (theorem).

Let F^pK(X) be the imported tower for smooth X of dimension d over an admitted perfect field, with F⁰≃K(X) and π_m F^p=0 for p>d+m for every fixed integer m (in nonnegative degrees by the coniveau bound; in negative degrees by the connective layer model). Put T_p=cofib(F^p→K). Then holim_p F^p≃0 and K≃holim_p T_p. For n≥0 the filtration of K_n is zero at F^(d+n+1) and is finite and exhaustive, and the motivic sequence converges strongly. The argument checks both π_m and π_(m+1) before using the Milnor exact sequence; it does not commute an infinite limit with homotopy groups without its lim¹ term.

**Hypotheses.** The dimension/connectivity theorem M.6b/motivic-strong-convergence is a prerequisite, not an axiom replacing its support/dévissage proof. H.6 supplies homotopy limits and exactness of limits of fibre sequences.

**Proof or construction.**

1. For each integer m choose p larger than both d+m and d+m+1, also p≥0. The two inverse systems of homotopy groups are eventually zero, so their limits and the relevant lim¹ vanish.
2. Apply H.6/milnor-sequence to conclude π_m holim F=0 for all m, and use the supplied stable Whitehead criterion.
3. Take the homotopy limit of F^p→K→T_p; its fibre is holim F. Use the fixed-degree finite filtration and exact-couple convergence theorem to identify associated graded pieces without a residual completion quotient.
4. Keep H.6’s multiplication-by-ℓ tower counterexample in the acceptance suite, so the proof cannot be replaced by the assertion lim π_m F=0 alone.

**Check.** At d=0,n=0, F¹K₀=0 and the unit survives. The tower of spheres with maps multiplication by ℓ has a nonzero lim¹≅Z_ℓ/Z and is excluded from the eventual-zero argument. The finite bound is d+n+1, with no implicit uniform bound in n.

**Dependencies.** `MotivicEtaleKTheory:M.6b/motivic-strong-convergence`, `StableHomotopyKTheory:H.6/milnor-sequence`, `StableHomotopyKTheory:H.6/spectral-sequence-convergence-complete`, `StableHomotopyKTheory:H.6/nonzero-lim-one-example`.

**Source.** [LevineConiveau] Proposition 2.1.3 and Corollary 2.1.4, pp.11–12: Connectivity of the support tower supplies fixed-degree eventual vanishing and convergence for a bounded-below theory. [Levine2001] Theorem 14.5 and Lemma 14.6, pp.71–72; Appendix D.2, p.94: The explicit dimension/degree filtration bound yields the finite-filtration specialization. The previously reviewed proof issues E6/E7 remain inherited obligations.

## M.7 — Étale K-theory and the comparison range

### Imported target contracts

The following targets retain their M.5d identifiers and hypotheses. The six refinements below supply the corrected original descent route, a strict transfer comparison, coefficient passages and the positive-degree dyadic filtrations.

| Imported identifier after `MotivicEtaleKTheory:M.7/` | Contract |
| --- | --- |
| `beilinson-lichtenbaum` | The prime-to-characteristic motivic-complex comparison identifies Z/m(j) with τ≤j Rε_*μ_m^(⊗j) in its admitted scheme class. The resolution-free proof input is a recorded prerequisite. |
| `dedekind-motivic-comparison` | The Dedekind/arithmetic counterpart uses the actual arithmetic motivic-complex theorem, including its coefficient and localization hypotheses; the smooth perfect-field theorem is not silently extended to O_S. |
| `finite-etale-k-theory` | Hypercomplete periodic finite-coefficient étale K has homotopy sheaf μ_m^(⊗j) in degree 2j, j∈Z, and zero odd homotopy sheaf. The comparison from ordinary K is sheafification followed by periodic descent. |
| `bott-etale-descent` | Under the original finite-dimensional, finite-cd and Tate–Tsen conditions, the periodic étale descent sequence has E₂^(s,t)=H^s(μ_m^(⊗t/2)) for even t and converges to K^et_(t−s). |
| `quillen-lichtenbaum-field-range` | In the admitted field comparison class with finite ℓ-cohomological dimension d, ordinary-to-étale K is an isomorphism in nonnegative degrees n≥d−1 and injective at nonnegative n=d−2. Compare the motivic truncation regions and cd bounds; do not cite the K-book’s edge-map theorem as a standalone proof of this range. |
| `s-integer-comparison-range` | For R=O_(F,S)[1/ℓ], finite S, ℓ odd or F totally imaginary at ℓ=2, finite-coefficient comparison is an isomorphism for n≥1 and injective at n=0. For completed K, inverting ℓ preserves n≥2, with a separate K₁ units calculation. |
| `arithmetic-adic-degrees` | For j≥2 in that finite-cd arithmetic class, the completed degrees 2j−1 and 2j−2 identify with continuous H¹(j) and H²(j), respectively. |
| `etale-adams-weights` | The Adams action on even homotopy sheaf μ_m^(⊗j) has weight j and is compatible with the periodic descent filtration, under the stated coefficient operation hypotheses. |
| `etale-k-transfer` | Finite separable/étale transfer agrees with the cohomological trace and satisfies the projection formula. The actual filtered odd-prime finite étale proof is refined below. |
| `number-ring-duality-sign` | Preserve the imported arithmetic duality sign and K-theory/coefficient pairing conventions; generic duality remains with its owner. |
| `suslin-real-comparison` | Finite-coefficient algebraic K of a real closed field is compared with the real BO/KO object in the stated nonnegative range. The original Lie-neighbourhood proof and the real topological supplier are distinct inputs. |
| `real-mod-two-sequence` | The real mod-two sequence has its nonzero d₂ and period-eight K groups of orders 2,2,4,2,2,0,0,0 in degrees 0 through 7. The degree-two group is Z/4, not two unrelated Z/2 summands. |
| `real-place-correction` | Form the actual fibre of restriction to the real places, retaining its full long exact sequence. Page maps are the α_h(j) restrictions of M.2; their kernels are not positive cohomology. |
| `dyadic-s-integer-extensions` | Retain the Q₂/Z₂ period-eight table and its extension information; integral torsion and mod-two K are separate coefficient passages. |

The finite-cd field comparison range follows by comparing motivic weights to the truncation h≤j. On degree n, a missing weight j>n first appears in cohomological degree 2j−n≥n+2. If n≥d−1 those terms vanish by cd≤d. The edge boundary at n=d−2 gives only the stated injection. The scheme, coefficient and norm-residue inputs of the imported comparison remain necessary. For real dyadic fields ordinary cd₂ is infinite despite virtual cd₂=2; this argument cannot be reused there.

### Corrected Thomason descent proof

Declaration: `MotivicEtaleKTheory:M.7/corrected-thomason-descent` (theorem).

For a separated regular noetherian scheme X of finite Krull dimension, an invertible prime ℓ, uniformly bounded ℓ-torsion cohomological dimensions of every residue field including nonclosed points, and a finite Tate–Tsen filtration for every residue field as in Thomason (2.112), the Bott-periodic finite-coefficient comparison is an equivalence K(X;Z/ℓ^ν)[β⁻¹]≃K^et(X;Z/ℓ^ν). Its strongly convergent descent sequence is E₂^(s,t)=H^s_et(X,μ_(ℓ^ν)^(⊗t/2)) for even t, zero for odd t, abutting to K^et_(t−s), with differential (r,r−1). At ℓ=2 impose X over Z[1/2,i] and use the source’s Appendix A reduction for small exponents. Here β means an admissible Bott element/power in that coefficient construction, not a universally chosen degree-two class over X. The proof uses the 1989 correction: arbitrary cd-one extensions give a Bott-annihilated kernel and cokernel of descent on homotopy groups; the stronger pre-inversion homotopy inverse is available only in the countably generated case.

**Hypotheses.** Use the periodic hypercomplete étale K sheaf of finite-etale-k-theory, not a connective replacement. The Tate–Tsen filtration starts with the cyclotomic extension and has successive induced cd≤1 Galois steps. No assertion that finite cd alone removes the other original Thomason hypotheses.

**Proof or construction.**

1. Use Gabber rigidity at henselian stalks and the separably closed field K computation imported in M.7/finite-etale-k-theory to identify the periodic homotopy sheaves with even Tate twists.
2. For a countably generated cd-one Galois extension choose a cofinal sequence of finite subextensions. A sequential telescope needs adjacent specified homotopies, which the corrected proof supplies. For arbitrary cd-one extensions, reduce to pro-ℓ Sylow subgroups and finite-rank free pro-ℓ quotients, then use bounded-cd continuity to show Bott annihilation on the kernel/cokernel.
3. Invert β using bounded cohomological dimension, apply the corrected descent statement at each Tate–Tsen step, and descend along the cyclotomic step using the prime-to-ℓ transfer where the source does so. Bockstein induction handles prime powers.
4. Pass from fields to the regular scheme using localization and Brown–Gersten descent as in Theorem 2.45. Apply the existing spectral hypercohomology/Postnikov machinery with the uniform bound to obtain strong convergence and the nonconnective étale comparison of Theorem 4.11.

**Check.** The comparison need not hold in low degrees before Bott inversion. At ℓ=2 a real residue field does not satisfy the finite-cd hypothesis and is handled by the real-place nodes. Theorem 2.42 is never invoked in its uncorrected arbitrary-index homotopy-inverse form.

**Dependencies.** `MotivicEtaleKTheory:M.7/finite-etale-k-theory`, `MotivicEtaleKTheory:M.7/bott-etale-descent`, `KTheoryFiniteLocalFields:L.2/gabber-rigidity`, `StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence`, `EnhancedDerivedSheaves:E2`, `SchemeKTheoryOperations:S.4/sheaf-hypercohomology-spectrum`.

**Source.** [Thomason1985] Theorems 2.43–2.46, pp.498–501; §3.34, p.516; Theorems 4.1 and 4.11, pp.516–520: These give the original scheme hypotheses, periodic homotopy sheaves and strong descent theorem; the proof of their cd-one input is replaced by the erratum. [Thomason1989] Corrected Theorem 2.42(a),(b) and proof, pp.675–677: Countably generated extensions admit the comparison map; the general case only needs the Bott-annihilation statement to recover the original periodic descent conclusions.

### Finite étale transfer on the descent filtration

Declaration: `MotivicEtaleKTheory:M.7/finite-etale-descent-transfer` (theorem).

For a finite étale map f:Y→X satisfying corrected-thomason-descent at an odd prime ℓ, the actual K-theory restriction-of-scalars transfer induces a map of periodic finite-coefficient descent spectral sequences. On E₂ it is the cohomological trace H^s_et(Y,f*μ_m^(⊗j))→H^s_et(X,μ_m^(⊗j)); at a geometric stalk it sums the fibres above that point. It converges to the K(1)-local/periodic K transfer. Coefficient maps and Bocksteins commute with transfer when the transfer is made on the underlying K presheaf before taking those coefficient triangles. This is an additive map; the projection formula is the multiplicative compatibility, not multiplicativity of transfer itself.

**Hypotheses.** m=ℓ^ν, ℓ odd; both schemes satisfy the explicit original descent hypotheses. Finite étale is essential for this proof; no ramified proper-pushforward theorem is inferred.

**Proof or construction.**

1. Use Blumberg–Mandell Lemma 10.2: replace the Y presheaf by the Waldhausen category of a Y-bundle, an X-bundle and an identification with its pushdown. Forgetting the identification is a weak-equivalence leg; remembering the X-bundle is an actual transfer map.
2. Choose compatible geometric points. Proposition 10.4 compares the two Godement resolutions by the fibrewise product functor and its adjunction-compatible transformations. This identifies the resulting spectral sequences from E₂ onward.
3. Read the homotopy sheaf trace on stalks; the codiagonal gives the étale cohomology transfer. Use the underlying presheaf map for coefficient/Bockstein compatibility and the existing K product projection formula for the module identity.

**Check.** For Y the disjoint union of d copies of X, cor∘res is multiplication by d on every page and at the abutment. For the identity map the filtered transfer is the identity. A degree-d transfer sends 1 to d; it is generally not a unital ring homomorphism.

**Dependencies.** `MotivicEtaleKTheory:M.7/corrected-thomason-descent`, `MotivicEtaleKTheory:M.7/etale-k-transfer`, `SchemeKTheoryOperations:S.4/hypercohomology-spectral-sequence`, `ArithmeticGaloisDuality:R02.2`, `StableHomotopyKTheory:H.6/bockstein-long-exact-sequence`.

**Source.** [BM2018] Theorem 10.1, Lemma 10.2 and Proposition 10.4 with proofs, pp.43–46: A strictified transfer presheaf and compatible Godement resolutions give the filtered trace comparison. This material is in v3; v4 omits the proof appendix.

### Arithmetic coefficient and completion comparison

Declaration: `MotivicEtaleKTheory:M.7/arithmetic-bockstein-comparison` (theorem).

Let F be a number field, S finite containing the archimedean and all ℓ-adic places, and R=O_(F,S). Assume ℓ odd or F totally imaginary. For j≥2 and m=ℓ^ν there is a canonical odd-degree comparison K_(2j−1)(R;Z/m)≅H¹_et(R,μ_m^(⊗j)) and a natural even-degree exact sequence 0→H²_et(R,μ_m^(⊗j))→K_(2j−2)(R;Z/m)→H⁰_et(R,μ_m^(⊗(j−1)))→0, with its spectral filtration and coefficient maps. No splitting of this sequence is chosen. With K_n(R)^∧_ℓ=π_n holim_ν K(R;Z/ℓ^ν), K_(2j−1)^∧_ℓ≅H¹_cont(R,Z_ℓ(j)) and K_(2j−2)^∧_ℓ≅H²_cont(R,Z_ℓ(j)). For these finitely generated K groups this agrees with K_n(R)⊗Z_ℓ. If one starts before inverting ℓ, localization preserves these completed groups for n≥2; it changes K₁ by the inverted-prime units.

**Hypotheses.** The arithmetic motivic/étale comparison and cd≤2 inputs are imported with their own proof gaps; this node refines the coefficient passage. Continuous cohomology uses the derived inverse limit of the finite coefficient complexes.

**Proof or construction.**

1. Use the S-integer comparison range and the descent filtration. In odd total degree only cohomological degree one remains; in even total degree cohomological degrees two and zero give the displayed filtration.
2. Keep the coefficient maps inherited from the spectra. In particular the H⁰ term’s transition includes the appropriate coefficient multiplication in the shifted twist; an abstract isomorphism to a constant finite group does not determine that map.
3. Apply the Bockstein/Milnor sequences to both sides, retaining lim¹ until finiteness and the coefficient transition calculation remove it. This gives the continuous H¹/H² comparison, rather than taking limits of arbitrarily split extensions.
4. Import finite generation of K_n(O_(F,S)), n≥2, from ArithmeticKTheory N.3; only then identify the derived completion homotopy group with its tensor product. Use finite residue-field K groups in localization to justify the inversion-of-ℓ assertion.

**Check.** The H⁰ term at finite coefficients cannot be discarded merely because the completed even group is H². The j=1 units/Picard/Brauer calculation is kept separate. For a real number field at ℓ=2 the stated cd bound fails and the dyadic nodes apply.

**Dependencies.** `MotivicEtaleKTheory:M.7/s-integer-comparison-range`, `MotivicEtaleKTheory:M.7/arithmetic-adic-degrees`, `MotivicEtaleKTheory:M.1/continuous-limit-comparison`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticGaloisDuality:R02.3`, `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`.

**Source.** [Weibel2013] VI §4.6, pp.483–484; Theorem 8.2 and its proof, pp.513–514: The finite filtration and coefficient sequences distinguish finite-level K groups from continuous/completed groups; the arithmetic finite generation concerns O_S, correcting VI 8.1’s field notation.

### Real restriction and coefficient boundaries

Declaration: `MotivicEtaleKTheory:M.7/real-restriction-boundary-square` (comparison).

Let R=O_(F,S) with S finite containing the dyadic and archimedean places and F having r₁>0 real embeddings. For A=Z/2^ν or Q₂/Z₂ let C_A=fib(K(R;A)→⊕_(v real)K(R_v;A)). The real-place-correction node’s sequence is the actual fibre sequence C_A→K(R;A)→⊕K(R_v;A)→ΣC_A. Its long exact sequence, all restriction maps and connecting homomorphisms commute with coefficient inclusions, reductions and Bocksteins through maps of these fibre sequences. On motivic pages the restriction is α_h(j):H^h(R,A(j))→⊕H^h(R_v,A(j)), with h=2j−n; write H̃^h=ker α_h, retaining cokernel α_(h−1) in the fibre cohomology. These kernels are not identified with positive or Tate-modified cohomology. The real topological comparison determines the nontrivial extension in K_(8k+2)(R_v;Z/2)≅Z/4.

**Hypotheses.** Use the admitted arithmetic extension of the motivic tower and coefficient comparison, with the inherited gap explicit. Use the requested real BO/KO comparison from RefinedTraceMethods, Part II; complex KU is insufficient.

**Proof or construction.**

1. Apply functoriality of the fibre to the restriction square before deriving any long exact sequence. The coefficient triangle Z/2^ν→Z/2^(ν+1)→Z/2 and its boundary give maps of triangles.
2. Use the naturality of the cycle layers under embeddings into R_v to identify the page map with α_h(j). Apply M.2’s high-degree real isomorphism (h≥3) and h=2 surjectivity with their stated finite-coefficient hypotheses.
3. Compare with the real periodic sequence. Its d₂ and the nonsplit Z/4 extension determine both the arithmetic differential and the possible low-filtration extensions; they cannot be recovered from a list of dimensions alone.
4. For Q₂/Z₂ pass by filtered colimits with the actual coefficient maps. For integral 2-primary groups combine with the Bockstein sequence and the finite-generation/rank input.

**Check.** With no real places the restriction target is zero, so C_A≃K(R;A). A real summand in degree 2 mod 8 gives Z/4, whereas two unrelated Z/2 graded pieces would give the wrong extension. The cohomology of the fibre fits 0→coker α_(h−1)→H^h(fibre)→ker α_h→0; replacing it by just ker α_h loses low-degree terms.

**Dependencies.** `MotivicEtaleKTheory:M.7/real-place-correction`, `MotivicEtaleKTheory:M.7/real-mod-two-sequence`, `MotivicEtaleKTheory:M.2/positive-and-modified-cohomology`, `MotivicEtaleKTheory:M.2/high-degree-real-isomorphism`, `RefinedTraceMethods:RT.4`, `ArithmeticGaloisDuality:R02.4`, `StableHomotopyKTheory:H.6/coefficient-spectrum`, `StableHomotopyKTheory:H.6/moore-spectrum-change-of-coefficients`, `StableHomotopyKTheory:H.6/qp-zp-coefficients`.

**Source.** [Weibel2013] VI Theorem 9.1 and proof, pp.517–518; §9.2–9.4, pp.518–520: The real restriction maps and real mod-two differential control the arithmetic sequence; Theorem 9.4 retains the resulting extensions.

### Dyadic mod-two filtration

Declaration: `MotivicEtaleKTheory:M.7/dyadic-mod-two-filtration` (theorem).

Under real-restriction-boundary-square, abbreviate H^i=H^i_et(R,Z/2), H̃^i=ker α_i and ε=dim_F₂ coker[H¹→(Z/2)^r₁], the signature defect. For n>0, the motivic filtration on K_n(R;Z/2), indexed by n mod 8, has the following description. Residue 0: H̃²⊕Z/2; 1: H¹; 2: an exact sequence 0→H²→K_n→Z/2→0; 3: 0→(Z/2)^(r₁−1)→K_n→H¹→0; 4: 0→(Z/2)^ε→K_n→H²→0; 5: 0→(Z/2)^(r₁−1)→K_n→H̃¹→0; 6: (Z/2)^ε⊕H̃²; 7: H̃¹. The direct-sum assertions express splitting of groups, without a preferred splitting. The d₂ is obtained by real restriction and E₃=E∞. For n=0 keep the additional Pic(R)/2 term; the positive-degree table is not a K₀ formula.

**Hypotheses.** Finite S contains all places above 2; r₁>0. All mod-two twists are canonically the constant Z/2 sheaf; the untwisted notation is used only at this coefficient level.

**Proof or construction.**

1. Compute α_i with M.2, including the signature defect and the dimensions of the two kernels. Compare the d₂ with the real mod-two spectral sequence.
2. In the public motivic coordinates, each nonzero graded piece is on the table of Weibel VI Figure 9.7.1. Degree considerations give E₃=E∞ but do not split a filtered group.
3. Read the filtration in descending cohomological degree, giving the subgroup on the left of each displayed exact sequence. Use the coefficient/Bockstein argument for the two residues 0 and 6 in which the source proves splitting.
4. Separate the one positive-column term Pic(R)/2 affecting K₀. Preserve natural restriction and coefficient maps from the sequence instead of selecting abstract group isomorphisms.

**Check.** When r₁=1 the residue-3 and residue-5 correction subgroup is zero. The residue-2 extension can contain order-four elements; dimensions of its graded pieces do not force exponent two. Signature defect zero removes the residue-4 and residue-6 correction subgroup, but does not eliminate the real restriction map.

**Dependencies.** `MotivicEtaleKTheory:M.7/real-restriction-boundary-square`, `MotivicEtaleKTheory:M.2/mod-two-dimension-formulas`, `MotivicEtaleKTheory:M.7/dyadic-s-integer-extensions`.

**Source.** [Weibel2013] VI §9.6–9.7, pp.520–522, especially Theorem 9.7 and Figure 9.7.1: The positive-degree mod-two groups are filtered extensions; only the two stated residues have the additional splitting assertion.

### Dyadic integral torsion

Declaration: `MotivicEtaleKTheory:M.7/dyadic-integral-torsion-filtration` (theorem).

For R=O_(F,S) as above put w_i=#H⁰(F,Q₂/Z₂(i)) for i≥2, and ρ=dim_F₂ im[K⁽ᴹ⁾₄(F)→K₄(F)]. Write H²(i)=H²_cont(R,Z₂(i)) and H̃²(i)=ker[H²(i)→⊕_(v real)H²(R_v,Z₂(i))] for even i. Then ε(R)≤ρ<r₁ and, for n≥2, K_n(R){2} is as follows for n mod 8: 0, H²(4k+1); 1, Z/2; 2, H²(4k+2); 3, (Z/2)^(r₁−1)⊕Z/(2w_(4k+2)); 4, an exact sequence 0→(Z/2)^ρ→K_(8k+4)(R){2}→H²(4k+3)→0; 5, zero; 6, H̃²(4k+4); 7, Z/w_(4k+4). The order of the residue-4 extension is specified, not a canonical splitting or a claim that ρ=ε(R). The integer ρ is defined over F and is independent of S, whereas ε(R) can change with S.

**Hypotheses.** n≥2; r₁>0; finite S contains all dyadic and archimedean places. The arithmetic finite-generation and Borel rank inputs are used to distinguish torsion in an integral group from finite-coefficient K groups.

**Proof or construction.**

1. Start with the imported Q₂/Z₂ extension table. For the finite even integral group use the Bockstein exact sequence 0→(Q₂/Z₂)^rank K_(n+1)→K_(n+1)(R;Q₂/Z₂)→K_n(R){2}→0.
2. Use the Borel rank, continuous coefficient sequence, and α restrictions to identify the nondivisible parts with H² or its real-restriction kernel. Read odd integral torsion from VI Theorem 9.5.
3. In degree 4 mod 8 retain the image of Milnor K₄. The mod-two edge map gives ε(R), while its integral image has rank ρ; divisibility in K₄ explains why those can differ. Apply the source’s periodicity argument to obtain the same ρ at all n=8k+4.
4. Carry the actual extension and coefficient/restriction maps forward to arithmetic applications; no list of abstract group orders substitutes for the extension.

**Check.** For r₁=1 one has ρ=ε=0, removing the extra residue-4 kernel. For F=Q, R=Z[1/2], n=3, w₂=8 gives K₃(R){2}≅Z/16, agreeing with the 2-primary part of K₃(Z). A mod-two K group at residue 5 can be nonzero although K_(8k+5)(R){2}=0; Bockstein sees the neighbouring degree.

**Dependencies.** `MotivicEtaleKTheory:M.7/dyadic-mod-two-filtration`, `MotivicEtaleKTheory:M.7/dyadic-s-integer-extensions`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `BorelRegulators:R.4`, `StableHomotopyKTheory:H.6/coefficient-spectrum`, `MotivicEtaleKTheory:M.1/continuous-limit-comparison`, `StableHomotopyKTheory:H.6/moore-spectrum-change-of-coefficients`, `StableHomotopyKTheory:H.6/qp-zp-coefficients`.

**Source.** [Weibel2013] VI Corollary 9.10, p.523; Theorem 9.11 and proof, pp.524–525; Theorem 9.5, p.520: The integral two-primary table contains a field-defined Milnor-image rank and a potentially nonsplit residue-4 extension, recovered from the divisible-coefficient calculation.

## M.8 — Regulators and integral structures

### Imported target contracts

These identifiers remain in the M.5d packet. They establish the general objects to which the seven refinements below apply.

| Imported identifier after `MotivicEtaleKTheory:M.8/` | Contract |
| --- | --- |
| `finite-etale-chern` | For a regular admitted X, m=ℓ^ν invertible on X, i≥1 and n≥1, construct additive c_(i,n):K_n(X;Z/m)→H^(2i−n)(X,μ_m^(⊗i)). Its symbol normalization is (−1)^(i−1)(i−1)! times the Milnor cup symbol. K₀ uses the total Chern/Whitney convention instead of an additive c_i. |
| `motivic-chern-character` | Construct the higher rational character in the admitted smooth scheme class, with ch_(i,n)=(−1)^(i−1)c_(i,n)/(i−1)! for n>0 and the separate Newton/i! formula at n=0. The finite-weight rational decomposition is an actual comparison, not a formal relabelling of K. |
| `supported-cycle-character` | The higher character is compatible with the admitted support/localization triangles and geometric cycle realization, with the existing support-intersection inputs and their proof obligations. |
| `deligne-regulator` | The motivic real Deligne map uses the actual Hodge Part II logarithmic complex, with products, real conjugation and compactification comparison. The specialized cubical roof is specified below. |
| `number-field-deligne-normalization` | At each embedding use H_D¹(C,R(j))=C/(2πi)^j R; its real-conjugation coordinates give the specified Borel target. Integral Z(j) is a different quotient. This early normalization is exported to R.7. |
| `chern-functoriality` | Preserve pullback, products, localization/residue and the admitted trace/pushforward comparisons, including the Todd correction where a proper Riemann–Roch theorem requires it. No arbitrary higher proper regulator theorem is inferred from K₀ GRR. |
| `integral-motivic-structures` | Keep the integral model image, its torsion-free group and its rational integral part separate. Finite generation, injectivity and full real rank must be supplied before calling the image a regulator lattice. |
| `tate-elliptic-realization-dictionary` | Export the actual Tate/h¹(E) motive realizations, using the native elliptic Tate module through the dual cohomological identification, with geometric Frobenius polynomial and good-reduction comparison. |
| `norm-compatible-regulator-families` | Use the existing norm-family carrier, including Soulé’s particular classes where supplied. Each finite extension has the prescribed corestriction relation and Euler factors; no universal existence of such classes is asserted. |
| `euler-factor-regulator-compatibility` | A linear, Galois-equivariant, transfer-compatible regulator carries a given K family’s exact norm relation to the corresponding cohomological relation with the same convention for the polynomial. |
| `selmer-regulator-factorization` | The regulator satisfies the specified local conditions and, with actual local maps and comparison homotopies, lifts to the generic Selmer complex. H¹ membership alone is a weaker assertion. |
| `arithmetic-fundamental-line` | Form the inverse determinant of the supplied perfect compact-support arithmetic complex. A selected rational motivic/Betti/de Rham line and comparison maps require their own independent realization/period hypotheses. |
| `regulator-determinant-comparison` | Compare actual integral lattice determinants through the specified archimedean and p-adic maps, preserving R.7’s normalization and local indices. The Tamagawa-number distinguished-basis assertion remains a conjectural condition. |

The early étale Chern and Deligne normalization nodes do not depend on D.2 or R.7. Those roadmaps consume the early classes; the local and determinant applications then consume their comparison theorems. Similarly M.7 exports to ArithmeticKTheory N.6, so this part imports finite generation from N.3 without an N.6 reverse dependency. The independent MC.2/PS.0 period spaces precede M.8; the regulator/leading-term assembly in PS.3/PS.4 follows it.

### Cubical Deligne regulator

Declaration: `MotivicEtaleKTheory:M.8/cubical-deligne-regulator-roof` (construction).

For a smooth equidimensional quasi-projective complex variety X and p≥0, construct the real regulator CH^p(X,n)→H_D^(2p−n)(X,R(p)), n≥0, by the following derived roof. Use the cubical complex z^p(X,*)₀ with cube P¹\{1} and faces 0,∞, imported from M.4. For each cube take the filtered colimit over admissible codimension-p supports Z of D_log,Z=cone[D_log(X×□^n,p)→D_log((X×□^n)\Z,p)][−1], truncate this support complex at 2p, normalize the cubical direction and totalize. Reindex by 2p−* to obtain B_supp. Its top support-class projection g to normalized support cohomology is a quasi-isomorphism, and that cohomology complex is z^p(X,*)₀⊗R by the cycle class. Forgetting the support component (ω,g_Z)↦ω gives B_supp→A, the analogous normalized total complex without supports; the inclusion τ≤2p D_log(X,p)[2p−*]→A is a quasi-isomorphism. Invert these two quasi-isomorphisms in the derived category to obtain the regulator. For varieties over R take the conjugation-fixed real complex with its Tate normalization. This construction uses the Hodge Part II logarithmic complex, not a second definition of Deligne cohomology.

**Hypotheses.** The generic logarithmic Deligne complex, support cone, semipurity, homotopy invariance and compactification-independence comparison are supplied in the Hodge direction. Truncate after forming the support cone; truncation does not commute with that cone. The sign of the total differential is d_D+(−1)^(form degree)∂_cube.

**Proof or construction.**

1. Use semipurity to identify each supported truncated complex’s cohomology solely in degree 2p, and identify that group with codimension-p cycles by the cycle class. The bounded vertical degree ensures convergence of the normalized total-complex comparison.
2. Use cubical homotopy invariance to prove that the unsupported total complex A is quasi-isomorphic to the degree-zero cube complex. Normalization removes degenerate cubes.
3. The projection of support pairs to the first entry is a chain map with the chosen total differential. Form the roof through g and the unsupported quasi-isomorphism; choices of representatives are eliminated by its derived-category construction.
4. For flat maps use pullback of supports and forms directly. For a general morphism between smooth varieties use the good-position subcomplex for its graph and the imported moving lemma, which gives naturality on homology. Apply real conjugation only after including its action on R(p).

**Uses.** M.8/motivic-chern-character and number-field-deligne-normalization: Compare the actual higher character to Deligne classes, with a fixed normalization. BorelRegulators:R.7 and PeriodsAndSpecialValues:PS.3: Supply the early Deligne map before the analytic comparison and determinant applications.

**Planning API.**

- `CubicalRegulator.supportRoof` (constructor): The cycle/support/unsupported roof with specified quasi-isomorphism legs.
- `CubicalRegulator.cycleClass` (compatibility): At n=0 the map equals the usual normalized real Deligne cycle class.
- `CubicalRegulator.flatPullback` (functoriality): Flat maps act on the roof by pullback of forms and supports.
- `CubicalRegulator.pullback` (functoriality): Every morphism between the admitted smooth varieties acts on homology, through a good-position graph subcomplex.
- `CubicalRegulator.conjugation` (compatibility): The roof commutes with the real involution including its Tate action.
- `CubicalRegulator.compactification` (equivalence): The comparison for two normal-crossing compactifications identifies the induced regulator; supplied by the Hodge Part II contract.

**Definition tests.**

- `CubicalRegulator.point_unit` (example): For X=Spec C, CH⁰(X,0)=Z, the unit maps to 1 in H_D⁰(X,R(0))=R.
- `CubicalRegulator.hyperplane` (example): The class of a hyperplane on P¹ maps to c₁^D(O(1)) with the R(1)=2πiR normalization, not an unnormalized de Rham generator.
- `CubicalRegulator.degenerate_cube` (relation): A cycle pulled back along a cubical degeneracy is zero in the normalized source and maps to zero.
- `CubicalRegulator.support_boundary` (relation): A boundary in the support total complex projects to an exact class in A; forgetting the second component with the wrong cone sign fails this check.

**Check.** The map is independent of the support representative and of the admitted compactification through the supplier comparison. It sends an ordinary algebraic cycle to its real Deligne cycle class. It is an actual map from the imported cycle complex in the derived category, not a choice of a map on a basis of CH⊗R.

**Dependencies.** `MotivicEtaleKTheory:M.4/cubical-cycle-complex`, `MotivicEtaleKTheory:M.4/moving-lemma`, `MotivicEtaleKTheory:M.8/deligne-regulator`, `tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`.

**Source.** [BurgosFeliu] Definition 1.28 and §1.11, pp.11–12; Lemma 2.11 and Propositions 2.8, 2.13, 2.19, pp.15–18; §3.1 and Proposition 3.3, p.19: Support semipurity and cubical normalization give the regulator roof; projection of support pairs defines the map, with the stated distinction between flat chain functoriality and general homological pullback.

### Beilinson regulator comparison

Declaration: `MotivicEtaleKTheory:M.8/beilinson-character-comparison` (comparison).

For X smooth quasi-projective over C and n≥0, the composite K_n(X)⊗Q→⊕_(p≥0)CH^p(X,n)⊗Q→⊕_(p≥0)H_D^(2p−n)(X,R(p)), using the imported motivic higher Chern character and cubical-deligne-regulator-roof, is the Beilinson regulator defined by the universal Deligne characteristic classes. For n>0, its weight-p component uses ch_(p,n)= (−1)^(p−1)c_(p,n)/(p−1)! for p≥1. At n=0 use the Newton polynomial divided by p!, not the higher additive formula. At an embedding of a number field, the degree-one target is C/(2πi)^p R; replacing R by Z gives a different integral target. For p=1 the real map on a unit is log|u|.

**Hypotheses.** Use the actual higher motivic character of M.8, not S.7’s K₀-only character. For arithmetic X apply the construction to its complex embeddings and the imported real-conjugation descent.

**Proof or construction.**

1. Evaluate the universal Chow and Deligne Chern classes on stable Grassmannians. The ordinary cycle class identifies them on K₀.
2. Use flat Čech nerves of trivializing covers and the universal simplicial classifying sheaf. The good-position/specialization construction for higher cycles supplies a well-defined universal higher characteristic map; it cannot be replaced by arbitrary pullback of all cycles.
3. Apply Burgos–Feliu Theorem 3.5 to identify the two regulators. Transport the imported higher-Chern normalization and the separate K₀ Newton formula.
4. For the point target use the imported Deligne cone; in weight one its quotient removes the imaginary period line, so the regulator on C× is the real logarithm. Export this normalization to R.7 before consuming R.7’s factor-two comparison.

**Check.** On line bundles at K₀ the weight-two character is c₁²/2, while the higher positive-degree additive formula has coefficient −1 in front of c₂. K₁(C) in weight one recovers log|u|, including zero on roots of unity. The comparison does not assert an integral rational-character isomorphism.

**Dependencies.** `MotivicEtaleKTheory:M.8/cubical-deligne-regulator-roof`, `MotivicEtaleKTheory:M.8/motivic-chern-character`, `MotivicEtaleKTheory:M.8/number-field-deligne-normalization`, `GeneralAlgebraicKTheory:K.2`.

**Source.** [BurgosFeliu] Theorem 3.5 and proof, pp.20–23; Remark 3.4, p.19: Universal characteristic classes and Grassmannian descent identify the cycle regulator with Beilinson’s higher K regulator. [Weibel2013] V §11.10–11.14, pp.455–462: Higher Chern characters and the additive factorial normalization are distinct from the K₀ total Chern/Whitney formula.

### Tate and elliptic Euler-factor dictionary

Declaration: `MotivicEtaleKTheory:M.8/native-tate-euler-normalizations` (theorem).

Import the actual Galois realizations Q_ℓ(j) and H¹_et(E_bar,Q_ℓ)(j), the existing native elliptic Tate module T_ℓE and its dual identification. At a good place v∤ℓ put q=#k_v, a=q+1−#E(k_v), and let Fr be arithmetic Frobenius. Geometric Frobenius is Fr⁻¹. The geometric cohomological polynomials are 1−q^(−j)X for Q_ℓ(j) and 1−a q^(−j)X+q^(1−2j)X² for H¹(E)(j). For a homological lattice T put T*=Hom(T,Z_ℓ(1)); the Rubin polynomial used by ES.2 is P_Rubin(T,X)=det(1−Fr⁻¹X|T*)=det(1−q⁻¹Fr X|T). It is 1−q^(j−1)X for T=Z_ℓ(j), and 1−a q^(j−1)X+q^(2j−1)X² for T=T_ℓE(j). Since H¹(E)(j)≅V_ℓE(j−1) by the Weil pairing, its integral realization is matched to T_ℓE(j−1), with the corresponding substitution in this last formula. These are transported polynomials of existing representations, not definitions of a new elliptic motive or Tate module.

**Hypotheses.** E has good reduction at v and v∤ℓ; bad-place inertia factors require separate local input. Negative powers are evaluated in Q_ℓ; q is a unit at ℓ. Keep coefficient Frobenius Fr separate from the element of Gal(F′/F) substituted into the Euler polynomial in a norm relation.

**Proof or construction.**

1. Use the imported native-elliptic-tate-comparison and good-reduction-frobenius-polynomial from R01.6, whose elliptic inputs come from the current Tau Ceti EllipticCurves roadmap/library.
2. Dualize and twist the two-dimensional representation: H¹(E)=V_ℓE^∨ and V_ℓE^∨≅V_ℓE(−1). Compute the geometric cohomological characteristic polynomial with this variance.
3. Use ES.2/euler-polynomial to convert to Rubin’s Tate-dual convention; eigenvalues on Fr⁻¹ acting on T* equal q⁻¹ times those on Fr acting on T.
4. Apply the existing euler-factor-regulator-compatibility to a family with these exact polynomials. The finite étale transfer comparison identifies the actual corestriction on the descent filtration; existence of a family remains a separate arithmetic theorem.

**Check.** For T=Z_ℓ(1), P_Rubin=1−X; the geometric cohomological Tate polynomial is 1−q⁻¹X. They serve different conventions. For T=T_ℓE, P_Rubin=1−(a/q)X+q⁻¹X², whereas H¹(E) has geometric factor 1−aX+qX². The geometric constant and top coefficients for H¹(E)(j) remain 1 and q^(1−2j), testing both duality and twist.

**Dependencies.** `MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary`, `MotivicEtaleKTheory:M.8/euler-factor-regulator-compatibility`, `MotivicEtaleKTheory:M.7/finite-etale-descent-transfer`, `ArithmeticGaloisRepresentations:R01.6/field-tate-realization`, `ArithmeticGaloisRepresentations:R01.6/native-elliptic-tate-comparison`, `ArithmeticGaloisRepresentations:R01.6/good-reduction-frobenius-polynomial`, `EulerSystemsAndKolyvaginSystems:ES.2/euler-polynomial`.

**Source.** [BlochKato1990] §5.1, p.369, and §5.5.1–5.7, p.372: The regulator realization and local/global representation must use the same twist and variance. The explicit polynomial calculation uses the imported native Frobenius and ES.2 contracts. [Weibel2013] V §11.12, pp.457–459: The higher étale characteristic map is compatible with transfer, supplying the map to which the existing Euler-family interface applies.

### Local Tate regulator and finite condition

Declaration: `MotivicEtaleKTheory:M.8/local-tate-regulator-finite-condition` (theorem).

Let K/Q_p be finite. For j≥2 the rational étale Chern regulator K_(2j−1)(K)→H¹(K,Q_p(j)) agrees with the syntomic Chern class followed by the syntomic period map, and its target equals H¹_f(K,Q_p(j))=H¹_e(K,Q_p(j))=H¹(K,Q_p(j)), of Q_p-dimension [K:Q_p]. The Bloch–Kato exponential D_dR(Q_p(j))/Fil⁰→H¹_e is an isomorphism in these weights. For j=1 use K₁(O_K)=O_K×: its rational completed Kummer image is H¹_f(K,Q_p(1)), of dimension [K:Q_p], whereas H¹(K,Q_p(1)) has dimension [K:Q_p]+1 and the uniformizer class lies outside H¹_f. For a lattice T=Z_p(j), H¹_f(K,T) is the inverse image of the rational condition and contains the torsion in H¹(K,T).

**Hypotheses.** The comparison uses the same integral Chern normalization as finite-etale-chern; replacing it by ch divides by (j−1)! and is a rational change. The full local syntomic theory and exponential comparison are imported from D.2/L1, not constructed here. No general implication H¹_st=H¹_f for elliptic higher weights is used.

**Proof or construction.**

1. Apply Nekovář–Nizioł Proposition 5.7 to X=Spec K, Chern weight j and K degree 2j−1: 2j−(2j−1)=1≥0, so its regulator square applies.
2. Use the actual Tate-representation calculation of Bloch–Kato Example 3.9. For j≥2 the three finite/geometric/exponential spaces have the full H¹ dimension, and the crystalline fixed-vector term in the exponential kernel is zero.
3. At j=1 identify the Kummer/exponential map for the formal multiplicative group using Example 3.10.1. The valuation exact sequence distinguishes units from the uniformizer.
4. Propagate the condition to T and V/T with L4’s inverse-image/image construction. Record the actual local maps needed by the Selmer complex separately: a factorization on H¹ alone supplies no homotopy between maps of complexes.

**Check.** For K=Q_p and j=2 the target has dimension one. For K=Q_p and j=1 a uniformizer gives the additional valuation direction and fails the finite-unit condition. A torsion lattice class mapping to zero rationally remains in the integral finite condition.

**Dependencies.** `MotivicEtaleKTheory:M.8/finite-etale-chern`, `PadicHodgeRegulators:D.2/etale-regulator`, `PadicHodgeRegulators:D.2/syntomic-etale-regulator-comparison`, `SelmerIwasawaCohomology:L4/bloch-kato-condition`, `PadicHodgeRegulators:L1`.

**Source.** [NekovarNiziol] Proposition 5.7 and proof, p.58: The actual syntomic and étale Chern classes commute with the period map in the required degree. [BlochKato1990] (3.7.3), p.354; Example 3.9 and Definition 3.10, p.359; Example 3.10.1, pp.359–360: The Tate calculation distinguishes positive weights, units and the valuation direction; lattice conditions are inverse images.

### Elliptic Kummer and Selmer comparison

Declaration: `MotivicEtaleKTheory:M.8/elliptic-kummer-selmer-adapter` (application).

For an elliptic curve E over a number field F and V=V_pE, use the actual lattice T=T_pE and the local Kummer maps. At v|p, H¹_f(F_v,V) is the image of lim_m E(F_v)/p^m tensored with Q_p; away p, this rational finite Kummer image is zero, while finite lattice/discrete local contributions are retained. The Weil pairing identifies V*(1) with V. These local conditions, together with the unramified complex away p, specialize L2’s Selmer mapping fibre. A regulator on a motivic complex lifts to this Selmer complex only after supplying maps to the actual U_v^+ and homotopies identifying their composites with its local restrictions. Local H¹ membership by itself yields only membership in the kernel-defined Selmer group. The higher-weight realization H¹(E)(j)=V_pE(j−1) is admitted with its own D.5 comparison/regime hypotheses, never by applying the untwisted elliptic Kummer theorem to every twist.

**Hypotheses.** Use the generic Selmer complex of L2 and elliptic finite-Kummer theorem of L4. When identifying H¹ of the complex with the kernel-defined Selmer group, impose the H⁰-surjectivity and local H¹-injectivity conditions in L2/selmer-complex-h1. Crystalline, semistable and bad-reduction regimes of a higher-weight regulator are supplied by D.2/D.5; Nekovář–Nizioł’s general H¹_st statement alone does not give H¹_f.

**Proof or construction.**

1. Transport the native Tate module and Weil pairing through R01.6 and the existing L4 finite-Kummer comparison. Use cohomological duality to identify the twist required for h¹(E)(j).
2. Insert the explicit local maps into the generic Selmer diagram, whose differential is restriction minus the inclusion of local conditions. Use the supplied local homotopies to construct the motivic-to-mapping-fibre map.
3. Use the generic exact sequence with its H⁰ correction to identify the H¹ image. If those map/homotopy inputs are not yet supplied, retain that precise request rather than declaring a constructed derived factorization.
4. Preserve integral local finite quotients in determinant applications, even where the corresponding rational Kummer space is zero.

**Check.** For V_pE the local duality pairing uses the Weil self-duality V*(1)≅V, with no extra Tate twist. A rational zero local space away p does not imply that the integral local contribution has order one. A map whose local restrictions lie in H¹_f need not specify a chain-level Selmer lift; the local homotopies are testable extra data.

**Dependencies.** `MotivicEtaleKTheory:M.8/native-tate-euler-normalizations`, `MotivicEtaleKTheory:M.8/selmer-regulator-factorization`, `SelmerIwasawaCohomology:L2/selmer-complex`, `SelmerIwasawaCohomology:L2/selmer-complex-h1`, `SelmerIwasawaCohomology:L4/elliptic-finite-kummer`, `PadicHodgeRegulators:D.5`.

**Source.** [BlochKato1990] §3.7–3.8, pp.353–354; Example 3.10.1, pp.359–360; §5.1, p.369: Local finite conditions and duality explain the elliptic Kummer specialization and the distinction between a motivic regulator condition and a proved global isomorphism. [NekovarNiziol] §5.2, Theorem 5.9 and proof, p.59: The general regulator factorization is into semistable extension classes; it is not, without additional input, the finite local condition of every elliptic twist.

### Selmer local determinant formula

Declaration: `MotivicEtaleKTheory:M.8/selmer-local-determinant-comparison` (theorem).

Let Λ be the admitted coefficient DVR (in particular Z_p), T the Tate or elliptic lattice above, and choose the supplied perfect global, local and compact-support complexes with real-place convention fixed. Write C_f for the L2 Selmer fibre with local maps U_v^+→C_v, and C_c=fib(C_global→⊕_v C_v). The canonical triangle C_c→C_f→⊕_v U_v^+→C_c[1] yields Δ_f(T)=det_Λ^−1 C_f ≅ det_Λ^−1 C_c ⊗ (⊗_v det_Λ^−1 U_v^+), in that fixed order and in the graded determinant category. This formula is compatible with derived coefficient base change wherever the supplied complexes remain perfect and local conditions commute with that base change. In particular the local factors occur with inverse determinant; using det U_v^+ would reverse their contribution. After a selected rational fundamental line and actual period/regulator comparisons have been supplied, this is the local correction in the Tate/elliptic Tamagawa-number statement. It does not assert existence of its distinguished zeta basis.

**Hypotheses.** All named complexes are perfect; no determinant of an arbitrary infinite cochain complex is formed. For p=2 the compact-support convention includes the specified modified real terms and their perfection/boundedness theorem; absent that input restrict the specialization to odd p. The rational line factors and archimedean/p-adic comparison maps are independent MC.2/PS.0 inputs; the exact case-dependent formula remains a recorded source gap.

**Proof or construction.**

1. Use L2’s two mapping-fibre triangles (or its octahedral comparison) to obtain C_c→C_f→⊕U_v^+. This fixes the sign before taking a determinant.
2. Apply the L5 determinant functor and distinguished-triangle isomorphism det C_f≅det C_c⊗det(⊕U_v^+); invert it, retain graded commutativity signs, and order the local places once.
3. Use derived base change from the perfect-complex determinant contract. Do not infer a change-of-lattice invariance that discards torsion indices.
4. For a two-term example [Λ --p^a→ Λ] in cohomological degrees 0,1, the acyclic fraction-field trivialization sends its standard determinant basis to p^a and its inverse determinant basis to p^(−a). Retain this test when comparing finite local corrections and selected regulator lattices.
5. Invoke no M.8-dependent PS.3/PS.4 result: those stages consume this formula together with the early period spaces. The norm-residue theorem of M.5 supplies no Tamagawa zeta basis.

**Check.** If every U_v^+=0, Δ_f=Δ_c. For U^+=Λ concentrated in degree zero, Δ_f=Δ_c⊗Λ^∨; putting U^+ in degree one reverses that factor. The two-term p^a test detects a lost inverse and a lost finite index.

**Dependencies.** `MotivicEtaleKTheory:M.8/elliptic-kummer-selmer-adapter`, `MotivicEtaleKTheory:M.8/local-tate-regulator-finite-condition`, `MotivicEtaleKTheory:M.8/arithmetic-fundamental-line`, `SelmerIwasawaCohomology:L2/selmer-complex`, `PadicMeasuresIwasawaAlgebras:L5`, `ArithmeticGaloisDuality:D7`, `MotivesAndAlgebraicCycles:MC.2`, `PeriodsAndSpecialValues:PS.0`.

**Source.** [Kato2003] §1.2, p.165; §2.1, pp.166–168: Determinants of perfect complexes, inverse compact-support lines, coefficient change and exact-triangle compatibility supply the sign convention. The zeta-basis condition is conjectural. [BlochKato1990] §5.1, p.369: The selected motivic integral-part/regulator condition requires its own comparison hypotheses; it is not deduced from norm residue.

### Number-field Chern lattice index

Declaration: `MotivicEtaleKTheory:M.8/number-field-chern-lattice-index` (theorem).

Let F be a number field, R=O_(F,S) with S finite and j≥2. Put L_K=K_(2j−1)(R)/torsion, a free Z-module of Borel rank r. In the rational weight-j motivic group H¹_M(F,Q(j)), let L_ch=ch_j(L_K) and L_c=c_(j,2j−1)(L_K). Then L_c=(−1)^(j−1)(j−1)! L_ch. Let I be the torsion-free image of H¹_M(R,Z(j)) in this rational group. Under the explicit finite-generation, full-rank and Chern-integrality hypotheses, L_c⊂I has finite index e. For an injective real regulator r_D on this rational space whose real extension is an isomorphism, covol(r_D L_ch)=e/((j−1)!)^r · covol(r_D I). A comparison to a differently normalized Borel regulator includes the absolute determinant of its actual R.7 coordinate-change map, including its factor of two. The rational integral part im[H¹_M(R,Q(j))→H¹_M(F,Q(j))] is a Q-subspace and is not the lattice I.

**Hypotheses.** Use the existing motivic-chern-character, integral-motivic-structures and actual Borel lattice/normalization imports. The integral motivic image’s finite generation and full-rank comparison are explicit hypotheses/requests; rational equality alone does not establish them. Chosen real determinant-line comparison fixes covolume units and orientation; use absolute value for the numerical covolume.

**Proof or construction.**

1. The higher additive Chern normalization gives the equality of the two image lattices. Use arithmetic finite generation and the rational weight theorem to show L_ch has rank r, without claiming that every integral motivic class lies in that image.
2. Under the stated integral hypotheses compare L_c with I. Use the actual inclusion and its finite quotient, not merely equal Q-spans.
3. Apply Mathlib ZLattice.covolume_div_covolume_eq_relIndex after the supplied real-coordinate identification to L_c⊂I. Scaling a rank-r lattice by (j−1)! multiplies its covolume by ((j−1)!)^r; combine these two changes. The generic index/covolume theorem is already present and is not a new target.
4. Transport the determinant through the Borel/Deligne comparison with its recorded coordinate matrix. Keep a rational integral part, a torsion-free model image and a regulator lattice as separate exported objects.

**Check.** At j=2 the factorial is one, so the only lattice correction in the formula is the actual index e. At j=3 and rank one, L_c=2 L_ch up to sign, hence covol(r_D L_ch)=e/2·covol(r_D I). Replacing I by its Q-span destroys discreteness in positive rank and cannot define the same covolume.

**Dependencies.** `MotivicEtaleKTheory:M.8/beilinson-character-comparison`, `MotivicEtaleKTheory:M.8/integral-motivic-structures`, `MotivicEtaleKTheory:M.8/regulator-determinant-comparison`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `BorelRegulators:R.4/regulator-lattice`, `BorelRegulators:R.7/regulator-factor-two`, `MotivicEtaleKTheory:M.4`, `mathlib:ZLattice.covolume_div_covolume_eq_relIndex`.

**Source.** [Weibel2013] V §11.10–11.14, pp.455–462; VI §8.1–8.2, pp.513–514: The higher Chern factorial and arithmetic finite-generation/rank data determine the image-lattice scaling, correcting the field/ring slip in VI 8.1. [BlochKato1990] §5.1, p.369: The motivic rational integral part is defined by a model image; its integral lattice and regulator isomorphism are extra arithmetic data.

## Source ledger

Each source was accessed on 2026-10-19. Locators above refer to the stated version and printed pagination, except for the author preprints whose printed pages equal PDF pages. No source passage is reproduced; the descriptions, proof routes and corrections are mathematical specifications in this document’s own words.

- **[Levine2001]** Marc Levine, *K-theory and motivic cohomology of schemes, I*. Author preprint, December 2001, 98 pages. [Public source](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf). SHA-256: `67affc5d6f837a78281c824d21723be9af1180bb77d44e8cff9cca5b0b2ef820`. Read: §11, pp.43–52; §12, pp.52–59; Theorem 14.5 and Lemma 14.6, pp.71–72; Theorem 14.7, pp.73–74; Appendix C, pp.88–91; Appendix D, pp.93–96.
- **[LevineConiveau]** Marc Levine, *The homotopy coniveau tower*. arXiv:math/0510334v1, October 16, 2005. [Public source](https://arxiv.org/pdf/math/0510334v1). SHA-256: `5f268002b5ec36a74932a48ac051712c9c19c41a8b76e5bcb5dcdf0800538190`. Read: Proposition 2.1.3 and Corollary 2.1.4, pp.11–12; Theorem 6.4.2, p.36; Theorem 7.1.1, p.38; Theorems 11.2.1 and 11.3.2, pp.62–65.
- **[Thomason1985]** R. W. Thomason, *Algebraic K-theory and étale cohomology*. Ann. Sci. ENS (4) 18 (1985), 437–552, Numdam scan. [Public source](https://numdam.org/item/10.24033/asens.1495.pdf). SHA-256: `3497d34982b0f7f43682cb978a3a031cc7567c899a43a6558bb424318111bb16`. Read: §2.42–2.46, pp.496–501; §3.34 and Theorems 4.1, 4.11, pp.516–520.
- **[Thomason1989]** R. W. Thomason, *Erratum: Algebraic K-theory and étale cohomology*. Ann. Sci. ENS (4) 22 (1989), 675–677, Numdam scan. [Public source](https://numdam.org/item/10.24033/asens.1596.pdf). SHA-256: `c38909eb3f20bd1b5a157cf78ff1486d4ae01f2c92e7d0788557f64f042f4e73`. Read: Entire erratum, pp.675–677.
- **[Weibel2013]** Charles A. Weibel, *The K-book: An introduction to algebraic K-theory*. Author complete-book PDF dated August 29, 2013; use printed book pagination. [Public source](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf). SHA-256: `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. Read: V §11.10–11.14, pp.455–462; VI §4.1–4.9, pp.480–486; VI §8.1–8.2, pp.513–514; §9.1–9.12, pp.517–525.
- **[BM2018]** Andrew J. Blumberg and Michael A. Mandell, *The fiber of the cyclotomic trace for the sphere spectrum*. arXiv:1508.00014v3, January 12, 2018; §10 is present in this version. [Public source](https://arxiv.org/pdf/1508.00014v3). SHA-256: `35efeb3e0da2ff2093d646af957e35a0e5c0241bb5a65c083c26e8cd17fac16f`. Read: §10, Theorem 10.1, Lemma 10.2, Proposition 10.4 and their proofs, pp.43–46.
- **[BurgosFeliu]** José Ignacio Burgos Gil and Elisenda Feliu, *Higher arithmetic Chow groups*. arXiv:0907.5169v1, July 29, 2009. [Public source](https://arxiv.org/pdf/0907.5169v1). SHA-256: `247b162be9661763dbf94bc82f33ccdd8fed463e91c22bb57402992e2d26196b`. Read: §1.8, pp.10–11; support cone Definition 1.28; §2, pp.12–18: cubical normalization, support and homotopy-invariance comparisons; §3.1–3.2, pp.19–23, including Theorem 3.5 proof; Proposition 5.41, p.48.
- **[NekovarNiziol]** Jan Nekovář and Wiesława Nizioł, *Syntomic cohomology and p-adic regulators for varieties over p-adic fields*. arXiv:1309.7620v5, September 22, 2016. [Public source](https://arxiv.org/pdf/1309.7620v5). SHA-256: `97f319e286aa4cf5be1b9c8d100efd1ac779e985d91d8cd6b70e2a3d0870ebd0`. Read: Proposition 5.7 and Remark 5.8, p.58; §5.2, Theorem 5.9 and proof, p.59.
- **[BlochKato1990]** Spencer Bloch and Kazuya Kato, *L-functions and Tamagawa numbers of motives*. The Grothendieck Festschrift I (1990), 333–400; seminar-hosted scan. [Public source](https://math.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf). SHA-256: `ec89c6436c7e16580791eddd562c8c04a12442d8a8484f8ac75c5ea8dc04f5e5`. Read: §3.5–3.10, pp.353–354, 359–360; §5.1, p.369; §5.5.1–5.7, p.372.
- **[Kato2003]** Kazuya Kato, *Tamagawa number conjecture for zeta values*. ICM 2002, Vol. III, pp.163–170; arXiv:math/0304233v1, April 16, 2003. [Public source](https://arxiv.org/pdf/math/0304233v1). SHA-256: `6d7f3a5924fd5291bc23870547b05552ba7fb1e39413d551f11daf052fbcf12b`. Read: §1.2, p.165; §2.1, pp.166–168.

The Blumberg–Mandell transfer proof is cited to **v3**, not the shortened v4. The Thomason proof uses the **1989 published correction**. The Adams exponent correction `MotivicEtaleKTheory/E8` and the convergence proof issues E6/E7 are inherited from the target packet; this part uses the corrected weights and preserves the stated proof obligations.

## Source corrections requiring independent verification

The published Thomason erratum is an identified correction. The other findings below are proposed corrections with no independent verdict supplied by this author. A failure to retrieve an errata file is not evidence of novelty. The `printed` descriptions in the packet are paraphrases in compliance with the no-excerpt rule.

- **`MotivicEtaleKTheory/E-M6b-1`** — [Thomason1985] Original Theorem 2.42 proof, pp.496–498; corrected in the 1989 erratum pp.675–677. In own words: the original arbitrary-index homotopy-colimit comparison uses maps with homotopies that need not form the required coherent diagram. Correction: Use corrected 2.42(a) for countably generated Galois extensions and 2.42(b), Bott annihilation of descent kernel/cokernel on homotopy groups, for general cd-one extensions. Reason: Sequential telescopes can be assembled from adjacent homotopies; an arbitrary filtered diagram requires additional higher compatibility. The published erratum reduces the general argument to the countably generated case and proves precisely the Bott-annihilation statement needed after inversion. Reach: the proof. Published correction: R. W. Thomason, Ann. Sci. ENS 22 (1989), 675–677; descent conclusions 2.43/4.1 remain available with the corrected proof.
- **`MotivicEtaleKTheory/E-M6b-2`** — [Levine2001] Appendix D, proof of Lemma D.6, p.96, December 2001 author PDF. In own words: the sphere-interchange sentence assigns exponent n+m to the sign for S^n∧S^m. Correction: The interchange degree is (−1)^(nm); the resulting Leibniz boundary uses (−1)^n when a degree-n sphere passes one suspension. Reason: For n=m=1, interchanging the two circle factors on S² has degree −1, whereas the printed exponent gives +1. For n=0,m=1 the unit interchange has degree +1. The page was checked in the rendered PDF as well as text. Reach: the proof. No correction located in the author catalogue or targeted search; pending independent review, with no novelty claim.
- **`MotivicEtaleKTheory/E-M6b-3`** — [Weibel2013] VI Classical Data 8.1, printed p.513, August 29, 2013 PDF. In own words: the finite-even and finitely-generated odd K-group assertions are written for the number field F after introducing O_S. Correction: Those finite-generation/rank assertions here concern K_n(O_S), with S finite, not K_n(F). Reason: Localization for Q gives K₂(Q) a quotient ⊕_p F_p×, since K₁(Z)→K₁(Q) is injective. That direct sum is infinite. Arithmetic finite generation imported in this packet has ring-of-S-integers domain. Reach: nothing. Author errata page was located, but the linked Kbook.errata.pdf returned 404; no matching correction was obtained. Pending independent review; no novelty claim.
- **`MotivicEtaleKTheory/E-M6b-4`** — [NekovarNiziol] Theorem 5.9 display, p.59, arXiv:1309.7620v5. In own words: the theorem display uses geometric cohomological degree i+1 in both H¹_st and H¹, although the regulator just defined above and the final proof diagram use degree i. Correction: Use H¹_st(G_K,H^i_et(X_bar,Q_p(r)))⊂H¹(G_K,H^i_et(X_bar,Q_p(r))) for the regulator r^et_(r,i). Reason: The Hochschild–Serre edge lowers geometric degree from total i+1 to i. The definition directly preceding the theorem, its proof diagram and Remark 5.10 agree on H^i. The rendered page confirms the i+1 display. Reach: a stated result. No erratum found in the arXiv record/targeted author-title search. This is recorded as a display-index correction, pending independent review; the regulator proof uses the consistent i degree.
- **`MotivicEtaleKTheory/E-M6b-5`** — [Weibel2013] VI proof of Theorem 9.12, printed p.525, August 29, 2013 PDF. In own words: in the residue-6 even K-group case the final proof paragraph expresses its order using h^(1,i)(2) divided by 2^r₁. Correction: The numerator in that even-group sentence is h^(2,i)(2), the order of H²(R,Z₂(i)); the theorem’s order ratio is unchanged. Reason: Theorem 9.11 identifies this even K group with ker[H²(R,Z₂(i))→(Z/2)^r₁]. Its order is therefore the H² order divided by the real quotient order, rather than the H¹ order. This packet does not use Theorem 9.12 as a prerequisite. Reach: the proof. Author errata link was unavailable (404); no matching correction located. Pending independent review; no novelty claim.

## Explicit supplier contracts

- **`EnhancedDerivedSheaves:E3`**: Export realization/diagonal and homotopy-limit operations on the actual H.6 support-spectrum diagrams, preserving finite product zigzags and the localization fibre/cofiber squares. This is the coherent carrier contract, not a new spectrum theory. Consumed by `MotivicEtaleKTheory:M.6b/simultaneously-moved-product-roof`.
- **`StableHomotopyKTheory:H.6`**: Export multiplicative exact-couple transport, exact homotopy limits and stable Whitehead on the chosen concrete spectrum model, sufficient for the common-width quotient product and the eventual-zero completion proof. Existing filtered-spectrum/Milnor nodes are imported; refine their diagram-level proof gap. Consumed by `MotivicEtaleKTheory:M.6b/simultaneously-moved-product-roof`, `MotivicEtaleKTheory:M.6b/motivic-quotient-completion`.
- **`SchemeKTheoryOperations:S.6`**: Compare the existing higher scheme Adams operations with the finite-cover/support K-space operations of Levine §12, preserving support triples, refinement and connecting maps. Keep λ unstable. For any additional rational stable filtered action, supply its actual stable comparison and uniqueness theorem rather than the unstable Z×Gr result. Consumed by `MotivicEtaleKTheory:M.6b/adams-support-boundary-comparison`.
- **`EnhancedDerivedSheaves:E2`**: Apply hypercover/hypercomplete Postnikov descent to the periodic finite-coefficient K spectral sheaf on the small étale site, retaining the uniform cohomological bound and coefficient compatibility. Complex-valued descent alone is not the concrete spectrum statement. Consumed by `MotivicEtaleKTheory:M.7/corrected-thomason-descent`.
- **`ArithmeticGaloisDuality:R02.2`**: Export the continuous/discrete Tate-twist trace and projection formula for finite étale maps and compatible coefficient triangles, matching the actual K transfer presheaf. Consumed by `MotivicEtaleKTheory:M.7/finite-etale-descent-transfer`.
- **`ArithmeticGaloisDuality:R02.3`**: Supply the finite-cd≤2 and finiteness/continuous-limit conclusions for finite S, ℓ odd or F totally imaginary, including the shifted H⁰ coefficient transitions. No real dyadic finite-cd theorem is requested. Consumed by `MotivicEtaleKTheory:M.7/arithmetic-bockstein-comparison`.
- **`RefinedTraceMethods:RT.4`**: Use the existing requested Part II, Real topological K-theory: BO/KO comparison, period eight, coefficient boundary maps and the nonsplit order-four class in degree 2 mod 8. Current complex KU/ku is not the requested real object. Consumed by `MotivicEtaleKTheory:M.7/real-restriction-boundary-square`.
- **`ArithmeticGaloisDuality:R02.4`**: Export the exact α_h(j) real restrictions, finite and divisible coefficient maps, signature defect and low-degree surjectivity conditions used in the dyadic comparison; retain the distinction between a kernel and the cohomology of its fibre. Consumed by `MotivicEtaleKTheory:M.7/real-restriction-boundary-square`.
- **`BorelRegulators:R.4`**: Use the existing actual Borel rank/lattice nodes for K_(2j−1)(O_(F,S)), j≥2, and their torsion-free integral lattice, supplying the rank needed to separate the divisible part in the dyadic coefficient calculation. No new analytic Borel regulator is planned here. Consumed by `MotivicEtaleKTheory:M.7/dyadic-integral-torsion-filtration`.
- **`tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne`**: Extend the already requested Hodge structures, Part II logarithmic Deligne realization: actual complex with supports, semipurity, homotopy invariance, real conjugation and compactification comparisons preserving the cycle class and product. M.8 imports that carrier and builds only its K/cycle regulator application. Consumed by `MotivicEtaleKTheory:M.8/cubical-deligne-regulator-roof`.
- **`GeneralAlgebraicKTheory:K.2`**: Supply the actual plus/classifying simplicial sheaf carrier and universal characteristic-class evaluation compatible with cover nerves and finite-rank stabilization, needed in the Beilinson comparison. No formal symbol for K_n suffices. Consumed by `MotivicEtaleKTheory:M.8/beilinson-character-comparison`.
- **`PadicHodgeRegulators:L1`**: Use the actual Bloch–Kato exponential/period local maps for Q_p(j), with the local Hodge conventions and inverse-image integral condition. The finite Tate calculation must commute with the syntomic/étale Chern square already exported by D.2. Consumed by `MotivicEtaleKTheory:M.8/local-tate-regulator-finite-condition`.
- **`PadicHodgeRegulators:D.5`**: For the actual elliptic twist V_pE(j−1), specify each reduction/weight regime, construct local regulator-to-U_v^+ maps and homotopies, and prove the required H¹_f assertion. An H¹_st statement or the untwisted Kummer theorem alone is insufficient. Consumed by `MotivicEtaleKTheory:M.8/elliptic-kummer-selmer-adapter`.
- **`PadicMeasuresIwasawaAlgebras:L5`**: Supply the missing determinant functor on perfect coefficient complexes with graded symmetry, inverse lines, triangle multiplicativity, derived base change and the acyclic two-term p^a normalization. This extends its existing direction; no determinant carrier is constructed in M.8. Consumed by `MotivicEtaleKTheory:M.8/selmer-local-determinant-comparison`.
- **`ArithmeticGaloisDuality:D7`**: Supply the actual compact-support complex, real-place convention and perfection theorem for the selected Tate/elliptic lattice regime. For p=2 state the required modified real terms and coefficient-base-change hypotheses. Consumed by `MotivicEtaleKTheory:M.8/selmer-local-determinant-comparison`.
- **`MotivesAndAlgebraicCycles:MC.2`**: Supply the independent actual Tate/h¹(E) Betti, de Rham and p-adic realization objects, with dual/twist and integral comparison maps, and motivic source complexes for derived regulator lifts. No M.8-dependent period/regulator theorem may enter this prefix. Consumed by `MotivicEtaleKTheory:M.8/selmer-local-determinant-comparison`.
- **`PeriodsAndSpecialValues:PS.0`**: Export only the independent realization/period spaces and their basis-independent determinant lines and signs, to specify the selected rational Tate/elliptic fundamental-line factors. PS.3/PS.4 consume the M.8 regulator/determinant comparison and cannot supply it. Consumed by `MotivicEtaleKTheory:M.8/selmer-local-determinant-comparison`.
- **`MotivicEtaleKTheory:M.4`**: Refine the integral Dedekind motivic model-image comparison: finite generation and full rank of im H¹_M(O_(F,S),Z(j)) in H¹_M(F,Q(j)), and inclusion/index of the actual higher-Chern image for j≥2. The rational integral part does not supply these integral facts. Consumed by `MotivicEtaleKTheory:M.8/number-field-chern-lattice-index`.

## Coverage and proof obligations

All three layers are `planned`; none is `closed`. Each existing target is an imported node and each refinement has a chain ending in a read library interface, a named supplier node/stage or the explicit obligations below. An imported plan supplies a contract, not its implementation. The packet has 18 new nodes, 17 API items, 11 definition tests and 12 proposed planets; the layer counts are 3, 5 and 4. The suggested file states only the integer-coordinate and existing linear-algebra/polynomial consequences that can be expressed at the pins.

- **Stable support diagrams and filtered global-model comparison.** The §11/Appendix C product proof has been read and its functorial moving/triangle steps extracted. It still needs the actual H.6/EDS coherent diagram carrier and M.6a/global-model-comparison as a filtered zigzag preserving augmentations and cycle layers. Two descriptions of E₂ are not that filtered equivalence. The support connectivity/dévissage and inherited reviewed Levine E6/E7 proof obligations are not discharged by this refinement. No stable Whitehead/limit implementation is claimed. Targets: `MotivicEtaleKTheory:M.6b/simultaneously-moved-product-roof`, `MotivicEtaleKTheory:M.6b/product-cycle-layer-identification`, `MotivicEtaleKTheory:M.6b/motivic-quotient-completion`.
- **Adams finite-diagram comparison versus integral stable operations.** Read Levine 2001 §12 in full. Its construction uses unstable K-spaces, cover truncations and homotopy groups. S.6 must export agreement of its higher Adams operation with those finite support diagrams and their localization boundaries. If a genuinely stable rational filtered Adams morphism is required, supply its rational motivic K-spectrum comparison separately; the existing unstable Grassmannian uniqueness node is not a stable integral construction. The current comparison proves the exact-couple weight statement at planning level, with this supplier obligation, not integral stable λ maps. Targets: `MotivicEtaleKTheory:M.6b/adams-support-boundary-comparison`.
- **Inherited norm-residue, rigidity and arithmetic filtered-model proof obligations.** The published Thomason correction and the finite étale transfer proof are now read. The accepted M.5d packet’s resolution-free Beilinson–Lichtenbaum gap, the supplier’s full Gabber/Suslin proof, and the arithmetic Dedekind extension of the selected perfect-field motivic tower remain prerequisites. An étale Bott sequence does not prove the ordinary integral motivic filtration over a number ring. Suslin’s original Lie-neighbourhood argument is not read in this run and is still an explicit source refinement of suslin-real-comparison. Targets: `MotivicEtaleKTheory:M.7/corrected-thomason-descent`, `MotivicEtaleKTheory:M.7/arithmetic-bockstein-comparison`, `MotivicEtaleKTheory:M.7/real-restriction-boundary-square`.
- **Real KO and arithmetic dyadic extension maps.** K-book VI §9 is read through the integral table and its proof. The tables specify actual exact-sequence targets, not all their extension classes or canonical splittings. RefinedTraceMethods Part II must supply the real KO comparison, boundary maps and order-four mod-two class; M.2/R02.4 supply the page restrictions and signature maps. Refinement to natural explicit dyadic connecting maps, including the residue-4 extension for a selected field, remains. No odd-prime comparison is asserted at real dyadic places. Targets: `MotivicEtaleKTheory:M.7/real-restriction-boundary-square`, `MotivicEtaleKTheory:M.7/dyadic-mod-two-filtration`, `MotivicEtaleKTheory:M.7/dyadic-integral-torsion-filtration`.
- **Logarithmic realization and supported character proof imports.** The smooth complex Burgos–Feliu roof and its Beilinson comparison proof are read. Generic logarithmic Deligne complexes, semipurity and compactification independence remain the upstream Hodge Part II contract; the original Gillet/Gillet–Soulé supported higher-character proof and Huber general motivic realization have not been read here. The specialized complex construction does not claim the full mixed-characteristic or arbitrary-motive realization theorem. Products/residues/norms beyond these admitted comparison models continue to use the existing chern-functoriality and supported-cycle-character nodes with their supplier requests. Targets: `MotivicEtaleKTheory:M.8/cubical-deligne-regulator-roof`, `MotivicEtaleKTheory:M.8/beilinson-character-comparison`.
- **Integral/higher-weight local Selmer regulator lifts.** The rational local Tate calculation and syntomic/étale Chern square are specified. An actual map to the Selmer complex requires a chosen motivic source complex, maps to U_v^+, and coherent local comparison homotopies. D.2/D.5 must supply those maps in each elliptic higher-weight crystalline/semistable regime. A general H¹_st factorization is weaker than H¹_f; no ramified, dyadic or arbitrary elliptic twist extension is inferred. Finite étale transfer was refined for odd primes only. Targets: `MotivicEtaleKTheory:M.8/elliptic-kummer-selmer-adapter`, `MotivicEtaleKTheory:M.8/local-tate-regulator-finite-condition`.
- **Perfect determinants and selected rational fundamental-line factors.** L5 has no determinant node in the inspected packet. Its exact-triangle, graded sign and derived-base-change contract, together with D7 compact-support perfection including any modified real terms, is still requested. The Selmer-to-compact determinant sign is now explicit. Exact rational Tate/elliptic fundamental-line factors and their archimedean and p-adic period comparisons require a source-level case extraction from the independent MC.2/PS.0 prefix; Kato’s exposition refers onward for this. This packet does not substitute PS.3/PS.4 or assert a zeta basis or Tamagawa-number conjecture. Targets: `MotivicEtaleKTheory:M.8/selmer-local-determinant-comparison`.
- **Full integral motivic model-image lattice.** The image of the integral K lattice under ch and c is controlled exactly, including its factorial. Finite generation, full rank and the index of the entire integral motivic model image are additional hypotheses, not consequences of its rational span. Supply that integral comparison before turning the conditional covolume formula into an unconditional lattice assertion. R.4/R.7 supply the existing analytic regulator and its actual factor-two normalization. Targets: `MotivicEtaleKTheory:M.8/number-field-chern-lattice-index`.

**MotivicEtaleKTheory:M.6b — planned.** Resolve M.6a filtered global-model and H.6/EDS coherent stable-diagram contracts, preserving the explicit dimension/connectivity and lim¹ arguments. Supply the S.6 finite-diagram Adams comparison, and any genuinely stable rational filtered action separately from unstable integral λ operations.

**MotivicEtaleKTheory:M.7 — planned.** Resolve inherited resolution-free motivic comparison, full rigidity/Suslin proof, and Dedekind filtered-model extension; refine the original Suslin source proof. Supply real KO/BO Part II and the actual selected-field dyadic extension/connecting maps. The corrected Thomason and odd-prime finite étale transfer proof routes are extracted.

**MotivicEtaleKTheory:M.8 — planned.** Supply generic logarithmic compactification-independent Hodge realization and the inherited supported/general-character proof inputs. Supply actual integral/higher-weight elliptic local regulator maps and Selmer comparison homotopies, L5 determinants and D7 perfection. Extract the selected rational Tate/elliptic fundamental-line factors/period maps from independent MC.2/PS.0 inputs, and establish the integral motivic model-image lattice hypotheses/index. No Tamagawa zeta-basis existence is claimed.
