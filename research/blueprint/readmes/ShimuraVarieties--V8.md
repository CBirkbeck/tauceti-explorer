# The canonical algebraic tower and modular-curve comparison

This is the target-level blueprint for **ShimuraVarieties:V8** and
**ShimuraVarieties:V8.general**. The packet is complete as a planning pass:
both stages are **planned**, with four explicit gaps and the supplier contracts
listed below. Neither stage is closed and no declaration is claimed implemented.
The mathematical statements in this document are definitive; the suggested file
checks proposed carrier and signature forms against the pinned libraries.

## Objects and conventions

Let D=(G,X) be a pure Shimura datum, let E=E(D) be its reflex field with a chosen
embedding into C, and let K range over compact open subgroups of G(A_f).
An actual canonical model M_K is a finite-type normal separated E-scheme with
a specified comparison to the complex algebraic quotient of V3, satisfying
V4's special-pair reciprocity condition. This is an arithmetic condition on
constructed models. V5/V6 construct the models used in the abelian-type lane;
V7 constructs those used by the general suffix. Conditional functoriality
itself does not depend on V7.

The tower takes values in the native slice category of schemes over Spec E.
An inclusion K ⊂ L points from M_K to M_L. Right translation is
T_g:[x,a]_K ↦ [x,ag]_L, with g⁻¹Kg ⊂ L. Applying T_g and then T_h gives
T_gh. There is no action of all G(A_f) on a fixed finite-level model.
The Hecke correspondence has apex at J=K∩gKg⁻¹, first leg the forgetful
map, and second leg T_g followed by the forgetful map at g⁻¹Jg ⊂ K.
A normal level quotient uses the effective image of K/K′, with its kernel
computed on the actual quotient. Finiteness survives general levels;
étaleness is asserted only in the supplier's certified neat effective range.

For GL2 use the full H± datum, the homology-weight minus one convention of D5,
and K(N)=ker(GL2(Zhat)→GL2(Z/N)). The full ordered-basis Q-model for N≥3
has φ(N) geometric Weil-pairing components. Its pairing map lands in the
cyclotomic scheme Spec Q[z]/Φ_N(z). A primitive root ζ selects a fibre only
after base change to Q(ζ); that fibre has complex quotient Γ(N)\H.
The analytic reference basis determines one root ζ_ref; for ζ=ζ_ref^u change
the first reference generator by u. This normalization is required by MF 8.7.

The modular basis is a row. For u=[[a,b],[c,d]] in GL2(Zhat), reduction modulo
N acts by (P,Q)u=(aP+cQ,bP+dQ), and the pairing changes by det(u). Milne 6.3
sends η to [ah,aη], so precomposing η by u gives adelic right multiplication
by u with this convention. For nonintegral g use both isogeny legs; a reduction
modulo N is not available. The Γ1 comparison uses the stabilizer of the first
generator and requires N≥4. The Γ0 comparison is coarse for every N>0.
These are the PR81 ranges; its Layer 10 covers only prime N≥5 diamond quotients
by subgroups of (Z/N)×/{±1}. R13.4a/b supply full and composite compact levels.

## Proof route and ownership

The arithmetic descent proof begins with Deligne's special-reflex-field
lemma, not just special-point density. The regular semisimple Lie open carries
a finite étale incidence cover of cocharacters and maximal tori. Its fibres
over the reflex field are geometrically irreducible. A nonempty real open of
compact-mod-centre tori and Hilbert specialization with disjointness avoidance
give a special torus-reflex field disjoint from any prescribed finite extension.
The connected-centralizer argument is ReductiveGroups structure theory;
representability and Hilbert specialization are requested from their owners.

V4 reciprocity acts on the left of the adelic coordinate, so it commutes with
right translation. V4's dense Hecke orbit gives equality of conjugate complex
morphisms. Descent through one torus fixing subgroup first supplies a finite
algebraic field of definition. Disjointness with its normal closure then forces
E-descent. An arbitrary complex morphism is not assumed defined over a finite
algebraic extension. Applying the same argument to the fixed identity comparison
proves uniqueness; applying it to a datum morphism gives descent over the
specified reflex-field compositum. All coherence laws follow by faithful
complex base change. V8 assembles these maps using the existing functor and
ordered span types, rather than introducing a second category of schemes.

Under the RS-04 ownership boundary, **AdelicAlgebraicGroups:AA.5**
owns the underlying GL2 adelic double-quotient calculation. V8 adds the
arithmetic Q-isomorphism, determinant/Weil-pairing identification, component
fibres and correspondence comparisons. **ModularCurvesPartII:R12.1–R12.6**
owns uniformization and analytic/coefficient comparisons;
**R13.4a–R13.4b** owns general-level compactified modular curves and arithmetic
boundary compatibility. PR81's constructions are imported intact. The AA.5
principal-level statement must use integral determinant representatives, which
normalize K(N), or specify the conjugating isomorphisms. Verify this precise contract in the supplying declaration before using it.

For minimal compactification, first descend the independently constructed GL2
compact modular curve. Pink 12.10 reduces codimension-one boundary to GL2 and
auxiliary pure data; where a map to PGL2 does not lift, use the Gm-kernel fibre
product with GL2 and its finite quotient. The needed arithmetic partial
extension S⁺ is a recorded supplier gap. Full ShimuraCompactifications:C2
consumes V8, so using it here would create a cycle. On S⁺ the intrinsic top
logarithmic differential line ω[dlog] descends over E. V2/Pink 8.2 identifies
a sufficiently high power with the complex Baily–Borel projective embedding.
After the required section base change, the closure of S⁺ in the associated
projective space gives the arithmetic minimal model (Pink 12.12). Generic
uniqueness of an open model alone does not construct this compactification,
and AutomorphicBundles:B1 cannot supply its line bundle because it consumes V8.

In the abelian lane, the auxiliary quotient and fibre-product data must remain
in the class covered by V5/V6, or stronger actual auxiliary-model hypotheses
must be supplied. The general suffix uses V7 for all pure auxiliary data and
then applies the same V8 proofs. It exports the resulting finite-level/minimal
interface to C2.general and S0.general; it does not reconstruct toroidal or
perfectoid objects.

## Pinned baseline and suggested forms

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. The reviewed library audit marks
both scoped stages not built. The declaration index and source trees were
searched for Shimura data, canonical models, full-level modular curves and
related aliases; no concrete supplier carriers were found. The native scheme,
slice, functor, pullback, span and finite/proper/open-immersion declarations
listed in the packet were read at those pins. Their generic mathematics is
reused rather than planned again.

The suggested file contains the two categorical assembly signatures, all nine
API signatures, all eight tests as examples, and schematic named theorem forms.
It elaborates at the pin with only the expected admitted-declaration warnings.
Map projections use heterogeneous equality across propositional object
identifications. Missing datum, reciprocity, analytic and modular conditions
are explicitly omitted; the file introduces no proposition-valued stand-ins
and assumes no theorem conclusion as an input. These incomplete forms are not
universal theorems about arbitrary schemes. Restore every packet hypothesis
and actual supplier carrier before attempting their proofs. In particular the
minimal carrier form is only proper and open; it must be strengthened to the
normal projective model with its specified Baily–Borel comparison. The special
field form indexes the actual special reflex fields so it cannot merely choose
an arbitrary disjoint intermediate field. The full-level reciprocity form
exhibits its special-point action equation on genuine scheme point morphisms.

## Declaration plan

Each declaration below has its packet id, complete mathematical contract,
proof route, direct suppliers and acceptance checks. A displayed planet is a
named theorem or construction. Implementation status is unchecked throughout.

### ShimuraVarieties:V8

#### Disjoint special reflex fields

**ShimuraVarieties:V8/disjoint-special-reflex-fields** — theorem. Suggested declaration: `CanonicalModel.disjoint_special_reflex_fields`.

For every pure datum D and finite extension L/E(D) in C, there is a special torus subdatum (T,h) of D such that E(T,h)/E(D) is linearly disjoint from L/E(D). The torus-reflex field is used, not the residue field of an arbitrarily chosen level point.

Hypotheses:

