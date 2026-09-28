# Global Galois deformation rings — blueprint

This blueprint covers stages R04.1–R04.6, G7 and G8, within the boundaries of the RS-08 restructure (accepted). This
blueprint now plans **R04.1 (deformation functors)**, **R04.2 (representability and universal representations)** and
**R04.3 (local conditions and global presentations)**, all source-decomposed. The other stages are not yet read.

The sources are all free:
- Gee, *Modularity lifting theorems* (Essential Number Theory 2022; arXiv:2202.05818v2), §3.
- Kisin, *Lectures on deformations of Galois representations*, Lecture 1.
- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*, Invent. Math. 178 (2009); preprint ESI 1892
  (2007), which was read.
- Chenevier, *The p-adic analytic space of pseudocharacters …* (arXiv:0809.0415v2), §3.1.

## Purpose

These layers supply what the global deformation rings of R04.3 and the variable-determinant and polarized problems of
G7–G8 are built from:
- the lifting and deformation functors of a residual representation ρ̄ : G → GL_n(𝔽) of a profinite group;
- their representing rings, for Galois groups G_{F,S} and G_K;
- the universal continuous representation;
- the framed–unframed comparison;
- fixed determinants;
- the separate determinant (pseudorepresentation) functor.

## Ownership (RS-08) and imports

**This roadmap keeps:**
- **R04.1:** the Galois deformation functors themselves, with their equivalence relation and restriction;
- **R04.2:** the arithmetic application of representability to G_{F,S}.

**It imports (requests):**
- **DeformationAndDerivedPatchingAlgebra R03.1:** the coefficient categories Art_𝒪 and C_𝒪, fibre products and small
  extensions, completed tensor products, and residue-field extension.
- **DeformationAndDerivedPatchingAlgebra R03.2:** Schlessinger's criterion, hulls versus representing objects, and the
  generic framed representability construction.
- **ArithmeticGaloisDuality R02.3:** the finiteness behind Φ_p for G_{F,S}.
- **ArithmeticGaloisRepresentations R01.1:** continuous representations over topological local rings.
- **IntegralHeckeAndGaloisDeterminants IHG.0:** Chenevier's determinants (polynomial laws).

**Baseline:**
- Mathlib: `Matrix.GeneralLinearGroup` with `map` and `det`, `IsArtinianRing`, `IsLocalRing`, `IsAdicComplete`,
  `ProfiniteGrp`, `ContinuousMonoidHom`, `MvPowerSeries` and `Algebra.FormallySmooth`.
- Tau Ceti: `TauCeti.ContCohomology.{Z1, B1, H1}`.

## Conventions

- 𝒪 is the ring of integers of a finite extension of ℚ_p, or W(𝔽), with residue field 𝔽.
- **Lifts.** ρ̄ : G → GL_n(𝔽) is continuous. A lift to A is a continuous ρ : G → GL_n(A) with ρ mod m_A = ρ̄.
- **Strict equivalence.** Γ̂_n(A) = ker(GL_n(A) → GL_n(𝔽)), and deformations are lifts modulo Γ̂_n(A)-conjugation. This
  is not GL_n(A)-conjugacy in general.
- **Schur.** ρ̄ is Schur if End_{𝔽[G]}(ρ̄) = 𝔽.
- **Representability is a theorem, not part of any definition.**
- **Tangent spaces.** ad ρ̄ = M_n(𝔽) with the conjugation action, and ad⁰ρ̄ is its trace-zero part.

## Layer R04.1: deformation functors

Library modules: `TauCeti/NumberTheory/GaloisDeformation/{Functors, Determinants}`, namespace
`TauCeti.GaloisDeformation`.

**Definition: the lifting functor** (`Lift`; node `lifting-functor`; planet "Lifting functor"; Gee §3.1, Kisin
(1.1.1)).
- Continuous lifts, functorial in A ∈ Art_𝒪.
- Extended to C_𝒪 by continuity: Lift(A) = lim_k Lift(A/m_A^k).

*API.* `Lift.map`, `Lift.reduce`, `Lift.conj` (the Γ̂_n-action), `Lift.limEquiv`.

*Unit tests.*
- For G = ℤ_p, n = 1 and ρ̄ = 1: Lift(A) ≅ 1 + m_A.
- Lift(𝔽) is a point.
- A non-continuous homomorphism from ∏ℤ/p is excluded.
- Functoriality.

**Definition: module deformations** (`ModDef`, `ModDefFramed`; node `module-deformation-functor`; Kisin (1.1.1)).
- (V_A, ι): V_A a finite free A-module with continuous G-action, and ι : V_A ⊗ 𝔽 ≅ V̄.
- The framed version adds a basis lifting β.

