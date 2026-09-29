# Noncommutative and equivariant Iwasawa theory — blueprint

This blueprint covers stages NE.0–NE.7. After the sixth checkpoint:
- **NE.1 is source-decomposed.**
- **NE.0 is partial.**
- **NE.2 is partial:** CFKSV §§3–4 — the localisation sequence and characteristic elements.
- **NE.3 is partial:** CFKSV §3 — twists, Φ_ρ, evaluation at representations, Akashi series and Euler characteristics.
- **NE.4 and NE.5 are partial:** CFKSV §5 — the dual Selmer module, the 𝔐_H(G) conjecture, the conjectural p-adic
  L-function and the main conjecture (checkpoint 4).
- **NE.6 is partial:** Kakde §§1–5 and §6.1 — the abelian case, Burns–Kato patching, the reductions, the congruence
  description of K′₁ (Theorems 52–53) and the criterion MC ⇔ (ζ_P) ∈ Φ^G_S (checkpoints 5–6).
- **NE.7 is not yet read.**

The accepted restructuring RS-16 moves the construction of completed group algebras, with restriction, induction and
augmentation, to PadicMeasuresIwasawaAlgebras L1. NE.0 therefore keeps only:
- the noetherian and module-finiteness facts about Iwasawa algebras of compact p-adic analytic groups;
- the group theory those facts need.

The sources are:
- **CFKSV:** Coates–Fukaya–Kato–Sujatha–Venjakob, *The GL₂ main conjecture for elliptic curves without complex
  multiplication*, Publ. Math. IHÉS 101 (2005), §§2–5. It is open access on Numdam; arXiv math/0404297 was compared.
- **Lazard:** *Groupes analytiques p-adiques*, Publ. Math. IHÉS 26 (1965), Chap. II §2.2 and Chap. V §2.2. It is on
  Numdam.
- **Ardakov–Brown:** *Ring-theoretic properties of Iwasawa algebras: a survey*, arXiv math/0511345, §§2–4. Used for the
  statements of Lazard's and Dixon–du Sautoy–Mann–Segal's results.
- **Burns–Venjakob:** *On the leading terms of zeta isomorphisms…*, arXiv math/0511672v2, §2.2 (the category Σ_S).

## Purpose

The GL₂ main conjecture and its successors are formulated in K-theory of a localisation of the Iwasawa algebra
Λ(G) = ℤ_p⟦G⟧ of a compact p-adic Lie group G.

NE.1 constructs the denominator set:
- the canonical Ore set S of CFKSV, for a closed normal subgroup H with G/H ≅ ℤ_p;
- its saturation S* = ⋃ pⁿS;
- the localisations Λ(G)_S and Λ(G)_{S*} = Λ(G)_S[1/p];
- the category 𝔐_H(G) of finitely generated S*-torsion modules (for H = 1 these are the torsion Λ(Γ)-modules);
- the category Σ_S of perfect complexes that become acyclic after localisation.

NE.2 consumes all of these for the localisation sequence K₁(Λ(G)) → K₁(Λ(G)_{S*}) → K₀(𝔐_H(G)) and for
characteristic elements.

## What the libraries and other roadmaps supply

**Mathlib has:**
- Ore localisation for noncommutative rings (`OreLocalization`, `OreLocalization.OreSet`), its universal property
  (`OreLocalization.universalHom`, `universalHom_unique`), and injectivity for nonzero divisors
  (`OreLocalization.numeratorHom_inj`);
- p-groups (`IsPGroup`), open normal subgroups, subgroup closures and commutators;
- noetherian rings and polynomial rings (`MvPolynomial.isNoetherianRing`), and flat modules.

It has no flatness theorem for Ore localisation, which is planned here.

**Tau Ceti has** pro-p groups (`TauCeti.IsProP`) and the maximal pro-p quotient. Its ProfiniteProPGroups Layer 9
builds `completedGroupAlgebra` with the power-series coordinate for ℤ_p; that coordinate is requested.

**Imported by request:**
- **PadicMeasuresIwasawaAlgebras L1:** Λ(G) and Ω(G) for nonabelian profinite G, the maps φ_J and ψ_J, augmentation,
  and restriction/induction.
- **ProfiniteProPGroups Layer 9:** Λ(ℤ_p) ≅ ℤ_p⟦T⟧.
- **GeneralAlgebraicKTheory K.4:** the category C^p(R) of bounded complexes of finitely generated projective modules.

## Conventions

- **The standing hypotheses.**
  - G is a compact p-adic analytic group, defined as a profinite group with an open normal uniform pro-p subgroup.
    Lazard's equivalence with the analytic definition is a gap.
  - H ◁ G is closed, and Γ = G/H ≅ ℤ_p.
