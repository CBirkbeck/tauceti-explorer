# Explicit K₃ and Bloch groups — V.1: a concrete homological model

This part completes a target-level planning pass for `K3BlochGroups:V.1`. Its purpose is to make the comparison between Quillen K₃ and integral homology of the stable Steinberg group usable on finite bar representatives. It specifies the map, its naturality, the equality certificates for representatives, and the topology needed for the degree-three elementary-group quotient. It builds on the accepted [parent packet](../packets/K3BlochGroups.json); the parent nodes retain their IDs and are not edited. The [follow-up packet](../packets/K3BlochGroups--V.1.json) contains ten refinements with new IDs.

The stage is **planned**, and the packet's planning pass is **complete**. It is not closed. The shared Hopf/Whitehead package and the stable sphere-unit comparison require an early extension of the homotopy foundation, and the supplier's relative-plus proof boundary remains open. Each has a precise owner proposal or request below. All declarations have implementation status unchecked.

## Scope and conventions

Let A be an associative unital ring. Ring maps preserve the unit. No field, infinitude, regularity, commutativity, stable-range or injectivity hypothesis on a ring map is imposed in this layer. Write GL(A) for the stable general linear group, E(A) for the stable elementary subgroup, and St(A) for the stable Steinberg group. These groups and their ring-induced maps are imported. In particular, St(A) is the colimit of its finite-rank presentation groups; a finite-rank Steinberg kernel is not substituted for the stable K₂ kernel.

The group-theoretic owner is `K2SymbolsBrauer:T.1:classical`. The finer inputs are `K2SymbolsBrauer:T.1/stabilisation`, `K2SymbolsBrauer:T.1/steinberg-is-uce` and `K2SymbolsBrauer:T.1:classical/uce-source-superperfect`. They supply the stable Steinberg group, its universal central extension of E(A), and the recognition theorem's conclusion that a universal source is superperfect. Thus the parent `K3BlochGroups:V.1/steinberg-superperfect` is an imported corollary. This part neither constructs St nor reproves the recognition theorem.

This resolves confirmed finding **RT-AREA-ktheory-1/29**. The packet records the explicit stage edge

**K2SymbolsBrauer:T.1:classical → K3BlochGroups:V.1.**

The edge is acyclic in the current atlas. V.1 keeps its plus-space application, Hurewicz comparison and cycle model. The generic group extension theory stays with T.1:classical. The early ring K-space comes from `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`. The downstream `K.2:low-degree-comparisons`, which consumes V's work, is not a prerequisite.

All group and singular homology in this part has coefficients ℤ with trivial action. The suggested signatures use groups in the universe of ℤ, matching the pinned group-homology interface. Extending universe conventions is a supplier task, not an implicit claim that arbitrary large groups already fit that interface. Homotopy groups in degrees two and three are regarded as additive abelian groups; Mathlib's multiplicative cubical carrier needs the supplied additive comparison. No model of higher K-theory is defined by renaming a homotopy-group type.

Classifying spaces, plus spaces and mapping-cylinder pairs have CW homotopy type. Basepoints and the homotopies relative to them are part of the interfaces. Chosen plus representatives are maps of spaces whose functor laws are given by homotopies. Their induced maps on homotopy groups and homology satisfy actual equalities. Statements below never identify homotopy-equivalent chosen spaces literally.

## Retained targets and new refinements

All IDs in this table have prefix `K3BlochGroups:V.1/`. The left column names unchanged parent nodes. The right column names nodes in this part.

| Retained parent target | New refinement |
| --- | --- |
| `steinberg-superperfect` | `two-connected-hurewicz-input` imports the corollary and applies upstream Hurewicz |
| `bst-plus`, `uce-plus-fibration`, `bst-plus-connected-cover` | `cover-and-fibre-interface` specifies the map and its supplier boundary |
| `k3-h3-steinberg` | `canonical-comparison-interface` gives the exact composite and API |
| `bar-cycle-model` | `cycle-certificate-evaluator` exposes finite boundary witnesses |
| `k3-naturality` | `ring-map-comparison-square` includes the images of certificates |
| `steinberg-homology-colimit` | `finite-stage-cycle-certificates` separates lifting support from lifting relations |
| `eta-hurewicz-sequence` | `elementary-cover-hspace`, `hspace-hopf-kernel-refinement` |
| `k2-to-k3-h3-e` | `hopf-minus-one-product-refinement`, `elementary-homology-exact-sequence-refinement` |

