# Roadmap: toroidal compactifications and boundary geometry, Part II — integral models of Hodge type and at bad level

**Summary.** Toroidal and minimal compactifications of integral models of Shimura varieties beyond the good-reduction PEL case of ShimuraCompactifications: normalization models over auxiliary good Siegel compactifications for Hodge-type data at arbitrary level (C7), Lan's normalized PEL compactifications with lattice collections (C8), the p-adic Hodge theory of degenerating abelian varieties with Hodge tensors (C9), Madapusi Pera's structure theorem for the boundary (C10), smooth canonical compactifications at hyperspecial level (C11), minimal compactifications of Hodge type (C12), and the applications to Siegel varieties at deep level (Boxer–Pilloni, C13), to Klingen and paramodular level in genus two (Pilloni, C14) and to GSpin varieties (Maulik–Shankar–Tang, C15).

This roadmap is Part II of *Toroidal compactifications and boundary geometry* (ShimuraCompactifications) and starts where that roadmap stops. The parent constructs Pink's toroidal compactifications in characteristic zero (C2), their refinements and Hecke maps (C3), the theory of degenerating abelian schemes (C4), and, at primes where a PEL datum has good reduction, smooth integral toroidal and minimal compactifications, finite normalizations of a good-level model at higher p-level and Lan's normalized blow-ups of a given minimal model (C5). It makes no integral statement for Hodge-type data, and none at primes where the PEL datum is ramified or the polarization is not prime to p. This Part II supplies both. Its central idea is that every model is the normalization of a product of good Siegel toroidal compactifications in the characteristic-zero toroidal compactification; the work is to describe the boundary of the normalization exactly. For Hodge-type data this is Madapusi Pera's theorem, whose proof is a rationality property of Hodge cycles under p-adic uniformization, obtained from the semistable comparison for degenerating abelian varieties. For PEL data with collections of lattices it is Lan's theory of normalized compactifications. These general results are then specialized to the integral models that higher Hida and Coleman theory uses: Siegel varieties of every genus at deep and Iwahori level (Boxer–Pilloni), the Siegel threefold at Klingen and paramodular level (Pilloni), the boundary torus torsors whose good reduction Farb–Kisin–Wolfson need, and the GSpin varieties whose boundary Maulik–Shankar–Tang use for Hecke orbits.

## Scope and ownership

**Owned here.** Auxiliary Siegel data, Zarhin's replacement and induced cone decompositions; normalized toroidal, interior and boundary models over O_{E,(v)} and over ℤ_p^cycl, with their universal property, transitivity and dependence on auxiliary choices (C7). Lan's normalized interior, minimal and toroidal compactifications of PEL moduli with lattice collections, their putative boundary charts, strata, completions, degenerating families, functoriality and local properties, and the minimal-model input of normalized blow-ups (C8). Realizations of 1-motives, absolute Hodge tensors on boundary 1-motives, the log Dieudonné crystal of a degenerating abelian scheme, the semistable comparison for abelian varieties with semi-abelian reduction, the canonical φ-module and crystalline tensors at boundary points and the crystalline rationality of Hodge cycles (C9). The reduction of the boundary torus torsor, the local structure at the boundary, the abelian and torus torsors of the normalized boundary towers, stratification, formal completions, Madapusi Pera's Theorem 1, refinements, functoriality, the properness criterion, Morita's conjecture, connected components and the étale rationality of Hodge cycles (C10). p-integral Hodge embeddings, smooth canonical compactifications at hyperspecial level, canonical boundary models, the logarithmic de Rham torsors, good reduction of boundary torus torsors and canonicity of the minimal compactification (C11). The Hodge line, Fourier–Jacobi expansions, the minimal compactification of Hodge type with its strata, complete local rings and Hecke maps, and cusp coordinates (C12). Siegel polarization-type loci, models at arbitrary and Iwahori level, the semi-abelian G, G^∨, λ for p | d, the extended Iwahori chain and its graded pieces (C13). Klingen and paramodular models in genus two, their charts, compactifications, lci property, projections, the T_{p,2}-correspondence, coefficient sheaves, minimal models and the extension of the Klingen subgroup (C14). The GSpin datum and the boundary of GSpin varieties (C15).

**Built in the libraries and cited.** Mathlib's relative normalization of schemes (`AlgebraicGeometry.Scheme.Hom.normalization`, with `normalizationDesc` and `normalization.hom_ext`), finite morphisms (`AlgebraicGeometry.IsFinite`), open immersions, integral closure, cyclotomic extensions, the symplectic group of the standard form, Clifford algebras, `spinGroup` and quadratic forms; Tau Ceti's mixed Hodge structures (`TauCeti.Hodge.MixedHodgeStructure`). The Tau Ceti roadmap ReductiveGroupsPartII supplies Steinberg's theorem over the completed maximal unramified extension (RG2.1.1) and parahoric group schemes (RG2.3).

**Built in other roadmaps and cited.** ShimuraCompactifications C0–C5 (cones and fans, mixed boundary data and cusp labels, Pink's compactifications and their canonical models, refinements and Hecke maps, degenerations and extension of homomorphisms, quasi-finite flat boundary isogenies, good-prime PEL models, minimal models, Hodge-line semiampleness and Lan's normalized blow-ups); PELModuli M1, M2, M5, M6 (PEL moduli, good models, Siegel moduli of every type, the stack 𝔄_{g,d}); ShimuraData D4 and ShimuraVarieties V1–V2; AutomorphicBundles B1 (absolute Hodge tensors in abelian families, node absolute-hodge-propagation) and B3 (canonical extensions); HodgeTateAndCanonicalSubgroups T1 (Hodge tensors under the p-adic comparison, node hodge-tensor-comparison); CrystallineCohomology CR.5–CR.6 (log crystalline sites and Hyodo–Kato theory); CohomologyComparisons CP.4 and PadicHodgeTheory R06.5 (semistable comparison); NeronModelsAndSemistableAbelianVarieties R11.1, R11.3, R11.5; AbelianSchemesAndArithmeticModuli A4, A6; PadicDifferentialEquationsAndRigidCohomology RD.5 (relative Zarhin's trick); AlgebraicModuliForArithmeticGeometry R09.6 (Artin approximation); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 (pointwise p-rank); ModularCurvesPartII R12.3; SchemeAndStackFoundations SF.0–SF.2.

**Not here.** Interior integral models and their moduli interpretations: Kisin's smoothness and extension property at hyperspecial level, Kisin–Pappas parahoric models, the Klingen and paramodular local models and the normality of Iwahori and Lagrangian lattice-chain moduli belong to *Complex Shimura varieties and canonical models, Part II* (ShimuraVarietiesPartII); this roadmap uses three such statements as recorded inputs, listed at the end. Automorphic vector bundles and their extensions are AutomorphicBundles'. Vanishing of higher direct images of cuspidal sheaves to the minimal compactification (Lan17 Theorem 8.6) is IntegralCoherentHeckeComplexes'. Igusa towers, their partial compactifications and the open immersion of the ordinary Igusa formal scheme into the ℤ_p^cycl model belong to the Igusa varieties Part II. Higher Hida and Coleman theory, the divisors D_i, the blow-ups and the normalized Hecke operators are HigherHidaAndColemanTheory's.

## Conventions

- O is O_{E,(v)} for a place v | p of the reflex field E, or its completion; when E_v = ℚ_p it is ℤ_p.
- *Normalization* of a normal excellent algebraic space or stack S in a finite map from a normal scheme over a dense open U ⊂ S is the relative spectrum over S of the integral closure of O_S in the pushforward of the structure sheaf; it is finite over S because S is Nagata. Normalization is transitive along finite maps and commutes with étale base change and with restriction to opens.
- Hodge embeddings ι : (G, X) ↪ (GSp(V), S^±(V)) carry lattices on which the form is perfect at p, achieved by Zarhin's replacement V ↦ (V ⊕ V^∨)^4. Auxiliary Siegel levels are hyperspecial at p; the level K_p of G is arbitrary unless a target states otherwise.
- Cones and fans are those of ShimuraCompactifications C0; *induced* decompositions are pulled back along maps of central lattices and may be nonsmooth.
- Realizations of 1-motives are covariant (homological), as in Madapusi Pera §1.1. The Tate twist 1(−1) has Frobenius p. Monodromy operators N satisfy Nφ = pφN.
- ℤ_p^cycl is the union ℤ_p[ζ_{p^∞}], not its p-adic completion.
- Interior integral models are opens of normalized toroidal models (C7.6); their identifications with moduli problems are inputs from ShimuraVarietiesPartII.
- Cross-references use the named roadmaps' layer ids and, for the parent, its packet node names; internal references use `Ck.n`.

## How to read the build

C7 is formal (normalization over excellent bases) and can start at once from the parent's good Siegel models and characteristic-zero compactifications. C8 builds on C7 for PEL lattice collections, independently of C9–C10. C9 is p-adic Hodge theory of degenerating abelian varieties and depends only on the parent's degeneration theory and on the comparison roadmaps. C10 combines C7 and C9 into Madapusi Pera's structure theorem; C11 adds the hyperspecial hypothesis and Kisin's smoothness (an input); C12 builds the minimal compactification from C10. The applications C13 (Siegel at deep level) and C14 (genus two at Klingen and paramodular level) use C7, C8 and C10; C15 (GSpin) uses C11 and C12. Numbered targets are reference labels; within a layer, build them in the listed order.


| Layer | Title | Headline targets |
| --- | --- | --- |
| C7 | Normalization models over auxiliary Siegel compactifications | Auxiliary Siegel datum, Normalized toroidal model, Normalized boundary tower |
| C8 | Normalized PEL compactifications with lattice collections | PEL lattice collection, Normalized minimal compactification, Putative boundary charts, Boundary strata of normalized models, Tautological degenerating families |
| C9 | Hodge cycles on degenerating abelian varieties | Realizations of 1-motives, Log Dieudonné crystal, Semistable comparison for degenerating abelian varieties, Canonical crystalline tensors, Rationality of Hodge cycles |
| C10 | Toroidal compactifications of Hodge type | Local structure at the boundary, Normalized boundary torus torsor, Formal completion along boundary strata, Toroidal compactification of Hodge type |
| C11 | Hyperspecial level: smooth canonical compactifications | Smooth toroidal compactification at hyperspecial level, De Rham torsor over the compactification |
| C12 | Minimal compactifications of Hodge type | Minimal compactification of Hodge type |
| C13 | Siegel models at deep level at p | Iwahori normalized model |
| C14 | Genus two at Klingen and paramodular level | Klingen and paramodular compactifications, Klingen minimal compactification |
| C15 | Orthogonal Shimura varieties at the boundary | GSpin Shimura datum |

## Layer C7: Normalization models over auxiliary Siegel compactifications

Auxiliary Siegel data for a Hodge-type datum at an arbitrary level K = K_pK^p: finite families of Hodge embeddings into Siegel data with self-dual lattices and hyperspecial auxiliary levels, conjugated by elements of G(𝔸_f) (Madapusi Pera §4.1.1; Lan 2016 §§2–4; Boxer–Pilloni §3.4.19); Zarhin's replacement making any lattice self-dual and the finiteness of the induced map 𝒜_{g,d} → 𝒜_{8g,1} on moduli. Induced (pulled-back, possibly nonsmooth) cone decompositions and the finite map of characteristic-zero toroidal compactifications identifying Sh^Σ_K with a normalization (Harris's lemma). The normalized toroidal model 𝒮^Σ_K: the normalization of the product of good Siegel toroidal models over O_{E,(v)} in Sh^Σ_K, normal, proper and flat, with its open dense interior 𝒮_K; transitivity of normalization and the dependence on auxiliary choices; normalized boundary towers, twisted torus embeddings and strata; the variant over ℤ_p^cycl = ℤ_p[ζ_{p^∞}].

*Layer dependencies:* ShimuraCompactifications C1, ShimuraCompactifications C2, ShimuraCompactifications C3, ShimuraCompactifications C5, ShimuraData D4, PELModuli M5, PELModuli M6, PadicDifferentialEquationsAndRigidCohomology RD.5, SchemeAndStackFoundations SF.0, SchemeAndStackFoundations SF.1.

### C7.1 Auxiliary Siegel data for a Shimura datum

Define (definition, node `C7/auxiliary-siegel-datum`): Let (G, X) be a Shimura datum of Hodge type with reflex field E, p a prime, v | p a place of E and K = K_pK^p ⊂ G(𝔸_f) a neat compact open subgroup. An auxiliary Siegel datum for (G, X, K) at v is a finite nonempty family J of triples (ι_j, g_j, K_j)_{j∈J}, where ι_j : (G, X) → (GSp(V_j, ψ_j), S^±(V_j)) is an embedding of Shimura data into the Siegel datum of a symplectic ℚ-space, V_j(ℤ) ⊂ V_j is a lattice on which ψ_j is ℤ-valued and perfect at p (so its stabilizer K_{j,p} ⊂ GSp(V_j)(ℚ_p) is hyperspecial), K_j = K_{j,p}K_j^p is a neat compact open subgroup of GSp(V_j)(𝔸_f) and g_j ∈ G(𝔸_f) satisfies ι_j(g_jKg_j^{-1}) ⊂ K_j. Each triple induces a morphism of characteristic-zero Shimura varieties Sh_K(G, X) → Sh_{K_j}(GSp(V_j), S^±) ⊗_ℚ E, x ↦ ι_j(x g_j^{-1}), and J induces their product into ∏_j Sh_{K_j} ⊗ E. A singleton J = {(ι, 1, K‡)} with Sh_K → Sh_{K‡} a closed immersion is Madapusi Pera's choice; collections J of conjugations of one ι are Lan's and Boxer–Pilloni's.

*Hypotheses.*
- (G, X) of Hodge type; K neat; the level K_j hyperspecial at p, that is the stabilizer of a lattice V_j(ℤ_p) self-dual for ψ_j.
- No condition is imposed on K_p: the level of G at p is arbitrary; hyperspeciality is required only of the auxiliary Siegel levels.

*Proof sketch.*
- Embeddings of Shimura data and the induced maps of Shimura varieties are those of ShimuraData D4 and ShimuraVarieties V1 (level maps and Hecke translations), composed with right translation by g_j.
- If ψ_j is not perfect at p on a given lattice, replace V_j by Zarhin's space (V_j ⊕ V_j^∨)^4 with its perfect form (C7.2); this changes ι_j but not the generic fibre Sh_K.
- The product of the induced maps is a morphism of E-schemes; its finiteness for suitable K_j is C7.4.

*Sources.* [MP19], §3.1, opening paragraphs, p. 43; §4.1.1, p. 70: Fixes a Hodge embedding into a Siegel datum whose space has a self-dual lattice stabilized by K, with K‡_p the stabilizer, and remarks that Zarhin's trick (H replaced by H^⊕8) always achieves this. [Lan16], §2 and §4, Examples 2.3–2.5, pp. 7–8; (4.13)–(4.15), pp. 21–24: Uses a collection J of auxiliary good-reduction moduli problems, one for each lattice of a multichain or Hecke twist, with morphisms from the PEL moduli problem to each auxiliary one. [BP], §3.4.19, pp. 39–40: Fixes integers d_1, …, d_r, polarization types δ_i and maps K ↪ K_{δ_i} given by conjugation followed by inclusion, inducing finite maps S_{K,ℚ} → ∏ A_{g,d_i,ℚ}.

*Uses.* Madapusi Pera §4.1.1, p. 70: a single Hodge embedding with K ⊂ K‡ and Sh_K → Sh_{K‡} a closed immersion fixes the auxiliary Siegel tower; Boxer–Pilloni §3.4.19 and §4.1.1, pp. 39–41: the Iwahori model at level p^n is built from the collection d_i = p^{n(g−i)}, i = 0, …, g, of conjugated Siegel levels; Pilloni §6.1.5.4, proof of Theorem 6.1.5.1, p. 29: the paramodular model uses Zarhin's genus-16 embedding and the Klingen model the product Y_par × Y.

The API:
- `AuxiliarySiegelDatum` (structure): The family J of triples (ι_j, g_j, K_j) with the lattice V_j(ℤ) and the containment ι_j(g_jKg_j^{-1}) ⊂ K_j.
- `AuxiliarySiegelDatum.genericMap` (data): The induced morphism Sh_K(G, X) → ∏_{j∈J} Sh_{K_j}(GSp(V_j), S^±) ⊗_ℚ E of E-schemes.
- `AuxiliarySiegelDatum.single` (constructor): The singleton datum of one Hodge embedding ι with g = 1 and K ⊂ K‡.
- `AuxiliarySiegelDatum.zarhin` (constructor): Replace each V_j by (V_j ⊕ V_j^∨)^4 with Zarhin's perfect form, keeping ι_j up to the diagonal embedding.
- `AuxiliarySiegelDatum.union` (constructor): The disjoint union of two auxiliary data for the same (G, X, K); its generic map is the product of the two.
- `AuxiliarySiegelDatum.restrictLevel` (functoriality): For K′ ⊂ K neat, the same family is an auxiliary datum for K′, and the generic maps commute with Sh_{K′} → Sh_K.
- `AuxiliarySiegelDatum.hecke` (functoriality): For h ∈ G(𝔸_f^p), the family (ι_j, g_jh, K_j) is an auxiliary datum for h^{-1}Kh, and its generic map is the composite of the old one with right translation by h.

*Needs:* ShimuraData D4; ShimuraVarieties V1; PELModuli M5; Mathlib `Matrix.symplecticGroup`.

**Checks.**

- `AuxiliarySiegelDatum.modularCurve_test` (computation): For G = GL_2, X = ℍ^±, K = K^pK_0(p) and J = {(id, 1, K^pGL_2(ℤ_p))}, the generic map is the forgetful map Y_0(p) → Y(K^pGL_2(ℤ_p)) over ℚ, of degree p + 1.
- `AuxiliarySiegelDatum.trivial_test` (degenerate): For (G, X) the Siegel datum itself, K hyperspecial at p and J = {(id, 1, K)}, the generic map is the identity.
- `AuxiliarySiegelDatum.nonSelfDual_test` (non-example): For GSp_4 with the paramodular lattice V_1 = pe_1ℤ ⊕ e_2ℤ ⊕ e_3ℤ ⊕ e_4ℤ, ψ restricted to V_1 has discriminant p², so (id, 1, Stab(V_1)) is not an auxiliary triple until Zarhin's replacement is applied.
- `AuxiliarySiegelDatum.iwahori_test` (computation): For GSp_{2g}, n ≥ 1 and the Iwahori level K_{p,n}, the triples with lattices of polarization degree d_i² for d_0 = 1 and d_i = p^{n(g−i)} (1 ≤ i ≤ g), each made self-dual by Zarhin's replacement, form an auxiliary datum.
- Every Hodge-type datum and neat level admits an auxiliary Siegel datum (Zarhin's replacement of any Hodge embedding).
- The generic map of a singleton datum with K ⊂ K‡ small is a closed immersion Sh_K → Sh_{K‡} ⊗ E.

### C7.2 Zarhin's replacement and finiteness of the moduli map

Prove (theorem, node `C7/zarhin-self-dual-replacement`): Let (V, ψ) be a symplectic ℚ-space with a lattice L on which ψ is ℤ-valued and nondegenerate. Then L′ = (L ⊕ L^∨)^4 carries a ℤ-valued perfect alternating form ψ′ whose restriction to the diagonal copy of L ⊕ L^∨ is ψ ⊕ ψ^∨ up to a fixed integral automorphism, and the map on moduli A ↦ (A ⊕ A^∨)^4 with Zarhin's principal polarization defines, for neat prime-to-p levels K^p ⊂ K′^p compatible with this embedding, a finite morphism of ℤ_(p)-stacks 𝒜_{g,d,K^p} → 𝒜_{8g,1,K′^p} extending the generic morphism of Siegel Shimura varieties; here 𝒜_{g,d} is the moduli stack of abelian schemes with a polarization of degree d² (any d, possibly divisible by p).

*Hypotheses.*
- The level K′^p is chosen so that the induced map on level structures is defined; neatness is used only to work with algebraic spaces.
- Finiteness is asserted over ℤ_(p); smoothness of 𝒜_{g,d} at p | d is not claimed.

*Proof sketch.*
- Zarhin's trick: for an abelian scheme A with polarization λ, (A × A^∨)^4 carries a principal polarization built from λ and a quaternion of integers u with u ū = −1 modulo the degree (PadicDifferentialEquationsAndRigidCohomology RD.5, relative Zarhin's trick).
- The map is quasi-finite: A is recovered up to finitely many choices as a direct factor of (A × A^∨)^4 with its induced polarization, by the finiteness of polarized automorphism groups (AbelianSchemesAndArithmeticModuli A6).
- The map is proper by the valuative criterion: if (A × A^∨)^4 extends over a discrete valuation ring then so does A, since good reduction is inherited by isogeny factors (Néron–Ogg–Shafarevich, NeronModelsAndSemistableAbelianVarieties R11.5); quasi-finite and proper gives finite.

*Sources.* [Lan16], §4, Lemma 4.1 and Proposition 4.12, pp. 18–21; Introduction, p. 3: Builds the auxiliary good-reduction moduli by Zarhin's trick when the polarization is not prime to p, and for genus-g Siegel moduli of degree d² takes principally polarized genus-8g Siegel moduli as auxiliary space. [MP19], §3.1, p. 43: Notes that the self-dual lattice condition is achieved after replacing H by H^⊕8 by Zarhin's trick. [Pilloni20], proof of Theorem 6.1.5.1, p. 29: Embeds the paramodular moduli space into the principally polarized genus-16 Siegel space by Zarhin's trick before normalizing.

*Needs:* PadicDifferentialEquationsAndRigidCohomology RD.5; PELModuli M6; AbelianSchemesAndArithmeticModuli A6; NeronModelsAndSemistableAbelianVarieties R11.5.

**Checks.**

- For g = 2, d = p the target is the principally polarized Siegel moduli of genus 16.
- For d = 1 the map composes the identity of 𝒜_{g,1} with the closed immersion A ↦ (A × A^∨)^4.

### C7.3 Induced cone decompositions

Construct (construction, node `C7/induced-cone-decomposition`): Let J be an auxiliary Siegel datum (C7.1) and, for each j, Σ_j a K_j-admissible complete rational polyhedral cone decomposition for the Siegel datum of V_j. For each cusp label representative Φ of (G, X, K), with induced labels Φ_j = (ι_j, g_j)_\*Φ, the induced decomposition Σ(Φ) of the closed cone of Φ is the set of nonempty intersections of the cone of Φ with preimages of products ∏_j σ_j, σ_j ∈ Σ_j(Φ_j), under the map of central lattices B_K(Φ) → ∏_j B_{K_j}(Φ_j). The family Σ = ι^\*(Σ_j)_j is a K-admissible rational polyhedral cone decomposition, complete if each Σ_j is, possibly nonsmooth even when every Σ_j is smooth, and every admissible decomposition of (G, X, K) has a refinement that is induced from smooth projective Σ_j.

*Hypotheses.*
- Cone conventions of ShimuraCompactifications C0: rational polyhedral, closed and salient, on the common lattice carrier; admissibility means compatibility under the arithmetic action with finitely many orbits.
- Smoothness of Σ is not part of the construction.

*Proof sketch.*
- Form Σ(Φ) by pulling back cones along the linear map of central lattices; faces and intersections pull back to faces and intersections, so Σ(Φ) is a fan on the cone of Φ (ShimuraCompactifications C0 common refinements).
- Compatibility of Φ ↦ Φ_j with the arithmetic actions and with face maps of cusp labels gives admissibility; completeness pulls back because the cone of Φ maps into the cones of the Φ_j.
- Given an admissible Σ′ of (G, X, K), refine the Σ_j so that each cone of Σ′ is a union of induced cones (Madapusi Pera 4.1.6 citing Harris; Lan16 §7).

*Sources.* [MP19], §4.1.4, p. 70; Remark 4.1.6, p. 72: Starts from an admissible decomposition for the Siegel datum, takes the induced one for (G, X, K), and notes that refinements of induced decompositions can be arranged to be induced, citing Harris. [Lan16], §7, pp. 36–37: Defines a possibly nonsmooth cone decomposition for the PEL moduli by pulling back products of the auxiliary cones under the map of cone spaces (5.20).

*Uses.* Madapusi Pera §4.1.4–4.1.5, pp. 70–72: the normalized toroidal model is indexed by the induced decomposition; Lan16 §7 and Theorem 9.13, pp. 36–51: strata of the normalized model are indexed by induced cones.

The API:
- `inducedConeDecomposition` (constructor): The family Σ(Φ) of pulled-back cones for each cusp label representative Φ.
- `inducedConeDecomposition_admissible` (structure): Σ is K-admissible: finitely many orbits of cones under the arithmetic group of each Φ.
- `inducedConeDecomposition_complete` (other): If each Σ_j is complete then so is Σ.
- `inducedConeDecomposition_refine` (other): Every admissible decomposition of (G, X, K) is refined by an induced one, with the Σ_j smooth and projective.
- `inducedConeDecomposition_face` (functoriality): Induced cones are compatible with face maps between cusp labels.

*Needs:* ShimuraCompactifications C1 (cusp-label); ShimuraCompactifications C0; ShimuraCompactifications C3 (level-datum-functoriality).

**Checks.**

- `inducedConeDecomposition_siegel_test` (degenerate): For the trivial auxiliary datum of a Siegel datum, Σ = Σ_1.
- `inducedConeDecomposition_nonsmooth_test` (non-example): Let the source lattice be B = {(a, b) ∈ ℤ² : a ≡ b mod 2} mapping to ℤ² by inclusion, and pull back the quadrant ℝ_{≥0}², smooth for ℤ². The induced cone is the quadrant with rays generated in B by (2, 0) and (0, 2); the lattice point (1, 1) ∈ B lies in the cone but not in ℕ(2, 0) + ℕ(0, 2), so the induced cone is not smooth for B.
- `inducedConeDecomposition_modular_test` (computation): For GL_2 every cusp has the single cone ℝ_{≥0} and the induced decomposition is that cone for any auxiliary datum.
- The induced decomposition of a complete admissible family is complete and admissible.
- Induced cones of a smooth family can be nonsmooth for the induced lattice.

### C7.4 Finite maps of characteristic-zero toroidal compactifications

Prove (theorem, node `C7/generic-toroidal-finite-map`): With J and Σ = ι^\*(Σ_j) as in C7.3, the generic map of J extends to a morphism of E-schemes Sh^Σ_K → ∏_j Sh^{Σ_j}_{K_j} ⊗ E from Pink's toroidal compactification over E, it is finite, and it identifies Sh^Σ_K with the normalization of ∏_j Sh^{Σ_j}_{K_j} ⊗ E in Sh_K. On boundary charts it maps each boundary mixed Shimura variety Sh_{K_Φ}(Q_Φ, D_Φ) finitely to ∏_j Sh_{K_{Φ_j}}(Q_{Φ_j}, D_{Φ_j}) ⊗ E, compatibly with the torus-torsor and abelian-torsor towers, and each twisted torus embedding Sh_{K_Φ}(Q_Φ, D_Φ, σ) to the product of those for σ_j ⊇ σ.

*Hypotheses.*
- Σ induced from complete K_j-admissible Σ_j; finiteness of the generic map Sh_K → ∏ Sh_{K_j} on the interior follows from the closed-immersion or level-change form of each ι_j.

*Proof sketch.*
- Extend the map by the functoriality of toroidal compactifications for morphisms of data whose cone maps send cones into cones (ShimuraCompactifications C3, level and datum maps).
- Finiteness: the map is proper (source proper) and quasi-finite, the latter checked stratum by stratum on boundary charts where it is a finite map of torus embeddings over finite maps of boundary bases (Harris, Lemma 3.1, as cited by Madapusi Pera 4.1.2).
- Since Sh^Σ_K is normal (ShimuraCompactifications C2) and contains Sh_K densely, Zariski's main theorem identifies it with the normalization of the target in Sh_K.

*Sources.* [MP19], §4.1.2 and §4.1.4, p. 70: Uses Harris's lemma that the normalization of a twisted torus embedding of the Siegel boundary in the boundary mixed Shimura variety is the corresponding twisted toric variety, and that the map of toroidal compactifications identifies Sh^Σ_K with the normalization of Sh^{Σ‡}_{K‡} in Sh_K. [Lan16], §5, Proposition 5.24, p. 27, and §7, pp. 36–37: Shows that the auxiliary toroidal compactifications receive finite morphisms from the PEL compactification in characteristic zero for compatible pulled-back cone decompositions. [BP], §3.4.23, p. 40; §4.1.1, p. 41: Assumes a finite map S^tor_{K,ℚ} → ∏ A^tor_{g,d_i,ℚ} for suitable cone decompositions.

