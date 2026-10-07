/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/CohomologyComparisons.md is definitive. These statements
suggest Lean forms so that contributors and reviewers converge on names and
signatures. They claim no implementation.

BP-CohomologyComparisons, Codex codex-mCCbxV, 7 October 2026.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The two typed adapters below use actual ring homomorphisms and Mathlib's actual
adic completion. They do not construct Fontaine coefficient rings or geometric
cohomology. Every other mathematical signature, API item and test is inventoried
by its packet name below. Its missing geometric/enhanced supplier types are
explicitly omitted under PROTOCOL section 13 and gap G-lean-types; no axiom or
arbitrary proposition stands in for them. In particular compilation checks these
adapters only, not the advanced comparisons. All implementationStatus values
remain unchecked. Generic A_inf algebra belongs to AI.5, BKF classification to
AI.2, residue-section base change to CR.3, and integral Kisin lattices to R07.4.
-/
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.AdicCompletion.Completeness
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Data.Rat.Defs

noncomputable section

namespace TauCeti.CohomologyComparisons

/-- CP.0/ainf-specialization-dictionary: a normalization adapter on imported rings.
The actual Fontaine rings, topologies, ker θ generators, Teichmüller formulae,
PD universal property, field/DVR theorems and Galois actions are supplier inputs.
The named equality fields below are literal typed equations between those maps;
they are not placeholders for an unavailable geometric condition. -/
structure SpecializationDictionary
    (A O W Acrys BdRPlus : Type*) [CommRing A] [CommRing O] [CommRing W]
    [CommRing Acrys] [CommRing BdRPlus] (p : ℕ) where
  phi : A ≃+* A
  theta : A →+* O
  thetaTilde : A →+* O
  witt : A →+* W
  toAcrys : A →+* Acrys
  acrysToBdRPlus : Acrys →+* BdRPlus
  toBdRPlus : A →+* BdRPlus
  xi : A
  mu : A
  thetaTilde_eq : thetaTilde = theta.comp phi.symm.toRingHom
  period_eq : toBdRPlus = acrysToBdRPlus.comp toAcrys
  theta_xi_eq : theta xi = 0
  witt_xi_eq : witt xi = (p : W)
  witt_mu_eq : witt mu = 0

namespace SpecializationDictionary
variable {A O W Acrys BdRPlus : Type*} [CommRing A] [CommRing O] [CommRing W]
  [CommRing Acrys] [CommRing BdRPlus] {p : ℕ}
  (d : SpecializationDictionary A O W Acrys BdRPlus p)

-- SpecializationDictionary.thetaTilde_apply
lemma thetaTilde_apply (a : A) : d.thetaTilde a = d.theta (d.phi.symm a) := by
  sorry
-- SpecializationDictionary.period_composite
lemma period_composite (a : A) :
    d.toBdRPlus a = d.acrysToBdRPlus (d.toAcrys a) := by
  sorry
-- SpecializationDictionary.theta_xi
lemma theta_xi : d.theta d.xi = 0 := by
  sorry
-- SpecializationDictionary.witt_xi
lemma witt_xi : d.witt d.xi = (p : W) := by
  sorry
-- SpecializationDictionary.witt_mu
lemma witt_mu : d.witt d.mu = 0 := by
  sorry

-- SpecializationDictionary.test_theta: θ and Witt reduction are distinct tests.
example : d.theta d.xi = 0 := by
  sorry
-- SpecializationDictionary.test_witt: ξ does not vanish under Witt reduction.
example (hp : (p : W) ≠ 0) : d.witt d.xi ≠ 0 := by
  sorry
-- SpecializationDictionary.test_composite: the actual two period maps agree.
example (a : A) : d.toBdRPlus a = d.acrysToBdRPlus (d.toAcrys a) := by
  sorry
end SpecializationDictionary

/-- CP.3/infinitesimal-envelope: the presented underlying algebra, completing
along the full kernel. The source Tate algebra, its topology and the continuous
log differential complex remain omitted supplier interfaces. This abbreviation
reuses the pinned construction, rather than planning another completion theory. -/
abbrev InfinitesimalEnvelope {P R : Type*} [CommRing P] [CommRing R]
    (e : P →+* R) := AdicCompletion (RingHom.ker e) P

namespace InfinitesimalEnvelope
variable {P R : Type*} [CommRing P] [CommRing R] (e : P →+* R)

-- InfinitesimalEnvelope.of: canonical inclusion into the presented completion.
abbrev of : P →ₗ[P] InfinitesimalEnvelope e :=
  AdicCompletion.of (RingHom.ker e) P
-- InfinitesimalEnvelope.level: the inverse system uses I^n • top as in Mathlib.
abbrev level (n : ℕ) : InfinitesimalEnvelope e →ₗ[P]
    P ⧸ ((RingHom.ker e)^n • ⊤ : Submodule P P) :=
  AdicCompletion.eval (RingHom.ker e) P n
-- InfinitesimalEnvelope.level_of
lemma level_of (n : ℕ) (a : P) :
    level e n (of e a) =
      Submodule.mkQ ((RingHom.ker e)^n • ⊤ : Submodule P P) a := by
  sorry
-- InfinitesimalEnvelope.ext
lemma ext {x y : InfinitesimalEnvelope e}
    (h : ∀ n, level e n x = level e n y) : x = y := by
  sorry
-- InfinitesimalEnvelope.complete
lemma complete (h : (RingHom.ker e).FG) :
    IsAdicComplete (RingHom.ker e) (InfinitesimalEnvelope e) := by
  sorry

-- InfinitesimalEnvelope.test_point: no kernel means no new completion elements.
example (B : Type*) [CommRing B] :
    ∃ f : InfinitesimalEnvelope (RingHom.id B) ≃ₗ[B] B,
      ∀ b, f (of (RingHom.id B) b) = b := by
  sorry
-- InfinitesimalEnvelope.test_coordinate: level two retains the transverse variable.
example :
    level (Polynomial.evalRingHom (0 : ℚ)) 2
      (of (Polynomial.evalRingHom (0 : ℚ)) Polynomial.X) =
      Submodule.mkQ ((RingHom.ker (Polynomial.evalRingHom (0 : ℚ)))^2 • ⊤ :
        Submodule (Polynomial ℚ) (Polynomial ℚ)) Polynomial.X ∧
    level (Polynomial.evalRingHom (0 : ℚ)) 2
      (of (Polynomial.evalRingHom (0 : ℚ)) Polynomial.X) ≠ 0 := by
  sorry
-- InfinitesimalEnvelope.test_nonzero_coordinate: completion is not the quotient.
example :
    of (Polynomial.evalRingHom (0 : ℚ)) Polynomial.X ≠ 0 ∧
    level (Polynomial.evalRingHom (0 : ℚ)) 1
      (of (Polynomial.evalRingHom (0 : ℚ)) Polynomial.X) = 0 := by
  sorry
end InfinitesimalEnvelope

end TauCeti.CohomologyComparisons

/-
Mathematical signature inventory for omitted geometric declarations.

Each entry is a required signature, not a Lean axiom or an implemented declaration.
A named unavailable formal/adic, filtered, enhanced or tower type is a missing
supplier interface, not a free variable that may be replaced by an arbitrary type.
The definitive statements and direct prerequisites are in the packet and reader.

CP.0
============================================================

SpecializationDictionary: typed adapter above; full geometric qualification remains
For C complete algebraically closed over Q_p, assemble the imported maps of A=W(O_C^♭):
θ:A→O_C, θ̃=θ∘φ⁻¹, w:A→W(k), A→A_cris→B_dR⁺, and A[1/μ]→B_cris→B_dR. The adapter records
their actual composites, ξ=μ/φ⁻¹(μ), ξ̃=φ(ξ), ker θ=(ξ), ker θ̃=(ξ̃), θ(μ)=0, w(ξ)=p and
w(μ)=0. It identifies the composite A→A_cris→B_dR⁺ with the canonical completion map. These
are relations among imported objects, not constructions of the coefficient rings.

CP0.formal_algebraic_analytic_dictionary — theorem signature OMITTED (G-lean-types).
For a proper smooth O_K-scheme X₀, let 𝔛₀ be its p-adic completion, 𝔛=𝔛₀⊗̂O_C, Y=𝔛_{O_C/p},
X_k its residue scheme, and X_C the geometric adic generic fibre. Identify algebraic and
analytic étale cohomology of the proper generic fibre, algebraic and continuous formal de
Rham cohomology, and the special-fibre crystalline objects through the imported
GAGA/completion equivalences. Keep Spec O_C/p distinct from Spec k; the former is not the
residue field. Geometric points and pullback morphisms are retained in each identification.
Missing input interfaces: ClassicalAdicEtaleCohomology:H1:formal-adic-comparison, ClassicalAdicEtaleCohomology:H5, CrystallineCohomology:CR.3.

CP0.site_and_geometric_point_compatibility — theorem signature OMITTED (G-lean-types).
The morphisms from the generic analytic pro-étale to étale site, the formal scheme to its
special fibres, and the logarithmic to ordinary generic fibre induce the prescribed derived
pullbacks and pushforwards. For X descended from K, choose compatible geometric points over
K̄→C so that G_K acts on the same geometric cohomology object. Use the corrected pro-étale
covers of Scholze’s erratum; no discarded classification of topological points is an input.
Missing input interfaces: AdicEtaleGeometry:A1, ClassicalAdicEtaleCohomology:H5, CrystallineCohomology:CR.5.

