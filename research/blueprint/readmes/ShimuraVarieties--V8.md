# The canonical algebraic tower and modular-curve comparison

This target-level blueprint covers **ShimuraVarieties:V8** and
**ShimuraVarieties:V8.general**. It is complete as a planning pass: both stages
are **planned**, with seven explicit gaps and the supplier contracts below.
Neither stage is closed, and every declaration remains `implementationStatus: unchecked`.
The reader states the mathematical targets; the [suggested file](../suggested/ShimuraVarieties--V8.lean)
records incomplete signature forms wherever the required supplier carriers are absent.

Revision round 2 synchronizes this document with the corrected
[packet](../packets/ShimuraVarieties--V8.json), including its three added nodes.
The prior [independent review](../reviews/REV-ShimuraVarieties--V8.md) remains
`needs_changes` until a new independent review checks this revision. Its historical
counts predate three supplier-gap refinements: the current inventory has 26 nodes,
three constructions, 16 API items, 15 tests, seven planets, 12 baseline declarations,
25 requests, seven gaps and nine confirmed source issues. No restructuring is proposed.

## Objects and conventions

Let D=(G,X) be a pure Shimura datum, E=E(D) its reflex field with a chosen
embedding into C, and K a compact open subgroup of G(A_f). An actual canonical
model M_K is a finite-type normal separated E-scheme with a specified complex
comparison to the algebraic quotient of V3, satisfying the special-pair reciprocity
condition of V4. V5/V6 provide these models in the abelian-type lane; V7 provides
them in the general lane. The conditional descent arguments apply to either family.

The tower takes values in the native slice category of schemes over Spec E.
The compact-open index category itself is requested from V1 and remains a gap;
the existing analytic level-map, translation and Hecke nodes supply its intended
maps and laws. An inclusion K ⊂ L points from M_K to M_L. Right translation is
T_g:[x,a]_K ↦ [x,ag]_L for g⁻¹Kg ⊂ L. Applying T_g and then T_h gives T_gh.
The ordered Hecke span has apex at J=K∩gKg⁻¹, first leg the forgetful map, and
second leg T_g followed by forgetting g⁻¹Jg ⊂ K. These are maps between admissible
finite levels. A normal level quotient uses the actual effective image of the deck
group. Level maps are finite and surjective in general; they are étale when the
target level K₂ is neat, which also makes K₁ neat. The full-level-three map to the
coarse j-line has degree 24 and ramifies at j=0,1728, so source neatness alone is
insufficient. See Milne SVI 5.29(c), p.65, and PR81 Layer 9E.

The component target needs a second kind of zero-dimensional object. For a
Q-torus T, let Y be a finite nonempty transitive T(R)/T(R)⁺-set. Its Shimura set is
T(Q)∖(Y×T(A_f))/K. Given the cocharacter over E, the full-idelic reflex norm and
geometric Artin map act by σ[y,a]=[r(s)_∞y,r(s)_fa]. Independence of the Artin lift
and continuity give a finite continuous Galois set; PR81 0D turns it into a finite
étale E-scheme. The archimedean factor acts on Y and must be retained. When Y is a
singleton this agrees with V4's torus model. This construction is Milne's extension
of strict torus Shimura data (SVI pp.62–63, formula (64), p.119).

For GL₂ use the full H± datum, D5's homology weight −1, and
K(N)=ker(GL₂(Zhat)→GL₂(Z/N)). The determinant component target has T=G_m and
Y=R×/R₊×={±1}. At det K(N) its set is (Z/N)×, and its Q-model is
μ_N^prim=Spec Q[z]/Φ_N(z). The strict one-point torus datum instead gives
(Z/N)×/{±1}, with the real cyclotomic subfield as model: at N=3 it has one
geometric point, whereas the determinant target has two. The determinant map is
a component map to this two-point-domain Shimura variety, whose arithmetic descent
is proved in `component-reciprocity`; it is not obtained by applying strict
datum functoriality. See Milne SVI p.63 and formula (64) with footnote 73, p.119.

For N≥3 the full ordered-basis Q-model has φ(N) geometric components, detected
by the Weil pairing. A primitive root ζ selects a fibre after base change to Q(ζ).
That fibre has complex quotient Γ(N)∖H. The analytic reference basis has one fixed
pairing root ζ_ref; for ζ=ζ_ref^u multiply its first generator by u. This is the
calibration needed in MF 8.7, p.100. The modular basis is a row: for
u=[[a,b],[c,d]], (P,Q)u=(aP+cQ,bP+dQ), and the pairing is raised to det(u).
Milne 6.3, pp.70–71, sends a level map η to [ah,a∘η], so precomposition by u
matches adelic right multiplication. Nonintegral g uses the two isogeny legs.
Γ₁ fixes the first generator and is fine for N≥4. Γ₀ is coarse for every N>0;
the N=2 comparison uses PR81 9D, since the fine full-level Borel formula in 9E
requires N≥3. Layer 10 only supplies prime N≥5 diamond quotients by subgroups
of (Z/N)×/{±1}. R13.4a/b supply full and composite compact levels.

## Proof route and ownership

The arithmetic descent starts with the disjoint special-reflex-field lemma.
The regular semisimple Lie open carries a finite étale incidence cover of
cocharacters and maximal tori; its geometric fibres over the reflex field are
irreducible. A nonempty real open of compact-mod-centre tori and Hilbert
specialization produce a special reflex field disjoint from any prescribed finite
extension. Connected centralizers belong to ReductiveGroups; cocharacter
representability and the precise Hilbert specialization belong to their requested
suppliers. Use the corrected hypotheses of Deligne 5.1–5.1.3, pp.153–155.

V4 reciprocity multiplies the adelic coordinate on the left and hence commutes
with right translation. Density identifies conjugate complex maps. Descent under
one special-torus fixing group first gives a finite algebraic field of definition;
choosing a special reflex field disjoint from its normal closure then forces
E-descent. This avoids assuming that an arbitrary complex map already has a
finite algebraic field of definition. The same argument gives uniqueness for a
specified complex comparison. For a datum morphism D→D′ the cocharacter-class
stabilizers give E(D′)⊂E(D); the target is base changed to E(D). The historical
suggested name `datum_map_defined_over_compositum` is retained, but this compositum
is E(D). Coherence follows by faithful complex base change (Milne 12.3(c), p.112;
13.6–13.8, pp.118–119).

When G^der is simply connected, V0 identifies the components with the Shimura
set for T=G/G^der and Y=T(R)/image Z(G)(R). Special pairs map to this quotient;
reflex-norm functoriality, including the norm from the special reflex field to E,
makes their reciprocity actions agree. Density and the disjoint-field argument
then descend the component map. Promotion of this full-idelic field-change
functoriality from the V4 API to a lemma node remains a named gap. The construction
of the zero-dimensional target and the component descent are separate nodes, so
the determinant comparison cannot silently use the wrong one-point torus target.

Under the accepted RS-04 boundary, AA.5 owns the GL₂ adelic double-quotient
calculation, and PELModuli M5 owns the genus-one Siegel comparison with PR81.
V8 proves canonical reciprocity on the resulting full-level Q-model, then uses
uniqueness to obtain its arithmetic comparison. R12.1–R12.6 supply uniformization
and analytic/coefficient interfaces; R13.4a/b supply arithmetic compact and
boundary interfaces. AA.5 must give integral determinant representatives that
normalize K(N), or explicit conjugating identifications; that precise contract
remains a gap. The reviewed audit's C6 and H5 overlaps concern downstream
integral PEL and Hilbert comparisons, respectively.

Minimal descent starts with the independently constructed GL₂ compact model.
Pink 12.10, pp.200–201, treats each codimension-one boundary arising from a
Q-simple PGL₂ factor. If the projection lifts to GL₂, embed D in the product of
the quotient datum D/SL₂ and the GL₂ datum, and take the closure of its canonical
open model in M(D/SL₂)×X_full(N). Otherwise lift through
Gtilde=G×_{PGL₂}GL₂ with G_m kernel and use a finite quotient of the lifted
partial extension. These constructions descend the pure-data partial extension
M_K⁺ over E; they use V8's compact modular model, datum maps, closed-subscheme
descent and finite quotients. The arithmetic construction belongs to V8's
`codim-one-extension`. The required complex closed immersion and finite quotient
remain a V2 gap; the abelian lane also records the auxiliary-data class question.
No arithmetic torus-torsor input or C2 restructuring is needed for this pure-data
argument. Mixed torus embeddings remain with ShimuraCompactifications.

Pink 8.2, pp.132–133, supplies a smooth complex partial open with smooth boundary
divisor, omitted strata of codimension at least two, and a high-power logarithmic
canonical section embedding of the Baily–Borel compactification. Its exact
all-type interface is a separate V2 gap. On the arithmetic M_K⁺ the top
logarithmic differential line is intrinsic. Flat base change for its global
sections comes from R09.3. Closing M_K⁺ in the corresponding projective space
over E gives the normal projective minimal model with its specified complex
comparison (Pink 12.12, p.202). Non-neat levels follow by finite quotients.
Uniqueness concerns that specified compactification and open comparison, rather
than arbitrary compactifications of the open scheme. Datum-morphism extensions
to the complex minimal model are a further part of the complex-functoriality gap;
V2's level extensions alone do not supply them. No étaleness is asserted at cusps.

In the abelian lane, auxiliary quotient and fibre-product data must lie in the
class proved by V5/V6, or actual auxiliary-model hypotheses must be strengthened,
including the Pink-style two-point-domain cases. The general suffix supplies
V7's actual models and specializes the same conditional V8 arguments. It retains
the complex and signature gaps and exports the finite-level/minimal interface
to C2.general and S0.general.

## Pinned baseline and suggested forms

The packet pins Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. AUDIT-11 marks both stages not built.
All 12 native Mathlib declarations below were read at their exact pinned source
commit again in this revision. They provide schemes, slice categories, functors,
base change, ordered spans, morphism properties and linear disjointness.

The suggested file contains three construction forms, all 16 API names, all
15 test names as examples, and the remaining named theorem forms. The tower and
Hecke constructors expose only categorical assembly; the zero-dimensional
constructor exposes the quotient relation and its set, while its arithmetic model
still lacks the supplier equivalence. These forms require the actual datum,
reciprocity, analytic and modular carriers and every packet hypothesis before
proof. In particular, the minimal form must be strengthened from its proper/open
carrier shape to the normal projective model with the specified Baily–Borel
comparison. Map projections use heterogeneous equality where object projections
are propositional equalities. Numeric examples pin the required values 24, φ(3)=2
and p+1; they do not yet prove those values for actual tower or Hecke maps.
Elaboration checks signature syntax and native interfaces, not the unproved
mathematical assertions. The handoff records this revision's elaboration result.

## Coverage and planets

### ShimuraVarieties:V8 — planned

- Close the complex Baily–Borel functoriality gap (datum morphisms; the codimension-one embedding and finite quotient of Pink 12.10) and the auxiliary-class gap used by codim-one-extension.
- Bind the concrete canonical-model, zero-dimensional Shimura set, analytic comparison and modular-curve carriers in the suggested file to supplier declarations.
- Discharge exact requested supplier interfaces.
- Compact-open level index category: The compact-open level index category Level(D), with inclusion arrows, conjugation of indices and its laws. V1/holomorphic-level-maps, V1/right-translation and V1/holomorphic-hecke now supply the analytic maps and laws by exact node id. Neither the reviewed V1 packet nor ShimuraData D5 has a node constructing the index category itself; expose this construction under its analytic-tower owner before binding the generic Lean index category.
- Log-canonical section interface on the codimension-one partial compactification: The V2 targets and nodes do not yet state the smooth partial-open and logarithmic global-generation interface of Pink 8.2 used in Pink 12.12. Supply M_K(C)^+, its smooth boundary divisor, codimension of the omitted strata, and the high-power logarithmic canonical section embedding. V2/koecher treats the no-PGL2 range; V2/automorphic-finite-generation does not alone identify this all-type log-canonical linear system. The existing complex-functoriality gap separately records the Pink 12.10 closed immersion/finite quotient and datum-morphism extensions. These refinements belong to V2 and do not invalidate the arithmetic partial-extension construction conditional on them.
- Reflex-norm functoriality API promotion: Promote ReflexNorm.map from the API of V4/reflex-norm to a lemma node, retaining the field-change norm: for f:T0 -> T and mu = f composed with mu0, f composed with r(T0,mu0) equals r(T,mu) composed with Nm from E(mu0) to E(mu), on full ideles, compatibly with geometric Artin restriction. The construction and canonical condition are already referenced by exact node ids; the missing promoted lemma, rather than a strict one-point torus model, is the remaining stage contract.

### ShimuraVarieties:V8.general — planned

- Supply the actual V7 canonical models and auxiliary pure models, then specialize V8.
- Inherit and discharge the V8 complex-functoriality, auxiliary-class and Lean-carrier gaps; do not duplicate the conditional functoriality proof.
- Log-canonical section interface on the codimension-one partial compactification: The V2 targets and nodes do not yet state the smooth partial-open and logarithmic global-generation interface of Pink 8.2 used in Pink 12.12. Supply M_K(C)^+, its smooth boundary divisor, codimension of the omitted strata, and the high-power logarithmic canonical section embedding. V2/koecher treats the no-PGL2 range; V2/automorphic-finite-generation does not alone identify this all-type log-canonical linear system. The existing complex-functoriality gap separately records the Pink 12.10 closed immersion/finite quotient and datum-morphism extensions. These refinements belong to V2 and do not invalidate the arithmetic partial-extension construction conditional on them.

