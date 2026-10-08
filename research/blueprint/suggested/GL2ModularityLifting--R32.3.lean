import Mathlib.Logic.Relation
import Mathlib.RingTheory.Ideal.MinimalPrime.Basic
import Mathlib.RingTheory.Spectrum.Prime.RingHom
import Mathlib.RingTheory.Spectrum.Prime.Topology

/-!
# Suggested Lean forms: GL2ModularityLifting, R32.3–R32.6

**Standard note.** This file is not the roadmap and is not exhaustive. The roadmap document
`GL2ModularityLifting--R32.3.md` is definitive. These statements suggest Lean forms so that
contributors and reviewers converge on names and signatures. Pinned baseline: Mathlib `082e2d3`,
Tau Ceti `f790474`. No implementation is claimed; the proofs are `sorry`.

Two concrete geometric interfaces can be stated against Mathlib. Their arithmetic specializations
need supplier exports: component subsets of the pseudodeformation spectrum, the potentially-nice
point set, the closure of ordinary arithmetic points, and the trace map to a nonsplit-extension
deformation ring. The definitions below take those actual sets/maps. They do not hide missing
arithmetic conditions behind proposition-valued records.

The indexed omission manifest records the remaining definitions, API names, tests and named
results. Their missing conditions are left out of executable declarations, as required by
PROTOCOL §13. The compiled fragment does not assert an arithmetic modularity theorem.
-/

namespace TauCeti.GL2Lifting

section GoodComponents

variable {I X : Type*}

/-- Pan Definition 7.4.1 as seeded reachability on concrete component subsets.
The parameter `nice` means potentially nice, as in Pan Definition 7.4.1.
The intended seed set is the closure of ordinary arithmetic points. A seed must be potentially nice;
reflexivity allows a one-component seeded chain, not an unseeded empty chain. -/
def panGoodComponent (components : I → Set X) (nice seed : Set X) (i : I) : Prop :=
  ∃ j : I, (∃ x : X, x ∈ nice ∧ x ∈ seed ∧ x ∈ components j) ∧
    Relation.ReflTransGen
      (fun a b : I => ∃ x : X, x ∈ nice ∧ x ∈ components a ∧ x ∈ components b) j i

theorem panGoodComponent_iff (components : I → Set X) (nice seed : Set X) (i : I) :
    panGoodComponent components nice seed i ↔
      ∃ j : I, (∃ x : X, x ∈ nice ∧ x ∈ seed ∧ x ∈ components j) ∧
        Relation.ReflTransGen
          (fun a b : I => ∃ x : X, x ∈ nice ∧ x ∈ components a ∧ x ∈ components b) j i := by
  sorry

theorem panGoodComponent_seed (components : I → Set X) (nice seed : Set X) (i : I)
    (x : X) (hn : x ∈ nice) (hs : x ∈ seed) (hc : x ∈ components i) :
    panGoodComponent components nice seed i := by
  sorry

theorem panGoodComponent_step (components : I → Set X) (nice seed : Set X) (i j : I)
    (hgood : panGoodComponent components nice seed i)
    (x : X) (hn : x ∈ nice) (hi : x ∈ components i) (hj : x ∈ components j) :
    panGoodComponent components nice seed j := by
  sorry

theorem panGoodComponent_mono (components : I → Set X) (nice nice' seed seed' : Set X)
    (hn : nice ⊆ nice') (hs : seed ⊆ seed') (i : I)
    (hgood : panGoodComponent components nice seed i) :
    panGoodComponent components nice' seed' i := by
  sorry