*Needs:* C7.3; ShimuraCompactifications C2 (canonical-toroidal-model); ShimuraCompactifications C2 (normal-open-dense); ShimuraCompactifications C3 (level-datum-functoriality); Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`.

**Checks.**

- For a smooth Σ_1 on a Siegel datum and its own trivial auxiliary datum the map is the identity.
- Over the boundary the map need not be a closed immersion even when Sh_K → Sh_{K‡} is.

### C7.5 The normalized toroidal model

Construct (construction, node `C7/normalized-toroidal-model`): Let O be the localization O_{E,(v)} (or its completion O_{E_v}, or ℤ_p when E_v = ℚ_p), J an auxiliary Siegel datum and Σ = ι^\*(Σ_j) induced from smooth complete projective Σ_j. Let 𝒜^{Σ_j}_{K_j} be the smooth proper integral toroidal compactification over ℤ_(p) of the Siegel moduli at the hyperspecial level K_j (ShimuraCompactifications C5). The normalized toroidal model 𝒮^Σ_K = 𝒮^Σ_K(J) is the normalization of ∏_j 𝒜^{Σ_j}_{K_j} ⊗ O in Sh^Σ_K along the finite map of C7.4: the relative spectrum over the product of the integral closure of its structure sheaf in the pushforward of the structure sheaf of Sh^Σ_K. It is a normal algebraic space, proper and flat over O, with generic fibre Sh^Σ_K and a finite morphism to ∏_j 𝒜^{Σ_j}_{K_j} ⊗ O.

*Hypotheses.*
- Σ_j smooth, complete and projective for the auxiliary Siegel models, so that 𝒜^{Σ_j}_{K_j} is a smooth projective scheme over ℤ_(p); Σ itself may be nonsmooth.
- The construction uses only excellence and normality; no smoothness of the interior and no moduli interpretation at level K_p is asserted.

*Proof sketch.*
- Normalize along the finite morphism Sh^Σ_K → ∏ 𝒜^{Σ_j}_{K_j} ⊗ E (Mathlib's relative normalization on schemes, glued on étale charts for algebraic spaces).
- Finiteness of the normalization over the product: the product is of finite type over the excellent ring O, hence Nagata (SchemeAndStackFoundations SF.0).
- Properness follows from finiteness over a proper base; flatness from torsion-freeness of the structure sheaf, which injects into its generic fibre; normality by construction.

*Sources.* [MP19], §4.1.4, p. 71; footnote 2, p. 2: Defines 𝒮^Σ_K as the normalization of the Chai–Faltings compactification 𝒮^{Σ‡}_{K‡} in Sh_K, normalization meaning the finite algebraic stack given by integral closure of the structure sheaf in the pushforward. [Lan16], (7.7)–(7.8) and Lemma 7.9, p. 37: Defines the normalized toroidal model as the normalization of the product of auxiliary toroidal compactifications and proves it proper and flat with the normalized interior as a dense open. [BP], §3.4.23, p. 40: Defines S^tor_{K^pK_p} → Spec ℤ_p as the normalization of ∏ A^tor_{g,d_i} × Spec ℤ_p in S^tor_{K^pK_p,ℚ_p}.

*Uses.* Madapusi Pera Theorem 4.1.5, p. 71: the model whose boundary structure the main theorem describes; Boxer–Pilloni §§3.4.23 and 4.1.1, pp. 40–41: integral models of Siegel varieties at deep level p; HigherHidaAndColemanTheory H2/ordinary-strata: the normalization model at Iwahori level p^n carrying the self-dual chain; Maulik–Shankar–Tang §8.1: the smooth toroidal compactification of the GSpin integral model at hyperspecial level.

The API:
- `NormalizedToroidalModel` (constructor): The normal algebraic space 𝒮^Σ_K(J) over O with its finite map ν : 𝒮^Σ_K → ∏_j 𝒜^{Σ_j}_{K_j} ⊗ O and generic identification 𝒮^Σ_K ⊗ E ≅ Sh^Σ_K.
- `NormalizedToroidalModel.finite` (instance): ν is finite.
- `NormalizedToroidalModel.proper_flat` (other): 𝒮^Σ_K is proper and flat over O, and normal.
- `NormalizedToroidalModel.generic` (data): The isomorphism of the generic fibre with Sh^Σ_K, compatible with ν and the generic toroidal map.
- `NormalizedToroidalModel.desc` (universal-property): For a normal O-flat algebraic space T with a dense open generic fibre, a map T_E → Sh^Σ_K and a map T → ∏ 𝒜^{Σ_j}_{K_j} ⊗ O compatible on T_E, there is a unique T → 𝒮^Σ_K inducing both.
- `NormalizedToroidalModel.interior` (projection): The open subspace 𝒮_K = ν^{-1}(∏ 𝒜_{K_j} ⊗ O), with 𝒮_K ⊗ E = Sh_K (C7.6).
- `NormalizedToroidalModel.baseChange_etale` (functoriality): Formation commutes with étale base change on the product and with passing from O_{E,(v)} to its henselization or completion.

*Needs:* C7.4; ShimuraCompactifications C5 (integral-toroidal-space); ShimuraCompactifications C5 (valuative-properness); Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`; Mathlib `AlgebraicGeometry.Scheme.Hom.normalizationDesc`; Mathlib `AlgebraicGeometry.IsFinite`; SchemeAndStackFoundations SF.0; SchemeAndStackFoundations SF.1.

**Checks.**

- `NormalizedToroidalModel.identity_test` (degenerate): For the Siegel datum at hyperspecial level with its trivial auxiliary datum and smooth Σ_1, the normalized model is 𝒜^{Σ_1}_{K} ⊗ O itself.
- `NormalizedToroidalModel.gamma0_test` (computation): For GL_2 at level K^pK_0(p), p ≥ 5, K^p neat, the normalized model is finite flat of degree p + 1 over the compactified modular curve of level K^p over ℤ_p, and its special fibre has two irreducible components meeting at the supersingular points (each component a copy of the level-K^p curve).
- `NormalizedToroidalModel.compatible_test` (compatibility): For a PEL datum and a singleton J at a good prime, with K_p = G(ℤ_p), the normalized model coincides with the good-prime integral toroidal model of ShimuraCompactifications C5 for the same Σ.
- `NormalizedToroidalModel.notSmooth_test` (non-example): At level K_0(p) the normalized model of the modular curve is not smooth over ℤ_p at the supersingular points, although the auxiliary model is.
- 𝒮^Σ_K is proper and flat over O with generic fibre Sh^Σ_K.
- For the Siegel datum at hyperspecial level it is the Faltings–Chai compactification.

### C7.6 The interior of the normalized model

Prove (theorem, node `C7/normalized-interior-model`): The preimage 𝒮_K of ∏_j 𝒜_{K_j} ⊗ O under the finite map ν of C7.5 is an open dense subspace of 𝒮^Σ_K, it is the normalization of ∏_j 𝒜_{K_j} ⊗ O in Sh_K, it is normal, flat and of finite type over O with generic fibre Sh_K, and it does not depend on Σ. For a singleton J with Sh_K → Sh_{K‡} a closed immersion and K_p = K‡_p ∩ G(ℚ_p), 𝒮_K is the normalization of the Zariski closure of Sh_K in 𝒜_{K‡} ⊗ O (Kisin's integral model when K_p is hyperspecial and p > 2).

*Hypotheses.*
- J auxiliary Siegel datum and Σ induced as in C7.5.

*Proof sketch.*
- Normalization commutes with restriction to open subspaces of the base, so the preimage of the open interior of the product is the normalization of that interior in the preimage of Sh_K, which is Sh_K because the generic toroidal map sends boundary to boundary.
- Density: every irreducible component of 𝒮^Σ_K dominates O (flatness) and meets the generic fibre in a component of Sh^Σ_K, in which Sh_K is dense.
- Independence of Σ: the interior normalization only involves the interiors of the auxiliary models.
- For the closed-immersion case, the integral closure of the closure of Sh_K equals the integral closure in Sh_K by Zariski's main theorem.

*Sources.* [Lan16], Proposition 6.1, p. 32, and Lemma 7.9, p. 37: The normalized interior model is normal and flat with a finite morphism to the product of auxiliary moduli, and it embeds as the dense open preimage of the auxiliary interiors in the normalized toroidal model. [MP19], Introduction, p. 2, and §4.1.4, p. 71: Defines the interior integral model as the normalization of the Siegel integral model in Sh_K and notes it is Kisin's smooth model when p > 2 and the level is hyperspecial.

*Needs:* C7.5; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`; Mathlib `AlgebraicGeometry.IsOpenImmersion`.

**Checks.**

- The interior of the normalized model of the modular curve at level K_0(p) is the normalization of the level-K^p curve in Y_0(p), not the Katz–Mazur moduli scheme a priori; ShimuraVarietiesPartII owns their comparison.

### C7.7 Transitivity and independence of auxiliary choices

Prove (theorem, node `C7/normalization-transitivity`): Let J and J′ be auxiliary Siegel data for (G, X, K) with induced decompositions Σ, Σ′. If there is a finite morphism ∏_{j∈J} 𝒜^{Σ_j}_{K_j} ⊗ O → ∏_{j′∈J′} 𝒜^{Σ′_{j′}}_{K′_{j′}} ⊗ O compatible with the generic maps from Sh^Σ_K (so that Σ = Σ′), then 𝒮^Σ_K(J) ≅ 𝒮^Σ_K(J′) canonically over the generic identification. In particular: the union J ⊔ J′ gives the same model as J whenever the projection of the product onto the J-factors is finite on the image; Zarhin's replacement of a self-dual factor and the direct-sum map from a product of principally polarized Siegel models to a single one do not change the model. In general 𝒮^Σ_K depends on J (Boxer–Pilloni Remark 3.4.21); for PEL data it depends only on the linear-algebraic collection of lattices, not on the auxiliary moduli chosen for them (Lan, Corollary 11.7).

*Hypotheses.*
- Finite morphisms between the auxiliary products compatible with the generic maps; normality and excellence of all bases.

*Proof sketch.*
- Integral closure is transitive: if A → B is finite then the integral closure of B in L equals the integral closure of A in L.
- Apply locally on étale charts of the target product and glue by uniqueness of normalization.
- For Zarhin's replacement and direct sums the morphisms of moduli are finite (C7.2; direct sum of principally polarized abelian schemes has finite fibres by uniqueness of decomposition up to finite ambiguity).
- For PEL collections use the universal property of Lan16 Theorem 11.4, which does not involve the auxiliary choices (C8.6).

*Sources.* [BP], Remark 3.4.21, p. 40: States that the normalized integral model in general depends on the choice of auxiliary spaces A_{g,d_i}. [Lan16], Proposition 7.4 and Corollary 11.7, pp. 36 and 57: Shows the normalized boundary moduli and toroidal model do not depend on the auxiliary moduli problems chosen, only on the linear-algebraic data. [MP19], Remark 4.1.6, p. 72: Shows from the boundary description that 𝒮^Σ_K does not depend on the choice of Σ‡ inducing Σ.

*Needs:* C7.5; C7.2; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization.hom_ext`; Mathlib `integralClosure`.

**Checks.**

- Two auxiliary data related by a finite map of products give canonically isomorphic models; two data with no such map need not.

### C7.8 Normalized boundary towers and twisted torus embeddings

Construct (construction, node `C7/normalized-boundary-tower`): For a cusp label representative Φ of (G, X, K) with induced labels Φ_j, let 𝒮_{K_{Φ_j}}(Q_{Φ_j}, D_{Φ_j}) → 𝒮_{K_{Φ_j}}(Q_{Φ_j}, D̄_{Φ_j}) → 𝒮_{K_{Φ_j},h}(G_{Φ_j,h}, D_{Φ_j,h}) be the integral boundary tower of the good Siegel model (torus torsor over an abelian scheme over a Siegel moduli space of smaller genus, ShimuraCompactifications C5). The normalized boundary tower 𝒮_{K_Φ}(Q_Φ, D_Φ) → 𝒮_{K_Φ}(Q_Φ, D̄_Φ) → 𝒮_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}) is the normalization of the product of these towers in the characteristic-zero tower of Φ (ShimuraCompactifications C1–C2). For a cone σ of Σ(Φ) and σ_j with σ = ∩ preimages, 𝒮_{K_Φ}(Q_Φ, D_Φ, σ) is the normalization of ∏_j 𝒮_{K_{Φ_j}}(Q_{Φ_j}, D_{Φ_j}, σ_j) in Sh_{K_Φ}(Q_Φ, D_Φ); it does not depend on the σ_j, its generic fibre is the twisted toric variety Sh_{K_Φ}(Q_Φ, D_Φ, σ), and the normalization 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) of the closed stratum of the product in the closed stratum Z_{K_Φ}(Q_Φ, D_Φ, σ) carries a finite map to it extending the closed immersion of generic fibres.

*Hypotheses.*
- Φ a cusp label representative; Σ induced from smooth projective Σ_j.

*Proof sketch.*
- Normalize each level of the product tower in the corresponding generic level; the maps of the tower are induced by the universal property of normalization.
- Independence of σ_j: two choices differ by refinement of the auxiliary cones meeting the same relative interior; the normalizations of the corresponding torus embeddings agree on the open orbit and are finite over each other (Harris, Lemma 3.1, via Madapusi Pera 4.1.2).
- Generic fibre: normalization commutes with flat base change to E, and Harris's lemma identifies the generic normalization with the twisted toric variety.

*Sources.* [MP19], §4.1.1–4.1.2, p. 70: Defines the boundary tower of 𝒮_K as the normalization of the Siegel boundary tower in the generic tower, and the normalized twisted torus embedding and its closed stratum. [Lan16], Propositions 7.4, 8.1, 8.4 and 8.7, pp. 36–42: Constructs the normalized boundary moduli M⃗^{Z_H}_H, the normalized abelian torsor C⃗ and torus torsor Ξ⃗ by normalization of the auxiliary boundary objects.

*Uses.* Madapusi Pera Theorem 4.1.5(1),(4),(5): the boundary charts whose completions describe 𝒮^Σ_K; Farb–Kisin–Wolfson Corollary 3.3.18: the torus torsor ξ_K → C_K and its torus embeddings ξ_K(Σ).

The API:
- `NormalizedBoundaryTower` (structure): The three-step tower of normalized boundary models of Φ with its maps.
- `NormalizedBoundaryTower.torusEmbedding` (constructor): For σ ∈ Σ(Φ), the normalized twisted torus embedding 𝒮_{K_Φ}(Q_Φ, D_Φ, σ) and its open immersion of 𝒮_{K_Φ}(Q_Φ, D_Φ).
- `NormalizedBoundaryTower.closedStratum` (constructor): The normalized closed stratum 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) with its finite map into the torus embedding.
- `NormalizedBoundaryTower.generic` (compatibility): Generic fibres are the characteristic-zero tower and twisted toric varieties of ShimuraCompactifications C1–C2.
- `NormalizedBoundaryTower.conj` (functoriality): An arrow Φ_1 → Φ_2 of cusp label representatives with γ·P_{Φ_1} = P_{Φ_2} induces tower isomorphisms and isomorphisms of torus embeddings for σ_2 = int(γ)(σ_1).

*Needs:* C7.4; ShimuraCompactifications C1 (boundary-torsor-tower); ShimuraCompactifications C2 (partial-boundary-charts); ShimuraCompactifications C5 (good-algebraic-model); Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`.

**Checks.**

- `NormalizedBoundaryTower.siegel_test` (degenerate): For the trivial auxiliary datum of a good Siegel datum the normalized tower is the integral Siegel boundary tower of ShimuraCompactifications C5.
- `NormalizedBoundaryTower.tate_test` (computation): For GL_2 at a cusp the tower is 𝔾_m over a finite étale base, σ = ℝ_{≥0} gives the affine line 𝔸¹ ⊃ 𝔾_m and the closed stratum is the zero section.
- `NormalizedBoundaryTower.notTorsor_test` (non-example): Over ℤ_(p), the normalization of the Zariski closure of the generic torsor Spec ℚ[T^{±1}, U^{±1}]/(TU − 1 − p^{-1}) in 𝔾_m² under the diagonal torus has empty special fibre, so normalization alone does not produce a torsor; C10.4 proves the torsor property for Shimura boundaries.
- Generic fibres of the normalized tower are the characteristic-zero boundary tower of ShimuraCompactifications C1–C2.
- The normalized twisted torus embedding does not depend on the auxiliary cones σ_j inducing σ.

### C7.9 Normalized strata of the toroidal model

Construct (construction, node `C7/normalized-stratum-model`): For a cone label Υ = [(Φ, σ)] of (G, X, K, Σ) with image Υ_j in each auxiliary model, let 𝒵_K(Υ) be the normalization of ∏_j 𝒵_{K_j}(Υ_j) (the strata of the good Siegel models) in the characteristic-zero stratum Z_K(Υ) of Sh^Σ_K. There is a canonical isomorphism 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) ≅ 𝒵_K(Υ) extending the generic one, and the map 𝒵_K(Υ) → ∏ 𝒵_{K_j}(Υ_j) ↪ ∏ 𝒜^{Σ_j}_{K_j} lifts to a map 𝒵_K(Υ) → 𝒮^Σ_K extending the locally closed immersion Z_K(Υ) ↪ Sh^Σ_K.

*Hypotheses.*
- Σ induced; the generic identification Z_{K_Φ}(Q_Φ, D_Φ, σ) ≅ Z_K(Υ) uses that the group Δ°_K(Φ) is trivial (Madapusi Pera 4.1.4, using Cartan involutions and 2.1.20).

*Proof sketch.*
- Construct both sides as normalizations of the same auxiliary objects in isomorphic generic fibres and apply uniqueness.
- The lift exists by the universal property of the normalization 𝒮^Σ_K, since 𝒵_K(Υ) is normal and flat with generic fibre in Sh^Σ_K.

*Sources.* [MP19], §4.1.4, p. 71: Defines 𝒵_K(Υ) as the normalization of the auxiliary stratum, identifies it with the normalized closed stratum of the boundary chart, and lifts its map into 𝒮^Σ_K. [Lan16], Definition 9.1 and Lemma 9.12, pp. 48–51: Defines the normalized strata as open and closed pieces of preimages of auxiliary strata.

*Uses.* Madapusi Pera Theorem 4.1.5(2),(3): the stratification of 𝒮^Σ_K by the 𝒵_K(Υ).

The API:
- `normalizedStratum` (constructor): 𝒵_K(Υ) with its map to 𝒮^Σ_K.
- `normalizedStratum_iso_closedStratum` (equivalence): 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) ≅ 𝒵_K(Υ), extending the generic isomorphism.
- `normalizedStratum_generic` (compatibility): The generic fibre of 𝒵_K(Υ) → 𝒮^Σ_K is the locally closed immersion Z_K(Υ) ↪ Sh^Σ_K.

*Needs:* C7.8; C7.5; ShimuraCompactifications C2 (arithmetic-gluing).

**Checks.**

- `normalizedStratum_interior_test` (degenerate): For the cone label of the trivial cusp (Φ = (G, X^+, 1), σ = 0), 𝒵_K(Υ) is a component of the interior 𝒮_K.
- `normalizedStratum_cusp_test` (computation): For a neat modular curve at a cusp of width w, 𝒵_K(Υ) is a finite étale O-scheme of the cusp's field of definition.
- `normalizedStratum_notClosed_test` (non-example): 𝒵_K(Υ) → 𝒮^Σ_K is not a closed immersion for Υ of positive codimension in the closure order; its image closure contains smaller strata (C10.5).
- The generic fibre of 𝒵_K(Υ) → 𝒮^Σ_K is the locally closed stratum of Sh^Σ_K.
- 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) ≅ 𝒵_K(Υ) canonically.

### C7.10 Normalized models over the cyclotomic integers

Construct (construction, node `C7/cyclotomic-normalized-model`): Let ℤ_p^cycl := ℤ_p[ζ_{p^∞}] = ⋃_m ℤ_p[ζ_{p^m}] (the noncompleted union) and ℚ_p^cycl its fraction field. For J and Σ as in C7.5 with O = ℤ_p (E_v = ℚ_p, or after base change), 𝒮^Σ_{K,ℤ_p^cycl} is the normalization of ∏_j 𝒜^{Σ_j}_{K_j} ⊗ ℤ_p^cycl in Sh^Σ_K ⊗ ℚ_p^cycl. It is the inverse limit (union of rings on affines) of the normalizations 𝒮^Σ_{K,ℤ_p[ζ_{p^m}]}; it is normal and flat over ℤ_p^cycl and not noetherian; its interior is the analogous normalization of the interiors; and the natural map to 𝒮^Σ_K ⊗_{ℤ_p} ℤ_p^cycl is integral and an isomorphism over the generic fibre, but in general not an isomorphism.

*Hypotheses.*
- ℤ_p^cycl denotes the union ℤ_p[ζ_{p^∞}], not its p-adic completion; the p-adically completed variant is the p-adic completion of this model.
- No noetherian hypothesis is available, so finiteness is proved at each finite level m and passed to the limit.

*Proof sketch.*
- At each m, ℤ_p[ζ_{p^m}] is a complete discrete valuation ring and C7.5 applies with O = ℤ_p[ζ_{p^m}].
- Integral closure commutes with filtered unions of the coefficient rings: an element integral over ⋃ R_m is integral over some R_m, so the normalization over ℤ_p^cycl is the colimit of rings of the normalizations at finite level on affine charts.
- Normality and flatness pass to filtered colimits with flat transition maps; ℤ_p^cycl is a valuation ring whose value group is not discrete, hence it is not noetherian.
- Non-isomorphism with base change: already for the modular curve at level Γ_1(p), the base change of the normalization over ℤ_p to ℤ_p[ζ_p] is not normal.

*Sources.* [BP], §3.4.19, Remark 3.4.22 and §3.4.23, p. 40: Defines the model over ℤ_p^cycl as the normalization of the product of auxiliary spaces base changed to ℤ_p^cycl and remarks that the map to the base change of the ℤ_p-model is in general not an isomorphism.

*Uses.* IgusaVarietiesAndTorsionConcentration Part II (Boxer–Pilloni Lemma 3.4.24): the ordinary Igusa formal scheme embeds openly into the p-adic completion of the ℤ_p^cycl model; Boxer–Pilloni §3.4.17: the perfectoid and Igusa comparisons take place over ℤ_p^cycl.

The API:
- `CyclotomicNormalizedModel` (constructor): 𝒮^Σ_{K,ℤ_p^cycl} with its finite map to ∏ 𝒜^{Σ_j}_{K_j} ⊗ ℤ_p^cycl.
- `CyclotomicNormalizedModel.colimit` (characterisation): On affine opens of the product its ring of functions is the union over m of the rings of 𝒮^Σ_{K,ℤ_p[ζ_{p^m}]}.
- `CyclotomicNormalizedModel.toBaseChange` (data): The integral map 𝒮^Σ_{K,ℤ_p^cycl} → 𝒮^Σ_K ⊗ ℤ_p^cycl, an isomorphism after inverting p.
- `CyclotomicNormalizedModel.normal_flat` (other): 𝒮^Σ_{K,ℤ_p^cycl} is normal and flat over ℤ_p^cycl.

*Needs:* C7.5; Mathlib `IsCyclotomicExtension`; Mathlib `integralClosure`.

**Checks.**

- `CyclotomicNormalizedModel.trivial_test` (degenerate): For the Siegel datum at hyperspecial level, the ℤ_p^cycl model is the base change 𝒜^Σ_K ⊗ ℤ_p^cycl, which is already normal.
- `CyclotomicNormalizedModel.notIso_test` (non-example): For GL_2 at full level K = K^pK(p), the scheme of connected components of the generic fibre is Spec ℚ_p(ζ_p) (Weil pairing), whose normalization over ℤ_p is Spec ℤ_p[ζ_p]. Its base change to ℤ_p^cycl is Spec(ℤ_p[ζ_p] ⊗_{ℤ_p} ℤ_p^cycl), which is not normal: its generic fibre is a product of p − 1 copies of ℚ_p^cycl while its special fibre is local. Hence 𝒮_{K,ℤ_p^cycl} → 𝒮_K ⊗ ℤ_p^cycl is not an isomorphism.
- `CyclotomicNormalizedModel.notNoetherian_test` (non-example): ℤ_p^cycl is not noetherian: the ideals (ζ_{p^m} − 1) form a strictly increasing chain whose union is the maximal ideal, which is not finitely generated.
- The ℤ_p^cycl model is the union of the models over ℤ_p[ζ_{p^m}].
- Its map to the base change of the ℤ_p model is an isomorphism after inverting p but not in general.

## Layer C8: Normalized PEL compactifications with lattice collections

Lan's theory (Forum Math. Sigma 2016) for PEL data with a collection J of lattices at arbitrary level and ramification at p: normalized interior and minimal models (Propositions 6.1, 6.4) with the extended polarized abelian schemes and the ample Hodge line; normalized toroidal models and the Proj description of the minimal model (Lemma 7.9, Proposition 7.11); putative boundary charts by normalization (§8); stratification, formal completions along strata and flatness of strata (Theorems 9.13, 10.13, Corollaries 10.15–10.18); degenerating families over the toroidal model, the universal property and independence of auxiliary choices (Theorems 11.2, 11.4, Corollary 11.7); strata of the minimal model (Theorem 12.16); level changes, subcollections and Hecke twists (§13); transfer of local properties, regularity and the lci property from the interior (Propositions 14.1–14.2); and the minimal-model input that Lan's 2017 normalized blow-ups (ShimuraCompactifications C5.31) require.

*Layer dependencies:* C7, ShimuraCompactifications C4, ShimuraCompactifications C5, PELModuli M1, PELModuli M2.

### C8.1 PEL data with a collection of lattices

Define (definition, node `C8/pel-lattice-collection`): Fix an integral PEL datum (O, ⋆, L, ⟨·,·⟩, h_0) with reflex field F_0 satisfying Lan's condition 1.4.3.10, a prime p (with no unramifiedness assumption), and an open compact H ⊂ G(Ẑ) whose image in G(Ẑ^p) is neat. A lattice collection is a finite family {(g_j, L_j, ⟨·,·⟩_j)}_{j∈J}, where g_j ∈ G(𝔸_f), L_j ⊂ L ⊗ ℚ is an O-lattice with a pairing ⟨·,·⟩_j that is a rational multiple of ⟨·,·⟩ and integral on L_j, stable under g_jHg_j^{-1}. Each j defines a PEL moduli problem M_{H_j} isomorphic to M_H in characteristic zero (by g_j-translated quasi-isogeny), and for each j an auxiliary good-reduction moduli problem M_{H_j,aux} over O_{F_{0,j,aux},(p)} obtained by Zarhin's trick when ⟨·,·⟩_j is not prime to p, by restricting the O-action to a subalgebra unramified at p, and by keeping only the level away from p. The collection J determines the morphism M_H → ∏_{j∈J} M_{H_j,aux} ⊗ ℚ.

*Hypotheses.*
- Lan's condition 1.4.3.10 on the integral PEL datum (achievable by modifying the integral data).
- H^p neat; no hypothesis on the level at p, on ramification of O at p or on the residue characteristic.

*Proof sketch.*
- Define each M_{H_j} as Lan's moduli problem for the j-th lattice; the characteristic-zero isomorphism M_H ≅ M_{H_j} is the quasi-isogeny twist of Lan16 §3.
- Construct the auxiliary problems and the morphisms (4.13)–(4.15) as in Lan16 §4: Zarhin's trick (C7.2), restriction of the endomorphism structure, and level away from p.

*Sources.* [Lan16], §2, Examples 2.3–2.5, pp. 6–8; §§3–4, pp. 8–24: Sets up PEL moduli at arbitrary level and ramification with a collection of lattices twisted by group elements, and auxiliary good-reduction moduli problems with morphisms to them (Zarhin's trick, restricted endomorphisms, level away from p).

*Uses.* Lan16 Propositions 6.1, 6.4 and §7: the collection indexes the auxiliary product that is normalized; Pilloni Theorem 6.1.5.1, p. 29: the Klingen model is the collection {V_1 ⊂ V} and the paramodular model the singleton {V_1}; Lan17 Theorem 6.1, as used by ShimuraCompactifications C5.31: the minimal model input is indexed by the same collection J.

The API:
- `PELLatticeCollection` (structure): The family (g_j, L_j, ⟨·,·⟩_j)_{j∈J} with its stability under H and its integrality.
- `PELLatticeCollection.moduli` (data): For each j the moduli problem M_{H_j} and the characteristic-zero isomorphism M_H ≅ M_{H_j}.
- `PELLatticeCollection.aux` (data): For each j the auxiliary good-reduction moduli problem M_{H_j,aux} and the morphism M_H → M_{H_j,aux} ⊗ ℚ.
- `PELLatticeCollection.sub` (functoriality): For J′ ⊂ J and H ⊂ H′ satisfying the conditions for H′, the subcollection defines a lattice collection for H′.
- `PELLatticeCollection.toAuxiliarySiegel` (compatibility): For PEL data of type A or C the auxiliary moduli are Siegel moduli and the collection gives an auxiliary Siegel datum in the sense of C7.1.

*Needs:* PELModuli M1; PELModuli M2; C7.2.

**Checks.**

- `PELLatticeCollection.singleton_test` (degenerate): For J = {(1, L, ⟨·,·⟩)} with p good, M_{H_j,aux} = M_H over O_{F_0,(p)} (Lan16 Example 2.3).
- `PELLatticeCollection.parahoric_test` (computation): For a self-dual multichain of lattices L_0 ⊂ L_1 ⊂ ⋯ ⊂ L_m = p^{-1}L_0 and J ⊂ {0, …, m}, the collection {L_j}_{j∈J} defines the parahoric problem of Lan16 Example 2.4; different J give in general different normalized models.
- `PELLatticeCollection.paramodular_test` (computation): For GSp_4 and the lattice V_1 = pe_1ℤ ⊕ e_2ℤ ⊕ e_3ℤ ⊕ e_4ℤ with the restricted form, the singleton {V_1} gives the moduli of abelian surfaces with a polarization of degree p² (Pilloni §6.1.3).
- `PELLatticeCollection.notGood_test` (non-example): For the paramodular singleton the moduli problem M_{H_j} is not smooth over ℤ_p, so it cannot serve as its own auxiliary model; Zarhin's trick is required.
- Every PEL datum and level with neat prime-to-p part admits a lattice collection with auxiliary good moduli.
- For the singleton good-prime collection the auxiliary moduli problem is M_H itself.

### C8.2 Normalized interior and minimal models

Construct (construction, node `C8/pel-normalized-minimal`): For a lattice collection J (C8.1), let M⃗_H be the normalization of ∏_{j∈J} M_{H_j,aux} in M_H, and M⃗^min_H the normalization of ∏_{j∈J} M^min_{H_j,aux} in M_H, where M^min_{H_j,aux} are the good-reduction minimal compactifications. Then: M⃗_H is a normal algebraic stack, flat over S⃗_0 = Spec O_{F_0,(p)}, with generic fibre M_H and a finite morphism to ∏ M_{H_j,aux}; for each j the tautological object over M_H extends to a polarized abelian scheme with O-structure (A⃗_j, λ⃗_j, i⃗_j) over M⃗_H satisfying the determinant condition, with level structure only over M_H; ω_{M_H} extends to ω_{M⃗_H, j} = ∧^top Lie^∨ A⃗_j. M⃗^min_H is a normal projective flat scheme over S⃗_0 containing M⃗_H as an open dense subscheme, with a finite morphism to ∏ M^min_{H_j,aux}, on which the line bundle ω_{M⃗^min_H, J}, the pullback of the external tensor product of ω^{⊗a_{j,0}}, is ample and restricts to ω^{⊗a_J}_{M_H} with a_J = Σ_j a_j.

*Hypotheses.*
- As in C8.1; a_{j,0}, a_j ≥ 1 are the integers of Lan16 Lemma 5.30 making the auxiliary Hodge powers descend and be ample.

*Proof sketch.*
- Normalize the product of auxiliary interiors and of auxiliary minimal compactifications in M_H (finite over excellent bases, hence finite).
- Extend each tautological abelian scheme: the auxiliary one pulled back from M_{H_j,aux} is determined by A_j via Lan16 Lemma 4.1 (Zarhin), and the O-structure extends uniquely over the noetherian normal base by extension of homomorphisms (ShimuraCompactifications C4).
- Ampleness: the pullback of an ample line bundle under a finite morphism is ample; projectivity and normality of M⃗^min_H follow; its restriction to M_H is ω^{a_J} by Lan16 Lemma 5.30.

*Sources.* [Lan16], Proposition 6.1, pp. 32–34, and Proposition 6.4, pp. 34–35: Defines the normalized interior and minimal models by normalization of products of auxiliary good-reduction models, proves normality, flatness, finiteness over the auxiliary products, the extension of the tautological polarized abelian schemes over the interior, and ampleness of the extended Hodge line on the minimal model.

*Uses.* ShimuraCompactifications C5.31 (Lan17 Theorem 6.1): the normal projective flat minimal model M̃^min_{H,J} that its normalized blow-ups require; Pilloni §6.2.2, p. 30: the paramodular minimal compactification X^⋆_par; Pilloni pp. 71–72 and 101: the Klingen minimal compactification X^⋆_Kli(p).

The API:
- `PELNormalizedModel` (constructor): M⃗_H with its finite map to ∏ M_{H_j,aux} and generic identification.
- `PELNormalizedModel.family` (data): For each j the polarized abelian scheme with O-structure (A⃗_j, λ⃗_j, i⃗_j) over M⃗_H extending the tautological one.
- `PELNormalizedMinimal` (constructor): M⃗^min_H with its finite map to ∏ M^min_{H_j,aux}, containing M⃗_H as an open dense subscheme.
- `PELNormalizedMinimal.ample` (other): ω_{M⃗^min_H, J} is ample and restricts to ω^{⊗a_J} on M_H.
- `PELNormalizedMinimal.projective_normal_flat` (other): M⃗^min_H is projective, normal and flat over S⃗_0.

*Needs:* C8.1; ShimuraCompactifications C5 (integral-minimal-space); ShimuraCompactifications C5 (minimal-hodge-ampleness); ShimuraCompactifications C4 (homomorphism-extension); Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`.