*API.* Base change; `exists_basis_lift`.

*Unit tests.*
- The residue point.
- Rank one.
- The swap non-example for ρ̄ = 1 ⊕ 1, which is not compatible with ι.

**Definition: deformations** (`Def`; node `strict-deformation-functor`; planet "Deformation functor"; Gee
Definition 3.4, Kisin (1.1.2)). Def = Lift/Γ̂_n, defined for every ρ̄.

*API.* `Def.mk`, `Def.mk_eq_mk_iff`, `Def.map`, `Def.toModDef`.

*Unit tests.*
- The residue point.
- n = 1 gives Def = Lift.
- diag(1 + εx, 1) and diag(1, 1 + εx) are distinct strict classes although GL₂-conjugate.

**Lemma: module deformations are strict classes** (node `module-deformations-are-strict-classes`). Choosing bases
lifting β gives Lift ≅ Def^{mod,□} and Lift/Γ̂_n ≅ Def^mod. This is the statement that "the equivalence relation is
strict conjugation".

**Lemma: strict versus full conjugacy** (`strict_of_full`; node `strict-vs-full-conjugacy`). For Schur ρ̄, GL_n(A)-conjugate
lifts are Γ̂_n(A)-conjugate. Divide a by a lift of its scalar reduction. This fails for ρ̄ = 1 ⊕ 1.

**Lemma: restriction** (`Lift.restrict`, `framed_restrict_invariant`; node `restriction-of-deformations`; Gee 3.21).
Take a continuous ι : H → G. Then:
- lifts and strict classes restrict;
- the framed local lift α⁻¹(ρ∘ι)α is invariant under (ρ, α) ↦ (βρβ⁻¹, βα).

**Definition: fixed determinant** (`LiftDet`, `DefDet`; node `fixed-determinant-functors`; Gee §3.18). Take χ lifting
det ρ̄; the condition is det ρ = χ_A, which is stable under strict conjugation.

*Unit tests.*
- For n = 1 the functor is a point.
- The residue point.
- The functor is empty if χ does not lift det ρ̄.

**Construction: change of coefficients** (node `change-of-coefficients`). Take 𝒪 → 𝒪′ with 𝔽 ⊆ 𝔽′. Lifts of
ρ̄ ⊗ 𝔽′ are lifts of ρ̄ as 𝒪-algebras. Schur is preserved; irreducibility is not.

