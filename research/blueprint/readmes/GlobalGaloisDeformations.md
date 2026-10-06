# Global Galois deformation rings — blueprint

**Area fix, round 3, 6 October 2026 — Claude claude-c9TlsS, Refs #5870 (FIX-RT-AREA-langlands-2~3).**
The determinant comparison is now divided between its two layers: the determinant map and its
non-injectivity stay in R04.1, and the isomorphism for absolutely irreducible ρ̄, which uses Carayol's
theorem, is the new R04.2 node `determinant-comparison-isomorphism` (67 nodes). No R04.1 declaration
has a prerequisite in R04.2 any more, and the gap that recorded this is closed. The relative-tangent
constant in this document is #T − 1, as in the packet (corrected by the fix of 2 October). The
earlier area-2 fixes (/15, /22, /37) are unchanged. An independent REV-FIX-RT-AREA-langlands-2~3
checks this round.

**Confirmed red-team fixes proposed, 2 October 2026 — Codex codex-a71f92, Refs #5719.**
Findings /1–/3 are addressed below and in the native prototypes. All 66 stable node IDs,
19 open supplier requests, existing source issues and the stage-coarsening gap are retained.
The packet is still partial and unchecked; independent REV-FIX must accept these changes.
The full Mathlib-only suggested file now elaborates at the pin with only admitted-proof warnings.

Historical revision notes (not claims of acceptance of this fix):

**Fix revision, 30 September 2026 — Codex codex-5ebb6f, Refs #5142.** Independent REV-FIX is pending; the earlier accepted review is preserved verbatim in reviewHistory. All 65 node IDs, 19 requests, three source issues and unchecked statuses remain. One newly explicit gap records a pre-existing stage-coarsening obstruction; no mathematical proof cycle is alleged. This revision sharpens the R01.4 finite-image request, the version-specific presentation locators and G8’s arithmetic export to PA.3. No atlas edge or upstream Tau Ceti roadmap has been edited.

This blueprint covers stages R04.1–R04.6, G7 and G8, within the boundaries of the RS-08 restructure (accepted). This
blueprint now plans **R04.1 (deformation functors)**, **R04.2 (representability and universal representations)**,
**R04.3 (local conditions and global presentations)**, **R04.4 (restriction, twisting and change of problem)** and
**R04.5 (Taylor–Wiles auxiliary primes)**, **R04.6 (exports for patching)**, **G7 (polarized problems)** and **G8
(variable-determinant problems)**. All eight coverage records are source-decomposed with open supplier requests; the stage-coarsening gap of the earlier rounds is closed by the division of the determinant comparison described above. The whole packet is partial.

The second-round Langlands-area fix adds one shared selection lemma, giving 66 nodes.
Its accepted `REV-FIX-RT-AREA-langlands-1~2` is retained in reviewHistory; that acceptance
is historical and does not certify this fix. The current area-2 needs-changes review is also
preserved verbatim, including its still-open PA.3 stage-input handoff. Source decomposition still depends on the
open supplier requests and does not assert proof closure or formalization.

