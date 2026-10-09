# U.6 — Homotopy comparison and tests

This layer identifies the stable-matrix description of low-degree K-theory with the corresponding homotopy groups, and makes the determinant and transfer comparisons usable on actual automorphism loops. It continues the independently accepted [U.1 packet](../packets/KTheoryLowDegrees--U.1.json). That packet already owns the absolute comparison and the required computations. The present [packet](../packets/KTheoryLowDegrees--U.6.json) refines its two outstanding interfaces: the relative quotient-to-fibre comparison, and the effect on π₁ of the coherent graded determinant in the independently accepted [Z.3 packet](../packets/KTheoryLowDegrees--Z.3.json).

Every result here is a declaration-sized plan, with implementation status unchecked. The pass is complete at the protocol’s planning standard and U.6 is **planned**. It is not closed: the unsplit relative-plus argument, the two boundary identifications, and the specified supplier model interfaces remain explicit obligations. A proof outline ending at one of those obligations records exactly where the proof stops. An assertion from an exercise’s hint is not treated as an established proof.

Suggested home: `TauCeti/Algebra/KTheory/LowDegreeComparison`. The concrete double-congruence declarations use namespace `TauCeti.KTheory.LowDegreeComparison`. The determinant declarations use `TauCeti.GradedDeterminant`, extending the API already assigned to that owner. No new graded-line carrier, plus construction, group-completion machine or generic relative K-theory object is defined here.

## Conventions and owned inputs

A ring is associative and unital; the zero ring is allowed. Relative matrix statements allow noncommutative rings, and I is a two-sided ideal. All maps preserve units. For a finite index type n, GLₙ(A) means the units in its square matrix ring. This formulation uses the existing matrix-unit group over an arbitrary ring; the determinant and graded Picard results impose commutativity exactly where it is needed.

Matrices act on column vectors. For noncommutative A this gives automorphisms of finite free right A-modules; left A-modules instead give right modules over the opposite ring. This agrees with the parent U.2 automorphism-class convention. In the commutative determinant statements there is no opposite-ring distinction, but the same column convention fixes the actual matrix representing an automorphism.

Stable GL(A) and E(A) are the parent U.1 objects. Stabilisation adjoins a final identity entry. Relative GL(A,I) is the kernel of GL(A)→GL(A/I). E(A,I) is the normal closure, **inside E(A)**, of elementary matrices with coefficients in I. It is normal in the full stable congruence group by `U.5/relative-elementary-stable-normal`. Classical K₁(A,I) is GL(A,I)/E(A,I), not the quotient by E(A)∩GL(A,I). The latter quotient describes the image in absolute K₁ and can lose the contribution of the preceding K₂ boundary. Neither normality nor a quotient-group structure is inferred at an arbitrary finite rank.

For q:A→A/I, write D=A⊕I with product

\[
 (a,x)(b,y)=(ab,ay+xb+xy),\qquad 1_D=(1,0).
\]

Its maps are pr(a,x)=a, add(a,x)=a+x and Δ(a)=(a,0). Both pr and add have common section Δ. The map (pr,add) identifies D with the existing compatible-pair subring A×_{A/I}A; its inverse sends (a,b) to (a,b−a). Let J=ker pr. Then add identifies J with I as nonunital rings. `U.5/augmented-double-ring` supplies this object and its projection formulas; they are imported rather than given a second definition.

Classical K₀(I) is ker(K₀(pr):K₀(D)→K₀(A)), as in `U.5/relative-K0-of-ideal`. Its map into K₀(A) is K₀(add) restricted to this kernel. In particular it is not defined as ker(K₀(A)→K₀(A/I)). The preceding quotient-unit boundary can supply additional elements.

K(A) denotes the functorial, grouplike K-space attached to projective modules, with the zero object as basepoint, imported from `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`. The absolute identification uses the zero-component plus/Q comparison of `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`. Its chosen comparison is natural on zero components and on matrix loops. A decomposition of all components as K₀(A)×BGL(A)⁺ requires translations and is not a natural product splitting of spectra.