- **The algebras.** Λ(−) = ℤ_p⟦−⟧ and Ω(−) = F_p⟦−⟧. Coefficients O (integers of a finite extension of ℚ_p) are
  admitted through O⟦G⟧ = O ⊗ Λ(G).
- **Modules** are left modules unless stated otherwise.
- **Ore conditions.**
  - CFKSV write them as s w₁ = r t₁ and w₂ s = t₂ r.
  - Mathlib's `OreSet` localises on the left, S⁻¹R, with t r = w s. The prototype uses Mathlib's orientation.
- **Distinct hypotheses.** "No element of order p", "torsion-free" and "pro-p" are different, and NE.1 does not use
  the first.

## Milestones

Library modules:
- `TauCeti/NumberTheory/NoncommIwasawa/AnalyticGroup` (NE.0);
- `TauCeti/NumberTheory/NoncommIwasawa/CanonicalOre` (NE.1).

The namespace is `TauCeti.NoncommIwasawa`.

### NE.0, Milestone 1: uniform and compact p-adic analytic groups

**Definition: the lower p-series** (`lowerPSeries`; node `lower-p-series`; Ardakov–Brown §2.3).
- P₁ = G, and P_{i+1} is the closure of P_i^p [P_i, G].
- *Unit tests.*
  - ℤ_p gives P_i = p^{i−1}ℤ_p.
  - The trivial group.
  - ℤ/p², with indices p, p, 1.

**Definition: uniform groups** (`IsUniform`; node `uniform-pro-p-group`). A uniform group is powerful, finitely
generated, and has constant indices |P_i : P_{i+1}|.
- *Unit tests.*
  - ℤ_p^d is uniform.
  - ℤ/p is powerful but not uniform.
  - The trivial group is uniform.

**Definition: compact p-adic analytic groups** (`IsCompactPAdicAnalytic`; node `compact-padic-analytic-group`; planet
"Compact p-adic analytic groups"; Ardakov–Brown §§2.1, 2.3). A profinite group with an open normal uniform pro-p
subgroup.
- *Unit tests.*
  - Finite groups.
  - ℤ_p.
  - ∏ ℤ/p is not an example.

### NE.0, Milestone 2: ring-theoretic finiteness

**Lemma: freeness over open subgroups** (node `iwasawa-free-over-open-subgroup`; Lazard II.2.2.7; CFKSV p. 166).
Λ(H) is free of rank [H : H′] over Λ(H′), on coset representatives.

**Theorem: local iff pro-p** (node `iwasawa-local-iff-pro-p`; Lazard II.2.2.2; Ardakov–Brown 4.1(2)).
- For J pro-p, Λ(J) is local with maximal ideal ker(Λ(J) → F_p).
- *Test.* ℤ_p[ℤ/ℓ] with ℓ ≠ p is not local.

**Theorem: the graded ring of a uniform group** (node `uniform-graded-polynomial`; planet "PBW theorem for uniform
groups"; Ardakov–Brown 3.1, 3.4).
- Every element has a PBW expansion Σ c_α b^α.
- gr_J Ω(G) ≅ F_p[X₁, …, X_d].

**Lemma: Zariskian filtrations** (node `zariskian-noetherian`; Ardakov–Brown 3.4–3.5). A complete filtration with
noetherian gr gives a noetherian ring.

**Theorem: Lazard's noetherian theorem** (node `iwasawa-noetherian`; planet "Lazard's noetherian theorem"; Lazard
V.2.2.4; Ardakov–Brown 4.1(1)). Λ(G) and Ω(G) are left and right noetherian and complete semilocal.

**Lemma: compact Nakayama** (node `compact-nakayama`). For compact Λ(J)-modules:
- M is finitely generated iff M/𝔪_J M is finite, iff M_J is a finitely generated ℤ_p-module.
- The proof comes from Lazard II.2.2.2.
- CFKSV use the lemma without a proof.

### NE.1, Milestone 3: the canonical Ore set

**Definition: the canonical set** (`canonicalSet`; node `canonical-ore-set`; planet "Canonical Ore set"; CFKSV §2).
S = {f : Λ(G)/Λ(G)f is finitely generated over Λ(H)}. It is prototyped abstractly for a ring A that is a left B-module
through left multiplication.

*API.*
- `mem_canonicalSet_iff`.
- `one_mem_canonicalSet`.
- `mul_mem_canonicalSet`.

*Unit tests.*
- **B = A:** S = A, including 0. This shows that the zero-divisor statement needs the group hypotheses.
- **F_p⟦T⟧ over F_p:** S = {f ≠ 0}.
- **ℚ[X] over ℚ:** S = {f ≠ 0}.
- **Λ(ℤ_p) with H = 1:** p ∉ S and T ∈ S.