The new node IDs refine the retained mathematical targets; they do not replace them or duplicate another roadmap's objects. The comparison and evaluator APIs are applications to this degree-three model. Generic CW theory, Hurewicz, covering maps, plus constructions, sphere operations and K-products remain imported interfaces.

## The topology of the comparison

### Two-connectedness and the correct Hurewicz map

Set Xₐ = BSt(A)⁺, using the parent `bst-plus` construction. The existing plus construction applied to the perfect group St(A) makes Xₐ simply connected. Its homology agrees with that of BSt(A). The bar/singular comparison and superperfection give H₂(Xₐ;ℤ) = 0. The degree-two absolute Hurewicz theorem then gives π₂(Xₐ) = 0. Degree-three Hurewicz consequently gives the natural isomorphism

π₃(Xₐ) ≅ H₃(Xₐ;ℤ).

The new `two-connected-hurewicz-input` states exactly this consequence. It is an application of upstream `AlgebraicTopology#stage-8-relative-homotopy-hurewicz-and-whitehead`. It plans no new general Hurewicz theorem. Its hypotheses include CW homotopy type and simple connectivity before the degree-two step. BGL(A)⁺ can have nonzero fundamental group and nonzero π₂, so its H-space structure alone does not license the same degree-three isomorphism.

### The map from the stable UCE

The map qₐ:BSt(A)⁺ → BGL(A)⁺ is induced by the actual homomorphism St(A) → E(A) → GL(A). Its provenance matters. An arbitrary isomorphism of abstract π₃ groups would not prove the naturality and elementary-homology square needed below.

The accepted homotopy decomposition already has the finer node `StableHomotopyKTheory:H.3/plus-pi2-universal-central-extension`. It includes the universal-cover and UCE-fibration assertions of K-book IV.1.8–1.9. Specializing it gives

BK₂(A) → BSt(A)⁺ → BE(A)⁺,

as a homotopy fibration, and identifies BE(A)⁺ with the simply connected cover of BGL(A)⁺ under BE(A). The generic fibration is imported rather than reconstructed here. Its kernel is the stable UCE kernel K₂(A), an abelian group, so BK₂(A) is a K(K₂(A),1).

The fibre homotopy sequence then shows that BSt(A)⁺ → BE(A)⁺ induces isomorphisms on πₙ for n ≥ 3. Covering invariance shows BE(A)⁺ → BGL(A)⁺ induces isomorphisms on πₙ for n ≥ 2. Combining the two gives the map qₐ on πₙ for n ≥ 3. Its source is two-connected by the preceding argument, giving the two-connected cover of the base component of K(A).

There is deliberately no assertion that qₐ induces an isomorphism in degree two. Its source has zero π₂, while K₂(A) can be nonzero. Likewise, a homotopy equivalence BE(A)⁺ ≃ Yₐ to an actual covering space Yₐ is not itself a claim that the selected plus map BE(A)⁺ → BGL(A)⁺ is an actual covering projection.

The supplier's proof boundary is retained as gap G3. Its accepted node states IV.1.8–1.9 with exercise hints; its relative-plus construction and generic plus proofs remain open in that decomposition. This part requests the based naturality of the square and does not certify those proofs as closed. `H.2/homotopy-fibre-and-long-exact-sequence` supplies the fibre LES. The historical inability to use upstream stage IDs is resolved: the current packet checker distinguishes those IDs from baseline declaration names.

### The canonical additive isomorphism

The construction `canonical-comparison-interface` fixes four maps:

| Map | Source and target | Provenance |
| --- | --- | --- |
| q₃ | π₃(BSt⁺) ≅ K₃(A) | qₐ and the early plus/Q comparison |
| h₃ | π₃(BSt⁺) ≅ H₃(BSt⁺;ℤ) | first nonzero-degree Hurewicz |
| j₃ | H₃(BSt;ℤ) ≅ H₃(BSt⁺;ℤ) | the plus homology map |
| b₃ | H₃(BSt;ℤ) ≅ H₃(St(A);ℤ) | bar/singular homology comparison |

Define

cₐ = b₃ ∘ j₃⁻¹ ∘ h₃ ∘ q₃⁻¹ : K₃(A) ≅ H₃(St(A);ℤ).