**Checks.**

- `PELNormalizedMinimal.good_test` (compatibility): At a good prime with the singleton collection, M⃗^min_H is the integral minimal compactification of ShimuraCompactifications C5.16.
- `PELNormalizedMinimal.modular_test` (computation): For GL_2 at level K_0(p) with neat prime-to-p level, M⃗^min_H is the coarse compactified curve X_0(p) over ℤ_(p) and ω^{⊗12} has the section Δ.
- `PELNormalizedModel.levelOnlyGeneric_test` (non-example): For the singleton paramodular collection the level-p structure of the tautological object is not defined over the special fibre; only the polarization of degree p² is.
- M⃗^min_H is normal, projective and flat over S⃗_0 with ample ω_J.
- At a good prime with the singleton collection it is the good-prime minimal compactification.

### C8.3 Normalized toroidal models and their contraction

Prove (theorem, node `C8/pel-normalized-toroidal`): Let Σ_j be compatible smooth projective admissible cone decompositions for the auxiliary problems and Σ the induced (possibly nonsmooth) decomposition for M_H. The normalization M⃗^tor_{H,Σ} of ∏_j M^tor_{H_j,aux,Σ_j} in M_H is a scheme proper and flat over S⃗_0 with a finite morphism to the auxiliary product; M⃗_H is the dense open preimage of the auxiliary interiors; the auxiliary contractions induce a proper morphism ∮⃗_H : M⃗^tor_{H,Σ} → M⃗^min_H, and M⃗^min_H ≅ Proj(⊕_{k≥0} Γ(M⃗^tor_{H,Σ}, ω^{⊗k}_{J})) compatibly with ∮⃗_H.

*Hypotheses.*
- Σ_j smooth projective with Lan's condition 6.2.5.25; Σ induced by pulling back products of cones (C7.3).

*Proof sketch.*
- Proper flatness from finiteness over the proper smooth auxiliary product and torsion-freeness; the open dense interior by Zariski's main theorem.
- The contraction is induced from the auxiliary contractions by the universal property of normalization.
- The Proj comparison: the pullback of ω_J is ample over M⃗_H, the Proj maps finitely to M⃗^min_H and is an isomorphism over M⃗_H, so it is an isomorphism by normality (Zariski's main theorem).

*Sources.* [Lan16], (7.7)–(7.8), Lemma 7.9 and Proposition 7.11, pp. 37–38: Defines the normalized toroidal model from the product of auxiliary toroidal compactifications, proves it proper flat with dense interior, and identifies the normalized minimal model with the Proj of the sections of powers of the pulled-back Hodge line.

*Needs:* C8.2; C7.3; ShimuraCompactifications C5 (integral-toroidal-space); ShimuraCompactifications C5 (integral-minimal-space).

**Checks.**

- For the singleton good-prime collection and smooth Σ this is the good-prime toroidal model (Lan16 Corollary 11.8).

### C8.4 Putative boundary charts by normalization

Construct (construction, node `C8/pel-putative-charts`): For a cusp label representative (Z_H, Φ_H, δ_H) of M_H, inducing auxiliary representatives for each j, define by normalization of the corresponding auxiliary boundary objects in the characteristic-zero ones: the normalized boundary moduli M⃗^{Z_H}_H (with degenerating families of the boundary abelian parts), the normalized abelian-scheme torsor C⃗_{Φ_H,δ_H} → M⃗^{Z_H}_H (proper), the E_{Φ_H}-torsor Ξ⃗_{Φ_H,δ_H} → C⃗_{Φ_H,δ_H} for the split torus E_{Φ_H} with character group S_{Φ_H}, and for each σ ∈ Σ_{Φ_H} the affine torus embedding Ξ⃗_{Φ_H,δ_H}(σ) with its σ-stratum Ξ⃗_{Φ_H,δ_H,σ}, the preimage of the auxiliary strata. If σ is smooth, Ξ⃗(σ) → C⃗ is smooth and surjective, Ξ⃗_σ is an E_{Φ_H,σ}-torsor over C⃗, smooth over C⃗ and hence flat over S⃗_0 when C⃗ is.

*Hypotheses.*
- Same setting as C8.3; σ ⊂ P^+_{Φ_H}.

*Proof sketch.*
- Normalize the auxiliary boundary moduli in the characteristic-zero boundary moduli (Lan16 Proposition 7.4), then the auxiliary abelian torsors and torus torsors (Propositions 8.1, 8.4, 8.7).
- The torus E_{Φ_H} acts on the normalization because it acts compatibly on the auxiliary torsors and on the generic fibre; Proposition 8.14 shows that for smooth σ the normalized torus embedding is the relative torus embedding of a torsor, by comparing with the auxiliary embeddings along the finite map of tori.
- Lemma 8.20 identifies the σ-stratum with the preimage of the auxiliary strata.

*Sources.* [Lan16], Propositions 7.4, 8.1, 8.4, 8.7 and 8.14, Lemma 8.20, pp. 36–45: Constructs the normalized boundary moduli, abelian torsors, torus torsors and torus embeddings by normalization, proves the torsor and smoothness statements for smooth cones, and identifies the closed strata.

*Uses.* Lan16 Theorems 9.13 and 10.13: the strata and formal completions of M⃗^tor are compared with these charts; Pilloni §6.1.5.2, pp. 27–28: the towers M_{W,γ,par} → B_{W,γ,par} → Y_{W,γ,par} and their Klingen analogues are instances.

The API:
- `PutativeBoundaryChart` (structure): The tower Ξ⃗ → C⃗ → M⃗^{Z_H}_H with the E_{Φ_H}-action on Ξ⃗.
- `PutativeBoundaryChart.embedding` (constructor): For σ ∈ Σ_{Φ_H}, the torus embedding Ξ⃗(σ) ⊃ Ξ⃗ and its σ-stratum.
- `PutativeBoundaryChart.smooth_of_smoothCone` (other): For smooth σ, Ξ⃗(σ) → C⃗ is smooth and surjective and Ξ⃗_σ is an E_{Φ_H,σ}-torsor over C⃗.
- `PutativeBoundaryChart.formalCompletion` (constructor): The formal completion X⃗_{Φ_H,δ_H,σ} of Ξ⃗(σ) along Ξ⃗_σ, with its Mumford family.
- `PutativeBoundaryChart.generic` (compatibility): In characteristic zero these are the boundary objects of Lan's book.

*Needs:* C8.3; ShimuraCompactifications C5 (good-algebraic-model); ShimuraCompactifications C1 (boundary-torsor-tower); ShimuraCompactifications C0.

**Checks.**

- `PutativeBoundaryChart.good_test` (degenerate): At a good prime with the singleton collection the charts are those of ShimuraCompactifications C5.1.
- `PutativeBoundaryChart.tate_test` (computation): For the modular curve at a cusp, M⃗^{Z_H}_H is finite over S⃗_0, C⃗ = M⃗^{Z_H}_H, Ξ⃗ is a 𝔾_m-torsor and Ξ⃗(ℝ_{≥0}) its line bundle.
- `PutativeBoundaryChart.nonsmooth_test` (non-example): For a nonsmooth two-dimensional cone σ ⊂ ℝ² with rays (1, 0), (1, 2), the affine torus embedding Spec ℤ[x, xy, xy²] is singular at the closed orbit, so Ξ⃗(σ) is not smooth over C⃗.
- For smooth σ, Ξ⃗(σ) is smooth over C⃗ and its σ-stratum is a torsor.
- At a good prime the charts are those of Lan's book.

### C8.5 Strata and formal completions of normalized PEL models

Prove (theorem, node `C8/pel-strata-completions`): In the setting of C8.3: (1) M⃗^tor_{H,Σ} is stratified by locally closed subschemes Z⃗[(Φ_H, δ_H, σ)] indexed by equivalence classes with σ ⊂ P^+_{Φ_H}, σ ∈ Σ_{Φ_H}, each open and closed in the preimage of the corresponding auxiliary stratum, with Z⃗[τ′] in the closure of Z⃗[τ] if and only if τ is a face of τ′; (2) the formal completion of M⃗^tor_{H,Σ} along Z⃗[(Φ_H, δ_H, σ)] is canonically isomorphic to the quotient of X⃗_{Φ_H,δ_H,σ} by the stabilizer, compatibly with the auxiliary completions; (3) each stratum is isomorphic to Ξ⃗_{Φ_H,δ_H,σ}, an E_{Φ_H,σ}-torsor over C⃗_{Φ_H,δ_H}, hence flat over S⃗_0 and normal, proper over M⃗^{Z_H}_H when σ is top-dimensional; (4) M⃗_H ⊗ 𝔽_p is dense in M⃗^tor_{H,Σ} ⊗ 𝔽_p, and closure relations of strata hold fibrewise in characteristic p.

*Hypotheses.*
- Same setting; strata use the reduced structure.

*Proof sketch.*
- Strata: compare with the auxiliary strata through the finite map (7.8) and the universal property (Lan16 Lemmas 9.3–9.12, Theorem 9.13).
- Completions: the canonical map from the putative chart completion to the completion of M⃗^tor is finite, and both sides are excellent normal and flat with isomorphic rational fibres after refining to a common smooth refinement (Lan16 (10.1)–(10.14)); Zariski's main theorem gives Theorem 10.13.
- Corollary 10.15 reads off the strata; density of the interior special fibre (Corollary 10.18) follows from flatness of the strata and the description of completions; Corollary 11.9 gives fibrewise closure relations.

*Sources.* [Lan16], Theorem 9.13, p. 51; Theorem 10.13, pp. 53–54; Corollaries 10.15 and 10.18, pp. 54–55; Corollary 11.9, p. 57: Proves the stratification of the normalized toroidal model with its incidence relation, the isomorphism of formal completions with the putative charts, the torsor description and flatness of the strata, and density of the interior in the special fibre.

*Needs:* C8.4; C8.3; ShimuraCompactifications C5 (formal-completion).

**Checks.**

- No irreducible component of M⃗^tor_{H,Σ} ⊗ 𝔽_p lies in the boundary.
- For the singleton good-prime collection and smooth Σ the stratification is that of Lan's book (Lan16 Corollary 11.8).

### C8.6 Degenerating families and the universal property

Prove (theorem, node `C8/pel-degenerating-families`): (1) For each j ∈ J the polarized abelian scheme (A⃗_j, λ⃗_j, i⃗_j) over M⃗_H extends to a degenerating family (G⃗_j, λ⃗_j, i⃗_j, α⃗_{H_j}) of type M_{H_j} over M⃗^tor_{H,Σ} (a semi-abelian scheme with polarization and O-structure, abelian over M⃗_H), whose pullback to each completed chart X⃗_{Φ_H,δ_H,σ} is the Mumford family. (2) Universal property: if S is an irreducible noetherian normal S⃗_0-scheme with generic point η, η → M_H, and for each j a degenerating family of type M_{H_j} over S inducing η → M_{H_j}, then η → M_H extends (uniquely) to S → M⃗^tor_{H,Σ} if and only if at each geometric point of S the degeneration data lie in a cone of Σ (Lan16 Theorem 7.14's condition). (3) Consequently M⃗^tor_{H,Σ} depends only on the lattice collection, not on the auxiliary choices.

*Hypotheses.*
- Same setting; level structures of the extended families are defined only over M_H.

*Proof sketch.*
- Write M⃗^tor as an increasing union of opens U_i with U_0 = M⃗_H, each U_{i+1} ∖ U_i a closed stratum; extend the family across each stratum using the Mumford family on its completed chart and fpqc descent (Lan16 Lemma 11.1).
- For (2), the degenerating families of type M_{H_j} determine auxiliary families over S by Lan16 Proposition 5.24, unique by extension of homomorphisms over normal bases, and Theorem 7.14 applies.
- (3) is Lan16 Corollary 11.7: the universal property of (2) involves no auxiliary data.

*Sources.* [Lan16], Lemma 11.1, Theorem 11.2, Theorem 11.4 and Corollary 11.7, pp. 55–57; Theorem 7.14, p. 38: Extends the tautological families over the normalized toroidal model, proves the universal property for degenerating families over noetherian normal bases, and deduces independence of auxiliary choices.

*Needs:* C8.5; ShimuraCompactifications C4 (homomorphism-extension); ShimuraCompactifications C4 (degeneration-effectivity); ShimuraCompactifications C4 (mumford-quotient).

**Checks.**

- For the Siegel collection of Boxer–Pilloni §3.4.19 this gives semi-abelian G over A^tor_{g,d} extending the universal abelian scheme, with G^∨ and λ from the j-family (C13/siegel-bad-level-toroidal).

### C8.7 Strata of normalized minimal models

Prove (theorem, node `C8/pel-minimal-strata`): M⃗^min_H is stratified by locally closed subschemes Z⃗[(Φ_H, δ_H)] indexed by cusp labels, each canonically isomorphic to the normalized boundary moduli M⃗^{Z_H}_H; the contraction ∮⃗_H maps the toroidal stratum Z⃗[(Φ_H, δ_H, σ)] onto Z⃗[(Φ_H, δ_H)], and this surjection is the composite of Z⃗[(Φ_H, δ_H, σ)] ≅ Ξ⃗_{Φ_H,δ_H,σ} → M⃗^{Z_H}_H with the stratum isomorphism; it is proper when σ is top-dimensional. The fibres of ∮⃗_H are geometrically connected.

*Hypotheses.*
- Same setting.

*Proof sketch.*
- Strata of M⃗^min_H are defined via the auxiliary minimal strata and the finite map (6.6) (Lan16 Theorem 12.1).
- Geometric connectedness of fibres of ∮⃗_H: Stein factorization and normality (Lan16 Lemma 12.9).
- Identification of the strata with M⃗^{Z_H}_H by comparing formal completions of strict local rings (Lan16 Proposition 12.14, Theorem 12.16).

*Sources.* [Lan16], Theorem 12.1, p. 58; Lemma 12.9 and Proposition 12.14, pp. 60–61; Theorem 12.16, p. 62: Stratifies the normalized minimal model by cusp labels with strata isomorphic to the normalized boundary moduli, and describes the contraction on strata.

*Needs:* C8.5; C8.3; ShimuraCompactifications C5 (integral-minimal-space).

**Checks.**

- For the modular curve the strata of M⃗^min_H are the interior and the finite flat cusps.

### C8.8 Level changes and Hecke twists of normalized PEL models

Prove (theorem, node `C8/pel-functoriality`): (1) For H ⊂ H′ and a subcollection J′ ⊂ J satisfying the conditions for H′, there are canonical morphisms M⃗_{H,J} → M⃗_{H′,J′}, M⃗^min_{H,J} → M⃗^min_{H′,J′} and, for compatible Σ, Σ′, M⃗^tor_{H,Σ,J} → M⃗^tor_{H′,Σ′,J′}, extending the characteristic-zero maps and mapping strata to strata. (2) Hecke twists by g ∈ G(𝔸_f^p) act compatibly. (3) These morphisms are proper but need not be finite, even on the interior: for a lattice-chain collection mapping to a singleton subcollection the map can contract curves (Lan16 Remark 13.10 and Example 13.12).

*Hypotheses.*
- Same setting; compatibility of Σ and Σ′ means each cone of Σ maps into a cone of Σ′.

*Proof sketch.*
- Induce the morphisms from projections of the auxiliary products onto the J′-factors and the universal property of normalization (Lan16 Proposition 13.1).
- Toroidal and minimal versions as in Lan16 Propositions 13.4–13.9; Hecke twists by changing g_j (Lan16 Example 13.14, Propositions 13.15–13.19).
- The non-finiteness example is Lan16 Example 13.12.

*Sources.* [Lan16], Propositions 13.1, 13.4, 13.7, 13.9, Remark 13.10, Examples 13.11–13.14, Propositions 13.15 and 13.19, pp. 62–68: Constructs the functorial morphisms for level change and subcollections, the Hecke twists, and shows by example that lattice-chain-to-singleton maps can be nonfinite.

*Needs:* C8.6; C8.7; ShimuraCompactifications C3 (level-datum-functoriality).

**Checks.**

- The Klingen-to-spherical and Klingen-to-paramodular maps of Pilloni are instances with J′ ⊂ J (C14.5).

### C8.9 Local properties pass from the interior to the boundary

Prove (theorem, node `C8/pel-local-properties`): Let P be one of: reduced, geometrically reduced, normal, geometrically normal, Cohen–Macaulay, (R_0), geometric (R_0), (R_1), geometric (R_1), (S_i) for some i. A fibre of M⃗^tor_{H,Σ} → S⃗_0 has P if and only if the corresponding fibre of M⃗_H does. If Σ is smooth, P may also be regular, geometrically regular, (R_i) or geometric (R_i); in particular M⃗_H is regular if and only if M⃗^tor_{H,Σ} is. If Σ is smooth and M⃗_H is a local complete intersection over S⃗_0 then so is M⃗^tor_{H,Σ}.

*Hypotheses.*
- Same setting; the last two assertions require Σ smooth.

*Proof sketch.*
- By Lan16 Theorems 9.13 and 10.13 every complete local ring of M⃗^tor at a point s of a stratum Z⃗[(Φ_H, δ_H, σ)] is a complete local ring of Ξ⃗(σ) at a point of Ξ⃗_σ; the points of Spec of this ring off the boundary lie over points of M⃗_H, and every point of Ξ⃗ generizes a point of Ξ⃗_σ.
- Hence a property P of excellent local rings that ascends and descends along flat local maps with geometrically regular fibres (completion, smooth morphisms; EGA IV₂ 6.5.3 and 7.8.3) passes from M⃗_H to Ξ⃗, from Ξ⃗ to C⃗ along the smooth surjection Ξ⃗ → C⃗, and back up to Ξ⃗(σ) and to M⃗^tor when Ξ⃗(σ) → C⃗ is smooth (σ smooth); this is Lan16 Propositions 14.1–14.2.
- The lci assertion is not stated by Lan16; it follows by the same argument, since for a flat local homomorphism with regular closed fibre the source is a complete intersection if and only if the target is (Avramov's theorem on flat maps of complete intersections), and the lci locus is detected on completions.

*Sources.* [Lan16], Propositions 14.1–14.2 and Corollary 14.4, pp. 69–70: Proves that regularity (for smooth Σ) and the listed fibre properties hold for the normalized toroidal model exactly when they hold for the normalized interior. [Pilloni20], proof of Theorem 6.1.5.1(4), p. 29: Deduces normality and the lci property of the Klingen and paramodular toroidal models from the local charts, the interior lci property and the boundary modular curves.

*Needs:* C8.5; C8.4; SchemeAndStackFoundations SF.0.

**Checks.**

- For the paramodular singleton and smooth Σ the toroidal model is lci over ℤ_p because the interior is (C14.4).

### C8.10 Minimal-model input for normalized blow-ups

Prove (comparison, node `C8/normalized-blowup-input`): For a lattice collection J and the normalized minimal model M⃗^min_{H,J} of C8.2, the hypotheses on M̃^min_{H,J} in ShimuraCompactifications C5.31 (Lan17 Theorem 6.1: a normal projective flat model over S̃_0 of the minimal compactification, with open normalized interior carrying the J-indexed tautological families) are satisfied by M⃗^min_{H,J}. Consequently, for every compatible projective cone decomposition Σ with polarization function pol (individual cones not necessarily smooth), Lan's normalized blow-up toroidal model M⃗^tor_{H,Σ,J} exists at every prime p with H^p neat, with formal torus-torsor charts and J-indexed families; when Σ is induced from smooth projective auxiliary decompositions it is canonically isomorphic to the normalized toroidal model of C8.3.

*Hypotheses.*
- H^p neat; Σ projective and satisfying Lan's condition 6.2.5.25.

*Proof sketch.*
- Normality, projectivity and flatness of M⃗^min_{H,J}, its open interior and its families are C8.2 and C8.3.
- Apply ShimuraCompactifications C5.31 with this input.
- For induced Σ, both models are normal, proper over M⃗^min_{H,J}, contain M⃗_H densely and have the same completed charts over a common smooth refinement (Lan17 §§4–5 compare with Lan16 §8); Zariski's main theorem identifies them.

*Sources.* [Lan17], Introduction, pp. 1–2; Theorem 6.1, pp. 22–24: Constructs normalized blow-ups of the normalized minimal compactifications of Lan16 for all projective cone decompositions and compares them with the normalization models of Lan16 §7 through the putative boundary charts. [Lan16], Propositions 6.1 and 6.4, pp. 32–35: Supplies the normal projective flat minimal model and its interior families used as input.

*Needs:* C8.2; C8.3; ShimuraCompactifications C5 (projective-normalized-blowup).

**Checks.**

- For Pilloni's Klingen and paramodular data this gives X_Kli(p)_{K,Σ} and X_{par,K,Σ} for good projective Σ (Pilloni Theorem 6.1.5.1, a special case of Lan17 Theorem 6.1).

## Layer C9: Hodge cycles on degenerating abelian varieties

The p-adic Hodge theory input of Madapusi Pera §§1 and 3.1–3.5: realizations of 1-motives (étale, de Rham, Betti) with weight and Hodge filtrations; absolute Hodge tensors on boundary 1-motives (Brylinski) and their descent to canonical models; agreement of the tensors of the 1-motive and of the abelian scheme near the boundary; the log Dieudonné crystal of a degenerating abelian scheme over a complete normal local base (Proposition 1.3.5, Appendix A.1); the semistable comparison for abelian varieties with semi-abelian reduction and the Coleman–Iovita criterion (Proposition 1.4.10, Theorem 6); the canonical φ-module at a boundary point of the Siegel chart with its weight filtration and monodromy (§3.2); canonical crystalline tensors matching étale and de Rham tensors (Corollary 3.3.9) with stabilizer G_{K_0} by Steinberg's theorem; and the crystalline rationality theorem K_0 ⊗ B_G ≅ (Lie U_wt,G)(−1) (Theorem 3.4.3(1), §3.5).

*Layer dependencies:* ShimuraCompactifications C1, ShimuraCompactifications C4, AutomorphicBundles B1, HodgeTateAndCanonicalSubgroups T1, CrystallineCohomology CR.5, CrystallineCohomology CR.6, CohomologyComparisons CP.4, NeronModelsAndSemistableAbelianVarieties R11.3, ReductiveGroupsPartII RG2.1.

### C9.1 Realizations of 1-motives

Define (definition, node `C9/one-motive-realizations`): Let S be a scheme and Q = [Y → G] a 1-motive over S: Y étale locally isomorphic to ℤ^r, G a semi-abelian scheme, extension of an abelian scheme B = Q^ab by a torus T with character group Q^mult (so Q^ét = Y), and a homomorphism Y → G. Its realizations are: the Tate modules T_ℓ(Q) = lim_n Q[ℓ^n] and T̂(Q), where Q[n] is the finite flat group scheme of n-torsion of the 1-motive (extension of Y/nY by G[n] built from Y → G); the de Rham realization H_dR(Q), the Lie algebra of the universal vector extension of the dual 1-motive, a locally free module of rank 2 dim B + rank Y + rank T with its weight filtration W_{−2} = Lie T ⊂ W_{−1} ⊂ W_0 = H_dR(Q) (graded pieces Lie T, H_dR(B), Y ⊗ O) and Hodge filtration F^0; over ℂ the Betti realization H_B(Q) with the mixed Hodge structure of weights −2, −1, 0. All realizations are compatible with tensor constructions, duality Q ↦ Q^∨ and base change, with the comparison isomorphisms between Betti, de Rham and étale realizations over ℂ, and over a degenerating chart V with the identification A[n] ≅ Q[n] of the Mumford construction.

*Hypotheses.*
- S arbitrary for the étale and de Rham realizations (with n invertible on S for the étale ones); the Betti realization and its mixed Hodge structure only over ℂ.
- Homological conventions: realizations are covariant in Q, as in Madapusi Pera §1.1.

*Proof sketch.*
- Define Q[n] via the multiplication-by-n on the complex [Y → G] (Deligne, Hodge III 10.1); T̂ is its limit.
- Define H_dR(Q) through the universal vector extension of Q^∨ (Deligne, Hodge III 10.1.7), with weight filtration from the extension structure and Hodge filtration from the vector extension.
- Over ℂ, the Betti realization is H_1 of the analytic 1-motive with its mixed Hodge structure (Deligne, Hodge III 10.1.3); the comparison isomorphisms are those of loc. cit.
- Over a degenerating chart, the Mumford construction (ShimuraCompactifications C4) identifies A[n] with Q[n] over V.

*Sources.* [MP19], §1.1, pp. 9–12: Recalls 1-motifs over a base, their étale, de Rham, Betti and crystalline realizations with weight and Hodge filtrations, duality, and compatibility with the degeneration construction. [MP19], §1.2, (1.2.2), pp. 12–13: Recalls the equivalence between degenerating abelian schemes and degeneration data (Mumford, Faltings–Chai) through which the realizations of A and Q are compared.

*Uses.* Madapusi Pera §3.1.1–3.1.6, pp. 43–45: tensors s_{α,Φ,dR} and s_{α,Φ,ét} live in the realizations of the boundary 1-motive Q(Φ); Madapusi Pera §4.3.1, p. 80: the de Rham realization of the universal 1-motive gives the canonical extension of H_dR across the boundary.

The API:
- `OneMotive` (structure): A 1-motive [Y → G] over S with G an extension of an abelian scheme by a torus.
- `OneMotive.torsion` (constructor): The finite flat group scheme Q[n], an extension of Y/nY by G[n].
- `OneMotive.tateModule` (constructor): T̂(Q) = lim Q[n] with its weight filtration T̂(T) ⊂ T̂(G) ⊂ T̂(Q).
- `OneMotive.deRham` (constructor): H_dR(Q) with weight filtration W_• and Hodge filtration F^0, functorial and compatible with base change.
- `OneMotive.dual` (other): The dual 1-motive Q^∨ and the perfect pairings T̂(Q) × T̂(Q^∨) → Ẑ(1) and H_dR(Q) × H_dR(Q^∨) → O.
- `OneMotive.betti` (constructor): Over ℂ, H_B(Q) with its mixed Hodge structure (a TauCeti.Hodge.MixedHodgeStructure) and the comparison isomorphisms.
- `OneMotive.ofAbelian` (compatibility): For Y = 0 and T = 0 the realizations are those of the abelian scheme B (AbelianSchemesAndArithmeticModuli A4).

*Needs:* ShimuraCompactifications C4 (semi-abelian-scheme); ShimuraCompactifications C4 (poincare-extension-classification); ShimuraCompactifications C4 (semiabelian-tate-module); AbelianSchemesAndArithmeticModuli A4; Tau Ceti `TauCeti.Hodge.MixedHodgeStructure`.

**Checks.**

- `OneMotive.tate_test` (computation): For the 1-motive [ℤ → 𝔾_m, 1 ↦ q] over a ring with q a unit, Q[n] is the extension of ℤ/n by μ_n whose fibre over 1 is the scheme of n-th roots of q, the n-torsion of the Tate curve.
- `OneMotive.weight_test` (computation): For Q = [Y → T] with B = 0, the graded pieces of H_dR(Q) are Lie T in weight −2 and Y ⊗ O in weight 0; there is no weight −1 part.
- `OneMotive.abelian_test` (degenerate): For Q = [0 → A] with A abelian, H_dR(Q) = H_1^dR(A) with W_{−1} = everything and W_{−2} = 0.
- `OneMotive.notPure_test` (non-example): The Betti realization of [ℤ → ℂ^×, 1 ↦ q] with |q| ≠ 1 is a nonsplit extension of ℤ(0) by ℤ(1): it is not a pure Hodge structure, so a definition using only pure Hodge structures fails.
- For an abelian scheme the realizations are those of AbelianSchemesAndArithmeticModuli A4.
- The weight-graded pieces of H_dR(Q) are Lie T, H_dR(B) and Y ⊗ O.

### C9.2 Absolute Hodge tensors on boundary 1-motives

Prove (theorem, node `C9/absolute-hodge-one-motives`): Let (G, X) ↪ (GSp(H), S^±(H)) be a Hodge embedding with tensors {s_α} ⊂ H^⊗ whose pointwise stabilizer is G, and Φ a cusp label representative with induced Siegel label Φ‡. Over Sh_{K_Φ}(Q_Φ, D_Φ)(ℂ) the boundary 1-motive Q(Φ) pulled back from the Siegel boundary carries tensors s_{α,Φ,B}, s_{α,Φ,dR} and s_{α,Φ,ét} in W_0 of its realizations, identified with each other by the comparison isomorphisms; s_{α,Φ,dR} lies in F^0 ∩ W_0 and is horizontal. Then s_{α,Φ,dR} descends to a section of H_dR(Φ)^⊗ over the canonical model Sh_{K_Φ}(Q_Φ, D_Φ) over E, and s_{α,Φ,ét} to a section of H_{𝔸_f}(Φ)^⊗ over it.

*Hypotheses.*
- (G, X) of Hodge type; K neat; the boundary mixed Shimura variety with its canonical model over E (ShimuraCompactifications C1–C2).

*Proof sketch.*
- The tensors come from the mixed Hodge structure of the boundary (ShimuraCompactifications C1, boundary weight and Hodge filtrations).
- Brylinski's theorem: Hodge classes on 1-motives over ℂ are absolutely Hodge, reducing to Deligne's theorem for abelian varieties (AutomorphicBundles B1/absolute-hodge-propagation) through the weight filtration.
- Descent to the canonical model over E as in Kisin's argument for abelian schemes: an absolute Hodge class on a family over a variety defined over E, Galois-invariant at one fibre, is defined over E (Madapusi Pera 3.1.2 following Kisin 2.2).

*Sources.* [MP19], Proposition 3.1.2, p. 44: States the descent of the de Rham and étale tensors of the boundary 1-motive to the canonical model, deduced as in Kisin from Brylinski's theorem that Hodge classes on 1-motives are absolutely Hodge. [Brylinski], Théorème 2.2.5: Hodge classes on 1-motives over ℂ are absolutely Hodge (cited by Madapusi Pera; not read here).

*Needs:* C9.1; AutomorphicBundles B1 (absolute-hodge-propagation); ShimuraCompactifications C1 (boundary-mixed-hodge-structure); ShimuraCompactifications C2 (canonical-toroidal-model).

**Checks.**

- For Φ = (G, X^+, 1) the statement is Kisin's descent of the tensors on the universal abelian scheme over Sh_K.

### C9.3 Tensors of the 1-motive and of the abelian scheme agree

Prove (theorem, node `C9/boundary-tensor-compatibility`): Let Υ = [(Φ, σ)], t a point of the closed stratum Z_{K_Φ}(Q_Φ, D_Φ, σ), R(Φ, σ, t) the complete local ring of Sh_{K_Φ}(Q_Φ, D_Φ, σ) at t and V = Spec R(Φ, σ, t) minus the boundary. Through the identification of R(Φ, σ, t) with a complete local ring of Sh^Σ_K, V carries both the boundary 1-motive Q and the abelian scheme A, with canonical isomorphisms T̂(Q) ≅ T̂(A) and H_dR(Q) ≅ H_dR(A) (Mumford's construction). These isomorphisms carry s_{α,Φ,ét} to s_{α,ét} and s_{α,Φ,dR} to s_{α,dR} for every α.

*Hypotheses.*
- Characteristic zero; t may be taken ℂ-valued.

*Proof sketch.*
- Over ℂ, identify the algebraic Mumford isomorphism T̂(Q) ≅ T̂(A) with the analytic one coming from the uniformization of the boundary neighbourhood (Madapusi Pera 2.2.13, compatibility of Mumford's construction with realizations).
- For the analytic isomorphism the tensors correspond by construction, both being induced from the s_α ∈ H^⊗; argue identically for de Rham realizations.

*Sources.* [MP19], Proposition 3.1.6 and its proof, pp. 44–45; (2.2.13), p. 39: Identifies the tensors on the 1-motive and on the abelian scheme over the punctured formal neighbourhood, using the compatibility of the algebraic and analytic Mumford isomorphisms.

*Needs:* C9.2; ShimuraCompactifications C4 (formal-universal-degeneration); ShimuraCompactifications C2 (partial-boundary-charts).

**Checks.**

- In the PEL case the tensors are endomorphisms and polarizations and their compatibility is functoriality of the Mumford construction.
- The identifications hold for every α simultaneously.

### C9.4 The log Dieudonné crystal of a degenerating abelian scheme

Construct (construction, node `C9/log-dieudonne-crystal`): Let S = Spec R with R a complete noetherian normal local ring, flat over W = W(k) for a perfect field k of characteristic p, U ⊂ S the complement of a divisor with normal crossings giving S its log structure, and A an object of DEG(S, U): a semi-abelian scheme over S, abelian over U, with its degeneration data (a 1-motive Q over the completion with period pairing τ). The log Dieudonné crystal D(A) is a log F-crystal on the log crystalline site of the special fibre (finite locally free, with Frobenius, a logarithmic connection, a Hodge filtration and a weight filtration) with W_0 D(A) ≅ Hom(Q^ét, 1), W_1 D(A) ≅ D(Q^sab), gr^W_2 D(A) ≅ 1(−1) ⊗ Q^{mult,C}, duality D(A^∨) ≅ D(A)^∨, and a horizontal isomorphism H^1_dR(A/U) ≅ D(A)(S)|_U respecting both filtrations. It is constructed from the degeneration data as the Baer sum of D(Q) and the extension given by τ, and on the good-reduction locus it is the Dieudonné crystal of the p-divisible group.

*Hypotheses.*
- k perfect of characteristic p; R complete noetherian normal local and W-flat; the log structure is the one defined by the boundary divisor; A has semi-abelian reduction along the boundary with split torus part after étale localization.

*Proof sketch.*
- Reduce, by the equivalence of degenerating abelian schemes with degeneration data (Madapusi Pera 1.2.2; ShimuraCompactifications C4), to constructing D on degeneration data.
- For totally degenerate data (abelian part 0) given by a pairing τ : Y × X → 𝔾_m over U, write D explicitly as the extension of Hom(X, O) by O(−1) ⊗ Y with log connection d log τ and Frobenius induced by the p-power map (Madapusi Pera A.1.1–A.1.5).
- In general take the Baer sum of D(Q^cl), the Dieudonné crystal of the 1-motive with good reduction, and the totally degenerate extension (A.1.8–A.1.10); check the weight, duality and de Rham comparison properties on each piece.

*Sources.* [MP19], §1.3, Proposition 1.3.5, p. 14: Constructs a functor from degenerating abelian schemes to log Dieudonné crystals with weight filtration, with the stated weight-graded identifications, duality and de Rham comparison. [MP19], Appendix A.1, A.1.1–A.1.10, pp. 89–94: Gives the construction over complete normal local bases, extending Kato's construction for discrete valuation rings, via the totally degenerate case and Baer sums.

*Uses.* Madapusi Pera §3.2, pp. 45–52: the log F-crystal of the tautological degeneration at a boundary point of the Siegel chart; Madapusi Pera §1.4.10: its evaluation on a discrete valuation ring gives the Hyodo–Kato module of a semistable abelian variety.

The API:
- `LogDieudonneCrystal` (constructor): D(A) for A ∈ DEG(S, U), functorial in A.
- `LogDieudonneCrystal.weight` (characterisation): The identifications of W_0 D(A), W_1 D(A) and gr^W_2 D(A) with the realizations of Q^ét, Q^sab and Q^mult.
- `LogDieudonneCrystal.dual` (other): D(A^∨) ≅ D(A)^∨ compatibly with polarizations.
- `LogDieudonneCrystal.deRham` (compatibility): H^1_dR(A/U) ≅ D(A)(S)|_U, horizontal and respecting Hodge and weight filtrations.
- `LogDieudonneCrystal.good` (compatibility): If A is abelian over S, D(A) is the Dieudonné crystal of A[p^∞] with trivial log structure (AbelianSchemesAndArithmeticModuli A4).
- `LogDieudonneCrystal.residue` (relation): The residue of the log connection along the boundary is the monodromy operator determined by τ.

*Needs:* C9.1; ShimuraCompactifications C4 (degeneration-effectivity); CrystallineCohomology CR.5; AbelianSchemesAndArithmeticModuli A4.

**Checks.**

- `LogDieudonneCrystal.tate_test` (computation): For the Tate curve over W[[q]] with log structure from q = 0, D is free of rank 2 with a basis e_1 of W_0D (φe_1 = e_1, ∇e_1 = 0) and a lift e_0 of a basis of gr^W_2D with φe_0 = pe_0 and ∇e_0 = e_1 ⊗ d log q, up to the sign convention; this is compatible with φ(d log q) = p d log q.
- `LogDieudonneCrystal.good_test` (degenerate): For an abelian scheme over S (empty boundary) D is the usual Dieudonné crystal and the residue is zero.
- `LogDieudonneCrystal.notCrystal_test` (non-example): For the Tate curve the connection has a nonzero residue at q = 0, so D is not in the image of the (fully faithful) functor from Dieudonné crystals without log structure.
- For an abelian scheme with good reduction D(A) is the Dieudonné crystal.
- For the Tate curve the residue of the log connection is nonzero.

### C9.5 Semistable comparison for abelian varieties with semi-abelian reduction

Prove (theorem, node `C9/semistable-comparison-abelian`): Let K/K_0 be a finite totally ramified extension of K_0 = W(k)[1/p], π a uniformizer, and A an abelian variety over K with split semi-abelian reduction over O_K. Let M_0(A) be the evaluation of the log Dieudonné crystal (C9.4) at W with its log structure, a filtered (φ, N)-module after the Hyodo–Kato isomorphism β_HK,π : K ⊗_{K_0} M_0(A) ≅ H^1_dR(A/K). There is a canonical isomorphism β_st,A : B_st ⊗_{ℚ_p} H^1_ét(A_{K̄}, ℚ_p) ≅ B_st ⊗_{K_0} M_0(A), compatible with Gal(K̄/K), φ, N and, after B_st → B_dR (depending on π), with the Hodge filtration via β_HK,π. Consequently (Coleman–Iovita) A has good reduction if and only if T_p(A) is crystalline, if and only if the monodromy N_0(A) vanishes.

*Hypotheses.*
- K a finite extension of K_0 with perfect residue field k; split semi-abelian reduction (achieved after a finite extension); the embedding K ⊗ B_st → B_dR fixed by the choice of π.

*Proof sketch.*
- Write A via Raynaud uniformization as G/Y with G semi-abelian of good reduction and Y the period lattice (NeronModelsAndSemistableAbelianVarieties R11.3); the Tate module is an extension of the realizations of the 1-motive.
- Construct β_st as the descent of the crystalline comparison for the good-reduction 1-motive combined with the explicit comparison for the totally degenerate extension, whose period is log τ ∈ B_st (Madapusi Pera 1.4.6–1.4.10, generalizing Faltings's construction for good reduction).
- Compatibility with N: N_0(A) is the residue at u = 0 of the log connection on the evaluation of D(A) at the Breuil–Kisin type thickening Spf O_K ↪ Spf S_π; it vanishes exactly when D(A) has no log poles, that is when A has good reduction.
- When a proper semistable model exists, this comparison agrees with the general semistable comparison of CohomologyComparisons CP.4 (Hyodo–Kato and Tsuji).

*Sources.* [MP19], §1.4, (1.4.6)–(1.4.10), pp. 15–19; Proposition 1.4.10, p. 18: Constructs the semistable comparison isomorphism for abelian varieties with semi-abelian reduction from the log Dieudonné crystal, compatible with Galois action, Frobenius, monodromy and filtrations. [MP19], 1.4.11 and Theorem 6, pp. 7 and 19: Deduces that T_p(A) is crystalline if and only if the monodromy vanishes, if and only if A has good reduction (originally Coleman–Iovita). [MP19], Appendix A.2, pp. 94–96: Proves the comparison statements used in 1.4.10.

*Needs:* C9.4; NeronModelsAndSemistableAbelianVarieties R11.3; CohomologyComparisons CP.4; CrystallineCohomology CR.6; PadicHodgeTheory R06.5.

**Checks.**

- For the Tate curve E_q over K, N_0 ≠ 0 and T_p(E_q) is semistable non-crystalline.
- For an abelian variety with good reduction β_st restricts to Faltings's crystalline comparison.

### C9.6 The canonical φ-module at a boundary point

Construct (construction, node `C9/canonical-log-f-crystal`): Fix a Hodge embedding with self-dual auxiliary lattice, a Siegel cusp label representative Φ‡ with cone σ‡ (σ‡° ⊂ H(Φ‡)), a closed point s‡_0 of the closed stratum of the Siegel twisted torus embedding over F̄_p, R(σ‡, s‡_0) its complete local ring with V = Spec R minus the boundary, and Q(σ‡, s‡_0) the tautological degeneration. Let M(σ‡, s‡_0) = D(A(σ‡, s‡_0))(S(σ‡, s‡_0)) (C9.4) with Frobenius lift φ = φ^sab ⊗̂ φ_σ (p-power on characters). It is canonically the Baer sum of D(Q^cl), for the 1-motive of the chosen trivialization of the torus torsor, and the split extension of O(−1) ⊗ X by Hom(X, O). Its fibre M_0 at the Teichmüller point is a φ-module over K_0 = W(F̄_p)[1/p] with weight filtration W_•M_0, symplectic form ψ_0 with values in K_0(−1), independent of the choices in the equivalence class of (σ‡, s‡_0), with a canonical isomorphism K_0 ⊗ Lie W_{Φ‡} ≅ K_0(−1) ⊗ Lie U_wt, where U_wt is the centre of the unipotent radical of the parabolic of GSp(M_0, ψ_0) stabilizing W_•M_0. For each K_0-point x of the rigid generic fibre Û^{an,◦}(σ‡, s‡_0) of V, the monodromy N_x of β_st at the degenerating abelian variety A_x is an element of the cocharacter lattice B ⊂ Lie W_{Φ‡} = (Lie U_wt)(−1) lying in σ‡°.

*Hypotheses.*
- Hodge embedding with self-dual Siegel lattice and hyperspecial K‡_p; s‡_0 an F̄_p-point; analytic spaces as in Madapusi Pera A.4.

*Proof sketch.*
- Trivialize the torus torsor over R^sab (strictly henselian) and write R(σ‡, s‡_0) ≅ R^sab ⊗̂ B(σ‡, s′_0) (Madapusi Pera 3.2.3).
- Compute D(A) as the Baer sum (3.2.7) from the explicit description of the totally degenerate log Dieudonné crystal (A.1.5).
- Compare M at different (σ‡, s‡_0) in one equivalence class via the blow-ups of 3.2.4–3.2.6 to obtain M_0 and its structures (3.2.9–3.2.10).
- The monodromy at x is the residue of the log connection, computed from the period pairing τ_x, whose valuation lies in σ‡° (3.2.14).

*Sources.* [MP19], §3.2, (3.2.1)–(3.2.14), pp. 45–52: Describes explicitly the log F-crystal at a boundary point of the Siegel chart as a Baer sum, the canonical φ-module M_0 with weight filtration and pairing, the isomorphism (3.2.10.1) of Lie W_{Φ‡} with Lie U_wt up to twist, and the monodromy of points as elements of the cone.

*Uses.* Madapusi Pera §3.3–3.5: carrier of the canonical crystalline tensors and of the rationality statement; Madapusi Pera proof of Lemma 4.2.11, pp. 78–79: identifies B^⋄_G with B through (3.2.10.1).

The API:
- `CanonicalPhiModule` (constructor): M_0 over K_0 with Frobenius φ_0, weight filtration W_•M_0 and pairing ψ_0, attached to the equivalence class of (σ‡, s‡_0).
- `CanonicalPhiModule.lieIso` (equivalence): K_0 ⊗ Lie W_{Φ‡} ≅ K_0(−1) ⊗ Lie U_wt (3.2.10.1).
- `CanonicalPhiModule.monodromy` (data): For x ∈ Û^{an,◦}(σ‡, s‡_0)(K_0), the monodromy N_x ∈ B ∩ σ‡° under the isomorphism above.
- `CanonicalPhiModule.baerSum` (characterisation): M(σ‡, s‡_0) is the Baer sum of D(Q^cl) and the split totally degenerate extension, as φ-modules with log connection.
- `CanonicalPhiModule.independent` (other): M_0 and its structures do not depend on the representative of the equivalence class.

*Needs:* C9.4; C9.5; ShimuraCompactifications C5 (formal-completion); ShimuraCompactifications C4 (formal-universal-degeneration).

**Checks.**

- `CanonicalPhiModule.tate_test` (computation): For g = 1 and the Tate curve at a cusp, M_0 = K_0e_1 ⊕ K_0e_0 with W_0M_0 = K_0e_1 = Hom(X, K_0) (φe_1 = e_1) and e_0 lifting gr^W_2M_0 = K_0(−1) ⊗ X (φe_0 = pe_0); for a point x with Tate parameter q_x, N_x(e_0) = v_p(q_x)e_1 and N_x(e_1) = 0 up to sign, with v_p(q_x) > 0 because x lies off the boundary in the cone σ‡° = ℝ_{>0}.
- `CanonicalPhiModule.good_test` (degenerate): For the trivial cusp label (no boundary) M_0 is the Dieudonné module of the reduction and the weight filtration is trivial.
- `CanonicalPhiModule.positivity_test` (characterisation): For x off the boundary, N_x induces a positive definite pairing on X: ker N_x = W_1M_0 and im N_x = W_0M_0.
- For the Tate curve at a cusp, M_0 has rank 2 with slopes 0 and 1 and the monodromy of a point with Tate parameter q_x is v_p(q_x) times the nilpotent generator.
- M_0 does not depend on the representative of the equivalence class of (σ‡, s‡_0).

### C9.7 Canonical crystalline tensors at the boundary

Prove (theorem, node `C9/canonical-tate-tensors`): In the setting of C9.6, for a Hodge-type datum (G, X) with tensors {s_α} and a point t_0 of 𝒮^Σ_K over s‡_0, for every α there is a canonical tensor s_{α,st,0} ∈ M_0^⊗ such that: φ_0(s_{α,st,0}) = s_{α,st,0}; N_y(s_{α,st,0}) = 0 for every K_0-point y of Û^{an,◦}_G(σ‡, t_0) (the rigid generic fibre of the complete local ring R_G(σ‡, t_0) of 𝒮^Σ_K at t_0, off the boundary); and for every y over a finite extension L/K_0 and uniformizer π of L, β_st,y^{-1}(1 ⊗ s_{α,st,0}) = s_{α,ét,y} and β_HK,y,π(1 ⊗ s_{α,st,0}) = s_{α,dR,y}. The pointwise stabilizer of {s_{α,st,0}} in GL(M_0) is isomorphic to G_{K_0}.

*Hypotheses.*
- Same setting; y ranges over points of the rigid generic fibre of the boundary complete local ring not on the boundary divisor.

*Proof sketch.*
- At each point y, the semistable comparison of C9.5 carries the étale tensors s_{α,ét,y} (Galois-invariant, by C9.2) into (B_st ⊗ M_0(A_y))^⊗, φ- and N-invariant and in F^0; the compatibility of de Rham and étale tensors at each y is HodgeTateAndCanonicalSubgroups T1/hodge-tensor-comparison applied fibrewise.
- Show that the resulting tensor in M_0 does not depend on y by horizontality in the family over Û^{an,◦}_G (parallel transport for the log connection, Madapusi Pera 3.3.6–3.3.8).
- The scheme of isomorphisms H^∨(ℚ_p) ⊗ B ≅ M_0 ⊗ B carrying s_α to s_{α,st,0} has a B_st-point, hence is a G-torsor over K_0; by Steinberg's theorem over K_0 = W(F̄_p)[1/p] (ReductiveGroupsPartII RG2.1.1, steinberg-quasi-split) it has a K_0-point, so the stabilizer is G_{K_0} (Madapusi Pera 3.4.1).

*Sources.* [MP19], §3.3, (3.3.6)–Corollary 3.3.9, pp. 52–57: Constructs canonical φ-invariant, monodromy-annihilated tensors in M_0 matching the étale tensors under the semistable comparison and the de Rham tensors under Hyodo–Kato. [MP19], §3.4.1, p. 57: Uses Steinberg's theorem to identify the stabilizer of the canonical tensors with G_{K_0}.

*Needs:* C9.6; C9.2; C9.3; HodgeTateAndCanonicalSubgroups T1 (hodge-tensor-comparison); ReductiveGroupsPartII RG2.1.

**Checks.**

- In the PEL case the canonical tensors are the crystalline realizations of the reductions of the endomorphisms and polarization (Madapusi Pera Remark 3.3.10).

### C9.8 Rationality of Hodge cycles at the boundary (crystalline form)

Prove (theorem, node `C9/crystalline-rationality`): In the setting of C9.7, let U_wt,G = U_wt ∩ G_{K_0} and B_G = B ∩ (Lie U_wt,G)(−1), with B ⊂ (Lie U_wt)(−1) the cocharacter lattice of the Siegel boundary torus via (3.2.10.1). Then the inclusion induces an isomorphism K_0 ⊗_ℤ B_G ≅ (Lie U_wt,G)(−1); equivalently rank_ℤ B_G = d_wt := dim_{K_0} U_wt,G. Moreover dim R^sab_G ≤ d − d_wt + 1, where d = dim Sh_K and R^sab_G is the normalization in R_G(σ‡, t_0) of the image of the complete local ring of the Siegel abelian-torsor base.

*Hypotheses.*
- Same setting; d = dim X.

*Proof sketch.*
- The monodromy elements N_x of points x of Û^{an,◦}_G lie in B_G (they annihilate the canonical tensors, C9.7), so rank B_G is at least the dimension of their span, and at most d_wt.
- Bound from above (Lemma 3.5.7): the Hodge filtrations F^•_y via β_HK give an unramified map η from the rigid space of R^sab to a Grassmannian landing in U^sab_{G,[μ]}, which has dimension d − d_wt because U_{G,[μ]} → U^sab_{G,[μ]} is a U_wt,G-torsor (Lemmas 3.5.3, 3.5.5); hence dim R^sab_G ≤ d − d_wt + 1.
- Bound from below (3.5.9): a closed subscheme of a completed torus embedding over R^sab_G of dimension d + 1 needs at least d − dim R^sab_G + 1 independent monodromy directions; combining gives rank B_G ≥ d_wt.

*Sources.* [MP19], Theorem 3.4.3(1), pp. 57–58; §3.5, Lemmas 3.5.3, 3.5.5, 3.5.7 and (3.5.9), pp. 59–65: Proves that the monodromy lattice B_G spans the twisted Lie algebra of U_wt,G, by an upper bound on the dimension of the abelian-part base from the Hodge filtrations and a lower bound from completed torus embeddings. [MP19], Remark 3.4.4(1), p. 58; (3.5.10): Calls this a rationality property of Hodge cycles with respect to p-adic uniformization and notes the simple PEL proof.

*Needs:* C9.7; C9.6.

**Checks.**

- For the Siegel datum itself, B_G = B and the statement is the rank count dim U_wt = rank B.
- In the PEL case, B_G is the sublattice of B commuting with the O-action, by functoriality of p-adic uniformization.

## Layer C10: Toroidal compactifications of Hodge type

Madapusi Pera's main theorem at arbitrary level: the canonical reduction of the Siegel boundary torus torsor to the torus of B_G (Theorem 3.4.3(2), §3.6) and the local structure of 𝒮^Σ_K at boundary points as completions of twisted torus embeddings (Theorem 3.4.3(3), §3.7); the abelian-scheme torsor of the boundary tower under the level hypothesis K_p = K‡(n)_p ∩ G(ℚ_p) (Theorem 4.1.5(1)); stratification with flat normal strata (4.1.5(2)–(3), 4.2.4); the normalized boundary mixed Shimura model as an E_K(Φ)-torsor (4.1.5(4), 4.2.8, 4.2.11); formal completions along strata (4.1.5(5)); Theorem 1 (Cartier boundary, étale-local charts, singularities no worse than the interior); refinements and independence of the Siegel decomposition; functoriality for embeddings of data and Hecke correspondences (4.1.13); the properness criterion (4.1.7), Morita's conjecture (Theorem 5), connected components (4.1.11) and the étale rationality of Hodge cycles (Theorem 4).

*Layer dependencies:* C7, C9, ShimuraCompactifications C2, ShimuraCompactifications C3, ShimuraCompactifications C4, ShimuraCompactifications C5, AlgebraicModuliForArithmeticGeometry R09.6.

### C10.1 Reduction of the boundary torus torsor at a boundary point

Prove (theorem, node `C10/torsor-reduction`): In the setting of C9.8, let E be the Siegel boundary torus with cocharacter lattice B, E_G ⊂ E the subtorus with cocharacter lattice B_G, Ξ the restriction of the Siegel torus torsor to Spec R^sab, and Ξ_G = Ξ/E_G (a torsor under E/E_G). The tautological section ι_G of Ξ_G over Spec R_G(σ‡, t_0)[a_σ^{-1}] (a_σ an equation of the boundary) is already defined over Spec R^sab_G and is independent of the choice of (σ‡, s‡_0, t_0) in its equivalence class. Hence Ξ|_{Spec R^sab_G} has a canonical reduction of structure group to an E_G-torsor Ξ_G(ι_G).

*Hypotheses.*
- Same setting as C9.8; R^sab_G is integrally closed in R_G(σ‡, t_0) by construction.

*Proof sketch.*
- Equivalent formulation (Madapusi Pera 3.4.4(2)): for a trivialization ι^sab and all characters h of E/E_G, some power α(h)^m lies in (R^sab_G)^×.
- Over the rigid generic fibre the canonical trivialization is defined because the monodromy of every point lies in B_G (C9.8 and C9.7); its descent to R^sab_G follows from the rigid-analytic extension lemmas (Madapusi Pera A.4) and the integrality of α(h) on the generic fibre (Madapusi Pera §3.6).
- Independence of the representative: compare through the blow-ups relating equivalent pairs (3.2.4–3.2.6).

*Sources.* [MP19], Theorem 3.4.3(2), p. 58; Remark 3.4.4(2), p. 58; §3.6, pp. 65–67: Proves that the induced section of the quotient torsor is defined over the normalized abelian-part base, giving a canonical reduction of the Siegel boundary torus torsor to the torus of B_G; calls this the key result of the paper.

*Needs:* C9.8; C9.7; C7.8.

**Checks.**

- For the Siegel datum itself B_G = B, E_G = E and the reduction is the identity.
- In the PEL case the reduction is the subtorus fixed by the O-action, constructed directly from the moduli description (Lan16 §8).

### C10.2 Local structure at the boundary

Prove (theorem, node `C10/local-structure`): In the setting of C10.1 there are a torus E^⋄_G with an isogeny E^⋄_G → E_G and an E^⋄_G-torsor Ξ^⋄_G over R^sab_G inducing Ξ_G(ι_G), such that for every (σ̃‡, s̃‡_0, t̃_0) in the equivalence class of (σ‡, s‡_0, t_0) the finite map Spec R_G(σ̃‡, t̃_0) → Spec R(σ̃‡, s̃‡_0) → Ξ(σ̃‡) lifts canonically to Spec R_G(σ̃‡, t̃_0) → Ξ^⋄_G(σ̃_G), σ̃_G = σ̃‡ ∩ (B_G ⊗ ℝ), identifying Spf R_G(σ̃‡, t̃_0) with the completion of the twisted torus embedding Ξ^⋄_G(σ̃_G) at a point of its closed stratum.

*Hypotheses.*
- Same setting; this is a statement about complete local rings of 𝒮^Σ_K at boundary points in the special fibre.

*Proof sketch.*
- Use the closed immersion Sh_K → Sh_{K‡,⋄} at a deeper Siegel level K‡,⋄ with K = K‡,⋄ ∩ G(𝔸_f) (Madapusi Pera 3.7.2) to see R_G as the normalization of a quotient of a complete local ring of the deeper Siegel chart.
- The section of Ξ^⋄/E^⋄_G is defined over R^sab_G by C10.1, giving the reduction Ξ^⋄_G and a lift of the map into the twisted torus embedding.
- Dimension count dim Ξ^⋄_G ≤ (d − d_wt + 1) + d_wt = dim R_G (C9.8) forces Spec R_G to map finitely and dominantly onto the completion of the normal scheme Ξ^⋄_G(σ̃_G) at a point; normality gives the isomorphism (Madapusi Pera 3.7.4).

*Sources.* [MP19], Theorem 3.4.3(3), p. 58; §3.7, (3.7.2)–(3.7.4) and the proof of 3.4.3, pp. 67–69: Identifies the complete local ring of 𝒮^Σ_K at a boundary point with the completion of a twisted torus embedding over the normalized abelian-part base, using the reduction of structure group and a dimension count.

*Needs:* C10.1; C9.8; C7.5.

**Checks.**

- At a boundary point of the modular curve the complete local ring is W[[t]] with t^w = q, the completion of the line bundle of 𝔾_m at its zero section.
- The dimension count dim Ξ^⋄_G = dim R_G holds at every boundary point.

### C10.3 The abelian part of the boundary tower

Prove (theorem, node `C10/abelian-torsor-extension`): Assume K_p = K‡(n)_p ∩ G(ℚ_p) for some n ≥ 1, where K‡(n) is the full level-n subgroup of the self-dual Siegel level. For every cusp label representative Φ of (G, X), the abelian scheme A_K(Φ) → Sh_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}) extends to an abelian scheme 𝒜_K(Φ) → 𝒮_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}) (namely the normalization of the pulled-back Siegel abelian scheme in A_K(Φ)), and the A_K(Φ)-torsor Sh_{K_Φ}(Q_Φ, D̄_Φ) → Sh_{K_Φ,h} extends to an 𝒜_K(Φ)-torsor structure on 𝒮_{K_Φ}(Q_Φ, D̄_Φ) → 𝒮_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}).

