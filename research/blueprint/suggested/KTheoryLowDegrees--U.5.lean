import Mathlib.GroupTheory.QuotientGroup.Defs
import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Algebra.Group.Int.TypeTags
import Mathlib.Algebra.Group.PUnit

set_option linter.unusedVariables false

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/KTheoryLowDegrees--U.5.md is definitive. These
statements suggest Lean forms so contributors and reviewers converge on names
and signatures. Every proposed proof and construction below is a prototype.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
Reviewed with lean-check against the exact Mathlib pin. The shared Tau Ceti
checkout differs from the Tau Ceti pin; this file imports only Mathlib.
This is not a compile of the exact paired baseline. No build was made.

The pinned libraries do not supply the ring-specific stable Steinberg group,
BGL plus space, or the generic relative K-space. Do not represent those missing
conditions by Prop-valued fields. The two namespaces below prototype the
expressible group-quotient interfaces with actual homomorphisms and subgroups.
They do not assert that an arbitrary group diagram is a ring plus square.
The omission inventory at the end records every unavailable API and ring test.
-/

namespace TauCeti.RelativeK1Loop

variable {N H K N' H' : Type*}
variable [Group N] [Group H] [Group K] [Group N'] [Group H']

/-- The quotient descent of the concrete congruence-loop homomorphism. -/
def toPlus (E : Subgroup N) [E.Normal] (c : N →* H) (hE : E ≤ c.ker) :
    N ⧸ E →* H := by
  sorry

