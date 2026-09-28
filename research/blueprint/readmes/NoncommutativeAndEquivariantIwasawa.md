# Noncommutative and equivariant Iwasawa theory — blueprint

This blueprint covers stages NE.0–NE.7. After the first checkpoint:
- **NE.1 is source-decomposed.**
- **NE.0 is partial.**
- **NE.2–NE.7 are not yet read.**

The accepted restructuring RS-16 moves the construction of completed group algebras, with restriction, induction and
augmentation, to PadicMeasuresIwasawaAlgebras L1. NE.0 therefore keeps only:
- the noetherian and module-finiteness facts about Iwasawa algebras of compact p-adic analytic groups;
- the group theory those facts need.

The sources are:
- **CFKSV:** Coates–Fukaya–Kato–Sujatha–Venjakob, *The GL₂ main conjecture for elliptic curves without complex
  multiplication*, Publ. Math. IHÉS 101 (2005), §§2–3. It is open access on Numdam; arXiv math/0404297 was compared.
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
- **NE.3.** Evaluation at Artin representations; reduced norms and SK₁ (Ritter–Weiss).
- **NE.4.** Equivariant Galois complexes.
- **NE.5.** The formulation of zeta elements.
- **NE.6.** Kakde and Ritter–Weiss.
- **NE.7.** Burns–Venjakob leading terms.

## Sources

- **Coates, Fukaya, Kato, Sujatha, Venjakob,** Publ. Math. IHÉS 101 (2005), Numdam. Read §§2–3 and p. 192.
- **Lazard,** Publ. Math. IHÉS 26 (1965), Numdam. Read II.2.2 and V.2.2.
- **Ardakov–Brown,** arXiv math/0511345v1. Read §§2–4.
- **Burns–Venjakob,** arXiv math/0511672v2. Read §2.