The homotopy fibre F_q of K(q) is imported from `GeneralAlgebraicKTheory:K.5/relative-K-theory`, expressed using `StableHomotopyKTheory:H.2/homotopy-fibre-and-long-exact-sequence`. H.2’s path-space model uses paths from K(q)(x) to zero. The K-book uses paths in the reverse direction. The path-reversal homeomorphism must be carried into every boundary calculation. A long exact sequence of pointed sets becomes a sequence of abelian groups in degree zero here only through the coherent grouplike K-space structure. An arbitrary homotopy fibre of spaces does not provide that group operation.

## Import inventory: all original U.6 targets

The following parent nodes continue to realise U.6. Their IDs, hypotheses and acceptance criteria are retained. The follow-up neither copies their nodes nor changes their existing declaration names.

| Target | Imported ID after `KTheoryLowDegrees:U.6/` |
| --- | --- |
| K₁(A)≃π₁BGL(A)⁺, with the loop represented by g sent to its stable class | `pi1-plus-construction` |
| Determinant on the absolute plus-space fundamental group | `pi1-plus-determinant` |
| Finite-free restriction of scalars on that fundamental group | `pi1-plus-transfer` |
| Classical relative groups, maps and boundaries as homotopy-fibre groups | `relative-K1-homotopy-comparison`, decomposed below |
| Elementary generation over a Euclidean domain | `euclidean-elementary-generation` |
| Euclidean structure on localised integers | `localised-integers-euclidean` |
| K₁(ℤ)≃{±1} | `K1-integers` |
| K₁(𝔽_q)≃𝔽_qˣ | `K1-finite-field` |
| Units of ℤ[1/p] | `units-of-integers-away-from-p` |
| K₁(ℤ[1/p])≃ℤ/2⊕ℤ, p a rational prime | `K1-integers-away-from-p` |
| K₁ of a finite product of fields | `K1-product-of-fields` |
| Product of diagonal units for a triangular determinant class | `triangular-determinant-class` |
| Stable triviality of diag(g,g⁻¹), and the distinction from diag(g,1) | `diagonal-inverse-pair-test` |
| Positive localisation boundary of a uniformiser | `uniformiser-boundary-one` |

The distinction in the diagonal test concerns the stable K₁ class: diag(g,g⁻¹) is always trivial there, while diag(g,1) retains [g] and is nontrivial when [g] is. The uniformiser test uses the imported localisation orientation ∂[π]=+[k]. This is a localisation boundary and must not be identified with an ideal-quotient boundary solely because both involve low-degree K-groups.

The parent’s foundational prerequisites remain plans. In particular, H.1’s group classifying-space theorem, H.3’s plus fundamental-group theorem and local-coefficient acyclicity theorem, and K.2:plus’s loop-space comparison are not proved or certified in this follow-up. The available universal property is for connected abelian targets. It applies to B(Aˣ) directly; for the zero K-component it is used only after the loop-space comparison supplies an H-space, whose fundamental group is abelian. No general nonabelian-target universal property is imported.

## The concrete double-congruence interface

The first new construction is slightly more general than a quotient map. Let q:A→C be any unital map of associative rings, and D_q=RingHom.pullback(q,q). Write pr and add for its first and second projections. No surjectivity hypothesis is needed in this paragraph. For each finite decidable n, the construction

\[
 c_{q,n}:\ker(GL_n(\mathrm{pr}))\;\cong\;\ker(GL_n(q))
\]

is a multiplicative equivalence induced by the second projection. A source matrix has first projection the identity. If its second projection is g, its entries are therefore the compatible pairs (δᵢⱼ,gᵢⱼ). Conversely such pairs form a matrix over D_q whenever q(g)=1. Its inverse has entries (δᵢⱼ,(g⁻¹)ᵢⱼ); compatibility follows because the coefficient map is a group homomorphism. Componentwise multiplication verifies the inverse identities. Projection and this lift preserve products and are inverse maps.

The declaration is `double_congruence_mulEquiv`, node `double-congruence-mulEquiv`. Its three API items are:

- `double_congruence_apply`: the underlying matrix unit of c(g) equals GLₙ(add)(g). This API is used and promoted to node `double-congruence-apply`.
- `double_congruence_symm_fst`: GLₙ(pr)(c⁻¹(g))=1.
- `double_congruence_symm_snd`: GLₙ(add)(c⁻¹(g))=g.

Four named tests pin the construction down. `double_congruence_one_test` preserves the identity. `double_congruence_empty_test` sends every empty matrix to the identity. `double_congruence_identity_test` says that q=id_A gives a trivial congruence kernel. `double_congruence_mod_four_test` takes q:ℤ/4→ℤ/2 and a one-by-one matrix: the target has an element whose inverse lift is the entry (1,3). A first-projection map would return 1, and a diagonal lift would have first entry 3, so neither meets this test. The suggested file states these tests against the actual Mathlib compatible-pair ring, matrix units and group kernels.

`double-congruence-stabilisation` checks the finite stabilisation equation

\[
 c_{q,n+1}(\operatorname{diag}(g,1))
 =\operatorname{diag}(c_{q,n}(g),1).
\]

Projection preserves the additional unit and zeros, as does the inverse lift. The separate comparison `double-congruence-stable` uses the parent’s finite representatives and stable equality criterion to induce a stable congruence equivalence. This statement is not a claim that a finite-rank elementary subgroup is already normal.

For q:A→A/I and the existing double D=A⊕I, `double-elementary-image` proves that this stable equivalence takes E(D,J) exactly onto E(A,I). The forward inclusion follows by projecting relative elementary generators and their elementary conjugates. For the reverse inclusion, write a relative generator as h eᵢⱼ(x) h⁻¹ with h∈E(A), x∈I. Lift h using E(Δ), and lift x to (0,x)∈J. The conjugate obtained over D belongs to E(D,J) and projects to the prescribed generator. Products and inverses give the whole subgroup. Injectivity follows from the congruence equivalence, rather than from an ambient-ring excision assumption.

`double-relative-quotient` then descends this equivalence to

\[
 a_{A,I}:K_1(D,J)\cong K_1(A,I).
\]

It sends a congruence class to its second-projection class. The common section is part of the proof. An isomorphism of ideals in unrelated ambient rings would not supply the lift of elementary conjugators. The K-book’s Swan example, Exercise III.2.3, printed p.196 (PDF p.204), illustrates this distinction: a square-zero ideal in an upper-triangular matrix ring has a different relative K₁ from its version in the scalar-diagonal subring. This does not contradict the special double-ring calculation.

The sources for this interface are the double-ring construction in Exercise II.2.3, printed p.78 (PDF p.86), the relative quotient in Definition III.2.2, printed p.193 (PDF p.201), and the split quotient calculation of Exercise III.2.7, printed p.197 (PDF p.205). The projection and generator calculations above are explicit algebraic deductions from those definitions.

## Relative homotopy comparisons, separated by degree

Let F_D=hofib(K(pr):K(D)→K(A)), and F_q=hofib(K(q):K(A)→K(A/I)). The square with left map add and right map q commutes because q add=q pr. The generic H.2 fibre-map API gives ω:F_D→F_q. The K-space model must retain the coherent homotopy of this square if its functoriality is represented up to homotopy; arbitrary unrelated choices of homotopy do not define a natural comparison.

The split source can be analysed without an unsplit relative-plus theorem. `double-fibre-pi-one-kernel` uses K(Δ) as a section of K(pr). Surjectivity on π₂ makes the preceding boundary to π₁F_D zero. The long exact sequence thus identifies π₁F_D with ker(K₁(D)→K₁(A)). The imported classical split relative quotient gives an identification s₁:K₁(D,J)≃π₁F_D, with inclusion equal to the kernel inclusion.

`double-fibre-pi-zero-kernel` uses surjectivity of π₁K(pr) in the same way. The next boundary vanishes, and π₀F_D embeds in K₀(D) with image ker K₀(pr)=K₀(I). Its inverse is s₀:K₀(I)≃π₀F_D. This uses the canonical comparison of component groups, not a chosen natural product decomposition of all K-spaces.

