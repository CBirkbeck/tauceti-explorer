# Endoscopic transfer and unitary trace comparison — layers ET.4–ET.6

**Summary.** These layers turn the endoscopic machinery of ET.0–ET.3 into the three comparison theorems that the noncompact unitary argument of Caraiani–Scholze uses. ET.4 proves the simple stable and twisted trace formulas for unitary similitude groups over CM fields with [F^+:ℚ] ≥ 2, of every rank and signature: the stable elliptic part of the trace formula of an endoscopic group equals the discrete part of the twisted trace formula of its base-change group. It also contains the Arthur–Clozel cyclic base change and automorphic induction for GL_n and the unitary–GL_n base change that the local correspondence of ET.6 needs. ET.5 counts fixed points of Hecke–Frobenius correspondences on Igusa varieties and stabilizes the count: Shin's stable trace formula for Igusa varieties, with its transfer at p from J_b to the endoscopic groups. ET.6 constructs the local Langlands correspondence for GL_n over p-adic fields of characteristic zero with full Weil–Deligne parameters, following Scholze's characterization by the cohomology of deformation spaces of one-dimensional p-divisible groups, and the Jacquet–Langlands correspondence with Badulescu's extension to Grothendieck groups.

## Scope and ownership

ET.4 owns: Harish-Chandra's character theorem for p-adic groups and Clozel's twisted characters (the early character prefix, which no lower layer plans); Kottwitz's Tamagawa number formula with the values for the unitary similitude groups; the stable elliptic distribution ST^H_e and the coefficient ι(G,H); Kottwitz's stabilization of the elliptic terms; the base-change groups 𝒢_n⃗ with the L-morphisms BC and ζ̃; the unramified, split-place, bad-place and small-level base-change transfers; archimedean Euler–Poincaré and twisted Lefschetz functions for inner forms of arbitrary signature; the invariant twisted trace formula on 𝒢_n⃗θ; cuspidal Levi subsets and their absence when [F^+:ℚ] ≥ 2; the simplified twisted geometric and spectral sides and the stable–twisted identity; the simple trace formula for division-algebra unitary groups. The proposed sub-layer ET.4b owns local and global cyclic base change of prime degree for GL_n, cyclic automorphic induction and the base change and descent between unitary groups and GL_n. Two statements are carried for consumers with an explicit dependency gap: the endoscopic classification of unitary groups for generic parameters and the transfer between GSp_4 and GL_4.

ET.5 owns: acceptable elements of J_b(ℚ_p) and acceptable test functions; the application of the Fujiwara–Varshavsky trace formula to Frobenius-twisted correspondences on Igusa varieties; Kottwitz triples for Igusa varieties with their invariant and effectivity; p-adic types; the classification of fixed points by effective triples; Shin's counting formula; stabilization away from p and at ∞; the endoscopic data of J_b through the Levi M_b; the transfer at p; the endoscopic test functions φ^H; Shin's stable trace formula; the density of acceptable functions; and the unitary specialisation used by ET.7b.

ET.6 owns: segments, multisegments and the Zelevinsky and Langlands classifications of irreducible representations of GL_n(F); truncation, ladders and constituent criteria; Tadić's unitary dual; Weil–Deligne parameters of segments; the characterizing properties of the correspondence; Scholze's deformation spaces with Drinfeld level structure, test functions, norm maps, descent, the comparison of two functions; the division-algebra Shimura varieties at Drinfeld level and their point count; the global Galois input; Scholze's characterization theorem; the Lubin–Tate comparison; bijectivity on supercuspidals; Harris's non-Galois automorphic induction; L- and ε-factors of pairs; the full Weil–Deligne correspondence; semisimple parameters; the local Jacquet–Langlands correspondence; Badulescu's Langlands–Jacquet map; the non-transfer obstruction for generic principal series; the explicit level-zero case.

Not in these layers. ET.6a (the two-tower realization), ET.7 and its branches ET.7a and ET.7b are planned in the ET.6a part of this roadmap; this document states what those layers import from ET.4–ET.6. The general Fujiwara–Varshavsky trace formula belongs to EtaleDualityAndPerverseSheaves EDC.8; Honda–Tate theory and Tate's theorem to AbelianSchemesAndArithmeticModuliPartII F0 and F3; Igusa varieties to IgusaVarietiesAndTorsionConcentration IG.0–IG.1; the Kottwitz set B(G) and J_b to BunGAndNewtonStrata BG0–BG1; Weil–Deligne representations and their L- and ε-factors to ArithmeticGaloisRepresentations R01.2; Godement–Jacquet and Rankin–Selberg factors to AutomorphicLFunctionsAndLocalFactors AL.1–AL.3; the untwisted invariant trace formula to AutomorphicSpectralTheory AS.6; smooth representations, Jacquet modules, the Langlands classification and the Satake isomorphism to SmoothRepresentationsOfLocalGroups. Equal-characteristic local fields are not covered by ET.6: deformation spaces of p-divisible groups do not exist there with the same hypotheses.

## Conventions

p-adic fields have characteristic zero. ν = |det| is the unramified character of GL_d(F). Local class field theory Art_F sends uniformizers to geometric Frobenius; |·| : W_F → ℝ_{>0} sends geometric Frobenius to q^{−1}. Weil–Deligne representations follow ArithmeticGaloisRepresentations R01.2; the special block Sp_k has r(w)e_i = |w|^i e_i and N e_i = e_{i+1}, so r(w) N r(w)^{−1} = |w| N. Scholze's rec(π) is the semisimple Weil-group part and σ(π) = rec(π)((1−n)/2); the full correspondence rec_F with monodromy is fixed by rec_F(L(Δ)) = rec_F(ρ) ⊗ Sp_k for Δ = [ρ, ν^{k−1}ρ], so that the Steinberg representation St_n corresponds to |·|^{(1−n)/2} ⊗ Sp_n. Induction is normalised parabolic induction. Langlands quotients L(m) and Zelevinsky subrepresentations Z(m) are related by Zelevinsky's involution, L(m) = Z(m^#). The unitary similitude groups G_n⃗, their dual groups, the character ϖ and the L-morphisms η̃ are those of ET.0/unitary-elliptic-endoscopic-data; the involution defining the twisted space is g^♯ = Φ_n⃗ ᵗ(g^c)^{−1} Φ_n⃗^{−1}. Transfer factors follow ET.1 with Kottwitz's sign convention for the Igusa stabilization (Shin 2010 Remark 5.5: s versus s^{−1}). Tamagawa numbers are for the Tamagawa measure on G(𝔸)/A_{G,∞}. Coefficients of étale cohomology are ℚ̄_ℓ with ℓ ≠ p and a fixed isomorphism ℚ̄_ℓ ≅ ℂ.

## Exact supplier contracts

### From FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

Deformation theory of p-divisible groups with O-action over complete local rings with perfect residue field (Grothendieck–Messing or Dieudonné-theoretic form), in the generality of one-dimensional ϖ-divisible O-modules of height n and of D-groups, as used for R_β and for the D-groups of Scholze 2010 §§2, 4 and 7.

This supplies `ET.6/drinfeld-level-deformation-spaces`; `ET.6/norm-maps-and-base-change-identities`.

### From ClassicalAdicEtaleCohomology:H1:formal-adic-comparison

Berkovich's nearby cycles for formal schemes locally of finite type over a complete discrete valuation ring and their comparison with algebraic nearby cycles (used for R_β,m and for the Lubin–Tate tower, Scholze 2010 Theorems 2.5 and 11.1).

This supplies `ET.6/drinfeld-level-deformation-spaces`; `ET.6/lubin-tate-comparison`.

### From LefschetzPencilsAndVanishingCycles:LPV.6

Nearby cycles of schemes over a henselian discrete valuation ring with constructible ℓ-adic coefficients, compatibility with proper pushforward and with completion at closed points (Scholze 2010 Lemmas 9.1–9.2).

This supplies `ET.6/drinfeld-level-deformation-spaces`; `ET.6/division-algebra-shimura-varieties`; `ET.5/igusa-fixed-point-formula`.

### From EtaleDualityAndPerverseSheaves:EDC.5

The scheme perverse/recollement interface formerly imported through ET.2a:duality-perversity (RS-19 link EDC.5 → ET.5), as the coefficient framework for the Igusa correspondences.

This supplies `ET.5/igusa-fixed-point-formula`.

### From EtaleDualityAndPerverseSheaves:EDC.6

Coefficient realization of the duality operations formerly imported through ET.2a:duality-perversity (RS-19 link EDC.6 → ET.5).

This supplies `ET.5/igusa-fixed-point-formula`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group

The local Weil group W_F with its topology, inertia, the degree map to ℤ and the norm |·| : W_F → ℝ_{>0}, as the carrier of Weil–Deligne parameters.

This supplies `ET.6/segment-wd-parameter`; `ET.6/llc-characterizing-properties`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

The local Artin map with the geometric-Frobenius normalisation (uniformizers to geometric Frobenius), giving the n = 1 case of the correspondence.

This supplies `ET.6/llc-characterizing-properties`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

Global class field theory for cyclic extensions: the character ω of 𝔸_F^×/F^×N(𝔸_E^×) attached to a cyclic extension E/F.

This supplies `ET.4/global-cyclic-base-change`.

### From tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Maximal tori, Levi subgroups and anisotropic tori of connected reductive groups over ℚ and ℝ, used to define cuspidal groups.

This supplies `ET.4/cuspidal-levi-subsets`.

Imports of single nodes of other roadmaps are listed under *Needs* at each target. The main ones are ET.0–ET.3 of this roadmap; AutomorphicSpectralTheory AS.6 (coarse, fine and invariant trace formula, compact quotients, Euler–Poincaré functions); AdelicAlgebraicGroups AA.2 (Tamagawa measures and numbers); ReductiveGroupsPartII RG2.1 and RG2.5 (z-extensions, dual and L-groups, Levi L-embeddings); SmoothRepresentationsOfLocalGroups SR.0–SR.5; ArithmeticGaloisRepresentations R01.2–R01.3; AutomorphicLFunctionsAndLocalFactors AL.1–AL.3; EtaleDualityAndPerverseSheaves EDC.8 (correspondences, Fujiwara–Varshavsky); IgusaVarietiesAndTorsionConcentration IG.0–IG.1; BunGAndNewtonStrata BG0–BG1; PELModuli M0–M5; AbelianSchemesAndArithmeticModuliPartII F0 and F3.

## How to read the build

ET.4 starts with harmonic analysis (characters, Tamagawa numbers, the stable elliptic distribution and its stabilization), builds the base-change groups and their transfers place by place, and then simplifies the twisted trace formula to the stable–twisted identity. Its ET.4b part (cyclic base change and induction, unitary base change) comes after the twisted trace formula and before ET.6. ET.5 is independent of ET.6: it needs only ET.4's stable distributions and archimedean functions, the Fujiwara–Varshavsky theorem and the Igusa geometry. ET.6 first builds the representation theory of GL_n (segments to Tadić), then Scholze's local construction (§§2–7), then the global step (§§8–10), and finally the characterization, bijectivity and L- and ε-factors (§§11–14), the full Weil–Deligne correspondence and the inner forms. Within each layer the targets are listed in dependency order; ★ marks a planet.

## Layer ET.4: Simple stable and twisted unitary trace formulas

The layer has four parts. Harmonic analysis: Harish-Chandra's character theorem and twisted characters, Kottwitz's formula for Tamagawa numbers, the stable elliptic distribution and Kottwitz's stabilization of the elliptic terms. Base change: the groups 𝒢_n⃗ and their L-morphisms, transfers at unramified, split, bad and archimedean places, and the level N_0 at which small-support functions are base-change transfers. The simple twisted trace formula: cuspidal subsets, their absence for [F^+:ℚ] ≥ 2, and the resulting identity of the stable elliptic part with a discrete twisted spectral side. The proposed sub-layer ET.4b: Arthur–Clozel's local and global cyclic base change and automorphic induction, and the unitary–GL_n base change, all needed by ET.6 and therefore placed before it.

### ET.4.1 Harish-Chandra's character theorem and the Weyl integration formula over p-adic fields ★

Node `ET.4/padic-character-distributions` (theorem). Planet: *Harish-Chandra's character theorem*.

Let F be a non-archimedean local field of characteristic 0, G a connected reductive group over F and π an admissible irreducible smooth complex representation of G(F). (a) For f ∈ C_c^∞(G(F)) the operator π(f) has finite rank, and Θ_π(f) = tr π(f) is an invariant distribution. (b) (Harish-Chandra) There is a locally integrable function θ_π on G(F), locally constant on the regular semisimple set G(F)_rs and invariant under conjugation, with Θ_π(f) = ∫_G f(g) θ_π(g) dg for every f; |D^G|^{1/2} θ_π is locally bounded. (c) (Weyl integration formula) For f ∈ C_c^∞(G(F)), ∫_G f(g) dg = Σ_T |W(G,T)(F)|^{-1} ∫_{T(F)} |D^G(t)| O_t(f) dt, the sum over representatives T of the G(F)-conjugacy classes of maximal F-tori, with the orbital integrals and measures of ET.1/orbital-integral. (d) Consequently Θ_π(f) = Σ_T |W(G,T)(F)|^{-1} ∫_{T(F)} |D^G(t)| θ_π(t) O_t(f) dt, and Θ_π is determined by θ_π on the elliptic regular set together with the characters of proper Levi subgroups through the van Dijk formula for induced representations.

The precise hypotheses are: F non-archimedean of characteristic 0 (the theorem is used only in characteristic 0 here). π admissible and of finite length (irreducible representations are admissible by SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles).

([R. E. Kottwitz, Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), Introduction, pp. 394–396). States Harish-Chandra's theorem that the distribution character of an admissible representation is given by a locally integrable function, locally constant on the regular set, and outlines the descent to the Lie algebra.

([R. E. Kottwitz, Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §7, pp. 421–423 (7.7)). Derives the Weyl integration formula on the Lie algebra; the group form is the same computation with the Weyl discriminant D^G.

([J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §2, p. 12 (Proposition 2.2)). Records the corresponding statement for twisted characters and uses the untwisted theorem as input.

Finite rank of π(f) is admissibility: f is bi-invariant under some compact open K and π(f) factors through π^K.

Local integrability and local constancy on G_rs: Harish-Chandra's theorem, proved by descent to the Lie algebra and the local integrability of Fourier transforms of orbital integrals (ET.1/fourier-transform-orbital-integrals); cited as stated by Kottwitz's Clay notes, Introduction pp. 394–396.

Weyl integration formula: Kottwitz's Clay notes §7 (Lie algebra version, 7.7, p. 422) and its group analogue, using the measures on centralizers of ET.1/orbital-integral.

(d) combines (b) and (c); the formula for parabolically induced characters is van Dijk's, recorded with the induction functor of SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction.

**Acceptance.**

- For G = GL_1, θ_χ = χ for a character χ, and the Weyl integration formula is the identity ∫_{F^×} f = ∫_{F^×} f.
- For the Steinberg representation of GL_2(F), θ_St = −1 on the regular elliptic set (a computation used in ET.6/acceptance-examples).
- Θ_π is nonzero on C_c^∞(G(F)_rs) for every irreducible π (linear independence of characters).

*Used by:* `ET.4/twisted-characters`; `ET.4/local-cyclic-base-change`; `ET.6/norm-maps-and-base-change-identities`; `ET.6/local-jacquet-langlands`; `ET.6/badulescu-langlands-jacquet-map`.

*Needs:* `ET.1/orbital-integral`; `ET.1/fourier-transform-orbital-integrals`; `SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles`; `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`; `mathlib:MeasureTheory.Measure.IsHaarMeasure`.

### ET.4.2 Twisted characters of θ-stable representations

Node `ET.4/twisted-characters` (theorem).

Let E/F be a cyclic extension of non-archimedean local fields of characteristic 0 with Gal(E/F) generated by σ, G_0 connected reductive over F and G = R_{E/F}G_0, so σ acts on G(F) = G_0(E). Let Π be an irreducible admissible representation of G_0(E) with Π ≅ Π∘σ, and fix an intertwiner I_σ : Π → Π∘σ (unique up to scalar; normalised by I_σ^ℓ = 1 where ℓ = [E:F], which fixes it up to an ℓ-th root of unity). (a) The twisted trace f ↦ tr(Π(f) I_σ) on C_c^∞(G_0(E)) is given by a locally integrable function Θ_{Π,σ}, locally constant near σ-regular elements and invariant under σ-conjugacy g ↦ h g σ(h)^{-1}. (b) (Shintani relation, used to define base change; G_0 = GL_n) If γ ∈ GL_n(E) has σ-regular norm Nγ ∈ GL_n(F) (the norm map of AC Ch. 1 §1), the value Θ_{Π,σ}(γ) depends only on the conjugacy class of Nγ; for general G_0 the norm is defined on stable σ-classes (Labesse 1999 §2.5). (c) The twisted Weyl integration formula expresses ∫_{G_0(E)} f in terms of twisted orbital integrals over σ-conjugacy classes, with the norm map identifying σ-regular σ-conjugacy classes with regular stable classes of G_0(F) that are norms. (d) The same holds for the coset 𝒢θ of a non-connected group 𝒢^+ = 𝒢 ⋊ ⟨θ⟩ with θ of finite order acting by a quasi-semisimple automorphism, which is the form used for the unitary twisted spaces of ET.4/twisted-trace-formula.

The precise hypotheses are: F of characteristic 0; Π irreducible admissible and σ-stable.

([J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §1, Lemmas 1.1–1.5, pp. 4–10). Defines the norm map for cyclic base change of GL(n), shows that an elliptic regular element is a norm iff its determinant is a norm, and that the norm is injective on σ-conjugacy classes.

([J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §2, Proposition 2.2, p. 12). States that the twisted character of a σ-stable admissible representation is a locally integrable function, locally constant near σ-regular elements.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, pp. 31–32). Integrates the twisted character of the base-change lift as a function when proving bijectivity.

(a): Clozel's extension of Harish-Chandra's theorem to non-connected groups, recorded as AC Ch. 1 Proposition 2.2 (p. 12); the proof follows ET.4/padic-character-distributions on the coset.

(b),(c): the norm map is injective on σ-conjugacy classes (AC Ch. 1 Lemma 1.5, p. 10) and an elliptic regular u is a norm iff det u is a norm (AC Ch. 1 Lemma 1.4, p. 9); the twisted Weyl formula is AC Ch. 1 §2.

(d): the same argument applied to the coset of a quasi-semisimple automorphism of finite order.

**Acceptance.**

- For n = 1, Θ_{χ∘N,σ}(γ) = χ(Nγ) for a character χ of F^× (the norm map is the field norm).
- If Π is not σ-stable no twisted character is defined; the statement requires Π ≅ Π∘σ.
- Changing I_σ by an ℓ-th root of unity ζ multiplies Θ_{Π,σ} by ζ.

*Used by:* `ET.4/base-change-transfer-of-functions`; `ET.4/twisted-trace-formula`; `ET.4/twisted-spectral-side`; `ET.4/local-cyclic-base-change`; `ET.6/scholze-test-functions`; `ET.6/norm-maps-and-base-change-identities`; `ET.6/supercuspidal-bijection`.

*Needs:* `ET.4/padic-character-distributions`; `ET.0/norm-correspondence`; `ReductiveGroupsPartII:RG2.5/dual-of-weil-restriction`.

### ET.4.3 Kottwitz's formula for Tamagawa numbers ★

Node `ET.4/tamagawa-number-formula` (theorem). Planet: *Kottwitz's Tamagawa number formula*.

Let G be a connected reductive group over a number field F (here F = ℚ), Γ = Gal(F̄/F), Ĝ its dual group with Γ-action, and τ(G) the Tamagawa number of G (AdelicAlgebraicGroups:AA.2/tamagawa-number, for the Tamagawa measure on G(𝔸)/A_{G,∞}). Then τ(G) = |π_0(Z(Ĝ)^Γ)| · |ker^1(F, G)|^{-1}, where ker^1(F,G) = ker(H^1(F,G) → ∏_v H^1(F_v,G)); moreover |ker^1(F,G)| = |ker^1(F, Z(Ĝ))|. The input is Weil's conjecture τ(G_sc) = 1 for simply connected G_sc. For the unitary similitude groups G_n⃗ of ET.0/unitary-elliptic-endoscopic-data with r = number of blocks of n⃗: |π_0(Z(Ĝ_n⃗)^Γ)| = 2^r if [F^+:ℚ] is even or every n_i is even and 2^{r−1} otherwise, so τ(G_n⃗) ∈ {2^r, 2^{r−1}}; τ(G_n⃗) = 2^r when every n_i is even, τ(G_n⃗) = 2^{r−1} when [F^+:ℚ] is odd and some n_i is odd; and the base-change group 𝒢_n⃗ = R_{F_0/ℚ}(G_n⃗ ×_ℚ F_0) has τ(𝒢_n⃗) = 1. The coefficient ι(G,H) = τ(G) τ(H)^{-1} |Out(H,s,η)|^{-1} of ET.4/stable-elliptic-distribution is computed from these values.

The precise hypotheses are: G connected reductive over a number field; Weil's conjecture τ(G_sc) = 1 for the simply connected groups that occur (the special unitary and unitary groups here, for which it is classical; the general case is Kottwitz 1988 with Chernousov's E_8 Hasse principle).

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §1.2, display (1.2), p. 4). States Kottwitz's formula τ(G) = |π_0(Z(Ĝ)^Γ)|/|ker^1(ℚ,G)| as the convention behind the Igusa coefficients.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.1, Lemma 3.1 with (3.3) and Remark 3.2, pp. 13–14). Computes the component group and ker^1 for G_n⃗, gives τ(G_n⃗) ∈ {2^r, 2^{r−1}} and τ = 1 for the base-change group, citing Kottwitz 1988 p. 629.

Kottwitz 1988 (Ann. of Math. 127, p. 629): reduce to G_der simply connected by a z-extension (ReductiveGroupsPartII:RG2.1/z-extension-existence), use τ(G_sc) = 1 and Ono's formula for tori; cited here through Shin 2010 display (1.2) and Shin 2011 (3.3).

|ker^1(F,G)| = |ker^1(F,Z(Ĝ))| is Kottwitz 1984 (4.2.2), the duality of ET.0/kottwitz-duality.

For G_n⃗: Z(Ĝ_n⃗) = ℂ^× × ∏_{σ,i} ℂ^×; its Γ-invariants are the (λ,(g_i)) with g_i = ±1 and λ (∏ g_i^{n_i})^{[F^+:ℚ]} = 1, giving the component count; ker^1 of 𝒢_n⃗ is trivial by Shapiro's lemma and Hilbert 90 (Shin 2011 Lemma 3.1 and Remark 3.2).

**Acceptance.**

- τ(𝔾_m) = 1 and τ(R_{F_0/ℚ}𝔾_m) = 1.
- τ(U(1)) = 2 for the norm-one torus of an imaginary quadratic F_0 (π_0 of (ℂ^×)^Γ = {±1}, ker^1 trivial).
- For n⃗ = (1) and [F^+:ℚ] odd, |π_0(Z(Ĝ_{(1)})^Γ)| = 2^{r−1} = 1 and ker^1 is trivial, so τ(G_{(1)}) = 1 (Shin 2011 Remark 3.2).

*Used by:* `ET.4/stable-elliptic-distribution`; `ET.4/elliptic-stabilization`; `ET.4/twisted-geometric-side`; `ET.4/acceptance-examples`; `ET.5/stable-igusa-trace-formula`; `ET.5/acceptance-examples`.

*Needs:* `AdelicAlgebraicGroups:AA.2/tamagawa-number`; `AdelicAlgebraicGroups:AA.2/tamagawa-measure`; `ET.0/kottwitz-duality`; `ET.0/unitary-elliptic-endoscopic-data`; `ReductiveGroupsPartII:RG2.1/z-extension-existence`; `ReductiveGroupsPartII:RG2.5/langlands-dual-group`.

### ET.4.4 The stable elliptic distribution ST^H_e and the coefficient ι(G,H)

Node `ET.4/stable-elliptic-distribution` (definition).

Let G be connected reductive over ℚ with G_der simply connected, (H, s, η) an elliptic endoscopic triple (ET.0/endoscopic-datum, ordinary case) and h ∈ C_c^∞(H(𝔸)) a product function, with h_∞ a stable cuspidal function (a linear combination of the averaged pseudo-coefficients of ET.1/pseudocoefficients). Define ST^H_e(h) = τ(H) Σ_{γ_H} SO_{γ_H}(h), the sum over a set of representatives of the ℚ-elliptic semisimple stable conjugacy classes γ_H in H(ℚ), where SO_{γ_H}(h) = ∏_v SO_{γ_H}(h_v) (ET.1/kappa-and-stable-orbital-integrals) with the Tamagawa measure on the centralizer transported to an inner form compact modulo centre at ∞ and the sign e(I_∞) absorbed as in Kottwitz 1986 §9. Define ι(G,H) = τ(G) τ(H)^{-1} |Out(H,s,η)|^{-1}, with Out(H,s,η) the outer automorphism group of the triple (ET.0/endoscopic-datum) and τ the Tamagawa numbers of ET.4/tamagawa-number-formula.

The precise hypotheses are: Only ℚ-elliptic semisimple classes enter; h_∞ must be stable cuspidal so that non-elliptic terms vanish at ∞.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §7, p. 27). Defines ι(G,H) as τ(G)τ(H)^{-1}|Out(H,s,η)|^{-1} and uses ST^H_e as the stable elliptic part of the trace formula of H.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.3, Theorem 5.3.2, p. 68; Proposition 5.5.1, p. 73). Uses ST^{G_n⃗}_e as the sum of stable orbital integrals over ℚ-elliptic semisimple stable classes, normalised by τ.

The sum is finite for h with compact support modulo the centre, because the elliptic stable classes meeting a compact set modulo the centre form a finite set.

ST^H_e is a stable distribution: each SO_{γ_H} is stable (ET.1/kappa-and-stable-orbital-integrals).

ι(G,H) depends only on the isomorphism class of the triple.

The definition exposes the following operations and relations.

- `StableEllipticDistribution` (constructor): ST^H_e(h) = τ(H) Σ_{γ_H} SO_{γ_H}(h) over ℚ-elliptic semisimple stable classes.
- `StableEllipticDistribution.isStable` (characterisation): ST^H_e vanishes on h all of whose stable orbital integrals vanish.
- `StableEllipticDistribution.linear` (simp): ST^H_e is linear in h.
- `endoscopicCoefficient` (constructor): ι(G,H) = τ(G)τ(H)^{-1}|Out(H,s,η)|^{-1}.
- `endoscopicCoefficient_self` (simp): ι(G,G) = 1 for the trivial triple.
- `endoscopicCoefficient_iso` (relation): ι(G,H) depends only on the isomorphism class of (H,s,η).

**Checks.**

- `StableEllipticDistribution.torus` (computation): For H = T a torus every element is semisimple and stably conjugate only to itself, so ST^T_e(h) = τ(T) Σ_{t ∈ T(ℚ)} h(t) for h compactly supported modulo the centre, with the measures of AdelicAlgebraicGroups:AA.2.
- `endoscopicCoefficient_equal_blocks` (computation): For G = G_{2n} and H = G_{n,n}, |Out(H,s,η)| = 2, so ι(G,H) = τ(G)/(2τ(H)).
- `StableEllipticDistribution.non_elliptic_zero` (non-example): A ℚ-semisimple class that is not elliptic in H(ℝ) contributes nothing; a definition summing over all semisimple classes would not be stable and fails the stability test.
- `endoscopicCoefficient_self_test` (degenerate): For the trivial triple (G,1,id), ι(G,G) = 1.

**Acceptance.**

- For H = G and G anisotropic modulo centre, ST^G_e(h) is the elliptic part of the stable trace formula of G.
- ι(G,G) = |Out(G,1,id)|^{-1} = 1.
- For the unitary similitude endoscopic groups G_{n_1,n_2} of ET.0/unitary-elliptic-endoscopic-data, |Out| = 2 when n_1 = n_2 and 1 otherwise.

*Used by:* Shin 2010 Theorem 7.2 (the stable Igusa trace formula is a sum of ι(G,H) ST^H_e(h^H) over elliptic triples (ET.5/stable-igusa-trace-formula)); Caraiani–Scholze non-compact §5.5, Proposition 5.5.1 (the geometric side of the twisted trace formula equals τ(G_n⃗)^{-1} ST^{G_n⃗}_e (ET.4/twisted-geometric-side)); Shin 2011 Corollary 4.7 (same identity in the compact case); `ET.4/elliptic-stabilization`; `ET.4/twisted-geometric-side`; `ET.5/stable-igusa-trace-formula`.

*Needs:* `ET.1/kappa-and-stable-orbital-integrals`; `ET.0/endoscopic-datum`; `ET.4/tamagawa-number-formula`; `ET.1/pseudocoefficients`; `AdelicAlgebraicGroups:AA.2/tamagawa-measure`.

### ET.4.5 Kottwitz's stabilization of the elliptic terms

Node `ET.4/elliptic-stabilization` (theorem).

Let G be connected reductive over ℚ with G_der simply connected, f = ∏_v f_v ∈ C_c^∞(G(𝔸)) with f_∞ the Euler–Poincaré (Lefschetz) function of an irreducible algebraic representation ξ (ET.1/pseudocoefficients). Let T_e(f) = Σ_{γ_0} τ(I_0) · Σ_{γ ∈ adelic class} e(γ) O_γ(f) be the elliptic part of the trace formula written over pairs (γ_0, γ) with γ_0 elliptic semisimple and γ adelically conjugate to γ_0. Then T_e(f) = Σ_{(H,s,η)} ι(G,H) ST^H_e(f^H), the sum over isomorphism classes of elliptic endoscopic triples of G, where f^H = ∏_v f^H_v with f^H_v a transfer of f_v (ET.1/matching-functions, ET.3/local-transfer-existence), f^H_v the unramified image of f_v at almost all v (ET.3/fundamental-lemma-almost-all-places), and f^H_∞ the explicit combination of averaged pseudo-coefficients of ET.1/archimedean-pseudocoefficient-transfer. The ker^1 factors and the κ-sum are those of ET.0/global-kottwitz-obstruction.

The precise hypotheses are: G_der simply connected (achieved by a z-extension otherwise); f_∞ stable cuspidal (Euler–Poincaré), so only elliptic terms occur; transfer factors normalised as a global product equal to 1 on rational pairs (ET.1/transfer-factor-properties).

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.4, p. 36). Records that the trace formula for compact quotients is stabilised on the geometric side after Langlands and Kottwitz, especially Kottwitz 1986 Theorem 9.6.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5.1, Lemma 5.1, pp. 15–16; §7, Lemma 7.1, p. 26). Performs the same regrouping by κ and endoscopic triples for the Igusa counting formula.

Rewrite each adelic orbital integral as a sum over κ ∈ 𝔎(I_0/ℚ) of κ-orbital integrals using the global obstruction (ET.0/global-kottwitz-obstruction (c)) and Fourier inversion on the finite abelian group.

Regroup pairs (γ_0, κ) by the endoscopic triples (H,s,η) with γ_H transferring to γ_0 (Kottwitz 1986 §9; Shin 2010 §5.1, Lemma 5.1).

Replace κ-orbital integrals at each place by stable orbital integrals of transfers (ET.3/local-transfer-existence, ET.3/fundamental-lemma-almost-all-places, ET.1/archimedean-pseudocoefficient-transfer); collect the Tamagawa numbers with ET.4/tamagawa-number-formula to obtain ι(G,H).

This is Kottwitz 1986 Theorem 9.6, recorded by Shin 2011 p. 36 and used for the Igusa counting formula in Shin 2010 §§5–7; its primary text is cited through those secondary statements.

**Acceptance.**

- For G anisotropic with only the trivial elliptic endoscopic triple, T_e(f) = ST^G_e(f^G) with f^G = f.
- For G = 𝔾_m every class is stable and the identity is tautological.
- For a unitary similitude group G_N the sum runs over (G_N,1,id) and the (G_{n_1,n_2}, s, η) of ET.0/unitary-elliptic-endoscopic-data.

*Used by:* `ET.4/stable-twisted-identity`; `ET.4/simple-division-algebra-trace-identity`; `ET.4/unitary-endoscopic-classification`; `ET.5/stable-igusa-trace-formula`.

*Needs:* `ET.4/stable-elliptic-distribution`; `ET.0/global-kottwitz-obstruction`; `ET.1/matching-functions`; `ET.3/local-transfer-existence`; `ET.3/fundamental-lemma-almost-all-places`; `ET.1/archimedean-pseudocoefficient-transfer`; `ET.1/transfer-factor-properties`; `ET.4/tamagawa-number-formula`.

### ET.4.6 Base-change groups and the L-morphisms BC and ζ̃

Node `ET.4/base-change-groups` (construction).