The seven selected landmarks are retained from the reviewed packet.

| Stage | Planet | Target |
| --- | --- | --- |
| ShimuraVarieties:V8 | Hecke translations over the reflex field | `ShimuraVarieties:V8/translation-descent` |
| ShimuraVarieties:V8 | Canonical algebraic tower | `ShimuraVarieties:V8/level-tower` |
| ShimuraVarieties:V8 | Algebraic Hecke correspondences | `ShimuraVarieties:V8/hecke-span` |
| ShimuraVarieties:V8 | Functoriality of canonical models | `ShimuraVarieties:V8/datum-functoriality` |
| ShimuraVarieties:V8 | Full-level modular curve comparison | `ShimuraVarieties:V8/gl2-full-level` |
| ShimuraVarieties:V8 | Canonical minimal compactification | `ShimuraVarieties:V8/minimal-descent` |
| ShimuraVarieties:V8.general | General-data canonical tower | `ShimuraVarieties:V8.general/general-tower` |

## Declaration catalogue

Each entry retains its packet ID, proposed name, hypotheses, proof route and
acceptance checks. Source locators refer to the bibliography below.

### Disjoint special reflex fields

**ID:** `ShimuraVarieties:V8/disjoint-special-reflex-fields`. **Kind:** theorem. **Proposed name:** `CanonicalModel.disjoint_special_reflex_fields`.

For every pure datum D and finite extension L/E(D) in C, there is a special torus subdatum (T,h) of D such that E(T,h)/E(D) is linearly disjoint from L/E(D). The torus-reflex field is used, not the residue field of an arbitrarily chosen level point.

**Hypotheses.**

- G is connected reductive over Q; actual special pairs and cocharacter reflex fields are those of D3/D4.
- L/E(D) is finite.
- The schematic Lean field form uses an index of actual special-torus reflex fields; the missing datum/special-pair predicate must be restored, so it cannot select an arbitrary disjoint intermediate field.

**Proof route.**

1. Use Deligne 5.1: over the regular-semisimple open V in Lie(G), the incidence variety W of maximal tori, cocharacters in the datum class, and regular Lie elements maps finite étale surjectively to V and to Spec E(D).
2. Connected centralizers and conjugacy of maximal tori give geometrically irreducible fibres over E(D). The nonempty real open U of tori compact modulo the centre supplies special homomorphisms in X.
3. Apply Hilbert irreducibility with a real-open condition and linear-disjointness avoidance to W after base change to L. Its specialized cocharacter field contains the reflex field of the resulting torus datum; subextensions retain linear disjointness.

**Prerequisites.** `ShimuraData:D4/shimura-datum`, `ShimuraData:D3/reflex-field`, `ShimuraData:D4/special-pair`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `InverseGaloisAndArithmeticFundamentalGroups:IG.2`, `AlgebraicModuliForArithmeticGeometry:R09.2`, `mathlib:IntermediateField.LinearDisjoint`.

**Source match.**

- milne-svi, 13.4, p.118: States the special-reflex-field lemma.
- deligne-1971, 5.1, 5.1.2, 5.1.3, pp.153–155 (page images checked): Incidence cover, connected-fibre argument and real-open Hilbert specialization.

**Acceptance checks.**

- For GL2, take an imaginary quadratic field Q(sqrt(-p)) with p an odd prime unramified in L; ramification at p excludes its inclusion in L.
- Do not infer the field-disjointness theorem from mere density of special points.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Hecke translation over the reflex field

**ID:** `ShimuraVarieties:V8/translation-descent`. **Kind:** theorem. **Proposed name:** `CanonicalModel.translation_defined_over_reflex`.

If g in G(A_f) and g^{-1}Kg is contained in L, the complex morphism T_g:[x,a]_K -> [x,ag]_L descends uniquely to an E-morphism M_K -> M_L. This is a conditional functoriality theorem for actual canonical models, with no general existence assumption.

**Hypotheses.**

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- K,L are compact open and g^{-1}Kg is contained in L.

**Proof route.**

1. V1 gives the analytic map and V3 its algebraicity over C. For a special pair (T,h), V4 gives sigma[h,a]=[h,r_h(s)a] for sigma fixing E(T,h). Left multiplication r_h(s) commutes with right multiplication g.
2. V4 density of all Hecke translates of h identifies T_g with its sigma-conjugate as algebraic maps (source reduced, target separated).
3. First descend through Aut(C/E(T,h)) for one special pair: this gives a finite algebraic field of definition of T_g, rather than assuming every complex morphism has one. Apply disjoint-special-reflex-fields to its finite normal closure over E. Descent through the second fixing subgroup and linear disjointness force the map to be defined over E; faithful base change gives uniqueness.

**Prerequisites.** `ShimuraVarieties:V1/right-translation`, `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V3/borel-algebraicity`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V4/canonical-model`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V8/disjoint-special-reflex-fields`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Source match.**

- milne-svi, 13.6, pp.118–119: Reciprocity, dense translates and disjoint reflex fields prove descent.

**Acceptance checks.**

- For g=1 and K contained in L this is the forgetful level map.
- For L=g^{-1}Kg this is an isomorphism, with inverse T_{g^{-1}}.
- The inclusion direction must be tested on a changed representative ak: k g=g(g^{-1}kg).

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Uniqueness of canonical models

**ID:** `ShimuraVarieties:V8/model-uniqueness`. **Kind:** theorem. **Proposed name:** `CanonicalModel.unique_iso`.

Two canonical E-models of the same finite-level Shimura variety have a unique E-isomorphism inducing their specified comparison over C. These isomorphisms commute with all descended level and translation maps.

**Hypotheses.**

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.

**Proof route.**

1. Repeat translation-descent with g=1, K=L and the two distinct specified model comparisons; the same special-pair action makes the complex identity descend.
2. Descend its inverse and verify the inverse identities by faithful base change. Naturality follows by comparing after C-base change.

**Prerequisites.** `ShimuraVarieties:V8/translation-descent`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Source match.**

- milne-svi, 13.7(a), p.119: Uniqueness includes the fixed complex model identification.

**Acceptance checks.**

- An arbitrary automorphism of an E-scheme is not the specified unique comparison.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Canonical algebraic level tower

**ID:** `ShimuraVarieties:V8/level-tower`. **Kind:** construction. **Proposed name:** `CanonicalTower.ofLevelMaps`.

For actual canonical models M_K, assemble the unique descended forgetful maps pi_{K,L} for K contained in L into the functor CanonicalTower.ofLevelMaps: Level(D) -> Over(Spec E). Level(D) is the compact-open level index category requested from V1; the existing V1 map nodes and D5 neat-level node do not construct it, so this interface remains an explicit gap. Its values are the supplied models, not newly chosen arbitrary schemes. In the suggested file the index category and model family are parameters; the constructor is only the categorical assembly slice of this construction.

**Hypotheses.**

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The categorical assembly signature takes the already proved identity and composition laws for the descended transitions. These laws are obtained here by uniqueness, rather than assumed in the mathematical descent theorem.

**Proof route.**

1. Apply translation-descent at g=1 to every inclusion.
2. The identity and composition equations hold over C by V1 and descend by uniqueness. Package these maps with the existing Functor constructor; retain the actual structure morphism in Over(Spec E).
3. After any extension E -> F, use Over.pullback to base change the entire functor; identity and successive base changes use the native natural isomorphisms.

**Prerequisites.** `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V1`, `mathlib:CategoryTheory.Functor`, `mathlib:CategoryTheory.Over`, `mathlib:CategoryTheory.Over.pullback`, `mathlib:CategoryTheory.Over.pullbackId`, `mathlib:CategoryTheory.Over.pullbackComp`, `mathlib:AlgebraicGeometry.Scheme`.

**Source match.**

- milne-svi, 5.29(a), p.65; 12.10, p.115; 13.7(b), p.119: Assemble the algebraic models with their actual maps. Neither an infinite-level scheme nor its point formula is required.

**Acceptance checks.**

- All levels retain their given structure morphisms to Spec E.
- A composite of three inclusions gives the same map for either parenthesization.

**Uses.**

- PerfectoidShimuraVarieties:S0, S2, S4: Supplies finite-level schemes and compatible maps before any inverse-limit or perfectoid construction.
- Milne 12.10 and ShimuraVarieties:V8.general: The canonical-model tower is a single functor; general existence supplies its values.
- ShimuraCompactifications:C2 and AutomorphicBundles:B1: Supplies arithmetic transition morphisms and common-base diagrams.

**API.**

- `CanonicalTower.ofLevelMaps_obj` (projection): At i the constructor has value M(i), with its given map to the base.
- `CanonicalTower.ofLevelMaps_map` (projection): On an arrow f:i -> j the constructor evaluates to the supplied descended transition t(f). In the suggested file this is heterogeneous equality because the constructed object projections are propositional equalities.
- `CanonicalTower.ofLevelMaps_id` (simp): The map of the identity arrow at i is the identity of M(i).
- `CanonicalTower.ofLevelMaps_comp` (functoriality): The map of f followed by g is t(f) followed by t(g).
- `CanonicalTower.ofLevelMaps_baseChange` (compatibility): Postcomposing with Over.pullback(b) sends a transition f to the pullback of t(f), on the pulled-back models. This uses native base change rather than a second scheme carrier.

**Unit tests.** These contracts must be checked against the actual construction;
the suggested examples expose only the currently expressible part.

- `CanonicalTower.test_identity_level` (degenerate): At any level K, t(id_K) is the identity of M_K.
- `CanonicalTower.test_nested_levels` (compatibility): For K1 contained in K2 contained in K3, the constructor map of the composite inclusion equals pi_{K1,K2} followed by pi_{K2,K3}.
- `CanonicalTower.test_preserves_supplied_arrow` (characterisation): For a supplied arrow f and a morphism u distinct from t(f), the constructor map of f is not u; replacing transitions by zero or arbitrary maps fails this test.
- `CanonicalTower.test_base_change` (compatibility): The base-changed constructor map on f is exactly Over.pullback(b).map(t(f)).
- `CanonicalTower.test_gl2_jline_degree` (computation): For GL2 and N >= 3 the tower map from level K(N) to GL2(Zhat) is identified with the j-map Y_full(N)_Q -> A^1_Q (gl2-full-level, PR81 9E); its degree is |GL2(Z/N)|/2 because -1 acts trivially, so 24 at N = 3, and |GL2(F_3)| = 48.
- `CanonicalTower.test_not_constant` (non-example): The tower is not constant: for GL2, M_{K(N)} has phi(N) geometric connected components (component-reciprocity) while M_{GL2(Zhat)} is geometrically connected, so for N >= 3 the transition is not an isomorphism; phi(3) = 2.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Right translation laws on the algebraic tower

**ID:** `ShimuraVarieties:V8/translation-laws`. **Kind:** theorem. **Proposed name:** `CanonicalTower.translation_comp`.

The descended T_g obey T_1=id at equal levels and T_h composed after T_g equals T_{gh}, whenever g^{-1}Kg is contained in L and h^{-1}Lh is contained in P. For k in K the equal-level T_k is the identity. For a fixed g the conjugate-level isomorphisms form a natural transformation from the tower to the conjugated-index tower.

**Hypotheses.**

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.

**Proof route.**

1. V1 proves these identities on the double quotient.
2. Compare the descended E-morphisms after faithful C-base change; use uniqueness. The product is gh in this right-action convention.

**Prerequisites.** `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/level-tower`, `ShimuraVarieties:V1/right-translation`, `ShimuraVarieties:V1/holomorphic-level-maps`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Source match.**

- milne-svi, 5.29(b)–(c), p.65: Source/target levels and coherent right translations.
- milne-svi, Discussion before Definition 5.14, p.58: Pins the convention T(gh)=T(h)∘T(g): first T(g), then T(h).

**Acceptance checks.**

- For g,h represented by noncommuting GL2 matrices, check gh rather than hg.
- No action of all G(A_f) on one finite-level scheme is asserted.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Finite level maps and effective deck groups

**ID:** `ShimuraVarieties:V8/finite-level-maps`. **Kind:** theorem. **Proposed name:** `CanonicalTower.level_map_finite`.

For K1 contained in K2, pi_{K1,K2} is finite and surjective over E; when K2 (hence K1) is neat it is finite étale. If K1 is normal in K2, M_{K2} is the quotient of M_{K1} by the effective image of K2/K1 in automorphisms of M_{K1}; its kernel consists of elements acting trivially on the actual quotient (for GL2 and K(N) normal in GL2(Zhat), the element -1 acts trivially, so the effective group is GL2(Z/N)/{±1}). Deck groups and degree use this effective quotient, not K2/K1 without a kernel calculation.

**Hypotheses.**

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.

**Proof route.**

1. V1 supplies finite analytic coverings and the effective stabilizer calculation. V3 supplies finite algebraic maps and finite quotients at non-neat levels.
2. Finiteness, surjectivity and, for neat K2, étaleness descend along C/E. Apply the finite quotient universal property to the descended effective action.

**Prerequisites.** `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/translation-laws`, `ShimuraVarieties:V1/holomorphic-level-maps`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `ShimuraData:D5/neat-level`, `mathlib:AlgebraicGeometry.IsFinite`.

**Source match.**

- milne-svi, 5.29(c), p.65: Finite quotient statement of 5.29(c), with the effective-kernel qualification inherited from V1.

**Acceptance checks.**