This fixes the direction of every inverse. The group H₃(St(A);ℤ) is the pinned Mathlib group-homology object. The accepted `H.1/homology-of-small-categories` node describes normalized categorical chains; the request to H.1 asks for the natural bridge to Mathlib's unnormalised inhomogeneous complex, including projection and group-map compatibility. A comparison of abstract groups alone is insufficient.

The construction has the following API, in namespace `K3Homological`:

| Declaration | Requirement |
| --- | --- |
| `comparison` | Construct cₐ from q₃, h₃, j₃ and b₃ in the displayed order |
| `comparison_apply` | Evaluate the forward composite b₃(j₃⁻¹(h₃(q₃⁻¹(x)))) |
| `comparison_symm_apply` | Evaluate the inverse q₃(h₃⁻¹(j₃(b₃⁻¹(z)))) |
| `comparison_zero` | The comparison sends zero to zero |
| `comparison_add` | It preserves addition, and hence integer scalar multiplication |

Its tests are `comparison_identity_data` (identity maps between a common group give the identity comparison), `comparison_trivial_group` (a genuine comparison to H₃ of a subsingleton group makes its source subsingleton), and `comparison_detects_nonzero` (cₐ(x) = 0 exactly when x = 0). The last test excludes the constant-zero comparison. The identity-data test and the two evaluation formulas check how the construction uses its imported maps. They do not assert that a synthetic arbitrary group is Quillen K₃.

## Explicit integral bar representatives

### Existing objects and pinned signs

No new bar-chain, cycle or homology construction is planned. At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, the inhomogeneous complex in degree n is the finitely supported integer combinations of tuples indexed by Fin n. Its trivial representation is the coefficient object ℤ with trivial group action. The complex is unnormalised: tuples with identity entries remain actual basis elements.

For trivial coefficients, the degree-three differential is

d₃[g|h|k] = [h|k] − [gh|k] + [g|hk] − [g|h],

and the degree-four differential is

d₄[g|h|k|l] = [h|k|l] − [gh|k|l] + [g|hk|l] − [g|h|kl] + [g|h|k].

The general pinned formula acts on the leading coefficient by g⁻¹. That convention disappears for the trivial coefficient object used here; it must not be silently changed when connecting to a generic coefficient comparison. Group multiplication in the adjacent entries is ordered as displayed, so the convention applies to noncommutative groups.

Use the existing cycles object Z₃ = ker d₃, its inclusion into C₃, the map β:C₄ → Z₃ obtained by factoring d₄ through cycles, and the projection π:Z₃ → H₃. These are `groupHomology.cycles`, `iCycles`, `toCycles` and the canonical homology projection. In particular a 3-chain is not an element of Z₃ unless its differential vanishes. The inclusion must remain available so that equality of cycle certificates can be checked on underlying chains.

### Evaluation and its complete equality criterion

The construction `cycle-certificate-evaluator` refines the parent evaluator by

evₐ(z) = cₐ⁻¹(π(z)) : Z₃(St(A);ℤ) → K₃(A).

It is additive and ℤ-linear. It is surjective because every element of group homology is represented by a cycle. Most importantly,

evₐ(z) = evₐ(z′) if and only if there exists w ∈ C₄(St(A);ℤ) with β(w) = z − z′.

The witness is an actual finitely supported 4-chain. This exports both directions: a certificate proves equality, and an equality yields some certificate. The kernel statement is the defining cycles-modulo-boundaries property of homology in the module category, transported through the comparison. It does not demand a computable normal form for arbitrary K₃ classes.

The construction serves V.4's comparison maps and V.5/V.6's explicit integral classes. A proof using this interface provides a cycle and a finite witness; the interface does not rationalize coefficients, erase torsion, or rely on a fixed stable rank.

Its API in `K3Homological` is:

| Declaration | Requirement |
| --- | --- |
| `eval3` | Construct the additive evaluation map on the existing cycles object |
| `eval3_comparison` | cₐ(evₐ(z)) = π(z), for the exact pinned projection |
| `eval3_zero` | Evaluation of the zero cycle is zero |
| `eval3_add` | Evaluation preserves addition |
| `eval3_zsmul` | Evaluation preserves multiplication by every integer |
| `eval3_boundary` | Evaluation of β(w) is zero |
| `eval3_eq_iff_certificate` | Equality is equivalent to the explicit 4-chain witness above |
| `eval3_surjective` | Every K₃ element has a cycle representative |