- G is connected reductive over Q; actual special pairs and cocharacter reflex fields are those of D3/D4.
- L/E(D) is finite.
- The schematic Lean field form uses an index of actual special-torus reflex fields; the missing datum/special-pair predicate must be restored, so it cannot select an arbitrary disjoint intermediate field.

Proof/construction:

1. Use Deligne 5.1: over the regular-semisimple open V in Lie(G), the incidence variety W of maximal tori, cocharacters in the datum class, and regular Lie elements maps finite étale surjectively to V and to Spec E(D).
2. Connected centralizers and conjugacy of maximal tori give geometrically irreducible fibres over E(D). The nonempty real open U of tori compact modulo the centre supplies special homomorphisms in X.
3. Apply Hilbert irreducibility with a real-open condition and linear-disjointness avoidance to W after base change to L. Its specialized cocharacter field contains the reflex field of the resulting torus datum; subextensions retain linear disjointness.

Direct prerequisites: `ShimuraData:D4/shimura-datum`, `ShimuraData:D3/reflex-field`, `ShimuraData:D4/special-pair`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `InverseGaloisAndArithmeticFundamentalGroups:IG.2`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `mathlib:IntermediateField.LinearDisjoint`.

Source passages: milne-svi 13.4, p.118 — States the special-reflex-field lemma.; deligne-1971 5.1, 5.1.2, 5.1.3, pp.153–155 (page images checked) — Incidence cover, connected-fibre argument and real-open Hilbert specialization..

Acceptance:

- For GL2, take an imaginary quadratic field Q(sqrt(-p)) with p an odd prime unramified in L; ramification at p excludes its inclusion in L.
- Do not infer the field-disjointness theorem from mere density of special points.

#### Hecke translation over the reflex field

**ShimuraVarieties:V8/translation-descent** — theorem. Suggested declaration: `CanonicalModel.translation_defined_over_reflex`.

Planet: **Hecke translations over the reflex field**.

If g in G(A_f) and g^{-1}Kg is contained in L, the complex morphism T_g:[x,a]_K -> [x,ag]_L descends uniquely to an E-morphism M_K -> M_L. This is a conditional functoriality theorem for actual canonical models, with no general existence assumption.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- K,L are compact open and g^{-1}Kg is contained in L.

Proof/construction:

1. V1 gives the analytic map and V3 its algebraicity over C. For a special pair (T,h), V4 gives sigma[h,a]=[h,r_h(s)a] for sigma fixing E(T,h). Left multiplication r_h(s) commutes with right multiplication g.
2. V4 density of all Hecke translates of h identifies T_g with its sigma-conjugate as algebraic maps (source reduced, target separated).
3. First descend through Aut(C/E(T,h)) for one special pair: this gives a finite algebraic field of definition of T_g, rather than assuming every complex morphism has one. Apply disjoint-special-reflex-fields to its finite normal closure over E. Descent through the second fixing subgroup and linear disjointness force the map to be defined over E; faithful base change gives uniqueness.

Direct prerequisites: `ShimuraVarieties:V1`, `ShimuraVarieties:V3`, `ShimuraVarieties:V4`, `ShimuraVarieties:V8/disjoint-special-reflex-fields`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Source passages: milne-svi 13.6, pp.118–119 — Reciprocity, dense translates and disjoint reflex fields prove descent..

Acceptance:

- For g=1 and K contained in L this is the forgetful level map.
- For L=g^{-1}Kg this is an isomorphism, with inverse T_{g^{-1}}.
- The inclusion direction must be tested on a changed representative ak: k g=g(g^{-1}kg).

#### Uniqueness of canonical models

**ShimuraVarieties:V8/model-uniqueness** — theorem. Suggested declaration: `CanonicalModel.unique_iso`.

Two canonical E-models of the same finite-level Shimura variety have a unique E-isomorphism inducing their specified comparison over C. These isomorphisms commute with all descended level and translation maps.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.

Proof/construction:

1. Repeat translation-descent with g=1, K=L and the two distinct specified model comparisons; the same special-pair action makes the complex identity descend.
2. Descend its inverse and verify the inverse identities by faithful base change. Naturality follows by comparing after C-base change.

Direct prerequisites: `ShimuraVarieties:V8/translation-descent`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Source passages: milne-svi 13.7(a), p.119 — Uniqueness includes the fixed complex model identification..

Acceptance:

- An arbitrary automorphism of an E-scheme is not the specified unique comparison.

#### Canonical algebraic level tower

**ShimuraVarieties:V8/level-tower** — construction. Suggested declaration: `CanonicalTower.ofLevelMaps`.

Planet: **Canonical algebraic tower**.

For actual canonical models M_K, assemble the unique descended forgetful maps pi_{K,L} for K contained in L into the functor CanonicalTower.ofLevelMaps: Level(D) -> Over(Spec E). Level(D) and its inclusion arrows are supplied by V1/D5. Its values are the supplied models, not newly chosen arbitrary schemes. In the suggested file the index category and model family are parameters; the constructor is only the categorical assembly slice of this construction.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The categorical assembly signature takes the already proved identity and composition laws for the descended transitions. These laws are obtained here by uniqueness, rather than assumed in the mathematical descent theorem.

Proof/construction:

1. Apply translation-descent at g=1 to every inclusion.
2. The identity and composition equations hold over C by V1 and descend by uniqueness. Package these maps with the existing Functor constructor; retain the actual structure morphism in Over(Spec E).
3. After any extension E -> F, use Over.pullback to base change the entire functor; identity and successive base changes use the native natural isomorphisms.

