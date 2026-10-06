import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.Algebra.Group.Hom.Defs
import Mathlib.Algebra.Group.TypeTags.Basic
import Mathlib.Algebra.Group.Prod
import Mathlib.Algebra.Group.PUnit
import Mathlib.Algebra.Group.Subgroup.Ker

/-!
# Suggested declarations for ShimuraVarieties V0–V7

This file is not the roadmap and is not exhaustive. The roadmap document is
`research/blueprint/readmes/ShimuraVarieties--V0.md`; independent review has recorded
corrections it still needs. The packet and review report specify those corrections.
These statements suggest Lean forms so contributors and reviewers converge on names and signatures.
Every proposed declaration remains unchecked; proof placeholders claim no implementation.

The pinned libraries do not yet have the analytic-space category, pure Shimura datum,
special-pair predicate, canonical-model condition, or connected Galois extension needed
for the advanced signatures. Protocol §13 requires leaving unstated conditions out
honestly. The omission manifest below gives their names and mathematical
specifications, including the explicitly unresolved boundary predicate.
It contains no replacement predicates or assumed existence classes.

The code that does elaborate specifies two genuine native slices: the diagonal/right
orbit carrier, and inversion of arithmetic reciprocity in an abelian target. The groups
are the actual rational/finite-adelic groups when supplied, and the domain is the actual
Shimura domain when supplied. This code gives no analytic structure or topology.
-/

namespace TauCeti.Shimura

universe u v w z

/-- The unique actual action on the singleton domain. -/
instance singletonAction (Q : Type u) [Group Q] : MulAction Q PUnit where
  smul _ _ := PUnit.unit
  one_smul _ := Subsingleton.elim _ _
  mul_smul _ _ _ := Subsingleton.elim _ _

section Points
variable {Q : Type u} {A : Type v} {X : Type w}
variable [Group Q] [Group A] [MulAction Q X]

/-- The left action uses an inverse on the right, so the two actions commute. -/
@[instance_reducible] def doubleAction (ι : Q →* A) (K : Subgroup A) : MulAction (Q × K) (X × A) where
  smul q xa := (q.1 • xa.1, ι q.1 * xa.2 * (q.2 : A)⁻¹)
  one_smul := by sorry
  mul_smul := by sorry

/-- The actual two-sided orbit relation, using the native orbit setoid. -/
def pointSetoid (ι : Q →* A) (K : Subgroup A) : Setoid (X × A) :=
  letI := doubleAction (X := X) ι K
  MulAction.orbitRel (Q × K) (X × A)

/-- V1/analytic-points: retain both the domain and the finite-adelic coordinate. -/
def AnalyticPoints (ι : Q →* A) (K : Subgroup A) : Type (max v w) :=
  Quotient (pointSetoid (X := X) ι K)

namespace AnalyticPoints

variable (ι : Q →* A) (K : Subgroup A)

def mk (x : X) (a : A) : AnalyticPoints (X := X) ι K :=
  Quotient.mk (pointSetoid ι K) (x, a)

lemma mk_eq (x y : X) (a b : A) :
    mk ι K x a = mk ι K y b ↔
      ∃ q : Q, ∃ k : K, y = q • x ∧ b = ι q * a * (k : A) := by
  sorry

/-- Actual invariance is given on representatives; no analytic predicate is invented. -/
def lift {Y : Type z} (f : X → A → Y)
    (hinv : ∀ (q : Q) (k : K) (x : X) (a : A),
      f (q • x) (ι q * a * (k : A)) = f x a) :
    AnalyticPoints (X := X) ι K → Y :=
  Quotient.lift (fun xa => f xa.1 xa.2) (by sorry)

lemma lift_mk {Y : Type z} (f : X → A → Y)
    (hinv : ∀ (q : Q) (k : K) (x : X) (a : A),
      f (q • x) (ι q * a * (k : A)) = f x a) (x : X) (a : A) :
    lift ι K f hinv (mk ι K x a) = f x a := by
  sorry

lemma lift_unique {Y : Type z} (f : X → A → Y)
    (hinv : ∀ (q : Q) (k : K) (x : X) (a : A),
      f (q • x) (ι q * a * (k : A)) = f x a)
    (g : AnalyticPoints (X := X) ι K → Y)
    (hg : ∀ x a, g (mk ι K x a) = f x a) : g = lift ι K f hinv := by
  sorry

def level {K' : Subgroup A} (h : K' ≤ K) :
    AnalyticPoints (X := X) ι K' → AnalyticPoints (X := X) ι K :=
  Quotient.lift (fun xa => mk ι K xa.1 xa.2) (by sorry)