- For torus data the dimension is zero; level morphisms are finite étale.
- Non-neat levels retain elliptic stabilizer ramification, so étaleness is not exported there.
- Y_full(3) -> Y(1) (the j-line) has degree |GL2(F_3)|/2 = 24 and ramifies over j = 0 and j = 1728: the target level GL2(Zhat) is not neat.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Algebraic Hecke correspondence

**ID:** `ShimuraVarieties:V8/hecke-span`. **Kind:** construction. **Proposed name:** `CanonicalHecke.span`.

For D, actual canonical models and g in G(A_f), put J=K intersect gKg^{-1}. Construct CanonicalHecke.span as the native WalkingSpan diagram in Over(Spec E), with apex M_J, first leg pi_{J,K}, and second leg T_g:M_J -> M_{g^{-1}Jg} followed by pi_{g^{-1}Jg,K}. Both legs are finite. The suggested constructor receives these already descended legs and uses native span; supplying these arrows alone does not prove canonical descent.

**Hypotheses.**

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- g is a finite-adelic element and K is compact open.

**Proof route.**

1. D5/V1 supply J, conjugate levels and both inclusion witnesses.
2. Apply translation-descent and finite-level-maps to obtain the two E-morphisms.
3. Use CategoryTheory.Limits.span, preserving the order of the two legs. The complex comparison is the V1 correspondence; applying native spanCompIso to Over.pullback supplies its base-change isomorphism.

**Prerequisites.** `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V1/holomorphic-hecke`, `mathlib:CategoryTheory.Limits.span`, `mathlib:CategoryTheory.Limits.spanCompIso`, `mathlib:CategoryTheory.Over.pullback`.

**Source match.**

- milne-svi, 5.29, p.65; 13.6, p.118: Arithmetic descent of the two legs of the V1 Hecke correspondence.

**Acceptance checks.**

- J is K intersect gKg^{-1}, not K intersect g^{-1}Kg.
- For g=1, J=K and both legs are the identity.
- For g = diag(p,1) the apex has index p+1, not p or p^2: J is K ∩ gKg^{-1}, the stabilizer of a line in F_p^2.

**Uses.**

- Milne 13.6 and ShimuraCompactifications:C3: Uses the two separately descended finite morphisms; compactification extends the same ordered span.
- ModularCurvesPartII:R12.5 and HeegnerPointEulerSystems: Compares finite correspondences with moduli isogenies before applying pull-push to coefficients.

**API.**

- `CanonicalHecke.span_apex` (projection): The value at WalkingSpan.zero is the supplied apex M_J.
- `CanonicalHecke.span_first` (projection): The image of WalkingSpan.Hom.fst is exactly pi_{J,K}. The suggested signature uses heterogeneous equality across the object projection equalities.
- `CanonicalHecke.span_second` (projection): The image of WalkingSpan.Hom.snd is exactly T_g followed by pi_{g^{-1}Jg,K}. The suggested signature uses heterogeneous equality across the object projection equalities.
- `CanonicalHecke.span_baseChange` (compatibility): Postcomposing the span with Over.pullback(b) is naturally isomorphic to native span on the two pulled-back legs, by spanCompIso.

**Unit tests.** These contracts must be checked against the actual construction;
the suggested examples expose only the currently expressible part.

- `CanonicalHecke.test_identity` (degenerate): For equal apex and endpoints and both supplied legs the identity (the g=1 case), both WalkingSpan arrows evaluate to the identity.
- `CanonicalHecke.test_native_span` (compatibility): The constructed ordered diagram equals CategoryTheory.Limits.span(p1,p2) on the supplied legs.
- `CanonicalHecke.test_distinct_legs` (non-example): For two endomorphisms p1,p2 of a supplied apex with p1 distinct from p2, the first-leg evaluation is not p2. A construction that swaps the two legs fails this test.
- `CanonicalHecke.test_base_change` (compatibility): After Over.pullback(b), evaluation at the first WalkingSpan arrow is Over.pullback(b).map(p1).
- `CanonicalHecke.test_gl2_Tp_index` (computation): For GL2, K = GL2(Zhat) and g = diag(p,1) at a prime p, J = K ∩ gKg^{-1} is the preimage of the lower-triangular subgroup mod p, of index p+1 = |P^1(F_p)| in K; both legs of the Hecke span have degree p+1 over the coarse j-line, the classical T_p.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Functoriality of canonical models in the datum

**ID:** `ShimuraVarieties:V8/datum-functoriality`. **Kind:** theorem. **Proposed name:** `CanonicalModel.datum_map_defined_over_compositum`.

For a datum morphism f:D -> Dprime, compact open K,Kprime with f(K) contained in Kprime, and actual canonical models on both sides, the complex map [x,a] -> [f(x),f(a)] descends uniquely to a morphism over E(D). Milne states the field as the compositum E(D)E(Dprime); it equals E(D), because E(Dprime) is contained in E(D) (the argument of Milne 12.3(c) applies to every datum morphism: f carries the cocharacter class of X into that of Xprime Galois-equivariantly). It commutes with admissible level maps and right translations, identity datum maps and compositions after the necessary base changes of the target models to E(D).

**Hypotheses.**

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- Both data and their reflex fields are specified; the target also has actual canonical models.

**Proof route.**

1. V3 gives the complex algebraic map; D4 sends special pairs to special pairs.
2. Functoriality of V4 reflex norms makes the map Galois equivariant on the dense Hecke orbit of each source special pair (special points map to special points by D4). Apply the disjoint-field argument of translation-descent over E(D), which contains E(Dprime).
3. Descend by A; identities, compositions and Hecke compatibility follow from their complex formulas and faithful base change.

**Prerequisites.** `ShimuraData:D4/datum-morphism`, `ShimuraData:D4/special-image`, `ShimuraVarieties:V8/disjoint-special-reflex-fields`, `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V3/algebraic-data-maps`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V4/canonical-model`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V4`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Source match.**

- milne-svi, 13.8, p.119: Milne's compositum statement; the compositum equals E(D).
- deligne-1971, 5.4, pp.155–156: Special-pair proof of datum functoriality.
- milne-svi, 12.3(c), p.112: The reflex field of the source contains that of the target; the argument uses only Galois-equivariance of the induced map on cocharacter classes.

**Acceptance checks.**

- The identity datum map gives the identity scheme morphism.
- The determinant GL2 -> Gm is defined over Q, and must agree with the separately constructed torus canonical model.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Zero-dimensional Shimura varieties and their canonical models

**ID:** `ShimuraVarieties:V8/zero-dimensional-shimura-variety`. **Kind:** construction. **Proposed name:** `ZeroDimShimura.shimuraSet`.

Let T be a Q-torus, Y a nonempty finite set on which T(R) acts transitively through T(R)/T(R)^+ (T(Q) acting through T(Q) ⊂ T(R)), and mu a cocharacter of T_C with field of definition E ⊂ C. For compact open K ⊂ T(A_f) put Sh_K(T,Y) = T(Q)∖(Y × T(A_f))/K, the finite set of classes [y,a]_K with [y,a]_K = [q·y, q a k]_K for q in T(Q), k in K; the sets form an inverse system with right translations by T(A_f). For sigma in Gal(Qbar/E) choose s in the ideles of E with art_E(s) = sigma on E^ab, let r(s) = (r(s)_inf, r(s)_f) be its image under the multiplicative reflex norm r(T,mu) of V4, and put sigma[y,a]_K = [r(s)_inf·y, r(s)_f·a]_K (Milne, formula (64)). This is a continuous action independent of s, compatible with transitions and translations; the canonical model M_K(T,Y,mu) is the finite étale E-scheme attached to this Galois set. When Y is one point and mu = mu_h it is the V4 torus model of the strict torus datum (T,{h}); in general it is not: for (G_m,{±1}) and K = 1+N Zhat it is mu_N^prim, whereas the strict datum gives Spec of the real subfield of Q(zeta_N).

**Hypotheses.**

- T is a Q-torus; Y is a nonempty finite set with a transitive T(R)-action factoring through T(R)/T(R)^+ (Milne, zero-dimensional Shimura varieties, pp.62–63).
- mu is a cocharacter of T_C defined over the number field E ⊂ C; r(T,mu) is the multiplicative reflex norm of V4 (Milne (60) with the product correction E5) and art_E is the Artin map in the V4 normalization.
- K ranges over compact open subgroups of T(A_f).

**Proof route.**

1. Finiteness: T(Q)∖T(A_f)/K is finite (Milne 5.22) and Y is finite.
2. Independence of s: two choices differ by an element of the kernel of art_E, the closure of E^× times the identity component at infinity; r(E^×) lies in T(Q), which acts trivially on the double quotient, r of the identity component lies in T(R)^+, which acts trivially on Y, and K is open, so the closure does not matter. The action factors through Gal(E^ab/E) and through a finite quotient.
3. Transitions [y,a]_K -> [y,a]_K′ for K ⊂ K′ and translations [y,a] -> [y,ag] commute with the action because T is commutative; apply the PR81 0D equivalence between finite étale E-schemes and finite continuous Galois sets to obtain the models and their E-morphisms.
4. For Y a point, (64) reduces to (62) for the special pair (T,h), because T(R) fixes h; this is the V4 torus model.

**Prerequisites.** `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/reciprocity-finite-action`, `ShimuraVarieties:V4/torus-model`, `ShimuraData:D5/torus-datum`, `tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions`.

**Source match.**

- milne-svi, §5, Zero-dimensional Shimura varieties and the GL2 example, pp.62–63: Defines Sh(T,Y) for a finite set Y with transitive T(R)/T(R)^+-action, extending Deligne's one-point torus data; the GL2 example gives (Z/NZ)^× ≅ Gal(Q[zeta_N]/Q).
- milne-svi, §13, The Galois action on the connected components, formula (64), p.119: Formula (64) defines the canonical model of a zero-dimensional Shimura variety.

**Acceptance checks.**

- For (G_m,{±1}) with mu(z)=z and K = 1+N Zhat the set has phi(N) points and Galois acts through the cyclotomic character (Milne p.125): the model is Spec Q[z]/Phi_N(z).
- Complex conjugation acts on Y={±1} by the sign of r(s)_inf; a one-point Y cannot record it.

**Uses.**

- Milne SVI §5, p.63 and §13, (64), p.119: pi_0 of Sh_K(G,X) is the zero-dimensional Shimura variety Sh_{nu(K)}(T,Y), and (64) gives its canonical model.
- ShimuraVarieties:V8/gl2-determinant-pairing: the target of the determinant at level det K(N) is Sh(G_m,{±1}) ≅ mu_N^prim.
- Pink 12.8 and 12.10 (the datum (G_m,Q,H_0)): the quotient (GL2,H±)/SL2 in the codimension-one construction is a two-point zero-dimensional datum, whose canonical model is this one.

**API.**

- `ZeroDimShimura.shimuraSet` (data): Sh_K(T,Y) = T(Q)∖(Y × T(A_f))/K, the quotient of Y × T(A_f) by (y,a) ~ (q·y, q a k), q in T(Q), k in K.
- `ZeroDimShimura.mk` (constructor): The class [y,a]_K of y in Y and a in T(A_f).
- `ZeroDimShimura.mk_eq_mk` (characterisation): [y,a]_K = [y′,a′]_K if and only if y′ = q·y and a′ = q a k for some q in T(Q) and k in K.
- `ZeroDimShimura.map` (functoriality): For K ⊂ K′ the transition [y,a]_K -> [y,a]_K′, with map_id and map_comp.
- `ZeroDimShimura.singletonEquiv` (compatibility): For Y a point, Sh_K(T,Y) is T(A_f)/(T(Q)K), the finite Shimura set of the V4 torus datum.
- `ZeroDimShimura.galoisAct` (structure): Formula (64): sigma[y,a]_K = [r(s)_inf·y, r(s)_f·a]_K; independent of s, continuous, compatible with map and translations.
- `ZeroDimShimura.canonicalModel` (other): The finite étale E-scheme attached to the Galois set (Sh_K(T,Y), galoisAct) by PR81 0D; its Qbar-points are Sh_K(T,Y) with this action.

**Unit tests.** These contracts must be checked against the actual construction;
the suggested examples expose only the currently expressible part.

- `ZeroDimShimura.test_gl2_components` (computation): For T = G_m, Y = R^×/R_{>0} ≅ {±1} and K = 1+N Zhat, Sh_K(T,Y) ≅ (Z/NZ)^×, which has phi(N) elements (Milne p.63).
- `ZeroDimShimura.test_strict_datum_halves` (non-example): With Y replaced by one point (the strict datum (G_m,{det∘h}) of ShimuraData D5) the same level gives Q^×∖A_f^×/K ≅ (Z/NZ)^×/{±1}, with phi(N)/2 elements for N >= 3; at N = 3 it is a single point, whereas mu_3^prim has two geometric points.
- `ZeroDimShimura.test_singleton` (compatibility): For Y a point, Sh_K(T,Y) is T(A_f)/(T(Q)K), the set underlying the V4 torus model.
- `ZeroDimShimura.test_maximal_level` (degenerate): For T = G_m, Y = {±1} and K = Zhat^×, Sh_K(T,Y) is one point (Q_{>0}·Zhat^× = A_f^×), with model Spec Q.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Galois action on connected components

**ID:** `ShimuraVarieties:V8/component-reciprocity`. **Kind:** theorem. **Proposed name:** `CanonicalModel.component_map_defined_over_reflex`.