CP0.twist_frobenius_filtration_normalization — theorem signature OMITTED (G-lean-types).
Use HT(χ_p)=+1, Q_p(1) with G_K action χ_p, t=log[ε] and φ(t)=pt. The filtration is
decreasing, Fil^r B_dR=t^r B_dR⁺; Hodge–Tate forms use the Breuil–Kisin twist {−j}, not an
unnormalized Tate twist over O_C. The semilinear φ on a module is displayed as φ* M→M. The
BMS/Kisin map S=W(k)[[u]]→A_inf sends u↦[π^♭]^p and restricts to Witt Frobenius; S→W(k)
sends u↦0 and is also Frobenius on W(k).
Missing input interfaces: CohomologyComparisons:CP.0/ainf-specialization-dictionary, AInfCohomology:AI.2, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3, PadicHodgeTheory:R06.4.

CP0.no_c_section_and_choice_transport — theorem signature OMITTED (G-lean-types).
No natural section C→B_dR⁺ is used. For a discretely valued subfield K⊂C the continuous lift
K→B_dR⁺ is canonical; a lift of a smooth spreading-out algebra A over K is a proof choice,
whose resulting cohomology is compared by embedding-system quasi-isomorphisms. The residue-
field section k→O_C/p in rational crystalline base change is separately recorded, with
independence only in the cases stated by BMS1 Remark 13.22.
Missing input interfaces: CohomologyComparisons:CP.0/ainf-specialization-dictionary, PadicHodgeTheory:R06.1.

CP.1
============================================================

CP1.proper_ainf_input_package — application signature OMITTED (G-lean-types).
For a proper smooth p-adic formal O_C-scheme 𝔛, import the actual K_A=RΓ(𝔛,AΩ_𝔛), its
perfectness, and the BKF structures on H^i(K_A). H^i(K_A) is finitely presented and becomes
finite free after inverting p. Its derived specializations are complexes attached to 𝔛 and
its named generic and special fibres; arbitrary perfect complexes with these ranks do not
substitute for this geometric input.
Missing input interfaces: AInfCohomology:AI.4, AInfCohomology:AI.5, CohomologyComparisons:CP.0/ainf-specialization-dictionary.

CP1.theta_de_rham_specialization — theorem signature OMITTED (G-lean-types).
For 𝔛 as above, the θ-base change K_A⊗^L_{A_inf,θ}O_C is canonically quasi-isomorphic to
RΓ(𝔛,Ω^{•,cont}_{𝔛/O_C}), multiplicatively in the smooth BMS1 setting. The right side uses
continuous differential forms; use derived tensor even when individual cohomology has
torsion.
Missing input interfaces: CohomologyComparisons:CP.1/proper-ainf-input-package, CohomologyComparisons:CP.0/ainf-specialization-dictionary, AInfCohomology:AI.4.

CP1.hodge_tate_specialization — theorem signature OMITTED (G-lean-types).
The θ̃-base change of AΩ has cohomology Ω^j_{𝔛/O_C}{−j}; its Bockstein differential is the
de Rham differential under the correctly twisted comparison. Preserve the cup product and
the degree-j Breuil–Kisin twist. This is not the same reduction as θ-de Rham and is not
automatically a split complex of untwisted forms.
Missing input interfaces: AInfCohomology:AI.4, AInfCohomology:AI.1, CohomologyComparisons:CP.0/ainf-specialization-dictionary.

CP1.witt_crystalline_specialization — theorem signature OMITTED (G-lean-types).
The derived p-completed base change K_A⊗̂^L_{A_inf}W(k) identifies with RΓ_crys(𝔛_k/W(k));
locally AΩ⊗̂^L W(k) is WΩ^•. The Witt reduction has ξ↦p, and Frobenius is the de
Rham–Witt/crystalline Frobenius. No ordinary tensor of H^i is claimed without Tor control in
the next degree.
Missing input interfaces: CohomologyComparisons:CP.1/proper-ainf-input-package, CohomologyComparisons:CP.0/ainf-specialization-dictionary, CrystallineCohomology:CR.4.

CP1.acris_specialization — theorem signature OMITTED (G-lean-types).
For Y=𝔛_{O_C/p}, K_A⊗̂^L A_cris≃RΓ_crys(Y/A_cris). In the proper setting use the precise
completed/ordinary tensor simplification supplied by perfectness, never a general assertion
that derived completion is unnecessary. This comparison is φ-compatible and smooth BMS1
multiplicative.
Missing input interfaces: CohomologyComparisons:CP.1/proper-ainf-input-package, AInfCohomology:AI.4, CrystallineCohomology:CR.2, CrystallineCohomology:CR.0.

CP1.mu_inverted_etale_specialization — theorem signature OMITTED (G-lean-types).
K_A[1/μ]≃RΓ_ét(X_C,Z_p)⊗^L_{Z_p}A_inf[1/μ] for the proper smooth formal scheme, functorially
with φ and products. The same statement is not asserted for every qcqs nonproper formal
scheme. Scalar extension to W(C^♭) is degreewise flat, and μ is a unit there.
Missing input interfaces: CohomologyComparisons:CP.1/proper-ainf-input-package, AInfCohomology:AI.0:integral, AInfCohomology:AI.0:period-comparison.

CP1.prismatic_frobenius_pullback_comparison — theorem signature OMITTED (G-lean-types).
For the bounded prism (A_inf,ker θ), identify φ*RΓ_Δ(𝔛/(A_inf,ker θ)) with K_A with its
specified Frobenius and scalar maps. Track whether a source uses ker θ̃ and transport by φ
rather than silently replacing the prism. The crystalline, de Rham and étale specializations
of this map agree with the BMS maps under the qualified uniqueness theorem of BS22 §18. More
precisely BS22 Notation 18.1 assumes a perfect prism (A,I), R=A/I, the category Sm_R of
p-completely smooth R-algebras, a symmetric monoidal G:Sm_R→D_(p,I)-comp(A), and a symmetric
monoidal natural transformation η:id→G⊗^L_A R. Theorem 18.2 says End(Δ_{−/A})={1} in that
category; it is not uniqueness among arbitrary group isomorphisms or all maps without η.
Frobenius compatibility need not be imposed separately in that uniqueness statement.
Missing input interfaces: PrismaticCohomology:PR.6, CohomologyComparisons:CP.1/proper-ainf-input-package, CohomologyComparisons:CP.0/ainf-specialization-dictionary.

CP1.crystalline_de_rham_overlap_square — theorem signature OMITTED (G-lean-types).
Base change the A_cris comparison along θ:A_cris→O_C. Its composite with crystalline–de Rham
reduction is the θ-de Rham specialization of K_A. In the W(k) specialization, crystalline
reduction to k is the Frobenius-normalized base change of the de Rham complex, not the θ̃
Hodge–Tate object.
Missing input interfaces: CohomologyComparisons:CP.1/acris-specialization, CohomologyComparisons:CP.1/theta-de-rham-specialization, CohomologyComparisons:CP.1/witt-crystalline-specialization, CrystallineCohomology:CR.2, PrismaticCohomology:PR.6.

CP1.multiplicative_bockstein_coherence — theorem signature OMITTED (G-lean-types).
For smooth BMS1 comparison maps, retain the multiplication, Frobenius and Bockstein
structures through the derived diagram. Iterated scalar extension gives coherent
associativity squares on the complexes. Semistable analogues require their own source-
qualified multiplicativity input and are not inferred from the smooth theorem.
Missing input interfaces: AInfCohomology:AI.1, EnhancedDerivedSheaves:E4, CohomologyComparisons:CP.1/crystalline-de-rham-overlap-square.

CP1.singular_and_completed_boundary — application signature OMITTED (G-lean-types).
The diagram for singular, semiperfectoid or nonproper objects is imported only with the
owner’s actual derived-complete construction and its finiteness hypotheses. For smooth
proper 𝔛 the preceding nodes give the entire target. A general replacement by H^i(K_A)⊗S can
fail because Tor from H^{i+1} contributes; animated prismatic extensions require PR.5/PR.6
and E4, not the ordinary DerivedCategory alone.
Missing input interfaces: EnhancedDerivedSheaves:E4, PrismaticCohomology:PR.5, PrismaticCohomology:PR.6, AInfCohomology:AI.5.

CP.2
============================================================

CP2.rational_crystalline_comparison_over_C — theorem signature OMITTED (G-lean-types).
Let X be proper smooth formal over O = O_C with generic fibre X and i ≥ 0. There is a
canonical isomorphism H^i_crys(X_{O/p}/A_crys) ⊗_{A_crys} B_crys ≅ H^i_ét(X,Z_p) ⊗_{Z_p}
B_crys. It is compatible with the isomorphism H^i_crys(X/B_dR^+) ⊗_{B_dR^+} B_dR ≅
H^i_ét(X,Z_p) ⊗ B_dR of Theorem 13.1 via the identification H^i_crys(X_{O/p}/A_crys)
⊗_{A_crys} B_dR^+ ≅ H^i_crys(X/B_dR^+).
Missing input interfaces: CohomologyComparisons:CP.1/acris-specialization, CohomologyComparisons:CP.1/mu-inverted-etale-specialization, CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification, CrystallineCohomology:CR.3.