Direct prerequisites: `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V1`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.Over`, `mathlib:CategoryTheory.Over.pullback`, `mathlib:CategoryTheory.Over.pullbackId`, `mathlib:CategoryTheory.Over.pullbackComp`, `mathlib:AlgebraicGeometry.Scheme`.

Source passages: milne-svi 5.29(a), p.65; 12.10, p.116; 13.7(b), p.119 — Assemble the algebraic models with their actual maps. Neither an infinite-level scheme nor its point formula is required..

Uses:

- PerfectoidShimuraVarieties:S0, S2, S4: Supplies finite-level schemes and compatible maps before any inverse-limit or perfectoid construction.
- Milne 12.10 and ShimuraVarieties:V8.general: The canonical-model tower is a single functor; general existence supplies its values.
- ShimuraCompactifications:C2 and AutomorphicBundles:B1: Supplies arithmetic transition morphisms and common-base diagrams.

Planning API:

| Declaration | Contract |
| --- | --- |
| `CanonicalTower.ofLevelMaps_obj` | At i the constructor has value M(i), with its given map to the base. |
| `CanonicalTower.ofLevelMaps_map` | On an arrow f:i -> j the constructor evaluates to the supplied descended transition t(f). In the suggested file this is heterogeneous equality because the constructed object projections are propositional equalities. |
| `CanonicalTower.ofLevelMaps_id` | The map of the identity arrow at i is the identity of M(i). |
| `CanonicalTower.ofLevelMaps_comp` | The map of f followed by g is t(f) followed by t(g). |
| `CanonicalTower.ofLevelMaps_baseChange` | Postcomposing with Over.pullback(b) sends a transition f to the pullback of t(f), on the pulled-back models. This uses native base change rather than a second scheme carrier. |

Unit tests:

- `CanonicalTower.test_identity_level` (degenerate): At any level K, t(id_K) is the identity of M_K.
- `CanonicalTower.test_nested_levels` (compatibility): For K1 contained in K2 contained in K3, the constructor map of the composite inclusion equals pi_{K1,K2} followed by pi_{K2,K3}.
- `CanonicalTower.test_preserves_supplied_arrow` (characterisation): For a supplied arrow f and a morphism u distinct from t(f), the constructor map of f is not u; replacing transitions by zero or arbitrary maps fails this test.
- `CanonicalTower.test_base_change` (compatibility): The base-changed constructor map on f is exactly Over.pullback(b).map(t(f)).

Acceptance:

- All levels retain their given structure morphisms to Spec E.
- A composite of three inclusions gives the same map for either parenthesization.

#### Right translation laws on the algebraic tower

**ShimuraVarieties:V8/translation-laws** — theorem. Suggested declaration: `CanonicalTower.translation_comp`.

The descended T_g obey T_1=id at equal levels and T_h composed after T_g equals T_{gh}, whenever g^{-1}Kg is contained in L and h^{-1}Lh is contained in P. For k in K the equal-level T_k is the identity. For a fixed g the conjugate-level isomorphisms form a natural transformation from the tower to the conjugated-index tower.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.

Proof/construction:

1. V1 proves these identities on the double quotient.
2. Compare the descended E-morphisms after faithful C-base change; use uniqueness. The product is gh in this right-action convention.

Direct prerequisites: `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/level-tower`, `ShimuraVarieties:V1`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Source passages: milne-svi 5.29(b), pp.65–66 — Source/target levels and coherent right translations..

Acceptance:

- For g,h represented by noncommuting GL2 matrices, check gh rather than hg.
- No action of all G(A_f) on one finite-level scheme is asserted.

#### Finite level maps and effective deck groups

**ShimuraVarieties:V8/finite-level-maps** — theorem. Suggested declaration: `CanonicalTower.level_map_finite`.

For K1 contained in K2, pi_{K1,K2} is finite and surjective over E; at neat effective levels it is finite étale. If K1 is normal in K2, the finite quotient is by the effective image of K2/K1 in automorphisms of M_{K1}; its kernel consists of elements acting trivially on the actual quotient. Deck groups and degree use this effective quotient, not K2/K1 without a kernel calculation.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.

Proof/construction:

1. V1 supplies finite analytic coverings and the effective stabilizer calculation. V3 supplies finite algebraic maps and finite quotients at non-neat levels.
2. Finiteness, surjectivity and étaleness in the certified neat range descend along C/E. Apply the finite quotient universal property to the descended effective action.

Direct prerequisites: `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/translation-laws`, `ShimuraVarieties:V1`, `ShimuraVarieties:V3`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `ShimuraData:D5/neat-level`, `mathlib:AlgebraicGeometry.IsFinite`.

Source passages: milne-svi 5.29(a), p.65 — Finite quotient statement, with the effective-kernel qualification inherited from V1..

Acceptance:

- For torus data the dimension is zero; level morphisms are finite étale.
- Non-neat levels retain elliptic stabilizer ramification, so étaleness is not exported there.

#### Algebraic Hecke correspondence

**ShimuraVarieties:V8/hecke-span** — construction. Suggested declaration: `CanonicalHecke.span`.

Planet: **Algebraic Hecke correspondences**.

For D, actual canonical models and g in G(A_f), put J=K intersect gKg^{-1}. Construct CanonicalHecke.span as the native WalkingSpan diagram in Over(Spec E), with apex M_J, first leg pi_{J,K}, and second leg T_g:M_J -> M_{g^{-1}Jg} followed by pi_{g^{-1}Jg,K}. Both legs are finite. The suggested constructor receives these already descended legs and uses native span; supplying these arrows alone does not prove canonical descent.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- g is a finite-adelic element and K is compact open.

Proof/construction:

1. D5/V1 supply J, conjugate levels and both inclusion witnesses.
2. Apply translation-descent and finite-level-maps to obtain the two E-morphisms.
3. Use CategoryTheory.Limits.span, preserving the order of the two legs. The complex comparison is the V1 correspondence; applying native spanCompIso to Over.pullback supplies its base-change isomorphism.

Direct prerequisites: `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V1`, `mathlib:CategoryTheory.Limits.span`, `mathlib:CategoryTheory.Limits.spanCompIso`, `mathlib:CategoryTheory.Over.pullback`.

Source passages: milne-svi 5.29, pp.65–66; 13.6, p.118 — Arithmetic descent of the two legs of the V1 Hecke correspondence..

Uses:

- Milne 13.6 and ShimuraCompactifications:C3: Uses the two separately descended finite morphisms; compactification extends the same ordered span.
- ModularCurvesPartII:R12.5 and HeegnerPointEulerSystems: Compares finite correspondences with moduli isogenies before applying pull-push to coefficients.

Planning API:

| Declaration | Contract |
| --- | --- |
| `CanonicalHecke.span_apex` | The value at WalkingSpan.zero is the supplied apex M_J. |
| `CanonicalHecke.span_first` | The image of WalkingSpan.Hom.fst is exactly pi_{J,K}. The suggested signature uses heterogeneous equality across the object projection equalities. |
| `CanonicalHecke.span_second` | The image of WalkingSpan.Hom.snd is exactly T_g followed by pi_{g^{-1}Jg,K}. The suggested signature uses heterogeneous equality across the object projection equalities. |
| `CanonicalHecke.span_baseChange` | Postcomposing the span with Over.pullback(b) is naturally isomorphic to native span on the two pulled-back legs, by spanCompIso. |

Unit tests:

- `CanonicalHecke.test_identity` (degenerate): For equal apex and endpoints and both supplied legs the identity (the g=1 case), both WalkingSpan arrows evaluate to the identity.
- `CanonicalHecke.test_native_span` (compatibility): The constructed ordered diagram equals CategoryTheory.Limits.span(p1,p2) on the supplied legs.
- `CanonicalHecke.test_distinct_legs` (non-example): For two endomorphisms p1,p2 of a supplied apex with p1 distinct from p2, the first-leg evaluation is not p2. A construction that swaps the two legs fails this test.
- `CanonicalHecke.test_base_change` (compatibility): After Over.pullback(b), evaluation at the first WalkingSpan arrow is Over.pullback(b).map(p1).

Acceptance:

- J is K intersect gKg^{-1}, not K intersect g^{-1}Kg.
- For g=1, J=K and both legs are the identity.

#### Functoriality of canonical models in the datum

**ShimuraVarieties:V8/datum-functoriality** — theorem. Suggested declaration: `CanonicalModel.datum_map_defined_over_compositum`.

Planet: **Functoriality of canonical models**.

For a datum morphism f:D -> Dprime, compact open K,Kprime with f(K) contained in Kprime, and actual canonical models on both sides, the complex map [x,a] -> [f(x),f(a)] descends uniquely over the compositum E(D)E(Dprime) in C. It commutes with admissible level maps and right translations, identity datum maps and compositions after the necessary common-base changes.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- Both data and their reflex fields are specified; the target also has actual canonical models.

Proof/construction:

1. V3 gives the complex algebraic map; D4 sends special pairs to special pairs.
2. Functoriality of V4 reflex norms makes the map Galois equivariant on the dense Hecke orbit of each source special pair. Apply the disjoint-field argument after forming the common compositum.
3. Descend by A; identities, compositions and Hecke compatibility follow from their complex formulas and faithful base change.

Direct prerequisites: `ShimuraData:D4/datum-morphism`, `ShimuraData:D4/special-image`, `ShimuraVarieties:V8/disjoint-special-reflex-fields`, `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V3`, `ShimuraVarieties:V4`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Source passages: milne-svi 13.8, p.119 — Base field is the compositum, not an unjustified smaller field.; deligne-1971 5.4, pp.155–156 — Special-pair proof of datum functoriality..

Acceptance:

- The identity datum map gives the identity scheme morphism.
- The determinant GL2 -> Gm is defined over Q, and must agree with the separately constructed torus canonical model.

#### Abelian-type tower from V6

**ShimuraVarieties:V8/abelian-instance** — application. Suggested declaration: `CanonicalTower.abelian_type`.

Applying the preceding canonical-model functoriality theorems to the models constructed by V6 produces the finite-level abelian-type tower, translations, finite maps, Hecke spans and datum functoriality. No premise imports V7 or V8.general.

Hypotheses:

- D is of abelian type in D4; V6 supplies actual models satisfying V4.

Proof/construction:

1. Supply the V6 construction to translation-descent and level-tower.
2. Use model-uniqueness to identify choices of Hodge-type covers and component descent.
3. Use the same finite-level and datum-morphism statements; do not identify entire varieties merely because derived groups are isogenous.

Direct prerequisites: `ShimuraVarieties:V6`, `ShimuraVarieties:V8/level-tower`, `ShimuraVarieties:V8/model-uniqueness`, `ShimuraVarieties:V8/hecke-span`, `ShimuraVarieties:V8/datum-functoriality`.

Source passages: milne-svi 14.15–14.16, pp.127–128; 13.7, p.119 — Specialize the conditional V8 results to V6, rather than replaying the V6 existence proof..

Acceptance:

- GL2 is the genus-one GSp case, supplied through V5/V6.
- There is no dependency path from this node to V7.

#### Canonical reciprocity for full elliptic level

**ShimuraVarieties:V8/gl2-moduli-reciprocity** — theorem. Suggested declaration: `GL2Modular.full_level_is_canonical`.

For N>=3, the Q-scheme Y_full(N)_Q representing elliptic curves with an ordered full N-basis, with the complex identification supplied by R12.1/R12.2 and M3, satisfies the actual GL2 special-pair canonical-model condition of V4. The Galois action includes the Weil pairing and acts on the entire full-level model, not only a chosen cyclotomic fibre.

Hypotheses:

- N>=3; GL2 datum is the standard homology-weight minus one datum of D5.
- The fine generic-fibre full-level moduli scheme and analytic comparison are the suppliers' actual constructions.

Proof/construction:

1. Identify GL2=GSp2 and an elliptic curve with its canonical principal polarization. M3/R12.1 compare homology, Tate modules and the ordered level basis with the V3 complex variety.
2. V5 supplies normalized CM reciprocity on the elliptic special pairs and their Tate levels; M4 verifies that the constructed genus-one moduli model has that Galois action.
3. Apply V4 Artin-convention conversion, including the field of definition of each special point. A geometric-point bijection alone is insufficient to identify the Q-scheme.

Direct prerequisites: `ShimuraData:D5/gl2-datum`, `ShimuraData:D3/reflex-field`, `ShimuraVarieties:V4`, `ShimuraVarieties:V5`, `PELModuli:M3`, `PELModuli:M4`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.2`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.