Let F = F^+F_0 be a CM field (F_0 imaginary quadratic, [F^+:ℚ] ≥ 2), n⃗ = (n_1,…,n_s) and G_n⃗ the quasi-split unitary similitude group of ET.0/unitary-elliptic-endoscopic-data, with the character ϖ : 𝔸_{F_0}^×/F_0^× → ℂ^× extending the quadratic character of F_0/ℚ fixed there. Put 𝒢_n⃗ = R_{F_0/ℚ}(G_n⃗ ×_ℚ F_0); then 𝒢_n⃗ ≅ R_{F_0/ℚ}𝔾_m × R_{F/ℚ}GL_n⃗ and its dual group is ℂ^× × ℂ^× × ∏_{σ ∈ Φ} GL_n⃗(ℂ) (Φ the embeddings F → ℂ), W_{F_0} permuting the σ-factors and w ∉ W_{F_0} acting by (λ_+, λ_−, (g_σ)) ↦ (λ_− ∏_{σ ∉ Φ^+} det g_σ, λ_+ ∏_{σ ∈ Φ^+} det g_σ, (Φ_n⃗ ᵗg_{c w^{-1}σ}^{-1} Φ_n⃗^{-1})_σ). The construction gives: (a) the base-change L-morphism BC_n⃗ : ^LG_n⃗ → ^L𝒢_n⃗, (λ,(g_σ)_{σ∈Φ^+}) ⋊ w ↦ (λ, λ, (g_σ)_{σ∈Φ^+}, (g_{cσ})_{σ∉Φ^+}) ⋊ w; (b) for n_1 + n_2 = N the L-morphism ζ̃_{n_1,n_2} : ^L𝒢_{n_1,n_2} → ^L𝒢_N extending GL_{n_1} × GL_{n_2} ⊂ GL_N by the ϖ-twist of η̃_{n_1,n_2} on W_{F_0} and the element (a_{n_1,n_2}, a_{n_1,n_2}, (Φ_{n_1,n_2}Φ_N^{-1})_σ) on a fixed w* ∉ W_{F_0}; (c) the commutative square BC_N ∘ η̃_{n_1,n_2} = ζ̃_{n_1,n_2} ∘ BC_{n_1,n_2}; (d) the automorphism θ of 𝒢_n⃗ induced by the non-trivial element of Gal(F_0/ℚ), θ(λ, g) = (λ^c, λ^c g^♯) with g^♯ = Φ_n⃗ ᵗ(g^c)^{-1} Φ_n⃗^{-1} (the inverse is required; the non-compact sequel §5.5 omits it, see sourceIssues), so that G_n⃗ ⋊ Gal(F_0/ℚ) ≅ 𝒢^+_n⃗ = 𝒢_n⃗ ⋊ {1, θ}.

The precise hypotheses are: F = F^+F_0 CM with F_0 imaginary quadratic; ϖ fixed as in ET.0/unitary-elliptic-endoscopic-data; a_{n_1,n_2} a fixed square root of (−1)^{N(n_1,n_2)} with N(n_1,n_2) = [F^+:ℚ](n_1ε(n_1) + n_2ε(n_2))/2 and ε(m) ∈ {0,1} the parity of m.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, (5.4.1) and the definitions of BC_n⃗ and ζ̃_{n_1,n_2}, pp. 69–70). Defines the base-change group, its dual group, the L-morphisms BC and ζ̃ and checks the commutative square.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, p. 72). Defines the twisted group 𝒢^+_n⃗ = (R_{F_0/ℚ}𝔾_m × R_{F/ℚ}GL_n⃗) ⋊ {1,θ} and identifies G_n⃗ ⋊ Gal(F_0/ℚ) with it.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.1 and §3.2, pp. 12–14). Defines G_n⃗, its dual group and the L-morphisms in the compact case.

Compute the dual group of R_{F_0/ℚ}(G_n⃗)_{F_0} from the Weil-restriction rule (ReductiveGroupsPartII:RG2.5/dual-of-weil-restriction).

Define BC_n⃗ and ζ̃ by the displayed formulas and check they are L-morphisms by comparing with the action of w ∉ W_{F_0} (Caraiani–Scholze non-compact §5.4, p. 69).

The square (c) commutes by direct computation on Ĝ and on w* (Caraiani–Scholze non-compact (5.4.1), p. 69; Shin 2011 §3.2 and §4.4).

The definition exposes the following operations and relations.

- `BaseChangeGroup` (constructor): 𝒢_n⃗ = R_{F_0/ℚ}(G_n⃗ ×_ℚ F_0).
- `BaseChangeGroup.equivGL` (equivalence): 𝒢_n⃗ ≅ R_{F_0/ℚ}𝔾_m × R_{F/ℚ}GL_n⃗ over ℚ.
- `BaseChangeGroup.theta` (data): The order-two automorphism θ(λ,g) = (λ^c, λ^c g^♯).
- `BaseChangeGroup.theta_sq` (simp): θ² = id.
- `BCLMorphism` (constructor): The base-change L-morphism BC_n⃗ : ^LG_n⃗ → ^L𝒢_n⃗.
- `zetaLMorphism` (constructor): The L-morphism ζ̃_{n_1,n_2} : ^L𝒢_{n_1,n_2} → ^L𝒢_N.
- `BCLMorphism_comm` (relation): BC_N ∘ η̃_{n_1,n_2} = ζ̃_{n_1,n_2} ∘ BC_{n_1,n_2}.
- `BaseChangeGroup.semidirect` (equivalence): G_n⃗ ⋊ Gal(F_0/ℚ) ≅ 𝒢_n⃗ ⋊ {1,θ}, with c ↦ θ.

**Checks.**

- `BaseChangeGroup.rank_one` (computation): For n⃗ = (1), 𝒢_{(1)}(ℚ) = F_0^× × F^×.
- `BaseChangeGroup.theta_fixed` (characterisation): The θ-fixed points of 𝒢_n⃗(ℚ) are G_n⃗(ℚ).
- `BCLMorphism_comm_test` (compatibility): The square BC_N ∘ η̃ = ζ̃ ∘ BC holds on W_{F_0} and on w*.
- `BaseChangeGroup.not_base_change` (non-example): 𝒢_n⃗ is not G_n⃗ ×_ℚ F_0 viewed over F_0: it is its Weil restriction to ℚ, whose ℚ-points are G_n⃗(F_0).

**Acceptance.**

- For n⃗ = (1) and F^+ = ℚ-degree d, ^L𝒢_{(1)} has dual group ℂ^× × ℂ^× × (ℂ^×)^{2d}.
- BC_n⃗ composed with the projection to Ĝ-components indexed by Φ^+ is the identity on GL_n⃗(ℂ)^{Φ^+}.
- ζ̃_{N,0} is the identity of ^L𝒢_N.

*Used by:* Caraiani–Scholze non-compact §5.4, (5.4.2)–(5.4.3) (the transfers BC* and ζ̃* of unramified Hecke algebras are dual to these L-morphisms); Shin 2011 §4.4 (compatibility of transfers along ζ̃ and BC); ET.7a/twisted-spectral-normalization (ET.6a packet) (the twisted spectral coefficients are computed on 𝒢^+_n⃗); `ET.4/unramified-transfers`; `ET.4/base-change-transfer-of-functions`; `ET.4/archimedean-lefschetz-functions`; `ET.4/twisted-trace-formula`; `ET.4/cuspidal-levi-subsets`.

*Needs:* `ET.0/unitary-elliptic-endoscopic-data`; `ReductiveGroupsPartII:RG2.5/l-group`; `ReductiveGroupsPartII:RG2.5/dual-of-weil-restriction`; `ReductiveGroupsPartII:RG2.5/langlands-dual-group`.

### ET.4.7 Unramified transfers BC*, ζ̃*, η̃* and their compatibilities

Node `ET.4/unramified-transfers` (theorem).

With ET.4/base-change-groups, let v be a place of ℚ outside a finite set S containing ∞, p, ℓ and the primes where F or ϖ ramifies. (a) The L-morphisms BC_n⃗, ζ̃_{n_1,n_2} and η̃_{n_1,n_2} induce, through the Satake isomorphism (SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism), algebra maps BC*_n⃗ : H^ur(𝒢_n⃗(ℚ_v)) → H^ur(G_n⃗(ℚ_v)), ζ̃*_{n_1,n_2} : H^ur(𝒢_N(ℚ_v)) → H^ur(𝒢_{n_1,n_2}(ℚ_v)) and η̃*_{n_1,n_2} : H^ur(G_N(ℚ_v)) → H^ur(G_{n_1,n_2}(ℚ_v)), and dual maps on unramified representations, with tr π(η̃*φ) = tr η̃_*(π)(φ) and the same for BC and ζ̃. (b) The squares BC*_{n_1,n_2} ∘ ζ̃*_{n_1,n_2} = η̃*_{n_1,n_2} ∘ BC*_N on Hecke algebras and the dual square on unramified representations commute. (c) Explicitly, for Q_{n_1,n_2} a parabolic of 𝒢_N with Levi 𝒢_{n_1,n_2}: ζ̃*_{n_1,n_2}(f_v) = f_v^{Q} · χ_{ϖ,v}, the normalised constant term times the character χ_ϖ(λ,g_1,g_2) = ϖ(λ^{−N(n_1,n_2)} ∏_i N_{F/F_0}(det g_i)^{ε(n_i)}), and ζ̃_{n_1,n_2,*}(Π_v) = n-Ind(Π_v ⊗ χ_{ϖ,v}); these formulas extend to all f_v ∈ C_c^∞ and all Π_v ∈ Rep(𝒢_{n_1,n_2}(ℚ_v)), since both groups are products of restrictions of scalars of general linear groups.

The precise hypotheses are: v ∉ S for the unramified statements (a),(b); (c) holds at every place v.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, (5.4.2), (5.4.3) and Remark 5.4.1, pp. 69–70). Defines the unramified transfers dual to BC and ζ̃, records the two commuting squares and gives the explicit constant-term-and-χ_ϖ formula.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.3, Lemma 3.3, p. 15; §4.2, (4.4), p. 22; §4.4, (4.18)–(4.20), pp. 25–26). Proves the constant-term trace identity, the unramified base-change character identity and the compatibility of transfers.

(a): functoriality of the Satake isomorphism along L-morphisms between unramified groups (SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism, SR.4/spherical-parameter).

(b): apply (a) to the commutative square of ET.4/base-change-groups (c) (Caraiani–Scholze non-compact (5.4.2)–(5.4.3), from Shin 2011 (4.18)).

(c): the constant-term formula tr π(f^Q) = tr n-Ind(π)(f) and its unramified version (Shin 2011 Lemma 3.3), with the twist by χ_ϖ read off from ζ̃ (Caraiani–Scholze non-compact Remark 5.4.1).

**Acceptance.**

- For v split in F_0, BC*_n⃗ is surjective (Shin 2011 §4.2, Case 2).
- For n_2 = 0, ζ̃* is the identity.
- tr(n-Ind(Π ⊗ χ_ϖ))(f) = tr Π(f^Q · χ_ϖ) for f ∈ C_c^∞(𝒢_N(ℚ_v)) (constant-term adjunction).

*Used by:* `ET.4/twisted-geometric-side`; `ET.4/acceptance-examples`; `ET.5/igusa-endoscopic-test-function`.

*Needs:* `ET.4/base-change-groups`; `SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism`; `SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter`; `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`; `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`.

### ET.4.8 Base-change transfer of test functions at every place

Node `ET.4/base-change-transfer-of-functions` (theorem).

With ET.4/base-change-groups: (a) (split places) if v splits in F_0 (in particular v = p in the applications), every f_v ∈ C_c^∞(𝒢_n⃗(ℚ_v)) has a BC-transfer φ_v ∈ C_c^∞(G_n⃗(ℚ_v)) (Shin 2011 §4.2, Case 2), i.e. tr π_v(φ_v) = tr(BC(π_v)(f_v) ∘ A_θ) for the normalised θ-intertwiner, and the map f_v ↦ φ_v is surjective onto C_c^∞(G_n⃗(ℚ_v)); base change of irreducible representations at such v is injective. (b) (all finite places; Labesse 1999 Théorème 3.3.1) every f_v ∈ C_c^∞(𝒢_n⃗(ℚ_v)) has a φ_v with matching orbital integrals, i.e. SO_γ(φ_v) equals the stable twisted orbital integral of f_v at δ when γ is a norm of δ, and SO_γ(φ_v) = 0 when γ is not a norm. (c) (inverse transfer; Labesse 1999 Proposition 3.3.2) a function φ_v ∈ C_c^∞(G_n⃗(ℚ_v)) whose stable orbital integrals vanish at every semisimple element that is not a norm is a BC-transfer of some f_v. (d) (norm criterion) a semisimple γ ∈ G_n⃗(ℚ_v) is a norm iff its image in the cocentre D_n⃗ = G_n⃗/G_n⃗^der is a norm; for v split in F_0 every element is a norm (Caraiani–Scholze non-compact Lemma 5.4.3, via Labesse 1999 Proposition 2.5.3).

The precise hypotheses are: v finite; in (c),(d) v may be inert or ramified in F_0.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, Proposition 5.4.2 and Lemma 5.4.3 with proof, pp. 70–71). Recalls Labesse's existence and inverse-transfer criteria and proves the cocentre norm criterion for a general imaginary CM field.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Proposition 2.5.3 (§2.5), Théorème 3.3.1 and Proposition 3.3.2 (§3.3)). Proves that an elliptic semisimple element is a norm iff its cocentre image is, the existence of base-change transfer, and the converse for functions with stable orbital integrals supported on norms.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.2, Cases 1–2, pp. 22–23). Constructs BC-matching functions at unramified and at split places.

(a): at split v, 𝒢_n⃗(ℚ_v) ≅ G_n⃗(ℚ_v) × G_n⃗(ℚ_v) with θ swapping factors; take φ_v the convolution of the two components (Shin 2011 §4.2, Case 2).

(b),(c): Labesse's transfer for stable base change, the twisted analogue of ET.3/local-transfer-existence, recorded at ET.3/base-change-fundamental-lemma-and-transfer (c); Proposition 3.3.2 is its converse for functions supported on norms.

(d): Labesse 1999 Proposition 2.5.3 reduces to the cocentre of an elliptic Levi M containing γ; the explicit description of D_n⃗ and D_M as tori with multiplier λ shows that an element of D_M is a norm iff its image in D_n⃗ is (Caraiani–Scholze non-compact proof of Lemma 5.4.3, after Morel 2010 Lemma 8.3.6).

**Acceptance.**

- At split v, with vol(K) = 1, the BC-transfer of 1_K ⊗ 1_K is 1_K.
- For n⃗ = (1) the norm criterion reduces to the classical criterion for the multiplier torus.
- A function supported on non-norms has BC-transfer 0 under (b).

*Used by:* `ET.4/small-level-transfer`; `ET.4/twisted-geometric-side`; `ET.4/unitary-gl-base-change-descent`.

*Needs:* `ET.4/base-change-groups`; `ET.3/base-change-fundamental-lemma-and-transfer`; `ET.4/twisted-characters`; `ET.1/matching-functions`.

### ET.4.9 Small-level functions are base-change transfers (the level N_0)

Node `ET.4/small-level-transfer` (theorem).

Let S_pf be a finite set of finite primes at which F_0 need not be split. For every v ∈ S_pf there is an open neighbourhood U_v of 1 in G_N(ℚ_v) such that every φ_v ∈ C_c^∞(G_N(ℚ_v)) supported in U_v has the property that, for each elliptic endoscopic G_n⃗ of G_N and each Langlands–Shelstad transfer φ_v^n⃗ of φ_v to G_n⃗(ℚ_v), φ_v^n⃗ is the BC-transfer of some f_v^n⃗ ∈ C_c^∞(𝒢_n⃗(ℚ_v)). Consequently there is an integer N_0 ≥ 3 divisible only by primes in S_pf such that, for every N divisible by N_0, the characteristic function of the principal congruence subgroup K(N)_v has this property at every v ∈ S_pf, and every sufficiently small compact open subgroup is transferable in the sense of Liu–Tian–Xiao–Zhang–Zhu Definition D.2.1.

The precise hypotheses are: v ∈ S_pf finite; the elliptic endoscopic groups are those of ET.0/unitary-elliptic-endoscopic-data.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, Lemma 5.4.4 and Remark 5.4.5, pp. 71–72). Proves that functions supported near the identity at bad places have transfers that are base-change transfers and defines N_0 accordingly.

([Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Appendix D.2, Lemma D.2.2(3)). Uses that every sufficiently small compact open subgroup at a bad place is transferable.

By ET.4/base-change-transfer-of-functions (d), there is a neighbourhood U_n⃗ of 1 in G_n⃗(ℚ_v) all of whose semisimple elements are norms, because norms in a torus contain a neighbourhood of 1.

Morel 2010 Lemma 8.4.2 gives a neighbourhood V_n⃗ of 1 in G_N(F_0 ⊗ ℚ_v) such that semisimple elements of G_n⃗(ℚ_v) conjugate into V_n⃗ are conjugate into U_n⃗; intersect over the finitely many n⃗.

If SO_γ(φ^n⃗) ≠ 0 then γ matches some δ with O_δ(φ) ≠ 0, so δ ∈ U and γ is conjugate into U_n⃗, hence a norm; conclude by ET.4/base-change-transfer-of-functions (c) (Caraiani–Scholze non-compact proof of Lemma 5.4.4, after Morel 2010 Lemma 8.4.1).

**Acceptance.**

- For v split in F_0, U_v = G_N(ℚ_v) works.
- When every prime of S_pf splits in F_0, every level satisfies the transfer condition.
- The constant function 1_{G_N(ℤ_v)} need not be transferable in this sense at a ramified v; small support is a genuine hypothesis.

*Used by:* `ET.4/stable-twisted-identity`; `ET.5/igusa-endoscopic-test-function`.

*Needs:* `ET.4/base-change-transfer-of-functions`; `ET.3/local-transfer-existence`; `ET.0/unitary-elliptic-endoscopic-data`.

### ET.4.10 Archimedean Euler–Poincaré and twisted Lefschetz functions for unitary similitude groups

Node `ET.4/archimedean-lefschetz-functions` (construction).

Let G be a unitary similitude group over ℚ that is an inner form of G_N at ∞ of arbitrary signature, ξ an irreducible algebraic representation of G_ℂ, and Ξ = ξ ⊗ ξ the corresponding representation of (𝒢_n⃗)_ℂ. Construct: (a) the Euler–Poincaré function φ_{G_n⃗,ξ} (ET.1/pseudocoefficients) and Labesse's twisted Lefschetz function f_{𝒢_n⃗,Ξ} ∈ C_c^∞(𝒢_n⃗(ℝ)), whose twisted traces compute twisted Lefschetz numbers of (𝔤,K)-cohomology; they are BC-matching; (b) for each elliptic endoscopic G_n⃗ of G, the function φ^n⃗_∞ = e_n⃗(Δ_∞)(−1)^{q(G)}⟨μ_h, s⟩ Σ_{φ_H} det(ω_*(φ_H)) φ_{φ_H}, the sum over discrete L-parameters φ_H of G_n⃗ with η̃_n⃗ ∘ φ_H equivalent to the parameter of ξ, φ_{φ_H} the averaged pseudo-coefficient of the packet and q(G) = ½ dim G(ℝ)/K_∞A_{G,∞}^0; (c) the twisted analogue f^n⃗_∞ = e_n⃗(Δ_∞)(−1)^{q(G)}⟨μ_h, s⟩ Σ_{φ_n⃗} det(ω_*(φ_n⃗)) f_{𝒢_n⃗,Ξ(φ_n⃗)}; then f^n⃗_∞ and φ^n⃗_∞ are BC-matching, and φ^n⃗_∞ is a transfer of the Euler–Poincaré function of G (Kottwitz's construction, ET.1/archimedean-pseudocoefficient-transfer).

The precise hypotheses are: G_ℝ an inner form of G_N of arbitrary signature (not only Harris–Taylor signature); ξ irreducible algebraic; the sign e_n⃗(Δ_∞) and ⟨μ_h,s⟩ fixed by the transfer-factor normalisation of ET.1/transfer-factor-properties.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.3, pp. 23–24; (5.11), p. 35; (6.7), p. 43). Constructs Labesse's twisted Lefschetz functions, shows BC-matching with Euler–Poincaré functions and writes the explicit endoscopic combinations φ^n⃗_{Ig,∞} and f^n⃗_∞.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, p. 735; §5.3, pp. 737–738). Uses the same functions for an inner form G_ℝ of arbitrary signature, with q(G) = ½ dim(G(ℝ)/K_∞A_∞^0).

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, p. 70; §5.6, pp. 74–75). Recalls the matching at ∞ and the choice of f^n⃗_∞.

(a): Labesse 1991 Proposition 12 gives f_{𝒢,Ξ}; BC-matching with φ_{G,ξ} is Shin 2011 §4.3 (pp. 23–24) and Caraiani–Scholze non-compact §5.4 (p. 70).

(b): Shin 2011 (5.11), p. 35, with the real endoscopic signs of Shin 2011 §3.6; for arbitrary signature use q(G) and the packets of G_ℝ (Caraiani–Scholze 2017 §5.2 p. 735 and §5.3 pp. 737–738).

(c): Shin 2011 (6.7), p. 43; BC-matching of f^n⃗_∞ and φ^n⃗_∞ follows termwise from (a).

The definition exposes the following operations and relations.

- `eulerPoincareFunction` (constructor): φ_{G,ξ}, the averaged pseudo-coefficient of the discrete packet of ξ^∨.
- `twistedLefschetzFunction` (constructor): f_{𝒢,Ξ}, Labesse's twisted Lefschetz function for Ξ = ξ ⊗ ξ.
- `twistedLefschetzFunction_trace` (characterisation): tr(Π(f_{𝒢,Ξ}) A_θ) is the twisted Lefschetz number Σ_i (−1)^i tr(θ | H^i(𝔤,K; Π ⊗ Ξ)).
- `lefschetz_bcMatching` (compatibility): f_{𝒢,Ξ} and φ_{G,ξ} are BC-matching.
- `endoscopicInfinityFunction` (constructor): φ^n⃗_∞ as the signed combination over discrete parameters φ_H with η̃∘φ_H ~ φ_ξ.
- `twistedEndoscopicInfinityFunction` (constructor): f^n⃗_∞ as the matching combination of Lefschetz functions.
- `endoscopicInfinityFunction_isTransfer` (compatibility): φ^n⃗_∞ is a transfer of the Euler–Poincaré function of G (Kottwitz).
- `twistedLefschetzFunction_cuspidal` (other): f_{𝒢,Ξ} is cuspidal: its twisted orbital integrals vanish off θ-elliptic elements.

**Checks.**

- `eulerPoincareFunction.trivial_compact` (degenerate): If G(ℝ) is compact modulo centre and ξ = 1, φ_{G,1} is vol^{-1} times the constant function.
- `lefschetz_bcMatching.signature_check` (compatibility): For G_ℝ of signature (1,N−1) the matching agrees with Shin 2011 §4.3; for arbitrary signature only q(G) changes.
- `endoscopicInfinityFunction.sign` (computation): For the trivial triple the coefficient is (−1)^{q(G)}.
- `twistedLefschetzFunction.wrong_weight` (non-example): f_{𝒢,Ξ′} with Ξ′ not of the form ξ ⊗ ξ is not BC-matching with any φ_{G,ξ}.

**Acceptance.**

- For ξ trivial and G_ℝ compact modulo centre, φ_{G,ξ} is the normalised constant function and f^{(N)}_∞ is the twisted constant function.
- For the trivial endoscopic triple, φ^{(N)}_∞ is (−1)^{q(G)} times the Euler–Poincaré function of ξ.
- BC-matching fails for φ_{G,ξ} paired with a Lefschetz function of a different Ξ′ ≠ ξ ⊗ ξ.

*Used by:* Caraiani–Scholze 2017 Corollary 5.2.5, Theorem 5.3.2 (the archimedean components of the Igusa test functions and of their base-change partners); Caraiani–Scholze non-compact Definition 5.3.1(4) (φ^n⃗_∞ is a combination of Euler–Poincaré functions); ET.4/twisted-geometric-side (cuspidality of f^n⃗_∞ at ∞ kills non-elliptic twisted terms); `ET.4/twisted-geometric-side`; `ET.4/twisted-spectral-side`; `ET.5/igusa-endoscopic-test-function`.

*Needs:* `ET.1/pseudocoefficients`; `ET.1/archimedean-pseudocoefficient-transfer`; `ET.1/real-transfer`; `ET.4/base-change-groups`; `AutomorphicSpectralTheory:AS.6/general-euler-poincare`.

### ET.4.11 The invariant twisted trace formula for the unitary base-change spaces

Node `ET.4/twisted-trace-formula` (theorem).

Let 𝒢^+_n⃗ = 𝒢_n⃗ ⋊ {1, θ} be as in ET.4/base-change-groups and 𝒢_n⃗θ its non-identity coset. For f ∈ C_c^∞(𝒢_n⃗(𝔸)) with trivial character on A^0_{𝒢,∞}, let fθ be its translate to 𝒢_n⃗θ(𝔸). Then the invariant twisted trace formula holds: I^{𝒢θ}_geom(fθ) = I^{𝒢θ}_spec(fθ), where the geometric side is a linear combination over Levi subsets M of 𝒢_n⃗θ of invariant twisted weighted orbital integrals I^{𝒢θ}_M(δθ, fθ), and the spectral side a linear combination over Levi subsets of invariant twisted weighted characters; both are defined from the same kernel and truncation as the untwisted invariant trace formula of AutomorphicSpectralTheory:AS.6/invariant-trace-formula. The distributions satisfy the twisted splitting formula and descent formula used in ET.4/twisted-geometric-side.

The precise hypotheses are: 𝒢^+_n⃗ is a non-connected group whose coset 𝒢θ is defined by an automorphism θ of order 2 preserving a ℚ-splitting; f has the stated central character.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, (5.5.1), p. 72). States the invariant twisted trace formula I_geom = I_spec for the coset 𝒢_n⃗θ, citing Arthur 1988.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, p. 26). Notes that Arthur's twisted trace formula is unconditional by Kottwitz–Rogawski and Delorme–Mezo, and uses it for unitary base change.

The coarse and fine twisted expansions are obtained from the kernel and truncation of AutomorphicSpectralTheory:AS.6/coarse-trace-identity, AS.6/fine-geometric-expansion and AS.6/fine-spectral-expansion applied to the coset (Arthur 1988, as recalled in Caraiani–Scholze non-compact (5.5.1)).

Invariantisation follows AutomorphicSpectralTheory:AS.6/invariant-recursion with the twisted weighted characters; the twisted formula is unconditional by Kottwitz–Rogawski and Delorme–Mezo (Shin 2011 §4.5, p. 26).

The splitting formula and the descent formula for I^{𝒢θ}_M are those of Arthur 1988 (Proposition 9.1 and Corollary 8.3 of the second paper), in their twisted form.

**Acceptance.**

- For θ trivial (no twist) the statement reduces to AutomorphicSpectralTheory:AS.6/invariant-trace-formula.
- If 𝒢θ(ℚ)\𝒢(𝔸)^1 were compact the formula would reduce to the twisted Selberg trace formula.
- For f cuspidal at ∞ with [F^+:ℚ] ≥ 2, the geometric side reduces to elliptic terms (ET.4/twisted-geometric-side).

*Used by:* `ET.4/twisted-geometric-side`; `ET.4/twisted-spectral-side`; `ET.4/global-cyclic-base-change`.

*Needs:* `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`; `AutomorphicSpectralTheory:AS.6/coarse-trace-identity`; `AutomorphicSpectralTheory:AS.6/fine-geometric-expansion`; `AutomorphicSpectralTheory:AS.6/fine-spectral-expansion`; `AutomorphicSpectralTheory:AS.6/invariant-recursion`; `AutomorphicSpectralTheory:AS.6/weighted-orbital-integral`; `ET.4/base-change-groups`; `ET.4/twisted-characters`.

### ET.4.12 Cuspidal groups, cuspidal Levi subgroups and cuspidal Levi subsets

Node `ET.4/cuspidal-levi-subsets` (definition).

(1) A connected reductive group M over ℚ is cuspidal if (M/A_M)_ℝ contains a maximal ℝ-torus that is ℝ-anisotropic, where A_M is the maximal ℚ-split torus in the centre of M. (2) A Levi subgroup M of 𝒢_n⃗ is a cuspidal Levi subgroup if M is a cuspidal group. (3) For a Levi subset M of the coset 𝒢_n⃗θ, let M° be the intersection with 𝒢_n⃗ of the subgroup of 𝒢^+_n⃗ generated by M; M is a cuspidal subset if M° is a cuspidal Levi subgroup of 𝒢_n⃗.

The precise hypotheses are: M connected reductive over ℚ; Levi subsets in the sense of Arthur's non-connected theory.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Definition 5.5.2, p. 74). Defines cuspidal groups, cuspidal Levi subgroups and cuspidal Levi subsets of the twisted coset.

Cuspidality is equivalent to the existence of discrete series of M(ℝ) modulo A_M(ℝ)^0 (Harish-Chandra), which is why only cuspidal Levis carry non-zero archimedean weighted terms of a cuspidal function.

The definition is Caraiani–Scholze non-compact Definition 5.5.2.

The definition exposes the following operations and relations.

- `IsCuspidalGroup` (constructor): M is cuspidal iff (M/A_M)_ℝ has an ℝ-anisotropic maximal torus.
- `IsCuspidalGroup.iff_discreteSeries` (characterisation): M is cuspidal iff M(ℝ) has discrete series modulo A_M(ℝ)^0.
- `IsCuspidalGroup.prod` (structure): A product is cuspidal iff each factor is.
- `IsCuspidalSubset` (constructor): A Levi subset M of 𝒢θ is cuspidal iff M° ∩ 𝒢 is a cuspidal Levi subgroup.
- `IsCuspidalGroup.resGL` (relation): For a CM field F, R_{F/ℚ}GL_h is cuspidal iff h = 1 and [F^+:ℚ] = 1: otherwise (M/A_M)_ℝ has a non-trivial split central torus (when [F^+:ℚ] > 1) or a split part in every maximal torus (when h ≥ 2).

**Checks.**

- `IsCuspidalGroup.gm` (computation): 𝔾_m is cuspidal (A_M = 𝔾_m and M/A_M is trivial).
- `IsCuspidalGroup.resGL_not` (non-example): For [F^+:ℚ] = 2, R_{F/ℚ}GL_1 is not cuspidal: its real centre contains a split torus of rank 2 while A_M has rank 1.
- `IsCuspidalGroup.unitary` (computation): A unitary group U(a,b) over ℚ relative to an imaginary quadratic field is cuspidal.
- `IsCuspidalGroup.trivial` (degenerate): The trivial group is cuspidal; a Levi subgroup is never required to contain a non-trivial torus.

**Acceptance.**

- 𝔾_m is cuspidal: A_M = 𝔾_m and M/A_M is trivial.
- For F = F_0 imaginary quadratic, (R_{F_0/ℚ}𝔾_m)^s × G_{N−2s} is a proper cuspidal Levi subgroup of G_N (Remark 5.5.4).
- R_{F/ℚ}GL_h with [F^+:ℚ] > 1 is not cuspidal (ET.4/no-proper-cuspidal-subsets).

*Used by:* Caraiani–Scholze non-compact proof of Proposition 5.5.1 (the archimedean weighted twisted terms of a Lefschetz function vanish on non-cuspidal Levi subsets (Morel 2010 Proposition 8.2.3)); ET.4/no-proper-cuspidal-subsets (the key lemma that no proper cuspidal subset exists when [F^+:ℚ] ≥ 2); `ET.4/no-proper-cuspidal-subsets`.

*Needs:* `ET.4/base-change-groups`; `AdelicAlgebraicGroups:AA.2/tamagawa-measure`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

### ET.4.13 No proper cuspidal subsets when [F^+:ℚ] ≥ 2

Node `ET.4/no-proper-cuspidal-subsets` (theorem).

If [F^+ : ℚ] ≥ 2 then 𝒢_n⃗θ admits no proper cuspidal Levi subset. If F^+ = ℚ (F imaginary quadratic) the analogue fails: the unitary similitude groups G_N then have proper cuspidal Levi subgroups (R_{F/ℚ}𝔾_m)^s × G_{N−2s}, and the stable trace formula for Igusa varieties can no longer be identified with the geometric side of the twisted trace formula, which acquires additional terms.

The precise hypotheses are: F = F^+F_0 CM; the statement is about the base-change coset of ET.4/base-change-groups.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Lemma 5.5.3 and Remark 5.5.4, p. 74). Proves that the coset has no proper cuspidal subsets when [F^+:ℚ] ≥ 2 and gives the counterexample for F^+ = ℚ.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Remark 4.6, p. 27). Notes that for F^+ = ℚ more terms appear, citing Morel 2010 Proposition 8.2.3.

It suffices that 𝒢_n⃗ has no proper cuspidal Levi subgroup.

A proper Levi contains a direct factor R_{F/ℚ}GL_h, 0 < h ≤ n, which would have to be cuspidal.

The centre of (R_{F/ℚ}GL_h)_ℝ contains a split torus of rank [F^+:ℚ] > 1 while the maximal ℚ-split central torus has rank 1, so no maximal ℝ-torus of the quotient is anisotropic (Caraiani–Scholze non-compact Lemma 5.5.3).

**Acceptance.**

- For [F^+:ℚ] = 2 and n⃗ = (2), the Levi R_{F_0/ℚ}𝔾_m × R_{F/ℚ}(GL_1 × GL_1) is not cuspidal.
- For F^+ = ℚ, (R_{F/ℚ}𝔾_m)^s × G_{N−2s} ⊂ G_N is a proper cuspidal Levi subgroup (non-example of the hypothesis).
- The lemma is used only with test functions cuspidal at ∞.

*Used by:* `ET.4/twisted-geometric-side`; `ET.4/acceptance-examples`.

*Needs:* `ET.4/cuspidal-levi-subsets`.

### ET.4.14 The simple twisted geometric side equals a stable elliptic sum

Node `ET.4/twisted-geometric-side` (theorem).