CP2.crystalline_comparison_over_discretely_valued_base — theorem signature OMITTED (G-lean-types).
Let X be proper smooth formal over O_K, K complete discretely valued over Q_p with perfect
residue field k, C a completed algebraic closure with Galois group G_K, X_C the geometric
rigid-analytic generic fibre, i ≥ 0. There is a comparison isomorphism H^i_ét(X_C,Z_p)
⊗_{Z_p} B_crys ≅ H^i_crys(X_k/W(k)) ⊗_{W(k)} B_crys compatible with the G_K- and Frobenius
actions and with the filtration; in particular H^i_ét(X_C,Q_p) is a crystalline G_K-
representation.
Missing input interfaces: CohomologyComparisons:CP.2/rational-crystalline-comparison-over-C, CohomologyComparisons:CP.2/residue-section-descent-adapter, CohomologyComparisons:CP.3/descended-de-rham-lattice, CohomologyComparisons:CP.3/filtered-de-rham-comparison, PadicHodgeTheory:R06.2.

CP2.residue_section_descent_adapter — application signature OMITTED (G-lean-types).
Given the CR.3 rational base change of BMS1 Proposition 13.21, compose
H_crys^i(Y/A_cris)[1/p]≃H_crys^i(X_k/W(k))⊗A_cris[1/p] with the B_cris comparison. In a
discretely valued descent the map is normalized by the W(k)→O_K inclusion after the
sufficiently small nilpotent reduction; record k versus its algebraic closure and every
extension W(k)→W(k̄). A general choice of section does not disappear from the result.
Missing input interfaces: CrystallineCohomology:CR.3, CrystallineCohomology:CR.3:Frobenius-isogeny, CohomologyComparisons:CP.0/ainf-specialization-dictionary.

CP2.rational_degreewise_comparison — theorem signature OMITTED (G-lean-types).
For the proper perfect K_A with H^j(K_A)[1/p] free, the rational base-change comparisons
induce the stated degreewise B_cris isomorphisms. A_cris→B_cris is localization at μ, and
B_cris is Z_p-flat; ordinary group tensors on these sides are justified separately. No
integral equality H^i(K_A⊗^L W(k))=H^i(K_A)⊗W(k) follows from this rational argument.
Missing input interfaces: AInfCohomology:AI.5, CohomologyComparisons:CP.1/proper-ainf-input-package, CohomologyComparisons:CP.1/acris-specialization.

CP2.period_invariants_and_admissibility — application signature OMITTED (G-lean-types).
For 𝔛₀/O_K proper smooth, V=H_ét^i(X_C,Q_p) is crystalline and D_cris(V) identifies
φ-equivariantly with H_crys^i(X_k/W(k))[1/p]. Its K-linear filtered realization is
H_dR^i(X_K/K). This consequence uses B_cris^{G_K}=K₀ and the dimension criterion from R06.2;
it does not construct the period functor again.
Missing input interfaces: CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base, PadicHodgeTheory:R06.1, PadicHodgeTheory:R06.2.

CP2.crystalline_geometric_examples — application signature OMITTED (G-lean-types).
For an ordinary good-reduction elliptic curve, D_cris H^1 has Newton slopes 0,1; for a
supersingular elliptic curve it has slopes 1/2,1/2, while both have de Rham Hodge numbers
1,1. The comparison identifies these supplied crystalline computations with the Galois
period modules. It also applies to a proper smooth formal model with nonprojective generic
fibre; projectivity is absent from BMS1 Theorem 14.6.
Missing input interfaces: CohomologyComparisons:CP.2/period-invariants-and-admissibility, CrystallineCohomology:CR.7.

CP.3
============================================================

CP3.very_small_affinoid_embedding — theorem signature OMITTED (G-lean-types).
For smooth Tate C-algebra R of dimension d, choose a finite set Σ⊂R^{◦×} containing d
coordinates T_i such that the map from the Laurent Tate algebra on Σ onto R is surjective
and Spa(R,R◦)→T_C^d factors through rational embeddings and finite étale maps. Such very
small affinoids form a basis. Enlarging Σ is a refinement, and functorial comparisons are
obtained from the filtered family, rather than from one preferred torus chart.
Missing input interfaces: AdicSpacesPartII:R0, AdicEtaleGeometry:A1.

InfinitesimalEnvelope: typed adapter above; full geometric qualification remains
For a very small R and Σ, put P_Σ=lim_n (B_dR⁺/ξ^n)⟨X_u^{±1}:u∈Σ⟩ and e:P_Σ→R, X_u↦u. Set
D_Σ(R)=lim_m P_Σ/(ker e)^m, the ker(e)-adic completion, with the induced B_dR⁺-algebra
structure. Its logarithmic derivations extend continuously to the completed de Rham complex.
The presented completion is Mathlib AdicCompletion; the topology and Tate presentation are
imported. Completion is along the full embedding ideal, not just ξ.

CP3.noetherian_approximation_interface — application signature OMITTED (G-lean-types).
A very small smooth R/C descends to a smooth affinoid R_A over a smooth affinoid algebra A
of a discretely valued subfield, with compatible Σ_A, étale torus coordinates and R_A⊗̂_A
C≃R. The approximation uses BMS1 Lemmas 13.7–13.10: stability of a surjection under a
sufficiently small perturbation, a rank-one rational neighbourhood retaining fiberwise
surjectivity, and the p-power containment criterion for monic integral generators. Higher-
rank neighbourhood surjectivity is excluded.
Missing input interfaces: AdicSpacesPartII:R0, AdicSpacesPartII:R5, CohomologyComparisons:CP.3/very-small-affinoid-embedding.

CP3.completed_smooth_lift — theorem signature OMITTED (G-lean-types).
For the noetherian approximation R_A/A and a chosen A→B_dR⁺ lifting A→C, the completed
tensor R_A⊗̂_A B_dR⁺ is ξ-complete and flat, reduces to R, and has topologically free
reductions modulo ξ^n. The tensor is formed from integral p-adic completions before
inversion, as in BMS1 Lemma 13.11. A lift of A is a proof choice, not a canonical section of
θ on C.
Missing input interfaces: AdicSpacesPartII:R0, AdicSpacesPartII:R3, CohomologyComparisons:CP.3/noetherian-approximation-interface, EnhancedDerivedSheaves:E4.

CP3.envelope_normal_form — theorem signature OMITTED (G-lean-types).
For a sufficiently large Σ, D_Σ(R) identifies, after choosing lifts of its redundant
coordinates, with (R_A⊗̂_A B_dR⁺)[[X_u−ũ:u∈Σ excluding {T_1,…,T_d}]]. The torus coordinates
T_i lift by formal étaleness. This describes the envelope for proof purposes; the chosen ũ
do not define the canonical global cohomology.
Missing input interfaces: CohomologyComparisons:CP.3/infinitesimal-envelope, CohomologyComparisons:CP.3/completed-smooth-lift, AdicSpacesPartII:R0.

CP3.embedding_independence_and_reduction — theorem signature OMITTED (G-lean-types).
The completed de Rham complexes of D_Σ(R) are quasi-isomorphic under Σ⊂Σ′ and under a double
embedding joining two smooth lifts. Reduction modulo ξ is Ω_R/C^•; after a spreading-out
choice it identifies with Ω_{R_A/A}^•⊗̂_A B_dR⁺. The comparison maps are compatible on
triple refinements and give the coordinate-independent presheaf of BMS1 Definition 13.14.
Missing input interfaces: EnhancedDerivedSheaves:E4, CohomologyComparisons:CP.3/envelope-normal-form, AdicSpacesPartII:R0.

CP3.proper_formal_spreading — application signature OMITTED (G-lean-types).
For a proper smooth rigid X/C, choose a proper smooth family over a smooth rigid base S over
a discretely valued subfield K⊂C with X as its C-valued fibre. The construction uses the
noetherian descent of a proper flat formal model (BMS1 Proposition 13.15) over a complete
noetherian local ring, then Corollary 13.16 and smooth neighbourhoods. Keep proper flat
descent separate from the later smooth shrinking.
Missing input interfaces: AlgebraicModuliForArithmeticGeometry:R09.6, AdicSpacesPartII:F0, AdicSpacesPartII:R5.

CanonicalBdrCohomology — construction signature OMITTED (G-lean-types).
For a proper smooth adic X/C define K_dR⁺(X)=RΓ(X_very-small, Ω_X/B_dR⁺^•), where
Ω_X/B_dR⁺^• is the filtered colimit of the completed envelope de Rham complexes over
sufficiently large Σ (BMS1 Definition 13.18). The colimit is independent of embeddings by
the previous comparison. This gives a derived ξ-complete perfect B_dR⁺ complex with
K_dR⁺(X)⊗^L C≃RΓ_dR(X/C); its construction makes no choice of a lift X to B_dR⁺.
Missing input interfaces: CohomologyComparisons:CP.3/embedding-independence-and-reduction, AdicEtaleGeometry:A1, EnhancedDerivedSheaves:E4, AdicSpacesPartII:R3.
API lemma CanonicalBdrCohomology.affinoid OMITTED: On a very small affinoid, the presheaf complex is the colimit of Ω_DΣ/B_dR⁺^• with the Lemma
13.13 refinement quasi-isomorphisms.
API lemma CanonicalBdrCohomology.map OMITTED: A morphism f:X→Y gives K_dR⁺(Y)→K_dR⁺(X); common embedding refinements prove identity and
composition laws.
API lemma CanonicalBdrCohomology.theta OMITTED: K_dR⁺(X)⊗^L C≃RΓ_dR(X/C), using the canonical quotient B_dR⁺→C.
API lemma CanonicalBdrCohomology.complete OMITTED: K_dR⁺(X) is derived ξ-complete and perfect for proper smooth X.
API lemma CanonicalBdrCohomology.independent OMITTED: Two sufficiently large embedding systems yield the same object through canonical quasi-
isomorphisms satisfying the refinement cocycle law.
example CanonicalBdrCohomology.test_point OMITTED: K_dR⁺(Spa C)=B_dR⁺ concentrated in degree zero.
example CanonicalBdrCohomology.test_projective_line OMITTED: For P¹_C, H⁰ and H² are free rank one over B_dR⁺ and H¹=0; their θ-reductions are the
corresponding C de Rham groups.
example CanonicalBdrCohomology.test_redundant_embedding OMITTED: On a very small torus, adjoining a redundant unit to Σ induces the Lemma 13.13 quasi-
isomorphism; no extra degree-one class is introduced.

