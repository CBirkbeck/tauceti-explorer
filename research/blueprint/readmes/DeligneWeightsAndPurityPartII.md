# Deligne weights, purity and the Weil bounds, Part II: the ℓ-adic weight–monodromy conjecture for toric complete intersections

**Summary.** Extend Deligne's equal-characteristic local weight theory to mixed characteristic following Scholze's Perfectoid spaces, §9. Define weight–monodromy purity of ℓ-adic representations relative to local monodromy data and the weight–monodromy conjecture for proper smooth varieties over local fields; prove its stability under highly ramified restriction and direct summands; tilt the Kummer tower so that Galois groups, inertia, Frobenius and the monodromy operator match; plan Huber's neighbourhood theorem; and prove the conjecture for geometrically connected proper smooth set-theoretic complete intersections in projective smooth toric varieties over a p-adic field. The roadmap starts where *Deligne weights, purity and the Weil bounds* (DeligneWeightsAndPurity) stops: the parent proves Deligne's local weight theorem for punctually pure lisse sheaves on curves over finite fields and states that it is not the mixed-characteristic conjecture. Its final theorem is Scholze's Theorem 9.6 (*Perfectoid spaces*, Publ. Math. IHÉS 116 (2012), p. 309): for a local field k of characteristic 0 and a geometrically connected proper smooth k-variety Y that is a set-theoretic complete intersection in a projective smooth toric variety, H^i(Y_{k̄}, ℚ̄_ℓ) satisfies weight–monodromy of weight i for every i and every ℓ ≠ p.

## Scope, boundaries and conventions

**Purpose.** This roadmap starts where *Deligne weights, purity and the Weil bounds* (DeligneWeightsAndPurity) stops. The parent proves Deligne's local weight theorem for punctually pure lisse sheaves on curves over finite fields (DWP.5) and purity of proper smooth varieties over finite fields (DWP.4, DWP.7); it states explicitly that this is not the weight–monodromy conjecture over a p-adic field. Here the conjecture is stated for proper smooth varieties over nonarchimedean local fields, and proved, following Scholze, *Perfectoid spaces*, §9 (Publ. Math. IHÉS 116 (2012), pp. 307–311), for geometrically connected proper smooth varieties over a local field of characteristic 0 that are set-theoretic complete intersections in a projective smooth toric variety (Theorem 9.6). The proof reduces to Deligne's theorem in equal characteristic by tilting.

**Scope.** (WM.0) weight–monodromy purity of ℓ-adic representations relative to a local monodromy datum, its stability under restriction to highly ramified closed subgroups, transport along isomorphisms of data and passage to direct summands, and the conjecture for a variety (Conjecture 9.3); (WM.1) Deligne's theorem in equal characteristic (Theorem 9.4) in the form consumed, for proper smooth varieties over global function fields at any place; (WM.2) the Kummer tower K = completion of k(ϖ^{1/p^∞}), its tilt, and the identification G_K ≅ G_{K♭} ≅ G_{𝔽_q((t))} matching inertia, geometric Frobenius, the ℓ-adic tame character and q; (WM.3) Huber's theorem that a closed subvariety has a tubular neighbourhood with the same prime-to-p torsion cohomology, its Galois-stable form over a perfectoid field, and cup products under pullback (Lemma 9.8); (WM.4) the tilted approximation Z′, Scholze's comparison map, the top-degree isomorphism (Lemma 9.9), the Poincaré-duality splitting, and Theorem 9.6.

**Boundaries.** The predicate "a Weil–Deligne or ℓ-adic representation of G_k satisfies weight–monodromy of weight i" is the parent's (DWP.5); WM.0 generalises it to local monodromy data and proves compatibility. Weil numbers are DWP.0's; the monodromy operator and filtration are LefschetzPencilsAndVanishingCycles LPV.1's and ArithmeticGaloisRepresentations R01.2's; inertia, wild inertia, the tame character and Frobenius lifts are Tau Ceti's LocalFieldsRamification Layer 4. Perfectoid fields, tilting and Fontaine–Wintenberger are PerfectoidSpaces P1/P3. The toric adic and perfectoid spaces, the projection π, its étale-topos comparison, Proposition 8.6 and Corollary 8.8 are AnalyticToricGeometryPartII NT.1–NT.6. Huber's comparison of algebraic and adic étale cohomology (Theorem 9.7) and continuity are ClassicalAdicEtaleCohomology H0/H5. Galois actions on ℓ-adic cohomology of varieties, proper and smooth base change, spreading out, irreducible components, alterations and intersection theory are SchemeAndStackFoundations SF.0, SF.2, SF.4, SF.5; Poincaré duality, Chern and cycle classes are EtaleDualityAndPerverseSheaves EDC.2–EDC.3. The general mixed-characteristic conjecture is not assumed anywhere; Rapoport–Zink's semistable surfaces, Ito's p-adically uniformised varieties and Shimura-variety cases are outside this roadmap. WeightsInEtaleCohomology R34.6 may consume Theorem 9.6; it is not a prerequisite.

**Conventions.** k is a nonarchimedean local field with residue field 𝔽_q of characteristic p, and ℓ ≠ p. G_k = Field.absoluteGaloisGroup k. Arithmetic Frobenius is primary in LocalFieldsRamification; this roadmap states weights with **geometric** Frobenius Φ (the inverse of an arithmetic lift), so that H^i of a smooth proper variety over a finite field is pure of weight i ≥ 0. A Weil q-number of weight w is DWP.0's: an algebraic number all of whose complex conjugates have absolute value q^{w/2}. t_ℓ : I_k → ℤ_ℓ(1) is the ℓ-part of the tame character; an isomorphism ℤ_ℓ(1) ≅ ℤ_ℓ is fixed once, and changing it rescales N without changing anything below. The monodromy filtration is LPV.1's, centred at 0: N M_j ⊆ M_{j−2} and N^j : gr_j ≅ gr_{−j}. Cohomology H^i(X_{k̄}, ℚ̄_ℓ) means (lim_m H^i(X_{k̄}, ℤ/ℓ^m)) ⊗_{ℤ_ℓ} ℚ̄_ℓ with its continuous G_k-action.