**Definition: determinant deformations** (`DetDef`; node `determinant-deformation-functor`; planet "Determinant
deformations"; Chenevier §3.1). Continuous n-dimensional determinants lifting D̄ = det∘ρ̄. Determinants are imported
from IHG.0. This is a separate functor.

*Unit tests.*
- n = 1 gives Lift_{χ̄}.
- The residue point.
- The functor depends only on the semisimplification of ρ̄.

**Theorem: determinant comparison** (node `determinant-comparison`; planet; Chenevier Example 3.4 via Theorem 2.22).
- ρ ↦ det∘ρ gives a natural transformation Def_ρ̄ → Def_{D̄}.
- It is an isomorphism for absolutely irreducible ρ̄: surjective by Chenevier Theorem 2.22, and injective by Carayol.
- It is not injective in general (Kisin Exercise 3).

**Lemma: tangent spaces** (node `tangent-spaces`; Kisin Lemma 1.3.1, Gee 3.11–3.12).
- Lift(𝔽[ε]) ≅ Z¹(G, ad ρ̄), via φ ↦ (1 + εφ)ρ̄.
- Def(𝔽[ε]) ≅ H¹(G, ad ρ̄).
- The fibres are ad ρ̄/(ad ρ̄)^G-torsors, so dim Lift(𝔽[ε]) = h¹ + n² − h⁰.
- With fixed determinant and p ∤ n, ad is replaced by ad⁰.

## Layer R04.2: representability and universal representations

Library module: `TauCeti/NumberTheory/GaloisDeformation/Representability`.

**Definition: Φ_p** (`PhiP`; node `phi-p-condition`; Gee §3.1). Every open subgroup has finite Hom_cont(·, 𝔽_p).
Equivalently, every open subgroup has a topologically finitely generated maximal pro-p quotient.

*API.* `phiP_iff_fg`, `PhiP.of_open`, `phiP_of_fg`.

*Unit tests.*
- ℤ_p satisfies Φ_p.
- Φ_p passes to open subgroups.
- (∏ℤ/p) ⋊ ℤ/2 (p odd) has Hom(G, 𝔽_p) = 0 but fails Φ_p.

**Theorem: Φ_p for Galois groups** (node `phi-p-global`; Gee §3.1, Kisin (1.2)). G_{F,S} and G_K satisfy Φ_p. The
finiteness of cyclic degree-p extensions unramified outside S is imported from R02.3.

**Theorem: the universal lifting ring** (node `universal-lifting-ring`; planet; Kisin Proposition 1.2.1(1), Gee
Lemma 3.2). Under Φ_p, Lift_ρ̄ is pro-represented by R^□_ρ̄ ∈ C_𝒪, with universal lift ρ^□.

*Proof.* Lifts factor through the maximal pro-p quotient of ker ρ̄, which is topologically finitely generated by Φ_p.
Lift satisfies Schlessinger's conditions exactly (imported from R03.2), and its tangent space Z¹ is finite.

**Construction: the universal continuous lift** (`univLift`, `liftEquivHom`; node `universal-continuous-lift`).
ρ^□ : G → GL_n(R^□) = lim GL_n(R^□/m^k). For A ∈ C_𝒪, continuous lifts correspond to maps R^□ → A.

*Unit tests.*
- For n = 1, ρ̄ = 1: the tautological character into 𝒪[[G^{ab,(p)}]].
- ρ^□ reduces to ρ̄.
- R^□ need not be Artinian.

**Theorem: the universal deformation ring** (node `universal-deformation-ring`; planet; Kisin 1.2.1(2), Gee Lemma 3.5).
Under Φ_p and Schur, Def_ρ̄ is pro-represented by R_ρ̄.

*Proof.* The tangent space H¹ is finite. H4 holds because centralisers of lifts are scalars.

**Theorem: framed versus unframed** (node `framed-unframed-comparison`; planet; Gee Exercise 3.9, Kisin 1.2.2(3)). For
Schur ρ̄:
- R^□ ≅ R[[X_{ij}]]/(X_{11}), with n² − 1 variables and ρ^□ = (1 + X)ρ^univ(1 + X)⁻¹;
- the map is formally smooth;
- the same holds with fixed determinant.

**Theorem: Carayol** (`strictly_conj_of_trace_eq`; node `carayol-trace-theorem`; planet; Kisin Theorem 1.4.1, Gee
Lemma 3.7). For absolutely irreducible ρ̄:
- centralisers of lifts are scalars;
- equal traces imply strict conjugacy;
- descent to a subring containing the traces;
- R_ρ̄ is topologically generated by traces.

**Theorem: fixed-determinant rings** (node `fixed-determinant-rings`; Gee 3.18–3.19). R^□_{ρ̄,χ} and R_{ρ̄,χ} are the
quotients by det − χ. When p ∤ n:
- R^□_ρ̄ ≅ R^□_{ρ̄,χ} ⊗̂ 𝒪[[G^{ab,(p)}]], via ρ ↦ (ρ ⊗ ψ⁻¹, ψ) with ψ = (χ⁻¹ det ρ)^{1/n};
- fixed-determinant rings for different χ are isomorphic.

This fails for p | n: take p = n = 2 and G = ℤ₂.

**Lemma: change of residue field** (node `change-of-residue-field`). R^□_{ρ̄⊗𝔽′,𝒪′} ≅ R^□_{ρ̄,𝒪} ⊗̂_𝒪 𝒪′. The same holds
for the unframed rings when ρ̄ is Schur, and with fixed determinant.

## Layer R04.3: local conditions and global presentations

Library module: `TauCeti/NumberTheory/GaloisDeformation/Global`.

RS-08 keeps for this layer:
- the global ring with prescribed local rings and its local-to-global presentation;
- the maps from the R08.1 local rings;
- tangent and obstruction spaces via adjoint cohomology with local conditions;
- the KW II §4 dimension and relation bounds.

Imports: the Selmer complex, Poitou–Tate duality and the numerical inequalities from ArithmeticGaloisDuality
R02.4–R02.6, and the local rings from LocalGaloisDeformationRings R08.1.

**Definition: local deformation problems** (`DeformationProblem`; node `local-deformation-problem`; Gee Definition 3.16).
These are the Clozel–Harris–Taylor axioms: closure under pushforward, detection along injections, fibre products and
limits, and Γ̂_n-stability.

*Unit tests.*
- The unrestricted problem.
- The residual point belongs to every problem.
- A condition that is not conjugation-stable is not a problem.

**Lemma: problems are invariant ideals** (node `deformation-problem-ideal`; Gee Lemma 3.17).
- D ↔ I(D), a Γ̂_n-invariant radical ideal of R^□.
- L(D) ⊆ H¹(G_v, ad ρ̄) is the annihilator of I(D).

**Definition: global deformation data** (`DeformationType`, `TFramedDef`; node `global-deformation-type`; Gee
Definition 3.21, KW II §4.1).
- 𝒮 = (S, {D_v}, χ), with framings at T ⊆ S.
- The classes are (ρ, {α_v}) ∼ (βρβ⁻¹, {βα_v}).

**Theorem: representability** (node `global-framed-ring`; planet; Gee Lemma 3.22). R^□T_𝒮 exists for absolutely
irreducible ρ̄. For T = ∅ it is written R^univ_𝒮.

**Construction: the map from local rings** (`Rloc`, `locToGlobal`; node `local-to-global-map`; Gee §3.23).
R^loc_{S,T} = ⊗̂_{v∈T} R^□_{ρ̄|G_v,χ}/I(D_v) maps to R^□T_𝒮 via α_v⁻¹ρ^□T|_{G_v}α_v.

**Theorem: the relative tangent space** (node `relative-tangent-space`; planet; Gee Proposition 3.24(1), KW II preprint
Lemma 4.3).
- The relative tangent space is H¹_{S,T}(G_{F,S}, ad⁰ρ̄), for the cone complex with framings at T and conditions L(D_v)
  at S ∖ T.
- Its dimension is #T − Σ_{v|∞} h⁰ + Σ_{S∖T}(dim L − h⁰) + h¹_{S,T}(ad⁰(1)) − h⁰(ad⁰(1)).
- For p = 2 the trace-zero module and its dual differ, which is KW's δ_p.

**Theorem: the presentation** (node `local-to-global-presentation`; planet; KW II preprint Lemma 4.5, Gee
Proposition 3.24(2)).
- R^□T_𝒮 ≅ R^loc[[x₁, …, x_g]]/J, with g = h¹_{S,T}(ad⁰).
- r(J) ≤ h¹_{S,T}(ad⁰(1)), via the obstruction pairing Σ_v inv(x_v ∪ a_v + z_v).

**Theorem: the dimension bound** (node `global-dimension-lower-bound`; planet; Gee Proposition 3.24(3), KW II preprint
Proposition 4.4).
- Krull dim R^univ_𝒮 ≥ 1 + Σ_v (dim R_v/I(D_v) − n²) − Σ_{v|∞} h⁰ − h⁰(ad⁰(1)).
- With KW II's data this gives dimension ≥ 1.

*Version note.* RS-08 cites KW II Proposition 4.5 and Corollary 4.7 in the published numbering. The free ESI preprint read
here numbers the relation bound Lemma 4.5 and the dimension bound Proposition 4.4. The correspondence with the published
numbering was not checked.

## Acceptance for R04.1–R04.2

- **Functors:** the functors are defined without representability.
- **Equivalence:** strict equivalence is proved to be the module-deformation equivalence. It is shown to differ from
  GL_n-conjugacy for non-Schur ρ̄.
- **Restriction:** framed restriction is invariant.
- **Representing rings:** they exist for G_{F,S} under Φ_p (lifts) and under Schur (deformations).
- **Framed–unframed comparison:** there are n² − 1 variables, with and without fixed determinant.
- **Determinants:** the determinant functor is separate, and its comparison is proved only for absolutely irreducible
  ρ̄.

## Mistakes found in the sources

**E1 (misprint, reaches nothing): Kisin, Lecture 1, (1.2).** The notes say that Φ_p "is equivalent to asking that
Hom(G, 𝔽_p) is finite dimensional". The correct condition is finiteness of Hom(G′, 𝔽_p) for every open G′, as the same
notes' Exercise 1 states.

Counterexample: (∏ℤ/p) ⋊ ℤ/2 (p odd, acting by inversion) has Hom(G, 𝔽_p) = 0, but its index-2 subgroup does not
satisfy the finiteness.

## Remaining work

- **R04.4:** restriction, twisting and change of problem.
- **R04.5:** Taylor–Wiles primes.
- **R04.6:** exports for patching.
- **G7 and G8:** the polarized and variable-determinant problems of ACC+ §6.2.

## Sources

- T. Gee, *Modularity lifting theorems*, Essential Number Theory 1 (2022), 73–126; arXiv:2202.05818v2.
- M. Kisin, *Lectures on deformations of Galois representations*, Lecture 1, notes on the author's Harvard page.
- G. Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over
  arbitrary rings*, in Automorphic Forms and Galois Representations 1, LMS LNS 414 (2014); arXiv:0809.0415v2.