lemma level_mk {K' : Subgroup A} (h : K' ≤ K) (x : X) (a : A) :
    level ι K h (mk ι K' x a) = mk ι K x a := by sorry

lemma level_id (p : AnalyticPoints (X := X) ι K) :
    level ι K (le_refl K) p = p := by sorry

lemma level_comp {K' K'' : Subgroup A} (h : K' ≤ K) (h' : K'' ≤ K')
    (p : AnalyticPoints (X := X) ι K'') :
    level ι K h (level ι K' h' p) = level ι K (h'.trans h) p := by sorry

/-- The two-sided torus relation retains the rational quotient as well as the level. -/
def torusSetoid : Setoid A where
  r a b := ∃ q : Q, ∃ k : K, b = ι q * a * (k : A)
  iseqv := by sorry

/-- Singleton-domain compatibility with the independently specified double coset. -/
def singletonEquiv :
    AnalyticPoints (X := PUnit) ι K ≃ Quotient (torusSetoid ι K) where
  toFun := Quotient.lift (fun xa => Quotient.mk (torusSetoid ι K) xa.2) (by sorry)
  invFun := Quotient.lift (fun a => mk ι K PUnit.unit a) (by sorry)
  left_inv := by sorry
  right_inv := by sorry

end AnalyticPoints
end Points

section PointTests

-- TauCeti.Shimura.AnalyticPoints.trivial: the one-point native specialization.
example : Subsingleton
    (AnalyticPoints (X := PUnit) (MonoidHom.id PUnit) (⊤ : Subgroup PUnit)) := by
  sorry

-- TauCeti.Shimura.AnalyticPoints.torus: specialize Q/A to rational/adelic torus points.
-- This tests the carrier, with no assertion that a finite double coset alone is the domain.
example {Q A : Type*} [Group Q] [Group A] (ι : Q →* A) (K : Subgroup A) :
    AnalyticPoints (X := PUnit) ι K ≃
      Quotient (AnalyticPoints.torusSetoid ι K) := by
  sorry

-- TauCeti.Shimura.AnalyticPoints.keep_domain: a native discriminating test.
-- The packet's stronger GL₂/ℍ instance needs the absent actual-datum carrier and is
-- specified in the manifest. Even with trivial arithmetic and adelic groups, the
-- domain coordinate survives, detecting a quotient that discards the domain.
@[instance_reducible] def trivialDomainAction : MulAction PUnit ℕ where
  smul _ n := n
  one_smul := by sorry
  mul_smul := by sorry

local instance : MulAction PUnit ℕ := trivialDomainAction

example : AnalyticPoints.mk (MonoidHom.id PUnit) (⊤ : Subgroup PUnit) (0 : ℕ) PUnit.unit ≠
    AnalyticPoints.mk (MonoidHom.id PUnit) (⊤ : Subgroup PUnit) (1 : ℕ) PUnit.unit := by
  sorry

end PointTests

section Artin
variable {I : Type u} {B : Type v} [Group I] [CommGroup B]

/-- V4/geometric-artin: invert the arithmetic reciprocity map in its abelian target. -/
def geometricArtin (rec : I →* B) : I →* B where
  toFun s := (rec s)⁻¹
  map_one' := by sorry
  map_mul' := by sorry

lemma geometricArtin_apply (rec : I →* B) (s : I) :
    geometricArtin rec s = (rec s)⁻¹ := by sorry

lemma geometricArtin_mul (rec : I →* B) (s t : I) :
    geometricArtin rec (s * t) = geometricArtin rec s * geometricArtin rec t := by sorry

lemma geometricArtin_kernel (rec : I →* B) : (geometricArtin rec).ker = rec.ker := by
  sorry

lemma geometricArtin_norm {J C : Type*} [Group J] [CommGroup C]
    (recF : I →* B) (recL : J →* C) (norm : J →* I) (res : C →* B)
    (h : ∀ s, recF (norm s) = res (recL s)) (s : J) :
    geometricArtin recF (norm s) = res (geometricArtin recL s) := by sorry

-- TauCeti.Shimura.geometricArtin_uniformizer: the arithmetic Frobenius object is
-- provided by ClassFieldTheory/LocalFieldsRamification; this is its native group form.
example (rec : I →* B) (uniformizer : I) (arithFrob : B)
    (h : rec uniformizer = arithFrob) :
    geometricArtin rec uniformizer = arithFrob⁻¹ := by sorry

-- TauCeti.Shimura.geometricArtin_one.
example (rec : I →* B) : geometricArtin rec 1 = 1 := by sorry

-- TauCeti.Shimura.geometricArtin_cyclotomic: native normalization transport.
-- For Q, I is finite ideles and chi is restriction to the cyclotomic character;
-- the literal number-field test is listed in the manifest, pending that carrier.
example {U : Type*} [CommGroup U] (rec : I →* B) (chi : B →* U)
    (unit : I) (u : U) (h : chi (rec unit) = u⁻¹) :
    chi (geometricArtin rec unit) = u := by sorry

end Artin
end TauCeti.Shimura

/-!
## Omission manifest: actual carriers and conditions not expressible at the pin

These are mathematical specifications, not Lean declarations. Every advanced
name is preserved below, rather than given a vacuous conclusion or an invented
Prop-valued carrier. The reader and packet identify its prerequisites, sources
and precise missing supplier. Restore the signatures, API lemmas and examples
when those actual carriers are supplied. No advanced theorem is certified by
this file elaborating. Even the two native slices omit their mathematical
specializations: quotient topology and literal GL₂ datum tests for AnalyticPoints;
global reciprocity, continuity and number-field tests for geometricArtin.

Independent review REV-ShimuraVarieties--V0 corrected the specifications below.
The reader is an input to that review and still needs the synchronization listed in
the review report; the review verdict is needs_changes. In particular V2’s all-type
boundary predicate is not yet an exact mathematical definition.

ShimuraVarieties:V0/stabilizer-arithmetic
TauCeti.Shimura.stabilizer_arithmetic — For a pure datum (G,X), component X⁺, compact open K and a∈G(A_f), Γ_a=G(Q)_+∩aKa⁻¹ is an arithmetic subgroup of G(Q), of finite index in G(Q)∩aKa⁻¹. Its image in the effective real automorphism group of X⁺ is arithmetic and discrete. G(Q)_+ means the inverse image of G^ad(R)^+, with compact adjoint factors removed only in the effective image.

ShimuraVarieties:V0/stabilizer-commensurable
TauCeti.Shimura.stabilizer_commensurable — For fixed G and X⁺, Γ_{a,K} and Γ_{b,L} are commensurable for arbitrary a,b∈G(A_f) and compact open K,L, since they are arithmetic in the same rational group. If b=qak with q∈G(Q)_+, k∈K and L=K, then Γ_b=qΓ_aq⁻¹, and x↦qx identifies their effective quotients.

ShimuraVarieties:V0/neat-sublevels
TauCeti.Shimura.neat_sublevels — Specialize AA.4/neat-level-exists to the rational group of a pure Shimura datum: every compact open K contains a normal open K₀ of finite index that is neat in the D5 rational-conjugate sense. Apply the same supplier inside every prescribed compact open sublevel for cofinality. Existence and the normal-core construction remain owned by AA.4; this node is only the convention bridge to the Shimura tower.

ShimuraVarieties:V0/effective-proper-action
TauCeti.Shimura.effective_proper_action — The effective image Γ_a^eff acts properly discontinuously on X⁺; at rationally neat K it acts freely. Thus its orbit projection is a covering map locally biholomorphic once the holomorphic quotient carrier is supplied. No conclusion that Γ_a itself acts freely is drawn.

ShimuraVarieties:V0/component-decomposition
TauCeti.Shimura.component_decomposition — For every compact open K, G(Q)_+\G(A_f)/K is finite, and choice of representatives a induces ⨿_a Γ_a\X⁺ ≅ G(Q)\(X×G(A_f)/K), first as topological spaces and then as complex analytic spaces. Changing a=qbk transports the component by q, so the decomposition is independent of representatives up to the specified analytic isomorphisms.

ShimuraVarieties:V0/simply-connected-components
TauCeti.Shimura.simply_connected_components — Assume G^der is simply connected. Put T=G/G^der and ν:G→T, T(Q)^†=ν(G(Q)_+)=T(Q)∩ν(Z(G)(R)). Then π₀(Sh_K^an(G,X))≃T(Q)^†\T(A_f)/ν(K). Apply strong approximation only to the semisimple simply connected derived group, whose Q-simple factors have noncompact real points by SV3; never to G or a torus without hypotheses.

ShimuraVarieties:V1/analytic-points
TauCeti.Shimura.AnalyticPoints — For a pure datum and compact open K, Sh_K^pts is the orbit set of X×G(A_f)/K under q·(x,aK)=(qx,qaK), q∈G(Q). Its quotient topology comes from X with its domain topology and the discrete coset space G(A_f)/K. This defines the carrier; V1/analytic-structure equips it with its complex analytic structure.
API TauCeti.Shimura.AnalyticPoints.mk (constructor): Send (x,a) to [x,a]_K.
API TauCeti.Shimura.AnalyticPoints.mk_eq (characterisation): [x,a]_K=[y,b]_K iff ∃q∈G(Q), k∈K with y=qx and b=qak.
API TauCeti.Shimura.AnalyticPoints.lift (universal-property): A function on X×G(A_f) invariant under the rational diagonal and right K actions descends uniquely; evaluation at [x,a] recovers its value.
API TauCeti.Shimura.AnalyticPoints.level (functoriality): For K′⊂K send [x,a]_{K′} to [x,a]_K; identity and composition hold.
Test TauCeti.Shimura.AnalyticPoints.trivial (degenerate): The trivial datum has one point at its unique level.
Test TauCeti.Shimura.AnalyticPoints.torus (compatibility): For singleton torus datum, Sh_K^pts=T(Q)\T(A_f)/K, including the rational quotient.
Test TauCeti.Shimura.AnalyticPoints.keep_domain (non-example): For GL₂ the fibre of one finite component is Γ_a\ℍ, an infinite set, not a singleton finite double coset.

ShimuraVarieties:V1/analytic-structure
TauCeti.Shimura.analytic_structure — The carrier Sh_K^pts has a canonical normal complex analytic-space structure characterized componentwise by Γ_a^eff\X⁺. If K is rationally neat it is a smooth complex manifold. For general K choose neat normal K′⊂K; the analytic finite quotient by the actual K/K′ action gives the same space, independently of K′.

ShimuraVarieties:V1/holomorphic-level-maps
TauCeti.Shimura.holomorphic_level_maps — For K′⊂K, Sh_{K′}^an→Sh_K^an is finite and holomorphic. If K is neat it is locally biholomorphic; after algebraization in V3 it is finite étale. For K′ normal in K, the effective image H of K/K′ in Aut(Sh_{K′}^an) acts over Sh_K^an and its orbit quotient is Sh_K^an. H is a subgroup of the automorphisms over the base; it need not be the full deck group on a disconnected cover. A full deck-group formula requires the separate connected regular-cover hypotheses. For nonnormal K′ no such group formula is asserted.

ShimuraVarieties:V1/right-translation
TauCeti.Shimura.right_translation — For g∈G(A_f), R_g:Sh_K^an→Sh_{g⁻¹Kg}^an sends [x,a] to [x,ag]. It is a biholomorphism with inverse R_{g⁻¹}; R_h∘R_g=R_{gh} with conjugated intermediate levels. It commutes with level projections.

ShimuraVarieties:V1/holomorphic-hecke
TauCeti.Shimura.holomorphic_hecke — For K_g=K∩gKg⁻¹, the Hecke span is Sh_K^an←Sh_{K_g}^an→Sh_K^an with arrows [x,a]↦[x,a] and [x,a]↦[x,ag]. Both are finite holomorphic, and locally biholomorphic at neat K. Replacing g by k₁gk₂ gives an isomorphic span. Composition is represented by the fibre product of spans and its double-coset decomposition, retaining multiplicities and effective degrees.

ShimuraVarieties:V1/datum-analytic-map
TauCeti.Shimura.datum_analytic_map — A morphism f:(G,X)→(H,Y) and levels f(K)⊂L induce a holomorphic map Sh_K^an(G,X)→Sh_L^an(H,Y), [x,a]↦[f(x),f(a)], compatible with levels and translations. An injective subdatum yields a closed immersion at suitable sufficiently small levels after V3 algebraization; no closed-immersion assertion is made at arbitrary coarse levels.

ShimuraVarieties:V2/rational-boundary
TauCeti.Shimura.rational_boundary — For the effective Hermitian symmetric domain D of a rational semisimple adjoint group, construct its rational boundary components in the bounded realization, selected by rationality of their stabilizing parabolic and the corresponding rational boundary datum. Identify their Hermitian quotients and closure incidence. The rational extension D* is D together with these components, not the full Euclidean boundary.

ShimuraVarieties:V2/satake-compactness
TauCeti.Shimura.satake_compactness — Equip D* with the rational Satake topology. For arithmetic Γ^eff, Γ^eff\D* is compact Hausdorff, contains Γ^eff\D as an open dense set and has finitely many boundary strata; the topology restricts to the usual complex topology on each stratum.

ShimuraVarieties:V2/analytic-automorphic-ring
TauCeti.Shimura.AutomorphicRing — For a torsion-free effective arithmetic Γ on D, define A_n(Γ) as holomorphic sections of the n-th power of the canonical analytic automorphy factor satisfying the Baily–Borel holomorphy/growth conditions at every rational boundary component. In bounded local coordinates f(γz)det(Dγ_z)^n=f(z); in cusp coordinates allowable Fourier exponents lie in the nonnegative cone. A(Γ)=⊕_{n≥0}A_n with product of sections. One passes to a positive Veronese when required to clear automorphy characters. Cusp forms require additional vanishing and are a different subspace.
API TauCeti.Shimura.AutomorphicRing.degree (data): The degree-n piece is A_n(Γ), with A_0=C on a connected quotient.
API TauCeti.Shimura.AutomorphicRing.mul (structure): Multiplication A_m×A_n→A_{m+n} is pointwise tensor product; unit and associativity hold.
API TauCeti.Shimura.AutomorphicRing.siegel (projection): Restriction to a rational boundary component is the weight-compatible Siegel operator and commutes with products.
API TauCeti.Shimura.AutomorphicRing.level (functoriality): For Γ′⊂Γ, pullback embeds A_n(Γ) into A_n(Γ′); identity and composition hold.
API TauCeti.Shimura.AutomorphicRing.veronese (compatibility): Changing to a positive common tensor power gives the corresponding Veronese ring and the same projective spectrum after finite-generation is established.
API TauCeti.Shimura.AutomorphicRing.mk (constructor): A weight-n holomorphic section satisfying the transformation law and the specified boundary predicate defines an element of A_n; its underlying section is unchanged.
API TauCeti.Shimura.AutomorphicRing.ext (extensionality): Two elements of A_n are equal if their holomorphic section values agree at every point of D.
API TauCeti.Shimura.AutomorphicRing.eval (projection): Evaluation on D is complex-linear on each degree and carries the graded product to pointwise multiplication.
Test TauCeti.Shimura.AutomorphicRing.degree_zero (degenerate): On a connected compactification the degree-zero piece consists of constants.
Test TauCeti.Shimura.AutomorphicRing.elliptic_weight (compatibility): For ℍ the canonical n-th automorphy factor corresponds to scalar modular weight 2n, with holomorphy at cusps.
Test TauCeti.Shimura.AutomorphicRing.not_cusp (non-example): For the torsion-free principal group Γ(3)⊂SL₂(Z), the restriction of E₄ is an allowed weight-4 (degree-two) form, with constant Fourier coefficient 1 at infinity. It is not a cusp form.

ShimuraVarieties:V2/poincare-eisenstein
TauCeti.Shimura.poincare_eisenstein — For the analytic automorphy factor above, sufficiently divisible positive weights admit Poincaré–Eisenstein sections with convergent series, prescribed boundary restrictions and enough sections to separate points of Γ\D* and local analytic germs. State and prove the convergence, boundary extension and separation results before using a projective embedding.

ShimuraVarieties:V2/normal-analytic-compactification
TauCeti.Shimura.normal_analytic_compactification — The compact Satake quotient Γ\D* has a canonical normal complex analytic-space structure whose sheaf restricts to the invariant holomorphic sheaf on each stratum and whose open stratum is the analytic quotient Γ\D. It agrees with the projective realization by high-weight automorphic sections.

ShimuraVarieties:V2/automorphic-finite-generation
TauCeti.Shimura.automorphic_finite_generation — The analytic graded C-algebra A(Γ) is finitely generated (after the chosen common positive tensor power), and sufficiently divisible high-weight sections realize Γ\D* as a closed analytic subspace of projective space. Its graded projective spectrum gives the same compactification.

ShimuraVarieties:V2/baily-borel
TauCeti.Shimura.baily_borel — Every finite-level analytic Shimura variety has a normal quasi-projective C-scheme algebraization, smooth at neat level, with open immersion into its normal projective minimal compactification. Analytification identifies the compactification with the compact rational Satake quotient and identifies its algebraic boundary strata with the analytic arithmetic boundary quotients.

ShimuraVarieties:V2/koecher
TauCeti.Shimura.koecher — If the rational semisimple effective group has no quotient isomorphic over Q to PGL₂, the boundary of the minimal compactification has codimension at least two. In the resulting Koecher range holomorphic canonical-factor automorphic sections have the required boundary growth/extension, yielding the canonical-form section-ring description. In the modular-curve factor case retain cusp conditions and logarithmic canonical forms.

ShimuraVarieties:V2/minimal-level-extension
TauCeti.Shimura.minimal_level_extension — Finite analytic level maps and Hecke right translations extend to the minimal compactifications through rational boundary maps and pullback of analytic automorphic forms. After algebraization these are finite algebraic maps for level changes and algebraic isomorphisms for translations, compatible with composition and the open immersion.

ShimuraVarieties:V3/borel-extension
TauCeti.Shimura.borel_extension — Let D be Hermitian symmetric and Γ^eff a torsion-free arithmetic subgroup of Hol(D)^+. Every holomorphic map (Δ*)^r×Δ^s→Γ^eff\D extends holomorphically to Δ^{r+s}→(Γ^eff\D)^min as a map of complex analytic spaces.

ShimuraVarieties:V3/borel-algebraicity
TauCeti.Shimura.borel_algebraicity — For torsion-free arithmetic Γ^eff in Hol(D)^+ and a smooth finite-type C-scheme S, every holomorphic map S^an→(Γ^eff\D)^an is algebraic. First prove the quasi-projective-source case; then glue over a quasi-projective Zariski open cover. Do not extend this assertion to every coarse torsion target.

ShimuraVarieties:V3/unique-algebraization
TauCeti.Shimura.unique_algebraization — Any two smooth finite-type C-scheme algebraizations of the same neat arithmetic analytic quotient are uniquely isomorphic through the prescribed analytic identity. This uniqueness concerns algebraization, distinct from reflex-field uniqueness of canonical models owned by V8.

ShimuraVarieties:V3/algebraic-data-maps
TauCeti.Shimura.algebraic_data_maps — Holomorphic maps of data between neat-level analytic varieties algebraize, compatibly with levels, translations, identity and composition. An injective subdatum admits a closed immersion at sufficiently small compatible levels. These statements concern complex algebraizations; reflex-field functoriality is V8.

ShimuraVarieties:V3/finite-quotient-algebraization
TauCeti.Shimura.finite_quotient_algebraization — For neat normal K′⊂K, the finite group K/K′ acts algebraically on Sh_{K′,C}; its geometric quotient exists as a normal quasi-projective C-scheme and analytifies to Sh_K^an. Quotients through two sublevels agree via common refinement. The source at K′ is the normalization of the target in its corresponding finite function-field extensions componentwise; finite étaleness holds when the effective target action is free.

ShimuraVarieties:V3/definable-target-comparison
TauCeti.Shimura.definable_target_comparison — For a torsion-free effective arithmetic Hermitian quotient Γ\D and a fixed maximal compact K∞ defining its symmetric realization, the R_an,exp structure extending its corrected arithmetic R_alg structure agrees through the Baily–Borel algebraization with the definable structure induced by the C-scheme. This comparison is certified independently of Borel algebraicity.

ShimuraVarieties:V3/definable-borel
TauCeti.Shimura.definable_borel — For smooth quasi-projective S over C and a torsion-free effective arithmetic Hermitian quotient Y, a holomorphic S^an→Y^an is algebraic by the definable-graph argument once the independently proved algebraic-target comparison and period-map definability are supplied.

ShimuraVarieties:V4/geometric-artin
TauCeti.Shimura.geometricArtin — Given the supplier arithmetic reciprocity rec_F:A_F×→Gal(F^ab/F) sending a uniformizer to arithmetic Frobenius, define art_F(s)=rec_F(s)⁻¹. This is a continuous homomorphism because the target is abelian. Its kernel equals that of rec_F; all reflex-norm formulas in this packet use art_F.
API TauCeti.Shimura.geometricArtin_apply (simp): art_F(s)=rec_F(s)⁻¹.
API TauCeti.Shimura.geometricArtin_mul (structure): art_F(st)=art_F(s)art_F(t).
API TauCeti.Shimura.geometricArtin_kernel (compatibility): ker art_F=ker rec_F as closed subgroups.
API TauCeti.Shimura.geometricArtin_norm (functoriality): For L/F finite, art_F(N_{L/F}s)=res(art_L(s)).
Test TauCeti.Shimura.geometricArtin_uniformizer (computation): At an unramified place, art_F(π_v) is inverse arithmetic Frobenius.
Test TauCeti.Shimura.geometricArtin_one (degenerate): art_F(1)=1.
Test TauCeti.Shimura.geometricArtin_cyclotomic (compatibility): For u=χ_cyc(σ)∈Zhat×, art_Q(u)=σ on Q^ab; changing to rec reverses the action.

ShimuraVarieties:V4/reflex-norm
TauCeti.Shimura.ReflexNorm — For an actual special pair (T,h) with cocharacter μ_h defined over E=E(T,h), define r_h:Res_{E/Q}G_m→T by r_h=Norm_{E/Q}∘Res_{E/Q}(μ_h). Over a splitting field its value is the product ∏_{ρ:E→C}ρ(μ_h(s_ρ)); evaluate it on finite ideles to get r_h:A_{f,E}×→T(A_f). The product is multiplicative, never the sum misprinted in SVI (60),(61).
API TauCeti.Shimura.ReflexNorm.apply_split (simp): In splitting coordinates r_h(s)=∏ρ ρ(μ_h(s_ρ)).
API TauCeti.Shimura.ReflexNorm.principal (compatibility): For b∈E×, r_h(b)∈T(Q), hence its action on every torus double quotient is trivial.
API TauCeti.Shimura.ReflexNorm.map (functoriality): For a torus subdatum morphism f, after norm from a common reflex field, f∘r_h=r_{f∘h}; retain the field-change norm.
API TauCeti.Shimura.ReflexNorm.cm_type (compatibility): For the CM torus datum supplied by D5/cm-torus and CM.0, r_h agrees with the multiplicative reflex-type norm.
API TauCeti.Shimura.ReflexNorm.continuous (structure): The finite-idelic map is a continuous group homomorphism.
API TauCeti.Shimura.ReflexNorm.ext (extensionality): Two rational torus homomorphisms Res_{E/Q}G_m→T agreeing on the split cocharacter formula after a splitting-field base change are equal.
API TauCeti.Shimura.ReflexNorm.mul (simp): The reflex norm sends 1 to 1 and r_h(st)=r_h(s)r_h(t), as an algebraic group morphism and on finite ideles.
Test TauCeti.Shimura.ReflexNorm.trivial (degenerate): A trivial cocharacter gives the constant identity morphism.
Test TauCeti.Shimura.ReflexNorm.split_power (computation): For T=G_m, E=Q and μ(t)=t^n, r_h(s)=s^n, including n=0 and negative n.
Test TauCeti.Shimura.ReflexNorm.aghmp (compatibility): For T=Res_{E/Q}G_m/ker(N_{F/Q}) in AGHMP §3.1 and its distinguished cocharacter, r_h is the natural quotient map Res_E G_m→T.

ShimuraVarieties:V4/reciprocity-finite-action
TauCeti.Shimura.reciprocity_finite_action — For a torus datum (T,h) and compact open K, the action of r_h(s) on the finite set T(Q)\T(A_f)/K factors continuously through Gal(E^ab/E) via art_E. Thus equal Artin lifts act identically at every level. At the full tower the natural reciprocity values lie in T(A_f)/closure(T(Q)); do not replace the closure by T(Q) without the needed additional CM norm lemma.

ShimuraVarieties:V4/canonical-model
TauCeti.Shimura.CanonicalModel — A finite-level canonical model of (G,X,K) is a normal quasi-projective scheme S over E(G,X), with an isomorphism S_C^an≅Sh_K^an, such that for every actual special pair i:(T,h)→(G,X) of D4 and every a∈G(A_f), the point [h,a] is defined over E(T,h)^ab and every σ∈Gal(E(T,h)^ab/E(T,h)) acts by σ[h,a]=[h,i(r_h(s))a] for art_{E(T,h)}(s)=σ. A canonical tower includes compatible level maps and the right G(A_f)-action over E, with these conditions at every level.
API TauCeti.Shimura.CanonicalModel.scheme (projection): The underlying scheme is over Spec E(G,X), with normal/quasi-projective structure.
API TauCeti.Shimura.CanonicalModel.comparison (projection): The chosen comparison is an isomorphism of complex analytic spaces after base change to C.
API TauCeti.Shimura.CanonicalModel.special_rational (data): For every actual special pair and a, the comparison point is E(T,h)^ab-rational.
API TauCeti.Shimura.CanonicalModel.special_action (characterisation): Its Galois action is the precise geometric-Artin reflex-norm formula, independent of an Artin lift.
API TauCeti.Shimura.CanonicalModel.level (functoriality): A tower supplies level maps over E, with identity/composition and analytic point formula.
API TauCeti.Shimura.CanonicalModel.baseChange (compatibility): For E⊂L⊂C, base change retains the same comparison and restricted special-point action; the defining minimal field remains E.
API TauCeti.Shimura.CanonicalModel.ofSpecialAction (constructor): An E-scheme with the stated normal/quasi-projective structure, analytic comparison, special-point rationality and the full reciprocity formula defines a finite-level canonical model. Tower construction also requires compatible level maps and translations.
API TauCeti.Shimura.CanonicalModel.hom_ext (extensionality): Two E-morphisms between the underlying finite-level models whose complex analytic maps agree are equal, by faithful base change and analytification. This is morphism extensionality; model uniqueness remains V8.
Test TauCeti.Shimura.CanonicalModel.trivial (degenerate): The trivial datum has canonical model Spec Q with its one-point comparison.
Test TauCeti.Shimura.CanonicalModel.torus_neat (compatibility): The finite étale torus model satisfies this condition using its constructed Galois action.
Test TauCeti.Shimura.CanonicalModel.not_arbitrary_subset (non-example): For T=G_m, h(z)=z zbar and principal K(5), the analytic quotient has two points (Z/5Z)×/{±1}. The split model Spec Q ⊔ Spec Q with any two-point comparison passes an empty-subset test but fails canonicity: an automorphism with cyclotomic character 2 modulo 5 must interchange the two classes by reciprocity, whereas the split model fixes both.

ShimuraVarieties:V4/torus-model
TauCeti.Shimura.torusModel — The finite continuous Gal(Qbar/E)-set T(Q)\T(A_f)/K from reciprocity corresponds to a finite étale E-scheme S_K. Its complex points identify with Sh_K(T,{h}), and the constructed Galois action makes it a canonical model. This is the coarse scheme at every K; the AGHMP non-neat quotient stack is a separate object.
API TauCeti.Shimura.torusModel.points (equivalence): S_K(Qbar)≃T(Q)\T(A_f)/K as Galois sets, with the prescribed action.
API TauCeti.Shimura.torusModel.level (functoriality): For K′⊂K the double-quotient projection induces a finite étale morphism, compatible with identity/composition.
API TauCeti.Shimura.torusModel.translate (functoriality): Right translation by a∈T(A_f) is defined over E and commutes with reciprocity.
API TauCeti.Shimura.torusModel.map (functoriality): A morphism of torus data gives a map over a common field containing both reflex fields, compatible with the norm on Artin lifts.
API TauCeti.Shimura.torusModel.finiteEtale (structure): The resulting scheme is finite étale over E, with degree equal to the Galois-set cardinality.
API TauCeti.Shimura.torusModel.hom_ext (extensionality): Two E-morphisms between finite étale torus models agreeing on all geometric points are equal under the finite-continuous-Galois-set equivalence.
Test TauCeti.Shimura.torusModel.maximal_split (computation): For T=G_m, h(z)=z zbar, K=Zhat×, E=Q, the coarse scheme is Spec Q.
Test TauCeti.Shimura.torusModel.split_level_five (computation): For the same datum and principal K(5), the Galois set is (Z/5Z)×/{±1}; the degree-two model is Q(ζ₅+ζ₅⁻¹), not Q(ζ₅).
Test TauCeti.Shimura.torusModel.trivial (degenerate): For the trivial torus every level gives Spec Q.

ShimuraVarieties:V4/aghmp-stack-comparison
TauCeti.Shimura.aghmp_stack_comparison — For the specific AGHMP torus T=Res_{E/Q}G_m/ker(N_{F/Q}), distinguished cocharacter and neat normal K′⊂K, the generic CM Shimura stack is [S_{K′}/(K/K′)]. Its coarse space is S_K, independent of K′; at neat K it is the finite étale scheme above. At non-neat K retain its finite isotropy, rather than identify the stack with its coarse point set. The integral maximal-level model and CM Hodge lattices belong to the CM/integral owners.

ShimuraVarieties:V4/special-existence
TauCeti.Shimura.special_existence — Every pure datum has an actual special point, obtained from a rational maximal torus compact modulo the appropriate centre. Such points are dense in X in its real topology, hence their images are Zariski dense in each complex algebraized component.

ShimuraVarieties:V4/hecke-density
TauCeti.Shimura.hecke_density — For any x∈X, the finite-level set {[x,a]_K:a∈G(A_f)} is Zariski dense in Sh_{K,C}. In particular the Hecke translates of a fixed actual special point are dense. This uses real approximation in G(Q)_+, not unrestricted strong approximation in G(A_f).

ShimuraVarieties:V5/weight-one-algebraization
TauCeti.Shimura.weight_one_algebraization — Over a smooth finite-type C-scheme S, the relative analytic equivalence between polarized abelian families and polarizable integral variations of homological types (−1,0),(0,−1) algebraizes: every such variation gives an abelian scheme, and morphisms correspond to morphisms of variations. Polarization type and actual integral level are retained.

ShimuraVarieties:V5/cm-abelian-variety
TauCeti.Shimura.CMAbelianVariety — For an abelian variety A/C of dimension g, a full CM action is an embedding i:E→End⁰(A) of a commutative finite étale CM Q-algebra of dimension 2g. Its H₁(A,Q) is rank one over E, its Lie eigenspaces specify the actual CM type Φ, and a polarization is retained with Rosati acting as complex conjugation on E when required. A product CM algebra is allowed; simplicity and maximal integral endomorphism order are separate hypotheses.
API TauCeti.Shimura.CMAbelianVariety.action (data): The injective E-action on the actual abelian variety is part of the data.
API TauCeti.Shimura.CMAbelianVariety.type (projection): The type is the subset of embeddings appearing in Lie(A), using the imported CM.0 definition.
API TauCeti.Shimura.CMAbelianVariety.homology (compatibility): H₁(A,Q) is free of rank one over E, with eigenspace decomposition Φ in Lie(A).
API TauCeti.Shimura.CMAbelianVariety.transport (functoriality): An E-linear quasi-isogeny transports the full action and type; identity/composition hold.
API TauCeti.Shimura.CMAbelianVariety.rosati (characterisation): A retained compatible polarization has Rosati restriction equal to the CM conjugation, with positive Riemann form.
API TauCeti.Shimura.CMAbelianVariety.ofAction (constructor): An actual abelian variety with an injective CM-algebra action of dimension 2 dim A supplies the full CM object and its Lie type; a compatible polarization is included when Rosati data are requested.
API TauCeti.Shimura.CMAbelianVariety.hom_ext (extensionality): Two E-linear quasi-homomorphisms between full CM objects agreeing on H₁(-,Q), or on a rational Tate module after comparison, are equal.
Test TauCeti.Shimura.CMAbelianVariety.quadratic (computation): An elliptic curve with an imaginary quadratic embedding in End⁰ has a full CM action of degree two.
Test TauCeti.Shimura.CMAbelianVariety.product (compatibility): The product of two CM elliptic curves has full action by their product CM algebra; it need not be simple.
Test TauCeti.Shimura.CMAbelianVariety.insufficient_degree (non-example): A scalar Q-action on a positive-dimensional abelian variety is not full CM, and a degree-two action on dimension two alone is insufficient.

ShimuraVarieties:V5/cm-tate-rank-one
TauCeti.Shimura.cm_tate_rank_one — For a full CM action (A,E), V_fA is free of rank one over E⊗_Q A_f, compatibly with H₁(A,Q)⊗A_f and with quasi-isogenies. If End(A)∩E=O_E, T_ℓA is free of rank one over O_E⊗Z_ℓ. For a nonmaximal order only the rational freeness is asserted without additional integral hypotheses. Quasi-isogenies act faithfully on V_fA.

ShimuraVarieties:V5/cm-number-field-model
TauCeti.Shimura.cm_number_field_model — A full CM abelian variety over C, with its finitely specified endomorphisms, polarization and finite level, admits a model over a number field after replacing its base by a finite extension. This establishes that CM reduction and arithmetic Frobenius arguments apply to actual complex points.

ShimuraVarieties:V5/cm-potential-good-reduction
TauCeti.Shimura.cm_potential_good_reduction — A full CM abelian variety over a number field has potentially good reduction at every finite place. With all E-endomorphisms defined, the inertia image on V_ℓA is finite for ℓ different from the residue characteristic, so a finite extension kills it and Néron–Ogg–Shafarevich supplies good reduction.

ShimuraVarieties:V5/cm-frobenius
TauCeti.Shimura.cm_frobenius — Let A/k have full CM by O_E with the action defined over k, let k/Q be Galois containing all conjugates of E, and let P be a good reduction prime of residue cardinality q. The q-power Frobenius of the reduction is represented by π∈O_E under the specialized CM action, with ππbar=q for a compatible polarization.

ShimuraVarieties:V5/shimura-taniyama
TauCeti.Shimura.shimura_taniyama — Under the preceding good-reduction/maximal-order/Galois-field hypotheses, for every v|p put H_v={φ:E→k:φ⁻¹P=v}. The Frobenius π satisfies ord_v(π)/ord_v(q)=|Φ∩H_v|/|H_v|. Equivalently the principal ideal (π) is the product over φ∈Φ of φ⁻¹(N_{k/φE}P), and agrees with the reflex norm of N_{k/E*}P. State the ramified-prime formula using normalized valuations; the clean unramified ideal proof suffices for the subsequent prime-generation argument.

ShimuraVarieties:V5/cm-ideal-reciprocity
TauCeti.Shimura.cm_ideal_reciprocity — For A/C with CM by O_E and type Φ, integer m>0 and σ fixing E*, there is an ideal multiplication α:A→σA acting as σ on A[m]. Its ray ideal class is determined by σ on a sufficiently divisible reflex ray class field and is the reflex-norm ideal class of an ideal b whose arithmetic Artin symbol is σ. This ideal statement uses arithmetic Artin; V5/main-CM converts to geometric art for ideles.

ShimuraVarieties:V5/main-cm
TauCeti.Shimura.main_cm — Let (A,i:E→End⁰A) be full CM over C, allowing a CM product algebra, with type Φ and reflex field E*. For σ∈Aut(C/E*) and a finite idele s∈A_{f,E*}× with art_{E*}(s)=σ|E*ab, there is a unique E-linear quasi-isogeny α:A→σA satisfying α(r_Φ(s)x)=σx for every x∈V_fA. If s′ has the same Artin image and r_Φ(s′)=a r_Φ(s), a∈E×, replace α by α∘a⁻¹. The existence of this a is proved by the norm-kernel lemmas in the CM setting, not asserted for arbitrary tori.

ShimuraVarieties:V5/cm-polarization-level
TauCeti.Shimura.cm_polarization_level — For α from the main CM theorem and a compatible polarization form ψ with Rosati conjugation, ψ_{σA}(αx,αy)=c ψ_A(x,y) where c=χ_cyc(σ)/N_{E*/Q}(s)∈Q_{>0}. The actual Tate twist in ψ:A_f×A_f→A_f(1) is retained. For an adelic symplectic level representative, σ transport equals the reflex-norm action modulo the chosen level and the E-linear quasi-isogeny.

ShimuraVarieties:V5/siegel-special-cm
TauCeti.Shimura.siegel_special_cm — For the Siegel datum, a complex abelian variety gives a special point precisely when it has full CM by a commutative CM algebra of degree 2g. Products are included, so all special points rather than only simple CM fields are covered.

ShimuraVarieties:V5/siegel-canonical
TauCeti.Shimura.siegel_canonical — The rational polarized Siegel moduli model with the actual adelic symplectic level is a canonical model over the Siegel reflex field Q. Its complex uniformization is the V1/V3 Siegel variety; for every actual special point its Galois action is precisely V4 reciprocity, including polarization, quasi-isogeny and level.

ShimuraVarieties:V6/hodge-inheritance
TauCeti.Shimura.hodge_inheritance — If i:(G,X)↪(H,Y) is a Shimura subdatum and (H,Y) has a canonical tower, then (G,X) has a canonical tower over E(G,X), whose suitable neat levels embed into the ambient tower after base change to a common reflex field. Descent of the image to E(G,X) is proved using actual special points and their reciprocity, not by claiming every C-subvariety of a model descends.

ShimuraVarieties:V6/hodge-canonical
TauCeti.Shimura.hodge_canonical — Every Hodge-type datum of D4 has a canonical tower over its reflex field, by choosing its actual embedding into a Siegel datum, applying Siegel existence and subdatum inheritance. The resulting tower is independent of the embedding through canonical-model uniqueness.

ShimuraVarieties:V6/connected-tower
TauCeti.Shimura.ConnectedTower — For the connected derived datum (G^der,X⁺), whose points are S→G^ad_R and are not required to lift to G^der_R, form the analytic pro-object M⁰=(Γ\X⁺)_Γ and its inverse-limit point set over torsion-free arithmetic subgroups of G^ad(Q)^+ open in the congruence topology induced by G^der. Retain the completion of G^ad(Q)^+ relative to G^der and its action. A connected canonical formulation includes the adelic/Galois extension and its reciprocity on actual maximal special tori, as in Deligne 2.7.13; a bare connected pro-variety over Qbar is insufficient.
API TauCeti.Shimura.ConnectedTower.level (projection): The Γ-level is the actual algebraized quotient Γ\X⁺.
API TauCeti.Shimura.ConnectedTower.transition (functoriality): Subgroup inclusion gives finite algebraic maps; identity and composition hold.
API TauCeti.Shimura.ConnectedTower.completedAction (structure): The completed adjoint rational symmetry acts compatibly on the pro-object; its topology is induced by derived-group congruence subgroups.
API TauCeti.Shimura.ConnectedTower.canonicalExtension (data): The connected canonical version retains the adelic/Galois extension, with its multiplication/coherence and marked-special-torus reciprocity.
API TauCeti.Shimura.ConnectedTower.hom_ext (extensionality): Two morphisms of the congruence-indexed tower diagrams agreeing at each finite level are equal; canonical morphisms additionally commute with the specified completion/Galois extension.
API TauCeti.Shimura.ConnectedTower.lift (universal-property): Compatible holomorphic maps from a test complex analytic space Y to every finite Γ\X⁺ quotient give a unique morphism from the constant pro-object Y to the analytic tower; projections recover those maps. The algebraic tower has the analogous compatible-morphism universal property in its pro-category. No finite-dimensional analytic-space structure is asserted on the inverse-limit point set.
Test TauCeti.Shimura.ConnectedTower.trivial (degenerate): A trivial derived group gives the one-point connected tower.
Test TauCeti.Shimura.ConnectedTower.sl2 (compatibility): For the GL₂ datum the connected tower is the congruence tower Γ\ℍ induced by SL₂, with effective ±I removed where present.
Test TauCeti.Shimura.ConnectedTower.not_full (non-example): A singleton connected derived torus tower does not recover the multiple full torus level components without the component/reciprocity extension.

ShimuraVarieties:V6/connected-full-equivalence
TauCeti.Shimura.connected_full_equivalence — A pure Shimura datum admits a full canonical model over E(G,X) if and only if its connected derived tower admits the connected canonical structure with completed adelic/Galois symmetry of V6/connected-tower. The comparison reconstructs finite components and their reciprocity, preserving the completion action; forgetting this symmetry invalidates the equivalence.

ShimuraVarieties:V6/connected-products
TauCeti.Shimura.connected_products — The connected canonical construction is compatible with finite products of connected derived data, including the product of their congruence completions and the diagonal Galois action through the required extension. The product model satisfies the connected special-point condition.

ShimuraVarieties:V6/central-isogeny-descent
TauCeti.Shimura.central_isogeny_descent — For a central isogeny f:G₁→G₂ of semisimple derived groups with compatible connected data and a connected canonical model of (G₁,X₁⁺), the connected tower for (G₂,X₂⁺) is the quotient of the source tower by the kernel of the induced map on congruence completions. At each finite level use the finite effective quotient; descend its canonical symmetry and reciprocity. The source in Milne 14.16(b) must be G₁, correcting the repeated G₂ misprint.

ShimuraVarieties:V6/abelian-canonical
TauCeti.Shimura.abelian_canonical — Every abelian-type datum as defined in D4 admits a canonical tower over its reflex field. Use the Hodge-type witness, products and central-isogeny descent for the connected derived datum, then connected-full-equivalence. The full components and reflex-field action are reconstructed rather than identified with those of the Hodge-type witness.

ShimuraVarieties:V7/simple-connected-reduction
TauCeti.Shimura.simple_connected_reduction — To prove general canonical-model existence it suffices to prove marked conjugation with completed symmetry for connected data whose group is semisimple simply connected and almost Q-simple. Such a group is Res_{F/Q}G′ for a totally real number field F and an absolutely almost simple simply connected F-group G′. Products, the derived central cover and V6 reconstruction then restore the original reductive datum.

ShimuraVarieties:V7/auxiliary-cm-splitting
TauCeti.Shimura.auxiliary_cm_splitting — For the simple connected case and a maximal torus T′⊂G′ whose adjoint image contains the marked S-map, choose a finite totally real extension F′/F such that the base-changed torus splits over a CM quadratic extension L′/F′. The corresponding restriction-of-scalars datum admits the compatible connected embedding of the original datum. Proving the comparison there implies it for the original embedded connected tower.

ShimuraVarieties:V7/rank-one-subdata
TauCeti.Shimura.rank_one_subdata — Assume T′ splits over a CM quadratic L/F. For each root α of (G′,T′) noncompact at some real place, the Lie algebra Lie(T′)⊕g_α⊕g_{−α} descends to a reductive F-subgroup H′_α containing T′, whose derived group has type A₁. Res_{F/Q}H′_α has an induced adjoint S-map obtained by projecting h through T^ad→(H′_α)^ad. After taking the simply connected cover of its derived group and removing compact ineffective factors it gives the required connected rank-one subdatum. No lift of h to that cover is required.

ShimuraVarieties:V7/rank-one-central-separation
TauCeti.Shimura.rank_one_central_separation — In the CM-split simple case, let Z_α=Z(H_α), with α ranging over roots noncompact at some real place. Then Z(G)=∩_α Z_α. Put Tbar=T/Z(G) and Zbar_α=Z_α/Z(G). Regard Zbar_α(A_f)/Zbar_α(Q) as subgroups of the abelian quotient Tbar(A_f)/Tbar(Q); their intersection is trivial. These identities force the residual adelic central adjustment in the marked comparison to be rational.

ShimuraVarieties:V7/conjugated-datum
TauCeti.Shimura.conjugatedDatum — Let G/Q be semisimple simply connected with connected datum X⁺, a G^ad(R)^+-class of h:S→G^ad_R satisfying the connected Shimura conditions. Choose a maximal rational torus T⊂G with h factoring through T^ad=T/Z(G); this is a D4 special pair for the adjoint datum. For τ∈Aut(C), the Taniyama extension 1→S→𝒯→Gal(Qbar/Q)→1 supplies the Serre-protorus torsor S_τ and its distinguished finite-adelic point. The marked cocharacter μ_h is in X_*(T^ad), and gives ρ_h:S→T^ad. Use this inner action to form {}^{τ,h}G=S_τ×^S G. T is unchanged, {}^τh:S→({}^{τ,h}G)^ad_R factors through T^ad with cocharacter τμ_h, and {}^{τ,h}X⁺ is its connected adjoint real class. Retain the distinguished topological isomorphism G(A_f)≅{}^{τ,h}G(A_f). This construction is of connected data, not a full pure datum on the simply connected group.
API TauCeti.Shimura.conjugatedDatum.group (projection): The rational group is the contracted product inner form S_τ×^S G.
API TauCeti.Shimura.conjugatedDatum.specialTorus (data): The unchanged T embeds into the twist; the marked S-map factors through T^ad in the adjoint group and has cocharacter τμ_h.
API TauCeti.Shimura.conjugatedDatum.adelic (equivalence): The finite-adelic section induces the specified topological group isomorphism, compatible with embeddings of marked tori.
API TauCeti.Shimura.conjugatedDatum.localClass (characterisation): The inner twist is finite-locally trivial and its real cohomology class is represented by τμ_h(−1)/μ_h(−1).
API TauCeti.Shimura.conjugatedDatum.map (functoriality): An inclusion of connected data preserving the marked adjoint torus/cocharacter induces the compatible inclusion of twists and their adelic trivializations. Identity and composition hold.
API TauCeti.Shimura.conjugatedDatum.descent_ext (extensionality): Two morphisms of contracted-product twists agreeing after a common torsor-trivializing faithfully flat extension are equal; marked isomorphisms also retain the torus and distinguished adelic trivialization.
Test TauCeti.Shimura.conjugatedDatum.identity (degenerate): For τ=id the distinguished torsor section gives the original datum and identity adelic map.
Test TauCeti.Shimura.conjugatedDatum.sl2_conjugation (computation): For G=SL₂ with the norm-one Q(i) torus and the standard upper-half-plane adjoint S-map, τ equal to complex conjugation sends μ_h to its inverse and selects the lower-half-plane component. The group twist is split SL₂: the real obstruction μ_h(−1)⁻² is trivial and all finite local obstructions vanish. The marked adjoint homomorphism changes even though the group remains isomorphic.
Test TauCeti.Shimura.conjugatedDatum.finiteLocal (compatibility): For each finite prime p and t∈T(Q_p), the distinguished local isomorphism sends the embedded t to the same t in the untwisted marked torus of {}^{τ,h}G. An arbitrary unmarked local isomorphism need not have this property.

ShimuraVarieties:V7/kazhdan-uniformization
TauCeti.Shimura.kazhdan_uniformization — For a torsion-free arithmetic Hermitian quotient Γ\D and τ∈Aut(C), the universal cover of τ(Γ\D) is a Hermitian symmetric domain D′, and its fundamental group acts as a lattice in Aut(D′)^+. This is a key theorem to prove, with its exceptional noncompact cases included.

ShimuraVarieties:V7/weak-conjugation
TauCeti.Shimura.weak_conjugation — For a semisimple simply connected connected datum and τ∈Aut(C), there exist another connected datum (G₁,X₁⁺), an algebraic tower isomorphism τM⁰(G,X⁺)≅M⁰(G₁,X₁⁺), and a compatible finite-adelic group isomorphism. This assertion does not yet identify G₁ with the special-torus twist.

ShimuraVarieties:V7/marked-conjugation
TauCeti.Shimura.marked_conjugation — For the simple simply connected case, τM⁰(G,X⁺)≅M⁰({}^{τ,h}G,{}^{τ,h}X⁺) by an algebraic isomorphism sending τ[h] to [{}^τh] and equivariant for the distinguished finite-adelic map. The isomorphism is unique with these two conditions and is compatible with the embedded A₁ subvarieties.

ShimuraVarieties:V7/completed-conjugation-equivariance
TauCeti.Shimura.completed_conjugation_equivariance — The marked conjugation comparison is compatible with the completed adjoint rational symmetry of ConnectedTower, not merely G(A_f). Obtain this using compatible maps after finite totally real base extensions and density in the relevant congruence completion; all completion maps and marked-torus trivializations must agree.

ShimuraVarieties:V7/special-independence
TauCeti.Shimura.special_independence — For maximal special h,h′ in X⁺, the two marked comparisons are related by the canonical transition between their twisted connected data of Milne 6.3. The transition is transitive for triples and compatible with connected subdata and auxiliary totally real extension. Thus the full construction is independent of the marked point and auxiliary splitting field.

ShimuraVarieties:V7/conjugation-cocycle
TauCeti.Shimura.conjugation_cocycle — For σ fixing E(G,X), identify the conjugated datum with the original through the transformed cocharacter class and special-point-independent transition. The comparison defines an equivariant algebraic descent system f_σ:σSh_C→Sh_C with f_{στ}=f_σ∘σ(f_τ), compatible with levels, right translations and the actual special-pair reciprocity formula.

ShimuraVarieties:V7/finite-rigidifying-points
TauCeti.Shimura.finite_rigidifying_points — At a neat effective level, the automorphism group of a positive-dimensional arithmetic Hermitian quotient is finite. A Zariski-dense Hecke orbit of an actual special point contains a finite subset Σ whose pointwise stabilizer is trivial. In dimension zero the finite point set itself is a rigidifying set. The constructed descent system fixes Σ over a finite extension of the reflex field because each special point has an open reciprocity stabilizer.

ShimuraVarieties:V7/continuous-descent
TauCeti.Shimura.continuous_descent — The canonical descent system at each neat level is continuous: it splits over a finitely generated field extension of E inside C in the sense of Milne 1999 Theorem 1.1. A finite rigidifying subset fixed over a finite field forces this property by Corollary 1.2. Level comparisons then give the required compatible system at all levels.

ShimuraVarieties:V7/general-canonical
TauCeti.Shimura.general_canonical — Every pure Shimura datum admits a canonical tower over its reflex field, satisfying V4 at every level and independent of the auxiliary extension and marked special point. Apply effective quasi-projective descent to the continuous cocycle constructed above, descend finite quotients and level actions, and verify special reciprocity by comparison over C.

-/