Assume [F^+:ℚ] ≥ 2. Let φ^n⃗ = (φ^n⃗)^S φ^n⃗_{S_f} φ_{G_n⃗,ξ} ∈ C_c^∞(G_n⃗(𝔸)) and f^n⃗ = (f^n⃗)^S f^n⃗_{S_f} f_{𝒢_n⃗,Ξ} ∈ C_c^∞(𝒢_n⃗(𝔸)) with (φ^n⃗)^S and φ^n⃗_{S_f} BC-transfers of (f^n⃗)^S and f^n⃗_{S_f} (ET.4/unramified-transfers, ET.4/base-change-transfer-of-functions) and the archimedean functions of ET.4/archimedean-lefschetz-functions. Then I^{𝒢_n⃗θ}_geom(f^n⃗θ) = Σ_γ SO^{G_n⃗(𝔸)}_γ(φ^n⃗) = τ(G_n⃗)^{-1} ST^{G_n⃗}_e(φ^n⃗), the middle sum over ℚ-elliptic semisimple stable conjugacy classes of G_n⃗(ℚ); equivalently the geometric side is the sum over θ-elliptic θ-conjugacy classes δ of 𝒢_n⃗(ℚ) of vol(I_{δθ}(ℚ)A_{𝒢θ}\I_{δθ}(𝔸)) O_{δθ}(f^n⃗).

The precise hypotheses are: [F^+ : ℚ] ≥ 2 (used through ET.4/no-proper-cuspidal-subsets); f^n⃗ cuspidal at ∞ (the Lefschetz function); BC-matching at every finite place.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Proposition 5.5.1 and proof, pp. 72–74). Proves the identity of the twisted geometric side with the stable elliptic sum, explaining the role of cuspidal subsets and replacing the second cuspidal place by [F^+:ℚ] ≥ 2.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, Proposition 4.5 and Corollary 4.7, p. 27). Proves the same identity in the compact case, citing Labesse's Théorème 4.3.4.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Proposition 4.3.2 and Théorème 4.3.4 (§4.3)). Rewrites the θ-elliptic part of the twisted trace formula as a sum of stable orbital integrals of matching functions.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.3, Proposition 5.3.1, p. 737). Records the same proposition for the compact unitary groups of arbitrary rank.

By the twisted splitting formula and descent, each term I^{𝒢θ}_M(δθ, f^n⃗θ) is a multiple of the archimedean term for f_{𝒢,Ξ}; that term vanishes unless M is a cuspidal subset (Morel 2010 Proposition 8.2.3), and by ET.4/no-proper-cuspidal-subsets only M = 𝒢θ remains: the twisted analogue of Arthur 1988 Theorem 7.1(b) holds without a second cuspidal place.

Cuspidality at ∞ (Labesse 1999 Théorème A.1.1) kills non-θ-elliptic terms, giving the twisted analogue of Arthur 1988 Corollary 7.4: the geometric side is the θ-elliptic sum.

Labesse 1999 Théorème 4.3.4 identifies that θ-elliptic sum with the sum of stable orbital integrals of the BC-transfer, and Shin 2011 Corollary 4.7 (using τ(𝒢_n⃗) = 1 from ET.4/tamagawa-number-formula) rewrites it as τ(G_n⃗)^{-1}ST_e.

**Acceptance.**

- For n⃗ = (1) the identity reduces to a statement about the elliptic part of the twisted trace formula of a torus.
- Dropping [F^+:ℚ] ≥ 2 (F imaginary quadratic) makes the identity false in general: extra cuspidal-Levi terms appear (Caraiani–Scholze non-compact Remark 5.5.4).
- Both sides vanish when f^n⃗_v = 0 at one place.

*Used by:* `ET.4/stable-twisted-identity`.

*Needs:* `ET.4/twisted-trace-formula`; `ET.4/no-proper-cuspidal-subsets`; `ET.4/archimedean-lefschetz-functions`; `ET.4/unramified-transfers`; `ET.4/base-change-transfer-of-functions`; `ET.4/stable-elliptic-distribution`; `ET.4/tamagawa-number-formula`.

### ET.4.15 The spectral side of the simple twisted trace formula

Node `ET.4/twisted-spectral-side` (theorem).

With f^n⃗ as in ET.4/twisted-geometric-side, I^{𝒢_n⃗θ}_spec(f^n⃗θ) = Σ_M |W_M| |W_{𝒢_n⃗}|^{-1} |det(Φ_n⃗^{-1}θ − 1)_{𝔞^{𝒢θ}_M}|^{-1} Σ_{Π_M} tr(n-Ind^{𝒢_n⃗}_Q(Π_M)_ξ(f^n⃗) ∘ A′), where M runs over Levi subgroups of 𝒢_n⃗ containing a fixed minimal Levi M_0, W_M and W_{𝒢_n⃗} are Weyl groups relative to M_0 (the denominator is the Weyl group of 𝒢_n⃗, Caraiani–Scholze 2017 erratum E71), Φ_n⃗^{-1}θ acts as −1 on 𝔞^{𝒢θ}_M so the determinant is non-zero, Q is a parabolic with Levi M, Π_M runs over the irreducible Φ_n⃗^{-1}θ-stable subrepresentations of the relatively discrete spectrum R_{M,disc} (each occurring with multiplicity one by multiplicity one for general linear groups), the subscript ξ is the twist by the character of A^0_{𝒢,∞} determined by ξ, and A′ is the normalised intertwining operator on n-Ind(Π_M)_ξ composed with θ (Shin 2011 §4.5). Each n-Ind(Π_M)_ξ is a θ-stable isobaric irreducible automorphic representation, and its archimedean component is cohomological for Ξ when its trace against f_{𝒢,Ξ} is non-zero.

The precise hypotheses are: f^n⃗_∞ a twisted Lefschetz function; the discrete spectrum of the general linear Levi M as described by Mœglin–Waldspurger.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, Proposition 4.8 and Corollary 4.14, pp. 28–30). Computes the spectral side of the twisted trace formula for a Lefschetz test function as a sum over θ-stable discrete data with normalised intertwiners.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.3, Proposition 5.3.3 and Remark 5.3.4, p. 738). Records the same expansion and explains the twist by ξ and the normalised intertwiner.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.6, proof of Lemma 5.6.2, pp. 75–76). Uses the expansion and the isobaricity of n-Ind(Π_M)_ξ.

Expand the spectral side and use that only the discrete part survives for a Lefschetz function at ∞ (Shin 2011 Proposition 4.8, p. 28).

Compute the intertwining-operator term as tr(n-Ind(Π_M)_ξ(f) ∘ A′) (Shin 2011 Corollary 4.14, p. 30), with the sign of the normalised intertwiner at ∞ as in Clozel–Harris–Labesse.

Irreducibility and isobaricity of n-Ind(Π_M)_ξ: Π_M is unitary and discrete for a product of general linear groups (Mœglin–Waldspurger 1989, Jacquet–Shalika 1981).

**Acceptance.**

- When M = 𝒢_n⃗ the term is tr(Π(f^n⃗) ∘ A′) for θ-stable cuspidal Π.
- The coefficient |det(Φ^{-1}θ − 1)|^{-1} equals 1 when 𝔞^{𝒢θ}_M = 0.
- Non-θ-stable discrete Π_M contribute zero.

*Used by:* `ET.4/stable-twisted-identity`.

*Needs:* `ET.4/twisted-trace-formula`; `ET.4/archimedean-lefschetz-functions`; `AutomorphicSpectralTheory:AS.6/fine-spectral-expansion`; `ET.4/twisted-characters`; `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`.

### ET.4.16 Stable–twisted identity for unitary similitude groups ★

Node `ET.4/stable-twisted-identity` (theorem). Planet: *Stable–twisted identity for unitary groups*.

Assume [F^+:ℚ] ≥ 2. For every vector n⃗ and every pair of BC-matching functions φ^n⃗ ∈ C_c^∞(G_n⃗(𝔸)), f^n⃗ ∈ C_c^∞(𝒢_n⃗(𝔸)) as in ET.4/twisted-geometric-side (unramified outside S, small level at S_pf as in ET.4/small-level-transfer, any function at split primes, Euler–Poincaré and Lefschetz functions at ∞), ST^{G_n⃗}_e(φ^n⃗) = τ(G_n⃗) I^{𝒢_n⃗θ}_spec(f^n⃗θ), with the spectral side expanded as in ET.4/twisted-spectral-side. Combined with ET.4/elliptic-stabilization, for G an inner form of G_N with G(𝔸_f) ≅ G_N(𝔸_f) and any f on G(𝔸) with Euler–Poincaré f_∞, T_e^G(f) = Σ_{G_n⃗ ∈ E^ell(G)} ι(G,G_n⃗) τ(G_n⃗) I^{𝒢_n⃗θ}_spec(f^n⃗θ), where for each n⃗ the function f^n⃗ is chosen BC-matching with the transfer f^{G_n⃗}. This holds for every rank N and both parities (with the pairs excluded by Kottwitz's condition 7.4.3 omitted) and for G_ℝ of arbitrary signature.

The precise hypotheses are: [F^+:ℚ] ≥ 2; the transfers f^{G_n⃗} exist as BC-transfers at every place (ET.4/base-change-transfer-of-functions, ET.4/small-level-transfer); Euler–Poincaré function at ∞.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §§5.5–5.6, Proposition 5.5.1 and Theorem 5.6.1, pp. 72–75). Combines the twisted simplification with the stable trace formula and the explicit test functions; the coefficient ε_n⃗ = ½ for n⃗ = (n,n).

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.3, Theorem 5.3.2 and Proposition 5.3.3, pp. 737–738). States the same combination for compact unitary groups of arbitrary rank and signature.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Corollary 4.7, p. 27). Proves the geometric identity used here.

Combine ET.4/twisted-geometric-side with the twisted trace formula I_geom = I_spec (ET.4/twisted-trace-formula).

Insert into the elliptic stabilization ET.4/elliptic-stabilization; the factors ι(G,G_n⃗)τ(G_n⃗) = τ(G)|Out|^{-1} and the factor ½ for n_1 = n_2 come from |Out(G_{n,n})| = 2 (ET.4/stable-elliptic-distribution).

The widening to every rank, both parities and arbitrary signature is Caraiani–Scholze 2017 §5.2–5.3; the non-compact case with level N_0 is Caraiani–Scholze non-compact §§5.4–5.6.

**Acceptance.**

- For N = 1 the identity is the base-change identity for the torus G_1.
- For n_1 = n_2 = N/2 the coefficient carries the factor ½ seen as ε_n⃗ in Caraiani–Scholze non-compact Theorem 5.6.1.
- The identity fails for F^+ = ℚ (Remark 5.5.4).

*Used by:* `ET.4/unitary-gl-base-change-descent`; `ET.4/unitary-endoscopic-classification`; `ET.4/acceptance-examples`; `ET.5/unitary-igusa-trace-formula`.

*Needs:* `ET.4/twisted-geometric-side`; `ET.4/twisted-spectral-side`; `ET.4/elliptic-stabilization`; `ET.4/small-level-transfer`.

### ET.4.17 The simple trace formula for division-algebra unitary groups

Node `ET.4/simple-division-algebra-trace-identity` (theorem).

Let F = F_0K be a CM field with F_0 totally real of even degree over ℚ and K imaginary quadratic, D a central division algebra over F of dimension n² with an involution * of the second kind, and G the unitary similitude group of (D, *) chosen as in Scholze's Lemma 8.1: signature (1, n−1) at one infinite place of F_0 and (0, n) at the others, G_{ℚ_p} ≅ GL_n(F_w) × (D′)^× × ℚ_p^× at a prime p split in K. Then G(ℚ)\G(𝔸)/A_G is compact, G has no non-trivial elliptic endoscopic triple whose transfers contribute (the stabilised elliptic sum reduces to the term of G itself), and, for test functions with a component at a place where D is a division algebra (as used by Kottwitz and Scholze), the contributions of the proper elliptic endoscopic groups vanish; for f = f^∞ f_∞ with f_∞ Kottwitz's Euler–Poincaré function of ξ, the elliptic part of the trace formula equals Σ_π m(π) tr(π_f(f^∞)) tr(π_∞(f_∞)), where π runs over automorphic representations of G. Further, π_f contributes to the ξ-cohomology only if π_∞ is cohomological, and the global Jacquet–Langlands correspondence relates such π (with the stated local conditions on D) to cuspidal or residual automorphic representations of GL_n over F.

The precise hypotheses are: D a division algebra (the ramification hypothesis of Scholze Remark 8.3 needed for the global Jacquet–Langlands step); [F_0:ℚ] even (needed for the existence of D, *, and for base change); p split in K.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §8, Lemma 8.1 and Remarks 8.2–8.3, p. 19). Constructs the division algebra, involution and h_0 with the stated signatures and explains why a ramification hypothesis on D is needed for the global Jacquet–Langlands correspondence.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §10, Corollary 10.1, p. 26). Uses Kottwitz's results that π_f occurring in the ξ-cohomology has cohomological archimedean component, with the trace identity from the simple trace formula.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.4, p. 36). Describes the stabilised trace formula for compact quotients after Kottwitz 1986 Theorem 9.6.

Existence of (D,*,h_0) with the signatures: Scholze Lemma 8.1 (Kottwitz 1992; Harris–Taylor §I.7).

Compactness: D is a division algebra, so G is anisotropic modulo centre and AutomorphicSpectralTheory:AS.6/compact-trace-specialization applies.

Vanishing of proper endoscopic contributions and the identity of the elliptic part with the spectral side: Kottwitz's argument for simple Shimura varieties (Kottwitz 1992, Invent. Math. 108), used by Scholze §§9–10 (Corollary 10.1); recorded with ET.4/elliptic-stabilization in the case of the trivial triple.

The global Jacquet–Langlands step is cited by Scholze through Harris–Taylor and Clozel's base change, ET.4/unitary-gl-base-change-descent.

**Acceptance.**

- For n = 1 G is a torus and the identity is the Poisson-type formula for the compact torus quotient.
- If D is split (not a division algebra) the quotient is non-compact and boundary terms appear; the statement is restricted to division algebras.
- For f_∞ the Euler–Poincaré function, non-cohomological π_∞ contribute zero.

*Used by:* `ET.4/unitary-gl-base-change-descent`; `ET.6/division-algebra-shimura-varieties`; `ET.6/drinfeld-level-point-count`; `ET.6/global-galois-input`.

*Needs:* `AutomorphicSpectralTheory:AS.6/compact-trace-specialization`; `ET.4/elliptic-stabilization`; `ET.1/pseudocoefficients`; `PELModuli:M0/similitude-group`; `PELModuli:M5/unitary-pel-datum`.

### ET.4.18 Local cyclic base change for GL_n (Arthur–Clozel) ★

Node `ET.4/local-cyclic-base-change` (theorem). Planet: *Local cyclic base change*.

Let E/F be a cyclic extension of non-archimedean local fields of characteristic 0 of prime degree ℓ with Gal(E/F) = ⟨σ⟩, and G = GL_n. (Definition, Shintani) A σ-stable irreducible admissible representation Π of GL_n(E) is a base-change lift of an irreducible admissible π of GL_n(F) if Θ_{Π,σ}(g) = Θ_π(Ng) for every g ∈ GL_n(E) with σ-regular norm Ng, the twisted character normalised as in ET.4/twisted-characters. Then: (a) every irreducible tempered π has a unique lift Π, which is tempered; (b) every σ-stable irreducible tempered Π lifts at least one π, and π is tempered; (c) the notion does not depend on the generator σ; (d) if Π lifts π = ind(π_1 ⊗ … ⊗ π_r) with π_i discrete series, the representations lifting to Π are exactly ind((π_1⊗χ_1)⊗…⊗(π_r⊗χ_r)) with χ_i characters of F^×/N(E^×); (e) lifting is compatible with contragredients and with twists: π⊗ω lifts to Π⊗(ω∘N_{E/F}), and ω_Π = ω_π ∘ N_{E/F}; (f) for π supercuspidal: if its lift is discrete then it is supercuspidal, and if π lifts to an induced representation of discrete series then π is supercuspidal of a specific induced form (AC Lemma 6.10); (g) the lift extends to all irreducible representations through the Langlands classification (ET.6/zelevinsky-classification) by lifting tempered data and taking Langlands quotients.

The precise hypotheses are: E/F cyclic of prime degree ℓ, characteristic 0; twisted characters normalised as in ET.4/twisted-characters.