Five unit tests distinguish this interface from tempting incorrect models:

1. `eval3_identity_triple`: the chain [1|1|1] is nonzero and is a cycle, but has evaluation zero; [1|1|1|1] is its boundary witness. The alternating degree-four formula has five terms, giving coefficient one.
2. `eval3_zero_cycle`: the zero cycle evaluates to zero.
3. `eval3_baseline_projection`: evaluation followed by cₐ is the existing Mathlib homology projection on every cycle.
4. `eval3_not_injective`: evaluation on cycles is not injective, even for the trivial group, since the all-identity triple and zero are distinct cycles with equal values. An interface that identifies cycles with homology fails this test.
5. `single_g_one_one_not_cycle`: for g ≠ 1, the single chain [g|1|1] has differential [1|1] − [g|1] ≠ 0. A constructor accepting every triple as a cycle fails this test.

The first and fourth tests would change under a normalized chain convention: the identity triple would already be zero as a chain. They pin the intended Mathlib model and force normalization to be an explicit supplier comparison rather than an unnoticed replacement.

### Ring maps and finite certificates

For a unital map f:A → B, use the imported Steinberg homomorphism s_f and the existing tuplewise chain map. Every basis tuple maps to its image under s_f with the integer coefficient unchanged. This induces Z₃(f) and H₃(s_f).

The theorem `ring-map-comparison-square` requires

cᵦ ∘ K₃(f) = H₃(s_f) ∘ cₐ,

and consequently

K₃(f)(evₐ(z)) = evᵦ(Z₃(f)z).

Naturality of the four canonical comparison maps proves the first equation; the pinned compatibility of the cycle projection with homology maps proves the second. The former is a topological supplier obligation, not an assumption inferred from the fact that cₐ and cᵦ happen to be isomorphisms. If β(w) = z − z′, the degree-four chain map sends w to a certificate for the images. Thus proofs using explicit representatives can transport their witnesses rather than only their classes.

Identity and composition laws hold as exact equalities for chains, cycles and induced group homology. Chosen plus-space maps only satisfy the corresponding based homotopies. Acceptance checks include the identity map, a composite of two unital maps, and the image of the all-identity boundary certificate. The theorem imposes no commutativity or injectivity assumption on f.

The theorem `finite-stage-cycle-certificates` strengthens the parent's homology-colimit interface. Every K₃(A) element is represented by a cycle in some Stₙ(A). If two finite-stage cycles have equal stable evaluations, a common enlarged rank m contains a 4-chain whose differential is the difference of their stabilized underlying chains. Conversely such a witness proves equality.

There are two distinct finite-support arguments. First, finitely many group entries lift to a common finite stage. Second, a finite equation between those entries or chains that holds in the colimit holds at some enlarged stage. A chain whose entries lift to rank n can acquire zero differential only after further stabilization. The same caution applies to the boundary equation. The construction never assumes the finite-stage maps are injective, never assumes Stₙ is superperfect, and never asserts that H₃(Stₙ) itself is K₃(A). Its acceptance test is the eventual witness, rather than a uniform numerical stable range for arbitrary rings.

## The simply connected H-space and the Hopf kernel

### Lifting multiplication to the cover

The application `elementary-cover-hspace` chooses a well-pointed CW-type H-space model Xₐ of BGL(A)⁺ supplied by K.2:plus. Let pₐ:Yₐ → Xₐ be an actual simply connected covering model, locally path connected, with chosen y₀ above the H-space unit. The base multiplication is the block-sum multiplication; it does not require A to be commutative.

The map Yₐ × Yₐ → Xₐ obtained by applying pₐ to each entry and then multiplying lifts uniquely to Yₐ after prescribing value y₀ at (y₀,y₀). The domain is simply connected and locally path connected. The lift is a continuous multiplication μ_Y satisfying

pₐ(μ_Y(y,z)) = μ_X(pₐ(y),pₐ(z)).

Lift the two unit homotopies relative to y₀. The two endpoint lifts are the multiplication restrictions and the identity map; they agree at y₀, so lift uniqueness identifies them. The homotopies stay fixed at y₀. This supplies the actual fields of the existing Mathlib H-space carrier, including the strict value μ_Y(y₀,y₀) = y₀. No associativity assumption is necessary for this degree-three argument.