The sources are all free:
- Gee, *Modularity lifting theorems* (Essential Number Theory 2022; arXiv:2202.05818v2), §3.
- Kisin, *Lectures on deformations of Galois representations*, Lecture 1.
- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*, Invent. Math. 178 (2009): the authors' final
  version (May 2009, on Khare's UCLA page, with the published numbering) and the earlier preprint ESI 1892 (2007).
- Barnet-Lamb, Gee, Geraghty and Taylor, *Potential automorphy and change of weight* (arXiv:1010.2561v4), Lemma 1.2.3.
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
lifts are Γ̂_n(A)-conjugate. Here A is an imported Art_𝒪/C_𝒪 object with its genuine residue map. Divide a by a UNIT lift
of its scalar reduction: locality, not mere surjectivity, makes that lift a unit. The native
signature explicitly requires IsLocalRing A, π surjective and ker π=m_A. This fails without
Schur, and it can fail over a nonlocal ring even with Schur (the integral S₃ regression below).

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

**Theorem: the determinant map** (node `determinant-comparison`; planet; Chenevier Example 3.4, Kisin Exercise 3).
- ρ ↦ det∘ρ gives a natural transformation δ : Def_ρ̄ → Def_{D̄}, compatible with change of coefficients and with
  restriction to a closed subgroup. It is well defined on strict equivalence classes because det(aρa⁻¹) = det ρ.
- It is not injective in general: for ρ̄ = (χ₁ b; 0 χ₂) a non-split extension with dim Ext¹(χ₂, χ₁) > 1 and a class e
  outside the line 𝔽·[b], the deformation (χ₁ b + εe; 0 χ₂) to 𝔽[ε] has the determinant of the constant deformation and
  is not strictly equivalent to it (Kisin Exercise 3). Conjugation by 1 + εA moves the class only inside 𝔽·[b], so the
  failure of injectivity is measured in Ext¹(χ₂, χ₁)/𝔽·[b].
- No irreducibility hypothesis is made here, and the node has no prerequisite in R04.2. That δ is an isomorphism for
  absolutely irreducible ρ̄ is the R04.2 theorem `determinant-comparison-isomorphism`.

**Lemma: tangent spaces** (node `tangent-spaces`; Kisin Lemma 1.3.1, Gee 3.11–3.12).
- Lift(𝔽[ε]) ≅ Z¹(G, ad ρ̄), via φ ↦ (1 + εφ)ρ̄.
- Def(𝔽[ε]) ≅ H¹(G, ad ρ̄).
- The fibres are ad ρ̄/(ad ρ̄)^G-torsors, so dim Lift(𝔽[ε]) = h¹ + n² − h⁰.
- With fixed determinant and p ∤ n, ad is replaced by ad⁰.

## Layer R04.2: representability and universal representations

**Theorem: the determinant map is an isomorphism for absolutely irreducible ρ̄** (node
`determinant-comparison-isomorphism`; Chenevier Example 3.4 via Theorem 2.22(i), with Carayol's theorem below).
- Let ρ̄ be absolutely irreducible. Then δ : Def_ρ̄ → Def_{det∘ρ̄} of R04.1 is an isomorphism of functors on Art_𝒪,
  and on C_𝒪 by passage to the limit; when R_ρ̄ exists it also represents the determinant deformation functor, with
  universal determinant det∘ρ^univ.
- Surjectivity. For A Artinian (hence henselian) and a continuous determinant D lifting det∘ρ̄, whose residue is
  split and absolutely irreducible, Chenevier's Theorem 2.22(i) gives ρ_D : A[G] → M_n(A) with det∘ρ_D = D. Its
  reduction has determinant det∘ρ̄ and is conjugate to ρ̄ by the uniqueness part of the same theorem over 𝔽; conjugate
  by a lift of that matrix. Continuity: ρ_D(A[G]) = M_n(A) by Burnside and Nakayama, and ρ_D(g) is determined through
  the perfect trace pairing by finitely many functions g ↦ tr ρ_D(g g_i), which are coefficients of D.
- Injectivity. Equal determinants give equal traces, and Carayol's theorem, part (2), gives strict equivalence.
- Dependencies: `determinant-comparison` (R04.1), `carayol-trace-theorem`, `universal-deformation-ring`, and
  Chenevier's determinants from IntegralHeckeAndGaloisDeterminants IHG.0 (requested).
- Acceptance: for ρ̄ = χ₁ ⊕ χ₂ the theorem does not apply, and the R04.1 node gives the failure of injectivity.

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
Lemma 3.7). For absolutely irreducible ρ̄ over a complete Noetherian LOCAL R∈C_𝒪 with its genuine residue map:
- centralisers of lifts are scalars;
- equal traces imply strict conjugacy;
- descent to a subring containing the traces;
- R_ρ̄ is topologically generated by traces.

The native trace signature spells out locality, Noetherianity, maximal-ideal adic completeness,
surjectivity and ker π=m_R. A separate Artinian-local signature matches Kisin Theorem 1.4.1;
it does not replace the correctly scoped C_𝒪 packet statement. Closed-subring descent also
requires S∈C_𝒪 and m_S=m_R∩S, as Gee states. The raw `Lift` carrier does not supply these hypotheses.

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
- The relative tangent is H¹(Crel), where Crel is Gee's MODIFIED degree-zero complex,
  Cone(res)[−1], with full ad globally and at framed places in degree zero, not the
  ordinary trace-zero cone. Its complete terms and signs are specified below.
- For T nonempty, p>2, p∤n, finite S,T and T containing all p-adic places, its dimension is
  #T − 1 − Σ_{v|∞} h⁰ + Σ_{S∖T}(dim L − h⁰) + dim H¹dual − h⁰(ad⁰(1)).
  This propagates the packet's EXISTING confirmed E3 correction, not a newly found source error.
  H¹dual is the ordinary dual Selmer restriction kernel, not the framed complex's H¹.
- For T empty, H⁰rel=k and H¹rel is the ordinary fixed-determinant Selmer kernel. The displayed
  Euler formula's T⊇{v|p} assumption cannot simply be dropped.
- For p = 2 the trace-zero module and its dual differ, which is KW's δ_p; keep its separate
  source conventions and the existing dyadic supplier consumers.

**Theorem: the presentation** (node `local-to-global-presentation`; planet; KW II preprint Lemma 4.5, Gee
Proposition 3.24(2)).
- R^□T_𝒮 ≅ R^loc[[x₁, …, x_g]]/J, with g = h¹_{S,T}(ad⁰).
- r(J) ≤ h¹_{S,T}(ad⁰(1)), via the obstruction pairing Σ_v inv(x_v ∪ a_v + z_v).

**Theorem: the dimension bound** (node `global-dimension-lower-bound`; planet; Gee Proposition 3.24(3), KW II preprint
Proposition 4.4).
- Krull dim R^univ_𝒮 ≥ 1 + Σ_v (dim R_v/I(D_v) − n²) − Σ_{v|∞} h⁰ − h⁰(ad⁰(1)).
- With KW II's data this gives dimension ≥ 1.

*Version note.* RS-08 cites KW II Proposition 4.5 and Corollary 4.7 in the published numbering. The authors' final
version (checkpoint 3) confirms the correspondence: the preprint's Proposition 4.4 (dimension ≥ 1) is Proposition 4.5, and
its Lemma 4.5 (the relation bound) is Lemma 4.6. Corollary 4.7 (a point over a finite extension once R̄^ψ_S is finite over
ℤ_p) combines the dimension bound with DeformationAndDerivedPatchingAlgebra R03.4's lemma. It is applied in
PotentialModularityAndCompatibleSystems R24.2 and is recorded in `global-dimension-lower-bound` rather than planned twice.

## Layer R04.4: restriction, twisting and change of problem

Library modules: `TauCeti/NumberTheory/GaloisDeformation/{Global, Twisting, GroupAction, InertiaRigid}`.

RS-08 keeps for this layer restriction, twisting, determinant changes and inertial rigidifications, with nontrivial
stabilisers and dyadic actions tracked. Its sources are KW II's final version, §§2.4–2.7, 4.1, 5.1–5.2 and the proof of
Proposition 9.3, together with Gee 3.25–3.26 and BLGGT Lemma 1.2.3.

**Construction: restriction to a finite extension** (`resRing`; node `restriction-ring-map`; Gee §3.25, KW II §10.1).
- Restricting along G_{F′,S′} → G_{F,S} gives framed and fixed-determinant ring maps.
- It gives unframed maps when ρ̄|G_{F′} is absolutely irreducible.
- It gives maps between the rings with local conditions when the local problems are compatible under restriction (KW II's
  γ).

*Unit tests.*
- The identity.
- Composites.
- A non-flat restriction map.

**Theorem: finiteness under restriction** (node `restriction-finiteness`; planet; Gee Proposition 3.26, BLGGT
Lemma 1.2.3(1)). For Σ ⊆ Γ open with ρ̄|Σ absolutely irreducible, R^univ_ρ̄ is finite over R^univ_{ρ̄|Σ}.

*Proof.*
- The image of Γ modulo 𝔪_{R_Σ} is finite.
- The traces of its m elements are killed by a power of f(T) = ∏(T − Σζ_i).
- Traces generate R (Carayol), so R/𝔪R is finite.
- Nakayama finishes the proof.

*Finite, not flat.* Take p odd and Γ = ℤ_p ⋊ {±1}, with Σ = ℤ_p and n = 1. Then Γ^{ab,(p)} = 1, so the map is
𝒪⟦Y⟧ → 𝒪 with Y ↦ 0. KW II Theorem 10.1 (descent of finiteness over 𝒪) uses this node, and it stays in
PotentialModularityAndCompatibleSystems R24.1, as RS-08 assigns it.

**Lemma: enlarging S** (node `enlarging-ramification`; KW II §2.1 and Proposition 5.11).
- R_{S′} ↠ R_S is a closed immersion, with kernel generated by the entries of ρ^univ(σ) − 1 for σ in inertia at
  S′ ∖ S.
- Taylor–Wiles places are the case of the augmentation ideal of 𝒪[Δ′_Q].

**Lemma: twisting and change of determinant** (node `change-of-determinant`; KW II Lemma 7.10, BLGGT Lemma 1.2.3(2)).
- μ ⊗ − gives R_{ρ̄,χ} ≅ R_{μ̄ρ̄,μⁿχ}.
- For n = 2 and p odd, every residually trivial change of determinant is a twist.
- For p = 2 it is not. The character of ℚ(i)/ℚ is not the square of a residually trivial character, because ℚ(i) lies in
  no cyclic quartic field. KW II Lemma 7.10 changes the determinant after solvable base change, using Grunwald–Wang, and
  stays with its consumer.

**Definition: diagonalizable groups** (`DiagGroup`; node `diagonalizable-groups`; KW II §2.5, Proposition 2.8).
- (a)*(A) = Hom(a, 1 + 𝔪_A), for a with p-power torsion.
- T = Ĝ_m^t, and T_{p^m} ≅ T after truncation at level m + 1.

*Unit tests.*
- (ℤ)* = 1 + 𝔪.
- (1 + X)² − 1 ∈ (2, X)², proved in Lean.
- Torsion prime to p gives the trivial group.

**Theorem: quotients by free actions** (node `free-action-quotient`; planet; KW II Propositions 2.5–2.6).
- For G smooth and acting freely, the orbit functor is represented by the invariants.
- X → O is smooth, with t_O = t_X/t_G, and X ≅ O × G.
- The same holds for free diagonalizable actions, with quotients in stages.
- The finite diagonalizable case is requested from Tau Ceti ModularCurves 0C.

**Lemma: truncated actions** (node `truncated-actions`; KW II Proposition 2.7). Compatible free action chunks assemble to
a free action on the limit. This is how the 2-adic patched ring acquires its free torus action.

**Construction: the twisting action** (`twistAction`, `twistAut`, `Lift.twist`; node `twisting-action`; planet; KW II
§5.1).
- G*_V acts on R^□_{S∪V} (determinant fixed on S) by ρ ↦ χ ⊗ ρ, trivially on frames.
- For p = 2, G*_{V,2} preserves the fixed-determinant ring.
- Finiteness of G_V is requested from ClassFieldTheory Layer 12.

*Unit tests.*
- The identity.
- det(c • M) = c² det M, proved in Lean.
- For p odd, twisting does not preserve the fixed determinant.

**Lemma: freeness and stabilisers** (node `twist-action-free`; KW II Lemma 5.1). For p = 2 and non-solvable image, no lift is
equivalent to a non-trivial twist, so every stabiliser is trivial.
- The proof replaces Dickson's theorem by a direct argument that ρ̄|ker χ is absolutely irreducible.
- Stabilisers are not trivial in general: an induced ρ = Ind θ is fixed by ε_{K/F} through diag(1, −1) ≡ 1 mod 2. The
  matrix identity is checked in Lean.

**Definition: determinant fixed only on S** (`RdetOnS`, `detMap`; node `determinant-fixed-on-S`; planet; KW II §4.1.1
and p. 86).
- These are R^□_{S∪V} ⊇ R^{□,ψ}_{S∪V}, cut out by d = 1, where d(ρ) = det ρ · (ψχ_p)^{−1} ∈ G*_V and d(χ ⊗ ρ) = χ²d(ρ).
- They are Newton–Thorne's R′_Q.

*Unit tests.*
- G_V = 1.
- The fibre over 1.
- The twisting map is not injective for p = 2.

**Theorem: the determinant torsor** (node `determinant-twist-torsor`; planet; KW II Lemma 9.4). Suppose T = Ĝ_m^γ acts
freely on X′ and d(λx) = λ²d(x). Then:
- X′ → X′/T is smooth of relative dimension γ;
- d^{−1}(1) → X′/T is a T[2]-torsor;
- so dim R = dim R^inv = dim R′ − γ.

This is Newton–Thorne's item 60.

**Theorem: inertia-rigid rings** (node `inertia-rigid-deformations`; planet; KW II Propositions 2.10–2.11).
- Take G with a finite normal subgroup I and G/I ≅ ℤ̂. Every component of the ring of lifts with determinant φ and
  inertia conjugate to ρ₀|I is flat of absolute dimension d², with regular generic fibre.
- The points are exactly those lifts.
- Excellence and equidimensionality are requested from DeformationAndDerivedPatchingAlgebra R03.3.

## Layer R04.5: Taylor–Wiles auxiliary primes

Library module: `TauCeti/NumberTheory/GaloisDeformation/TaylorWiles`.

RS-08 keeps the actual Chebotarev prime existence, with prescribed congruences, eigenlines and image hypotheses. It
instantiates ArithmeticGaloisDuality R02.6's conditional dual-Selmer calculation, and never the reverse. The sources are
KW II §5 (final version) and Gee §5.6–5.10. The case p > 2 and the case p = 2 are kept separate, as in KW II.

**Definition: Taylor–Wiles data** (`TaylorWilesDatum`; node `taylor-wiles-datum`; Gee §5.6, KW II Lemma 5.3).
- Q is disjoint from S, with N(v) ≡ 1 mod p^N and distinct eigenvalues of ρ̄(Frob_v).
- A chosen eigenvalue α_v (an eigenline) is part of the datum.
- Δ_Q = ∏ (k(v)^×)_p, and there is no condition at Q.

**Definition: the image hypotheses** (node `image-hypotheses`). Three hypotheses are kept distinct:
- cyclotomic absolute irreducibility (KW II, p > 2);
- Im ρ̄ ⊇ SL_2(𝔽_p) with p ≥ 5 (Gee);
- non-solvable image (KW II, p = 2).

The residual-image predicates themselves belong to ArithmeticGaloisRepresentations G7.
GlobalGaloisDeformations G7 verifies the enormous-image application below. Dihedral
ρ̄ induced from F(√p*) is absolutely irreducible but fails the first hypothesis.

**Lemma: shared Chebotarev selection** (node `chebotarev-selmer-selection`).
Given a finite-dimensional space H of cohomology classes with linear localization maps,
assume each nonzero class has a detecting Frobenius conjugacy class in a finite Galois
extension, outside a finite exceptional set. The class must impose all required
congruence and eigenvalue conditions. Also require a nonempty admissible class for
padding, even when H is zero. Then for any finite forbidden set B and q ≥ dim H,
choose exactly q distinct admissible places outside B at which joint localization is
injective. The places may all have degree one over Q.

This factors the selection argument of ACC+ Lemma 6.2.32 (published pp. 1045–1046)
through the existing Chebotarev Layer 10. Positive density survives finite avoidance.
Primes of residue degree at least two have bounded prime sum, bounded by [F:Q]
times the rational-prime sum with exponent 2s, hence density zero; removing them
preserves infinitely many detecting primes. Choose a nonzero vector in the current
kernel and a detecting prime to reduce its dimension strictly; after at most dim H
steps, pad to q. R02.6/D8 supply the cohomological kernel interpretation. The odd-p
and enormous-image nodes separately verify their detecting-element hypotheses and
reuse this one selection argument; the dyadic source-specific construction remains
separate.

*Acceptance.* Two independent coordinate detections kill a two-dimensional H;
one repeated detection leaves a kernel. H = 0 permits Q = ∅ when q = 0, but does
not itself supply padding primes. Finite avoidance must include primes over the
discriminant of an auxiliary quadratic field before degree one implies splitting.

**Lemma: local cohomology at Taylor–Wiles places** (node `taylor-wiles-local-cohomology`; KW II Lemma 5.4, Gee p. 39).
- h¹(G_v, ad⁰) = 2.
- H¹(G_{k(v)}, ad⁰(1)) ≅ 𝔽 via π_v ∘ φ(Frob_v) ∘ i_v. The eigenvalue computation is checked in Lean.
- For p = 2, classes with values in Ad⁰/Z are invisible (Diamond). In Lean: tr 1 = 0 in characteristic two.

**Theorem: Taylor–Wiles primes, p odd** (node `odd-taylor-wiles-primes`; planet; KW II Lemma 5.3, Gee Proposition 5.10).
- For every N there is Q_N of fixed size r whose dual Selmer group vanishes.
- R02.6 supplies the exact inflation–restriction vanishing. Gee's p≥5 SL₂ branch may use
  irreducibility/spanning of the WHOLE adjoint. KW's cyclotomic branch instead uses R01.4's
  constituent-by-constituent detector, including permitted induced/dihedral images.
- KW's p=3 case uses Lemmas 5.2(1) and 5.3 and their indicated argument, not Taylor's l>3
  cyclotomic-degree vanishing step. These are explicit open supplier contracts, not hidden proofs.
- Both variants retain the shared R04.5 selection lemma for finite avoidance and exact cardinality.
  KW may take r=0; Gee's maximum bound can require padding even when dual Selmer is zero.

**Theorem: generator counts** (node `taylor-wiles-generator-count`; KW II Proposition 5.5, Gee Proposition 5.10). There
are |Q_N| + |S| − 1 generators in KW II's conventions, or #T − 1 − [F : ℚ] + r in Gee's. The conventions are kept
apart.

**Lemma: dyadic linear disjointness** (node `dyadic-linear-disjointness`; KW II Proposition 5.6 and Lemmas 5.7–5.9).
- Kummer degrees.
- F_{n₀}(y_{n₀}^{1/4})/F is dihedral of degree 8.
- F̃_n/F_n is cyclic of degree 2^{n−1}.
- L_n and F̃_n are disjoint.
- In Lean: R₄ = 8X⁴ − 8X² + 1.

**Theorem: Taylor–Wiles primes, p = 2** (node `dyadic-taylor-wiles-primes`; planet; KW II Lemma 5.10).
- #Q_n = h¹(S, Ad) − 2, and v splits in F̃_n.
- R^□_{S∪Q_n} has 2 + 2|Q_n| − 1 generators.
- G_n/2^{n−2} ≅ (ℤ/2^{n−2})^t with t = 2 − |S| + |Q_n|.

**Theorem: inertia at Taylor–Wiles places** (node `taylor-wiles-inertia-action`; KW II Proposition 5.11 and Lemma 5.12).
- ρ^univ|D_v = γ_{α_v} ⊕ γ_{β_v}, which gives an 𝒪[Δ_Q]-algebra whose augmentation quotient is R_S.
- For p = 2, a_χ ∘ δ = χ(δ)(δ ∘ a_χ).

**New requests:**
- Tau Ceti Chebotarev Layer 10.
- ArithmeticGaloisRepresentations R01.4: Dickson, H¹(SL_2(𝔽_{2^r}), Ad) = 0, and the exact
  odd-p source-specific constituent detector, including KW's p=3 case without assuming
  whole-adjoint irreducibility.

## Layer R04.6: arithmetic exports for patching

Library module: `TauCeti/NumberTheory/GaloisDeformation/Exports`.

RS-08 keeps the export of the actual global rings and universal representations to the R-to-Hecke maps. Global finiteness
over 𝒪 stays in PotentialModularityAndCompatibleSystems R24.1. Hecke algebras, the maps to them and patching are
GL2ModularityLifting R22.1, R22.3 and R22.6. The source is KW II §9 (final version).

**Definition: KW II's deformation data** (node `kw-deformation-data`; planet).
- S = Σ ∪ {∞} ∪ {p}, with semistable conditions (with γ_v) away from p, odd conditions at ∞ (the explicit ring at p = 2),
  and types (A), (B) and (C) at p.
- R̄^{□,loc,ψ}_S is a flat domain of relative dimension 3|S| with regular generic fibre.
- The local rings are requested from LocalGaloisDeformationRings R08.6.

**Construction: trace subring and universal representation** (node `trace-subring-universal-representation`).
- R̄^ψ_S is the trace subring, and R̄^{□,ψ}_S = R̄^ψ_S⟦4|S| − 1⟧.
- ρ̄^univ descends by Carayol.

**Theorem: factorisation through local conditions** (node `factorization-through-local-conditions`; planet). A
representation over a reduced, 𝒪-flat, finite A whose 𝒪′-points satisfy the local conditions factors through R̄^ψ_S.
This is the deformation half of KW II Lemma 9.1.

**Construction: the Taylor–Wiles system** (node `taylor-wiles-deformation-system`; planet).
- B⟦x_1, …, x_{h+j−d}⟧ ↠ R̄^{□,ψ}_{S∪Q_n} ↠ R̄^{□,ψ}_S, with y_i ↦ δ_i − 1 and framing variables.
- The specialisations recover R̄^{□,ψ}_S and R̄^ψ_S.

**Theorem: patching numerology** (node `patching-numerology`).
- 1 + d + (h + j − d) = 1 + h + j.
- For p = 2, 2h + 1 = h + j + t − d.
- Both identities are checked in Lean.

**Construction: dyadic patching data** (node `dyadic-patching-data`). At level n:
- R′_n with determinant fixed on S;
- ℤ^t ↠ G′_n;
- d_n, with d_n(λρ) = λ²d_n(ρ);
- the free twisting action and the presentation with 2h + 1 generators.

## Layer G8: variable-determinant problems

Library module: `TauCeti/NumberTheory/GaloisDeformation/VariableDeterminant`. The source is ACC+ §6.2 (arXiv v2). ρ̄ is
absolutely irreducible and p ∤ 2n.

**Definition: global deformation problems with variable determinant** (node `variable-determinant-problem`; planet). This
is ACC+ Definition 6.2.2: coefficients Λ = ⊗̂Λ_v; local problems are quotient-representable and stable under strict
conjugation; the determinant is not fixed.

**Theorem: representability and framing** (node `variable-determinant-representability`). ACC+ Theorem 6.2.3 and Lemma
6.2.4. The framed ring has n²|T| − 1 extra variables, because scalars centralise.

**Theorem: presentation** (node `variable-determinant-presentation`; ACC+ Proposition 6.2.24).
- Over R^{T,loc}_𝒮 in g = h¹_{𝒮,T}(ad ρ̄) variables, for T nonempty.
- The formula uses ad ρ̄, not ad⁰ρ̄, and includes the term h⁰(F_S/F, ad ρ̄(1)).

**Theorem: fixed against variable determinant** (node `fixed-versus-variable-determinant`).
- The quotient map R_𝒮 ↠ R_{𝒮_χ} always exists.
- For p ∤ n and twist-stable local problems, R_𝒮 ≅ R_{𝒮_χ} ⊗̂ 𝒪⟦G_{F,S}^{ab}(p)⟧, which is formally smooth exactly when that
  group is torsion-free.
- For Fontaine–Laffaille or level-raising problems only the quotient map holds, and for p | n the n-th roots do not exist.

## Layer G7: polarized problems and Taylor–Wiles primes for enormous image

Library modules: `TauCeti/NumberTheory/GaloisDeformation/Polarized` and `…/VariableDeterminant`. The sources are CHT08 §2
and ACC+ §6.2.18–6.2.32.

**Definition: polarized deformation problems** (node `polarized-deformation-problem`; planet).
- CHT's group 𝒢_n = (GL_n × GL_1) ⋊ {1, j} with the fixed multiplier χ = ν ∘ r.
- Lemma 2.1.1's dictionary with actual pairings: ρ^c ≅ ρ^∨ ⊗ μ, with the sign relations.
- The Schur condition.
- The pairing and sign conventions are requested from ArithmeticGaloisRepresentations G7.

**Theorem: representability** (node `polarized-representability`; CHT Proposition 2.2.9). The framing adds n²|T|
variables. None is removed: the centraliser is trivial, unlike in G8.

**Theorem: tangent and obstruction** (node `polarized-tangent-obstruction`; CHT Lemmas 2.2.11 and 2.3.4).
- H³ = H⁰(ad(1)), H² = dual Selmer, and the archimedean Euler terms n(n + χ(c_v))/2.
- For p | n the scalars lie in the trace-zero part, so there is no scalar/trace-zero splitting.

**Theorem: presentations** (node `polarized-presentation`; CHT Corollaries 2.2.12, 2.2.13, 2.3.5). These statements are
about R^{□_T}_𝒮 itself. They are kept separate from its p-torsion-free quotient and from its reduced generic fibre.

**Lemma: Taylor–Wiles places in rank n** (node `taylor-wiles-local-diamond`; ACC+ Lemma 6.2.19).
- Lifts at a Taylor–Wiles place split as γ₁ ⊕ ⋯ ⊕ γ_n.
- 𝒪[Δ_v] → R^□_v is formally smooth of relative dimension n².
- R^T_{𝒮_Q}/𝔞_Q ≅ R^T_𝒮.

**Theorem: Taylor–Wiles primes for enormous image** (node `enormous-taylor-wiles-primes`; ACC+ Lemma 6.2.31).
- Hypotheses: F CM, ζ_p ∉ F, and ρ̄(G_{F(ζ_p)}) enormous.
- The trace-zero part is handled by the enormous conditions, the scalar part by Kummer theory.
- Enormousness is requested from ArithmeticGaloisRepresentations G7. For n = 2 it holds for images containing SL₂(𝔽_p)
  when p ≥ 7.
- The displayed locator is arXiv v2; the published lemma is 6.2.32. Require p ∤ 2n,
  absolute irreducibility, k containing all residual eigenvalues, N ≥ 1 and
  q ≥ h¹ of the specified dual Selmer group. G7 proves the detecting-element
  hypotheses using the trace-zero and scalar summands and imports the shared
  R04.5 selection lemma. D8 supplies the localization-kernel identity for 𝒮_Q.

**Theorem: ACC+'s presentation** (node `enormous-taylor-wiles-presentation`; planet; ACC+ Proposition 6.2.32 in arXiv v2,
6.2.33 in the stage text).
- F = F⁺F₀, and the primes split in F₀.
- g = qn − n²[F⁺ : ℚ].
- Δ_{Q_N} is a product of qn cyclic p-groups, each of order at least p^N.
- The published Proposition 6.2.33 was checked at p. 1047 (physical PDF p. 151).
  Take T = S. Exclude primes over the discriminant of F₀ when choosing degree-one
  primes, so their underlying rational primes are unramified and split in F₀.
  The integer g is nonnegative because it is a relative tangent dimension;
  truncated natural-number subtraction cannot replace that argument.

