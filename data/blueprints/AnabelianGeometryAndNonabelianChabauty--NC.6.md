# NC.6 — Sections, rational points and the conjectural frontiers

This layer is the end of the anabelian and nonabelian Chabauty roadmap. The earlier layers build the objects: path torsors and sections (NC.0), profinite reconstruction (NC.1), unipotent fundamental groups (NC.2), Selmer varieties (NC.3), Chabauty–Kim loci and the finiteness criterion (NC.4), and quadratic Chabauty (NC.5). NC.6 states, precisely and with all hypotheses, the statements that connect these objects to rational points and that are still conjectural, together with everything currently proved about them. There are three frontiers.

- **The profinite frontier.** A rational point of a curve gives a conjugacy class of sections of the arithmetic fundamental group. The section map is injective for curves of genus at least one over number fields; Grothendieck's section conjecture asks that it be bijective for curves of genus at least two.
- **The dimension frontier.** Kim's finiteness argument (NC.4) needs a depth n at which the Selmer variety has smaller dimension than the de Rham period space. Kim conjectures that such a depth exists (Conjecture 1), reduces it to the vanishing of strict Selmer groups of tensor powers (Conjecture 2), and shows that Conjecture 2 follows from the Bloch–Kato conjecture or from a weight-filtration form of the Fontaine–Mazur conjecture; for affine curves Conjecture 1 also follows from a weak form of Jannsen's conjecture, and for punctured CM elliptic curves from a pseudo-nullity conjecture of Coates and Sujatha. Conjecture 1 is known for the thrice-punctured line, and a refined form gives finiteness for punctured CM elliptic curves of Selmer rank one.
- **The eventual-equality frontier.** Kim's conjecture, as formulated by Balakrishnan, Dan-Cohen, Kim and Wewers, asks that the nested Chabauty–Kim loci with stringent local conditions eventually equal the set of integral points. Its depth-one case for the thrice-punctured line is a theorem.

Every conjecture is a named proposition. No conjecture is assumed as an axiom, and every result that uses one lists it among its hypotheses, so a conditional theorem stays visibly conditional all the way to its conclusion.

The layer is **planned**: the companion [packet](../packets/AnabelianGeometryAndNonabelianChabauty--NC.6.json) is a complete target-level pass with eighteen nodes, whose prerequisite chains end in Mathlib, in nodes of other roadmaps, in three requested supplier statements, or in three recorded source gaps. The [suggested file](../suggested/AnabelianGeometryAndNonabelianChabauty--NC.6.lean) states the parts whose carriers exist at the pins. Nothing is claimed to be formalised.

## Scope and boundaries

The stage text of this layer also asks for the outputs of NC.1–NC.5 to be exported to the certified enumeration of EffectiveDiophantineMethods ED.6, with explicit equations and precision requirements. That instruction states no new mathematics. Each output already has its owner: reconstruction is NC.1, unipotent groups and comparisons NC.2, Selmer varieties NC.3, unipotent Albanese maps and finite loci NC.4, quadratic Chabauty equations NC.5, and precision, candidate comparison and global certificates ED.6, which depends directly on NC.5. This layer therefore plans no export node, and the packet proposes narrowing the stage to the frontier statements below.

What this layer does not contain:

- Profinite reconstruction (Mochizuki's Isom and Hom theorems): NC.1. The section conjecture concerns morphisms from Spec k, which the Hom theorems for dominant maps do not cover.
- The arithmetic fundamental group, its exact sequence and the section of a rational point: InverseGaloisAndArithmeticFundamentalGroups IG.0–IG.1. Path torsors, transported sections and their cocycles: NC.0.
- The Selmer varieties and their representability, and the finiteness theorem at a given depth: NC.3 and NC.4. This layer quantifies over depths and supplies the dimension inputs.
- Computation and certification of rational points: EffectiveDiophantineMethods ED.4–ED.6.
- The cuspidal section conjecture for affine curves, the birational and p-adic section conjectures, Coates–Kim's unconditional results for CM Jacobians, and the S-unit computations of Dan-Cohen and Wewers are different statements and are not targets of this layer.

## Conventions

**Fields and Galois groups.** For a field k, k^s is a separable closure and Γ_k = Gal(k^s/k), a profinite group. For a number field F and a finite set T of places containing the archimedean places, the places above p and the bad places, G_T is the Galois group of the maximal extension unramified outside T and G_w ⊆ G_T a decomposition group at w ∈ T. Cohomology is continuous cohomology; Q_p-coefficients mean limits of finite coefficients tensored with Q_p, as in ArithmeticGaloisDuality.

**Sections.** For a quasi-compact geometrically connected k-scheme X with geometric point x̄, π = π_1^ét(X, x̄), Δ = π_1^ét(X_{k^s}, x̄) and pr: π → Γ_k is the projection. A section is a continuous homomorphism s: Γ_k → π with pr ∘ s = id. Sections are identified up to conjugation by Δ, never by all of π acting naively; Kim's action of π, which conjugates in π and in Γ_k at once, has the same orbits. With a reference section s_0, the class of s corresponds to the class of the cocycle σ ↦ s(σ)s_0(σ)⁻¹ in H¹(Γ_k, Δ) with Γ_k acting through s_0.

**Kummer sign.** For an abelian variety A and a ∈ A(k), the Kummer class δ_n(a) is represented by σ ↦ σ(b) − b with nb = a. With this sign, the difference cocycle s_a s_0⁻¹ of the sections attached to a and the origin equals δ_n(a).

**Depth.** U is the Q_p-unipotent étale fundamental group of the curve over the algebraic closure at the base point, Γ_1U = U and Γ_{n+1}U = [U, Γ_nU]. Depth n means U⟨n⟩ = U/Γ_{n+1}U, so depth 1 is the abelianisation H₁ and depth n is Kim's U_{n+1} and BDCKW's U_n. The graded piece gr_n U = Γ_nU/Γ_{n+1}U has dimension d_n. The same indexing applies to the de Rham group U_dR with its Hodge filtration F⁰.

**Local conditions.** Three systems appear and are never confused. Kim's Selmer variety S_n = H¹_f(G_T, U⟨n⟩) imposes only the crystalline condition at p. BDCKW's Sel_n(𝒳) imposes, in addition, at each prime v ≠ p, that the localisation lie in the image of the local unipotent Kummer map of 𝒳(Z_v) (stringent conditions). Kim's refined Selmer variety Sel_T(U⟨n⟩) for punctured CM curves imposes potentially unramified conditions at the primes of T other than p and potentially crystalline conditions at p. Finer conditions give closed subschemes and smaller loci (NC.4/locus-compatibilities).

**Homology and cohomology.** H¹ = H¹_ét(X_{F̄}, Q_p) and H₁ = (H¹)^∨, the abelianisation of U. The graded pieces gr_n U are quotients of H₁^{⊗n}. Kim's Conjecture 2 is about V_n = (H¹)^{⊗n}(1), the Tate dual of H₁^{⊗n}.

**Conjectures.** A conjecture is a definition of a proposition (`SectionConjecture`, `KimDimensionConjecture`, `SelmerVanishing`, `KimConjecture`). A theorem that uses one has it as a hypothesis. Hypotheses that are themselves conjectures of other areas (Bloch–Kato, Fontaine–Mazur, Jannsen, Coates–Sujatha, finiteness of Ш) are written into the hypotheses of the theorem that uses them, in the exact form used.

## Sources

- Minhyong Kim, *The unipotent Albanese map and Selmer varieties for curves*, Publ. RIMS **45** (2009), 89–133 ([publisher PDF](https://ems.press/content/serial-article-files/41066?nt=1), [arXiv:math/0510441](https://arxiv.org/abs/math/0510441)). Locators are printed pages of the published version: the introduction pp.89–96, §3 pp.120–126 and §4 pp.127–131.
- Jennifer S. Balakrishnan, Ishai Dan-Cohen, Minhyong Kim and Stefan Wewers, *A non-abelian conjecture of Tate–Shafarevich type for hyperbolic curves*, [arXiv:1209.0640v4](https://arxiv.org/abs/1209.0640v4) (published in Math. Ann. 372 (2018)); cited as BDCKW with v4 pagination: §§1–3 pp.1–15, §§6–8 pp.43–49.
- Jakob Stix, *On cuspidal sections of algebraic fundamental groups*, [arXiv:0809.0017v1](https://arxiv.org/abs/0809.0017v1) (published in Adv. Stud. Pure Math. 63 (2012)); §1.1 pp.1–2 and Appendix B p.22.
- Minhyong Kim, *The motivic fundamental group of P¹ ∖ {0, 1, ∞} and the theorem of Siegel*, [arXiv:math/0409456v1](https://arxiv.org/abs/math/0409456v1) (published in Invent. Math. 161 (2005)); introduction and §3 pp.17–18.
- Marco Linton and Carl-Fredrik Nyberg-Brodda, *The theory of one-relator groups: history and recent progress*, [arXiv:2501.18306](https://arxiv.org/abs/2501.18306), §1.7, p.65, for Labute's rank formula.

All statements below are in our own words, with theorem, section and page locators.

## Layer map

```text
IG.1 sections ── NC.0 paths ── section-classes ── section-class-map ── kummer-section-comparison
                                                         │                       │
                                                         └── section-map-injective ── section-conjecture

NC.2 central series ── graded-central-dimensions ──┬── h2-growth-bound ── vanishing-implies-dimension
NC.3 Selmer, NC.4 finiteness ── kim-dimension-conjecture ┤      ▲
selmer-vanishing-conjecture ─────────────────────────────┴──────┘
   ▲ bloch-kato-implies-vanishing, weight-splitting-implies-vanishing
kim-dimension-conjecture ◄── weak-jannsen-implies-dimension, pseudo-null-implies-dimension,
                             genus-zero-dimension, cm-rank-one-finiteness (refined form)

NC.4 loci ── kim-conjecture ── thrice-punctured-depth-one
```

All node ids below have the prefix `AnabelianGeometryAndNonabelianChabauty:NC.6/`. Prerequisites are listed with that prefix removed for this layer's nodes and in full for other layers and roadmaps.

## Part A. Sections and Grothendieck's section conjecture

Part A works over an arbitrary field k for the definitions and over number fields for the theorems. It takes the arithmetic fundamental group and the section of a rational point from InverseGalois IG.1, path torsors and transported sections from NC.0, and nonabelian H¹ from NC.3, and adds what none of them states: the set of section classes as an object, the section map as a map, its injectivity, and the conjecture.

### 1. Conjugacy classes of Galois sections

Node `section-classes` · definition · Planet **Galois sections**.

Let k be a field with separable closure k^s and Γ_k = Gal(k^s/k), and let X be a quasi-compact geometrically connected k-scheme with a geometric point x̄ of X_{k^s}. Write π = π_1^ét(X, x̄), Δ = π_1^ét(X_{k^s}, x̄) and pr: π → Γ_k for the projection of the arithmetic exact sequence 1 → Δ → π → Γ_k → 1 (IG.1). A section is a continuous group homomorphism s: Γ_k → π with pr ∘ s = id. The geometric kernel acts on sections by (δ·s)(σ) = δ s(σ) δ⁻¹. The set of sections modulo this action is Sect(X/k). Equivalently, π acts by γ·s = c_γ ∘ s ∘ c_{pr(γ)⁻¹} (conjugation c_γ), and this action has the same orbits, because π = Δ·s(Γ_k) and s(τ) acts trivially on s. A change of geometric base point along an étale path induces a bijection of the sets of classes that does not depend on the path, so Sect(X/k) depends only on X/k up to canonical bijection. When a reference section s_0 is fixed, s ↦ [σ ↦ s(σ) s_0(σ)⁻¹] identifies Sect(X/k) with the nonabelian H¹(Γ_k, Δ) of NC.3, where Γ_k acts on Δ by conjugation through s_0; the class of s_0 goes to the base point.

**Hypotheses.**

- k any field; X quasi-compact and geometrically connected over k, so that the sequence of IG.1 is exact.
- Sections are continuous homomorphisms of profinite groups; the equivalence relation is conjugation by the geometric kernel Δ only.
- No hyperbolicity or properness is assumed in the definition; those hypotheses enter the theorems that use it.

**Construction.**

1. Import the exact sequence 1 → Δ → π → Γ_k → 1 and its continuity from IG.1/arithmetic-exact-sequence.
2. Check that δ·s is again a continuous section (pr kills Δ) and that this is a group action; take orbits with Mathlib's orbit quotient.
3. Show that Kim's π-action has the same orbits: write γ = δ s(τ) and compute c_{s(τ)} ∘ s ∘ c_{τ⁻¹} = s.
4. Base-point change: an étale path p: x̄ → x̄' gives compatible isomorphisms of π and Δ (IG.0); a second path differs by an element of Δ, which acts trivially on classes.
5. With a reference section s_0, the difference σ ↦ s(σ)s_0(σ)⁻¹ is a continuous 1-cocycle for the s_0-twisted action, conjugation by δ changes it by the coboundary of δ, and every cocycle c gives the section c·s_0; this is the bijection with H¹(Γ_k, Δ) (NC.3/nonabelian-h1, NC.0/reference-section-change).

**Uses.**

- Kim 2009, Introduction p.90: The section conjecture is a bijection from X(F) onto this set.
- Stix 2008, Conjecture 1 (p.1) and Theorem 45 (p.22): Both the conjecture and the injectivity theorem are statements about maps into S_{π1}(X/k).
- BDCKW §3.4, p.13: The H¹ form is compared with the unipotent Selmer schemes of Kim's conjecture.
- NC.6/section-class-map, NC.6/section-map-injective, NC.6/section-conjecture: Target of the section map, of the injectivity theorem and of the conjecture.

**Planning API.**

- `SectionClasses.mk` (constructor): The class [s] ∈ Sect(X/k) of a continuous section s of pr.
- `SectionClasses.mk_eq_mk_iff` (characterisation): [s] = [t] if and only if t = δ s δ⁻¹ for some δ in the geometric kernel Δ.
- `SectionClasses.orbit_eq_kim` (compatibility): The orbits of Kim's action of the whole group π (γ·s = c_γ ∘ s ∘ c_{pr(γ)⁻¹}) are exactly the Δ-conjugacy classes.
- `SectionClasses.equivH1` (equivalence): For a fixed section s_0, the map [s] ↦ [σ ↦ s(σ)s_0(σ)⁻¹] is a bijection Sect(X/k) ≅ H¹(Γ_k, Δ) with Γ_k acting through s_0, sending [s_0] to the base point.
- `SectionClasses.map` (functoriality): A k-morphism f: X → Y with compatible geometric base points induces Sect(X/k) → Sect(Y/k), independent of the path chosen to compare base points, with map_id and map_comp.
- `SectionClasses.restrict` (functoriality): For a finite separable extension k'/k, restriction of a section to Γ_{k'} gives Sect(X/k) → Sect(X_{k'}/k'), compatible with map.
- `SectionClasses.basepointEquiv` (compatibility): An étale path x̄ → x̄' induces a bijection of the sets of classes; two paths induce the same bijection.
- `GaloisSection.diff` (data): The difference cocycle σ ↦ s(σ)s_0(σ)⁻¹ of two sections, with values in the geometric kernel Δ.
- `GaloisSection.diff_mul` (relation): diff(στ) = diff(σ) · s_0(σ) diff(τ) s_0(σ)⁻¹: the difference is a 1-cocycle for the conjugation action through s_0.
- `SectionClasses.map_mk` (simp): SectionClasses.map f [s] = [f ∘ s] for a morphism of extensions f over Γ_k.

**Unit tests.**

- `SectionClasses.spec_field_unique` (degenerate): For X = Spec k, Sect(X/k) has exactly one element, the class of the identity section of π = Γ_k.
- `SectionClasses.projectiveLine_unique` (computation): For X = P¹_k, Sect(X/k) has exactly one element, because the geometric kernel is trivial.
- `SectionClasses.gm_kummer` (compatibility): For char k = 0 and X = G_{m,k} with the reference section of the point 1, SectionClasses.equivH1 identifies Sect(G_m/k) with H¹(k, Ẑ(1)), and Kummer theory identifies this with the profinite completion lim_n k^×/k^{×n}.
- `SectionClasses.raw_sections_not_classes` (non-example): For X = G_{m,Q}, a section s and its conjugate δ s δ⁻¹ by δ ∈ Ẑ(1) with δ² ≠ 1 differ as homomorphisms (complex conjugation acts on Ẑ(1) by inversion, so the difference cocycle δ·σ(δ)⁻¹ is nontrivial at σ = c) but have the same class: a definition that forgets the quotient is wrong.

**Acceptance.**

- For X = Spec k the kernel Δ is trivial, π = Γ_k, and Sect(Spec k/k) has exactly one element.
- For X = P¹_k the kernel Δ is trivial (P¹ is simply connected over k^s), so Sect(P¹/k) is one point although P¹(k) is infinite when k is.
- For X = G_{m,k} in characteristic zero Δ = Ẑ(1) and Sect(G_m/k) ≅ H¹(k, Ẑ(1)) ≅ lim_n k^×/k^{×n} by Kummer theory.

**Prerequisites.** `InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-exact-sequence`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/basepoint-and-components`, `AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1`, `AnabelianGeometryAndNonabelianChabauty:NC.0/reference-section-change`, `mathlib:ContinuousMonoidHom`, `mathlib:MulAction.orbitRel.Quotient`.

**Sources.**

- Kim 2009, Introduction, p.90. Defines the set of splittings of the arithmetic sequence modulo conjugation by the whole fundamental group, acting through the projection, as the target of the section map.
- Stix 2008, §1.1, p.1. Defines S_{π1}(U/k) as the set of sections up to conjugation by the geometric fundamental group and explains why only classes are well defined.
- BDCKW, §1.2, p.2 and §3.4, p.13. Writes the same target as the nonabelian H¹(G, π_1^ét(X̄, b)) using the path torsors from a rational base point.

### 2. The section map of rational points

Node `section-class-map` · construction.

For X/k as in section-classes and x ∈ X(k), the k-rational point gives a section s_x of π_1^ét(X, x̄_x) → Γ_k for a geometric point x̄_x over x (IG.1), whose image is a decomposition group of a point of the universal pro-étale cover over x. Transporting s_x along any étale path x̄_x → x̄ (NC.0/transferred-endpoint-section) gives a section of pr whose Δ-conjugacy class does not depend on the path. The section map is κ_X: X(k) → Sect(X/k), x ↦ [s_x]. If b ∈ X(k) is a reference point and Sect(X/k) is identified with H¹(Γ_k, Δ) through s_b, then κ_X(x) is the class of the Γ_k-equivariant Δ-torsor of étale paths from b to x (NC.0/arithmetic-geometric-paths). The map is natural for k-morphisms and compatible with restriction to finite separable extensions. κ_X(x) = κ_X(y) holds exactly when the path torsor P(x, y) has a Γ_k-fixed path (NC.0/path-section-comparison).

**Hypotheses.**

- X quasi-compact and geometrically connected over k; x ∈ X(k).
- The map uses only rational points. Tangential base points give cuspidal sections of open curves (IG.1/tame-tangential-fiber) that are not values of κ_X on X(k).

**Construction.**

1. A k-point x: Spec k → X induces Γ_k = π_1(Spec k) → π_1(X, x̄_x), a section by functoriality (IG.1).
2. Transport along a path p: x̄_x → x̄ gives p s_x p⁻¹; replacing p by p·h with h ∈ Δ conjugates the result by h (NC.0/transferred-endpoint-section).
3. With reference b, the difference cocycle of the transported s_x against s_b is the cocycle of the path torsor P(b, x) (NC.0/arithmetic-path-cocycle).
4. Naturality follows from functoriality of path torsors and sections (NC.0/arithmetic-path-functoriality).

**Uses.**

- Kim 2009, Introduction p.90: Grothendieck's conjecture asserts that this map is bijective.
- Stix 2008, Theorem 45 (p.22): Injectivity of this map for subvarieties of abelian varieties over fields without divisible points.
- NC.6/kummer-section-comparison: Its abelianisation for an abelian variety is the Kummer map.
- NC.6/section-conjecture: The conjecture is the bijectivity of κ_X.

**Planning API.**

- `sectionClassMap_eq_pathTorsor` (characterisation): With a reference point b, κ_X(x) corresponds under SectionClasses.equivH1 to the class of the path torsor P(b, x) in H¹(Γ_k, Δ).
- `sectionClassMap_base` (simp): Under the identification with H¹ through s_b, κ_X(b) is the base point.
- `sectionClassMap_natural` (functoriality): For a k-morphism f: X → Y, κ_Y ∘ f = SectionClasses.map f ∘ κ_X on X(k).
- `sectionClassMap_restrict` (functoriality): For finite separable k'/k, SectionClasses.restrict ∘ κ_X = κ_{X_{k'}} ∘ (X(k) → X(k')).
- `sectionClassMap_eq_iff` (characterisation): κ_X(x) = κ_X(y) if and only if the Γ_k-equivariant torsor of geometric paths from x to y has a Γ_k-fixed element.

**Unit tests.**

- `sectionClassMap_spec_field` (degenerate): For X = Spec k the section map is the bijection between one-point sets.
- `sectionClassMap_projectiveLine_not_injective` (non-example): For X = P¹_Q, κ_X(0) = κ_X(1) although 0 ≠ 1, since Sect(P¹/Q) is a point; hyperbolicity is needed for injectivity.
- `sectionClassMap_gm_eq_kummer` (compatibility): For X = G_{m,Q} with reference point 1, κ_X is the Kummer map Q^× → lim_n Q^×/Q^{×n}; it is injective because Q^× = {±1} × (free abelian group) has no nontrivial element divisible by every n, and κ_X(−1) ≠ κ_X(1) since −1 is not a square.
- `sectionClassMap_gm_not_surjective` (computation): For X = G_{m,Q}, κ_X is not surjective: Q^× is countable while lim_n Q^×/Q^{×n} is uncountable.

**Acceptance.**

- For X = Spec k, κ_X is the unique map from a point to a point.
- For X = P¹_k with k infinite, κ_X is constant and not injective.
- For X = G_{m,k} with reference b = 1, κ_X(a) is the Kummer class of a ∈ k^×.

**Prerequisites.** `section-classes`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-exact-sequence`, `AnabelianGeometryAndNonabelianChabauty:NC.0/transferred-endpoint-section`, `AnabelianGeometryAndNonabelianChabauty:NC.0/arithmetic-geometric-paths`, `AnabelianGeometryAndNonabelianChabauty:NC.0/arithmetic-path-cocycle`, `AnabelianGeometryAndNonabelianChabauty:NC.0/path-section-comparison`, `AnabelianGeometryAndNonabelianChabauty:NC.0/arithmetic-path-functoriality`.

**Sources.**

- Kim 2009, Introduction, p.90. Constructs the class of a splitting from a rational point by transporting the induced map on fundamental groups along an étale path, and notes the independence up to conjugacy.
- Stix 2008, §1.1, p.1. A rational point yields a section whose image is a decomposition group, well defined up to geometric conjugation.
- BDCKW, §1.2, p.2. Describes the same map as x ↦ the class of the torsor of étale paths from b to x.

### 3. Sections of an abelian variety and the Kummer map

Node `kummer-section-comparison` · comparison.

Let A/k be an abelian variety and n ≥ 1 invertible in k. Multiplication by n is a finite étale Galois cover A → A with group A[n](k^s); it defines a quotient π_1(A/k) → π^{[n]}(A/k), an extension of Γ_k by A[n](k^s). For a ∈ A(k), let s_a and s_0 be the images in π^{[n]}(A/k) of sections attached to a and to the origin. Then the difference cocycle σ ↦ s_a(σ) s_0(σ)⁻¹, with values in A[n](k^s), represents the Kummer class δ_n(a) ∈ H¹(k, A[n]) of RP.1/kummer-map, with the sign convention δ_n(a)(σ) = σ(b) − b for any b with nb = a. Passing to the limit over n, the image of κ_A(a) − κ_A(0) in H¹(k, T̂A), T̂A = lim_n A[n](k^s), is the profinite Kummer class of a. For a curve X with a rational point b and Jacobian J, combining with the Abel–Jacobi map ι_b and SF.3/tate-module-etale-h1, the abelianised section map of X is x ↦ Kummer class of [x − b].

**Hypotheses.**

- A abelian variety over k; n invertible in k (all n when char k = 0).
- Sign convention: Kummer cocycle σ(b) − b with nb = a, equal to the difference cocycle s_a s_0⁻¹.

**Proof outline.**

1. Identify the fibre of [n]: A → A over 0 with A[n](k^s); s_0 acts on it through the natural Galois action.
2. To let s_a act on the fibre over 0, choose the path from 0 to a given on the cover [n] by translation by a fixed b with nb = a.
3. Compute s_a(σ)(P) = −b + σ(P + b) = σ(P) + (σ(b) − b), so s_a(σ)s_0(σ)⁻¹ is translation by σ(b) − b, a Kummer cocycle (RP.1/kummer-map).
4. Compatibility of the covers [nm] → [n] gives the inverse limit statement; for Jacobians use the Abel–Jacobi functoriality of sections and the identification of T̂J with the abelianised geometric fundamental group (SF.3/tate-module-etale-h1).

**Acceptance.**

- For E: y² = x³ − x over Q and a = (0, 0), δ_2(a) ≠ 0 because E(Q) = E[2](Q) ≅ (Z/2)² and so 2E(Q) = 0; hence the images of s_a and s_0 in π^{[2]}(E/Q) are not conjugate.
- For a = 0 the difference cocycle is trivial and δ_n(0) = 0.

**Prerequisites.** `section-class-map`, `HeightsRationalPointsAndObstructions:RP.1/kummer-map`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1/arithmetic-exact-sequence`, `AnabelianGeometryAndNonabelianChabauty:NC.0/arithmetic-path-cocycle`, `SchemeAndStackFoundations:SF.3/tate-module-etale-h1`, `HeightsRationalPointsAndObstructions:RP.6/curve-in-jacobian`.

**Sources.**

- Stix 2008, Appendix B, Proposition 44 and proof, p.22. Shows that the Kummer boundary of a rational point is represented by the difference cocycle of its section and the origin's section in the mod-n quotient, by computing the action on the fibre of multiplication by n.

### 4. Injectivity of the section map

Node `section-map-injective` · theorem · Planet **Injectivity of the section map**.

Let k be a field such that, for every abelian variety A/k, the group A(k) has no nonzero element divisible by every n ≥ 1 invertible in k. If X/k is a geometrically connected variety that admits an immersion into an abelian variety over k, then κ_X: X(k) → Sect(X/k) is injective. Consequently, for a number field k and a smooth projective geometrically connected curve X/k of genus g ≥ 1 (in particular for every proper hyperbolic curve, g ≥ 2), the section map κ_X is injective. The same holds for finite extensions of Q_p, where A(k) is a compact p-adic Lie group with no nonzero divisible elements.

**Hypotheses.**

- The divisibility hypothesis concerns all abelian varieties over k; over a number field it follows from the Mordell–Weil theorem.
- For a curve, X(k) = ∅ makes the statement empty; otherwise a rational point b gives the Abel–Jacobi closed immersion X → J for g ≥ 1.

**Proof outline.**

1. If X(k) is empty there is nothing to prove; otherwise fix an immersion ι: X → A over k (for a curve, the Abel–Jacobi map at b, RP.6/curve-in-jacobian).
2. By naturality of the section map (sectionClassMap_natural) it suffices to show injectivity for A, since ι is injective on k-points.
3. If κ_A(x) = κ_A(y), then for every n the images in π^{[n]}(A/k) are conjugate, so by NC.6/kummer-section-comparison δ_n(x − y) = 0, that is x − y ∈ nA(k) for all n.
4. By hypothesis x − y = 0. Over a number field A(k) is finitely generated (RP.1/mordell-weil), and a finitely generated abelian group has no nonzero element divisible by every n: write it as Z^r ⊕ (finite) and take n a multiple of the torsion exponent.

**Acceptance.**

- Elliptic curves over Q: for E: y² = x³ − x, the four rational points have pairwise distinct section classes.
- The non-example P¹_Q (no immersion into an abelian variety, κ constant) shows the immersion hypothesis cannot be dropped.
- The elementary step: in Z ⊕ Z/6, an element divisible by every n ≥ 1 is zero.

**Prerequisites.** `section-class-map`, `kummer-section-comparison`, `HeightsRationalPointsAndObstructions:RP.6/curve-in-jacobian`, `HeightsRationalPointsAndObstructions:RP.1/mordell-weil`, `mathlib:AddGroup.FG`.

**Sources.**

- Stix 2008, Appendix B, Theorem 45, Remark 46, p.22; §1.1, p.2. Proves injectivity for varieties immersing into abelian varieties over fields without divisible rational points, and notes that number fields (Mordell–Weil) and local fields qualify; the introduction attributes the injectivity part to Grothendieck.
- Kim 2009, Introduction, p.90. States the section conjecture whose injective half this node proves.

### 5. Grothendieck's section conjecture

Node `section-conjecture` · definition · Planet **Section conjecture**.

For a field k and a quasi-compact geometrically connected k-scheme X, the proposition SectionConjecture(X/k) states that the section map κ_X: X(k) → Sect(X/k) is a bijection. Grothendieck's section conjecture is the proposition that SectionConjecture(X/k) holds for every number field k and every smooth projective geometrically connected curve X/k of genus at least 2. It is an open problem: it is stated as a named proposition, and any result that uses it lists it among its hypotheses. By NC.6/section-map-injective, for such X it is equivalent to surjectivity of κ_X; in particular it predicts that a curve without rational points has no sections. The cuspidal form for affine hyperbolic curves, the birational form and the p-adic forms are different statements and are not this definition.

**Hypotheses.**

- The proposition is about rational points and conjugacy classes of continuous sections; it is not asserted.
- The genus bound and the number-field hypothesis are part of the conjecture, not of the proposition SectionConjecture(X/k).

**Construction.**

1. Define SectionConjecture(X/k) as bijectivity of κ_X (section-class-map).
2. Define the global conjecture by quantifying over number fields and smooth projective geometrically connected curves of genus ≥ 2.
3. Derive the equivalence with surjectivity from NC.6/section-map-injective.

**Uses.**

- Kim 2009, Introduction pp.90 and 96: The motivating conjecture whose 'implies Faltings' is replaced by the unipotent implications of Conjectures 1 and 2.
- BDCKW §1.2 and §3.4: Kim's eventual equality conjecture is presented as a unipotent analogue of its surjectivity.
- Roadmap document, NC.6 acceptance: The section-conjecture frontier is kept as a stated, unassumed proposition.

**Planning API.**

- `sectionConjecture_iff_surjective` (characterisation): For a number field k and a smooth projective geometrically connected curve X/k of genus ≥ 1, SectionConjecture(X/k) holds if and only if κ_X is surjective.
- `sectionConjecture_isEmpty_iff` (characterisation): If X(k) = ∅, SectionConjecture(X/k) holds if and only if Sect(X/k) = ∅, that is, the arithmetic sequence has no continuous section.
- `GrothendieckSectionConjecture` (data): The proposition: for every number field k and every smooth projective geometrically connected curve X/k of genus ≥ 2, SectionConjecture(X/k).
- `sectionConjecture_of_equiv` (functoriality): SectionConjecture is invariant under isomorphism of k-schemes, via SectionClasses.map and sectionClassMap_natural.
- `SectionConjectureFor` (compatibility): The abstract form for an extension datum q: E → Γ with a family of sections indexed by a point set P: bijectivity of P → Sect; SectionConjecture(X/k) is the instance q = pr, P = X(k), x ↦ s_x.

**Unit tests.**

- `sectionConjecture_spec_field` (degenerate): SectionConjecture(Spec k/k) holds: both sides are one-point sets.
- `not_sectionConjecture_projectiveLine` (non-example): SectionConjecture(P¹_Q/Q) fails because κ is constant on the infinite set P¹(Q); a statement without the genus bound is false.
- `not_sectionConjecture_gm` (non-example): SectionConjecture(G_{m,Q}/Q) fails because the Kummer map Q^× → lim_n Q^×/Q^{×n} is injective but not surjective; injectivity alone is not the conjecture.
- `sectionConjecture_iff_bijective` (characterisation): SectionConjecture(X/k) is exactly bijectivity of κ_X; for an abstract section datum with a non-injective point map (two points with equal sections) it fails.

**Acceptance.**

- SectionConjecture(Spec k/k) holds for every field k.
- SectionConjecture(P¹_Q/Q) and SectionConjecture(G_{m,Q}/Q) both fail, for different reasons (non-injective, non-surjective).

**Prerequisites.** `section-class-map`, `section-map-injective`, `mathlib:Function.Bijective`.

**Sources.**

- Kim 2009, Introduction, p.90. Formulates the section conjecture for smooth compact hyperbolic curves over number fields as bijectivity of the map from rational points to conjugacy classes of splittings, citing Grothendieck's 1983 letter.
- Stix 2008, §1.1, Conjecture 1, p.1. States the conjecture for smooth projective geometrically connected curves of genus at least 2 over number fields and records that the injective part is known.
- BDCKW, §1.2, p.2 and §3.4, p.13. Restates the conjecture in the H¹ form and compares its surjectivity with the surjectivity statement for Selmer schemes.

## Part B. Kim's dimension conjecture and its conditional bridges

Part B works over Q (Conjectures 1 and the bridges to it) or over a number field (Conjecture 2 and the H² estimate), in the setting of NC.3 and NC.4: S-integral models with good compactification, a prime p of good reduction, T = S ∪ {p}, the Selmer variety S_n = H¹_f(G_T, U⟨n⟩) and the de Rham period space Q_n = U_dR⟨n⟩/F⁰. NC.4 proves finiteness at a depth where dim S_n < dim Q_n holds. Part B states the conjecture that such a depth exists, and every statement known to imply it.

### 6. Kim's dimension conjecture

Node `kim-dimension-conjecture` · definition · Planet **Kim's dimension conjecture**.

Setting (Kim 2009, pp.91–96): X is a smooth hyperbolic curve over Q, 𝒳 ⊂ 𝒳′ a smooth model over Z[1/S] with smooth compactification and smooth complement, b ∈ 𝒳(Z[1/S]) or an integral tangential base point, p ∉ S a prime of good reduction and T = S ∪ {p}. Depth n means the quotient U⟨n⟩ = U/Γ_{n+1}U of the Q_p-unipotent étale fundamental group U of X_{Q̄} at b (NC.2), which is Kim's U_{n+1}; S_n = H¹_f(G_T, U⟨n⟩) is the Selmer variety (classes crystalline at p, no condition at the other places of T), an affine Q_p-scheme of finite type (NC.3), and Q_n = U_dR⟨n⟩/F⁰ is the target of the depth-n de Rham Albanese map at p (NC.4). The proposition KimDimensionConjecture(X, p) states: there is n ≥ 1 with dim S_n < dim Q_n (Kim 2009, Conjecture 1). By NC.4/dimension-finiteness the inequality at one depth n gives finiteness of 𝒳(Z[1/S]), and of X(Q) when X is proper. The conjecture is open for curves of positive genus; it is stated as a named proposition, and every result that uses it lists it as a hypothesis. Refining the local conditions (for example the stringent conditions of BDCKW or the potentially unramified conditions of Kim §4) replaces S_n by a closed subscheme and can only lower dim S_n.

**Hypotheses.**

- X hyperbolic over Q (2g − 2 + s > 0 where s is the number of geometric points of the boundary); p ∉ S of good reduction for 𝒳′ and the boundary.
- Dimensions are Krull dimensions of the represented affine schemes; dim Q_n = dim U_dR⟨n⟩ − dim F⁰U_dR⟨n⟩.
- Depth indexing follows NC.2/NC.4 (depth 1 is the abelian quotient).

**Construction.**

1. Take S_n from NC.3/selmer-functor and NC.3/finite-level-representability with only the crystalline condition at p.
2. Take Q_n and the de Rham Albanese map from NC.4/local-albanese.
3. Define the proposition as the existence of a depth with the strict inequality.
4. Prove finite_of_kimDimensionConjecture from NC.4/dimension-finiteness at that depth (with NC.4/rational-integral-containment).

**Uses.**

- Kim 2009, §3 pp.120–121: The dimension inequality at one depth gives a nonzero algebraic function vanishing on the Selmer image, hence finiteness.
- NC.6/vanishing-implies-dimension, NC.6/weak-jannsen-implies-dimension, NC.6/pseudo-null-implies-dimension: Conclusion of the conditional bridges from motivic conjectures.
- NC.6/genus-zero-dimension, NC.6/cm-rank-one-finiteness: The known cases of the inequality.
- BDCKW §1.8, p.4: Finiteness of X(Z_p)_n as soon as the localisation image is a proper subvariety.

**Planning API.**

- `KimDimensionConjecture` (data): The proposition ∃ n ≥ 1, dim S_n < dim Q_n for the data (X, 𝒳, b, p, S).
- `finite_of_kimDimensionConjecture` (relation): KimDimensionConjecture(X, p) implies that 𝒳(Z[1/S]) is finite, and that X(Q) is finite if X is proper.
- `kimDimensionConjecture_of_refined` (relation): If S′_n ⊆ S_n is the Selmer variety for finer local conditions, dim S′_n ≤ dim S_n; the inequality for S_n implies it for S′_n, and finiteness follows from either (NC.4/locus-compatibilities).
- `kimDimensionConjecture_basepoint` (compatibility): The proposition does not depend on the integral base point b: change of base point gives isomorphic Selmer varieties (BDCKW §2.9) and the de Rham dimensions are independent of b.
- `dim_Q_eq_sum` (simp): dim Q_n = Σ_{k=1}^{n} (d_k − f_k), where d_k = dim gr_k U and f_k = dim F⁰ gr_k U_dR (NC.6/graded-central-dimensions).
- `KimDimensionInequality` (other): The form on dimension sequences: for selDim, dRDim : ℕ → ℕ, ∃ n ≥ 1, selDim n < dRDim n; KimDimensionConjecture is the instance selDim n = dim S_n, dRDim n = dim Q_n.
- `kimDimensionInequality_mono` (relation): If selDim′ ≤ selDim pointwise, the inequality for selDim implies it for selDim′ (the dimension form of kimDimensionConjecture_of_refined).

**Unit tests.**

- `kimDimensionConjecture_depth_one_chabauty` (compatibility): For a proper curve of genus g over Q whose Jacobian has p-adic Bloch–Kato Selmer rank r, the depth-1 inequality dim S_1 < dim Q_1 is the classical condition r < g.
- `kimDimensionConjecture_thrice_punctured_Z` (computation): For P¹ ∖ {0, 1, ∞} over Z (S = ∅): dim S_1 = 0 (H¹_f(G_T, Q_p(1)) = Z^× ⊗ Q_p = 0) and dim Q_1 = 2, so the inequality holds at n = 1.
- `kimDimensionConjecture_thrice_punctured_half` (computation): For P¹ ∖ {0, 1, ∞} over Z[1/2]: dim S_1 = 2 = dim Q_1, so depth 1 fails, while dim S_2 = 2 < 3 = dim Q_2 (H¹(G_T, Q_p(2)) = 0); the inequality first holds at depth 2.
- `not_kimDimensionConjecture_gm` (non-example): For the non-hyperbolic G_m over Z[1/2], U = Q_p(1) is abelian, U⟨n⟩ = U⟨1⟩, and dim S_n = 1 = dim Q_n for every n, so the inequality never holds, matching the infinitude of G_m(Z[1/2]) = ±2^Z.
- `kimDimensionConjecture_needs_crystalline` (non-example): Dropping the crystalline condition at p is wrong: for P¹ ∖ {0, 1, ∞} over Z, H¹(G_T, Q_p(1)) = Z[1/p]^× ⊗ Q_p is one-dimensional, so the unconditioned depth-1 variety has dimension 2 = dim Q_1.

**Acceptance.**

- At depth 1 for a proper curve of genus g whose Jacobian has p-adic Selmer rank r, the inequality is r < g, Chabauty's condition (NC.4/depth-one-locus).
- For P¹ ∖ {0, 1, ∞} over Z the inequality already holds at depth 1 (0 < 2).

**Prerequisites.** `AnabelianGeometryAndNonabelianChabauty:NC.3/selmer-functor`, `AnabelianGeometryAndNonabelianChabauty:NC.3/finite-level-representability`, `AnabelianGeometryAndNonabelianChabauty:NC.4/local-albanese`, `AnabelianGeometryAndNonabelianChabauty:NC.4/dimension-finiteness`, `AnabelianGeometryAndNonabelianChabauty:NC.4/rational-integral-containment`, `AnabelianGeometryAndNonabelianChabauty:NC.4/locus-compatibilities`, `AnabelianGeometryAndNonabelianChabauty:NC.2/central-quotients`.

**Sources.**

- Kim 2009, Introduction, Conjecture 1 and the paragraph after it, p.96; §3, pp.120–121. States the conjectural dimension inequality for some depth over Q, explains that it yields finiteness as in Chabauty's argument, and records that it is known in genus zero and some genus-one cases.

### 7. Dimensions of the lower central quotients

Node `graded-central-dimensions` · theorem.

Let X be a smooth curve over a number field with smooth compactification of genus g and s ≥ 0 boundary points over the algebraic closure, hyperbolic (2g − 2 + s > 0), and let d_n = dim gr_n U, where gr_n U = Γ_nU/Γ_{n+1}U for the Q_p-unipotent étale (or de Rham) fundamental group U of NC.2. If s ≥ 1, U is the unipotent completion of a free group on m = 2g + s − 1 generators and Σ_{k | n} k·d_k = m^n (Witt), so d_n = (1/n) Σ_{k | n} μ(k) m^{n/k}. If s = 0 (so g ≥ 2), U is the completion of a surface group with one relation of degree 2 and Σ_{k | n} k·d_k = α^n + β^n with α, β = g ± √(g² − 1) (Labute), so d_n = (1/n) Σ_{k | n} μ(k)(α^{n/k} + β^{n/k}). In both cases gr_1 U = H₁ has dimension m (resp. 2g), gr_n U is a G_T-equivariant quotient of H₁^{⊗n}, and d_n ~ λ^n/n with λ = m (resp. α); in the hyperbolic case λ > g.

**Hypotheses.**

- Hyperbolic smooth curve; the dimensions are those of the graded pieces of the lower central series of the Q_p-unipotent completion, equal to the ranks of the graded pieces of the discrete group.
- gr_n is taken with Γ_1U = U, so gr_1 U is the abelianisation H₁.

**Proof outline.**

1. The topological fundamental group of the complex points is free on m generators (s ≥ 1) or the one-relator surface group (s = 0); the unipotent completion has the same graded Lie algebra tensored with Q_p (NC.2/etale-galois, NC.2/central-quotients).
2. Free case: the graded Lie algebra is free on H₁, and Witt's formula (QM.6/free-lie-algebra-character-formula) gives d_n.
3. Surface case: the graded Lie algebra is the free Lie algebra on 2g generators modulo the ideal generated by the symplectic element of degree 2; its enveloping algebra has Hilbert series 1/(1 − 2g t + t²), which gives the stated divisor sum (Labute).
4. gr_n is spanned by iterated brackets of degree-1 elements, so it is a quotient of H₁^{⊗n}; the asymptotics follow from the divisor sums.

**Acceptance.**

- m = 2 (P¹ ∖ {0, 1, ∞}): d_1, …, d_5 = 2, 1, 2, 3, 6.
- g = 2, s = 0: d_1 = 4, d_2 = 5 (= dim Λ²H₁ − 1), d_3 = 16.
- g = 1, s = 0 (not hyperbolic): the formula gives d_1 = 2 and d_n = 0 for n ≥ 2, the abelian case.

**Prerequisites.** `AnabelianGeometryAndNonabelianChabauty:NC.2/central-quotients`, `AnabelianGeometryAndNonabelianChabauty:NC.2/etale-galois`, `AnabelianGeometryAndNonabelianChabauty:NC.2/tannakian-groups`, `QSeriesPartitionsAndMockModularForms:QM.6/free-lie-algebra-character-formula`, `mathlib:ArithmeticFunction.moebius`, `mathlib:Nat.divisors`.

**Sources.**

- Kim 2009, §3, proof of Proposition 2, pp.122–123. States the two recursive divisor-sum formulas for the graded dimensions, citing Labute for the surface-group case, and their asymptotics.
- Linton–Nyberg-Brodda, §1.7, discussion of the lower central series of one-relator groups and equation (32), p.65. Reports Labute's theorem that the graded Lie algebra of a one-relator group whose relator is not a proper power modulo the lower central series is a one-relator Lie algebra, gives the closed Möbius formula for the ranks in genus 2, and the exponential growth rate g + √(g² − 1) in genus g; expanding its inner sum as α^d + β^d with α + β = 4, αβ = 1 recovers Kim's divisor sum.

### 8. Vanishing of the strict Selmer groups of tensor powers

Node `selmer-vanishing-conjecture` · definition.

Let F be a number field, X/F a smooth curve, p a prime and T a finite set of places of F containing the places above p, the archimedean places and the places of bad reduction of X and its boundary. Put V_n = H¹_ét(X_{F̄}, Q_p)^{⊗n}(1), a continuous Q_p-representation of G_T. For a finite-dimensional continuous representation V of G_T, Sel⁰_T(V) is the kernel of H¹(G_T, V) → ⊕_{w ∈ T} H¹(G_w, V), the group Ш¹_T(V) with rational coefficients. The proposition SelmerVanishing(X, p, T) states that Sel⁰_T(V_n) = 0 for all sufficiently large n (Kim 2009, Conjecture 2). It is open in general and is stated as a named proposition.

**Hypotheses.**

- Continuous cohomology of the profinite group G_T with Q_p-coefficients (limits of lattices, as in ArithmeticGaloisDuality).
- The local maps are restrictions to decomposition groups G_w for w ∈ T; no condition is imposed outside T beyond being unramified there.

**Construction.**

1. Define V_n from H¹ of the curve with the G_T action (SF.3/tate-module-etale-h1 for the proper part; NC.2 for the unipotent comparison).
2. Define Sel⁰_T(V) as the kernel of localisation, Ш¹_T(V) of AGD R02.4/restricted-product-cohomology, extended to rational coefficients by R02.4/lattice-rational-poitou-tate.
3. Define the proposition by an eventually-true statement in n.

**Uses.**

- Kim 2009, Proposition 2 and Lemma 6, pp.122–125: Through Poitou–Tate duality it bounds H² of the graded pieces, which forces the dimension inequality.
- Kim 2009, Observations 1 and 2, p.122: Bloch–Kato and a weight-filtration form of Fontaine–Mazur each imply it.
- NC.6/h2-growth-bound, NC.6/vanishing-implies-dimension: Hypothesis of the H² estimate and of the implication to Conjecture 1.

**Planning API.**

- `SelmerVanishing` (data): The proposition: Sel⁰_T(V_n) = 0 for all sufficiently large n.
- `sel0_eq_sha1` (compatibility): Sel⁰_T(V) is Ш¹_T(V) of ArithmeticGaloisDuality with rational coefficients.
- `sel0_dual_sha2` (relation): Poitou–Tate: Sel⁰_T(V) is dual to Ш²_T(V^∨(1)); for V = V_n, V^∨(1) = H₁^{⊗n} with H₁ = H¹(X_{F̄}, Q_p)^∨, so SelmerVanishing is equivalent to Ш²_T(H₁^{⊗n}) = 0 for n ≫ 0.
- `sel0_mono_T` (functoriality): For T ⊆ T′, inflation identifies Sel⁰_{T′}(V) with a subspace of Sel⁰_T(V).
- `selmerVanishing_of_finite_extension` (functoriality): If F′/F is finite, SelmerVanishing over F′ implies it over F, since restriction is injective on H¹ with Q_p-coefficients.
- `EventuallyVanishing` (other): The form on dimension sequences: dim n = 0 for all large n; SelmerVanishing is the instance dim n = dim Sel⁰_T(V_n).

**Unit tests.**

- `selmerVanishing_thrice_punctured` (computation): For X = P¹ ∖ {0, 1, ∞} over Q, Sel⁰_T(V_n) = 0 for every n ≥ 2: V_n ≅ Q_p(1 − n)^{2^n}, Ш¹_T(Q_p(j)) is dual to Ш²_T(Q_p(1 − j)), and H²(G_T, Q_p(m)) = 0 for m ≥ 2 (Soulé).
- `sel0_eq_sha1_test` (compatibility): For any V, Sel⁰_T(V) equals the kernel of the localisation map of AGD R02.4/restricted-product-cohomology after tensoring with Q_p.
- `selmerVanishing_not_bloch_kato_selmer` (non-example): Replacing Sel⁰_T by the Bloch–Kato Selmer group H¹_f is wrong: for an elliptic curve E/Q of positive rank, H¹_f(G_Q, V_pE) ⊇ E(Q) ⊗ Q_p ≠ 0 at n = 1, whereas the strict group only requires local triviality and the conjecture concerns n ≫ 0.
- `selmerVanishing_zero_rep` (degenerate): For V = 0, Sel⁰_T(V) = 0.

**Acceptance.**

- For P¹ ∖ {0, 1, ∞} over Q, V_n ≅ Q_p(1 − n)^{2^n} and Sel⁰_T(V_n) = 0 for n ≥ 2.
- For n = 1 and a proper curve, V_1 ≅ V_pJ by the Weil pairing and Sel⁰_T(V_pJ) is the fine Selmer space of J.

**Prerequisites.** `ArithmeticGaloisDuality:R02.4/restricted-product-cohomology`, `ArithmeticGaloisDuality:R02.4/lattice-rational-poitou-tate`, `SchemeAndStackFoundations:SF.3/tate-module-etale-h1`, `AnabelianGeometryAndNonabelianChabauty:NC.2/etale-galois`, `mathlib:Filter.Eventually`.

**Sources.**

- Kim 2009, §3, Conjecture 2 and the definition of Sel⁰_T before it, p.121. Defines the strict Selmer group as the kernel of localisation at T and conjectures its vanishing on the twisted tensor powers of H¹ for large n.

### 9. Kim's H² estimate

Node `h2-growth-bound` · theorem.

Assume SelmerVanishing(X, p, T) for X/F as in selmer-vanishing-conjecture, with compactification of genus g and s boundary points. Then there is an explicit polynomial P, depending only on g, s and |T|, such that dim_{Q_p} H²(G_T, gr_n U) ≤ P(n)·g^n for all sufficiently large n (with g^n read as 0 when g = 0 and n ≥ 2, where the local invariants vanish). At a place w ∤ p the local contribution is at most n·dim Gr^W_2·g^{n−1} + (n(n−1)/2)(dim Gr^W_1)²·g^{n−2} from the weight filtration of H¹ attached to semistable reduction, plus the boundary contribution n(s − 1)g^{n−1}; at w | p it is at most n(g + s − 1)g^{n−1}, from the Hodge–Tate weights of H¹.

**Hypotheses.**

- SelmerVanishing(X, p, T) holds; n is beyond the threshold it provides.
- gr_n U is the G_T-equivariant quotient of H₁^{⊗n} of NC.6/graded-central-dimensions, H₁ = H¹(X_{F̄}, Q_p)^∨.

**Proof outline.**

1. Since cd_p(G_T) = 2 (AGD R02.4/cohomological-dimension-bound, p odd or F totally imaginary), H² is right exact: H²(G_T, H₁^{⊗n}) ↠ H²(G_T, gr_n U).
2. By SelmerVanishing and Poitou–Tate (sel0_dual_sha2), Ш²_T(H₁^{⊗n}) = 0, so H²(G_T, H₁^{⊗n}) injects into ⊕_{w ∈ T} H²(G_w, H₁^{⊗n}).
3. Local duality (AGD D7/local-coefficient-field-duality): dim H²(G_w, H₁^{⊗n}) = dim H⁰(G_w, H¹^{⊗n}(1)).
4. For w ∤ p, after a finite extension giving semistable reduction, H¹ of the compactification has a weight filtration W_0 ⊂ W_1 ⊂ W_2 with dim W_0 = dim Gr_2 ≤ g (DWP.10); the boundary part is Q_p(−1)^{s−1}. Invariants of H¹^{⊗n}(1) come only from tensors with exactly one factor of weight 2 and the rest of weight 0, or two factors of weight 1, which gives the stated count.
5. For w | p, H¹ is de Rham with Hodge–Tate weights 0 (multiplicity g) and 1 (multiplicity g + s − 1) (PHT R06.5 de Rham comparison, R06.2 de Rham ⇒ Hodge–Tate); invariants of a Hodge–Tate representation embed in its weight-0 part (Tate, R06.2), which gives n(g + s − 1)g^{n−1}.

**Acceptance.**

- For P¹ ∖ {0, 1, ∞} (g = 0) the bound gives H²(G_T, gr_n U) = 0 for n ≥ 2, consistent with Soulé's vanishing H²(G_T, Q_p(n)) = 0.
- For g ≥ 2 the bound grows like n²g^n, slower than d_n ~ α^n/n since α = g + √(g² − 1) > g.

**Prerequisites.** `selmer-vanishing-conjecture`, `graded-central-dimensions`, `ArithmeticGaloisDuality:R02.4/cohomological-dimension-bound`, `ArithmeticGaloisDuality:R02.4/lattice-rational-poitou-tate`, `ArithmeticGaloisDuality:D7/local-coefficient-field-duality`, `DeligneWeightsAndPurity:DWP.10/finite-residue-semistable-curve-weights`, `PadicHodgeTheory:R06.5/proper-smooth-rational-de-rham-comparison`, `PadicHodgeTheory:R06.2/plan/de-rham-implies-hodge-tate`, `PadicHodgeTheory:R06.2/plan/hodge-tate-decomposition-tate`.

**Sources.**

- Kim 2009, §3, Lemma 6 and proof, pp.124–125. Bounds H² of the graded pieces by a polynomial times g^n, using cohomological dimension two, Conjecture 2 with Poitou–Tate, local duality, the weight filtration from Raynaud's uniformisation away from p and the Hodge–Tate decomposition at p; the coefficient module is written H¹ where its dual H₁ is meant (source issue E-NC6-kim-h1-notation).

### 10. Selmer vanishing implies the dimension conjecture

Node `vanishing-implies-dimension` · theorem · Planet **Selmer vanishing criterion**.

Let X be a smooth hyperbolic curve over Q with the data of kim-dimension-conjecture. If SelmerVanishing(X, p, T) holds, then KimDimensionConjecture(X, p) holds; hence 𝒳(Z[1/S]) is finite (and X(Q) if X is proper). Precisely, for n large (of suitable parity), dim S_n ≤ Σ_{k ≤ n} dim H¹(G_T, gr_k U) ≤ Σ_{k ≤ n} (d_k⁻ + P(k)g^k) < Σ_{k ≤ n} (d_k − g^k) ≤ dim Q_n, where d_k⁻ is the dimension of the (−1)-eigenspace of complex conjugation on gr_k U. Here d_k⁻ = (d_k − τ_k)/2 with τ_k the trace of complex conjugation, computed from its trace t on H₁. In the proper case τ_k = 0 for odd k (gr_k U is pure of odd weight −k). In the affine case τ_k = (1/k) Σ_{e | k} μ(e) t_e^{k/e} with t_e = t for odd e and t_e = m for even e; either |t| < m, and then |τ_k| = o(d_k), or t = −m (genus 0 with all boundary points real), and then complex conjugation acts on gr_k U by (−1)^k. In every case Σ_{k ≤ n} d_k⁺ ≥ c·λ^n/n for infinitely many n, with λ > g.

**Hypotheses.**

- SelmerVanishing(X, p, T); X hyperbolic over Q; T = S ∪ {p} with p of good reduction.
- The comparison of eigenspace dimensions uses the corrected count of source issue E-NC6-kim-conjugation-eigenspaces, not Kim's printed value d_k/2.

**Proof outline.**

1. The central extensions 1 → gr_{n}U → U⟨n⟩ → U⟨n−1⟩ → 1 make H¹(G_T, U⟨n⟩) fibred over a subvariety of H¹(G_T, U⟨n−1⟩) with fibres torsors under H¹(G_T, gr_n U) (NC.3/central-extension, NC.3/finite-level-representability), so dim S_n ≤ Σ_{k ≤ n} dim H¹(G_T, gr_k U).
2. H⁰(G_T, gr_k U) = 0 for k ≥ 1 (weights of H₁ are −1 and −2), so Tate's global Euler characteristic formula over Q (AGD R02.4/global-euler-characteristic with rational coefficients) gives dim H¹ − dim H² = d_k⁻.
3. Bound dim H² by NC.6/h2-growth-bound and dim F⁰ gr_k U_dR by g^k (F⁰ of H₁^{dR ⊗k} has dimension dim H¹(O)^{⊗k} = g^k), so dim Q_n ≥ Σ_{k ≤ n} (d_k − g^k).
4. Compare: the difference is at least Σ_{k ≤ n} d_k⁺ − Σ_{k ≤ n} (P(k) + 1)g^k, and by NC.6/graded-central-dimensions and the trace computation Σ_{k ≤ n} d_k⁺ ≥ c·λ^n/n for infinitely many n with λ > g; choose such n.
5. Finiteness then follows from finite_of_kimDimensionConjecture.

**Acceptance.**

- For a proper curve of genus 2, λ = 2 + √3 ≈ 3.73 > 2 = g, and the counting step succeeds once Σ_{k ≤ n} d_k/2 over odd k exceeds Σ_{k ≤ n} (P(k) + 1)2^k.
- For P¹ ∖ {0, 1, ∞} complex conjugation acts on gr_k U ≅ Q_p(k)^{d_k} by (−1)^k, so d_k⁺ = d_k for even k and 0 for odd k; the count succeeds through the even degrees.

**Prerequisites.** `selmer-vanishing-conjecture`, `kim-dimension-conjecture`, `h2-growth-bound`, `graded-central-dimensions`, `AnabelianGeometryAndNonabelianChabauty:NC.3/central-extension`, `AnabelianGeometryAndNonabelianChabauty:NC.3/finite-level-representability`, `ArithmeticGaloisDuality:R02.4/global-euler-characteristic`, `ArithmeticGaloisDuality:R02.4/lattice-rational-poitou-tate`, `AnabelianGeometryAndNonabelianChabauty:NC.2/filtered-path`, `AnabelianGeometryAndNonabelianChabauty:NC.4/local-albanese`.

**Sources.**

- Kim 2009, §3, Proposition 2 and proof, pp.122–124. Proves that Conjecture 2 implies Conjecture 1 by comparing the growth of the graded dimensions with the Euler characteristic and the H² estimate; the eigenspace value printed on p.123 needs the correction recorded in sourceIssues.

### 11. Bloch–Kato implies Selmer vanishing

Node `bloch-kato-implies-vanishing` · theorem.

Let X/F be a smooth curve over a number field and p, T as in selmer-vanishing-conjecture. Suppose that, for every n ≥ 2, the group H¹_g(G_F, H^n(X^n_{F̄}, Q_p(1))) of classes unramified at almost all places and de Rham (potentially semistable) at the places above p is spanned by the image of K-theory under the étale Chern class map, as predicted by the Bloch–Kato conjecture (their Conjecture 5.3, as cited by Kim). Since the relevant K-group K^{(1)}_{1−n}(X^n) is zero for n ≥ 2, this hypothesis says that H¹_g(G_F, H^n(X^n_{F̄}, Q_p(1))) = 0 for n ≥ 2. Then SelmerVanishing(X, p, T) holds; in fact Sel⁰_T(V_n) = 0 for every n ≥ 2.

**Hypotheses.**

- The Bloch–Kato fragment for the motives h^n(X^n)(1), n ≥ 2, is a hypothesis; it is not a theorem of any roadmap.
- For open X the smooth variety X^n is not proper and the hypothesis is the corresponding statement for its cohomology.

**Proof outline.**

1. By Künneth, V_n = H¹(X_{F̄}, Q_p)^{⊗n}(1) is a G_F-stable direct summand of H^n(X^n_{F̄}, Q_p(1)).
2. A class in Sel⁰_T(V_n) is unramified outside T and locally trivial at T, so it lies in H¹_g(G_F, V_n) ⊆ H¹_g(G_F, H^n(X^n_{F̄}, Q_p(1))) (PHR L1/bloch-kato-subgroups).
3. The weight-graded piece K^{(1)}_{2r−n−1} with r = 1 is a negative K-group of the regular scheme X^n for n ≥ 2, hence zero, so the hypothesis gives H¹_g = 0 and therefore Sel⁰_T(V_n) = 0.

**Acceptance.**

- For P¹ ∖ {0, 1, ∞} over Q the conclusion holds unconditionally (selmerVanishing_thrice_punctured), consistent with Soulé's theorem.
- The hypothesis is used only through the vanishing of H¹_g; no regulator computation enters.

**Prerequisites.** `selmer-vanishing-conjecture`, `PadicHodgeRegulators:L1/bloch-kato-subgroups`, `MotivicEtaleKTheory:M.8/finite-etale-chern`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Sources.**

- Kim 2009, §3, Observation 1 and the paragraph before it, pp.121–122. Places Sel⁰_T(V_n) inside H¹_g of a twisted cohomology group of X^n and deduces Conjecture 2 from Bloch–Kato's conjectured isomorphism with K-theory, whose source group vanishes in this range.

### 12. Weight filtrations on extensions imply Selmer vanishing

Node `weight-splitting-implies-vanishing` · theorem.

Let X/F and V_n be as in selmer-vanishing-conjecture and n ≥ 3. Suppose every extension 0 → V_n → E → Q_p → 0 of G_T-representations whose class lies in Sel⁰_T(V_n) carries a finite increasing filtration W by G_T-subrepresentations, strictly compatible with the maps of the extension, inducing on Q_p the filtration pure of weight 0 and on V_n a filtration with W_0V_n = 0. Then Sel⁰_T(V_n) = 0. The hypothesis is what Kim (following Scholl) derives from the Fontaine–Mazur conjecture together with the expectation that such extensions are Q_p-linear combinations of extensions of geometric origin; it is a stated hypothesis here. For proper X, V_n is pure of weight n − 2 and W_0V_n = 0 for n ≥ 3; for open X the weights of V_n lie in [n − 2, 2n − 2] and the same conclusion holds.

**Hypotheses.**

- The weight-filtration hypothesis on each extension class in Sel⁰_T(V_n); n ≥ 3.
- Weights of V_n come from the weights 1 (compact part) and 2 (boundary part) of H¹ at good places.

**Proof outline.**

1. Strictness gives v ∈ W_0E mapping to 1 ∈ Q_p.
2. W_0E ∩ V_n = W_0V_n = 0 since all weights of V_n are at least n − 2 ≥ 1 (WEC R34.2 purity at good places).
3. Hence W_0E is a one-dimensional G_T-stable complement of V_n, the extension splits and its class is zero.

**Acceptance.**

- For n = 2 and proper X, V_2 has weight 0 and the argument does not apply.
- For P¹ ∖ {0, 1, ∞}, V_n = Q_p(1 − n)^{2^n} has weight 2n − 2 ≥ 4 for n ≥ 3.

**Prerequisites.** `selmer-vanishing-conjecture`, `WeightsInEtaleCohomology:R34.2/purity-of-tate-modules-with-good-reduction`.

**Sources.**

- Kim 2009, §3, Observation 2 and the argument after it, p.122. Attributes to Scholl the deduction of Conjecture 2 from the Fontaine–Mazur conjecture via weight filtrations on geometric extensions, and splits the extension through its weight-zero part for n ≥ 3; the purity claim needs the open-curve correction recorded in sourceIssues.

### 13. Weak Jannsen vanishing implies the dimension conjecture for affine curves

Node `weak-jannsen-implies-dimension` · theorem.

Let X be a smooth affine hyperbolic curve over Q (s ≥ 1) with compactification X′ of genus g and the data of kim-dimension-conjecture. Assume the weak Jannsen conjecture: there is k > 0 such that H²(G_T, H^i(V_{Q̄}, Q_p)(r)) = 0 for every smooth projective V/Q with good reduction outside T, every i and every r ≥ i + k. Then KimDimensionConjecture(X, p) holds, so 𝒳(Z[1/S]) is finite.

**Hypotheses.**

- X affine (s ≥ 1); the weak Jannsen vanishing is a hypothesis for all smooth projective V/Q with good reduction outside T.
- Kim records that the argument was not adapted to the compact case.

**Proof outline.**

1. Pass to a finite extension over which all cusps are rational; this does not affect the H² estimate (corestriction).
2. Use 0 → Q_p(1)^{s−1} → H₁(X) → H₁(X′) → 0 and, in the Grothendieck group, expand H₁(X)^{⊗n} into tensor products of V = H₁(X′) ≅ H¹(X′)(1) and Q_p(1).
3. V^{⊗l} is a direct summand of H^l(X′^l_{Q̄})(l) (Künneth), so H²(G_T, V^{⊗l}(r)) = 0 for r ≥ k by the hypothesis.
4. The Weil pairing embeds Q_p(1) in V^{⊗2} as a direct summand; writing V^{⊗2k} = M ⊕ Q_p(k) and iterating, dim H²(G_T, V^{⊗n}(l)) ≤ C·a^n with a = ((2g)^{2k} − 1)^{1/(2k)} < 2g ≤ m.
5. Combine with the Euler characteristic and the graded dimensions d_n ~ m^n/n as in vanishing-implies-dimension.

**Acceptance.**

- For g = 0 every tensor power of H₁ is a sum of Tate twists and the hypothesis reduces to Soulé's vanishing of H²(G_T, Q_p(r)) for r ≥ 2.
- The bound C·a^n with a < m is the only input from the hypothesis.

**Prerequisites.** `kim-dimension-conjecture`, `graded-central-dimensions`, `vanishing-implies-dimension`, `ArithmeticGaloisDuality:R02.4/global-euler-characteristic`, `ArithmeticGaloisDuality:R02.4/cohomological-dimension-bound`, `PadicHodgeTheory:R06.5/plan/weil-pairing-duality`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Sources.**

- Kim 2009, §3, statement of the weak Jannsen conjecture, Observation 3 and its proof, pp.125–126. Shows for affine curves that a uniform vanishing of H² in large twists bounds H² of the tensor powers by an exponential of base below m, which suffices for Conjecture 1.

### 14. Integral points on punctured CM elliptic curves of rank one

Node `cm-rank-one-finiteness` · theorem.

Let E/Q be an elliptic curve with complex multiplication, X = E ∖ {O} with its minimal model and an integral tangential base point at O, p an odd prime of good reduction and T the bad primes together with p. Assume that the Bloch–Kato Selmer group H¹_f(G_Q, V_pE) has dimension one (this holds, for example, when E(Q) has rank one and Ш(E)[p^∞] is finite). Let Sel_T(U⟨n⟩) be the refined Selmer variety of classes potentially unramified at the primes of T other than p and potentially crystalline at p. Then dim Sel_T(U⟨2⟩) ≤ 1 < 2 = dim U_dR⟨2⟩/F⁰, so the integral points 𝒳(Z) form a finite set, without any conjectural input.

**Hypotheses.**

- CM ensures potentially good reduction everywhere (good reduction over Q(E[12])), which defines the potentially unramified conditions.
- Selmer rank one is a hypothesis on V_pE; rank E(Q) = 1 alone does not give it without finiteness of Ш(E)[p^∞] (source issue E-NC6-kim-rank-one).

**Proof outline.**

1. Depth-two graded piece: gr_2 U = Λ²H₁ ≅ Q_p(1) (NC.6/graded-central-dimensions with m = 2).
2. The refined central sequence 0 → Sel_T(gr_2 U) → Sel_T(U⟨2⟩) → Sel_T(U⟨1⟩) is exact in the torsor sense (NC.3/central-selmer-dimension), so dim Sel_T(U⟨2⟩) ≤ dim Sel_T(H₁) + dim Sel_T(Q_p(1)).
3. Sel_T(Q_p(1)) = Z^× ⊗ Q_p = 0 (SIC L0/s-unit-kummer-identification). Sel_T(H₁) = H¹_f(G_Q, V_pE): at ℓ ≠ p the local H¹ of V_pE vanishes for potentially good reduction (weights), and at p potentially crystalline classes are de Rham, where H¹_g = H¹_f for V_pE; it has dimension one by hypothesis (SIC L4/elliptic-finite-kummer).
4. On the de Rham side F⁰(gr_2 U_dR) = 0 because F⁰H₁ ∧ F⁰H₁ = 0, so dim U_dR⟨2⟩/F⁰ = 3 − 1 = 2.
5. The refined conditions are finer than Kim's, so NC.4/locus-compatibilities and NC.4/dimension-finiteness give finiteness.

**Acceptance.**

- The congruent-number curve y² = x³ − 25x has CM by Z[i] and E(Q) of rank one, generated modulo torsion by (−4, 6); with Ш(E)[p^∞] finite it satisfies the hypothesis.
- The depth used is 2 in this roadmap's indexing (Kim's U_3).

**Prerequisites.** `graded-central-dimensions`, `kim-dimension-conjecture`, `AnabelianGeometryAndNonabelianChabauty:NC.3/central-selmer-dimension`, `AnabelianGeometryAndNonabelianChabauty:NC.3/local-condition-geometry`, `AnabelianGeometryAndNonabelianChabauty:NC.4/locus-compatibilities`, `AnabelianGeometryAndNonabelianChabauty:NC.4/dimension-finiteness`, `SelmerIwasawaCohomology:L0/s-unit-kummer-identification`, `SelmerIwasawaCohomology:L4/elliptic-finite-kummer`, `AnabelianGeometryAndNonabelianChabauty:NC.2/depth-one-jacobian`.

**Sources.**

- Kim 2009, §4, pp.127–129. Defines the potentially unramified and potentially crystalline refined Selmer varieties, proves the central exact sequence for them and computes the depth-two dimensions for a rank-one CM curve, obtaining finiteness of integral points independently of conjectures.

### 15. Pseudo-nullity implies the dimension conjecture for punctured CM curves

Node `pseudo-null-implies-dimension` · theorem.

Let E/Q have complex multiplication, X = E ∖ {O}, p a prime of good reduction, F_1 = Q(E[p]), F_∞ = Q(E[p^∞]), G_∞ = Gal(F_∞/F_1), Λ = Z_p[[G_∞]], and I the Galois group of the maximal abelian unramified pro-p extension of F_∞ in which the primes above T split completely. Assume the Coates–Sujatha conjecture that I is a pseudo-null Λ-module. Then KimDimensionConjecture holds for X (working over F_1, which suffices because corestriction is surjective on H²), and hence 𝒳(Z) is finite.

**Hypotheses.**

- The pseudo-nullity of I over Λ is a hypothesis.
- The H² estimate is reduced to F_1; local terms are bounded as in h2-growth-bound with g = 1.

**Proof outline.**

1. It suffices to bound dim H²(G_T, H₁^{⊗n}) by a polynomial in n; the local contributions are bounded as in NC.6/h2-growth-bound, so it suffices to bound Ш²_T(H₁^{⊗n}).
2. By Poitou–Tate this is dual to Sel⁰_T(H¹^{⊗n}(1)), and the Hochschild–Serre sequence for F_∞/F_1 in continuous cohomology identifies it with Hom_Λ(I, H¹^{⊗n}(1)).
3. Pseudo-nullity makes I finitely generated over Z_p (Greenberg 1978, as cited by Kim), so a Frobenius element has finitely many eigenvalues on I ⊗ Q_p; by weights Hom_Λ(I, H¹^{⊗n}(1)) = 0 for n ≫ 0.
4. Conclude as in vanishing-implies-dimension with the polynomial bound.

**Acceptance.**

- The hypothesis is about F_∞ = Q(E[p^∞]), a two-dimensional p-adic Lie extension of F_1 in the CM case.
- With g = 1 the local bound is polynomial in n, and d_n ~ 2^n/n for m = 2.

**Prerequisites.** `kim-dimension-conjecture`, `h2-growth-bound`, `vanishing-implies-dimension`, `PadicMeasuresIwasawaAlgebras:L4/pseudo-null`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `ArithmeticGaloisDuality:D7`.

**Sources.**

- Kim 2009, §4, Observation 4 and its proof, pp.130–131. Derives Conjecture 1 for a punctured CM curve from the pseudo-nullity conjecture of Coates and Sujatha through Poitou–Tate, Hochschild–Serre and a weight argument.

### 16. The dimension conjecture for the thrice-punctured line

Node `genus-zero-dimension` · theorem.

Let X = P¹ ∖ {0, 1, ∞} over Z[1/S] with S a finite set of primes, b the tangential base point at 0, and p ∉ S. Then KimDimensionConjecture(X, p) holds, hence X(Z[1/S]) is finite (Siegel's theorem for this curve). Explicitly gr_n U ≅ Q_p(n)^{r_n} with r_n the Witt numbers for m = 2, F⁰ = 0 on U_dR so dim Q_n = Σ_{k ≤ n} r_k, and dim S_n ≤ |S|·2 + Σ_{3 ≤ k ≤ n, k odd} r_k, which is smaller for n large.

**Hypotheses.**

- S finite, p ∉ S; T = S ∪ {p}.
- Uses Soulé's computation of H¹(G_T, Q_p(k)): zero for even k ≥ 2 and one-dimensional for odd k ≥ 3.

**Proof outline.**

1. H₁ = Q_p(1)² and gr_n U is a quotient of H₁^{⊗n}, so gr_n U ≅ Q_p(n)^{r_n} with r_n from NC.6/graded-central-dimensions.
2. H¹_f(G_T, Q_p(1)) = Z[1/S]^× ⊗ Q_p has dimension |S| (SIC L0/s-unit-kummer-identification); H¹(G_T, Q_p(k)) = 0 for even k ≥ 2 and has dimension one for odd k ≥ 3 (Soulé; ArithmeticKTheory N.5).
3. The central-extension fibration gives dim S_n ≤ 2|S| + Σ_{odd 3 ≤ k ≤ n} r_k (NC.3/central-extension).
4. Since the Hodge filtration of H¹_dR is F¹ = everything, F⁰U_dR is trivial and dim Q_n = Σ_{k ≤ n} r_k; the even-degree terms make the difference positive for large n.
5. Finiteness follows from NC.4/dimension-finiteness.

**Acceptance.**

- S = ∅: the inequality holds at depth 1 (0 < 2).
- S = {2}: depth 1 gives 2 = 2, depth 2 gives 2 < 3, in agreement with BDCKW §8.2.

**Prerequisites.** `kim-dimension-conjecture`, `graded-central-dimensions`, `AnabelianGeometryAndNonabelianChabauty:NC.3/central-extension`, `AnabelianGeometryAndNonabelianChabauty:NC.3/finite-level-representability`, `SelmerIwasawaCohomology:L0/s-unit-kummer-identification`, `ArithmeticKTheory:N.5`, `AnabelianGeometryAndNonabelianChabauty:NC.4/dimension-finiteness`.

**Sources.**

- Kim 2005, Introduction, pp.1–2; §3, end of the proof of the main theorem, pp.17–18. Bounds the Selmer dimension using the Tate-twist graded pieces and Soulé's vanishing, compares with the de Rham dimension and deduces Siegel's theorem for the thrice-punctured line; the index range printed on p.18 needs the correction in sourceIssues.
- Kim 2009, Introduction, paragraph after Conjecture 1, p.96. Records that Conjecture 1 is proved in genus zero.

## Part C. Kim's conjecture on eventual equality

Part C uses the Selmer schemes with stringent local conditions of Balakrishnan, Dan-Cohen, Kim and Wewers: at each prime v ≠ p a class must lie in the image of the local unipotent Kummer map of 𝒳(Z_v). In NC.4's terms the resulting loci X(Z_p)_n are crystalline loci for these conditions; they decrease with n and contain the integral points.

### 17. Kim's conjecture on eventual equality

Node `kim-conjecture` · definition · Planet **Kim's conjecture**.

Let 𝒳 → Spec Z be a regular minimal model of a hyperbolic curve over Q in one of the three cases of BDCKW §2.1 (P¹ minus a reduced horizontal divisor with at least three geometric points; the regular minimal model of a smooth proper curve of genus ≥ 2; or the complement of a nonempty reduced horizontal divisor in the regular minimal model of a smooth proper curve of genus ≥ 1), b an integral point or integral tangent vector, p an odd prime of good reduction and T a finite set of primes containing p and the bad primes. Let U⟨n⟩ be the depth-n quotient of the Q_p-unipotent étale fundamental group (BDCKW's U_n), j_v: 𝒳(Z_v) → H¹(G_v, U⟨n⟩) the local unipotent Kummer maps, and Sel_n(𝒳) = ⋂_{v ≠ p} loc_v⁻¹(Im j_v) ⊆ H¹_f(G_T, U⟨n⟩), with the scheme structure given by the sum of the ideals (each Im j_v is finite and is the base point for v ∉ T). Put X(Z_p)_n = j_p⁻¹(loc_p(Sel_n(𝒳))) ⊆ 𝒳(Z_p). These sets decrease with n, contain 𝒳(Z), and do not depend on T or b. The proposition KimConjecture(𝒳, p) states that X(Z_p)_n = 𝒳(Z) for all sufficiently large n (BDCKW Conjecture 3.1). For a finite set S of primes with p ∉ S, dropping the conditions at v ∈ S gives Sel_{n,S}(𝒳), X(Z_p)_{S,n} ⊇ 𝒳(Z[1/S]), and the S-integral proposition KimConjecture_S(𝒳, p): X(Z_p)_{S,n} = 𝒳(Z[1/S]) for n large (BDCKW §8.1). Both are open and are stated as named propositions; BDCKW do not formulate a version over other number fields (§3.2), and none is stated here.

**Hypotheses.**

- 𝒳 a regular minimal Z-model as in BDCKW §2.1; p odd of good reduction for 𝒳 and b.
- In NC.4 terms, X(Z_p)_n is the crystalline locus crystallineLocus_n for the stringent local conditions C_v = Im j_v at v ≠ p and the crystalline condition at p.
- Depth indexing: U⟨n⟩ = U/Γ_{n+1}U, so n = 1 is the abelian depth.

**Construction.**

1. Represent H¹_f(G_T, U⟨n⟩) and the localisation maps (NC.3/selmer-functor, NC.3/selmer-representability).
2. Finiteness of Im j_v for v ≠ p (Kim–Tamagawa, as cited by BDCKW 2.5) and triviality for good v ∉ T make Sel_n(𝒳) a closed subscheme; define X(Z_p)_n through the local Kummer map j_p (NC.4/kim-loci).
3. Monotonicity in n and containment of 𝒳(Z) follow from NC.4/locus-compatibilities and NC.4/rational-integral-containment.
4. Independence of T and b: BDCKW §2.8 (inflation lemma for closed normal subgroups) and §2.9 (twisting by the path torsor P(b, c)).
5. Define the propositions as eventual equality.

**Uses.**

- BDCKW §§5–8: The conjecture is tested by computing X(Z_p)_n for punctured elliptic curves, the thrice-punctured line and Fermat curves.
- BDCKW §3.4: Presented as the unipotent counterpart of the surjectivity in the section conjecture and of finiteness of Ш.
- NC.6/thrice-punctured-depth-one: The depth-one instance proved in BDCKW §6.1.
- EffectiveDiophantineMethods ED.6: Certified enumeration compares a computed finite locus with the known global points; equality at some depth is what makes such a comparison exhaustive.

**Planning API.**

- `kimLocus` (data): X(Z_p)_n = j_p⁻¹(loc_p(Sel_n(𝒳))) ⊆ 𝒳(Z_p).
- `kimLocus_antitone` (relation): X(Z_p)_{n+1} ⊆ X(Z_p)_n for every n ≥ 1.
- `integral_subset_kimLocus` (relation): 𝒳(Z) ⊆ X(Z_p)_n for every n.
- `kimConjecture_iff_exists_subset` (characterisation): KimConjecture(𝒳, p) holds if and only if X(Z_p)_n ⊆ 𝒳(Z) for some n, by the two previous items.
- `kimLocus_eq_crystallineLocus` (compatibility): X(Z_p)_n equals NC.4's crystallineLocus_n for the stringent local conditions.
- `kimLocus_indep_T` (compatibility): For T ⊆ T′ both containing p and the bad primes, the Selmer schemes for T and T′ are isomorphic compatibly with loc_p, so X(Z_p)_n does not depend on T.
- `kimLocus_indep_basepoint` (compatibility): Twisting by the path torsor P(b, c) identifies the Selmer schemes for integral base points b and c compatibly with loc_p and the Kummer maps, so X(Z_p)_n does not depend on b.
- `kimConjectureS` (data): The S-integral proposition: X(Z_p)_{S,n} = 𝒳(Z[1/S]) for n large, with KimConjectureS ∅ = KimConjecture.
- `EventualEquality` (other): The form on families of sets: L n = G for all large n; KimConjecture is the instance L n = X(Z_p)_n, G = 𝒳(Z).
- `eventualEquality_iff_exists_subset` (characterisation): For an antitone family L with G ⊆ L n for all n, eventual equality holds if and only if L n ⊆ G for some n.
- `eventualEquality_iInter` (relation): For an antitone family, eventual equality with G implies ⋂_n L n = G; the converse fails (kimConjecture_not_intersection).

**Unit tests.**

- `kimConjecture_thrice_punctured_p5` (computation): For 𝒳 = P¹ ∖ {0, 1, ∞} over Z with the tangential base point at 0 and p = 5, X(Z_5)_1 = ∅ = 𝒳(Z), so the conjecture holds from depth 1 (BDCKW §6.1).
- `kimLocus_thrice_punctured_p7` (computation): For the same 𝒳 and p = 7, X(Z_7)_1 = {ζ_6, ζ_6⁵} ≠ 𝒳(Z) = ∅: equality is eventual, not at depth 1 (BDCKW §6.2).
- `kimConjecture_not_intersection` (non-example): Eventual equality is stronger than ⋂_n X(Z_p)_n = 𝒳(Z): for the decreasing family L_n = G ∪ {m ∈ ℕ : m ≥ n} with G finite, the intersection is G but no L_n equals G, so a definition by the intersection would accept it.
- `kimConjectureS_empty` (degenerate): For S = ∅ the S-integral Selmer scheme is Sel_n(𝒳) and KimConjectureS reduces to KimConjecture.
- `kimLocusS_half_contains` (computation): For P¹ ∖ {0, 1, ∞} over Z[1/2] and an odd prime p, the three points 2, −1 and 1/2 lie in X(Z_p)_{{2},2}, the zero set of 2Li_2(z) + log(z)log(1 − z) (BDCKW §8.2).

**Acceptance.**

- For P¹ ∖ {0, 1, ∞} over Z and p = 5, X(Z_5)_1 = ∅ = 𝒳(Z) (NC.6/thrice-punctured-depth-one).
- For P¹ ∖ {0, 1, ∞} over Z and p = 7, X(Z_7)_1 consists of the two primitive sixth roots of unity, so equality fails at depth 1.

**Prerequisites.** `AnabelianGeometryAndNonabelianChabauty:NC.3/selmer-functor`, `AnabelianGeometryAndNonabelianChabauty:NC.3/selmer-representability`, `AnabelianGeometryAndNonabelianChabauty:NC.4/kim-loci`, `AnabelianGeometryAndNonabelianChabauty:NC.4/locus-compatibilities`, `AnabelianGeometryAndNonabelianChabauty:NC.4/rational-integral-containment`, `AnabelianGeometryAndNonabelianChabauty:NC.4/global-etale-albanese`, `mathlib:Filter.Eventually`.

**Sources.**

- BDCKW, §1.3–1.4, pp.2–3; §§2.1–2.9, pp.8–12; §3.1–3.2, pp.12–13; §8.1, p.48. Defines the Selmer scheme with stringent local conditions, the nested loci and their independence of T and the base point, states the eventual equality conjecture over Z, notes that no number-field version is formulated, and introduces the S-integral variant.

### 18. Kim's conjecture at depth one for the thrice-punctured line

Node `thrice-punctured-depth-one` · application.

Let 𝒳 = P¹ ∖ {0, 1, ∞} over Z with the tangential base point at 0. Then 𝒳(Z) = ∅. At depth 1, U⟨1⟩ = Q_p(1)², Sel_1(𝒳) = 0 and j_p(z) = (log z, log(1 − z)), so X(Z_p)_1 is the set of z ∈ Z_p with z and 1 − z both roots of unity, which is the set of primitive sixth roots of unity lying in Z_p. Hence for p = 3 or p ≡ 2 mod 3, X(Z_p)_1 = ∅ and KimConjecture(𝒳, p) holds from depth 1. For p ≡ 1 mod 3, X(Z_p)_1 = {ζ_6, ζ_6⁵}; Sel_2(𝒳) = 0 by Soulé's vanishing H¹(G_T, Q_p(2)) = 0, and X(Z_p)_2 = ∅ if and only if the p-adic dilogarithm Li_2(ζ_6) is nonzero. BDCKW report that Li_2(ζ_6) ≠ 0 for 3 ≤ p < 10⁵ by a numerical computation; that report is not a theorem of this layer.

**Hypotheses.**

- p odd; 𝒳(Z) = ∅ because z and 1 − z cannot both be units of Z.
- The depth-two statement for p ≡ 1 mod 3 is an equivalence with a nonvanishing condition, not an unconditional equality.

**Proof outline.**

1. 𝒳(Z) is empty: the only units are ±1, and 1 − 1 = 0, 1 − (−1) = 2.
2. Sel_1(𝒳) = 0: it is (Z^× ⊗ Q_p)² with the stringent conditions (NC.3/depth-one-selmer-comparison, SIC L0/s-unit-kummer-identification).
3. The depth-1 local Kummer map is (log z, log(1 − z)) (NC.4/depth-one-period); a zero of the p-adic logarithm on Z_p^× is a root of unity, and z, 1 − z both roots of unity forces z to be a primitive sixth root of unity.
4. A primitive sixth root of unity lies in Z_p exactly when p ≡ 1 mod 3.
5. For p ≡ 1 mod 3, add the depth-2 coordinate −Li_2(z); since Li_2(ζ_6) + Li_2(ζ_6⁻¹) = 0, the two candidates vanish or survive together.

**Acceptance.**

- p = 5: X(Z_5)_1 = ∅.
- p = 7: X(Z_7)_1 = {3, 5} modulo the identification of ζ_6 with the Teichmüller lifts of 3 and 5, the primitive sixth roots of unity mod 7.

**Prerequisites.** `kim-conjecture`, `AnabelianGeometryAndNonabelianChabauty:NC.3/depth-one-selmer-comparison`, `AnabelianGeometryAndNonabelianChabauty:NC.4/depth-one-period`, `SelmerIwasawaCohomology:L0/s-unit-kummer-identification`.

**Sources.**

- BDCKW, §6.1–6.3, pp.43–45; §1.14, p.7. Computes the depth-one locus of the thrice-punctured line through the logarithms, proves the depth-one case for p = 3 and p ≡ 2 mod 3, reduces the depth-two case for p ≡ 1 mod 3 to nonvanishing of Li_2 at a sixth root of unity, and reports the numerical check.

## How the frontier fits together

**Profinite side.** The section map κ_X: X(k) → Sect(X/k) is built in two steps: IG.1 gives the section of a rational point, NC.0 shows that its conjugacy class does not depend on the path used to compare base points. For an abelian variety, sections and the Kummer map agree (`kummer-section-comparison`); because a finitely generated abelian group has no nonzero divisible element, the Mordell–Weil theorem (HeightsRationalPointsAndObstructions RP.1) and the Abel–Jacobi embedding (RP.6) make κ_X injective for curves of genus at least one over number fields (`section-map-injective`). The section conjecture (`section-conjecture`) is then exactly the surjectivity of κ_X for curves of genus at least two. In particular it predicts that a curve with no rational point has no section at all, which is the form in which it is usually tested.

**Unipotent side.** The chain of implications Kim proves, with the hypotheses as planned here, is:

1. Bloch–Kato for the motives h^n(X^n)(1), n ≥ 2, in the form H¹_g = 0 (`bloch-kato-implies-vanishing`), or a weight filtration on every extension class (`weight-splitting-implies-vanishing`), implies Selmer vanishing (Conjecture 2).
2. Selmer vanishing implies the H² estimate dim H²(G_T, gr_n U) ≤ P(n)g^n (`h2-growth-bound`), by cohomological dimension two, Poitou–Tate duality, local duality, the weight filtration of semistable reduction away from p and the Hodge–Tate weights at p.
3. The H² estimate, Tate's Euler characteristic formula and the growth d_n ~ λ^n/n with λ > g (`graded-central-dimensions`) give the dimension inequality at some depth (`vanishing-implies-dimension`): Conjecture 2 implies Conjecture 1.
4. Conjecture 1 gives finiteness of the integral points through NC.4/dimension-finiteness (`finite_of_kimDimensionConjecture`).

Two further bridges reach Conjecture 1 without Conjecture 2: weak Jannsen vanishing for affine curves (`weak-jannsen-implies-dimension`), and pseudo-nullity of an Iwasawa module for punctured CM elliptic curves (`pseudo-null-implies-dimension`). Two cases are proved outright: the thrice-punctured line over Z[1/S], using Soulé's computation of the Galois cohomology of Tate twists (`genus-zero-dimension`), and punctured CM elliptic curves of Selmer rank one, using refined local conditions at depth two (`cm-rank-one-finiteness`). The bookkeeping that keeps these honest is the dimension count: the Euler characteristic gives dim H¹ − dim H² = d_n⁻, the (−1)-eigenspace of complex conjugation, and the published proof uses d_n⁻ = d_n/2, which needs the correction recorded below in the affine case.

**Eventual equality.** NC.4 shows that the global points lie in every locus and that the loci decrease with the depth; finiteness at one depth comes from the dimension inequality. Kim's conjecture (`kim-conjecture`) asks for more: that the loci with stringent local conditions eventually consist of the global points only. It is not implied by Conjecture 1 (finite is not equal), and it is stronger than equality of the intersection of all loci with the global points. BDCKW present it as a unipotent counterpart of the surjectivity in the section conjecture and of finiteness of Ш: for an elliptic curve with finite p-primary Ш, the depth-one stringent Selmer group is E(Q) ⊗ Q_p (BDCKW §3.4.1). The thrice-punctured line gives the first test (`thrice-punctured-depth-one`): over Z there are no integral points, the depth-one locus is cut out by the logarithms of z and 1 − z, and it is empty exactly when Q_p contains no primitive sixth root of unity.

## The suggested Lean file

The carriers of the geometric statements (étale fundamental groups of schemes, unipotent completions, Selmer varieties, Galois cohomology of number fields with Q_p-coefficients) are not available at the pins, so the suggested file states the frontier on the carriers that exist, with light definitions that have real bodies:

- `GaloisSection q` for a continuous homomorphism `q : E →ₜ* Γ` (Mathlib's `ContinuousMonoidHom`), the conjugacy relation `GaloisSection.Conj` by the kernel of `q`, the difference cocycle `GaloisSection.diff` with its twisted cocycle identity, functoriality `GaloisSection.map` along morphisms of extensions (with proofs), `SectionClasses q` as the quotient, `SectionClasses.mk`, `SectionClasses.mk_eq_mk_iff`, `SectionClasses.orbit_eq_kim`, `SectionClasses.map`, `sectionClassMap`, `sectionClassMap_natural`, `sectionClassMap_eq_iff` and `SectionConjectureFor`, with examples for the identity extension (the case Spec k), for two points with one section (the P¹ failure), and the bijectivity characterisation.
- `eq_zero_of_forall_divisible` (a finitely generated abelian group has no nonzero element divisible by every n) and `injective_of_kummer`, the logical shape of Stix's Theorem 45.
- `wittDim`, `lucasSum` and `labuteDim` with the divisor-sum identities `sum_divisors_mul_wittDim` and `sum_divisors_mul_labuteDim`, and the values 2, 1, 2, 3, 6 (m = 2), 4, 5, 16 (g = 2) and 2, 0 (g = 1); these values were also evaluated on the pinned build.
- `KimDimensionInequality`, `EventuallyVanishing` and `EventualEquality` on sequences of dimensions and of sets, with `kimDimensionInequality_mono`, `eventualEquality_iff_exists_subset`, `eventualEquality_iInter` and the example showing that the intersection of a decreasing family can equal G without eventual equality.
- `exists_primitiveRoot_six_iff` and the examples p = 5, 7, the residue-level form of the depth-one computation, and the emptiness of the integral points of the thrice-punctured line.

The remaining API items and tests of the packet are listed by name at the end of the file as README targets.

## Inputs requested from other roadmaps

Each request names an exact statement; the owner is unchanged.

**`ArithmeticKTheory:N.5`.** For T = S ∪ {p} with S a finite set of primes and p odd: dim_{Q_p} H¹(G_{Q,T}, Q_p(k)) = 1 for odd k ≥ 3, H¹(G_{Q,T}, Q_p(k)) = 0 for even k ≥ 2, and H²(G_{Q,T}, Q_p(k)) = 0 for k ≥ 2 (Soulé's computation, stated in continuous Galois cohomology with Q_p-coefficients). Consumers: `genus-zero-dimension`.

**`EtaleDualityAndPerverseSheaves:EDC.0`.** Künneth for ℓ-adic and p-adic étale cohomology of a product of smooth (not necessarily proper) curves over a field of characteristic zero: H¹(C_{F̄})^{⊗n} is a Galois-stable direct summand of H^n(C^n_{F̄}), compatibly with Tate twists. Consumers: `bloch-kato-implies-vanishing`, `weak-jannsen-implies-dimension`.

**`ArithmeticGaloisDuality:D7`.** The Hochschild–Serre exact sequence 0 → H¹(G/N, M^N) → H¹(G, M) → H⁰(G/N, H¹(N, M)) → H²(G/N, M^N) in continuous cohomology of profinite groups with coefficients an inverse system of finite modules satisfying the Mittag-Leffler condition (Jannsen), and its rational version. Consumers: `pseudo-null-implies-dimension`.

## Recorded gaps

- **Primary source for Labute's dimension formula not read** (`graded-central-dimensions`). The surface-group case of graded-central-dimensions (Σ_{k|n} k·d_k = α^n + β^n) is taken from Kim 2009 pp.122–123, which cites Labute, J. Algebra 14 (1970), 16–23. The publisher did not serve that paper to this worker. The formula was checked against the free survey of Linton and Nyberg-Brodda (arXiv:2501.18306, §1.7, equation (32), p.65), which gives it in genus 2 and the growth rate g + √(g² − 1) in every genus, and against small cases (g = 1 gives the abelian case; g = 2 gives d_2 = 5 = dim Λ²H₁ − 1 and d_3 = 16). It is also equivalent to the enveloping algebra of the graded Lie algebra having Hilbert series 1/(1 − 2g t + t²) (take logarithms of the PBW product). A follow-up reads Labute 1970 or Labute, Invent. Math. 4 (1967), Théorème 2, and pins the primary locator for all g.
- **Greenberg's finite-generation input not read** (`pseudo-null-implies-dimension`). The proof of Observation 4 uses that pseudo-nullity of I over Λ makes I finitely generated over Z_p, citing Greenberg, Invent. Math. 47 (1978), §2 (Kim 2009 p.131). That source was not read; the step is recorded with Kim's citation only.
- **Bloch–Kato Conjecture 5.3 read only through Kim** (`bloch-kato-implies-vanishing`). Bloch–Kato, 'L-functions and Tamagawa numbers of motives' (Grothendieck Festschrift I, 1990) is not freely available to this worker. The hypothesis of bloch-kato-implies-vanishing is therefore stated in the form actually used, H¹_g(G_F, H^n(X^n_{F̄}, Q_p(1))) = 0 for n ≥ 2, with the attribution to Conjecture 5.3 as given by Kim 2009 pp.121–122.

## Source corrections

The following findings are recorded in the packet with the version read. The nodes use the corrected statements. Earlier findings on BDMTV (truncation tail condition, φ branch) remain recorded as well; they concern the precision analysis owned by EffectiveDiophantineMethods ED.6.

**E-NC6-kim-conjugation-eigenspaces** (error; Kim 2009, Publ. RIMS 45 (2009), §3, proof of Proposition 2, p.123 (published version).). For n odd, the right-hand side of the Euler characteristic formula, the dimension of the (−1)-eigenspace of complex conjugation on the graded piece Z_{n+1}\Z_n, is asserted to be d_n/2, by comparison with complex Hodge theory. Correction: The value d_n/2 holds when the graded piece is pure of odd weight, which is the compact case. In general the (−1)-eigenspace has dimension (d_n − τ_n)/2, where τ_n is the trace of complex conjugation on the graded piece, computed from its trace t on H₁ by τ_n = (1/n)Σ_{e|n} μ(e) t_e^{n/e} (t_e = t for odd e, t_e = m for even e). Either |t| < m and τ_n = o(d_n), or t = −m and conjugation acts by (−1)^n; in both cases the sum of the (+1)-eigenspace dimensions still grows like λ^n/n with λ > g, so Proposition 2 survives with this replacement. Reason: For X = P¹ ∖ {0, 1, ∞} over Q, each graded piece is Q_p(n)^{d_n} and complex conjugation acts on Q_p(n) by (−1)^n, so for odd n the (−1)-eigenspace is the whole piece, of dimension d_n, not d_n/2. In the affine case the graded pieces are mixed (the boundary contributes Tate twists of even weight), and the Hodge-symmetry argument applies only to pure odd weight. Affects: the proof. Known: new; no erratum found.

**E-NC6-kim-h1-notation** (misprint; Kim 2009, Publ. RIMS 45 (2009), §3, proof of Lemma 6 (p.124) and proof of Observation 3 (p.125).). The coefficient module surjecting onto the graded piece in H², and the module in the exact sequence with Q_p(1)^{s−1} in the proof of Observation 3, are written as tensor powers of H¹(X̄, Q_p). Correction: Read H₁ = H¹(X̄, Q_p)^∨ in both places: the graded pieces are quotients of H₁^{⊗n}, local duality turns H²(G_w, H₁^{⊗n}) into H⁰(G_w, H¹^{⊗n}(1)), and the extension 0 → Q_p(1)^{s−1} → H₁(X) → H₁(X′) → 0 holds for homology (for cohomology the boundary term is a quotient Q_p(−1)^{s−1}). Reason: The lower central quotients of the unipotent fundamental group are generated by its abelianisation H₁, and the subsequent local estimate on p.124 uses the invariants of H¹^{⊗n}(1), which is the local dual of H₁^{⊗n}, not of H¹^{⊗n}. Affects: nothing. Known: new; no erratum found.

**E-NC6-kim-purity-open** (error; Kim 2009, Publ. RIMS 45 (2009), §3, argument after Observation 2, p.122.). V_n is said to be pure of weight n − 2. Correction: This holds when X is proper. For an affine curve, H¹(X̄) is mixed of weights 1 and 2 and V_n has weights in [n − 2, 2n − 2]; the argument still works because all weights are at least n − 2 ≥ 1 for n ≥ 3, so W_0E ∩ V_n = 0. Reason: Conjecture 2 is stated for any smooth curve; for X = P¹ ∖ {0, 1, ∞}, V_n = Q_p(1 − n)^{2^n} is pure of weight 2n − 2, not n − 2. Affects: the proof. Known: new; no erratum found.

**E-NC6-kim-rank-one** (gap; Kim 2009, Publ. RIMS 45 (2009), §4, pp.127 and 129.). Finiteness of integral points is claimed for CM elliptic curves over Q of rank 1 independently of any conjecture, and the dimension of the refined Selmer group of H¹(Ē, Q_p) is said to be 1 by the rank one hypothesis. Correction: The computation needs the Bloch–Kato Selmer group of V_pE to have dimension one. Rank one of E(Q) gives this only together with finiteness of Ш(E)[p^∞], which is known for instance when the analytic rank is one (Gross–Zagier and Kolyvagin). State the hypothesis as Selmer rank one. Reason: The Selmer group H¹_f(G_Q, V_pE) has dimension rank E(Q) + corank Ш(E)[p^∞]; without finiteness of the p-part of Ш the dimension can exceed the rank, and then the depth-two dimension count 1 < 2 is not established. Affects: a stated result. Known: new; no erratum found.

**E-NC6-bdckw-prime-list** (misprint; BDCKW, arXiv:1209.0640v4, §1.16, p.8.). The S-integral conjecture for the thrice-punctured line with S = {2} is said to hold in depth 2 for p = 3, 5, 6. Correction: p = 3, 5, 7, as in §8.2 (p.49). Reason: 6 is not prime, and §8.2 reports the numerical check for p = 3, 5, 7 and failure from p = 11. Affects: nothing. Known: new for v4; the published version (Math. Ann. 372 (2018)) was not read.

**E-NC6-bdckw-congruence-or** (misprint; BDCKW, arXiv:1209.0640v4, §7.6, p.48.). The check is reported for d = 2 and all 3 ≤ p ≤ 53 with p ≡ 3 mod 8 and p ≡ 5 mod 8. Correction: p ≡ 3 mod 8 or p ≡ 5 mod 8, the odd primes for which 2 is not a square in Q_p. Reason: No prime satisfies both congruences; the construction needs d = 2 to be a nonsquare in Q_p, which holds exactly for p ≡ ±3 mod 8. Affects: nothing. Known: new for v4; the published version was not read.

**E-NC6-bdckw-selmer-index** (misprint; BDCKW, arXiv:1209.0640v4, §6.2, p.44.). In the case p ≡ 1 mod 3 the text says that Sel_1(X) still vanishes because H¹(G_T, Q_p(2)) = 0. Correction: Sel_2(X) = 0: the vanishing of H¹(G_T, Q_p(2)) is what extends Sel_1(X) = 0 to depth two, as the next display (X(Z_p)_2 cut out by log z, log(1 − z), Li_2) requires. Reason: Sel_1(X) = 0 was already shown in §6.1 from Q_p(1); the new graded piece at depth two is Q_p(2). Affects: nothing. Known: new for v4; the published version was not read.

**E-NC6-stix-theorem-reference** (misprint; Stix 2008, arXiv:0809.0017v1, Appendix B, Remark 46, p.22.). The remark refers to the assumptions of Theorem B. Correction: Theorem 45, the only theorem of Appendix B. Reason: No Theorem B exists in the paper; the remark follows Theorem 45 and discusses its divisibility hypothesis. Affects: nothing. Known: new for v1; the published version (Adv. Stud. Pure Math. 63) was not read.

**E-NC6-kim2005-soule-range** (misprint; Kim 2005, arXiv:math/0409456v1, §3, end of the proof of the main theorem, p.18.). H¹(G_T, Q_p(2n+1)) is said to have dimension 1 for n ≥ 3, and the resulting bound ends with the term r_{2⌊n/2⌋}. Correction: Dimension 1 for n ≥ 1 (all odd twists at least 3), and the bound runs over the odd indices 3, 5, …, up to the largest odd integer at most n. Reason: Soulé's theorem gives dimension one for every odd twist m ≥ 3, and the bound already uses the terms r_3 and r_5 (twists 3 and 5); the graded pieces with nonzero H¹ are those of odd degree, while 2⌊n/2⌋ is even. Affects: nothing. Known: new for v1; the published version (Invent. Math. 161 (2005)) was not read.

## Dependencies

Inside this roadmap: NC.0 (path torsors, transported sections, cocycles), NC.2 (central series, Galois structure, Hodge filtration, depth-one Jacobian comparison), NC.3 (nonabelian H¹, Selmer functors and representability, central extensions, local conditions, refined Selmer dimension bound, depth-one Selmer comparison), NC.4 (de Rham Albanese map, Chabauty–Kim loci, their compatibilities, containment of global points, conditional finiteness at a given depth, depth-one period). NC.1 and NC.5 are not used by any node of this layer.

Other roadmaps, by layer: InverseGaloisAndArithmeticFundamentalGroups IG.0–IG.1 (étale fundamental group, base points, arithmetic exact sequence); HeightsRationalPointsAndObstructions RP.1 (Kummer map, Mordell–Weil) and RP.6 (Abel–Jacobi embedding); SchemeAndStackFoundations SF.3 (Tate module of the Jacobian and H¹ of the curve); AbelianSchemesAndArithmeticModuli A3 (multiplication by n); ArithmeticGaloisDuality R02.4 (Poitou–Tate, Ш, cohomological dimension, global Euler characteristic, rational coefficients) and D7 (local duality, continuous cochains); SelmerIwasawaCohomology L0 (S-unit Kummer identification) and L4 (elliptic Bloch–Kato Selmer groups); PadicHodgeTheory R06.2 and R06.5 (de Rham comparison, de Rham implies Hodge–Tate, Tate's theorem, Weil pairing); PadicHodgeRegulators L1 (H¹_e, H¹_f, H¹_g); MotivicEtaleKTheory M.8 (étale Chern maps); DeligneWeightsAndPurity DWP.10 (weights of semistable curves); WeightsInEtaleCohomology R34.2 (purity at good places); PadicMeasuresIwasawaAlgebras L4 (pseudo-null modules); QSeriesPartitionsAndMockModularForms QM.6 (Witt's formula); and the requested statements of ArithmeticKTheory N.5, EtaleDualityAndPerverseSheaves EDC.0 and ArithmeticGaloisDuality D7 above. This layer cites no layer of EffectiveDiophantineMethods, which sits above it in the upstream order.

## Layer acceptance

The layer is complete when:

- the section map is defined from IG.1 and NC.0 without choosing a path, and `SectionClasses.orbit_eq_kim` shows that Kim's formulation and Stix's agree;
- the injectivity theorem is proved for curves of genus at least one over number fields from the Kummer comparison and Mordell–Weil, and the P¹ example shows that its immersion hypothesis cannot be dropped;
- the section conjecture is a named proposition, equivalent to surjectivity under the injectivity theorem, and fails for P¹ and for G_m over Q for the two different reasons recorded in its tests;
- Kim's Conjectures 1 and 2 are named propositions in the depth convention of NC.2–NC.4 (depth one is the abelianisation), with the depth-one Chabauty test, the Z and Z[1/2] tests for the thrice-punctured line and the crystalline-condition test;
- the graded dimension formulas reproduce 2, 1, 2, 3, 6 for m = 2 and 4, 5, 16 for genus two;
- each conditional bridge carries its hypothesis in the exact form used, and the proof of the Conjecture 2 to Conjecture 1 implication uses the corrected eigenspace count;
- Kim's eventual-equality conjecture is stated for BDCKW's three kinds of models with the stringent conditions, is independent of T and of the base point, and its depth-one case for the thrice-punctured line holds exactly for p = 3 and p ≡ 2 mod 3.

The layer is closed when, in addition, the three requested supplier statements are available and the three recorded source gaps are resolved.