Source passages: milne-svi 6.3, pp.70–71; 6.11, p.73; 14.12, pp.125–126 — The symplectic/abelian moduli description and normalized CM action certify the genus-one canonical condition..

Acceptance:

- Use the actual special torus for an elliptic CM curve and compare its normalized Artin action on the ordered basis.
- Full level two is excluded: the residual minus-one automorphism preserves all two-torsion.

#### Full-level modular curve comparison over Q

**ShimuraVarieties:V8/gl2-full-level** — theorem. Suggested declaration: `GL2Modular.full_level_iso`.

Planet: **Full-level modular curve comparison**.

For N>=3, there is a unique Q-isomorphism Sh_{K(N)}(GL2,H±) -> Y_full(N)_Q inducing the supplied complex uniformization. Here K(N)=ker(GL2(Zhat)->GL2(Z/N)). The source is the actual V5/V6 canonical model and the target is the PR81 fine full ordered-basis scheme.

Hypotheses:

- N>=3; full H± datum and principal adelic level; no chosen primitive root is incorporated into the Q-scheme.

Proof/construction:

1. Use gl2-moduli-reciprocity and model-uniqueness to descend the complex moduli identification to a Q-isomorphism.
2. Use the existing AA.5 principal-level component calculation and R12.2 comparison to identify its complex effect with the double-quotient formula.
3. Verify compatibility with the universal elliptic family/level interpretation through M3.

Direct prerequisites: `ShimuraVarieties:V8/gl2-moduli-reciprocity`, `ShimuraVarieties:V8/model-uniqueness`, `ShimuraVarieties:V8/abelian-instance`, `AdelicAlgebraicGroups:AA.5/gl2-principal-level`, `ModularCurvesPartII:R12.2`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.

Source passages: milne-svi 6.3, pp.70–71; 6.11, p.73; 13.7(a), p.119 — The moduli description followed by canonical-model uniqueness gives a scheme isomorphism over Q.; pink 10.9, p.175; 12.9, p.200 (author-typeset version) — Genus-one full-level model is the arithmetic base case..

Acceptance:

- At N=3 the full curve has two geometric pairing components; it is not identified with a single Gamma(3) quotient.
- At N=4 there are phi(4)=2 pairing components; composite levels are covered without Layer 10.

#### Determinant is the Weil-pairing morphism

**ShimuraVarieties:V8/gl2-determinant-pairing** — comparison. Suggested declaration: `GL2Modular.det_eq_weil_pairing`.

Under full_level_iso, the canonical morphism induced by det:GL2->Gm and the induced zero-dimensional torus datum is identified over Q with (E,P,Q)->e_N(P,Q) in mu_N^prim. The torus level is det K(N)=ker(Zhat^×->(Z/N)^×); its canonical Q-model is identified with Spec Q[z]/Phi_N(z), not the constant disjoint union of phi(N) Q-points.

Hypotheses:

- N>=3; choose the analytic reference basis so its pairing is a specified reference primitive root; use the V4 normalization.

Proof/construction:

1. V4 supplies the torus model and its cyclotomic reciprocity action. AA.5 supplies the determinant-indexed GL2 components.
2. For level map eta, Milne 6.3 sends the moduli object to [ah,a eta]; the determinant component records the multiplier of the alternating pairing. R12.1/R12.2 prove that multiplier is the exponent in e_N(P,Q).
3. Use datum-functoriality and the CM/Galois pairing compatibility of gl2-moduli-reciprocity; equality after complex comparison descends.