**Export to PA.4 (finding /21).** Import this entire ACC+ package: Q_N, ordered
eigenvalues, congruences, splitting, the variable-determinant presentation,
Λ[Δ_Q]-action and Rᵀ_{𝒮_Q}/𝔞_Q ≅ Rᵀ_𝒮. PA.4 retains the arithmetic levels
K₁(Q) ⊆ K₀(Q) ⊆ K, complexes, Hecke and global-ring actions, uniform bounds and
specializations needed by ultrapatching. Its neatness places v₀,v₀′ are separate
choices; the scalar-Frobenius and q_v ≠ 1 mod p conditions there do not describe
Taylor–Wiles places. The producer contract is in this packet; the consumer edit
and G7 → PA.4 handoff belong to `BP-PotentialAutomorphyInfrastructure`.

CG Proposition 8.5 (published PDF pp. 114–115) is a separate fixed-determinant
variant: big image, one selected one-dimensional generalized Frobenius eigenspace,
and q + |T| − 1 − [F:Q]n(n−1)/2 − l₀ variables. It cannot replace ACC+'s enormous
hypothesis, qn diamond factors or g. A consumer using CG must request that exact
variant from R04.5/G7, with its §8 local conditions and CHT proof inputs; this
comparison does not certify a full new extraction of that branch.