CP3.bdr_cohomology_finite_freeness — theorem signature OMITTED (G-lean-types).
For proper smooth X/C, every H^i(K_dR⁺(X)) is finite free over B_dR⁺. Reduction to C
commutes with cohomology and identifies H^i with H_dR^i(X/C); dimensions give the common
rank. Freeness comes from proper smooth spreading out and relative de Rham cohomology with
integrable connection, not merely from perfectness of the complex.
Missing input interfaces: CohomologyComparisons:CP.3/canonical-bdr-cohomology, CohomologyComparisons:CP.3/proper-formal-spreading, CohomologyComparisons:CP.3/completed-smooth-lift, AdicSpacesPartII:R3.

CP3.local_bdr_etale_map — theorem signature OMITTED (G-lean-types).
For a very small X=Spa(R,R◦) and Σ, adjoining compatible p-power roots of all u∈Σ gives a
perfectoid tower with Γ=∏_Σ Z_p(1). The degree-zero map D_Σ(R)→B_dR⁺(R_∞,Σ) sends X_u to
[u^♭]. The normalized maps of completed logarithmic de Rham and Γ-Koszul complexes identify
Ω_DΣ/B_dR⁺^• with η_ξ of the period Koszul complex. After ξ inversion this is the local
comparison quasi-isomorphism.
Missing input interfaces: AInfCohomology:AI.4, CohomologyComparisons:CP.3/infinitesimal-envelope, AInfCohomology:AI.1, PadicHodgeTheory:P8:local-rational, AdicEtaleGeometry:A1.

CP3.canonical_bdr_etale_comparison — theorem signature OMITTED (G-lean-types).
For proper smooth X/C, the natural map K_dR⁺(X)→RΓ(X_proét,B_dR⁺) becomes a quasi-
isomorphism after ξ inversion; proper primitive finiteness identifies the target with
RΓ_ét(X,Z_p)⊗^L B_dR. Hence H^i(K_dR⁺(X))⊗B_dR≃H_ét^i(X,Z_p)⊗B_dR. Over C, BMS1 Theorem 13.1
establishes the underlying comparison; its filtered enhancement is stated separately with CN
Theorem 6.8.
Missing input interfaces: CohomologyComparisons:CP.3/canonical-bdr-cohomology, CohomologyComparisons:CP.3/local-bdr-etale-map, PadicHodgeTheory:P8:local-rational.

CP3.descended_de_rham_lattice — theorem signature OMITTED (G-lean-types).
If X=X₀⊗̂_K C for X₀/K proper smooth and K complete discretely valued,
H^i(K_dR⁺(X))≃H_dR^i(X₀/K)⊗_K B_dR⁺ via the continuous lift K→B_dR⁺. After inversion the
canonical comparison agrees with the early local-period Poincaré comparison of Scholze/BMS1
Theorem 5.1. The equality is equality of comparison maps through a common envelope, not an
arbitrary matching of two free modules.
Missing input interfaces: CohomologyComparisons:CP.3/canonical-bdr-cohomology, CohomologyComparisons:CP.3/embedding-independence-and-reduction, CohomologyComparisons:CP.3/canonical-bdr-etale-comparison, PadicHodgeTheory:P8:local-rational.

CP3.filtered_de_rham_comparison — theorem signature OMITTED (G-lean-types).
For proper smooth X₀/K, the rational comparison H_ét^i(X_C,Q_p)⊗B_dR≃H_dR^i(X₀/K)⊗B_dR is
G_K-equivariant and strict for the tensor product Hodge/period filtrations. On the étale
side the filtration is the period filtration; on the de Rham side Fil^r is the sum of Fil^a
H_dR⊗Fil^{r−a}B_dR. The equality with the canonical B_dR⁺ deformation is the preceding map
comparison.
Missing input interfaces: CohomologyComparisons:CP.3/descended-de-rham-lattice, PadicHodgeTheory:P8:local-rational.

CP3.hodge_de_rham_degeneration — theorem signature OMITTED (G-lean-types).
For proper smooth rigid X/C in characteristic zero, E₁^{a,b}=H^b(X,Ω_X^a)⇒H_dR^{a+b}(X/C)
degenerates at E₁. Over a discretely valued descent this follows from the filtered period
comparison; the general C case follows by proper smooth spreading out and constancy of
relative cohomology ranks. No integral or positive-characteristic degeneration is asserted.
Missing input interfaces: CohomologyComparisons:CP.3/proper-formal-spreading, CohomologyComparisons:CP.3/filtered-de-rham-comparison, AdicSpacesPartII:R3.

CP3.hodge_tate_degeneration — theorem signature OMITTED (G-lean-types).
For proper smooth X/C, E₂^{a,b}=H^a(X,Ω_X^b)(−b)⇒H_ét^{a+b}(X,Q_p)⊗C degenerates at E₂. The
source convention (−b) is translated through HT(χ_p)=+1. The dimension equality follows from
the finite free canonical B_dR⁺ lattice and Hodge–de Rham degeneration; it does not imply a
canonical splitting for every descended family.
Missing input interfaces: CohomologyComparisons:CP.3/hodge-de-rham-degeneration, CohomologyComparisons:CP.3/bdr-cohomology-finite-freeness, CohomologyComparisons:CP.3/canonical-bdr-etale-comparison, PadicHodgeTheory:P8:local-rational.

CP3.good_reduction_bdr_lattice_identification — theorem signature OMITTED (G-lean-types).
For proper smooth formal 𝔛/O_C and Y=𝔛_{O_C/p}, there is a natural quasi-isomorphism
RΓ_crys(Y/A_cris)⊗^L_{A_cris}B_dR⁺≃K_dR⁺(X_C). Its degreewise map is
H_crys^i(Y/A_cris)⊗B_dR⁺≃H^i(K_dR⁺(X_C)); use CR.3 Proposition 13.21 rational freeness to
justify this passage. This identifies the canonical deformation lattice. Agreement with the
B_cris/étale map is a separate downstream comparison.
Missing input interfaces: CohomologyComparisons:CP.3/canonical-bdr-cohomology, CohomologyComparisons:CP.3/infinitesimal-envelope, AInfCohomology:AI.4, CrystallineCohomology:CR.2, CrystallineCohomology:CR.3.

CP3.integral_rational_bdr_map_agreement — theorem signature OMITTED (G-lean-types).
After B_dR extension, the BMS1 A_inf→A_cris→B_cris/étale comparison and the canonical §13 de
Rham/étale comparison coincide under Proposition 13.23. The comparison is verified on their
common all-coordinate tower via X_u↦[u^♭] and the normalized logarithmic Koszul maps. It
also matches the early local de Rham sheaf comparison when X descends to K.
Missing input interfaces: CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification, CohomologyComparisons:CP.3/local-bdr-etale-map, AInfCohomology:AI.4.

RelativeInfinitesimalSite — definition signature OMITTED (G-lean-types).
For a smooth morphism of smooth formal O_K-schemes f:X→Y and the specified O_K→B_dR⁺, define
X/Y_B_dR⁺,inf as in Guo–Reinecke Definition 10.1. An object is (U,T), U open in X_C, T
topologically finite type over Y_{B_dR⁺/I^e} for some e, and a nilpotent closed immersion
U→T over Y_C. Morphisms are compatible maps of thickenings and open immersions on U; covers
are simultaneous analytic covers of U and T. O_inf(U,T)=Γ(T,O_T). Generic crystals and their
cartesian condition are imported from the crystalline/sheaf owners.
Missing input interfaces: AdicSpacesPartII:R0, AdicEtaleGeometry:A1, CrystallineCohomology:CR.1, EnhancedDerivedSheaves:E4.
API lemma RelativeInfinitesimalSite.object OMITTED: An open U, a finite-level T and a nilpotent closed immersion U→T over the specified base
give an object.
API lemma RelativeInfinitesimalSite.morphism OMITTED: Morphisms are compatible adic maps on T and open immersions on U, with identity and
composition inherited from adic spaces.
API lemma RelativeInfinitesimalSite.structureSheaf OMITTED: The structure sheaf evaluates a thickening at Γ(T,O_T), compatibly with restrictions.
API lemma RelativeInfinitesimalSite.baseChange OMITTED: A compatible base change Y′→Y induces the pullback comparison on the corresponding relative
thickenings and cartesian crystals.
API lemma RelativeInfinitesimalSite.envelope OMITTED: The ind-system of infinitesimal neighbourhoods in a smooth ambient Z over Y_K is weakly
final; its self-products are the diagonal embedding envelopes of GR Lemma 10.3.
example RelativeInfinitesimalSite.test_point OMITTED: For X_C=Spa C over the point, its structure-sheaf cohomology is B_dR⁺ in degree zero, as
computed by the canonical envelope.
example RelativeInfinitesimalSite.test_identity OMITTED: For an identity smooth relative morphism, the relative de Rham complex in an ambient lift
has only degree zero; the Čech envelope computation agrees.
example RelativeInfinitesimalSite.test_base OMITTED: A nilpotent thickening T with no map to the specified Y_{B_dR⁺/I^e} is not an object, even
if it is an absolute B_dR⁺ thickening.