*Hypotheses.*
- K_p = K‡(n)_p ∩ G(ℚ_p) for some n ≥ 1 (this includes the case K_p = K‡_p ∩ G(ℚ_p) with n = 1).

*Proof sketch.*
- For n = 1, the map A_K(Φ) → A_{K‡}(Φ‡) is a prime-to-p isogeny onto an abelian subscheme with orthogonal complement A′, and A_K(Φ) × A′ → A_{K‡}(Φ‡) is an isogeny of abelian schemes; the normalization of an abelian scheme in an isogeny factor over a normal base is an abelian scheme (Madapusi Pera A.3.8, Proposition 4.2.2).
- For n ≥ 2 use the deeper Siegel level K‡,⋄ with K‡,⋄_p = K‡(n)_p, where the Siegel abelian scheme is Hom((1/n)X, Q^ab), and take a fibre product of abelian schemes.
- The torsor structure is checked étale locally: a generic section extends by the valuative criterion and Weil's extension theorem for maps into abelian schemes (Bosch–Lütkebohmert–Raynaud 4.4, Theorem 1), identifying the normalized tower with A_K(Φ)|_U (Corollary 4.2.3).

*Sources.* [MP19], Theorem 4.1.5(1), p. 71; Proposition 4.2.2 and Corollary 4.2.3, pp. 74–75: Extends the abelian scheme and torsor structure of the boundary tower to the normalized integral models under the level hypothesis at p.

*Needs:* C7.8; ShimuraCompactifications C4 (homomorphism-extension); NeronModelsAndSemistableAbelianVarieties R11.1.

**Checks.**

- For a Siegel datum at hyperspecial level the abelian scheme is the integral Siegel boundary abelian scheme of ShimuraCompactifications C5.

### C10.4 The normalized boundary torus torsor

Prove (theorem, node `C10/boundary-torus-torsor`): For every cusp label representative Φ, 𝒮_{K_Φ}(Q_Φ, D_Φ) is an E_K(Φ)-torsor over 𝒮_{K_Φ}(Q_Φ, D̄_Φ), extending the torsor structure of the generic fibre, where E_K(Φ) is the split torus over ℤ with cocharacter group B_K(Φ) (the lattice of Φ at level K). Consequently, for every rational polyhedral cone σ ⊂ W_Φ(ℝ)(−1), 𝒮_{K_Φ}(Q_Φ, D_Φ, σ) is the twisted torus embedding of this torsor and 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) is its closed stratum. The torus provided by C10.2 at each boundary point is E_K(Φ): B^⋄_G = B_K(Φ).

*Hypotheses.*
- (G, X) of Hodge type, auxiliary datum as in C7; no hypothesis on K_p.

*Proof sketch.*
- The E-action on the generic torsor extends to Ξ by normality; the torsor property is checked over complete local rings of the base.
- Over the complete local ring at a point of the base, C10.2 exhibits Ξ as an E^⋄_G-torsor; it remains to identify E^⋄_G with E_K(Φ), that is B^⋄_G = B_K(Φ) (Lemma 4.2.11).
- Lemma 4.2.11: using a section of the étale torsor I(Υ, s_0) of tensor-preserving level structures (Lemma 4.2.7) and the compatibility of β_st with tensors, the isomorphism (3.2.10.1) restricts to K_0 ⊗ Lie W_Φ ≅ K_0(−1) ⊗ Lie U_wt,G, and intersecting with the level lattice gives B^⋄_G = B_K(Φ).
- Without this, normalization of the closure of a subtorus torsor need not be a torsor (Madapusi Pera Remark 4.2.9; see C7.8, test notTorsor).

*Sources.* [MP19], Theorem 4.1.5(4), p. 71; Lemma 4.2.7, Proposition 4.2.8, Remark 4.2.9 and Lemma 4.2.11, pp. 77–79: Proves that the normalized boundary mixed Shimura model is a torsor under the expected torus, by identifying the torus of the local structure theorem with E_K(Φ) through the tensor-preserving level torsor.

*Needs:* C10.2; C9.7; C7.8.

**Checks.**