Two separate theorem nodes contain the unsplit obligations:

- `double-fibre-pi-zero-comparison` requires π₀ω to be an isomorphism. A proof must identify components of the actual quotient fibre with the double-ring projective presentation, including the relations arising from quotient automorphism loops. A Milnor-patching exact row by itself does not identify that map.
- `double-fibre-pi-one-comparison` requires π₁ω to be an isomorphism. A proof must represent fibre loops by stable congruence matrices and show that the killed relations are exactly E(A,I). Replacing that subgroup by E(A)∩GL(A,I) loses part of the relative group.

Both are recorded proof gaps. The double algebra and split long exact sequence do not prove them. General K-theory does not take every Milnor square to a homotopy pullback, and the adjacent absolute K-groups in the two sequences are not isomorphic. A five-lemma argument with those adjacent terms therefore cannot fill the gap. The degree-two identification K₂=π₂ alone also supplies no such excision theorem.

Once these two obligations are proved, `relative-pi-zero` and `relative-pi-one` specify the comparisons, with their directions fixed:

\[
 \varepsilon_0=(\pi_0\omega)s_0:K_0(I)\cong\pi_0F_q,
 \qquad
 \varepsilon_1=(\pi_1\omega)s_1a_{A,I}^{-1}:
 K_1(A,I)\cong\pi_1F_q.
\]

`relative-pi-zero-natural` and `relative-pi-one-natural` give their naturality for every unital map φ:A→B carrying I into J. The map of double rings is (a,x)↦(φ(a),φ(x)); it respects pr, add and Δ. This gives a commuting cube of fibre maps. On congruence representatives the relative quotient map is the coefficient map, and on K₀(I) it is the map on the kernel defining that group. Identity and composite pair maps must give the corresponding identity and composite comparison squares.

The inclusion statements also have their own nodes. `relative-pi-one-inclusion` is π₁(j_q)ε₁=θ_Aι, where j_q:F_q→K(A), ι is the classical relative-to-absolute map, and θ_A is the imported absolute comparison. `relative-pi-zero-inclusion` is π₀(j_q)ε₀=K₀(add)|_{K₀(I)}. Both follow from the projection square and the split-kernel identifications. Neither map is asserted injective for an arbitrary ideal.

The defining source is K-book IV.1.11, printed pp.267–268 (PDF pp.275–276). Exercise IV.1.15, printed p.275 (PDF p.283), specifies the comparison and suggests the double ring but supplies no proof of the unsplit fibre isomorphisms. The two theorem nodes name the missing argument rather than treating that hint as a theorem proof.

## Connecting maps and sign obligations

`relative-boundary-one` asks for the equality of homomorphisms

\[
 \varepsilon_0\delta_I=\partial_1^W\theta_{A/I}.
\]

Here δ_I is the parent’s ideal boundary. Its image in K₀(D) is the transported Milnor-patching difference [FreePatch(a)]−n[D], with its already fixed gluing orientation. The symbol ∂₁^W means the K-book’s boundary transported to H.2’s fibre by path reversal. Its relation to H.2’s own loop-inclusion convention, including the sign, must be calculated. ε₀ is the fixed split-kernel comparison above and is not freely negated to force the equation.

A proof must turn the quotient matrix loop into the clutched free module and identify its component in the double-ring kernel. Merely comparing exact rows, or knowing the same images and kernels, does not identify the connecting homomorphism. A class lifted from K₁(A) must have zero boundary, and the identity class must have zero boundary; those checks are necessary but do not fix the global sign. The packet records the clutching computation and the path-reversal calculation as one precise proof gap.

`relative-boundary-two` similarly requires

\[
 \varepsilon_1\beta=\partial_2^W\kappa_{A/I}.
\]

