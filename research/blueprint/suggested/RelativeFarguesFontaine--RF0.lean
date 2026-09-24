/-
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/RelativeFarguesFontaine--RF0.md` is definitive. These
statements suggest Lean forms so that contributors and reviewers can converge on
names and signatures. They claim no implementation.

BP-RelativeFarguesFontaine--RF0: partial prototype, implementationStatus =
unchecked. Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

NOT COMPILED. No Lean was run for this job and the Mathlib build on this machine
is a shared cache that must not be rebuilt, so elaboration has not been
established. Every proof below is `sorry`.

SCOPE. First part of the roadmap: RF0 with its two substages, RF1, RF2 with its
two substages, and RF3. RF4 belongs to issue #986.

REUSED from the pinned libraries. This roadmap reaches the pins further than its
siblings. `WittVector` and `WittVector.frobenius`; `WittVector.teichmuller`,
which is EXACTLY the multiplicative section the first node asserts and the `[ϖ]`
of the definition of `𝒴_S`; `WittVector.fontaineTheta`, whose kernel the
primitive degree-one ideals are; `PreTilt` and `PreTilt.untilt`;
`IsAdicComplete` and `AdicCompletion`; `IsDiscreteValuationRing`, which is what
`B^+_dR` IS at a geometric untilt; `GradedAlgebra` and `ProjectiveSpectrum`;
`AlgebraicGeometry.LocallyRingedSpace`, the exact level at which the map to the
algebraic curve is asserted; `Valuation`, `SpectralSpace`, `IsLocalization`,
`Ideal.span`; and Tau Ceti's `Huber.Pair`, `ValuationSpectrum.spa` and
`AlgebraicGeometry.InvertibleSheaf`.

ABSENT at both pins: the adic-space and perfectoid layer itself — an index search
found no declaration whose name contains `Perfectoid`, and no diamond. Those are
requested from `AdicSpacesPartII`, `PerfectoidSpaces` and `DiamondsAndVStacks`
and appear below as opaque parameters.

TWO THINGS THE PACKET KEEPS. `V(π)` is NOT removed from `𝒴_S` — the integral
space retains the characteristic-`p` fibre, and `GeometricSatakeAndFusion`'s
comparison exists only because of that. And the map `X_S → X_S^alg` is
constructed FORMALLY, with no ampleness hypothesis; the GAGA equivalence is
`VectorBundlesAndIsocrystals:VB2:ampleness`, and keeping them apart is what stops
the two roadmaps being circular.
-/
import Mathlib.RingTheory.WittVector.Defs
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.WittVector.Isocrystal
import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.Perfection
import Mathlib.FieldTheory.Perfect
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.RingTheory.GradedAlgebra.Basic
import Mathlib.AlgebraicGeometry.ProjectiveSpectrum.Topology
import Mathlib.Geometry.RingedSpace.LocallyRingedSpace
import Mathlib.Topology.Spectral.Basic
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.RingTheory.Localization.Defs
import Mathlib.RingTheory.Ideal.Span

noncomputable section

open CategoryTheory

namespace TauCeti.RelativeFF

/-! ## RF0. Ramified Witt coefficients -/

/-- The local field `E` with uniformizer `π` and residue field `F_q`. -/
variable (E : Type) [Field E] (OE : Type) [CommRing OE] (π : OE) (q : ℕ)

/-- RF0/ramified-witt-universal-property. For a PERFECT `F_q`-algebra `R`, the
unique `π`-adically complete FLAT `O_E`-algebra with `R̃/π = R`, realised as
`W(R) ⊗̂_{W(F_q)} O_E`. In equal characteristic, `E = F_q((π))`, it is `R[[π]]`.

Mathlib has the unramified case; the base change to `O_E` is what is added. -/
def ramifiedWitt (R : Type) [CommRing R] : Type := by sorry

instance (R : Type) [CommRing R] : CommRing (ramifiedWitt OE R) := by sorry

/-- The universal property: unique up to unique isomorphism among `π`-adically
complete flat `O_E`-algebras lifting `R`. Uniqueness is what makes every later
object canonical rather than presentation-dependent. -/
theorem ramifiedWitt_universal (R : Type) [CommRing R] [PerfectRing R q]
    (A : Type) [CommRing A] [Algebra OE A] (flat piAdicComplete liftsR : Prop) :
    flat → piAdicComplete → liftsR → Nonempty (A ≃+* ramifiedWitt OE R) := by
  sorry

/-- The unique MULTIPLICATIVE section `[·] : R → W_{O_E}(R)`. Mathlib has
`WittVector.teichmuller` for the unramified case; this is its base change. -/
def teichmuller (R : Type) [CommRing R] : R →* ramifiedWitt OE R := by sorry

/-- Unit test. `[·]` is multiplicative and is NOT additive; treating it as a ring
map is the standard error. -/
example (R : Type) [CommRing R] (x y : R) :
    teichmuller OE R (x * y) = teichmuller OE R x * teichmuller OE R y := by
  sorry

example (R : Type) [CommRing R] (additive : Prop) : ¬ additive := by
  sorry

/-- Unit test. In equal characteristic `E = F_q((π))` the ring is `R[[π]]`. A
construction that does not degenerate to power series is not this one. -/
example (R : Type) [CommRing R] (equalCharacteristic : Prop) (powerSeries : Type) :
    equalCharacteristic → Nonempty (ramifiedWitt OE R ≃ powerSeries) := by
  sorry

/-- Unit test. `R` must be PERFECT: for a general `F_q`-algebra the lift is not
flat and the reduction is not an isomorphism — the same obstruction Bhatt–Scholze
record for `W(R)`. -/
example (R : Type) [CommRing R] (notPerfect notFlat : Prop) : notPerfect → notFlat := by
  sorry

/-! ## RF0:integral-Y. Retain the integral period space -/

/-- Adic spaces, `Spa` and perfectoid spaces. ABSENT at both pins; owned by
`AdicSpacesPartII` and `PerfectoidSpaces`. -/
variable (AdicSpace : Type) (Perfectoid : Type) (toAdic : Perfectoid → AdicSpace)
variable (spa : ∀ (A : Type) [CommRing A], AdicSpace)

/-- RF0:integral-Y/curly-Y-affinoid-definition.
`𝒴_S = Spa W_{O_E}(R^+) ∖ V([ϖ])`, with `W_{O_E}(R^+)` carrying the
`(π,[ϖ])`-adic topology, for `S = Spa(R,R^+)` affinoid perfectoid over `F_q`.

`V(π)` is NOT removed: the space is over `O_E`, not base-changed to `E`. -/
def curlyY (S : Perfectoid) (Rplus : Type) [CommRing Rplus] (ϖ : Rplus) : AdicSpace := by
  sorry

/-- Independence of the pseudouniformizer: two choices divide powers of each
other, so the removed loci agree. -/
theorem curlyY_pseudouniformizer_independent (S : Perfectoid)
    (Rplus : Type) [CommRing Rplus] (ϖ ϖ' : Rplus) :
    curlyY AdicSpace Perfectoid OE S Rplus ϖ = curlyY AdicSpace Perfectoid OE S Rplus ϖ' := by
  sorry

/-- The `q`-power Frobenius of `R^+` induces an automorphism `φ` of `𝒴_S`. -/
def curlyY.frobenius (S : Perfectoid) (Rplus : Type) [CommRing Rplus] (ϖ : Rplus) :
    AdicSpace → AdicSpace := by
  sorry

/-- Unit test. `V(π)` BELONGS to `𝒴_S`. Removing it gives `Y_S`, a different
space, and deletes the characteristic-`p` fibre that
`GeometricSatakeAndFusion`'s special-fibre comparison needs. -/
example (S : Perfectoid) (Rplus : Type) [CommRing Rplus] (ϖ : Rplus)
    (piVanishingLocusIsIncluded : Prop) :
    piVanishingLocusIsIncluded := by
  sorry

/-- Unit test. The topology is `(π,[ϖ])`-adic, not `π`-adic; with the wrong
topology both the removed locus and the analyticity change. -/
example (twoGeneratorTopology piAdicOnly : Prop) :
    twoGeneratorTopology ∧ ¬ (twoGeneratorTopology ↔ piAdicOnly) := by
  sorry

/-- FS II.1.1. `𝒴_S` is an analytic adic space over `O_E`; its base change to
`Spa O_{E_∞}` is PERFECTOID with tilt the perfectoid open unit disc over `S`; and
sheafiness transports back because `B_{S,[0,n]}` splits off its base change as a
TOPOLOGICAL DIRECT FACTOR. -/
theorem curlyY_perfectoid_after_base_change (S : Perfectoid)
    (baseChangeIsPerfectoid tiltIsOpenUnitDisc splitsAsDirectFactor sheafy : Prop) :
    baseChangeIsPerfectoid ∧ tiltIsOpenUnitDisc ∧ splitsAsDirectFactor ∧ sheafy := by
  sorry

/-- Unit test. Sheafiness is PROVED, by splitting, and not assumed; a
construction that assumes it cannot state this theorem. -/
example (provedBySplitting assumed : Prop) : provedBySplitting ∧ ¬ assumed := by
  sorry

/-- FS II.1.2. `(𝒴_S)^◊ = Spd O_E × S`: giving an untilt `T^♯` with a map
`T^♯ → 𝒴_S` is the same as giving an untilt over `Spa O_E` together with
`T → S`. -/
theorem curlyY_diamond (S : Perfectoid) (Spd_OE Diamond : Type)
    (diamondOf : AdicSpace → Diamond) (prod : Diamond → Perfectoid → Diamond) :
    True := by
  sorry

/-- FS II.1.3. For `S'` an affinoid subset of `S`, `𝒴_{S'} → 𝒴_S` is an open
immersion with cartesian square on spaces, so `𝒴_S` is defined for an arbitrary
perfectoid base by gluing. -/
theorem curlyY_glues (openImmersion cartesian gluesForGeneralBase : Prop) :
    openImmersion ∧ cartesian ∧ gluesForGeneralBase := by
  sorry

/-! ## RF0:annuli. Pass to the generic period domain -/

/-- `Y_S = 𝒴_S ∖ V(π)`. -/
def Y (S : Perfectoid) : AdicSpace := by sorry

/-- The radius function, evaluated at the RANK-ONE generalization, so it factors
through the Berkovich quotient. -/
def rad (S : Perfectoid) : AdicSpace → ℝ := by sorry

/-- `rad(φ(x)) = q · rad(x)`. This is what makes `[1,q]` a fundamental domain and
what closes the two-chart presentation of the curve. -/
theorem rad_frobenius (S : Perfectoid) (x : AdicSpace) (φ : AdicSpace → AdicSpace) :
    rad AdicSpace Perfectoid S (φ x) = q * rad AdicSpace Perfectoid S x := by
  sorry

/-- The annulus `Y_{S,I} = {|π|^b ≤ |[ϖ]| ≤ |π|^a}` for a rational interval
`I = [a,b] ⊆ (0,∞)`, possibly with `a = b`. A RATIONAL subset, hence affinoid. -/
def annulus (S : Perfectoid) (a b : ℚ) : AdicSpace := by sorry

/-- Unit test. `a = b` is allowed: `Y_{S,[1,1]}` and `Y_{S,[q,q]}` are the two
ends glued by `φ`. A definition requiring `a < b` cannot state the gluing. -/
example (S : Perfectoid) (a : ℚ) (isAffinoid : AdicSpace → Prop) :
    isAffinoid (annulus AdicSpace Perfectoid S a a) := by
  sorry

/-- Unit test. `rad` factors through the Berkovich quotient; evaluating at a
higher-rank point directly is not well defined. -/
example (factorsThroughBerkovich : Prop) : factorsThroughBerkovich := by
  sorry

/-- Stein exhaustion. Restrictions between nested annuli have dense image, so
`H^i(Y_{S,I},ℱ) = 0` for `i > 0`, `R¹lim` vanishes, and `H^i(Y_S,ℱ) = 0` for all
`i > 0` and every vector bundle `ℱ`. -/
theorem stein_exhaustion_acyclicity (S : Perfectoid) (F : Type) (i : ℕ) (hi : 0 < i)
    (cohomologyVanishes denseImage R1limVanishes : Prop) :
    denseImage → R1limVanishes ∧ cohomologyVanishes := by
  sorry

/-! ## RF1. Quotient and functoriality in the base -/

/-- `φ` acts freely and totally discontinuously on `Y_S`, so `X_S = Y_S/φ^ℤ`
exists as an adic space; concretely glue `Y_{S,[1,q]}` along
`φ : Y_{S,[1,1]} → Y_{S,[q,q]}`. `X_S` is qcqs when `S` is affinoid. -/
def X (S : Perfectoid) : AdicSpace := by sorry

theorem frobenius_free_and_totallyDiscontinuous (S : Perfectoid)
    (free totallyDiscontinuous twoChartPresentation qcqs : Prop) :
    free ∧ totallyDiscontinuous ∧ twoChartPresentation ∧ qcqs := by
  sorry

/-- The diamond formula, and the map `|X_S| → |S|`.

`X_S` has NO structural morphism of adic spaces to `S`. The map on spaces exists
only because the absolute Frobenius acts trivially on the underlying topological
space, so the two quotients agree. It is qcqs for every `S`. -/
theorem X_diamond_and_map_to_base (S : Perfectoid)
    (noStructuralMorphism mapOnSpacesExists isQcqs : Prop) :
    noStructuralMorphism ∧ mapOnSpacesExists ∧ isQcqs := by
  sorry

/-- Unit test. There is no map of adic spaces `X_S → S`; a signature that
provides one asserts something false. -/
example (S : Perfectoid) (structuralMorphismExists : Prop) :
    ¬ structuralMorphismExists := by
  sorry

/-! ## RF2:integral-divisors. Divisors before removing the special fibre -/

/-- RF2:integral-divisors/div-d-moduli-v-sheaf. `Div^d_𝒴 = (Spd O_E)^d/Σ_d`, and
likewise over `Y` and over the curve. The quotients are taken inside v-sheaves
and REMAIN SMALL. -/
variable (VSheaf : Type)
def DivCurlyY (d : ℕ) : VSheaf := by sorry
def DivY (d : ℕ) : VSheaf := by sorry
def DivX (d : ℕ) : VSheaf := by sorry

/-- Unit test. `Div^0` is the final object. -/
example (final : VSheaf) : DivCurlyY VSheaf 0 = final := by sorry

/-- Unit test. The `Σ_d`-quotient makes the legs UNORDERED, and that is why the
ideal is obtained by v-descent of line bundles and not by choosing
`ξ = ∏ ξ_i` — which exists only after ordering. -/
example (unordered noGlobalGenerator : Prop) : unordered → noGlobalGenerator := by
  sorry

/-- FS VI.1.2. In the ORDERED case the divisor is cut out by `ξ = ∏ ξ_i` with
`ξ_i` a generator of `ker(θ_i)` — Mathlib has `θ` as `WittVector.fontaineTheta` —
and equals `Spa(A,A^+)` with `A = W_{O_E}(R^+)[1/[ϖ]]/ξ`. -/
theorem divisor_product_equation (d : ℕ) (ordered affineForAffinoidS : Prop) :
    ordered → affineForAffinoidS := by
  sorry

/-- FS VI.1.3. `Div^d_𝒴(S)` is EXACTLY the set of closed Cartier divisors whose
pullback along every geometric point is a Cartier divisor of degree `d`. -/
theorem relative_degree_criterion (d : ℕ) (geometricFibreCondition : Prop) :
    geometricFibreCondition := by
  sorry

/-- FS VI.1.4. Bundles on `D_S` form a v-stack over `Div^d`. -/
theorem bundles_on_divisor_vStack (d : ℕ) (isVStack : Prop) : isVStack := by
  sorry

/-- The completed rings `B^+ ⊆ B` along the divisor ideal, assuming `D_S`
affinoid as holds LOCALLY on `S`. -/
def Bplus (d : ℕ) : Type := by sorry
def B (d : ℕ) : Type := by sorry

/-- Unit test. `D_S` is affinoid only LOCALLY on `S`; a construction assuming
global affineness overstates the hypothesis. -/
example (locallyAffinoid globallyAffinoid : Prop) :
    locallyAffinoid ∧ ¬ globallyAffinoid := by
  sorry

/-! ## RF2:untilts. Generic divisors and de Rham completions -/

/-- An untilt IS a primitive degree-one ideal `J ⊆ W(R^+)`, generated by
`ξ = p + [ϖ]α`; any such `ξ` is a nonzerodivisor. -/
def IsPrimitiveDegreeOne (Rplus : Type) [CommRing Rplus] (J : Ideal (ramifiedWitt OE Rplus)) :
    Prop := by
  sorry

theorem untilt_iff_primitive (Rplus : Type) [CommRing Rplus]
    (J : Ideal (ramifiedWitt OE Rplus)) (untiltsCorrespond : Prop) :
    IsPrimitiveDegreeOne OE Rplus J ↔ untiltsCorrespond := by
  sorry

/-- Unit test. `ξ = p + [ϖ]α` is a nonzerodivisor; without that the quotient is
not a Cartier divisor. -/
example (Rplus : Type) [CommRing Rplus] (ξ : ramifiedWitt OE Rplus) (isNonZeroDivisor : Prop) :
    isNonZeroDivisor := by
  sorry

/-- FS II.1.4. An untilt gives a CLOSED IMMERSION `S^♯ ↪ 𝒴_S` presenting `S^♯` as
a closed Cartier divisor, with `0 → A --ξ--> A → B → 0` exact. -/
theorem untilt_isClosedCartierDivisor (S : Perfectoid) (exactSequence : Prop) :
    exactSequence := by
  sorry

/-- `Div¹ = Spd(E)/φ^ℤ`, where the quotient may be computed as a v-sheaf quotient
OR for the topology of open covers — so "locally on `S`" may be read either way.
`Div¹ → *` is proper, representable in spatial diamonds, and cohomologically
smooth. -/
theorem Div1_proper_and_smooth (Proper RepresentableInSpatialDiamonds CohSmooth : VSheaf → Prop) :
    Proper (DivX VSheaf 1) ∧ RepresentableInSpatialDiamonds (DivX VSheaf 1) ∧
      CohSmooth (DivX VSheaf 1) := by
  sorry

/-- `B^+_dR` and `B_dR` for `d = 1`, with the `I_S`-adic filtration. -/
def BdRplus : Type := by sorry
def BdR : Type := by sorry

instance : CommRing BdRplus := by sorry

/-- The graded pieces `I_S^m/I_S^{m+1}` are LINE BUNDLES on `D_S` — Breuil–Kisin
twists — not free modules. Changing the local generator changes the
trivialization but not the completed ring. -/
theorem graded_pieces_are_line_bundles (m : ℕ) (isLineBundle isFree : Prop) :
    isLineBundle ∧ ¬ isFree := by
  sorry

/-- At a geometric untilt `B^+_dR` is a complete DISCRETE VALUATION RING with
residue field the untilt. This is where the Cartan decomposition behind the
Schubert stratification is computed. -/
theorem BdRplus_isDVR [IsDomain BdRplus] : IsDiscreteValuationRing BdRplus := by
  sorry

/-- Unit test. Changing the local generator of `I_S` changes the trivialization
of the graded pieces but NOT the completed ring; a definition depending on the
generator is not well posed. -/
example (generatorIndependent : Prop) : generatorIndependent := by
  sorry

/-! ## RF3. Line bundles and the graded algebra -/

/-- The exact tensor-functor `Isoc_k → Bun(X_S)`, obtained by descending
`D ⊗_{Ĕ} O_{Y_S}` along `φ ⊗ φ`. -/
variable (Isoc Bun : Type) [Category Isoc] [Category Bun] [MonoidalCategory Isoc]
  [MonoidalCategory Bun]
def isocToBundle : Isoc ⥤ Bun := by sorry

instance : (isocToBundle Isoc Bun).Monoidal := by sorry

/-- `O_{X_S}(n) = ℰ(Ĕ, π^{-n}σ)`. THE FUNCTOR REVERSES SLOPES — the source flags
the change of sign in a parenthesis, and it must be fixed once, because it
propagates into every slope statement of `VectorBundlesAndIsocrystals` and
`GeometricSatakeAndFusion`. -/
def twist (n : ℤ) : Bun := by sorry

/-- Unit test. For the simple isocrystal of slope `λ` one sets
`O_{X_S}(-λ) = ℰ(D_λ, φ_λ)`; the opposite convention inverts every slope
statement downstream. -/
example (lam : ℚ) (slopeOfImage : ℚ) : slopeOfImage = -lam := by
  sorry

/-- Unit test. The bundle is obtained by DESCENDING along `φ ⊗ φ` on `Y_S`; a
definition directly on `X_S` cannot express the Frobenius equivariance. -/
example (descendsAlongPhi directOnX : Prop) : descendsAlongPhi ∧ ¬ directOnX := by
  sorry

/-- `P = ⊕_{n ≥ 0} H⁰(X_S, O_{X_S}(n))`, a graded ring, and `X_S^alg = Proj P`. -/
def P : Type := by sorry
instance : CommRing P := by sorry

/-- A natural map of LOCALLY RINGED SPACES `X_S → X_S^alg`, constructed FORMALLY,
WITHOUT any ampleness hypothesis: on the nonvanishing locus of `g ∈ P_n`,
multiplication by `g` is an isomorphism `O_U → O_U(n)`, and the local ring maps
glue.

The GAGA EQUIVALENCE needs global generation and is
`VectorBundlesAndIsocrystals:VB2:ampleness`. Keeping the two apart is what stops
the two roadmaps being circular. -/
def toAlgebraicCurve (S : Perfectoid) :
    AlgebraicGeometry.LocallyRingedSpace := by
  sorry

/-- Unit test. The map exists with NO ampleness hypothesis; only the equivalence
needs one, and conflating the two makes the atlas circular. -/
example (mapNeedsNoAmpleness equivalenceNeedsAmpleness : Prop) :
    mapNeedsNoAmpleness ∧ equivalenceNeedsAmpleness := by
  sorry

/-- Unit test. On the nonvanishing locus of `g ∈ P_n`, multiplication by `g` is
an isomorphism `O_U → O_U(n)` — the whole content of the local formula. -/
example (n : ℕ) (multiplicationIsIso : Prop) : multiplicationIsIso := by
  sorry

/-- Unit test. `P_n` may vanish for small `n`; the construction must not assume
the graded ring is generated in degree one. -/
example (n : ℕ) (mayVanish generatedInDegreeOne : Prop) :
    mayVanish ∧ ¬ generatedInDegreeOne := by
  sorry

end TauCeti.RelativeFF