Direct prerequisites: `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V4`, `AdelicAlgebraicGroups:AA.5/gl2-principal-level`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.2`, `PELModuli:M5`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Source passages: milne-svi 13, connected-component formula (64), p.119; 14, Siegel proof, p.125 — Determinant-component Galois action.; milne-mf 8.7, p.100 (root normalization corrected) — The fixed-pairing condition; the chosen analytic reference root must be calibrated..

Acceptance:

- For N=3 the primitive-root model is Spec Q[z]/(z^2+z+1), geometrically two points with nontrivial conjugation.
- A determinant-one basis change preserves the pairing; a determinant-u change raises it to the u-th power.

#### Fixed-pairing fibre over a primitive root

**ShimuraVarieties:V8/gl2-fixed-pairing-fibre** — comparison. Suggested declaration: `GL2Modular.fixed_pairing_fibre_iso`.

For N>=3 and a primitive Nth root zeta in C, base change full_level_iso to Q(zeta) and take the scheme-theoretic fibre of its determinant/Weil-pairing map at zeta. This is an isomorphism to Y(N,zeta) over Q(zeta). Its complex analytification is Gamma(N)\H, and the fibre is geometrically connected and geometrically irreducible using the open comparison R12.4.

Hypotheses:

- The fibre is formed after cyclotomic base change; its scalar extension to C uses the chosen embedding Q(zeta)->C.

Proof/construction:

1. Use gl2-determinant-pairing and the functoriality of fibre products to restrict full_level_iso.
2. Apply R12.1/R12.2 fixed-pairing uniformization with the calibrated basis: if zeta=zeta_ref^u, replace the first standard torsion generator by u times it.
3. Import R12.4 open connectedness and smooth-curve irreducibility. This has no compactification prerequisite.

Direct prerequisites: `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.4`, `ComplexComparisonPartII:C0/repair-analytification`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `mathlib:CategoryTheory.Over.pullback`.

Source passages: milne-mf 8.7–8.8, p.100 — Fixed-pairing complex uniformization and cyclotomic model, with the normalization issue recorded.; milne-svi 5.17, pp.59–61; connected components in section 13, p.119 — The determinant separates full-level components..

Acceptance:

- Y_full(3)_C has two components whereas Y(3,zeta)_C has one.
- Taking a fibre over Q without adjoining zeta is not a fibre at a Q-rational primitive root for N>2.

#### Row-basis and adelic right actions

**ShimuraVarieties:V8/gl2-row-basis-dictionary** — comparison. Suggested declaration: `GL2Modular.row_basis_right_translation`.

For N>=3 and u in GL2(Zhat) with reduction [[a,b],[c,d]], right translation [x,A]->[x,A u] corresponds under full_level_iso to (P,Q)->(aP+cQ,bP+dQ). The Weil pairing changes by exponent det(u mod N), so this map sends Y(N,zeta) to Y(N,zeta^{det u}). General finite-adelic g is compared through the two isogeny legs at the intersection level, not by pretending g has an integral reduction.

Hypotheses:

- The source K(N) is normalized by GL2(Zhat); full-level bases use the PR81 row convention.

Proof/construction:

1. Write the level as eta:V(A_f)->V_f(E). Milne 6.3 identifies it with [ah,a eta]. Replacing eta by eta composed with u changes a eta to (a eta)u.
2. Evaluate precomposition on the two standard column generators: columns of u give aP+cQ and bP+dQ. Thus the ordered basis is a row with right multiplication.
3. Use PR81 Weil-pairing bilinearity for the determinant exponent. For nonintegral g use R12.5 isogeny/Hecke comparison and the actual intersection-level span.

Direct prerequisites: `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/translation-laws`, `ShimuraVarieties:V8/hecke-span`, `ModularCurvesPartII:R12.5`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.

Source passages: milne-svi 6.3, pp.70–71 — The literal level-map orientation fixes the right-action convention; use the corrected arrow directions in the proof.; pr81 Conventions, item 5: Full level and actions — The native row-basis convention to which the canonical model is compared..

Acceptance:

- For u=[[1,1],[0,1]] the basis goes to (P,P+Q), not (P+Q,Q).
- For u=[[0,1],[-1,0]] the basis goes to (-Q,P); determinant is one and pairing stays fixed.
- For diag(v,1), pairing is raised to v and the component changes unless v=1 mod N.

#### Gamma-one modular curve comparison

**ShimuraVarieties:V8/gl2-gamma1** — comparison. Suggested declaration: `GL2Modular.gamma1_iso`.

For N>=4, the canonical Q-scheme at K1(N)={u in GL2(Zhat):u e1=e1 mod N} is Q-isomorphic to the fine curve Y1(N)_Q representing (E,P) with P of exact order N. The comparison is induced by the full-level forgetful map and preserves its specified point and its complex Gamma1(N) uniformization.

Hypotheses:

- N>=4; K1 fixes e1 (first column), so the row convention retains P.

Proof/construction:

1. Choose a full principal level M divisible by N with M>=3 and pass to the finite quotient of its level problem by the stabilizer of the chosen N-point.
2. Use finite-level-maps and the PR81/R12.2 fine quotient comparison to descend full_level_iso. Exact moduli representability at N>=4 eliminates automorphisms.
3. Use R12.5/R12.6 to match forgetful and diamond morphisms over Q.

Direct prerequisites: `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8/gl2-row-basis-dictionary`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R12.6`, `tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

Source passages: pr81 Layer 5A: Tate normal form and Y1(N) for N>=4 — Imports the actual fine-moduli qualification rather than extending it to levels two or three.; milne-svi 5.29 and 13.7, pp.65,119 — Canonical finite-level quotient and uniqueness..

Acceptance:

- At N=4 a point of exact order four excludes the residual minus-one automorphism.
- At N=1,2 the comparison cannot be labelled a fine universal elliptic scheme.

#### Gamma-zero coarse modular curve comparison

**ShimuraVarieties:V8/gl2-gamma0** — comparison. Suggested declaration: `GL2Modular.gamma0_coarse_iso`.

For N>0, the canonical Q-scheme at K0(N)={u in GL2(Zhat):u preserves the line (Z/N)e1} is Q-isomorphic to the coarse curve Y0(N)_Q for elliptic curves with a cyclic order-N subgroup. At N=1 this is the j-line. The assertion is an isomorphism of coarse schemes, not fine representability or a bijection with rational isomorphism classes over every field.

Hypotheses:

- Characteristic zero generic fibre; N positive. The cyclic-subgroup problem and its coarse space are the actual PR81 constructions.

Proof/construction:

1. Choose full M-level with N dividing M and M>=3; use the subgroup stabilizer and its finite coarse quotient.
2. Compare this quotient with the canonical finite-level quotient from finite-level-maps, via gl2-full-level and the first-column convention.
3. Use PR81 9E and R12.2/R12.6 to identify the coarse scheme and its analytic quotient.

Direct prerequisites: `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8/gl2-row-basis-dictionary`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.6`, `tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

Source passages: milne-mf 8.6, p.100 — Coarse characteristic-zero comparison; universal-family claims are deliberately excluded.; pr81 Layer 9E: the coarse j-line and Y0(N) — The supplier of the coarse scheme, retaining elliptic stabilizers..

Acceptance:

- For N=1 the j-line has elliptic objects with automorphisms; it is not a fine scheme with a universal elliptic curve.
- For N=6 use the general coarse construction, not the prime diamond-quotient theorem of Layer 10.

#### Minimal compactification of the full modular curve

**ShimuraVarieties:V8/gl2-compact-model** — comparison. Suggested declaration: `GL2Modular.minimal_compact_iso`.

For N>=3 the independently constructed proper normal coarse compact curve X_full(N)_Q from R13.4a, with its specified open Y_full(N)_Q, is the E=Q-model of the complex Baily–Borel minimal compactification for the GL2 principal-level datum, via the open isomorphism full_level_iso. This is the genus-one arithmetic compactification base case, constructed without assuming the general minimal-descent theorem.

Hypotheses:

- N>=3; use R13.4a construction for full/composite levels; for prime N>=5 and H <= (Z/N)^×/{±1}, the Layer-10 coarse X_H has its separate certified comparison.

Proof/construction:

1. R13.4a constructs the proper normal coarse compactification from generalized elliptic curves; R12.3 identifies its C-model with the independently constructed analytic modular compactification.
2. Use the full-level open comparison to specify the complex Baily–Borel identification and hence an actual Q-model containing the canonical open.
3. Normal proper-curve extension gives uniqueness. R13.4b certifies the generic-fibre component and cusp bookkeeping; it is not the source of R12.4 open connectedness.

Direct prerequisites: `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V2`, `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`, `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`.

Source passages: pink 12.9, p.200 — Uses the independent generalized-elliptic compact model to descend GL2 before the general compactification proof.; pink 10.20–10.21, pp.183–184 — The complex compact comparison and cusp formal model..

Acceptance:

- The level N=6 full compact model is supplied by R13.4a; prime-only Layer 10 cannot provide it.
- Boundary is the scheme-theoretic complement, not a hand-selected set of complex cusp points.

#### Reflex-field descent of the minimal compactification

**ShimuraVarieties:V8/minimal-descent** — theorem. Suggested declaration: `CanonicalModel.minimal_defined_over_reflex`.

Planet: **Canonical minimal compactification**.

For a pure datum D with actual canonical open models, its normal projective complex Baily–Borel compactification M_K,C^min has a unique projective normal E(D)-model containing M_K and inducing the specified complex compactification. The theorem is for the same datum class as the supplied open models. Its construction must exhibit effective descent, not infer it solely from uniqueness of an open model.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The arithmetic codimension-one partial compactification and intrinsic logarithmic-line inputs specified in the recorded gap are supplied; preserving the abelian-type class for auxiliary data is required in that lane.

Proof/construction:

1. At neat level, V2 supplies S_C^+: the open plus codimension-one boundary strata, smooth with smooth boundary divisor and complement of codimension at least two in S_C^min.
2. Use Pink 12.10: codimension-one rational boundary components come from surjections to PGL2. A lift to GL2 reduces to an auxiliary pure factor times the independently descended GL2 compact model; otherwise pass to Gtilde=G ×_{PGL2} GL2 and take the Gm-kernel finite quotient. The arithmetic extension S^+ is the recorded supplier gap, not the full C2 toroidal theorem.
3. On S^+ the top log-differential line omega[dlog] is intrinsic and defined over E. V2/Pink 8.2 gives sufficiently large n with global generation and a closed embedding of the complex minimal model. Descend sections and use closure of S^+ in the associated projective space, as Pink 12.12.
4. Apply effective descent, base change for sections, schematic closure and normality descent. Remove neatness by the V3 finite quotient machinery and finite-level-maps. Use projective dense-open extension uniqueness to identify choices.

Direct prerequisites: `ShimuraVarieties:V2`, `ShimuraVarieties:V3`, `ShimuraVarieties:V8/model-uniqueness`, `ShimuraVarieties:V8/gl2-compact-model`, `ShimuraVarieties:V8/finite-level-maps`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `ShimuraCompactifications:C1`, `ShimuraCompactifications:C0/relative-torus-embedding`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsOpenImmersion`.

