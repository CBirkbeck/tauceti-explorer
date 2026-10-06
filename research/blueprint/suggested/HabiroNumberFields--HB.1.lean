import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.NumberTheory.NumberField.InfinitePlace.Ramification
import Mathlib.NumberTheory.NumberField.Discriminant.Different
import Mathlib.NumberTheory.Cyclotomic.Gal
import Mathlib.RingTheory.RamificationInertia.Ramification
import Mathlib.RingTheory.RamificationInertia.Inertia
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.RepresentationTheory.Basic

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/HabiroNumberFields--HB.1.md` is definitive.
These statements suggest Lean forms so contributors and reviewers converge
on names and signatures. Every proof is a placeholder; no implementation is
claimed. This follow-up imports the accepted parent rather than redefining its
Bloch groups, eigenspaces, finite coefficient K-theory, or Chern classes.

The finite-group statements, global ideal statement and natural unit-action
statement below use the pinned Mathlib carriers. The three arithmetic contracts
at the end require unavailable supplier K-theory, étale-cohomology and residual
eigenspace interfaces. They are
recorded explicitly as mathematical contracts, rather than as invented
proposition-valued carriers. Elaborating this file checks only its active
signatures. It does not check the commented supplier contracts.
-/

noncomputable section

open scoped TensorProduct
open NumberField

namespace TauCeti.HabiroNumberFields

/-! Node `finite-endomorphism-obstruction-criterion`.
Surjectivity modulo n detects n-torsion in the kernel of an endomorphism of
a finite abelian group. There is no claim that invariants and coinvariants
are canonically isomorphic.
-/
theorem finiteEndomorphism_torsionKernel_eq_zero
    {A : Type*} [AddCommGroup A] [Finite A] (n : ℕ) (f : A →+ A)
    (hmod : ∀ x : A, ∃ y z : A, x = f y + n • z)
    (x : A) (hx : n • x = 0) (hfx : f x = 0) : x = 0 := by
  sorry

/-! Node `injective-exact-map-eigenclass-lift`.
The hypotheses describe an exact sequence and its actions. No invertibility
of the order of G is assumed. In particular this applies at p-power orders.
-/
theorem eigenclass_existsUnique_lift
    {R G U M C : Type*} [CommRing R] [Group G]
    [AddCommGroup U] [Module R U] [AddCommGroup M] [Module R M]
    [AddCommGroup C] [Module R C]
    (ρU : Representation R G U) (ρM : Representation R G M)
    (ρC : Representation R G C) (η : G →* Rˣ)
    (i : U →ₗ[R] M) (δ : M →ₗ[R] C)
    (hi : Function.Injective i) (hexact : LinearMap.range i = LinearMap.ker δ)
    (hi_equivariant : ∀ g u, i (ρU g u) = ρM g (i u))
    (hδ_equivariant : ∀ g x, δ (ρM g x) = ρC g (δ x))
    (hC : ∀ c : C, (∀ g : G, ρC g c = (η g : R) • c) → c = 0)
    (x : M) (hx : ∀ g : G, ρM g x = (η g : R) • x) :
    ∃! u : U, i u = x ∧ ∀ g : G, ρU g u = (η g : R) • u := by
  sorry

/-! Node `cyclotomic-prime-valuation-action`.
The statement uses global ideals and Mathlib's actual e and f carriers.
Its proof imports the existing local Eisenstein and completion dictionary.
-/
theorem cyclotomic_primePrimes_fixed
    (F L : Type*) [Field F] [Field L] [NumberField F] [NumberField L]
    [Algebra F L] [FiniteDimensional F L]
    (p m : ℕ) [Fact p.Prime] (hp : 2 < p) (hm : 0 < m)
    [NeZero (p ^ m)] [IsCyclotomicExtension {p ^ m} F L]
    {ζ : L} (hζ : IsPrimitiveRoot ζ (p ^ m))
    (hdisc : ¬ (p : ℤ) ∣ NumberField.discr F) :
    Function.Surjective (hζ.autToPow F) ∧
      Module.finrank F L = Nat.totient (p ^ m) ∧
      (∀ q : Ideal (𝓞 F), q.IsPrime → q ≠ ⊥ → (p : 𝓞 F) ∈ q →
        ∃! P : Ideal (𝓞 L), P.IsPrime ∧ P.LiesOver q) ∧
      (∀ P : Ideal (𝓞 L), P.IsPrime → (p : 𝓞 L) ∈ P →
        P.ramificationIdx (𝓞 F) = Nat.totient (p ^ m) ∧
          P.inertiaDeg (𝓞 F) = 1 ∧
          ∀ σ : L ≃ₐ[F] L,
            Ideal.map (NumberField.RingOfIntegers.mapRingHom σ.toRingHom) P = P) := by
  sorry

/-! Node `odd-cyclotomic-unit-multiplicity`.
This is the ordinary integral unit group, not the distinguished subgroup
usually called cyclotomic units. The proof uses the pinned conjugation-existence
theorem at real base places; its cyclotomic specialization also uses
`cyclotomic-prime-valuation-action`.
The statement is the exact application of the logarithmic argument that HB.1
needs. It also covers the trivial extension of a totally imaginary field:
the nontrivial-character hypothesis then has no instances. The action on units
is restriction of the field automorphism; on infinite places Mathlib uses
σ • w = w ∘ σ⁻¹. The scalar ℂ is fixed in the tensor action.

The span in the conclusion is the eigenspace: the set of simultaneous
eigenvectors is already a complex linear subspace. It avoids introducing a
second carrier for the eigenspace owned by the accepted parent.
-/
theorem oddCharacter_unitMultiplicity
    (F L : Type*) [Field F] [Field L] [NumberField F] [NumberField L]
    [Algebra F L] [FiniteDimensional F L] [IsGalois F L]
    [NumberField.IsTotallyComplex L]
    (η : (L ≃ₐ[F] L) →* ℂˣ)
    (hη : ∃ σ : L ≃ₐ[F] L, (η σ : ℂ) ≠ 1)
    (hodd : ∀ (w : NumberField.InfinitePlace L) (σ : L ≃ₐ[F] L),
      (w.comap (algebraMap F L)).IsReal → σ ∈ MulAction.stabilizer (L ≃ₐ[F] L) w →
      σ ≠ 1 → (η σ : ℂ) = -1) :
    Module.finrank ℂ
      (Submodule.span ℂ
        {x : ℂ ⊗[ℤ] Additive ((𝓞 L)ˣ) |
          ∀ σ : L ≃ₐ[F] L,
            TensorProduct.map (LinearMap.id : ℂ →ₗ[ℤ] ℂ)
              ((Units.map
                (NumberField.RingOfIntegers.mapRingHom σ.toRingHom).toMonoidHom
                ).toAdditive.toIntLinearMap) x = (η σ : ℂ) • x}) =
      NumberField.InfinitePlace.nrComplexPlaces F := by
  sorry

/-! The arithmetic contracts use upstream objects absent at the pin.
The names agree with the packet; none is an active Lean declaration here.

Node `keune-picard-eigen-obstruction`:
`picard_inverseCyclotomicEigen_torsion_eq_zero`.
F number field, p odd, m≥1, p∤disc(F), p∤#K₂(𝓞 F), n=p^m,
L=F(ζ_n), G=Gal(L/F), χ(σ) specified by σζ=ζ^χ(σ):
(Pic(𝓞 L[1/p])[n])^{χ⁻¹}=0. Import Keune's injection from
ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection. Its original-source
hypotheses remain a recorded gap at that supplier. The injection is on
(Pic/n)_{χ⁻¹}, not on Pic[n]. Use the finite-endomorphism criterion above
after choosing a generator of cyclic G.

Node `ordinary-unit-eigenclass-lift`:
`etale_inverseCyclotomicEigen_unitLift`.
Under the hypotheses of the Picard-obstruction contract, every χ⁻¹-eigenclass
in H¹_ét(𝓞 L[1/p],μ_n) has a unique preimage in
((𝓞 L)ˣ/((𝓞 L)ˣ)^n)^{χ⁻¹} under Kummer followed by inclusion.
The étale Kummer/localization compatibility is requested at M.1's realization
interface, alongside the field Kummer supplier; M.3 is the K₂ comparison.
Use the injective exact-map lemma twice: first for Kummer, then for
0→U/n→U_p/n→D/n→0, where D is the image of the integer valuation map.
Do not replace D/n by (ℤ/n)^{S_p} without checking saturation of D.
This is an eigenCLASS lift. It does not assert an eigenunit representative.
The inherited c_ζ factors through this lift; its finite Chern input is the
requested early M.8 prefix, not the whole cyclic late stage M.8.

Node `prime-unit-torsion-exact-sequence`:
`unit_inverseCyclotomicEigen_torsionSequence`.
F number field, p odd and p∤disc(F), L=F(ζ_p), U=(𝓞 L)ˣ,
T=NumberField.Units.torsion L, χ:G≃(ℤ/p)ˣ. There is an exact sequence
0→(T/T^p)^{χ⁻¹}→(U/U^p)^{χ⁻¹}→((U/T)/(U/T)^p)^{χ⁻¹}→0.
The right term has F_p-dimension r₂(F). The left term has dimension 1 for
p=3 and 0 for p≥5; hence the middle dimension is r₂(F)+[p=3].
Use the integral logarithmic lattice, the inverse Teichmüller character, and
the projector only for |G|=p−1. The complex finrank statement above alone
does not determine a mod-p eigenspace without this integral comparison.
The pinned `NumberField.Units.basisModTorsion` supplies the finite free
integral quotient, whose p-torsion vanishes in the tensor exact sequence.
-/

end TauCeti.HabiroNumberFields