- For FKW's parabolic (pure part zero-dimensional) this gives the torus torsor ξ_K → C_K over O_{E,(v)} (C11.5).

### C10.5 Stratification of the normalized toroidal model

Prove (theorem, node `C10/stratification`): For every cone label Υ ∈ Cusp^Σ_K(G, X), the map 𝒵_K(Υ) → 𝒮^Σ_K of C7.9 is a locally closed immersion, and 𝒮^Σ_K = ⊔_Υ 𝒵_K(Υ) set-theoretically; the closure of 𝒵_K(Υ) is ⊔_{Υ′ ≼ Υ} 𝒵_K(Υ′). For every Siegel cone label Υ‡, the reduced preimage (𝒮^Σ_K ×_{𝒮^{Σ‡}} 𝒵_{K‡}(Υ‡))_red is normal and flat over ℤ_(p) and is the disjoint union of the 𝒵_K(Υ) with ι_\*Υ = Υ‡. In particular every stratum is flat over O, the boundary contains no irreducible component of the special fibre, and every boundary point of the special fibre lifts to characteristic zero in the same stratum.

*Hypotheses.*
- (G, X) of Hodge type; Σ induced; no hypothesis on K_p.

*Proof sketch.*
- Flatness and normality of reduced preimages of Siegel strata: by C10.2 the completed ring of the preimage is R^sab_G ⊗̂ of the completed ring of a toric stratum of Ξ^⋄_G(σ_G), whose reduced closed stratum is a torus, smooth over ℤ (Proposition 4.2.4).
- The finite birational map from ⊔_{ι_\*Υ=Υ‡} 𝒵_K(Υ) to this normal flat scheme is an isomorphism (Corollary 4.2.5); the closure relation follows from the characteristic-zero relation and that of the Chai–Faltings compactification.

*Sources.* [MP19], Theorem 4.1.5(2),(3), p. 71; Proposition 4.2.4 and Corollary 4.2.5, pp. 75–77: Stratifies 𝒮^Σ_K by the normalized strata with the expected closure relation and shows the reduced preimages of Siegel strata are normal and flat over ℤ_(p).

*Needs:* C10.2; C7.9; ShimuraCompactifications C5 (integral-toroidal-space); ShimuraCompactifications C2 (arithmetic-gluing).

**Checks.**

- No irreducible component of the special fibre of 𝒮^Σ_K lies in the boundary (used by Boxer–Pilloni, sourceIssues E67).
- For the modular curve at level K_0(p) the strata are the interior and the cusps, each flat over ℤ_p.

### C10.6 Formal completions along strata

Prove (theorem, node `C10/formal-completion`): For Υ = [(Φ, σ)], the canonical isomorphism 𝒵_{K_Φ}(Q_Φ, D_Φ, σ) ≅ 𝒵_K(Υ) lifts to an isomorphism of formal algebraic spaces 𝒮̂_{K_Φ}(Q_Φ, D_Φ, σ) ≅ (𝒮^Σ_K)^∧_{𝒵_K(Υ)} between the completion of the twisted torus embedding along its closed stratum and the completion of 𝒮^Σ_K along the stratum, restricting on the generic fibre to Pink's isomorphism (ShimuraCompactifications C2) and compatible with the finite maps to the Siegel completions.

*Hypotheses.*
- Same setting.

*Proof sketch.*
- Both formal spaces are finite over the Siegel completion (𝒮^{Σ‡}_{K‡})^∧ ≅ 𝒮̂_{K‡_{Φ‡}}(…, σ‡); by the extension lemma for finite normal formal algebras (Madapusi Pera A.3.2) it suffices to compare complete local rings at points of the special fibre as algebras over the Siegel complete local ring.
- These agree by the proof of C10.4 and C10.2 (Proposition 4.2.13).

*Sources.* [MP19], Theorem 4.1.5(5), pp. 71–72; Proposition 4.2.13, p. 79: Identifies the completion of 𝒮^Σ_K along a stratum with the completion of the normalized twisted torus embedding along its closed stratum.

*Needs:* C10.4; C10.2; ShimuraCompactifications C5 (formal-completion); ShimuraCompactifications C2 (partial-boundary-charts).

**Checks.**

- Over the generic fibre the isomorphism is Pink's description of the completion along a boundary stratum.
- For the Siegel datum at hyperspecial level it is the formal completion statement of ShimuraCompactifications C5.4.

### C10.7 Toroidal compactifications of Hodge type (Madapusi Pera, Theorem 1)

Prove (theorem, node `C10/main-theorem`): For (G, X) of Hodge type, any neat K (arbitrary at p), an auxiliary Siegel datum and an induced complete admissible Σ: 𝒮^Σ_K is a proper normal flat algebraic space over O_{E,(v)} containing 𝒮_K as an open dense subspace whose complement is a relative effective Cartier divisor over O_{E,(v)}; it carries the stratification of C10.5 with completions described by C10.6; every point has an étale neighbourhood V such that V|_{𝒮_K} ↪ V is étale over 𝒮_{K_Φ}(Q_Φ, D_Φ) ↪ 𝒮_{K_Φ}(Q_Φ, D_Φ, σ) for some Φ, σ. After replacing Σ by a smooth refinement (with its normalized model), every complete local ring of 𝒮^Σ_K at a geometric point of the stratum of (Φ, σ) is isomorphic to a power series ring over a complete local ring of the abelian-torsor base 𝒮_{K_Φ}(Q_Φ, D̄_Φ) (and over one of 𝒮_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}) under the level hypothesis of C10.3), hence to a complete local ring of 𝒮_K: the singularities of the compactification are no worse than those of the interior. Consequently étale-local properties (smoothness, reducedness, Cohen–Macaulayness, local complete intersection) of 𝒮_K and of the boundary pure models pass to 𝒮^Σ_K.

*Hypotheses.*
- Hodge type; neat level; Σ induced and complete; the refinement statement uses the refined normalized model of C10.8.

*Proof sketch.*
- Combine C10.6 with Artin approximation (AlgebraicModuliForArithmeticGeometry R09.6) to obtain the étale neighbourhood comparison.
- The complement of the open torsor in a twisted torus embedding is a relative Cartier divisor; transport this through the étale comparison and the stratification.
- For a smooth refinement both the torsor and its torus embedding are smooth over the abelian-torsor base 𝒮_{K_Φ}(Q_Φ, D̄_Φ); since 𝒮_K is étale locally isomorphic to the torsor near the boundary, every complete local ring of the base times a power series ring occurs as a complete local ring of 𝒮_K. Under the level hypothesis of C10.3 the base is an abelian-scheme torsor over 𝒮_{K_Φ,h}.

*Sources.* [MP19], Theorem 1, p. 3, and its proof, p. 72: States and proves that the normalized model is a compactification with relative Cartier boundary, the expected stratification and completions, and singularities no worse than those of the interior after refinement.

*Needs:* C10.6; C10.5; C10.4; AlgebraicModuliForArithmeticGeometry R09.6.

**Checks.**

- For K_p arbitrary the theorem is agnostic to the special fibre of 𝒮_K: it holds where G is ramified at p.
- For the modular curve at level K_0(p) the boundary is the finite flat cusp divisor and the singularities at cusps are smooth points.

### C10.8 Refinements and independence of the Siegel decomposition

Prove (theorem, node `C10/refinements`): (1) 𝒮^Σ_K does not depend on the choice of Σ‡ with ι^\*Σ‡ = Σ. (2) For an admissible refinement Σ′ of Σ there is a normal integral model 𝒮_K ↪ 𝒮^{Σ′}_K over O_{E,(v)} with a proper birational map 𝒮^{Σ′}_K → 𝒮^Σ_K extending Sh^{Σ′}_K → Sh^Σ_K and stratifications satisfying the conclusions of C10.7; the auxiliary datum can be chosen so that Σ′ is induced. (3) For the refinement map f : 𝒮^{Σ′}_K → 𝒮^Σ_K, f_\*O = O and R^if_\*O = 0 for i > 0.

*Hypotheses.*
- Same setting; Σ′ admissible refining Σ.

*Proof sketch.*
- (1) from C10.6 and the extension lemma A.3.4: the completions along strata do not involve Σ‡.
- (2) by the toroidal-embedding methods of Kempf–Knudsen–Mumford–Saint-Donat Ch. II applied to the étale-local charts, or by choosing the Siegel decomposition so that Σ′ is induced (Harris, as cited in Remark 4.1.6).
- (3) étale locally f is a toric refinement of twisted torus embeddings over the normal base, so ShimuraCompactifications C3 (universal toric structure-sheaf acyclicity) applies (Madapusi Pera 5.1.3(2), following Faltings–Chai V.1.2(b)).

*Sources.* [MP19], Remark 4.1.6, p. 72; proof of Proposition 5.1.3(2), p. 83: Shows independence of Σ‡, constructs models for refinements with the same stratification properties, and deduces the vanishing of higher direct images of the structure sheaf from the étale-local structure.

*Needs:* C10.7; ShimuraCompactifications C3 (toric-structure-sheaf-vanishing); ShimuraCompactifications C3 (refinement-map).

**Checks.**

- For the blow-up of a smooth two-dimensional cone the refinement map has f_\*O = O and no higher direct images.
- Two Siegel decompositions inducing the same Σ give canonically isomorphic models.

### C10.9 Embeddings of Shimura data and Hecke correspondences

Prove (theorem, node `C10/functoriality`): Let η : (G′, X′) ↪ (G, X) be an embedding of Hodge-type data, K′ ⊂ G′(𝔸_f) neat, g ∈ G(𝔸_f) with gη(K′)g^{-1} ⊂ K, and Σ′ admissible for (G′, X′, K′) refining (η, g)^\*Σ, with Σ complete. Then the finite map 𝒮_{K′} → O_{E′,(v′)} ⊗ 𝒮_K extends uniquely to (η, g) : 𝒮^{Σ′}_{K′} → O_{E′,(v′)} ⊗ 𝒮^Σ_K, carrying 𝒵_{K′}(Υ′) into 𝒵_K((η, g)_\*Υ′) and inducing on formal completions the maps of boundary charts (4.1.12.2). In particular prime-to-p Hecke correspondences (η = id, g ∈ G(𝔸_f^p)) extend to toroidal models for compatible pairs of cone decompositions; they do not act on a single fixed Σ in general.

*Hypotheses.*
- Hodge type; the place v′ of E′ lies over v; Σ complete; compatibility of cone decompositions is part of the hypothesis.

*Proof sketch.*
- On boundary charts the map (4.1.12.1) of normalized boundary towers is finite and extends to the twisted torus embeddings for cones with η(σ′) ⊂ σ meeting σ°.
- Glue by the characteristic-zero map of ShimuraCompactifications C3 and the extension lemma for normal formal completions (Madapusi Pera 2.1.29 and A.3.4).

*Sources.* [MP19], §4.1.12 and Proposition 4.1.13, pp. 73–74: Extends maps of integral models for embeddings of Shimura data and Hecke translations to toroidal models for compatible cone decompositions, compatibly with strata and formal completions.

*Needs:* C10.6; ShimuraCompactifications C3 (level-datum-functoriality); ShimuraCompactifications C3 (hecke-span).

**Checks.**

- Over a one-dimensional cusp of a GSpin variety the cone decomposition is forced, so prime-to-p Hecke correspondences extend uniquely over the preimage of the complement of the zero-dimensional cusps (C15.3).

### C10.10 Properness of the interior

Prove (theorem, node `C10/projectivity-criterion`): 𝒮_K is proper (equivalently projective) over O_{E,(v)} if and only if G^ad is ℚ-anisotropic, if and only if G^ad(ℚ) contains no nontrivial unipotent element.

*Hypotheses.*
- Hodge type; neat K.

*Proof sketch.*
- If G^ad has a proper ℚ-parabolic, the boundary of 𝒮^Σ_K is a nonempty relative Cartier divisor flat over O (C10.5), so 𝒮_K is not proper.
- If not, Σ is empty, 𝒮^Σ_K = 𝒮_K is proper (and projective by C12.4).

*Sources.* [MP19], Corollary 4.1.7, p. 72: Characterizes properness of the integral model by anisotropy of G^ad, read off from the stratification.

*Needs:* C10.7; C10.5.

**Checks.**

- Shimura curves attached to indefinite quaternion algebras over ℚ give proper integral models; modular curves do not.

### C10.11 Potential good reduction when the Mumford–Tate group is anisotropic (Morita)

Prove (theorem, node `C10/morita-conjecture`): Let A be an abelian variety over a number field F whose Mumford–Tate group MT_A is anisotropic modulo its centre. Then A has potentially good reduction at every finite place of F.

*Hypotheses.*
- F a number field; MT_A is independent of the complex embedding (Deligne).

*Proof sketch.*
- By Zarhin's trick replace A by an abelian variety isogenous to A^8 with a principal polarization.
- (MT_A, X_A) ↪ (GSp(H), S^±(H)) is an embedding of Shimura data of Hodge type; with K = K‡ ∩ G(𝔸_f) the integral model 𝒮_K is proper over O_{E,(v)} by C10.10.
- A arises from an F′-point of 𝒮_K for a finite F′/F; by properness it extends over O_{F′,(v′)}, so A has good reduction at v′.

*Sources.* [MP19], Theorem 5, p. 6; Theorem 4.1.9 and its proof, pp. 72–73: Deduces Morita's conjecture from the properness criterion for integral models of Hodge type.

*Needs:* C10.10; C7.2.

**Checks.**

- An abelian variety with CM by a field (Mumford–Tate group a torus, hence anisotropic modulo centre) has potentially good reduction everywhere.
- An elliptic curve with non-integral j-invariant has Mumford–Tate group GL_2, which is isotropic, so the theorem does not apply.

### C10.12 Connected components of the integral model

Prove (theorem, node `C10/connected-components`): If the special fibre k(v) ⊗ 𝒮_K is geometrically reduced, then for every finite F/E and place w | v the natural maps π_0(F ⊗_E Sh_K) ← π_0(O_{F,(w)} ⊗ 𝒮_K) → π_0(k(w) ⊗ 𝒮_K) are bijections.

*Hypotheses.*
- Hodge type; geometric reducedness of the special fibre of the interior is a hypothesis.

*Proof sketch.*
- By C10.7 the special fibre of 𝒮^Σ_K is geometrically reduced, and 𝒮_K is fibrewise dense in it.
- For a flat proper algebraic space with geometrically reduced special fibre, Stein factorization reduces to a finite étale O_{E,(v)}-scheme, where the bijections are clear.

*Sources.* [MP19], Corollary 4.1.11 and its proof, p. 73: Compares connected components of generic, integral and special fibres when the special fibre is geometrically reduced.

*Needs:* C10.7; SchemeAndStackFoundations SF.2.

**Checks.**

- For the modular curve with neat level the special fibre is geometrically reduced and the three sets of components are the components of the cyclotomic field of the level.
- The hypothesis of geometric reducedness cannot be dropped: for the level K_1(p^2) model the special fibre is nonreduced.

### C10.13 Rationality of Hodge cycles under p-adic uniformization (étale form)

Prove (theorem, node `C10/etale-rationality`): Let A be an abelian variety over a number field F with totally degenerate reduction at a place v (a torus with character group X_g = ℤ^g), Raynaud uniformization 1 → X_g → Hom(X_g, 𝔾_m)^an → A^an_{F_v} → 1, and for each prime ℓ let U_ℓ ⊂ GL(V_ℓ(A)) be the unipotent radical stabilizing the induced extension 0 → X_g ⊗ ℚ_ℓ(1) → V_ℓ(A) → Hom(X_g, ℚ_ℓ) → 0, so Lie U_ℓ = ℚ_ℓ(1) ⊗ Hom(X_g^∨, X_g). Let G = MT_A. Then B_G := Hom(X_g^∨, X_g) ∩ (Lie G_{ℚ_ℓ})(−1) is independent of ℓ, and ℚ_ℓ(1) ⊗ B_G ≅ Lie U_ℓ ∩ Lie G_{ℚ_ℓ} for every ℓ.

*Hypotheses.*
- Totally degenerate reduction at v; the image of G_{ℚ_ℓ} in GL(V_ℓ(A)) is determined up to inner automorphism.

*Proof sketch.*
- Realize A as a point of the Hodge-type Shimura variety of (MT_A, X_A) near a zero-dimensional cusp of the Siegel boundary.
- The torus torsor of C10.4 has cocharacter lattice B_K(Φ) = B_G at the corresponding point; the non-emptiness of the torsor I(Υ, s_0) of tensor-preserving level structures identifies 𝔸_f(1) ⊗ Lie W_Φ with Lie U_{G,𝔸_f} (Remark 4.2.12).

*Sources.* [MP19], Theorem 4, p. 5; Remark 4.2.12, p. 79: States the ℓ-independent rationality of Hodge cycles with respect to p-adic uniformization and deduces it from the flatness of the boundary and the tensor-preserving level torsor.

*Needs:* C10.4; NeronModelsAndSemistableAbelianVarieties R11.3.

**Checks.**

- For a product of Tate curves E_{q_1} × E_{q_2} with multiplicatively independent q_i the Mumford–Tate group is GL_2 ×_{G_m} GL_2 and B_G has rank 2.
- B_G does not depend on ℓ.

## Layer C11: Hyperspecial level: smooth canonical compactifications

At hyperspecial level with a p-integral Hodge embedding (§4.3.2) and Kisin's smoothness of the interior (an input recorded as a gap): reductive models of the boundary data and smoothness of the boundary towers; smooth (projective for projective Σ) toroidal compactifications with relative normal crossings boundary, independent of the embedding (Theorem 2); canonical integral models of the boundary mixed Shimura varieties (Proposition 4.3.5); the logarithmic de Rham bundle H_dR(Σ), the extension of the de Rham tensors and the G_{ℤ_(p)}- and P_μ-torsors over the compactification, independent of the embedding (4.3.1, 4.3.7, 4.3.9, 4.3.10); unramified good reduction of the boundary torus torsors ξ_K → C_K and their torus embeddings (Farb–Kisin–Wolfson Corollary 3.3.18); canonicity of the minimal compactification and smoothness of the stratum maps (Theorem 5.3.1).

*Layer dependencies:* C10, C12, ReductiveGroupsPartII RG2.3, AutomorphicBundles B1, AutomorphicBundles B3.

### C11.1 p-integral Hodge embeddings

Define (definition, node `C11/p-integral-embedding`): A p-integral Hodge embedding of (G, X) is a Hodge embedding ι : (G, X) ↪ (GSp(H), S^±(H)) together with a reductive model G_{ℤ_(p)} of G over ℤ_(p), a ℤ-lattice H(ℤ) on which ψ is perfect, and a closed immersion of ℤ_(p)-groups G_{ℤ_(p)} ↪ GL(H_{ℤ_(p)}) extending ι, such that K_p = G_{ℤ_(p)}(ℤ_p) (hyperspecial) and K‡_p is the stabilizer of H(ℤ_p); in addition one fixes tensors {s_α} ⊂ H(ℤ_(p))^⊗ whose pointwise stabilizer in GL(H_{ℤ_(p)}) is G_{ℤ_(p)}.

*Hypotheses.*
- G admits a reductive model over ℤ_(p); such lattices and tensors always exist (Kisin 2.3.1, 1.3.2; Kim–Madapusi Pera for p = 2).

*Proof sketch.*
- Choose a G_{ℤ_(p)}-stable lattice (Kisin, Lemma 2.3.1) and, by Zarhin's trick, a self-dual one (C7.2).
- A reductive closed subgroup of GL(H_{ℤ_(p)}) is the pointwise stabilizer of finitely many tensors (Kisin, Proposition 1.3.2).

*Sources.* [MP19], §4.3.2, p. 80, and §4.3.6, p. 81: Defines p-integral symplectic embeddings and arranges integral tensors cutting out the reductive model, citing Kisin.

*Uses.* Madapusi Pera Theorem 2 and §4.3: the hyperspecial hypothesis under which the compactification is smooth and canonical; Maulik–Shankar–Tang §8.1: the GSpin lattice self-dual at p gives a p-integral embedding via Kuga–Satake.

The API:
- `PIntegralHodgeEmbedding` (structure): The data (ι, G_{ℤ_(p)}, H(ℤ), {s_α}) with the closed immersion and the hyperspecial level.
- `PIntegralHodgeEmbedding.toAuxiliary` (coercion): The singleton auxiliary Siegel datum it defines.
- `PIntegralHodgeEmbedding.sum` (constructor): The direct sum of two p-integral embeddings of the same G_{ℤ_(p)}, via the diagonal.
- `PIntegralHodgeEmbedding.tensors` (projection): The tensors {s_α} ⊂ H(ℤ_(p))^⊗ with stabilizer G_{ℤ_(p)}.

*Needs:* C7.1; ReductiveGroupsPartII RG2.3.

**Checks.**

- `PIntegralHodgeEmbedding.siegel_test` (degenerate): For G = GSp(H) with H(ℤ) self-dual, the identity with the tensor ψ is p-integral at every p.
- `PIntegralHodgeEmbedding.paramodular_test` (non-example): For GSp_4 with K_p the paramodular group the level is not hyperspecial, so no p-integral embedding has this K_p.
- `PIntegralHodgeEmbedding.unitary_test` (computation): For a unitary group of an imaginary quadratic field unramified at p, the standard representation with a self-dual hermitian lattice is p-integral, the tensors being the O-action and the pairing.
- Every Hodge-type datum with G unramified at p admits a p-integral embedding after Zarhin's replacement.
- The tensors cut out exactly G_{ℤ_(p)} inside GL(H_{ℤ_(p)}).

### C11.2 Smooth toroidal compactifications at hyperspecial level (Madapusi Pera, Theorem 2)

Prove (theorem, node `C11/smooth-toroidal`): Assume ι is p-integral (C11.1), p > 2 or the hypotheses of Kim–Madapusi Pera at p = 2, so that 𝒮_K is smooth over O_{E,(v)} (Kisin). Then: the boundary pure models 𝒮_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}) are smooth, the parabolic P_Φ extends to a parabolic of G_{ℤ_(p)} and G_{Φ,h} has a reductive model with hyperspecial level; the boundary towers 𝒮_{K_Φ}(Q_Φ, D_Φ) → 𝒮_{K_Φ}(Q_Φ, D̄_Φ) → 𝒮_{K_Φ,h} are a torus torsor over an abelian-scheme torsor over a smooth base; for smooth complete Σ, 𝒮^Σ_K is smooth over O_{E,(v)} (projective when Σ is projective) with boundary a relative normal crossings divisor; and 𝒮^Σ_K with its stratification depends only on Σ, not on the p-integral embedding.

*Hypotheses.*
- p-integral embedding at hyperspecial level; Kisin's smoothness theorem for 𝒮_K and for the boundary data (recorded as a gap owned by ShimuraVarietiesPartII).

*Proof sketch.*
- Boundary data: P_Φ extends by properness of the scheme of parabolics; Q_Φ extends with reductive image in the Levi (Madapusi Pera 4.3.4, citing Pink 1.6.9), so K_{Φ,h,p} is hyperspecial and Kisin's theorem applies to 𝒮_{K_Φ,h}.
- The tower is smooth over the base by C10.4 and C10.3 (here n = 1).
- The immersion 𝒮_K ↪ 𝒮^Σ_K is étale locally 𝒮_{K_Φ}(Q_Φ, D_Φ) ↪ 𝒮_{K_Φ}(Q_Φ, D_Φ, σ), smooth with normal crossings boundary for smooth σ (C10.7).
- Independence of the embedding: the boundary integral models are canonical (C11.3) and the completions along strata are determined by them (A.3.4).

*Sources.* [MP19], Theorem 2, p. 4; §4.3.3–4.3.4 and proof of Theorem 2, pp. 80–81: Proves smoothness and normal crossings of the toroidal compactification of Kisin's model at hyperspecial level, and independence of the symplectic embedding. [MST], §8.1, p. 37: Uses that the canonical integral model of the GSpin Shimura variety has a smooth toroidal compactification whose boundary strata are flat divisors with formal completions of the expected shape.

*Needs:* C10.7; C10.3; C11.1; C11.3; recorded input: Kisin's smoothness of integral models of Hodge type at hyperspecial level.

**Checks.**

- For a PEL datum at a good prime this recovers Lan's smooth compactification (ShimuraCompactifications C5).
- For the modular curve with neat prime-to-p level the compactification is the smooth compactified modular curve over ℤ_(p).

### C11.3 Canonical models of the boundary mixed Shimura varieties

Prove (theorem, node `C11/canonical-boundary-models`): At hyperspecial level with a p-integral embedding, the projective limit 𝒮_p(Q_Φ, D_Φ) = lim_{K^p} 𝒮_{K_{Φ,h,p}K^p_Φ}(Q_Φ, D_Φ) (finite étale transition maps) is a regular, formally smooth O_{E,(v)}-scheme locally of finite type with generic fibre Sh_p(Q_Φ, D_Φ), and it is a canonical model: for every regular formally smooth O_{E,(v)}-scheme S, every map E ⊗ S → Sh_p(Q_Φ, D_Φ) extends to S → 𝒮_p(Q_Φ, D_Φ). It and its Q_Φ(𝔸_f^p)-action depend only on (G, X) and G_{ℤ_(p)}.

*Hypotheses.*
- p-integral embedding; Kisin's smoothness for the boundary pure data.

*Proof sketch.*
- Smoothness from C11.2 (its boundary part) and the fact that the tower is étale locally isomorphic to 𝒮_K.
- Extension property as in Kisin's proof of 2.3.8, replacing the extension theorems for abelian schemes by those for 1-motives (Madapusi Pera A.3.5, A.3.6).

*Sources.* [MP19], §4.3.4 and Proposition 4.3.5, pp. 80–81: Shows the prime-to-p limit of the normalized boundary mixed Shimura models is a canonical integral model with the extension property for regular formally smooth schemes.

*Needs:* C10.4; C11.1; C9.1; recorded input: Kisin's smoothness of integral models of Hodge type at hyperspecial level.

**Checks.**

- For the Siegel datum at hyperspecial level the canonical boundary models are the Faltings–Chai integral boundary moduli.
- The extension property fails for non-formally-smooth S (for instance ℤ_p[√p]).

### C11.4 The de Rham G-torsor over the compactification

Prove (theorem, node `C11/de-rham-torsors`): At hyperspecial level with a p-integral embedding and smooth complete Σ: (1) the first relative de Rham homology of the universal abelian scheme extends, with its Hodge filtration and an integrable connection with logarithmic poles along the boundary, to a filtered vector bundle H_dR(Σ) on 𝒮^Σ_K, characterized on completions along strata by the de Rham realization of the universal 1-motive (via the log Dieudonné crystal); (2) the de Rham tensors s_{α,dR} on 𝒮_K extend uniquely to sections s_{α,dR,Σ} ∈ H^0(𝒮^Σ_K, H_dR(Σ)^⊗); (3) the functor P^Σ_dR(ι) of trivializations O_T ⊗ H(ℤ_(p)) ≅ H_dR(Σ)|_T carrying s_α to s_{α,dR,Σ} is a G_{ℤ_(p)}-torsor extending P_dR(ι), and the sub-functor respecting the Hodge filtration is a canonical reduction to a P_μ-torsor over O_{F,(w)} ⊗ 𝒮^Σ_K for a model μ of the Hodge cocharacter; (4) for another p-integral embedding ι′ there are canonical isomorphisms P^Σ_dR(ι) ≅ P^Σ_dR(ι′) and P^Σ_dR,μ(ι) ≅ P^Σ_dR,μ(ι′).

*Hypotheses.*
- p-integral embedding; smooth complete Σ; F/E finite with a place w | v over which μ is defined.

*Proof sketch.*
- (1): evaluate the log Dieudonné crystal of the tautological 1-motive on boundary charts (C9.4), descend by faithfully flat descent and glue (Madapusi Pera 4.3.1); it agrees with the analytic canonical extension over ℂ.
- (2)–(3): the complement U of the special fibre of the boundary has codimension 2 in the normal 𝒮^Σ_K, so vector bundles and their sections extend uniquely from U; over 𝒮_K this is Kisin's 2.3.9, and over the generic fibre near the boundary the tensors extend by the analytic description (Madapusi Pera 4.3.7, 4.3.9).
- (4): compare both with the torsor of the direct-sum embedding; check over Sh_K(ℂ) (Proposition 4.3.10).

*Sources.* [MP19], §4.3.1 and Propositions 4.3.7, 4.3.9 and 4.3.10, pp. 80–82: Extends the de Rham bundle with log connection, the de Rham tensors and the G- and P_μ-torsors of tensor-preserving trivializations over the compactification, independently of the embedding.

*Needs:* C11.2; C9.4; C9.2; AutomorphicBundles B1; AutomorphicBundles B3; recorded input: Kisin's smoothness of integral models of Hodge type at hyperspecial level.

**Checks.**

- For the Siegel datum the torsor is the frame bundle of H_dR(Σ) with its symplectic form, the canonical extension of AutomorphicBundles B3.

### C11.5 Unramified good reduction of boundary torus torsors

Prove (theorem, node `C11/fkw-good-reduction`): Let (G, X) be of Hodge type, G reductive over ℤ_p (K_p = G(ℤ_p) hyperspecial, p > 2 or p = 2 under Kim–Madapusi Pera), K = K_pK^p neat, P ⊂ G a ℚ-parabolic as in Farb–Kisin–Wolfson 3.3.11 with unipotent radical U and centre Z, ξ_K = U(ℤ)\U(ℝ)Z(ℂ) → C_K the torus bundle over the abelian scheme C_K, and Σ a fan in X_\*(Z(ℂ)/Z(ℤ))_ℚ giving a smooth torus embedding ξ_K(Σ) with normal crossings boundary D_K(Σ). Then (ξ_K(Σ), D_K(Σ)) and ξ_K → C_K have unramified good reduction at p in the sense of Farb–Kisin–Wolfson 2.2.12: they extend to a smooth torus embedding with relative normal crossings boundary over a smooth abelian-scheme torsor over an absolutely unramified discrete valuation ring O_{E_v} (E_v/ℚ_p unramified), namely the normalized boundary tower and twisted torus embeddings of the corresponding cusp label.

*Hypotheses.*
- Hyperspecial level; ξ_K and C_K identified with the analytifications of the boundary mixed Shimura varieties of Madapusi Pera §2.1.7, 2.1.13 (Pink 6.10).
- Farb–Kisin–Wolfson 2.2.12 defines unramified good reduction for proper smooth pairs; for the nonproper pair (ξ_K(Σ), D_K(Σ)) the definition is used with properness omitted, as in their Theorem 3.3.17.

*Proof sketch.*
- Identify ξ_K → C_K with the boundary tower Sh_{K_Φ}(Q_Φ, D_Φ) → Sh_{K_Φ}(Q_Φ, D̄_Φ) over a zero-dimensional pure base for the cusp label of P (FKW 3.3.11 citing Pink and Madapusi Pera 2.1).
- By C11.2 the integral boundary tower is a torus torsor over an abelian-scheme torsor over a smooth (here finite étale) base, and the twisted torus embeddings for smooth σ are smooth with relative normal crossings boundary.
- E_v is unramified over ℚ_p because G is unramified at p, so O_{E_v} is absolutely unramified; descend from O_{E,(v)} to O_{E_v} by completion.