**Export to PA.3 (finding /22).** G8 exports Definition 6.2.2, Theorem 6.2.3,
Lemma 6.2.4 and the presentation (published Proposition 6.2.25; arXiv-v2 6.2.24).
G7 exports the augmentation comparison and, for the separately specified polarized
branch, its pairing/multiplier-dependent problem and presentation. PA.3 imports
the matching L7/L8 and R08.2 local conditions and verifies the two arithmetic
systems against P9's abstract support theorem. The geometric R-to-Hecke maps and
their nilpotent errors stay with PA.3. No blanket L7 → P9 edge or polarization
hypothesis is imposed on the general algebraic theorem or the ACC+ branch.

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

**E2 (misprint, reaches nothing): KW II (final version), §2.1, p. 6.** The converse of the closed-immersion criterion is
said to follow "using the surjectivity of Sp_C(A) → Sp_B(A) for A = F[ε]". It follows from the injectivity: then the
cotangent map is surjective, and Nakayama applies.

**E3 (already confirmed): Gee §3.23, pp. 17–18.** Nonempty T makes H⁰rel=0, not k;
the relative tangent constant is #T−1. The existing packet finding and its review are retained
unchanged. This revision corrects the reader and the complex, not the source-issue register.

## Remaining work

- **G7 and G8 are source-decomposed** (checkpoint 7). They depend on ArithmeticGaloisRepresentations G7 (polarizations,
  enormous image) and ArithmeticGaloisDuality D7/D8 (duality, dual Selmer counts), which are requested.