Source passages: pink 12.3(a), p.197; 12.7, p.199; 12.10, pp.200–201; 12.12, p.202 — The codimension-one extension and intrinsic logarithmic line make arithmetic descent effective.; pink 8.2, pp.132–133 — The relevant ample line is the top logarithmic differential, built from complex BB geometry, not B1 canonical automorphic bundles..

Acceptance:

- When no codimension-one boundary occurs, S^+=S; the proof must still establish the log/canonical-line BB embedding and base-change of sections.
- For GL2 the construction agrees with gl2-compact-model.
- No prerequisite on AutomorphicBundles:B1 or full ShimuraCompactifications:C2 is allowed.

#### Functoriality on minimal compactifications

**ShimuraVarieties:V8/minimal-map-extension** — theorem. Suggested declaration: `CanonicalModel.minimal_map_extension`.

Every descended translation T_g and every admissible datum morphism has a unique extension between the corresponding minimal models over the same reflex field or specified compositum. The extensions preserve identity and composition and agree with complex Baily–Borel functoriality. In particular level maps and both Hecke legs extend. Extended level maps are finite where the complex finite-quotient theorem proves finiteness; no general étaleness across the boundary is asserted.

Hypotheses:

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The complex extension theorem is supplied by V2/V3 with its applicable level/datum hypotheses.

Proof/construction:

1. Use minimal-descent for the source and target and V2/V3 for the complex extension.
2. On the schematically dense open, descent agrees with the known arithmetic map. Separatedness and reducedness give equality of conjugates on the whole source.
3. Apply descent of morphisms and faithful base change; finite level extensions inherit finiteness by descent. The same argument proves coherence of compositions.

Direct prerequisites: `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/translation-laws`, `ShimuraVarieties:V8/hecke-span`, `ShimuraVarieties:V2`, `ShimuraVarieties:V3`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Source passages: pink 12.3(b), p.197; 12.6, p.198 — Functoriality follows only after the arithmetic compactification objects have been constructed..

Acceptance:

- A level map may ramify at cusps even when its restriction to neat opens is étale.
- Restricting an extended correspondence to the open recovers the same ordered Hecke span.

#### Modular cusp loci and Tate parameters

**ShimuraVarieties:V8/gl2-cusps-tate** — comparison. Suggested declaration: `GL2Modular.cusp_tate_comparison`.

The GL2 minimal/modular compact comparison identifies the cusp subschemes, their residue fields and their formal neighborhoods with the generalized-elliptic/Tate charts of R12.3/R12.6/R13.4b. At a chosen complex cusp of width w, the local analytic coordinate is q_c=exp(2 pi i z/w), with q=exp(2 pi i z)=q_c^w after a chosen cusp representative. Over the supplier's cusp residue field, the completed local ring of the normal curve is k(c)[[q_c]], using its chosen Tate parameter; changes of cusp representative introduce the specified roots of unity.

Hypotheses:

- N>=3 for full fine open level; other levels use their stated coarse curve and cusp stabilizers. Choose a cusp label, uniformizer and field embedding; no universal Q-rationality assertion.

Proof/construction:

1. Compare the scheme boundary by extension of the open isomorphism and R13.4b boundary identification.
2. Import R12.3 width/parameter computation and R12.6 cusp Galois fields, then match them with R13.4b formal Tate charts.
3. Use R12.1 normalization to identify the analytic exponential with the chosen Tate parameter, including roots of unity under changed representatives.

Direct prerequisites: `ShimuraVarieties:V8/gl2-compact-model`, `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R12.6`, `ModularCurvesPartII:R13.4b`, `ComplexComparisonPartII:C0/repair-analytification`.

Source passages: pink 10.21–10.22, pp.184–185; 12.9, p.200 — The formal cusp comparison is an arithmetic deformation/Tate statement, not just an equality of complex points..

Acceptance:

- At the infinity cusp of full principal level N, width is N and q=q_c^N.
- A different cusp label can have a nontrivial residue-field action; replacing the cusp scheme by a constant Q-set loses this information.

#### Compatibility of modular and canonical correspondences

**ShimuraVarieties:V8/gl2-tower-compatibility** — comparison. Suggested declaration: `GL2Modular.tower_compatibility`.

The Q-isomorphisms for full, Gamma1 and Gamma0 levels commute with all admissible level maps and the ordered Hecke isogeny correspondences, with the Weil-pairing component transport dictated by row_basis_right_translation. Their compact extensions commute with the extended finite legs and the cusp/Tate charts. On coefficient sheaves, differential pullback and pull-push normalizations are precisely those of R12.5.

Hypotheses:

- Only the stated fine/coarse ranges and supplier's actual Hecke isogeny moduli are used; integral bad-prime models are not inferred.

Proof/construction:

1. R12.5/R12.6 supply the analytic/level/isogeny identities; compare each leg using gl2-full-level, row-basis-dictionary and canonical functoriality.
2. Faithful C-base change gives equality over Q. Apply minimal-map-extension and uniqueness of dense-open extension for the compact diagram.
3. Identify cusp formal maps using gl2-cusps-tate and R13.4b. Import the supplier normalization for differentials rather than redefining the Hecke operator.

Direct prerequisites: `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`, `ShimuraVarieties:V8/gl2-row-basis-dictionary`, `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`, `ShimuraVarieties:V8/hecke-span`, `ShimuraVarieties:V8/minimal-map-extension`, `ShimuraVarieties:V8/gl2-cusps-tate`, `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R12.6`, `ModularCurvesPartII:R13.4b`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Source passages: milne-svi 5.29, pp.65–66; 6.3, pp.70–71; 13.6–13.8, pp.118–119 — Arithmetic comparisons intertwine the actual finite-level maps.; pink 12.3(b), p.197 — The same compatibility persists on minimal compact models..

Acceptance:

- For an integral unipotent at principal level the first generator stays P and the second becomes P+Q.
- For a nonintegral adelic prime isogeny, compare both legs rather than a putative automorphism of Y_full(N).
- For prime N>=5 diamonds with H <= (Z/N)^×/{±1}, verify the Layer-10 quotient range; use R13.4a for full/composite compact levels.

### ShimuraVarieties:V8.general

#### General-data canonical tower

**ShimuraVarieties:V8.general/general-tower** — theorem. Suggested declaration: `CanonicalTower.general_data`.

Planet: **General-data canonical tower**.

For every pure Shimura datum D and every compact open K, supply the actual canonical models constructed by V7 to V8's conditional functoriality theorems. Obtain the same canonical E(D)-tower, right translations, finite level maps, effective quotients and ordered Hecke correspondences, independent up to the unique comparison of V8 of V7's auxiliary extension and special point. Datum maps are over the specified reflex-field composita.

Hypotheses:

- V7 has proved conjugation, cocycle, continuity and effective descent and has verified V4 on the resulting models. No placeholder existence witness is substituted.

Proof/construction:

1. Apply the V8 translation, tower and datum-map declarations to V7's actual schemes and comparisons.
2. Apply model-uniqueness to compare auxiliary choices; use its compatibility with maps to obtain the tower identification.
3. Use finite-level-maps and hecke-span with the effective stabilizers from V1. No second proof of canonical functoriality is introduced.