*Sources.* [FKW], §3.3.11, p. 34; Corollary 3.3.18, p. 36; §2.2.12, p. 15: Defines the torus bundle ξ_K over the abelian scheme C_K at a cusp and its smooth torus embeddings, and states that for Hodge type with reductive G over ℤ_p, p is a prime of unramified good reduction for ξ_K, by Madapusi Pera. [MP19], Theorem 4.1.5(4) and §4.3, pp. 71 and 80–81: Supplies the integral torus torsors and their smoothness at hyperspecial level.

*Needs:* C11.2; C10.4; C7.8; recorded input: Kisin's smoothness of integral models of Hodge type at hyperspecial level.

**Checks.**

- For FKW's parabolic the pure part is zero-dimensional, so C_K is an abelian scheme over a finite étale O_{E,(v)}-scheme.

### C11.6 Canonicity of the minimal compactification at hyperspecial level

Prove (theorem, node `C11/canonical-minimal`): At hyperspecial level with a p-integral embedding, the minimal compactification 𝒮^min_K of C12.4 and its stratification are, up to unique isomorphism, independent of the p-integral embedding; for every admissible Σ, cusp label Φ and σ ∈ Σ(Φ), the induced map 𝒵_K([(Φ, σ)]) → 𝒵_K([Φ]) is smooth.

*Hypotheses.*
- Hyperspecial level; p-integral embeddings.

*Proof sketch.*
- Compare the minimal models of two embeddings via the normalization of the image of the product map from the canonical toroidal model; both projections are isomorphisms on 𝒮_K ∪ Sh^min_K, whose complement has codimension ≥ 2.
- Smoothness: the quotient map 𝒮_{K_Φ,h} → Δ^fin_K(Φ)\𝒮_{K_Φ,h} is étale because the map to the Siegel boundary model factors through it and is unramified (Kisin 2.3.9: complete local rings of 𝒮_{K_Φ,h} are quotients of Siegel ones).

*Sources.* [MP19], Theorem 5.3.1 and its proof, pp. 88–89: Proves independence of the minimal compactification from the p-integral embedding and smoothness of the toroidal-to-minimal stratum maps at hyperspecial level.

*Needs:* C12.4; C11.2; recorded input: Kisin's smoothness of integral models of Hodge type at hyperspecial level.

**Checks.**

- For the Siegel datum the minimal model is Faltings–Chai's integral minimal compactification and the stratum maps are smooth.
- Two p-integral embeddings give the same minimal compactification up to unique isomorphism.

## Layer C12: Minimal compactifications of Hodge type

The Hodge line on the normalized toroidal model and its boundary decomposition (Definition 5.1.1, 5.1.4); semiampleness, invariance of its sections under refinement and finite generation (Proposition 5.1.3); Fourier–Jacobi expansions, their independence of the cone and positivity of support (5.1.5–5.1.8); the minimal compactification 𝒮^min_K as Proj of the Hodge section algebra with its contraction, universal property, flat boundary, ample Hodge line, stratification by Δ^fin_K(Φ)\𝒮_{K_Φ,h}, compatibility with toroidal strata and the Koecher principle (5.2.1–5.2.11); complete local rings at boundary points (Corollary 5.2.8); Hecke correspondences on 𝒮^min_K (Proposition 5.2.13); and the coordinates and unipotent action at zero-dimensional cusps used by Maulik–Shankar–Tang §8.2.

*Layer dependencies:* C10, ShimuraCompactifications C2, ShimuraCompactifications C5.

### C12.1 The Hodge line on the normalized toroidal model

Define (definition, node `C12/hodge-bundle`): For an auxiliary Siegel datum and complete Σ, the Hodge line ω_K(Σ) on 𝒮^Σ_K is the pullback along ν of ω_{K‡}(Σ‡) = det(H_dR(Σ‡)/F^0H_dR(Σ‡))^{⊗−1} on the good Siegel model, equivalently det(Lie^∨) of the pulled-back universal semi-abelian scheme. On a boundary chart of a cusp label Φ it decomposes as ω_K(Φ) = ω^ét(Φ) ⊗_ℤ ω^ab_K(Φ), where ω^ab_K(Φ) is the Hodge line of the abelian scheme over 𝒮_{K_Φ,h} and ω^ét(Φ) = det(gr^W H^g(ℤ))^{⊗−1} is a free ℤ-module of rank one; in particular ω_K(Φ) is pulled back from 𝒮_{K_Φ,h}.

*Hypotheses.*
- Σ complete; the decomposition uses the weight-graded pieces of the de Rham realization of the 1-motive (C9.1).

*Proof sketch.*
- Pull back along the finite map ν (C7.5).
- Independence of K‡ and Σ‡: two choices are dominated by a third through finite maps, and the Siegel Hodge lines pull back to each other.
- On boundary charts take determinants of the weight-graded pieces of H_dR(Φ, σ) (Madapusi Pera (5.1.4.1)).

*Sources.* [MP19], Definition 5.1.1, §5.1.2 and §5.1.4, pp. 83–84: Defines the Hodge bundle on the Siegel compactification, restricts it to 𝒮^Σ_K, shows independence of choices and compatibility with refinements, and decomposes it on boundary charts.

*Uses.* Madapusi Pera §5.2: the minimal compactification is the Proj of its section ring; Pilloni §6.2.2: X^⋆ and X^⋆_par are Proj of sections of ω.

The API:
- `hodgeLine` (constructor): ω_K(Σ) on 𝒮^Σ_K, an invertible sheaf.
- `hodgeLine_pullback_refinement` (functoriality): For a refinement f : 𝒮^{Σ′}_K → 𝒮^Σ_K, f^\*ω_K(Σ) ≅ ω_K(Σ′).
- `hodgeLine_independent` (other): ω_K(Σ) does not depend on the auxiliary datum used to construct 𝒮^Σ_K up to canonical isomorphism, for data related by finite maps.
- `hodgeLine_boundary` (characterisation): On the chart of Φ, ω_K(Σ) ≅ ω^ét(Φ) ⊗ ω^ab_K(Φ), pulled back from 𝒮_{K_Φ,h}.
- `hodgeLine_interior` (compatibility): On 𝒮_K, ω_K(Σ) is the determinant of the Lie algebra dual of the universal abelian scheme pulled back from the Siegel model.

*Needs:* C7.5; C9.1; ShimuraCompactifications C5 (hodge-semiampleness).

**Checks.**

- `hodgeLine_modular_test` (computation): For the modular curve, ω is the usual line of weight-one forms; ω^{⊗2} ≅ Ω¹(log cusps) and ω^{⊗12} has the section Δ.
- `hodgeLine_zeroDim_test` (degenerate): At a zero-dimensional cusp the abelian part is zero and ω_K(Φ) ≅ ω^ét(Φ) is trivial on the chart.
- `hodgeLine_notAmple_test` (non-example): On a positive-dimensional fibre of the contraction to the minimal compactification (for instance the exceptional fibres over the Siegel cusp in genus two) ω_K(Σ) is trivial, so ω_K(Σ) is semiample but not ample.
- ω_K(Σ) is ample on 𝒮_K up to the boundary contraction: its pushforward to the minimal compactification is ample.
- For the modular curve ω^{⊗2} ≅ Ω¹(log cusps).

### C12.2 Sections of the Hodge line

Prove (theorem, node `C12/hodge-sections`): (1) A positive power of ω_K(Σ) is generated by its global sections over 𝒮^Σ_K. (2) For a refinement Σ′ of Σ and n ≥ 0, H^0(𝒮^Σ_K, ω^{⊗n}) → H^0(𝒮^{Σ′}_K, ω^{⊗n}) is an isomorphism. (3) The graded O_{E,(v)}-algebra ⊕_n H^0(𝒮^Σ_K, ω^{⊗n}) is finitely generated.

*Hypotheses.*
- Σ complete; O_{E,(v)} excellent.

*Proof sketch.*
- (1) Moret-Bailly's theta-constant argument for semi-abelian families over normal excellent bases (ShimuraCompactifications C5.32, hodgeLine_generated), as in Faltings–Chai V.2.1.
- (2) Projection formula with f_\*O = O and R^if_\*O = 0 (C10.8).
- (3) From (1) and properness as in Lan's book 7.2.2.6.

*Sources.* [MP19], Proposition 5.1.3, p. 83: Proves semiampleness of the Hodge line, invariance of its sections under refinement and finite generation of its section algebra.

*Needs:* C12.1; C10.8; ShimuraCompactifications C5 (hodge-semiampleness); ShimuraCompactifications C5 (graded-section-finite-generation).

**Checks.**

- For the modular curve, ω^{⊗12} is generated by Δ and E_4^3.
- Sections of ω^{⊗n} on 𝒮^Σ_K and on any refinement agree.

### C12.3 Fourier–Jacobi expansions on Hodge-type models

Construct (construction, node `C12/fourier-jacobi`): For a cusp label representative Φ, write 𝒮_{K_Φ}(Q_Φ, D_Φ) = Spec_{𝒮_{K_Φ}(Q_Φ,D̄_Φ)} ⊕_{ℓ∈S_K(Φ)} Ψ(ℓ)_K(Φ), S_K(Φ) the character group of E_K(Φ) and Ψ(ℓ) line bundles, and set FJ(ℓ)_K(Φ) = π_\*Ψ(ℓ)_K(Φ) on 𝒮_{K_Φ,h}. The Fourier–Jacobi expansion along Υ = [(Φ, σ)] is the map FJ_{(Φ,σ)} : H^0(𝒮^Σ_K, ω^{⊗n}) → ∏_{ℓ∈S_K(Φ)} H^0(𝒮_{K_Φ,h}, FJ(ℓ)_K(Φ) ⊗ ω^{⊗n}_K(Φ)) obtained by restricting to the completion along 𝒵_K(Υ) (C10.6) and expanding in the completed character decomposition. It does not depend on σ (write FJ_Φ), its image lies in the Δ_K(Φ)-invariants of the product over the submonoid P_K(Φ) of characters pairing nonnegatively with the cone H(Φ), and it is compatible with the isomorphisms ρ(γ, q) between equivalent cusp label representatives.

*Hypotheses.*
- Σ complete; Δ_K(Φ) the arithmetic group of Φ acting through its action on characters and on 𝒮_{K_Φ,h}.

*Proof sketch.*
- The completion (5.1.5.1) of the torsor along the σ-stratum is the completed sum over ℓ ∈ S_K(Φ, σ) of Ψ(ℓ); the projection formula along π gives the expansion.
- Independence of σ and the positivity of the support: compare two cones through a common refinement and use the Koecher-type argument of Madapusi Pera 5.1.7–5.1.8.
- Compatibility with ρ(γ, q): ρ(γ, q)^\*Q(Φ′) ≅ Q(Φ) induces ρ(γ, q)^\*ω_K(Φ′) ≅ ω_K(Φ) (5.1.6.1).

*Sources.* [MP19], §§5.1.5–5.1.6, Lemma 5.1.7 and Corollary 5.1.8, pp. 84–85: Defines Fourier–Jacobi expansions of sections of powers of the Hodge line along boundary strata, proves independence of the cone and invariance under the arithmetic group, with support in the nonnegative characters.

*Uses.* Madapusi Pera §5.2.3: the constant term FJ^(0)_Φ determines restriction to the boundary stratum and gives the map to the minimal compactification; Maulik–Shankar–Tang §8.2: the complete local ring at a zero-dimensional cusp is a ring of invariant power series in these coordinates.

The API:
- `fourierJacobi` (constructor): FJ_Φ : H^0(𝒮^Σ_K, ω^{⊗n}) → ∏_{ℓ} H^0(𝒮_{K_Φ,h}, FJ(ℓ) ⊗ ω^{⊗n}_K(Φ)).
- `fourierJacobi_indep_cone` (other): FJ_{(Φ,σ)} does not depend on σ ∈ Σ(Φ).
- `fourierJacobi_support` (characterisation): The image lies in the Δ_K(Φ)-invariants of the product over P_K(Φ).
- `fourierJacobi_conj` (functoriality): Compatibility with ρ(γ, q) for equivalent representatives.
- `fourierJacobi_constantTerm` (projection): The ℓ = 0 component FJ^(0)_Φ(f) ∈ H^0(𝒮_{K_Φ,h}, ω^{⊗n}_K(Φ))^{Δ_K(Φ)}, which determines the restriction of f to the stratum.

*Needs:* C10.6; C10.4; C12.1; ShimuraCompactifications C5 (hodge-line-fourier-jacobi-expansion).

**Checks.**

- `fourierJacobi_modular_test` (computation): For the modular curve at the cusp ∞ with width w, FJ_Φ is the q-expansion in q^{1/w} and Δ = q − 24q² + ⋯ has FJ^(0) = 0.
- `fourierJacobi_interior_test` (degenerate): For Φ = (G, X^+, 1) the expansion is restriction to 𝒮_K itself (only ℓ = 0).
- `fourierJacobi_negative_test` (non-example): A character ℓ pairing negatively with H(Φ) never occurs in the support: on the Hilbert modular surface the expansion of a holomorphic form has only totally nonnegative exponents (Koecher).
- For the modular curve the expansion is the q-expansion at the cusp.
- Only characters pairing nonnegatively with the positivity cone occur.

### C12.4 The minimal compactification of Hodge type

Construct (construction, node `C12/minimal-compactification`): 𝒮^min_K := Proj(⊕_n H^0(𝒮^Σ_K, ω^{⊗n})) for complete Σ. It is a normal projective O_{E,(v)}-scheme independent of Σ, with a canonical surjective map ∮_{Σ′} : 𝒮^{Σ′}_K → 𝒮^min_K with geometrically connected fibres for every sufficiently fine complete Σ′ (the Stein factorization of the map given by a basepoint-free power of ω). It satisfies: (1) 𝒮_K → 𝒮^min_K is an open immersion with complement flat over O_{E,(v)}; (2) ω extends to an ample line bundle ω^min_K with ∮^\*ω^min_K ≅ ω_K(Σ); (3) a stratification 𝒮^min_K = ⊔_{[Φ]} 𝒵_K([Φ]) by cusp classes, 𝒵_K([Φ]) = Δ^fin_K(Φ)\𝒮_{K_Φ,h}(G_{Φ,h}, D_{Φ,h}) mapping by a locally closed immersion, with closure relation given by the order on cusp classes; (4) compatibility with strata: ∮^{-1}(𝒵_K([Φ])) = ⊔_σ 𝒵_K([(Φ, σ)]); (5) if 𝒮^1_K ⊂ 𝒮^Σ_K is the preimage of the complement of the strata of codimension ≥ 2, then H^0(𝒮^Σ_K, ω^{⊗n}) ≅ H^0(𝒮^1_K, ω^{⊗n}), and if G^ad has no factor PGL_2 then H^0(𝒮^Σ_K, ω^{⊗n}) ≅ H^0(𝒮_K, ω^{⊗n}) (Koecher). Universal property: for a very ample L on T and f : 𝒮^{Σ′}_K → T with f^\*L ≅ ω^{⊗N}, f factors uniquely through ∮_{Σ′}.

*Hypotheses.*
- Hodge type; neat K arbitrary at p; Σ complete.

*Proof sketch.*
- Projectivity and normality from finite generation and normality of 𝒮^Σ_K (C12.2; Bosch–Lütkebohmert–Raynaud 6.7, Lemma 2).
- The constant term of FJ_Φ shows the composite 𝒵_K(Φ, σ) → 𝒮^min_K factors through Δ^fin_K(Φ)\𝒮_{K_Φ,h} (5.2.3); images of distinct cusp classes are disjoint (5.2.7) using the stratification of 𝒮^Σ_K and the Siegel case.
- Each 𝒵_K([Φ]) → 𝒮^min_K is unramified by C12.5, finite onto its image and birational (checked over ℂ, Pink 6.3), hence a locally closed immersion (5.2.9).
- Ampleness of ∮_\*ω as in Lan's book 7.2.4.1; flatness of the boundary from flatness of the strata (C10.5).

*Sources.* [MP19], §5.2, (5.2.1)–Theorem 5.2.11, pp. 85–88: Constructs the minimal compactification as Proj of the Hodge section algebra, with its Stein factorization description, universal property, stratification by quotients of boundary integral models, flat boundary, ample Hodge line and Koecher principle. [MP19], Theorem 3, p. 5: Summarizes: the minimal compactification of Sh_K has a projective normal model over O_{E,(v)} stratified by quotients of integral models of Hodge type.

*Uses.* Maulik–Shankar–Tang §8.1: 𝒮^BB with flat stratification and extended Hecke correspondences; ShimuraCompactifications C5.31: a normal projective flat minimal model, here for Hodge-type data.

The API:
- `MinimalCompactification` (constructor): 𝒮^min_K as the Proj of the Hodge section algebra.
- `MinimalCompactification.contraction` (data): ∮_Σ : 𝒮^Σ_K → 𝒮^min_K, surjective with geometrically connected fibres.
- `MinimalCompactification.ample` (other): ω^min_K ample with ∮^\*ω^min_K ≅ ω_K(Σ).
- `MinimalCompactification.stratum` (constructor): 𝒵_K([Φ]) = Δ^fin_K(Φ)\𝒮_{K_Φ,h} with its locally closed immersion.
- `MinimalCompactification.lift` (universal-property): Factorization of maps to projective schemes pulling back a very ample line to a power of ω.
- `MinimalCompactification.koecher` (other): Restriction of sections of ω^{⊗n} to the complement of codimension-two strata, or to 𝒮_K when G^ad has no PGL_2 factor, is bijective.

*Needs:* C12.2; C12.3; C10.5; ShimuraCompactifications C2 (minimal-boundary-map); SchemeAndStackFoundations SF.0.

**Checks.**

- `MinimalCompactification.modular_test` (computation): For the modular curve with neat prime-to-p level at level K_0(p), 𝒮^min_K is the normal projective curve X_0(p) over ℤ_(p) and coincides with 𝒮^Σ_K.
- `MinimalCompactification.siegel_test` (compatibility): For the Siegel datum at hyperspecial level, 𝒮^min_K is the integral minimal compactification of ShimuraCompactifications C5.16.
- `MinimalCompactification.koecherFails_test` (non-example): For the modular curve (G^ad = PGL_2) restriction from X to Y is not bijective on H^0(ω^{⊗12}): 1/Δ-type poles at cusps are allowed on Y.
- `MinimalCompactification.compact_test` (degenerate): If G^ad is anisotropic, 𝒮^min_K = 𝒮^Σ_K = 𝒮_K.
- For the Siegel threefold at hyperspecial level the minimal boundary consists of curves and points.
- The boundary of 𝒮^min_K is flat over O_{E,(v)}.

### C12.5 Complete local rings of the minimal compactification

Prove (theorem, node `C12/minimal-complete-local-rings`): Let x be a geometric point of 𝒮^min_K lifting to a point y of 𝒵_K([Φ]) ⊂ 𝒮_{K_Φ,h}. Then the completed local ring of 𝒮^min_K at x is canonically [∏_{ℓ∈P_K(Φ)} FJ(ℓ)_K(Φ)^∧_y]^{Δ_K(Φ)}, the invariants under Δ_K(Φ) of the product of completed stalks of the Fourier–Jacobi sheaves over characters pairing nonnegatively with H(Φ).

*Hypotheses.*
- Same setting as C12.4.

*Proof sketch.*
- As in Lan's book 7.2.3.13: compute the completion of 𝒮^min_K at x through the formal functions on the preimage of x in 𝒮^Σ_K (formal functions for proper maps, ShimuraCompactifications C3.6a) and the completed charts of C10.6, then take invariants of the arithmetic group.

*Sources.* [MP19], Corollary 5.2.8, p. 87: Describes the complete local ring of the minimal compactification at a boundary point as invariants of a product of completed Fourier–Jacobi stalks. [MP19], Remark 5.2.10, p. 87: Points out that the finite group Δ^fin_K(Φ) intervenes, unlike in Lan's book 7.2.3.15, where injectivity on geometric points of the boundary map is claimed without proof outside the Siegel case.

*Needs:* C12.3; C12.4; ShimuraCompactifications C3 (refinement-structure-sheaf).

**Checks.**

- At a zero-dimensional cusp of the Siegel threefold the completed local ring is the ring of Δ-invariant power series ∑_{λ ≥ 0} a_λ q^λ over the cusp's field.

### C12.6 Hecke correspondences on the minimal compactification

Prove (theorem, node `C12/minimal-hecke`): For an embedding of Hodge-type data η and g as in C10.9, the map 𝒮_{K′} → O_{E′,(v′)} ⊗ 𝒮_K extends uniquely to 𝒮^min_{K′} → O_{E′,(v′)} ⊗ 𝒮^min_K carrying 𝒵_{K′}([Φ′]) to O_{E′,(v′)} ⊗ 𝒵_K([ι_\*Φ′]) via the induced finite maps of boundary quotients. In particular prime-to-p Hecke correspondences extend to 𝒮^min_K, without any compatibility condition on cone decompositions.

*Hypotheses.*
- Same setting as C10.9.

*Proof sketch.*
- Apply the universal property of C12.4 to the composite of the toroidal map of C10.9 with the contraction, for compatible cone decompositions; uniqueness makes the result independent of them.

*Sources.* [MP19], §5.2.12 and Proposition 5.2.13, p. 88: Extends maps induced by embeddings of data and Hecke translations to the minimal compactifications, compatibly with strata. [MST], §8.1, p. 37: Uses that the Hecke correspondences of G(𝔸_f^p) extend to the minimal compactification of the GSpin integral model, so Zariski closures of Hecke orbits there are Hecke-stable.

*Needs:* C12.4; C10.9.

**Checks.**

- Prime-to-p Hecke correspondences extend to the minimal compactification of the modular curve as the usual Hecke correspondences on X(K).
- The extension does not depend on auxiliary cone decompositions.

### C12.7 Coordinates and the unipotent action at a zero-dimensional cusp

Prove (theorem, node `C12/zero-dimensional-cusp-coordinates`): Let ℓ ≠ p, K_n the level obtained from the Siegel full level-ℓ^n subgroup, and x_n a zero-dimensional cusp of 𝒮^min_{K_n} ⊗ k (k = F̄_p) with cusp label representative Φ: P_Φ is an admissible parabolic with unipotent radical U_P and centre W, B_{K_n} ⊂ W(ℚ) the level lattice with dual S_{K_n}, Δ_{K_n} its arithmetic group and H ⊂ W(ℝ) the open self-adjoint cone. Then the complete local ring of 𝒮^min_{K_n,k} at x_n is R_{ℓ^n} = k[[q^λ]]^{Δ_{K_n}}_{λ≥0} (λ ∈ S_{K_n} pairing nonnegatively with H), and on R_ℓ = ⋃_n R_{ℓ^n} the group 𝔹_ℓ = B_{K_n} ⊗ ℤ[1/ℓ] ⊂ W(ℚ_ℓ), which fixes the compatible system of cusps, acts by T(∑ a_λ q^λ) = ∑ e((T, λ)) a_λ q^λ, where e : ℤ[1/ℓ] → μ_{ℓ^∞}(k) is the character a/ℓ^n ↦ ζ_{ℓ^n}^a determined by the cusp and the level structure.

*Hypotheses.*
- Hodge type, hyperspecial level at p, ℓ ≠ p; zero-dimensional cusp, so the pure part 𝒮_{K_Φ,h} is finite and the abelian part trivial.

*Proof sketch.*
- Specialize C12.5: for a zero-dimensional cusp FJ(ℓ) are rank-one free modules over the finite base, giving the invariant power series ring.
- The prime-to-p Hecke action of G(ℚ_ℓ) on lim_n 𝒮^min_{K_n,k} restricts to W(ℚ_ℓ) ∩ stabilizer = 𝔹_ℓ, acting on the torus coordinates q^λ by the characters e((T, λ)) (Chai 1995, p. 452, via Madapusi Pera 2.1.11–2.1.18).

*Sources.* [MST], §8.2, pp. 37–38: Describes the complete local ring at a zero-dimensional cusp as invariant power series in the cusp coordinates and the action of B_ℓ by roots of unity, following Madapusi Pera 2.1.11–2.1.18 and Corollaries 5.1.8, 5.2.8 and Chai. [MP19], Corollaries 5.1.8 and 5.2.8, pp. 85 and 87: Supplies the Fourier–Jacobi description of the completed local rings.

*Needs:* C12.5; C12.6; ShimuraCompactifications C1 (boundary-incidence).

**Checks.**

- For the modular curve at ∞ and level ℓ^n, R_{ℓ^n} = k[[q^{1/ℓ^n}]] and T = a/ℓ^n acts by q^{1/ℓ^n} ↦ ζ_{ℓ^n}^a q^{1/ℓ^n}.

## Layer C13: Siegel models at deep level at p

Boxer–Pilloni's integral models for GSp_{2g} of every genus at any level K_p: de Jong's 𝒜_{g,d} with polarization-type loci 𝒜_{g,δ} and K_δ (§3.4.19); the normalized toroidal models S^tor_K of products ∏ A^tor_{g,d_i} over ℤ_p and ℤ_p^cycl (§3.4.23) as instances of C7–C8 and C10; the semi-abelian G, G^∨ and λ over A^tor_{g,d} for p | d; the Iwahori-level model of level p^n (n ≥ 1) with d_i = p^{n(g−i)} and the extension of the self-dual isogeny chain to semi-abelian schemes (§4.1.1); the graded pieces Gr_i as quasi-finite flat group schemes, not finite at the boundary; and, at n = 1, the toroidal compactification of the Iwahori lattice-chain moduli (Remark 4.1.2).

*Layer dependencies:* C7, C8, C10, PELModuli M5, PELModuli M6, ShimuraCompactifications C4.

### C13.1 Siegel moduli of polarization type δ

Define (definition, node `C13/polarization-type-loci`): For g ≥ 1 and d ≥ 1 let 𝒜_{g,d} be the stack over ℤ of abelian schemes of relative dimension g with a polarization of degree d² (PELModuli M6.4, de Jong). For δ = (δ_1 | δ_2 | ⋯ | δ_g) with ∏ δ_i = d, let M_δ = diag(δ_1, …, δ_g, 1, …, 1) ∈ GL_{2g}(ℚ), K_δ = M_δ GL_{2g}(Ẑ) M_δ^{-1} ∩ GSp_{2g}(𝔸_f), and 𝒜_{g,δ} ⊂ 𝒜_{g,d} the locally closed substack where the kernel of the polarization is étale locally isomorphic to ∏_i (ℤ/δ_i × μ_{δ_i}). Then 𝒜_{g,δ,ℚ} = S_{K_δ,ℚ} and 𝒜_{g,d,ℚ} = ⊔_δ S_{K_δ,ℚ}. With a neat prime-to-p level K^p, 𝒜_{g,d,K^p} is an algebraic space of finite type over ℤ_(p).

*Hypotheses.*
- Any d, including p | d; smoothness over ℤ_(p) holds only for p ∤ d.

*Proof sketch.*
- Define the type loci by the étale-local type of the finite flat kernel of the polarization; local constancy of the type on the generic fibre gives the decomposition.
- Identify 𝒜_{g,δ,ℚ} with the Shimura variety of level K_δ through the lattice M_δℤ^{2g} with its induced form (PELModuli M5.2 in characteristic zero).

*Sources.* [BP], §3.4.19, p. 39–40: Recalls de Jong's moduli stacks A_{g,d}, defines the type loci A_{g,δ} by the étale-local type of the polarization kernel, identifies A_{g,δ,ℚ} with the Shimura variety of level K_δ and decomposes A_{g,d,ℚ}.

*Uses.* Boxer–Pilloni §3.4.19 and §4.1.1: the auxiliary spaces of the deep-level and Iwahori models; Boxer–Pilloni Lemma 3.4.20: the ordinary locus of A_{g,δ} is an Igusa variety (owned by the Igusa Part II).

The API:
- `siegelTypeLocus` (constructor): 𝒜_{g,δ} ⊂ 𝒜_{g,d} for a divisor chain δ with ∏ δ_i = d.
- `siegelTypeLocus_generic` (equivalence): 𝒜_{g,δ,ℚ} ≅ S_{K_δ,ℚ}.
- `siegelTypeLocus_decomposition` (characterisation): 𝒜_{g,d,ℚ} = ⊔_δ 𝒜_{g,δ,ℚ}.
- `siegelTypeLocus_level` (constructor): With neat prime-to-p level K^p, the algebraic space 𝒜_{g,d,K^p} of finite type over ℤ_(p).

*Needs:* PELModuli M6; PELModuli M5; C7.1.

**Checks.**

- `siegelTypeLocus_principal_test` (degenerate): For d = 1 the only type is δ = (1, …, 1) and 𝒜_{g,1} = 𝒜_g.
- `siegelTypeLocus_paramodular_test` (computation): For g = 2 and d = p the types are δ = (1, p); K_δ is the paramodular group at p.
- `siegelTypeLocus_typeTwo_test` (computation): For g = 2 and d = p², the types are (1, p²) and (p, p); the second has kernel (ℤ/p × μ_p)².
- `siegelTypeLocus_notSmooth_test` (non-example): For p | d, 𝒜_{g,d} ⊗ 𝔽_p is not smooth in general (PELModuli M6.4, polarizedStack_not_smooth).
- 𝒜_{2,p,ℚ} = S_{K_{(1,p)},ℚ}, the paramodular Shimura variety.
- For p ∤ d the type loci are open and closed in 𝒜_{g,d} ⊗ ℤ_(p).

### C13.2 Toroidal models of Siegel varieties at arbitrary level at p

Construct (construction, node `C13/deep-level-toroidal-model`): Let K = K_pK^p ⊂ GSp_{2g}(𝔸_f) with K^p neat and K_p arbitrary, and choose d_1, …, d_r, types δ_i and conjugation-inclusions K ↪ K_{δ_i}. Define A^tor_{g,d_i} over ℤ_p as the normalized toroidal model of 𝒜_{g,d_i,K^p} (C7.5 for its own Zarhin auxiliary datum, or C8.3 for the singleton collection), and, for cone decompositions such that S^tor_{K,ℚ} → ∏_i A^tor_{g,d_i,ℚ} is finite, S^tor_K := the normalization of ∏_i A^tor_{g,d_i} × Spec ℤ_p in S^tor_{K,ℚ_p}. It is normal, proper and flat over ℤ_p with interior S_K (the normalization of ∏ 𝒜_{g,d_i,K^p}), equal to the normalized model of the auxiliary datum obtained by composing with Zarhin's replacement (C7.7); it carries the stratification, completions and degenerating families of C8 and C10, and its variant over ℤ_p^cycl is C7.10.

*Hypotheses.*
- Finiteness of S^tor_{K,ℚ} → ∏ A^tor_{g,d_i,ℚ} for the chosen cone decompositions, supplied by C7.4 for induced decompositions.

*Proof sketch.*
- A^tor_{g,d} exists as a normalized model, carrying the semi-abelian G extending the universal abelian scheme (C13.3).
- Normalization along the finite map from S^tor_{K,ℚ_p}; transitivity identifies the result with the normalization of the product of Zarhin good models, so C8 (collections) and C10 (Hodge type) apply.
- Dependence on the auxiliary choices (Boxer–Pilloni Remark 3.4.21) is that of C7.7; for PEL collections the model depends only on the lattices (Lan16 Corollary 11.7).

