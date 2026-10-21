# Pro-étale descent, diamonds and small v-stacks, Part II: integral recovery and kimberlite specialization

This roadmap extends DiamondsAndVStacks from analytic adic spaces to formal and integral objects. DiamondsAndVStacks
constructs, in its Layer D6, the v-sheaf `X^♢` of an arbitrary pre-adic space over `ℤ_p` (marked untilts with a map to `X`),
the integral Galois quotient `Spd O_C/G_K = Spd O_K`, the point map `|X^♢| → |X|` with its failure to be a homeomorphism
off the analytic locus, and full faithfulness of `X ↦ X^♢` on seminormal rigid spaces over a fixed field. This Part II
starts there and continues the parent's layer numbering with D7–D11.

It answers three questions. What does diamondification forget? Residue-preserving homeomorphisms on the analytic side (including finite universal homeomorphisms in characteristic zero) and
perfection on the characteristic-`p` side (D7). When does a v-sheaf behave like a formal scheme, and what structure does
it then carry? Gleason's reduction functor, formally adic maps, specializing v-sheaves, prekimberlites, kimberlites, formal,
étale-formal and tubular neighbourhoods, and the specialization map (D8, D9, D11). Which integral objects are determined by
their v-sheaves? Flat normal formal schemes locally formally of finite type and proper flat normal schemes over `O_E`
(Scholze–Weinstein Proposition 18.4.1, after Lourenço and de Jong), with v-closures computing the v-sheaves of flat Zariski
closures (D10). The final results are Scholze–Weinstein's full faithfulness, its scheme form and the uniqueness of local
models with given v-sheaf, Gleason's theorem that the specialization map of a topologically normal rich smelted kimberlite
is a bijection on connected components under the explicit closed-specialization hypothesis below, and the specialization principle for π-adic kimberlites of
Anschütz–Gleason–Lourenço–Richarz.

The independent review accepts the corrected targets while leaving D7 and D11 partial. The general analytic residue-field argument and the unrestricted closed-specialization step remain gaps. The normality criterion using connected tubes assumes algebraically closed residue field; over a merely perfect field it is false (E9).

## Scope and boundaries

- **Imported from DiamondsAndVStacks.** Small v-sheaves and v-stacks, diamonds, underlying spaces, open and closed
  immersions, spatial and locally spatial diamonds (D0–D5); `Spd(A, A⁺)`, analytic diamondification and the étale-site
  comparison (D6.1–D6.5); pre-adic diamondification `X^♢` with its formal-affine analytic locus and closed complement
  (D6.6); the integral Galois quotient (D6.7); the point map `|X^♢| → |X|` (D6.8); seminormal rigid full faithfulness and
  rigid seminormalization (D6.9). None of these is planned again.
- **Imported from other roadmaps.** Scheme v-covers, universal subtrusiveness and v-descent for perfect schemes
  (ArcTopologyAndDescent AT.1, AT.7); perfection, universal homeomorphisms, excellence, completion and weak normality of
  schemes (SchemeAndStackFoundations SF.0, §§0.21–0.26 of its README); formal schemes, Huber's functor `t`, Berthelot and
  Conrad generic fibres, the classical specialization map, tubes, Grothendieck existence and formal GAGA
  (AdicSpacesPartII F0, R1, R2 — on TauCetiRoadmap these are AdicSpacesPartIII F0 and R2); partially proper and proper
  maps of v-stacks (DiamondEtaleCohomology C4); marked untilts and tilting (PerfectoidSpaces P1, P2).
- **Downstream.** Local models, `B_dR^+`-Grassmannians, integral models of local Shimura varieties and the
  Gleason–Lourenço connected-tube theorem are applications in GeometricSatakeAndFusion and HeckeStacksAndLocalShtukas and
  their Part II designs; they import D8–D11 and plan only their applications. The comparison with Ayoub's rigid analytic
  motives is not a target.

## Conventions

