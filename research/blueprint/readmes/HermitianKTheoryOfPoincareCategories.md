# Hermitian K-theory of Poincaré ∞-categories and the flavours of L-theory

This roadmap plans the algebraic surgery that compares the flavours of L-theory and Grothendieck–Witt theory of a ring, following §1 and the Recollection of Calmès, Dotto, Harpaz, Hebestreit, Land, Moi, Nardin, Nikolaus and Steimle, *Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings* (arXiv:2009.07225v4, to appear in Annals of Mathematics). It starts from the Poincaré ∞-categories, the invertible modules with involution, the family of Poincaré structures Q^{≥m}\_M on perfect complexes and the Grothendieck–Witt and L-spectra that GeometryOfNumbersAndQuadraticArithmetic plans in its Layer 6 (§6.8a of TauCetiRoadmap pull request #851), and it ends with four theorems of the paper:

1. **Theorem 1** (HK.8). For every ring R and every duality Hom\_R(−,M) on finitely generated projectives there is a fibre sequence K(R;M)\_{hC₂} → GW^s\_cl(R;M) → L^short(R;M), whose third term is a connective spectrum with Ranicki's original symmetric L-groups as homotopy groups. No hypothesis on 2.

2. **Theorem 5** (HK.4). Ranicki's symmetric L-groups of short Poincaré complexes are the genuine symmetric L-groups L^gs\_n(R;M), in every degree.

3. **Theorem 6 and its general form** (HK.7). For a coherent ring of global dimension d and an r-symmetric Poincaré structure Q, L\_n(R;Q) → L^s\_n(R;M) is injective for n ≥ d − 2r + 2 and bijective for n ≥ d − 2r + 3; in particular L^gs → L^s and GW^gs → GW^s are bijective from degree d − 1, and L^gq → L^s from degree d + 3.

4. **Theorem 3** (HK.8). For such R, GW^q\_{cl,n}(R;M) → GW^s\_{cl,n}(R;M) is injective for n ≥ d + 2 and bijective for n ≥ d + 3, two degrees better for 2-torsion-free R with M = R.

On the way it plans the general form of Karoubi periodicity without inverting 2 (HK.1), the r-symmetric and m-quadratic structures with their bounds (HK.2), bounded-width L-groups and Lagrangian surgery (HK.3), quadratic and symmetric surgery (HK.4, HK.6), surgery over connective ring spectra with the comparison of a ring spectrum with its π₀ (HK.5), and the L-groups of a field in every flavour (HK.7).

## Scope and boundaries

The paper's Recollection quotes the foundations from Papers I and II of the series. In the atlas these foundations now belong to GeometryOfNumbersAndQuadraticArithmetic, whose Layer 6 grew, during its package and fix rounds, from Schlichting's hermitian K-theory of exact categories into the Poincaré-categorical theory (the handoff of FIX-PKG-GeometryOfNumbersAndQuadraticArithmetic~adv records the move). This roadmap cites that layer and never re-plans it:

- **Imported from GN §6.8a:** `PoincareInfinityCategory`, `PoincareObject` with Lagrangians and isotropic surgery (CDH III Proposition 1.1.13), `PoincareSurgeryDatum`, `DerivedCoefficientLine` (Definition R.1), `PerfectDerivedInfinity`, `perfectDerivedHom`, `symmetricPoincareStructure`, `quadraticPoincareStructure`, `genuinePoincareStructure` (Definition R.3, Remark R.5), `stableGrothendieckWittSpectrum`, `stableLTheorySpectrum`, `PoincareVerdierSequence`, `additiveHermitianBordification`, `stableGWFundamentalSquare` (the fibre sequence K\_{hC₂} → GW → L), `poincareLinearPart`, `weightHeartGWComparison` (Hebestreit–Steimle; Corollary 1.3.15), `symmetricHeartLTheory` (Corollary 1.3.8); §6.1a C₂-spectra and Tate constructions; §6.4 Witt groups of exact categories; §6.10a the ℤ-instances of the comparison ranges and of Theorem 5; §6.10b the two-inverted genuine comparison.
- **Not planned here (other roadmaps):** the localisation–dévissage sequence of §2 (GN §6.9 and GeometryOfNumbersAndQuadraticArithmeticPartII), the homotopy limit problem and the Grothendieck–Witt groups of ℤ of §3 (GN §§6.10–6.11 and its roadmap-for-a-roadmap), the dyadic L-group tables of Dedekind rings (GeometryOfNumbersAndQuadraticArithmeticPartII), K-theory of stable ∞-categories and bounded t-structures (GeneralAlgebraicKTheoryPartII KII.0 and KII.3), stable ∞-categories, spectra and module categories (EnhancedDerivedSheaves E0, E5), homotopy orbits, fixed points and Tate constructions (RefinedTraceMethods RT.2), group completion (StableHomotopyKTheory H.4), the Witt ring of a field (QuadraticFormInvariants Layer 4), real K-theory (ChromaticHomotopyTheory CH.11).
- **Planned here:** everything in CDH III §1 stated for a general ring, a general M and a general Poincaré structure, with the endpoint Theorems 1 and 3, the quadratic fibre sequence and Karoubi's splitting after inverting 2.
- **Consumers:** GeometryOfNumbersAndQuadraticArithmeticPartII (gap G1 asks for field surgery and Witt identifications, sign shifts, genuine-versus-periodic comparisons and K₀-controlled subcategories) and KTheoryFiniteLocalFields (finite-field foundation gap). The restructure proposals of the packet name the nodes they should import.

## Reading the plan

Each layer states its targets and then its nodes, numbered §k.i. Definitions and constructions carry an API outline and unit tests that a plausible wrong definition fails; theorems carry hypotheses, a proof route, acceptance checks and prerequisites. Every node cites where its sources state or prove it, in our own words, with theorem and page numbers. The plan is at target level (PROTOCOL.md §2): smaller steps stay in the proof routes. Node identifiers are relative to this roadmap; prerequisites in other roadmaps keep their full identifiers. Every node is a plan, not a formalization.

## Conventions

- R is an associative unital ring, not necessarily commutative; modules are left modules. D^p(R) is the perfect derived ∞-category (GN `PerfectDerivedInfinity`). Connectivity is homological: a spectrum or module E is m-connective if π\_kE = 0 for k < m and m-truncated if π\_kE = 0 for k > m.
- M is an invertible ℤ-module with involution over R (GN `DerivedCoefficientLine`), finitely generated projective for either action; D = Hom\_R(−,M). R(ε) is the module of an ε-involution, −M negates the involution (−R = R(−1)), M^∨ = Hom\_R(M,R) lives over R^op.
- Q^{≥m}\_M (m ∈ ℤ ∪ {±∞}) is the genuine family of GN §6.8a, with Q^q\_M = Q^{≥+∞}\_M and Q^s\_M = Q^{≥−∞}\_M. Increasing m moves towards the quadratic end: Q^gq\_M = Q^{≥2}\_M, Q^ge\_M = Q^{≥1}\_M, Q^gs\_M = Q^{≥0}\_M, and Q^q\_M → ⋯ → Q^{≥m+1}\_M → Q^{≥m}\_M → ⋯ → Q^s\_M. (The extraction's conventions list states the limits the other way round; item 105 and Definition R.3 fix the direction used here.)
- F^α(R;M) := F(D^p(R),Q^α\_M) for F = GW, L, K^{tC₂}; F^α(R) := F^α(R;R) and F^{−α}(R) := F^α(R;R(−1)); F^α\_n := π\_nF^α. Q[k] := Σ^kQ, so Pn(C,Q[−n]) are the n-dimensional Poincaré objects and L\_n(C,Q) = L₀(C,Q[−n]) = π\_nL(C,Q).
- Ĥ^k(C₂;M) := π\_{−k}HM^{tC₂}, the Tate cohomology of the underlying abelian group with C₂-action; for an involution σ, Ĥ^0 = ker(1−σ)/im(1+σ) and Ĥ^{−1} = ker(1+σ)/im(1−σ).
- Coherent means left-coherent and global dimension means left global dimension; right-handed versions follow by passing to R^op (HK.7, §7.4).
- GW^s\_cl, GW^q\_cl, GW^ev\_cl are the classical group completions of unimodular symmetric, quadratic and even forms; by Hebestreit–Steimle (GN §6.8a) they are the connective covers of GW^gs, GW^gq, GW^ge. L^short := τ\_{≥0}L^gs.

## Layer overview

| Layer | Title | Main sources |
| --- | --- | --- |
| HK.0 | Coefficients, the flavour family and shift periodicity | CDH III R.2, R.4, R.6, R.7, R.9, R.11, R.12; CDH I 3.5.3, 4.2.24 |
| HK.1 | Metabolic categories, the Bott–Genauer sequence and Karoubi periodicity | CDH III pp. 9–11 (R.8–R.10); CDH I 2.3.5, 2.3.7; CDH II 1.2.5, 3.5.8, 4.3.1–4.3.4 |
| HK.2 | r-symmetric and m-quadratic Poincaré structures | CDH III 1.1.1–1.1.8, 1.2.10 |
| HK.3 | Cobordism groups, Lagrangian surgery and bounded L-groups | CDH III 1.1.9–1.1.15, 1.2.1–1.2.5, 1.2.14; CDH I 2.3.10–2.3.11, 2.4.6 |
| HK.4 | Surgery for m-quadratic structures and Ranicki's symmetric L-groups | CDH III 1.2.6–1.2.25; Ranicki 1980 §§1, 3 |
| HK.5 | Surgery over connective ring spectra | CDH III 1.2.26–1.2.35; CDH I 1.2.15, 3.1.1, 3.2.12; Lurie HA 7.2.2.19 |
| HK.6 | Coherent rings, t-structures and surgery for r-symmetric structures | CDH III §1.3 pp. 27–30 (1.3.1–1.3.7) |
| HK.7 | Comparison ranges for the flavours of L-theory and Grothendieck–Witt theory | CDH III 1.3.9–1.3.18; CDH I 4.2.26; Ranicki 1980 Prop. 4.5 |
| HK.8 | Fibre sequences and comparisons for classical Grothendieck–Witt theory | CDH III Theorems 1 and 3 and p. 4; CDH II 4.4.13–4.4.14 |

## How the main proofs are assembled

- **Theorem 5** (§4.11). For n ≥ 0: Ranicki's group L^short\_n is the bounded group L^{n,n+1}\_n of the symmetric structure (§4.8); in this width symmetric and genuine symmetric forms agree because Q^gs is 2-symmetric (§4.9, using §2.2); genuine symmetric surgery (§4.3, from §4.1 with m = 0) identifies the bounded group with L^gs\_n. For n ≤ −3 quadratic comparison (§4.4) applies; for n = −2, −1 periodicity (§1.6) reduces to the even comparison (§4.10).
- **Theorem 6** (§7.2). Symmetric surgery (§6.4) over a coherent ring (§§6.1–6.3, §6.5) identifies L\_n with bounded groups for n ≥ d − 2r; the bounded-width agreement (§4.9) gives bijectivity for n ≥ d − 2r + 3 and a lifting argument gives injectivity one degree lower (§7.1). Q^gs is 2-symmetric and Q^gq is 0-symmetric (§2.2); the GW statements follow from the fundamental fibre sequence of GN §6.8a.
- **Theorem 1** (§8.1). The fundamental fibre sequence for Q^gs (GN), connective covers, Hebestreit–Steimle (GN) and Theorem 5.
- **Theorem 3** (§8.4). Hebestreit–Steimle identifies classical with connective genuine GW; Theorem 6 compares GW^gq and GW^gs with GW^s; §7.6 gives the 2-torsion-free improvement through the double-shift periodicity.
- **Karoubi periodicity** (§1.4). The Bott–Genauer sequence (§1.2) with GW(Met) ≃ K (§1.3) gives V(C,Q) ≃ ΩU(C,Q[2]); the shift periodicity (§0.4) replaces Q[2] by Q^{≥m+1}\_{−M}.

### Identities checked while planning

- Quadratic surgery numerics: for n + a even, a ≥ 0, a ≥ n − 2m and 2k < −n − a, one has n < −2k and n < m − k (the estimate of Lemma 1.2.10 is then above n); checked by `omega` in Suggested.lean.
- Symmetric surgery numerics: for n + a even, a ≥ d − 1 and a ≥ −n + 2d − 2r, k = (−n−a−2)/2 gives n + 2k + d < 0 and k + d − r < 0; checked by `omega`.
- Ranges: r = 2 (Q^gs) gives d − 2, d − 1; r = 0 (Q^gq) gives d + 2, d + 3; m = 0 gives the quadratic comparison up to degree −3; Dedekind d = 1 gives −1, 0 and 3, 4 (Corollary 1.3.14). Ring spectra: p = −1, m = 0 gives −3, −2; p = 0 gives −1, 0; p = 1 gives 0, 1 (Corollary 1.2.33, Example 1.2.35).
- Tate cohomology: Ĥ^{−1}(C₂;ℤ) = 0 and Ĥ^0(C₂;ℤ) = ℤ/2 for the trivial action, the reverse for −ℤ; hence Q^gq\_ℤ = Q^ge\_ℤ and Q^ge\_{−ℤ} = Q^gs\_{−ℤ}, and Q^gs\_ℤ is in fact 3-symmetric.
- Over ℤ the plan's ranges agree with GN §6.10a: L^gs\_n(ℤ) = L^s\_n(ℤ) = ℤ, ℤ/2, 0, 0 for n ≥ 0; L^gs\_{−2}(ℤ) = 0 while L^q\_{−2}(ℤ) = ℤ/2; L^gq\_0(ℤ) → L^gs\_0(ℤ) is multiplication by 8; GW^q\_{cl,n}(ℤ) → GW^s\_{cl,n}(ℤ) is injective at n = 1 and bijective from n = 2.
- Over 𝔽₂: L^s\_{2k}(𝔽₂) = ℤ/2, L^q\_{2k}(𝔽₂) = ℤ/2 (Arf), odd groups 0, and L^gs\_{−2}(𝔽₂) = L^ge\_0(𝔽₂) = 0 since even forms in characteristic 2 are alternating.

## Sources and editions

- **Calmès et al. III**: Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus, Wolfgang Steimle, *Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings*. arXiv:2009.07225v4 (28 April 2026, 63 pp.; to appear in Annals of Mathematics); statement numbers and printed page numbers (printed = PDF page). https://arxiv.org/abs/2009.07225v4. Read: Introduction, pp. 1–5 (Theorems 1–7, Corollary 8, the quadratic fibre sequence); Recollection, pp. 6–11 (Definition R.1 to Notation R.12); §1.1, pp. 12–15 (Remark 1.1.1 to Construction 1.1.15); §1.2, pp. 15–27 (Definition 1.2.1 to Example 1.2.35); §1.3, pp. 27–33 (the setting on p. 27, Proposition 1.3.1 to Example 1.3.18); §2 opening and §2.1, pp. 33–34 (for the boundary with GN §6.9).
- **Calmès et al. I**: The same nine authors, *Hermitian K-theory for stable ∞-categories I: Foundations*. arXiv:2009.07223v3 (27 December 2021); printed page = PDF page. https://arxiv.org/abs/2009.07223v3. Read: Example 1.2.15 (p. 21); Corollary 1.3.6 (p. 23); §2.3, pp. 36–38 (Definition 2.3.5, Lemma 2.3.7, Construction 2.3.8, Lemma 2.3.10, Definition 2.3.11); Corollary 2.4.6 (p. 43); Definition 3.1.1 (p. 47); Lemma 3.2.5, Construction 3.2.6, Examples 3.2.8 and 3.2.12 (pp. 52–53); §3.5 opening, Lemma 3.5.1, Proposition 3.5.3 (p. 59); Definitions 4.2.2, 4.2.4 (p. 68); Proposition 4.2.22 to Definition 4.2.26 and p. 74 (pp. 73–74).
- **Calmès et al. II**: The same nine authors, *Hermitian K-theory for stable ∞-categories II: Cobordism categories and additivity*. arXiv:2009.07224v5 (11 April 2025); printed page = PDF page. https://arxiv.org/abs/2009.07224v5. Read: Example 1.2.5 (p. 20); Remark 3.5.5 to Proposition 3.5.8 (p. 87); Definition 4.2.6 to Corollary 4.3.4 (pp. 100–101); Theorem 4.4.11, Corollaries 4.4.13 and 4.4.14 (pp. 106–107).
- **Ranicki 1980**: Andrew Ranicki, *The algebraic theory of surgery I. Foundations*. Proceedings of the London Mathematical Society (3) 40 (1980), 87–192; author's archive copy. https://webhomes.maths.ed.ac.uk/~v1ranick/papers/ats1.pdf. Read: §1 (symmetric Poincaré complexes and their cobordism); §3 (Wu classes and even complexes); §4 statement of Proposition 4.5 (finite global dimension comparison).
- **Lurie, Higher Algebra**: Jacob Lurie, *Higher Algebra*. Author version dated 18 September 2017; page numbers of that PDF. https://www.math.ias.edu/~lurie/papers/HA.pdf. Read: §7.2.2, Proposition 7.2.2.18 and Corollary 7.2.2.19 with proof (pp. 1245–1246).

The paper extraction PAPER-CALMES-ETAL-26 (accepted) routed 104 items here; the packet's `routedItems` maps each to its nodes or to the GN import that supplies it. The red team RT-PAPER-CALMES-ETAL-26, whose review is pending, was read as a source of leads: its corrections that concern these items were checked against the paper and are used where they hold (E4–E7 below, and the corrected dependency of Corollary 1.3.10).

### Corrections used here

| Id | Locator | Correction |
| --- | --- | --- |
| E1 | Proof of Corollary 1.2.12, p. 18 (arXiv v4) | n ≤ 2m − 3, the hypothesis assumed at the start of the injectivity paragraph. |
| E2 | Proposition 1.3.1 (i) and (ii), p. 27 (arXiv v4) | Read C in place of D^p(R) in both parts, as the proof does. |
| E3 | Remark 1.2.28, p. 23 (arXiv v4) | Lemma 1.1.6. |
| E4 | Example 1.3.11, p. 31 (arXiv v4) | The needed and true statement is L^gs\_{−2}(𝔽₂) = 0, against L^s\_{−2}(𝔽₂) ≅ L^s\_2(𝔽₂) ≅ ℤ/2. |
| E5 | Proof of Corollary 1.3.10, p. 31, and the sentence before Corollary 1.3.14, p. 31 (arXiv v4) | The squares are cartesian by the fundamental fibre sequence (1) of Paper II (Corollary [II].4.4.13) applied to the identity Poincaré functors between these structures, which share the duality and hence the term K(R;M)\_{hC₂}. |
| E6 | Remark R.7, p. 9 (arXiv v4) | The 2-torsion R[2] must carry the Frobenius-twisted module structure r·a = r²a (the structure on π₀ of HR(−1)^{tC₂} from the Tate diagonal). |
| E7 | Remark 1.3.17, p. 32 (arXiv v4) | Over a (left-)coherent ring of global dimension ≤ 1, e.g. a Dedekind ring. |

## Layer HK.0: Coefficients, the flavour family and shift periodicity

The operations on invertible ℤ-modules with involution that every later layer uses (line bundles, ε-involutions R(ε), the sign twist −M and the dual M^∨ over the opposite ring), the flavour notation F^α(R;M) for the values of GW, L and K^{tC₂} on the family Q^{≥m}\_M, the Tate-cohomology criterion for two consecutive members of the family to coincide, the shift periodicity Ω : (D^p(R),(Q^{≥m}\_M)[2]) ≃ (D^p(R),Q^{≥m+1}\_{−M}), the passage to the opposite ring, and the identification of the shifted genuine Grothendieck–Witt spectra with classical symmetric, symplectic and quadratic forms. The Poincaré ∞-categories, the perfect derived ∞-category D^p(R), invertible modules with involution and the structures Q^{≥m}\_M themselves are GeometryOfNumbersAndQuadraticArithmetic GN.6 (§6.8a of TauCetiRoadmap PR #851) and are imported, not planned.

Targets: §0.1 Operations on invertible modules with involution; §0.2 Flavoured Grothendieck–Witt and L-spectra of a ring; §0.3 When consecutive genuine structures agree; §0.4 Shift periodicity of the genuine structures; §0.5 Transport of a Poincaré structure to the opposite ring; §0.6 Shifted genuine Grothendieck–Witt spectra and symplectic forms.

Planets: Shift periodicity.

### 0.1 Operations on invertible modules with involution

`HK.0/module-with-involution-operations` · construction

Let R be an associative unital ring and M an invertible ℤ-module with involution over R (an R⊗R-module with an involution m ↦ m̄ exchanging the two actions, finitely generated projective for either action, with R → Hom\_R(M,M) an isomorphism; GN §6.8a `DerivedCoefficientLine`, Calmès et al. III Definition R.1). (i) For R commutative, every finitely generated projective rank-one R-module L with the identity involution and r⊗s acting by rs is such an M. (ii) For a unit ε ∈ R and an ε-involution on R (a ring isomorphism r ↦ r̄ from R to R^op with r̄̄ = εrε⁻¹ and ε̄ = ε⁻¹), M = R with r⊗s·x = r x s̄ and involution x ↦ ε x̄ is invertible; it is denoted R(ε). (iii) The sign twist −M has the same R⊗R-module and the involution m ↦ −m̄; −R = R(−1) and −(−M) = M. (iv) The dual M^∨ = Hom\_R(M,R) is an invertible ℤ-module with involution over R^op.

**Hypotheses.**

- R associative and unital, not necessarily commutative.
- In (ii) the involution is an anti-automorphism up to conjugation by ε, not necessarily involutive.

**Construction.**

- (i) A rank-one projective L is invertible as an R-module (Mathlib `Module.Invertible`), so R → End\_R(L) is bijective; the identity involution exchanges the two equal actions.
- (ii) Check the R⊗R-linearity of x ↦ εx̄ against the twisted action r⊗s·x = r x s̄ and that applying it twice is the identity by r̄̄ = εrε⁻¹ and ε̄ = ε⁻¹; R is free of rank one for either action and the unit map is the identity.
- (iii) Negating an involution keeps it R⊗R-linear and involutive, and does not change the underlying module, so invertibility is unaffected.
- (iv) Hom\_R(M,R) is finitely generated projective over R^op because M is finitely generated projective; the involution is transported by precomposition.

**API.**

- `CoefficientLine.ofLineBundle` (constructor): A rank-one projective module over a commutative ring with the identity involution.
- `CoefficientLine.ofEpsInvolution` (constructor): R(ε) from a unit ε and an ε-involution.
- `CoefficientLine.neg` (constructor): The sign twist −M: same module, negated involution.
- `CoefficientLine.neg_neg` (simp): −(−M) = M.
- `CoefficientLine.dual` (constructor): M^∨ = Hom\_R(M,R) over R^op.
- `CoefficientLine.dual_dual` (equivalence): The canonical isomorphism M^∨∨ ≅ M respects involutions.

**Unit tests.**

- `neg_one_eq_neg` (computation): For any ring with trivial involution, R(−1) is −R(1), and the two have the same underlying R⊗R-module.
- `char_two_neg_eq_self` (degenerate): Over an 𝔽₂-algebra, −M = M, since −m̄ = m̄.
- `zero_not_invertible` (non-example): The zero module with zero involution is not invertible when R ≠ 0, because R → Hom\_R(0,0) = 0 is not injective.
- `z_sign_twist_tate` (computation): For R = ℤ: Ĥ^even(C₂;ℤ) = ℤ/2 and Ĥ^odd(C₂;ℤ) = 0 for the trivial involution, and the parities are exchanged for −ℤ, so the twist changes Tate cohomology.

**Checks.**

- R(1) for the identity involution on a commutative ring is the symmetric coefficient R with trivial involution, and R(−1) = −R.
- M^∨∨ ≅ M canonically, compatibly with the involutions.

**Uses.** Calmès et al. III, Proposition R.6, p. 9: the shift periodicity changes M into −M; Calmès et al. III, Remark R.11, p. 11: the opposite-ring transport uses M^∨; Calmès et al. III, Remark R.9, p. 10 and Remark 1.3.16, p. 32: M = R with trivial involution and −R = R(−1) for 2-torsion-free rings.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `mathlib:Module.Invertible`; `mathlib:Module.Projective`.

*Sources:* Calmès et al. III, Example R.2, p. 7: Lists line bundles with trivial involution, the module R(ε) built from an ε-involution, the sign twist −M with −R = R(−1), and the dual M^∨ as an invertible module with involution over the opposite ring.; Calmès et al. I, Definitions 4.2.2 and 4.2.4, p. 68: Defines ℤ-modules with involution over a ring and their invertibility through the associated Eilenberg–Mac Lane module.

### 0.2 Flavoured Grothendieck–Witt and L-spectra of a ring

`HK.0/flavour-notation` · definition

For a functor F from Poincaré ∞-categories to spectra (GW, L, or the Tate construction K(−)^{tC₂} on K-theory with the duality action), an invertible ℤ-module with involution M over R and a flavour α ∈ {q, gq, ge, gs, s} ∪ {≥m : m ∈ ℤ}, put F^α(R;M) := F(D^p(R), Q^α\_M), where Q^q\_M = Q^{≥∞}\_M, Q^gq\_M = Q^{≥2}\_M, Q^ge\_M = Q^{≥1}\_M, Q^gs\_M = Q^{≥0}\_M and Q^s\_M = Q^{≥−∞}\_M (GN §6.8a `genuinePoincareStructure`). For M = R(ε) write F^α(R;ε); for ε = ±1 write F^α(R) := F^α(R;R) and F^{−α}(R) := F^α(R;R(−1)). Homotopy groups are F^α\_n(R;M) := π\_n F^α(R;M). The connective-cover maps τ\_{≥m+1} → τ\_{≥m} induce a sequence F^q → ⋯ → F^{≥m+1} → F^{≥m} → ⋯ → F^s, natural in R and M.

**Hypotheses.**

- F is a functor on Poincaré ∞-categories; the comparison maps exist because Q^{≥m+1}\_M → Q^{≥m}\_M are Poincaré functors with identity underlying functor.

**Construction.**

- The structures Q^{≥m}\_M and the maps between them are GN §6.8a; applying F to the identity Poincaré functors gives the comparison maps.
- The superscript −α refers to the coefficient R(−1), not to a negated degree.

**API.**

- `flavour` (data): The index set {q, gq, ge, gs, s} ∪ {≥m}.
- `flavourInvariant F α R M` (constructor): F(D^p(R), Q^α\_M).
- `flavourComparison` (functoriality): The map F^{≥m+1}(R;M) → F^{≥m}(R;M) induced by τ\_{≥m+1} → τ\_{≥m}.
- `flavourComparison_comp` (compatibility): Composites of comparison maps are comparison maps; F^q → F^s factors through every F^{≥m}.
- `flavourInvariant_neg` (simp): F^{−α}(R) = F^α(R; R(−1)).

**Unit tests.**

- `gs_to_s_signature` (computation): On π₀ of L over ℤ the map L^gs → L^s is the identity of ℤ under signature.
- `gq_to_gs_eight` (computation): On π₀ of L over ℤ the map L^gq → L^gs is multiplication by 8, so the flavours are not all equivalent.
- `two_invertible_collapse` (degenerate): If 2 ∈ R^× all comparison maps F^{≥m+1}(R;M) → F^{≥m}(R;M) are equivalences.
- `neg_flavour_not_shift` (non-example): F^{−gs}(ℤ) uses the coefficient ℤ(−1): GW^{−gs}\_0(ℤ) = ℤ (symplectic forms, generated by the hyperbolic alternating plane) while GW^{gs}\_0(ℤ) = ℤ⊕ℤ, so F^{−α} is a different invariant, not a regrading of F^α.

**Checks.**

- L^gs\_0(ℤ) → L^s\_0(ℤ) is the identity on signature, while L^gq\_0(ℤ) → L^gs\_0(ℤ) is multiplication by 8 (GN §6.10a).

**Uses.** Calmès et al. III, §§1.2–1.3: every comparison theorem is stated for the maps between flavours; Calmès et al. III, Theorem 1.2.22, p. 21: L^gs(R;M) is compared with Ranicki's groups; GeometryOfNumbersAndQuadraticArithmeticPartII DA.0–DA.4: the dyadic tables are stated in this notation.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `HK.0/module-with-involution-operations`.

*Sources:* Calmès et al. III, Notation R.12, p. 11, and Definition R.3, p. 8: Fixes the notation F^α(R;M) for the values of an invariant on D^p(R) with the structures of Definition R.3, the ε- and sign conventions, and the indexing of homotopy groups.; Calmès et al. I, Notation 4.2.23, p. 73: Names Q^{≥2}, Q^{≥1}, Q^{≥0} the genuine quadratic, even and symmetric structures.

### 0.3 When consecutive genuine structures agree

`HK.0/tate-collapse-criterion` · theorem

Write Ĥ^k(C₂;M) := π\_{−k}(HM^{tC₂}) for the Tate cohomology of the underlying ℤ[C₂]-module of M. If Ĥ^{−m}(C₂;M) = 0 for some m ∈ ℤ, then τ\_{≥m+1}HM^{tC₂} → τ\_{≥m}HM^{tC₂} is an equivalence, hence so are Q^{≥m+1}\_M → Q^{≥m}\_M and the induced maps GW(R;Q^{≥m+1}\_M) → GW(R;Q^{≥m}\_M) and L(R;Q^{≥m+1}\_M) → L(R;Q^{≥m}\_M). As Ĥ^\*(C₂;M) is 2-periodic, the same then holds for every m + 2k. If 2 ∈ R^× all members of the family coincide. If R is commutative and 2-torsion free and M = R with trivial involution, then Ĥ^0(C₂;−R) = 0 and Ĥ^{−1}(C₂;R) = 0, so Q^ge\_{−R} = Q^gs\_{−R} and Q^gq\_R = Q^ge\_R.

**Hypotheses.**

- M invertible ℤ-module with involution over R.
- Tate cohomology of the underlying abelian group with C₂-action, π\_{−k} convention.

**Proof route.**

- The fibre of τ\_{≥m+1}E → τ\_{≥m}E is Σ^m Hπ\_m E; with E = HM^{tC₂}, π\_m E = Ĥ^{−m}(C₂;M) (RefinedTraceMethods RT.2/tate-of-eilenberg-maclane).
- Q^{≥m}\_M is the pullback of Q^s\_M along Map\_R(−,τ\_{≥m}HM^{tC₂}) → Map\_R(−,HM^{tC₂}) (GN §6.8a), so an equivalence of covers gives an equivalence of Poincaré structures with the same duality, hence of GW and L.
- Ĥ^\*(C₂;−) is 2-periodic (Tau Ceti `Rep.FiniteCyclicGroup.tateCohomologyIsoEven`/`IsoOdd`).
- If 2 is a unit it acts invertibly and by zero on Tate cohomology, which therefore vanishes.
- For an abelian group A with involution σ, Ĥ^0(C₂;A) = ker(1−σ)/im(1+σ) and Ĥ^{−1}(C₂;A) = ker(1+σ)/im(1−σ). For commutative R with trivial involution this gives Ĥ^{−1}(C₂;R) = R[2] (the 2-torsion) and, for −R (σ = −1), Ĥ^0(C₂;−R) = R[2]. Both vanish when R is 2-torsion free, which gives Q^gq\_R = Q^ge\_R (m = 1) and Q^ge\_{−R} = Q^gs\_{−R} (m = 0).

**Checks.**

- For R = ℤ: Ĥ^{−1}(C₂;ℤ) = 0, so Q^gq\_ℤ = Q^ge\_ℤ; Ĥ^1(C₂;ℤ) = 0, so also Q^{≥0}\_ℤ = Q^{≥−1}\_ℤ; but Ĥ^0(C₂;ℤ) = ℤ/2 ≠ 0, and Q^ge\_ℤ → Q^gs\_ℤ is not an equivalence (the form ⟨1⟩ is symmetric and not even).
- Over ℤ[1/2] all flavours of L coincide.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `RefinedTraceMethods:RT.2/tate-of-eilenberg-maclane`; `tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoEven`; `tauceti:Rep.FiniteCyclicGroup.tateCohomologyIsoOdd`; `HK.0/flavour-notation`.

*Sources:* Calmès et al. III, Remark R.4, p. 8, and Remark R.9, p. 10: States that vanishing of Ĥ^{−m}(C₂;M) makes Q^{≥m+1}\_M → Q^{≥m}\_M and the induced GW and L maps equivalences, that this propagates by 2-periodicity, that everything collapses when 2 is a unit, and that for 2-torsion-free commutative rings with M = R the genuine even structure agrees with the genuine symmetric one for −R and with the genuine quadratic one for R.

### 0.4 Shift periodicity of the genuine structures

`HK.0/shift-periodicity` · theorem · planet: Shift periodicity

For every invertible ℤ-module with involution M over R and every m ∈ ℤ ∪ {±∞}, the loop functor Ω : D^p(R) → D^p(R) refines to an equivalence of Poincaré ∞-categories (D^p(R), (Q^{≥m}\_M)[2]) ≃ (D^p(R), Q^{≥m+1}\_{−M}), where Q[k] := Σ^k Q. In particular (Q^gs\_M)[2] ≃ Q^ge\_{−M} and (Q^ge\_M)[2] ≃ Q^gq\_{−M} after reindexing along Ω, and (Q^s\_M)[2] ≃ Q^s\_{−M}, (Q^q\_M)[2] ≃ Q^q\_{−M}.

**Hypotheses.**

- R discrete (connective suffices); M invertible ℤ-module with involution.
- Q[2] is the two-fold suspension of the quadratic functor, not precomposition with a shift.

**Proof route.**

- By Calmès et al. I, Proposition 3.5.3 (with n = 1), Ω refines to an equivalence between (Mod^ω, (Q^α\_M)[2]) and the Poincaré structure of the module with genuine involution (𝕊^{1−σ} ⊗ M, Σα): the coefficient is twisted by 𝕊^{1−σ} and the genuine part is suspended once.
- Over Hℤ, which is 2σ-oriented, 𝕊^{n−nσ} ⊗ M depends only on the parity of n, and for odd n it is −M (Calmès et al. II, discussion before Corollary 4.3.4); so the coefficient is −M.
- Since Tate constructions are invariant under 𝕊^σ ⊗ − (Calmès et al. I, Lemma 3.5.1), (𝕊^{1−σ} ⊗ M)^{tC₂} ≃ Σ M^{tC₂}, and the suspended genuine part Σ(τ\_{≥m}M^{tC₂}) = τ\_{≥m+1}ΣM^{tC₂} is the genuine part of index m + 1 for R connective; for m = 0, 1 this is Calmès et al. I, Corollary 4.2.24.
- For m = ±∞ this is Lurie's observation, recovered at the endpoints.

**Checks.**

- Applied twice: (D^p(R),(Q^{≥m}\_M)[4]) ≃ (D^p(R),Q^{≥m+2}\_M).
- Over an 𝔽₂-algebra −M = M, so the double shift moves m by one without changing M.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `HK.0/module-with-involution-operations`; `HK.0/flavour-notation`; `RefinedTraceMethods:RT.2/tate-vanishing-induced`.

*Sources:* Calmès et al. III, Proposition R.6, p. 9: States that the loop functor refines to an equivalence between the double shift of Q^{≥m}\_M and Q^{≥m+1}\_{−M}, quoting Papers I and II and attributing the endpoint cases to Lurie.; Calmès et al. I, Lemma 3.5.1 and Proposition 3.5.3, pp. 59–60, and Corollary 4.2.24, p. 73: Identifies reparametrised and shifted Poincaré structures on module categories with twisted modules with genuine involution, and records the loop equivalences for the genuine symmetric and even structures.; Calmès et al. II, Discussion before Corollary 4.3.4, p. 101: Explains that a 2σ-orientation of the base identifies 𝕊^{n−nσ} ⊗ M with M or −M by parity and derives the displayed equivalence for Q^{≥m}.

### 0.5 Transport of a Poincaré structure to the opposite ring

`HK.0/opposite-ring-transport` · construction

The functor X ↦ Hom\_R(X,R) is an equivalence of stable ∞-categories D^p(R)^op ≃ D^p(R^op). For a Poincaré structure Q on D^p(R) with duality D, the composite Q^∨ : D^p(R^op)^op ≃ D^p(R) →^D D^p(R)^op →^Q Sp is a Poincaré structure on D^p(R^op), and the underlying functors give an equivalence of Poincaré ∞-categories (D^p(R),Q) ≃ (D^p(R^op),Q^∨). Hence GW(R^op;Q^∨) ≃ GW(R;Q) and L(R^op;Q^∨) ≃ L(R;Q). If Q is compatible with M, Q^∨ is compatible with M^∨.

**Hypotheses.**

- R any ring; Q any Poincaré structure on D^p(R).

**Construction.**

- Hom\_R(−,R) exchanges finitely generated projective left and right modules and preserves finite complexes, hence perfect objects; its double application is the identity up to the evaluation equivalence.
- Pulling Q back along the duality and then along this equivalence gives a quadratic functor whose cross-effect is represented by the transported duality, so it is Poincaré.
- By construction the composite functor carries Q^∨ to Q, which is an equivalence of Poincaré ∞-categories; apply GW and L.

**API.**

- `Poincare.opposite` (constructor): Q ↦ Q^∨ on D^p(R^op).
- `Poincare.oppositeEquiv` (equivalence): (D^p(R),Q) ≃ (D^p(R^op),Q^∨) as Poincaré ∞-categories.
- `Poincare.opposite_compatible` (compatibility): If Q is M-compatible then Q^∨ is M^∨-compatible.
- `GW_opposite` (simp): GW(R^op;Q^∨) ≃ GW(R;Q), and likewise for L.

**Unit tests.**

- `opposite_commutative_trivial` (degenerate): For commutative R with M = R and trivial involution, R^op = R and Q^∨ = Q for Q = Q^s, Q^q and Q^{≥m}.
- `opposite_symmetric_endpoint` (computation): (Q^s\_M)^∨ = Q^s\_{M^∨} and (Q^q\_M)^∨ = Q^q\_{M^∨}.
- `opposite_not_identity_noncomm` (non-example): For a noncommutative ring without involution, D^p(R) and D^p(R^op) need not be equivalent as stable categories by any equivalence fixing R; the transport uses the duality, not an identification of R with R^op.

**Checks.**

- For a ring with involution and M = R, Q^∨ is again the corresponding structure for R ≅ R^op, so GW(R) ≃ GW(R^op).

**Uses.** Calmès et al. III, Example 1.1.5, p. 12: the bounds of r-symmetry and m-quadraticity pass to Q^∨; Calmès et al. III, Remark 1.3.12, p. 31: right-coherent rings are handled through R^op.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `HK.0/module-with-involution-operations`.

*Sources:* Calmès et al. III, Remark R.11, p. 11: Constructs Q^∨ on D^p(R^op) by pulling back along the duality and the equivalence Hom\_R(−,R), and deduces equivalences of the Poincaré ∞-categories and of their GW and L spectra.

### 0.6 Shifted genuine Grothendieck–Witt spectra and symplectic forms

`HK.0/shifted-gw-symplectic` · theorem

Let R be commutative and GW^{[n]}(R) := τ\_{≥0}GW(D^p(R),(Q^{≥0}\_R)[n]). Then GW^{[0]}(R) ≃ GW^s\_cl(R), GW^{[2]}(R) ≃ GW^{−ev}\_cl(R) and GW^{[4]}(R) ≃ GW^q\_cl(R), the classical group completions of symmetric, (−1)-even and quadratic forms. Moreover the (−1)-even forms on a finitely generated projective P are exactly the symplectic forms, the skew-symmetric b with b(x,x) = 0 for all x: Ĥ^0(C₂;Hom\_{R⊗R}(P⊗P,R(−1))) ≅ Hom\_R(P, φ\_\*R[2]) where R[2] is the 2-torsion of R with the Frobenius-twisted action r·a = r²a, and a skew-symmetric b maps to x ↦ b(x,x); the norm-lifting obstruction of b is this function, so b lifts exactly when it vanishes on the diagonal.

**Hypotheses.**

- R commutative.
- The twisted module structure on R[2] is the one from the Tate diagonal (correction of Remark R.7, sourceIssues E6).

**Proof route.**

- Apply the shift periodicity HK.0/shift-periodicity once and twice: (Q^gs\_R)[2] ≃ Q^ge\_{−R} and (Q^gs\_R)[4] ≃ Q^gq\_R.
- Take connective covers and apply the Hebestreit–Steimle comparison of connective genuine GW with classical GW (GN §6.8a `weightHeartGWComparison`).
- Compute Ĥ^0 = (invariants)/(norms) for C₂ acting on Hom\_{R⊗R}(P⊗P,R(−1)) by b ↦ (x,y ↦ −b(y,x)): the invariants are the skew-symmetric forms and the norms are the forms c(x,y) − c(y,x). The map b ↦ (x ↦ b(x,x)) kills norms, is additive, takes values in R[2] because 2b(x,x) = 0 for skew b, and is linear for r·a = r²a. For P = R it is the identity of R[2] (the invariants are a·xy with 2a = 0 and there are no nonzero norms); additivity in P and passage to retracts give the general case.
- Hence a skew-symmetric form lifts along the norm exactly when it vanishes on the diagonal, which is the definition of symplectic.

**Checks.**

- For R = ℤ, symplectic GW₀ is ℤ generated by the hyperbolic alternating plane (GN §6.11.1).
- Over 𝔽₂[t] with P = R and b(x,y) = xy, x ↦ b(x,x) = x² is additive and r²-linear, not R-linear.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `HK.0/shift-periodicity`; `RefinedTraceMethods:RT.2/tate-of-eilenberg-maclane`.

*Sources:* Calmès et al. III, Remark R.7, p. 9: Defines GW^{[n]} as connective covers of the shifted genuine symmetric GW, identifies GW^{[0]}, GW^{[2]}, GW^{[4]} with classical symmetric, (−1)-even and quadratic GW via Hebestreit–Steimle, and shows symplectic forms are the (−1)-even ones through a Tate cohomology computation.

### Dependencies

Requires: GeometryOfNumbersAndQuadraticArithmetic:GN.6, EnhancedDerivedSheaves:E5:abstract, RefinedTraceMethods:RT.2, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal.

## Layer HK.1: Metabolic categories, the Bott–Genauer sequence and Karoubi periodicity

The metabolic Poincaré ∞-category Met(C,Q) of arrows with the relative form, whose Poincaré objects are Poincaré objects with a Lagrangian; the Bott–Genauer Poincaré–Verdier sequence (C,Q[−1]) → Met(C,Q) → (C,Q); the identification GW(Met(C,Q)) ≃ K(C) and the resulting forgetful/hyperbolic fibre sequence GW(C,Q[−1]) → K(C) → GW(C,Q); Karoubi periodicity V(R;Q^{≥m}\_M) ≃ ΩU(R;Q^{≥m+1}\_{−M}) without inverting 2, with its two classical special cases; and the periodicity L(R;Q^{≥m}\_M) ≃ Ω²L(R;Q^{≥m+1}\_{−M}) of every bordism-invariant functor on the genuine family, in particular the 4-periodicity of L^s, L^q and K^{tC₂}. Stable GW and L spectra, Poincaré–Verdier sequences, Verdier localisation of GW and L, the bordification and its integer-shift delooping are GN §6.8a and are imported.

Targets: §1.1 The metabolic Poincaré ∞-category; §1.2 The Bott–Genauer sequence; §1.3 GW of the metabolic category and the forgetful–hyperbolic sequence; §1.4 Karoubi periodicity without inverting 2; §1.5 Classical special cases of Karoubi periodicity; §1.6 Periodicity of bordism-invariant functors on the genuine family.

Planets: Bott–Genauer sequence, Karoubi periodicity, Periodicity of L-theory.

### 1.1 The metabolic Poincaré ∞-category

`HK.1/metabolic-category` · construction

For a Poincaré ∞-category (C,Q) with duality D, Met(C,Q) is the arrow category Ar(C) = Fun(Δ¹,C) with the quadratic functor Q^met(w → x) = fib(Q(x) → Q(w)). Its bilinear part is fib(B(x,x′) → B(w,w′)), represented by the duality D^met(w → x) = (fib(Dx → Dw) → Dx), so Met(C,Q) is Poincaré. A hermitian form on f : w → x is a pair (q,η) of a form q ∈ Ω^∞Q(x) and a null-homotopy η of f^\*q; it is Poincaré exactly when q^♯ : x → Dx is an equivalence and the induced map x/w → Dw is an equivalence, i.e. when f is a Lagrangian of the Poincaré object (x,q). Thus Pn(Met(C,Q)) is the space Pn^∂(C,Q) of Poincaré objects with a Lagrangian, and forgetting the Lagrangian is induced by the Poincaré functor met : Met(C,Q) → (C,Q), (w → x) ↦ x.

**Hypotheses.**

- (C,Q) a Poincaré ∞-category in the sense of GN §6.8a (small stable C, Q reduced 2-excisive with represented cross-effect).

**Construction.**

- Q^met is reduced and 2-excisive as a fibre of two such functors composed with exact functors.
- Compute the cross-effect as the fibre of cross-effects and represent it using the duality of C; this exhibits D^met.
- Unwind a Poincaré Q^met-form into the square with corners w, fib(Dx → Dw), x, Dx; being an equivalence of arrows is the two conditions stated.

**API.**

- `metabolic` (constructor): (C,Q) ↦ Met(C,Q) on Ar(C) with Q^met(w → x) = fib(Q(x) → Q(w)).
- `metabolic_duality` (characterisation): D^met(w → x) = (fib(Dx → Dw) → Dx).
- `metabolic_poincareObject_iff` (characterisation): A Q^met-form (q,η) on w → x is Poincaré iff q is Poincaré and w → x is a Lagrangian.
- `metabolic.met` (functoriality): The Poincaré functor (w → x) ↦ x forgetting the Lagrangian.
- `metabolic.incl` (functoriality): The Poincaré functor (C,Q[−1]) → Met(C,Q), x ↦ (x → 0).
- `metabolic_map` (functoriality): A Poincaré functor (C,Q) → (C′,Q′) induces Met(C,Q) → Met(C′,Q′) compatibly with met and incl.

**Unit tests.**

- `metabolic_zero` (degenerate): Met(0,0) is the zero Poincaré ∞-category.
- `hyperbolic_in_image` (computation): For any x, (x → x ⊕ Dx) with the canonical null-homotopy is a Poincaré object of Met(C,Q) lying over hyp(x).
- `metabolic_not_hyperbolic` (non-example): In D^p(𝔽₂) with Q^s, the 2-dimensional form with b(v,v) = 0, b(v,u) = 1, b(u,u) = 1 has the Lagrangian ⟨v⟩ (so lifts to Met) but is not hyp(𝔽₂): lying in the image of met does not mean hyperbolic.
- `met_of_shift` (compatibility): incl identifies (C,Q[−1]) with the full subcategory of arrows x → 0, with Q^met restricting to ΩQ.

**Checks.**

- Met(0) = 0.
- On the hyperbolic object hyp(x) the summand inclusion x → x ⊕ Dx is a Lagrangian, so hyp(x) is in the image of Pn(Met).

**Uses.** Calmès et al. III, §1.1, p. 14: hermitian objects of Met(C,Q) are surgery data; Calmès et al. III, Construction 1.1.15, p. 14: Lagrangian surgery is surgery inside Met(C,Q); Calmès et al. III, Proposition 1.2.14, p. 18: surgery data on a Lagrangian are morphisms in Met(D^p(R),Q); GN §6.8a (additiveHermitianBordification): bordism invariance means vanishing on metabolic categories.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `EnhancedDerivedSheaves:E0/stable-categories`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-lagrangian`.

*Sources:* Calmès et al. I, Definition 2.3.5, p. 36, and Lemma 2.3.7, p. 37: Defines the metabolic category on the arrow category with the fibre quadratic functor, computes its duality, characterises its Poincaré objects as Poincaré objects with a Lagrangian, and constructs the Poincaré functors (C,Q[−1]) → Met(C,Q) → (C,Q).; Calmès et al. III, Recollection, pp. 9–10, and §1.1, pp. 13–14: Recalls the metabolic category, its duality and the identification of its Poincaré objects with Poincaré pairs (Lagrangians).

### 1.2 The Bott–Genauer sequence

`HK.1/bott-genauer-sequence` · theorem

For every Poincaré ∞-category (C,Q) the sequence (C,Q[−1]) → Met(C,Q) → (C,Q), x ↦ (x → 0) and (w → x) ↦ x, is a Poincaré–Verdier sequence (both a fibre and a cofibre sequence of Poincaré ∞-categories). Consequently every Verdier-localising invariant F gives a fibre sequence F(C,Q[−1]) → F(Met(C,Q)) → F(C,Q).

**Hypotheses.**

- Poincaré–Verdier sequences and Verdier-localising invariants as in GN §6.8a (`PoincareVerdierSequence`, `stableGWVerdierLocalization`).

**Proof route.**

- The functor x ↦ (x → 0) is fully faithful with image the arrows with zero target; this image is closed under the metabolic duality and Q^met restricts to ΩQ (Calmès et al. I, Lemma 2.3.7).
- The target functor Ar(C) → C is a Verdier projection with kernel exactly that image (an arrow with zero target is killed), and the Poincaré structure on C is the one induced by left Kan extension along the projection.
- Hence the sequence is a Poincaré–Verdier sequence (Calmès et al. II, Example 1.2.5); apply F.

**Checks.**

- For F = GW and C = 0 the sequence is trivially exact.
- For F = L, L(Met(C,Q)) = 0 and the sequence gives L(C,Q[−1]) ≃ ΩL(C,Q).

*Needs:* `HK.1/metabolic-category`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. II, Example 1.2.5, p. 20: Shows that the metabolic sequence (C,Q[−1]) → Met(C,Q) → (C,Q) is a Poincaré–Verdier sequence.; Calmès et al. I, Lemma 2.3.7, p. 37: Constructs the two Poincaré functors of the metabolic sequence.; Calmès et al. III, Recollection, pp. 9–10: Recalls the Bott–Genauer sequence and that it is a Poincaré–Verdier sequence.

### 1.3 GW of the metabolic category and the forgetful–hyperbolic sequence

`HK.1/forgetful-hyperbolic-sequence` · theorem · planet: Bott–Genauer sequence

For a Poincaré ∞-category (C,Q), GW(Met(C,Q)) ≃ K(C) naturally, via the Poincaré functors lag : Met(C,Q) ⇄ Hyp(C) : can and the equivalence GW(Hyp(C)) ≃ K(C). Under this identification the Bott–Genauer sequence becomes a fibre sequence of spectra GW(C,Q[−1]) →^{fgt} K(C) →^{hyp} GW(C,Q), where fgt is induced by forgetting the form, Pn(C,Q[−1]) → C^≃, and hyp by the hyperbolic form, C^≃ → Pn(C,Q). Writing U(C,Q) := fib(hyp) and V(C,Q) := fib(fgt), one has U(C,Q) ≃ GW(C,Q[−1]) and V(C,Q) ≃ ΩGW(C,Q[1]), hence V(C,Q) ≃ ΩU(C,Q[2]).

**Hypotheses.**

- K is the (connective) K-theory of the stable ∞-category C (GeneralAlgebraicKTheoryPartII KII.0); GW the stable GW spectrum of GN §6.8a.

**Proof route.**

- lag and can (the Poincaré functors of Calmès et al. I, Construction 2.3.8) induce inverse equivalences on GW (Calmès et al. II, Corollary 4.3.1, deduced there from its Example 2.3.3 and Corollary 3.1.5).
- GW(Hyp(C)) ≃ K(C) by hermitian additivity (GN §6.8a, the check that GW of the hyperbolic category is K).
- Apply GW to the Bott–Genauer sequence, which is a Poincaré–Verdier sequence, using that GW is Verdier localising (GN §6.8a `stableGWVerdierLocalization`).
- Read off U and V: the fibre of hyp is the first term; the sequence for Q[1] shows that the fibre of fgt : GW(C,Q) → K(C) is ΩGW(C,Q[1]); compare with U(C,Q[2]) ≃ GW(C,Q[1]).

**Checks.**

- For C = D^p(R) and Q = Q^s\_M, the composite fgt∘hyp on K₀ is P ↦ [P] + [DP].
- For a field F of characteristic ≠ 2 with Q = Q^s\_F, on π₀ the map hyp : K₀(F) = ℤ → GW₀(F) sends 1 to the hyperbolic plane and fgt : GW₀(F) → ℤ is the rank, so fgt∘hyp is multiplication by 2.

*Needs:* `HK.1/bott-genauer-sequence`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `GeneralAlgebraicKTheoryPartII:KII.0/perfect-categories`; `GeneralAlgebraicKTheoryPartII:KII.0/nonconnective-k`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-space`.

*Sources:* Calmès et al. II, Corollary 4.3.1, p. 100, and Corollary 4.3.3, pp. 100–101: Identifies GW of the metabolic category with K-theory through the hyperbolic category, derives the Bott–Genauer fibre sequence GW(C,Q[−1]) → K(C) → GW(C,Q) and Karoubi's fundamental theorem U(C,Q[2]) ≃ ΣV(C,Q).; Calmès et al. III, Recollection, p. 10: States GW(Met(C,Q)) ≃ K(C), the induced fibre sequence with fgt and hyp, and the equivalence V(R;Q) ≃ ΩU(R;Q[2]).

### 1.4 Karoubi periodicity without inverting 2

`HK.1/karoubi-periodicity` · theorem · planet: Karoubi periodicity

Let R be a ring and M an invertible ℤ-module with involution over R. For every m ∈ ℤ there is a natural equivalence V(R;Q^{≥m}\_M) ≃ ΩU(R;Q^{≥m+1}\_{−M}), where U(R;Q) = fib(K(R) → GW(R;Q)) and V(R;Q) = fib(GW(R;Q) → K(R)) are the fibres of hyp and fgt on D^p(R).

**Hypotheses.**

- R discrete associative ring; M invertible; m finite (the endpoints are covered by the same argument with m = ±∞).
- No assumption on 2.

**Proof route.**

- By HK.1/forgetful-hyperbolic-sequence, V(R;Q^{≥m}\_M) ≃ ΩU(R;(Q^{≥m}\_M)[2]).
- By HK.0/shift-periodicity, Ω : D^p(R) → D^p(R) is an equivalence of Poincaré ∞-categories (D^p(R),(Q^{≥m}\_M)[2]) ≃ (D^p(R),Q^{≥m+1}\_{−M}); it induces equivalences on K and GW compatible with hyp, hence on U.
- Combine (Calmès et al. II, Corollary 4.3.4, specialised to discrete R over Hℤ, which is 2σ-oriented).

**Checks.**

- If 2 ∈ R^×, all Q^{≥m}\_M agree and this is Karoubi's theorem V(R;Q^s\_M) ≃ ΩU(R;Q^s\_{−M}).
- The equivalence is natural for maps of rings with compatible modules with involution.

*Needs:* `HK.1/forgetful-hyperbolic-sequence`; `HK.0/shift-periodicity`.

*Sources:* Calmès et al. III, Theorem R.8, p. 10: States V(R;Q^{≥m}\_M) ≃ ΩU(R;Q^{≥m+1}\_{−M}) for every ring, invertible M and m, quoting Paper II.; Calmès et al. II, Corollary 4.3.4, p. 101: Proves U(Mod^c(R),Q^{≥m+1}\_{−M}) ≃ ΣV(Mod^c(R),Q^{≥m}\_M) for connective E₁-algebras over a 2σ-oriented base, and the quadratic and symmetric endpoint versions.

### 1.5 Classical special cases of Karoubi periodicity

`HK.1/karoubi-periodicity-special-cases` · theorem

(i) If 2 ∈ R^×, V(R;Q^s\_M) ≃ ΩU(R;Q^s\_{−M}). (ii) If R is commutative and 2-torsion free (for instance a ring of integers of a number field) and M = R with trivial involution, then V(R;Q^gs\_R) ≃ ΩU(R;Q^gs\_{−R}), V(R;Q^gs\_{−R}) ≃ ΩU(R;Q^gq\_R) and V(R;Q^gq\_R) ≃ ΩU(R;Q^gq\_{−R}); moreover V(R;Q^gq\_{−R}) ≃ ΩU(R;Q^{≥3}\_R).

**Hypotheses.**

- (ii): R commutative, 2-torsion free; trivial involution on M = R.

**Proof route.**

- (i) HK.1/karoubi-periodicity with all Q^{≥m}\_M equal by HK.0/tate-collapse-criterion.
- (ii) Apply HK.1/karoubi-periodicity with (M,m) = (R,0), (−R,0), (R,2), (−R,2) and simplify with Q^ge\_{−R} = Q^gs\_{−R} (Ĥ^0(C₂;−R) = 0), Q^gq\_R = Q^ge\_R (Ĥ^{−1}(C₂;R) = 0) and Q^{≥3}\_{−R} = Q^{≥2}\_{−R} = Q^gq\_{−R} (Ĥ^{−2}(C₂;−R) = Ĥ^0(C₂;−R) = 0 by 2-periodicity), all from HK.0/tate-collapse-criterion.

**Checks.**

- The last equivalence has Q^{≥3}\_R on the right, which is not known to be described by classical forms; it is not identified with Q^gq\_R here.

*Needs:* `HK.1/karoubi-periodicity`; `HK.0/tate-collapse-criterion`.

*Sources:* Calmès et al. III, Remark R.9, p. 10: Specialises Theorem R.8 when 2 is a unit and for 2-torsion-free commutative rings with M = R, giving three equivalences among the genuine structures and noting that the next one involves Q^{≥3}\_R.

### 1.6 Periodicity of bordism-invariant functors on the genuine family

`HK.1/bordism-invariant-periodicity` · theorem · planet: Periodicity of L-theory

Let F be a Verdier-localising invariant of Poincaré ∞-categories with F(Met(C,Q)) = 0 for all (C,Q) (bordism invariant). Then F(C,Q[n]) ≃ Σ^n F(C,Q) for all n ∈ ℤ. L-theory and the Tate construction K(C,Q)^{tC₂} are bordism invariant. Consequently, for every ring R, invertible M and m ∈ ℤ ∪ {±∞}, L(R;Q^{≥m}\_M) ≃ Ω²L(R;Q^{≥m+1}\_{−M}) and K(R;Q^{≥m}\_M)^{tC₂} ≃ Ω²K(R;Q^{≥m+1}\_{−M})^{tC₂}. In particular L(R;Q^s\_M), L(R;Q^q\_M) and K(R;M)^{tC₂} are 4-periodic, and 2-periodic when R is an 𝔽₂-algebra; and Σ⁴L^gs(R;M) ≃ L^gq(R;M), Σ²L^gs(R;M) ≃ L^ge(R;−M).

**Hypotheses.**

- F spectrum-valued, Verdier localising; K(C,Q) the K-theory spectrum of C with the C₂-action induced by the duality.

**Proof route.**

- Bordism invariance and the Bott–Genauer sequence give F(C,Q[−1]) ≃ ΩF(C,Q) (Calmès et al. II, Proposition 3.5.8); iterate. For L this is the integer-shift delooping of GN §6.8a.
- L vanishes on metabolic categories by construction of the bordification (GN §6.8a).
- K(Met(C,Q)) is the induced C₂-object of K(C) by additivity, so its Tate construction vanishes (RefinedTraceMethods RT.2/tate-vanishing-induced; Calmès et al. II, Example 3.5.7).
- Combine with HK.0/shift-periodicity: F(R;Q^{≥m}\_M) ≃ Ω²F(R;(Q^{≥m}\_M)[2]) ≃ Ω²F(R;Q^{≥m+1}\_{−M}).
- At m = ±∞ apply twice and use −(−M) = M; over an 𝔽₂-algebra −M = M already.

**Checks.**

- L^s\_n(ℤ) is ℤ, ℤ/2, 0, 0 for n ≡ 0,1,2,3 mod 4 and 4-periodic in n (GN §6.10a).
- L^gs\_{−2}(ℤ) ≅ L^ge\_0(ℤ;−1), so Theorem 5's negative range is reached from even forms.

*Needs:* `HK.1/bott-genauer-sequence`; `HK.0/shift-periodicity`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `RefinedTraceMethods:RT.2/tate-vanishing-induced`; `RefinedTraceMethods:RT.2/norm-map-tate`.

*Sources:* Calmès et al. III, Recollection pp. 10–11 and Corollary R.10, p. 10: Explains that bordism-invariant Verdier-localising functors satisfy F(C,Q[n]) ≃ Σ^nF(C,Q), that L and the Tate construction on K are examples, and derives the double-shift periodicity of L and K^{tC₂} on the family Q^{≥m}\_M with the 4- and 2-periodicity statements.; Calmès et al. II, Lemma 3.5.6 and Proposition 3.5.8, p. 87; Example 3.5.7, p. 87: Characterises bordism invariance by vanishing on metabolic categories and proves the shift formula; shows the Tate construction of K-theory is bordism invariant.

### Dependencies

Requires: HK.0, GeometryOfNumbersAndQuadraticArithmetic:GN.6, GeneralAlgebraicKTheory:K.4, RefinedTraceMethods:RT.2.

## Layer HK.2: r-symmetric and m-quadratic Poincaré structures

The two numerical measures of where an M-compatible Poincaré structure Q on D^p(R) sits between Q^q\_M and Q^s\_M: Q is r-symmetric when the fibre of Q(P[0]) → Q^s\_M(P[0]) is (−r)-truncated and m-quadratic when the cofibre of Q^q\_M(P[0]) → Q(P[0]) is m-connective, for every finitely generated projective P; their reduction to P = R and propagation to connective objects; the bounds for the genuine family (Q^{≥m}\_M is m-quadratic and (2−m)-symmetric); their invariance under passage to the opposite ring; the translation of connectivity bounds on X and DX into representability by complexes of projectives concentrated in an interval (with stably free and K₀-controlled refinements); and the connectivity estimate for an m-quadratic structure on a shifted projective. Every comparison range of HK.4–HK.7 is computed from these.

Targets: §2.1 r-symmetric and m-quadratic Poincaré structures; §2.2 Bounds for the genuine family; §2.3 The opposite structure keeps both bounds; §2.4 Connectivity criterion for complexes of bounded width; §2.5 Connectivity of an m-quadratic structure on a shifted projective.

Planets: r-symmetric and m-quadratic structures, Bounds for the genuine family, Width criterion.

### 2.1 r-symmetric and m-quadratic Poincaré structures

`HK.2/r-symmetric-m-quadratic` · definition · planet: r-symmetric and m-quadratic structures

Let Q be a Poincaré structure on D^p(R) compatible with M, i.e. with underlying duality D = Hom\_R(−,M). Then the canonical map Q^q\_M → Q^s\_M factors as Q^q\_M → Q → Q^s\_M, and Q^q\_M, Q^s\_M are the initial and the final M-compatible Poincaré structures. For r ∈ ℤ, Q is r-symmetric if for every P ∈ Proj(R) the fibre of Q(P[0]) → Q^s\_M(P[0]) is (−r)-truncated; for m ∈ ℤ, Q is m-quadratic if the cofibre of Q^q\_M(P[0]) → Q(P[0]) is m-connective. Here a spectrum E is m-connective if π\_kE = 0 for k < m and m-truncated if π\_kE = 0 for k > m. The fibre and the cofibre are exact functors, so it suffices to test P = R; if Q is r-symmetric the fibre at X is (−r−k)-truncated for every k-connective X, and if Q is m-quadratic the cofibre at X is (m+k)-connective whenever DX is k-connective.

**Hypotheses.**

- Q M-compatible; M invertible ℤ-module with involution over R.

**Construction.**

- The factorisation and extremality come from the linear-part description of quadratic functors with fixed bilinear part (Calmès et al. I, Construction 3.2.6 and Corollary 1.3.6; GN §6.8a `poincareLinearPart`).
- Fibre and cofibre of maps of reduced quadratic functors with the same bilinear part are linear (exact) functors, so their values are determined on the generator R by finite sums, retracts, shifts and extensions.
- Truncatedness is closed under extensions and under Σ^{−1}; connectivity is closed under extensions and Σ; apply this to cell decompositions of k-connective objects (for the symmetric case) and of objects with k-connective dual (for the quadratic case).

**API.**

- `IsRSymmetric Q r` (data): The fibre of Q(R[0]) → Q^s\_M(R[0]) is (−r)-truncated.
- `IsMQuadratic Q m` (data): The cofibre of Q^q\_M(R[0]) → Q(R[0]) is m-connective.
- `isRSymmetric_iff_projective` (characterisation): Equivalent to the condition for every P ∈ Proj(R).
- `IsRSymmetric.mono` (relation): r-symmetric implies r′-symmetric for r′ ≤ r; similarly m-quadratic implies m′-quadratic for m′ ≤ m.
- `IsRSymmetric.fib_truncated` (other): The fibre at a k-connective X is (−r−k)-truncated.
- `IsMQuadratic.cofib_connective` (other): The cofibre at X is (m+k)-connective when DX is k-connective.
- `compatible_factorisation` (universal-property): Q^q\_M → Q → Q^s\_M, with Q^q\_M initial and Q^s\_M final among M-compatible structures.

**Unit tests.**

- `symmetric_all_r` (degenerate): Q^s\_M is r-symmetric for every r and Q^q\_M is m-quadratic for every m (fibre, respectively cofibre, zero).
- `gs_F2_not_three_symmetric` (computation): Over 𝔽₂, Q^gs is 2-symmetric but not 3-symmetric: its fibre over R is τ\_{≤−2}ΩH𝔽₂^{tC₂}, with π\_{−2} = Ĥ^1(C₂;𝔽₂) = 𝔽₂ ≠ 0.
- `gs_Z_three_symmetric` (computation): Over ℤ, Q^gs is 3-symmetric because Ĥ^1(C₂;ℤ) = 0 kills π\_{−2} of the fibre; the bound depends on M, not only on m.
- `symmetric_not_quadratic_Z` (non-example): Q^s\_ℤ is not m-quadratic for any m: the cofibre of Q^q\_ℤ(ℤ) → Q^s\_ℤ(ℤ) is Hℤ^{tC₂}, whose π\_{−2k} = ℤ/2 for all k, so it is not bounded below.

**Checks.**

- Q^s\_M is r-symmetric for all r; Q^q\_M is m-quadratic for all m.

**Uses.** Calmès et al. III, Proposition 1.2.6, p. 16: m-quadraticity controls quadratic surgery; Calmès et al. III, Lemma 1.2.24, p. 22, and Proposition 1.3.1, p. 27: r-symmetry controls symmetric surgery and the comparison with Q^s\_M; Calmès et al. III, Corollaries 1.2.12 and 1.3.9: the comparison ranges are 2m−3 and d−2r+3; Calmès et al. III, Remark 1.3.17, p. 32: structures from form parameters are 0-quadratic and 0-symmetric.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `HK.0/flavour-notation`; `EnhancedDerivedSheaves:E5:presentability/spectra`.

*Sources:* Calmès et al. III, Remark 1.1.1, Definition 1.1.2 and Remark 1.1.3, p. 12: Records that M-compatible structures sit between Q^q\_M and Q^s\_M, defines r-symmetric and m-quadratic structures through truncatedness of the fibre and connectivity of the cofibre on projectives, and reduces to P = R with the propagation to connective objects.; Calmès et al. I, Corollary 1.3.6, p. 23: Shows the bilinear-part functor on quadratic functors has fully faithful adjoints, giving the initial and final quadratic functors with given bilinear part.

### 2.2 Bounds for the genuine family

`HK.2/genuine-family-bounds` · theorem · planet: Bounds for the genuine family

For every m ∈ ℤ the Poincaré structure Q^{≥m}\_M is m-quadratic and (2−m)-symmetric. In particular Q^gs\_M is 2-symmetric and 0-quadratic, Q^ge\_M is 1-symmetric and 1-quadratic, and Q^gq\_M is 0-symmetric and 2-quadratic.

**Hypotheses.**

- M invertible ℤ-module with involution; m finite.

**Proof route.**

- From the defining pullback (GN §6.8a) there are fibre sequences τ\_{≤m−2}ΩHM^{tC₂} → Q^{≥m}\_M(R) → Q^s\_M(R) and Q^q\_M(R) → Q^{≥m}\_M(R) → τ\_{≥m}HM^{tC₂}.
- The first fibre is (m−2)-truncated, i.e. (−(2−m))-truncated; the second cofibre is m-connective.
- Apply HK.2/r-symmetric-m-quadratic with P = R.

**Checks.**

- Q^gs\_ℤ is in fact 3-symmetric and Q^gq\_ℤ = Q^ge\_ℤ (HK.0/tate-collapse-criterion), so the bounds are not optimal for every M.

*Needs:* `HK.2/r-symmetric-m-quadratic`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `RefinedTraceMethods:RT.2/norm-map-tate`.

*Sources:* Calmès et al. III, Example 1.1.4, p. 12: Derives from two fibre sequences on R that Q^{≥m}\_M is m-quadratic and (2−m)-symmetric, and lists the three genuine cases.

### 2.3 The opposite structure keeps both bounds

`HK.2/opposite-ring-bounds` · theorem

If Q is an M-compatible r-symmetric and m-quadratic Poincaré structure on D^p(R), then Q^∨ (HK.0/opposite-ring-transport) is an M^∨-compatible r-symmetric and m-quadratic Poincaré structure on D^p(R^op).

**Hypotheses.**

- Q M-compatible on D^p(R).

**Proof route.**

- Under the equivalence of Remark R.11 the map Q^q\_{M^∨}(R^op) → Q^∨(R^op) is Q^q\_M(M[0]) → Q(M[0]).
- M is finitely generated projective, so by HK.2/r-symmetric-m-quadratic the cofibre is m-connective; the symmetric bound is checked the same way on the fibre.

**Checks.**

- For commutative R and M = R with trivial involution, R^op = R, M^∨ = R and the genuine structures satisfy (Q^{≥m}\_R)^∨ = Q^{≥m}\_R; for a nontrivial line bundle L, L^∨ = L^{−1} ≠ L, so the statement transports bounds between different coefficients.

*Needs:* `HK.2/r-symmetric-m-quadratic`; `HK.0/opposite-ring-transport`.

*Sources:* Calmès et al. III, Example 1.1.5, p. 12: Shows Q^∨ is r-symmetric and m-quadratic when Q is, by evaluating on M[0] and using that M is finitely generated projective.

### 2.4 Connectivity criterion for complexes of bounded width

`HK.2/width-criterion` · theorem · planet: Width criterion

For X ∈ D^p(R) and integers k ≤ l the following are equivalent: (i) X is represented by a complex 0 → P\_l → ⋯ → P\_k → 0 of finitely generated projective R-modules with P\_i in homological degree i; (ii) X is k-connective and DX = Hom\_R(X,M) is (−l)-connective. The duality is not needed: (ii) may be read with Hom\_R(X,R) ∈ D^p(R^op). One-sidedly, X is k-connective exactly when it is represented by a complex of finitely generated projectives vanishing below degree k. If M is free and X ∈ D^f(R), (ii) is equivalent to (i) with stably free P\_i; more generally, for Free(R) ⊆ 𝒞 ⊆ Proj(R) closed under duality and sums and X represented by a bounded 𝒞-valued complex, (ii) is equivalent to (i) with each P\_i stably in 𝒞.

**Hypotheses.**

- R any ring; X perfect; M invertible (finitely generated projective in either structure).

**Proof route.**

- (i) ⇒ (ii) is immediate.
- For (ii) ⇒ (i) take a representing complex C of minimal length. If C\_i ≠ 0 with i < k minimal then H\_i(C) = 0, so C\_{i+1} → C\_i is a surjection of projectives, hence split with projective kernel; replacing C\_{i+1} by the kernel and deleting C\_i shortens C, a contradiction.
- The termwise dual complex (DC)\_i = D(C\_{−i}) represents DX and is again of minimal length since M is finitely generated projective; the same argument places it in degrees ≥ −l, so C is in degrees ≤ l.
- The free and 𝒞-valued refinements run the same argument, where the kernel of a split surjection between stably-𝒞 modules is stably in 𝒞.

**Checks.**

- X = ℤ/2[0] ∈ D^p(ℤ) (resolved by ℤ →² ℤ in degrees [0,1]) is 0-connective and Dℤ/2 ≃ ℤ/2[−1] is (−1)-connective, so it is represented in [0,1] and not in [0,0].
- P[0] for P projective is 0-connective with 0-connective dual, so it is represented in [0,0].

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `mathlib:Module.Projective`; `mathlib:ChainComplex`; `mathlib:HomotopyEquiv`; `mathlib:HomologicalComplex.homology`.

*Sources:* Calmès et al. III, Lemma 1.1.6 and Remarks 1.1.7–1.1.8, pp. 12–13: Proves the equivalence of representability in degrees [k,l] with the connectivity bounds on X and DX by a minimal-length argument, notes that no duality is needed and that connectivity alone gives one-sided representability, and states the stably free and intermediate-subcategory refinements.

### 2.5 Connectivity of an m-quadratic structure on a shifted projective

`HK.2/shifted-projective-connectivity` · theorem

If Q is an m-quadratic Poincaré structure on D^p(R), then for every P ∈ Proj(R) and k ∈ ℤ the spectrum Q(P[k]) is min(−2k, m−k)-connective.

**Hypotheses.**

- Q M-compatible and m-quadratic.

**Proof route.**

- The cofibre of Q^q\_M(P[k]) → Q(P[k]) is (m−k)-connective by HK.2/r-symmetric-m-quadratic, since D(P[k]) = (DP)[−k] is (−k)-connective.
- Q^q\_M(P[k]) = (Hom\_{R⊗R}(P⊗P,M)[−2k])\_{hC₂} is (−2k)-connective because P is projective and homotopy orbits preserve connectivity (RefinedTraceMethods RT.2/homotopy-orbits-fixed-points).

**Checks.**

- For Q = Q^gs\_M (m = 0) and k = −1, Q(P[−1]) is 1-connective since min(2, 1) = 1; for k = 1 the bound is min(−2, −1) = −2.

*Needs:* `HK.2/r-symmetric-m-quadratic`; `RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`.

*Sources:* Calmès et al. III, Lemma 1.2.10, p. 17: Proves that Q(P[k]) is min(−2k, m−k)-connective for an m-quadratic Q and projective P, from the cofibre bound and connectivity of homotopy orbits.

### Dependencies

Requires: HK.0, GeometryOfNumbersAndQuadraticArithmetic:GN.6, EnhancedDerivedSheaves:E5:presentability.

## Layer HK.3: Cobordism groups, Lagrangian surgery and bounded L-groups

The generators-and-relations description of L-groups as cobordism groups of Poincaré objects of the shifted structures Q[−n], compared with the homotopy groups of the L-spectrum of GN §6.8a; Lagrangian surgery, the relative form of algebraic surgery inside Met(C,Q), with the fibre sequences that control the new Lagrangian; the bounded-width monoids L^{a,b}\_n(R;Q) of n-dimensional Poincaré objects of width a modulo those with an allowed Lagrangian of width b, with their interpretation through the width criterion; the identification of the Witt group of strictly metabolic quotients with L^{0,0}\_0; hyperbolicity of strictly metabolic 1-quadratic forms; and the formal comparison L^{a,a}\_n ≅ L^{a,a+1}\_n. Algebraic surgery itself (a surgery datum on a Poincaré object produces a cobordant Poincaré object, with the surgery diagram) is GN §6.8a (`PoincareSurgeryDatum`, isotropic surgery) and is imported.

Targets: §3.1 L-groups as cobordism groups; §3.2 Lagrangian surgery; §3.3 Bounded-width L-monoids; §3.4 The Witt group of projectives as a bounded L-group; §3.5 Strictly metabolic 1-quadratic forms are hyperbolic; §3.6 Widening the Lagrangian bound by one changes nothing.

Planets: Bounded L-groups.

### 3.1 L-groups as cobordism groups

`HK.3/cobordism-presentation` · theorem

Let (C,Q) be a Poincaré ∞-category and n ∈ ℤ. Call Poincaré objects (X,q), (X′,q′) cobordant if (X ⊕ X′, q ⊕ (−q′)) admits a Lagrangian. Cobordism is a congruence for ⊕, the diagonal X → X ⊕ X is a Lagrangian of (X ⊕ X, q ⊕ (−q)), and the set L\_n(C,Q) of cobordism classes of Poincaré objects for Q[−n] = Ω^nQ is an abelian group. There is an exact sequence of commutative monoids π₀Pn^∂(C,Q[−n]) → π₀Pn(C,Q[−n]) → L\_n(C,Q) → 0, L\_n(C,Q) is the cokernel of the boundary map in commutative monoids, and L\_n(C,Q) ≅ π\_n L(C,Q) for the L-spectrum of GN §6.8a.

**Hypotheses.**

- (C,Q) Poincaré; Pn^∂ = Pn(Met(C,Q)) is the space of Poincaré objects with a Lagrangian (HK.1/metabolic-category).

**Proof route.**

- Congruence: a sum of Lagrangians is a Lagrangian of the sum.
- Diagonal: the diagonal of X → X ⊕ X with the evident null-homotopy of q − q is a Lagrangian (GN 6.2 `symmetric-diagonal-lagrangian` in the exact setting; the same check in the stable setting).
- The cokernel in commutative monoids surjects onto the cobordism group with trivial kernel by exactness, and it is a group (Calmès et al. I, Lemma 2.3.10), hence they agree (Calmès et al. I, Definition 2.3.11).
- π₀ of the L-spectrum is L₀ (Calmès et al. II, Definition 4.2.6 and its realisation of cobordisms), and π\_nL(C,Q) = L₀(C,Q[−n]) by the shift delooping of GN §6.8a.

**Checks.**

- Over a field F of characteristic ≠ 2 with Q = Q^s\_F, L₀ is the Witt group of F (HK.4/witt-group-computes-L0 and QuadraticFormInvariants Layer 4).
- The hyperbolic object hyp(X) is zero in L₀.

*Needs:* `HK.1/metabolic-category`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6/symmetric-diagonal-lagrangian`.

*Sources:* Calmès et al. III, Definition 1.1.9 and Remark 1.1.10, pp. 13–14: Defines cobordism of Poincaré objects and the L-groups of the shifted structures, shows they are abelian groups via the diagonal Lagrangian, records the exact sequence of monoids and compares with the cokernel definition of Paper I.; Calmès et al. I, Lemma 2.3.10 and Definition 2.3.11, p. 38: Proves that the cokernel of π₀Pn^∂ → π₀Pn in commutative monoids is a group and defines the L-groups as these cokernels.; Calmès et al. II, Definition 4.2.6 and Corollary 4.2.7, p. 100: Identifies L₀ with π₀ of the cobordism category and the negative homotopy of GW with L₀ of the shifted structures.

### 3.2 Lagrangian surgery

`HK.3/lagrangian-surgery` · construction

Let (L → X, q, η) be a Lagrangian of a Poincaré object (X,q), viewed as a Poincaré object of Met(C,Q). A surgery datum on it is a morphism (Z → W) → (L → X) in Met(C,Q) with a null-homotopy of the pulled-back Q^met-form; algebraic surgery (GN §6.8a) produces a new Poincaré object (L′ → X′, q′, η′) of Met(C,Q), where X′ is the surgery of X along W → X and L′ = fib(L/Z → D(W/Z)) for the metabolic duality. A Lagrangian surgery datum is the case W = 0: a map Z → N := fib(L → X) together with a null-homotopy in ΩQ(Z). Then X′ ≃ X canonically, and there are fibre sequences L′ → L/Z → ΩDZ and N′ → N/Z → ΩDZ with N′ = fib(L′ → X). One then says that L is cobordant to L′ relative to X.

**Hypotheses.**

- (C,Q) Poincaré; the shift conventions are those of HK.1/metabolic-category.

**Construction.**

- A morphism (Z → W) → (L → X) in the arrow category with a null-homotopy of the Q^met-form is a surgery datum in Met(C,Q); apply algebraic surgery there (GN §6.8a) and read off the underlying arrow using D^met.
- If W = 0 the morphism is the same as a map Z → N, the form condition becomes a null-homotopy in Q^met(Z → 0) = ΩQ(Z), the surgery on the target X is along 0 → X and changes nothing, and the surgery diagram (Calmès et al. III, Remark 1.1.14) gives the two fibre sequences.

**API.**

- `LagrangianSurgeryDatum` (structure): A map Z → fib(L → X) with a null-homotopy of the restricted form in ΩQ(Z).
- `LagrangianSurgeryDatum.result` (constructor): The new Lagrangian L′ → X.
- `LagrangianSurgeryDatum.result_fib` (characterisation): Fibre sequences L′ → L/Z → ΩDZ and N′ → N/Z → ΩDZ.
- `LagrangianSurgeryDatum.target_eq` (simp): The underlying Poincaré object of the result is X.
- `Lagrangian.CobordantRel` (relation): L and L′ are cobordant relative to X when related by Lagrangian surgery data.
- `metabolicSurgery` (constructor): Surgery along a general datum (Z → W) → (L → X), with L′ = fib(L/Z → D(W/Z)).

**Unit tests.**

- `zero_datum` (degenerate): Z = 0 gives L′ = L and N′ = N.
- `connectivity_step` (computation): In the shifted structure Q[−n], if N is l-connective and P[l] → N (P projective) is onto on H\_l with −l−n−1 > l+1, the sequence N′ → N/P[l] → D(P)[−l−n−1] shows N′ is (l+1)-connective: this is the inductive step of quadratic surgery.
- `relative_cobordism_symmetric` (characterisation): Cobordism relative to X is an equivalence relation on Lagrangians of X.
- `nonzero_target_changes_X` (non-example): A datum with W ≠ 0 is not Lagrangian surgery: surgery of hyp(Y) along its Lagrangian Y → hyp(Y) gives X′ = fib(DY → DY) = 0, so the underlying Poincaré object changes.

**Checks.**

- Surgery along the zero datum returns (L → X).
- If Z → N is an equivalence the new Lagrangian L′ is computed from L/N ≃ X.

**Uses.** Calmès et al. III, Proposition 1.2.6(ii), p. 16: makes Lagrangians and their fibres more connective; Calmès et al. III, Proposition 1.3.1(ii), p. 27: symmetric version of the same improvement; Calmès et al. III, Proposition 1.2.14, p. 18: a datum with W = Z = L″ splits off a bottom-degree projective; Calmès et al. III, Proposition 1.2.26(ii), p. 23: same improvement over ring spectra.

*Needs:* `HK.1/metabolic-category`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Remark 1.1.14 and Construction 1.1.15, pp. 14–15: Displays the surgery diagram and constructs Lagrangian surgery as surgery in the metabolic category, with the case of a datum with zero target, the fibre sequences for the new Lagrangian and its fibre, and the notion of Lagrangians cobordant relative to X.

### 3.3 Bounded-width L-monoids

`HK.3/bounded-l-monoids` · definition · planet: Bounded L-groups

Let Q be an M-compatible Poincaré structure on D^p(R) and n, a, b ∈ ℤ with a, b ≥ −1, b ≥ a − 1 and n + a even. Pn^a\_n(R,Q) ⊆ Pn(D^p(R),Q[−n]) is spanned by the Poincaré objects (X,q) with X ((−n−a)/2)-connective, and M^{a,b}\_n(R,Q) ⊆ Pn^∂(D^p(R),Q[−n]) by the Poincaré pairs (L → X, q, η) with X ((−n−a)/2)-connective, L ⌈(−n−1−b)/2⌉-connective and N := fib(L → X) ≃ Ω^{n+1}DL ⌊(−n−1−b)/2⌋-connective (allowed Lagrangians). Define L^{a,b}\_n(R;Q) := coker(π₀M^{a,b}\_n(R,Q) → π₀Pn^a\_n(R,Q)) in commutative monoids. By the width criterion, X is then represented by a complex of projectives in degrees [(−n−a)/2, (−n+a)/2] (width a); for b + n odd both L and N are represented in [(−n−1−b)/2, (−n−1+b)/2]; for b + n even (then b ≥ a) L is represented in [(−n−b)/2, (−n+b)/2] and N in [(−n−b)/2 − 1, (−n+b)/2 − 1]. If b ≥ a the diagonal of (X,q) ⊕ (X,−q) is allowed and L^{a,b}\_n(R;Q) is a group; Pn^{−1}\_n is contractible. The same definitions make sense for a stable ∞-category with a t-structure (HK.6/t-structure-bounded-l) and for compact modules over a connective ring spectrum (HK.5/ring-spectrum-setting).

**Hypotheses.**

- Parity: n + a even, so (−n−a)/2 ∈ ℤ.
- Connectivity is that of the underlying complex (Postnikov t-structure on D(R)).

**Construction.**

- Membership is a condition on components, so the subspaces and the monoid map are well defined; direct sums preserve all bounds.
- DX ≃ X[n] for a Poincaré object of Q[−n], so the connectivity of X gives that of DX and HK.2/width-criterion gives the representing interval.
- For b + n odd the bounds on X and N imply the one on L; for b + n even the bounds on X and L imply the one on N, using DL ≃ N[n+1].
- If b ≥ a the diagonal Lagrangian of (X ⊕ X, q ⊕ −q) has L = X, which satisfies the bounds.

**API.**

- `Pn.boundedWidth Q n a` (constructor): The subspace Pn^a\_n(R,Q) of ((−n−a)/2)-connective Poincaré objects of Q[−n].
- `Pn.allowedLagrangians Q n a b` (constructor): The subspace M^{a,b}\_n(R,Q) of Poincaré pairs with the three bounds.
- `boundedL Q n a b` (constructor): L^{a,b}\_n(R;Q) as the cokernel monoid.
- `boundedL.toL` (functoriality): The canonical monoid map L^{a,b}\_n(R;Q) → L\_n(R;Q).
- `boundedL.map` (functoriality): Functoriality in maps of Poincaré structures Q → Q′ with the same duality.
- `boundedL.isGroup_of_le` (characterisation): b ≥ a implies L^{a,b}\_n(R;Q) is a group.
- `boundedL.representingInterval` (other): Objects are represented in [(−n−a)/2, (−n+a)/2]; Lagrangians in the intervals of the two parity cases.

**Unit tests.**

- `width_minus_one_trivial` (degenerate): Pn^{−1}\_n(R,Q) is contractible, so L^{−1,b}\_n(R;Q) = 0.
- `width_zero_projective` (computation): For n = 0, a = 0 the objects are finitely generated projective modules in degree 0 with a Poincaré form.
- `parity_required` (non-example): For n + a odd, (−n−a)/2 is not an integer and the definition is not used; e.g. (n,a) = (0,1) is excluded.
- `group_needs_b_ge_a` (characterisation): For b = a − 1 the diagonal of X ⊕ X need not be allowed; L^{a,a−1}\_n is shown to be a group only under quadraticity hypotheses (HK.4/quadratic-surgery).

**Checks.**

- (n,a,b) = (0,0,1): objects are projective modules in degree 0 and allowed Lagrangians are represented in degrees [−1,0].
- (n,a,b) = (n,n,n+1), n ≥ 0: objects in degrees [−n,0] and Lagrangians in [−n−1,0], Ranicki's lengths.

**Uses.** Calmès et al. III, Proposition 1.2.6, p. 16: the target of quadratic surgery; Calmès et al. III, Proposition 1.2.23, p. 21: Ranicki's short L-groups are L^{n,n+1}\_n(R;Q^s\_M); Calmès et al. III, Corollary 1.3.3, p. 28: L^{d,d}\_n and L^{d−1,d}\_n compute L\_n for coherent rings of global dimension d; Calmès et al. III, Remark 1.2.4, p. 15: L^{0,0}\_0 is the Witt group of projectives.

*Needs:* `HK.3/cobordism-presentation`; `HK.2/width-criterion`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Definition 1.2.1 and Remarks 1.2.2–1.2.3, p. 15: Defines the spaces of width-bounded Poincaré objects and allowed Lagrangians and the cokernel monoids L^{a,b}\_n, interprets the bounds as representability in explicit intervals in both parities, notes Pn^{−1}\_n is contractible and that the monoid is a group when b ≥ a.

### 3.4 The Witt group of projectives as a bounded L-group

`HK.3/strictly-metabolic-witt` · theorem

Let Q be a Poincaré structure on D^p(R) whose duality preserves Proj(R). A Poincaré object (P,q) with P ∈ Proj(R) is strictly metabolic if it has a projective submodule L with q\|\_L = 0 in π₀Q(L) and 0 → L → P → DL → 0 exact. The Witt group W(Proj(R);Q) is the quotient of π₀Pn^0\_0(R,Q) by the submonoid generated by strictly metabolic objects; when Q restricts to an abelian-group-valued functor on Proj(R) it is the classical Witt group of the exact category with duality (GN 6.4 `exact-witt-group`). There is a canonical isomorphism W(Proj(R);Q) ≅ L^{0,0}\_0(R;Q).

**Hypotheses.**

- Duality preserves Proj(R) (true for Q compatible with an invertible M).

**Proof route.**

- It suffices that (P,q) is strictly metabolic iff it admits an allowed Lagrangian of width 0.
- An allowed Lagrangian of width 0 is a projective L with fibre DL[−1], i.e. a short exact sequence 0 → L → P → DL → 0 with q\|\_L null.
- Conversely any null-homotopy η of q\|\_L makes (L → P, η) allowed, because whether the square with corners L, P, 0, DL is cartesian is exactly exactness of the sequence and does not depend on η.

**Checks.**

- For a field F of characteristic ≠ 2 with Q^gs\_F this is the usual Witt group W(F) of QuadraticFormInvariants Layer 4.
- For ℤ with Q^gs\_ℤ the class of ⟨1⟩ has infinite order (signature).

*Needs:* `HK.3/bounded-l-monoids`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-witt-group`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-lagrangian`; `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

*Sources:* Calmès et al. III, Remark 1.2.4, pp. 15–16: Defines strictly metabolic objects and the Witt group W(Proj(R);Q), notes it is the classical Witt group for abelian-group-valued Q, and proves W(Proj(R);Q) ≅ L^{0,0}\_0(R;Q) by showing strict metabolicity is the same as having an allowed Lagrangian.

### 3.5 Strictly metabolic 1-quadratic forms are hyperbolic

`HK.3/strictly-metabolic-hyperbolic` · theorem

Let Q be 1-quadratic, P finitely generated projective and (P,q) strictly metabolic with strict Lagrangian L → P (so fib(L → P) ≃ DL[−1] and P ≅ L ⊕ DL). Then (P,q) ≃ hyp(L).

**Hypotheses.**

- Q 1-quadratic (e.g. Q^ge\_M, Q^gq\_M, Q^q\_M).

**Proof route.**

- By the algebraic Thom isomorphism (Calmès et al. I, Corollary 2.4.6), Poincaré structures on L → P in Met(D^p(R),Q) correspond to points of ΩQ(DL[−1]).
- As Q is 1-quadratic, HK.2/shifted-projective-connectivity (or Remark 1.1.3 directly) shows this space is connected, so the metabolic object is equivalent to the hyperbolic one on L.

**Checks.**

- Over 𝔽₂ with Q^s (not 1-quadratic) the strictly metabolic plane with b(v,v) = 0, b(u,u) = 1 is not hyperbolic, so the hypothesis is needed.
- This recovers the classical fact that a strictly metabolic quadratic form on a projective module is hyperbolic.

*Needs:* `HK.3/strictly-metabolic-witt`; `HK.2/r-symmetric-m-quadratic`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-space`.

*Sources:* Calmès et al. III, Remark 1.2.5, p. 16: Uses the algebraic Thom isomorphism and connectedness of the space of shifted forms for a 1-quadratic structure to show strictly metabolic objects are hyperbolic.; Calmès et al. I, Corollary 2.4.6, p. 43: The algebraic Thom isomorphism identifying Poincaré objects of the metabolic category over a fixed arrow with shifted forms on its fibre.

### 3.6 Widening the Lagrangian bound by one changes nothing

`HK.3/widen-lagrangian-bound` · theorem

For any M-compatible Poincaré structure Q on D^p(R), any n ∈ ℤ and a ≥ 0 with a + n even, the canonical map L^{a,a}\_n(R;Q) → L^{a,a+1}\_n(R;Q) is an isomorphism.

**Hypotheses.**

- Q compatible with an invertible M, as in HK.3/bounded-l-monoids; no quadraticity or symmetry hypothesis.

**Proof route.**

- Surjectivity: both are quotients of the same monoid π₀Pn^a\_n.
- Injectivity reduces to: if (L → X) ∈ π₀M^{a,a+1}\_n then X is zero in L^{a,a}\_n. Write k = (−n−a)/2; L is represented in [k−1, k+a], so there is a fibre sequence L″ → L → L′ with L″ = P[k−1] for P projective and L′ k-connective.
- View L″ → L as a morphism in Met(D^p(R),Q) with source L″ → L″; since Q^met of an identity arrow is contractible it refines canonically to a surgery datum. Surgery gives a Lagrangian L′ → X′ in M^{a,a}\_n with X′ still k-connective.
- Since L″ → X is null (X is k-connective), the datum splits as the trivial datum on X plus a datum L″ → 0 given by a loop in Ω^nQ(L″); so X′ ≃ X ⊕ Z where Z carries the Lagrangian Ω^{n+1}DL″ = (DP)[−n−k], which is k-connective. Hence [X] = [X′] = 0 in L^{a,a}\_n.

**Checks.**

- (n,a) = (0,0): L^{0,0}\_0 ≅ L^{0,1}\_0, which with HK.3/strictly-metabolic-witt identifies the Witt group with L^{0,1}\_0.

*Needs:* `HK.3/bounded-l-monoids`; `HK.3/lagrangian-surgery`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Proposition 1.2.14, pp. 18–19: Proves that L^{a,a}\_n → L^{a,a+1}\_n is an isomorphism for every Poincaré structure by splitting off a bottom-degree projective from a width a+1 Lagrangian and performing surgery in the metabolic category.

### Dependencies

Requires: HK.1, HK.2, GeometryOfNumbersAndQuadraticArithmetic:GN.6.

## Layer HK.4: Surgery for m-quadratic structures and Ranicki's symmetric L-groups

Quadratic surgery: for an m-quadratic Q, bounded-width representatives and bounded-width Lagrangians compute L\_n(R;Q) when a ≥ n − 2m and b ≥ n − 2m + 1; representatives for L^q\_n (surgery below the middle dimension) and for L^gs\_n in degrees [−n,0]; the comparison L^q\_n(R;M) → L\_n(R;Q), an isomorphism for n ≤ 2m − 3 and onto for n = 2m − 2, which is essentially optimal; the identification of L₀ of a 0-quadratic structure, and of L^gs\_0, L^ge\_0, L\_0(Q^{≥m}) for m ≥ 2, with classical Witt groups of symmetric, even and quadratic forms, and of the even non-positive genuine symmetric L-groups; the stably free and K₀-controlled variants; Ranicki's n-dimensional symmetric Poincaré complexes and pairs, his short symmetric and short even L-groups and their negative extension; and Theorem 5: L^short\_n(R;M) ≅ L^gs\_n(R;M) for all n, with Ranicki's quadratic L-groups equal to L^q\_n and different from L^gq\_n.

Targets: §4.1 Surgery for m-quadratic Poincaré structures; §4.2 Representatives for quadratic L-groups; §4.3 Representatives for genuine symmetric L-groups; §4.4 Quadratic L-theory agrees with an m-quadratic flavour in low degrees; §4.5 Degree-zero L-groups are classical Witt groups; §4.6 Free and K₀-controlled variants; §4.7 Ranicki's short symmetric L-groups; §4.8 Ranicki's groups are bounded L-groups of the symmetric structure; §4.9 Symmetric and r-symmetric forms agree in bounded width; §4.10 Ranicki's even L-groups are genuine even L-groups; §4.11 Theorem 5: Ranicki's symmetric L-groups are the genuine symmetric L-groups; §4.12 Ranicki's quadratic L-groups and a warning.

Planets: Surgery for m-quadratic structures, Quadratic comparison in low degrees, Degree-zero L-groups are Witt groups, Ranicki's short L-groups, Theorem 5 (Ranicki's L-groups).

### 4.1 Surgery for m-quadratic Poincaré structures

`HK.4/quadratic-surgery` · theorem · planet: Surgery for m-quadratic structures

Let Q be an m-quadratic Poincaré structure on D^p(R), n ∈ ℤ, and a, b ≥ 0 with b ≥ a − 1 and n + a, n + 1 + b even. (i) If a ≥ n − 2m, every Poincaré object of (D^p(R),Q[−n]) is cobordant to a ((−n−a)/2)-connective one. (ii) If b ≥ n − 2m + 1, every Lagrangian L → X of a ((−n−a)/2)-connective Poincaré object is cobordant relative to X to a Lagrangian L′ → X with L′ and fib(L′ → X) both ((−n−1−b)/2)-connective. If both inequalities hold, L^{a,b}\_n(R;Q) is a group, L^{a,b}\_n(R;Q) → L\_n(R;Q) is an isomorphism, and π₀M^{a,b}\_n → π₀Pn^a\_n → L^{a,b}\_n is exact in the middle. The objects in (i) are concentrated in [(−n−a)/2, (−n+a)/2] and the Lagrangians in (ii) in [(−n−1−b)/2, (−n−1+b)/2].

**Hypotheses.**

- Q M-compatible and m-quadratic; parities n + a and n + 1 + b even; a, b ≥ 0.

**Proof route.**

- (i) If X is k-connective with k < (−n−a)/2, choose a projective P and P[k] → X onto on H\_k (HK.2/width-criterion).
- By HK.2/shifted-projective-connectivity, Q(P[k]) is min(−2k, m−k)-connective and min(−2k, m−k) > min(n+a, (2m+n+a)/2) ≥ n, so Ω^{∞+n}Q(P[k]) is connected and q restricts to zero on P[k]: this is a surgery datum.
- Surgery (GN §6.8a) gives X′ = fib(X/P[k] → D(P)[−k−n]); since −k−n > k+1 (from −2k−1 > n+a ≥ n), X′ is (k+1)-connective. Induct.
- (ii) If N = fib(L → X) is l-connective with l < (−n−1−b)/2, choose P[l] → N onto on H\_l; Q^met(P[l] → 0) ≃ ΩQ(P[l]) is (n+1)-connective by the same estimate with n+1+b, so this is a Lagrangian surgery datum (HK.3/lagrangian-surgery). The new fibre N′ fits into N′ → N/P[l] → D(P)[−l−n−1] and is (l+1)-connective. Induct; L′ inherits the bound because b ≥ a − 1.
- The diagonal Lagrangian and (ii) make L^{a,b}\_n a group; (i) gives surjectivity and (ii) injectivity onto L\_n(R;Q); (ii) also gives exactness in the middle.

**Checks.**

- Numerical core: for integers with n + a even, a ≥ n − 2m, a ≥ 0 and 2k < −n − a, one has n < −2k and n < m − k (checked by omega in Suggested.lean).
- For Q^q\_M (m arbitrary) every n is in range.

*Needs:* `HK.3/bounded-l-monoids`; `HK.3/lagrangian-surgery`; `HK.2/shifted-projective-connectivity`; `HK.2/width-criterion`; `HK.3/cobordism-presentation`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Proposition 1.2.6 and Remark 1.2.7, p. 16; proof pp. 17–18; Remark 1.2.11, p. 18: Proves that for an m-quadratic structure Poincaré objects and Lagrangians can be made connective by surgery along projectives in the stated ranges, that L^{a,b}\_n is then a group isomorphic to L\_n, gives the concentration intervals, and notes exactness in the middle.

### 4.2 Representatives for quadratic L-groups

`HK.4/quadratic-representatives` · theorem

Q^q\_M is m-quadratic for every m. For n = 2k, every class of L^q\_n(R;M) is represented by a Poincaré object concentrated in degree −k, which is zero iff it has a Lagrangian concentrated in degrees [−k−1,−k]. For n = 2k+1, every class is represented in degrees [−k−1,−k] and is zero iff it has a Lagrangian concentrated in degree −k−1. The same holds for any m-quadratic Q provided n ≤ 2m (surgery below the middle dimension).

**Hypotheses.**

- Q = Q^q\_M, or Q m-quadratic with n ≤ 2m.

**Proof route.**

- Apply HK.4/quadratic-surgery with (a,b) = (0,1) for n even and (1,0) for n odd; read the intervals from HK.3/bounded-l-monoids.

**Checks.**

- For R = ℤ, L^q\_0(ℤ) = ℤ is generated by the E₈ form in degree 0 (GN §6.10a).

*Needs:* `HK.4/quadratic-surgery`; `HK.2/genuine-family-bounds`.

*Sources:* Calmès et al. III, Example 1.2.8, pp. 16–17: Applies quadratic surgery with (a,b) = (0,1) and (1,0) to describe representatives and null-cobordisms for quadratic L-groups, and notes the same for m-quadratic structures with n ≤ 2m.

### 4.3 Representatives for genuine symmetric L-groups

`HK.4/genuine-symmetric-representatives` · theorem

For every n ≥ 0, every class of L^gs\_n(R;M) is represented by a Poincaré object concentrated in degrees [−n,0], and such an object is zero iff it has a Lagrangian concentrated in degrees [−n−1,0]. Equivalently L^{n,n+1}\_n(R;Q^gs\_M) → L^gs\_n(R;M) is an isomorphism.

**Hypotheses.**

- n ≥ 0.

**Proof route.**

- Q^gs\_M is 0-quadratic (HK.2/genuine-family-bounds); apply HK.4/quadratic-surgery with m = 0, (a,b) = (n,n+1): a = n ≥ n, b = n+1 ≥ n+1, and n + a, n + 1 + b are even.

**Checks.**

- n = 0: classes are symmetric forms on projective modules and Lagrangians are complexes in [−1,0].

*Needs:* `HK.4/quadratic-surgery`; `HK.2/genuine-family-bounds`.

*Sources:* Calmès et al. III, Corollary 1.2.9, p. 17: States that genuine symmetric L-classes in degree n ≥ 0 are represented in [−n,0] with null-cobordisms in [−n−1,0], i.e. L^{n,n+1}\_n(R;Q^gs\_M) ≅ L^gs\_n(R;M), from quadratic surgery with m = 0.

### 4.4 Quadratic L-theory agrees with an m-quadratic flavour in low degrees

`HK.4/quadratic-low-degree-comparison` · theorem · planet: Quadratic comparison in low degrees

If Q is m-quadratic (for instance Q = Q^{≥m}\_M), the map L^q\_n(R;M) = L\_n(R;Q^q\_M) → L\_n(R;Q) is an isomorphism for n ≤ 2m − 3 and surjective for n = 2m − 2. The range is essentially optimal: for R = ℤ and m = 0, ℤ/2 ≅ L^q\_{−2}(ℤ) → L^gs\_{−2}(ℤ) = 0 is not injective.

**Hypotheses.**

- Q M-compatible and m-quadratic.

**Proof route.**

- For n ≤ 2m − 2 pick a ∈ {0,1} with n + a even; then a ≥ n − 2m, so both sides are represented by ((−n−a)/2)-connective objects (HK.4/quadratic-surgery (i)).
- On such X, DX ≃ ΣⁿX is ((n−a)/2)-connective, so the cofibre of Q^q\_M(X) → Q(X) is (m + (n−a)/2)-connective and m + (n−a)/2 ≥ n + 1; hence Q^q\_M(X) → Q(X) is onto on π\_n: surjectivity.
- For n ≤ 2m − 3 pick b ∈ {0,1} with n + 1 + b even; by (ii) a Lagrangian may be taken with L and its fibre ((−n−1−b)/2)-connective; then DL ≃ Σ^{n+1}N is ((n+1−b)/2)-connective and the cofibre on L is (2m+n+1−b)/2 ≥ n + 2 connective, so Q^q\_M(L) → Q(L) is bijective on π\_n and onto on π\_{n+1}: the Lagrangian refines to a Q^q\_M-Lagrangian: injectivity.
- The printed proof ends with 'n ≤ 2n − 3', which should read 'n ≤ 2m − 3' (sourceIssues E1).

**Checks.**

- Q = Q^gs\_M (m = 0): L^q\_n ≅ L^gs\_n for n ≤ −3 and onto for n = −2.
- Q = Q^gq\_M (m = 2): L^q\_n ≅ L^gq\_n for n ≤ 1 (compare GN §6.10a over ℤ).

*Needs:* `HK.4/quadratic-surgery`; `HK.2/r-symmetric-m-quadratic`; `HK.2/shifted-projective-connectivity`.

*Sources:* Calmès et al. III, Corollary 1.2.12 and Remark 1.2.13, p. 18: Proves that quadratic L-theory maps isomorphically to the L-theory of an m-quadratic structure for n ≤ 2m − 3 and surjectively for n = 2m − 2, and shows the range cannot be improved using L^q\_{−2}(ℤ) = ℤ/2 and L^gs\_{−2}(ℤ) = 0.

### 4.5 Degree-zero L-groups are classical Witt groups

`HK.4/witt-group-computes-L0` · theorem · planet: Degree-zero L-groups are Witt groups

If Q is 0-quadratic, W(Proj(R);Q) → L₀(R;Q) is an isomorphism. Consequently (i) L^gs\_0(R;M) is the Witt group of M-valued symmetric forms over R, (ii) L^ge\_0(R;M) the Witt group of M-valued even forms, and (iii) L₀(R;Q^{≥m}\_M) the Witt group of M-valued quadratic forms for every m ≥ 2. Combined with L^gs\_{−2k}(R;M((−1)^k)) ≅ L₀(R;Q^{≥k}\_M) (HK.1/bordism-invariant-periodicity), every even non-positive genuine symmetric L-group is a Witt group of symmetric (k = 0), even (k = 1) or quadratic (k ≥ 2) forms; the odd groups in degrees ≤ 1 have analogous descriptions by symmetric, even and quadratic formations, which the source leaves to the reader.

**Hypotheses.**

- Q 0-quadratic (every Q^{≥m}\_M with m ≥ 0).

**Proof route.**

- W(Proj(R);Q) ≅ L^{0,0}\_0(R;Q) (HK.3/strictly-metabolic-witt), L^{0,0}\_0 ≅ L^{0,1}\_0 (HK.3/widen-lagrangian-bound) and L^{0,1}\_0 ≅ L₀ (HK.4/quadratic-surgery with m = 0, (a,b) = (0,1)).
- On P[0] the values of Q^{≥2}, Q^{≥1}, Q^{≥0} are the groups of quadratic, even and symmetric forms (GN §6.8a; Calmès et al. I, Proposition 4.2.22): this gives (i)–(iii) for m = 0, 1, 2.
- For m > 2, L^q\_0 → L₀(Q^{≥m}) is an isomorphism by HK.4/quadratic-low-degree-comparison (0 ≤ 2m − 3), reducing to m = 2.
- Shift with HK.1/bordism-invariant-periodicity for the negative even degrees.

**Checks.**

- L^gs\_0(𝔽₂) = W(𝔽₂) = ℤ/2 generated by ⟨1⟩; L^ge\_0(𝔽₂) = 0 because even forms in characteristic 2 are alternating and hence metabolic.
- L^gs\_0(ℤ) = ℤ by signature and L₀(ℤ;Q^gq) = ℤ by signature/8 (E₈).

*Needs:* `HK.3/strictly-metabolic-witt`; `HK.3/widen-lagrangian-bound`; `HK.4/quadratic-surgery`; `HK.4/quadratic-low-degree-comparison`; `HK.1/bordism-invariant-periodicity`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

*Sources:* Calmès et al. III, Proposition 1.2.15, Corollary 1.2.16, p. 19, and Remark 1.2.17, p. 20: Proves W(Proj(R);Q) ≅ L₀(R;Q) for 0-quadratic Q, identifies the degree-zero genuine L-groups with Witt groups of symmetric, even and quadratic forms, and describes the even non-positive genuine symmetric L-groups through periodicity, leaving the odd formation description to the reader.; Calmès et al. I, Proposition 4.2.22, p. 73: Identifies Q^{≥2}, Q^{≥1}, Q^{≥0} with the non-abelian derived functors of quadratic, even and symmetric forms on projectives.

### 4.6 Free and K₀-controlled variants

`HK.4/controlled-variants` · theorem

Let 𝒞 be a full subcategory with D^f(R) ⊆ 𝒞 ⊆ D^p(R) closed under the duality, for instance the objects whose class in K₀(R) lies in a given involution-closed subgroup. If M is free (needed for 𝒞 = D^f(R)), the results of HK.4/quadratic-surgery, HK.4/genuine-symmetric-representatives and HK.4/witt-group-computes-L0 hold for (𝒞,Q\|\_𝒞), with projective modules replaced by stably free (respectively stably-𝒞) ones. For example, for 0-quadratic Q every element of L\_n(D^f(R),Q), n ≥ 0, is represented by a Poincaré form on a complex of stably free modules in degrees [−n,0], vanishing iff it has a Lagrangian of stably free modules in degrees [−n−1,0], and L₀(D^f(R),Q) is the Witt group of stably free Poincaré objects.

**Hypotheses.**

- 𝒞 closed under duality, containing D^f(R); M free when free complexes are used.

**Proof route.**

- In the proof of quadratic surgery choose P free; the surgery then stays in D^f(R) (or in 𝒞).
- The connectivity bounds translate into stably free representability by the refinement in HK.2/width-criterion.
- Run the proof of HK.4/witt-group-computes-L0 verbatim with stably free modules.

**Checks.**

- 𝒞 = D^p(R) recovers the uncontrolled statements.
- For R a principal ideal domain, stably free = free and D^f(R) = D^p(R).

*Needs:* `HK.4/quadratic-surgery`; `HK.4/witt-group-computes-L0`; `HK.2/width-criterion`.

*Sources:* Calmès et al. III, Remark 1.2.18, p. 20: Explains that the surgery results apply to finite free complexes when M is free, with stably free representatives, and to any intermediate duality-closed subcategory such as a K₀-controlled one.

### 4.7 Ranicki's short symmetric L-groups

`HK.4/ranicki-short-complexes` · definition · planet: Ranicki's short L-groups

Let Ch^b(Proj(R)) be bounded chain complexes of finitely generated projective left R-modules, C n-dimensional if C\_i = 0 for i ∉ [0,n], and DC the dual complex Hom\_R(C,M) with (DC)\_i = D(C\_{−i}). For n ≥ 0, an n-dimensional (symmetric) Poincaré complex is (C,q) with C n-dimensional and q ∈ H\_n(Hom\_R(DC,C)^{hC₂}) (homotopy fixed points computed with the standard free resolution of ℤ over ℤ[C₂]) whose image in H\_n(Hom\_R(DC,C)) = [DC[n],C] is an isomorphism in the homotopy category. An (n+1)-dimensional Poincaré pair is (f : C → C′, η) with C n-dimensional, C′ (n+1)-dimensional and η ∈ H\_n(fib[Hom\_R(DC,C) → Hom\_R(DC′,C′)]^{hC₂}) whose images in [DC[n],C] and [cof(DC′ → DC)[n],C′] are isomorphisms. A Poincaré complex arising as the boundary of a pair is null-cobordant; (C,q), (C′,q′) are cobordant if (C ⊕ C′, q ⊕ −q′) is null-cobordant. The cobordism classes form an abelian group L^short\_n(R;M) under ⊕ with −(C,q) = (C,−q); quasi-isomorphic complexes are cobordant, and L^short\_n is the cokernel of M^short\_n(R) → Pn^short\_n(R) in commutative monoids. For negative n, Ranicki puts L^short\_n(R;M) := L^{short,ev}\_{n+2}(R;−M) for n = −2, −1 and L^short\_n(R;M) := L^q\_n(R;M) for n ≤ −3, where L^{short,ev}\_n is the cobordism group of even complexes: those whose Wu class v₀(q) : H^n(C) → Ĥ^0(C₂;M) vanishes, with even pairs defined by the vanishing of the relative Wu class on H^{n+1}(f).

**Hypotheses.**

- M any invertible ℤ-module with involution (Ranicki states the definition for M = R(ε); only the induced duality on complexes is used).
- Here H^n(C) = H\_{−n}(DC) is the cohomology of C.

**Construction.**

- Ranicki's definitions (Ranicki 1980, §1 and §3) use only the duality C ↦ DC on complexes and the C₂-action on Hom\_R(DC,C), so they extend from R(ε) to any invertible M.
- A quasi-isomorphism f : C → C′ with f\_\*q = q′ gives a Poincaré pair with boundary C ⊕ C′, written (id,f) : C → C ⊕ C′ in the Lagrangian convention of Remark 1.2.21, witnessing the cobordism; so quasi-isomorphism is finer than cobordism and the monoid presentation follows.

**API.**

- `RanickiPoincareComplex R M n` (structure): An n-dimensional complex of finitely generated projectives with a class q ∈ H\_n(Hom\_R(DC,C)^{hC₂}) whose underlying map DC[n] → C is a homotopy equivalence.
- `RanickiPoincarePair` (structure): An (n+1)-dimensional pair (f, η) with both duality maps homotopy equivalences.
- `RanickiPoincarePair.boundary` (projection): The boundary Poincaré complex (C, η\|\_C).
- `shortL R M n` (constructor): L^short\_n(R;M), cobordism classes; for n < 0 Ranicki's even/quadratic extension.
- `shortL.neg` (simp): −[C,q] = [C,−q].
- `shortL.ofQuasiIso` (relation): Quasi-isomorphic Poincaré complexes are cobordant.
- `shortEvenL R M n` (constructor): Cobordism group of even complexes (Wu class v₀ = 0).
- `wuClassZero` (other): The Wu class v₀(q) : H^n(C) → Ĥ^0(C₂;M).

**Unit tests.**

- `zero_dimensional` (computation): For n = 0, a Poincaré complex is a projective module with a nondegenerate M-valued symmetric form, and L^short\_0(R;M) is the symmetric Witt group; over ℤ with M = ℤ it is ℤ by signature.
- `short_negative_three` (degenerate): For n ≤ −3, L^short\_n(R;M) is by definition L^q\_n(R;M), so L^short\_{−3}(ℤ) = L^q\_{−3}(ℤ) = L^q\_1(ℤ) = 0.
- `even_F2` (computation): Over 𝔽₂ the even L-group L^{short,ev}\_0(𝔽₂) = 0: an even form in characteristic 2 is alternating, hence has a Lagrangian; so L^short\_{−2}(𝔽₂) = 0 while L^s\_{−2}(𝔽₂) = ℤ/2.
- `not_poincare` (non-example): On C = ℤ[0] the symmetric structure q = 2 ∈ H\_0(Hom\_ℤ(Dℤ,ℤ)^{hC₂}) has underlying map 2 : ℤ → ℤ, not an isomorphism, so (ℤ[0],2) is a symmetric complex but not a Poincaré complex.

**Checks.**

- L^short\_0(R;M) is the Witt group of M-valued symmetric forms on projectives (compare HK.4/witt-group-computes-L0).
- These complexes are not SymplecticReidemeisterTorsionModSquares RT.0's strict symmetric pairings C ⊗ C → R[−n]: Ranicki's structure is a class in homotopy fixed points of Hom\_R(DC,C).

**Uses.** Calmès et al. III, Theorem 1.2.22, p. 21: identified with genuine symmetric L-groups; Calmès et al. III, Theorem 1 and Theorem 5, pp. 2 and 4: L^short(R;M) := τ\_{≥0}L^gs(R;M) appears in the fibre sequence for classical GW; Calmès et al. III, Remark 1.3.13, p. 31: the comparison range improves Ranicki's Proposition 4.5 for L^short.

*Needs:* `mathlib:ChainComplex`; `mathlib:HomologicalComplex.homology`; `mathlib:Module.Projective`; `HK.0/module-with-involution-operations`; `RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`.

*Sources:* Calmès et al. III, Definition 1.2.19, p. 20, and Remarks 1.2.20–1.2.21, pp. 20–21: Recalls Ranicki's n-dimensional Poincaré complexes and pairs, cobordism and the short symmetric L-groups, their extension to arbitrary invertible M, Ranicki's ad hoc negative groups through even and quadratic L-groups with the Wu class, and the monoid presentation via quasi-isomorphism classes.; Ranicki 1980, §1 (algebraic Poincaré complexes, Wu classes, even complexes) and §3 (Poincaré pairs, cobordism, the symmetric and even symmetric L-groups): Defines n-dimensional ε-symmetric Poincaré complexes over a ring with involution and their Wu classes, with even complexes those whose zeroth Wu class vanishes, and in the cobordism section Poincaré pairs, relative Wu classes and the symmetric and even symmetric L-groups.

### 4.8 Ranicki's groups are bounded L-groups of the symmetric structure

`HK.4/short-to-bounded` · theorem

Let I\_n ⊆ Ch^b(Proj(R)) be the n-dimensional complexes with quasi-isomorphisms and J\_{[0,n]} ⊆ D^p(R)^≃ the perfect modules representable in degrees [0,n]. Localisation restricts to π : I\_n → J\_{[0,n]}, an equivalence on homotopy categories, and there are natural isomorphisms H\_n(Hom\_R(DC,C)^{hC₂}) ≅ π\_n(Hom\_R(DπC,πC)^{hC₂}) ≅ π₀Ω^nQ^s\_M(πDC). Sending (C,q) to the component of (πDC, ρ(q)) is a monoid isomorphism Pn^short\_n(R) ≅ π₀Pn^n\_n(R;Q^s\_M), compatible with pairs, and induces L^short\_n(R;M) ≅ L^{n,n+1}\_n(R;Q^s\_M) for n ≥ 0.

**Hypotheses.**

- n ≥ 0.

**Proof route.**

- The localisation Ch^b(Proj(R)) → D^p(R) identifies homotopy classes of maps and preserves sums; complexes in [0,n] go to objects representable in [0,n] (HK.2/width-criterion), and DπC is then concentrated in [−n,0], matching the bounds of Pn^n\_n.
- The Hom complex computes the mapping spectrum (GN §6.8a `perfectDerivedHom`) and the explicit resolution computes homotopy fixed points, giving ρ.
- Applying the same construction to arrow categories gives M^short\_n(R) → π₀M^{n,n+1}\_n(R;Q^s\_M) compatibly; every arrow of D^p(R) lifts to a chain map, which gives surjectivity, hence an isomorphism of quotients.

**Checks.**

- n = 0: both sides are Witt groups of symmetric forms on projectives (HK.3/strictly-metabolic-witt).

*Needs:* `HK.4/ranicki-short-complexes`; `HK.3/bounded-l-monoids`; `HK.2/width-criterion`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `mathlib:DerivedCategory`.

*Sources:* Calmès et al. III, Construction before Proposition 1.2.23, p. 21, and Proposition 1.2.23, p. 21: Compares n-dimensional Poincaré complexes with width-bounded Poincaré objects of the symmetric structure through the localisation functor and the isomorphism on homotopy fixed points, and proves L^short\_n ≅ L^{n,n+1}\_n(R;Q^s\_M) using lifts of arrows to chain maps.

### 4.9 Symmetric and r-symmetric forms agree in bounded width

`HK.4/genuine-symmetric-bounded-agreement` · theorem

Let Q be r-symmetric and a, b, n as in HK.3/bounded-l-monoids with a ≤ n + 2r − 4 and b ≤ n + 2r − 3. Then L^{a,b}\_n(R;Q) → L^{a,b}\_n(R;Q^s\_M) is an isomorphism. In particular, Q^gs\_M being 2-symmetric, L^{n,n+1}\_n(R;Q^gs\_M) ≅ L^{n,n+1}\_n(R;Q^s\_M) for every n ≥ 0.

**Hypotheses.**

- Q M-compatible and r-symmetric.

**Proof route.**

- It suffices that π₀Pn^a\_n(R;Q) → π₀Pn^a\_n(R;Q^s\_M) and π₀M^{a,b}\_n(R;Q) → π₀M^{a,b}\_n(R;Q^s\_M) are bijections.
- For ((−n−a)/2)-connective X the fibre of Q(X) → Q^s\_M(X) is (−r + (n+a)/2)-truncated (HK.2/r-symmetric-m-quadratic), and −r + (n+a)/2 ≤ n − 2 because a ≤ n + 2r − 4; a map whose fibre is (n−2)-truncated induces an equivalence on Ω^{∞+n}.
- For pairs, the map Q^met(L → X) → Q^{s,met}(L → X) must have (n−2)-truncated fibre; the top map of the square (on X) is (n−2)-truncated as above and the bottom map (on L, which is ⌈(−n−1−b)/2⌉-connective) is (n−1)-truncated by b ≤ n + 2r − 3, so the total fibre is (n−2)-truncated.

**Checks.**

- (r,a,b) = (2,n,n+1): a = n ≤ n, b = n+1 ≤ n+1.

*Needs:* `HK.3/bounded-l-monoids`; `HK.2/r-symmetric-m-quadratic`; `HK.2/genuine-family-bounds`.

*Sources:* Calmès et al. III, Lemma 1.2.24, p. 22: Proves that for an r-symmetric structure the bounded L-monoids agree with those of the symmetric structure when a ≤ n + 2r − 4 and b ≤ n + 2r − 3, by truncatedness estimates on forms and on metabolic forms, and specialises to the genuine symmetric structure.

### 4.10 Ranicki's even L-groups are genuine even L-groups

`HK.4/short-even-comparison` · theorem

For n ≥ 0, sending an n-dimensional even Poincaré complex (C,φ) to (DC, ρ(φ)) induces isomorphisms L^{short,ev}\_n(R;M) ≅ L^{n,n+1}\_n(R;Q^ge\_M) ≅ L^ge\_n(R;M). The refinement of a genuine symmetric to a genuine even structure is controlled by the fibre sequence Ω^nQ^ge(X) → Ω^nQ^gs(X) → Hom\_R(X, Ĥ^0(C₂;M)[−n]), whose last term has Ω^∞ ≃ Hom\_R(H\_{−n}(X), Ĥ^0(C₂;M)); the image of the symmetric structure there is Ranicki's Wu class v₀(φ).

**Hypotheses.**

- n ≥ 0; M invertible.

**Proof route.**

- By HK.4/short-to-bounded and HK.4/genuine-symmetric-bounded-agreement, (C,φ) gives a class in L^{n,n+1}\_n(R;Q^gs\_M) represented by X = DC.
- By the defining pullbacks (GN §6.8a) the cofibre of Q^ge\_M → Q^gs\_M at X is Hom\_R(X, cofib(τ\_{≥1}HM^{tC₂} → τ\_{≥0}HM^{tC₂})) = Hom\_R(X, HĤ^0(C₂;M)); after Ω^n this is the displayed fibre sequence. Tracing the definitions, the image of the symmetric structure is Ranicki's Wu class v₀(φ), which vanishes for even complexes, so the class refines canonically to Q^ge\_M; the same holds for even pairs, and reversing the argument gives the inverse map.
- L^{n,n+1}\_n(R;Q^ge\_M) ≅ L^ge\_n(R;M) by HK.4/quadratic-surgery since Q^ge\_M is 1-quadratic (a = n ≥ n − 2, b = n + 1 ≥ n − 1).

**Checks.**

- n = 0: L^{short,ev}\_0 is the Witt group of even forms, matching HK.4/witt-group-computes-L0 (ii).

*Needs:* `HK.4/ranicki-short-complexes`; `HK.4/short-to-bounded`; `HK.4/genuine-symmetric-bounded-agreement`; `HK.4/quadratic-surgery`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Proof of Theorem 1.2.22, p. 22: Constructs the map from Ranicki's short even L-groups to L^{n,n+1}\_n(R;Q^ge\_M) using the fibre sequence from Q^ge to Q^gs with cofibre Hom\_R(X, Ĥ^0(C₂;M)[−n]) and the vanishing of the Wu class, shows it is an isomorphism, and compares with L^ge\_n by surgery.

### 4.11 Theorem 5: Ranicki's symmetric L-groups are the genuine symmetric L-groups

`HK.4/ranicki-genuine-symmetric` · theorem · planet: Theorem 5 (Ranicki's L-groups)

For every ring R, invertible ℤ-module with involution M over R and every n ∈ ℤ there is a natural isomorphism L^short\_n(R;M) ≅ L^gs\_n(R;M). In particular L^short(R;M) := τ\_{≥0}L^gs(R;M) is a connective spectrum whose homotopy groups are Ranicki's original symmetric L-groups, and Ranicki's negative groups are L^gs\_n(R;M) = L^ev\_{n+2}(R;−M) for n = −2, −1 and L^q\_n(R;M) for n ≤ −3.

**Hypotheses.**

- No hypothesis on R or on 2.

**Proof route.**

- n ≥ 0: compose L^short\_n ≅ L^{n,n+1}\_n(R;Q^s\_M) (HK.4/short-to-bounded) ≅ L^{n,n+1}\_n(R;Q^gs\_M) (HK.4/genuine-symmetric-bounded-agreement) ≅ L^gs\_n(R;M) (HK.4/genuine-symmetric-representatives).
- n ≤ −3: L^q\_n ≅ L^gs\_n by HK.4/quadratic-low-degree-comparison with m = 0, matching Ranicki's definition.
- n = −2, −1: L^gs\_n(R;M) ≅ L^ge\_{n+2}(R;−M) by HK.1/bordism-invariant-periodicity, and L^ge\_{n+2}(R;−M) ≅ L^{short,ev}\_{n+2}(R;−M) by HK.4/short-even-comparison.

**Checks.**

- L^gs\_n(ℤ) for n = 0, 1 is ℤ (signature) and ℤ/2 (de Rham invariant), as in GN §6.10a.
- L^gs\_{−2}(𝔽₂) = L^ge\_0(𝔽₂) = 0.

*Needs:* `HK.4/short-to-bounded`; `HK.4/genuine-symmetric-bounded-agreement`; `HK.4/genuine-symmetric-representatives`; `HK.4/quadratic-low-degree-comparison`; `HK.4/short-even-comparison`; `HK.1/bordism-invariant-periodicity`.

*Sources:* Calmès et al. III, Theorem 1.2.22, p. 21, with proof p. 22; Theorem 5 and its addendum, p. 4: Proves L^short\_n(R;M) ≅ L^gs\_n(R;M) for all n, combining the comparison with bounded L-groups, the agreement of symmetric and genuine symmetric forms in bounded width and genuine symmetric surgery for n ≥ 0, quadratic comparison for n ≤ −3 and periodicity with the even comparison for n = −2, −1.

### 4.12 Ranicki's quadratic L-groups and a warning

`HK.4/ranicki-quadratic-wall` · comparison

For n ≥ 0, Ranicki's n-th quadratic L-group (quadratic Poincaré complexes of dimension n) coincides with L^{n,n+1}\_n(R;Q^q\_M) and hence with L^q\_n(R;M); these are Wall's quadratic L-groups, the recipients of surgery obstructions. They are not L^gq\_n(R;M): by periodicity L^gq\_n(R;M) ≅ L^gs\_{n−4}(R;M).

**Hypotheses.**

- n ≥ 0.

**Proof route.**

- Run HK.4/short-to-bounded with homotopy orbits in place of fixed points to get Ranicki's quadratic group ≅ L^{n,n+1}\_n(R;Q^q\_M), then HK.4/quadratic-surgery (Q^q\_M is m-quadratic for all m).
- Σ⁴L^gs ≃ L^gq by HK.1/bordism-invariant-periodicity.

**Checks.**

- Over ℤ, L^q\_2(ℤ) = ℤ/2 (Arf invariant) whereas L^gq\_2(ℤ) ≅ L^gs\_{−2}(ℤ) = 0, so Ranicki's (Wall's) quadratic L-groups are not the genuine quadratic ones.

*Needs:* `HK.4/short-to-bounded`; `HK.4/quadratic-surgery`; `HK.1/bordism-invariant-periodicity`.

*Sources:* Calmès et al. III, Remark 1.2.25, p. 23: Identifies Ranicki's quadratic L-groups with L^q\_n via the same argument, notes they are Wall's groups, and warns they differ from L^gq\_n, which is a four-fold shift of L^gs.

### Dependencies

Requires: HK.3, HK.2, HK.1, HK.0, GeometryOfNumbersAndQuadraticArithmetic:GN.6, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal.

## Layer HK.5: Surgery over connective ring spectra

The setting of compact modules Mod^ω\_A over a connective E₁-ring A with an invertible module with involution M projective in either structure, the Poincaré structures Q^q\_M, Q^s\_M, Q^gs\_M, the Tate structure Q^t\_B of a connective E∞-ring B and the universal structure Q^u on Mod^ω\_𝕊, with the Poincaré functors to π₀; the finite presentation of π₀ of a compact connective module and the recognition of (shifted) projectives and of two-term objects by connectivity of X and DX; quadratic surgery over A; lifting of projectives along π₀-isomorphisms; the comparison of L-groups along a 1-connective map, an isomorphism for n ≤ min(2p−1, 2m) and onto for n = min(2p, 2m+1) when the maps on bilinear and linear parts are 1- and p-connective; its consequences: L^q(A;M) ≃ L^q(π₀A;π₀M), the Tate and genuine symmetric comparisons with π₀ and their optimality, and the low-degree comparisons of the sphere with the integers.

Targets: §5.1 Poincaré structures on compact modules over a connective ring spectrum; §5.2 Compact connective modules and recognition of projectives; §5.3 Quadratic surgery over connective ring spectra; §5.4 Lifting projectives along a π₀-isomorphism; §5.5 Comparison of L-groups along a 1-connective map; §5.6 Quadratic comparison over a ring spectrum and the sphere; §5.7 Comparison of the L-theory of a ring spectrum with that of its π₀; §5.8 L-theory of the sphere compared with the integers.

Planets: Surgery over ring spectra, Comparison along 1-connective maps, Comparison with π₀.

### 5.1 Poincaré structures on compact modules over a connective ring spectrum

`HK.5/ring-spectrum-setting` · construction

Let A be a connective E₁-ring (a connective associative algebra in spectra, ⊗ over 𝕊) and Mod^ω\_A its stable ∞-category of compact left modules; Proj(A) ⊆ Mod^ω\_A are the retracts of A^n. Let M be an invertible module with involution over A (Calmès et al. I, Definition 3.1.1) that is projective in either A-module structure, so the duality D = hom\_A(−,M) preserves Proj(A). The quadratic and symmetric structures are Q^q\_M(X) = hom\_{A⊗A}(X⊗X,M)\_{hC₂} and Q^s\_M(X) = hom\_{A⊗A}(X⊗X,M)^{hC₂}; the genuine symmetric structure Q^gs\_M is the pullback of Q^s\_M(X) → hom\_A(X,M^{tC₂}) along hom\_A(X,τ\_{≥0}M^{tC₂}); for a connective E∞-ring B the Tate structure Q^t\_B is the pullback of Q^s\_B(Y) → hom\_B(Y,B^{tC₂}) along the Tate-valued Frobenius hom\_B(Y,B) → hom\_B(Y,B^{tC₂}); and on Mod^ω\_𝕊 the universal structure Q^u has linear part hom(−,𝕊) and agrees with Q^t\_𝕊. An A-module is k-connective if its underlying spectrum is; Q is m-quadratic if the cofibre of Q^q\_M → Q is m-connective on A, equivalently on Proj(A); Λ\_Q denotes the linear part. Pn^a\_n, M^{a,b}\_n and L^{a,b}\_n(A;Q) are defined verbatim from HK.3/bounded-l-monoids. The maps A → π₀A and M → π₀M induce Poincaré functors (Mod^ω\_A, Q^α\_M) → (Mod^ω\_{π₀A}, Q^α\_{π₀M}) for α = q, gs, and B → π₀B induces one for Q^t.

**Hypotheses.**

- A connective E₁-ring; M projective in both module structures; B connective E∞ for Q^t.

**Construction.**

- Mod^ω\_A and its tensor products are EnhancedDerivedSheaves E5:abstract/module-objects and E5:presentability/compact-objects; compact A-modules form a small stable idempotent-complete category (GeneralAlgebraicKTheoryPartII KII.0/ring-k-theory).
- The formulas define Poincaré structures with duality hom\_A(−,M) by Calmès et al. I, §3 (Lemma 3.2.5, Construction 3.2.6, Examples 3.2.8 and 3.2.12); the pullback along a connective cover of the Tate term is the genuine construction of GN §6.8a over a ring spectrum.
- The universal structure is Calmès et al. I, Example 1.2.15; its linear part is hom(−,𝕊), and the Frobenius 𝕊 → 𝕊^{tC₂} identifies it with Q^t\_𝕊.
- Base change along A → π₀A preserves compact modules and the forms, giving the Poincaré functors.

**API.**

- `ConnRingPoincare A M` (structure): A connective E₁-ring, a projective invertible module with involution and a Poincaré structure on Mod^ω\_A with duality hom\_A(−,M).
- `ConnRingPoincare.quadratic` (constructor): Q^q\_M on Mod^ω\_A.
- `ConnRingPoincare.genuineSymmetric` (constructor): Q^gs\_M by pullback along τ\_{≥0}M^{tC₂} → M^{tC₂}.
- `ConnRingPoincare.tate` (constructor): Q^t\_B for a connective E∞-ring B, via the Tate-valued Frobenius.
- `ConnRingPoincare.universal` (constructor): Q^u on Mod^ω\_𝕊, equal to Q^t\_𝕊.
- `ConnRingPoincare.toPi0` (functoriality): The Poincaré functors to (Mod^ω\_{π₀A}, Q^α\_{π₀M}).
- `ConnRingPoincare.linearPart` (projection): Λ\_Q(A) = cofib(Q^q\_M(A) → Q(A)).

**Unit tests.**

- `discrete_recovers_Dp` (comparison): For A = HR with R discrete, Mod^ω\_A ≃ D^p(R) and Q^gs\_M is GN's genuine symmetric structure.
- `tate_linear_part` (computation): The linear part of Q^t\_B on B is B itself, mapping to B^{tC₂} by the Frobenius; for B = Hℤ, π₀ of the Frobenius ℤ → ℤ^{tC₂} is the surjection ℤ → ℤ/2.
- `universal_zero_quadratic` (computation): Q^u is 0-quadratic because its linear part hom(−,𝕊) is connective on 𝕊.
- `compact_not_projective` (non-example): Compact is weaker than projective: over A = 𝕊 the cofibre 𝕊/2 of 2 : 𝕊 → 𝕊 is compact and connective, but π₀(𝕊/2) = ℤ/2 is not a projective ℤ-module, so 𝕊/2 ∉ Proj(𝕊).

**Checks.**

- For A = Hℤ discrete, Mod^ω\_A ≃ D^p(ℤ) and the structures are those of GN §6.8a.
- Λ\_{Q^q\_M} = 0.

**Uses.** Calmès et al. III, Proposition 1.2.26, p. 23: quadratic surgery over A; Calmès et al. III, Proposition 1.2.29, p. 24: comparison along 1-connective maps uses linear parts; Calmès et al. III, Corollary 1.2.33 and Examples 1.2.31, 1.2.35: Q^q, Q^gs, Q^t, Q^u are compared with their π₀ versions.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `EnhancedDerivedSheaves:E5:abstract/module-objects`; `EnhancedDerivedSheaves:E5:presentability/compact-objects`; `GeneralAlgebraicKTheoryPartII:KII.0/ring-k-theory`; `RefinedTraceMethods:RT.2/norm-map-tate`; `RefinedTraceMethods:RT.2/tate-diagonal`; `HK.2/r-symmetric-m-quadratic`; `HK.3/bounded-l-monoids`.

*Sources:* Calmès et al. III, §1.2, 'Surgery for connective ring spectra', p. 23, and the paragraph before Corollary 1.2.33, p. 26: Sets up compact modules over a connective ring spectrum with a projective invertible module with involution, defines m-quadraticity and the bounded L-monoids there, and displays the pullbacks defining the genuine symmetric and Tate Poincaré structures and the Poincaré functors to π₀.; Calmès et al. I, Definition 3.1.1, p. 47; Example 1.2.15, p. 21; Example 3.2.12, p. 53: Defines modules with involution over E₁-algebras, the universal Poincaré structure on finite spectra and the Tate Poincaré structure of an E∞-ring with C₂-action.

### 5.2 Compact connective modules and recognition of projectives

`HK.5/compact-connective-pi0` · theorem

Let A be a connective E₁-ring. If X ∈ Mod^ω\_A is connective then π₀X is finitely presented over π₀A, so there is A^n → X with 1-connective cofibre. If X is projective so is DX and both are connective; conversely if X and DX are connective then X is projective, and more generally X is the k-fold suspension of a projective iff X is k-connective and DX is (−k)-connective. If X is connective and DX is (−1)-connective, X is the cofibre of a map P → Q of projectives; more generally X is k-connective with DX (−k−1)-connective iff X is the k-fold suspension of such a cofibre.

**Hypotheses.**

- A connective; M projective in both structures.

**Proof route.**

- π₀A ⊗\_A X is connective and perfect over the discrete ring π₀A with the same π₀; over a discrete ring connective perfect modules are finite complexes of projectives in non-negative degrees (HK.2/width-criterion), so π₀ is finitely presented.
- Given A^n → X → Y with Y 1-connective, invertibility of M gives hom\_A(X,Y) ≃ hom\_A(M,Y) ⊗\_A DX, which is 1-connective when DX is connective; so X → Y is null and A^n → X splits up to homotopy.
- For the two-term case, P := ΩY is connective with D\_MP the cofibre of D\_MX → M^n, hence connective, so P is projective by the first case and X = cofib(P → A^n).

**Checks.**

- For A discrete these reduce to HK.2/width-criterion with intervals [k,k] and [k,k+1].

*Needs:* `HK.5/ring-spectrum-setting`; `HK.2/width-criterion`.

*Sources:* Calmès et al. III, Lemma 1.2.27, p. 23, and Remark 1.2.28, pp. 23–24: Proves π₀ of a compact connective module is finitely presented and characterises projectives and two-term objects by connectivity of X and its dual, using invertibility of M.; Calmès et al. III, Remark 1.2.28, p. 23: The printed text says 'Remark 1.1.6' for Lemma 1.1.6 (sourceIssues E3).

### 5.3 Quadratic surgery over connective ring spectra

`HK.5/ring-spectrum-surgery` · theorem · planet: Surgery over ring spectra

Let Q be an m-quadratic Poincaré structure on Mod^ω\_A, n ∈ ℤ, and a, b ≥ 0 with b ≥ a − 1 and n + a, n + 1 + b even. (i) If a ≥ n − 2m, every Poincaré object of (Mod^ω\_A, Q[−n]) is cobordant to a ((−n−a)/2)-connective one. (ii) If b ≥ n − 2m + 1, every Lagrangian L → X of such an object is cobordant relative to X to one with L′ and fib(L′ → X) both ((−n−1−b)/2)-connective. If both hold, L^{a,b}\_n(A;Q) is a group and L^{a,b}\_n(A;Q) → L\_n(A;Q) is an isomorphism.

**Hypotheses.**

- Setting of HK.5/ring-spectrum-setting; P[k] means Σ^kP.

**Proof route.**

- Lemma HK.2/shifted-projective-connectivity holds verbatim for Σ^kP with P ∈ Proj(A).
- The only use of discreteness in HK.4/quadratic-surgery is the existence of P[k] → X with (k+1)-connective cofibre for k-connective X; this is HK.5/compact-connective-pi0.
- The rest of the proof of HK.4/quadratic-surgery runs verbatim.

**Checks.**

- For A = HR this is HK.4/quadratic-surgery.

*Needs:* `HK.5/ring-spectrum-setting`; `HK.5/compact-connective-pi0`; `HK.4/quadratic-surgery`.

*Sources:* Calmès et al. III, Proposition 1.2.26 and its proof, p. 23: States quadratic surgery for m-quadratic structures on compact modules over a connective ring spectrum and proves it as in the discrete case, replacing Lemma 1.1.6 by Lemma 1.2.27.

### 5.4 Lifting projectives along a π₀-isomorphism

`HK.5/lifting-projectives` · theorem

Let f : A → B be a map of connective E₁-rings inducing an isomorphism π₀A → π₀B (for instance a 1-connective map). Then extension of scalars B ⊗\_A − : Proj(A) → Proj(B) induces an equivalence of homotopy categories. Hence projective B-modules and maps between them lift, uniquely up to homotopy, to projective A-modules, and perfect B-modules presented as (co)fibres of maps of projectives lift to perfect A-modules of the same kind.

**Hypotheses.**

- A, B connective E₁-rings; π₀f an isomorphism.

**Proof route.**

- Full faithfulness: for P free, Ext⁰\_A(P,Q) is a product of copies of π₀Q and Ext⁰\_B is a product of copies of π₀(B ⊗\_A Q) ≅ Tor^{π₀A}\_0(π₀B, π₀Q) ≅ π₀Q.
- Essential surjectivity: a projective B-module is a retract of B^n; lift the idempotent on π₀ and realise it on A^n (Lurie, HA, Corollary 7.2.2.19 and the preceding Proposition 7.2.2.18).
- Lifting (co)fibres of maps of projectives follows by lifting the map.

**Checks.**

- For A = 𝕊, B = Hℤ: π₀ is ℤ in both; free 𝕊-modules 𝕊^n lift ℤ^n and maps ℤ^n → ℤ^m (integer matrices) lift to 𝕊^n → 𝕊^m.

*Needs:* `EnhancedDerivedSheaves:E5:abstract/module-objects`; `EnhancedDerivedSheaves:E5:abstract/algebra-objects`.

*Sources:* Lurie, Higher Algebra, Corollary 7.2.2.19, pp. 1245–1246: Proves that base change along a map of connective E₁-rings inducing an isomorphism on π₀ induces an equivalence of homotopy categories of projective modules.; Calmès et al. III, Remark 1.2.32, p. 25: Records this fact and its consequences for lifting projectives, maps and two-term perfect modules, for use in Proposition 1.2.29.

### 5.5 Comparison of L-groups along a 1-connective map

`HK.5/connective-comparison` · theorem · planet: Comparison along 1-connective maps

Fix m, p ∈ ℤ. Let f : A → B be a 1-connective map of connective ring spectra, M and N projective invertible modules with involution over A and B, and Q\_M, Q\_N Poincaré structures on Mod^ω\_A and Mod^ω\_B that are m-quadratic with respect to M and N. Suppose f\_! refines to a Poincaré functor (Mod^ω\_A,Q\_M) → (Mod^ω\_B,Q\_N) whose map on bilinear parts M = B\_{Q\_M}(A,A) → B\_{Q\_N}(B,B) = N is 1-connective and whose map on linear parts Λ\_{Q\_M}(A) → Λ\_{Q\_N}(B) is p-connective. Then L\_n(A;Q\_M) → L\_n(B;Q\_N) is an isomorphism for n ≤ min(2p−1, 2m) and surjective for n = min(2p, 2m+1).

**Hypotheses.**

- f 1-connective (cofibre 1-connective on underlying spectra).

**Proof route.**

- For X with DX r-connective, compare the cofibre sequences Q^q(X) → Q(X) → Λ\_Q(X) for M and N: the map on the quadratic terms is (2r+1)-connective (bilinear part 1-connective) and on linear terms (r+p)-connective; hence Q\_M(X) → Q\_N(f\_!X) is min(2r+1, r+p)-connective.
- Surjectivity for n ≤ min(2p, 2m+1): with a ∈ {0,1}, n + a even, classes on both sides are represented by ((−n−a)/2)-connective objects (HK.5/ring-spectrum-surgery); such B-objects are shifted projectives or two-term objects (HK.5/compact-connective-pi0) and lift to A (HK.5/lifting-projectives); for them DX is r = (n−a)/2 ≤ p connective and the form map is onto on π\_n.
- Injectivity for n ≤ min(2p−1, 2m): with b ∈ {0,1}, n + 1 + b even, a Lagrangian over B may be taken with L and its fibre ((−n−1−b)/2)-connective; write L = fib(U → V) with U, V projective shifts, factor L → f\_!X through f\_!Q, lift U → V and the map to Q, and check that Q\_M(L′) → Q\_N(f\_!L′) is injective on π\_n and onto on π\_{n+1}, which follows from the estimate with r′ = (n+1−b)/2.

**Checks.**

- f = id, Q\_M = Q^q\_M: recovers HK.4/quadratic-low-degree-comparison over A (p = m − 1 effectively, via Corollary 1.2.30).
- For Q^q structures (Λ = 0 on both sides, p = ∞) and m = ∞ the map is an isomorphism in all degrees.

*Needs:* `HK.5/ring-spectrum-surgery`; `HK.5/compact-connective-pi0`; `HK.5/lifting-projectives`; `HK.5/ring-spectrum-setting`.

*Sources:* Calmès et al. III, Proposition 1.2.29, p. 24, with proof pp. 25–26: States and proves that a Poincaré refinement of base change along a 1-connective map, with 1-connective bilinear and p-connective linear comparison, induces isomorphisms on L\_n for n ≤ min(2p−1,2m) and a surjection for n = min(2p,2m+1).

### 5.6 Quadratic comparison over a ring spectrum and the sphere

`HK.5/ring-spectrum-quadratic-comparison` · theorem

If Q\_M on Mod^ω\_A is m-quadratic with respect to a projective invertible M, then L^q\_n(A;M) → L\_n(A;Q\_M) is an isomorphism for n ≤ 2m − 3 and surjective for n = 2m − 2. For the sphere: Q^u on Mod^ω\_𝕊 is 0-quadratic, so L^q\_n(𝕊) → L^u\_n(𝕊) is an isomorphism for n ≤ −3; and since 𝕊^{tC₂} is the 2-completed sphere, which is connective by Lin's theorem, Q^s on Mod^ω\_𝕊 is also 0-quadratic and L^q\_n(𝕊) → L^s\_n(𝕊) is an isomorphism for n ≤ −3.

**Hypotheses.**

- Lin's theorem 𝕊^{tC₂} ≃ 𝕊^∧₂ is an imported input (gap: not planned in the atlas).

**Proof route.**

- Apply HK.5/connective-comparison to f = id and Q^q\_M → Q\_M: the bilinear map is the identity, and the map 0 = Λ\_{Q^q\_M}(A) → Λ\_{Q\_M}(A) has fibre ΩΛ\_{Q\_M}(A), which is (m−1)-connective because Q\_M is m-quadratic; with p = m − 1 the ranges are n ≤ min(2m−3, 2m) = 2m − 3 and n = min(2m−2, 2m+1) = 2m − 2.
- Λ\_{Q^u}(𝕊) = 𝕊 is connective; Λ\_{Q^s}(𝕊) = 𝕊^{tC₂} ≃ 𝕊^∧₂ is connective by Lin's theorem.

**Checks.**

- The same conclusions follow from Weiss–Williams' formula for the cofibre of L^q → L^u (cited in the source).

*Needs:* `HK.5/connective-comparison`; `HK.5/ring-spectrum-setting`; `RefinedTraceMethods:RT.2/tate-p-local-properties`.

*Sources:* Calmès et al. III, Corollary 1.2.30 and Example 1.2.31, pp. 24–25: Deduces the quadratic comparison over a ring spectrum from Proposition 1.2.29 and applies it to the universal and symmetric structures on finite spectra, the latter using Lin's theorem that the C₂-Tate construction of the sphere is its 2-completion.

### 5.7 Comparison of the L-theory of a ring spectrum with that of its π₀

`HK.5/pi0-comparison` · theorem · planet: Comparison with π₀

Let A be a connective ring spectrum, M a projective invertible module with involution over A and B a connective E∞-ring. (i) L^q(A;M) → L^q(π₀A;π₀M) is an equivalence. (ii) L^t\_n(B) → L^t\_n(π₀B) is an isomorphism for n ≤ 0 and surjective for n = 1. (iii) L^gs\_n(A;M) → L^gs\_n(π₀A;π₀M) is an isomorphism for n ≤ −3 and surjective for n = −2; if the C₂-action on the spectrum underlying M is trivial, it is an isomorphism for n ≤ −1 and surjective for n = 0. The range in (iii) cannot be improved in general: for 𝕊^{2−2σ} ⊗ ko over ko, (𝕊^{2−2σ}⊗ko)^{tC₂} → ℤ^{tC₂} is not onto on π₀, since π\_\*(ko^{tC₂}) = ℤ^∧₂[u^{±1}] with \|u\| = 4 gives Σ²ko^{tC₂} trivial π₀ while ℤ^{tC₂} has π₀ = ℤ/2; 𝕊^{2−2σ} over 𝕊 is another example.

**Hypotheses.**

- A → π₀A is 1-connective; M projective invertible.

**Proof route.**

- Apply HK.5/connective-comparison to A → π₀A: for Q^q the linear parts vanish (p = ∞, m = ∞), giving (i) in all degrees.
- For Q^t, B is 0-quadratic and the map on linear parts B → π₀B is 1-connective (p = 1): iso for n ≤ min(1, 0) = 0, onto for n = 1.
- For Q^gs, 0-quadratic, the map on linear parts τ\_{≥0}M^{tC₂} → τ\_{≥0}(π₀M)^{tC₂} is (−1)-connective (p = −1): iso for n ≤ −3, onto for n = −2. With trivial action, M is a retract of M^{hC₂}, so π₀M^{hC₂} → π₀(π₀M)^{hC₂} = π₀M is onto, hence π₀ of the Tate map is onto and the linear map is 0-connective (p = 0): iso for n ≤ −1, onto n = 0.
- For the counterexample use ko^{tC₂} from ChromaticHomotopyTheory CH.11 (real K-theory) and its Tate computation, recorded as an input.

**Checks.**

- (i) is the algebraic π–π theorem of Lurie's notes, recovered here.
- For A = 𝕊 and M = 𝕊 with trivial action, L^gs\_n(𝕊) → L^gs\_n(ℤ) is an isomorphism for n ≤ −1.

*Needs:* `HK.5/connective-comparison`; `HK.5/ring-spectrum-setting`; `ChromaticHomotopyTheory:CH.11/real-k-theory`.

*Sources:* Calmès et al. III, Corollary 1.2.33 and Remark 1.2.34, p. 26: Derives from Proposition 1.2.29 the comparisons of quadratic, Tate and genuine symmetric L-theory of a connective ring spectrum with those of π₀, improves the genuine symmetric range for trivial actions, and shows optimality with 𝕊^{2−2σ} ⊗ ko and 𝕊^{2−2σ}.

### 5.8 L-theory of the sphere compared with the integers

`HK.5/sphere-integers-comparison` · theorem

Q^u = Q^t on Mod^ω\_𝕊, so L^u\_n(𝕊) → L^t\_n(ℤ) is an isomorphism for n ≤ 0 and surjective for n = 1. For the canonical Poincaré functor (Mod^ω\_𝕊, Q^u) → (D^p(ℤ), Q^gs\_ℤ), both structures are 0-quadratic and the map on linear parts 𝕊 → τ\_{≥0}ℤ^{tC₂} is 0-connective, so L^u\_n(𝕊) → L^gs\_n(ℤ) is an isomorphism for n ≤ −1 and surjective for n = 0.

**Hypotheses.**

- Uses Q^u = Q^t on finite spectra.

**Proof route.**

- First claim: HK.5/pi0-comparison (ii) with B = 𝕊.
- Second: HK.5/connective-comparison with m = 0, p = 0: iso for n ≤ min(−1, 0) = −1, onto for n = min(0, 1) = 0.

**Checks.**

- L^gs\_n(ℤ) for n ≤ −3 is L^q\_n(ℤ) (HK.4/quadratic-low-degree-comparison), consistent with L^u\_n(𝕊) ≅ L^q\_n(𝕊) ≅ L^q\_n(ℤ) in that range.

*Needs:* `HK.5/pi0-comparison`; `HK.5/connective-comparison`.

*Sources:* Calmès et al. III, Example 1.2.35, p. 27: Compares universal L-theory of the sphere with Tate L-theory and with genuine symmetric L-theory of the integers in the stated ranges, using Proposition 1.2.29.

### Dependencies

Requires: HK.4, HK.3, HK.2, GeometryOfNumbersAndQuadraticArithmetic:GN.6, EnhancedDerivedSheaves:E5:abstract, EnhancedDerivedSheaves:E5:presentability, RefinedTraceMethods:RT.2.

## Layer HK.6: Coherent rings, t-structures and surgery for r-symmetric structures

Left-coherent rings of finite left global dimension d; the Postnikov t-structure on D^p(R) for such R and the bounds D(D^p(R)\_{≥0}) ⊆ D^p(R)\_{≤0}, D(D^p(R)\_{≤0}) ⊆ D^p(R)\_{≥−d}; r-symmetry and the bounded L-monoids for a stable ∞-category with a t-structure and a duality; symmetric surgery: for D(C\_{≤0}) ⊆ C\_{≥−d} and an r-symmetric Q, L^{a,b}\_n(C,Q) ≅ L\_n(C,Q) when a ≥ d−1, b ≥ d, b ≥ a and a ≥ −n+2d−2r; its specialisations to coherent rings (L^{d,d}\_n or L^{d−1,d}\_n computes L\_n for n ≥ d − 2r), the vanishing of odd L-groups in global dimension 0 and the Witt-group description of even L-groups in global dimension ≤ 1; and the L-groups of a field in every flavour. The symmetric L-theory of a t-structured category with duality exchanging the halves, as Witt groups of the heart, is GN §6.8a (`symmetricHeartLTheory`) and is imported.

Targets: §6.1 Coherent rings of finite global dimension; §6.2 The Postnikov t-structure on perfect complexes; §6.3 r-symmetry and bounded L-monoids for a t-structured category; §6.4 Surgery for r-symmetric Poincaré structures; §6.5 Symmetric surgery over a coherent ring; §6.6 Odd vanishing and Witt groups in global dimension at most one.

Planets: Coherent rings of finite global dimension, Surgery for r-symmetric structures, Witt groups in low global dimension.

### 6.1 Coherent rings of finite global dimension

`HK.6/coherent-global-dimension` · definition · planet: Coherent rings of finite global dimension

A ring R is left-coherent if its finitely presented left modules form an abelian category, equivalently if every finitely generated left ideal is finitely presented. R has (left) global dimension ≤ d if every left R-module has a projective resolution of length ≤ d, i.e. every object of ModuleCat R has projective dimension ≤ d (Mathlib `CategoryTheory.HasProjectiveDimensionLE`). If R is coherent of global dimension ≤ d, every finitely presented module has a resolution of length ≤ d by finitely generated projectives. Noetherian rings and valuation rings are coherent; R has global dimension 0 iff it is semisimple; Dedekind domains have global dimension ≤ 1. Commutativity is not assumed; 'coherent' and 'global dimension' mean the left versions.

**Hypotheses.**

- Left modules throughout.

**Construction.**

- The equivalence of the two coherence conditions is Chase's theorem; finitely presented modules are closed under kernels exactly when finitely generated ideals are finitely presented.
- For finitely presented N, a resolution by finitely generated free modules exists by coherence (kernels of maps between finitely presented modules are finitely presented); truncating at stage d gives a projective d-th syzygy, since all Ext^{d+1} vanish.
- Semisimple ⇔ every module projective ⇔ global dimension 0; for a Dedekind domain every submodule of a projective is projective (hereditary).

**API.**

- `IsLeftCoherentRing R` (data): Every finitely generated left ideal is finitely presented.
- `HasGlobalDimensionLE R d` (data): Every left R-module has projective dimension ≤ d.
- `IsLeftCoherentRing.of_isNoetherianRing` (instance): Noetherian rings are coherent.
- `hasGlobalDimensionLE_zero_iff` (characterisation): Global dimension 0 iff IsSemisimpleRing.
- `IsDedekindDomain.hasGlobalDimensionLE_one` (instance): Dedekind domains have global dimension ≤ 1.
- `finitePresentation_hasProjectiveDimensionLE` (other): Over a coherent ring of global dimension ≤ d, finitely presented modules have length-≤d resolutions by finitely generated projectives.

**Unit tests.**

- `field_dim_zero` (computation): A field has global dimension 0 and is coherent.
- `Z_dim_one` (computation): ℤ has global dimension 1, not 0: ℤ/2 has projective dimension exactly 1.
- `order_infinite_dim` (non-example): The non-maximal order ℤ[√−3] has Krull dimension 1 but infinite global dimension (it is not regular at 2), so it does not satisfy HasGlobalDimensionLE \_ 1.
- `dual_numbers` (non-example): k[ε]/(ε²) is Noetherian (hence coherent) but has infinite global dimension: k has an infinite periodic resolution.

**Checks.**

- ℤ and every field are coherent of global dimension ≤ 1, resp. 0.

**Uses.** Calmès et al. III, §1.3, p. 27: makes the Postnikov t-structure restrict to perfect complexes; Calmès et al. III, Corollaries 1.3.3, 1.3.9 and 1.3.10: the comparison ranges are expressed through d; Calmès et al. III, Corollary 1.3.14, p. 31: Dedekind rings: d ≤ 1.

*Needs:* `mathlib:CategoryTheory.HasProjectiveDimensionLE`; `mathlib:Module.FinitePresentation`; `mathlib:IsNoetherianRing`; `mathlib:IsSemisimpleRing`; `mathlib:IsDedekindDomain`.

*Sources:* Calmès et al. III, §1.3, p. 27: Defines left-coherent rings and global dimension as used in the section, notes that Noetherian rings and valuation rings are coherent and that finitely presented modules over coherent rings of global dimension d have finitely generated projective resolutions of length at most d.; Calmès et al. III, Remark 1.3.5, p. 28: Notes that global dimension 0 means semisimple and that semisimple rings are Noetherian, hence coherent.

### 6.2 The Postnikov t-structure on perfect complexes

`HK.6/perfect-postnikov-t-structure` · construction

Let R be coherent of global dimension ≤ d. The connective cover and truncation functors of D(R) preserve perfect modules, so D^p(R) inherits the Postnikov t-structure with D^p(R)\_{≥0} the 0-connective and D^p(R)\_{≤0} the 0-truncated perfect modules. It is bounded, its heart consists of the finitely presented R-modules, and for an invertible M the duality D = Hom\_R(−,M) satisfies D(D^p(R)\_{≥0}) ⊆ D^p(R)\_{≤0} and D(D^p(R)\_{≤0}) ⊆ D^p(R)\_{≥−d}.

**Hypotheses.**

- R left-coherent of global dimension ≤ d; M invertible.

**Construction.**

- The lowest non-vanishing homology of a perfect complex is finitely presented by coherence; a finite resolution by finitely generated projectives (HK.6/coherent-global-dimension) shows truncations remain perfect.
- The t-structure axioms are inherited from D(R) (Mathlib `DerivedCategory.TStructure.t` on the homotopy category, enhanced as in GeneralAlgebraicKTheoryPartII KII.3/bounded-t-structure).
- D(D^p(R)\_{≥0}) ⊆ D^p(R)\_{≤0} is the one-sided width criterion (HK.2/width-criterion, Remark 1.1.7).
- D(D^p(R)\_{≤0}) ⊆ D^p(R)\_{≥−d} follows from the universal coefficient spectral sequence for H\_\*Hom\_R(X,M), since Ext^i\_R(−,M) = 0 for i ≥ d+1.

**API.**

- `perfectTStructure R` (constructor): The Postnikov t-structure on D^p(R) for coherent R of finite global dimension.
- `perfectTStructure_bounded` (other): It is bounded.
- `perfectTStructure.heart_eq` (characterisation): Its heart is the finitely presented modules (of projective dimension ≤ d).
- `dual_connective_le_zero` (compatibility): D(D^p(R)\_{≥0}) ⊆ D^p(R)\_{≤0}.
- `dual_coconnective_ge_neg_d` (compatibility): D(D^p(R)\_{≤0}) ⊆ D^p(R)\_{≥−d}.

**Unit tests.**

- `field_heart_projective` (computation): For a field K the heart is finite-dimensional K-vector spaces = Proj(K).
- `Z_dual_shift` (computation): Over ℤ, D(ℤ/n[0]) ≃ ℤ/n[−1] for n ≠ 0, so the bound −d = −1 is attained.
- `non_coherent_fails` (non-example): Over the non-coherent ring R = k[x₁,x₂,…]/(x₁x\_i : i ≥ 1) the complex R →^{x₁} R is perfect but its H₁ = Ann(x₁) = (x₁,x₂,…) is not finitely generated, so τ\_{≥1} of a perfect complex need not be perfect and D^p(R) does not inherit the t-structure.

**Checks.**

- For R = ℤ (d = 1): D(ℤ/2[0]) = ℤ/2[−1] lies in D^p(ℤ)\_{≥−1} and not in D^p(ℤ)\_{≥0}.
- For a field (d = 0) the duality exchanges the two halves and the heart is Proj(K).

**Uses.** Calmès et al. III, Corollary 1.3.3, p. 28: Proposition 1.3.1 is applied to C = D^p(R) with this t-structure; Calmès et al. III, Corollary 1.3.9, p. 30: the width bounds are read in this t-structure; Calmès et al. III, Theorem 2.2.4, p. 38: the torsion-module analogue is used for dévissage (GN §6.8a).

*Needs:* `HK.6/coherent-global-dimension`; `HK.2/width-criterion`; `mathlib:DerivedCategory.TStructure.t`; `mathlib:CategoryTheory.Triangulated.TStructure`; `mathlib:CategoryTheory.Triangulated.TStructure.heart`; `GeneralAlgebraicKTheoryPartII:KII.3/bounded-t-structure`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, §1.3, p. 27: Shows that for coherent R of finite global dimension D^p(R) inherits the Postnikov t-structure, and that the duality sends the connective half into the coconnective one and the coconnective half into objects that are (−d)-connective, using Remark 1.1.7 and the universal coefficient spectral sequence.

### 6.3 r-symmetry and bounded L-monoids for a t-structured category

`HK.6/t-structure-bounded-l` · definition

Let C be a stable ∞-category with a t-structure (C\_{≥0}, C\_{≤0}) and a Poincaré structure Q with duality D. Q is r-symmetric if the fibre of Q(X) → Q^s\_D(X) is (−r)-truncated for every X ∈ C\_{≥0}, where Q^s\_D(X) = hom\_C(X,DX)^{hC₂}. For a, b ≥ −1 define Pn^a\_n(C,Q), M^{a,b}\_n(C,Q) and L^{a,b}\_n(C,Q) as in HK.3/bounded-l-monoids, reading every connectivity condition in the given t-structure. L^{a,b}\_n(C,Q) is a group if b ≥ a, and for C = D^p(R) with R coherent of finite global dimension and the Postnikov t-structure these agree with the earlier definitions.

**Hypotheses.**

- C stable with a t-structure; Q Poincaré with duality D.

**Construction.**

- The definitions only use connectivity of objects, which makes sense in any t-structure.
- The diagonal argument of HK.3/bounded-l-monoids for b ≥ a uses only the bounds on X.
- For D^p(R), the Postnikov connectivity of a perfect module is the connectivity used in HK.3 (HK.6/perfect-postnikov-t-structure), and the two r-symmetry notions agree by HK.2/r-symmetric-m-quadratic (testing on P[0] is testing on the heart's projectives and propagating).

**API.**

- `IsRSymmetricT Q r` (data): The fibre of Q → Q^s\_D is (−r)-truncated on C\_{≥0}.
- `boundedLT C Q n a b` (constructor): L^{a,b}\_n(C,Q) for the given t-structure.
- `boundedLT.isGroup_of_le` (characterisation): Group if b ≥ a.
- `boundedLT_perfect_eq` (equivalence): For C = D^p(R) with the Postnikov t-structure, agrees with boundedL.

**Unit tests.**

- `field_witt` (computation): For C = D^p(K), K a field, L^{0,0}\_0(C,Q^s\_K) is the symmetric Witt group of K.
- `trivial_t_structure` (degenerate): For the zero category all monoids are zero.
- `t_structure_dependence` (non-example): Shifting the t-structure by [1] changes Pn^a\_n: the same Poincaré object can be ((−n−a)/2)-connective for one t-structure and not for the shifted one, so the monoids depend on the t-structure, not only on (C,Q).

**Checks.**

- For a field with the Postnikov t-structure, L^{0,0}\_0(D^p(K),Q^s) is the Witt group of K.

**Uses.** Calmès et al. III, Proposition 1.3.1, p. 27: symmetric surgery is proved in this generality; Calmès et al. III, Theorem 2.2.4, p. 38: applied to torsion modules over a Dedekind ring (GN §6.8a dévissage).

*Needs:* `HK.3/bounded-l-monoids`; `HK.6/perfect-postnikov-t-structure`; `HK.2/r-symmetric-m-quadratic`; `GeneralAlgebraicKTheoryPartII:KII.3/bounded-t-structure`.

*Sources:* Calmès et al. III, §1.3, p. 27, before Proposition 1.3.1: Casts r-symmetry and the bounded L-monoids for a general stable ∞-category with a t-structure and duality, notes agreement with the earlier definitions for coherent rings and that the monoid is a group when b ≥ a.

### 6.4 Surgery for r-symmetric Poincaré structures

`HK.6/symmetric-surgery` · theorem · planet: Surgery for r-symmetric structures

Let C be a stable ∞-category with a t-structure, Q an r-symmetric Poincaré structure with duality D such that D(C\_{≤0}) ⊆ C\_{≥−d} for some d ≥ 0. Fix n ∈ ℤ and integers a ≥ d − 1, b ≥ d with b ≥ a, n + a even and a ≥ −n + 2d − 2r. Then (i) every Poincaré object of (C,Q[−n]) is cobordant to a ((−n−a)/2)-connective one; (ii) every Lagrangian L → X of a ((−n−a)/2)-connective Poincaré object is cobordant relative to X to a Lagrangian L′ → X with L′ ⌈(−n−1−b)/2⌉-connective and fib(L′ → X) ⌊(−n−1−b)/2⌋-connective. In particular L^{a,b}\_n(C,Q) → L\_n(C,Q) is an isomorphism and π₀M^{a,b}\_n → π₀Pn^a\_n → L^{a,b}\_n is exact in the middle. The objects in (i) are concentrated in [(−n−a)/2, (−n+a)/2] and the Lagrangians in [⌈(−n−1−b)/2⌉, ⌈(−n−1+b)/2⌉]. (The source assumes the t-structure bounded; its proof does not use boundedness.)

**Hypotheses.**

- Statement for a general C, not D^p(R) (corrected; sourceIssues E2).
- The source assumes a bounded t-structure; the proof only uses truncations, exactness of the fibre of Q → Q^s\_D and the duality bound.

**Proof route.**

- (i) Put k = (−n−a−2)/2, W := Ω^nDτ\_{≤k}X and f : W → Ω^nDX ≃ X dual to X → τ\_{≤k}X.
- W is (−n−k−d)-connective and DW ≃ Σ^nτ\_{≤k}X is (n+k)-truncated, so Ω^n hom\_C(W,DW)^{hC₂} is (n+2k+d)-truncated; by r-symmetry the fibre of Ω^nQ(W) → Ω^nQ^s\_D(W) is (k+d−r)-truncated. Hence Ω^nQ(W) is max(n+2k+d, k+d−r)-truncated, and the hypotheses give max(n+2k+d, k+d−r) < 0.
- So Ω^{∞+n}Q(W) ≃ \* and q\|\_W is null: surgery along f gives X′ = cofib(W → τ\_{≥k+1}X), which is (k+1)-connective because W is (k+1)-connective (−2k = n+a+2 ≥ n+d+1).
- (ii) If L is not ⌈(−n−1−b)/2⌉-connective, put l = ⌈(−n−1−b)/2⌉ − 1, N′ := Ω^{n+1}Dτ\_{≤l}L and f : N′ → N dual to L → τ\_{≤l}L; the same estimate shows Ω^{n+1}Q(N′) is (−1)-truncated (max(n+1+2l+d, l+d−r) < 0), giving a Lagrangian surgery datum (HK.3/lagrangian-surgery); the new Lagrangian L′ = cofib(N′ → τ\_{≥l+1}L) is (l+1)-connective.
- Bijectivity of L^{a,b}\_n → L\_n follows as in HK.4/quadratic-surgery.

**Checks.**

- Numerical core: with n + a even, a ≥ d − 1 and a ≥ −n + 2d − 2r, k = (−n−a−2)/2 satisfies n + 2k + d < 0 and k + d − r < 0 (checked by omega in Suggested.lean).
- r = ∞, d = 0: symmetric surgery for a duality exchanging the two halves, which gives the Witt groups of the heart (GN §6.8a `symmetricHeartLTheory`).

*Needs:* `HK.6/t-structure-bounded-l`; `HK.3/lagrangian-surgery`; `HK.3/cobordism-presentation`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Proposition 1.3.1 and Remark 1.3.2, p. 27; proof pp. 28–29; Remark 1.3.6, p. 29: States and proves symmetric surgery for an r-symmetric structure on a t-structured stable category with D(C\_{≤0}) ⊆ C\_{≥−d} by surgery along duals of truncations, with the concentration intervals and exactness in the middle; parts (i) and (ii) are printed with D^p(R) in place of C.

### 6.5 Symmetric surgery over a coherent ring

`HK.6/coherent-symmetric-surgery` · theorem

Let R be coherent of global dimension d, M invertible and Q an r-symmetric M-compatible Poincaré structure on D^p(R). For n ≥ d − 2r: if n + d is even, L^{d,d}\_n(R;Q) → L\_n(R;Q) is an isomorphism; if n + d is odd, L^{d−1,d}\_n(R;Q) → L\_n(R;Q) is an isomorphism.

**Hypotheses.**

- R left-coherent of global dimension d.

**Proof route.**

- Apply HK.6/symmetric-surgery to C = D^p(R) with the Postnikov t-structure (HK.6/perfect-postnikov-t-structure), (a,b) = (d,d) or (d−1,d): a ≥ d − 1, b ≥ d, b ≥ a, n + a even, and a ≥ −n + 2d − 2r ⇔ n ≥ d − 2r (n+d even) or n ≥ d − 2r + 1, automatic by parity (n+d odd).

**Checks.**

- For a Dedekind ring (d = 1) and Q^gs (r = 2): L^{1,1}\_n ≅ L^gs\_n for odd n ≥ −3 and L^{0,1}\_n ≅ L^gs\_n for even n ≥ −3.

*Needs:* `HK.6/symmetric-surgery`; `HK.6/perfect-postnikov-t-structure`; `HK.6/coherent-global-dimension`.

*Sources:* Calmès et al. III, Corollary 1.3.3, p. 28: Specialises symmetric surgery to D^p(R) for coherent R of global dimension d, giving L^{d,d}\_n or L^{d−1,d}\_n ≅ L\_n for n ≥ d − 2r according to the parity of n + d.

### 6.6 Odd vanishing and Witt groups in global dimension at most one

`HK.6/low-dimension-witt` · theorem · planet: Witt groups in low global dimension

Let R be coherent of global dimension d, M invertible and Q r-symmetric and M-compatible. (i) If d = 0, L\_{2k−1}(R;Q) = 0 for every k ≥ 1 − r. (ii) If d ≤ 1, L\_{2k}(R;Q) ≅ W(Proj(R); Ω^{2k}Q(Ω^k −)) for every k ≥ 1 − r, via (P,q) ↦ (P[−k],q). For Q = Q^{≥m}\_M (r = 2 − m), π\_{2k}Q^{≥m}\_M(P[−k]) ≅ π₀Q^{≥m−k}\_{(−1)^kM}(P), so the Witt group is that of (−1)^k-quadratic forms for k = m − 2, (−1)^k-even forms for k = m − 1 and (−1)^k-symmetric forms for k ≥ m; the L-group statement covers k ≥ m − 1 only, the case k = m − 2 being HK.4/witt-group-computes-L0 (iii) transported by HK.1/bordism-invariant-periodicity. If d = 0 (R semisimple) the odd symmetric and quadratic L-groups vanish in all degrees; for a field K of characteristic ≠ 2, L^q\_{4k+2}(K) ≅ L^s\_{4k+2}(K) = 0; and the heart of D^p(R) is Proj(R), whose symmetric Witt group is W(Proj(R);Q^gs\_M).

**Hypotheses.**

- R left-coherent; k ≥ 1 − r in (i) and (ii).

**Proof route.**

- (i) HK.6/symmetric-surgery with d = 0, (a,b) = (−1,0), n = 2k−1: the condition a ≥ −n − 2r reads k ≥ 1 − r; Pn^{−1}\_n is contractible (HK.3/bounded-l-monoids).
- (ii) HK.6/coherent-symmetric-surgery with d = 1 (n = 2k, n + d odd) gives L\_{2k} ≅ L^{0,1}\_{2k}; HK.3/widen-lagrangian-bound gives L^{0,1}\_{2k} ≅ L^{0,0}\_{2k}; shifting by k and HK.3/strictly-metabolic-witt identify L^{0,0}\_{2k} with W(Proj(R);Ω^{2k}Q(Ω^k−)). A ring of global dimension 0 also satisfies the hypotheses with d = 1, so the same argument applies.
- The value on P[−k] follows from HK.0/shift-periodicity, and the classical form groups from GN §6.8a (m − k = 2, 1, ≤ 0).
- Semisimple rings: Q^s\_M is r-symmetric for all r, giving all odd symmetric groups; for the quadratic ones reduce by HK.1/bordism-invariant-periodicity to L^q\_{−3}(R;M′), which is L^gs\_{−3}(R;M′) by HK.4/quadratic-low-degree-comparison, and vanishes by (i) with k = −1 ≥ 1 − 2.
- For a field of characteristic ≠ 2, L^s\_{4k+2} is the Witt group of antisymmetric forms, which have symplectic bases and so Lagrangians.

**Checks.**

- R = ℤ (d = 1), Q = Q^gs (r = 2), k = 0: L^gs\_0(ℤ) is the Witt group of symmetric forms, ℤ by signature.
- R = 𝔽₂, Q = Q^{≥1} (r = 1), k = 0: L^ge\_0(𝔽₂) is the Witt group of even forms, which is 0.

*Needs:* `HK.6/symmetric-surgery`; `HK.6/coherent-symmetric-surgery`; `HK.3/widen-lagrangian-bound`; `HK.3/strictly-metabolic-witt`; `HK.0/shift-periodicity`; `HK.4/quadratic-low-degree-comparison`; `HK.1/bordism-invariant-periodicity`; `HK.4/witt-group-computes-L0`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Corollary 1.3.4 and Remark 1.3.5, p. 28; Example 1.3.7, p. 30: Proves odd vanishing in global dimension 0 and the Witt-group description of even L-groups in global dimension ≤ 1 for k ≥ 1 − r with the identification of the form groups for Q^{≥m}\_M, recovers Ranicki's vanishing for semisimple rings and the vanishing of L\_{4k+2} for fields of characteristic ≠ 2, and identifies the heart in global dimension 0.

### Dependencies

Requires: HK.4, HK.3, HK.2, HK.1, HK.0, GeometryOfNumbersAndQuadraticArithmetic:GN.6, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal.

## Layer HK.7: Comparison ranges for the flavours of L-theory and Grothendieck–Witt theory

For R coherent of global dimension d and an r-symmetric M-compatible Q: L\_n(R;Q) → L^s\_n(R;M) is injective for n ≥ d − 2r + 2 and bijective for n ≥ d − 2r + 3. Theorem 6: L^gs\_n → L^s\_n and GW^gs\_n → GW^s\_n are injective for n ≥ d − 2 and bijective for n ≥ d − 1; L^gq\_n → L^s\_n, L^gq\_n → L^gs\_n and GW^gq\_n → GW^s\_n are injective for n ≥ d + 2 and bijective for n ≥ d + 3. Sharpness of the bounds (𝔽₂[ℤ^d], ℤ[ℤ] with ε = −1) and their non-optimality for regular rings; the right-coherent versions; the Dedekind case (injective at −1, bijective from 0 for L^gs; injective at 3, bijective from 4 for L^gq), with 4-periodicity of the non-negative L^gs-groups; the two-degree improvement for 2-torsion-free rings with M = R; the genuine Poincaré structures of form parameters with their ranges and degree-two Witt description; the Burnside form parameter over ℤ; and the L-groups of a field in every flavour. The equivalence GW^s\_cl(R;M) ≃ τ\_{≥0}GW^s(R;M) for Dedekind R is GN §6.8a (Corollary 1.3.15) and is imported.

Targets: §7.1 Comparison of an r-symmetric flavour with symmetric L-theory; §7.2 Theorem 6: comparison of the genuine flavours; §7.3 Sharpness and non-optimality of the comparison ranges; §7.4 The right-handed versions; §7.5 The Dedekind case; §7.6 The improvement for 2-torsion-free rings; §7.7 Genuine Poincaré structures of form parameters; §7.8 L-theory of the Burnside form parameter over ℤ; §7.9 L-groups of a field in every flavour.

Planets: Comparison with symmetric L-theory, Theorem 6 (genuine versus symmetric), Dedekind comparison, Form-parameter Poincaré structures, L-groups of a field in every flavour.

### 7.1 Comparison of an r-symmetric flavour with symmetric L-theory

`HK.7/symmetric-comparison-range` · theorem · planet: Comparison with symmetric L-theory

Let R be coherent of global dimension d, M invertible and Q an r-symmetric M-compatible Poincaré structure on D^p(R). Then L\_n(R;Q) → L\_n(R;Q^s\_M) = L^s\_n(R;M) is injective for n ≥ d − 2r + 2 and bijective for n ≥ d − 2r + 3.

**Hypotheses.**

- R left-coherent of global dimension d; Q r-symmetric.

**Proof route.**

- Compare L^{d,d}\_n (n + d even) or L^{d−1,d}\_n (n + d odd) for Q and Q^s\_M; by HK.6/coherent-symmetric-surgery both compute L\_n (Q^s\_M is r-symmetric for all r).
- Bijectivity for n ≥ d − 2r + 3: the bounded groups agree by HK.4/genuine-symmetric-bounded-agreement, whose conditions a ≤ n + 2r − 4, b ≤ n + 2r − 3 hold for (a,b) = (d,d) (using the parity of n − d) and (d−1,d).
- Injectivity at n = d − 2r + 2 (so n + d even, (a,b) = (d,d)): by exactness in the middle (HK.6/symmetric-surgery) it suffices that a (−d+r−1)-connective Q-Poincaré object whose symmetric image has a (−d+r−1)-connective Lagrangian L has a Q-Lagrangian. The fibre of Ω^nQ(L) → Ω^nQ^s\_M(L) is (−1)-truncated by r-symmetry, so the map is injective on π₀ and onto on π₁, and the Lagrangian lifts.

**Checks.**

- Q = Q^gs\_M (r = 2): injective n ≥ d − 2, bijective n ≥ d − 1.
- Q = Q^gq\_M (r = 0): injective n ≥ d + 2, bijective n ≥ d + 3.

*Needs:* `HK.6/coherent-symmetric-surgery`; `HK.4/genuine-symmetric-bounded-agreement`; `HK.6/symmetric-surgery`; `HK.2/r-symmetric-m-quadratic`.

*Sources:* Calmès et al. III, Corollary 1.3.9 and proof, p. 30: Proves that for an r-symmetric structure over a coherent ring of global dimension d the map to symmetric L-theory is injective from degree d − 2r + 2 and bijective from d − 2r + 3, by comparing bounded L-groups and lifting Lagrangians.

### 7.2 Theorem 6: comparison of the genuine flavours

`HK.7/genuine-comparison-theorem` · theorem · planet: Theorem 6 (genuine versus symmetric)

Let R be coherent of global dimension d and M invertible. Then L^gs\_n(R;M) → L^s\_n(R;M) and GW^gs\_n(R;M) → GW^s\_n(R;M) are injective for n ≥ d − 2 and bijective for n ≥ d − 1; L^gq\_n(R;M) → L^s\_n(R;M) and GW^gq\_n(R;M) → GW^s\_n(R;M) are injective for n ≥ d + 2 and bijective for n ≥ d + 3; and L^gq\_n(R;M) → L^gs\_n(R;M) is injective for n ≥ d + 2 and bijective for n ≥ d + 3. For non-negative n this improves Ranicki's comparison for Noetherian rings of global dimension d (injective for n ≥ 2d − 3, bijective for n ≥ 2d − 2), through Theorem 5.

**Hypotheses.**

- R left-coherent of global dimension d.

**Proof route.**

- L-theory: HK.7/symmetric-comparison-range with r = 2 for Q^gs\_M and r = 0 for Q^gq\_M (HK.2/genuine-family-bounds).
- GW: the identity functors (D^p(R),Q^gq\_M) → (D^p(R),Q^gs\_M) → (D^p(R),Q^s\_M) are Poincaré functors with the same duality, so they induce equivalences on K(R;M)\_{hC₂}; by the fundamental fibre sequence K\_{hC₂} → GW → L (GN §6.8a `stableGWFundamentalSquare`) the squares from GW to L are cartesian and the cofibres of the GW maps are those of the L maps. The source attributes this to Theorem 1; the input is the fibre sequence of Paper II (sourceIssues E5).
- L^gq\_n → L^gs\_n: compose with L^gs\_n → L^s\_n, which is bijective for n ≥ d − 1 ≤ d + 2.
- Comparison with Ranicki: identify L^gs\_n with L^short\_n for n ≥ 0 (HK.4/ranicki-genuine-symmetric); d − 1 ≤ 2d − 2 for d ≥ 1.

**Checks.**

- d = 0 (semisimple): L^gs\_n ≅ L^s\_n for n ≥ −1.
- R = ℤ (d = 1): L^gs\_n ≅ L^s\_n for n ≥ 0 and L^gq\_n ≅ L^gs\_n for n ≥ 4, consistent with GN §6.10a's sharper ℤ-ranges.

*Needs:* `HK.7/symmetric-comparison-range`; `HK.2/genuine-family-bounds`; `HK.4/ranicki-genuine-symmetric`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Corollary 1.3.10, pp. 30–31; Theorem 6, p. 4; Remark 1.3.13, p. 31: Proves the comparison ranges for the genuine symmetric and genuine quadratic L- and GW-groups against the symmetric ones over coherent rings of global dimension d, states Theorem 6 in the introduction, and notes the improvement on Ranicki's Proposition 4.5.; Ranicki 1980, Proposition 4.5 (§4): Ranicki's comparison of the short symmetric L-groups of a Noetherian ring of finite global dimension with the periodic ones in a range of degrees.

### 7.3 Sharpness and non-optimality of the comparison ranges

`HK.7/sharpness-examples` · theorem

The bijectivity bound n ≥ d − 1 for L^gs → L^s is sharp: for the d-dimensional ring 𝔽₂[ℤ^d] with the involution induced by inversion, L^gs → L^s is not surjective on π\_{d−2}. Similarly, for ε = −1, L^gs\_0(ℤ[ℤ];ε) → L^s\_0(ℤ[ℤ];ε) is not surjective. For d = 0 the example shows sharpness also for commutative rings with trivial involution, and L^gs(ℤ/4) → L^s(ℤ/4) fails to be an isomorphism on almost all positive homotopy groups. On the other hand, for many regular Noetherian domains of arbitrary finite Krull dimension L^gs → L^s is an isomorphism on π\_n for all n ≥ −1, so among regular rings the bounds are far from optimal.

**Hypotheses.**

- The Ranicki–Shaneson splitting L(R[ℤ];Q) ≃ L(R;Q) ⊕ ΣL(R;Q) for Q = Q^gs, Q^s when K₀(R) ≅ K₀(R[ℤ]) ≅ ℤ is an imported input (Ranicki; Milgram–Ranicki; reproved in Paper IV), recorded as a gap.

**Proof route.**

- By the Ranicki–Shaneson splitting and induction, Σ^dL^gs(𝔽₂) → Σ^dL^s(𝔽₂) is a retract of L^gs(𝔽₂[ℤ^d]) → L^s(𝔽₂[ℤ^d]).
- So it suffices that L^gs\_{−2}(𝔽₂) → L^s\_{−2}(𝔽₂) is not surjective: L^s\_{−2}(𝔽₂) ≅ L^s\_2(𝔽₂) ≅ ℤ/2 by 2-periodicity, while L^gs\_{−2}(𝔽₂) = 0 (HK.7/field-l-groups). The source writes 'L^gs(𝔽₂) = 0' for the latter (sourceIssues E4).
- The ε = −1 statement over ℤ[ℤ] follows by the same retract argument from degree −1 over ℤ; the ℤ/4 and regular-ring statements are quoted (Read, Corollary F; Schlichting 2025).

**Checks.**

- The example shows that the bijectivity bound d − 1 for L^gs → L^s cannot be improved; since the comparison maps are compatible with L^gq ≃ Σ⁴L^gs and L^s ≃ Σ⁴L^s (HK.1/bordism-invariant-periodicity), the bound d + 3 for L^gq → L^s cannot be improved either. The source presents this as sharpness of the bounds of Corollary 1.3.10; the injectivity bounds are not addressed by the example.

*Needs:* `HK.7/genuine-comparison-theorem`; `HK.7/field-l-groups`.

*Sources:* Calmès et al. III, Example 1.3.11, p. 31: Shows the comparison bounds are sharp using 𝔽₂[ℤ^d] and the Ranicki–Shaneson splitting, gives the ε = −1 example over ℤ[ℤ], cites Read for ℤ/4, and cites Schlichting for the non-optimality over regular Noetherian domains.

### 7.4 The right-handed versions

`HK.7/right-coherent-version` · theorem

If R is right-coherent of finite right global dimension d, the conclusions of HK.6/low-dimension-witt (including Ranicki's vanishing), HK.7/symmetric-comparison-range and HK.7/genuine-comparison-theorem hold for R.

**Hypotheses.**

- R right-coherent of right global dimension d.

**Proof route.**

- Apply the left-handed results to R^op with Q^∨ (HK.0/opposite-ring-transport), which is r-symmetric when Q is (HK.2/opposite-ring-bounds).
- Transport along (D^p(R^op),Q^∨) ≃ (D^p(R),Q).

**Checks.**

- For commutative R left and right agree, and the statement adds nothing.

*Needs:* `HK.0/opposite-ring-transport`; `HK.2/opposite-ring-bounds`; `HK.7/genuine-comparison-theorem`; `HK.7/symmetric-comparison-range`; `HK.6/low-dimension-witt`.

*Sources:* Calmès et al. III, Remark 1.3.12, p. 31: Deduces the right-coherent versions of Corollaries 1.3.4, 1.3.9, 1.3.10 and Remark 1.3.5 from the left ones applied to R^op with the transported Poincaré structure.

### 7.5 The Dedekind case

`HK.7/dedekind-comparison` · theorem · planet: Dedekind comparison

Let R be a Dedekind ring (for instance a ring of integers of a number field) and M invertible. Then L^gs\_n(R;M) → L^s\_n(R;M) and GW^gs\_n(R;M) → GW^s\_n(R;M) are injective for n = −1 and bijective for n ≥ 0; in particular the non-negative homotopy groups of L^gs(R;M) are 4-periodic. Likewise L^gq\_n → L^s\_n and GW^gq\_n → GW^s\_n are injective for n = 3 and bijective for n ≥ 4. With the Hebestreit–Steimle comparison this gives GW^s\_cl(R;M) ≃ τ\_{≥0}GW^s(R;M) and τ\_{≥4}GW^q\_cl(R;M) ≃ τ\_{≥4}GW^s(R;M) (GN §6.8a, Corollary 1.3.15).

**Hypotheses.**

- R Dedekind (hereditary Noetherian domain, global dimension ≤ 1).

**Proof route.**

- Dedekind rings are Noetherian of global dimension ≤ 1 (HK.6/coherent-global-dimension); apply HK.7/genuine-comparison-theorem with d = 1.
- 4-periodicity of L^s (HK.1/bordism-invariant-periodicity) transfers to L^gs in non-negative degrees.
- The GW consequences are the statement GN §6.8a records as Corollary 1.3.15.

**Checks.**

- L^gs\_n(ℤ) for n ≥ 0 is ℤ, ℤ/2, 0, 0 periodically.
- L^gs\_{−1}(ℤ) → L^s\_{−1}(ℤ) = 0 is injective, so L^gs\_{−1}(ℤ) = 0.

*Needs:* `HK.7/genuine-comparison-theorem`; `HK.6/coherent-global-dimension`; `HK.1/bordism-invariant-periodicity`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Corollary 1.3.14, pp. 31–32, and Corollary 1.3.15, p. 32: Specialises the comparison ranges to Dedekind rings, deduces 4-periodicity of non-negative genuine symmetric L-groups, and with Hebestreit–Steimle identifies classical symmetric GW with the connective cover of homotopy symmetric GW and quadratic GW above degree 4.

### 7.6 The improvement for 2-torsion-free rings

`HK.7/two-torsion-free-improvement` · theorem

Let R be commutative, coherent of global dimension d, with M = R. Then Σ²L^gs(R) ≃ L^{−ge}(R) and Σ²L^ge(R) ≃ L^{−gq}(R). If R is moreover 2-torsion free (for instance a Dedekind domain with fraction field of characteristic ≠ 2), Q^{−ge} → Q^{−gs} and Q^gq → Q^ge are equivalences, so Σ²L^gs(R) ≃ L^{−gs}(R) and Σ²L^gq(R) ≃ L^{−gq}(R), compatibly with the comparison map; hence L^gq\_n(R) → L^gs\_n(R) and GW^q\_{cl,n}(R) → GW^s\_{cl,n}(R) are injective for n = d and bijective for n ≥ d + 1.

**Hypotheses.**

- R commutative, coherent of global dimension d, 2-torsion free; M = R with trivial involution.

**Proof route.**

- The two double-shift equivalences are HK.1/bordism-invariant-periodicity with (M,m) = (R,0) and (R,1).
- Q^{−ge} = Q^{−gs} and Q^gq = Q^ge by HK.0/tate-collapse-criterion (R[2] = 0).
- So L^gq(R) → L^gs(R) is Ω² of L^{−gq}(R) → L^{−gs}(R); HK.7/genuine-comparison-theorem for M = R(−1) gives injectivity in degree d+2 and bijectivity from d+3 for the latter, i.e. degrees d and d+1 for the former.
- Transfer to classical GW by the cartesian squares and the Hebestreit–Steimle comparison (GN §6.8a).

**Checks.**

- For R = ℤ (d = 1): GW^q\_{cl,n}(ℤ) → GW^s\_{cl,n}(ℤ) is injective for n = 1 and bijective for n ≥ 2, matching GN §6.11's quadratic table (GW₁ = (ℤ/2)², symmetrisation iso from degree 2).

*Needs:* `HK.1/bordism-invariant-periodicity`; `HK.0/tate-collapse-criterion`; `HK.7/genuine-comparison-theorem`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Remark 1.3.16, p. 32: Uses the double-shift equivalences and the collapse of genuine structures for 2-torsion-free rings to show the quadratic-to-symmetric comparison gains two degrees, proving the second part of Theorem 3.

### 7.7 Genuine Poincaré structures of form parameters

`HK.7/form-parameter-structures` · construction · planet: Form-parameter Poincaré structures

A form parameter λ on (R,M) (Bak, Baues, Schlichting) is a quadratic R-module Q\_λ with maps M\_{C₂} →^τ Q\_λ →^ρ M^{C₂} composing to the trace, whose R-action has cross-effect (a ⟂ b)x = τ((a⊗b)ρ(x)); a λ-hermitian form on P ∈ Proj(R) is a σ-symmetric M-valued form φ with a map q : P → Q\_λ such that q(rv) = r·q(v), q(v+u) − q(v) − q(u) = τ(φ(v,u)) and ρ q(v) = φ(v,v). The functor P ↦ {λ-hermitian forms on P} extends as a non-abelian derived functor to a Poincaré structure Q^{gλ}\_M on D^p(R) with duality Hom\_R(−,M). Q\_λ = M^{C₂}, M\_{C₂} and im(M\_{C₂} → M^{C₂}) give Q^gs, Q^gq and Q^ge. Since Q^{gλ}\_M(P[0]) is discrete, Q^{gλ}\_M is 0-quadratic and 0-symmetric (1- or 2-symmetric, resp. 1- or 2-quadratic, in the even and symmetric, resp. even and quadratic, cases). For R coherent of global dimension ≤ 1, L^{gλ}\_n(R) → L^s\_n(R) is injective for n = 3 and bijective for n ≥ 4, and L^{gλ}\_2(R) is the Witt group of the form parameter (−M, ker(M → Q\_λ)).

**Hypotheses.**

- R with an invertible ℤ-module with involution M; R coherent of global dimension ≤ 1 for the comparison claims (the source writes '1-dimensional ring'; corrected, sourceIssues E7).

**Construction.**

- Schlichting's equivalence between form parameters and reduced degree-two polynomial functors on Proj(R) gives the functor of λ-hermitian forms; extend by Calmès et al. I, Proposition 4.2.18 (non-abelian derivation) to D^p(R).
- Discreteness of values on P[0] gives fibre and cofibre to Q^s\_M and from Q^q\_M concentrated so that the structure is 0-symmetric and 0-quadratic (HK.2/r-symmetric-m-quadratic).
- Comparison: HK.7/symmetric-comparison-range with r = 0 and d = 1.
- Degree two: HK.6/low-dimension-witt (ii) with k = 1 ≥ 1 − r; Ω²Q^{gλ}(Ω−) on projectives is the form-parameter functor for (−M, ker(M → Q\_λ)).

**API.**

- `FormParameter R M` (structure): A quadratic R-module Q\_λ with τ : M\_{C₂} → Q\_λ and ρ : Q\_λ → M^{C₂}, ρτ the trace, and the cross-effect condition.
- `FormParameter.hermitianForms` (constructor): P ↦ the group of λ-hermitian forms (φ,q) on P.
- `FormParameter.poincare` (constructor): Q^{gλ}\_M on D^p(R), the derived functor of hermitian forms.
- `FormParameter.symmetric` (example): Q\_λ = M^{C₂} gives Q^gs\_M.
- `FormParameter.quadratic` (example): Q\_λ = M\_{C₂} gives Q^gq\_M.
- `FormParameter.even` (example): Q\_λ = im(M\_{C₂} → M^{C₂}) gives Q^ge\_M.
- `FormParameter.zeroSymmetric` (other): Q^{gλ}\_M is 0-symmetric and 0-quadratic.

**Unit tests.**

- `burnside_example` (computation): Over ℤ with M = ℤ, Q\_λ = ℤ ×\_{ℤ/2} ℤ and M → Q\_λ the pair (2,0) is a form parameter (the Burnside form parameter) strictly between the quadratic and symmetric ones.
- `symmetric_parameter` (degenerate): For Q\_λ = M^{C₂}, τ the norm and ρ the identity, λ-hermitian forms are symmetric forms.
- `trace_condition` (non-example): ρ = 0 and τ = 0 do not form a form parameter on (ℤ,ℤ) since ρτ must be the trace, which is multiplication by 2 ≠ 0.
- `discrete_values` (characterisation): Q^{gλ}\_M(P[0]) is the discrete group of λ-hermitian forms on P.

**Checks.**

- Q\_λ = M^{C₂} recovers the symmetric case, where the ranges improve to those of Q^gs.

**Uses.** Calmès et al. III, Example 1.3.18, p. 32: the Burnside form parameter over ℤ; Calmès et al. III, Theorem 3 and Remark 1.3.17: Theorem 3 holds for any form parameter in place of quadratic forms.

*Needs:* `HK.2/r-symmetric-m-quadratic`; `HK.7/symmetric-comparison-range`; `HK.6/low-dimension-witt`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Remark 1.3.17, p. 32: Associates a genuine Poincaré structure to every form parameter, notes it is 0-quadratic and 0-symmetric and in the classical cases more, and derives the comparison range for one-dimensional rings and the degree-two Witt description.; Calmès et al. I, Definition 4.2.26, p. 73, and the discussion on p. 74: Defines form parameters after Schlichting, λ-hermitian forms and the derived Poincaré structure Q^{gλ}\_M, recovering symmetric, quadratic and even forms.

### 7.8 L-theory of the Burnside form parameter over ℤ

`HK.7/burnside-l-theory` · theorem

Let Q^b on D^p(ℤ) be the pullback of Q^gs(X) → Hom\_ℤ(X,τ\_{≥0}ℤ^{tC₂}) along Hom\_ℤ(X,τ\_{≥1/2}ℤ^{tC₂}), where τ\_{≥1/2}ℤ^{tC₂} := ℤ ×\_{ℤ/2} τ\_{≥0}ℤ^{tC₂}. It is the Poincaré structure of the Burnside form parameter (Q\_λ = ℤ ×\_{ℤ/2} ℤ, M = ℤ, M → Q\_λ = (2,0)). Then L^b\_n(ℤ) → L^s\_n(ℤ) is an isomorphism for n ≥ 2; L^u\_n(𝕊) → L^b\_n(ℤ) is an isomorphism for n ≤ 0 and onto for n = 1; and L^q\_1(ℤ) → L^b\_1(ℤ) is onto, so L^b\_1(ℤ) = 0. Hence L^b\_n(ℤ) = L^s\_n(ℤ) for n ≥ 2, L^b\_1(ℤ) = 0 and L^b\_n(ℤ) = L^u\_n(𝕊) for n ≤ 0.

**Hypotheses.**

- Over ℤ with trivial involution.

**Proof route.**

- By HK.7/form-parameter-structures with d = 1, L^b\_n(ℤ) → L^s\_n(ℤ) is injective for n = 3 and bijective for n ≥ 4; as L^s\_3(ℤ) = 0 it is bijective at n = 3. At n = 2, since M → Q\_λ is injective, L^b\_2(ℤ) is the Witt group of the form parameter (−ℤ, 0), i.e. of symplectic forms over ℤ, which vanishes, as does L^s\_2(ℤ).
- The Poincaré functor (Mod^ω\_𝕊, Q^u) → (D^p(ℤ), Q^b) has 1-connective map on linear parts 𝕊 → τ\_{≥1/2}ℤ^{tC₂}; HK.5/connective-comparison with p = 1, m = 0 gives iso for n ≤ 0 and onto for n = 1.
- For L^b\_1: represent a class on X in degrees [−1,0]; π₀X is free; surgery along π₀(X) → X leaves a Poincaré object of ΩQ^b with homology a torsion group T in degree −1, on which the form lifts to ΩQ^q because π₀Ωhom\_ℤ(T[−1], τ\_{≥1/2}ℤ^{tC₂}) = 0 for torsion T; as L^q\_1(ℤ) = 0, L^b\_1(ℤ) = 0.

**Checks.**

- The structure sits between Q^gq\_ℤ and Q^gs\_ℤ; L^b was first studied by Dotto–Ogle.

*Needs:* `HK.7/form-parameter-structures`; `HK.5/connective-comparison`; `HK.5/sphere-integers-comparison`; `HK.4/quadratic-surgery`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Example 1.3.18, pp. 32–33: Defines the Burnside Poincaré structure on D^p(ℤ), compares its L-theory with symmetric L-theory in degrees ≥ 2 and with universal L-theory of the sphere in degrees ≤ 1, and shows L^b\_1(ℤ) vanishes by surgery and lifting to the quadratic structure.

### 7.9 L-groups of a field in every flavour

`HK.7/field-l-groups` · theorem · planet: L-groups of a field in every flavour

Let K be a field and M = K with an involution of sign ε. (a) For every r-symmetric Q and k ≥ 1 − r, L\_{2k−1}(K;Q) = 0 and L\_{2k}(K;Q) ≅ W(Proj(K); Ω^{2k}Q(Ω^k−)); in particular all odd L^s and L^q groups vanish. (b) If char K ≠ 2, all flavours coincide; for ε = +1, L^s\_{4k}(K) = W(K) (the Witt ring of QuadraticFormInvariants Layer 4) and L^s\_{4k+2}(K) = 0, and for ε = −1 the two residues are exchanged, L^s\_{n+2}(K;−1) ≅ L^s\_n(K;+1). (c) If char K = 2, −M = M and L^s, L^q, K^{tC₂} are 2-periodic; L^s\_{2k}(K) is the Witt group W^s(K) of symmetric bilinear forms and L^q\_{2k}(K) the Witt group W^q(K) of quadratic forms; L^gs\_n(K) → L^s\_n(K) is an isomorphism for n ≥ −1, L^gs\_n(K) ≅ L^q\_n(K) for n ≤ −3, and L^gs\_{−2}(K) = L^ge\_0(K) = 0 because even forms in characteristic 2 are alternating and hence metabolic. For K = 𝔽₂: L^s\_{2k}(𝔽₂) = ℤ/2 (rank mod 2), L^q\_{2k}(𝔽₂) = ℤ/2 (Arf invariant), L^gs\_{−2}(𝔽₂) = 0.

**Hypotheses.**

- K a field; involution trivial up to sign.

**Proof route.**

- (a) HK.6/low-dimension-witt with d = 0.
- (b) 2 is a unit, so HK.0/tate-collapse-criterion makes all flavours equal; for ε = +1, L^s\_{4k+2} = 0 by HK.6/low-dimension-witt and L^s\_0 = W(K) by HK.4/witt-group-computes-L0 and QuadraticFormInvariants Layer 4; the case ε = −1 follows from L(K;Q^s\_M) ≃ Ω²L(K;Q^s\_{−M}) (HK.1/bordism-invariant-periodicity).
- (c) Periodicity by HK.1/bordism-invariant-periodicity with −M = M. The comparison L^gs → L^s for n ≥ −1 is HK.7/genuine-comparison-theorem with d = 0; L^gs ≅ L^q for n ≤ −3 is HK.4/quadratic-low-degree-comparison; L^gs\_{−2}(K) ≅ L^ge\_0(K;−M) = L^ge\_0(K) by HK.1/bordism-invariant-periodicity, which is the Witt group of even forms (HK.4/witt-group-computes-L0 (ii)), and an even form b = c + c^t satisfies b(x,x) = 2c(x,x) = 0, so it is alternating, has a symplectic basis and is metabolic.
- For 𝔽₂: W^s(𝔽₂) = ℤ/2 via rank mod 2, and W^q(𝔽₂) = ℤ/2 via the Arf invariant.

**Checks.**

- L^s\_{−2}(𝔽₂) = ℤ/2 ≠ 0 = L^gs\_{−2}(𝔽₂): this is the input to the sharpness example HK.7/sharpness-examples.
- For K = ℝ, L^s\_0(ℝ) = ℤ by signature.

*Needs:* `HK.6/low-dimension-witt`; `HK.7/genuine-comparison-theorem`; `HK.0/tate-collapse-criterion`; `HK.4/witt-group-computes-L0`; `HK.1/bordism-invariant-periodicity`; `HK.4/quadratic-low-degree-comparison`; `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`.

*Sources:* Calmès et al. III, Corollary 1.3.4 and Remark 1.3.5, p. 28: Gives the vanishing of odd L-groups of fields and the Witt-group description of the even ones, and the vanishing of L\_{4k+2} in characteristic ≠ 2.; Calmès et al. III, Example 1.3.11, p. 31: Uses L^s\_2(𝔽₂) ≅ ℤ/2 and the vanishing of genuine symmetric L-theory of 𝔽₂ in degree −2 (corrected; sourceIssues E4).; Calmès et al. III, Corollary R.10, p. 10: States that L^s, L^q and K^{tC₂} are 2-periodic over 𝔽₂-algebras.

### Dependencies

Requires: HK.6, HK.5, HK.4, HK.2, HK.1, HK.0, GeometryOfNumbersAndQuadraticArithmetic:GN.6, tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal.

## Layer HK.8: Fibre sequences and comparisons for classical Grothendieck–Witt theory

Theorem 1: for every ring R and invertible M, a fibre sequence K(R;M)\_{hC₂} →^{hyp} GW^s\_cl(R;M) → L^short(R;M) with L^short = τ\_{≥0}L^gs, whose homotopy groups are Ranicki's original symmetric L-groups; its quadratic companion K(R;M)\_{hC₂} → GW^q\_cl(R;M) → τ\_{≥0}Σ⁴L^gs(R;M); the recovery of Karoubi's splitting GW^s\_{cl,\*}(R;M)[1/2] ≅ (K\_\*(R;M)[1/2])^{C₂} ⊕ W\_\*(R;M)[1/2] after inverting 2; and Theorem 3: for R coherent of global dimension d, GW^q\_{cl,n}(R;M) → GW^s\_{cl,n}(R;M) is injective for n ≥ d + 2 and bijective for n ≥ d + 3, and for 2-torsion-free R with M = R injective for n ≥ d and bijective for n ≥ d + 1, also for form parameters and for right-coherent rings. The fundamental fibre sequence K\_{hC₂} → GW → L of a Poincaré ∞-category, the Hebestreit–Steimle identification of classical with connective genuine Grothendieck–Witt spectra and the two-inverted genuine L-comparison are GN §6.8a and §6.10b and are imported.

Targets: §8.1 Theorem 1: the fibre sequence for classical symmetric Grothendieck–Witt theory; §8.2 The quadratic fibre sequence; §8.3 Karoubi's splitting after inverting 2; §8.4 Theorem 3: quadratic versus symmetric Grothendieck–Witt groups.

Planets: Theorem 1 (fibre sequence), Theorem 3 (quadratic versus symmetric).

### 8.1 Theorem 1: the fibre sequence for classical symmetric Grothendieck–Witt theory

`HK.8/classical-gw-fibre-sequence` · theorem · planet: Theorem 1 (fibre sequence)

For every associative ring R and every duality D = Hom\_R(−,M) on Proj(R) given by an invertible ℤ-module with involution M, there is a natural fibre sequence of connective spectra K(R;M)\_{hC₂} →^{hyp} GW^s\_cl(R;M) → L^short(R;M), where GW^s\_cl(R;M) is the group completion of the groupoid of unimodular M-valued symmetric forms, K(R;M) carries the C₂-action P ↦ DP, and L^short(R;M) := τ\_{≥0}L^gs(R;M) has π\_nL^short(R;M) ≅ L^short\_n(R;M), Ranicki's symmetric L-groups of n-dimensional Poincaré complexes. If 2 ∈ R^×, Ranicki's groups are 4-periodic and equal to the Witt groups, and the sequence is Schlichting's.

**Hypotheses.**

- No hypothesis on R or on 2.

**Proof route.**

- The fundamental fibre sequence K(D^p(R),Q)\_{hC₂} → GW(D^p(R),Q) → L(D^p(R),Q) for Q = Q^gs\_M (GN §6.8a `stableGWFundamentalSquare`).
- K(R;M) is connective, so K(R;M)\_{hC₂} is connective (RefinedTraceMethods RT.2/homotopy-orbits-fixed-points); hence π₀GW^gs → π₀L^gs is onto and τ\_{≥0} preserves the fibre sequence.
- τ\_{≥0}GW^gs(R;M) ≃ GW^s\_cl(R;M) by Hebestreit–Steimle (GN §6.8a `weightHeartGWComparison`), compatibly with hyp.
- π\_nτ\_{≥0}L^gs(R;M) ≅ L^short\_n(R;M) for n ≥ 0 by Theorem 5 (HK.4/ranicki-genuine-symmetric).
- If 2 is a unit all genuine structures agree (HK.0/tate-collapse-criterion), L^s is 4-periodic (HK.1/bordism-invariant-periodicity) and its groups are Witt groups of forms and formations.

**Checks.**

- R = ℤ on π₀: K₀(ℤ)\_{C₂} = ℤ maps to GW^s\_{cl,0}(ℤ) = ℤ⟨1⟩ ⊕ ℤ⟨−1⟩ by 1 ↦ ⟨1⟩ + ⟨−1⟩ (the hyperbolic plane), and the cokernel maps isomorphically to L^short\_0(ℤ) = ℤ by the signature (a,b) ↦ a − b.
- R a field of characteristic ≠ 2: on π₀, GW₀(K) → W(K) is onto with kernel the hyperbolic multiples, the classical Witt sequence.

*Needs:* `HK.4/ranicki-genuine-symmetric`; `HK.0/tate-collapse-criterion`; `HK.1/bordism-invariant-periodicity`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`; `RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`; `StableHomotopyKTheory:H.4/group-completion`.

*Sources:* Calmès et al. III, Theorem 1, p. 2, and its derivation, pp. 3–4: States the fibre sequence K(R;M)\_{hC₂} → GW^s\_cl(R;M) → L^short(R;M) for every ring and derives it from the fibre sequence of Paper II, Hebestreit–Steimle and Theorem 5; notes it is Schlichting's when 2 is a unit.; Calmès et al. II, Corollary 4.4.13, p. 107: The fundamental fibre square of GW, L, K^{hC₂} and K^{tC₂}, hence the fibre sequence K\_{hC₂} → GW → L.

### 8.2 The quadratic fibre sequence

`HK.8/quadratic-gw-fibre-sequence` · theorem

For every ring R and invertible M there is a fibre sequence K(R;M)\_{hC₂} →^{hyp} GW^q\_cl(R;M) → τ\_{≥0}(Σ⁴L^gs(R;M)), where GW^q\_cl is the group completion of unimodular M-valued quadratic forms.

**Hypotheses.**

- No hypothesis on R or on 2.

**Proof route.**

- Apply the fundamental fibre sequence (GN §6.8a) to Q^gq\_M and take connective covers as in HK.8/classical-gw-fibre-sequence.
- τ\_{≥0}GW^gq(R;M) ≃ GW^q\_cl(R;M) by Hebestreit–Steimle (GN §6.8a).
- L^gq(R;M) ≃ Σ⁴L^gs(R;M) by applying HK.1/bordism-invariant-periodicity twice (Σ²L^gs\_M ≃ L^ge\_{−M} and Σ²L^ge\_{−M} ≃ L^gq\_M).

**Checks.**

- R = ℤ: π₀ of the cofibre term is L^gs\_{−4}(ℤ) = L^q\_{−4}(ℤ) = ℤ (signature/8), and GW^q\_{cl,0}(ℤ) = ℤ⊕ℤ is generated by the hyperbolic plane and E₈.

*Needs:* `HK.8/classical-gw-fibre-sequence`; `HK.1/bordism-invariant-periodicity`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Introduction, p. 4: Derives the quadratic fibre sequence with third term τ\_{≥0}Σ⁴L^gs from the general fibre sequence, Hebestreit–Steimle and Σ⁴L^gs ≃ L^gq.

### 8.3 Karoubi's splitting after inverting 2

`HK.8/karoubi-splitting-recovered` · theorem

After inverting 2, polarisation gives GW^q\_cl(R;M)[1/2] ≃ GW^s\_cl(R;M)[1/2], and there is a natural splitting GW^s\_{cl,\*}(R;M)[1/2] ≅ (K\_\*(R;M)[1/2])^{C₂} ⊕ W\_\*(R;M)[1/2], with K\_\* the K-groups with the duality action and W\_\* the 4-periodic Witt groups of symmetric forms (even degrees) and formations (odd degrees), here π\_\*L^s(R;M) in non-negative degrees.

**Hypotheses.**

- Uses the two-inverted comparison L(R;Q^{≥m}\_M)[1/2] ≃ L^s(R;M)[1/2] of GN §6.10b (CDH III Proposition 3.1.14), whose spectrum-level multiplicative input is GN's recorded gap (Paper IV).

**Proof route.**

- Invert 2 in HK.8/classical-gw-fibre-sequence: π\_\*(K\_{hC₂})[1/2] = (K\_\*[1/2])\_{C₂} ≅ (K\_\*[1/2])^{C₂}.
- The fundamental square splits after inverting 2: GW[1/2] ≃ K[1/2]\_{hC₂} ⊕ L[1/2] (Calmès et al. II, Corollary 4.4.14).
- L^gs[1/2] ≃ L^gq[1/2] ≃ L^s[1/2] (GN 6.10.6), so the quadratic and symmetric sequences agree after inverting 2 and the L-term has the 4-periodic Witt groups.

**Checks.**

- R a field of characteristic ≠ 2: GW₀(K)[1/2] ≅ ℤ[1/2] ⊕ W(K)[1/2] via rank/2 and Witt class.

*Needs:* `HK.8/classical-gw-fibre-sequence`; `HK.8/quadratic-gw-fibre-sequence`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6/genuine-l-invert-two-comparison`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Introduction, p. 2: Recalls Karoubi's splitting of symmetric GW after inverting 2 into the invariants of K-theory and the Witt groups, and states that the fibre sequence of Theorem 1 recovers it.; Calmès et al. II, Corollary 4.4.14, p. 107: Gives the natural splitting GW(C,Q)[1/2] ≃ K(C,Q)[1/2]^{hC₂} ⊕ L(C,Q)[1/2].

### 8.4 Theorem 3: quadratic versus symmetric Grothendieck–Witt groups

`HK.8/quadratic-symmetric-gw-comparison` · theorem · planet: Theorem 3 (quadratic versus symmetric)

Let R be coherent of global dimension d and M invertible. Then the polarisation map GW^q\_{cl,n}(R;M) → GW^s\_{cl,n}(R;M) is injective for n ≥ d + 2 and an isomorphism for n ≥ d + 3. If moreover R is commutative and 2-torsion free and M = R, it is injective for n ≥ d and an isomorphism for n ≥ d + 1. The same holds for right-coherent rings of finite right global dimension, and the first statement (ranges d + 2 and d + 3) holds with the Grothendieck–Witt groups of any form parameter in place of quadratic forms.

**Hypotheses.**

- R left-coherent of global dimension d (or right-coherent of right global dimension d).

**Proof route.**

- For n ≥ 0, GW^q\_{cl,n} = GW^gq\_n and GW^s\_{cl,n} = GW^gs\_n (Hebestreit–Steimle, GN §6.8a).
- By HK.7/genuine-comparison-theorem, GW^gq\_n → GW^s\_n is injective for n ≥ d+2 and bijective for n ≥ d+3, and GW^gs\_n → GW^s\_n is bijective for n ≥ d − 1; compose.
- The 2-torsion-free improvement is HK.7/two-torsion-free-improvement.
- Right-coherent rings: HK.7/right-coherent-version; form parameters: HK.7/form-parameter-structures with the same cartesian-square argument.

**Checks.**

- R = ℤ (d = 1, 2-torsion free): bijective for n ≥ 2 and injective at n = 1, matching GN §6.11 (GW^q\_1(ℤ) = (ℤ/2)², GW^s\_1(ℤ) = (ℤ/2)³).
- The source makes no sharpness claim for Theorem 3 itself; HK.7/sharpness-examples concerns the L-theoretic comparisons L^gs → L^s and L^gq → L^s.

*Needs:* `HK.7/genuine-comparison-theorem`; `HK.7/two-torsion-free-improvement`; `HK.7/right-coherent-version`; `HK.7/form-parameter-structures`; `HK.8/classical-gw-fibre-sequence`; `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

*Sources:* Calmès et al. III, Theorem 3, p. 3; Corollary 1.3.10, pp. 30–31; Remarks 1.3.12, 1.3.16 and 1.3.17, pp. 31–32: States the quadratic-to-symmetric comparison for coherent rings of finite global dimension with its 2-torsion-free improvement, and proves it from the L-theoretic comparison, the cartesian squares and the two-degree shift, with right-coherent and form-parameter versions.

### Dependencies

Requires: HK.7, HK.4, HK.1, HK.0, GeometryOfNumbersAndQuadraticArithmetic:GN.6, StableHomotopyKTheory:H.4.

## Gaps

- **G1. Lin's theorem** (HK.5/ring-spectrum-quadratic-comparison). Example 1.2.31 uses Lin's theorem that 𝕊^{tC₂} is the 2-completed sphere, so that Q^s on Mod^ω\_𝕊 is 0-quadratic. RefinedTraceMethods RT.2 plans Tate constructions and their p-completeness for bounded-below spectra (RT.2/tate-p-local-properties) but not the Segal conjecture for C₂; no atlas stage owns it. The node states the consequence conditionally on it.
- **G2. Quoted inputs of the sharpness example** (HK.7/sharpness-examples). The Ranicki–Shaneson splitting L(R[ℤ];Q) ≃ L(R;Q) ⊕ ΣL(R;Q) for Q = Q^gs, Q^s (Ranicki for L^s, Milgram–Ranicki for L^gs, reproved in Paper IV, in preparation), Read's computation for ℤ/4 and Schlichting's 2025 theorem for regular Noetherian domains are quoted, not planned. They concern optimality of the ranges and no other node depends on them.
- **G3. Tate construction of real K-theory** (HK.5/pi0-comparison). The optimality remark uses π\_\*(ko^{tC₂}) = ℤ^∧₂[u^{±1}] with \|u\| = 4. ChromaticHomotopyTheory CH.11/real-k-theory constructs ko but does not compute its C₂-Tate construction; this input is quoted.
- **G4. Form parameters and polynomial functors** (HK.7/form-parameter-structures). The genuine Poincaré structure of a form parameter uses Schlichting's equivalence between form parameters and reduced degree-two polynomial functors on Proj(R) (Calmès et al. I, p. 74, citing Schlichting, Lemma A.16) and the non-abelian derivation of Calmès et al. I, Proposition 4.2.18; neither is planned in the atlas (GN §6.8a derives only the quadratic, even and symmetric cases).
- **G5. Odd genuine L-groups as formation groups** (HK.4/witt-group-computes-L0). Remark 1.2.17 states, without proof, that the odd genuine symmetric L-groups in degrees ≤ 1 are groups of symmetric, even and quadratic formations. GN 6.8 plans formation groups of exact categories (6.8.2) and their loop comparison; the identification with L^gs\_{odd} is not proved in the source and is not planned here.
- **G6. Two-inverted genuine L-comparison** (HK.8/karoubi-splitting-recovered). The splitting after inverting 2 uses L(R;Q^{≥m}\_M)[1/2] ≃ L^s(R;M)[1/2] (CDH III Proposition 3.1.14), which GN §6.10b (6.10.6) plans with an open spectrum-level multiplicative input attributed by the source to Paper IV. The dependency is inherited, not new.

## Supplier requests

- `GeometryOfNumbersAndQuadraticArithmetic:GN.6`: Existing upstream roadmap GeometryOfNumbersAndQuadraticArithmetic (TauCetiRoadmap PR #851, head d63953a), cited as it stands. Layer 6 §6.8a: `PoincareInfinityCategory`, `PoincareObject` with Lagrangians and isotropic surgery, `PoincareSurgeryDatum`, `DerivedCoefficientLine` (invertible modules with involution, CDH I Definition 4.2.2), `PerfectDerivedInfinity` and `perfectDerivedHom`, `symmetricPoincareStructure`, `quadraticPoincareStructure`, `genuinePoincareStructure M m` (the family Q^{≥m}\_M with its identification on projectives), `stableGrothendieckWittSpectrum`, `stableLTheorySpectrum` (with L\_i = L₀(Q[−i]) and integer-shift delooping), `PoincareVerdierSequence`, `stableGWVerdierLocalization`, `additiveHermitianBordification`, `stableGWFundamentalSquare` (the fibre sequence K\_{hC₂} → GW → L), `poincareLinearPart`, `weightHeartGWComparison` (Hebestreit–Steimle, and CDH III Corollary 1.3.15), `symmetricHeartLTheory` (CDH III Corollary 1.3.8); §6.1a C₂-spectra, homotopy orbits, fixed points and Tate; §6.4 exact Witt and GW groups; §6.10a integral L-theory comparisons and calculations over ℤ; §6.10b, 6.10.6 (two-inverted genuine L-comparison). This roadmap plans the general-ring statements of CDH III §1 on top of these carriers; §6.10a's ℤ-statements are special cases.
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`: Existing Tau Ceti roadmap QuadraticFormInvariants Layer 4 (the Witt ring and the fundamental ideal), cited as it stands: the Witt ring W(K) of a field of characteristic ≠ 2, used to identify L^s\_{4k}(K) and the degree-zero Witt groups of fields; current Tau Ceti has `WittRing` (TauCeti/LinearAlgebra/QuadraticForm/Witt/Ring.lean).

## Notes for neighbouring roadmaps

- GeometryOfNumbersAndQuadraticArithmetic: PR #851 §6.8a states CDH III Corollary 1.3.15 (classical symmetric GW of a Dedekind ring is the connective cover of homotopy symmetric GW) with source citation only; its proof runs through Corollaries 1.3.9, 1.3.10 and 1.3.14, i.e. symmetric surgery over coherent rings, which §6.10a uses only for R = ℤ. This roadmap (HK.6–HK.7) plans that chain for general coherent rings. As GN is the lower tier, its reviewers may want to state the Dedekind-ring surgery input in §6.8a or §6.10a rather than leave Corollary 1.3.15 resting on the citation.
- GeometryOfNumbersAndQuadraticArithmetic: PR #851 §6.10a's `integralLTheoryComparisonRanges` and `integralLTheoryCalculations` are the R = ℤ instances of HK.4/quadratic-low-degree-comparison, HK.7/symmetric-comparison-range, HK.7/two-torsion-free-improvement and HK.4/ranicki-genuine-symmetric; no duplication arises because the ℤ statements are specialisations, but a consumer should cite the general nodes here and the ℤ calculations there.
- Proposal (HermitianKTheoryOfPoincareCategories, GeometryOfNumbersAndQuadraticArithmetic): Keep the roadmap id. The red team RT-PAPER-CALMES-ETAL-26/6 (review pending) argues the route is in GN.6's direction and should be a Part II of GeometryOfNumbersAndQuadraticArithmetic; since GN already has a Part II (the dyadic tables), the maintainer may retitle this roadmap 'Geometry of numbers, quadratic forms and homogeneous arithmetic, Part III: algebraic surgery and the flavours of L-theory' with GN as parent. The mathematics and the layer structure are unchanged either way.
- Proposal (HermitianKTheoryOfPoincareCategories, GeometryOfNumbersAndQuadraticArithmeticPartII, KTheoryFiniteLocalFields): Point GeometryOfNumbersAndQuadraticArithmeticPartII DA.0 (integral comparison, field L adapter), DA.1 (symmetric Dedekind tables, characteristic two, sign shifts) at HK.0/tate-collapse-criterion, HK.0/shift-periodicity, HK.1/bordism-invariant-periodicity, HK.4/witt-group-computes-L0, HK.4/controlled-variants, HK.6/low-dimension-witt, HK.7/field-l-groups, HK.7/genuine-comparison-theorem and HK.7/dedekind-comparison; point the KTheoryFiniteLocalFields finite-field foundation gap at HK.7/field-l-groups and HK.1/bordism-invariant-periodicity. The Poincaré carriers themselves stay with GN §6.8a.