The domain of β is classical Steinberg K₂(A/I), its codomain is classical K₁(A,I), and κ is the absolute Steinberg-to-π₂ comparison. β is evaluated by lifting a Steinberg representative and taking its elementary image modulo E(A,I). This construction, its independence of lifts and its normalisation belong to `K2SymbolsBrauer:T.6`, not U.6. The equality above belongs to U.6 and must identify the sphere’s fibre-boundary loop with that particular congruence class. Both maps vanish for a split quotient. In general their common expected image is ker ι, but agreement of images is not agreement of maps.

The algebraic row is Theorem III.5.7.1, printed p.223 (PDF p.231), and the absolute comparison is Corollary IV.1.7.1, printed p.265 (PDF p.273). They do not supply the sphere-to-relative-loop computation. The absolute isomorphism is imported from `K2SymbolsBrauer:T.1/k2-pi2`, and the classical boundary from the exact-row portion of `K2SymbolsBrauer:T.6/relative-steinberg-group`. The requests to T.1:plus and T.6 refine their representative-level normalisations, rather than constructing either map again. T.1 still records a cover/Hurewicz supplier gap. T.6 also has a separate relative π₂ identification gap, which cannot serve as a proof of this boundary equation.

The parent recorded a stage-cycle concern in the T.1:plus/T.6 route. Rechecking the current supplier packets shows that K.5 now imports the early ring model explicitly, without the late low-degree comparisons. Its prerequisite closure has no return to the parent U.6 relative comparison; the current stage-edge extracts give no U.6 return path through T.1:plus, T.6 or K.5 either. No new K.5 object or early-interface request is needed. The degree-zero/one argument imports its functorial grouplike fibre law and H.2’s natural sequence. This graph check removes the inherited cycle objection; it does not fill the relative-plus proof gaps or certify any supplier construction.

## The coherent determinant on π₁

For a commutative R, `Z.3/projective-graded-det` already supplies the symmetric monoidal functor on finite projective isomorphisms under direct sum. Its value on P is (det P,rk P); an isomorphism acts by the componentwise top exterior isomorphism. The grade is a locally constant integer-valued function on Spec R, not necessarily one global rank. The target is the signed graded Picard groupoid, with tensor product and symmetry sign (−1)^{fg}. The input operation is direct sum, not tensor product.

`Z.3/ring-spectrum-det` already owns its connective-spectrum extension Det_R:K(R)→Pic^ℤ(Spec R). The construction follows the projective nerve’s group-completion unit. The target is already grouplike. H.4 owns this group-completion interface, H.5:spectra owns the connective-spectrum and Picard comparisons, and K.4:construction owns the map-level comparison with the agreed K-theory model. None is constructed a second time here.

`graded-det-free-map`, named `TauCeti.GradedDeterminant.projective_graded_det_free_map`, evaluates the projective determinant functor on g∈GLₙ(R). In the ordered standard basis, the image of the exterior volume element is det(g) times that element. This scalar calculation is already proved at the Tau Ceti pin by `exteriorPower.map_top_eq_det_smul`, with `exteriorPower.topEquiv` identifying the line with R; the bridge imports both declarations. This is an equality of automorphisms of the determinant line, with the unit det(g), rather than only the statement that its Picard class is trivial. It evaluates to −1 on swapping two free lines over ℤ and to 1 for the empty free module.

For α∈Aut_R(P), let ℓ_P(α) be the following π₁ class. The automorphism edge first gives a loop at η(P), where η is the projective group-completion unit. Translate by the coherent inverse of η(P) to the zero component. On the target, tensor with the inverse graded line translates the determinant loop to (R,0). The automorphism-unit identification from `Z.3/graded-line-automorphisms` then gives an element of Rˣ.

`graded-det-translated-loop`, named `ring_spectrum_det_automorphism_loop`, proves that this unit is precisely the scalar associated with Det^ℤ(α). The specified extension homotopy Det_Rη≃N(Det^ℤ) identifies the original edge. The coherent grouplike structure transports its translation; tensoring a scalar automorphism with the identity on an inverse line preserves the scalar. Changes of coherent basepoint transport act by conjugation and have no effect on this H-space π₁. For P=R and multiplication by u, the answer is u, rather than u⁻¹. The odd grade remains in the symmetric structure during this argument.