The generic cover, lifting theories and resulting general H-space lift are upstream imports. The request to UniversalCovers stage 2 asks its owner to export that application of lift uniqueness and relative homotopy lifting. V.1 owns only the specialization to the elementary cover, not another general cover-H-space construction. Use the supplied homotopy equivalence BE(A)⁺ ≃ Yₐ when transporting the conclusion. An actual covering projection is never inferred merely from this equivalence.

The supplier interface must expose the chosen unit, the multiplication equality under p, and uniqueness of any other continuous lift with the same basepoint value. Its requested acceptance cases are the identity cover of a simply connected H-space, recovering the original multiplication; the identity cover of the additive real group, giving 2 + 3 = 5; and the one-point identity cover. These specify the supplier request, rather than a new V.1 definition or its counted unit tests.

### An elementary proof of Suslin's lemma

The theorem `hspace-hopf-kernel-refinement` states that for a based simply connected well-pointed CW-type H-space X the composition operation with the based Hopf generator η:S³ → S² is additive and gives an exact sequence

π₂(X) → π₃(X) → H₃(X;ℤ) → 0.

The generic Hopf and Whitehead interface is gap G1, assigned to the proposed early homotopy-foundation extension. It is not a new V.1 definition. A full Hilton–Milnor theorem is unnecessary for this target: the degree-three calculation in Hatcher's Example 4.52 suffices.

Choose a wedge Y of two-spheres mapping to X surjectively on π₂, choosing one sphere representative for each generator (or for every element). Cellular homology gives H₃(Y) = 0. Replace the map by its mapping-cylinder inclusion. The pair (M_f,Y) is two-connected because X,Y are simply connected and π₂(f) is surjective. Relative Hurewicz gives π₃(M_f,Y) ≅ H₃(M_f,Y), while absolute degree-two Hurewicz gives π₂(Y) ≅ H₂(Y).

Compare the pair homotopy and homology long exact sequences. Since H₃(Y) = 0, H₃(X) injects into the relative H₃ group. A class in H₃(X), viewed in that group, has zero homology boundary. Its relative homotopy lift has zero boundary in π₂(Y), by the degree-two isomorphism, so lifts to π₃(X). This proves surjectivity of the absolute Hurewicz map. If an element of π₃(X) has zero Hurewicz image, its relative image is zero by relative Hurewicz, hence it comes from π₃(Y). Conversely every element coming from π₃(Y) has zero Hurewicz image because H₃(Y) vanishes. Thus

π₃(Y) → π₃(X) → H₃(X;ℤ) → 0

is exact with these explicit hypotheses.

For finite Y, Hatcher computes π₃(Y) as the free abelian group on the individual Hopf generators and the Whitehead products of distinct sphere inclusions, indexed by unordered pairs. For an ordered finite set one writes i < j, not all i ≠ j. Infinite wedges follow because sphere maps and their homotopies factor through finite subcomplexes. The proof of the calculation compares the wedge with the finite product using its four-cells and relative Hurewicz; it does not require an infinite loop-space decomposition.

All Whitehead products in X vanish. Given two based sphere maps, multiplication provides an extension to the product after correcting the wedge restrictions by the based unit homotopies and the homotopy extension property. The product-cell attaching map therefore maps nullhomotopically. Only the Hopf composites remain in the image of π₃(Y). Whitehead vanishing also removes the cross-term in Hopf-composition addition, so the operation on π₂(X) is a homomorphism. Its image is exactly the kernel of Hurewicz.

The H-space condition matters: on S² a degree-k map composes with η with coefficient k², so the operation is not generally additive for simply connected targets. For K(ℤ,2) both π₃ and H₃ vanish. These are acceptance cases for the claimed scope, alongside the wedge and infinite-index conventions.

### A source correction required by that proof

The author-hosted K-book's Exercise IV.1.25 asks for the last exact sequence from simple connectivity of a homotopy fibration F → Y → X. As printed, this is false: take the identity fibration point → S³ → S³. Both its π₃ map and the Hurewicz map are isomorphisms of ℤ, so their composite is nonzero.