CP3.relative_cech_de_rham_comparison — theorem signature OMITTED (G-lean-types).
For a vector-bundle crystal F on X/Y_B_dR⁺,inf and a smooth ambient embedding, the
Čech–Alexander complex of the weakly final envelope and the completed relative de Rham
complex of F on that envelope both compute RΓ_inf(X/Y_B_dR⁺,F). In the formal affine smooth
setting of GR Convention 10.4, the canonical lift and enlarged Laurent framing give the
natural equivalences of Corollary 10.8.
Missing input interfaces: CohomologyComparisons:CP.3/relative-infinitesimal-site, CohomologyComparisons:CP.3/infinitesimal-envelope, CrystallineCohomology:CR.2, EnhancedDerivedSheaves:E4.

CP3.relative_infinitesimal_perfectness — theorem signature OMITTED (G-lean-types).
For a proper smooth f:X→Y of smooth formal O_K-schemes with Y=Spf R and a vector-bundle
crystal F on the relative infinitesimal site, RΓ_inf(X/Y_B_dR⁺,F) is a perfect
R_{B_dR⁺}-complex. Its derived I-reduction is the relative de Rham cohomology of the
associated vector bundle with flat connection on X_C/Y_C. This gives perfectness, not an
unconditional statement that all higher direct images are free.
Missing input interfaces: CohomologyComparisons:CP.3/relative-cech-de-rham-comparison, EnhancedDerivedSheaves:E4, AdicSpacesPartII:R3.

CP3.crystalline_to_infinitesimal_coefficients — comparison signature OMITTED (G-lean-types).
For the smooth relative setup, there is a natural functor
D_perf(X_{p=0,crys})→D_perf(X/Y_B_dR⁺,inf), restricting from vector-bundle crystals to
vector-bundle crystals. On an enlarged framing its value is E′(D_pd,Σ^n)⊗^L_{D_pd,Σ^n}D_Σ^n.
The ring map is obtained by p-inversion followed by completion along the embedding ideal,
and the cartesian crystal condition provides Čech descent.
Missing input interfaces: CrystallineCohomology:CR.0, CrystallineCohomology:CR.1, CohomologyComparisons:CP.3/relative-cech-de-rham-comparison.

CP3.relative_crystalline_infinitesimal_base_change — comparison signature OMITTED (G-lean-types).
In GR Convention 10.4 for a vector-bundle crystalline crystal E′ and its image F,
crystalline cohomology over R, crystalline cohomology over R_Acrys, and infinitesimal
cohomology over R_B_dR⁺ identify after the specified completed B_dR⁺ base change. The
induced connections agree: ∇_inf is the ker θ̃_K-completion of ∇_crys[1/p]. This is the
comparison of equation (36), not a blanket uncompleted base-change assertion.
Missing input interfaces: CohomologyComparisons:CP.3/crystalline-to-infinitesimal-coefficients, CohomologyComparisons:CP.3/relative-cech-de-rham-comparison, CrystallineCohomology:CR.3, EnhancedDerivedSheaves:E4.

CP3.relative_filtered_prismatic_agreement — comparison signature OMITTED (G-lean-types).
For proper smooth f and crystalline Z_p-lisse T with the associated analytic prismatic
F-crystal, the B_dR specialization of GR’s étale–crystalline comparison equals the Hodge-
filtered relative de Rham comparison under Convention 10.12 and its compatible section
R→A⊗W(k)O_K. Without the section, the structural OB_dR sheaf gives the canonical relative
formulation. CP supplies the infinitesimal base-change comparison; PR.7 supplies the
F-crystal equivalence and the comparison being specialized. The perfect prism (A,I) must be
p-completely flat over (A_inf,[p]_q), q=[ε]; its I-adic period filtration and the tensor-
product Hodge filtration on the de Rham side are the filtrations being compared.
Missing input interfaces: PrismaticCohomology:PR.7, CohomologyComparisons:CP.3/relative-crystalline-infinitesimal-base-change, PadicHodgeTheory:P8:local-rational.

CP3.absolute_relative_infinitesimal_agreement — comparison signature OMITTED (G-lean-types).
For smooth X/C over the point, Guo’s B_dR⁺ infinitesimal cohomology agrees with the BMS1
canonical embedding cohomology. The relative formulation specializes to that construction
using the same completed envelopes. Guo Theorem 1.2.7 also treats singular proper spaces via
éh descent; that broader extension is an explicit requested interface and gap, not derived
from the smooth statement in this packet.
Missing input interfaces: CohomologyComparisons:CP.3/canonical-bdr-cohomology, CohomologyComparisons:CP.3/relative-cech-de-rham-comparison, EnhancedDerivedSheaves:E5:animation.

CP.4
============================================================

CP4.logarithmic_integral_diagram — application signature OMITTED (G-lean-types).
For a proper flat p-adic O_K-formal scheme with divisorial log structure and étale local
charts t₀⋯t_r=π′ (π′ a nonzero nonunit, allowed to vary), use the AI.6 semistable K_A and
its θ-log de Rham, Witt-log crystalline, A_cris-log crystalline and μ-inverted étale
comparisons. The log bases over W(k̄) and W(k₀) are displayed separately. Properness is
retained for the étale comparison. CK does not prove the full semistable all-coordinate
A_cris map multiplicative.
Missing input interfaces: AInfCohomology:AI.6/log-de-rham, AInfCohomology:AI.6/global-crystalline, AInfCohomology:AI.6/etale-comparison, AInfCohomology:AI.6/crystalline-de-rham-square, CohomologyComparisons:CP.0/ainf-specialization-dictionary.

CP4.hyodo_kato_log_base_adapter — comparison signature OMITTED (G-lean-types).
Relate the AI.6 log crystalline object over W(k̄) with Q_{≥0} log base to the arithmetic
Hyodo–Kato complex over W(k₀) with N→W(k₀), 1↦0. The B_st⁺-base-change map of CK Proposition
9.2 is φ- and N-compatible; on the HK side N is N_HK⊗1+1⊗N_Bst, while on the A_cris side N
acts on the period factor. Descent to k₀ and invariants require the precise CR.6 comparison,
not an implicit identification of log bases.
Missing input interfaces: AInfCohomology:AI.6/hyodo-kato-interface, CrystallineCohomology:CR.6, PadicHodgeTheory:R06.1, CohomologyComparisons:CP.4/logarithmic-integral-diagram.

CP4.semistable_period_comparison — theorem signature OMITTED (G-lean-types).
For a proper p-adic O_K-formal scheme with the preceding semistable charts and perfect
residue k₀, there is a natural G_K-equivariant quasi-isomorphism RΓ_ét(X_C,Z_p)⊗^L
B_st≃RΓ_logcrys(X_{k₀}/W(k₀))⊗^L B_st, compatible with φ and N, where Nφ=pφN. Degreewise it
gives semistable H_ét^i(X_C,Q_p). The right side uses the N→W(k₀),1↦0 log base.
Missing input interfaces: CohomologyComparisons:CP.4/logarithmic-integral-diagram, CohomologyComparisons:CP.4/hyodo-kato-log-base-adapter, CrystallineCohomology:CR.6, PadicHodgeTheory:R06.1, PadicHodgeTheory:R06.2.

CP4.semistable_filtered_bdr_agreement — theorem signature OMITTED (G-lean-types).
Choose a noncanonical A_cris-algebra embedding B_st→B_dR as in Fontaine/CK. The B_dR
extension of the semistable comparison agrees with the canonical de Rham comparison of CP.3
under AI.6 Proposition 6.8. Transport the Hodge filtration through the chosen Hyodo–Kato
identification; filtered compatibility is not a filtration on B_st independent of its
embedding choice.
Missing input interfaces: CohomologyComparisons:CP.4/semistable-period-comparison, CohomologyComparisons:CP.3/descended-de-rham-lattice, CohomologyComparisons:CP.3/filtered-de-rham-comparison, AInfCohomology:AI.6/etale-bdr-agreement.

CP4.uniformizer_change_and_monodromy — theorem signature OMITTED (G-lean-types).
For two uniformizer choices with ratio a, the corresponding Hyodo–Kato-to-de Rham
identifications are transported by the exponential of the logarithmic ratio times N, with
the sign fixed by the CR.6/Fontaine convention N=−d/dT on the B_st torsor. B_st itself is
the intrinsic HK torsor algebra, not one permanently chosen polynomial coordinate. The
transport obeys the cocycle law and preserves the rational comparison.
Missing input interfaces: CrystallineCohomology:CR.6, PadicHodgeTheory:R06.1, CohomologyComparisons:CP.4/semistable-filtered-bdr-agreement.