`matrix-loop-model-comparison`, named `ring_spectrum_matrix_loop_comparison`, requires that ℓ_{Rⁿ}(g) agrees with θ_R([g]) in the specified plus/Q model. The comparison must be under the projective nerve’s unit and preserve its automorphism edges. An arbitrary equivalence of the resulting spaces is insufficient. H.4’s free-module telescope and projective cofinality, K.2:plus’s comparison, and K.4’s S/Q comparison provide the owners. The remaining map-under-the-unit compatibility is an exact request to K.4:construction, recorded as a supplier gap.

Define the already induced homomorphism

\[
 d_R:\pi_1K(R)\longrightarrow
 \pi_1\operatorname{Pic}^{\mathbb Z}(\operatorname{Spec}R)
 \cong\operatorname{Aut}(R,0)\cong R^\times.
\]

The theorem `ring-spectrum-det-pi-one` promotes the companion API under its exact name `TauCeti.GradedDeterminant.ring_spectrum_det_pi_one` and requires

\[
 d_R\circ\theta_R=\det_R:K_1(R)\longrightarrow R^\times.
\]

This is a typed equality of group homomorphisms with the specified θ, not an independently selected map from an arbitrary π₁ carrier. On a finite representative g, the translated-loop calculation gives det(g), and the model comparison identifies that loop with θ_R([g]). Every stable matrix has a finite representative, and every classical K₁ class is a stable-matrix quotient class. Equality on those representatives proves equality of the homomorphisms. The classical determinant’s stabilisation and elementary relations are imported from U.3.

`projective-loop-class`, named `ring_spectrum_det_projective_loop`, extends the class identification to every finite projective P. Choose Q with P⊕Q≃Rⁿ. The loop of α⊕1_Q is ℓ_P(α) because the translated identity loop of Q is trivial. The free matrix comparison identifies it with θ_R(autClass(P,α)); U.2 already proves independence of the complement and basis. The separate lemma `projective-loop-determinant`, named `ring_spectrum_det_projective_loop_scalar`, applies the determinant-on-π₁ and translated-loop lemmas: its determinant is both the scalar on det(P) and det_R(autClass(P,α)). For R=F×F and P=e₁R, multiplication by u on its support gives unit (u,1), with rank function (1,0). Constant rank is not required.

`ring-spectrum-det-pi-one-natural`, named `ring_spectrum_det_pi_one_natural`, gives d_Sπ₁K(f)=fˣd_R for a commutative ring map f:R→S. The parent’s already owned naturality of θ supplies the same square on classical K₁. Identity and composite ring maps preserve it. Restriction of scalars is a different operation: `ring-spectrum-transfer-pi-one`, named `ring_spectrum_det_transfer_pi_one`, composes the imported finite-free transfer-on-π₁ comparison with this determinant theorem. For R→B finite free with chosen basis b, d_Rπ₁(T)θ_B=det_Rt; on a B-matrix g its value is the determinant of its R-restriction matrix in bⁿ. Basis changes conjugate that matrix. For ℂ/ℝ and multiplication by 2i the value is 4. No general norm identity is assumed without its norm theorem.

These comparisons use Bhatt–Scholze Proposition 12.3, p.55, Corollary 12.12, p.58, and Corollary 12.17, p.59, together with Construction 5.1, p.18. The paper supplies the signed functor and its spectrum extension. The loop evaluations above are deductions from that functor and its extension property. Its references to general infinite-loop machinery are not new proofs of the supplier interfaces. The existing H.4/H.5 packets retain proof gaps for those machines, which remain visible here.

## Acceptance, ownership and the suggested forms

The relative construction must give trivial groups for I=0, and recover the absolute comparison for I=A. For A=ℤ/4, I=(2), the degree-one comparison gives the two-element group of units 1+I, while degree zero is zero. This radical-ideal test is imported from U.5’s classical calculations; it is a test of the proposed topological comparison, not a proof of it. A split quotient makes both boundary maps zero. An unsplit quotient must retain the full relative elementary quotient and the two explicitly normalised boundaries.