**Sources.** P. Scholze, *Perfectoid spaces*, Publ. Math. IHÉS 116 (2012), 245–313 (published version, open access; §8, pp. 304–307, and §9, pp. 307–311). K. Ito, *Uniform local constancy of étale cohomology of rigid analytic varieties*, arXiv:2008.07794v1 (2020), §1 and §4 (statement and proof outline of Huber's neighbourhood theorem, R. Huber, J. Algebraic Geom. 7 (1998), 359–403, Theorem 3.6).

**Layers.** WM.0 weight–monodromy purity and the conjecture; WM.1 Deligne's theorem in equal characteristic; WM.2 tilting the Kummer tower; WM.3 Huber's neighbourhood theorem; WM.4 the comparison map and Theorem 9.6.

**Non-goals.** No general weight–monodromy theorem in mixed characteristic is claimed or assumed. No ℓ-independence and no integral (ℤ/ℓ^m) weight–monodromy statement is made. No statement is made for varieties that are not set-theoretic complete intersections in projective smooth toric varieties; for those the method gives nothing.

## Exact supplier contracts

Every input below is used exactly as stated; nothing in this list is re-planned here.

### From DeligneWeightsAndPurity (parent)

- DWP.0: Weil q-numbers (`DWP.0/weil-q-number`), their behaviour under powers and products (`DWP.0/weil-number-base-extension`, `DWP.0/weil-number-arithmetic`), algebraicity from purity at every embedding (`DWP.0/weil-number-iff-iota-pure-for-every-iota`), spectra of powers (`DWP.0/spectra-of-polynomials-in-an-endomorphism`) and of direct sums (`DWP.0/purity-under-subquotients-and-extensions`).
- DWP.4 and DWP.7: purity of H^i of smooth projective, respectively proper smooth, varieties over finite fields (`DWP.4/smooth-projective-purity`, `DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11`).
- DWP.5: the local weight–monodromy theorem on a curve (`DWP.5/local-monodromy-purity`), and the predicate 'a continuous ℓ-adic representation of G_k, or a Frobenius-semisimple Weil–Deligne representation, satisfies weight–monodromy of weight i': on gr_j of the monodromy filtration every geometric Frobenius eigenvalue is a Weil q-number of weight i + j, with independence of the Frobenius lift, of the scaling of N and of the coefficient field, and agreement of the ℓ-adic and Weil–Deligne forms. WM.0 generalises it to local monodromy data and proves agreement.

### From LefschetzPencilsAndVanishingCycles

- LPV.1: the finite logarithm and exponential of unipotent monodromy, the monodromy filtration centred at 0 with its explicit formula, tensor and dual filtrations, and the Frobenius–monodromy relation NF = qFN.

### From ArithmeticGaloisRepresentations

- R01.2: Grothendieck's ℓ-adic monodromy theorem in the form of the canonical monodromy operator N_t (`R01.2/canonical-local-monodromy-operator`) and Frobenius semisimplification (`R01.2/frobenius-semisimplification-construction`).

### From Tau Ceti roadmap Local fields and ramification

- Layer 0: finite extensions, ramification index, residue degree, Eisenstein extensions.
- Layer 2: unramified extensions and Frobenius.
- Layer 4: inertia I_K with G_K/I_K ≅ ℤ̂, wild inertia, the tame character I_K/P_K ≅ ∏_{ℓ≠p} ℤ_ℓ(1) independent of choices, arithmetic Frobenius lifts (`TauCeti.IsArithFrobeniusLift`) and the twist φxφ⁻¹ ≡ x^q mod P_K.

### From PerfectoidSpaces

- P1: perfectoid fields and the tilt (`P1/perfectoid-field-definition`, `P1/tilt-of-perfectoid-field`).
- P3: Fontaine–Wintenberger (`P3/fontaine-wintenberger`), finite extensions of perfectoid fields (`P3/finite-extensions-of-perfectoid-fields`), invariance of finite étale algebras under henselian completion (`P3/henselian-finite-etale-approximation`) and under completed perfection (`P3/finite-etale-under-completed-perfection`).

### From AnalyticToricGeometryPartII

- NT.0: invariant divisor representatives of hypersurfaces (`NT.0/invariant-representative`).
- NT.1: the unit toric space and its equality with the analytification for complete fans (`NT.1/analytification-comparison`).
- NT.3: the projection π, the étale-topos comparison and its restriction to opens (`NT.3/projection`, `NT.3/etale-topos`, `NT.3/open-topos`), natural in the perfectoid field: for a continuous isometric map of perfectoid fields K → L, π_L and π_K commute with base change, so continuous automorphisms of C over K commute with π_C and π_C⁻¹(U_C) = (π⁻¹(U))_{C♭}.
- NT.4: π* : H^i(X_{Σ,C}, ℤ/ℓ^m) ≅ H^i(X_{Σ,C♭}, ℤ/ℓ^m) for complete regular Σ and C algebraically closed (`NT.4/projection-cohomology`).
- NT.5–NT.6: section-domain neighbourhoods, hypersurface approximation and Corollary 8.8 (`NT.6/complete-intersection-approximation`), over any dense subfield of K♭, without geometric irreducibility.

### From AdicSpacesPartII

- R1–R2: analytification and properness (`R1/analytification-separated-proper`), Raynaud generic fibres (`R2/raynaud-generic-fibre`), their compatibility with fibre products and completed base change (`R2/generic-fibre-fibre-products`), and the comparison d(X̂) → X ×_Y d(Ŷ) (`R2/formal-completion-and-algebraic-comparison`).

### From ClassicalAdicEtaleCohomology

- H0: derived direct images, Leray spectral sequence, pseudo-adic étale sites and continuity of cohomology along tilde-limits (Huber 2.4.6).
- H3: proper base change for adic spaces.
- H4: cohomology of discs and punctured discs, tame radial covers.
- H5: Huber's comparison of algebraic and adic étale cohomology (Theorem 3.7.2 for proper morphisms, Theorem 3.8.1), natural under continuous automorphisms of the base field, hence G_K-equivariant for varieties defined over K.

### From SchemeAndStackFoundations

- SF.0: finite presentation and limits, spreading out of models, geometric irreducible components, relative Proj (blow-ups).
- SF.2: the continuous action of G_k on H^i(X_{k^s}, ℤ/n) and on H^i(X_{k^s}, ℚ_ℓ) for X separated of finite type (finite-dimensional for X proper), compatible with restriction to open subgroups; invariance of étale cohomology of proper varieties under extension of separably closed fields; smooth and proper base change, with R^i f_* locally constant and the specialisation map an isomorphism compatible with Galois actions.
- SF.4: alterations and de Jong's theorem, with geometric irreducibility and smoothness over a finite extension (`SF.4/de-jong-alteration-theorem`).
- SF.5: proper Chow pushforward, degrees of zero-cycles, the Chern-class projection formula, ample restriction, ample implies nef and big, and the numerical criterion giving positive top self-intersection.

### From EtaleDualityAndPerverseSheaves

- EDC.2: the Kummer first Chern class, top-degree cohomology of connected smooth varieties, Poincaré duality with ℓ-adic and rational coefficients as a perfect Galois-equivariant cup-product pairing.
- EDC.3: the cycle class map, compatible with intersection products and with trace equal to degree.

### From Mathlib

- `Field.absoluteGaloisGroup`, `Representation`, `IsNilpotent.exp`, `LinearMap.IsPerfPair`, `CategoryTheory.Abelian.Ext.comp`, `CategoryTheory.Abelian.Ext.mapExactFunctor` and `CategoryTheory.Abelian.Ext.mapExactFunctor_comp`, `CategoryTheory.Sheaf.H`.

## How to read the build

| Layer | Title | Depends on |
|---|---|---|
| WM.0 | Weight–monodromy purity and the conjecture for varieties | DeligneWeightsAndPurity:DWP.0, DeligneWeightsAndPurity:DWP.4, DeligneWeightsAndPurity:DWP.5, DeligneWeightsAndPurity:DWP.7, LefschetzPencilsAndVanishingCycles:LPV.1, ArithmeticGaloisRepresentations:R01.2, tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group, SchemeAndStackFoundations:SF.2 |
| WM.1 | Deligne's weight–monodromy theorem in equal characteristic | WM.0, DeligneWeightsAndPurity:DWP.4, DeligneWeightsAndPurity:DWP.5, DeligneWeightsAndPurity:DWP.7, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.2 |
| WM.2 | Tilting the Kummer tower: Galois groups, inertia, Frobenius and N | WM.0, PerfectoidSpaces:P1, PerfectoidSpaces:P3, tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group |
| WM.3 | Huber's neighbourhood theorem and Galois-stable tubes | AdicSpacesPartII:R2, ClassicalAdicEtaleCohomology:H0, ClassicalAdicEtaleCohomology:H4, ClassicalAdicEtaleCohomology:H5, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.4 |
| WM.4 | The comparison map and weight–monodromy for toric complete intersections | WM.0, WM.1, WM.2, WM.3, AnalyticToricGeometryPartII:NT.3, AnalyticToricGeometryPartII:NT.4, AnalyticToricGeometryPartII:NT.6, ClassicalAdicEtaleCohomology:H5, SchemeAndStackFoundations:SF.4, SchemeAndStackFoundations:SF.5, EtaleDualityAndPerverseSheaves:EDC.2, EtaleDualityAndPerverseSheaves:EDC.3 |

Each target below gives its statement with all hypotheses, a proof outline, its prerequisites, and, for definitions and constructions, its API and at least three Checks (unit tests a wrong definition would fail). Names in `code` are the proposed Lean names; those marked in the last section also appear in `Suggested.lean`.

## Layer WM.0: Weight–monodromy purity and the conjecture for varieties

Define a **local monodromy datum** on a profinite group H: a closed normal subgroup I (inertia), a continuous homomorphism t : I → ℚ_ℓ with nonzero image (a tame character, taken up to ℚ_ℓ^× scaling), the set of geometric Frobenius elements (a coset of I acting as x ↦ x^{1/Q} on the residue field), and the integer Q > 1. Construct the **standard datum** of a nonarchimedean local field k (I_k, t_ℓ, geometric Frobenius lifts, q) from LocalFieldsRamification Layer 4, and the **restricted datum** of a closed subgroup H ⊆ G_k whose image in G_k/I_k is open and with t_ℓ(H ∩ I_k) open.

Define **weight–monodromy purity of weight w** of a finite-dimensional continuous ℓ-adic representation relative to a datum: some open subgroup of I acts by exp(t(σ)N) with N nilpotent, and for every geometric Frobenius Φ and every j, the eigenvalues of Φ on gr_j of the monodromy filtration of N are Weil Q-numbers of weight w + j. Prove it agrees with DWP.5's predicate for the standard datum, is invariant under rescaling t and extension of coefficients, is detected on any closed subgroup with open Frobenius and tame images (in particular after finite extension, after k(ϖ^{1/p^∞}), and after perfection in characteristic p), is transported by isomorphisms of data, and passes to H-stable direct summands but not to subrepresentations.

Define **"the weight–monodromy conjecture holds for X"** for a proper smooth variety X over k and ℓ ≠ p (Scholze Conjecture 9.3): H^i(X_{k̄}, ℚ̄_ℓ) is weight–monodromy pure of weight i for every i. Prove invariance under finite extension of k and the good-reduction case (N = 0, Deligne purity).

**Dependencies:** DWP.0 (Weil numbers), DWP.5 (the predicate), DWP.4/DWP.7 (purity over finite fields); LPV.1 (monodromy logarithm and filtration); R01.2 (monodromy operator); LocalFieldsRamification Layer 4; SF.2 (Galois action, smooth proper base change).
**Sources:** Scholze 2012, §9, Proposition 9.1, Definition/Proposition 9.2, Conjecture 9.3 and the remark after it, pp. 307–308; the reduction at the start of the proof of Theorem 9.6, p. 309.

### Definition: Local monodromy data and their isomorphisms

Target `WM.0/local-monodromy-datum`.

Fix a prime ℓ. A local monodromy datum D = (H, I, t, Fr, Q) consists of a profinite group H; a closed normal subgroup I ⊆ H (inertia); a continuous group homomorphism t : I → ℚ_ℓ (additive target) that is not identically zero (the tame ℓ-adic character); a subset Fr ⊆ H (geometric Frobenius elements) that is a single left coset ΦI of I, whose image topologically generates H/I, with H/I isomorphic to ℤ̂ as a profinite group; and an integer Q ≥ 2 prime to ℓ; subject to the twist relation t(ΦσΦ⁻¹) = Q⁻¹·t(σ) for all Φ ∈ Fr and σ ∈ I. An isomorphism of data D → D′ is an isomorphism of topological groups α : H → H′ with α(I) = I′, α(Fr) = Fr′, Q = Q′, and t′(α(σ)) = c·t(σ) for all σ ∈ I and one constant c ∈ ℚ_ℓ^×. The rescaled datum c·D replaces t by c·t and is isomorphic to D through the identity of H.

*Hypotheses:* H profinite (compact, Hausdorff and totally disconnected); ℓ prime; Q ≥ 2 prime to ℓ; t continuous and nonzero; Fr a single coset of I generating H/I ≅ ℤ̂.

*Proof outline:*

1. The twist relation is independent of the representative: for Φ′ = Φτ with τ ∈ I, t(Φ′σΦ′⁻¹) = t(Φ(τστ⁻¹)Φ⁻¹) = Q⁻¹t(τστ⁻¹) = Q⁻¹t(σ), because t is a homomorphism to an abelian group.
2. Isomorphisms compose (constants multiply), have inverses (constant c⁻¹), and the identity is an isomorphism with c = 1; rescaling is an isomorphism with the identity map.
3. The identity element of H is never in Fr: Φ = 1 would give t(σ) = Q⁻¹t(σ) for all σ, hence t = 0 since Q ≥ 2, contradicting nonvanishing.
4. Compactness is essential for later uniqueness: every open subgroup of I has finite index, so t cannot vanish on it unless t vanishes on all of I (the additive group of ℚ_ℓ is torsion-free).

*Prerequisites:* Mathlib `ContinuousMonoidHom`; Mathlib `Subgroup.Normal`; Mathlib `Padic`.

*Used in:*

- Scholze 2012, §9, proof of Theorem 9.6, p. 309: the sentence that the notion of weights and the monodromy operator N is compatible with G_K ≅ G_{k′} is the statement that this isomorphism is an isomorphism of data
- WM.0/weight-monodromy-purity: the purity predicate is relative to a datum
- WM.2/monodromy-data-match: the tilting isomorphism of Galois groups is an isomorphism of data

*API:*

- `LocalMonodromyDatum` (structure): The structure on a profinite H bundling I, t, Fr, Q with closedness, normality, nonvanishing, coset, generation and twist conditions.
- `LocalMonodromyDatum.tame_conj` (relation): For Φ ∈ Fr and σ ∈ I: t(ΦσΦ⁻¹) = Q⁻¹·t(σ).
- `LocalMonodromyDatum.inv_mul_mem_inertia` (relation): Φ, Φ′ ∈ Fr imply Φ⁻¹Φ′ ∈ I; conversely Φ ∈ Fr and σ ∈ I imply Φσ ∈ Fr and σΦ ∈ Fr.
- `LocalMonodromyDatum.one_not_mem_frob` (other): 1 ∉ Fr.
- `LocalMonodromyDatum.rescale` (constructor): For c ∈ ℚ_ℓ^×, the datum (H, I, c·t, Fr, Q).
- `LocalMonodromyDatum.IsIso` (structure): The proposition that a topological group isomorphism α : H ≃ H′ with constant c is an isomorphism of data D → D′.
- `LocalMonodromyDatum.IsIso.refl` (constructor): The identity of H is an isomorphism D → D with c = 1.
- `LocalMonodromyDatum.IsIso.trans` (functoriality): Composition of isomorphisms; constants multiply.
- `LocalMonodromyDatum.IsIso.symm` (functoriality): The inverse isomorphism, with constant c⁻¹.
- `LocalMonodromyDatum.rescaleIso` (equivalence): The identity gives c·D → D with constant c⁻¹, or D → c·D with constant c.

*Checks:*

- `LocalMonodromyDatum.tameModel` (computation): For q ≥ 2 prime to ℓ, let ℤ̂ act on ℤ_ℓ by n·x = q^{−n}x (the continuous extension of n ↦ q^{−n} to ℤ̂ → ℤ_ℓ^×). Then H = ℤ_ℓ ⋊ ℤ̂, I = ℤ_ℓ × {0}, t(x, 0) = x, Fr = ℤ_ℓ × {1}, Q = q is a local monodromy datum: (0,1)(x,0)(0,1)⁻¹ = (q⁻¹x, 0).
- `LocalMonodromyDatum.one_not_mem_frob` (non-example): Taking Fr = I (the coset of the identity) violates the twist relation for every Q ≥ 2, because t is nonzero.
- `LocalMonodromyDatum.arithmetic_sign` (non-example): In the tame model, replacing Fr by ℤ_ℓ × {−1} (arithmetic Frobenius) gives t(ΦσΦ⁻¹) = q·t(σ), which is not the relation with any Q ≥ 2: the geometric sign is forced.
- `LocalMonodromyDatum.rescaleIso` (compatibility): For c = ℓ, the identity of H is an isomorphism D → ℓ·D with constant ℓ; it is not an isomorphism with constant 1.
- `LocalMonodromyDatum.profinite_required` (non-example): The discrete group H = ℤ[1/Q] ⋊ ℤ with action n·x = Q^{−n}x, I = ℤ[1/Q], t the inclusion into ℚ_ℓ and Fr the coset of 1 satisfies the twist but is not profinite. Its inertia has the open subgroup {0}, on which t vanishes; an exponential condition there cannot determine N. This model must be excluded by the topology hypotheses.

*Acceptance:*

- The standard datum of a local field (WM.0/standard-local-datum) and its restrictions to closed subgroups (WM.0/restricted-local-datum) are local monodromy data.
- Under Fontaine–Wintenberger for the Kummer tower, G_L ≅ G_{L♭} is an isomorphism of data (WM.2/monodromy-data-match).

*Source:* Scholze 2012, §9, the paragraph before Proposition 9.1 and Proposition 9.1, p. 307 — Recalls the maximal pro-ℓ quotient t_ℓ of inertia, Grothendieck's quasi-unipotence and the relation NΦ = qΦN for geometric Frobenius, which the datum abstracts.; Scholze 2012, §9, proof of Theorem 9.6, first paragraph, p. 309 — States that weights and N are compatible with the isomorphism of Galois groups; the datum makes this precise.

### Construction: The standard local monodromy datum of a local field

Target `WM.0/standard-local-datum`.

Let k be a nonarchimedean local field (finite over ℚ_p or over 𝔽_p((u))) with residue field 𝔽_q, q = p^f, and let ℓ ≠ p. Fix once an isomorphism ℤ_ℓ(1) ≅ ℤ_ℓ. The standard datum D_k = (G_k, I_k, t_ℓ, Fr_k, q) has G_k = Field.absoluteGaloisGroup k; I_k its inertia subgroup (LocalFieldsRamification Layer 4); t_ℓ : I_k → ℤ_ℓ(1) ≅ ℤ_ℓ ⊆ ℚ_ℓ the ℓ-component of the tame character, σ ↦ (σ(ϖ^{1/ℓ^n})/ϖ^{1/ℓ^n})_n for a uniformiser ϖ and a compatible system of ℓ-power roots, independent of both choices; Fr_k the set of geometric Frobenius lifts, the inverses of the arithmetic Frobenius lifts (TauCeti.IsArithFrobeniusLift); and Q = q. For a finite extension k′/k of ramification index e and residue degree f′, the datum of k restricted to G_{k′} (WM.0/restricted-local-datum) is e·D_{k′}, so it is isomorphic to D_{k′} through the identity of G_{k′} with constant e⁻¹; the inverse isomorphism has constant e.

*Hypotheses:* k a nonarchimedean local field with finite residue field of characteristic p; ℓ ≠ p prime. The isomorphism ℤ_ℓ(1) ≅ ℤ_ℓ is fixed once and for all; changing it rescales t_ℓ by a unit.

*Proof outline:*

1. I_k is closed and normal, and G_k/I_k ≅ ℤ̂ with the arithmetic Frobenius as generator (LocalFieldsRamification Layer 4, inertia and the exact sequence 1 → I_k → G_k → ℤ̂ → 1); the geometric lifts form the coset of the inverse generator, which also generates.
2. The tame character I_k/P_k ≅ ∏_{ℓ′≠p} ℤ_ℓ′(1) and its independence of ϖ and of the root system are Layer 4 (the tame character and the twist); t_ℓ is its ℓ-component composed with the fixed isomorphism; it is continuous and surjective onto ℤ_ℓ, hence nonzero.
3. Twist relation: for an arithmetic lift φ, φxφ⁻¹ ≡ x^q modulo P_k on inertia (Layer 4, intrinsic twist), so t_ℓ(φσφ⁻¹) = q·t_ℓ(σ) and for Φ = φ⁻¹, t_ℓ(ΦσΦ⁻¹) = q⁻¹t_ℓ(σ).
4. Finite extensions: G_{k′} ⊆ G_k is open; I_{k′} = G_{k′} ∩ I_k; its image in G_k/I_k is f′ℤ̂, the geometric Frobenius lifts of k′ are the elements of G_{k′} mapping to −f′, and q_{k′} = q^{f′}. Writing ϖ = u·ϖ′^e with u a unit of k′, the ℓ-power roots of u lie in an unramified extension of k′, so inertia of k′ fixes them and t_{ℓ,k}|_{I_{k′}} = e·t_{ℓ,k′}.

*Prerequisites:* WM.0/local-monodromy-datum (Local monodromy data and their isomorphisms); Tau Ceti roadmap LocalFieldsRamification, layer 4 the tame quotient of the absolute galois group; Tau Ceti roadmap LocalFieldsRamification, layer 2 unramified extensions and frobenius; Mathlib `Field.absoluteGaloisGroup`; Mathlib `PadicInt`.

*Used in:*

- Scholze 2012, §9, Conjecture 9.3, p. 308: weights are measured by geometric Frobenius elements of G_k and q
- WM.0/weight-monodromy-conjecture: the conjecture for X uses the standard datum of its base field
- WM.2/monodromy-data-match: the data of k and of the characteristic-p local field k″ are compared after restriction

*API:*

- `standardDatum` (constructor): D_k for a local field k and ℓ ≠ p.
- `standardDatum_inertia` (simp): (standardDatum k ℓ).I = inertia subgroup of G_k.
- `standardDatum_tame_apply` (simp): t_ℓ(σ) is the ℓ-adic coordinate of (σ(ϖ^{1/ℓ^n})/ϖ^{1/ℓ^n})_n under the fixed ℤ_ℓ(1) ≅ ℤ_ℓ, independent of ϖ and the roots.
- `standardDatum_mem_frob_iff` (characterisation): Φ ∈ Fr_k iff Φ⁻¹ is an arithmetic Frobenius lift (TauCeti.IsArithFrobeniusLift).
- `standardDatum_Q` (simp): Q = #κ(k).
- `standardDatum_restrict_finite` (compatibility): For k′/k finite with ramification index e: (D_k)|_{G_{k′}} = e·D_{k′}.
- `standardDatum_tame_surjective` (other): t_ℓ(I_k) = ℤ_ℓ.

*Checks:*

- `standardDatum_tame_kummer` (computation): For k = ℚ_p and σ ∈ I_k with σ(p^{1/ℓ^n}) = ζ_{ℓ^n}·p^{1/ℓ^n} for the compatible system ζ = (ζ_{ℓ^n}) chosen as generator of ℤ_ℓ(1), t_ℓ(σ) = 1.
- `standardDatum_restrict_unramified` (degenerate): For k′/k unramified of degree f′, the restricted datum equals D_{k′} on the nose: same inertia, constant 1, Q = q^{f′}.
- `standardDatum_restrict_ramified` (compatibility): For k′ = ℚ_p(p^{1/2}) over ℚ_p (p odd), t_{ℓ,ℚ_p}|_{I_{k′}} = 2·t_{ℓ,k′}. The identity from the restricted datum to D_{k′} has constant 1/2, and its inverse has constant 2, nonzero in ℚ_ℓ even for ℓ = 2.
- `standardDatum_arithmetic_not_frob` (non-example): An arithmetic Frobenius lift φ is not in Fr_k: its class in G_k/I_k is the inverse of the class of Fr_k, and t_ℓ(φσφ⁻¹) = q·t_ℓ(σ).

*Acceptance:*

- Scholze 2012, Proposition 9.1 and the relation NΦ = qΦN, p. 307, are stated for this datum.
- For k′/k unramified, the restriction is D_{k′} itself (e = 1).

*Source:* Scholze 2012, §9, the paragraph before Proposition 9.1, p. 307 — Defines t_ℓ through ℓ-power roots of a uniformiser and q as the residue cardinality.; Scholze 2012, §9, the remark after Conjecture 9.3, p. 308 — One may replace k by a finite extension; the restriction formula makes this precise.

### Construction: Restriction of a local monodromy datum to a highly ramified closed subgroup

Target `WM.0/restricted-local-datum`.

Let D = (H, I, t, Fr, Q) be a local monodromy datum and H′ ⊆ H a closed subgroup such that (a) the image of H′ in H/I ≅ ℤ̂ is open, hence equal to f·ℤ̂ for a unique f ≥ 1 (measured with the class of Fr as generator), and (b) t(H′ ∩ I) ≠ 0. The restricted datum is D|_{H′} = (H′, H′ ∩ I, t|_{H′∩I}, Fr′, Q^f) with Fr′ the set of elements of H′ whose image in H/I is f times the class of Fr, that is Fr′ = H′ ∩ Φ^f I for any Φ ∈ Fr. Restriction is transitive: (D|_{H′})|_{H″} = D|_{H″} for closed H″ ⊆ H′ satisfying (a) and (b) for D, and it commutes with rescaling and with isomorphisms of data.

*Hypotheses:* H′ closed in H; image of H′ in H/I open; t(H′ ∩ I) ≠ 0.

*Proof outline:*

1. H′ ∩ I is closed and normal in H′; t restricted to it is continuous and nonzero by (b).
2. Fr′ is nonempty because f·[Φ] lies in the image of H′, and it is a single coset of H′ ∩ I; its class generates H′/(H′ ∩ I) ≅ fℤ̂ ≅ ℤ̂.
3. Twist relation: Φ′ ∈ Fr′ is Φ^fτ with τ ∈ I; conjugation by τ does not change t, and conjugation by Φ^f multiplies it by Q^{−f}.
4. Transitivity: the indices multiply (f″ = f·f′) and the inertia subgroups intersect; rescaling and isomorphisms commute with intersection and restriction.

*Prerequisites:* WM.0/local-monodromy-datum (Local monodromy data and their isomorphisms).

*Used in:*
- Scholze 2012, §9, proof of Theorem 9.6, first paragraph, p. 309: restricting to G_K, Frobenius elements still give the weights (f = 1, totally ramified) and the pro-ℓ inertia is still seen (pro-p extension)
- WM.0/detection-on-subgroups: purity is compared for D and D|_{H′}
- WM.2/monodromy-data-match: data restricted to G_L and to G_{L♭} are matched

*API:*
- `LocalMonodromyDatum.restrict` (constructor): D|_{H′} for H′ satisfying (a) and (b).
- `LocalMonodromyDatum.restrict_inertia` (simp): (D|_{H′}).I = H′ ∩ I.
- `LocalMonodromyDatum.restrict_mem_frob_iff` (characterisation): Φ′ ∈ Fr′ iff Φ′ ∈ H′ and Φ′ ∈ Φ^f I.
- `LocalMonodromyDatum.restrict_Q` (simp): (D|_{H′}).Q = Q^f.
- `LocalMonodromyDatum.restrict_restrict` (functoriality): (D|_{H′})|_{H″} = D|_{H″}.
- `LocalMonodromyDatum.restrict_self` (simp): D|_{H} = D.
- `LocalMonodromyDatum.restrict_iso` (functoriality): An isomorphism α : D ≅ D′ restricts to D|_{H′} ≅ D′|_{α(H′)} with the same constant.

*Checks:*
- `restrict_unramified_index` (computation): For D = D_k and H′ = G_{k′}, k′/k unramified of degree 3: f = 3 and Q′ = q³.
- `restrict_self` (degenerate): H′ = H gives f = 1 and D|_{H} = D.
- `restrict_inertia_excluded` (non-example): H′ = I_k is not allowed: its image in G_k/I_k is 0, so it has no Frobenius elements and weights cannot be read on it.
- `restrict_ell_kummer_excluded` (non-example): For H′ = G_{k(ϖ^{1/ℓ^∞})} ⊆ G_k, t_ℓ(H′ ∩ I_k) = 0, so condition (b) fails: on this subgroup every restriction of a G_k-representation has inertia acting through a finite quotient on an open subgroup, and N cannot be recovered from it.

*Acceptance:*
- For H′ = G_{k′} with k′/k finite this is the formula of WM.0/standard-local-datum.
- For H′ = G_{k_∞} with k_∞ = k(ϖ^{1/p^∞}) and k p-adic, f = 1 and t(H′ ∩ I) = t(I) (WM.2/monodromy-data-match).

*Source:* Scholze 2012, §9, proof of Theorem 9.6, first paragraph, p. 309 — Totally ramified (Frobenius still visible) and pro-p (pro-ℓ inertia still visible) are conditions (a) and (b) for G_K.

### Definition: Weight–monodromy purity relative to a local monodromy datum — *Weight–monodromy purity*

Target `WM.0/weight-monodromy-purity`.

Let D = (H, I, t, Fr, Q) be a local monodromy datum, E a finite extension of ℚ_ℓ with algebraic closure Ē, V a finite-dimensional E-vector space with a continuous representation ρ : H → GL_E(V), and w ∈ ℤ. ρ is weight–monodromy pure of weight w relative to D if (a) there are an open subgroup I₁ ⊆ I and a nilpotent N ∈ End_E(V) with ρ(σ) = exp(t(σ)·N) for all σ ∈ I₁ (exp the finite exponential of a nilpotent endomorphism); and (b) for every Φ ∈ Fr and every j ∈ ℤ, every eigenvalue in Ē of the endomorphism induced by ρ(Φ) on gr_j V = M_j/M_{j−1}, where M is the monodromy filtration of N centred at 0 (LPV.1), is a Weil Q-number of weight w + j (DWP.0). When (a) holds N is unique, ρ(Φ)Nρ(Φ)⁻¹ = Q⁻¹N for Φ ∈ Fr, and ρ(Φ) preserves M, so (b) is meaningful. For the standard datum D_k of a local field this is DeligneWeightsAndPurity DWP.5's predicate 'V satisfies weight–monodromy of weight w'; for ρ over ℚ̄_ℓ = ∪E, purity is tested over any finite E of definition and is independent of it.

*Hypotheses:* D a local monodromy datum; ρ continuous on a finite-dimensional vector space over a finite extension E of ℚ_ℓ; w ∈ ℤ.

*Proof outline:*

1. Uniqueness of N: shrink I₁ to I ∩ U with U open normal in H, which is normal in H; t(I₁) is a nonzero subgroup because I₁ has finite index in the compact group I and t ≠ 0; for σ ∈ I₁ with t(σ) ≠ 0, N = t(σ)⁻¹·log ρ(σ) with the finite logarithm of a unipotent endomorphism (LPV.1/finite-monodromy-logarithm), which is inverse to exp.
2. Frobenius relation: for Φ ∈ Fr and σ ∈ I₁ (normal), ρ(Φ)exp(t(σ)N)ρ(Φ)⁻¹ = ρ(ΦσΦ⁻¹) = exp(Q⁻¹t(σ)N); taking logarithms, ρ(Φ)Nρ(Φ)⁻¹ = Q⁻¹N. Hence ρ(Φ) preserves ker N^a and im N^b, so it preserves M_j = Σ_{a−b=j} ker N^{a+1} ∩ im N^b (LPV.1/monodromy-filtration).
3. Independence of Φ: on gr_j, I₁ acts trivially (exp(tN) − 1 lowers M by 2), so I acts through the finite group F = ρ̄(I); conjugation by ρ̄(Φ) permutes F with some finite order r, and for τ ∈ I, (ρ̄(Φτ))^{r|F|} = ρ̄(Φ)^{r|F|}; hence every eigenvalue of ρ̄(Φτ) has an r|F|-th power that is an eigenvalue of ρ̄(Φ)^{r|F|}, and Weil numbers descend along powers (DWP.0/weil-number-base-extension). So (b) for one Φ implies (b) for all of Fr.
4. Compatibility with DWP.5's predicate: for D = D_k, Grothendieck's monodromy theorem gives (a) with N = N_t (ArithmeticGaloisRepresentations R01.2/canonical-local-monodromy-operator); the remaining condition is DWP.5's eigenvalue condition on gr_j^N for geometric Frobenius. Frobenius semisimplification (R01.2/frobenius-semisimplification-construction) changes ρ(Φ) by a unipotent element commuting with N, so it does not change eigenvalues on gr_j: the Weil–Deligne formulation gives the same predicate.
5. Coefficients: for E ⊆ E′ the filtration of N ⊗ 1 is M ⊗ E′ and the eigenvalues are the same elements of Ē = Ē′.

*Prerequisites:* WM.0/local-monodromy-datum (Local monodromy data and their isomorphisms); WM.0/standard-local-datum (The standard local monodromy datum of a local field); DeligneWeightsAndPurity:DWP.5; DeligneWeightsAndPurity:DWP.0/weil-q-number; DeligneWeightsAndPurity:DWP.0/weil-number-base-extension; LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration; LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm; LefschetzPencilsAndVanishingCycles:LPV.1/twisted-monodromy-equivariance; LefschetzPencilsAndVanishingCycles:LPV.1/tensor-dual-and-symmetric-monodromy; ArithmeticGaloisRepresentations:R01.2/canonical-local-monodromy-operator; ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification-construction; Mathlib `IsNilpotent.exp`; Mathlib `Representation`; Mathlib `Module.End.HasEigenvalue`.

*Used in:*

- Scholze 2012, §9, Conjecture 9.3, p. 308: the conjecture asserts this property for H^i of a proper smooth variety with weight i
- Scholze 2012, §9, proof of Theorem 9.6, final paragraph, p. 311: the property passes from H^i(Z′) to its direct summand H^i(Y)
- WM.1/deligne-curve-theorem: Deligne's theorem is stated as this property for D_k with k of characteristic p
- WeightsInEtaleCohomology:R34.6: the exact local monodromy-weight statement a local–global application needs is this predicate for D_k
- PotentialModularityAndCompatibleSystems:R24.5: strict purity of a compatible system at bad places is this predicate for each local datum

*API:*

- `IsWeightMonodromyPure` (data): The predicate IsWeightMonodromyPure D ρ w of the statement.
- `IsWeightMonodromyPure.monodromy_unique` (extensionality): If N and N′ both satisfy (a) (on possibly different open subgroups), then N = N′.
- `IsWeightMonodromyPure.frob_conj_monodromy` (relation): For Φ ∈ Fr: ρ(Φ) ∘ N ∘ ρ(Φ)⁻¹ = Q⁻¹ · N.
- `monodromyFiltration_mapsTo` (relation): ρ(Φ) maps M_j into M_j for every j (any Φ with ΦN = cNΦ, c ≠ 0).
- `isWeightMonodromyPure_iff_exists_frob` (characterisation): Under (a), condition (b) holds for all Φ ∈ Fr iff it holds for one Φ ∈ Fr.
- `isWeightMonodromyPure_rescale` (simp): Purity relative to c·D is purity relative to D (N is replaced by c⁻¹N, with the same filtration).
- `isWeightMonodromyPure_baseChange` (compatibility): For E ⊆ E′, ρ is pure of weight w iff ρ ⊗_E E′ is.
- `isWeightMonodromyPure_standard_iff_dwp5` (compatibility): For D = D_k, the predicate equals DeligneWeightsAndPurity DWP.5's weight–monodromy predicate (requested there).
- `isWeightMonodromyPure_of_finite_inertia` (characterisation): If ρ(I) is finite then N = 0, M is concentrated in degree 0, and purity means all eigenvalues of ρ(Φ) are Weil Q-numbers of weight w.
- `isWeightMonodromyPure_zero` (simp): The zero representation is pure of every weight.
- `IsWeightMonodromyPure.iso_iff` (equivalence): Purity is transported along isomorphisms of data (WM.0/transport-along-isomorphisms).
- `isWeightMonodromyPure_prod` (functoriality): Purity of ρ₁ ⊕ ρ₂ is purity of both (WM.0/direct-summands).
- `isWeightMonodromyPure_iff_restrict` (compatibility): Detection on a restricted datum (WM.0/detection-on-subgroups).
- `IsWeightMonodromyPure.dual` (functoriality): If ρ is pure of weight w then its contragredient (with monodromy −Nᵗ) is pure of weight −w (LPV.1/tensor-dual-and-symmetric-monodromy).
- `IsWeightMonodromyPure.tensor` (functoriality): Pure of weights w and w′ give a tensor product pure of weight w + w′ (convolution of monodromy filtrations, LPV.1).
- `IsWeightMonodromyPure.tateTwist` (functoriality): For the standard datum D_k, ρ(r) = ρ ⊗ χ_ℓ^r is pure of weight w − 2r. For a general datum the same conclusion needs a specified continuous character χ with χ|_I = 1 and χ(Φ) = Q⁻¹ for Φ ∈ Fr; no cyclotomic character of an arbitrary profinite group is assumed.

*Checks:*

- `isWeightMonodromyPure_cyclotomic_inv` (computation): For D = D_k, the character χ_ℓ⁻¹ (ℚ_ℓ(−1), geometric Frobenius acting by q) is pure of weight 2 with N = 0.
- `isWeightMonodromyPure_tate_curve` (computation): V = E² with basis e₀, e₁, ρ(Φ)e₀ = e₀, ρ(Φ)e₁ = q·e₁ for one geometric Frobenius, inertia acting on an open subgroup by exp(t(σ)N) with N e₁ = e₀, N e₀ = 0 (the dual Tate module of a Tate curve): M_{−1} = Ee₀, M_1 = V, gr_{−1} has eigenvalue 1 (weight 0 = 1 − 1) and gr_1 eigenvalue q (weight 2 = 1 + 1), so V is pure of weight 1.
- `isWeightMonodromyPure_zero` (degenerate): The zero representation is pure of every weight w.
- `not_isWeightMonodromyPure_semisimplification` (non-example): ℚ_ℓ ⊕ ℚ_ℓ(−1) with N = 0 is not pure of any weight: gr_0 has eigenvalues 1 and q of weights 0 and 2. Purity depends on N, not on the semisimplification.
- `isWeightMonodromyPure_standard_iff_dwp5` (compatibility): For D = D_k and every continuous ℓ-adic representation of G_k, the predicate agrees with DWP.5's weight–monodromy predicate, and with the same condition on the Frobenius-semisimple Weil–Deligne representation of ArithmeticGaloisRepresentations R01.2.

*Acceptance:*

- Scholze's Conjecture 9.3 for V = H^i(X_{k̄}, ℚ̄_ℓ) is purity of weight i relative to D_k.
- The ℓ-adic Tate module dual H¹ of a Tate elliptic curve over k is pure of weight 1 with N ≠ 0, while its semisimplification ℚ_ℓ ⊕ ℚ_ℓ(−1) with N = 0 is pure of no weight.

*Source:* Scholze 2012, §9, Proposition 9.1, Definition/Proposition 9.2 and Conjecture 9.3, pp. 307–308 — Grothendieck's quasi-unipotence gives N with ρ(σ) = exp(N t_ℓ(σ)) on an open subgroup of inertia; the monodromy filtration and its formula; the eigenvalue condition on gr_j for geometric Frobenius.; Scholze 2012, §9, the paragraph after Proposition 9.1, p. 307 — Changing Q_ℓ(1) ≅ Q_ℓ rescales N without effect, and NΦ = qΦN.

### Theorem: Weight–monodromy purity is detected on highly ramified closed subgroups — *Weight–monodromy after highly ramified base change*

Target `WM.0/detection-on-subgroups`.

Let k be a nonarchimedean local field with residue characteristic p, ℓ ≠ p, D_k its standard datum, and H′ ⊆ G_k a closed subgroup whose image in G_k/I_k is open and with t_ℓ(H′ ∩ I_k) ≠ 0. For every continuous representation ρ of G_k on a finite-dimensional vector space over a finite extension of ℚ_ℓ and every w ∈ ℤ: ρ is weight–monodromy pure of weight w relative to D_k if and only if ρ|_{H′} is pure of weight w relative to D_k|_{H′}. This applies to H′ = G_{k′} for k′/k finite; to H′ = G_{k_∞} for k p-adic and k_∞ = k(ϖ^{1/p^n} : n ≥ 1) (totally ramified, so the image is everything; a union of extensions of p-power degree, so t_ℓ(H′ ∩ I_k) = t_ℓ(I_k)); and to the closed subgroups G_{L₀} ⊆ G_{k″} of a characteristic-p local field k″ with L₀ an algebraic extension of k″ that is finite over the perfection of a finite extension of k″.

*Hypotheses:* Image of H′ in G_k/I_k ≅ ℤ̂ open; t_ℓ(H′ ∩ I_k) ≠ 0; ρ continuous on a finite-dimensional space over a finite extension of ℚ_ℓ.

*Proof outline:*

1. (a) holds for ρ by Grothendieck's monodromy theorem (ArithmeticGaloisRepresentations R01.2/canonical-local-monodromy-operator), with N and an open I₁ ⊆ I_k. Then I₁ ∩ H′ is open in H′ ∩ I_k and t_ℓ(I₁ ∩ H′) ≠ 0, so N also satisfies (a) for ρ|_{H′}; by uniqueness (WM.0/weight-monodromy-purity) it is the monodromy operator of the restriction, and the filtrations agree.
2. Let f be the index of the image of H′. Every Φ′ ∈ Fr′ is Φ^fτ with Φ ∈ Fr_k and τ ∈ I_k. On gr_j the inertia acts through a finite group normalised by ρ̄(Φ); as in the independence-of-Φ step of WM.0/weight-monodromy-purity, (ρ̄(Φ′))^M = ρ̄(Φ)^{fM} for some M ≥ 1.
3. Hence every eigenvalue α′ of ρ̄(Φ′) satisfies α′^M = α^{fM} for some eigenvalue α of ρ̄(Φ), and every eigenvalue α of ρ̄(Φ) satisfies α^{fM} = α′^M for some eigenvalue α′ of ρ̄(Φ′), because the eigenvalues of a power are the powers of the eigenvalues (DWP.0/spectra-of-polynomials-in-an-endomorphism); a Weil q-number of weight w + j has fM-th power a Weil q^{fM}-number of that weight, and conversely a number whose M-th power is a Weil (q^f)^M-number of weight w + j is a Weil q^f-number of that weight (DWP.0/weil-number-base-extension, DWP.0/weil-number-arithmetic). This gives both implications.
4. The three applications: for G_{k′} use WM.0/standard-local-datum; for k_∞, k(ϖ^{1/p^n})/k is totally ramified of degree p^n (Eisenstein polynomial X^{p^n} − ϖ), so the residue field of k_∞ is that of k and G_{k_∞} maps onto G_k/I_k, while the field cut out by t_ℓ over the maximal unramified extension has ℓ-power degrees, linearly disjoint from p-power ones, so t_ℓ(G_{k_∞} ∩ I_k) = ℤ_ℓ; for perfections in characteristic p, a purely inseparable extension does not change the absolute Galois group (PerfectoidSpaces:P3/finite-etale-under-completed-perfection), reducing to a finite extension.

*Prerequisites:* WM.0/weight-monodromy-purity (Weight–monodromy purity relative to a local monodromy datum); WM.0/restricted-local-datum (Restriction of a local monodromy datum to a highly ramified closed subgroup); WM.0/standard-local-datum (The standard local monodromy datum of a local field); ArithmeticGaloisRepresentations:R01.2/canonical-local-monodromy-operator; DeligneWeightsAndPurity:DWP.0/weil-number-base-extension; DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic; DeligneWeightsAndPurity:DWP.0/spectra-of-polynomials-in-an-endomorphism; PerfectoidSpaces:P3/finite-etale-under-completed-perfection; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions.

*Acceptance:*
- Scholze 2012, remark after Conjecture 9.3, p. 308: to prove the conjecture one may replace k by a finite extension.
- Scholze 2012, proof of Theorem 9.6, first paragraph, p. 309: purity can be checked on G_K for K the completion of k(ϖ^{1/p^∞}).
- Non-example: for H′ = G_{k(ϖ^{1/ℓ^∞})}, t_ℓ vanishes on H′ ∩ I_k, so the restricted datum is not defined; the restriction of the Tate-curve representation of WM.0/weight-monodromy-purity has inertia acting trivially on an open subgroup of H′ ∩ I_k, and on it geometric Frobenius has eigenvalues 1 and q on the whole space. The theorem fails without condition (b).

*Source:* Scholze 2012, §9, remark after Conjecture 9.3, p. 308 — Finite extensions of k may be used.; Scholze 2012, §9, proof of Theorem 9.6, first paragraph, p. 309 — Restriction to G_K detects the conjecture: totally ramified and pro-p.

### Theorem: Purity is transported along isomorphisms of local monodromy data

Target `WM.0/transport-along-isomorphisms`.

Let α : D → D′ be an isomorphism of local monodromy data with constant c ∈ ℚ_ℓ^× (t′∘α = c·t), and ρ′ a continuous ℓ-adic representation of H′. Then ρ′ is weight–monodromy pure of weight w relative to D′ if and only if ρ′∘α is pure of weight w relative to D. The monodromy operators are related by N_{ρ′∘α} = c·N_{ρ′}.

*Hypotheses:* α an isomorphism of data (topological group isomorphism matching inertia, Frobenius sets and Q, scaling t by c ≠ 0).

*Proof outline:*

1. If ρ′(σ′) = exp(t′(σ′)N′) on an open I′₁ ⊆ I′, then for σ ∈ α⁻¹(I′₁), open in I, ρ′(α(σ)) = exp(c·t(σ)N′) = exp(t(σ)·cN′): condition (a) holds with N = cN′.
2. N and cN′ have the same kernels and images of powers, so the same monodromy filtration (LPV.1/monodromy-filtration is invariant under nonzero scaling).
3. α(Fr) = Fr′ and Q = Q′, so condition (b) is literally the same; the converse uses α⁻¹ with constant c⁻¹.

*Prerequisites:* WM.0/weight-monodromy-purity (Weight–monodromy purity relative to a local monodromy datum); WM.0/local-monodromy-datum (Local monodromy data and their isomorphisms); LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration.

*Acceptance:*
- Applied to the tilting isomorphism G_L ≅ G_{L♭} of WM.2/monodromy-data-match.
- For c·D ≅ D through the identity this is isWeightMonodromyPure_rescale.

*Source:* Scholze 2012, §9, the paragraph after Proposition 9.1, p. 307 — Rescaling N has no effect on the discussion.; Scholze 2012, §9, proof of Theorem 9.6, first paragraph, p. 309 — Weights and N are compatible with the isomorphism of Galois groups.

### Theorem: Purity passes to stable direct summands, not to subrepresentations

Target `WM.0/direct-summands`.

Let D be a local monodromy datum and ρ = ρ₁ ⊕ ρ₂ a direct sum of continuous ℓ-adic representations of H. Then ρ is weight–monodromy pure of weight w relative to D if and only if ρ₁ and ρ₂ both are. In particular an H-stable direct summand of a pure representation is pure of the same weight. A subrepresentation that is not a direct summand need not be pure of that weight.

*Hypotheses:* Finite-dimensional continuous representations over a finite extension of ℚ_ℓ.

*Proof outline:*

1. If ρ satisfies (a) with N, the H-equivariant projections e₁, e₂ commute with ρ(σ) for σ ∈ I₁, hence with log ρ(σ) = t(σ)N; so N = N₁ ⊕ N₂ and each ρ_i satisfies (a). Conversely N₁ ⊕ N₂ works for ρ on I₁ ∩ I₂.
2. The monodromy filtration of N₁ ⊕ N₂ is the direct sum of the filtrations: the formula M_j = Σ_{a−b=j} ker N^{a+1} ∩ im N^b is compatible with direct sums (LPV.1/monodromy-filtration).
3. So gr_j(ρ) = gr_j(ρ₁) ⊕ gr_j(ρ₂) compatibly with ρ(Φ), and the eigenvalues on gr_j are the union of those of the summands (DWP.0/purity-under-subquotients-and-extensions for the eigenvalue bookkeeping).

*Prerequisites:* WM.0/weight-monodromy-purity (Weight–monodromy purity relative to a local monodromy datum); LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration; DeligneWeightsAndPurity:DWP.0/purity-under-subquotients-and-extensions.

*Acceptance:*
- Non-example: in the Tate-curve representation V of WM.0/weight-monodromy-purity (pure of weight 1), the subrepresentation ker N = E·e₀ has N = 0 and Frobenius eigenvalue 1, so it is pure of weight 0, not 1: it is not a direct summand.
- Used in Scholze 2012, final paragraph of the proof of Theorem 9.6, p. 311, for H^i(Y) ⊆ H^i(Z′).

*Source:* Scholze 2012, §9, final paragraph of the proof of Theorem 9.6, p. 311 — A direct summand of a representation satisfying the conjecture satisfies it.

### Definition: The weight–monodromy conjecture for a proper smooth variety — *Weight–monodromy conjecture*

Target `WM.0/weight-monodromy-conjecture`.

Let k be a nonarchimedean local field with residue characteristic p, ℓ ≠ p, and X a proper smooth variety over k. For i ∈ ℤ, WMC_ℓ(X, i) is the statement that the continuous G_k-representation H^i(X_{k̄}, ℚ̄_ℓ) (étale cohomology of the base change to an algebraic closure, with its Galois action; SchemeAndStackFoundations SF.2) is weight–monodromy pure of weight i relative to D_k. 'The weight–monodromy conjecture holds for X' (at ℓ) means WMC_ℓ(X, i) for every i; only 0 ≤ i ≤ 2 dim X matter, the other groups being zero. Deligne's Conjecture 9.3 asserts this for every such X; this roadmap proves it in equal characteristic for varieties defined over a global function field (WM.1) and for toric set-theoretic complete intersections over p-adic fields (WM.4).

*Hypotheses:* X proper and smooth over k; ℓ ≠ p; cohomology with its continuous G_k-action.

*Proof outline:*

1. H^i(X_{k̄}, ℤ/ℓ^m) is finite with a continuous action of G_k by transport of structure, the inverse limit is a finitely generated ℤ_ℓ-module, and its tensor product with ℚ̄_ℓ is a continuous representation defined over a finite extension of ℚ_ℓ (requested from SchemeAndStackFoundations SF.2).
2. The predicate of WM.0/weight-monodromy-purity applies, with weight i.

*Prerequisites:* WM.0/weight-monodromy-purity (Weight–monodromy purity relative to a local monodromy datum); WM.0/standard-local-datum (The standard local monodromy datum of a local field); SchemeAndStackFoundations:SF.2.

*Used in:*

- Scholze 2012, §9, Conjecture 9.3, p. 308, and Conjecture 1.14, p. 250: the statement of the conjecture
- WM.4/weight-monodromy-toric-complete-intersections: Theorem 9.6 proves it for toric set-theoretic complete intersections
- WM.1/deligne-curve-theorem: Theorem 9.4 is it for X_k with k of characteristic p and X defined over a curve

*API:*

- `WeightMonodromyConjecture` (data): The predicate WMC_ℓ(X) = ∀ i, WMC_ℓ(X, i).
- `weightMonodromyConjecture_iff_forall_degree` (characterisation): WMC_ℓ(X) iff WMC_ℓ(X, i) for 0 ≤ i ≤ 2 dim X.
- `weightMonodromyConjecture_baseChange` (compatibility): WMC_ℓ(X) iff WMC_ℓ(X_{k′}) for a finite extension k′/k (WM.0/finite-extension-invariance).
- `weightMonodromyConjecture_of_goodReduction` (compatibility): A proper smooth model over O_k gives WMC_ℓ(X) for every ℓ ≠ p (WM.0/good-reduction-case).
- `weightMonodromyConjecture_degree_zero` (simp): WMC_ℓ(X, 0) holds: H⁰ is the permutation representation on geometric connected components, with finite image, so all eigenvalues are roots of unity.
- `weightMonodromyConjecture_disjointUnion` (functoriality): WMC_ℓ(X ⊔ X′) iff WMC_ℓ(X) and WMC_ℓ(X′) (WM.0/direct-summands).
- `weightMonodromyConjecture_spec` (example): WMC_ℓ(Spec k) holds.

*Checks:*

- `weightMonodromyConjecture_projectiveSpace` (computation): WMC_ℓ(ℙ^n_k) holds, with H^{2r}(ℙ^n_{k̄}, ℚ̄_ℓ) = ℚ̄_ℓ(−r) of weight 2r.
- `weightMonodromyConjecture_spec` (degenerate): WMC_ℓ(Spec k) holds: H⁰ = ℚ̄_ℓ with trivial action, weight 0.
- `weightMonodromyConjecture_goodReduction_iff_weil` (compatibility): If X has a proper smooth model 𝒳 over O_k, WMC_ℓ(X, i) is equivalent to the purity of H^i(𝒳_{𝔽̄_q}, ℚ̄_ℓ) of weight i (Deligne's Weil conjectures), since N = 0 and the action factors through Gal(𝔽̄_q/𝔽_q).
- `not_weightMonodromy_of_semisimplification` (non-example): The representation ℚ̄_ℓ ⊕ ℚ̄_ℓ(−1) with trivial inertia, which is the semisimplification of H¹ of a Tate curve, is not pure of weight 1: the conjecture concerns H^i with its monodromy operator, not its semisimplification.

*Acceptance:*

- ℙ^n_k satisfies the conjecture: H^{2r} = ℚ̄_ℓ(−r), odd degrees vanish, N = 0 and geometric Frobenius acts by q^r.
- The L-function interpretation recorded after Conjecture 9.3 (no poles of real part greater than i/2 for the local factors of H^i at bad places) is a consequence, not part of the definition.

*Source:* Scholze 2012, §9, Conjecture 9.3 and the paragraph after it, p. 308 — The conjecture for V = H^i(X_{k̄}, ℚ̄_ℓ) and its L-function interpretation.; Scholze 2012, §1, Conjecture 1.14, p. 250 — The same conjecture in the introduction.

### Theorem: The weight–monodromy conjecture is invariant under finite extension of the base field

Target `WM.0/finite-extension-invariance`.

Let X be a proper smooth variety over a nonarchimedean local field k with residue characteristic p, ℓ ≠ p, and k′/k a finite extension. For every i, WMC_ℓ(X, i) holds if and only if WMC_ℓ(X_{k′}, i) holds.

*Hypotheses:* k′/k finite; X proper smooth over k.

*Proof outline:*

1. Choose k̄′ = k̄. Then (X_{k′})_{k̄} = X_{k̄}, and the G_{k′}-representation H^i((X_{k′})_{k̄}, ℚ̄_ℓ) is the restriction of the G_k-representation H^i(X_{k̄}, ℚ̄_ℓ) to the open subgroup G_{k′} (functoriality of the Galois action, SchemeAndStackFoundations SF.2, requested).
2. By WM.0/standard-local-datum, D_k|_{G_{k′}} = e·D_{k′}, isomorphic to D_{k′} through the identity with constant e⁻¹ (WM.0/transport-along-isomorphisms).
3. By WM.0/detection-on-subgroups with H′ = G_{k′}, purity of weight i for D_k is equivalent to purity for D_k|_{G_{k′}}, hence for D_{k′}.

*Prerequisites:* WM.0/weight-monodromy-conjecture (The weight–monodromy conjecture for a proper smooth variety); WM.0/detection-on-subgroups (Weight–monodromy purity is detected on highly ramified closed subgroups); WM.0/transport-along-isomorphisms (Purity is transported along isomorphisms of local monodromy data); WM.0/standard-local-datum (The standard local monodromy datum of a local field); SchemeAndStackFoundations:SF.2.

*Acceptance:*

- Scholze 2012, remark after Conjecture 9.3, p. 308: one is allowed to replace k by a finite extension.
- For X an elliptic curve with potentially good reduction, WMC holds over k because it holds over the finite extension where it acquires good reduction (WM.0/good-reduction-case).

*Source:* Scholze 2012, §9, remark after Conjecture 9.3, p. 308 — To prove the conjecture one may replace k by a finite extension.

### Application: Proper smooth varieties with good reduction satisfy the weight–monodromy conjecture

Target `WM.0/good-reduction-case`.

Let k be a nonarchimedean local field with ring of integers O_k and residue field 𝔽_q, ℓ ≠ p, and X a proper smooth variety over k admitting a proper smooth model 𝒳 over O_k. Then for every i, H^i(X_{k̄}, ℚ̄_ℓ) is unramified, N = 0, and it is weight–monodromy pure of weight i; that is, the conjecture holds for X.

*Hypotheses:* 𝒳 → Spec O_k proper and smooth with generic fibre X.

*Proof outline:*

1. Smooth and proper base change (SchemeAndStackFoundations SF.2, requested) gives a G_k-equivariant isomorphism H^i(X_{k̄}, ℤ/ℓ^m) ≅ H^i(𝒳_{𝔽̄_q}, ℤ/ℓ^m), with G_k acting through G_k → Gal(𝔽̄_q/𝔽_q); hence I_k acts trivially and N = 0, and the monodromy filtration is concentrated in degree 0.
2. A geometric Frobenius lift acts as the geometric Frobenius of 𝒳_{𝔽_q}, whose eigenvalues on H^i are Weil q-numbers of weight i by Deligne's theorem (DeligneWeightsAndPurity DWP.7 for proper smooth varieties; DWP.4 in the projective case).
3. Conclude with isWeightMonodromyPure_of_finite_inertia (WM.0/weight-monodromy-purity).

*Prerequisites:* WM.0/weight-monodromy-conjecture (The weight–monodromy conjecture for a proper smooth variety); WM.0/weight-monodromy-purity (Weight–monodromy purity relative to a local monodromy datum); SchemeAndStackFoundations:SF.2; DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11; DeligneWeightsAndPurity:DWP.4/smooth-projective-purity.

*Acceptance:*

- ℙ^n_k, abelian varieties with good reduction, and smooth hypersurfaces of ℙ^n_k whose equation reduces to a smooth equation modulo ϖ.
- A Tate elliptic curve has no good model and its H¹ has N ≠ 0; the theorem does not apply, while WMC still holds (classical curve case, and Theorem 9.6 for plane cubics).

*Source:* Scholze 2012, §9, the paragraph after Conjecture 9.3, p. 308 — At primes of good reduction the Weil conjectures give the expected weights.

## Layer WM.1: Deligne's weight–monodromy theorem in equal characteristic

Prove Scholze's Theorem 9.4 (Deligne, Weil II) in the form consumed: for a smooth curve C over 𝔽_q, a closed point x, the local field k of C at x and a proper smooth scheme X over C ∖ {x}, the weight–monodromy conjecture holds for X_k. The proof applies DWP.5's local weight theorem on a curve to the lisse sheaf R^i f_*ℚ̄_ℓ, which is punctually pure of weight i by DWP.4/DWP.7, after identifying its local Weil representation at x with H^i(X_{k^s}, ℚ̄_ℓ) by smooth proper base change.

Deduce the form used by WM.4: for a global function field F with a place v, completion F_v, and a proper smooth variety Z over F, H^i(Z_{F^s}, ℚ̄_ℓ) restricted to a decomposition group G_{F_v} ⊆ G_F is weight–monodromy pure of weight i for every i (spreading out Z over a dense open of the smooth projective curve of F; good reduction at v gives N = 0).

**Dependencies:** WM.0; DWP.4, DWP.5, DWP.7; SF.0 (spreading out); SF.2 (smooth proper base change).
**Sources:** Scholze 2012, §9, Theorem 9.4, the summary of its proof and Lemma 9.5, pp. 308–309.

### Theorem: Deligne's weight–monodromy theorem over local fields of curves — *Deligne's equal-characteristic weight–monodromy theorem*

Target `WM.1/deligne-curve-theorem`.

Let C be a smooth curve over 𝔽_q, x a closed point of C with residue field κ(x) of cardinality q_x, k the local field of C at x (the fraction field of the completed local ring), and f : X → C ∖ {x} a proper smooth morphism. Then for every prime ℓ ≠ p and every i, the weight–monodromy conjecture WMC_ℓ(X_k, i) holds for the proper smooth k-variety X_k = X ×_{C∖{x}} Spec k: H^i(X_{k̄}, ℚ̄_ℓ) is pure of weight i relative to D_k (with Q = q_x).

*Hypotheses:* C smooth over 𝔽_q; x a closed point; f proper and smooth over C ∖ {x}; ℓ ≠ p.

*Proof outline:*

1. ℱ = R^i f_*ℚ̄_ℓ is a lisse sheaf on U = C ∖ {x}, and its formation commutes with base change (smooth and proper base change, SchemeAndStackFoundations SF.2, requested). Its local Weil representation at the missing point x is the stalk at a geometric point over Spec k with the action of the decomposition group, which is H^i(X_{k^s}, ℚ̄_ℓ) with its G_k-action; the completion and the henselisation of the local ring at x have the same absolute Galois group (PerfectoidSpaces:P3/henselian-finite-etale-approximation).
2. ℱ is punctually pure of weight i: at a closed point u ∈ U, ℱ_ū = H^i(X_ū, ℚ̄_ℓ), and the geometric Frobenius eigenvalues are Weil q_u-numbers of weight i by Deligne's theorem for proper smooth varieties over finite fields (DeligneWeightsAndPurity DWP.7; DWP.4 for projective fibres).
3. For every field isomorphism ι : ℚ̄_ℓ ≅ ℂ, DeligneWeightsAndPurity:DWP.5/local-monodromy-purity applied to ℱ (ι-pure of weight β = i) gives: on the monodromy filtration of the local monodromy operator, Gr_j^M is ι-pure of weight i + j relative to q_x, with geometric Frobenius satisfying FNF⁻¹ = q_x⁻¹N. (DWP.5's proof uses Lemma 9.5 of Scholze, Weil II 1.8.4.)
4. An eigenvalue that is ι-pure of weight w for every ι is algebraic and a Weil q_x-number of weight w (DeligneWeightsAndPurity:DWP.0/weil-number-iff-iota-pure-for-every-iota). DWP.5's N, filtration and geometric Frobenius are those of D_k (WM.0/weight-monodromy-purity, compatibility with DWP.5), so WMC_ℓ(X_k, i) holds.
5. Scholze states Theorem 9.4 for a rational missing point. For a closed point of degree a, extend constants to κ(x) and take a component containing a point above x; its completion is k and its residue cardinality is q_x = q^a. Apply the rational-point form there; the supplier local-weight theorem also permits closed points directly.

*Prerequisites:* WM.0/weight-monodromy-conjecture (The weight–monodromy conjecture for a proper smooth variety); WM.0/weight-monodromy-purity (Weight–monodromy purity relative to a local monodromy datum); DeligneWeightsAndPurity:DWP.5/local-monodromy-purity; DeligneWeightsAndPurity:DWP.0/weil-number-iff-iota-pure-for-every-iota; DeligneWeightsAndPurity:DWP.7/hodge-type-triangles-and-proper-smooth-purity-3-3-7-3-3-11; DeligneWeightsAndPurity:DWP.4/smooth-projective-purity; PerfectoidSpaces:P3/henselian-finite-etale-approximation; SchemeAndStackFoundations:SF.2.

*Used in:*

- WM.1/function-field-varieties: applied after spreading out over a curve

*Acceptance:*

- Scholze 2012, Theorem 9.4, p. 308.
- For the Legendre family y² = x(x − 1)(x − λ) over C = ℙ¹_{𝔽_q} ∖ {1, ∞}, p odd, at x = (λ = 0): H¹ of the generic fibre over k = 𝔽_q((λ)) has N ≠ 0, Gr_{−1} of weight 0 and Gr_1 of weight 2.
- Points of good reduction (f extends smoothly over x) give N = 0 and purity of weight i, matching WM.0/good-reduction-case.

*Source:* Scholze 2012, §9, Theorem 9.4 and the summary of its proof, pp. 308–309 — The equal-characteristic theorem and its proof: R^i f_* pure of weight i, semicontinuity of weights on inertia invariants, tensor powers, Lemma 9.5.; Scholze 2012, §9, Lemma 9.5, p. 309 — The linear-algebra criterion, applied inside DWP.5.

### Theorem: Weight–monodromy for proper smooth varieties over global function fields at every place — *Weight–monodromy over global function fields*

Target `WM.1/function-field-varieties`.

Let F be a global function field of characteristic p, v a place of F with completion F_v, fix an F-embedding of a separable closure F^s into a separable closure of F_v, so that G_{F_v} ⊆ G_F is a decomposition group at v, and let Z be a proper smooth variety over F. Then for every prime ℓ ≠ p and every i, the restriction to G_{F_v} of the G_F-representation H^i(Z_{F^s}, ℚ̄_ℓ) is weight–monodromy pure of weight i relative to D_{F_v}; equivalently, WMC_ℓ(Z_{F_v}) holds.

*Hypotheses:* F finitely generated of transcendence degree 1 over 𝔽_p; Z proper and smooth over F; ℓ ≠ p.

*Proof outline:*

1. Let C be the smooth projective curve over a finite field with function field F. Spread Z out to a proper smooth 𝒵 → U over a dense open U ⊆ C (SchemeAndStackFoundations:SF.0/spreading-out-models).
2. If v ∈ U, 𝒵 ×_U Spec O_v is a proper smooth model of Z_{F_v}: apply WM.0/good-reduction-case. Otherwise put C′ = U ∪ {v}, an open subcurve, so that 𝒵 is proper smooth over C′ ∖ {v}; apply WM.1/deligne-curve-theorem with x = v.
3. H^i(Z_{F^s}, ℚ̄_ℓ) restricted to G_{F_v} is H^i(Z_{F_v^s}, ℚ̄_ℓ), by invariance of étale cohomology of proper varieties under extension of separably closed fields (SchemeAndStackFoundations SF.2, requested).

*Prerequisites:* WM.1/deligne-curve-theorem (Deligne's weight–monodromy theorem over local fields of curves); WM.0/good-reduction-case (Proper smooth varieties with good reduction satisfy the weight–monodromy conjecture); SchemeAndStackFoundations:SF.0/spreading-out-models; SchemeAndStackFoundations:SF.2.

*Used in:*

- WM.4/weight-monodromy-toric-complete-intersections: the tilted approximation Z′ is projective smooth over a global function field k₁ and is tested at the place v induced by L♭

*Acceptance:*

- For Z = ℙ^n_F the representation is unramified and pure at every place.
- This is the input 'By Deligne's theorem H^i(Z′) satisfies the weight–monodromy conjecture' in the last paragraph of the proof of Scholze's Theorem 9.6, p. 311, with Z′ projective smooth over a global function field.

*Source:* Scholze 2012, §9, Theorem 9.4, p. 308, and the final paragraph of the proof of Theorem 9.6, p. 311 — Deligne's theorem applied to a projective smooth variety defined over a global field of characteristic p.

## Layer WM.2: Tilting the Kummer tower: Galois groups, inertia, Frobenius and N

For a p-adic local field k with uniformiser ϖ and residue field 𝔽_q, prove that K, the completion of k_∞ = k(ϖ^{1/p^n} : n ≥ 1), is a perfectoid field with residue field 𝔽_q, and that its tilt is the completed perfection of k′ = 𝔽_q((t)) with t = ϖ♭ = (ϖ, ϖ^{1/p}, …) and t♯ = ϖ. Construct the chain G_{k_∞} ≅ G_K ≅ G_{K♭} ≅ G_{k′} (Krasner, Fontaine–Wintenberger, perfection), and the same for every finite extension L/K and its tilt L♭.

Prove that tilting identifies the residue fields of C = K̂̄ and C♭ and the groups μ_{ℓ^∞}(C♭) ≅ μ_{ℓ^∞}(C) through ♯, Galois-equivariantly. Deduce that G_L ≅ G_{L♭} is an isomorphism of the local monodromy data restricted from G_k and from G_{k″}, for a closed characteristic-p local field k″ ⊆ L♭ containing t, with L♭ the completion of an algebraic extension finite over the perfection of a finite extension of k″: inertia corresponds to inertia, geometric Frobenius to geometric Frobenius, Q to Q, and the ℓ-adic tame characters agree up to a nonzero ℓ-adic scalar. Prove the transfer criterion: if V|_{G_L} is G_L-isomorphic to a direct summand of W|_{G_{L♭}} with W weight–monodromy pure of weight i for G_{k″}, then V is weight–monodromy pure of weight i for G_k.

**Dependencies:** WM.0; PerfectoidSpaces P1 (perfectoid fields, tilts), P3 (Fontaine–Wintenberger, completion and perfection invariance); LocalFieldsRamification Layers 0, 2, 4.
**Sources:** Scholze 2012, §9, first paragraph of the proof of Theorem 9.6, p. 309; §1, Theorems 1.1 and 1.3, pp. 245–246; §3, Theorem 3.7.

### Theorem: The Kummer tower of a p-adic local field and its tilt — *Tilt of the Kummer tower*

Target `WM.2/kummer-perfectoid-field`.

Let k be a finite extension of ℚ_p with uniformiser ϖ and residue field 𝔽_q, fix a compatible system (ϖ^{1/p^n})_{n≥0} of p-power roots of ϖ in an algebraic closure k̄, let k_∞ = ∪_n k(ϖ^{1/p^n}) and let K be the completion of k_∞. Then: (i) k(ϖ^{1/p^n})/k is totally ramified of degree p^n with uniformiser ϖ^{1/p^n}, so k_∞ has residue field 𝔽_q and value group |ϖ|^{ℤ[1/p]}; (ii) K is a perfectoid field, with O_K/ϖ ≅ 𝔽_q[T^{1/p^∞}]/(T) via T ↦ ϖ; (iii) t := ϖ♭ = (ϖ, ϖ^{1/p}, ϖ^{1/p²}, …) ∈ O_{K♭} satisfies t♯ = ϖ, and O_{K♭} is the t-adic completion of 𝔽_q[t^{1/p^∞}], so K♭ is the completed perfection of k′ := 𝔽_q((t)), and the perfection k′^{perf} and 𝔽_q(t)^{perf} = ∪_n 𝔽_q(t^{1/p^n}) are dense in K♭.

*Hypotheses:* k a finite extension of ℚ_p; ϖ a uniformiser; a fixed compatible system of p-power roots.

*Proof outline:*

1. X^{p^n} − ϖ is Eisenstein over O_k, so k(ϖ^{1/p^n}) is totally ramified of degree p^n with ring of integers O_k[ϖ^{1/p^n}] (LocalFieldsRamification Layer 0, totally ramified extensions).
2. The quotient by ϖ is 𝔽_q[T^{1/p^∞}]/(T), unchanged on completion. To check the supplier definition, verify Frobenius on O_K/p as well: approximate x ∈ O_K modulo p by x_n ∈ O_{k(ϖ^{1/p^n})}. Expand x_n modulo p as a finite sum Σ [a_i](ϖ^{1/p^n})^i using the multiplicative Teichmüller representatives of 𝔽_q supplied by LocalFieldsRamification Layer 1 (TauCeti.teichmullerLift, extended by zero). Then y = Σ [a_i^{1/p}](ϖ^{1/p^{n+1}})^i satisfies y^p ≡ x_n mod p. Thus Frobenius O_K/p → O_K/p is surjective. The completed union is nondiscretely valued and complete, so it is perfectoid (PerfectoidSpaces:P1/perfectoid-field-definition).
3. O_{K♭} = lim_{x↦x^p} O_K/ϖ = lim_{x↦x^p} 𝔽_q[T^{1/p^∞}]/(T); the element (ϖ^{1/p^n} mod ϖ)_n is t, and the limit is the t-adically completed 𝔽_q[t^{1/p^∞}]; t♯ = lim (ϖ^{1/p^n})^{p^n} = ϖ (PerfectoidSpaces:P1/tilt-of-perfectoid-field, whose acceptance example is k = ℚ_p).
4. Density: every element of O_{K♭} is a t-adic limit of elements of 𝔽_q[t^{1/p^∞}] ⊆ 𝔽_q(t)^{perf} ⊆ k′^{perf}.

*Prerequisites:* PerfectoidSpaces:P1/perfectoid-field-definition; PerfectoidSpaces:P1/tilt-of-perfectoid-field; Tau Ceti roadmap LocalFieldsRamification, layer 0 local fields and their finite extensions; Tau Ceti roadmap LocalFieldsRamification, layer 1 units the filtration and the multiplicative group.

*Used in:*

- Scholze 2012, §9, proof of Theorem 9.6, first paragraph, p. 309: K is perfectoid and K♭ is the completed perfection of 𝔽_q((t)), t = ϖ♭

*Acceptance:*

- For k = ℚ_p this is the example K = completion of ℚ_p(p^{1/p^∞}), K♭ = 𝔽_p((t^{1/p^∞}))^∧, t♯ = p (Scholze 2012, Theorem 1.1 and the paragraph after it).
- Non-example: the fields k(ϖ^{1/p^n}) themselves are not perfectoid (discretely valued); only the completed union is.

*Source:* Scholze 2012, §9, proof of Theorem 9.6, first paragraph, p. 309 — K, the completion of k(ϖ^{1/p^∞}), is perfectoid, and K♭ is the completed perfection of 𝔽_q((t)) with t = ϖ♭.; Scholze 2012, §1, Theorem 1.1 and the paragraph after it, pp. 245–246 — The case k = ℚ_p.

### Theorem: Galois groups of the Kummer tower, its completion, its tilt and 𝔽_q((t)) — *Galois groups of K and 𝔽_q((t))*

Target `WM.2/galois-group-identification`.

In the setting of WM.2/kummer-perfectoid-field, let C be the completion of an algebraic closure K̄ of K (so k̄ ⊆ K̄ is the algebraic closure of k), and C♭ its tilt, an algebraically closed perfectoid field containing K♭; let K♭^s and k′^s be the separable closures of K♭ and of k′ = 𝔽_q((t)) in C♭. Then: (i) restriction G_K → G_{k_∞} ⊆ G_k is an isomorphism of profinite groups onto the closed subgroup G_{k_∞}; (ii) there is an isomorphism β : G_K → G_{K♭}, σ ↦ σ♭, where σ acts continuously on C and σ♭ acts on C♭ = lim_{x↦x^p} C componentwise, characterised by (σ♭x)♯ = σ(x♯) for x ∈ C♭; (iii) restriction G_{K♭} → G_{k′} is an isomorphism; (iv) for every finite extension L/K inside K̄, with tilt L♭ ⊆ C♭ a finite extension of K♭ of the same degree, β restricts to G_L ≅ G_{L♭}, and every finite extension of K♭ inside C♭ arises this way.

*Hypotheses:* k p-adic; K, K♭, C, C♭ as in the statement; closures fixed inside C and C♭.

*Proof outline:*

1. (i) k_∞ is henselian (an algebraic extension of the complete field k), so finite étale algebras over k_∞ and over its completion K correspond, and restriction is an isomorphism of absolute Galois groups (PerfectoidSpaces:P3/henselian-finite-etale-approximation (b); Krasner).
2. (ii) and (iv): Fontaine–Wintenberger for the perfectoid field K (PerfectoidSpaces:P3/fontaine-wintenberger), with finite extensions handled by PerfectoidSpaces:P3/finite-extensions-of-perfectoid-fields; the formula (σ♭x)♯ = σ(x♯) follows from the componentwise action and x♯ = x^{(0)}.
3. (iii) K♭ is the completion of k′^{perf}, an algebraic (purely inseparable, then henselian) extension of k′: completion does not change the absolute Galois group (PerfectoidSpaces:P3/henselian-finite-etale-approximation) and a purely inseparable extension does not either (PerfectoidSpaces:P3/finite-etale-under-completed-perfection).

*Prerequisites:* WM.2/kummer-perfectoid-field (The Kummer tower of a p-adic local field and its tilt); PerfectoidSpaces:P3/fontaine-wintenberger; PerfectoidSpaces:P3/finite-extensions-of-perfectoid-fields; PerfectoidSpaces:P3/henselian-finite-etale-approximation; PerfectoidSpaces:P3/finite-etale-under-completed-perfection; mathlib:Field.absoluteGaloisGroup; mathlib:Field.absoluteGaloisGroup.mapOfAlgebra.

*Used in:*
- Scholze 2012, §9, proof of Theorem 9.6, p. 309: isomorphism between the absolute Galois groups of K and k′, and the action of G = G_K = G_{K♭} on the diagram of étale topoi

*Acceptance:*
- Scholze 2012, Theorem 1.1: G_{ℚ_p(p^{1/p^∞})} ≅ G_{𝔽_p((t))}, the case k = ℚ_p.
- The composite G_{k_∞} ≅ G_K ≅ G_{K♭} ≅ G_{k′} is the isomorphism 'between the absolute Galois groups of K and k′' of the proof of Theorem 9.6.

*Source:* Scholze 2012, §9, proof of Theorem 9.6, first paragraph, p. 309 — G_K ≅ G_{k′} through the tilt.; Scholze 2012, §1, Theorem 1.3, p. 246 — G_K ≅ G_{K♭} for every perfectoid field K.

### Theorem: Tilting identifies residue fields and prime-to-p roots of unity, equivariantly

Target `WM.2/residue-fields-and-roots-of-unity`.

Let C be an algebraically closed perfectoid field with tilt C♭ and sharp map ♯ : C♭ → C. (i) The ring map O_{C♭} → O_C/p, x ↦ x♯ mod p, induces an isomorphism of residue fields κ(C♭) ≅ κ(C). (ii) For every prime ℓ ≠ p and n ≥ 1, ♯ restricts to a group isomorphism μ_{ℓ^n}(C♭) ≅ μ_{ℓ^n}(C), compatible as n varies, hence an isomorphism ℤ_ℓ(1)_{C♭} ≅ ℤ_ℓ(1)_C. (iii) Both isomorphisms are equivariant for every continuous automorphism σ of C and the induced automorphism σ♭ of C♭; in particular the ℓ-adic cyclotomic characters of G_K and G_{K♭} correspond under β of WM.2/galois-group-identification, and so do the actions on the residue field 𝔽̄_q.

*Hypotheses:* C algebraically closed perfectoid of residue characteristic p; ℓ ≠ p.

*Proof outline:*

1. (i) O_{C♭} = lim_{x↦x^p} O_C/p and the projection to the first factor is x ↦ x♯ mod p; it is surjective onto O_C/p (Frobenius is surjective) and |x♯| = |x|, so the preimage of the maximal ideal is the maximal ideal of O_{C♭}; both residue fields are the residue field of O_C/p (PerfectoidSpaces:P1/tilt-of-perfectoid-field).
2. (ii) ♯ is multiplicative, so it maps μ_{ℓ^n}(C♭) into μ_{ℓ^n}(C). If x ∈ μ_{ℓ^n}(C♭) has x♯ = x^{(0)} = 1, then each coordinate x^{(m)} has order dividing both p^m (as (x^{(m)})^{p^m} = x^{(0)} = 1) and ℓ^n, hence x = 1. Both groups have order ℓ^n because C and C♭ are algebraically closed of characteristic prime to ℓ, so ♯ is bijective.
3. (iii) The action of σ on C♭ is componentwise, so (σ♭x)♯ = σ(x♯); both identifications are defined through ♯.

*Prerequisites:* PerfectoidSpaces:P1/tilt-of-perfectoid-field; PerfectoidSpaces:P3/finite-extensions-of-perfectoid-fields.

*Acceptance:*

- For C = ℂ_p and ℓ ≠ p, the compatible system (ζ_{ℓ^n}) ∈ ℤ_ℓ(1)_{ℂ_p} has a unique preimage in ℤ_ℓ(1)_{ℂ_p♭}.
- Non-example in mixed characteristic: μ_{p^n}(C♭) = {1}, whereas μ_{p^n}(C) has p^n elements, so ♯ is not surjective on these root-of-unity groups. The element ε = (1, ζ_p, ζ_{p²}, …) has ε♯ = 1 and ε ≠ 1, but has infinite order in C♭; it witnesses noninjectivity on the full multiplicative group, not on p-power torsion.

*Source:* Scholze 2012, §9, proof of Theorem 9.6, first paragraph, p. 309 — The compatibility of weights (residue field action) and N (ℓ-power roots of unity) with the isomorphism of Galois groups is asserted there; this target supplies the two identifications behind it.

### Theorem: Tilting matches inertia, Frobenius, q and the tame character — *Weights and monodromy under tilting*

Target `WM.2/monodromy-data-match`.

In the setting of WM.2/galois-group-identification, let L/K be a finite extension inside K̄ with tilt L♭ ⊆ C♭, and let k″ ⊆ L♭ be a closed subfield that is a local field of characteristic p containing t, such that L♭ is the completion of an algebraic extension of k″ that is finite over the perfection of a finite extension of k″. Then: (a) G_L ⊆ G_K ≅ G_{k_∞} ⊆ G_k satisfies the hypotheses of WM.0/restricted-local-datum for D_k, and G_{L♭} ⊆ G_{k″} (restriction) satisfies them for D_{k″}; (b) β : G_L ≅ G_{L♭} is an isomorphism of local monodromy data D_k|_{G_L} ≅ D_{k″}|_{G_{L♭}}, with constant c = v_{k″}(t)⁻¹ in the convention t_{ℓ,k″}∘β = c·t_{ℓ,k}, where v_{k″}(t) ∈ ℤ_{>0} is the normalised valuation of t in k″ and where ℤ_ℓ(1) is identified on both sides through ♯ (WM.2/residue-fields-and-roots-of-unity): β(G_L ∩ I_k) = G_{L♭} ∩ I_{k″}; β carries geometric Frobenius elements to geometric Frobenius elements; both Q are the cardinality of the residue field of L, which is that of L♭; and t_{ℓ,k}(σ) = v_{k″}(t)·t_{ℓ,k″}(β(σ)) on G_L ∩ I_k. In particular this holds for k″ = k′ (constant 1) and for k″ the completion at the induced place of a global function field k₁ ⊆ L♭ finite over 𝔽_q(t^{1/p^n}).

*Hypotheses:* L/K finite; k″ ⊆ L♭ a characteristic-p local field containing t, with L♭ the completion of an algebraic extension of k″ that is finite over the perfection of a finite extension of k″; ℓ ≠ p.

*Proof outline:*

1. Inertia: I_k ∩ G_L is the kernel of the action of G_L on κ(C) = 𝔽̄_q (inertia is the kernel of the action on the residue field of the algebraic closure, LocalFieldsRamification Layer 4), and I_{k″} ∩ G_{L♭} is the kernel of the action on κ(C♭); these correspond by WM.2/residue-fields-and-roots-of-unity (i), (iii).
2. Frobenius and Q: the image of G_L in Gal(𝔽̄_q/𝔽_q) is Gal(𝔽̄_q/κ_L) with κ_L the residue field of L, open; κ_L = κ_{L♭} by the same residue-field identification; geometric Frobenius elements on both sides are the elements acting as x ↦ x^{1/#κ_L} on the common residue field. This gives condition (a) of WM.0/restricted-local-datum and the matching of Fr and Q.
3. Tame characters: write t = u·ϖ″^e in k″ with e = v_{k″}(t), u a unit. Inertia of k″ fixes the ℓ-power roots of u (they generate unramified extensions), so on I_{k″} the character defined by ℓ-power roots of t is e·t_{ℓ,k″}. For σ ∈ G_L ∩ I_k and a compatible system (t^{1/ℓ^m}) in C♭, the elements (t^{1/ℓ^m})♯ form a compatible system of ℓ-power roots of t♯ = ϖ, and σ((t^{1/ℓ^m})♯) = (β(σ)(t^{1/ℓ^m}))♯ = (ζ_m t^{1/ℓ^m})♯ = ζ_m♯·(t^{1/ℓ^m})♯, so t_{ℓ,k}(σ) is the ♯-image of the t-character of β(σ). Hence t_{ℓ,k} = e·(t_{ℓ,k″}∘β) on G_L ∩ I_k.
4. Openness of the tame images: G_{k_∞} ∩ I_k has full t_ℓ-image (WM.0/detection-on-subgroups), and G_L has finite index in G_K, so t_{ℓ,k}(G_L ∩ I_k) is open; by the formula the same holds for t_{ℓ,k″}(G_{L♭} ∩ I_{k″}). The k″ side image condition: G_{L♭} maps onto an open subgroup of Gal(𝔽̄_q/κ(k″)) because κ_L is finite.

*Prerequisites:* WM.2/galois-group-identification (Galois groups of the Kummer tower, its completion, its tilt and 𝔽_q((t))); WM.2/residue-fields-and-roots-of-unity (Tilting identifies residue fields and prime-to-p roots of unity, equivariantly); WM.0/restricted-local-datum (Restriction of a local monodromy datum to a highly ramified closed subgroup); WM.0/standard-local-datum (The standard local monodromy datum of a local field); WM.0/local-monodromy-datum (Local monodromy data and their isomorphisms); WM.0/detection-on-subgroups (Weight–monodromy purity is detected on highly ramified closed subgroups); tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group.

*Acceptance:*
- For L = K and k″ = k′ = 𝔽_q((t)): G_K ≅ G_{k′} is an isomorphism of data with constant 1, the precise form of 'the notion of weights and the monodromy operator N is compatible with this isomorphism of Galois groups' (Scholze 2012, p. 309).
- If k″ = 𝔽_q((t^{1/p})) then v_{k″}(t) = p, and t_{ℓ,k} = p·t_{ℓ,k″}∘β; p is a unit in ℤ_ℓ, so the constant is harmless.

*Source:* Scholze 2012, §9, proof of Theorem 9.6, first paragraph, p. 309 — The notion of weights and the monodromy operator N is compatible with the isomorphism of Galois groups.

### Theorem: Transfer of weight–monodromy purity through the tilt

Target `WM.2/tilting-transfer`.

Let k be p-adic, K, L, L♭, k″ and β : G_L ≅ G_{L♭} as in WM.2/monodromy-data-match, ℓ ≠ p and w ∈ ℤ. Let V be a continuous ℓ-adic representation of G_k and W a continuous ℓ-adic representation of G_{k″} that is weight–monodromy pure of weight w relative to D_{k″}. If there is a G_L-equivariant injection j : V → W (G_L acting on W through β) whose image has a G_L-stable complement, then V is weight–monodromy pure of weight w relative to D_k.

*Hypotheses:* V|_{G_L} isomorphic, through β, to a G_{L♭}-stable direct summand of W|_{G_{L♭}}; W pure of weight w for D_{k″}.

*Proof outline:*

1. By WM.0/detection-on-subgroups for k″ and H′ = G_{L♭} (an algebraic extension finite over a perfection of a finite extension), W|_{G_{L♭}} is pure of weight w relative to D_{k″}|_{G_{L♭}}.
2. By WM.2/monodromy-data-match and WM.0/transport-along-isomorphisms, W∘β is pure of weight w relative to D_k|_{G_L}.
3. By WM.0/direct-summands, the summand j(V) ≅ V|_{G_L} is pure of weight w relative to D_k|_{G_L}.
4. By WM.0/detection-on-subgroups for k and H′ = G_L, V is pure of weight w relative to D_k.

*Prerequisites:* WM.2/monodromy-data-match (Tilting matches inertia, Frobenius, q and the tame character); WM.0/detection-on-subgroups (Weight–monodromy purity is detected on highly ramified closed subgroups); WM.0/transport-along-isomorphisms (Purity is transported along isomorphisms of local monodromy data); WM.0/direct-summands (Purity passes to stable direct summands, not to subrepresentations).

*Acceptance:*
- This is the logical form of the last paragraph of the proof of Theorem 9.6: H^i(Y) is a direct summand of H^i(Z′), which satisfies weight–monodromy by Deligne's theorem.
- Non-example: if V|_{G_L} only embeds into W without a stable complement, the conclusion fails in general (ker N in the Tate-curve representation, WM.0/direct-summands).

*Source:* Scholze 2012, §9, proof of Theorem 9.6, first and last paragraphs, pp. 309 and 311 — Restriction to G_K, compatibility with the tilt, and passage to a direct summand.

## Layer WM.3: Huber's neighbourhood theorem and Galois-stable tubes

For a complete nonarchimedean field with ring of integers O, a scheme X of finite type over O and a closed immersion Z ⊆ X of finite presentation, construct the tubular neighbourhoods T(Z, ε) ⊆ d(X̂) for ε ∈ |K^×| (locally {|g_i| ≤ ε} for generators g_i of the ideal of Z): independent of the generators, quasi-compact open, compatible with base change, decreasing in ε with intersection d(Ẑ), and cofinal among constructible neighbourhoods.

Prove **Huber's neighbourhood theorem** (Huber 1998, Theorem 3.6, in the form of Ito, Theorem 4.5(2)): over an algebraically closed complete nonarchimedean field of characteristic 0, for X separated of finite type over O and n invertible in O, there is ε_0 such that restriction H^i(T(Z, ε), ℤ/n) → H^i(d(Ẑ), ℤ/n) is an isomorphism for every ε ≤ ε_0 and every i. Plan its two inputs: Huber's local constancy of R^j f^{rig}_* ℤ/n on a small punctured disc, and Lütkebohmert's Riemann existence theorem for finite étale covers of punctured discs in characteristic 0.

Prove **Lemma 9.8**: pullback along a morphism of sites is multiplicative for cup products, the cup product being Yoneda composition in Ext of the constant sheaf of rings (Mathlib's Ext.mapExactFunctor_comp), and so is the inverse of a bijective pullback. Deduce the Galois-stable form used by Theorem 9.6: for K perfectoid of characteristic 0 with completed algebraic closure C, X proper over K and Y ⊆ X closed, there is ε ∈ |K^×| such that the tube Ỹ ⊆ X^ad, defined over K and G_K-stable after base change, satisfies H^i(Ỹ_C, ℤ/ℓ^m) ≅ H^i(Y^ad_C, ℤ/ℓ^m) for all i and all m ≥ 1, G_K-equivariantly and multiplicatively, and so does every smaller tube.

**Dependencies:** AdicSpacesPartII R2 (formal completion, generic fibres, finite presentation over valuation rings); ClassicalAdicEtaleCohomology H0 (continuity, Leray), H4 (disc and punctured-disc cohomology, tame covers), H5 (comparison); SF.0, SF.4 (blow-ups).
**Sources:** Scholze 2012, §9, proof of Theorem 9.6, second paragraph, p. 309, and Lemma 9.8, p. 310; Ito, arXiv:2008.07794v1, Theorem 1.1 and its proof sketch (pp. 1–3), Proposition 4.1, Lemma 4.3 and Theorem 4.5 (pp. 19–21).

The neighbourhood end theorem is verified through Ito Theorem 4.5(2). Its proof route has recorded gaps for blow-up descent, bounded derived amplitude, the Kummer-trivialised disc calculation and the pseudo-adic continuity comparison; local constancy alone is degreewise.

### Construction: Tubular neighbourhoods of a closed subscheme in the generic fibre

Target `WM.3/tubular-neighbourhoods`.

Let K be a complete nonarchimedean field with rank-one valuation, O = K°, X a scheme of finite type over O, Z ⊆ X a closed immersion of finite presentation, X̂ the ϖ-adic completion of X and d(X̂) its generic fibre (an adic space over Spa(K, O)). For ε ∈ |K^×| there is a unique subset T(Z, ε) ⊆ d(X̂) such that for every affine open U ⊆ X and every finite set g_1, …, g_r ∈ O_X(U) generating the ideal of Z ∩ U, T(Z, ε) ∩ d(Û) = {x ∈ d(Û) : |g_i(x)| ≤ ε for all i}. (a) T(Z, ε) is a quasi-compact open subset (a rational subset on affines), independent of the generators. (b) T(Z, ε′) ⊆ T(Z, ε) for ε′ ≤ ε, and ∩_ε T(Z, ε) = d(Ẑ). (c) For every constructible W ⊆ d(X̂) containing d(Ẑ) there is ε with T(Z, ε) ⊆ W. (d) For f : X′ → X of finite type, T(Z ×_X X′, ε) = d(f̂)⁻¹(T(Z, ε)). (e) For a complete extension K′/K and ε ∈ |K^×|, T(Z_{O′}, ε) is the preimage of T(Z, ε) under d(X̂_{O′}) → d(X̂); hence it is stable under every continuous automorphism of K′ over K. (f) If X is proper over O, then d(X̂) = (X_K)^ad and d(Ẑ) = (Z_K)^ad.

*Hypotheses:* X of finite type over O; Z ⊆ X closed, of finite presentation; ε ∈ |K^×|.

*Proof outline:*

1. Independence of generators: if g_i = Σ s_{ij}h_j with s_{ij} ∈ O_X(U), then |s_{ij}(x)| ≤ 1 on d(Û), so the conditions |g_i| ≤ ε and |h_j| ≤ ε define the same subset; with ε = |ϖ_ε| the set is the rational subset {|g_i| ≤ |ϖ_ε|} of the affinoid d(Û) (Ito, Proposition 4.1).
2. Gluing over affine opens gives T(Z, ε); it is quasi-compact open. The intersection over ε is the zero locus of the ideal, d(Ẑ) (AdicSpacesPartII:R2/raynaud-generic-fibre).
3. (c): on an affine, d(X̂) is spectral; the T(Z, ε) and the complement of W are closed in the constructible topology, their intersection over all ε is empty, so by quasi-compactness some T(Z, ε) ⊆ W (Ito, Lemma 4.3).
4. (d) and (e): pull back generators; the generic fibre commutes with fibre products and completed base field extension (AdicSpacesPartII:R2/generic-fibre-fibre-products). A continuous K-automorphism of K′ preserves |·| and fixes the generators, which are defined over O.
5. (f): for X proper over O the comparison d(X̂) → X_K ×_{Spec K} Spa(K, O) is an isomorphism (AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison with properness, AdicSpacesPartII:R1/analytification-separated-proper).

*Prerequisites:* AdicSpacesPartII:R2/raynaud-generic-fibre; AdicSpacesPartII:R2/generic-fibre-fibre-products; AdicSpacesPartII:R2/formal-completion-and-algebraic-comparison; AdicSpacesPartII:R1/analytification-separated-proper.

*Used in:*

- Ito, arXiv:2008.07794v1, Proposition 4.1 and Lemma 4.3, pp. 19–20: the definition and cofinality of tubes
- Scholze 2012, §8, proof of Proposition 8.7, p. 306: a small neighbourhood may be assumed of the form {|f(x)| ≤ ε}, measured on the tautological integral model
- WM.3/huber-neighbourhood-theorem: the neighbourhoods with the same cohomology are tubes
- WM.3/galois-stable-neighbourhood: tubes defined over K are G_K-stable after base change to C

*API:*

- `tube` (constructor): T(Z, ε) ⊆ d(X̂) for Z ⊆ X closed of finite presentation and ε ∈ |K^×|.
- `tube_inter_affine` (characterisation): On an affine open U with generators g_i of the ideal of Z ∩ U: T(Z, ε) ∩ d(Û) = {|g_i| ≤ ε for all i}.
- `isOpen_tube` (other): T(Z, ε) is open.
- `isCompact_tube` (other): T(Z, ε) is quasi-compact.
- `tube_mono` (relation): ε′ ≤ ε implies T(Z, ε′) ⊆ T(Z, ε).
- `iInter_tube` (characterisation): ∩_{ε} T(Z, ε) = d(Ẑ).
- `exists_tube_subset` (universal-property): Every constructible W ⊇ d(Ẑ) contains some T(Z, ε).
- `tube_preimage` (functoriality): T(Z ×_X X′, ε) = d(f̂)⁻¹ T(Z, ε).
- `tube_baseChange` (functoriality): For K′/K complete and ε ∈ |K^×|, T(Z_{O′}, ε) is the preimage of T(Z, ε).
- `tube_galois_stable` (other): Continuous K-automorphisms of K′ preserve T(Z_{O′}, ε).
- `generic_fibre_proper` (compatibility): For X proper over O: d(X̂) = (X_K)^ad and d(Ẑ) = (Z_K)^ad.

*Checks:*

- `tube_disc` (computation): For X = Spec O[T] and Z = V(T), T(Z, ε) is the closed disc {|T| ≤ ε} in d(X̂) = Spa(K⟨T⟩, O⟨T⟩).
- `tube_self` (degenerate): For Z = X (ideal 0), T(Z, ε) = d(X̂); for Z = ∅ (ideal (1)) and ε < 1, T(Z, ε) = ∅.
- `tube_toric_section_domain` (compatibility): For Σ complete and regular and sections f_1, …, f_s of invariant integral Cartier models, T(V(f_1, …, f_s), |ϖ|^c) = N_c(f_1, …, f_s) of AnalyticToricGeometryPartII:NT.5/tube-neighbourhoods.
- `tube_depends_on_model` (non-example): For X = Spec O[T], Z = V(T), Z′ = V(ϖT) and 0 < |ϖ| < 1, take ε = |ϖ|². Then T(Z′, ε) = {|T| ≤ |ϖ|}, whereas T(Z, ε) = {|T| ≤ |ϖ|²}; the K-point T = ϖ lies only in the former. Both subschemes have generic fibre V(T), and both tube families are cofinal. For ε ≥ 1 both tubes are the unit disc, so inequality is not asserted for every radius.

*Acceptance:*

- For the toric model X_{Σ,K°} and sections f_1, …, f_s of invariant integral Cartier models, the section domains N_c(f_1, …, f_s) of AnalyticToricGeometryPartII:NT.5/tube-neighbourhoods are the tubes T(V(f_1, …, f_s), |ϖ|^c).

*Source:* Ito 2020, §4.2, Proposition 4.1, p. 19, and Lemma 4.3, p. 20 — Definition of the open and closed tubular neighbourhoods by generators, their independence and openness, functoriality, and cofinality among constructible neighbourhoods.; Scholze 2012, §8, proof of Proposition 8.7, p. 306 — Neighbourhoods of the form {|f(x)| ≤ ε} measured on the integral toric model.

### Theorem: Local constancy of direct images near the centre of a disc (Huber)

Target `WM.3/oc-quasi-constructibility`.

Let K be an algebraically closed complete nonarchimedean field of characteristic 0, O = K°, X a separated scheme of finite type over O, f ∈ O_X(X), and f^{rig} : d(X̂) → B(1) = Spa(K⟨T⟩, O⟨T⟩) the morphism induced by T ↦ f. Let n ≥ 1 be invertible in O. Then for every j the sheaf R^j f^{rig}_* ℤ/n is oc-quasi-constructible in Huber's sense; in particular for each j there is ε_1(j, n) ∈ |K^×| such that its restriction to the punctured disc B(ε_1(j, n)) ∖ {0} is a locally constant sheaf of finite type.

*Hypotheses:* K algebraically closed, complete, of characteristic 0; X separated of finite type over O; n invertible in O.

*Proof outline:*

1. This is Huber, A finiteness result for direct image sheaves on the étale site of rigid analytic varieties, J. Algebraic Geom. 7 (1998), Theorem 2.1, in the form recalled by Ito (arXiv:2008.07794v1, §1.2, first step of the sketch of Theorem 1.1).
2. Ito records local constancy for each R^j separately. A common radius for all relevant j additionally requires a uniform bound on the cohomological amplitude of Rf^{rig}_* ℤ/n; this input is recorded as a gap. For a nonproper f, ordinary direct-image stalks cannot simply be replaced by fibre cohomology to deduce such a bound.
3. The derived direct images are those of ClassicalAdicEtaleCohomology:H0/derived-direct-image; local constancy is with respect to the étale site of the punctured disc (ClassicalAdicEtaleCohomology:H4/punctured-disc-region).

*Prerequisites:* ClassicalAdicEtaleCohomology:H0/derived-direct-image; ClassicalAdicEtaleCohomology:H4/punctured-disc-region; AdicSpacesPartII:R2/raynaud-generic-fibre.

*Acceptance:*

- For X = Spec O[T] and f = T the direct images are ℤ/n in degree 0 and 0 otherwise: constant on all of B(1).
- Characteristic 0 is a hypothesis of Huber's theorem as recalled by Ito (Theorem 1.1, p. 1, and Theorem 4.5, p. 21); for positive characteristic Ito records only the compactly supported analogue (Remark 4.6, p. 21).

*Source:* Ito 2020, §1.2, sketch of the proof of Theorem 1.1, first bullet, pp. 2–3 — By Huber's Theorem 2.1 the sheaf R^j f^{rig}_* ℤ/n is oc-quasi-constructible, hence locally constant of finite type on a small punctured disc.

### Theorem: Lütkebohmert's Riemann existence theorem near a puncture

Target `WM.3/lutkebohmert-riemann-existence`.

Let K be an algebraically closed complete nonarchimedean field of characteristic 0 and n ≥ 1 invertible in K°. For every ε_1 ∈ |K^×| and every locally constant sheaf of ℤ/n-modules of finite type on the punctured disc B(ε_1) ∖ {0}, there are ε_0 ∈ |K^×| with ε_0 ≤ ε_1 and m ≥ 1 such that its restriction to B(ε_0) ∖ {0} becomes constant after pullback along the Kummer covering B(ε_0^{1/m}) ∖ {0} → B(ε_0) ∖ {0}, T ↦ T^m.

*Hypotheses:* K algebraically closed of characteristic 0; locally constant sheaf of finite type.

*Proof outline:*

1. A locally constant sheaf of finite type is trivialised by a finite étale cover; by Lütkebohmert, Riemann's existence problem for a p-adic field, Invent. Math. 111 (1993), Theorem 2.2, as used by Ito (arXiv:2008.07794v1, §1.2, second bullet), every finite étale cover of a punctured disc is, over a smaller punctured disc, dominated by a Kummer covering.
2. Kummer coverings of punctured discs and their cohomology are those of ClassicalAdicEtaleCohomology:H4/tame-radial-covers and H4/punctured-disc-cohomology.

*Prerequisites:* ClassicalAdicEtaleCohomology:H4/tame-radial-covers; ClassicalAdicEtaleCohomology:H4/punctured-disc-cohomology; ClassicalAdicEtaleCohomology:H4/punctured-disc-region.

*Acceptance:*
- The Kummer covering T ↦ T^m itself is trivialised by itself (ε_0 = ε_1).
- Non-example in characteristic p: Artin–Schreier coverings y^p − y = T^{−1} of a punctured disc are not dominated by Kummer coverings on any smaller punctured disc.

*Source:* Ito 2020, §1.2, sketch of the proof of Theorem 1.1, second bullet, p. 3 — By Lütkebohmert's p-adic Riemann existence theorem the locally constant sheaf is trivialised by a Kummer covering on a smaller punctured disc.

### Theorem: Huber's neighbourhood theorem: small tubes have the cohomology of the subvariety — *Huber's neighbourhood theorem*

Target `WM.3/huber-neighbourhood-theorem`.

Let K be an algebraically closed complete nonarchimedean field of characteristic 0, O = K°, X a separated scheme of finite type over O, Z ⊆ X a closed immersion of finite presentation, n ≥ 1 invertible in O. Then there is ε_0 ∈ |K^×| such that for every ε ∈ |K^×| with ε ≤ ε_0 and every i, the restriction map H^i(T(Z, ε), ℤ/n) → H^i(d(Ẑ), ℤ/n) is an isomorphism, where d(Ẑ) carries the étale cohomology of the closed subspace (the pseudo-adic space (d(X̂), d(Ẑ))). Moreover T(Z, ε) is quasi-compact.

*Hypotheses:* K algebraically closed, complete, characteristic 0; X separated of finite type over O; Z ⊆ X closed of finite presentation; n invertible in O; constant ℤ/n coefficients. ε_0 depends on n; a choice independent of n (Ito, Theorem 1.2) is not needed here.

*Proof outline:*

1. The end theorem is the constant-coefficient case of Ito, Theorem 4.5(2), p. 21, restating Huber 1998 Theorem 3.6. It supplies the simultaneous bound ε_0 for all i. The following is the route in Ito §1.2, pp. 2–3, whose outstanding inputs are recorded in the neighbourhood-proof gap; it is not a claim that the listed supplier results already prove every reduction.
2. Reduce the defining ideal to a principal equation through the blow-up and descent argument, then work on a finite affine cover. Tube preimages are WM.3/tubular-neighbourhoods (d). Proper base change alone does not assert that the blow-up leaves cohomology unchanged; the needed descent and gluing comparison remains to be supplied.
3. For Z = V(f), put f^{rig} : d(X̂) → B(1). Then T(Z, ε) = (f^{rig})⁻¹(B(ε)). Leray has terms H^a(B(ε), R^b f^{rig}_* ℤ/n). Each sheaf is locally constant on a sufficiently small punctured disc by WM.3/oc-quasi-constructibility, and Lütkebohmert trivialises it after a Kummer cover. Choosing one radius and cover for the derived image requires the bounded-amplitude input in the gap.
4. One still needs the explicit computation for these Kummer-trivialised direct-image sheaves, including their extension across the origin and stabilisation of restriction on shrinking discs. Constant-sheaf disc cohomology and prime-to-p tame covers from ClassicalAdicEtaleCohomology H4 do not by themselves establish this calculation for every Kummer cover in the Riemann-existence theorem.
5. Finally identify the limiting cohomology with that of the closed pseudo-adic subspace and apply Leray. The continuity theorem in ClassicalAdicEtaleCohomology H0 requires a verified limit of étale topoi with descent of the coefficients; equality of underlying point sets ∩_ε T(Z, ε) = d(Ẑ) alone does not establish this hypothesis. This identification is part of the recorded proof gap.

*Prerequisites:* WM.3/tubular-neighbourhoods (Tubular neighbourhoods of a closed subscheme in the generic fibre); WM.3/oc-quasi-constructibility (Local constancy of direct images near the centre of a disc (Huber)); WM.3/lutkebohmert-riemann-existence (Lütkebohmert's Riemann existence theorem near a puncture); ClassicalAdicEtaleCohomology:H0/leray-spectral-sequence; ClassicalAdicEtaleCohomology:H0/tilde-limits-and-cohomological-continuity; ClassicalAdicEtaleCohomology:H0/pseudo-adic-etale-site; ClassicalAdicEtaleCohomology:H3/proper-pushforward-base-change; ClassicalAdicEtaleCohomology:H4/disc-cohomology; ClassicalAdicEtaleCohomology:H4/punctured-disc-cohomology; ClassicalAdicEtaleCohomology:H4/tame-radial-covers; SchemeAndStackFoundations:SF.0/relative-proj-base-change.

*Acceptance:*

- For X = Spec O[T] and Z = V(T): T(Z, ε) is the closed disc and d(Ẑ) the origin; both have cohomology ℤ/n in degree 0 only, for every ε.
- The hypothesis that n is invertible in O is essential: H¹(B(1), ℤ/p) is infinite-dimensional while H¹({0}, ℤ/p) = 0 (Ito, Remark 4.7, p. 22).
- For Z ⊆ X closed in a proper X over O this is the statement Scholze quotes from Huber in the proof of Theorem 9.6 (p. 309).

*Source:* Ito 2020, §1.1, Theorem 1.1, p. 1; §4.3, Theorem 4.5(2), p. 21 — Huber's theorem: over an algebraically closed field of characteristic 0, small tubular neighbourhoods have the same ℤ/n-cohomology as the closed subspace, for all ε below some ε_0.; Ito 2020, §1.2, sketch of the proof of Theorem 1.1, pp. 2–3 — Blow-up to a principal ideal, Leray spectral sequence over a disc, local constancy (Huber, Theorem 2.1), Kummer trivialisation (Lütkebohmert, Theorem 2.2), explicit calculation.; Scholze 2012, §9, proof of Theorem 9.6, second paragraph, p. 309 — Quotes Huber [21, Theorem 3.6(a)] for an open neighbourhood Ỹ of Y^ad with the same ℤ/ℓ-cohomology.

### Theorem: A Galois-stable neighbourhood with the cohomology of the subvariety, for all ℓ-power coefficients — *Galois-stable cohomological neighbourhood*

Target `WM.3/galois-stable-neighbourhood`.

Let K be a complete nonarchimedean field of characteristic 0 (for instance the perfectoid field of WM.2/kummer-perfectoid-field), C the completion of an algebraic closure of K, ℓ a prime invertible in K°, 𝒳 a proper scheme of finite presentation over K° with generic fibre X, and Y ⊆ X a closed subscheme. Let 𝒵 ⊆ 𝒳 be a closed subscheme of finite presentation with generic fibre Y (for instance cut out by integral multiples of finitely many equations of Y). Then there is ε ∈ |K^×| such that, for Ỹ_{ε′} := T(𝒵, ε′) ⊆ X^ad and every ε′ ∈ |K^×| with ε′ ≤ ε: Ỹ_{ε′} is a quasi-compact open neighbourhood of Y^ad defined over K; its base change Ỹ_{ε′,C} = T(𝒵_{O_C}, ε′) is stable under G_K; and for all i and all m ≥ 1 the restriction H^i(Ỹ_{ε′,C}, ℤ/ℓ^m) → H^i(Y^ad_C, ℤ/ℓ^m) is a G_K-equivariant isomorphism in each degree; together these maps form an isomorphism of graded cohomology rings for the cup product, compatible with reduction ℤ/ℓ^{m+1} → ℤ/ℓ^m.

*Hypotheses:* K complete of characteristic 0; 𝒳 proper of finite presentation over K°; 𝒵 closed of finite presentation with generic fibre Y; ℓ invertible in K°.

*Proof outline:*

1. Apply WM.3/huber-neighbourhood-theorem over C to 𝒳_{O_C}, 𝒵_{O_C} and n = ℓ, giving ε_0 ∈ |C^×|; since |K^×| contains arbitrarily small values, choose ε ∈ |K^×| with ε ≤ ε_0. By WM.3/tubular-neighbourhoods (e), (f), T(𝒵_{O_C}, ε′) is the base change of T(𝒵, ε′), is G_K-stable, and d of the completion of 𝒵_{O_C} is Y^ad_C.
2. Induction on m: the short exact sequences 0 → ℤ/ℓ → ℤ/ℓ^m → ℤ/ℓ^{m−1} → 0 give long exact sequences on Ỹ_{ε′,C} and on Y^ad_C, compatible with restriction; the five lemma gives the isomorphism for all m with the same ε′.
3. Equivariance: the restriction is induced by the G_K-equivariant inclusion of pseudo-adic spaces. Multiplicativity: restriction is pullback along a morphism of sites, so it preserves cup products (WM.3/cup-products-under-pullback); its inverse is then multiplicative too.

*Prerequisites:* WM.3/huber-neighbourhood-theorem (Huber's neighbourhood theorem: small tubes have the cohomology of the subvariety); WM.3/tubular-neighbourhoods (Tubular neighbourhoods of a closed subscheme in the generic fibre); WM.3/cup-products-under-pullback (Pullback along a morphism of sites respects cup products (Lemma 9.8)).

*Acceptance:*

- For 𝒳 = 𝒵 the neighbourhood is all of X^ad and the statement is trivial.
- This supplies the open neighbourhood Ỹ of Y^ad_K with H^i(Ỹ_{ℂ_p}, ℤ/ℓ^m) = H^i(Y^ad_{ℂ_p}, ℤ/ℓ^m) for all m used in the proof of Scholze's Theorem 9.6 (p. 309).
- Non-example: an arbitrary open neighbourhood need not work; X^ad itself is a neighbourhood of Y^ad, but H^i(X^ad_C) → H^i(Y^ad_C) is in general neither injective nor surjective (for a smooth plane cubic Y ⊆ ℙ², H¹(ℙ²) = 0 while H¹(Y) has rank 2).

*Source:* Scholze 2012, §9, proof of Theorem 9.6, second paragraph, p. 309 — An open neighbourhood Ỹ of Y^ad_K in X^ad_{Σ,K} with the same ℤ/ℓ-cohomology over ℂ_p as Y^ad, hence the same ℤ/ℓ^m-cohomology for all m by induction.; Scholze 2012, §9, the paragraph after Lemma 9.8, p. 310 — For the map from Y^ad to Ỹ the functor goes the other way, but it is an isomorphism, so cup products are compatible in the needed direction.

### Theorem: Pullback along a morphism of sites respects cup products (Lemma 9.8) — *Cup products under pullback (Lemma 9.8)*

Target `WM.3/cup-products-under-pullback`.

Let A be a commutative ring, f : T₁ → T₂ a morphism of sites, and f* the inverse image on sheaves of A-modules, an exact functor with f*A ≅ A for the constant sheaf A. Write H^i(T, A) = Ext^i(A, A) in the category of sheaves of A-modules on T, and define the cup product of α ∈ H^i and β ∈ H^j as the Yoneda composite of α : A → A[i] with the shift β[i] : A[i] → A[i + j]. Then f*(α ∪ β) = f*α ∪ f*β in H^{i+j}(T₁, A). If moreover f* : H^*(T₂, A) → H^*(T₁, A) is bijective in every degree, its inverse also respects cup products.

*Hypotheses:* f a morphism of sites (inverse image exact, preserves the constant sheaf A).

*Proof outline:*

1. An exact functor between abelian categories induces maps on Ext groups that commute with Yoneda composition: this is mathlib:CategoryTheory.Abelian.Ext.mapExactFunctor_comp, applied to f* and to the composite defined by mathlib:CategoryTheory.Abelian.Ext.comp.
2. Transport along f*A ≅ A identifies Ext pullback with cohomology pullback. For étale sheaves of A-modules use ClassicalAdicEtaleCohomology:H0/derived-direct-image and its module/abelian-cohomology comparison. Mathlib CategoryTheory.Sheaf.H directly supplies only the abelian-group (A = ℤ) version, so it is not used as the ring-module identification by itself.
3. A bijective map preserving products has an inverse preserving products.
4. For étale cohomology this cup product agrees with the one defined through the derived tensor product and used in Poincaré duality (EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing), since for the unit object A both are the Yoneda product on Ext^*(A, A).

*Prerequisites:* Mathlib `CategoryTheory.Abelian.Ext.mapExactFunctor_comp`; Mathlib `CategoryTheory.Abelian.Ext.comp`; Mathlib `CategoryTheory.Abelian.Ext.mapExactFunctor`; Mathlib `CategoryTheory.Sheaf.H`; EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing; ClassicalAdicEtaleCohomology:H0/derived-direct-image.

*Acceptance:*

- Applied to the restriction Ỹ_C → Y^ad_C, to π on étale topoi and to g : Z′ → X in the proof of Theorem 9.6 (Scholze 2012, p. 310).
- Degree zero: f* sends the unit 1 ∈ H⁰(T₂, A) to the unit of H⁰(T₁, A).

*Source:* Scholze 2012, §9, Lemma 9.8 and its proof, p. 310 — For a morphism of sites and α ∈ H^i, β ∈ H^j with coefficients in a ring, (f*α) ∪ (f*β) = f*(α ∪ β), because the cup product is composition in the derived category and f induces a functor.; Scholze 2012, §9, the paragraph after Lemma 9.8, p. 310 — For Y^ad → Ỹ the map on cohomology is an isomorphism, so compatibility also holds for its inverse.

## Layer WM.4: The comparison map and weight–monodromy for toric complete intersections

Construct the **tilted approximation**: from Corollary 8.8 (AnalyticToricGeometryPartII NT.6) applied to the Galois-stable tube Ỹ of WM.3, a finite extension L♭ of K♭ inside C♭, a global function field k₁ ⊆ L♭, a projective smooth geometrically connected k₁-variety Z′ of dimension d = dim Y and a k₁-morphism g : Z′ → X_{Σ,k₁}, generically finite onto its image, with g^ad(Z′^ad_{L♭}) ⊆ π^{-1}(Ỹ_L) (via geometric irreducible components and de Jong's alterations).

Construct **Scholze's comparison map** f* : H^i(Y_C, ℚ̄_ℓ) → H^i(Z′_{C♭}, ℚ̄_ℓ), G_L ≅ G_{L♭}-equivariant, multiplicative, compatible over all ℤ/ℓ^m. Prove **Lemma 9.9**: f* is an isomorphism in degree 2d, from Proposition 8.6 and the nonvanishing of c₁(H)^d on Z′ for H ample. Prove the linear-algebra **duality splitting** and deduce that H^i(Y_C, ℚ̄_ℓ) is a G_L-stable direct summand of H^i(Z′_{C♭}, ℚ̄_ℓ). Prove **Theorem 9.6**: for k of characteristic 0 and Y geometrically connected, proper, smooth and a set-theoretic complete intersection in a projective smooth toric variety, the weight–monodromy conjecture holds for Y; with the examples ℙ^n, smooth hypersurfaces and complete intersections in ℙ^n, and smooth plane curves.

**Dependencies:** WM.0–WM.3; AnalyticToricGeometryPartII NT.1, NT.3, NT.4, NT.6; ClassicalAdicEtaleCohomology H5 (Theorem 9.7); SF.0, SF.2, SF.4, SF.5; EDC.2 (Poincaré duality, top degree, first Chern class), EDC.3 (cycle classes); Mathlib Ext.
**Sources:** Scholze 2012, §9, proof of Theorem 9.6, Lemmas 9.8 and 9.9, pp. 309–311; §8, Proposition 8.6 and Corollary 8.8, pp. 305–307.

### Construction: The tilted approximation Z′ of a toric complete intersection — *Tilted approximation*

Target `WM.4/tilted-approximation`.

Let k be p-adic with K, K♭, C, C♭ as in WM.2, Σ a fan with X_Σ projective and smooth, Y ⊆ X_{Σ,k} a geometrically connected proper smooth subvariety of dimension d that is set-theoretically V(f_1) ∩ … ∩ V(f_c) with c = codim Y, and Ỹ = T(𝒵, ε) ⊆ X^ad_{Σ,K} a neighbourhood of Y^ad_K as in WM.3/galois-stable-neighbourhood, for the toric model X_{Σ,K°} and 𝒵 cut out by integral multiples of the f_i. A tilted approximation consists of: a global function field k₁ ⊆ C♭ finite over 𝔽_q(t^{1/p^n}) for some n; the finite extension L♭ = K♭·k₁ of K♭ inside C♭ with untilt L/K; the local field k″ = closure of k₁ in L♭; a projective smooth geometrically connected k₁-variety Z′ of dimension d; and a proper k₁-morphism g : Z′ → X_{Σ,k₁} that is generically finite onto its image W, a closed subvariety of dimension d; such that the image of (Z′_{L♭})^ad under g lies in π_L⁻¹(Ỹ_L) ⊆ X^ad_{Σ,L♭}, where π_L is the toric projection over L (AnalyticToricGeometryPartII:NT.3/projection). Such data exist.

*Hypotheses:* X_Σ projective smooth; Y geometrically connected, proper, smooth, a set-theoretic complete intersection; Ỹ as in WM.3/galois-stable-neighbourhood.

*Proof outline:*

1. Dense subfield: k₀ = 𝔽_q(t)^{perf} = ∪_n 𝔽_q(t^{1/p^n}) is dense in K♭ (WM.2/kummer-perfectoid-field (iii)) and perfect.
2. Corollary 8.8 (AnalyticToricGeometryPartII:NT.6/complete-intersection-approximation) for Y_K ⊆ X_{Σ,K}, U = Ỹ and k₀ gives a closed Z₀ ⊆ X_{Σ,k₀} with |(Z₀ ×_{k₀} K♭)^an| ⊆ π⁻¹(Ỹ) and dim = d; it is defined by finitely many equations, so Z₀ = Z_n ×_{F_n} k₀ for a closed Z_n ⊆ X_{Σ,F_n}, F_n = 𝔽_q(t^{1/p^n}) (SchemeAndStackFoundations:SF.0/finite-presentation-limits).
3. Choose an irreducible component of (Z_n)_red of dimension d, a finite separable F′/F_n inside C♭ over which all its components are geometrically irreducible, and such a component W′ of dimension d (SchemeAndStackFoundations:SF.0/geometric-irreducible-components).
4. De Jong's theorem (SchemeAndStackFoundations:SF.4/de-jong-alteration-theorem, with empty closed subset) gives an alteration Z″ → W′ with Z″ projective and regular, factoring through a finite extension k₁/F′ over which Z′ := Z″ is smooth, projective and geometrically irreducible; embed k₁ in C♭ over F′. The composite g : Z′ → W′_{k₁} → X_{Σ,k₁} is proper and generically finite onto W = (W′_{k₁})_red, of dimension d (SchemeAndStackFoundations:SF.4/alteration).
5. L♭ = K♭k₁ is finite over K♭; its untilt L is finite over K (PerfectoidSpaces:P3/finite-extensions-of-perfectoid-fields); k″ is the completion of k₁ at the place induced by C♭, a local field of characteristic p containing t, and L♭ is the completion of an algebraic extension of k″ finite over the perfection of a finite extension of k″.
6. Base change of the inclusion |Z^an| ⊆ π⁻¹(Ỹ) from K♭ to L♭ uses the naturality of π in the perfectoid field (requested from AnalyticToricGeometryPartII:NT.3); then g^ad lands in |(W_{L♭})^ad| ⊆ |(Z₀ ×_{k₀} L♭)^an| ⊆ π_L⁻¹(Ỹ_L).

*Prerequisites:* WM.2/kummer-perfectoid-field (The Kummer tower of a p-adic local field and its tilt); WM.3/galois-stable-neighbourhood (A Galois-stable neighbourhood with the cohomology of the subvariety, for all ℓ-power coefficients); AnalyticToricGeometryPartII:NT.6/complete-intersection-approximation; AnalyticToricGeometryPartII:NT.3/projection; AnalyticToricGeometryPartII:NT.3; SchemeAndStackFoundations:SF.0/finite-presentation-limits; SchemeAndStackFoundations:SF.0/geometric-irreducible-components; SchemeAndStackFoundations:SF.4/de-jong-alteration-theorem; SchemeAndStackFoundations:SF.4/alteration; PerfectoidSpaces:P3/finite-extensions-of-perfectoid-fields; SchemeAndStackFoundations:SF.5/chow-proper-push; SchemeAndStackFoundations:SF.5/chern-projection; SchemeAndStackFoundations:SF.5/degree; SchemeAndStackFoundations:SF.5/ample; SchemeAndStackFoundations:SF.5/nef-big; SchemeAndStackFoundations:SF.5/big-line; SchemeAndStackFoundations:SF.5/nef-big-numerical; EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality.

*Used in:*

- Scholze 2012, §9, proof of Theorem 9.6, p. 309: Z with Z^ad ⊆ π⁻¹(Ỹ), dim Z = dim Y, defined over a global field and geometrically irreducible, and a projective smooth alteration Z′
- WM.4/comparison-map: the target of the comparison map is H^i(Z′)
- WM.4/top-degree-isomorphism: Z′ geometrically connected of dimension d, g generically finite

*API:*

- `TiltedApproximation` (structure): The data (k₁, L, k″, Z′, g) with the properties of the statement.
- `TiltedApproximation.exists` (constructor): Existence for every Y and Ỹ as in the statement.
- `TiltedApproximation.dim_eq` (other): dim Z′ = dim W = dim Y = d.
- `TiltedApproximation.geometricallyConnected` (other): Z′ is geometrically connected (indeed geometrically irreducible) over k₁.
- `TiltedApproximation.smooth_projective` (other): Z′ is smooth and projective over k₁.
- `TiltedApproximation.image_subset` (relation): g^ad((Z′_{L♭})^ad) ⊆ π_L⁻¹(Ỹ_L).
- `TiltedApproximation.genericallyFinite` (other): g is proper and generically finite onto W, of degree deg(g) ≥ 1.
- `TiltedApproximation.localField` (projection): k″ is a local field of characteristic p, the closure of k₁ in L♭, containing t.
- `TiltedApproximation.degree_pos` (relation): For H ample on X_Σ, deg(c₁(g*H)^d ∩ [Z′]) = deg(g)·deg(c₁(H)^d ∩ [W]) > 0.

*Checks:*

- `tiltedApproximation_ambient` (computation): For Y = X_{Σ,k} (c = 0) one may take Ỹ = X^ad, k₁ = 𝔽_q(t), Z′ = X_{Σ,k₁} and g the identity.
- `tiltedApproximation_point` (degenerate): For d = 0 (Y a single k-point that is a set-theoretic complete intersection, for instance a k-point of ℙ^n cut out by n hyperplanes) Z′ is Spec k₁ for a finite extension k₁ and g a k₁-point of X_Σ whose analytification lies in π⁻¹(Ỹ).
- `tiltedApproximation_hypersurface` (compatibility): For c = 1, Z may be taken to be the zero locus of a section of O(p^N D) defined over k₀ (AnalyticToricGeometryPartII:NT.5/hypersurface-approximation).
- `tiltedApproximation_not_tilt` (non-example): Different cohomology is possible even with Y = X = ℙ¹ over ℚ_3 and Ỹ = X^ad. Take k₁ = 𝔽_3(t), L♭ = K♭, k″ = 𝔽_3((t)), and Z′ the smooth projective elliptic curve y² = x³ − x. Its x-coordinate gives a finite degree-two morphism g : Z′ → ℙ¹. These are tilted approximation data, yet dim H¹(Z′, ℚ̄_ℓ) = 2 and H¹(Y, ℚ̄_ℓ) = 0 for ℓ ≠ 3. Approximation permits a larger cohomology space; no cohomology isomorphism with Y is asserted.

*Acceptance:*

- The output has dim Z′ = dim Y, Z′ geometrically connected, smooth and projective over the global function field k₁, and g^ad landing in π_L⁻¹(Ỹ_L): the data used in the proof of Theorem 9.6 (Scholze 2012, p. 309).
- For Y = X_{Σ,k} the identity of X_{Σ,k₁} is a tilted approximation (test tiltedApproximation_ambient).

*Source:* Scholze 2012, §9, proof of Theorem 9.6, third paragraph, p. 309 — By Corollary 8.8 there is Z ⊆ X_{Σ,K♭} with Z^ad ⊆ π⁻¹(Ỹ) and dim Z = dim Y, which may be assumed defined over a global field and geometrically irreducible; Z′ is a projective smooth alteration of Z.; Scholze 2012, §8, Corollary 8.8 and its proof, p. 307 — The approximating closed subvariety over a given dense subfield of K♭.

### Construction: Scholze's comparison map from the cohomology of Y to that of the tilted approximation — *Scholze's comparison map*

Target `WM.4/comparison-map`.

In the setting of WM.4/tilted-approximation, let G = G_L, acting on C, and on C♭ through β : G_L ≅ G_{L♭} (WM.2/galois-group-identification), and let k̄₁ be the algebraic closure of k₁ in C♭. For m ≥ 1 and every i, f*_m : H^i(Y_{k̄}, ℤ/ℓ^m) → H^i(Z′_{k̄₁}, ℤ/ℓ^m) is the composite of: H^i(Y_{k̄}) ≅ H^i(Y_C) (invariance under extension of algebraically closed fields); H^i(Y_C) ≅ H^i(Y^ad_C) (Huber's comparison, Theorem 9.7); the inverse of the restriction isomorphism H^i(Ỹ_C) ≅ H^i(Y^ad_C) (WM.3/galois-stable-neighbourhood); π* : H^i(Ỹ_C) → H^i(π⁻¹(Ỹ)_{C♭}) from the morphism of étale topoi over the open Ỹ (AnalyticToricGeometryPartII:NT.3/open-topos); restriction along g^ad to H^i(Z′^ad_{C♭}); and the inverse comparisons H^i(Z′^ad_{C♭}) ≅ H^i(Z′_{C♭}) ≅ H^i(Z′_{k̄₁}). Then: (a) f*_m is G-equivariant, G acting on the source through G_L ⊆ G_k and on the target through β and G_{L♭} ⊆ G_{k″} ⊆ G_{k₁}; (b) f*_m is multiplicative for cup products and sends 1 to 1; (c) the f*_m are compatible with reduction ℤ/ℓ^{m+1} → ℤ/ℓ^m, giving f* : H^i(Y_{k̄}, ℚ̄_ℓ) → H^i(Z′_{k̄₁}, ℚ̄_ℓ) with the same properties; (d) with r_Y : H^i(X_{Σ,k̄}) → H^i(Y_{k̄}) and r_{Z′} = g* : H^i(X_{Σ,k̄₁}) → H^i(Z′_{k̄₁}) the restrictions, f* ∘ r_Y = r_{Z′} ∘ π*_X, where π*_X : H^i(X_{Σ,C}) ≅ H^i(X_{Σ,C♭}) is the toric isomorphism of AnalyticToricGeometryPartII:NT.4/projection-cohomology (transported to algebraic cohomology).

*Hypotheses:* Setting of WM.4/tilted-approximation; ℓ ≠ p.

*Proof outline:*

1. Each map in the composite is defined and natural: invariance under extension of algebraically closed fields for proper varieties (SchemeAndStackFoundations SF.2, requested); Huber's comparison for proper varieties over C and C♭ (ClassicalAdicEtaleCohomology:H5/proper-comparison-3-7-2 and H5/comparison-over-nonarchimedean-fields-3-8-1); the restriction isomorphism of WM.3/galois-stable-neighbourhood; π on étale topoi over opens (AnalyticToricGeometryPartII:NT.3/open-topos, NT.3/etale-topos); pullback along g^ad.
2. (a) G acts on every space in the diagram by transport of structure: Ỹ_C is G-stable (WM.3/tubular-neighbourhoods (e)), π⁻¹(Ỹ)_{C♭} is G-stable, Z′ is defined over k₁ ⊆ L♭. The maps are G-equivariant: π is natural for continuous automorphisms of the perfectoid field (requested from AnalyticToricGeometryPartII:NT.3) and Huber's comparison is natural for continuous automorphisms of the base field (requested from ClassicalAdicEtaleCohomology:H5).
3. (b) Every step is a pullback along a morphism of sites or the inverse of a bijective pullback, so WM.3/cup-products-under-pullback applies.
4. (c) All maps are induced by morphisms of sites and commute with change of coefficients; pass to lim_m and tensor with ℚ̄_ℓ (finitely generated ℤ_ℓ-modules for proper varieties).
5. (d) The square of étale topoi with X_Σ over C and C♭, Ỹ_C and π⁻¹(Ỹ)_{C♭}, commutes up to canonical isomorphism (AnalyticToricGeometryPartII:NT.3/open-topos); restriction from X_Σ to Ỹ followed by restriction to Y is restriction from X_Σ to Y.

*Prerequisites:* WM.4/tilted-approximation (The tilted approximation Z′ of a toric complete intersection); WM.3/galois-stable-neighbourhood (A Galois-stable neighbourhood with the cohomology of the subvariety, for all ℓ-power coefficients); WM.3/cup-products-under-pullback (Pullback along a morphism of sites respects cup products (Lemma 9.8)); WM.3/tubular-neighbourhoods (Tubular neighbourhoods of a closed subscheme in the generic fibre); WM.2/galois-group-identification (Galois groups of the Kummer tower, its completion, its tilt and 𝔽_q((t))); WM.2/residue-fields-and-roots-of-unity (Tilting identifies residue fields and prime-to-p roots of unity, equivariantly); AnalyticToricGeometryPartII:NT.3/open-topos; AnalyticToricGeometryPartII:NT.3/etale-topos; AnalyticToricGeometryPartII:NT.3; AnalyticToricGeometryPartII:NT.4/projection-cohomology; ClassicalAdicEtaleCohomology:H5/proper-comparison-3-7-2; ClassicalAdicEtaleCohomology:H5/comparison-over-nonarchimedean-fields-3-8-1; ClassicalAdicEtaleCohomology:H5; SchemeAndStackFoundations:SF.2.

*Used in:*

- Scholze 2012, §9, proof of Theorem 9.6, pp. 309–310: the G-equivariant map f* compatible with cup products, and its ℚ̄_ℓ version
- WM.4/top-degree-isomorphism: f* in degree 2 dim Y
- WM.4/direct-summand-of-tilted-cohomology: f* in every degree

*API:*

- `comparisonMap` (constructor): f*_m and f* as in the statement.
- `comparisonMap_equivariant` (relation): f*(σ·x) = β(σ)·f*(x) for σ ∈ G_L.
- `comparisonMap_mul` (relation): f*(x ∪ y) = f*(x) ∪ f*(y).
- `comparisonMap_one` (simp): f*(1) = 1 in H⁰.
- `comparisonMap_reduction` (relation): f*_m is compatible with ℤ/ℓ^{m+1} → ℤ/ℓ^m.
- `comparisonMap_ambient` (relation): f* ∘ r_Y = g* ∘ π*_X on H^i(X_Σ).
- `comparisonMap_rational` (compatibility): The ℚ̄_ℓ-map is lim_m f*_m ⊗ ℚ̄_ℓ.

*Checks:*

- `comparisonMap_degree_zero` (computation): In degree 0, with Y and Z′ geometrically connected, f* : ℚ̄_ℓ → ℚ̄_ℓ is the identity.
- `comparisonMap_ambient_case` (degenerate): For Y = X_{Σ,k} with the tilted approximation Z′ = X_{Σ,k₁}, g = id, f* is the toric isomorphism π*_X of AnalyticToricGeometryPartII:NT.4/projection-cohomology, an isomorphism in every degree.
- `comparisonMap_cyclotomic` (compatibility): In degree 2d, G_L acts on H^{2d}(Y_{k̄}, ℚ̄_ℓ) ≅ ℚ̄_ℓ(−d) through χ_ℓ^{−d} and on H^{2d}(Z′_{k̄₁}, ℚ̄_ℓ) ≅ ℚ̄_ℓ(−d) through (χ♭_ℓ ∘ β)^{−d}; these characters are equal by WM.2/residue-fields-and-roots-of-unity (iii), as G-equivariance of f* requires.
- `comparisonMap_needs_huber` (non-example): Replacing Ỹ by an arbitrary open neighbourhood U of Y^ad does not define a map out of H^i(Y): the restriction H^i(U_C) → H^i(Y^ad_C) need not be invertible (U = X^ad and Y a plane cubic in ℙ², degree 1).

*Acceptance:*

- In degree 0 f* is the identity of ℚ̄_ℓ; in degree 2 dim Y it is an isomorphism (WM.4/top-degree-isomorphism).
- For Y = X_{Σ,k} with the identity approximation, f* is the toric isomorphism of AnalyticToricGeometryPartII:NT.4/projection-cohomology.

*Source:* Scholze 2012, §9, proof of Theorem 9.6, the diagram of étale topoi and the paragraph after it, pp. 309–310 — The commutative diagram of étale topoi, the canonical action of G = G_K = G_{K♭}, and the G-equivariant map f* compatible with cup products, then its ℚ̄_ℓ version.; Scholze 2012, §9, Theorem 9.7, p. 309 — Huber's comparison of algebraic and adic étale cohomology over an algebraically closed nonarchimedean field.

### Theorem: The comparison map is an isomorphism in top degree (Lemma 9.9) — *Top-degree isomorphism (Lemma 9.9)*

Target `WM.4/top-degree-isomorphism`.

In the setting of WM.4/comparison-map, with d = dim Y, the map f* : H^{2d}(Y_{k̄}, ℚ̄_ℓ) → H^{2d}(Z′_{k̄₁}, ℚ̄_ℓ) is an isomorphism of one-dimensional ℚ̄_ℓ-vector spaces.

*Hypotheses:* Y geometrically connected, proper and smooth of dimension d; Z′ geometrically connected, projective and smooth of dimension d; g generically finite onto W of dimension d; ℚ̄_ℓ coefficients.

*Proof outline:*

1. Both groups are one-dimensional: for a connected smooth proper variety of dimension d over a separably closed field, H^{2d} with ℚ̄_ℓ coefficients is ℚ̄_ℓ(−d) via the trace (EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology, proper case H_c = H). So f* is an isomorphism if and only if it is nonzero. For d = 0, both geometrically connected smooth varieties over the algebraic closure are a point; the comparison preserves the unit, hence is the identity on H⁰. Thus use the extreme-degree supplier only for d ≥ 1, its stated range.
2. Suppose f* = 0 in degree 2d. By WM.4/comparison-map (d), g* ∘ π*_X = f* ∘ r_Y = 0 on H^{2d}(X_{Σ,C}); since π*_X is an isomorphism (AnalyticToricGeometryPartII:NT.4/projection-cohomology, passed to ℚ̄_ℓ), g* : H^{2d}(X_{Σ,k̄₁}, ℚ̄_ℓ) → H^{2d}(Z′_{k̄₁}, ℚ̄_ℓ) vanishes.
3. Let H be an ample line bundle on X_Σ, defined from the fan over every field. Then g*(c₁(H)^d) = c₁(g*H)^d (naturality of the Kummer first Chern class, EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class, and of cup products).
4. Its trace is the degree of the zero-cycle c₁(g*H)^d ∩ [Z′] (EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map: compatibility with intersection products and trace equals degree), which by the projection formula (SchemeAndStackFoundations:SF.5/chern-projection, SF.5/degree, with g_*[Z′] = deg(g)[W] from SF.5/chow-proper-push) equals deg(g)·deg(c₁(H)^d ∩ [W]) > 0. For d ≥ 1, H|_W is ample (SF.5/ample), hence nef (SF.5/nef-big) and big (SF.5/big-line); SF.5/nef-big-numerical gives the strictly positive top intersection on the reduced integral W. The d = 0 case was already handled by the unit.
5. A positive integer is nonzero in ℚ̄_ℓ, so g*(c₁(H)^d) ≠ 0, a contradiction.

*Prerequisites:* WM.4/comparison-map (Scholze's comparison map from the cohomology of Y to that of the tilted approximation); WM.4/tilted-approximation (The tilted approximation Z′ of a toric complete intersection); AnalyticToricGeometryPartII:NT.4/projection-cohomology; EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology; EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class; EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map; SchemeAndStackFoundations:SF.5/chern-projection; SchemeAndStackFoundations:SF.5/degree; SchemeAndStackFoundations:SF.5/ample; SchemeAndStackFoundations:SF.5/chow-proper-push; SchemeAndStackFoundations:SF.5/nef-big; SchemeAndStackFoundations:SF.5/big-line; SchemeAndStackFoundations:SF.5/nef-big-numerical.

*Acceptance:*

- Scholze 2012, Lemma 9.9 (Lemma 9.8 in arXiv v1), pp. 310–311.
- With ℤ/ℓ^m coefficients the argument fails when ℓ divides deg(g)·deg(c₁(H)^d ∩ [W]); this is why the statement is made after passing to ℚ̄_ℓ.
- If Z′ were not geometrically connected, H^{2d}(Z′) would have dimension the number of geometric components and f* could be injective without being surjective; the construction of WM.4/tilted-approximation makes Z′ geometrically connected.

*Source:* Scholze 2012, §9, Lemma 9.9 and its proof, pp. 310–311 — The commutative diagram with the ambient toric variety, Proposition 8.6 on the top row, one-dimensionality of H^{2 dim Y}(Y), and the nonvanishing of the image of the (dim Y)-th power of the first Chern class of an ample bundle.

### Theorem: A multiplicative map that is an isomorphism in top degree is a split injection

Target `WM.4/duality-splitting`.

Let E be a field, G a group, d ≥ 0, and A = ⊕_{i=0}^{2d} A^i, B = ⊕_{i=0}^{2d} B^i finite-dimensional graded E-vector spaces with E-linear G-actions preserving degrees, and G-equivariant bilinear products A^i × A^j → A^{i+j}, B^i × B^j → B^{i+j}. Assume A^{2d} and B^{2d} are one-dimensional and the pairings A^i × A^{2d−i} → A^{2d} and B^i × B^{2d−i} → B^{2d} are perfect for every i. Let f : A → B be a G-equivariant graded linear map with f(a ∪ a′) = f(a) ∪ f(a′) whose degree-2d component is an isomorphism. Then for every i, f^i is injective and B^i = f(A^i) ⊕ f(A^{2d−i})^⊥, where ⊥ is the annihilator for the pairing B^i × B^{2d−i} → B^{2d}; both summands are G-stable. In particular A^i is G-isomorphic to a G-stable direct summand of B^i.

*Hypotheses:* Perfect pairings into one-dimensional top degrees on both sides; f multiplicative, G-equivariant, an isomorphism in degree 2d. No graded commutativity is needed.

*Proof outline:*

1. Injectivity: for a ≠ 0 in A^i choose a′ ∈ A^{2d−i} with a ∪ a′ ≠ 0 (perfectness); then f(a) ∪ f(a′) = f(a ∪ a′) ≠ 0 because f^{2d} is injective, so f(a) ≠ 0.
2. The restricted pairing f(A^i) × f(A^{2d−i}) → B^{2d} is perfect: it is the transport of the perfect pairing of A along the isomorphisms f^i, f^{2d−i} onto their images and f^{2d}. Hence f(A^i) ∩ f(A^{2d−i})^⊥ = 0.
3. Dimensions: dim f(A^{2d−i})^⊥ = dim B^i − dim A^{2d−i} = dim B^i − dim A^i, using perfectness on B and on A. So the sum is direct and fills B^i.
4. G-stability: G acts on B^{2d} by a character because it is one-dimensional, and the pairing is G-equivariant; f(A^{2d−i}) is G-stable, so its annihilator is G-stable.

*Prerequisites:* mathlib:LinearMap.IsPerfPair; mathlib:Representation.

*Acceptance:*
- The linear algebra behind 'Poincaré duality implies that H^i(Y) is a direct summand of H^i(Z′)' (Scholze 2012, p. 311).
- Example: A = H^*(ℙ¹, ℚ̄_ℓ), B = H^*(Ell, ℚ̄_ℓ) for an elliptic curve Ell over an algebraically closed field, f the pullback along a degree-2 map Ell → ℙ¹: f is multiplicative, an isomorphism in degree 2 (multiplication by 2 under the traces), A¹ = 0, and B¹ = f(A¹) ⊕ f(A¹)^⊥ = 0 ⊕ B¹.
- Non-example: without the top-degree isomorphism, the zero map in positive degrees is multiplicative and is neither injective nor split.

*Source:* Scholze 2012, §9, final paragraph of the proof of Theorem 9.6, p. 311 — Poincaré duality implies that H^i(Y) is a direct summand of H^i(Z′); this target isolates the linear algebra.

### Theorem: H^i(Y) is a Galois-stable direct summand of H^i(Z′)

Target `WM.4/direct-summand-of-tilted-cohomology`.

In the setting of WM.4/comparison-map, for every i the map f* : H^i(Y_{k̄}, ℚ̄_ℓ) → H^i(Z′_{k̄₁}, ℚ̄_ℓ) is injective and its image has a G-stable complement; thus H^i(Y_{k̄}, ℚ̄_ℓ)|_{G_L} is isomorphic, through β, to a G_{L♭}-stable direct summand of H^i(Z′_{k̄₁}, ℚ̄_ℓ)|_{G_{L♭}}.

*Hypotheses:* Setting of WM.4/comparison-map.

*Proof outline:*

1. Take A = H^*(Y_{k̄}, ℚ̄_ℓ) and B = H^*(Z′_{k̄₁}, ℚ̄_ℓ) with cup products, graded in degrees 0 to 2d. Poincaré duality for proper smooth varieties of pure dimension d over a separably closed field gives perfect pairings into H^{2d} ≅ ℚ̄_ℓ(−d) (EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality, EDC.2:pairings/cup-product-trace-pairing), equivariant for the Galois groups (EDC.2:pairings/galois-frobenius-equivariance).
2. f* is G-equivariant and multiplicative (WM.4/comparison-map (a), (b)) and an isomorphism in degree 2d (WM.4/top-degree-isomorphism).
3. Apply WM.4/duality-splitting with E = ℚ̄_ℓ and the group G = G_L acting on B through β.

*Prerequisites:* WM.4/comparison-map (Scholze's comparison map from the cohomology of Y to that of the tilted approximation); WM.4/top-degree-isomorphism (The comparison map is an isomorphism in top degree (Lemma 9.9)); WM.4/duality-splitting (A multiplicative map that is an isomorphism in top degree is a split injection); EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality; EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing; EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance.

*Acceptance:*
- Scholze 2012, final paragraph of the proof of Theorem 9.6, p. 311.
- For i = 0 and i = 2d the summand is everything (both sides one-dimensional).

*Source:* Scholze 2012, §9, final paragraph of the proof of Theorem 9.6, p. 311 — Poincaré duality implies that H^i(Y_{ℂ_p}) is a direct summand of H^i(Z′_{ℂ_p♭}).

### Theorem: The weight–monodromy conjecture for set-theoretic complete intersections in toric varieties (Theorem 9.6) — *Weight–monodromy for toric complete intersections*

Target `WM.4/weight-monodromy-toric-complete-intersections`.

Let k be a local field of characteristic 0 (a finite extension of ℚ_p) and Σ a fan such that the toric variety X_Σ is projective and smooth. Let Y ⊆ X_{Σ,k} be a closed subvariety that is geometrically connected, proper and smooth over k, and a set-theoretic complete intersection: Y = V(f_1) ∩ … ∩ V(f_c) as sets for hypersurfaces V(f_i) ⊆ X_{Σ,k} with c = codim Y. Then for every prime ℓ ≠ p the weight–monodromy conjecture holds for Y: for every i, H^i(Y_{k̄}, ℚ̄_ℓ) is weight–monodromy pure of weight i relative to D_k.

*Hypotheses:* char k = 0; X_Σ projective and smooth; Y geometrically connected, proper, smooth, set-theoretically cut out by codim Y hypersurfaces; ℓ ≠ p.

*Proof outline:*

1. Fix ℓ and i. Choose a uniformiser ϖ and form K, K♭, C, C♭ and β (WM.2/kummer-perfectoid-field, WM.2/galois-group-identification). Each hypersurface is the zero locus of a section of O(D_i) for an invariant Cartier divisor D_i (AnalyticToricGeometryPartII:NT.0/invariant-representative), so 𝒵 can be cut out on the toric model X_{Σ,K°} by integral multiples of these sections.
2. WM.3/galois-stable-neighbourhood gives a G_K-stable tube Ỹ with H^*(Ỹ_C, ℤ/ℓ^m) ≅ H^*(Y^ad_C, ℤ/ℓ^m) for all m. WM.4/tilted-approximation gives k₁, L, k″, Z′ and g.
3. WM.4/direct-summand-of-tilted-cohomology: V = H^i(Y_{k̄}, ℚ̄_ℓ) restricted to G_L is, through β, a G_{L♭}-stable direct summand of W = H^i(Z′_{k̄₁}, ℚ̄_ℓ) restricted to G_{L♭}.
4. WM.1/function-field-varieties for the global function field k₁, the place v with completion k″ and the projective smooth Z′: W restricted to G_{k″} is weight–monodromy pure of weight i relative to D_{k″}.
5. WM.2/tilting-transfer: V is weight–monodromy pure of weight i relative to D_k.

*Prerequisites:* WM.4/direct-summand-of-tilted-cohomology (H^i(Y) is a Galois-stable direct summand of H^i(Z′)); WM.4/tilted-approximation (The tilted approximation Z′ of a toric complete intersection); WM.3/galois-stable-neighbourhood (A Galois-stable neighbourhood with the cohomology of the subvariety, for all ℓ-power coefficients); WM.2/tilting-transfer (Transfer of weight–monodromy purity through the tilt); WM.2/kummer-perfectoid-field (The Kummer tower of a p-adic local field and its tilt); WM.2/galois-group-identification (Galois groups of the Kummer tower, its completion, its tilt and 𝔽_q((t))); WM.1/function-field-varieties (Weight–monodromy for proper smooth varieties over global function fields at every place); WM.0/weight-monodromy-conjecture (The weight–monodromy conjecture for a proper smooth variety); AnalyticToricGeometryPartII:NT.0/invariant-representative.

*Used in:*
- WeightsInEtaleCohomology:R34.6: may consume Theorem 9.6 as an exact local monodromy-weight theorem for toric complete intersections

*Acceptance:*
- Y = ℙ^n_k (c = 0, Σ the fan of ℙ^n): the conjecture holds, as computed directly in WM.0/weight-monodromy-conjecture.
- Smooth hypersurfaces of ℙ^n_k of dimension at least 1 (geometrically connected): the theorem applies; this case was new when the theorem was proved (Scholze 2012, after Theorem 1.15).
- Smooth plane curves: the theorem gives weight–monodromy for H¹, consistent with the classical curve case through Grothendieck's semistable reduction.
- Non-example: for a variety that is not a set-theoretic complete intersection in any projective smooth toric variety, the method gives no statement; Corollary 8.8 is unavailable.
- The hypothesis char k = 0 is used through Huber's neighbourhood theorem (characteristic 0) and the perfectoid field K; in characteristic p the analogous statements are Deligne's theorem (WM.1) and results of Terasoma and Ito outside this roadmap.

*Source:* Scholze 2012, §9, Theorem 9.6 and its proof, pp. 309–311 — The theorem and its proof by restriction to G_K, Huber's neighbourhood, Corollary 8.8, an alteration, the comparison map, Lemma 9.9, Poincaré duality and Deligne's theorem.; Scholze 2012, §1, Theorem 1.15 and the sketch after it, p. 251 — Statement in the introduction; already new for smooth hypersurfaces.

### Application: Smooth complete intersections in projective space and in products of projective spaces

Target `WM.4/projective-complete-intersections`.

Let k be a finite extension of ℚ_p and ℓ ≠ p. (a) Every geometrically connected smooth closed subvariety Y ⊆ ℙ^n_k that is a set-theoretic complete intersection of hypersurfaces (in particular every geometrically connected smooth complete intersection, every geometrically connected smooth hypersurface, and every geometrically connected smooth plane curve) satisfies the weight–monodromy conjecture at ℓ. (b) The same holds for geometrically connected smooth set-theoretic complete intersections in ℙ^{n_1} × … × ℙ^{n_r}.

*Hypotheses:* k p-adic; Y geometrically connected and smooth; set-theoretic complete intersection in ℙ^n or in a product of projective spaces.

*Proof outline:*

1. ℙ^n and products of projective spaces are the toric varieties of complete regular projective fans, so they are projective and smooth toric varieties (AnalyticToricGeometryPartII:NT.1/analytification-comparison for the complete case; the parent roadmap tauceti:TauCetiRoadmap/AnalyticToricGeometry for the fans).
2. A closed subvariety of a proper variety is proper; apply WM.4/weight-monodromy-toric-complete-intersections.

*Prerequisites:* WM.4/weight-monodromy-toric-complete-intersections (The weight–monodromy conjecture for set-theoretic complete intersections in toric varieties (Theorem 9.6)); AnalyticToricGeometryPartII:NT.1/analytification-comparison; tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier.

*Acceptance:*
- The Fermat hypersurface x_0^e + … + x_n^e = 0 over ℚ_p, p ∤ e, has good reduction, and the theorem agrees with WM.0/good-reduction-case.
- A smooth cubic threefold in ℙ⁴ over ℚ_p, with any reduction type, satisfies weight–monodromy in every degree; the smooth hypersurface case was already new when the theorem was proved (Scholze 2012, p. 251).

*Source:* Scholze 2012, §1, after Theorem 1.15, p. 251 — The result is new already for smooth hypersurfaces in ℙ^n.; Scholze 2012, §9, Theorem 9.6, p. 309 — The general toric statement.
## Ordering and parallel work

- WM.0 needs only the parent's Weil numbers and weight predicate, LPV.1's monodromy filtration, R01.2's monodromy operator and the Tau Ceti inertia API; it can start at once. Its linear algebra (the monodromy filtration, purity of an endomorphism pair, direct sums, rescaling, the duality splitting of WM.4) can be built against Mathlib alone and is prototyped in `Suggested.lean`.
- WM.1 depends on WM.0 and on the parent's DWP.4, DWP.5 and DWP.7.
- WM.2 depends on WM.0 and PerfectoidSpaces P1, P3. It is independent of WM.1 and WM.3.
- WM.3 depends on AdicSpacesPartII R1–R2 and ClassicalAdicEtaleCohomology H0, H3, H4, H5; it is independent of WM.0–WM.2. Its Lemma 9.8 is homological algebra on top of Mathlib's `Ext` and can be done first.
- WM.4 needs all earlier layers and AnalyticToricGeometryPartII NT.0–NT.6.

## Acceptance checklist

- `IsWeightMonodromyPure` relative to the standard datum agrees with the parent's weight–monodromy predicate and with its Weil–Deligne form; the dual Tate module of a Tate curve is pure of weight 1 while its semisimplification is pure of no weight.
- Purity is detected on G_{k′} for k′/k finite and on G_{k(ϖ^{1/p^∞})}, and is not detected on G_{k(ϖ^{1/ℓ^∞})} (tame character zero there).
- Purity passes to stable direct summands and fails for ker N inside the Tate-curve representation.
- The weight–monodromy conjecture holds for ℙ^n_k, for Spec k, and for every proper smooth variety with good reduction; it is invariant under finite extension of k.
- Deligne's theorem holds for proper smooth families over a curve over 𝔽_q at the missing point, and for every proper smooth variety over a global function field at every place.
- The tilt of the completed Kummer tower of k is the completed perfection of 𝔽_q((t)) with t♯ = ϖ; G_K ≅ G_{K♭} ≅ G_{𝔽_q((t))} matches inertia, geometric Frobenius, q and the ℓ-adic tame character (constant 1), and for a characteristic-p local field k″ ⊆ L♭ the identity t_{ℓ,k} = v_{k″}(t)·t_{ℓ,k″} gives constant v_{k″}(t)⁻¹ from the k-side datum to the k″-side datum.
- Tubes T(Z, ε) are open, quasi-compact, decreasing to d(Ẑ), cofinal, and compatible with base change; for X = Spec O[T] and Z = V(T) they are closed discs; they depend on the integral model of Z.
- Huber's neighbourhood theorem holds for all ε ≤ ε_0 and fails for n not invertible in O; its Galois-stable form gives one tube working for all ℓ-power coefficients at once.
- Lemma 9.8 is Mathlib's `Ext.mapExactFunctor_comp`.
- For Y = X_{Σ,k} the comparison map is the toric isomorphism π*; in degree 0 it is the identity; Lemma 9.9 holds with ℚ̄_ℓ coefficients and its proof uses that Z′ is geometrically connected.
- The duality splitting holds for any multiplicative map that is an isomorphism in top degree between algebras with perfect pairings into one-dimensional top degrees, with no graded commutativity.
- Theorem 9.6 holds for every geometrically connected smooth set-theoretic complete intersection in ℙ^n_k or in a product of projective spaces, including smooth hypersurfaces and smooth plane curves; the method says nothing for varieties that are not toric set-theoretic complete intersections.

## Corrections to the source

The published text of *Perfectoid spaces* is followed, with three corrections.

- Proposition 9.1 (p. 307) writes the tame character evaluated at an unbound letter; the formula is ρ(σ) = exp(N·t_ℓ(σ)) for σ in the open subgroup I₁.
- Lemma 9.5 (p. 309) uses an integer i without introducing it; it should begin with "let i ∈ ℤ".
- In the proof of Theorem 9.6 and of Lemma 9.9 (pp. 309–311), the argument "a map out of the one-dimensional H^{2 dim Y}(Y) that is not an isomorphism is zero" needs H^{2 dim Y}(Z′) to be one-dimensional as well, that is, Z′ geometrically connected. An alteration of a geometrically irreducible variety need not be geometrically connected; the tilted approximation of WM.4 therefore takes Z′ geometrically irreducible over a finite extension of its global field of definition, which de Jong's theorem provides.

The end theorem of WM.3 uses constant ℤ/n coefficients. The proof route still needs blow-up descent and gluing, bounded derived amplitude, the disc calculation with Kummer-trivialised direct-image sheaves, and the pseudo-adic étale-topos continuity comparison. Local constancy is initially degreewise; it does not alone give a radius uniform over all cohomological degrees.

The statements of Huber's Theorems 2.1 and 3.6 (J. Algebraic Geom. 7 (1998), 359–403) and of Lütkebohmert's Theorem 2.2 (Invent. Math. 111 (1993), 309–330) are given in the form in which Ito's *Uniform local constancy of étale cohomology of rigid analytic varieties* (arXiv:2008.07794v1, Theorem 1.1, Theorem 4.5 and §1.2) recalls and uses them; the definition of oc-quasi-constructible sheaves is Huber's Definition 1.4 in that paper.

## Lean prototypes

`Suggested.lean` records what can be stated against Mathlib 082e2d3 and Tau Ceti f790474: `IsWeilNumber` (the parent's form), `monodromyFiltration` with its behaviour for N = 0, under rescaling, monotonicity, the shift by N and invariance under Frobenius; `IsGradedEigenvalue`; `IsWeightMonodromyPureEnd` with rescaling and direct sums; `nilExp`; the structure `LocalMonodromyDatum` on a compact Hausdorff totally disconnected group, with `one_not_mem_frob`, `inv_mul_mem_inertia` and the proposition `IsIso` with `refl`, `symm`, `trans`; `IsWeightMonodromyPure` with `monodromy_unique`, `frob_conj_monodromy`, `iso_iff`, `isWeightMonodromyPure_prod` and `isWeightMonodromyPure_iff_restrict`; Lemma 9.8 as `cup_mapExactFunctor`, proved from Mathlib; `duality_splitting` and `duality_splitting_stable`; and examples for the Tate-curve monodromy, its semisimplification, the zero space and the filtration of a two-step string. The standard and restricted data of a local field, the conjecture for a variety, the Kummer tower and its Galois groups, tubes, Huber's theorem, the tilted approximation, the comparison map, Lemma 9.9 and Theorem 9.6 have no carriers at the pins and are stated here only.



The suggested structure retains the README’s profiniteness hypotheses. The identification H/I ≅ ℤ̂ remains a README-only requirement, since no restriction construction is defined in Lean; the restriction theorem takes the explicit subgroup/Frobenius hypotheses it uses and requires the subgroup to be compact.

## References

- P. Scholze, *Perfectoid spaces*, Publ. Math. IHÉS 116 (2012), 245–313, published version (open access at Centre Mersenne); §1, Theorems 1.1, 1.3, 1.15 and Conjecture 1.14, pp. 245–251; §8, Definition/Proposition 8.4 to Corollary 8.8, pp. 304–307; §9, Proposition 9.1 to Lemma 9.9 and the proof of Theorem 9.6, pp. 307–311.
- K. Ito, *Uniform local constancy of étale cohomology of rigid analytic varieties*, arXiv:2008.07794v1 (2020); Theorems 1.1–1.2 and the sketch in §1.2, pp. 1–3; Proposition 4.1, Lemma 4.3 and Theorem 4.5, pp. 19–21.
- R. Huber, *A finiteness result for direct image sheaves on the étale site of rigid analytic varieties*, J. Algebraic Geom. 7 (1998), 359–403, Theorems 2.1 and 3.6 (through Ito's restatement).
- W. Lütkebohmert, *Riemann's existence problem for a p-adic field*, Invent. Math. 111 (1993), 309–330, Theorem 2.2 (through Ito's restatement).
- P. Deligne, *La conjecture de Weil. II*, Publ. Math. IHÉS 52 (1980), 137–252 (through the parent roadmap).
- A. J. de Jong, *Smoothness, semi-stability and alterations*, Publ. Math. IHÉS 83 (1996), 51–93 (through SchemeAndStackFoundations SF.4).
- R. Huber, *Étale cohomology of rigid analytic varieties and adic spaces*, Vieweg, 1996, Theorems 3.7.2 and 3.8.1 (through ClassicalAdicEtaleCohomology H5).