([J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §6, Definition 6.1 and Theorem 6.2, pp. 51–52). Defines base-change lifting by the Shintani character identity and proves existence and uniqueness of lifts of tempered representations.

([J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §6, Propositions 6.6–6.9 and Lemma 6.10, pp. 59–63). Describes the fibres of lifting by twists, compatibility with contragredients and twists, and the behaviour of supercuspidal representations.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, pp. 31–32). Uses Arthur–Clozel Lemma 6.10, Theorem 6.2 and Proposition 6.7 to prove bijectivity on supercuspidals.

Compare twisted orbital integrals of φ on GL_n(E) with orbital integrals of f on GL_n(F) through the norm map (AC Ch. 1 §§1–3, Proposition 3.1) and the base-change fundamental lemma (ET.3/base-change-fundamental-lemma-and-transfer).

Existence for discrete series by a global argument with the simple trace formula comparison of AC Ch. 2 (Theorems A and B) applied to cuspidal representations with prescribed local components; tempered case by parabolic induction (AC Ch. 1 Theorem 6.2, p. 52).

Fibres (d), compatibilities (e) and supercuspidality (f): AC Ch. 1 Propositions 6.6–6.9 and Lemma 6.10, pp. 59–63, using linear independence of twisted characters (ET.4/twisted-characters).

**Acceptance.**

- For n = 1, the lift of a character χ of F^× is χ ∘ N_{E/F}.
- The Steinberg representation of GL_n(F) lifts to the Steinberg representation of GL_n(E).
- An unramified principal series lifts to the unramified principal series with Satake parameters raised to the ℓ-th power when E/F is unramified.

*Used by:* `ET.4/global-cyclic-base-change`; `ET.4/unitary-endoscopic-classification`; `ET.4/acceptance-examples`; `ET.6/llc-characterizing-properties`; `ET.6/supercuspidal-bijection`.

*Needs:* `ET.4/twisted-characters`; `ET.3/base-change-fundamental-lemma-and-transfer`; `ET.4/padic-character-distributions`; `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`; `SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification`; `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`.

### ET.4.19 Global cyclic base change for GL_n (Arthur–Clozel) ★

Node `ET.4/global-cyclic-base-change` (theorem). Planet: *Global cyclic base change*.

Let E/F be a cyclic extension of number fields of prime degree ℓ with Gal(E/F) = ⟨σ⟩ and ω the character of 𝔸_F^×/F^× N(𝔸_E^×) of class field theory. An automorphic representation of GL_n is induced from cuspidal if it is ind(σ_M ⊗ 1) for a cuspidal unitary representation σ_M of a Levi M(𝔸). A σ-stable Π of GL_n(𝔸_E) is a weak lift of π if Π_w is the unramified lift of π_v at almost all places, and a strong lift if Π_w is the local lift of π_v (ET.4/local-cyclic-base-change) at every place. Then (all representations induced from cuspidal): (a) if π is cuspidal and π ≇ π⊗ω, there is a unique σ-stable Π lifting π, and Π is cuspidal; (b) if π is cuspidal and π ≅ π⊗ω, then ℓ divides n and Π is the isobaric sum of the ℓ distinct conjugates of a cuspidal representation of GL_{n/ℓ}(𝔸_E); (c) every σ-stable cuspidal Π is the lift of some cuspidal π, unique up to twisting by powers of ω; (d) a weak lift is a strong lift; (e) ω_Π = ω_π ∘ N_{E/F}, and the lift is independent of the choice of σ; (f) two cuspidal π, π′ with the same lift differ by a power of ω.

The precise hypotheses are: E/F cyclic of prime degree ℓ, number fields; representations induced from cuspidal (unitary cuspidal data).

([J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 3 §§1–5: Definitions 1.1–1.2 (p. 200), Theorem 3.1 (p. 202), Definition 4.1 and Theorem 4.2 (p. 203), Proposition 4.4 (p. 211), Theorem 5.1 (p. 213)). Defines weak and strong lifts and induced-from-cuspidal representations, proves weak lifting, its fibres, central characters, and that weak lifts are strong.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, p. 31; §13, pp. 32–35). Uses cyclic base change to reduce supercuspidal representations to cases that become non-supercuspidal after finitely many prime-degree cyclic base changes.

Compare the twisted trace formula for GL_n(E) ⋊ ⟨σ⟩ with the trace formula of GL_n(F) through the matching of functions (ET.3/base-change-fundamental-lemma-and-transfer) and the term-by-term comparison of AC Ch. 2 (Theorems A and B).

Separate eigencharacters with the strong multiplicity one theorem and the Jacquet–Shalika results (AC Ch. 3 §2) to obtain weak lifting (AC Ch. 3 Theorem 4.2, p. 203) and the fibres (Theorem 3.1, p. 202).

Strong lifting from weak lifting and the local theory (AC Ch. 3 Theorem 5.1, p. 213); central characters and independence of σ (Proposition 4.4, p. 211).

**Acceptance.**

- For n = 1, the lift of a Hecke character χ is χ ∘ N_{𝔸_E/𝔸_F}.
- For n = ℓ = 2 and π the automorphic induction of a Hecke character of E, π ≅ π⊗ω and the lift is the isobaric sum χ ⊞ χ^σ.
- A cuspidal π whose base change is cuspidal is not a twist-invariant (non-example to (b)).

*Used by:* `ET.4/cyclic-automorphic-induction`; `ET.4/unitary-gl-base-change-descent`; `ET.6/non-galois-automorphic-induction`.

*Needs:* `ET.4/local-cyclic-base-change`; `ET.4/twisted-trace-formula`; `ET.3/base-change-fundamental-lemma-and-transfer`; `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

### ET.4.20 Cyclic automorphic induction for GL_n (Arthur–Clozel) ★

Node `ET.4/cyclic-automorphic-induction` (theorem). Planet: *Cyclic automorphic induction*.

Let E/F be a cyclic extension of number fields of degree ℓ (prime or not) and π_E an automorphic representation of GL_m(𝔸_E) induced from cuspidal. Say that an automorphic representation π_F of GL_{mℓ}(𝔸_F) is automorphically induced from π_E if at almost all places v unramified in E, the Satake parameter of π_{F,v} is the induction of those of π_{E,w}: at v split in E it is the direct sum over w | v, and at v inert it is the induced unramified parameter Ind_{W_{E_w}}^{W_{F_v}}. Then there exists one and only one such π_F, and π_F is induced from cuspidal. For ℓ prime and π_E cuspidal, π_F is cuspidal iff π_E is not isomorphic to its Galois conjugate π_E^σ; the induction is transitive along towers of cyclic extensions; and its base change to E is the isobaric sum of the Galois conjugates of π_E.

The precise hypotheses are: E/F cyclic; π_E induced from cuspidal.

([J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 3 §6, Definition 6.1, Theorem 6.2 and Corollary 6.5, pp. 216–219). Defines automorphic induction by matching Hecke eigenvalues, proves existence and uniqueness for cyclic extensions and identifies the cuspidal case.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §14, p. 35). Uses automorphic induction of Hecke characters along cyclic towers in the globalisation for L- and ε-factors.

Combine the twisted trace formula for GL_{mℓ}(𝔸_F) twisted by the character ω of E/F with the trace formula of GL_m(𝔸_E) (AC Ch. 3 §6), with the twisted transfer of ET.3/twisted-fundamental-lemma-and-transfer in this case.

Uniqueness from strong multiplicity one; cuspidality criterion from the Rankin–Selberg pole count (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles) and ET.4/global-cyclic-base-change (AC Ch. 3 Theorem 6.2 and Corollary 6.5, pp. 216–219).

**Acceptance.**

- For m = 1 and ℓ = 2, the induction of a Hecke character χ of E is the classical automorphic induction (theta series) to GL_2(𝔸_F).
- The induction of the trivial character of 𝔸_E^× is the isobaric sum of the characters of 𝔸_F^×/F^×N(𝔸_E^×).
- If π_E ≅ π_E^σ the induction is not cuspidal.

*Used by:* `ET.6/non-galois-automorphic-induction`.

*Needs:* `ET.4/global-cyclic-base-change`; `ET.3/twisted-fundamental-lemma-and-transfer`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles`.

### ET.4.21 Base change and descent between unitary groups and GL_n over CM fields

Node `ET.4/unitary-gl-base-change-descent` (theorem).

Let F = F_0K be a CM field (F_0 totally real, K imaginary quadratic), c complex conjugation, and G a unitary similitude group over F_0 of the form used in ET.4/simple-division-algebra-trace-identity or ET.4/base-change-groups. (a) (Base change) If π is an automorphic representation of G(𝔸) with π_∞ cohomological for ξ and π unramified outside a finite set S, there is an automorphic representation (ψ, Π) of GL_1(𝔸_K) × GL_n(𝔸_F), isobaric, with Π^∨ ≅ Π∘c, which is the base change of π at all places outside S split in K (and at all places where π is unramified), with Π_∞ cohomological for the base change of ξ; at places split in K the local components correspond through the identification of G with GL_1 × GL_n. (b) (Descent) Conversely, if Π is a cuspidal automorphic representation of GL_n(𝔸_F) with Π^∨ ≅ Π∘c, Π_∞ regular algebraic and Π_x square-integrable at a place x split over F_0 (and D, if non-split, ramified only at places where Π is square-integrable), then there exist ψ and an automorphic representation π of G(𝔸) with π_∞ cohomological such that (ψ, Π) is the base change of π. (c) Base change at split places is injective on irreducible representations.

The precise hypotheses are: F_0 totally real of even degree in the division-algebra case; p and the descent place split in K; Π cuspidal, conjugate self-dual, regular algebraic, with a square-integrable component.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §10, Theorems 10.2, 10.5 and 10.6 and their proofs, pp. 26–27). Uses the Harris–Taylor §VI base-change and descent results (based on Clozel's base change) to attach Galois representations and to pass between G and GL_n.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §6.2, Corollaries 6.5 and 6.7 with Remark 6.6, pp. 47–49). Records the base change and descent statements as Harris–Taylor Corollaries VI.2.7 and VI.2.8, attributed by them to Clozel.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.3 and §4.3). Provides the stable base-change transfer used in the comparison.

(a),(b) are the base-change results of Harris–Taylor §VI (Lemma VI.2.10, Theorem VI.2.9 and their corollaries), which rest on Clozel's base change for unitary groups and Labesse's stable base change (ET.4/stable-twisted-identity in the simple case, ET.4/base-change-transfer-of-functions); they are cited by Scholze §10 and by Shin 2011 as Corollaries 6.5 and 6.7 (= Harris–Taylor Corollaries VI.2.7, VI.2.8).

The square-integrable component makes the simple trace formula comparison applicable (cuspidality at a finite place) and forces the descended π into the discrete spectrum.

(c) holds because local base change at a split place is the identity on the GL_n-factor (ET.4/base-change-transfer-of-functions (a)).

**Acceptance.**

- For n = 1, base change from the unitary torus to GL_1(𝔸_F) is χ ↦ χ ∘ (z ↦ z/z̄).
- A conjugate self-dual cuspidal Π with no square-integrable component is outside (b) as stated.
- At a place split in K the base change of π_v is π_v itself viewed on GL_n(F_w).

*Used by:* `ET.6/global-galois-input`.

*Needs:* `ET.4/stable-twisted-identity`; `ET.4/simple-division-algebra-trace-identity`; `ET.4/base-change-transfer-of-functions`; `ET.4/global-cyclic-base-change`; `ET.3/inner-form-transfer`.

### ET.4.22 Endoscopic classification of unitary groups for generic parameters

Node `ET.4/unitary-endoscopic-classification` (theorem).

Let F/F^+ be a CM extension of number fields and U a unitary group over F^+ of rank N attached to F/F^+ (quasi-split, or an inner form for the Kaletha–Mínguez–Shin–White version). Generic global parameters are formal isobaric sums ψ = Π_1 ⊞ … ⊞ Π_k of pairwise distinct cuspidal conjugate self-dual representations of GL_{N_i}(𝔸_F) of the parity required by U, Σ N_i = N. Then: (a) the discrete automorphic spectrum of U decomposes according to such parameters (together with non-generic ones, not used here); (b) for each place v there is a finite local packet Π_{ψ_v} of representations of U(F^+_v) characterised by twisted endoscopic character identities with GL_N(F_v) and the base change of ET.4/stable-twisted-identity, with a map to characters of the component group S_{ψ_v}; (c) a representation π = ⊗π_v with π_v ∈ Π_{ψ_v} occurs in the discrete spectrum with multiplicity m(π) ∈ {0,1}, equal to 1 iff the product of the characters ⟨·, π_v⟩ restricted to the global component group S_ψ equals the canonical sign character ε_ψ, which is trivial for generic ψ; (d) the base change of π is ψ at every place.

The precise hypotheses are: generic parameters only; the dependency status recorded in gap 'Arthur's classification inputs': Mok and Kaletha–Mínguez–Shin–White rely on Arthur's twisted stabilisation and on the twisted weighted fundamental lemma.

([Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Appendix C.3, Proposition C.3.1). Uses the generic case of the endoscopic classification of Mok and Kaletha–Mínguez–Shin–White for multiplicity one and the definite–indefinite switches.

([G. Boxer, F. Calegari, T. Gee and V. Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §1.6, p. 8). Records that Arthur's missing references are now supplied by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, leaving the twisted weighted fundamental lemma as the only unproved input.

Stabilise the trace formulas of U and of the twisted GL_N ⋊ θ (ET.4/elliptic-stabilization for the elliptic part, the full twisted stabilisation of Mœglin–Waldspurger for the rest) and compare their discrete parts (Mok 2015 Theorem 2.5.2; KMSW).

Local packets are defined by the twisted character identities against base change (ET.4/local-cyclic-base-change for the quadratic extension at split and inert places).

Multiplicity formula from comparing coefficients, as used by Liu–Tian–Xiao–Zhang–Zhu Proposition C.3.1.

**Acceptance.**

- For N = 1 the classification is the description of automorphic characters of U(1) through base change.
- At a place split in F, U(F^+_v) ≅ GL_N(F_v) and the packet is a singleton given by ψ_v.
- A cuspidal ψ of GL_N gives a stable packet in which every member has multiplicity one.

*Used by:* `ET.4/gsp4-gl4-transfer`.

*Needs:* `ET.4/stable-twisted-identity`; `ET.4/elliptic-stabilization`; `ET.4/local-cyclic-base-change`; `ET.3/twisted-fundamental-lemma-and-transfer`.

### ET.4.23 Transfer between GSp_4 and GL_4 for general-type representations

Node `ET.4/gsp4-gl4-transfer` (theorem).

Let F be a number field, Π a cuspidal automorphic representation of GL_4(𝔸_F) and χ : 𝔸_F^×/F^× → ℂ^× unitary with Π ≅ Π^∨ ⊗ (χ∘det). Exactly one of L^S(s, Π, ∧² ⊗ χ^{-1}) and L^S(s, Π, Sym² ⊗ χ^{-1}) has a pole at s = 1; in the first (symplectic) case Π descends to a discrete automorphic representation π of GSp_4(𝔸_F) with central character χ, and in the second to a discrete representation of an inner form of GSpin_4. A discrete π of GSp_4 arising this way is of general type; it is cuspidal and stable, every π′ with π′_v in the L-packet of π_v for all v is automorphic and occurs with multiplicity one, the L-parameter of π_v composed with GSp_4 ⊂ GL_4 is rec(Π_v), and π is regular algebraic iff Π is.

The precise hypotheses are: general type (the descent of a cuspidal Π of GL_4); the statement depends on Arthur's classification for GSp_4 (Gee–Taïbi), whose only remaining unproved input is the twisted weighted fundamental lemma (gap 'Arthur's classification inputs').

([G. Boxer, F. Calegari, T. Gee and V. Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §1.8.22, p. 15). Recalls the transfer between GL_4 and GSp_4 for general-type representations, multiplicity one and compatibility of local parameters, citing Gee–Taïbi Proposition 6.1.7.

([G. Boxer, F. Calegari, T. Gee and V. Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §1.6, p. 8). Records the dependency of Arthur's classification on the twisted weighted fundamental lemma.

Gee–Taïbi Proposition 6.1.7, as recalled in Boxer–Calegari–Gee–Pilloni §1.8.22 (p. 15), deduces the transfer and multiplicity statements from Arthur's endoscopic classification for GSp_4.

The pole dichotomy is the Rankin–Selberg and exterior/symmetric square theory of AutomorphicLFunctionsAndLocalFactors (AL.3 for the poles).

**Acceptance.**

- For Π the symmetric cube of a non-CM cuspidal GL_2 form, the pair is of symplectic type.
- If Π is an isobaric sum the representation is not of general type.
- The orthogonal alternative is not a GSp_4 representation: it goes through GSpin_4.

*Needs:* `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles`; `ET.4/unitary-endoscopic-classification`.

### ET.4.24 Worked checks for the simple stable and twisted formulas

Node `ET.4/acceptance-examples` (application).

(1) Torus check: for N = 1, G_1 is the similitude torus of a CM field; E^ell(G_1) = {G_1}, τ(G_1) = 1 when [F^+:ℚ] is odd (Shin 2011 Remark 3.2), and the stable–twisted identity reduces to the matching of characters under z ↦ z/z̄. (2) Non-example: for F imaginary quadratic (F^+ = ℚ), the coset 𝒢_2θ has the proper cuspidal subset coming from (R_{F/ℚ}𝔾_m) × G_0, so ET.4/twisted-geometric-side fails without extra terms. (3) Unramified GL_2 check: for N = 2 and v split in F_0, BC* sends the Hecke operator T_v to the Hecke operator of GL_2(F_w) and the trace identity of ET.4/unramified-transfers is the Satake identity. (4) Local base change of the Steinberg representation of GL_2 is the Steinberg representation, and the twisted character at a σ-regular element equals −1 on elliptic norms, matching θ_St = −1 (ET.4/padic-character-distributions). (5) Coefficient check: for G = G_4 and H = G_{2,2}, ι(G,H) carries the factor ½ of |Out| = 2, matching ε_{(2,2)} = ½ in Caraiani–Scholze non-compact Theorem 5.6.1.

The precise hypotheses are: the data of the individual nodes.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Remark 5.5.4, p. 74; §5.6, Theorem 5.6.1, p. 75). Gives the F^+ = ℚ counterexample and the coefficient ε_n⃗.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Lemma 3.1, p. 13). Computes the Tamagawa numbers used in the torus check.

Each item is a direct specialisation of the named node.

**Acceptance.**

- Each of (1)–(5) is a numerical or structural identity that a wrong normalisation (missing ½, wrong sign of the Steinberg character, wrong Tamagawa number) would violate.

*Needs:* `ET.4/stable-twisted-identity`; `ET.4/no-proper-cuspidal-subsets`; `ET.4/unramified-transfers`; `ET.4/local-cyclic-base-change`; `ET.4/tamagawa-number-formula`.

## Layer ET.5: Counting and stabilizing Igusa correspondences

Igusa varieties are not proper, so the Lefschetz number of a Hecke correspondence is computed by the Fujiwara–Varshavsky theorem after a large Frobenius twist; acceptable test functions are those for which the twist is already built in. The fixed points are then parametrised by effective Kottwitz triples through Honda–Tate theory, which gives Shin's counting formula. Stabilization away from p is ordinary endoscopy; at p, the Igusa variety sees J_b rather than G, and the transfer goes from J_b through the Levi M_b to the endoscopic groups. The result is Shin's stable trace formula, which ET.7b combines with ET.4's stable–twisted identity.

### ET.5.1 Acceptable elements of J_b(ℚ_p) and acceptable test functions ★

Node `ET.5/acceptable-test-functions` (definition). Planet: *Acceptable test functions*.

Let (B, O_B, *, V, Λ_0, ⟨,⟩, h) be an unramified integral PEL datum of type (A) or (C) with group G, p a good prime, b ∈ B(G_{ℚ_p}, −μ) and Σ_b a completely slope-divisible p-divisible group with G-structure of type b, with slope decomposition Σ_b = ⊕_{i=1}^r Σ_i of slopes λ_1 > … > λ_r, so J_b(ℚ_p) ⊂ ∏_i End^0(Σ_i)^× (IgusaVarietiesAndTorsionConcentration:IG.0/automorphism-group-of-universal-cover). (a) An element δ = (δ_i) ∈ J_b(ℚ_p) is acceptable if for all i < j every eigenvalue e_i of δ_i and e_j of δ_j satisfy v_p(e_i) < v_p(e_j). More generally, for a Levi M_0 ⊂ G_0 with central cocharacter ν, a semisimple γ ∈ M_0(ℚ_p) is ν-acceptable if for every root α of G_0 not in M_0, ⟨α,ν⟩ > 0 iff α(γ) has positive p-adic valuation (Shin 2010 Definition 3.1); with the sign convention for the cocharacter attached to b in Shin 2010 §3.2, this agrees with (a) (Remark 3.3). (b) A function φ ∈ C_c^∞(G(𝔸_f^p) × J_b(ℚ_p)) is acceptable if (i) every (g,δ) in its support has δ acceptable and in the monoid S_b of elements acting on the Igusa tower by finite correspondences, and φ = Σ_{g ∈ I} α_g 1_{U^p(m) g U^p(m)} for a finite I and a sufficiently small level U^p(m); (ii) each correspondence [U^p(m) g U^p(m)] has finitely many fixed points on Ig_{b,U^p,m}(𝔽̄_p); (iii) for each g ∈ I the Lefschetz trace on H_c(Ig_{b,U^p,m}, L_ξ) equals the sum over those fixed points of the traces on stalks of L_ξ (ET.5/igusa-fixed-point-formula).

The precise hypotheses are: unramified integral PEL datum of type (A) or (C) at a good prime p; Σ_b completely slope divisible; levels U^p(m) small enough to be torsion free.

([S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Definitions 6.1 and 6.2, p. 18). Defines acceptable elements of J_b(ℚ_p) by separation of eigenvalue valuations across slopes, and acceptable functions by support, finiteness of fixed points and validity of the fixed-point formula (16).

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.3, Definition 3.1 and Remark 3.3, p. 11). Defines ν-acceptable elements of a Levi and notes agreement with the 2009 definition.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Remark 5.2.1 and Definition 5.2.2, pp. 732–733). Uses acceptable functions for the Igusa trace and explains why acceptability allows transfer from J_b(ℚ_p) to G(ℚ_p).

The definitions are Shin 2009 Definitions 6.1–6.2 and Shin 2010 Definition 3.1 with Remark 3.3; Caraiani–Scholze 2017 §5.2 (Remark 5.2.1) records that acceptability separates the slope components by valuation, which makes transfer from J_b to G possible (ET.5/transfer-at-p).

The definition exposes the following operations and relations.

- `IsAcceptableElement` (constructor): δ = (δ_i) ∈ J_b(ℚ_p) is acceptable iff v_p(e_i) < v_p(e_j) for all eigenvalues e_i of δ_i, e_j of δ_j, i < j.
- `IsNuAcceptable` (constructor): γ ∈ M_0(ℚ_p) is ν-acceptable iff, for all roots α outside M_0, ⟨α,ν⟩ > 0 ⇔ v_p(α(γ)) > 0.
- `IsNuAcceptable.iff_acceptable` (equivalence): For ν the cocharacter attached to b with Shin's sign convention and γ ∈ M_b ≅ J_b over ℚ̄_p, ν-acceptable equals acceptable (Shin 2010 Remark 3.3).
- `IsAcceptableElement.mul_central` (relation): If δ is acceptable and z is central with v_p of z constant on slopes, δz is acceptable.
- `IsAcceptableFunction` (constructor): The three conditions (support, finite fixed points, fixed-point formula) of Shin 2009 Definition 6.2.
- `IsAcceptableFunction.add` (structure): Acceptable functions on a fixed finite family of double cosets form a vector space.

**Checks.**

- `IsAcceptableElement.gl2` (computation): For GL_2-type data with slopes λ_1 > λ_2: δ = (1, p) on the slope components is acceptable and δ = (p, 1) is not.
- `IsAcceptableElement.basic` (degenerate): If b is basic (r = 1) every element of J_b(ℚ_p) is acceptable.
- `IsNuAcceptable.compat` (compatibility): For G_0 = GL_n and M_0 a standard Levi, ν-acceptability compares eigenvalue valuations across blocks i < j with ⟨e_i − e_j, ν⟩ > 0 (those on block i are larger); with Shin's sign convention this is the 2009 condition that larger slopes carry smaller valuations.
- `IsAcceptableFunction.not_all` (non-example): 1_{U^p} ⊗ 1_{J_b(ℤ_p)} is not acceptable when r > 1, because 1 ∈ J_b is not acceptable.

**Acceptance.**

- δ = 1 is acceptable only when r = 1 (b basic).
- For GL_2-type data with two slopes λ_1 > λ_2 and δ = (δ_1, δ_2) on the slope components, δ = (1, p) is acceptable (valuations 0 < 1) and δ = (p, 1) is not: the larger-slope component must have the smaller valuation.
- A central Frobenius power fr^s raised to a large exponent is acceptable (ET.5/frobenius-twist-acceptability).

*Used by:* Shin 2009 Theorem 13.1 (the counting formula is proved for acceptable test functions); Shin 2010 Theorem 7.2 (the stable Igusa trace formula is stated for acceptable functions); Caraiani–Scholze non-compact §5.3 (the test function φ = φ_p φ_{S_pf} φ^S is assumed acceptable in the first instance); `ET.5/igusa-kottwitz-triples`; `ET.5/transfer-at-p`.

*Needs:* `IgusaVarietiesAndTorsionConcentration:IG.0/automorphism-group-of-universal-cover`; `IgusaVarietiesAndTorsionConcentration:IG.0/completely-slope-divisible`; `IgusaVarietiesAndTorsionConcentration:IG.1/mantovan-igusa-variety`; `IgusaVarietiesAndTorsionConcentration:IG.1/igusa-group-actions`; `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`.

### ET.5.2 The fixed-point formula for Frobenius-twisted Igusa correspondences

Node `ET.5/igusa-fixed-point-formula` (theorem).

Let φ = 1_{U^p(m) g U^p(m)} with g ∈ G(𝔸_f^p) × S_b, U^p(m) small, and Ig_{b,U^p,m} the finite-level Igusa variety over 𝔽̄_p with a model over a finite field 𝔽_{p^s} on which the absolute Frobenius acts as fr^{-s} ∈ J_b(ℚ_p). (a) The double coset defines an algebraic correspondence [U^p(m) g U^p(m)] on Ig_{b,U^p,m} through a smaller level V^p(m′), and a cohomological correspondence on L_ξ. (b) There is M′ > 0, independent of the coefficient sheaf, such that for every N > M′ the correspondence (Fr^s × 1)^N ∘ [U^p(m) g U^p(m)] = [U^p(m) g (fr^{-s})^N U^p(m)] has finitely many fixed points and its Lefschetz trace on H_c(Ig_{b,U^p,m}, L_ξ) equals the sum over its fixed points of the traces on the stalks of L_ξ. (c) Consequently φ^{(N)}(x) = φ(x·(fr^s)^N) is acceptable for N ≫ 0 (Shin 2009 Lemma 6.3).

The precise hypotheses are: Ig_{b,U^p,m} is separated of finite type but not proper; the theorem uses the Frobenius-twist form of Fujiwara's theorem, not a proper Lefschetz formula; U^p(m) small enough; ξ an irreducible algebraic representation giving the ℓ-adic sheaf L_ξ.

([S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, diagrams (13)–(14), (15), formula (16) and Lemma 6.3 with proof, pp. 17–18). Realises Hecke and J_b-actions as correspondences on Igusa varieties, states the desired fixed-point formula (16) and proves it after a large Frobenius twist by Fujiwara's formula (Fujiwara 1997 Cor. 5.4.5; Varshavsky Thm 2.3.2).

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.5, proof of Lemma 5.5.1, p. 743). Records that the proof of Shin's Lemma 6.4 rests on Lemma 6.3, i.e. on Fujiwara's formula for the datum at hand.

Build the correspondence (13) of Shin 2009 §6 from the Hecke and J_b-actions of IgusaVarietiesAndTorsionConcentration:IG.1/igusa-group-actions, with the level V^p(m′) of Mantovan 2005 Lemma 6.

Choose a model over 𝔽_{p^s} on which Frobenius acts through fr^{-s} (Shin 2007 §2.3), so that twisting by (fr^{-s})^N is composition with the N-th Frobenius power.

Apply the Fujiwara–Varshavsky theorem (EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula, with EDC.8/frobenius-twist-contracting): for N above a bound independent of the sheaf, the twisted correspondence has isolated fixed points and naive local terms. Isolation, finiteness and the large-Frobenius-power bound are checked here, on the Igusa variety; the general trace theorem is EDC.8's.

This is the contracting-boundary trace theorem of the layer: the Igusa application of Fujiwara–Varshavsky, not the point count of an ordinary endomorphism.

**Acceptance.**

- For g = 1 and N large, the fixed points of (Fr^s)^N are the 𝔽_{p^{sN}}-points of the model, and the formula is the Grothendieck–Lefschetz trace formula for the open variety with compact supports.
- For N small the formula can fail (non-isolated fixed points along the boundary), which is why only large twists are acceptable.
- The bound M′ does not depend on ξ.

*Used by:* `ET.5/igusa-counting-formula`; `ET.5/acceptable-functions-determine`; `ET.5/acceptance-examples`.

*Needs:* `EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula`; `EtaleDualityAndPerverseSheaves:EDC.8/frobenius-twist-contracting`; `EtaleDualityAndPerverseSheaves:EDC.8/contracting-correspondence`; `EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence-lifting`; `IgusaVarietiesAndTorsionConcentration:IG.1/igusa-group-actions`; `IgusaVarietiesAndTorsionConcentration:IG.1/igusa-cohomology`; `EtaleDualityAndPerverseSheaves:EDC.5`; `EtaleDualityAndPerverseSheaves:EDC.6`; `LefschetzPencilsAndVanishingCycles:LPV.6`.

### ET.5.3 Kottwitz triples for Igusa varieties and their invariant ★

Node `ET.5/igusa-kottwitz-triples` (definition). Planet: *Kottwitz triples for Igusa varieties*.

With the PEL datum and b as in ET.5/acceptable-test-functions: a Kottwitz triple of type b is (γ_0; γ, δ) with γ_0 ∈ G(ℚ) semisimple and elliptic in G(ℝ), γ ∈ G(𝔸_f^p) conjugate to γ_0 over 𝔸_f^p, and δ ∈ J_b(ℚ_p) acceptable and conjugate to γ_0 in G(ℚ̄_p) (equivalently in G(ℚ_p) after transport through the inner twist J_b ⊂ M_b), up to the equivalence generated by conjugating γ_0 stably, γ in G(𝔸_f^p) and δ in J_b(ℚ_p). KT_b is the set of equivalence classes. For each triple with stable centralizer I_0 the Kottwitz invariant α(γ_0; γ, δ) ∈ 𝔎(I_0/ℚ)^D is defined from local invariants inv_v(γ_0, γ_v) for v ≠ p, ∞ (ET.0/rational-classes-in-stable-class), the invariant α_p(γ_0; δ) obtained from the class of δ in B(I_0) through the Kottwitz map, and the archimedean invariant; the triple is effective if α(γ_0; γ, δ) is trivial, and KT_b^eff ⊂ KT_b is the set of effective classes. The group I_δ (the twisted centralizer of δ) is an inner form of I_0 over ℚ_p, and α_p changes by inv_p when δ or γ_0 is replaced by a stably conjugate element.

The precise hypotheses are: unramified PEL datum of type (A) or (C); δ acceptable.

([S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §10, Definitions 10.1, 10.3, 10.7 and Lemmas 10.8–10.9, pp. 28–32). Defines Kottwitz triples of type b, their equivalence, the Kottwitz invariant and effective triples, and proves that I_δ is an inner form of I_0 and how the invariants change.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §4.2, Definition 4.2 and Lemma 4.3, pp. 13–14; §4.3, p. 14). Restates Kottwitz triples with ν_b-acceptable δ and defines α̃_p(γ_0, δ).

The definition is Shin 2009 Definitions 10.1, 10.3 and 10.7, with α defined in §10 from the cocycles c_v and the Kottwitz map (displays (27)–(28)); Shin 2010 Definition 4.2 and §§4.2–4.3 give the same notion with α̃_p.

Lemma 10.8 (I_δ is an inner form of I_0) and Lemma 10.9 (change of invariants) follow from the inner-twist theory of ET.0/inner-twist and the Kottwitz map of BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps.

The definition exposes the following operations and relations.

- `KottwitzTriple` (constructor): Triples (γ_0;γ,δ) with γ_0 elliptic semisimple, γ ~ γ_0 away from p, δ acceptable with δ ~ γ_0 at p.
- `KottwitzTriple.equiv` (extensionality): Equivalence generated by stable conjugation of γ_0 and conjugation of γ and δ.
- `KottwitzTriple.invariant` (data): α(γ_0;γ,δ) ∈ 𝔎(I_0/ℚ)^D from local invariants and the Kottwitz map at p.
- `KottwitzTriple.IsEffective` (constructor): Effective iff α is trivial.
- `KottwitzTriple.innerForm` (projection): I_δ is an inner form of I_0 over ℚ_p.
- `KottwitzTriple.invariant_change` (relation): α_p(γ_0;δ′) = α_p(γ_0;δ) + inv_p(δ,δ′) and α_p(γ′_0;δ) = α_p(γ_0;δ) + inv_p(γ_0,γ′_0).

**Checks.**

- `KottwitzTriple.gm` (computation): For G = 𝔾_m-type data every triple is (z;z,z) with z central and all triples are effective.
- `KottwitzTriple.not_acceptable` (non-example): (γ_0;γ,δ) with δ not acceptable is excluded; including it would break the transfer at p (ET.5/transfer-at-p).
- `KottwitzTriple.trivial_kernel` (degenerate): If 𝔎(I_0/ℚ) = 1 then KT_b^eff = KT_b over γ_0.
- `KottwitzTriple.compat_shimura` (compatibility): For b basic and J_b = G_{ℚ_p}, the triples are Kottwitz's triples of Kottwitz 1992 §14 with δ in place of the σ-conjugacy class.

**Acceptance.**

- For G = GL_n-type data with b basic, δ ranges over J_b(ℚ_p) = (inner form)(ℚ_p) and α_p is the Kottwitz invariant of δ.
- If I_0 has 𝔎(I_0/ℚ) trivial, every triple is effective.
- A triple whose δ is not acceptable is not a Kottwitz triple of type b.

*Used by:* Shin 2009 Theorem 13.1 (the counting formula is a sum over KT_b^eff); Shin 2010 §§5–6 (the stabilisation regroups effective triples by κ ∈ 𝔎(I_0/ℚ) and endoscopic triples); Kottwitz 1992 (19.5) (the analogous formula for Shimura varieties, to which Shin's is modelled (Remark 13.3)); `ET.5/p-adic-types`; `ET.5/fixed-points-and-effective-triples`.

*Needs:* `ET.0/rational-classes-in-stable-class`; `ET.0/global-kottwitz-obstruction`; `ET.0/inner-twist`; `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`; `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`; `ET.5/acceptable-test-functions`.

### ET.5.4 p-adic types and Honda–Tate theory with endomorphism structure

Node `ET.5/p-adic-types` (theorem).

Let F_0 be a number field. A p-adic type over F_0 is a quadruple (M, η⃗, n⃗, κ) with M a CM or totally real field over F_0 and the remaining data recording the p-adic valuations of a Weil number, multiplicities and the positivity datum (Shin 2009 Definition 8.1); it is simple if M is a field and n⃗ = (1) (these are Harris–Taylor's p-adic types). Then: (a) isogeny classes of abelian varieties over 𝔽̄_p with an action of a CM field (more generally a semisimple algebra with positive involution, as in the PEL datum) correspond, through Tate's theorem and Honda–Tate theory, to equivalence classes of p-adic types, with End^0 computed from the type; (b) every Kottwitz triple of type b determines a p-adic type over F (Shin 2009 Lemma 10.4), and the map from KT_b to p-adic types is well defined; (c) a p-adic type arises from a polarized abelian variety with PEL structure of the given type exactly when the associated invariant vanishes (Proposition 8.4 and Corollary 8.5).

The precise hypotheses are: abelian varieties over finite fields; PEL-type endomorphism structure.

([S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §8, Definitions 8.1–8.2, Remark 8.3, Proposition 8.4, Corollary 8.5 and Lemma 8.6, pp. 23–26). Introduces p-adic types, relates simple types to Harris–Taylor's, and classifies isogeny classes with endomorphism structure through Honda–Tate theory.

([S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §10, Lemma 10.4 and Corollary 10.6, pp. 29–30). Attaches a p-adic type to each Kottwitz triple.

Tate's theorem End(A) ⊗ ℚ_ℓ ≅ End_{Frob}(V_ℓA) and the Honda–Tate classification by Weil q-numbers are imported from AbelianSchemesAndArithmeticModuliPartII:F0/tate-hom and AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate.

Refine to O-linear, polarized objects by recording the p-adic valuations of Frobenius in the M-module structure (Shin 2009 §8, the facts listed from Honda–Tate theory on p. 24; Proposition 8.4, Corollary 8.5, Lemma 8.6).

(b): Shin 2009 Lemma 10.4 and Corollary 10.6.

**Acceptance.**

- A supersingular elliptic curve over 𝔽_{p²} with Frobenius p has a real Weil number and End^0 the quaternion algebra ramified exactly at p and ∞.
- An ordinary elliptic curve has a type with M imaginary quadratic split at p.
- A Weil number that is not a q-Weil number gives no type.

*Used by:* `ET.5/fixed-points-and-effective-triples`.

*Needs:* `AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate`; `AbelianSchemesAndArithmeticModuliPartII:F0/tate-hom`; `PELModuli:M1/pel-abelian-scheme`; `ET.5/igusa-kottwitz-triples`.

### ET.5.5 Fixed points of Igusa correspondences are counted by effective triples

Node `ET.5/fixed-points-and-effective-triples` (theorem).

Let FPAV_b be the set of pairs (z, [a]) with z a near-equivalence class of polarized abelian varieties with PEL structure over 𝔽̄_p whose p-divisible group is isomorphic to Σ_b (the set PIC_b) and [a] a conjugacy class in the automorphism group H_z(A) (Shin 2009 Definition 9.7). Then (a) the natural map FPAV_b → KT_b lands in KT_b^eff (Shin 2009 Lemma 12.1: the Kottwitz invariant of a triple coming from an abelian variety vanishes, by Lemma 11.1 and Corollary 11.3); (b) FPAV_b → KT_b^eff is a bijection (Lemma 12.3); (c) the automorphism group of a point over a triple (γ_0;γ,δ) is I_φ(ℚ), an inner form of I_0 that is compact modulo centre at ∞, and the number of points in the ker^1-orbit is |ker^1(ℚ, G)|·|A(I_0)|-weighted as in the counting formula; (d) the fixed points of the correspondence [U^p(m)(γ,δ)U^p(m)] on Ig_{b,U^p,m}(𝔽̄_p) are in bijection with the corresponding fibres, giving the orbital integrals O_γ(φ^p) O_δ(φ_p) and the volume vol(I_φ(ℚ)\I_φ(𝔸_f)) (Shin 2009 §7, Lemma 7.4).

The precise hypotheses are: unramified PEL datum; polarizations up to near equivalence (Shin 2009 §9).

([S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §7, Lemmas 7.1, 7.3, 7.4, pp. 20–22; §9, Definition 9.7, p. 28). Describes 𝔽̄_p-points of Igusa varieties and the fixed points of correspondences in terms of polarized abelian varieties.

([S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §§11–12, Lemma 11.1, Corollary 11.3, Lemmas 12.1 and 12.3, pp. 35–38). Proves that triples from abelian varieties are effective and that FPAV_b → KT_b^eff is a bijection.

Describe Ig_b(𝔽̄_p) through polarized abelian varieties with an isomorphism of p-divisible groups to Σ_b (Shin 2009 §7, Lemma 7.1, Definition 7.2, Lemmas 7.3–7.4).

Classify isogeny classes by p-adic types (ET.5/p-adic-types) and polarizations by Shin 2009 §9 (Lemmas 9.2–9.6), then attach a Kottwitz triple (Lemma 12.1) and prove effectivity from the vanishing of the auxiliary invariants (§11).

Surjectivity onto effective triples uses Honda–Tate existence and the Hasse principle for the PEL group (PELModuli:M3/ker1-classification, M3/hasse-principle-cases), with ker^1 multiplicities as in Kottwitz 1992 §§14–19.

This node is the Igusa-variety form of the Langlands–Kottwitz parametrisation; the Shimura-variety form for compact unitary data is AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity and is not replanned here.

**Acceptance.**

- For a CM point (b basic, I_0 a torus) the fibre over a triple is a single I_φ(ℚ)-orbit.
- If α(γ_0;γ,δ) ≠ 0 the triple has no abelian variety over it.
- The count is independent of the choice of Σ_b in its isogeny class.

*Used by:* `ET.5/igusa-counting-formula`.

*Needs:* `ET.5/p-adic-types`; `ET.5/igusa-kottwitz-triples`; `PELModuli:M3/ker1-classification`; `PELModuli:M3/hasse-principle-cases`; `IgusaVarietiesAndTorsionConcentration:IG.1/mantovan-igusa-variety`; `IgusaVarietiesAndTorsionConcentration:IG.0/serre-tate-semi-abelian`.

### ET.5.6 Shin's point-counting formula for Igusa varieties ★

Node `ET.5/igusa-counting-formula` (theorem). Planet: *Point-counting formula for Igusa varieties*.

If φ ∈ C_c^∞(G(𝔸_f^p) × J_b(ℚ_p)) is acceptable, then tr(φ | H_c(Ig_b, L_ξ)) = Σ_{(γ_0;γ,δ) ∈ KT_b^eff} vol(I_∞(ℝ)^1)^{-1} |A(I_0)| tr ξ(γ_0) · O^{G(𝔸_f^p) × J_b(ℚ_p)}_{(γ,δ)}(φ), the orbital integral taken over I_{(γ,δ)}(𝔸_f^p × ℚ_p) with the transported Haar measures, I_∞ the inner form of I_0 compact modulo centre at ∞ and A_ℚ(I_0) = π_0(Z(Î_0)^Γ)^D (Kottwitz 1986 §§1–2; Shin 2010 §2.2), a finite group for elliptic γ_0, which sits in the exact sequence 1 → 𝔎(I_0/ℚ)^D → A_ℚ(I_0) → A_ℚ(G) → 1 (the analogue of the ker^1 and Tamagawa factors of Kottwitz 1992 (19.5)). The only implicit hypothesis is that Ig_b comes from an unramified integral PEL datum.

The precise hypotheses are: unramified integral PEL datum of type (A) or (C) at p; φ acceptable.

([S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §13, Theorem 13.1 and Remarks 13.2–13.3, p. 41). Proves the counting formula for acceptable functions as a sum over effective Kottwitz triples, with the only implicit hypothesis an unramified integral PEL datum.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §4.4, Theorem 4.4 and display (4.3), p. 15). Restates the formula as the input to stabilisation.

Start from the fixed-point formula (ET.5/igusa-fixed-point-formula) and the parametrisation of fixed points by effective triples (ET.5/fixed-points-and-effective-triples).

Regroup the fixed points over each triple as an orbital integral of φ with the volume of I_φ and the ker^1 multiplicity (Shin 2009 §13).

Compare with Kottwitz 1992 (19.5) (Remark 13.3).

**Acceptance.**

- For b basic and g = 1, φ = 1_{U^p} ⊗ 1_{δ K_p}, the formula counts fixed points of δ on the zero-dimensional basic Igusa variety.
- For φ supported on non-acceptable δ the formula is not asserted.
- Both sides are linear in φ.

*Used by:* `ET.5/stabilization-away-from-p`; `ET.5/stable-igusa-trace-formula`.

*Needs:* `ET.5/igusa-fixed-point-formula`; `ET.5/fixed-points-and-effective-triples`; `ET.1/orbital-integral`; `AdelicAlgebraicGroups:AA.2/tamagawa-measure`.

### ET.5.7 Stabilization of the Igusa counting formula away from p and ∞

Node `ET.5/stabilization-away-from-p` (theorem).

In the formula of ET.5/igusa-counting-formula, write the sum over effective triples as a sum over (γ_0, κ) with κ ∈ 𝔎(I_0/ℚ) by Fourier inversion of the Kottwitz invariant. Then: (a) e_v(I_v) = 1 for almost all v ≠ p, ∞, and for effective triples the product of the local signs is controlled (Shin 2010 Lemma 5.1); (b) for each (H, s, η) elliptic and each γ_H transferring to γ_0, there is h^{H,p} ∈ C_c^∞(H(𝔸_f^p)) (a Langlands–Shelstad transfer of φ^p, unramified-matching at almost all places) whose stable orbital integrals equal the κ-orbital integrals of φ^p (Lemma 5.2), and h_{H,∞} a combination of averaged pseudo-coefficients whose stable orbital integrals reproduce the archimedean factor vol(I_∞(ℝ)^1)^{-1} tr ξ(γ_0) with the sign ⟨μ, s⟩ convention of Kottwitz (Lemma 5.4 and Remark 5.5). The twisted fundamental lemma is not needed on this route: away from p only ordinary transfer and the ordinary fundamental lemma enter, and at p the transfer of ET.5/transfer-at-p is used.

The precise hypotheses are: the ordinary transfer factors of ET.1/local-transfer-factor with Kottwitz's sign convention (Shin 2010 Remark 5.5: s versus s^{-1}).

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5, Lemmas 5.1, 5.2, 5.4 and Remarks 5.3, 5.5, 5.6, pp. 15–17). Performs the first stabilisation step and constructs the functions h_{H,p} away from p and h_{H,∞} at infinity.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Definition 5.2.2, pp. 732–733). Defines φ^H away from p by Langlands–Shelstad transfer and at ∞ by Kottwitz's construction.

Rewrite α(γ_0;γ,δ) through 𝔎(I_0/ℚ)^D and its local components (ET.0/global-kottwitz-obstruction).

Away from p and ∞ use Langlands–Shelstad transfer (ET.3/local-transfer-existence) and the fundamental lemma at almost all places (ET.3/fundamental-lemma-almost-all-places).

At ∞ use the pseudo-coefficient transfer of ET.1/archimedean-pseudocoefficient-transfer (Kottwitz 1990 §7).

The wording 'unproved twisted fundamental lemma' of the older stage text is replaced: the twisted fundamental lemma is proved for unit elements (Waldspurger with Ngô) and for spherical functions (Lemaire–Mœglin–Waldspurger 2018), see ET.3/twisted-fundamental-lemma-and-transfer; this route simply does not invoke it.

**Acceptance.**

- For H = G and κ = 1 the transfer is the identity and the sign is 1.
- For G with 𝔎(I_0/ℚ) trivial for all γ_0 (no endoscopy), the stabilisation away from p is the identity.
- If φ^p is unramified at v, h^{H,p}_v is the unramified image.

*Used by:* `ET.5/igusa-endoscopic-test-function`; `ET.5/stable-igusa-trace-formula`.

*Needs:* `ET.5/igusa-counting-formula`; `ET.0/global-kottwitz-obstruction`; `ET.3/local-transfer-existence`; `ET.3/fundamental-lemma-almost-all-places`; `ET.1/archimedean-pseudocoefficient-transfer`; `ET.1/local-transfer-factor`; `ET.3/twisted-fundamental-lemma-and-transfer`.

### ET.5.8 Endoscopy of J_b through the Levi M_b

Node `ET.5/jb-endoscopic-levi-data` (construction).

Let b ∈ B(G_{ℚ_p}) be decent with slope cocharacter ν_b, M_b the centralizer of ν_b (a Levi subgroup of G_{ℚ_p}) and J_b the inner form of M_b given by b (BunGAndNewtonStrata:BG0/sigma-centralizer-J-b). For an endoscopic triple (H, s, η) of G over ℚ_p define: E_p(M_b, G) and E_p(J_b, G), the sets of G-endoscopic triples (M_H, s_H, η_H) for M_b and for J_b; the subsets E^ef_p(M_b, G; H) of classes for which some γ_{M_H} ∈ M_H(ℚ_p) and γ_H ∈ H(ℚ_p) correspond, with γ_{M_H} ν_b-acceptable, and E^eff_p(J_b, G; H) ⊂ E^ef_p(M_b, G; H) similarly for J_b (Shin 2010 §6.1–6.2). For a triple (T_H, T, j) of maximal tori T_H ⊂ H, T ⊂ M_b and j : T_H ≅ T construct the cocharacter ν : 𝔻 → H (ν_b followed by j^{-1}), the centralizer H_ν = Z_H(ν), and complete it to a G-endoscopic triple (H_ν, s_ν, η_ν) for M_b with embeddings l_{M_b}, l_{M_H}, i_{M_H}, ν_{M_H} fixed as in Shin 2010 §6.2; this gives the representatives used for the transfer at p.

The precise hypotheses are: b decent; the endoscopic triples are ordinary (no twist) over ℚ_p.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.2, p. 10). Defines M_b and J_b and the inner twist between them.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §6.1–6.2, (6.1)–(6.4) and Lemmas 6.1–6.2, pp. 17–20). Defines the sets of (effective) endoscopic triples for M_b and J_b and constructs the representatives (M_H, s_H, η_H) from tori.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Remark 5.4.1, pp. 739–740). Uses E^eff_p(J_b, G, G_n⃗) (attributed there to Shin's §6.2) to define the map Red^b_n⃗.

Compare root systems: R(H_ν, T_H) ⊂ R(M_b, T) and the coroots satisfying α^∨(s) = 1 (Shin 2010 (6.4)).

Construct the L-embedding of ^LH_ν into ^LM_b compatible with η via the Levi L-embedding of ReductiveGroupsPartII:RG2.5/l-group-levi-embedding.

Show the injection E^eff_p(J_b,G;H) ↪ E^ef_p(M_b,G;H) and the bijection between related pairs (Shin 2010 (6.1)–(6.2), Lemmas 6.1–6.2).

The definition exposes the following operations and relations.

- `JbEndoscopicTriples` (constructor): E_p(J_b,G) and E_p(M_b,G), sets of G-endoscopic triples for J_b and M_b.
- `JbEndoscopicTriples.effective` (constructor): E^eff_p(J_b,G;H) ⊂ E^ef_p(M_b,G;H), defined by the existence of related ν_b-acceptable elements.
- `JbEndoscopicTriples.ofTori` (constructor): (H_ν, s_ν, η_ν) built from (T_H, T, j).
- `JbEndoscopicTriples.effective_injective` (relation): E^eff_p(J_b,G;H) ↪ E^ef_p(M_b,G;H).
- `JbEndoscopicTriples.basic` (simp): For b basic, E_p(J_b,G) is the set of endoscopic triples of the inner form J_b of G.
- `JbEndoscopicTriples.trivial` (simp): For H = G, the only triple is (M_b, 1, id).

**Checks.**

- `JbEndoscopicTriples.gl_basic` (computation): For G = GL_2 and b basic of slope ½, J_b = D^× and the only effective triple for H = G is (D^×, 1, id).
- `JbEndoscopicTriples.ordinary` (compatibility): For b μ-ordinary, J_b = M_b and E^eff_p(J_b,G;H) = E^ef_p(M_b,G;H).
- `JbEndoscopicTriples.empty` (non-example): For an endoscopic H whose tori do not transfer to J_b (e.g. a split torus and J_b anisotropic modulo centre), E^eff_p(J_b,G;H) is empty.
- `JbEndoscopicTriples.trivial_test` (degenerate): For H = G the set has one element.

**Acceptance.**

- If b is basic, M_b = G and J_b is an inner form of G: E_p(J_b, G) is the set of endoscopic triples of J_b.
- If b is μ-ordinary for an unramified group, J_b ≅ M_b (Shin 2010 §8.2).
- If H = G, (M_H, s_H, η_H) = (M_b, 1, id).

*Used by:* Shin 2010 Lemma 6.5 (h^H_p is defined by matching κ-orbital integrals indexed by these triples); Caraiani–Scholze 2017 Remark 5.4.1 (Red^b_n⃗ is a sum over E^eff_p of Jacquet functors, transfer and the Langlands–Jacquet map); ET.7b/newton-reduction (ET.6a packet) (the representation-theoretic dual of the transfer at p); `ET.5/transfer-at-p`.

*Needs:* `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`; `BunGAndNewtonStrata:BG0/decent-representative`; `ET.0/endoscopic-datum`; `ReductiveGroupsPartII:RG2.5/l-group-levi-embedding`; `ET.0/inner-twist`.

### ET.5.9 Transfer at p from J_b to endoscopic groups of G ★

Node `ET.5/transfer-at-p` (theorem). Planet: *Endoscopic transfer at p for Igusa varieties*.

Let (H,s,η) be an elliptic endoscopic triple of G and φ_p ∈ C_c^∞(J_b(ℚ_p)) acceptable. (a) (Nonstandard transfer, Shin 2010 Lemma 3.9) If φ ∈ C_c^∞(M_0(ℚ_p)) is supported on ν-acceptable elements and has vanishing orbital integrals at semisimple m with disconnected centralizer, there is φ̃ ∈ C_c^∞(G_0(ℚ_p)) with O^{G_0}_g(φ̃) = δ_P(ν)(m)^{-1} O^{M_0}_m(φ) when g is conjugate to an acceptable m and 0 otherwise. (b) (Transfer-factor identity, Lemma 6.3) For each (M_H, s_H, η_H) ∈ E^eff_p(J_b,G;H) there is a non-zero constant c_{M_H}, depending only on the normalisation of the transfer factor Δ_p(·,·)_{J_b M_H}, with c_{M_H} Δ_p(γ_H, δ)_{J_b M_H} = ⟨α̃_p(γ_0, δ), κ̃⟩^{-1} Δ_p(γ_H, γ_0)_{M_b M_H} for related γ_H, γ_0, δ; c_{M_H} = 1 in the GL case and when J_b ≅ M_b (Shin 2010 §8). (c) (Lemma 6.5) There is h^H_p ∈ C_c^∞(H(ℚ_p)) such that for every (G,H)-regular semisimple γ_H, SO(h^H_p) at γ_H equals the κ̃-weighted orbital integral O_p(γ_0, κ̃, φ_p) if (H,s,η,γ_H) is effectively related to some δ, and 0 otherwise; h^H_p is obtained by transfer from J_b(ℚ_p) to M_H(ℚ_p) (through the quasi-split M_b) followed by the nonstandard transfer (a) from M_H to H. Dually, on representations, tr π_H(h^H_p) = tr(Red^b_H(π_H))(φ_p) where Red^b_H = n-Red^b_H ⊗ δ̄^{1/2}_{P(ν_b)} includes the modulus twist δ̄_{P(ν_b)}(δ) = δ_{P(ν_b)}(γ_0) (Shin 2010 §6; the corrected form of Caraiani–Scholze 2017 Lemma 5.4.2, erratum E74 of the CS17 extraction); the representation-theoretic map itself is planned in ET.7b/newton-reduction.

The precise hypotheses are: φ_p acceptable (essential for (a)); transfer factors normalised as in Shin 2010 §6.3.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.4, Lemma 3.9 and Corollary 3.10, p. 12). Proves the nonstandard transfer of functions supported on ν-acceptable elements of a Levi to the group.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §6.3–6.4, Lemmas 6.3 and 6.5, pp. 21–25; §8, pp. 27–28). Proves the identity between the Kottwitz invariant and transfer factors with constant c_{M_H}, constructs h^H_p, and computes c_{M_H} in the GL and J_b ≅ M_b cases.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Remark 5.4.1, pp. 739–740). Describes φ^n⃗_p as transfer from J_b(ℚ_p) to M_{G_n⃗}(ℚ_p) followed by nonstandard transfer to G_n⃗(ℚ_p).

