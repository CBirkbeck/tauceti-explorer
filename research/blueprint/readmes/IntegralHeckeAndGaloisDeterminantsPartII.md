# Integral Hecke actions, determinants and interpolation, Part II: ramified Hecke operators and local–global compatibility away from p

Starting where Integral Hecke actions, determinants and interpolation stops, this Part II constructs the ramified Hecke operators t_{v,i}(σ) of GL_n at pro-ℓ-Iwahori level and the ramified Hecke polynomials P_{v,σ}(X), identifies them with the local Langlands correspondence, transfers them to Siegel-parahoric levels of the quasi-split unitary group U(n, n), and proves local–global compatibility away from p for the Galois determinants valued in torsion Hecke algebras of GL_n over a CM field (Allen et al., Potential automorphy over CM fields, Theorem 3.1.1): up to a nilpotent ideal of bounded exponent, the characteristic polynomial of every σ in the Weil group at a place of R is the image of P_{v,σ}(X).

## Purpose and starting point

Integral Hecke actions, determinants and interpolation (IntegralHeckeAndGaloisDeterminants) builds Chenevier determinants, Cayley–Hamilton reconstruction, Hecke images of complexes, the spherical normalization of the GL_n Hecke polynomial P_v(X) at unramified places (IHG.3), and the interpolation and nilpotent descent of Hecke-algebra-valued determinants (IHG.4–IHG.5). Its determinants are controlled only through Frobenius elements at unramified places. This Part II starts there and answers the next question: how a determinant valued in a torsion Hecke algebra behaves on the Weil group at a ramified place. It does so for GL_n over a CM field, at places v ∤ p of tame Iwahori level, following §2.2.5 and §3 of Allen, Calegari, Caraiani, Gee, Helm, Le Hung, Newton, Scholze, Taylor and Thorne, *Potential automorphy over CM fields* (Ann. of Math. 197 (2023), 897–1113; cited as ACC+ with the published numbering).

The final theorem is ACC+ Theorem 3.1.1. Let F be a CM field containing an imaginary quadratic field, p a prime with every p-adic place of F⁺ split in F, K ⊂ GL_n(A_F^∞) a good subgroup, λ a dominant weight, S = S^c a finite set of finite places containing the p-adic ones (with ACC+'s condition on residue characteristics outside S), R ⊂ S a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F, with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R, and T = S − (R^c − R). If 𝔪 ⊂ T^S(K, λ) is non-Eisenstein, there are an integer N ≥ 1 depending only on n and [F : ℚ], an ideal I_R ⊂ T^T_R(K, λ)_𝔪 with I_R^N = 0, and a continuous homomorphism ρ_{𝔪,R} : G_{F,T} → GL_n(T^T_R(K, λ)_𝔪/I_R) such that det(X − ρ_{𝔪,R}(Frob_v)) is the image of P_v(X) for every v ∉ T and det(X − ρ_{𝔪,R}(σ)) is the image of the ramified Hecke polynomial P_{v,σ}(X) for every v ∈ R and σ ∈ W_{F_v}.

## Conventions

- Local fields. F_v is a nonarchimedean local field with ring of integers O_{F_v}, a fixed uniformizer ϖ_v, residue field k(v) of cardinality q_v and residue characteristic ℓ. The normalized valuation v satisfies v(ϖ_v) = 1, and |x|_v = q_v^{−v(x)}.
- Class field theory. Art_{F_v} : F_v^× → W_{F_v}^{ab} sends uniformizers to geometric Frobenius elements; Frob_v is a geometric Frobenius; for σ ∈ W_{F_v}, ‖σ‖_v = |Art_{F_v}^{−1}(σ|_{F_v^{ab}})|_v, so ‖Frob_v‖_v = q_v^{−1}; the cyclotomic character satisfies ε(Frob_v) = q_v^{−1}. A Frobenius lift is an element φ_v ∈ W_{F_v} mapping to Frob_v.
- Local Langlands. rec_{F_v} is the correspondence of Harris–Taylor, valued in Frobenius-semisimple Weil–Deligne representations, and rec^T_{F_v}(π) = rec_{F_v}(π ⊗ |det|^{(1−n)/2}) is its arithmetic normalization; rec^T(St_m) = Sp_m, the Weil–Deligne representation on ⊕Q̄_pe_i with W_{F_v} acting on e_i through |·|^{1−i} ∘ Art^{−1} and N e_1 = 0, N e_i = e_{i−1}.
- Hecke algebras. For a locally profinite group G and a compact open subgroup U, H(G, U) is the ring of compactly supported U-biinvariant ℤ-valued functions under convolution with vol(U) = 1, [UgU] the characteristic function of UgU; H(G, U) ⊗ R is its scalar extension. In Lean this is Mathlib's Hecke coset module 𝕋 ⊤ U R with Tau Ceti's convolution product.
- Levels. Iw_v ⊂ GL_n(O_{F_v}) is the Iwahori subgroup (reduction upper triangular) and Iw_{v,1} the pro-ℓ Iwahori subgroup (reduction unipotent upper triangular), as in ArithmeticLocallySymmetricSpaces ALS.0; Iw_v(b, c) are ACC+'s intermediate levels. B_n = T_nN_n is the upper triangular Borel subgroup and N̄_n the lower unipotent radical.
- Polynomials. P_v(X) = Σ_{i=0}^{n}(−1)^iq_v^{i(i−1)/2}T_{v,i}X^{n−i} is the spherical Hecke polynomial of IHG.3; with the conventions above it is the characteristic polynomial of geometric Frobenius on rec^T(π_v) for unramified π_v (IHG.3/frobenius-conversion relates it to the arithmetic convention). For a polynomial f of degree d with unit constant term a_0, f^∨(X) = a_0^{−1}X^df(X^{−1}).
- Determinants are Chenevier's (IHG.0): a d-dimensional A-valued determinant of a group Γ is a multiplicative homogeneous polynomial law of degree d on A[Γ]; D^{c,∨} ⊗ ε^{1−2n} denotes the determinant of ρ^{c,∨} ⊗ ε^{1−2n} when D = det ρ, so its underlying law is twisted by ε^{n(1−2n)}.
- Unitary group. G̃ is ACC+'s quasi-split unitary group over O_{F⁺} preserving J_n, P = U ⋊ G its Siegel parabolic with G ≅ Res_{O_F/O_{F⁺}} GL_n through the lower right block, and for v above a place v̄ split in F, ι_v : G̃(F⁺_v̄) ≅ GL_{2n}(F_v) with G(F⁺_v̄) = GL_n(F_{v^c}) × GL_n(F_v) embedded by (D_{v^c}, D_v) ↦ diag(Ψᵗc(D_{v^c})^{−1}Ψ, D_v).
- Numbering. Statement and equation numbers are those of the published article; arXiv:1812.09999v2 numbers the statements of §2.2 one lower (v2 Proposition 2.2.8 is published Proposition 2.2.9).

## Boundaries

This roadmap owns the tame Iwahori levels and the ramified Hecke operators of GL_n at v ∤ p, their identification with the local Langlands correspondence, their transfer to Siegel-parahoric and tame levels of U(n, n) at split places with the Satake computations, the resultant Res_v and the inertia relation, the ramified Hecke algebras T^T_R and T̃^T_R with their Satake map, twisting, duality and level change, and the ℓ ≠ p local–global compatibility argument of ACC+ §3. It imports, and never re-plans:

- IntegralHeckeAndGaloisDeterminants IHG.0–IHG.5: determinants, characteristic polynomials, direct sums, duals, restriction, Amitsur's formula, Cayley–Hamilton reconstruction (Chenevier's Theorem 2.22), Hecke images of complexes and their nilpotent kernels (Lemma 2.2.4), the spherical normalization, Galois-type and non-Eisenstein maximal ideals, uniqueness from Frobenius density, compact gluing and inverse limits of determinants, nilpotent descent. Lemma 3.2.4 (Hensel's lemma for determinants) and the Hecke images of an exact triangle are requested from IHG.1 and IHG.2; the unramified Weil-group polynomials P_{v,σ} from IHG.3.
- SmoothRepresentationsOfLocalGroups SR.1–SR.3: Hecke algebras over rings, the positive-monoid Lemmas 2.1.12–2.1.13 of ACC+ (Bushnell–Kutzko), Jacquet functors with the geometric lemma and Bushnell–Kutzko's Theorem 7.9, admissibility, supercuspidal support and the universal unramified twist.
- ArithmeticLocallySymmetricSpaces ALS.0–ALS.6: levels, locally symmetric spaces, the complexes RΓ, RΓ_c and RΓ(∂·) with their Hecke actions, derived Hecke algebras and their limits, the monoid Satake maps r_P, r_M, 𝒮 (Lemmas 2.1.10–2.1.11), the boundary triangle and Theorem 2.4.2, localization at maximal ideals, Poincaré duality, character twisting, finite-level descent.
- TorsionCohomologyInfrastructure TC.2–TC.4: Scholze's comparison of torsion and classical Hecke eigensystems (for the full prime-to-p Hecke algebra), the Siegel datum and the unramified Levi Satake identity (Proposition 2.2.16), and ACC+ Theorems 2.3.5 and 2.3.7.
- PotentialAutomorphyInfrastructure PA.0: Theorem 2.4.8, the descent of the Satake map to the localized boundary Hecke algebra with the operators at R.
- AutomorphicGaloisRepresentationsPartII AG2.2, AG2.5: the Galois representations r_ι(π̃) of cuspidal cohomological representations of U(n, n) and their local–global compatibility at places above primes split in an imaginary quadratic subfield (ACC+ Theorem 2.3.3).
- ArithmeticGaloisRepresentations R01.2: Weil–Deligne representations, Grothendieck's monodromy theorem, Frobenius semisimplification. EndoscopicTransferAndUnitaryTraceComparison ET.6: the local Langlands correspondence for GL_m with full Weil–Deligne parameters. IgusaVarietiesAndTorsionConcentration IG.0: the quasi-split unitary datum.
- Tau Ceti ClassFieldTheory (layers 7, 9, 11, 12) and Chebotarev (layer 10): the local Artin map and Weil group, global reciprocity and existence, Chebotarev density.

Theorem 2.4.8 is imported from PotentialAutomorphyInfrastructure PA.0. Its statement is built from the operators t_{v,i}(σ), e_{v,i}(σ) and the algebras T̃^T_R, T^T_R defined here, so the order of construction is IHR.1, IHR.3 and IHR.5, then Theorem 2.4.8, then IHR.7. The consumers of Theorem 3.1.1 in PotentialAutomorphyInfrastructure (ACC+ Propositions 6.5.3, 6.5.11, 6.6.7, 6.6.9) take it from IHR.7.

Not in this roadmap: local–global compatibility at p (PotentialAutomorphyInfrastructure PA.1–PA.2); places of R whose level is not between Iw_{v,1} and Iw_v; places whose residue characteristic does not split in an imaginary quadratic subfield of F; and the monodromy operator itself — the theorem controls characteristic polynomials, which is what congruence arguments see.

## Sources

- **ACC23**: Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack A. Thorne, *Potential automorphy over CM fields*, Annals of Mathematics 197 (2023), no. 3, 897–1113, doi:10.4007/annals.2023.197.3.2; the published PDF posted on Frank Calegari's page (217 pp.), cited by printed page numbers and published statement numbers; title and authors verified on p. 897. https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf. Read: §1.2 Notation, pp. 905–909; §2.1.9 The Hecke algebra of a monoid (Lemmas 2.1.10–2.1.14), pp. 913–916; §2.2.1 (the group G̃, Hecke algebras, Lemma 2.2.4), pp. 916–921; §2.2.5 Some useful Hecke operators, (2.2.6)–(2.2.19), pp. 921–931; §2.2.20 Duality and twisting, Propositions 2.2.21, 2.2.23, Corollaries 2.2.22, 2.2.24, pp. 931–935; §2.3 Theorems 2.3.2–2.3.8, Definition 2.3.6, Proposition 2.3.9, pp. 935–941; §2.4.1 Theorem 2.4.8 and its proof, pp. 946–948; §3 Local–global compatibility, l ≠ p, pp. 953–964; the uses of Theorem 3.1.1 on pp. 900, 1063 and 1067; References, pp. 1106–1113.
- **ACC23v2**: Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack A. Thorne, *Potential automorphy over CM fields*, arXiv:1812.09999v2 (16 June 2022), the accepted version; its numbering of statements in §2.2 is one less than print (v2 Proposition 2.2.8 = published Proposition 2.2.9, v2 (2.2.11) = published (2.2.12)). https://arxiv.org/abs/1812.09999v2. Read: §2.2.5 and §3, compared with the published text for every passage cited; the printed slips recorded under sourceIssues are present in v2.
- **Fli11**: Yuval Z. Flicker, *The tame algebra*, Journal of Lie Theory 21 (2011), no. 2, 469–489, doi:10.5802/jolt.640 (open access, Centre Mersenne). https://jolt.centre-mersenne.org/item/10.5802/jolt.640.pdf. Read: §1 Introduction, pp. 469–471; §2 The tame group and tame representations (Theorem 2.1, Corollary 2.2, Lemma 2.3), pp. 471–474; §3 Generators and relations (Theorem 3.1, Corollary 3.2, Proposition 3.3, Corollary 3.4), pp. 475–479; §4 Bernstein-type presentation (Theorem 4.5, Proposition 4.11), pp. 479–488.
- **Tho22**: Jack A. Thorne, *On the vanishing of adjoint Bloch–Kato Selmer groups of irreducible automorphic Galois representations*, arXiv:2207.04925v1 (11 July 2022); cited by ACC+ as [Tho21]. https://arxiv.org/abs/2207.04925v1. Read: §2 A different computation: Lemma 2.1, the resultants Res_{n1,n2} and Res_{q,n1,n2}, Propositions 2.2–2.3, Lemma 2.4, pp. 4–6.

## Layer overview

- **IHR.1 — Pro-ℓ-Iwahori levels and the ramified Hecke operators of GL_n**: the tame Iwahori levels Iw_{v,1} ⊆ I_v ⊆ Iw_v of GL_n(F_v), the tame torus quotient Ξ_v and its positive cone, Flicker's invertibility of positive double cosets (over ℤ[1/q_v], at every intermediate level), the injective embedding t : O[Ξ_v] → H(GL_n(F_v), I_v) ⊗ O, the normalized operators t_{v,i}(α) = q_v^{(i−1)v(α)}t([e_i(α)]), their elementary symmetric functions e_{v,i}, the characters ψ_{v,i} of W_{F_v}, and the ramified Hecke polynomial P_{v,σ}(X) (2.2.8).
- **IHR.2 — Tame Iwahori invariants and the local Langlands correspondence**: Proposition 2.2.9: the tame principal series criterion, the centrality of the e_{v,i}(α), and the identity between P_{v,σ}(X) acting on π_v^{I_v} and the characteristic polynomial of rec^T(π_v)(σ); the specialization to the spherical polynomial P_v(X) of IHG.3.
- **IHR.3 — Siegel-parahoric transfer at split places of the quasi-split unitary group**: the Siegel parahoric levels 𝔭_v ⊃ 𝔭_{v,1} and q̃_v and the unitary tame levels Ĩ_v̄ of U(n, n) at a split place, the invertible strongly positive Levi elements (Lemma 2.2.10), the transferred operators and polynomials (2.2.11)–(2.2.12), (2.2.17), Lemma 2.2.13, and the Satake transforms of Propositions 2.2.18–2.2.19.
- **IHR.4 — The resultant and the inertia relation**: the resultant Res_v of P_{v^c,φ_v^{−c}} and P_{v,φ_v}, the étaleness of ordered factorizations away from the resultant, Proposition 2.2.14 and Corollary 2.2.15 (Res_v^{(2n)!}(ρ(τ_v) − 1)P_{v,φ_v}(ρ(φ_v)) = 0).
- **IHR.5 — Ramified Hecke algebras of arithmetic complexes**: the commutative ramified Hecke algebras T^T_R, T^T_R(K, λ) and T̃^T_R, their localization at 𝔪 ⊂ T^S(K, λ), the ramified Satake homomorphism, twisting by characters, Poincaré duality and change of level.
- **IHR.6 — Local–global compatibility at R for the unitary group**: local–global compatibility at R for classical points, its interpolation over continuous quotients of Scholze's classical Hecke algebra, Proposition 3.2.2 for RΓ_c of the unitary locally symmetric space, the version for RΓ through duality, and Corollary 3.2.3 for the boundary.
- **IHR.7 — Descent to GL_n: local–global compatibility away from p**: the local determinants E_v, the auxiliary characters, the decomposed unitary level, Lemma 3.2.1, the boundary determinant D′ = D·(D^{c,∨} ⊗ ε^{1−2n}), the identification D|_{W_{F_v}} = E_v, unramifiedness at R^c − R, Proposition 3.1.2 and Theorem 3.1.1.

## IHR.1 — Pro-ℓ-Iwahori levels and the ramified Hecke operators of GL_n

Let F_v be a nonarchimedean local field with ring of integers O_{F_v}, fixed uniformizer ϖ_v, residue field k(v) of cardinality q_v and residue characteristic ℓ, and let O be a ring in which q_v is a unit (in the arithmetic application, the ring of integers of a finite extension E/ℚ_p with p ≠ ℓ). Hecke algebras H(G, U) are the rings of compactly supported U-biinvariant ℤ-valued functions with vol(U) = 1, written with double cosets [UgU]; Art_{F_v} sends uniformizers to geometric Frobenius elements.

**Targets.**
- *Tame Iwahori levels.* The open compact subgroups I_v of GL_n(F_v) with Iw_{v,1} ⊆ I_v ⊆ Iw_v (Iw_v the standard Iwahori subgroup, Iw_{v,1} the pro-ℓ Iwahori subgroup of ArithmeticLocallySymmetricSpaces ALS.0); their bijection with subgroups of (k(v)^×)^n = Iw_v/Iw_{v,1}; their Iwahori decomposition with respect to the upper triangular Borel B_n = T_nN_n.
- *The tame torus quotient* Ξ_v = T_n(F_v)/(T_n(F_v) ∩ I_v) = (F_v^×)^n/ker((O_{F_v}^×)^n → Iw_v/I_v), its positive cone (valuations non-increasing), the exact sequence 0 → T_n(O_{F_v})/(T_n ∩ I_v) → Ξ_v → ℤ^n → 0, and the strongly positive element z_v = diag(ϖ_v^{n−1}, …, ϖ_v, 1).
- *Invertibility of positive double cosets*: for every g ∈ T_n(F_v), [I_v g I_v] is a unit of H(GL_n(F_v), I_v) ⊗ ℤ[1/q_v] (Flicker's tame presentation, extended to every intermediate level and to integral coefficients).
- *The tame torus embedding* t : O[Ξ_v] → H(GL_n(F_v), I_v) ⊗ O, the unique O-algebra homomorphism sending a positive g to [I_v g I_v]; it is injective (ACC+ §2.2.5, p. 924, via the positive-monoid Lemmas 2.1.12–2.1.13 owned by SmoothRepresentationsOfLocalGroups SR.1).
- *The ramified Hecke operators* t_{v,i}(α) = t(q_v^{(i−1)v(α)}·(1, …, α, …, 1)) for α ∈ F_v^× (α in position i), their elementary symmetric functions e_{v,i}(α), and the characters ψ_{v,i} : W_{F_v} → (H(GL_n(F_v), I_v) ⊗ O)^×, σ ↦ t_{v,i}(σ) := t_{v,i}(Art_{F_v}^{−1}(σ|_{F_v^{ab}})).
- *The ramified Hecke polynomial* (2.2.8) P_{v,σ}(X) = ∏_{i=1}^{n}(X − t_{v,i}(σ)) = Σ_{i=0}^{n}(−1)^i e_{v,i}(σ)X^{n−i}, with its universal version in O[Ξ_v][X], and its compatibility with change of tame level.

Every object carries the API listed in the roadmap document, with unit tests for n = 1, for I_v = Iw_v and for I_v = Iw_{v,1}.

**Dependencies.** Within this roadmap: none. Other roadmaps: IntegralHeckeAndGaloisDeterminants:IHG.3, SmoothRepresentationsOfLocalGroups:SR.1, ArithmeticLocallySymmetricSpaces:ALS.0, ArithmeticLocallySymmetricSpaces:ALS.3, ArithmeticLocallySymmetricSpaces:ALS.4, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group.

**Planets.** Pro-ℓ-Iwahori levels (`IHR.1/tame-iwahori-level`); Tame torus embedding (`IHR.1/tame-torus-embedding`); Pro-ℓ-Iwahori Hecke operators (`IHR.1/tame-hecke-operators`); Ramified Hecke polynomial P_{v,σ} (`IHR.1/ramified-hecke-polynomial`).

### Tame Iwahori levels between the pro-ℓ Iwahori and the Iwahori subgroup

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-iwahori-level` (definition).

Let F_v be a nonarchimedean local field with ring of integers O_{F_v}, uniformizer ϖ_v, residue field k(v) of cardinality q_v and residue characteristic ℓ, and let n ≥ 1. Let Iw_v ⊂ GL_n(O_{F_v}) be the Iwahori subgroup (reduction modulo ϖ_v upper triangular) and Iw_{v,1} ⊂ Iw_v the pro-ℓ Iwahori subgroup (reduction unipotent upper triangular), as in ArithmeticLocallySymmetricSpaces ALS.0. Reduction followed by the diagonal is a surjective homomorphism d : Iw_v → T_n(k(v)) = (k(v)^×)^n with kernel Iw_{v,1}. A tame Iwahori level at v is an open compact subgroup I_v ⊂ GL_n(F_v) with Iw_{v,1} ⊆ I_v ⊆ Iw_v; equivalently I_v = d^{−1}(A) for a unique subgroup A = A(I_v) ≤ (k(v)^×)^n. Its torus part is T_{I_v} = I_v ∩ T_n(F_v) = {t ∈ T_n(O_{F_v}) : t mod ϖ_v ∈ A}. Every tame Iwahori level has an Iwahori decomposition with respect to B_n = T_nN_n: the product maps (I_v ∩ N̄_n) × T_{I_v} × (I_v ∩ N_n) → I_v and (I_v ∩ N_n) × T_{I_v} × (I_v ∩ N̄_n) → I_v are bijections, with I_v ∩ N_n = N_n(O_{F_v}) and I_v ∩ N̄_n = N̄_n(ϖ_vO_{F_v}) (N̄_n the lower unipotent radical).

Hypotheses and conventions: n ≥ 1; F_v nonarchimedean local, of any characteristic; I_v an open compact subgroup of GL_n(F_v).

Construction or proof:

1. The composite Iw_v → B_n(k(v)) → T_n(k(v)) is a surjective homomorphism whose kernel is Iw_{v,1} (ALS.0/standard-level-subgroups records Iw_v/Iw_{v,1} ≅ (k(v)^×)^n and the normality of Iw_{v,1}).
2. By the correspondence theorem the subgroups between Iw_{v,1} and Iw_v are the preimages d^{−1}(A), A ≤ (k(v)^×)^n; each is open, being a union of cosets of the open subgroup Iw_{v,1}, and compact, being closed in the compact Iw_v.
3. Iw_v has the Iwahori decomposition N̄_n(ϖ_vO) × T_n(O) × N_n(O) ≅ Iw_v in both orders (Gauss elimination over O_{F_v} with lower entries divisible by ϖ_v); d kills both unipotent factors, so d^{−1}(A) decomposes with torus factor T_{I_v} = T_n(O) ∩ d^{−1}(A).

API:

- `TameIwahoriLevel` (data): The structure of an open compact subgroup I_v of GL_n(F_v) with Iw_{v,1} ≤ I_v ≤ Iw_v.
- `TameIwahoriLevel.ofTorusSubgroup` (constructor): For A ≤ (k(v)^×)^n, the level d^{−1}(A).
- `TameIwahoriLevel.torusSubgroup` (projection): The subgroup A(I_v) = d(I_v) ≤ (k(v)^×)^n.
- `TameIwahoriLevel.orderIsoTorusSubgroup` (equivalence): ofTorusSubgroup and torusSubgroup are inverse order isomorphisms between tame Iwahori levels (ordered by inclusion) and subgroups of (k(v)^×)^n.
- `TameIwahoriLevel.torusPart` (data): T_{I_v} = I_v ∩ T_n(F_v) = {t ∈ T_n(O_{F_v}) : t mod ϖ_v ∈ A(I_v)}.
- `TameIwahoriLevel.iwahoriDecomposition` (characterisation): The product maps (I_v ∩ N̄_n) × T_{I_v} × (I_v ∩ N_n) → I_v and (I_v ∩ N_n) × T_{I_v} × (I_v ∩ N̄_n) → I_v are bijections, with I_v ∩ N_n = N_n(O_{F_v}) and I_v ∩ N̄_n = N̄_n(ϖ_vO_{F_v}).
- `TameIwahoriLevel.normal_iwahori` (instance): I_v is normal in Iw_v and Iw_v/I_v ≅ (k(v)^×)^n/A(I_v); in particular Iw_v/I_v is abelian of order prime to ℓ.
- `TameIwahoriLevel.index_iwahori` (simp): [Iw_v : I_v] = (q_v − 1)^n/#A(I_v).
- `TameIwahoriLevel.isHeckeTriple` (instance): (GL_n(F_v), I_v) is a Hecke pair: every element of GL_n(F_v) commensurates I_v, so Mathlib's IsHeckeTriple ⊤ I_v I_v holds and H(GL_n(F_v), I_v) ⊗ R is Tau Ceti's Hecke ring 𝕋 ⊤ I_v R.

Unit tests:

- `TameIwahoriLevel.ofTorusSubgroup_top` (degenerate): ofTorusSubgroup ⊤ = Iw_v (ALS.0's LocallySymmetric.iwahori).
- `TameIwahoriLevel.ofTorusSubgroup_bot` (degenerate): ofTorusSubgroup ⊥ = Iw_{v,1} (ALS.0's LocallySymmetric.iwahoriOne).
- `TameIwahoriLevel.rank_one` (computation): For n = 1, ofTorusSubgroup A = {u ∈ O_{F_v}^× : u mod ϖ_v ∈ A}; for F_v = ℚ_5 there are exactly three tame Iwahori levels (#{divisors of 4}).
- `TameIwahoriLevel.not_iwahori_one_two` (non-example): For n = 2 the subgroup Iw_v(1, 2) (upper triangular modulo ϖ_v², unipotent modulo ϖ_v) is not a tame Iwahori level: it is properly contained in Iw_{v,1}.
- `TameIwahoriLevel.not_parahoric` (non-example): For n = 2, GL_2(O_{F_v}) contains Iw_v properly and is not a tame Iwahori level, although it is a parahoric subgroup.

Uses: ACC+ §2.2.5, p. 924 — the level at which Ξ_v, t, t_{v,i}(α), e_{v,i}(α) and P_{v,σ}(X) are defined; ACC+ §3.1, p. 954 — the hypothesis Iw_{v,1} ⊆ K_v ⊆ Iw_v at the places v ∈ R in Theorem 3.1.1; ACC+ §2.2.5, p. 930, and Theorem 2.4.8 — through ι_v, the unitary tame levels Ĩ_v̄ at places of R ∩ R^c; PotentialAutomorphyInfrastructure:PA.4/taylor-wiles-arithmetic-levels — the Taylor–Wiles levels K_1(Q)_v ⊂ K_0(Q)_v = Iw_v are tame Iwahori levels, at which the characters ψ_{v,i} of Proposition 6.5.11 are defined.

Acceptance:

- A = (k(v)^×)^n gives Iw_v and A = 1 gives Iw_{v,1}.
- For n = 1 the tame Iwahori levels are the subgroups of O_{F_v}^× containing 1 + ϖ_vO_{F_v}.

Direct prerequisites: `ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups`, `mathlib:Matrix.GeneralLinearGroup`, `mathlib:IsDiscreteValuationRing`, `mathlib:IsLocalRing.ResidueField`, `mathlib:Matrix.BlockTriangular`.

Sources: ACC23, §2.2.5, p. 922 (Iw_v(b, c), Iw_v = Iw_v(0, 1), Iw_{v,1} = Iw_v(1, 1)) and p. 924 (I_v with Iw_v(1, 1) ⊂ I_v ⊂ Iw_v(0, 1) has an Iwahori decomposition with respect to B_n) — ACC+ introduces the levels Iw_v(b, c), names the Iwahori and pro-ℓ Iwahori subgroups, and considers every open compact I_v between them, observing that Iw_v(0,1)/I_v is a quotient of (k(v)^×)^n and that I_v has an Iwahori decomposition. ACC23, §3.1, p. 954 — The levels allowed at the places of R in Theorem 3.1.1 are exactly the tame Iwahori levels.

### The tame torus quotient Ξ_v and its positive cone

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-torus-quotient` (construction).

For a tame Iwahori level I_v put Ξ_v = Ξ(I_v) = T_n(F_v)/T_{I_v} = (F_v^×)^n / ker((O_{F_v}^×)^n → (k(v)^×)^n → Iw_v/I_v). The valuation map gives an exact sequence 1 → T_n(O_{F_v})/T_{I_v} → Ξ_v → X_*(T_n) = ℤ^n → 0, where T_n(O_{F_v})/T_{I_v} ≅ (k(v)^×)^n/A(I_v), split by μ ↦ ϖ_v^μ = diag(ϖ_v^{μ_1}, …, ϖ_v^{μ_n}). An element of Ξ_v is positive if its valuation vector μ satisfies μ_1 ≥ μ_2 ≥ ⋯ ≥ μ_n; the positive elements form a submonoid Ξ_v^+, the image of the I_v-positive elements of T_n(F_v) in the sense of ACC+ §2.1.9 (t(I_v ∩ N_n)t^{−1} ⊆ I_v ∩ N_n and I_v ∩ N̄_n ⊆ t(I_v ∩ N̄_n)t^{−1}). The element z_v = diag(ϖ_v^{n−1}, …, ϖ_v, 1) is strongly positive, and for every x ∈ Ξ_v there is k ≥ 0 with z_v^k x ∈ Ξ_v^+.

Hypotheses and conventions: I_v a tame Iwahori level (IHR.1/tame-iwahori-level); ϖ_v a fixed uniformizer (the splitting depends on it; Ξ_v does not).

Construction or proof:

1. T_{I_v} is the kernel of T_n(O) → (k(v)^×)^n → (k(v)^×)^n/A(I_v), so the two descriptions of Ξ_v agree; the valuation T_n(F_v) → ℤ^n is surjective with kernel T_n(O_{F_v}), giving the exact sequence.
2. For t = diag(t_1, …, t_n), conjugation multiplies the (i, j) entry by t_i/t_j; for i < j this preserves N_n(O) iff v(t_i) ≥ v(t_j), and then t^{−1} N̄_n(ϖ_vO) t ⊆ N̄_n(ϖ_vO), so I_v-positivity is the condition μ_1 ≥ ⋯ ≥ μ_n, which is stable under products.
3. z_v scales the (i, j) entry of N_n by ϖ_v^{j−i}, so its powers contract every compact open subgroup of N_n(F_v) into any other and expand N̄_n; z_v^k ϖ_v^μ is positive once k ≥ max_i(μ_{i+1} − μ_i).

API:

- `TameTorus` (data): The abelian group Ξ_v = T_n(F_v)/T_{I_v} attached to a tame Iwahori level.
- `TameTorus.mk` (constructor): The quotient map T_n(F_v) → Ξ_v, written t ↦ [t].
- `TameTorus.valuation` (projection): Ξ_v → ℤ^n, [t] ↦ (v(t_1), …, v(t_n)).
- `TameTorus.exact` (characterisation): 1 → (k(v)^×)^n/A(I_v) → Ξ_v → ℤ^n → 0 is exact, and μ ↦ [ϖ_v^μ] splits it.
- `TameTorus.positive` (data): The submonoid Ξ_v^+ of classes with non-increasing valuation vector.
- `TameTorus.isPositive_iff` (characterisation): [t] ∈ Ξ_v^+ iff t is I_v-positive in the sense of ACC+ §2.1.9 (ALS.4's monoid Δ_M for M = T_n).
- `TameTorus.strongPos` (data): z_v = [diag(ϖ_v^{n−1}, …, ϖ_v, 1)], strongly positive, with ∀ x, ∃ k, z_v^k x ∈ Ξ_v^+.
- `TameTorus.map` (functoriality): For I_v ⊆ I'_v the surjection Ξ(I_v) → Ξ(I'_v), with map_id and map_comp, compatible with valuation and positivity.

Unit tests:

- `TameTorus.valuation_bijective_iwahori` (degenerate): For I_v = Iw_v, valuation : Ξ_v → ℤ^n is a group isomorphism.
- `TameTorus.rank_one` (computation): For n = 1, Ξ_v = F_v^×/I_v and Ξ_v^+ = Ξ_v.
- `TameTorus.torsion_iwahoriOne` (computation): For I_v = Iw_{v,1}, Ξ_v ≅ (F_v^×/(1 + ϖ_vO_{F_v}))^n, whose torsion subgroup is (k(v)^×)^n of order (q_v − 1)^n.
- `TameTorus.not_unramified_quotient` (non-example): If I_v ≠ Iw_v then Ξ_v is not (F_v^×)^n/(O_{F_v}^×)^n: its torsion subgroup (k(v)^×)^n/A(I_v) is nontrivial.
- `TameTorus.not_positive_antidominant` (non-example): For n = 2, [diag(1, ϖ_v)] ∉ Ξ_v^+ while [diag(ϖ_v, 1)] ∈ Ξ_v^+.

Uses: ACC+ §2.2.5, p. 925 — the domain O[Ξ_v] of the homomorphism t and the index set of the operators t_{v,i}(α); ACC+ Proposition 2.2.9(1) — the characters χ of (F_v^×)^n allowed in the tame principal series criterion are those factoring through Ξ_v; ACC+ Lemma 2.1.13 — the strongly positive element z_v whose double coset is inverted.

Acceptance:

- For I_v = Iw_v the valuation is an isomorphism Ξ_v ≅ ℤ^n.
- For n = 1, Ξ_v = F_v^×/I_v and every element is positive.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-iwahori-level`, `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`, `mathlib:Matrix.GeneralLinearGroup`.

Sources: ACC23, §2.2.5, p. 924 — Definition of Ξ_v as the quotient of (F_v^×)^n by the kernel of (O_{F_v}^×)^n → (k(v)^×)^n → Iw_v(0,1)/I_v. ACC23, §2.1.9, pp. 913–914 — Definition of U-positive elements Δ_M of a Levi subgroup and of strongly positive central elements; here M = T_n and U = I_v.

### Invertibility of tame double cosets

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-double-coset-invertible` (theorem).

Let I_v be a tame Iwahori level and R a commutative ring in which q_v is invertible. For every t ∈ T_n(F_v), the double coset operator [I_v t I_v] is a unit of H(GL_n(F_v), I_v) ⊗_ℤ R. Moreover, for I_v-positive t, t′ ∈ T_n(F_v), [I_v t I_v]·[I_v t′ I_v] = [I_v tt′ I_v] in H(GL_n(F_v), I_v).

Hypotheses and conventions: q_v ∈ R^× (over ℤ the statement fails: see acceptance); I_v a tame Iwahori level.

Construction or proof:

1. Bruhat decomposition at tame level: I_v\GL_n(F_v)/I_v is in bijection with N(T_n)(F_v)/T_{I_v}, an extension of the extended affine Weyl group ℤ^n ⋊ S_n by (k(v)^×)^n/A(I_v); write T(w) = [I_v w I_v] (Flicker §3 for I_v = Iw_{v,1}; the same argument for intermediate I_v since T_{I_v} ⊇ T_n(1 + ϖ_vO)).
2. Length additivity: T(w)T(w′) = T(ww′) when ℓ(ww′) = ℓ(w) + ℓ(w′), because #(I_v w I_v/I_v) = q_v^{ℓ(w)} depends only on the image of w in the extended affine Weyl group (Flicker Theorem 3.1(i)). For I_v-positive t, t′ the lengths add (Lemma 2.1.12 of ACC+, owned by SmoothRepresentationsOfLocalGroups SR.1), giving the product formula.
3. Quadratic relation at a simple affine reflection s: T(s)² = q_v T(s²) + Σ_{a ∈ k(v)^×} T(α^∨(a)s) with nonnegative integer structure constants (Flicker Theorem 3.1(ii) and Remark 4 at I_v = Iw_{v,1}); at an intermediate level the torus elements are read in T_n(O)/T_{I_v} and the coefficients are the corresponding multiplicities.
4. Hence T(s)·(T(s) − c_s) = q_v T(s²) with c_s ∈ ℤ[T_n(O)/T_{I_v}] and T(s²) of length zero, hence a unit; so T(s) is a unit of H ⊗ ℤ[1/q_v] (Flicker Proposition 3.3). Length-zero elements T(ρ), T(τ) are units, and every T(w) is a product of these and the T(s) (Flicker Corollary 3.4).
5. An element t ∈ T_n(F_v) is an element of the extended affine Weyl group, and [I_v t I_v] = T(t) is therefore a unit of H ⊗ R.

Acceptance:

- n = 1: H(F_v^×, I_v) = ℤ[F_v^×/I_v] and [I_v t I_v]^{−1} = [I_v t^{−1} I_v].
- n = 2, I_v = Iw_v: the Iwahori–Matsumoto generator satisfies T_s^{−1} = q_v^{−1}(T_s − (q_v − 1)), and t = diag(ϖ_v, 1) = sτ with τ = (0 1; ϖ_v 0) of length zero gives [Iw_v t Iw_v] = T(s)T(τ), a unit.
- Over ℤ the hypothesis is needed: the degree character H(GL_2(F_v), Iw_v) → ℤ, T(w) ↦ #(Iw_v w Iw_v/Iw_v), sends [Iw_v diag(ϖ_v, 1) Iw_v] to q_v, which is not a unit of ℤ.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-iwahori-level`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-torus-quotient`, `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants`, `SmoothRepresentationsOfLocalGroups:SR.1`, `mathlib:IsHeckeTriple`, `mathlib:HeckeRing`, `tauceti:HeckeCosetModule.instRingHeckeRing`.

Sources: ACC23, §2.2.5, p. 924 — ACC+ asserts that [I_v g I_v] is invertible in H(GL_n(F_v), I_v) ⊗ O for every g ∈ Ξ_v, citing [Fli11, Cor. 3.4] and using that q_v is a unit in O. Fli11, Theorem 3.1, Corollary 3.2, Proposition 3.3 and Corollary 3.4, pp. 475–479 — Flicker presents the complex tame algebra C_c(I_t\G/I_t) (I_t the pro-p Iwahori, here Iw_{v,1}) by length-additivity and quadratic relations with integer structure constants, gives an explicit inverse of T(s_i) with denominator a power of q, and deduces that every T(w) is invertible.

### The tame torus embedding t : O[Ξ_v] → H(GL_n(F_v), I_v) ⊗ O

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-torus-embedding` (construction).

Let I_v be a tame Iwahori level and R a commutative ring with q_v ∈ R^×. There is a unique ring homomorphism t = t_{I_v} : R[Ξ_v] → H(GL_n(F_v), I_v) ⊗_ℤ R with t([g]) = [I_v g I_v] for every I_v-positive g ∈ T_n(F_v). It is injective, its image is a commutative subring, and t([g]) is a unit for every [g] ∈ Ξ_v. (ACC+ writes the domain as Ξ_v; the homomorphism is defined on the group algebra.)

Hypotheses and conventions: q_v ∈ R^×; I_v a tame Iwahori level.

Construction or proof:

1. For M = T_n and U_M = T_{I_v}, the positive-monoid Hecke algebra H(Δ_M, U_M) is the monoid ring ℤ[Ξ_v^+] (T_n is abelian, so double cosets are cosets), and Lemma 2.1.12 of ACC+ (Bushnell–Kutzko, owned by SmoothRepresentationsOfLocalGroups SR.1) says that [U_M m U_M] ↦ [I_v m I_v] is a ring homomorphism ℤ[Ξ_v^+] → H(GL_n(F_v), I_v).
2. z_v is strongly positive (IHR.1/tame-torus-quotient) and [I_v z_v I_v] is a unit of H ⊗ R (IHR.1/tame-double-coset-invertible), so Lemma 2.1.13 (SR.1) extends the homomorphism uniquely from R[Ξ_v^+] to R[Ξ_v^+][[z_v]^{−1}] = R[Ξ_v].
3. Injectivity: distinct positive classes give distinct double cosets, hence linearly independent basis elements of H ⊗ R; every element of R[Ξ_v] is [z_v]^{−k}y with y ∈ R[Ξ_v^+], and t([z_v]) is a unit, so t(x) = 0 forces t(y) = 0 and y = 0.
4. The image of the commutative ring R[Ξ_v] is commutative.

API:

- `tameEmbedding` (constructor): t : R[Ξ_v] →+* H(GL_n(F_v), I_v) ⊗ R for q_v ∈ R^×.
- `tameEmbedding_of_isPositive` (simp): t([g]) = [I_v g I_v] for [g] ∈ Ξ_v^+.
- `tameEmbedding_injective` (characterisation): t is injective.
- `tameEmbedding_commute` (structure): t(x) t(y) = t(y) t(x) for all x, y.
- `tameEmbedding_isUnit` (simp): t([g]) is a unit and t([g]^{−1}) = t([g])^{−1}.
- `tameEmbedding_map` (functoriality): For a ring map R → R′ (q_v invertible in both), t commutes with the induced maps on group algebras and Hecke algebras.
- `tameEmbedding_restrict_level` (functoriality): For tame levels I_v ⊆ I'_v and a smooth R[GL_n(F_v)]-module M, the inclusion M^{I'_v} ⊆ M^{I_v} intertwines t_{I'_v}(x̄) with the action of t_{I_v}(x) for x ∈ R[Ξ(I_v)] mapping to x̄ (same coset representatives for positive classes).
- `tameEmbedding_satake` (compatibility): 𝒮 ∘ t = multiplication by the character |δ_{B_n}|^{−1} on R[Ξ_v], where 𝒮 = r_M ∘ r_P is ALS.4's unnormalized Satake map for P = B_n (ACC+ §2.1.9: 𝒮 ∘ t([U_MmU_M]) = |δ_P(m)|^{−1}[U_MmU_M]).
- `tameEmbedding_degree` (relation): deg ∘ t([g]) = |δ_{B_n}(g)|_v^{−1}, where deg : H ⊗ R → R is the degree character [UgU] ↦ #(UgU/U).

Unit tests:

- `tameEmbedding_rank_one` (computation): For n = 1, tameEmbedding is the identity map of R[F_v^×/I_v].
- `tameEmbedding_iwahori` (compatibility): For I_v = Iw_v and dominant μ, t([ϖ_v^μ]) = [Iw_v ϖ_v^μ Iw_v], the unnormalized Bernstein element (Bernstein's normalized θ_μ is q_v^{−⟨ρ, μ⟩} t([ϖ_v^μ])).
- `tameEmbedding_degree_antidominant` (non-example): For n = 2, deg t([diag(1, ϖ_v)]) = q_v^{−1} while deg [Iw_v diag(1, ϖ_v) Iw_v] = q_v, so t([diag(1, ϖ_v)]) ≠ [Iw_v diag(1, ϖ_v) Iw_v]: t agrees with double cosets only on positive classes.
- `tameEmbedding_center` (computation): t([ϖ_v·1_n]) = [I_v ϖ_v 1_n I_v], the central translation, of degree 1.

Uses: ACC+ §2.2.5, p. 925 — defines t_{v,i}(α), e_{v,i}(α) and P_{v,σ}(X); ACC+ Lemma 2.2.10 and (2.2.11) — the GL_n operators transported to the Siegel level are images under t; ACC+ proof of Theorem 2.4.8, pp. 947–948 — the localization at strongly positive elements that lets 𝒮 descend at the places of R; PotentialAutomorphyInfrastructure:PA.4/diamond-linear-deformation-hecke-map — Proposition 6.5.11 defines characters ψ_{v,i}(Art_{F_v}(α)) = t_{v,i}(α) at Taylor–Wiles places.

Acceptance:

- For n = 1, t is the identity of R[F_v^×/I_v] = H(F_v^×, I_v) ⊗ R.
- For I_v = Iw_v, t is the unnormalized Bernstein embedding R[ℤ^n] → H(GL_n(F_v), Iw_v) ⊗ R.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-torus-quotient`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-double-coset-invertible`, `SmoothRepresentationsOfLocalGroups:SR.1`, `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`, `mathlib:MonoidAlgebra`, `tauceti:HeckeCosetModule.instRingHeckeRing`.

Sources: ACC23, §2.2.5, pp. 924–925 — Lemma 2.1.13 gives an injective O-algebra homomorphism t from (the group algebra of) Ξ_v to H(GL_n(F_v), I_v) ⊗ O sending positive g to [I_v g I_v]. ACC23, §2.1.9, Lemmas 2.1.12–2.1.13, pp. 914–915 — The map t on positive-monoid Hecke algebras is an algebra homomorphism, and it extends uniquely after inverting a strongly positive element whose double coset is invertible.

### The ramified Hecke operators t_{v,i}(α), e_{v,i}(α) and the characters ψ_{v,i}

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-hecke-operators` (construction).

Let O be a commutative ring with q_v ∈ O^× and I_v a tame Iwahori level. For α ∈ F_v^× and 1 ≤ i ≤ n let e_i(α) = (1, …, 1, α, 1, …, 1) ∈ T_n(F_v) (α in position i) and λ = v(α)ε_i ∈ X_*(T_n). Put t_{v,i}(α) = t(q_v^{−⟨λ, ρ + ((1−n)/2)det⟩}[e_i(α)]) = q_v^{(i−1)v(α)} t([e_i(α)]) ∈ H(GL_n(F_v), I_v) ⊗ O, ρ being the half-sum of the positive roots of B_n, and let e_{v,i}(α) be the i-th elementary symmetric polynomial in t_{v,1}(α), …, t_{v,n}(α) (e_{v,0} = 1). For σ ∈ W_{F_v} put t_{v,i}(σ) = t_{v,i}(α) and e_{v,i}(σ) = e_{v,i}(α), where Art_{F_v}(α) = σ|_{F_v^{ab}} and Art_{F_v} sends uniformizers to geometric Frobenius elements. Then α ↦ t_{v,i}(α) is a group homomorphism F_v^× → (H(GL_n(F_v), I_v) ⊗ O)^×, so ψ_{v,i} : W_{F_v} → (H(GL_n(F_v), I_v) ⊗ O)^×, σ ↦ t_{v,i}(σ), is a character; all t_{v,i}(σ) commute; and e_{v,n}(α) = q_v^{n(n−1)v(α)/2}[I_v α·1_n I_v] is a unit.

Hypotheses and conventions: q_v ∈ O^×; Art_{F_v} normalized to send uniformizers to geometric Frobenius elements (ACC+ §1.2).

Construction or proof:

1. ⟨ε_i, ρ⟩ = (n + 1 − 2i)/2 and ⟨ε_i, ((1−n)/2)det⟩ = (1 − n)/2, so the exponent −⟨λ, ρ + ((1−n)/2)det⟩ equals (i − 1)v(α).
2. α ↦ [e_i(α)] is a homomorphism F_v^× → Ξ_v and v is additive, so α ↦ q_v^{(i−1)v(α)}[e_i(α)] is a homomorphism into (O[Ξ_v])^×; composing with the ring homomorphism t (IHR.1/tame-torus-embedding) gives units, which commute because the image of t is commutative.
3. W_{F_v} → W_{F_v}^{ab} ≅ F_v^× through Art_{F_v}^{−1} is a continuous homomorphism (Tau Ceti ClassFieldTheory layers 7 and 9), so ψ_{v,i} is a character of W_{F_v}.
4. ∏_i q_v^{(i−1)v(α)}[e_i(α)] = q_v^{n(n−1)v(α)/2}[α·1_n], and α·1_n is central and I_v-positive, so e_{v,n}(α) = q_v^{n(n−1)v(α)/2}[I_v α1_n I_v], a unit.

API:

- `tameOperator` (constructor): t_{v,i}(α) ∈ H(GL_n(F_v), I_v) ⊗ O for α ∈ F_v^×, 1 ≤ i ≤ n.
- `tameOperator_mul` (simp): t_{v,i}(αβ) = t_{v,i}(α)t_{v,i}(β) and t_{v,i}(1) = 1.
- `tameOperator_eq_bernstein` (relation): After adjoining q_v^{1/2}, t_{v,i}(α) = q_v^{(n−1)v(α)/2} θ_{e_i(α)}, where θ_x = q_v^{−⟨ρ, ν(x)⟩}t(x) is Bernstein's ρ-normalized embedding; the factor does not depend on i.
- `tameOperator_units` (simp): For u ∈ O_{F_v}^×, t_{v,i}(u) = [I_v e_i(u) I_v], the diamond operator of e_i(u) mod ϖ_v in (k(v)^×)^n/A(I_v).
- `tameOperator_uniformizer` (simp): t_{v,i}(ϖ_v) = q_v^{i−1}t([e_i(ϖ_v)]); in particular t_{v,1}(ϖ_v) = [I_v diag(ϖ_v, 1, …, 1) I_v].
- `weilCharacter` (constructor): ψ_{v,i} : W_{F_v} →* (H(GL_n(F_v), I_v) ⊗ O)^×, σ ↦ t_{v,i}(Art_{F_v}^{−1}(σ|_{F_v^{ab}})).
- `weilCharacter_inertia` (characterisation): ψ_{v,i} is trivial on wild inertia, factors on I_{F_v} through O_{F_v}^× → k(v)^× → (k(v)^×)^n/A(I_v) (the i-th coordinate), and is trivial on I_{F_v} when I_v = Iw_v.
- `tameElemSymm` (data): e_{v,i}(σ), the i-th elementary symmetric polynomial in t_{v,1}(σ), …, t_{v,n}(σ), with e_{v,0}(σ) = 1.
- `tameElemSymm_top` (simp): e_{v,n}(α) = q_v^{n(n−1)v(α)/2}[I_v α·1_n I_v], a unit.
- `tameOperator_restrict_level` (functoriality): For tame levels I_v ⊆ I'_v, restriction of invariants intertwines t^{I_v}_{v,i}(α) with t^{I'_v}_{v,i}(α) on I'_v-invariants of any smooth module.
- `tameOperator_twist` (relation): For a character χ : F_v^× → O^× trivial on det(I_v), the automorphism f_χ(f)(g) = χ(det g)^{−1}f(g) of H(GL_n(F_v), I_v) ⊗ O sends t_{v,i}(α) to χ(α)^{−1}t_{v,i}(α).

Unit tests:

- `tameOperator_rank_one` (computation): For n = 1, t_{v,1}(α) = [I_v α I_v], the translation by the class of α in F_v^×/I_v.
- `tameOperator_iwahori_inertia` (degenerate): For I_v = Iw_v and u ∈ O_{F_v}^×, t_{v,i}(u) = 1, hence e_{v,i}(u) = binom(n, i).
- `tameOperator_rank_two` (computation): For n = 2: t_{v,1}(ϖ_v) = [I_v diag(ϖ_v, 1) I_v], t_{v,2}(ϖ_v) = q_v[I_v ϖ_v1_2 I_v]·[I_v diag(ϖ_v, 1) I_v]^{−1}, and e_{v,2}(ϖ_v) = q_v[I_v ϖ_v1_2 I_v].
- `tameOperator_unnormalized_wrong` (non-example): Without the factor q_v^{(i−1)v(α)}, the product ∏_i t([e_i(ϖ_v)]) for n = 2 equals [I_v ϖ_v1_2 I_v] ≠ e_{v,2}(ϖ_v) = q_v[I_v ϖ_v1_2 I_v]; the unnormalized polynomial does not match the determinant q_v ω_π(ϖ_v) of Frobenius on rec^T(π_v).
- `tameOperator_central_character` (computation): On a smooth representation with central character ω, e_{v,n}(α) acts by q_v^{n(n−1)v(α)/2}ω(α).

Uses: ACC+ (2.2.8), p. 925 — the roots of the ramified Hecke polynomial P_{v,σ}(X); ACC+ (2.2.11), p. 926 — transported to the Siegel level after twisting by ‖σ‖_v^{−n}; ACC+ Theorem 2.4.8 and §3.1 — generators, with the spherical operators, of T^T_R and T̃^T_R; PotentialAutomorphyInfrastructure:PA.4/diamond-linear-deformation-hecke-map — the characters ψ_{v,i}, residually distinct at Taylor–Wiles places, give ρ|_{W_{F_v}} ≅ ⊕ψ_{v,i} and O[Δ_Q]-linearity.

Acceptance:

- For n = 1, t_{v,1}(α) = [I_v α I_v].
- For I_v = Iw_v and u ∈ O_{F_v}^×, t_{v,i}(u) = 1.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-torus-embedding`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `mathlib:Multiset.esymm`.

Sources: ACC23, §2.2.5, p. 925 — Definition of t_{v,i}(α) as the image under t of q_v^{−⟨λ, ρ+(1−n)/2·det⟩} times the element with α in position i, of e_{v,i}(α) as the coefficient of (−1)^iX^{n−i} in ∏(X − t_{v,i}(α)), and of t_{v,i}(σ), e_{v,i}(σ) through Art_{F_v}. ACC23, §1.2, p. 906 — Art_K is normalized to send uniformizers to geometric Frobenius elements; W_K is the Weil group. ACC23, §6.5, p. 1067 — In the proof of Proposition 6.5.11 the characters ψ_{v,i} : W_{F_v} → (T′)^× with ψ_{v,i}(Art_{F_v}(α)) = t_{v,i}(α) are used.

### The ramified Hecke polynomial P_{v,σ}(X) (2.2.8)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/ramified-hecke-polynomial` (construction).

For σ ∈ W_{F_v} with Art_{F_v}(α) = σ|_{F_v^{ab}}, let P^{univ}_{v,σ}(X) = ∏_{i=1}^{n}(X − q_v^{(i−1)v(α)}[e_i(α)]) ∈ O[Ξ_v][X] and P_{v,σ}(X) = t(P^{univ}_{v,σ}(X)) = ∏_{i=1}^{n}(X − t_{v,i}(σ)) = Σ_{i=0}^{n}(−1)^i e_{v,i}(σ)X^{n−i} ∈ (H(GL_n(F_v), I_v) ⊗ O)[X]. It is monic of degree n, its coefficients lie in the commutative subring t(O[Ξ_v]) and are central in H(GL_n(F_v), I_v) ⊗ O (IHR.2/tame-hecke-centre), and its constant term (−1)^ne_{v,n}(σ) is a unit.

Hypotheses and conventions: q_v ∈ O^×; I_v a tame Iwahori level.

Construction or proof:

1. Apply the ring homomorphism t coefficientwise to the monic polynomial P^{univ}_{v,σ} over the commutative ring O[Ξ_v].
2. Vieta's formula (Mathlib Multiset.prod_X_sub_X_eq_sum_esymm) identifies the coefficients with (−1)^ie_{v,i}(σ).

API:

- `ramifiedHeckePolyUniv` (constructor): P^{univ}_{v,σ}(X) ∈ O[Ξ_v][X].
- `ramifiedHeckePoly` (constructor): P_{v,σ}(X) = (P^{univ}_{v,σ}).map t.
- `ramifiedHeckePoly_monic` (simp): P_{v,σ} is monic of natural degree n.
- `ramifiedHeckePoly_coeff` (characterisation): The coefficient of X^{n−i} is (−1)^ie_{v,i}(σ).
- `ramifiedHeckePoly_eq_prod` (characterisation): P_{v,σ}(X) = ∏_{i=1}^{n}(X − ψ_{v,i}(σ)).
- `ramifiedHeckePoly_coeff_zero_isUnit` (simp): The constant term (−1)^ne_{v,n}(σ) is a unit.
- `ramifiedHeckePoly_restrict_level` (functoriality): Change of tame level I_v ⊆ I'_v maps P^{I_v}_{v,σ} to P^{I'_v}_{v,σ} under restriction of invariants.
- `ramifiedHeckePoly_twist` (relation): For χ as in tameOperator_twist, f_χ(P_{v,σ})(X) = χ(σ)^{−n}P_{v,σ}(χ(σ)X), χ(σ) := χ(Art_{F_v}^{−1}(σ)).
- `ramifiedHeckePoly_map` (functoriality): For a ring map O → O′ (q_v invertible), the images agree.