**Lemmas:**
- `central-zp-subgroup`: an open central Π ≅ ℤ_p in G/J (CFKSV (5)).
- `quotient-total-algebra`: V(G/J) = R(Π) ⊗ Ω(G/J), finite-dimensional over the central field R(Π), with the
  left–right unit symmetry.
- `canonical-set-left-criteria`: Lemma 2.1. The criteria are:
  - finite generation of the J-coinvariants over ℤ_p;
  - finiteness of Ω(G/J)/Ω(G/J)ψ_J(f);
  - injectivity of right multiplication by ψ_J(f).
- `canonical-set-right-criteria`: Lemma 2.2.

**Theorem: S-torsion equals finite generation over Λ(H)** (node `s-torsion-iff-finitely-generated`; planet;
Proposition 2.3). The proof is an ascending chain argument in the noetherian Λ(J), with the monic element
s_n = τⁿ − … − a₀.

**Theorem: the canonical Ore theorem** (node `canonical-ore-theorem`; planet "CFKSV Ore theorem"; Theorem 2.4).
- S is multiplicatively closed.
- S is left and right Ore.
- S consists of nonzero divisors.

This gives Mathlib's `OreSet` structure (`oreSet` in the prototype).

**Lemma and theorem:**
- `nilpotent-transition-kernel`: Lemma 2.5.
- `regular-modulo-prime-radical`: Proposition 2.6, Schneider's description of S as the elements regular modulo the
  prime radical.

### NE.1, Milestone 4: localisations and torsion categories

**Construction: S\*** (node `saturated-ore-set`). S* = ⋃ pⁿS and Λ(G)_{S*} = Λ(G)_S[1/p].
- *Unit tests.*
  - G = Γ, H = 1 gives S* = Λ ∖ {0}.
  - p ∈ S* but p ∉ S.
  - Λ(G)/p is S*-torsion.

**Construction: the canonical localisation** (node `canonical-localization`; planet "Canonical localisation Λ(G)_S").
The localisation is Mathlib's `OreLocalization`.
- It is injective and universal.
- Left and right localisations agree.
- *Test.* For G = Γ, H = 1 it is the localisation at the height-one prime (p).

**Lemma: flatness** (node `ore-localization-flat`).
- R_S is flat.
- The kernel of M → R_S ⊗ M is the S-torsion submodule.
- A complex is acyclic after localisation iff its cohomology is S-torsion.

**Definition: 𝔐_H(G)** (node `category-MHG`; planet "The category 𝔐_H(G)"). Finitely generated S*-torsion modules,
equivalently those with M/M(p) finitely generated over Λ(H).
- It is a Serre subcategory.
- For H = 1 it is the category of torsion Λ(Γ)-modules.

**Definition: Σ_S** (node `torsion-perfect-complexes`; Burns–Venjakob §2.2). Σ_S consists of the perfect complexes C
with R_S ⊗ C acyclic. It is:
- closed under quasi-isomorphism, shifts and extensions;
- described cohomologically, through flatness.

### NE.2, Milestone 5: the localisation sequence and characteristic elements

The source is CFKSV §3 (pp. 172–176) and §4 (pp. 187–193). Library module:
`TauCeti/NumberTheory/NoncommIwasawa/CharacteristicElement`.

**Theorem: finite global dimension** (NE.0 node `iwasawa-finite-global-dimension`). If G has no element of order p,
then gl.dim Λ(G) = d + 1 (Brumer).

**Lemma: K₀ and complete ideals** (node `k0-complete-quotient`; Lemma 4.1). K₀(R) ≅ K₀(R/I) for R I-adically complete.

**Theorem: the localisation sequence** (node `localization-sequence`; planet "Localisation sequence"; (24)). The exact
sequence
K₁(Λ(G)) → K₁(Λ(G)_{S*}) → K₀(𝔐_H(G)) → K₀(Λ(G)) → K₀(Λ(G)_{S*}) → 0.

**Construction: the boundary map** (node `boundary-map`).
- ∂_G[s] = [Λ(G)/Λ(G)s]. The sign is fixed by CFKSV's ∂(f(a)) = [coker α].
- *API.*
  - `boundaryMap_unit`.
  - `boundaryMap_exact`.
  - `boundaryMap_natural`.
- *Unit tests.*
  - For G = Γ, ∂[f] = [Λ/f].
  - ∂ of a unit is 0.
  - ∂[p] = [Λ/p].