*Sources.* [BP], §3.4.19, Remark 3.4.21 and §3.4.23, pp. 39–40: Defines integral models at arbitrary level by normalizing products of the auxiliary moduli and of their toroidal compactifications, and notes the dependence on auxiliary choices.

*Uses.* Boxer–Pilloni §4: higher Hida theory takes place on S^tor_{K^pK_{p,n}}; HigherHidaAndColemanTheory H2, I3: ordinary strata and integral complexes on these models.

The API:
- `DeepLevelToroidalModel` (constructor): S^tor_K over ℤ_p with its finite map to ∏_i A^tor_{g,d_i}.
- `DeepLevelToroidalModel.interior` (projection): The open dense interior S_K.
- `DeepLevelToroidalModel.normal_proper_flat` (other): S^tor_K is normal, proper and flat over ℤ_p.
- `DeepLevelToroidalModel.strata` (other): The stratification and completions of C10.7.
- `DeepLevelToroidalModel.cyclotomic` (constructor): The ℤ_p^cycl variant of C7.10.

*Needs:* C13.1; C7.5; C7.7; C8.3; C10.7.

**Checks.**

- `DeepLevelToroidalModel.hyperspecial_test` (compatibility): For K_p ⊂ G(ℤ_p), r = 1, d_1 = 1 and δ_1 = (1, …, 1), S^tor_K is the normalization of the good model A^tor_{g,1} at level K^pG(ℤ_p) in S^tor_{K,ℚ_p}, the model of ShimuraCompactifications C5.19.
- `DeepLevelToroidalModel.trivial_test` (degenerate): For K_p = G(ℤ_p) and the same datum, S^tor_K = A^tor_{g,1}.
- `DeepLevelToroidalModel.noBoundaryComponent_test` (characterisation): No irreducible component of S^tor_K ⊗ 𝔽_p lies in the boundary (C10.5).
- For K_p = G(ℤ_p) the model is the good Siegel toroidal compactification.
- For g = 1 and K_p = K_0(p) the model is the compactified X_0(p) over ℤ_p.

### C13.3 The semi-abelian scheme, its dual and polarization over A^tor_{g,d}

Prove (theorem, node `C13/semiabelian-extension`): Over the normalized toroidal model A^tor_{g,d} of 𝒜_{g,d,K^p} over ℤ_p (any d, including p | d) there are semi-abelian schemes G and G^∨ extending the universal abelian scheme and its dual, and a homomorphism λ : G → G^∨ extending the polarization; they are unique up to unique isomorphism, and over the generic fibre ∐_δ S^tor_{K_δ,ℚ_p} they are the universal semi-abelian schemes of the toroidal compactifications.

*Hypotheses.*
- A^tor_{g,d} the normalized model; uniqueness over the normal noetherian base.

*Proof sketch.*
- Existence of G: Lan16 Theorem 11.2 for the singleton collection of the degree-d² lattice (C8.6), whose degenerating family of type M_H is a semi-abelian scheme with polarization.
- G^∨: apply the same theorem to the dual lattice, or take the semi-abelian extension of the dual abelian scheme; λ extends uniquely by extension of homomorphisms over normal bases (ShimuraCompactifications C4, hom_extend).

*Sources.* [Lan16], Theorem 11.2, p. 56: Extends the tautological polarized abelian schemes of the collection to degenerating families over the normalized toroidal model. [BP], §3.4.19 and §4.1.1, pp. 39–41: Uses A^tor_{g,d} with its semi-abelian scheme and the extension of homomorphisms (Faltings–Chai I.2.7).

*Needs:* C8.6; ShimuraCompactifications C4 (homomorphism-extension); C13.1.

**Checks.**

- Over the interior, λ : G → G^∨ is the given polarization of degree d².
- For the Tate curve at a cusp of A^tor_{1,1}, G is the Tate curve and λ the principal polarization.

### C13.4 The Iwahori-level normalized model and its isogeny chain

Construct (construction, node `C13/iwahori-normalized-model`): Let n ≥ 1 and K_{p,n} ⊂ GSp_{2g}(ℤ_p) the Iwahori subgroup of level p^n (reduction mod p^n in the Borel). Over the generic fibre there is the self-dual chain of isogenies A = A_g → A_{g+1} → ⋯ → A_{2g} → A_1 → ⋯ → A_g = A with total map [p^n], where ker(A_g → A_{g+i}) is totally isotropic in A[p^n], étale locally (ℤ/p^n)^i, and A_{g+i} carries a polarization of degree d_i² with d_0 = 1 and d_i = p^{n(g−i)} (1 ≤ i ≤ g). Define S^tor_{K^pK_{p,n}} as the normalization of ∏_{i=0}^{g} A^tor_{g,d_i} × Spec ℤ_p in S^tor_{K^pK_{p,n},ℚ_p} (C13.2). Over it, with A_{g+i} the pullback of G from the i-th factor and A_j (1 ≤ j ≤ g − 1) the pullback of G^∨ from the factor of A_{2g−j}, the chain extends uniquely to a chain of isogenies of semi-abelian schemes with total map [p^n].

*Hypotheses.*
- n ≥ 1 (the chain is trivial for n = 0); the printed degrees are corrected as in sourceIssues E65: the polarization of A_{g+i} has degree d_i² = p^{2n(g−i)}.

*Proof sketch.*
- Apply C13.2 to the collection of the g + 1 polarization degrees.
- Over the interior A_j ≅ A_{2g−j}^∨ for 1 ≤ j ≤ g − 1, which justifies the choice of G^∨-factors.
- Each isogeny of the chain extends uniquely over the normal base (ShimuraCompactifications C4, hom_extend; Faltings–Chai I.2.7), and the identity for the composite holds because it holds on a dense open.

*Sources.* [BP], §4.1.1, p. 41: Defines the Iwahori-level integral model by normalizing the product of the Siegel moduli of polarization degrees d_i and extends the self-dual chain of isogenies by Faltings–Chai I.2.7.

*Uses.* Boxer–Pilloni §§4.1.3–4.1.9: strata S^tor_{F_p,w} and the divisors D_i are defined from the graded pieces Gr_i; HigherHidaAndColemanTheory H2/ordinary-strata: the self-dual chain and its graded order-p^n groups.

The API:
- `IwahoriNormalizedModel` (constructor): S^tor_{K^pK_{p,n}} over ℤ_p with its finite map to ∏_{i=0}^g A^tor_{g,d_i}.
- `IwahoriNormalizedModel.chain` (data): The chain A_g → ⋯ → A_{2g} → A_1 → ⋯ → A_g of isogenies of semi-abelian schemes with composite [p^n].
- `IwahoriNormalizedModel.flag` (data): The flag 0 ⊂ H_{g+1} ⊂ ⋯ ⊂ H_{2g} ⊂ H_1 ⊂ ⋯ ⊂ H_g = A[p^n] of kernels over the interior.
- `IwahoriNormalizedModel.dual` (relation): Over the interior, A_j ≅ A_{2g−j}^∨ compatibly with the chain.

*Needs:* C13.2; C13.3; ShimuraCompactifications C4 (homomorphism-extension).

**Checks.**

- `IwahoriNormalizedModel.g1_test` (computation): For g = n = 1 both degrees are d_0 = d_1 = 1: the model is the normalization of A^tor_{1,1} × A^tor_{1,1} in X_0(p) along (E, H) ↦ (E, E/H), and the chain is E → E/H → E with composite [p].
- `IwahoriNormalizedModel.degrees_test` (computation): For g = 2, n = 1 the polarization degrees are d_0² = 1, d_1² = p² and d_2² = 1.
- `IwahoriNormalizedModel.n0_test` (degenerate): For n = 0 the chain consists of identities and the model is A^tor_{g,1}; the construction is stated for n ≥ 1 (sourceIssues E64).
- The composite of the extended chain is [p^n] on all of S^tor.
- For g = 1, n = 1 the model is the compactified X_0(p) with E → E/H → E.

### C13.5 Graded pieces of the Iwahori chain are quasi-finite flat

Prove (theorem, node `C13/graded-pieces`): For 1 ≤ i ≤ 2g let Gr_i be the kernel, over all of S^tor_{K^pK_{p,n}}, of the map of the extended chain whose target is A_i. Over the interior Gr_i = H_i/H_{i−1} in the flag ordering g + 1, …, 2g, 1, …, g (with 0 before H_{g+1}), a finite flat group scheme of order p^n with Gr_{2g−i+1} ≅ Gr_i^D. Over S^tor, each Gr_i is quasi-finite and flat, but in general not finite at the boundary: its order can drop on boundary strata.

*Hypotheses.*
- Same setting; the indexing follows sourceIssues E66.

*Proof sketch.*
- Each map of the chain is an extended isogeny of p-power degree over a normal base, hence quasi-finite flat (ShimuraCompactifications C4.11, isogeny_extend_quasiFiniteFlat).
- Over the interior identify the kernels with the graded pieces of the flag and use the self-duality of the chain for Cartier duality.

*Sources.* [BP], §4.1.1, p. 41: Defines the flag of kernels and the graded pieces Gr_i over the interior as finite flat of order p^n with Gr_{2g−i+1} = Gr_i^D.

*Needs:* C13.4; ShimuraCompactifications C4 (extended-isogeny-kernel).

**Checks.**

- For g = n = 1 at the cusp with H_2 = μ_p, Gr_1 = ker(Tate(q^p) → Tate(q)) has order p off q = 0 and is trivial on q = 0.
- The Cartier divisor D_i attached to Gr_i (Boxer–Pilloni 4.1.8) is owned by HigherHidaAndColemanTheory, which builds it from this target.

### C13.6 At level n = 1 the model is the toroidal compactification of the Iwahori moduli

Prove (theorem, node `C13/iwahori-level-one`): For n = 1 the interior S_{K^pK_{p,1}} is the moduli space of self-dual chains of p-isogenies of principally polarized abelian schemes with K^p-level (the Iwahori lattice-chain moduli), and S^tor_{K^pK_{p,1}} is a toroidal compactification of it over which the universal chain extends: the extended chain of C13.4 restricts on the interior to the universal chain.

*Hypotheses.*
- n = 1; the interior identification of the normalization with the lattice-chain moduli (normality of that moduli space) is an input owned by ShimuraVarietiesPartII (recorded as a gap).

*Proof sketch.*
- Given the interior identification, the boundary statement follows from C13.4: by uniqueness of extensions of homomorphisms over the normal base, the extended chain agrees with any extension of the universal chain.

*Sources.* [BP], Remark 4.1.2, p. 41: States that for n = 1 the normalized model is the usual integral model of Iwahori level.

*Needs:* C13.4; ShimuraCompactifications C4 (homomorphism-extension); recorded input: Normality of Iwahori and Lagrangian lattice-chain moduli.

**Checks.**

- For g = 1 the Iwahori lattice-chain moduli is the moduli of p-isogenies E → E′, the Katz–Mazur Γ_0(p) problem, whose compactification is X_0(p) over ℤ_p.
- The extended chain restricts on the interior to the universal chain.

## Layer C14: Genus two at Klingen and paramodular level

Pilloni's Siegel threefolds over ℤ_p: the paramodular lattice V_1, the groups Γ, Γ_par, Γ_Kli(p) and the Klingen and paramodular moduli with the chain G → G/H → G/H^⊥ → G (§§6.1.1–6.1.5.1); boundary charts of 1-motives and good cone decompositions (§§6.1.5.2–6.1.5.3); the toroidal compactifications X_Kli(p) and X_par with strata, completions and Cartier boundary (Theorem 6.1.5.1(1)); normality and the lci property, with non-smooth loci in the non-ordinary special fibre of codimension at least 2 (6.1.5.1(4), §7.1); extension of p_1, p_2 and of the chain G → G′ → G (6.1.5.1(3), §7.1); the compactified T_{p,2}-correspondence over ℤ_p (§14.9.2); the sheaves ω_G, Ω^(k,r) and the independence of their cohomology from Σ (§6.2.1); the minimal compactifications X^⋆_par and X^⋆_Kli(p), descent of det ω_G → det ω_{G′} and finiteness of X^⋆_Kli(p) → X^⋆ over the p-rank ≥ 1 locus (§6.2.2, p. 101); and Stroh's extension of the Klingen subgroup across the boundary.

*Layer dependencies:* C8, C10, ReductiveGroupsPartII RG2.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2, ModularCurvesPartII R12.3, ShimuraCompactifications C3, AutomorphicBundles B3.

### C14.1 Klingen and paramodular level for GSp_4

Define (definition, node `C14/klingen-paramodular-data`): Let V = ℤ^4 with basis e_1, …, e_4 and the standard symplectic form of Pilloni §5.1, K = K^pGSp_4(ℤ_p) with K^p neat, and V_1 = pe_1ℤ ⊕ e_2ℤ ⊕ e_3ℤ ⊕ e_4ℤ ⊂ V. The paramodular group scheme is GSp′_4 = GSp(V_1, ⟨·,·⟩) over ℤ, and the arithmetic groups are Γ = GSp_4(ℤ_(p))^+, Γ_par = GSp′_4(ℤ_(p))^+ and Γ_Kli(p) = the automorphisms of (V_1 ⊗ ℤ_(p) → V ⊗ ℤ_(p)) up to positive similitude, a common subgroup of Γ and Γ_par. In moduli terms: Y_K parametrizes abelian surfaces with a prime-to-p polarization; Y_par,K abelian surfaces G′ with a polarization of degree p² (up to ℤ_(p)^×) and K^p-level; Y_Kli(p),K pairs (G, H) with H ⊂ G[p] of order p; and p_1(G, H) = G, p_2(G, H) = (G/H^⊥, λ′), λ′ the descent of p²λ. Over Y_Kli(p) there is the chain G → G/H → G/H^⊥ → G with composite [p].

*Hypotheses.*
- p any prime; K^p neat. As lattice collections: Y_par is the singleton {V_1}, Y_Kli(p) the collection {V_1 ⊂ V} (C8.1).

*Proof sketch.*
- The groups are stabilizers of the lattices V and V_1 and of the chain V_1 ⊂ V (ReductiveGroupsPartII RG2.3 for the parahoric group schemes).
- The moduli descriptions and the maps p_1, p_2 are Pilloni §§6.1.1–6.1.3; the chain uses H^⊥, the orthogonal of H for the Weil pairing on G[p].

*Sources.* [Pilloni20], §§6.1.1–6.1.3, p. 26; §6.1.5.1, p. 27: Defines the smooth Siegel threefold, the Klingen and paramodular moduli spaces with the maps p_1, p_2 and the isogeny chain, the lattice V_1, the paramodular group scheme and the groups Γ, Γ_par and Γ_Kli(p).

*Uses.* Pilloni Theorem 6.1.5.1: the toroidal compactifications X, X_Kli(p), X_par; HigherHidaAndColemanTheory X8/klingen-complex: the Klingen-level model and its height-one tower.

The API:
- `paramodularLattice` (constructor): V_1 = pe_1ℤ ⊕ e_2ℤ ⊕ e_3ℤ ⊕ e_4ℤ with the restricted form.
- `paramodularGroup` (constructor): GSp′_4 = GSp(V_1) and Γ_par = GSp′_4(ℤ_(p))^+.
- `klingenGroup` (constructor): Γ_Kli(p) = Γ ∩ Γ_par, the stabilizer of the chain V_1 ⊂ V.
- `klingenParamodular_collection` (coercion): The lattice collections {V_1} and {V_1 ⊂ V} of C8.1.
- `klingenChain` (data): Over Y_Kli(p), the chain G → G/H → G/H^⊥ → G with composite [p] and p_2(G, H) = G/H^⊥.

*Needs:* C8.1; ReductiveGroupsPartII RG2.3; PELModuli M5; Mathlib `Matrix.symplecticGroup`.

**Checks.**

- `paramodularLattice_disc_test` (computation): The Gram determinant of the form on V_1 is p² times that on V, so the induced polarization has degree p².
- `klingenGroup_index_test` (computation): The image of Γ_Kli(p) in GSp_4(𝔽_p) is the Klingen parabolic, of index (p⁴ − 1)/(p − 1) = (p + 1)(p² + 1), the number of lines in 𝔽_p^4.
- `paramodularLattice_notSelfDual_test` (non-example): V_1 is not self-dual, so Γ_par is not hyperspecial and Y_par,K is not smooth over ℤ_p.
- The chain G → G/H → G/H^⊥ → G has degrees p, p², p with composite [p].
- Γ_Kli(p) = Γ ∩ Γ_par.

### C14.2 Klingen and paramodular boundary charts

Construct (construction, node `C14/one-motive-charts`): For W a totally isotropic direct factor of V (rank 0, 1 or 2) and γ ∈ GSp_4(𝔸_f^p)/K^p, the paramodular and Klingen boundary towers M_{W,γ,·} → B_{W,γ,·} → Y_{W,γ,·} are the normalized boundary towers (C7.8, C8.4) of the collections of C14.1: M is a torus torsor under T_{W,γ,·}, isogenous to Sym²(V/W^⊥) ⊗ 𝔾_m, over the abelian scheme B (of relative dimension 2 − rank W) over Y_{W,γ,·}, a moduli space of abelian varieties of genus 2 − rank W with K^p-level (and, for Kli(p), a Klingen structure at p depending on the position of W relative to V_1). For the paramodular case M parametrizes 1-motives with a polarization of degree Np² ((N, p) = 1) whose toric character group is V_1/W^⊥. The integral structures X_⋆(T_{W,γ}), X_⋆(T_{W,γ,par}), X_⋆(T_{W,γ,Kli(p)}) are lattices in the cocharacter space Sym²(V/W^⊥)^∨ ⊗ ℚ, and a cone is smooth if its generators s_i extend to a ℤ-basis of the relevant X_⋆(T). A cone decomposition is good if it is projective, satisfies Pilloni's condition 2 on stabilizers, and is smooth for X_⋆(T_{W,γ}) (resp. X_⋆(T_{W,γ,par}), X_⋆(T_{W,γ,Kli(p)})) when it is Γ- (resp. Γ_par-, Γ_Kli(p)-) admissible.

*Hypotheses.*
- Corrections of sourceIssues E34–E38: the level is K^p-level; the abelian part has genus 2 − rank_ℤ W; B_{W,γ,par} lies over Y_{W,γ,par}; lattices are character or cocharacter groups as stated; condition 3 reads with H = Γ (resp. Γ_par, Γ_Kli(p)).

*Proof sketch.*
- Specialize C8.4 to the two collections; the toric part of the degenerating 1-motive at W has character group V/W^⊥ (resp. V_1/W^⊥).
- Good cone decompositions exist and are cofinal (Faltings–Chai p. 97).

*Sources.* [Pilloni20], §§6.1.5.2–6.1.5.3, pp. 27–29: Describes the towers of moduli of 1-motives at spherical, Klingen and paramodular level with their torus torsors and integral structures, and defines good cone decompositions.

*Uses.* Pilloni Theorem 6.1.5.1(1): strata and completions of the compactifications are given by these charts; Pilloni proof of Lemma 10.3.3, p. 61: rank-one Klingen charts have modular-curve bases of level Γ_0(p) in some cases.

The API:
- `klingenChart` (constructor): The Klingen tower M_{W,γ,Kli(p)} → B_{W,γ,Kli(p)} → Y_{W,γ,Kli(p)} and its torus embeddings for cones σ.
- `paramodularChart` (constructor): The paramodular tower M_{W,γ,par} → B_{W,γ,par} → Y_{W,γ,par} and its torus embeddings.
- `goodConeDecomposition` (structure): The predicate of being good for H ∈ {Γ, Γ_par, Γ_Kli(p)}.
- `goodConeDecomposition_cofinal` (other): Good decompositions are cofinal among H-admissible ones.

*Needs:* C14.1; C8.4; C7.3.

**Checks.**

- `klingenChart_rank_test` (computation): rank W = 0, 1, 2 gives abelian parts of genus 2, 1, 0 and charts of dimension 3.
- `paramodularChart_rankOne_test` (computation): For rank W = 1 the paramodular base Y_{W,γ,par} is a modular curve with level away from p; for Klingen charts of certain W it is a modular curve of level Γ_0(p).
- `goodConeDecomposition_smooth_test` (non-example): A cone smooth for X_⋆(T_{W,γ}) need not be smooth for X_⋆(T_{W,γ,par}), since the two lattices differ by index p in Sym²(V/W^⊥)^∨ for suitable W.
- For rank W = 2 (the Siegel cusp) the abelian part is trivial and the torus has rank 3.
- The paramodular toric character group at W is V_1/W^⊥.

### C14.3 Toroidal compactifications at Klingen and paramodular level (Pilloni, Theorem 6.1.5.1)

Prove (theorem, node `C14/klingen-paramodular-compactifications`): Let Σ be a good cone decomposition that is Γ_Kli(p)- (resp. Γ_par-) admissible. There is a toroidal compactification X_Kli(p)_{K,Σ} of Y_Kli(p)_K (resp. X_{par,K,Σ} of Y_{par,K}) over ℤ_p, the normalized toroidal model of the corresponding lattice collection, with a stratification indexed by Γ_Kli(p)\Σ (resp. Γ_par\Σ) in which the (σ, γ)-stratum is isomorphic to Z_{W,γ,Kli(p),σ} (resp. Z_{W,γ,par,σ}) and the completion along it is that of M_{W,γ,Kli(p),σ} (resp. M_{W,γ,par,σ}) along the stratum; the boundary (the reduced complement of the interior) is a relative Cartier divisor. Their generic fibres are the characteristic-zero toroidal compactifications at the corresponding levels.

*Hypotheses.*
- Σ good (in particular projective and smooth for the relevant integral structure); strata are listed in the corrected order of sourceIssues E39.

*Proof sketch.*
- Construct the models by normalization (C8.3) or as Lan17 normalized blow-ups of the normalized minimal models (C8.10); Pilloni's Theorem 6.1.5.1 is the special case of Lan17 Theorem 6.1.
- The stratification and completions are C8.5 with the charts of C14.2; the boundary is Cartier by C10.7.

*Sources.* [Pilloni20], Theorem 6.1.5.1(1) and its proof, p. 29: States existence, stratification and completions of the toroidal compactifications at spherical, Klingen and paramodular level for good cone decompositions, as a special case of Lan's Theorem 6.1, with the paramodular case via Zarhin's trick and normalization.

*Needs:* C14.2; C8.5; C8.10; C10.7.

**Checks.**

- X_Kli(p)_{K,Σ}[1/p] and X_{par,K,Σ}[1/p] are the toroidal compactifications of ShimuraCompactifications C2 at the corresponding levels, base changed to ℚ_p.

### C14.4 Klingen and paramodular compactifications are normal and lci

Prove (theorem, node `C14/normal-lci`): For Σ good and admissible for the relevant group, X_Kli(p)_{K,Σ} and X_{par,K,Σ} are normal, flat and local complete intersections over ℤ_p. Their non-smooth loci are contained in the non-ordinary locus of the special fibre (ordinary defined pointwise by the p-rank of the p-divisible group, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2), including at the boundary, and have codimension at least 2; the non-smooth locus of the open Y_{par,K} is a finite set of closed points of characteristic p.

*Hypotheses.*
- Σ good; the interior properties (Y_par,K and Y_Kli(p),K regular, flat and lci over ℤ_p, the non-smooth locus of Y_par,K finite) are Pilloni's Proposition 6.1.4.1, an input owned by ShimuraVarietiesPartII (recorded as a gap).

*Proof sketch.*
- Normality from the construction by normalization.
- The lci property transfers from the interior to the toroidal model for smooth Σ (C8.9).
- Non-smooth locus: boundary charts are torus torsors over abelian torsors over modular curves of level away from p (paramodular) or Γ_0(p) (some Klingen cases), smooth over their ordinary loci; combined with the finite non-smooth locus of Y_par this gives codimension ≥ 2 (Pilloni p. 38, corrected: the printed 'codimension 2' holds as 'at least 2', and for Y_par the locus is finite).

*Sources.* [Pilloni20], Proposition 6.1.4.1, p. 26; Theorem 6.1.5.1(4), p. 29; §7.1, p. 38: States that Y_par and Y_Kli(p) are regular, flat lci with finite non-smooth locus for Y_par, that the toroidal compactifications are normal and lci, and that their non-smooth locus lies in the non-ordinary special fibre and has codimension 2.

*Needs:* C14.3; C8.9; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; ModularCurvesPartII R12.3; recorded input: Local structure of the Klingen and paramodular moduli over ℤ_p.

**Checks.**

- At the singular point L_0 = ⟨pe_1, e_4⟩ of the paramodular local model the deformation ring is ℤ_p[[X, Y, W, Z]]/(XY − WZ + p), regular and a complete intersection, but not smooth over ℤ_p: its special fibre 𝔽_p[[X, Y, W, Z]]/(XY − WZ) is singular at the origin.

### C14.5 The projections from Klingen level

Prove (theorem, node `C14/klingen-projections`): If Σ is Γ- (resp. Γ_par-) admissible and Σ′ is a Γ_Kli(p)-admissible refinement, then p_1 : Y_Kli(p)_K → Y_K (resp. p_2 : Y_Kli(p)_K → Y_par,K) extends to p_1 : X_Kli(p)_{K,Σ′} → X_{K,Σ} (resp. p_2 : X_Kli(p)_{K,Σ′} → X_{par,K,Σ}). Over X_Kli(p) the interior chain extends to isogenies of semi-abelian schemes G → G′ → G of degrees p³ and p with composite [p], where G is pulled back by p_1 and G′ by p_2. The maps p_1 and p_2 are not finite flat: they are not quasi-finite over the p-rank-zero loci, and not finite flat over the boundary.

*Hypotheses.*
- Compatible good cone decompositions; the chain G → G′ is the composite G → G/H → G/H^⊥ of the interior.

*Proof sketch.*
- Extension of p_1, p_2: functoriality of normalized models for subcollections {V} ⊂ {V_1 ⊂ V} and {V_1} ⊂ {V_1 ⊂ V} (C8.8).
- The chain extends by extension of homomorphisms over the normal base; degrees and composite are checked on the interior.
- Failure of quasi-finiteness over the p-rank-zero locus: fibres of p_1 over a supersingular point contain curves (Pilloni §7.1, footnote 9).

*Sources.* [Pilloni20], Theorem 6.1.5.1(3), p. 29; §7.1, p. 38 and footnote 9: Extends the projections from Klingen level to toroidal models for compatible refinements, records the chain G → G′ → G of degrees p³ and p over X_Kli(p), and notes that p_1, p_2 are not finite flat.

*Needs:* C14.3; C8.8; ShimuraCompactifications C4 (homomorphism-extension).

**Checks.**

- Over the ordinary locus the components of X_Kli(p) where G → G′ has étale kernel of rank two and those where it is multiplicative are distinguished by the chain (Pilloni §7.1).

### C14.6 The compactified T_{p,2}-correspondence over ℤ_p

Construct (construction, node `C14/tp2-correspondence`): Let C_{p,2} over ℤ_p be the moduli of isogenies p_1^\*G → p_2^\*G of principally polarized abelian surfaces with K^p-level whose kernel is a totally isotropic (Lagrangian) subgroup of order p² of p_1^\*G[p], with the two projections p_1, p_2 to Y_K. For suitable good Σ, Σ′, Σ″ there is a toroidal compactification C_{p,2,Σ″} with p_1 : C_{p,2,Σ″} → X_Σ and p_2 : C_{p,2,Σ″} → X_{Σ′} extending the projections, obtained as the normalized toroidal model of the collection {V, L′} given by the two lattices (Faltings–Chai p. 253). The Hecke operators T_{p,2} and U_{Kli(p),2} built on it are owned by IntegralCoherentHeckeComplexes, SiegelModularFormsModPn and HigherHidaAndColemanTheory.

*Hypotheses.*
- Compatible good cone decompositions; the interior moduli of Lagrangian subgroups is an instance of the Siegel parahoric lattice-chain moduli owned by ShimuraVarietiesPartII.

*Proof sketch.*
- The isogeny with Lagrangian kernel of order p² is the data of a second self-dual-up-to-p lattice; the collection of the two lattices gives a normalized model (C8.3) with its two projections (C8.8).
- Comparison with Faltings–Chai's compactified Hecke correspondences in characteristic zero (ShimuraCompactifications C3, toroidal Hecke correspondences).

*Sources.* [Pilloni20], §14.9.2, p. 104: Uses the toroidal compactification of the T_{p,2}-correspondence C_{p,2} over ℤ_p with its projections p_1 and p_2, following Faltings–Chai p. 253.

*Uses.* Pilloni Lemma 14.9.1(a), p. 104: the integral action of T_{p,2} over the p-rank ≥ 1 locus; HigherHidaAndColemanTheory X8: the Klingen correspondence and its normalized operators.

The API:
- `TP2Correspondence` (constructor): C_{p,2,Σ″} over ℤ_p with p_1 : C → X_Σ and p_2 : C → X_{Σ′}.
- `TP2Correspondence.isogeny` (data): The universal isogeny p_1^\*G → p_2^\*G of semi-abelian schemes extending the interior one.
- `TP2Correspondence.generic` (compatibility): Its generic fibre is the characteristic-zero toroidal Hecke correspondence for the double coset of diag(1, 1, p, p).
- `TP2Correspondence.degree` (other): Over the interior generic fibre, p_1 is finite étale of degree (p + 1)(p² + 1), the number of Lagrangian subspaces of 𝔽_p^4.

*Needs:* C8.8; C8.3; ShimuraCompactifications C3 (hecke-span); C14.1; recorded input: Normality of Iwahori and Lagrangian lattice-chain moduli.

**Checks.**

- `TP2Correspondence.degree_test` (computation): For p = 2 the number of Lagrangian subspaces of 𝔽_2^4 is (2 + 1)(4 + 1) = 15.
- `TP2Correspondence.interior_test` (degenerate): On the interior C_{p,2} is the moduli of Lagrangian subgroups of G[p].
- `TP2Correspondence.notFinite_test` (non-example): p_1 is not finite over the boundary of X_Σ in general: the extended isogeny's kernel is only quasi-finite there (ShimuraCompactifications C4.11).
- Over the interior generic fibre p_1 is finite étale of degree (p + 1)(p² + 1).
- The generic fibre is the characteristic-zero Hecke correspondence for diag(1, 1, p, p).

### C14.7 Automorphic sheaves of genus two at Klingen and paramodular level

Construct (construction, node `C14/genus-two-sheaves`): On X = X_{K,Σ} let ω_G = e^\*Ω¹_{G/X} for the semi-abelian G, of rank 2, and Ω^{(k,r)} = Sym^k ω_G ⊗ det^r ω_G for (k, r) ∈ ℤ_{≥0} × ℤ, with Ω^{(k,r)}(−D) = Ω^{(k,r)} ⊗ I_D for the boundary D. On X_par define them using G′; on X_Kli(p) use p_1^\*Ω^{(k,r)} and p_2^\*Ω^{(k,r)}. For a refinement π : X_{Σ′} → X_Σ (of any of the three), π^\*Ω^{(k,r)} = Ω^{(k,r)}, Rπ_\*O = O and Rπ_\*I_{D′} = I_D, so RΓ(Ω^{(k,r)}) and RΓ(Ω^{(k,r)}(−D)) do not depend on Σ; only π^\*I_D ⊂ I_{D′} holds, with equality only for Σ′ = Σ (sourceIssues E40).