The correction used here adds H₃(Y;ℤ) = 0. An equivalent sufficient map formulation is: X,Y simply connected CW-type, π₂(f) surjective, and H₃(Y) = 0. The mapping-cylinder argument above proves the corrected statement. The wedge Y of two-spheres meets precisely this additional condition. This is recorded as `K3BlochGroups/E31`, awaiting independent review. It is scoped to the standalone author chapter actually read; the AMS version of record was not obtained. The parent's already-recorded indexing and notation corrections remain in E1–E30 and are not duplicated.

## The minus-one product and elementary homology

The comparison `hopf-minus-one-product-refinement` fixes the operation used in K-book IV.1.20. Under the covering identifications π₂(Yₐ) ≅ K₂(A) and π₃(Yₐ) ≅ K₃(A), Hopf composition is

α ↦ α · [−1],

using the external pairing K₂(A) × K₁(ℤ) → K₃(A ⊗ ℤ) ≅ K₃(A). This works for associative rings. It does not introduce an internal tensor product of arbitrary A-modules. The product is owned by `GeneralAlgebraicKTheory:K.7/biexact-pairings-and-products`; the request asks for its associative-ring specialization and compatibility of the plus and spectrum models.

Two shared facts are needed. First, the sphere-unit map sends stable η to [−1] in K₁(ℤ). In the finite-set/BΣ∞⁺ model the corresponding degree-one class is an odd transposition; its permutation matrix has determinant −1. This identifies the image once the compatible Barratt–Priddy–Quillen identification is supplied. Second, precomposition of a representative by a sphere map agrees with the action of its stable class on the K-spectrum. A bare BPQ equivalence of homotopy groups does not prove this operation equality.

These are gap G2. The early H.5:spectra carrier supplies spectra and stabilization but its stage text does not explicitly supply multiplicative BPQ or the action compatibility. The packet proposes a shared H extension rather than attributing those facts to an insufficient supplier stage. The source's BPQ theorem cites its proof elsewhere; that cited proof was not acquired in this pass. The same package is used by the parent V.4 monomial/symmetric-group comparisons, so it has one foundational owner.

The theorem `elementary-homology-exact-sequence-refinement` applies Suslin's H-space lemma to Yₐ, identifies the operation as above, and defines the outgoing map precisely:

hₐ = H₃(St(A) → E(A)) ∘ cₐ.

Naturality of Hurewicz for BSt(A)⁺ → BE(A)⁺ and of the two plus and bar comparisons identifies hₐ with the transported Hurewicz map of Yₐ. The resulting natural exact sequence is

K₂(A) → K₃(A) → H₃(E(A);ℤ) → 0.

Its first map is multiplication by [−1]. Its second map on a cycle is the Mathlib homology projection after tuplewise application of St(A) → E(A). It identifies H₃(E(A)) with the stated quotient of K₃(A), not with K₃(A) itself in general. In characteristic two the minus-one scalar is trivial, so the outgoing map is an isomorphism; this is a required scalar-compatibility test. The quotient is distinct from V.2's quotient by the full degree-three Milnor image.

## Suppliers, extensions and acceptance

The ten requests in the packet ask for the following exact interfaces. Their IDs are atlas stages, whereas the finer existing nodes named above are imported directly.

| Supplier | Requested output |
| --- | --- |
| Upstream AlgebraicTopology stage 8 | Absolute and relative Hurewicz, naturality, pair LES, corrected degree-three consequence |
| Upstream AlgebraicTopology stage 4 | CW wedges, cellular homology, mapping cylinders, based HEP, finite-subcomplex factorization |
| Upstream UniversalCovers stage 2 | Based unique lifts, product hypotheses and relative homotopy lifts |
| Upstream UniversalCovers stage 3 | Covering isomorphisms on higher cubical homotopy groups and naturality |
| StableHomotopyKTheory H.1 | Exact unnormalised Mathlib bar/singular and normalization bridge |
| StableHomotopyKTheory H.3 | Based relative-plus/fibre naturality and completion of its source proof boundary |
| GeneralAlgebraicKTheory K.2:plus | Based block-sum H-space structure on the chosen early ring plus model |
| GeneralAlgebraicKTheory K.7 | External ℤ-scalar product and plus/spectrum compatibility |
| StableHomotopyKTheory H.5:spectra | General stable carriers; the extra BPQ/action assertion remains an extension gap |
| K2SymbolsBrauer T.1:plus | Natural stable K₂/π₂/H₂ comparison |