Direct prerequisites: `ShimuraVarieties:V7`, `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/level-tower`, `ShimuraVarieties:V8/model-uniqueness`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8/hecke-span`, `ShimuraVarieties:V8/datum-functoriality`.

Source passages: milne-svi 12.10, p.116; 13.6–13.8, pp.118–119 — V8 applies to actual models independently of the argument establishing existence..

Acceptance:

- The abelian-instance node has no dependency on this node.
- Choosing a non-abelian-type datum cannot be justified by relabelling a V6 model.

#### General-data minimal compactification interface

**ShimuraVarieties:V8.general/general-minimal** — application. Suggested declaration: `CanonicalModel.general_minimal`.

Apply minimal_defined_over_reflex and minimal_map_extension to the V7 models and the corresponding actual auxiliary pure models needed in the codimension-one proof. This gives normal projective minimal compactifications and their functorial maps over reflex fields for all pure data; their open restriction is the general-data tower. Export these objects to C2.general and S0.general with the same unresolved codimension-one supplier leaf exposed.

Hypotheses:

- V7 supplies all pure auxiliary models in Pink 12.10 as well as the original datum; the codimension-one extension/section-base-change gaps recorded in V8 must be discharged.

Proof/construction:

1. Instantiate minimal-descent with the V7 schemes and all auxiliary pure data; apply the existing argument, with no separate general compactification proof.
2. Instantiate minimal-map-extension and identify restrictions by general-tower and model-uniqueness.
3. Supply only this arithmetic minimal/open interface to downstream C2.general and S0.general; toroidal existence and perfectoid limits remain their own targets.

Direct prerequisites: `ShimuraVarieties:V7`, `ShimuraVarieties:V8.general/general-tower`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/minimal-map-extension`.

Source passages: pink 12.3(a)–(b), p.197; 12.10–12.12, pp.200–202 — Same compactification construction specialized to the class supplied by general existence..

Acceptance:

- The same construction agrees with the abelian lane via model-uniqueness.
- No dependency imports the consuming C2.general toroidal model.

## Supplier contracts

Requests are imports to the indicated owners, not parallel plans of their objects.

- **AlgebraicModuliForArithmeticGeometry:R09.2**: Representability of the regular-Lie incidence cover and relative Hom/Isom; finitely generated fields of definition for general finite-type complex morphisms. In translation-descent a finite algebraic field of definition follows separately from invariance under one special-torus fixing subgroup.

- **AlgebraicModuliForArithmeticGeometry:R09.3**: Faithful field base change on morphisms, Galois fixed-morphism descent along C/E, effective polarized projective descent, intrinsic invertible-sheaf/section base change and dense-open equality for reduced source and separated target.

- **AlgebraicModuliForArithmeticGeometry:R09.5**: Actual finite coarse quotients by effective group actions, descent of finite/surjective/étale properties, normal projective curve compactifications and finite correspondences, and scheme-theoretic closure compatible with extension of fields.

- **InverseGaloisAndArithmeticFundamentalGroups:IG.2**: Hilbert irreducibility for a finite étale cover over a number field with geometrically irreducible total incidence variety, prescribed nonempty real open, and linear disjointness from a fixed finite extension. Existing elementary-polynomial nodes do not state this.

- **ModularCurvesPartII:R12.1**: Actual open elliptic modular analytification from lattices/homology and Tate level; full H± versus chosen upper component, calibrated Weil-pairing primitive root and q convention.

- **ModularCurvesPartII:R12.2**: Scheme analytification and moduli uniformization for full ordered level N >= 3, fixed pairing, Gamma1 N >= 4 and coarse Gamma0 every N > 0, agreeing with AA.5 and the integral representative component calculation.

- **ModularCurvesPartII:R12.3**: Cusp labels, effective stabilizers and widths, analytic parameter exp(2 pi i z/w) and its transformation under level maps.

- **ModularCurvesPartII:R12.4**: Open fixed-pairing fibre geometrically connected and irreducible, deduced from Gamma(N) quotient without importing arithmetic compactification.

- **ModularCurvesPartII:R12.5**: Hecke isogeny moduli and both finite correspondence legs, integral row action and nonintegral adelic/isogeny dictionary, differential pullback and pull-push normalization.

- **ModularCurvesPartII:R12.6**: Cusp residue fields and Galois action, level/Hecke maps on cusp labels and Tate parameters.

- **ModularCurvesPartII:R13.4a**: Characteristic-zero coarse compactifications for full/composite levels and finite quotients; do not substitute Layer-10 prime diamond quotients.

- **ModularCurvesPartII:R13.4b**: Normal proper generalized-elliptic compactification, boundary subscheme and formal Tate charts over actual cusp residue fields, compatible with the full/coarse open and all finite legs.

- **PELModuli:M3**: Genus-one fine full ordered-basis generic-fibre moduli scheme with N >= 3, homology/Tate comparison to the GL2/GSp2 complex double quotient.

- **PELModuli:M4**: Actual normalized CM action on genus-one full-level moduli and its agreement with the V4 special-pair reciprocity condition, including all determinant components.

- **PELModuli:M5**: Weil pairing and multiplier on full level, basis-change determinant exponent and cyclotomic target, compatible with the selected homology convention.

- **ShimuraCompactifications:C1**: Complex rational boundary components, codimension-one PGL2 factors and auxiliary lifted/product pure data in Pink 12.10, intrinsic top logarithmic differential line on the codimension-one partial extension. Arithmetic descent is a separate recorded gap.

- **ShimuraVarieties:V1**: Actual level category and quotient maps, finite/effective covering group calculation, analytic right translation and composition.

- **ShimuraVarieties:V2**: Normal projective complex Baily–Borel compactification with the intrinsic logarithmic-line embedding and extensions of the applicable datum and level maps.

- **ShimuraVarieties:V3**: Algebraic complex finite-level quotient, finite maps/quotients and algebraicity of datum/translation maps; the BKT definability proof may be used only after its own certified comparison.

- **ShimuraVarieties:V4**: Actual canonical-model predicate with fixed complex comparison, special-pair reciprocity using corrected multiplicative reflex norm and Artin convention, density of Hecke translates and zero-dimensional cyclotomic torus models. AGHMP integral CM lattices are not required here.

- **ShimuraVarieties:V5**: Actual Hodge-type canonical models and normalized CM reciprocity, specializing to genus-one GSp2.

- **ShimuraVarieties:V6**: Actual abelian-type canonical models satisfying V4, with choice comparisons and auxiliary-class preservation required by the recorded compactification gap.

- **ShimuraVarieties:V7**: Actual canonical models for every pure datum and all Pink auxiliary pure data after proven conjugation/cocycle/continuity/effective descent; used only by the general suffix.

- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory**: Connected centralizers of cocharacters, conjugacy and geometry of maximal tori, regular semisimple Lie open and compact-mod-centre real tori. Import this structure theory; the incidence specialization belongs to the requested IG.2/R09.2 contracts.

- **tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing**: Existing full ordered-basis scheme for N >= 3 and its row-action/Weil-pairing convention; fixed-pairing model after cyclotomic base change. R12.1/R12.2 supply the analytic comparison.

- **tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4**: Existing fine Gamma1 moduli scheme for N >= 4 with a point of exact order; the K1 stabilizer dictionary uses the first row-basis generator.

- **tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n**: Existing characteristic-zero coarse Gamma0 cyclic-subgroup moduli for every N > 0. No universal elliptic family is claimed.

## Unresolved leaves and structural proposal

**Arithmetic codimension-one extension before full toroidal descent.** Pink 12.8–12.10 needs actual canonical torus torsors/central quotients and arithmetic partial extensions S+ along codimension-one boundary. C0/relative-torus-embedding supplies a torus embedding only after an arithmetic torsor is supplied; C1 supplies the complex boundary data. Full C2 consumes V8 and cannot be imported here. A separately owned pre-V8 arithmetic codimension-one statement, plus its auxiliary pure-model inputs, is missing; the rescope proposal identifies its boundary. No claim of compactification closure is made.

**Abelian auxiliary class and logarithmic-section descent.** Verify that quotients by the lifted SL2 factor and the Gm-kernel fibre product in Pink 12.10 stay in the existence class of V5/V6, or state precisely the stronger actual auxiliary-model hypothesis. This prevents a hidden V7 dependency in the abelian lane. On S+ construct the intrinsic top logarithmic line and prove finite-dimensional global sections commute with C/E; V2 must identify its large tensor-power map with the complex Baily–Borel closed embedding. Neither B1 nor generic open-model uniqueness supplies these statements.