Fix a prime `p`. `Perf` is the category of perfectoid spaces of characteristic `p` with the v-topology, and v-sheaves are
small v-sheaves on `Perf`. For a pre-adic space `X` over `Spa(ℤ_p, ℤ_p)`, `X^♢` is the v-sheaf of DiamondsAndVStacks
D6.6. For a scheme `X` over `𝔽_p`, `X^⋄` is the *formal* convention: `Spec(A)^⋄(Spa(R, R⁺)) = Hom(A, R⁺)`, the
diamondification of the discrete pair `(A, A)`. It differs from the analytic convention `X◇` of
AdicCoefficientsAndComparisons L1, where `A` maps to `R`; over `O_E` the two functors are `X^⋄` and `X^♢` of
Anschütz–Gleason–Lourenço–Richarz Definition 2.10. A *formal Huber pair* is `(A, A)` with `A` complete for an `I`-adic
topology, `I` finitely generated; `Spd(A) = Spd(A, A)`. `E/ℚ_p` is complete and discretely valued with ring of integers
`O_E`, uniformizer `π` and perfect residue field `k`; *locally formally of finite type* over `Spf O_E` means an object of
Conrad's category `FS_{O_E}`. Its structure maps are continuous and need not be adic: `Spf O_E[[q]]` carries the `(π,q)`-adic topology. `A_red = (A/A·A°°)^perf`. Generic and special fibres over `Spd O` are `X_η = X ×_{Spd O}
Spd F` and `X_s = X ×_{Spd O} Spd k`.

Page numbers: Scholze–Weinstein's lectures are cited in the printed pagination of the authors' copy (PDF page minus 10),
de Jong in the journal pagination, and arXiv papers in their own pagination, which equals the PDF page.

## Layer D7: What diamondification forgets: universal homeomorphisms and perfect schemes

Diamondification forgets some scheme structure, including nilpotents and cuspidal defects; residue-field information remains essential. On the analytic side a residue-preserving homeomorphism, in particular a finite universal homeomorphism in characteristic 0, induces an isomorphism of diamonds; on the characteristic-`p` side `X^⋄` depends only on the perfection and is fully faithful on perfect schemes. Gleason's olivine spectrum computes the underlying space of `Spd(B, B⁺)` and gives the strongest full-faithfulness statement for perfect discrete sources.

<a id="d7-residue-fields-of-finite-universal-homeomorphisms"></a>

### D7.1 Finite universal homeomorphisms in characteristic zero preserve completed residue fields

**Lemma.** Let K be a complete nonarchimedean field of characteristic 0 and f : X → X' a finite morphism of adic spaces locally of finite type over Spa(K, K°) that is a universal homeomorphism: every base change of f along a morphism of adic spaces is a homeomorphism. Then for every x ∈ X with image x' = f(x) the map of completed residue fields K(x') → K(x) is an isomorphism of nonarchimedean fields carrying K(x')⁺ onto K(x)⁺.

*Hypotheses and conventions.* f finite: affinoid-locally Spa(B, B⁺) → Spa(A, A⁺) with B finite over A and B⁺ the integral closure of A⁺. Characteristic 0 makes every finite field extension separable; this is where the hypothesis enters.

*Proof sketch.* Finiteness gives a finite extension K(x)/K(x'), since the residue field of B at a point is a quotient of B ⊗_A κ(x'). Base change along Spa(C, C⁺) → X' with C a completed algebraic closure of K(x') and C⁺ extending K(x')⁺. The reduced geometric fibre over x' is a disjoint union of d copies of Spa(C, C⁺), with d = [K(x):K(x')], by separability. The finite fibre itself can have nilpotents. Universal injectivity forces d = 1. For a finite morphism the integral valuation subring K(x)⁺ is the integral closure of K(x')⁺ in K(x). Since the field extension has degree one and a valuation ring is integrally closed, the two integral valuation subrings agree.

*Acceptance.* For the normalization t ↦ (t², t³) of the cuspidal cubic over K the unique point above the cusp has residue field K. The finite morphism Spa(L, O_L) → Spa(K, O_K) for a nontrivial finite extension L/K is surjective and injective but not a universal homeomorphism: after base change to a completed algebraic closure it has [L:K] points.

*Uses.* DiamondsAndVStacks D6.9, Rigid.diamond_seminormalization: the finite universal homeomorphism X^sn → X satisfies the residue-field hypothesis of D7/universal-homeomorphism-invariance.

*Needs:* AdicSpacesPartII:R0, AdicSpacesPartII:R1/rigid-adic-comparison-functor.

*Sources:* [SW20](#source-sw20) Lecture 10, §10.2, paragraph before Proposition 10.2.1, p. 77 — Asserts without proof that in characteristic 0 a universal homeomorphism is the same as a homeomorphism inducing isomorphisms of completed residue fields, with the cuspidal-cubic normalization as example; the finite case is proved here by counting geometric points.

<a id="d7-plus-sheaf-mod-p-comparison"></a>

### D7.2 Integral structure sheaves modulo p^n along a residue-preserving homeomorphism

**Lemma.** Let f : X → X' be a morphism of analytic pre-adic spaces over Spa(Q_p, Z_p) that is a homeomorphism and induces, for every x ∈ X, an isomorphism of completed residue fields K(f(x)) → K(x) carrying K(f(x))⁺ onto K(x)⁺. Then for every n ≥ 1 the map O⁺_{X'}/p^n → f_\*(O⁺_X/p^n) is an isomorphism of sheaves on |X'| = |X| (quotients taken as sheaves).

*Hypotheses and conventions.* p is topologically nilpotent on X and X', since both lie over Spa(Q_p, Z_p).

*Proof sketch.* Compare stalks. For a point x of an analytic pre-adic space, the kernel of O⁺_{X,x} → κ(x)⁺ consists of germs g with |g(x)| = 0; each lies in p^n O⁺_{X,x}, because g/p^n is bounded by 1 on the rational neighbourhood {|g| ≤ |p^n|} of x. Hence O⁺_{X,x}/p^n = κ(x)⁺/p^n = K(x)⁺/p^n, the last since K(x)⁺ is the completion of κ(x)⁺ for a topology in which p is topologically nilpotent. The hypothesis identifies K(x')⁺/p^n with K(x)⁺/p^n compatibly with the map of stalks, and f is a homeomorphism, so the sheaf map is an isomorphism.

*Acceptance.* For the identity of X the comparison is the identity of O⁺_X/p^n. For X' = Spa(Q_p, Z_p) and X = Spa(Q_p(√p), Z_p[√p]) the map is a homeomorphism of one-point spaces, the residue fields differ, and Z_p/p → Z_p[√p]/p is not an isomorphism: the hypothesis is needed.

*Needs:* AdicSpacesPartII:R0, Mathlib `Valuation`.

*Sources:* [SW20](#source-sw20) Lecture 10, §10.2, Lemma 10.2.2 and proof, p. 77 — States that O⁺_{X'}/p^n → O⁺_X/p^n is an isomorphism of sheaves on |X| = |X'| and checks it on stalks K(x')⁺/p^n → K(x)⁺/p^n using equality of residue fields.

<a id="d7-universal-homeomorphism-invariance"></a>

### D7.3 Universal homeomorphisms induce isomorphisms of diamonds

**Theorem (`universalHomeomorphism_diamond_isIso`).** Let f : X → X' be a morphism of analytic pre-adic spaces over Spa(Q_p, Z_p) which is a homeomorphism and induces isomorphisms of completed residue fields with their valuation subrings (by D7/residue-fields-of-finite-universal-homeomorphisms this holds for every finite universal homeomorphism of adic spaces locally of finite type over a nonarchimedean field over Q_p). Then f^♦ : X^♦ → X'^♦ is an isomorphism of diamonds over Spd Q_p.

*Hypotheses and conventions.* Scholze–Weinstein state the result for all universal homeomorphisms of analytic pre-adic spaces over Spa Q_p; their reduction to the residue-field condition is the assertion recorded as the gap 'Completed residue fields of a general universal homeomorphism'.

*Proof sketch.* It suffices that for every affinoid perfectoid Y = Spa(S, S⁺) and every Y → X' (with Y the untilt) there is a unique factorization through f. The underlying map |Y| → |X'| = |X| is given; one needs a map of sheaves |f|\*O_X → O_Y compatible with the plus subsheaves. By D7/plus-sheaf-mod-p-comparison, O⁺_X/p^n = O⁺_{X'}/p^n, giving maps |f|\*O⁺_X/p^n → O⁺_Y/p^n for all n. Passing to the limit and using that Y is perfectoid, so O⁺_Y = lim O⁺_Y/p^n (H^i(Y, O⁺_Y/ϖ^n) is almost S⁺/ϖ^n for i = 0 and almost zero for i > 0), gives the unique factorization; inverting p gives the map on O. Uniqueness and the sheaf property make f^♦ bijective on all test objects.

*Acceptance.* The normalization A¹ → {y² = x³} of the cuspidal cubic over Q_p induces an isomorphism of diamonds although it is not an isomorphism of rigid spaces (SW20 §10.2). Compatibility: for X^sn → X the seminormalization of a rigid space over K ⊇ Q_p this gives DiamondsAndVStacks D6.9's statement that diamondification factors through seminormalization. Non-example: a nontrivial finite étale cover of degree d > 1 is not a universal homeomorphism and its diamond map is not an isomorphism.

*Uses.* SW20 Proposition 10.2.3: explains why full faithfulness of ♦ requires a seminormal source; DiamondsAndVStacks D6.9: Rigid.diamond_seminormalization sends the seminormalization map to an isomorphism.

*Needs:* [D7.2](#d7-plus-sheaf-mod-p-comparison), [D7.1](#d7-residue-fields-of-finite-universal-homeomorphisms), DiamondsAndVStacks:D6/gluing-and-the-diamond-functor, DiamondsAndVStacks:D2/v-descent-of-functions, DiamondsAndVStacks:D2/higher-v-acyclicity.

*Sources:* [SW20](#source-sw20) Lecture 10, §10.2, Proposition 10.2.1 and proof, pp. 77–78 — Proves that f^♦ is an isomorphism for a universal homeomorphism of analytic pre-adic spaces over Spa Q_p by constructing the unique factorization of every perfectoid test map through the comparison of O⁺/p^n and the completeness of O⁺ on perfectoid spaces.

*Planet:* Universal-homeomorphism invariance.

<a id="d7-perfect-scheme-v-sheaf"></a>

### D7.4 The v-sheaf X^⋄ of a scheme over F_p

**Construction (`PerfectScheme.diamond`).** For a scheme X over F_p, X^⋄ is the v-sheaf on Perf obtained by applying the pre-adic diamondification of DiamondsAndVStacks D6.6 to the discrete adic space with charts Spa(A, A) for affine opens Spec A ⊂ X. Concretely, Spec(A)^⋄(Spa(R, R⁺)) = Hom_ring(A, R⁺) (characteristic p, so no untilt choice), and X^⋄ is glued along the open subfunctors Spec(A[1/g])^⋄ = {f(g) ∈ (R⁺)^×} ⊂ Spec(A)^⋄. The construction X ↦ X^⋄ is a functor from F_p-schemes to small v-sheaves; X^⋄ = (X^perf)^⋄; it commutes with finite limits and sends open (closed) immersions to open (closed) immersions.

*Hypotheses and conventions.* This is the 'formal' convention Spa(A, A); it differs from the analytic convention Spa(A, A⁺) with A⁺ the integral closure of F_p used by AdicCoefficientsAndComparisons L1 for X◇. A discrete ring A has the discrete topology, so every ring map A → R⁺ is continuous.

*Proof sketch.* Use DiamondsAndVStacks:D6/pre-adic-diamondification for the discrete affine pairs (A, A) and glue along the open subfunctors attached to principal opens. Frobenius of R⁺ is bijective, so Hom(A, R⁺) = Hom(A^perf, R⁺): X^⋄ = (X^perf)^⋄ with X^perf from SchemeAndStackFoundations §0.24. Finite limits: Hom(A ⊗_C B, R⁺) = Hom(A, R⁺) ×_{Hom(C, R⁺)} Hom(B, R⁺) on affines, then glue. A closed immersion Spec(A/I) → Spec A gives maps annihilating every element of I; I need not be finitely generated. After a v-cover by totally disconnected perfectoid test objects, the simultaneous vanishing locus of all these functions is closed and weakly generalizing. Apply the parent's closed-sub-v-sheaf criterion there and descend closed immersions; arbitrary intersections, rather than a finite generating set, handle general I.

The API:

- `PerfectScheme.diamond` (constructor): The functor X ↦ X^⋄ from F_p-schemes to small v-sheaves.
- `PerfectScheme.diamond_affine` (simp): Spec(A)^⋄(Spa(R, R⁺)) = Hom(A, R⁺), naturally in A and in the test object.
- `PerfectScheme.diamond_perfection` (characterisation): The perfection map X^perf → X induces an isomorphism (X^perf)^⋄ ≅ X^⋄.
- `PerfectScheme.diamond_preservesFiniteLimits` (functoriality): X ↦ X^⋄ preserves finite limits, in particular fibre products over a base.
- `PerfectScheme.diamond_isOpenImmersion` (functoriality): Open immersions of schemes go to open immersions of v-sheaves; Spec(A[1/g])^⋄ is the locus where g is a unit of R⁺.
- `PerfectScheme.diamond_isClosedImmersion` (functoriality): Closed immersions go to closed immersions.
- `PerfectScheme.diamond_eq_preAdic` (compatibility): X^⋄ is DiamondsAndVStacks D6.6's PreAdic.diamond of the discrete adic space (X, Spa(A, A)) over Spa(Z_p, Z_p).

**Checks.**

- `perfectScheme_diamond_point` (computation): Spec(F_p)^⋄ is the final v-sheaf: each Spa(R, R⁺) has exactly one ring map F_p → R⁺.
- `perfectScheme_diamond_line` (computation): Spec(F_p[t])^⋄(Spa(R, R⁺)) = R⁺, the bounded closed disc, not R.
- `perfectScheme_diamond_analytic_convention` (non-example): For X = Spec F_p[t], X^⋄ is not the analytic X◇ of AdicCoefficientsAndComparisons L1: the point t ↦ 1/ϖ of Spa(R, R⁺) lies in X◇ and not in X^⋄.
- `perfectScheme_diamond_frobenius` (characterisation): The absolute Frobenius F_X induces an isomorphism of X^⋄: it is post-composition with the bijective Frobenius of R⁺, consistently with X^⋄ = (X^perf)^⋄.
- `perfectScheme_diamond_empty` (degenerate): The empty scheme gives the empty v-sheaf.

*Acceptance.* Spec(F_p)^⋄ is the final v-sheaf \*, and (Spec F_p[t])^⋄ sends Spa(R, R⁺) to R⁺.

*Uses.* SW20 Proposition 18.3.1: the functor whose full faithfulness on perfect schemes is proved; SW20 proof of Proposition 18.4.1: the special fibre of 𝔛^♢ is (𝔛_red^perf)^⋄; Gleason §3: S ↦ S^⋄ is the left adjoint whose right adjoint is the reduction functor; GeometricSatakeAndFusion GS0 Witt geometry: v-sheaves of perfect Witt Grassmannians and affine flag varieties.

*Needs:* DiamondsAndVStacks:D6/pre-adic-diamondification, DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness, DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks, SchemeAndStackFoundations:SF.0, Mathlib `PerfectRing`, Mathlib `PerfectClosure`, Mathlib `AlgebraicGeometry.Scheme`, DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces, DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes.

*Sources:* [SW20](#source-sw20) Lecture 18, §18.3, first paragraph, p. 163 — Considers a scheme of characteristic p as an adic space through Spec R ↦ Spa(R, R) and records that X^⋄ only depends on the perfection. [GLE](#source-gle) §3.1, definition of S^⋄ and Remark 3.1, p. 22; Propositions 3.2–3.3, p. 22 — Defines S^⋄(R, R⁺) as the ring maps A → R⁺ for S = Spec A perfect, notes that it is Spd(A) for discrete A, and proves smallness, full faithfulness and compatibility with finite limits. [AGLR](#source-aglr) §2.2, Definition 2.10(2) and the paragraph after it, p. 10 — Defines Spec(A)^⋄ by maps A → R^{♯,+} and its gluing along the loci |g| = 1, contrasting it with Spec(A)^♢ given by maps A → R^♯.

*Planet:* v-sheaf of a perfect scheme.

<a id="d7-minimal-point-lemma"></a>

### D7.5 Quasicompact spaces over a valuation spectrum have a minimal image point

**Lemma (`ValuationRing.exists_unique_minimal_image`).** Let V be a valuation ring, Z a nonempty quasicompact topological space and g : Z → Spec V a continuous map. Then the image g(Z) ⊂ Spec V has a unique minimal point for the generization order: a point of the image that is a specialization of every other point of the image (the largest prime ideal in the image).

*Hypotheses and conventions.* Spec V is totally ordered by specialization; Z is nonempty and quasicompact. Nonemptiness is necessary and is already present in the suggested Lean signature.

*Proof sketch.* Write V as a filtered union of valuation subrings V_i of finite rank; then Spec V = lim Spec V_i, each a finite chain. The image of Z in Spec V_i is a nonempty subset of a finite chain, with a most special point z_i; the z_i are compatible and define z ∈ Spec V. If z were not in g(Z), every image point would be a proper generization of z, so the preimages of the opens U_i of proper generizations of z_i would cover Z; quasicompactness and cofilteredness give one i with preimage all of Z, contradicting z_i ∈ image.

*Acceptance.* For V a field the image is the unique point. For Z = Spec V and g the identity the minimal point is the closed point. Quasicompactness is needed: for V with primes p_1 ⊊ p_2 ⊊ ⋯ whose union is the maximal ideal and Z = {p_n : n ≥ 1} with the subspace topology (not quasicompact), no image point specializes all others. The empty space has empty image and no minimal image point, so it is excluded. For the identity of Spec V the minimal image point is its closed point.

*Needs:* Mathlib `ValuationRing`, Mathlib `PrimeSpectrum`, Mathlib `Specializes`.

*Sources:* [SW20](#source-sw20) Lecture 18, §18.3, Lemma 18.3.2 and proof, p. 166 — The finite-chain compactness proof gives a most special image point for a nonempty quasicompact source; the printed statement omits nonemptiness (source issue E5).

<a id="d7-perfect-scheme-full-faithfulness"></a>

### D7.6 Full faithfulness of X ↦ X^⋄ on perfect schemes

**Theorem (`PerfectScheme.diamond_fullyFaithful`).** The functor X ↦ X^⋄ of D7/perfect-scheme-v-sheaf from perfect schemes of characteristic p to small v-sheaves on Perf is fully faithful: for perfect schemes X and Y, Hom(Y, X) → Hom(Y^⋄, X^⋄) is bijective.

*Hypotheses and conventions.* No finiteness or separatedness hypotheses on X or Y.

*Proof sketch.* Affine target X = Spec R: both sides turn colimits in Y into limits, so take Y = Spec S; the v-cover Spa(S((t^{1/p^∞})), S[[t^{1/p^∞}]]) of Y^⋄ embeds Hom(Y^⋄, X^⋄) into Hom(R, S[[t^{1/p^∞}]]), and equality of the two pullbacks to the self-product forces the image to lie in S, checked after mapping S to fields. Faithfulness in general: two maps with the same ⋄ agree on underlying spaces, by surjectivity of |Y^⋄| → |Y| (DiamondsAndVStacks D6.8), and then agree by the affine case. Fullness: successively for Y = Spec K (one point, factor through an affine open), Y = Spec V a valuation ring (the key case, using D7/minimal-point-lemma to show the map factors through U^⋄ for an affine U), Y = Spec ∏V_i (Stone–Čech compactification of the index set and splitting of open covers), and general Y by v-descent of perfect schemes. v-descent: Hom(−, X) is a v-sheaf on perfect schemes, so a map of v-sheaves defined on a v-cover by products of valuation rings descends.

*Acceptance.* For X = Spec F_p[t^{1/p^∞}], the endomorphisms of the v-sheaf X^⋄ are exactly the ring endomorphisms of F_p[t^{1/p^∞}]. Non-example for non-perfect schemes: Spec F_p[t] and its perfection have isomorphic ⋄, but are not isomorphic. Compatibility: Gleason's Theorem 2.32 (D7/discrete-source-full-faithfulness) specializes to this statement when the target is a perfect scheme.

*Uses.* SW20 proof of Proposition 18.4.1: recovers (𝔛_red)^perf from the closed complement of the analytic locus.

*Needs:* [D7.4](#d7-perfect-scheme-v-sheaf), [D7.5](#d7-minimal-point-lemma), [D7.10](#d7-perfect-v-covers), DiamondsAndVStacks:D6/pre-adic-topological-comparison, DiamondsAndVStacks:D1/strictly-totally-disconnected, ArcTopologyAndDescent:AT.7/perfect-effective-epimorphisms, ArcTopologyAndDescent:AT.1/perfection-v-comparison.

*Sources:* [SW20](#source-sw20) Lecture 18, §18.3, Proposition 18.3.1 and proof, pp. 163–166 — Proves full faithfulness of X ↦ X^⋄ on perfect schemes of characteristic p in four cases: affine target, a field, a valuation ring, a product of valuation rings, and v-descent. [GLE](#source-gle) §3.2, Proposition 3.16(1), p. 25 — Restates the result as reducedness of representable scheme-theoretic v-sheaves and deduces it from Theorem 2.32.

*Planet:* Full faithfulness on perfect schemes.

<a id="d7-olivine-spectrum"></a>

### D7.7 The olivine spectrum Spo(B, B⁺) of a Huber pair

**Definition (`Olivine.Spo`).** For a Huber pair (B, B⁺), Spo(B, B⁺) is the set of pairs x = (|·|^h_x, |·|^a_x) of points of Spa(B, B⁺) such that |·|^a_x has rank at most 1 and is a vertical generization of |·|^h_x, with the topology generated by the classical localizations U_{b₁≤b₂≠0} = {|b₁|^h ≤ |b₂|^h ≠ 0} and the analytic localizations N_{b₁≪b₂} = {|b₁|^a < |b₂|^a ≠ 0}. The first projection h : Spo(B, B⁺) → Spa(B, B⁺) is continuous, surjective and functorial. A point is discrete if |·|^a is trivial, d-analytic otherwise (analytic if h(x) is analytic, meromorphic otherwise), bounded if |B|^a ≤ 1, and formal if bounded and d-analytic; supp(x) = supp h(x), the specialization ideal sp(x) = {b ∈ B⁺ : |b|^h < 1} and, for bounded x, the deformation ideal def(x) = {b ∈ B : |b|^a < 1}.

*Hypotheses and conventions.* (B, B⁺) is a Huber pair, not necessarily complete or over Z_p; Spa(B, B⁺) is Tau Ceti's TauCeti.ValuationSpectrum.spa.

*Proof sketch.* Each fibre h^{-1}(h(x)) has at most one d-analytic and at most one discrete point, two exactly when h(x) is discrete and microbial. Classical and analytic localizations are functorial in (B, B⁺), so Spo is a functor and h is continuous.

The API:

- `Olivine.Spo` (constructor): The space Spo(B, B⁺) with its topology, functorial in maps of Huber pairs.
- `Olivine.h` (projection): The continuous surjective projection Spo(B, B⁺) → Spa(B, B⁺).
- `Olivine.isOpen_classicalLoc` (characterisation): U_{b₁≤b₂≠0} is the inverse image under h of the open valuation-comparison locus {|b₁| ≤ |b₂| ≠ 0}. It is a rational subset when the rational-domain open-ideal condition holds; in general it is a union of rational opens.
- `Olivine.isOpen_analyticLoc` (characterisation): N_{b₁≪b₂} is open.
- `Olivine.fibre_card` (relation): Every fibre of h has one or two points, two exactly over discrete microbial points.
- `Olivine.h_homeomorph_of_isTate` (compatibility): For a Tate pair h is a homeomorphism (Gleason Proposition 2.13).
- `Olivine.Spo_completion` (compatibility): Spo of the completion equals Spo(B, B⁺) (Gleason Proposition 2.10).
- `Olivine.boundedLocus` (data): The closed bounded locus Spo(B, B⁺)†, the complement of the union of the N_{1≪b}.

**Checks.**

- `olivine_tate_pair` (compatibility): For a perfectoid field (C, C⁺), Spo(C, C⁺) = Spa(C, C⁺) via h.
- `olivine_powerSeries` (computation): For B = F_p[[u]] with the discrete topology, Spa(B) has three points (two trivial valuations and the u-adic one) and Spo(B) has four: over the u-adic point lie a discrete microbial point and a d-analytic point that is both meromorphic and formal (Gleason Example 2.8).
- `olivine_point` (degenerate): Spo(F_p, F_p) is one point.
- `olivine_not_spa` (non-example): For B = F_p[[u]] discrete, h is not injective, so Spo is not Huber's spectrum.

*Acceptance.* Spo(B, B⁺) has more points than Spa(B, B⁺) exactly over the discrete microbial points. Algebraic points (|·|^h trivial) correspond to the prime ideals of B/B°° that are open.

*Uses.* Gleason Theorem 1 / Proposition 2.14: computes |Spd(B, B⁺)| as a set and, under finiteness conditions, as a space; Gleason Proposition 2.36 and Lemma 3.31: identifies schematic closed subsets with zero loci of open ideals; Gleason Proposition 4.9: formal specializations control uniqueness of formalizations; AGLR Proposition 2.39 footnote: the locus N_{t≪1} of a higher-rank valuation ring misses the generic fibre.

*Needs:* Tau Ceti `TauCeti.ValuationSpectrum.spa`, Tau Ceti `TauCeti.ValuationSpectrum.IsAnalyticPoint`, Mathlib `Valuation`, DiamondsAndVStacks:D0/locally-spectral-space.

*Sources:* [GLE](#source-gle) §2.1–2.2, Definitions 2.1, 2.2 and 2.4, Remark 2.3, pp. 10–11 — Defines the olivine spectrum as pairs of a valuation and a rank at most one vertical generization, with classical and analytic localizations as basic opens, and the discrete, analytic, meromorphic, bounded and formal points and the support, specialization and deformation ideals.

*Planet:* Olivine spectrum.

<a id="d7-olivine-comparison"></a>

### D7.8 The olivine spectrum computes |Spd(B, B⁺)|

**Theorem (`Olivine.spdSpace_homeomorph`).** For a complete Huber pair (B, B⁺) over Z_p, sending a point Spa(C, C⁺) → Spa(B, B⁺) of Spd(B, B⁺) to the images of the closed point and of the rank-one point defines a continuous bijection π : |Spd(B, B⁺)| → Spo(B, B⁺), functorial in (B, B⁺) and compatible with the generization patterns. It is a homeomorphism when (B, B) is a formal Huber pair, when (B, B⁺) is Tate, and when (B, B⁺) is topologically of finite type over a formal Huber pair (B₀, B₀) with B⁺ the integral closure of the image of the rings of integral elements; on the bounded locus it is always a homeomorphism.

*Hypotheses and conventions.* Huber pairs over Z_p; complete.

*Proof sketch.* Continuity: analytic localizations pull back to open loci on perfectoid tests; classical localizations pull back to open valuation-comparison loci, locally unions of rational opens. Injectivity: two points with the same image have the same residue field data and are equivalent through a common perfectoid field over (K_{h(x)}, K⁺_{h(x)}). Surjectivity: realize each pair (|·|^h, |·|^a) by a perfectoid field with an open bounded valuation subring. Formal pairs: compare with the analytic pre-adic space Spa(B[[t]])_{t≠0}, a v-cover whose space equals that of its diamond, and transport opens. Topologically finite type: induct on the number of variables using rational localizations and closed immersions, which preserve the olivine property (Gleason Propositions 2.11, 2.22).

*Acceptance.* For (B, B⁺) = (C, O_C) a perfectoid field, π is the homeomorphism |Spd C| = |Spa C| of DiamondsAndVStacks D6.3. For B = F_p[[u]] discrete, |Spd(B)| has four points, not the three of Spa(B). For (Z_p, Z_p), |Spd Z_p| is the two-point Sierpiński space, matching DiamondsAndVStacks D6.8's computation.

*Needs:* [D7.7](#d7-olivine-spectrum), DiamondsAndVStacks:D6/pre-adic-diamondification, DiamondsAndVStacks:D6/spd-is-a-spatial-diamond, DiamondsAndVStacks:D4/underlying-topological-space, DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks, PerfectoidSpaces:P2/completed-residue-fields.

*Sources:* [GLE](#source-gle) Introduction, Theorem 1, p. 3; §2.2, Propositions 2.13 and 2.14, p. 14; Lemma 2.18 and Proposition 2.19, pp. 15–16; Proposition 2.22, p. 17; Proposition 2.27, p. 18 — Constructs the comparison map, proves that it is a continuous bijection with the same generization pattern, a homeomorphism for formal pairs and pairs topologically of finite type over a formal pair, and always on the bounded locus.

<a id="d7-schematic-closed-subsets"></a>

### D7.9 Schematic closed subsets of the olivine spectrum are zero loci of open primes

**Lemma.** Let (B, B⁺) be a Huber pair. Call Z ⊂ Spo(B, B⁺) schematic if it is a union of images Spo(m)(Spo(A, A)) along maps of Huber pairs m : (B, B⁺) → (A, A) with A discrete. For a discrete A and m: the image of Spo(A, A) is h^{-1} of the image of Spa(A), which is stable under horizontal specializations and vertical generizations. If Z is schematic and closed then Z = σ^{-1}(V(I)) for the support map σ : Spo(B, B⁺) → Spec B and some ideal I of B open for the topology of B.

*Hypotheses and conventions.* (B, B⁺) a Huber pair; σ(x) = supp h(x).

*Proof sketch.* A continuous map to a discrete pair has open kernel and kills every topologically nilpotent element. Pass to B/(B·B°°), with the integral closure of the image of B⁺ as its plus subring; this is a discrete Huber pair. Topologically nilpotent elements need not themselves be an ideal of B. Images of discrete pairs are stable under the stated specializations and generizations (Gleason Proposition 2.34), hence Z = σ^{-1}(σ(Z)). The trivial-valuation section Spec B → Spa(B, B⁺) of the support map identifies σ(Z) with the preimage of h(Z), which is closed by Proposition 2.28.

*Acceptance.* For B = A discrete and Z = Spo(A, A) itself, I = 0. For A discrete and m : A → A/I with I an open prime, the image of Spo(A/I, A/I) is σ^{-1}(V(I)). For B = F_p × F_p discrete, the whole olivine spectrum is schematic and closed. Its defining radical ideal is zero, which is not prime. The empty locus is allowed by taking I = B.

*Needs:* [D7.7](#d7-olivine-spectrum), [D7.8](#d7-olivine-comparison), Mathlib `PrimeSpectrum.zeroLocus`.

*Sources:* [GLE](#source-gle) §2.5, Proposition 2.34, p. 21; Definition 2.35 and Proposition 2.36, p. 22 — The image and support arguments show that schematic closed subsets are inverse images of V(I) for an open ideal I; the claim that I must be prime in Proposition 2.36 is false (E6).

<a id="d7-perfect-v-covers"></a>

### D7.10 v-covers of perfect affine schemes are detected by ⋄

**Theorem (`PerfectScheme.isVCover_iff_diamond_epi`).** Let f : S → T be a morphism of perfect affine F_p-schemes. Then f^⋄ : S^⋄ → T^⋄ is a quasicompact map of v-sheaves, and f is universally subtrusive (a v-cover in the sense of Bhatt–Scholze and Rydh) if and only if f^⋄ is a surjection of v-sheaves. A small family (S_i → T) is a v-cover if and only if ⨿ S_i^⋄ → T^⋄ is surjective. Equivalently, Spec B → Spec A is universally subtrusive iff |Spa(B)| → |Spa(A)| (discrete pairs) is surjective.

*Hypotheses and conventions.* Perfect affine schemes; a family is a v-cover when a finite subfamily is.

*Proof sketch.* Quasicompactness: for perfect discrete A, the bounded locus of Spd(A) is everything, and maps of bounded loci along adic maps are representable in spatial diamonds (Gleason Lemma 2.26). For quasicompact maps surjectivity of v-sheaves is surjectivity on underlying spaces (DiamondsAndVStacks D4). Through D7/olivine-comparison, surjectivity of |Spd(B)| → |Spd(A)| is surjectivity of Spo(B, B) → Spo(A, A), which is surjectivity of Spa(B) → Spa(A) by Proposition 2.34. The adic-spectrum criterion for universal subtrusiveness is ArcTopologyAndDescent AT.1/v-cover-geometry.

*Acceptance.* The identity of a perfect affine scheme is a v-cover and its ⋄ is surjective. A proper surjection of perfect schemes, such as the perfected blow-up of the origin in the perfect affine plane, is a v-cover. Non-example: the inclusion of the generic point Spec F_p(t)^perf → Spec F_p[t]^perf is not a v-cover, and its ⋄ misses the points of the closed points.

*Needs:* [D7.8](#d7-olivine-comparison), [D7.9](#d7-schematic-closed-subsets), ArcTopologyAndDescent:AT.1/v-cover, ArcTopologyAndDescent:AT.1/v-cover-geometry, DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks, DiamondsAndVStacks:D5/relative-representability, [D7.4](#d7-perfect-scheme-v-sheaf).

*Sources:* [GLE](#source-gle) §3.1, Definition 3.4, Lemma 3.5, Lemma 3.6 and Proposition 3.7, pp. 22–23 — Recalls universal subtrusiveness, its adic-spectrum criterion, proves that f^⋄ is quasicompact and that f is a v-cover exactly when f^⋄ is surjective, for single maps and for families.

<a id="d7-discrete-source-full-faithfulness"></a>

### D7.11 Maps from perfect discrete adic spaces to pre-adic spaces

**Theorem (`PreAdic.diamond_hom_bijective_of_perfectDiscrete`).** Let Y be a perfect discrete adic space over F_p (locally Spa(A, A⁺) with A perfect and discrete) and X a pre-adic space over Z_p. Then Hom(Y, X) → Hom(Y^♢, X^♢) is bijective. In particular ♢ is fully faithful on perfect discrete adic spaces over F_p, and every map Spd(A, A⁺) → Spd(B, B⁺) to a complete Huber pair over Z_p comes from a unique map of Huber pairs (B, B⁺) → (A, A⁺).

*Hypotheses and conventions.* A⁺ ⊂ A is a ring of integral elements; A carries the discrete topology.

*Proof sketch.* Every map Spd(A, A⁺) → Spd(Z_p) factors through Spd F_p (Gleason Lemma 2.30). Affine target: test against Spa(A((t^{1/p^∞})), A⁺ + t^{1/p^∞}A[[t^{1/p^∞}]]), which covers the bounded locus; invariance under automorphisms of the test object and topological nilpotence of t^{p^n}f\*(b) force f\*(b) ∈ A, giving a ring map (B, B⁺) → (A, A⁺); agreement off the bounded locus uses ultraproducts of geometric points (Lemma 2.31). General X: show that a map g : Y^♢ → X^♢ descends to a continuous |Y| → |X| through the olivine spectrum; reduce to Y = Spa(A, A⁺) with A⁺ ⊂ A valuation rings with the same fraction field, where an exotic map would contradict quasicompactness via D7/minimal-point-lemma (Lemma 2.33). Glue the affine factorizations.

*Acceptance.* For Y = Spec(S) with S perfect and X = Spec(R) perfect this recovers D7/perfect-scheme-full-faithfulness on affines. For Y = Spa(F_p) and X = Spa(Z_p, Z_p) both sides are a single point. Perfection of the source is needed: for the non-perfect discrete Y = Spa(F_p[t], F_p[t]) the endomorphism of Y^♢ = (Y^perf)^♢ induced by t ↦ t^{1/p} is not induced by an endomorphism of Y.

*Uses.* Gleason Proposition 3.16: perfect schemes are reduced scheme-theoretic v-sheaves.

*Needs:* [D7.8](#d7-olivine-comparison), [D7.5](#d7-minimal-point-lemma), [D7.4](#d7-perfect-scheme-v-sheaf), DiamondsAndVStacks:D6/pre-adic-diamondification, DiamondsAndVStacks:D6/pre-adic-topological-comparison.

*Sources:* [GLE](#source-gle) Introduction, Theorem 2, p. 3; §2.5, Lemma 2.30, Lemma 2.31, Theorem 2.32 and Lemma 2.33, pp. 19–21 — Proves that morphisms from the v-sheaf of a perfect discrete adic space to that of any pre-adic space over Z_p come from unique morphisms of pre-adic spaces, via the affine Huber-pair case and a descent of the topological map.

*Planet:* Gleason's discrete-source full faithfulness.

### Dependencies of D7

Within this roadmap: none. Other roadmaps: AdicSpacesPartII:R0, AdicSpacesPartII:R1, ArcTopologyAndDescent:AT.1, ArcTopologyAndDescent:AT.7, DiamondsAndVStacks:D0, DiamondsAndVStacks:D1, DiamondsAndVStacks:D2, DiamondsAndVStacks:D3, DiamondsAndVStacks:D4, DiamondsAndVStacks:D5, DiamondsAndVStacks:D6, PerfectoidSpaces:P2, SchemeAndStackFoundations:SF.0.

## Layer D8: Scheme-theoretic v-sheaves and the reduction functor

The functor `S ↦ S^⋄` from perfect affine schemes is continuous for the v-topologies, so it extends to scheme-theoretic v-sheaves and has a right adjoint, the reduction functor. Reduction kills topologically nilpotent elements and analytic points. Formal adicness of a map is Cartesianness of its reduction square; it agrees with adicness for formal Huber pairs and underlies formal separatedness.

<a id="d8-scheme-theoretic-v-sheaves"></a>

### D8.1 Small scheme-theoretic v-sheaves

**Construction (`SchVSheaf`).** For a cutoff cardinal κ let PCAlg^op_κ be the category of perfect affine F_p-schemes whose underlying space and ring of global sections have cardinality at most κ, with the v-topology (a small family is a cover when a finite subfamily is universally subtrusive), and SchPerf~_κ its topos. For κ < λ the inverse-image (extension) functor induced by inclusion of sites gives fully faithful embeddings SchPerf~_κ → SchPerf~_λ; the category SchPerf~ of small scheme-theoretic v-sheaves is the filtered union over all cutoff cardinals. Representable functors of perfect schemes are objects; the topology is subcanonical.

*Hypotheses and conventions.* Scheme-theoretic v-sheaves are sheaves on the category PCAlg^op of perfect affine F_p-schemes with the v-topology of ArcTopologyAndDescent AT.1, made small through cutoff cardinals as in DiamondsAndVStacks D0/D2.

*Proof sketch.* Every morphism from a perfect affine scheme to a κ-small one factors through a κ-small v-cover (Gleason Lemma 3.10), so v-covers are filtered colimits of κ-small v-covers. Hence the inverse-image extension from the κ-small to the λ-small topos is fully faithful (Gleason Proposition 3.9), and the colimit over cutoff cardinals exists as in DiamondsAndVStacks D0/cutoff-cardinal. Subcanonicity is ArcTopologyAndDescent AT.1/perfection-v-comparison.

The API:

- `SchVSheaf` (constructor): The category of small scheme-theoretic v-sheaves, with the Yoneda functor from perfect schemes.
- `SchVSheaf.yoneda_fullyFaithful` (characterisation): Perfect schemes embed fully faithfully (subcanonicity).
- `SchVSheaf.extend_fullyFaithful` (compatibility): For κ < λ, extension (the inverse image of the geometric morphism) SchPerf~_κ → SchPerf~_λ is fully faithful; its right adjoint is restriction in the opposite direction.
- `SchVSheaf.hasFiniteLimits` (instance): Finite limits exist and are computed sectionwise.

**Checks.**

- `schVSheaf_point` (computation): Spec F_p is the final object.
- `schVSheaf_empty` (degenerate): The empty scheme represents the initial object.
- `schVSheaf_not_all_schemes` (non-example): Spec F_p[t] is not an object of the perfect affine site. Its restricted functor of points is nevertheless an object of the sheaf topos, represented there by its perfection.

*Acceptance.* A perfect scheme represents an object of SchPerf~.

*Uses.* Gleason Definition 3.12: target category of the reduction functor; AGLR Definition 2.19: X^red is a small v-sheaf on perfect k-schemes; GLX §3.4: the reduction of an integral shtuka moduli space is a perfect scheme in this category.

*Needs:* ArcTopologyAndDescent:AT.1/v-cover, ArcTopologyAndDescent:AT.1/perfection-v-comparison, DiamondsAndVStacks:D0/cutoff-cardinal, DiamondsAndVStacks:D2/cutoff-independence, Mathlib `PerfectRing`.

*Sources:* [GLE](#source-gle) §3.1, the paragraph after Remark 3.8, Lemma 3.10, Proposition 3.9 and the definition of SchPerf~, pp. 23–24 — Defines κ-small scheme-theoretic v-sheaves on perfect affine schemes with the v-topology, proves that the transition functors are fully faithful and defines small scheme-theoretic v-sheaves as their union.

<a id="d8-scheme-theoretic-underlying-space"></a>

### D8.2 The underlying space of a scheme-theoretic v-sheaf

**Construction.** For S ∈ SchPerf~, |S| is the set of equivalence classes of maps Spec k → S from perfect fields, two maps being equivalent if they are dominated by a common perfect field. Choosing a surjection X = ⨿ S_i → S from perfect affine schemes and a surjection Y → X ×_S X of the same kind, |S| = |X|/|Y| with the quotient topology, independent of choices; maps of scheme-theoretic v-sheaves induce continuous maps, and for S representable by a perfect scheme |S| is its Zariski space.

*Hypotheses and conventions.* Scheme-theoretic v-sheaves are sheaves on the category PCAlg^op of perfect affine F_p-schemes with the v-topology of ArcTopologyAndDescent AT.1, made small through cutoff cardinals as in DiamondsAndVStacks D0/D2.

*Proof sketch.* Existence of the presentations: smallness (Gleason Proposition 3.14(1)). Independence of choices and functoriality as for small v-sheaves (DiamondsAndVStacks D4/underlying-topological-space), using that v-covers of perfect schemes are surjective on points and submersive (ArcTopologyAndDescent AT.1/v-cover-geometry).

The API:

- `SchVSheaf.space` (constructor): The functor S ↦ |S| to topological spaces.
- `SchVSheaf.space_perfectScheme` (compatibility): For S represented by a perfect scheme X, |S| ≅ |X| homeomorphically, naturally in X.
- `SchVSheaf.space_quotient` (characterisation): |S| is the quotient of |X| by |X ×_S X| for any presentation by perfect affine schemes.
- `SchVSheaf.space_surjective_of_epi` (relation): A surjection of scheme-theoretic v-sheaves induces a surjection on spaces.

**Checks.**

- `schVSheaf_space_point` (computation): |Spec F_p| is one point.
- `schVSheaf_space_line` (computation): |Spec F_p[t^{1/p^∞}]| is the Zariski space of the affine line: one generic point and the closed points.
- `schVSheaf_space_empty` (degenerate): The empty sheaf has empty space.

*Acceptance.* For S = Spec A perfect, |S| = Spec A with the Zariski topology.

*Uses.* Gleason Definition 4.12: target space of the specialization map sp_F : |F| → |F^red|; Gleason Lemma 4.53, 4.55: π₀(|F^red|) and local noetherianity of |F^red|.

*Needs:* [D8.1](#d8-scheme-theoretic-v-sheaves), ArcTopologyAndDescent:AT.1/v-cover-geometry, DiamondsAndVStacks:D4/underlying-topological-space, Mathlib `PrimeSpectrum`.

*Sources:* [GLE](#source-gle) §3.1, definition of |S| after Remark 3.13 and Proposition 3.14, pp. 24–25 — Defines the underlying space of a small scheme-theoretic v-sheaf through perfect-field points and a quotient presentation, independent of choices and functorial.

<a id="d8-diamond-functor-on-scheme-theoretic-v-sheaves"></a>

### D8.3 The functor ⋄ from scheme-theoretic v-sheaves to v-sheaves

**Construction (`SchVSheaf.diamond`).** The functor S ↦ S^⋄ of D7/perfect-scheme-v-sheaf on perfect affine schemes is continuous for the v-topologies, so it extends uniquely to a colimit-preserving functor ⋄ : SchPerf~ → (small v-sheaves) commuting with finite limits, with (Spec A)^⋄ = Spd(A, A) for A perfect and discrete; the extension is compatible with the passage between cutoff cardinals.

*Hypotheses and conventions.* Scheme-theoretic v-sheaves are sheaves on the category PCAlg^op of perfect affine F_p-schemes with the v-topology of ArcTopologyAndDescent AT.1, made small through cutoff cardinals as in DiamondsAndVStacks D0/D2.

*Proof sketch.* Continuity: v-covers of perfect affine schemes go to surjections (D7/perfect-v-covers) and ⋄ preserves fibre products (D7/perfect-scheme-v-sheaf). The general topos formalism (SGA 4 IV 4.9.4) extends a continuous finite-limit-preserving functor on the site to the inverse image of a morphism of topoi f_κ : (v-sheaves)_κ → SchPerf~_κ, compatible in κ (Gleason Proposition 3.11).

The API:

- `SchVSheaf.diamond` (constructor): The functor ⋄ : SchPerf~ → small v-sheaves.
- `SchVSheaf.diamond_perfectScheme` (compatibility): On representables it is D7's X ↦ X^⋄.
- `SchVSheaf.diamond_preservesFiniteLimits` (functoriality): ⋄ preserves finite limits.
- `SchVSheaf.diamond_preservesColimits` (functoriality): ⋄ preserves small colimits.

**Checks.**

- `schVSheaf_diamond_point` (computation): (Spec F_p)^⋄ is the final v-sheaf.
- `schVSheaf_diamond_empty` (degenerate): The initial scheme-theoretic v-sheaf goes to the empty v-sheaf.
- `schVSheaf_diamond_not_diamond` (non-example): (Spec F_p)^⋄ = \* is not a diamond (DiamondsAndVStacks D6.6 check special_point_not_diamond).

*Acceptance.* For S a perfect scheme, S^⋄ agrees with D7/perfect-scheme-v-sheaf.

*Uses.* Gleason Definition 3.20: the square (F^red)^⋄ → F defining formal adicness; SW20 Proposition 18.4.1 proof: the closed complement of the analytic locus is (𝔛_red^perf)^⋄.

*Needs:* [D7.4](#d7-perfect-scheme-v-sheaf), [D7.10](#d7-perfect-v-covers), [D8.1](#d8-scheme-theoretic-v-sheaves), DiamondsAndVStacks:D4/small-v-sheaves-and-small-v-stacks, Mathlib `CategoryTheory.Limits.PreservesLimitsOfShape`.

*Sources:* [GLE](#source-gle) §3.1, Proposition 3.11 and the paragraph before Definition 3.12, p. 24 — Promotes ⋄ to the inverse image of morphisms of topoi compatible with the cutoff cardinals, commuting with finite limits.

<a id="d8-reduction-functor"></a>

### D8.4 The reduction functor F ↦ F^red

**Construction (`VSheaf.red`).** The reduction functor (−)^red from small v-sheaves to small scheme-theoretic v-sheaves is the right adjoint of ⋄: F^red(Spec R) = Hom(Spec(R)^⋄, F) = F(Spd(R, R)) for R perfect. It preserves limits and smallness, and comes with the counit (F^red)^⋄ → F and the unit S → (S^⋄)^red.

*Hypotheses and conventions.* Scheme-theoretic v-sheaves are sheaves on the category PCAlg^op of perfect affine F_p-schemes with the v-topology of ArcTopologyAndDescent AT.1, made small through cutoff cardinals as in DiamondsAndVStacks D0/D2.

*Proof sketch.* Right adjoint of the inverse image of the morphism of topoi of D8/diamond-functor-on-scheme-theoretic-v-sheaves, assembled over cutoff cardinals; the formula is the adjunction applied to representables (Gleason Remark 3.13). Smallness: the direct image preserves κ-smallness (Gleason Proposition 3.11), so F^red is small.

The API:

- `VSheaf.red` (constructor): The functor F ↦ F^red.
- `VSheaf.diamondRedAdj` (universal-property): The adjunction ⋄ ⊣ (−)^red, with unit and counit.
- `VSheaf.red_apply` (simp): F^red(Spec R) = F(Spd(R, R)) for R perfect, naturally in R and F.
- `VSheaf.red_preservesLimits` (functoriality): (−)^red preserves all limits, in particular fibre products.
- `VSheaf.red_counit` (projection): The adjunction map (F^red)^⋄ → F.
- `VSheaf.red_of_reduced` (relation): For a reduced S (D8/reduced-scheme-theoretic-v-sheaf) the unit S → (S^⋄)^red is an isomorphism.

**Checks.**

- `red_spdZp` (computation): Spd(Z_p)^red = Spec F_p.
- `red_spdQp` (degenerate): Spd(Q_p)^red is empty: every map Spd(R, R) → Spd Z_p with R discrete factors through Spd F_p (Gleason Lemma 2.30), which is disjoint from Spd Q_p.
- `red_perfectScheme` (compatibility): For a perfect scheme X, (X^⋄)^red = X (Gleason Proposition 3.16).
- `red_formalPair` (computation): For a formal Huber pair (A, A) with ideal of definition I, Spd(A)^red = Spec((A/I)^perf).

*Acceptance.* Spd(Z_p)^red = Spec F_p (Gleason Lemma 3.17).

*Uses.* Gleason §4: target of the specialization map and of Heuer's SP_F; SW20 Proposition 18.4.1 proof: functorial recovery of (𝔛_red)^perf from 𝔛^♢; GLX §3.4 and Lemma 3.10: the reduction of integral shtuka moduli is the affine Deligne–Lusztig variety, functorially in (G, b, μ); AGLR Theorem 2.37: the triple X ↦ (X_η, X^red, sp).

*Needs:* [D8.3](#d8-diamond-functor-on-scheme-theoretic-v-sheaves), Mathlib `CategoryTheory.Adjunction`.

*Sources:* [GLE](#source-gle) §3.1, Definition 3.12 and Remark 3.13, p. 24 — Defines the reduction functor as the right adjoint of ⋄ and records the formula F^red(S) = Hom(S^⋄, F). [AGLR](#source-aglr) §2.3, Definition 2.19, p. 14 — Recalls X^red(Spec A) = X(Spd(A)) and that (⋄, (−)^red) is an adjunction.

*Planet:* Reduction functor.

<a id="d8-reduced-scheme-theoretic-v-sheaf"></a>

### D8.5 Reduced scheme-theoretic v-sheaves and full faithfulness of ⋄

**Definition.** A small scheme-theoretic v-sheaf S is reduced if the unit S → (S^⋄)^red is an isomorphism. Every perfect scheme is reduced, and ⋄ is fully faithful on reduced objects: Hom(G^⋄, F^⋄) = Hom(G, F) for G arbitrary and F reduced.

*Hypotheses and conventions.* Scheme-theoretic v-sheaves are sheaves on the category PCAlg^op of perfect affine F_p-schemes with the v-topology of ArcTopologyAndDescent AT.1, made small through cutoff cardinals as in DiamondsAndVStacks D0/D2.

*Proof sketch.* Representables: Theorem 2.32 of Gleason (D7/discrete-source-full-faithfulness) applied to Y = Spec R and X perfect gives (X^⋄)^red = X. Full faithfulness: Hom(G^⋄, F^⋄) = Hom(G, (F^⋄)^red) = Hom(G, F) by adjunction.

The API:

- `SchVSheaf.IsReduced` (constructor): The predicate: the unit S → (S^⋄)^red is an isomorphism.
- `SchVSheaf.isReduced_perfectScheme` (example): Representables of perfect schemes are reduced.
- `SchVSheaf.diamond_fullyFaithful_of_isReduced` (characterisation): Hom(G^⋄, F^⋄) ≅ Hom(G, F) for F reduced.
- `SchVSheaf.IsReduced.pullback` (functoriality): Finite limits of reduced objects are reduced.

**Checks.**

- `isReduced_point` (computation): Spec F_p is reduced.
- `isReduced_empty` (degenerate): The empty scheme-theoretic v-sheaf is reduced.
- `isReduced_compat_SW` (compatibility): For perfect X, reducedness of X is SW20 Proposition 18.3.1.
- `isReduced_counit_spdZp` (non-example): The counit (Spd(Z_p)^red)^⋄ = Spd F_p → Spd Z_p is not an isomorphism: Spd Z_p is not in the essential image of ⋄.

*Acceptance.* Reduced objects are closed under finite limits.

*Uses.* Gleason Lemma 3.32: criterion for formal adicness when a fibre is reduced; Gleason Definition 4.15: prekimberlites have representable, hence reduced, reduction.

*Needs:* [D8.4](#d8-reduction-functor), [D7.11](#d7-discrete-source-full-faithfulness), [D7.6](#d7-perfect-scheme-full-faithfulness).

*Sources:* [GLE](#source-gle) §3.2, Definition 3.15 and Proposition 3.16, p. 25 — Defines reduced scheme-theoretic v-sheaves, proves that perfect schemes are reduced by Theorem 2.32 and that ⋄ is fully faithful on reduced objects by adjunction.

<a id="d8-reduction-of-huber-pairs"></a>

### D8.6 Reduction of Spd(A, A⁺) and of pre-adic spaces

**Theorem (`VSheaf.red_spd`).** Let X be a pre-adic space over Z_p and X^na → X the reduced non-analytic adic space of its non-analytic locus (locally Spa(A/(A·A°°), integralClosure(image(A⁺ → A/(A·A°°))))). Then (X^na,♢)^red → (X^♢)^red is an isomorphism. For a Huber pair (A, A⁺) over Z_p, Spd(A, A⁺)^red is represented by Spec(A_red) with A_red = (A/A·A°°)^perf; in particular Spd(A)^red = Spec((A/I)^perf) for a formal Huber pair with ideal of definition I, and Spd(Z_p)^red = Spec F_p.

*Proof sketch.* A map Spec(R)^⋄ → X^♢ for R perfect is a map of pre-adic spaces Spa(R) → X (D7/discrete-source-full-faithfulness); it factors through the non-analytic locus, which is final among reduced non-analytic adic spaces over X (Gleason Proposition 1.19). Affinely use the quotient by the ideal A·A°° and the integral closure of the image of A⁺ in that quotient; this makes the intended quotient-pair construction of Proposition 1.19 precise. Any map to a discrete perfect ring kills this ideal and then factors uniquely through perfection.

*Acceptance.* For (A, A⁺) = (C, O_C) a perfectoid field, A·A°° = C, so A_red = 0 and Spd(C, O_C)^red is empty. For (O_C, O_C), Spd(O_C)^red = Spec(k_C) with k_C the residue field. For A = F_p[t] discrete with A⁺ = A, A_red = F_p[t^{1/p^∞}].

*Uses.* SW20 Proposition 18.4.1 proof: (𝔛^♢)^red is the perfection of 𝔛_red; Gleason Proposition 4.17: formal schemes give prekimberlites.

*Needs:* [D8.4](#d8-reduction-functor), [D7.11](#d7-discrete-source-full-faithfulness), DiamondsAndVStacks:D6/pre-adic-diamondification, Mathlib `PerfectClosure`.

*Sources:* [GLE](#source-gle) §1.3, Proposition 1.19, p. 9; §3.2, Lemma 3.17 and Proposition 3.18, p. 25 — Proposition 1.19 constructs the reduced non-analytic locus. Its quotient plus ring is interpreted as the integral closure of the image in the quotient ambient ring. Lemma 3.17 and Proposition 3.18 identify reduction; the malformed second entry of the Spa expression is corrected in E8. [AGLR](#source-aglr) §2.3, paragraph after Definition 2.19, p. 14 — Records Spd(B)^red = Spec(B/I)^perf for formal pairs over O.

<a id="d8-quasiseparated-diamonds-have-empty-reduction"></a>

### D8.7 Quasiseparated diamonds have empty reduction

**Theorem.** If Y is a quasiseparated diamond then Y^red is empty: there is no map Spec(k)^⋄ → Y for k a perfect (equivalently, algebraically closed) field.

*Proof sketch.* Suppose f : Spec(k)^⋄ → Y, k algebraically closed; restrict to the sub-v-sheaf Y_y of points over the image y, a quasiseparated diamond with one point, so Y_y = Spa(C, O_C)/G for a profinite G (ECD Proposition 21.9). Cover Spec(k)^⋄ by Spa(K₁, O_{K₁}) with K₁ an algebraic closure of k((t^{1/p^∞})) and take a field K₂ ⊃ k with two embeddings of K₁ meeting in k; both composites to Y_y agree, which forces the image of C in K₂ to lie in k, contradicting the topologies.

*Acceptance.* Spd(Q_p)^red = ∅ and (Spa(C, C⁺)^♢)^red = ∅ for a perfectoid field C. Non-example: the final v-sheaf \* = Spd(F_p) is not a quasiseparated diamond and has reduction Spec F_p.

*Needs:* [D8.4](#d8-reduction-functor), DiamondsAndVStacks:D4/diamond, DiamondsAndVStacks:D5/spatial-diamond, DiamondsAndVStacks:D3/locally-profinite-torsors.

*Sources:* [GLE](#source-gle) §3.2, Proposition 3.19 and proof, pp. 25–26 — Proves that quasiseparated diamonds admit no maps from Spec(k)^⋄ by an argument with two embeddings of a perfectoid field over k.

<a id="d8-formally-adic-morphism"></a>

### D8.8 Formally adic morphisms of v-sheaves

**Definition (`VSheaf.FormallyAdic`).** A map f : F → G of small v-sheaves is formally adic if the square formed by the counits (F^red)^⋄ → F, (G^red)^⋄ → G and the maps (f^red)^⋄, f is Cartesian: (F^red)^⋄ = F ×_G (G^red)^⋄. Formally adic maps are stable under composition and base change.

*Proof sketch.* Composition: paste Cartesian squares. Base change: ⋄ and (−)^red commute with finite limits (D8/diamond-functor-on-scheme-theoretic-v-sheaves, D8/reduction-functor).

The API:

- `VSheaf.FormallyAdic` (constructor): The predicate: the reduction square of f is a pullback.
- `VSheaf.FormallyAdic.comp` (functoriality): Formally adic maps compose.
- `VSheaf.FormallyAdic.baseChange` (functoriality): Base changes of formally adic maps are formally adic.
- `VSheaf.FormallyAdic.of_isIso` (example): Isomorphisms are formally adic.
- `VSheaf.FormallyAdic.red_diamond_eq` (simp): For formally adic f, (F^red)^⋄ = F ×_G (G^red)^⋄ as subsheaves when the counits are injective.
- `VSheaf.FormallyAdic.commSq` (other): The reduction square of any f commutes, by naturality of the counit.

**Checks.**

- `formallyAdic_spd_powerSeries` (computation): Spd(Z_p[[T]]) → Spd(Z_p) with the (p, T)-adic topology is not formally adic: the fibre over Spd F_p contains the analytic points with p = 0, T ≠ 0.
- `formallyAdic_not_adic` (non-example): Spd(F_p((t)), F_p[[t]]) → Spd(F_p, F_p) with discrete topologies is adic as a map of adic spaces but not formally adic (Gleason Example 3.21).
- `formallyAdic_norm_to_discrete` (non-example): For K perfect nonarchimedean, Spd(K, O_K) → Spd(K_disc, O_K) from the norm topology to the discrete topology is formally adic, the source having empty reduction and empty fibre over Spec(K)^⋄, but it is not adic (Gleason Example 3.22).
- `formallyAdic_id` (degenerate): The identity of Spd Z_p is formally adic.
- `formallyAdic_pAdic_formal` (compatibility): For a p-adic formal pair (A, A), Spd(A) → Spd Z_p is formally adic, matching adicness of Spa(A) → Spa Z_p (Proposition 3.23).

*Acceptance.* Isomorphisms are formally adic.

*Uses.* Gleason Definition 3.27: formally closed immersions are formally adic closed immersions; Gleason Definition 4.26 and Theorem 4.27: étale formal neighbourhoods are formally adic étale maps; AGLR Definition 2.20(2), 2.23: π-adic prekimberlites are formally adic over Spd O; GLX §3.4: maps of integral shtuka moduli spaces are formally adic over Spd O_E.

*Needs:* [D8.4](#d8-reduction-functor), [D8.3](#d8-diamond-functor-on-scheme-theoretic-v-sheaves), Mathlib `CategoryTheory.IsPullback`.

*Sources:* [GLE](#source-gle) §3.2, Definition 3.20, Examples 3.21–3.22 and Proposition 3.24, pp. 26–27 — Defines formally adic maps by the Cartesian reduction square, shows by two examples that this is independent of adicness of maps of adic spaces, and proves stability under composition and base change. [AGLR](#source-aglr) §2.3, Definition 2.20(1), p. 14 — Same definition.

*Planet:* Formally adic morphism.

<a id="d8-formally-adic-versus-adic"></a>

### D8.9 Formal adicness detects adicness for formal Huber pairs

**Theorem.** For formal Huber pairs (A, A) and (B, B) over Z_p with ideals of definition I_A, I_B and a continuous map B → A, Spa(A) → Spa(B) is adic (some I_A^m ⊂ A·I_B) if and only if Spd(A) → Spd(B) is formally adic. For a Huber pair (A, A⁺) with a map to Spa(Z_p), if Spd(A, A⁺) → Spd Z_p is formally adic then Spa(A, A⁺) → Spa(Z_p) is adic.

*Proof sketch.* The reduction square involves Spec(A_red) and (Spec(A/I_B A)^perf); adicness makes them agree after perfection. Conversely, formal adicness identifies the Zariski closed subsets of I_A and I_B·A in Spec A, so I_A is nil modulo I_B·A and, being finitely generated, I_A^m ⊂ I_B·A. For (A, A⁺): the analytic locus U^♢ → Spd(A, A⁺) is formally adic (D8/quasiseparated-diamonds-have-empty-reduction, D8/reduction-of-huber-pairs); composing, formal adicness forces the analytic locus to lie over Spd Q_p.

*Acceptance.* Z_p[[T]] with the (p, T)-adic topology over Z_p with the p-adic topology: not adic and not formally adic. Z_p⟨T⟩ over Z_p: adic and formally adic.

*Needs:* [D8.8](#d8-formally-adic-morphism), [D8.6](#d8-reduction-of-huber-pairs), [D8.7](#d8-quasiseparated-diamonds-have-empty-reduction), AdicSpacesPartII:F0/adic-morphism-of-formal-schemes.

*Sources:* [GLE](#source-gle) §3.2, Proposition 3.23 and Proposition 3.26, pp. 26–27 — Proves that a map of formal Huber pairs is adic exactly when its Spd is formally adic, and that formal p-adicness of Spd(A, A⁺) forces adicness over Z_p.

<a id="d8-formally-closed-and-formally-separated"></a>

### D8.10 Formally p-adic v-sheaves, formally closed immersions and formally separated v-sheaves

**Definition (`VSheaf.FormallySeparated`).** A v-sheaf F over Spd Z_p is formally p-adic if F → Spd Z_p is formally adic. A map F → G is a formally closed immersion if it is a closed immersion (DiamondsAndVStacks D3) and formally adic. A v-sheaf F is formally separated if the diagonal F → F × F is a formally closed immersion; in particular it is separated.

*Proof sketch.* Unwind the definitions; stability of closed immersions and formally adic maps under composition and base change gives the same for formally closed immersions.

The API:

- `VSheaf.FormallyPAdic` (constructor): F → Spd Z_p is formally adic.
- `VSheaf.FormallyClosed` (constructor): Closed immersion and formally adic.
- `VSheaf.FormallySeparated` (constructor): The diagonal is formally closed.
- `VSheaf.FormallyClosed.comp` (functoriality): Composition of formally closed immersions.
- `VSheaf.FormallyClosed.baseChange` (functoriality): Base change of formally closed immersions.
- `VSheaf.FormallySeparated.isSeparated` (relation): Formally separated implies separated.
- `VSheaf.FormallySeparated.of_formallyClosed` (functoriality): A formally closed subsheaf of a formally separated v-sheaf is formally separated.

**Checks.**

- `formallySeparated_spdZp` (computation): Spd Z_p is formally separated (D8/spd-zp-formally-separated).
- `formallyClosed_special_fibre` (computation): Spd F_p → Spd Z_p is a formally closed immersion.
- `formallyClosed_origin` (computation): The origin Spd(F_p) → Spd(F_p[[T]]), T ↦ 0, with the T-adic topology, is a formally closed immersion.
- `formallyClosed_not_formalNbhd` (non-example): The formal neighbourhood Spd(F_p[[T]]) → Spd(F_p[T]) of the origin (discrete target) is an open immersion and is not formally adic, since the base change of (Spd F_p[T]^red)^⋄ = Spd(F_p[T]) is all of Spd(F_p[[T]]) while its reduction is Spd(F_p); so it is not formally closed.
- `formallySeparated_empty` (degenerate): The empty v-sheaf is formally separated.

*Acceptance.* Formally closed immersions compose and are stable under base change.

*Uses.* Gleason Proposition 4.9: formal separatedness gives uniqueness of formalizations; Gleason Definition 4.11: specializing v-sheaves are formally separated; Gleason Proposition 4.41: formally closed subsheaves of kimberlites are kimberlites; AGLR Proposition 2.24: π-adic prekimberlites are formally separated.

*Needs:* [D8.8](#d8-formally-adic-morphism), DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness.

*Sources:* [GLE](#source-gle) §3.2, Definitions 3.25 and 3.27, p. 27 — Defines formally p-adic v-sheaves, formally closed maps as formally adic closed immersions and formally separated v-sheaves by a formally closed diagonal.

*Planet:* Formally separated v-sheaf.

<a id="d8-spd-zp-formally-separated"></a>

### D8.11 Spd Z_p is formally separated and formally p-adic sheaves have formally adic diagonal

**Lemma.** Spd Z_p is formally separated. If F is formally p-adic then the diagonal F → F × F is formally adic.

*Proof sketch.* The diagonal of Spd Z_p pulls back along Spa(R, R⁺) → Spd Z_p × Spd Z_p to the locus where two untilts agree, the intersection of two closed Cartier divisors of Spa W(R⁺) minus V([ϖ]), a Zariski closed subset represented by a perfectoid space. (Spd Z_p × Spd Z_p)^red = Spec F_p and Spd(F_p) ×_{(Spd Z_p)²} Spd Z_p = Spd F_p give formal adicness. For F formally p-adic: F ×_{Spd Z_p} F → Spd Z_p is formally adic, the relative diagonal is formally adic by Cartesian-square generalities, and F ×_{Spd Z_p} F → F × F is a base change of the diagonal of Spd Z_p.

*Acceptance.* For F = Spd(A) with A a p-adic formal ring the diagonal is formally adic.

*Needs:* [D8.10](#d8-formally-closed-and-formally-separated), [D8.6](#d8-reduction-of-huber-pairs), DiamondsAndVStacks:D6/spd-of-a-tate-pair, PerfectoidSpaces:P1/marked-untilt.

*Sources:* [GLE](#source-gle) §3.2, Lemma 3.28 and Proposition 3.29, p. 27 — Proves that the diagonal of Spd Z_p is a formally adic closed immersion and that formally p-adic v-sheaves have formally adic diagonals.

<a id="d8-adjunction-injectivity-criterion"></a>

### D8.12 Injectivity of the reduction counit and the formally-adic criterion

**Lemma.** For a small v-sheaf F the diagonal F → F × F is formally adic iff the counit (F^red)^⋄ → F is injective; in that case a section m ∈ F(A, A⁺) lies in (F^red)^⋄ iff v-locally on Spa(A, A⁺) it extends along Spa(R, R⁺) → Spec(R⁺)^⋄ to a map Spec(R⁺)^⋄ → F. If (G^red)^⋄ → G is injective and F ×_G (G^red)^⋄ is represented by a reduced scheme-theoretic v-sheaf, then any f : F → G is formally adic.

*Proof sketch.* A map of sheaves is injective iff its diagonal square is Cartesian; (F^red)^⋄ is the sheafification of (R, R⁺) ↦ Hom(Spec(R⁺)^⋄, F). For the criterion: with T reduced and T^⋄ = F ×_G (G^red)^⋄, compute (T^⋄)^red = F^red ×_{G^red} ((G^red)^⋄)^red = F^red using the triangle identities, so (F^red)^⋄ = T^⋄.

*Acceptance.* Spd(A) for a formal Huber pair satisfies the criterion with (Spd A^red)^⋄ = Spec(A_red)^⋄.

*Needs:* [D8.4](#d8-reduction-functor), [D8.8](#d8-formally-adic-morphism), [D8.5](#d8-reduced-scheme-theoretic-v-sheaf).

*Sources:* [GLE](#source-gle) §3.2, Lemma 3.30 and Lemma 3.32, pp. 27–28 — Characterizes formal adicness of the diagonal by injectivity of the counit, describes sections of (F^red)^⋄, and gives a criterion for formal adicness through a reduced fibre.

<a id="d8-formally-closed-subsheaves-of-formal-pairs"></a>

### D8.13 Formally closed subsheaves of Spd(A) have reduction Spec(A/J)

**Lemma.** Let (A, A) be a formal Huber pair over Z_p and F → Spd(A) a formally closed immersion. Then (F^red)^⋄ = Spec(A/J)^⋄ for some open ideal J ⊂ A; in particular F^red is represented by the perfection of a closed subscheme of Spec(A_red).

*Proof sketch.* Pull back F → Spd(A) to a v-cover by totally disconnected perfectoid spaces. On each such space the parent classifies closed sub-v-sheaves by weakly generalizing closed subsets. Descent for closed immersions and for subobjects gives the corresponding closed subset |F| in Spo(A,A); this does not assume that Spd(A) itself is totally disconnected. By formal adicness |(F^red)^⋄| = |F| ∩ |Spec(A_red)^⋄|, and by D8/adjunction-injectivity-criterion it is a schematic closed subset of Spo(A, A). D7/schematic-closed-subsets identifies it with V(J) for an open ideal J.

*Acceptance.* For F = Spd(A/J) with J open (A/J discrete), F^red = Spec((A/J)^perf), which depends only on the radical of J.

*Uses.* Gleason Proposition 4.9: uniqueness of formalizations; Gleason Proposition 4.41: formally closed subsheaves of prekimberlites.

*Needs:* [D8.10](#d8-formally-closed-and-formally-separated), [D8.12](#d8-adjunction-injectivity-criterion), [D7.9](#d7-schematic-closed-subsets), [D8.6](#d8-reduction-of-huber-pairs), DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces, DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes, DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks.

*Sources:* [GLE](#source-gle) §3.2, Lemma 3.31 and proof, pp. 27–28 — Proves that a formally adic closed immersion into Spd(A) has reduction the zero locus of an open ideal, via schematic closed subsets of the olivine spectrum.

## Layer D9: Specializing v-sheaves, prekimberlites and formal neighbourhoods

A v-sheaf behaves like a formal scheme when its maps from perfectoid spaces formalize, uniquely by formal separatedness. Such specializing v-sheaves carry a continuous specialization map to the space of their reduction; prekimberlites add that the reduction is a scheme embedded as a closed subsheaf. Formal neighbourhoods, Heuer's thickening and the specialization morphism `SP_F` give étale formal neighbourhoods, which recover the étale site of the reduction.

<a id="d9-tate-specialization-map"></a>

### D9.1 The specialization map of a Tate Huber pair

**Construction (`Tate.sp`).** For a Tate Huber pair (A, A⁺) over Z_p, sp_A : |Spa(A, A⁺)| → |Spec(A⁺_red)| sends x to the prime {a ∈ A⁺ : |a(x)| < 1} of A⁺, which contains A⁺°° and so is a point of Spec(A⁺/A⁺°°) = Spec(A⁺_red) (the perfection does not change the space). It is functorial in maps of Tate Huber pairs, continuous, surjective, spectral and closed; for a strictly totally disconnected perfectoid Spa(R, R⁺) it is a homeomorphism.

*Hypotheses and conventions.* A⁺_red = (A⁺/A⁺·A⁺°°)^perf; for perfectoid pairs A⁺°° is the radical of a pseudouniformizer.

*Proof sketch.* The set {a ∈ A⁺ : |a(x)| < 1} is a prime ideal since |·(x)| is multiplicative and ≤ 1 on A⁺; it contains the topologically nilpotent elements. Continuity, surjectivity, spectrality and closedness: Bhatt's notes Theorem 8.1.2 (cited by Gleason Proposition 4.2), through the description of Spa(A, A⁺) as an inverse limit over formal models. Strictly totally disconnected case: points with the same image lie in the same connected component; components are Spa(C, C⁺) (DiamondsAndVStacks D1/strictly-totally-disconnected), where sp is the bijection between points of Spa(C, C⁺) and primes of C⁺ above m_C (valuation rings between C⁺ and O_C).

The API:

- `Tate.sp` (constructor): The map |Spa(A, A⁺)| → |Spec(A⁺_red)|, x ↦ {a ∈ A⁺ : |a(x)| < 1}.
- `Tate.sp_isPrime` (other): The value at x is a prime ideal of A⁺ containing A⁺°°.
- `Tate.sp_continuous` (characterisation): sp_A is continuous; the preimage of D(a) is {|a| = 1}.
- `Tate.sp_surjective` (characterisation): sp_A is surjective.
- `Tate.sp_isSpectralMap` (characterisation): sp_A is a spectral and closed map of spectral spaces.
- `Tate.sp_natural` (functoriality): sp_B ∘ |Spa(f)| = |Spec(f⁺_red)| ∘ sp_A for a map of Tate pairs f : (B, B⁺) → (A, A⁺).
- `Tate.sp_homeomorph_of_strictlyTotallyDisconnected` (compatibility): For Spa(R, R⁺) strictly totally disconnected perfectoid, sp_R is a homeomorphism.
- `specializationIdeal` (data): Pointwise form: for a valuation v bounded by 1 on a subring A⁺, the ideal {a ∈ A⁺ : v(a) < 1} of A⁺.
- `mem_specializationIdeal` (simp): a ∈ specializationIdeal v A⁺ iff v(a) < 1.
- `specializationIdeal_isPrime` (other): The pointwise specialization ideal is prime.
- `supp_le_specializationIdeal` (relation): Elements of A⁺ in the support of v lie in the specialization ideal.

**Checks.**

- `tate_sp_field` (computation): For a perfectoid field (C, O_C), sp sends the point to the maximal ideal of O_C.
- `tate_sp_rank_two` (computation): For (C, C⁺) with C⁺ of rank two, Spa(C, C⁺) has two points and sp is a bijection onto the two primes of C⁺ above m_C, the closed point going to the maximal ideal of C⁺.
- `tate_sp_disc` (computation): For the closed unit disc Spa(C⟨T⟩, O_C⟨T⟩) the Gauss point maps to the generic point of Spec k_C[T].
- `tate_sp_trivial` (degenerate): For the empty Tate pair (the zero ring) sp is the empty map.
- `tate_sp_not_injective` (non-example): For the closed disc sp is not injective: the classical points of the open disc |T| < 1 all map to the origin.
- `specializationIdeal_one_not_mem` (degenerate): 1 ∉ specializationIdeal v A⁺, since v(1) = 1.
- `specializationIdeal_unit_not_mem` (non-example): A unit of A⁺ has value 1 and is not in the specialization ideal, so the ideal is proper and different from A⁺.

*Acceptance.* For (C, O_C) a perfectoid field sp_C maps the unique point to the closed point of Spec(k_C).

*Uses.* Gleason Definition 4.12: descends to the specialization map of specializing v-sheaves; Gleason Proposition 4.9: surjectivity forces formally closed subsheaves with dense generic fibre to be everything; AGLR Proposition 2.32: surjectivity of sp_A for A integrally closed in A[1/π].

*Needs:* Tau Ceti `TauCeti.ValuationSpectrum.spa`, Mathlib `Valuation`, Mathlib `Ideal.IsPrime`, Mathlib `PrimeSpectrum`, DiamondsAndVStacks:D1/strictly-totally-disconnected, DiamondsAndVStacks:D0/closure-of-pro-constructible.

*Sources:* [GLE](#source-gle) §4.1, Definition 4.1, Propositions 4.2 and 4.3, p. 28 — Defines sp_A by the ideal of elements of absolute value less than one, cites its continuity, surjectivity, spectrality and closedness, and proves bijectivity for strictly totally disconnected spaces.

<a id="d9-formalization"></a>

### D9.2 Formalizations and v-formalizing v-sheaves

**Definition (`VSheaf.VLocallyFormal`).** Let F be a small v-sheaf, (A, A⁺) a Tate Huber pair and f : Spd(A, A⁺) → F. A formalization of f is a map t : Spd(A⁺) → F restricting to f, where Spd(A⁺) = Spd(A⁺, A⁺) with the ϖ-adic topology. F formalizes f if one exists, v-formalizes f if f becomes formalizable after a v-cover Spa(B, B⁺) → Spa(A, A⁺); F is formalizing if it formalizes all maps from affinoid perfectoid spaces and v-formalizing if it v-formalizes all of them. F is v-locally formal if there is a surjection ⨿_i Spd(B_i) → F from formal Huber pairs over Z_p; this is equivalent to v-formalizing, and to the existence of a surjection ⨿_j Spd(R_j⁺) → F from perfectoid pairs.

*Proof sketch.* Spd Z_p and Spd(B) for formal Huber pairs are formalizing: a map Spa(A, A⁺) → Spd Z_p is an untilt, given by a primitive ξ ∈ W(R⁺), which defines Spd(R⁺) → Spd Z_p (Gleason Lemma 4.7). v-formalizing implies v-locally formal by refining a surjection from affinoid perfectoid spaces; the converse because maps into Spd(B_i) formalize. Permanence (Gleason Proposition 4.8): images of v-formalizing sheaves under surjections are v-formalizing; S^⋄ is formalizing for perfect affine S and v-formalizing for any scheme-theoretic v-sheaf; nonempty v-formalizing sheaves have nonempty reduction, so quasiseparated diamonds are not v-formalizing.

The API:

- `VSheaf.Formalizes` (constructor): F formalizes f : Spd(A, A⁺) → F.
- `VSheaf.VFormalizing` (constructor): Every map from an affinoid perfectoid space v-locally formalizes.
- `VSheaf.VLocallyFormal` (constructor): A surjection from a disjoint union of Spd of formal Huber pairs.
- `VSheaf.vFormalizing_iff_vLocallyFormal` (equivalence): The two notions agree.
- `VSheaf.vFormalizing_spd_formal` (example): Spd(B) is formalizing for every formal Huber pair (B, B) over Z_p.
- `VSheaf.VFormalizing.of_epi` (functoriality): Images of v-formalizing sheaves under surjections are v-formalizing.
- `VSheaf.VFormalizing.red_nonempty` (relation): A nonempty v-formalizing sheaf has nonempty reduction.

**Checks.**

- `vFormalizing_spdZp` (computation): Spd Z_p is formalizing.
- `vFormalizing_spdQp_not` (non-example): Spd Q_p is not v-formalizing: its reduction is empty.
- `vFormalizing_scheme` (compatibility): For a perfect affine scheme S, S^⋄ is formalizing; for X a scheme-theoretic v-sheaf, X^⋄ is v-formalizing.
- `vFormalizing_empty` (degenerate): The empty v-sheaf is v-formalizing.

*Acceptance.* Spd(O_C) is formalizing; Spd(C, O_C) is not v-formalizing.

*Uses.* Gleason Definition 4.11: specializing v-sheaves are v-locally formal; Gleason Remark 4.13: computing sp_F through a formalized representative; AGLR Definition 2.23: π-adic prekimberlites; GLX §3.4: integral shtuka moduli are v-locally formal through Demazure resolutions with A_inf coefficients.

*Needs:* [D8.4](#d8-reduction-functor), [D8.7](#d8-quasiseparated-diamonds-have-empty-reduction), [D8.12](#d8-adjunction-injectivity-criterion), DiamondsAndVStacks:D6/pre-adic-diamondification, PerfectoidSpaces:P1/marked-untilt, DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site.

*Sources:* [GLE](#source-gle) §4.2, Definitions 4.5 and 4.6, Lemma 4.7 and Proposition 4.8, pp. 28–29 — Defines formalizations, (v-)formalizing and v-locally formal v-sheaves, proves Spd Z_p and Spd of formal pairs are formalizing, the equivalence of the two v-local notions and their basic permanence. [AGLR](#source-aglr) §2.3, Definition 2.21 and Proposition 2.22, pp. 14–15 — Same notions and the equivalence of the three formulations.

<a id="d9-unique-formalization"></a>

### D9.3 Formalizations into a formally separated v-sheaf are unique

**Theorem.** If F is formally separated and f : Spa(R, R⁺) → F is a map from an affinoid perfectoid space of characteristic p, then f has at most one formalization Spd(R⁺) → F. Fibre products of v-formalizing sheaves over a formally separated sheaf are v-formalizing, and v-formalizing formally separated v-sheaves are stable under fibre products and contain Spd Z_p.

*Proof sketch.* Two formalizations g₁, g₂ define Spd(R⁺) → F × F; the pullback of the diagonal is a formally closed subsheaf G ⊂ Spd(R⁺) containing Spa(R, R⁺). By D8/formally-closed-subsheaves-of-formal-pairs, G^red is a closed subscheme of Spec(R⁺_red); it contains the formal specializations of all geometric points, so by surjectivity of D9/tate-specialization-map it is everything. Hence |G| = |Spd(R⁺)| and G = Spd(R⁺), so g₁ = g₂. The fibre-product statements follow by choosing compatible formalizations and D8/spd-zp-formally-separated.

*Acceptance.* For F = Spd(O_C) every map from Spa(C, O_C) has the unique formalization Spd(O_C) → Spd(O_C).

*Needs:* [D8.10](#d8-formally-closed-and-formally-separated), [D8.13](#d8-formally-closed-subsheaves-of-formal-pairs), [D9.1](#d9-tate-specialization-map), [D9.2](#d9-formalization), [D8.11](#d8-spd-zp-formally-separated).

*Sources:* [GLE](#source-gle) §4.2, Proposition 4.9 and Proposition 4.10, p. 29 — Proves uniqueness of formalizations into formally separated v-sheaves by analysing the formally closed equalizer subsheaf of Spd(R⁺), and stability of v-formalizing formally separated sheaves under fibre products.

<a id="d9-specializing-v-sheaf"></a>

### D9.4 Specializing v-sheaves

**Definition (`VSheaf.Specializing`).** A small v-sheaf F is specializing if it is formally separated and v-locally formal. Specializing v-sheaves are stable under fibre products and contain Spd Z_p and Spd(B) for every formal Huber pair over Z_p.

*Proof sketch.* Stability: D9/unique-formalization.

The API:

- `VSheaf.Specializing` (constructor): Formally separated and v-locally formal.
- `VSheaf.Specializing.pullback` (functoriality): Fibre products of specializing sheaves are specializing.
- `VSheaf.specializing_spd_formal` (example): Spd(B) is specializing for formal Huber pairs over Z_p.
- `VSheaf.Specializing.unique_formalization` (characterisation): Maps from affinoid perfectoid spaces have at most one formalization.

**Checks.**

- `specializing_spdZp` (computation): Spd Z_p is specializing.
- `specializing_spdQp_not` (non-example): Spd Q_p is formally separated but not v-locally formal, so not specializing.
- `specializing_empty` (degenerate): The empty v-sheaf is specializing.
- `specializing_point` (computation): Spd F_p = Spec(F_p)^⋄ is specializing.

*Acceptance.* Spd Z_p is specializing.

*Uses.* Gleason Definition 4.12: these are the v-sheaves with a specialization map; Gleason Definition 4.15: prekimberlites are specializing; Gleason Proposition 4.41: formally closed subsheaves of specializing sheaves are specializing.

*Needs:* [D8.10](#d8-formally-closed-and-formally-separated), [D9.2](#d9-formalization), [D9.3](#d9-unique-formalization).

*Sources:* [GLE](#source-gle) §4.2, Definition 4.11 and Proposition 4.10, p. 29 — Defines specializing v-sheaves as formally separated and v-locally formal and proves their stability under fibre products.

*Planet:* Specializing v-sheaf.

<a id="d9-specialization-map"></a>

### D9.5 The specialization map sp_F : |F| → |F^red|

**Construction (`VSheaf.sp`).** For a specializing v-sheaf F, sp_F : |F| → |F^red| is the unique map such that for every surjection ⨿ Spd(B_i) → F from formal Huber pairs, sp_F composed with |Spd(B_i)| → |F| equals |f^red| composed with the specialization |Spd(B_i)| → |Spec((B_i)_red)|. Concretely, represent x ∈ |F| by a formalizable Spa(K, K⁺) → F, take its unique formalization Spd(K⁺) → F, apply (−)^red to get Spec((K⁺)_red) → F^red, and take the image of the closed point. sp_F is continuous and functorial in maps of specializing v-sheaves.

*Proof sketch.* Well defined and independent of choices by D9/unique-formalization (Gleason Remark 4.13). Continuity: in the square with a cover ⨿ Spd(R_i⁺) → F, the left map is a quotient map, f^red is continuous (D8/scheme-theoretic-underlying-space) and the sp_{R_i⁺} are continuous (D9/tate-specialization-map).

The API:

- `VSheaf.sp` (constructor): The continuous map |F| → |F^red| of a specializing F.
- `VSheaf.sp_spd_formal` (compatibility): For F = Spd(B) with B formal, sp_F on |Spd(B)| restricted to the analytic locus is the Tate specialization of D9/tate-specialization-map composed with Spec of the reduction.
- `VSheaf.sp_natural` (functoriality): |f^red| ∘ sp_F = sp_G ∘ |f| for f : F → G of specializing sheaves.
- `VSheaf.sp_continuous` (characterisation): sp_F is continuous.
- `VSheaf.sp_red_points` (simp): On |(F^red)^⋄| ⊂ |F| (when the counit is injective), sp_F is the canonical map |(F^red)^⋄| → |F^red|.

**Checks.**

- `sp_spdZp` (computation): sp_{Spd Z_p} sends both points of |Spd Z_p| to the point of Spec F_p.
- `sp_spd_disc` (computation): For F = Spd(Z_p⟨T⟩), sp sends the Gauss point of the generic fibre to the generic point of Spec F_p[T]^perf and a classical point T = a, |a| ≤ 1, to the closed point T = ā.
- `sp_empty` (degenerate): For F empty, sp_F is the empty map.
- `sp_not_injective` (non-example): sp_F is not injective: for F = Spd(Z_p⟨T⟩) all classical points of a residue disc |T − a| < 1 map to the same closed point T = ā.

*Acceptance.* For F = Spd(O_C), sp_F maps both points to the point of Spec k_C.

*Uses.* SW20 Proposition 18.4.1 proof: the closure of a classical point meets the special fibre in sp of it; GLX ¶6 and (3.4): specialization triples of prekimberlites and agreement with formal schemes; Gleason Lemma 4.55: π₀(sp_D) is a bijection for topologically normal rich pairs; AGLR Proposition 2.27: functoriality of (X_η, X^red, sp).

*Needs:* [D9.4](#d9-specializing-v-sheaf), [D9.3](#d9-unique-formalization), [D9.1](#d9-tate-specialization-map), [D8.2](#d8-scheme-theoretic-underlying-space), [D8.4](#d8-reduction-functor), DiamondsAndVStacks:D4/underlying-topological-space.

*Sources:* [GLE](#source-gle) §4.2, Definition 4.12, Remark 4.13 and Proposition 4.14, p. 30 — Defines the specialization map of a specializing v-sheaf by descending the specialization maps of formal pairs, explains the recipe through unique formalizations, and proves continuity and functoriality.

*Planet:* Specialization map of a v-sheaf.

<a id="d9-prekimberlite"></a>

### D9.6 Prekimberlites and their analytic locus

**Definition (`VSheaf.Prekimberlite`).** A prekimberlite is a specializing v-sheaf F such that F^red is represented by a (perfect) scheme and the counit (F^red)^⋄ → F is a closed immersion. Its analytic locus is the open complement F^an = F ∖ (F^red)^⋄.

*Proof sketch.* The complement of a closed immersion is an open subsheaf (DiamondsAndVStacks D3/D4).

The API:

- `VSheaf.Prekimberlite` (constructor): Specializing, representable reduction, closed counit.
- `VSheaf.Prekimberlite.an` (data): The open analytic locus F^an.
- `VSheaf.Prekimberlite.redScheme` (projection): The perfect scheme representing F^red.
- `VSheaf.Prekimberlite.counit_formallyClosed` (relation): The counit (F^red)^⋄ → F is a formally closed immersion.
- `VSheaf.Prekimberlite.space_decomposition` (characterisation): |F| = |F^an| ⊔ |(F^red)^⋄| as sets, with |F^an| open.

**Checks.**

- `prekimberlite_spdZp` (computation): Spd Z_p is a prekimberlite with reduction Spec F_p and analytic locus Spd Q_p.
- `prekimberlite_spd_formal` (computation): Spd(Z_p⟨T⟩) is a prekimberlite with reduction Spec F_p[T]^perf and analytic locus the diamond of the closed disc over Q_p.
- `prekimberlite_diamond_not` (non-example): A nonempty quasiseparated diamond is not a prekimberlite: it is not v-formalizing.
- `prekimberlite_empty` (degenerate): The empty v-sheaf is a prekimberlite with empty reduction.

*Acceptance.* For a prekimberlite F the counit (F^red)^⋄ → F is a formally closed immersion.

*Uses.* Gleason Definition 4.18: formal neighbourhoods of locally closed subschemes of F^red; Gleason Definition 4.26 and Theorem 4.27: the étale site of F^red is recovered by étale formal neighbourhoods; GLX ¶5–6, §3.4: integral models of local Shimura varieties and their specialization triples; Gleason Definition 4.30: valuative prekimberlites.

*Needs:* [D9.4](#d9-specializing-v-sheaf), [D8.5](#d8-reduced-scheme-theoretic-v-sheaf), DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness, DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks.

*Sources:* [GLE](#source-gle) §4.3, Definition 4.15, p. 30 — Defines prekimberlites by representability of the reduction and closedness of the counit, and their analytic locus as the complement. [AGLR](#source-aglr) §2.3, Definition 2.23 and Proposition 2.24, p. 15 — The π-adic variant over Spd O and its comparison with Gleason's definition.

*Planet:* Prekimberlite.

<a id="d9-formal-scheme-prekimberlite"></a>

### D9.7 Formal schemes give prekimberlites

**Theorem (`FormalScheme.diamond_prekimberlite`).** Let 𝔛 be a separated locally noetherian formal scheme over Spf Z_p (so p lies in an ideal of definition locally) and 𝔛^ad = t(𝔛) its adic space (AdicSpacesPartII R2). Then 𝔛^♢ := (𝔛^ad)^♢ is a prekimberlite with (𝔛^♢)^red = (𝔛_red)^perf, its counit is the closed immersion ((𝔛_red)^perf)^⋄ → 𝔛^♢ of the non-analytic locus, and (𝔛^♢)^an = (𝔛^ad_a)^♢ is the diamond of the analytic locus.

*Hypotheses and conventions.* Formal schemes are those of AdicSpacesPartII F0 (locally noetherian, with the fully faithful functor t to adic spaces); separated means 𝔛_red is separated.

*Proof sketch.* v-locally formal: 𝔛^♢ is covered by the Spd(A) of affine opens Spf A. Reduction: D8/reduction-of-huber-pairs gives (𝔛^♢)^red = (𝔛^na,♢)^red = (𝔛_red)^perf; the counit is the map of the non-analytic locus, a closed immersion (Gleason Proposition 1.21(6); DiamondsAndVStacks D6.6 diamond_formal_complement). Separatedness over Spd Z_p: quasiseparatedness from quasicompactness of affine intersections and representability of the diagonal; the valuative criterion (DiamondsAndVStacks D3) reduces to separatedness of 𝔛_red via maps Spf(K⁺) → 𝔛 as pairs of a map from Spf(O_K) and a map from Spec(K⁺/K°°). The closed counit already established is a monomorphism. Apply D8/adjunction-injectivity-criterion to obtain formal adicness of the diagonal, and combine it with separatedness proved above. This proves formal separatedness without assuming that the structure map to Spd Z_p is formally p-adic.

*Acceptance.* For 𝔛 = Spf Z_p⟨T⟩ the prekimberlite is Spd(Z_p⟨T⟩) with reduction the perfect affine line. For 𝔛 = Spf Z_p[[T]] ((p, T)-adic) the analytic locus contains points with p = 0 and T ≠ 0, so (𝔛^♢)^an ≠ (𝔛^♢)_η.

*Uses.* SW20 Proposition 18.4.1: the source category of the full-faithfulness theorem; Gleason Corollary 4.28: étale formal neighbourhoods of formal schemes are formal schemes.

*Needs:* [D9.6](#d9-prekimberlite), [D8.6](#d8-reduction-of-huber-pairs), [D8.11](#d8-spd-zp-formally-separated), AdicSpacesPartII:F0/locally-noetherian-formal-scheme, AdicSpacesPartII:R2/noetherian-formal-scheme-as-adic-space, DiamondsAndVStacks:D6/pre-adic-diamondification, DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness, [D8.12](#d8-adjunction-injectivity-criterion).

*Sources:* [GLE](#source-gle) §4.3, Convention 1, Proposition 4.16 and Proposition 4.17 with proof, pp. 30–31 — Recalls the fully faithful passage from formal schemes to pre-adic spaces and proves that separated formal schemes give prekimberlites with reduction the perfection of the reduced subscheme. [SW13](#source-sw13) §2.2, Proposition 2.2.1, p. 15 — The functor Spf A ↦ Spa(A, A) extends to a fully faithful functor on formal schemes locally admitting a finitely generated ideal of definition.

<a id="d9-formal-neighbourhood"></a>

### D9.8 Formal neighbourhoods of locally closed subsets of the reduction

**Definition (`VSheaf.formalNbhd`).** Let F be a prekimberlite and S ⊂ |F^red| a locally closed subset with its reduced perfect subscheme structure. Write underline(T) for the v-sheaf U ↦ Cont(|U|,T), as in Gleason §1.1. The formal neighbourhood is the sheaf pullback F̂_{/S} = F ×_{underline(|F^red|)} underline(S), using the natural specialization morphism to this topological sheaf. This condition concerns the entire image of each perfectoid test space; it does not identify |F̂_{/S}| with sp_F^{-1}(S) on individual points. For a map of prekimberlites G → F and T = S ×_{F^red} G^red, F̂_{/S} ×_F G = Ĝ_{/T}; F̂_{/S} is a prekimberlite with reduction S. It is open when S is open. For a formal pair (A,A), with ideal of definition I and finitely generated J ⊃ I, it is Spd(Â_J) over V(J), where Â_J is the J-adic completion.

*Proof sketch.* The pullback is taken in v-sheaves, with the topological factors underlined; a section lies in it precisely when its continuous specialization map on the entire test space lands in S. Rank-higher-than-one generizations explain why this is stronger than membership of one point in sp_F^{-1}(S). Base change: |T| = |S| ×_{|F^red|} |G^red| and naturality of sp (Gleason Proposition 4.20). Prekimberlite: formal separatedness is inherited by subsheaves; v-formalizing because formalizations specialize into S; the closed immersion S^⋄ → F̂_{/S} is checked for S closed (proper inclusion) and S open, then composed (Proposition 4.21). Completion: maps A → R⁺ whose reduction lands in V(J) send J into a topologically nilpotent ideal, hence are J-adically continuous and extend to B (Proposition 4.19).

The API:

- `VSheaf.formalNbhd` (constructor): The subsheaf F̂_{/S} for S ⊂ |F^red| locally closed.
- `VSheaf.formalNbhd_pullback` (functoriality): F̂_{/S} ×_F G = Ĝ_{/T} with T = S ×_{F^red} G^red.
- `VSheaf.formalNbhd_factor_iff` (universal-property): For a morphism G → F of prekimberlites, factorization through F̂_{/S} is equivalent to factorization of G^red → F^red through S. The restriction to prekimberlite sources is essential.
- `VSheaf.formalNbhd_prekimberlite` (structure): F̂_{/S} is a prekimberlite with (F̂_{/S})^red = S.
- `VSheaf.formalNbhd_spd_completion` (compatibility): Spd(A)^_{/V(J)} = Spd(Â_J) for formal (A, A) and finitely generated J ⊃ I.
- `VSheaf.formalNbhd_univ` (simp): F̂_{/|F^red|} = F.

**Checks.**

- `formalNbhd_origin_disc` (computation): For F = Spd(Z_p⟨T⟩) and S the origin of Spec F_p[T]^perf, F̂_{/S} = Spd(Z_p[[T]]) with the (p, T)-adic topology.
- `formalNbhd_empty` (degenerate): For S = ∅ the formal neighbourhood is empty.
- `formalNbhd_not_sp_preimage` (non-example): For a perfect k-algebra A and S = V(a₁, …, a_n) ⊂ Spec A, |S^⋄| ⊊ |Spd(A)^_{/S}| ⊊ sp^{-1}(S) in general: the middle set is where the a_i are topologically nilpotent, the last where |a_i| < 1 (AGLR Example 2.29).
- `formalNbhd_compat_formal_completion` (compatibility): For a noetherian formal scheme 𝔛 and a closed T ⊂ 𝔛_red, (𝔛^♢)^_{/T^perf} = (𝔛_{/T})^♢ for the formal completion of AdicSpacesPartII F0.

*Acceptance.* For S = |F^red| the formal neighbourhood is F.

*Uses.* Gleason Definition 4.38: tubular neighbourhoods D^⊚_{/S} = F̂_{/S} ×_F D; GLX ¶7, (3.10): the local model correspondence between tubes of integral shtuka moduli and local models; AGLR Proposition 2.39: tubes at closed points detect normality.

*Needs:* [D9.6](#d9-prekimberlite), [D9.5](#d9-specialization-map), AdicSpacesPartII:F0/formal-completion, DiamondsAndVStacks:D3/locally-profinite-torsors.

*Sources:* [GLE](#source-gle) §1.1, topological v-sheaves, p. 7; §4.3, Definition 4.18, Propositions 4.19–4.21, p. 31 — Defines the formal neighbourhood by a pullback with underlined topological-space sheaves, computes formal completions, and proves base change and the prekimberlite property. It does not identify its underlying set with the full specialization inverse image. [AGLR](#source-aglr) §2.3, Definition 2.28 and Example 2.29, p. 16 — Formal and tubular neighbourhoods of π-adic prekimberlites, with the strict inclusions |S^⋄| ⊂ |X̂_{/S}| ⊂ sp^{-1}(S).

*Planet:* Formal neighbourhood.

<a id="d9-constructible-formal-neighbourhood-open"></a>

### D9.9 Constructible formal neighbourhoods are open

**Theorem.** If F is a prekimberlite and S ⊂ |F^red| is locally closed and constructible, then F̂_{/S} → F is an open immersion. For S closed with ideal (i₁, …, i_n) locally, and a formalized test map Spd(R⁺) → F with lifts j_k ∈ R⁺, the base change is the open locus where all j_k are topologically nilpotent. It is formally adic only when S is open.

*Proof sketch.* The question is Zariski local on F^red; reduce to S closed constructible in Spec A, defined by a finitely generated ideal. Over a formalized test object, D9/formal-neighbourhood (completion case) and the analytic-localization description of the olivine spectrum (Gleason Lemma 2.24) identify the base change with ⋂ N_{j_k≪1}, an open subsheaf. Openness descends along v-covers (DiamondsAndVStacks D3/v-local-nature-of-morphism-classes).

*Acceptance.* For S the origin of the perfect affine line over F_p, Spd(F_p[[T]]) → Spd(F_p[T]) is an open immersion that is not formally adic.

*Needs:* [D9.8](#d9-formal-neighbourhood), [D7.8](#d7-olivine-comparison), DiamondsAndVStacks:D3/v-local-nature-of-morphism-classes.

*Sources:* [GLE](#source-gle) §4.3, Proposition 4.22 with proof and footnote 1 of the introduction, pp. 5, 32 — Proves that formal neighbourhoods of constructible locally closed subsets are open subsheaves, described over a formalized test object by topological nilpotence of lifts of generators, and notes they are formally adic only for open S. [AGLR](#source-aglr) §2.3, Proposition 2.30, p. 16 — Restates the openness for π-adic prekimberlites.

<a id="d9-heuer-thickening"></a>

### D9.10 Heuer's v-sheaf X^{⋄/◦} of a perfect scheme

**Construction (`PerfectScheme.heuer`).** For a scheme X over F_p, X^{⋄/◦} is the analytic sheafification of (R, R⁺) ↦ X(Spec(R⁺/R°°)) on affinoid perfectoid spaces; for affine X no sheafification is needed. It is a v-sheaf commuting with finite limits and open immersions, with a natural map X^⋄ → X^{⋄/◦}. For X perfect, (X^{⋄/◦})^red = X, and X^{⋄/◦}(Spa(R, R⁺)) = X^{⋄/◦}(Spd(R⁺)) for totally disconnected Spa(R, R⁺): maps from totally disconnected spaces formalize uniquely.

*Proof sketch.* v-sheaf property: Heuer's Lemma 5.2 (cited by Gleason Definition 4.23). Reduction: X ⊂ (X^{⋄/◦})^red is formal; for the converse test against Spd(R((t^{1/p^∞})), R[[t^{1/p^∞}]]) where Heuer's lemma computes the values as maps A → R (Gleason Proposition 4.24). Totally disconnected tests: compute on the cover of the analytic locus of Spd(R⁺[[t^{1/p^∞}]]) by U(ϖ/t), U(t/ϖ) and glue; the delicate gluing reduces to valuation rings as in D7/discrete-source-full-faithfulness.

The API:

- `PerfectScheme.heuer` (constructor): The v-sheaf X^{⋄/◦}.
- `PerfectScheme.heuer_affine` (simp): Spec(A)^{⋄/◦}(Spa(R, R⁺)) = Hom(A, R⁺/R°°).
- `PerfectScheme.heuer_red` (characterisation): (X^{⋄/◦})^red = X for X perfect.
- `PerfectScheme.heuer_preservesFiniteLimits` (functoriality): X ↦ X^{⋄/◦} preserves finite limits and open immersions.
- `PerfectScheme.diamondToHeuer` (data): The natural transformation X^⋄ → X^{⋄/◦}.
- `PerfectScheme.heuer_totallyDisconnected` (relation): For totally disconnected Spa(R, R⁺), X^{⋄/◦}(Spa(R, R⁺)) = X^{⋄/◦}(Spd(R⁺)).

**Checks.**

- `heuer_point` (computation): Spec(F_p)^{⋄/◦} is the final v-sheaf.
- `heuer_line` (computation): Spec(F_p[t])^{⋄/◦}(Spa(R, R⁺)) = R⁺/R°°, so a point t ↦ f with f topologically nilpotent maps to the origin.
- `heuer_not_separated_formally` (non-example): X^{⋄/◦} is not formally separated in general (Gleason, proof of Theorem 4.27), so it is not a prekimberlite even though its reduction is X.
- `heuer_empty` (degenerate): The empty scheme gives the empty v-sheaf.

*Acceptance.* For X = Spec F_p both X^⋄ and X^{⋄/◦} are the final v-sheaf.

*Uses.* Gleason §4.4: target of Heuer's specialization morphism SP_F; Gleason Definition 4.30: valuativity is partial properness of SP_F; Gleason Theorem 4.27: étale formal neighbourhoods F ×_{(F^red)^{⋄/◦}} V^{⋄/◦}.

*Needs:* [D7.4](#d7-perfect-scheme-v-sheaf), [D8.4](#d8-reduction-functor), [D7.11](#d7-discrete-source-full-faithfulness), DiamondsAndVStacks:D1/totally-disconnected-perfectoid-space, DiamondsAndVStacks:D2/small-pro-etale-site-and-v-site.

*Sources:* [GLE](#source-gle) §4.4, Definition 4.23 and Proposition 4.24 with proof, pp. 32–33 — Recalls Heuer's sheaf X^{⋄/◦} of maps from the reductions Spec(R⁺/R°°), proves that its reduction recovers a perfect scheme X and that it formalizes totally disconnected test objects uniquely.

<a id="d9-heuer-specialization-morphism"></a>

### D9.11 The specialization morphism SP_F : F → (F^red)^{⋄/◦}

**Construction (`VSheaf.SP`).** For a prekimberlite F, SP_F : F → (F^red)^{⋄/◦} sends a formalizable map Spa(R, R⁺) → F to the reduction Spec(R⁺_red) → F^red of its unique formalization; this defines a natural transformation, separated, and for S ⊂ |F^red| locally closed F̂_{/S} = F ×_{(F^red)^{⋄/◦}} S^{⋄/◦}. On underlying spaces it recovers sp_F.

*Proof sketch.* Well defined by D9/unique-formalization and v-descent; the formula for formal neighbourhoods by comparing the two descriptions on formalized test objects. Separatedness: F is formally separated and (F^red)^{⋄/◦} formalizes totally disconnected spaces uniquely (D9/heuer-thickening).

The API:

- `VSheaf.SP` (constructor): The natural transformation F → (F^red)^{⋄/◦}.
- `VSheaf.SP_space` (compatibility): On spaces, the composite |F| → |(F^red)^{⋄/◦}| → |F^red| is sp_F.
- `VSheaf.formalNbhd_eq_pullback_SP` (characterisation): F̂_{/S} = F ×_{(F^red)^{⋄/◦}} S^{⋄/◦}.
- `VSheaf.SP_isSeparated` (relation): SP_F is separated.
- `VSheaf.SP_natural` (functoriality): SP is natural in maps of prekimberlites.

**Checks.**

- `SP_spdZp` (computation): For F = Spd Z_p, SP_F is the map to Spec(F_p)^{⋄/◦} = \*.
- `SP_formal_disc` (computation): For F = Spd(Z_p⟨T⟩), the classical point T = a over C maps to the point T ↦ ā of Spec(F_p[T])^{⋄/◦}.
- `SP_empty` (degenerate): For F empty, SP_F is the empty map.
- `SP_not_sp` (non-example): SP_F carries more information than sp_F: its fibres are v-sheaves, e.g. the fibre of SP over the origin for Spd(Z_p⟨T⟩) is the formal neighbourhood Spd(Z_p[[T]]), not a set of points.

*Acceptance.* For F = Spd(A) formal, SP_F sends Spa(R, R⁺) with A → R⁺ to the induced A_red → R⁺/R°°.

*Uses.* Gleason Definition 4.30: valuative prekimberlites: SP_F partially proper; Gleason Theorem 4.27: étale formal neighbourhoods are base changes along SP_F; AGLR Definition 2.25: π-adic kimberlites require SP_X partially proper.

*Needs:* [D9.6](#d9-prekimberlite), [D9.10](#d9-heuer-thickening), [D9.3](#d9-unique-formalization), [D9.8](#d9-formal-neighbourhood).

*Sources:* [GLE](#source-gle) §4.4, paragraph after Proposition 4.24 and before Lemma 4.25; paragraph before Definition 4.30, pp. 33–34 — Constructs the natural transformation SP_F from reductions of formalizations, reinterprets formal neighbourhoods as base changes of S^{⋄/◦}, and notes that SP_F is separated.

<a id="d9-etale-thickening-lemma"></a>

### D9.12 Étale maps of perfect schemes give formally adic étale maps of Heuer sheaves

**Lemma.** For a quasicompact separated étale map V → X of perfect F_p-schemes, V^{⋄/◦} → X^{⋄/◦} is separated, quasicompact, formally adic and étale. On affine tests Spa(R,R⁺), use the unique completed formally étale lift of the prescribed étale algebra over the reduced integral ring. Its generic fibre, with the canonical integral subring, represents the pullback; work on affine étale charts and glue. Uniqueness is in the category of complete formal lifts, not among all ordinary étale R⁺-algebras.

*Proof sketch.* X ↦ X^{⋄/◦} commutes with finite limits and open immersions; separatedness from the open-and-closed diagonal. For formal adicness, compare V^⋄ with V^{⋄/◦} ×_{X^{⋄/◦}} X^⋄ on formalized tests. Étale-site invariance under perfection and nil ideals identifies the reduction data, and completed henselian lifting gives the formally étale lift over R⁺; here R⁺ can be nonnoetherian. On affine étale charts, take the completed lift, invert a pseudo-uniformizer, and use its canonical integral subring to obtain the étale adic pullback. Glue the charts. Finite presentation and the quasicompact separated hypothesis give quasicompactness and separatedness.

*Acceptance.* For V → X an open immersion, V^{⋄/◦} → X^{⋄/◦} is an open immersion. For the identity residue algebra, R⁺ and R⁺ × R⁺[1/ϖ] are distinct ordinary étale lifts with the same reduction. Completion removes the second factor, so uniqueness must be formulated for completed lifts.

*Needs:* [D9.10](#d9-heuer-thickening), [D8.8](#d8-formally-adic-morphism), DiamondsAndVStacks:D3/etale-and-quasi-pro-etale-morphisms-of-stacks, SchemeAndStackFoundations:SF.0.

*Sources:* [GLE](#source-gle) §4.4, Lemma 4.25 and proof, p. 33 — Proves the four geometric properties using étale lifting; the affine lifting step is used in its completed formal sense (E7), with the nonnoetherian lifting prerequisite requested from SF.0.

<a id="d9-etale-formal-neighbourhood"></a>

### D9.13 Étale formal neighbourhoods of a prekimberlite

**Definition (`VSheaf.EtaleFormalNbhd`).** For a prekimberlite F, (F)_{qc,for-ét} is the category of maps T → F with T a prekimberlite and T → F formally adic, étale and quasicompact; morphisms are maps over F (automatically quasicompact, formally adic, étale and separated). For V → F^red quasicompact, separated and étale, the étale formal neighbourhood is F̂_{/V} = F ×_{(F^red)^{⋄/◦}} V^{⋄/◦}, an object with reduction V.

*Proof sketch.* F̂_{/V} → F is quasicompact, formally adic, étale and separated by D9/etale-thickening-lemma; it is formally separated, v-formalizing (Heuer sheaves formalize totally disconnected spaces uniquely) and a prekimberlite with reduction V.

The API:

- `VSheaf.EtaleFormalNbhd` (constructor): The category (F)_{qc,for-ét}.
- `VSheaf.etaleFormalNbhdOf` (constructor): V ↦ F̂_{/V} = F ×_{(F^red)^{⋄/◦}} V^{⋄/◦}.
- `VSheaf.etaleFormalNbhdOf_red` (simp): (F̂_{/V})^red = V.
- `VSheaf.EtaleFormalNbhd.hom_separated` (relation): Morphisms in the category are quasicompact, formally adic, étale and separated.
- `VSheaf.etaleFormalNbhdOf_open` (compatibility): For V ⊂ F^red open, F̂_{/V} is the formal neighbourhood of D9/formal-neighbourhood.

**Checks.**

- `etaleFormalNbhd_identity` (degenerate): For V = F^red, F̂_{/V} = F.
- `etaleFormalNbhd_finite_etale` (computation): For F = Spd Z_p and V = Spec F_q, F̂_{/V} = Spd W(F_q), a finite étale formal neighbourhood.
- `etaleFormalNbhd_formal_scheme` (compatibility): For F = 𝔛^♢ and V étale over (𝔛_red)^perf, F̂_{/V} = 𝔜^♢ for the formal scheme 𝔜 étale over 𝔛 lifting V (Gleason Corollary 4.28).
- `etaleFormalNbhd_not_open` (non-example): A nontrivial finite étale V → F^red gives F̂_{/V} → F that is étale but not an open immersion.

*Acceptance.* For V an open subscheme, F̂_{/V} is the open formal neighbourhood.

*Uses.* Gleason Theorem 4.27: reduction identifies étale formal neighbourhoods with étale perfect schemes over F^red; Gleason Remark 4.29 and GLX ¶4 (3): a morphism of sites D_ét → (F^red)_ét and a formal nearby-cycles functor; Gleason Proposition 4.42: étale formal neighbourhoods of (smelted) kimberlites are (smelted) kimberlites.

*Needs:* [D9.6](#d9-prekimberlite), [D9.11](#d9-heuer-specialization-morphism), [D9.12](#d9-etale-thickening-lemma), [D8.8](#d8-formally-adic-morphism).

*Sources:* [GLE](#source-gle) §4.4, Definition 4.26 and Step 3 of the proof of Theorem 4.27, pp. 33–34 — Defines the category of étale formal neighbourhoods of a prekimberlite and constructs F̂_{/V} by base change along Heuer's specialization morphism.

<a id="d9-etale-formal-neighbourhoods-equivalence"></a>

### D9.14 Reduction is an equivalence on étale formal neighbourhoods

**Theorem (`VSheaf.etaleFormalNbhd_equivalence`).** For a prekimberlite F, the reduction functor gives an equivalence between (F)_{qc,for-ét} and the category of quasicompact separated étale perfect schemes over F^red, restricting to an equivalence between injective objects (open formal neighbourhoods) and quasicompact open immersions; F̂_{/V} is a quasi-inverse. If F = 𝔛^♢ for a formal scheme 𝔛, every étale formal neighbourhood is 𝔜^♢ for a formal scheme 𝔜.

*Proof sketch.* A morphism inducing an isomorphism on reductions is an isomorphism: the image is an open subsheaf containing (F^red)^⋄, hence everything, and injectivity is checked on geometric points Spa(C, C⁺) ⊂ Spd(C⁺) by counting components (Gleason Theorem 4.27, Step 1). Full faithfulness: maps over F correspond to open and closed subsheaves of the fibre product projecting isomorphically, and likewise for reductions (Step 2). Essential surjectivity: D9/etale-formal-neighbourhood (Step 3). Formal schemes: the étale site of a formal scheme is that of its reduction (AdicSpacesPartII R2/formal-etale-site-invariance).

*Acceptance.* For F = Spd Z_p, étale formal neighbourhoods correspond to finite products of finite fields over F_p, i.e. to Spd of finite products of unramified extensions W(F_q).

*Uses.* GLX ¶4 (3): formal étale site and formal nearby cycles of kimberlites.

*Needs:* [D9.13](#d9-etale-formal-neighbourhood), [D9.12](#d9-etale-thickening-lemma), [D9.3](#d9-unique-formalization), AdicSpacesPartII:R2/formal-etale-site-invariance, DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks.

*Sources:* [GLE](#source-gle) §4.4, Theorem 4.27 with Steps 1–3 and Corollary 4.28, pp. 33–34; Introduction, Theorem 7, p. 4 — Proves that reduction is an equivalence from quasicompact formally adic étale prekimberlites over F to quasicompact separated étale perfect schemes over F^red, and that for formal schemes these neighbourhoods come from formal schemes.

*Planet:* Étale formal neighbourhood equivalence.

### Dependencies of D9

Within this roadmap: D7, D8. Other roadmaps: AdicSpacesPartII:F0, AdicSpacesPartII:R2, DiamondsAndVStacks:D0, DiamondsAndVStacks:D1, DiamondsAndVStacks:D2, DiamondsAndVStacks:D3, DiamondsAndVStacks:D4, DiamondsAndVStacks:D6, PerfectoidSpaces:P1, SchemeAndStackFoundations:SF.0.

## Layer D10: Integral models from their v-sheaves

Flat normal formal schemes locally formally of finite type over `Spf O_E`, and proper flat normal schemes over `O_E`, are recovered from their v-sheaves. The proof assembles the generic fibre (seminormal rigid full faithfulness), the reduction (perfect schemes), the specialization map on classical points, de Jong's theorem on power-bounded functions and Lourenço's specialization-triple theorem, and compares closed graphs through density of the generic fibre. v-closures make precise the closure statements used for local models.

<a id="d10-two-scheme-diamond-functors"></a>

### D10.1 The two v-sheaves X^♢ and X^⋄ of an O-scheme

**Construction (`OScheme.formalToAn`).** Let O be a complete discrete valuation ring flat over Z_p with perfect residue field. For an O-algebra A, Spec(A)^♢ sends Spa(R, R⁺) to marked untilts R^♯ over O with an O-algebra map A → R^♯, and Spec(A)^⋄ to those with a map A → R^{♯+}. Both glue along localizations ({|g| ≠ 0}, resp. {|g| = 1}) to functors X ↦ X^♢, X^⋄ from O-schemes to v-sheaves over Spd O. For X locally of finite type, X^⋄ = (X̂)^♢ for the π-adic completion X̂ (a formal scheme) and X^♢ = (X^an)^♢ for Huber's analytification over Spa O. There is a natural map X^⋄ → X^♢: a monomorphism for X separated, an open immersion for X separated of finite type, an isomorphism for X proper.

*Hypotheses and conventions.* O = O_E as in the D10 conventions; X^♢ is the analytic convention of AdicCoefficientsAndComparisons L1/mixed-characteristic-scheme-diamond, X^⋄ the formal one.

*Proof sketch.* Gluing: localization A → A[1/g] gives the open loci where g is a unit of R^♯, resp. of R^{♯+}. Two-step description: the forgetful functor from discrete adic spaces over Spa O_disc to O-schemes has adjoints Spec A ↦ Spa(A, A) and Spa(A, Õ) (Õ the integral closure of O in A); base change along O_disc → O and Huber's relative analytification over Spa(O,O), requested as an extension of R1's field-base construction, gives X̂ and X^an (AGLR Lemma 2.11). Monomorphism: Spec A ⊂ Spec A⁺ is schematically dense, so maps agreeing on R^♯ agree on R^{♯+} (Stacks 01RH). Open immersion for finite type: check for affine space by hand and pull back along a closed immersion into it. Isomorphism for proper X: surjective on points by the valuative criterion of properness.

The API:

- `OScheme.diamondAn` (constructor): X ↦ X^♢ on O-schemes.
- `OScheme.diamondFormal` (constructor): X ↦ X^⋄ on O-schemes.
- `OScheme.diamondFormal_eq_completion` (characterisation): For X locally of finite type, X^⋄ = (X̂)^♢ with X̂ the π-adic completion.
- `OScheme.diamondAn_eq_analytification` (characterisation): For X locally of finite type, X^♢ = (X^an)^♢.
- `OScheme.formalToAn` (data): The natural map X^⋄ → X^♢.
- `OScheme.formalToAn_mono` (relation): It is a monomorphism for X separated.
- `OScheme.formalToAn_isOpenImmersion` (relation): It is an open immersion for X separated of finite type.
- `OScheme.formalToAn_isIso_of_proper` (relation): It is an isomorphism for X proper over O.

**Checks.**

- `twoFunctors_affineLine` (computation): For X = A¹_O, X^⋄ is the formal closed-unit-disc v-sheaf over Spd O and X^♢ is the relative adic affine line over Spa O. On the F-generic fibre they are the closed rigid disc and the rigid affine line, respectively.
- `twoFunctors_generic_algebra` (non-example): For an F-algebra A, Spec(A)^⋄ is empty. Spec(F[t])^♢ is the rigid affine line over F; it has nonalgebraic endomorphisms, for example the entire series Σ_{n≥0} π^{n²}T^n.
- `twoFunctors_completion_invariance` (characterisation): Spec(Â)^⋄ → Spec(A)^⋄ is an isomorphism for the π-adic completion Â, because R^{♯+} is π-adically complete.
- `twoFunctors_projective` (compatibility): For X = P^n_O, X^⋄ = X^♢ = (P^n)^♢.
- `twoFunctors_empty` (degenerate): The empty scheme gives the empty v-sheaf under both functors.

*Acceptance.* For X = Spec O, X^⋄ = X^♢ = Spd O.

*Uses.* KPZ §3.1.9 and Lemma 3.4.1: local models and Grassmannians are proper, so their two v-sheaves agree; AGLR §2.2: ♢ is used for G_m-actions and nearby cycles, ⋄ for specialization maps; D10/proper-scheme-full-faithfulness: reduces proper schemes to formal schemes.

*Needs:* DiamondsAndVStacks:D6/pre-adic-diamondification, AdicCoefficientsAndComparisons:L1/mixed-characteristic-scheme-diamond, AdicSpacesPartII:F0/formal-completion, SchemeAndStackFoundations:SF.0, Mathlib `AlgebraicGeometry.Scheme`, AdicSpacesPartII:R1.

*Sources:* [AGLR](#source-aglr) §2.2, Definition 2.10, Lemma 2.11 and the following two paragraphs, pp. 10–11 — Defines the two functors Spec(A)^♢ and Spec(A)^⋄, their two-step construction through π-adic completion and analytification, and proves that X^⋄ → X^♢ is a monomorphism, an open immersion for separated finite type X and an isomorphism for proper X.

<a id="d10-lfft-generic-fibre-comparison"></a>

### D10.2 Generic fibres of formal schemes locally formally of finite type

**Theorem (`FormalScheme.diamond_genericFibre`).** For 𝔛 locally formally of finite type over Spf O_E, the Huber generic fibre 𝔛^ad_η = 𝔛^ad ×_{Spa O_E} Spa(E, O_E) is the adic space r(𝔛^rig) of Berthelot's generic fibre (Conrad's 𝔛^rig), compatibly with maps, open immersions and the specialization maps; and 𝔛^♢ ×_{Spd O_E} Spd E = (𝔛^ad_η)^♢ = r(𝔛^rig)^♢, a locally spatial diamond.

*Hypotheses and conventions.* E/Q_p is a complete discretely valued field with ring of integers O_E, uniformizer π and perfect residue field k; a formal scheme locally formally of finite type over Spf O_E is an object of Conrad's category FS_{O_E} (AdicSpacesPartII R2/berthelot-type-rig-functor-nonnoetherian-base): locally noetherian, with a continuous structure map to Spf O_E and 𝔛_red locally of finite type over k; affine charts are quotients of O_E[[q_1,…,q_n]]⟨T_1,…,T_m⟩ with the (π,q_1,…,q_n)-adic topology. The structure map need not be adic.

*Proof sketch.* On affine charts Spf A, 𝔛^ad_η(R, R⁺) for complete affinoid (E, O_E)-algebras is the sheafification of colim over open bounded R₀ ⊂ R⁺ of 𝔛(R₀) (Scholze–Weinstein 2013 Proposition 2.2.2), which is the functor represented by Berthelot's 𝔛^rig (de Jong Proposition 7.1.7, Conrad Theorem 3.1.5 as recorded in AdicSpacesPartII). Both constructions glue along open formal subschemes, giving the identification and its naturality. ♢ commutes with fibre products of pre-adic spaces (Gleason Proposition 1.21(4)); the diamond of an analytic adic space is locally spatial (DiamondsAndVStacks D6.5).

*Acceptance.* For 𝔛 = Spf O_E[[q]] the generic fibre is the open unit disc over E, and 𝔛^♢_η its diamond. For 𝔛 = Spf O_E⟨T⟩ the generic fibre is the closed unit disc. Non-example: the analytic locus of Spa(O_E[[q]]) is strictly larger than the generic fibre (it contains points with π = 0, q ≠ 0); the comparison is with 𝔛^ad_η, not with 𝔛^ad_a.

*Needs:* AdicSpacesPartII:R2/berthelot-type-rig-functor-nonnoetherian-base, AdicSpacesPartII:R2/noetherian-formal-scheme-as-adic-space, AdicSpacesPartII:R1/rigid-adic-comparison-functor, DiamondsAndVStacks:D6/etale-site-comparison, DiamondsAndVStacks:D6/pre-adic-diamondification.

*Sources:* [SW13](#source-sw13) §2.2, Proposition 2.2.2, p. 16 — Describes the generic fibre of a formal scheme with locally finitely generated ideal of definition as the sheafified functor of points through open bounded subrings. [DJ95](#source-dj95) §7.1, Proposition 7.1.7, p. 77 (journal pagination) — The universal property of Berthelot's generic fibre for formal schemes in FS_O: maps from an affinoid to 𝔛^rig are maps from models. [SW20](#source-sw20) Lecture 18, §18.4, proof of Proposition 18.4.1, p. 167 — Uses Y_η = Y ×_{Spd O_E} Spd E and identifies it with the diamond of the rigid generic fibre.

<a id="d10-generic-fibre-of-normal-is-normal"></a>

### D10.3 Generic fibres of normal formal schemes are normal

**Lemma.** If 𝔛 is locally formally of finite type over Spf O_E and (formally) normal, i.e. covered by Spf A with A normal, then its Berthelot generic fibre 𝔛^rig is a normal rigid space; in particular it is seminormal, so DiamondsAndVStacks D6.9 applies to it.

*Hypotheses and conventions.* E/Q_p is a complete discretely valued field with ring of integers O_E, uniformizer π and perfect residue field k; a formal scheme locally formally of finite type over Spf O_E is an object of Conrad's category FS_{O_E} (AdicSpacesPartII R2/berthelot-type-rig-functor-nonnoetherian-base): locally noetherian, with a continuous structure map to Spf O_E and 𝔛_red locally of finite type over k; affine charts are quotients of O_E[[q_1,…,q_n]]⟨T_1,…,T_m⟩ with the (π,q_1,…,q_n)-adic topology. The structure map need not be adic.

*Proof sketch.* The rings A are excellent, so normality of A is normality of all complete local rings; the affinoid algebras of 𝔛^rig are built from A by Berthelot's construction and inherit normality (de Jong Lemma 7.1.9, Proposition 7.2.4(c)). Normal rings are seminormal (square–cube criterion), and normality of affinoid algebras gives seminormality of the rigid space.

*Acceptance.* For 𝔛 = Spf O_E[[q]], 𝔛^rig is the open disc, normal. Non-example: the formal completion of the cusp y² = x³ over O_E is not normal, and its generic fibre is not seminormal.

*Needs:* AdicSpacesPartII:R2/berthelot-type-rig-functor-nonnoetherian-base, AdicSpacesPartII:R2/berthelot-rig-functor-preserves-properties, Mathlib `IsIntegrallyClosed`.

*Sources:* [DJ95](#source-dj95) §7.2, Proposition 7.2.4(c) and its proof, p. 84 (journal pagination) — If a formal scheme in FS is formally reduced, respectively normal, its rigid generic fibre is reduced, respectively normal.

<a id="d10-power-bounded-functions-theorem"></a>

### D10.4 de Jong's theorem: functions on a normal formal scheme are the power-bounded functions on its generic fibre

**Theorem (`FormalScheme.global_eq_powerBounded`).** Let 𝔛 be a flat and (formally) normal formal scheme locally formally of finite type over Spf O_E. Then restriction Γ(𝔛, O_𝔛) → Γ(𝔛^rig, O°) to power-bounded (equivalently, locally power-bounded) rigid functions on the generic fibre is an isomorphism of rings.

*Hypotheses and conventions.* E/Q_p is a complete discretely valued field with ring of integers O_E, uniformizer π and perfect residue field k; a formal scheme locally formally of finite type over Spf O_E is an object of Conrad's category FS_{O_E} (AdicSpacesPartII R2/berthelot-type-rig-functor-nonnoetherian-base): locally noetherian, with a continuous structure map to Spf O_E and 𝔛_red locally of finite type over k; affine charts are quotients of O_E[[q_1,…,q_n]]⟨T_1,…,T_m⟩ with the (π,q_1,…,q_n)-adic topology. The structure map need not be adic. Flatness over O_E is necessary: the generic fibre of a π-torsion formal scheme forgets the torsion.

*Proof sketch.* de Jong's proof: on Spf A, a power-bounded f restricts on each Berthelot affinoid Sp(C_n) to an element integral over the corresponding model; at each maximal ideal of A the completion is normal and the local result on Spf(Â_m) (7.3.6) puts f in A_m-completions; faithful flatness gives f in each B_n, and passing to the limit gives f ∈ A. Lourenço's alternative: extend a locally power-bounded function from the generic fibre to the analytic locus by the First Riemann Hebbarkeitssatz for normal pseudorigid spaces, then to the whole formal scheme by his Proposition 6.2 (normal excellent nowhere discrete formal schemes: O(𝔛) = O⁺(𝔛_a)), proved with normalized blow-ups, Zariski's main theorem and the theorem on formal functions.

*Acceptance.* For 𝔛 = Spf O_E[[q]], the bounded functions on the open unit disc are O_E[[q]]. For 𝔛 = Spf O_E⟨T⟩ the power-bounded functions on the closed disc are O_E⟨T⟩. Non-example (normality): for A = O_E⟨X, Y⟩/(Y² − π²X), flat but not normal, the function Y/π is power-bounded on the generic fibre, since (Y/π)² = X, but does not lie in A.

*Uses.* Lourenço Corollary 6.6 / SW20 Theorem 18.4.2: constructs and recovers the map of formal schemes from the map of generic fibres.

*Needs:* [D10.2](#d10-lfft-generic-fibre-comparison), [D10.3](#d10-generic-fibre-of-normal-is-normal), AdicSpacesPartII:R2/berthelot-type-rig-functor-nonnoetherian-base, AdicSpacesPartII:F0/theorem-on-formal-functions, AdicSpacesPartII:R0/affinoid-jacobson, SchemeAndStackFoundations:SF.0.

*Sources:* [DJ95](#source-dj95) §7.4, Theorem 7.4.1 and proof, pp. 90–91; Remark 7.4.2, p. 91 (journal pagination) — For a flat formally normal formal scheme in FS_O, global functions are the power-bounded rigid functions on the generic fibre; the remark gives the weaker integrality hypothesis under which the statement holds. [LOU17](#source-lou17) §6, Proposition 6.2, Corollary 6.3 and proofs, pp. 16–17 — Proves the extension from the analytic locus for normal excellent nowhere-discrete formal schemes and recovers de Jong's theorem using the First Riemann Hebbarkeitssatz for pseudorigid spaces. [SW20](#source-sw20) Lecture 18, Remark 18.4.3, p. 167 — Explains that the structure sheaf is recovered because R is the ring of power-bounded functions on (Spf R)_η.

*Planet:* de Jong's theorem on power-bounded functions.

<a id="d10-classical-specialization-compatibility"></a>

### D10.5 The specialization map of 𝔛^♢ restricts to Berthelot's on classical points

**Theorem.** For 𝔛 separated and locally formally of finite type over Spf O_E with k algebraically closed, the specialization map sp of the prekimberlite 𝔛^♢ (D9/specialization-map), restricted to the image of the classical points |𝔛^rig|_cl in |𝔛^♢_η| = |𝔛^ad_η|, is Berthelot's specialization map sp : |𝔛^rig|_cl → 𝔛_red(k), composed with the bijection 𝔛_red(k) = (𝔛_red)^perf(k). Equivalently, the closure of a classical point x in |𝔛^♢| meets |((𝔛_red)^perf)^⋄| in exactly one point, the image of the point of Spec(k)^⋄ under the k-point sp(x).

*Hypotheses and conventions.* E/Q_p is a complete discretely valued field with ring of integers O_E, uniformizer π and perfect residue field k; a formal scheme locally formally of finite type over Spf O_E is an object of Conrad's category FS_{O_E} (AdicSpacesPartII R2/berthelot-type-rig-functor-nonnoetherian-base): locally noetherian, with a continuous structure map to Spf O_E and 𝔛_red locally of finite type over k; affine charts are quotients of O_E[[q_1,…,q_n]]⟨T_1,…,T_m⟩ with the (π,q_1,…,q_n)-adic topology. The structure map need not be adic.

*Proof sketch.* A classical point x is given by Spf O' → 𝔛 for a finite extension O' of O_E (de Jong 7.1.10); it formalizes to Spd(O_{C'}) → 𝔛^♢, and the reduction of the formalization is the k-point sp(x). Closure: in |Spd(O_{C'})| the generic point specializes to the special point; conversely the closure of x meets the special fibre only in points over sp(x) because the specialization map is continuous and the special fibre of the closure of a classical point is a point (Gleason Remark 4.13, D9/specialization-map). Agreement of the formal-scheme and v-sheaf triples: GLX ¶6, diagram (3.4).

*Acceptance.* For 𝔛 = Spf O_E⟨T⟩ and the classical point T = a with |a| ≤ 1, sp(x) is the point T = ā of A¹_k.

*Needs:* [D9.5](#d9-specialization-map), [D9.7](#d9-formal-scheme-prekimberlite), [D10.2](#d10-lfft-generic-fibre-comparison), AdicSpacesPartII:R2/specialisation-map, AdicSpacesPartII:R2/berthelot-type-rig-functor-nonnoetherian-base.

*Sources:* [DJ95](#source-dj95) §7.1, 7.1.10, p. 80 (journal pagination) — Describes points of 𝔛^rig by finite DVR extensions Spf O' → 𝔛 and the specialization map sending such a point to the image of the closed point. [GLX](#source-glx) §3.1, ¶6 and diagram (3.4), p. 18 — States that for X = 𝔛^♢ the specialization triple of the kimberlite agrees with that of the formal scheme. [SW20](#source-sw20) Lecture 18, proof of Proposition 18.4.1, p. 167 — Recovers sp from the closure of classical points in |Y|.

<a id="d10-maximal-diamond-open"></a>

### D10.6 The analytic locus of 𝔛^♢ is its maximal diamond open subsheaf

**Theorem.** For a separated locally noetherian formal scheme 𝔛 over Spf Z_p, the analytic locus (𝔛^♢)^an = (𝔛^ad_a)^♢ is the largest open sub-v-sheaf of 𝔛^♢ that is a diamond, and its closed complement is ((𝔛_red)^perf)^⋄. Hence for any map ψ : 𝔛^♢ → 𝔜^♢, ψ maps ((𝔛_red)^perf)^⋄ into ((𝔜_red)^perf)^⋄, and ψ^red is a map (𝔛_red)^perf → (𝔜_red)^perf.

*Proof sketch.* The analytic locus is a locally spatial diamond (DiamondsAndVStacks D6.5) and open; its complement is the reduction counit (D9/formal-scheme-prekimberlite). Conversely, if an open U that is a diamond met the special fibre, it would contain Spec(k)^⋄ = \* for a perfect field k (the closed immersion of a point of 𝔛_red); sub-v-sheaves of diamonds are diamonds (DiamondsAndVStacks D4) while \* is not (DiamondsAndVStacks D6.6, check special_point_not_diamond). Hence U ⊂ (𝔛^♢)^an; for quasiseparated U this is also D8/quasiseparated-diamonds-have-empty-reduction. Functoriality of (−)^red applied to ψ gives ψ^red, and the counit squares commute.

*Acceptance.* For 𝔛 = Spf Z_p the analytic locus is Spd Q_p and its complement Spd F_p.

*Needs:* [D9.7](#d9-formal-scheme-prekimberlite), [D8.7](#d8-quasiseparated-diamonds-have-empty-reduction), [D8.4](#d8-reduction-functor), DiamondsAndVStacks:D6/etale-site-comparison, DiamondsAndVStacks:D5/spatial-diamond, DiamondsAndVStacks:D4/diamonds-are-v-sheaves, DiamondsAndVStacks:D6/pre-adic-diamondification.

*Sources:* [SW20](#source-sw20) Lecture 18, proof of Proposition 18.4.1, p. 167 — Uses that there is a maximal open subfunctor of Y that is a diamond, given by the analytic locus, with complement (𝔛_red^perf)^⋄. [GLE](#source-gle) §3.2, Proposition 3.19, p. 25; §4.3, Proposition 4.17, p. 30 — Quasiseparated diamonds have empty reduction; formal schemes give prekimberlites with analytic locus the complement of the reduction.

<a id="d10-generic-fibre-density"></a>

### D10.7 The generic fibre is dense in the v-sheaf of a flat formal scheme

**Theorem.** If 𝔛 is flat and locally formally of finite type over Spf O_E, then |𝔛^♢_η| is a dense open subset of |𝔛^♢|. In particular this holds for π-adically complete flat O_E-algebras B topologically of finite type, where the generic fibre Spd(B[1/π], B') (B' the integral closure of B in B[1/π]) is dense open in Spd(B).

*Hypotheses and conventions.* E/Q_p is a complete discretely valued field with ring of integers O_E, uniformizer π and perfect residue field k; a formal scheme locally formally of finite type over Spf O_E is an object of Conrad's category FS_{O_E} (AdicSpacesPartII R2/berthelot-type-rig-functor-nonnoetherian-base): locally noetherian, with a continuous structure map to Spf O_E and 𝔛_red locally of finite type over k; affine charts are quotients of O_E[[q_1,…,q_n]]⟨T_1,…,T_m⟩ with the (π,q_1,…,q_n)-adic topology. The structure map need not be adic.

*Proof sketch.* Reduce to 𝔛 = Spf B. Let Y ⊂ Spa(B[[t]]) be the punctured open unit ball {|t| ≠ 0} over Spa B; Y^♢ → Spd(B) is a v-cover and Y is analytic, so |Y| = |Y^♢| (DiamondsAndVStacks D6.5). A nonempty rational subset Spa(R, R⁺) ⊂ Y has R flat over O_E (rational localizations of noetherian-type pairs are flat) and is a pseudorigid space, hence R is Jacobson (Lourenço Propositions 3.3, 4.6). π is not nilpotent in R, so a maximal ideal m ∌ π exists; Huber's Lemma 1.4 gives a point with support m, which lies in the generic fibre.

*Acceptance.* For 𝔛 = Spf O_E, |Spd O_E| has two points and the generic point is dense. Non-example: for 𝔛 = Spf(O_E[[q]]/(π)), not flat, the generic fibre is empty. Non-example: for a higher-rank valuation ring V ⊃ O_E⟨t⟩ with the π-adic topology, Spd(V) is flat but the open N_{t≪1} misses the generic fibre, so density fails outside the noetherian setting (AGLR footnote 2).

*Needs:* [D10.2](#d10-lfft-generic-fibre-comparison), DiamondsAndVStacks:D6/etale-site-comparison, DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks, AdicSpacesPartII:R0/affinoid-jacobson, AdicSpacesPartII:R0.

*Sources:* [AGLR](#source-aglr) §2.2, Lemma 2.17 and proof, p. 13 — Proves that the generic fibre of Spd(B) is dense open for B π-adically complete, flat and topologically of finite type, via the punctured open ball cover and the Jacobson property of pseudorigid rings. [LOU17](#source-lou17) §3–4, Propositions 3.3 and 4.6, pp. 6 and 9 — Proposition 3.3 gives the Jacobson property for Jacobson–Tate rings; Proposition 4.6 places pseudoaffinoid O_K-algebras in that class and supplies excellent rings of definition. [SW20](#source-sw20) Lecture 18, end of proof of Proposition 18.4.1, p. 168 — Uses density of |X^♢_η| in |X^♢| to compare two closed graphs.

<a id="d10-closed-immersion-criterion"></a>

### D10.8 Closed immersions of small v-stacks and proper monomorphisms

**Theorem (`VSheaf.isClosedImmersion_iff`).** A morphism Y → X of small v-stacks is a closed immersion if and only if it is a quasicompact monomorphism and |Y| → |X| is a closed embedding. Consequently every proper monomorphism of small v-sheaves is a closed immersion.

*Hypotheses and conventions.* Proper maps of v-stacks are those of DiamondEtaleCohomology C4: separated, quasicompact and universally closed.

*Proof sketch.* Closed immersions are quasicompact monomorphisms with closed image: base change to a v-cover by totally disconnected spaces, where closed immersions are representable, and use that |S| → |X| is a quotient map. Conversely, after base change to a totally disconnected S a quasicompact monomorphism is a pro-constructible generalizing subset with the subspace topology (ECD Corollary 10.6, Lemma 7.6), closed by hypothesis, hence a closed immersion. Proper monomorphism: proper gives quasicompact and |Y| → |X| closed (DiamondEtaleCohomology C4/proper-image-closed); a monomorphism is injective on points, so |Y| → |X| is a closed embedding.

*Acceptance.* The inclusion of the closed point Spd F_p → Spd Z_p is a closed immersion. Non-example: for a perfectoid field C with C⁺ ⊊ O_C of rank two, the closed point of |Spa(C, C⁺)| is a closed subset that is not weakly generalizing, and no closed immersion has it as image.

*Uses.* KPZ Lemma 3.4.1: M^v_{G,μ} → Gr_{GL(Λ)} is a closed immersion because it is a proper monomorphism.

*Needs:* DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness, DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces, DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks, DiamondEtaleCohomology:C4/proper-map, DiamondEtaleCohomology:C4/proper-image-closed.

*Sources:* [AGLR](#source-aglr) §2.1, Lemma 2.1 and proof, p. 8 — Characterizes closed immersions of small v-stacks as quasicompact monomorphisms inducing closed embeddings of underlying spaces. [KPZ](#source-kpz) Proof of Lemma 3.4.1, arXiv v3 p. 29 (published p. 28) — Uses, without reference, that the proper monomorphism from the v-sheaf local model into a Beilinson–Drinfeld Grassmannian is a closed immersion; see sourceIssue KPZ/E34.

<a id="d10-v-closure"></a>

### D10.9 The v-closure of a sub-v-sheaf

**Construction (`VSheaf.vClosure`).** For a small v-stack X and a sub-v-stack Y ⊂ X (a monomorphism), the v-closure Y^cl is the intersection of all closed sub-v-stacks of X containing Y; it is a small closed sub-v-stack. A subset S ⊂ |X| is weakly generalizing if for every Spa(C, C⁺) → X, |Spa(C, C⁺)| maps into S iff its closed point does; images of maps of small v-stacks are weakly generalizing; S ↦ S ×_{|X|} X is a bijection between closed weakly generalizing subsets and closed sub-v-stacks, with |S ×_{|X|} X| = S; and Y^cl = |Y|^wgc ×_{|X|} X, where |Y|^wgc is the smallest closed weakly generalizing subset containing |Y|. v-closures commute with base change along open partially proper maps.

*Proof sketch.* Closedness and smallness: check after base change to totally disconnected spaces (ECD Proposition 6.4) and use that subsheaves of small sheaves are small. Images: a map Spa(C, C⁺) → X sending the closed point into the image factors after enlarging (C, C⁺) (ECD Proposition 12.7). Bijection: for S closed weakly generalizing its preimage in a totally disconnected cover is closed and generalizing, hence an affinoid perfectoid subset; conversely closed sub-v-stacks have weakly generalizing image and equal S ×_{|X|} X by surjectivity on points (AGLR Lemma 2.7). Formula for Y^cl: Proposition 2.8; base change: Corollary 2.9 via the valuative criterion for partially proper maps.

The API:

- `VSheaf.vClosure` (constructor): The closed sub-v-stack Y^cl of X.
- `VSheaf.vClosure_isClosedImmersion` (structure): Y^cl → X is a closed immersion and Y ⊂ Y^cl.
- `VSheaf.vClosure_minimal` (universal-property): Y^cl is contained in every closed sub-v-stack containing Y.
- `VSheaf.IsWeaklyGeneralizing` (data): The weakly generalizing predicate on subsets of |X|.
- `VSheaf.isWeaklyGeneralizing_range` (relation): Images of maps of small v-stacks are weakly generalizing.
- `VSheaf.closedSubsheafEquiv` (equivalence): Closed sub-v-stacks of X ≃ closed weakly generalizing subsets of |X|, S ↦ S ×_{|X|} X.
- `VSheaf.vClosure_space` (characterisation): |Y^cl| = |Y|^wgc.
- `VSheaf.vClosure_baseChange` (functoriality): For Z → X open and partially proper, (Y ×_X Z)^cl = Y^cl ×_X Z.

**Checks.**

- `vClosure_open_disc` (computation): For the open unit disc D ⊂ B the closed disc over a perfectoid field C, |D|^cl misses the Gauss point but contains a rank-two specialization of it, so it is not weakly generalizing; the v-closure of D is the complement of all open residue discs centred on the torus (AGLR Example 2.5).
- `vClosure_closed` (degenerate): For Y closed, Y^cl = Y; for Y empty, Y^cl is empty.
- `vClosure_not_topological_closure` (non-example): In general |Y^cl| ≠ closure of |Y|: for D ⊂ B as above the topological closure is not the space of a closed subsheaf.
- `vClosure_rank_two_point` (non-example): For a perfectoid field C with C⁺ ⊊ O_C of rank > 1, S = {closed point} is closed but not weakly generalizing and S ×_{|X|} X is empty.
- `vClosure_generic_fibre_of_flat` (compatibility): For B flat topologically of finite type over O_E, the v-closure of Spd(B[1/π], B') in Spd(B) is Spd(B), by D10/generic-fibre-density.

*Acceptance.* If Y ⊂ X is already closed then Y^cl = Y.

*Uses.* SW20 Definition 21.4.1 / AGLR Definition 4.11: v-sheaf local models are v-closures of Schubert diamonds in Beilinson–Drinfeld Grassmannians; KPZ Lemma 3.4.1: the v-sheaf of a flat closure is the v-closure of the generic fibre; GLX §3.2: local models M_{K_p,μ} as v-closures.

*Needs:* [D10.8](#d10-closed-immersion-criterion), DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks, DiamondsAndVStacks:D3/sub-v-sheaves-of-totally-disconnected-spaces, DiamondEtaleCohomology:C4/partially-proper-map.

*Sources:* [AGLR](#source-aglr) §2.1, Definitions 2.2 and 2.3, Lemma 2.4, Example 2.5, Lemma 2.7, Proposition 2.8 and Corollary 2.9, pp. 9–10 — Defines the v-closure and weakly generalizing subsets, proves that images are weakly generalizing, the bijection between closed sub-v-stacks and closed weakly generalizing subsets, the formula for the v-closure and its compatibility with open partially proper base change. [GLE](#source-gle) §1.1, Proposition 1.9, p. 8 — Records the same bijection between weakly generalizing closed subsets and closed subsheaves.

*Planet:* v-closure of a sub-v-sheaf.

<a id="d10-specialization-triple-full-faithfulness"></a>

### D10.10 Formal schemes are determined by their specialization triples (Lourenço)

**Theorem (`FormalScheme.specializationTriple_fullyFaithful`).** Assume k is algebraically closed. Let C_{O_E} be the category of triples (X_η, X_s, sp) with X_η a rigid space over E, X_s a perfect scheme over k and sp : |X_η|_cl → X_s(k) a map of sets on classical points. The functor 𝔛 ↦ (𝔛^rig, (𝔛_red)^perf, sp_𝔛) from flat normal formal schemes locally formally of finite type over Spf O_E to C_{O_E} is fully faithful.

*Hypotheses and conventions.* E/Q_p is a complete discretely valued field with ring of integers O_E, uniformizer π and perfect residue field k; a formal scheme locally formally of finite type over Spf O_E is an object of Conrad's category FS_{O_E} (AdicSpacesPartII R2/berthelot-type-rig-functor-nonnoetherian-base): locally noetherian, with a continuous structure map to Spf O_E and 𝔛_red locally of finite type over k; affine charts are quotients of O_E[[q_1,…,q_n]]⟨T_1,…,T_m⟩ with the (π,q_1,…,q_n)-adic topology. The structure map need not be adic. k is algebraically closed. Morphisms of formal schemes are continuous over Spf O_E and need not be adic.

*Proof sketch.* Faithfulness: two maps with the same triple agree topologically (|𝔛| = |𝔛_red^perf|), reduce to affines Spf B → Spf A, and agree on A by D10/power-bounded-functions-theorem since A ⊂ O(𝔛^rig). In the affine fullness step, pullback of bounded analytic functions and D10/power-bounded-functions-theorem give a ring homomorphism A → B. Continuity must still be proved before this defines a morphism of formal schemes. Let I and J be finitely generated ideals of definition in A and B. For each generator a of I, specialization compatibility and the existence of generic-fibre points above every closed point of the reduction imply that its image in B vanishes at all such closed points. The reduced special fibre is locally of finite type over algebraically closed k, so the image lies in √J. Finite generation gives an N with I^N mapping into J, and then I^{Nn} maps into J^n. This proves continuity, including for (π,q)-adic topologies. The induced reduction morphism agrees with ψ_s on all k-points, hence on the reduced perfect schemes. Globalization: the preimage under ψ_s of an affine reduction is covered by affine reductions, and the compatibility with sp identifies the corresponding generic fibres (Lourenço Corollaries 6.5–6.6).

*Acceptance.* The triple of Spf O_E⟨T⟩ is (closed disc, A¹_k^perf, reduction of coordinates). Normality is needed for the affine step: for A = O_E⟨X, Y⟩/(Y² − π²X), Y/π is a power-bounded function on the generic fibre outside A, so maps of generic fibres need not come from maps of formal schemes.

*Needs:* [D10.4](#d10-power-bounded-functions-theorem), [D10.5](#d10-classical-specialization-compatibility), [D10.2](#d10-lfft-generic-fibre-comparison), AdicSpacesPartII:R2/specialisation-map, AdicSpacesPartII:F0/locally-noetherian-formal-scheme.

*Sources:* [SW20](#source-sw20) Lecture 18, §18.4, Theorem 18.4.2 and Remark 18.4.3, p. 167 — States full faithfulness of the specialization-triple functor on flat normal formal schemes locally formally of finite type over O_E with algebraically closed residue field, attributing it to Lourenço. [LOU17](#source-lou17) §6, Definition 6.4, Corollaries 6.5 and 6.6 with proofs, pp. 17–18 — Proves the analogous statement for the analytic locus and deduces the generic-fibre version from de Jong's theorem.

*Planet:* Specialization-triple theorem.

<a id="d10-formal-full-faithfulness"></a>

### D10.11 Scholze–Weinstein: flat normal formal schemes are determined by their v-sheaves

**Theorem (`FormalScheme.diamond_fullyFaithful`).** The functor 𝔛 ↦ 𝔛^♢ from flat normal formal schemes locally formally of finite type over Spf O_E to small v-sheaves over Spd O_E is fully faithful.

*Hypotheses and conventions.* E/Q_p is a complete discretely valued field with ring of integers O_E, uniformizer π and perfect residue field k; a formal scheme locally formally of finite type over Spf O_E is an object of Conrad's category FS_{O_E} (AdicSpacesPartII R2/berthelot-type-rig-functor-nonnoetherian-base): locally noetherian, with a continuous structure map to Spf O_E and 𝔛_red locally of finite type over k; affine charts are quotients of O_E[[q_1,…,q_n]]⟨T_1,…,T_m⟩ with the (π,q_1,…,q_n)-adic topology. The structure map need not be adic. Morphisms of v-sheaves are over Spd O_E. No separatedness is assumed: the comparison of graphs is made over affine opens of the target.

*Proof sketch.* Reduce to k algebraically closed: base change to the completed maximal unramified extension and Galois descent for maps of formal schemes and of v-sheaves (DiamondsAndVStacks D6.7 for the integral Galois quotient). From ψ : 𝔛^♢ → 𝔜^♢ build a map of triples: on generic fibres via D10/lfft-generic-fibre-comparison and DiamondsAndVStacks D6.9 (the generic fibres are normal, D10/generic-fibre-of-normal-is-normal); on reductions via D10/maximal-diamond-open and D7/perfect-scheme-full-faithfulness; compatibility with sp via D10/classical-specialization-compatibility. D10/specialization-triple-full-faithfulness gives faithfulness and a map f : 𝔛 → 𝔜 with f_η = ψ_η. Localize on 𝔜: for an affine open V ⊂ 𝔜, V^♢ is the open formal neighbourhood of V_red (D9/formal-neighbourhood), so ψ^{-1}(V^♢) = (f^{-1}V)^♢ by compatibility of ψ^red = f_red^perf with specialization; hence assume 𝔜 affine, in particular separated. ψ = f^♢: the graphs Γ_ψ, Γ_{f^♢} : 𝔛^♢ → (𝔛 ×_{Spf O_E} 𝔜)^♢ are then closed immersions, so it suffices that their closed images agree (D10/v-closure); they agree on the generic fibre, which is dense in |𝔛^♢| (D10/generic-fibre-density).

*Acceptance.* For 𝔛 = 𝔜 = Spf O_E[[q]], endomorphisms of 𝔛^♢ over Spd O_E are the continuous O_E-algebra endomorphisms of O_E[[q]], q ↦ g with g ∈ (π, q). Non-example (normality): the normalization Spf O_E⟨t⟩ → Spf O_E⟨x, y⟩/(y² − x³), x = t², y = t³, induces an isomorphism of v-sheaves (D10/awn-full-faithfulness (1); D7/universal-homeomorphism-invariance on the generic fibre) but is not an isomorphism of formal schemes. Non-example (flatness and reducedness): the closed immersion Spf k → Spf(k[[q]]/(q²)) over Spf O_E induces an isomorphism of v-sheaves, both being Spd k = \*, but is not an isomorphism.

*Uses.* KPZ §3.1.9, Lemma 3.4.1, §7.1.8: constructs ρ_\* : M^loc_{G,μ} → Gr(d, Λ)_{O_E} and proves uniqueness of local models; SW20 Lecture 21–25: uniqueness of local models and of integral models of local Shimura varieties.

*Needs:* [D10.10](#d10-specialization-triple-full-faithfulness), [D10.6](#d10-maximal-diamond-open), [D10.7](#d10-generic-fibre-density), [D10.3](#d10-generic-fibre-of-normal-is-normal), [D10.8](#d10-closed-immersion-criterion), [D10.9](#d10-v-closure), [D9.8](#d9-formal-neighbourhood), [D7.6](#d7-perfect-scheme-full-faithfulness), DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness, DiamondsAndVStacks:D6/integral-galois-quotient, DiamondsAndVStacks:D3/immersions-separatedness-and-truncatedness.

*Sources:* [SW20](#source-sw20) Lecture 18, §18.4, Proposition 18.4.1 and proof, pp. 167–168 — Proves full faithfulness of 𝔛 ↦ 𝔛^♢ on flat normal formal schemes locally formally of finite type over Spf O_E by recovering the specialization triple and comparing closed graphs through density of the generic fibre. [KPZ](#source-kpz) §3.1.9, p. 19; Lemma 3.4.1, arXiv v3 p. 29 — Applies the result to proper flat normal O_E-schemes (local models and Grassmannians) to obtain the morphism ρ_\* and its uniqueness.

*Planet:* Scholze–Weinstein full faithfulness.

<a id="d10-proper-scheme-full-faithfulness"></a>

### D10.12 Proper flat normal schemes over O_E are determined by their v-sheaves

**Theorem (`OScheme.diamond_fullyFaithful_of_proper`).** On the category of proper flat normal O_E-schemes, X ↦ X^♢ (= X^⋄) is fully faithful into small v-sheaves over Spd O_E.

*Hypotheses and conventions.* E/Q_p is a complete discretely valued field with ring of integers O_E, uniformizer π and perfect residue field k; a formal scheme locally formally of finite type over Spf O_E is an object of Conrad's category FS_{O_E} (AdicSpacesPartII R2/berthelot-type-rig-functor-nonnoetherian-base): locally noetherian, with a continuous structure map to Spf O_E and 𝔛_red locally of finite type over k; affine charts are quotients of O_E[[q_1,…,q_n]]⟨T_1,…,T_m⟩ with the (π,q_1,…,q_n)-adic topology. The structure map need not be adic.

*Proof sketch.* For proper X, X^♢ = X^⋄ = (X̂)^♢ with X̂ the π-adic completion (D10/two-scheme-diamond-functors). X̂ is flat, locally formally of finite type (even topologically of finite type) and normal: completion of an excellent normal ring along an ideal is normal (regular maps preserve normality; SchemeAndStackFoundations §0.21). D10/formal-full-faithfulness identifies maps of v-sheaves with maps X̂ → Ŷ. The formal-morphism full-faithfulness theorem of F0 then identifies these with maps X → Y between the already algebraic proper schemes; no algebraization of an arbitrary proper formal scheme is required.

*Acceptance.* For X = Y = P^n_{O_E} the endomorphisms of (P^n)^♢ over Spd O_E are the endomorphisms of P^n over O_E. Non-example: the projective cuspidal cubic X ⊂ P²_{O_E} and its normalization P¹_{O_E} → X have isomorphic v-sheaves (AGLR Proposition 2.18(1): the normalization is the absolute weak normalization) although X is not isomorphic to P¹_{O_E}; normality cannot be dropped.

*Needs:* [D10.11](#d10-formal-full-faithfulness), [D10.1](#d10-two-scheme-diamond-functors), AdicSpacesPartII:F0/formal-morphism-full-faithfulness, SchemeAndStackFoundations:SF.0.

*Sources:* [KPZ](#source-kpz) §3.1.9, p. 19 — Uses Scholze–Weinstein's full faithfulness for proper flat normal O_E-schemes such as local models and Grassmannians. [AGLR](#source-aglr) §2.2, the discussion after (2.12) and Proposition 2.18(2), p. 13 — Explains the reduction of proper schemes to their π-adic completions by Grothendieck's existence theorem and proves the analogous statement for absolutely weakly normal proper flat schemes.

<a id="d10-awn-full-faithfulness"></a>

### D10.13 Full faithfulness on absolutely weakly normal formal and proper schemes

**Theorem (`FormalScheme.diamond_fullyFaithful_of_awn`).** (1) For an affine formal scheme Spf A over O_E with finitely generated ideal of definition I, and B the I-adic completion of the absolute weak normalization of A, Spf(B)^♢ → Spf(A)^♢ is an isomorphism. (2) The functor 𝔛 ↦ 𝔛^♢ from absolutely weakly normal formal schemes flat, separated and topologically of finite type over O_E to v-sheaves over Spd O_E is fully faithful. (3) For a proper flat O_E-scheme X, X^awn is proper and flat and (X^awn)^♢ → X^♢ is an isomorphism; X ↦ X^♢ is fully faithful on proper flat absolutely weakly normal O_E-schemes.

*Hypotheses and conventions.* E/Q_p is a complete discretely valued field with ring of integers O_E, uniformizer π and perfect residue field k; a formal scheme locally formally of finite type over Spf O_E is an object of Conrad's category FS_{O_E} (AdicSpacesPartII R2/berthelot-type-rig-functor-nonnoetherian-base): locally noetherian, with a continuous structure map to Spf O_E and 𝔛_red locally of finite type over k; affine charts are quotients of O_E[[q_1,…,q_n]]⟨T_1,…,T_m⟩ with the (π,q_1,…,q_n)-adic topology. The structure map need not be adic. Absolute weak normality is imported from SF.0 (AGLR Definition 2.12): seminormality together with the condition that for every prime ℓ, an equality ℓ^ℓ a = b^ℓ has a unique c with a = c^ℓ and b = ℓc. This is not closure under arbitrary ℓ-th roots. For F_p-algebras it is equivalent to perfectness.

*Proof sketch.* (1): affinoid perfectoid test objects have v-covers Spa(R, R⁺) with R⁺ a product of perfectoid valuation rings with algebraically closed fraction fields, which are absolutely weakly normal, so maps factor through the absolute weak normalization. (2): faithfulness since A injects into a product of perfectoid valuation rings; fullness by producing ψ_η from DiamondsAndVStacks D6.9 (A[1/π] is seminormal), a map from the image A'' of B ⊗ A in A[1/π], and comparing the closed sub-v-sheaves (X'')^♢ and Γ_f through density of the generic fibre (D10/generic-fibre-density); special fibres agree by D7/perfect-scheme-full-faithfulness, so A → A'' is a universal homeomorphism and A'' = A by absolute weak normality; globalize with the specialization map. (3): X^awn → Spec O_E is of finite type by excellence and the embedding into the normalization in characteristic 0; π-adic completion preserves absolute weak normality (regular maps); then (2) and Grothendieck existence.

*Acceptance.* For normal A this recovers D10/formal-full-faithfulness in the topologically finite type case. For A = O_E⟨x, y⟩/(y² − x³), the absolute weak normalization is the normalization O_E⟨t⟩, and (1) gives Spd(O_E⟨t⟩) ≅ Spd(A).

*Uses.* AGLR Theorem 1.1 and §4: uniqueness and representability of scheme-theoretic local models.

*Needs:* [D10.7](#d10-generic-fibre-density), [D10.10](#d10-specialization-triple-full-faithfulness), [D10.1](#d10-two-scheme-diamond-functors), [D7.6](#d7-perfect-scheme-full-faithfulness), DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness, SchemeAndStackFoundations:SF.0, AdicSpacesPartII:F0/formal-morphism-full-faithfulness.

*Sources:* [AGLR](#source-aglr) §2.2, Definition 2.12, Lemma 2.13, Definition 2.14, Proposition 2.15, Theorem 2.16 and Proposition 2.18 with proofs, pp. 12–14 — Proves invariance of Spd under absolute weak normalization, full faithfulness on absolutely weakly normal flat separated formal schemes of topologically finite type, and the proper-scheme consequence.

<a id="d10-flat-closure-diamond"></a>

### D10.14 The v-sheaf of a flat Zariski closure is the v-closure of its generic fibre

**Theorem (`OScheme.diamond_zariskiClosure_eq_vClosure`).** Let P be a proper O_E-scheme, U ⊂ P_E a closed subscheme of the generic fibre, and X ⊂ P the scheme-theoretic closure of U, a closed subscheme of P flat over O_E with generic fibre U. Then X^♢ ⊂ P^♢ is the v-closure (D10/v-closure) of U^♢ ⊂ P^♢, where U^♢ = (U^an)^♢ ⊂ (P_E^an)^♢ = P^♢ ×_{Spd O_E} Spd E.

*Hypotheses and conventions.* E/Q_p is a complete discretely valued field with ring of integers O_E, uniformizer π and perfect residue field k; a formal scheme locally formally of finite type over Spf O_E is an object of Conrad's category FS_{O_E} (AdicSpacesPartII R2/berthelot-type-rig-functor-nonnoetherian-base): locally noetherian, with a continuous structure map to Spf O_E and 𝔛_red locally of finite type over k; affine charts are quotients of O_E[[q_1,…,q_n]]⟨T_1,…,T_m⟩ with the (π,q_1,…,q_n)-adic topology. The structure map need not be adic. X is flat over O_E because it is the closure of its generic fibre.

*Proof sketch.* X → P is a closed immersion of proper O_E-schemes, so X^♢ → P^♢ is a proper monomorphism, hence a closed immersion (D10/closed-immersion-criterion; for proper schemes ♢ = ⋄). X^♢ contains U^♢, so U^cl ⊂ X^♢. |U^♢| = |X^♢_η| is dense in |X^♢| (D10/generic-fibre-density applied to the flat formal completion X̂, using X^♢ = X̂^♢). |U^cl| is closed and contains |U^♢|, hence contains its closure in |X^♢|, which is all of |X^♢|; two closed sub-v-sheaves of X^♢ with the same underlying space agree (D10/v-closure, bijection with weakly generalizing closed subsets).

*Acceptance.* For U = P_E, X = P (P flat) and the statement says P^♢ is the v-closure of its generic fibre. Non-example: for X' = X ∪ Z with Z ⊂ P_k a closed subvariety of the special fibre not contained in X, X' is not flat and X'^♢ strictly contains the v-closure of U^♢; nilpotent structure alone is invisible to ♢. Application: for the Grassmannian P = Gr(d, Λ)_{O_E} and U = G/P_μ ⊂ Gr(d, V)_E, the v-sheaf of the Zariski closure is the v-closure of the Schubert diamond (KPZ Lemma 3.4.1).

*Uses.* KPZ Lemma 3.4.1, Theorem 3.2.15: identifies (X̄_μ)^♢ with M^v_{G,μ} and proves the Scholze–Weinstein conjecture for the constructed local models.

*Needs:* [D10.9](#d10-v-closure), [D10.7](#d10-generic-fibre-density), [D10.1](#d10-two-scheme-diamond-functors), [D10.8](#d10-closed-immersion-criterion), AdicSpacesPartII:F0/formal-completion.

*Sources:* [KPZ](#source-kpz) Proof of Lemma 3.4.1, arXiv v3 p. 29 (published p. 28) — Asserts without reference that the v-sheaf of the Zariski closure of X_μ in Gr(d, Λ)_{O_E} is the v-sheaf closure of X_μ^♢; see sourceIssue KPZ/E34. [AGLR](#source-aglr) §2.1, Lemma 2.7 and Proposition 2.8, pp. 9–10; Lemma 2.17, p. 13 — Closed sub-v-sheaves correspond to closed weakly generalizing subsets, the v-closure is computed by the weakly generalizing closure, and generic fibres of flat tft formal schemes are dense.

*Planet:* v-sheaf of a flat closure.

<a id="d10-uniqueness-of-integral-models"></a>

### D10.15 Integral models and morphisms with prescribed v-sheaves are unique

**Application.** (1) If X and X' are proper flat normal O_E-schemes with X^♢ ≅ X'^♢ over Spd O_E, then X ≅ X' by a unique isomorphism inducing the given one. Let M^v_{𝒢,μ} be the v-closure (D10/v-closure) of the Schubert diamond Gr_{G,μ} over Spd Ĕ in the integral Beilinson–Drinfeld Grassmannian Gr_{𝒢,Spd O_E} of GeometricSatakeAndFusion GS0, for a parahoric model 𝒢 and minuscule μ with reflex field E. Then a scheme-theoretic local model M^loc_{𝒢,μ} (proper, flat, normal, with (M^loc)^♢ = M^v_{𝒢,μ}) is unique if it exists. (2) Let ρ : 𝒢 ↪ GL(Λ) be a closed immersion extending a Hodge embedding (G, μ) ↪ (GL(V), μ_d), and assume, as Scholze–Weinstein prove, that M^v_{GL(Λ),μ_d} = Gr(d, Λ)^♢. Then there is a unique morphism ρ_\* : M^loc_{𝒢,μ} → Gr(d, Λ)_{O_E} of O_E-schemes whose diamond is the map M^v_{𝒢,μ} → M^v_{GL(Λ),μ_d} induced by ρ; if the Zariski closure X̄_μ of G/P_μ in Gr(d, Λ)_{O_E} is normal with reduced special fibre then X̄_μ = M^loc_{𝒢,μ} and ρ_\* is a closed immersion.

*Hypotheses and conventions.* E/Q_p is a complete discretely valued field with ring of integers O_E, uniformizer π and perfect residue field k; a formal scheme locally formally of finite type over Spf O_E is an object of Conrad's category FS_{O_E} (AdicSpacesPartII R2/berthelot-type-rig-functor-nonnoetherian-base): locally noetherian, with a continuous structure map to Spf O_E and 𝔛_red locally of finite type over k; affine charts are quotients of O_E[[q_1,…,q_n]]⟨T_1,…,T_m⟩ with the (π,q_1,…,q_n)-adic topology. The structure map need not be adic. The integral Grassmannians, their bounded closed subfunctors and the closed immersion Gr_{𝒢} → Gr_{GL(Λ)} induced by a closed representation are those of GeometricSatakeAndFusion GS0 (Witt geometry); this node only applies the recovery theorems to them. The identification M^v_{GL(Λ),μ_d} = Gr(d, Λ)^♢ (SW20 Corollary 21.6.10) is a hypothesis here.

*Proof sketch.* (1) is D10/proper-scheme-full-faithfulness applied to the isomorphism and its inverse. (2) existence and uniqueness of ρ_\* is D10/proper-scheme-full-faithfulness applied to the functorial map of v-sheaf local models. For the last clause: D10/flat-closure-diamond gives (X̄_μ)^♢ = v-closure of X_μ^♢ in Gr(d, Λ)^♢; the map M^v_{𝒢,μ} → Gr_{GL(Λ)} is a closed immersion (GS0's closed immersion of integral Grassmannians, or directly as a proper monomorphism by D10/closed-immersion-criterion), and v-closures are compatible with closed immersions, so its image is the same v-closure; hence (X̄_μ)^♢ = M^v_{𝒢,μ} and (1) applies.

*Acceptance.* For G = GL(Λ) and minuscule μ_d, M^loc = Gr(d, Λ)_{O_E} and ρ_\* is the identity.

*Needs:* [D10.12](#d10-proper-scheme-full-faithfulness), [D10.14](#d10-flat-closure-diamond), [D10.8](#d10-closed-immersion-criterion), [D10.9](#d10-v-closure), GeometricSatakeAndFusion:GS0:Witt-geometry/integral-parahoric-properness, GeometricSatakeAndFusion:GS0:Witt-geometry/integral-family-bounded-properness.

*Sources:* [SW20](#source-sw20) Lecture 21, §21.4, Conjecture 21.4.1, Remark 21.4.2 and the following paragraph, p. 195 (PDF p. 205) — Notes that by Proposition 18.4.1 the scheme M^loc(G, μ) is unique if it exists, its v-sheaf being the closure of the Schubert diamond; flatness, reduced special fibre and the smooth generic fibre give normality. [KPZ](#source-kpz) §3.1.9, p. 19; Lemma 3.4.1 and proof, arXiv v3 p. 29 (published p. 28) — Constructs ρ_\* by full faithfulness and proves that a normal Zariski closure with reduced special fibre is the unique scheme satisfying the Scholze–Weinstein conjecture.

## Layer D11: Kimberlites, tubular neighbourhoods and connected components

Kimberlites are valuative prekimberlites whose analytic locus is a quasiseparated locally spatial diamond with quasicompact specialization map. Their tubular neighbourhoods are interiors of specialization fibres. With the finiteness condition of being constructibly Jacobson, rich pairs have quotient specialization maps, and topologically normal rich pairs have the same connected components as their reduction. Over `Spd O` the π-adic kimberlites of Anschütz–Gleason–Lourenço–Richarz satisfy a specialization principle.

<a id="d11-valuative-prekimberlite"></a>

### D11.1 Valuative prekimberlites

**Definition (`VSheaf.Valuative`).** A prekimberlite F is valuative if Heuer's specialization morphism SP_F : F → (F^red)^{⋄/◦} is partially proper (it is always separated). Separated formal schemes give valuative prekimberlites; if G → F is a partially proper map of prekimberlites with F valuative then G is valuative; formal neighbourhoods and étale formal neighbourhoods of valuative prekimberlites are valuative; and for valuative F, sp_F : |F| → |F^red| is a specializing map.

*Proof sketch.* Formal schemes: partial properness is local on the target (ECD Proposition 18.6); for Spd(B) the valuative criterion asks that B → R^{♯,◦} with reduction landing in R^{♯,+}_red lands in R^{♯,+}, which holds as R^{♯,+} = R^{♯,◦} ×_{R^{♯,◦}_red} R^{♯,+}_red (Gleason Proposition 4.31). Partially proper G → F: G → (F^red)^{⋄/◦} is partially proper and G → (G^red)^{⋄/◦} separated (Proposition 4.32). Neighbourhoods: base changes (Proposition 4.34). Specializing: given r with sp(r) = x and a specialization y of x, pick a valuation ring dominating the local ring of the closure of x at y, refine the integral subring of the residue field of a formalizable representative of r, and lift by partial properness (Proposition 4.33).

The API:

- `VSheaf.Valuative` (constructor): SP_F is partially proper.
- `VSheaf.valuative_formalScheme` (example): 𝔛^♢ is valuative for a separated locally noetherian formal scheme.
- `VSheaf.Valuative.of_partiallyProper` (functoriality): Partially proper maps of prekimberlites to valuative ones have valuative source.
- `VSheaf.Valuative.formalNbhd` (functoriality): Formal and étale formal neighbourhoods of valuative prekimberlites are valuative.
- `VSheaf.Valuative.sp_specializing` (characterisation): sp_F is a specializing map of topological spaces.

**Checks.**

- `valuative_spdZp` (computation): Spd Z_p is valuative.
- `valuative_disc` (computation): Spd(Z_p⟨T⟩) is valuative.
- `valuative_open_formalNbhd` (non-example): For F = Spd(Z_p⟨T⟩) and S = G_m ⊂ A¹_{F_p}, F̂_{/S} = Spd(Z_p⟨T, T^{-1}⟩) is valuative (a formal scheme) although the open immersion F̂_{/S} → F is not partially proper: valuativity of the source does not come from Proposition 4.32 here.
- `valuative_empty` (degenerate): The empty prekimberlite is valuative.

*Acceptance.* Spd Z_p is valuative.

*Uses.* Gleason Definition 4.35: smelted kimberlites and kimberlites are built on valuative prekimberlites; Gleason Lemma 4.53: valuativity lifts maps from minimal integral subrings; AGLR Definition 2.25: π-adic kimberlites require SP_X partially proper.

*Needs:* [D9.11](#d9-heuer-specialization-morphism), [D9.6](#d9-prekimberlite), [D9.7](#d9-formal-scheme-prekimberlite), [D9.13](#d9-etale-formal-neighbourhood), DiamondEtaleCohomology:C4/partially-proper-map, DiamondEtaleCohomology:C4/proper-stability.

*Sources:* [GLE](#source-gle) §4.4, Definition 4.30 and Propositions 4.31–4.34, p. 34 — Defines valuative prekimberlites by partial properness of SP_F, proves that formal schemes, partially proper maps to valuative ones and formal neighbourhoods give valuative prekimberlites, and that sp_F is specializing.

<a id="d11-smelted-kimberlite"></a>

### D11.2 Smelted kimberlites and their specialization map

**Definition (`VSheaf.SmeltedKimberlite`).** A smelted kimberlite is a pair K = (F, D) with F a valuative prekimberlite and D ⊂ F^an an open subsheaf that is a quasiseparated locally spatial diamond such that D → F is partially proper. Its specialization map is sp_D : |D| → |F| → |F^red|. The cases of interest are D = F^an and, for F over Spd O_K, D = F ×_{Spd O_K} Spd(K, O_K).

*Proof sketch.* F^an → F is always partially proper for a prekimberlite (Gleason Remark 4.36), so the conditions on D = F^an reduce to it being a quasiseparated locally spatial diamond.

The API:

- `VSheaf.SmeltedKimberlite` (constructor): Pairs (F, D) with the stated conditions.
- `VSheaf.SmeltedKimberlite.sp` (projection): sp_D : |D| → |F^red|, the restriction of sp_F.
- `VSheaf.SmeltedKimberlite.ofAn` (constructor): (F, F^an) when F^an is a quasiseparated locally spatial diamond.
- `VSheaf.SmeltedKimberlite.ofGenericFibre` (constructor): (F, F ×_{Spd O_K} Spd(K, O_K)) for F over Spd O_K with that generic fibre quasiseparated locally spatial.
- `VSheaf.SmeltedKimberlite.sp_natural` (functoriality): Maps of pairs commute with sp.

**Checks.**

- `smelted_spdZp` (computation): (Spd Z_p, Spd Q_p) is a smelted kimberlite with sp_D constant.
- `smelted_formal_disc` (computation): (Spd(Z_p⟨T⟩), closed disc diamond over Q_p) is a smelted kimberlite.
- `smelted_not_partially_proper` (non-example): For F = Spd(Z_p⟨T⟩), the open subdiamond D = {|T| ≤ |p|} (a smaller closed disc) of the generic fibre does not give a smelted kimberlite: D → F is not partially proper, the disc having a boundary.
- `smelted_open_disc` (computation): For F = Spd(Z_p⟨T⟩), D = {|T| < 1} does give a smelted kimberlite: the open disc is partially proper over Spd Q_p, hence over the separated closed disc, and F^an → F is partially proper.
- `smelted_empty` (degenerate): (F, ∅) is a smelted kimberlite for every valuative prekimberlite F.

*Acceptance.* For F = Spd Z_p and D = Spd Q_p, sp_D maps the point to Spec F_p.

*Uses.* GLX Theorem 3.7: (Sht^{K_p}_μ(b), Sht_{(G,b,μ,K_p)}) is a rich smelted kimberlite; Gleason Definition 4.38: tubular neighbourhoods of D; Gleason Lemma 4.55: π₀ of D versus π₀ of F^red.

*Needs:* [D11.1](#d11-valuative-prekimberlite), [D9.5](#d9-specialization-map), DiamondsAndVStacks:D5/spatial-diamond, DiamondEtaleCohomology:C4/partially-proper-map.

*Sources:* [GLE](#source-gle) §4.5, Definition 4.35(1)–(2) and Remark 4.36, p. 35 — Defines smelted kimberlites as valuative prekimberlites with a partially proper open quasiseparated locally spatial subdiamond of the analytic locus, and their specialization map. [GLX](#source-glx) §3.1, ¶7, p. 18 — Uses smelted kimberlites (X, X) with X the analytic locus or the generic fibre.

<a id="d11-kimberlite"></a>

### D11.3 Kimberlites

**Definition (`VSheaf.Kimberlite`).** A valuative prekimberlite G is a kimberlite if (G, G^an) is a smelted kimberlite and sp_{G^an} : |G^an| → |G^red| is quasicompact; equivalently sp^{-1}_{G^an}(U) is a spatial diamond for every affine open U ⊂ G^red.

*Proof sketch.* The equivalence is Gleason Remark 4.37: quasicompactness of a spectral-type map is tested on affine opens.

The API:

- `VSheaf.Kimberlite` (constructor): Valuative prekimberlite with (G, G^an) smelted and sp_{G^an} quasicompact.
- `VSheaf.Kimberlite.iff_spatial_preimage` (characterisation): Equivalently sp^{-1}(U) is spatial for affine opens U ⊂ G^red.
- `VSheaf.Kimberlite.toSmelted` (coercion): The smelted kimberlite (G, G^an).

**Checks.**

- `kimberlite_spdZp` (computation): Spd Z_p is a kimberlite.
- `kimberlite_formal_disc` (computation): Spd(Z_p[[T]]) ((p, T)-adic) is a kimberlite whose analytic locus contains characteristic-p points.
- `kimberlite_nonseparated_not` (non-example): The formal affine line over Z_p with doubled origin gives a v-sheaf that is not formally separated, so it is not a kimberlite (not even a prekimberlite).
- `kimberlite_empty` (degenerate): The empty v-sheaf is a kimberlite.

*Acceptance.* Spd Z_p is a kimberlite.

*Uses.* GLX ¶4–6: v-sheaves of formal schemes and v-sheaf local models are kimberlites; Gleason Theorem 4.40(2): sp of a kimberlite is closed.

*Needs:* [D11.2](#d11-smelted-kimberlite), DiamondsAndVStacks:D5/spatial-diamond.

*Sources:* [GLE](#source-gle) §4.5, Definition 4.35(3) and Remark 4.37, p. 35 — Defines kimberlites by the smelted condition on the analytic locus and quasicompactness of its specialization map, equivalently spatiality of preimages of affine opens. [AGLR](#source-aglr) §2.3, footnote 1, p. 14 — Notes that v-sheaves of formal schemes are valuative prekimberlites whose analytic locus is spatial over affines, hence kimberlites.

*Planet:* Kimberlite.

<a id="d11-formal-scheme-kimberlite"></a>

### D11.4 Formal schemes give kimberlites

**Theorem.** For a separated locally noetherian formal scheme 𝔛 over Spf Z_p, 𝔛^♢ is a kimberlite; its specialization map on |(𝔛^♢)^an| = |𝔛^ad_a| is the specialization map λ of AdicSpacesPartII R2 composed with |𝔛_red| = |(𝔛_red)^perf|.

*Proof sketch.* Valuative prekimberlite: D9/formal-scheme-prekimberlite and D11/valuative-prekimberlite. (𝔛^♢)^an = (𝔛^ad_a)^♢ is a locally spatial diamond (DiamondsAndVStacks D6.5); quasiseparated since 𝔛 is separated. Over an affine open Spf A ⊂ 𝔛 with ideal of definition (f_1, …, f_n), sp^{-1}(Spec A_red) = Spa(A, A)_a^♢ is the finite union of the rational subsets {|f_j| ≤ |f_i| ≠ 0}, hence spatial: sp is quasicompact.

*Acceptance.* For 𝔛 = Spf Z_p⟨T⟩, sp on the generic fibre is the reduction of coordinates. For 𝔛 = Spf Z_p[[T]], the analytic locus is the union of {|p| ≤ |T| ≠ 0} and {|T| ≤ |p| ≠ 0}.

*Needs:* [D9.7](#d9-formal-scheme-prekimberlite), [D11.1](#d11-valuative-prekimberlite), [D11.3](#d11-kimberlite), AdicSpacesPartII:R2/specialisation-map, AdicSpacesPartII:R2/generic-fibre-functor-d, DiamondsAndVStacks:D6/etale-site-comparison.

*Sources:* [GLE](#source-gle) §4.3–4.5, Propositions 4.17 and 4.31, Remark 4.37, pp. 30–35 — Formal schemes give valuative prekimberlites; quasicompactness of sp on affines is the spatiality criterion of Remark 4.37. [AGLR](#source-aglr) §2.3, footnote 1, p. 14 — Observes that the remaining axiom for formal schemes, spatiality of the analytic locus over affines, is easily verified. [GLX](#source-glx) §3.1, ¶5–6 and diagram (3.2), pp. 17–18 — States that formal schemes give kimberlites with the same specialization triple.

<a id="d11-tubular-neighbourhood"></a>

### D11.5 Tubular neighbourhoods of smelted kimberlites

**Definition (`VSheaf.tube`).** For a smelted kimberlite K = (F, D) and a constructible locally closed S ⊂ |F^red|, the tubular neighbourhood is D^⊚_{/S} = F̂_{/S} ×_F D; for a kimberlite G write G^⊚_{/S} = Ĝ_{/S} ×_G G^an. Then (F̂_{/S}, D^⊚_{/S}) is a smelted kimberlite, and D^⊚_{/S} is the open subdiamond of D with underlying space the interior of sp_D^{-1}(S), which is the largest generization-stable subset of sp_D^{-1}(S); it is not the whole fibre in general.

*Proof sketch.* F̂_{/S} is a valuative prekimberlite (D11/valuative-prekimberlite), D^⊚_{/S} → F̂_{/S} is open and partially proper by base change, and D^⊚_{/S} → D is an open immersion (D9/constructible-formal-neighbourhood-open), so D^⊚_{/S} is a quasiseparated locally spatial diamond. Interior: D^⊚_{/S} ⊂ (sp^{-1}_D S)^int ⊂ T, T the largest generization-stable subset; conversely for x ∈ T all generizations specialize into S, so a formalizable geometric point over x factors through F̂_{/S} (D9/formal-neighbourhood).

The API:

- `VSheaf.tube` (constructor): D^⊚_{/S} = F̂_{/S} ×_F D.
- `VSheaf.tube_smelted` (structure): (F̂_{/S}, D^⊚_{/S}) is a smelted kimberlite.
- `VSheaf.tube_space_eq_interior` (characterisation): |D^⊚_{/S}| is the interior of sp_D^{-1}(S) in |D|.
- `VSheaf.tube_isOpen` (relation): D^⊚_{/S} → D is an open immersion.
- `VSheaf.tube_pullback` (functoriality): Tubes pull back along maps of smelted kimberlites (from D9/formal-neighbourhood).

**Checks.**

- `tube_formal_disc_origin` (computation): For the kimberlite Spd(Z_p⟨T⟩) and S the origin of A¹_{F_p}, the tube is the open unit disc |T| < 1 over Q_p (the diamond of Spf(Z_p[[T]])_η).
- `tube_rank_two_empty` (non-example): For a perfectoid field C with C⁺ of rank > 1, sp_C is a homeomorphism Spa(C, C⁺) → Spec(C⁺/C°°); for x the closed point, sp^{-1}(x) is the closed point of Spa(C, C⁺), whose interior is empty, so the tube over x is empty although the fibre is not (Gleason Example 4.43).
- `tube_whole` (degenerate): For S = |F^red|, D^⊚_{/S} = D; for S = ∅ it is empty.
- `tube_compat_berthelot` (compatibility): For 𝔛 a formal scheme topologically of finite type over Z_p and x a closed point, |(𝔛^♢)^⊚_{/x}| is Berthelot's tube ]x[ of AdicSpacesPartII R2/tube.

*Acceptance.* For S = |F^red| the tube is D.

*Uses.* GLX ¶10, (3.10)–(3.11) and Theorem 3.8: tubes of integral shtuka moduli and of local models, and their connectedness; Gleason Definition 4.52(3): topological normality: connected tubes at closed points; Gleason Proposition 4.45: density of tubes in fibres for constructibly Jacobson D.

*Needs:* [D11.2](#d11-smelted-kimberlite), [D9.8](#d9-formal-neighbourhood), [D9.9](#d9-constructible-formal-neighbourhood-open), [D11.1](#d11-valuative-prekimberlite).

*Sources:* [GLE](#source-gle) §4.5, Definition 4.38 and Proposition 4.39 with proof, p. 35 — Defines tubular neighbourhoods by base change of formal neighbourhoods, shows they give smelted kimberlites and identifies them with the interior of the specialization fibre. [AGLR](#source-aglr) §2.3, Definition 2.28 and Example 2.29, p. 16 — Tubular neighbourhoods (X̂_{/S})_η of π-adic prekimberlites and the strict inclusions with sp^{-1}(S).

*Planet:* Tubular neighbourhood.

<a id="d11-specialization-spectral"></a>

### D11.6 Specialization maps of smelted kimberlites are spectral and closed for kimberlites

**Theorem (`VSheaf.SmeltedKimberlite.sp_isSpectralMap`).** For a smelted kimberlite (F, D), sp_D : |D| → |F^red| is a specializing spectral map of locally spectral spaces (continuous for the constructible topologies). For a kimberlite G, sp_{G^an} : |G^an| → |G^red| is closed.

*Proof sketch.* Specializing: D11/valuative-prekimberlite and partial properness of D → F. Spectral: work on spatial opens; a formalizable cover X = Spa(A, A⁺) → D gives a commutative square with sp_X, which is patch-continuous, and with g^red : Spec(A⁺_red) → F^red, patch-continuous because F^red is a scheme (D8/reduced-scheme-theoretic-v-sheaf); g is a surjection of compact Hausdorff patch spaces, hence a quotient map. Closed for kimberlites: a spectral specializing map of spectral spaces is closed (DiamondsAndVStacks D0/closure-of-pro-constructible), applied over affine opens using quasicompactness of sp_{G^an}.

*Acceptance.* For the formal disc, sp on the closed disc over Q_p is closed and surjective onto A¹_{F_p}.

*Needs:* [D11.2](#d11-smelted-kimberlite), [D11.3](#d11-kimberlite), [D11.1](#d11-valuative-prekimberlite), [D9.1](#d9-tate-specialization-map), DiamondsAndVStacks:D0/closure-of-pro-constructible, DiamondsAndVStacks:D0/constructible-topology-profinite, Mathlib `IsSpectralMap`.

*Sources:* [GLE](#source-gle) §4.5, Theorem 4.40 with proof, pp. 35–36; Introduction, Theorem 9, p. 5 — Proves that specialization maps of smelted kimberlites are specializing and spectral and that those of kimberlites are closed.

<a id="d11-formally-closed-permanence"></a>

### D11.7 Formally closed immersions and étale formal neighbourhoods preserve kimberlite structures

**Theorem.** Let f : G → F be a formally closed immersion. If F is specializing (resp. a prekimberlite, a kimberlite) so is G, and if (F, D) is a smelted kimberlite so is (G, G ∩ D). If V → F^red is quasicompact, separated and étale and (F, D) is a smelted kimberlite (resp. F a kimberlite), then (F̂_{/V}, D ×_F F̂_{/V}) is a smelted kimberlite (resp. F̂_{/V} a kimberlite).

*Proof sketch.* Specializing: G is separated as a subsheaf and (G^red)^⋄ → G is injective by formal adicness; v-formalizing by the argument of D9/unique-formalization applied to G ×_F Spd(R⁺). Prekimberlite: (G^red)^⋄ → G is a closed immersion and (G^red)^⋄ → (F^red)^⋄ formally closed, so G^red is a closed subscheme (D8/formally-closed-subsheaves-of-formal-pairs). Smelted and kimberlite: closed immersions are partially proper and quasicompact; G ∩ D is a quasiseparated locally spatial diamond (ECD Proposition 11.20). Étale case: D9/etale-thickening-lemma, D11/valuative-prekimberlite and ECD Corollary 11.28.

*Acceptance.* The special fibre (F^red)^⋄ → F of a kimberlite is a formally closed immersion and is a kimberlite with empty analytic locus.

*Needs:* [D8.10](#d8-formally-closed-and-formally-separated), [D8.13](#d8-formally-closed-subsheaves-of-formal-pairs), [D9.3](#d9-unique-formalization), [D9.12](#d9-etale-thickening-lemma), [D11.3](#d11-kimberlite), [D11.2](#d11-smelted-kimberlite), DiamondsAndVStacks:D5/injection-and-finite-etale-permanence.

*Sources:* [GLE](#source-gle) §4.5, Propositions 4.41 and 4.42 with proofs, pp. 35–36 — Proves that formally closed immersions and étale formal neighbourhoods preserve specializing v-sheaves, prekimberlites, smelted kimberlites and kimberlites.

<a id="d11-constructibly-jacobson-diamond"></a>

### D11.8 Constructibly Jacobson diamonds

**Definition (`Diamond.IsConstructiblyJacobson`).** A locally spatial diamond X is constructibly Jacobson (a cJ-diamond) if its rank-one points are dense in |X| for the constructible topology. Surjective images of cJ-diamonds, open subdiamonds of cJ-diamonds, quotients of cJ-diamonds by quasi-pro-étale J-torsors (J profinite) and étale maps to cJ-diamonds have the property; diamonds of adic spaces topologically of finite type over a complete nonarchimedean field K over Z_p are cJ, since Max(A) ⊂ Spa(A, A°) is patch-dense for A topologically of finite type over K (Huber); perfectoid unit balls are cJ.

*Proof sketch.* Permanence (Gleason Proposition 4.46): maps of locally spatial diamonds are spectral and generalizing; open immersions preserve patch-opens; étale maps are locally open immersions composed with finite étale maps (ECD Lemma 11.31), reduced to Galois covers, i.e. to torsors under finite groups, for which f is patch-open because the patch topology commutes with limits and f^{-1}(f(U)) = J·U. Huber's theorem gives patch density of classical points, which are rank one (Gleason Theorem 4.47, Corollary 4.48).

The API:

- `Diamond.IsConstructiblyJacobson` (constructor): Rank-one points are dense in the constructible topology.
- `Diamond.IsConstructiblyJacobson.of_surjective` (functoriality): Surjective images of cJ-diamonds are cJ.
- `Diamond.IsConstructiblyJacobson.of_isOpenImmersion` (functoriality): Open subdiamonds of cJ-diamonds are cJ.
- `Diamond.IsConstructiblyJacobson.of_etale` (functoriality): Étale over a cJ-diamond implies cJ.
- `Diamond.IsConstructiblyJacobson.of_torsor` (functoriality): The base of a quasi-pro-étale profinite torsor with cJ total space is cJ.
- `Diamond.isConstructiblyJacobson_tft` (example): X^♢ for X topologically of finite type over Spa(K, O_K) is cJ.
- `Diamond.IsConstructiblyJacobson.rankOne_mem_open` (characterisation): Every nonempty patch-open (constructible) subset contains a rank-one point.
- `IsConstructiblyDense` (other): On a topological space X, the points satisfying a predicate P are dense for the constructible topology; IsConstructiblyJacobson is this for P = rank one on |X|.
- `IsConstructiblyDense.dense` (relation): On a space with a basis of compact opens, constructible density implies density.

**Checks.**

- `cJ_point` (computation): Spd(C, O_C) is cJ.
- `cJ_rank_two_not` (non-example): Spd(C, C⁺) with C⁺ of rank two is not cJ: its closed point is a patch-open set without rank-one points.
- `cJ_ball` (computation): The perfectoid ball Spa(C⟨T^{1/p^∞}⟩) is cJ, being the diamond of the closed disc.
- `cJ_empty` (degenerate): The empty diamond is cJ.
- `isConstructiblyDense_univ` (degenerate): The predicate satisfied everywhere is constructibly dense.
- `isConstructiblyDense_sierpinski_not` (non-example): In the two-point Sierpiński space the open point alone is not constructibly dense: the closed point is constructible (the space of Spa(C, C⁺) for C⁺ of rank two).

*Acceptance.* Spd(C, O_C) is a cJ-diamond (one rank-one point).

*Uses.* Gleason Proposition 4.45: tubes are dense in specialization fibres; Gleason Definition 4.52: richness requires D to be cJ; GLX Theorem 3.7: local Shimura varieties at parahoric level are cJ (part of richness).

*Needs:* DiamondsAndVStacks:D5/spatial-diamond, DiamondsAndVStacks:D5/local-structure-of-etale-maps, DiamondsAndVStacks:D3/locally-profinite-torsors, DiamondsAndVStacks:D0/constructible-topology-profinite, AdicSpacesPartII:R0/affinoid-jacobson, Mathlib `constructibleTopology`.

*Sources:* [GLE](#source-gle) §4.6, Definition 4.44, Proposition 4.46, Theorem 4.47, Corollary 4.48 and Example 4.49, pp. 36–37 — Defines cJ-diamonds, proves their permanence under surjections, open immersions, profinite torsor quotients and étale maps, and that diamonds of adic spaces topologically of finite type over a field and perfectoid balls are cJ, via Huber's density theorem.

<a id="d11-tube-density"></a>

### D11.9 Tubes are dense in specialization fibres for constructibly Jacobson diamonds

**Theorem.** If (F, D) is a smelted kimberlite with D a cJ-diamond and S ⊂ |F^red| is constructible (locally closed), then |D ∩ F̂_{/S}| = |D^⊚_{/S}| is dense in sp_D^{-1}(S).

*Proof sketch.* |D^⊚_{/S}| is the largest generization-stable subset of sp_D^{-1}(S) (D11/tubular-neighbourhood). sp_D^{-1}(S) is patch-open (sp_D is patch-continuous, D11/specialization-spectral), so rank-one points are dense in it; rank-one points are generization-stable (they have no proper generizations), hence lie in the tube.

*Acceptance.* For the formal disc and S the origin, the open disc is dense in the closed fibre sp^{-1}(0), which also contains the rank-two points at the boundary.

*Needs:* [D11.5](#d11-tubular-neighbourhood), [D11.8](#d11-constructibly-jacobson-diamond), [D11.6](#d11-specialization-spectral).

*Sources:* [GLE](#source-gle) §4.6, discussion before Example 4.43, Example 4.43 and Proposition 4.45, p. 36 — Explains the three properties of tubes in the formal-scheme case and proves density of tubes in fibres when D is constructibly Jacobson, the finiteness hypothesis being necessary by the rank-two example.

<a id="d11-enough-facets"></a>

### D11.10 Diamonds with enough facets

**Definition (`Diamond.HasEnoughFacets`).** For a perfectoid field C of characteristic p, a locally spatial diamond X over Spa(C, O_C) has enough facets if it has a v-cover ⨿_i Spd(A_i, A_i°) → X with each A_i topologically of finite type over C itself. Having enough facets is stable under base change to perfectoid extensions C → C' and fibre products over Spa(C, O_C), implies cJ, and holds for Spd(A, A°) with A smooth topologically of finite type over an untilt C^♯.

*Proof sketch.* Stability: topologically finite type is stable under completed tensor products and field extension. cJ: D11/constructibly-jacobson-diamond (surjective images and tft case). Smooth case: étale locally map to a torus, pull back along the perfectoid torus and use invariance of the étale site under tilting (ECD Lemma 15.6) to cover by Spd of tft algebras over C (Gleason Proposition 4.51).

The API:

- `Diamond.HasEnoughFacets` (constructor): A v-cover by Spd of topologically finite type algebras over C.
- `Diamond.HasEnoughFacets.baseChange` (functoriality): Stable under perfectoid field extension.
- `Diamond.HasEnoughFacets.prod` (functoriality): Stable under fibre products over Spa(C, O_C).
- `Diamond.HasEnoughFacets.isConstructiblyJacobson` (relation): Enough facets implies cJ.
- `Diamond.hasEnoughFacets_smooth` (example): Spd(A, A°) has enough facets for A smooth tft over C^♯.

**Checks.**

- `facets_disc` (computation): The closed disc over C has enough facets.
- `facets_point` (degenerate): Spa(C, O_C) itself has enough facets.
- `facets_rank_two_not` (non-example): Spd(C, C⁺) with C⁺ of rank two does not have enough facets: it is not cJ.

*Acceptance.* Spd(C⟨T⟩, O_C⟨T⟩) has enough facets.

*Uses.* Gleason §5: Demazure resolutions of B_dR⁺-Grassmannians have enough facets, giving richness; GLX §3.4: richness of integral shtuka moduli.

*Needs:* [D11.8](#d11-constructibly-jacobson-diamond), DiamondsAndVStacks:D6/etale-site-comparison, DiamondsAndVStacks:D5/spatial-diamond.

*Sources:* [GLE](#source-gle) §4.6, Definition 4.50 and Proposition 4.51 with proof, p. 37 — The defining facets are topologically finite type over characteristic-p C. Proposition 4.51 separately constructs such facets for smooth spaces over an untilt, by passing through a perfectoid torus and tilting.

<a id="d11-rich-smelted-kimberlite"></a>

### D11.11 Rich smelted kimberlites

**Definition (`VSheaf.SmeltedKimberlite.IsRich`).** A smelted kimberlite K = (F, D) is rich if F is valuative, D is a cJ-diamond, |F^red| is locally noetherian and sp_D : |D| → |F^red| is surjective; a kimberlite G is rich if (G, G^an) is. Constructible formal neighbourhoods and étale formal neighbourhoods preserve rich smelted kimberlites.

*Hypotheses and conventions.* Richness and topological normality are distinct predicates with separate APIs (D11/topologically-normal).

*Proof sketch.* Permanence: D11/constructibly-jacobson-diamond (open and étale), D9/constructible-formal-neighbourhood-open and D9/heuer-thickening (Gleason Proposition 4.54).

The API:

- `VSheaf.SmeltedKimberlite.IsRich` (constructor): Valuative, cJ, locally noetherian reduction, surjective sp_D.
- `VSheaf.Kimberlite.IsRich` (constructor): (G, G^an) is rich.
- `VSheaf.SmeltedKimberlite.IsRich.sp_surjective` (projection): sp_D is surjective.
- `VSheaf.SmeltedKimberlite.IsRich.formalNbhd` (functoriality): Constructible formal neighbourhoods preserve richness.
- `VSheaf.SmeltedKimberlite.IsRich.etaleFormalNbhd` (functoriality): Étale formal neighbourhoods preserve richness.

**Checks.**

- `rich_spdZp` (computation): (Spd Z_p, Spd Q_p) is rich.
- `rich_formal_tft` (compatibility): For 𝔛 separated, flat and topologically of finite type over Spf Z_p, (𝔛^♢, 𝔛^♢_η) is rich: cJ by Huber's theorem, surjective sp by flatness (D11/flat-pi-adic-kimberlite).
- `rich_nonflat_not` (non-example): For F = Spd(F_p[T]) with the discrete topology, a valuative prekimberlite with empty analytic locus, the pair (F, ∅) is a smelted kimberlite but not rich: sp_∅ is not surjective.
- `rich_rank_two_not` (non-example): A pair whose D contains Spd(C, C⁺) with C⁺ of rank two as an open is not rich: D is not cJ.
- `rich_empty` (degenerate): The empty pair is rich.

*Acceptance.* (Spd Z_p, Spd Q_p) is rich.

*Uses.* Gleason Lemma 4.53: sp_D is a quotient map for rich pairs; Gleason Lemma 4.55: component bijection for topologically normal rich pairs; GLX Theorem 3.9: π₀ of local Shimura varieties equals π₀ of affine Deligne–Lusztig varieties.

*Needs:* [D11.2](#d11-smelted-kimberlite), [D11.8](#d11-constructibly-jacobson-diamond), [D11.1](#d11-valuative-prekimberlite), [D9.13](#d9-etale-formal-neighbourhood), [D9.9](#d9-constructible-formal-neighbourhood-open).

*Sources:* [GLE](#source-gle) §4.6, Definition 4.52(1)–(2) and Proposition 4.54, pp. 37–38 — Defines rich smelted kimberlites and rich kimberlites and proves stability under constructible and étale formal neighbourhoods. [GLX](#source-glx) §3.4, Theorem 3.7 and footnote 18, p. 21 — Uses richness of integral shtuka moduli spaces at parahoric level, citing Gleason's thesis.

*Planet:* Rich smelted kimberlite.

<a id="d11-topologically-normal"></a>

### D11.12 Topologically normal rich smelted kimberlites

**Definition (`VSheaf.SmeltedKimberlite.IsTopologicallyNormal`).** A rich smelted kimberlite (F, D) is topologically normal if for every closed point x ∈ |F^red| the tubular neighbourhood D^⊚_{/x} is connected. This predicate is separate from richness.

*Proof sketch.* Closed points of a locally noetherian |F^red| are constructible, so D^⊚_{/x} is defined (D11/tubular-neighbourhood).

The API:

- `VSheaf.SmeltedKimberlite.IsTopologicallyNormal` (constructor): Every closed-point tube is connected (rich pair).
- `VSheaf.SmeltedKimberlite.IsTopologicallyNormal.tube_connected` (projection): D^⊚_{/x} is connected for closed x.
- `VSheaf.SmeltedKimberlite.IsTopologicallyNormal.formalNbhd` (functoriality): Constructible formal neighbourhoods of closed points inherit topological normality.
- `clopen_eq_preimage_of_connected_closed_fibres` (relation): Topological core of the component theorem: for a specializing quotient map sp : X → Y such that every point of Y specializes to a closed point and fibres over closed points are preconnected, every clopen of X is sp⁻¹ of a clopen of Y.
- `connectedComponentsMap_surjective` (relation): A quotient map induces a surjection on connected components.

**Checks.**

- `topNormal_formal_disc` (computation): (Spd(Z_p⟨T⟩), closed disc) is topologically normal: each tube is an open disc.
- `topNormal_two_branches_not` (non-example): For 𝔛 = Spf Z_p⟨x, y⟩/(x(x − p)), flat but not normal, the reduction is A¹_{F_p} and the tube at a closed point is the disjoint union of the two open discs on x = 0 and x = p, so the rich pair (𝔛^♢, 𝔛^♢_η) is not topologically normal.
- `topNormal_spdZp` (degenerate): (Spd Z_p, Spd Q_p) is topologically normal: the only tube is Spd Q_p.

*Acceptance.* For a flat normal formal scheme topologically of finite type over Spf O, tubes at closed points are connected, so (𝔛^♢, 𝔛^♢_η) is topologically normal.

*Uses.* Gleason Lemma 4.55: the component bijection; GLX Theorem 3.8 / Gleason–Lourenço: tubes of local models are connected; AGLR Proposition 2.39: connected tubes detect normality of weakly normal formal schemes.

*Needs:* [D11.11](#d11-rich-smelted-kimberlite), [D11.5](#d11-tubular-neighbourhood), Mathlib `PreconnectedSpace`.

*Sources:* [GLE](#source-gle) §4.6, Definition 4.52(3) and footnote 7, p. 37 — Defines topological normality by connectedness of tubes at closed points, motivated by AGLR Proposition 2.38/2.39. [GLX](#source-glx) §3.4, proof of Theorem 3.9 and footnote 20, p. 22 — Calls the same condition unibranchness and uses it to compute connected components.

*Planet:* Topological normality.

<a id="d11-rich-quotient-theorem"></a>

### D11.13 Specialization of a rich smelted kimberlite is a quotient map

**Theorem (`VSheaf.SmeltedKimberlite.IsRich.sp_isQuotientMap`).** If K = (F, D) is a rich smelted kimberlite then sp_D : |D| → |F^red| is a quotient map.

*Proof sketch.* The statement is local on |F^red|; reduce to F^red = Spec A with finitely many irreducible components (local noetherianity). Irreducible case: take r ∈ |D| over the generic point g, formalizable by Spa(C, O_C) → D; let C_min be the minimal ring of integral elements of C with C_min/C°° ⊇ A; Spa(C, C_min) → (F^red)^{⋄/◦} lifts to D by valuativity. |Spa(C, C_min)| → |F^red| is specializing, surjective and spectral between spectral spaces, hence closed (DiamondsAndVStacks D0/closure-of-pro-constructible), hence a quotient map; it factors through sp_D, which is therefore a quotient map; finitely many components are handled the same way.

*Acceptance.* For (Spd Z_p⟨T⟩, closed disc) the quotient topology on A¹_{F_p} from the closed disc is the Zariski topology.

*Needs:* [D11.11](#d11-rich-smelted-kimberlite), [D11.1](#d11-valuative-prekimberlite), [D11.6](#d11-specialization-spectral), [D9.11](#d9-heuer-specialization-morphism), DiamondsAndVStacks:D0/closure-of-pro-constructible, Mathlib `Topology.IsQuotientMap`.

*Sources:* [GLE](#source-gle) §4.6, Lemma 4.53 and proof, p. 37 — Proves that the specialization map of a rich smelted kimberlite is a quotient map by lifting a generic point with minimal integral subring and using that specializing spectral surjections are closed.

<a id="d11-connected-components-theorem"></a>

### D11.14 Gleason's connected-components theorem

**Theorem (`VSheaf.SmeltedKimberlite.IsTopologicallyNormal.pi0_sp_bijective`).** Let K = (F,D) be a topologically normal rich smelted kimberlite. Assume also that every point of |F^red| specializes to a closed point. Then π₀(sp_D) : π₀(|D|) → π₀(|F^red|) is bijective. The added condition holds when the reduction has the underlying space of a locally noetherian scheme, in particular a perfection of a scheme locally of finite type over a field.

*Hypotheses and conventions.* Closed-specialization condition: for each y ∈ |F^red| there is a closed point x with y specializing to x. This is used explicitly in the suggested Lean topological core. The unrestricted formulation in Gleason Lemma 4.55 remains the recorded gap E10; local noetherianity of the underlying topology alone does not supply this condition.

*Proof sketch.* Surjectivity of sp_D gives surjectivity on connected components. For a clopen partition |D| = U ⊔ V, each image is stable under specialization because sp_D is specializing and U,V are closed. If the two images meet, use the closed-specialization condition to choose a common closed specialization x. Local noetherianity of the underlying topology makes {x} constructible. Tube density and topological normality make sp_D^{-1}(x) connected, contradicting the partition. Thus every clopen subset of |D| is saturated under sp_D. Apply D11/rich-quotient-theorem: saturated clopens descend to clopens of |F^red|. To pass from clopens to actual connected components, use that a locally noetherian space is locally connected and its components are open. Restrict to the open preimage of each base component; any disconnection there gives a clopen in |D|, whose descended partition would disconnect that base component. Each such preimage is therefore connected, giving injectivity on π₀.

*Acceptance.* For a flat normal formal scheme 𝔛 topologically of finite type over Spf O with k algebraically closed, π₀(𝔛_η) = π₀(𝔛_red), the classical fact recovered here. Non-example: for 𝔛 = Spf Z_p⟨x, y⟩/(x(x − p)) the generic fibre is two disjoint closed discs while the reduction A¹_{F_p} is connected; the pair is rich but not topologically normal and π₀(sp) is not injective.

*Uses.* GLX Theorem 3.9 and §6: π₀(Sht_{(G,b,μ,K_p)} × Spd F) ≅ π₀(X^{K_p}_μ(b)); Gleason Theorem 5.1 / Theorem 11: normality of B_dR⁺-Grassmannians implies component results.

*Needs:* [D11.12](#d11-topologically-normal), [D11.11](#d11-rich-smelted-kimberlite), [D11.9](#d11-tube-density), [D11.6](#d11-specialization-spectral), Mathlib `ConnectedComponents`, Mathlib `IsClopen`, [D11.13](#d11-rich-quotient-theorem).

*Sources:* [GLE](#source-gle) §4.6, Lemma 4.55 and proof, p. 38; Introduction, Definition 10 and the paragraph after Theorem 11, pp. 5–6 — The printed proof uses a common closed specialization, then connected tubes and density. This packet verifies that argument with the closed-specialization hypothesis stated explicitly and supplies the quotient/local-connectedness step; the broader formulation is left as E10. [GLX](#source-glx) §3.4, Theorem 3.9 and its proof, p. 22 — Applies the component criterion to integral shtuka moduli; the reductions in that application are of perfectly finite type and satisfy the added closed-specialization condition.

*Planet:* Gleason's connected-components theorem.

<a id="d11-normal-formal-scheme-components"></a>

### D11.15 Normal formal schemes give topologically normal rich kimberlites

**Theorem.** Let 𝔛 be a separated flat normal formal scheme topologically of finite type over Spf O_E. Then 𝔛^♢ is a flat π-adic kimberlite, and the smelted kimberlite (𝔛^♢, 𝔛^♢_η) is rich and topologically normal; its tube at a closed point x is the diamond of the connected rigid space Spf(Ô_{𝔛,x})^rig. Consequently sp induces a bijection π₀(𝔛^rig) ≅ π₀(𝔛_red).

*Hypotheses and conventions.* E/Q_p complete discretely valued with perfect residue field k. Topologically of finite type makes 𝔛^♢ formally adic over Spd O_E, so its analytic locus is its generic fibre.

*Proof sketch.* Richness: valuative by D11/valuative-prekimberlite; 𝔛^♢_η is the diamond of an adic space topologically of finite type over E, cJ by Huber's density theorem (D11/constructibly-jacobson-diamond); 𝔛_red is locally of finite type over k; 𝔛^♢ is a flat π-adic kimberlite (D11/flat-pi-adic-kimberlite, finite-type case), so sp is surjective. Tubes: by D9/formal-neighbourhood the formal neighbourhood of a closed point x is Spf(Ô_{𝔛,x})^♢, whose generic fibre is the tube; Ô_{𝔛,x} is a normal complete local domain by excellence, so its rigid generic fibre is connected (de Jong Lemma 7.3.5) and so is the tube (connectedness of a rigid space and of its diamond agree, DiamondsAndVStacks D6.5). The underlying space of the reduction is that of the locally noetherian scheme 𝔛_red, so every point has a closed specialization. Apply the corrected D11/connected-components-theorem; perfection does not change this underlying space.

*Acceptance.* For 𝔛 = Spf O_E⟨T⟩, the generic fibre is the connected closed disc and the reduction is A¹_k. The tube at a closed point x is an open disc over the finite unramified extension of E with residue field κ(x); it is an open E-disc when x is k-rational. Normality is needed: the flat non-normal Spf Z_p⟨x, y⟩/(x(x − p)) has disconnected tubes (D11/topologically-normal).

*Needs:* [D11.11](#d11-rich-smelted-kimberlite), [D11.12](#d11-topologically-normal), [D11.14](#d11-connected-components-theorem), [D11.4](#d11-formal-scheme-kimberlite), [D9.8](#d9-formal-neighbourhood), [D11.17](#d11-flat-pi-adic-kimberlite), [D10.2](#d10-lfft-generic-fibre-comparison), DiamondsAndVStacks:D6/etale-site-comparison, SchemeAndStackFoundations:SF.0.

*Sources:* [DJ95](#source-dj95) §7.3, Lemma 7.3.5 and proof, p. 88 (journal pagination) — For a normal complete local noetherian flat O-algebra with finite residue field extension, the rigid generic fibre of its formal spectrum is connected. [GLE](#source-gle) Introduction, the paragraph after Remark 5.2 of the introduction (p. 6) and §4.6 motivation before Example 4.43, p. 36 — Explains that normality of a formal scheme makes generic and special fibres have the same components and that rich smelted kimberlites capture this. [GLX](#source-glx) §3.1, ¶6, p. 18 — Formal schemes give kimberlites with the classical specialization triple.

<a id="d11-pi-adic-kimberlite"></a>

### D11.16 π-adic prekimberlites and kimberlites over Spd O

**Definition (`VSheaf.PiAdicKimberlite`).** A small v-sheaf X over Spd O is a π-adic prekimberlite if it is v-locally formal, X → Spd O is separated and formally adic, and X^red is represented by a perfect k-scheme; equivalently X is a prekimberlite with X → Spd O formally adic, in which case X^an = X_η and (X^red)^⋄ = X_s. A π-adic prekimberlite is a π-adic kimberlite if X_η is a locally spatial diamond, sp_X restricted to |X_η| is quasicompact and SP_X is partially proper; equivalently X is a kimberlite formally adic over Spd O. The rule X ↦ (X_η, X^red, sp_X) is functorial, sp_X : |X_η| → |X^red| is spectral when X_η is locally spatial, and closed for π-adic kimberlites.

*Hypotheses and conventions.* O is a complete discrete valuation ring, flat over Z_p, with uniformizer π, fraction field F, perfect residue field k; X_η = X ×_{Spd O} Spd F and X_s = X ×_{Spd O} Spd k.

*Proof sketch.* Equivalences: formal adicness over Spd O gives X^an = X_η and (X^red)^⋄ = X_s; formal separatedness by the argument of D8/spd-zp-formally-separated with O for Z_p (AGLR Proposition 2.24, Remark 2.26). Functoriality and spectrality: D9/specialization-map and D11/specialization-spectral (AGLR Proposition 2.27).

The API:

- `VSheaf.PiAdicPrekimberlite` (constructor): v-locally formal, separated formally adic over Spd O, representable reduction.
- `VSheaf.PiAdicKimberlite` (constructor): Locally spatial generic fibre, quasicompact sp on it, partially proper SP.
- `VSheaf.piAdicPrekimberlite_iff` (equivalence): π-adic prekimberlite iff prekimberlite with formally adic structure map.
- `VSheaf.piAdicKimberlite_iff` (equivalence): π-adic kimberlite iff kimberlite with formally adic structure map.
- `VSheaf.PiAdicPrekimberlite.an_eq_genericFibre` (simp): X^an = X_η and (X^red)^⋄ = X_s.
- `VSheaf.PiAdicPrekimberlite.triple` (functoriality): X ↦ (X_η, X^red, sp_X) is a functor.
- `VSheaf.PiAdicKimberlite.sp_isClosedMap` (characterisation): sp_X : |X_η| → |X^red| is closed.

**Checks.**

- `piAdic_spdO` (computation): Spd O is a π-adic kimberlite.
- `piAdic_formal_tft` (computation): Spd(A) for A π-adically complete, flat, topologically of finite type over O is a π-adic kimberlite.
- `piAdic_powerSeries_not` (non-example): Spd(O[[T]]) with the (π, T)-adic topology is a kimberlite but not π-adic: its structure map is not formally adic.
- `piAdic_perfect_discrete` (computation): For A a discrete perfect k-algebra, Spd(A) is a π-adic kimberlite with empty generic fibre.
- `piAdic_empty` (degenerate): The empty v-sheaf is a π-adic kimberlite.

*Acceptance.* Spd O is a π-adic kimberlite with X_η = Spd F and X^red = Spec k.

*Uses.* AGLR Definition 2.36 and Theorem 2.37: the specialization-triple theorem; AGLR Proposition 4.14: v-sheaf local models are π-adic kimberlites in 𝒦; GLX §3.2: local models M_{K_p,μ} are kimberlites.

*Needs:* [D9.6](#d9-prekimberlite), [D11.3](#d11-kimberlite), [D8.8](#d8-formally-adic-morphism), [D8.11](#d8-spd-zp-formally-separated), [D11.6](#d11-specialization-spectral).

*Sources:* [AGLR](#source-aglr) §2.3, Definitions 2.20(2), 2.23 and 2.25, Propositions 2.24 and 2.27, Remark 2.26, pp. 14–15 — Defines π-adic prekimberlites and kimberlites, compares them with Gleason's notions and proves functoriality, spectrality and closedness of their specialization maps.

<a id="d11-flat-pi-adic-kimberlite"></a>

### D11.17 Flat π-adic kimberlites

**Definition (`VSheaf.PiAdicKimberlite.IsFlat`).** A π-adic kimberlite X over Spd O is flat if it has a v-cover ⨿_i Spd(R_i^{♯+}) → X over Spd O with (R_i^♯, R_i^{♯+}) perfectoid pairs over F. If A → B is a map of π-adically complete flat O-algebras with A integrally closed in A[1/π] and Spd(B[1/π], B) → Spd(A[1/π], A) a v-cover, then Spd(B) → Spd(A) is a v-cover; in particular Spd(A) is a flat π-adic kimberlite for such A, and Spd(A) is flat for A the π-adic completion of a flat O-algebra of finite type. For a flat π-adic kimberlite sp : |X_η| → |X^red| is surjective; conversely a π-adic kimberlite proper over Spd O with surjective sp is flat.

*Hypotheses and conventions.* O is a complete discrete valuation ring, flat over Z_p, with uniformizer π, fraction field F, perfect residue field k; X_η = X ×_{Spd O} Spd F and X_s = X ×_{Spd O} Spd k.

*Proof sketch.* Cover criterion: Spd(B) → Spd(A) is quasicompact (Gleason Lemma 2.26), so it suffices to check surjectivity on points; on the special fibre reduce to surjectivity of Spa(B/π) → Spa(A/π) (D7/perfect-v-covers) and lift points through the surjective Tate specialization of (A[1/π], A) (AGLR Proposition 2.32). Finite type case: reduce to A reduced using D10/awn-full-faithfulness (1); the integral closure A' of A in A[1/π] is finite, Spd(A') is flat, and Spd(A') → Spd(A) is a v-cover (AGLR Proposition 2.33). Surjectivity of sp for flat X from D9/tate-specialization-map on Spd(R^{♯+}); the converse by covering X_η with affinoid perfectoids, formalizing, and extending points by partial properness (AGLR Proposition 2.35).

The API:

- `VSheaf.PiAdicKimberlite.IsFlat` (constructor): A v-cover by Spd of integral perfectoid rings over F.
- `VSheaf.isFlat_spd_of_integrallyClosed` (example): Spd(A) is flat for A flat π-adically complete and integrally closed in A[1/π].
- `VSheaf.isFlat_spd_finiteType` (example): Spd(A) is flat for A the π-adic completion of a flat finite type O-algebra.
- `VSheaf.PiAdicKimberlite.IsFlat.sp_surjective` (characterisation): Flat implies sp : |X_η| → |X^red| surjective.
- `VSheaf.PiAdicKimberlite.isFlat_of_proper_of_sp_surjective` (characterisation): Proper with surjective sp implies flat.

**Checks.**

- `flat_spdO` (computation): Spd O is flat.
- `flat_perfect_not` (non-example): For a nonzero discrete perfect k-algebra A, Spd(A) is a π-adic kimberlite that is not flat: its generic fibre is empty while its reduction is not.
- `flat_higher_rank` (computation): For a higher-rank valuation ring V ⊃ O⟨t⟩ with the π-adic topology, Spd(V) is a flat π-adic kimberlite although its generic fibre is not dense (AGLR footnote 2).
- `flat_empty` (degenerate): The empty kimberlite is flat.

*Acceptance.* Spd O is flat.

*Uses.* AGLR Definition 2.36: the category 𝒦 consists of flat π-adic kimberlites; D11/rich-smelted-kimberlite: surjectivity of sp is part of richness.

*Needs:* [D11.16](#d11-pi-adic-kimberlite), [D9.1](#d9-tate-specialization-map), [D7.10](#d7-perfect-v-covers), [D10.13](#d10-awn-full-faithfulness), DiamondEtaleCohomology:C4/proper-map.

*Sources:* [AGLR](#source-aglr) §2.3, Definition 2.31, Propositions 2.32, 2.33 and 2.35, Remark 2.34, pp. 16–17 — Defines flat π-adic kimberlites, gives the cover criterion and the finite-type examples, and relates flatness to surjectivity of the specialization map.

<a id="d11-kimberlite-triple-theorem"></a>

### D11.18 The specialization-triple theorem for π-adic kimberlites

**Theorem (`VSheaf.PiAdicKimberlite.triple_fullyFaithful`).** Let 𝒦 be the full subcategory of v-sheaves over Spd O consisting of flat π-adic kimberlites X, quasicompact and separated over Spd O, such that (1) the Spd C-valued points of X are dense in |X_C| (C a completed algebraic closure of F), (2) X^red is a perfect k-scheme perfectly of finite type, and (3) every section Spd C → X_C formalizes to Spd O_C → X_{O_C}. On 𝒦 the generic-fibre functor X ↦ X_η is faithful and X ↦ (X_η, X^red, sp_{X̆}) is fully faithful, with X̆ = X ×_{Spd O} Spd Ŏ.

*Hypotheses and conventions.* O is a complete discrete valuation ring, flat over Z_p, with uniformizer π, fraction field F, perfect residue field k; X_η = X ×_{Spd O} Spd F and X_s = X ×_{Spd O} Spd k.

*Proof sketch.* Faithfulness: replace X by a cover Spd(R⁺); the diagonal of Y is formally adic and closed, its pullback along (f, g) is a formally closed subsheaf of Spd(R⁺) with the same generic fibre, hence everything by the argument of D9/unique-formalization. Fullness: for a map of triples, let Z be the image of a formalizable cover Spd(R⁺) → W = X ×_{Spd O} Y under (g, f ∘ g); Z_η is the graph of f_η. Z is v-locally formal and separated; using density of C-points and formalization of C-sections, the special fibre of Z lies in the graph of f^red, so Z is formally π-adic with Z^red ≅ X^red. Z → X is an isomorphism on generic and special fibres and quasicompact, hence an isomorphism (ECD Lemma 12.5); compose with the projection to Y.

*Acceptance.* For X = Spd O the triple is (Spd F, Spec k, constant map).

*Uses.* AGLR Theorem 1.1 and §4: local models are determined by their specialization triples; D10/specialization-triple-full-faithfulness: the formal-scheme analogue on flat normal formal schemes.

*Needs:* [D11.17](#d11-flat-pi-adic-kimberlite), [D11.16](#d11-pi-adic-kimberlite), [D9.3](#d9-unique-formalization), [D9.5](#d9-specialization-map), DiamondsAndVStacks:D4/isomorphism-criteria-for-v-sheaves-and-stacks.

*Sources:* [AGLR](#source-aglr) §2.3, Definition 2.36, Theorem 2.37 and proof, pp. 17–18 — Defines the category 𝒦 and proves that on it the generic fibre is faithful and the specialization triple is fully faithful.

*Planet:* Specialization principle for π-adic kimberlites.

<a id="d11-proper-kimberlite-criterion"></a>

### D11.19 Proper π-adic prekimberlites with dense generic fibre lie in 𝒦

**Lemma.** Let X be a π-adic prekimberlite proper over Spd O satisfying conditions (1)–(3) of D11/kimberlite-triple-theorem, with X_η a spatial diamond. Then X is a π-adic kimberlite, and if |X_η| is dense open in |X| then X is flat, hence in 𝒦.

*Hypotheses and conventions.* O is a complete discrete valuation ring, flat over Z_p, with uniformizer π, fraction field F, perfect residue field k; X_η = X ×_{Spd O} Spd F and X_s = X ×_{Spd O} Spd k.

*Proof sketch.* SP_X is partially proper (D11/valuative-prekimberlite, Gleason Proposition 4.32); sp is spectral between qcqs spaces, hence quasicompact. Flatness: sp is closed (D11/pi-adic-kimberlite), so surjectivity onto the perfectly finite type X^red reduces to hitting closed points; the formal neighbourhood of a closed point is a nonempty open, so meets the dense generic fibre, and a C-point there gives the preimage; conclude by D11/flat-pi-adic-kimberlite.

*Acceptance.* Spd O satisfies the hypotheses.

*Needs:* [D11.18](#d11-kimberlite-triple-theorem), [D11.17](#d11-flat-pi-adic-kimberlite), [D11.1](#d11-valuative-prekimberlite), [D9.9](#d9-constructible-formal-neighbourhood-open).

*Sources:* [AGLR](#source-aglr) §2.3, Lemma 2.38 and proof, p. 18 — Proves that proper π-adic prekimberlites with spatial generic fibre and conditions (1)–(3) are kimberlites, and flat when the generic fibre is dense open.

<a id="d11-normality-via-tubes"></a>

### D11.20 Normality of weakly normal formal schemes through connected tubes

**Theorem.** Let O be a complete discrete valuation ring flat over Z_p with algebraically closed residue field k and uniformizer π. Let A be a flat, weakly normal, π-adically complete domain topologically of finite type over O, with A[1/π] normal. If the tube at every closed point of Spec(A/π), equivalently the rigid generic fibre of the corresponding complete local formal scheme, is connected, then A is normal. Algebraic closedness is an extra hypothesis correcting AGLR Proposition 2.39; connectedness alone over a merely perfect k is insufficient.

*Hypotheses and conventions.* O is a complete discrete valuation ring flat over Z_p, with uniformizer π, fraction field F and algebraically closed residue field k. Weak normality excludes a proper finite birational universal-homeomorphism modification by a reduced scheme (SF.0).

*Proof sketch.* Use D9/formal-neighbourhood to identify each tube with the generic fibre of the completion at its closed point. Let B be the normalization of A in A[1/π]; excellence makes B finite, and B[1/π] = A[1/π]. The completion of B over a closed point x decomposes as the product of its complete local factors. Their generic fibres are disjoint, nonempty (flatness and the flat-kimberlite specialization theorem), and have union the tube of A at x. Connectedness gives exactly one point of Spec(B/π) above x. All these closed residue fields are k because k is algebraically closed. Thus the finite special-fibre map has one geometric point in each closed fibre. The Jacobson/constructibility criterion for finite maps of finite-type k-schemes gives universal injectivity everywhere; integral surjectivity makes it a universal homeomorphism. Together with the generic-fibre isomorphism this makes Spec B → Spec A a finite birational universal homeomorphism. Weak normality now implies A = B directly. No absolute-weak-normality full-faithfulness theorem is needed.

*Acceptance.* For A = O⟨T⟩ with k algebraically closed, the tubes at closed points are open discs and A is normal. Non-example: for A = O⟨x, y⟩/(y² − π²x) with p ≠ 2, A[1/π] ≅ F⟨z⟩ (z = y/π, x = z²) is normal but A is not, and accordingly the tube at a closed point x = ā, with ā a nonzero square in k, is two disjoint discs |z ∓ √a| < 1. The perfect-residue-field boundary fails: take a nontrivial finite unramified extension L/Q_p, B = O_L and A = Z_p + pB. This finite flat complete local domain is weakly normal but not normal, and A[1/p] = L. Its only tube is Spa(L,O_L), which is connected but becomes disconnected after the unramified base extension. This is source issue E9.

*Uses.* AGLR §§4–7: normality of local models; Gleason footnote 7: motivates topological normality.

*Needs:* [D11.17](#d11-flat-pi-adic-kimberlite), [D9.8](#d9-formal-neighbourhood), [D11.5](#d11-tubular-neighbourhood), SchemeAndStackFoundations:SF.0.

*Sources:* [AGLR](#source-aglr) §2.3, Proposition 2.39 and proof, pp. 18–19 — The normalization-and-tubes argument proves the corrected criterion over algebraically closed k. The perfect-field generality printed in Proposition 2.39 fails for the unramified-order example E9; singleton closed fibres alone do not give purely inseparable residue extensions.

## Supplier requests

These are extensions of the named owners; they are not new parallel developments.

- **SchemeAndStackFoundations:SF.0.** From TauCetiRoadmap SchemeAndStackFoundations (merged): §0.24 Scheme.perfection with perfection_universalHomeomorphism and the adjunction with perfect schemes (used for X^⋄ = (X^perf)^⋄ and (𝔛^♢)^red = 𝔛_red^perf); §0.21 regular_map_completion and excellence (normality is preserved by completion of excellent rings, used for π-adic completions of normal proper schemes and for complete local rings of normal formal schemes); §0.23 IsUniversalHomeomorphism with universalHomeomorphism_criteria; §0.26 weakly normal and absolutely weakly normal schemes with the absolute weak normalization (used in D10/awn-full-faithfulness); étale-site invariance under perfection and nilpotent thickenings (§0.23a, used in D9/etale-thickening-lemma). Extend the étale-site input to arbitrary nil ideals and henselian pairs in nonnoetherian perfectoid integral rings, and give uniqueness/effectivity of completed formally étale lifts (not all ordinary étale lifts). Supply the weak-normality criterion excluding finite birational universal homeomorphisms and the finite-map Jacobson criterion used in the corrected algebraically closed normality test. Include preservation of absolute weak normality under the regular completion maps used in AGLR Proposition 2.18, pp. 13–14, and finiteness of absolute weak normalization in the excellent characteristic-zero generic-fibre setting. Needed by: [D7.4](#d7-perfect-scheme-v-sheaf), [D9.12](#d9-etale-thickening-lemma), [D10.4](#d10-power-bounded-functions-theorem), [D10.12](#d10-proper-scheme-full-faithfulness), [D10.13](#d10-awn-full-faithfulness), [D10.1](#d10-two-scheme-diamond-functors), [D11.15](#d11-normal-formal-scheme-components), [D11.20](#d11-normality-via-tubes).

- **AdicSpacesPartII:R0.** Finite morphisms of adic spaces locally of finite type over a nonarchimedean field, with residue fields of points finite over those of their images, and the description of O⁺_{X,x} as the germs bounded by 1 at x with kernel to κ(x)⁺ the germs vanishing at x (used in D7/residue-fields-of-finite-universal-homeomorphisms and D7/plus-sheaf-mod-p-comparison). Also supply the pseudorigid Jacobson–Tate criterion over a complete DVR, beyond affinoids over a field, and flatness of noetherian rational localizations, as in Lourenço Propositions 3.3 and 4.6 (pp. 6,9). Needed by: [D7.1](#d7-residue-fields-of-finite-universal-homeomorphisms), [D7.2](#d7-plus-sheaf-mod-p-comparison), [D10.7](#d10-generic-fibre-density).

- **AdicSpacesPartII:R1.** Extend the field-base analytification functor to relative Huber analytification of schemes locally of finite type over Spa(O,O), including gluing, fibre products, its F-generic fibre, and the comparison with the two v-sheaf functors. The existing R1/analytification-functor only treats a complete nonarchimedean field. Use AGLR Lemma 2.11, pp. 10–11, and Gleason §5.1, p. 38. Needed by: [D10.1](#d10-two-scheme-diamond-functors).

## Coverage and remaining work

The independent target-level review is finished. The packet is partial, with D7 and D11 retaining the precise gaps below. It does not claim that the planned mathematics is formalized.

- **D7 — partial.** Close the gap 'Completed residue fields of a general universal homeomorphism' or keep Proposition 10.2.1 under its residue-field hypothesis. Discharge the request to AdicSpacesPartII:R0 (finite morphisms and stalks of O⁺) and SchemeAndStackFoundations:SF.0 §0.24 (perfection). Only the residue-preserving version and its finite universal-homeomorphism corollary are established; arbitrary analytic pre-adic universal homeomorphisms remain the explicit gap.

- **D8 — planned.** At lemma level, split Gleason Propositions 3.9 and 3.11 (cutoff-cardinal bookkeeping) into declaration-sized statements.

- **D9 — planned.** Discharge SF.0 étale invariance under perfection and arbitrary nil ideals, and complete henselian lifting for nonnoetherian perfectoid integral rings; do not replace it by uniqueness among ordinary étale lifts.

- **D10 — planned.** Discharge the request to SchemeAndStackFoundations:SF.0 (§0.21 completion preserves normality, §0.26 absolute weak normalization). The application D10/uniqueness-of-integral-models takes SW20 Corollary 21.6.10 (M^v_{GL(Λ),μ_d} = Gr(d, Λ)^♢) as a hypothesis; its owner is the local-model layer of GeometricSatakeAndFusion Part II. Discharge the R1 relative-integral-base analytification and R0 pseudorigid Jacobson/rational-localization requests.

- **D11 — partial.** Resolve the closed-specialization gap in the unrestricted version of Gleason Lemma 4.55. The corrected theorem is conditional and applies to the formal-scheme and perfectly finite-type applications. The normality-via-tubes criterion is corrected to algebraically closed residue fields. Over merely perfect fields the original statement is false (E9); a version using geometrically connected tubes needs a separate proof.

## Gaps

**Completed residue fields of a general universal homeomorphism.** Scholze–Weinstein (§10.2, p. 77) assert without proof that in characteristic 0 a universal homeomorphism of analytic adic spaces induces isomorphisms of completed residue fields. This packet proves it for finite morphisms of adic spaces locally of finite type over a nonarchimedean field (D7/residue-fields-of-finite-universal-homeomorphisms), which covers seminormalization and cuspidal normalization (general normalizations need not be universal homeomorphisms), and states SW20 Proposition 10.2.1 under the residue-field hypothesis. The general assertion for arbitrary analytic pre-adic spaces over Spa Q_p needs an argument that a nontrivial extension of complete nonarchimedean fields K(x)/K(x') produces several points after base change to a completed algebraic closure; no source proof was found. Needed by: [D7.3](#d7-universal-homeomorphism-invariance).

**Closed specializations in the unrestricted component criterion.** The passage to a common closed specialization in Gleason Lemma 4.55, p. 38, is not justified by Definition 4.52, which only requires the underlying reduction space to be locally noetherian. A perfect scheme can have locally noetherian topology without closed points: remove the closed point from the spectrum of a perfect valuation ring whose prime ideals form an infinite ascending chain with a maximal limit. Its remaining points have finite-chain open neighborhoods. This is a counterexample to the topological inference, not a constructed counterexample to the kimberlite theorem. The packet proves the theorem with an explicit closed-specialization condition. Derive that condition from the other kimberlite axioms, or supply a proof in their absence, before asserting the printed generality. Needed by: [D11.14](#d11-connected-components-theorem).

## Source issues

All entries below paraphrase the source. Each was independently confirmed in REV-DESIGN-DiamondsAndVStacksPartII; proof boundaries are distinguished from false statements.

**E1 — gap ([SW20](#source-sw20), Lecture 10, §10.2, paragraph before Proposition 10.2.1, p. 77, in the authors' copy of 27 March 2020).** The text asserts that, as for schemes, in characteristic 0 a map of adic spaces is a universal homeomorphism exactly when it is a homeomorphism inducing isomorphisms of completed residue fields, and the proof of Lemma 10.2.2 uses the residue-field half. Prove the residue-field half; for finite morphisms locally of finite type it follows by counting geometric points (D7/residue-fields-of-finite-universal-homeomorphisms). For general analytic pre-adic spaces state Proposition 10.2.1 under the residue-field hypothesis until a proof is supplied. No proof or reference is given, and for maps that are not locally of finite type the residue-field extensions need not be finite, so the scheme argument (integral, radicial, surjective) does not transfer directly. Affects: the proof. Review: confirmed.

**E2 — error ([SW20](#source-sw20), Lecture 21, §21.4, Remark 21.4.2, p. 195, in the authors' copy of 27 March 2020).** The remark says that a flat O_E-scheme with reduced special fibre is necessarily normal by Serre's criterion. In the locally noetherian setting used here, add normality of the generic fibre. In the surrounding local-model application it is a smooth flag variety, so that application satisfies the missing condition. Spec O_E[x, y]/(y² − x³) is flat with reduced special fibre but is not normal, its generic fibre being the cuspidal cubic; Serre's criterion needs (R1) on the generic fibre. Affects: nothing. Review: confirmed.

**E3 — gap ([KPZ](#source-kpz), Proof of Lemma 3.4.1, arXiv v3 p. 29 (published version p. 28)).** The proof passes from a Zariski closure in the ambient Grassmannian to the v-sheaf closure and then to the local-model v-sheaf without spelling out the comparison of ambient spaces. Supply (a) the flat-closure statement D10/flat-closure-diamond and (b) closedness of the image of M^v_{G,μ} in Gr_{GL(Λ)}: the map is a proper monomorphism, hence a closed immersion (D10/closed-immersion-criterion). M^v_{G,μ} is defined as a closure inside the Grassmannian of G, not of GL(Λ); the two closures agree only once the map between them is a closed immersion. Affects: the proof. Review: confirmed.

**E4 — misprint ([GLE](#source-gle), §4.6, Proposition 4.45, p. 36, arXiv v4).** The constructible subset S is taken in |F|. S is a constructible subset of |F^red|; the formal neighbourhood F̂_{/S} and the fibre sp_K^{-1}(S) are only defined for subsets of the reduction. Definition 4.18 defines F̂_{/S} for S ⊂ |F^red|, and the proof uses sp_K^{-1}(S). Affects: nothing. Review: confirmed.

**E5 — error ([SW20](#source-sw20), Lecture 18, §18.3, Lemma 18.3.2, p. 166; authors’ copy dated 27 March 2020).** The existence of a minimal image point is stated for a quasicompact source without a nonemptiness assumption. Require the source to be nonempty. The empty space is quasicompact, but its image contains no point. The proof itself chooses a point of each finite image. Affects: a stated result. Review: confirmed.

**E6 — error ([GLE](#source-gle), §2.5, Proposition 2.36 and proof, p. 22, arXiv v4).** A schematic closed subset is asserted to be the zero locus of an open prime ideal. Use an open ideal, which need not be prime; use the image of B⁺ after quotienting by B·B°° in the preliminary reduction. For B = F_p × F_p, the whole spectrum is schematic and closed; its radical defining ideal is zero and is not prime. The argument establishes closedness, not irreducibility. Affects: a stated result. Review: confirmed.

**E7 — gap ([GLE](#source-gle), §4.4, proof of Lemma 4.25, p. 33, arXiv v4).** The affine étale pullback is described using a unique ordinary étale lift from the reduced integral ring. Uniqueness holds for completed formally étale lifts; construct the associated generic fibres and glue, using henselian/nil-ideal invariance. For a complete integral ring R⁺, the ordinary étale algebras R⁺ and R⁺ × R⁺[1/ϖ] have the same reduced special fibre but are distinct. Their ϖ-adic completions agree. This affects the phrasing of the lifting step, not the geometric lemma. Affects: the proof. Review: confirmed.

**E8 — misprint ([GLE](#source-gle), §3.2, Proposition 3.18, p. 25, arXiv v4; compare §1.3, Proposition 1.19, p. 9).** The second entry of the displayed Spa pair for the non-analytic locus is written as a product involving topologically nilpotent elements and the plus ring. Use the integral closure of the image of A⁺ in A/(A·A°°). Read the quotient-pair notation in Proposition 1.19 with the same ambient quotient convention. A product of topologically nilpotent elements with the plus ring is not a unital ring of integral elements in that quotient. For a Tate pair the ambient quotient is zero, so the plus ring must also be zero; merely quotienting A⁺ by its topologically nilpotent ideal would not give an embedded plus ring. Affects: nothing. Review: confirmed.

**E9 — error ([AGLR](#source-aglr), §2.3, Proposition 2.39 and proof, pp. 18–19, arXiv v2).** Connected tubes over a perfect residue field are claimed to force normality under the stated flatness, weak normality and normal-generic-fibre hypotheses. The packet proves the criterion with algebraically closed residue field. Mere connectedness over a perfect field is insufficient; a geometric-connectedness replacement is a separate question. Let L/Q_p be nontrivial finite unramified, B = O_L, A = Z_p + pB. The conductor pB is radical in both rings and the residue extension F_p → k_L is separable. Any reduced finite birational universal-homeomorphism intermediate ring embeds in B and must have residue F_p, hence lies in A; thus A is weakly normal. It is finite flat, complete, a domain, and A[1/p] = L is normal, but A ≠ B. Its sole tube is the connected Spa(L,O_L). Singleton closed fibres do not imply purely inseparable residue extensions. Affects: a stated result. Review: confirmed.

**E10 — gap ([GLE](#source-gle), §4.6, Definition 4.52 and proof of Lemma 4.55, pp. 37–38, arXiv v4).** The component proof chooses a common closed specialization using specialization of sp_D, although richness only asks for local noetherianity of the underlying reduction topology. State the closed-specialization condition explicitly, as the corrected packet and suggested Lean core do, or justify it from the remaining kimberlite axioms. Local noetherianity of a scheme’s topology is weaker than being a locally noetherian scheme. A perfect valuation spectrum with an infinite chain of primes, after deleting its maximal limit point, has finite-chain open neighborhoods and no closed points. This refutes the topological inference alone; it does not assert that a rich kimberlite counterexample has been constructed. Affects: the proof. Review: confirmed.

## Structure

- **rescope** (DiamondsAndVStacksPartII, DiamondsAndVStacks). The Scholze–Weinstein route items 131 (Lemmas 18.1.1–18.1.2), 132 (Example 18.2.1, Proposition 18.2.2) and 69 (Proposition 10.2.3) are already planned in DiamondsAndVStacks D6.6–D6.9 (TauCetiRoadmap pull request #820, Layer D6). They are cited here, not planned again. Keep D6.6–D6.9 in DiamondsAndVStacks; this Part II starts after them with SW20 Proposition 10.2.1 (D7), Propositions 18.3.1 and 18.4.1 and Theorem 18.4.2 (D7, D10).
- **rescope** (DiamondsAndVStacksPartII, GeometricSatakeAndFusion, HeckeStacksAndLocalShtukas). The pending designs DESIGN-GeometricSatakeAndFusionPartII (Gleason–Lourenço connected tubes of local models) and DESIGN-HeckeStacksAndLocalShtukasPartII (rich smelted kimberlite structure of integral shtuka moduli and the specialization bijection on components) consume Gleason's kimberlite theory. Those designs import D8–D11 of this roadmap (reduction, formal adicness, prekimberlites, formal and tubular neighbourhoods, richness, topological normality, Lemma 4.55, π-adic kimberlites and AGLR Theorem 2.37) and plan only their applications.
- **split** (DiamondsAndVStacksPartII). Layer D11 holds three groups of targets of different flavour; the atlas reads better with sub-layers. Sub-layers of D11: D11a kimberlites and tubes (valuative-prekimberlite, smelted-kimberlite, kimberlite, formal-scheme-kimberlite, tubular-neighbourhood, specialization-spectral, formally-closed-permanence); D11b richness and components (constructibly-jacobson-diamond, tube-density, enough-facets, rich-smelted-kimberlite, topologically-normal, rich-quotient-theorem, connected-components-theorem, normal-formal-scheme-components); D11c π-adic kimberlites (pi-adic-kimberlite, flat-pi-adic-kimberlite, kimberlite-triple-theorem, proper-kimberlite-criterion, normality-via-tubes).

## Coverage of the routed paper items

| Paper item | Planned by |
|---|---|
| PAPER-GLEASON-LIM-XU-26/D22 | [D8.4](#d8-reduction-functor), [D8.3](#d8-diamond-functor-on-scheme-theoretic-v-sheaves) |
| PAPER-GLEASON-LIM-XU-26/D23 | [D8.8](#d8-formally-adic-morphism), [D8.10](#d8-formally-closed-and-formally-separated) |
| PAPER-GLEASON-LIM-XU-26/D24 | [D9.2](#d9-formalization), [D9.4](#d9-specializing-v-sheaf) |
| PAPER-GLEASON-LIM-XU-26/D25 | [D9.5](#d9-specialization-map), [D9.3](#d9-unique-formalization) |
| PAPER-GLEASON-LIM-XU-26/D26 | [D9.6](#d9-prekimberlite) |
| PAPER-GLEASON-LIM-XU-26/D27 | [D9.10](#d9-heuer-thickening), [D9.11](#d9-heuer-specialization-morphism), [D11.1](#d11-valuative-prekimberlite) |
| PAPER-GLEASON-LIM-XU-26/D28 | [D11.2](#d11-smelted-kimberlite) |
| PAPER-GLEASON-LIM-XU-26/D29 | [D11.3](#d11-kimberlite) |
| PAPER-GLEASON-LIM-XU-26/D30 | [D9.8](#d9-formal-neighbourhood), [D11.5](#d11-tubular-neighbourhood) |
| PAPER-GLEASON-LIM-XU-26/D31 | [D11.8](#d11-constructibly-jacobson-diamond) |
| PAPER-GLEASON-LIM-XU-26/D32 | [D11.11](#d11-rich-smelted-kimberlite), [D11.12](#d11-topologically-normal) |
| PAPER-GLEASON-LIM-XU-26/T23 | [D11.13](#d11-rich-quotient-theorem) |
| PAPER-GLEASON-LIM-XU-26/T24 | [D11.14](#d11-connected-components-theorem) |
| PAPER-KISIN-PAPPAS-ZHOU-26/I01 | [D10.11](#d10-formal-full-faithfulness), [D10.12](#d10-proper-scheme-full-faithfulness), [D10.15](#d10-uniqueness-of-integral-models) |
| PAPER-KISIN-PAPPAS-ZHOU-26/diamond-of-flat-closure | [D10.14](#d10-flat-closure-diamond), [D10.8](#d10-closed-immersion-criterion) |
| PAPER-SCHOLZE-WEINSTEIN-20/68 | [D7.3](#d7-universal-homeomorphism-invariance), [D7.2](#d7-plus-sheaf-mod-p-comparison), [D7.1](#d7-residue-fields-of-finite-universal-homeomorphisms) |
| PAPER-SCHOLZE-WEINSTEIN-20/69 | DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness (owned by the parent (D6.9); cited) |
| PAPER-SCHOLZE-WEINSTEIN-20/131 | DiamondsAndVStacks:D6/pre-adic-diamondification, DiamondsAndVStacks:D6/integral-galois-quotient (owned by the parent (D6.6, D6.7); cited) |
| PAPER-SCHOLZE-WEINSTEIN-20/132 | DiamondsAndVStacks:D6/pre-adic-topological-comparison (owned by the parent (D6.8); cited) |
| PAPER-SCHOLZE-WEINSTEIN-20/133 | [D7.6](#d7-perfect-scheme-full-faithfulness), [D7.5](#d7-minimal-point-lemma), [D7.4](#d7-perfect-scheme-v-sheaf) |
| PAPER-SCHOLZE-WEINSTEIN-20/134 | [D10.11](#d10-formal-full-faithfulness), [D10.10](#d10-specialization-triple-full-faithfulness), [D10.4](#d10-power-bounded-functions-theorem) |

## References

<a id="source-sw20"></a>

- **SW20**: Peter Scholze and Jared Weinstein, [Berkeley lectures on p-adic geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf). Annals of Mathematics Studies 207, Princeton University Press, 2020; authors' copy dated 27 March 2020 (printed page = PDF page − 10). Read: Lecture 10, §10.2, pp. 77–78; Lecture 18, §§18.1–18.4, pp. 161–168; Lecture 21, §21.4, p. 195.

<a id="source-gle"></a>

- **GLE**: Ian Gleason, [Specialization maps for Scholze's category of diamonds](https://arxiv.org/abs/2012.05483v4). arXiv:2012.05483v4, 10 August 2025 (printed page = PDF page). Read: Introduction, pp. 2–6; §1, pp. 6–10; §2 (statements and the proofs of 2.13, 2.14, 2.24, 2.26, 2.30–2.36), pp. 10–22; §3, pp. 22–28; §4, pp. 28–38.

<a id="source-aglr"></a>

- **AGLR**: Johannes Anschütz, Ian Gleason, João Lourenço and Timo Richarz, [On the p-adic theory of local models](https://arxiv.org/abs/2201.01234v2). arXiv:2201.01234v2 (printed page = PDF page). Read: §2.1, pp. 8–10; §2.2, pp. 10–14; §2.3, pp. 14–19.

<a id="source-lou17"></a>

- **LOU17**: João N. P. Lourenço, [The Riemannian Hebbarkeitssätze for pseudorigid spaces](https://arxiv.org/abs/1711.06903v1). arXiv:1711.06903v1, 18 November 2017. Read: §1, pp. 1–3; §§3–4 statements, pp. 5–12; §6, pp. 16–18.

<a id="source-dj95"></a>

- **DJ95**: A. J. de Jong, [Crystalline Dieudonné module theory via formal and rigid geometry](http://www.numdam.org/item/PMIHES_1995__82__5_0/). Publications Mathématiques de l'IHÉS 82 (1995), 5–96; Numdam copy (journal page = PDF page + 3). Read: §7.1, pp. 76–80; §7.2, pp. 81–84; §7.3, pp. 85–90; §7.4, pp. 90–91.

<a id="source-sw13"></a>

- **SW13**: Peter Scholze and Jared Weinstein, [Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357v2). arXiv:1211.6357v2, 13 April 2013; Cambridge Journal of Mathematics 1 (2013). Read: §2.2, pp. 15–17.

<a id="source-kpz"></a>

- **KPZ**: Mark Kisin, Georgios Pappas and Rong Zhou, [Integral models of Shimura varieties with parahoric level structure, II](https://arxiv.org/abs/2409.03689v3). arXiv:2409.03689v3; Forum of Mathematics, Pi (2026). Read: §3.1.7–3.1.10, pp. 18–19; §3.4, Lemma 3.4.1 and §3.4.2, pp. 29–30.

<a id="source-glx"></a>

- **GLX**: Ian Gleason, Dong Gyu Lim and Yujie Xu, [The connected components of affine Deligne–Lusztig varieties](https://arxiv.org/abs/2208.07195v3). arXiv:2208.07195v3, 10 November 2025; Inventiones Mathematicae (2026). Read: §3.1–3.4, pp. 16–23.