Two additive extension briefs place G1 and G2 in the proposed homotopy foundation. RS-33, still under review in the inputs read, already proposes StableHomotopyKTheory as a Part II of upstream AlgebraicTopology. The briefs coordinate with its eventual structure; they do not treat that proposal as accepted or modify upstream. The first starts after CW/pair/Hurewicz theory and supplies the minimal Hopf/Whitehead/wedge package. The second starts after group completion and the early spectrum foundation and supplies finite-set BPQ, the compatible sphere unit and the precomposition action. Exact new stage IDs belong to the restructuring/design job. K.7 continues to own the K-theory products.

The four planets are **Homological model of K₃**, **Bar-cycle model of K₃**, **Suslin's Hurewicz lemma** and **Degree-three Hurewicz quotient**. They mark central constructions and theorems, rather than imported carriers or exercise numbers.

Acceptance of this part requires the exact composite cₐ, the finite boundary-witness equivalence, certificate naturality, eventual finite-stage lifting, the actual cover multiplication, and the corrected relative-Hurewicz argument. The packet must preserve the group-theory ownership edge and state all open supplier interfaces. The Hopf product comparison is conditional on G1/G2 being discharged by their owner: those gaps are explicit, not proofs hidden in the word “standard.” A follow-up replaces these gaps and requests by precise owner node IDs and instantiates the topological Lean interfaces. It does not start another Steinberg, cover, bar-complex or K-product theory.

## Baseline and suggested signatures

The reviewed coverage entry AUDIT-29 says this layer's stable Steinberg, plus and Hurewicz comparisons are not built at the pins. Its bar-complex targets are already present. The packet therefore cites 21 existing declarations, whose statements were read at exact Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`. These are the inhomogeneous complex and differential, cycles and their constructors/inclusion, differential-to-cycles map, homology and projection, representative induction, trivial-group vanishing, chain/cycle/homology maps and their identities/composition, the H-space carrier and two covering-lift declarations. The pinned Tau Ceti tree `f790474821cf4256814db967cb154e7af3d0c369` was screened for the absent sphere-operation/BPQ package; no such package was found. No Tau Ceti declaration is claimed as an existing implementation of the missing topology.

The [suggested file](../suggested/K3BlochGroups--V.1.lean) imports individual Mathlib modules. Its comparison takes four actual additive isomorphisms as supplier data, and its evaluator takes a genuine comparison. It checks the algebraic signatures, all 13 construction API items and all eight unit tests against existing carriers. It also states certificate transport and a conditional finite-stage representative interface. The general cover multiplication is requested from its upstream owner using existing continuous-map, covering and H-space types; the ring application awaits the supplier plus model.

The definitive topological theorems cannot yet be typed against supplier Lean declarations that do not exist. Under Protocol §13 they are explicitly omitted, including the actual Hopf operation and canonical Hurewicz natural transformation. The final signature expresses transport of a source exact sequence along actual comparison maps and operation squares; it does not assume the target exactness as its conclusion's premise. These conditional signatures are not an implementation or a proof of Quillen K₃ for an arbitrary group.

## Sources and versions read

The source for the K-theory applications is [Weibel's author-hosted Chapter IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), fetched 2026-10-05, SHA-256 `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248`. The passages read are Definition 1.1 and Functoriality 1.1.2; Lemma 1.19, Remark 1.19.1 and Corollary 1.20; Exercises 1.8–1.12 and 1.25; and Example 4.9.2, Theorem 4.9.3 and Example 4.10.1. Locators use this chapter's printed page numbers IV.2–3, IV.13–17 and IV.43–44.

The elementary sphere proof route is [Hatcher's author-hosted Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), fetched 2026-10-05, SHA-256 `bebb3032bf9021b956da3bd070eb6c67dc662cf849be9cdf6679f677560e5618`. The passages read are Examples 4.49–4.52, printed pp.380–381, and Exercise 37, p.392. The packet's extension brief records the generic objects these passages supply; V.1 imports them when that owner is planned.

The AMS version-of-record text was unavailable to the download attempt (403). Author errata PDF links returned 404 and an archived link was inaccessible. Searches found no correction to Exercise 1.25; E31 is marked new subject to independent review and is confined to the author chapter. The BPQ proof cited by IV.4.9.3 was not acquired, and its absence is specifically G2. Sources and proof gaps of the accepted supplier decompositions remain those suppliers' responsibility.