(a): Shin 2010 Lemma 3.9 (cf. Harris–Taylor Lemma V.5.2), descending orbital integrals along the parabolic with Levi M_0 defined by ν, using that acceptable elements are regular for the unipotent radical.

(b): compare Kottwitz invariants with the Langlands–Shelstad factors of ET.1/local-transfer-factor through the inner twist J_b → M_b (Shin 2010 §6.4, proof of Lemma 6.3).

(c): combine transfer between inner forms (ET.3/local-transfer-existence, ET.3/inner-form-transfer in the GL case) with (a) and (b) (Shin 2010 §6.3, Lemma 6.5).

**Acceptance.**

- For H = G and b basic, h^G_p is the transfer of φ_p from the inner form J_b to G, multiplied by the Kottwitz sign e(J_b).
- For J_b ≅ M_b, c_{M_H} = 1 (Shin 2010 §8.2).
- For φ_p not acceptable, (a) fails in general: φ̃ need not exist.

*Used by:* `ET.5/igusa-endoscopic-test-function`; `ET.5/stable-igusa-trace-formula`; `ET.5/acceptance-examples`.

*Needs:* `ET.5/jb-endoscopic-levi-data`; `ET.5/acceptable-test-functions`; `ET.1/local-transfer-factor`; `ET.3/local-transfer-existence`; `ET.3/inner-form-transfer`; `ET.0/kottwitz-sign`; `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`.

### ET.5.10 The endoscopic test functions φ^H attached to an Igusa test function

Node `ET.5/igusa-endoscopic-test-function` (construction).

For φ = φ^p φ_p ∈ C_c^∞(G(𝔸_f^p) × J_b(ℚ_p)) acceptable and (H,s,η) ∈ E^ell(G), define φ^H = h^{H,p} h^H_p h^H_∞ ∈ C_c^∞(H(𝔸)): h^{H,p} a Langlands–Shelstad transfer of φ^p (unramified image at almost all places), h^H_p the function of ET.5/transfer-at-p, and h^H_∞ the archimedean function of ET.4/archimedean-lefschetz-functions (Kottwitz's combination of averaged pseudo-coefficients, φ^n⃗_∞ for the unitary groups). For the unitary similitude datum of Caraiani–Scholze with G ≅ G_N over 𝔸_f and the test function φ = φ_p · 1_{K(N)} · φ^S (φ^S unramified, K(N) principal congruence at S_pf with N_0 | N), φ^n⃗ = φ^n⃗_p · φ^n⃗_{S_pf} · φ^{n⃗,S} · φ^n⃗_∞ with φ^{n⃗,S} = η̃*_n⃗(φ^S) (ET.4/unramified-transfers) and φ^n⃗_{S_pf} the Langlands–Shelstad transfer of 1_{K(N)}.

The precise hypotheses are: φ acceptable; the level N divisible by N_0 of ET.4/small-level-transfer in the non-compact datum.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §7, p. 26). Assembles h_H from the local functions at p, away from p and at ∞.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Definition 5.2.2, pp. 732–733). Defines φ^H := φ^{H,p} φ^H_p φ^H_∞ for acceptable φ and elliptic (H,s,η).

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.3, Definition 5.3.1, p. 68). Defines φ^n⃗ for the non-compact datum with φ^n⃗_{S_pf} the Langlands–Shelstad transfer and φ^{n⃗,S} = η̃*(φ^S).

Assemble the local constructions: Shin 2010 §7; Caraiani–Scholze 2017 Definition 5.2.2; Caraiani–Scholze non-compact Definition 5.3.1.

The definition exposes the following operations and relations.

- `igusaEndoscopicTestFunction` (constructor): φ ↦ φ^H = h^{H,p} h^H_p h^H_∞.
- `igusaEndoscopicTestFunction.stableOrbital` (characterisation): SO_{γ_H}(φ^H) equals the κ-weighted combination of orbital integrals of φ at the related triples, and 0 if no triple is related.
- `igusaEndoscopicTestFunction.unramified` (simp): At an unramified place v ∉ S, (φ^H)_v = η̃*(φ_v).
- `igusaEndoscopicTestFunction.trivial` (simp): For H = G, φ^G away from p is φ^p.
- `igusaEndoscopicTestFunction.linear` (structure): φ ↦ φ^H is linear modulo functions with vanishing stable orbital integrals.

**Checks.**

- `igusaEndoscopicTestFunction.basic_gl` (computation): For G = GL_n-type, b basic and H = G, φ^G_p is the Jacquet–Langlands transfer of φ_p from D^× to GL_n with sign e(D^×) = (−1)^{n−1}.
- `igusaEndoscopicTestFunction.unramified_test` (compatibility): At v ∉ S, φ^H_v is the Satake transfer η̃*(φ_v) of ET.4/unramified-transfers.
- `igusaEndoscopicTestFunction.no_relation` (degenerate): If E^eff_p(J_b,G;H) is empty then φ^H_p has vanishing stable orbital integrals and ST^H_e(φ^H) = 0.
- `igusaEndoscopicTestFunction.not_naive` (non-example): Taking φ^H_p to be the ordinary Langlands–Shelstad transfer of a function on G(ℚ_p) is wrong: the source of the transfer is J_b(ℚ_p), not G(ℚ_p).

**Acceptance.**

- For H = G the function φ^G at p is the transfer of φ_p from J_b to G.
- If φ^p is unramified outside S, φ^{H,p} is unramified outside S.
- φ^H is well defined only up to functions with vanishing stable orbital integrals.

*Used by:* Shin 2010 Theorem 7.2 (the stable Igusa trace formula is Σ ι(G,H) ST^H_e(φ^H)); Caraiani–Scholze non-compact Theorem 5.6.1 (φ^n⃗ is BC-matched with f^n⃗ to pass to the twisted trace formula); ET.7b/csnc-test-functions (ET.6a packet) (the explicit test-function package of the non-compact datum); `ET.5/stable-igusa-trace-formula`.

*Needs:* `ET.5/transfer-at-p`; `ET.5/stabilization-away-from-p`; `ET.4/archimedean-lefschetz-functions`; `ET.4/unramified-transfers`; `ET.4/small-level-transfer`.

### ET.5.11 Shin's stable trace formula for Igusa varieties ★

Node `ET.5/stable-igusa-trace-formula` (theorem). Planet: *Shin's stable trace formula for Igusa varieties*.

Let G come from an unramified integral PEL datum of type (A) or (C), b ∈ B(G_{ℚ_p}, −μ), Ig_b the Igusa variety and L_ξ the sheaf of an irreducible algebraic representation ξ. For every acceptable φ ∈ C_c^∞(G(𝔸_f^p) × J_b(ℚ_p)) of product form, tr(φ | ι_ℓ H_c(Ig_b, L_ξ)) = |ker^1(ℚ, G)| Σ_{(H,s,η) ∈ E^ell(G)} ι(G,H) ST^H_e(φ^H), with φ^H as in ET.5/igusa-endoscopic-test-function and ST^H_e, ι(G,H) as in ET.4/stable-elliptic-distribution. The formula holds for every PEL datum of type (A) or (C), in particular for the compact unitary data of Caraiani–Scholze 2017 §5.1 (any rank, any signature) and the quasi-split unitary datum of the non-compact sequel.

The precise hypotheses are: unramified integral PEL datum of type (A) or (C) at p; K_p hyperspecial; φ acceptable.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), Theorem 1.1 (= Theorem 7.2), pp. 2 and 27; Remark 7.3). Proves the stable trace formula for Igusa varieties for acceptable test functions.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Theorem 5.2.3 and Remark 5.2.4, p. 734). Restates it and notes that it holds for every PEL datum of type (A) or (C).

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.3, Theorem 5.3.2, p. 68). Restates it for the non-compact sequel's quasi-split unitary datum.

Start from the counting formula ET.5/igusa-counting-formula.

Stabilise away from p and ∞ (ET.5/stabilization-away-from-p) and at p (ET.5/transfer-at-p), then sum over κ and endoscopic triples with the global product formula of ET.0/global-kottwitz-obstruction (c) (Shin 2010 §7, Lemma 7.1).

Collect the Tamagawa numbers and |Out| into ι(G,H) with ET.4/tamagawa-number-formula and the ker^1 factor from Kottwitz's formula (Shin 2010 Theorem 7.2).

**Acceptance.**

- If G has no non-trivial elliptic endoscopy and b is basic, the formula reads tr(φ | H_c(Ig_b)) = |ker^1(ℚ,G)| ι(G,G) ST^G_e(φ^G).
- For φ = 0 both sides vanish.
- The numbering coincidence with Kottwitz 1990 Theorem 7.2 is accidental; the Igusa formula is the analogue of Kottwitz's stable formula for Shimura varieties (Remark 7.3).

*Used by:* `ET.5/unitary-igusa-trace-formula`; `ET.5/acceptance-examples`.

*Needs:* `ET.5/igusa-counting-formula`; `ET.5/stabilization-away-from-p`; `ET.5/transfer-at-p`; `ET.5/igusa-endoscopic-test-function`; `ET.4/stable-elliptic-distribution`; `ET.4/elliptic-stabilization`; `ET.4/tamagawa-number-formula`; `ET.0/global-kottwitz-obstruction`.

### ET.5.12 Acceptable functions determine virtual representations

Node `ET.5/acceptable-functions-determine` (theorem).

If Π_1, Π_2 ∈ Groth(G(𝔸_f^p) × J_b(ℚ_p)) satisfy tr Π_1(φ) = tr Π_2(φ) for every acceptable φ, then Π_1 = Π_2. Consequently a linear identity between traces proved for acceptable φ_p (such as ET.5/stable-igusa-trace-formula composed with a spectral expansion) extends to every φ_p ∈ C_c^∞(J_b(ℚ_p)) once both sides are expressed as finite combinations of traces of irreducible representations.

The precise hypotheses are: Π_1, Π_2 in the Grothendieck group of admissible representations.

([S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Lemma 6.4 and proof, p. 19). Proves that traces against acceptable functions determine elements of the Grothendieck group, by Frobenius twisting and linear independence.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.5, proof of Lemma 5.5.1, p. 743). Uses the lemma to remove acceptability; the Frobenius element twisted is a central element of J_b(ℚ_p) acting on φ_p.

Fix φ; only finitely many irreducible π_i contribute to tr Π_1(φ) or tr Π_2(φ).

Twist φ by powers t^z of the central element t = fr^s; for z ≫ 0 the twists are acceptable (ET.5/igusa-fixed-point-formula (c)), and tr π_i(φ^{(z)}) = χ_i(t)^z tr π_i(φ).

Linear independence of the characters z ↦ χ_i(t)^z on all large z gives equality for z = 0 (Shin 2009 Lemma 6.4).

**Acceptance.**

- If Π_1 and Π_2 differ by a representation on which t acts by a scalar, the twist argument detects it.
- The statement fails if 'acceptable' is replaced by a class not stable under central Frobenius twists.
- Trivial for Π_1 = Π_2.

*Needs:* `ET.5/igusa-fixed-point-formula`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`.

### ET.5.13 The stable Igusa formula for unitary similitude groups of every rank and signature

Node `ET.5/unitary-igusa-trace-formula` (application).

Let G be the unitary similitude group of Caraiani–Scholze 2017 §5.1 (rank N arbitrary, G_ℝ of arbitrary signature, quasi-split at all finite places, F^+ ≠ ℚ) or of the non-compact sequel §5.1 (G ≅ G_{2n} quasi-split, p split in F_0). Then E^ell(G) = E^ell(G_N) is represented by (G_N,1,id) and (G_{n_1,n_2}, s_{n_1,n_2}, η_{n_1,n_2}) with n_1 + n_2 = N, n_1 ≥ n_2 > 0, omitting (n_1,n_2) when n_1, n_2 and [F^+:ℚ] are all odd, and for acceptable φ = φ^S φ_{S_f∖p} φ_p, tr(φ | ι_ℓ [H_c(Ig^b, ℚ̄_ℓ)]) = |ker^1(ℚ,G)| Σ_{n⃗} ι(G, G_n⃗) ST^{G_n⃗}_e(φ^n⃗) with φ^n⃗ as in ET.5/igusa-endoscopic-test-function. Combined with ET.4/stable-twisted-identity this gives the twisted spectral expression of the Igusa trace used by ET.7b.

The precise hypotheses are: the unitary data stated; [F^+:ℚ] ≥ 2 for the twisted step.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Corollary 5.2.5 and Remark 5.2.6, pp. 734–735; §5.3, Theorem 5.3.2, pp. 737–738). Specialises Shin's formula to unitary groups of arbitrary signature and expresses it through twisted spectral sides.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.2, p. 67; §5.3, Theorem 5.3.2, p. 68; §5.6, Theorem 5.6.1, p. 75). Gives the endoscopic data with Kottwitz's exclusion and the twisted spectral expression for the non-compact datum.

Specialise ET.5/stable-igusa-trace-formula with the endoscopic data of ET.0/unitary-elliptic-endoscopic-data (Caraiani–Scholze 2017 Corollary 5.2.5 and Remark 5.2.6; non-compact Theorem 5.3.2).

For the spectral expression, BC-match φ^n⃗ with f^n⃗ and apply ET.4/stable-twisted-identity (Caraiani–Scholze 2017 Theorem 5.3.2; non-compact Theorem 5.6.1).

**Acceptance.**

- For N = 1 the formula is a statement about a zero-dimensional Igusa variety for a torus.
- For n_1 = n_2 the coefficient carries |Out| = 2.
- The excluded odd–odd–odd pairs contribute nothing.

*Needs:* `ET.5/stable-igusa-trace-formula`; `ET.0/unitary-elliptic-endoscopic-data`; `ET.4/stable-twisted-identity`; `IgusaVarietiesAndTorsionConcentration:IG.0/quasi-split-unitary-datum`.

### ET.5.14 Worked checks for the Igusa counting and stabilisation

Node `ET.5/acceptance-examples` (application).

(1) GL_2, b basic: J_b = D^× for the quaternion division algebra D over ℚ_p; Ig_b is zero-dimensional and its points are a D^×(ℚ_p)×G(𝔸_f^p)-set; the stable formula has only the term of G, with h^G_p the Jacquet–Langlands transfer of φ_p with sign −1 (ET.6/local-jacquet-langlands). (2) μ-ordinary b: J_b ≅ M_b is a torus for GL_2-type data, every element with separated valuations is acceptable, c_{M_H} = 1 (Shin 2010 §8.2). (3) Non-example: the constant test function 1_{J_b(ℤ_p)} is not acceptable when b has two slopes, and its Lefschetz number on the open Igusa variety is not given by the naive fixed-point count; a large central Frobenius twist repairs this. (4) The ker^1 factor equals 1 for the unitary similitude groups whose n_i are all even (Shin 2011 Remark 3.2).

The precise hypotheses are: the data of the cited nodes.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §8.1–8.2, pp. 27–28). Computes the constant c_{M_H} for general linear groups and when J_b ≅ M_b.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Remark 3.2, p. 14). Records when ker^1 is trivial for G_n⃗.

Each check is a direct specialisation.

**Acceptance.**

- A wrong sign at p in (1), a missing constant in (2) or a naive Lefschetz formula in (3) would each be detected.

*Needs:* `ET.5/stable-igusa-trace-formula`; `ET.5/transfer-at-p`; `ET.5/igusa-fixed-point-formula`; `ET.4/tamagawa-number-formula`.

## Layer ET.6: Classical local GL_m and inner-form comparison

The representation theory of GL_n comes first: segments, the Zelevinsky and Langlands classifications, the multisegment operations of Atobe–Kondo–Yasuda, Tadić's unitary dual and the Weil–Deligne parameter of a segment. Scholze's construction follows: deformation spaces of one-dimensional ϖ-divisible O-modules with Drinfeld level structure, the test functions φ_{τ,h} defined by nearby cycles, the norm maps that turn them into functions f_{τ,h} on GL_n(F), and their descent along parabolic induction. The global step realises essentially square-integrable representations in the cohomology of the division-algebra unitary Shimura varieties at Drinfeld level and counts points there. Scholze's characterization theorem, the comparison with the Lubin–Tate tower, bijectivity on supercuspidals (through ET.4b's cyclic base change), Harris's non-Galois automorphic induction and the compatibility with L- and ε-factors of pairs then give the semisimple correspondence, and the segments supply the monodromy for the full Weil–Deligne correspondence. The layer ends with Jacquet–Langlands, Badulescu's Langlands–Jacquet map and the non-transfer obstruction used by the Igusa computations.

### ET.6.1 Segments of cuspidal representations and their linking

Node `ET.6/cuspidal-segment` (definition).

Let F be a non-archimedean local field of characteristic 0 and ν = |det| the unramified character of every GL_d(F). Let C be the set of isomorphism classes of irreducible supercuspidal representations of the groups GL_d(F), d ≥ 1. A segment is a finite set Δ = [ρ, ν^{k−1}ρ] = {ρ, νρ, …, ν^{k−1}ρ} ⊂ C with ρ ∈ C and k ≥ 1; its length is k, its degree kd, its beginning ρ and its end ν^{k−1}ρ. In the real-endpoint convention of Atobe–Kondo–Yasuda, [a,b]_ρ with b − a ∈ ℤ_{≥0} denotes {ν^a ρ, …, ν^b ρ}, presentations differing by an unramified twist that fixes ρ being identified. Two segments Δ_1, Δ_2 are linked if Δ_1 ∪ Δ_2 is a segment and neither contains the other; if they are linked, Δ_1 precedes Δ_2 if the beginning of Δ_2 is ν^j times the beginning of Δ_1 with j > 0; they are juxtaposed if Δ_1 ∩ Δ_2 = ∅ and Δ_1 ∪ Δ_2 is a segment. A multisegment is a finite multiset of segments; its degree is the sum of the degrees.

The precise hypotheses are: F of characteristic 0 (the definitions make sense in general; the layer uses characteristic 0); ρ supercuspidal (SmoothRepresentationsOfLocalGroups:SR.3a/cuspidal-representations).

([A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), §3 (pp. 180–183) and §4.1 (p. 184)). Defines segments of cuspidal representations and the relations linked and precedes.

([H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/journals/forum-of-mathematics-pi), §2.1, pp. 5–6). Uses segments [a,b]_ρ with real endpoints and integral endpoints on type-χ lines, and the same linkedness and precedence.

The definitions are Zelevinsky 1980 §3 (segments) and §4.1 (linked, precedes); the real-endpoint presentation is that of Atobe–Kondo–Yasuda §2.1, whose type-χ lines use integral endpoints.

The definition exposes the following operations and relations.

- `Segment` (constructor): Segment.mk ρ k : the segment [ρ, ν^{k−1}ρ] for ρ supercuspidal and k ≥ 1.
- `Segment.length` (projection): The number k of cuspidals in the segment.
- `Segment.beginning` (projection): The cuspidal ρ at the start; Segment.ending is ν^{k−1}ρ.
- `Segment.Linked` (relation): Δ_1 ∪ Δ_2 is a segment and neither contains the other.
- `Segment.Precedes` (relation): Linked and beginning(Δ_2) = ν^j beginning(Δ_1) with j > 0.
- `Segment.twist` (functoriality): (χ ⊗ Δ) = {χρ, …} for a character χ; twisting preserves linking.
- `Multisegment` (constructor): Finite multisets of segments, with degree the sum of degrees.

**Checks.**

- `Segment.linked_example` (computation): [1, ν] and [ν, ν²] on GL_1 are linked and [1,ν] precedes [ν,ν²].
- `Segment.length_one` (degenerate): A segment of length 1 is linked to {νρ} and {ν^{-1}ρ} and to no other segment of length 1.
- `Segment.containment_not_linked` (non-example): [1, ν²] and [ν] are not linked although their union is a segment.
- `Segment.precedes_irrefl` (characterisation): No segment precedes itself and precedence is asymmetric.

**Acceptance.**

- {ρ} is a segment of length 1 for every ρ ∈ C.
- [1, ν] and [ν, ν²] (characters of GL_1) are linked and the first precedes the second; [1] and [ν] are juxtaposed and linked; [1, ν²] and [ν] are not linked (one contains the other).
- Segments built on cuspidals ρ, ρ′ not on the same line ρ′ ∉ {ν^j ρ} are never linked.

*Used by:* Zelevinsky 1980 Theorems 4.2, 6.1, 9.7 (classification and irreducibility criteria are phrased by linkedness); Scholze 2010 §3 (Lemma 3.1) (the Langlands quotient ⊞π_0[(t+1)/2 − i] uses Bernstein–Zelevinsky precedence); ET.6/segment-wd-parameter (each segment determines a Weil–Deligne block σ ⊗ Sp_k); `ET.6/segment-representations`; `ET.6/multisegment-operations`; `ET.6/segment-wd-parameter`.

*Needs:* `SmoothRepresentationsOfLocalGroups:SR.3a/cuspidal-representations`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-character`; `SmoothRepresentationsOfLocalGroups:SR.3/unramified-characters`.

### ET.6.2 Representations attached to segments: Zelevinsky, Steinberg and Speh representations

Node `ET.6/segment-representations` (construction).

For a segment Δ = [ρ, ν^{k−1}ρ] with ρ a supercuspidal representation of GL_d(F), the normalised parabolic induction ρ × νρ × … × ν^{k−1}ρ of GL_{kd}(F) has a unique irreducible subrepresentation Z(Δ) = ⟨Δ⟩ and a unique irreducible quotient L(Δ). L(Δ) is essentially square-integrable, and every essentially square-integrable irreducible representation of GL_n(F) is L(Δ) for a unique segment (Bernstein). For ρ = χ a character of GL_1, Z([χ, ν^{k−1}χ]) is the character χν^{(k−1)/2}∘det and L([χ, ν^{k−1}χ]) is the twisted Steinberg representation St_k(χν^{(k−1)/2}). For an irreducible tempered π of GL_n(F) and m ≥ 1, the Speh representation Sp(π, m) is the unique irreducible subrepresentation of π ν^{−(m−1)/2} × … × π ν^{(m−1)/2}; for π = L(Δ) square-integrable and unitary it is Tadić's u(π, m), the unique irreducible quotient of ν^{(m−1)/2}π × … × ν^{−(m−1)/2}π.

The precise hypotheses are: ρ supercuspidal; normalised parabolic induction of SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction.