Let D=(G,X) be a pure Shimura datum with G^der simply connected, nu: G -> T = G/G^der, T(R)^† the image of Z(R) and Y = T(R)/T(R)^† (Milne (34)), and mu = nu∘mu_x, which is independent of x in X and defined over E = E(D). For actual canonical models M_K over E, the complex map Sh_K(G,X) -> Sh_{nu(K)}(T,Y), [x,a]_K -> [y(x), nu(a)], with y: pi_0(X) -> Y induced by nu, descends uniquely to an E-morphism M_K -> M_{nu(K)}(T,Y,mu) into the canonical model of zero-dimensional-shimura-variety. For K as in Milne 5.17 (in particular every K(N) for GL2) its geometric fibres are the connected components, so it identifies pi_0(M_K ⊗_E C) with Sh_{nu(K)}(T,Y) compatibly with the Galois action (64). It commutes with level maps and with right translation by g in G(A_f), acting on the target by nu(g).

**Hypotheses.**

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- G^der is simply connected; for the pi_0 bijection K is as in Milne 5.17 (sufficiently small, or K(N) for GL2).

**Proof route.**

1. Over C the map is well defined and, for K as in Milne 5.17, induces a bijection on connected components (V0's component decomposition).
2. For a special pair (T0,x0) and sigma fixing E(x0), (62) gives sigma[x0,a] = [x0, r_{x0}(s′)a]. Functoriality of reflex norms (V4) gives nu∘r(T0,mu_{x0}) = r(T,mu)∘Nm_{E(x0)/E}, compatible with the Artin maps; T0(R) fixes x0 (Milne 12.6), so the archimedean component of r(T,mu)(Nm s′) fixes y(x0). Hence the map commutes with sigma on the Hecke orbit of x0, which is dense (Milne 13.5): it is fixed by Aut(C/E(x0)) (Milne footnote 73).
3. Take x1 with E(x1) linearly disjoint from the normal closure of E(x0) over E (disjoint-special-reflex-fields); as in translation-descent, the map is defined over E(x0) ∩ E(x1) = E, uniquely by faithful base change (R09.3). Compatibility with level maps and translations holds over C and descends.

**Prerequisites.** `ShimuraVarieties:V8/zero-dimensional-shimura-variety`, `ShimuraVarieties:V8/disjoint-special-reflex-fields`, `ShimuraVarieties:V0/component-decomposition`, `ShimuraVarieties:V0/simply-connected-components`, `ShimuraVarieties:V4/canonical-model`, `ShimuraVarieties:V4/reflex-norm`, `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V4/hecke-density`, `ShimuraVarieties:V4`, `ShimuraData:D4/special-pair`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Source match.**

- milne-svi, §13, The Galois action on the connected components, (64) and footnote 73, p.119: pi_0 of the canonical model is the canonical model of Sh(T,Y); footnote 73 gives the special-point argument.
- milne-svi, (34) and Theorem 5.17, p.59: The complex component set is the zero-dimensional Shimura variety when G^der is simply connected.

**Acceptance checks.**

- For GL2 at K(N), N >= 3, the target has phi(N) points and the fibres are the fixed-pairing curves of gl2-fixed-pairing-fibre.
- Complex conjugation interchanges the two components H^+ and H^- over a fixed level class: the target must use Y = {±1}, not the one-point torus datum.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Abelian-type tower from V6

**ID:** `ShimuraVarieties:V8/abelian-instance`. **Kind:** application. **Proposed name:** `CanonicalTower.abelian_type`.

Applying the preceding canonical-model functoriality theorems to the models constructed by V6 produces the finite-level abelian-type tower, translations, finite maps, Hecke spans and datum functoriality. No premise imports V7 or V8.general.

**Hypotheses.**

- D is of abelian type in D4; V6 supplies actual models satisfying V4.

**Proof route.**

1. Supply the V6 construction to translation-descent and level-tower.
2. Use model-uniqueness to identify choices of Hodge-type covers and component descent.
3. Use the same finite-level and datum-morphism statements; do not identify entire varieties merely because derived groups are isogenous.

**Prerequisites.** `ShimuraVarieties:V6/abelian-canonical`, `ShimuraVarieties:V8/level-tower`, `ShimuraVarieties:V8/model-uniqueness`, `ShimuraVarieties:V8/hecke-span`, `ShimuraVarieties:V8/datum-functoriality`.

**Source match.**

- milne-svi, 14.15–14.16 and the paragraph after them, p.127; 13.7, p.119: Specialize the conditional V8 results to V6, rather than replaying the V6 existence proof. On p.127 the second citation “(14.16)” should read (14.15); see E9.

**Acceptance checks.**

- GL2 is the genus-one GSp case, supplied through V5/V6.
- There is no dependency path from this node to V7.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Canonical reciprocity for full elliptic level

**ID:** `ShimuraVarieties:V8/gl2-moduli-reciprocity`. **Kind:** theorem. **Proposed name:** `GL2Modular.full_level_is_canonical`.

For N>=3, the Q-scheme Y_full(N)_Q representing elliptic curves with an ordered full N-basis, with the complex identification supplied by R12.1/R12.2 and M3, satisfies the actual GL2 special-pair canonical-model condition of V4. The Galois action includes the Weil pairing and acts on the entire full-level model, not only a chosen cyclotomic fibre.

**Hypotheses.**

- N>=3; GL2 datum is the standard homology-weight minus one datum of D5.
- The fine generic-fibre full-level moduli scheme and analytic comparison are the suppliers' actual constructions.

**Proof route.**

1. Identify GL2=GSp2 and an elliptic curve with its canonical principal polarization. PELModuli M5 supplies the genus-one comparison of the Siegel moduli with PR81's Y_full(N), including the determinant/Weil-pairing convention; M3/R12.1 compare homology, Tate modules and the ordered level basis with the V3 complex variety.
2. V5 supplies normalized CM reciprocity on the elliptic special pairs and their Tate levels; M4 verifies that the constructed genus-one moduli model has that Galois action.
3. Apply V4 Artin-convention conversion, including the field of definition of each special point. A geometric-point bijection alone is insufficient to identify the Q-scheme.

**Prerequisites.** `ShimuraData:D5/gl2-datum`, `ShimuraData:D3/reflex-field`, `ShimuraVarieties:V4/canonical-model`, `ShimuraVarieties:V4/geometric-artin`, `ShimuraVarieties:V5/main-cm`, `ShimuraVarieties:V5/cm-polarization-level`, `ShimuraVarieties:V5/siegel-special-cm`, `ShimuraVarieties:V5/siegel-canonical`, `PELModuli:M3`, `PELModuli:M4`, `PELModuli:M5`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.2`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.

**Source match.**

- milne-svi, 6.3, pp.70–71; 6.11, p.74; 14.12, p.125: The symplectic/abelian moduli description and normalized CM action certify the genus-one canonical condition.

**Acceptance checks.**

- Use the actual special torus for an elliptic CM curve and compare its normalized Artin action on the ordered basis.
- Full level two is excluded: the residual minus-one automorphism preserves all two-torsion.

**Library placement.** TauCeti/Geometry/Shimura/ModularComparison, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Full-level modular curve comparison over Q

**ID:** `ShimuraVarieties:V8/gl2-full-level`. **Kind:** theorem. **Proposed name:** `GL2Modular.full_level_iso`.

For N>=3, there is a unique Q-isomorphism Sh_{K(N)}(GL2,H±) -> Y_full(N)_Q inducing the supplied complex uniformization. Here K(N)=ker(GL2(Zhat)->GL2(Z/N)). The source is the actual V5/V6 canonical model and the target is the PR81 fine full ordered-basis scheme.

**Hypotheses.**

- N>=3; full H± datum and principal adelic level; no chosen primitive root is incorporated into the Q-scheme.

**Proof route.**

1. Use gl2-moduli-reciprocity and model-uniqueness to descend the complex moduli identification to a Q-isomorphism.
2. Use the existing AA.5 principal-level component calculation and R12.2 comparison to identify its complex effect with the double-quotient formula.
3. Verify compatibility with the universal elliptic family/level interpretation through M3.

**Prerequisites.** `ShimuraVarieties:V8/gl2-moduli-reciprocity`, `ShimuraVarieties:V8/model-uniqueness`, `ShimuraVarieties:V8/abelian-instance`, `AdelicAlgebraicGroups:AA.5/gl2-principal-level`, `ModularCurvesPartII:R12.2`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.

**Source match.**

- milne-svi, 6.3, pp.70–71; 6.11, p.74; 13.7(a), p.119: The moduli description followed by canonical-model uniqueness gives a scheme isomorphism over Q.
- pink, 10.9, p.175; 12.9, p.200 (author-typeset version): Genus-one full-level model is the arithmetic base case.

**Acceptance checks.**

- At N=3 the full curve has two geometric pairing components; it is not identified with a single Gamma(3) quotient.
- At N=4 there are phi(4)=2 pairing components; composite levels are covered without Layer 10.

**Library placement.** TauCeti/Geometry/Shimura/ModularComparison, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Determinant is the Weil-pairing morphism

**ID:** `ShimuraVarieties:V8/gl2-determinant-pairing`. **Kind:** comparison. **Proposed name:** `GL2Modular.det_eq_weil_pairing`.

Let nu = det: GL2 -> G_m, T = G_m, Y = R^×/R_{>0} ≅ {±1} (Milne (34): T(R)^† = R_{>0}, T(Q)^† = Q_{>0}) and mu = det∘mu_x. Under full_level_iso, the Q-morphism of component-reciprocity, Sh_{K(N)}(GL2,H±) -> Sh_{det K(N)}(G_m,{±1}), is identified over Q with the PR81 determinant det_N: Y_full(N)_Q -> mu_N^prim, (E,P,Q) -> e_N(P,Q). Here det K(N) = ker(Zhat^× -> (Z/N)^×), Sh_{det K(N)}(G_m,{±1}) ≅ (Z/N)^× with Galois acting through the cyclotomic character, and its canonical Q-model is mu_N^prim = Spec Q[z]/Phi_N(z), not the constant disjoint union of phi(N) Q-points. The strict one-point torus datum (G_m,{det∘h}) of ShimuraData D5 is not the target: at this level its Shimura set is (Z/N)^×/{±1}, with model the spectrum of the real subfield of Q(zeta_N).

**Hypotheses.**

- N>=3; choose the analytic reference basis so that its pairing is the reference primitive root calibrated by R12.1; use the V4 normalization of the Artin map and reflex norm.

**Proof route.**

1. component-reciprocity (G^der = SL2 is simply connected) gives the Q-morphism to the canonical model of Sh_{det K(N)}(G_m,{±1}); zero-dimensional-shimura-variety identifies that set with (Z/N)^× (Milne p.63) and its Galois action (64) with the cyclotomic character (Milne p.125), so the model is mu_N^prim. AA.5 supplies the determinant-indexed components.
2. For a level eta, Milne 6.3 sends the moduli object to [ah, a∘eta]; the determinant records the multiplier of the alternating pairing. R12.1/R12.2 and PELModuli M5 identify that multiplier with the exponent of e_N(P,Q) relative to the calibrated reference root.
3. Both are Q-morphisms Y_full(N)_Q -> mu_N^prim agreeing on complex points; equality descends by faithful base change (R09.3).

**Prerequisites.** `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/component-reciprocity`, `ShimuraVarieties:V8/zero-dimensional-shimura-variety`, `ShimuraVarieties:V4/geometric-artin`, `AdelicAlgebraicGroups:AA.5/gl2-principal-level`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.2`, `PELModuli:M5`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Source match.**

- milne-svi, §13, The Galois action on the connected components, (64), p.119; §14, Siegel proof, p.125: Determinant-component Galois action.
- milne-mf, 8.7, p.100 (root normalization corrected): The fixed-pairing condition; the chosen analytic reference root must be calibrated.
- milne-svi, §5, Zero-dimensional Shimura varieties, GL2 example, p.63: pi_0(Sh_K(N)) is T(Q)∖{±1} × A_f^×/(1+N Zhat)^× ≅ (Z/NZ)^×, using Y = {±1}, not a one-point torus datum.

**Acceptance checks.**

- For N=3 the primitive-root model is Spec Q[z]/(z^2+z+1), geometrically two points with nontrivial conjugation.
- A determinant-one basis change preserves the pairing; a determinant-u change raises it to the u-th power.
- With the one-point torus datum the N = 3 target would be a single Q-point, since (Z/3)^×/{±1} is trivial; the correct target has two geometric points.

**Library placement.** TauCeti/Geometry/Shimura/ModularComparison, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Fixed-pairing fibre over a primitive root

**ID:** `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`. **Kind:** comparison. **Proposed name:** `GL2Modular.fixed_pairing_fibre_iso`.

For N>=3 and a primitive Nth root zeta in C, base change full_level_iso to Q(zeta) and take the scheme-theoretic fibre of its determinant/Weil-pairing map at zeta. This is an isomorphism to Y(N,zeta) over Q(zeta). Its complex analytification is Gamma(N)∖H, and the fibre is geometrically connected and geometrically irreducible using the open comparison R12.4.

**Hypotheses.**

- The fibre is formed after cyclotomic base change; its scalar extension to C uses the chosen embedding Q(zeta)->C.

**Proof route.**

1. Use gl2-determinant-pairing and the functoriality of fibre products to restrict full_level_iso.
2. Apply R12.1/R12.2 fixed-pairing uniformization with the calibrated basis: if zeta=zeta_ref^u, replace the first standard torsion generator by u times it.
3. Import R12.4 open connectedness and smooth-curve irreducibility. This has no compactification prerequisite.

**Prerequisites.** `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.4`, `ComplexComparisonPartII:C0/repair-analytification`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`, `mathlib:CategoryTheory.Over.pullback`.

**Source match.**

- milne-mf, 8.7–8.8, p.100: Fixed-pairing complex uniformization and cyclotomic model, with the normalization issue recorded.
- milne-svi, 5.17, pp.59–61; connected components in section 13, p.119: The determinant separates full-level components.

**Acceptance checks.**

- Y_full(3)_C has two components whereas Y(3,zeta)_C has one.
- Taking a fibre over Q without adjoining zeta is not a fibre at a Q-rational primitive root for N>2.

**Library placement.** TauCeti/Geometry/Shimura/ModularComparison, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Row-basis and adelic right actions

**ID:** `ShimuraVarieties:V8/gl2-row-basis-dictionary`. **Kind:** comparison. **Proposed name:** `GL2Modular.row_basis_right_translation`.

For N>=3 and u in GL2(Zhat) with reduction [[a,b],[c,d]], right translation [x,A]->[x,A u] corresponds under full_level_iso to (P,Q)->(aP+cQ,bP+dQ). The Weil pairing changes by exponent det(u mod N), so this map sends Y(N,zeta) to Y(N,zeta^{det u}). General finite-adelic g is compared through the two isogeny legs at the intersection level, not by pretending g has an integral reduction.

**Hypotheses.**

- The source K(N) is normalized by GL2(Zhat); full-level bases use the PR81 row convention.

**Proof route.**

1. Write the level as eta:V(A_f)->V_f(E). Milne 6.3 identifies it with [ah,a eta]. Replacing eta by eta composed with u changes a eta to (a eta)u.
2. Evaluate precomposition on the two standard column generators: columns of u give aP+cQ and bP+dQ. Thus the ordered basis is a row with right multiplication.
3. Use PR81 Weil-pairing bilinearity for the determinant exponent. For nonintegral g use R12.5 isogeny/Hecke comparison and the actual intersection-level span.

**Prerequisites.** `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/translation-laws`, `ShimuraVarieties:V8/hecke-span`, `ModularCurvesPartII:R12.5`, `tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing`.

**Source match.**

- milne-svi, 6.3, pp.70–71: The literal level-map orientation fixes the right-action convention; use the corrected arrow directions in the proof.
- pr81, Conventions, item 5: Full level and actions: The native row-basis convention to which the canonical model is compared.

**Acceptance checks.**

- For u=[[1,1],[0,1]] the basis goes to (P,P+Q), not (P+Q,Q).
- For u=[[0,1],[-1,0]] the basis goes to (-Q,P); determinant is one and pairing stays fixed.
- For diag(v,1), pairing is raised to v and the component changes unless v=1 mod N.

**Library placement.** TauCeti/Geometry/Shimura/ModularComparison, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Gamma-one modular curve comparison

**ID:** `ShimuraVarieties:V8/gl2-gamma1`. **Kind:** comparison. **Proposed name:** `GL2Modular.gamma1_iso`.

For N>=4, the canonical Q-scheme at K1(N)={u in GL2(Zhat):u e1=e1 mod N} is Q-isomorphic to the fine curve Y1(N)_Q representing (E,P) with P of exact order N. The comparison is induced by the full-level forgetful map and preserves its specified point and its complex Gamma1(N) uniformization.

**Hypotheses.**

- N>=4; K1 fixes e1 (first column), so the row convention retains P.

**Proof route.**

1. Choose a full principal level M divisible by N with M>=3 and pass to the finite quotient of its level problem by the stabilizer of the chosen N-point.
2. Use finite-level-maps and the PR81/R12.2 fine quotient comparison to descend full_level_iso. Exact moduli representability at N>=4 eliminates automorphisms.
3. Use R12.5/R12.6 to match forgetful and diamond morphisms over Q.

**Prerequisites.** `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8/gl2-row-basis-dictionary`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R12.6`, `tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Source match.**

- pr81, Layer 5A: Tate normal form and Y1(N) for N>=4: Imports the actual fine-moduli qualification rather than extending it to levels two or three.
- milne-svi, 5.29 and 13.7, pp.65,119: Canonical finite-level quotient and uniqueness.

**Acceptance checks.**

- At N=4 a point of exact order four excludes the residual minus-one automorphism.
- At N=1,2 the comparison cannot be labelled a fine universal elliptic scheme.

**Library placement.** TauCeti/Geometry/Shimura/ModularComparison, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Gamma-zero coarse modular curve comparison

**ID:** `ShimuraVarieties:V8/gl2-gamma0`. **Kind:** comparison. **Proposed name:** `GL2Modular.gamma0_coarse_iso`.

For N>0, the canonical Q-scheme at K0(N)={u in GL2(Zhat):u preserves the line (Z/N)e1} is Q-isomorphic to the coarse curve Y0(N)_Q for elliptic curves with a cyclic order-N subgroup. At N=1 this is the j-line. The assertion is an isomorphism of coarse schemes, not fine representability or a bijection with rational isomorphism classes over every field.

**Hypotheses.**

- Characteristic zero generic fibre; N positive. The cyclic-subgroup problem and its coarse space are the actual PR81 constructions.

**Proof route.**

1. Choose full M-level with N dividing M and M>=3; use the subgroup stabilizer and its finite coarse quotient.
2. Compare this quotient with the canonical finite-level quotient from finite-level-maps, via gl2-full-level and the first-column convention.
3. Use PR81 9E and R12.2/R12.6 to identify the coarse scheme and its analytic quotient.

**Prerequisites.** `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8/gl2-row-basis-dictionary`, `ModularCurvesPartII:R12.2`, `ModularCurvesPartII:R12.6`, `tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients`.

**Source match.**

- milne-mf, 8.6, p.100: Coarse characteristic-zero comparison; universal-family claims are deliberately excluded.
- pr81, Layer 9E: the coarse j-line and Y0(N): The supplier of the coarse scheme, retaining elliptic stabilizers.

**Acceptance checks.**

- For N=1 the j-line has elliptic objects with automorphisms; it is not a fine scheme with a universal elliptic curve.
- For N=6 use the general coarse construction, not the prime diamond-quotient theorem of Layer 10.

**Library placement.** TauCeti/Geometry/Shimura/ModularComparison, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Minimal compactification of the full modular curve

**ID:** `ShimuraVarieties:V8/gl2-compact-model`. **Kind:** comparison. **Proposed name:** `GL2Modular.minimal_compact_iso`.

For N>=3 the independently constructed proper normal coarse compact curve X_full(N)_Q from R13.4a, with its specified open Y_full(N)_Q, is the E=Q-model of the complex Baily–Borel minimal compactification for the GL2 principal-level datum, via the open isomorphism full_level_iso. This is the genus-one arithmetic compactification base case, constructed without assuming the general minimal-descent theorem.

**Hypotheses.**

- N>=3; the full and composite levels use the R13.4a construction. PR81 Layer 10 (prime N>=5 diamond quotients with H <= (Z/N)^×/{±1}) is not used here and supplies no full-level model.

**Proof route.**

1. R13.4a constructs the proper normal coarse compactification from generalized elliptic curves; R12.3 identifies its C-model with the independently constructed analytic modular compactification.
2. Use the full-level open comparison to specify the complex Baily–Borel identification and hence an actual Q-model containing the canonical open.
3. Normal proper-curve extension gives uniqueness. R13.4b certifies the generic-fibre component and cusp bookkeeping; it is not the source of R12.4 open connectedness.

**Prerequisites.** `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V2/baily-borel`, `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R13.4b`, `ComplexComparisonPartII:C4/repair-proper-morphism-algebraicity`.

**Source match.**

- pink, 12.9, p.200: Uses the independent generalized-elliptic compact model to descend GL2 before the general compactification proof.
- pink, 10.20–10.21, pp.183–184: The complex compact comparison and cusp formal model.

**Acceptance checks.**

- The level N=6 full compact model is supplied by R13.4a; prime-only Layer 10 cannot provide it.
- Boundary is the scheme-theoretic complement, not a hand-selected set of complex cusp points.

**Library placement.** TauCeti/Geometry/Shimura/ModularComparison, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Arithmetic codimension-one partial compactification

**ID:** `ShimuraVarieties:V8/codim-one-extension`. **Kind:** theorem. **Proposed name:** `CanonicalModel.codim_one_extension`.

Let D=(G,X) be a pure Shimura datum with actual canonical models and K neat. Let M_K(C)^+ ⊂ M_K(C)^min be the union of M_K(C) with the boundary strata of codimension one (Pink 8.2): it is smooth, its boundary is a smooth divisor and its complement in M_K(C)^min has codimension at least two. Then M_K(C)^+ has a unique normal E(D)-model M_K^+ containing the canonical model M_K as a dense open subscheme. The codimension-one strata come from the Q-simple factors of G^ad isomorphic to PGL2,Q, through surjections G -> PGL2,Q. When such a surjection lifts to a morphism (G,X) -> (GL2,H±), the corresponding partial extension is the scheme-theoretic closure of M_K in M_K′(G′,X′) ×_E (X_full(N)_Q ⊗ E) for (G′,X′) = (G,X)/SL2,Q (Pink 2.9), using gl2-compact-model; otherwise it is the quotient by a finite group of the corresponding extension for G̃ = G ×_{PGL2} GL2. The construction uses no torus torsor or mixed toroidal input (Pink 12.8 and ShimuraCompactifications C2 concern mixed data).

**Hypotheses.**

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The auxiliary data (G,X)/SL2,Q and (G̃,X̃) of Pink 12.10 also carry actual canonical models; in the abelian-type lane their membership in the V5/V6 class is the recorded auxiliary-class gap.
- K is neat and the auxiliary levels are chosen as in Pink 12.10, so that the complex closed-immersion and finite-quotient statements of the recorded complex functoriality gap apply.

**Proof route.**

1. V2 and C1: the codimension-one boundary strata of M_K(C)^min belong to the rational boundary components whose parabolic is the preimage of a Borel subgroup under some G -> PGL2,Q; M_K(C)^+ is smooth with smooth boundary divisor (Pink 8.2). The strata of distinct factors are disjoint, so M_K^+ is glued along M_K from one partial extension per factor.
2. Lifted case (Pink 12.10, first paragraph): PGL2,Q lifts to an almost direct factor SL2,Q of G^der and (G,X) embeds in (G′,X′) × (GL2,H±), with E(G,X) = E(G′,X′) because E(GL2,H±) = Q. The product of the canonical model of (G′,X′) with X_full(N)_E (gl2-compact-model) is an E-model of the corresponding product partial compactification. By the complex closed-immersion statement, M_K(C)^+ is the closure of M_K(C) there; take the scheme-theoretic closure over E of the image of the descended embedding (datum-functoriality); closure commutes with the flat base change E -> C (R09.5) and closed subschemes descend (R09.3).
3. General case (Pink 12.10, second paragraph): G̃ = G ×_{PGL2} GL2 lifts, E(G̃,X̃) = E(G,X), and the complex map M_K̃(G̃,X̃)(C)^+ -> M_K(C)^+ is finite surjective (H^1(A,G_m) = 0); define M_K^+ as the finite quotient of the lifted extension (finite-level-maps, R09.5), which exists by quasi-projectivity. Uniqueness: a normal model containing the dense open M_K is unique (Pink 12.6).

**Prerequisites.** `ShimuraVarieties:V8/gl2-compact-model`, `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/model-uniqueness`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V2/rational-boundary`, `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V2`, `ShimuraCompactifications:C1`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `mathlib:AlgebraicGeometry.IsOpenImmersion`.

**Source match.**

- pink, 12.10, pp.200–201 (author-typeset version): The lifted and general cases of the codimension-one extension for reductive P, using 12.9 for GL2, descent of closed subschemes and a finite quotient.
- pink, 8.2, p.132: Definition and properties of the partial compactification M^+(C).
- pink, 12.9, p.200: The GL2 case is the compactified moduli of generalized elliptic curves, supplied here by gl2-compact-model.

**Acceptance checks.**

- For G = GL2 itself, (G′,X′) is the two-point datum (G_m,{±1}) and M_K^+ = X_full(N)_Q, agreeing with gl2-compact-model.
- If no Q-simple factor of G^ad is PGL2,Q (for example Hilbert modular data over F ≠ Q), M_K^+ = M_K.
- No prerequisite on ShimuraCompactifications:C0 torus embeddings or C2 is allowed.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Reflex-field descent of the minimal compactification

**ID:** `ShimuraVarieties:V8/minimal-descent`. **Kind:** theorem. **Proposed name:** `CanonicalModel.minimal_defined_over_reflex`.

For a pure datum D with actual canonical open models, its normal projective complex Baily–Borel compactification M_K,C^min has a unique projective normal E(D)-model containing M_K and inducing the specified complex compactification. The theorem is for the same datum class as the supplied open models. Its construction must exhibit effective descent, not infer it solely from uniqueness of an open model.

**Hypotheses.**

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The complex functoriality and auxiliary-class inputs of codim-one-extension, recorded as gaps, are supplied.

**Proof route.**

1. At neat level, codim-one-extension gives the normal E-model M_K^+ of M_K(C)^+: the open part with the codimension-one boundary strata, smooth with smooth boundary divisor and complement of codimension at least two in M_K(C)^min (Pink 8.2, 12.10).
2. On M_K^+ the sheaf omega[dlog] of top differentials with logarithmic poles along the boundary divisor is defined over E, and its global sections commute with the flat base change E -> C (R09.3). V2 (Pink 8.2, Baily–Borel 10.11): for n large, omega[dlog]^n is generated by global sections on M_K(C)^+ and the induced map extends to a closed embedding of M_K(C)^min.
3. Define M_K^min as the closure of M_K^+ in the projective space of Gamma(M_K^+, omega[dlog]^n) over E (Pink 12.12). Closure commutes with E -> C (R09.5), so its base change is M_K(C)^min; normality and projectivity descend.
4. Remove neatness by finite quotients (finite-level-maps, R09.5; Pink 12.6). Uniqueness: two normal models agreeing on the dense open M_K agree (Pink 12.6, normality and descent of morphisms).

**Prerequisites.** `ShimuraVarieties:V8/codim-one-extension`, `ShimuraVarieties:V2/automorphic-finite-generation`, `ShimuraVarieties:V2/baily-borel`, `ShimuraVarieties:V2/koecher`, `ShimuraVarieties:V2`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `ShimuraVarieties:V8/model-uniqueness`, `ShimuraVarieties:V8/finite-level-maps`, `AlgebraicModuliForArithmeticGeometry:R09.3`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `mathlib:AlgebraicGeometry.IsProper`, `mathlib:AlgebraicGeometry.IsOpenImmersion`.

**Source match.**

- pink, 12.3(a), p.197; 12.6–12.7, pp.198–199; 12.10, pp.200–201; 12.12, p.202: The codimension-one extension and intrinsic logarithmic line make arithmetic descent effective.
- pink, 8.2, pp.132–133: The relevant ample line is the top logarithmic differential, built from complex BB geometry, not B1 canonical automorphic bundles.

**Acceptance checks.**

- When no codimension-one boundary occurs, M_K^+ = M_K and Koecher's principle makes the sections those of automorphic forms without growth condition; the closure argument is unchanged.
- For GL2 the construction agrees with gl2-compact-model.
- No prerequisite on AutomorphicBundles:B1, ShimuraCompactifications:C0 torus embeddings or C2 is allowed.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Functoriality on minimal compactifications

**ID:** `ShimuraVarieties:V8/minimal-map-extension`. **Kind:** theorem. **Proposed name:** `CanonicalModel.minimal_map_extension`.

Every descended translation T_g and every admissible datum morphism has a unique extension between the corresponding minimal models over the same reflex field or specified compositum. The extensions preserve identity and composition and agree with complex Baily–Borel functoriality. In particular level maps and both Hecke legs extend. Extended level maps are finite where the complex finite-quotient theorem proves finiteness; no general étaleness across the boundary is asserted.

**Hypotheses.**

- D=(G,X) is a pure Shimura datum; E=E(D) is embedded in C.
- Each model M_K is an actual finite-type normal separated E-scheme with a specified complex comparison to V3, satisfying the special-pair reciprocity condition of V4. Existence is supplied by V5 or V6 in the abelian-type lane, or V7 in the general lane.
- The complex extension theorem is supplied by V2/V3 with its applicable level/datum hypotheses.

**Proof route.**

1. Use minimal-descent for the source and target and V2/V3 for the complex extension.
2. On the schematically dense open, descent agrees with the known arithmetic map. Separatedness and reducedness give equality of conjugates on the whole source.
3. Apply descent of morphisms and faithful base change; finite level extensions inherit finiteness by descent. The same argument proves coherence of compositions.

**Prerequisites.** `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/translation-laws`, `ShimuraVarieties:V8/hecke-span`, `ShimuraVarieties:V2/minimal-level-extension`, `ShimuraVarieties:V2`, `ShimuraVarieties:V3/algebraic-data-maps`, `ShimuraVarieties:V3/finite-quotient-algebraization`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Source match.**

- pink, 12.3(b), p.197; 12.6, p.198: Functoriality follows only after the arithmetic compactification objects have been constructed.

**Acceptance checks.**

- A level map may ramify at cusps even when its restriction to neat opens is étale.
- Restricting an extended correspondence to the open recovers the same ordered Hecke span.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Modular cusp loci and Tate parameters

**ID:** `ShimuraVarieties:V8/gl2-cusps-tate`. **Kind:** comparison. **Proposed name:** `GL2Modular.cusp_tate_comparison`.

The GL2 minimal/modular compact comparison identifies the cusp subschemes, their residue fields and their formal neighborhoods with the generalized-elliptic/Tate charts of R12.3/R12.6/R13.4b. At a chosen complex cusp of width w, the local analytic coordinate is q_c=exp(2 pi i z/w), with q=exp(2 pi i z)=q_c^w after a chosen cusp representative. Over the supplier's cusp residue field, the completed local ring of the normal curve is k(c)[[q_c]], using its chosen Tate parameter; changes of cusp representative introduce the specified roots of unity.

**Hypotheses.**

- N>=3 for full fine open level; other levels use their stated coarse curve and cusp stabilizers. Choose a cusp label, uniformizer and field embedding; no universal Q-rationality assertion.

**Proof route.**

1. Compare the scheme boundary by extension of the open isomorphism and R13.4b boundary identification.
2. Import R12.3 width/parameter computation and R12.6 cusp Galois fields, then match them with R13.4b formal Tate charts.
3. Use R12.1 normalization to identify the analytic exponential with the chosen Tate parameter, including roots of unity under changed representatives.

**Prerequisites.** `ShimuraVarieties:V8/gl2-compact-model`, `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`, `ModularCurvesPartII:R12.1`, `ModularCurvesPartII:R12.3`, `ModularCurvesPartII:R12.6`, `ModularCurvesPartII:R13.4b`, `ComplexComparisonPartII:C0/repair-analytification`.

**Source match.**

- pink, 10.21–10.22, pp.184–185; 12.9, p.200: The formal cusp comparison is an arithmetic deformation/Tate statement, not just an equality of complex points.

**Acceptance checks.**

- At the infinity cusp of full principal level N, width is N and q=q_c^N.
- A different cusp label can have a nontrivial residue-field action; replacing the cusp scheme by a constant Q-set loses this information.

**Library placement.** TauCeti/Geometry/Shimura/ModularComparison, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### Compatibility of modular and canonical correspondences

**ID:** `ShimuraVarieties:V8/gl2-tower-compatibility`. **Kind:** comparison. **Proposed name:** `GL2Modular.tower_compatibility`.

The Q-isomorphisms for full, Gamma1 and Gamma0 levels commute with all admissible level maps and the ordered Hecke isogeny correspondences, with the Weil-pairing component transport dictated by row_basis_right_translation. Their compact extensions commute with the extended finite legs and the cusp/Tate charts. On coefficient sheaves, differential pullback and pull-push normalizations are precisely those of R12.5.

**Hypotheses.**

- Only the stated fine/coarse ranges and supplier's actual Hecke isogeny moduli are used; integral bad-prime models are not inferred.

**Proof route.**

1. R12.5/R12.6 supply the analytic/level/isogeny identities; compare each leg using gl2-full-level, row-basis-dictionary and canonical functoriality.
2. Faithful C-base change gives equality over Q. Apply minimal-map-extension and uniqueness of dense-open extension for the compact diagram.
3. Identify cusp formal maps using gl2-cusps-tate and R13.4b. Import the supplier normalization for differentials rather than redefining the Hecke operator.

**Prerequisites.** `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`, `ShimuraVarieties:V8/gl2-row-basis-dictionary`, `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`, `ShimuraVarieties:V8/hecke-span`, `ShimuraVarieties:V8/minimal-map-extension`, `ShimuraVarieties:V8/gl2-cusps-tate`, `ModularCurvesPartII:R12.5`, `ModularCurvesPartII:R12.6`, `ModularCurvesPartII:R13.4b`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

**Source match.**

- milne-svi, 5.29, pp.65–66; 6.3, pp.70–71; 13.6–13.8, pp.118–119: Arithmetic comparisons intertwine the actual finite-level maps.
- pink, 12.3(b), p.197: The same compatibility persists on minimal compact models.

**Acceptance checks.**

- For an integral unipotent at principal level the first generator stays P and the second becomes P+Q.
- For a nonintegral adelic prime isogeny, compare both legs rather than a putative automorphism of Y_full(N).
- For prime N>=5 diamonds with H <= (Z/N)^×/{±1}, verify the Layer-10 quotient range; use R13.4a for full/composite compact levels.

**Library placement.** TauCeti/Geometry/Shimura/ModularComparison, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### General-data canonical tower

**ID:** `ShimuraVarieties:V8.general/general-tower`. **Kind:** theorem. **Proposed name:** `CanonicalTower.general_data`.

For every pure Shimura datum D and every compact open K, supply the actual canonical models constructed by V7 to V8's conditional functoriality theorems. Obtain the same canonical E(D)-tower, right translations, finite level maps, effective quotients and ordered Hecke correspondences, independent up to the unique comparison of V8 of V7's auxiliary extension and special point. For a datum morphism D -> D′, E(D′) is contained in E(D), so its map is defined over E(D), with the target model extended to that field.

**Hypotheses.**

- V7 has proved conjugation, cocycle, continuity and effective descent and has verified V4 on the resulting models. No placeholder existence witness is substituted.

**Proof route.**

1. Apply the V8 translation, tower and datum-map declarations to V7's actual schemes and comparisons.
2. Apply model-uniqueness to compare auxiliary choices; use its compatibility with maps to obtain the tower identification.
3. Use finite-level-maps and hecke-span with the effective stabilizers from V1. No second proof of canonical functoriality is introduced.

**Prerequisites.** `ShimuraVarieties:V7/general-canonical`, `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/level-tower`, `ShimuraVarieties:V8/model-uniqueness`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8/hecke-span`, `ShimuraVarieties:V8/datum-functoriality`.

**Source match.**

- milne-svi, 12.10, p.115; 13.6–13.8, pp.118–119: V8 applies to actual models independently of the argument establishing existence.

**Acceptance checks.**

- The abelian-instance node has no dependency on this node.
- Choosing a non-abelian-type datum cannot be justified by relabelling a V6 model.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

### General-data minimal compactification interface

**ID:** `ShimuraVarieties:V8.general/general-minimal`. **Kind:** application. **Proposed name:** `CanonicalModel.general_minimal`.

Apply codim_one_extension, minimal_defined_over_reflex and minimal_map_extension to the V7 models and the corresponding actual auxiliary pure models of Pink 12.10. This gives normal projective minimal compactifications and their functorial maps over reflex fields for all pure data; their open restriction is the general-data tower. Export these objects to C2.general and S0.general with the same complex-functoriality gap exposed.

**Hypotheses.**

- V7 supplies all pure auxiliary models in Pink 12.10 as well as the original datum; the complex Baily–Borel functoriality gap recorded in V8 must be discharged.

**Proof route.**

1. Instantiate codim-one-extension and minimal-descent with the V7 schemes and all auxiliary pure data; apply the existing argument, with no separate general compactification proof.
2. Instantiate minimal-map-extension and identify restrictions by general-tower and model-uniqueness.
3. Supply only this arithmetic minimal/open interface to downstream C2.general and S0.general; toroidal existence and perfectoid limits remain their own targets.

**Prerequisites.** `ShimuraVarieties:V7/general-canonical`, `ShimuraVarieties:V8.general/general-tower`, `ShimuraVarieties:V8/codim-one-extension`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/minimal-map-extension`.

**Source match.**

- pink, 12.3(a)–(b), p.197; 12.10–12.12, pp.200–202: Same compactification construction specialized to the class supplied by general existence.

**Acceptance checks.**

- The same construction agrees with the abelian lane via model-uniqueness.
- No dependency imports the consuming C2.general toroidal model.

**Library placement.** TauCeti/Geometry/Shimura/CanonicalTower, namespace `TauCeti.Shimura`. Implementation status: unchecked.

## Exact supplier requests

Existing exact node references remain prerequisites. The 25 requests below name
interfaces still needed from their owners; they do not duplicate the suppliers.

### AlgebraicModuliForArithmeticGeometry:R09.2

The relative Hom scheme of cocharacters Hom(G_m, T) for the family of maximal tori T_v over the regular semisimple locus V of Lie(G), representing Deligne's incidence cover W -> V (Deligne 5.1) as a finite étale V-scheme, with its base change.

**Needed by:** `ShimuraVarieties:V8/disjoint-special-reflex-fields`.

### AlgebraicModuliForArithmeticGeometry:R09.3

Faithful field base change on morphisms; descent along C/E of morphisms fixed by Aut(C/E) (Milne 13.1) and of closed subschemes; effective polarized projective descent; flat base change of global sections of an invertible sheaf on a quasi-compact separated E-scheme; dense-open equality for reduced source and separated target.

**Needed by:** `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/model-uniqueness`, `ShimuraVarieties:V8/translation-laws`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/minimal-map-extension`, `ShimuraVarieties:V8/gl2-tower-compatibility`, `ShimuraVarieties:V8/component-reciprocity`, `ShimuraVarieties:V8/codim-one-extension`.

### AlgebraicModuliForArithmeticGeometry:R09.5

Finite quotients of quasi-projective schemes by finite group actions (effective quotients), descent of finite/surjective/étale properties, normal projective curve compactifications and finite correspondences, and scheme-theoretic closure compatible with extension of fields.

**Needed by:** `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/codim-one-extension`.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2

Hilbert irreducibility for a finite étale cover over a number field with geometrically irreducible total incidence variety, prescribed nonempty real open, and linear disjointness from a fixed finite extension. Existing elementary-polynomial nodes do not state this.

**Needed by:** `ShimuraVarieties:V8/disjoint-special-reflex-fields`.

### ModularCurvesPartII:R12.1

Uniformisation E(C) ≅ C/Lambda with H_1(E,Z) = Lambda, compatible with Tate modules and full level-N bases, and the analytic formula for the scheme-theoretic Weil pairing; in particular the reference root zeta_ref = e_N(tau/N, 1/N) on C/(Z tau + Z), Im tau > 0, is independent of tau (the calibration behind E2).

**Needed by:** `ShimuraVarieties:V8/gl2-moduli-reciprocity`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`, `ShimuraVarieties:V8/gl2-cusps-tate`.

### ModularCurvesPartII:R12.2

Analytic uniformization of the full ordered level N >= 3, fixed-pairing, Gamma1 (N >= 4) and coarse Gamma0 (every N > 0) curves as isomorphisms, with the ordered-basis determinant identified with the chosen root of unity. Agreement with AA.5's adelic component calculation is AA.5's own target, since AA.5 consumes R12.2.

**Needed by:** `ShimuraVarieties:V8/gl2-moduli-reciprocity`, `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`, `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`.

### ModularCurvesPartII:R12.3

Cusp labels, effective stabilizers and widths, analytic parameter exp(2 pi i z/w) and its transformation under level maps.

**Needed by:** `ShimuraVarieties:V8/gl2-compact-model`, `ShimuraVarieties:V8/gl2-cusps-tate`.

### ModularCurvesPartII:R12.4

Open fixed-pairing fibre geometrically connected and irreducible, deduced from Gamma(N) quotient without importing arithmetic compactification.

**Needed by:** `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`.

### ModularCurvesPartII:R12.5

The basic isogeny correspondences on the modular curves (both legs as moduli maps), their description on the upper half-plane, and the pullback and trace normalization of the Hecke action on differentials. The adelic dictionary for nonintegral g is V8's row-basis node, not R12.5.

**Needed by:** `ShimuraVarieties:V8/gl2-row-basis-dictionary`, `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-tower-compatibility`.

### ModularCurvesPartII:R12.6

Compatibility of the analytic–algebraic comparison with level changes, diamond operators and complex conjugation; fields of definition of the components and of the canonical cusp. Residue fields of all cusps come from R13.4b.

**Needed by:** `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`, `ShimuraVarieties:V8/gl2-cusps-tate`, `ShimuraVarieties:V8/gl2-tower-compatibility`.

### ModularCurvesPartII:R13.4a

Characteristic-zero coarse compactifications for full/composite levels and finite quotients; do not substitute Layer-10 prime diamond quotients.

**Needed by:** `ShimuraVarieties:V8/gl2-compact-model`.

### ModularCurvesPartII:R13.4b

Normal proper generalized-elliptic compactification, boundary subscheme and formal Tate charts over actual cusp residue fields, compatible with the full/coarse open and all finite legs.

**Needed by:** `ShimuraVarieties:V8/gl2-compact-model`, `ShimuraVarieties:V8/gl2-cusps-tate`, `ShimuraVarieties:V8/gl2-tower-compatibility`.

### PELModuli:M3

Genus-one fine full ordered-basis generic-fibre moduli scheme with N >= 3, homology/Tate comparison to the GL2/GSp2 complex double quotient.

**Needed by:** `ShimuraVarieties:V8/gl2-moduli-reciprocity`.

### PELModuli:M4

Actual normalized CM action on genus-one full-level moduli and its agreement with the V4 special-pair reciprocity condition, including all determinant components.

**Needed by:** `ShimuraVarieties:V8/gl2-moduli-reciprocity`.

### PELModuli:M5

The genus-one Siegel moduli and its comparison with #81's Y_full(N) (N >= 3), including the determinant/Weil-pairing convention, the basis-change determinant exponent and the cyclotomic target.

**Needed by:** `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/gl2-moduli-reciprocity`.

### ShimuraCompactifications:C1

Complex rational boundary components with their parabolic subgroups and Levi quotients; the codimension-one components are those attached to surjections G -> PGL2,Q; the quotient data (G,X)/SL2,Q and (G̃,X̃) for G̃ = G ×_{PGL2} GL2 used in Pink 12.10. Arithmetic descent is V8's codim-one-extension.

**Needed by:** `ShimuraVarieties:V8/codim-one-extension`.

### ShimuraVarieties:V1

The compact-open level index category Level(D), with inclusion arrows, conjugation of indices and its laws. V1/holomorphic-level-maps, V1/right-translation and V1/holomorphic-hecke now supply the analytic maps and laws by exact node id. Neither the reviewed V1 packet nor ShimuraData D5 has a node constructing the index category itself; expose this construction under its analytic-tower owner before binding the generic Lean index category.

**Needed by:** `ShimuraVarieties:V8/level-tower`.

### ShimuraVarieties:V2

Refine the complex Baily–Borel interface at neat level: the partial open M_K(C)^+ obtained by adjoining all codimension-one strata is smooth with smooth boundary divisor and complement of codimension at least two; sufficiently high powers of omega[dlog] are globally generated there and embed the full minimal compactification (Pink 8.2, BB66 10.11). Also supply the Pink 12.10 product closed immersion and finite-quotient statements and extension of datum morphisms to complex minimal compactifications. Existing rational-boundary, baily-borel, automorphic-finite-generation, koecher and minimal-level-extension nodes are cited separately and do not yet state these refinements. The arithmetic construction is V8/codim-one-extension, not a missing mixed torus-torsor input.

**Needed by:** `ShimuraVarieties:V8/codim-one-extension`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/minimal-map-extension`.

### ShimuraVarieties:V4

Promote ReflexNorm.map from the API of V4/reflex-norm to a lemma node, retaining the field-change norm: for f:T0 -> T and mu = f composed with mu0, f composed with r(T0,mu0) equals r(T,mu) composed with Nm from E(mu0) to E(mu), on full ideles, compatibly with geometric Artin restriction. The construction and canonical condition are already referenced by exact node ids; the missing promoted lemma, rather than a strict one-point torus model, is the remaining stage contract.

**Needed by:** `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/component-reciprocity`.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Connected centralizers of cocharacters, conjugacy and geometry of maximal tori, regular semisimple Lie open and compact-mod-centre real tori. Import this structure theory; the incidence specialization belongs to the requested IG.2/R09.2 contracts.

**Needed by:** `ShimuraVarieties:V8/disjoint-special-reflex-fields`.

### tauceti:TauCetiRoadmap/ModularCurves#5b-full-ordered-bases-and-fixed-pairing

Existing full ordered-basis scheme for N >= 3 and its row-action/Weil-pairing convention; fixed-pairing model after cyclotomic base change. R12.1/R12.2 supply the analytic comparison.

**Needed by:** `ShimuraVarieties:V8/gl2-moduli-reciprocity`, `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`, `ShimuraVarieties:V8/gl2-row-basis-dictionary`.

### tauceti:TauCetiRoadmap/ModularCurves#5a-tate-normal-form-and-y₁n-for-n4

Existing fine Gamma1 moduli scheme for N >= 4 with a point of exact order; the K1 stabilizer dictionary uses the first row-basis generator.

**Needed by:** `ShimuraVarieties:V8/gl2-gamma1`.

### tauceti:TauCetiRoadmap/ModularCurves#9e-the-coarse-j-line-and-y₀n

Existing characteristic-zero coarse Gamma0 cyclic-subgroup moduli: Y_0(1) is the coarse j-line and, for N >= 3, Y_full(N)/B by the coarse Borel-quotient formula. No universal elliptic family is claimed.

**Needed by:** `ShimuraVarieties:V8/gl2-gamma0`.

### tauceti:TauCetiRoadmap/ModularCurves#0d-finite-étale-schemes-and-galois-actions

The equivalence between finite étale K-schemes and finite continuous Gal(K^s/K)-sets over a field K, used to attach a scheme to the Galois set of formula (64).

**Needed by:** `ShimuraVarieties:V8/zero-dimensional-shimura-variety`.

### tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients

Coarse moduli M([Gamma0(N)]) as a finite quotient of a rigidified representable cover, for N = 2, where 9E's Borel-quotient formula is not used.

**Needed by:** `ShimuraVarieties:V8/gl2-gamma0`.

## Explicit gaps

These seven gaps keep both stages planned. None is silently assumed discharged.

### Complex Baily–Borel functoriality for datum morphisms and the codimension-one embedding

Pink 12.10 for pure data needs, at suitable levels: (i) for a lift (G,X) -> (GL2,H±) of a surjection G -> PGL2,Q, that the embedding (G,X) -> (G′,X′) × (GL2,H±) induces a closed immersion of M_K(C)^+ into M_K′(G′,X′)(C) × M(C)^min(GL2), with image the closure of M_K(C); (ii) in general, that M_K̃(G̃,X̃)(C)^+ -> M_K(C)^+ is the quotient by a finite group. minimal-map-extension also needs the extension of datum morphisms to complex Baily–Borel compactifications (Pink 3.4, 6.2 and the complex form of 12.3(b)). V2's stated targets cover the boundary stratification and level maps, not datum morphisms; no ShimuraCompactifications stage before V8 states them (C3's datum-morphism extensions are toroidal and consume V8). The arithmetic codimension-one extension itself is no longer a gap: codim-one-extension constructs it from gl2-compact-model, open canonical models, descent of closed subschemes and finite quotients, and uses no torus torsor (Pink 12.8 concerns mixed data). The natural owner of (i)–(ii) is V2.

**Needed by:** `ShimuraVarieties:V8/codim-one-extension`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/minimal-map-extension`, `ShimuraVarieties:V8.general/general-minimal`.

### Abelian auxiliary class for Pink 12.10

In the abelian-type lane, Pink 12.10 needs canonical models of (G,X)/SL2,Q and of (G̃,X̃) for G̃ = G ×_{PGL2} GL2, including data in Pink's sense whose X maps non-injectively to Hom(S,G_R) (for GL2 itself, the two-point datum (G_m,{±1}) of zero-dimensional-shimura-variety). Verify that these stay in the existence class of V5/V6, or state precisely the stronger hypothesis on the actual auxiliary models; this prevents a hidden V7 dependency in the abelian lane. The logarithmic line is not part of this gap: on M_K^+ over E, omega[dlog] is defined algebraically and its sections commute with E -> C (R09.3), and V2's projective realization supplies the comparison with the complex Baily–Borel embedding.

**Needed by:** `ShimuraVarieties:V8/codim-one-extension`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8.general/general-minimal`.

### Concrete canonical-model and comparison carriers at the pinned Lean baseline

Pinned Mathlib and Tau Ceti provide schemes/slice categories/functors/pullbacks/spans but no concrete pure datum, canonical reciprocity predicate, finite-adelic level tower or actual full modular-curve carrier under the audited names. Suggested theorem forms explicitly omit those not-yet-expressible conditions rather than use proposition fields or assume their conclusions. Their elaboration checks types only and is not a valid universal theorem about arbitrary schemes. Bind them to the named suppliers, restore every hypothesis and strengthen the schematic finite/proper forms to the full packet statements.

**Needed by:** `ShimuraVarieties:V8/disjoint-special-reflex-fields`, `ShimuraVarieties:V8/translation-descent`, `ShimuraVarieties:V8/model-uniqueness`, `ShimuraVarieties:V8/level-tower`, `ShimuraVarieties:V8/translation-laws`, `ShimuraVarieties:V8/finite-level-maps`, `ShimuraVarieties:V8/hecke-span`, `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/abelian-instance`, `ShimuraVarieties:V8/gl2-moduli-reciprocity`, `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`, `ShimuraVarieties:V8/gl2-fixed-pairing-fibre`, `ShimuraVarieties:V8/gl2-row-basis-dictionary`, `ShimuraVarieties:V8/gl2-gamma1`, `ShimuraVarieties:V8/gl2-gamma0`, `ShimuraVarieties:V8/gl2-compact-model`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8/minimal-map-extension`, `ShimuraVarieties:V8/gl2-cusps-tate`, `ShimuraVarieties:V8/gl2-tower-compatibility`, `ShimuraVarieties:V8.general/general-tower`, `ShimuraVarieties:V8.general/general-minimal`, `ShimuraVarieties:V8/zero-dimensional-shimura-variety`, `ShimuraVarieties:V8/component-reciprocity`, `ShimuraVarieties:V8/codim-one-extension`.

### AA.5 exact principal-level representative contract

The AA packet is reviewed needs_changes, not an accepted implementation. Its GL2 principal-level calculation supplies the right target, but the literal stabilizer Gamma(N) requires determinant representatives g_c in GL2(Zhat), which normalize K(N); arbitrary finite-adelic representatives give conjugate stabilizers. Require this restriction or explicit conjugating isomorphisms in the supplying node. Do not reproduce the underlying adelic quotient in V8.

**Needed by:** `ShimuraVarieties:V8/gl2-full-level`, `ShimuraVarieties:V8/gl2-determinant-pairing`.

### Compact-open level index category

The compact-open level index category Level(D), with inclusion arrows, conjugation of indices and its laws. V1/holomorphic-level-maps, V1/right-translation and V1/holomorphic-hecke now supply the analytic maps and laws by exact node id. Neither the reviewed V1 packet nor ShimuraData D5 has a node constructing the index category itself; expose this construction under its analytic-tower owner before binding the generic Lean index category.

**Needed by:** `ShimuraVarieties:V8/level-tower`.

### Log-canonical section interface on the codimension-one partial compactification

The V2 targets and nodes do not yet state the smooth partial-open and logarithmic global-generation interface of Pink 8.2 used in Pink 12.12. Supply M_K(C)^+, its smooth boundary divisor, codimension of the omitted strata, and the high-power logarithmic canonical section embedding. V2/koecher treats the no-PGL2 range; V2/automorphic-finite-generation does not alone identify this all-type log-canonical linear system. The existing complex-functoriality gap separately records the Pink 12.10 closed immersion/finite quotient and datum-morphism extensions. These refinements belong to V2 and do not invalidate the arithmetic partial-extension construction conditional on them.

**Needed by:** `ShimuraVarieties:V8/codim-one-extension`, `ShimuraVarieties:V8/minimal-descent`, `ShimuraVarieties:V8.general/general-minimal`.

### Reflex-norm functoriality API promotion

Promote ReflexNorm.map from the API of V4/reflex-norm to a lemma node, retaining the field-change norm: for f:T0 -> T and mu = f composed with mu0, f composed with r(T0,mu0) equals r(T,mu) composed with Nm from E(mu0) to E(mu), on full ideles, compatibly with geometric Artin restriction. The construction and canonical condition are already referenced by exact node ids; the missing promoted lemma, rather than a strict one-point torus model, is the remaining stage contract.

**Needed by:** `ShimuraVarieties:V8/datum-functoriality`, `ShimuraVarieties:V8/component-reciprocity`.

## Baseline declarations reused

| Declaration | Kind | Module | Interface |
| --- | --- | --- | --- |
| `mathlib:AlgebraicGeometry.Scheme` | structure | Mathlib/AlgebraicGeometry/Scheme.lean | Schemes with native category and structure morphisms |
| `mathlib:CategoryTheory.Over` | def | Mathlib/CategoryTheory/Comma/Over/Basic.lean | Slice category over the actual base scheme |
| `mathlib:CategoryTheory.Functor` | structure | Mathlib/CategoryTheory/Functor/Basic.lean | Objects, maps, identity and composition laws |
| `mathlib:CategoryTheory.Over.pullback` | def | Mathlib/CategoryTheory/Comma/Over/Pullback.lean | Base-change functor on slice categories |
| `mathlib:CategoryTheory.Over.pullbackId` | def | Mathlib/CategoryTheory/Comma/Over/Pullback.lean | Natural isomorphism for identity base change |
| `mathlib:CategoryTheory.Over.pullbackComp` | def | Mathlib/CategoryTheory/Comma/Over/Pullback.lean | Natural isomorphism for successive base changes |
| `mathlib:CategoryTheory.Limits.span` | def | Mathlib/CategoryTheory/Limits/Shapes/Pullback/Cospan.lean | Native ordered WalkingSpan functor |
| `mathlib:CategoryTheory.Limits.spanCompIso` | def | Mathlib/CategoryTheory/Limits/Shapes/Pullback/Cospan.lean | Applying a functor to a span agrees naturally with the span of its images |
| `mathlib:AlgebraicGeometry.IsFinite` | class | Mathlib/AlgebraicGeometry/Morphisms/Finite.lean | Native finite scheme morphism |
| `mathlib:AlgebraicGeometry.IsProper` | class | Mathlib/AlgebraicGeometry/Morphisms/Proper.lean | Native proper scheme morphism |
| `mathlib:AlgebraicGeometry.IsOpenImmersion` | abbrev | Mathlib/AlgebraicGeometry/OpenImmersion.lean | Native open immersion of schemes |
| `mathlib:IntermediateField.LinearDisjoint` | abbrev | Mathlib/FieldTheory/LinearDisjoint.lean | Linear disjointness of actual intermediate fields via subalgebras |

All entries were rechecked on 2026-10-08 at the Mathlib pin. `Over.pullback`
requires the relevant pullbacks, available for schemes; identity and composition
base change use its native natural isomorphisms.

## Source corrections retained

The nine source findings and their independent confirmed verdicts remain in the
packet. The descriptions here are in our own words, with the mathematical
corrections and their precise locators. This revision does not replace their review.

### ShimuraVarieties/E1 — error

milne-mf, Example 8.9, p.100, MF v1.31 (2017). Independent verdict: confirmed.

**Source claim.** The source identifies A¹ as the answer to its moduli question when N = 2.

**Correction.** The characteristic-zero coarse ordered level-two curve is the punctured lambda-line A¹ minus {0,1}. It is not a fine moduli scheme of all such families. The Legendre family is smooth only on the punctured line. Restrict the fine comparison in this packet to N >= 3.

**Reason.** The discriminant is 16 lambda²(1-lambda)². The automorphism [-1] fixes E[2]; nontrivial quadratic twists have the same geometric lambda invariant and obstruct the claimed universal property over arbitrary fields.

**Affected targets:** `a`, ` `, `s`, `t`, `a`, `t`, `e`, `d`, ` `, `r`, `e`, `s`, `u`, `l`, `t`.

**Prior errata:** new. The dated searches are recorded in the packet.

### ShimuraVarieties/E2 — error

milne-mf, Lemma 8.7, p.100, with its preceding arbitrary primitive-root convention, MF v1.31 (2017). Independent verdict: confirmed.

**Source claim.** (z/N, 1/N)

**Correction.** This reference basis has one fixed Weil-pairing root zeta_ref. For zeta = zeta_ref^u replace the first generator by u z/N (u a unit modulo N), or fix zeta=zeta_ref in the statement.

**Reason.** The ordered lattice/reference orientation fixes the pairing; the displayed generators do not vary with the arbitrary root in the preceding definition. Bilinearity gives the corrected exponent.

**Affected targets:** `a`, ` `, `s`, `t`, `a`, `t`, `e`, `d`, ` `, `r`, `e`, `s`, `u`, `l`, `t`.

**Prior errata:** new. The dated searches are recorded in the packet.

### ShimuraVarieties/E3 — misprint

milne-svi, Proposition 6.3 proof, second paragraph, p.71, 2017 author copy. Independent verdict: confirmed.

**Source claim.** The proof selects isomorphisms directed a: V → W, together with a′: V → W′.

**Correction.** Use a: W → V and a′: W′ → V, consistent with the setup on p.70; with q absorbed into a′, the comparison isomorphism W → W′ is (a′)⁻¹ a. Also use the corrected primed h′ and eta′ where specified in Jungin Lee’s errata. In the first paragraph use s′ in place of t′, the correction on p.70 line -3 in Jungin Lee’s list.

**Reason.** The printed directions make a h and a composed with eta ill-typed. The initial setup uses a: W → V, and the inverse expression for the comparison must have domain W.

**Affected targets:** `t`, `h`, `e`, ` `, `p`, `r`, `o`, `o`, `f`.

**Prior errata:** new. The dated searches are recorded in the packet.

### ShimuraVarieties/E4 — misprint

milne-svi, Remark 5.29(a), p.65, 2017 author copy. Independent verdict: confirmed.

**Source claim.** The source calls the quotient morphism S_K′ → S_K immediate.

**Correction.** For K contained in K′ the forgetful quotient map is S_K → S_K′.

**Reason.** Forgetting a finer level maps the smaller subgroup quotient to the larger subgroup quotient.

**Affected targets:** `n`, `o`, `t`, `h`, `i`, `n`, `g`.

**Prior errata:** Jungin Lee, SV_errata.pdf, p.1: page 65 line -6.. The dated searches are recorded in the packet.

### ShimuraVarieties/E5 — misprint

milne-svi, The homomorphism r_x, displayed formula (60) and the final formula before Definition 12.8, p.114, 2017 author copy. Independent verdict: confirmed.

**Source claim.** r(T, μ)(P) = Σ_{ρ:E→Q^a} ρ(μ(P)); r_x(a) = Σ_{ρ:E→Q^a} ρ(μ_x(a_f))

**Correction.** Replace the aggregation signs by products in these multiplicative torus formulas. In the r_x formula the embeddings are of E(x), the field of definition of μ_x, as specified in Jungin Lee’s errata. V8 uses the corrected V4 multiplicative reciprocity norm.

**Reason.** The target is the multiplicative torus; an additive sum does not define the asserted torus homomorphism. V8 imports the corrected V4 reciprocity norm.

**Affected targets:** `n`, `o`, `t`, `h`, `i`, `n`, `g`.

**Prior errata:** Milne official xnotes errata, sums-to-products correction credited to Ruida Di, p.114; Jungin Lee SV_errata.pdf, embeddings indexed by E(x) in the r_x formula.. The dated searches are recorded in the packet.

### ShimuraVarieties/E6 — error

deligne-1971, 5.1.3, printed p.155, published Numdam copy (page image checked). Independent verdict: confirmed.

**Source claim.** The assertion covers every real open U ⊂ V(R) and every field extension F of E.

**Correction.** Require U to be nonempty and F/E to be finite in the disjoint Hilbert-specialization assertion. These are precisely the hypotheses of its application in Theorem 5.1.

**Reason.** An empty real open has no specialization. Without finiteness of F the result is false: over E=Q, take the degree-two cover s²=t of V=A¹ minus {0}, U=(1,2), and F=Qbar. A rational specialization either splits or is a nontrivial quadratic field, which cannot be linearly disjoint from Qbar over Q.

**Affected targets:** `a`, ` `, `s`, `t`, `a`, `t`, `e`, `d`, ` `, `r`, `e`, `s`, `u`, `l`, `t`.

**Prior errata:** new. The dated searches are recorded in the packet.

### ShimuraVarieties/E7 — misprint

deligne-1971, Lemma 5.1.2(b), printed p.154, published Numdam copy (page image checked). Independent verdict: confirmed.

**Source claim.** The source refers to maximal tori belonging to G_mC.

**Correction.** The maximal tori containing i(G_mC) are maximal tori of G_C, not of G_mC.

**Reason.** The centralizer and the surrounding incidence construction are in G_C; G_mC is the domain of i.

**Affected targets:** `n`, `o`, `t`, `h`, `i`, `n`, `g`.

**Prior errata:** new. The dated searches are recorded in the packet.

### ShimuraVarieties/E8 — misprint

deligne-1971, Hilbert specialization lemma (heading printed Lemme 5.13), p.154, and its proof p.155, published Numdam copy (page images checked). Independent verdict: confirmed.

**Source claim.** The heading labels the result Lemme 5.13, while the proof invokes the assumptions numbered 4.12.

**Correction.** Read the inserted lemma as 5.1.3 (following 5.1.2), and refer in its proof to its own hypotheses, not to 4.12.

**Reason.** The proof base changes the immediately preceding incidence-cover hypotheses; 4.12 is not that lemma.

**Affected targets:** `n`, `o`, `t`, `h`, `i`, `n`, `g`.

**Prior errata:** new. The dated searches are recorded in the packet.

### ShimuraVarieties/E9 — misprint

milne-svi, Shimura varieties of abelian type, paragraph after Proposition 14.16, p.127, 2017 author copy. Independent verdict: confirmed.

**Source claim.** The source attributes canonical-model existence for connected Shimura varieties of abelian type to (14.16). It then cites (14.16) again for existence in the general, possibly disconnected, abelian-type case.

**Correction.** The second citation should be (14.15): passing from the connected Shimura varieties Sh°(G^der, X^+) to Sh(G,X) is Theorem 14.15 (Deligne 1979, 2.7.13), not Proposition 14.16.

**Reason.** 14.16 concerns products and isogenies of connected Shimura data only; the statement for the non-connected Sh(G,X) of abelian type is the 'if' direction of 14.15.

**Affected targets:** `n`, `o`, `t`, `h`, `i`, `n`, `g`.

**Prior errata:** new. The dated searches are recorded in the packet.

## Sources and verification record

The four public PDF hashes were reproduced on 2026-10-08. The earlier source
reading dates remain provenance in the packet; this revision rechecked the
reviewer’s corrected passages and the three added-node arguments. Milne’s PDF
page equals the printed page; Pink’s PDF page is printed page plus one; Deligne’s
PDF page is printed page minus 121. No source passages are reproduced here.

- **milne-svi**: J. S. Milne, [Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf), Author revision, 2017. SHA-256: `f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e`.
- **milne-mf**: J. S. Milne, [Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), Version 1.31, 22 March 2017. SHA-256: `977f06a4e838c43c77a7c9398c090789e60d67f64e013e1dcd9bcce0e0c27b8d`.
- **pink**: Richard Pink, [Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), Author-typeset dissertation; numbering/pages of this copy. SHA-256: `6f8aa447ccf54368d465a9d45f44bc91f0d35440cba04e20061c576145ca8669`.
- **deligne-1971**: Pierre Deligne, [Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), Version of record, 1970–1971, pp.123–165. SHA-256: `054847cecac9c396e2a6f568443db180786a0c5528ec08530fd464d5474bd534`.
- **pr81**: Tau Ceti contributors, [Tau Ceti roadmap: Modular curves](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/ModularCurves/README.md), PR81 roadmap as present in the atlas clone on 2026-10-06.

The [official SVI errata](https://www.jmilne.org/math/xnotes/errata.html),
[Jungin Lee’s corrections](https://www.jmilne.org/math/xnotes/SV_errata.pdf),
and [Course Notes errata](https://www.jmilne.org/math/CourseNotes/errata.html)
were checked again for the retained findings. This pass uses the public sources
and the clone’s roadmap documents; no unavailable book is required for the
reader synchronization. Missing mathematical inputs are precisely the seven gaps
and supplier requests above.