The spectrum determinant sends the −1 loop over ℤ to −1 and the p loop over ℤ[1/p] to p. It kills SK₁ for every commutative ring, but it is injective only under an imported SK₁-vanishing hypothesis. Over a field the parent’s determinant is an isomorphism; over an arbitrary ring the present comparison does not erase SK₁. The inverse-pair and triangular tests continue to use their parent nodes. The positive uniformiser boundary remains its own localisation comparison.

Confirmed finding **RT-AREA-ktheory-1/9** gives each arithmetic example one owner. The existing `U.6/K1-integers` is the sole K₁(ℤ) computation; ArithmeticKTheory:N.8 imports it. The packet proposes the directed edge U.6→N.8 and the consumer rescope. The consumer-side prerequisite still needs its assigned fix; this packet does not claim that the proposed edge is already integrated. Z.6 owns K₀(ℤ), and K2SymbolsBrauer:T.5 owns the degree-two tame-kernel sequences and the stated K₂(ℤ), K₂(𝔽_q) and K₂(ℚ) calculations. N.6 owns certificate-driven presentations and its retained wild-kernel work. No K₂ arithmetic computation or certificate object is added to U.6. Edits to those consumer and supplier deliverables belong to their assigned fixes; this issue changes only its four permitted files.

The [suggested file](../suggested/KTheoryLowDegrees--U.6.lean) gives the concrete construction, its three API signatures and four examples against the pinned Mathlib. All bodies are planning placeholders. The remaining 24 mathematical declarations are individually recorded with their names and exact statements as omissions: their parent stable-K carriers or supplier homotopy/spectrum carriers are absent from the pinned library. No arbitrary carrier, proposition-valued pseudo-object or fabricated determinant replaces them. In particular the π₁ equation above has a precise mathematical domain and codomain, while a Lean signature awaits the named K-space, spectrum and graded-Picard types supplied by their owners.

The five U.6 planets in the accepted parent are retained. Only the determinant-on-π₁ theorem receives a new planet, giving six for the assembled layer; the double-ring and relative refinements remain declaration nodes within that layer.

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The new active forms import only Mathlib. Every new baseline citation was read in its source with the enclosing hypotheses. A successful elaboration checks their expressibility, not a proof of a planned node.

## Sources

- Charles A. Weibel, *The K-book*, author-hosted combined draft dated 29 August 2013: Exercise II.2.3; III Definitions and Exercises 2.2–2.7, Lemma 1.6, Lemma 1.7 and Corollary 1.7.1, Theorem 5.7.1; IV.1.1–1.11 and Exercise 1.15. Printed-page and physical-PDF locators are given at the relevant results above. [Author PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf).
- Bhargav Bhatt and Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*, author-hosted 61-page version: Construction 5.1, Proposition 12.3, Corollaries 12.12 and 12.17, pp.18,55,58–59. The coherent nerve and machine interfaces are in Definitions 12.4–12.8 and Theorem 12.9, pp.56–57. [Author PDF](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf).

Both PDFs were read on 9 October 2026. URLs, version conventions and SHA-256 hashes are recorded in the packet. The reader organises the required declarations and their dependency contracts; it does not reproduce source passages or provide a section-by-section source summary.

The independent review carries forward and rechecks two harmless misprints in the readable Bhatt–Scholze copy and arXiv v3: the nerve paragraph after Proposition 12.3, p.55, counts n−1 arrows where an n-simplex has n, and Remark 12.11, p.58, omits B in the identity π₀(ΩBX)=π₁(BX). The corrected interfaces are used here. The packet records the version checks, counterchecks and prior extraction attribution; these findings are not assertions about the unread publisher PDF. It also carries forward the known missing nullary unit constraint in Construction 12.5, pp.56–57: the generic subset model must specify X_∅≃1. That constraint is forced in the projective/direct-sum and Picard applications, and the supplier interface is used with it.