CP4.log_prismatic_agreement — comparison signature OMITTED (G-lean-types).
For the precise boundedness, log smoothness and exact chart class furnished by PR.8, its log
prismatic crystalline, de Rham and étale maps fit the semistable comparison after the
indicated derived completions and rational period extensions. No assertion extends
automatically to all fs log schemes, nonvertical log structures or nonexact charts.
Missing input interfaces: PrismaticCohomology:PR.8, CohomologyComparisons:CP.4/logarithmic-integral-diagram, CohomologyComparisons:CP.4/hyodo-kato-log-base-adapter.

CP4.semistable_geometric_examples — application signature OMITTED (G-lean-types).
The semistable comparison restricts in good reduction to the crystalline comparison with
N=0. For a split Tate elliptic curve with parameter q, the supplied two-dimensional HK
module has nonzero rank-one N with Nφ=pφN, and the filtered de Rham realization records
log(q) after the chosen period embedding. Thus the semistable theorem detects information
that the N=0 crystalline theorem does not.
Missing input interfaces: CohomologyComparisons:CP.4/semistable-period-comparison, CohomologyComparisons:CP.4/semistable-filtered-bdr-agreement, CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base, CrystallineCohomology:CR.6, PadicHodgeTheory:R06.2.

CP4.algebraic_beilinson_period_comparison — theorem signature OMITTED (G-lean-types).
For any algebraic variety X_K over K and r≥0, CN Theorem 6.2 records Beilinson’s B_st-linear
G_K-equivariant period isomorphism H_ét^r(X_{K̄},Q_p)⊗B_st≃H_HK^r(X_{K̄})⊗_{F^{nr}}B_st
preserving φ,N and inducing the filtered B_dR isomorphism with H_dR^r(X_K). No smoothness or
properness assumption is added; HK and de Rham use the h-descent/derived realizations for
arbitrary varieties, not the smooth proper model definitions.
Missing input interfaces: CrystallineCohomology:CR.6, AlgebraicModuliForArithmeticGeometry:R09.7, EnhancedDerivedSheaves:E4, PadicHodgeTheory:R06.2.

CP4.algebraic_period_recovery_and_duals — application signature OMITTED (G-lean-types).
For the algebraic comparison above, recover H_ét^r as
(H_HK^r⊗B_st)^{φ=1,N=0}∩Fil⁰(H_dR^r⊗B_dR). The natural Hom^sm_{G_K}(H_ét^r,B_st)≃(H_HK^r)^*
is an isomorphism of (φ,N,G_K)-modules and Hom_{G_K}(H_ét^r,B_dR)≃(H_dR^r)^* is filtered
K-linear. The smooth-vector qualifier and the duals are essential; the theorem does not
identify ordinary B_st Hom with undualized HK cohomology.
Missing input interfaces: CohomologyComparisons:CP.4/algebraic-beilinson-period-comparison, PadicHodgeTheory:R06.2.

CP4.proper_rigid_potential_semistable_comparison — theorem signature OMITTED (G-lean-types).
For X_K proper smooth rigid over K and r≥0, CN Theorem 6.4 gives a natural G_K-equivariant
B_st isomorphism H_ét^r(X_C,Q_p)⊗B_st≃H_HK^r(X_C)⊗_{F^{nr}}B_st preserving φ,N and inducing
the filtered B_dR comparison. The resulting Galois representation is potentially semistable;
the F^{nr} HK object with G_K action is the potential period realization, not a claim of
semistability over K without further hypotheses.
Missing input interfaces: CrystallineCohomology:CR.6, CrystallineCohomology:CR.7, CohomologyComparisons:CP.3/filtered-de-rham-comparison.

CP4.proper_rigid_c_period_comparison — theorem signature OMITTED (G-lean-types).
For X proper smooth rigid over C, CN Theorem 6.8 gives a natural φ,N-compatible B_st
comparison with H_HK^r(X)⊗_{F^{nr}}B_st, inducing a filtered B_dR comparison with
H_dR^r(X/B_dR⁺)⊗B_dR. The latter filtration is Im[H^r(Fil^i K_dR⁺)→H^r(K_dR⁺)], not only the
free B_dR⁺ lattice. No G_K action is asserted without descent. This is a separate filtered
extension of BMS1 §13; the unfiltered finite-free lattice theorem by itself is not used as a
filtered comparison theorem.
Missing input interfaces: CrystallineCohomology:CR.6, CohomologyComparisons:CP.3/canonical-bdr-cohomology, CohomologyComparisons:CP.3/canonical-bdr-etale-comparison.

CP4.proper_curve_potential_period_interface — application signature OMITTED (G-lean-types).
For a proper smooth curve X_K over a finite extension K/Q_p and X=X_K⊗C, V=H_ét¹(X,Q_p) is
potentially semistable with Hodge–Tate weights 0,−1, D_pst(V)≃H_HK¹(X), and
Fil¹D_dR(V)≃H⁰(X_K,Ω¹). These are precisely the comparison inputs to CDN Proposition 3.12,
not an assertion of semistability over the original K. Its additional identity for the
modified HK object uses the fundamental period exact sequence and pro-étale H¹(Ô), owned
outside CP.
Missing input interfaces: CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison, CohomologyComparisons:CP.3/hodge-de-rham-degeneration, PadicHodgeTheory:R06.2.

CP.5
============================================================

CP5.crystalline_de_rham_torsionfreeness_equivalence — theorem signature OMITTED (G-lean-types).
For proper smooth formal 𝔛/O_C, H_crys^i(𝔛_k/W(k)) is p-torsion-free if and only if
H_dR^i(𝔛/O_C) is p-torsion-free; then H_Ainf^i(𝔛) is finite free and H_ét^i(X_C,Z_p) is
torsion-free. This is the geometric application of AI.5’s generic complex criterion, not a
converse from étale freeness.
Missing input interfaces: AInfCohomology:AI.5, CohomologyComparisons:CP.1/theta-de-rham-specialization, CohomologyComparisons:CP.1/witt-crystalline-specialization.

CP5.integral_torsion_length_inequality_over_C — theorem signature OMITTED (G-lean-types).
Let X be a proper smooth formal scheme over the ring of integers O of a complete
algebraically closed extension C of Q_p, with residue field k and generic fibre X, and let i
≥ 0. For all n ≥ 0, length_{W(k)}(H^i_crys(X_k/W(k))_tor/p^n) ≥
length_{Z_p}(H^i_ét(X,Z_p)_tor/p^n). In particular, if H^i_crys(X_k/W(k)) is p-torsion-free
then so is H^i_ét(X,Z_p). The argument also gives rank_{W(k)} H^i_crys(X_k/W(k)) =
rank_{Z_p} H^i_ét(X,Z_p).
Missing input interfaces: AInfCohomology:AI.5, CohomologyComparisons:CP.1/proper-ainf-input-package, CohomologyComparisons:CP.1/witt-crystalline-specialization, CohomologyComparisons:CP.1/mu-inverted-etale-specialization.

CP5.lattice_recovery_over_C — theorem signature OMITTED (G-lean-types).
Let X be proper smooth formal over O = O_C with generic fibre X and i ≥ 0. Tier 1
(hypothesis: H^i_crys(X_k/W(k)) p-torsion-free; then the finitely generated Z_p-module
H^i_ét(X,Z_p) is p-torsion-free by part (ii), hence finite free, so the pair below satisfies
the hypotheses of Theorem 4.28): H^i_Ainf(X) is a finite free Breuil–Kisin–Fargues module
and there is a canonical isomorphism H^i_Ainf(X) ≅ BKF(H^i_ét(X,Z_p)), where
BKF(H^i_ét(X,Z_p)) is the finite free BKF module attached by Fargues' equivalence (Theorem
4.28) to the pair (H^i_ét(X,Z_p), H^i_crys(X/B_dR^+) ⊂ H^i_ét(X,Z_p) ⊗ B_dR); moreover
H^i_crys(X_k/W(k)) ⊃ BKF(H^i_ét(X,Z_p)) ⊗_{A_inf} W(k), compatibly with φ. Tier 2
(hypothesis: H^i_crys(X_k/W(k)) and H^{i+1}_crys(X_k/W(k)) both p-torsion-free): the
inclusion is an equality, so H^i_crys(X_k/W(k)) with its φ-action is recovered from
H^i_ét(X,Z_p) with its B_dR^+-lattice.
Missing input interfaces: AInfCohomology:AI.5, AInfCohomology:AI.2, CohomologyComparisons:CP.1/proper-ainf-input-package, CohomologyComparisons:CP.3/good-reduction-bdr-lattice-identification, CohomologyComparisons:CP.3/integral-rational-bdr-map-agreement.