lemma toPlus_mk (E : Subgroup N) [E.Normal] (c : N →* H)
    (hE : E ≤ c.ker) (n : N) :
    toPlus E c hE (QuotientGroup.mk' E n) = c n := by
  sorry

lemma projection (E : Subgroup N) [E.Normal] (c : N →* H)
    (hE : E ≤ c.ker) (a : N →* K) (ha : E ≤ a.ker) (p : H →* K)
    (hpc : p.comp c = a) :
    p.comp (toPlus E c hE) = QuotientGroup.lift E a ha := by
  sorry

lemma natural (E : Subgroup N) [E.Normal] (E' : Subgroup N') [E'.Normal]
    (c : N →* H) (c' : N' →* H') (hE : E ≤ c.ker) (hE' : E' ≤ c'.ker)
    (f : N →* N') (g : H →* H') (hf : E ≤ E'.comap f)
    (hgc : g.comp c = c'.comp f) :
    g.comp (toPlus E c hE) =
      (toPlus E' c' hE').comp (QuotientGroup.map E E' f hf) := by
  sorry

lemma unique (E : Subgroup N) [E.Normal] (c : N →* H) (hE : E ≤ c.ker)
    (d : N ⧸ E →* H) (hd : d.comp (QuotientGroup.mk' E) = c) :
    d = toPlus E c hE := by
  sorry

/-- Packet node relative-plus-bijective, conditional on the proved loop contract. -/
lemma bijective (E : Subgroup N) [E.Normal] (c : N →* H)
    (hE : E ≤ c.ker) (hc : Function.Surjective c) (hker : E = c.ker) :
    Function.Bijective (toPlus E c hE) := by
  sorry

-- Quotient interfaces are checked against the nearest existing notion.
-- These supplement the four ring tests; they are not substitutions for them.
example (E : Subgroup N) [E.Normal] (c : N →* H) (hE : E ≤ c.ker) :
    toPlus E c hE = QuotientGroup.lift E c hE := by
  sorry

example (E : Subgroup N) [E.Normal] (c : N →* H) (hE : E ≤ c.ker)
    (hc : Function.Surjective c) (hker : E = c.ker) :
    (toPlus E c hE).ker = ⊥ := by
  sorry

example (E : Subgroup N) [E.Normal] (c : N →* H) (hE : E ≤ c.ker)
    (hc : Function.Surjective c) (hker : E = c.ker) (n : N) :
    toPlus E c hE (QuotientGroup.mk' E n) =
      QuotientGroup.liftEquiv E hc hker (QuotientGroup.mk' E n) := by
  sorry

end TauCeti.RelativeK1Loop

namespace TauCeti.RelativeBoundary

variable {GA GB SA SB : Type*}
variable [Group GA] [Group GB] [Group SA] [Group SB]

-- qG models GL(q), qS models St(q), and phiA, phiB model the Steinberg maps.
-- E models E(A,I) in GA. The codomain is the actual kernel quotient, so no
-- artificial "is relative K1" proposition is introduced.
variable (qG : GA →* GB) (qS : SA →* SB)
variable (phiA : SA →* GA) (phiB : SB →* GB)
variable (hcomm : qG.comp phiA = phiB.comp qS)
variable (hq : Function.Surjective qS)
variable (E : Subgroup GA) [E.Normal]
variable (hEN : E ≤ qG.ker) (himage : qS.ker.map phiA ≤ E)
variable [CommGroup (qG.ker ⧸ E.subgroupOf qG.ker)]

/-- The inverse lifted-word rule. Commutativity of the quotient is essential. -/
noncomputable def ofLift (qG : GA →* GB) (qS : SA →* SB)
    (phiA : SA →* GA) (phiB : SB →* GB)
    (hcomm : qG.comp phiA = phiB.comp qS) (hq : Function.Surjective qS)
    (E : Subgroup GA) [E.Normal] (hEN : E ≤ qG.ker)
    (himage : qS.ker.map phiA ≤ E)
    [CommGroup (qG.ker ⧸ E.subgroupOf qG.ker)] :
    phiB.ker →* (qG.ker ⧸ E.subgroupOf qG.ker) := by
  sorry

include hcomm hq hEN himage

lemma lift_formula (z : phiB.ker) (w : SA) (hw : qS w = z.val) :
    ofLift qG qS phiA phiB hcomm hq E hEN himage z =
      QuotientGroup.mk' (E.subgroupOf qG.ker)
        ⟨(phiA w)⁻¹, by sorry⟩ := by
  sorry

-- Packet node relative-K2-boundary-lift-independence.
lemma lift_independent (z : phiB.ker) (w w' : SA)
    (hw : qS w = z.val) (hw' : qS w' = z.val) :
    QuotientGroup.mk' (E.subgroupOf qG.ker) ⟨(phiA w)⁻¹, by sorry⟩ =
      QuotientGroup.mk' (E.subgroupOf qG.ker) ⟨(phiA w')⁻¹, by sorry⟩ := by
  sorry

lemma one : ofLift qG qS phiA phiB hcomm hq E hEN himage 1 = 1 := by
  sorry

lemma mul (z z' : phiB.ker) :
    ofLift qG qS phiA phiB hcomm hq E hEN himage (z * z') =
      ofLift qG qS phiA phiB hcomm hq E hEN himage z *
      ofLift qG qS phiA phiB hcomm hq E hEN himage z' := by
  sorry

lemma zero_on_image (z : phiB.ker) (w : SA)
    (hw : qS w = z.val) (hphi : phiA w = 1) :
    ofLift qG qS phiA phiB hcomm hq E hEN himage z = 1 := by
  sorry

-- A section of the Steinberg map compatible with a section on linear groups.
lemma split (s : SB →* SA) (sG : GB →* GA)
    (hs : qS.comp s = MonoidHom.id SB) (hphis : phiA.comp s = sG.comp phiB)
    (z : phiB.ker) :
    ofLift qG qS phiA phiB hcomm hq E hEN himage z = 1 := by
  sorry

-- Packet node relative-K2-boundary-image; this formula avoids a new absolute
-- K1 carrier. Membership in phiA.range means that the matrix is elementary.
lemma image_characterisation (r : qG.ker ⧸ E.subgroupOf qG.ker) :
    r ∈ (ofLift qG qS phiA phiB hcomm hq E hEN himage).range ↔
      ∃ n : qG.ker, n.val ∈ phiA.range ∧
        QuotientGroup.mk' (E.subgroupOf qG.ker) n = r := by
  sorry

-- Packet node relative-K2-boundary-kernel. Equality, not just containment, of
-- the reduction-kernel image is needed for the reverse implication.
lemma kernel_characterisation (himage_eq : qS.ker.map phiA = E)
    (z : phiB.ker) :
    ofLift qG qS phiA phiB hcomm hq E hEN himage z = 1 ↔
      ∃ w : SA, phiA w = 1 ∧ qS w = z.val := by
  sorry

-- Naturality is expressible on actual group diagrams before ring carriers exist.
-- fN is the induced congruence-kernel map, with its underlying value specified.
lemma map {GA' GB' SA' SB' : Type*}
    [Group GA'] [Group GB'] [Group SA'] [Group SB']
    (qG' : GA' →* GB') (qS' : SA' →* SB')
    (phiA' : SA' →* GA') (phiB' : SB' →* GB')
    (hcomm' : qG'.comp phiA' = phiB'.comp qS')
    (hq' : Function.Surjective qS')
    (E' : Subgroup GA') [E'.Normal] (hEN' : E' ≤ qG'.ker)
    (himage' : qS'.ker.map phiA' ≤ E')
    [CommGroup (qG'.ker ⧸ E'.subgroupOf qG'.ker)]
    (u : GA →* GA') (s : SB →* SB') (t : SA →* SA')
    (fN : qG.ker →* qG'.ker)
    (hfN : ∀ n : qG.ker, (fN n).val = u n.val)
    (hE : E.subgroupOf qG.ker ≤ (E'.subgroupOf qG'.ker).comap fN)
    (hphi : phiA'.comp t = u.comp phiA)
    (hqS : qS'.comp t = s.comp qS)
    (z : phiB.ker) (z' : phiB'.ker) (hz : z'.val = s z.val) :
    QuotientGroup.map (E.subgroupOf qG.ker) (E'.subgroupOf qG'.ker) fN hE
        (ofLift qG qS phiA phiB hcomm hq E hEN himage z) =
      ofLift qG' qS' phiA' phiB' hcomm' hq' E' hEN' himage' z' := by
  sorry

end TauCeti.RelativeBoundary

namespace TauCeti.RelativeBoundarySignTest

-- A typed group-map test of the algebraic sign, not a Steinberg group of a ring.
-- qS=id on Multiplicative Z, phiA=id, GB is trivial, E is trivial.
-- Existing Mathlib maps and the bottom subgroup are used directly.

-- relativeBoundary_inverseSign
example (n : Multiplicative ℤ) :
    RelativeBoundary.ofLift
      (1 : Multiplicative ℤ →* PUnit)
      (MonoidHom.id (Multiplicative ℤ))
      (MonoidHom.id (Multiplicative ℤ))
      (1 : Multiplicative ℤ →* PUnit)
      (by sorry) (by sorry) (⊥ : Subgroup (Multiplicative ℤ))
      (by sorry) (by sorry)
      ⟨n, by sorry⟩ =
    QuotientGroup.mk'
      ((⊥ : Subgroup (Multiplicative ℤ)).subgroupOf
        (1 : Multiplicative ℤ →* PUnit).ker)
      ⟨n⁻¹, by sorry⟩ := by
  sorry

end TauCeti.RelativeBoundarySignTest

/-!
Explicit omission inventory, paired with packet names.

Missing supplier types: stable GL and St of a ring; the particular plus map;
based coherent ring-map squares; fundamental groups of these fibres; the full
ring K-space and its projective-triple component comparison. Requests
R-St-quotient, R-fibre-interchange, R-plus-based and R-ring-model supply
the missing interfaces.
An abstract N, H and c above types the quotient interface, not the topology.

Congruence-loop construction and its API, all omitted as ring/topological
signatures:
  CongruenceLoop.toPlus, CongruenceLoop.projection, CongruenceLoop.map,
  CongruenceLoop.one, CongruenceLoop.mul.
Its four ring tests cannot be expressed at this pin:
  congruenceLoop_zeroIdeal, congruenceLoop_wholeIdeal,
  congruenceLoop_integer_minusOne, congruenceLoop_nonSurjectiveReduction.

Relative quotient construction: RelativeK1Loop.toPlus and all five API items
are prototyped above at their abstract group-quotient interface. The following
four actual ring tests are omitted, not replaced by the supplemental examples:
  relativePlus_zeroIdeal, relativePlus_wholeIdeal,
  relativePlus_squareZeroUnits, relativePlus_notAbsoluteKernel.

Relative boundary construction: RelativeBoundary.ofLift, lift_formula, one,
mul, zero_on_image, split and map are typed above. The naturality API uses
actual maps of group diagrams; its ring specialization requires the supplier
functors. The comparison API RelativeBoundary.plus needs the missing based
plus/K-space models and its signature remains omitted. The group-map sign test
relativeBoundary_inverseSign is the example above. Ring/topology tests omitted:
  relativeBoundary_zeroIdeal, relativeBoundary_splitDualNumbers,
  relativeBoundary_liftedAbsoluteElement, relativeBoundary_prismSign.

Node-signature coverage:
  relative-plus-map: toPlus; relative-plus-bijective: bijective;
  relative-plus-projection: projection; relative-plus-natural: natural;
  relative-K2-boundary: ofLift;
  relative-K2-boundary-lift-independence: lift_independent;
  relative-K2-boundary-hom: mul;
  relative-K2-boundary-zero-on-image: zero_on_image;
  relative-K2-boundary-image: image_characterisation;
  relative-K2-boundary-kernel: kernel_characterisation;
  relative-K2-boundary-zero-split: split;
  relative-K2-boundary-natural: map.
These are conditional algebraic interfaces, not proofs of the ring contracts.

The following complete mathematical packet declarations have no expressible
ring/topological signature at the pin, and are omitted:
  plus-fibre-steinberg, plus-fibre-steinberg-natural,
  plus-fibre-boundary-kernel, plus-K2-natural,
  steinberg-kernel-elementary-image, classifying-reduction-fibre-component,
  congruence-loop-map, congruence-loop-projection, congruence-loop-natural,
  plus-square-fibre-sequence,
  plus-square-inner-fibre-connected, congruence-loop-surjective,
  congruence-loop-kernel, relative-plus-ring-model,
  relative-K2-boundary-plus,
  relative-components-comparison, relative-components-boundary,
  double-congruence-isom, double-relative-elementary-image,
  double-relative-K1-isom, relative-double-fibre-degree-one,
  relative-comparison-of-sequences.

Parent declarations are imported by node id in the reader, not copied into
this follow-up. Its six existing planets remain; this file adds no planets.
-/

/-!
Packet declaration ledger (typed = conditional algebra interface; omitted = absent carrier).
  plus-fibre-steinberg : TauCeti.PlusFibre.steinbergEquiv — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  plus-fibre-steinberg-natural : TauCeti.PlusFibre.steinbergEquiv_natural — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  plus-fibre-boundary-kernel : TauCeti.PlusFibre.k2BoundaryEquiv — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  plus-K2-natural : TauCeti.PlusFibre.k2BoundaryEquiv_natural — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  steinberg-kernel-elementary-image : TauCeti.SteinbergReduction.elementaryImage — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  classifying-reduction-fibre-component : TauCeti.ReductionFibre.baseComponentEquiv — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  congruence-loop-map : TauCeti.CongruenceLoop.toPlus — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  congruence-loop-projection : TauCeti.CongruenceLoop.projection — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  congruence-loop-natural : TauCeti.CongruenceLoop.map — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  plus-square-fibre-sequence : TauCeti.PlusSquare.iteratedFibreEquiv — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  plus-square-inner-fibre-connected : TauCeti.PlusSquare.innerFibre_connected — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  congruence-loop-surjective : TauCeti.CongruenceLoop.surjective — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  congruence-loop-kernel : TauCeti.CongruenceLoop.ker_eq_relativeElementary — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  relative-plus-map : TauCeti.RelativeK1Loop.toPlus — Typed conditional group-quotient interface; ring specialization requires suppliers.
  relative-plus-bijective : TauCeti.RelativeK1Loop.bijective — Typed conditional group-quotient interface; ring specialization requires suppliers.
  relative-plus-projection : TauCeti.RelativeK1Loop.projection — Typed conditional group-quotient interface; ring specialization requires suppliers.
  relative-plus-natural : TauCeti.RelativeK1Loop.natural — Typed conditional group-quotient interface; ring specialization requires suppliers.
  relative-plus-ring-model : TauCeti.RelativeK1Loop.ringModelEquiv — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  relative-K2-boundary-lift-independence : TauCeti.RelativeBoundary.lift_independent — Typed conditional group-quotient interface; ring specialization requires suppliers.
  relative-K2-boundary : TauCeti.RelativeBoundary.ofLift — Typed conditional group-quotient interface; ring specialization requires suppliers.
  relative-K2-boundary-hom : TauCeti.RelativeBoundary.mul — Typed conditional group-quotient interface; ring specialization requires suppliers.
  relative-K2-boundary-natural : TauCeti.RelativeBoundary.map — Typed conditional group-quotient interface; ring specialization requires suppliers.
  relative-K2-boundary-zero-on-image : TauCeti.RelativeBoundary.zero_on_image — Typed conditional group-quotient interface; ring specialization requires suppliers.
  relative-K2-boundary-image : TauCeti.RelativeBoundary.image_characterisation — Typed conditional group-quotient interface; ring specialization requires suppliers.
  relative-K2-boundary-kernel : TauCeti.RelativeBoundary.kernel_characterisation — Typed conditional group-quotient interface; ring specialization requires suppliers.
  relative-K2-boundary-plus : TauCeti.RelativeBoundary.plus — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  relative-K2-boundary-zero-split : TauCeti.RelativeBoundary.split — Typed conditional group-quotient interface; ring specialization requires suppliers.
  relative-components-comparison : TauCeti.RelativeComponents.idealK0Equiv — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  relative-components-boundary : TauCeti.RelativeComponents.boundary — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  double-congruence-isom : TauCeti.DoubleRelative.congruenceEquiv — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  double-relative-elementary-image : TauCeti.DoubleRelative.elementaryImage — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  double-relative-K1-isom : TauCeti.DoubleRelative.classicalEquiv — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  relative-double-fibre-degree-one : TauCeti.DoubleRelative.fibrePi1Equiv — Omitted signature: required ring/space carrier is absent at the pinned baseline.
  relative-comparison-of-sequences : TauCeti.RelativeComparison.lowDegreeDiagram — Omitted signature: required ring/space carrier is absent at the pinned baseline.
-/