Unit tests:

- `ramifiedHeckePoly_rank_one` (computation): For n = 1, P_{v,σ}(X) = X − [I_v α I_v] with Art_{F_v}(α) = σ|_{F_v^{ab}}.
- `ramifiedHeckePoly_iwahori_inertia` (degenerate): For I_v = Iw_v and σ ∈ I_{F_v}, P_{v,σ}(X) = (X − 1)^n.
- `ramifiedHeckePoly_steinberg` (computation): For n = 2, I_v = Iw_v and φ a geometric Frobenius lift, P_{v,φ}(X) acts on the line St_2^{Iw_v} by (X − 1)(X − q_v) (IHR.2/tame-local-langlands-charpoly with rec^T(St_2) = Sp_2).
- `ramifiedHeckePoly_spherical` (compatibility): For π_v unramified and I_v = Iw_v, P_{v,φ}(X) acts on π_v^{Iw_v} through the scalar polynomial by which IHG.3's P_v(X) acts on π_v^{GL_n(O_{F_v})} (IHR.2/spherical-specialization).
- `ramifiedHeckePoly_depends_on_inertia` (non-example): P_{v,σ} is not a function of σ modulo inertia: for n = 1, I_v = Iw_{v,1} and τ ∈ I_{F_v} with Art^{−1}(τ) ≡ u mod ϖ_v, u ≠ 1 in k(v)^×, P_{v,τ}(X) = X − ⟨u⟩ ≠ X − 1.

Uses: ACC+ Theorem 3.1.1(2) and Proposition 3.1.2(2), p. 954 — the characteristic polynomial of σ ∈ W_{F_v} under ρ_{𝔪,R} is the image of P_{v,σ}(X); ACC+ Proposition 2.2.9(3), p. 925 — its scalar specializations are characteristic polynomials of rec^T(π_v); ACC+ (2.2.11) and the resultant Res_v, pp. 926–928 — transported to the Siegel level and combined with P_{v^c,σ^{−c}}; PotentialAutomorphyInfrastructure:PA.3/fontaine-laffaille-deformation-hecke-map — the inertial characteristic-polynomial condition at v ∈ R = S − S_p in Proposition 6.5.3.

Acceptance:

- For n = 1, P_{v,σ}(X) = X − [I_v α I_v].
- For I_v = Iw_v and σ ∈ I_{F_v}, P_{v,σ}(X) = (X − 1)^n.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-hecke-operators`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-torus-embedding`, `mathlib:Multiset.prod_X_sub_X_eq_sum_esymm`, `mathlib:Polynomial.Monic`.

Sources: ACC23, §2.2.5, eq. (2.2.8), p. 925 — P_{v,σ}(X) is defined as the product of the X − t_{v,i}(σ), equal to the alternating sum of the e_{v,i}(σ)X^{n−i}, with coefficients in H(GL_n(F_v), I_v) ⊗ O. ACC23, §3.1, Theorem 3.1.1(2), p. 954 — The ramified local condition of the main theorem is stated through the images of the P_{v,σ}(X).

**Acceptance tests of the layer.** A = (k(v)^×)^n gives Iw_v and A = 1 gives Iw_{v,1}. For I_v = Iw_v the valuation is an isomorphism Ξ_v ≅ ℤ^n. n = 1: H(F_v^×, I_v) = ℤ[F_v^×/I_v] and [I_v t I_v]^{−1} = [I_v t^{−1} I_v]. For n = 1, t is the identity of R[F_v^×/I_v] = H(F_v^×, I_v) ⊗ R. For n = 1, t_{v,1}(α) = [I_v α I_v]. For n = 1, P_{v,σ}(X) = X − [I_v α I_v].

## IHR.2 — Tame Iwahori invariants and the local Langlands correspondence

Coefficients are Q̄_p, with p ≠ ℓ; rec^T_{F_v} is the arithmetic normalization rec_{F_v}(π ⊗ |det|^{(1−n)/2}) of the local Langlands correspondence of EndoscopicTransferAndUnitaryTraceComparison ET.6, valued in Frobenius-semisimple Weil–Deligne representations (ArithmeticGaloisRepresentations R01.2).