## Sources

- T. Gee, *Modularity lifting theorems*, Essential Number Theory 1 (2022), 73–126; arXiv:2202.05818v2.
- M. Kisin, *Lectures on deformations of Galois representations*, Lecture 1, notes on the author's Harvard page.
- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*, Invent. Math. 178 (2009), 505–586; authors'
  final version (www.math.ucla.edu/~shekhar/papers/proofs.pdf) and ESI preprint 1892.
- T. Barnet-Lamb, T. Gee, D. Geraghty and R. Taylor, *Potential automorphy and change of weight*, Ann. of Math. 179
  (2014), 501–609; arXiv:1010.2561v4.
- G. Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over
  arbitrary rings*, in Automorphic Forms and Galois Representations 1, LMS LNS 414 (2014); arXiv:0809.0415v2.
- P. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. Le Hung, J. Newton, P. Scholze, R. Taylor and J. Thorne,
  *Potential automorphy over CM fields*, Ann. of Math. 197 (2023); arXiv:1812.09999v2, §6.2.
- L. Clozel, M. Harris and R. Taylor, *Automorphy for some l-adic lifts of automorphic mod l Galois representations*,
  Publ. Math. IHÉS 108 (2008), §2 (Numdam).

## Residual images, presentation numbering and the PA.3 export