*Hypotheses.*
- Good cone decompositions; the derived pushforward statements are those of ShimuraCompactifications C3.6–C3.8 for Lan17 models.

*Proof sketch.*
- Define ω_G by the Hodge bundle of the semi-abelian scheme (ShimuraCompactifications C4.1); pullback compatibility under refinements because G pulls back.
- Cohomology independence by the projection formula with Rπ_\*O = O and Rπ_\*I_{D′} = I_D (ShimuraCompactifications C3.9 in Lan17's setting).

*Sources.* [Pilloni20], §6.2.1, p. 30; Theorem 6.1.5.1(2), p. 29: Defines ω_G and Ω^{(k,r)} on X and X_par and deduces from point 2 of the compactification theorem that their cohomology does not depend on the cone decomposition.

*Uses.* Pilloni §§7–14: coherent cohomology of Ω^{(k,r)} on X, X_Kli(p), X_par in higher Hida theory; SiegelModularFormsModPn, IntegralCoherentHeckeComplexes: integral coherent cohomology of these sheaves.

The API:
- `genusTwoSheaf` (constructor): Ω^{(k,r)} = Sym^k ω_G ⊗ det^r ω_G on X, X_par (via G′) and X_Kli(p) (via p_1 or p_2).
- `genusTwoSheaf_cusp` (constructor): Ω^{(k,r)}(−D) = Ω^{(k,r)} ⊗ I_D.
- `genusTwoSheaf_refinement` (functoriality): π^\*Ω^{(k,r)} ≅ Ω^{(k,r)} for refinements.
- `genusTwoSheaf_cohomology_indep` (other): RΓ(X_Σ, Ω^{(k,r)}) and RΓ(X_Σ, Ω^{(k,r)}(−D)) are independent of Σ.
- `genusTwoSheaf_canonicalExtension` (compatibility): On X[1/p], Ω^{(k,r)} is the canonical extension of AutomorphicBundles B3.

*Needs:* C14.3; ShimuraCompactifications C3 (coherent-cohomology-invariance); ShimuraCompactifications C3 (refinement-boundary-ideal); ShimuraCompactifications C4 (semi-abelian-scheme); AutomorphicBundles B3.

**Checks.**

- `genusTwoSheaf_rank_test` (computation): Ω^{(k,r)} has rank k + 1.
- `genusTwoSheaf_det_test` (degenerate): Ω^{(0,r)} = det^r ω_G = ω^r.
- `genusTwoSheaf_pullbackIdeal_test` (non-example): For the blow-up of a smooth two-dimensional cone, π^\*I_D vanishes to order 2 on the exceptional divisor while I_{D′} vanishes to order 1, so π^\*I_D ≠ I_{D′} although Rπ_\*I_{D′} = I_D.
- RΓ(X_Σ, Ω^{(k,r)}(−D)) is the same for all good Σ.
- On X[1/p], Ω^{(k,r)} is the canonical extension of the automorphic bundle of weight (k, r).

### C14.8 Minimal compactifications at Klingen and paramodular level

Construct (construction, node `C14/klingen-paramodular-minimal`): X^⋆_par := Proj(⊕_{k≥0} H^0(X_par, ω^k)) and X^⋆_Kli(p) := Proj(⊕_{k≥0} H^0(X_Kli(p), ω^k_J)) are the normalized minimal models of the paramodular and Klingen collections (C8.2, C8.3), with contractions π_par : X_par → X^⋆_par and π_Kli : X_Kli(p) → X^⋆_Kli(p). The line bundles det ω_G and det ω_{G′} on X_Kli(p) descend to invertible sheaves on X^⋆_Kli(p) (after a fixed positive power) and the map det ω_G → det ω_{G′} induced by G → G′ descends; its non-vanishing locus X^{⋆,≥1}_Kli(p) has preimage the p-rank ≥ 1 locus X^{≥1}_Kli(p). The map X^⋆_Kli(p) → X^⋆ induced by p_1 is proper, and finite over the p-rank ≥ 1 locus X^{⋆,≥1} (p-rank defined pointwise through FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2).

*Hypotheses.*
- Good Σ; X^⋆ is the good-level minimal compactification (ShimuraCompactifications C5.16); p-rank loci are pointwise.

*Proof sketch.*
- Construct both minimal models as normalized minimal models and identify them with the Proj by C8.3 (Lan16 Proposition 7.11).
- Descent of det ω_G and det ω_{G′}: each is a pullback of an ample line of an auxiliary minimal model (Lan16 Proposition 6.4), so they descend; the map between them descends because it is a section of the descended Hom line, extended over the normal X^⋆_Kli(p) from the complement of codimension ≥ 2.
- Finiteness over X^{⋆,≥1}: p_1 is proper and quasi-finite over the p-rank ≥ 1 locus (fibres of the Klingen projection over a point of p-rank ≥ 1 are finite), hence finite (Pilloni p. 101).

*Sources.* [Pilloni20], §6.2.2, p. 30; pp. 71–72 and 101: Defines X^⋆ and X^⋆_par as Proj of Hodge section algebras, uses a Klingen minimal compactification X^⋆_Kli(p) that it does not define, and uses that the map to X^⋆ is proper and quasi-finite over the p-rank ≥ 1 locus and that det ω_G → det ω_{G′} descends.

*Uses.* HigherHidaAndColemanTheory X8/klingen-control: the two-affine covering of the p-rank ≥ 1 locus of X^⋆_Kli(p); Pilloni Lemma 11.3.x and §14.8, pp. 71–72, 100–102: cohomology over the p-rank ≥ 1 locus.

The API:
- `paramodularMinimal` (constructor): X^⋆_par with π_par and the ample descended ω.
- `klingenMinimal` (constructor): X^⋆_Kli(p) with π_Kli.
- `klingenMinimal_detDescends` (other): det ω_G and det ω_{G′} descend to X^⋆_Kli(p), and so does det ω_G → det ω_{G′}.
- `klingenMinimal_finite_prankOne` (other): X^⋆_Kli(p) ×_{X^⋆} X^{⋆,≥1} → X^{⋆,≥1} is finite.
- `klingenMinimal_prankOneLocus` (characterisation): The non-vanishing locus of the descended map has preimage X^{≥1}_Kli(p) in X_Kli(p).

*Needs:* C8.2; C8.3; C14.5; ShimuraCompactifications C5 (integral-minimal-space); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

**Checks.**

- `paramodularMinimal_generic_test` (compatibility): X^⋆_par ⊗_{ℤ_p} ℂ (for an embedding ℚ_p ↪ ℂ) is the Baily–Borel compactification of Y_par,K(ℂ) (ShimuraVarieties V2).
- `klingenMinimal_boundaryDim_test` (computation): The boundary of X^⋆_Kli(p) has dimension 1 (modular curves over the Klingen cusps) in the threefold.
- `klingenMinimal_notFinite_test` (non-example): X^⋆_Kli(p) → X^⋆ is not finite over the p-rank-zero locus: over a superspecial point the fibre contains a curve.
- X^⋆_par is normal, projective and flat over ℤ_p with ample ω.
- The map X^⋆_Kli(p) → X^⋆ is finite over the p-rank ≥ 1 locus and not over the supersingular locus.

### C14.9 The Klingen subgroup extends over the boundary (Stroh)

Prove (theorem, node `C14/klingen-subgroup-extension`): The universal subgroup H ⊂ G[p] of order p over Y_Kli(p) extends to a finite flat group scheme of order p over X_Kli(p)_{K,Σ}; no closed immersion into the semi-abelian G[p] is asserted at the boundary.

*Hypotheses.*
- Good Σ.

*Proof sketch.*
- H is the kernel of G → G/H over the interior; at the boundary use the description of the completed charts (C14.3): the 1-motive at each cusp determines a subgroup of the toric or abelian part, giving a finite flat extension on each chart, which glues by uniqueness over the normal base (Stroh, Lemma 2.4.3, as cited by Pilloni).

*Sources.* [Pilloni20], footnote 27, p. 105: Cites Stroh, Astérisque 370, Lemma 2.4.3, for the extension of the universal order-p subgroup over X_Kli(p) to a finite flat group scheme at the boundary. [Stroh], Lemma 2.4.3: Stroh's extension lemma (not read here; cited through Pilloni).

*Needs:* C14.3; C14.5; ShimuraCompactifications C4 (extended-isogeny-kernel).

**Checks.**

- Over the interior the extension is H ⊂ G[p].
- The extended group has order p in every fibre, including at the boundary.

## Layer C15: Orthogonal Shimura varieties at the boundary

The GSpin Shimura datum of a quadratic lattice of signature (n, 2) with its Kuga–Satake embedding, p-integral when the lattice is self-dual at p; the cusps of its minimal compactification, zero-dimensional for isotropic lines and one-dimensional for isotropic planes, with flat stratification; uniqueness of cone decompositions over one-dimensional cusps, the description of their preimages as finite quotients of ℰ ⊗ Λ-torsors over modular curves (Λ = I^⊥/I) and the unique extension of prime-to-p Hecke correspondences over the complement of the zero-dimensional cusps; the zero-dimensional cusps with their Lorentzian cones and invariant power-series coordinates (Maulik–Shankar–Tang §§8.1–8.5).

*Layer dependencies:* C11, C12, ShimuraData D4, ShimuraVarieties V2.

### C15.1 The GSpin Shimura datum and its Kuga–Satake embedding

Define (definition, node `C15/gspin-datum`): Let (L, Q) be a quadratic ℤ-lattice of signature (n, 2), n ≥ 1, V = L ⊗ ℚ with bilinear form [x, y] = Q(x + y) − Q(x) − Q(y), C(V) its Clifford algebra and G = GSpin(V) ⊂ C^+(V)^× the general spin group, with spinor similitude ν. Let X be the space of oriented negative definite planes in V_ℝ, a G(ℝ)-conjugacy class of homomorphisms h : 𝕊 → G_ℝ. Then (G, X) is a Shimura datum of Hodge type of dimension n with reflex field ℚ, and the action of G on C(V) by left multiplication with a suitable symplectic form ψ_δ(x, y) = tr(x δ y^\*) (δ ∈ C^+(V)^× with δ^\* = −δ) defines an embedding of Shimura data (G, X) ↪ (GSp(C(V), ψ_δ), S^±) (the Kuga–Satake embedding). If L is self-dual at p, G has a reductive model GSpin(L_{ℤ_(p)}) and the embedding is p-integral after Zarhin's replacement.

*Hypotheses.*
- Signature (n, 2) with n ≥ 1; for n ≥ 6 the datum is not of PEL type.

*Proof sketch.*
- GSpin(V) is the subgroup of C^+(V)^× of elements g with g V g^{-1} = V; the spinor similitude is ν(g) = g g^\*.
- Each oriented negative plane spanned by an oriented orthonormal basis e, f gives h with h(i) = e f; Deligne's axioms hold (MP Introduction, Example; Kisin).

*Sources.* [MP19], Introduction, Example, p. 2: Introduces the GSpin Shimura datum attached to a quadratic space of signature (n, 2) and its Kuga–Satake embedding into a Siegel datum, of Hodge type but not PEL for n ≥ 6. [MST], §2.1, p. 4; §8.1, p. 37: Works with a quadratic lattice self-dual at p and hyperspecial level, using the canonical integral model and its compactifications.

*Uses.* Maulik–Shankar–Tang §8: Hecke orbits on GSpin Shimura varieties are studied through their compactifications; orthogonal integral models of ShimuraVarietiesPartII: the Kuga–Satake route imports this datum.

The API:
- `GSpinDatum` (constructor): (GSpin(V), X) for a quadratic space of signature (n, 2).
- `GSpinDatum.kugaSatake` (data): The embedding of Shimura data into (GSp(C(V), ψ_δ), S^±).
- `GSpinDatum.integral` (data): For L self-dual at p, the reductive model GSpin(L_{ℤ_(p)}) and a p-integral Kuga–Satake embedding.
- `GSpinDatum.dim` (other): dim X = n.
- `GSpinDatum.spinGroup` (compatibility): On ℚ-points, the kernel of ν on GSpin(V)(ℚ) is Mathlib's spinGroup of (V, Q), the even Lipschitz elements x with x^\* x = 1.

*Needs:* Mathlib `CliffordAlgebra`; Mathlib `spinGroup`; Mathlib `QuadraticForm`; ShimuraData D4; C11.1.

**Checks.**

- `GSpinDatum.n1_test` (computation): For n = 1 the GSpin Shimura varieties are Shimura curves or modular curves (GSpin of a ternary space of signature (1, 2) is isogenous to GL_2 or an inner form).
- `GSpinDatum.n2_test` (computation): For n = 2 the GSpin varieties are Hilbert modular surfaces or products of modular curves, or quaternionic analogues.
- `GSpinDatum.n3_test` (compatibility): For n = 3 and L split, GSpin(V) ≅ GSp_4 and the Shimura variety is the Siegel threefold.
- `GSpinDatum.definite_test` (non-example): For a quadratic space of signature (n, 0) there are no negative planes, so X is empty and there is no Shimura datum.
- For n = 3 and L split the datum is the Siegel datum of genus two.
- The Kuga–Satake embedding is p-integral when L is self-dual at p, after Zarhin's replacement.

### C15.2 Cusps of GSpin minimal compactifications

Prove (theorem, node `C15/gspin-cusps`): For the GSpin datum with L self-dual at p and hyperspecial level, the boundary components of 𝒮^BB = 𝒮^min_K (C12.4) are 0- or 1-dimensional: the admissible parabolics are the stabilizers of isotropic lines (zero-dimensional cusps, P with abelian unipotent radical U = W of dimension n) and of isotropic planes I ⊂ L of rank 2 (one-dimensional cusps, U a Heisenberg group with one-dimensional centre W = ∧²I and pure part a modular curve). For a one-dimensional cusp Υ with isotropic plane I set Λ = I^⊥/I, a definite lattice of rank n − 2. The stratification of 𝒮^BB by these cusps is flat over ℤ_(p).

*Hypotheses.*
- (L, Q) self-dual at p, hyperspecial level; real rank of SO(n, 2) is 2, so isotropic subspaces have dimension ≤ 2.

*Proof sketch.*
- In characteristic zero, rational boundary components correspond to isotropic subspaces of V (Bruinier–Zemel §§3.2–3.3; Zemel §4): lines give points and planes give modular curves.
- Integrally apply C12.4: the strata are quotients of integral models of the boundary pure Shimura varieties, flat over ℤ_(p).

*Sources.* [MST], §8.1, p. 37: Records that by Madapusi Pera's Theorem 3 the GSpin integral model has a projective normal minimal compactification with flat stratification whose cusps are zero- or one-dimensional, following Bruinier–Zemel and Zemel. [BZ21], §§3.2–3.3: Describes the boundary components of orthogonal Shimura varieties by isotropic lines and planes (cited by Maulik–Shankar–Tang; not read here).

*Needs:* C15.1; C12.4; ShimuraVarieties V2.

**Checks.**

- For n = 1 (modular or Shimura curves) all cusps are zero-dimensional.
- For n ≥ 3 and L isotropic of Witt index 2, both kinds of cusps occur.

### C15.3 Fibres over one-dimensional cusps and canonical boundary strata

Prove (theorem, node `C15/gspin-one-dimensional-cusps`): Let Υ be a one-dimensional cusp of 𝒮^BB with isotropic plane I and Λ = I^⊥/I. (1) The cone decomposition at Υ is unique (the cone is a ray, W being one-dimensional), so the boundary strata of 𝒮^tor over Υ are canonical. (2) Up to a quotient by a finite group, π^{-1}(Υ) ⊂ 𝒮^tor is a torsor under the abelian scheme ℰ ⊗_ℤ Λ over the modular curve Υ, ℰ the universal elliptic curve. (3) Prime-to-p Hecke correspondences of G(𝔸_f^p) extend uniquely to π^{-1}(𝒮^BB ∖ {zero-dimensional cusps}), with the explicit description on formal completions of C10.9.

*Hypotheses.*
- Hyperspecial level, L self-dual at p; the finite group in (2) is Δ^fin_K(Φ).

*Proof sketch.*
- (1): the cone of a one-dimensional cusp lies in the one-dimensional space W(ℝ), so every admissible decomposition restricts to the ray.
- (2): in characteristic zero π^{-1}(Υ(ℂ)) is a finite quotient of an ℰ ⊗ Λ-torsor over the modular curve (Zemel Proposition 4.3, Theorem 4.5; Bruinier–Zemel Lemma 3.18, Proposition 3.19); integrally the abelian-scheme torsor of C10.3 with A_K(Φ) = ℰ ⊗ Λ.
- (3): since the cones over Υ are forced, the compatibility hypothesis of C10.9 holds for every Hecke translate on this open part.

*Sources.* [MST], §8.4 and §8.5, p. 38: Uses the uniqueness of the cone decomposition at one-dimensional cusps to extend Hecke correspondences over the preimage of the complement of the zero-dimensional cusps, and describes π^{-1}(Υ) as a finite quotient of an ℰ ⊗ Λ-torsor over the modular curve, via Madapusi Pera Theorem 4.1.5. [Zemel], §4, Proposition 4.3 and Theorem 4.5: Explicit description of the boundary over one-dimensional cusps of orthogonal Shimura varieties (cited by Maulik–Shankar–Tang; not read here).

*Needs:* C15.2; C10.3; C10.9; C11.2.

**Checks.**

- For n = 2 and L split of signature (2, 2) (products of modular curves), Λ = 0 and π^{-1}(Υ) is finite over the modular curve.

### C15.4 Zero-dimensional cusps of GSpin varieties

Prove (theorem, node `C15/gspin-zero-dimensional-cusps`): At a zero-dimensional cusp attached to an isotropic line ℓ ⊂ L, the unipotent radical U_P is abelian and equal to its centre W ≅ ℓ ⊗ ℓ^⊥/ℓ (of dimension n), the cone H ⊂ W(ℝ) is a component of the positive cone of the Lorentzian space ℓ^⊥/ℓ ⊗ ℝ of signature (n − 1, 1), self-adjoint for the induced form, and the complete local ring of 𝒮^BB_{K_n,k} at the cusp is k[[q^λ]]^{Δ_{K_n}}_{λ≥0} with the action of 𝔹_ℓ of C12.7.

*Hypotheses.*
- Hyperspecial level; ℓ ≠ p for the 𝔹_ℓ action.

*Proof sketch.*
- Compute the parabolic stabilizing ℓ: its unipotent radical is the group of Eichler transformations, abelian and isomorphic to ℓ ⊗ ℓ^⊥/ℓ.
- The positive cone is that of the Lorentzian space; apply C12.7.

*Sources.* [MST], §8.2, pp. 37–38: Works at a zero-dimensional cusp of the GSpin variety, whose admissible parabolic stabilizes an isotropic line, with lattice B_{K_n} in W(ℚ), the open self-adjoint cone and the invariant power series description of the complete local ring.

*Needs:* C15.2; C12.7.

**Checks.**

- For n = 3 (Siegel threefold) the cone at an isotropic line is the cone of positive definite binary quadratic forms, the Siegel cusp.
- U_P is abelian of dimension n at a zero-dimensional cusp.

## Recorded inputs owned elsewhere

- **Kisin's smoothness of integral models of Hodge type at hyperspecial level.** For a p-integral Hodge embedding (C11.1) with p > 2 (or p = 2 under Kim–Madapusi Pera), the normalization 𝒮_K of 𝒜_{K‡} ⊗ O_{E,(v)} in Sh_K is smooth over O_{E,(v)}, its complete local rings are quotients of Siegel ones cut out by deformations preserving crystalline tensors, the de Rham tensors s_{α,dR} extend over 𝒮_K with P_dR a G_{ℤ_(p)}-torsor, and 𝒮_K satisfies the extension property for regular formally smooth schemes (Kisin, J. Amer. Math. Soc. 23 (2010), Theorem 2.3.5, Propositions 2.3.8–2.3.9; Madapusi Pera Theorem 4.3.3). Owner: the pending design ShimuraVarietiesPartII (issue #3356, integral models and reduction), not yet planned; this roadmap uses the statement as an input and does not plan it. Needed by C11.2, C11.3, C11.5, C11.6, C11.4.
- **Local structure of the Klingen and paramodular moduli over ℤ_p.** Y_par,K and Y_Kli(p),K are regular, flat local complete intersections over ℤ_p, the non-smooth locus of Y_par,K is a finite set of closed points of characteristic p, and these moduli spaces are normal, hence equal to the normalization of the auxiliary models in their generic fibres (Pilloni Proposition 6.1.4.1, from the local models of Yu and of de Jong, with deformation ring ℤ_p[[X, Y, W, Z]]/(XY − WZ + p) at the paramodular singular point). Owner: ShimuraVarietiesPartII (interior models and local models), not yet planned. Needed by C14.4.
- **Normality of Iwahori and Lagrangian lattice-chain moduli.** For n = 1 the moduli of self-dual chains of p-isogenies of principally polarized abelian schemes (Iwahori level), and the moduli of Lagrangian subgroups of G[p], are normal and flat over ℤ_p, so that they coincide with the interiors of the normalized models (Boxer–Pilloni Remark 4.1.2, interior form; Görtz's flatness of symplectic local models). Owner: ShimuraVarietiesPartII (parahoric lattice-chain moduli), not yet planned. Needed by C13.6, C14.6.

## Corrections to the sources

- **E1** ([Pilloni20], §6.1.5.2, pp. 27–28). The moduli of 1-motives M_{W,γ}, M_{W,γ,Kli(p)}, M_{W,γ,par} are said to carry K_p-level structure; the abelian part is given genus rank_ℤ W; B_{W,γ,par} is placed over Y_{W,γ}. Correction: Level K^p (away from p); the abelian part has genus 2 − rank_ℤ W; B_{W,γ,par} lies over Y_{W,γ,par}. Reason: The toric part of the degeneration at W has rank rank_ℤ W, so the abelian part of a genus-two 1-motive has genus 2 − rank W; the level at p is encoded by the lattice, not by a K_p-structure; the diagram on p. 27 already has Y_{W,γ,par}. C14.2 states the corrected objects.
- **E2** ([Pilloni20], §6.1.5.3, p. 28, and condition 3, p. 29). The lattices X_⋆(T) are placed in Sym²(V/W^⊥) ⊗ ℚ and smoothness is tested against a lattice of that space; condition 3 is conditioned on H being admissible. Correction: The lattices in Sym²(V/W^⊥) ⊗ ℚ are character groups X^⋆(T); cones live in X_⋆(T)_ℝ and a cone is smooth if its generators extend to a ℤ-basis of X_⋆(T); condition 3 reads 'if H = Γ (resp. Γ_par, Γ_Kli(p))'. Reason: Cones of a torus embedding lie in the cocharacter space; the admissibility wording is that of Theorem 6.1.5.1(4). C14.2 uses the corrected definitions.
- **E3** ([Pilloni20], Theorem 6.1.5.1(2), p. 29). For a refinement π : X_{Σ′} → X_Σ the boundary ideals satisfy π^\*I_{X_Σ} = I_{X_{Σ′}}. Correction: Rπ_\*I_{X_{Σ′}} = I_{X_Σ}; only π^\*I_{X_Σ} ⊂ I_{X_{Σ′}} holds, with equality only when Σ′ = Σ. Reason: Blowing up the vertex of a smooth two-dimensional cone, the pullback of (xy) vanishes to order 2 along the exceptional curve while the new boundary ideal vanishes to order 1. C14.7 uses the derived statement, supplied by ShimuraCompactifications C3.8.
- **E4** ([Pilloni20], Theorem 6.1.5.1(1) and the Notation after its proof, p. 29). The (σ, γ)-strata of X_Kli(p) and X_par are listed in swapped order, and the abbreviation list X, X_par, X_Kli(p) is permuted relative to X_{K,Σ}, X_Kli(p)_{K,Σ}, X_{par,K,Σ}. Correction: The (σ, γ)-stratum is Z_{W,γ,σ} (resp. Z_{W,γ,Kli(p),σ}, resp. Z_{W,γ,par,σ}); X, X_Kli(p), X_par abbreviate X_{K,Σ}, X_Kli(p)_{K,Σ}, X_{par,K,Σ}. Reason: The 'resp.' lists must follow the same order. C14.3 states the corrected order.
- **E5** ([Pilloni20], §7.1, p. 38). The non-smooth locus of X, X_Kli(p), X_par is said to be of codimension 2. Correction: It has codimension at least 2; for Y_par,K the non-smooth locus is a finite set of closed points (Proposition 6.1.4.1), of codimension 4 in the 4-dimensional scheme Y_par,K over ℤ_p. Reason: Only the bound is used, for extending sections across the non-ordinary locus. C14.4 states 'at least 2'.
- **E6** ([BP], §4.1 first line and §4.1.1, pp. 40–41). n ∈ ℤ_{≥0}; A_{g+i} is given a polarization of degree p^{2ng−2in} = d_i; the flag 0 ⊂ H_{g+1} ⊂ ⋯ ⊂ H_g with Gr_i = H_i/H_{i−1}. Correction: n ≥ 1; the polarization of A_{g+i} has degree d_i² with d_i = p^{n(g−i)}, matching the convention that A_{g,d} parametrizes polarizations of degree d²; Gr_i is H_i modulo the preceding term of the flag in the order g + 1, …, 2g, 1, …, g, with 0 before H_{g+1}. Reason: For n = 0 the Iwahori subgroup is G(ℤ_p) and the chain is trivial; the degree convention of §3.4.19 is d²; with literal indices H_g/H_{g−1} and H_{g+1}/H_g are not quotients of nested groups. C13.4 and C13.5 use the corrected statements.
- **E7** ([BP], §4.1 after Remark 4.1.2 and §4.1.8, p. 41). Gr_i is treated on all of S^tor as a finite flat group scheme to which Fargues's divisor construction applies. Correction: Over S^tor, Gr_i is the kernel of an extended isogeny of semi-abelian schemes, quasi-finite and flat but not finite in general at the boundary; it is finite flat over the interior. Reason: For the Tate curve, ker(Tate(q^p) → Tate(q)) has order p off q = 0 and is trivial at q = 0. C13.5 states the quasi-finite flat statement; the divisor D_i is built by HigherHidaAndColemanTheory from it.
- **E8** ([MP19], Remark 5.2.10, p. 87, about Lan's book 7.2.3.5 and 7.2.3.15). Lan's book asserts that the map from the boundary Shimura variety to the minimal compactification is injective on geometric points and describes strata without the finite quotient Δ^fin_K(Φ). Correction: The strata of the minimal compactification are Δ^fin_K(Φ)\𝒮_{K_Φ,h}; injectivity is known in the Siegel case but not shown in general. Reason: Madapusi Pera notes the claim is not justified outside the Siegel case. C12.4 states the strata with the finite quotient.

## Downstream consumers

- **HigherHidaAndColemanTheory** builds its ordinary strata, blow-ups, integral complexes and Klingen complexes on the deep-level and Iwahori models (C13.2, C13.4–C13.5) and on the Klingen models and X^⋆_Kli(p) (C14.3, C14.8). Its requests to "ShimuraCompactifications C5, Part II" are supplied here.
- **IntegralCoherentHeckeComplexes** and **SiegelModularFormsModPn** use the Klingen and paramodular models, the coefficient sheaves and the T_{p,2}-correspondence (C14).
- **The Igusa varieties Part II** embeds the ordinary Igusa formal scheme into the p-adic completion of the ℤ_p^cycl model (C7.10, C13.2).
- **ShimuraVarietiesPartII** compares its interior integral models with the interiors of the normalized models (C7.6) and imports the GSpin datum (C15.1) for its orthogonal direction.
- **Hecke orbits and essential dimension**: Maulik–Shankar–Tang use C11.2, C12.4–C12.7 and C15; Farb–Kisin–Wolfson use C11.5.
- **ShimuraCompactifications C5.31** (Lan17 normalized blow-ups) takes its minimal-model input from C8.10.


## References

- [MP19] Keerthi Madapusi Pera, *Toroidal compactifications of integral models of Shimura varieties of Hodge type*, arXiv:1211.1731v6 (11 March 2018); Annales scientifiques de l'École normale supérieure 52 (2019), 393–514. https://arxiv.org/abs/1211.1731v6
- [Lan16] Kai-Wen Lan, *Compactifications of PEL-type Shimura varieties in ramified characteristics*, Author's compilation with errata corrected (cpt-ram-flat.pdf, 78 pp.); Forum of Mathematics, Sigma 4 (2016), e1. Page numbers are the author copy's.. https://www.kwlan.org/articles/cpt-ram-flat.pdf
- [Lan17] Kai-Wen Lan, *Integral models of toroidal compactifications with projective cone decompositions*, Author's compilation (cpt-ram-nbl.pdf, 36 pp.); International Mathematics Research Notices 2017, no. 11, 3237–3280. https://www.kwlan.org/articles/cpt-ram-nbl.pdf
- [BP] George Boxer and Vincent Pilloni, *Higher Hida theory for Siegel modular forms*, Authors' version of 5 November 2025 (higherhidaSiegel.pdf, 65 pp.); Inventiones mathematicae 244 (2026), doi:10.1007/s00222-025-01393-2. https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf
- [Pilloni20] Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*, Author's version (17 June 2019, as cited by the extraction); Duke Mathematical Journal 169 (2020), 1647–1807. Read in the maintainer-cleared copy; also free at the author's page.. https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf
- [FKW] Benson Farb, Mark Kisin and Jesse Wolfson, *Essential dimension via prismatic cohomology*, arXiv:2110.05534v2 (27 February 2024). https://arxiv.org/abs/2110.05534v2
- [MST] Davesh Maulik, Ananth N. Shankar and Yunqing Tang, *Picard ranks of K3 surfaces over function fields and the Hecke orbit conjecture*, Authors' manuscript of 25 December 2021 (GSpincharp.pdf); Inventiones mathematicae 228 (2022), 1075–1143. https://math.berkeley.edu/~ytang/GSpincharp.pdf
- [FC] Gerd Faltings and Ching-Li Chai, *Degeneration of Abelian Varieties*, Ergebnisse der Mathematik und ihrer Grenzgebiete (3) 22, Springer, 1990 (maintainer-cleared copy; cited through the parent roadmap's C4).
- [Brylinski] Jean-Luc Brylinski, *1-motifs et formes automorphes (théorie arithmétique des domaines de Siegel)*, Journées automorphes (Dijon, 1981), Publ. Math. Univ. Paris VII 15 (1983), 43–106.
- [Stroh] Benoît Stroh, *Compactifications de variétés de Siegel aux places de mauvaise réduction (and the Astérisque 370 sequel)*, Bull. SMF 138 (2010), 259–315; Astérisque 370 (2015), 269–304.
- [BZ21] Jan Hendrik Bruinier and Shaul Zemel, *Special cycles on toroidal compactifications of orthogonal Shimura varieties*, Mathematische Annalen (2021).
- [Zemel] Shaul Zemel, *The structure of integral parabolic subgroups of orthogonal groups*, Journal of Algebra 559 (2020), 95–128.