**Lemma: detection at a finite level** (node `k0-finite-level-injective`; Lemma 3.5). K₀(Λ(G)) → K₀(ℤ_p[G/P]) is
injective for P pro-p.

**Lemma: detection by characters** (node `k0-representation-injective`). λ = ⊕_ρ j∘τ∘tw_ρ is injective, with
τ[U] = Σ(−1)^i[H_i(G, U)].

**Lemmas: 𝔐_H(G) inputs:**
- `homology-torsion` (Lemma 3.1): H_i(H, M) is a finitely generated torsion Λ(Γ)-module.
- `twist-preserves-MHG` (Lemma 3.2).

**Theorem: surjectivity of ∂_G** (node `boundary-surjective`; Proposition 3.4). ∂_G is surjective when G has no element
of order p.

**Definition: characteristic elements** (node `characteristic-element`; planet "Characteristic elements"; (33)).
- ξ_M satisfies ∂_G ξ_M = [M].
- It is unique up to the image of K₁(Λ(G)).
- *Unit tests.*
  - A cyclic module Λ/Λs has ξ = [s].
  - M = 0.
  - For G = Γ, the characteristic power series up to units.

**Theorem: semilocality** (node `canonical-localization-semilocal`; Proposition 4.2, Lemma 4.3).
- Λ(G)_S is semilocal.
- Λ(ℤ_p²)_{S*} is not.

**Theorem: units and K₁** (node `units-surject-k1`; Theorem 4.4). Units surject onto K₁(Λ(G)_S) and K₁(Λ(G)_{S*}).

**Comparison: one variable** (node `commutative-cyclic-comparison`). For G = Γ:
- K₁(Q(Γ)) = Q(Γ)^×;
- the characteristic element is char(M) up to Λ(Γ)^×.

