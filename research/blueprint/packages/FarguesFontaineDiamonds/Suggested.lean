/-
This file is not the roadmap and is not exhaustive. The roadmap document
README.md is definitive. These statements suggest Lean forms for names and
signatures. They claim no implementation.

The geometric parameters below denote the supplier objects specified in the
README: analytic adic spaces, perfectoid spaces, marked untilts, diamonds,
sites, closed Cartier divisors and enhanced coefficient categories. They do
not define competing carriers. Topological, geometric and enhanced coherence
conditions whose supplier types are unavailable are omitted, not replaced by
arbitrary Prop fields or Prop-valued definitions. Restore those hypotheses
before specializing a signature. Arbitrary instantiations of the category,
object or point-set parameters need not satisfy these statements.

The full mathematics and tests are in README.md and the adjacent comments.
The algebraic Witt, theta and norm portions use existing Mathlib types. Each
named test is an example with its proposed name in a comment. Elaboration
checks the expressible signature shapes; it cannot establish the omitted
supplier conditions. All proofs and constructed comparisons use sorry.
-/
import Mathlib.CategoryTheory.Equivalence
import Mathlib.CategoryTheory.Limits.Shapes.BinaryProducts.ProdComparison
import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.Ideal.Quotient.Defs
import Mathlib.Analysis.Normed.Ring.Basic
import Mathlib.Topology.MetricSpace.Completion
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic

noncomputable section
open CategoryTheory CategoryTheory.Limits
namespace TauCeti.FFDiamond
universe u v

/-! Layer F0 — analytic_interface
Y and X are analytic adic spaces over Spa(Z_p,Z_p). Every imported interval chart has its complete Hausdorff Tate ring B^I, plus subring B^{I,+} equal to the prescribed integral closure inside the power-bounded elements, and the structural ring maps from Z_p are continuous and bounded. The analytic open Y is D(p) ∩ D([varpi]) = D(p[varpi]), inside the unlocalized (p,[varpi])-adic Witt pair. -/
-- This signature expresses the product-open condition on the existing
-- valuation spectrum. Analyticity of Y/X and their structural maps are the
-- fuller target in README.md, using the Tau Ceti Tate-analyticity theorem.
theorem analytic_interface (B : Type u) [CommRing B]
    (v : TauCeti.ValuationSpectrum B) (p varpi : B) :
    p * varpi ∉ v.supp ↔ p ∉ v.supp ∧ varpi ∉ v.supp := by
  sorry

/-! Layer F0 — qp_factorisation
The structural morphisms Y → Spa(Z_p,Z_p) and X → Spa(Z_p,Z_p) factor uniquely through Spa(Q_p,Z_p). On every rational chart p is invertible and the extended Q_p ring homomorphism is continuous, carries Z_p into B^{I,+}, and agrees on overlaps; q and Frobenius are over Spa(Q_p,Z_p). -/
-- Y,Zp,Qp and j denote the actual supplier objects and the rational generic inclusion.
-- Continuity, boundedness and the p-invertible locus hypotheses are omitted.
theorem qp_factorisation {Adic : Type u} [Category.{v} Adic]
    (Y Zp Qp : Adic) (j : Qp ⟶ Zp) (structural : Y ⟶ Zp) :
    ∃! f : Y ⟶ Qp, f ≫ j = structural := by
  sorry

/-! Layer F0 — chart_category_interface
The imported maps U_n,V_n → Y, q:Y→X, and the isomorphisms U_n ≅ q(U_n), V_n ≅ q(V_n) are morphisms in the analytic adic category used by D6. The comparison with analytic Yoneda-adic spaces is fully faithful on these sheafy objects, preserves these open restrictions, and computes the analytic fibre products needed for q’s relation. -/
-- The supplied actual chart maps become isomorphisms onto their quotient opens.
-- Plus rings, valuations and fibre-product comparison are not yet typed.
theorem chart_category_interface {Adic : Type u} [Category.{v} Adic]
    {W qW : Adic} (chartMap : W ⟶ qW) : IsIso chartMap := by
  sorry