R04.5/image-hypotheses keeps cyclotomic absolute irreducibility, big image and dyadic non-solvable image distinct. The R01.4 import already exists; its request now lists exactly KW II Lemma 4.3(2)(ii)/(5), with F₀ ⊂ 𝔽 and |F₀| = 2^r, r > 1, the invariant spaces, the submodule list 0,Z,Ad⁰,Ad and Dickinson’s H¹ vanishing. The p > 2 invariant and cyclotomic irreducibility facts are also specified. The global dual-Selmer vanishing of Lemma 5.2(1) remains R02.6’s. None of these finite-group statements is reproved at R04.5, and the supplier request stays open.

The author-final KW II version (98 pages; printed page equals PDF page) has Lemma 4.4, pp. 41–42, for generators; Lemma 4.6, pp. 43–45, for relations; and Proposition 4.5, pp. 42–45, for the dimension ≥ 1 conclusion. The ESI preprint calls the relation bound Lemma 4.5. Both existing citations remain correctly versioned. Corollary 4.7 requires finiteness and yields the characteristic-zero point: commutative algebra is R03.4 and its arithmetic application is R24.2. No second characteristic-zero existence theorem is added here.

G8/variable-determinant-problem, representability and presentation now name PA.3 as their arithmetic consumer. PA.3 imports these actual rings and Galois cohomology inputs, together with L7/L8 component data; abstract P9 keeps its arithmetic data as hypotheses. The G8 → PA.3 and L7/L8 → PA.3 stage edges are maintainer handoffs, not edits to the atlas by this packet. The original fixed-versus-variable determinant hypotheses and arbitrary-rank conventions remain unchanged.