CP5.dvr_lattice_recovery_via_breuil_kisin — theorem signature OMITTED (G-lean-types).
Let X be proper smooth formal over O_K, K complete discretely valued over Q_p with perfect
residue field k, C a completed algebraic closure with Galois group G_K, X_C the geometric
rigid generic fibre, i ≥ 0. Assume H^i_crys(X_k/W(k)) and H^{i+1}_crys(X_k/W(k)) are
p-torsion-free. Kisin's functor (Theorem 4.4; it depends on the fixed uniformizer π and
roots π^{1/p^n}) attaches to the lattice H^i_ét(X_C,Z_p) in the crystalline G_K-
representation H^i_ét(X_C,Q_p) a finite free Breuil–Kisin module BK(H^i_ét(X_C,Z_p)) over S
= W(k)[[T]] (written 𝔖 in the source); there is an identification BK(H^i_ét(X_C,Z_p)) ⊗_S
B_crys^+ ≅ H^i_crys(X_k/W(k)) ⊗_{W(k)} B_crys^+ (Proposition 4.34 and part (i); S → A_inf
sends T to [π♭]^p and is the Frobenius on W(k), §4.4); extending scalars along B_crys^+ →
W(k̄)[1/p] gives BK(H^i_ét) ⊗_S W(k)[1/p] ≅ H^i_crys(X_k/W(k))[1/p], where S → W(k) sends T
to 0 and is the Frobenius on W(k) (introduction, p.4); and BK(H^i_ét(X_C,Z_p)) ⊗_S W(k) =
H^i_crys(X_k/W(k)) as submodules of the common base extension to W(k)[1/p]. Thus
H^i_crys(X_k/W(k)) with φ is recovered from H^i_ét(X_C,Z_p) with its G_K-action.
Missing input interfaces: AInfCohomology:AI.2, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base, CohomologyComparisons:CP.5/lattice-recovery-over-C, CohomologyComparisons:CP.0/twist-frobenius-filtration-normalization, CrystallineCohomology:CR.3.

CP5.dvr_torsion_length_inequality — theorem signature OMITTED (G-lean-types).
With X proper smooth formal over O_K as in Theorem 14.6 and X_C its geometric generic fibre:
for all n ≥ 0, length_{W(k)}(H^i_crys(X_k/W(k))_tor/p^n) ≥
length_{Z_p}(H^i_ét(X_C,Z_p)_tor/p^n); in particular H^i_crys(X_k/W(k)) p-torsion-free
implies H^i_ét(X_C,Z_p) p-torsion-free (the converse fails, §2.1).
Missing input interfaces: CohomologyComparisons:CP.5/integral-torsion-length-inequality-over-C, CrystallineCohomology:CR.3.

CP5.mod_p_de_rham_dimension_bound — theorem signature OMITTED (G-lean-types).
For X proper smooth formal over O_K as in Theorem 1.1, dim_k H^i_dR(X_k) ≥ dim_{F_p}
H^i_ét(X_C, F_p) for every i.
Missing input interfaces: CohomologyComparisons:CP.5/dvr-torsion-length-inequality, CrystallineCohomology:CR.3, AInfCohomology:AI.5.

CP5.semistable_crystalline_torsion_export — application signature OMITTED (G-lean-types).
Under the AI.6 proper semistable hypotheses, import CK Theorem 7.9: for every i∈Z and n≥0,
length_Zp(H_ét^i(X_C,Z_p)_tor/p^n)≤length_W(k)(H_logcrys^i(X_k/W(k))_tor/p^n), and length_Zp
H_ét^i(X_C,Z/p^n)≤length_W(k) H_logcrys^i(X_k/W_n(k)). CP places these in the common diagram
and records the rank equality needed to pass between full and torsion quotients.
Missing input interfaces: AInfCohomology:AI.6/crystalline-torsion, AInfCohomology:AI.6/rank-equality, AInfCohomology:AI.6/degreewise-specializations, CohomologyComparisons:CP.4/logarithmic-integral-diagram.

CP5.semistable_normalized_de_rham_torsion_export — application signature OMITTED (G-lean-types).
Import CK Theorem 7.12 with v(p)=1:
v_Zp(H_ét^i(Z_p)_tor/p^n)≤v_OC(H_logdR^i(𝔛/O_C)_tor/p^n), including the finite-coefficient
log de Rham inequality. For a discrete O_K of absolute ramification e, normalized torsion
length is ordinary O_K length divided by e; it is not unscaled module length. The definition
via the valuation of Fitt₀ and its scalar-extension invariance belong to AI.5/AI.6.
Missing input interfaces: AInfCohomology:AI.6/de-rham-torsion, AInfCohomology:AI.6/degreewise-specializations, AInfCohomology:AI.5, CohomologyComparisons:CP.4/logarithmic-integral-diagram.

CP5.functorial_log_de_rham_lattice_export — application signature OMITTED (G-lean-types).
Import AI.6’s M(T) from the pair (T,D_dR(T)⊗B_dR⁺) and L_dR(T)=(M(T)⊗_{A_inf,θ}O_C)^{G_K}.
For a proper flat semistable model with H_logdR^i and H_logdR^{i+1} both O_K-free,
AI.6/model-independent-lattice gives L_dR(H_ét^i)=H_logdR^i inside H_dR^i(X_K). Thus the
comparison identifies the lattice functorially and independently of such a model. It does
not claim equality after dropping either adjacent-degree condition.
Missing input interfaces: AInfCohomology:AI.6/de-rham-lattice-functor, AInfCohomology:AI.6/model-independent-lattice, CohomologyComparisons:CP.3/descended-de-rham-lattice, CohomologyComparisons:CP.4/semistable-filtered-bdr-agreement.

CP5.small_weight_integral_interface — application signature OMITTED (G-lean-types).
For K absolutely unramified (e=1), after a common Tate shift restrict the Fontaine–Laffaille
filtration indices to [0,p−2] for unrestricted torsion full faithfulness. The interval
[0,p−1] requires the precise restricted subcategories of Fontaine–Laffaille §0.9/§6
excluding the specified endpoint subobjects or quotients; at p=2 the unrestricted safe
interval is [0,0]. For the Breuil–Kisin alternative use R07.4’s separately proved
height/ramification and dyadic hypotheses. In either case compare the supplied geometric
realization with CP.5’s actual lattice, using the Kummer tower and the Frobenius-twisted S
specialization. No classification is owned here.
Missing input interfaces: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, PadicHodgeTheory:R06.4, CohomologyComparisons:CP.5/dvr-lattice-recovery-via-breuil-kisin.

CP5.enriques_torsion_counterexample — theorem signature OMITTED (G-lean-types).
BMS1 Theorem 2.1 constructs a smooth projective geometrically connected surface over Z₂ with
all geometric generic-fibre integral étale groups free and H_crys² of the special fibre
having torsion F₂. The proof uses a singular Enriques surface S/Z₂ with Pic^τ=μ₂, a K3
double cover and an ordinary elliptic curve: a generically nontrivial Z/2→μ₂→E becomes zero
in the special fibre, producing an E-torsor threefold D; a sufficiently ample smooth
hypersurface gives the surface.
Missing input interfaces: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1, AlgebraicModuliForArithmeticGeometry:R09.3, CrystallineCohomology:CR.3, EtaleDualityAndPerverseSheaves:EDC.2:pairings.

CP5.degenerating_group_torsion_counterexample — theorem signature OMITTED (G-lean-types).
For the BMS1 Theorem 2.10 smooth projective surface H/O_C, H_ét²(H_C,Z_p)_tor≃Z/p² while
H_crys²(H_k/W(k))_tor≃k⊕k. Hence étale torsion need not be a subquotient of crystalline
torsion despite all-n length inequalities. The construction starts with the flat closure G
of a p²-torsion point in a supersingular elliptic curve, G_C≃Z/p² and G_k=E_k[p];
approximate BG by a projective quotient with bad stabilizer locus of codimension >2.
Missing input interfaces: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1, AlgebraicModuliForArithmeticGeometry:R09.3, CrystallineCohomology:CR.3.

CP5.special_fibre_does_not_determine_integral_etale — application signature OMITTED (G-lean-types).
The two Z₂ lifts D and D′=S×E of the same smooth projective special fibre S_k×E_k in BMS1
Remark 2.4 have different generic-fibre H_ét² torsion. Therefore neither integral generic
étale torsion nor RΓ_Ainf, even modulo p, is a functor only of the special fibre. This
prevents replacing the formal model in the CP.1 diagram by its residue scheme.
Missing input interfaces: CohomologyComparisons:CP.5/enriques-torsion-counterexample, CrystallineCohomology:CR.3.

CP.6
============================================================

CP6.naturality_base_change_and_cup_products — theorem signature OMITTED (G-lean-types).
For smooth proper algebraic X/K and the CP.3 de Rham comparison c_dR, the total isomorphism
is a graded B_dR-algebra map, natural for morphisms of such varieties and compatible with
finite extension K′/K inside C. It commutes with the Künneth external product for X×_K Y.
Integral/crystalline/prismatic enhancements have the exact same compatibility only in the
source scopes of the CP.1 multiplicative maps and the supplied completed tensor/Künneth
theorems. In particular this does not make CK’s semistable A_cris map multiplicative without
further proof.
Missing input interfaces: CohomologyComparisons:CP.3/filtered-de-rham-comparison, CohomologyComparisons:CP.3/integral-rational-bdr-map-agreement, CohomologyComparisons:CP.1/multiplicative-bockstein-coherence, EnhancedDerivedSheaves:E4, ClassicalAdicEtaleCohomology:H5.

CP6.trace_normalized_tate_period — theorem signature OMITTED (G-lean-types).
For the specific c_dR in Betts–Stix, there is a unique G_K-equivariant filtered B_dR-linear
isomorphism a:B_dR(−1)≃B_dR⟨−1⟩ making the trace square commute on P¹. Here
Fil^i(V⟨n⟩)=Fil^{i+n}V. For smooth proper geometrically connected X/K of dimension d, the
étale trace to Q_p(−d) and de Rham trace to K⟨−d⟩ commute with c_dR and a^{⊗d}. Equality of
a with the canonical Fontaine period is not asserted: Remark 3.21 explicitly leaves it
unproved.
Missing input interfaces: CohomologyComparisons:CP.6/naturality-base-change-and-cup-products, EtaleDualityAndPerverseSheaves:EDC.2:trace-purity, CrystallineCohomology:CR.3:duality, AlgebraicModuliForArithmeticGeometry:R09.7.