([A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), §3, Theorem 3.5 (p. 182); §9, Theorem 9.3 (p. 198)). Constructs ⟨Δ⟩ as the unique irreducible submodule, computes its derivatives, and identifies the quasi-square-integrable representations with segment representations (Bernstein's theorem).

([M. Tadić, Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf), §7, Definition 7.4, p. 371). Defines u(δ, n) as the unique irreducible quotient of the twisted product of n copies of δ.

([H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/journals/forum-of-mathematics-pi), Example 2.5(4) and §8.2). Defines the tempered Speh representation Sp(π, m) as a unique irreducible subrepresentation.

Uniqueness of sub and quotient: Zelevinsky 1980 §3 and Proposition 2.10 (multiplicity-free support); the exactly-one-derivative property ⟨Δ⟩^{(k)} = ⟨Δ^−⟩ is Theorem 3.5.

Essential square-integrability of L(Δ) and the converse: Zelevinsky 1980 Theorem 9.3 (Bernstein), proved by Casselman's criterion on exponents (SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion).

Steinberg case: SmoothRepresentationsOfLocalGroups:SR.3/steinberg; Speh representations: Tadić 1986 Definition 7.4 and Atobe–Kondo–Yasuda Example 2.5(4).

The definition exposes the following operations and relations.

- `Segment.zelevinskyRep` (constructor): Z(Δ), the unique irreducible subrepresentation of ρ × νρ × … × ν^{k−1}ρ.
- `Segment.langlandsRep` (constructor): L(Δ), the unique irreducible quotient of the same induced representation.
- `Segment.langlandsRep_essSqInt` (characterisation): L(Δ) is essentially square-integrable.
- `Segment.langlandsRep_surj` (characterisation): Every essentially square-integrable irreducible representation of GL_n(F) is L(Δ) for a unique Δ.
- `Segment.zelevinskyRep_derivative` (simp): The highest derivative of Z(Δ) is Z(Δ^−), Δ^− = [ρ, ν^{k−2}ρ].
- `Segment.langlandsRep_twist` (functoriality): L(χ ⊗ Δ) ≅ (χ∘det) ⊗ L(Δ).
- `speh` (constructor): Sp(π, m) for π irreducible tempered.
- `speh_one` (simp): Sp(π, 1) = π.

**Checks.**

- `Segment.langlandsRep_steinberg` (compatibility): L([ν^{-1/2}, ν^{1/2}]) is the Steinberg representation of SmoothRepresentationsOfLocalGroups:SR.3/steinberg.
- `Segment.zelevinskyRep_trivial` (computation): Z([ν^{-1/2}, ν^{1/2}]) is the trivial representation of GL_2(F).
- `Segment.length_one_reps` (degenerate): For k = 1 both representations are ρ.
- `Segment.zelevinsky_not_square_integrable` (non-example): Z(Δ) is not square-integrable for k ≥ 2 and d = 1: the trivial character of GL_2(F) has no square-integrable twist.

**Acceptance.**

- For k = 1, Z(Δ) = L(Δ) = ρ.
- For Δ = [ν^{-1/2}, ν^{1/2}] on GL_1, Z(Δ) is the trivial character of GL_2(F) and L(Δ) the Steinberg representation.
- Sp(π, 1) = π.

*Used by:* Scholze 2010 Theorem 10.2 (existence of rec for essentially square-integrable and generalized Speh representations is proved globally first); ET.6/segment-wd-parameter (L(Δ) corresponds to the Weil–Deligne block rec(ρ) ⊗ Sp_k); ET.7a/speh-representation (ET.6a packet) (the global Speh datum is built from local Speh representations); `ET.6/zelevinsky-classification`; `ET.6/tadic-unitary-dual`; `ET.6/global-galois-input`; `ET.6/local-jacquet-langlands`.

*Needs:* `ET.6/cuspidal-segment`; `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`; `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`; `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`; `SmoothRepresentationsOfLocalGroups:SR.3/steinberg`; `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`.

### ET.6.3 Zelevinsky and Langlands classifications of irreducible representations of GL_n ★

Node `ET.6/zelevinsky-classification` (theorem). Planet: *Zelevinsky classification*.

(a) If Δ_1, …, Δ_r are segments ordered so that Δ_i does not precede Δ_j for i < j, then Z(Δ_1) × … × Z(Δ_r) has a unique irreducible subrepresentation Z(m), depending only on the multisegment m = {Δ_1, …, Δ_r}, and L(Δ_1) × … × L(Δ_r) has a unique irreducible quotient L(m); m ↦ Z(m) and m ↦ L(m) are bijections from multisegments of degree n to irreducible representations of GL_n(F). (b) Z(Δ_1) × … × Z(Δ_r) is irreducible iff no two Δ_i are linked; the same for the L(Δ_i). (c) Every irreducible generic representation is L(Δ_1) × … × L(Δ_r) with pairwise unlinked segments, the multiset being unique; such products are generic. (d) Z(m)^∨ = Z(m^∨) with m^∨ the multisegment of contragredient segments; the highest derivative of Z(m) is Z(m^−), m^− obtained by truncating each segment at its end; Z(m_1 + … + m_p) occurs with multiplicity one in Z(m_1) × … × Z(m_p). (e) There is an involution m ↦ m^# (Zelevinsky's involution, computed by the Mœglin–Waldspurger algorithm) with L(m) = Z(m^#). (f) The cuspidal support of Z(m) and of L(m) is the multiset union of the segments; L(m) is the Langlands quotient of SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification with essentially square-integrable data L(Δ_i).

The precise hypotheses are: F non-archimedean of characteristic 0; representations irreducible and smooth (hence admissible).

([A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), Theorem 6.1 (pp. 188–189), Theorem 4.2 (p. 184), Theorem 7.10 (p. 194), Theorem 8.1 and Proposition 8.4 (pp. 195–196), Theorem 9.7 and §9 (pp. 199–203)). Classifies irreducible representations of GL_n by multisegments, gives the irreducibility criterion, contragredients, highest derivatives and multiplicity one, the generic representations and the involution.

([H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/journals/forum-of-mathematics-pi), §2.1). Records the Zelevinsky and Langlands conventions Z(m), L(m) and L(m) = Z(m^#) used for newforms.

Zelevinsky 1980 Theorem 6.1 for (a) (with the homogeneity Theorem 6.2 and Corollary 6.8), Theorem 4.2 for (b), Theorem 9.7 for (c), Theorem 7.10 and Theorem 8.1 and Proposition 8.4 for (d), §9 (the involution) for (e).

Derivatives are the mirabolic functors of SmoothRepresentationsOfLocalGroups:SR.5/mirabolic-derivatives; Jacquet modules and the geometric lemma (SR.2/geometric-lemma) compute the composition factors.

Compatibility with the general Langlands classification: identify the tempered data with products of unitary L(Δ) and the exponents with the segment centres.

**Acceptance.**

- For n = 2 and ρ = 1: the multisegments of degree 2 supported on {ν^{-1/2}, ν^{1/2}} are {[ν^{-1/2},ν^{1/2}]} and {[ν^{-1/2}],[ν^{1/2}]}; Z gives the trivial and the Steinberg representation respectively (for the second, order the segments as [ν^{1/2}], [ν^{-1/2}] so that no segment precedes one listed after it), while L gives Steinberg and the trivial representation.
- (b) for two characters χ_1, χ_2 of GL_1: χ_1 × χ_2 is irreducible iff χ_1χ_2^{-1} ≠ ν^{±1}.
- The involution # exchanges trivial and Steinberg for GL_2.

*Used by:* `ET.6/multisegment-operations`; `ET.6/ladder-and-constituent-theorems`; `ET.6/tadic-unitary-dual`; `ET.6/test-function-descent`; `ET.6/scholze-local-langlands`; `ET.6/full-wd-local-langlands`; `ET.6/badulescu-langlands-jacquet-map`; `ET.6/acceptance-examples`.

*Needs:* `ET.6/segment-representations`; `SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification`; `SmoothRepresentationsOfLocalGroups:SR.5/mirabolic-derivatives`; `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`; `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-support`; `SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`.

### ET.6.4 Truncation, the ram operation and ladder multisegments

Node `ET.6/multisegment-operations` (definition).

For a segment Δ = [a, b]_ρ let Δ^− = [a, b − 1]_ρ (empty if a = b), and for a multisegment m let m^− = Σ_{Δ ∈ m} Δ^− (empty segments removed). On unipotent multisegments (ρ unramified characters of GL_1) define m^ram = ((m^#)^−)^#. A type-χ line is the set of unramified twists χν^j, j ∈ ℤ, of an unramified character χ, and a type-χ multisegment [x_1, y_1]_χ + … + [x_t, y_t]_χ is a ladder if x_1 > … > x_t and y_1 > … > y_t.

The precise hypotheses are: χ unramified for ladders and for the ram operation.

([H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/journals/forum-of-mathematics-pi), §§2.3–2.4, Example 2.5(2), §6.1). Defines right truncation, the ram operation on unipotent multisegments and ladder multisegments on a type-χ line.

([A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), Theorem 8.1, p. 195). Identifies the highest derivative of Z(m) with Z(m^−).

The definitions are Atobe–Kondo–Yasuda §§2.3–2.4 and Example 2.5(2), §6.1; Zelevinsky's m^− is the multisegment of the highest derivative (Zelevinsky 1980 Theorem 8.1).

The definition exposes the following operations and relations.

- `Segment.truncate` (constructor): Δ^− = [a, b−1]_ρ.
- `Multisegment.truncate` (constructor): m^− = Σ Δ^−.
- `Multisegment.ram` (constructor): m^ram = ((m^#)^−)^# on unipotent multisegments.
- `Multisegment.IsLadder` (constructor): Strictly decreasing beginnings and ends on a type-χ line.
- `Multisegment.truncate_degree` (simp): deg(m^−) = deg(m) − Σ_{Δ ∈ m} deg ρ_Δ.
- `Multisegment.highestDerivative` (compatibility): Z(m)^{(max)} = Z(m^−).

**Checks.**

- `Multisegment.truncate_singleton` (degenerate): {[a,a]_ρ}^− is the empty multisegment.
- `Multisegment.IsLadder_example` (computation): {[1,2]_χ, [0,1]_χ} is a ladder.
- `Multisegment.IsLadder_non` (non-example): {[0,2]_χ, [1,1]_χ} is not a ladder.
- `Multisegment.ram_steinberg` (computation): For m^# = {[0,1]_χ} (so L(m) is a twist of Steinberg), m^ram = ({[0,0]_χ})^#.

**Acceptance.**

- {[0,0]_χ}^− is empty.
- {[1,2]_χ, [0,1]_χ} is a ladder.
- {[0,2]_χ, [1,1]_χ} is not a ladder (y_1 = 2 > y_2 = 1 but x_1 = 0 < x_2 = 1).

*Used by:* Atobe–Kondo–Yasuda Lemma 2.9 (π^ram corresponds to the Weil–Deligne quotient V/(V^I ∩ ker N)); Atobe–Kondo–Yasuda §6 (ladder determinantal formulas and constituent criteria compute newform dimensions); `ET.6/ladder-and-constituent-theorems`.

*Needs:* `ET.6/zelevinsky-classification`; `ET.6/cuspidal-segment`.

### ET.6.5 Ladder determinantal formula and constituent criteria

Node `ET.6/ladder-and-constituent-theorems` (theorem).

(a) (Ladder formula, Lapid–Mínguez as used by Atobe–Kondo–Yasuda) For a type-χ ladder [x_1,y_1] + … + [x_t,y_t], in the Grothendieck group Z(m) = Σ_{w ∈ S_t} sgn(w) Z([x_{w(1)}, y_1]_χ) × … × Z([x_{w(t)}, y_t]_χ), empty segments giving the trivial representation of GL_0 and segments of negative length giving 0. (b) (Multiplicity one) Z(m_1 + m_2) occurs with multiplicity one in Z(m_1) × Z(m_2). (c) (Truncated constituent criterion, degree-one form) For type-χ multisegments, if Z(m) occurs in Z(m_1) × Z(m_2) then Z(m^−) occurs in Z(m_1^−) × Z(m_2^−) iff |m| = |m_1| + |m_2| (cardinalities). (d) (Weil–Deligne interpretation of ram) For π unipotent irreducible with Weil–Deligne parameter (V, N) under ET.6/full-wd-local-langlands (geometric Frobenius), π^ram = Z(m^ram) corresponds to the quotient V/(V^I ∩ ker N).

The precise hypotheses are: type-χ (unramified, degree-one) multisegments in (a), (c), (d); general multisegments in (b).

([H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/journals/forum-of-mathematics-pi), §6.1 (proof of Proposition 6.1), Lemmas 6.5–6.6, Lemma 2.9). States the ladder determinantal formula, the multiplicity-one and truncated constituent lemmas, and the Weil–Deligne meaning of ram.

([A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), Proposition 8.4, p. 196). Proves multiplicity one of Z(m_1 + … + m_p) in the product.

(a): Atobe–Kondo–Yasuda §6.1, proof of Proposition 6.1, citing Lapid–Mínguez.

(b): Zelevinsky 1980 Proposition 8.4 (and Atobe–Kondo–Yasuda Lemma 6.5).

(c): Atobe–Kondo–Yasuda Lemma 6.6 via highest derivatives (ET.6/zelevinsky-classification (d)); only the degree-one form is used, because the printed proof for general cuspidal degree needs degree-weighted cardinalities (recorded in gap 'Truncated constituent criterion beyond degree one').

(d): Atobe–Kondo–Yasuda Lemma 2.9, from the description of rec on segments (ET.6/segment-wd-parameter).

**Acceptance.**

- For t = 1 (a) is the identity Z([x,y]) = Z([x,y]).
- For m_1 = m_2 = {[0,0]_χ}, Z({[0,0],[0,0]}) occurs once in χ × χ.
- For the Steinberg representation V = Sp_2, V^I ∩ ker N is the line of the highest-weight vector and the quotient is one-dimensional.

*Needs:* `ET.6/multisegment-operations`; `ET.6/zelevinsky-classification`; `ET.6/segment-wd-parameter`.

### ET.6.6 Tadić's classification of the unitary dual and the generic unitary representations

Node `ET.6/tadic-unitary-dual` (theorem).

Let D^u be the set of unitary square-integrable irreducible representations of the GL_m(F), m ≥ 1, and B = {u(δ, n), ν^α u(δ, n) × ν^{−α} u(δ, n) : δ ∈ D^u, n ≥ 1, 0 < α < ½}. (a) Every product of elements of B is irreducible and unitary. (b) Every irreducible unitary representation of GL_n(F) is such a product, uniquely up to order. (c) In particular every irreducible generic unitary representation is irreducibly induced from τ_1 ν^{α_1} ⊗ … ⊗ τ_d ν^{α_d} ⊗ τ_0 ⊗ τ_d ν^{−α_d} ⊗ … ⊗ τ_1 ν^{−α_1} with τ_i unitary generic tempered and ½ > α_1 > … > α_d > 0 (the complementary-series exponents lie in (0, ½)), and a conjugate self-dual generic unitary representation of GL_a over a quadratic extension has this form with τ_i^* in the second half.

The precise hypotheses are: F non-archimedean of characteristic 0 (Tadić's Theorem A.10 is stated for characteristic 0).

([M. Tadić, Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf), Introduction Theorems A–D (p. 339); §7, Theorems 7.1, 7.3, 7.5 and Definition 7.4 (pp. 369–371); Theorem A.10 (p. 378)). Classifies the irreducible unitary representations of GL(n) over a non-archimedean field as products of Speh representations and complementary series with exponents in (0, ½).

Tadić 1986 Theorems 7.1, 7.3 and 7.5 (pp. 369–371) and Theorem A.10 (p. 378), using Bernstein's irreducibility of unitary parabolic induction and the Zelevinsky classification (ET.6/zelevinsky-classification).

(c): restrict to generic members, where by ET.6/zelevinsky-classification (c) only n = 1 occurs in u(δ, n); this is the form used in Jiang–Zhang 2020 Appendix B, (B.5)–(B.6).

**Acceptance.**

- For GL_1 the unitary dual is the unitary characters (n = 1, no complementary series).
- For GL_2, ν^α × ν^{−α} is unitary for 0 < α < ½ and not for α > ½ (except the endpoints giving one-dimensional and Steinberg constituents).
- The trivial representation of GL_2 is u(1, 2).

*Used by:* `ET.6/acceptance-examples`.

*Needs:* `ET.6/zelevinsky-classification`; `ET.6/segment-representations`; `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`.

### ET.6.7 Weil–Deligne parameters of segments and multisegments

Node `ET.6/segment-wd-parameter` (construction).

Use the Weil–Deligne representations of ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation over ℂ (or ℚ̄_ℓ via a fixed isomorphism), with |·| : W_F → ℝ_{>0} sending geometric Frobenius to q^{−1}. For k ≥ 1 let Sp_k = ⊕_{i=0}^{k−1} ℂ e_i with r(w)e_i = |w|^i e_i and N e_i = e_{i+1} (N e_{k−1} = 0); then r(w) N r(w)^{-1} = |w| N, N is a single Jordan block, and Sp_k is indecomposable and Frobenius-semisimple. For an irreducible representation σ of W_F, σ ⊗ Sp_k is indecomposable; every Frobenius-semisimple Weil–Deligne representation is uniquely a direct sum of such blocks (ArithmeticGaloisRepresentations:R01.2/frobenius-semisimple-special-block-classification). Given a bijection σ_0 : {supercuspidals of GL_d(F)} → {irreducible d-dimensional representations of W_F} (ET.6/supercuspidal-bijection), attach to a segment Δ = [ρ, ν^{k−1}ρ] the block WD(Δ) = σ_0(ρ) ⊗ Sp_k, and to a multisegment m the sum WD(m) = ⊕_{Δ∈m} WD(Δ). Then m ↦ WD(m) is a bijection from multisegments of degree n to n-dimensional Frobenius-semisimple Weil–Deligne representations, WD(m)^{ss} restricted to W_F is ⊕_{ρ ∈ supp(m)} σ_0(ρ) (with σ_0(ν^j ρ) = σ_0(ρ)|·|^j), and the monodromy operator of WD(m) is nilpotent with Jordan type given by the segment lengths.

The precise hypotheses are: σ_0 compatible with twists by characters: σ_0(χρ) = σ_0(ρ) ⊗ rec_1(χ) (ET.6/llc-characterizing-properties).

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, footnotes 1–2, p. 2; Theorem 1.2(b), p. 3). Works with the Weil-group (semisimple) part of the parameter, ignores the monodromy operator, and proves compatibility with parabolic induction, which determines the semisimplification of WD(m).

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.1, Remark 5.1.1, p. 65). Defines the semisimple parameter of a Frobenius-semisimple Weil–Deligne representation by restriction along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})).

([A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), §10, pp. 204–206). Describes the conjectural reciprocity law as a bijection between irreducible representations and pairs (σ, N), with segments corresponding to indecomposable objects T(Δ).

Compute r(w)Ne_i = |w|^{i+1}e_{i+1} = |w| N r(w) e_i to get the covariance.

Indecomposability and the block decomposition are R01.2/frobenius-semisimple-special-block-classification and R01.2/unnormalised-special-object.

Bijectivity: blocks σ ⊗ Sp_k with σ irreducible correspond to segments [σ_0^{-1}(σ), …] of length k, and multisets of blocks to multisegments.

The definition exposes the following operations and relations.

- `specialWD` (constructor): Sp_k with r(w)e_i = |w|^i e_i and Ne_i = e_{i+1}.
- `specialWD_comm` (relation): r(w) N r(w)^{-1} = |w| N on Sp_k.
- `specialWD_indecomposable` (characterisation): σ ⊗ Sp_k is indecomposable for σ irreducible.
- `segmentWD` (constructor): WD(Δ) = σ_0(ρ) ⊗ Sp_k.
- `multisegmentWD` (constructor): WD(m) = ⊕_{Δ∈m} WD(Δ).
- `multisegmentWD_bijective` (equivalence): m ↦ WD(m) is a bijection onto n-dimensional Frobenius-semisimple Weil–Deligne representations.
- `multisegmentWD_ss` (simp): The Weil-group semisimplification of WD(m) is ⊕_{ρ∈supp m} σ_0(ρ).
- `multisegmentWD_twist` (functoriality): WD(χ ⊗ m) = WD(m) ⊗ rec_1(χ).

**Checks.**

- `specialWD_two` (computation): Sp_2 has N of rank 1 and r(Frob) = diag(1, q^{-1}) for geometric Frobenius.
- `segmentWD_length_one` (degenerate): WD({ρ}) = σ_0(ρ) with N = 0.
- `multisegmentWD_same_support` (non-example): {[1,ν]} and {[1],[ν]} have equal semisimplifications but WD differ (N ≠ 0 versus N = 0): a definition through semisimplified parameters alone is not injective.
- `specialWD_compat` (compatibility): Sp_k is the special object of ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object.

**Acceptance.**

- WD([χ]) = rec_1(χ) with N = 0.
- WD([ν^{-1/2}, ν^{1/2}]) = rec_1(ν^{-1/2}) ⊗ Sp_2 has N ≠ 0 of rank 1.
- Two different multisegments with the same support (e.g. {[1,ν]} and {[1],[ν]}) have the same semisimplification but different N.

*Used by:* ET.6/full-wd-local-langlands (assembles rec_F from the supercuspidal bijection and the Langlands classification); Atobe–Kondo–Yasuda Lemma 2.9 (π^ram corresponds to V/(V^I ∩ ker N)); ET.6a/fs-normalization-contract (ET.6a packet) (the action dictionary needs the Weil–Deligne normalisation fixed here); `ET.6/ladder-and-constituent-theorems`; `ET.6/full-wd-local-langlands`.

*Needs:* `ET.6/cuspidal-segment`; `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`; `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimple-special-block-classification`; `ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object`; `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

### ET.6.8 Functorial extensions of local class field theory and Henniart's characterization

Node `ET.6/llc-characterizing-properties` (definition).

A family of maps, one for each finite extension F/ℚ_p and each n ≥ 1, π ↦ σ_F(π) from irreducible smooth representations of GL_n(F) to n-dimensional semisimple representations of W_F, is a functorial extension of class field theory if: (i) for n = 1, σ_F(χ) = χ ∘ Art_F^{-1} with Art_F sending uniformizers to geometric Frobenius; (ii) σ_F is compatible with twists: σ_F(π ⊗ (χ∘det)) = σ_F(π) ⊗ σ_F(χ); (iii) det σ_F(π) = σ_F(ω_π) for the central character ω_π; (iv) σ_F(π^∨) = σ_F(π)^∨; (v) if π is a subquotient of the normalised parabolic induction of π_1 ⊗ … ⊗ π_t then σ_F(π) = ⊕ σ_F(π_i); (vi) compatibility with cyclic base change: if E/F is cyclic of prime degree and Π is the base-change lift of π (ET.4/local-cyclic-base-change), then σ_E(Π) = σ_F(π)|_{W_E}. Henniart's characterization: there is at most one family of bijections on supercuspidals that satisfies (i)–(iv) and preserves L- and ε-factors of pairs, L(s, π_1 × π_2) = L(s, σ(π_1) ⊗ σ(π_2)) and ε(s, π_1 × π_2, ψ) = ε(s, σ(π_1) ⊗ σ(π_2), ψ).

The precise hypotheses are: F a finite extension of ℚ_p; Art_F normalised by geometric Frobenius.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, Theorem 12.1 and Definition 12.2, pp. 30–31). Lists the functorial properties of π ↦ σ(π) and defines a functorial extension of class field theory.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, p. 2). Recalls Henniart's characterization of the correspondence by ε-factors of pairs.

The list is Scholze 2010 Theorem 12.1 and Definition 12.2; the uniqueness statement is Henniart's (cited by Scholze, p. 2), with the local factors of pairs of AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor and ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor.

The definition exposes the following operations and relations.

- `IsFunctorialExtensionCFT` (constructor): The conjunction of (i)–(vi) for a family σ_F.
- `IsFunctorialExtensionCFT.degree_one` (simp): σ_F(χ) = χ ∘ Art_F^{-1} for n = 1.
- `IsFunctorialExtensionCFT.twist` (relation): σ_F(π ⊗ χ) = σ_F(π) ⊗ σ_F(χ).
- `IsFunctorialExtensionCFT.det` (relation): det σ_F(π) = σ_F(ω_π).
- `IsFunctorialExtensionCFT.dual` (relation): σ_F(π^∨) = σ_F(π)^∨.
- `IsFunctorialExtensionCFT.induction` (relation): σ_F is additive along parabolic induction.
- `IsFunctorialExtensionCFT.baseChange` (relation): σ_E(BC(π)) = σ_F(π)|_{W_E}.
- `henniart_uniqueness` (characterisation): At most one family of bijections on supercuspidals with (i)–(iv) and equality of L and ε of pairs.

**Checks.**

- `IsFunctorialExtensionCFT.gl1` (computation): For n = 1 the unique family is local class field theory with geometric Frobenius normalisation.
- `IsFunctorialExtensionCFT.arithmetic_frobenius` (non-example): Normalising Art_F by arithmetic Frobenius gives a family violating (i) as stated (it is the contragredient family).
- `IsFunctorialExtensionCFT.unramified` (compatibility): On unramified principal series the family gives the sum of the unramified characters with the Satake parameters of SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter.
- `IsFunctorialExtensionCFT.steinberg_ss` (degenerate): σ_F(St_2) = 1 ⊕ |·| up to the twist convention, the semisimplification of Sp_2.

**Acceptance.**

- For n = 1 the properties reduce to local class field theory.
- The map π ↦ (⊕ of central characters) satisfies (i), (iii), (v) for n = 1 only.
- A family satisfying (i)–(v) but not (vi) is not a functorial extension in this sense.

*Used by:* Scholze 2010 Theorem 12.3 (any functorial extension of class field theory is bijective on supercuspidals); ET.6/full-wd-local-langlands (the uniqueness of the correspondence); Atobe–Kondo–Yasuda Lemma 2.9; Caraiani–Scholze non-compact §5.1 (consumers rely on these normalisations); `ET.6/supercuspidal-bijection`.

*Needs:* `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`; `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`; `ET.4/local-cyclic-base-change`; `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`.

### ET.6.9 Deformation spaces of one-dimensional ϖ-divisible O-modules with Drinfeld level structure

Node `ET.6/drinfeld-level-deformation-spaces` (construction).

Let F/ℚ_p be finite with ring of integers O, uniformizer ϖ and residue field 𝔽_q, F_r the unramified extension of degree r with ring O_r, and ŎF the completion of the maximal unramified extension. A ϖ-divisible O-module over a scheme S on which p is locally nilpotent is a p-divisible group H with an O-action whose two induced actions on Lie H agree. For β ∈ GL_n(O_r) diag(ϖ, 1, …, 1) GL_n(O_r), let H_β be the one-dimensional ϖ-divisible O-module of height n over 𝔽_{q^r} determined by β (its Dieudonné module has Frobenius given by β). (a) The formal deformation space R_β of H_β (as ϖ-divisible O-module) is formally smooth, isomorphic to O_r[[T_1, …, T_{n−1}]]. (b) For m ≥ 0 the covering R_{β,m} parametrising Drinfeld level-m structures (sections X_1, …, X_n of the universal deformation forming a full set of sections of its ϖ^m-torsion in Drinfeld's sense) is regular, finite over R_β and Galois with group GL_n(O/ϖ^m), étale in the generic fibre. (c) R_{β,m} algebraises: there is a separated flat scheme of finite type over O_r with smooth generic fibre and GL_n(O/ϖ^m)-action whose completion is R_{β,m}. (d) The nearby-cycle cohomology H^0(R^iψ Spf R_{β,m}, ℚ̄_ℓ) is a finite-dimensional continuous representation of W_{F_r} × GL_n(O/ϖ^m), zero outside 0 ≤ i ≤ n−1.

The precise hypotheses are: F of characteristic 0 (p-divisible groups do not exist in the equal-characteristic analogue with the same hypotheses); ℓ ≠ p; H_β one-dimensional of height n.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §2, Definitions 2.1–2.2, Proposition 2.3, Theorems 2.4–2.5, pp. 6–8). Defines ϖ-divisible O-modules, the deformation space R_β and its Drinfeld-level covers, proves their structure, algebraisation and the finiteness and vanishing range of nearby cycles.

(a),(b): Drinfeld's theory of level structures (Drinfeld 1974), as recalled in Scholze 2010 Definition 2.2 and Proposition 2.3; the deformation theory of p-divisible groups is that of FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2.

(c): Scholze 2010 Theorem 2.4, constructing ℛ_{β,m} from moduli of Drinfeld level structures.

(d): Scholze 2010 Theorem 2.5 (Berkovich's nearby cycles for formal schemes; ClassicalAdicEtaleCohomology:H1:formal-adic-comparison and LefschetzPencilsAndVanishingCycles:LPV.6), independence of ℓ by Mieda.

The definition exposes the following operations and relations.

- `DeformationSpace` (constructor): R_β, the deformation ring of H_β as a ϖ-divisible O-module.
- `DeformationSpace.formallySmooth` (characterisation): R_β ≅ O_r[[T_1, …, T_{n−1}]].
- `DrinfeldLevelCover` (constructor): R_{β,m}, parametrising Drinfeld level-ϖ^m structures.
- `DrinfeldLevelCover.regular` (characterisation): R_{β,m} is a regular local ring.
- `DrinfeldLevelCover.galois` (structure): R_{β,m}/R_β is finite Galois with group GL_n(O/ϖ^m), étale in the generic fibre.
- `DrinfeldLevelCover.transition` (functoriality): The transition maps R_{β,m} → R_{β,m+1} are finite flat and GL_n-equivariant.
- `DrinfeldLevelCover.algebraize` (other): An algebraic model of finite type over O_r with smooth generic fibre.
- `nearbyCycles_finite` (other): The nearby-cycle cohomology is finite-dimensional and vanishes outside degrees 0..n−1.

**Checks.**

- `DrinfeldLevelCover.height_one` (computation): For n = 1, R_{β,m} is the ring of integers of the level-m Lubin–Tate extension over F_r.
- `DrinfeldLevelCover.level_zero` (degenerate): R_{β,0} = R_β.
- `DrinfeldLevelCover.not_etale_special` (non-example): R_{β,m}/R_β is not étale over the closed point for m ≥ 1 (Drinfeld structures degenerate), although it is étale in the generic fibre.
- `DeformationSpace.dimension` (compatibility): R_β has Krull dimension n, i.e. relative dimension n − 1 over O_r, the dimension of the Lubin–Tate space.

**Acceptance.**

- For n = 1, R_β = O_r and R_{β,m} is the ring of integers of the Lubin–Tate extension of level m, of degree |(O/ϖ^m)^×|.
- For m = 0, R_{β,0} = R_β.
- The Galois group of R_{β,m}/R_β is GL_n(O/ϖ^m), not GL_n(O_r/ϖ^m).

*Used by:* Scholze 2010 Theorem 2.6 (the test function φ_{τ,h} is defined by traces on nearby cycles of R_{β,m}); ET.6a/lubin-tate-tower (ET.6a packet) (the Lubin–Tate tower's generic fibres are the rigid generic fibres of these spaces); Scholze 2010 Lemma 9.2 (completed local rings of the Shimura variety at Drinfeld level are these spaces); `ET.6/scholze-test-functions`; `ET.6/division-algebra-shimura-varieties`; `ET.6/lubin-tate-comparison`.

*Needs:* `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`; `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`; `LefschetzPencilsAndVanishingCycles:LPV.6`.

### ET.6.10 Scholze's test functions φ_{τ,h} and f_{τ,h} ★

Node `ET.6/scholze-test-functions` (construction). Planet: *Scholze's test functions φ_{τ,h}*.

Fix ℓ ≠ p, τ ∈ Frob^r I_F ⊂ W_F with r ≥ 1 (Frob geometric) and h ∈ C_c^∞(GL_n(O)) with values in ℚ, and set h^∨(g) = h(ᵗg^{-1}). Define φ_{τ,h} on GL_n(F_r) by φ_{τ,h}(β) = tr(τ × h^∨ | [Rψ_β]) for β ∈ GL_n(O_r) diag(ϖ,1,…,1) GL_n(O_r), where [Rψ_β] is the alternating sum of the nearby-cycle cohomology of R_{β,m} for m large enough that h is bi-invariant under 1 + ϖ^m M_n(O) (ET.6/drinfeld-level-deformation-spaces (d)), and φ_{τ,h}(β) = 0 for other β. Then φ_{τ,h} ∈ C_c^∞(GL_n(F_r)) takes values in ℚ and is independent of ℓ. Let f_{τ,h} ∈ C_c^∞(GL_n(F)) be a function with matching (twisted) orbital integrals: the orbital integrals of f_{τ,h} at regular elements equal the σ-twisted orbital integrals of φ_{τ,h} at elements with that norm, and vanish at non-norms (ET.4/local-cyclic-base-change; ET.6/norm-maps-and-base-change-identities). f_{τ,h} is not unique, but its orbital integrals and its traces on representations are well defined.

The precise hypotheses are: F finite over ℚ_p; r ≥ 1 so that τ lies over a positive power of geometric Frobenius; h ℚ-valued and conjugation-invariant enough that h^∨ acts.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, Theorem 1.1, p. 3; §2, Theorem 2.6, p. 8). Defines φ_{τ,h} by the trace of τ × h^∨ on nearby cycles, proves it is locally constant, compactly supported, ℚ-valued and independent of ℓ, and defines f_{τ,h} by matching twisted orbital integrals.

Local constancy in β follows from the algebraisation and the finite group action (Scholze 2010 Theorem 2.4, Theorem 2.6 proof); compact support from the double-coset condition.

Rationality and independence of ℓ: Mieda's theorem (Scholze 2010 Theorem 2.6).

Existence of f_{τ,h}: the base change of functions for GL_n along the unramified extension F_r/F (Arthur–Clozel Ch. 1 §3, Proposition 3.1; ET.3/base-change-fundamental-lemma-and-transfer (c)).

The definition exposes the following operations and relations.

- `scholzePhi` (constructor): φ_{τ,h}(β) = tr(τ × h^∨ | [Rψ_β]) on the double coset, 0 elsewhere.
- `scholzePhi_locallyConstant` (characterisation): φ_{τ,h} ∈ C_c^∞(GL_n(F_r)).
- `scholzePhi_rational` (other): φ_{τ,h} is ℚ-valued and independent of ℓ.
- `scholzeF` (constructor): f_{τ,h}, any function on GL_n(F) whose orbital integrals match the twisted orbital integrals of φ_{τ,h}.
- `scholzeF_trace_wellDefined` (characterisation): tr(f_{τ,h} | π) is independent of the choice of f_{τ,h}.
- `scholzePhi_linear_h` (simp): φ_{τ,h} is linear in h.
- `scholzePhi_support` (simp): φ_{τ,h} vanishes off GL_n(O_r) diag(ϖ,1,…,1) GL_n(O_r).

**Checks.**

- `scholzePhi_gl1` (computation): For n = 1, tr(f_{τ,h} | χ) = χ(Art_F^{-1}(τ)) tr(h | χ): Theorem 1.2(a) for n = 1 is local class field theory.
- `scholzePhi_unramified` (compatibility): For h = 1_{GL_n(O)}, φ_{τ,h} has the same twisted orbital integrals as Kottwitz's function φ_r of the unramified Shimura variety (Scholze–Shin Remark 7.4).
- `scholzePhi_off_coset` (degenerate): φ_{τ,h}(1) = 0, since 1 is not in the double coset of diag(ϖ,1,…,1).
- `scholzeF_not_unique` (non-example): Two choices of f_{τ,h} may differ as functions; only their orbital integrals and traces are determined.

**Acceptance.**

- For n = 1 and τ = Frob^r σ with σ ∈ I_F, φ_{τ,h}(β) = h^∨(…) times the trace of τ on the Lubin–Tate character: it recovers the local Artin map.
- For h = 1_{GL_n(O)}, φ_{τ,h} has the same twisted orbital integrals as Kottwitz's function φ_r (Scholze–Shin Remark 7.4).
- φ_{τ,h} vanishes outside the double coset GL_n(O_r) diag(ϖ,1,…,1) GL_n(O_r).

*Used by:* Scholze 2010 Theorem 1.2 (rec(π) is characterised by tr(f_{τ,h} | π) = tr(τ | rec(π)) tr(h | π)); Scholze 2010 Theorem 9.3 (φ_{τ,h} is the test function at p in the Langlands–Kottwitz point count at Drinfeld level); Scholze–Shin, Conjecture 7.1 and Theorem 8.1 (endoscopic transfers f^H_{τ,h} of φ_{τ,h} for general Shimura varieties (not planned here)); `ET.6/test-function-descent`; `ET.6/comparison-of-two-functions`; `ET.6/scholze-local-langlands`.

*Needs:* `ET.6/drinfeld-level-deformation-spaces`; `ET.4/twisted-characters`; `ET.3/base-change-fundamental-lemma-and-transfer`; `SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra`.

### ET.6.11 Norm maps for D-groups and base-change identities for the test functions

Node `ET.6/norm-maps-and-base-change-identities` (theorem).

Let D be a semisimple algebra over ℚ_p with maximal order O_D. (a) There is a bijection β ↦ Nβ between (O_D ⊗ ℤ_{p^r})^×-σ_0-conjugacy classes in (O_D ⊗ ℤ_{p^r})^× and O_D^×-conjugacy classes in O_D^×, under which the characteristic polynomial of Nβ equals that of β β^{σ_0} ⋯ β^{σ_0^{r−1}}; for h on O_D^× conjugation-invariant, the function φ_h(β) = h(Nβ) on (O_D ⊗ ℤ_{p^r})^× has matching twisted orbital integrals with h, and ∫ φ_h = ∫ h (Scholze 2010 Proposition 4.2, Proposition 4.3, Corollary 4.5). (b) The same holds for σ-conjugacy classes in B_r and conjugacy classes in D_r for the D-groups attached to étale p-divisible groups with O_D-action (Proposition 4.6, Proposition 4.7, Corollary 4.8). For D = M_n(ℚ_p) and h = 1_{GL_n(ℤ_p)} this is the usual base-change identity for the unit element.

The precise hypotheses are: semisimple D over ℚ_p with maximal order; unramified extension of degree r.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §4, Definition 4.1, Propositions 4.2–4.3, Remark 4.4, Corollary 4.5, Propositions 4.6–4.7, Corollary 4.8, pp. 11–13). Constructs norm maps for D-groups and proves the matching of twisted orbital integrals and the integral identities.

Interpret σ_0-conjugacy classes as isomorphism classes of D-groups (étale p-divisible groups with O_D^op-action) over 𝔽_{p^r} and Nβ as the Frobenius over 𝔽_p (Scholze 2010 Definition 4.1, §4).

Matching of twisted orbital integrals: compare the counting of D-groups over 𝔽_{p^r} and over 𝔽_p (Proposition 4.3, Remark 4.4).

The integral identities follow from the Weyl integration formula (ET.4/padic-character-distributions, ET.4/twisted-characters).

**Acceptance.**

- For D = ℚ_p, N is the norm from ℤ_{p^r}^× to ℤ_p^×.
- For D = M_n(ℚ_p) and h = 1_{GL_n(ℤ_p)}, φ_h = 1_{GL_n(ℤ_{p^r})}, the unit base-change identity (ET.3/base-change-fundamental-lemma-and-transfer (a)).
- ∫ φ_h = ∫ h is the case of the identity term.

*Used by:* `ET.6/test-function-descent`; `ET.6/comparison-of-two-functions`; `ET.6/drinfeld-level-point-count`.

*Needs:* `ET.4/twisted-characters`; `ET.4/padic-character-distributions`; `ET.3/base-change-fundamental-lemma-and-transfer`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

### ET.6.12 Geometric and harmonic descent for the test functions

Node `ET.6/test-function-descent` (theorem).

(a) (Geometric descent) The connected components of Spf(R_{β,m} ⊗ Ŏ) are parametrised by surjective O-linear maps (O/ϖ^m)^n → H_β^{ét}[ϖ^m](k̄), with GL_n(O/ϖ^m) acting transitively; the nearby cycles of R_{β,m} decompose accordingly along the connected–étale filtration (Scholze 2010 Proposition 5.1). (b) (Harmonic descent) For π the normalised parabolic induction of π_1 ⊗ … ⊗ π_t (t ≥ 2) of a Levi GL_{n_1} × … × GL_{n_t}, the trace tr(f_{τ,h} | π) is computed from the traces of the functions f_{τ,h_i} of the smaller groups on π_i (Scholze 2010 Lemmas 6.1–6.3); hence, if Theorem 1.2 holds for all n′ < n, the character identity of ET.6/scholze-local-langlands (a) holds for π with σ(π) = σ(π_1) ⊕ … ⊕ σ(π_t) (Theorem 6.4). (c) (Reduction by types) If (o) Theorem 1.2(a),(b) hold for all n′ < n, (i) the identity holds for all properly induced π, and (ii) for every essentially square-integrable or generalised Speh π there is a ℚ-linear combination rec(π) of representations with non-negative coefficients satisfying the trace identity, then Theorem 1.2(a),(b) hold for n; the proof uses the theory of types to find h with prescribed traces on tempered representations and Kazhdan's density theorem (Scholze 2010 Lemmas 3.1–3.2).

The precise hypotheses are: induction on n; F finite over ℚ_p.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §3, Lemmas 3.1–3.2, pp. 9–10). Reduces Theorem 1.2 to properly induced, essentially square-integrable and generalised Speh representations using types and Kazhdan's density theorem.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §5, Proposition 5.1, p. 13; §6, Lemmas 6.1–6.3 and Theorem 6.4, pp. 15–16). Proves geometric and harmonic descent and the compatibility of the trace identity with parabolic induction.

(a): analyse the étale part of the universal deformation and Drinfeld structures (Scholze 2010 §5).

(b): compute the twisted trace of φ_{τ,h} on the base change of an induced representation by the Jacquet module along the parabolic, matching the connected–étale decomposition (Scholze 2010 §6; SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module, SR.2/geometric-lemma).

(c): Bernstein centre and types (SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks) with Kazhdan's density theorem (Scholze 2010 §3).

**Acceptance.**

- For n = 1 there is no proper Levi and (b) is vacuous.
- For π = χ_1 × χ_2 an irreducible principal series of GL_2, (b) gives σ(π) = σ(χ_1) ⊕ σ(χ_2).
- Condition (ii) of (c) only asks for a ℚ-linear combination with non-negative coefficients, not yet a representation.

*Used by:* `ET.6/scholze-local-langlands`.

*Needs:* `ET.6/scholze-test-functions`; `ET.6/norm-maps-and-base-change-identities`; `ET.6/zelevinsky-classification`; `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`; `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`; `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks`.

### ET.6.13 Comparison of the test functions with deformation spaces of (O, D′)-groups

Node `ET.6/comparison-of-two-functions` (theorem).

For a semisimple D′ over ℚ_p with maximal order O_{D′}, an (O, D′)-group is a p-divisible group H with O_D^op = M_n(O)^op × O_{D′}^op-action decomposing as H_n × H′ with H_n of the type of ET.6/drinfeld-level-deformation-spaces and H′ étale. (a) The deformation space R_H of such an H is canonically R_β, and its level-m version R_{H,m} ≅ R_{β,m} × (H′[p^m])^× (Scholze 2010 Proposition 7.3); (b) Rψ_H ≅ Rψ_β ⊗ C_c^∞(O_{D′}^×) W_{F_r} × G_D(ℤ_p)-equivariantly (Corollary 7.4); (c) for any τ, h, h′ the function φ_{τ,h,h′} built from Rψ_H is associated with f^∨_{τ,h × h′} (Lemma 7.5). This is the local input that lets the test function at p of the Shimura varieties of ET.6/division-algebra-shimura-varieties be expressed through φ_{τ,h}.

The precise hypotheses are: D = M_n(F) × D′ as in Scholze 2010 §7; δ_0 σ_0-conjugate to ((β^{-1})^t, 1, β′) (Proposition 7.2).

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §7, Definition 7.1, Propositions 7.2–7.3, Corollary 7.4 and Lemma 7.5, pp. 17–18). Compares deformation spaces of (O,D′)-groups with those of one-dimensional ϖ-divisible O-modules and shows the associated functions match.

Scholze 2010 Definition 7.1, Propositions 7.2–7.3, Corollary 7.4, Lemma 7.5: decompose the Dieudonné module along the O_D-action and identify deformations of H with deformations of H_n.

**Acceptance.**

- For D′ = 0 the statement is ET.6/drinfeld-level-deformation-spaces itself.
- For H′ étale, deforming H′ is trivial, which is why only a factor (H′[p^m])^× appears.
- The comparison involves h^∨ and the transpose-inverse, so a version without ∨ fails.

*Used by:* `ET.6/division-algebra-shimura-varieties`; `ET.6/drinfeld-level-point-count`.

*Needs:* `ET.6/scholze-test-functions`; `ET.6/norm-maps-and-base-change-identities`.

### ET.6.14 Shimura varieties of the division-algebra unitary groups at Drinfeld level

Node `ET.6/division-algebra-shimura-varieties` (construction).

With the data (F = F_0K, D, *, G) of ET.4/simple-division-algebra-trace-identity (Scholze 2010 Lemma 8.1), a prime p split in K and a place w of F above p with F_w ≅ the given p-adic field, G(ℚ_p) ≅ GL_n(F_w) × (D′)^× × ℚ_p^× with D′ the product of the other local factors. For K^p ⊂ G(𝔸_f^p) small and m ≥ 0, the PEL moduli problem of abelian varieties with D-action, polarization, prime-to-p level K^p and Drinfeld level-ϖ^m structure on the one-dimensional part of the p-divisible group is representable by a projective scheme Sh_{K^p,m} over O_{F_w}, flat, with smooth generic fibre equal to the canonical model of the Shimura variety of (G, h^{-1}) at level K^p × K_{p,m}, and its completed local rings at closed points are the spaces R_{β,m} (ET.6/drinfeld-level-deformation-spaces) times the étale part (Scholze 2010 Lemma 9.2); the cohomology H_ξ = Σ_i (−1)^i lim H^i(Sh ⊗ ℚ̄, L_ξ) carries commuting actions of G(𝔸_f) and Gal(F̄_w/F_w), and π_*Rψ F_{K^p,m} ≅ (π_*Rψ ℚ̄_ℓ) ⊗ F_{K^p,0} (Lemma 9.1).

The precise hypotheses are: D a division algebra; signature (1, n−1) at one infinite place; p split in K; K^p small.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §8, Lemma 8.1 and Remarks 8.2–8.3, p. 19; §8, pp. 19–22). Constructs the Shimura data and the integral models at Drinfeld level with the determinant condition.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §9, Lemmas 9.1–9.2, pp. 23–24). Identifies nearby cycles at level m and completed local rings with the deformation spaces.

Representability and the generic fibre: PEL moduli of PELModuli:M2/representability, M4/canonical-model-identification, extended to Drinfeld level at w by the determinant condition (Scholze 2010 §8, citing Kottwitz and Harris–Taylor Lemma III.1.2).

Properness: D division (PELModuli:M2/properness-when-division).

Local structure: Serre–Tate and the comparison of ET.6/comparison-of-two-functions identify completed local rings with R_{β,m} (Scholze 2010 Lemmas 9.1–9.2).

The definition exposes the following operations and relations.

- `DivisionAlgebraShimuraVariety` (constructor): Sh_{K^p,m} over O_{F_w}, representing the PEL problem at Drinfeld level ϖ^m.
- `DivisionAlgebraShimuraVariety.proper` (characterisation): Sh_{K^p,m} is projective over O_{F_w}.
- `DivisionAlgebraShimuraVariety.genericFibre` (compatibility): The generic fibre is the canonical model of Sh(G, h^{-1}) at level K^p K_{p,m}.
- `DivisionAlgebraShimuraVariety.completedLocalRing` (characterisation): Completed local rings are R_{β,m} times the étale part.
- `DivisionAlgebraShimuraVariety.cohomology` (data): H_ξ with G(𝔸_f) × Gal(F̄_w/F_w)-action.
- `DivisionAlgebraShimuraVariety.nearbyCycles_level` (relation): π_*Rψ F_{K^p,m} ≅ (π_*Rψ ℚ̄_ℓ) ⊗ F_{K^p,0}.

**Checks.**

- `DivisionAlgebraShimuraVariety.level_zero_smooth` (degenerate): At m = 0 the integral model is smooth over O_{F_w}.
- `DivisionAlgebraShimuraVariety.dimension` (computation): The relative dimension is n − 1.
- `DivisionAlgebraShimuraVariety.local_ring_n1` (compatibility): For n = 1 the completed local rings are the Lubin–Tate rings of ET.6/drinfeld-level-deformation-spaces.
- `DivisionAlgebraShimuraVariety.split_not_proper` (non-example): If D = M_n(F) the analogous variety is not proper over O_{F_w}.

**Acceptance.**

- For m = 0 the model is smooth (good reduction at w).
- For n = 1 the Shimura variety is zero-dimensional.
- For D not a division algebra the variety is not proper and the nearby-cycle argument needs compactifications (excluded).

*Used by:* Scholze 2010 Theorem 9.3 (the Langlands–Kottwitz point count at Drinfeld level); Scholze 2010 §§10–11 (Galois representations and the comparison with the Lubin–Tate tower); `ET.6/drinfeld-level-point-count`.

*Needs:* `ET.4/simple-division-algebra-trace-identity`; `ET.6/drinfeld-level-deformation-spaces`; `ET.6/comparison-of-two-functions`; `PELModuli:M2/representability`; `PELModuli:M2/properness-when-division`; `PELModuli:M4/canonical-model-identification`; `LefschetzPencilsAndVanishingCycles:LPV.6`.

### ET.6.15 The Langlands–Kottwitz point count at Drinfeld level

Node `ET.6/drinfeld-level-point-count` (theorem).

With Sh_{K^p,m} and H_ξ as in ET.6/division-algebra-shimura-varieties, for τ ∈ Frob^j I_{F_w}, h ∈ C_c^∞(GL_n(O_{F_w})), h′ ∈ C_c^∞(O_{D′}^×) and f^p ∈ C_c^∞(G(𝔸_f^p)): tr(τ × h^∨ × h′ × e_{ℤ_p^×} × f^p | [H_ξ]) = Σ_{(γ_0;γ,δ)} c(γ_0;γ,δ) O_γ(f^p) TO_{δσ_0}(φ_{τ,h,h′} × e_{p^{−1}W(κ_r)^×}) tr(γ_0 | ξ), the sum over Kottwitz triples with vanishing Kottwitz invariant, and consequently n·tr(τ × h^∨ × h′ × e × f^p | [H_ξ]) = tr(f^∨_{τ,h×h′} × e′ × f^p | [H_ξ]) (Scholze 2010 Theorem 9.3 and Corollary 9.4).

The precise hypotheses are: τ over a positive power of geometric Frobenius; the hypotheses of ET.6/division-algebra-shimura-varieties.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §9, Theorem 9.3 and Corollary 9.4, pp. 22–25). Proves the Langlands–Kottwitz formula at Drinfeld level with test function φ_{τ,h,h′} at p, and rewrites it with f^∨_{τ,h×h′}.

Apply the Fujiwara–Varshavsky trace formula (EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula) to the Frobenius-twisted Hecke correspondences on Sh_{K^p,m} ⊗ 𝔽̄ with coefficients π_*Rψ (Scholze 2010 §9; Varshavsky Theorem 2.3.2).

Compute local terms at fixed points through the completed local rings (ET.6/division-algebra-shimura-varieties) and ET.6/comparison-of-two-functions, giving twisted orbital integrals of φ_{τ,h,h′}.

Parametrise isogeny classes of points by Kottwitz triples using Honda–Tate theory (AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate) and Kottwitz's arguments for PEL varieties (Kottwitz 1992), which Scholze checks apply at Drinfeld level (Scholze 2010 p. 23).

Stabilisation is trivial for these groups (ET.4/simple-division-algebra-trace-identity), and the twisted orbital integrals become orbital integrals of f^∨_{τ,h×h′} by ET.6/norm-maps-and-base-change-identities (Corollary 9.4).

**Acceptance.**

- For m = 0 and h = 1, φ_{τ,h} is Kottwitz's φ_j and the identity is Kottwitz's point count at good reduction.
- The normalising factor on the left side of Corollary 9.4 is Scholze's; a consumer takes it from there and does not set it to 1.
- Without the vanishing of the Kottwitz invariant, a triple contributes no points.

*Used by:* `ET.6/global-galois-input`.

*Needs:* `ET.6/division-algebra-shimura-varieties`; `ET.6/comparison-of-two-functions`; `ET.6/norm-maps-and-base-change-identities`; `ET.4/simple-division-algebra-trace-identity`; `EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula`; `AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate`; `AbelianSchemesAndArithmeticModuliPartII:F0/tate-hom`; `ET.0/global-kottwitz-obstruction`.

### ET.6.16 Galois representations in the cohomology of the division-algebra Shimura varieties

Node `ET.6/global-galois-input` (theorem).

(a) If π_f is an irreducible admissible representation of G(𝔸_f) occurring in the ξ-cohomology, with π_p = π_w ⊗ π_{w^p} ⊗ π_{p,0} and π_{p,0} unramified, then the W_{F_w}-action on the π_f-isotypic part of H_ξ, twisted by the unramified character of π_{p,0}, satisfies the character identity of ET.6/scholze-local-langlands (a) for π_w with a non-negative integral multiplicity (Scholze 2010 Corollary 10.1). (b) For every essentially square-integrable or generalised Speh π of GL_n(F_w) there is π_f and ξ with π_w ≅ π (Theorem 10.2), so there is a ℚ-linear combination rec(π) of representations of W_{F_w} with non-negative coefficients satisfying the trace identity (Corollary 10.3). (c) (Theorem 10.6) If Π is a cuspidal automorphic representation of GL_n over F with Π^∨ ≅ Π∘c, Π_∞ regular algebraic and Π_x square-integrable at a place x split over F_0, there is an ℓ-adic representation R(Π) of Gal(F̄/F) such that for every place v | p split over F_0 with F_v ≅ F_w, tr(f_{τ,h} | Π_v) = tr(τ | R(Π)|_{W_{F_v}}) tr(h | Π_v) up to the semisimplification and twist normalisation; (d) (Theorem 10.7) every essentially square-integrable π of GL_n(F_w) is the local component of such a Π (with Π_x supercuspidal). Theorem 10.6 is applied only after Theorem 1.2(a),(b) have been established.

The precise hypotheses are: the hypotheses of ET.6/division-algebra-shimura-varieties; Π conjugate self-dual, regular algebraic, square-integrable at x.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §10, Corollary 10.1, Theorem 10.2, Corollary 10.3, Remark 10.4, Theorems 10.5–10.7, pp. 25–28). Uses Kottwitz's results and Clozel/Harris–Taylor base change to realise essentially square-integrable and generalised Speh representations in cohomology and to attach Galois representations to conjugate self-dual cuspidal representations.

(a): combine ET.6/drinfeld-level-point-count with ET.4/simple-division-algebra-trace-identity and Kottwitz's description of the cohomology (Scholze 2010 Corollary 10.1).

(b): globalise π by a cuspidal representation of D^× via the simple trace formula with a pseudo-coefficient (Theorem 10.2).

(c),(d): base change and descent between G and GL_n (ET.4/unitary-gl-base-change-descent) and the globalisation Theorem 10.7.

**Acceptance.**

- For n = 1 the representation R(Π) is the Galois character of the algebraic Hecke character Π.
- For Π_x not square-integrable, (c) is not asserted here.
- The non-negative combination in (b) need not be an honest representation until Theorem 1.2 is proved.

*Used by:* `ET.6/scholze-local-langlands`; `ET.6/non-galois-automorphic-induction`.

*Needs:* `ET.6/drinfeld-level-point-count`; `ET.4/unitary-gl-base-change-descent`; `ET.4/simple-division-algebra-trace-identity`; `ET.1/pseudocoefficients`; `ET.6/segment-representations`.

### ET.6.17 Scholze's characterization of the local Langlands correspondence ★

Node `ET.6/scholze-local-langlands` (theorem). Planet: *Scholze's characterization of local Langlands*.

(a) For every irreducible smooth representation π of GL_n(F) there is a unique n-dimensional semisimple representation rec(π) of W_F such that tr(f_{τ,h} | π) = tr(τ | rec(π)) tr(h | π) for all τ ∈ Frob^r I_F with r ≥ 1 and all h ∈ C_c^∞(GL_n(O)) (ET.6/scholze-test-functions). Put σ(π) = rec(π)((1−n)/2). (b) If π is a subquotient of the normalised parabolic induction of π_1 ⊗ … ⊗ π_t then σ(π) = σ(π_1) ⊕ … ⊕ σ(π_t). (c) σ restricts to a bijection between supercuspidal irreducible representations of GL_n(F) and irreducible n-dimensional representations of W_F. (d) This bijection is compatible with twists, central characters, duals, and L- and ε-factors of pairs, hence is the standard correspondence. Uniqueness in (a) holds because traces of τ lying over positive powers of geometric Frobenius determine a semisimple representation.

The precise hypotheses are: F a finite extension of ℚ_p (characteristic 0); ℓ ≠ p and a fixed isomorphism ℚ̄_ℓ ≅ ℂ.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, Theorem 1.2 (pp. 3–4) and Theorem 2.7 (p. 9)). States the existence and uniqueness of rec(π) with the character identity, compatibility with parabolic induction, bijectivity on supercuspidals and compatibility with the standard properties.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, footnotes 1–2, p. 2). Notes that rec(π) is the Weil-group part of the Weil–Deligne parameter and that the monodromy operator is ignored.

(a),(b) by induction on n: the reduction ET.6/test-function-descent (c), with ET.6/test-function-descent (b) for induced representations and ET.6/global-galois-input (b) for essentially square-integrable and generalised Speh representations.

(c): ET.6/supercuspidal-bijection (comparison with the Lubin–Tate tower, then functoriality).

(d): ET.6/l-epsilon-of-pairs.

**Acceptance.**

- For n = 1, rec(χ) = χ ∘ Art_F^{-1} (local class field theory).
- For the Steinberg representation of GL_2, σ(St) = 1 ⊕ |·| up to the twist convention, the semisimplification of Sp_2 (monodromy is invisible to (a)).
- rec is not injective on all irreducibles: π and its Zelevinsky dual have the same semisimple parameter (e.g. trivial and Steinberg of GL_2).

*Used by:* `ET.6/lubin-tate-comparison`; `ET.6/supercuspidal-bijection`; `ET.6/non-galois-automorphic-induction`; `ET.6/full-wd-local-langlands`.

*Needs:* `ET.6/scholze-test-functions`; `ET.6/test-function-descent`; `ET.6/global-galois-input`; `ET.6/zelevinsky-classification`.

### ET.6.18 Relation to the Lubin–Tate tower

Node `ET.6/lubin-tate-comparison` (theorem).

Let [Rψ] be the alternating sum of global sections of nearby cycles of the Lubin–Tate tower, a virtual representation of GL_n(O) × D^× × I_F extending to (GL_n(F) × D^× × W_F)^0. (a) Each R^iψ is an admissible smooth representation of GL_n(O), smooth for O_D^×, continuous for I_F, and vanishes outside 0 ≤ i ≤ n−1 (Scholze 2010 Theorem 11.1). (b) φ_{τ,h}(β) = tr(τ × d^{-1} × h^∨ | [Rψ]) for d the element of D^× attached to β (Proposition 11.2). (c) If ρ is an irreducible representation of D^× with π = JL(ρ) supercuspidal (ET.6/local-jacquet-langlands), then as virtual GL_n(O) × W_F-representations [Rψ](ρ^∨) = (−1)^{n−1} π^∨|_{GL_n(O)} ⊗ rec(π) (Corollary 11.3); consequently rec(π) of a supercuspidal π is a ℤ-linear combination of representations (Corollary 11.5, using newvectors). The statement is a virtual identity over GL_n(O); the full GL_n(F) × W_F-equivariant concentration in one degree is the separate two-tower realisation of ET.6a.

The precise hypotheses are: π supercuspidal for (c); the Jacquet–Langlands correspondence of ET.6/local-jacquet-langlands.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §11, Theorem 11.1, Proposition 11.2, Corollaries 11.3 and 11.5 and Remark 11.4, pp. 28–30). Relates the test functions to the cohomology of the Lubin–Tate tower and realises rec(π) for supercuspidal π virtually over GL_n(O).

(a): Berkovich's comparison for formal schemes and Harris–Taylor Lemma II.2.8 (Scholze 2010 Theorem 11.1).

(b): compare the definition of φ_{τ,h} with the Lubin–Tate tower, which does not depend on β after base change to k̄ (Proposition 11.2).

(c): compactly induce [Rψ] and use ET.6/scholze-local-langlands (a) for the base change of π together with the Jacquet–Langlands character identity (Corollary 11.3); integrality by newvectors (Corollary 11.5).

**Acceptance.**

- For n = 1, [Rψ] is the Lubin–Tate realisation of local class field theory.
- For n = 2 and ρ trivial on D^×, JL(ρ) is the Steinberg representation (not supercuspidal), so (c) does not apply.
- The sign (−1)^{n−1} is the Kottwitz sign of D^×.

*Used by:* `ET.6/supercuspidal-bijection`.

*Needs:* `ET.6/scholze-local-langlands`; `ET.6/drinfeld-level-deformation-spaces`; `ET.6/local-jacquet-langlands`; `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`.

### ET.6.19 Bijectivity on supercuspidal representations

Node `ET.6/supercuspidal-bijection` (theorem).

(a) The map π ↦ σ(π) of ET.6/scholze-local-langlands is a functorial extension of local class field theory in the sense of ET.6/llc-characterizing-properties: it satisfies (i)–(v) and is compatible with cyclic base change of prime degree (vi) (Scholze 2010 Theorem 12.1). (b) For any functorial extension of class field theory, the map from irreducible supercuspidal representations of GL_n(F) to n-dimensional representations of W_F is injective with image exactly the irreducible n-dimensional representations (Theorem 12.3). (c) In particular σ restricts to a bijection on supercuspidals, sending supercuspidals to irreducible representations.

The precise hypotheses are: F finite over ℚ_p.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, Theorem 12.1, Definition 12.2 and Theorem 12.3 with proof, pp. 30–32). Proves the functorial properties, defines functorial extensions of class field theory and proves bijectivity on supercuspidals using Arthur–Clozel's local base change and Henniart's numerical correspondence.

(a): (i),(ii),(iii),(iv) from the construction and the comparison with the Lubin–Tate tower (ET.6/lubin-tate-comparison); (v) is ET.6/scholze-local-langlands (b); (vi) from ET.6/scholze-local-langlands (a) and the base-change character identity of ET.4/local-cyclic-base-change with twisted characters (ET.4/twisted-characters).

(b): every supercuspidal becomes non-supercuspidal after a finite chain of prime-degree cyclic base changes (it stays supercuspidal up to twist only finitely often); use Arthur–Clozel Lemma 6.10, Theorem 6.2 and Proposition 6.7 to show irreducibility of σ(π) and injectivity by descending along the chain, and Henniart's numerical correspondence (equal counts of supercuspidals and irreducible representations of bounded conductor) for surjectivity (Scholze 2010 §12, pp. 31–32).

**Acceptance.**

- For n = 1 the statement is local class field theory.
- For n = 2 and p odd, dihedral supercuspidals correspond to induced representations Ind_{W_E}^{W_F} χ.
- σ(Steinberg) is reducible, consistent with Steinberg not being supercuspidal.

*Used by:* `ET.6/l-epsilon-of-pairs`; `ET.6/full-wd-local-langlands`.

*Needs:* `ET.6/scholze-local-langlands`; `ET.6/lubin-tate-comparison`; `ET.6/llc-characterizing-properties`; `ET.4/local-cyclic-base-change`; `ET.4/twisted-characters`.

### ET.6.20 Harris's non-Galois automorphic induction

Node `ET.6/non-galois-automorphic-induction` (theorem).

Let L be a number field. A cuspidal automorphic representation Π of GL_n over L is potentially abelian if there is an n-dimensional representation Σ of W_L such that Π_v and Σ|_{W_{L_v}} correspond (under the unramified correspondence) at almost all finite places v (Scholze 2010 Definition 13.1). (a) If Π is potentially abelian with Π_∞ regular L-algebraic, then Σ is algebraic and has an ℓ-adic realisation σ_ℓ (Lemmas 13.3–13.4). (b) (Theorem 13.5) For F CM, Π cuspidal with Π^∨ ≅ Π∘c, Π_∞ regular L-algebraic and Π_x supercuspidal: if Π is associated with a representation Σ of W_F, then the local components satisfy σ(Π_v) = Σ|_{W_{F_v}} at the places v of the construction. (c) (Theorem 13.6) Given a tower F^3_0 ⊃ F^2_0 ⊃ F^1_0 of totally real fields of even degree over ℚ with F^3_0/F^1_0 solvable Galois, n = [F^2_0 : F^1_0], an imaginary quadratic K and an algebraic Hecke character χ of F^2_0K, there is a cuspidal automorphic representation of GL_n over F^1_0K automorphically induced from χ (Harris's non-Galois automorphic induction), with the expected local components.

The precise hypotheses are: CM fields with totally real subfields of even degree; solvable Galois closure.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §13, Definition 13.1, Corollary 13.2, Lemmas 13.3–13.4, Theorems 13.5–13.6, pp. 32–35). Repeats Harris's construction of cuspidal automorphic representations by non-Galois automorphic induction and proves compatibility with the local correspondence.

Use solvable base change (ET.4/global-cyclic-base-change) up the tower F^3_0/F^1_0 and cyclic automorphic induction (ET.4/cyclic-automorphic-induction) in the Galois steps, then descend by the uniqueness of base change and the Galois representations of ET.6/global-galois-input (c) (Scholze 2010 §13, after Harris 1998).

Algebraicity and ℓ-adic realisation of Σ from the archimedean local Langlands correspondence (Lemma 13.3) and Weil's construction of Galois characters attached to algebraic Hecke characters (Lemma 13.4).

**Acceptance.**

- For n = 1 the induction is the Hecke character itself.
- For F^3_0 = F^2_0 Galois over F^1_0, the result reduces to cyclic or solvable automorphic induction.
- A non-algebraic Hecke character has no ℓ-adic realisation, so (a) needs regular L-algebraicity.

*Used by:* `ET.6/l-epsilon-of-pairs`.

*Needs:* `ET.4/global-cyclic-base-change`; `ET.4/cyclic-automorphic-induction`; `ET.6/global-galois-input`; `ET.6/scholze-local-langlands`.

### ET.6.21 Compatibility of the correspondence with L- and ε-factors of pairs

Node `ET.6/l-epsilon-of-pairs` (theorem).

The correspondence π ↦ σ(π) on supercuspidal representations (extended additively to the Grothendieck group of W_F) has the following properties: (i) in degree 1 it is local class field theory; (ii) σ(π ⊗ χ) = σ(π) ⊗ σ(χ); (iii) σ(π^∨) = σ(π)^∨; (iv) det σ(π) = σ(ω_π); (v) for supercuspidal π_1, π_2, L(s, π_1 × π_2) = L(s, σ(π_1) ⊗ σ(π_2)) and ε(s, π_1 × π_2, ψ) = ε(s, σ(π_1) ⊗ σ(π_2), ψ), with the Jacquet–Piatetski-Shapiro–Shalika factors on the left (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor) and the Deligne–Langlands factors on the right (ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor). Consequently it is the correspondence characterised by Henniart, and part (iii) follows from (v) by comparing poles.

The precise hypotheses are: π_1, π_2 supercuspidal (for general irreducibles the factors are defined through the Langlands classification and supercuspidal supports, and the two notions are kept distinct).

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §14, Theorem 14.1 and Lemma 14.2, pp. 35–36). Proves twisting, duality, determinant and L- and ε-factor compatibility by globalising with potentially abelian representations and comparing functional equations.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, p. 5). Explains the use of Harris's non-Galois automorphic induction and Henniart's twisting with highly ramified characters.

Globalise π_1, π_2 as local components of potentially abelian cuspidal representations Π_1, Π_2 over a CM field with all other ramified components controlled (Scholze 2010 Lemma 14.2, using ET.6/non-galois-automorphic-induction and automorphic induction of Hecke characters).

Compare the global functional equations of L(s, Π_1 × Π_2) (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation) and of the Artin–Hecke L-function of Σ_1 ⊗ Σ_2, whose local factors agree at all other places by construction; twist by highly ramified characters (Henniart's method) to separate the remaining place (Scholze 2010 Theorem 14.1 and proof).

**Acceptance.**

- For n_1 = n_2 = 1 (v) is Tate's local functional equation (AutomorphicLFunctionsAndLocalFactors:AL.1/local-functional-equation).
- For π_2 the trivial character of GL_1, (v) gives the Godement–Jacquet factors of π_1 (AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-functional-equation).
- L(s, π × π^∨) has a pole at s = 0, matching the trivial constituent of σ(π) ⊗ σ(π)^∨.

*Used by:* `ET.6/full-wd-local-langlands`.

*Needs:* `ET.6/supercuspidal-bijection`; `ET.6/non-galois-automorphic-induction`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-functional-equation`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`; `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`; `ArithmeticGaloisRepresentations:R01.2/local-euler-factor`; `AutomorphicLFunctionsAndLocalFactors:AL.1/local-functional-equation`.

### ET.6.22 The local Langlands correspondence for GL_n with full Weil–Deligne parameters ★

Node `ET.6/full-wd-local-langlands` (theorem). Planet: *Local Langlands correspondence for GL_n*.

Let F be a finite extension of ℚ_p. There is a unique family of bijections rec_F : Irr(GL_n(F)) → {n-dimensional Frobenius-semisimple Weil–Deligne representations of W_F}, n ≥ 1, such that: (a) on supercuspidals rec_F = σ (ET.6/supercuspidal-bijection), with N = 0; (b) for a segment Δ = [ρ, ν^{k−1}ρ], rec_F(L(Δ)) = rec_F(ρ) ⊗ Sp_k (ET.6/segment-wd-parameter); (c) for a multisegment m, rec_F(L(m)) = ⊕_{Δ∈m} rec_F(L(Δ)), L(m) the Langlands quotient (ET.6/zelevinsky-classification); then rec_F is bijective, compatible with twists, central characters (det), contragredients, and L- and ε-factors of pairs (defined on the Galois side through Weil–Deligne representations with monodromy), and conductors (ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation). (d) The restriction of rec_F(π) to W_F, semisimplified, is σ(π) of ET.6/scholze-local-langlands; equivalently the semisimple Langlands parameter of rec_F(π) (ET.6/semisimple-langlands-parameter) is the point of the Bernstein centre of π. (e) The Steinberg representation St_n = L([ν^{(1−n)/2}, ν^{(n−1)/2}]) corresponds to |·|^{(1−n)/2} ⊗ Sp_n; an unramified principal series corresponds to the sum of unramified characters with its Satake parameters (SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter); generic π correspond to Weil–Deligne representations with no two blocks linked. Equal-characteristic local fields are not covered.

The precise hypotheses are: F of characteristic 0 (equal-characteristic F requires a separately checked construction); Art_F normalised by geometric Frobenius.

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, Theorem 1.2 and footnotes 1–2, pp. 2–3). Establishes the semisimple correspondence and its standard properties; the monodromy operator is left aside and is reconstructed here from segments.

([A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), §10, pp. 204–206). Formulates the reciprocity law with monodromy through segments and the indecomposable objects attached to them.

([H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/journals/forum-of-mathematics-pi), Lemma 2.9, §2.6). Uses the full Weil–Deligne correspondence including N with geometric Frobenius.

Define rec_F by (a)–(c); bijectivity from ET.6/segment-wd-parameter and ET.6/zelevinsky-classification (multisegments ↔ irreducibles ↔ Frobenius-semisimple Weil–Deligne representations).

Compatibility of the semisimplification with σ: ET.6/scholze-local-langlands (b) and the cuspidal support of L(m) (ET.6/zelevinsky-classification (f)).

L- and ε-factors of pairs for non-supercuspidal representations: both sides are multiplicative in the Langlands classification (Jacquet–Piatetski-Shapiro–Shalika on the automorphic side; R01.2/local-epsilon-factor with monodromy on the Galois side), reducing to ET.6/l-epsilon-of-pairs; the supercuspidal-support L-factors and the Weil–Deligne L-factors are not confused (RT-AREA-langlands-1/1 verdict).

Uniqueness: Henniart's characterization on supercuspidals and the forced extension by (b)–(c).

**Acceptance.**

- rec_F(trivial of GL_2) = |·|^{-1/2} ⊕ |·|^{1/2} (N = 0) and rec_F(St_2) = |·|^{-1/2} ⊗ Sp_2 with N ≠ 0: the two differ only by N.
- For n = 1, rec_F is local class field theory.
- rec_F(π^∨) = rec_F(π)^∨ on a supercuspidal π of GL_2 with non-trivial central character.

*Used by:* `ET.6/semisimple-langlands-parameter`; `ET.6/inner-form-nontransfer`; `ET.6/level-zero-explicit`; `ET.6/acceptance-examples`.

*Needs:* `ET.6/supercuspidal-bijection`; `ET.6/segment-wd-parameter`; `ET.6/zelevinsky-classification`; `ET.6/l-epsilon-of-pairs`; `ET.6/scholze-local-langlands`; `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`; `SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter`; `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`.

### ET.6.23 Semisimple Langlands parameters, also for inner forms of Levi subgroups

Node `ET.6/semisimple-langlands-parameter` (definition).

(a) The semisimple Langlands parameter of a Frobenius-semisimple Weil–Deligne representation, viewed as W_F × SL_2(ℂ) → GL_m(ℂ), is its restriction along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})); for π irreducible of GL_m(F) set σ_π^{ss} = this restriction of rec_F(π). It is compatible with normalised parabolic induction and depends only on the cuspidal support: it is exactly a point of the Bernstein centre, and non-trivial extensions exist only between irreducibles with the same semisimple parameter. (b) For J an inner form of a Levi subgroup M of GL_m(F) (for instance J_{b_v}(F_v) of ET.5/jb-endoscopic-levi-data) and π an irreducible smooth representation of J, the semisimple L-parameter σ_π : W_F → GL_m(ℚ̄_ℓ) is defined through Badulescu's Langlands–Jacquet correspondence on all irreducible representations of inner forms of general linear groups (ET.6/badulescu-langlands-jacquet-map) followed by (a).

The precise hypotheses are: Frobenius-semisimple Weil–Deligne representations; inner forms of products of general linear groups.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.1, Remark 5.1.1, p. 65). Defines the semisimple Langlands parameter by restriction along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})), notes its compatibility with parabolic induction and that it is a point of the Bernstein centre, and attaches it to representations of J_{b_v}(F_v) via Badulescu.

(a): Caraiani–Scholze non-compact Remark 5.1.1, using ET.6/full-wd-local-langlands (d).

(b): Caraiani–Scholze non-compact §5.1 (citing Badulescu 2007); the definition is independent of choices because Badulescu's map is compatible with induction.

The definition exposes the following operations and relations.

- `semisimpleParameter` (constructor): σ^{ss} of a Frobenius-semisimple Weil–Deligne representation by restriction along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})).
- `semisimpleParameter_induction` (relation): σ^{ss}(n-Ind(π_1 ⊗ π_2)) = σ^{ss}(π_1) ⊕ σ^{ss}(π_2).
- `semisimpleParameter_bernstein` (characterisation): σ^{ss}(π) depends only on the cuspidal support of π.
- `semisimpleParameter_ext` (relation): If Ext^1(π, π′) ≠ 0 then σ^{ss}(π) = σ^{ss}(π′).
- `innerFormSemisimpleParameter` (constructor): σ_π for π an irreducible representation of an inner form of a Levi of GL_m, via Badulescu's map.
- `innerFormSemisimpleParameter_split` (compatibility): For the split inner form it agrees with semisimpleParameter.

**Checks.**

- `semisimpleParameter_unramified` (computation): For an unramified principal series with Satake parameters (α_i), σ^{ss} = ⊕ unramified characters with Frobenius eigenvalues α_i.
- `semisimpleParameter_steinberg_trivial` (characterisation): σ^{ss}(St_2) = σ^{ss}(1_{GL_2}).
- `semisimpleParameter_not_injective` (non-example): σ^{ss} is not injective on irreducibles (trivial and Steinberg of GL_2 share it), so it cannot replace rec_F.
- `innerFormSemisimpleParameter_quaternion` (computation): For D^× the quaternion units, σ_{1_{D^×}} = σ^{ss}(St_2).

**Acceptance.**

- For an unramified character χ of GL_1, σ_χ^{ss} = χ ∘ Art^{-1}.
- σ^{ss}(St_2) = σ^{ss}(trivial) up to the twist convention.
- For J = D^× (n = 2), σ^{ss} of the trivial representation of D^× equals σ^{ss}(St_2).

*Used by:* Caraiani–Scholze non-compact Theorem 5.1.2 (the semisimple parameter of π_{j,v}|·|^{1/2−n} matches the Galois representation at p); Scholze–Shin §6 (stable Bernstein centre) (semisimple parameters index the stable Bernstein centre); ET.7b/local-factorization (ET.6a packet) (virtual coefficients are separated by semisimple parameters); `ET.6/inner-form-nontransfer`.

*Needs:* `ET.6/full-wd-local-langlands`; `ET.6/badulescu-langlands-jacquet-map`; `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks`.

### ET.6.24 The local Jacquet–Langlands correspondence for inner forms of GL_n ★

Node `ET.6/local-jacquet-langlands` (theorem). Planet: *Local Jacquet–Langlands correspondence*.

Let D be a central division algebra of dimension d² over F, n = rd and G′ = GL_r(D), an inner form of GL_n(F) with Kottwitz sign e(G′) = (−1)^{n−r} (ET.0/kottwitz-sign). Regular semisimple g′ ∈ G′ and g ∈ GL_n(F) correspond if they have the same characteristic polynomial. There is a unique bijection JL from essentially square-integrable irreducible representations of GL_r(D) to essentially square-integrable irreducible representations of GL_n(F) such that Θ_{JL(π′)}(g) = (−1)^{n−r} Θ_{π′}(g′) for all corresponding regular elliptic g, g′ (characters as functions, ET.4/padic-character-distributions). JL preserves central characters, commutes with twists by characters (det or reduced norm), and is compatible with contragredients. For r = 1, JL is a bijection from all irreducible representations of D^× to the essentially square-integrable representations of GL_n(F), and sends the trivial representation of D^× to the Steinberg representation; for n = 2 the sign is −1.

The precise hypotheses are: F of characteristic 0 (Deligne–Kazhdan–Vignéras; Badulescu in positive characteristic, not used).

([P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §11, p. 29; §12, p. 31). Uses the Jacquet–Langlands correspondence between D^× and essentially square-integrable representations of GL_n(F), characterised by the character equality with sign.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Lemma 5.4.3 with proof, p. 741). Uses the Jacquet–Langlands and Langlands–Jacquet maps of Badulescu for all inner forms.

Deligne–Kazhdan–Vignéras, via the simple trace formula comparison for GL_n and D^× and the transfer of functions of ET.3/inner-form-transfer; recorded at ET.3/inner-form-transfer (b) for tempered representations.

Extension to essentially square-integrable representations by twisting; characters as functions by ET.4/padic-character-distributions.

**Acceptance.**

- For n = 2 and D quaternion, JL(1_{D^×}) = St_2 with Θ_{St}(g) = −1 = −Θ_1(g′) on elliptic regular elements.
- For d = 1 (D = F) JL is the identity.
- A principal series of GL_2 is not in the image of JL.

*Used by:* `ET.6/lubin-tate-comparison`; `ET.6/badulescu-langlands-jacquet-map`; `ET.6/level-zero-explicit`; `ET.6/acceptance-examples`.

*Needs:* `ET.3/inner-form-transfer`; `ET.4/padic-character-distributions`; `ET.0/kottwitz-sign`; `ET.6/segment-representations`.

### ET.6.25 Badulescu's Langlands–Jacquet map on Grothendieck groups ★

Node `ET.6/badulescu-langlands-jacquet-map` (construction). Planet: *Badulescu's Langlands–Jacquet map*.

Let G′ = GL_r(D) be an inner form of GL_n(F) and M′ ⊂ G′ a standard Levi, an inner form of a Levi M of GL_n(F). There is a group homomorphism LJ : Groth(GL_n(F)) → Groth(GL_r(D)) (and LJ_M : Groth(M) → Groth(M′) for Levis) such that (a) for π essentially square-integrable, LJ(π) = JL^{-1}(π) if π is in the image of JL and LJ(π) is ±(an irreducible) in general, with LJ(π) = 0 when π does not transfer; (b) Θ_{LJ(π)}(g′) = (−1)^{n−r} Θ_π(g) on corresponding regular elliptic elements, and more generally on all corresponding regular semisimple elements in the form compatible with (c); (c) LJ commutes with normalised parabolic induction and with the normalised Jacquet functors along corresponding parabolics (LJ ∘ n-Ind^{GL_n}_M = n-Ind^{G′}_{M′} ∘ LJ_M, and the dual statement for Jacquet modules); (d) LJ kills every irreducible generic principal series representation when D ≠ F, more generally every π whose image under the classification has no constituent transferring to G′; (e) LJ need not send irreducibles to irreducibles and is not a bijection of all irreducible representations: it can vanish or carry signs.

The precise hypotheses are: F of characteristic 0; D a central division algebra; inner forms of products of general linear groups.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Remark 5.4.1 and Lemma 5.4.3 with proof, pp. 739–741). Uses Badulescu's Langlands–Jacquet map in the definition of Red^b and proves that generic principal series map to 0 for non-quasi-split inner forms (citing Badulescu 2007 Theorem 3.1 and Proposition 3.3).

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.1, p. 65). Uses Badulescu's results on the Jacquet–Langlands correspondence for all inner forms of general linear groups to attach semisimple parameters.

Define LJ on the basis of standard representations through the classification of irreducibles of GL_r(D) by segments of essentially square-integrable representations (Tadić; Mínguez–Sécherre) and the Jacquet–Langlands bijection (ET.6/local-jacquet-langlands), and check the character identity (Badulescu 2007 Theorem 3.1, Proposition 3.3, as cited by Caraiani–Scholze 2017).

(c) from the van Dijk formula for induced characters (ET.4/padic-character-distributions (d)) and the Jacquet-module character formula (SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module).

(d): a generic principal series has character supported on split tori modulo centre near the elliptic set, which do not transfer to a non-split inner form (Caraiani–Scholze 2017 Lemma 5.4.3 proof).

The definition exposes the following operations and relations.

- `langlandsJacquet` (constructor): LJ : Groth(GL_n(F)) → Groth(GL_r(D)).
- `langlandsJacquet_character` (characterisation): Θ_{LJ(π)}(g′) = (−1)^{n−r} Θ_π(g) on corresponding regular elements.
- `langlandsJacquet_essSqInt` (simp): LJ(JL(π′)) = π′ for π′ essentially square-integrable on GL_r(D).
- `langlandsJacquet_induction` (functoriality): LJ ∘ n-Ind = n-Ind ∘ LJ_M.
- `langlandsJacquet_jacquet` (functoriality): LJ_M ∘ r_P = r_{P′} ∘ LJ for corresponding parabolics.
- `langlandsJacquet_generic_ps` (relation): LJ kills irreducible generic principal series when D ≠ F.
- `langlandsJacquet_split` (simp): For D = F, LJ = id.

**Checks.**

- `langlandsJacquet.gl2_steinberg` (computation): For n = 2, LJ(St_2) = 1_{D^×}.
- `langlandsJacquet.gl2_trivial` (computation): For n = 2, LJ(1_{GL_2}) = −1_{D^×}.
- `langlandsJacquet.principal_series` (non-example): LJ(χ_1 × χ_2) = 0 for an irreducible principal series; a map sending irreducibles to non-zero irreducibles would be wrong.
- `langlandsJacquet.split_test` (degenerate): For d = 1 the map is the identity of Groth(GL_n(F)).

**Acceptance.**

- For n = 2, D quaternion: LJ(St_2) = 1_{D^×}, LJ(1_{GL_2}) = −1_{D^×}, LJ(χ_1 × χ_2) = 0 for an irreducible principal series.
- For D = F, LJ is the identity.
- LJ(π) can be the negative of an irreducible.

*Used by:* Caraiani–Scholze 2017 Remark 5.4.1 (step (3) of Red^b_n⃗ is LJ from M_b to J_b); ET.7b/newton-reduction (ET.6a packet) (the signed normalised Newton reduction uses LJ); IgusaVarietiesAndTorsionConcentration:IG.5 (the rational Igusa trace comparison and the genericity obstruction); `ET.6/semisimple-langlands-parameter`; `ET.6/inner-form-nontransfer`.

*Needs:* `ET.6/local-jacquet-langlands`; `ET.6/zelevinsky-classification`; `ET.4/padic-character-distributions`; `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`; `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`.

### ET.6.26 Generic principal series parameters do not transfer to non-split inner forms

Node `ET.6/inner-form-nontransfer` (theorem).

Let J be a non-quasi-split inner form of a Levi M of GL_m(F) (for example J_{b_v}(F_v) when b_v has a non-integral slope), and λ = χ_1 ⊕ … ⊕ χ_m a semisimple parameter that is a sum of characters with χ_i χ_j^{-1} ≠ |·|^{±1} for i ≠ j (a generic principal series parameter). Then no irreducible smooth representation π of J has σ_π = λ (ET.6/semisimple-langlands-parameter), and LJ_M(π_M) = 0 for every irreducible π_M of M whose parameter is λ. Consequently, if a representation π_p^n⃗ of an endoscopic group of a unitary group transfers at a place p_i to a generic principal series of GL_n(F_{p_i}) while J_{b_i} is a non-quasi-split inner form of M_{b_i}, then Red^b_n⃗(π^n⃗_p) = 0 (Caraiani–Scholze 2017 Lemma 5.4.3).

The precise hypotheses are: J not quasi-split; λ generic in the stated sense.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Lemma 5.4.3 and proof, p. 741). Proves that Red^b kills representations transferring to generic principal series when J_{b_i} is a non-quasi-split inner form.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.1, proof of Corollary 5.1.3, p. 66). Uses that generic principal series parameters (no ratio equal to the cyclotomic character) do not occur for non-trivial inner forms of Levi subgroups.

By ET.6/full-wd-local-langlands, irreducible representations of M with parameter λ are irreducible generic principal series of M; LJ_M kills them (ET.6/badulescu-langlands-jacquet-map (d)), and representations of J with parameter λ would have non-zero image under the inverse correspondence.

For Red^b: the L-morphism ^LM_{G_n⃗} → ^LM_b restricts η̃, so the image of π^n⃗_p in Groth(M_b(ℚ_p)) has only generic principal series components at p_i, which lie in the kernel of LJ (Caraiani–Scholze 2017 proof of Lemma 5.4.3).

**Acceptance.**

- For M = GL_2 and J = D^×: an irreducible principal series χ_1 × χ_2 with χ_1χ_2^{-1} ≠ |·|^{±1} has no Jacquet–Langlands partner.
- If J is quasi-split (J = M) the statement is false: the principal series itself has parameter λ.
- If χ_1χ_2^{-1} = |·|, the parameter is that of Steinberg/trivial and does transfer to D^×.

*Used by:* `ET.6/acceptance-examples`.

*Needs:* `ET.6/badulescu-langlands-jacquet-map`; `ET.6/semisimple-langlands-parameter`; `ET.6/full-wd-local-langlands`.

### ET.6.27 Explicit local Langlands and Jacquet–Langlands in level zero

Node `ET.6/level-zero-explicit` (theorem).

For F/ℚ_p finite, the composite of the local Langlands correspondence (ET.6/full-wd-local-langlands) and the Jacquet–Langlands correspondence (ET.6/local-jacquet-langlands) is explicit on level-zero (depth-zero) representations: a level-zero irreducible representation of D^× (trivial on 1 + 𝔭_D) is determined by a character of 𝔽_{q^n}^× and of the uniformizer, and its image is the level-zero representation of GL_n(F) whose supercuspidal support and Weil–Deligne parameter are given by the tamely ramified induced representation from the unramified extension of degree n, with the explicit character twists of Bushnell–Henniart. In particular a character of order p of O_D^× corresponds to the Bernstein component of the representation π_{τ_s} considered by Newton–Thorne.

The precise hypotheses are: level zero (depth zero); the explicit twisting characters of Bushnell–Henniart 2011 (recorded in gap 'Bushnell–Henniart level-zero formulas not read').

([J. Newton and J. A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://annals.math.princeton.edu/2026/203-1/p04), proof of Lemma 3.6 (citing Bushnell–Henniart 2011)). Uses that the composite of local Langlands and Jacquet–Langlands is explicit on level-zero representations of D^× and identifies the Bernstein component of π_{τ_s}.

Bushnell–Henniart 2011 compute the composite correspondence on level-zero representations explicitly through tame induction and a correcting character; Newton–Thorne use it in the proof of their Lemma 3.6.

The statement here is taken from the accepted extraction of Newton–Thorne; the Bushnell–Henniart formulas themselves were not read for this plan.

**Acceptance.**

- For n = 1 the statement is the tame part of local class field theory.
- The trivial representation of D^× corresponds to Steinberg, which is not of level-zero supercuspidal type: the formula is about supercuspidal level-zero representations of GL_n(F) and the non-trivial-character part of D^×.
- A character of D^× trivial on O_D^× corresponds to an unramified twist of Steinberg.

*Needs:* `ET.6/full-wd-local-langlands`; `ET.6/local-jacquet-langlands`.

### ET.6.28 Worked checks for the local correspondence and inner forms

Node `ET.6/acceptance-examples` (application).

(1) GL_1: rec_F = local class field theory with Art_F sending uniformizers to geometric Frobenius. (2) GL_2 unramified principal series χ_1 × χ_2 (χ_1χ_2^{-1} ≠ |·|^{±1}): rec_F = χ_1 ⊕ χ_2 with N = 0, and the Satake parameters match (SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter). (3) GL_2 Steinberg and trivial: rec_F(St_2) = |·|^{-1/2} ⊗ Sp_2 (N of rank 1) and rec_F(1) = |·|^{-1/2} ⊕ |·|^{1/2} (N = 0); Scholze's semisimple σ does not distinguish them. (4) Quaternion inner form: JL(1_{D^×}) = St_2 with character sign −1; LJ(1_{GL_2}) = −1_{D^×}; LJ kills irreducible principal series (ET.6/inner-form-nontransfer). (5) Tadić: ν^α × ν^{−α} on GL_2 is unitary exactly for |α| < ½ among the irreducible complementary series. (6) Segment linking: [1, ν] × [ν, ν²]-type products are reducible exactly when the segments are linked (Zelevinsky Theorem 4.2).

The precise hypotheses are: the data of the cited nodes.

([A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), Theorem 4.2, p. 184). Gives the irreducibility criterion used in check (6).

([M. Tadić, Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf), Theorem 7.5, p. 371). Gives the complementary-series range used in check (5).

Each check specialises the named node.

**Acceptance.**

- A wrong Frobenius normalisation (1), a missing monodromy operator (3), a missing sign (4), or a wrong complementary-series range (5) is detected.

*Needs:* `ET.6/full-wd-local-langlands`; `ET.6/local-jacquet-langlands`; `ET.6/inner-form-nontransfer`; `ET.6/tadic-unitary-dual`; `ET.6/zelevinsky-classification`.

## Layers ET.6a, ET.7, ET.7a and ET.7b

These layers are planned in the ET.6a part of the roadmap (document `EndoscopicTransferAndUnitaryTraceComparison--ET.6a.md`). They consume this part as follows.

- **ET.6a**: Repoint ET.6a/lubin-tate-tower to the finite-level spaces ET.6/drinfeld-level-deformation-spaces (it currently restates the Drinfeld-level deformation functor; ET.6 needs those spaces earlier). Repoint ET.6a/tower-conventions and ET.6a/fs-normalization-contract from the stage id ET.6 to ET.6/full-wd-local-langlands and ET.6/segment-wd-parameter, and ET.6a/global-extraction to ET.4/stable-twisted-identity and ET.4/unitary-gl-base-change-descent.
- **ET.7**: Repoint ET.7/torus-measure-check, ET.7/unramified-gl2-check and ET.7/proper-endoscopy-check from the stage id ET.4 to ET.4/stable-twisted-identity, ET.4/unramified-transfers and ET.4/elliptic-stabilization, and ET.7/division-inner-form-check from ET.6 to ET.6/local-jacquet-langlands.
- **ET.7a**: Replace ET.7a/cyclic-base-change and ET.7a/cyclic-automorphic-induction by imports of ET.4/global-cyclic-base-change, ET.4/local-cyclic-base-change and ET.4/cyclic-automorphic-induction (owner moved to the proposed ET.4b; RT-AREA-langlands-1/1). Repoint ET.7a/relevant-packet-multiplicity and ET.7a/definite-indefinite-switches to ET.4/unitary-endoscopic-classification, ET.7a/gsp4-solvable-descent-interface to ET.4/gsp4-gl4-transfer, ET.7a/transferable-level to ET.4/small-level-transfer, and ET.7a/local-unitary-base-change to ET.4/local-cyclic-base-change and ET.6/full-wd-local-langlands.
- **ET.7b**: Repoint ET.7b/csnc-test-functions, ET.7b/newton-reduction, ET.7b/red-trace-duality and ET.7b/signed-igusa-trace from the stage ids ET.4/ET.5 to ET.5/igusa-endoscopic-test-function, ET.5/transfer-at-p, ET.5/unitary-igusa-trace-formula, ET.5/acceptable-functions-determine and ET.4/stable-twisted-identity; ET.7b/newton-reduction to ET.6/badulescu-langlands-jacquet-map.

## Proposed changes of structure

1. **EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer.** Confirmed RT-AREA-langlands-1/1: Scholze's proof of the local correspondence (ET.6) needs Arthur–Clozel local cyclic base change (§12), Harris–Taylor/Clozel unitary base change (§10) and automorphic induction (§§13–14) before ET.6, but ET.7a, which held them, requires ET.6. The ET.6a packet makes the same proposal. *Proposal:* Create the sub-layer ET.4b 'Cyclic base change and automorphic induction for GL_n' after ET.4 (requiring AutomorphicSpectralTheory:AS.6, ET.3 and ET.4) with the nodes ET.4/local-cyclic-base-change, ET.4/global-cyclic-base-change, ET.4/cyclic-automorphic-induction and ET.4/unitary-gl-base-change-descent of this packet; add edges ET.4b → ET.6, ET.4b → ET.7a and ET.4b → GL2AutomorphicRepresentationsAndTransfer:R17.4, which then specialises to GL_2. The ET.6a packet's ET.7a/cyclic-base-change and ET.7a/cyclic-automorphic-induction become imports of these nodes (single owner ET.4b); ET.7a keeps the unitary cohomological transfer and the residual Speh classification.

2. **EndoscopicTransferAndUnitaryTraceComparison, SmoothRepresentationsOfLocalGroups.** Confirmed RT-AREA-langlands-1/15: no stage below ET.4 and ET.6 plans Harish-Chandra's p-adic character theory, twisted characters or the Weyl integration formula. SmoothRepresentationsOfLocalGroups is a Tau Ceti roadmap and its Part II (design job DESIGN-SmoothRepresentationsOfLocalGroupsPartII) does not exist yet. *Proposal:* Plan the early character prefix once, here: ET.4/padic-character-distributions and ET.4/twisted-characters. When SmoothRepresentationsOfLocalGroupsPartII is designed, its early character layer should either import these two nodes or take them over as owner, in a tier below this roadmap, with ET.4 and ET.6 importing; either way there is one owner, and the late excursion-dependent SR.6 material stays out of the prefix.

3. **EndoscopicTransferAndUnitaryTraceComparison.** Finite-level Lubin–Tate deformation spaces with Drinfeld level structure are needed by ET.6 (Scholze 2010 §2), while ET.6a/lubin-tate-tower (ET.6a packet) restates the same deformation functor for the tower and depends on the stage ET.6. *Proposal:* ET.6/drinfeld-level-deformation-spaces owns the finite-level spaces; ET.6a/lubin-tate-tower imports it and keeps only the rigid generic fibres, the tower and its actions.

4. **EndoscopicTransferAndUnitaryTraceComparison, IgusaVarietiesAndTorsionConcentration, BunGAndNewtonStrata, AutomorphicGaloisRepresentationsPartII.** Upward citations in research/blueprint/upstream/CaraianiNewton.md: ET.5 imports accepted IG.0–IG.1 nodes (IgusaVarietiesAndTorsionConcentration, tier 19) and BG0–BG1 nodes (BunGAndNewtonStrata, outside the 94; RT-AREA-geomlanglands/32). ET.6 no longer imports AutomorphicGaloisRepresentationsPartII:AG2.1a: the Drinfeld-level point count of Scholze §9 for the division-algebra data is planned here (ET.6/division-algebra-shimura-varieties, ET.6/drinfeld-level-point-count), a different datum from AG2.1a's compact Shin instance at good reduction. *Proposal:* Place the algebraic σ-conjugacy prefix of BG0–BG1 (B(G), J_b, decent representatives, the Newton and Kottwitz maps) and the Igusa-geometry prefix IG.0–IG.1 in an early package below this roadmap in the upstream order (the BG0 split of RT-AREA-geomlanglands/32, and the ET.6a packet's proposed ET.5a), so that ET.5's imports point down; this packet does not replan those nodes. AG2.1a's raw Kottwitz count may import ET.6/drinfeld-level-point-count's pattern but is not changed here.

## Open inputs

- **Arthur's classification inputs** (needed by `ET.4/unitary-endoscopic-classification`, `ET.4/gsp4-gl4-transfer`). The endoscopic classification of unitary groups (Mok; Kaletha–Mínguez–Shin–White) and Arthur's classification for GSp_4 (Gee–Taïbi) are stated, not proved, here. Boxer–Calegari–Gee–Pilloni §1.6 (p. 8) records that Arthur's missing references are now supplied by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, and that the twisted weighted fundamental lemma remains without a published proof. Any consumer of these two nodes inherits that dependency; the primary papers (Mok 2015, KMSW, Gee–Taïbi 2019) were not read for this plan.
- **Harris–Taylor §VI and Kottwitz's simple Shimura varieties read only through citing papers** (needed by `ET.4/unitary-gl-base-change-descent`, `ET.4/simple-division-algebra-trace-identity`, `ET.6/global-galois-input`). The base change and descent statements Harris–Taylor Lemma VI.2.10, Theorem VI.2.9 and Corollaries VI.2.7–VI.2.8, and Kottwitz's results on simple Shimura varieties (Invent. Math. 108, 1992), are planned from their statements as used in Scholze 2010 §§8–10 and Shin 2011 §6.2. The Harris–Taylor book is not freely available and is not in the cleared library (the same source-access request as the ET.6a packet). The proofs must be matched with internal locators once a copy is registered; Labesse's Changement de base CM et séries discrètes (2011) is the public alternative for the unitary base change.
- **Primary sources cited through secondary statements** (needed by `ET.4/tamagawa-number-formula`, `ET.4/elliptic-stabilization`, `ET.4/twisted-trace-formula`, `ET.4/twisted-geometric-side`, `ET.4/archimedean-lefschetz-functions`, `ET.6/local-jacquet-langlands`, `ET.6/badulescu-langlands-jacquet-map`, `ET.6/supercuspidal-bijection`, `ET.6/non-galois-automorphic-induction`, `ET.6/drinfeld-level-deformation-spaces`). These nodes rest on primary texts that were cited here through their statement in a read source rather than read themselves: Kottwitz 1988 (Tamagawa numbers) and Kottwitz 1986 Theorem 9.6 (stabilization of elliptic terms) through Shin 2010–2011; Arthur 1988 (invariant trace formula, twisted form, Theorem 7.1(b), Corollary 7.4, Proposition 9.1) and Morel 2010 (Proposition 8.2.3, Lemmas 8.3.6, 8.4.1–8.4.2) through Caraiani–Scholze non-compact §§5.4–5.5; Labesse 1991 (twisted Lefschetz functions) through Shin 2011 §4.3; Deligne–Kazhdan–Vignéras 1984 and Badulescu 2007 through ET.3/inner-form-transfer and Caraiani–Scholze 2017 Lemma 5.4.3; Henniart's numerical correspondence and characterization by ε-factors of pairs, Harris 1998 (non-Galois automorphic induction), Drinfeld 1974 and Mieda through Scholze 2010. A lemma-level pass must read each at its locator.
- **Bushnell–Henniart level-zero formulas not read** (needed by `ET.6/level-zero-explicit`). The explicit level-zero composite of local Langlands and Jacquet–Langlands (Bushnell–Henniart, J. Number Theory 2011) is stated from its use in Newton–Thorne 2026 (proof of Lemma 3.6) as recorded by the accepted extraction; the twisting characters were not read and the node's statement is only as precise as that use.
- **Truncated constituent criterion beyond degree one** (needed by `ET.6/ladder-and-constituent-theorems`). Atobe–Kondo–Yasuda Lemma 6.6 is printed for general multisegments, but its proof by derivatives of order |m| needs the sum of cuspidal degrees in place of the cardinality off a degree-one line (as noted by the accepted extraction). Only the degree-one (type-χ) form, which is the one used in their §6.3, is planned; the general form needs a degree-weighted statement and proof. The Atobe–Kondo–Yasuda paper itself was not reopened for this plan; its locators are those of the accepted extraction.

## Mistakes found in the sources

- **EndoscopicTransferAndUnitaryTraceComparison/E2** (misprint; [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, definition of 𝒢^+_n⃗, p. 72 (arXiv:1909.01898v2)). The source defines θ by θ(λ, g)θ^{-1} = (λ^c, λ^c g^♯) with g^♯ = Φ_n⃗ ᵗg^c Φ_n⃗^{-1}, i.e. without an inverse. Correction: g^♯ = Φ_n⃗ ᵗ(g^c)^{-1} Φ_n⃗^{-1}, as in Shin 2011 §4.1 before (4.2), where the map is g ↦ Φ_n⃗ ᵗg^{−c} Φ_n⃗^{-1}. Reason: θ must be an automorphism of order 2 whose fixed points are the unitary similitude group G_n⃗; without the inverse, g ↦ Φ ᵗg^c Φ^{-1} is an anti-automorphism (it reverses products), so θ would not be a group automorphism. Status: The same slip in Caraiani–Scholze 2017 §5.3 p. 736 is recorded as erratum E69 of the accepted extraction PAPER-CARAIANI-SCHOLZE-17; for the non-compact sequel it is new here.

## Sources

- [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2). arXiv:1909.01898v2 (22 November 2023), 90 pp.; printed page = PDF page; published Ann. of Math. 199 (2024). Read 2026-10-14. Sections used: §5.1 Statements, pp. 64–67; §5.2 Unitary groups and endoscopic triples, pp. 67–68; §5.3 A stable trace formula, p. 68; §5.4 Base change and compatibility of transfers, pp. 69–72; §5.5 The twisted trace formula, pp. 72–74; §5.6 Construction of test functions, pp. 74–76.
- [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Ann. of Math. 186 (2017), 649–766, published PDF; printed page = PDF page + 648. Read 2026-10-14. Sections used: §5.2, pp. 732–735; §5.3, pp. 735–738; §5.4, pp. 739–741; §5.5, pp. 741–743.
- [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf). Author's copy (IgusaVar.pdf, 44 pp.) of Duke Math. J. 146 (2009), 509–568; locators give the author copy's section numbers and its printed pages (printed page = PDF page − 1). Read 2026-10-14. Sections used: §6 From trace to counting points; §7 F_p-points of Igusa varieties; §8 Honda–Tate theory; §10 Kottwitz triples and Kottwitz invariants; §§11–13.
- [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf). Author's copy (StableIgusa.pdf, 30 pp.) of J. Inst. Math. Jussieu 9 (2010), 847–895; printed page = PDF page. Read 2026-10-14. Sections used: §1.2 (display (1.2)); §2.7; §3 More background (§§3.1–3.4); §4 Pre-stabilized counting point formula; §5 Stabilization away from p; §6 Stabilization at p; §7 End of stabilization; §8.
- [S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf). Author's copy (StableGal.pdf, 62 pp.) of Ann. of Math. 173 (2011), 1645–1741; printed page = PDF page. Read 2026-10-14. Sections used: §3 Endoscopy of unitary similitude groups; §4 Twisted trace formula and base change; §5.3–5.6; §6.1–6.2.
- [P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1). arXiv:1010.1540v1, 37 pp.; printed page = PDF page; published Invent. Math. 192 (2013), 663–715. Read 2026-10-14. Sections used: §1 Introduction (Theorems 1.1–1.4); §2 Deformation spaces; §3 Types; §4 Norm maps; §§5–6 Descent; §7 Comparison of two functions; §8 Shimura varieties; §9 Counting points; §10 Galois representations; §11 Lubin–Tate tower; §12 Bijectivity; §13 Non-Galois automorphic induction; §14 L- and ε-factors.
- [J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf). Annals of Mathematics Studies 120, Princeton University Press, 1989; scan hosted in the Arthur archive of the Clay Mathematics Institute; locators give printed pages (printed = PDF − 15). Read 2026-10-14. Sections used: Ch. 1 §1 (norm map), §2 (twisted characters), §6 (local base change), pp. 3–71; Ch. 3 §§1–6 (global base change and automorphic induction), pp. 199–220.
- [A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf). Ann. Sci. École Norm. Sup. (4) 13 (1980), 165–210; Numdam copy, printed page = PDF page + 163. Read 2026-10-14. Sections used: §3 Segments; §4 Irreducibility criterion; §6 Classification; §§7–9; §10 Reciprocity law.
- [M. Tadić, Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf). Ann. Sci. École Norm. Sup. (4) 19 (1986), 335–382; Numdam copy, printed page = PDF page + 334. Read 2026-10-14. Sections used: Introduction, Theorems A–D, p. 339; §7 Unitary dual, pp. 368–371; Appendix, Theorem A.10, p. 378.
- [R. E. Kottwitz, Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf). In Harmonic Analysis, the Trace Formula, and Shimura Varieties, Clay Math. Proc. 4 (2005), 393–522; whole-volume PDF from the Clay Mathematics Institute, locators give the volume's printed pages. Read 2026-10-14. Sections used: Introduction, pp. 393–397 (Harish-Chandra's character theorem); §7 Weyl integration formula, pp. 421–423.
- [J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf). Astérisque 257 (1999), vi + 116 pp.; Numdam copy. Read 2026-10-14. Sections used: §2.5 (Proposition 2.5.3); §3.3 (Théorème 3.3.1, Proposition 3.3.2); §4.3 (Proposition 4.3.2, Théorème 4.3.4).
- [G. Boxer, F. Calegari, T. Gee and V. Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1). arXiv:2502.20645v1 (28 February 2025), 230 pp.; printed page = PDF page. Read 2026-10-14. Sections used: §1.6 (status of Arthur's classification), p. 8; §1.8.22 Transfer between GL4 and GSp4, p. 15; §7.5.3, pp. 175–179.
- [Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Invent. Math. 228 (2022), 107–375; the NSF Public Access Repository copy (the maintainer-cleared copy). Read 2026-10-14 for Appendix C.3 and D.2 only. Sections used: Appendix C.3 (Proposition C.3.1); Appendix D.2 (Lemma D.2.2, Proposition D.2.3).
- [H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/journals/forum-of-mathematics-pi). Forum Math. Pi 10 (2022); locators as recorded by the accepted extraction PAPER-ATOBE-KONDO-YASUDA-22 (§2.1 pp. 5–6, §§2.3–2.6, Example 2.5, §6.1, Lemmas 6.5–6.6); the paper itself was not reopened for this plan. Sections used: not reopened; extraction items segment, multisegment, truncation, ladder, speh, wd-ram, ladder-determinant, constituent-one, derivative-constituent.
- [J. Newton and J. A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://annals.math.princeton.edu/2026/203-1/p04). Ann. of Math. 203 (2026), no. 1; locator as recorded by the accepted extraction PAPER-NEWTON-THORNE-26 (proof of Lemma 3.6, citing Bushnell–Henniart 2011); not reopened. Sections used: not reopened; extraction item bh11-level-zero.