Requested: GeneralAlgebraicKTheory K.5 (Quillen's localisation for Ore localisations), K.3 (resolution theorem) and
PadicMeasuresIwasawaAlgebras L4 (characteristic power series).

### NE.3, Milestone 6: evaluation at representations (partial)

Library module: `TauCeti/NumberTheory/NoncommIwasawa/Evaluation`. The source is CFKSV §3, pp. 170–187.

**Construction: twists** (node `twisted-module`). tw_ρ(M) = M_𝒪 ⊗ 𝒪ⁿ with the diagonal action. tw_ρ is exact,
preserves freeness, and maps 𝔐_H(G) to itself (Lemma 3.2).
- *API:* `twist`, `twist_exact`, `twist_free`, `twist_mem_MHG`.
- *Tests:*
  - ρ = 1;
  - a character twist of Λ_𝒪(G);
  - direct sums.

**Construction: Φ_ρ** (node `twist-homomorphism`; planet). Φ_ρ : Λ(G) → M_n(Λ_𝒪(Γ)) is induced by σ ↦ ρ(σ) ⊗ σ̄, and
its augmentation is ρ.
- *API:* `representationRingHom`, `twistRingHom`, `twistRingHom_augmentation`, `twistRingHom_p`.
- *Tests:*
  - for G = Γ, ρ = 1, Φ_ρ is the identity;
  - det Φ_ρ(σ) = det ρ(σ)σ̄ⁿ;
  - direct sums are block diagonal.

**Lemma: extension to S*** (node `twist-extends-to-localisation`). This is Lemma 3.3: Φ_ρ(s) is invertible in
M_n(Q_𝒪(Γ)) for s ∈ S*. The proof reduces mod the maximal ideal and uses the central ℤ_p of G/J from NE.1.

**Construction: evaluation** (node `artin-evaluation`; planet). Φ′_ρ : K₁(Λ(G)_{S*}) → Q_𝒪(Γ)^× is defined by Morita
and the determinant, and ξ(ρ) = φ(Φ′_ρ(ξ)) ∈ L ∪ {∞}. Conventions: [g](ρ) = det ρ(g), and evaluation is multiplicative
in ρ ⊕ ρ′.
- *API:* `twistK1`, `evaluate`, `evaluate_groupElement`, `evaluate_mul`, `evaluate_directSum`, `evaluate_units`.
- *Tests:*
  - a known unit, [g](ρ) = det ρ(g) (Lean check for n = 2);
  - the cyclic case (T ↦ 0, 1/T ↦ ∞);
  - induced representations, whose determinant includes the permutation sign;
  - evaluations do not detect K₁ (the SK₁ question, still open here).

**Construction: Akashi series** (node `akashi-series`). Ak(M) = ∏f_{i,M}^{(−1)^i} on K₀(𝔐_H(G)) (Lemma 3.1, (37)–(40)),
with N(Ak_𝒪) = Ak.
- *API:* `akashiSeries`, `akashiSeriesO`, `akashiSeries_norm`, `homology_torsion`.
- *Tests:*
  - the cyclic case;
  - H finite of order prime to p;
  - Λ(G)/p.

**Lemma: the diagram** (node `evaluation-akashi-diagram`). This is Lemma 3.7: ∂_Γ ∘ Φ′_ρ = Ak_𝒪 ∘ tw_{ρ̂} ∘ ∂_G, with
the contragredient ρ̂(g) = ρ(g^{−1})^t, via Morita row vectors.

**Theorem: Euler characteristics** (node `euler-characteristic-evaluation`; planet). This is Theorem 3.6: if
χ(G, tw_{ρ̂}(M)) is finite, then ξ_M(ρ) ≠ 0, ∞ and χ = |ξ_M(ρ)|_p^{−[L:ℚ_p]}.

**Theorem: Artin representations** (node `artin-evaluation-integral`). Theorem 3.8 and Lemma 3.9: under (51), ξ_M(ρ) ≠ ∞
for every Artin ρ, and it is nonzero iff the Euler characteristic is finite.

**Theorem: Artin formalism** (node `artin-formalism-euler`). This is Theorem 3.10:
χ(G′, M)^{[L:ℚ_p]} = ∏_ρ χ(G, tw_ρ(M))^{n_ρ}.

**Application: X₁(11) at p = 5** (node `gl2-euler-example`). This is Proposition 3.11: χ(G, tw_{ρ₁}X) = 5³ and
χ(G, tw_{ρ₂}X) = 5, from 5¹⁶/5⁴ and 5⁸/5⁴ by Theorem 3.10. The arithmetic inputs are a gap.

### NE.3–NE.5, Milestone 7: the integrality conjecture and the GL₂ main conjecture (checkpoint 4)

Source: CFKSV §4, from (91) to the end, and §5 in full, pp. 195–206, read on the page images. Every conjecture below is
stated as a proposition; no node assumes one.

**Definition: the integrality conjecture** (node `NE.3/characteristic-element-integrality-conjecture`). Conjecture 4.8 has
four cases relating ξ ∈ α(…) to ξ(ρ) and Φ′_ρ(ξ). Lemma 4.9 gives (a) ⇒ (b) ⇔ (c) ⇒ (d), with the twisting identity (94).

**Construction: the dual Selmer module** (node `NE.4/gl2-dual-selmer-module`). F_∞ = ℚ(E_{p^∞}), G, H and Γ, with 𝒮(E/L)
and X(E/L) over Λ(Gal(L/F)). The hypotheses are p ≥ 5 and good ordinary reduction.

**Definition: Conjectures 5.1–5.2** (node `NE.4/mh-conjecture-and-mazur`): X(E/F_∞) ∈ 𝔐_H(G), and Mazur's torsion
conjecture.

**Theorem: 𝔐_H(G) criteria** (node `NE.4/mh-criteria`): Lemmas 5.3–5.4, Corollary 5.5 (the CM case) and Proposition 5.6,
with the conductor-11 isogeny class at p = 5. Its Coates–Howson, Venjakob and Schneps inputs are a gap.

**Definition: the p-adic L-function** (node `NE.5/gl2-padic-l-function-conjecture`). Conjecture 5.7 gives ℒ_E ∈
K₁(Λ_A(G)_{S(A)*}), with the interpolation (107), the periods Ω_±, the set R, f_ρ, and u and w, over the coefficient
ring A.

**Definition: the main conjecture** (node `NE.5/gl2-main-conjecture`). Conjecture 5.8 says i(ξ_E) ≡ ℒ_E modulo the image of
K₁(Λ_A(G)).

**Theorem: consequences** (node `NE.5/gl2-main-conjecture-consequences`): Corollaries 5.9–5.10, conditional on 5.8.

**Application: X₁(11) at p = 5** (node `NE.5/gl2-main-conjecture-example-x1-11`). The data (108)–(115) are checked
against Proposition 3.11. The valuations −1/2 + 3/2 + 2 = 3 and −3/2 + 5/2 = 1 give 5³ and 5.

### NE.2–NE.6, Milestone 8: Kakde's totally real main conjecture, §§1–4 (checkpoint 5)

Source: Kakde, *The main conjecture of Iwasawa theory for totally real fields*, arXiv:1008.0142v3, pp. 1–30. p is odd
throughout, and μ = 0 is carried as a hypothesis wherever it is used.

**Theorem: ∂ is surjective with p-torsion** (node `NE.2/boundary-surjective-p-torsion`). Kakde's Lemma 5 removes CFKSV's
hypothesis that G has no element of order p.

**Construction: SK₁ and K′₁** (node `NE.3/k1-prime`). Definitions 6–7, with K′₁(Λ_𝒪(G)) ≅ lim K′₁(𝒪[Δ]) (Lemma 19) and
K′₁(Λ(G)) ≅ lim_U K′₁(Λ(G/U)) (Corollary 20).
- *API:* `SK1`, `K1Prime`, the two limit equivalences, functoriality, and evaluation through K′₁.
- *Unit tests:* abelian G; G_ab × Δ; cyclic P; and the non-example that uniqueness fails in K₁.

**Definition: admissible extensions and μ = 0** (node `NE.4/admissible-extension`). Definitions 1 and 8, and Lemma 9:
μ = 0 ⇔ X is finitely generated over Λ(H).
- *Unit tests:* F_cyc; ℚ(μ_p)^+ with Ferrero–Washington.
- *Non-examples:* F(μ_{p^∞}), which is not totally real, and finite extensions.

**Construction: the complex C(F_∞/F)** (node `NE.4/totally-real-iwasawa-complex`; planet). RHom(RΓ_ét(𝒪_{F_∞}[1/Σ],
ℚ_p/ℤ_p), ℚ_p/ℤ_p), with H^{−1} = X and H⁰ = ℤ_p, perfect, with base change (1), and S-torsion under μ = 0.
Perfectness is Fukaya–Kato's (gap).

**Definition: the main conjecture** (node `NE.5/totally-real-main-conjecture`; planet). There is a unique
ζ ∈ K′₁(Λ(G)_S) with ∂ζ = −[C(F_∞/F)] and ζ(ρκ^r) = L_Σ(ρ, 1 − r). Uniqueness is in K′₁ (Remark 12).

**Theorem: the abelian case** (node `NE.6/abelian-case`; planet). Lemma 15 and Theorems 16–18: G_ab × Δ with p ∤ #Δ. It
uses Deligne–Ribet (AutomorphicPadicLFunctions L3), Wiles (IntegralIwasawaTheory I.5) and Brauer induction.

**Lemma: Burns–Kato patching** (node `NE.6/burns-kato-patching`). The argument common to every reduction: describe the image
Φ of θ on K′₁, show Φ_S ∩ ∏K′₁ = Φ, then glue the zeta elements of the subquotients.

**Theorems: the reductions** (nodes `NE.6/reduction-to-dimension-one`, `reduction-to-qp-elementary`, `l-elementary-case`,
`reduction-to-p-elementary`; planets). These are Theorems 21, 27, 33 and 36. They reduce the main conjecture to
G = Δ × G_p with Δ cyclic of order prime to p and G_p one-dimensional pro-p. That remaining case, Kakde §§5–6, is the
next checkpoint.

The results of Oliver's *Whitehead groups of finite groups* that Kakde cites are a gap:
- Dress–Wall induction;
- Proposition 11.6 and Theorems 12.3(4), 12.7;
- Wall's torsion theorem;
- the integral logarithm.

### NE.6, Milestone 9: Kakde's algebraic core, §5 and §6.1 (checkpoint 6)

Source: Kakde, arXiv:1008.0142v3, pp. 30–68. Throughout, G is one-dimensional pro-p with G/H ≅ ℤ_p, Z = Γ^{p^e} is
central and open, Ḡ = G/Z, U_P is the preimage of P ≤ Ḡ, and 𝒪 is unramified over ℤ_p (or a finite sum of such rings,
e.g. ℤ_p[Δ]). Library module: `TauCeti/NumberTheory/NoncommIwasawa/KakdeCongruences`.

**Construction: the twisted group ring** (`TwistedGroupRing`; node `NE.6/twisted-group-ring-presentation`). Λ_𝒪(G) =
Λ_𝒪(Z)[Ḡ]^τ with the symmetric carry cocycle τ(h₁γ^{a₁}, h₂γ^{a₂}) = γ^{[(a₁+a₂)/p^e]p^e}; Λ_𝒪(U_P) = Λ_𝒪(Z)[P]^τ;
T = Λ_𝒪(Z) ∖ pΛ_𝒪(Z) is Ore with Λ_𝒪(G)_T = Λ_𝒪(G)_S (Lemma 37); and R[Ḡ]^τ/[R[Ḡ]^τ, R[Ḡ]^τ] ≅ R[Conj Ḡ]^τ (Lemma 43).
- *API:* the ring structure, the presentation, the cocycle simp lemmas, the Ore instance, the two equivalences.
- *Unit tests:*
  - τ ≡ 1 recovers `MonoidAlgebra`;
  - ℤ_p × C_p gives Λ(ℤ_p)[C_p];
  - the carry for Z = Γ^p gives Λ(Γ) = Λ(Z)[X]/(X^p − γ^p);
  - *non-example:* Z = 1 is not open, and T then gives Λ(G) rather than Λ(G)_{(p)}.

**Construction: θ^G and the congruence groups** (`thetaMap`, `Phi`; node `NE.6/congruence-group-phi`). θ^G_P is the norm
to U_P followed by abelianisation. Φ^G ⊆ ∏_P Λ_𝒪(U_P^ab)^× is cut out by:
- M1: norms equal projections;
- M2: invariance under conjugation;
- M3: ver ≡ restriction mod T_{P,P′};
- M4: α_P(x_P) ≡ ∏ ϕ(α_{P′}(x_{P′})) mod pT_P, with its variant at P = {1}.

Here α_P(x) = x^p/∏_k ω_P^k(x). Lemma 50 computes nr and tr for [P′ : P] = p as the product and sum of the twists ω^k.
- *Unit tests:*
  - Ḡ = 1 gives Φ^G = Λ_𝒪(Z)^×;
  - Ḡ = C₂ gives the graph of the norm;
  - Lemma 50 at p = 2;
  - *non-example:* (1, g) fails M1, since nr(g) = −1.

**Construction: the additive side** (`beta`, `Psi`; node `NE.6/additive-map-beta`). t^G_P counts conjugates landing in
P; η_P keeps the generators of a cyclic P; β^G_P = η_P ∘ t^G_P (cyclic P) or t^G_P; ψ^G_R is cut out by A1–A3; δ is a left
inverse of β.
- *Unit tests:*
  - Ḡ = 1;
  - Ḡ = C_p, where ψ^G_R = pR × {b : b₁ = 0};
  - η_P via Σ_k ζ^k = 0;
  - *non-example:* β is not multiplicative.

**Theorem: the additive theorem** (node `NE.6/additive-theorem`). β^G_R : R[Conj Ḡ]^τ ≅ ψ^G_R (Theorem 58), with the
rational version and integrality criterion of Proposition 64.

**Construction: the logarithm on relative K₁** (`logRel`; node `NE.6/iwasawa-algebra-logarithm`). log_I : K₁(R[Ḡ]^τ, I) →
(I/[R[Ḡ]^τ, I]) ⊗ ℚ_p for I ⊆ J_R. It is integral under Oliver's ξ-hypothesis and bijective if I^p ⊆ pIJ_R
(Lemmas 65–66, Proposition 67). Relative K₁ and E(A, I) come from KTheoryLowDegrees U.5.
- *Unit tests:*
  - the commutative case;
  - nilpotence of J_R/p for ℤ_p × C_p;
  - *non-examples:* torsion is killed; the ℤ₂ case shows the bijectivity hypothesis is needed.

**Construction: the integral logarithm** (`integralLog`; node `NE.6/integral-logarithm`). L = log − (ϕ/p)log, with
1 → μ(𝒪) × G^ab → K′₁(Λ_𝒪(G)) → Λ_𝒪(Z)[Conj Ḡ]^τ → G^ab → 1 exact (Definition 70, from Oliver's Theorem 6.6), and its
extension to K′₁(Λ̂_𝒪(G)_S), independent of the splitting (Lemmas 71–72, Proposition 74).
- *Unit tests:*
  - p^n ∣ v^{p^n} − v^{p^{n−1}} on ℤ/27;
  - Lemma 72 via `ZMod.expand_card`;
  - L(g) = 0;
  - *non-example:* L ≠ log.

**Theorem: the θ–β relation** (node `NE.6/theta-beta-relation`). β^G_P(L(x)) = (1/p)log(α_P(θ^G_P(x))/u^G_P(α(θ^G(x))))
for nontrivial cyclic P, with the noncyclic and trivial variants (Proposition 84). It chains Lemmas 76, 77, 79, 81 and 82;
Lemma 82 uses Schneider–Venjakob's Proposition 2.3 (norm then inclusion is the [H : N]-th power on K₁(𝔽_p⟦H⟧)).

**Lemma: the multiplicative sequence** (node `NE.6/phi-integral-log-sequence`). θ^G lands in Φ^G (Lemma 85), and
1 → μ(𝒪) × G^ab → Φ^G → ψ^G → G^ab → 1 is exact (Lemmas 86–89).

**Theorem: Kakde's congruence description of K′₁** (node `NE.6/main-algebraic-theorems`; planet). K′₁(Λ_𝒪(G)) ≅ Φ^G
(Theorem 52, by the five lemma), and Φ^G_S ∩ ∏Λ_𝒪(U_P^ab)^× = θ^G(K′₁(Λ_𝒪(G))) (Theorem 53).

**Theorem: injectivity into the localisation** (node `NE.6/k1-injects-localisation`). Corollary 90, which is printed
without proof. The plan reconstructs it from Theorem 52, the K′₁ halves of the §4 reductions, and Corollary 20.

**Theorem: the congruence criterion** (node `NE.6/main-conjecture-congruence-criterion`). MC(F_∞/F) holds iff
(ζ_P)_P ∈ Φ^G_S, for the Deligne–Ribet zeta functions ζ_P of K_P/F_P (Proposition 93, with Lemma 92). The printed proof
gives "if"; "only if" is reconstructed. The proof needs:
- Clifford theory and monomiality of p-group representations (requested from Tau Ceti InductionRestriction Layer 5);
- inductivity of Artin L-functions (requested from AnalyticNumberTheory AN.4).

**Lemma: M1 and M2 for (ζ_P)** (node `NE.6/zeta-tuple-m1-m2`). Proposition 95, by interpolation. M3 and M4 (Propositions
96–99 and §6.13) are the next checkpoint.

The text layer drops fraction bars: Theorem 94's M4 reads as a product ≡ 1, but the page image shows the quotient form
of Definition 51.

## Dependencies

- **NE.0 imports:**
  - PadicMeasuresIwasawaAlgebras L1 (requested);
  - Tau Ceti `TauCeti.IsProP`.
- **NE.1 imports:**
  - NE.0;
  - ProfiniteProPGroups Layer 9 (requested);
  - GeneralAlgebraicKTheory K.4 (requested).
- **NE.1 is consumed by:**
  - NE.2 (localisation sequence, characteristic elements, K₁(R, Σ_S) ≅ K₁(R_S));
  - NE.4 (equivariant complexes in Σ_{S*}).

## Acceptance tests

- **The cyclic case.** H = 1, G = Γ:
  - S = Λ(Γ) ∖ pΛ(Γ);
  - S* = Λ(Γ) ∖ {0};
  - 𝔐_H(G) is the category of finitely generated torsion modules;
  - Λ(Γ)_S = Λ(Γ)_{(p)}.
- **The Ore conditions.** Both are proved, together with the nonzero-divisor statement; S is never replaced by the
  set of all nonzero divisors.
- **p ∉ S** (Γ is infinite), so S and S* are distinct.
- **Separated hypotheses.** No element of order p, torsion-free and pro-p are kept apart. NE.1 uses none of them
  beyond the standing ones.
- **The degenerate pair B = A** shows which statements need the group structure.

## Remaining stages

- **NE.0.** Decompose the uniform-group theory (gap):
  - powerful and uniform groups;
  - the PBW theorem;
  - gr Ω ≅ F_p[X];
  - Lazard's characterisations.

  Also give the concrete nonabelian finite-level example.
- **NE.2.** CFKSV §3 onward (Akashi series, localisation sequence) and Burns–Venjakob §2.2.
- **NE.3 (partial).** Still to do: reduced norms and SK₁, and what character evaluations determine (Ritter–Weiss, with the
  2026 uniqueness preprint); evaluation under induction and restriction.
- **NE.4 (partial).** Equivariant Galois complexes (Fukaya–Kato, Burns–Venjakob §3, Kakde, Ritter–Weiss). The inputs to
  CFKSV §5 (Coates–Howson, Venjakob, Schneps) are a gap.
- **NE.5 (partial).** Fukaya–Kato's formulation, and the abelian comparison with IntegralIwasawaTheory I.9. The
  Dokchitser data are a gap.
- **NE.6 (partial).** Still to do:
  - Kakde §§6.2–6.13: the basic congruences (Propositions 96–99) via the Deligne–Ribet q-expansion principle, M3 and M4
    (Lemmas 118–119), Theorem 94 and the main theorem;
  - Ritter–Weiss;
  - the source-by-source coverage table.
- **NE.7.** Burns–Venjakob leading terms.

## Sources

- **Coates, Fukaya, Kato, Sujatha, Venjakob,** Publ. Math. IHÉS 101 (2005), Numdam. Read §§2–3 in full and p. 192.
- **Lazard,** Publ. Math. IHÉS 26 (1965), Numdam. Read II.2.2 and V.2.2.
- **Ardakov–Brown,** arXiv math/0511345v1. Read §§2–4.
- **Burns–Venjakob,** arXiv math/0511672v2. Read §2.
- **Kakde,** arXiv:1008.0142v3. Read §§1–5 and §6.1 (pp. 1–68).
- **Schneider–Venjakob,** *A splitting for K₁ of completed group rings*, arXiv:1006.1493v1. Read Proposition 2.3 (p. 11).