### The determinant comparison is divided between R04.1 and R04.2

Until round 3 of the area fix, R04.1/determinant-comparison imported R04.2/carayol-trace-theorem, a prerequisite from a later layer of the same roadmap. The declaration is now divided. R04.1/determinant-comparison keeps the determinant map δ and its non-injectivity for reducible ρ̄, which is all that the layer's stated target asks for ("not automatically equivalent to representation deformations"), and its prerequisites are in R04.1 and IHG.0. The isomorphism for absolutely irreducible ρ̄ is R04.2/determinant-comparison-isomorphism, next to Carayol's theorem and the universal deformation ring that it uses. Every prerequisite between the two layers now runs from R04.1 to R04.2, and the gap that recorded the obstruction is closed.

- The round-2 repair selectively read the [published ACC+ PDF](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf),
  physical pp. 135–137, 143–145 and 148–151, and [Calegari–Geraghty](https://www.math.uchicago.edu/~fcale/papers/CG.pdf),
  physical pp. 113–115, on 30 September 2026. Packet hashes and version-qualified
  locators preserve the distinction from the historical arXiv-v2 reading.

## Exact interfaces and regressions for confirmed findings /1–/3

### /1 Locality is a hypothesis, not a prose convention

The coefficient category remains R03.1's. Neither a new local coefficient carrier nor a
representability axiom is introduced. Over ℤ, C=[[0,−1],[1,−1]], S=[[0,1],[1,0]] give S₃.
The unit matrix a=[[2,5],[5,12]], with inverse [[−12,5],[5,−2]], reduces to 2I modulo5.
Conjugation by a preserves the reduction and traces. I,C,S,CS span all M₂(𝔽₅), so the
residual representation is absolutely irreducible. Commuting with S gives z=y,w=x,
and commuting with C gives y=−y; over ℤ this forces y=z=0. The integral GL₂ centralizer
is {±I}, and every conjugator is ±a, reducing to 2I or 3I, never I. Thus the old nonlocal
signatures are false even with residual Burnside/Schur and equal traces.

For allowed Artinian-local A=ℤ/25, the same residue scalar2 lifts to the unit2 with inverse13.
The normalized conjugator13a remains invertible, acts by the same conjugation and reduces
to I. Native examples check these matrices and prove generic unit lifting from a genuine
local residue map. The finite regression also verifies that ℤ/25's nonunits form the ideal
of multiples of5. These tests are not claims of full formalization.

### /2 The scalar-sensitive shifted mapping fibre

Set M=ad ρ̄ and M₀=ad⁰ρ̄. The modified global complex has Cglob⁰=C⁰(G,M), Cglobⁱ=Cⁱ(G,M₀) for i>0. Cloc⁰=⊕_{v∈T} C⁰(G_v,M); Cloc¹=⊕_{v∈T} C¹(G_v,M₀) ⊕ ⊕_{v∈S∖T} C¹(G_v,M₀)/L̃_v, where L̃_v is the inverse image of L(D_v)⊆H¹ under Z¹→H¹, embedded in C¹; Clocⁱ=⊕_{v∈S} Cⁱ(G_v,M₀) for i≥2. Negative terms are zero. The degree-zero coboundary of a full matrix is its adjoint commutator, which has trace zero; d(L̃_v)=0 makes the local quotient differential well-defined. Restriction is to full adjoint degree-zero terms at T, to the indicated quotients in degree one, and to all S in higher degrees. Crelⁱ=Cglobⁱ⊕Cloc^{i−1}, with d(φ,ψ)=(dφ,res φ−dψ); thus Crel=Cone(res)[−1], the MAPPING FIBRE, not the unshifted cone of ordinary trace-zero global cochains.

The LES begins
0→H⁰rel→H⁰(G,ad)→⊕_T H⁰(G_v,ad)→H¹rel→H¹(G,ad⁰)→
⊕_T H¹(G_v,ad⁰)⊕⊕_{S∖T} H¹(G_v,ad⁰)/L_v→H²rel→… .
Any scalar in H⁰(G,ad)=k vanishing at a framed place is0, explaining H⁰rel=0 and
E3's #T−1 for T nonempty. The dual ordinary kernel has conditions L_v^⊥ at S∖T,
with no condition at T. R02.5 coordinates this precise interface with D8; L2 owns the
generic mapping fibre. L2's current ordinary Selmer kernels do not already supply the
modified complex, so the request remains open. No second Selmer construction or
executable dummy cohomology type is introduced.

Rank1 test: k=𝔽₃, trivial fixed determinant, S=T={3,5}. The representation has no
trace-zero tangent, but scalar framings give k²/diag(k), dimension1. One framing gives
k/diag(k)=0; no framings give framing H¹=0 and H⁰=k. Native tests on the ACTUAL
Submodule quotient of the diagonal LinearMap prove dimensions1,0,0, the nonzero
[(0,1)] class and the empty diagonal kernel. They detect precisely the lost scalar direction.

### /3 Source-specific detectors retain one selector

- Let H be the specified finite-dimensional ordinary dual Selmer kernel. For every nonzero [φ]∈H, construct a detecting Frobenius class satisfying the cyclotomic congruence, distinct residual eigenvalues, finite avoidance and nonzero localization. Exact cardinality/padding will then follow from the existing shared selector.

- Let K be the extension cut out by the rank-two adjoint, F_N=F(ζ_{p^N}), E=KF_N and M=(ad⁰ρ̄)^∨(1). Import H¹(Gal(E/F),M)=0 from R02.6 under the chosen source's EXACT hypotheses (KW Lemma5.2(1) for all odd p). Inflation–restriction makes φ|G_E a nonzero equivariant homomorphism. Under p>2 use the perfect trace pairing to identify the dual rank-two adjoint with ad⁰, not at p=2.

- GEE BRANCH ONLY (p≥5, SL₂-image): the span of φ(G_E) is all of M by whole-adjoint irreducibility, supplied by R01.4. Choose a cyclotomically trivial σ₀ with distinct residual eigenvalues. If an initial lift has zero evaluation, translate it by σ₁∈G_E; surjectivity onto the adjoint span supplies nonzero image in M/(σ₀−1)M, equivalently the eigenline trace evaluation of taylor-wiles-local-cohomology.

- KW BRANCH (p>2, cyclotomic absolute irreducibility): choose a nonzero irreducible constituent V in the span of φ(G_E), without asserting that this span is all of M. R01.4's detector gives a cyclotomically trivial σ with distinct residual eigenvalues and nonzero V→M/(σ−1)M. For the induced cases in Taylor's proof, write ad⁰=V⊕W: if W=0 choose any suitable semisimple σ; if dimW=1, choose σ outside the inducing quadratic field; if dimW=2 (V a quadratic sign line), choose σ inside that field with χ/χᶜ(σ)≠1. Cyclotomic irreducibility prevents the obstructing quadratic containment/trivial ratio. Translate a lift by a suitable element of G_E, so φ(σ₁σ)=φ(σ₁)+φ(σ) has nonzero coinvariant. This is constituent detection, not whole-adjoint spanning.

- AT p=3 the KW branch uses KW Lemma5.2(1)'s vanishing argument from DDT Theorem2.49 and Lemma5.3's same constituent-selection argument, requested with characteristic-three hypotheses visible. Do not use Taylor's l>3 implication [F(ζ_l):F]>2, strengthen to SL₂-image, or declare p=3 excluded. R01.4 handles finite-image cases; R02.6 handles the independent vanishing over the exact totally real, unramified base.

- Both branches apply R04.5/chebotarev-selmer-selection to the resulting conjugacy-compatible finite-quotient Frobenius classes and actual localization maps. The same supplier detector provides a nonempty admissible class for padding. The existing selector performs finite avoidance, strict kernel-rank decrease and exact cardinality once.

- KW chooses r=dimH; if r=0, Q=∅ is allowed. Gee chooses its stated maximum bound and may still need padding when H=0. Keep the generator counts and source-specific Selmer conditions distinct.

The correct Taylor source is [On the meromorphic continuation of degree two L-functions](https://ftp.gwdg.de/pub/misc/EMIS/journals/DMJDMV/vol-coates/taylor.pdf),
Documenta Mathematica, Extra Volume Coates (2006),729–779, Lemma2.5 at printed749–750
(physical21–22), KW reference[59]. Reference[58] is the different Fontaine–Mazur paper.
Taylor's l>3 vanishing is NOT evidence for p=3. The current R02.6 Q-only sigma-criterion
is not already the requested number-field interface. No strengthening to SL₂-image,
adjoint irreducibility or exclusion of permitted dihedral representations is made.

Regression: F=ℚ,p=5, standard S₃ representation of the splitting field of X³−2.
The inducing quadratic field ℚ(√−3) is not contained in ℚ(ζ₅), whose sole quadratic
subfield is ℚ(√5), so the cyclotomic restriction still has S₃ image and is absolutely
irreducible. Nevertheless J=C−C⁻¹=[[1,−2],[2,−1]] spans a proper invariant trace-zero
sign line, also after Tate twist. Native tests check J's nonzero/trace-zero values,
conjugation under C,S, properness inside ad⁰ and the full residual matrix span.
The elementary field argument is not advertised as a compiled theorem about G_ℚ.

All 61 other node objects, the shared selector, G7/G8 PA.3/PA.4 contracts, source issues,
coverage and pre-existing stage-coarsening gap are preserved. The reproducible regression
program and validation receipt are in the fixes report. Independent review remains pending.