/-! Layer F0 — choice_transport
For two pseudouniformizers varpi,varpi′, the anchor’s canonical Y and X isomorphisms intertwine q, Frobenius and the Q_p structural maps, preserve rational restrictions and satisfy identity/composition for three choices. Diamondification transports all these diagrams. -/
-- fY/fX are the anchor's canonical pseudouniformizer-change isomorphisms.
theorem choice_transport {Adic : Type u} [Category.{v} Adic]
    {Y Y' X X' : Adic} (fY : Y ≅ Y') (fX : X ≅ X')
    (q : Y ⟶ X) (q' : Y' ⟶ X') : q ≫ fX.hom = fY.hom ≫ q' := by
  sorry

/-! Layer F1 — bounded_witt_theta
Let T=Spa(A,A^+) be a characteristic-p affinoid perfectoid test space with marked Q_p-untilt T^sharp=Spa(A^sharp,A^{sharp,+}). Continuous bounded maps W(O_F)→A^{sharp,+} whose [varpi] image is a unit of A^sharp are naturally in bijection with continuous bounded maps O_F→A^+ whose varpi image is a unit of A. In the forward construction from f, the map is theta_Asharp ∘ W(f), using the marking A^+ ≅ (A^{sharp,+})^flat. Both sides require the specified (p,[varpi])-adic/source and untilt-plus topologies. The inverse uses compatible p-power roots and reduction modulo p; it is not an assertion about all algebraic ring homomorphisms. -/
-- The actual topological bijection is not yet typed. This is its algebraic
-- forward formula, using the existing theta rather than defining a second theta.
theorem bounded_witt_theta {R A : Type u} [CommRing R] [CommRing A]
    (p : ℕ) [Fact p.Prime] [Fact (¬ IsUnit (p : A))]
    [IsAdicComplete (Ideal.span {(p : A)}) A]
    (f : R →+* PreTilt A p) (x : R) :
    (WittVector.fontaineTheta A p).comp (WittVector.map f)
      (WittVector.teichmuller p x) = (f x).untilt := by
  sorry

/-! Layer F1 — affinoid_product
For every affinoid characteristic-p perfectoid T, construct alpha_T:Y^diamond(T) ≃ Hom_Perf(T,S) × Spd(Q_p)(T). The forward map sends the isomorphism class of ((T^sharp,iota),h:T^sharp→Y) to (the tilted O_F-map recovered by the bounded Witt–theta correspondence, (T^sharp,iota) with its induced Q_p structure). The inverse composes W(f) with theta and factors through the actual open Y. This respects isomorphisms of marked untilts. -/
-- Ypoints, Spoints and Qpoints are the imported point sets for a fixed affinoid T.
-- Their perfectoid/marked-untilt interpretations and topological conditions are omitted.
def affinoid_product (Ypoints Spoints Qpoints : Type u) :
    Ypoints ≃ Spoints × Qpoints := by
  sorry

lemma affinoid_product_forward (Ypoints Spoints Qpoints : Type u)
    (base : Ypoints → Spoints) (untilt : Ypoints → Qpoints) (z : Ypoints) :
    affinoid_product Ypoints Spoints Qpoints z = (base z, untilt z) := by
  sorry

lemma affinoid_product_inverse (Ypoints Spoints Qpoints : Type u)
    (thetaPoint : Spoints → Qpoints → Ypoints) (f : Spoints) (u : Qpoints) :
    (affinoid_product Ypoints Spoints Qpoints).symm (f, u) = thetaPoint f u := by
  sorry

-- ringMap interprets a geometric point; f is the tilted base ring map of that point.
lemma affinoid_product_inverse_formula (Ypoints Spoints Qpoints : Type u)
    {R A : Type u} [CommRing R] [CommRing A] (p : ℕ) [Fact p.Prime]
    [Fact (¬ IsUnit (p : A))] [IsAdicComplete (Ideal.span {(p : A)}) A]
    (ringMap : Ypoints → (WittVector p R →+* A))
    (s : Spoints) (u : Qpoints) (f : R →+* PreTilt A p) (x : R) :
    ringMap ((affinoid_product Ypoints Spoints Qpoints).symm (s, u))
      (WittVector.teichmuller p x) = (f x).untilt := by
  sorry

-- Extensionality keeps the tilted base map and the marked untilt separately.
lemma affinoid_product_ext (Ypoints Spoints Qpoints : Type u) (z z' : Ypoints) :
    z = z' ↔
      (affinoid_product Ypoints Spoints Qpoints z).1 =
        (affinoid_product Ypoints Spoints Qpoints z').1 ∧
      (affinoid_product Ypoints Spoints Qpoints z).2 =
        (affinoid_product Ypoints Spoints Qpoints z').2 := by
  sorry

/- Test TauCeti.FFDiamond.affinoid_product_base (computation): For T=S and any marked Q_p-untilt u of S, the theta-defined i_u maps to (id_S,u).
Supplier conditions not typeable in these signatures are omitted as above. -/
example (Ypoints Spoints Qpoints : Type u) (thetaPoint : Ypoints)
    (identityBase : Spoints) (u : Qpoints) :
    affinoid_product Ypoints Spoints Qpoints thetaPoint = (identityBase, u) := by sorry

/- Test TauCeti.FFDiamond.affinoid_product_excludes_char_p (non-example): An untilt with p=0 does not occur in either side with Spd Q_p; its map factors only into the integral analytic locus.
Supplier conditions not typeable in these signatures are omitted as above. -/
example (A : Type u) [CommRing A] [Nontrivial A] (p : ℕ) [CharP A p] :
    ¬ IsUnit (p : A) := by sorry

/- Test TauCeti.FFDiamond.affinoid_product_teichmuller (computation): For the inverse of (f,u), [varpi] maps to f(varpi)^sharp, a unit in the untilt Tate ring; its plus-ring membership does not assert that it is a plus-ring unit.
Supplier conditions not typeable in these signatures are omitted as above. -/
example {R A : Type u} [CommRing R] [CommRing A] (p : ℕ) [Fact p.Prime]
    [Fact (¬ IsUnit (p : A))] [IsAdicComplete (Ideal.span {(p : A)}) A]
    (f : R →+* PreTilt A p) (varpi : R) :
    (WittVector.fontaineTheta A p).comp (WittVector.map f)
      (WittVector.teichmuller p varpi) = (f varpi).untilt := by sorry

/- Test TauCeti.FFDiamond.affinoid_product_compatible_roots (computation):
For F=completion(F_p((t^{1/p^infty}))) and the completion of
Q_p(p^{1/p^infty}), the inverse of (id_S,u) sends every [t^{1/p^m}]
to p^{1/p^m}, with the p-power relations retained. The complete fields,
their plus rings, the marking t^sharp=p and the two invertible elements
are not yet typeable. This fragment tests the actual theta evaluations on
a compatible root family with the marking equations stated as hypotheses. -/
example {R A : Type u} [CommRing R] [CommRing A] (p : ℕ) [Fact p.Prime]
    [Fact (¬ IsUnit (p : A))] [IsAdicComplete (Ideal.span {(p : A)}) A]
    (f : R →+* PreTilt A p) (tRoots : ℕ → R) (pRoots : ℕ → A)
    (hmark : ∀ m, (f (tRoots m)).untilt = pRoots m)
    (hroots : ∀ m, pRoots (m + 1) ^ p = pRoots m) :
    (∀ m, (WittVector.fontaineTheta A p).comp (WittVector.map f)
      (WittVector.teichmuller p (tRoots m)) = pRoots m) ∧
    (∀ m, pRoots (m + 1) ^ p = pRoots m) := by
  sorry

/-! Layer F1 — point_naturality
For every morphism g:T′→T of characteristic-p perfectoid test spaces, alpha_T′(g^*z)=(f∘g,g^*u) when alpha_T(z)=(f,u). This includes rational restrictions and arbitrary test spaces after gluing. Untilts are pulled back in the perfectoid slice category, with the induced marking. The affinoid formulas agree on overlaps and are invariant under isomorphic presentations of the untilt. -/
-- These are the restriction maps on the three actual point functors.
theorem point_naturality (YT YT' ST ST' QT QT' : Type u)
    (rY : YT → YT') (rS : ST → ST') (rQ : QT → QT') (z : YT) :
    affinoid_product YT' ST' QT' (rY z) =
      (rS (affinoid_product YT ST QT z).1, rQ (affinoid_product YT ST QT z).2) := by
  sorry

/-! Layer F1 — product_iso
Glue the alpha_T into a natural isomorphism of v-sheaves alpha_F:Y^diamond ≅ S × Spd(Q_p), and regard it as an isomorphism of locally spatial diamonds. Its component on an arbitrary T is obtained by affinoid restriction and gluing of the bounded formulas. The locally spatial structures are those supplied by D6 and the representable/Spd factors. -/
-- V is to be instantiated with the supplier v-sheaf category, Y with Y's diamond.
-- Local spatiality, construction from affinoid points and sheaf hypotheses are omitted.
def product_iso {V : Type u} [Category.{v} V] [HasBinaryProducts V]
    (Y S Qp : V) : Y ≅ S ⨯ Qp := by
  sorry

lemma product_iso_apply (Ypoints Spoints Qpoints : Type u)
    (alphaComponent : Ypoints → Spoints × Qpoints) (z : Ypoints) :
    alphaComponent z = affinoid_product Ypoints Spoints Qpoints z := by
  sorry

lemma product_iso_inverse {V : Type u} [Category.{v} V] [HasBinaryProducts V]
    (Y S Qp : V) (thetaGlued : S ⨯ Qp ⟶ Y) :
    (product_iso Y S Qp).inv = thetaGlued := by
  sorry

lemma product_iso_over_qp {V : Type u} [Category.{v} V] [HasBinaryProducts V]
    (Y S Qp : V) (structural : Y ⟶ Qp) :
    (product_iso Y S Qp).hom ≫ prod.snd = structural := by
  sorry

lemma product_iso_ext {V : Type u} [Category.{v} V] [HasBinaryProducts V]
    (Y S Qp Z : V) (h k : Z ⟶ Y) :
    h = k ↔
      h ≫ (product_iso Y S Qp).hom ≫ prod.fst =
        k ≫ (product_iso Y S Qp).hom ≫ prod.fst ∧
      h ≫ (product_iso Y S Qp).hom ≫ prod.snd =
        k ≫ (product_iso Y S Qp).hom ≫ prod.snd := by
  sorry

/- Test TauCeti.FFDiamond.product_iso_identity_section (computation): For any marked untilt u:S→Spd Q_p, the diamond map of i_u is sent to the graph (id_S,u).
Supplier conditions not typeable in these signatures are omitted as above. -/
example {V : Type u} [Category.{v} V] [HasBinaryProducts V]
    (Y S Qp : V) (i : S ⟶ Y) (u : S ⟶ Qp) :
    i ≫ (product_iso Y S Qp).hom = prod.lift (𝟙 S) u := by sorry

/- Test TauCeti.FFDiamond.product_iso_rational_restriction (compatibility): Restricting a test T to a rational open gives the restriction of alpha_T, with the same untilt and tilted base map.
Supplier conditions not typeable in these signatures are omitted as above. -/
example (YT YU ST SU QT QU : Type u)
    (rY : YT → YU) (rS : ST → SU) (rQ : QT → QU) (z : YT) :
    affinoid_product YU SU QU (rY z) =
      (rS (affinoid_product YT ST QT z).1, rQ (affinoid_product YT ST QT z).2) := by sorry

/- Test TauCeti.FFDiamond.product_iso_both_factors (characterisation): For two points with the same Q_p-untilt, equality of their images under alpha_T holds exactly when their maps to S agree; forgetting the first factor is not injective in general.
Supplier conditions not typeable in these signatures are omitted as above. -/
example (Ypoints Spoints Qpoints : Type u) (y z : Ypoints)
    (hQ : (affinoid_product Ypoints Spoints Qpoints y).2 =
      (affinoid_product Ypoints Spoints Qpoints z).2) :
    y = z ↔ (affinoid_product Ypoints Spoints Qpoints y).1 =
      (affinoid_product Ypoints Spoints Qpoints z).1 := by sorry

/-! Layer F1 — projection_field_naturality
F′ is also a complete rank-one characteristic-p perfectoid field with its valuation
ring; the same prime p and the stated continuous bounded field-map hypotheses apply.
The alpha_F diagram commutes over Spd Q_p. For a continuous isometric characteristic-p field embedding F→F′ carrying O_F into O_F′, the induced maps S′→S and Y_F′→Y_F satisfy alpha_F ∘ (Y_F′→Y_F)^diamond = ((S′→S)×id) ∘ alpha_F′. The same statement holds for continuous bounded field maps with the corresponding admissible topology and plus-ring hypotheses. Choice transport intertwines these diagrams. -/
-- Y',S' arise from F' and fS is induced contravariantly by the allowed field map.
theorem projection_field_naturality {V : Type u} [Category.{v} V]
    [HasBinaryProducts V] (Y Y' S S' Qp : V) (fY : Y' ⟶ Y) (fS : S' ⟶ S) :
    fY ≫ (product_iso Y S Qp).hom =
      (product_iso Y' S' Qp).hom ≫ prod.map fS (𝟙 Qp) := by
  sorry

/-! Layer F2 — frobenius_equivariance
With phi_Y induced contravariantly by Witt Frobenius and phi_S induced by x↦x^p, alpha_F ∘ phi_Y^diamond = (phi_S×id) ∘ alpha_F. On an affinoid point represented by theta_u ∘ W(f), postcomposition with phi_Y changes f to f∘Frob_O_F, while retaining u. The radius kappa=log|[varpi]|/log|p|, evaluated on the unique rank-one generalization of an analytic point, satisfies kappa(phi_Y x)=p·kappa(x). -/
-- phiY is Witt Frobenius's diamond; phiS is absolute p-power Frobenius.
-- The valuation-radius assertion is recorded separately below.
theorem frobenius_equivariance {V : Type u} [Category.{v} V]
    [HasBinaryProducts V] (Y S Qp : V) (phiY : Y ⟶ Y) (phiS : S ⟶ S) :
    phiY ≫ (product_iso Y S Qp).hom =
      (product_iso Y S Qp).hom ≫ prod.map phiS (𝟙 Qp) := by
  sorry

-- Additional shape of the chosen-generator check, with the actual kappa supplied.
example (Ypoints : Type u) (phiY : Ypoints → Ypoints)
    (kappa : Ypoints → ℝ) (p : ℕ) (y : Ypoints) :
    kappa (phiY y) = (p : ℝ) * kappa y := by
  sorry

/-! Layer F2 — adic_graph_relation
The map coprod_{n∈Z}Y → Y×_X Y, on the n-th component y↦(y,phi_Y^n(y)), is an isomorphism in the analytic Yoneda-adic category. Locally on both factors it is the coproduct of the actual graph isomorphisms between wandering charts. The cocycle composition is addition of integer exponents. -/
-- relationMap is coprod_Z Y -> Y x_X Y, with graph n mapping to (y,phi^n y).
-- Construction of that coproduct/fibre product is imported and omitted here.
theorem adic_graph_relation {Adic : Type u} [Category.{v} Adic]
    {graphs relation : Adic} (relationMap : graphs ⟶ relation) : IsIso relationMap := by
  sorry

/-! Layer F2 — diamond_graph_relation
The same graph maps give an isomorphism coprod_Z Y^diamond ≅ Y^diamond×_{X^diamond}Y^diamond of v-sheaves. Source and target are (y,n)↦y and (y,n)↦phi_Y^{diamond,n}(y); the diagonal, inverse and composition have labels 0,−n,n+m. -/
-- The objects and canonical graph comparison now live in the v-sheaf category.
theorem diamond_graph_relation {V : Type u} [Category.{v} V]
    {graphs relation : V} (relationMap : graphs ⟶ relation) : IsIso relationMap := by
  sorry

/-! Layer F2 — diamond_quotient_cover
q^diamond:Y^diamond→X^diamond is a surjective étale morphism and hence a cover for the v-topology. It restricts to isomorphisms U_n^diamond→q(U_n)^diamond and V_n^diamond→q(V_n)^diamond; q(U_0)^diamond and q(V_0)^diamond cover X^diamond. -/
-- Only effective-epimorphism shape is typed; surjective etale/v-cover conditions are omitted.
theorem diamond_quotient_cover {V : Type u} [Category.{v} V]
    {Y X : V} (q : Y ⟶ X) : Epi q := by
  sorry

/-! Layer F2 — effective_quotient
q^diamond is the effective quotient of the Frobenius graph relation: for every v-sheaf Z, composition with q^diamond identifies Hom(X^diamond,Z) with the morphisms h:Y^diamond→Z such that h∘phi_Y^diamond=h. The quotient is the sheaf quotient; an arbitrary pointwise orbit presheaf need not satisfy this universal property before sheafification. -/
-- q and phi are the specified cover and chosen-generator action in v-sheaves.
theorem effective_quotient {V : Type u} [Category.{v} V]
    {Y X Z : V} (q : Y ⟶ X) (phi : Y ⟶ Y) (h : Y ⟶ Z)
    (hinvariant : phi ≫ h = h) : ∃! descended : X ⟶ Z, q ≫ descended = h := by
  sorry

/-! Layer F2 — quotient_iso
Construct beta_F:X^diamond ≅ (S×Spd(Q_p))/(phi_S^Z×id) as the unique isomorphism induced by alpha_F between the two effective quotient sheaves. If pi:S×Spd(Q_p)→Q_F is the quotient map, beta_F∘q^diamond=pi∘alpha_F. The action is on S; Q_F is an imported quotient sheaf, not a newly defined curve carrier. -/
-- Orbit is the D0/D4 sheaf quotient of S x Spd Qp by Frobenius on S.
def quotient_iso {V : Type u} [Category.{v} V] (X Orbit : V) : X ≅ Orbit := by
  sorry

lemma quotient_iso_square {V : Type u} [Category.{v} V] [HasBinaryProducts V]
    (Y X S Qp Orbit : V) (q : Y ⟶ X) (pi : S ⨯ Qp ⟶ Orbit) :
    q ≫ (quotient_iso X Orbit).hom = (product_iso Y S Qp).hom ≫ pi := by
  sorry

lemma quotient_iso_over_qp {V : Type u} [Category.{v} V]
    (X Orbit Qp : V) (xQp : X ⟶ Qp) (orbitQp : Orbit ⟶ Qp) :
    (quotient_iso X Orbit).hom ≫ orbitQp = xQp := by
  sorry

lemma quotient_iso_unique {V : Type u} [Category.{v} V] [HasBinaryProducts V]
    (Y X S Qp Orbit : V) (q : Y ⟶ X) [Epi q] (pi : S ⨯ Qp ⟶ Orbit)
    (f : X ⟶ Orbit) (h : q ≫ f = (product_iso Y S Qp).hom ≫ pi) :
    f = (quotient_iso X Orbit).hom := by
  sorry

/- Test TauCeti.FFDiamond.quotient_iso_zero_graph (degenerate): The zero graph descends to the diagonal and beta_F agrees with alpha_F followed by pi on every wandering chart.
Supplier conditions not typeable in these signatures are omitted as above. -/
example {V : Type u} [Category.{v} V] [HasBinaryProducts V]
    (Y X S Qp Orbit : V) (q : Y ⟶ X) (pi : S ⨯ Qp ⟶ Orbit) :
    q ≫ (quotient_iso X Orbit).hom = (product_iso Y S Qp).hom ≫ pi := by sorry

/- Test TauCeti.FFDiamond.quotient_iso_positive_generator (compatibility): Under beta_F, the q-relation for phi_Y maps to the phi_S graph, with the Q_p factor fixed.
Supplier conditions not typeable in these signatures are omitted as above. -/
example {V : Type u} [Category.{v} V] [HasBinaryProducts V]
    (Y X S Qp Orbit : V) (q : Y ⟶ X) (phiY : Y ⟶ Y) (phiS : S ⟶ S)
    (pi : S ⨯ Qp ⟶ Orbit) :
    phiY ≫ q ≫ (quotient_iso X Orbit).hom =
      (product_iso Y S Qp).hom ≫ prod.map phiS (𝟙 Qp) ≫ pi := by sorry

/- Test TauCeti.FFDiamond.quotient_iso_locally_constant_labels (characterisation): A locally constant integer shift on a disjoint union of test spaces gives equal quotient sections; a construction quotienting only by a single global integer fails this test.
Supplier conditions not typeable in these signatures are omitted as above. -/
-- Ypoints here is a DISJOINT UNION test's point set. shift applies its locally
-- constant integer labels componentwise; the local-constancy type is omitted.
example (Ypoints OrbitPoints : Type u) (pi : Ypoints → OrbitPoints)
    (shift : Ypoints → Ypoints) (y : Ypoints) : pi (shift y) = pi y := by sorry

/-! Layer F2 — quotient_spatiality_choices
X^diamond and Q_F are locally spatial and qcqs. Their underlying spaces agree with the adic quotient. Prove qcqs from the finite affinoid cover q(U_0),q(V_0) and quasi-compact intersections computed by finitely many translates between bounded-radius intervals. beta_F is compatible with the anchor’s varpi-change isomorphisms and independent of wandering-window choices. -/
-- Only the independence diagram is typed. Local spatiality, qcqs and finite
-- interval-overlap hypotheses await the geometric supplier structures.
theorem quotient_spatiality_choices {V : Type u} [Category.{v} V]
    (X X' Orbit : V) (change : X ≅ X') :
    change.hom ≫ (quotient_iso X' Orbit).hom = (quotient_iso X Orbit).hom := by
  sorry

/-! Layer F3 — site_equiv
Specialize the general D6 comparison to an equivalence eta:X_et ≌ X^diamond_et and eta_f:X_fet ≌ X^diamond_fet. The forward functors send an étale or finite étale map Z→X to Z^diamond→X^diamond; the inverse is the D6 inverse, and unit/counit agree with it. Covering families are precisely the set-theoretically surjective families of the public KL15 site convention. The inclusion of finite étale into étale objects commutes up to the specified natural isomorphism. -/
-- Cet,Det and diamondFunctor denote the actual supplied etale sites and functor.
-- Site topologies and covering-preservation are unavailable in these signatures.
def site_equiv (Cet Det : Type u) [Category.{v} Cet] [Category.{v} Det] : Cet ≌ Det := by
  sorry

lemma site_equiv_functor (Cet Det : Type u) [Category.{v} Cet] [Category.{v} Det]
    (diamondFunctor : Cet ⥤ Det) : (site_equiv Cet Det).functor = diamondFunctor := by
  sorry

-- This API is itself the named restriction equivalence, not a new finite-etale definition.
lemma site_equiv_finite (Cet Det Cf Df : Type u)
    [Category.{v} Cet] [Category.{v} Det] [Category.{v} Cf] [Category.{v} Df]
    (incC : Cf ⥤ Cet) (incD : Df ⥤ Det) :
    Nonempty ((site_equiv Cf Df).functor ⋙ incD ≅ incC ⋙ (site_equiv Cet Det).functor) := by
  sorry

-- Covering conditions are left out. The underlying-space comparison is the
-- typeable part: a family's union is transported through the actual homeomorphism.
lemma site_equiv_covers {X XD : Type u} (e : X ≃ XD) (images : Set X) :
    images = Set.univ ↔ e '' images = Set.univ := by
  sorry

lemma site_equiv_unit_counit (Cet Det : Type u) [Category.{v} Cet] [Category.{v} Det]
    (generalD6 : Cet ≌ Det) :
    HEq (site_equiv Cet Det).unitIso.hom generalD6.unitIso.hom := by
  sorry

/- Test TauCeti.FFDiamond.site_equiv_terminal (degenerate): The identity X→X maps to the identity X^diamond→X^diamond.
Supplier conditions not typeable in these signatures are omitted as above. -/
example (Cet Det : Type u) [Category.{v} Cet] [Category.{v} Det]
    (terminalAdic : Cet) (terminalDiamond : Det) :
    Nonempty ((site_equiv Cet Det).functor.obj terminalAdic ≅ terminalDiamond) := by sorry

/- Test TauCeti.FFDiamond.site_equiv_split_cover (computation): The split finite étale cover X⊔X→X maps to X^diamond⊔X^diamond→X^diamond, with its two projections preserved.
Supplier conditions not typeable in these signatures are omitted as above. -/
example (Cf Df : Type u) [Category.{v} Cf] [Category.{v} Df]
    (twoSheetAdic : Cf) (twoSheetDiamond : Df) :
    Nonempty ((site_equiv Cf Df).functor.obj twoSheetAdic ≅ twoSheetDiamond) := by sorry

/- Test TauCeti.FFDiamond.site_equiv_two_windows (compatibility): The two wandering-chart images cover X exactly when their diamond images cover X^diamond.
Supplier conditions not typeable in these signatures are omitted as above. -/
example {X XD : Type u} (e : X ≃ XD) (U V : Set X) :
    U ∪ V = Set.univ ↔ e '' U ∪ e '' V = Set.univ := by sorry

/-! Layer F3 — chart_site_compatibility
For each wandering chart W⊂Y on which q is an isomorphism onto an open of X, the restriction/pullback functors on the two étale sites commute with eta through the D6 open comparison and alpha_F. The induced square is a natural isomorphism, coherent for nested charts and for overlaps. Under beta_F it is the restriction of the quotient presentation. -/
-- Composite functors have the common target site DChart; pullbacks are supplied.
theorem chart_site_compatibility (Cet Det CChart DChart : Type u)
    [Category.{v} Cet] [Category.{v} Det] [Category.{v} CChart] [Category.{v} DChart]
    (rC : Cet ⥤ CChart) (rD : Det ⥤ DChart) :
    Nonempty ((site_equiv Cet Det).functor ⋙ rD ≅ rC ⋙ (site_equiv CChart DChart).functor) := by
  sorry

/-! Layer F3 — sheaf_descent
For any coefficient category for which étale sheaf descent is defined (in particular sets and modules over a discrete commutative ring), construct the equivalence between sheaves on X^diamond_et and pairs (M,c) with M a sheaf on Y^diamond_et and c:phi_Y^{diamond,*}M≅M. The induced c_n:phi_Y^{diamond,n,*}M≅M satisfy c_0=id and c_{m+n}=c_n∘phi^{n,*}(c_m), with the chosen pullback associators. Morphisms intertwine c. Use D0’s graph-relation Cech descent category, specialized to the étale-sheaf pseudofunctor specified in README.md. Its quotient-stack API alone does not establish that the étale-sheaf pseudofunctor is a stack. -/
-- ShX and Desc are the supplier's actual sheaf and Cech descent categories.
-- No local descent-data structure is introduced. Frobenius/associator data are omitted.
def sheaf_descent (ShX Desc : Type u) [Category.{v} ShX] [Category.{v} Desc] :
    ShX ≌ Desc := by
  sorry

lemma sheaf_descent_pullback (ShX Desc : Type u) [Category.{v} ShX] [Category.{v} Desc]
    (canonicalPull : ShX ⥤ Desc) : (sheaf_descent ShX Desc).functor = canonicalPull := by
  sorry

lemma sheaf_descent_inverse (ShX Desc : Type u) [Category.{v} ShX] [Category.{v} Desc]
    (canonicalGlue : Desc ⥤ ShX) : (sheaf_descent ShX Desc).inverse = canonicalGlue := by
  sorry

-- The explicit generator-cocycle formula uses genuine categorical isomorphisms.
-- F is pullback by phi^n, and transitionMN is the transition for m+n.
lemma sheaf_descent_cocycle {ShY : Type u} [Category.{v} ShY]
    (F : ShY ⥤ ShY) {M N L : ShY} (cm : M ≅ N)
    (cn : F.obj N ≅ L) (transitionMN : F.obj M ≅ L) :
    transitionMN.hom = (F.mapIso cm).hom ≫ cn.hom := by
  sorry

/- Test TauCeti.FFDiamond.sheaf_descent_constant (computation): A constant sheaf pulled back from X^diamond has the canonical constant-sheaf Frobenius cocycle; its descent returns the original sheaf.
Supplier conditions not typeable in these signatures are omitted as above. -/
example (ShX Desc : Type u) [Category.{v} ShX] [Category.{v} Desc]
    (constant : ShX) (constantCanonicalCocycle : Desc) :
    Nonempty ((sheaf_descent ShX Desc).functor.obj constant ≅ constantCanonicalCocycle) := by sorry

/- Test TauCeti.FFDiamond.sheaf_descent_negative_generator (compatibility): The −1 transition is the pulled-back inverse of the +1 transition, not an independent choice.
Supplier conditions not typeable in these signatures are omitted as above. -/
example {ShY : Type u} [Category.{v} ShY] (phiInvPull : ShY ⥤ ShY)
    {M N : ShY} (positive : M ≅ N) (negative : phiInvPull.obj N ≅ phiInvPull.obj M) :
    negative.hom = (phiInvPull.mapIso positive).inv := by sorry

/- Test TauCeti.FFDiamond.sheaf_descent_morphism (characterisation): A morphism descends exactly when it commutes with the generator cocycle; maps of underlying sheaves alone do not suffice.
Supplier conditions not typeable in these signatures are omitted as above. -/
-- F is Frobenius pullback. The underlying f is the candidate descended morphism.
example {ShY : Type u} [Category.{v} ShY] (F : ShY ⥤ ShY)
    {M N : ShY} (cM : F.obj M ≅ M) (cN : F.obj N ≅ N) (f : M ⟶ N)
    (descendedMorphisms : Set (M ⟶ N)) :
    f ∈ descendedMorphisms ↔ F.map f ≫ cN.hom = cM.hom ≫ f := by sorry

/-! Layer F3 — finite_cover_descent
The analogous equivalence for finite étale covers identifies covers of X^diamond with finite étale covers Z→Y^diamond carrying a Frobenius isomorphism and its cocycle. Via eta_f this is the descent description of finite étale covers of the adic X. For a finite étale cover, its represented sheaf descends to the sheaf represented by the descended cover. -/
-- The actual represented sheaf after descent is identified with that of the descended cover.
theorem finite_cover_descent {ShX : Type u} [Category.{v} ShX]
    (representedDescended descendedRepresented : ShX) :
    Nonempty (representedDescended ≅ descendedRepresented) := by
  sorry

/-! Layer F4 — section_untilt_equiv
Construct the natural bijection between sections of Y^diamond→S, morphisms S→Spd Q_p, and isomorphism classes of marked Q_p-untilts (S^sharp,iota). A section corresponding to u is alpha_F inverse composed with the graph (id_S,u). The projection Y^diamond→S is available here; no structural map X^diamond→S is asserted. -/
-- Sections and Untilts are imported sets, with Qp-untilt and marking conditions omitted.
def section_untilt_equiv (Sections Untilts : Type u) : Sections ≃ Untilts := by
  sorry

lemma section_untilt_equiv_graph (Sections Untilts : Type u)
    (graphSection : Untilts → Sections) (u : Untilts) :
    (section_untilt_equiv Sections Untilts).symm u = graphSection u := by
  sorry

lemma section_untilt_equiv_projection {V : Type u} [Category.{v} V]
    {S Y : V} (piS : Y ⟶ S) (sectionOfUntilting : S ⟶ Y) :
    sectionOfUntilting ≫ piS = 𝟙 S := by
  sorry

lemma section_untilt_equiv_recover (Sections Untilts : Type u)
    (secondProjection : Sections → Untilts) (s : Sections) :
    section_untilt_equiv Sections Untilts s = secondProjection s := by
  sorry

/- Test TauCeti.FFDiamond.section_untilt_equiv_identity (computation): For S=Spa(C^flat,O_Cflat) and u=Spa(C,O_C), C a complete algebraically closed extension of Q_p, the section is the theta_C graph with identity marking.
Supplier conditions not typeable in these signatures are omitted as above. -/
example (Sections Untilts : Type u) (thetaCSection : Sections) (markedC : Untilts) :
    section_untilt_equiv Sections Untilts thetaCSection = markedC := by sorry

/- Test TauCeti.FFDiamond.section_untilt_equiv_marking (characterisation): Replacing the marking by precomposition with phi_S changes the first-factor graph before quotienting; the section bijection distinguishes the two marked data.
Supplier conditions not typeable in these signatures are omitted as above. -/
-- markedU and shiftedU are the original and phi-shifted markings of a Qp-untilt.
example (Sections Untilts : Type u) (markedU shiftedU : Untilts) (h : markedU ≠ shiftedU) :
    (section_untilt_equiv Sections Untilts).symm markedU ≠
      (section_untilt_equiv Sections Untilts).symm shiftedU := by sorry

/- Test TauCeti.FFDiamond.section_untilt_equiv_char_p (non-example): The characteristic-p untilt S with p=0 gives no element of Spd Q_p and hence no section in this bijection.
Supplier conditions not typeable in these signatures are omitted as above. -/
example (A : Type u) [CommRing A] [Nontrivial A] (p : ℕ) [CharP A p] :
    ¬ IsUnit (p : A) := by sorry

/-! Layer F4 — primitive_equation_interface
For a marked Q_p-untilt of S, import the surjective bounded theta:W(O_F)→O_{Fsharp} and principal primitive kernel. After choosing a suitable pseudouniformizer varpi with varpi^sharp dividing p, choose a∈W(O_F) with theta(a)=p/varpi^sharp and use a primitive generator xi=p−a[varpi], up to an allowed unit multiple. The theta map induces i:S^sharp→Y because p and theta([varpi]) are units in Fsharp. This statement specifies the equation and map, not yet a closed Cartier divisor. -/
-- theta is the imported topological theta with primitive kernel, not an arbitrary map.
-- Primitive/continuity and the specific p-a[varpi] form are omitted here.
theorem primitive_equation_interface {R A : Type u} [CommRing R] [CommRing A]
    (theta : R →+* A) (xi : R) : RingHom.ker theta = Ideal.span {xi} := by
  sorry

-- Supplier hypothesis: both Q_p scalar maps are adic; bounded generic annuli have a cofinal p-power topology.
/-! Layer F4 — root_extension_frame
Let K_infty be the completion of Q_p(p^{1/p^infty}) with compatible roots p_m^p=p_{m−1}. For each imported rational period annulus B^I, form Btilde^I=B^I completed-tensor_{Q_p} K_infty with the A0 completed tensor topology and the integral closure of the base-changed plus ring. The inclusion B^I→Btilde^I has a continuous B^I-linear retraction induced by the coefficient retraction of K_infty onto Q_p. It is a closed topological embedding, compatible with rational restrictions. This is ordinary completed base extension; no uniform completion is inserted. -/
-- i denotes the actual annulus completed base extension. This states the
-- splitting required from the source; no alternate completed tensor type is defined.
theorem root_extension_frame {B Btilde : Type u} [NormedCommRing B]
    [NormedCommRing Btilde] (i : B →+* Btilde) :
    ∃ r : Btilde →+ B, Continuous r ∧ r.comp i.toAddMonoidHom = AddMonoidHom.id B := by
  sorry

/-! Layer F4 — root_annulus_tilt
On the n=1 integral chart of the auxiliary analytic domain D([varpi]), take compatible v_m=[varpi^{1/p^m}], s_m=p_m/v_m in the localized root extension, so s_m^p=s_{m−1}. Let A_0^+ be the [varpi]-adic completion of (W(O_F) completed-tensor_{Z_p}O_Kinfty)[s_m:m≥0], and A=A_0^+[1/[varpi]]. Establish [varpi]-torsion freeness and the integral perfectoid criterion, then A is perfectoid. Its tilt is the chart F⟨t_1^{1/p^infty}⟩ with t_1^sharp=p/[varpi]; the coordinate in the perfect open disc is t=varpi·t_1, so the chart is |t|≤|varpi|≠0. Rational subannuli covering Y inherit this perfectoid frame. The roots are quotients of compatible roots, not arbitrarily chosen roots with missing relations. -/
-- Only the compatible-root coordinate sharp equation is typed. Perfectoidness,
-- completion topology, torsion-freeness and the tilted affinoid identification are omitted.
theorem root_annulus_tilt {B : Type u} [CommRing B]
    (pRoot varpiRoot ratioRoot : ℕ → B) (p : ℕ)
    (hRatio : ∀ m, ratioRoot m * varpiRoot m = pRoot m)
    (hp : ∀ m, pRoot (m+1)^p = pRoot m)
    (hv : ∀ m, varpiRoot (m+1)^p = varpiRoot m)
    (hunit : ∀ m, IsUnit (varpiRoot m)) :
    ∀ m, ratioRoot (m+1)^p = ratioRoot m := by
  sorry

-- Renormalize the P1 |varpi|=1/2 gauge by log(p)/log(2), on tilt and untilt alike.
/-! Layer F4 — boundary_supremum
For a sufficiently small affinoid neighborhood U_n={|xi|≤|[varpi]|^n} of the untilt locus, normalize rank-one residue norms by |[varpi]|=p^−1. For every b∈O(U_n), the spectral supremum norm equals its supremum over boundary points where |xi|=|[varpi]|^n. The same norm detection holds after the split root extension. Geometric-fiber reduction, tilting and approximation by finite root levels must preserve this equality. The required classical one-variable input is the maximum-modulus boundary theorem for affinoid subdomains of the open disc without isolated components. Proving that input and its approximation and fiber passages is part of this target. -/
-- spectral and boundarySup are the actual normalized norms in the theorem.
-- Their geometric construction, boundary predicate and approximation hypotheses are omitted.
theorem boundary_supremum {B : Type u} (spectral boundarySup : B → ℝ) :
    ∀ b, spectral b = boundarySup b := by
  sorry

/-! Layer F4 — multiplication_lower_bound
Under the preceding neighborhood and normalization, every b∈O(U_n) satisfies ||xi·b||_sp ≥ p^−n ||b||_sp. The spectral norm induces the affinoid topology and is a genuine norm. For any rational affinoid U⊂Y, there is a positive constant c_U such that ||xi·b||_U ≥ c_U||b||_U, after an equivalent chart norm. Prove the analogous inequalities on every rational restriction needed for the closed-divisor criterion. -/
-- B is the affinoid algebra of U_n with its normalized spectral norm;
-- the actual U_n and boundary-supremum hypotheses are omitted.
theorem multiplication_lower_bound {B : Type u} [NormedCommRing B]
    (p n : ℕ) (xi : B) : ∀ b : B, (p : ℝ)^(-(n : ℤ)) * ‖b‖ ≤ ‖xi * b‖ := by
  sorry

/-! Layer F4 — rational_strict_exactness
For every rational affinoid U=Spa(B,B^+)⊂Y, multiplication by xi on B is injective and has closed image; B/xi B is its separated complete quotient. If V=U×_Y S^sharp is nonempty it is affinoid perfectoid and B/xi B ≅ O(V) as topological rings, with plus ring the integral closure of the image of B^+. If V is empty the quotient is zero. These identifications commute with further rational restrictions. -/
-- This genuine norm/completeness consequence is typed. The untilt quotient
-- identification and its plus-ring/rational-restriction conditions are omitted.
theorem rational_strict_exactness {B : Type u} [NormedCommRing B] [CompleteSpace B]
    (xi : B) (c : ℝ) (hc : 0 < c) (hbound : ∀ b : B, c * ‖b‖ ≤ ‖xi * b‖) :
    Function.Injective (fun b : B => xi * b) ∧
      IsClosed (Set.range (fun b : B => xi * b)) := by
  sorry

/-! Layer F4 — untilt_closed_divisor
Construct the actual closed immersion i_u:S^sharp→Y as the closed Cartier divisor with ideal sheaf xi O_Y. Cartier means this ideal embeds in O_Y and is locally free of rank one; closed means its quotient ringed space with inherited valuations is an adic space. Its affinoid quotient pairs are those of rational strict exactness. The construction is independent of the chosen primitive generator, auxiliary varpi and root-extension frame. -/
-- Ssharp,Y are actual adic spaces; Cartier ideal, quotient plus rings,
-- valuation/closedness conditions and independence-of-frame data are omitted.
def untilt_closed_divisor {Adic : Type u} [Category.{v} Adic]
    (Ssharp Y : Adic) : Ssharp ⟶ Y := by
  sorry

lemma untilt_closed_divisor_equation {B : Type u} [CommRing B]
    (xi : B) (chartIdeal : Ideal B) : chartIdeal = Ideal.span {xi} := by
  sorry

lemma untilt_closed_divisor_quotient {B A : Type u} [CommRing B] [CommRing A]
    (xi : B) : Nonempty ((B ⧸ Ideal.span {xi}) ≃+* A) := by
  sorry

lemma untilt_closed_divisor_unit_change {B : Type u} [CommRing B]
    (xi : B) (u : Bˣ) : Ideal.span {((u : B) * xi)} = Ideal.span {xi} := by
  sorry

/- Test TauCeti.FFDiamond.untilt_closed_divisor_geometric (computation): For F=C^flat and the marked untilt C, the completed residue field of its divisor point on Y is C and its integral theta quotient is O_C.
Supplier conditions not typeable in these signatures are omitted as above. -/
-- residue and C denote the actual completed residue field and geometric untilt C.
example (residue C : Type u) [Field residue] [Field C] : Nonempty (residue ≃+* C) := by sorry

/- Test TauCeti.FFDiamond.untilt_closed_divisor_disjoint (degenerate): On a rational chart disjoint from S^sharp, xi is a unit and the divisor quotient is zero.
Supplier conditions not typeable in these signatures are omitted as above. -/
example {B : Type u} [CommRing B] (xi : B) (hunit : IsUnit xi) :
    Ideal.span {xi} = ⊤ := by sorry

/- Test TauCeti.FFDiamond.untilt_closed_divisor_rational (compatibility): Restricting the divisor to any rational U gives the closed quotient pair above; global principality alone would not pass this test.
Supplier conditions not typeable in these signatures are omitted as above. -/
-- A is O(U intersection Ssharp); the topological plus-pair identification is omitted.
example {B A : Type u} [CommRing B] [CommRing A] (xi : B) :
    Nonempty ((B ⧸ Ideal.span {xi}) ≃+* A) := by sorry

/-! Layer F4 — untilt_sheaf_exactness
The canonical sequence 0→O_Y --xi→ O_Y → i_{u,*}O_{S^sharp}→0 is exact as sheaves of modules on Y, with strict exact quotient sequences on rational affinoid charts. The last map is the actual untilt restriction map. With unit-rescaled generators, the two sequences are identified by the unit multiplication in the first term. -/
-- chartRestriction is the actual theta quotient map B -> O(V).
-- The sheaf sequence is omitted until the sheaf-of-topological-rings type exists.
theorem untilt_sheaf_exactness {B A : Type u} [CommRing B] [CommRing A]
    (xi : B) (chartRestriction : B →+* A) :
    RingHom.ker chartRestriction = Ideal.span {xi} ∧
      Function.Surjective chartRestriction := by
  sorry

/-! Layer F4 — curve_untilt_divisor
The composite j_u=q∘i_u:S^sharp→X is a closed Cartier immersion. On each wandering chart of X its inverse image is obtained from the appropriate Frobenius translate of i_u; these local ideal sheaves glue to the Cartier ideal I_{D_u}. The pullback q^*I_{D_u} has support the locally finite union of all translates of the untilt locus. The ideal on X is not asserted globally principal and is not defined by a divergent product of all phi-translates of xi. -/
-- The Cartier/closed properties and local-finiteness of translated equations are omitted.
def curve_untilt_divisor {Adic : Type u} [Category.{v} Adic]
    (Ssharp Y X : Adic) (q : Y ⟶ X) : Ssharp ⟶ X := by
  sorry

lemma curve_untilt_divisor_map {Adic : Type u} [Category.{v} Adic]
    (Ssharp Y X : Adic) (q : Y ⟶ X) :
    curve_untilt_divisor Ssharp Y X q = untilt_closed_divisor Ssharp Y ≫ q := by
  sorry

-- The actual chart ideal is compared with the primitive equation of the chosen translate.
lemma curve_untilt_divisor_chart {B : Type u} [CommRing B]
    (translatedXi : B) (chartIdeal : Ideal B) : chartIdeal = Ideal.span {translatedXi} := by
  sorry

-- qPullIdeal and translatedUnionIdeal are the imported sheaf ideals on a chart.
lemma curve_untilt_divisor_pullback {B : Type u} [CommRing B]
    (qPullIdeal translatedUnionIdeal : Ideal B) : qPullIdeal = translatedUnionIdeal := by
  sorry

/- Test TauCeti.FFDiamond.curve_untilt_divisor_residue (computation): For F=C^flat and untilt C, the closed point of X defined by this construction has completed residue field C.
Supplier conditions not typeable in these signatures are omitted as above. -/
example (residueX C : Type u) [Field residueX] [Field C] :
    Nonempty (residueX ≃+* C) := by sorry

/- Test TauCeti.FFDiamond.curve_untilt_divisor_frobenius (compatibility): Precomposing the marking by phi_S gives the same closed divisor on X, because its lifted graph is related by phi_Y.
Supplier conditions not typeable in these signatures are omitted as above. -/
-- change is the canonical isomorphism of untilts when their markings are shifted.
example {Adic : Type u} [Category.{v} Adic] (Ssharp Ssharp' Y X : Adic)
    (change : Ssharp' ≅ Ssharp) (q : Y ⟶ X) :
    curve_untilt_divisor Ssharp' Y X q =
      change.hom ≫ curve_untilt_divisor Ssharp Y X q := by sorry

/- Test TauCeti.FFDiamond.curve_untilt_divisor_window_change (compatibility): Two overlapping wandering windows yield the same Cartier ideal on their common quotient open, including the transition unit.
Supplier conditions not typeable in these signatures are omitted as above. -/
-- B is the common quotient-chart ring and these are the two restricted ideals.
example {B : Type u} [CommRing B] (I J : Ideal B) : I = J := by sorry

/-! Layer F4 — untilt_orbit_invariance
The assignment u↦D_u is invariant under integer Frobenius shifts of the marking, with canonical isomorphism of closed immersions over X. On the Y lift, the section (id,u∘phi_S) is related to (id,u) by reparametrization of S and the positive phi_Y action: (phi_S×id)∘(id,u)∘phi_S^−1=(id,u∘phi_S^−1). Thus positive phi_Y corresponds to inverse precomposition of the marking when one resets the first coordinate to id. Prove this convention explicitly. The resulting fixed-field map factors through maps S→Spd Q_p/phi^Z in the stated FS sense; this moduli quotient is distinct from X^diamond. -/
-- This is the graph identity fixing the positive generator convention.
-- beta/Cartier descent and the untilt quotient functor conditions are omitted.
theorem untilt_orbit_invariance {V : Type u} [Category.{v} V] [HasBinaryProducts V]
    {S Qp : V} (phiS : S ≅ S) (u : S ⟶ Qp) :
    phiS.inv ≫ prod.lift (𝟙 S) u ≫ prod.map phiS.hom (𝟙 Qp) =
      prod.lift (𝟙 S) (phiS.inv ≫ u) := by
  sorry

/-! Layer F5 — completed_derived_equiv
For the stated discrete Lambda, enhance the exact sheaf equivalence induced by eta to an equivalence of ordinary enhanced derived categories of the two étale topoi, then left-complete in the standard t-structure. Compose with C2’s identification on the diamond side to obtain E_Lambda:hat D(X_et,Lambda) ≃ D_et(X^diamond,Lambda). Retain the inverse, unit, counit and t-exactness as coherent enhanced data, not only an equivalence of triangulated homotopy categories. -/
-- C,D are the supplier's enhanced left-completed and D_et categories. Only
-- their underlying categorical equivalence shape is expressible in these signatures.
-- Prime-to-p torsion, enhancement, t-structure and coherent Postnikov data are omitted.
def completed_derived_equiv (C D : Type u) [Category.{v} C] [Category.{v} D] : C ≌ D := by
  sorry

-- truncC/truncD denote corresponding tau_{>=k}, for every k.
lemma completed_derived_equiv_t_exact (C D : Type u) [Category.{v} C] [Category.{v} D]
    (truncC : C ⥤ C) (truncD : D ⥤ D) :
    Nonempty (truncC ⋙ (completed_derived_equiv C D).functor ≅
      (completed_derived_equiv C D).functor ⋙ truncD) := by
  sorry

lemma completed_derived_equiv_heart (C D : Type u) [Category.{v} C] [Category.{v} D]
    (A : C) (ordinaryHeartImage : D) :
    Nonempty ((completed_derived_equiv C D).functor.obj A ≅ ordinaryHeartImage) := by
  sorry

lemma completed_derived_equiv_inverse (C D : Type u) [Category.{v} C] [Category.{v} D]
    (inverseTowerComparison : D ⥤ C) :
    (completed_derived_equiv C D).inverse = inverseTowerComparison := by
  sorry

/- Test TauCeti.FFDiamond.completed_derived_equiv_constant (computation): The constant sheaf Lambda in degree zero maps to the constant sheaf Lambda on X^diamond.
Supplier conditions not typeable in these signatures are omitted as above. -/
example (C D : Type u) [Category.{v} C] [Category.{v} D]
    (constantLambda : C) (constantLambdaDiamond : D) :
    Nonempty ((completed_derived_equiv C D).functor.obj constantLambda ≅ constantLambdaDiamond) := by sorry

/- Test TauCeti.FFDiamond.completed_derived_equiv_bounded_below (compatibility): For every bounded-below complex, E_Lambda agrees with the ordinary enhanced site comparison followed by C2’s inclusion.
Supplier conditions not typeable in these signatures are omitted as above. -/
-- A is bounded below; the actual t-structure membership is omitted.
example (C D : Type u) [Category.{v} C] [Category.{v} D]
    (ordinaryComparison : C ⥤ D) (A : C) :
    Nonempty ((completed_derived_equiv C D).functor.obj A ≅ ordinaryComparison.obj A) := by sorry

/- Test TauCeti.FFDiamond.completed_derived_equiv_tower (characterisation): For an unbounded compatible Postnikov tower, E_Lambda is the limit of its finite-below truncation comparisons; the underlying uncompleted representative is not declared equal to this limit.
Supplier conditions not typeable in these signatures are omitted as above. -/
-- limitInD is the enhanced limit of the finite-truncation comparison tower of A.
example (C D : Type u) [Category.{v} C] [Category.{v} D] (A : C) (limitInD : D) :
    Nonempty ((completed_derived_equiv C D).functor.obj A ≅ limitInD) := by sorry

/-! Layer F5 — ordinary_bounded_below
On D^+(X_et,Lambda), E_Lambda agrees with the ordinary site-derived comparison and gives D^+(X_et,Lambda) ≃ D_et^+(X^diamond,Lambda). Ordinary enhanced derived categories of the two étale sites are equivalent in all degrees because their module topoi are exactly equivalent; the comparison with diamond D_et in unbounded degrees is the separately stated left-completed comparison, without an extra left-completeness assumption. -/
-- The bounded-below embedding and ordinary site comparison are supplied.
theorem ordinary_bounded_below (C D : Type u) [Category.{v} C] [Category.{v} D]
    (ordinaryImage : C ⥤ D) (A : C) :
    Nonempty ((completed_derived_equiv C D).functor.obj A ≅ ordinaryImage.obj A) := by
  sorry

/-! Layer F5 — completed_global_sections
Let eta^* be the exact module-sheaf equivalence. For bounded-below A the natural map RΓ(X_et,A)→RΓ(X^diamond_et,eta^*A) induced by the site functor is an equivalence. For a left-completed object represented by the compatible tower A_n=tau_{≥−n}A, the corresponding completed global sections are lim_n RΓ(X_et,A_n); compare them to RΓ_et(X^diamond,E_Lambda A) by the compatible actual finite-truncation comparison maps. The diamond right adjoint preserves this limit. Do not replace this map by a noncanonical equivalence of abstract cohomology groups. -/
-- rGammaMap is the actual induced morphism, not an independently chosen isomorphism.
-- Its construction as a compatible Postnikov limit is omitted.
theorem completed_global_sections {Coefficients : Type u} [Category.{v} Coefficients]
    {RG RGdiamond : Coefficients} (rGammaMap : RG ⟶ RGdiamond) : IsIso rGammaMap := by
  sorry

/-! Layer F5 — derived_pullback_tensor
For inclusions of imported rational and wandering charts, the completed derived comparison commutes with pullback via the coherent square of F3. It is compatible with the enhanced derived tensor product of Lambda-modules in the chosen C2 category (using its completion if that monoidal convention requires it), and with the unit Lambda. These natural isomorphisms agree on nested restrictions, associativity and units; tensor compatibility does not assert that a general inverse limit commutes with ordinary tensor. -/
-- This types one pullback square. Enhanced tensor/associator/unit data are omitted.
theorem derived_pullback_tensor (C D CChart DChart : Type u)
    [Category.{v} C] [Category.{v} D] [Category.{v} CChart] [Category.{v} DChart]
    (rC : C ⥤ CChart) (rD : D ⥤ DChart) :
    Nonempty ((completed_derived_equiv C D).functor ⋙ rD ≅
      rC ⋙ (completed_derived_equiv CChart DChart).functor) := by
  sorry

/-! Layer F5 — adic_derived_equiv
Using L0, define the adic comparison E_{Lambda,I}:D_et,adic(X,Lambda) ≃ D_et(X^diamond,Lambda) by the coherent inverse limit of the completed comparisons E_{Lambda/I^n}. On the adic side D_et,adic is the derived I-complete enhancement of the adic étale-site coefficient system, equivalently the compatible inverse limit of the finite-level categories supplied by L0. The diamond side is L0’s derived I-complete subcategory, not the same ring viewed with the discrete topology. -/
-- C,D now mean L0's derived-I-complete coefficient categories, not discrete ones.
-- Regular-sequence, prime-to-p, derived-completeness and enhanced-limit data are omitted.
def adic_derived_equiv (C D : Type u) [Category.{v} C] [Category.{v} D] : C ≌ D := by
  sorry

lemma adic_derived_equiv_reduce (C D Cn Dn : Type u)
    [Category.{v} C] [Category.{v} D] [Category.{v} Cn] [Category.{v} Dn]
    (reduceC : C ⥤ Cn) (reduceD : D ⥤ Dn) :
    Nonempty ((adic_derived_equiv C D).functor ⋙ reduceD ≅
      reduceC ⋙ (completed_derived_equiv Cn Dn).functor) := by
  sorry

-- tensorC/tensorD are the supplied completed tensors, evaluated at A,B.
lemma adic_derived_equiv_complete_tensor (C D : Type u)
    [Category.{v} C] [Category.{v} D] (tensorC : C → C → C) (tensorD : D → D → D)
    (A B : C) : Nonempty ((adic_derived_equiv C D).functor.obj (tensorC A B) ≅
      tensorD ((adic_derived_equiv C D).functor.obj A)
        ((adic_derived_equiv C D).functor.obj B)) := by
  sorry

lemma adic_derived_equiv_inverse_limit (C D : Type u)
    [Category.{v} C] [Category.{v} D] (enhancedLimitFunctor : C ⥤ D) :
    (adic_derived_equiv C D).functor = enhancedLimitFunctor := by
  sorry

/- Test TauCeti.FFDiamond.adic_derived_equiv_zell (computation): For Lambda=Z_ell, I=(ell), ell≠p, the constant derived-complete Z_ell sheaf reduces to the constant Z/ell^n comparison at every n.
Supplier conditions not typeable in these signatures are omitted as above. -/
-- Lambda=Z_ell,I=(ell),ell!=p; Cn/Dn are its Z/ell^n coefficient categories.
example (C D Cn Dn : Type u) [Category.{v} C] [Category.{v} D]
    [Category.{v} Cn] [Category.{v} Dn] (reduceC : C ⥤ Cn) (reduceD : D ⥤ Dn)
    (constantZell : C) : Nonempty (
      reduceD.obj ((adic_derived_equiv C D).functor.obj constantZell) ≅
      (completed_derived_equiv Cn Dn).functor.obj (reduceC.obj constantZell)) := by sorry

/- Test TauCeti.FFDiamond.adic_derived_equiv_reduction (compatibility): For I=(ell), the square for Z/ell^(n+1)→Z/ell^n commutes with derived coefficient reduction.
Supplier conditions not typeable in these signatures are omitted as above. -/
-- reduceC/reduceD now denote Z/ell^(n+1) -> Z/ell^n coefficient reduction.
example (Cn1 Dn1 Cn Dn : Type u) [Category.{v} Cn1] [Category.{v} Dn1]
    [Category.{v} Cn] [Category.{v} Dn] (reduceC : Cn1 ⥤ Cn) (reduceD : Dn1 ⥤ Dn) :
    Nonempty ((completed_derived_equiv Cn1 Dn1).functor ⋙ reduceD ≅
      reduceC ⋙ (completed_derived_equiv Cn Dn).functor) := by sorry

/- Test TauCeti.FFDiamond.adic_derived_equiv_completed_unit (characterisation): The tensor unit is the derived-complete Lambda object, and the tensor comparison is completed tensor; no ordinary tensor is declared complete by definition.
Supplier conditions not typeable in these signatures are omitted as above. -/
-- These are L0's derived-complete Lambda tensor units, not arbitrary discrete modules.
example (C D : Type u) [Category.{v} C] [Category.{v} D]
    (completeLambda : C) (completeLambdaDiamond : D) :
    Nonempty ((adic_derived_equiv C D).functor.obj completeLambda ≅ completeLambdaDiamond) := by sorry

/-! Layer F5 — adic_global_sections
The adic comparison commutes with chart pullbacks, derived reduction modulo every I^n, and L0 completed tensor. For A in the adic category, the actual global-sections comparison is the coherent inverse limit of the finite-level maps RΓ(X_et,A_n)→RΓ_et(X^diamond,E_n A_n), using the completed interpretation for unbounded A_n. Both sides are derived I-complete; for Lambda=Z_ell the reductions recover the finite Z/ell^n comparisons. No statement for Z_p or rational ell-adic coefficients is obtained by this completion argument. -/
-- actualLimitMap is the coherent limit of finite-level global-section maps.
theorem adic_global_sections {Coefficients : Type u} [Category.{v} Coefficients]
    {RG RGdiamond : Coefficients} (actualLimitMap : RG ⟶ RGdiamond) : IsIso actualLimitMap := by
  sorry

end TauCeti.FFDiamond