**Concrete canonical-model and comparison carriers at the pinned Lean baseline.** Pinned Mathlib and Tau Ceti provide schemes/slice categories/functors/pullbacks/spans but no concrete pure datum, canonical reciprocity predicate, finite-adelic level tower or actual full modular-curve carrier under the audited names. Suggested theorem forms explicitly omit those not-yet-expressible conditions rather than use proposition fields or assume their conclusions. Their elaboration checks types only and is not a valid universal theorem about arbitrary schemes. Bind them to the named suppliers, restore every hypothesis and strengthen the schematic finite/proper forms to the full packet statements.

**AA.5 exact principal-level representative contract.** The AA packet is reviewed needs_changes, not an accepted implementation. Its GL2 principal-level calculation supplies the right target, but the literal stabilizer Gamma(N) requires determinant representatives g_c in GL2(Zhat), which normalize K(N); arbitrary finite-adelic representatives give conjugate stabilizers. Require this restriction or explicit conjugating isomorphisms in the supplying node. Do not reproduce the underlying adelic quotient in V8.

**rescope proposal.** Arithmetic minimal descent uses a codimension-one partial extension, while full C2 depends on V8; taking all of C2 as a V8 prerequisite creates a cycle. Within ShimuraCompactifications split the pre-V8 arithmetic codimension-one extension/torus-torsor and intrinsic log-line interface of Pink 12.8–12.10 from the full C2 toroidal descent consuming V8. Keep complex Baily–Borel and its log-line embedding in V2, canonical minimal descent in V8, full arithmetic toroidal compactification in C2, and mixed boundary geometry in C1. No new stage id is asserted as already existing.

## Sources and corrections

All sources below were read on 6 October 2026. The packet records downloaded-copy
hashes and distinguishes the author copies from Deligne’s published Numdam text.

- [Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), J. S. Milne, Author revision, 2017. Passages: 5.4, 5.17 and proof through 5.21, 5.29–5.30; 6.3, 6.11; 12.8, 12.10–12.11; 13.1–13.8; 14.12, 14.15–14.16.

- [Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), J. S. Milne, Version 1.31, 22 March 2017. Passages: 8.3(b) coarse/fine convention, p.98; 8.6–8.9, pp.100–101.

- [Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), Richard Pink, Author-typeset dissertation; numbering/pages of this copy. Passages: 8.2–8.3, pp.132–133; 10.9, p.175; 10.20–10.22, pp.183–185; 11.16, p.194; 12.3, 12.6–12.12, pp.197–202; 12.13 statement, pp.202–203.

- [Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), Pierre Deligne, Version of record, 1970–1971, pp.123–165. Passages: 5.1–5.1.3, pp.153–155, checked against page images; 5.2–5.4, pp.155–156.

- [Tau Ceti roadmap: Modular curves](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ModularCurves/README.md), Tau Ceti contributors, PR81 roadmap as present in the atlas clone on 2026-10-06. Passages: Conventions, especially full-level row action; Layers 5A–5B, 9E, 10.

Pink locators are printed pages in the author-typeset dissertation, not the
original scanned thesis. Deligne 5.1–5.1.3 was checked against rendered page
images because its extracted mathematical notation is unreliable. Official
Milne errata and the linked Lee list were checked; bounded correction searches
for the additional findings are recorded in the packet. The corrections below
are proposed findings, subject to independent confirmation.

- **ShimuraVarieties/E1**, milne-mf, Example 8.9, p.100, MF v1.31 (2017) (error). The characteristic-zero coarse ordered level-two curve is the punctured lambda-line A¹ minus {0,1}. It is not a fine moduli scheme of all such families. The Legendre family is smooth only on the punctured line. Restrict the fine comparison in this packet to N >= 3. The discriminant is 16 lambda²(1-lambda)². The automorphism [-1] fixes E[2]; nontrivial quadratic twists have the same geometric lambda invariant and obstruct the claimed universal property over arbitrary fields. Existing correction: new.

- **ShimuraVarieties/E2**, milne-mf, Lemma 8.7, p.100, with its preceding arbitrary primitive-root convention, MF v1.31 (2017) (error). This reference basis has one fixed Weil-pairing root zeta_ref. For zeta = zeta_ref^u replace the first generator by u z/N (u a unit modulo N), or fix zeta=zeta_ref in the statement. The ordered lattice/reference orientation fixes the pairing; the displayed generators do not vary with the arbitrary root in the preceding definition. Bilinearity gives the corrected exponent. Existing correction: new.

- **ShimuraVarieties/E3**, milne-svi, Proposition 6.3 proof, second paragraph, p.71, 2017 author copy (misprint). Use a: W → V and a′: W′ → V, consistent with the setup on p.70; with q absorbed into a′, the comparison isomorphism W → W′ is (a′)⁻¹ a. Also use the corrected primed h′ and eta′ where specified in Lee’s errata. In the first paragraph use s′ in place of t′, the correction on p.70 line -3 in Lee’s list. The printed directions make a h and a composed with eta ill-typed. The initial setup uses a: W → V, and the inverse expression for the comparison must have domain W. Existing correction: new.

- **ShimuraVarieties/E4**, milne-svi, Remark 5.29(a), p.65, 2017 author copy (misprint). For K contained in K′ the forgetful quotient map is S_K → S_K′. Forgetting a finer level maps the smaller subgroup quotient to the larger subgroup quotient. Existing correction: Jungyun Lee, SV_errata.pdf, p.1: page 65 line -6..

- **ShimuraVarieties/E5**, milne-svi, The homomorphism r_x, displayed formula (60) and the final formula before Definition 12.8, p.114, 2017 author copy (misprint). Replace the aggregation signs by products in these multiplicative torus formulas. In the r_x formula the embeddings are of E(x), the field of definition of μ_x, as specified in Lee’s errata. V8 uses the corrected V4 multiplicative reciprocity norm. The target is the multiplicative torus; an additive sum does not define the asserted torus homomorphism. V8 imports the corrected V4 reciprocity norm. Existing correction: Milne official xnotes errata, sums-to-products correction credited to Ruida Di, p.114; Jungyun Lee SV_errata.pdf, embeddings indexed by E(x) in the r_x formula..

- **ShimuraVarieties/E6**, deligne-1971, 5.1.3, printed p.155, published Numdam copy (page image checked) (error). Require U to be nonempty and F/E to be finite in the disjoint Hilbert-specialization assertion. These are precisely the hypotheses of its application in Theorem 5.1. An empty real open has no specialization. Without finiteness of F the result is false: over E=Q, take the degree-two cover s²=t of V=A¹ minus {0}, U=(1,2), and F=Qbar. A rational specialization either splits or is a nontrivial quadratic field, which cannot be linearly disjoint from Qbar over Q. Existing correction: new.

- **ShimuraVarieties/E7**, deligne-1971, Lemma 5.1.2(b), printed p.154, published Numdam copy (page image checked) (misprint). The maximal tori containing i(G_mC) are maximal tori of G_C, not of G_mC. The centralizer and the surrounding incidence construction are in G_C; G_mC is the domain of i. Existing correction: new.

- **ShimuraVarieties/E8**, deligne-1971, Hilbert specialization lemma (heading printed Lemme 5.13), p.154, and its proof p.155, published Numdam copy (page images checked) (misprint). Read the inserted lemma as 5.1.3 (following 5.1.2), and refer in its proof to its own hypotheses, not to 4.12. The proof base changes the immediately preceding incidence-cover hypotheses; 4.12 is not that lemma. Existing correction: new.

## Coverage and acceptance of the plan

V8 has six planets: translations, the level tower, ordered Hecke correspondences,
datum functoriality, the full-level modular comparison and the arithmetic minimal
compactification. V8.general has one planet, the general-data canonical tower.
Every target has a node and every prerequisite terminates at a pinned declaration,
a checked supplier node, a requested supplier stage or one of the four recorded
gaps. Both coverage records are planned. Follow-up work must resolve the exact supplier contracts
and compactification leaves, bind and strengthen the suggested forms, then prove
and check the declarations before either stage can be called closed.