**Targets** (ACC+ Proposition 2.2.9, proved from Flicker's tame algebra).
- *Tame principal series criterion.* For an irreducible admissible Q̄_p[GL_n(F_v)]-module π_v, π_v^{I_v} ≠ 0 if and only if π_v is a subquotient of Ind_{B_n}^{GL_n} χ for a smooth character χ of (F_v^×)^n factoring through Ξ_v.
- *Centrality.* Each e_{v,i}(α) lies in the centre of H(GL_n(F_v), I_v) ⊗ O, so acts on π_v^{I_v} ≠ 0 by a scalar e_{v,i}(α, π_v) ∈ Q̄_p.
- *Characteristic polynomial identity.* If π_v^{I_v} ≠ 0 and (r_v, N_v) = rec^T_{F_v}(π_v), then for every σ ∈ W_{F_v} the characteristic polynomial of r_v(σ) is Σ_{i=0}^{n}(−1)^i e_{v,i}(Art_{F_v}^{−1}(σ), π_v) X^{n−i}.
- *Comparison with the parent roadmap.* For unramified π_v and I_v = Iw_v, e_{v,i}(Frob_v) acts on π_v^{Iw_v} by the scalar by which q_v^{i(i−1)/2}T_{v,i} acts on π_v^{GL_n(O_{F_v})}, so P_{v,Frob_v} specializes to the spherical polynomial P_v of IntegralHeckeAndGaloisDeterminants IHG.3.

Acceptance: n = 1 against local class field theory; the Steinberg representation of GL_2 (P_{v,φ} acts by (X − 1)(X − q_v) for a geometric Frobenius lift φ); unramified principal series of GL_2.

**Dependencies.** Within this roadmap: IntegralHeckeAndGaloisDeterminantsPartII:IHR.1. Other roadmaps: IntegralHeckeAndGaloisDeterminants:IHG.3, IntegralHeckeAndGaloisDeterminants:IHG.2, EndoscopicTransferAndUnitaryTraceComparison:ET.6, ArithmeticGaloisRepresentations:R01.2, SmoothRepresentationsOfLocalGroups:SR.1, SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3, AutomorphicGaloisRepresentationsPartII:AG2.0.

**Planets.** Centre of the tame Hecke algebra (`IHR.2/tame-hecke-centre`); Ramified Hecke polynomial and rec^T (`IHR.2/tame-local-langlands-charpoly`).

### Tame principal series criterion (Proposition 2.2.9(1))

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.2/tame-principal-series-criterion` (theorem).

Let I_v be a tame Iwahori level, ℓ ≠ p, and π_v an irreducible admissible Q̄_p[GL_n(F_v)]-module. Then π_v^{I_v} ≠ 0 if and only if π_v is isomorphic to an irreducible subquotient of Ind_{B_n(F_v)}^{GL_n(F_v)} χ for a smooth character χ = χ_1 ⊗ ⋯ ⊗ χ_n of (F_v^×)^n factoring through (F_v^×)^n → Ξ_v.

Hypotheses and conventions: coefficients Q̄_p, abstractly isomorphic to ℂ; Ind is unnormalized induction (the normalized one differs by the unramified character δ^{1/2}, which also factors through Ξ_v).

Construction or proof:

1. Fix ι : Q̄_p ≅ ℂ. The finite abelian group Iw_v/Iw_{v,1} ≅ (k(v)^×)^n acts semisimply on π_v^{Iw_{v,1}}, so π_v^{I_v} = ⊕_χ π_v^{Iw_{v,1}, χ}, the sum over characters χ of (k(v)^×)^n trivial on A(I_v).
2. Flicker Theorem 2.1: π_v^{Iw_{v,1}, χ} ≠ 0 iff π_v embeds in the normalized induction of a character χ_A of T_n(F_v) restricting to χ on T_n(O_{F_v}).
3. Flicker Corollary 3.4 and relation (iii) of Corollary 3.2: for w ∈ S_n the invertible operator T(w) maps π_v^{Iw_{v,1}, χ} isomorphically onto π_v^{Iw_{v,1}, wχ}.
4. (⇒) A nonzero I_v-fixed vector lies in some π_v^{Iw_{v,1}, χ} with χ trivial on A(I_v); then π_v embeds in an induced representation from a character factoring through Ξ_v.
5. (⇐) An irreducible subquotient of Ind χ embeds in Ind(w χ ⊗ η) for some w ∈ S_n and unramified η (SmoothRepresentationsOfLocalGroups SR.3, supercuspidal support), so π_v^{Iw_{v,1}, wχ|_{T(O)}} ≠ 0, hence π_v^{Iw_{v,1}, χ|_{T(O)}} ≠ 0 by the previous step, and this space lies in π_v^{I_v} because χ|_{T(O)} is trivial on T_{I_v}.

Acceptance:

- n = 1: a character is I_v-fixed iff it is trivial on I_v.
- The Steinberg representation St_2 and every unramified principal series of GL_2 have nonzero Iw_v-invariants; a supercuspidal representation has π^{Iw_{v,1}} = 0.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-iwahori-level`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-torus-quotient`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-double-coset-invertible`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`.

Sources: ACC23, §2.2.5, Proposition 2.2.9(1) and its proof, p. 925 — π_v^{I_v} is nonzero iff π_v is a subquotient of a principal series from a character factoring through Ξ_v; the proof cites [Fli11, Th. 2.1]. Fli11, §2, Theorem 2.1 and Corollary 2.2, pp. 471–472; Corollary 3.4, p. 479 — π^{I,χ} ≠ 0 iff π embeds in I(χ_A) for some χ_A extending χ; the invertibility of the T(w) completes the proof.

### The elementary symmetric operators are central (Proposition 2.2.9(2))

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.2/tame-hecke-centre` (theorem).

For every tame Iwahori level I_v, α ∈ F_v^× and 0 ≤ i ≤ n, e_{v,i}(α) lies in the centre of H(GL_n(F_v), I_v) ⊗ O. Consequently, if π_v is an irreducible admissible Q̄_p[GL_n(F_v)]-module with π_v^{I_v} ≠ 0, each e_{v,i}(α) acts on π_v^{I_v} by a scalar e_{v,i}(α, π_v) ∈ Q̄_p, and e_{v,n}(α, π_v) ∈ Q̄_p^×. (ACC+ prints the scalar in Q̄_p^× for every i; for 0 < i < n it can vanish, see the sourceIssues.)

Hypotheses and conventions: q_v ∈ O^×; O ⊂ Q̄_p a subring.

Construction or proof:

1. At I_v = Iw_{v,1} with complex coefficients, Flicker's Bernstein presentation (Theorem 4.5) and Proposition 4.11 identify the centre with R_t^{W_f}, R_t = ℂ[T_n(F_v)/T_n(1+ϖ_vO)] embedded by the ρ-normalized θ.
2. By tameOperator_eq_bernstein, t_{v,i}(α) = q_v^{(n−1)v(α)/2}θ_{e_i(α)} with a factor independent of i, so e_{v,i}(α) is q_v^{i(n−1)v(α)/2} times the i-th elementary symmetric function of θ_{e_1(α)}, …, θ_{e_n(α)}, which is S_n-invariant, hence central.
3. For an intermediate level, after extending scalars to Q̄_p, H(GL_n(F_v), I_v) ⊗ Q̄_p ≅ e H(GL_n(F_v), Iw_{v,1}) ⊗ Q̄_p e with e the idempotent averaging over I_v/Iw_{v,1}, and t_{I_v}([x]) = e t_{Iw_{v,1}}([x]) e (same coset representatives); hence e^{I_v}_{v,i}(α) = e·e^{Iw_{v,1}}_{v,i}(α) is central.
4. Commutation identities between O-valued Hecke functions hold if they hold after extending scalars to Q̄_p, since H ⊗ O is O-torsion-free; so e_{v,i}(α) is central in H ⊗ O.
5. π_v^{I_v} is a finite-dimensional simple H(GL_n(F_v), I_v) ⊗ Q̄_p-module (admissibility, SmoothRepresentationsOfLocalGroups SR.3, and the e_U-corner correspondence of SR.1), so central elements act by scalars; e_{v,n}(α) is a unit, so its scalar is nonzero.

Acceptance:

- For n = 2, an unramified principal series with Frobenius eigenvalues a and −a on rec^T has e_{v,1}(ϖ_v, π_v) = 0.
- For n = 1, e_{v,1}(α) = [I_v α I_v] is central in the commutative ring ℤ[F_v^×/I_v].

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-hecke-operators`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-torus-embedding`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-double-coset-invertible`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.3`.

Sources: ACC23, §2.2.5, Proposition 2.2.9(2) and its proof, p. 925 — Each e_{v,i}(α) acts on π_v^{I_v} by a scalar because the e_{v,i}(α) lie in the centre, by the explicit description of the centre in [Fli11, Prop. 4.11]. Fli11, §4, Theorem 4.5, pp. 482–483, and Proposition 4.11, p. 487 — Bernstein-type presentation of the complex tame algebra and its centre R_t^{W_{f,t}}.

### Ramified Hecke polynomials compute rec^T (Proposition 2.2.9(3))

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.2/tame-local-langlands-charpoly` (theorem).

Let I_v be a tame Iwahori level, ℓ ≠ p, π_v an irreducible admissible Q̄_p[GL_n(F_v)]-module with π_v^{I_v} ≠ 0 and (r_v, N_v) = rec^T_{F_v}(π_v) = rec_{F_v}(π_v ⊗ |det|^{(1−n)/2}). Then for every σ ∈ W_{F_v}, with α = Art_{F_v}^{−1}(σ|_{F_v^{ab}}), the characteristic polynomial of r_v(σ) is Σ_{i=0}^{n}(−1)^i e_{v,i}(α, π_v)X^{n−i}; that is, P_{v,σ}(X) acts on π_v^{I_v} through the scalar polynomial det(X − r_v(σ)).

Hypotheses and conventions: rec^T is the arithmetic normalization of the local Langlands correspondence of EndoscopicTransferAndUnitaryTraceComparison ET.6, valued in Frobenius-semisimple Weil–Deligne representations; Art_{F_v} sends uniformizers to geometric Frobenius elements.

Construction or proof:

1. By IHR.2/tame-principal-series-criterion, π_v is a subquotient of Π_x = n-Ind(χ ⊗ χ_x) with χ factoring through Ξ_v and χ_x unramified; consider the universal unramified twist over R_u = Q̄_p[T_n(F_v)/T_n(O_{F_v})], whose I_v-invariants are finite free over R_u with fibres Π_x^{I_v}.
2. Jacquet's lemma in the Bushnell–Kutzko form (SmoothRepresentationsOfLocalGroups SR.2): q : Π_x^{I_v} → r_B(Π_x)^{T_{I_v}} is an isomorphism with h·q(y) = δ_B^{1/2}(g)q(t(h)y) for h = [T_{I_v}gT_{I_v}]. For x in a Zariski-dense set, r_B(Π_x) is the direct sum of the characters w(χ⊗χ_x), w ∈ S_n.
3. On the w-summand t([e_j(α)]) acts by δ_B^{−1/2}(e_j(α))·(w(χχ_x))_j(α) = |α|^{−(n+1−2j)/2}(w(χχ_x))_j(α), so t_{v,j}(α) acts by |α|^{(1−n)/2}(w(χχ_x))_j(α) and e_{v,i}(α) by the i-th elementary symmetric function of the |α|^{(1−n)/2}(χχ_x)_j(α), independently of w.
4. rec_{F_v} of the irreducible Π_x is ⊕_j (χχ_x)_j ∘ Art^{−1} with N = 0, so rec^T(Π_x)(σ) has eigenvalues |α|^{(1−n)/2}(χχ_x)_j(α): the identity holds on a Zariski-dense set of x.
5. The scalar identities are polynomial in x, so they hold on all of Π_u^{I_v} and at every x; π_v^{I_v} is a subquotient of Π_x^{I_v} (exactness of invariants in characteristic zero), and r_v^{ss}|_{W_{F_v}} = rec^T(Π_x)|_{W_{F_v}} (compatibility of rec with supercuspidal support, ET.6), so the characteristic polynomials agree.

Acceptance:

- n = 1: for a character χ trivial on I_v, P_{v,σ}(X) acts by X − χ(α), the characteristic polynomial of χ ∘ Art^{−1}(σ) (local class field theory).
- n = 2, I_v = Iw_v, π_v = St_2: rec^T(St_2) = Sp_2 with Frobenius eigenvalues 1 and q_v on e_1, e_2, and P_{v,φ}(X) acts by (X − 1)(X − q_v).
- n = 2, π_v = n-Ind(χ_1 ⊗ χ_2) unramified: P_{v,φ}(X) acts by (X − q_v^{1/2}χ_1(ϖ_v))(X − q_v^{1/2}χ_2(ϖ_v)).

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.2/tame-principal-series-criterion`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.2/tame-hecke-centre`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/ramified-hecke-polynomial`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-hecke-operators`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

Sources: ACC23, §2.2.5, Proposition 2.2.9(3) and its proof, p. 925 — For π_v with nonzero I_v-invariants, the characteristic polynomial of r_v(σ) is the alternating sum of the scalars e_{v,i}(α, π_v); the proof uses [Fli11, §4]. ACC23, §2.2.5, proof of Lemma 2.2.13, pp. 927–928 — The same universal-unramified-twist, Jacquet-module and density argument, written out for the Siegel level; the present node specializes it to P = B_n. ACC23, §1.2, p. 906 — rec^T is the arithmetic normalization of the local Langlands correspondence [CT14, §2.1].

### Specialization to the spherical Hecke polynomial of the parent roadmap

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.2/spherical-specialization` (comparison).

Let π_v be an unramified irreducible admissible Q̄_p[GL_n(F_v)]-module and I_v = Iw_v. Then π_v^{Iw_v} ≠ 0, t_{v,i}(u) acts trivially for u ∈ O_{F_v}^×, and for each i the scalar e_{v,i}(ϖ_v, π_v) equals the scalar by which q_v^{i(i−1)/2}T_{v,i} acts on π_v^{GL_n(O_{F_v})}. Hence for every geometric Frobenius lift φ ∈ W_{F_v}, P_{v,φ}(X) acts on π_v^{Iw_v} by the image of the spherical polynomial P_v(X) = Σ_i(−1)^iq_v^{i(i−1)/2}T_{v,i}X^{n−i} of IntegralHeckeAndGaloisDeterminants IHG.3 acting on π_v^{GL_n(O_{F_v})}.

Hypotheses and conventions: Frobenius is geometric (ACC+ convention); IHG.3/frobenius-conversion translates to the arithmetic convention.

Construction or proof:

1. Both scalars are elementary symmetric functions of the eigenvalues of r_v(φ), rec^T(π_v) = (r_v, 0): the left by IHR.2/tame-local-langlands-charpoly, the right by the normalization dictionary of AutomorphicGaloisRepresentationsPartII AG2.0 (P_v(π_v; X) = ∏_j(X − q_v^{(n−1)/2}α_j) for Satake parameters α_j, with geometric Frobenius) and IHG.3's Satake coefficients T_{v,i} ↦ q_v^{i(n−i)/2}e_i(α).
2. Equivalently, without rec^T: q_v^{i(i−1)/2}q_v^{i(n−i)/2} = q_v^{i(n−1)/2}, matching t_{v,i}(ϖ_v) = q_v^{(n−1)/2}θ_{e_i(ϖ_v)}.

Acceptance:

- n = 1: e_{v,1}(ϖ_v) and T_{v,1} both act by χ(ϖ_v).
- n = 2: e_{v,2}(ϖ_v) acts by q_vχ_1χ_2(ϖ_v) = q_v·T_{v,2}.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.2/tame-local-langlands-charpoly`, `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`, `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-satake-coefficients`, `IntegralHeckeAndGaloisDeterminants:IHG.3/frobenius-conversion`, `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`.

Sources: ACC23, §2.2.5, (2.2.6) and the sentence after it, p. 922 — P_v(X) corresponds to the characteristic polynomial of Frobenius on rec^T_{F_v}(π_v) for unramified π_v (with the sign correction E6 of the paper extraction, recorded below). ACC23, §2.2.5, Proposition 2.2.9(3), p. 925 — The ramified operators compute the same characteristic polynomial on π_v^{I_v}.

**Acceptance tests of the layer.** n = 1: a character is I_v-fixed iff it is trivial on I_v. For n = 2, an unramified principal series with Frobenius eigenvalues a and −a on rec^T has e_{v,1}(ϖ_v, π_v) = 0. n = 1: for a character χ trivial on I_v, P_{v,σ}(X) acts by X − χ(α), the characteristic polynomial of χ ∘ Art^{−1}(σ) (local class field theory). n = 1: e_{v,1}(ϖ_v) and T_{v,1} both act by χ(ϖ_v).

## IHR.3 — Siegel-parahoric transfer at split places of the quasi-split unitary group

Let F be a CM field with maximal totally real subfield F⁺, G̃ the quasi-split unitary group U(n, n) over O_{F⁺} with Siegel parabolic P = U ⋊ G, G = Res_{O_F/O_{F⁺}} GL_n (TorsionCohomologyInfrastructure TC.3; IgusaVarietiesAndTorsionConcentration IG.0), and v a place of F, prime to p, above a place v̄ of F⁺ split in F, with ι_v : G̃(F⁺_v̄) ≅ GL_{2n}(F_v) and G(F⁺_v̄) = GL_n(F_{v^c}) × GL_n(F_v).

**Targets** (ACC+ §2.2.5, pp. 925–931).
- *Siegel parahoric levels*: 𝔭_v ⊂ GL_{2n}(O_{F_v}) (reduction block upper triangular with blocks n, 1, …, 1), 𝔭_{v,1} = ker(𝔭_v → B_n(k(v)) → T_n(k(v))), the levels q̃_v = ι_v^{−1}(𝔮_v) with 𝔭̃_{v,1} ⊆ q̃_v ⊆ 𝔭̃_v, their intersections GL_n(O_{F_{v^c}}) × Iw_v and GL_n(O_{F_{v^c}}) × Iw_{v,1} with the Levi, and their Iwahori decomposition with respect to P; and the unitary tame levels Ĩ_v̄ with Ĩw_v̄(1, 1) ⊆ Ĩ_v̄ ⊆ Ĩw_v̄(0, 1), meeting the Levi in I_{v^c} × I_v.
- *Lemma 2.2.10 and its tame analogue*: (ϖ_v^{−c}1_n, 1_n) and (ϖ_{v^c}^{−1}1_n, 1_n) are strongly positive and the corresponding double cosets are units of the Hecke algebras at levels q̃_v and Ĩ_v̄ over O.
- *Transferred operators* (2.2.11)–(2.2.12): the injective homomorphism t from H(GL_n(F_{v^c}) × GL_n(F_v), GL_n(O_{F_{v^c}}) × I_v) ⊗ O, the operators t_{v,i}(σ) (image of ‖σ‖_v^{−n}t_{v,i}(σ)), e_{v,i}(σ), e_{v^c,i}(σ) (image of ‖σ‖_v^{i(n−1)}e_{v^c,i}(σ)), the polynomials P_{v,σ}, P_{v^c,σ} and P̃_{v,σ} = P_{v^c,σ^{−c}}P_{v,σ} of degree 2n with coefficients ẽ_{v,i}(σ); and at tame unitary level the polynomial (2.2.17) P̃_{v,σ}(X) = ∏_{i=1}^{2n}(X − ι_v^{−1}(t_{v,i}(σ))).
- *Lemma 2.2.13*: on π̃^{q̃_v} ≠ 0 the ẽ_{v,i}(σ) act by scalars, and Σ(−1)^iẽ_{v,i}(σ, π̃)X^{2n−i} is the characteristic polynomial of r_v(σ), (r_v, N_v) = rec^T_{F_v}(π̃ ∘ ι_v^{−1}).
- *Satake transforms* (Propositions 2.2.18–2.2.19): 𝒮(P̃_{v,σ}(X)) = P_{v,σ}(X)‖σ‖_v^{n(1−2n)}P_{v^c,σ^{−c}}(‖σ‖_v^{2n−1}X) at level Ĩ_v̄, and 𝒮(P_{v,σ}) = P_{v,σ}, 𝒮(P_{v^c,σ^{−c}}(X)) = ‖σ‖_v^{n(1−2n)}P_{v^c,σ^{−c}}(‖σ‖_v^{2n−1}X) at level q̃_v.

Acceptance: n = 1, where G̃ = U(1, 1), q̃_v is an Iwahori-type level of GL_2(F_v) and every formula is checked against unramified twists.

**Dependencies.** Within this roadmap: IntegralHeckeAndGaloisDeterminantsPartII:IHR.1, IntegralHeckeAndGaloisDeterminantsPartII:IHR.2. Other roadmaps: TorsionCohomologyInfrastructure:TC.3, IgusaVarietiesAndTorsionConcentration:IG.0, ArithmeticLocallySymmetricSpaces:ALS.4, SmoothRepresentationsOfLocalGroups:SR.1, SmoothRepresentationsOfLocalGroups:SR.2, SmoothRepresentationsOfLocalGroups:SR.3, EndoscopicTransferAndUnitaryTraceComparison:ET.6, IntegralHeckeAndGaloisDeterminants:IHG.3.

**Planets.** Siegel parahoric levels (`IHR.3/siegel-parahoric-level`); Transferred Hecke operators at Siegel level (`IHR.3/siegel-transfer-operators`); Local Langlands at Siegel level (`IHR.3/siegel-transfer-local-langlands`); Satake transform at Siegel level (`IHR.3/satake-transform-siegel-level`).

### Siegel parahoric levels 𝔭_v ⊃ 𝔭_{v,1} and q̃_v at a split place

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-parahoric-level` (definition).

Let F be a CM field with maximal totally real subfield F⁺ and complex conjugation c, n ≥ 1, G̃ the quasi-split unitary group of ACC+ §2.2.1 over O_{F⁺} (preserving the form J_n with antidiagonal blocks ±Ψ_n), P = U ⋊ G its Siegel parabolic with Levi G ≅ Res_{O_F/O_{F⁺}} GL_n (block diagonal (A, D) ↦ D), and v a place of F, prime to p, above a place v̄ of F⁺ split in F; ι_v : G̃(F⁺_v̄) ≅ GL_{2n}(F_v) is the projection to the v-component, under which G(F⁺_v̄) = GL_n(F_{v^c}) × GL_n(F_v) maps to the block diagonal Levi via (D_{v^c}, D_v) ↦ diag(Ψ_n ᵗc(D_{v^c})^{−1}Ψ_n, D_v). Let 𝔭_v ⊂ GL_{2n}(O_{F_v}) be the parahoric subgroup of matrices whose reduction modulo ϖ_v is block upper triangular with diagonal blocks of sizes n, 1, …, 1; projection to the lower right n × n block gives 𝔭_v → B_n(k(v)), and 𝔭_{v,1} = ker(𝔭_v → B_n(k(v)) → T_n(k(v))). A Siegel parahoric level at v is an open compact 𝔮_v with 𝔭_{v,1} ⊆ 𝔮_v ⊆ 𝔭_v; put q̃_v = ι_v^{−1}(𝔮_v), 𝔭̃_v = ι_v^{−1}(𝔭_v), 𝔭̃_{v,1} = ι_v^{−1}(𝔭_{v,1}). These levels correspond to subgroups A ≤ T_n(k(v)), with 𝔭̃_v/𝔭̃_{v,1} ≅ (k(v)^×)^n; 𝔭̃_v ∩ G(F⁺_v̄) = GL_n(O_{F_{v^c}}) × Iw_v, 𝔭̃_{v,1} ∩ G(F⁺_v̄) = GL_n(O_{F_{v^c}}) × Iw_{v,1}, and q̃_v ∩ G(F⁺_v̄) = GL_n(O_{F_{v^c}}) × I_v for the tame Iwahori level I_v ⊂ GL_n(F_v) with the same A. Every q̃_v has an Iwahori decomposition with respect to P = GU.

Hypotheses and conventions: v ∤ p and v̄ = v|_{F⁺} split in F; the Levi identification is ACC+'s, through the lower right block D.

Construction or proof:

1. The reduction of 𝔭_v lies in the block upper triangular parabolic with blocks (n, 1, …, 1), whose Levi is GL_n × T_n; projecting to the lower right block and then to its diagonal is a homomorphism onto T_n(k(v)) with kernel 𝔭_{v,1}, so the levels in between correspond to subgroups A.
2. A Levi element diag(A_v, D_v), A_v = Ψᵗc(D_{v^c})^{−1}Ψ, lies in 𝔭_v iff A_v ∈ GL_n(O_{F_v}) and D_v ∈ Iw_v, i.e. iff D_{v^c} ∈ GL_n(O_{F_{v^c}}) and D_v ∈ Iw_v; the torus condition on D_v cuts out I_v.
3. 𝔭_v contains Iw_{2n}(1,1) and is the product of its intersections with the block-lower unipotent radical N̄_P (entries in ϖ_vO), the Levi and the block-upper radical N_P (entries in O), in either order; the same holds for 𝔮_v.

API:

- `SiegelParahoric.parahoric` (data): 𝔭_v ⊂ GL_{2n}(O_{F_v}).
- `SiegelParahoric.parahoricOne` (data): 𝔭_{v,1} = ker(𝔭_v → B_n(k(v)) → T_n(k(v))).
- `SiegelParahoric.level` (constructor): For A ≤ T_n(k(v)), the level 𝔮_v(A) between 𝔭_{v,1} and 𝔭_v, and q̃_v(A) = ι_v^{−1}(𝔮_v(A)).
- `SiegelParahoric.quotientEquiv` (equivalence): 𝔭̃_v/𝔭̃_{v,1} ≅ (k(v)^×)^n, and levels ↔ subgroups A, order-preservingly.
- `SiegelParahoric.inter_levi` (characterisation): q̃_v(A) ∩ G(F⁺_v̄) = GL_n(O_{F_{v^c}}) × I_v(A), with I_v(A) = TameIwahoriLevel.ofTorusSubgroup A.
- `SiegelParahoric.iwahoriDecomposition` (characterisation): q̃_v = (q̃_v ∩ N̄_P)(q̃_v ∩ G)(q̃_v ∩ U) = (q̃_v ∩ U)(q̃_v ∩ G)(q̃_v ∩ N̄_P), uniquely.
- `SiegelParahoric.isHeckeTriple` (instance): (G̃(F⁺_v̄), q̃_v) is a Hecke pair, so H(G̃(F⁺_v̄), q̃_v) ⊗ O is Tau Ceti's Hecke ring.

Unit tests:

- `SiegelParahoric.rank_one` (computation): For n = 1, ι_v(𝔭̃_v) is the Iwahori subgroup Iw_2 of GL_2(O_{F_v}) and 𝔭_{v,1} = {g ∈ Iw_2 : g_{22} ≡ 1 mod ϖ_v}.
- `SiegelParahoric.level_top` (degenerate): SiegelParahoric.level ⊤ = 𝔭_v and SiegelParahoric.level ⊥ = 𝔭_{v,1}.
- `SiegelParahoric.inter_levi_parahoric` (compatibility): 𝔭̃_v ∩ G(F⁺_v̄) = GL_n(O_{F_{v^c}}) × Iw_v, with Iw_v ALS.0's Iwahori subgroup.
- `SiegelParahoric.not_conjugate_place` (non-example): ι_{v^c}^{−1}(𝔭_{v^c}) ≠ 𝔭̃_v for n ≥ 1: its intersection with the Levi is Iw_{v^c} × GL_n(O_{F_v}).

Uses: ACC+ Lemma 2.2.10 and (2.2.11)–(2.2.12), p. 926 — the level at which the GL_n operators are transported to G̃; ACC+ Theorem 2.4.8, p. 946 — K̃_v̄ = q̃_v at the places v ∈ R − R^c; ACC+ Lemma 3.2.1(5)(c), p. 955 — K̃_v̄ = 𝔭̃_{v,1} at v̄ ∈ R̄ − R̄_1.

Acceptance:

- For n = 1, 𝔭_v is the Iwahori subgroup of GL_2(O_{F_v}) and 𝔭_{v,1} its subgroup with lower right entry ≡ 1 mod ϖ_v.
- 𝔭̃_v is not ι_{v^c}^{−1}(𝔭_{v^c}): the latter meets the Levi in Iw_{v^c} × GL_n(O_{F_v}).

Direct prerequisites: `IgusaVarietiesAndTorsionConcentration:IG.0/quasi-split-unitary-datum`, `TorsionCohomologyInfrastructure:TC.3`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-iwahori-level`, `mathlib:Matrix.BlockTriangular`.

Sources: ACC23, §2.2.5, pp. 925–926 — Definition of 𝔭_v, 𝔭_{v,1}, 𝔮_v and q̃_v, the identifications of 𝔭̃_v ∩ G and 𝔭̃_{v,1} ∩ G, 𝔭̃_v/𝔭̃_{v,1} ≅ (k(v)^×)^n, and the Iwahori decomposition of q̃_v with respect to P = GU. ACC23, §2.2.1, pp. 916–917 — The group G̃, the Siegel parabolic P = U ⋊ G, the identification of G with Res GL_n via D, and the isomorphisms ι_v at split places.

### Unitary tame levels Ĩ_v̄ at a split place

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/unitary-tame-level` (definition).

Let F be a CM field with maximal totally real subfield F⁺ and complex conjugation c, n ≥ 1, G̃ the quasi-split unitary group of ACC+ §2.2.1 over O_{F⁺} (preserving the form J_n with antidiagonal blocks ±Ψ_n), P = U ⋊ G its Siegel parabolic with Levi G ≅ Res_{O_F/O_{F⁺}} GL_n (block diagonal (A, D) ↦ D), and v a place of F, prime to p, above a place v̄ of F⁺ split in F; ι_v : G̃(F⁺_v̄) ≅ GL_{2n}(F_v) is the projection to the v-component, under which G(F⁺_v̄) = GL_n(F_{v^c}) × GL_n(F_v) maps to the block diagonal Levi via (D_{v^c}, D_v) ↦ diag(Ψ_n ᵗc(D_{v^c})^{−1}Ψ_n, D_v). Write Ĩw_v̄(b, c) = ι_v^{−1}(Iw_v(b, c)) = ι_{v^c}^{−1}(Iw_{v^c}(b, c)) ⊂ G̃(F⁺_v̄). A unitary tame level at v̄ is an open compact Ĩ_v̄ with Ĩw_v̄(1, 1) ⊆ Ĩ_v̄ ⊆ Ĩw_v̄(0, 1), i.e. ι_v(Ĩ_v̄) is a tame Iwahori level of GL_{2n}(F_v), with torus subgroup Ã ≤ (k(v)^×)^{2n}; it is block-decomposable if Ã = A′ × A″ for the first n and last n coordinates. For a block-decomposable Ĩ_v̄, Ĩ_v̄ ∩ G(F⁺_v̄) = I_{v^c} × I_v with tame Iwahori levels I_{v^c} ⊂ GL_n(F_{v^c}) and I_v ⊂ GL_n(F_v), and Ĩ_v̄ has an Iwahori decomposition with respect to P. The levels Ĩw_v̄(1, 1) and Ĩw_v̄(0, 1), with intersections Iw_{v^c,1} × Iw_{v,1} and Iw_{v^c} × Iw_v, are block-decomposable.

Hypotheses and conventions: block-decomposability is part of the definition used in IHR.3/unitary-tame-hecke-polynomial and IHR.3/satake-transform-tame-level (see the sourceIssues: ACC+ asserts the product decomposition for every Ĩ_v̄).

Construction or proof:

1. ι_v^{−1}(Iw_v(b,c)) = ι_{v^c}^{−1}(Iw_{v^c}(b,c)) because the outer automorphism g ↦ J ᵗc(g)^{−1} J^{−1} relating the two projections preserves the standard Iwahori filtration (ACC+ p. 923).
2. Under ι_v the diagonal torus of G̃ maps to T_{2n}(F_v) by (D_{v^c}, D_v) ↦ diag(c(d′_n)^{−1}, …, c(d′_1)^{−1}, d_1, …, d_n), so Ĩ_v̄ ∩ G is cut out by a torus condition on the pair of reductions; it is a product of subgroups of the two factors exactly when Ã is a product A′ × A″.
3. The Iwahori decomposition of ι_v(Ĩ_v̄) with respect to B_{2n} refines to one with respect to the Siegel parabolic, since B_{2n} ⊂ ι_v(P).

API:

- `UnitaryTameLevel` (data): An open compact Ĩ_v̄ with Ĩw_v̄(1,1) ≤ Ĩ_v̄ ≤ Ĩw_v̄(0,1).
- `UnitaryTameLevel.toGL` (projection): ι_v(Ĩ_v̄) as a TameIwahoriLevel of GL_{2n}(F_v).
- `UnitaryTameLevel.IsBlockDecomposable` (data): The torus subgroup of ι_v(Ĩ_v̄) is a product A′ × A″.
- `UnitaryTameLevel.inter_levi` (characterisation): For block-decomposable Ĩ_v̄, Ĩ_v̄ ∩ G(F⁺_v̄) = I_{v^c} × I_v with I_v = ofTorusSubgroup A″ and I_{v^c} the level whose torus subgroup is the image of A′ under the reversal-inversion-conjugation of the coordinates.
- `UnitaryTameLevel.iota_conj` (compatibility): ι_v^{−1}(Iw_v(b,c)) = ι_{v^c}^{−1}(Iw_{v^c}(b,c)).
- `UnitaryTameLevel.iwahoriDecomposition` (characterisation): Ĩ_v̄ has an Iwahori decomposition with respect to P = GU.

Unit tests:

- `UnitaryTameLevel.iwOneOne_inter` (computation): Ĩw_v̄(1,1) ∩ G(F⁺_v̄) = Iw_{v^c,1} × Iw_{v,1}.
- `UnitaryTameLevel.iwZeroOne_inter` (degenerate): Ĩw_v̄(0,1) ∩ G(F⁺_v̄) = Iw_{v^c} × Iw_v.
- `UnitaryTameLevel.diagonal_not_decomposable` (non-example): For n = 1 and Ã = {(a, a)}, Ĩ_v̄ is a unitary tame level which is not block-decomposable, and Ĩ_v̄ ∩ G = {(x, y) : c(x)^{−1} ≡ y mod ϖ_v} is not a product.
- `UnitaryTameLevel.toGL_tame` (compatibility): UnitaryTameLevel.toGL Ĩw_v̄(1,1) = Iw_{2n,1} (ALS.0's pro-ℓ Iwahori of GL_{2n}).

Uses: ACC+ (2.2.17) and Proposition 2.2.18, pp. 930–931 — the level of the unitary ramified Hecke polynomial and of its Satake transform; ACC+ Theorem 2.4.8, p. 946 — K̃_v̄ = Ĩ_v̄ at the places of R ∩ R^c; ACC+ Lemma 3.2.1(5)(c), p. 955 — K̃_v̄ = Ĩw_v̄(1,1) at v̄ ∈ R̄_1.

Acceptance:

- For n = 1 and Ã the diagonal {(a, a)} ⊂ (k(v)^×)², ι_v(Ĩ_v̄) is a tame level but Ĩ_v̄ ∩ G is not a product of subgroups of O_{F_{v^c}}^× and O_{F_v}^×.

Direct prerequisites: `IgusaVarietiesAndTorsionConcentration:IG.0/quasi-split-unitary-datum`, `TorsionCohomologyInfrastructure:TC.3`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-iwahori-level`.

Sources: ACC23, §2.2.5, pp. 923 and 930–931 — Ĩw_v̄(b, c) is defined through ι_v (equivalently ι_{v^c}); for Ĩw_v̄(1,1) ⊂ Ĩ_v̄ ⊂ Ĩw_v̄(0,1) the source identifies Ĩ_v̄ ∩ G(F⁺_v̄) with a product I_{v^c} × I_v and notes the Iwahori decomposition with respect to P.

### Invertible strongly positive Levi elements at Siegel and tame levels (Lemma 2.2.10)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-strongly-positive-invertible` (theorem).

In the setting of IHR.3/siegel-parahoric-level, the element g = (ϖ_v^{−c}·1_n, 1_n) ∈ GL_n(F_{v^c}) × GL_n(F_v) = G(F⁺_v̄) is strongly positive for the Iwahori decomposition of q̃_v with respect to P, and [q̃_v g q̃_v] is a unit of H(G̃(F⁺_v̄), q̃_v) ⊗_ℤ O. Likewise, for a unitary tame level Ĩ_v̄, (ϖ_{v^c}^{−1}·1_n, 1_n) is strongly positive and [Ĩ_v̄(ϖ_{v^c}^{−1}1_n, 1_n)Ĩ_v̄] is a unit of H(G̃(F⁺_v̄), Ĩ_v̄) ⊗ O. Here q_v ∈ O^× and ϖ_v^{−c} = c(ϖ_v)^{−1} is a uniformizer of F_{v^c} to the power −1.

Hypotheses and conventions: q_v ∈ O^×.

Construction or proof:

1. ι_v(g) = diag(ϖ_v1_n, 1_n), central in the Levi GL_n × GL_n of ι_v(P), contracting the block-upper radical and expanding the block-lower one: strongly positive.
2. In GL_{2n}(F_v), diag(ϖ_v1_n, 1_n) is a positive torus element for the pro-ℓ Iwahori Iw_{2n}(1,1) ⊂ 𝔭_{v,1} ⊆ 𝔮_v, and [Iw(1,1) diag(ϖ_v1_n, 1_n) Iw(1,1)] is a unit over O (IHR.1/tame-double-coset-invertible, Flicker Corollary 3.4).
3. 𝔮_v diag(ϖ_v1_n, 1_n) 𝔮_v = 𝔮_v·diag(ϖ_v1_n, 1_n)·Iw(1,1) by the Iwahori decomposition, so [𝔮_v g 𝔮_v] = [𝔮_v]·[Iw(1,1) g Iw(1,1)] in the Hecke algebra of Iw(1,1) with the volume normalizations matched; the two factors commute (Flicker Theorem 4.5, g being fixed by the Weyl group of the Levi), so [𝔮_v g 𝔮_v] is a unit with inverse [𝔮_v]·[Iw(1,1) g Iw(1,1)]^{−1}, an O-valued function since q_v ∈ O^×.
4. For Ĩ_v̄ the same argument applies directly: ι_v(Ĩ_v̄) is a tame Iwahori level of GL_{2n}(F_v) and the element is a positive torus element.

Acceptance:

- For n = 1, ι_v(g) = diag(ϖ_v, 1) and [𝔮_v g 𝔮_v] is the unit [Iw diag(ϖ_v, 1) Iw] of the Iwahori–Hecke algebra over ℤ[1/q_v].

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-parahoric-level`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/unitary-tame-level`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-double-coset-invertible`, `SmoothRepresentationsOfLocalGroups:SR.1`, `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`.

Sources: ACC23, §2.2.5, Lemma 2.2.10 and its proof, p. 926 — g = (ϖ_v^{−c}1_n, 1_n) is strongly positive and [q̃_v g q̃_v] is invertible; the proof factors it through [Iw_v(1) diag(ϖ_v,…,1) Iw_v(1)] (invertible by [Fli11, Cor. 3.4]) and [𝔮_v], which commute by [Fli11, Th. 4.5]. ACC23, §2.2.5, p. 931 — At level Ĩ_v̄ the element (ϖ_{v^c}^{−1}1_n, 1_n) is strongly positive with invertible double coset, so Lemma 2.1.13 applies. Fli11, Corollary 3.4, p. 479; Theorem 4.5, pp. 482–483 — Invertibility of the generators of the tame algebra and its Bernstein-type relations.

### Transferred operators at the Siegel level (2.2.11)–(2.2.12)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-transfer-operators` (construction).

Let F be a CM field with maximal totally real subfield F⁺ and complex conjugation c, n ≥ 1, G̃ the quasi-split unitary group of ACC+ §2.2.1 over O_{F⁺} (preserving the form J_n with antidiagonal blocks ±Ψ_n), P = U ⋊ G its Siegel parabolic with Levi G ≅ Res_{O_F/O_{F⁺}} GL_n (block diagonal (A, D) ↦ D), and v a place of F, prime to p, above a place v̄ of F⁺ split in F; ι_v : G̃(F⁺_v̄) ≅ GL_{2n}(F_v) is the projection to the v-component, under which G(F⁺_v̄) = GL_n(F_{v^c}) × GL_n(F_v) maps to the block diagonal Levi via (D_{v^c}, D_v) ↦ diag(Ψ_n ᵗc(D_{v^c})^{−1}Ψ_n, D_v). Let q̃_v be a Siegel parahoric level with q̃_v ∩ G(F⁺_v̄) = GL_n(O_{F_{v^c}}) × I_v and Ξ_v the tame torus quotient of I_v. By Lemma 2.1.13 (with IHR.3/siegel-strongly-positive-invertible) there is an injective O-algebra homomorphism t : H(GL_n(F_{v^c}) × GL_n(F_v), GL_n(O_{F_{v^c}}) × I_v) ⊗ O → H(G̃(F⁺_v̄), q̃_v) ⊗ O. For σ ∈ W_{F_v} define t_{v,i}(σ) ∈ H(G̃(F⁺_v̄), q̃_v) ⊗ O as the image under t of ‖σ‖_v^{−n}t_{v,i}(σ) (the GL_n(F_v) operator of IHR.1), e_{v,i}(σ) as the coefficient of (−1)^iX^{n−i} in P_{v,σ}(X) = ∏_{i=1}^{n}(X − t_{v,i}(σ)) (2.2.11). For σ ∈ W_{F_{v^c}} define e_{v^c,i}(σ) as the image under t of ‖σ‖_v^{i(n−1)}e_{v^c,i}(σ), where e_{v^c,i}(σ) ∈ H(GL_n(F_{v^c}), GL_n(O_{F_{v^c}})) ⊗ O are the coefficients of the unramified Weil-group polynomial P_{v^c,σ}(X) of IntegralHeckeAndGaloisDeterminants IHG.3, and put P_{v^c,σ}(X) = Σ_{i=0}^{n}(−1)^ie_{v^c,i}(σ)X^{n−i} (2.2.12). For σ ∈ W_{F_v} put P̃_{v,σ}(X) = P_{v^c,σ^{−c}}(X)P_{v,σ}(X) = Σ_{k=0}^{2n}(−1)^kẽ_{v,k}(σ)X^{2n−k}, so ẽ_{v,k}(σ) = Σ_{i+j=k}e_{v,i}(σ)e_{v^c,j}(σ^{−c}). Here ‖σ‖_v = |Art_{F_v}^{−1}(σ)|_v and σ^{−c} = cσ^{−1}c^{−1} ∈ W_{F_{v^c}}.

Hypotheses and conventions: q_v ∈ O^×; printed corrections: (2.2.12) has e_{v^c,i}(σ), and P̃_{v,σ} has X^{2n−k} (sourceIssues).

Construction or proof:

1. Apply Lemma 2.1.13 (SmoothRepresentationsOfLocalGroups SR.1) to M = G, U_M = GL_n(O_{F_{v^c}}) × I_v, with the strongly positive element of Lemma 2.2.10 whose double coset is a unit: t extends from the positive monoid to the whole Levi Hecke algebra, injectively.
2. The Levi Hecke algebra is the tensor product of the spherical algebra at v^c (commutative) and H(GL_n(F_v), I_v); the elements ‖σ‖^{−n}t_{v,i}(σ) and ‖σ‖^{i(n−1)}e_{v^c,i}(σ) lie in the commutative subalgebra generated by the spherical algebra and t(O[Ξ_v]), so all transferred operators commute and the polynomials have commuting coefficients.
3. The coefficients ẽ_{v,k}(σ) are read off from the product of two monic polynomials of degree n.

API:

- `siegelTransfer` (constructor): t : H(GL_n(F_{v^c}) × GL_n(F_v), GL_n(O_{F_{v^c}}) × I_v) ⊗ O →+* H(G̃(F⁺_v̄), q̃_v) ⊗ O, injective.
- `siegelOperator` (constructor): t_{v,i}(σ) := t(‖σ‖_v^{−n}t_{v,i}(σ)) for σ ∈ W_{F_v}.
- `siegelConjOperator` (constructor): e_{v^c,i}(σ) := t(‖σ‖_v^{i(n−1)}e_{v^c,i}(σ)) for σ ∈ W_{F_{v^c}}.
- `siegelPoly` (constructor): P_{v,σ}(X) = ∏_i(X − t_{v,i}(σ)) ∈ (H(G̃(F⁺_v̄), q̃_v) ⊗ O)[X], monic of degree n.
- `siegelConjPoly` (constructor): P_{v^c,σ}(X) = Σ_i(−1)^ie_{v^c,i}(σ)X^{n−i}, monic of degree n.
- `siegelFullPoly` (constructor): P̃_{v,σ}(X) = P_{v^c,σ^{−c}}(X)P_{v,σ}(X), monic of degree 2n.
- `siegelFullPoly_coeff` (characterisation): The coefficient of X^{2n−k} in P̃_{v,σ} is (−1)^kΣ_{i+j=k}e_{v,i}(σ)e_{v^c,j}(σ^{−c}).
- `siegelOperator_commute` (structure): All t_{v,i}(σ), e_{v,i}(σ), e_{v^c,j}(τ) commute.
- `siegelOperator_mul` (simp): σ ↦ t_{v,i}(σ) is a character of W_{F_v}: t_{v,i}(στ) = t_{v,i}(σ)t_{v,i}(τ).
- `siegelTransfer_level` (functoriality): For Siegel levels q̃_v ⊆ q̃′_v with tame parts I_v ⊆ I′_v, restriction of invariants intertwines the operators at the two levels.

Unit tests:

- `siegelOperator_rank_one` (computation): For n = 1, σ ∈ W_{F_v} with Art(α) = σ|_{ab}: t_{v,1}(σ) = t(|α|_v^{−1}[I_v α I_v]) and e_{v^c,1}(τ) = t(e_{v^c,1}(τ)) (the exponent i(n − 1) vanishes).
- `siegelOperator_inertia_parahoric` (degenerate): For q̃_v = 𝔭̃_v (I_v = Iw_v) and τ ∈ I_{F_v}: t_{v,i}(τ) = 1, so P_{v,τ}(X) = (X − 1)^n.
- `siegelFullPoly_monic_degree` (computation): P̃_{v,σ} is monic of natural degree 2n, its X^{2n−1} coefficient is −(e_{v,1}(σ) + e_{v^c,1}(σ^{−c})) (the printed X^{n−i} would give negative powers).
- `siegelConjPoly_not_v` (non-example): P_{v^c,σ} is built from e_{v^c,i}, not e_{v,i}: with the printed (2.2.12), P̃_{v,σ} would not involve the GL_n(F_{v^c}) factor and Lemma 2.2.13 would fail already for n = 1.

Uses: ACC+ Lemma 2.2.13, p. 927 — the ẽ_{v,k}(σ) act on π̃^{q̃_v} by the coefficients of the characteristic polynomial of rec^T; ACC+ definition of Res_v, p. 928 — the resultant of P_{v^c,φ^{−c}} and P_{v,φ}; ACC+ Theorem 2.4.8 and §3.2 — generators of T̃^T_R at the places of R − R^c and R^c − R; ACC+ Proposition 2.2.19, p. 931 — their Satake transforms to the Levi.

Acceptance:

- For n = 1, t_{v,1}(σ) = t(‖σ‖_v^{−1}[I_v α I_v]) and P̃_{v,σ} has degree 2.
- All transferred operators commute.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-parahoric-level`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-strongly-positive-invertible`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-hecke-operators`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/ramified-hecke-polynomial`, `IntegralHeckeAndGaloisDeterminants:IHG.3`, `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`, `SmoothRepresentationsOfLocalGroups:SR.1`, `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`.

Sources: ACC23, §2.2.5, (2.2.11)–(2.2.12) and the definition of P̃_{v,σ}, p. 926 — Definition of the transferred t_{v,i}(σ) (image of ‖σ‖^{−n}t_{v,i}(σ)), e_{v,i}(σ), e_{v^c,i}(σ) (image of ‖σ‖^{i(n−1)}e_{v^c,i}(σ)), P_{v,σ}, P_{v^c,σ} and P̃_{v,σ} = P_{v^c,σ^{−c}}P_{v,σ}. ACC23, §2.2.5, p. 922 — The unramified Weil-group polynomial P_{v,σ}(X) ∈ T_v[X] whose specialization is the characteristic polynomial of σ on rec^T(π_v).

### The unitary ramified Hecke polynomial at tame level (2.2.17)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/unitary-tame-hecke-polynomial` (construction).

Let F be a CM field with maximal totally real subfield F⁺ and complex conjugation c, n ≥ 1, G̃ the quasi-split unitary group of ACC+ §2.2.1 over O_{F⁺} (preserving the form J_n with antidiagonal blocks ±Ψ_n), P = U ⋊ G its Siegel parabolic with Levi G ≅ Res_{O_F/O_{F⁺}} GL_n (block diagonal (A, D) ↦ D), and v a place of F, prime to p, above a place v̄ of F⁺ split in F; ι_v : G̃(F⁺_v̄) ≅ GL_{2n}(F_v) is the projection to the v-component, under which G(F⁺_v̄) = GL_n(F_{v^c}) × GL_n(F_v) maps to the block diagonal Levi via (D_{v^c}, D_v) ↦ diag(Ψ_n ᵗc(D_{v^c})^{−1}Ψ_n, D_v). Let Ĩ_v̄ be a block-decomposable unitary tame level (IHR.3/unitary-tame-level). For σ ∈ W_{F_v} put P̃_{v,σ}(X) = ∏_{i=1}^{2n}(X − ι_v^{−1}(t_{v,i}(σ))) = Σ_{i=0}^{2n}(−1)^iι_v^{−1}(e_{v,i}(σ))X^{2n−i} ∈ (H(G̃(F⁺_v̄), Ĩ_v̄) ⊗ O)[X], where t_{v,i}(σ), e_{v,i}(σ) are the operators of IHR.1 for GL_{2n}(F_v) at the tame level ι_v(Ĩ_v̄), transported by ι_v^{−1}.

Hypotheses and conventions: q_v ∈ O^×; Ĩ_v̄ block-decomposable, so that IHR.3/satake-transform-tame-level applies.

Construction or proof:

1. ι_v^{−1} induces an isomorphism H(GL_{2n}(F_v), ι_v(Ĩ_v̄)) ≅ H(G̃(F⁺_v̄), Ĩ_v̄); apply it to the polynomial (2.2.8) for GL_{2n}.

API:

- `unitaryTamePoly` (constructor): P̃_{v,σ}(X) ∈ (H(G̃(F⁺_v̄), Ĩ_v̄) ⊗ O)[X], monic of degree 2n.
- `unitaryTamePoly_eq_map` (compatibility): P̃_{v,σ} is the image under ι_v^{−1} of the GL_{2n} polynomial P_{v,σ} of IHR.1.
- `unitaryTamePoly_coeff` (characterisation): Its coefficients are (−1)^iι_v^{−1}(e_{v,i}(σ)), central.
- `unitaryTamePoly_conj` (compatibility): Defining it through ι_{v^c} and σ^{−c} ∈ W_{F_{v^c}} gives the reciprocal polynomial: ι_{v^c}^{−1}(P_{v^c,σ^{−c}})(X) = P̃_{v,σ}^∨(X) with the convention f^∨(X) = a_0^{−1}X^{deg f}f(X^{−1}).

Unit tests:

- `unitaryTamePoly_rank_one` (computation): For n = 1, P̃_{v,σ}(X) = (X − ι_v^{−1}t_{v,1}(σ))(X − ι_v^{−1}t_{v,2}(σ)) with t_{v,2}(ϖ_v) = q_v t([diag(1, ϖ_v)]).
- `unitaryTamePoly_inertia` (degenerate): For Ĩ_v̄ = Ĩw_v̄(0,1) and τ ∈ I_{F_v}, P̃_{v,τ}(X) = (X − 1)^{2n}.
- `unitaryTamePoly_classical` (compatibility): On π̃^{Ĩ_v̄} ≠ 0, P̃_{v,σ}(X) acts by the characteristic polynomial of σ on rec^T_{F_v}(π̃ ∘ ι_v^{−1}) (IHR.2/tame-local-langlands-charpoly for GL_{2n}).
- `unitaryTamePoly_not_siegel` (non-example): At a Siegel level q̃_v the polynomial (2.2.17) is not defined (q̃_v is not between Ĩw_v̄(1,1) and Ĩw_v̄(0,1) unless n = 1), and P̃_{v,σ} there is the product of (2.2.11)–(2.2.12) instead.

Uses: ACC+ Proposition 2.2.18, p. 931 — its Satake transform to the Levi; ACC+ proof of Proposition 3.2.2, p. 959 — at v ∈ R ∩ R^c the classical points satisfy condition (2) with this polynomial, by Proposition 2.2.9 for GL_{2n}.

Acceptance:

- For Ĩ_v̄ = Ĩw_v̄(0,1) and τ ∈ I_{F_v}, P̃_{v,τ}(X) = (X − 1)^{2n}.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/unitary-tame-level`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/ramified-hecke-polynomial`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-strongly-positive-invertible`.

Sources: ACC23, §2.2.5, eq. (2.2.17), pp. 930–931 — For Ĩw_v̄(1,1) ⊂ Ĩ_v̄ ⊂ Ĩw_v̄(0,1), P̃_{v,σ}(X) is the product of the X − ι_v^{−1}(t_{v,i}(σ)), i = 1, …, 2n.

### Transferred operators compute rec^T (Lemma 2.2.13)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-transfer-local-langlands` (theorem).

Let F be a CM field with maximal totally real subfield F⁺ and complex conjugation c, n ≥ 1, G̃ the quasi-split unitary group of ACC+ §2.2.1 over O_{F⁺} (preserving the form J_n with antidiagonal blocks ±Ψ_n), P = U ⋊ G its Siegel parabolic with Levi G ≅ Res_{O_F/O_{F⁺}} GL_n (block diagonal (A, D) ↦ D), and v a place of F, prime to p, above a place v̄ of F⁺ split in F; ι_v : G̃(F⁺_v̄) ≅ GL_{2n}(F_v) is the projection to the v-component, under which G(F⁺_v̄) = GL_n(F_{v^c}) × GL_n(F_v) maps to the block diagonal Levi via (D_{v^c}, D_v) ↦ diag(Ψ_n ᵗc(D_{v^c})^{−1}Ψ_n, D_v). Let π̃ be an irreducible admissible Q̄_p[G̃(F⁺_v̄)]-module with π̃^{q̃_v} ≠ 0 and σ ∈ W_{F_v}. Then (1) each ẽ_{v,k}(σ) acts on π̃^{q̃_v} by a scalar ẽ_{v,k}(σ, π̃) ∈ Q̄_p; (2) if (r_v, N_v) = rec^T_{F_v}(π̃ ∘ ι_v^{−1}), the characteristic polynomial of r_v(σ) equals Σ_{k=0}^{2n}(−1)^kẽ_{v,k}(σ, π̃)X^{2n−k}.

Hypotheses and conventions: ℓ ≠ p; the printed X^{n−k} is read as X^{2n−k} (sourceIssues).

Construction or proof:

1. Fix ι : Q̄_p ≅ ℂ. There is a tamely ramified χ : T(F⁺_v̄) = T_{2n}(F_v) → Q̄_p^× with π̃ a subquotient of Π̃ = n-Ind_{B}^{G̃}χ; it suffices to show that ẽ_{v,k}(σ) acts on Π̃^{q̃_v} by the k-th elementary symmetric function of ψ_1(α), …, ψ_{2n}(α), α = Art^{−1}(σ), where χ ↔ (ψ_1, …, ψ_{2n}).
2. Pass to the universal unramified twist over R = Q̄_p[T(F⁺_v̄)/T(O)]: Π̃_u^{q̃_v} is finite free over R with specialization isomorphisms, so it suffices to treat a Zariski-dense set of points x.
3. Bushnell–Kutzko (SmoothRepresentationsOfLocalGroups SR.2): q : (Π̃_x)^{q̃_v} → r_P(Π̃_x)^{GL_n(O_{F_{v^c}}) × I_v} is an isomorphism with hq(y) = δ_P^{1/2}(g)q(t(h)y).
4. Geometric lemma (SR.2): r_P(Π̃_x) has a filtration by σ_{x,Y_{v^c},Y_v} = n-Ind(⊗_{i∈Y_{v^c}}ψ_{x,i}^{−c}) ⊗ n-Ind(⊗_{i∈Y_v}ψ_{x,i}) over partitions {1, …, 2n} = Y_{v^c} ⊔ Y_v; at points where the central element (ϖ_{v^c}1_n, 1_n) has distinct eigenvalues on the pieces the filtration splits.
5. On each summand, the operators e_{v,i}(σ) and e_{v^c,j}(σ^{−c}) act by scalars computed by IHR.2/tame-local-langlands-charpoly (the GL_n(F_v) factor at level I_v) and the spherical normalization of IHG.3 (the GL_n(F_{v^c}) factor), the powers of ‖σ‖_v in (2.2.11)–(2.2.12) cancelling δ_P^{1/2}; Σ_{i+j=k}e_{v,i}(σ)e_{v^c,j}(σ^{−c}) then acts by the k-th elementary symmetric function of the ψ_{x,i}(α), independently of the summand.
6. Transfer back along q, extend to all points by density, and compare with rec^T(Π̃_x ∘ ι_v^{−1}) as in IHR.2/tame-local-langlands-charpoly.

Acceptance:

- n = 1: π̃ ∘ ι_v^{−1} = St_2 ⊗ (χ ∘ det) with χ unramified: P̃_{v,φ}(X) acts by (X − χ(ϖ_v))(X − q_vχ(ϖ_v)).
- Unramified π̃: P̃_{v,φ}(X) acts by the image of the unramified P̃_v(X) of (2.2.7).

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-transfer-operators`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.2/tame-local-langlands-charpoly`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.2/tame-hecke-centre`, `IntegralHeckeAndGaloisDeterminants:IHG.3`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`.

Sources: ACC23, §2.2.5, Lemma 2.2.13 and its proof, pp. 927–928 — The ẽ_{v,i}(σ) act by scalars on π̃^{q̃_v}, giving the characteristic polynomial of r_v(σ); the proof uses the universal unramified twist, Zariski density, [BK98, Th. 7.9] and the geometrical lemma [Zel80].

### Satake transform of the unitary tame polynomial (Proposition 2.2.18)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/satake-transform-tame-level` (theorem).

Let F be a CM field with maximal totally real subfield F⁺ and complex conjugation c, n ≥ 1, G̃ the quasi-split unitary group of ACC+ §2.2.1 over O_{F⁺} (preserving the form J_n with antidiagonal blocks ±Ψ_n), P = U ⋊ G its Siegel parabolic with Levi G ≅ Res_{O_F/O_{F⁺}} GL_n (block diagonal (A, D) ↦ D), and v a place of F, prime to p, above a place v̄ of F⁺ split in F; ι_v : G̃(F⁺_v̄) ≅ GL_{2n}(F_v) is the projection to the v-component, under which G(F⁺_v̄) = GL_n(F_{v^c}) × GL_n(F_v) maps to the block diagonal Levi via (D_{v^c}, D_v) ↦ diag(Ψ_n ᵗc(D_{v^c})^{−1}Ψ_n, D_v). Let Ĩ_v̄ be a block-decomposable unitary tame level with Ĩ_v̄ ∩ G(F⁺_v̄) = I_{v^c} × I_v, and 𝒮 : (H(G̃(F⁺_v̄), Ĩ_v̄) ⊗ O)[[Ĩ_v̄zĨ_v̄]^{−1}] → H(G(F⁺_v̄), I_{v^c} × I_v) ⊗ O the localized unnormalized Satake isomorphism of Lemma 2.1.13 (z the element of IHR.3/siegel-strongly-positive-invertible). For every σ ∈ W_{F_v}, 𝒮(P̃_{v,σ}(X)) = P_{v,σ}(X)·‖σ‖_v^{n(1−2n)}P_{v^c,σ^{−c}}(‖σ‖_v^{2n−1}X), where P_{v,σ} is the GL_n(F_v) polynomial (2.2.8) at level I_v and P_{v^c,σ^{−c}} the GL_n(F_{v^c}) polynomial (2.2.8) at level I_{v^c}.

Hypotheses and conventions: q_v ∈ O^×; Ĩ_v̄ block-decomposable.

Construction or proof:

1. 𝒮 ∘ t is multiplication by |δ_P|^{−1} on the Levi Hecke algebra (ACC+ §2.1.9, ALS.4/parabolic-hecke-maps), and on torus elements of the GL_{2n} tame torus algebra 𝒮 ∘ t_{GL_{2n}} factors through the Levi tame torus algebras.
2. The first n roots t_{v,i}(σ), i ≤ n, of (2.2.17) correspond to the GL_n(F_{v^c})-coordinates: under ι_v the torus element e_i(α) for i ≤ n is (e_{n+1−i}(c(α)^{−1}), 1) in GL_n(F_{v^c}) × GL_n(F_v), on which |δ_P|^{−1} is ‖σ‖_v^{−n}; collecting the q_v-powers gives the roots ‖σ‖_v^{1−2n}t^{GL_n(F_{v^c})}_{v^c,j}(σ^{−c}).
3. The last n roots i > n correspond to the GL_n(F_v)-coordinates, with |δ_P|^{−1} = ‖σ‖_v^{n} compensating the shift of the normalization exponent, giving t^{GL_n(F_v)}_{v,i−n}(σ).
4. Multiply the two monic factors: ∏_j(X − ‖σ‖^{1−2n}t_{v^c,j}) = ‖σ‖^{n(1−2n)}P_{v^c,σ^{−c}}(‖σ‖^{2n−1}X).

Acceptance:

- n = 1: 𝒮(P̃_{v,σ})(X) = (X − t_{v,1}(σ))·‖σ‖^{−1}(‖σ‖X − t_{v^c,1}(σ^{−c})).
- The constant terms match: 𝒮 of (−1)^{2n}ẽ_{v,2n}(σ) equals the product of the constant terms on the right.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/unitary-tame-hecke-polynomial`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/unitary-tame-level`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-strongly-positive-invertible`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-torus-embedding`, `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`, `SmoothRepresentationsOfLocalGroups:SR.1`.

Sources: ACC23, §2.2.5, Proposition 2.2.18 and its proof, p. 931 — The Satake transform of P̃_{v,σ}(X) is P_{v,σ}(X)‖σ‖^{n(1−2n)}P_{v^c,σ^{−c}}(‖σ‖^{2n−1}X), by a calculation with 𝒮 ∘ t; for ((1, …, α^{−1}, …, 1), 1_n) the action of 𝒮 ∘ t is multiplication by ‖σ‖_v^{−n}.

### Satake transform at the Siegel level (Proposition 2.2.19)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/satake-transform-siegel-level` (theorem).

Let F be a CM field with maximal totally real subfield F⁺ and complex conjugation c, n ≥ 1, G̃ the quasi-split unitary group of ACC+ §2.2.1 over O_{F⁺} (preserving the form J_n with antidiagonal blocks ±Ψ_n), P = U ⋊ G its Siegel parabolic with Levi G ≅ Res_{O_F/O_{F⁺}} GL_n (block diagonal (A, D) ↦ D), and v a place of F, prime to p, above a place v̄ of F⁺ split in F; ι_v : G̃(F⁺_v̄) ≅ GL_{2n}(F_v) is the projection to the v-component, under which G(F⁺_v̄) = GL_n(F_{v^c}) × GL_n(F_v) maps to the block diagonal Levi via (D_{v^c}, D_v) ↦ diag(Ψ_n ᵗc(D_{v^c})^{−1}Ψ_n, D_v). Let q̃_v be a Siegel parahoric level with q̃_v ∩ G(F⁺_v̄) = GL_n(O_{F_{v^c}}) × I_v and 𝒮 the localized Satake isomorphism of Lemma 2.1.13 at this level. For every σ ∈ W_{F_v}: 𝒮(P_{v,σ}(X)) = P_{v,σ}(X) (the GL_n(F_v) polynomial (2.2.8) at level I_v) and 𝒮(P_{v^c,σ^{−c}}(X)) = ‖σ‖_v^{n(1−2n)}P_{v^c,σ^{−c}}(‖σ‖_v^{2n−1}X) (the unramified GL_n(F_{v^c}) polynomial). Consequently 𝒮(P̃_{v,σ}(X)) is the same product as in Proposition 2.2.18.

Hypotheses and conventions: q_v ∈ O^×.

Construction or proof:

1. 𝒮 ∘ t = |δ_P|^{−1} on the Levi Hecke algebra (ACC+ §2.1.9); for m = (1, D_v), Ad(m) acts on Lie U by X ↦ XD_v^{−1}, so |δ_P(m)|^{−1} = |det D_v|_v^{n}, which equals ‖σ‖_v^{n} on the support of t_{v,i}(σ), cancelling the twist ‖σ‖_v^{−n} of (2.2.11): 𝒮(t_{v,i}(σ)) = t_{v,i}(σ).
2. For m = (D_{v^c}, 1), Ad(m) acts on Lie U by X ↦ Ψᵗc(D_{v^c})^{−1}ΨX, so |δ_P(m)|^{−1} = |det D_{v^c}|_{v^c}^{n}; on e_{v^c,i}(σ^{−c}), supported in determinant valuation i·deg(σ^{−c}), this is ‖σ^{−c}‖^{in} = ‖σ‖_v^{−in}, which with the twist ‖σ^{−c}‖^{i(n−1)} = ‖σ‖_v^{−i(n−1)} gives 𝒮(e_{v^c,i}(σ^{−c})) = ‖σ‖_v^{−i(2n−1)}e_{v^c,i}(σ^{−c}); summing, 𝒮(P_{v^c,σ^{−c}})(X) = ‖σ‖_v^{n(1−2n)}P_{v^c,σ^{−c}}(‖σ‖_v^{2n−1}X).

Acceptance:

- The degree-n coefficient check: 𝒮(e_{v^c,n}(σ^{−c})) = ‖σ‖_v^{−n(2n−1)}e_{v^c,n}(σ^{−c}), the constant term of ‖σ‖_v^{n(1−2n)}P_{v^c,σ^{−c}}(‖σ‖_v^{2n−1}X) up to the sign (−1)^n.
- n = 1: 𝒮(P_{v^c,σ^{−c}})(X) = X − ‖σ‖_v^{−1}e_{v^c,1}(σ^{−c}).

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-transfer-operators`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-strongly-positive-invertible`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-torus-embedding`, `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`, `SmoothRepresentationsOfLocalGroups:SR.1`.

Sources: ACC23, §2.2.5, Proposition 2.2.19, p. 931 — 𝒮(P_{v,σ}(X)) = P_{v,σ}(X) and 𝒮(P_{v^c,σ^{−c}}(X)) = ‖σ‖^{n(1−2n)}P_{v^c,σ^{−c}}(‖σ‖^{2n−1}X), proved as Proposition 2.2.18.

**Acceptance tests of the layer.** For n = 1, 𝔭_v is the Iwahori subgroup of GL_2(O_{F_v}) and 𝔭_{v,1} its subgroup with lower right entry ≡ 1 mod ϖ_v. For n = 1 and Ã the diagonal {(a, a)} ⊂ (k(v)^×)², ι_v(Ĩ_v̄) is a tame level but Ĩ_v̄ ∩ G is not a product of subgroups of O_{F_{v^c}}^× and O_{F_v}^×. For n = 1, ι_v(g) = diag(ϖ_v, 1) and [𝔮_v g 𝔮_v] is the unit [Iw diag(ϖ_v, 1) Iw] of the Iwahori–Hecke algebra over ℤ[1/q_v]. For n = 1, t_{v,1}(σ) = t(‖σ‖_v^{−1}[I_v α I_v]) and P̃_{v,σ} has degree 2. For Ĩ_v̄ = Ĩw_v̄(0,1) and τ ∈ I_{F_v}, P̃_{v,τ}(X) = (X − 1)^{2n}. n = 1: π̃ ∘ ι_v^{−1} = St_2 ⊗ (χ ∘ det) with χ unramified: P̃_{v,φ}(X) acts by (X − χ(ϖ_v))(X − q_vχ(ϖ_v)). n = 1: 𝒮(P̃_{v,σ})(X) = (X − t_{v,1}(σ))·‖σ‖^{−1}(‖σ‖X − t_{v^c,1}(σ^{−c})). The degree-n coefficient check: 𝒮(e_{v^c,n}(σ^{−c})) = ‖σ‖_v^{−n(2n−1)}e_{v^c,n}(σ^{−c}), the constant term of ‖σ‖_v^{n(1−2n)}P_{v^c,σ^{−c}}(‖σ‖_v^{2n−1}X) up to the sign (−1)^n.

## IHR.4 — The resultant and the inertia relation

Fix a Frobenius lift φ_v ∈ W_{F_v}.

**Targets** (ACC+ §2.2.5, pp. 928–930).
- *The resultant* Res_v ∈ H(G̃(F⁺_v̄), q̃_v) ⊗ O of P_{v^c,φ_v^{−c}}(X) and P_{v,φ_v}(X), computed in the commutative image of t; its Bézout identity, its behaviour under ring maps, and the criterion that its image in a ring is a unit exactly when the images of the two polynomials are coprime.
- *Étaleness away from the resultant*: over a field κ, the algebra of ordered factorizations of a monic polynomial of degree n₁ + n₂ into monic factors of degrees n₁, n₂ is étale at every point where the two factors have unit resultant (the commutative-algebra input cited by ACC+ from Thorne).
- *Proposition 2.2.14*: for π̃ with π̃^{q̃_v} ≠ 0 and T_v̄ the Q̄_p-algebra generated by the e_{v^c,i}(φ_v^{−c}) and e_{v,i}(φ_v), at every maximal ideal 𝔪 of T_v̄ either Res_v ∈ 𝔪, or T_{v̄,𝔪} = Q̄_p and N_vP_{v,φ_v}(r_v(φ_v)) = 0 and (r_v(τ_v) − 1)P_{v,φ_v}(r_v(φ_v)) = 0 for all τ_v ∈ I_{F_v}.
- *Corollary 2.2.15*: for continuous ρ : G_{F_v} → GL_{2n}(Q̄_p) with WD(ρ)^{F-ss} ≅ rec^T_{F_v}(π̃ ∘ ι_v^{−1}), Res_v^{(2n)!}(ρ(τ_v) − 1)P_{v,φ_v}(ρ(φ_v)) = 0 in M_{2n}(T_v̄) for all τ_v ∈ I_{F_v}.

Acceptance: the Steinberg case n = 1 (Π = St_2), where Res_v is a unit and P_{v,φ_v}(r_v(φ_v)) kills the monodromy; and an unramified case, where Res_v vanishes exactly at the two coincident orderings of the Frobenius eigenvalues.

**Dependencies.** Within this roadmap: IntegralHeckeAndGaloisDeterminantsPartII:IHR.3. Other roadmaps: ArithmeticGaloisRepresentations:R01.2, EndoscopicTransferAndUnitaryTraceComparison:ET.6, SmoothRepresentationsOfLocalGroups:SR.2.

**Planets.** Resultant Res_v (`IHR.4/siegel-resultant`); Resultant relation for monodromy and inertia (`IHR.4/resultant-kills-inertia`); Inertia relation for Galois representations (`IHR.4/resultant-inertia-galois`).

### The resultant Res_v

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.4/siegel-resultant` (construction).

In the setting of IHR.3/siegel-transfer-operators fix a Frobenius lift φ_v ∈ W_{F_v}. Let C_v ⊂ H(G̃(F⁺_v̄), q̃_v) ⊗ O be the commutative subring generated by the transferred operators (the image under t of the commutative ring generated by the spherical algebra of GL_n(F_{v^c}) and t(O[Ξ_v])). Define Res_v ∈ C_v as the resultant of the monic polynomials P_{v^c,φ_v^{−c}}(X) and P_{v,φ_v}(X) ∈ C_v[X], i.e. the determinant of their Sylvester matrix (Mathlib Polynomial.resultant). Equivalently Res_v is the image under t of the resultant computed over the commutative Levi algebra.

Hypotheses and conventions: q_v ∈ O^×; Res_v depends on φ_v.

Construction or proof:

1. Mathlib's resultant is defined over a commutative ring; C_v is commutative by siegelOperator_commute, and resultants commute with ring homomorphisms (Polynomial.resultant_map_map), so computing in C_v or in the Levi algebra before applying t gives the same element.

API:

- `siegelResultant` (constructor): Res_v = resultant (P_{v^c,φ_v^{−c}}) (P_{v,φ_v}) ∈ C_v.
- `siegelResultant_map` (functoriality): For a ring map f : C_v → B, f(Res_v) is the resultant of the images (Polynomial.resultant_map_map).
- `siegelResultant_bezout` (relation): There are polynomials A, B over C_v of degrees < n with A·P_{v^c,φ_v^{−c}} + B·P_{v,φ_v} = Res_v (Polynomial.exists_mul_add_mul_eq_C_resultant).
- `isUnit_siegelResultant_iff` (characterisation): For a ring map f : C_v → B, f(Res_v) is a unit iff the images of the two polynomials are coprime in B[X] (Polynomial.isUnit_resultant_iff_isCoprime, both polynomials being monic).
- `siegelResultant_eq_prod_roots` (characterisation): Over a field in which both images split, f(Res_v) = ∏_{a,b}(a − b) over the roots a of P_{v^c,φ_v^{−c}} and b of P_{v,φ_v} (Polynomial.resultant_eq_prod_roots_sub).
- `siegelResultant_satake` (compatibility): 𝒮(Res_v) is the resultant of P_{v,φ_v}(X) and q_v^{n(2n−1)}P^∨_{v^c}(q_v^{1−2n}X) in the Levi algebra, by IHR.3/satake-transform-siegel-level (with ‖φ_v‖_v = q_v^{−1} and P_{v^c,φ_v^{−c}} the reciprocal polynomial P^∨_{v^c} at a Frobenius of v^c).
- `charpoly_factor_range` (relation): If an endomorphism A of a finite-dimensional vector space over a perfect field has characteristic polynomial f·g with f, g coprime (equivalently unit resultant), then range(f(A)) = range(f(A_s)) for the semisimple part A_s of A (Mathlib's Jordan–Chevalley decomposition); this is the linear algebra used in Corollary 2.2.15.

Unit tests:

- `siegelResultant_rank_one` (computation): For n = 1, Res_v = resultant (X − e_{v^c,1}(φ_v^{−c})) (X − t_{v,1}(φ_v)) = e_{v^c,1}(φ_v^{−c}) − t_{v,1}(φ_v) (Mathlib's Polynomial.resultant_X_sub_C_left: resultant (X − a) g = g(a)).
- `siegelResultant_rank_zero` (degenerate): For n = 0 both polynomials are 1 and Res_v = 1.
- `siegelResultant_classical_vanishing` (computation): At a classical unramified point where r_v(φ_v) has eigenvalue multiset {a, a} for n = 1 and both factors take the root a, the image of Res_v is 0; at {a, q_va} with q_v ≠ 1 it is ±(q_v − 1)a ≠ 0.
- `siegelResultant_swap` (non-example): Res_v is not symmetric in the two polynomials: resultant g f = (−1)^{n²}resultant f g, so swapping the factors changes the sign for odd n.
- `siegelResultant_not_discriminant` (non-example): Res_v is not the discriminant of P̃_{v,φ_v}: for n = 1 with P_{v^c,φ_v^{−c}} = X − a and P_{v,φ_v} = X − c, the discriminant of P̃_{v,φ_v} = (X − a)(X − c) is (a − c)², while Res_v = a − c.

Uses: ACC+ Proposition 2.2.14 and Corollary 2.2.15, pp. 928–930 — outside the zero locus of Res_v the operator P_{v,φ_v}(r_v(φ_v)) kills monodromy and inertia; ACC+ Proposition 3.2.2(3) and Corollary 3.2.3(3), pp. 958–960 — Res_v^{(2n)!} multiplies the trace relation at v ∈ R − R^c; ACC+ proof of Proposition 3.1.2, p. 964 — 𝒮(Res_v) is a unit in T^T_R(K, 0)_𝔪 by the separation hypothesis of Lemma 3.2.1(2).

Acceptance:

- For n = 1, Res_v = e_{v^c,1}(φ_v^{−c}) − t_{v,1}(φ_v).

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-transfer-operators`, `mathlib:Polynomial.resultant`, `mathlib:Polynomial.resultant_map_map`, `mathlib:Polynomial.isUnit_resultant_iff_isCoprime`, `mathlib:Polynomial.exists_mul_add_mul_eq_C_resultant`, `mathlib:Polynomial.resultant_eq_prod_roots_sub`.

Sources: ACC23, §2.2.5, p. 928 — Having fixed a Frobenius lift φ_v, Res_v ∈ H(G̃(F⁺_v̄), q̃_v) ⊗ O is the resultant of P_{v^c,φ_v^{−c}}(X) and P_{v,φ_v}(X). Tho22, §2, the resultant Res_{n1,n2}, p. 5 — The universal resultant of two monic polynomials with coefficients the elementary symmetric functions of two blocks of variables, equal to ∏(x_i − x_{n1+j}).

### The factorization algebra is étale away from the resultant

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.4/factorization-etale` (theorem).

Let n₁, n₂ ≥ 0, n = n₁ + n₂, A = ℤ[s_1, …, s_n] and B = ℤ[a_1, …, a_{n₁}, b_1, …, b_{n₂}], with A → B sending the coefficients of the generic monic polynomial F(X) = X^n + Σs_kX^{n−k} to those of F_1(X)F_2(X), F_1 = X^{n₁} + Σa_iX^{n₁−i}, F_2 = X^{n₂} + Σb_jX^{n₂−j}. Then B is finite free over A, and Spec B → Spec A is étale exactly away from the zero locus of Res_{n₁,n₂} = resultant(F_1, F_2). In particular, for a field κ, a κ-point of A (a monic f ∈ κ[X] of degree n) and a maximal ideal 𝔪 of B ⊗_A κ (an ordered factorization f = f_1f_2 over a finite extension) with resultant(f_1, f_2) ∉ 𝔪, the localization (B ⊗_A κ)_𝔪 is a finite separable field extension of κ, equal to κ when κ is algebraically closed.

Hypotheses and conventions: κ a field; for κ algebraically closed the conclusion is (B ⊗_A κ)_𝔪 = κ.

Construction or proof:

1. B ≅ (ℤ[x_1, …, x_n]^{S_{n₁}×S_{n₂}}) and A ≅ ℤ[x]^{S_n} (fundamental theorem of symmetric polynomials); ℤ[x] is free over both, so B is finite free over A of rank binom(n, n₁) (Thorne Lemma 2.1).
2. Over κ, the tangent space of the fibre at f = f_1f_2 is the kernel of the Sylvester map (g_1, g_2) ↦ g_1f_2 + f_1g_2 on pairs with deg g_i < n_i; its determinant is resultant(f_1, f_2), so the tangent space vanishes iff the resultant is nonzero (Mathlib's Sylvester-matrix description of the resultant).
3. A finite κ-algebra whose localization has zero tangent space at 𝔪 is a field at 𝔪, separable over κ; with flatness of A → B this is étaleness at the points where the resultant is a unit (Thorne Proposition 2.3).

Acceptance:

- n₁ = n₂ = 1, f = (X − a)(X − b) over κ = ℚ̄: B ⊗ κ = κ × κ when a ≠ b, and κ[ε]/(ε²) when a = b, where the resultant vanishes.

Direct prerequisites: `mathlib:Polynomial.resultant`, `mathlib:Polynomial.isUnit_resultant_iff_isCoprime`, `mathlib:Polynomial.exists_mul_add_mul_eq_C_resultant`.

Sources: Tho22, §2, Lemma 2.1 and Propositions 2.2–2.3, pp. 4–6 — B = R_1^{S_{n1}} ⊗ R_2^{S_{n2}} is finite free over A; the resultant generates the Noether different (via the Jacobian of the coefficient map), and Spec B → Spec A is étale away from Res_{n1,n2} = 0. ACC23, §2.2.5, proof of Proposition 2.2.14, p. 929 — ACC+ combines [Tho21, Prop. 2.2] with Lemma 2.2.13 to deduce T′_{v,𝔪} = T′_v/𝔪 = Q̄_p at maximal ideals not containing Res_v.

### Outside Res_v, P_{v,φ_v}(r_v(φ_v)) kills monodromy and inertia (Proposition 2.2.14)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.4/resultant-kills-inertia` (theorem).

In the setting of IHR.3/siegel-transfer-operators, let π̃ be an irreducible admissible Q̄_p[G̃(F⁺_v̄)]-module with π̃^{q̃_v} ≠ 0, (r_v, N_v) = rec^T_{F_v}(π̃ ∘ ι_v^{−1}), and T_v̄ ⊂ End_{Q̄_p}(π̃^{q̃_v}) the Q̄_p-subalgebra generated by the images of the e_{v^c,i}(φ_v^{−c}) and e_{v,i}(φ_v). Then for each maximal ideal 𝔪 ⊂ T_v̄, either Res_v ∈ 𝔪, or Res_v ∉ 𝔪, T_{v̄,𝔪} = T_v̄/𝔪 = Q̄_p, and for all τ_v ∈ I_{F_v}: N_vP_{v,φ_v}(r_v(φ_v)) = 0 and (r_v(τ_v) − 1)P_{v,φ_v}(r_v(φ_v)) = 0 in M_{2n}(T_v̄/𝔪) = M_{2n}(Q̄_p), where P_{v,φ_v} is read modulo 𝔪.

Hypotheses and conventions: ℓ ≠ p; φ_v a fixed Frobenius lift; the root formulas in the proof are read with the corrections of the sourceIssues (the conclusion is unaffected).

Construction or proof:

1. Fix ι : Q̄_p ≅ ℂ. With rec^T(St_m) = Sp_m (Frobenius acting on e_i by |·|^{1−i}, N e_i = e_{i−1}), π̃^{q̃_v} ≠ 0 forces (r_v, N_v) ≅ ⊕_{i=1}^{s}Sp_{α_i}(ψ_i|·|^{(1−2n)/2+(α_i−1)/2}) with ψ_i tamely ramified, and π̃ ∘ ι_v^{−1} is a subquotient of Π = n-Ind_{P_α}^{GL_{2n}} ⊗_iSt_{α_i}(ψ_i ∘ Art) (EndoscopicTransferAndUnitaryTraceComparison ET.6); replace T_v̄ by the algebra T′_v̄ acting on Π̃^{q̃_v}, of which it is a quotient.
2. Geometric lemma (SmoothRepresentationsOfLocalGroups SR.2): r_P(Π̃) is filtered by σ_μ indexed by μ = (μ_{1j}, μ_{2j}) with μ_{1j} + μ_{2j} = α_j and Σ_jμ_{ij} = n; the maximal ideals of T′_v̄ correspond to the factorizations P̃_{v,φ_v} = P_{v^c,φ_v^{−c}}P_{v,φ_v} occurring, P_{v^c} taking the top μ_{1j} and P_v the bottom μ_{2j} Frobenius eigenvalues of each segment; only μ_{1j} ∈ {0, 1} contribute GL_n(O_{F_{v^c}})-invariants.
3. If Res_v ∉ 𝔪, the factorization is coprime, and IHR.4/factorization-etale with Lemma 2.2.13 (IHR.3/siegel-transfer-local-langlands) gives T′_{v̄,𝔪} = T′_v̄/𝔪 = Q̄_p.
4. With Q(X) = P_{v,φ_v}(X) mod 𝔪: on the summand Sp_{α_j}, Q(r_v(φ_v)) is zero if μ_{1j} = 0, and if μ_{1j} = 1 it kills e_2, …, e_{α_j} (the bottom eigenvalues, roots of Q) and has image the line spanned by the top vector e_1, which N_v kills; when μ_{1j} = 1 the GL_n(F_{v^c})-component of σ_μ must be spherical, so ψ_j is unramified and r_v(τ_v) acts trivially on the whole summand. Both identities follow.

Acceptance:

- n = 1, π̃ ∘ ι_v^{−1} = St_2: (r_v, N_v) = Sp_2, μ = (1, 1), Res_v is a unit, and P_{v,φ_v}(r_v(φ_v)) has image the line spanned by e_1, killed by N_v.
- n = 1, π̃ unramified with Frobenius eigenvalues a, b: Res_v ∈ 𝔪 exactly at the orderings where the two roots coincide.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.4/siegel-resultant`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.4/factorization-etale`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-transfer-local-langlands`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-transfer-operators`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `SmoothRepresentationsOfLocalGroups:SR.2`.

Sources: ACC23, §2.2.5, Proposition 2.2.14 and its proof, pp. 928–929 — Either Res_v ∈ 𝔪, or T_{v̄,𝔪} = Q̄_p and P_{v,φ_v}(r_v(φ_v)) kills N_v and r_v(τ_v) − 1; the proof uses rec^T(St_m) = Sp_m, the geometrical lemma, [Tho21, Prop. 2.2] and Lemma 2.2.13.

### The inertia relation for Galois representations (Corollary 2.2.15)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.4/resultant-inertia-galois` (theorem).

Let π̃ be an irreducible admissible Q̄_p[G̃(F⁺_v̄)]-module with π̃^{q̃_v} ≠ 0 and ρ : G_{F_v} → GL_{2n}(Q̄_p) continuous with WD(ρ)^{F-ss} ≅ rec^T_{F_v}(π̃ ∘ ι_v^{−1}); let T_v̄ be as in Proposition 2.2.14. Then for all τ_v ∈ I_{F_v}, Res_v^{(2n)!}(ρ(τ_v) − 1)P_{v,φ_v}(ρ(φ_v)) = 0 in M_{2n}(Q̄_p) ⊗_{Q̄_p} T_v̄ = M_{2n}(T_v̄).

Hypotheses and conventions: ℓ ≠ p; WD and Frobenius semisimplification as in ArithmeticGaloisRepresentations R01.2.

Construction or proof:

1. Work one maximal ideal of T_v̄ at a time. dim_{Q̄_p}T_v̄ ≤ (2n)! (a crude bound, T_v̄ being generated by the coefficients of an ordered factorization of a degree-2n polynomial), so Res_v^{(2n)!}T_{v̄,𝔪} = 0 when Res_v ∈ 𝔪.
2. If Res_v ∉ 𝔪, let Q = P_{v,φ_v} mod 𝔪 and ρ(φ_v) = su its multiplicative Jordan decomposition, with r_v(φ_v) = s (definition of Frobenius semisimplification). Since the factorization of the characteristic polynomial is coprime, Q(ρ(φ_v)) and Q(s) have the same image, the sum of the generalized eigenspaces for eigenvalues that are not roots of Q (Res_v's charpoly_factor_range).
3. N_vQ(s) = 0 (Proposition 2.2.14), so ρ(τ_v) and r_v(τ_v) agree on that image (Grothendieck's monodromy theorem, R01.2), and (ρ(τ_v) − 1)Q(ρ(φ_v)) = (r_v(τ_v) − 1)Q(r_v(φ_v)) = 0.

Acceptance:

- n = 1, ρ attached to St_2 (ρ(τ) = exp(t_ℓ(τ)N)): Res_v is a unit and (ρ(τ_v) − 1)P_{v,φ_v}(ρ(φ_v)) = 0 because P_{v,φ_v}(ρ(φ_v)) has image ker N.
- If π̃ is unramified at v (q̃_v-invariants coming from GL_{2n}(O_{F_v})-invariants), ρ(τ_v) = 1 and the relation holds without the factor Res_v^{(2n)!}.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.4/resultant-kills-inertia`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.4/siegel-resultant`, `ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`, `mathlib:Module.End.exists_isNilpotent_isSemisimple`.

Sources: ACC23, §2.2.5, Corollary 2.2.15 and its proof, p. 930 — Res_v^{(2n)!}(ρ(τ_v) − 1)P_{v,φ_v}(ρ(φ_v)) = 0 in M_{2n}(T_v̄); (2n)! is a crude upper bound for dim T_v̄, and outside Res_v the images of Q(ρ(φ_v)) and Q(r_v(φ_v)) coincide.

**Acceptance tests of the layer.** For n = 1, Res_v = e_{v^c,1}(φ_v^{−c}) − t_{v,1}(φ_v). n₁ = n₂ = 1, f = (X − a)(X − b) over κ = ℚ̄: B ⊗ κ = κ × κ when a ≠ b, and κ[ε]/(ε²) when a = b, where the resultant vanishes. n = 1, π̃ ∘ ι_v^{−1} = St_2: (r_v, N_v) = Sp_2, μ = (1, 1), Res_v is a unit, and P_{v,φ_v}(r_v(φ_v)) has image the line spanned by e_1, killed by N_v. n = 1, ρ attached to St_2 (ρ(τ) = exp(t_ℓ(τ)N)): Res_v is a unit and (ρ(τ_v) − 1)P_{v,φ_v}(ρ(φ_v)) = 0 because P_{v,φ_v}(ρ(φ_v)) has image ker N.

## IHR.5 — Ramified Hecke algebras of arithmetic complexes

Let F be a CM field containing an imaginary quadratic field, p a prime such that every p-adic place of F⁺ splits in F (ACC+ §3.1), S = S^c a finite set of finite places containing the p-adic ones, R ⊂ S a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F, K ⊂ GL_n(A_F^∞) good with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R, and T = S − (R^c − R).

**Targets.**
- *The ramified Hecke algebra* T^T_R ⊂ H(GL_n(A_F^∞), K) ⊗ O, the commutative O-subalgebra generated by the spherical algebra T^T and all t_{v,i}(σ) (v ∈ R, σ ∈ W_{F_v}); its image T^T_R(C) in End_{D(O)}(C) for a complex C with a Hecke action (ALS.3, IHG.2), T^T_R(K, λ) = T^T_R(RΓ(X_K, 𝒱_λ)), the inclusions T^S(K, λ) ⊆ T^T(K, λ) ⊆ T^T_R(K, λ), finiteness over O, the identification with the inverse limit over the coefficients 𝒱_λ/ϖ^m, and the localization T^T_R(K, λ)_𝔪 at a maximal ideal 𝔪 of T^S(K, λ) as a T^S(K, λ)-algebra (semilocal, not local in general).
- *The unitary ramified Hecke algebra* T̃^T_R generated by T̃^S, the operators of IHR.3 at v ∈ R and the transferred spherical operators at v ∈ R^c − R, with its images on RΓ_c, RΓ and the Borel–Serre boundary of X̃_K̃.
- *The ramified Satake homomorphism* 𝒮 : T̃^T_R → T^T_R extending (2.2.3) through Lemma 2.1.13, with its values on P̃_v, P̃_{v,σ}, P_{v,σ}, P_{v^c,σ^{−c}} and Res_v.
- *Twisting* by a character ψ with ψ ∘ Art_F ∘ det trivial on K: f_ψ(t_{v,i}(σ)) = ψ(σ)^{−1}t_{v,i}(σ), the induced isomorphisms of ramified Hecke algebras and the twisted Hecke polynomials.
- *Duality*: ι̃ descends to an isomorphism ι̃(T̃^T_R)(RΓ_c(X̃_K̃, O)) ≅ T̃^T_R(RΓ(X̃_K̃, O)).
- *Change of level*: for K′ ⊲ K differing at R (with K′_v = Iw_{v,1}), at an auxiliary prime q and at p, the diagram T^{T′}_R(K′, λ) ← T^{T′}_R(K/K′, λ) ↠ T^{T′}_R(K, λ) → T^T_R(K, λ) with left kernel of nilpotence exponent bounded in terms of n and [F : ℚ].

**Dependencies.** Within this roadmap: IntegralHeckeAndGaloisDeterminantsPartII:IHR.1, IntegralHeckeAndGaloisDeterminantsPartII:IHR.3, IntegralHeckeAndGaloisDeterminantsPartII:IHR.4. Other roadmaps: IntegralHeckeAndGaloisDeterminants:IHG.2, IntegralHeckeAndGaloisDeterminants:IHG.3, ArithmeticLocallySymmetricSpaces:ALS.1, ArithmeticLocallySymmetricSpaces:ALS.3, ArithmeticLocallySymmetricSpaces:ALS.4, ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality, ArithmeticLocallySymmetricSpaces:ALS.6, TorsionCohomologyInfrastructure:TC.3, SmoothRepresentationsOfLocalGroups:SR.1.

**Planets.** Ramified Hecke algebra T^T_R(K, λ) (`IHR.5/ramified-hecke-algebra`); Unitary ramified Hecke algebra T̃^T_R (`IHR.5/unitary-ramified-hecke-algebra`); Ramified Satake homomorphism (`IHR.5/ramified-satake-homomorphism`).

### The ramified Hecke algebras T^T_R and T^T_R(K, λ)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-hecke-algebra` (definition).

Setting of ACC+ §3.1: F is a CM field containing an imaginary quadratic field, p a prime, E/ℚ_p finite containing the images of all embeddings of F, with ring of integers O, uniformizer ϖ and residue field k, and every p-adic place of F⁺ splits in F; K ⊂ GL_n(A_F^∞) is a good subgroup, λ ∈ (ℤ^n_+)^{Hom(F,E)}, and S is a finite set of finite places of F containing the p-adic ones with S = S^c and such that for every finite v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. R ⊂ S is a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F (so each v ∈ R is split over F⁺), with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R; T = S − (R^c − R). Define T^T_R ⊂ H(GL_n(A_F^∞), K) ⊗_ℤ O as the O-subalgebra generated by the spherical algebra T^T = H(GL_n^T, K^T) ⊗ O and all t_{v,i}(σ) (v ∈ R, σ ∈ W_{F_v}, 1 ≤ i ≤ n), the operators of IHR.1 at the tame level K_v placed in the v-factor; it is commutative. For a complex C ∈ D(O) with an O-algebra homomorphism H(GL_n(A_F^{∞,S_p}), K^{S_p}) ⊗ O → End_{D(O)}(C), let T^T_R(C) be the image of T^T_R. Put T^T_R(K, λ) = T^T_R(RΓ(X_K, 𝒱_λ)) ⊂ End_{D(O)}(RΓ(X_K, 𝒱_λ)), the action being that of ArithmeticLocallySymmetricSpaces ALS.3 (the coefficient module 𝒱_λ carries only a K_p-action, so the Hecke algebra away from S_p acts). Then T^S(K, λ) ⊆ T^T(K, λ) ⊆ T^T_R(K, λ) are finite commutative O-algebras. For a maximal ideal 𝔪 ⊂ T^S(K, λ), T^T_R(K, λ)_𝔪 = T^T_R(K, λ) ⊗_{T^S(K,λ)} T^S(K, λ)_𝔪 is the localization as a T^S(K, λ)-algebra: a finite semilocal O-subalgebra of End_{D(O)}(RΓ(X_K, 𝒱_λ)_𝔪) containing T^S(K, λ)_𝔪.

Hypotheses and conventions: the setting of ACC+ §3.1 recalled in the statement; 𝔪 is a maximal ideal of T^S(K, λ), not of T^T_R(K, λ).

Construction or proof:

1. The operators t_{v,i}(σ) at different places commute (different tensor factors), at the same place commute (image of the commutative O[Ξ_v]), and commute with T^T (disjoint support), so T^T_R is commutative.
2. ALS.3/derived-hecke-action gives H(GL_n(A_F^{∞,S_p}), K^{S_p}) ⊗ O → End_{D(O)}(RΓ(X_K, 𝒱_λ)), since 𝒱_λ is an O[K_p]-module; T^T_R(K, λ) is the derived Hecke image of IntegralHeckeAndGaloisDeterminants IHG.2/derived-hecke-image, finite over O by IHG.2/derived-hecke-image-finite (RΓ(X_K, 𝒱_λ) has bounded finite cohomology, ALS.1).
3. T^T_R(K, λ) is finite over T^S(K, λ) ⊆ it, so its localization at 𝔪 is finite over the complete local ring T^S(K, λ)_𝔪, hence a finite product of complete local rings (IHG.2/finite-hecke-local-factors), acting on the summand RΓ(X_K, 𝒱_λ)_𝔪 of ALS.4/localization-at-maximal-ideal.

API:

- `ramifiedHeckeAlgebra` (constructor): T^T_R as an O-subalgebra of H(GL_n(A_F^∞), K) ⊗ O generated by T^T and the t_{v,i}(σ), v ∈ R.
- `ramifiedHeckeAlgebra.commRing` (instance): T^T_R is commutative.
- `ramifiedHeckeImage` (constructor): T^T_R(C) = image of T^T_R in End_{D(O)}(C) for a complex C with a prime-to-p Hecke action (IHG.2's derived Hecke image).
- `ramifiedHeckeImage.finite` (instance): T^T_R(C) is a finite O-algebra when C has bounded finite cohomology.
- `ramifiedHeckeImage.spherical_le` (relation): T^S(C) ⊆ T^T(C) ⊆ T^T_R(C) as O-subalgebras of End_{D(O)}(C).
- `ramifiedHeckeImage.localization` (constructor): T^T_R(C)_𝔪 := T^T_R(C) ⊗_{T^S(C)} T^S(C)_𝔪 for a maximal ideal 𝔪 ⊂ T^S(C), with T^T_R(C)_𝔪 ≅ T^T_R(C_𝔪).
- `ramifiedHeckeImage.localization_semilocal` (characterisation): T^T_R(C)_𝔪 is a finite product of complete local O-algebras indexed by the maximal ideals of T^T_R(C) above 𝔪.
- `ramifiedHeckeImage.toCohomology` (relation): The surjection T^T_R(C) → T^T_R(H^*(C)) has nilpotent kernel, of exponent at most the length of the amplitude of C (IHG.2/ghost-nilpotence).
- `ramifiedHeckeImage.limit` (characterisation): T^T_R(K, λ) ≅ lim_m T^T_R(RΓ(X_K, 𝒱_λ/ϖ^m)) (ALS.3/derived-hecke-algebra, limit form).
- `ramifiedHeckeImage.map` (functoriality): A Hecke-equivariant morphism C → C′ that is a split monomorphism (resp. epimorphism) in D(O) induces T^T_R(C′) ↠ T^T_R(C) (resp. T^T_R(C) ↠ T^T_R(C′)) compatibly with the generators.

Unit tests:

- `ramifiedHeckeAlgebra_empty` (degenerate): For R = ∅ (so T = S), ramifiedHeckeAlgebra = T^S and T^T_R(K, λ) = T^S(K, λ).
- `ramifiedHeckeAlgebra_rank_one` (computation): For n = 1, T^T_R(K, λ) is the image of the group algebra O[F^× \ A_F^{∞,×}/K] acting by translation, the generator t_{v,1}(σ) acting as translation by the idele α_v with Art_{F_v}(α_v) = σ|_{F_v^{ab}} at v ∈ R.
- `ramifiedHeckeAlgebra_spherical_image` (compatibility): The subalgebra of T^T_R(K, λ) generated by the image of T^T is ACC+'s T^T(K, λ), and that generated by the image of T^S is T^S(K, λ) (ALS.3/derived-hecke-algebra).
- `ramifiedHeckeAlgebra_not_local` (non-example): If n = 2, v ∈ R with K_v = Iw_{v,1}, and ρ̄_𝔪|_{W_{F_v}} is a sum of two characters with distinct values at φ_v, then T^T_R(K, λ)_𝔪 has two maximal ideals above 𝔪, distinguished by the residual value of t_{v,1}(φ_v); it is not local.

Uses: ACC+ Theorem 3.1.1 and Proposition 3.1.2, p. 954 — the coefficient ring T^T_R(K, λ)_𝔪/I_R of the Galois representation and of the determinant; ACC+ Lemma 3.2.1, pp. 955–957 — the Hecke algebras whose change of level, weight and twist are compared; PotentialAutomorphyInfrastructure:PA.3/fontaine-laffaille-deformation-hecke-map — Proposition 6.5.3 applies Theorem 3.1.1 with R = S − S_p; PotentialAutomorphyInfrastructure:PA.4/diamond-linear-deformation-hecke-map — Proposition 6.5.11 applies Theorem 3.1.1 at the Taylor–Wiles places Q ⊂ R.

Acceptance:

- R = ∅ gives T = S and T^T_R(K, λ) = T^S(K, λ).
- T^T_R(K, λ)_𝔪 can have several maximal ideals above 𝔪 (see the non-example test).

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-hecke-operators`, `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image`, `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image-finite`, `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors`, `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`, `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra`, `ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal`, `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`, `mathlib:NumberField.IsCMField`.

Sources: ACC23, §3.1, pp. 953–954 — Setting of §3, definition of T^T_R as the commutative O-subalgebra generated by T^T and the t_{v,i}(σ), of T^T_R(K, λ) as its image in End_{D(O)}(RΓ(X_K, 𝒱_λ)), the inclusions T^S(K,λ) ⊂ T^T(K,λ) ⊂ T^T_R(K,λ), and of T^T_R(K, λ)_𝔪 as the localization as a T^S(K, λ)-algebra. ACC23, §2.2.1, pp. 919–920 — The Hecke algebras T^S(K, 𝒱) and T^S(C^•) as images of Hecke algebras in derived endomorphism rings. ACC23, §3.2, proof of Proposition 3.1.2, p. 963 — 𝔪 is a maximal ideal of T^S(K, 0), so T^T_R(K, 0)_𝔪 is not necessarily local.

### The unitary ramified Hecke algebras T̃^T_R

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/unitary-ramified-hecke-algebra` (definition).

Setting of ACC+ §3.1: F is a CM field containing an imaginary quadratic field, p a prime, E/ℚ_p finite containing the images of all embeddings of F, with ring of integers O, uniformizer ϖ and residue field k, and every p-adic place of F⁺ splits in F; K ⊂ GL_n(A_F^∞) is a good subgroup, λ ∈ (ℤ^n_+)^{Hom(F,E)}, and S is a finite set of finite places of F containing the p-adic ones with S = S^c and such that for every finite v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. R ⊂ S is a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F (so each v ∈ R is split over F⁺), with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R; T = S − (R^c − R). Let K̃ ⊂ G̃(A^∞_{F⁺}) be a good subgroup, decomposed with respect to P, with K̃ ∩ G(A^∞_{F⁺}) = K, K̃_v̄ a Siegel parahoric level q̃_v for each v ∈ R − R^c (v̄ = v|_{F⁺}) and K̃_v̄ a block-decomposable unitary tame level Ĩ_v̄ for each v ∈ R ∩ R^c, and hyperspecial outside S. Define T̃^T_R ⊂ H(G̃(A^∞_{F⁺}), K̃) ⊗ O as the O-subalgebra generated by T̃^S, the operators t_{v,i}(σ) (v ∈ R, σ ∈ W_{F_v}) — the transferred operators of IHR.3/siegel-transfer-operators when v ∈ R − R^c, and the operators ι_v^{−1}(t_{v,i}(σ)), 1 ≤ i ≤ 2n, of IHR.3/unitary-tame-hecke-polynomial when v ∈ R ∩ R^c — and the e_{v,i}(σ) (v ∈ R^c − R, σ ∈ W_{F_v}), the transferred spherical operators at the level q̃_{v^c}. It is commutative. For C ∈ {RΓ_c(X̃_K̃, O), RΓ(X̃_K̃, O), RΓ(∂X̃_K̃, O)}, with the action of the full Hecke algebra H(G̃(A^∞_{F⁺}), K̃) ⊗ O (trivial coefficients), let T̃^T_R(C) be the image of T̃^T_R in End_{D(O)}(C).

Hypotheses and conventions: trivial coefficients O, so the full Hecke algebra acts (ALS.3); K̃_v̄ as stated at the places below R.

Construction or proof:

1. Operators at distinct places of F⁺ commute; at a place below R − R^c all generators lie in the commutative ring C_v of IHR.4/siegel-resultant; at a place below R ∩ R^c they lie in the image of the commutative tame torus algebra of GL_{2n}; so T̃^T_R is commutative.
2. ALS.3/derived-hecke-action and ALS.4/boundary-triangle give compatible actions on the three complexes; the images are finite O-algebras (IHG.2/derived-hecke-image-finite).

API:

- `unitaryRamifiedHeckeAlgebra` (constructor): T̃^T_R ⊂ H(G̃(A^∞_{F⁺}), K̃) ⊗ O.
- `unitaryRamifiedHeckeAlgebra.commRing` (instance): T̃^T_R is commutative.
- `unitaryRamifiedHeckeImage` (constructor): T̃^T_R(C) for C = RΓ_c, RΓ or RΓ(∂·) of X̃_K̃ with coefficients O.
- `unitaryRamifiedHeckeImage.finite` (instance): Each T̃^T_R(C) is a finite O-algebra.
- `unitaryRamifiedHeckeImage.triangle_equivariant` (compatibility): The boundary triangle of ALS.4 is T̃^T_R-equivariant.
- `unitaryRamifiedHeckeAlgebra.fullPoly` (data): P̃_{v,σ}(X) ∈ T̃^T_R[X] for v ∈ R, monic of degree 2n, and Res_v ∈ T̃^T_R for v ∈ R − R^c.
- `unitaryRamifiedHeckeImage.localization` (constructor): For 𝔪̃ = 𝒮^*(𝔪) ⊂ T̃^S, the localization T̃^T_R(C)_𝔪̃ acting on C_𝔪̃.

Unit tests:

- `unitaryRamifiedHeckeAlgebra_empty` (degenerate): For R = ∅, unitaryRamifiedHeckeAlgebra = T̃^S.
- `unitaryRamifiedHeckeAlgebra_split_both` (computation): If R = R^c, every generator at a place below R is ι_v^{−1} of a GL_{2n} tame operator, and the generators at v and at v^c generate the same algebra (unitaryTamePoly_conj).
- `unitaryRamifiedHeckeAlgebra_contains_resultant` (compatibility): For v ∈ R − R^c, Res_v ∈ T̃^T_R, so Res_v^{(2n)!} acts on each T̃^T_R(C).
- `unitaryRamifiedHeckeAlgebra_siegel_not_tame` (non-example): For v ∈ R − R^c and n ≥ 2, the generators at v̄ are not images under ι_v^{−1} of GL_{2n} tame operators: q̃_v is not a unitary tame level.

Uses: ACC+ Proposition 3.2.2 and Corollary 3.2.3, pp. 958–961 — the coefficient rings of the 2n-dimensional determinants with conditions at R; PotentialAutomorphyInfrastructure:PA.0/ramified-satake-descent — Theorem 2.4.8 descends 𝒮 : T̃^T_R → T^T_R to the localized boundary Hecke algebra.

Acceptance:

- R = ∅ gives T̃^T_R = T̃^S.
- The boundary triangle RΓ_c → RΓ → RΓ_∂ → is T̃^T_R-equivariant.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-transfer-operators`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/unitary-tame-hecke-polynomial`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-parahoric-level`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/unitary-tame-level`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.4/siegel-resultant`, `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image`, `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image-finite`, `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`, `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`.

Sources: ACC23, §2.4.1, statement of Theorem 2.4.8, pp. 946–947 — T̃^T_R ⊂ H(G̃(A^∞_{F⁺}), K̃) ⊗ O is the commutative O-subalgebra generated by T̃^S, the t_{v,i}(σ) (v ∈ R) and the e_{v,i}(σ) (v ∈ R^c − R). ACC23, §3.2, pp. 957–958 — The same algebra for the level K̃ of Lemma 3.2.1(5), acting on RΓ_c, RΓ and the boundary of X̃_K̃.

### The ramified Satake homomorphism 𝒮 : T̃^T_R → T^T_R

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-satake-homomorphism` (construction).

In the setting of IHR.5/unitary-ramified-hecke-algebra, the unnormalized Satake map 𝒮 = r_G ∘ r_P (ACC+ (2.1.8), ArithmeticLocallySymmetricSpaces ALS.4) at the places outside R ∪ R^c, together with the localized Satake isomorphisms of Lemma 2.1.13 at the places below R (at levels q̃_v and Ĩ_v̄), restricts to an O-algebra homomorphism 𝒮 : T̃^T_R → T^T_R with: 𝒮(P̃_v(X)) = P_v(X)q_v^{n(2n−1)}P^∨_{v^c}(q_v^{1−2n}X) for v ∉ S (Proposition 2.2.16); 𝒮(P̃_{v,σ}(X)) = P_{v,σ}(X)‖σ‖_v^{n(1−2n)}P_{v^c,σ^{−c}}(‖σ‖_v^{2n−1}X) for v ∈ R and σ ∈ W_{F_v} (Propositions 2.2.18–2.2.19); 𝒮(P_{v,σ}) = P_{v,σ} for v ∈ R − R^c; and 𝒮(Res_v) is the resultant of P_{v,φ_v}(X) and q_v^{n(2n−1)}P^∨_{v^c}(q_v^{1−2n}X) for v ∈ R − R^c. Here f^∨(X) = a_0^{−1}X^{deg f}f(X^{−1}) for f with unit constant term a_0.

Hypotheses and conventions: q_v ∈ O^× for v ∈ R ∪ R^c; ‖φ_v‖_v = q_v^{−1} for a geometric Frobenius lift φ_v.

Construction or proof:

1. At v ∉ S, 𝒮 is the unramified Satake map (2.2.3) with the formula of Proposition 2.2.16, imported from TorsionCohomologyInfrastructure TC.3.
2. At v̄ below R, Lemma 2.1.13 (SmoothRepresentationsOfLocalGroups SR.1) gives 𝒮 on the localization at the strongly positive element of IHR.3/siegel-strongly-positive-invertible, and the generators of T̃^T_R at v̄ lie in that localization; Propositions 2.2.18–2.2.19 (IHR.3) compute their images, which are the generators of T^T_R at v (and, at v^c ∈ R^c − R, spherical operators lying in T^T).
3. Resultants commute with ring homomorphisms; 𝒮(P_{v^c,φ_v^{−c}}) = ‖φ_v‖^{n(1−2n)}P_{v^c,φ_v^{−c}}(‖φ_v‖^{2n−1}X) = q_v^{n(2n−1)}P^∨_{v^c}(q_v^{1−2n}X), using that P_{v^c,φ_v^{−c}} is the reciprocal of the Frobenius polynomial at v^c.

API:

- `ramifiedSatake` (constructor): 𝒮 : T̃^T_R →ₐ[O] T^T_R.
- `ramifiedSatake_unramified` (simp): 𝒮(P̃_v(X)) = P_v(X)q_v^{n(2n−1)}P^∨_{v^c}(q_v^{1−2n}X) for v ∉ S.
- `ramifiedSatake_fullPoly` (simp): 𝒮(P̃_{v,σ}(X)) = P_{v,σ}(X)‖σ‖_v^{n(1−2n)}P_{v^c,σ^{−c}}(‖σ‖_v^{2n−1}X) for v ∈ R.
- `ramifiedSatake_siegelPoly` (simp): 𝒮(P_{v,σ}) = P_{v,σ} for v ∈ R − R^c.
- `ramifiedSatake_resultant` (simp): 𝒮(Res_v) = resultant(P_{v,φ_v}, q_v^{n(2n−1)}P^∨_{v^c}(q_v^{1−2n}X)) for v ∈ R − R^c.
- `ramifiedSatake_restrict_spherical` (compatibility): 𝒮 restricts to (2.2.3) on T̃^S.
- `ramifiedSatake_positive` (structure): 𝒮 maps the positive part T̃^T_{R,+} (supported in the positive monoids at R ∪ R^c) into T^T_{R,+}, and T̃^T_R = T̃^T_{R,+}[z^{−1}] for a product z of strongly positive elements.

Unit tests:

- `ramifiedSatake_empty` (degenerate): For R = ∅, ramifiedSatake = 𝒮 : T̃^S → T^S of (2.2.3).
- `ramifiedSatake_rank_one` (computation): For n = 1, v ∈ R and σ ∈ W_{F_v}: 𝒮(P̃_{v,σ})(X) = (X − t_{v,1}(σ))(X − ‖σ‖_v^{−1}e_{v^c,1}(σ^{−c})).
- `ramifiedSatake_frobenius_rank_one` (computation): For n = 1, v ∉ S: 𝒮(P̃_v)(X) = (X − T_{v,1})(X − q_vT_{v^c,1}^{−1}).
- `ramifiedSatake_not_normalized` (non-example): 𝒮 is the unnormalized transform: 𝒮(P̃_v) ≠ P_v·P^∨_{v^c} in general; for n = 1 the second factor is X − q_vT_{v^c,1}^{−1}, not X − T_{v^c,1}^{−1}.

Uses: PotentialAutomorphyInfrastructure:PA.0/ramified-satake-descent — Theorem 2.4.8 descends this map to T̃^T_R(RΓ(∂X̃_K̃, O)_𝔪̃) → T^T_R(RΓ(X_K, O)_𝔪); ACC+ proof of Proposition 3.1.2, pp. 962–964 — pushes D̃_{∂,R} forward to D′ and computes its characteristic polynomials and 𝒮(Res_v).

Acceptance:

- For R = ∅, 𝒮 is the map (2.2.3).
- For n = 1 and v ∈ R, 𝒮(P̃_{v,σ})(X) = (X − t_{v,1}(σ))(X − ‖σ‖_v^{−1}e_{v^c,1}(σ^{−c})).

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/unitary-ramified-hecke-algebra`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-hecke-algebra`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/satake-transform-tame-level`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/satake-transform-siegel-level`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.4/siegel-resultant`, `TorsionCohomologyInfrastructure:TC.3`, `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`, `SmoothRepresentationsOfLocalGroups:SR.1`, `mathlib:Polynomial.reverse`.

Sources: ACC23, §2.4.1, Theorem 2.4.8 and its proof, pp. 946–948 — The map 𝒮 : T̃^T_R → T^T_R is the one of §2.1.2 at unramified places and of §2.1.9 (Lemma 2.1.13) at the ramified places considered. ACC23, §2.2.5, Propositions 2.2.16, 2.2.18 and 2.2.19, pp. 930–931 — The images of P̃_v, P̃_{v,σ}, P_{v,σ} and P_{v^c,σ^{−c}} under 𝒮. ACC23, §3.2, proof of Proposition 3.1.2, p. 964 — 𝒮(Res_v) is the resultant of P_{v,φ_v}(X) and q_v^{n(2n−1)}P^∨_{v^c}(q_v^{1−2n}X).

### Twisting the ramified Hecke algebras by a character

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-twisting` (theorem).

Setting of ACC+ §3.1: F is a CM field containing an imaginary quadratic field, p a prime, E/ℚ_p finite containing the images of all embeddings of F, with ring of integers O, uniformizer ϖ and residue field k, and every p-adic place of F⁺ splits in F; K ⊂ GL_n(A_F^∞) is a good subgroup, λ ∈ (ℤ^n_+)^{Hom(F,E)}, and S is a finite set of finite places of F containing the p-adic ones with S = S^c and such that for every finite v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. R ⊂ S is a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F (so each v ∈ R is split over F⁺), with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R; T = S − (R^c − R). Let ψ : G_F → O^× be a continuous character with (1) ψ ∘ Art_{F_v} trivial on det(K_v) for every finite v ∤ p, and (2) some m = (m_τ) ∈ ℤ^{Hom(F,E)} with ψ(Art_{F_v}(k)) = ∏_{τ ∈ Hom_{ℚ_p}(F_v,E)}τ(k)^{−m_τ} for v | p and k ∈ det(K_v); let μ_τ = (m_τ, …, m_τ). The automorphism f_ψ(f)(g) = ψ(Art_F(det g))^{−1}f(g) of H(GL_n(A_F^{∞,S_p}), K^{S_p}) ⊗ O satisfies f_ψ(T_{v,i}) = ψ(Frob_v)^{−i}T_{v,i} (v ∉ S) and f_ψ(t_{v,i}(σ)) = ψ(σ)^{−1}t_{v,i}(σ) (v ∈ R, σ ∈ W_{F_v}); hence f_ψ(P_v)(X) = ψ(Frob_v)^{−n}P_v(ψ(Frob_v)X) and f_ψ(P_{v,σ})(X) = ψ(σ)^{−n}P_{v,σ}(ψ(σ)X). The isomorphism RΓ(X_K, 𝒱_λ) ≅ RΓ(X_K, 𝒱_{λ+μ}) of ArithmeticLocallySymmetricSpaces ALS.3 is equivariant for H(GL_n(A_F^{∞,S_p}), K^{S_p}) ⊗ O acting through f_ψ on the target, so f_ψ descends to an isomorphism T^T_R(K, λ) ≅ T^T_R(K, λ + μ) with 𝔪 ↦ 𝔪(ψ); consequently Proposition 3.1.2 holds for T^T_R(K, λ)_𝔪 if and only if it holds for T^T_R(K, λ + μ)_{𝔪(ψ)} (transporting determinants along f_ψ and twisting by ψ).

Hypotheses and conventions: ψ continuous of the stated form; ψ(σ) := ψ|_{W_{F_v}}(σ).

Construction or proof:

1. Local–global compatibility of the Artin map (Tau Ceti ClassFieldTheory layer 11) identifies ψ ∘ Art_F restricted to F_v^× with ψ|_{W_{F_v}} ∘ Art_{F_v}.
2. On the support of t_{v,i}(α) (the double cosets of the e_i(α)z, z ∈ T_n(F_v), g with det g ∈ α·det(K_v)·(units on which ψ is trivial)), f_ψ multiplies by ψ(α)^{−1} (tameOperator_twist); the polynomial identities follow (IHG.3/charpoly-scalar-twist for the corresponding determinants).
3. ALS.3/twisting-isomorphism, applied with S replaced by S_p (only the places above p carry coefficient actions), gives the equivariance for the whole prime-to-p Hecke algebra, including the places of R; images of Hecke algebras correspond, and 𝔪(ψ) = f_ψ(𝔪) (IHG.3/galois-type-dual-twist gives ρ̄_{𝔪(ψ)} ≅ ρ̄_𝔪 ⊗ ψ̄).
4. A determinant D over T^T_R(K, λ)_𝔪/I with characteristic polynomials P_v, P_{v,σ} transports along f_ψ to one with polynomials f_ψ(P_v), f_ψ(P_{v,σ}), which are those of D ⊗ ψ^{−1}; twisting by ψ gives the required determinant over T^T_R(K, λ+μ)_{𝔪(ψ)}/f_ψ(I), and conversely.

Acceptance:

- n = 1: f_ψ multiplies the translation by an idele x by ψ(Art_F(x))^{−1}.
- For ψ unramified at v ∈ R of finite order, f_ψ(P_{v,φ_v})(X) = ψ(Frob_v)^{−n}P_{v,φ_v}(ψ(Frob_v)X).

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-hecke-algebra`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-hecke-operators`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/ramified-hecke-polynomial`, `ArithmeticLocallySymmetricSpaces:ALS.3/character-twist`, `ArithmeticLocallySymmetricSpaces:ALS.3/twisting-isomorphism`, `IntegralHeckeAndGaloisDeterminants:IHG.3/charpoly-scalar-twist`, `IntegralHeckeAndGaloisDeterminants:IHG.3/galois-type-dual-twist`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

Sources: ACC23, §2.2.20, the definition of f_ψ, Proposition 2.2.23 and Corollary 2.2.24, pp. 933–935 — f_ψ is an isomorphism with f_ψ(T_{v,i}) = ψ(Frob_v)^{−i}T_{v,i}; the twisting isomorphism RΓ(X_K, 𝒱_λ) ≅ RΓ(X_K, 𝒱_{λ+μ}) is equivariant for H(G^S, K_S) ⊗ O through f_ψ, and f_ψ descends to T^S(K, λ) ≅ T^S(K, λ + μ). ACC23, §3.2, proof of Lemma 3.2.1, p. 956 — Proposition 2.2.23 is used to show that Proposition 3.1.2 for T^{T_i}_R(K_i, λ)_{𝔪_i} is equivalent to it after twisting by ψ_i, i.e. for the operators at R as well (the extension to the operators at R is left implicit there).

### Poincaré duality for the unitary ramified Hecke algebras

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-hecke-duality` (theorem).

In the setting of IHR.5/unitary-ramified-hecke-algebra, let ι̃ be the anti-involution [K̃gK̃] ↦ [K̃g^{−1}K̃] of H(G̃(A^∞_{F⁺}), K̃) ⊗ O and D̃ = dim_ℝ X̃. The Verdier duality isomorphism RHom_O(RΓ_c(X̃_K̃, O), O) ≅ RΓ(X̃_K̃, O)[D̃] is equivariant for the whole Hecke algebra H(G̃(A^∞_{F⁺}), K̃) ⊗ O, acting through the transpose of ι̃ on the left. Consequently, writing ι̃(T̃^T_R)(C) for the image of ι̃(T̃^T_R) in End_{D(O)}(C), ι̃ descends to an isomorphism ι̃(T̃^T_R)(RΓ_c(X̃_K̃, O)) ≅ T̃^T_R(RΓ(X̃_K̃, O)). For a cuspidal automorphic representation π̃ with (π̃^∞)^{K̃} ≠ 0, ι̃ likewise identifies the image T̃^T_R(π̃^∨) of T̃^T_R ⊗ Q̄_p in End((π̃^{∨,∞})^{K̃}) with the image ι̃(T̃^T_R)(π̃) in End((π̃^∞)^{K̃}), through the transpose for the natural pairing.

Hypotheses and conventions: trivial coefficients; X̃_K̃ is orientable (G̃(ℝ) = ∏U(n, n) is connected), so no orientation twist enters.

Construction or proof:

1. ALS.5:finite-level-duality/verdier-poincare-duality gives the duality isomorphism; ALS.5:finite-level-duality/hecke-adjoint-duality gives ⟨x, [K̃gK̃]y⟩ = ⟨[K̃g^{−1}K̃]x, y⟩ for g away from the coefficient places, and with trivial coefficients the same argument applies to every g ∈ G̃(A^∞_{F⁺}) (requested from ALS.5 for the places of R).
2. As in ACC+ Corollary 2.2.22, the commutative square formed by the two Hecke actions and the duality isomorphism shows that ι̃ carries the kernel of the action on RΓ_c onto the kernel of the action on RΓ.
3. For π̃, the transpose of π̃(f) for the pairing π̃ × π̃^∨ is π̃^∨(ι̃f).

Acceptance:

- For R = ∅ this is ACC+ Corollary 2.2.22 for T̃^S with V = O.
- ι̃(P̃_v(X)) = P̃_{v^c}(X) for v ∉ S (ACC+ p. 932).

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/unitary-ramified-hecke-algebra`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality`.

Sources: ACC23, §2.2.20, Proposition 2.2.21 and Corollary 2.2.22, pp. 932–933 — Hecke-equivariant Poincaré duality with ι̃ and the induced isomorphism of Hecke algebras of RΓ_c and RΓ. ACC23, §3.2, proof of Corollary 3.2.3, pp. 960–961 — ι̃ descends to an isomorphism ι̃(T̃^T_R)(RΓ_c(X̃_K̃, O)) → T̃^T_R(RΓ(X̃_K̃, O)), and for π̃ it identifies T̃^T_R(π̃^∨) with ι̃(T̃^T_R)(π̃) by transposition.

### Change of level and coefficients for ramified Hecke algebras

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-level-change` (theorem).

Setting of ACC+ §3.1: F is a CM field containing an imaginary quadratic field, p a prime, E/ℚ_p finite containing the images of all embeddings of F, with ring of integers O, uniformizer ϖ and residue field k, and every p-adic place of F⁺ splits in F; K ⊂ GL_n(A_F^∞) is a good subgroup, λ ∈ (ℤ^n_+)^{Hom(F,E)}, and S is a finite set of finite places of F containing the p-adic ones with S = S^c and such that for every finite v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. R ⊂ S is a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F (so each v ∈ R is split over F⁺), with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R; T = S − (R^c − R). (1) Let K′ ⊲ K be a normal good subgroup such that K′_v = Iw_{v,1} for v ∈ R, K′ and K differ only at R and at a finite set Σ of places disjoint from R ∪ R^c, and let T′ = T ∪ Σ. Then T^{T′}_R acts on RΓ_{K/K′}(X_{K′}, 𝒱_λ) ∈ D(O[K/K′]), the operators at v ∈ R at level Iw_{v,1} commuting with the action of K_v/Iw_{v,1}, and there are surjections T^{T′}_R(K/K′, λ) → T^{T′}_R(K′, λ) and T^{T′}_R(K/K′, λ) ↠ T^{T′}_R(K, λ), the second identifying the operators at level Iw_{v,1} with those at level K_v; the kernel of the first is nilpotent of exponent d ≤ dim_ℝ X + 1, which depends only on n and [F : ℚ]. (2) For m ≥ 1 and K(p^m) = ker(K → GL_n(O_{F,p}/p^m)), 𝒱_λ/ϖ^m is constant on X_{K(p^m)}, so T^T_R(K(p^m), 𝒱_λ/ϖ^m) ≅ T^T_R(K(p^m), O/ϖ^m), and the analogous diagram T^T_R(K(p^m), O/ϖ^m) ← T^T_R(K/K(p^m), 𝒱_λ/ϖ^m) → T^T_R(K, 𝒱_λ/ϖ^m) has left kernel nilpotent of exponent d. (3) T^T_R(K, λ) ≅ lim_m T^T_R(RΓ(X_K, 𝒱_λ/ϖ^m)).

Hypotheses and conventions: K′ normal in K, both good; the level change at R only between Iw_{v,1} and K_v.

Construction or proof:

1. ALS.6/finite-level-descent gives RΓ_{K/K′}(X_{K′}, 𝒱_λ) with RΓ(K/K′, ·) ≅ RΓ(X_K, 𝒱_λ) and forgetful image RΓ(X_{K′}, 𝒱_λ); the operators away from R ∪ Σ act equivariantly. At v ∈ R the operators t_{v,i}(σ) at level Iw_{v,1} commute with the diamond operators of K_v/Iw_{v,1} (both lie in the image of the commutative tame torus algebra), so they act on the equivariant complex as monoid Hecke operators (ALS.3/derived-hecke-action), and on derived K/K′-invariants they induce the operators at level K_v (tameOperator_restrict_level).
2. The kernel of T^{T′}_R(K/K′, λ) → T^{T′}_R(K′, λ) consists of derived O[K/K′]-endomorphisms acting by zero on cohomology, hence nilpotent of exponent bounded by the amplitude (Lemma 2.2.4 = IHG.2/ghost-nilpotence applied over O[K/K′]).
3. (2) is ALS.1's constancy of the local system at full level p^m with coefficient change (ALS.1/coefficient-change) and the same argument; (3) is ALS.3/derived-hecke-algebra's limit statement, whose proof applies verbatim to T^T_R.

Acceptance:

- For R = ∅ and Σ = {q} this is the diagram of ACC+ p. 921 used in Theorem 2.3.8.
- The exponent d does not depend on K, λ, R or Σ.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-hecke-algebra`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-hecke-operators`, `ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent`, `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`, `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra`, `ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change`, `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-nilpotence`.

Sources: ACC23, §2.2.1, Lemma 2.2.4 and the paragraph after it, pp. 920–921 — For K′ ⊂ K normal, the diagram T^S(K′, 𝒱) ← T^S(K/K′, 𝒱) → T^S(K, 𝒱) with left kernel of exponent dim_ℝ X. ACC23, §3.2, proof of Lemma 3.2.1, pp. 955–957 — The diagrams T^{T_i}_R(K_i, λ)_{𝔪_i} ← T^{T_i}_R(K/K_i, λ)_{𝔪_i} ↠ T^{T_i}_R(K, λ)_{𝔪_i} → T^T_R(K, λ)_𝔪 with exponent d, the reduction to λ = 0 through K(p^m), and T^T_R(K, λ) ≅ lim_m T^T_R(RΓ(X_K, 𝒱_λ/ϖ^m)).

**Acceptance tests of the layer.** R = ∅ gives T = S and T^T_R(K, λ) = T^S(K, λ). R = ∅ gives T̃^T_R = T̃^S. For R = ∅, 𝒮 is the map (2.2.3). n = 1: f_ψ multiplies the translation by an idele x by ψ(Art_F(x))^{−1}. For R = ∅ this is ACC+ Corollary 2.2.22 for T̃^S with V = O. For R = ∅ and Σ = {q} this is the diagram of ACC+ p. 921 used in Theorem 2.3.8.

## IHR.6 — Local–global compatibility at R for the unitary group

Keep the setting of IHR.5 and let K̃ ⊂ G̃(A^∞_{F⁺}) be good, decomposed with respect to P, with K̃_v̄ = q̃_v at v ∈ R − R^c and K̃_v̄ = Ĩ_v̄ at v ∈ R ∩ R^c; fix Frobenius lifts φ_v (v ∈ R).

**Targets** (ACC+ §3.2, pp. 958–961).
- *Classical points*: for a cuspidal cohomological π̃ of G̃(A_{F⁺}) with (π̃^∞)^{K̃} ≠ 0, r_ι(π̃) viewed over the image T̃^T_R(π̃) satisfies (1) characteristic polynomial of Frob_v equal to P̃_v for v ∉ S, (2) characteristic polynomial of σ ∈ W_{F_v} equal to P̃_{v,σ} for v ∈ R, (3) Res_v^{(2n)!}ρ((τ_v − 1)P_{v,φ_v}(φ_v)) = 0 for v ∈ R − R^c; and the same for r_ι(π̃)^∨ ⊗ ε^{1−2n} through the duality involution ι̃.
- *Interpolation with conditions at R*: for every continuous discrete quotient A of the classical Hecke algebra T_cl (T̃^T_R with Scholze's topology), a unique 2n-dimensional A-valued determinant of G_{F,S} with conditions (1)–(3), (3) expressed through its trace.
- *Proposition 3.2.2*: an ideal Ĩ_{c,R} ⊂ T̃^T_R(RΓ_c(X̃_K̃, O)) with Ĩ_{c,R}^N = 0 (N depending only on n and [F : ℚ]) and a determinant D̃_{c,R} over the quotient with (1)–(3).
- *The same for RΓ(X̃_K̃, O)* through Poincaré duality, and *Corollary 3.2.3* for the boundary RΓ(∂X̃_K̃, O) through the boundary triangle.

**Dependencies.** Within this roadmap: IntegralHeckeAndGaloisDeterminantsPartII:IHR.2, IntegralHeckeAndGaloisDeterminantsPartII:IHR.3, IntegralHeckeAndGaloisDeterminantsPartII:IHR.4, IntegralHeckeAndGaloisDeterminantsPartII:IHR.5. Other roadmaps: AutomorphicGaloisRepresentationsPartII:AG2.2, AutomorphicGaloisRepresentationsPartII:AG2.5, TorsionCohomologyInfrastructure:TC.2, IntegralHeckeAndGaloisDeterminants:IHG.0, IntegralHeckeAndGaloisDeterminants:IHG.2, IntegralHeckeAndGaloisDeterminants:IHG.4, IntegralHeckeAndGaloisDeterminants:IHG.5, ArithmeticLocallySymmetricSpaces:ALS.4.

**Planets.** Classical-point compatibility at R (`IHR.6/classical-point-compatibility`); Interpolation with conditions at R (`IHR.6/ramified-interpolation`); Compatibility at R for RΓ_c of U(n, n) (`IHR.6/compact-support-compatibility`); Boundary compatibility at R (`IHR.6/boundary-compatibility`).

### Local–global compatibility at R for one cuspidal representation

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/classical-point-compatibility` (theorem).

In the setting of IHR.5/unitary-ramified-hecke-algebra (with K̃ as there) fix a Frobenius lift φ_v ∈ W_{F_v} for each v ∈ R. Let π̃ be a cuspidal automorphic representation of G̃(A_{F⁺}), cohomological for an algebraic representation of G̃_ℂ, with (π̃^∞)^{K̃} ≠ 0; fix ι : Q̄_p ≅ ℂ, let T̃^T_R(π̃) be the image of T̃^T_R ⊗_O Q̄_p in End_{Q̄_p}(ι^{−1}(π̃^∞)^{K̃}), and let ρ : G_{F,S} → GL_{2n}(T̃^T_R(π̃)) be the composite of r_ι(π̃) : G_{F,S} → GL_{2n}(Q̄_p) (ACC+ Theorem 2.3.3) with GL_{2n}(Q̄_p) ⊂ GL_{2n}(T̃^T_R(π̃)). Then: (1) for v ∉ S the characteristic polynomial of ρ(Frob_v) is the image of P̃_v(X); (2) for v ∈ R and σ ∈ W_{F_v} the characteristic polynomial of ρ(σ) is the image of P̃_{v,σ}(X); (3) for v ∈ R − R^c and τ_v ∈ I_{F_v}, Res_v^{(2n)!}ρ((τ_v − 1)P_{v,φ_v}(φ_v)) = 0 in M_{2n}(T̃^T_R(π̃)). The images of P̃_v and P̃_{v,σ} lie in Q̄_p[X].

Hypotheses and conventions: F contains an imaginary quadratic field F_0 in which the residue characteristics of the places of R split (needed for Theorem 2.3.3(c)); condition (3) is stated for v ∈ R − R^c (the printed R^c − R is a slip, sourceIssues).

Construction or proof:

1. T̃^T_R(π̃) is commutative and acts on ⊗_v̄(π̃_v̄)^{K̃_v̄}; the operators at v̄ act through scalars on (π̃_v̄)^{K̃_v̄} when they are central or by Lemma 2.2.13, so the images of P̃_v, P̃_{v,σ} lie in Q̄_p[X].
2. (1) is Theorem 2.3.3(a) (AutomorphicGaloisRepresentationsPartII AG2.2).
3. (2): Theorem 2.3.3(c) (AG2.5) gives WD(r_ι(π̃)|_{G_{F_v}})^{F-ss} ≅ rec^T_{F_v}(π̃_v̄ ∘ ι_v), and Frobenius semisimplification preserves characteristic polynomials (ArithmeticGaloisRepresentations R01.2). For v ∈ R ∩ R^c, IHR.2/tame-local-langlands-charpoly for GL_{2n} at the level ι_v(Ĩ_v̄) identifies them with P̃_{v,σ} (IHR.3/unitary-tame-hecke-polynomial); for v ∈ R − R^c, Lemma 2.2.13 (IHR.3/siegel-transfer-local-langlands) does.
4. (3) is Corollary 2.2.15 (IHR.4/resultant-inertia-galois) for ρ = r_ι(π̃)|_{G_{F_v}}, the algebra T_v̄ of Proposition 2.2.14 mapping to T̃^T_R(π̃).

Acceptance:

- For R = ∅ this is Theorem 2.3.3(a) restated over the Hecke image.
- If π̃_v̄ is unramified for v ∈ R − R^c, condition (3) holds without the factor Res_v^{(2n)!}.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/unitary-ramified-hecke-algebra`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.2/tame-local-langlands-charpoly`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/unitary-tame-hecke-polynomial`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-transfer-local-langlands`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.4/resultant-inertia-galois`, `AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`.

Sources: ACC23, §3.2, proof of Proposition 3.2.2, p. 959 — For cuspidal cohomological π̃ with (π̃^∞)^{K̃} ≠ 0 and ρ the composite of r_ι(π̃) with GL_{2n}(Q̄_p) ⊂ GL_{2n}(T̃^T_R(π̃)), the three properties hold; the first two follow from Theorem 2.3.3 and Proposition 2.2.9, the third from Theorem 2.3.3 and Corollary 2.2.15. ACC23, §2.3.1, Theorem 2.3.3, pp. 935–936 — Existence of r_ι(π̃) with the unramified characteristic polynomial (a) and local–global compatibility (c) at places above primes split in an imaginary quadratic subfield.

### The same compatibility for the dual Galois representation

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/dual-classical-point-compatibility` (theorem).

In the setting of IHR.5/unitary-ramified-hecke-algebra (with K̃ as there) fix a Frobenius lift φ_v ∈ W_{F_v} for each v ∈ R. For π̃ as in IHR.6/classical-point-compatibility let ι̃(T̃^T_R)(π̃) be the image of ι̃(T̃^T_R) ⊗ Q̄_p in End(ι^{−1}(π̃^∞)^{K̃}) and ρ the composite of r_ι(π̃)^∨ ⊗ ε^{1−2n} with GL_{2n}(Q̄_p) ⊂ GL_{2n}(ι̃(T̃^T_R)(π̃)). Then (1) for v ∉ S the characteristic polynomial of ρ(Frob_v) is the image of P̃_v(X) in ι̃(T̃^T_R)(π̃)[X]; (2) for v ∈ R and σ ∈ W_{F_v}, that of ρ(σ) is the image of P̃_{v,σ}(X); (3) for v ∈ R − R^c, σ ∈ G_{F,S} and τ_v ∈ I_{F_v}, Res_v^{(2n)!}ρ(σ(τ_v − 1)P_{v,φ_v}(φ_v)) = 0 (images taken through ι̃).

Hypotheses and conventions: σ ∈ G_{F,S} is quantified in (3) (the printed bullet leaves it unbound; equivalently drop it, ρ(σ) being invertible).

Construction or proof:

1. IHR.5/ramified-hecke-duality: ι̃ determines an isomorphism T̃^T_R(π̃^∨) ≅ ι̃(T̃^T_R)(π̃) by transposition.
2. π̃^∨ is cuspidal cohomological with (π̃^{∨,∞})^{K̃} ≠ 0, so IHR.6/classical-point-compatibility applies to it.
3. r_ι(π̃^∨) ≅ r_ι(π̃)^∨ ⊗ ε^{1−2n} (AutomorphicGaloisRepresentationsPartII AG2.2), which transports (1)–(3) for π̃^∨ to the statement.

Acceptance:

- For R = ∅, (1) is the identity ι̃(P̃_v) = P̃_{v^c} combined with r_ι(π̃)^∨ ⊗ ε^{1−2n}(Frob_v) having the Frobenius polynomial of v^c.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/classical-point-compatibility`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-hecke-duality`, `AutomorphicGaloisRepresentationsPartII:AG2.2`.

Sources: ACC23, §3.2, proof of Corollary 3.2.3, pp. 960–961 — For ρ the composite of r_ι(π̃)^∨ ⊗ ε^{1−2n} with GL_{2n}(Q̄_p) ⊂ GL_{2n}(ι̃(T̃^T_R)(π̃)) the three properties hold, by the transpose identification and r_ι(π̃^∨) ≅ r_ι(π̃)^∨ ⊗ ε^{1−2n}.

### Interpolation of determinants with conditions at R

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/ramified-interpolation` (theorem).

In the setting of IHR.5/unitary-ramified-hecke-algebra (with K̃ as there) fix a Frobenius lift φ_v ∈ W_{F_v} for each v ∈ R. Let T_cl be T̃^T_R with the weakest topology for which all maps T̃^T_R → End_C(H^0(X̃_{K̃^pK̃_p}, ω^{mk}_{K̃^pK̃_p} ⊗ ℐ)) are continuous, where C is a completed algebraic closure of ℚ_p, k ≥ 1, K̃_p ranges over open compact subgroups with K̃^pK̃_p good, ω is the automorphic line bundle and ℐ the ideal sheaf of the boundary of the minimal compactification, as in Scholze's Theorem 4.3.1 (TorsionCohomologyInfrastructure TC.1–TC.2). Then for every continuous quotient T_cl → A with A discrete there is a unique A-valued determinant D_A of G_{F,S} of dimension 2n such that: (1) for v ∉ S the characteristic polynomial of Frob_v is the image of P̃_v(X); (2) for v ∈ R and σ ∈ W_{F_v} that of σ is the image of P̃_{v,σ}(X); (3) for the trace tr_A : A[G_{F,S}] → A of D_A, Res_v^{(2n)!}tr_A(σ(τ_v − 1)P_{v,φ_v}(φ_v)) = 0 for v ∈ R − R^c, σ ∈ G_{F,S} and τ_v ∈ I_{F_v}.

Hypotheses and conventions: A discrete, T_cl → A continuous.

Construction or proof:

1. Scholze's comparison (TC.2, requested for the full prime-to-p Hecke algebra) identifies the Hecke eigensystems on the spaces H^0(X̃, ω^{mk} ⊗ ℐ) with those of cuspidal cohomological π̃ with (π̃^∞)^{K̃} ≠ 0, the Hecke algebra of each such finite-dimensional space being the image of T̃^T_R ⊗ C in a finite product of the T̃^T_R(π̃) ⊗ C.
2. IHR.6/classical-point-compatibility gives on each factor a determinant (that of ρ) satisfying (1)–(3); the product over the finitely many π̃ is a determinant over the product ring whose characteristic-polynomial coefficients on Frobenius elements, and the expressions in (2)–(3), lie in the image of T̃^T_R.
3. A continuous discrete quotient A of T_cl factors through the image of T̃^T_R in the endomorphisms of one such space (with its integral structure); IntegralHeckeAndGaloisDeterminants IHG.4/compact-determinant-gluing (Chenevier Example 2.32) descends the determinant to that compact image, and the conditions (1)–(3), polynomial identities in the coefficients and the trace, descend with it; push forward to A.
4. Uniqueness from (1) alone: IHG.4/frobenius-determinant-uniqueness (Chebotarev density of Frobenius elements in G_{F,S} and continuity).

Acceptance:

- For R = ∅ this is Scholze's Corollary 5.1.11 for G̃ as used in ACC+ Proposition 2.3.9.
- Uniqueness is determined by condition (1).

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/classical-point-compatibility`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/unitary-ramified-hecke-algebra`, `TorsionCohomologyInfrastructure:TC.2`, `IntegralHeckeAndGaloisDeterminants:IHG.4/compact-determinant-gluing`, `IntegralHeckeAndGaloisDeterminants:IHG.4/frobenius-determinant-uniqueness`, `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`, `IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-base-change`.

Sources: ACC23, §3.2, proof of Proposition 3.2.2, pp. 958–959 — The essential statement singled out: for T_cl = T̃^T_R with the weakest topology making the maps to End_C(H^0(X̃, ω^{mk} ⊗ ℐ)) continuous, every continuous discrete quotient A carries a unique 2n-dimensional determinant with the three conditions; proved as [Sch15, Cor. 5.1.11] by combining [Che14, Ex. 2.32] with the classical-point observation.

### Local–global compatibility at R for RΓ_c of the unitary group (Proposition 3.2.2)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/compact-support-compatibility` (theorem).

In the setting of IHR.5/unitary-ramified-hecke-algebra (with K̃ as there) fix a Frobenius lift φ_v ∈ W_{F_v} for each v ∈ R. There exist an integer N ≥ 1 depending only on [F : ℚ] and n, an ideal Ĩ_{c,R} ⊂ T̃^T_R(RΓ_c(X̃_K̃, O)) with Ĩ_{c,R}^N = 0, and a T̃^T_R(RΓ_c(X̃_K̃, O))/Ĩ_{c,R}-valued determinant D̃_{c,R} of G_{F,S} of dimension 2n such that: (1) for v ∉ S the characteristic polynomial of Frob_v is the image of P̃_v(X); (2) for v ∈ R and σ ∈ W_{F_v} that of σ is the image of P̃_{v,σ}(X); (3) with tr̃_{c,R} the trace of D̃_{c,R}, Res_v^{(2n)!}tr̃_{c,R}(σ(τ_v − 1)P_{v,φ_v}(φ_v)) = 0 for v ∈ R − R^c, σ ∈ G_{F,S} and τ_v ∈ I_{F_v}. (The source writes Ĩ_R in (1)–(2) for Ĩ_{c,R}.)

Hypotheses and conventions: K, 𝔪 satisfy the reductions (1)–(5) of Lemma 3.2.1 (IHR.7/small-level-reduction), in particular K̃ is small at an odd prime q.

Construction or proof:

1. Redo Scholze's Corollary 5.2.6 keeping track of the operators at R: by TC.2 (requested for all prime-to-p Hecke operators) there are N₀ = N₀(n, [F : ℚ]) and ideals J_m ⊂ T̃^T_R(RΓ_c(X̃_K̃, O/ϖ^m)) with J_m^{N₀} = 0 such that T̃^T_R(RΓ_c(X̃_K̃, O/ϖ^m))/J_m is a continuous quotient of T_cl.
2. IHR.6/ramified-interpolation gives determinants D_m over these quotients with (1)–(3), compatible in m by uniqueness.
3. T̃^T_R(RΓ_c(X̃_K̃, O)) ≅ lim_m T̃^T_R(RΓ_c(X̃_K̃, O/ϖ^m)) (as in IHR.5/ramified-hecke-algebra's limit statement); put Ĩ_{c,R} = ker(T̃^T_R(RΓ_c) → ∏_m T̃^T_R(RΓ_c(O/ϖ^m))/J_m), so Ĩ_{c,R}^{N₀} = 0 (IHG.5/nilpotent-product-bound), and IHG.4/inverse-limit-determinant glues the D_m to D̃_{c,R}; the conditions hold in every quotient, hence in the limit.

Acceptance:

- For R = ∅ the statement is the R_Γc analogue of Proposition 2.3.9, implicit in [Sch15, Cor. 5.2.6].
- N depends only on [F : ℚ] and n, not on K̃, R or the φ_v.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/ramified-interpolation`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/unitary-ramified-hecke-algebra`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-level-change`, `TorsionCohomologyInfrastructure:TC.2`, `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant`, `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-product-bound`, `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`.

Sources: ACC23, §3.2, Proposition 3.2.2 and its proof, pp. 958–959 — Existence of N, Ĩ_{c,R} and D̃_{c,R} with conditions (1)–(3), proved by re-doing [Sch15, Cor. 5.2.6] to keep track of the Hecke operators at R.

### Local–global compatibility at R for RΓ of the unitary group

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/cohomology-compatibility` (theorem).

In the setting of IHR.5/unitary-ramified-hecke-algebra (with K̃ as there) fix a Frobenius lift φ_v ∈ W_{F_v} for each v ∈ R. There exist an integer N ≥ 1 depending only on [F : ℚ] and n, an ideal Ĩ ⊂ T̃^T_R(RΓ(X̃_K̃, O)) with Ĩ^N = 0, and a T̃^T_R(RΓ(X̃_K̃, O))/Ĩ-valued determinant D̃ of G_{F,S} of dimension 2n satisfying conditions (1)–(3) of IHR.6/compact-support-compatibility (for the trace of D̃). (The source prints D̃ as valued in T̃^T_R(RΓ(X̃_K̃, O)) itself; the quotient by Ĩ is meant.)

Hypotheses and conventions: as in IHR.6/compact-support-compatibility.

Construction or proof:

1. IHR.5/ramified-hecke-duality: ι̃ descends to ι̃(T̃^T_R)(RΓ_c(X̃_K̃, O)) ≅ T̃^T_R(RΓ(X̃_K̃, O)), so it suffices to construct a determinant D̃_{c,R,∨} over ι̃(T̃^T_R)(RΓ_c)/Ĩ_{c,R,∨} with the analogous conditions, Ĩ_{c,R,∨} of bounded exponent.
2. Repeat the proof of IHR.6/compact-support-compatibility with ι̃(T̃^T_R) in place of T̃^T_R, using IHR.6/dual-classical-point-compatibility (ρ = r_ι(π̃)^∨ ⊗ ε^{1−2n}) at the classical points; transport the result along the isomorphism.

Acceptance:

- For R = ∅ this is (a form of) ACC+ Proposition 2.3.9 with trivial coefficients.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-hecke-duality`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/dual-classical-point-compatibility`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/compact-support-compatibility`, `TorsionCohomologyInfrastructure:TC.2`, `IntegralHeckeAndGaloisDeterminants:IHG.4/compact-determinant-gluing`, `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant`, `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-product-bound`.

Sources: ACC23, §3.2, proof of Corollary 3.2.3, pp. 960–961 — It suffices to produce the determinant for RΓ(X̃_K̃, O); by Proposition 2.2.21 and ι̃ this reduces to a determinant D̃_{c,R,∨} over a quotient of ι̃(T̃^T_R)(RΓ_c) by a nilpotent ideal, obtained as in Proposition 3.2.2 from the dual classical points.

### Local–global compatibility at R for the boundary (Corollary 3.2.3)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/boundary-compatibility` (theorem).

In the setting of IHR.5/unitary-ramified-hecke-algebra (with K̃ as there) fix a Frobenius lift φ_v ∈ W_{F_v} for each v ∈ R. There exist an integer N ≥ 1 depending only on [F : ℚ] and n, an ideal Ĩ_{∂,R} ⊂ T̃^T_R(RΓ(∂X̃_K̃, O)) with Ĩ_{∂,R}^N = 0, and a T̃^T_R(RΓ(∂X̃_K̃, O))/Ĩ_{∂,R}-valued determinant D̃_{∂,R} of G_{F,S} of dimension 2n such that: (1) for v ∉ S the characteristic polynomial of Frob_v is the image of P̃_v(X); (2) for v ∈ R and σ ∈ W_{F_v} that of σ is the image of P̃_{v,σ}(X); (3) Res_v^{(2n)!}tr̃_{∂,R}(σ(τ_v − 1)P_{v,φ_v}(φ_v)) = 0 for v ∈ R − R^c, σ ∈ G_{F,S}, τ_v ∈ I_{F_v}.

Hypotheses and conventions: as in IHR.6/compact-support-compatibility.

Construction or proof:

1. The boundary triangle RΓ_c(X̃_K̃, O) → RΓ(X̃_K̃, O) → RΓ(∂X̃_K̃, O) → is T̃^T_R-equivariant (IHR.5/unitary-ramified-hecke-algebra, ALS.4/boundary-triangle), so there is a natural homomorphism T̃^T_R(RΓ_c ⊕ RΓ) → T̃^T_R(RΓ(∂X̃_K̃, O))/J̃ with J̃² = 0 (Hecke images of an exact triangle, requested from IntegralHeckeAndGaloisDeterminants IHG.2).
2. T̃^T_R(RΓ_c ⊕ RΓ) embeds in T̃^T_R(RΓ_c) × T̃^T_R(RΓ); the determinants of IHR.6/compact-support-compatibility and IHR.6/cohomology-compatibility give one over the product modulo Ĩ_{c,R} × Ĩ, which descends to T̃^T_R(RΓ_c ⊕ RΓ) modulo the preimage (IHG.5/nilpotent-comparison-schema, its Frobenius coefficients lying in the image).
3. Push forward along the homomorphism to the boundary algebra modulo J̃ plus the image ideal (IHG.5/nilpotent-quotient-functoriality); the exponent is bounded by IHG.5/nilpotent-sum-bound and IHG.5/nilpotent-product-bound in terms of n and [F : ℚ]; the conditions push forward.

Acceptance:

- For R = ∅ this gives the 2n-dimensional determinant on the boundary Hecke algebra used for Theorem 2.4.4 with trivial coefficients.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/compact-support-compatibility`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/cohomology-compatibility`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/unitary-ramified-hecke-algebra`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`, `IntegralHeckeAndGaloisDeterminants:IHG.2`, `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-comparison-schema`, `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-quotient-functoriality`, `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-sum-bound`, `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-product-bound`.

Sources: ACC23, §3.2, Corollary 3.2.3 and its proof, pp. 959–961 — Existence of N, Ĩ_{∂,R} and D̃_{∂,R} with conditions (1)–(3); the proof uses the T̃^T_R-equivariant triangle and a homomorphism T̃^T_R(RΓ_c ⊕ RΓ) → T̃^T_R(RΓ(∂X̃_K̃, O))/J̃ with J̃² = 0.

**Acceptance tests of the layer.** For R = ∅ this is Theorem 2.3.3(a) restated over the Hecke image. For R = ∅, (1) is the identity ι̃(P̃_v) = P̃_{v^c} combined with r_ι(π̃)^∨ ⊗ ε^{1−2n}(Frob_v) having the Frobenius polynomial of v^c. For R = ∅ this is Scholze's Corollary 5.1.11 for G̃ as used in ACC+ Proposition 2.3.9. For R = ∅ the statement is the R_Γc analogue of Proposition 2.3.9, implicit in [Sch15, Cor. 5.2.6]. For R = ∅ this is (a form of) ACC+ Proposition 2.3.9 with trivial coefficients. For R = ∅ this gives the 2n-dimensional determinant on the boundary Hecke algebra used for Theorem 2.4.4 with trivial coefficients.

## IHR.7 — Descent to GL_n: local–global compatibility away from p

Keep the setting of IHR.5 and let 𝔪 ⊂ T^S(K, λ) be non-Eisenstein (IntegralHeckeAndGaloisDeterminants IHG.3).

**Targets** (ACC+ §3, pp. 954–964).
- *The ramified local determinant* E_v of W_{F_v}: for v ∈ R the determinant of ⊕_i ψ_{v,i}, with characteristic polynomial P_{v,σ}(X) at σ; for v ∈ R^c − R the unramified determinant with characteristic polynomial P_v(X) at Frob_v; uniqueness.
- *Auxiliary characters*: characters of finite prime-to-p order, unramified at S, separating the Frobenius eigenvalues at R as required by Lemma 3.2.1(2)–(3).
- *The decomposed unitary level* K̃ with K̃ ∩ G(A^∞_{F⁺}) = K (proof of Lemma 3.2.1(5)), after conjugating K into GL_n(O_{F_v}) at the remaining places.
- *Lemma 3.2.1*: reduction of Proposition 3.1.2 to K_v = Iw_{v,1} (v ∈ R), a small auxiliary level at an odd prime q, separated Frobenius eigenvalues, an auxiliary twist ψ, λ = 0 and a decomposed level K̃.
- *The boundary determinant* D′ = D·(D^{c,∨} ⊗ ε^{1−2n}) over T^T_R(K, 0)_𝔪/I_R, obtained by pushing Corollary 3.2.3 along the descended Satake map of PotentialAutomorphyInfrastructure PA.0 (Theorem 2.4.8), with its characteristic polynomials and the unit 𝒮(Res_v).
- *The restriction of D to W_{F_v}* equals E_v for v ∈ R, and ρ_𝔪 is unramified at v^c with Frobenius polynomial P_{v^c} for v ∈ R − R^c.
- *Proposition 3.1.2* (determinant form) and *Theorem 3.1.1*: an integer N ≥ 1 depending only on n and [F : ℚ], an ideal I_R ⊂ T^T_R(K, λ)_𝔪 with I_R^N = 0 and a continuous ρ_{𝔪,R} : G_{F,T} → GL_n(T^T_R(K, λ)_𝔪/I_R) with det(X − ρ_{𝔪,R}(Frob_v)) = P_v(X) for v ∉ T and det(X − ρ_{𝔪,R}(σ)) = P_{v,σ}(X) for v ∈ R, σ ∈ W_{F_v}.

Acceptance: n = 1, where every statement is class field theory for Hecke characters of conductor dividing the tame level; and the use at Taylor–Wiles places, where the ψ_{v,i} are residually distinct and ρ_{𝔪,R}|_{W_{F_v}} ≅ ⊕_i ψ_{v,i}.

**Dependencies.** Within this roadmap: IntegralHeckeAndGaloisDeterminantsPartII:IHR.5, IntegralHeckeAndGaloisDeterminantsPartII:IHR.6. Other roadmaps: PotentialAutomorphyInfrastructure:PA.0, TorsionCohomologyInfrastructure:TC.4, IntegralHeckeAndGaloisDeterminants:IHG.0, IntegralHeckeAndGaloisDeterminants:IHG.1, IntegralHeckeAndGaloisDeterminants:IHG.3, IntegralHeckeAndGaloisDeterminants:IHG.4, IntegralHeckeAndGaloisDeterminants:IHG.5, ArithmeticLocallySymmetricSpaces:ALS.0, ArithmeticLocallySymmetricSpaces:ALS.3, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence, tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev.

**Planets.** Ramified local determinant E_v (`IHR.7/ramified-local-determinant`); Reduction to small decomposable level (`IHR.7/small-level-reduction`); Boundary determinant D′ (`IHR.7/boundary-determinant`); Determinant form of compatibility away from p (`IHR.7/determinant-local-global`); Local–global compatibility away from p (`IHR.7/local-global-away-from-p`).

### The local determinants E_v of W_{F_v} at R and R^c − R

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/ramified-local-determinant` (definition).

Setting of ACC+ §3.1: F is a CM field containing an imaginary quadratic field, p a prime, E/ℚ_p finite containing the images of all embeddings of F, with ring of integers O, uniformizer ϖ and residue field k, and every p-adic place of F⁺ splits in F; K ⊂ GL_n(A_F^∞) is a good subgroup, λ ∈ (ℤ^n_+)^{Hom(F,E)}, and S is a finite set of finite places of F containing the p-adic ones with S = S^c and such that for every finite v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. R ⊂ S is a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F (so each v ∈ R is split over F⁺), with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R; T = S − (R^c − R). Let A be a commutative ring with a ring homomorphism T^T_R → A (for instance T^T_R(K, λ)_𝔪 or a quotient). For v ∈ R let E_v be the n-dimensional A-valued determinant of W_{F_v} (on A[W_{F_v}]) given by the product of the one-dimensional determinants ψ_{v,i} : W_{F_v} → A^× (images of the characters of IHR.1/tame-hecke-operators), that is E_v = det(⊕_{i=1}^{n}ψ_{v,i}); for every σ ∈ W_{F_v} its characteristic polynomial is the image of P_{v,σ}(X). For v ∈ R^c − R let E_v be the determinant of the unramified representation σ ↦ C^{deg σ}, where C is the companion matrix of the image of P_v(X) (a unit constant term) and deg : W_{F_v} → ℤ sends a geometric Frobenius to 1; its characteristic polynomial at Frob_v is the image of P_v(X). In both cases E_v is the unique n-dimensional A-valued determinant of W_{F_v} with these characteristic polynomials at every σ ∈ W_{F_v} (for v ∈ R^c − R, those of IHG.3's unramified polynomials P_{v,σ}).

Hypotheses and conventions: A commutative; for v ∈ R^c − R the image of P_v(X) has unit constant term (true since T_{v,n} is invertible in T^T).

Construction or proof:

1. Products of determinants are determinants of the sum dimension (IHG.0/determinant-direct-sum); one-dimensional determinants are characters (IHG.0/determinant-dimension-one); det of a matrix representation is a determinant with the matrix characteristic polynomials (IHG.0/determinant-of-matrix-representation).
2. Uniqueness: a determinant of a group is determined by the characteristic polynomials of all group elements (Amitsur's formula, IHG.0/amitsur-formula).

API:

- `weilDeterminant` (constructor): E_v : n-dimensional A-valued determinant of W_{F_v}, for v ∈ R ∪ (R^c − R).
- `weilDeterminant_eq_prod` (characterisation): For v ∈ R, E_v = ∏_i ψ_{v,i} as determinants (det of the diagonal representation).
- `weilDeterminant_charpoly` (simp): For v ∈ R and σ ∈ W_{F_v}, the characteristic polynomial of σ under E_v is the image of P_{v,σ}(X); for v ∈ R^c − R, at Frob_v it is the image of P_v(X).
- `weilDeterminant_unique` (characterisation): Any n-dimensional A-valued determinant of W_{F_v} with the same characteristic polynomials at all σ ∈ W_{F_v} equals E_v.
- `weilDeterminant_map` (functoriality): For A → B, E_v ⊗ B is the determinant attached to the composite T^T_R → B.
- `weilDeterminant_twist` (relation): For a character ψ of W_{F_v} with values in A^×, E_v ⊗ ψ is the determinant attached to the twisted operators ψ(σ)t_{v,i}(σ).
- `weilDeterminant_residual` (compatibility): For a maximal ideal 𝔫 of A with algebraically closed residue field κ, E_v mod 𝔫 is the determinant of the semisimple representation ⊕_iψ̄_{v,i} (Chenevier's bijection over a field, IHG.1/algebraically-closed-reconstruction).

Unit tests:

- `weilDeterminant_rank_one` (computation): For n = 1 and v ∈ R, E_v(σ) = ψ_{v,1}(σ) = image of [K_v α K_v], Art(α) = σ|_{ab}.
- `weilDeterminant_rank_zero` (degenerate): For n = 0, E_v is the constant determinant 1.
- `weilDeterminant_iwahori_unramified` (degenerate): If K_v = Iw_v then E_v is trivial on I_{F_v}, and E_v at Frob_v has characteristic polynomial the image of P_{v,φ_v}.
- `weilDeterminant_not_frobenius_only` (non-example): For K_v = Iw_{v,1} and n = 1, E_v is not determined by its value at one Frobenius lift: two such E_v's with equal value at φ_v but different restrictions to I_{F_v} exist (characters of k(v)^×).
- `weilDeterminant_compat_matrix` (compatibility): E_v equals IHG.0's determinant of the matrix representation σ ↦ diag(ψ_{v,1}(σ), …, ψ_{v,n}(σ)).

Uses: ACC+ proof of Proposition 3.1.2, pp. 963–964 — the target of the identification D|_{W_{F_v}} = E_v and of the factorization D|(D^{c,∨} ⊗ ε^{1−2n})| = E_v(E^{c,∨}_{v^c} ⊗ ε^{1−2n}); ACC+ proof of Proposition 6.5.11, p. 1067 — at Taylor–Wiles places E_v = ∏ψ_{v,i} with residually distinct ψ_{v,i}, giving ρ|_{W_{F_v}} ≅ ⊕ψ_{v,i} by [BC09, Prop. 1.5.1].

Acceptance:

- For n = 1 and v ∈ R, E_v = ψ_{v,1}.
- For K_v = Iw_v, E_v restricted to I_{F_v} is the trivial determinant (characteristic polynomial (X − 1)^n).

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/tame-hecke-operators`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.1/ramified-hecke-polynomial`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-hecke-algebra`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-direct-sum`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-dimension-one`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-of-matrix-representation`, `IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula`, `IntegralHeckeAndGaloisDeterminants:IHG.3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

Sources: ACC23, §3.2, proof of Proposition 3.1.2, p. 963 — For v ∈ R there is a unique n-dimensional group determinant E_v of W_{F_v} with coefficients in T^T_R(K, 0)_𝔪 such that the characteristic polynomial of σ is the image of P_{v,σ}(X); for v ∈ R^c − R a unique unramified one with characteristic polynomial of Frob_v equal to P_v(X).

### Auxiliary characters separating the Frobenius eigenvalues at R

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/auxiliary-characters` (theorem).

Setting of ACC+ §3.1: F is a CM field containing an imaginary quadratic field, p a prime, E/ℚ_p finite containing the images of all embeddings of F, with ring of integers O, uniformizer ϖ and residue field k, and every p-adic place of F⁺ splits in F; K ⊂ GL_n(A_F^∞) is a good subgroup, λ ∈ (ℤ^n_+)^{Hom(F,E)}, and S is a finite set of finite places of F containing the p-adic ones with S = S^c and such that for every finite v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. R ⊂ S is a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F (so each v ∈ R is split over F⁺), with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R; T = S − (R^c − R). Let 𝔪 ⊂ T^S(K, λ) be non-Eisenstein with residual representation ρ̄_𝔪 (IntegralHeckeAndGaloisDeterminants IHG.3) and fix Frobenius lifts φ_v (v ∈ R). After possibly enlarging O there are characters ψ_1, ψ_2 : G_F → O^× of finite order prime to p such that: both are unramified at every place of S; there is no rational prime above which both are ramified; and for i = 1, 2 and each v ∈ R the characteristic polynomials of (ρ̄_𝔪 ⊗ ψ̄_i)(φ_v) and ((ρ̄_𝔪 ⊗ ψ̄_i)^{c,∨} ⊗ ε̄^{1−2n})(φ_v) are coprime. Likewise there is ψ : G_F → O^× of finite prime-to-p order, unramified above R ∪ R^c ∪ S_p, such that for each v ∈ R the characteristic polynomials of ψ̄(Frob_v)ρ̄_𝔪(φ_v) and ψ̄(Frob_{v^c})^{−1}(ρ̄_𝔪 ⊕ ρ̄_𝔪^{c,∨} ⊗ ε̄^{1−2n})(φ_v) are coprime.

Hypotheses and conventions: ρ̄_𝔪 exists by Theorem 2.3.5 (TorsionCohomologyInfrastructure TC.4).

Construction or proof:

1. Both coprimality conditions only require that the product ψ(Frob_v)ψ(Frob_{v^c}) avoid a finite subset Z_v ⊂ k̄^× (ratios of eigenvalues) for each v ∈ R.
2. Take ψ = χ|_{G_F} for a character χ of G_{F⁺} of odd prime order r with r ≠ p and r > max_v #Z_v: since v and v^c lie over the split place v̄, Frob_v and Frob_{v^c} both map to Frob_v̄, so ψ(Frob_v)ψ(Frob_{v^c}) = χ(Frob_v̄)²; squaring is a bijection of μ_r, and μ_r → k̄^× is injective because r ≠ p, so a suitable value of χ(Frob_v̄) avoids Z_v.
3. Characters of G_{F⁺} of order r unramified at S̄ with prescribed values at the Frob_v̄, v̄ ∈ R̄: by global class field theory (Tau Ceti ClassFieldTheory layers 11–12) such characters are characters of the idele class group trivial on the units at S̄; the classes of the uniformizers at the v̄ ∈ R̄ are linearly independent in the dual of these characters modulo r, by Kummer theory and Chebotarev (an element of F⁺^× which is an r-th power at a density-one set of places is an r-th power, Tau Ceti Chebotarev layer 10). Duality of finite abelian groups gives the prescribed values.
4. For ψ_2, add to S̄ the places above the primes where ψ_1 ramifies; for ψ, additionally require unramifiedness above R ∪ R^c ∪ S_p, which is part of the construction.

Acceptance:

- If ρ̄_𝔪(φ_v) and (ρ̄_𝔪^{c,∨} ⊗ ε̄^{1−2n})(φ_v) already have coprime characteristic polynomials, ψ_i = 1 works for that condition.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-hecke-algebra`, `IntegralHeckeAndGaloisDeterminants:IHG.3/galois-type-maximal-ideal`, `IntegralHeckeAndGaloisDeterminants:IHG.3/galois-type-dual-twist`, `TorsionCohomologyInfrastructure:TC.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

Sources: ACC23, §3.2, proof of Lemma 3.2.1, p. 956 — After possibly enlarging O there are characters ψ_1, ψ_2 of finite prime-to-p order, unramified at S, not both ramified at any rational prime, separating the characteristic polynomials at each v ∈ R; 'a very similar argument' gives ψ as in condition (3). No proof of existence is written.

### The decomposed unitary level K̃ with K̃ ∩ G = K (proof of Lemma 3.2.1(5))

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/decomposed-unitary-level` (construction).

Setting of ACC+ §3.1: F is a CM field containing an imaginary quadratic field, p a prime, E/ℚ_p finite containing the images of all embeddings of F, with ring of integers O, uniformizer ϖ and residue field k, and every p-adic place of F⁺ splits in F; K ⊂ GL_n(A_F^∞) is a good subgroup, λ ∈ (ℤ^n_+)^{Hom(F,E)}, and S is a finite set of finite places of F containing the p-adic ones with S = S^c and such that for every finite v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. R ⊂ S is a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F (so each v ∈ R is split over F⁺), with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R; T = S − (R^c − R). Assume K satisfies (1)–(4) of IHR.7/small-level-reduction, with auxiliary odd prime q, and that K_v ⊂ GL_n(O_{F_v}) for every finite place v (achieved by replacing K by gKg^{−1} for some g ∈ GL_n(A_F^∞) supported at the places of S outside R ∪ R^c ∪ S_p and the q-adic places, which changes neither T^T_R(K, λ) nor the Hecke polynomials). Let R̄ ⊇ R̄_1 be the places of F⁺ below R and R_1 = R ∩ R^c. Define K̃ = ∏_v̄ K̃_v̄ by: K̃_v̄ = G̃(O_{F⁺_v̄}) for v̄ not below S; K̃_v̄ = Ĩw_v̄(1, 1) for v̄ ∈ R̄_1; K̃_v̄ = 𝔭̃_{v,1} for v̄ ∈ R̄ − R̄_1, v the place of R above v̄; K̃_q = ker(G̃(O_{F⁺,q}) → G̃(O_{F⁺}/(q))); and at every other finite v̄, K̃_v̄ = ker(G̃(O_{F⁺_v̄}) → G̃(O_{F⁺}/(ϖ_v̄^m)))·(K ∩ G(O_{F⁺_v̄})) for m ≥ 1 with the kernel's intersection with G contained in K ∩ G(O_{F⁺_v̄}). Then K̃ is a good open subgroup of G̃(A^∞_{F⁺}), decomposed with respect to P, with K̃ ∩ G(A^∞_{F⁺}) = K.

Hypotheses and conventions: the conjugation step is needed: without it K̃ ∩ G = K fails when some K_v̄ ⊄ G(O_{F⁺_v̄}) (sourceIssues); K satisfies Lemma 3.2.1(1): K_v = Iw_{v,1} for v ∈ R and K_q is principal of level q.

Construction or proof:

1. Every compact open subgroup of GL_n(F_v) lies in a conjugate of GL_n(O_{F_v}); conjugating at places of S where no Hecke operator of T^T_R lives changes RΓ(X_K, 𝒱_λ) by a Hecke-equivariant isomorphism (translation r_g, ALS.0).
2. Local intersections: Ĩw_v̄(1,1) ∩ G = Iw_{v^c,1} × Iw_{v,1} (IHR.3/unitary-tame-level), 𝔭̃_{v,1} ∩ G = GL_n(O_{F_{v^c}}) × Iw_{v,1} (IHR.3/siegel-parahoric-level), matching K at R ∪ R^c by Lemma 3.2.1(1); at the other places the product of the principal congruence kernel with K ∩ G(O) is a subgroup meeting G in K ∩ G(O) = K_v̄.
3. Each K̃_v̄ is decomposed with respect to P (Iwahori decomposition of the levels at R̄; at the other places the congruence kernel is decomposed and normalized by the Levi factor); K̃ is neat because K̃_q is principal of level q odd (ALS.0/neat-level-manifold), hence good.

API:

- `decomposedUnitaryLevel` (constructor): K̃ ⊂ G̃(A^∞_{F⁺}) built from K (after the conjugation step), R, q and the auxiliary exponents m.
- `decomposedUnitaryLevel_inter` (characterisation): K̃ ∩ G(A^∞_{F⁺}) = K.
- `decomposedUnitaryLevel_decomposed` (structure): K̃ = (K̃ ∩ U(A^∞))·(K̃ ∩ G(A^∞)) is decomposed with respect to P = U ⋊ G.
- `decomposedUnitaryLevel_good` (instance): K̃ is good (neat, of product form).
- `decomposedUnitaryLevel_at_R` (simp): K̃_v̄ = Ĩw_v̄(1,1) for v̄ ∈ R̄_1 and K̃_v̄ = 𝔭̃_{v,1} for v̄ ∈ R̄ − R̄_1.
- `conjugate_into_integral` (relation): There is g supported at the places of S outside R ∪ R^c ∪ S_p ∪ {q} with gK_vg^{−1} ⊂ GL_n(O_{F_v}) for all v, and r_g identifies T^T_R(K, λ) with T^T_R(gKg^{−1}, λ) compatibly with the generators.

Unit tests:

- `decomposedUnitaryLevel_unramified` (degenerate): If S = S_p ∪ R ∪ R^c ∪ {q-adic places} then K̃_v̄ = G̃(O_{F⁺_v̄}) at every v̄ outside R̄ and q and p.
- `decomposedUnitaryLevel_R1` (computation): For v̄ ∈ R̄_1, K̃_v̄ ∩ G(F⁺_v̄) = Iw_{v^c,1} × Iw_{v,1}.
- `decomposedUnitaryLevel_Rminus` (computation): For v̄ ∈ R̄ − R̄_1 with v ∈ R, K̃_v̄ ∩ G(F⁺_v̄) = GL_n(O_{F_{v^c}}) × Iw_{v,1} = K_{v^c} × K_v (K_{v^c} hyperspecial since v^c ∈ R^c − R).
- `decomposedUnitaryLevel_needs_conjugation` (non-example): For n ≥ 2 and K_v = gGL_n(O_{F_v})g^{−1} with g = diag(ϖ_v, 1, …, 1) at a place v of S outside R ∪ R^c ∪ S_p ∪ {q}, the recipe without conjugation gives K̃_v̄ ∩ G(F⁺_v̄) = K_v ∩ GL_n(O_{F_v}) ≠ K_v.

Uses: ACC+ Lemma 3.2.1(5) — the level at which Proposition 3.2.2 and Corollary 3.2.3 are applied; PotentialAutomorphyInfrastructure:PA.0/ramified-satake-descent — Theorem 2.4.8 requires K̃ decomposed with respect to P and K = K̃ ∩ G.

Acceptance:

- At v̄ ∈ R̄_1, K̃_v̄ ∩ G = K_{v^c} × K_v = Iw_{v^c,1} × Iw_{v,1}.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/siegel-parahoric-level`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.3/unitary-tame-level`, `IgusaVarietiesAndTorsionConcentration:IG.0/quasi-split-unitary-datum`, `ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold`, `ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups`, `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`.

Sources: ACC23, §3.2, proof of Lemma 3.2.1, last paragraph, p. 957 — Definition of K̃_v̄ place by place and the assertion (said to be easy) that K̃ is good, decomposed with respect to P and satisfies K̃ ∩ G(A^∞_{F⁺}) = K.

### Reduction to small, weight-0, decomposable level (Lemma 3.2.1)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/small-level-reduction` (theorem).

Setting of ACC+ §3.1: F is a CM field containing an imaginary quadratic field, p a prime, E/ℚ_p finite containing the images of all embeddings of F, with ring of integers O, uniformizer ϖ and residue field k, and every p-adic place of F⁺ splits in F; K ⊂ GL_n(A_F^∞) is a good subgroup, λ ∈ (ℤ^n_+)^{Hom(F,E)}, and S is a finite set of finite places of F containing the p-adic ones with S = S^c and such that for every finite v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. R ⊂ S is a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F (so each v ∈ R is split over F⁺), with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R; T = S − (R^c − R). Let 𝔪 ⊂ T^S(K, λ) be non-Eisenstein and fix Frobenius lifts φ_v ∈ W_{F_v} (v ∈ R); put R_1 = R ∩ R^c. To prove Proposition 3.1.2 (IHR.7/determinant-local-global) it suffices to prove it under the additional assumptions: (1) K_v = Iw_{v,1} for v ∈ R, and K_q = ker(GL_n(O_{F,q}) → GL_n(O_F/(q))) for an odd prime q prime to R and p; (2) for v ∈ R the characteristic polynomials of ρ̄_𝔪(φ_v) and (ρ̄_𝔪^{c,∨} ⊗ ε̄^{1−2n})(φ_v) are coprime; (3) there is ψ : G_F → O^× of finite prime-to-p order, unramified above R ∪ R^c ∪ S_p, with ψ ∘ Art_F ∘ det trivial on K, such that for v ∈ R the characteristic polynomials of ψ̄(Frob_v)ρ̄_𝔪(φ_v) and ψ̄(Frob_{v^c})^{−1}(ρ̄_𝔪 ⊕ ρ̄_𝔪^{c,∨} ⊗ ε̄^{1−2n})(φ_v) are coprime; (4) λ = 0; (5) there is a good K̃ ⊂ G̃(A^∞_{F⁺}), decomposed with respect to P, with K = K̃ ∩ G(A^∞_{F⁺}), K̃_q principal of level q, K̃_v̄ hyperspecial for v̄ prime to S, K̃_v̄ = Ĩw_v̄(1,1) for v̄ ∈ R̄_1 and K̃_v̄ = 𝔭̃_{v,1} for v̄ ∈ R̄ − R̄_1.

Hypotheses and conventions: the maximal ideals 𝔪_i of the auxiliary Hecke algebras are pulled back to T^{S_i} (the printed T^{T_i} is a slip, sourceIssues).

Construction or proof:

1. (1): choose distinct odd primes q_1, q_2 ≠ p prime to S; let K_i ⊲ K with K_{i,v} = Iw_{v,1} (v ∈ R) and principal level q_i. IHR.5/ramified-level-change gives T^{T_i}_R(K_i, λ)_{𝔪_i} ← T^{T_i}_R(K/K_i, λ)_{𝔪_i} ↠ T^{T_i}_R(K, λ)_{𝔪_i} → T^T_R(K, λ)_𝔪 with left kernel of exponent d; push the determinants D_i forward to T^T_R(K, λ)_𝔪/I with I^{2Nd} = 0 (IHG.5/nilpotent-sum-bound); D_1 and D_2 agree by Chebotarev and Chenevier's Lemma 1.12 (IHG.4/frobenius-determinant-uniqueness), giving compatibility at the q_i-adic places.
2. (2) and (3): twist by the characters of IHR.7/auxiliary-characters at levels K_i = ∏_v ker(ψ_i ∘ Art ∘ det|_{K_v}); IHR.5/ramified-twisting shows that Proposition 3.1.2 for T^{T_i}_R(K_i, λ)_{𝔪_i} is equivalent to it after twisting, and the argument of the first step returns to K.
3. (4): T^T_R(K, λ) ≅ lim_m T^T_R(RΓ(X_K, 𝒱_λ/ϖ^m)) and the level K(p^m) on which 𝒱_λ/ϖ^m is constant (IHR.5/ramified-level-change (2)–(3)); the determinants D_m over T^T_R(K, 𝒱_λ/ϖ^m)_𝔪/I_m, I_m^{Nd} = 0, glue by Chenevier Example 2.32 (IHG.4/inverse-limit-determinant) over T^T_R(K, λ)_𝔪/I with I^{Nd} = 0.
4. (5): IHR.7/decomposed-unitary-level.

Acceptance:

- All exponents introduced depend only on n and [F : ℚ].
- For R = ∅ steps (2)–(3) are vacuous.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-level-change`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-twisting`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/auxiliary-characters`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/decomposed-unitary-level`, `IntegralHeckeAndGaloisDeterminants:IHG.4/frobenius-determinant-uniqueness`, `IntegralHeckeAndGaloisDeterminants:IHG.4/inverse-limit-determinant`, `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-sum-bound`, `IntegralHeckeAndGaloisDeterminants:IHG.3/galois-type-maximal-ideal`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

Sources: ACC23, §3.2, Lemma 3.2.1 and its proof, pp. 955–957 — Statement of the five reductions and their proof: two auxiliary primes and Lemma 2.2.4, twisting by auxiliary characters and Proposition 2.2.23, the inverse limit over ϖ^m with [Che14, Ex. 2.32], and the construction of K̃.

### The boundary determinant D′ = D·(D^{c,∨} ⊗ ε^{1−2n}) on T^T_R(K, 0)_𝔪

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/boundary-determinant` (construction).

Setting of ACC+ §3.1: F is a CM field containing an imaginary quadratic field, p a prime, E/ℚ_p finite containing the images of all embeddings of F, with ring of integers O, uniformizer ϖ and residue field k, and every p-adic place of F⁺ splits in F; K ⊂ GL_n(A_F^∞) is a good subgroup, λ ∈ (ℤ^n_+)^{Hom(F,E)}, and S is a finite set of finite places of F containing the p-adic ones with S = S^c and such that for every finite v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. R ⊂ S is a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F (so each v ∈ R is split over F⁺), with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R; T = S − (R^c − R). Assume (1)–(5) of IHR.7/small-level-reduction and let 𝔪̃ = 𝒮^*(𝔪) ⊂ T̃^S. Pushing D̃_{∂,R} (IHR.6/boundary-compatibility) forward along the descent T̃^T_R(RΓ(∂X̃_K̃, O)_𝔪̃) → T^T_R(RΓ(X_K, O)_𝔪) of the ramified Satake homomorphism (PotentialAutomorphyInfrastructure PA.0, Theorem 2.4.8) gives N ≥ 1 depending only on [F : ℚ] and n, an ideal I_R ⊂ T^T_R(K, 0)_𝔪 with I_R^N = 0 and a T^T_R(K, 0)_𝔪/I_R-valued determinant D′ of G_{F,S} of dimension 2n with: (1) characteristic polynomial of Frob_v equal to P_v(X)q_v^{n(2n−1)}P^∨_{v^c}(q_v^{1−2n}X) for v ∉ S; (2) characteristic polynomial of σ ∈ W_{F_v} equal to P_{v,σ}(X)‖σ‖_v^{n(1−2n)}P^∨_{v^c,σ^c}(‖σ‖_v^{2n−1}X) for v ∈ R; (3) 𝒮(Res_v)^{(2n)!}tr′(σ(τ_v − 1)P_{v,φ_v}(φ_v)) = 0 for v ∈ R − R^c, σ ∈ G_{F,S}, τ_v ∈ I_{F_v}. Enlarging I_R (N still depending only on [F : ℚ] and n), there is ρ_𝔪 : G_{F,S} → GL_n(T^T_R(K, 0)_𝔪/I_R) with det(X − ρ_𝔪(Frob_v)) = P_v(X) for v ∉ S (Theorem 2.3.7), and D′ = det(ρ_𝔪 ⊕ ρ_𝔪^{c,∨} ⊗ ε^{1−2n}) = D·(D^{c,∨} ⊗ ε^{1−2n}) with D = det ρ_𝔪; here D^{c,∨} ⊗ ε^{1−2n} denotes the determinant of ρ_𝔪^{c,∨} ⊗ ε^{1−2n}, whose underlying law is twisted by ε^{n(1−2n)}.

Hypotheses and conventions: Frobenius geometric: ε(Frob_v) = q_v^{−1}, ‖φ_v‖_v = q_v^{−1}; P^∨_{v^c,σ^c} = P_{v^c,σ^{−c}}.

Construction or proof:

1. By Theorem 2.4.8 (PA.0/ramified-satake-descent) and Theorem 2.4.2 (ALS.4/siegel-stratum-localization), 𝒮 descends to T̃^T_R(RΓ(∂X̃_K̃, O)_𝔪̃) → T^T_R(RΓ(X_K, O)_𝔪) = T^T_R(K, 0)_𝔪; push D̃_{∂,R} forward (IHG.5/nilpotent-quotient-functoriality).
2. Conditions (1)–(3) are the images under 𝒮 of the corresponding conditions, computed by IHR.5/ramified-satake-homomorphism (Propositions 2.2.16, 2.2.18, 2.2.19).
3. Theorem 2.3.7 (TorsionCohomologyInfrastructure TC.4) gives ρ_𝔪 over a quotient by a nilpotent ideal; enlarge I_R by its image (IHG.5/nilpotent-sum-bound). The two 2n-dimensional determinants D′ and det(ρ_𝔪 ⊕ ρ_𝔪^{c,∨} ⊗ ε^{1−2n}) have the same characteristic polynomials at Frob_v, v ∉ S, so they agree (IHG.4/frobenius-determinant-uniqueness), using IHG.0's contragredient and direct sum of determinants and IHG.3/reciprocal-charpoly for the dual.

API:

- `boundaryDeterminant` (constructor): D′ : 2n-dimensional T^T_R(K, 0)_𝔪/I_R-valued determinant of G_{F,S}.
- `boundaryDeterminant_charpoly_frob` (simp): Characteristic polynomial of Frob_v (v ∉ S) is P_v(X)q_v^{n(2n−1)}P^∨_{v^c}(q_v^{1−2n}X).
- `boundaryDeterminant_charpoly_weil` (simp): Characteristic polynomial of σ ∈ W_{F_v} (v ∈ R) is P_{v,σ}(X)‖σ‖_v^{n(1−2n)}P^∨_{v^c,σ^c}(‖σ‖_v^{2n−1}X).
- `boundaryDeterminant_trace_relation` (relation): 𝒮(Res_v)^{(2n)!}tr′(σ(τ_v − 1)P_{v,φ_v}(φ_v)) = 0 for v ∈ R − R^c.
- `boundaryDeterminant_eq` (characterisation): D′ = D·(D^{c,∨} ⊗ ε^{1−2n}) with D = det ρ_𝔪.
- `boundaryDeterminant_nilpotence` (other): I_R^N = 0 with N depending only on n and [F : ℚ].

Unit tests:

- `boundaryDeterminant_rank_one_frob` (computation): For n = 1 and v ∉ S: characteristic polynomial (X − T_{v,1})(X − q_vT_{v^c,1}^{−1}) = det(X − (ρ ⊕ ρ^{c,∨}ε^{−1})(Frob_v)) since ε^{−1}(Frob_v) = q_v.
- `boundaryDeterminant_empty` (degenerate): For R = ∅ the conditions (2)–(3) are vacuous and D′ is the pushforward of the boundary determinant of Theorem 2.4.4 with trivial coefficients.
- `boundaryDeterminant_not_square` (non-example): D′ ≠ D²: for n = 1 the second Frobenius eigenvalue is q_vT_{v^c,1}^{−1}, not T_{v,1}.
- `boundaryDeterminant_twist_law` (compatibility): The polynomial law underlying D^{c,∨} ⊗ ε^{1−2n} is that of D^{c,∨} multiplied by det(ε^{1−2n}) = ε^{n(1−2n)}, in agreement with IHG.3/charpoly-scalar-twist.

Uses: ACC+ proof of Proposition 3.1.2, pp. 963–964 — D|_{W_{F_v}} is extracted from D′|_{W_{F_v}} = E_v(E^{c,∨}_{v^c} ⊗ ε^{1−2n}), and the trace relation (3) forces unramifiedness at v^c.

Acceptance:

- For n = 1 and v ∉ S, the characteristic polynomial of Frob_v under D′ is (X − T_{v,1})(X − q_vT_{v^c,1}^{−1}).
- For R = ∅ only (1) remains.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.6/boundary-compatibility`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-satake-homomorphism`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/small-level-reduction`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.4/siegel-resultant`, `PotentialAutomorphyInfrastructure:PA.0/ramified-satake-descent`, `ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization`, `TorsionCohomologyInfrastructure:TC.4`, `IntegralHeckeAndGaloisDeterminants:IHG.4/frobenius-determinant-uniqueness`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-duality`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-direct-sum`, `IntegralHeckeAndGaloisDeterminants:IHG.3/reciprocal-charpoly`, `IntegralHeckeAndGaloisDeterminants:IHG.3/charpoly-scalar-twist`, `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-quotient-functoriality`, `IntegralHeckeAndGaloisDeterminants:IHG.5/nilpotent-sum-bound`.

Sources: ACC23, §3.2, proof of Proposition 3.1.2, pp. 962–963 — By Theorem 2.4.8, Propositions 2.2.16, 2.2.18, 2.2.19 and Corollary 3.2.3 there are N, I_R and D′ with conditions (1)–(3); by Theorem 2.3.7, D′ = det(ρ_𝔪 ⊕ ρ_𝔪^{c,∨} ⊗ ε^{1−2n}) = D(D^{c,∨} ⊗ ε^{1−2n}).

### The restriction of D to W_{F_v} is E_v for v ∈ R

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/determinant-restriction-at-R` (theorem).

Setting of ACC+ §3.1: F is a CM field containing an imaginary quadratic field, p a prime, E/ℚ_p finite containing the images of all embeddings of F, with ring of integers O, uniformizer ϖ and residue field k, and every p-adic place of F⁺ splits in F; K ⊂ GL_n(A_F^∞) is a good subgroup, λ ∈ (ℤ^n_+)^{Hom(F,E)}, and S is a finite set of finite places of F containing the p-adic ones with S = S^c and such that for every finite v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. R ⊂ S is a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F (so each v ∈ R is split over F⁺), with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R; T = S − (R^c − R). Assume (1)–(5) of IHR.7/small-level-reduction and keep the notation of IHR.7/boundary-determinant. For every v ∈ R, D|_{W_{F_v}} = E_v as n-dimensional T^T_R(K, 0)_𝔪/I_R-valued determinants of W_{F_v}, where E_v is the local determinant of IHR.7/ramified-local-determinant; in particular the characteristic polynomial of σ ∈ W_{F_v} under D is the image of P_{v,σ}(X).

Hypotheses and conventions: the maximal ideals of T^T_R(K, 0)_𝔪 need not be unique: the argument is carried out at each of them.

Construction or proof:

1. From IHR.7/boundary-determinant (2): D|_{W_{F_v}}·(D^{c,∨} ⊗ ε^{1−2n})|_{W_{F_v}} = E_v·(E^{c,∨}_{v^c} ⊗ ε^{1−2n}) (comparing characteristic polynomials at all σ ∈ W_{F_v}, IHG.0/amitsur-formula).
2. Twisting by ψ (Lemma 3.2.1(3), IHR.5/ramified-twisting) gives det(ρ_𝔪 ⊗ ψ ⊕ (ρ_𝔪 ⊗ ψ)^{c,∨} ⊗ ε^{1−2n})|_{W_{F_v}} = (E_v ⊗ ψ)((E_{v^c} ⊗ ψ)^{c,∨} ⊗ ε^{1−2n}).
3. Modulo each maximal ideal 𝔫 of T^T_R(K, 0)_𝔪, compare the roots of the characteristic polynomials of φ_v under both sides: the separation property of ψ forces the roots of det ρ̄_𝔪(φ_v) to be the roots of E_v(φ_v) mod 𝔫; by the bijection between determinants over a field and semisimple representations (IHG.1/algebraically-closed-reconstruction), det ρ_𝔪|_{W_{F_v}} ≡ E_v mod 𝔫.
4. Hensel's lemma for determinants (Lemma 3.2.4, requested from IntegralHeckeAndGaloisDeterminants IHG.1), applied to the residually coprime factorization D′|_{W_{F_v}} = D|·(D^{c,∨} ⊗ ε^{1−2n})| over each local factor, gives D|_{W_{F_v}} = E_v.

Acceptance:

- n = 1: D = det ρ_𝔪 is a character and the statement is ρ_𝔪(σ) = t_{v,1}(σ) for σ ∈ W_{F_v}, local–global compatibility of class field theory for the Hecke character.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/boundary-determinant`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/ramified-local-determinant`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-twisting`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/small-level-reduction`, `IntegralHeckeAndGaloisDeterminants:IHG.1`, `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`, `IntegralHeckeAndGaloisDeterminants:IHG.0/amitsur-formula`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-restriction`, `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors`.

Sources: ACC23, §3.2, proof of Proposition 3.1.2, pp. 963–964 — D|_{W_{F_v}}(D^{c,∨} ⊗ ε^{1−2n})|_{W_{F_v}} = E_v(E^{c,∨}_{v^c} ⊗ ε^{1−2n}); twisting by ψ, Proposition 2.2.23 and [Che14, Th. 2.12] give det ρ_𝔪|_{W_{F_v}} = E_v mod 𝔫 for every maximal ideal 𝔫, and Lemma 3.2.4 gives D|_{W_{F_v}} = E_v. ACC23, §3.2, Lemma 3.2.4 and its proof, pp. 961–962 — Hensel's lemma for group determinants with residually disjoint constituents: uniqueness of the factorization and ker D = ker D_1 ∩ ker D_2.

### Unramifiedness at the conjugate places v^c, v ∈ R − R^c

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/unramified-at-conjugate` (theorem).

Setting of ACC+ §3.1: F is a CM field containing an imaginary quadratic field, p a prime, E/ℚ_p finite containing the images of all embeddings of F, with ring of integers O, uniformizer ϖ and residue field k, and every p-adic place of F⁺ splits in F; K ⊂ GL_n(A_F^∞) is a good subgroup, λ ∈ (ℤ^n_+)^{Hom(F,E)}, and S is a finite set of finite places of F containing the p-adic ones with S = S^c and such that for every finite v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. R ⊂ S is a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F (so each v ∈ R is split over F⁺), with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R; T = S − (R^c − R). Assume (1)–(5) of IHR.7/small-level-reduction and keep the notation of IHR.7/boundary-determinant. For every v ∈ R − R^c (so v^c ∈ S − T), ρ_𝔪|_{W_{F_{v^c}}} is unramified and det(X − ρ_𝔪(Frob_{v^c})) is the image of P_{v^c}(X); hence D factors through G_{F,T} and its characteristic polynomial at Frob_w is the image of P_w(X) for every w ∈ S − T.

Hypotheses and conventions: ρ̄_𝔪 absolutely irreducible (𝔪 non-Eisenstein).

Construction or proof:

1. Equivalently (applying c and the dual twist) ρ_𝔪^{c,∨} ⊗ ε^{1−2n}|_{W_{F_v}} is unramified with Frobenius polynomial q_v^{n(2n−1)}P^∨_{v^c}(q_v^{1−2n}X); the polynomial identity follows from IHR.7/boundary-determinant (1)–(2) and IHR.7/determinant-restriction-at-R, so only unramifiedness remains (stronger than unramifiedness of the determinant).
2. Using D′ = det(ρ_𝔪 ⊕ ρ_𝔪^{c,∨} ⊗ ε^{1−2n}), the trace relation (3) of IHR.7/boundary-determinant reads 𝒮(Res_v)^{(2n)!}[tr ρ_𝔪(σ(τ_v − 1)P_{v,φ_v}(φ_v)) + tr(ρ_𝔪^{c,∨} ⊗ ε^{1−2n})(σ(τ_v − 1)P_{v,φ_v}(φ_v))] = 0; the first trace vanishes because P_{v,φ_v}(ρ_𝔪(φ_v)) = 0 by the Cayley–Hamilton theorem, P_{v,φ_v} being the characteristic polynomial of ρ_𝔪(φ_v) (IHR.7/determinant-restriction-at-R; Mathlib Matrix.aeval_self_charpoly).
3. 𝒮(Res_v) is the resultant of P_{v,φ_v}(X) and q_v^{n(2n−1)}P^∨_{v^c}(q_v^{1−2n}X) (IHR.5/ramified-satake-homomorphism); modulo each maximal ideal these are the characteristic polynomials of ρ̄_𝔪(φ_v) (IHR.7/determinant-restriction-at-R) and of (ρ̄_𝔪^{c,∨} ⊗ ε̄^{1−2n})(φ_v), coprime by Lemma 3.2.1(2), so 𝒮(Res_v) is a unit (Polynomial.isUnit_resultant_iff_isCoprime) and tr((ρ_𝔪^{c,∨} ⊗ ε^{1−2n})(σ(τ_v − 1)P_{v,φ_v}(φ_v))) = 0 for all σ ∈ G_{F,S}.
4. M = (ρ_𝔪^{c,∨} ⊗ ε^{1−2n})(P_{v,φ_v}(φ_v)) has unit determinant (the resultant being a unit), and ρ̄_𝔪 is absolutely irreducible, so the image of T[G_{F,S}] is all of M_n(T) over each local factor (IHG.1/henselian-irreducible) and the trace pairing on M_n is perfect: hence (ρ_𝔪^{c,∨} ⊗ ε^{1−2n})(τ_v − 1)M = 0, so (ρ_𝔪^{c,∨} ⊗ ε^{1−2n})(τ_v) = 1 for all τ_v ∈ I_{F_v}.

Acceptance:

- n = 1: ρ_𝔪 is a character and the statement is that the Hecke character has conductor prime to v^c, the level K_{v^c} being hyperspecial.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/boundary-determinant`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/determinant-restriction-at-R`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.4/siegel-resultant`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-satake-homomorphism`, `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible`, `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors`, `IntegralHeckeAndGaloisDeterminants:IHG.0/characteristic-polynomial`, `mathlib:Polynomial.isUnit_resultant_iff_isCoprime`, `mathlib:Matrix.aeval_self_charpoly`.

Sources: ACC23, §3.2, proof of Proposition 3.1.2, p. 964 — For v ∈ R − R^c, ρ_𝔪|_{W_{F_{v^c}}} is unramified with the correct Frobenius polynomial: applying 𝒮 to the trace relation, using P_{v,φ_v}(ρ_𝔪(φ_v)) = 0, the unit 𝒮(Res_v), the unit determinant of (ρ_𝔪^{c,∨} ⊗ ε^{1−2n})(P_{v,φ_v}(φ_v)) and the absolute irreducibility of ρ̄_𝔪.

### Determinant form of local–global compatibility away from p (Proposition 3.1.2)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/determinant-local-global` (theorem).

Setting of ACC+ §3.1: F is a CM field containing an imaginary quadratic field, p a prime, E/ℚ_p finite containing the images of all embeddings of F, with ring of integers O, uniformizer ϖ and residue field k, and every p-adic place of F⁺ splits in F; K ⊂ GL_n(A_F^∞) is a good subgroup, λ ∈ (ℤ^n_+)^{Hom(F,E)}, and S is a finite set of finite places of F containing the p-adic ones with S = S^c and such that for every finite v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. R ⊂ S is a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F (so each v ∈ R is split over F⁺), with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R; T = S − (R^c − R). Let 𝔪 ⊂ T^S(K, λ) be non-Eisenstein. There exist an integer N ≥ 1 depending only on n and [F : ℚ], an ideal I_R ⊂ T^T_R(K, λ)_𝔪 with I_R^N = 0, and a T^T_R(K, λ)_𝔪/I_R-valued determinant D_{𝔪,R} of G_{F,T} of dimension n such that: (1) for every place v ∉ T, the characteristic polynomial of Frob_v under D_{𝔪,R} is the image of P_v(X); (2) for every v ∈ R and σ ∈ W_{F_v}, the characteristic polynomial of σ under D_{𝔪,R} is the image of P_{v,σ}(X) in (T^T_R(K, λ)_𝔪/I_R)[X].

Hypotheses and conventions: the setting of ACC+ §3.1; Frobenius elements are geometric.

Construction or proof:

1. By IHR.7/small-level-reduction assume (1)–(5) of Lemma 3.2.1, so λ = 0.
2. Take D_{𝔪,R} = D = det ρ_𝔪 of IHR.7/boundary-determinant; condition (2) is IHR.7/determinant-restriction-at-R; factoring through G_{F,T} and condition (1) at the places of S − T is IHR.7/unramified-at-conjugate; condition (1) at v ∉ S is Theorem 2.3.7.

Acceptance:

- For R = ∅ the statement is the determinant form of Theorem 2.3.7.
- n = 1: the Hecke character attached to 𝔪 at a place v ∈ R evaluates on σ ∈ W_{F_v} to the image of t_{v,1}(σ), i.e. to its local component at Art^{−1}(σ).

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/small-level-reduction`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/boundary-determinant`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/determinant-restriction-at-R`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/unramified-at-conjugate`, `IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/ramified-hecke-algebra`, `TorsionCohomologyInfrastructure:TC.4`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant`.

Sources: ACC23, §3.1, Proposition 3.1.2, p. 954 — Statement of the determinant form of local–global compatibility at ℓ ≠ p. ACC23, §3.2, pp. 955–964 — The proof: Lemma 3.2.1, Proposition 3.2.2, Corollary 3.2.3, Lemma 3.2.4 and the final argument with D′.

### Local–global compatibility away from p for torsion Hecke algebras (Theorem 3.1.1)

Node: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/local-global-away-from-p` (theorem).

Setting of ACC+ §3.1: F is a CM field containing an imaginary quadratic field, p a prime, E/ℚ_p finite containing the images of all embeddings of F, with ring of integers O, uniformizer ϖ and residue field k, and every p-adic place of F⁺ splits in F; K ⊂ GL_n(A_F^∞) is a good subgroup, λ ∈ (ℤ^n_+)^{Hom(F,E)}, and S is a finite set of finite places of F containing the p-adic ones with S = S^c and such that for every finite v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. R ⊂ S is a set of places prime to p whose residue characteristics split in an imaginary quadratic subfield of F (so each v ∈ R is split over F⁺), with Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R and K_v = GL_n(O_{F_v}) for v ∈ R^c − R; T = S − (R^c − R). Let 𝔪 ⊂ T^S(K, λ) be non-Eisenstein. There exist an integer N ≥ 1 depending only on n and [F : ℚ], an ideal I_R ⊂ T^T_R(K, λ)_𝔪 with I_R^N = 0, and a continuous homomorphism ρ_{𝔪,R} : G_{F,T} → GL_n(T^T_R(K, λ)_𝔪/I_R) such that: (1) for every place v ∉ T of F, det(X − ρ_{𝔪,R}(Frob_v)) is the image of P_v(X) in (T^T_R(K, λ)_𝔪/I_R)[X]; (2) for every v ∈ R and σ ∈ W_{F_v}, det(X − ρ_{𝔪,R}(σ)) is the image of P_{v,σ}(X) in (T^T_R(K, λ)_𝔪/I_R)[X].

Hypotheses and conventions: the setting of ACC+ §3.1 (F CM containing an imaginary quadratic field; residue characteristics of R split in an imaginary quadratic subfield; Iw_{v,1} ⊆ K_v ⊆ Iw_v for v ∈ R; K_v hyperspecial for v ∈ R^c − R).

Construction or proof:

1. Proposition 3.1.2 (IHR.7/determinant-local-global) gives D_{𝔪,R} over T^T_R(K, λ)_𝔪/I_R, a finite product of complete local rings (IHG.2/finite-hecke-local-factors), on each of which the residual determinant is that of the absolutely irreducible ρ̄_𝔪.
2. Chenevier's Theorem 2.22 (IHG.1/henselian-irreducible, IHG.5/residual-irreducible-quotient-lift): over each henselian local factor a residually absolutely irreducible determinant is the determinant of a representation, unique up to conjugation, continuous since the determinant is; the product of these representations is ρ_{𝔪,R}, and its characteristic polynomials are those of D_{𝔪,R}.

Acceptance:

- n = 1: ρ_{𝔪,R} is the character of G_{F,T} attached to a Hecke character of conductor dividing the tame level, and (2) is local class field theory at v ∈ R.
- At Taylor–Wiles places v ∈ Q ⊂ R with residually distinct ψ̄_{v,i}, ρ_{𝔪,R}|_{W_{F_v}} ≅ ⊕_iψ_{v,i} (ACC+ Proposition 6.5.11).
- For R = ∅ the statement is Theorem 2.3.7.

Direct prerequisites: `IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/determinant-local-global`, `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible`, `IntegralHeckeAndGaloisDeterminants:IHG.5/residual-irreducible-quotient-lift`, `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors`.

Sources: ACC23, §3.1, Theorem 3.1.1, p. 954 — Statement of local–global compatibility at ℓ ≠ p for the Hecke-algebra-valued Galois representation. ACC23, §3.1, p. 955 — Proposition 3.1.2 implies Theorem 3.1.1 by [Che14, Th. 2.22]. ACC23, §6.5, pp. 1063 and 1067 — Uses in Propositions 6.5.3 (R = S − S_p) and 6.5.11 (Taylor–Wiles places).

**Acceptance tests of the layer.** For n = 1 and v ∈ R, E_v = ψ_{v,1}. If ρ̄_𝔪(φ_v) and (ρ̄_𝔪^{c,∨} ⊗ ε̄^{1−2n})(φ_v) already have coprime characteristic polynomials, ψ_i = 1 works for that condition. At v̄ ∈ R̄_1, K̃_v̄ ∩ G = K_{v^c} × K_v = Iw_{v^c,1} × Iw_{v,1}. All exponents introduced depend only on n and [F : ℚ]. For n = 1 and v ∉ S, the characteristic polynomial of Frob_v under D′ is (X − T_{v,1})(X − q_vT_{v^c,1}^{−1}). n = 1: D = det ρ_𝔪 is a character and the statement is ρ_𝔪(σ) = t_{v,1}(σ) for σ ∈ W_{F_v}, local–global compatibility of class field theory for the Hecke character. n = 1: ρ_𝔪 is a character and the statement is that the Hecke character has conductor prime to v^c, the level K_{v^c} being hyperspecial. For R = ∅ the statement is the determinant form of Theorem 2.3.7. n = 1: ρ_{𝔪,R} is the character of G_{F,T} attached to a Hecke character of conductor dividing the tame level, and (2) is local class field theory at v ∈ R.

## Inputs requested from other roadmaps

- **SmoothRepresentationsOfLocalGroups:SR.1**: ACC+ Lemmas 2.1.12–2.1.13 in integral form (routed to SR.1 by PAPER-ALLEN-ETAL-23 route 5; ALS.4/parabolic-hecke-maps already states Lemmas 2.1.10–2.1.11): for G reductive over a nonarchimedean local field with residue cardinality q, P = MN, U compact open with an Iwahori decomposition and Δ_M its U-positive elements, the ℤ-linear map t : H(Δ_M, U_M) → H(Δ, U), [U_MmU_M] ↦ [UmU], is a ring homomorphism ([BK98, Cor. 6.12]); for strongly positive central z ∈ Δ_M, [U_MzU_M] is central and invertible with H(Δ_M, U_M)[[U_MzU_M]^{−1}] = H(M(F), U_M), and if q ∈ R^× and [UzU] is invertible in H(G(F), U) ⊗ R then t ⊗ R and 𝒮 ⊗ R extend uniquely to mutually inverse-up-to-|δ_P| algebra isomorphisms between H(M(F), U_M) ⊗ R and (H(Δ, U) ⊗ R)[[UzU]^{−1}]. Also the e_U-corner statement: for an irreducible admissible representation π over an algebraically closed field of characteristic 0, π^U is zero or a simple H(G, U)-module. Needed by `IHR.1/tame-double-coset-invertible`, `IHR.1/tame-torus-embedding`, `IHR.2/tame-principal-series-criterion`, `IHR.2/tame-hecke-centre`, `IHR.3/siegel-strongly-positive-invertible`, `IHR.3/siegel-transfer-operators`, `IHR.3/satake-transform-tame-level`, `IHR.3/satake-transform-siegel-level`, `IHR.5/ramified-satake-homomorphism`.
- **SmoothRepresentationsOfLocalGroups:SR.2**: For GL_m over a nonarchimedean local field and coefficients Q̄_p ≅ ℂ: normalized parabolic induction and the normalized Jacquet functor r_P; the geometric lemma ([Zel80, 1.2]) filtering r_P ∘ n-Ind_Q by induced representations indexed by double cosets; and Jacquet's lemma in the Bushnell–Kutzko form ([BK98, Th. 7.9]): if U has an Iwahori decomposition with respect to P = MN and a strongly positive central z ∈ M with [UzU] invertible, then for every smooth V the projection V^U → r_P(V)^{U_M} is an isomorphism with h·q(x) = δ_P^{1/2}(g)·q(t(h)x) for h = [U_MgU_M]. Needed by `IHR.2/tame-principal-series-criterion`, `IHR.2/tame-local-langlands-charpoly`, `IHR.3/siegel-transfer-local-langlands`, `IHR.4/resultant-kills-inertia`.
- **SmoothRepresentationsOfLocalGroups:SR.3**: For GL_m over a nonarchimedean local field and coefficients Q̄_p ≅ ℂ: finite-dimensionality of compact-open invariants of irreducible smooth representations; every irreducible subquotient of n-Ind χ embeds in n-Ind(wχ ⊗ η) for some w ∈ S_m and unramified η (supercuspidal support); and the universal unramified twist n-Ind(χ ⊗ χ_u) over Q̄_p[T(F)/T(O)], whose U-invariants are finite free with specialization isomorphisms ([Ber84, Lem. 1.17]). Needed by `IHR.2/tame-principal-series-criterion`, `IHR.2/tame-hecke-centre`, `IHR.2/tame-local-langlands-charpoly`, `IHR.3/siegel-transfer-local-langlands`.
- **EndoscopicTransferAndUnitaryTraceComparison:ET.6**: The local Langlands correspondence rec_{F_v} for GL_m with Frobenius-semisimple Weil–Deligne parameters including N, its arithmetic normalization rec^T(π) = rec(π ⊗ |det|^{(1−m)/2}) (ACC+ §1.2, [CT14, §2.1]), rec^T(St_m) = Sp_m with W_{F_v} acting on e_i by |·|^{1−i} ∘ Art^{−1} and Ne_i = e_{i−1}, compatibility with supercuspidal support (for π a subquotient of n-Ind χ, the semisimplification of rec(π)|_{W_{F_v}} is ⊕χ_i ∘ Art^{−1}), and the Langlands classification realizing every π with tamely ramified principal-series support as a subquotient of n-Ind_{P_α}⊗St_{α_i}(ψ_i) with rec^T(π) = ⊕Sp_{α_i}(ψ_i|·|^{(1−m)/2+(α_i−1)/2}). Needed by `IHR.2/tame-local-langlands-charpoly`, `IHR.3/siegel-transfer-local-langlands`, `IHR.4/resultant-kills-inertia`.
- **TorsionCohomologyInfrastructure:TC.3**: The Siegel datum of ACC+ §2.2.1 and the unramified Levi Satake identities: G̃ preserving J_n, P = U ⋊ G with G ≅ Res GL_n through the lower right block D, ι_v at split places with ι_v(G(F⁺_v̄)) the block-diagonal Levi via (D_{v^c}, D_v) ↦ diag(Ψᵗc(D_{v^c})^{−1}Ψ, D_v); the map 𝒮 : T̃^S → T^S of (2.2.3); Proposition 2.2.16: 𝒮(P̃_v(X)) = P_v(X)q_v^{n(2n−1)}P^∨_{v^c}(q_v^{1−2n}X). Needed by `IHR.3/siegel-parahoric-level`, `IHR.3/unitary-tame-level`, `IHR.5/ramified-satake-homomorphism`.
- **TorsionCohomologyInfrastructure:TC.2**: Scholze's comparison for G̃ = U(n, n) ([Sch15, Th. 4.3.1, Cor. 5.1.11, Cor. 5.2.6]), equivariant for the whole prime-to-p Hecke algebra H(G̃(A^{∞,p}_{F⁺}), K̃^p) ⊗ O and not only for the spherical algebra away from S: there is N₀ = N₀(n, [F : ℚ]) such that for every m the image of that Hecke algebra in End_{D(O/ϖ^m)}(RΓ_c(X̃_K̃, O/ϖ^m)) is, modulo an ideal of exponent N₀, a continuous quotient of T_cl (the Hecke algebra with the topology defined by the spaces H^0(X̃, ω^{mk} ⊗ ℐ)); and the Hecke eigensystems on those spaces are those of cuspidal cohomological π̃ with (π̃^∞)^{K̃} ≠ 0. Needed by `IHR.6/ramified-interpolation`, `IHR.6/compact-support-compatibility`, `IHR.6/cohomology-compatibility`.
- **TorsionCohomologyInfrastructure:TC.4**: ACC+ Theorems 2.3.5 and 2.3.7 (Scholze, [Sch15, Cor. 5.4.3–5.4.4]), with F containing an imaginary quadratic field: for 𝔪 ⊂ T^S(K, λ) maximal and S as in §3.1, a continuous semisimple ρ̄_𝔪 : G_{F,S} → GL_n(T^S(K, λ)/𝔪) with Frobenius polynomials P_v(X); if ρ̄_𝔪 is absolutely irreducible, N = N(n, [F : ℚ]), an ideal I with I^N = 0 and ρ_𝔪 : G_{F,S} → GL_n(T^S(K, λ)_𝔪/I) with Frobenius polynomials P_v(X). (RT-PAPER-ALLEN-ETAL-23/7 records that no atlas stage yet states these theorems and proposes a stage TC.5; the request names TC.4 as the nearest existing owner.) Needed by `IHR.7/auxiliary-characters`, `IHR.7/boundary-determinant`, `IHR.7/determinant-local-global`.
- **AutomorphicGaloisRepresentationsPartII:AG2.2**: ACC+ Theorem 2.3.3(a): for F containing an imaginary quadratic field and π̃ a cuspidal ξ-cohomological automorphic representation of G̃(A_{F⁺}), a continuous semisimple r_ι(π̃) : G_F → GL_{2n}(Q̄_p) whose Frobenius characteristic polynomial at unramified v is the image of P̃_v(X); and r_ι(π̃^∨) ≅ r_ι(π̃)^∨ ⊗ ε^{1−2n}. Needed by `IHR.6/classical-point-compatibility`, `IHR.6/dual-classical-point-compatibility`.
- **AutomorphicGaloisRepresentationsPartII:AG2.5**: ACC+ Theorem 2.3.3(c): for v above a prime split in an imaginary quadratic subfield of F, WD(r_ι(π̃)|_{G_{F_v}})^{F-ss} ≅ rec^T_{F_v}(π̃_v̄ ∘ ι_v). Needed by `IHR.6/classical-point-compatibility`.
- **IntegralHeckeAndGaloisDeterminants:IHG.3**: The unramified Weil-group polynomial P_{v,σ}(X) ∈ T_v[X] of ACC+ p. 922 for every σ ∈ W_{F_v}: for σ of degree k (a k-th power of geometric Frobenius modulo inertia), the monic polynomial whose roots are the k-th powers of the roots of P_v(X), with coefficients polynomial in T_{v,1}, …, T_{v,n}, T_{v,n}^{−1} and q_v^{±1}; its specialization at an unramified π_v is det(X − rec^T(π_v)(σ)). Needed by `IHR.3/siegel-transfer-operators`, `IHR.3/siegel-transfer-local-langlands`, `IHR.7/ramified-local-determinant`.
- **IntegralHeckeAndGaloisDeterminants:IHG.1**: ACC+ Lemma 3.2.4 (Hensel's lemma for group determinants), routed to IHG.1 by PAPER-ALLEN-ETAL-23: for A a complete Noetherian local O-algebra with residue field k, determinants D_1, D_2 of dimensions n_1, n_2 and D = D_1D_2 whose residual semisimple representations have no common Jordan–Hölder factor, (1) any E_1, E_2 with E_i ≡ D_i mod 𝔪_A and E_1E_2 = D equal D_1 and D_2, and (2) ker D = ker D_1 ∩ ker D_2. Needed by `IHR.7/determinant-restriction-at-R`.
- **IntegralHeckeAndGaloisDeterminants:IHG.2**: Hecke images of an exact triangle: for an H-equivariant exact triangle A → B → C → A[1] in D(O), a natural homomorphism T(A ⊕ B) → T(C)/J with J² = 0 (an element acting by zero on A and on B acts on C through C → A[1] → C, and the product of two such vanishes). Needed by `IHR.6/boundary-compatibility`.
- **ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality**: hecke-adjoint-duality with trivial coefficients for every g ∈ G(A^∞), including the places of the ramified set R ⊂ S: ⟨x, [KgK]y⟩ = ⟨[Kg^{−1}K]x, y⟩ for the Verdier pairing between RΓ_c(X_K, O) and RΓ(X_K, O), so that ι descends to an isomorphism of the images of any subalgebra of H(G(A^∞), K) ⊗ O. Needed by `IHR.5/ramified-hecke-duality`.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors**: Art_{F_v} with the geometric normalization (uniformizers to geometric Frobenius elements, geometricArtinMap) and its unramified coordinate, so that α ↦ t_{v,i}(α) defines characters of W_{F_v}. Needed by `IHR.1/tame-hecke-operators`, `IHR.2/tame-local-langlands-charpoly`.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group**: The local Weil group W_{F_v} with its inertia subgroup, degree map and abelianization W_{F_v}^{ab} ≅ F_v^× through the Artin map. Needed by `IHR.1/tame-hecke-operators`, `IHR.7/ramified-local-determinant`.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity**: Compatibility of the global Artin map with the local ones (globalArtinMap_local), to restrict ψ ∘ Art_F to F_v^×, and the description of characters of G_F^{ab} through idele class characters. Needed by `IHR.5/ramified-twisting`, `IHR.7/auxiliary-characters`.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence**: Global existence: open finite-index subgroups of the idele class group are norm groups of finite abelian extensions, so finite-order characters of G_{F⁺} correspond to finite-order idele class characters. Needed by `IHR.7/auxiliary-characters`.
- **tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev**: Dirichlet-density Chebotarev for finite Galois extensions of number fields: density of Frobenius classes, used for the Kummer-theoretic independence of the uniformizer classes and for comparing determinants by Frobenius traces. Needed by `IHR.7/auxiliary-characters`, `IHR.7/small-level-reduction`.

## Mistakes in the sources

The statements above use the corrected forms. Each entry gives the locator in the published article, what is printed (in our words), the correction and the check.

- **E1** (misprint, affects nothing), §2.2.5, p. 925 (also in arXiv v2, p. 29). Printed: The homomorphism given by Lemma 2.1.13 is written t : Ξ_v → H(GL_n(F_v), I_v) ⊗_ℤ O and called an injective O-algebra homomorphism. Correction: t : O[Ξ_v] → H(GL_n(F_v), I_v) ⊗_ℤ O, defined on the group algebra of Ξ_v. Check: An O-algebra homomorphism needs an O-algebra as domain; the next sentence applies t to an element q_v^{−⟨λ, ρ+(1−n)/2·det⟩}(1, …, α, …, 1) of O[Ξ_v], and Lemma 2.1.13 produces a map on H(M(F), U_M) ⊗ R = O[Ξ_v] for M = T_n.
- **E2** (gap, affects nothing), §2.2.5, pp. 924–926: the invertibility of [I_vgI_v] (citing [Fli11, Cor. 3.4]), the centrality of e_{v,i}(α) in Proposition 2.2.9(2) (citing [Fli11, Prop. 4.11]) and the commutation in Lemma 2.2.10 (citing [Fli11, Th. 4.5]) (also in arXiv v2). Printed: The cited results are applied to every open compact I_v with Iw_v(1,1) ⊂ I_v ⊂ Iw_v(0,1) and to Hecke algebras with coefficients in O. Correction: Flicker proves them for the tame subgroup I_t = Iw_v(1,1) only and for complex coefficients. The general statements hold: invertibility over ℤ[1/q_v] at every intermediate level follows from the same Iwahori–Matsumoto argument (quadratic relation with integer structure constants, T(s)(T(s) − c_s) = q_vT(s²)); centrality at an intermediate level follows over Q̄_p from e H(G, Iw_v(1,1)) e ≅ H(G, I_v) with e the averaging idempotent, and over O because the Hecke algebra is O-torsion-free; the commutation identity is an identity of ℤ-valued functions, which holds over ℤ if it holds over ℂ. Check: Flicker, The tame algebra, §§2–4: the algebra studied is C_c(I_t\G/I_t) over ℂ, with I_t the pro-p Iwahori subgroup; no intermediate level appears. When p divides [I_v : Iw_v(1,1)] the averaging idempotent does not exist over O, so the integral statements need the arguments recorded in IHR.1/tame-double-coset-invertible and IHR.2/tame-hecke-centre.
- **E3** (error, affects a stated result), §2.2.5, pp. 930–931, the sentence before (2.2.17) (also in arXiv v2). Printed: For every Ĩ_v̄ with Ĩw_v̄(1,1) ⊂ Ĩ_v̄ ⊂ Ĩw_v̄(0,1), the source identifies Ĩ_v̄ ∩ G(F⁺_v̄) with a product I_{v^c} × I_v of open compact subgroups of GL_n(F_{v^c}) and GL_n(F_v); Proposition 2.2.18 is then stated with the GL_n polynomials at the levels I_v and I_{v^c}. Correction: The identification holds exactly when the torus subgroup Ã ⊂ (k(v)^×)^{2n} of ι_v(Ĩ_v̄) is a product A′ × A″ of subgroups of the first and last n coordinates; assume this (block-decomposable levels). The levels the paper uses, Ĩw_v̄(1,1) in Lemma 3.2.1(5) and Ĩw_v̄(0,1), are block-decomposable. Check: Take n = 1 and Ã = {(a, a)} ⊂ (k(v)^×)²: Ĩ_v̄ ∩ G(F⁺_v̄) = {(x, y) ∈ O_{F_{v^c}}^× × O_{F_v}^× : c(x)^{−1} ≡ y mod ϖ_v}, which is not a product of subgroups since both projections are onto O^× while the subgroup is proper. For such Ĩ_v̄ the polynomials P_{v,σ}, P_{v^c,σ^{−c}} of Proposition 2.2.18 are not defined.
- **E4** (misprint, affects nothing), §2.2.5, eq. (2.2.6), p. 922 (also in arXiv v2). Printed: The constant term of P_v(X) is printed as +q_v^{n(n−1)/2}T_{v,n}. Correction: (−1)^nq_v^{n(n−1)/2}T_{v,n}, as in the general term and in the proof of Theorem 2.3.5. Check: The general term (−1)^iq_v^{i(i−1)/2}T_{v,i}X^{n−i} gives the sign (−1)^n at i = n, and the constant term of a characteristic polynomial is (−1)^n times the determinant.
- **E5** (misprint, affects nothing), §2.2.5, eq. (2.2.7), p. 922 (also in arXiv v2). Printed: The general term of P̃_v(X) is printed without its power of X. Correction: (−1)^jq_v^{j(j−1)/2}T̃_{v,j}X^{2n−j}. Check: P̃_v is monic of degree 2n and the neighbouring terms carry X^{2n−1}, ….
- **E6** (misprint, affects nothing), §2.2.5, after (2.2.7) (p. 922), after (2.2.12) (p. 926) and Lemma 2.2.13(2) (p. 927) (also in arXiv v2). Printed: The sums defining P̃_{v,σ}(X) and the characteristic polynomial of r_v(σ) are printed with X^{n−i}, i = 0, …, 2n; Lemma 2.2.13(2) also reads 'is equals'. Correction: X^{2n−i} in all three places, and 'equals'. Check: P̃_{v,σ} = P_{v^c,σ^{−c}}P_{v,σ} is a product of two monic polynomials of degree n; with X^{n−i} negative powers would occur. (2.2.17) on p. 931 has X^{2n−i}.
- **E7** (misprint, affects nothing), §2.2.5, Proposition 2.2.9(2), p. 925 (also in arXiv v2, Proposition 2.2.8(2)). Printed: The scalar e_{v,i}(α, π_v) by which e_{v,i}(α) acts is asserted to lie in Q̄_p^×. Correction: e_{v,i}(α, π_v) ∈ Q̄_p; only e_{v,n}(α, π_v) is necessarily a unit. Check: By part (3) the scalar is the i-th elementary symmetric function of the eigenvalues of r_v(σ); for n = 2 and an unramified principal series whose Frobenius eigenvalues on rec^T are a and −a, e_{v,1}(ϖ_v, π_v) = 0.
- **E8** (misprint, affects nothing), §2.2.5, eq. (2.2.12), p. 926 (also in arXiv v2, eq. (2.2.11)). Printed: P_{v^c,σ}(X) is printed as Σ_i(−1)^ie_{v,i}(σ)X^{n−i}. Correction: P_{v^c,σ}(X) = Σ_i(−1)^ie_{v^c,i}(σ)X^{n−i}. Check: The preceding sentence defines e_{v^c,i}(σ) for this purpose, e_{v,i}(·) is defined only on W_{F_v} while σ ∈ W_{F_{v^c}}, and the proof of Lemma 2.2.13 uses ẽ_{v,k}(σ) = Σ_{i+j=k}e_{v,i}(σ)e_{v^c,j}(σ^{−c}).
- **E9** (error, affects nothing), §2.2.5, proof of Proposition 2.2.14, pp. 928–929 (also in arXiv v2). Printed: The roots of P_{v^c,φ_v^{−c}} and P_{v,φ_v} on the summand indexed by μ are printed with the characters θ_{1j} = ψ_j|·|^{μ_{2j}/2} and θ_{2j} = ψ_j|·|^{−μ_{1j}/2}, and (r_v, N_v) is written ⊕Sp_{α_i}(ψ_i|·|^{(1−2n)/2}). Correction: Replace θ_{1j}, θ_{2j} by ψ_j in the two root products, and read (r_v, N_v) ≅ ⊕Sp_{α_i}(ψ_i|·|^{(1−2n)/2+(α_i−1)/2}); then P_{v^c} takes the top μ_{1j} and P_v the bottom μ_{2j} Frobenius eigenvalues of each segment. Check: For n = 1, s = 1, α_1 = 2, μ = (1, 1) the printed roots differ by a factor q_v², whereas the two Frobenius eigenvalues of r_v(φ_v) on Sp_2 differ by q_v; with the correction they are ψ(φ_v) and ψ|·|^{−1}(φ_v), and the final step of the proof goes through unchanged.
- **E10** (misprint, affects nothing), §3.2, proof of Lemma 3.2.1, pp. 955–956 (also in arXiv v2). Printed: The maximal ideals 𝔪_i are defined as pullbacks of 𝔪 along T^{T_i} → T^T. Correction: 𝔪_i ⊂ T^{S_i}, the pullback of 𝔪 along T^{S_i} → T^S. Check: 𝔪 is a maximal ideal of T^S(K, λ) (p. 963 insists on this), and the localizations T^{T_i}_R(K_i, λ)_{𝔪_i} are taken as T^{S_i}(K_i, λ)-algebras.
- **E11** (gap, affects the proof), §3.2, proof of Lemma 3.2.1, last step, p. 957 (also in arXiv v2). Printed: At the remaining places v̄ the source sets K̃_v̄ = ker(G̃(O_{F⁺_v̄}) → G̃(O_{F⁺}/ϖ_v̄^m))·(K ∩ G(O_{F⁺_v̄})) and asserts that K̃ ∩ G(A^∞_{F⁺}) = K. Correction: First replace K by gKg^{−1} with g supported at the places of S outside R ∪ R^c ∪ S_p and the q-adic places, so that K_v ⊂ GL_n(O_{F_v}) everywhere; T^T_R has no operators at those places, so nothing else changes. Check: The construction gives K̃_v̄ ∩ G = K_v̄ ∩ G(O_{F⁺_v̄}), which is K_v̄ only if K_v̄ ⊂ G(O_{F⁺_v̄}); for n ≥ 2 and K_v = gGL_n(O_{F_v})g^{−1}, g = diag(ϖ_v, 1, …, 1), this fails.
- **E12** (misprint, affects nothing), §3.2, Proposition 3.2.2(1)–(2), p. 958 (also in arXiv v2). Printed: The characteristic polynomials are compared in (T̃^T_R(RΓ_c(X̃_K̃, O))/Ĩ_R)[X]. Correction: Ĩ_{c,R} in both places. Check: Only Ĩ_{c,R} is introduced, and D̃_{c,R} is valued modulo Ĩ_{c,R}; part (3) and Corollary 3.2.3 use the right subscript.
- **E13** (misprint, affects nothing), §3.2, proof of Proposition 3.2.2, third bullet, p. 959 (also in arXiv v2). Printed: The inertia relation Res_v^{(2n)!}ρ((τ_v − 1)P_{v,φ_v}(φ_v)) = 0 is asserted for v ∈ R^c − R. Correction: For v ∈ R − R^c. Check: φ_v, Res_v and P_{v,φ_v} are defined only for v ∈ R − R^c (Res_v at the Siegel level q̃_v); the bullet is meant to give part (3), stated for v ∈ R − R^c, and the parallel bullet on p. 961 says v ∈ R − R^c.
- **E14** (misprint, affects nothing), §3.2, proof of Proposition 3.2.2, p. 959 (also in arXiv v2). Printed: The first two properties of the classical points are derived from Theorem 2.3.3 and Proposition 2.2.9. Correction: From Theorem 2.3.3, Proposition 2.2.9 (for v ∈ R ∩ R^c, through ι_v with 2n in place of n) and Lemma 2.2.13 (for v ∈ R − R^c). Check: At v ∈ R − R^c the level is q̃_v and P̃_{v,σ} is built from transferred operators; the needed statement is Lemma 2.2.13, cited nowhere else.
- **E15** (misprint, affects nothing), §3.2, proof of Corollary 3.2.3, p. 960 (also in arXiv v2). Printed: The determinant D̃ to be constructed is said to take values in T̃^T_R(RΓ(X̃_K̃, O)). Correction: A T̃^T_R(RΓ(X̃_K̃, O))/Ĩ-valued determinant D̃. Check: Conditions (1)–(3) compare characteristic polynomials and a trace modulo Ĩ, and what is constructed is a determinant modulo a nilpotent ideal.
- **E16** (misprint, affects nothing), §3.2, proof of Corollary 3.2.3, third bullet, p. 961 (also in arXiv v2). Printed: σ appears in Res_v^{(2n)!}ρ(σ(τ_v − 1)P_{v,φ_v}(φ_v)) = 0 without being quantified. Correction: Add 'for each σ ∈ G_{F,S}', or drop σ as on p. 959. Check: The two readings are equivalent because ρ(σ) is invertible.
- **E17** (gap, affects nothing), §3.2, proof of Lemma 3.2.1, p. 956 (also in arXiv v2). Printed: After possibly enlarging O, characters ψ_1, ψ_2 of finite prime-to-p order, unramified at S, never both ramified above one rational prime, and separating the Frobenius characteristic polynomials at R, are asserted to exist, and 'a very similar argument' is said to give ψ as in Lemma 3.2.1(3). Correction: Existence holds: take ψ = χ|_{G_F} with χ a character of G_{F⁺} of odd prime order r ≠ p, r larger than the number of excluded values, unramified at the places below S (and below R ∪ R^c ∪ S_p for ψ) with prescribed values at the Frob_v̄ (v̄ below R); such χ exist by class field theory, Kummer theory and Chebotarev, as in IHR.7/auxiliary-characters. Check: The coprimality conditions only constrain ψ(Frob_v)ψ(Frob_{v^c}) = χ(Frob_v̄)² to avoid finitely many values; the independence of the uniformizer classes modulo r follows from the principle that an element which is an r-th power at a density-one set of places is an r-th power.
- **E18** (misprint, affects nothing), §3.2, the sentence after Proposition 3.2.2, p. 958 (also in arXiv v2). Printed: The source says that for R empty Proposition 3.2.2 is Proposition 2.3.9. Correction: For R empty Proposition 3.2.2 is the analogue of Proposition 2.3.9 for compactly supported cohomology with trivial coefficients (implicit in [Sch15, Cor. 5.2.6], as the next sentence says). Check: Proposition 2.3.9 concerns T̃^S(K̃, λ̃) acting on RΓ(X̃_K̃, 𝒱_λ̃), not on RΓ_c(X̃_K̃, O).

## Structure

- PotentialAutomorphyInfrastructure:PA.0/ramified-satake-descent states ACC+ Theorem 2.4.8, whose statement defines T̃^T_R and T^T_R through the operators t_{v,i}(σ), e_{v,i}(σ) of ACC+ §2.2.5 and whose proof uses the invertible strongly positive elements of Lemma 2.2.10 and (2.2.17). Those objects are planned only here (IHR.1, IHR.3, IHR.5), yet the PA.0 node lists only PA.0/coefficient-satake-descent and SR.1 as prerequisites. Theorem 2.4.8 is used only in ACC+ §3 (pp. 954, 958, 962), i.e. only by IHR.7/boundary-determinant. RT-PAPER-ALLEN-ETAL-23/4 (unverified) reaches the same conclusion. Either (a) move Theorem 2.4.8 to this roadmap as a node of IHR.5 (after IHR.5/ramified-satake-homomorphism), keeping in PA.0 only Theorem 2.4.2 (owned by ALS.4/siegel-stratum-localization) and the split morphisms α, β, γ, δ of §2.1.9; or (b) keep it in PA.0 and add IntegralHeckeAndGaloisDeterminantsPartII:IHR.5/unitary-ramified-hecke-algebra, IHR.5/ramified-hecke-algebra, IHR.5/ramified-satake-homomorphism and IHR.3/siegel-strongly-positive-invertible to its prerequisites, so that PA.0 requires IHR.1, IHR.3 and IHR.5 while IHR.7 requires PA.0 (no stage cycle). This packet imports the existing PA.0 node, consistent with (b), and works unchanged under (a).
- PotentialAutomorphyInfrastructure:PA.3/fontaine-laffaille-deformation-hecke-map and PA.4/diamond-linear-deformation-hecke-map (ACC+ Propositions 6.5.3 and 6.5.11, and their ordinary analogues 6.6.7 and 6.6.9) apply ACC+ Theorem 3.1.1 but cite AutomorphicGaloisRepresentationsPartII:AG2.5, which plans local–global compatibility only in characteristic zero. Replace AG2.5 by IntegralHeckeAndGaloisDeterminantsPartII:IHR.7/local-global-away-from-p (and IHR.1/tame-hecke-operators for the characters ψ_{v,i} of Proposition 6.5.11) in the prerequisites of those PA nodes.
- The tame torus embedding t (IHR.1/tame-torus-embedding) and the invertibility of tame double cosets are planned here for GL_n, the only group the sources need. RT-PAPER-ALLEN-ETAL-23/16 (unverified) proposes a single owner, the pending SmoothRepresentationsOfLocalGroupsPartII (parahoric centres), which would also serve the pro-prime-to-ℓ Iwahori Lemma 7.3 of Böckle–Harris–Khare–Thorne routed to GValuedDeformationsAndPotentialAutomorphy. When SmoothRepresentationsOfLocalGroupsPartII is designed, plan there the tame Bernstein-type embedding R[T(F)/T_U] → H(G(F), U) ⊗ R for split G and Iw_1 ⊆ U ⊆ Iw with q ∈ R^×, with invertibility and centre; then IHR.1/tame-double-coset-invertible and IHR.1/tame-torus-embedding become its GL_n specializations, keeping their ids and the GL_n normalization t_{v,i}(α) = q_v^{(i−1)v(α)}t([e_i(α)]) here.

## Suggested Lean file

research/blueprint/suggested/IntegralHeckeAndGaloisDeterminantsPartII.lean gives Lean forms for the local layers (tame levels, the tame torus, the embedding t, the operators t_{v,i}, e_{v,i}, the polynomials P_{v,σ}, the Siegel levels and transferred operators, the resultant and the linear algebra of Corollary 2.2.15, and the matrix representation underlying E_v), with all proofs left open, against Mathlib's Hecke coset modules and Tau Ceti's Hecke ring structure; the global declarations, whose carriers the pinned libraries lack, are listed in its omission ledger with their names and statements.