CP6.duality_and_cycle_class_compatibility — theorem signature OMITTED (G-lean-types).
For X smooth proper geometrically connected of dimension d over K, c_dR and a^{⊗d} identify
the perfect Poincaré pairings in degrees i and 2d−i. For a codimension-r algebraic cycle Z,
(c_dR⊗a^{⊗−r})cl_ét(Z)=cl_dR(Z) in H_dR^{2r}(X)⟨r⟩⊗B_dR. Proper pushforward and regular-
immersion Gysin commute in the duality/purity range supplied by EDC.3 and the crystalline
owner. No arbitrary nonproper trace is inferred.
Missing input interfaces: CohomologyComparisons:CP.6/trace-normalized-tate-period, CohomologyComparisons:CP.6/naturality-base-change-and-cup-products, EtaleDualityAndPerverseSheaves:EDC.2:pairings, EtaleDualityAndPerverseSheaves:EDC.3, CrystallineCohomology:CR.3:duality, AlgebraicModuliForArithmeticGeometry:R09.7.

CP6.first_chern_class_comparison — theorem signature OMITTED (G-lean-types).
For a line bundle L on smooth proper X/K or a smooth proper formal model in the common
crystalline/prismatic range, compare its étale Kummer c₁∈H²_ét(X_C,Q_p(1)), de Rham dlog
c₁∈Fil¹H²_dR(X), crystalline PD c₁ and prismatic logarithmic c₁ with their supplied twist
objects. The de Rham rational map uses c_dR⊗a^{-1}; the crystalline and prismatic maps use
the precise Frobenius-linearized comparisons. Claims about the canonical t-normalization or
unrestricted integral semistable cup maps remain separate gaps.
Missing input interfaces: CohomologyComparisons:CP.6/duality-and-cycle-class-compatibility, CohomologyComparisons:CP.1/prismatic-frobenius-pullback-comparison, CohomologyComparisons:CP.1/crystalline-de-rham-overlap-square, EtaleDualityAndPerverseSheaves:EDC.3, EtaleDualityAndPerverseSheaves:EDC.4, PrismaticCohomology:PR.4, PadicHodgeTheory:P8:local-rational.

CP6.higher_chern_and_projective_bundle_comparison — theorem signature OMITTED (G-lean-types).
For a vector bundle E of rank n on smooth proper X in the common range, identify each
supplied c_r(E) under the same comparisons with twist r. On the complete flag bundle, the
classes are the elementary symmetric polynomials in the line-quotient c₁’s; the iterated
projective-bundle formula makes pullback injective. Thus the higher-class statement descends
to X. Preserve the projective-bundle relation and its sign convention as provided by EDC.4
and PR.4.
Missing input interfaces: CohomologyComparisons:CP.6/first-chern-class-comparison, CohomologyComparisons:CP.6/naturality-base-change-and-cup-products, EtaleDualityAndPerverseSheaves:EDC.4, PrismaticCohomology:PR.4, CrystallineCohomology:CR.3.

CP6.geometric_arithmetic_export — application signature OMITTED (G-lean-types).
Return the actual comparison maps and their φ,N,G_K,filtration,duality and twist data to
R06.6, R07 and AutomorphicGaloisRepresentationsPartII. Smooth proper good reduction supplies
crystalline realizations; a proper semistable model supplies semistable realizations; a
proper smooth rigid space over K supplies the potential realization in CP.4. The export does
not make all de Rham representations crystalline. Small-weight integral consumers retain
R07.3’s unramified base, interval and endpoint restrictions and R07.4’s height/ramification
hypotheses.
Missing input interfaces: CohomologyComparisons:CP.2/period-invariants-and-admissibility, CohomologyComparisons:CP.4/semistable-period-comparison, CohomologyComparisons:CP.4/proper-rigid-potential-semistable-comparison, CohomologyComparisons:CP.5/small-weight-integral-interface, CohomologyComparisons:CP.6/duality-and-cycle-class-compatibility.

CP6.habiro_and_trace_specialization_export — application signature OMITTED (G-lean-types).
Export the CP.0 normalization and CP.1/CP.6 commutative maps to HQ.8 for its own q=1, p-adic
and cyclotomic specialization diagrams. The consumer records the base prism/perfectoid ring,
completion ideal, inversions, filtration and BK/Tate twists and proves q-gluing
compatibility in the intersection of the source hypotheses. RefinedTraceMethods owns the
cyclotomic Chern character and its trace-to-prismatic map; CP supplies the class-comparison
diagram into which that character maps. No unconditional analytic/algebraic Habiro
equivalence or identification before base change is claimed.
Missing input interfaces: CohomologyComparisons:CP.0/ainf-specialization-dictionary, CohomologyComparisons:CP.1/prismatic-frobenius-pullback-comparison, CohomologyComparisons:CP.6/first-chern-class-comparison, CohomologyComparisons:CP.6/higher-chern-and-projective-bundle-comparison.

CP6.pan_graded_analytic_decompletion — theorem signature OMITTED (G-lean-types).
In Pan’s modular-curve tower and basis U∈B, suppose G_K acts on O B_dR,k⁺(U) for some finite
K/Q_p. For i≥0, k>i and l>0, taking gr^i commutes with GL₂(Q_p)-locally analytic vectors,
with the χ̃_l isotypic subspace, and with the decompleted G_{K∞}-fixed/G_K-analytic
subspace. The i-th symmetric power of the log Faltings extension filters the latter by
j=0,…,i with graded pieces O_{K^p}^{la,χ̃_l}(U)_K(j)⊗_{O_{V₀}}Ω¹_{V₀}(C)^{⊗(i−j)}. The
stabilized gr^i is independent of k>i; ordinary fixed vectors without the
analytic/decompletion condition are not substituted.
Missing input interfaces: HodgeTateAndCanonicalSubgroups:T6:comparison, HodgeTateAndCanonicalSubgroups:T6:log-sites, CompletedCohomologyPartII:CC.8.

CP6.pan_bounded_torsion_inverse_limit — theorem signature OMITTED (G-lean-types).
For each degree i and k≥1, H^i(X_{K^p},A_inf,X^a/(ker θ)^k) has p-primary torsion killed by
p^n for some n depending on i,k, and is the inverse limit of H^i(X_{K^p},A_inf,X^a/((ker
θ)^k,p^m)). The almost coefficient category and p-completion are retained. There is no
uniform bound in every k or every degree.
Missing input interfaces: CompletedCohomologyPartII:CC.2, CompletedCohomologyPartII:CC.8, AInfCohomology:AI.3, PerfectoidSpaces:P3.

CP6.pan_completed_coefficient_and_flag_descent — theorem signature OMITTED (G-lean-types).
For k≥1, completed cohomology with A_inf/(ker θ)^k coefficients is lim_m
H̃^i(K^p,Z/p^m)⊗_{Z_p}A_inf/((ker θ)^k,p^m). More generally Pan’s coefficient interchange
holds for a p-adically complete p-torsion-free Z_p-module M in the specified completed tower
model. On the perfectoid modular curve, R^jπ_HT,*A_inf,X^a/(ker θ)^k=0 for j>0, giving
H^i(X_{K^p},A_inf,X^a/(ker θ)^k)≃H^i(Fl,π_HT,*A_inf,X^a/(ker θ)^k).
Missing input interfaces: CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit, CompletedCohomologyPartII:CC.4, CompletedCohomologyPartII:CC.8, PerfectoidSpaces:P3, HodgeTateAndCanonicalSubgroups:T6:comparison.

CP6.pan_etale_site_truncated_comparison_map — theorem signature OMITTED (G-lean-types).
For k≥1 construct Pan’s G_Qp-equivariant B_dR,k⁺-linear map
H̃^i(K^p,B_dR,k⁺)→H^i(Fl,B_dR,k⁺), reducing modulo t to the k=1 completed C-coefficient
isomorphism. At finite level use truncated Witt sheaves and, for each k,m, a sufficiently
large projection φ_l:A_inf→W_l(O_C/p) through which A_inf→A_inf/((ker θ)^k,p^m) factors; the
resulting almost maps g_{k,m} are compatible in k,m. After inverse p-adic limits and
p-inversion they give the stated map.
Missing input interfaces: CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit, CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent, AInfCohomology:AI.3, PerfectoidSpaces:P3, ClassicalAdicEtaleCohomology:H5.

CP6.pan_truncated_period_isomorphism — theorem signature OMITTED (G-lean-types).
For Pan’s modular-curve tower, every k≥1 and degree i, the preceding map is a natural G_Qp-
equivariant isomorphism of B_dR,k⁺-modules H̃^i(K^p,B_dR,k⁺)≃H^i(Fl,B_dR,k⁺), with the
source’s truncated period sheaf on Fl.
Missing input interfaces: CohomologyComparisons:CP.6/pan-etale-site-truncated-comparison-map, HodgeTateAndCanonicalSubgroups:T6:comparison, CompletedCohomologyPartII:CC.8.

-/