theorem panGoodComponent_congr (components components' : I → Set X)
    (nice nice' seed seed' : Set X) (hc : ∀ j, components j = components' j)
    (hn : nice = nice') (hs : seed = seed') (i : I) :
    panGoodComponent components nice seed i ↔ panGoodComponent components' nice' seed' i := by
  sorry

-- good_component_single_seed
example : panGoodComponent (fun _ : Unit => (Set.univ : Set Unit))
    Set.univ Set.univ () := by
  sorry

-- good_component_empty_seed: arbitrary adjacency still cannot create a seed.
example (components : I → Set X) (nice : Set X) (i : I) :
    ¬ panGoodComponent components nice ∅ i := by
  sorry

-- good_component_two_step_chain: C₀={0}, C₁={0,1}, C₂={1,2}.
example : ∀ i : Fin 3,
    panGoodComponent
      (fun j : Fin 3 => if j = 0 then ({0} : Set ℕ)
        else if j = 1 then {0, 1} else {1, 2})
      {0, 1} {0} i := by
  sorry

-- good_component_non_nice_intersection: the point 1 cannot carry an edge.
example :
    panGoodComponent (fun b : Bool => if b then ({1, 2} : Set ℕ) else {0, 1})
      {0} {0} false ∧
    ¬ panGoodComponent (fun b : Bool => if b then ({1, 2} : Set ℕ) else {0, 1})
      {0} {0} true := by
  sorry

end GoodComponents

section ExtensionComponents

variable {A B : Type*} [CommRing A] [CommRing B]

/-- The incidence construction in Pan Definition 7.4.21. Minimal primes of the source
index its irreducible components. Arithmetic uses the trace map Rᵖˢ → R_B.
The entire target spectrum is used, as in Pan's definition. -/
def panExtensionComponents (f : A →+* B) : Set (PrimeSpectrum A) :=
  {P | P.asIdeal ∈ minimalPrimes A ∧ P ∈ Set.range (PrimeSpectrum.comap f)}

theorem panExtensionComponents_mem_iff (f : A →+* B) (P : PrimeSpectrum A) :
    P ∈ panExtensionComponents f ↔
      P.asIdeal ∈ minimalPrimes A ∧ ∃ Q : PrimeSpectrum B, PrimeSpectrum.comap f Q = P := by
  sorry

theorem panExtensionComponents_minimal (f : A →+* B) (P : PrimeSpectrum A)
    (hP : P ∈ panExtensionComponents f) : P.asIdeal ∈ minimalPrimes A := by
  sorry

theorem panExtensionComponents_id :
    panExtensionComponents (RingHom.id A) = {P : PrimeSpectrum A | P.asIdeal ∈ minimalPrimes A} := by
  sorry

theorem panExtensionComponents_kernel_le (f : A →+* B) (P : PrimeSpectrum A)
    (hP : P ∈ panExtensionComponents f) : RingHom.ker f ≤ P.asIdeal := by
  sorry

theorem panExtensionComponents_comp_subset {C : Type*} [CommRing C]
    (f : A →+* B) (g : B →+* C) :
    panExtensionComponents (g.comp f) ⊆ panExtensionComponents f := by
  sorry

-- extension_components_identity: compatible with minimalPrimes.equivIrreducibleComponents.
example : panExtensionComponents (RingHom.id A) =
    {P : PrimeSpectrum A | P.asIdeal ∈ minimalPrimes A} := by
  sorry

-- extension_components_zero_target: the zero ring has no prime points.
example [Subsingleton B] (f : A →+* B) : panExtensionComponents f = ∅ := by
  sorry

-- extension_components_kernel_obstruction: stronger than the stated minimal-prime test.
example (f : A →+* B) (P : PrimeSpectrum A) (hker : ¬ RingHom.ker f ≤ P.asIdeal) :
    P ∉ panExtensionComponents f := by
  sorry

end ExtensionComponents

/-!
## Indexed omission manifest

The two remaining definitions need R04/IHG determinant-fixed pseudodeformation rings and their
prime-point representations, R31.3 actual completed Hecke quotients and normalization-lattice
reconstruction, and R01 residual/local/induced representations and finite coefficient extension.
The theorem nodes additionally need R06 local Hodge predicates, R19 eigenform attachment,
R21 ordinary lifting, R31 typed support/classicality and R17 Hilbert transfer, as specified by each
node's supplier requests. No guessed type names or weaker placeholder predicates are declared.

Every omitted item below is identified by the packet's exact node/API/test name and statement.
An omitted statement is a planning obligation, not an elaborated theorem with missing hypotheses.
The two concrete definitions above are fully present as signatures, ten lemma signatures and
seven examples; their *arithmetic specializations* remain subject to these suppliers.

### GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting

Let p = 2, E/ℚ₂ finite with ring 𝒪 and residue field k, and ρ : G_ℚ → GL₂(𝒪) continuous, irreducible, odd, unramified outside finitely many primes, with ρ|_{G_{ℚ₂}} de Rham of distinct Hodge–Tate weights. If ρ̄ is modular and has non-solvable image, then ρ is modular: up to a twist, ρ ≅ ρ_f for a cuspidal eigenform f (Tung, Theorem A). Before Tung, Paškūnas proved this over totally real F in which 2 splits completely, for ρ|_{G_{F_v}} potentially semistable with distinct Hodge–Tate weights and det ρ totally odd, under the extra local hypothesis (iv) ρ̄|_{G_{F_v}} ≇ (χ ∗; 0 χ) for every v | 2 (Theorem 1.1). Tung removes (iv), which was the only remaining local restriction at p = 2 (ω = 1 there), by proving that every component of the patched deformation ring lies in the support of the patched module (his Theorem B).

Hypothesis/convention: this is a de Rham theorem with arbitrary distinct Hodge–Tate weights; it is not the potentially Barsotti–Tate theorem of the classical proof (Kisin's (0.1), GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting), and a regular de Rham representation is not Barsotti–Tate after renaming its weights

Hypothesis/convention: residual modularity is a hypothesis; Tung notes that over ℚ it follows from Khare–Wintenberger and Kisin, but his proof does not use that (see R32.6/globalisation-dependency-audit)

Hypothesis/convention: non-solvable residual image replaces the cyclotomic irreducibility condition used for odd p

Hypothesis/convention: The dyadic statement is specified here; the current R32.1/lifting-statement-table defines only the odd-prime statement. The totally-real theorem uses the requested general-field nonsolvable-image preservation, rather than the Q-only R32.1 lemma.

Hypothesis/convention: Tung Theorem 8.0.1 combines an ordinary and a nonordinary component argument; Colmez finiteness and near faithfulness alone do not replace the ordinary input.

Prerequisite interfaces: GL2ModularityLifting:R32.3/totally-real-dyadic-lifting; PadicHodgeTheory:R06.3; ArithmeticGaloisRepresentations:R01.2.

### GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur

Let p be odd and ρ : G_ℚ → GL₂(E), E/ℚ_p finite, continuous, irreducible, odd, unramified outside finitely many primes and potentially semistable at p, with ρ|_{G_{ℚ_p}} of distinct Hodge–Tate weights. Suppose ρ̄^{ss} ≅ χ̄₁ ⊕ χ̄₂ is a sum of two characters, and if p = 3 that χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} ≠ ω (the mod-3 cyclotomic character). Then ρ comes from a cuspidal eigenform up to twist (Pan, Theorem 1.0.2). When ρ|_{G_{ℚ_p}} is reducible (ordinary) and χ̄₁χ̄₂^{−1}|_{G_{ℚ_p}} ≠ 1 this is Skinner–Wiles; Pan supplies the missing ordinary case χ̄₁χ̄₂^{−1}|_{G_{ℚ_p}} = 1 (his §6) and the non-ordinary case (his Theorem 7.1.1).

Hypothesis/convention: irreducibility of ρ is kept: ρ̄ being a sum of characters does not make ρ a sum of characters

Hypothesis/convention: no residual modularity is assumed: residually reducible representations are handled with pseudo-representations

Hypothesis/convention: at p = 3 the case χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω is excluded throughout the paper, for lack of p-adic local Langlands input (Pan's Theorems 3.4.5–3.4.6); Dieulefait–Pacetti quote the theorem only for p ≥ 5

Hypothesis/convention: For p≥5 this is the residually reducible lifting form used by transfer-residually-reducible; it does not need the current odd-only R32.1 statement table.

Prerequisite interfaces: GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity; OrdinaryAutomorphicFormsAndModularityLifting:R21.5; ArithmeticGaloisRepresentations:R01.2; PadicHodgeTheory:R06.3.

### GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur

The usable lifting form is Pan Theorem 8.0.1 at F=ℚ: p odd, ρ continuous irreducible odd finitely ramified, ρ̄|G_ℚ(ζ_p) absolutely irreducible and modular, and ρ|G_ℚp absolutely irreducible regular de Rham. At p=3 exclude residual local extensions η by ηω in either orientation. Then ρ is modular. Pan Theorem 1.0.4 is a broader source consequence, combining earlier ordinary and residually dihedral cases and invoking full Serre modularity over ℚ through Remark 8.0.4; that unconditional consequence is not an input to the independent R33 proof.

Hypothesis/convention: Residual modularity is kept in the lifting statement.

Hypothesis/convention: This comparison node is outside the dependency cone of the modern residually reducible transfer; the source’s unconditional Theorem 1.0.4 is not exported as an independent Serre input.

Prerequisite interfaces: CompletedCohomologyAndLocalGlobalCompatibility:R31.5; CompletedCohomologyAndLocalGlobalCompatibility:R31.4; CompletedCohomologyAndLocalGlobalCompatibility:R31.6.

### GL2ModularityLifting:R32.5/p-three-residually-reducible-branch

Let ρ : G_ℚ → GL₂(ℚ̄₃) be continuous, irreducible, odd and finitely ramified with ρ̄^{ss} ≅ 1 ⊕ χ̄₃, ρ|_{I₃} ≅ (∗ ∗; 0 1) and det ρ = ψχ₃^{k−1} (k ≥ 2, ψ of finite order). Then ρ is modular of weight k (Dieulefait–Pacetti Theorem 1.7 = Skinner–Wiles at p = 3, OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three). This branch is not a consequence of Pan's theorem: Dieulefait–Pacetti quote Pan only for p ≥ 5, and Pan's Theorem 1.0.2 at p = 3 excludes exactly the case χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω, which is this one (χ̄₃|_{G_{ℚ₃}} = ω). Normalisation after twisting: if ρ̄^{ss} ≅ χ̄₁ ⊕ χ̄₂, choose β̄ among χ̄₁,χ̄₂ by the actual unramified ordinary quotient and twist ρ by its inverse Teichmüller lift so that ρ̄^{ss} ≅ 1 ⊕ χ with the trivial character on the unramified quotient; hypothesis (ii) is then read for the twisted ρ.

Hypothesis/convention: Skinner–Wiles' hypothesis (i) χ|_{D₃} ≠ 1 holds automatically for χ = χ̄₃, which is ramified at 3; Dieulefait–Pacetti print it as 'ρ|_{D₃} ≠ (1 0; 0 1)' (source issue OrdinaryAutomorphicFormsAndModularityLifting/E9)

Hypothesis/convention: The inertia-quotient condition is an explicit hypothesis of this theorem. The crystalline-to-ordinary criterion is used separately in crystalline-weights-two-four-completion.

Hypothesis/convention: Pan Theorem 1.0.2 includes odd p=3 but excludes local residual ratio ω; the existing R21.5/theorem-a-at-three already records this accurately.

Hypothesis/convention: ψ is of finite order, as stated in Skinner–Wiles. DP Theorem 1.7 does not repeat this qualification; source issue E1 records it.

Hypothesis/convention: The representation is defined over a finite extension E/Q_3, as required by Skinner–Wiles; the Q̄_3 notation denotes its coefficient embedding.

Prerequisite interfaces: OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three; GL2ModularityLifting:R32.5/ordinary-character-normalisation.

### GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd

Let p be odd and ρ, ρ′ : G_ℚ → GL₂(ℚ̄_p) continuous, odd, finitely ramified, with ρ̄ ≅ ρ̄′, ρ̄|_{G_{ℚ(√p*)}} absolutely irreducible, and ρ|_{G_{ℚ_p}}, ρ′|_{G_{ℚ_p}} de Rham with Hodge–Tate weights {0, k − 1}, {0, k′ − 1} (k, k′ > 1). Then ρ is modular if and only if ρ′ is. This is Dieulefait–Pacetti's Theorem 1.4 read as a transfer statement: if ρ is modular then ρ̄ = ρ̄′ is modular and Theorem 1.4 applies to ρ′. Its proof is R32.2/odd-prime-statement-over-q, for every odd p, 3 included: Kisin's Theorem (2.2.17), with Emerton's Theorem 3.3.22 removing his abelian hypothesis, and the Breuil–Mézard results of Paškūnas, Hu–Tan (p ≥ 5) and Tung (every p > 2) removing the local exclusion.

Hypothesis/convention: absolute irreducibility over ℚ(√p*) is equivalent to that over ℚ(ζ_p) (Dieulefait–Pacetti Lemma 1.13, R32.1/quadratic-cyclotomic-irreducibility); it is the hypothesis in the combined theorem as Tung states it

Hypothesis/convention: residual modularity is the only global modularity input; no Serre conjecture is used (R32.6/globalisation-dependency-audit)

Hypothesis/convention: Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

Prerequisite interfaces: GL2ModularityLifting:R32.2/odd-prime-statement-over-q; GL2ModularityLifting:R32.1/quadratic-cyclotomic-irreducibility; ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.2; PadicHodgeTheory:R06.3.

### GL2ModularityLifting:R32.6/transfer-dyadic

Let ρ, ρ′ : G_ℚ → GL₂(ℚ̄₂) be continuous, odd, finitely ramified, de Rham at 2 with distinct Hodge–Tate weights, with ρ̄ ≅ ρ̄′ of non-solvable image. Then ρ is modular if and only if ρ′ is (Dieulefait–Pacetti Theorem 1.5, from R32.3/dyadic-de-rham-modularity-lifting).

Hypothesis/convention: non-solvable residual image is needed at p = 2

Hypothesis/convention: irreducibility of ρ, ρ′ follows from that of ρ̄

Hypothesis/convention: Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

Prerequisite interfaces: GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting; ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.2; PadicHodgeTheory:R06.3.

### GL2ModularityLifting:R32.6/transfer-residually-reducible

Let p ≥ 5 (or p = 3 outside Pan's exclusion) and ρ : G_ℚ → GL₂(ℚ̄_p) continuous, irreducible, odd and finitely ramified, de Rham at p with distinct Hodge–Tate weights, with ρ̄^{ss} a sum of two characters. Then ρ is modular (Dieulefait–Pacetti Theorem 1.6, from Skinner–Wiles and R32.4/pan-residually-reducible-fontaine-mazur). In a congruence argument this is used when a member of an almost strictly compatible system is residually reducible at its own prime p, possibly with p in the ramification set: no residual modularity and no ordinarity is needed.

Hypothesis/convention: Dieulefait–Pacetti state p ≥ 5; Pan's theorem also covers p = 3 when χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} ≠ ω, and the p = 3 case with ω is R32.5/p-three-residually-reducible-branch

Hypothesis/convention: Modularity is considered up to the specified global geometric character twist; with normalized weights {0,k−1}, the imported twist convention identifies the classical weight k.

Prerequisite interfaces: GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q; ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.2; PadicHodgeTheory:R06.3.

### GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems

For a DP-style rank-two almost strictly compatible system, with odd irreducible characteristic-zero members, all-member de Rham behavior and common weights {0,k−1}, k>1 explicitly supplied, the characteristic-p lifting step can use the modern de Rham transfer statements even when the system’s coefficient-prime WD comparison is absent. Select the branch by residual data: nonsolvable at p=2; absolutely irreducible cyclotomic restriction plus a known modular congruent lift at odd p; reducible at p≥5 (or nonexceptional Pan p=3); normalized ordinary p=3 under its exact extra conditions. Once a member is modular, good Frobenius polynomials identify all semisimple members with the modular-form system. A plain or historical KW almost-strict system alone does not supply the all-member de Rham premise.

Hypothesis/convention: DP Definition 1.10 clauses (4)–(5), not the bare historical KW almost-strict label, supply de Rham behavior at every coefficient prime.

Hypothesis/convention: The coefficient-change theorem consumes a system; it does not prove existence of a system through every regular de Rham lift. The supplier has recorded a gap in DP Theorem 1.11’s claimed general existence.

Prerequisite interfaces: PotentialModularityAndCompatibleSystems:R24.5/compatible-system; PotentialModularityAndCompatibleSystems:R24.5/rank-two-reducibility-independent-of-lambda; GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd; GL2ModularityLifting:R32.6/transfer-dyadic; GL2ModularityLifting:R32.6/transfer-residually-reducible; GL2ModularityLifting:R32.6/transfer-ordinary-three; GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime; ArithmeticGaloisRepresentations:R01.5; AutomorphicGaloisRepresentations:R19.3; PotentialModularityAndCompatibleSystems:R24.5.

### GL2ModularityLifting:R32.6/globalisation-dependency-audit

Source-independence comparison for the transfer dependency cone: use the Q lifting forms with residual modularity explicitly retained, and Pan’s residually reducible theorem with no residual modularity. Do not use Pan 1.0.4’s unconditional residually irreducible consequence (Remark 8.0.4 invokes full Serre), or Emerton §7.3’s unconditional promodularity argument. Tung’s local Breuil–Mézard proof does additionally use suitable auxiliary globalizations: §4.3 Lemma 4.3.3 cites Calegari 3.2, Snowden 8.2.1, and the dyadic HBAV construction in KW II Theorem 6.1; Lemma 4.3.4 cites Paškūnas 3.29 and KW II Lemma 3.5. These have distinct roles from the global lift’s assumed residual modularity. The exact independent supplier proofs, including part 1’s Emerton–Paškūnas/BLGG and Gee inputs, remain the named requests and gap; this comparison is not a certificate that those uninspected proofs are independent.

Hypothesis/convention: not audited here: the global inputs of Tung's Breuil–Mézard theorem (the patched modules of [CEG+16], Emerton–Paškūnas' faithfulness and Barnet-Lamb–Gee–Geraghty's Theorem A.4.1), and Gee's Theorem 4.4.12 of 'Automorphic lifts of prescribed types', which Kisin's proof of (2.2.17) uses. These are requested from CompletedCohomologyAndLocalGlobalCompatibility R31.5–R31.6 and SerreWeightAndLevelOptimisation R20.6

Hypothesis/convention: The exact KW II local and patching inputs are named in the R31.6 request. Their independence from the full Serre endpoint remains an audit obligation in the first gap; this packet does not certify their uninspected proofs.

Prerequisite interfaces: CompletedCohomologyAndLocalGlobalCompatibility:R31.6; SerreWeightAndLevelOptimisation:R20.6.

### GL2ModularityLifting:R32.3/typed-component-specialisation

In Tung §§4–5, with a modular totally odd nonsolvable residual representation over a totally real F in which 2 splits completely, fixed determinant ψε, the specified Steinberg conditions away from 2, auxiliary place v₁, and a product σ of locally algebraic types, suppose the imported Theorem 8.0.1 gives support meeting every component of R∞(σ)[1/2]. Then Rˢ_ψ(σ) is finite over 𝒪 and M(σ)[1/2] is faithful over Rˢ_ψ(σ)[1/2]. Every characteristic-zero point of this global deformation problem, including the point of a prescribed lift of type σ, therefore occurs in algebraic quaternionic forms and is automorphic after Jacquet–Langlands.

Prerequisite interfaces: CompletedCohomologyAndLocalGlobalCompatibility:R31.5; CompletedCohomologyAndLocalGlobalCompatibility:R31.2; DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-iff-support-eq-univ; DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-quotient; GL2AutomorphicRepresentationsAndTransfer:R17.3.

### GL2ModularityLifting:R32.3/totally-real-dyadic-lifting

Let F be totally real with every F_v ≅ ℚ₂ for v|2. Let ρ:G_F→GL₂(𝒪) be continuous, finitely ramified, with modular totally odd residual representation of nonsolvable image, and potentially semistable with distinct Hodge–Tate weights at every v|2. Then ρ is attached, up to twist, to a Hilbert modular form. There is no local exclusion of extensions of a character by itself (Tung Theorem 8.0.3).

Prerequisite interfaces: GL2ModularityLifting:R32.3/typed-component-specialisation; GlobalGaloisDeformations:R04.4; CompletedCohomologyAndLocalGlobalCompatibility:R31.6; GL2AutomorphicRepresentationsAndTransfer:R17.4.

### GL2ModularityLifting:R32.4/nice-prime

Fix all data of Pan §4.1: p odd; F totally real of even degree with p completely split; S⊇Σ_p finite, p|N(v)−1 outside p; χ:G_F,S→𝒪× totally odd, unramified outside p with χ(Frob_v)≡1 for v∈S\Σ_p; p-power tame characters ξ_v; the definite quaternionic completed Hecke algebra T_m and R^{ps,{ξ_v}}↠T_m. A prime q of T_m is nice if p∈q, dim(T_m/q)=1, and there exists a lattice ρ(q)° over the normalization A of T_m/q in k(q) such that: its generic fibre is irreducible; its reduction is a nonsplit extension of the two residual characters; if ρ(q) is induced from G_L for a quadratic L/F, then L∩F(ζ_p)=F; and at every v∈S\Σ_p the lattice representation is the constant lift of its residual representation. A prime of R^{ps,{ξ_v}} is nice when it is the contraction of such a Hecke prime.

Hypothesis/convention: Retain Pan §4.1.2 Assumption 1: the ideal generated by ϖ and T_v−1−χ(Frob_v), v∉S, is an actual maximal ideal m of the completed Hecke algebra. Its central character is ψ=χε and the quaternion algebra is ramified exactly at the infinite places.

Prerequisite interfaces: GlobalGaloisDeformations:R04.1; GlobalGaloisDeformations:R04.2; CompletedCohomologyAndLocalGlobalCompatibility:R31.3; ArithmeticGaloisRepresentations:R01.1; IntegralHeckeAndGaloisDeterminants:IHG.1.

Omitted API `TauCeti.GL2Lifting.PanNicePrime.char_p_dimension`: A nice Hecke prime contains p and has quotient dimension one.

Omitted API `TauCeti.GL2Lifting.PanNicePrime.lattice`: Extract a normalization lattice with irreducible generic fibre, nonsplit reduction and the stated away-p restrictions.

Omitted API `TauCeti.GL2Lifting.PanNicePrime.is_proModular`: The contraction of a nice Hecke prime is pro-modular for Pan’s direct pseudodeformation-to-Hecke quotient from R31.3, equivalently its prime contains the kernel of that quotient.

Omitted API `TauCeti.GL2Lifting.PanNicePrime.dihedral_disjoint`: If the associated representation is induced from a quadratic L, then L∩F(ζ_p)=F.

Omitted API `TauCeti.GL2Lifting.PanNicePrime.mk`: In the stated setup, p∈q, quotient dimension one and existence of a normalization lattice with all four properties in the definition imply the predicate. For a pseudo-ring nice prime, also supply its Hecke prime and contraction equality.

Omitted API `TauCeti.GL2Lifting.PanNicePrime.iff`: The predicate is equivalent to p∈q, quotient dimension one and existence of a normalization lattice with all four properties in the definition. Hecke and pseudo-ring primes are distinguished; the latter has an existential contracted Hecke witness.

Omitted example `nice_prime_characteristic_zero_rejected` (non-example): A prime not containing p is not nice, even if it is a classical automorphic point.

Omitted example `nice_prime_split_lattice_rejected` (non-example): A proposed witness lattice with split residual reduction does not satisfy PanNicePrime.lattice; irreducible generic fibre alone does not validate that witness.

Omitted example `nice_prime_constant_away_p` (characterisation): With all other clauses satisfied, the away-p clause is equivalent to equality of ρ(q)°|G_Fv with the constant residual lift for every v∈S\Σ_p; finite image alone does not suffice.

### GL2ModularityLifting:R32.4/potentially-nice-prime

For Pan §7.1’s global determinant-fixed ring R^{ps} over a totally real abelian F split at p, a prime q is potentially nice in the sense of §7.2.4 if p∈q, dim(R^{ps}/q)=1, the associated semisimple representation ρ(q) is irreducible, and ρ(q)|G_Fv has finite image for every v∈S\Σ_p. This is a Galois condition: it does not assert Hecke occurrence, a nonsplit normalization lattice, or a constant away-p lift.

Prerequisite interfaces: GlobalGaloisDeformations:R04.2; IntegralHeckeAndGaloisDeterminants:IHG.1; ArithmeticGaloisRepresentations:R01.1.

Omitted API `TauCeti.GL2Lifting.PanPotentiallyNicePrime.char_p_dimension`: Extract p∈q and dim R^{ps}/q=1.

Omitted API `TauCeti.GL2Lifting.PanPotentiallyNicePrime.finite_away`: Each away-p local restriction has finite image.

Omitted API `TauCeti.GL2Lifting.PanPotentiallyNicePrime.of_nice`: A contracted Pan nice prime, in the same §7 global problem with its finite residual away-p lift, is potentially nice.

Omitted API `TauCeti.GL2Lifting.PanPotentiallyNicePrime.coefficient_extension`: For a finite unramified coefficient extension and a prime above q, the predicate is preserved when the generic representation remains irreducible.

Omitted API `TauCeti.GL2Lifting.PanPotentiallyNicePrime.mk`: In the stated setup, p∈q, quotient dimension one, irreducible associated representation and finite image at every away-p place imply the predicate.

Omitted API `TauCeti.GL2Lifting.PanPotentiallyNicePrime.iff`: The predicate is equivalent to p∈q, quotient dimension one, irreducible associated representation and finite image at every away-p place; no Hecke-image premise is added.

Omitted example `potentially_nice_reducible_rejected` (non-example): A dimension-one characteristic-p prime with a sum-of-characters generic representation is not potentially nice.

Omitted example `potentially_nice_no_away_places` (degenerate): When S=Σ_p, the finite-away-p clause is vacuous; the other three clauses remain necessary.

Omitted example `potentially_nice_not_proModular_by_definition` (characterisation): For fixed q and associated representation, changing the candidate Hecke quotient does not change the potentially-nice predicate; it changes whether q is a contracted nice Hecke prime.

### GL2ModularityLifting:R32.4/nice-prime-component-bridge

In Pan §4.1’s setup, let x be a maximal ideal of R^{ps,{ξ_v}}[1/p] such that ρ(x)|G_Fv is irreducible and de Rham with distinct Hodge–Tate weights for every v|p. If an irreducible component contains x and a nice prime q, and if p=3 the local residual ratio is not ω^{±1}, then ρ(x) is regular algebraic cuspidal automorphic over F (Corollary 4.1.8).

Prerequisite interfaces: GL2ModularityLifting:R32.4/nice-prime; CompletedCohomologyAndLocalGlobalCompatibility:R31.5; CompletedCohomologyAndLocalGlobalCompatibility:R31.4; GL2AutomorphicRepresentationsAndTransfer:R17.3; CompletedCohomologyAndLocalGlobalCompatibility:R31.3; PadicHodgeTheory:R06.2.

### GL2ModularityLifting:R32.4/large-component-at-regular-point

In Pan §7.1, let F be totally real abelian, p split, χ=det ρ totally odd, and ρ:G_F,S→GL₂(𝒪) irreducible with residual trace 1+χ̄. Let x be the prime of its trace in the determinant-fixed R^{ps}. Then dim (R^{ps})_x≥2[F:ℚ], and there is a component C through x with dim C≥1+2[F:ℚ]. After enlarging coefficients, inertia away from p on the generic point of C is a sum of two finite-order characters.

Hypothesis/convention: For the component used in this proof, retain Pan §7.1.1–7.1.2: χ is de Rham at the p-places, the odd residual ratio χ̄ extends to G_Q, and the solvable field/coefficient enlargement has been performed with d=[F:Q]>|S\Σ_p|+2. These are the setup hypotheses used by the downstream ordinary-density and trace-cut arguments.

Prerequisite interfaces: GlobalGaloisDeformations:R04.2; GlobalGaloisDeformations:R04.3; ArithmeticGaloisDuality:R02.6.

### GL2ModularityLifting:R32.4/generic-ordinary-intersection

With C as in large-component-at-regular-point and χ̄|G_Fv≠1,ω^{±1} at every v|p, form C^{ord}=C∩Spec R^{ps,ord} using the imported local reducibility quotients. Then dim C^{ord}≥1+[F:ℚ]. There is a component C₁^{ord} finite and surjective over Spec Λ_F, of that dimension, whose irreducible regular de Rham ordinary points are dense and modular.

Hypothesis/convention: The degree enlargement of §7.1.2 ensures [F:ℚ]>|S\Σ_p|+2.

Hypothesis/convention: The local ratio hypothesis excludes both cyclotomic ratios; that branch has a two-generator ideal and a separate proof.

Prerequisite interfaces: GL2ModularityLifting:R32.4/large-component-at-regular-point; LocalGaloisDeformationRings:R08.6; OrdinaryAutomorphicFormsAndModularityLifting:R21.4; OrdinaryAutomorphicFormsAndModularityLifting:R21.5.

### GL2ModularityLifting:R32.4/scalar-ordinary-intersection

With the same global C, if χ̄|G_Fv=1 at every v|p, use R₁^{ps,ord}, which remembers a chosen lifting ψ_{v,1} of the trivial local character with T|G_Fv=ψ_{v,1}+χψ_{v,1}^{−1} and ψ_{v,1}-ordinarity. Its pullback C^{ord,1} has dimension at least 1+[F:ℚ], and a component finite surjective over Λ_F with dense modular regular de Rham points, as in Pan Lemma 7.3.1 and Corollary 7.3.2.

Prerequisite interfaces: GL2ModularityLifting:R32.4/large-component-at-regular-point; OrdinaryAutomorphicFormsAndModularityLifting:R21.3; OrdinaryAutomorphicFormsAndModularityLifting:R21.4; OrdinaryAutomorphicFormsAndModularityLifting:R21.5; LocalGaloisDeformationRings:R08.6.

### GL2ModularityLifting:R32.4/potentially-nice-base-change

In Pan §7.1–§7.2, suppose C^{ord} (or its chosen-character cover) has a component C₁ finite surjective over Λ_F, with dense irreducible modular regular de Rham points, and [F:ℚ]>|S\Σ_p|+2. Then C₁ contains a potentially nice q. A finite totally real solvable F₁/F, split at p and of even degree, can be chosen so that the contractions x′,q′ of x,q to the determinant-fixed problem R^{ps,1}_{F₁} lie on one component, q′ is nice, and that problem has a nonzero completed Hecke quotient.

Prerequisite interfaces: GL2ModularityLifting:R32.4/potentially-nice-prime; GL2ModularityLifting:R32.4/nice-prime; GL2ModularityLifting:R32.4/large-component-at-regular-point; GlobalGaloisDeformations:R04.4; GL2AutomorphicRepresentationsAndTransfer:R17.4; CompletedCohomologyAndLocalGlobalCompatibility:R31.3; GlobalGaloisDeformations:R04.3.

### GL2ModularityLifting:R32.4/good-component

Pan Definition 7.4.1: a component C of Spec R^{ps} is good if a finite chain C₁,…,C_t=C has potentially nice q₁,…,q_t, with q_i∈C_{i−1}∩C_i for i≥2, and q₁∈C₁∩closure(A^{ord}), where A^{ord} is the set of irreducible regular de Rham ordinary primes of Corollary 7.2.3. A chain of length one is allowed. Equivalently, on the component index set, take the reflexive transitive closure of adjacency by a potentially nice common point, starting at a component containing such a point in closure(A^{ord}). The prototype takes concrete component subsets, a potentially-nice point set and the seed-point set; its intended specialization is this spectrum.

Prerequisite interfaces: GL2ModularityLifting:R32.4/potentially-nice-prime; mathlib:Relation.ReflTransGen; mathlib:Relation.ReflTransGen.trans; mathlib:Relation.reflTransGen_iff_eq; OrdinaryAutomorphicFormsAndModularityLifting:R21.4.

Concrete definition, API signatures and examples: see the executable sections above.

### GL2ModularityLifting:R32.4/extension-components

Pan Definition 7.4.21: for a nonzero extension class B∈Ext¹_{E[G_F,S]}(ψ₁,ψ₂), let R_B be the imported determinant-fixed characteristic-zero deformation ring of the nonsplit extension ρ_B. Under its trace map f_B:R^{ps}→R_B, define Z_B to be the components of Spec R^{ps} whose generic points lie in the image of Spec R_B→Spec R^{ps}. For a general ring map f:A→B the underlying incidence construction is the set of prime points P with P.asIdeal∈minimalPrimes A and P in range(Spec f). The arithmetic specialization uses f_B; scalar-equivalent extension classes have the same Z_B under the deformation comparison.

Prerequisite interfaces: GlobalGaloisDeformations:R04.2; IntegralHeckeAndGaloisDeterminants:IHG.1; mathlib:PrimeSpectrum.comap; mathlib:minimalPrimes; mathlib:minimalPrimes.equivIrreducibleComponents.

Concrete definition, API signatures and examples: see the executable sections above.

### GL2ModularityLifting:R32.4/extension-component-control

In Pan §7.4.14–7.4.20, p≥5, F is abelian totally real, split at p, d=[F:ℚ]>|S\Σ_p|+2, and ψ₁/ψ₂=εθ with θ finite order and εθ totally odd. For nonzero B, the determinant-fixed R_B satisfies dim R_B^{red}≤d+1, every component has dimension ≥2d, and its connectedness dimension is ≥2d−1. If Q∉Spec R_B^{red}, then dim R^{ps}/(Q∩R^{ps})≥1+dim R_B/Q; minimal primes of R_B contract to minimal primes of R^{ps}. Here R_B^{red} denotes the reduced closed reducible locus, not the reduced ring R_B modulo its nilradical.

Prerequisite interfaces: GL2ModularityLifting:R32.4/extension-components; GlobalGaloisDeformations:R04.2; GlobalGaloisDeformations:R04.3; ArithmeticGaloisDuality:R02.6; DeformationAndDerivedPatchingAlgebra:R03.6.

### GL2ModularityLifting:R32.4/extension-component-propagation

Under extension-component-control’s hypotheses, for each nonzero B, if one component in Z_B is good then all components in Z_B are good (Pan Corollary 7.4.22).

Hypothesis/convention: The degree is enlarged sufficiently for the strict dimension inequalities of the proof; they are not asserted for d=1.

Prerequisite interfaces: GL2ModularityLifting:R32.4/extension-component-control; GL2ModularityLifting:R32.4/good-component; GL2ModularityLifting:R32.4/potentially-nice-prime; GL2ModularityLifting:R32.4/potentially-nice-base-change; GlobalGaloisDeformations:R04.3.

### GL2ModularityLifting:R32.4/cyclotomic-component-connectedness

In Pan §7.4, p≥5 and after the coefficient, twist and degree enlargement of §7.1.2, suppose χ̄|G_Fv=ω at every v|p, with C the large component through the given irreducible regular de Rham point. Then C is good (Proposition 7.4.3). The inverse-cyclotomic orientation is obtained by relabelling and twisting; the p=3 cyclotomic case is excluded.

Prerequisite interfaces: GL2ModularityLifting:R32.4/large-component-at-regular-point; GL2ModularityLifting:R32.4/good-component; GL2ModularityLifting:R32.4/generic-ordinary-intersection; GL2ModularityLifting:R32.4/potentially-nice-base-change; GL2ModularityLifting:R32.4/extension-components; GL2ModularityLifting:R32.4/extension-component-control; GL2ModularityLifting:R32.4/extension-component-propagation; LocalGaloisDeformationRings:R08.6; GlobalGaloisDeformations:R04.2; GlobalGaloisDeformations:R04.3; IntegralHeckeAndGaloisDeterminants:IHG.1; OrdinaryAutomorphicFormsAndModularityLifting:R21.4; OrdinaryAutomorphicFormsAndModularityLifting:R21.5; DeformationAndDerivedPatchingAlgebra:R03.6.

### GL2ModularityLifting:R32.4/nonordinary-hilbert-modularity

Let p>2, F/ℚ abelian totally real with p completely split, and ρ:G_F→GL₂(𝒪) continuous irreducible and finitely ramified. Assume ρ̄^{ss}=χ̄₁⊕χ̄₂, χ̄₁/χ̄₂ extends to G_ℚ and takes value −1 at every complex conjugation. At every v|p, require ρ|G_Fv irreducible de Rham with distinct Hodge–Tate weights, and when p=3 require the local residual ratio not ω^{±1}. Then ρ is a twist of a Hilbert modular representation (Pan Theorem 7.1.1).

Prerequisite interfaces: GL2ModularityLifting:R32.4/large-component-at-regular-point; GL2ModularityLifting:R32.4/generic-ordinary-intersection; GL2ModularityLifting:R32.4/scalar-ordinary-intersection; GL2ModularityLifting:R32.4/potentially-nice-base-change; GL2ModularityLifting:R32.4/good-component; GL2ModularityLifting:R32.4/cyclotomic-component-connectedness; GL2ModularityLifting:R32.4/nice-prime-component-bridge; ArithmeticGaloisRepresentations:R01.1; GL2AutomorphicRepresentationsAndTransfer:R17.4; GlobalGaloisDeformations:R04.4.

### GL2ModularityLifting:R32.5/ordinary-character-normalisation

Let ρ be a continuous irreducible odd finitely ramified 3-adic representation with an ordinary local quotient β unramified at 3, residual characters ᾱ,β̄ globally with β̄ restricting to the reduction of that quotient, and determinant ψε^{k−1} with ψ finite order and integer k≥2. Let η be the Teichmüller lift of the global character β̄ and twist by η^{−1}. Then the residual characters become ᾱβ̄^{−1},1, the local quotient remains unramified (hence trivial on inertia), det(ρ⊗η^{−1})=(ψη^{−2})ε^{k−1}, and the Hodge–Tate weights and oddness are unchanged. If ᾱβ̄^{−1}=ω₃ globally, this is exactly the imported Skinner–Wiles p=3 interface; otherwise a nontrivial local ratio is sufficient for its more general distinguished theorem.

Prerequisite interfaces: ArithmeticGaloisRepresentations:R01.1; ArithmeticGaloisRepresentations:R01.2; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three.

### GL2ModularityLifting:R32.5/crystalline-weights-two-four-completion

Let ρ:G_ℚ→GL₂(E), E/ℚ₃ finite, be irreducible, odd, continuous, finitely ramified and crystalline at 3 with Hodge–Tate weights {0,k−1}, k∈{2,4}. If its residual semisimplification is a sum of two global characters, then ρ is modular of weight k. In the level-one branch of DP, normalization has residual characters 1,ω₃; without level one the general distinguished Skinner–Wiles theorem still applies after quotient-character normalization.

Prerequisite interfaces: GL2ModularityLifting:R32.5/ordinary-character-normalisation; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/crystalline-reducible-reduction-is-ordinary; OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q; ArithmeticGaloisRepresentations:R01.2; GL2ModularityLifting:R32.5/p-three-residually-reducible-branch.

### GL2ModularityLifting:R32.6/ramified-reducible-coefficient-prime

Let R be a rank-two system over ℚ in the DP Definition 1.10 sense, weight k>1, whose members are odd, semisimple and finitely ramified. Let λ|p with p in the ramification set S, p≥5, and suppose ρ_λ is irreducible in characteristic zero while ρ̄_λ^{ss} is a sum of two characters. Then ρ_λ is modular by Pan, without any comparison of WD(ρ_λ|G_ℚp) with the system parameter at p, and its good Frobenius polynomials identify the system with the modular system of that eigenform. The same conclusion at p=3 requires the nonexceptional Pan ratio, or the explicitly normalized ordinary hypotheses of R32.5. Irreducibility and oddness are checked hypotheses, not consequences of bare weak compatibility.

Hypothesis/convention: The all-member de Rham and common regular Hodge–Tate-weight clauses of DP Definition 1.10 are explicit extra data on the R24.5 compatible-system carrier. The historical KW almost-strict definition alone does not contain them.

Prerequisite interfaces: PotentialModularityAndCompatibleSystems:R24.5/compatible-system; GL2ModularityLifting:R32.6/transfer-residually-reducible; GL2ModularityLifting:R32.5/p-three-residually-reducible-branch; PadicHodgeTheory:R06.3; ArithmeticGaloisRepresentations:R01.5; AutomorphicGaloisRepresentations:R19.3; PotentialModularityAndCompatibleSystems:R24.5.

### GL2ModularityLifting:R32.6/transfer-ordinary-three

Let ρ,ρ′ be continuous irreducible odd finitely ramified 3-adic representations. Suppose each, after a specified finite-order quotient-character normalization, has residual semisimplification 1⊕ω₃, is of inertia shape (∗ ∗;0 1), and has determinant finite order times ε^{k−1} for its own integer k≥2. Then each is modular, hence modularity is equivalent for the two lifts. Neither identical weights nor identical inertial types are required. Congruence alone does not imply the ordinary hypotheses on the second lift.

Prerequisite interfaces: GL2ModularityLifting:R32.5/ordinary-character-normalisation; GL2ModularityLifting:R32.5/p-three-residually-reducible-branch; ArithmeticGaloisRepresentations:R01.1.

-/

end TauCeti.GL2Lifting
