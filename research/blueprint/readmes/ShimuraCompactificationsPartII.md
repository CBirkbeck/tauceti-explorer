# Toroidal compactifications and boundary geometry, Part II

Integral toroidal and minimal compactifications of Shimura varieties of Hodge type at every level and of PEL Shimura varieties at bad primes, built by normalizing good Siegel compactifications: Madapusi Pera's description of the boundary through p-adic Hodge theory of degenerating abelian varieties, smooth canonical compactifications at hyperspecial level, Lan's normalized compactifications with lattice collections, and the Siegel models at deep, Iwahori, Klingen and paramodular level used in higher Hida theory, with the GSpin boundary used for Hecke orbits.

This roadmap extends the parent ShimuraCompactifications beyond its good-prime PEL compactifications. It plans the integral normalization constructions, the boundary Hodge-tensor argument, the resulting toroidal and minimal models, and the particular bad-level and orthogonal boundary models needed by the routed papers. The mathematical statements below are targets for future formalization.

Independent review `REV-DESIGN-ShimuraCompactificationsPartII` checked all 73 original nodes and added C13.7. Its verdict is **needs_changes**: the relative Zarhin quasi-finiteness argument and the additional general PEL relative-lci transfer still have missing proof inputs. The Klingen order-p gluing is corrected by the explicit two-end-piece partial-flag argument. The packet is a **complete target-level pass**: all nine layers have target nodes and exact terminal gaps, so they are planned under PROTOCOL §0, and none is closed. The review itself is finished. Every remaining input is listed under [Exact gaps](#exact-gaps). See the [review report](../reviews/REV-DESIGN-ShimuraCompactificationsPartII.md) and [machine-readable packet](../packets/ShimuraCompactificationsPartII.json).

## Scope, existing work and conventions

The parent owns arithmetic cones and fans, mixed boundary data, characteristic-zero toroidal compactifications, their refinements and Hecke maps, degenerating abelian schemes and extension of their homomorphisms, and good-prime PEL compactifications. This Part II imports those contracts. Lan’s normalized minimal model in C8 supplies the input for the parent’s normalized-blowup theorem; its construction must not depend back on that blowup theorem.

Current TauCetiRoadmap main was checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and current TauCeti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. AlgebraicVectorBundles supplies general bundle/torsor language, AnalyticToricGeometry supplies its existing finite-fan and toric theory, and OrthogonalSpinGroups supplies its existing Clifford/Spin theory. These are imported. The Shimura-specific integral structures, arithmetic fans and GSpin datum below are the new targets. The reviewed library audit of the parent’s C0–C5 was also checked.

Interior local models and their moduli comparisons belong to ShimuraVarietiesPartII. AutomorphicBundles owns the general bundle extensions; IntegralCoherentHeckeComplexes owns higher-direct-image vanishing; the Igusa Part II owns partial Igusa compactifications; HigherHidaAndColemanTheory owns the graded divisors and higher Hida/Coleman applications. This roadmap records their precise inputs without declaring those inputs proved.

- O denotes O_{E,(v)} or its completion; E is the reflex field and v lies above p. Neatness removes the specified finite stabilizers, but does not by itself imply good reduction.
- Relative normalization is integral closure in the fixed generic algebra. Over excellent finite-level auxiliary models it is finite. Incoming lifting from normal flat test spaces is distinct from Mathlib’s outgoing `normalizationDesc` into an integral factorization.
- A hyperspecial auxiliary p-level gives a finite generic map, which need not be a closed immersion. A generic closed immersion can require a deeper auxiliary Siegel p-level.
- Cone decompositions are arithmetic admissible decompositions from the parent. Their integral lattice matters: an induced cone can fail to be smooth. A Cartier structure supported on the boundary need not be its reduced divisor for a nonsmooth fan.
- The middle model of a normalized bad-level boundary tower is generally a proper normal model over an intermediate finite cover. An abelian-scheme torsor needs its separate level or chart hypotheses.
- De Rham H¹ of a 1-motive is contravariant, of weights 0,1,2, and equals Lie(E_Q)^∨. Its homological dual has weights −2,−1,0 and the F⁰ convention used in C11. Cartier duality includes the stated Tate twist.
- ℤ_p^cycl is the union of the finite cyclotomic integer rings. Its infinite-level maps are asserted integral, not automatically finite; normality follows by finite integral equations and flatness by valuation-ring torsion-freeness.
- A zero-dimensional pure Shimura boundary base can carry a positive-dimensional abelian scheme. Scalar Fourier-coordinate formulas require a torus-only degeneration. At GSpin line cusps use the negative-norm component for signature (n−1,1).
- Pointwise p-rank defines special-fibre loci and their p-adic formal opens. The Klingen multiplicative-H open is smaller than the full inverse image of p-rank≥1.
- An extended semi-abelian homomorphism can have a quasi-finite flat kernel whose rank drops at the boundary. Stroh’s finite-flat order-p extension is a separately glued object. No global finite-flat higher-level kernel is silently substituted.

## Build order and coverage

Build C7 → C8, and C9; then C10 → C12 → C11, followed by C13, C14 and C15 with the prerequisites stated at each layer. C12 precedes C11 because canonicity of the minimal model uses C12. Within C12, construct its section-ring Proj, calculate the completion in C12.5, and then prove the full stratification in C12.4. The numerical labels remain stable references.

| Layer | State | Remaining work |
| --- | --- | --- |
| C7 | planned | Close gap/zarhin-finiteness-ampleness: read and import the all-polarization Hodge-ampleness input needed by Lan16 Lemma 4.5. |
| C8 | planned | Close gap/pel-lci-transfer for the proposed relative-lci extension; the Lan16 fibre-property and regularity statements are verified. |
| C9 | planned | Brylinski Théorème 2.2.5 remains indirect through MP19 Proposition 3.1.2; the original was not read in this review. |
| C10 | planned | Target-level planning complete, conditional on the named prerequisite contracts. |
| C11 | planned | Import the precise Kisin interior smoothness, tensor and extension-property theorem from ShimuraVarietiesPartII (gap/kisin-smoothness); the compactification results are conditional on it. |
| C12 | planned | Target-level planning complete, conditional on the named prerequisite contracts. |
| C13 | planned | Import normality/flatness and the moduli comparison for the Iwahori lattice-chain interior (gap/iwahori-lattice-chain-moduli). Resolve gap/higher-level-graded-extension before any higher-level divisor construction uses a globally finite-flat graded group. |
| C14 | planned | Import the interior local models and the intermediate rank-one chart comparison (gap/klingen-paramodular-interior). |
| C15 | planned | Target-level planning complete, conditional on the named prerequisite contracts. |

## Suggested Lean file

The [suggested file](../suggested/ShimuraCompactificationsPartII.lean) elaborates at the pinned baseline using `lean-check`; its only warning is the explicit `sorry` on the proper-paramodular-sublattice theorem. It contains light real definitions over existing scheme, lattice and arithmetic carriers, with elementary checks. It supplies the outgoing `NormalizedToroidalModel.factorizationDesc`, not the incoming normal-test lifting theorem. Every heavy object below remains a README target; no missing carrier is an opaque or sorry-defined type. The namespace of the planning API is `TauCetiRoadmap.ShimuraCompactificationsPartII`.

## C7. Normalization models over auxiliary Siegel compactifications

Auxiliary Siegel maps at arbitrary source level are finite on the generic fibre; a generic closed immersion may require deep auxiliary p-level rather than a hyperspecial one. Relative Zarhin replacement supplies self-dual auxiliary data; finiteness of its map at all polarization degrees uses the explicit Hodge-ampleness gap recorded in the packet. Pull back admissible cone decompositions without assuming smoothness, normalize good auxiliary toroidal models, restrict to the interior, and compare choices only under finite comparison maps. Distinguish incoming normal-test lifting from outgoing integral factorization. Normalized boundary towers may have ramified cusp bases and their middle maps need not be abelian torsors. At infinite cyclotomic level the structure map is integral; finiteness is a finite-stage assertion.

Layer prerequisites: `ShimuraCompactifications:C1`; `ShimuraCompactifications:C2`; `ShimuraCompactifications:C3`; `ShimuraCompactifications:C5`; `ShimuraData:D4`; `PELModuli:M5`; `PELModuli:M6`; `PadicDifferentialEquationsAndRigidCohomology:RD.5`; `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.1`; `ShimuraVarieties:V1`; `AbelianSchemesAndArithmeticModuli:A6`; `NeronModelsAndSemistableAbelianVarieties:R11.5`; `ShimuraCompactifications:C0`.

### C7.1. Auxiliary Siegel data for a Shimura datum

`ShimuraCompactificationsPartII:C7/auxiliary-siegel-datum` · definition · implementation: unchecked.

Let (G, X) be a Shimura datum of Hodge type with reflex field E, p a prime, v | p a place of E and K = K_pK^p ⊂ G(𝔸_f) a neat compact open subgroup. An auxiliary Siegel datum for (G, X, K) at v is a finite nonempty family J of triples (ι_j, g_j, K_j)_{j∈J}, where ι_j : (G, X) → (GSp(V_j, ψ_j), S^±(V_j)) is an embedding of Shimura data into the Siegel datum of a symplectic ℚ-space, V_j(ℤ) ⊂ V_j is a lattice on which ψ_j is ℤ-valued and perfect at p (so its stabilizer K_{j,p} ⊂ GSp(V_j)(ℚ_p) is hyperspecial), K_j = K_{j,p}K_j^p is a neat compact open subgroup of GSp(V_j)(𝔸_f) and g_j ∈ G(𝔸_f) satisfies ι_j(g_jKg_j^{-1}) ⊂ K_j. Each triple induces a morphism of characteristic-zero Shimura varieties Sh_K(G, X) → Sh_{K_j}(GSp(V_j), S^±) ⊗_ℚ E, x ↦ ι_j(x g_j^{-1}), and J induces their product into ∏_j Sh_{K_j} ⊗ E. For a singleton with hyperspecial auxiliary p-level the generic map is finite; a closed immersion may instead require deepening the auxiliary p-level, as in MP19 §3.7.3 and §4.1.1. These two auxiliary choices must be distinguished; collections J of conjugations of one ι are Lan's and Boxer–Pilloni's.

**Hypotheses.**

- (G, X) of Hodge type; K neat; the level K_j hyperspecial at p, that is the stabilizer of a lattice V_j(ℤ_p) self-dual for ψ_j.
- No condition is imposed on K_p: the level of G at p is arbitrary; hyperspeciality is required only of the auxiliary Siegel levels.

**Proof or construction.**

- Embeddings of Shimura data and the induced maps of Shimura varieties are those of ShimuraData D4 and ShimuraVarieties V1 (level maps and Hecke translations), composed with right translation by g_j.
- If ψ_j is not perfect at p on a given lattice, replace V_j by Zarhin's space (V_j ⊕ V_j^∨)^4 with its perfect form (C7/zarhin-self-dual-replacement); this changes ι_j but not the generic fibre Sh_K.
- The product of the induced maps is a morphism of E-schemes; its finiteness for suitable K_j is C7/generic-toroidal-finite-map.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §3.1, opening paragraphs, p. 43; §4.1.1, p. 70. Fixes a Hodge embedding into a Siegel datum whose space has a self-dual lattice stabilized by K, with K‡_p the stabilizer, and remarks that Zarhin's trick (H replaced by H^⊕8) always achieves this.
- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), §2 and §4, Examples 2.3–2.5, pp. 7–8; (4.13)–(4.15), pp. 21–24. Uses a collection J of auxiliary good-reduction moduli problems, one for each lattice of a multichain or Hecke twist, with morphisms from the PEL moduli problem to each auxiliary one.
- [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.4.19, pp. 39–40. Fixes integers d_1, …, d_r, polarization types δ_i and maps K ↪ K_{δ_i} given by conjugation followed by inclusion, inducing finite maps S_{K,ℚ} → ∏ A_{g,d_i,ℚ}.

**Uses that determine the API.**

- Madapusi Pera §4.1.1, p. 70: MP19 §4.1.1 uses a sufficiently small Siegel level for a generic closed immersion; §3.1 uses a hyperspecial Siegel model for integral normalization. Passing between them uses a finite level cover.
- Boxer–Pilloni §3.4.19 and §4.1.1, pp. 39–41: the Iwahori model at level p^n is built from the collection d_i = p^{n(g−i)}, i = 0, …, g, of conjugated Siegel levels.
- Pilloni §6.1.5.4, proof of Theorem 6.1.5.1, p. 29: the paramodular model uses Zarhin's genus-16 embedding and the Klingen model the product Y_par × Y.

**Planning API.**

- `AuxiliarySiegelDatum` (structure): The family J of triples (ι_j, g_j, K_j) with the lattice V_j(ℤ) and the containment ι_j(g_jKg_j^{-1}) ⊂ K_j.
- `AuxiliarySiegelDatum.genericMap` (data): The induced morphism Sh_K(G, X) → ∏_{j∈J} Sh_{K_j}(GSp(V_j), S^±) ⊗_ℚ E of E-schemes.
- `AuxiliarySiegelDatum.single` (constructor): The singleton datum of one Hodge embedding ι with g = 1 and K ⊂ K‡.
- `AuxiliarySiegelDatum.zarhin` (constructor): Replace each V_j by (V_j ⊕ V_j^∨)^4 with Zarhin's perfect form, keeping ι_j up to the diagonal embedding.
- `AuxiliarySiegelDatum.union` (constructor): The disjoint union of two auxiliary data for the same (G, X, K); its generic map is the product of the two.
- `AuxiliarySiegelDatum.restrictLevel` (functoriality): For K′ ⊂ K neat, the same family is an auxiliary datum for K′, and the generic maps commute with Sh_{K′} → Sh_K.
- `AuxiliarySiegelDatum.hecke` (functoriality): For h ∈ G(𝔸_f^p), the family (ι_j, g_jh, K_j) is an auxiliary datum for h^{-1}Kh, and its generic map is the composite of the old one with right translation by h.
- `AuxiliarySiegelDatum.ext` (extensionality): For a fixed index set, equality of the embeddings, translating elements, levels and integral lattices identifies the auxiliary data; proof witnesses of the containment conditions do not add data.

**Unit tests.**

- `AuxiliarySiegelDatum.modularCurve_test` (computation): For G = GL_2, X = ℍ^±, K = K^pK_0(p) and J = {(id, 1, K^pGL_2(ℤ_p))}, the generic map is the forgetful map Y_0(p) → Y(K^pGL_2(ℤ_p)) over ℚ, of degree p + 1.
- `AuxiliarySiegelDatum.trivial_test` (degenerate): For (G, X) the Siegel datum itself, K hyperspecial at p and J = {(id, 1, K)}, the generic map is the identity.
- `AuxiliarySiegelDatum.nonSelfDual_test` (non-example): For GSp_4 with the paramodular lattice V_1 = pe_1ℤ ⊕ e_2ℤ ⊕ e_3ℤ ⊕ e_4ℤ, ψ restricted to V_1 has discriminant p², so (id, 1, Stab(V_1)) is not an auxiliary triple until Zarhin's replacement is applied.
- `AuxiliarySiegelDatum.iwahori_test` (computation): For GSp_{2g}, n ≥ 1 and the Iwahori level K_{p,n}, the triples with lattices of polarization degree d_i² for d_0 = 1 and d_i = p^{n(g−i)} (1 ≤ i ≤ g), each made self-dual by Zarhin's replacement, form an auxiliary datum.

**Acceptance checks.**

- Every Hodge-type datum and neat level admits an auxiliary Siegel datum (Zarhin's replacement of any Hodge embedding).
- The map to a hyperspecial auxiliary Siegel model need not be a closed immersion: the GL₂ K₀(p) example has degree p + 1. MP19 §4.1.1 obtains a closed immersion after allowing a sufficiently deep auxiliary Siegel level.

Direct prerequisites: `ShimuraData:D4`; `ShimuraVarieties:V1`; `PELModuli:M5`; `mathlib:Matrix.symplecticGroup`.

Atlas planet: **Auxiliary Siegel datum**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C7`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C7.2. Zarhin's replacement and finiteness of the moduli map

`ShimuraCompactificationsPartII:C7/zarhin-self-dual-replacement` · theorem · implementation: unchecked.

**Conditional target: the independent review could not close the proof contract.** The missing step is stated below and in Exact gaps.

Let (V, ψ) be a symplectic ℚ-space with a lattice L on which ψ is ℤ-valued and nondegenerate. Then L′ = (L ⊕ L^∨)^4 carries a ℤ-valued perfect alternating form ψ′ obtained from the relative Zarhin construction (with the chosen polarization as part of the data), and the map on moduli A ↦ (A ⊕ A^∨)^4 with Zarhin's principal polarization defines, for neat prime-to-p levels K^p ⊂ K′^p compatible with this embedding, a finite morphism of ℤ_(p)-stacks 𝒜_{g,d,K^p} → 𝒜_{8g,1,K′^p} extending the generic morphism of Siegel Shimura varieties; here 𝒜_{g,d} is the moduli stack of abelian schemes with a polarization of degree d² (any d, possibly divisible by p).

**Hypotheses.**

- The level K′^p is chosen so that the induced map on level structures is defined; neatness is used only to work with algebraic spaces.
- Finiteness is asserted over ℤ_(p); smoothness of 𝒜_{g,d} at p | d is not claimed.

**Proof or construction.**

- Zarhin's trick: for an abelian scheme A with polarization λ, (A × A^∨)^4 carries a principal polarization built from λ and a quaternion of integers u with u ū = −1 modulo the degree (PadicDifferentialEquationsAndRigidCohomology RD.5, relative Zarhin's trick).
- Properness follows by extending a principally polarized target over a valuation ring and using good reduction of its isogeny factors to recover A. Quasi-finiteness is the separate ampleness argument of Lan16 Lemma 4.5, not a consequence of finite polarized automorphism groups.
- Lan16 Lemma 4.5, pp. 19–20 proves finiteness by properness (good reduction of isogeny factors), and quasi-finiteness using ampleness of the Hodge determinant after adding a finite étale naive prime-to-p torsion marking. Finite polarized automorphism groups alone do not prove that geometric fibres are finite. The Hodge-ampleness input for every polarization degree, including at primes dividing the degree, has no verified supplier in the cited A6 contract; this is gap/zarhin-finiteness-ampleness.

**Sources and match.**

- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), §4, Lemmas 4.1 and 4.5, Proposition 4.12, pp. 18–21. Constructs the relative Zarhin map; Lemma 4.5 proves it finite using Hodge ampleness for quasi-finiteness and good reduction of isogeny factors for properness.
- [MP19](https://arxiv.org/pdf/1211.1731v6), §3.1, p. 43. Notes that the self-dual lattice condition is achieved after replacing H by H^⊕8 by Zarhin's trick.
- [Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), proof of Theorem 6.1.5.1, p. 29. Embeds the paramodular moduli space into the principally polarized genus-16 Siegel space by Zarhin's trick before normalizing.

**Acceptance checks.**

- For g = 2, d = p the target is the principally polarized Siegel moduli of genus 16.
- For d = 1 the same construction still sends a genus-g principally polarized scheme to a genus-8g principally polarized scheme; no identification with an identity map is asserted.

Direct prerequisites: `PadicDifferentialEquationsAndRigidCohomology:RD.5`; `PELModuli:M6`; `AbelianSchemesAndArithmeticModuli:A6`; `NeronModelsAndSemistableAbelianVarieties:R11.5`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C7`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C7.3. Induced cone decompositions

`ShimuraCompactificationsPartII:C7/induced-cone-decomposition` · construction · implementation: unchecked.

Let J be an auxiliary Siegel datum (C7/auxiliary-siegel-datum) and, for each j, Σ_j a K_j-admissible complete rational polyhedral cone decomposition for the Siegel datum of V_j. For each cusp label representative Φ of (G, X, K), with induced labels Φ_j = (ι_j, g_j)_*Φ, the induced decomposition Σ(Φ) of the closed cone of Φ is the set of nonempty intersections of the cone of Φ with preimages of products ∏_j σ_j, σ_j ∈ Σ_j(Φ_j), under the map of central lattices B_K(Φ) → ∏_j B_{K_j}(Φ_j). The family Σ = ι^*(Σ_j)_j is a K-admissible rational polyhedral cone decomposition, complete if each Σ_j is, possibly nonsmooth even when every Σ_j is smooth, and every admissible decomposition of (G, X, K) has a refinement that is induced from smooth projective Σ_j.

**Hypotheses.**

- Cone conventions of ShimuraCompactifications C0: rational polyhedral, closed and salient, on the common lattice carrier; admissibility means compatibility under the arithmetic action with finitely many orbits.
- Smoothness of Σ is not part of the construction.

**Proof or construction.**

- Form Σ(Φ) by pulling back cones along the linear map of central lattices; faces and intersections pull back to faces and intersections, so Σ(Φ) is a fan on the cone of Φ (ShimuraCompactifications C0 common refinements).
- Compatibility of Φ ↦ Φ_j with the arithmetic actions and with face maps of cusp labels gives admissibility; completeness pulls back because the cone of Φ maps into the cones of the Φ_j.
- Given an admissible Σ′ of (G, X, K), refine the Σ_j so that each cone of Σ′ is a union of induced cones (Madapusi Pera 4.1.6 citing Harris; Lan16 §7).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §4.1.4, p. 70; Remark 4.1.6, p. 72. Starts from an admissible decomposition for the Siegel datum, takes the induced one for (G, X, K), and notes that refinements of induced decompositions can be arranged to be induced, citing Harris.
- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), §7, pp. 36–37. Defines a possibly nonsmooth cone decomposition for the PEL moduli by pulling back products of the auxiliary cones under the map of cone spaces (5.20).

**Uses that determine the API.**

- Madapusi Pera §4.1.4–4.1.5, pp. 70–72: the normalized toroidal model is indexed by the induced decomposition.
- Lan16 §7 and Theorem 9.13, pp. 36–51: strata of the normalized model are indexed by induced cones.

**Planning API.**

- `inducedConeDecomposition` (constructor): The family Σ(Φ) of pulled-back cones for each cusp label representative Φ.
- `inducedConeDecomposition_admissible` (structure): Σ is K-admissible: finitely many orbits of cones under the arithmetic group of each Φ.
- `inducedConeDecomposition_complete` (other): If each Σ_j is complete then so is Σ.
- `inducedConeDecomposition_refine` (other): Every admissible decomposition of (G, X, K) is refined by an induced one, with the Σ_j smooth and projective.
- `inducedConeDecomposition_face` (functoriality): Induced cones are compatible with face maps between cusp labels.
- `inducedConeDecomposition_ext` (extensionality): Two induced decompositions agree when their cone sets agree at each cusp representative, compatibly with the arithmetic identifications; use the parent fan extensionality API.

**Unit tests.**

- `inducedConeDecomposition_siegel_test` (degenerate): For the trivial auxiliary datum of a Siegel datum, Σ = Σ_1.
- `inducedConeDecomposition_nonsmooth_test` (non-example): Let the source lattice be B = {(a, b) ∈ ℤ² : a ≡ b mod 2} mapping to ℤ² by inclusion, and pull back the quadrant ℝ_{≥0}², smooth for ℤ². The induced cone is the quadrant with rays generated in B by (2, 0) and (0, 2); the lattice point (1, 1) ∈ B lies in the cone but not in ℕ(2, 0) + ℕ(0, 2), so the induced cone is not smooth for B.
- `inducedConeDecomposition_modular_test` (computation): For GL_2 every cusp has the single cone ℝ_{≥0} and the induced decomposition is that cone for any auxiliary datum.

**Acceptance checks.**

- The induced decomposition of a complete admissible family is complete and admissible.
- Induced cones of a smooth family can be nonsmooth for the induced lattice.

Direct prerequisites: `ShimuraCompactifications:C1/roadmap/cusp-label`; `ShimuraCompactifications:C0`; `ShimuraCompactifications:C3/roadmap/level-datum-functoriality`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C7`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C7.4. Finite maps of characteristic-zero toroidal compactifications

`ShimuraCompactificationsPartII:C7/generic-toroidal-finite-map` · theorem · implementation: unchecked.

With J and Σ = ι^*(Σ_j) as in C7/induced-cone-decomposition, the generic map of J extends to a morphism of E-schemes Sh^Σ_K → ∏_j Sh^{Σ_j}_{K_j} ⊗ E from Pink's toroidal compactification over E, it is finite, and it identifies Sh^Σ_K with the normalization of ∏_j Sh^{Σ_j}_{K_j} ⊗ E in Sh_K. On boundary charts it maps each boundary mixed Shimura variety Sh_{K_Φ}(Q_Φ, D_Φ) finitely to ∏_j Sh_{K_{Φ_j}}(Q_{Φ_j}, D_{Φ_j}) ⊗ E, compatibly with the torus-torsor and abelian-torsor towers, and each twisted torus embedding Sh_{K_Φ}(Q_Φ, D_Φ, σ) to the product of those for σ_j ⊇ σ.

**Hypotheses.**

- Σ induced from complete K_j-admissible Σ_j; finiteness of the generic map Sh_K → ∏ Sh_{K_j} on the interior follows from the closed-immersion or level-change form of each ι_j.

**Proof or construction.**

- Extend the map by the functoriality of toroidal compactifications for morphisms of data whose cone maps send cones into cones (ShimuraCompactifications C3, level and datum maps).
- Finiteness: the map is proper (source proper) and quasi-finite, the latter checked stratum by stratum on boundary charts where it is a finite map of torus embeddings over finite maps of boundary bases (Harris, Lemma 3.1, as cited by Madapusi Pera 4.1.2).
- Since Sh^Σ_K is normal (ShimuraCompactifications C2) and contains Sh_K densely, Zariski's main theorem identifies it with the normalization of the target in Sh_K.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §4.1.2 and §4.1.4, p. 70. Uses Harris's lemma that the normalization of a twisted torus embedding of the Siegel boundary in the boundary mixed Shimura variety is the corresponding twisted toric variety, and that the map of toroidal compactifications identifies Sh^Σ_K with the normalization of Sh^{Σ‡}_{K‡} in Sh_K.
- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), §5, Proposition 5.24, p. 27, and §7, pp. 36–37. Shows that the auxiliary toroidal compactifications receive finite morphisms from the PEL compactification in characteristic zero for compatible pulled-back cone decompositions.
- [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.4.23, p. 40; §4.1.1, p. 41. Assumes a finite map S^tor_{K,ℚ} → ∏ A^tor_{g,d_i,ℚ} for suitable cone decompositions.

**Acceptance checks.**

- For a smooth Σ_1 on a Siegel datum and its own trivial auxiliary datum the map is the identity.
- Over the boundary the map need not be a closed immersion even when Sh_K → Sh_{K‡} is.

Direct prerequisites: `ShimuraCompactificationsPartII:C7/induced-cone-decomposition` (C7.3); `ShimuraCompactifications:C2/roadmap/canonical-toroidal-model`; `ShimuraCompactifications:C2/roadmap/normal-open-dense`; `ShimuraCompactifications:C3/roadmap/level-datum-functoriality`; `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C7`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C7.5. The normalized toroidal model

`ShimuraCompactificationsPartII:C7/normalized-toroidal-model` · construction · implementation: unchecked.

Let O be the localization O_{E,(v)} (or its completion O_{E_v}, or ℤ_p when E_v = ℚ_p), J an auxiliary Siegel datum and Σ = ι^*(Σ_j) induced from smooth complete projective Σ_j. Let 𝒜^{Σ_j}_{K_j} be the smooth proper integral toroidal compactification over ℤ_(p) of the Siegel moduli at the hyperspecial level K_j (ShimuraCompactifications C5). The normalized toroidal model 𝒮^Σ_K = 𝒮^Σ_K(J) is the normalization of ∏_j 𝒜^{Σ_j}_{K_j} ⊗ O in Sh^Σ_K along the finite map of C7/generic-toroidal-finite-map: the relative spectrum over the product of the integral closure of its structure sheaf in the pushforward of the structure sheaf of Sh^Σ_K. It is a normal algebraic space, proper and flat over O, with generic fibre Sh^Σ_K and a finite morphism to ∏_j 𝒜^{Σ_j}_{K_j} ⊗ O.

**Hypotheses.**

- Σ_j smooth, complete and projective for the auxiliary Siegel models, so that 𝒜^{Σ_j}_{K_j} is a smooth projective scheme over ℤ_(p); Σ itself may be nonsmooth.
- The construction uses only excellence and normality; no smoothness of the interior and no moduli interpretation at level K_p is asserted.

**Proof or construction.**

- Normalize along the finite morphism Sh^Σ_K → ∏ 𝒜^{Σ_j}_{K_j} ⊗ E (Mathlib's relative normalization on schemes, glued on étale charts for algebraic spaces).
- Finiteness of the normalization over the product: the product is of finite type over the excellent ring O, hence Nagata (SchemeAndStackFoundations SF.0).
- Properness follows from finiteness over a proper base; flatness from torsion-freeness of the structure sheaf, which injects into its generic fibre; normality by construction.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §4.1.4, p. 71; footnote 2, p. 2. Defines 𝒮^Σ_K as the normalization of the Chai–Faltings compactification 𝒮^{Σ‡}_{K‡} in Sh_K, normalization meaning the finite algebraic stack given by integral closure of the structure sheaf in the pushforward.
- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), (7.7)–(7.8) and Lemma 7.9, p. 37. Defines the normalized toroidal model as the normalization of the product of auxiliary toroidal compactifications and proves it proper and flat with the normalized interior as a dense open.
- [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.4.23, p. 40. Defines S^tor_{K^pK_p} → Spec ℤ_p as the normalization of ∏ A^tor_{g,d_i} × Spec ℤ_p in S^tor_{K^pK_p,ℚ_p}.

**Uses that determine the API.**

- Madapusi Pera Theorem 4.1.5, p. 71: the model whose boundary structure the main theorem describes.
- Boxer–Pilloni §§3.4.23 and 4.1.1, pp. 40–41: integral models of Siegel varieties at deep level p.
- HigherHidaAndColemanTheory H2/ordinary-strata: the normalization model at Iwahori level p^n carrying the self-dual chain.
- Maulik–Shankar–Tang §8.1: the smooth toroidal compactification of the GSpin integral model at hyperspecial level.

**Planning API.**

- `NormalizedToroidalModel` (constructor): The normal algebraic space 𝒮^Σ_K(J) over O with its finite map ν : 𝒮^Σ_K → ∏_j 𝒜^{Σ_j}_{K_j} ⊗ O and generic identification 𝒮^Σ_K ⊗ E ≅ Sh^Σ_K.
- `NormalizedToroidalModel.finite` (instance): ν is finite.
- `NormalizedToroidalModel.proper_flat` (other): 𝒮^Σ_K is proper and flat over O, and normal.
- `NormalizedToroidalModel.generic` (data): The isomorphism of the generic fibre with Sh^Σ_K, compatible with ν and the generic toroidal map.
- `NormalizedToroidalModel.desc` (universal-property): Incoming normal-test lifting: a normal flat O-space T mapping to the auxiliary model, with a compatible generic map T_E → Sh^Σ_K, has a unique lift to 𝒮^Σ_K. This is distinct from factorizationDesc, which maps out of relative normalization.
- `NormalizedToroidalModel.interior` (projection): The open subspace 𝒮_K = ν^{-1}(∏ 𝒜_{K_j} ⊗ O), with 𝒮_K ⊗ E = Sh_K (C7/normalized-interior-model).
- `NormalizedToroidalModel.baseChange_etale` (functoriality): Formation commutes with étale base change on the product and with passing from O_{E,(v)} to its henselization or completion.
- `NormalizedToroidalModel.factorizationDesc` (universal-property): In the scheme case f:X→Y, every integral factorization X→T→Y induces f.normalization→T, with composites equal to the given maps. This outgoing property is Mathlib normalizationDesc; it does not prove incoming normal-test lifting.
- `NormalizedToroidalModel.hom_ext` (extensionality): Maps from a flat O-space into the separated normalized model that agree on its schematically dense generic fibre are equal. State the density hypothesis explicitly for more general bases.

**Unit tests.**

- `NormalizedToroidalModel.identity_test` (degenerate): For the Siegel datum at hyperspecial level with its trivial auxiliary datum and smooth Σ_1, the normalized model is 𝒜^{Σ_1}_{K} ⊗ O itself.
- `NormalizedToroidalModel.gamma0_test` (computation): For GL_2 at level K^pK_0(p), p ≥ 5, K^p neat, the normalized model is finite flat of degree p + 1 over the compactified modular curve of level K^p over ℤ_p, and its special fibre has two irreducible components meeting at the supersingular points (each component a copy of the level-K^p curve).
- `NormalizedToroidalModel.compatible_test` (compatibility): For a PEL datum and a singleton J at a good prime, with K_p = G(ℤ_p), the normalized model coincides with the good-prime integral toroidal model of ShimuraCompactifications C5 for the same Σ.
- `NormalizedToroidalModel.notSmooth_test` (non-example): At level K_0(p) the normalized model of the modular curve is not smooth over ℤ_p at the supersingular points, although the auxiliary model is.

**Acceptance checks.**

- 𝒮^Σ_K is proper and flat over O with generic fibre Sh^Σ_K.
- For the Siegel datum at hyperspecial level it is the Faltings–Chai compactification.

Direct prerequisites: `ShimuraCompactificationsPartII:C7/generic-toroidal-finite-map` (C7.4); `ShimuraCompactifications:C5/roadmap/integral-toroidal-space`; `ShimuraCompactifications:C5/roadmap/valuative-properness`; `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`; `mathlib:AlgebraicGeometry.Scheme.Hom.normalizationDesc`; `mathlib:AlgebraicGeometry.IsFinite`; `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.1`.

Atlas planet: **Normalized toroidal model**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C7`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C7.6. The interior of the normalized model

`ShimuraCompactificationsPartII:C7/normalized-interior-model` · theorem · implementation: unchecked.

The preimage 𝒮_K of ∏_j 𝒜_{K_j} ⊗ O under the finite map ν of C7/normalized-toroidal-model is an open dense subspace of 𝒮^Σ_K, it is the normalization of ∏_j 𝒜_{K_j} ⊗ O in Sh_K, it is normal, flat and of finite type over O with generic fibre Sh_K, and it does not depend on Σ. For a singleton J with Sh_K → Sh_{K‡} a closed immersion and K_p = K‡_p ∩ G(ℚ_p), 𝒮_K is the normalization of the Zariski closure of Sh_K in 𝒜_{K‡} ⊗ O (Kisin's integral model when K_p is hyperspecial and p > 2).

**Hypotheses.**

- J auxiliary Siegel datum and Σ induced as in C7/normalized-toroidal-model.

**Proof or construction.**

- Normalization commutes with restriction to open subspaces of the base, so the preimage of the open interior of the product is the normalization of that interior in the preimage of Sh_K, which is Sh_K because the generic toroidal map sends boundary to boundary.
- Density: every irreducible component of 𝒮^Σ_K dominates O (flatness) and meets the generic fibre in a component of Sh^Σ_K, in which Sh_K is dense.
- Independence of Σ: the interior normalization only involves the interiors of the auxiliary models.
- For the closed-immersion case, the integral closure of the closure of Sh_K equals the integral closure in Sh_K by Zariski's main theorem.

**Sources and match.**

- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), Proposition 6.1, p. 32, and Lemma 7.9, p. 37. The normalized interior model is normal and flat with a finite morphism to the product of auxiliary moduli, and it embeds as the dense open preimage of the auxiliary interiors in the normalized toroidal model.
- [MP19](https://arxiv.org/pdf/1211.1731v6), Introduction, p. 2, and §4.1.4, p. 71. Defines the interior integral model as the normalization of the Siegel integral model in Sh_K and notes it is Kisin's smooth model when p > 2 and the level is hyperspecial.

**Acceptance checks.**

- The interior of the normalized model of the modular curve at level K_0(p) is the normalization of the level-K^p curve in Y_0(p), not the Katz–Mazur moduli scheme a priori; ShimuraVarietiesPartII owns their comparison.

Direct prerequisites: `ShimuraCompactificationsPartII:C7/normalized-toroidal-model` (C7.5); `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`; `mathlib:AlgebraicGeometry.IsOpenImmersion`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C7`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C7.7. Transitivity and independence of auxiliary choices

`ShimuraCompactificationsPartII:C7/normalization-transitivity` · theorem · implementation: unchecked.

Let J and J′ be auxiliary Siegel data for (G, X, K) with induced decompositions Σ, Σ′. If there is a finite morphism ∏_{j∈J} 𝒜^{Σ_j}_{K_j} ⊗ O → ∏_{j′∈J′} 𝒜^{Σ′_{j′}}_{K′_{j′}} ⊗ O compatible with the generic maps from Sh^Σ_K (so that Σ = Σ′), then 𝒮^Σ_K(J) ≅ 𝒮^Σ_K(J′) canonically over the generic identification. In particular: the union J ⊔ J′ gives the same model as J whenever the projection of the product onto the J-factors is finite on the image; Zarhin's replacement of a self-dual factor and the direct-sum map from a product of principally polarized Siegel models to a single one do not change the model. In general 𝒮^Σ_K depends on J (Boxer–Pilloni Remark 3.4.21).

**Hypotheses.**

- Finite morphisms between the auxiliary products compatible with the generic maps; normality and excellence of all bases.

**Proof or construction.**

- Integral closure is transitive: if A → B is finite then the integral closure of B in L equals the integral closure of A in L.
- Apply locally on étale charts of the target product and glue by uniqueness of normalization.
- For Zarhin's replacement and direct sums the morphisms of moduli are finite (C7/zarhin-self-dual-replacement; direct sum of principally polarized abelian schemes has finite fibres by uniqueness of decomposition up to finite ambiguity).
- For PEL collections use the universal property of Lan16 Theorem 11.4, which does not involve the auxiliary choices (C8/pel-degenerating-families).

**Sources and match.**

- [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Remark 3.4.21, p. 40. States that the normalized integral model in general depends on the choice of auxiliary spaces A_{g,d_i}.
- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), Proposition 7.4 and Corollary 11.7, pp. 36 and 57. Shows the normalized boundary moduli and toroidal model do not depend on the auxiliary moduli problems chosen, only on the linear-algebraic data.
- [MP19](https://arxiv.org/pdf/1211.1731v6), Remark 4.1.6, p. 72. Shows from the boundary description that 𝒮^Σ_K does not depend on the choice of Σ‡ inducing Σ.

**Acceptance checks.**

- Two auxiliary data related by a finite map of products give canonically isomorphic models; two data with no such map need not.
- PEL auxiliary-choice independence is a later C8 conclusion from Lan16 Corollary 11.7 and its moduli universal property, not an input to this C7 transitivity argument.

Direct prerequisites: `ShimuraCompactificationsPartII:C7/normalized-toroidal-model` (C7.5); `ShimuraCompactificationsPartII:C7/zarhin-self-dual-replacement` (C7.2); `mathlib:AlgebraicGeometry.Scheme.Hom.normalization.hom_ext`; `mathlib:integralClosure`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C7`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C7.8. Normalized boundary towers and twisted torus embeddings

`ShimuraCompactificationsPartII:C7/normalized-boundary-tower` · construction · implementation: unchecked.

For a cusp label representative Φ of (G, X, K) with induced labels Φ_j, let 𝒮_{K_{Φ_j}}(Q_{Φ_j}, D_{Φ_j}) → 𝒮_{K_{Φ_j}}(Q_{Φ_j}, D̄_{Φ_j}) → 𝒮_{K_{Φ_j},h}(G_{Φ_j,h}, D_{Φ_j,h}) be the integral boundary tower of the good Siegel model (torus torsor over an abelian scheme over a Siegel moduli space of smaller genus, ShimuraCompactifications C5). The normalized boundary tower 𝒮_{K_Φ}(Q_Φ, D_Φ) → 𝒮_{K_Φ}(Q_Φ, D̄_Φ) → 𝒮_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}) is the normalization of the product of these towers in the characteristic-zero tower of Φ (ShimuraCompactifications C1–C2). For a cone σ of Σ(Φ) and σ_j with σ = ∩ preimages, 𝒮_{K_Φ}(Q_Φ, D_Φ, σ) is the normalization of ∏_j 𝒮_{K_{Φ_j}}(Q_{Φ_j}, D_{Φ_j}, σ_j) in Sh_{K_Φ}(Q_Φ, D_Φ); it does not depend on the σ_j, its generic fibre is the twisted toric variety Sh_{K_Φ}(Q_Φ, D_Φ, σ), and the normalization 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) of the closed stratum of the product in the closed stratum Z_{K_Φ}(Q_Φ, D_Φ, σ) carries a finite map to it extending the closed immersion of generic fibres.

**Hypotheses.**

- Φ a cusp label representative; Σ induced from smooth projective Σ_j.

**Proof or construction.**

- Normalize each level of the product tower in the corresponding generic level; the maps of the tower are induced by the universal property of normalization.
- Independence of σ_j: two choices differ by refinement of the auxiliary cones meeting the same relative interior; the normalizations of the corresponding torus embeddings agree on the open orbit and are finite over each other (Harris, Lemma 3.1, via Madapusi Pera 4.1.2).
- Generic fibre: normalization commutes with flat base change to E, and Harris's lemma identifies the generic normalization with the twisted toric variety.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §4.1.1–4.1.2, p. 70. Defines the boundary tower of 𝒮_K as the normalization of the Siegel boundary tower in the generic tower, and the normalized twisted torus embedding and its closed stratum.
- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), Propositions 7.4, 8.1, 8.4 and 8.7, pp. 36–42. Lan constructs normalized pure bases, proper normal boundary bases and torus torsors; the middle map is not asserted to be an abelian-scheme torsor at arbitrary bad level.

**Uses that determine the API.**

- Madapusi Pera Theorem 4.1.5(1),(4),(5): the boundary charts whose completions describe 𝒮^Σ_K.
- Farb–Kisin–Wolfson Corollary 3.3.18: the torus torsor ξ_K → C_K and its torus embeddings ξ_K(Σ).

**Planning API.**

- `NormalizedBoundaryTower` (structure): The three-step tower of normalized boundary models of Φ with its maps.
- `NormalizedBoundaryTower.torusEmbedding` (constructor): For σ ∈ Σ(Φ), the normalized twisted torus embedding 𝒮_{K_Φ}(Q_Φ, D_Φ, σ) and its open immersion of 𝒮_{K_Φ}(Q_Φ, D_Φ).
- `NormalizedBoundaryTower.closedStratum` (constructor): The normalized closed stratum 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) with its finite map into the torus embedding.
- `NormalizedBoundaryTower.generic` (compatibility): Generic fibres are the characteristic-zero tower and twisted toric varieties of ShimuraCompactifications C1–C2.
- `NormalizedBoundaryTower.conj` (functoriality): An arrow Φ_1 → Φ_2 of cusp label representatives with γ·P_{Φ_1} = P_{Φ_2} induces tower isomorphisms and isomorphisms of torus embeddings for σ_2 = int(γ)(σ_1).
- `NormalizedBoundaryTower.conj_comp` (simp): The identifications for identity cusp arrows are identities and those for composable arrows compose; the isomorphisms commute with both tower projections and torus actions.

**Unit tests.**

- `NormalizedBoundaryTower.siegel_test` (degenerate): For the trivial auxiliary datum of a good Siegel datum the normalized tower is the integral Siegel boundary tower of ShimuraCompactifications C5.
- `NormalizedBoundaryTower.tate_test` (computation): For GL₂, after fixing and splitting a cusp, the tower is 𝔾_m over the integral normalization of the cusp field. This base is finite flat over O and may ramify at bad p-level. The ray gives 𝔸¹ and its zero section; at good level the cusp base is étale.
- `NormalizedBoundaryTower.notTorsor_test` (non-example): Over ℤ_(p), take the generic diagonal-torus torsor T U⁻¹ = p⁻¹ inside 𝔾_m². Its closure has equation pT = U, hence has empty special fibre because U is invertible. Its normalization cannot be a torsor over ℤ_(p). MP19 §4.2.9, p. 77 supplies this example; Shimura-boundary torsors require C10’s extra argument.

**Acceptance checks.**

- Generic fibres of the normalized tower are the characteristic-zero boundary tower of ShimuraCompactifications C1–C2.
- The normalized twisted torus embedding does not depend on the auxiliary cones σ_j inducing σ.

Direct prerequisites: `ShimuraCompactificationsPartII:C7/generic-toroidal-finite-map` (C7.4); `ShimuraCompactifications:C1/roadmap/boundary-torsor-tower`; `ShimuraCompactifications:C2/roadmap/partial-boundary-charts`; `ShimuraCompactifications:C5/roadmap/good-algebraic-model`; `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`.

Atlas planet: **Normalized boundary tower**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C7`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C7.9. Normalized strata of the toroidal model

`ShimuraCompactificationsPartII:C7/normalized-stratum-model` · construction · implementation: unchecked.

For a cone label Υ = [(Φ, σ)] of (G, X, K, Σ) with image Υ_j in each auxiliary model, let 𝒵_K(Υ) be the normalization of ∏_j 𝒵_{K_j}(Υ_j) (the strata of the good Siegel models) in the characteristic-zero stratum Z_K(Υ) of Sh^Σ_K. There is a canonical isomorphism 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) ≅ 𝒵_K(Υ) extending the generic one, and the map 𝒵_K(Υ) → ∏ 𝒵_{K_j}(Υ_j) ↪ ∏ 𝒜^{Σ_j}_{K_j} lifts to a map 𝒵_K(Υ) → 𝒮^Σ_K extending the locally closed immersion Z_K(Υ) ↪ Sh^Σ_K.

**Hypotheses.**

- Σ induced; the generic identification Z_{K_Φ}(Q_Φ, D_Φ, σ) ≅ Z_K(Υ) uses that the group Δ°_K(Φ) is trivial (Madapusi Pera 4.1.4, using Cartan involutions and 2.1.20).

**Proof or construction.**

- Construct both sides as normalizations of the same auxiliary objects in isomorphic generic fibres and apply uniqueness.
- The lift exists by the universal property of the normalization 𝒮^Σ_K, since 𝒵_K(Υ) is normal and flat with generic fibre in Sh^Σ_K.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §4.1.4, p. 71. Defines 𝒵_K(Υ) as the normalization of the auxiliary stratum, identifies it with the normalized closed stratum of the boundary chart, and lifts its map into 𝒮^Σ_K.
- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), Definition 9.1 and Lemma 9.12, pp. 48–51. Defines the normalized strata as open and closed pieces of preimages of auxiliary strata.

**Uses that determine the API.**

- Madapusi Pera Theorem 4.1.5(2),(3): the stratification of 𝒮^Σ_K by the 𝒵_K(Υ).

**Planning API.**

- `normalizedStratum` (constructor): 𝒵_K(Υ) with its map to 𝒮^Σ_K.
- `normalizedStratum_iso_closedStratum` (equivalence): 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) ≅ 𝒵_K(Υ), extending the generic isomorphism.
- `normalizedStratum_generic` (compatibility): The generic fibre of 𝒵_K(Υ) → 𝒮^Σ_K is the locally closed immersion Z_K(Υ) ↪ Sh^Σ_K.
- `normalizedStratum_independent` (compatibility): Equivalent cusp-pair representatives give canonically isomorphic normalized strata, and these isomorphisms satisfy the composition law inherited from the generic representatives.

**Unit tests.**

- `normalizedStratum_interior_test` (degenerate): For the cone label of the trivial cusp (Φ = (G, X^+, 1), σ = 0), 𝒵_K(Υ) is a component of the interior 𝒮_K.
- `normalizedStratum_cusp_test` (computation): For a neat modular curve, the normalized cusp is the integral closure of O in the cusp field: finite flat, but not necessarily étale. Full level p for odd p gives a cyclotomic ramification example after fixing the prime-to-p level.
- `normalizedStratum_notClosed_test` (non-example): If the closure of a generic stratum contains a strictly smaller stratum, its immersion is not closed. Positive codimension alone is insufficient: a zero-dimensional modular cusp can be closed.

**Acceptance checks.**

- The generic fibre of 𝒵_K(Υ) → 𝒮^Σ_K is the locally closed stratum of Sh^Σ_K.
- 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) ≅ 𝒵_K(Υ) canonically.

Direct prerequisites: `ShimuraCompactificationsPartII:C7/normalized-boundary-tower` (C7.8); `ShimuraCompactificationsPartII:C7/normalized-toroidal-model` (C7.5); `ShimuraCompactifications:C2/roadmap/arithmetic-gluing`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C7`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C7.10. Normalized models over the cyclotomic integers

`ShimuraCompactificationsPartII:C7/cyclotomic-normalized-model` · construction · implementation: unchecked.

Let ℤ_p^cycl := ℤ_p[ζ_{p^∞}] = ⋃_m ℤ_p[ζ_{p^m}] (the noncompleted union) and ℚ_p^cycl its fraction field. For J and Σ as in C7/normalized-toroidal-model with O = ℤ_p (E_v = ℚ_p, or after base change), 𝒮^Σ_{K,ℤ_p^cycl} is the normalization of ∏_j 𝒜^{Σ_j}_{K_j} ⊗ ℤ_p^cycl in Sh^Σ_K ⊗ ℚ_p^cycl. It is the inverse limit (union of rings on affines) of the normalizations 𝒮^Σ_{K,ℤ_p[ζ_{p^m}]}; it is normal and flat over the nonnoetherian valuation ring ℤ_p^cycl; its interior is the analogous normalization of the interiors; and the natural map to 𝒮^Σ_K ⊗_{ℤ_p} ℤ_p^cycl is integral and an isomorphism over the generic fibre, but in general not an isomorphism.

**Hypotheses.**

- ℤ_p^cycl denotes the union ℤ_p[ζ_{p^∞}], not its p-adic completion; the p-adically completed variant is the p-adic completion of this model.
- No noetherian hypothesis is available, so finiteness is proved at each finite level m and passed to the limit.

**Proof or construction.**

- At each m, ℤ_p[ζ_{p^m}] is a complete discrete valuation ring and C7/normalized-toroidal-model applies with O = ℤ_p[ζ_{p^m}].
- Integral closure commutes with filtered unions of the coefficient rings: an element integral over ⋃ R_m is integral over some R_m, so the normalization over ℤ_p^cycl is the colimit of rings of the normalizations at finite level on affine charts.
- A filtered union of integrally closed rings inside the generic algebra is integrally closed: every integral equation and its element occur at a finite stage. The resulting algebra is torsion-free over the valuation ring ℤ_p^cycl, hence flat. No flatness of transition maps between normalizations is used.
- For odd p, full level p has cyclotomic component algebra ℤ_p[ζ_p]. Its tensor product with ℤ_p^cycl has generically separated components which meet in characteristic p, so it is not normal. Normalization separates them.

**Sources and match.**

- [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.4.19, Remark 3.4.22 and §3.4.23, p. 40. Defines the model over ℤ_p^cycl as the normalization of the product of auxiliary spaces base changed to ℤ_p^cycl and remarks that the map to the base change of the ℤ_p-model is in general not an isomorphism.

**Uses that determine the API.**

- IgusaVarietiesAndTorsionConcentration Part II (Boxer–Pilloni Lemma 3.4.24): the ordinary Igusa formal scheme embeds openly into the p-adic completion of the ℤ_p^cycl model.
- Boxer–Pilloni §3.4.17: the perfectoid and Igusa comparisons take place over ℤ_p^cycl.

**Planning API.**

- `CyclotomicNormalizedModel` (constructor): 𝒮^Σ_{K,ℤ_p^cycl} with its integral map to the auxiliary product. Finiteness is asserted at each finite cyclotomic stage, not deduced for the infinite union.
- `CyclotomicNormalizedModel.colimit` (characterisation): On affine opens of the product its ring of functions is the union over m of the rings of 𝒮^Σ_{K,ℤ_p[ζ_{p^m}]}.
- `CyclotomicNormalizedModel.toBaseChange` (data): The integral map 𝒮^Σ_{K,ℤ_p^cycl} → 𝒮^Σ_K ⊗ ℤ_p^cycl, an isomorphism after inverting p.
- `CyclotomicNormalizedModel.normal_flat` (other): 𝒮^Σ_{K,ℤ_p^cycl} is normal and flat over ℤ_p^cycl.
- `CyclotomicNormalizedModel.hom_ext` (extensionality): Maps into the separated cyclotomic normalized model from a flat ℤ_p^cycl-space agree if they agree after inverting p; no Noetherian assertion is required.

**Unit tests.**

- `CyclotomicNormalizedModel.trivial_test` (degenerate): For the Siegel datum at hyperspecial level, the ℤ_p^cycl model is the base change 𝒜^Σ_K ⊗ ℤ_p^cycl, which is already normal.
- `CyclotomicNormalizedModel.notIso_test` (non-example): For odd p and GL_2 at full level K = K^pK(p), the scheme of connected components of the generic fibre is Spec ℚ_p(ζ_p) (Weil pairing), whose normalization over ℤ_p is Spec ℤ_p[ζ_p]. Its base change to ℤ_p^cycl is Spec(ℤ_p[ζ_p] ⊗_{ℤ_p} ℤ_p^cycl), which is not normal: its generic fibre is a product of p − 1 copies of ℚ_p^cycl while its special fibre is local. Hence 𝒮_{K,ℤ_p^cycl} → 𝒮_K ⊗ ℤ_p^cycl is not an isomorphism.
- `CyclotomicNormalizedModel.notNoetherian_test` (non-example): ℤ_p^cycl is not noetherian: the ideals (ζ_{p^m} − 1) form a strictly increasing chain whose union is the maximal ideal, which is not finitely generated.

**Acceptance checks.**

- The ℤ_p^cycl model is the union of the models over ℤ_p[ζ_{p^m}].
- Its map to the base change of the ℤ_p model is an isomorphism after inverting p but not in general.

Direct prerequisites: `ShimuraCompactificationsPartII:C7/normalized-toroidal-model` (C7.5); `mathlib:IsCyclotomicExtension`; `mathlib:integralClosure`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C7`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

## C8. Normalized PEL compactifications with lattice collections

Lan16 normalized PEL interior, minimal and toroidal models for lattice collections, at arbitrary ramification and level. Construct the minimal section-ring Proj using global Hodge ampleness and proper birational Stein factorization (Propositions 6.1, 6.4, Lemma 7.9 and Proposition 7.11); it supplies, rather than assumes, the parent normalized-blowup input. Boundary charts consist of torus torsors over proper normal intermediate models, with abelian-torsor descriptions only where separately justified. Plan stratification and formal completions (Theorems 9.13 and 10.13), the valuation-wise cone universal property and auxiliary independence (Theorems 11.2–11.4, Corollary 11.7), minimal strata and functoriality (§§12–13). Propositions 14.1–14.2 transfer the listed fibre properties and smooth-fan regularity. An additional relative-lci transfer remains a conditional target with its missing chart argument recorded explicitly.

Layer prerequisites: `ShimuraCompactificationsPartII:C7`; `ShimuraCompactifications:C4`; `ShimuraCompactifications:C5`; `PELModuli:M1`; `PELModuli:M2`; `ModularCurvesPartII:R13.4a`; `SchemeAndStackFoundations:SF.4`; `ShimuraCompactifications:C1`; `ShimuraCompactifications:C0`; `ShimuraCompactifications:C3`; `SchemeAndStackFoundations:SF.0`.

### C8.1. PEL data with a collection of lattices

`ShimuraCompactificationsPartII:C8/pel-lattice-collection` · definition · implementation: unchecked.

Fix an integral PEL datum (O, ⋆, L, ⟨·,·⟩, h_0) with reflex field F_0 satisfying Lan's condition 1.4.3.10, a prime p (with no unramifiedness assumption), and an open compact H ⊂ G(Ẑ) whose image in G(Ẑ^p) is neat. A lattice collection is a finite family {(g_j, L_j, ⟨·,·⟩_j)}_{j∈J}, where g_j ∈ G(𝔸_f), L_j ⊂ L ⊗ ℚ is an O-lattice with a pairing ⟨·,·⟩_j that is a positive rational multiple of ⟨·,·⟩ and integral on L_j, stable under g_j^{-1}Hg_j. Each j defines a PEL moduli problem M_{H_j} isomorphic to M_H in characteristic zero (by g_j-translated quasi-isogeny), and for each j an auxiliary good-reduction moduli problem M_{H_j,aux} over O_{F_{0,j,aux},(p)} obtained by Zarhin's trick when ⟨·,·⟩_j is not prime to p, by restricting the O-action to a subalgebra unramified at p, and by keeping only the level away from p. The collection J determines the morphism M_H → ∏_{j∈J} M_{H_j,aux} ⊗ ℚ.

**Hypotheses.**

- Lan's condition 1.4.3.10 on the integral PEL datum (achievable by modifying the integral data).
- H^p neat; no hypothesis on the level at p, on ramification of O at p or on the residue characteristic.

**Proof or construction.**

- Define each M_{H_j} as Lan's moduli problem for the j-th lattice; the characteristic-zero isomorphism M_H ≅ M_{H_j} is the quasi-isogeny twist of Lan16 §3.
- Construct the auxiliary problems and the morphisms (4.13)–(4.15) as in Lan16 §4: Zarhin's trick (C7/zarhin-self-dual-replacement), restriction of the endomorphism structure, and level away from p.

**Sources and match.**

- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), §2, Examples 2.3–2.5, pp. 6–8; §§3–4, pp. 8–24. Sets up PEL moduli at arbitrary level and ramification with a collection of lattices twisted by group elements, and auxiliary good-reduction moduli problems with morphisms to them (Zarhin's trick, restricted endomorphisms, level away from p).

**Uses that determine the API.**

- Lan16 Propositions 6.1, 6.4 and §7: the collection indexes the auxiliary product that is normalized.
- Pilloni Theorem 6.1.5.1, p. 29: the Klingen model is the collection {V_1 ⊂ V} and the paramodular model the singleton {V_1}.
- Lan17 Theorem 6.1, as used by ShimuraCompactifications C5.31: the minimal model input is indexed by the same collection J.

**Planning API.**

- `PELLatticeCollection` (structure): The family (g_j, L_j, ⟨·,·⟩_j)_{j∈J} with its stability under H and its integrality.
- `PELLatticeCollection.moduli` (data): For each j the moduli problem M_{H_j} and the characteristic-zero isomorphism M_H ≅ M_{H_j}.
- `PELLatticeCollection.aux` (data): For each j the auxiliary good-reduction moduli problem M_{H_j,aux} and the morphism M_H → M_{H_j,aux} ⊗ ℚ.
- `PELLatticeCollection.sub` (functoriality): For J′ ⊂ J and H ⊂ H′ satisfying the conditions for H′, the subcollection defines a lattice collection for H′.
- `PELLatticeCollection.toAuxiliarySiegel` (compatibility): An auxiliary problem may retain a nontrivial unramified endomorphism algebra and is then a good PEL problem. Taking the retained algebra to be ℤ, or composing its forgetful morphism, gives auxiliary Siegel data; type A or C alone does not identify a PEL moduli problem with Siegel moduli.
- `PELLatticeCollection.reindex` (functoriality): A bijection of the finite index set reindexes the lattice collection and canonically identifies the products of auxiliary moduli, compatibly with the generic diagonal map.

**Unit tests.**

- `PELLatticeCollection.singleton_test` (degenerate): For the singleton identity collection, a good PEL datum and full hyperspecial H_p, the auxiliary problem can be chosen to be M_H. Good p alone is insufficient when H_p has deeper level.
- `PELLatticeCollection.parahoric_test` (computation): For a self-dual multichain of lattices L_0 ⊂ L_1 ⊂ ⋯ ⊂ L_m = p^{-1}L_0 and J ⊂ {0, …, m}, the collection {L_j}_{j∈J} defines the parahoric problem of Lan16 Example 2.4; different J give in general different normalized models.
- `PELLatticeCollection.paramodular_test` (computation): For GSp_4 and the lattice V_1 = pe_1ℤ ⊕ e_2ℤ ⊕ e_3ℤ ⊕ e_4ℤ with the restricted form, the singleton {V_1} gives the moduli of abelian surfaces with a polarization of degree p² (Pilloni §6.1.3).
- `PELLatticeCollection.notGood_test` (non-example): For the paramodular singleton the moduli problem M_{H_j} is not smooth over ℤ_p, so it cannot serve as its own auxiliary model; Zarhin's trick is required.

**Acceptance checks.**

- Every PEL datum and level with neat prime-to-p part admits a lattice collection with auxiliary good moduli.
- For the singleton good-prime collection with full hyperspecial H_p, the auxiliary problem can be M_H itself.

Direct prerequisites: `PELModuli:M1`; `PELModuli:M2`; `ShimuraCompactificationsPartII:C7/zarhin-self-dual-replacement` (C7.2).

Atlas planet: **PEL lattice collection**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C8`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C8.2. Normalized interior and minimal models

`ShimuraCompactificationsPartII:C8/pel-normalized-minimal` · construction · implementation: unchecked.

For a lattice collection J (C8/pel-lattice-collection), let M⃗_H be the normalization of ∏_{j∈J} M_{H_j,aux} in M_H, and M⃗^min_H the normalization of ∏_{j∈J} M^min_{H_j,aux} in M_H, where M^min_{H_j,aux} are the good-reduction minimal compactifications. Then: M⃗_H is a normal algebraic stack, flat over S⃗_0 = Spec O_{F_0,(p)}, with generic fibre M_H and a finite morphism to ∏ M_{H_j,aux}; for each j the tautological object over M_H extends to a polarized abelian scheme with O-structure (A⃗_j, λ⃗_j, i⃗_j) over M⃗_H satisfying the determinant condition, with level structure only over M_H; ω_{M_H} extends to ω_{M⃗_H, j} = ∧^top Lie^∨ A⃗_j. M⃗^min_H is a normal projective flat scheme over S⃗_0 containing M⃗_H as an open dense subscheme, with a finite morphism to ∏ M^min_{H_j,aux}, on which the line bundle ω_{M⃗^min_H, J}, the pullback of the external tensor product of ω^{⊗a_{j,0}}, is ample and restricts to ω^{⊗a_J}_{M_H} with a_J = Σ_j a_j.

**Hypotheses.**

- As in C8/pel-lattice-collection; a_{j,0}, a_j ≥ 1 are the integers of Lan16 Lemma 5.30 making the auxiliary Hodge powers descend and be ample.

**Proof or construction.**

- Normalize the product of auxiliary interiors and of auxiliary minimal compactifications in M_H (finite over excellent bases, hence finite).
- Extend each tautological abelian scheme: the auxiliary one pulled back from M_{H_j,aux} is determined by A_j via Lan16 Lemma 4.1 (Zarhin), and the O-structure extends uniquely over the noetherian normal base by extension of homomorphisms (ShimuraCompactifications C4).
- Ampleness: the pullback of an ample line bundle under a finite morphism is ample; projectivity and normality of M⃗^min_H follow; its restriction to M_H is ω^{a_J} by Lan16 Lemma 5.30.

**Sources and match.**

- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), Proposition 6.1, pp. 32–34, and Proposition 6.4, pp. 34–35. Defines the normalized interior and minimal models by normalization of products of auxiliary good-reduction models, proves normality, flatness, finiteness over the auxiliary products, the extension of the tautological polarized abelian schemes over the interior, and ampleness of the extended Hodge line on the minimal model.

**Uses that determine the API.**

- ShimuraCompactifications C5.31 (Lan17 Theorem 6.1): the normal projective flat minimal model M̃^min_{H,J} that its normalized blow-ups require.
- Pilloni §6.2.2, p. 30: the paramodular minimal compactification X^⋆_par.
- Pilloni pp. 71–72 and 101: the Klingen minimal compactification X^⋆_Kli(p).

**Planning API.**

- `PELNormalizedModel` (constructor): M⃗_H with its finite map to ∏ M_{H_j,aux} and generic identification.
- `PELNormalizedModel.family` (data): For each j the polarized abelian scheme with O-structure (A⃗_j, λ⃗_j, i⃗_j) over M⃗_H extending the tautological one.
- `PELNormalizedMinimal` (constructor): M⃗^min_H with its finite map to ∏ M^min_{H_j,aux}, containing M⃗_H as an open dense subscheme.
- `PELNormalizedMinimal.ample` (other): ω_{M⃗^min_H, J} is ample and restricts to ω^{⊗a_J} on M_H.
- `PELNormalizedMinimal.projective_normal_flat` (other): M⃗^min_H is projective, normal and flat over S⃗_0.
- `PELNormalizedMinimal.normalization_lift` (universal-property): A normal flat test space mapping to the auxiliary minimal product with the specified generic lift has a unique compatible lift to its normalization. Apply the analogous statement to the open interior and require compatibility with the families.

**Unit tests.**

- `PELNormalizedMinimal.good_test` (compatibility): At a good prime with the identity singleton and full hyperspecial H_p, this is the good-prime integral minimal model of parent C5.
- `PELNormalizedMinimal.modular_test` (computation): For GL₂ with Γ₀(p) and sufficiently small prime-to-p level, compare this normalization with the normal integral coarse curve of ModularCurvesPartII R13.4a; that comparison, rather than generic equality alone, identifies X₀(p). The weight-12 form Δ restricts to the usual discriminant on the interior.
- `PELNormalizedModel.levelOnlyGeneric_test` (non-example): For the singleton paramodular collection the level-p structure of the tautological object is not defined over the special fibre; only the polarization of degree p² is.

**Acceptance checks.**

- M⃗^min_H is normal, projective and flat over S⃗_0 with ample ω_J.
- At a good prime with full hyperspecial H_p and the singleton collection it is the good-prime minimal compactification.

Direct prerequisites: `ShimuraCompactificationsPartII:C8/pel-lattice-collection` (C8.1); `ShimuraCompactifications:C5/roadmap/integral-minimal-space`; `ShimuraCompactifications:C5/roadmap/minimal-hodge-ampleness`; `ShimuraCompactifications:C4/roadmap/homomorphism-extension`; `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`; `ModularCurvesPartII:R13.4a`.

Atlas planet: **Normalized minimal compactification**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C8`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C8.3. Normalized toroidal models and their contraction

`ShimuraCompactificationsPartII:C8/pel-normalized-toroidal` · theorem · implementation: unchecked.

Let Σ_j be compatible smooth projective admissible cone decompositions for the auxiliary problems and Σ the induced (possibly nonsmooth) decomposition for M_H. The normalization M⃗^tor_{H,Σ} of ∏_j M^tor_{H_j,aux,Σ_j} in M_H is a scheme proper and flat over S⃗_0 with a finite morphism to the auxiliary product; M⃗_H is the dense open preimage of the auxiliary interiors; the auxiliary contractions induce a proper morphism ∮⃗_H : M⃗^tor_{H,Σ} → M⃗^min_H, and M⃗^min_H ≅ Proj(⊕_{k≥0} Γ(M⃗^tor_{H,Σ}, ω^{⊗k}_{J})) compatibly with ∮⃗_H.

**Hypotheses.**

- Σ_j smooth projective with Lan's condition 6.2.5.25; Σ induced by pulling back products of cones (C7/induced-cone-decomposition).

**Proof or construction.**

- Proper flatness from finiteness over the proper smooth auxiliary product and torsion-freeness; the open dense interior by Zariski's main theorem.
- The contraction is induced from the auxiliary contractions by the universal property of normalization.
- The contraction is proper and birational onto the normal minimal model, so its direct image of O is O by Stein factorization. The line ω_J is pulled back from an ample line on the entire minimal model (not just the interior). The projection formula identifies the section rings; taking Proj of the section ring of an ample line recovers the minimal model (Lan16 Proposition 7.11).

**Sources and match.**

- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), (7.7)–(7.8), Lemma 7.9 and Proposition 7.11, pp. 37–38. Defines the normalized toroidal model from the product of auxiliary toroidal compactifications, proves it proper flat with dense interior, and identifies the normalized minimal model with the Proj of the sections of powers of the pulled-back Hodge line.

**Acceptance checks.**

- For the singleton good-prime collection and smooth Σ this is the good-prime toroidal model (Lan16 Corollary 11.8).

Direct prerequisites: `ShimuraCompactificationsPartII:C8/pel-normalized-minimal` (C8.2); `ShimuraCompactificationsPartII:C7/induced-cone-decomposition` (C7.3); `ShimuraCompactifications:C5/roadmap/integral-toroidal-space`; `ShimuraCompactifications:C5/roadmap/integral-minimal-space`; `SchemeAndStackFoundations:SF.4`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C8`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C8.4. Putative boundary charts by normalization

`ShimuraCompactificationsPartII:C8/pel-putative-charts` · construction · implementation: unchecked.

For a cusp label representative (Z_H, Φ_H, δ_H) of M_H, inducing auxiliary representatives for each j, define by normalization of the corresponding auxiliary boundary objects in the characteristic-zero ones: the normalized boundary moduli M⃗^{Z_H}_H (with degenerating families of the boundary abelian parts), a proper normal flat boundary base C⃗_{Φ_H,δ_H} over an intermediate finite normal cover M⃗_{Φ_H} → M⃗^{Z_H}_H, whose characteristic-zero map is an abelian-scheme torsor, the E_{Φ_H}-torsor Ξ⃗_{Φ_H,δ_H} → C⃗_{Φ_H,δ_H} for the split torus E_{Φ_H} with character group S_{Φ_H}, and for each σ ∈ Σ_{Φ_H} the affine torus embedding Ξ⃗_{Φ_H,δ_H}(σ) with its σ-stratum Ξ⃗_{Φ_H,δ_H,σ}, the preimage of the auxiliary strata. If σ is smooth, Ξ⃗(σ) → C⃗ is smooth and surjective, Ξ⃗_σ is an E_{Φ_H,σ}-torsor over C⃗, smooth over C⃗ and hence flat over S⃗_0 when C⃗ is.

**Hypotheses.**

- Same setting as C8/pel-normalized-toroidal; σ ⊂ P^+_{Φ_H}.

**Proof or construction.**

- Normalize the auxiliary boundary moduli in the characteristic-zero boundary moduli (Lan16 Proposition 7.4), then the auxiliary abelian torsors and torus torsors (Propositions 8.1, 8.4, 8.7).
- The torus E_{Φ_H} acts on the normalization because it acts compatibly on the auxiliary torsors and on the generic fibre; Proposition 8.14 shows that for smooth σ the normalized torus embedding is the relative torus embedding of a torsor, by comparing with the auxiliary embeddings along the finite map of tori.
- Lemma 8.20 identifies the σ-stratum with the preimage of the auxiliary strata.

**Sources and match.**

- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), Propositions 7.4, 8.1, 8.4, 8.7 and 8.14, Lemma 8.20, pp. 36–45. Constructs the normalized pure bases, proper normal intermediate boundary bases, torus torsors and embeddings. The middle boundary map need not be an abelian-scheme torsor at bad level; smoothness over C⃗ for smooth cones does not imply smoothness of C⃗ over the pure base.

**Uses that determine the API.**

- Lan16 Theorems 9.13 and 10.13: the strata and formal completions of M⃗^tor are compared with these charts.
- Pilloni §6.1.5.2, pp. 27–28: the towers M_{W,γ,par} → B_{W,γ,par} → Y_{W,γ,par} and their Klingen analogues are instances.

**Planning API.**

- `PutativeBoundaryChart` (structure): The tower Ξ⃗ → C⃗ → M⃗^{Z_H}_H with the E_{Φ_H}-action on Ξ⃗.
- `PutativeBoundaryChart.embedding` (constructor): For σ ∈ Σ_{Φ_H}, the torus embedding Ξ⃗(σ) ⊃ Ξ⃗ and its σ-stratum.
- `PutativeBoundaryChart.smooth_of_smoothCone` (other): For smooth σ, Ξ⃗(σ) → C⃗ is smooth and surjective and Ξ⃗_σ is an E_{Φ_H,σ}-torsor over C⃗.
- `PutativeBoundaryChart.formalCompletion` (constructor): The formal completion X⃗_{Φ_H,δ_H,σ} of Ξ⃗(σ) along Ξ⃗_σ, with its Mumford family.
- `PutativeBoundaryChart.generic` (compatibility): In characteristic zero these are the boundary objects of Lan's book.
- `PutativeBoundaryChart.action` (structure): The torus action on Ξ⃗ extends to Ξ⃗(σ), and the maps to C⃗, stratum immersion and change-of-representative maps are equivariant. This imposes no smoothness condition on C⃗ itself.

**Unit tests.**

- `PutativeBoundaryChart.good_test` (degenerate): At a good prime with the singleton collection the charts are those of ShimuraCompactifications C5.1.
- `PutativeBoundaryChart.tate_test` (computation): For the modular curve at a cusp, M⃗^{Z_H}_H is finite over S⃗_0, C⃗ = M⃗^{Z_H}_H, Ξ⃗ is a 𝔾_m-torsor and Ξ⃗(ℝ_{≥0}) its line bundle.
- `PutativeBoundaryChart.nonsmooth_test` (non-example): For a nonsmooth two-dimensional cone σ ⊂ ℝ² with rays (1, 0), (1, 2), the affine torus embedding Spec ℤ[x, xy, xy²] is singular at the closed orbit, so Ξ⃗(σ) is not smooth over C⃗.

**Acceptance checks.**

- For smooth σ, Ξ⃗(σ) is smooth over C⃗ and its σ-stratum is a torsor.
- At a good prime the charts are those of Lan's book.

Direct prerequisites: `ShimuraCompactificationsPartII:C8/pel-normalized-toroidal` (C8.3); `ShimuraCompactifications:C5/roadmap/good-algebraic-model`; `ShimuraCompactifications:C1/roadmap/boundary-torsor-tower`; `ShimuraCompactifications:C0`.

Atlas planet: **Putative boundary charts**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C8`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C8.5. Strata and formal completions of normalized PEL models

`ShimuraCompactificationsPartII:C8/pel-strata-completions` · theorem · implementation: unchecked.

In the setting of C8/pel-normalized-toroidal: (1) M⃗^tor_{H,Σ} is stratified by locally closed subschemes Z⃗[(Φ_H, δ_H, σ)] indexed by equivalence classes with σ ⊂ P^+_{Φ_H}, σ ∈ Σ_{Φ_H}, each open and closed in the preimage of the corresponding auxiliary stratum, with Z⃗[τ′] in the closure of Z⃗[τ] if and only if τ is a face of τ′; (2) the formal completion of M⃗^tor_{H,Σ} along Z⃗[(Φ_H, δ_H, σ)] is canonically isomorphic to X⃗_{Φ_H,δ_H,σ} itself under the standing neatness hypothesis, compatibly with the auxiliary completions; (3) each stratum is isomorphic to Ξ⃗_{Φ_H,δ_H,σ}, an E_{Φ_H,σ}-torsor over C⃗_{Φ_H,δ_H}, hence flat over S⃗_0 and normal, proper over M⃗^{Z_H}_H when σ is top-dimensional; (4) M⃗_H ⊗ 𝔽_p is dense in M⃗^tor_{H,Σ} ⊗ 𝔽_p, and closure relations of strata hold fibrewise in characteristic p.

**Hypotheses.**

- Same setting; strata use the reduced structure.

**Proof or construction.**

- Strata: compare with the auxiliary strata through the finite map (7.8) and the universal property (Lan16 Lemmas 9.3–9.12, Theorem 9.13).
- Completions: the canonical map from the putative chart completion to the completion of M⃗^tor is finite, and both sides are excellent normal and flat with isomorphic rational fibres after refining to a common smooth refinement (Lan16 (10.1)–(10.14)); Zariski's main theorem gives Theorem 10.13.
- Corollary 10.15 reads off the strata; density of the interior special fibre (Corollary 10.18) follows from flatness of the strata and the description of completions; Corollary 11.9 gives fibrewise closure relations.

**Sources and match.**

- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), Theorem 9.13, p. 51; Theorem 10.13, pp. 53–54; Corollaries 10.15 and 10.18, pp. 54–55; Corollary 11.9, p. 57. Proves the stratification of the normalized toroidal model with its incidence relation, the isomorphism of formal completions with the putative charts, the torsor description and flatness of the strata, and density of the interior in the special fibre.

**Acceptance checks.**

- No irreducible component of M⃗^tor_{H,Σ} ⊗ 𝔽_p lies in the boundary.
- For the singleton good-prime collection and smooth Σ the stratification is that of Lan's book (Lan16 Corollary 11.8).

Direct prerequisites: `ShimuraCompactificationsPartII:C8/pel-putative-charts` (C8.4); `ShimuraCompactificationsPartII:C8/pel-normalized-toroidal` (C8.3); `ShimuraCompactifications:C5/roadmap/formal-completion`.

Atlas planet: **Boundary strata of normalized models**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C8`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C8.6. Degenerating families and the universal property

`ShimuraCompactificationsPartII:C8/pel-degenerating-families` · theorem · implementation: unchecked.

(1) For each j ∈ J the polarized abelian scheme (A⃗_j, λ⃗_j, i⃗_j) over M⃗_H extends to a degenerating family (G⃗_j, λ⃗_j, i⃗_j, α⃗_{H_j}) of type M_{H_j} over M⃗^tor_{H,Σ} (a semi-abelian scheme with polarization and O-structure, abelian over M⃗_H), whose pullback to each completed chart X⃗_{Φ_H,δ_H,σ} is the Mumford family. (2) Universal property: if S is an irreducible noetherian normal S⃗_0-scheme with generic point η, η → M_H, and for each j a degenerating family of type M_{H_j} over S inducing η → M_{H_j}, then η → M_H extends (uniquely) to S → M⃗^tor_{H,Σ} if and only if at each geometric point s of S there is one cone of Σ containing the valuation vectors of every compatible discrete-valuation test through s (Lan16 Theorem 7.14's condition). (3) Consequently M⃗^tor_{H,Σ} depends only on the lattice collection, not on the auxiliary choices.

**Hypotheses.**

- Same setting; level structures of the extended families are defined only over M_H.

**Proof or construction.**

- Write M⃗^tor as an increasing union of opens U_i with U_0 = M⃗_H, each U_{i+1} ∖ U_i a closed stratum; extend the family across each stratum using the Mumford family on its completed chart and fpqc descent (Lan16 Lemma 11.1).
- For (2), the degenerating families of type M_{H_j} determine auxiliary families over S by Lan16 Proposition 5.24, unique by extension of homomorphisms over normal bases, and Theorem 7.14 applies.
- (3) is Lan16 Corollary 11.7: the universal property of (2) involves no auxiliary data.

**Sources and match.**

- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), Lemma 11.1, Theorem 11.2, Theorem 11.4 and Corollary 11.7, pp. 55–57; Theorem 7.14, p. 38. Extends the tautological families over the normalized toroidal model, proves the universal property for degenerating families over noetherian normal bases, and deduces independence of auxiliary choices.

**Acceptance checks.**

- For the Siegel collection of Boxer–Pilloni §3.4.19 this gives semi-abelian G over A^tor_{g,d} extending the universal abelian scheme, with G^∨ and λ from the j-family (C13/siegel-bad-level-toroidal).

Direct prerequisites: `ShimuraCompactificationsPartII:C8/pel-strata-completions` (C8.5); `ShimuraCompactifications:C4/roadmap/homomorphism-extension`; `ShimuraCompactifications:C4/roadmap/degeneration-effectivity`; `ShimuraCompactifications:C4/roadmap/mumford-quotient`.

Atlas planet: **Tautological degenerating families**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C8`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C8.7. Strata of normalized minimal models

`ShimuraCompactificationsPartII:C8/pel-minimal-strata` · theorem · implementation: unchecked.

M⃗^min_H is stratified by locally closed subschemes Z⃗[(Φ_H, δ_H)] indexed by cusp labels, each canonically isomorphic to the normalized boundary moduli M⃗^{Z_H}_H; the contraction ∮⃗_H maps the toroidal stratum Z⃗[(Φ_H, δ_H, σ)] onto Z⃗[(Φ_H, δ_H)], and this surjection is the composite of Z⃗[(Φ_H, δ_H, σ)] ≅ Ξ⃗_{Φ_H,δ_H,σ} → M⃗^{Z_H}_H with the stratum isomorphism; it is proper when σ is top-dimensional. The fibres of ∮⃗_H are geometrically connected.

**Hypotheses.**

- Same setting.

**Proof or construction.**

- Strata of M⃗^min_H are defined via the auxiliary minimal strata and the finite map (6.6) (Lan16 Theorem 12.1).
- Geometric connectedness of fibres of ∮⃗_H: Stein factorization and normality (Lan16 Lemma 12.9).
- Identification of the strata with M⃗^{Z_H}_H by comparing formal completions of strict local rings (Lan16 Proposition 12.14, Theorem 12.16).

**Sources and match.**

- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), Theorem 12.1, p. 58; Lemma 12.9 and Proposition 12.14, pp. 60–61; Theorem 12.16, p. 62. Stratifies the normalized minimal model by cusp labels with strata isomorphic to the normalized boundary moduli, and describes the contraction on strata.

**Acceptance checks.**

- For the modular curve the strata of M⃗^min_H are the interior and the finite flat cusps.

Direct prerequisites: `ShimuraCompactificationsPartII:C8/pel-strata-completions` (C8.5); `ShimuraCompactificationsPartII:C8/pel-normalized-toroidal` (C8.3); `ShimuraCompactifications:C5/roadmap/integral-minimal-space`; `SchemeAndStackFoundations:SF.4`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C8`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C8.8. Level changes and Hecke twists of normalized PEL models

`ShimuraCompactificationsPartII:C8/pel-functoriality` · theorem · implementation: unchecked.

(1) For H ⊂ H′ and a subcollection J′ ⊂ J satisfying the conditions for H′, there are canonical morphisms M⃗_{H,J} → M⃗_{H′,J′}, M⃗^min_{H,J} → M⃗^min_{H′,J′} and, for compatible Σ, Σ′, M⃗^tor_{H,Σ,J} → M⃗^tor_{H′,Σ′,J′}, extending the characteristic-zero maps and mapping strata to strata. (2) Hecke twists by g ∈ G(𝔸_f^p) act compatibly. (3) These morphisms are proper but need not be finite, even on the interior: for a lattice-chain collection mapping to a singleton subcollection the map can contract curves (Lan16 Remark 13.10 and Example 13.12).

**Hypotheses.**

- Same setting; compatibility of Σ and Σ′ means each cone of Σ maps into a cone of Σ′.

**Proof or construction.**

- Induce the morphisms from projections of the auxiliary products onto the J′-factors and the universal property of normalization (Lan16 Proposition 13.1).
- Toroidal and minimal versions as in Lan16 Propositions 13.4–13.9; Hecke twists by changing g_j (Lan16 Example 13.14, Propositions 13.15–13.19).
- The non-finiteness example is Lan16 Example 13.12.

**Sources and match.**

- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), Propositions 13.1, 13.4, 13.7, 13.9, Remark 13.10, Examples 13.11–13.14, Propositions 13.15 and 13.19, pp. 62–68. Constructs the functorial morphisms for level change and subcollections, the Hecke twists, and shows by example that lattice-chain-to-singleton maps can be nonfinite.

**Acceptance checks.**

- The Klingen-to-spherical and Klingen-to-paramodular maps of Pilloni are instances with J′ ⊂ J (C14/klingen-projections).

Direct prerequisites: `ShimuraCompactificationsPartII:C8/pel-degenerating-families` (C8.6); `ShimuraCompactificationsPartII:C8/pel-minimal-strata` (C8.7); `ShimuraCompactifications:C3/roadmap/level-datum-functoriality`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C8`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C8.9. Local properties pass from the interior to the boundary

`ShimuraCompactificationsPartII:C8/pel-local-properties` · theorem · implementation: unchecked.

**Conditional target: the independent review could not close the proof contract.** The missing step is stated below and in Exact gaps.

Let P be one of: reduced, geometrically reduced, normal, geometrically normal, Cohen–Macaulay, (R_0), geometric (R_0), (R_1), geometric (R_1), (S_i) for some i. A fibre of M⃗^tor_{H,Σ} → S⃗_0 has P if and only if the corresponding fibre of M⃗_H does. If Σ is smooth, P may also be regular, geometrically regular, (R_i) or geometric (R_i); in particular M⃗_H is regular if and only if M⃗^tor_{H,Σ} is. A proposed additional target is: for smooth Σ, relative lci of M⃗_H over S⃗_0 implies relative lci of M⃗^tor_{H,Σ}. This last implication is conditional on gap/pel-lci-transfer; it is not one of Lan16 Propositions 14.1–14.2.

**Hypotheses.**

- Same setting; the last two assertions require Σ smooth.

**Proof or construction.**

- By Lan16 Theorems 9.13 and 10.13 every complete local ring of M⃗^tor at a point s of a stratum Z⃗[(Φ_H, δ_H, σ)] is a complete local ring of Ξ⃗(σ) at a point of Ξ⃗_σ; the points of Spec of this ring off the boundary lie over points of M⃗_H, and every point of Ξ⃗ generizes a point of Ξ⃗_σ.
- Hence a property P of excellent local rings that ascends and descends along flat local maps with geometrically regular fibres (completion, smooth morphisms; EGA IV₂ 6.5.3 and 7.8.3) passes from M⃗_H to Ξ⃗, from Ξ⃗ to C⃗ along the smooth surjection Ξ⃗ → C⃗, and back up to Ξ⃗(σ) and to M⃗^tor when Ξ⃗(σ) → C⃗ is smooth (σ smooth); this is Lan16 Propositions 14.1–14.2.
- For the additional relative-lci target, smooth descent itself is available: Stacks Lemma 37.62.20 (069P) makes lci local for smooth surjective covers of the source. What remains to be supplied is a proof that the required lci property on the punctured completed Shimura charts yields relative lci on the whole open torus torsor, and then on C⃗ and the completed embedding. Merely saying that lci is detected on completions does not establish that transfer. Pilloni’s genus-two argument instead uses the explicit modular-curve boundary bases, and is recorded separately in C14/normal-lci.

**Sources and match.**

- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), Propositions 14.1–14.2 and Corollary 14.4, pp. 69–70. Proves that regularity (for smooth Σ) and the listed fibre properties hold for the normalized toroidal model exactly when they hold for the normalized interior.
- [Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), proof of Theorem 6.1.5.1(4), p. 29. Deduces normality and the lci property of the Klingen and paramodular toroidal models from the local charts, the interior lci property and the boundary modular curves.
- [Stacks069P](https://stacks.math.columbia.edu/tag/069P), Lemma 37.62.20, tag 069P. Smooth descent of the lci property on the source; this does not by itself prove transfer from a punctured completed chart.

**Acceptance checks.**

- The Lan16 fibre-property and smooth-fan regularity statements are established. The extra lci assertion remains conditional, and must not be used to prove C14/normal-lci in a circle.

Direct prerequisites: `ShimuraCompactificationsPartII:C8/pel-strata-completions` (C8.5); `ShimuraCompactificationsPartII:C8/pel-putative-charts` (C8.4); `SchemeAndStackFoundations:SF.0`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C8`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C8.10. Minimal-model input for normalized blow-ups

`ShimuraCompactificationsPartII:C8/normalized-blowup-input` · comparison · implementation: unchecked.

For a lattice collection J and the normalized minimal model M⃗^min_{H,J} of C8/pel-normalized-minimal, the hypotheses on M̃^min_{H,J} in ShimuraCompactifications C5.31 (Lan17 Theorem 6.1: a normal projective flat model over S̃_0 of the minimal compactification, with open normalized interior carrying the J-indexed tautological families) are satisfied by M⃗^min_{H,J}. Consequently, for every compatible projective cone decomposition Σ with polarization function pol (individual cones not necessarily smooth), Lan's normalized blow-up toroidal model M⃗^tor_{H,Σ,J} exists at every prime p with H^p neat, with formal torus-torsor charts and J-indexed families; when Σ is induced from smooth projective auxiliary decompositions it is canonically isomorphic to the normalized toroidal model of C8/pel-normalized-toroidal.

**Hypotheses.**

- H^p neat; Σ projective and satisfying Lan's condition 6.2.5.25.

**Proof or construction.**

- Normality, projectivity and flatness of M⃗^min_{H,J}, its open interior and its families are C8/pel-normalized-minimal and C8/pel-normalized-toroidal.
- Apply ShimuraCompactifications C5.31 with this input.
- For induced Σ, compare the normalized blow-up with the normalization model by the formal chart maps of Lan17 §§4–5 and Theorem 6.1. These maps agree with the identity on the common generic model and are isomorphisms on the completed charts. The chart comparison, followed by gluing, proves the identification; properness and birationality alone would not do so.

**Sources and match.**

- [Lan17](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Introduction, pp. 1–2; Theorem 6.1, pp. 22–24. Constructs normalized blow-ups of the normalized minimal compactifications of Lan16 for all projective cone decompositions and compares them with the normalization models of Lan16 §7 through the putative boundary charts.
- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), Propositions 6.1 and 6.4, pp. 32–35. Supplies the normal projective flat minimal model and its interior families used as input.

**Acceptance checks.**

- For Pilloni's Klingen and paramodular data this gives X_Kli(p)_{K,Σ} and X_{par,K,Σ} for good projective Σ (Pilloni Theorem 6.1.5.1, a special case of Lan17 Theorem 6.1).

Direct prerequisites: `ShimuraCompactificationsPartII:C8/pel-normalized-minimal` (C8.2); `ShimuraCompactificationsPartII:C8/pel-normalized-toroidal` (C8.3); `ShimuraCompactifications:C5/roadmap/projective-normalized-blowup`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C8`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

## C9. Hodge cycles on degenerating abelian varieties

One-motives and their realizations in MP19 §§1 and 3: contravariant de Rham cohomology of weights 0,1,2 is dual to the homological realization of weights −2,−1,0 used in C11. Plan the absolute Hodge tensors (Brylinski, cited indirectly through Proposition 3.1.2), Mumford boundary comparisons, log Dieudonné crystals with the corrected quotient D/W₀=D(Q^sab), Cartier duality and twists, semistable comparison over the stated algebraically closed residue field, and unipotent nearby cycles. Keep φ-module splitting separate from compatibility with the log connection. The canonical tensor argument uses the comparison-injectivity lemmas; crystalline rationality is the integral lattice spanning theorem of Theorem 3.4.3(1), proved in §3.5.

Layer prerequisites: `ShimuraCompactifications:C1`; `ShimuraCompactifications:C4`; `AutomorphicBundles:B1`; `HodgeTateAndCanonicalSubgroups:T1`; `CrystallineCohomology:CR.5`; `CrystallineCohomology:CR.6`; `CohomologyComparisons:CP.4`; `NeronModelsAndSemistableAbelianVarieties:R11.3`; `ReductiveGroupsPartII:RG2.1`; `AbelianSchemesAndArithmeticModuli:A4`; `ShimuraCompactifications:C2`; `PadicHodgeTheory:R06.5`; `ShimuraCompactifications:C5`.

### C9.1. Realizations of 1-motives

`ShimuraCompactificationsPartII:C9/one-motive-realizations` · definition · implementation: unchecked.

For a 1-motive Q=[Y→G] over S, write 0→T→G→B→0 and X=X⁎(T). Its n-torsion Q[n] is finite locally free for every n≥1 and is an extension of Y/nY by G[n]; it is étale when n is invertible. Its covariant Tate modules have weights −2,−1,0. Define H₁,dR(Q)=Lie(E_Q), where E_Q is the universal vector extension of Q, and define the contravariant H¹_dR(Q)=H₁,dR(Q)^∨, as in MP19 §1.1.3. Both have rank 2 dim B+rank X+rank Y. The cohomological graded pieces in weights 0,1,2 are Hom(Y,O), H¹_dR(B), X⊗O(−1); its Hodge filtration has F⁰=H¹, F²=0 and the usual F¹. Dualizing gives the homological weights −2,−1,0 and F⁰ used in C11. Cartier duality gives H¹_dR(Q)×H¹_dR(Q^∨)→O(−1) and the homological pairing with values O(1). Over ℂ the Betti homology is a mixed Hodge structure of weights −2,−1,0, and Betti cohomology is its dual. These realizations and the Mumford comparisons respect filtrations, duality and base change.

**Hypotheses.**

- S arbitrary for Q[n] and de Rham realizations; use primes invertible on S for étale local-system realizations. Betti realizations require a complex base.
- C9 uses cohomological realizations H¹ and D, following MP19 §§1–3; C11 explicitly dualizes to H₁, following MP19 §4.3.

**Proof or construction.**

- Define Q[n] via the multiplication-by-n on the complex [Y → G] (Deligne, Hodge III 10.1); T̂ is its limit.
- Construct E_Q by the universal property of vector extensions and take Lie, then dualize for H¹_dR. The filtration is induced from 0→T→G→B→0 and the lattice Y; its dual graded pieces give the cohomological weights above (MP19 §1.1.3, pp. 11–12).
- Over ℂ, the Betti realization is H_1 of the analytic 1-motive with its mixed Hodge structure (Deligne, Hodge III 10.1.3); the comparison isomorphisms are those of loc. cit.
- Over a degenerating chart, the Mumford construction (ShimuraCompactifications C4) identifies A[n] with Q[n] over V.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §1.1, pp. 9–12. Recalls 1-motifs over a base, their étale, de Rham, Betti and crystalline realizations with weight and Hodge filtrations, duality, and compatibility with the degeneration construction.
- [MP19](https://arxiv.org/pdf/1211.1731v6), §1.2, (1.2.2), pp. 12–13. Recalls the equivalence between degenerating abelian schemes and degeneration data (Mumford, Faltings–Chai) through which the realizations of A and Q are compared.

**Uses that determine the API.**

- Madapusi Pera §3.1.1–3.1.6, pp. 43–45: tensors s_{α,Φ,dR} and s_{α,Φ,ét} live in the realizations of the boundary 1-motive Q(Φ).
- Madapusi Pera §4.3.1, p. 80: the de Rham realization of the universal 1-motive gives the canonical extension of H_dR across the boundary.

**Planning API.**

- `OneMotive` (structure): A 1-motive [Y → G] over S with G an extension of an abelian scheme by a torus.
- `OneMotive.torsion` (constructor): The finite flat group scheme Q[n], an extension of Y/nY by G[n].
- `OneMotive.tateModule` (constructor): T̂(Q) = lim Q[n] with its weight filtration T̂(T) ⊂ T̂(G) ⊂ T̂(Q).
- `OneMotive.deRham` (constructor): The contravariant H¹_dR(Q)=Lie(E_Q)^∨ with weights 0,1,2 and Hodge filtration F¹⊂F⁰; also expose its dual H₁,dR(Q) with weights −2,−1,0 and F⁰. Never identify these two objects without a specified polarization and Tate twist.
- `OneMotive.dual` (other): The dual 1-motive and perfect pairings T̂(Q)×T̂(Q^∨)→Ẑ(1), H¹_dR(Q)×H¹_dR(Q^∨)→O(−1), and H₁,dR(Q)×H₁,dR(Q^∨)→O(1).
- `OneMotive.betti` (constructor): Over ℂ, H_B(Q) with its mixed Hodge structure (a TauCeti.Hodge.MixedHodgeStructure) and the comparison isomorphisms.
- `OneMotive.ofAbelian` (compatibility): For Q=[0→A], H¹_dR(Q) is A4’s H¹_dR(A); its linear dual is H₁,dR(A).
- `OneMotive.map` (functoriality): A morphism of 1-motives induces covariant maps on torsion, Tate modules and homological realizations, and contravariant maps on cohomological realizations; identity, composition, filtration and pairing compatibilities are part of the API.

**Unit tests.**

- `OneMotive.tate_test` (computation): For [ℤ→𝔾_m], 1↦q with q a unit, the fibre of Q[n] over 1 is the scheme of n-th roots of q. It is the torsion of a Tate elliptic curve only over a complete valued base with 0<|q|<1; an arbitrary unit does not define such an elliptic curve.
- `OneMotive.weight_test` (computation): For B=0, H¹_dR has Hom(Y,O) in weight 0 and X⊗O(−1) in weight 2, and no weight-1 piece. Its dual has the corresponding weights −2 and 0.
- `OneMotive.abelian_test` (degenerate): For Q=[0→A], H¹_dR is pure of weight 1 and H₁,dR pure of weight −1; the latter is the dual of A4’s cohomology realization.
- `OneMotive.notPure_test` (non-example): The Betti realization of [ℤ → ℂ^×, 1 ↦ q] with |q| ≠ 1 is a nonsplit extension of ℤ(0) by ℤ(1): it is not a pure Hodge structure, so a definition using only pure Hodge structures fails.

**Acceptance checks.**

- Abelian cohomology agrees with A4; the dual is explicitly named when homological conventions are needed.
- The cohomological weight-graded pieces are Hom(Y,O), H¹_dR(B), X⊗O(−1), and all pairings carry their Tate twists.

Direct prerequisites: `ShimuraCompactifications:C4/roadmap/semi-abelian-scheme`; `ShimuraCompactifications:C4/roadmap/poincare-extension-classification`; `ShimuraCompactifications:C4/roadmap/semiabelian-tate-module`; `AbelianSchemesAndArithmeticModuli:A4`; `tauceti:TauCeti.Hodge.MixedHodgeStructure`.

Atlas planet: **Realizations of 1-motives**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C9`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C9.2. Absolute Hodge tensors on boundary 1-motives

`ShimuraCompactificationsPartII:C9/absolute-hodge-one-motives` · theorem · implementation: unchecked.

Let (G, X) ↪ (GSp(H), S^±(H)) be a Hodge embedding with tensors {s_α} ⊂ H^⊗ whose pointwise stabilizer is G, and Φ a cusp label representative with induced Siegel label Φ‡. Over Sh_{K_Φ}(Q_Φ, D_Φ)(ℂ) the boundary 1-motive Q(Φ) pulled back from the Siegel boundary carries tensors s_{α,Φ,B}, s_{α,Φ,dR} and s_{α,Φ,ét} in W_0 of its realizations, identified with each other by the comparison isomorphisms; s_{α,Φ,dR} lies in F^0 ∩ W_0 and is horizontal. Then s_{α,Φ,dR} descends to a section of H_dR(Φ)^⊗ over the canonical model Sh_{K_Φ}(Q_Φ, D_Φ) over E, and s_{α,Φ,ét} to a section of H_{𝔸_f}(Φ)^⊗ over it.

**Hypotheses.**

- (G, X) of Hodge type; K neat; the boundary mixed Shimura variety with its canonical model over E (ShimuraCompactifications C1–C2).

**Proof or construction.**

- The tensors come from the mixed Hodge structure of the boundary (ShimuraCompactifications C1, boundary weight and Hodge filtrations).
- Brylinski's theorem: Hodge classes on 1-motives over ℂ are absolutely Hodge, reducing to Deligne's theorem for abelian varieties (AutomorphicBundles B1/absolute-hodge-propagation) through the weight filtration.
- Descent to the canonical model over E as in Kisin's argument for abelian schemes: an absolute Hodge class on a family over a variety defined over E, Galois-invariant at one fibre, is defined over E (Madapusi Pera 3.1.2 following Kisin 2.2).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Proposition 3.1.2, p. 44. States the descent of the de Rham and étale tensors of the boundary 1-motive to the canonical model, deduced as in Kisin from Brylinski's theorem that Hodge classes on 1-motives are absolutely Hodge.
- Bry83 (indirect citation), Théorème 2.2.5. Hodge classes on 1-motives over ℂ are absolutely Hodge (cited by Madapusi Pera; not read here).

**Acceptance checks.**

- For Φ = (G, X^+, 1) the statement is Kisin's descent of the tensors on the universal abelian scheme over Sh_K.

Direct prerequisites: `ShimuraCompactificationsPartII:C9/one-motive-realizations` (C9.1); `AutomorphicBundles:B1/absolute-hodge-propagation`; `ShimuraCompactifications:C1/roadmap/boundary-mixed-hodge-structure`; `ShimuraCompactifications:C2/roadmap/canonical-toroidal-model`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C9`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C9.3. Tensors of the 1-motive and of the abelian scheme agree

`ShimuraCompactificationsPartII:C9/boundary-tensor-compatibility` · theorem · implementation: unchecked.

Let Υ = [(Φ, σ)], t a point of the closed stratum Z_{K_Φ}(Q_Φ, D_Φ, σ), R(Φ, σ, t) the complete local ring of Sh_{K_Φ}(Q_Φ, D_Φ, σ) at t and V = Spec R(Φ, σ, t) minus the boundary. Through the identification of R(Φ, σ, t) with a complete local ring of Sh^Σ_K, V carries both the boundary 1-motive Q and the abelian scheme A, with canonical isomorphisms T̂(Q) ≅ T̂(A) and H_dR(Q) ≅ H_dR(A) (Mumford's construction). These isomorphisms carry s_{α,Φ,ét} to s_{α,ét} and s_{α,Φ,dR} to s_{α,dR} for every α.

**Hypotheses.**

- Characteristic zero; t may be taken ℂ-valued.

**Proof or construction.**

- Over ℂ, identify the algebraic Mumford isomorphism T̂(Q) ≅ T̂(A) with the analytic one coming from the uniformization of the boundary neighbourhood (Madapusi Pera 2.2.13, compatibility of Mumford's construction with realizations).
- For the analytic isomorphism the tensors correspond by construction, both being induced from the s_α ∈ H^⊗; argue identically for de Rham realizations.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Proposition 3.1.6 and its proof, pp. 44–45; (2.2.13), p. 39. Identifies the tensors on the 1-motive and on the abelian scheme over the punctured formal neighbourhood, using the compatibility of the algebraic and analytic Mumford isomorphisms.

**Acceptance checks.**

- In the PEL case the tensors are endomorphisms and polarizations and their compatibility is functoriality of the Mumford construction.
- The identifications hold for every α simultaneously.

Direct prerequisites: `ShimuraCompactificationsPartII:C9/absolute-hodge-one-motives` (C9.2); `ShimuraCompactifications:C4/roadmap/formal-universal-degeneration`; `ShimuraCompactifications:C2/roadmap/partial-boundary-charts`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C9`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C9.4. The log Dieudonné crystal of a degenerating abelian scheme

`ShimuraCompactificationsPartII:C9/log-dieudonne-crystal` · construction · implementation: unchecked.

Let S = Spec R with R a complete noetherian normal local ring, flat over W = W(k) for a perfect field k of characteristic p, U ⊂ S the complement of a divisor with normal crossings giving S its log structure, and A an object of DEG(S, U): a semi-abelian scheme over S, abelian over U, with its degeneration data (a 1-motive Q over the completion with period pairing τ). The log Dieudonné crystal D(A) is a log F-crystal on the log crystalline site of the special fibre (finite locally free, with Frobenius, a logarithmic connection, a Hodge filtration and a weight filtration) with W_0 D(A) ≅ Hom(Q^ét, 1), D(A)/W_0 D(A) ≅ D(Q^sab) and gr^W_1 D(A) ≅ D(B), gr^W_2 D(A) ≅ 1(−1) ⊗ Q^{mult,C}, Cartier duality D(A^∨) ≅ D(A)^∨_Cartier (whose underlying F-isocrystal is the linear dual D(A)^∨_lin(−1)), and a horizontal isomorphism H^1_dR(A/U) ≅ D(A)(S)|_U respecting both filtrations. It is constructed from the degeneration data as the Baer sum of D(Q) and the extension given by τ, and on the good-reduction locus it is the Dieudonné crystal of the p-divisible group.

**Hypotheses.**

- k perfect of characteristic p; R complete noetherian normal local and W-flat; the log structure is the one defined by the boundary divisor; A has semi-abelian reduction along the boundary with split torus part after étale localization.

**Proof or construction.**

- Reduce, by the equivalence of degenerating abelian schemes with degeneration data (Madapusi Pera 1.2.2; ShimuraCompactifications C4), to constructing D on degeneration data.
- For totally degenerate data with period pairing τ:Y×X→𝔾_m, construct the extension 0→Hom(Y,1)→D→X⊗1(−1)→0 with logarithmic connection determined by d log τ (MP19 A.1.1–A.1.5). The positions of X and Y follow the cohomological convention.
- In general take the Baer sum of D(Q^cl), the Dieudonné crystal of the 1-motive with good reduction, and the totally degenerate extension (A.1.8–A.1.10); check the weight, duality and de Rham comparison properties on each piece.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §1.3, Proposition 1.3.5, p. 14. Supplies the log Dieudonné functor and its comparison properties; the displayed W₁ identification in (1) must be corrected using A.1.8. The dual in (2) means Cartier dual as defined in §1.3.3.
- [MP19](https://arxiv.org/pdf/1211.1731v6), Appendix A.1, A.1.1–A.1.10, pp. 89–94. Gives the construction over complete normal local bases, extending Kato's construction for discrete valuation rings, via the totally degenerate case and Baer sums.
- [MP19pub](https://www.numdam.org/item/10.24033/asens.2391.pdf), Proposition 1.3.5(1), p. 408, and Appendix A.1.8, pp. 499–500. The version of record retains the same W₁-versus-quotient misprint; the appendix gives the quotient by W₀, and the totally degenerate case disproves the printed W₁ formula.

**Uses that determine the API.**

- Madapusi Pera §3.2, pp. 45–52: the log F-crystal of the tautological degeneration at a boundary point of the Siegel chart.
- Madapusi Pera §1.4.10: its evaluation on a discrete valuation ring gives the Hyodo–Kato module of a semistable abelian variety.

**Planning API.**

- `LogDieudonneCrystal` (constructor): D(A) for A ∈ DEG(S, U), functorial in A.
- `LogDieudonneCrystal.weight` (characterisation): W₀D=Hom(Y,1), gr¹_W D=D(B), gr²_W D=X⊗1(−1), and D/W₀D=D(Q^sab). W₁D is not D(Q^sab); MP19 Proposition 1.3.5(1) has a misprint, resolved by A.1.8.
- `LogDieudonneCrystal.dual` (other): D(A^∨) is the Cartier dual of D(A), with perfect pairing into 1(−1). On underlying F-isocrystals this is the linear dual twisted by (−1), not the untwisted linear dual.
- `LogDieudonneCrystal.deRham` (compatibility): H^1_dR(A/U) ≅ D(A)(S)|_U, horizontal and respecting Hodge and weight filtrations.
- `LogDieudonneCrystal.good` (compatibility): If A is abelian over S, D(A) is the Dieudonné crystal of A[p^∞] with trivial log structure (AbelianSchemesAndArithmeticModuli A4).
- `LogDieudonneCrystal.residue` (relation): The residue of the log connection along the boundary is the monodromy operator determined by τ.
- `LogDieudonneCrystal.baseChange` (compatibility): Pullback along a morphism of admissible log-base pairs for which the degeneration data and log-crystalline realization are defined commutes with D, its filtrations, duality and de Rham comparison. Do not infer a statement for non-admissible base changes.

**Unit tests.**

- `LogDieudonneCrystal.tate_test` (computation): For the Tate curve over W[[q]] with log structure from q = 0, D is free of rank 2 with a basis e_1 of W_0D (φe_1 = e_1, ∇e_1 = 0) and a lift e_0 of a basis of gr^W_2D with φe_0 = pe_0 and ∇e_0 = e_1 ⊗ d log q, up to the sign convention; this is compatible with φ(d log q) = p d log q.
- `LogDieudonneCrystal.good_test` (degenerate): For an abelian scheme over S (empty boundary) D is the usual Dieudonné crystal and the residue is zero.
- `LogDieudonneCrystal.notCrystal_test` (non-example): For the Tate curve the connection has a nonzero residue at q = 0, so D is not in the image of the (fully faithful) functor from Dieudonné crystals without log structure.

**Acceptance checks.**

- For an abelian scheme with good reduction D(A) is the Dieudonné crystal.
- For the Tate curve the residue of the log connection is nonzero.

Direct prerequisites: `ShimuraCompactificationsPartII:C9/one-motive-realizations` (C9.1); `ShimuraCompactifications:C4/roadmap/degeneration-effectivity`; `CrystallineCohomology:CR.5`; `AbelianSchemesAndArithmeticModuli:A4`.

Atlas planet: **Log Dieudonné crystal**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C9`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C9.5. Semistable comparison for abelian varieties with semi-abelian reduction

`ShimuraCompactificationsPartII:C9/semistable-comparison-abelian` · theorem · implementation: unchecked.

Let K/K_0 be a finite totally ramified extension of K_0 = W(k)[1/p] with k=F̄_p, π a uniformizer, and A an abelian variety over K with split semi-abelian reduction over O_K. Let M_0(A) be the module of unipotent nearby cycles of the log Dieudonné crystal (C9/log-dieudonne-crystal), constructed in MP19 §1.4.6, a filtered (φ, N)-module after the Hyodo–Kato isomorphism β_HK,π : K ⊗_{K_0} M_0(A) ≅ H^1_dR(A/K). There is a canonical isomorphism β_st,A : B_st ⊗_{ℚ_p} H^1_ét(A_{K̄}, ℚ_p) ≅ B_st ⊗_{K_0} M_0(A), compatible with Gal(K̄/K), φ, N and, after B_st → B_dR (depending on π), with the Hodge filtration via β_HK,π. Consequently (Coleman–Iovita) A has good reduction if and only if T_p(A) is crystalline, if and only if the monodromy N_0(A) vanishes.

**Hypotheses.**

- K a finite extension of K_0 with algebraically closed residue field k=F̄_p, as in MP19 §1.4; split semi-abelian reduction (achieved after a finite extension); the embedding K ⊗ B_st → B_dR fixed by the choice of π.

**Proof or construction.**

- Write A via Raynaud uniformization as G/Y with G semi-abelian of good reduction and Y the period lattice (NeronModelsAndSemistableAbelianVarieties R11.3); the Tate module is an extension of the realizations of the 1-motive.
- Construct β_st as the descent of the crystalline comparison for the good-reduction 1-motive combined with the explicit comparison for the totally degenerate extension, whose period is log τ ∈ B_st (Madapusi Pera 1.4.6–1.4.10, generalizing Faltings's construction for good reduction).
- The comparison identifies crystalline representations with N=0. The explicit log-crystal construction identifies N=0 with extension of τ across O_K. Positivity and nondegeneracy of the polarized valuation pairing then force both toric and lattice ranks to vanish, which is precisely good reduction (MP19 §1.4.11, p. 19). A generic assertion about removing log poles alone does not supply this last implication.
- When a proper semistable model exists, this comparison agrees with the general semistable comparison of CohomologyComparisons CP.4 (Hyodo–Kato and Tsuji).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §1.4, (1.4.6)–(1.4.10), pp. 15–19; Proposition 1.4.10, p. 18. Constructs the semistable comparison isomorphism for abelian varieties with semi-abelian reduction from the log Dieudonné crystal, compatible with Galois action, Frobenius, monodromy and filtrations.
- [MP19](https://arxiv.org/pdf/1211.1731v6), 1.4.11 and Theorem 6, pp. 7 and 19. Deduces that T_p(A) is crystalline if and only if the monodromy vanishes, if and only if A has good reduction (originally Coleman–Iovita).
- [MP19](https://arxiv.org/pdf/1211.1731v6), Appendix A.2, pp. 94–96. Proves the comparison statements used in 1.4.10.

**Acceptance checks.**

- For the Tate curve E_q over K, N_0 ≠ 0 and T_p(E_q) is semistable non-crystalline.
- For an abelian variety with good reduction β_st restricts to Faltings's crystalline comparison.

Direct prerequisites: `ShimuraCompactificationsPartII:C9/log-dieudonne-crystal` (C9.4); `NeronModelsAndSemistableAbelianVarieties:R11.3`; `CohomologyComparisons:CP.4`; `CrystallineCohomology:CR.6`; `PadicHodgeTheory:R06.5`.

Atlas planet: **Semistable comparison for degenerating abelian varieties**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C9`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C9.6. The canonical φ-module at a boundary point

`ShimuraCompactificationsPartII:C9/canonical-log-f-crystal` · construction · implementation: unchecked.

Fix a Hodge embedding with self-dual auxiliary lattice, a Siegel cusp label representative Φ‡ with cone σ‡ (σ‡° ⊂ H(Φ‡)), a closed point s‡_0 of the closed stratum of the Siegel twisted torus embedding over F̄_p, R(σ‡, s‡_0) its complete local ring with V = Spec R minus the boundary, and Q(σ‡, s‡_0) the tautological degeneration. Let M(σ‡, s‡_0) = D(A(σ‡, s‡_0))(S(σ‡, s‡_0)) (C9/log-dieudonne-crystal) with Frobenius lift φ = φ^sab ⊗̂ φ_σ (p-power on characters). It is canonically the Baer sum of D(Q^cl), for the 1-motive of the chosen trivialization of the torus torsor, and an extension of O(−1) ⊗ X by Hom(X, O) split as a φ-module, with nontrivial logarithmic connection determined by d log τ. Its canonical unipotent-nearby-cycles module M_0 (MP19 §3.2.9) is a φ-module over K_0 = W(F̄_p)[1/p] with weight filtration W_•M_0, symplectic form ψ_0 with values in K_0(−1), independent of the choices in the equivalence class of (σ‡, s‡_0), with a canonical isomorphism K_0 ⊗ Lie W_{Φ‡} ≅ K_0(−1) ⊗ Lie U_wt, where U_wt is the centre of the unipotent radical of the parabolic of GSp(M_0, ψ_0) stabilizing W_•M_0. For each K_0-point x of the rigid generic fibre Û^{an,◦}(σ‡, s‡_0) of V, the monodromy N_x of β_st at the degenerating abelian variety A_x is an element of the cocharacter lattice B ⊂ Lie W_{Φ‡} = (Lie U_wt)(−1) lying in σ‡°.

**Hypotheses.**

- Hodge embedding with self-dual Siegel lattice and hyperspecial K‡_p; s‡_0 an F̄_p-point; analytic spaces as in Madapusi Pera A.4.

**Proof or construction.**

- Trivialize the torus torsor over R^sab (strictly henselian) and write R(σ‡, s‡_0) ≅ R^sab ⊗̂ B(σ‡, s′_0) (Madapusi Pera 3.2.3).
- Compute D(A) as the Baer sum (3.2.7) from the explicit description of the totally degenerate log Dieudonné crystal (A.1.5).
- Compare M at different (σ‡, s‡_0) in one equivalence class via the blow-ups of 3.2.4–3.2.6 to obtain M_0 and its structures (3.2.9–3.2.10).
- The monodromy at x is the residue of the log connection, computed from the period pairing τ_x, whose valuation lies in σ‡° (3.2.15–3.2.16).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §3.2, (3.2.1)–(3.2.16), pp. 45–52. Describes explicitly the log F-crystal at a boundary point of the Siegel chart as a Baer sum, the canonical φ-module M_0 with weight filtration and pairing, the isomorphism (3.2.10.1) of Lie W_{Φ‡} with Lie U_wt up to twist, and the monodromy of points as elements of the cone.

**Uses that determine the API.**

- Madapusi Pera §3.3–3.5: carrier of the canonical crystalline tensors and of the rationality statement.
- Madapusi Pera proof of Lemma 4.2.11, pp. 78–79: identifies B^⋄_G with B through (3.2.10.1).

**Planning API.**

- `CanonicalPhiModule` (constructor): M_0 over K_0 with Frobenius φ_0, weight filtration W_•M_0 and pairing ψ_0, attached to the equivalence class of (σ‡, s‡_0).
- `CanonicalPhiModule.lieIso` (equivalence): K_0 ⊗ Lie W_{Φ‡} ≅ K_0(−1) ⊗ Lie U_wt (3.2.10.1).
- `CanonicalPhiModule.monodromy` (data): For x ∈ Û^{an,◦}(σ‡, s‡_0)(K_0), the monodromy N_x ∈ B ∩ σ‡° under the isomorphism above.
- `CanonicalPhiModule.baerSum` (characterisation): M is the Baer sum of D(Q^cl) and a totally degenerate extension which splits as a φ-module. Its connection contains d log τ and is generally not split as a log F-isocrystal.
- `CanonicalPhiModule.independent` (other): M_0 and its structures do not depend on the representative of the equivalence class.
- `CanonicalPhiModule.comparison_cocycle` (compatibility): The canonical identifications for changes of chart representative are φ- and weight-compatible and satisfy the identity and composition laws; compatibility with the log connection is stated through the nearby-cycles comparison, not by choosing a split connection.

**Unit tests.**

- `CanonicalPhiModule.tate_test` (computation): For g = 1 and the Tate curve at a cusp, M_0 = K_0e_1 ⊕ K_0e_0 with W_0M_0 = K_0e_1 = Hom(X, K_0) (φe_1 = e_1) and e_0 lifting gr^W_2M_0 = K_0(−1) ⊗ X (φe_0 = pe_0); for a point x with Tate parameter q_x, N_x(e_0) = v_p(q_x)e_1 and N_x(e_1) = 0 up to sign, with v_p(q_x) > 0 because x lies off the boundary in the cone σ‡° = ℝ_{>0}.
- `CanonicalPhiModule.good_test` (degenerate): For the trivial cusp label (no boundary) M_0 is the Dieudonné module of the reduction and the weight filtration is trivial.
- `CanonicalPhiModule.positivity_test` (characterisation): For x off the boundary, N_x induces a positive definite pairing on X: ker N_x = W_1M_0 and im N_x = W_0M_0.

**Acceptance checks.**

- For the Tate curve at a cusp, M_0 has rank 2 with slopes 0 and 1 and the monodromy of a point with Tate parameter q_x is v_p(q_x) times the nilpotent generator.
- M_0 does not depend on the representative of the equivalence class of (σ‡, s‡_0).

Direct prerequisites: `ShimuraCompactificationsPartII:C9/log-dieudonne-crystal` (C9.4); `ShimuraCompactificationsPartII:C9/semistable-comparison-abelian` (C9.5); `ShimuraCompactifications:C5/roadmap/formal-completion`; `ShimuraCompactifications:C4/roadmap/formal-universal-degeneration`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C9`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C9.7. Canonical crystalline tensors at the boundary

`ShimuraCompactificationsPartII:C9/canonical-tate-tensors` · theorem · implementation: unchecked.

In the setting of C9/canonical-log-f-crystal, for a Hodge-type datum (G, X) with tensors {s_α} and a point t_0 of 𝒮^Σ_K over s‡_0, for every α there is a canonical tensor s_{α,st,0} ∈ M_0^⊗ such that: φ_0(s_{α,st,0}) = s_{α,st,0}; N_y(s_{α,st,0}) = 0 for every K_0-point y of Û^{an,◦}_G(σ‡, t_0) (the rigid generic fibre of the complete local ring R_G(σ‡, t_0) of 𝒮^Σ_K at t_0, off the boundary); and for every y over a finite extension L/K_0 and uniformizer π of L, β_st,y^{-1}(1 ⊗ s_{α,st,0}) = s_{α,ét,y} and β_HK,y,π(1 ⊗ s_{α,st,0}) = s_{α,dR,y}. The pointwise stabilizer of {s_{α,st,0}} in GL(M_0) is isomorphic to G_{K_0}.

**Hypotheses.**

- Same setting; y ranges over points of the rigid generic fibre of the boundary complete local ring not on the boundary divisor.

**Proof or construction.**

- At each point y, the semistable comparison of C9/semistable-comparison-abelian carries the étale tensors s_{α,ét,y} (Galois-invariant, by C9/absolute-hodge-one-motives) into (B_st ⊗ M_0(A_y))^⊗, φ- and N-invariant and in F^0; the compatibility of de Rham and étale tensors at each y is HodgeTateAndCanonicalSubgroups T1/hodge-tensor-comparison applied fibrewise.
- MP19 Lemmas 3.3.7–3.3.8 prove injectivity of the comparison map for horizontal tensor sections and their specializations; these injectivity statements identify the tensor constructed from one point with the one from every other point. Corollary 3.3.9 then gives a unique tensor in M₀. Horizontality by itself does not identify arbitrary fibres or prove that the tensor lies in K₀.
- The scheme of isomorphisms H^∨(ℚ_p) ⊗ B ≅ M_0 ⊗ B carrying s_α to s_{α,st,0} has a B_st-point, hence is a G-torsor over K_0; by Steinberg's theorem over K_0 = W(F̄_p)[1/p] (ReductiveGroupsPartII RG2.1.1, steinberg-quasi-split) it has a K_0-point, so the stabilizer is G_{K_0} (Madapusi Pera 3.4.1).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §3.3, (3.3.6)–Corollary 3.3.9, pp. 52–57. Constructs canonical φ-invariant, monodromy-annihilated tensors in M_0 matching the étale tensors under the semistable comparison and the de Rham tensors under Hyodo–Kato.
- [MP19](https://arxiv.org/pdf/1211.1731v6), §3.4.1, p. 57. Uses Steinberg's theorem to identify the stabilizer of the canonical tensors with G_{K_0}.

**Acceptance checks.**

- In the PEL case the canonical tensors are the crystalline realizations of the reductions of the endomorphisms and polarization (Madapusi Pera Remark 3.3.10).

Direct prerequisites: `ShimuraCompactificationsPartII:C9/canonical-log-f-crystal` (C9.6); `ShimuraCompactificationsPartII:C9/absolute-hodge-one-motives` (C9.2); `ShimuraCompactificationsPartII:C9/boundary-tensor-compatibility` (C9.3); `HodgeTateAndCanonicalSubgroups:T1/hodge-tensor-comparison`; `ReductiveGroupsPartII:RG2.1`.

Atlas planet: **Canonical crystalline tensors**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C9`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C9.8. Rationality of Hodge cycles at the boundary (crystalline form)

`ShimuraCompactificationsPartII:C9/crystalline-rationality` · theorem · implementation: unchecked.

In the setting of C9/canonical-tate-tensors, let U_wt,G = U_wt ∩ G_{K_0} and B_G = B ∩ (Lie U_wt,G)(−1), with B ⊂ (Lie U_wt)(−1) the cocharacter lattice of the Siegel boundary torus via (3.2.10.1). Then the inclusion induces an isomorphism K_0 ⊗_ℤ B_G ≅ (Lie U_wt,G)(−1); equivalently rank_ℤ B_G = d_wt := dim_{K_0} U_wt,G. Moreover dim R^sab_G ≤ d − d_wt + 1, where d = dim Sh_K and R^sab_G is the normalization in R_G(σ‡, t_0) of the image of the complete local ring of the Siegel abelian-torsor base.

**Hypotheses.**

- Same setting; d = dim X.

**Proof or construction.**

- The monodromy elements N_x of points x of Û^{an,◦}_G lie in B_G (they annihilate the canonical tensors, C9/canonical-tate-tensors), so rank B_G is at least the dimension of their span, and at most d_wt.
- Bound from above (Lemma 3.5.7): the Hodge filtrations F^•_y via β_HK give an unramified map η from the rigid space of R^sab to a Grassmannian landing in U^sab_{G,[μ]}, which has dimension d − d_wt because U_{G,[μ]} → U^sab_{G,[μ]} is a U_wt,G-torsor (Lemmas 3.5.3, 3.5.5); hence dim R^sab_G ≤ d − d_wt + 1.
- Bound from below (3.5.9): a closed subscheme of a completed torus embedding over R^sab_G of dimension d + 1 needs at least d − dim R^sab_G + 1 independent monodromy directions; combining gives rank B_G ≥ d_wt.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 3.4.3(1), pp. 57–58; §3.5, Lemmas 3.5.3, 3.5.5, 3.5.7 and (3.5.9), pp. 59–65. Proves that the monodromy lattice B_G spans the twisted Lie algebra of U_wt,G, by an upper bound on the dimension of the abelian-part base from the Hodge filtrations and a lower bound from completed torus embeddings.
- [MP19](https://arxiv.org/pdf/1211.1731v6), Remark 3.4.4(1), p. 58; (3.5.10). Calls this a rationality property of Hodge cycles with respect to p-adic uniformization and notes the simple PEL proof.

**Acceptance checks.**

- For the Siegel datum itself, B_G = B and the statement is the rank count dim U_wt = rank B.
- In the PEL case, B_G is the sublattice of B commuting with the O-action, by functoriality of p-adic uniformization.

Direct prerequisites: `ShimuraCompactificationsPartII:C9/canonical-tate-tensors` (C9.7); `ShimuraCompactificationsPartII:C9/canonical-log-f-crystal` (C9.6).

Atlas planet: **Rationality of Hodge cycles**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C9`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

## C10. Toroidal compactifications of Hodge type

Madapusi Pera's main theorem at arbitrary level: the canonical reduction of the Siegel boundary torus torsor to the torus of B_G (Theorem 3.4.3(2), §3.6) and the local structure of 𝒮^Σ_K at boundary points as completions of twisted torus embeddings (Theorem 3.4.3(3), §3.7); the abelian-scheme torsor of the boundary tower under the level hypothesis K_p = K‡(n)_p ∩ G(ℚ_p) (Theorem 4.1.5(1)); stratification with flat normal strata (4.1.5(2)–(3), 4.2.4); the normalized boundary mixed Shimura model as an E_K(Φ)-torsor (4.1.5(4), 4.2.8, 4.2.11); formal completions along strata (4.1.5(5)); Theorem 1 (a Cartier structure supported on the boundary, étale-local charts, and no worse singularities after smooth fan refinement); refinements and independence of the Siegel decomposition; functoriality for embeddings of data and Hecke correspondences (4.1.13); the properness criterion (4.1.7), Morita's conjecture (Theorem 5), connected components under geometrically reduced special fibre (4.1.11) and the étale rationality of Hodge cycles (Theorem 4).

Layer prerequisites: `ShimuraCompactificationsPartII:C7`; `ShimuraCompactificationsPartII:C9`; `ShimuraCompactifications:C2`; `ShimuraCompactifications:C3`; `ShimuraCompactifications:C4`; `ShimuraCompactifications:C5`; `AlgebraicModuliForArithmeticGeometry:R09.6`; `NeronModelsAndSemistableAbelianVarieties:R11.1`; `SchemeAndStackFoundations:SF.4`; `NeronModelsAndSemistableAbelianVarieties:R11.3`.

### C10.1. Reduction of the boundary torus torsor at a boundary point

`ShimuraCompactificationsPartII:C10/torsor-reduction` · theorem · implementation: unchecked.

In the setting of C9/crystalline-rationality, let E be the Siegel boundary torus with cocharacter lattice B, E_G ⊂ E the subtorus with cocharacter lattice B_G, Ξ the restriction of the Siegel torus torsor to Spec R^sab, and Ξ_G = Ξ/E_G (a torsor under E/E_G). The tautological section ι_G of Ξ_G over Spec R_G(σ‡, t_0)[a_σ^{-1}] (a_σ an equation of the boundary) is already defined over Spec R^sab_G and is independent of the choice of (σ‡, s‡_0, t_0) in its equivalence class. Hence Ξ|_{Spec R^sab_G} has a canonical reduction of structure group to an E_G-torsor Ξ_G(ι_G).

**Hypotheses.**

- Same setting as C9/crystalline-rationality; R^sab_G is integrally closed in R_G(σ‡, t_0) by construction.

**Proof or construction.**

- Equivalent formulation (Madapusi Pera 3.4.4(2)): for a trivialization ι^sab and all characters h of E/E_G, some power α(h)^m lies in (R^sab_G)^×.
- Over the rigid generic fibre the canonical trivialization is defined because the monodromy of every point lies in B_G (C9/crystalline-rationality and C9/canonical-tate-tensors); its descent to R^sab_G follows from the rigid-analytic extension lemmas (Madapusi Pera A.4) and the integrality of α(h) on the generic fibre (Madapusi Pera §3.6).
- Independence of the representative: compare through the blow-ups relating equivalent pairs (3.2.4–3.2.6).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 3.4.3(2), p. 58; Remark 3.4.4(2), p. 58; §3.6, pp. 65–67. Proves that the induced section of the quotient torsor is defined over the normalized abelian-part base, giving a canonical reduction of the Siegel boundary torus torsor to the torus of B_G; calls this the key result of the paper.

**Acceptance checks.**

- For the Siegel datum itself B_G = B, E_G = E and the reduction is the identity.
- In the PEL case the reduction is the subtorus fixed by the O-action, constructed directly from the moduli description (Lan16 §8).

Direct prerequisites: `ShimuraCompactificationsPartII:C9/crystalline-rationality` (C9.8); `ShimuraCompactificationsPartII:C9/canonical-tate-tensors` (C9.7); `ShimuraCompactificationsPartII:C7/normalized-boundary-tower` (C7.8).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C10`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C10.2. Local structure at the boundary

`ShimuraCompactificationsPartII:C10/local-structure` · theorem · implementation: unchecked.

In the setting of C10/torsor-reduction there are a torus E^⋄_G with an isogeny E^⋄_G → E_G and an E^⋄_G-torsor Ξ^⋄_G over R^sab_G inducing Ξ_G(ι_G), such that for every (σ̃‡, s̃‡_0, t̃_0) in the equivalence class of (σ‡, s‡_0, t_0) the finite map Spec R_G(σ̃‡, t̃_0) → Spec R(σ̃‡, s̃‡_0) → Ξ(σ̃‡) lifts canonically to Spec R_G(σ̃‡, t̃_0) → Ξ^⋄_G(σ̃_G), σ̃_G = σ̃‡ ∩ (B_G ⊗ ℝ), identifying Spf R_G(σ̃‡, t̃_0) with the completion of the twisted torus embedding Ξ^⋄_G(σ̃_G) at a point of its closed stratum.

**Hypotheses.**

- Same setting; this is a statement about complete local rings of 𝒮^Σ_K at boundary points in the special fibre.

**Proof or construction.**

- Use the closed immersion Sh_K → Sh_{K‡,⋄} at a deeper Siegel level K‡,⋄ with K = K‡,⋄ ∩ G(𝔸_f) (Madapusi Pera 3.7.2) to see R_G as the normalization of a quotient of a complete local ring of the deeper Siegel chart.
- The section of Ξ^⋄/E^⋄_G is defined over R^sab_G by C10/torsor-reduction, giving the reduction Ξ^⋄_G and a lift of the map into the twisted torus embedding.
- At the deeper Siegel level the generic closed immersion makes the map on complete local rings a quotient before normalization. The dimension equality from C9 forces the kernel of the resulting quotient of the completed normal torus chart to be zero. Normalization then gives the asserted isomorphism (MP19 §3.7.3–3.7.4). Finite dominant maps between normal schemes are not isomorphisms merely by dimension equality.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 3.4.3(3), p. 58; §3.7, (3.7.2)–(3.7.4) and the proof of 3.4.3, pp. 67–69. Identifies the complete local ring of 𝒮^Σ_K at a boundary point with the completion of a twisted torus embedding over the normalized abelian-part base, using the reduction of structure group and a dimension count.

**Acceptance checks.**

- At a split modular cusp the ring is R_cusp[[t]], with q=u t^w for a unit u and cusp width w. R_cusp is the completed normalization of the cusp field and may be ramified over W at bad level; W[[t]] is only the unramified case.
- The dimension count dim Ξ^⋄_G = dim R_G holds at every boundary point.

Direct prerequisites: `ShimuraCompactificationsPartII:C10/torsor-reduction` (C10.1); `ShimuraCompactificationsPartII:C9/crystalline-rationality` (C9.8); `ShimuraCompactificationsPartII:C7/normalized-toroidal-model` (C7.5).

Atlas planet: **Local structure at the boundary**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C10`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C10.3. The abelian part of the boundary tower

`ShimuraCompactificationsPartII:C10/abelian-torsor-extension` · theorem · implementation: unchecked.

Assume K_p = K‡(n)_p ∩ G(ℚ_p) for some n ≥ 1, where K‡(n) is the full level-n subgroup of the self-dual Siegel level. For every cusp label representative Φ of (G, X), the abelian scheme A_K(Φ) → Sh_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}) extends to an abelian scheme 𝒜_K(Φ) → 𝒮_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}) (namely the normalization of the pulled-back Siegel abelian scheme in A_K(Φ)), and the A_K(Φ)-torsor Sh_{K_Φ}(Q_Φ, D̄_Φ) → Sh_{K_Φ,h} extends to an 𝒜_K(Φ)-torsor structure on 𝒮_{K_Φ}(Q_Φ, D̄_Φ) → 𝒮_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}).

**Hypotheses.**

- K_p = K‡(n)_p ∩ G(ℚ_p) for some n ≥ 1 (this includes the case K_p = K‡_p ∩ G(ℚ_p) with n = 1).

**Proof or construction.**

- For n = 1, the map A_K(Φ) → A_{K‡}(Φ‡) is a prime-to-p isogeny onto an abelian subscheme with orthogonal complement A′, and A_K(Φ) × A′ → A_{K‡}(Φ‡) is an isogeny of abelian schemes; the normalization of an abelian scheme in an isogeny factor over a normal base is an abelian scheme (Madapusi Pera A.3.8, Proposition 4.2.2).
- For n ≥ 2 use the deeper Siegel level K‡,⋄ with K‡,⋄_p = K‡(n)_p, where the Siegel abelian scheme is Hom((1/n)X, Q^ab), and take a fibre product of abelian schemes.
- Use MP19 Corollary 4.2.3: after an étale localization of the pure base, extend the generic map between the smooth abelian schemes by the relative Weil extension theorem; translation then identifies the normalized torsor with the abelian scheme. Smoothness of the source in this extension step is essential; normality alone is not the theorem. R11.1 §1.8 supplies the DVR version, while the relative-base use is the one in MP19’s proof.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 4.1.5(1), p. 71; Proposition 4.2.2 and Corollary 4.2.3, pp. 74–75. Extends the abelian scheme and torsor structure of the boundary tower to the normalized integral models under the level hypothesis at p.

**Acceptance checks.**

- For a Siegel datum at hyperspecial level the abelian scheme is the integral Siegel boundary abelian scheme of ShimuraCompactifications C5.

Direct prerequisites: `ShimuraCompactificationsPartII:C7/normalized-boundary-tower` (C7.8); `ShimuraCompactifications:C4/roadmap/homomorphism-extension`; `NeronModelsAndSemistableAbelianVarieties:R11.1`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C10`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C10.4. The normalized boundary torus torsor

`ShimuraCompactificationsPartII:C10/boundary-torus-torsor` · theorem · implementation: unchecked.

For every cusp label representative Φ, 𝒮_{K_Φ}(Q_Φ, D_Φ) is an E_K(Φ)-torsor over 𝒮_{K_Φ}(Q_Φ, D̄_Φ), extending the torsor structure of the generic fibre, where E_K(Φ) is the split torus over ℤ with cocharacter group B_K(Φ) (the lattice of Φ at level K). Consequently, for every rational polyhedral cone σ ⊂ W_Φ(ℝ)(−1), 𝒮_{K_Φ}(Q_Φ, D_Φ, σ) is the twisted torus embedding of this torsor and 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) is its closed stratum. The torus provided by C10/local-structure at each boundary point is E_K(Φ): B^⋄_G = B_K(Φ).

**Hypotheses.**

- (G, X) of Hodge type, auxiliary datum as in C7; no hypothesis on K_p.

**Proof or construction.**

- The E-action on the generic torsor extends to Ξ by normality; the torsor property is checked over complete local rings of the base.
- Over the complete local ring at a point of the base, C10/local-structure exhibits Ξ as an E^⋄_G-torsor; it remains to identify E^⋄_G with E_K(Φ), that is B^⋄_G = B_K(Φ) (Lemma 4.2.11).
- Lemma 4.2.11: using a section of the étale torsor I(Υ, s_0) of tensor-preserving level structures (Lemma 4.2.7) and the compatibility of β_st with tensors, the isomorphism (3.2.10.1) restricts to K_0 ⊗ Lie W_Φ ≅ K_0(−1) ⊗ Lie U_wt,G, and intersecting with the level lattice gives B^⋄_G = B_K(Φ).
- Without this, normalization of the closure of a subtorus torsor need not be a torsor (Madapusi Pera Remark 4.2.9; see C7/normalized-boundary-tower, test notTorsor).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 4.1.5(4), p. 71; Lemma 4.2.7, Proposition 4.2.8, Remark 4.2.9 and Lemma 4.2.11, pp. 77–79. Proves that the normalized boundary mixed Shimura model is a torsor under the expected torus, by identifying the torus of the local structure theorem with E_K(Φ) through the tensor-preserving level torsor.

**Acceptance checks.**

- For FKW's parabolic (pure part zero-dimensional) this gives the torus torsor ξ_K → C_K over O_{E,(v)} (C11/fkw-good-reduction).

Direct prerequisites: `ShimuraCompactificationsPartII:C10/local-structure` (C10.2); `ShimuraCompactificationsPartII:C9/canonical-tate-tensors` (C9.7); `ShimuraCompactificationsPartII:C7/normalized-boundary-tower` (C7.8).

Atlas planet: **Normalized boundary torus torsor**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C10`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C10.5. Stratification of the normalized toroidal model

`ShimuraCompactificationsPartII:C10/stratification` · theorem · implementation: unchecked.

For every cone label Υ ∈ Cusp^Σ_K(G, X), the map 𝒵_K(Υ) → 𝒮^Σ_K of C7/normalized-stratum-model is a locally closed immersion, and 𝒮^Σ_K = ⊔_Υ 𝒵_K(Υ) set-theoretically; the closure of 𝒵_K(Υ) is ⊔_{Υ′ ≼ Υ} 𝒵_K(Υ′). For every Siegel cone label Υ‡, the reduced preimage (𝒮^Σ_K ×_{𝒮^{Σ‡}} 𝒵_{K‡}(Υ‡))_red is normal and flat over ℤ_(p) and is the disjoint union of the 𝒵_K(Υ) with ι_*Υ = Υ‡. In particular every stratum is flat over O, the boundary contains no irreducible component of the special fibre, and every boundary point of the special fibre lifts to characteristic zero in the same stratum.

**Hypotheses.**

- (G, X) of Hodge type; Σ induced; no hypothesis on K_p.

**Proof or construction.**

- Flatness and normality of reduced preimages of Siegel strata: by C10/local-structure the completed ring of the preimage is R^sab_G ⊗̂ of the completed ring of a toric stratum of Ξ^⋄_G(σ_G), whose reduced closed stratum is a torus, smooth over ℤ (Proposition 4.2.4).
- The finite birational map from ⊔_{ι_*Υ=Υ‡} 𝒵_K(Υ) to this normal flat scheme is an isomorphism (Corollary 4.2.5); the closure relation follows from the characteristic-zero relation and that of the Chai–Faltings compactification.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 4.1.5(2),(3), p. 71; Proposition 4.2.4 and Corollary 4.2.5, pp. 75–77. Stratifies 𝒮^Σ_K by the normalized strata with the expected closure relation and shows the reduced preimages of Siegel strata are normal and flat over ℤ_(p).

**Acceptance checks.**

- No irreducible component of the special fibre of 𝒮^Σ_K lies in the boundary (used by Boxer–Pilloni, sourceIssues E67).
- For the modular curve at level K_0(p) the strata are the interior and the cusps, each flat over ℤ_p.

Direct prerequisites: `ShimuraCompactificationsPartII:C10/local-structure` (C10.2); `ShimuraCompactificationsPartII:C7/normalized-stratum-model` (C7.9); `ShimuraCompactifications:C5/roadmap/integral-toroidal-space`; `ShimuraCompactifications:C2/roadmap/arithmetic-gluing`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C10`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C10.6. Formal completions along strata

`ShimuraCompactificationsPartII:C10/formal-completion` · theorem · implementation: unchecked.

For Υ = [(Φ, σ)], the canonical isomorphism 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) ≅ 𝒵_K(Υ) lifts to an isomorphism of formal algebraic spaces 𝒮̂_{K_Φ}(Q_Φ, D_Φ, σ) ≅ (𝒮^Σ_K)^∧_{𝒵_K(Υ)} between the completion of the twisted torus embedding along its closed stratum and the completion of 𝒮^Σ_K along the stratum, restricting on the generic fibre to Pink's isomorphism (ShimuraCompactifications C2) and compatible with the finite maps to the Siegel completions.

**Hypotheses.**

- Same setting.

**Proof or construction.**

- Both formal spaces are finite over the Siegel completion (𝒮^{Σ‡}_{K‡})^∧ ≅ 𝒮̂_{K‡_{Φ‡}}(…, σ‡); by the extension lemma for finite normal formal algebras (Madapusi Pera A.3.2) it suffices to compare complete local rings at points of the special fibre as algebras over the Siegel complete local ring.
- These agree by the proof of C10/boundary-torus-torsor and C10/local-structure (Proposition 4.2.13).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 4.1.5(5), pp. 71–72; Proposition 4.2.13, p. 79. Identifies the completion of 𝒮^Σ_K along a stratum with the completion of the normalized twisted torus embedding along its closed stratum.

**Acceptance checks.**

- Over the generic fibre the isomorphism is Pink's description of the completion along a boundary stratum.
- For the Siegel datum at hyperspecial level it is the formal completion statement of ShimuraCompactifications C5.4.

Direct prerequisites: `ShimuraCompactificationsPartII:C10/boundary-torus-torsor` (C10.4); `ShimuraCompactificationsPartII:C10/local-structure` (C10.2); `ShimuraCompactifications:C5/roadmap/formal-completion`; `ShimuraCompactifications:C2/roadmap/partial-boundary-charts`.

Atlas planet: **Formal completion along boundary strata**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C10`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C10.7. Toroidal compactifications of Hodge type (Madapusi Pera, Theorem 1)

`ShimuraCompactificationsPartII:C10/main-theorem` · theorem · implementation: unchecked.

For (G, X) of Hodge type, any neat K (arbitrary at p), an auxiliary Siegel datum and an induced complete admissible Σ: 𝒮^Σ_K is a proper normal flat algebraic space over O_{E,(v)} containing 𝒮_K as an open dense subspace whose boundary supports a relative effective Cartier divisor over O_{E,(v)} (the chosen Cartier structure need not be the reduced boundary for a nonsmooth fan); it carries the stratification of C10/stratification with completions described by C10/formal-completion; every point has an étale neighbourhood V such that V|_{𝒮_K} ↪ V is étale over 𝒮_{K_Φ}(Q_Φ, D_Φ) ↪ 𝒮_{K_Φ}(Q_Φ, D_Φ, σ) for some Φ, σ. After replacing Σ by a smooth refinement (with its normalized model), every complete local ring of 𝒮^Σ_K at a geometric point of the stratum of (Φ, σ) is isomorphic to a power series ring over a complete local ring of the abelian-torsor base 𝒮_{K_Φ}(Q_Φ, D̄_Φ) (and over one of 𝒮_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}) under the level hypothesis of C10/abelian-torsor-extension), hence to a complete local ring of 𝒮_K: the singularities of the compactification are no worse than those of the interior. Consequently étale-local properties (smoothness, reducedness, Cohen–Macaulayness, local complete intersection) of 𝒮_K and of the boundary pure models pass to 𝒮^Σ_K.

**Hypotheses.**

- Hodge type; neat level; Σ induced and complete; the refinement statement uses the refined normalized model of C10/refinements.

**Proof or construction.**

- Combine C10/formal-completion with Artin approximation (AlgebraicModuliForArithmeticGeometry R09.6) to obtain the étale neighbourhood comparison.
- Use a Cartier divisor supported on the toric boundary, supplied by the compatible auxiliary compactification, and transport it through the étale chart comparison. A nonsmooth toric embedding need not have reduced Cartier boundary. With smooth cones the reduced toric boundary is a relative normal-crossings divisor; it becomes a simple normal-crossings divisor over a smooth base.
- For a smooth refinement both the torsor and its torus embedding are smooth over the abelian-torsor base 𝒮_{K_Φ}(Q_Φ, D̄_Φ); since 𝒮_K is étale locally isomorphic to the torsor near the boundary, every complete local ring of the base times a power series ring occurs as a complete local ring of 𝒮_K. Under the level hypothesis of C10/abelian-torsor-extension the base is an abelian-scheme torsor over 𝒮_{K_Φ,h}.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 1, p. 3, and its proof, p. 72. States and proves that the normalized model is a compactification with relative Cartier boundary, the expected stratification and completions, and singularities no worse than those of the interior after refinement.

**Acceptance checks.**

- For K_p arbitrary the theorem is agnostic to the special fibre of 𝒮_K: it holds where G is ramified at p.
- For a neat Γ₀(p) modular model the cusp chart is smooth over its normalized cusp base. Smoothness over ℤ_p requires that cusp base to be unramified; it is not asserted at arbitrary deeper p-level.

Direct prerequisites: `ShimuraCompactificationsPartII:C10/formal-completion` (C10.6); `ShimuraCompactificationsPartII:C10/stratification` (C10.5); `ShimuraCompactificationsPartII:C10/boundary-torus-torsor` (C10.4); `AlgebraicModuliForArithmeticGeometry:R09.6`.

Atlas planet: **Toroidal compactification of Hodge type**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C10`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C10.8. Refinements and independence of the Siegel decomposition

`ShimuraCompactificationsPartII:C10/refinements` · theorem · implementation: unchecked.

(1) 𝒮^Σ_K does not depend on the choice of Σ‡ with ι^*Σ‡ = Σ. (2) For an admissible refinement Σ′ of Σ there is a normal integral model 𝒮_K ↪ 𝒮^{Σ′}_K over O_{E,(v)} with a proper birational map 𝒮^{Σ′}_K → 𝒮^Σ_K extending Sh^{Σ′}_K → Sh^Σ_K and stratifications satisfying the conclusions of C10/main-theorem; the auxiliary datum can be chosen so that Σ′ is induced. (3) For the refinement map f : 𝒮^{Σ′}_K → 𝒮^Σ_K, f_*O = O and R^if_*O = 0 for i > 0.

**Hypotheses.**

- Same setting; Σ′ admissible refining Σ.

**Proof or construction.**

- (1) from C10/formal-completion and the extension lemma A.3.4: the completions along strata do not involve Σ‡.
- (2) by the toroidal-embedding methods of Kempf–Knudsen–Mumford–Saint-Donat Ch. II applied to the étale-local charts, or by choosing the Siegel decomposition so that Σ′ is induced (Harris, as cited in Remark 4.1.6).
- (3) étale locally f is a toric refinement of twisted torus embeddings over the normal base, so ShimuraCompactifications C3 (universal toric structure-sheaf acyclicity) applies (Madapusi Pera 5.1.3(2), following Faltings–Chai V.1.2(b)).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Remark 4.1.6, p. 72; proof of Proposition 5.1.3(2), p. 83. Shows independence of Σ‡, constructs models for refinements with the same stratification properties, and deduces the vanishing of higher direct images of the structure sheaf from the étale-local structure.

**Acceptance checks.**

- For the blow-up of a smooth two-dimensional cone the refinement map has f_*O = O and no higher direct images.
- Two Siegel decompositions inducing the same Σ give canonically isomorphic models.

Direct prerequisites: `ShimuraCompactificationsPartII:C10/main-theorem` (C10.7); `ShimuraCompactifications:C3/roadmap/toric-structure-sheaf-vanishing`; `ShimuraCompactifications:C3/roadmap/refinement-map`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C10`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C10.9. Embeddings of Shimura data and Hecke correspondences

`ShimuraCompactificationsPartII:C10/functoriality` · theorem · implementation: unchecked.

Let η : (G′, X′) ↪ (G, X) be an embedding of Hodge-type data, K′ ⊂ G′(𝔸_f) neat, g ∈ G(𝔸_f) with gη(K′)g^{-1} ⊂ K, and Σ′ admissible for (G′, X′, K′) refining (η, g)^*Σ, with Σ complete. Then the finite map 𝒮_{K′} → O_{E′,(v′)} ⊗ 𝒮_K extends uniquely to (η, g) : 𝒮^{Σ′}_{K′} → O_{E′,(v′)} ⊗ 𝒮^Σ_K, carrying 𝒵_{K′}(Υ′) into 𝒵_K((η, g)_*Υ′) and inducing on formal completions the maps of boundary charts (4.1.12.2). In particular prime-to-p Hecke correspondences (η = id, g ∈ G(𝔸_f^p)) extend to toroidal models for compatible pairs of cone decompositions; they do not act on a single fixed Σ in general.

**Hypotheses.**

- Hodge type; the place v′ of E′ lies over v; Σ complete; compatibility of cone decompositions is part of the hypothesis.

**Proof or construction.**

- On boundary charts the map (4.1.12.1) of normalized boundary towers is finite and extends to the twisted torus embeddings for cones with η(σ′) ⊂ σ meeting σ°.
- Glue by the characteristic-zero map of ShimuraCompactifications C3 and the extension lemma for normal formal completions (Madapusi Pera 2.1.29 and A.3.4).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §4.1.12 and Proposition 4.1.13, pp. 73–74. Extends maps of integral models for embeddings of Shimura data and Hecke translations to toroidal models for compatible cone decompositions, compatibly with strata and formal completions.

**Acceptance checks.**

- Over a one-dimensional cusp of a GSpin variety the cone decomposition is forced, so prime-to-p Hecke correspondences extend uniquely over the preimage of the complement of the zero-dimensional cusps (C15/gspin-one-dimensional-cusps).

Direct prerequisites: `ShimuraCompactificationsPartII:C10/formal-completion` (C10.6); `ShimuraCompactifications:C3/roadmap/level-datum-functoriality`; `ShimuraCompactifications:C3/roadmap/hecke-span`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C10`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C10.10. Properness of the interior

`ShimuraCompactificationsPartII:C10/projectivity-criterion` · theorem · implementation: unchecked.

𝒮_K is proper (equivalently projective) over O_{E,(v)} if and only if G^ad is ℚ-anisotropic, if and only if G^ad(ℚ) contains no nontrivial unipotent element.

**Hypotheses.**

- Hodge type; neat K.

**Proof or construction.**

- If G^ad has a proper ℚ-parabolic, the boundary of 𝒮^Σ_K is a nonempty relative Cartier divisor flat over O (C10/stratification), so 𝒮_K is not proper.
- If there is no proper ℚ-parabolic, the compactification has no boundary, so the interior is proper. Choose projective auxiliary toroidal compactifications: the normalization is finite over their projective product, hence projective. This argument does not depend on the later C12 minimal construction.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Corollary 4.1.7, p. 72. Characterizes properness of the integral model by anisotropy of G^ad, read off from the stratification.

**Acceptance checks.**

- Shimura curves attached to indefinite quaternion algebras over ℚ give proper integral models; modular curves do not.

Direct prerequisites: `ShimuraCompactificationsPartII:C10/main-theorem` (C10.7); `ShimuraCompactificationsPartII:C10/stratification` (C10.5).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C10`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C10.11. Potential good reduction when the Mumford–Tate group is anisotropic (Morita)

`ShimuraCompactificationsPartII:C10/morita-conjecture` · theorem · implementation: unchecked.

Let A be an abelian variety over a number field F whose Mumford–Tate group MT_A is anisotropic modulo its centre. Then A has potentially good reduction at every finite place of F.

**Hypotheses.**

- F a number field; MT_A is independent of the complex embedding (Deligne).

**Proof or construction.**

- By Zarhin's trick replace A by an abelian variety isogenous to A^8 with a principal polarization.
- (MT_A, X_A) ↪ (GSp(H), S^±(H)) is an embedding of Shimura data of Hodge type; with K = K‡ ∩ G(𝔸_f) the integral model 𝒮_K is proper over O_{E,(v)} by C10/projectivity-criterion.
- A arises from an F′-point of 𝒮_K for a finite F′/F; by properness it extends over O_{F′,(v′)}, so A has good reduction at v′.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 5, p. 6; Theorem 4.1.9 and its proof, pp. 72–73. Deduces Morita's conjecture from the properness criterion for integral models of Hodge type.

**Acceptance checks.**

- An abelian variety with CM by a field (Mumford–Tate group a torus, hence anisotropic modulo centre) has potentially good reduction everywhere.
- An elliptic curve with non-integral j-invariant has Mumford–Tate group GL_2, which is isotropic, so the theorem does not apply.

Direct prerequisites: `ShimuraCompactificationsPartII:C10/projectivity-criterion` (C10.10); `ShimuraCompactificationsPartII:C7/zarhin-self-dual-replacement` (C7.2).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C10`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C10.12. Connected components of the integral model

`ShimuraCompactificationsPartII:C10/connected-components` · theorem · implementation: unchecked.

If the special fibre k(v) ⊗ 𝒮_K is geometrically reduced, then for every finite F/E and place w | v the natural maps π_0(F ⊗_E Sh_K) ← π_0(O_{F,(w)} ⊗ 𝒮_K) → π_0(k(w) ⊗ 𝒮_K) are bijections.

**Hypotheses.**

- Hodge type; geometric reducedness of the special fibre of the interior is a hypothesis.

**Proof or construction.**

- By C10/main-theorem the special fibre of 𝒮^Σ_K is geometrically reduced, and 𝒮_K is fibrewise dense in it.
- For a flat proper algebraic space with geometrically reduced special fibre, Stein factorization reduces to a finite étale O_{E,(v)}-scheme, where the bijections are clear.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Corollary 4.1.11 and its proof, p. 73. Compares connected components of generic, integral and special fibres when the special fibre is geometrically reduced.

**Acceptance checks.**

- For a neat modular model with full hyperspecial p-level, geometric reducedness holds and the component comparison applies. Neatness away from p alone does not imply reducedness at deeper p-level.
- The reducedness assumption is substantive: Stroh15 Remark 2.4.9, p. 28 gives nonreduced special fibres at pro-p Iwahori level, already in genus one.

Direct prerequisites: `ShimuraCompactificationsPartII:C10/main-theorem` (C10.7); `SchemeAndStackFoundations:SF.4`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C10`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C10.13. Rationality of Hodge cycles under p-adic uniformization (étale form)

`ShimuraCompactificationsPartII:C10/etale-rationality` · theorem · implementation: unchecked.

Let A be an abelian variety over a number field F with totally degenerate reduction at a place v (a torus with character group X_g = ℤ^g), Raynaud uniformization 1 → X_g → Hom(X_g, 𝔾_m)^an → A^an_{F_v} → 1, and for each prime ℓ let U_ℓ ⊂ GL(V_ℓ(A)) be the unipotent radical stabilizing the induced extension 0 → X_g ⊗ ℚ_ℓ(1) → V_ℓ(A) → Hom(X_g, ℚ_ℓ) → 0, so Lie U_ℓ = ℚ_ℓ(1) ⊗ Hom(X_g^∨, X_g). Let G = MT_A. Then B_G := Hom(X_g^∨, X_g) ∩ (Lie G_{ℚ_ℓ})(−1) is independent of ℓ, and ℚ_ℓ(1) ⊗ B_G ≅ Lie U_ℓ ∩ Lie G_{ℚ_ℓ} for every ℓ.

**Hypotheses.**

- Totally degenerate reduction at v; the image of G_{ℚ_ℓ} in GL(V_ℓ(A)) is determined up to inner automorphism.

**Proof or construction.**

- Realize A as a point of the Hodge-type Shimura variety of (MT_A, X_A) near a zero-dimensional cusp of the Siegel boundary.
- The torus torsor of C10/boundary-torus-torsor has cocharacter lattice B_K(Φ) = B_G at the corresponding point; the non-emptiness of the torsor I(Υ, s_0) of tensor-preserving level structures identifies 𝔸_f(1) ⊗ Lie W_Φ with Lie U_{G,𝔸_f} (Remark 4.2.12).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 4, p. 5; Remark 4.2.12, p. 79. States the ℓ-independent rationality of Hodge cycles with respect to p-adic uniformization and deduces it from the flatness of the boundary and the tensor-preserving level torsor.

**Acceptance checks.**

- For a product of Tate curves E_{q_1} × E_{q_2} with multiplicatively independent q_i the Mumford–Tate group is GL_2 ×_{G_m} GL_2 and B_G has rank 2.
- B_G does not depend on ℓ.

Direct prerequisites: `ShimuraCompactificationsPartII:C10/boundary-torus-torsor` (C10.4); `NeronModelsAndSemistableAbelianVarieties:R11.3`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C10`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

## C12. Minimal compactifications of Hodge type

The Hodge line on the normalized toroidal model and its boundary decomposition (Definition 5.1.1, 5.1.4); semiampleness, invariance of its sections under refinement and finite generation (Proposition 5.1.3); Fourier–Jacobi expansions, their independence of the cone and positivity of support (5.1.5–5.1.8); the minimal compactification 𝒮^min_K as Proj of the Hodge section algebra with its contraction, universal property, flat boundary, ample Hodge line, stratification by Δ^fin_K(Φ)\𝒮_{K_Φ,h}, compatibility with toroidal strata and the Koecher principle (5.2.1–5.2.11); complete local rings over quotient-stratum points using all pure-base lifts (Corollary 5.2.8); Hecke correspondences on 𝒮^min_K (Proposition 5.2.13); and the scalar Fourier coordinates and unipotent action at torus-only zero-dimensional cusps used by Maulik–Shankar–Tang §8.2. Build the section-ring Proj first, then its complete local rings, then the stratum theorem; the local-ring calculation does not assume the stratum immersion it proves.

Layer prerequisites: `ShimuraCompactificationsPartII:C10`; `ShimuraCompactifications:C2`; `ShimuraCompactifications:C5`; `ShimuraCompactificationsPartII:C7`; `ShimuraCompactificationsPartII:C9`; `SchemeAndStackFoundations:SF.0`; `ModularCurvesPartII:R13.4a`; `ShimuraCompactifications:C3`; `ShimuraCompactifications:C1`.

### C12.1. The Hodge line on the normalized toroidal model

`ShimuraCompactificationsPartII:C12/hodge-bundle` · definition · implementation: unchecked.

For an auxiliary Siegel datum and complete Σ, the Hodge line ω_K(Σ) on 𝒮^Σ_K is the pullback along ν of ω_{K‡}(Σ‡) = det(H_dR(Σ‡)/F^0H_dR(Σ‡))^{⊗−1} on the good Siegel model, equivalently det(Lie^∨) of the pulled-back universal semi-abelian scheme. On a boundary chart of a cusp label Φ it decomposes as ω_K(Φ) = ω^ét(Φ) ⊗_ℤ ω^ab_K(Φ), where ω^ab_K(Φ) is the Hodge line of the abelian scheme over 𝒮_{K_Φ,h} and ω^ét(Φ) is the determinant line of the fixed toric character lattice, a free ℤ-module of rank one (equivalently the inverse determinant of its dual homological torus lattice); in particular ω_K(Φ) is pulled back from 𝒮_{K_Φ,h}.

**Hypotheses.**

- Σ complete; the decomposition uses the weight-graded pieces of the de Rham realization of the 1-motive (C9/one-motive-realizations).

**Proof or construction.**

- Pull back along the finite map ν (C7/normalized-toroidal-model).
- For a fixed symplectic representation, independence of auxiliary level K‡ and fan Σ‡: two choices are dominated by a third through finite maps, and the Siegel Hodge lines pull back to each other.
- On boundary charts take determinants of the weight-graded pieces of H_dR(Φ, σ) (Madapusi Pera (5.1.4.1)).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Definition 5.1.1, §5.1.2 and §5.1.4, pp. 83–84. Defines the Hodge bundle on the Siegel compactification, restricts it to 𝒮^Σ_K, shows independence of choices and compatibility with refinements, and decomposes it on boundary charts.

**Uses that determine the API.**

- Madapusi Pera §5.2: the minimal compactification is the Proj of its section ring.
- Pilloni §6.2.2: X^⋆ and X^⋆_par are Proj of sections of ω.

**Planning API.**

- `hodgeLine` (constructor): ω_K(Σ) on 𝒮^Σ_K, an invertible sheaf.
- `hodgeLine_pullback_refinement` (functoriality): For a refinement f : 𝒮^{Σ′}_K → 𝒮^Σ_K, f^*ω_K(Σ) ≅ ω_K(Σ′).
- `hodgeLine_independent` (other): For a fixed Hodge embedding/symplectic representation, finite auxiliary-level comparisons and fan refinements preserve ω. Changing the representation need not preserve the line: Zarhin’s eightfold replacement changes ω to ω^⊗8.
- `hodgeLine_boundary` (characterisation): On the chart of Φ, ω_K(Σ) ≅ ω^ét(Φ) ⊗ ω^ab_K(Φ), pulled back from 𝒮_{K_Φ,h}.
- `hodgeLine_interior` (compatibility): On 𝒮_K, ω_K(Σ) is the determinant of the Lie algebra dual of the universal abelian scheme pulled back from the Siegel model.
- `hodgeLine_refinement_cocycle` (simp): The canonical pullback identification for an identity refinement is the identity and that for a composite is the composite pullback identification, at the fixed symplectic representation.

**Unit tests.**

- `hodgeLine_modular_test` (computation): For a smooth good-level modular curve with full hyperspecial p-level, ω is the weight-one line, ω²≅Ω¹(log cusps), and Δ is a section of ω¹². At bad p-level the same Kodaira–Spencer formula needs the appropriate dualizing/logarithmic comparison and is not asserted here.
- `hodgeLine_zeroDim_test` (degenerate): At a torus-only boundary label with B=0, ω is the fixed rank-one lattice factor. A zero-dimensional pure Shimura base alone does not imply B=0; a Picard modular surface can have a CM elliptic abelian part at its cusp.
- `hodgeLine_notAmple_test` (non-example): On a positive-dimensional fibre of the contraction to the minimal compactification (for instance the exceptional fibres over the Siegel cusp in genus two) ω_K(Σ) is trivial, so ω_K(Σ) is semiample but not ample.

**Acceptance checks.**

- ω_K(Σ) is ample on 𝒮_K up to the boundary contraction: its pushforward to the minimal compactification is ample.
- At smooth good modular level, ω²≅Ω¹(log cusps); Zarhin replacement scales the Hodge line by the eighth tensor power.

Direct prerequisites: `ShimuraCompactificationsPartII:C7/normalized-toroidal-model` (C7.5); `ShimuraCompactificationsPartII:C9/one-motive-realizations` (C9.1); `ShimuraCompactifications:C5/roadmap/hodge-semiampleness`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C12`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C12.2. Sections of the Hodge line

`ShimuraCompactificationsPartII:C12/hodge-sections` · theorem · implementation: unchecked.

(1) A positive power of ω_K(Σ) is generated by its global sections over 𝒮^Σ_K. (2) For a refinement Σ′ of Σ and n ≥ 0, H^0(𝒮^Σ_K, ω^{⊗n}) → H^0(𝒮^{Σ′}_K, ω^{⊗n}) is an isomorphism. (3) The graded O_{E,(v)}-algebra ⊕_n H^0(𝒮^Σ_K, ω^{⊗n}) is finitely generated.

**Hypotheses.**

- Σ complete; O_{E,(v)} excellent.

**Proof or construction.**

- (1) Moret-Bailly's theta-constant argument for semi-abelian families over normal excellent bases (ShimuraCompactifications C5.32, hodgeLine_generated), as in Faltings–Chai V.2.1.
- (2) Projection formula with f_*O = O and R^if_*O = 0 (C10/refinements).
- (3) From (1) and properness as in Lan's book 7.2.2.6.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Proposition 5.1.3, p. 83. Proves semiampleness of the Hodge line, invariance of its sections under refinement and finite generation of its section algebra.

**Acceptance checks.**

- For the modular curve, ω^{⊗12} is generated by Δ and E_4^3.
- Sections of ω^{⊗n} on 𝒮^Σ_K and on any refinement agree.

Direct prerequisites: `ShimuraCompactificationsPartII:C12/hodge-bundle` (C12.1); `ShimuraCompactificationsPartII:C10/refinements` (C10.8); `ShimuraCompactifications:C5/roadmap/hodge-semiampleness`; `ShimuraCompactifications:C5/roadmap/graded-section-finite-generation`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C12`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C12.3. Fourier–Jacobi expansions on Hodge-type models

`ShimuraCompactificationsPartII:C12/fourier-jacobi` · construction · implementation: unchecked.

For a cusp label representative Φ, write 𝒮_{K_Φ}(Q_Φ, D_Φ) = Spec_{𝒮_{K_Φ}(Q_Φ,D̄_Φ)} ⊕_{ℓ∈S_K(Φ)} Ψ(ℓ)_K(Φ), S_K(Φ) the character group of E_K(Φ) and Ψ(ℓ) line bundles, and set FJ(ℓ)_K(Φ) = π_*Ψ(ℓ)_K(Φ) on 𝒮_{K_Φ,h}. The Fourier–Jacobi expansion along Υ = [(Φ, σ)] is the map FJ_{(Φ,σ)} : H^0(𝒮^Σ_K, ω^{⊗n}) → ∏_{ℓ∈S_K(Φ)} H^0(𝒮_{K_Φ,h}, FJ(ℓ)_K(Φ) ⊗ ω^{⊗n}_K(Φ)) obtained by restricting to the completion along 𝒵_K(Υ) (C10/formal-completion) and expanding in the completed character decomposition. It does not depend on σ (write FJ_Φ), its image lies in the Δ_K(Φ)-invariants of the product over the submonoid P_K(Φ) of characters pairing nonnegatively with the cone H(Φ), and it is compatible with the isomorphisms ρ(γ, q) between equivalent cusp label representatives.

**Hypotheses.**

- Σ complete; Δ_K(Φ) the arithmetic group of Φ acting through its action on characters and on 𝒮_{K_Φ,h}.

**Proof or construction.**

- The completion (5.1.5.1) of the torsor along the σ-stratum is the completed sum over ℓ ∈ S_K(Φ, σ) of Ψ(ℓ); the projection formula along π gives the expansion.
- Independence of σ and the positivity of the support: compare two cones through a common refinement and use the Koecher-type argument of Madapusi Pera 5.1.7–5.1.8.
- Compatibility with ρ(γ, q): ρ(γ, q)^*Q(Φ′) ≅ Q(Φ) induces ρ(γ, q)^*ω_K(Φ′) ≅ ω_K(Φ) (5.1.6.1).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §§5.1.5–5.1.6, Lemma 5.1.7 and Corollary 5.1.8, pp. 84–85. Defines Fourier–Jacobi expansions of sections of powers of the Hodge line along boundary strata, proves independence of the cone and invariance under the arithmetic group, with support in the nonnegative characters.

**Uses that determine the API.**

- Madapusi Pera §5.2.3: the constant term FJ^(0)_Φ determines restriction to the boundary stratum and gives the map to the minimal compactification.
- Maulik–Shankar–Tang §8.2: the complete local ring at a zero-dimensional cusp is a ring of invariant power series in these coordinates.

**Planning API.**

- `fourierJacobi` (constructor): FJ_Φ : H^0(𝒮^Σ_K, ω^{⊗n}) → ∏_{ℓ} H^0(𝒮_{K_Φ,h}, FJ(ℓ) ⊗ ω^{⊗n}_K(Φ)).
- `fourierJacobi_indep_cone` (other): FJ_{(Φ,σ)} does not depend on σ ∈ Σ(Φ).
- `fourierJacobi_support` (characterisation): The image lies in the Δ_K(Φ)-invariants of the product over P_K(Φ).
- `fourierJacobi_conj` (functoriality): Compatibility with ρ(γ, q) for equivalent representatives.
- `fourierJacobi_constantTerm` (projection): The ℓ = 0 component FJ^(0)_Φ(f) ∈ H^0(𝒮_{K_Φ,h}, ω^{⊗n}_K(Φ))^{Δ_K(Φ)}, which determines the restriction of f to the stratum.
- `fourierJacobi_mul` (compatibility): Fourier–Jacobi expansion is a graded algebra map: products of forms correspond to convolution in the character index using Ψ(ℓ)⊗Ψ(ℓ′)≅Ψ(ℓ+ℓ′), with the usual formal-support interpretation.

**Unit tests.**

- `fourierJacobi_modular_test` (computation): For the modular curve at the cusp ∞ with width w, FJ_Φ is the q-expansion in q^{1/w} and Δ = q − 24q² + ⋯ has FJ^(0) = 0.
- `fourierJacobi_interior_test` (degenerate): For Φ = (G, X^+, 1) the expansion is restriction to 𝒮_K itself (only ℓ = 0).
- `fourierJacobi_negative_test` (non-example): A character ℓ pairing negatively with H(Φ) never occurs in the support: on the Hilbert modular surface the expansion of a holomorphic form has only totally nonnegative exponents (Koecher).

**Acceptance checks.**

- For the modular curve the expansion is the q-expansion at the cusp.
- Only characters pairing nonnegatively with the positivity cone occur.

Direct prerequisites: `ShimuraCompactificationsPartII:C10/formal-completion` (C10.6); `ShimuraCompactificationsPartII:C10/boundary-torus-torsor` (C10.4); `ShimuraCompactificationsPartII:C12/hodge-bundle` (C12.1); `ShimuraCompactifications:C5/roadmap/hodge-line-fourier-jacobi-expansion`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C12`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C12.5. Complete local rings of the minimal compactification

`ShimuraCompactificationsPartII:C12/minimal-complete-local-rings` · theorem · implementation: unchecked.

Construct the section-ring Proj and its proper contraction from C12/hodge-sections, before asserting its full stratification theorem. For a geometric point x of that Proj lying under a cusp label Φ, let y be its point on the finite quotient Z_K([Φ])=Δ^fin_K(Φ)\𝒮_{K_Φ,h}. Push the Fourier–Jacobi sheaves to this quotient and complete at y: equivalently take the semilocal completion over all lifts of y on the pure model, with the induced arithmetic action. The complete local ring at x is [∏_{λ∈P_K(Φ)} FJ(λ)^∧_y]^{Δ_K(Φ)} in this quotient/semilocal sense. It is not the invariants of the stalk at one arbitrary lift which the full group need not fix.

**Hypotheses.**

- Hodge type, neat level and a complete fan; use the section-ring Proj and Stein contraction constructed from C12/hodge-sections. The quotient-stratum locally closed immersion is deduced afterwards in C12/minimal-compactification.

**Proof or construction.**

- Apply proper formal functions to the Stein contraction of the section-ring Proj and C10’s formal torus charts. Keep all lifts of the quotient point y, so the arithmetic group acts on the semilocal completed Fourier–Jacobi algebra, and take invariants as in MP19 Corollary 5.2.8. The constant term gives the unramified quotient-stratum map used later in Corollary 5.2.9. This argument does not assume that locally closed immersion in advance.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Corollary 5.2.8, p. 87. Describes the complete local ring of the minimal compactification at a boundary point as invariants of a product of completed Fourier–Jacobi stalks.
- [MP19](https://arxiv.org/pdf/1211.1731v6), Remark 5.2.10, p. 87. Points out that the finite group Δ^fin_K(Φ) intervenes, unlike in Lan's book 7.2.3.15, where injectivity on geometric points of the boundary map is claimed without proof outside the Siegel case.

**Acceptance checks.**

- At a split torus-only Siegel cusp in a characteristic-p fibre, the coefficient ring is the residue field and the formula becomes arithmetic-invariant nonnegative Fourier power series. For an integral completed local ring, retain the completed integral cusp base.

Direct prerequisites: `ShimuraCompactificationsPartII:C12/fourier-jacobi` (C12.3); `ShimuraCompactifications:C3/roadmap/refinement-structure-sheaf`; `ShimuraCompactificationsPartII:C12/hodge-sections` (C12.2).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C12`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C12.4. The minimal compactification of Hodge type

`ShimuraCompactificationsPartII:C12/minimal-compactification` · construction · implementation: unchecked.

𝒮^min_K := Proj(⊕_n H^0(𝒮^Σ_K, ω^{⊗n})) for complete Σ. It is a normal projective O_{E,(v)}-scheme independent of Σ, with a canonical surjective map ∮_{Σ′} : 𝒮^{Σ′}_K → 𝒮^min_K with geometrically connected fibres for every sufficiently fine complete Σ′ (the Stein factorization of the map given by a basepoint-free power of ω). It satisfies: (1) 𝒮_K → 𝒮^min_K is an open immersion with complement flat over O_{E,(v)}; (2) ω extends to an ample line bundle ω^min_K with ∮^*ω^min_K ≅ ω_K(Σ); (3) a stratification 𝒮^min_K = ⊔_{[Φ]} 𝒵_K([Φ]) by cusp classes, 𝒵_K([Φ]) = Δ^fin_K(Φ)\𝒮_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}) mapping by a locally closed immersion, with closure relation given by the order on cusp classes; (4) compatibility with strata: ∮^{-1}(𝒵_K([Φ])) = ⊔_σ 𝒵_K([(Φ, σ)]); (5) if 𝒮^1_K ⊂ 𝒮^Σ_K is the preimage of the complement of the strata of codimension ≥ 2, then H^0(𝒮^Σ_K, ω^{⊗n}) ≅ H^0(𝒮^1_K, ω^{⊗n}), and if G^ad has no factor PGL_2 then H^0(𝒮^Σ_K, ω^{⊗n}) ≅ H^0(𝒮_K, ω^{⊗n}) (Koecher). Universal property: for a very ample L on T and f : 𝒮^{Σ′}_K → T with f^*L ≅ ω^{⊗N}, f factors uniquely through ∮_{Σ′}.

**Hypotheses.**

- Hodge type; neat K arbitrary at p; Σ complete.

**Proof or construction.**

- Projectivity and normality from finite generation and normality of 𝒮^Σ_K (C12/hodge-sections; Bosch–Lütkebohmert–Raynaud 6.7, Lemma 2).
- The constant term of FJ_Φ shows the composite 𝒵_K(Φ, σ) → 𝒮^min_K factors through Δ^fin_K(Φ)\𝒮_{K_Φ,h} (5.2.3); images of distinct cusp classes are disjoint (5.2.7) using the stratification of 𝒮^Σ_K and the Siegel case.
- Each 𝒵_K([Φ]) → 𝒮^min_K is unramified by C12/minimal-complete-local-rings, finite onto its image and birational (checked over ℂ, Pink 6.3), hence a locally closed immersion (5.2.9).
- Ampleness of ∮_*ω as in Lan's book 7.2.4.1; flatness of the boundary from flatness of the strata (C10/stratification).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §5.2, (5.2.1)–Theorem 5.2.11, pp. 85–88. Constructs the minimal compactification as Proj of the Hodge section algebra, with its Stein factorization description, universal property, stratification by quotients of boundary integral models, flat boundary, ample Hodge line and Koecher principle.
- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 3, p. 5. Summarizes: the minimal compactification of Sh_K has a projective normal model over O_{E,(v)} stratified by quotients of integral models of Hodge type.

**Uses that determine the API.**

- Maulik–Shankar–Tang §8.1: 𝒮^BB with flat stratification and extended Hecke correspondences.
- ShimuraCompactifications C5.31: a normal projective flat minimal model, here for Hodge-type data.

**Planning API.**

- `MinimalCompactification` (constructor): 𝒮^min_K as the Proj of the Hodge section algebra.
- `MinimalCompactification.contraction` (data): ∮_Σ : 𝒮^Σ_K → 𝒮^min_K, surjective with geometrically connected fibres.
- `MinimalCompactification.ample` (other): ω^min_K ample with ∮^*ω^min_K ≅ ω_K(Σ).
- `MinimalCompactification.stratum` (constructor): 𝒵_K([Φ]) = Δ^fin_K(Φ)\𝒮_{K_Φ,h} with its locally closed immersion.
- `MinimalCompactification.lift` (universal-property): Factorization of maps to projective schemes pulling back a very ample line to a power of ω.
- `MinimalCompactification.koecher` (other): Restriction of sections of ω^{⊗n} to the complement of codimension-two strata, or to 𝒮_K when G^ad has no PGL_2 factor, is bijective.
- `MinimalCompactification.lift_unique` (extensionality): The factorization through the contraction in lift is unique; two such morphisms agreeing after pullback by the surjective contraction coincide, using π_*O=O.

**Unit tests.**

- `MinimalCompactification.modular_test` (computation): For the modular curve with neat prime-to-p level at level K_0(p), 𝒮^min_K is the normal projective curve X_0(p) over ℤ_(p) and coincides with 𝒮^Σ_K.
- `MinimalCompactification.siegel_test` (compatibility): For the Siegel datum at hyperspecial level, 𝒮^min_K is the integral minimal compactification of ShimuraCompactifications C5.16.
- `MinimalCompactification.koecherFails_test` (non-example): For a modular curve, weakly holomorphic forms give sections on the interior which have cusp poles. For example E₄⁶/Δ has weight 12 and q-expansion q⁻¹+O(1), so it does not extend as a section of ω¹². The PGL₂ exception is substantive.
- `MinimalCompactification.compact_test` (degenerate): If G^ad is anisotropic, 𝒮^min_K = 𝒮^Σ_K = 𝒮_K.

**Acceptance checks.**

- For the Siegel threefold at hyperspecial level the minimal boundary consists of curves and points.
- The boundary of 𝒮^min_K is flat over O_{E,(v)}.

Direct prerequisites: `ShimuraCompactificationsPartII:C12/hodge-sections` (C12.2); `ShimuraCompactificationsPartII:C12/fourier-jacobi` (C12.3); `ShimuraCompactificationsPartII:C10/stratification` (C10.5); `ShimuraCompactifications:C2/roadmap/minimal-boundary-map`; `SchemeAndStackFoundations:SF.0`; `ShimuraCompactificationsPartII:C12/minimal-complete-local-rings` (C12.5); `ModularCurvesPartII:R13.4a`.

Atlas planet: **Minimal compactification of Hodge type**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C12`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C12.6. Hecke correspondences on the minimal compactification

`ShimuraCompactificationsPartII:C12/minimal-hecke` · theorem · implementation: unchecked.

For an embedding of Hodge-type data η and g as in C10/functoriality, the map 𝒮_{K′} → O_{E′,(v′)} ⊗ 𝒮_K extends uniquely to 𝒮^min_{K′} → O_{E′,(v′)} ⊗ 𝒮^min_K carrying 𝒵_{K′}([Φ′]) to O_{E′,(v′)} ⊗ 𝒵_K([ι_*Φ′]) via the induced finite maps of boundary quotients. In particular prime-to-p Hecke correspondences extend to 𝒮^min_K, without any compatibility condition on cone decompositions.

**Hypotheses.**

- Same setting as C10/functoriality.

**Proof or construction.**

- Apply the universal property of C12/minimal-compactification to the composite of the toroidal map of C10/functoriality with the contraction, for compatible cone decompositions; uniqueness makes the result independent of them.

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §5.2.12 and Proposition 5.2.13, p. 88. Extends maps induced by embeddings of data and Hecke translations to the minimal compactifications, compatibly with strata.
- [MST22](https://math.berkeley.edu/~ytang/GSpincharp.pdf), §8.1, p. 37. Uses that the Hecke correspondences of G(𝔸_f^p) extend to the minimal compactification of the GSpin integral model, so Zariski closures of Hecke orbits there are Hecke-stable.

**Acceptance checks.**

- Prime-to-p Hecke correspondences extend to the minimal compactification of the modular curve as the usual Hecke correspondences on X(K).
- The extension does not depend on auxiliary cone decompositions.

Direct prerequisites: `ShimuraCompactificationsPartII:C12/minimal-compactification` (C12.4); `ShimuraCompactificationsPartII:C10/functoriality` (C10.9).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C12`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C12.7. Coordinates and the unipotent action at a zero-dimensional cusp

`ShimuraCompactificationsPartII:C12/zero-dimensional-cusp-coordinates` · theorem · implementation: unchecked.

Let ℓ ≠ p, K_n the level obtained from the Siegel full level-ℓ^n subgroup, and x_n a zero-dimensional cusp of 𝒮^min_{K_n} ⊗ k (k = F̄_p) with cusp label representative Φ: P_Φ is an admissible parabolic with unipotent radical U_P and centre W, B_{K_n} ⊂ W(ℚ) the level lattice with dual S_{K_n}, Δ_{K_n} its arithmetic group and H ⊂ W(ℝ) the open self-adjoint cone. Then the complete local ring of 𝒮^min_{K_n,k} at x_n is R_{ℓ^n} = k[[q^λ]]^{Δ_{K_n}}_{λ≥0} (λ ∈ S_{K_n} pairing nonnegatively with H), and on R_ℓ = ⋃_n R_{ℓ^n} the group 𝔹_ℓ = B_{K_n} ⊗ ℤ[1/ℓ] ⊂ W(ℚ_ℓ), which fixes the compatible system of cusps, acts by T(∑ a_λ q^λ) = ∑ e((T, λ)) a_λ q^λ, where e : ℤ[1/ℓ] → μ_{ℓ^∞}(k) is the character a/ℓ^n ↦ ζ_{ℓ^n}^a determined by the cusp and the level structure.

**Hypotheses.**

- Hodge type, hyperspecial level at p, ℓ ≠ p; torus-only cusp: the pure base is zero-dimensional and the abelian part is trivial. This extra condition holds for the GSpin line cusps in MST22 and the maximal Siegel cusps, but does not follow for arbitrary Hodge type from the dimension of the pure base.

**Proof or construction.**

- Under the torus-only hypothesis, specialize the Fourier–Jacobi completion formula to the geometric characteristic-p cusp, trivialize its rank-one coefficient factors after splitting the cusp, and take the arithmetic invariants. Without that hypothesis the coefficients are sections over an abelian boundary base, not just elements of k.
- The prime-to-p Hecke action of G(ℚ_ℓ) on lim_n 𝒮^min_{K_n,k} restricts to W(ℚ_ℓ) ∩ stabilizer = 𝔹_ℓ, acting on the torus coordinates q^λ by the characters e((T, λ)) (Chai 1995, p. 452, via Madapusi Pera 2.1.11–2.1.18).

**Sources and match.**

- [MST22](https://math.berkeley.edu/~ytang/GSpincharp.pdf), §8.2, pp. 37–38. Describes the complete local ring at a zero-dimensional cusp as invariant power series in the cusp coordinates and the action of B_ℓ by roots of unity, following Madapusi Pera 2.1.11–2.1.18 and Corollaries 5.1.8, 5.2.8 and Chai.
- [MP19](https://arxiv.org/pdf/1211.1731v6), Corollaries 5.1.8 and 5.2.8, pp. 85 and 87. Supplies the Fourier–Jacobi description of the completed local rings.

**Acceptance checks.**

- For the modular cusp at level ℓ^n, R_{ℓ^n}=k[[q^{1/ℓ^n}]]. With the additive-character convention above, an integral translation T=a acts on q^{1/ℓ^n} by ζ_{ℓ^n}^a. For a general fractional T, evaluate e(T/ℓ^n); using T=a/ℓ^n with the same claimed exponent would insert an extra denominator.

Direct prerequisites: `ShimuraCompactificationsPartII:C12/minimal-complete-local-rings` (C12.5); `ShimuraCompactificationsPartII:C12/minimal-hecke` (C12.6); `ShimuraCompactifications:C1/roadmap/boundary-incidence`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C12`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

## C11. Hyperspecial level: smooth canonical compactifications

At hyperspecial level with a p-integral Hodge embedding (§4.3.2) and Kisin's smoothness of the interior (an input recorded as a gap): reductive models of the boundary data and smoothness of the boundary towers; smooth (projective for projective Σ) toroidal compactifications with relative normal crossings boundary, independent of the embedding (Theorem 2); canonical boundary models as a prime-to-p pro-object whose finite levels are smooth, with a compatible-family extension property (Proposition 4.3.5); the logarithmic de Rham bundle H_dR(Σ), the extension of the de Rham tensors and the G_{ℤ_(p)}- and P_μ-torsors over the compactification, independent of the embedding (4.3.1, 4.3.7, 4.3.9, 4.3.10); unramified good reduction of the boundary torus torsors ξ_K → C_K and their torus embeddings for the maximal-parabolic, zero-dimensional pure-base setting (Farb–Kisin–Wolfson Corollary 3.3.18); canonicity of the minimal compactification and smoothness of the stratum maps (Theorem 5.3.1).

Layer prerequisites: `ShimuraCompactificationsPartII:C10`; `ShimuraCompactificationsPartII:C12`; `ReductiveGroupsPartII:RG2.3`; `AutomorphicBundles:B1`; `AutomorphicBundles:B3`; `ShimuraCompactificationsPartII:C7`; `ShimuraCompactificationsPartII:C9`.

### C11.1. p-integral Hodge embeddings

`ShimuraCompactificationsPartII:C11/p-integral-embedding` · definition · implementation: unchecked.

A p-integral Hodge embedding of (G, X) is a Hodge embedding ι : (G, X) ↪ (GSp(H), S^±(H)) together with a reductive model G_{ℤ_(p)} of G over ℤ_(p), a ℤ-lattice H(ℤ) on which ψ is perfect, and a closed immersion of ℤ_(p)-groups G_{ℤ_(p)} ↪ GL(H_{ℤ_(p)}) extending ι, such that K_p = G_{ℤ_(p)}(ℤ_p) (hyperspecial) and K‡_p is the stabilizer of H(ℤ_p); in addition one fixes tensors {s_α} ⊂ H(ℤ_(p))^⊗ whose pointwise stabilizer in GL(H_{ℤ_(p)}) is G_{ℤ_(p)}.

**Hypotheses.**

- G admits a reductive model over ℤ_(p); such lattices and tensors always exist (Kisin 2.3.1, 1.3.2; Kim–Madapusi Pera for p = 2).

**Proof or construction.**

- Choose a G_{ℤ_(p)}-stable lattice (Kisin, Lemma 2.3.1) and, by Zarhin's trick, a self-dual one (C7/zarhin-self-dual-replacement).
- A reductive closed subgroup of GL(H_{ℤ_(p)}) is the pointwise stabilizer of finitely many tensors (Kisin, Proposition 1.3.2).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §4.3.2, p. 80, and §4.3.6, p. 81. Defines p-integral symplectic embeddings and arranges integral tensors cutting out the reductive model, citing Kisin.

**Uses that determine the API.**

- Madapusi Pera Theorem 2 and §4.3: the hyperspecial hypothesis under which the compactification is smooth and canonical.
- Maulik–Shankar–Tang §8.1: the GSpin lattice self-dual at p gives a p-integral embedding via Kuga–Satake.

**Planning API.**

- `PIntegralHodgeEmbedding` (structure): The data (ι, G_{ℤ_(p)}, H(ℤ), {s_α}) with the closed immersion and the hyperspecial level.
- `PIntegralHodgeEmbedding.toAuxiliary` (coercion): The singleton auxiliary Siegel datum it defines.
- `PIntegralHodgeEmbedding.sum` (constructor): The direct sum of two embeddings is symplectic for the diagonal G-action when their similitude characters agree; include that equality in the constructor data. Arbitrary symplectic representations can have different similitude characters.
- `PIntegralHodgeEmbedding.tensors` (projection): The tensors {s_α} ⊂ H(ℤ_(p))^⊗ with stabilizer G_{ℤ_(p)}.
- `PIntegralHodgeEmbedding.ext` (extensionality): Identify embeddings with the same integral representation, symplectic similitude line and specified tensor data; comparison under direct sum retains the equality of similitude characters.

**Unit tests.**

- `PIntegralHodgeEmbedding.siegel_test` (degenerate): For GSp(H), a self-dual lattice and the identity embedding, use the symplectic similitude line (or the alternating tensor twisted by the similitude character), together with a finite stabilizing tensor family. Fixing the untwisted form ψ pointwise cuts out Sp, not GSp.
- `PIntegralHodgeEmbedding.paramodular_test` (non-example): For GSp_4 with K_p the paramodular group the level is not hyperspecial, so no p-integral embedding has this K_p.
- `PIntegralHodgeEmbedding.unitary_test` (computation): For a unitary similitude group GU of an imaginary quadratic field unramified at p, choose a self-dual hermitian lattice and its alternating trace form. The O-action together with the symplectic similitude line gives the Hodge embedding. The pointwise stabilizer of the untwisted pairing is the isometry subgroup, so this test must distinguish U from GU.

**Acceptance checks.**

- Every Hodge-type datum with G unramified at p admits a p-integral embedding after Zarhin's replacement.
- The tensors cut out exactly G_{ℤ_(p)} inside GL(H_{ℤ_(p)}).

Direct prerequisites: `ShimuraCompactificationsPartII:C7/auxiliary-siegel-datum` (C7.1); `ReductiveGroupsPartII:RG2.3`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C11`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C11.2. Smooth toroidal compactifications at hyperspecial level (Madapusi Pera, Theorem 2)

`ShimuraCompactificationsPartII:C11/smooth-toroidal` · theorem · implementation: unchecked.

Assume ι is p-integral (C11/p-integral-embedding), p > 2 or the hypotheses of Kim–Madapusi Pera at p = 2, so that 𝒮_K is smooth over O_{E,(v)} (Kisin). Then: the boundary pure models 𝒮_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}) are smooth, the parabolic P_Φ extends to a parabolic of G_{ℤ_(p)} and G_{Φ,h} has a reductive model with hyperspecial level; the boundary towers 𝒮_{K_Φ}(Q_Φ, D_Φ) → 𝒮_{K_Φ}(Q_Φ, D̄_Φ) → 𝒮_{K_Φ,h} are a torus torsor over an abelian-scheme torsor over a smooth base; for smooth complete Σ, 𝒮^Σ_K is smooth over O_{E,(v)} (projective when Σ is projective) with boundary a relative normal crossings divisor; and 𝒮^Σ_K with its stratification depends only on Σ, not on the p-integral embedding.

**Hypotheses.**

- p-integral embedding at hyperspecial level; Kisin's smoothness theorem for 𝒮_K and for the boundary data (recorded as a gap owned by ShimuraVarietiesPartII).

**Proof or construction.**

- Boundary data: P_Φ extends by properness of the scheme of parabolics; Q_Φ extends with reductive image in the Levi (Madapusi Pera 4.3.4, citing Pink 1.6.9), so K_{Φ,h,p} is hyperspecial and Kisin's theorem applies to 𝒮_{K_Φ,h}.
- The tower is smooth over the base by C10/boundary-torus-torsor and C10/abelian-torsor-extension (here n = 1).
- The immersion 𝒮_K ↪ 𝒮^Σ_K is étale locally 𝒮_{K_Φ}(Q_Φ, D_Φ) ↪ 𝒮_{K_Φ}(Q_Φ, D_Φ, σ), smooth with normal crossings boundary for smooth σ (C10/main-theorem).
- Independence of the embedding: the boundary integral models are canonical (C11/canonical-boundary-models) and the completions along strata are determined by them (A.3.4).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 2, p. 4; §4.3.3–4.3.4 and proof of Theorem 2, pp. 80–81. Proves smoothness and normal crossings of the toroidal compactification of Kisin's model at hyperspecial level, and independence of the symplectic embedding.
- [MST22](https://math.berkeley.edu/~ytang/GSpincharp.pdf), §8.1, p. 37. Uses that the canonical integral model of the GSpin Shimura variety has a smooth toroidal compactification whose boundary strata are flat divisors with formal completions of the expected shape.

**Acceptance checks.**

- For a PEL datum at a good prime this recovers Lan's smooth compactification (ShimuraCompactifications C5).
- For the modular curve with neat prime-to-p level the compactification is the smooth compactified modular curve over ℤ_(p).

Direct prerequisites: `ShimuraCompactificationsPartII:C10/main-theorem` (C10.7); `ShimuraCompactificationsPartII:C10/abelian-torsor-extension` (C10.3); `ShimuraCompactificationsPartII:C11/p-integral-embedding` (C11.1); `ShimuraCompactificationsPartII:C11/canonical-boundary-models` (C11.3).

Atlas planet: **Smooth toroidal compactification at hyperspecial level**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C11`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C11.3. Canonical models of the boundary mixed Shimura varieties

`ShimuraCompactificationsPartII:C11/canonical-boundary-models` · theorem · implementation: unchecked.

At hyperspecial level, form the prime-to-p boundary tower as the pro-object {𝒮_{K_{Φ,h,p}K^p_Φ}(Q_Φ,D_Φ)}_{K^p}; each sufficiently small finite level is smooth of finite type over O_{E,(v)}, and its transitions are finite étale. The tower has the canonical extension property: for a regular formally smooth O-scheme S, a compatible family of maps S_E→Sh_{K^p} extends uniquely to a compatible family S→𝒮_{K^p}. The tower and its Q_Φ(𝔸_f^p)-action are independent of the p-integral embedding. No finite-type, Noetherian or regular-Noetherian claim is made for the infinite inverse-limit scheme.

**Hypotheses.**

- p-integral embedding; Kisin's smoothness for the boundary pure data.

**Proof or construction.**

- At each finite level use C10’s torus torsor and, at hyperspecial level n=1, its abelian-scheme torsor over the pure model. Kisin’s input makes that pure model smooth. This proves finite-level smoothness without using C11/smooth-toroidal’s embedding-independence clause.
- Extension property as in Kisin's proof of 2.3.8, replacing the extension theorems for abelian schemes by those for 1-motives (Madapusi Pera A.3.5, A.3.6).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §4.3.4 and Proposition 4.3.5, pp. 80–81. Shows the prime-to-p limit of the normalized boundary mixed Shimura models is a canonical integral model with the extension property for regular formally smooth schemes.

**Acceptance checks.**

- For the Siegel datum at hyperspecial level the canonical boundary models are the Faltings–Chai integral boundary moduli.
- The ramified regular trait Spec ℤ_p[√p] is outside the formally smooth test category; being outside it is not, by itself, a counterexample to the extension property.

Direct prerequisites: `ShimuraCompactificationsPartII:C10/boundary-torus-torsor` (C10.4); `ShimuraCompactificationsPartII:C11/p-integral-embedding` (C11.1); `ShimuraCompactificationsPartII:C9/one-motive-realizations` (C9.1); `ShimuraCompactificationsPartII:C10/abelian-torsor-extension` (C10.3).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C11`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C11.4. The de Rham G-torsor over the compactification

`ShimuraCompactificationsPartII:C11/de-rham-torsors` · theorem · implementation: unchecked.

At hyperspecial level with a p-integral embedding and smooth complete Σ: (1) the first relative de Rham homology of the universal abelian scheme extends, with its Hodge filtration and an integrable connection with logarithmic poles along the boundary, to a filtered vector bundle H_dR(Σ) on 𝒮^Σ_K, characterized on completions along strata by the homological realization H₁,dR(Q)=H¹_dR(Q)^∨ of the universal 1-motive (the dual of the log Dieudonné realization); (2) the de Rham tensors s_{α,dR} on 𝒮_K extend uniquely to sections s_{α,dR,Σ} ∈ H^0(𝒮^Σ_K, H_dR(Σ)^⊗); (3) the functor P^Σ_dR(ι) of trivializations O_T ⊗ H(ℤ_(p)) ≅ H_dR(Σ)|_T carrying s_α to s_{α,dR,Σ} is a G_{ℤ_(p)}-torsor extending P_dR(ι), and the sub-functor respecting the Hodge filtration is a canonical reduction to a P_μ-torsor over O_{F,(w)} ⊗ 𝒮^Σ_K for a model μ of the Hodge cocharacter; (4) for another p-integral embedding ι′ there are canonical isomorphisms P^Σ_dR(ι) ≅ P^Σ_dR(ι′) and P^Σ_dR,μ(ι) ≅ P^Σ_dR,μ(ι′).

**Hypotheses.**

- p-integral embedding; smooth complete Σ; F/E finite with a place w | v over which μ is defined.

**Proof or construction.**

- Construct the bundle on completed charts as the dual of C9’s cohomological log Dieudonné realization, with the dual filtrations and log connection, and glue by faithfully flat descent (MP19 §4.3.1). Thus H_dR(Σ) here is homology; its Siegel pairing takes values in the homological Tate line.
- The bundle has already been constructed. Its tensor sections extend uniquely across the codimension-two intersection of the boundary with the special fibre by normality and reflexivity. This does not assert extension of arbitrary vector bundles across codimension two. To prove that tensor-preserving frames form a G-torsor, use the local crystalline tensor frames of Proposition 4.3.7, then obtain the Hodge-parabolic reduction as in Proposition 4.3.9.
- (4): compare both with the torsor of the direct-sum embedding; check over Sh_K(ℂ) (Proposition 4.3.10).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), §4.3.1 and Propositions 4.3.7, 4.3.9 and 4.3.10, pp. 80–82. Extends the de Rham bundle with log connection, the de Rham tensors and the G- and P_μ-torsors of tensor-preserving trivializations over the compactification, independently of the embedding.

**Acceptance checks.**

- For the Siegel datum the torsor is the frame bundle of H_dR(Σ) with its symplectic form, the canonical extension of AutomorphicBundles B3.

Direct prerequisites: `ShimuraCompactificationsPartII:C11/smooth-toroidal` (C11.2); `ShimuraCompactificationsPartII:C9/log-dieudonne-crystal` (C9.4); `ShimuraCompactificationsPartII:C9/absolute-hodge-one-motives` (C9.2); `AutomorphicBundles:B1`; `AutomorphicBundles:B3`.

Atlas planet: **De Rham torsor over the compactification**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C11`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C11.5. Unramified good reduction of boundary torus torsors

`ShimuraCompactificationsPartII:C11/fkw-good-reduction` · theorem · implementation: unchecked.

Let (G, X) be of Hodge type, G reductive over ℤ_p (K_p = G(ℤ_p) hyperspecial, p > 2 or p = 2 under Kim–Madapusi Pera), K = K_pK^p neat, P ⊂ G a ℚ-parabolic as in Farb–Kisin–Wolfson 3.3.11 with unipotent radical U and centre Z, ξ_K = U(ℤ)\U(ℝ)Z(ℂ) → C_K the torus bundle over the abelian scheme C_K, and Σ a fan in X_*(Z(ℂ)/Z(ℤ))_ℚ giving a smooth torus embedding ξ_K(Σ) with normal crossings boundary D_K(Σ). Then (ξ_K(Σ), D_K(Σ)) and ξ_K → C_K have unramified good reduction at p in the sense of Farb–Kisin–Wolfson 2.2.12: they extend to a smooth torus embedding with relative normal crossings boundary over a smooth abelian-scheme torsor over an absolutely unramified discrete valuation ring O_{E_v} (E_v/ℚ_p unramified), namely the normalized boundary tower and twisted torus embeddings of the corresponding cusp label.

**Hypotheses.**

- Hyperspecial level; ξ_K and C_K identified with the analytifications of the boundary mixed Shimura varieties of Madapusi Pera §2.1.7, 2.1.13 (Pink 6.10).
- Farb–Kisin–Wolfson 2.2.12 defines unramified good reduction for proper smooth pairs; for the nonproper pair (ξ_K(Σ), D_K(Σ)) the definition is used with properness omitted, as in their Theorem 3.3.17.
- P is a maximal proper rational parabolic satisfying FKW §3.3.5: its pure boundary Shimura datum is zero-dimensional. This does not imply that C_K has dimension zero or that the abelian part vanishes.

**Proof or construction.**

- Identify ξ_K → C_K with the boundary tower Sh_{K_Φ}(Q_Φ, D_Φ) → Sh_{K_Φ}(Q_Φ, D̄_Φ) over a zero-dimensional pure base for the cusp label of P (FKW 3.3.11 citing Pink and Madapusi Pera 2.1).
- By C11/smooth-toroidal the integral boundary tower is a torus torsor over an abelian-scheme torsor over a smooth (here finite étale) base, and the twisted torus embeddings for smooth σ are smooth with relative normal crossings boundary.
- E_v is unramified over ℚ_p because G is unramified at p, so O_{E_v} is absolutely unramified; descend from O_{E,(v)} to O_{E_v} by completion.

**Sources and match.**

- [FKW](https://arxiv.org/pdf/2110.05534v2), §3.3.11, p. 34; Corollary 3.3.18, p. 36; §2.2.12, p. 15. Defines the torus bundle ξ_K over the abelian scheme C_K at a cusp and its smooth torus embeddings, and states that for Hodge type with reductive G over ℤ_p, p is a prime of unramified good reduction for ξ_K, by Madapusi Pera.
- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 4.1.5(4) and §4.3, pp. 71 and 80–81. Supplies the integral torus torsors and their smoothness at hyperspecial level.

**Acceptance checks.**

- The pure base is finite étale after the stipulated localization, but C_K may be a positive-dimensional abelian variety or abelian-scheme torsor over it; FKW §3.3.11 explicitly allows this.

Direct prerequisites: `ShimuraCompactificationsPartII:C11/smooth-toroidal` (C11.2); `ShimuraCompactificationsPartII:C10/boundary-torus-torsor` (C10.4); `ShimuraCompactificationsPartII:C7/normalized-boundary-tower` (C7.8).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C11`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C11.6. Canonicity of the minimal compactification at hyperspecial level

`ShimuraCompactificationsPartII:C11/canonical-minimal` · theorem · implementation: unchecked.

At hyperspecial level with a p-integral embedding, the minimal compactification 𝒮^min_K of C12/minimal-compactification and its stratification are, up to unique isomorphism, independent of the p-integral embedding; for every admissible Σ, cusp label Φ and σ ∈ Σ(Φ), the induced map 𝒵_K([(Φ, σ)]) → 𝒵_K([Φ]) is smooth.

**Hypotheses.**

- Hyperspecial level; p-integral embeddings.

**Proof or construction.**

- Compare the minimal models of two embeddings via the normalization of the image of the product map from the canonical toroidal model; both projections are isomorphisms on 𝒮_K ∪ Sh^min_K, whose complement has codimension ≥ 2.
- Smoothness: the quotient map 𝒮_{K_Φ,h} → Δ^fin_K(Φ)\𝒮_{K_Φ,h} is étale because the map to the Siegel boundary model factors through it and is unramified (Kisin 2.3.9: complete local rings of 𝒮_{K_Φ,h} are quotients of Siegel ones).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Theorem 5.3.1 and its proof, pp. 88–89. Proves independence of the minimal compactification from the p-integral embedding and smoothness of the toroidal-to-minimal stratum maps at hyperspecial level.

**Acceptance checks.**

- For the Siegel datum the minimal model is Faltings–Chai's integral minimal compactification and the stratum maps are smooth.
- Two p-integral embeddings give the same minimal compactification up to unique isomorphism.

Direct prerequisites: `ShimuraCompactificationsPartII:C12/minimal-compactification` (C12.4); `ShimuraCompactificationsPartII:C11/smooth-toroidal` (C11.2).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C11`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

## C13. Siegel models at deep level at p

Boxer–Pilloni's integral models for GSp_{2g} of every genus at any level K_p: de Jong's 𝒜_{g,d} with polarization-type loci 𝒜_{g,δ} and K_δ (§3.4.19); the normalized toroidal models S^tor_K of products ∏ A^tor_{g,d_i} over ℤ_p and ℤ_p^cycl (§3.4.23) as instances of C7–C8 and C10; the semi-abelian G, G^∨ and λ over A^tor_{g,d} for p | d; the Iwahori-level model of level p^n (n ≥ 0, with n=0 the identity chain) with d_i = p^{n(g−i)} and the extension of the self-dual isogeny chain to semi-abelian schemes (§4.1.1); the literal graded pieces Gr_i as quasi-finite flat groups that may lose rank at the boundary; and, at n = 1, the toroidal compactification of the Iwahori lattice-chain moduli (Remark 4.1.2), together with Stroh’s separate finite-flat order-p extensions obtained by Cartier-dual gluing (Lemmas 2.4.2–2.4.3). A finite-flat input for higher-level graded divisors remains an explicit gap.

Layer prerequisites: `ShimuraCompactificationsPartII:C7`; `ShimuraCompactificationsPartII:C8`; `ShimuraCompactificationsPartII:C10`; `PELModuli:M5`; `PELModuli:M6`; `ShimuraCompactifications:C4`; `ModularCurvesPartII:R13.4a`; `SchemeAndStackFoundations:SF.1`.

### C13.1. Siegel moduli of polarization type δ

`ShimuraCompactificationsPartII:C13/polarization-type-loci` · definition · implementation: unchecked.

For g ≥ 1 and d ≥ 1 let 𝒜_{g,d} be the stack over ℤ of abelian schemes of relative dimension g with a polarization of degree d² (PELModuli M6.4, de Jong). For δ = (δ_1 | δ_2 | ⋯ | δ_g) with ∏ δ_i = d, let M_δ = diag(δ_1, …, δ_g, 1, …, 1) ∈ GL_{2g}(ℚ), K_δ = M_δ GL_{2g}(Ẑ) M_δ^{-1} ∩ GSp_{2g}(𝔸_f), and 𝒜_{g,δ} ⊂ 𝒜_{g,d} the locally closed substack where the kernel of the polarization is étale locally isomorphic to ∏_i (ℤ/δ_i × μ_{δ_i}). Then 𝒜_{g,δ,ℚ} = S_{K_δ,ℚ} and 𝒜_{g,d,ℚ} = ⊔_δ S_{K_δ,ℚ}. With a neat prime-to-p level K^p, 𝒜_{g,d,K^p} is an algebraic space of finite type over ℤ_(p).

**Hypotheses.**

- Any d, including p | d; smoothness over ℤ_(p) holds only for p ∤ d.

**Proof or construction.**

- Define the type loci by the étale-local type of the finite flat kernel of the polarization; local constancy of the type on the generic fibre gives the decomposition.
- Identify 𝒜_{g,δ,ℚ} with the Shimura variety of level K_δ through the lattice M_δℤ^{2g} with its induced form (PELModuli M5.2 in characteristic zero).

**Sources and match.**

- [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.4.19, p. 39–40. Recalls de Jong's moduli stacks A_{g,d}, defines the type loci A_{g,δ} by the étale-local type of the polarization kernel, identifies A_{g,δ,ℚ} with the Shimura variety of level K_δ and decomposes A_{g,d,ℚ}.

**Uses that determine the API.**

- Boxer–Pilloni §3.4.19 and §4.1.1: the auxiliary spaces of the deep-level and Iwahori models.
- Boxer–Pilloni Lemma 3.4.20: the ordinary locus of A_{g,δ} is an Igusa variety (owned by the Igusa Part II).

**Planning API.**

- `siegelTypeLocus` (constructor): 𝒜_{g,δ} ⊂ 𝒜_{g,d} for a divisor chain δ with ∏ δ_i = d.
- `siegelTypeLocus_generic` (equivalence): 𝒜_{g,δ,ℚ} ≅ S_{K_δ,ℚ}.
- `siegelTypeLocus_decomposition` (characterisation): 𝒜_{g,d,ℚ} = ⊔_δ 𝒜_{g,δ,ℚ}.
- `siegelTypeLocus_level` (constructor): With neat prime-to-p level K^p, the algebraic space 𝒜_{g,d,K^p} of finite type over ℤ_(p).
- `siegelTypeLocus_baseChange` (compatibility): The split-kernel type condition and its locally closed substack commute with base change; this does not assert that the type loci exhaust all bad-characteristic polarizations.

**Unit tests.**

- `siegelTypeLocus_principal_test` (degenerate): For d = 1 the only type is δ = (1, …, 1) and 𝒜_{g,1} = 𝒜_g.
- `siegelTypeLocus_paramodular_test` (computation): For g = 2 and d = p the types are δ = (1, p); K_δ is the paramodular group at p.
- `siegelTypeLocus_typeTwo_test` (computation): In characteristic zero, g=2 and d=p² give the two types (1,p²) and (p,p). On the explicitly defined (p,p) type locus the kernel is (ℤ/p×μ_p)². This does not cover every characteristic-p polarization: [p] on a supersingular elliptic curve has local-local kernel E[p] and is outside the analogous split-kernel locus.
- `siegelTypeLocus_notSmooth_test` (non-example): For p | d, 𝒜_{g,d} ⊗ 𝔽_p is not smooth in general (PELModuli M6.4, polarizedStack_not_smooth).

**Acceptance checks.**

- 𝒜_{2,p,ℚ} = S_{K_{(1,p)},ℚ}, the paramodular Shimura variety.
- For p ∤ d the type loci are open and closed in 𝒜_{g,d} ⊗ ℤ_(p).

Direct prerequisites: `PELModuli:M6`; `PELModuli:M5`; `ShimuraCompactificationsPartII:C7/auxiliary-siegel-datum` (C7.1).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C13`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C13.2. Toroidal models of Siegel varieties at arbitrary level at p

`ShimuraCompactificationsPartII:C13/deep-level-toroidal-model` · construction · implementation: unchecked.

Let K = K_pK^p ⊂ GSp_{2g}(𝔸_f) with K^p neat and K_p arbitrary, and choose d_1, …, d_r, types δ_i and conjugation-inclusions K ↪ K_{δ_i}. Define A^tor_{g,d_i} over ℤ_p as the normalized toroidal model of 𝒜_{g,d_i,K^p} (C7/normalized-toroidal-model for its own Zarhin auxiliary datum, or C8/pel-normalized-toroidal for the singleton collection), and, for cone decompositions such that S^tor_{K,ℚ} → ∏_i A^tor_{g,d_i,ℚ} is finite, S^tor_K := the normalization of ∏_i A^tor_{g,d_i} × Spec ℤ_p in S^tor_{K,ℚ_p}. It is normal, proper and flat over ℤ_p with interior S_K (the normalization of ∏ 𝒜_{g,d_i,K^p}), equal to the normalized model of the auxiliary datum obtained by composing with Zarhin's replacement (C7/normalization-transitivity); it carries the stratification, completions and degenerating families of C8 and C10, and its variant over ℤ_p^cycl is C7/cyclotomic-normalized-model.

**Hypotheses.**

- Finiteness of S^tor_{K,ℚ} → ∏ A^tor_{g,d_i,ℚ} for the chosen cone decompositions, supplied by C7/generic-toroidal-finite-map for induced decompositions.

**Proof or construction.**

- A^tor_{g,d} exists as a normalized model, carrying the semi-abelian G extending the universal abelian scheme (C13/semiabelian-extension).
- Normalization along the finite map from S^tor_{K,ℚ_p}; transitivity identifies the result with the normalization of the product of Zarhin good models, so C8 (collections) and C10 (Hodge type) apply.
- Dependence on the auxiliary choices (Boxer–Pilloni Remark 3.4.21) is that of C7/normalization-transitivity; for PEL collections the model depends only on the lattices (Lan16 Corollary 11.7).

**Sources and match.**

- [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.4.19, Remark 3.4.21 and §3.4.23, pp. 39–40. Defines integral models at arbitrary level by normalizing products of the auxiliary moduli and of their toroidal compactifications, and notes the dependence on auxiliary choices.

**Uses that determine the API.**

- Boxer–Pilloni §4: higher Hida theory takes place on S^tor_{K^pK_{p,n}}.
- HigherHidaAndColemanTheory H2, I3: ordinary strata and integral complexes on these models.

**Planning API.**

- `DeepLevelToroidalModel` (constructor): S^tor_K over ℤ_p with its finite map to ∏_i A^tor_{g,d_i}.
- `DeepLevelToroidalModel.interior` (projection): The open dense interior S_K.
- `DeepLevelToroidalModel.normal_proper_flat` (other): S^tor_K is normal, proper and flat over ℤ_p.
- `DeepLevelToroidalModel.strata` (other): The stratification and completions of C10/main-theorem.
- `DeepLevelToroidalModel.cyclotomic` (constructor): The ℤ_p^cycl variant of C7/cyclotomic-normalized-model.
- `DeepLevelToroidalModel.lift` (universal-property): Normal flat ℤ_p test spaces with an auxiliary-product map and a compatible generic toroidal lift map uniquely to this normalization; compare auxiliary choices only by the finite comparison maps of C7.

**Unit tests.**

- `DeepLevelToroidalModel.hyperspecial_test` (compatibility): For K_p ⊂ G(ℤ_p), r = 1, d_1 = 1 and δ_1 = (1, …, 1), S^tor_K is the normalization of the good model A^tor_{g,1} at level K^pG(ℤ_p) in S^tor_{K,ℚ_p}, the model of ShimuraCompactifications C5.19.
- `DeepLevelToroidalModel.trivial_test` (degenerate): For K_p = G(ℤ_p) and the same datum, S^tor_K = A^tor_{g,1}.
- `DeepLevelToroidalModel.noBoundaryComponent_test` (characterisation): No irreducible component of S^tor_K ⊗ 𝔽_p lies in the boundary (C10/stratification).

**Acceptance checks.**

- For K_p = G(ℤ_p) the model is the good Siegel toroidal compactification.
- For g=1, K_p=K₀(p), the normal integral coarse-model comparison of ModularCurvesPartII R13.4a identifies the model with compactified X₀(p); generic agreement alone does not supply that identification.

Direct prerequisites: `ShimuraCompactificationsPartII:C13/polarization-type-loci` (C13.1); `ShimuraCompactificationsPartII:C7/normalized-toroidal-model` (C7.5); `ShimuraCompactificationsPartII:C7/normalization-transitivity` (C7.7); `ShimuraCompactificationsPartII:C8/pel-normalized-toroidal` (C8.3); `ShimuraCompactificationsPartII:C10/main-theorem` (C10.7); `ModularCurvesPartII:R13.4a`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C13`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C13.3. The semi-abelian scheme, its dual and polarization over A^tor_{g,d}

`ShimuraCompactificationsPartII:C13/semiabelian-extension` · theorem · implementation: unchecked.

Over the normalized toroidal model A^tor_{g,d} of 𝒜_{g,d,K^p} over ℤ_p (any d, including p | d) there are semi-abelian schemes G and G^∨ extending the universal abelian scheme and its dual, and a homomorphism λ : G → G^∨ extending the polarization; they are unique up to unique isomorphism, and over the generic fibre ∐_δ S^tor_{K_δ,ℚ_p} they are the universal semi-abelian schemes of the toroidal compactifications.

**Hypotheses.**

- A^tor_{g,d} the normalized model; uniqueness over the normal noetherian base.

**Proof or construction.**

- Existence of G: Lan16 Theorem 11.2 for the singleton collection of the degree-d² lattice (C8/pel-degenerating-families), whose degenerating family of type M_H is a semi-abelian scheme with polarization.
- G^∨: apply the same theorem to the dual lattice, or take the semi-abelian extension of the dual abelian scheme; λ extends uniquely by extension of homomorphisms over normal bases (ShimuraCompactifications C4, hom_extend).

**Sources and match.**

- [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf), Theorem 11.2, p. 56. Extends the tautological polarized abelian schemes of the collection to degenerating families over the normalized toroidal model.
- [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §3.4.19 and §4.1.1, pp. 39–41. Uses A^tor_{g,d} with its semi-abelian scheme and the extension of homomorphisms (Faltings–Chai I.2.7).

**Acceptance checks.**

- Over the interior, λ : G → G^∨ is the given polarization of degree d².
- At a split cusp of A^tor_{1,1}, the family is the semi-abelian extension of the Tate elliptic curve: its boundary fibre is 𝔾_m and its generic fibre is Tate(q). The boundary fibre itself is not an elliptic curve.

Direct prerequisites: `ShimuraCompactificationsPartII:C8/pel-degenerating-families` (C8.6); `ShimuraCompactifications:C4/roadmap/homomorphism-extension`; `ShimuraCompactificationsPartII:C13/polarization-type-loci` (C13.1).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C13`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C13.4. The Iwahori-level normalized model and its isogeny chain

`ShimuraCompactificationsPartII:C13/iwahori-normalized-model` · construction · implementation: unchecked.

Let n ≥ 0 and K_{p,n} ⊂ GSp_{2g}(ℤ_p) the Iwahori subgroup of level p^n (reduction mod p^n in the Borel). Over the generic fibre there is the self-dual chain of isogenies A = A_g → A_{g+1} → ⋯ → A_{2g} → A_1 → ⋯ → A_g = A with total map [p^n], where ker(A_g → A_{g+i}) is totally isotropic in A[p^n], étale locally (ℤ/p^n)^i, and A_{g+i} carries a polarization of degree d_i² with d_0 = 1 and d_i = p^{n(g−i)} (1 ≤ i ≤ g). Define S^tor_{K^pK_{p,n}} as the normalization of ∏_{i=0}^{g} A^tor_{g,d_i} × Spec ℤ_p in S^tor_{K^pK_{p,n},ℚ_p} (C13/deep-level-toroidal-model). Over it, with A_{g+i} the pullback of G from the i-th factor and A_j (1 ≤ j ≤ g − 1) the pullback of G^∨ from the factor of A_{2g−j}, the chain extends uniquely to a chain of homomorphisms of semi-abelian schemes (isogenies on the abelian interior, with quasi-finite flat boundary kernels) with total map [p^n].

**Hypotheses.**

- n ≥ 0, allowing the identity chain for n=0; the printed degrees are corrected as in sourceIssues E65: the polarization of A_{g+i} has degree d_i² = p^{2n(g−i)}.

**Proof or construction.**

- Apply C13/deep-level-toroidal-model to the collection of the g + 1 polarization degrees.
- Over the interior A_j ≅ A_{2g−j}^∨ for 1 ≤ j ≤ g − 1, which justifies the choice of G^∨-factors.
- Each isogeny of the chain extends uniquely over the normal base (ShimuraCompactifications C4, hom_extend; Faltings–Chai I.2.7), and the identity for the composite holds because it holds on a dense open.

**Sources and match.**

- [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §4.1.1, p. 41. Defines the normalization model and extends the chain of homomorphisms; polarization degrees are d_i², not d_i. The n=0 case is a valid identity chain.

**Uses that determine the API.**

- Boxer–Pilloni §§4.1.3–4.1.9: strata S^tor_{F_p,w} and the divisors D_i are defined from the graded pieces Gr_i.
- HigherHidaAndColemanTheory H2/ordinary-strata: the self-dual chain and its graded order-p^n groups.

**Planning API.**

- `IwahoriNormalizedModel` (constructor): S^tor_{K^pK_{p,n}} over ℤ_p with its finite map to ∏_{i=0}^g A^tor_{g,d_i}.
- `IwahoriNormalizedModel.chain` (data): The extended chain of semi-abelian homomorphisms with composite [p^n]; each is an isogeny on the abelian interior, while its boundary kernel need not be finite of the generic order.
- `IwahoriNormalizedModel.flag` (data): The flag 0 ⊂ H_{g+1} ⊂ ⋯ ⊂ H_{2g} ⊂ H_1 ⊂ ⋯ ⊂ H_g = A[p^n] of kernels over the interior.
- `IwahoriNormalizedModel.dual` (relation): Over the interior, A_j ≅ A_{2g−j}^∨ compatibly with the chain.
- `IwahoriNormalizedModel.chain_unique` (extensionality): The extension of each fixed interior chain homomorphism to the semi-abelian families is unique, and identities and the self-dual composition relations persist by generic density. Constant boundary degree is not part of this assertion.

**Unit tests.**

- `IwahoriNormalizedModel.g1_test` (computation): For g = n = 1 both degrees are d_0 = d_1 = 1: the model is the normalization of A^tor_{1,1} × A^tor_{1,1} in X_0(p) along (E, H) ↦ (E, E/H), and the chain is E → E/H → E with composite [p].
- `IwahoriNormalizedModel.degrees_test` (computation): For g = 2, n = 1 the polarization degrees are d_0² = 1, d_1² = p² and d_2² = 1.
- `IwahoriNormalizedModel.n0_test` (degenerate): For n=0 the defining congruence condition is vacuous, K_{p,0}=GSp_{2g}(ℤ_p), all d_i=1, the chain consists of identities and the normalization is the good Siegel model. BP26’s inclusion of n=0 is legitimate; the earlier E64 allegation is rejected.

**Acceptance checks.**

- The composite of the extended chain is [p^n] on all of S^tor.
- For g = 1, n = 1 the model is the compactified X_0(p) with E → E/H → E.

Direct prerequisites: `ShimuraCompactificationsPartII:C13/deep-level-toroidal-model` (C13.2); `ShimuraCompactificationsPartII:C13/semiabelian-extension` (C13.3); `ShimuraCompactifications:C4/roadmap/homomorphism-extension`.

Atlas planet: **Iwahori normalized model**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C13`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C13.5. Graded pieces of the Iwahori chain are quasi-finite flat

`ShimuraCompactificationsPartII:C13/graded-pieces` · theorem · implementation: unchecked.

For 1 ≤ i ≤ 2g let Gr_i be the kernel, over all of S^tor_{K^pK_{p,n}}, of the map of the extended chain whose target is A_i. Over the interior Gr_i = H_i/H_{i−1} in the flag ordering g + 1, …, 2g, 1, …, g (with 0 before H_{g+1}), a finite flat group scheme of order p^n with Gr_{2g−i+1} ≅ Gr_i^D. Over S^tor, each Gr_i is quasi-finite and flat, but in general not finite at the boundary: its order can drop on boundary strata.

**Hypotheses.**

- Same setting; the indexing uses the predecessor in the ordered flag, as corrected in sourceIssues E6. For n=0 the kernels are trivial; nontrivial rank-p extensions below concern n=1.

**Proof or construction.**

- Each map of the chain is an extended isogeny of p-power degree over a normal base, hence quasi-finite flat (ShimuraCompactifications C4.11, isogeny_extend_quasiFiniteFlat).
- Over the interior identify the kernels with the graded pieces of the flag and use the self-duality of the chain for Cartier duality.

**Sources and match.**

- [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §4.1.1, p. 41. Defines the flag of kernels and the graded pieces Gr_i over the interior as finite flat of order p^n with Gr_{2g−i+1} = Gr_i^D.
- [Str15](https://webusers.imj-prg.fr/~benoit.stroh/Laumon.pdf), §2.4.1 and Lemmas 2.4.2–2.4.3, pp. 25–26. Distinguishes the quasi-finite closure quotient K′_i from its separately glued order-p finite flat extension K_i at n=1.

**Acceptance checks.**

- For g = n = 1 at the cusp with H_2 = μ_p, Gr_1 = ker(Tate(q^p) → Tate(q)) has order p off q = 0 and is trivial on q = 0.
- HigherHidaAndColemanTheory owns the divisors D_i. The literal quasi-finite kernel does not alone supply a finite-flat group on which to define an Oort–Tate divisor. At n=1 use the separate rank-p finite extension below; at n>1 record gap/higher-level-graded-extension rather than treating the two objects as identical.

Direct prerequisites: `ShimuraCompactificationsPartII:C13/iwahori-normalized-model` (C13.4); `ShimuraCompactifications:C4/roadmap/extended-isogeny-kernel`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C13`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C13.6. At level n = 1 the model is the toroidal compactification of the Iwahori moduli

`ShimuraCompactificationsPartII:C13/iwahori-level-one` · theorem · implementation: unchecked.

For n = 1 the interior S_{K^pK_{p,1}} is the moduli space of self-dual chains of p-isogenies of principally polarized abelian schemes with K^p-level (the Iwahori lattice-chain moduli), and S^tor_{K^pK_{p,1}} is a toroidal compactification of it over which the universal chain extends: the extended chain of C13/iwahori-normalized-model restricts on the interior to the universal chain.

**Hypotheses.**

- n = 1; the interior identification of the normalization with the lattice-chain moduli (normality of that moduli space) is an input owned by ShimuraVarietiesPartII (recorded as a gap).

**Proof or construction.**

- Given the interior identification, the boundary statement follows from C13/iwahori-normalized-model: by uniqueness of extensions of homomorphisms over the normal base, the extended chain agrees with any extension of the universal chain.

**Sources and match.**

- [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), Remark 4.1.2, p. 41. States that for n = 1 the normalized model is the usual integral model of Iwahori level.

**Acceptance checks.**

- For g = 1 the Iwahori lattice-chain moduli is the moduli of p-isogenies E → E′, the Katz–Mazur Γ_0(p) problem, whose compactification is X_0(p) over ℤ_p.
- The extended chain restricts on the interior to the universal chain.

Direct prerequisites: `ShimuraCompactificationsPartII:C13/iwahori-normalized-model` (C13.4); `ShimuraCompactifications:C4/roadmap/homomorphism-extension`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C13`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C13.7. Finite flat order-p extensions of Iwahori graded groups

`ShimuraCompactificationsPartII:C13/rank-p-finite-extension` · theorem · implementation: unchecked.

Added by `REV-DESIGN-ShimuraCompactificationsPartII`.

For n=1 on the full Iwahori toroidal compactification, each interior graded group K_i of order p has a canonical finite locally free extension K̄_i of order p. It is glued from the literal closure quotient K′_i on its rank-p open U_i and the Cartier dual of K′_{2g+1−i} on the complementary open U_{2g+1−i}. The two opens cover and the Cartier-dual identification on their overlap is part of the construction. In general K̄_i is not the literal quasi-finite kernel K′_i globally. The groups K̄_i and K̄_{2g+1−i} remain Cartier dual.

**Hypotheses.**

- n=1; the normalized interior agrees with the full Iwahori moduli, using gap/iwahori-lattice-chain-moduli. A compatible neat prime-to-p level and toroidal fan are fixed.

**Proof or construction.**

- Use the completed 1-motive charts to read off whether the i-th graded group belongs to the semi-abelian part. This gives Stroh’s open U_i where K′_i is finite of rank p and its complement where the literal fibre is trivial (Lemma 2.4.2).
- The symplectic flag gives U_i∪U_{2g+1−i}=X and a Cartier-dual identification on the overlap. Glue finite flat group schemes by that identification (Lemma 2.4.3); the gluing, rather than normality alone, is the canonicity proof.

**Sources and match.**

- [Str15](https://webusers.imj-prg.fr/~benoit.stroh/Laumon.pdf), §2.4.1, Lemmas 2.4.2–2.4.3 and Remark 2.4.4, pp. 25–26. Constructs the two-open Cartier-dual gluing of finite flat order-p groups and distinguishes it from the literal boundary quotient.

**Uses that determine the API.**

- HigherHidaAndColemanTheory, order-p graded divisors: Supplies the finite flat group required at n=1, without confusing it with the rank-dropping literal kernel.
- ShimuraCompactificationsPartII:C14/klingen-subgroup-extension: Provides the rank-p chart calculation and Cartier-dual gluing; C14 adapts it to the two retained end pieces of the Klingen partial flag.

**Planning API.**

- `IwahoriRankPExtension` (constructor): The finite locally free order-p extension K̄_i with specified identification on the interior.
- `IwahoriRankPExtension.onOpen` (compatibility): On U_i it equals K′_i; on U_{2g+1−i} it equals the Cartier dual of K′_{2g+1−i}, with the prescribed overlap isomorphism.
- `IwahoriRankPExtension.dual` (relation): K̄_{2g+1−i} is the Cartier dual of K̄_i.

**Unit tests.**

- `IwahoriRankPExtension.interior_test` (compatibility): On the interior K̄_i is the finite flat graded group of order p.
- `IwahoriRankPExtension.tate_test` (non-example): At a Tate cusp where the literal quotient is trivial, K̄_i still has order p; identifying the two groups globally fails.
- `IwahoriRankPExtension.dual_test` (computation): In genus one the two extensions are Cartier dual: a μ_p fibre on one side corresponds to ℤ/p on the dual side.

**Acceptance checks.**

- The extension has order p at every geometric point, including points where the literal kernel has order 1.
- No analogous finite extension is asserted for an arbitrary higher-rank graded group; Stroh Remark 2.4.4 gives a monodromy obstruction.

Direct prerequisites: `ShimuraCompactificationsPartII:C13/graded-pieces` (C13.5); `ShimuraCompactificationsPartII:C13/iwahori-level-one` (C13.6); `SchemeAndStackFoundations:SF.1`.

Atlas planet: **Order-p boundary extension**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C13`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

## C14. Genus two at Klingen and paramodular level

Pilloni’s integral genus-two Klingen and paramodular models: the lattice V₁, the p,p²,p chain, 1-motive charts and good integral cocharacter fans (§6.1). The intermediate boundary model has generic relative dimension r(2−r), and its comparison with the explicit modular-curve bases is an input. Compactifications, normality, relative lci and the total-space codimension≥2 bound are conditional on the recorded interior/chart comparison; no unproved general C8 lci transfer is used. Extend the correspondence projections and chain maps as homomorphisms, retaining degree labels only over the abelian interior. Plan the compactified T_{p,2} correspondence, refinement-invariant sheaf cohomology, and minimal compactifications (§§6.2, 7.1, 14.9.2). The determinant map comes from G′→G and descends by the projection formula, using Lan17 Theorem 6.1(2). Distinguish the multiplicative-H formal open from the full inverse image of p-rank≥1. The order-p finite-flat Klingen extension is constructed from the two end pieces of the self-dual partial flag: their finite-flat loci cover by the isotropic cusp-lattice criterion, and their Cartier pairing glues the models. The original interior/chart comparison remains an input.

Layer prerequisites: `ShimuraCompactificationsPartII:C8`; `ShimuraCompactificationsPartII:C10`; `ReductiveGroupsPartII:RG2.3`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`; `ShimuraCompactifications:C3`; `AutomorphicBundles:B3`; `PELModuli:M5`; `ShimuraCompactificationsPartII:C7`; `ModularCurvesPartII:R13.3`; `ModularCurvesPartII:R13.4a`; `ShimuraCompactifications:C4`; `ShimuraCompactifications:C5`; `ShimuraCompactificationsPartII:C13`.

### C14.1. Klingen and paramodular level for GSp_4

`ShimuraCompactificationsPartII:C14/klingen-paramodular-data` · definition · implementation: unchecked.

Let V = ℤ^4 with basis e_1, …, e_4 and the standard symplectic form of Pilloni §5.1, K = K^pGSp_4(ℤ_p) with K^p neat, and V_1 = pe_1ℤ ⊕ e_2ℤ ⊕ e_3ℤ ⊕ e_4ℤ ⊂ V. The paramodular group scheme is GSp′_4 = GSp(V_1, ⟨·,·⟩) over ℤ, and the arithmetic groups are Γ = GSp_4(ℤ_(p))^+, Γ_par = GSp′_4(ℤ_(p))^+ and Γ_Kli(p) = the automorphisms of (V_1 ⊗ ℤ_(p) → V ⊗ ℤ_(p)) up to positive similitude, a common subgroup of Γ and Γ_par. In moduli terms: Y_K parametrizes abelian surfaces with a prime-to-p polarization; Y_par,K abelian surfaces G′ with a polarization of degree p² (up to ℤ_(p)^×) and K^p-level; Y_Kli(p),K pairs (G, H) with H ⊂ G[p] of order p; and p_1(G, H) = G, p_2(G, H) = (G/H^⊥, λ′), λ′ the descent of p²λ. Over Y_Kli(p) there is the chain G → G/H → G/H^⊥ → G with composite [p].

**Hypotheses.**

- p any prime; K^p neat. As lattice collections: Y_par is the singleton {V_1}, Y_Kli(p) the collection {V_1 ⊂ V} (C8/pel-lattice-collection).

**Proof or construction.**

- The groups are stabilizers of the lattices V and V_1 and of the chain V_1 ⊂ V (ReductiveGroupsPartII RG2.3 for the parahoric group schemes).
- The moduli descriptions and the maps p_1, p_2 are Pilloni §§6.1.1–6.1.3; the chain uses H^⊥, the orthogonal of H for the Weil pairing on G[p].

**Sources and match.**

- [Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §§6.1.1–6.1.3, p. 26; §6.1.5.1, p. 27. Defines the smooth Siegel threefold, the Klingen and paramodular moduli spaces with the maps p_1, p_2 and the isogeny chain, the lattice V_1, the paramodular group scheme and the groups Γ, Γ_par and Γ_Kli(p).

**Uses that determine the API.**

- Pilloni Theorem 6.1.5.1: the toroidal compactifications X, X_Kli(p), X_par.
- HigherHidaAndColemanTheory X8/klingen-complex: the Klingen-level model and its height-one tower.

**Planning API.**

- `paramodularLattice` (constructor): V_1 = pe_1ℤ ⊕ e_2ℤ ⊕ e_3ℤ ⊕ e_4ℤ with the restricted form.
- `paramodularGroup` (constructor): GSp′_4 = GSp(V_1) and Γ_par = GSp′_4(ℤ_(p))^+.
- `klingenGroup` (constructor): Γ_Kli(p) = Γ ∩ Γ_par, the stabilizer of the chain V_1 ⊂ V.
- `klingenParamodular_collection` (coercion): The lattice collections {V_1} and {V_1 ⊂ V} of C8/pel-lattice-collection.
- `klingenChain` (data): Over Y_Kli(p), the chain G → G/H → G/H^⊥ → G with composite [p] and p_2(G, H) = G/H^⊥.
- `klingenChain.dual` (relation): The p,p²,p chain is self-dual via the specified principal and degree-p² polarizations; its composite equals [p] and p₂ is the quotient by H^⊥.

**Unit tests.**

- `paramodularLattice_disc_test` (computation): The Gram determinant of the form on V_1 is p² times that on V, so the induced polarization has degree p².
- `klingenGroup_index_test` (computation): The image of Γ_Kli(p) in GSp_4(𝔽_p) is the Klingen parabolic, of index (p⁴ − 1)/(p − 1) = (p + 1)(p² + 1), the number of lines in 𝔽_p^4.
- `paramodularLattice_notSelfDual_test` (non-example): V_1 is not self-dual, so Γ_par is not hyperspecial and Y_par,K is not smooth over ℤ_p.

**Acceptance checks.**

- The chain G → G/H → G/H^⊥ → G has degrees p, p², p with composite [p].
- Γ_Kli(p) = Γ ∩ Γ_par.

Direct prerequisites: `ShimuraCompactificationsPartII:C8/pel-lattice-collection` (C8.1); `ReductiveGroupsPartII:RG2.3`; `PELModuli:M5`; `mathlib:Matrix.symplecticGroup`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C14`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C14.2. Klingen and paramodular boundary charts

`ShimuraCompactificationsPartII:C14/one-motive-charts` · construction · implementation: unchecked.

For an isotropic direct summand W⊂V of rank r∈{0,1,2}, put X=V/(V∩W_ℚ^⊥) and X₁=V₁/(V₁∩W_ℚ^⊥). The boundary 1-motives have abelian part of genus 2−r and toric character lattice X, or X₁ for the paramodular lattice. The normalized towers M→B→Y are C8’s torus torsor over a proper normal intermediate boundary model; generically B is an abelian torsor of relative dimension r(2−r), not 2−r, over a pure base of genus 2−r. No arbitrary-bad-level smooth abelian-scheme torsor is inferred from normalization. The torus character lattice is commensurable with Sym²(X) (respectively Sym²(X₁)); its cocharacter lattice is the dual and has rank r(r+1)/2. For the specific genus-two boundary models the lower-dimensional comparisons are part of C14/normal-lci. A good decomposition is projective, satisfies Pilloni’s stabilizer condition and is smooth in the integral cocharacter lattice for the specified group Γ, Γ_par or Γ_Kli(p).

**Hypotheses.**

- Neat prime-to-p level and the specified lattice collection. A quotient by W^⊥ must intersect W_ℚ^⊥ with the lattice first. The torus character lattice and its dual must not be interchanged.

**Proof or construction.**

- Specialize Lan’s 1-motive boundary charts to the two lattices. The extension parameter for a torus of rank r and an abelian part of dimension 2−r has dimension r(2−r); the symmetric period-pairing torus has character rank r(r+1)/2. Retain the integral character/cocharacter distinction in smoothness tests.
- Import cofinal projective smooth arithmetic refinements from parent C0 (including the arithmetic stabilizer condition). The finite-fan constructions already in AnalyticToricGeometry are not replanned here.

**Sources and match.**

- [Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §§6.1.5.2–6.1.5.3, pp. 27–29. Describes the towers of moduli of 1-motives at spherical, Klingen and paramodular level with their torus torsors and integral structures, and defines good cone decompositions.

**Uses that determine the API.**

- Pilloni Theorem 6.1.5.1(1): strata and completions of the compactifications are given by these charts.
- Pilloni proof of Lemma 10.3.3, p. 61: rank-one Klingen charts have modular-curve bases of level Γ_0(p) in some cases.

**Planning API.**

- `klingenChart` (constructor): The Klingen tower M_{W,γ,Kli(p)} → B_{W,γ,Kli(p)} → Y_{W,γ,Kli(p)} and its torus embeddings for cones σ.
- `paramodularChart` (constructor): The paramodular tower M_{W,γ,par} → B_{W,γ,par} → Y_{W,γ,par} and its torus embeddings.
- `goodConeDecomposition` (structure): The predicate of being good for H ∈ {Γ, Γ_par, Γ_Kli(p)}.
- `goodConeDecomposition_cofinal` (other): Good decompositions are cofinal among H-admissible ones.
- `klingenChart.etaleBaseChange` (compatibility): An étale base change on the boundary base pulls back its torus torsor, integral character/cocharacter lattices, torus embedding and formal completion; the analogous statement holds for paramodularChart.

**Unit tests.**

- `klingenChart_rank_test` (computation): For r=0,1,2, the abelian genera are 2,1,0; the relative dimensions of B over Y are 0,1,0; and the torus ranks are 0,1,3. The generic chart dimensions are 3 in all three cases (total dimension 4 over ℤ_p).
- `paramodularChart_rankOne_test` (computation): For rank W = 1 the paramodular base Y_{W,γ,par} is a modular curve with level away from p; for Klingen charts of certain W it is a modular curve of level Γ_0(p).
- `goodConeDecomposition_smooth_test` (non-example): A cone smooth for X_⋆(T_{W,γ}) need not be smooth for X_⋆(T_{W,γ,par}), since the two lattices differ by index p in Sym²(V/W^⊥)^∨ for suitable W.

**Acceptance checks.**

- For rank W = 2 (the Siegel cusp) the abelian part is trivial and the torus has rank 3.
- The paramodular toric character group is X₁=V₁/(V₁∩W_ℚ^⊥), a rank-r lattice; the boundary parameter torus has character lattice commensurable with Sym²(X₁).

Direct prerequisites: `ShimuraCompactificationsPartII:C14/klingen-paramodular-data` (C14.1); `ShimuraCompactificationsPartII:C8/pel-putative-charts` (C8.4); `ShimuraCompactificationsPartII:C7/induced-cone-decomposition` (C7.3).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C14`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C14.3. Toroidal compactifications at Klingen and paramodular level (Pilloni, Theorem 6.1.5.1)

`ShimuraCompactificationsPartII:C14/klingen-paramodular-compactifications` · theorem · implementation: unchecked.

Let Σ be a good cone decomposition that is Γ_Kli(p)- (resp. Γ_par-) admissible. There is a toroidal compactification X_Kli(p)_{K,Σ} of Y_Kli(p)_K (resp. X_{par,K,Σ} of Y_{par,K}) over ℤ_p, the normalized toroidal model of the corresponding lattice collection, with a stratification indexed by Γ_Kli(p)\Σ (resp. Γ_par\Σ) in which the (σ, γ)-stratum is isomorphic to Z_{W,γ,Kli(p),σ} (resp. Z_{W,γ,par,σ}) and the completion along it is that of M_{W,γ,Kli(p),σ} (resp. M_{W,γ,par,σ}) along the stratum; the boundary (the reduced complement of the interior) is a relative Cartier divisor. Their generic fibres are the characteristic-zero toroidal compactifications at the corresponding levels.

**Hypotheses.**

- Σ good (in particular projective and smooth for the relevant integral structure); strata are listed in the corrected order of sourceIssues E4.
- The identification of the normalized interior with the Klingen/paramodular moduli is conditional on gap/klingen-paramodular-interior; the normalization construction alone does not prove it.

**Proof or construction.**

- Construct the models by normalization (C8/pel-normalized-toroidal) or as Lan17 normalized blow-ups of the normalized minimal models (C8/normalized-blowup-input); Pilloni's Theorem 6.1.5.1 is the special case of Lan17 Theorem 6.1.
- The stratification and completions are C8/pel-strata-completions with the charts of C14/one-motive-charts; the boundary is Cartier by C10/main-theorem.

**Sources and match.**

- [Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Theorem 6.1.5.1(1) and its proof, p. 29. States existence, stratification and completions of the toroidal compactifications at spherical, Klingen and paramodular level for good cone decompositions, as a special case of Lan's Theorem 6.1, with the paramodular case via Zarhin's trick and normalization.

**Acceptance checks.**

- X_Kli(p)_{K,Σ}[1/p] and X_{par,K,Σ}[1/p] are the toroidal compactifications of ShimuraCompactifications C2 at the corresponding levels, base changed to ℚ_p.

Direct prerequisites: `ShimuraCompactificationsPartII:C14/one-motive-charts` (C14.2); `ShimuraCompactificationsPartII:C8/pel-strata-completions` (C8.5); `ShimuraCompactificationsPartII:C8/normalized-blowup-input` (C8.10); `ShimuraCompactificationsPartII:C10/main-theorem` (C10.7).

Atlas planet: **Klingen and paramodular compactifications**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C14`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C14.4. Klingen and paramodular compactifications are normal and lci

`ShimuraCompactificationsPartII:C14/normal-lci` · theorem · implementation: unchecked.

For Σ good and admissible for the relevant group, X_Kli(p)_{K,Σ} and X_{par,K,Σ} are normal, flat and local complete intersections over ℤ_p. Their non-smooth loci are contained in the non-ordinary locus of the special fibre (ordinary defined pointwise by the p-rank of the p-divisible group, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2), including at the boundary, and have codimension at least 2; the non-smooth locus of the open Y_{par,K} is a finite set of closed points of characteristic p.

**Hypotheses.**

- Σ good; the interior properties (Y_par,K and Y_Kli(p),K regular, flat and lci over ℤ_p, the non-smooth locus of Y_par,K finite) are Pilloni's Proposition 6.1.4.1, an input owned by ShimuraVarietiesPartII (recorded as a gap).

**Proof or construction.**

- Normality from the construction by normalization.
- Use the particular boundary charts in Pilloni’s proof of Theorem 6.1.5.1(4), not the unproved general lci transfer of C8. For rank one their pure bases are normal integral modular curves at good or Γ₀(p) level (ModularCurvesPartII R13.3–R13.4a); the boundary models are obtained from these by the indicated smooth torsor charts. Rank-two charts are toric over the finite cusp base. Smooth good cones preserve relative lci. Combine these boundary comparisons with the separate interior local-model input. The particular comparison from the normalized intermediate base to these modular models must be included in gap/klingen-paramodular-interior.
- Non-smooth locus: boundary charts are torus torsors over abelian torsors over modular curves of level away from p (paramodular) or Γ_0(p) (some Klingen cases), smooth over their ordinary loci; combined with the finite non-smooth locus of Y_par this gives codimension ≥ 2 (Pilloni p. 38, corrected: the printed 'codimension 2' holds as 'at least 2', and for Y_par the locus is finite).

**Sources and match.**

- [Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Proposition 6.1.4.1, p. 26; Theorem 6.1.5.1(4), p. 29; §7.1, p. 38. States the interior local-model input and the specific toroidal lci result. The printed codimension claim is used as the lower bound ≥2; the good-level non-smooth locus can be empty.

**Acceptance checks.**

- At the singular point L_0 = ⟨pe_1, e_4⟩ of the paramodular local model the deformation ring is ℤ_p[[X, Y, W, Z]]/(XY − WZ + p), regular and a complete intersection, but not smooth over ℤ_p: its special fibre 𝔽_p[[X, Y, W, Z]]/(XY − WZ) is singular at the origin.
- The codimension bound is in the total integral model; it is a lower bound, with the empty locus allowed. Pointwise p-rank on the special fibre must be used to define the stated opens in the formal model.

Direct prerequisites: `ShimuraCompactificationsPartII:C14/klingen-paramodular-compactifications` (C14.3); `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`; `ModularCurvesPartII:R13.3`; `ModularCurvesPartII:R13.4a`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C14`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C14.5. The projections from Klingen level

`ShimuraCompactificationsPartII:C14/klingen-projections` · theorem · implementation: unchecked.

If Σ is Γ- (resp. Γ_par-) admissible and Σ′ is a Γ_Kli(p)-admissible refinement, then p_1 : Y_Kli(p)_K → Y_K (resp. p_2 : Y_Kli(p)_K → Y_par,K) extends to p_1 : X_Kli(p)_{K,Σ′} → X_{K,Σ} (resp. p_2 : X_Kli(p)_{K,Σ′} → X_{par,K,Σ}). Over X_Kli(p) the interior chain extends to homomorphisms of semi-abelian schemes G → G′ → G whose generic interior degrees are p³ and p with composite [p], where G is pulled back by p_1 and G′ by p_2. The maps p_1 and p_2 are not finite flat: they are not quasi-finite over the p-rank-zero loci, and not finite flat over the boundary.

**Hypotheses.**

- Compatible good cone decompositions; the chain G → G′ is the composite G → G/H → G/H^⊥ of the interior.

**Proof or construction.**

- Extension of p_1, p_2: functoriality of normalized models for subcollections {V} ⊂ {V_1 ⊂ V} and {V_1} ⊂ {V_1 ⊂ V} (C8/pel-functoriality).
- The chain extends by extension of homomorphisms over the normal base; degrees and composite are checked on the interior.
- Failure of quasi-finiteness over the p-rank-zero locus: fibres of p_1 over a supersingular point contain curves (Pilloni §7.1, footnote 9).

**Sources and match.**

- [Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Theorem 6.1.5.1(3), p. 29; §7.1, p. 38 and footnote 9. Extends the projections from Klingen level to toroidal models for compatible refinements, records the chain G → G′ → G of degrees p³ and p over X_Kli(p), and notes that p_1, p_2 are not finite flat.

**Acceptance checks.**

- On the ordinary interior distinguish the étale and multiplicative contributions to the kernel of G→G′ via the extended chain; the degree labels are interior labels and need not be constant finite-flat boundary ranks.

Direct prerequisites: `ShimuraCompactificationsPartII:C14/klingen-paramodular-compactifications` (C14.3); `ShimuraCompactificationsPartII:C8/pel-functoriality` (C8.8); `ShimuraCompactifications:C4/roadmap/homomorphism-extension`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C14`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C14.6. The compactified T_{p,2}-correspondence over ℤ_p

`ShimuraCompactificationsPartII:C14/tp2-correspondence` · construction · implementation: unchecked.

Let C_{p,2} over ℤ_p be the moduli of isogenies p_1^*G → p_2^*G of principally polarized abelian surfaces with K^p-level whose kernel is a totally isotropic (Lagrangian) subgroup of order p² of p_1^*G[p], with the two projections p_1, p_2 to Y_K. For suitable good Σ, Σ′, Σ″ there is a toroidal compactification C_{p,2,Σ″} with p_1 : C_{p,2,Σ″} → X_Σ and p_2 : C_{p,2,Σ″} → X_{Σ′} extending the projections, obtained as the normalized toroidal model of the collection {V, L′} given by the two lattices (Faltings–Chai p. 253). The Hecke operators T_{p,2} and U_{Kli(p),2} built on it are owned by IntegralCoherentHeckeComplexes, SiegelModularFormsModPn and HigherHidaAndColemanTheory. On the p-adic formal locus of p-rank at least one, the two projections can be made finite by suitable good fans, as used by Pilloni on p. 104; this is compatible with a nonfinite literal boundary kernel.

**Hypotheses.**

- Compatible good cone decompositions; the interior moduli of Lagrangian subgroups is an instance of the Siegel parahoric lattice-chain moduli owned by ShimuraVarietiesPartII.

**Proof or construction.**

- The isogeny with Lagrangian kernel of order p² is the data of a second self-dual-up-to-p lattice; the collection of the two lattices gives a normalized model (C8/pel-normalized-toroidal) with its two projections (C8/pel-functoriality).
- Comparison with Faltings–Chai's compactified Hecke correspondences in characteristic zero (ShimuraCompactifications C3, toroidal Hecke correspondences).

**Sources and match.**

- [Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §14.9.2, p. 104. Uses the toroidal compactification of the T_{p,2}-correspondence C_{p,2} over ℤ_p with its projections p_1 and p_2, following Faltings–Chai p. 253.

**Uses that determine the API.**

- Pilloni Lemma 14.9.1(a), p. 104: the integral action of T_{p,2} over the p-rank ≥ 1 locus.
- HigherHidaAndColemanTheory X8: the Klingen correspondence and its normalized operators.

**Planning API.**

- `TP2Correspondence` (constructor): C_{p,2,Σ″} over ℤ_p with p_1 : C → X_Σ and p_2 : C → X_{Σ′}.
- `TP2Correspondence.isogeny` (data): The universal semi-abelian homomorphism extending the interior isogeny. Its boundary kernel need not be finite of the generic order.
- `TP2Correspondence.generic` (compatibility): Its generic fibre is the characteristic-zero toroidal Hecke correspondence for the double coset of diag(1, 1, p, p).
- `TP2Correspondence.degree` (other): Over the interior generic fibre, p_1 is finite étale of degree (p + 1)(p² + 1), the number of Lagrangian subspaces of 𝔽_p^4.
- `TP2Correspondence.refinement` (functoriality): Compatible refinements of the two target fans and the source fan give a proper comparison of normalized correspondence models commuting with both projections and the universal homomorphism. No finiteness at arbitrary boundary fans is inferred.

**Unit tests.**

- `TP2Correspondence.degree_test` (computation): For p = 2 the number of Lagrangian subspaces of 𝔽_2^4 is (2 + 1)(4 + 1) = 15.
- `TP2Correspondence.interior_test` (degenerate): On the interior C_{p,2} is the moduli of Lagrangian subgroups of G[p].
- `TP2Correspondence.notFinite_test` (non-example): At a Tate boundary, the kernel of the extended semi-abelian homomorphism can lose its generic rank and fail to be finite. This alone does not imply that p₁ or p₂ is nonfinite: Pilloni p. 104 proves finiteness over the formal p-rank≥1 base for suitable fans.

**Acceptance checks.**

- Over the interior generic fibre p_1 is finite étale of degree (p + 1)(p² + 1).
- The generic fibre is the characteristic-zero Hecke correspondence for diag(1, 1, p, p).

Direct prerequisites: `ShimuraCompactificationsPartII:C8/pel-functoriality` (C8.8); `ShimuraCompactificationsPartII:C8/pel-normalized-toroidal` (C8.3); `ShimuraCompactifications:C3/roadmap/hecke-span`; `ShimuraCompactificationsPartII:C14/klingen-paramodular-data` (C14.1).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C14`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C14.7. Automorphic sheaves of genus two at Klingen and paramodular level

`ShimuraCompactificationsPartII:C14/genus-two-sheaves` · construction · implementation: unchecked.

On X = X_{K,Σ} let ω_G = e^*Ω¹_{G/X} for the semi-abelian G, of rank 2, and Ω^{(k,r)} = Sym^k ω_G ⊗ det^r ω_G for (k, r) ∈ ℤ_{≥0} × ℤ, with Ω^{(k,r)}(−D) = Ω^{(k,r)} ⊗ I_D for the boundary D. On X_par define them using G′; on X_Kli(p) use p_1^*Ω^{(k,r)} and p_2^*Ω^{(k,r)}. For a refinement π : X_{Σ′} → X_Σ (of any of the three), π^*Ω^{(k,r)} = Ω^{(k,r)}, Rπ_*O = O and Rπ_*I_{D′} = I_D, so RΓ(Ω^{(k,r)}) and RΓ(Ω^{(k,r)}(−D)) do not depend on Σ; only π^*I_D ⊂ I_{D′} holds, and equality is not asserted in general (sourceIssues E3).

**Hypotheses.**

- Good cone decompositions; the derived pushforward statements are those of ShimuraCompactifications C3.6–C3.8 for Lan17 models.

**Proof or construction.**

- Define ω_G by the Hodge bundle of the semi-abelian scheme (ShimuraCompactifications C4.1); pullback compatibility under refinements because G pulls back.
- Cohomology independence by the projection formula with Rπ_*O = O and Rπ_*I_{D′} = I_D (ShimuraCompactifications C3.9 in Lan17's setting).

**Sources and match.**

- [Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §6.2.1, p. 30; Theorem 6.1.5.1(2), p. 29. Defines ω_G and Ω^{(k,r)} on X and X_par and deduces from point 2 of the compactification theorem that their cohomology does not depend on the cone decomposition.

**Uses that determine the API.**

- Pilloni §§7–14: coherent cohomology of Ω^{(k,r)} on X, X_Kli(p), X_par in higher Hida theory.
- SiegelModularFormsModPn, IntegralCoherentHeckeComplexes: integral coherent cohomology of these sheaves.

**Planning API.**

- `genusTwoSheaf` (constructor): Ω^{(k,r)} = Sym^k ω_G ⊗ det^r ω_G on X, X_par (via G′) and X_Kli(p) (via p_1 or p_2).
- `genusTwoSheaf_cusp` (constructor): Ω^{(k,r)}(−D) = Ω^{(k,r)} ⊗ I_D.
- `genusTwoSheaf_refinement` (functoriality): π^*Ω^{(k,r)} ≅ Ω^{(k,r)} for refinements.
- `genusTwoSheaf_cohomology_indep` (other): RΓ(X_Σ, Ω^{(k,r)}) and RΓ(X_Σ, Ω^{(k,r)}(−D)) are independent of Σ.
- `genusTwoSheaf_canonicalExtension` (compatibility): On X[1/p], Ω^{(k,r)} is the canonical extension of AutomorphicBundles B3.
- `genusTwoSheaf.pullback` (functoriality): Each correspondence projection pulls back the specified Hodge-bundle construction with its chosen universal family; a map on coefficient sheaves induced by the chain must state which direction is contravariant on invariant differentials.

**Unit tests.**

- `genusTwoSheaf_rank_test` (computation): Ω^{(k,r)} has rank k + 1.
- `genusTwoSheaf_det_test` (degenerate): Ω^{(0,r)} = det^r ω_G = ω^r.
- `genusTwoSheaf_pullbackIdeal_test` (non-example): For the blow-up of a smooth two-dimensional cone, π^*I_D vanishes to order 2 on the exceptional divisor while I_{D′} vanishes to order 1, so π^*I_D ≠ I_{D′} although Rπ_*I_{D′} = I_D.

**Acceptance checks.**

- RΓ(X_Σ, Ω^{(k,r)}(−D)) is the same for all good Σ.
- On X[1/p], Ω^{(k,r)} is the canonical extension of the automorphic bundle of weight (k, r).

Direct prerequisites: `ShimuraCompactificationsPartII:C14/klingen-paramodular-compactifications` (C14.3); `ShimuraCompactifications:C3/roadmap/coherent-cohomology-invariance`; `ShimuraCompactifications:C3/roadmap/refinement-boundary-ideal`; `ShimuraCompactifications:C4/roadmap/semi-abelian-scheme`; `AutomorphicBundles:B3`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C14`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C14.8. Minimal compactifications at Klingen and paramodular level

`ShimuraCompactificationsPartII:C14/klingen-paramodular-minimal` · construction · implementation: unchecked.

The paramodular and Klingen normalized minimal models are the Proj models of the respective Hodge section rings of C8. Write π:X_Kli(p)→X^⋆_Kli(p). Under neatness, det ω_G and det ω_G′ descend individually as invertible sheaves by Lan17 Theorem 6.1(2); a suitable weighted product is ample, but neither individual line is asserted ample. The differential of the second homomorphism G′→G gives det ω_G→det ω_G′. This map descends to the minimal model. On the p-adic formal special-fibre locus, its nonvanishing defines the locus where the order-p subgroup H is multiplicative. Pilloni denotes this locus X_Kli(p)^≥1; it is in general smaller than the full inverse image of the base p-rank≥1 locus. The proper map X^⋆_Kli(p)→X^⋆ is finite over the formal p-rank≥1 locus of the good minimal base.

**Hypotheses.**

- Good fans and neat prime-to-p level. Distinguish the full p-rank≥1 locus of the good base from Pilloni’s multiplicative-H locus upstairs. Nonvanishing is taken in the formal characteristic-p sense; a p-isogeny is invertible on characteristic-zero differentials.

**Proof or construction.**

- Construct both minimal models as normalized minimal models and identify them with the Proj by C8/pel-normalized-toroidal (Lan16 Proposition 7.11).
- Lan17 Theorem 6.1(2), pp. 22–23 supplies the individual determinant descents. The proper normal contraction has π_*O=O by Stein factorization. The projection formula identifies sections of a descended Hom line with sections of its pullback, so the determinant differential descends. No Hartogs extension across the entire boundary, and no individual ampleness assertion, is needed.
- Pilloni p. 101 proves properness and quasi-finiteness over the good minimal base’s formal p-rank≥1 locus, hence finiteness. The determinant differential detects the smaller multiplicative-H open, as on p. 104; it does not describe every point of the full inverse image.

**Sources and match.**

- [Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §6.2.2, p. 30; pp. 71–72 and 101. Defines the paramodular Proj, uses the Klingen minimal model, proves finiteness over the formal p-rank≥1 base and uses the descended determinant map. The multiplicative-H open of p. 104 is smaller than the full p-rank≥1 inverse image.
- [Lan17](https://www.kwlan.org/articles/cpt-ram-nbl.pdf), Theorem 6.1(2), pp. 22–23. Descends each determinant line, and makes a suitable product ample; individual determinant lines need not be ample.

**Uses that determine the API.**

- HigherHidaAndColemanTheory X8/klingen-control: the two-affine covering of the p-rank ≥ 1 locus of X^⋆_Kli(p).
- Pilloni Lemma 11.3.x and §14.8, pp. 71–72, 100–102: cohomology over the p-rank ≥ 1 locus.

**Planning API.**

- `paramodularMinimal` (constructor): X^⋆_par with π_par and the ample descended ω.
- `klingenMinimal` (constructor): X^⋆_Kli(p) with π_Kli.
- `klingenMinimal_detDescends` (other): The two determinant lines descend without introducing a power under the standing neatness condition. The map induced contravariantly on differentials by G′→G descends by π_*O=O and the projection formula.
- `klingenMinimal_finite_prankOne` (other): X^⋆_Kli(p) ×_{X^⋆} X^{⋆,≥1} → X^{⋆,≥1} is finite.
- `klingenMinimal_prankOneLocus` (characterisation): In the formal special-fibre setting, the nonvanishing locus of det ω_G→det ω_G′ is the multiplicative-H locus. It is not identified with the whole inverse image of the good base’s p-rank≥1 locus.
- `klingenMinimal.descent_unique` (universal-property): A line morphism whose toroidal pullback is the chain-induced determinant map has at most one descended map. Existence uses the descended determinant lines, π_*O=O and the projection formula, rather than a blanket Hartogs extension argument.

**Unit tests.**

- `paramodularMinimal_generic_test` (compatibility): X^⋆_par ⊗_{ℤ_p} ℂ (for an embedding ℚ_p ↪ ℂ) is the Baily–Borel compactification of Y_par,K(ℂ) (ShimuraVarieties V2).
- `klingenMinimal_boundaryDim_test` (computation): The generic or special-fibre boundary has modular curves of dimension 1; their flat closures over ℤ_p have total dimension 2 inside the relative threefold (total dimension 4).
- `klingenMinimal_notFinite_test` (non-example): X^⋆_Kli(p) → X^⋆ is not finite over the p-rank-zero locus: over a superspecial point the fibre contains a curve.

**Acceptance checks.**

- X^⋆_par is normal, projective and flat over ℤ_p with ample ω.
- The map X^⋆_Kli(p) → X^⋆ is finite over the p-rank ≥ 1 locus and not over the supersingular locus.

Direct prerequisites: `ShimuraCompactificationsPartII:C8/pel-normalized-minimal` (C8.2); `ShimuraCompactificationsPartII:C8/pel-normalized-toroidal` (C8.3); `ShimuraCompactificationsPartII:C14/klingen-projections` (C14.5); `ShimuraCompactifications:C5/roadmap/integral-minimal-space`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

Atlas planet: **Klingen minimal compactification**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C14`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C14.9. The Klingen subgroup extends over the boundary (Stroh)

`ShimuraCompactificationsPartII:C14/klingen-subgroup-extension` · theorem · implementation: unchecked.

The universal subgroup H ⊂ G[p] of order p over Y_Kli(p) extends to a finite flat group scheme of order p over X_Kli(p)_{K,Σ}; no closed immersion into the semi-abelian G[p] is asserted at the boundary.

**Hypotheses.**

- Good Σ and the partial-flag boundary 1-motive charts of C14/klingen-paramodular-compactifications. The comparison with the named Klingen interior remains conditional on the existing gap/klingen-paramodular-interior.

**Proof or construction.**

- Retain the two end pieces of the self-dual Klingen chain: the literal quasi-finite order-p kernel K′ extending H, and the literal terminal kernel L′ whose interior is H^D. Stroh’s Lemma 2.4.2 calculation uses only a graded piece and its dual, so apply that same 1-motive chart calculation to these retained end pieces; a full intermediate flag is unnecessary.
- Define U as the rank-p finite-flat locus of K′ and V as that of L′. On a cusp label write D for the line of the covariant mod-p Tate flag and W̄ for its toric weight subspace, the isotropic reduction of the saturated boundary lattice. Dualize the lattice convention if using contravariant cohomology. The first-end criterion is D⊂W̄^⊥; the last-end criterion is D⊄W̄. These are the end-jump criteria in Stroh Lemma 2.4.2. They cover every cusp label: if D is not contained in W̄^⊥, then D is not contained in W̄, since W̄⊂W̄^⊥. The interior belongs to both opens.
- On U∩V the polarized 1-motive pairing identifies K′ with (L′)^D. This is obtained from the Cartier pairing on the finite semi-abelian graded pieces in the chart, as in Stroh Lemma 2.4.3, rather than by inferring uniqueness from normality. Glue K′ on U with (L′)^D on V. The chart identifications are functorial in the partial flag and satisfy the overlap cocycle, so the groups and pairings descend. The resulting group is finite locally free of order p and restricts to H in the interior.

**Sources and match.**

- [Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), footnote 27, p. 105. Cites Stroh, Astérisque 370, Lemma 2.4.3, for the extension of the universal order-p subgroup over X_Kli(p) to a finite flat group scheme at the boundary.
- [Str15](https://webusers.imj-prg.fr/~benoit.stroh/Laumon.pdf), §2.4.1, Lemmas 2.4.2–2.4.3 and Remark 2.4.4, pp. 25–26. The rank-p locus and Cartier-dual gluing use only one graded piece and its complementary dual. For the Klingen partial flag these are the first and last pieces; the explicit end-jump calculation above supplies the adaptation rather than an unproved normality argument.

**Acceptance checks.**

- Over the interior the extension is H ⊂ G[p].
- The extended group has order p in every fibre, including at the boundary.
- At a cusp with D⊂W̄, use K′ on U; if D⊄W̄^⊥, use (L′)^D on V. When D⊂W̄^⊥ but D⊄W̄, both models exist and their polarized Cartier pairing is the gluing identification. These three cases test the partial-flag covering argument.
- In genus two at p=2, with a rank-one toric boundary subspace, the 15 flag lines split into 1 toric line, 6 other lines in W̄^⊥ and 8 outside W̄^⊥. The two finite-flat loci have 7 and 14 line types, with 6 in their overlap, covering all 15.

Direct prerequisites: `ShimuraCompactificationsPartII:C14/klingen-paramodular-compactifications` (C14.3); `ShimuraCompactificationsPartII:C14/klingen-projections` (C14.5); `ShimuraCompactifications:C4/roadmap/extended-isogeny-kernel`; `ShimuraCompactificationsPartII:C13/rank-p-finite-extension` (C13.7); `ShimuraCompactificationsPartII:C14/one-motive-charts` (C14.2).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C14`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

## C15. Orthogonal Shimura varieties at the boundary

The GSpin Shimura datum of a quadratic lattice of signature (n, 2) with its Kuga–Satake embedding, p-integral at odd p when the lattice is self-dual at p, with the positivity condition on the Clifford symplectic form; the cusps of its minimal compactification, zero-dimensional for isotropic lines and one-dimensional for isotropic planes, with flat stratification; uniqueness of cone decompositions over one-dimensional cusps, the description of their preimages as finite quotients of ℰ ⊗ Λ-torsors over modular curves (Λ = I^⊥/I) and the unique extension of prime-to-p Hecke correspondences over the complement of the zero-dimensional cusps; the zero-dimensional cusps with a chosen component of their negative-norm Lorentzian cones and invariant power-series coordinates (Maulik–Shankar–Tang §§8.1–8.5).

Layer prerequisites: `ShimuraCompactificationsPartII:C11`; `ShimuraCompactificationsPartII:C12`; `ShimuraData:D4`; `ShimuraVarieties:V2`; `ShimuraCompactificationsPartII:C10`.

### C15.1. The GSpin Shimura datum and its Kuga–Satake embedding

`ShimuraCompactificationsPartII:C15/gspin-datum` · definition · implementation: unchecked.

Let (L, Q) be a quadratic ℤ-lattice of signature (n, 2), n ≥ 1, V = L ⊗ ℚ with bilinear form [x, y] = Q(x + y) − Q(x) − Q(y), C(V) its Clifford algebra and G = GSpin(V) ⊂ C^+(V)^× the general spin group, with spinor similitude ν. Let X be the space of oriented negative definite planes in V_ℝ, a G(ℝ)-conjugacy class of homomorphisms h : 𝕊 → G_ℝ. Then (G, X) is a Shimura datum of Hodge type of dimension n with reflex field ℚ, and the action of G on C(V) by left multiplication with a suitable symplectic form ψ_δ(x, y) = tr(x δ y^*) (δ ∈ C^+(V)^× with δ^* = −δ) defines an embedding of Shimura data (G, X) ↪ (GSp(C(V), ψ_δ), S^±) (the Kuga–Satake embedding). For odd p, if L is self-dual at p, G has a reductive model GSpin(L_{ℤ_(p)}) and the embedding is p-integral after Zarhin's replacement.

**Hypotheses.**

- Signature (n, 2) with n ≥ 1; for n ≥ 6 the datum is not of PEL type.
- For the integral target assume p>2; the MST22 application assumes p≥5. No p=2 integral extension is claimed without the separate small-prime input.
- The trace form uses a suitable anti-invariant invertible δ compatible with the Hodge polarization; δ*=-δ alone is not a positivity criterion for every δ.

**Proof or construction.**

- GSpin(V) is the subgroup of C^+(V)^× of elements g with g V g^{-1} = V; the spinor similitude is ν(g) = g g^*.
- Each oriented negative plane spanned by an oriented orthonormal basis e, f gives h with h(i) = e f; Deligne's axioms hold (MP Introduction, Example; Kisin).

**Sources and match.**

- [MP19](https://arxiv.org/pdf/1211.1731v6), Introduction, Example, p. 2. Introduces the GSpin Shimura datum attached to a quadratic space of signature (n, 2) and its Kuga–Satake embedding into a Siegel datum, of Hodge type but not PEL for n ≥ 6.
- [MST22](https://math.berkeley.edu/~ytang/GSpincharp.pdf), §§2.1–2.2, p. 6; §8.1, p. 37. Works with a quadratic lattice self-dual at p and hyperspecial level, using the canonical integral model and its compactifications.

**Uses that determine the API.**

- Maulik–Shankar–Tang §8: Hecke orbits on GSpin Shimura varieties are studied through their compactifications.
- orthogonal integral models of ShimuraVarietiesPartII: the Kuga–Satake route imports this datum.

**Planning API.**

- `GSpinDatum` (constructor): (GSpin(V), X) for a quadratic space of signature (n, 2).
- `GSpinDatum.kugaSatake` (data): The embedding of Shimura data into (GSp(C(V), ψ_δ), S^±).
- `GSpinDatum.integral` (data): For p>2 and L self-dual at p, the reductive integral GSpin model and p-integral Kuga–Satake embedding. The p=2 case requires additional input.
- `GSpinDatum.dim` (other): dim X = n.
- `GSpinDatum.spinGroup` (compatibility): On ℚ-points, the kernel of ν on GSpin(V)(ℚ) is Mathlib's spinGroup of (V, Q), the even Lipschitz elements x with x^* x = 1.
- `GSpinDatum.similitude` (structure): The Kuga–Satake form satisfies ψ_δ(gx,gy)=ν(g)ψ_δ(x,y); the spin subgroup is the kernel of ν. Its Hodge positivity requires the specified choice of δ, beyond δ*=-δ alone.

**Unit tests.**

- `GSpinDatum.n1_test` (computation): For n = 1 the GSpin Shimura varieties are Shimura curves or modular curves (GSpin of a ternary space of signature (1, 2) is isogenous to GL_2 or an inner form).
- `GSpinDatum.n2_test` (computation): For n = 2 the GSpin varieties are Hilbert modular surfaces or products of modular curves, or quaternionic analogues.
- `GSpinDatum.n3_test` (compatibility): For n = 3 and L split, GSpin(V) ≅ GSp_4 and the Shimura variety is the Siegel threefold.
- `GSpinDatum.definite_test` (non-example): For signature (n,0), the space of oriented negative planes is empty, so this particular orthogonal Shimura construction is unavailable. This does not assert that a definite orthogonal group admits no other Shimura datum.

**Acceptance checks.**

- For n = 3 and L split the datum is the Siegel datum of genus two.
- For odd p and self-dual L at p, the Kuga–Satake embedding can be made p-integral after Zarhin replacement; use p≥5 for the MST22 application.

Direct prerequisites: `mathlib:CliffordAlgebra`; `mathlib:spinGroup`; `mathlib:QuadraticForm`; `ShimuraData:D4`; `ShimuraCompactificationsPartII:C11/p-integral-embedding` (C11.1).

Atlas planet: **GSpin Shimura datum**.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C15`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C15.2. Cusps of GSpin minimal compactifications

`ShimuraCompactificationsPartII:C15/gspin-cusps` · theorem · implementation: unchecked.

For the GSpin datum with L self-dual at p and hyperspecial level, the boundary components of 𝒮^BB = 𝒮^min_K (C12/minimal-compactification) are 0- or 1-dimensional: the admissible parabolics are the stabilizers of isotropic lines (zero-dimensional cusps, P with abelian unipotent radical U = W of dimension n) and of isotropic planes I ⊂ L of rank 2 (one-dimensional cusps, U a Heisenberg group with one-dimensional centre W = ∧²I and pure part a modular curve). For a one-dimensional cusp Υ with isotropic plane I set Λ = I^⊥/I, a definite lattice of rank n − 2. The stratification of 𝒮^BB by these cusps is flat over ℤ_(p).

**Hypotheses.**

- (L, Q) self-dual at p, hyperspecial level; real rank of SO(n, 2) is min(n,2), so isotropic subspaces have dimension ≤ 2.
- Integral scope is p>2 as in C15/gspin-datum; MST22 assumes p≥5.

**Proof or construction.**

- In characteristic zero, rational boundary components correspond to isotropic subspaces of V (Bruinier–Zemel §§3.2–3.3; Zemel §4): lines give points and planes give modular curves.
- Integrally apply C12/minimal-compactification: the strata are quotients of integral models of the boundary pure Shimura varieties, flat over ℤ_(p).

**Sources and match.**

- [MST22](https://math.berkeley.edu/~ytang/GSpincharp.pdf), §8.1, p. 37. Records that by Madapusi Pera's Theorem 3 the GSpin integral model has a projective normal minimal compactification with flat stratification whose cusps are zero- or one-dimensional, following Bruinier–Zemel and Zemel.
- [BZ21](https://arxiv.org/pdf/1912.11825), §§3.2–3.3, pp. 15–24; in particular §3.3 and Lemma 3.18. The line/plane boundary description is also read through MST22 §8.1; the plane-cusp part of BZ21 §3.3 was read directly. The line-cusp computation is spelled out in C15/gspin-zero-dimensional-cusps.

**Acceptance checks.**

- For n = 1 (modular or Shimura curves) all cusps are zero-dimensional.
- For n ≥ 3 and L isotropic of Witt index 2, both kinds of cusps occur.

Direct prerequisites: `ShimuraCompactificationsPartII:C15/gspin-datum` (C15.1); `ShimuraCompactificationsPartII:C12/minimal-compactification` (C12.4); `ShimuraVarieties:V2`.

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C15`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C15.3. Fibres over one-dimensional cusps and canonical boundary strata

`ShimuraCompactificationsPartII:C15/gspin-one-dimensional-cusps` · theorem · implementation: unchecked.

Let Υ be a one-dimensional cusp of 𝒮^BB with isotropic plane I and Λ = I^⊥/I. (1) The cone decomposition at Υ is unique (the cone is a ray, W being one-dimensional), so the boundary strata of 𝒮^tor over Υ are canonical. (2) Up to a quotient by a finite group, π^{-1}(Υ) ⊂ 𝒮^tor is a torsor under the abelian scheme ℰ ⊗_ℤ Λ over the modular curve Υ, ℰ the universal elliptic curve. (3) Prime-to-p Hecke correspondences of G(𝔸_f^p) extend uniquely to π^{-1}(𝒮^BB ∖ {zero-dimensional cusps}), with the explicit description on formal completions of C10/functoriality.

**Hypotheses.**

- Odd p, hyperspecial level and L self-dual at p; after a suitable finite cover the modular base has a universal elliptic curve, and the general boundary description retains the finite arithmetic quotient and translation cocycle.

**Proof or construction.**

- (1): the cone of a one-dimensional cusp lies in the one-dimensional space W(ℝ), so every admissible decomposition restricts to the ray.
- Use Zemel Theorem 4.5 and the subsequent discussion, pp. 29–31: after finite cover the boundary is an E⊗Λ torsor; the arithmetic quotient can include translations, so there need not be a canonical zero section. BZ21 Lemma 3.18 and Proposition 3.19 give the simpler description under Hypothesis 3.14. Integrally use C10’s abelian-torsor extension at hyperspecial level and descend the finite arithmetic action.
- (3): since the cones over Υ are forced, the compatibility hypothesis of C10/functoriality holds for every Hecke translate on this open part.

**Sources and match.**

- [MST22](https://math.berkeley.edu/~ytang/GSpincharp.pdf), §§8.4–8.5, p. 39. Uses the uniqueness of the cone decomposition at one-dimensional cusps to extend Hecke correspondences over the preimage of the complement of the zero-dimensional cusps, and describes π^{-1}(Υ) as a finite quotient of an ℰ ⊗ Λ-torsor over the modular curve, via Madapusi Pera Theorem 4.1.5.
- [Zem20](https://arxiv.org/pdf/1902.08264), §4, Proposition 4.3, Theorem 4.5 and following discussion, pp. 29–31. Read directly: gives the torsor/translation structure over a one-dimensional cusp; a vector-bundle or product presentation with a canonical zero section is not the general statement.
- [BZ21](https://arxiv.org/pdf/1912.11825), Hypothesis 3.14, Lemma 3.18 and Proposition 3.19, pp. 21–24. Supplies the simpler plane-cusp description under its additional arithmetic hypothesis.

**Acceptance checks.**

- For n = 2 and L split of signature (2, 2) (products of modular curves), Λ = 0 and π^{-1}(Υ) is finite over the modular curve.

Direct prerequisites: `ShimuraCompactificationsPartII:C15/gspin-cusps` (C15.2); `ShimuraCompactificationsPartII:C10/abelian-torsor-extension` (C10.3); `ShimuraCompactificationsPartII:C10/functoriality` (C10.9); `ShimuraCompactificationsPartII:C11/smooth-toroidal` (C11.2).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C15`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

### C15.4. Zero-dimensional cusps of GSpin varieties

`ShimuraCompactificationsPartII:C15/gspin-zero-dimensional-cusps` · theorem · implementation: unchecked.

At a zero-dimensional cusp attached to an isotropic line ℓ ⊂ L, the unipotent radical U_P is abelian and equal to its centre W ≅ ℓ ⊗ ℓ^⊥/ℓ (of dimension n), the cone H ⊂ W(ℝ) is a component of the negative-norm (timelike) cone Q<0 in the Lorentzian space ℓ^⊥/ℓ ⊗ ℝ of signature (n − 1, 1), self-adjoint for the induced form, and the complete local ring of 𝒮^BB_{K_n,k} at the cusp is k[[q^λ]]^{Δ_{K_n}}_{λ≥0} with the action of 𝔹_ℓ of C12/zero-dimensional-cusp-coordinates.

**Hypotheses.**

- Odd p and hyperspecial level; write I for the isotropic line and ℓ₀≠p for the Hecke prime to avoid using ℓ for both. Fix the cone component compatible with the oriented negative-plane domain.

**Proof or construction.**

- For an isotropic line I, the unipotent radical is Hom(I^⊥/I,I), equivalently I⊗(I^⊥/I) via the nondegenerate quadratic form. Eichler transformations identify this vector group with U=W, of dimension n.
- The quotient quadratic space has signature (n−1,1); its chosen negative-norm component is convex and supplies the self-adjoint cusp cone. It is torus-only (U=W), so C12’s corrected scalar Fourier-coordinate formula applies.

**Sources and match.**

- [MST22](https://math.berkeley.edu/~ytang/GSpincharp.pdf), §8.2, pp. 37–38. Works at a zero-dimensional cusp of the GSpin variety, whose admissible parabolic stabilizes an isotropic line, with lattice B_{K_n} in W(ℚ), the open self-adjoint cone and the invariant power series description of the complete local ring.

**Acceptance checks.**

- For n=3, identify the quotient with Sym²(ℝ²) and Q=-det. One negative-norm component is the positive-definite binary forms, matching the genus-two Siegel cusp. The set Q>0 in signature (2,1) is not that cone.
- U_P is abelian of dimension n at a zero-dimensional cusp.

Direct prerequisites: `ShimuraCompactificationsPartII:C15/gspin-cusps` (C15.2); `ShimuraCompactificationsPartII:C12/zero-dimensional-cusp-coordinates` (C12.7).

Proposed library placement: `TauCeti/Geometry/Shimura/Compactification/C15`; namespace `TauCetiRoadmap.ShimuraCompactificationsPartII`. These are proposed locations, not claims that the module exists.

## Exact gaps

### Kisin's smoothness of integral models of Hodge type at hyperspecial level

`ShimuraCompactificationsPartII/gap/kisin-smoothness`

For a p-integral Hodge embedding (C11/p-integral-embedding) with p > 2 (or p = 2 under Kim–Madapusi Pera), the normalization 𝒮_K of 𝒜_{K‡} ⊗ O_{E,(v)} in Sh_K is smooth over O_{E,(v)}, its complete local rings are quotients of Siegel ones cut out by deformations preserving crystalline tensors, the de Rham tensors s_{α,dR} extend over 𝒮_K with P_dR a G_{ℤ_(p)}-torsor, and 𝒮_K satisfies the extension property for regular formally smooth schemes (Kisin, J. Amer. Math. Soc. 23 (2010), Theorem 2.3.5, Propositions 2.3.8–2.3.9; Madapusi Pera Theorem 4.3.3). Owner: the pending design ShimuraVarietiesPartII (issue #3356, integral models and reduction), not yet planned; this roadmap uses the statement as an input and does not plan it.

Needed by `ShimuraCompactificationsPartII:C11/smooth-toroidal` (C11.2); `ShimuraCompactificationsPartII:C11/canonical-boundary-models` (C11.3); `ShimuraCompactificationsPartII:C11/fkw-good-reduction` (C11.5); `ShimuraCompactificationsPartII:C11/canonical-minimal` (C11.6); `ShimuraCompactificationsPartII:C11/de-rham-torsors` (C11.4).

### Local structure of the Klingen and paramodular moduli over ℤ_p

`ShimuraCompactificationsPartII/gap/klingen-paramodular-interior`

Y_par,K and Y_Kli(p),K are regular, flat local complete intersections over ℤ_p, the non-smooth locus of Y_par,K is a finite set of closed points of characteristic p, and these moduli spaces are normal, hence equal to the normalization of the auxiliary models in their generic fibres (Pilloni Proposition 6.1.4.1, from the local models of Yu and of de Jong, with deformation ring ℤ_p[[X, Y, W, Z]]/(XY − WZ + p) at the paramodular singular point). Owner: ShimuraVarietiesPartII (interior models and local models), not yet planned. Also supply the identification of the intermediate normalized rank-one boundary bases in Lan17 Theorem 6.1(3) with the explicit elliptic/modular bases used by Pilloni at p. 29; the lci conclusion is conditional on this chart comparison, not on the unproved general C8 lci transfer.

Needed by `ShimuraCompactificationsPartII:C14/klingen-paramodular-compactifications` (C14.3); `ShimuraCompactificationsPartII:C14/normal-lci` (C14.4).

### Normality of Iwahori and Lagrangian lattice-chain moduli

`ShimuraCompactificationsPartII/gap/iwahori-lattice-chain-moduli`

For n = 1 the moduli of self-dual chains of p-isogenies of principally polarized abelian schemes (Iwahori level), and the moduli of Lagrangian subgroups of G[p], are normal and flat over ℤ_p, so that they coincide with the interiors of the normalized models (Boxer–Pilloni Remark 4.1.2, interior form; Görtz's flatness of symplectic local models). Owner: ShimuraVarietiesPartII (parahoric lattice-chain moduli), not yet planned.

Needed by `ShimuraCompactificationsPartII:C13/iwahori-level-one` (C13.6); `ShimuraCompactificationsPartII:C14/tp2-correspondence` (C14.6).

### Quasi-finiteness of the relative Zarhin moduli map at every polarization degree

`ShimuraCompactificationsPartII/gap/zarhin-finiteness-ampleness`

Lan16 Lemma 4.5, pp. 19–20 uses ampleness of the Hodge determinant on finite étale prime-to-p marked covers of the degree-d² polarization stack, also when p divides d, to prove quasi-finiteness. The cited AbelianSchemesAndArithmeticModuli:A6 only supplies finiteness of polarized automorphism groups and does not imply this. Supply the all-degree ampleness input from its owner PELModuli:M6 (or the precise earlier Hodge-ampleness theorem that M6 imports), then give the proper-plus-quasi-finite argument. Do not infer a finite fibre from finite automorphism groups.

Needed by `ShimuraCompactificationsPartII:C7/zarhin-self-dual-replacement` (C7.2).

### Relative lci transfer from the normalized PEL interior to its toroidal boundary

`ShimuraCompactificationsPartII/gap/pel-lci-transfer`

The listed fibre properties and smooth-fan regularity follow from Lan16 Propositions 14.1–14.2. The additional relative-lci implication needs a chart-level argument carrying lci from the punctured completed interior to the whole open torus torsor and its base. Stacks 069P supplies smooth descent but does not fill that step. Owner: this roadmap C8, with local-ring descent imported from SchemeAndStackFoundations:SF.0. C14 must use its explicit modular-base argument separately.

Needed by `ShimuraCompactificationsPartII:C8/pel-local-properties` (C8.9).

### Finite-flat objects for higher-level graded divisors

`ShimuraCompactificationsPartII/gap/higher-level-graded-extension`

At n=1 Stroh Lemma 2.4.3 gives a separate abstract order-p finite-flat extension, now planned in C13/rank-p-finite-extension. At n>1 the literal quasi-finite kernel need not be finite; a finite-flat object or an alternative construction of the divisors used in BP26 §4.1.8 has not been justified. Stroh Remark 2.4.4 warns that higher-rank flag groups need not extend finitely. Owner: HigherHidaAndColemanTheory for the divisors, requesting the precise finite-group input here if it exists; this packet exports no unsupported finite-flat graded group.

Needed by `ShimuraCompactificationsPartII:C13/graded-pieces` (C13.5).

## Supplier requests

- **`AbelianSchemesAndArithmeticModuli:A4`**: Degree-one realizations of abelian schemes: H_1^dR with Hodge filtration, Tate modules, the Dieudonné crystal of A[p^∞] and Grothendieck–Messing, functorial and compatible with base change; used for the abelian part of 1-motive realizations and the good-reduction case of the log Dieudonné crystal. Needed by `ShimuraCompactificationsPartII:C9/log-dieudonne-crystal` (C9.4); `ShimuraCompactificationsPartII:C9/one-motive-realizations` (C9.1).
- **`AbelianSchemesAndArithmeticModuli:A6`**: Finiteness of polarized automorphism groups (A6.18) and the Hom-group API, used for quasi-finiteness of Zarhin's map on moduli. Needed by `ShimuraCompactificationsPartII:C7/zarhin-self-dual-replacement` (C7.2).
- **`AlgebraicModuliForArithmeticGeometry:R09.6`**: Artin approximation for henselian noetherian local G-rings (Approximation.HasArtinApproximation), used to pass from formal completions along strata to étale neighbourhoods. Needed by `ShimuraCompactificationsPartII:C10/main-theorem` (C10.7).
- **`AutomorphicBundles:B1`**: Canonical principal bundles with their de Rham tensors on Hodge-type Shimura varieties over the reflex field, used to identify the de Rham G-torsor over the generic fibre. Needed by `ShimuraCompactificationsPartII:C11/de-rham-torsors` (C11.4).
- **`AutomorphicBundles:B3`**: Canonical and subcanonical extensions of automorphic bundles to toroidal compactifications in characteristic zero, with which the integral H_dR(Σ) and Ω^(k,r) are compared. Needed by `ShimuraCompactificationsPartII:C11/de-rham-torsors` (C11.4); `ShimuraCompactificationsPartII:C14/genus-two-sheaves` (C14.7).
- **`CohomologyComparisons:CP.4`**: The semistable comparison isomorphism B_st ⊗ H^i_ét ≅ B_st ⊗ D_st for proper semistable models, compatible with φ, N, Galois and filtration; compared with the abelian-variety comparison built here from the log Dieudonné crystal when a semistable model exists. Needed by `ShimuraCompactificationsPartII:C9/semistable-comparison-abelian` (C9.5).
- **`CrystallineCohomology:CR.5`**: Log structures, fine saturated charts, the log crystalline site and log crystals with logarithmic connections, used as the site of the log Dieudonné crystal of a degenerating abelian scheme. Needed by `ShimuraCompactificationsPartII:C9/log-dieudonne-crystal` (C9.4).
- **`CrystallineCohomology:CR.6`**: Hyodo–Kato complexes, monodromy N with Nφ = pφN, and the Hyodo–Kato isomorphism after a choice of uniformizer, in the convention used by the abelian-variety semistable comparison. Needed by `ShimuraCompactificationsPartII:C9/semistable-comparison-abelian` (C9.5).
- **`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`**: Pointwise p-rank of a p-divisible group over a perfect field. C14 defines the resulting p-adic formal opens itself; the multiplicative-H open is smaller than the full inverse image of the p-rank≥1 locus. Needed by `ShimuraCompactificationsPartII:C14/klingen-paramodular-minimal` (C14.8); `ShimuraCompactificationsPartII:C14/normal-lci` (C14.4).
- **`ModularCurvesPartII:R13.3`**: Formal Tate charts and completed cusp rings for integral Γ_0(p) modular curves, including the rank-one Klingen/paramodular boundary bases. R12.3 is a characteristic-zero compactification and does not supply this. Needed by `ShimuraCompactificationsPartII:C14/normal-lci` (C14.4).
- **`NeronModelsAndSemistableAbelianVarieties:R11.1`**: Weil extension over a discrete valuation base, as in R11.1 §1.8. The relative smooth-base extension step in MP19 §4.2.7 is proved there from smoothness of the source; the DVR theorem alone is not cited as the general-base theorem. Needed by `ShimuraCompactificationsPartII:C10/abelian-torsor-extension` (C10.3).
- **`NeronModelsAndSemistableAbelianVarieties:R11.3`**: Raynaud extension and rigid uniformization of abelian varieties with semi-abelian reduction over complete discrete valuation rings. Needed by `ShimuraCompactificationsPartII:C10/etale-rationality` (C10.13); `ShimuraCompactificationsPartII:C9/semistable-comparison-abelian` (C9.5).
- **`NeronModelsAndSemistableAbelianVarieties:R11.5`**: Néron–Ogg–Shafarevich and good reduction of isogeny factors, used for properness of Zarhin's map on moduli. Needed by `ShimuraCompactificationsPartII:C7/zarhin-self-dual-replacement` (C7.2).
- **`PELModuli:M1`**: PEL moduli problems M_H at arbitrary level with their characteristic-zero quasi-isogeny descriptions and functoriality. Needed by `ShimuraCompactificationsPartII:C8/pel-lattice-collection` (C8.1).
- **`PELModuli:M2`**: Representability and smoothness of PEL moduli at good primes, giving the auxiliary good-reduction moduli problems. Needed by `ShimuraCompactificationsPartII:C8/pel-lattice-collection` (C8.1).
- **`PELModuli:M5`**: Siegel moduli A_{g,D,n} of every genus and polarization type and their generic-fibre comparison with Shimura varieties. Needed by `ShimuraCompactificationsPartII:C13/polarization-type-loci` (C13.1); `ShimuraCompactificationsPartII:C14/klingen-paramodular-data` (C14.1); `ShimuraCompactificationsPartII:C7/auxiliary-siegel-datum` (C7.1).
- **`PELModuli:M6`**: The stack 𝔄_{g,d} of abelian schemes with a polarization of degree d², of finite type over ℤ including characteristics dividing d (M6.4). Needed by `ShimuraCompactificationsPartII:C13/polarization-type-loci` (C13.1); `ShimuraCompactificationsPartII:C7/zarhin-self-dual-replacement` (C7.2).
- **`PadicDifferentialEquationsAndRigidCohomology:RD.5`**: Relative Zarhin's trick (§RD.5.116): (A × A^∨)^4 carries a principal polarization built from a given one, functorially over a base. Needed by `ShimuraCompactificationsPartII:C7/zarhin-self-dual-replacement` (C7.2).
- **`PadicHodgeTheory:R06.5`**: Applications of the geometric comparison theorems to abelian varieties: admissibility and recovery of Hodge filtrations and weights, used to state the semistable comparison for abelian varieties in the period-ring conventions of the atlas. Needed by `ShimuraCompactificationsPartII:C9/semistable-comparison-abelian` (C9.5).
- **`ReductiveGroupsPartII:RG2.1`**: Steinberg's theorem over the completed maximal unramified extension (RG2.1.1, steinberg-quasi-split): H^1(K_0, H) = 1 for connected linear H when char K_0 = 0, used to trivialize the torsor of tensor-preserving isomorphisms. Needed by `ShimuraCompactificationsPartII:C9/canonical-tate-tensors` (C9.7).
- **`ReductiveGroupsPartII:RG2.3`**: Parahoric and congruence group schemes (paramodular and Klingen groups, hyperspecial models), used for the paramodular group scheme GSp(V_1) and reductive models of Hodge-type groups. Needed by `ShimuraCompactificationsPartII:C11/p-integral-embedding` (C11.1); `ShimuraCompactificationsPartII:C14/klingen-paramodular-data` (C14.1).
- **`SchemeAndStackFoundations:SF.0`**: Nagata and excellent schemes, normalization and its finiteness over excellent bases, Zariski's main theorem, relative Proj and properties of local rings along smooth maps and completion. Needed by `ShimuraCompactificationsPartII:C12/minimal-compactification` (C12.4); `ShimuraCompactificationsPartII:C7/normalized-toroidal-model` (C7.5); `ShimuraCompactificationsPartII:C8/pel-local-properties` (C8.9).
- **`SchemeAndStackFoundations:SF.1`**: Algebraic spaces and stacks, étale descent and gluing, used to normalize over algebraic-space auxiliary models. Needed by `ShimuraCompactificationsPartII:C7/normalized-toroidal-model` (C7.5).
- **`SchemeAndStackFoundations:SF.4`**: Stein factorization for proper algebraic spaces, its flat-base-change compatibility and f_*O=O for a proper birational map to a normal target; combined with the projection formula for ample section rings and descended sections. Needed by `ShimuraCompactificationsPartII:C8/pel-normalized-toroidal` (C8.3); `ShimuraCompactificationsPartII:C8/pel-minimal-strata` (C8.7); `ShimuraCompactificationsPartII:C10/connected-components` (C10.12); `ShimuraCompactificationsPartII:C14/klingen-paramodular-minimal` (C14.8).
- **`ShimuraCompactifications:C0`**: Rational polyhedral cones, admissible arithmetic fans, common refinements and pullbacks of cone decompositions along lattice maps (C0.13–C0.15). Needed by `ShimuraCompactificationsPartII:C7/induced-cone-decomposition` (C7.3); `ShimuraCompactificationsPartII:C8/pel-putative-charts` (C8.4).
- **`ShimuraData:D4`**: Shimura data, morphisms of Shimura data and the Hodge-type predicate. Needed by `ShimuraCompactificationsPartII:C15/gspin-datum` (C15.1); `ShimuraCompactificationsPartII:C7/auxiliary-siegel-datum` (C7.1).
- **`ShimuraVarieties:V1`**: Level maps and Hecke correspondences of Shimura varieties in characteristic zero. Needed by `ShimuraCompactificationsPartII:C7/auxiliary-siegel-datum` (C7.1).
- **`ShimuraVarieties:V2`**: Rational boundary components and the Baily–Borel compactification in characteristic zero. Needed by `ShimuraCompactificationsPartII:C15/gspin-cusps` (C15.2).
- **`ModularCurvesPartII:R13.4a`**: Normal integral Γ_0(p) modular-curve comparison, including the compactified model and its formal cusp rings. Used to identify normalized genus-one Siegel, PEL and rank-one genus-two boundary models with their integral modular moduli; generic-fibre equality alone is insufficient. Needed by `ShimuraCompactificationsPartII:C7/normalized-toroidal-model` (C7.5); `ShimuraCompactificationsPartII:C8/pel-normalized-minimal` (C8.2); `ShimuraCompactificationsPartII:C12/minimal-compactification` (C12.4); `ShimuraCompactificationsPartII:C13/deep-level-toroidal-model` (C13.2); `ShimuraCompactificationsPartII:C14/normal-lci` (C14.4).

## Verified library baseline

Mathlib is pinned to `082e2d37e8b0463410cdb532e111cd43d5a66174`; TauCeti to `f790474821cf4256814db967cb154e7af3d0c369`. Each of the following declaration statements was read at that exact commit. The statement-level limits below are part of the contract.

- [`mathlib:AlgebraicGeometry.IsFinite`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Finite.lean) (class): Finite morphisms of schemes, defined by the affine-local module-finiteness condition. Statement read at the pinned commit on 2026-10-19, Mathlib/AlgebraicGeometry/Morphisms/Finite.lean:40; conventions and required hypotheses checked against the citing nodes.
- [`mathlib:AlgebraicGeometry.IsOpenImmersion`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/OpenImmersion.lean) (abbrev): Open immersion morphism property for schemes. Statement read at the pinned commit on 2026-10-19, Mathlib/AlgebraicGeometry/OpenImmersion.lean:36; conventions and required hypotheses checked against the citing nodes.
- [`mathlib:AlgebraicGeometry.Scheme.Hom.normalization`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Normalization.lean) (def): Relative normalization of a quasi-compact quasi-separated morphism f:X→Y, using integral closure in f_*O_X; structure maps X→f.normalization→Y. Statement read at the pinned commit on 2026-10-19, Mathlib/AlgebraicGeometry/Normalization.lean:123; conventions and required hypotheses checked against the citing nodes.
- [`mathlib:AlgebraicGeometry.Scheme.Hom.normalization.hom_ext`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Normalization.lean) (lemma): Uniqueness for maps OUT of f.normalization into T over Y when T→Y is affine, given equality after precomposition X→f.normalization and equality of the composites to Y. This is not incoming normal-test lifting. Statement read at the pinned commit on 2026-10-19, Mathlib/AlgebraicGeometry/Normalization.lean:437; conventions and required hypotheses checked against the citing nodes.
- [`mathlib:AlgebraicGeometry.Scheme.Hom.normalizationDesc`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Normalization.lean) (def): Outgoing integral factorization: from X→T→Y with T→Y integral, obtain f.normalization→T, with the specified composites. It does not by itself supply NormalizedToroidalModel.desc for incoming normal test spaces. Statement read at the pinned commit on 2026-10-19, Mathlib/AlgebraicGeometry/Normalization.lean:373; conventions and required hypotheses checked against the citing nodes.
- [`mathlib:CliffordAlgebra`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean) (def): The Clifford algebra quotient imposing v²=Q(v); a carrier for Clifford calculations, not the GSpin Shimura datum or the Kuga–Satake construction. Statement read at the pinned commit on 2026-10-19, Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean:74; conventions and required hypotheses checked against the citing nodes.
- [`mathlib:IsCyclotomicExtension`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Cyclotomic/Basic.lean) (class): The field-extension predicate specifying primitive roots of unity and their generation property; it does not construct integral cyclotomic models or prove flatness. Statement read at the pinned commit on 2026-10-19, Mathlib/NumberTheory/Cyclotomic/Basic.lean:76; conventions and required hypotheses checked against the citing nodes.
- [`mathlib:Matrix.symplecticGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/SymplecticGroup.lean) (def): The standard-matrix symplectic submonoid defined by A J Aᵀ=J (Sp). It does not supply GSp, a similitude character or an integral parahoric group scheme. Statement read at the pinned commit on 2026-10-19, Mathlib/LinearAlgebra/SymplecticGroup.lean:101; conventions and required hypotheses checked against the citing nodes.
- [`mathlib:QuadraticForm`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/QuadraticForm/Basic.lean) (abbrev): Quadratic forms as scalar-valued quadratic maps on modules. Statement read at the pinned commit on 2026-10-19, Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:164; conventions and required hypotheses checked against the citing nodes.
- [`mathlib:integralClosure`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean) (def): Integral closure of a ring in an algebra, as a subalgebra; normalization still needs the geometric gluing and finiteness hypotheses. Statement read at the pinned commit on 2026-10-19, Mathlib/RingTheory/IntegralClosure/Algebra/Basic.lean:216; conventions and required hypotheses checked against the citing nodes.
- [`mathlib:spinGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean) (def): Spin group as the intersection of the pin group with the even Clifford submonoid; this is not GSpin. Statement read at the pinned commit on 2026-10-19, Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:293; conventions and required hypotheses checked against the citing nodes.
- [`tauceti:TauCeti.Hodge.MixedHodgeStructure`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Geometry/Hodge/Mixed/Basic.lean) (structure): Integral, rational and complex realizations with rational weight filtration and complex Hodge filtration, scalar-extension compatibility and pure graded pieces. Supplies mixed Hodge structures, not 1-motives or their realizations. Statement read at the pinned commit on 2026-10-19, TauCeti/Geometry/Hodge/Mixed/Basic.lean:78; conventions and required hypotheses checked against the citing nodes.

## Source versions and reading limits

All source-derived statements in this document are in the worker’s own words. Page numbers refer to the linked version, unless journal pages are explicitly stated. Source findings against Pilloni and Boxer–Pilloni are scoped to the author manuscripts: attempts to obtain the publisher PDFs returned HTML access or preview responses. Madapusi Pera’s two findings were also checked in the published Numdam PDF. Neither Brylinski nor the Faltings–Chai book was read directly for this review; those inputs remain explicitly indirect.

### MP19

Keerthi Madapusi Pera. *Toroidal compactifications of integral models of Shimura varieties of Hodge type*. arXiv:1211.1731v6 (11 March 2018); Annales scientifiques de l'École normale supérieure 52 (2019), 393–514

Public source: [MP19](https://arxiv.org/pdf/1211.1731v6).

SHA-256: `837b3cf0f903126f08057ada808e031d101f2fab49d7837619a14ad05d00d155`.

Review reading: §§1.1–1.4, pp. 9–19; §2.2.13, p. 39; §§3.1–3.7, pp. 43–69; §§4.1–5.3, pp. 69–89; Appendix A.1–A.3, pp. 89–100.

### Lan16

Kai-Wen Lan. *Compactifications of PEL-type Shimura varieties in ramified characteristics*. Author's compilation with errata corrected (cpt-ram-flat.pdf, 78 pp.); Forum of Mathematics, Sigma 4 (2016), e1. Page numbers are the author copy's.

Public source: [Lan16](https://www.kwlan.org/articles/cpt-ram-flat.pdf).

SHA-256: `dbe7d5c3488693bad792def9f7245bdea5657174455e15e32bef607c93d801d2`.

Review reading: §§2–4 at pp. 6–8, 18–24; Proposition 5.24, p. 27; §§6–8, pp. 32–45; §§9–14, pp. 51–70.

### Lan17

Kai-Wen Lan. *Integral models of toroidal compactifications with projective cone decompositions*. Author's compilation (cpt-ram-nbl.pdf, 36 pp.); International Mathematics Research Notices 2017, no. 11, 3237–3280

Public source: [Lan17](https://www.kwlan.org/articles/cpt-ram-nbl.pdf).

SHA-256: `ff2229d32fc6dd99174d8ff392ebdf6c93c3a455118bd7d54f54a74a967d31ac`.

Review reading: Theorem 6.1 and its comparison clauses, pp. 22–24.

### BP26

George Boxer and Vincent Pilloni. *Higher Hida theory for Siegel modular forms*. Authors' version of 5 November 2025 (higherhidaSiegel.pdf, 65 pp.); Inventiones mathematicae 244 (2026), doi:10.1007/s00222-025-01393-2

Public source: [BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf).

SHA-256: `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`.

Review reading: §§3.4.19–3.4.25 and 4.1.1–4.1.11, pp. 39–43.

### Pil20

Vincent Pilloni. *Higher coherent cohomology and p-adic modular forms of singular weights*. Public author manuscript dated 17 June 2019; published in Duke Mathematical Journal 169 (2020), 1647–1807. This review read the public author PDF, not a publisher PDF; its page numbers refer to that manuscript.

Public source: [Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).

SHA-256: `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`.

Review reading: §§6.1–6.2, pp. 26–30; §7.1, p. 38; §12.1, pp. 71–72; the formal p-rank finiteness argument, p. 101; §14.9.2 and footnote 27, pp. 104–105.

### FKW

Benson Farb, Mark Kisin and Jesse Wolfson. *Essential dimension via prismatic cohomology*. arXiv:2110.05534v2 (27 February 2024)

Public source: [FKW](https://arxiv.org/pdf/2110.05534v2).

SHA-256: `f281f903f7a1836ef0eb7abe718c78e72f481d059cecb91dd237e6ecfe83b26b`.

Review reading: §2.2, p. 15; §§3.3.5–3.3.18, pp. 34–36.

### MST22

Davesh Maulik, Ananth N. Shankar and Yunqing Tang. *Picard ranks of K3 surfaces over function fields and the Hecke orbit conjecture*. Authors' manuscript of 25 December 2021 (GSpincharp.pdf); Inventiones mathematicae 228 (2022), 1075–1143

Public source: [MST22](https://math.berkeley.edu/~ytang/GSpincharp.pdf).

SHA-256: `53f4c42762f179fba71a2d344bee56f3de1fb189f4dd9aea968a4fcbfaedc494`.

Review reading: §§2.1–2.2, p. 6; §§8.1–8.5, pp. 37–40.

### FC90

Gerd Faltings and Ching-Li Chai. *Degeneration of Abelian Varieties*. Ergebnisse der Mathematik und ihrer Grenzgebiete (3) 22, Springer, 1990 (maintainer-cleared copy; cited through the parent roadmap's C4)

Review reading: Not read directly in this review; the needed semi-abelian extension theorem is imported from ShimuraCompactifications:C4, whose contract and current upstream README were read.

### Bry83

Jean-Luc Brylinski. *1-motifs et formes automorphes (théorie arithmétique des domaines de Siegel)*. Journées automorphes (Dijon, 1981), Publ. Math. Univ. Paris VII 15 (1983), 43–106

Review reading: Not read directly; MP19 Proposition 3.1.2 at p. 44 is the explicit indirect source.

### Str15

Benoît Stroh. *Compactifications et mauvaise réduction*. Public author manuscript for Astérisque 370 (2015), 269–304; 31-page Laumon.pdf. The locators here use manuscript pages.

Public source: [Str15](https://webusers.imj-prg.fr/~benoit.stroh/Laumon.pdf).

SHA-256: `b2070714b06722c4925dfd363142e644c50663501fde61cdbc84d188958f076c`.

Review reading: §§1.1–1.2.1, p. 3, for the chain convention; §2.4.1, Lemmas 2.4.2–2.4.3, Remark 2.4.4 and Remark 2.4.9, pp. 25–28.

### BZ21

Jan Hendrik Bruinier and Shaul Zemel. *Special cycles on toroidal compactifications of orthogonal Shimura varieties*. Public arXiv manuscript 1912.11825; published in Mathematische Annalen 379 (2021), 57–109. Locators here use the 2026-10-19 downloaded manuscript.

Public source: [BZ21](https://arxiv.org/pdf/1912.11825).

SHA-256: `d4018d785bb2dc3f747e2ed7371c3b05942244edae4054cdbe746a2315c25194`.

Review reading: §§3.1–3.3, including Hypothesis 3.14, Lemma 3.18 and Proposition 3.19, pp. 15–24.

### Zem20

Shaul Zemel. *The structure of integral parabolic subgroups of orthogonal groups*. Journal of Algebra 559 (2020), 95–128

Public source: [Zem20](https://arxiv.org/pdf/1902.08264).

SHA-256: `bc6a4967bd9ad1302c5e70d24fa3c9c751f2e78b74eaa765f22b2af20df574e7`.

Review reading: §4, Theorem 4.1 and subsequent discussion, pp. 29–31.

### Stacks069P

The Stacks Project Authors. *Smooth descent of local complete intersection morphisms*. Lemma 37.62.20, tag 069P, accessed 2026-10-19

Public source: [Stacks069P](https://stacks.math.columbia.edu/tag/069P).

Review reading: Lemma 37.62.20 and proof.

### MP19pub

Keerthi Madapusi Pera. *Toroidal compactifications of integral models of Shimura varieties of Hodge type*. Version of record, Annales scientifiques de l’École normale supérieure 52 (2019), 393–514; Numdam PDF. Used to check the source findings, with journal page numbers.

Public source: [MP19pub](https://www.numdam.org/item/10.24033/asens.2391.pdf).

SHA-256: `d7e0dfa1d9ef76f3f85682f1abcc52d3d66de9e9378e92fc9153a3ba5c10a077`.

Review reading: Proposition 1.3.5, p. 408; Remark 5.2.10 and Theorem 5.2.11, p. 494; Appendix A.1.8, pp. 499–500.

## Source findings reviewed

These ten records include nine confirmed findings and one rejected allegation. A confirmed record of Madapusi Pera’s remark about Lan’s book is not an independent book erratum. The separate degree/index correction does not reject the valid n=0 identity-chain specialization.

### E1 — confirmed

[Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §6.1.5.2, pp. 27–28; misprint; affects nothing.

Finding in own words: The moduli of 1-motives M_{W,γ}, M_{W,γ,Kli(p)}, M_{W,γ,par} are said to carry K_p-level structure; the abelian part is given genus rank_ℤ W; B_{W,γ,par} is placed over Y_{W,γ}.

Corrected contract: Level K^p (away from p); the abelian part has genus 2 − rank_ℤ W; B_{W,γ,par} lies over Y_{W,γ,par}.

Check: The toric part of the degeneration at W has rank rank_ℤ W, so the abelian part of a genus-two 1-motive has genus 2 − rank W; the level at p is encoded by the lattice, not by a K_p-structure; the diagram on p. 27 already has Y_{W,γ,par}.

Review: Confirmed at the author manuscript pp. 27–28: the toric-rank dimension, away-from-p marking and paramodular base must agree with the displayed tower.

Handling: C14/one-motive-charts states the corrected objects.

Known status: Recorded by the paper extraction (PAPER-PILLONI-20/E34, E35, E37); no published correction known.

Correction search: Pilloni author version; PAPER-PILLONI-20 extraction; Independent review, 2026-10-19: public author publication page and the available author manuscript; no separate correction located.

### E2 — confirmed

[Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §6.1.5.3, p. 28, and condition 3, p. 29; error; affects a stated result.

Finding in own words: The lattices X_⋆(T) are placed in Sym²(V/W^⊥) ⊗ ℚ and smoothness is tested against a lattice of that space; condition 3 is conditioned on H being admissible.

Corrected contract: The lattices in Sym²(V/W^⊥) ⊗ ℚ are character groups X^⋆(T); cones live in X_⋆(T)_ℝ and a cone is smooth if its generators extend to a ℤ-basis of X_⋆(T); condition 3 reads 'if H = Γ (resp. Γ_par, Γ_Kli(p))'.

Check: Cones of a torus embedding lie in the cocharacter space; the admissibility wording is that of Theorem 6.1.5.1(4).

Review: Confirmed for the author manuscript: the integral lattice in symmetric tensors is the character lattice; its dual is the cone lattice. The named-group condition is fixed by the theorem’s own admissibility clause.

Handling: C14/one-motive-charts uses the corrected definitions.

Known status: PAPER-PILLONI-20/E36, E38; no published correction known.

Correction search: Pilloni author version; PAPER-PILLONI-20 extraction; Independent review, 2026-10-19: public author publication page and the available author manuscript; no separate correction located.

### E3 — confirmed

[Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Theorem 6.1.5.1(2), p. 29; error; affects a stated result.

Finding in own words: For a refinement π : X_{Σ′} → X_Σ the boundary ideals satisfy π^*I_{X_Σ} = I_{X_{Σ′}}.

Corrected contract: Rπ_*I_{X_{Σ′}} = I_{X_Σ}; only the inclusion π^*I_{X_Σ} ⊂ I_{X_{Σ′}} is automatic. The displayed pullback equality is false in general; no converse characterizing identical fans is asserted.

Check: Blowing up the vertex of a smooth two-dimensional cone, the pullback of (xy) vanishes to order 2 along the exceptional curve while the new boundary ideal vanishes to order 1.

Review: Confirmed by the blowup of the two-dimensional coordinate cone: pullback of xy has exceptional multiplicity two, whereas the reduced new boundary has multiplicity one. Removed the unsupported equality-only-for-identical-fans converse.

Handling: C14/genus-two-sheaves uses the derived statement, supplied by ShimuraCompactifications C3.8.

Known status: PAPER-PILLONI-20/E40; no published correction known.

Correction search: Pilloni author version; PAPER-PILLONI-20 extraction; Independent review, 2026-10-19: public author publication page and the available author manuscript; no separate correction located.

### E4 — confirmed

[Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), Theorem 6.1.5.1(1) and the Notation after its proof, p. 29; misprint; affects nothing.

Finding in own words: The (σ, γ)-strata of X_Kli(p) and X_par are listed in swapped order, and the abbreviation list X, X_par, X_Kli(p) is permuted relative to X_{K,Σ}, X_Kli(p)_{K,Σ}, X_{par,K,Σ}.

Corrected contract: The (σ, γ)-stratum is Z_{W,γ,σ} (resp. Z_{W,γ,Kli(p),σ}, resp. Z_{W,γ,par,σ}); X, X_Kli(p), X_par abbreviate X_{K,Σ}, X_Kli(p)_{K,Σ}, X_{par,K,Σ}.

Check: The 'resp.' lists must follow the same order.

Review: Confirmed at p. 29 of the author manuscript by matching the three stratum bases with their compactification labels.

Handling: C14/klingen-paramodular-compactifications states the corrected order.

Known status: PAPER-PILLONI-20/E39, E41.

Correction search: Pilloni author version; Independent review, 2026-10-19: public author publication page and the available author manuscript; no separate correction located.

### E5 — confirmed

[Pil20](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf), §7.1, p. 38; error; affects nothing.

Finding in own words: The non-smooth locus of X, X_Kli(p), X_par is said to be of codimension 2.

Corrected contract: It has codimension at least 2; for Y_par,K the non-smooth locus is a finite set of closed points (Proposition 6.1.4.1), of codimension 4 in the 4-dimensional scheme Y_par,K over ℤ_p.

Check: The good-level model X is smooth, so its non-smooth locus is empty. For the paramodular interior the nonsmooth points are closed characteristic-p points in total dimension four. These examples disprove an exact codimension-two assertion; the lower bound suffices.

Review: Confirmed as a correction to an exact codimension claim in the author manuscript. The total-space lower bound includes the smooth case and the paramodular isolated points.

Handling: C14/normal-lci states 'at least 2'.

Known status: Noted in the PAPER-PILLONI-20 brief; no published correction known.

Correction search: Pilloni author version; Independent review, 2026-10-19: public author publication page and the available author manuscript; no separate correction located.

### E6 — confirmed

[BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §4.1 first line and §4.1.1, pp. 40–41; error; affects a stated result.

Finding in own words: In §4.1.1, d_i is identified with the degree p^{2n(g−i)} although §3.4.19 defines 𝒜_{g,d_i} by degree d_i²; graded groups are indexed by the ordinary predecessor despite the cyclic flag order.

Corrected contract: Set d_0=1 and d_i=p^{n(g−i)} for 1≤i≤g, so the polarization degree is d_i². Use the predecessor in the ordered flag g+1,…,2g,1,…,g, with 0 before H_{g+1}; retain n≥0.

Check: For g=2,n=1 the middle polarization has degree p², requiring d_1=p, not p². The literal i−1 quotient fails at the wrap in the flag. The n=0 identity chain is consistent and is not an error.

Review: Confirmed for the degree and cyclic predecessor indices only. The n=0 restriction was an erroneous proposed correction and is separated into the rejected E6-n0 entry.

Handling: C13/iwahori-normalized-model and C13/graded-pieces use the degree and cyclic-index corrections; the rejected n=0 allegation is retained separately as E6-n0.

Known status: Degree and flag-index corrections recorded in PAPER-BOXER-PILLONI-26/E65–E66; the E64 allegation about n=0 is rejected here.

Correction search: Boxer–Pilloni version of 5 November 2025; PAPER-BOXER-PILLONI-26 extraction; Independent review, 2026-10-19: public author publication page and the available author manuscript; no separate correction located.

### E7 — confirmed

[BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §4.1 after Remark 4.1.2 and §4.1.8, p. 41; gap; affects the proof.

Finding in own words: Gr_i is treated on all of S^tor as a finite flat group scheme to which Fargues's divisor construction applies.

Corrected contract: The literal extended kernel is quasi-finite flat and may lose rank on the boundary. A finite-flat replacement is a different object: at n=1 it is supplied by Stroh’s Cartier-dual gluing; at n>1 the required extension or alternative divisor construction remains an explicit gap.

Check: For the Tate curve, ker(Tate(q^p) → Tate(q)) has order p off q = 0 and is trivial at q = 0.

Review: Confirmed that a rank-dropping literal boundary kernel cannot serve as a globally finite-flat graded group. The n=1 finite extension exists as a separate glued object; higher n remains open in this packet.

Handling: C13/graded-pieces states the literal-kernel result; C13/rank-p-finite-extension supplies the separate n=1 object. HigherHidaAndColemanTheory may not build a finite-flat-group divisor from the literal quasi-finite kernel alone.

Known status: PAPER-BOXER-PILLONI-26/E67; no published correction known.

Correction search: Boxer–Pilloni version of 5 November 2025; Independent review, 2026-10-19: public author publication page and the available author manuscript; no separate correction located.

### E8 — confirmed

[MP19pub](https://www.numdam.org/item/10.24033/asens.2391.pdf), Remark 5.2.10, p. 494 in the published version (p. 87 in arXiv v6), discussing Lan’s book 7.2.3.5 and 7.2.3.15; gap; affects the proof.

Finding in own words: Madapusi Pera reports an apparent discrepancy between a finite-quotient boundary stratum and the book’s injectivity assertion; the remark does not exhibit a counterexample to the book’s theorem.

Corrected contract: Retain the finite arithmetic quotient Δ^fin_K(Φ) in the boundary stratum. Scope this finding to the gap reported in MP19, rather than claim an independently established error in an unread book.

Check: The published Remark 5.2.10 explicitly raises the injectivity gap outside the Siegel case; Theorem 5.2.11 on the same page uses the quotient.

Review: Confirmed as a faithfully scoped report of MP19’s published Remark 5.2.10, p. 494; no independent verdict about the unread Lan book is claimed.

Handling: C12/minimal-compactification retains the finite quotient. This is a confirmed record of the published remark, not a new book erratum.

Known status: Reported by Madapusi Pera, published Remark 5.2.10. This review has not independently checked the cited book or a book erratum.

Correction search: Madapusi Pera §5.2; Independent review: arXiv version history through v6 and published Numdam PDF, 2026-10-19.

### E6-n0 — rejected

[BP26](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), §4.1 first line, p. 40 of the author manuscript, and the extraction’s E64 allegation; error; affects nothing.

Finding in own words: The source permits n=0; the earlier packet alleged that this must be replaced by n≥1.

Corrected contract: Reject that allegation. For n=0 the level is hyperspecial, all p^n maps are identities, the graded groups have order one and d_i=1; the construction is consistent.

Check: Reducing modulo p^0 imposes no condition, and multiplication by p^0 is the identity. Nontrivial Iwahori geometry starts at n=1 without invalidating the n=0 specialization.

Review: The asserted source mistake does not exist; n=0 is a legitimate degenerate case.

Handling: C13 keeps n≥0 and treats n=0 as the identity-chain test.

Known status: Rejected by this independent review.

Correction search: BP26 §4.1 and §4.1.1, pp. 40–41; original packet E6.

### E9 — confirmed

[MP19pub](https://www.numdam.org/item/10.24033/asens.2391.pdf), Proposition 1.3.5(1), p. 408; compare Appendix A.1.8, pp. 499–500 (arXiv v6 pp. 14 and 92–93); misprint; affects nothing.

Finding in own words: The middle displayed formula identifies W₁D(A) with D(Q^sab).

Corrected contract: The quotient D(A)/W₀D(A) is D(Q^sab). The middle graded piece is D(Q^ab).

Check: Appendix A.1.8 constructs the extension with kernel Hom(Q^et,1) and quotient D(Q^sab). In the totally degenerate case W₁D=W₀D=Hom(Y,1), whereas D(Q^sab)=X⊗1(−1); these have different weights and Frobenius.

Review: The printed W₁ formula is present in both arXiv v6 and the version of record and contradicts the extension in Appendix A.1.8 and the totally degenerate weight calculation.

Handling: C9/log-dieudonne-crystal uses the quotient formula. The source’s duality is Cartier duality and is not listed as an erratum.

Known status: No separate correction located in the checked arXiv history or author/publication listings. The appendix in the same paper supplies the intended formula.

Correction search: MP19 arXiv v6 and version-history page, accessed 2026-10-19; MP19 version of record at Numdam, Proposition 1.3.5 and Appendix A.1.8, accessed 2026-10-19; Author/publication web search for an erratum to Proposition 1.3.5, 2026-10-19.

## Routing and upstream coordination

- `PAPER-FARB-KISIN-WOLFSON-24`: item 138: C11/fkw-good-reduction.
- `PAPER-MAULIK-SHANKAR-TANG-22`: items 27, 28, 86, 87, 89: C15/gspin-cusps, C15/gspin-one-dimensional-cusps, C11/smooth-toroidal with C12/minimal-compactification, C12/zero-dimensional-cusp-coordinates, C10/functoriality.
- `PAPER-PILLONI-20`: Layers P1–P4: C14 (klingen-paramodular-data, one-motive-charts, klingen-paramodular-compactifications, normal-lci, klingen-projections, tp2-correspondence, genus-two-sheaves, klingen-paramodular-minimal, klingen-subgroup-extension).
- `PAPER-BOXER-PILLONI-26`: Layers G1–G2: C13 (polarization-type-loci, deep-level-toroidal-model, semiabelian-extension, iwahori-normalized-model, graded-pieces, iwahori-level-one); C7/cyclotomic-normalized-model.

- HigherHidaAndColemanTheory's requests to 'ShimuraCompactifications:C5 Part II' (normalized integral Siegel higher-level models, boundary extensions, Klingen two-term resolution) and to 'ShimuraCompactifications:C3 Part II' are supplied by this roadmap. Re-point those requests: normalized Siegel models at deep and Iwahori level, the self-dual chain and Gr_i to C13 (deep-level-toroidal-model, iwahori-normalized-model, graded-pieces, rank-p-finite-extension at n=1); higher-level finite-flat graded inputs remain gap/higher-level-graded-extension. Klingen models, X^⋆_Kli(p) and its finiteness over the p-rank ≥ 1 locus to C14 (klingen-paramodular-compactifications, klingen-paramodular-minimal); the normalized-model universal properties to C7/C8. Partial toroidal Igusa quotients stay with the Igusa Part II; subcanonical higher-direct-image vanishing (Lan17 Theorem 8.6) stays with IntegralCoherentHeckeComplexes.
- The pending ShimuraVarietiesPartII (#3356) owns interior integral models (Kisin, Kisin–Pappas, parahoric lattice-chain moduli, Klingen and paramodular local models, de Jong's polarization-type loci over ℤ_p). This roadmap uses them through the three recorded interior gaps and defines its interior models only as opens of the normalized toroidal models (C7/normalized-interior-model). ShimuraVarietiesPartII should state Kisin's smoothness and extension property, Pilloni Proposition 6.1.4.1 and the normality of Iwahori and Lagrangian lattice-chain moduli in the forms of gaps kisin-smoothness, klingen-paramodular-interior and iwahori-lattice-chain-moduli, and cite C7/normalized-interior-model for the comparison of its normal models with the interiors here. Its orthogonal Kuga–Satake direction should import C15/gspin-datum.
- Upstream ShimuraCompactifications C5.31 (Lan17 normalized blow-ups) takes a normal projective flat minimal model M̃^min_{H,J} with Lan16 Propositions 6.1 and 6.4 as hypothesis. That hypothesis is discharged by C8/pel-normalized-minimal (C8/normalized-blowup-input); record this as an upstreamNote for the maintainer.

- `ShimuraCompactifications`: C5.31 assumes Lan16 Propositions 6.1/6.4 for its minimal model; ShimuraCompactificationsPartII C8 (pel-normalized-minimal, normalized-blowup-input) plans that input, so C5.31's hypothesis can cite it.
- `ShimuraCompactifications`: C4.16–C4.17 (compactified Klingen correspondence over ℚ_p) and C5.19 (higher-level normalizations at good level) are used here as stated; the integral Klingen and paramodular models over ℤ_p are planned in ShimuraCompactificationsPartII C14.
- `ShimuraCompactifications`: Current upstream PR #1053 was read at head ee6deacb49872a45f86e6a76fd428b03b1e69541. Its C5.31 normalized-blowup theorem imports the C8 minimal-model input; C8’s section-ring construction must use its independent ample-line/Stein argument, not C5.31, to avoid a cycle.
- `AlgebraicVectorBundles`, `AnalyticToricGeometry`, `OrthogonalSpinGroups`: Current TauCetiRoadmap main 0d144d044dacebca17b654695b6f1ad58f159b27 and TauCeti main a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were read. General bundle/torsor, finite-fan/toric and Clifford/Spin machinery is imported. This packet plans only the Shimura-specific integral boundary constructions; no duplicate general roadmap is added.
- `PadicDifferentialEquationsAndRigidCohomology`: The RD.5.116 relative Zarhin contract is available in that package README and is imported here. When formalizing its four-square formula, use Lan16 Lemma 4.1’s congruence uū=−1 modulo the polarization degree; the formula requires that congruence rather than an arbitrary sum-of-four-squares identity. No supplier file is changed by this review.
