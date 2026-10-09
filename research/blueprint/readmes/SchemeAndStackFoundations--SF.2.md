# Scheme, stack, cohomology and intersection foundations — layer SF.2: sites and scheme cohomology

This document is the plan for layer SF.2 of the roadmap SchemeAndStackFoundations. It agrees with the
blueprint packet `research/blueprint/packets/SchemeAndStackFoundations--SF.2.json`, which is definitive
for node identifiers and prerequisites, and with the suggested Lean file
`research/blueprint/suggested/SchemeAndStackFoundations--SF.2.lean`. The layer's three key definitions —
Brauer groups of schemes, coherent duality and equivariant sheaf cohomology — were specified in the
roadmap's first packet (`research/blueprint/packets/SchemeAndStackFoundations.json`, 55 SF.2 nodes, cited
here by identifier); this document plans the rest of the layer and the carriers and theorems those key
definitions rest on. Nothing here is claimed to be formalised.

## Purpose

SF.2 is the atlas's owner of sites and of the cohomology of schemes. Its stage text asks for the Zariski,
étale, fppf and pro-étale sites and their comparisons at the appropriate coefficient level, sheaf
cohomology, localization, proper and smooth base change and compact support, while integrating the
existing suppliers of finite-coefficient étale theory rather than building a second six-operations formalism.
Concretely the layer provides, on top of Mathlib's sites and Mathlib's sheaf cohomology `Sheaf.H`:

- the generic functoriality of sheaf cohomology on sites (pullback, higher direct images, the Leray and
  Čech spectral sequences, torsors and nonabelian H^1, the H^2 class of a gerbe);
- quasi-coherent cohomology beyond the curve and proper-flat cases of the Tau Ceti roadmaps, and
  coherent cohomology with supports (local cohomology, depth, Cousin complexes);
- the comparison of cohomology across the Zariski, Nisnevich, étale, fppf and pro-étale topologies, with
  the coefficient sheaves G_a, G_m, μ_n, Hilbert 90 and the Kummer and Artin–Schreier sequences;
- the Nisnevich topology with elementary distinguished squares and descent;
- étale cohomology with non-torsion and non-invertible coefficients (fields, limits, Galois coverings,
  henselian pairs, curves, proper hypercoverings) and the Bhatt–Scholze pro-étale comparison;
- coherent Grothendieck duality in the generality of the Stacks Project's chapter Duality for Schemes;
- the completion of the Brauer and equivariant key definitions.

## Boundaries

**Finite-coefficient étale theory is imported.** The Tau Ceti roadmap family CohomologicalPointCounting
(open roadmap pull request 196, head 4bd7237) owns constructible coefficients and finite-coefficient étale
cohomology (ConstructibleEtale), morphisms of étale topoi, Rf_*, proper and smooth base change, finiteness,
local acyclicity and Künneth (EtaleBaseChange), Nagata compactification, j_!, Rf_!, open–closed localization
and RΓ_c (CompactSupport), ℓ-adic and Q_ℓ realization with the comparison to Mathlib's pro-étale
`ellAdicSheaf` (EllAdicRealization), Frobenius and topological invariance (FrobeniusGeometry), Artin
comparison (ComplexComparison) and the trace formula (TraceFormula). SF.2 never re-plans these. Because the
family's layers are not atlas stages yet, nodes that use them record the layer in
`importsFromTauCetiRoadmaps` and the packet lists the dependency as a gap. The atlas's `UPSTREAM:` entries
whose integration owner is SF.2 are mapped to the child roadmap and layers they stand for in the table
"Integration of the upstream entries" below; consumers that cite SF.2 for these items should cite that layer.

**Other Tau Ceti roadmaps.** JacobianChallenge Layer A (Picard groups), Layer B (affine acyclicity, Čech
computation, finite-dimensionality, curve Serre duality), Layer C (flat base change, cohomology and base
change) and Layer D (Jacobians); StableReduction Layer 2 (proper coherence over locally Noetherian bases,
relative dualizing sheaves of Cohen–Macaulay curves); ModularCurves 0E (effective faithfully flat descent);
ProfiniteCohomology Layers 9–10 (Galois Hilbert 90, Kummer, continuous cohomology in all degrees);
QuadraticFormInvariants Layer 7 (the Brauer group of a field as H^2). Each is cited by a `requests` entry.

**Not in this layer.** Étale cohomology with supports and the étale f^! (EtaleDualityAndPerverseSheaves
EDC.0–EDC.1); Gabber's absolute purity (EtaleDualityAbsolutePurityPartII) and purity for the Brauer group
(the roadmap PurityForFlatCohomology proposed by the Česnavičius extraction), both of which import SF.2;
the real and coniveau étale package of Benoist–Wittenberg (it needs étale supports and the norm-residue
theorem; proposed above EDC.0); algebraic stacks (SF.1); Chow groups and Riemann–Roch (SF.5).

**Upstream tiers.** SchemeAndStackFoundations is in tier 2 of the Caraiani–Newton order, so this layer cites
only Mathlib, Tau Ceti and its own roadmap. Two notions planned by higher roadmaps moved down into it: the
generic site-cohomology functoriality (planned by DiamondsAndVStacks D0) and étale cohomology of limits
(planned by AdicCoefficientsAndComparisons L2); those layers import the SF.2 nodes.

## Conventions

- **Schemes and sites.** Schemes are Mathlib's `Scheme.{u}`. The small étale site is Mathlib's
  `X.Etale` with `Scheme.smallEtaleTopology X`; the small pro-étale site is `X.ProEt` with
  `Scheme.ProEt.topology X`; big sites are slice categories `Over S` with the induced topology
  (`GrothendieckTopology.over`) of `zariskiTopology ≤ etaleTopology ≤ fppfTopology ≤ fpqcTopology`
  (and `etaleTopology ≤ proetaleTopology`). The Nisnevich topology is new (SF.2c). Abelian sheaves on the
  small étale site take values in `AddCommGrpCat.{u}`; pro-étale sheaves in `AddCommGrpCat.{u+1}`, as in
  Mathlib's `EllAdicCohomology`.
- **Cohomology.** H^n is Mathlib's `Sheaf.H` (Ext in the sheaf category from the constant sheaf Z). For
  O_X-modules it is Tau Ceti's `Scheme.Modules.Cohomology`, i.e. `Sheaf.H` of the underlying abelian sheaf on
  the small Zariski site. Cohomology over an object U is cohomology of the slice site (SF.2a).
- **Coefficient regimes.** Every export says which regime it is in, and the layer never transports a
  statement from one regime to another without a named comparison: (i) finite coefficients Λ with torsion
  invertible on the base — CohomologicalPointCounting; (ii) torsion coefficients with no invertibility
  hypothesis — Gabber's affine base change, finite pushforward, proper hypercover descent, limits (SF.2d);
  (iii) p-torsion in characteristic p — Artin–Schreier and fppf μ_p, α_p (SF.2c); (iv) G_m and smooth
  commutative group schemes — Hilbert 90, Brauer groups, Grothendieck's étale–fppf comparison (SF.2c, SF.2f);
  (v) quasi-coherent coefficients — all topologies agree (SF.2c), coherent duality (SF.2e); (vi) ℓ-adic and
  rational coefficients — CohomologicalPointCounting EllAdicRealization and the pro-étale nodes of SF.2d.
  The torsion order is assumed invertible on the base exactly where the cited theorem needs it.
- **Derived categories.** Complexes are cohomologically indexed; K[r] has H^i(K[r]) = H^{i+r}(K).
  D_QCoh(O_X) is the full subcategory of the derived category of O_X-modules with quasi-coherent cohomology.
  f^! is defined on D^+_QCoh for separated finite-type morphisms of Noetherian schemes (the category FTS_S of
  Stacks Situation 48.16.1).
- **Galois groups.** G_K is the absolute Galois group (Mathlib's `Field.absoluteGaloisGroup`, automorphisms
  of an algebraic closure, canonically the Galois group of a separable closure); geometric points are
  separably closed fields mapping to the scheme.

## Baseline

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
The reviewed library audit (AUDIT-01) finds SF.2 partly built: Mathlib has the big and small sites listed
above, geometric points of the small étale site with a conservative family, Grothendieck abelian sheaf
categories, `Sheaf.H` with Mayer–Vietoris squares, the Čech complex functor, the pro-étale ℓ-adic sheaf and
cohomology, derived categories and Ext, local cohomology of modules, Henselian rings, Azumaya algebras over
rings and the field Brauer group; Tau Ceti has cohomology of O_X-modules with long exact and Mayer–Vietoris
sequences, flasque acyclicity, line-bundle classes, the group structure on the field Brauer group, central
simple algebra splitting, and continuous Galois cohomology with Hilbert 90 and Kummer theory. All 83 baseline
declarations cited by the packet were read at the pinned commits; each is listed in the packet with its file.

## SF.2a — Sheaf cohomology on sites

Mathlib defines H^n of an abelian sheaf on a site as Ext from the constant sheaf Z (CategoryTheory.Sheaf.H) and has a Čech complex functor and Mayer–Vietoris squares, but no functoriality along morphisms of sites, no higher direct images, no Leray or Čech-to-cohomology spectral sequence and no torsor interpretation. Tau Ceti adds the free Yoneda sheaf description of H^n(U,−) and acyclicity of flasque sheaves. This sub-layer builds the generic machinery once, for any site with Grothendieck abelian sheaf categories: it is used for the Zariski, Nisnevich, étale, fppf and pro-étale sites alike, and for ringed spaces. Nonabelian H^1 and the class of an abelian-banded gerbe give the bridge from Azumaya algebras to H^2(X, G_m) in Mathlib's Sheaf.H.

#### Pullback on sheaf cohomology along a morphism of sites (`site-cohomology-pullback`, construction)

Let (C,J) and (D,K) be sites whose categories of abelian sheaves have enough injectives, and let u : D → C be a continuous functor whose sheaf pushforward u_* : Ab(C) → Ab(D) has an exact left adjoint u^{-1} (a morphism of sites f : C → D in the sense of Stacks 00X0). For every abelian sheaf G on D, every object V of D and every n ≥ 0 construct a group homomorphism f^* : H^n(V, G) → H^n(u(V), u^{-1}G), where both sides are Mathlib's sheaf cohomology CategoryTheory.Sheaf.H read on the slice sites. It is natural in G, equals restriction of sections in degree 0 (through CategoryTheory.Sheaf.H.equiv₀), commutes with the connecting maps of short exact sequences, and satisfies f^* for the identity = id and (g ∘ f)^* = f^* ∘ g^*. The construction applies verbatim to the comparison morphisms between the big fppf, big and small étale, Nisnevich, Zariski and pro-étale sites of a scheme and to the morphism of small étale sites induced by a morphism of schemes.

*Hypotheses.* Both sheaf categories are Grothendieck abelian (so injective resolutions and Mathlib's Ext exist). u is continuous and u^{-1} is exact; no cocontinuity is assumed.

*Proof outline.*

1. Write H^n(V,G) = Ext^n(Z_V^#, G) as Mathlib does, with Z_V^# the free abelian sheaf on the sheafified Yoneda object of V (Tau Ceti's freeYonedaSheafFunctor).
2. u^{-1} is exact and sends Z_V^# to Z_{u(V)}^#, so it induces maps on Ext groups (Ext is functorial for exact functors); this is the pullback. Equivalently: u_* preserves injectives because its left adjoint is exact (Stacks 21.14.1), and applying u^{-1} to an injective resolution of G and comparing with an injective resolution of u^{-1}G gives the map.
3. Degree 0, naturality, compatibility with connecting maps and functoriality follow from the corresponding properties of exact functors on Ext (Mathlib's Ext.mk₀ and the covariant long exact sequence) and from u^{-1} ∘ v^{-1} ≅ (v ∘ u)^{-1}.

*API.*

- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback` (constructor): For a morphism of sites f given by u and n ≥ 0, the homomorphism H^n(V,G) → H^n(u(V), u^{-1}G).
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_zero` (simp): In degree 0, pullback composed with H.equiv₀ is the restriction map of sections G(V) → (u^{-1}G)(u(V)).
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_naturality` (functoriality): For φ : G → G' the square formed by H.map φ and the pullbacks commutes.
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_id` (functoriality): Pullback along the identity morphism of sites is the identity.
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_comp` (functoriality): Pullback along a composite morphism of sites is the composite of the pullbacks (through u^{-1}v^{-1} ≅ (vu)^{-1}).
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.pullback_δ` (compatibility): Pullback commutes with the connecting homomorphisms attached to a short exact sequence 0 → G' → G → G'' → 0 and its (exact) pullback.

*Used by.* MotivicEtaleKTheory:M.1/etale-twist-sheaf (request to SF.2) — pullback maps H^i_et(X, F) → H^i_et(X', f^*F) with identity and composition laws, which Mathlib's Sheaf.H lacks; AlgebraicModuliForArithmeticGeometry:R09.4/class-site-pullback (request to SF.2) — the derived global-cohomology pullback along base-induced étale/fppf morphisms, natural for short exact sequences; SF.2/quasi-coherent-topology-comparison and SF.2/smooth-group-fppf-etale-comparison — the comparison maps between Zariski, étale and fppf cohomology are pullbacks along topology-change morphisms.

*Unit tests.*

- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_id_etale` (degenerate): For the identity of X_et and n = 2 the pullback H^2(X_et,G) → H^2(X_et,G) is the identity map.
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_zero_restriction` (computation): For an open immersion j : U → X and the small Zariski sites, pullback in degree 0 on the structure sheaf is restriction O(X) → O(U).
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.H.test_pullback_not_iso` (non-example): For the morphism Spec C → Spec R of small étale sites and G = Z/2Z, pullback H^1(Spec R, Z/2) ≅ Z/2 → H^1(Spec C, Z/2) = 0 is not injective; the construction does not assert invariance.

*Acceptance.* For the identity morphism of the small étale site of X the map is the identity of H^n(X_et, G). In degree 0 it is the restriction map G(V) → (u^{-1}G)(u(V)).

*Depends on.* `CategoryTheory.Sheaf.H` (Mathlib), `CategoryTheory.Sheaf.H.equiv₀` (Mathlib), `CategoryTheory.Functor.IsContinuous` (Mathlib), `CategoryTheory.Functor.sheafPushforwardContinuous` (Mathlib), `CategoryTheory.Functor.sheafPullback` (Mathlib), `CategoryTheory.Abelian.Ext` (Mathlib), `CategoryTheory.Abelian.Ext.covariant_sequence_exact₁` (Mathlib), `TauCeti.CategoryTheory.freeYonedaSheafFunctor` (Tau Ceti).

*Source.* Stacks Project, Tag 072X (Section 21.14), Lemma 21.14.1; Tag 01FU (Section 21.7), Lemmas 21.7.1–21.7.4; Stacks Project, Tag 0DDK (Section 59.100), Lemma 59.100.2.

*Suggested home.* `TauCeti/CategoryTheory/Sites/SheafCohomology/Functoriality`, namespace `TauCeti.SchemeFoundations.SiteCohomology`.

#### Higher direct images for a morphism of sites (`site-derived-pushforward`, construction)

For a morphism of sites f : C → D given by a continuous functor u : D → C with exact u^{-1}, and Grothendieck abelian sheaf categories, define the right derived functor Rf_* : D^+(Ab(C)) → D^+(Ab(D)) of the left exact pushforward f_* = u_* (Mathlib's CategoryTheory.Functor.sheafPushforwardContinuous, derived with CategoryTheory.Functor.rightDerived) and R^if_*F = H^i(Rf_*F). For every abelian sheaf F on C, R^if_*F is the sheafification of the presheaf V ↦ H^i(u(V), F|_{u(V)}).

*Hypotheses.* Ab(C) and Ab(D) Grothendieck abelian; u continuous with exact u^{-1}.

*Proof outline.*

1. Right derived functors exist because Ab(C) has enough injectives (Mathlib's Functor.rightDerived on the abelian category).
2. For the presheaf description, compute R^if_* by an injective resolution I^• of F; then f_*I^• evaluated on V is I^•(u(V)), whose cohomology is the presheaf V ↦ H^i(u(V),F), and sheafification is exact (Stacks Lemma 21.7.4).

*API.*

- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.derivedPushforward` (constructor): The functor Rf_* : D^+(Ab(C)) → D^+(Ab(D)) derived from f_*.
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.higherDirectImage` (constructor): R^if_*F := H^i(Rf_*F) as an abelian sheaf on D.
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.higherDirectImage_zero` (simp): R^0f_*F ≅ f_*F naturally in F.
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.higherDirectImage_iso_sheafify` (characterisation): R^if_*F is isomorphic to the sheafification of the presheaf V ↦ H^i(u(V),F), naturally in F.
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.higherDirectImage_δ` (relation): A short exact sequence of abelian sheaves on C gives a long exact sequence of the R^if_*.
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.derivedPushforward_comp` (functoriality): R(g∘f)_* ≅ Rg_* ∘ Rf_* on D^+ (pushforward preserves injectives).

*Used by.* SF.2/site-leray-spectral-sequence — its E2 terms H^p(D, R^qf_*F); SF.2/quasi-coherent-topology-comparison — R^qε_* of a quasi-coherent sheaf along the topology-change morphism vanishes for q > 0; SF.2/curve-multiplicative-cohomology — R^qj_*G_m for the generic point of a curve vanishes for q ≥ 1.

*Unit tests.*

- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_id` (degenerate): For the identity morphism of a site, R^1 id_* F = 0 for every abelian sheaf F.
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_zero_eq` (compatibility): R^0f_*F is canonically isomorphic to Mathlib's sheafPushforwardContinuous applied to F.
- `TauCeti.SchemeFoundations.SiteCohomology.Sheaf.test_higherDirectImage_sepClosed_base` (computation): For f : X → Spec k with k separably closed and the small étale sites, the global sections of R^if_*F are H^i(X_et, F) (an étale sheaf on Spec k is determined by its global sections).

*Acceptance.* If C = D and f is the identity, R^if_* = 0 for i > 0. For a finite morphism of schemes and the small étale sites, R^if_* = 0 for i > 0 on every abelian sheaf (SF.2/finite-pushforward-exact).

*Depends on.* `CategoryTheory.Functor.sheafPushforwardContinuous` (Mathlib), `CategoryTheory.Functor.rightDerived` (Mathlib), `CategoryTheory.IsGrothendieckAbelian` (Mathlib), `CategoryTheory.Sheaf.cohomologyPresheaf` (Mathlib), `site-cohomology-pullback`.

*Source.* Stacks Project, Tag 072W (Lemma 21.7.4); Stacks Project, Tag 03Q4 (Section 59.51), Lemma 59.51.6.

*Suggested home.* `TauCeti/CategoryTheory/Sites/SheafCohomology/Functoriality`, namespace `TauCeti.SchemeFoundations.SiteCohomology`.

#### Leray spectral sequence for a morphism of sites (`site-leray-spectral-sequence`, theorem)

For a morphism of sites f : C → D as in SF.2/site-derived-pushforward and an abelian sheaf F on C, there is a convergent first-quadrant spectral sequence E_2^{p,q} = H^p(D, R^qf_*F) ⇒ H^{p+q}(C, F), natural in F, whose edge map H^p(D, f_*F) → H^p(C,F) is the composite of SF.2/site-cohomology-pullback with the counit f^{-1}f_*F → F. Equivalently RΓ(C, −) ≅ RΓ(D, −) ∘ Rf_* on D^+.

*Hypotheses.* Ab(C), Ab(D) Grothendieck abelian; u continuous with exact u^{-1}; F an abelian sheaf (or K ∈ D^+(C)).

*Proof outline.*

1. Γ(C, −) = Γ(D, −) ∘ f_* and f_* sends injectives to injectives (its left adjoint is exact), hence to Γ(D,−)-acyclics.
2. Apply the Grothendieck spectral sequence of a composite of functors (Stacks Lemma 21.14.5, from Derived Categories 13.22.2).

*Acceptance.* For f the identity, the spectral sequence degenerates and the edge map is the identity. For j : η → X the generic point of a smooth curve over an algebraically closed field and G_m, the sequence with R^qj_* = 0 (q ≥ 1) gives H^p(X, j_*G_m) = H^p(η, G_m) (Stacks 59.68.3).

*Depends on.* `site-derived-pushforward`, `site-cohomology-pullback`, `CategoryTheory.Functor.rightDerived` (Mathlib).

*Source.* Stacks Project, Tag 072X (Section 21.14), Lemma 21.14.5 (Leray spectral sequence) and Lemma 21.14.7 (relative Leray).

*Suggested home.* `TauCeti/CategoryTheory/Sites/SheafCohomology/Functoriality`, namespace `TauCeti.SchemeFoundations.SiteCohomology`.

#### Čech-to-cohomology spectral sequence and Leray's acyclicity theorem (`cech-to-cohomology`, theorem)

Let C be a site, U = {U_i → U} a covering and F an abelian sheaf. (1) There is a spectral sequence E_2^{p,q} = Ȟ^p(U, H^q(F)) ⇒ H^{p+q}(U, F), where H^q(F) is the presheaf V ↦ H^q(V,F) and Ȟ is Čech cohomology computed by Mathlib's CategoryTheory.cechComplexFunctor; its edge map Ȟ^p(U,F) → H^p(U,F) is natural. (2) Ȟ^1(U, F) → H^1(U,F) is injective, and the colimit over refinements of Ȟ^1 equals H^1. (3) If H^i(U_{i_0} ×_U … ×_U U_{i_p}, F) = 0 for all i > 0 and all finite intersections, then Ȟ^p(U,F) ≅ H^p(U,F) for every p.

*Hypotheses.* C a site with fibre products of covering members (the Čech complex is formed from them); F an abelian sheaf.

*Proof outline.*

1. Injective abelian sheaves are injective presheaves and have vanishing higher Čech cohomology (Stacks 21.10.1–21.10.2).
2. The inclusion of sheaves into presheaves has right derived functors R^q i(F) = H^q(F) (Stacks 21.10.5); the Grothendieck spectral sequence for Γ(U,−) = Ȟ^0(U, i(−)) gives (1) (Stacks 21.10.6 / 59.19.2).
3. (2) is the low-degree exact sequence (Stacks 21.10.4); (3) follows since the E_2 term collapses to the row q = 0 (Stacks 21.10.7).

*Acceptance.* For a single Galois covering Y → X with group G on X_et, Ȟ^p({Y→X}, F) = H^p(G, F(Y)) (Milne LEC Example 10.1), so (3) applied to a sheaf acyclic on all Y^{×n} computes étale cohomology by group cohomology. For a quasi-coherent sheaf and an affine open cover of a separated scheme, (3) together with affine acyclicity recovers the Čech computation owned by JacobianChallenge Layer B.

*Depends on.* `CategoryTheory.cechComplexFunctor` (Mathlib), `CategoryTheory.Sheaf.H` (Mathlib), `CategoryTheory.Sheaf.cohomologyPresheaf` (Mathlib), `site-derived-pushforward`.

*Source.* Stacks Project, Tag 03AV (Section 21.10), Lemmas 21.10.1–21.10.7; Tag 03OW (Theorem 59.19.2); J. S. Milne, §10, Example 10.1, p.70.

*Suggested home.* `TauCeti/CategoryTheory/Sites/SheafCohomology/Functoriality`, namespace `TauCeti.SchemeFoundations.SiteCohomology`.

#### First cohomology classifies torsors (`abelian-torsor-h1`, theorem)

Let C be a site and H an abelian sheaf on C. Isomorphism classes of H-torsors (sheaves of sets with a free and transitive H-action that are locally nonempty) are in canonical bijection with H^1(C, H) (Mathlib's Sheaf.H). The bijection sends the trivial torsor to 0, is natural in H, is compatible with pullback along morphisms of sites (SF.2/site-cohomology-pullback), and matches the contracted-product group law on torsor classes with addition. A torsor is trivial if and only if it has a global section.

*Hypotheses.* C a site whose abelian sheaves form a Grothendieck abelian category; H a sheaf of abelian groups.

*Proof outline.*

1. Given a torsor F, form the free abelian sheaf Z[F] and the augmentation exact sequence 0 → K → Z[F] → Z → 0; the connecting class of the extension pushed out along K → H is the class of F (Stacks proof of Lemma 21.4.3).
2. Conversely an extension class 0 → H → E → Z → 0 gives the torsor of local lifts of 1; the two constructions are inverse.
3. Triviality versus sections is Stacks Lemma 21.4.2; naturality and pullback compatibility follow from functoriality of the Yoneda description of Ext^1.

*Acceptance.* For H = G_m on X_et the bijection recovers Pic(X) (SF.2/hilbert-90). For a field K and H = μ_n with n invertible, the bijection identifies H^1(Spec K_et, μ_n) with μ_n-torsors, i.e. K^×/K^{×n} (Kummer).

*Depends on.* `CategoryTheory.Sheaf.H` (Mathlib), `CategoryTheory.Abelian.Ext` (Mathlib), `site-cohomology-pullback`.

*Source.* Stacks Project, Tag 03AG (Section 21.4), Definition 21.4.1, Lemmas 21.4.2–21.4.3.

*Suggested home.* `TauCeti/CategoryTheory/Sites/SheafCohomology/Functoriality`, namespace `TauCeti.SchemeFoundations.SiteCohomology`.

#### Nonabelian first cohomology as torsor classes (`nonabelian-torsor-h1`, construction)

For a site C and a sheaf of (not necessarily commutative) groups G on C, define H^1(C, G) as the pointed set of isomorphism classes of G-torsors, pointed by the trivial torsor. It is functorial in G and contravariant along morphisms of sites. For a short exact sequence of sheaves of groups 1 → A → B → Q → 1 (A normal in B) construct the exact sequence of pointed sets 1 → A(C) → B(C) → Q(C) → H^1(C,A) → H^1(C,B) → H^1(C,Q), where Q(C) → H^1(C,A) sends a section to the torsor of its local lifts. When G is abelian, H^1(C,G) agrees with Sheaf.H G 1 through SF.2/abelian-torsor-h1, and the sequence agrees with the long exact sequence of Sheaf.H.

*Hypotheses.* C a site; G, A, B, Q sheaves of groups; exactness means A = ker(B → Q) and B → Q is an epimorphism of sheaves.

*Proof outline.*

1. Torsors and morphisms of torsors form a groupoid; take isomorphism classes (Stacks Definition 21.4.1).
2. Functoriality: contracted product G' ∧^G P along G → G'; pullback along morphisms of sites preserves torsors.
3. The boundary sends q ∈ Q(C) to the A-torsor of local lifts of q to B; exactness at each spot is a direct check (Giraud's nonabelian cohomology, as used for Azumaya algebras in Stacks Section 59.62 and Grothendieck GB I §5).
4. For abelian G the identification with derived H^1 is SF.2/abelian-torsor-h1.

*API.*

- `TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1` (constructor): The pointed set of isomorphism classes of G-torsors on the site C.
- `TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.mk` (constructor): The class of a G-torsor.
- `TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.mk_eq_one_iff` (characterisation): The class of P is the base point iff P has a global section.
- `TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.map` (functoriality): The map on classes induced by a morphism of sheaves of groups G → G', by contracted product, with map_id and map_comp.
- `TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.pullback` (functoriality): The map along a morphism of sites, compatible with composition.
- `TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.connecting` (constructor): For 1 → A → B → Q → 1 exact, the boundary Q(C) → H^1(C,A) sending a section to its torsor of lifts.
- `TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.exact_sequence` (relation): Exactness of 1 → A(C) → B(C) → Q(C) → H^1(A) → H^1(B) → H^1(Q) as pointed sets.
- `TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.equivSheafH` (compatibility): For abelian G, an equivalence NonabelianH1 G ≃ Sheaf.H G 1 sending mk P to the class of SF.2/abelian-torsor-h1.

*Used by.* SF.2/gerbe-h2-class — the central-extension boundary H^1(C, B) → H^2(C, A) starts from torsor classes; SchemeAndStackFoundations:SF.2/delta — the Azumaya class δ is the image of the PGL_d splitting torsor under the boundary of 1 → G_m → GL_d → PGL_d → 1; PAPER-CESNAVICIUS-19/finite-etale-push-nonabelian — nonabelian degree-one comparison H^1(V, Res G) ≅ H^1(V_{R'}, G) for finite pushforward.

*Unit tests.*

- `TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_trivial_group` (degenerate): For the trivial sheaf of groups, NonabelianH1 is a one-point set.
- `TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_abelian_agrees` (compatibility): For G = Z/2Z on the small étale site of Spec R, NonabelianH1 has two elements, matching Sheaf.H (Z/2) 1 ≅ Z/2.
- `TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_gl_n_local` (computation): For a local ring A and G = GL_n on the small Zariski site of Spec A, NonabelianH1 is a point (every locally free module of rank n on a local scheme is free).
- `TauCeti.SchemeFoundations.SiteCohomology.NonabelianH1.test_not_group` (non-example): For G = S_3 (constant) on Spec K_et with K having a cyclic cubic and a quadratic extension, NonabelianH1 is the set Hom_cont(Gal_K, S_3)/conjugacy, which carries no natural group law compatible with the base point.

*Acceptance.* The trivial torsor is the base point and maps to the base point. For G = PGL_d on X_et, the class of the splitting torsor of a degree-d Azumaya algebra (SF.2/splitting-torsor) lies in H^1(X_et, PGL_d).

*Depends on.* `abelian-torsor-h1`, `site-cohomology-pullback`, `CategoryTheory.Sheaf.H` (Mathlib).

*Source.* Stacks Project, Tag 03AG (Section 21.4), Definition 21.4.1 and Lemma 21.4.2; Stacks Project, Tag 0A2J (Section 59.62); Alexander Grothendieck, §5, Théorème 5.1 and Remarque 5.3, pp.210–211.

*Suggested home.* `TauCeti/CategoryTheory/Sites/SheafCohomology/Functoriality`, namespace `TauCeti.SchemeFoundations.SiteCohomology`.

#### Second cohomology class of a central extension boundary and of an abelian-banded gerbe (`gerbe-h2-class`, construction)

Let C be a site and 1 → A → B → Q → 1 a central extension of sheaves of groups with A abelian. Construct the boundary δ : H^1(C, Q) → H^2(C, A) (H^1 the torsor classes of SF.2/nonabelian-torsor-h1, H^2 Mathlib's Sheaf.H A 2): for a Q-torsor P, the stack of liftings of P to a B-torsor is a gerbe banded by A, and δ[P] is its class in H^2(C,A). More generally every gerbe over C whose automorphism sheaves are abelian and identified with A has a class in H^2(C, A), which vanishes iff the gerbe has a global object. On classes represented by Čech cocycles on a covering, δ is the Čech 2-cocycle obtained by lifting a Q-valued 1-cocycle to B, mapped to H^2 by the edge map of SF.2/cech-to-cohomology. The sequence H^1(C,B) → H^1(C,Q) → H^2(C,A) is exact (δ[P] = 0 iff P lifts).

*Hypotheses.* C a site; A central in B; A abelian.

*Proof outline.*

1. Gerbes with abelian band A have a class in H^2(C,A) (Stacks Section 21.11, Lemma 21.11.1, using the band constructed in Stacks Lemma 8.11.8).
2. For a Q-torsor P the category fibred in groupoids of pairs (B-torsor P', isomorphism P' ∧^B Q ≅ P) is a gerbe; its automorphism sheaves are A because A is central.
3. Čech description: on a covering trivialising P, lift the transition cocycle of P to B; the failure of the cocycle condition is an A-valued Čech 2-cocycle whose class is independent of choices; the edge map Ȟ^2 → H^2 of SF.2/cech-to-cohomology sends it to δ[P].
4. Exactness: the gerbe of liftings has a global object iff P lifts to a B-torsor.

*API.*

- `TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.boundary` (constructor): For a central extension 1 → A → B → Q → 1, the map δ : NonabelianH1 Q → Sheaf.H A 2.
- `TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.boundary_one` (simp): δ of the trivial torsor is 0.
- `TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.exact_boundary` (relation): δ[P] = 0 iff [P] is in the image of NonabelianH1 B → NonabelianH1 Q.
- `TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.boundary_pullback` (functoriality): δ commutes with pullback along morphisms of sites.
- `TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.boundary_cech` (characterisation): On a covering trivialising P, δ[P] is the image under the Čech edge map of the 2-cocycle of a lift of the transition 1-cocycle.
- `TauCeti.SchemeFoundations.SiteCohomology.Gerbe.class` (constructor): The class in H^2(C, A) of a gerbe banded by an abelian sheaf A, zero iff the gerbe has a global object.

*Used by.* SchemeAndStackFoundations:SF.2/delta — defines δ : Br_Az(X) → H^2_et(X, G_m) in Mathlib's Sheaf.H, the native H^2 bridge requested by the accepted pass; SF.2/azumaya-gerbe-class — the Brauer class of an Azumaya algebra as the class of its gerbe of trivialisations; SF.2/brauer-kummer-sequence — the boundary H^1 → H^2 of the Kummer sequence is the abelian case.

*Unit tests.*

- `TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.test_split` (degenerate): For the split central extension A → A × Q → Q, δ is identically 0.
- `TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.test_matrix_algebra` (computation): For 1 → G_m → GL_d → PGL_d → 1 on X_et and the trivial PGL_d-torsor (class of Mat_d(O_X)), δ = 0.
- `TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.test_abelian_connecting` (compatibility): For an abelian short exact sequence 0 → A → B → Q → 0, δ composed with the identification NonabelianH1 Q ≃ Sheaf.H Q 1 is the connecting map H^1(Q) → H^2(A) of Sheaf.H.
- `TauCeti.SchemeFoundations.SiteCohomology.CentralExtension.test_quaternion_real` (non-example): For X = Spec R and the Hamilton quaternions, δ of the PGL_2-torsor of H is the nonzero element of H^2(Spec R_et, G_m) ≅ Z/2, so δ is not the zero map.

*Acceptance.* For the trivial Q-torsor, δ is 0. For 1 → G_m → GL_d → PGL_d → 1 on X_et, δ applied to the splitting torsor of an Azumaya algebra is the old node SchemeAndStackFoundations:SF.2/delta; for A = Mat_d it is 0.

*Depends on.* `nonabelian-torsor-h1`, `cech-to-cohomology`, `CategoryTheory.Sheaf.H` (Mathlib).

*Source.* Stacks Project, Tag 0CJZ (Section 21.11), Lemma 21.11.1; Alexander Grothendieck, §1.3 (p.200) and §2 (Généralisation à un topos localement annelé), pp.204–205.

*Suggested home.* `TauCeti/CategoryTheory/Sites/SheafCohomology/Functoriality`, namespace `TauCeti.SchemeFoundations.SiteCohomology`.

#### Cohomology on a slice site (`slice-site-cohomology`, lemma)

Let (C, O) be a ringed site and U an object of C. Restriction to the slice site C/U sends injective O-modules to injective O_U-modules, and for every O-module F one has H^p(U, F) = H^p(C/U, F|_U) for all p, naturally in F and compatibly with restriction along maps U' → U.

*Hypotheses.* C a site; U an object; F a sheaf of O-modules (in particular an abelian sheaf for O = Z).

*Proof outline.*

1. Restriction j_U^{-1} has an exact left adjoint j_{U!} (extension by zero), so it preserves injectives.
2. Restriction is exact, so an injective resolution of F restricts to an injective resolution of F|_U; taking sections over U gives the identification (Stacks Lemma 21.7.1).

*Acceptance.* For U a final object, the identity is recovered. Requested by AlgebraicModuliForArithmeticGeometry R09.4/injective-gerbe-neutral for slice étale and fppf sites.

*Depends on.* `CategoryTheory.GrothendieckTopology.over` (Mathlib), `CategoryTheory.Sheaf.H` (Mathlib), `site-cohomology-pullback`.

*Source.* Stacks Project, Tag 03F3 (Lemma 21.7.1).

*Suggested home.* `TauCeti/CategoryTheory/Sites/SheafCohomology/Functoriality`, namespace `TauCeti.SchemeFoundations.SiteCohomology`.

#### Godement resolution of a sheaf of modules (`godement-resolution`, construction)

Let (X, O_X) be a ringed space, X_disc the discrete space on the points of X and f : X_disc → X the identity map. For every O_X-module F define the canonical resolution 0 → F → f_*f^*F → f_*f^*f_*f^*F → … (the cosimplicial resolution of the adjunction f^* ⊣ f_*). Its terms are products of skyscraper sheaves ∏_x (i_x)_*(stalks), hence flasque; it is exact; it is functorial and exact in F; and its restriction to an open U is the Godement resolution of F|_U.

*Hypotheses.* (X, O_X) any ringed space; F a sheaf of O_X-modules (abelian sheaves for O_X = Z).

*Proof outline.*

1. The unit F → f_*f^*F is a monomorphism because stalks detect sections; iterate the monad f_*f^* to obtain a cosimplicial object augmented by F.
2. Exactness is checked on stalks, where the augmented cosimplicial object has an extra degeneracy (Stacks Lemma 20.30.1).
3. Each term is a product of skyscraper sheaves, hence flasque (Mathlib skyscraper sheaves; Tau Ceti's isFlasque_skyscraperSheaf) and acyclic.
4. Compatibility with restriction to opens holds because f_*, f^* commute with restriction.

*API.*

- `TauCeti.SchemeFoundations.SiteCohomology.godementResolution` (constructor): The functor from O_X-modules to complexes of O_X-modules F ↦ (f_*f^*F → f_*f^*f_*f^*F → …) with augmentation from F.
- `TauCeti.SchemeFoundations.SiteCohomology.godementResolution_quasiIso` (characterisation): The augmentation F → godementResolution F is a quasi-isomorphism.
- `TauCeti.SchemeFoundations.SiteCohomology.godementResolution_isFlasque` (other): Every term of the resolution is flasque.
- `TauCeti.SchemeFoundations.SiteCohomology.godementResolution_exact` (functoriality): The functor F ↦ godementResolution F is exact (as a functor to complexes).
- `TauCeti.SchemeFoundations.SiteCohomology.godementResolution_restrict` (compatibility): Restriction to an open U carries godementResolution F to godementResolution (F|_U).
- `TauCeti.SchemeFoundations.SiteCohomology.sheafH_iso_godement` (compatibility): H^n(U, F) is the n-th cohomology of the complex of sections of godementResolution F over U (Mathlib's Sheaf.H).

*Used by.* AdicSpacesPartII:F0/cohomology-of-mittag-leffler-limit (request to SF.2) — Godement's canonical flasque resolution, exact in F and compatible with restriction to opens, to compute cohomology of inverse limits; SF.2/flasque-cech-vanishing — the flasque terms have vanishing higher Čech cohomology on every open cover.

*Unit tests.*

- `TauCeti.SchemeFoundations.SiteCohomology.test_godement_point` (degenerate): On a one-point space the Godement resolution of a module M is an acyclic complex augmented by M (cohomology M in degree 0 and 0 elsewhere).
- `TauCeti.SchemeFoundations.SiteCohomology.test_godement_skyscraper` (computation): For X the Sierpiński space and F the skyscraper Z at the closed point, the degree-0 term f_*f^*F has global sections Z (the product of the stalks Z at the closed point and 0 at the open point).
- `TauCeti.SchemeFoundations.SiteCohomology.test_godement_not_injective` (non-example): The terms of the Godement resolution of the constant sheaf Z on the Sierpiński space are flasque but not injective abelian sheaves (the stalk Z is not an injective abelian group).

*Acceptance.* For X a point, the resolution is F → F → F → … with alternating zero/identity differentials up to homotopy, i.e. it is exact. Its sections compute H^*(X, F) because flasque sheaves are acyclic (Tau Ceti subsingleton_H_succ_of_isFlasque).

*Depends on.* `TopCat.Sheaf.IsFlasque` (Mathlib), `skyscraperSheaf` (Mathlib), `TauCeti.Topology.subsingleton_H_succ_of_isFlasque` (Tau Ceti), `TauCeti.Topology.isFlasque_skyscraperSheaf` (Tau Ceti).

*Source.* Stacks Project, Tag 0FKR (Section 20.30), Lemmas 20.30.1–20.30.2.

*Suggested home.* `TauCeti/Topology/Sheaves/Godement`, namespace `TauCeti.SchemeFoundations.SiteCohomology`.

#### Flasque sheaves have vanishing higher Čech cohomology (`flasque-cech-vanishing`, lemma)

Let (X, O_X) be a ringed space, F a flasque O_X-module and U = {U_i} an open covering of an open U. Then Ȟ^p(U, F) = 0 for all p > 0, so Čech cohomology of flasque sheaves agrees with derived cohomology (which also vanishes in positive degree). For any morphism of ringed spaces f, R^pf_*F = 0 for p > 0.

*Hypotheses.* F flasque: every restriction map F(V) → F(W), W ⊂ V open, is surjective.

*Proof outline.*

1. Compare with an injective O_X-module containing F; the restriction maps of F onto finite intersections are surjective, which makes the Čech complex of F acyclic (Stacks Lemma 20.12.4, using 20.12.6).
2. Higher direct images vanish because R^pf_* is the sheafification of V ↦ H^p(f^{-1}V, F) and flasque sheaves are acyclic on every open (Stacks Lemma 20.12.5 with Tau Ceti's subsingleton_H'_succ_of_isFlasque).

*Acceptance.* Skyscraper sheaves have vanishing higher Čech cohomology on every open cover. The Godement resolution can be used to compute Čech cohomology.

*Depends on.* `godement-resolution`, `cech-to-cohomology`, `TopCat.Sheaf.IsFlasque` (Mathlib), `TauCeti.Topology.subsingleton_H'_succ_of_isFlasque` (Tau Ceti).

*Source.* Stacks Project, Tag 09SV (Section 20.12), Lemmas 20.12.3–20.12.6.

*Suggested home.* `TauCeti/Topology/Sheaves/Godement`, namespace `TauCeti.SchemeFoundations.SiteCohomology`.

#### Grothendieck's vanishing theorem on Noetherian spaces (`noetherian-space-vanishing`, theorem)

Let X be a Noetherian topological space of Krull dimension at most d (Mathlib's topologicalKrullDim). Then H^p(X, F) = 0 for every abelian sheaf F and every p > d.

*Hypotheses.* X Noetherian topological space with dim X ≤ d < ∞; F any abelian sheaf.

*Proof outline.*

1. Reduce to X irreducible and F a quotient of a sheaf j_!Z_U by passing to colimits (cohomology on a Noetherian space commutes with filtered colimits) and dévissage.
2. Constant sheaves on irreducible spaces are flasque, hence acyclic (Stacks 20.20.2); subsheaves of Z are handled by Stacks 20.20.6 by restricting to opens of smaller-dimensional complements.
3. Induct on d using the long exact sequence for 0 → j_!F|_U → F → i_*F|_Z → 0 with dim Z < dim X (Stacks proof of Proposition 20.20.7).

*Acceptance.* For a point (d = 0) all higher cohomology vanishes. For a Noetherian scheme of dimension 1 (e.g. Spec Z), H^p(X_Zar, F) = 0 for p ≥ 2 and every abelian Zariski sheaf F.

*Depends on.* `topologicalKrullDim` (Mathlib), `TopCat.Sheaf.IsFlasque` (Mathlib), `TauCeti.Topology.subsingleton_H_succ_of_isFlasque` (Tau Ceti), `cohomology-filtered-colimits`.

*Source.* Stacks Project, Tag 02UZ (Proposition 20.20.7, Grothendieck); Stacks Project, Tag 02UU (Section 20.20), Lemmas 20.20.1–20.20.6.

*Suggested home.* `TauCeti/Topology/Sheaves/Godement`, namespace `TauCeti.SchemeFoundations.SiteCohomology`.

#### Cohomology commutes with filtered colimits on coherent objects (`cohomology-filtered-colimits`, theorem)

(1) Let C be a site and U an object such that U and all its iterated fibre products of members of coverings are quasi-compact with cofinal finite coverings (Stacks 21.16.1 hypotheses). For a filtered system of abelian sheaves F_i, colim_i H^p(U, F_i) → H^p(U, colim_i F_i) is an isomorphism for all p. (2) For a quasi-compact quasi-separated morphism of schemes f and a filtered colimit of abelian sheaves F = colim F_i on X_Zar, R^pf_*F = colim R^pf_*F_i; in particular on a qcqs scheme H^p(X, colim F_i) = colim H^p(X, F_i) (for quasi-coherent sheaves and for arbitrary abelian sheaves). (3) On a qcqs scheme X, étale cohomology commutes with filtered colimits of abelian sheaves on X_et.

*Hypotheses.* (1) the finiteness hypotheses of Stacks Lemma 21.16.1; (2),(3) f, X quasi-compact and quasi-separated.

*Proof outline.*

1. (1) Čech cohomology on a cofinal system of finite coverings commutes with filtered colimits; combine with the Čech-to-cohomology spectral sequence and induction on p (Stacks 21.16.1).
2. (2) Qcqs schemes have a basis of quasi-compact opens with quasi-compact intersections, so (1) applies to the Zariski site; sheafify (Stacks 30.6.1).
3. (3) The étale site of a qcqs scheme satisfies the hypotheses (Stacks 59.51.4).

*Acceptance.* For a constant system the statement is trivial. For X qcqs and F = ⊕_i F_i, H^p(X, ⊕ F_i) = ⊕ H^p(X, F_i) (used for ⊕_x i_{x*}Z in Stacks 59.68.4).

*Depends on.* `cech-to-cohomology`, `site-derived-pushforward`, `CategoryTheory.Sheaf.H` (Mathlib), `AlgebraicGeometry.QuasiCompact` (Mathlib), `AlgebraicGeometry.QuasiSeparated` (Mathlib).

*Source.* Stacks Project, Tag 0737 (Section 21.16), Lemma 21.16.1; Stacks Project, Tag 07TA (Lemma 30.6.1); Stacks Project, Tag 03Q4 (Section 59.51), Lemma 59.51.4.

*Suggested home.* `TauCeti/CategoryTheory/Sites/SheafCohomology/Functoriality`, namespace `TauCeti.SchemeFoundations.SiteCohomology`.

## SF.2b — Quasi-coherent cohomology and cohomology with supports

Cohomology of O_X-modules is Tau Ceti's Scheme.Modules.Cohomology (Mathlib's Sheaf.H on the small Zariski site after forgetting the module structure). Affine acyclicity, the Čech computation on separated schemes, finite-dimensionality over a field, flat base change and coherence of proper pushforward are owned by the Tau Ceti roadmaps JacobianChallenge (Layers B, C) and StableReduction (Layer 2); this sub-layer adds the general statements the atlas needs on top of them: quasi-coherence and boundedness of higher direct images along qcqs morphisms, the cohomology of projective space, Serre vanishing for ample sheaves, the fibre-dimension bound, Serre's affineness criterion, and coherent cohomology with supports (local cohomology, its comparison with Mathlib's localCohomology of modules, flat excision, depth vanishing and Hartogs extension, Cousin complexes and Kempf's resolution theorem). Étale cohomology with supports is not planned here: it belongs to EtaleDualityAndPerverseSheaves EDC.0.

#### Higher direct images of quasi-coherent sheaves along qcqs morphisms (`qcoh-higher-direct-images`, theorem)

Let f : X → S be a quasi-compact quasi-separated morphism of schemes and F a quasi-coherent O_X-module. Then every R^pf_*F is quasi-coherent; for an affine open V = Spec A ⊂ S one has R^pf_*F|_V ≅ (H^p(f^{-1}V, F))~ and, when S is affine, H^p(X, F) = Γ(S, R^pf_*F). If S is quasi-compact there is n = n(X,S,f) with R^pf_*F = 0 for all p ≥ n and all quasi-coherent F. The cohomology groups are those of Tau Ceti's Scheme.Modules.Cohomology.

*Hypotheses.* f quasi-compact and quasi-separated; F quasi-coherent.

*Proof outline.*

1. Reduce to S affine. Use the induction principle for qcqs schemes (Stacks 30.4.1) and Mayer–Vietoris to show H^p(f^{-1}V, F) is computed by a finite Čech complex of quasi-coherent modules, using affine acyclicity (owned by JacobianChallenge Layer B) on the affine pieces.
2. The presheaf V ↦ H^p(f^{-1}V, F) on affines satisfies H^p(f^{-1}D(g),F) = H^p(f^{-1}V,F)_g (localisation commutes with the finite Čech complex), hence is quasi-coherent; R^pf_* is its sheafification by SF.2/site-derived-pushforward (Stacks 30.4.5–30.4.6).
3. The vanishing bound comes from the length of the Čech complex of a finite affine cover with separated pieces (Stacks 30.4.2, 30.4.4).

*Acceptance.* For f an affine morphism, R^pf_*F = 0 for p > 0. For f : P^n_A → Spec A and F = O(d), R^nf_*O(d) is the quasi-coherent sheaf of SF.2/projective-space-cohomology.

*Depends on.* `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (Tau Ceti), `SheafOfModules.IsQuasicoherent` (Mathlib), `AlgebraicGeometry.QuasiCompact` (Mathlib), `AlgebraicGeometry.QuasiSeparated` (Mathlib), `AlgebraicGeometry.tilde` (Mathlib), `site-derived-pushforward`, `cech-to-cohomology`, Tau Ceti JacobianChallenge, layer b coherent cohomology over k genus riemannroch serre duality.

*Source.* Stacks Project, Tag 01XH (Section 30.4), Lemmas 30.4.1–30.4.6.

*Suggested home.* `TauCeti/AlgebraicGeometry/Cohomology/QuasiCoherent`, namespace `TauCeti.SchemeFoundations.QCoh`.

#### Cohomology of line bundles on projective space (`projective-space-cohomology`, theorem)

Let R be a ring, n ≥ 0 and d ∈ Z. Then H^0(P^n_R, O(d)) is the degree-d part of R[T_0,…,T_n] (zero for d < 0); H^n(P^n_R, O(d)) is the degree-d part of the module (T_0⋯T_n)^{-1} R[T_0^{-1},…,T_n^{-1}] (zero for d > −n−1, free of rank one with basis (T_0⋯T_n)^{-1} for d = −n−1); and H^q(P^n_R, O(d)) = 0 for 0 < q < n and for q > n. These identifications are compatible with base change R → R', with multiplication by homogeneous polynomials, and globalise to R^qf_*O(d) for f : P^n_S → S. Projective space is Mathlib's Proj of the polynomial ring (AlgebraicGeometry.Proj.toSpecZero over Spec R); cohomology is Tau Ceti's Scheme.Modules.Cohomology.

*Hypotheses.* R any commutative ring; n ≥ 0; d ∈ Z.

*Proof outline.*

1. Use the standard affine cover by D_+(T_i), all of whose finite intersections are affine; by SF.2/cech-to-cohomology (3) and affine acyclicity the Čech complex of O(d) computes cohomology.
2. The Čech complex is the degree-d part of the Koszul-type complex of Laurent polynomial rings ∏ R[T]_{T_{i_0}⋯T_{i_p}}; compute its cohomology monomial by monomial (Stacks proof of Lemma 30.8.1).
3. Base change and multiplication compatibilities follow from naturality of the Čech complex (Stacks 30.8.2); globalise with SF.2/qcoh-higher-direct-images (Stacks 30.8.3).

*Acceptance.* For n = 1, d = −2: H^1(P^1_R, O(−2)) ≅ R and H^0 = 0. For d = 0: H^0(P^n_R, O) = R and H^q = 0 for q > 0. For R = k a field, χ(O(d)) = binomial(n+d, n) for all d.

*Depends on.* `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (Tau Ceti), `AlgebraicGeometry.Proj.toSpecZero` (Mathlib), `MvPolynomial` (Mathlib), `cech-to-cohomology`, `qcoh-higher-direct-images`, Tau Ceti JacobianChallenge, layer b coherent cohomology over k genus riemannroch serre duality.

*Source.* Stacks Project, Tag 01XS (Section 30.8), Lemmas 30.8.1–30.8.3.

*Suggested home.* `TauCeti/AlgebraicGeometry/Cohomology/QuasiCoherent`, namespace `TauCeti.SchemeFoundations.QCoh`.

#### Serre vanishing and finiteness for ample invertible sheaves (`ample-serre-vanishing`, theorem)

Let R be a Noetherian ring, f : X → Spec R proper, L an ample invertible O_X-module and F a coherent O_X-module. Then the H^p(X, F) are finite R-modules, and there is n_0 such that H^p(X, F ⊗ L^{⊗n}) = 0 for all p > 0 and n ≥ n_0. Conversely, for proper X over Noetherian R, an invertible L with this vanishing property for every coherent F is ample. The relative version holds for proper f over a Noetherian base with L f-ample.

*Hypotheses.* R Noetherian; X → Spec R proper; L ample (resp. f-ample); F coherent.

*Proof outline.*

1. Finiteness of H^p(X,F) for proper X over Noetherian R is the coherence theorem (Stacks 30.19.2), owned in curve and proper-flat generality by StableReduction Layer 2.
2. For projective X (L very ample after a power), reduce to P^N_R by pushing forward and apply SF.2/projective-space-cohomology to resolutions by sums of O(−m) (Stacks 30.16.1–30.16.2).
3. For proper X use that ampleness is equivalent to the vanishing criterion (Stacks Lemma 30.17.1).

*Acceptance.* For X = P^n_R and L = O(1), n_0 can be taken so that F(n) is globally generated with vanishing higher cohomology; for F = O, H^p(P^n, O(m)) = 0 for p > 0, m ≥ 0. For an affine X every invertible L is ample and the statement reduces to affine acyclicity.

*Depends on.* `projective-space-cohomology`, `qcoh-higher-direct-images`, `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (Tau Ceti), Tau Ceti StableReduction, layer 2 coherent curve theory duality and positivity, Tau Ceti JacobianChallenge, layer b coherent cohomology over k genus riemannroch serre duality.

*Source.* Stacks Project, Tag 01XO (Section 30.17), Lemma 30.17.1; Stacks Project, Tag 0B5S (Section 30.16), Lemmas 30.16.1–30.16.2; Stacks Project, Tag 02O3 (Section 30.19), Lemma 30.19.2.

*Suggested home.* `TauCeti/AlgebraicGeometry/Cohomology/QuasiCoherent`, namespace `TauCeti.SchemeFoundations.QCoh`.

#### Higher direct images vanish above the fibre dimension (`proper-fibre-dimension-vanishing`, theorem)

Let f : X → Y be proper with Y locally Noetherian, y ∈ Y with dim X_y = d, and F a coherent O_X-module. Then (R^pf_*F)_y = 0 for all p > d. In particular, if all fibres have dimension at most 1 then R^pf_*F = 0 for p ≥ 2.

*Hypotheses.* Y locally Noetherian; f proper; F coherent.

*Proof outline.*

1. By the theorem on formal functions, the completion of (R^pf_*F)_y is lim_n H^p(X_n, F_n) on the infinitesimal thickenings X_n of X_y (Stacks proof of 30.20.9).
2. Each X_n has the same underlying space as X_y, of dimension d, so H^p(X_n, F_n) = 0 for p > d by SF.2/noetherian-space-vanishing.
3. A finite module over a Noetherian local ring with zero completion is zero.

*Acceptance.* For f finite (d = 0), R^pf_*F = 0 for p > 0. For a proper flat family of curves over a DVR, R^2f_*F = 0 (used by StableReduction Layer 2 and Witaszek's resolution argument).

*Depends on.* `noetherian-space-vanishing`, `qcoh-higher-direct-images`, Tau Ceti StableReduction, layer 2 coherent curve theory duality and positivity, `AlgebraicGeometry.IsProper` (Mathlib), `AlgebraicGeometry.IsLocallyNoetherian` (Mathlib).

*Source.* Stacks Project, Tag 02V7 (Lemma 30.20.9).

*Suggested home.* `TauCeti/AlgebraicGeometry/Cohomology/QuasiCoherent`, namespace `TauCeti.SchemeFoundations.QCoh`.

#### Serre's cohomological criterion for affineness (`serre-affineness-criterion`, theorem)

A quasi-compact scheme X is affine if and only if H^1(X, I) = 0 for every quasi-coherent sheaf of ideals I ⊂ O_X. If X is moreover quasi-separated it suffices to test quasi-coherent ideals of finite type. Relative form: a quasi-compact morphism f : X → Y with X and Y quasi-separated is affine iff R^1f_*I = 0 for every quasi-coherent ideal I.

*Hypotheses.* X quasi-compact (and quasi-separated for the finite-type variant).

*Proof outline.*

1. Only if: affine acyclicity (JacobianChallenge Layer B).
2. If: for a closed point x and an affine neighbourhood U, use vanishing of H^1 for the ideal of the closed complement to produce f ∈ Γ(X,O) with x ∈ X_f ⊂ U; finitely many such X_f cover X and the f generate the unit ideal, which forces X affine (Stacks 30.3.1–30.3.2, 30.3.4).

*Acceptance.* The punctured plane A^2_k ∖ {0} is not affine: H^1(A^2∖0, O) ≠ 0 (it contains the classes x^{-a}y^{-b}, a,b ≥ 1). Used by Kedlaya–Liu Lemma 8.8.8 (PAPER-KEDLAYA-LIU-15/345).

*Depends on.* `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (Tau Ceti), `AlgebraicGeometry.IsAffine` (Mathlib), `AlgebraicGeometry.QuasiCompact` (Mathlib), `qcoh-higher-direct-images`, Tau Ceti JacobianChallenge, layer b coherent cohomology over k genus riemannroch serre duality.

*Source.* Stacks Project, Tag 01XE (Section 30.3), Lemmas 30.3.1, 30.3.2 and 30.3.4.

*Suggested home.* `TauCeti/AlgebraicGeometry/Cohomology/QuasiCoherent`, namespace `TauCeti.SchemeFoundations.QCoh`.

#### Cohomology with supports in a closed subset (`sheaf-cohomology-with-supports`, construction)

Let (X, O_X) be a ringed space and Z ⊂ X closed with open complement U. Define Γ_Z(X, F) = {s ∈ F(X) : Supp s ⊂ Z}, the subsheaf H_Z(F) of sections supported in Z, their right derived functors RΓ_Z(X, −) : D(O_X) → D(O_X(X)) and RH_Z : D(O_X) → D(O_X|_Z), and H^q_Z(X, F) = H^q(RΓ_Z(X,F)), H^q_Z(F) = H^q(RH_Z(F)). Then RH_Z is right adjoint to i_* : D(O_X|_Z) → D(O_X), RΓ(Z, −) ∘ RH_Z = RΓ_Z(X, −), and the abelian-group and O_X-module versions agree. For schemes and quasi-coherent F these are the local cohomology groups of Stacks Chapter 51; on Spec A with Z = V(I), I finitely generated, they agree with Mathlib's localCohomology (SF.2/local-cohomology-module-comparison). This is coherent (Zariski) cohomology with supports; étale cohomology with supports is owned by EtaleDualityAndPerverseSheaves EDC.0, and equivariant supports by SchemeAndStackFoundations:SF.2/support.

*Hypotheses.* (X, O_X) a ringed space; Z closed; complexes may be unbounded (K-injective resolutions).

*Proof outline.*

1. Γ_Z(X,−) is left exact as the kernel of restriction to U; derive it with K-injective resolutions (Stacks 20.21, 20.34).
2. H_Z sends K-injectives to K-injectives on Z (Stacks 20.34.3), giving the composite formula 20.34.4 and the adjunction 20.34.1.
3. Agreement of module and abelian versions: Stacks 20.34.8.

*API.*

- `TauCeti.SchemeFoundations.Supports.sectionsWithSupport` (constructor): Γ_Z(X, F) as the kernel of F(X) → F(X ∖ Z), functorial in F.
- `TauCeti.SchemeFoundations.Supports.supportedSubsheaf` (constructor): The sheaf H_Z(F) on Z of sections supported in Z.
- `TauCeti.SchemeFoundations.Supports.cohomologyWithSupport` (constructor): H^q_Z(X, F) := R^qΓ_Z(X, F), with its O_X(X)-module structure.
- `TauCeti.SchemeFoundations.Supports.localCohomologySheaf` (constructor): H^q_Z(F) := R^qH_Z(F) as O_X|_Z-modules.
- `TauCeti.SchemeFoundations.Supports.cohomologyWithSupport_zero` (simp): H^0_Z(X, F) = Γ_Z(X, F).
- `TauCeti.SchemeFoundations.Supports.cohomologyWithSupport_univ` (simp): For Z = X, H^q_Z(X,F) = H^q(X,F); for Z = ∅ it vanishes.
- `TauCeti.SchemeFoundations.Supports.rHZ_adjunction` (universal-property): RH_Z is right adjoint to i_* on derived categories.
- `TauCeti.SchemeFoundations.Supports.localToGlobal` (relation): The spectral sequence H^p(Z, H^q_Z(K)) ⇒ H^{p+q}_Z(X, K).
- `TauCeti.SchemeFoundations.Supports.cohomologyWithSupport_pullback` (functoriality): For a morphism f : X' → X and Z' = f^{-1}Z, the pullback maps H^p_Z(X,K) → H^p_{Z'}(X', Lf^*K) compatible with the maps to H^p(X,K).

*Used by.* PAPER-PILLONI-20/external-sga2-depth-extension — H^i_Z(Y, F) = 0 for i ≤ 1 on Cohen–Macaulay Y with codim Z ≥ 2; PAPER-KINGS-SPRANG-25/031 — local cohomology of a closed subscheme as a colimit of Ext; PAPER-BOXER-CALEGARI-GEE-PILLONI-21/220 — the terms H^i_{Z_i/Z_{i+1}}(F) of the Cousin complex are cohomology with supports; PAPER-CESNAVICIUS-22/support-cohomology — RΓ_Z(S, F) as the fibre of RΓ(S,F) → RΓ(S∖Z, F) for quasi-coherent F.

*Unit tests.*

- `TauCeti.SchemeFoundations.Supports.test_support_all` (degenerate): For Z = X, H^1_Z(X, F) = H^1(X, F).
- `TauCeti.SchemeFoundations.Supports.test_support_empty` (degenerate): For Z = ∅, H^q_Z(X, F) = 0 for all q.
- `TauCeti.SchemeFoundations.Supports.test_support_affine_line_origin` (computation): For X = A^1_k and Z the origin, H^1_Z(X, O) ≅ k[t,t^{-1}]/k[t] (a k-vector space with basis t^{-1}, t^{-2}, …) and H^0_Z(X,O) = 0.
- `TauCeti.SchemeFoundations.Supports.test_support_not_restriction` (non-example): H^0_Z(X,F) is not F(Z): for X = A^1_k, Z = origin, F = O, F restricted to Z has sections k while H^0_Z(X,O) = 0.

*Acceptance.* For Z = X, RΓ_Z(X,−) = RΓ(X,−); for Z = ∅ it is 0. On Spec of a Noetherian local ring and Z the closed point, H^0_Z(M) is the m-power torsion of M.

*Depends on.* `AlgebraicGeometry.Scheme.Modules` (Mathlib), `DerivedCategory` (Mathlib), `CategoryTheory.Functor.rightDerived` (Mathlib), `localCohomology` (Mathlib), `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (Tau Ceti).

*Source.* Stacks Project, Tag 0A39 (Section 20.21); Stacks Project, Tag 0G6Y (Section 20.34), Lemmas 20.34.1–20.34.8.

*Suggested home.* `TauCeti/AlgebraicGeometry/Cohomology/Supports`, namespace `TauCeti.SchemeFoundations.Supports`.

#### Localization triangles for cohomology with supports (`supports-localization-triangle`, theorem)

For a ringed space X, closed Z with complement j : U → X and K ∈ D(O_X) there are distinguished triangles RΓ_Z(X,K) → RΓ(X,K) → RΓ(U,K) → and i_*RH_Z(K) → K → Rj_*(K|_U) →, functorial in K and compatible with pullback along morphisms of ringed spaces, giving the long exact sequence … → H^i_Z(X,K) → H^i(X,K) → H^i(U,K) → H^{i+1}_Z(X,K) → …. Excision: if V ⊂ X is open with Z ⊂ V then H^i_Z(X,K) ≅ H^i_Z(V, K|_V). On Spec A with Z = V(I), U = Spec A ∖ Z and M an A-module this gives the exact sequence 0 → H^0_I(M) → M → Γ(U, M~) → H^1_I(M) → 0.

*Hypotheses.* X ringed space; Z closed; K ∈ D(O_X).

*Proof outline.*

1. Injective (K-injective) modules restrict surjectively to U with kernel Γ_Z (Stacks 20.21 and Lemma 20.34.5); the sheaf version is 20.34.6.
2. Excision: H_Z(F) depends only on F near Z, and restriction to V preserves K-injectives (Stacks 20.34.7).
3. The affine four-term sequence is the degree 0–1 part of the long exact sequence with Serre vanishing on Spec A (Stacks 51.2.1–51.2.2).

*Acceptance.* For Z = X, RΓ(U,K) = 0 and the triangle is trivial. For X = A^2_k, Z the origin: H^1(A^2∖0, O) ≅ H^2_Z(A^2, O) ≠ 0, so the punctured plane is not affine.

*Depends on.* `sheaf-cohomology-with-supports`, `DerivedCategory` (Mathlib), `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (Tau Ceti).

*Source.* Stacks Project, Tag 0G6Y (Section 20.34), Lemmas 20.34.5–20.34.7; Stacks Project, Tag 0DWQ (Section 51.2), Lemmas 51.2.1–51.2.2.

*Suggested home.* `TauCeti/AlgebraicGeometry/Cohomology/Supports`, namespace `TauCeti.SchemeFoundations.Supports`.

#### Local cohomology of sheaves and of modules (`local-cohomology-module-comparison`, comparison)

Let A be a ring, I ⊂ A finitely generated, Z = V(I) ⊂ X = Spec A and M an A-module. Then H^q_Z(X, M~) ≅ H^q(RΓ_Z(M)) where RΓ_Z(M) is computed by the extended Čech complex M → ∏ M_{f_i} → ∏ M_{f_if_j} → … on generators f_1,…,f_r of I; if A is Noetherian these groups equal colim_n Ext^q_A(A/I^n, M), i.e. Mathlib's localCohomology for the ideals I^n, naturally in M. Globally, for a Noetherian scheme X and closed subscheme with ideal sheaf I, H^q_Z(X, F) ≅ colim_n Ext^q_{O_X}(O_X/I^n, F) for every O_X-module F.

*Hypotheses.* I finitely generated (Noetherian for the Ext-colimit formula).

*Proof outline.*

1. The extended Čech complex computes the right adjoint RΓ_Z to D_{I^∞-torsion}(A) → D(A) (Stacks 47.9.1).
2. Compare with sheaf cohomology with supports through D(A) ≅ D_QCoh(O_X) (Stacks 51.2.1).
3. For Noetherian A, torsion modules and the Ext colimit agree (Stacks 47.10.1–47.10.2; SGA 2 Exposé II); globalise by the local-to-global spectral sequence of SF.2/sheaf-cohomology-with-supports.

*Acceptance.* For I = 0 (Z = X): H^q_Z = H^q(Spec A, M~) = 0 for q > 0 and H^0 = M. For A = k[x], I = (x): H^1_I(A) = k[x,x^{-1}]/k[x].

*Depends on.* `sheaf-cohomology-with-supports`, `localCohomology` (Mathlib), `AlgebraicGeometry.tilde` (Mathlib), `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (Tau Ceti).

*Source.* Stacks Project, Tag 0A6R (Lemma 47.9.1); Stacks Project, Tag 0BJD (Section 47.10), Lemmas 47.10.1–47.10.2; Stacks Project, Tag 0A6T (Lemma 51.2.1); Alexander Grothendieck (with M. Raynaud), Exposé II (Théorème 6 as cited by Kings–Sprang (2.6.1)).

*Suggested home.* `TauCeti/AlgebraicGeometry/Cohomology/Supports`, namespace `TauCeti.SchemeFoundations.Supports`.

#### Flat base change and flat excision for local cohomology (`local-cohomology-flat-base-change`, theorem)

Let A → B be a ring map, I ⊂ A finitely generated and J = IB. Then RΓ_{V(I)}(K) ⊗^L_A B ≅ RΓ_{V(J)}(K ⊗^L_A B) functorially in K ∈ D(A); for B flat over A this gives H^q_I(M) ⊗_A B ≅ H^q_J(M ⊗_A B). If A → B is flat and A/I → B/IB is an isomorphism, then every I-power-torsion A-module N satisfies N ≅ N ⊗_A B, so H^q_I(M) ≅ H^q_J(M ⊗_A B) (flat excision). Consequently, for a flat map of affine Noetherian schemes S' → S that is an isomorphism over a closed Z, RΓ_Z(S, F) → RΓ_{Z'}(S', F_{S'}) is an isomorphism for every quasi-coherent F; and sections over a quasi-compact open commute with flat base change: Γ(U, M~) ⊗_A B ≅ Γ(U_B, (M ⊗_A B)~).

*Hypotheses.* I finitely generated; flatness where stated.

*Proof outline.*

1. The extended Čech complex commutes with base change (Stacks 47.9.3); flatness makes derived tensor underived.
2. Under A/I ≅ B/IB with A → B flat, I-power torsion modules are unchanged by − ⊗_A B (Stacks 15.91.2).
3. Sections over quasi-compact U: combine the four-term sequence of SF.2/supports-localization-triangle with the above, or use flat base change for quasi-coherent cohomology (JacobianChallenge Layer C).

*Acceptance.* For B = A_f with f ∈ I a unit after localisation, both sides vanish. For A → Â the I-adic completion of a Noetherian ring, H^q_I(M) ≅ H^q_{IÂ}(M ⊗ Â) (A/I ≅ Â/IÂ).

*Depends on.* `local-cohomology-module-comparison`, `supports-localization-triangle`, Tau Ceti JacobianChallenge, layer c relative coherent cohomology and base change.

*Source.* Stacks Project, Tag 0ALZ (Lemma 47.9.3); Stacks Project, Tag 05E9 (Lemma 15.91.2).

*Suggested home.* `TauCeti/AlgebraicGeometry/Cohomology/Supports`, namespace `TauCeti.SchemeFoundations.Supports`.

#### Depth controls vanishing of local cohomology (`depth-local-cohomology-vanishing`, theorem)

Let A be Noetherian, I ⊂ A an ideal and M a finite A-module with IM ≠ M. Then depth_I(M) is the smallest i with Ext^i_A(A/I, M) ≠ 0 and also the smallest i with H^i_I(M) ≠ 0. Globally, for a locally Noetherian scheme X, a closed subset Z and a coherent F with depth_{O_{X,z}}(F_z) ≥ n at every z ∈ Z, H^i_Z(X, F) = 0 for i < n. Corollary (Hartogs): if X is Cohen–Macaulay, F is locally free and codim(Z, X) ≥ 2, then H^0(X,F) → H^0(X ∖ Z, F) is bijective and H^1(X,F) → H^1(X ∖ Z,F) is injective.

*Hypotheses.* A Noetherian; M finite; for the global statement X locally Noetherian and F coherent.

*Proof outline.*

1. Algebra: induction on depth using a regular element x ∈ I and the long exact sequences for 0 → M → M → M/xM → 0 (Stacks 47.11.1, 47.11.3).
2. Globalise: the local cohomology sheaves H^i_Z(F) have stalks the local cohomology of the stalks (local-to-global spectral sequence and SF.2/local-cohomology-module-comparison), which vanish below the depth.
3. Hartogs: on a Cohen–Macaulay scheme depth_z O = dim O_{X,z} ≥ 2 at points of Z; apply SF.2/supports-localization-triangle.

*Acceptance.* For A regular local of dimension d and I = m: H^i_m(A) = 0 for i < d and H^d_m(A) ≠ 0. For Y Cohen–Macaulay and F locally free with codim Z ≥ 2 (PAPER-PILLONI-20): H^i_Z(Y,F) = 0 for i ≤ 1.

*Depends on.* `local-cohomology-module-comparison`, `supports-localization-triangle`, `sheaf-cohomology-with-supports`, `localCohomology` (Mathlib).

*Source.* Stacks Project, Tag 0AVY (Section 47.11), Lemmas 47.11.1 and 47.11.3; Stacks Project, Tag 0DWW (Section 51.9); Alexander Grothendieck (with M. Raynaud), Exposé III, §3 (as cited by Pilloni, proof of Lemma 14.9.2, p.103).

*Suggested home.* `TauCeti/AlgebraicGeometry/Cohomology/Supports`, namespace `TauCeti.SchemeFoundations.Supports`.

#### Cousin complex of a filtration by closed subsets (`cousin-complex`, construction)

Let X be a topological space with a decreasing filtration Z : X = Z_0 ⊇ Z_1 ⊇ … by closed subsets and F an abelian sheaf. Define H^k_{Z_i/Z_{i+1}}(F) as the k-th derived functor of G ↦ (U ↦ Γ_{Z_i∖Z_{i+1}}(U ∖ Z_{i+1}, G)). The Cousin complex Cous_Z(F) has degree-i term H^i_{Z_i/Z_{i+1}}(F), differentials the boundary maps of the triples (Z_i, Z_{i+1}, Z_{i+2}), and an augmentation F → Cous_Z(F). For X Noetherian and F quasi-coherent, Cous_Z(F) is a complex of quasi-coherent sheaves; if each Z_i ∖ Z_{i+1} → X is affine then H^k_{Z_i/Z_{i+1}}(F) vanishes for k ≠ i.

*Hypotheses.* X topological space (Noetherian scheme for the quasi-coherence statement); Z a filtration by closed subsets.

*Proof outline.*

1. The functors of sections supported in Z_i ∖ Z_{i+1} relative to Z_{i+1} are left exact; derive them (Kempf 1978, Lemma 7.3, as used in BCGP §3.9.5).
2. Boundary maps come from the triangles relating supports in Z_{i+1}, Z_i and the difference (SF.2/supports-localization-triangle); composites of consecutive boundaries vanish.
3. Quasi-coherence and the affine vanishing are Kempf Lemma 8.5(e) and Theorem 9.6(c) as quoted in BCGP (3.9.8).

*API.*

- `TauCeti.SchemeFoundations.Supports.relativeSupportCohomology` (constructor): H^k_{Z_i/Z_{i+1}}(F), the derived functors of sections supported in Z_i ∖ Z_{i+1} modulo Z_{i+1}.
- `TauCeti.SchemeFoundations.Supports.cousinComplex` (constructor): The complex Cous_Z(F) with augmentation F → Cous_Z(F)^0, functorial in F.
- `TauCeti.SchemeFoundations.Supports.cousinComplex_d_comp_d` (relation): Consecutive differentials compose to zero.
- `TauCeti.SchemeFoundations.Supports.cousinComplex_isQuasicoherent` (other): For X Noetherian and F quasi-coherent, each term is quasi-coherent.
- `TauCeti.SchemeFoundations.Supports.relativeSupportCohomology_eq_zero_of_affine` (characterisation): If Z_i ∖ Z_{i+1} → X is affine then H^k_{Z_i/Z_{i+1}}(F) = 0 for k ≠ i (quasi-coherent F).
- `TauCeti.SchemeFoundations.Supports.cousinComplex_trivial` (simp): For the filtration X ⊇ ∅, the Cousin complex is F concentrated in degree 0.

*Used by.* PAPER-BOXER-CALEGARI-GEE-PILLONI-21/49 (Theorem 3.9.6, Kempf) — the augmentation F → Cous_Z(F) is a quasi-isomorphism for maximal Cohen–Macaulay F; SF.2/kempf-cousin-resolution — the resolution theorem; AutomorphicBundles and higher Coleman theory consumers via BCGP §3.9 — Cousin resolutions compute coherent cohomology of automorphic vector bundles through strata.

*Unit tests.*

- `TauCeti.SchemeFoundations.Supports.test_cousin_trivial_filtration` (degenerate): For Z_0 = X, Z_1 = ∅ the augmentation F → Cous_Z(F) is an isomorphism onto F in degree 0.
- `TauCeti.SchemeFoundations.Supports.test_cousin_dvr` (computation): For X = Spec of a DVR R with fraction field K and Z_1 = closed point, Cous_Z(O_X) is K → K/R in degrees 0, 1, and the augmentation R → (K → K/R) is a resolution.
- `TauCeti.SchemeFoundations.Supports.test_cousin_not_resolution` (non-example): For X = Spec k[x,y]/(xy, y^2) (not Cohen–Macaulay, embedded point at the origin) with Z_1 = origin, the augmentation O_X → Cous_Z(O_X) is not injective on global sections (the class of y is supported at the origin), so it is not a resolution.

*Acceptance.* For the trivial filtration Z_0 = X, Z_1 = ∅, Cous_Z(F) = F in degree 0. For X = Spec of a 1-dimensional Noetherian local domain with Z_1 the closed point, Cous(O) is K → H^1_m(O).

*Depends on.* `sheaf-cohomology-with-supports`, `supports-localization-triangle`, `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (Tau Ceti).

*Source.* George Boxer, Frank Calegari, Toby Gee, §3.9.5 with (3.9.8), arXiv:1812.09269v3 pp.63–64.

*Suggested home.* `TauCeti/AlgebraicGeometry/Cohomology/Supports`, namespace `TauCeti.SchemeFoundations.Supports`.

#### Cousin complexes of maximal Cohen–Macaulay sheaves are resolutions (`kempf-cousin-resolution`, theorem)

Let X be a Noetherian scheme with a filtration Z_0 = X ⊇ Z_1 ⊇ … by closed subschemes such that codim_X(Z_i) ≥ i and each Z_i ∖ Z_{i+1} → X is affine. Then for every maximal Cohen–Macaulay coherent sheaf F on X the augmentation F → Cous_Z(F) is a quasi-isomorphism. If moreover each Z_i ∖ Z_{i+1} is affine, the terms of Cous_Z(F) are Γ(X,−)-acyclic, so H^*(X,F) is the cohomology of Γ(X, Cous_Z(F)).

*Hypotheses.* X Noetherian; codim Z_i ≥ i; strata affine over X; F maximal Cohen–Macaulay coherent.

*Proof outline.*

1. By SF.2/depth-local-cohomology-vanishing and the codimension hypothesis, the relative local cohomology H^k_{Z_i/Z_{i+1}}(F) vanishes for k ≠ i (Cohen–Macaulay depth equals codimension).
2. The spectral sequence of the filtration by supports then degenerates to the Cousin complex, which is therefore a resolution (Kempf 1978 Thm 10.9, as stated in BCGP Theorem 3.9.6).
3. Acyclicity of the terms for affine strata: Kempf Thm 9.6 (BCGP Remark 3.9.7) together with affine acyclicity.

*Acceptance.* For X regular of dimension 1 and Z_1 the closed points, O_X → (K → ⊕_x K/O_x) is the classical Cousin resolution. Example 3.9.9 of BCGP: twisted Koszul complexes of properly intersecting effective Cartier divisors.

*Depends on.* `cousin-complex`, `depth-local-cohomology-vanishing`, `supports-localization-triangle`, Tau Ceti JacobianChallenge, layer b coherent cohomology over k genus riemannroch serre duality.

*Source.* George Boxer, Frank Calegari, Toby Gee, Theorem 3.9.6, Remark 3.9.7, Example 3.9.9, arXiv:1812.09269v3 pp.64–65.

*Suggested home.* `TauCeti/AlgebraicGeometry/Cohomology/Supports`, namespace `TauCeti.SchemeFoundations.Supports`.

## SF.2c — Topologies of a scheme, coefficient sheaves and the Nisnevich site

Mathlib has the big Zariski, étale, fppf, fpqc and pro-étale topologies on schemes, the small étale and pro-étale sites, geometric points of the small étale site and Grothendieck abelian sheaf categories on it. It has no comparison of cohomology across topologies, no named coefficient sheaves G_a, G_m, μ_n, and no Nisnevich topology (its MayerVietorisSquare docstring names the Nisnevich case as the intended example). This sub-layer supplies the big-site sheaf of a quasi-coherent module, the coefficient sheaves for every n (not only n invertible), the comparison morphisms between the topologies, the comparisons of cohomology at each coefficient level (quasi-coherent: all topologies agree; étale sheaves: étale = fppf; smooth commutative group schemes: étale = fppf, false for μ_p, α_p), Hilbert 90, the fppf Kummer and étale Artin–Schreier sequences, finite pushforward, and the complete Nisnevich theory required by the K-theory roadmaps.

#### The big-site sheaf of a quasi-coherent module (`big-site-quasi-coherent-sheaf`, construction)

For a scheme S and a quasi-coherent O_S-module F, let F^a be the presheaf on Sch/S sending (T, h : T → S) to Γ(T, h^*F). For τ ∈ {Zariski, étale, smooth, syntomic, fppf, fpqc} (Mathlib's zariskiTopology, etaleTopology, fppfTopology, fpqcTopology restricted to Sch/S, and the small étale site S_et) F^a is a τ-sheaf of O-modules; F ↦ F^a is exact, commutes with pullback, sends O_S to the structure sheaf O (with O(T) = Γ(T, O_T)) and is fully faithful on quasi-coherent modules.

*Hypotheses.* S a scheme; F quasi-coherent; τ one of the listed topologies.

*Proof outline.*

1. The sheaf condition for Zariski coverings is the sheaf property of h^*F; for a faithfully flat quasi-compact cover Spec B → Spec A it is exactness of the Amitsur complex M → M ⊗ B → M ⊗ B ⊗ B (faithfully flat descent of modules), and every τ-covering is refined by a combination of these (Stacks Lemma 35.8.1).
2. Exactness and pullback compatibility hold because h^* of quasi-coherent modules is right exact and exactness of quasi-coherent sequences can be checked on affines after flat base change.
3. Full faithfulness: F is recovered from F^a on the small Zariski site.

*API.*

- `TauCeti.SchemeFoundations.Topologies.bigSheaf` (constructor): F ↦ F^a from quasi-coherent O_S-modules to τ-sheaves of O-modules on Sch/S, with F^a(T) = Γ(T, h^*F).
- `TauCeti.SchemeFoundations.Topologies.bigSheaf_obj` (simp): Sections of F^a over (T, h) are Γ(T, h^*F).
- `TauCeti.SchemeFoundations.Topologies.bigSheaf_isSheaf` (characterisation): F^a is a sheaf for each listed topology, including fpqc.
- `TauCeti.SchemeFoundations.Topologies.bigSheaf_exact` (functoriality): F ↦ F^a sends short exact sequences of quasi-coherent modules to short exact sequences of τ-sheaves.
- `TauCeti.SchemeFoundations.Topologies.bigSheaf_pullback` (compatibility): For g : S' → S, (g^*F)^a is the restriction of F^a to Sch/S'.
- `TauCeti.SchemeFoundations.Topologies.bigSheaf_structureSheaf` (example): (O_S)^a is the structure sheaf O of the big site, i.e. G_a as a sheaf of rings.
- `TauCeti.SchemeFoundations.Topologies.bigSheaf_fullyFaithful` (equivalence): F ↦ F^a is fully faithful on quasi-coherent modules.

*Used by.* SF.2/quasi-coherent-topology-comparison — the comparison H^p(S_Zar, F) ≅ H^p_τ(S, F^a); PAPER-CESNAVICIUS-22/affine-vector-acyclic and PAPER-GILLE-PARIMALA-26/120 — vector groups and additive torsors are the sheaves F^a; their cohomology vanishes on affines; PrismaticCohomology:PR.4 (request to SF.2) — vanishing of higher cohomology of W_n(O) and of G_a on affines in the étale topology.

*Unit tests.*

- `TauCeti.SchemeFoundations.Topologies.test_bigSheaf_zero` (degenerate): For F = 0, F^a is the zero sheaf.
- `TauCeti.SchemeFoundations.Topologies.test_bigSheaf_spec_field` (computation): For S = Spec k and F = O_S, F^a(Spec L) = L for every field extension L/k.
- `TauCeti.SchemeFoundations.Topologies.test_bigSheaf_zariski_restriction` (compatibility): Restricting F^a to the small Zariski site of S gives back F (as a sheaf on the topological space of S).
- `TauCeti.SchemeFoundations.Topologies.test_bigSheaf_not_topological_pullback` (non-example): For S = Spec Q, F = O_S and T = Spec Q(i), F^a(T) = Q(i); the topological inverse image h^{-1}F would give sections Q, so the definition must use the module pullback h^*F.

*Acceptance.* O^a is the structure sheaf of the big fppf site (fpqc topology is subcanonical: Mathlib's instance fpqcTopology.Subcanonical). For F = O_S^{⊕n}, F^a is G_a^n.

*Depends on.* `AlgebraicGeometry.Scheme.fpqcTopology` (Mathlib), `AlgebraicGeometry.Scheme.fppfTopology` (Mathlib), `AlgebraicGeometry.Scheme.etaleTopology` (Mathlib), `AlgebraicGeometry.Scheme.zariskiTopology` (Mathlib), `SheafOfModules.IsQuasicoherent` (Mathlib), `AlgebraicGeometry.Scheme.Modules.pullback` (Mathlib), `SchemeAndStackFoundations:SF.1`.

*Source.* Stacks Project, Tag 03DT (Lemma 35.8.1); Stacks Project, Tag 03OF (Section 59.17).

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Comparison`, namespace `TauCeti.SchemeFoundations.Topologies`.

#### The sheaves G_m, G_a and μ_n on schemes (`multiplicative-additive-group-sheaves`, definition)

On the big site Sch/S with any topology τ coarser than fpqc, G_a(T) = Γ(T, O_T) (additive), G_m(T) = Γ(T, O_T)^× and, for every integer n ≥ 1, μ_n(T) = {t ∈ Γ(T,O_T)^× : t^n = 1}; each is representable (by A^1, A^1 ∖ 0 and Spec Z[t]/(t^n−1) base-changed to S), hence a τ-sheaf of abelian groups. Their restrictions to the small étale, Nisnevich and Zariski sites are denoted by the same letters; on the small étale site with n invertible on S, μ_n is the roots-of-unity sheaf of CohomologicalPointCounting ConstructibleEtale Layer 6 (a finite locally constant sheaf of Z/n-modules). The n-th power map G_m → G_m has kernel μ_n for every n. No invertibility of n is assumed in the definition.

*Hypotheses.* S a scheme; n ≥ 1 any integer.

*Proof outline.*

1. Representability gives the sheaf property for every subcanonical topology (Mathlib: fpqcTopology.Subcanonical, fppfTopology.Subcanonical).
2. Kernels of maps of sheaves are computed sectionwise, so μ_n = ker((·)^n : G_m → G_m).
3. Identification with the CPC sheaf: both are subsheaves of G_m on S_et with the same sections.

*API.*

- `TauCeti.SchemeFoundations.Topologies.Ga` (constructor): The sheaf of abelian groups T ↦ Γ(T,O_T) on (Sch/S)_τ.
- `TauCeti.SchemeFoundations.Topologies.Gm` (constructor): The sheaf of abelian groups T ↦ Γ(T,O_T)^× on (Sch/S)_τ.
- `TauCeti.SchemeFoundations.Topologies.mu` (constructor): For n ≥ 1 the subsheaf μ_n ⊂ G_m of n-th roots of unity.
- `TauCeti.SchemeFoundations.Topologies.Gm_obj` (simp): Sections of G_m over T are the units of Γ(T, O_T).
- `TauCeti.SchemeFoundations.Topologies.mu_eq_ker_pow` (characterisation): μ_n is the kernel of the n-th power endomorphism of G_m.
- `TauCeti.SchemeFoundations.Topologies.Gm_restrict_small` (compatibility): The restriction of G_m to the small étale site of S is the sheaf of units of the étale structure sheaf.
- `TauCeti.SchemeFoundations.Topologies.mu_eq_cpc` (compatibility): For n invertible on S, the restriction of μ_n to S_et is the roots-of-unity sheaf of CohomologicalPointCounting ConstructibleEtale Layer 6.

*Used by.* SF.2/hilbert-90 and SF.2/fppf-kummer-sequence — coefficients of Picard and Kummer computations; SchemeAndStackFoundations:SF.2/cohomological-brauer — Br'(X) is the torsion of H^2(X_et, G_m); MotivicEtaleKTheory:M.1/etale-kummer-sequences (request to SF.2) — the étale sheaf of units G_m and its Kummer sequences.

*Unit tests.*

- `TauCeti.SchemeFoundations.Topologies.test_mu_one` (degenerate): μ_1 is the zero sheaf.
- `TauCeti.SchemeFoundations.Topologies.test_Gm_field` (computation): G_m(Spec Q) = Q^×, and μ_2(Spec Q) = {±1}.
- `TauCeti.SchemeFoundations.Topologies.test_mu_p_not_etale_trivial` (non-example): Over S = Spec F_p, μ_p has trivial sections on every reduced S-scheme but nonzero sections on Spec F_p[ε]/(ε^p); so μ_p is not the constant sheaf Z/p, unlike μ_n with n invertible.

*Acceptance.* μ_1 = 0; G_m(Spec k) = k^×. Over a field k of characteristic p, μ_p(Spec L) = {1} for every field L but μ_p(Spec k[ε]/(ε^p)) ∋ 1 + ε, so μ_p is not étale.

*Depends on.* `AlgebraicGeometry.Scheme.fpqcTopology` (Mathlib), `rootsOfUnity` (Mathlib), `Units` (Mathlib), `big-site-quasi-coherent-sheaf`.

*Source.* Stacks Project, Tag 03PK (Section 59.28); Stacks Project, Tag 03YZ (Section 59.23).

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Comparison`, namespace `TauCeti.SchemeFoundations.Topologies`.

#### Comparison morphisms between the topologies of a scheme (`topology-comparison-morphisms`, construction)

For a scheme X construct the morphisms of sites/topoi ε_{fppf,et} : Sh((Sch/X)_fppf) → Sh((Sch/X)_et), the big-to-small morphisms π_X, a_X : Sh((Sch/X)_fppf) → Sh(X_et), X_et → X_Nis → X_Zar (identity functors from coarser to finer topologies on the étale X-schemes, Nisnevich as in SF.2/nisnevich-topology, Zariski on open immersions), and ε : Sh(X_proet) → Sh(X_et) (SF.2/proetale-etale-morphism). Each has exact inverse image; pushforward is restriction of sections; they are compatible with morphisms of schemes and with composition, and induce the comparison maps on cohomology through SF.2/site-cohomology-pullback.

*Hypotheses.* X a scheme; Mathlib's topologies with zariskiTopology ≤ etaleTopology ≤ fppfTopology ≤ fpqcTopology and etaleTopology ≤ proetaleTopology.

*Proof outline.*

1. A finer topology on the same category gives a continuous identity functor with exact sheafification as inverse image (Mathlib's comparisons zariskiTopology_le_etaleTopology, fppfTopology_le_fpqcTopology).
2. Big-to-small: the inclusion X_et → (Sch/X) is continuous and cocontinuous; a_X^{-1} sends an étale sheaf F to T ↦ Γ(T, F_T) (Stacks Lemma 59.100.1–59.100.2).
3. Compatibility with morphisms of schemes: Stacks 59.100.2 and 59.37 (functoriality of big topoi).

*API.*

- `TauCeti.SchemeFoundations.Topologies.epsilonFppfEtale` (constructor): The morphism of topoi from big fppf sheaves to big étale sheaves on Sch/X.
- `TauCeti.SchemeFoundations.Topologies.aX` (constructor): The morphism a_X from big fppf sheaves to sheaves on X_et, with a_X^{-1}F(T) = Γ(T, F_T).
- `TauCeti.SchemeFoundations.Topologies.etaleToNisnevich` (constructor): The morphism of topoi Sh(X_et) → Sh(X_Nis).
- `TauCeti.SchemeFoundations.Topologies.nisnevichToZariski` (constructor): The morphism of topoi Sh(X_Nis) → Sh(X_Zar).
- `TauCeti.SchemeFoundations.Topologies.comparison_comp` (functoriality): The composite etaleToNisnevich ≫ nisnevichToZariski is the étale-to-Zariski comparison; all comparisons compose coherently.
- `TauCeti.SchemeFoundations.Topologies.comparison_baseChange` (compatibility): For f : Y → X the comparison morphisms commute with the morphisms of topoi induced by f.
- `TauCeti.SchemeFoundations.Topologies.aX_inverseImage_obj` (simp): a_X^{-1}F evaluated at (T → X) is Γ(T_et, F|_T).

*Used by.* SF.2/quasi-coherent-topology-comparison — the maps H^p(X_Zar,F) → H^p(X_et,F^a) → H^p_fppf(X,F^a); SF.2/etale-pullback-fppf-comparison — a_X and its derived pushforward; AlgebraicModuliForArithmeticGeometry:R09.4/class-site-pullback (request to SF.2) — exact inverse images for the base-induced étale/fppf geometric morphisms.

*Unit tests.*

- `TauCeti.SchemeFoundations.Topologies.test_comparison_id` (degenerate): For the identity topology comparison (étale to étale) the morphism is the identity of Sh(X_et).
- `TauCeti.SchemeFoundations.Topologies.test_aX_constant` (computation): a_X^{-1} of the constant sheaf Z/2 on X_et is the constant fppf sheaf Z/2 on Sch/X (sections over T: locally constant functions T → Z/2).
- `TauCeti.SchemeFoundations.Topologies.test_zariski_not_etale` (non-example): The étale-to-Zariski comparison is not an equivalence: for X = Spec R, the sheaf μ_2 has H^1_Zar(X, μ_2) = 0 but H^1_et(X, μ_2) ≅ R^×/R^{×2} = Z/2.

*Acceptance.* For X = Spec of a strictly henselian local ring, global sections on X_et is exact (Stacks 59.55.1), so higher cohomology along these comparisons is computed by stalks. Composing X_et → X_Nis → X_Zar gives the morphism used to compare Zariski and étale cohomology of quasi-coherent sheaves.

*Depends on.* `AlgebraicGeometry.Scheme.zariskiTopology` (Mathlib), `AlgebraicGeometry.Scheme.etaleTopology` (Mathlib), `AlgebraicGeometry.Scheme.fppfTopology` (Mathlib), `AlgebraicGeometry.Scheme.smallEtaleTopology` (Mathlib), `CategoryTheory.Functor.sheafPullback` (Mathlib), `site-cohomology-pullback`.

*Source.* Stacks Project, Tag 0DDK (Section 59.100), Lemmas 59.100.1–59.100.2; Stacks Project, Tag 04DI (Section 59.37).

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Comparison`, namespace `TauCeti.SchemeFoundations.Topologies`.

#### Quasi-coherent cohomology is the same in every topology (`quasi-coherent-topology-comparison`, comparison)

Let S be a scheme and F a quasi-coherent O_S-module. For τ ∈ {Zariski, Nisnevich, étale, smooth, syntomic, fppf} and for the small étale and Nisnevich sites, the comparison maps of SF.2/topology-comparison-morphisms induce isomorphisms H^p(S, F) ≅ H^p_τ(S, F^a) for all p ≥ 0, natural in F and compatible with pullback; here H^p(S,F) is Tau Ceti's Scheme.Modules.Cohomology. In particular G_a and every quasi-coherent F^a have vanishing higher τ-cohomology on affine schemes, and R^qε_*F^a = 0 for q > 0 along each comparison morphism.

*Hypotheses.* S a scheme; F quasi-coherent; τ as listed (fpqc excluded because of set-theoretic size, as in the source).

*Proof outline.*

1. Reduce to affine S with the Čech-to-cohomology spectral sequence: on affine T, H^p_τ(T, F^a) = 0 for p > 0 because Čech complexes of F^a for standard τ-coverings are Amitsur complexes, which are exact (faithfully flat descent), and SF.2/cech-to-cohomology (3) (Stacks Lemma 59.22.1 and Theorem 59.22.4).
2. Compare with Zariski cohomology through the Leray spectral sequence of the comparison morphism with R^qε_*F^a = 0 (Stacks Proposition 35.9.3).
3. Nisnevich case: the Nisnevich topology lies between Zariski and étale, and the same Čech argument applies (or deduce from the étale and Zariski cases by the Leray sequence).

*Acceptance.* H^1_et(Spec A, G_a) = 0 for every ring A (additive torsors are trivial on affines; PAPER-GILLE-PARIMALA-26/120). H^1_fppf(P^1_k, O(−2)^a) ≅ k, matching SF.2/projective-space-cohomology.

*Depends on.* `big-site-quasi-coherent-sheaf`, `topology-comparison-morphisms`, `cech-to-cohomology`, `site-leray-spectral-sequence`, `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (Tau Ceti), Tau Ceti JacobianChallenge, layer b coherent cohomology over k genus riemannroch serre duality.

*Source.* Stacks Project, Tag 03DW (Proposition 35.9.3); Stacks Project, Tag 03OY (Section 59.22), Lemma 59.22.1 and Theorem 59.22.4.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Comparison`, namespace `TauCeti.SchemeFoundations.Topologies`.

#### Étale sheaves have the same fppf cohomology (`etale-pullback-fppf-comparison`, comparison)

For a scheme X and the morphism a_X : Sh((Sch/X)_fppf) → Sh(X_et) of SF.2/topology-comparison-morphisms, the unit K → Ra_{X,*}a_X^{-1}K is an isomorphism for every K ∈ D^+(X_et); hence H^q(X_et, F) = H^q_fppf(X, a_X^{-1}F) for every abelian étale sheaf F and every q. For a finite morphism f : X → Y, a_Y^{-1}R^if_{small,*}F = R^if_{big,fppf,*}a_X^{-1}F.

*Hypotheses.* X a scheme; F abelian on X_et, or K bounded below.

*Proof outline.*

1. Reduce to a sheaf F; compute R^iε_*(a_X^{-1}F) along the big étale-to-fppf comparison, which vanishes for i > 0 by a dévissage using finite morphisms and the class of sheaves acyclic for finite pushforward (Stacks 59.100.5–59.100.6).
2. Conclude with the Leray spectral sequence (Stacks 59.100.7–59.100.8).

*Acceptance.* For F = Z/n with n not invertible on X, the statement still holds (the comparison is for étale sheaves; contrast μ_p, which is not of the form a_X^{-1}F). For F = Z/2 on Spec R: H^1_fppf(Spec R, Z/2) = Z/2.

*Depends on.* `topology-comparison-morphisms`, `site-leray-spectral-sequence`, `finite-pushforward-exact`.

*Source.* Stacks Project, Tag 0DDK (Section 59.100), Lemmas 59.100.5–59.100.8.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Comparison`, namespace `TauCeti.SchemeFoundations.Topologies`.

#### Étale and fppf cohomology agree for smooth commutative group schemes (`smooth-group-fppf-etale-comparison`, comparison)

Let X be a scheme and G a smooth commutative group scheme over X that is quasi-projective over X (e.g. G_m, a torus, an abelian scheme, or a finite étale group). Then the comparison maps H^q(X_et, G) → H^q_fppf(X, G) are isomorphisms for all q, naturally in G and X. The statement is false for non-smooth G: μ_p and α_p over a base of characteristic p have fppf cohomology not computed étale.

*Hypotheses.* G smooth, commutative, quasi-projective over X (Grothendieck's hypotheses).

*Proof outline.*

1. The higher direct images R^qε_*G along the fppf-to-étale comparison have stalks H^q_fppf(Spec O^sh_{X,x̄}, G); these vanish for q > 0 because a smooth group over a strictly henselian local ring has trivial fppf torsors and higher fppf cohomology vanishing (Grothendieck, Le groupe de Brauer III, Théorème 11.7; used in Česnavičius 2019, §2 and Appendix A).
2. Conclude with the Leray spectral sequence of the comparison (SF.2/site-leray-spectral-sequence).

*Acceptance.* For G = G_m: H^1_et(X, G_m) = H^1_fppf(X, G_m) = Pic(X) (consistent with SF.2/hilbert-90). For G = μ_p over F_p: H^1_et(Spec F_p, μ_p) = 0 but H^1_fppf(Spec F_p, μ_p) = F_p^×/F_p^{×p} is also 0, while H^1_fppf(Spec F_p(t), μ_p) = F_p(t)^×/F_p(t)^{×p} ≠ 0 = H^1_et.

*Depends on.* `topology-comparison-morphisms`, `site-leray-spectral-sequence`, `multiplicative-additive-group-sheaves`, `AlgebraicGeometry.Smooth` (Mathlib).

*Source.* Kęstutis Česnavičius, §2 (proof of Proposition 2.3 and Remark 2.7) and Appendix A, arXiv:1711.06456v4; Alexander Grothendieck, Théorème 11.7 (Dix exposés, 1968), as cited by Česnavičius 2019.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Comparison`, namespace `TauCeti.SchemeFoundations.Topologies`.

#### Hilbert's Theorem 90 for schemes (`hilbert-90`, theorem) — planet: *Hilbert's Theorem 90 for schemes*

For every scheme X there are canonical isomorphisms H^1_fppf(X, G_m) ≅ H^1_et(X, G_m) ≅ H^1_Nis(X, G_m) ≅ H^1_Zar(X, O_X^×) ≅ Pic(X), the group of isomorphism classes of invertible O_X-modules (Tau Ceti's LineBundleClass X, whose group structure is owned by JacobianChallenge Layer A). The isomorphisms are natural in X, carry the class of an invertible sheaf L to the class of the G_m-torsor Isom(O_X, L), and for X = Spec A agree with Mathlib's CommRing.Pic A. In particular H^1_et(Spec K, G_m) = 0 for a field K.

*Hypotheses.* X any scheme.

*Proof outline.*

1. By SF.2/abelian-torsor-h1 each H^1_τ(X, G_m) classifies G_m-torsors in the topology τ.
2. A G_m-torsor in the fppf topology gives an invertible module on the big site, which descends to an invertible O_X-module by faithfully flat descent of quasi-coherent modules (SF.2/big-site-quasi-coherent-sheaf, SF.1); so all torsors are Zariski-locally trivial (Stacks Theorem 59.24.1).
3. Affine compatibility: invertible modules on Spec A are rank-one projective A-modules (CommRing.Pic).

*Acceptance.* H^1_et(Spec Z, G_m) = Pic(Z) = 0. For a Dedekind domain A, H^1_et(Spec A, G_m) is the ideal class group of A (e.g. Z/2 for Z[√−5]). H^1_et(P^1_k, G_m) ≅ Z, generated by O(1).

*Depends on.* `abelian-torsor-h1`, `multiplicative-additive-group-sheaves`, `big-site-quasi-coherent-sheaf`, `CommRing.Pic` (Mathlib), `TauCeti.AlgebraicGeometry.LineBundleClass` (Tau Ceti), Tau Ceti JacobianChallenge, layer a line bundles divisors picard group degree, `SchemeAndStackFoundations:SF.1`.

*Source.* Stacks Project, Tag 03P8 (Theorem 59.24.1); J. S. Milne, §11, Corollary and Remark 11.7, p.80.

*Suggested home.* `TauCeti/AlgebraicGeometry/EtaleCohomology/General`, namespace `TauCeti.SchemeFoundations.Etale`.

#### Kummer sequences in the fppf and étale topologies (`fppf-kummer-sequence`, theorem)

For every scheme S and every integer n ≥ 1 the sequence 0 → μ_n → G_m →(·)^n G_m → 0 is exact on (Sch/S)_fppf (and syntomic); it is exact on the big and small étale sites when n is invertible on S, and in general not exact étale-locally. With SF.2/hilbert-90 it gives natural exact sequences 0 → Γ(S,O)^×/(Γ(S,O)^×)^n → H^1_fppf(S, μ_n) → Pic(S)[n] → 0 and 0 → Pic(S)/n → H^2_fppf(S, μ_n) → H^2_fppf(S, G_m)[n] → 0, and H^1_fppf(S, μ_n) is the group of pairs (L, α : L^{⊗n} ≅ O_S) up to isomorphism. For n invertible the fppf groups agree with étale ones.

*Hypotheses.* S any scheme; n ≥ 1 (invertible on S for the étale statement).

*Proof outline.*

1. fppf exactness: an n-th root of a unit u exists fppf-locally on Spec A[t]/(t^n − u), which is finite locally free (Stacks Lemma 59.28.3).
2. Étale exactness for n invertible: A[t]/(t^n − u) is étale over A (Stacks Lemma 59.28.1); this is CohomologicalPointCounting ConstructibleEtale Layer 6 on the small site.
3. Long exact sequence and SF.2/hilbert-90 give the displayed sequences (Stacks Remark 59.28.4); the description of H^1 by pairs is Stacks Lemma 59.28.5.
4. For n invertible, μ_n is finite étale, so fppf and étale cohomology agree (SF.2/smooth-group-fppf-etale-comparison).

*Acceptance.* For S = Spec O_F with F a number field and p prime: 0 → O_F^×/O_F^{×p} → H^1_fppf(O_F, μ_p) → Cl(F)[p] → 0 (PAPER-CALEGARI-GERAGHTY-18). For S = Spec k, k a field: H^1_fppf(k, μ_n) = k^×/k^{×n} for every n, including n = char k. For S = Spec Z and n = 2: H^1_fppf(Spec Z, μ_2) = Z^×/Z^{×2} = Z/2 (Pic Z = 0; PAPER-SCHROER-23/205).

*Depends on.* `multiplicative-additive-group-sheaves`, `hilbert-90`, `smooth-group-fppf-etale-comparison`, `abelian-torsor-h1`.

*Imports from Tau Ceti roadmaps (not atlas stages; recorded as gaps).* `tauceti:TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale#layer-6-roots-of-unity-and-tate-twists`.

*Source.* Stacks Project, Tag 03PK (Section 59.28), Lemmas 59.28.1, 59.28.3, Remark 59.28.4, Lemma 59.28.5.

*Suggested home.* `TauCeti/AlgebraicGeometry/EtaleCohomology/General`, namespace `TauCeti.SchemeFoundations.Etale`.

#### The Artin–Schreier sequence and p-cohomological dimension in characteristic p (`artin-schreier-sequence`, theorem)

Let p be a prime and S a scheme of characteristic p. Then 0 → Z/p → G_a →(F−1) G_a → 0 (F the p-th power map) is exact on S_et. Consequently: if S is affine, H^q_et(S, Z/p) = 0 for q ≥ 2; if S is quasi-compact quasi-separated of dimension d, H^q_et(S, Z/p) = 0 for q ≥ d + 2; for S separated of finite type over an algebraically closed field of characteristic p, H^q_et(S, Z/p) = 0 for q > dim S; and for S proper over an algebraically closed field k the groups H^q_et(S, Z/p) are finite and invariant under extension of algebraically closed fields.

*Hypotheses.* S of characteristic p (p = 0 in O_S).

*Proof outline.*

1. Exactness: x^p − x − a is separable, so F − 1 is surjective étale-locally; its kernel is the constant sheaf F_p.
2. Long exact sequence with SF.2/quasi-coherent-topology-comparison (H^q_et(S, G_a) = H^q(S, O_S), zero for q > 0 on affines, and zero for q > d on qcqs S of dimension d by SF.2/noetherian-space-vanishing in the Noetherian case) gives the vanishing (Stacks 59.63.1).
3. Finite type over algebraically closed k: Frobenius-linear algebra on H^d(X, O) (Stacks 59.63.2–59.63.5); proper case: finite-dimensional coherent cohomology (Stacks 59.63.6).

*Acceptance.* For S = Spec F_q: H^1_et(Spec F_q, Z/p) = F_q/(F−1)F_q ≅ Z/p. For an ordinary elliptic curve E over algebraically closed k, H^1_et(E, Z/p) ≅ Z/p; for a supersingular one it is 0.

*Depends on.* `big-site-quasi-coherent-sheaf`, `quasi-coherent-topology-comparison`, `noetherian-space-vanishing`, `AlgebraicGeometry.Scheme.smallEtaleTopology` (Mathlib).

*Source.* Stacks Project, Tag 0A3J (Section 59.63), Lemmas 59.63.1–59.63.6.

*Suggested home.* `TauCeti/AlgebraicGeometry/EtaleCohomology/General`, namespace `TauCeti.SchemeFoundations.Etale`.

#### Finite and integral pushforward on étale sheaves (`finite-pushforward-exact`, theorem)

Let f : X → Y be a finite morphism of schemes. For every abelian sheaf F on X_et and geometric point ȳ of Y, (f_*F)_ȳ = ∏_{x̄ over ȳ} F_x̄ (finite product over the geometric points of the fibre); hence f_* is exact on abelian étale sheaves and R^if_*F = 0 for i > 0, so H^i(Y, f_*F) = H^i(X, F). For f integral and any cartesian square with g : Y' → Y, the base change map g^{-1}f_*F → f'_*g'^{-1}F is an isomorphism for every sheaf of sets F. No torsion or invertibility hypothesis is needed.

*Hypotheses.* f finite (integral for the base change statement); F arbitrary abelian (or set-valued) étale sheaf.

*Proof outline.*

1. Stalks of f_* at ȳ are sections over the strict henselisation, and X ×_Y Spec O^sh_{Y,ȳ} is a finite disjoint union of strictly henselian local schemes; global sections over strictly henselian local schemes are exact (Stacks 59.55.1–59.55.2).
2. Vanishing of R^if_* follows from exactness via SF.2/site-derived-pushforward; the base change statement is Stacks 59.55.3–59.55.4.

*Acceptance.* For a closed immersion i, i_* is exact and H^q(Y, i_*F) = H^q(X, F). For π : Spec L → Spec K finite separable and F = G_m: H^q(Spec K, π_*G_m) = H^q(Spec L, G_m) (Shapiro).

*Depends on.* `site-derived-pushforward`, `AlgebraicGeometry.IsFinite` (Mathlib), `AlgebraicGeometry.IsIntegralHom` (Mathlib), `AlgebraicGeometry.Scheme.pointSmallEtale` (Mathlib).

*Source.* Stacks Project, Tag 03QN (Section 59.55), Lemma 59.55.1, Proposition 59.55.2, Lemmas 59.55.3–59.55.4.

*Suggested home.* `TauCeti/AlgebraicGeometry/EtaleCohomology/General`, namespace `TauCeti.SchemeFoundations.Etale`.

#### Nisnevich coverings (`nisnevich-covering`, definition)

A family of étale morphisms {p_i : U_i → X} is a Nisnevich covering if for every point x ∈ X there are an index i and a point u ∈ U_i with p_i(u) = x inducing an isomorphism of residue fields κ(x) ≅ κ(u). Equivalently (for finite families of morphisms locally of finite presentation over a Noetherian base) for every x the base change ∐_i U_i ×_X Spec O^h_{X,x} → Spec O^h_{X,x} to the henselization has a section.

*Hypotheses.* p_i étale (Mathlib's AlgebraicGeometry.Etale); residue fields via AlgebraicGeometry.Scheme.residueField and Hom.residueFieldMap.

*Proof outline.*

1. The two conditions are equivalent by the universal property of the henselization of a local ring: an étale map has a section over Spec O^h_{X,x} iff it has a point over x with trivial residue extension (Morel–Voevodsky Proposition 1.1).
2. Nisnevich coverings are étale and jointly surjective, and contain every Zariski covering (open immersions induce identities on residue fields).

*API.*

- `TauCeti.SchemeFoundations.Nisnevich.IsNisnevichCovering` (constructor): The predicate on a family of étale morphisms into X: every point has a preimage with trivial residue field extension.
- `TauCeti.SchemeFoundations.Nisnevich.nisnevichPrecoverage` (constructor): The precoverage on schemes whose covering families are Nisnevich coverings (a sub-precoverage of Mathlib's etalePrecoverage).
- `TauCeti.SchemeFoundations.Nisnevich.isNisnevichCovering_of_zariski` (compatibility): Every Zariski covering family is a Nisnevich covering (zariskiPrecoverage ≤ nisnevichPrecoverage).
- `TauCeti.SchemeFoundations.Nisnevich.nisnevichPrecoverage_le_etale` (compatibility): nisnevichPrecoverage ≤ etalePrecoverage.
- `TauCeti.SchemeFoundations.Nisnevich.IsNisnevichCovering.pullback` (functoriality): Nisnevich coverings are stable under base change along any morphism Y → X.
- `TauCeti.SchemeFoundations.Nisnevich.IsNisnevichCovering.comp` (functoriality): Composing Nisnevich coverings of the members of a Nisnevich covering gives a Nisnevich covering.
- `TauCeti.SchemeFoundations.Nisnevich.isNisnevichCovering_iff_henselization` (characterisation): For finite families over a Noetherian base: Nisnevich iff the base change to each Spec O^h_{X,x} has a section.

*Used by.* SchemeKTheoryOperations:S.4 (RT-AREA-ktheory-2/38) — Nisnevich descent for algebraic K-theory and Nisnevich cohomological dimension bounds (TT E.6); MotivicEtaleKTheory:M.5a — Nisnevich sheaves with transfers are sheaves for this topology; SF.2/nisnevich-topology — generates the Grothendieck topology.

*Unit tests.*

- `TauCeti.SchemeFoundations.Nisnevich.test_covering_identity` (degenerate): The singleton family {id : X → X} is a Nisnevich covering.
- `TauCeti.SchemeFoundations.Nisnevich.test_not_covering_real_complex` (non-example): {Spec C → Spec R} is not a Nisnevich covering although it is an étale covering.
- `TauCeti.SchemeFoundations.Nisnevich.test_covering_quadratic_split` (computation): {Spec Z[1/10] → Spec Z[1/2], Spec Z[1/2][x]/(x^2+1) → Spec Z[1/2]} is a Nisnevich covering: the second map is étale, and over the prime (5) the polynomial x^2+1 has a root mod 5, giving a point with residue field F_5
- `TauCeti.SchemeFoundations.Nisnevich.test_zariski_is_nisnevich` (compatibility): The Zariski covering {D(2), D(3)} of Spec Z is a Nisnevich covering.

*Acceptance.* A Zariski open cover is a Nisnevich covering. {Spec C → Spec R} is an étale covering but not a Nisnevich covering (κ = R is not isomorphic to C).

*Depends on.* `AlgebraicGeometry.Etale` (Mathlib), `AlgebraicGeometry.Scheme.residueField` (Mathlib), `AlgebraicGeometry.Scheme.Hom.residueFieldMap` (Mathlib), `AlgebraicGeometry.Scheme.etalePrecoverage` (Mathlib), `SchemeAndStackFoundations:key/henselization`.

*Source.* Fabien Morel, §3.1, Proposition 1.1 and Definition 1.2, pp.95–96.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Nisnevich`, namespace `TauCeti.SchemeFoundations.Nisnevich`.

#### The Nisnevich topology (`nisnevich-topology`, construction) — planet: *Nisnevich topology*

The Nisnevich topology is the Grothendieck topology on the category of schemes generated by Nisnevich coverings (Mathlib's Precoverage.toGrothendieck of nisnevichPrecoverage); for a scheme X the small Nisnevich site X_Nis is the category of étale X-schemes (Mathlib's X.Etale) with the induced topology. Then zariskiTopology ≤ nisnevichTopology ≤ etaleTopology, the Nisnevich topology is subcanonical, and representable presheaves, quasi-coherent F^a and G_m are Nisnevich sheaves. On Noetherian schemes the Nisnevich topology is generated by the elementary distinguished squares of SF.2/elementary-distinguished-square (SF.2/nisnevich-sheaf-criterion).

*Hypotheses.* Schemes of any kind for the definition; Noetherian (finite-dimensional) where stated.

*Proof outline.*

1. Nisnevich coverings form a precoverage stable under pullback and composition and containing isomorphisms (Morel–Voevodsky Definition 1.2), so they generate a topology.
2. Comparisons follow from the inclusions of covering families (SF.2/nisnevich-covering); subcanonicity from etaleTopology ≤ fpqcTopology and Mathlib's subcanonical fpqc topology.
3. The small site is obtained by restricting to X.Etale exactly as Mathlib's smallEtaleTopology.

*API.*

- `TauCeti.SchemeFoundations.Nisnevich.nisnevichTopology` (constructor): The Grothendieck topology on Scheme generated by Nisnevich coverings.
- `TauCeti.SchemeFoundations.Nisnevich.smallNisnevichTopology` (constructor): The topology on X.Etale induced by Nisnevich coverings.
- `TauCeti.SchemeFoundations.Nisnevich.zariskiTopology_le_nisnevichTopology` (compatibility): zariskiTopology ≤ nisnevichTopology.
- `TauCeti.SchemeFoundations.Nisnevich.nisnevichTopology_le_etaleTopology` (compatibility): nisnevichTopology ≤ etaleTopology.
- `TauCeti.SchemeFoundations.Nisnevich.nisnevichTopology_subcanonical` (instance): The Nisnevich topology is subcanonical.
- `TauCeti.SchemeFoundations.Nisnevich.mem_nisnevichTopology_iff` (characterisation): A sieve covers X iff it contains a Nisnevich covering family.
- `TauCeti.SchemeFoundations.Nisnevich.smallNisnevich_comparison` (compatibility): The small Nisnevich site maps to the small étale and small Zariski sites by SF.2/topology-comparison-morphisms.

*Used by.* SchemeKTheoryOperations:S.4/zariski-descent-spectral-sequence, S.4/nisnevich-cohomological-dimension (requests to SF.2) — the site on which K-theory descent and cohomological dimension are stated; MotivicEtaleKTheory:M.5a — Nisnevich sheaves with transfers; SF.2/quasi-coherent-topology-comparison — Nisnevich cohomology of quasi-coherent sheaves agrees with Zariski cohomology.

*Unit tests.*

- `TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_between` (compatibility): zariskiTopology ≤ nisnevichTopology ∧ nisnevichTopology ≤ etaleTopology.
- `TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_not_etale` (non-example): The sieve on Spec R generated by Spec C → Spec R is étale-covering but not Nisnevich-covering.
- `TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_field_global_sections` (computation): For a field k, a presheaf of sets F on (Spec k)_Nis is a sheaf iff F(∐ Spec L_i) = ∏ F(Spec L_i); in particular every Nisnevich sheaf on Spec k is determined on connected objects, and H^q_Nis(Spec k, F) = 0 for q > 0.
- `TauCeti.SchemeFoundations.Nisnevich.test_nisnevich_representable_sheaf` (degenerate): The presheaf represented by any scheme is a Nisnevich sheaf.

*Acceptance.* The small Nisnevich site of Spec of a field is equivalent to finite products of finite separable extensions with only trivial coverings by pieces of equal residue field: every Nisnevich sheaf on Spec k is determined by its value on Spec k (all higher cohomology vanishes). zariskiTopology ≤ nisnevichTopology ≤ etaleTopology with both inequalities strict (Spec C → Spec R).

*Depends on.* `nisnevich-covering`, `CategoryTheory.Precoverage.toGrothendieck` (Mathlib), `AlgebraicGeometry.Scheme.etaleTopology` (Mathlib), `AlgebraicGeometry.Scheme.zariskiTopology` (Mathlib), `AlgebraicGeometry.Scheme.Etale` (Mathlib), `AlgebraicGeometry.Scheme.smallEtaleTopology` (Mathlib), `AlgebraicGeometry.Scheme.fpqcTopology` (Mathlib).

*Source.* Fabien Morel, §3.1, Definition 1.2 and the following paragraph, pp.95–96.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Nisnevich`, namespace `TauCeti.SchemeFoundations.Nisnevich`.

#### Elementary distinguished squares (`elementary-distinguished-square`, definition)

An elementary distinguished square over a scheme X is a cartesian square U ×_X V → V, U ×_X V → U, j : U → X, p : V → X in which j is an open immersion, p is étale, and p restricts to an isomorphism p^{-1}(X ∖ U) → X ∖ U of reduced closed subschemes. The pair {j, p} is a Nisnevich covering, and the square is stable under base change along any Y → X and under shrinking V and enlarging U as long as X = U ∪ p(V).

*Hypotheses.* X a scheme; reduced induced structures on the closed complements.

*Proof outline.*

1. Covering: points of U lift along j; points of X ∖ U lift along p with trivial residue extension because p is an isomorphism over X ∖ U (Morel–Voevodsky, remark after Definition 1.3).
2. Stability properties: the defining conditions are preserved by base change and by restriction (Stacks Lemma 75.9.2 for the algebraic-space version).

*API.*

- `TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare` (constructor): Structure: a Mathlib Square in Scheme over X with an open immersion j, an étale p, cartesianness, and p an isomorphism over the reduced complement of U.
- `TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare.isNisnevichCovering` (projection): The pair {j, p} is a Nisnevich covering of X.
- `TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare.ofZariski` (constructor): The square attached to an open cover X = U ∪ V.
- `TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare.pullback` (functoriality): Base change along any morphism Y → X gives an elementary distinguished square over Y.
- `TauCeti.SchemeFoundations.Nisnevich.ElementaryDistinguishedSquare.isPullback` (projection): The underlying square is a pullback in Scheme.

*Used by.* SF.2/distinguished-square-mayer-vietoris — each square is a Mathlib MayerVietorisSquare for the Nisnevich topology; SF.2/nisnevich-sheaf-criterion and SF.2/brown-gersten-vanishing — squares generate the topology and control descent; SchemeKTheoryOperations:S.4 (RT-AREA-ktheory-2/38) — the excision criterion for Nisnevich descent of K-theory.

*Unit tests.*

- `TauCeti.SchemeFoundations.Nisnevich.test_eds_zariski` (degenerate): For X = U ∪ V an open cover, ofZariski gives a square whose p is the open immersion of V.
- `TauCeti.SchemeFoundations.Nisnevich.test_eds_affine_line` (computation): X = A^1_Q, U = A^1 ∖ {0}, V = A^1 ∖ {−1, −2} with p(s) = s^2 + 2s: p is étale on V and p^{-1}(0) ∩ V = {0} with residue field Q, so (U ⊂ X, p) is an elementary distinguished square
- `TauCeti.SchemeFoundations.Nisnevich.test_eds_not_distinguished` (non-example): X = Spec R, U = ∅, V = Spec C: p is étale and surjective but p^{-1}(X ∖ U) → X ∖ U is not an isomorphism, so this is not an elementary distinguished square.

*Acceptance.* A Zariski cover X = U ∪ V gives an elementary distinguished square with p the open immersion V → X. For X = A^1_k, U = A^1 ∖ {0} and V → A^1 an étale neighbourhood of 0 with a single point over 0 of residue field k.

*Depends on.* `nisnevich-covering`, `AlgebraicGeometry.IsOpenImmersion` (Mathlib), `AlgebraicGeometry.Etale` (Mathlib), `CategoryTheory.Square` (Mathlib).

*Source.* Fabien Morel, §3.1, Definition 1.3 and the following remark, p.96; Stacks Project, Tag 08GL (Section 75.9), Definition 75.9.1 and Lemma 75.9.2.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Nisnevich`, namespace `TauCeti.SchemeFoundations.Nisnevich`.

#### Distinguished squares are Mayer–Vietoris squares (`distinguished-square-mayer-vietoris`, lemma)

Every elementary distinguished square over X becomes a pushout square of Nisnevich sheaves after Yoneda and sheafification, with U → X a monomorphism; hence it is a Mathlib GrothendieckTopology.MayerVietorisSquare for the Nisnevich topology (big or small site). Consequently every Nisnevich sheaf satisfies the square sheaf condition F(X) = F(U) ×_{F(U ×_X V)} F(V), and for every abelian Nisnevich sheaf F there is a long exact sequence … → H^n(X,F) → H^n(U,F) ⊕ H^n(V,F) → H^n(U ×_X V, F) → H^{n+1}(X,F) → … (Mathlib's MayerVietorisSquare.sequence_exact).

*Hypotheses.* An elementary distinguished square; Nisnevich topology.

*Proof outline.*

1. U ∐ V → X is an epimorphism of Nisnevich sheaves, U → X is a monomorphism, and sheafification preserves the fibre product, so the square is cocartesian in sheaves (Morel–Voevodsky Lemma 1.6).
2. This is exactly the hypothesis of Mathlib's MayerVietorisSquare (mk' / mk_of_isPullback); the sheaf condition and long exact sequence are then Mathlib's sheafCondition_of_sheaf and sequence_exact (Morel–Voevodsky Remark 1.7).

*Acceptance.* For a Zariski cover the sequence is the usual Mayer–Vietoris sequence (Tau Ceti's mayerVietorisSequence_exact for O_X-modules). Applied to G_m it gives the Mayer–Vietoris sequence of Picard groups for a Nisnevich square.

*Depends on.* `elementary-distinguished-square`, `nisnevich-topology`, `CategoryTheory.GrothendieckTopology.MayerVietorisSquare` (Mathlib), `CategoryTheory.GrothendieckTopology.MayerVietorisSquare.sheafCondition_of_sheaf` (Mathlib), `CategoryTheory.GrothendieckTopology.MayerVietorisSquare.sequence_exact` (Mathlib).

*Source.* Fabien Morel, §3.1, Lemma 1.6 and Remark 1.7, pp.97–98.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Nisnevich`, namespace `TauCeti.SchemeFoundations.Nisnevich`.

#### The Nisnevich sheaf condition is checked on distinguished squares (`nisnevich-sheaf-criterion`, theorem)

Let S be a Noetherian scheme of finite dimension and C the category of schemes of finite type over S (or the small site X_Nis of a Noetherian finite-dimensional X). A presheaf of sets F on C is a Nisnevich sheaf if and only if F(∅) is a point and for every elementary distinguished square the square of sets F(X) → F(U), F(V) → F(U ×_X V) is cartesian (Mathlib's MayerVietorisSquare.SheafCondition). The same holds for presheaves with values in any category with limits (by Yoneda).

*Hypotheses.* S Noetherian of finite Krull dimension; F a presheaf on finite-type S-schemes (or on X_Nis).

*Proof outline.*

1. Only if: SF.2/distinguished-square-mayer-vietoris.
2. If: every Nisnevich covering of a Noetherian scheme has a finite splitting sequence of closed subsets ∅ = Z_{n+1} ⊂ Z_n ⊂ … ⊂ Z_0 = X over whose strata the covering splits (Morel–Voevodsky Lemma 1.5); induct on its length, using one distinguished square to remove the last stratum (proof of Morel–Voevodsky Proposition 1.4).
3. The empty-scheme condition handles the empty covering; for general targets apply the set-valued case to Hom(T, F(−)).

*Acceptance.* The presheaf represented by a scheme satisfies the square condition. Zariski analogue: square condition for open covers X = U ∪ V characterises Zariski sheaves (the étale analogue fails).

*Depends on.* `distinguished-square-mayer-vietoris`, `elementary-distinguished-square`, `nisnevich-topology`, `CategoryTheory.GrothendieckTopology.MayerVietorisSquare.SheafCondition` (Mathlib), `AlgebraicGeometry.IsNoetherian` (Mathlib).

*Source.* Fabien Morel, §3.1, Proposition 1.4 and Lemma 1.5 with proof, pp.96–98.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Nisnevich`, namespace `TauCeti.SchemeFoundations.Nisnevich`.

#### Points of the Nisnevich topology are henselizations (`nisnevich-points-henselization`, theorem)

For X locally Noetherian and x ∈ X, the functor F ↦ F_x := colim over Nisnevich neighbourhoods (V, v) → (X, x) (étale with κ(v) = κ(x)) of F(V) is a point of the small Nisnevich topos, and the neighbourhoods are cofinal with limit Spec O^h_{X,x} (the henselization: SchemeAndStackFoundations key/henselization at the maximal ideal); so F_x = F(Spec O^h_{X,x}) for F extended to limits. The family of points {x ∈ X} (over all étale X-schemes for the big site) is conservative; a sequence of Nisnevich sheaves is exact iff it is exact on all these stalks.

*Hypotheses.* X locally Noetherian (Noetherian finite-dimensional in the source).

*Proof outline.*

1. Nisnevich neighbourhoods of (X, x) form a cofiltered category whose limit is Spec O^h_{X,x} (the henselization is the colimit of étale neighbourhoods with trivial residue extension; SF.0 ordinary local henselization).
2. Conservativity: a section vanishing at all henselizations vanishes on a Nisnevich covering by the residue-field lifting definition; this is the family of points noted by Morel–Voevodsky p.99 (using SGA 4 IV 6.5).

*Acceptance.* For X = Spec of a henselian local ring and x the closed point, F_x = F(X). For X = Spec k, F_x = F(Spec k) for the unique point.

*Depends on.* `nisnevich-topology`, `nisnevich-covering`, `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/ordinary-local-henselization`, `CategoryTheory.GrothendieckTopology.Point` (Mathlib), `HenselianLocalRing` (Mathlib).

*Source.* Fabien Morel, §3.1, paragraph before Lemma 1.11, p.99.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Nisnevich`, namespace `TauCeti.SchemeFoundations.Nisnevich`.

#### Nisnevich cohomological dimension is bounded by Krull dimension (`nisnevich-cohomological-dimension`, theorem)

Let S be a Noetherian scheme of Krull dimension at most d. Then H^i_Nis(S, F) = 0 for every abelian sheaf F on the (small or big) Nisnevich site and every i > d. In particular Nisnevich cohomology of a field vanishes in positive degrees.

*Hypotheses.* S Noetherian, dim S ≤ d < ∞.

*Proof outline.*

1. Use the Leray spectral sequence of the comparison morphism to the Zariski site (SF.2/topology-comparison-morphisms, SF.2/site-leray-spectral-sequence) and Grothendieck's Zariski bound (SF.2/noetherian-space-vanishing) to reduce to S local.
2. For S local with closed point s: positive-degree cohomology classes vanish Nisnevich-locally, so for a ∈ H^i(S) there is an elementary distinguished square (S ∖ s, V) killing a on V; the Mayer–Vietoris sequence (SF.2/distinguished-square-mayer-vietoris) and induction on dimension (dim(S ∖ s) < dim S) give a = 0 (proof of Morel–Voevodsky Proposition 1.8, after Thomason–Trobaugh E.6).

*Acceptance.* d = 0: H^i_Nis(Spec k, F) = 0 for i > 0. For S = Spec of a DVR, H^i_Nis(S, F) = 0 for i ≥ 2 (contrast étale: H^2_et(Spec Z_p, μ_n) can be nonzero).

*Depends on.* `distinguished-square-mayer-vietoris`, `noetherian-space-vanishing`, `site-leray-spectral-sequence`, `topology-comparison-morphisms`, `nisnevich-points-henselization`.

*Source.* Fabien Morel, §3.1, Proposition 1.8 with sketch of proof, pp.98–99.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Nisnevich`, namespace `TauCeti.SchemeFoundations.Nisnevich`.

#### Čech and derived Nisnevich cohomology agree (`nisnevich-cech-comparison`, theorem)

For every abelian sheaf F on the Nisnevich site of a Noetherian finite-dimensional base and every n ≥ 0, the canonical map from Čech cohomology (colimit over Nisnevich coverings) to derived cohomology, Ȟ^n_Nis(X, F) → H^n_Nis(X, F), is an isomorphism. (This fails for the Zariski topology.)

*Hypotheses.* Noetherian finite-dimensional base, as in the source.

*Proof outline.*

1. As for the étale topology: the Čech-to-derived spectral sequence (SF.2/cech-to-cohomology) has E_2 terms Ȟ^p(H^q), and the presheaves H^q (q > 0) have vanishing Čech colimit because every point admits a cofinal system of neighbourhoods whose finite intersections are again such neighbourhoods (Artin's argument; Morel–Voevodsky Proposition 1.9, referring to Milne III.2.17).
2. Zariski counterexample: Morel–Voevodsky Example 1.10.

*Acceptance.* For X = Spec of a henselian local ring, Ȟ^n = H^n = 0 for n > 0. Example 1.10 of Morel–Voevodsky: on the semilocal ring of two points of A^2 the Zariski Čech and derived H^2 differ.

*Depends on.* `cech-to-cohomology`, `nisnevich-topology`, `nisnevich-points-henselization`.

*Source.* Fabien Morel, §3.1, Proposition 1.9 and Example 1.10, p.99.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Nisnevich`, namespace `TauCeti.SchemeFoundations.Nisnevich`.

#### Brown–Gersten vanishing for Nisnevich Mayer–Vietoris functors (`brown-gersten-vanishing`, theorem)

Let X be a Noetherian scheme of finite dimension. A B.G.-functor on X_Nis is a family of presheaves of pointed sets T_q (q ≥ 0) on X_Nis with pointed boundary maps ∂_q : T_{q+1}(U ×_X V) → T_q(X) for every elementary distinguished square, natural in squares, such that T_{q+1}(U ×_X V) → T_q(X) → T_q(U) × T_q(V) is exact for every square. If the Nisnevich sheaves associated with all T_q are trivial, then T_q(X) = * for all q. Consequently a presheaf of spectra or simplicial sets with the homotopy-cartesian square property (Morel–Voevodsky B.G.-property) is weakly equivalent objectwise to its Nisnevich-fibrant replacement; the spectrum-valued statement used for algebraic K-theory is derived from this in the consumer's homotopical setting.

*Hypotheses.* X Noetherian of finite dimension; T a B.G.-functor (exactness on every elementary distinguished square).

*Proof outline.*

1. Restrict to the Zariski site to reduce to local X (Brown–Gersten's Zariski theorem).
2. For X local with closed point x and t ∈ T_q(X): by induction on dimension T_q vanishes on X ∖ x; local triviality gives an étale V → X split over x with t|_V = *; shrinking V, (X ∖ x, V) is an elementary distinguished square and exactness gives t = * (Morel–Voevodsky Lemma 1.17).

*Acceptance.* T_q = H^{−q}-type functors attached to a complex of Nisnevich sheaves that is locally acyclic satisfy the hypotheses. For the Zariski site the analogous statement is Brown–Gersten's theorem.

*Depends on.* `distinguished-square-mayer-vietoris`, `nisnevich-cohomological-dimension`, `elementary-distinguished-square`.

*Source.* Fabien Morel, §3.1, Definitions 1.12–1.13, Proposition 1.16, Lemmas 1.17–1.18, pp.100–102.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/Nisnevich`, namespace `TauCeti.SchemeFoundations.Nisnevich`.

## SF.2d — Étale cohomology beyond finite coefficients, and the pro-étale comparison

The finite-coefficient constructible theory (Λ finite, torsion invertible), Rf_*, proper and smooth base change, Rf_!, ℓ-adic realization, Künneth, Artin comparison and the trace formula are the Tau Ceti CohomologicalPointCounting family and are imported, never re-planned (see the integration table). This sub-layer covers what that family does not: étale cohomology with arbitrary abelian coefficients (G_m above all) — the Galois-cohomology description of a field, limits of schemes, Hochschild–Serre for finite and profinite Galois coverings, Gabber's affine analogue of proper base change for torsion sheaves without invertibility hypotheses, Tsen's theorem and the cohomology of G_m and μ_n on curves, and descent along proper hypercoverings — and the Bhatt–Scholze comparison between étale and pro-étale cohomology for all coefficients, with repleteness, w-contractible covers, left-completeness and lisse adic sheaves.

#### Étale cohomology of a field is Galois cohomology (`etale-galois-comparison`, comparison)

Let K be a field, K^sep a separable closure, G_K = Gal(K^sep/K) (canonically isomorphic to Mathlib's Field.absoluteGaloisGroup, the automorphism group of an algebraic closure) and s̄ the geometric point Spec K^sep → Spec K (Mathlib's pointSmallEtale). The stalk functor F ↦ F_s̄ = colim_{L/K finite separable} F(Spec L) is an equivalence between abelian sheaves on Spec(K)_et and discrete G_K-modules, sending G_m to (K^sep)^×, μ_n to μ_n(K^sep) and constant sheaves to trivial modules. Under it RΓ(Spec K_et, F) ≅ RΓ_cont(G_K, F_s̄) in D(Ab); so H^q_et(Spec K, F) ≅ H^q_cont(G_K, F_s̄) (Mathlib's continuousCohomology, Tau Ceti's all-degree continuous cohomology of ProfiniteCohomology Layer 10), naturally in F and compatibly with long exact sequences, restriction and corestriction along finite separable extensions.

*Hypotheses.* K a field; F an abelian sheaf on the small étale site of Spec K.

*Proof outline.*

1. Every étale K-scheme is a disjoint union of spectra of finite separable extensions; sheaves are determined by their values on these, which form the system of fixed modules (F_s̄)^U for open U ⊂ G_K (Stacks Lemma 59.59.1).
2. Γ(Spec K, F) = (F_s̄)^{G_K}; both sides are universal δ-functors (injectives correspond), giving the derived comparison (Stacks Lemma 59.59.2).
3. Identify Mathlib's continuous cohomology of the discrete module with the derived functors of invariants on discrete modules (Tau Ceti ProfiniteCohomology Layers 3 and 10).

*Acceptance.* H^1_et(Spec K, G_m) = H^1(G_K, (K^sep)^×) = 0 (Galois Hilbert 90, ProfiniteCohomology Layer 9), consistent with SF.2/hilbert-90. For K separably closed every abelian sheaf on Spec K_et is constant and H^q = 0 for q > 0. H^1_et(Spec Q, Z/2) = Hom_cont(G_Q, Z/2) is infinite.

*Depends on.* `AlgebraicGeometry.Scheme.pointSmallEtale` (Mathlib), `Field.absoluteGaloisGroup` (Mathlib), `continuousCohomology` (Mathlib), `CategoryTheory.Sheaf.H` (Mathlib), `multiplicative-additive-group-sheaves`, Tau Ceti ProfiniteCohomology, layer 10 continuous cohomology in all degrees, Tau Ceti ProfiniteCohomology, layer 9 the galois interface hilbert 90 and kummer theory.

*Source.* Stacks Project, Tag 03QQ (Section 59.59), Lemmas 59.59.1–59.59.2, Example 59.59.3; J. S. Milne, §11 (pp.78–80) and §14 (p.99).

*Suggested home.* `TauCeti/AlgebraicGeometry/EtaleCohomology/General`, namespace `TauCeti.SchemeFoundations.Etale`.

#### Étale cohomology of limits of schemes (`etale-cohomology-limits`, theorem)

Let X = lim_i X_i be the limit of a directed system of quasi-compact quasi-separated schemes with affine transition morphisms f_{i'i}, with projections f_i : X → X_i, and let (F_i) be a compatible system of abelian étale sheaves (maps f_{i'i}^{-1}F_i → F_{i'}). Then colim_i H^p_et(X_i, F_i) → H^p_et(X, colim_i f_i^{-1}F_i) is an isomorphism for every p. In particular, for a qcqs morphism X → Spec A and a filtered colimit B = colim B_i of A-algebras, H^p(X_B, F) = colim H^p(X_{B_i}, F); and for X qcqs over a field k with separable closure k^sep, H^p(X_{k^sep}, F) = colim_{k'} H^p(X_{k'}, F) over finite separable extensions k'/k. Torsors, finite étale covers and finitely presented étale data descend to some X_i.

*Hypotheses.* X_i qcqs; affine transition maps; directed index set.

*Proof outline.*

1. The small affine étale site of X is the colimit of those of the X_i (Stacks Lemma 59.51.2, Topologies 34.4.12).
2. Apply the colimit theorem for cohomology on colimits of sites (Stacks 21.16.5–21.16.6) to obtain Theorem 59.51.3; the relative statements are Stacks 59.51.5 and 59.51.7.

*Acceptance.* For a constant system X_i = X it is the commutation of cohomology with filtered colimits of sheaves (SF.2/cohomology-filtered-colimits (3)). For X = Spec K^sep = lim Spec L over finite separable L/K, colim H^p(Spec L, F) = 0 for p > 0, recovering the vanishing for separably closed fields.

*Depends on.* `cohomology-filtered-colimits`, `AlgebraicGeometry.Scheme.smallEtaleTopology` (Mathlib), `AlgebraicGeometry.QuasiCompact` (Mathlib), `AlgebraicGeometry.QuasiSeparated` (Mathlib).

*Source.* Stacks Project, Tag 09YQ (Theorem 59.51.3); Stacks Project, Tag 03Q4 (Section 59.51), Lemmas 59.51.2, 59.51.5, 59.51.7; Stacks Project, Tag 0737 (Section 21.16), Lemmas 21.16.5–21.16.6.

*Suggested home.* `TauCeti/AlgebraicGeometry/EtaleCohomology/General`, namespace `TauCeti.SchemeFoundations.Etale`.

#### Hochschild–Serre spectral sequences for Galois coverings (`hochschild-serre-galois-covering`, theorem)

(1) Let π : Y → X be a finite Galois covering with group G (finite étale, G acting on Y over X with Y ×_X G ≅ Y ×_X Y). For every abelian sheaf F on X_et there is a convergent spectral sequence E_2^{r,s} = H^r(G, H^s(Y_et, F|_Y)) ⇒ H^{r+s}(X_et, F), natural in F. (2) Profinite version: if X is qcqs over a field k and X̄ = X ×_k k^sep, there is a convergent spectral sequence E_2^{r,s} = H^r_cont(G_k, H^s(X̄_et, F|_{X̄})) ⇒ H^{r+s}(X_et, F) for every abelian sheaf F on X_et, natural in F, with discrete G_k-modules H^s(X̄, F) by SF.2/etale-cohomology-limits. (3) The low-degree exact sequence 0 → H^1(G_k, H^0(X̄,F)) → H^1(X,F) → H^1(X̄,F)^{G_k} → H^2(G_k, H^0(X̄,F)) → ker(H^2(X,F) → H^2(X̄,F)) → H^1(G_k, H^1(X̄,F)) → H^3(G_k, H^0(X̄,F)) holds.

*Hypotheses.* (1) π finite Galois with group G; (2) X qcqs over a field k; F any abelian étale sheaf.

*Proof outline.*

1. (1) F(X) = F(Y)^G for every sheaf (Milne LEC 6.4), so Γ(X,−) = (−)^G ∘ Γ(Y, −|_Y); restriction to Y preserves injectives and Γ(Y, I) of an injective I is an induced, hence G-acyclic, module. Apply the Grothendieck spectral sequence (Milne LEC Theorem 14.9).
2. (2) Pass to the limit over finite Galois extensions k'/k using (1) for X_{k'} → X and SF.2/etale-cohomology-limits; filtered colimits of spectral sequences converge (as used in Milne LEC p.99).
3. (3) is the five-term-plus exact sequence of a first-quadrant spectral sequence.

*Acceptance.* For X = Spec k, (2) recovers SF.2/etale-galois-comparison. For a geometrically connected variety Y over a finite field F, 0 → H^1(F, Q/Z) → H^1(Y, Q/Z) → H^1(Ȳ, Q/Z) is exact (PAPER-BRIGHT-NEWTON-23/88). For a smooth curve U over a finite field k and torsion F: 0 → H^{r−1}(Ū,F)_Γ → H^r(U,F) → H^r(Ū,F)^Γ → 0 (Milne LEC p.99).

*Depends on.* `etale-cohomology-limits`, `etale-galois-comparison`, `cech-to-cohomology`, `slice-site-cohomology`, `groupCohomology` (Mathlib), `continuousCohomology` (Mathlib).

*Source.* J. S. Milne, §6, Definition 6.1 and Proposition 6.4, pp.42–43; §14, Theorem 14.9, p.96 and the application on p.99; Stacks Project, Tag 09YQ (Theorem 59.51.3).

*Suggested home.* `TauCeti/AlgebraicGeometry/EtaleCohomology/General`, namespace `TauCeti.SchemeFoundations.Etale`.

#### Gabber's affine analogue of proper base change (`gabber-affine-proper-base-change`, theorem)

Let (A, I) be a henselian pair (Mathlib's HenselianRing for the pair; SchemeAndStackFoundations SF.0 henselian pairs), X = Spec A and Z = Spec A/I. For every torsion abelian sheaf F on X_et and every q ≥ 0, restriction H^q_et(X, F) → H^q_et(Z, F|_Z) is an isomorphism. In degree 0 the statement holds for every sheaf of sets. No invertibility of the torsion orders is required.

*Hypotheses.* (A, I) henselian pair; F torsion (every section killed by an integer).

*Proof outline.*

1. q = 0: for a henselian pair Γ(X, F) = Γ(Z, F|_Z) for any sheaf (Stacks 59.82.6, via spectral-space connectedness 59.82.3–59.82.4).
2. Effaceability: classes on Z become zero after embedding F into a torsion sheaf F' built from finite pushforwards (Stacks 59.82.1), using constructible approximation of torsion sheaves on qcqs schemes and limit arguments (Stacks 59.73, 59.51).
3. Conclude by the criterion of Stacks 59.82.2 applied to finite morphisms X' → X (henselian pairs are stable under finite base change), with SF.2/finite-pushforward-exact.

*Acceptance.* For A a henselian local ring with residue field k: H^q(Spec A, F) ≅ H^q(Spec k, F_0) for torsion F (the stalk at the closed point). Used by Bright–Newton (§2.1) and requested by PrismaticCohomology PR.4 and ClassicalAdicEtaleCohomology H0.

*Depends on.* `finite-pushforward-exact`, `etale-cohomology-limits`, `SchemeAndStackFoundations:SF.0/henselian-pair`, `HenselianRing` (Mathlib).

*Source.* Stacks Project, Tag 09ZI (Theorem 59.82.7, Gabber); Tag 09Z8 (Section 59.82), Lemmas 59.82.1–59.82.6.

*Suggested home.* `TauCeti/AlgebraicGeometry/EtaleCohomology/General`, namespace `TauCeti.SchemeFoundations.Etale`.

#### Tsen's theorem and vanishing of Galois cohomology of G_m for function fields of curves (`tsen-theorem`, theorem)

(1) A C_1 field has trivial Brauer group. (2) (Tsen) The function field of an r-dimensional variety over an algebraically closed field k is C_r; hence for a curve C over k, Br(k(C)) = 0 (the field Brauer group, Mathlib's BrauerGroup / Tau Ceti's TauCeti.BrauerGroup). (3) If K/k has transcendence degree 1 over algebraically closed k, then H^q_et(Spec K, G_m) = 0 for all q ≥ 1, and H^q(G_K, M) = 0 for every torsion discrete G_K-module M and q ≥ 2 (cohomological dimension at most one).

*Hypotheses.* k algebraically closed; K of transcendence degree 1 over k for (3).

*Proof outline.*

1. (1) The reduced norm of a central division algebra of degree d > 1 is a homogeneous form of degree d in d^2 variables with only the trivial zero, contradicting C_1 (Stacks Theorem 59.67.8).
2. (2) Count dimensions of spaces of polynomial solutions with bounded pole order on a projective model (Stacks Theorem 59.67.10); combine with (1) (Stacks Lemma 59.67.11).
3. (3) Every finite extension of K is again of transcendence degree 1, so has trivial Brauer group; a field all of whose finite extensions have Br = 0 has H^q(G_K, (K^sep)^×) = 0 for q ≥ 1 and torsion cd ≤ 1 (Stacks Proposition 59.67.4, Lemma 59.67.12), transported by SF.2/etale-galois-comparison.

*Acceptance.* Br(C(t)) = 0. For k algebraically closed, H^2(Spec k(t)_et, μ_n) = 0 for n invertible (Kummer and (3)).

*Depends on.* `etale-galois-comparison`, `hilbert-90`, `BrauerGroup` (Mathlib), `TauCeti.BrauerGroup.instCommGroup` (Tau Ceti), `IsSepClosed` (Mathlib).

*Source.* Stacks Project, Tag 0A2M (Section 59.67): Proposition 59.67.4, Definition 59.67.5, Theorem 59.67.8, Theorem 59.67.10 (Tsen), Lemmas 59.67.11–59.67.12.

*Suggested home.* `TauCeti/AlgebraicGeometry/EtaleCohomology/Curves`, namespace `TauCeti.SchemeFoundations.Etale`.

#### Étale cohomology of G_m on a smooth curve (`curve-multiplicative-cohomology`, theorem)

Let X be a smooth curve over an algebraically closed field k, with generic point j : η → X and closed points X_0. Then 0 → G_{m,X} → j_*G_{m,η} → ⊕_{x ∈ X_0} i_{x*}Z → 0 is exact on X_et, R^qj_*G_{m,η} = 0 for q ≥ 1, and H^q_et(X, G_m) = 0 for q ≥ 2; H^0 = Γ(X,O)^× and H^1 = Pic(X).

*Hypotheses.* X smooth (hence regular, one-dimensional) over algebraically closed k.

*Proof outline.*

1. Exactness is checked on stalks at geometric points: strictly henselian DVRs and the generic point (Stacks Theorem 59.68.1).
2. R^qj_*G_m = 0 for q ≥ 1 because the stalks are Galois cohomology of fraction fields of strictly henselian DVRs and of k(X), which vanish by SF.2/tsen-theorem (Stacks 59.68.2).
3. Leray (SF.2/site-leray-spectral-sequence) gives H^p(X, j_*G_m) = H^p(η, G_m) = 0 for p ≥ 1 (Stacks 59.68.3); H^q(X, ⊕ i_{x*}Z) = 0 for q ≥ 1 (Stacks 59.68.4, using SF.2/cohomology-filtered-colimits and Galois cohomology of k).
4. The long exact sequence gives the result, with H^1 = Pic by SF.2/hilbert-90 (Stacks 59.68.5).

*Acceptance.* For X = P^1_k: H^1(X, G_m) = Z and H^2 = 0. For X = A^1_k: H^q(X, G_m) = 0 for q ≥ 1 (Pic = 0).

*Depends on.* `tsen-theorem`, `site-leray-spectral-sequence`, `cohomology-filtered-colimits`, `hilbert-90`, `finite-pushforward-exact`, `multiplicative-additive-group-sheaves`.

*Source.* Stacks Project, Tag 03RH (Section 59.68), Theorem 59.68.1, Lemmas 59.68.2–59.68.4, Theorem 59.68.5.

*Suggested home.* `TauCeti/AlgebraicGeometry/EtaleCohomology/Curves`, namespace `TauCeti.SchemeFoundations.Etale`.

#### Étale cohomology of μ_n on curves over an algebraically closed field (`curve-roots-of-unity-cohomology`, theorem)

Let k be algebraically closed and n ≥ 1 invertible in k. (1) For a smooth projective curve X of genus g: H^0(X, μ_n) = μ_n(k), H^1(X, μ_n) ≅ Pic^0(X)[n] ≅ (Z/n)^{2g}, H^2(X, μ_n) ≅ Z/n canonically via the degree Pic(X)/n → Z/n, and H^q(X, μ_n) = 0 for q ≥ 3. (2) For a nonconstant π : X → Y of smooth projective curves, π^* on H^2(−, μ_n) is multiplication by deg π. (3) For an affine smooth curve X with smooth projective compactification of genus g and r ≥ 1 points at infinity: H^0 = μ_n(k), H^1(X, μ_n) ≅ (Z/n)^{2g+r−1} and H^q(X, μ_n) = 0 for q ≥ 2.

*Hypotheses.* k algebraically closed; n invertible in k; curves smooth.

*Proof outline.*

1. Apply the Kummer sequence (étale, n invertible: SF.2/fppf-kummer-sequence and CohomologicalPointCounting ConstructibleEtale Layer 6) to SF.2/curve-multiplicative-cohomology.
2. H^1 = Pic(X)[n], whose degree-zero part is the n-torsion of the Jacobian, of order n^{2g} (JacobianChallenge Layers D–E supply Pic^0 as an abelian variety); H^2 = Pic(X)/n ≅ Z/n by the degree (Stacks Lemma 59.69.1).
3. Pullback multiplies degrees by deg π (Stacks Lemma 59.69.2); the affine case uses Pic(X) divisible and Γ(X,O)^×/n of rank r − 1 (Stacks Lemma 59.69.3).

*Acceptance.* For X = P^1: H^1 = 0, H^2 = Z/n. For X = G_m = P^1 ∖ {0,∞}: H^1(G_m, μ_n) ≅ Z/n generated by the Kummer class of the coordinate.

*Depends on.* `curve-multiplicative-cohomology`, `fppf-kummer-sequence`, `hilbert-90`, Tau Ceti JacobianChallenge, layer d the relative picard functor and the jacobian scheme.

*Imports from Tau Ceti roadmaps (not atlas stages; recorded as gaps).* `tauceti:TauCetiRoadmap/CohomologicalPointCounting/ConstructibleEtale#layer-6-roots-of-unity-and-tate-twists`.

*Source.* Stacks Project, Tag 03RN (Section 59.69), Lemmas 59.69.1–59.69.3.

*Suggested home.* `TauCeti/AlgebraicGeometry/EtaleCohomology/Curves`, namespace `TauCeti.SchemeFoundations.Etale`.

#### Cohomological descent for proper hypercoverings (`proper-hypercover-descent`, theorem)

Let X be a scheme (or algebraic space) and a : U_• → X a proper hypercovering (an augmented simplicial scheme with each U_{n+1} → (cosk_n U)_{n+1} proper surjective). Then for every K ∈ D^+(X_et) with torsion cohomology sheaves the map K → Ra_*a^{-1}K is an isomorphism, so RΓ(X_et, K) ≅ RΓ(U_{•,et}, a^{-1}K), and there is a spectral sequence E_1^{p,q} = H^q(U_p, K|_{U_p}) ⇒ H^{p+q}(X, K). The pullback a^{-1} is fully faithful on abelian sheaves, and cartesian sheaves on U_• correspond to sheaves on X.

*Hypotheses.* a a proper hypercovering; K bounded below with torsion cohomology sheaves (no invertibility of the torsion orders is needed). The Stacks Project states Lemmas 85.36.3–85.36.4 without the torsion hypothesis, but its proof uses Lemma 84.8.2, which assumes it (source issue SchemeAndStackFoundations/E-SF2-1).

*Proof outline.*

1. Proper surjective morphisms are coverings for the ph topology; étale cohomology agrees with ph cohomology (Stacks 59.102).
2. Hypercoverings in a topology satisfy cohomological descent for that topology; transport to the étale site through the comparison (Stacks Lemmas 85.36.1–85.36.4).
3. Proper base change (CohomologicalPointCounting EtaleBaseChange Layer 5) underlies the comparison of ph and étale cohomology for torsion coefficients in the classical formulation.

*Acceptance.* For the constant hypercovering U_n = X the statement is trivial. For a proper surjective X' → X with Čech nerve U_•, H^q(X, F) is computed by the descent spectral sequence (de Jong alterations route used by AdicCoefficientsAndComparisons L5).

*Depends on.* `site-leray-spectral-sequence`, `CategoryTheory.SimplicialObject.Augmented` (Mathlib), `AlgebraicGeometry.IsProper` (Mathlib).

*Imports from Tau Ceti roadmaps (not atlas stages; recorded as gaps).* `tauceti:TauCetiRoadmap/CohomologicalPointCounting/EtaleBaseChange#layer-5-proper-base-change`.

*Source.* Stacks Project, Tag 0DHI (Section 85.36), Lemmas 85.36.1–85.36.5; Stacks Project, Tag 0DDV (Section 59.102), Lemmas 59.102.5–59.102.7; Tag 0DGU (Lemma 84.8.2).

*Suggested home.* `TauCeti/AlgebraicGeometry/EtaleCohomology/General`, namespace `TauCeti.SchemeFoundations.Etale`.

#### The morphism from the pro-étale to the étale topos (`proetale-etale-morphism`, construction)

For a scheme X let ν = ν_X : Sh(X_proet) → Sh(X_et) be the morphism of topoi induced by the inclusion of the small étale site into Mathlib's small pro-étale site AlgebraicGeometry.Scheme.ProEt (weakly étale X-schemes with fpqc coverings; Mathlib's ProEt.topology). For an étale sheaf F and an affine U ∈ X_proet written as a cofiltered limit U = lim U_i of affine étale X-schemes, (ν^*F)(U) = colim_i F(U_i); ν_* is restriction to étale objects. ν is functorial: for f : X → Y the square with f_proet and f_et commutes (ν_Y^* f_et^* ≅ f_proet^* ν_X^* … on pullbacks), and for qcqs f the base change map ν_Y^* f_{et,*} → f_{proet,*} ν_X^* is an isomorphism on sheaves and on D^+.

*Hypotheses.* X a scheme; f qcqs for the pushforward compatibility.

*Proof outline.*

1. The inclusion X_et → X_proet is continuous and preserves finite limits, so it defines a morphism of topoi (Bhatt–Scholze §5.1; Stacks 61.19).
2. The colimit formula for ν^* on affine pro-étale objects is Bhatt–Scholze Lemma 5.1.1 (Stacks 61.19.3).
3. Functoriality and pushforward compatibility: Bhatt–Scholze Lemmas 5.4.1 and 5.4.3.

*API.*

- `TauCeti.SchemeFoundations.Proetale.nu` (constructor): The morphism of topoi ν_X : Sh(X_proet) → Sh(X_et), with inverse image ν^* and direct image ν_*.
- `TauCeti.SchemeFoundations.Proetale.nu_inverseImage_obj_affine` (simp): For U = lim U_i affine pro-étale with a presentation, (ν^*F)(U) = colim F(U_i).
- `TauCeti.SchemeFoundations.Proetale.nu_directImage_obj` (simp): (ν_*G)(V) = G(V) for V étale over X.
- `TauCeti.SchemeFoundations.Proetale.nu_unit_iso` (characterisation): The unit F → ν_*ν^*F is an isomorphism for every étale sheaf F.
- `TauCeti.SchemeFoundations.Proetale.nu_naturality` (functoriality): For f : X → Y, ν_Y ∘ f_proet = f_et ∘ ν_X as morphisms of topoi.
- `TauCeti.SchemeFoundations.Proetale.nu_pushforward_comm` (compatibility): For f qcqs and F ∈ Sh(X_et) or D^+(X_et), ν_Y^* f_{et,*}F ≅ f_{proet,*} ν_X^*F.

*Used by.* AdicCoefficientsAndComparisons:L1/comparison-pullback (request to SF.2) — the morphism ν : X_proet → X_et on top of Mathlib's Scheme.ProEt; CrystallineCohomology:CR.4/logarithmic-witt-sheaf (request to SF.2) — ν and fully faithfulness of ν^* on abelian sheaves; CohomologicalPointCounting/EllAdicRealization Layer 3 — its finite-torsion constructible comparison is the restriction of ν to constructible coefficients.

*Unit tests.*

- `TauCeti.SchemeFoundations.Proetale.test_nu_point` (degenerate): For X = ∅, Sh(X_proet) and Sh(X_et) are both trivial and ν is an equivalence.
- `TauCeti.SchemeFoundations.Proetale.test_nu_constant_profinite` (computation): For X = Spec of an algebraically closed field and A = Z/2, (ν^* A)(X ⊗ S) = C(S, Z/2) for a profinite set S.
- `TauCeti.SchemeFoundations.Proetale.test_nu_not_essentially_surjective` (non-example): For X = Spec of an algebraically closed field, the sheaf S ↦ C(S, Z_ℓ) (Mathlib's ellAdicSheaf) is not in the essential image of ν^* (its value on a profinite S is not a colimit over finite quotients).

*Acceptance.* For F constant with value a set A, ν^*F is the sheaf U ↦ locally constant maps |U| → A, not all continuous maps to A with its discrete topology unless U is qcqs (Bhatt–Scholze Lemma 4.2.12). For X = Spec of a separably closed field, Sh(X_proet) is sheaves on profinite sets and ν^* sends a set A to the sheaf S ↦ C(S, A).

*Depends on.* `AlgebraicGeometry.Scheme.ProEt.topology` (Mathlib), `AlgebraicGeometry.Scheme.smallEtaleTopology` (Mathlib), `AlgebraicGeometry.WeaklyEtale` (Mathlib), `AlgebraicGeometry.Scheme.etaleTopology_le_proetaleTopology` (Mathlib), `site-cohomology-pullback`.

*Source.* Bhargav Bhatt, §5.1, Lemma 5.1.1, p.34; §5.4, Lemmas 5.4.1 and 5.4.3, p.39; Stacks Project, Tag 099R (Section 61.19), Lemmas 61.19.1–61.19.3.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/ProetaleComparison`, namespace `TauCeti.SchemeFoundations.Proetale`.

#### Bhatt–Scholze comparison: classical complexes embed fully faithfully in pro-étale complexes (`proetale-classical-comparison`, theorem) — planet: *Bhatt–Scholze pro-étale comparison*

Let X be a scheme and ν : Sh(X_proet) → Sh(X_et) as in SF.2/proetale-etale-morphism. (1) ν^* : Sh(X_et) → Sh(X_proet) is fully faithful, with essential image the sheaves F such that F(U) = colim F(U_i) for affine U = lim U_i. (2) For K ∈ D^+(X_et) the unit K → Rν_*ν^*K is an isomorphism; hence H^q(X_et, K) ≅ H^q(X_proet, ν^*K) and RΓ(U, ν^*K) = colim RΓ(U_i, K). (3) ν^* : D^+(X_et) → D^+(X_proet) is fully faithful with essential image the K whose cohomology sheaves are classical. (4) ν^* defines an equivalence between locally constant sheaves of R-modules of finite type on X_et and on X_proet for a discrete ring R; and H^1 with coefficients in a sheaf of groups agrees. These hold for arbitrary coefficients (not only torsion or constructible ones).

*Hypotheses.* X any scheme; K bounded below for (2)–(3).

*Proof outline.*

1. (1) Bhatt–Scholze Lemma 5.1.2 (from the colimit formula Lemma 5.1.1); Stacks 61.19.2.
2. (2) Check on sections over affine pro-étale U = lim U_i using w-strictly local covers (Bhatt–Scholze Corollary 5.1.6, Remark 5.1.7; Stacks 61.19.4–61.19.6).
3. (3) Bhatt–Scholze Proposition 5.2.6; (4) Bhatt–Scholze Corollary 5.1.5 and Stacks 61.19.7–61.19.9.

*Acceptance.* For K = Z/n concentrated in degree 0: H^q(X_et, Z/n) = H^q(X_proet, Z/n). For X = Spec K and G_m: H^1(X_proet, ν^*G_m) = 0.

*Depends on.* `proetale-etale-morphism`, `w-contractible-cover`, `site-leray-spectral-sequence`, `AlgebraicGeometry.Scheme.ProEt.topology` (Mathlib).

*Source.* Bhargav Bhatt, Lemma 5.1.2 (p.34), Corollaries 5.1.5–5.1.6 and Remark 5.1.7 (p.35), Proposition 5.2.6 (p.37); Stacks Project, Tag 099R (Section 61.19), Lemmas 61.19.2 and 61.19.4–61.19.9.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/ProetaleComparison`, namespace `TauCeti.SchemeFoundations.Proetale`.

#### Replete topoi (`replete-topos`, definition)

A topos T is replete if surjections are stable under sequential limits: for every inverse system … → F_{n+1} → F_n → … → F_0 in T with all F_{n+1} → F_n surjective, the maps lim_n F_n → F_m are surjective. For every scheme X the pro-étale topos Sh(X_proet) is replete (it is locally weakly contractible), while Sh(X_et) need not be.

*Hypotheses.* T a Grothendieck topos (here the topos of sheaves on Mathlib's ProEt.topology).

*Proof outline.*

1. A locally weakly contractible topos (enough weakly contractible coherent objects) is replete (Bhatt–Scholze Proposition 3.2.3).
2. Sh(X_proet) is locally weakly contractible because affine pro-étale objects admit w-contractible covers (Bhatt–Scholze Proposition 4.2.8 from Lemma 2.4.9; SF.2/w-contractible-cover).

*API.*

- `TauCeti.SchemeFoundations.Proetale.IsReplete` (constructor): The predicate on a category of sheaves: limits of towers of epimorphisms are epimorphisms onto each stage.
- `TauCeti.SchemeFoundations.Proetale.isReplete_of_locallyWeaklyContractible` (other): A locally weakly contractible topos is replete.
- `TauCeti.SchemeFoundations.Proetale.isReplete_proetale` (instance): Sh(X_proet) is replete for every scheme X.
- `TauCeti.SchemeFoundations.Proetale.IsReplete.lim_epi` (projection): In a replete topos lim F_n → F_m is an epimorphism for a tower of epimorphisms.
- `TauCeti.SchemeFoundations.Proetale.IsReplete.derivedCategory_leftComplete` (relation): If T is replete then D(T) is left-complete (SF.2/proetale-left-completeness).

*Used by.* SF.2/proetale-left-completeness — repleteness implies left-completeness of D(X_proet); AdicCoefficientsAndComparisons:L1/scheme-adic-category (request to SF.2) — Bhatt–Scholze §4 repleteness of X_proet; PerfectoidSpaces and DiamondsAndVStacks pro-étale arguments — derived limits of towers behave in replete topoi.

*Unit tests.*

- `TauCeti.SchemeFoundations.Proetale.test_isReplete_types` (degenerate): The category of types (sheaves on the one-point site) is replete.
- `TauCeti.SchemeFoundations.Proetale.test_isReplete_proetale_point` (computation): For X = Spec of an algebraically closed field, Sh(X_proet) ≃ sheaves on profinite sets is replete.
- `TauCeti.SchemeFoundations.Proetale.test_etale_not_replete` (non-example): For X = Spec Q the tower of surjections μ_{ℓ^{n+1}} → μ_{ℓ^n} (ℓ-th power) of étale sheaves has limit 0 in Sh(X_et) (no nonzero element of Z_ℓ(1) has open stabiliser in G_Q), so the limit does not surject onto μ_ℓ and Sh(X_et) is not replete

*Acceptance.* The topos of sets is replete. The fpqc topos of schemes is replete (Bhatt–Scholze Example 3.1.7).

*Depends on.* `AlgebraicGeometry.Scheme.ProEt.topology` (Mathlib), `w-contractible-cover`.

*Source.* Bhargav Bhatt, Definition 3.1.1 and Example 3.1.7 (p.16); Definition 3.2.1 and Proposition 3.2.3 (pp.17–18); Proposition 4.2.8 (p.29).

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/ProetaleComparison`, namespace `TauCeti.SchemeFoundations.Proetale`.

#### Existence of w-contractible pro-étale covers (`w-contractible-cover`, theorem)

For every ring A there is a faithfully flat ind-étale A-algebra A' that is w-contractible (every faithfully flat ind-étale A' → B has a section). Consequently every scheme X has a covering in X_proet by w-contractible affine schemes, and Sh(X_proet) is locally weakly contractible.

*Hypotheses.* A any ring; X any scheme.

*Proof outline.*

1. Construct first an ind-Zariski localization with w-local spectrum, then an ind-étale cover with strictly henselian local rings at closed points and extremally disconnected π_0 (Bhatt–Scholze Lemma 2.4.9; Stacks 61.11.3).
2. Glue affine covers (Bhatt–Scholze Theorem 1.5, Proposition 4.2.8).

*Acceptance.* For A = k an algebraically closed field, a w-contractible cover is X ⊗ S for S an extremally disconnected profinite set surjecting onto a point (any S, e.g. the Stone–Čech compactification of a set). w-contractible rings have no nonsplit pro-étale covers (Bhatt–Scholze Definition 2.4.1).

*Depends on.* `AlgebraicGeometry.WeaklyEtale` (Mathlib), `AlgebraicGeometry.Scheme.ProEt.topology` (Mathlib).

*Source.* Bhargav Bhatt, Definition 2.4.1 (p.13), Lemma 2.4.9 (p.14), Theorem 1.5 (p.3), Proposition 4.2.8 (p.29); Stacks Project, Tag 0980 (Section 61.11), Definition 61.11.1, Lemma 61.11.2, Proposition 61.11.3.

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/ProetaleComparison`, namespace `TauCeti.SchemeFoundations.Proetale`.

#### Left-completeness of the pro-étale derived category and the unbounded comparison (`proetale-left-completeness`, theorem)

For a replete topos T, D(T) is left-complete: every K is the derived limit of its truncations τ_{≥−n}K. In particular D(X_proet) is left-complete for every scheme X. Let D_cc(X_proet) be the full subcategory of complexes whose cohomology sheaves are classical (in the image of ν^*); then ν^* and Rν_* restrict to an adjunction between D_cc(X_proet) and D(X_et) which is isomorphic to the left-completion adjunction of D(X_et); hence D_cc(X_proet) is equivalent to the left-completion of D(X_et). This is not an identification of unrestricted unbounded étale complexes with pro-étale ones.

*Hypotheses.* T replete; X any scheme.

*Proof outline.*

1. In a replete topos, limits of towers of surjections of complexes are computed termwise and are exact enough to show τ: D(T) → left-completion is an equivalence (Bhatt–Scholze Proposition 3.3.3).
2. Combine with SF.2/proetale-classical-comparison (bounded-below case) and pass to Postnikov limits (Bhatt–Scholze Proposition 5.3.2).

*Acceptance.* For K ∈ D^+(X_et), ν^*K lies in D_cc and Rν_*ν^*K = K, compatible with SF.2/proetale-classical-comparison. If X_et has finite cohomological dimension, D(X_et) is already left-complete and D_cc(X_proet) ≃ D(X_et).

*Depends on.* `replete-topos`, `proetale-classical-comparison`, `DerivedCategory` (Mathlib).

*Source.* Bhargav Bhatt, Proposition 3.3.3 (p.19), Proposition 5.3.2 (p.38).

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/ProetaleComparison`, namespace `TauCeti.SchemeFoundations.Proetale`.

#### Lisse adic sheaves on the pro-étale site (`proetale-lisse-sheaves`, theorem)

Let X be a scheme and E an algebraic extension of Q_ℓ with integers O_E; let O_{E,X} and E_X be the pro-étale sheaves U ↦ C(U, O_E), C(U, E) (Bhatt–Scholze Lemma 4.2.12; for E = Q_ℓ, O_{E,X} is Mathlib's ellAdicSheaf). For E finite over Q_ℓ with uniformizer ϖ, O_{E,X} = lim O_E/ϖ^n and M ↦ (M/ϖ^nM)_n is an equivalence between locally free O_{E,X}-modules of finite rank and compatible systems of locally free O_E/ϖ^n-modules (classical lisse O_E-sheaves); lisse sheaves satisfy pro-étale descent. Consequently Z_p-local systems (resp. Q_p-local systems) on X are equivalent to locally free O_{Q_p,X}-modules (resp. (Q_p)_X-modules) of finite rank on X_proet, where O_{Q_p,X} = Z_{p,X} is the sheaf of continuous Z_p-valued functions.

*Hypotheses.* X any scheme (topologically Noetherian for the comparison with étale-local lattices in Bhatt–Scholze 6.8.4(3)); E algebraic over Q_ℓ.

*Proof outline.*

1. Identify O_{E,X} with the derived and underived limit of the constant sheaves O_E/ϖ^n using repleteness (Bhatt–Scholze Lemma 6.8.2, SF.2/replete-topos).
2. Equivalence with compatible systems and descent: Bhatt–Scholze Proposition 6.8.4, using SF.2/proetale-classical-comparison (4) at each finite level.

*Acceptance.* For X = Spec of a separably closed field, every lisse O_E-sheaf is free. Mathlib's ellAdicSheaf modulo ℓ^n is the constant sheaf Z/ℓ^n (CohomologicalPointCounting EllAdicRealization Layer 4 states this as a target).

*Depends on.* `proetale-classical-comparison`, `replete-topos`, `AlgebraicGeometry.Scheme.ellAdicSheaf` (Mathlib), `PadicInt` (Mathlib).

*Source.* Bhargav Bhatt, Definition 6.8.1, Lemma 6.8.2 (p.58), Proposition 6.8.4 (p.59); Lemma 4.2.12 (p.30); Kiran S. Kedlaya, Theorem 1.4.11, p.23 (as extracted in PAPER-KEDLAYA-LIU-15/28).

*Suggested home.* `TauCeti/AlgebraicGeometry/Sites/ProetaleComparison`, namespace `TauCeti.SchemeFoundations.Proetale`.

## SF.2e — Coherent duality

The accepted key definition SchemeAndStackFoundations:key/coherent-duality states f^! for separated finite-type morphisms of Noetherian schemes with its formulas (closed immersions, Cartier divisors, Koszul-regular immersions, smooth proper morphisms), proper adjunction, trace and proper Serre duality. This sub-layer supplies what it rests on and what the atlas asks for beyond it, in the generality of the Stacks Project chapter Duality for Schemes: the derived category D_QCoh, derived tensor and internal Hom, Lf^* ⊣ Rf_* with the projection formula, compact generation by a perfect complex, Tor-independent base change, the right adjoint of Rf_* (Neeman–Lipman), independence of compactification (Nagata is imported from CohomologicalPointCounting CompactSupport Layer 1), flat base change for f^!, the étale, smooth and lci formulas, relative dualizing complexes and modules, Serre duality for proper Cohen–Macaulay schemes, sheafified Grothendieck duality, and the comparison with the curve dualizing sheaf of StableReduction Layer 2. This is the single owner of coherent Serre–Grothendieck duality for schemes in the atlas.

#### The derived category of complexes with quasi-coherent cohomology (`derived-quasi-coherent-category`, definition)

For a scheme X let D(O_X) be the (unbounded) derived category of the abelian category of O_X-modules (Mathlib's DerivedCategory of AlgebraicGeometry.Scheme.Modules X). D_QCoh(O_X) is the full subcategory of complexes all of whose cohomology sheaves are quasi-coherent (Mathlib's SheafOfModules.IsQuasicoherent); it is a strictly full triangulated subcategory, closed under direct sums, shifts and cones, with bounded variants D^+_QCoh, D^-_QCoh, D^b_QCoh and, for X locally Noetherian, D_Coh ⊂ D_QCoh (coherent cohomology). For X = Spec A, D(A) → D_QCoh(O_X), M ↦ M~, is an equivalence.

*Hypotheses.* X a scheme; complexes unbounded; the affine equivalence uses Mathlib's tilde.

*Proof outline.*

1. Quasi-coherent modules form a weak Serre subcategory of O_X-modules (kernels, cokernels, extensions), so complexes with quasi-coherent cohomology form a triangulated subcategory (Stacks Section 36.3).
2. Direct sums: computed termwise and cohomology commutes with direct sums (Stacks 36.3.1).
3. Affine equivalence: Stacks Lemma 36.3.5, using that RΓ(X,−) is computed on D_QCoh by sections for affine X (affine acyclicity, JacobianChallenge Layer B).

*API.*

- `TauCeti.SchemeFoundations.Coherent.DQCoh` (constructor): The full triangulated subcategory D_QCoh(O_X) of DerivedCategory (X.Modules) of complexes with quasi-coherent cohomology sheaves.
- `TauCeti.SchemeFoundations.Coherent.DQCoh.mem_iff` (characterisation): K ∈ D_QCoh iff every cohomology sheaf H^i(K) is quasi-coherent.
- `TauCeti.SchemeFoundations.Coherent.DQCoh.isTriangulated` (instance): D_QCoh(O_X) is closed under shifts and cones (a triangulated subcategory).
- `TauCeti.SchemeFoundations.Coherent.DQCoh.hasCoproducts` (instance): D_QCoh(O_X) has arbitrary direct sums, computed in D(O_X).
- `TauCeti.SchemeFoundations.Coherent.DQCoh.affineEquiv` (equivalence): For X = Spec A, M ↦ M~ is an equivalence D(A) ≌ D_QCoh(O_X).
- `TauCeti.SchemeFoundations.Coherent.DCoh` (constructor): For X locally Noetherian, the subcategory of complexes with coherent cohomology, with bounded variants.

*Used by.* SchemeAndStackFoundations:key/coherent-duality — f^! is a functor D^+_QCoh(O_Y) → D^+_QCoh(O_X); this is the carrier the accepted pass left open as 'derived QCoh'; SchemeKTheoryOperations:S.1/affine-derived-equivalence — the affine equivalence D(A) ≅ D_QCoh(Spec A); SF.2/pushforward-right-adjoint — the right adjoint is constructed on D_QCoh by Brown representability.

*Unit tests.*

- `TauCeti.SchemeFoundations.Coherent.test_DQCoh_structure_sheaf` (degenerate): O_X[0] belongs to D_QCoh(O_X) for every scheme X.
- `TauCeti.SchemeFoundations.Coherent.test_DQCoh_affine_free` (computation): Under DQCoh.affineEquiv for X = Spec Z, the complex Z[0] goes to O_X[0] and Z/2[0] goes to the quasi-coherent sheaf (Z/2)~, supported on the closed point V(2).
- `TauCeti.SchemeFoundations.Coherent.test_DQCoh_extension_by_zero_not_qc` (non-example): For X = Spec of a DVR with generic point inclusion j : U → X, the module j_!O_U (extension by zero) is not quasi-coherent, so j_!O_U[0] ∉ D_QCoh(O_X).

*Acceptance.* O_X[0] ∈ D_QCoh(O_X). For X affine the equivalence sends A[0] to O_X[0].

*Depends on.* `DerivedCategory` (Mathlib), `AlgebraicGeometry.Scheme.Modules` (Mathlib), `SheafOfModules.IsQuasicoherent` (Mathlib), `AlgebraicGeometry.tilde` (Mathlib), `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (Tau Ceti), Tau Ceti JacobianChallenge, layer b coherent cohomology over k genus riemannroch serre duality.

*Source.* Stacks Project, Tag 06YZ (Section 36.3), Lemmas 36.3.1, 36.3.5, 36.3.8–36.3.9.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/DerivedQCoh`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### Derived tensor product and derived internal Hom of O_X-modules (`derived-tensor-internal-hom`, construction)

For a scheme (or ringed site) X define K ⊗^L_{O_X} L on D(O_X) using K-flat resolutions and RHom_{O_X}(K, L) using K-injective resolutions, with the adjunction Hom(K ⊗^L L, M) = Hom(K, RHom(L, M)), the global RHom_X(K, L) = RΓ(X, RHom(K, L)) with H^0 = Hom_{D(O_X)}(K, L), and the evaluation and composition maps. ⊗^L preserves D_QCoh; for X = Spec A it corresponds to ⊗^L_A. RHom(K, L) is quasi-coherent for K pseudo-coherent (e.g. perfect, or coherent on a Noetherian scheme) and L ∈ D^+_QCoh. Perfect complexes K are dualizable: K^∨ = RHom(K, O_X) with RHom(K, L) ≅ K^∨ ⊗^L L.

*Hypotheses.* X a scheme or ringed site; boundedness/pseudo-coherence where stated.

*Proof outline.*

1. K-flat and K-injective resolutions exist for complexes of O_X-modules (Stacks 21.17, 21.19, 08J7).
2. Adjunction and the global description: Stacks Section 21.35 (internal hom in the derived category) and 21.36.
3. Quasi-coherence statements: Stacks Lemma 36.3.9 for ⊗^L, and Stacks 36.10 for pseudo-coherent and perfect complexes.

*API.*

- `TauCeti.SchemeFoundations.Coherent.derivedTensor` (constructor): K ⊗^L_{O_X} L on D(O_X), bifunctorial and triangulated in each variable.
- `TauCeti.SchemeFoundations.Coherent.derivedHom` (constructor): RHom_{O_X}(K, L) on D(O_X), contravariant in K, covariant in L.
- `TauCeti.SchemeFoundations.Coherent.derivedTensor_derivedHom_adj` (universal-property): Hom(K ⊗^L L, M) ≅ Hom(K, RHom(L, M)) naturally.
- `TauCeti.SchemeFoundations.Coherent.derivedTensor_unit` (simp): K ⊗^L O_X ≅ K and RHom(O_X, L) ≅ L.
- `TauCeti.SchemeFoundations.Coherent.derivedTensor_mem_DQCoh` (other): ⊗^L preserves D_QCoh(O_X).
- `TauCeti.SchemeFoundations.Coherent.derivedHom_mem_DQCoh` (other): RHom(K, L) ∈ D_QCoh for K pseudo-coherent and L ∈ D^+_QCoh.
- `TauCeti.SchemeFoundations.Coherent.perfect_dual` (relation): For K perfect, RHom(K, L) ≅ RHom(K, O_X) ⊗^L L.

*Used by.* SchemeAndStackFoundations:key/coherent-duality — f^! is described locally with ⊗^L and RHom (μ_f : Lf^*K ⊗^L f^!O_Y → f^!K; closed immersions RHom(O_X, −)); SchemeAndStackFoundations:SF.2/biduality — biduality uses RHom(−, ω) on D_Coh; PAPER-KINGS-SPRANG-25/031 — local Ext along a local complete intersection.

*Unit tests.*

- `TauCeti.SchemeFoundations.Coherent.test_derivedTensor_unit` (degenerate): For K = O_X[0], K ⊗^L K ≅ O_X[0].
- `TauCeti.SchemeFoundations.Coherent.test_derivedTensor_affine_tor` (computation): On X = Spec Z, (Z/2)~ ⊗^L (Z/2)~ has cohomology sheaves (Z/2)~ in degrees 0 and −1 (Tor_1(Z/2, Z/2) = Z/2).
- `TauCeti.SchemeFoundations.Coherent.test_derivedHom_affine_ext` (compatibility): On X = Spec A with K = M~, L = N~ for finitely presented M over Noetherian A, H^i(RHom(K, L)) is (Ext^i_A(M, N))~.
- `TauCeti.SchemeFoundations.Coherent.test_underived_tensor_differs` (non-example): The underived tensor product (Z/2)~ ⊗ (Z/2)~ = (Z/2)~ misses the Tor term, so derivedTensor is not the termwise tensor product of the given complexes.

*Acceptance.* O_X is a unit: K ⊗^L O_X ≅ K and RHom(O_X, L) ≅ L. For a closed immersion i : Z → X, RHom(O_Z, M) computes i^! (old node SchemeAndStackFoundations:SF.2/closed-formula).

*Depends on.* `derived-quasi-coherent-category`, `DerivedCategory` (Mathlib), `CategoryTheory.sheafHom` (Mathlib), `AlgebraicGeometry.Scheme.Modules` (Mathlib).

*Source.* Stacks Project, Tag 08J7 (Section 21.35) and Tag 0B6E (Section 21.36); Stacks Project, Tag 06YZ (Section 36.3), Lemma 36.3.9.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/DerivedQCoh`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### Derived pullback and total direct image on quasi-coherent complexes (`derived-pullback-pushforward-qcoh`, construction)

For a morphism of schemes f : X → Y, Lf^* : D(O_Y) → D(O_X) is left adjoint to Rf_* : D(O_X) → D(O_Y); Lf^* maps D_QCoh(O_Y) into D_QCoh(O_X). If f is quasi-compact and quasi-separated, Rf_* maps D_QCoh(O_X) into D_QCoh(O_Y), commutes with direct sums there, has bounded cohomological amplitude when Y is quasi-compact, and satisfies the projection formula Rf_*(E) ⊗^L K ≅ Rf_*(E ⊗^L Lf^*K) for E ∈ D_QCoh(O_X), K ∈ D_QCoh(O_Y). On cohomology sheaves Rf_* recovers SF.2/qcoh-higher-direct-images; on affine schemes Lf^* is − ⊗^L_A B.

*Hypotheses.* f any morphism for Lf^*; f qcqs for the statements about Rf_*.

*Proof outline.*

1. Lf^* via K-flat resolutions and Rf_* via K-injective resolutions are adjoint (Stacks 21.18–21.19).
2. Preservation of quasi-coherence and affine description of Lf^*: Stacks 36.3.8; Rf_* on D_QCoh and the amplitude bound: Stacks 36.4.1 (the derived form of 30.4.5); direct sums: Stacks 36.4.5.
3. Projection formula: Stacks Lemma 36.22.1.

*API.*

- `TauCeti.SchemeFoundations.Coherent.derivedPullback` (constructor): Lf^* : D(O_Y) → D(O_X), restricting to D_QCoh.
- `TauCeti.SchemeFoundations.Coherent.totalDirectImage` (constructor): Rf_* : D(O_X) → D(O_Y), restricting to D_QCoh for qcqs f.
- `TauCeti.SchemeFoundations.Coherent.derivedPullback_totalDirectImage_adj` (universal-property): Lf^* ⊣ Rf_*.
- `TauCeti.SchemeFoundations.Coherent.totalDirectImage_mem_DQCoh` (other): For f qcqs, Rf_* preserves D_QCoh.
- `TauCeti.SchemeFoundations.Coherent.totalDirectImage_coproduct` (other): For f qcqs, Rf_* on D_QCoh commutes with direct sums.
- `TauCeti.SchemeFoundations.Coherent.projectionFormula` (relation): Rf_*E ⊗^L K ≅ Rf_*(E ⊗^L Lf^*K) for qcqs f.
- `TauCeti.SchemeFoundations.Coherent.totalDirectImage_comp` (functoriality): R(g∘f)_* ≅ Rg_* ∘ Rf_* and L(g∘f)^* ≅ Lf^* ∘ Lg^*.
- `TauCeti.SchemeFoundations.Coherent.cohomology_totalDirectImage` (compatibility): H^i(Rf_*F) ≅ R^if_*F for quasi-coherent F (SF.2/qcoh-higher-direct-images).

*Used by.* SF.2/pushforward-right-adjoint — Rf_* on D_QCoh commutes with sums, so it has a right adjoint; SchemeAndStackFoundations:key/coherent-duality — f^! on proper morphisms is the right adjoint of Rf_*; on compactifications f^! = j^* ∘ a; SchemeKTheoryOperations:S.2/total-direct-image-qcqs (request to SF.2) — Rf_* on D_QCoh for qcqs morphisms with uniform vanishing.

*Unit tests.*

- `TauCeti.SchemeFoundations.Coherent.test_pullback_identity` (degenerate): For f = id_X, Lf^* K ≅ K.
- `TauCeti.SchemeFoundations.Coherent.test_pushforward_projective_line` (computation): For f : P^1_k → Spec k, Rf_*O(−2) is k[−1] (SF.2/projective-space-cohomology).
- `TauCeti.SchemeFoundations.Coherent.test_pullback_affine_tensor` (compatibility): For Spec B → Spec A, Lf^*(M~) has cohomology (Tor_i^A(M, B))~ in degree −i.
- `TauCeti.SchemeFoundations.Coherent.test_underived_pullback_not_exact` (non-example): For Spec(Z/2) → Spec Z and the exact sequence 0 → Z → Z → Z/2 → 0, the underived pullback is not exact (multiplication by 2 becomes zero), so Lf^* is needed.

*Acceptance.* For f the identity, Lf^* = Rf_* = id. For f : X → Spec A with X qcqs, Rf_*O_X has cohomology H^i(X, O_X)~.

*Depends on.* `derived-quasi-coherent-category`, `derived-tensor-internal-hom`, `qcoh-higher-direct-images`, `AlgebraicGeometry.Scheme.Modules.pullback` (Mathlib), `AlgebraicGeometry.Scheme.Modules.pushforward` (Mathlib).

*Source.* Stacks Project, Tag 06YZ (Section 36.3), Lemma 36.3.8; Stacks Project, Tag 08DY (Section 36.4), Lemmas 36.4.1 and 36.4.5; Stacks Project, Tag 08ET (Section 36.22), Lemma 36.22.1.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/DerivedQCoh`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### D_QCoh of a qcqs scheme is generated by one perfect complex (`perfect-generator`, theorem)

Let X be a quasi-compact quasi-separated scheme. Then there is a perfect complex P on X such that for E ∈ D_QCoh(O_X), Hom(P[n], E) = 0 for all n implies E = 0; and an object of D_QCoh(O_X) is compact if and only if it is perfect. Hence D_QCoh(O_X) is compactly generated (Bondal–van den Bergh).

*Hypotheses.* X quasi-compact and quasi-separated.

*Proof outline.*

1. Induction on the number of affines with the induction principle (Stacks 30.4.1): on an affine Spec A, Koszul complexes on generators of ideals give perfect complexes generating the supported subcategory (Stacks 36.15.2); perfect complexes on a quasi-compact open extend up to direct summands (Stacks 36.15.1).
2. Compact ⟺ perfect: Stacks Proposition 36.17.1.

*Acceptance.* For X affine, P = O_X works. For X = P^n_k, P = O ⊕ O(−1) ⊕ … ⊕ O(−n) is a generator (Beilinson).

*Depends on.* `derived-quasi-coherent-category`, `derived-tensor-internal-hom`, `derived-pullback-pushforward-qcoh`.

*Source.* Stacks Project, Tag 09IP (Section 36.15), Lemmas 36.15.1–36.15.2, Theorem 36.15.3; Stacks Project, Tag 09M1 (Proposition 36.17.1).

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/DerivedQCoh`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### Tor-independent base change for quasi-coherent complexes (`tor-independent-base-change`, theorem)

Schemes X and S' over S are Tor independent if Tor_i^{O_{S,s}}(O_{X,x}, O_{S',s'}) = 0 for i > 0 whenever x and s' lie over the same s (e.g. if X → S or S' → S is flat). For f : X → S quasi-compact quasi-separated, g : S' → S, and X, S' Tor independent over S, the base change map Lg^*Rf_*E → Rf'_*L(g')^*E is an isomorphism for every E ∈ D_QCoh(O_X). In particular flat base change holds for quasi-coherent cohomology of qcqs morphisms.

*Hypotheses.* f qcqs; X and S' Tor independent over S.

*Proof outline.*

1. Tor independence is affine-local and equivalent to X ×^L_S S' = X ×_S S' (Stacks Definition 36.22.2, Lemma 36.22.3).
2. Reduce to S, S' affine and compute with Čech complexes of a finite affine cover of X; Tor independence makes the derived tensor product of the Čech complex with O_{S'} underived (Stacks Lemma 36.22.5).

*Acceptance.* For g flat this is flat base change, owned in the proper coherent setting by JacobianChallenge Layer C. Counterexample without Tor independence: X = S' = Spec k ↪ S = A^1_k (closed point): Lg^*Rf_*O_X has H^{−1} ≠ 0 while Rf'_*O_{X'} = k[0].

*Depends on.* `derived-pullback-pushforward-qcoh`, `derived-tensor-internal-hom`, Tau Ceti JacobianChallenge, layer c relative coherent cohomology and base change.

*Source.* Stacks Project, Tag 08ET (Section 36.22), Definition 36.22.2, Lemmas 36.22.3 and 36.22.5; George Boxer, Use in §2.6.12 and Proposition 2.6.13 (as extracted in PAPER-BOXER-PILLONI-26/ext-tor-independence).

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/DerivedQCoh`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### Right adjoint of pushforward on quasi-coherent complexes (`pushforward-right-adjoint`, construction)

For a morphism f : X → Y of quasi-compact quasi-separated schemes, Rf_* : D_QCoh(O_X) → D_QCoh(O_Y) has a right adjoint a = a_f : D_QCoh(O_Y) → D_QCoh(O_X) (written f^× in Lipman's notation). It satisfies: a maps D^+_QCoh into D^+_QCoh; a ∘ (g ∘ f) ≅ a_f ∘ a_g; for L ∈ D_QCoh(O_X), K ∈ D_QCoh(O_Y) there is a canonical map Rf_*RHom(L, a(K)) → RHom(Rf_*L, K) which becomes an isomorphism after the coherator and induces RHom_X(L, a(K)) ≅ RHom_Y(Rf_*L, K); the counit Tr_f : Rf_*a(K) → K is the trace. For f proper this a restricted to D^+_QCoh is the f^! of SchemeAndStackFoundations:key/coherent-duality.

*Hypotheses.* X, Y quasi-compact and quasi-separated; f arbitrary between them.

*Proof outline.*

1. D_QCoh(O_X) is compactly generated (SF.2/perfect-generator) and Rf_* commutes with direct sums (SF.2/derived-pullback-pushforward-qcoh); Brown representability gives the right adjoint (Stacks Lemma 48.3.1, after Neeman).
2. Boundedness: Stacks 48.3.5; sheafified adjunction and global RHom: Stacks 48.3.6, 48.3.10; composition from uniqueness of adjoints.

*API.*

- `TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint` (constructor): a_f : D_QCoh(O_Y) → D_QCoh(O_X), right adjoint to Rf_*.
- `TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint_adj` (universal-property): Rf_* ⊣ a_f on D_QCoh.
- `TauCeti.SchemeFoundations.Coherent.trace` (data): The counit Tr_f : Rf_*a_f(K) → K, natural in K.
- `TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint_comp` (functoriality): a_{g∘f} ≅ a_f ∘ a_g compatibly with traces.
- `TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint_boundedBelow` (other): a_f maps D^+_QCoh(O_Y) into D^+_QCoh(O_X).
- `TauCeti.SchemeFoundations.Coherent.globalDuality` (relation): RHom_X(L, a_f K) ≅ RHom_Y(Rf_*L, K) for L ∈ D_QCoh(O_X), K ∈ D_QCoh(O_Y).
- `TauCeti.SchemeFoundations.Coherent.pushforwardRightAdjoint_affine_finite` (example): For a finite map Spec B → Spec A, a_f(K~) = (RHom_A(B, K))~ as B-complexes.

*Used by.* SchemeAndStackFoundations:key/coherent-duality — on proper morphisms f^! is a_f; on compactifications f^! = j^* ∘ a_{f̄}; SchemeAndStackFoundations:SF.2/trace — the coherent trace is the counit of this adjunction; AbelianSchemesAndArithmeticModuliPartII:P2/poincare-top-cohomology-input (request to SF.2) — proper pushforward and relative duality.

*Unit tests.*

- `TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_id` (degenerate): For f = id_X, a_f ≅ id and Tr_f is the identity.
- `TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_closed_point` (computation): For f : Spec k → Spec k[x] (x ↦ 0), a_f(O) = RHom(k, k[x]) = k[−1].
- `TauCeti.SchemeFoundations.Coherent.test_rightAdjoint_not_upperShriek` (non-example): For f : A^1_k → Spec k (affine, not proper), a_f(k) corresponds to the full linear dual Hom_k(k[x], k) as a k[x]-module (Stacks Example 48.3.2), whereas f^!k = Ω^1[1] ≅ O[1]; the right adjoint of pushforward is not the upper shriek for non-proper f.

*Acceptance.* For f = id, a = id and Tr = id. For A → B finite and f : Spec B → Spec A, a(K) corresponds to RHom_A(B, K) as a B-complex (Stacks Example 48.3.2).

*Depends on.* `perfect-generator`, `derived-pullback-pushforward-qcoh`, `derived-tensor-internal-hom`, `derived-quasi-coherent-category`.

*Source.* Stacks Project, Tag 0A9D (Section 48.3), Lemma 48.3.1, Example 48.3.2, Lemmas 48.3.5–48.3.6 and 48.3.10.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/UpperShriek`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### The upper shriek pseudofunctor is independent of compactifications (`upper-shriek-compactification-independence`, theorem)

Let S be a Noetherian scheme and FTS_S the category of separated finite-type S-schemes. For f : X → Y in FTS_S choose a compactification X → X̄ (open immersion j) → Y (proper f̄) (Nagata, CohomologicalPointCounting CompactSupport Layer 1) and set f^! = j^* ∘ a_{f̄} : D^+_QCoh(O_Y) → D^+_QCoh(O_X). Up to canonical isomorphism f^! is independent of the compactification, there are canonical isomorphisms (g ∘ f)^! ≅ f^! ∘ g^!, and these data form a pseudofunctor from FTS_S to categories. This is the construction of SchemeAndStackFoundations:key/coherent-duality. There are canonical maps μ_{f,K} : Lf^*K ⊗^L f^!O_Y → f^!K.

*Hypotheses.* S Noetherian; morphisms separated of finite type; complexes bounded below with quasi-coherent cohomology.

*Proof outline.*

1. The category of compactifications of X over Y is cofiltered (Stacks Lemma 38.32.1, with Nagata's theorem).
2. For a morphism of compactifications, flat base change for the right adjoint along open immersions (a_{j} = j^* for open immersions, Stacks 48.4) shows the two candidates agree (Stacks Lemma 48.16.2).
3. Composition and coherence: Stacks Lemmas 48.16.3–48.16.4; μ_f: Stacks 48.16.5.

*Acceptance.* For f proper, f^! = a_f restricted to D^+_QCoh. For f an open immersion, f^! = f^* (SF.2/upper-shriek-etale).

*Depends on.* `pushforward-right-adjoint`, `derived-pullback-pushforward-qcoh`, `tor-independent-base-change`, `AlgebraicGeometry.IsProper` (Mathlib), `AlgebraicGeometry.IsSeparated` (Mathlib).

*Imports from Tau Ceti roadmaps (not atlas stages; recorded as gaps).* `tauceti:TauCetiRoadmap/CohomologicalPointCounting/CompactSupport#layer-1-nagata-compactification`, `tauceti:TauCetiRoadmap/CohomologicalPointCounting/CompactSupport#layer-2-common-refinements`.

*Source.* Stacks Project, Tag 0A9Y (Section 48.16), Situation 48.16.1, Lemmas 48.16.2–48.16.5; Stacks Project, Tag 0ATT (Section 38.32), Lemma 38.32.1; Tau Ceti roadmap pull request 196 (TauCetiProject/TauCetiRoadmap), CompactSupport README, Layer 1 (Nagata compactification) and Layer 2 (common refinements), head 4bd7237.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/UpperShriek`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### Upper shriek of étale morphisms and open immersions (`upper-shriek-etale`, lemma)

In FTS_S (S Noetherian): for an open immersion j there is a canonical isomorphism j^! = j^*; for an étale f, f^! ≅ f^* on D^+_QCoh(O_Y); and f^! commutes with restriction to opens: for a square with open immersions j, j', j^* ∘ f^! = g^! ∘ (j')^*. These isomorphisms are compatible with the composition isomorphisms (g∘f)^! ≅ f^!g^!.

*Hypotheses.* S Noetherian; morphisms in FTS_S.

*Proof outline.*

1. Open immersions are their own compactification composed with identity: Stacks Lemma 48.17.1; restriction compatibility: Stacks Lemma 48.17.2.
2. Étale f: f is flat, syntomic and lci with trivial relative dualizing complex; Stacks Lemma 48.18.2.

*Acceptance.* For j : A^1 ∖ 0 → A^1, j^!O = O|_{A^1∖0}. CrystallineCohomology CR.3 requests j^! ≅ j^* for étale separated finite-type j.

*Depends on.* `upper-shriek-compactification-independence`, `SchemeAndStackFoundations:key/coherent-duality`.

*Source.* Stacks Project, Tag 0ATZ (Section 48.17), Lemmas 48.17.1–48.17.2; Stacks Project, Tag 0BZX (Section 48.18), Lemma 48.18.2.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/UpperShriek`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### Flat base change for upper shriek (`upper-shriek-flat-base-change`, theorem)

In FTS_S (S Noetherian), for a cartesian square with f : X → Y in FTS_S and g : Y' → Y flat, there is a canonical isomorphism L(g')^* ∘ f^! ≅ (f')^! ∘ Lg^* on D^+_QCoh(O_Y). For f flat, ω^•_{X/Y} = f^!O_Y is in D^b_Coh, has finite Tor dimension over Y, and its derived restriction to each fibre X_y is ω^•_{X_y/κ(y)}.

*Hypotheses.* S Noetherian; g flat; for the fibre statement f flat.

*Proof outline.*

1. Reduce to the proper case through compactifications; there it is base change for the right adjoint of pushforward along flat maps (Stacks 48.5, 48.18.1).
2. Fibres: Stacks Lemma 48.18.4 using perfectness of flat morphisms (Stacks 48.17.9–48.17.10).

*Acceptance.* For g an open immersion it reduces to SF.2/upper-shriek-etale. For f : P^n_Y → Y flat, ω^•_{X/Y} restricts on fibres to O(−n−1)[n].

*Depends on.* `upper-shriek-compactification-independence`, `tor-independent-base-change`, `pushforward-right-adjoint`, `SchemeAndStackFoundations:key/coherent-duality`.

*Source.* Stacks Project, Tag 0BZX (Section 48.18), Lemmas 48.18.1 and 48.18.4; Stacks Project, Tag 0ATZ (Section 48.17), Lemmas 48.17.9–48.17.10.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/UpperShriek`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### Upper shriek of smooth morphisms (`upper-shriek-smooth`, theorem)

Let f : X → Y be a smooth morphism of relative dimension d in FTS_S (S Noetherian). If f factors as an immersion into a smooth proper Y-scheme (e.g. f quasi-projective), there is a canonical isomorphism f^!M ≅ Lf^*M ⊗^L ∧^dΩ_{X/Y}[d] for M ∈ D^+_QCoh(O_Y), compatible with composition and flat base change; in general f^!O_Y is Zariski-locally on X isomorphic to ∧^dΩ_{X/Y}[d] and f^!M ≅ Lf^*M ⊗^L f^!O_Y. This does not require f proper (the smooth proper case is SchemeAndStackFoundations:SF.2/smooth-proper).

*Hypotheses.* f smooth of relative dimension d; canonical form under the factorisation hypothesis.

*Proof outline.*

1. f is flat and lci, so μ_f : Lf^*M ⊗^L f^!O_Y → f^!M is an isomorphism and f^!O_Y is invertible (Stacks 48.17.11).
2. Locally f is étale over A^d_Y; f^! of A^1_Y → Y is Lf^*(−)[1] (Stacks 48.17.3) and étale maps contribute f^* (SF.2/upper-shriek-etale); hence the local form.
3. Canonical form: the fundamental class of an lci morphism factoring through a smooth proper P gives f^!O_Y ≅ det(N)^{-1} ⊗ ω_{P/Y}|_X[d], which for smooth f is ∧^dΩ_{X/Y}[d] (Stacks Lemma 48.29.2, with the smooth proper case Stacks 48.15.7).

*Acceptance.* For f : A^1_Y → Y, f^!O_Y ≅ O[1] ≅ Ω^1[1]. For f étale (d = 0) it is SF.2/upper-shriek-etale.

*Depends on.* `upper-shriek-etale`, `upper-shriek-flat-base-change`, `lci-upper-shriek`, `SchemeAndStackFoundations:key/coherent-duality`, `AlgebraicGeometry.SmoothOfRelativeDimension` (Mathlib).

*Source.* Stacks Project, Tag 0ATZ (Section 48.17), Lemmas 48.17.3 and 48.17.11; Stacks Project, Tag 0BQV (Section 48.15), Lemma 48.15.7; Stacks Project, Tag 0E9X (Section 48.29), Lemma 48.29.2.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/UpperShriek`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### Upper shriek of local complete intersection and Gorenstein morphisms (`lci-upper-shriek`, theorem)

In FTS_S (S Noetherian): if f : X → Y is a local complete intersection morphism then f^!O_Y is an invertible object of D(O_X) (locally a shifted invertible sheaf), and f^! maps perfect complexes to perfect complexes via f^!K ≅ Lf^*K ⊗^L f^!O_Y. For f flat, f is Gorenstein at x iff f^!O_Y is invertible near x; syntomic (flat lci) morphisms are Gorenstein, hence Cohen–Macaulay. When f factors as an immersion into a smooth proper Y-scheme P with conormal sheaf of rank r, the fundamental class gives a canonical isomorphism f^!O_Y ≅ ∧^r N ⊗ ω_{P/Y}|_X [dim P/Y − r] (N the normal sheaf).

*Hypotheses.* S Noetherian; f lci (resp. flat for the Gorenstein criterion).

*Proof outline.*

1. lci morphisms are locally a Koszul-regular immersion followed by a smooth morphism; combine the regular-immersion formula (old node SchemeAndStackFoundations:SF.2/regular-immersion) with SF.2/upper-shriek-smooth's local form (Stacks 48.17.11).
2. Gorenstein criterion: Stacks 48.25.10; syntomic ⇒ Gorenstein ⇒ Cohen–Macaulay: Stacks 48.25.4–48.25.5.
3. Fundamental class and canonical form: Stacks 48.29.2.

*Acceptance.* For a closed immersion of an effective Cartier divisor D ⊂ Y, f^!O_Y = O_D(D)[−1] (old node SchemeAndStackFoundations:SF.2/cartier-formula). A finite flat map that is not Gorenstein (e.g. k[x,y]/(x,y)^2 over k) has f^!O non-invertible.

*Depends on.* `upper-shriek-compactification-independence`, `upper-shriek-flat-base-change`, `SchemeAndStackFoundations:SF.2/regular-immersion` (accepted pass), `SchemeAndStackFoundations:key/coherent-duality`.

*Source.* Stacks Project, Tag 0ATZ (Section 48.17), Lemma 48.17.11; Stacks Project, Tag 0C02 (Section 48.25), Lemmas 48.25.4, 48.25.5 and 48.25.10; Stacks Project, Tag 0E9X (Section 48.29), Lemma 48.29.2.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/UpperShriek`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### Relative dualizing complexes (`relative-dualizing-complex`, definition)

Let f : X → S be flat and locally of finite presentation, and W ⊂ X ×_S X an open through which the diagonal factors as a closed immersion Δ : X → W. A relative dualizing complex is a pair (K, ξ) with K ∈ D(O_X) S-perfect and ξ : Δ_*O_X → L pr_1^*K|_W a map in D(O_W) inducing an isomorphism Δ_*O_X ≅ RHom_{O_W}(Δ_*O_X, L pr_1^*K|_W). Such pairs exist, are unique up to unique isomorphism, satisfy O_X ≅ RHom(K, K), and commute with arbitrary base change S' → S. For f in FTS_S (S Noetherian) flat, f^!O_Y is a relative dualizing complex; for f proper flat of finite presentation it is the relative dualizing complex of the right adjoint a_f(O_S).

*Hypotheses.* f flat and locally of finite presentation (no Noetherian hypothesis in the definition).

*Proof outline.*

1. Local existence and uniqueness by algebra (Stacks 47.27 relative dualizing complexes of ring maps) and glueing by uniqueness (Stacks Lemmas 48.28.2–48.28.5).
2. Base change: Stacks 48.28.6; identification with f^!O_Y and with a_f(O): Stacks 48.28.7, 48.28.9.

*API.*

- `TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex` (constructor): Structure: an S-perfect K ∈ D(O_X) with the diagonal isomorphism ξ.
- `TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.unique` (extensionality): Two relative dualizing complexes are uniquely isomorphic compatibly with ξ.
- `TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.exists` (constructor): Existence for flat finitely presented f.
- `TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.baseChange` (functoriality): Derived pullback along S' → S of a relative dualizing complex is one for X' → S'.
- `TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.homothety_iso` (characterisation): O_X → RHom(K, K) is an isomorphism.
- `TauCeti.SchemeFoundations.Coherent.RelativeDualizingComplex.upperShriek` (compatibility): For f flat in FTS_S, f^!O_Y with its canonical ξ is a relative dualizing complex.

*Used by.* SF.2/relative-dualizing-module — for Cohen–Macaulay f the complex is a shifted module ω_{X/S}; RT-AREA-algebraicgeometry/18 (handed to this job) — relative dualizing sheaf for lci and smooth morphisms in the Stacks generality; tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity — its relative dualizing complex for proper flat finitely presented relative CM curves is a special case (SF.2/curve-dualizing-comparison).

*Unit tests.*

- `TauCeti.SchemeFoundations.Coherent.test_rdc_identity` (degenerate): For f = id_S, the relative dualizing complex is O_S[0].
- `TauCeti.SchemeFoundations.Coherent.test_rdc_projective_line` (computation): For f : P^1_S → S, the relative dualizing complex is O(−2)[1] = Ω^1_{P^1/S}[1].
- `TauCeti.SchemeFoundations.Coherent.test_rdc_base_change` (compatibility): For S' → S and f flat finitely presented, the base change of the relative dualizing complex of f is that of f' (the unique one).
- `TauCeti.SchemeFoundations.Coherent.test_rdc_not_invertible` (non-example): For f : Spec A → Spec k with A = k[x,y]/(x,y)^2, the relative dualizing complex is Hom_k(A, k)[0], which needs two generators as an A-module; so a relative dualizing complex need not be a shifted line bundle (A is not Gorenstein), unlike for k[x]/(x^2).

*Acceptance.* For X = S (identity), K = O_S. For f smooth of relative dimension d, K ≅ ∧^dΩ_{X/S}[d] (SF.2/upper-shriek-smooth).

*Depends on.* `upper-shriek-flat-base-change`, `derived-tensor-internal-hom`, `pushforward-right-adjoint`, `SchemeAndStackFoundations:key/coherent-duality`.

*Source.* Stacks Project, Tag 0E2S (Section 48.28), Definition 48.28.1, Lemmas 48.28.2–48.28.7 and 48.28.9.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/UpperShriek`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### Relative dualizing module of a Cohen–Macaulay morphism (`relative-dualizing-module`, definition)

Let f : X → Y in FTS_S be flat and Cohen–Macaulay of relative dimension d (fibres Cohen–Macaulay of pure dimension d). Then f^!O_Y has a unique nonzero cohomology sheaf, in degree −d; the relative dualizing module is ω_{X/Y} := H^{−d}(f^!O_Y), a coherent O_X-module, flat over Y, with f^!O_Y ≅ ω_{X/Y}[d], whose formation commutes with base change; it is invertible exactly where f is Gorenstein. For X Cohen–Macaulay equidimensional of dimension d and proper over a field k, ω_X := ω_{X/k} is the dualizing module of Stacks Lemma 48.27.5.

*Hypotheses.* f flat, Cohen–Macaulay of relative dimension d, in FTS_S.

*Proof outline.*

1. For flat f, Cohen–Macaulay at x iff f^!O_Y has a single nonzero cohomology sheaf near x (Stacks Lemma 48.23.3); define ω_{X/Y} by Stacks Remark 48.23.4.
2. Flatness and base change from SF.2/upper-shriek-flat-base-change and SF.2/relative-dualizing-complex; invertibility criterion from SF.2/lci-upper-shriek (Gorenstein).

*API.*

- `TauCeti.SchemeFoundations.Coherent.relativeDualizingModule` (constructor): ω_{X/Y} := H^{−d}(f^!O_Y) for f flat Cohen–Macaulay of relative dimension d.
- `TauCeti.SchemeFoundations.Coherent.upperShriek_structureSheaf_iso_shift` (characterisation): f^!O_Y ≅ ω_{X/Y}[d].
- `TauCeti.SchemeFoundations.Coherent.relativeDualizingModule_coherent` (other): ω_{X/Y} is coherent and flat over Y.
- `TauCeti.SchemeFoundations.Coherent.relativeDualizingModule_baseChange` (functoriality): Formation of ω_{X/Y} commutes with arbitrary base change in FTS_S.
- `TauCeti.SchemeFoundations.Coherent.relativeDualizingModule_invertible_iff` (characterisation): ω_{X/Y} is invertible at x iff f is Gorenstein at x.
- `TauCeti.SchemeFoundations.Coherent.relativeDualizingModule_smooth` (example): For f smooth of relative dimension d, ω_{X/Y} ≅ ∧^dΩ_{X/Y}.

*Used by.* SF.2/cm-serre-duality — Serre duality on proper Cohen–Macaulay schemes is stated with ω_X; SF.2/curve-dualizing-comparison — agreement with the curve dualizing sheaves of StableReduction Layer 2 and JacobianChallenge Layer B; SchemeAndStackFoundations:SF.5 (surface Riemann–Roch, adjunction) — the canonical sheaf of a smooth projective surface.

*Unit tests.*

- `TauCeti.SchemeFoundations.Coherent.test_omega_smooth_curve_degree` (computation): For a smooth projective curve C of genus g over k, deg ω_{C/k} = 2g − 2; for P^1, ω = O(−2).
- `TauCeti.SchemeFoundations.Coherent.test_omega_identity` (degenerate): For f = id_Y (relative dimension 0), ω_{Y/Y} = O_Y.
- `TauCeti.SchemeFoundations.Coherent.test_omega_nodal_invertible` (compatibility): For the nodal cubic y^2 = x^3 + x^2 over k, ω is invertible of degree 0 (Gorenstein, arithmetic genus 1), matching StableReduction Layer 2.
- `TauCeti.SchemeFoundations.Coherent.test_omega_not_canonical_for_non_cm` (non-example): For X = two planes in A^4 meeting at a point (not Cohen–Macaulay), f^!k has more than one nonzero cohomology sheaf, so ω_{X/k} is not defined by this node.

*Acceptance.* For f smooth of relative dimension d, ω_{X/Y} = ∧^dΩ_{X/Y}. For a nodal curve over a field, ω is invertible (nodal curves are Gorenstein).

*Depends on.* `relative-dualizing-complex`, `upper-shriek-flat-base-change`, `lci-upper-shriek`, `SchemeAndStackFoundations:key/coherent-duality`.

*Source.* Stacks Project, Tag 0AWQ (Section 48.23), Lemmas 48.23.1, 48.23.3 and Remark 48.23.4; Stacks Project, Tag 0AWH (Section 48.22), Example 48.22.2.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/UpperShriek`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### Serre duality for proper Cohen–Macaulay schemes (`cm-serre-duality`, theorem)

Let X be a proper scheme over a field k that is Cohen–Macaulay and equidimensional of dimension d, with dualizing module ω_X (SF.2/relative-dualizing-module). Then ω_X[d] is the dualizing complex f^!k, ω_X is coherent, Cohen–Macaulay and has support X, there is a trace map t : H^d(X, ω_X) → k, and for every coherent F and every i the pairing Ext^{d−i}_X(F, ω_X) × H^i(X, F) → H^d(X, ω_X) → k is perfect: H^i(X, F)^∨ ≅ Ext^{d−i}(F, ω_X). For F locally free this reads H^i(X, F)^∨ ≅ H^{d−i}(X, F^∨ ⊗ ω_X). For general proper X the statement with the dualizing complex is the old node SchemeAndStackFoundations:SF.2/serre-proper.

*Hypotheses.* X proper over a field k; Cohen–Macaulay; equidimensional of dimension d; F coherent.

*Proof outline.*

1. Proper duality Ext^i(K, f^!k) ≅ H^{−i}(X, K)^∨ for K ∈ D_QCoh (old node SchemeAndStackFoundations:SF.2/serre-proper, Stacks 48.27.1).
2. For X Cohen–Macaulay equidimensional, f^!k = ω_X[d] with ω_X a CM dualizing module (Stacks Lemma 48.27.5, Remark 48.27.6); substitute K = F.
3. Trace and pairing description: Stacks Remarks 48.27.2–48.27.3.

*Acceptance.* For X = P^n_k: ω = O(−n−1) and H^n(P^n, O(−n−1)) ≅ k (SF.2/projective-space-cohomology). For a smooth projective curve: H^1(C, L)^∨ ≅ H^0(C, ω ⊗ L^{-1}) (JacobianChallenge Layer B).

*Depends on.* `relative-dualizing-module`, `SchemeAndStackFoundations:SF.2/serre-proper` (accepted pass), `projective-space-cohomology`, `SchemeAndStackFoundations:key/coherent-duality`, Tau Ceti StableReduction, layer 2 coherent curve theory duality and positivity.

*Source.* Stacks Project, Tag 0FVU (Section 48.27), Lemma 48.27.1, Remarks 48.27.2–48.27.3, Lemma 48.27.5, Remark 48.27.6.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/UpperShriek`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### General coherent duality restricts to the curve duality of StableReduction and JacobianChallenge (`curve-dualizing-comparison`, comparison)

Let f : X → S be proper, flat, finitely presented with fibres Cohen–Macaulay curves (pure relative dimension 1) over a locally Noetherian S. The relative dualizing module ω_{X/S} of SF.2/relative-dualizing-module (equivalently H^{−1} of the relative dualizing complex) is canonically isomorphic to the relative dualizing sheaf of StableReduction Layer 2 (contract J-B / SR-2), compatibly with traces and base change; for Gorenstein (e.g. nodal) fibres it is invertible; and over a field, for a smooth proper geometrically connected curve, it is JacobianChallenge Layer B's ω_{X/k} with deg ω = 2g − 2. The comparison is a construction of SF.2, not a second curve duality.

*Hypotheses.* f proper flat finitely presented with CM curve fibres; S locally Noetherian (Noetherian where FTS_S is used).

*Proof outline.*

1. Both sides are relative dualizing complexes (shifted by 1) in the sense of SF.2/relative-dualizing-complex; uniqueness of relative dualizing complexes gives the canonical isomorphism (Stacks 48.28.4).
2. Over a field, Stacks Lemmas 53.4.1–53.4.2 identify ω_X for proper CM curves with the dualizing module and give duality H^1(X, F)^∨ ≅ Hom(F, ω_X).
3. Degree formula from Riemann–Roch on the JacobianChallenge side.

*Acceptance.* For P^1_S → S, ω = O(−2) on both sides. For a nodal fibre, the componentwise degree formula of StableReduction Layer 2 holds for ω_{X/S}|_{X_s}.

*Depends on.* `relative-dualizing-module`, `relative-dualizing-complex`, `cm-serre-duality`, Tau Ceti StableReduction, layer 2 coherent curve theory duality and positivity, Tau Ceti JacobianChallenge, layer b coherent cohomology over k genus riemannroch serre duality.

*Source.* Stacks Project, Tag 0E31 (Section 53.4), Lemmas 53.4.1–53.4.2; Stacks Project, Tag 0E2S (Section 48.28), Lemma 48.28.4.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/UpperShriek`, namespace `TauCeti.SchemeFoundations.Coherent`.

#### Sheafified Grothendieck duality for proper morphisms (`sheafified-grothendieck-duality`, theorem)

Let f : X → Y be a proper morphism of Noetherian schemes, L ∈ D^-_Coh(O_X) and K ∈ D^+_QCoh(O_Y). Then the canonical map Rf_*RHom_{O_X}(L, f^!K) → RHom_{O_Y}(Rf_*L, K) is an isomorphism; taking RΓ gives RHom_X(L, f^!K) ≅ RHom_Y(Rf_*L, K), and in particular Ext^i_X(L, f^!K) ≅ Ext^i_Y(Rf_*L, K).

*Hypotheses.* f proper; X, Y Noetherian; L bounded above with coherent cohomology; K bounded below with quasi-coherent cohomology.

*Proof outline.*

1. The sheafified map exists for the right adjoint a_f of any qcqs morphism and is an isomorphism after the coherator (SF.2/pushforward-right-adjoint, Stacks 48.3.6).
2. Under the coherence and boundedness hypotheses both sides already lie in D_QCoh, so the coherator is not needed (Stacks Example 48.3.9); f^! = a_f for proper f.

*Acceptance.* For f = id the statement is tautological. For f : X → Spec k proper and L = F coherent, K = k: Ext^i(F, f^!k) ≅ H^{−i}(X, F)^∨ (SchemeAndStackFoundations:SF.2/serre-proper).

*Depends on.* `pushforward-right-adjoint`, `upper-shriek-compactification-independence`, `derived-tensor-internal-hom`, `SchemeAndStackFoundations:key/coherent-duality`.

*Source.* Stacks Project, Tag 0A9D (Section 48.3), Lemma 48.3.6, Example 48.3.9.

*Suggested home.* `TauCeti/AlgebraicGeometry/Coherent/UpperShriek`, namespace `TauCeti.SchemeFoundations.Coherent`.

## SF.2f — Brauer groups of schemes

The accepted key definition SchemeAndStackFoundations:key/scheme-brauer defines Azumaya algebras, stabilized equivalence, the Brauer group Br_Az(X), the cohomological Brauer group Br'(X) = H^2(X_et, G_m)_tors and the injection δ. This sub-layer completes it: descent of noncommutative quasi-coherent algebras and of the Azumaya property, Grothendieck's equivalent characterisations of Azumaya algebras (and agreement with Mathlib's IsAzumaya on affines), the gerbe of trivialisations as the construction of δ in Mathlib's Sheaf.H, torsion and generic injectivity for regular schemes, the comparison with the Brauer group of a field (through Tau Ceti's QuadraticFormInvariants Layer 7), the Kummer sequences, henselian local rings, and the algebraic Brauer group sequence from Hochschild–Serre. Gabber's theorem Br = Br' and purity for the Brauer group are not planned here.

#### Descent of quasi-coherent algebras and of the Azumaya property (`quasi-coherent-algebra-descent`, theorem)

Let {U_i → X} be an fpqc covering. Pulling back gives an equivalence between quasi-coherent O_X-algebras (associative, unital, central O_X-structure; not necessarily commutative — the carrier SchemeAndStackFoundations:SF.2/sheaf-algebra) and quasi-coherent algebras on ∐ U_i with descent data. A quasi-coherent algebra A on X is Azumaya (SchemeAndStackFoundations:SF.2/azumaya) iff its pullback to some fpqc (equivalently fppf, equivalently étale) covering is Azumaya; morphisms and isomorphisms of algebras descend; and the sheaf Isom_{alg}(A, B) is representable by an affine X-scheme, an étale PGL_d-torsor when A, B are Azumaya of degree d.

*Hypotheses.* {U_i → X} an fpqc covering; algebras quasi-coherent as O_X-modules.

*Proof outline.*

1. Effective fpqc descent of quasi-coherent modules (SchemeAndStackFoundations SF.1, building on Tau Ceti ModularCurves 0E for affine schemes) is an equivalence of symmetric monoidal categories; an algebra structure is a pair of module maps (multiplication, unit) satisfying identities checked after faithfully flat pullback, so algebra structures descend (Stacks Section 35.3 for modules; Grothendieck GB I, Remarque 5.3).
2. Azumaya is fpqc-local: by SF.2/azumaya-equivalent-conditions it is equivalent to finite local freeness plus bijectivity of A ⊗ A^op → End(A), both fpqc-local properties.
3. Isom-schemes: Isom_alg(A,B) is a closed subscheme of the affine Hom-scheme of finite locally free modules; for Azumaya algebras it is a torsor under Aut(Mat_d) = PGL_d (Skolem–Noether; GB I Corollaire 5.11).

*Acceptance.* For A = Mat_d(O_X) the descent datum of the trivial algebra is the trivial one. Over X = Spec R, the Hamilton quaternions descend from the matrix algebra over C with the descent datum twisted by conjugation.

*Depends on.* `SchemeAndStackFoundations:SF.1`, Tau Ceti ModularCurves, 0e effective descent and spreading out, `SchemeAndStackFoundations:SF.2/sheaf-algebra` (accepted pass), `SchemeAndStackFoundations:SF.2/azumaya` (accepted pass), `azumaya-equivalent-conditions`, `nonabelian-torsor-h1`.

*Source.* Stacks Project, Tag 023F (Section 35.3) and Tag 0A2J (Section 59.62); Alexander Grothendieck, Théorème 5.1, Remarque 5.3, Corollaire 5.11, pp.210–213.

*Suggested home.* `TauCeti/AlgebraicGeometry/Brauer/Cohomological`, namespace `TauCeti.SchemeFoundations.Brauer`.

#### Equivalent characterisations of Azumaya algebras on a scheme (`azumaya-equivalent-conditions`, theorem)

Let X be a scheme and A an O_X-algebra which is of finite presentation as an O_X-module. The following are equivalent: (i) A is locally free and every fibre A ⊗ κ(x) is a central simple κ(x)-algebra; (ii) A is locally free and the natural map A ⊗_{O_X} A^op → End_{O_X}(A) is an isomorphism; (iii) every point has an open neighbourhood U and a finite étale surjection U' → U with A|_{U'} ≅ Mat_r(O_{U'}) for some r ≥ 1; (iii bis) as (iii) with U' → U only faithfully flat of finite presentation. On affine X = Spec R these are equivalent to Mathlib's IsAzumaya R Γ(X, A), and they define SchemeAndStackFoundations:SF.2/azumaya.

*Hypotheses.* A of finite presentation as an O_X-module; X any scheme.

*Proof outline.*

1. (i) ⟺ (ii) and (iii bis) ⇒ (i) reduce to fibres and the central simple algebra criterion over fields (Grothendieck GB I, §3, using Tau Ceti's central simple algebra theory: splitting over separable closures, TauCeti.CentralSimple).
2. (i) ⇒ (iii): a central simple algebra over the residue field splits over a finite separable extension; spread out over an étale neighbourhood, and lift the splitting using smoothness of the scheme of matrix-algebra isomorphisms (GB I Propositions 5.4–5.5).
3. Affine comparison: (ii) is Mathlib's IsAzumaya on global sections (old node SchemeAndStackFoundations:SF.2/affine-comparison).

*Acceptance.* Mat_d(O_X) satisfies all conditions. The Hamilton quaternions over Spec R satisfy (iii) with U' = Spec C but are not Zariski-locally a matrix algebra. k[x]/(x^2) over Spec k is free but A ⊗ A^op → End(A) is not bijective (not central simple), so it is not Azumaya.

*Depends on.* `SchemeAndStackFoundations:SF.2/azumaya` (accepted pass), `SchemeAndStackFoundations:SF.2/affine-comparison` (accepted pass), `IsAzumaya` (Mathlib), `Matrix` (Mathlib), `TauCeti.Algebra.exists_isSplittingField_finiteDimensional_isSeparable` (Tau Ceti), `TauCeti.IsSimpleRing.exists_algEquiv_matrix_of_isSepClosed` (Tau Ceti).

*Source.* Alexander Grothendieck, Théorème 5.1 with Propositions 5.4–5.5, pp.210–212; Stacks Project, Tag 0A2J (Section 59.62).

*Suggested home.* `TauCeti/AlgebraicGeometry/Brauer/Cohomological`, namespace `TauCeti.SchemeFoundations.Brauer`.

#### The gerbe of trivialisations of an Azumaya algebra (`azumaya-trivialization-gerbe`, construction)

For an Azumaya algebra A on X, let G_A be the stack on X_et (or (Sch/X)_fppf) whose objects over U are pairs (E, φ) with E a finite locally free O_U-module of positive rank and φ : End(E) ≅ A|_U an algebra isomorphism, with isomorphisms of pairs. G_A is a gerbe banded by G_m (automorphisms of (E, φ) are the scalars O_U^×), so it has a class [G_A] ∈ H^2(X_et, G_m) by SF.2/gerbe-h2-class. The class is additive for ⊗, inverse under A ↦ A^op, zero iff A ≅ End(E) for a global E, depends only on the Brauer class, and equals the old map SchemeAndStackFoundations:SF.2/delta; for A of constant degree d it is the boundary of the PGL_d splitting torsor under 1 → G_m → GL_d → PGL_d → 1. This realises δ : Br_Az(X) → H^2(X_et, G_m) in Mathlib's Sheaf.H without any Čech or cocycle choice.

*Hypotheses.* A Azumaya on X; étale (equivalently fppf, by SF.2/smooth-group-fppf-etale-comparison for G_m) topology.

*Proof outline.*

1. G_A is a stack by descent of modules and morphisms (SF.2/quasi-coherent-algebra-descent); it is locally nonempty because A is étale-locally a matrix algebra End(O^d); any two objects are locally isomorphic by Skolem–Noether; automorphism sheaves are G_m (GB I §2; Stacks 21.11).
2. Apply SF.2/gerbe-h2-class; compare with the boundary of the splitting torsor via the functor sending (E, φ) to the GL-torsor of frames of E (Stacks Section 59.62 discussion).
3. Tensor and opposite: (E, φ) ⊗ (E', φ') gives an object of G_{A⊗A'}; End(E)^op ≅ End(E^∨).

*API.*

- `TauCeti.SchemeFoundations.Brauer.trivializationGerbe` (constructor): The stack G_A of pairs (E, φ : End(E) ≅ A|_U) over the small étale site.
- `TauCeti.SchemeFoundations.Brauer.trivializationGerbe_isGerbe` (other): G_A is a gerbe with band G_m.
- `TauCeti.SchemeFoundations.Brauer.azumayaClass` (constructor): The class [G_A] ∈ H^2(X_et, G_m) (Mathlib's Sheaf.H).
- `TauCeti.SchemeFoundations.Brauer.azumayaClass_eq_zero_iff` (characterisation): [G_A] = 0 iff A ≅ End(E) for a finite locally free E of positive rank.
- `TauCeti.SchemeFoundations.Brauer.azumayaClass_tensor` (relation): [G_{A⊗B}] = [G_A] + [G_B] and [G_{A^op}] = −[G_A].
- `TauCeti.SchemeFoundations.Brauer.azumayaClass_eq_delta` (compatibility): azumayaClass descends to the Brauer quotient and equals SchemeAndStackFoundations:SF.2/delta.
- `TauCeti.SchemeFoundations.Brauer.azumayaClass_pullback` (functoriality): Pullback of algebras corresponds to pullback on H^2 (SF.2/site-cohomology-pullback).

*Used by.* SchemeAndStackFoundations:SF.2/delta — the accepted pass left the 'native H^2 units bridge' open; this is the bridge; SchemeAndStackFoundations:SF.2/delta-injective — injectivity is the statement that a trivial gerbe forces A ≅ End(E); SemisimpleAlgebrasPartII:SA.4/cartier-brauer-comparison (request to SF.2) — the one shared sheaf Azumaya/Brauer carrier with class/module-category comparison.

*Unit tests.*

- `TauCeti.SchemeFoundations.Brauer.test_class_matrix` (degenerate): azumayaClass (Mat_d(O_X)) = 0.
- `TauCeti.SchemeFoundations.Brauer.test_class_quaternion_real` (computation): For X = Spec R and the Hamilton quaternions, azumayaClass ≠ 0 and 2 · azumayaClass = 0.
- `TauCeti.SchemeFoundations.Brauer.test_class_field_agrees` (compatibility): For X = Spec K, azumayaClass followed by SF.2/brauer-field-comparison equals the class of the central simple algebra in TauCeti.BrauerGroup K.
- `TauCeti.SchemeFoundations.Brauer.test_class_not_module_class` (non-example): The class depends on the algebra, not the module: the underlying modules of the quaternions H and of Mat_2(R) over R are both free of rank 4, but their classes differ.

*Acceptance.* For A = End(E) the gerbe has the global object (E, id), so its class is 0. For X = Spec R and the quaternions H, the class is the nonzero element of H^2(Spec R_et, G_m) ≅ Z/2.

*Depends on.* `gerbe-h2-class`, `quasi-coherent-algebra-descent`, `azumaya-equivalent-conditions`, `SchemeAndStackFoundations:SF.2/delta` (accepted pass), `SchemeAndStackFoundations:SF.2/splitting-torsor` (accepted pass), `multiplicative-additive-group-sheaves`, `CategoryTheory.Sheaf.H` (Mathlib).

*Source.* Alexander Grothendieck, §2, pp.204–205; Stacks Project, Tag 0CJZ (Section 21.11), Lemma 21.11.1; Stacks Project, Tag 0A2J (Section 59.62), Lemmas 59.62.1–59.62.2.

*Suggested home.* `TauCeti/AlgebraicGeometry/Brauer/Cohomological`, namespace `TauCeti.SchemeFoundations.Brauer`.

#### Brauer groups of regular schemes: torsion and injectivity into the function field (`brauer-regular-injectivity`, theorem)

Let X be a Noetherian integral scheme whose strictly henselian local rings are factorial (e.g. X regular), with function field K and generic point j : Spec K → X. Then H^q_et(X, G_m) is torsion for q ≥ 2 (so H^2(X, G_m) = Br'(X), the old cohomological Brauer group), and the restriction H^2(X, G_m) → H^2(Spec K, G_m) = Br(K) is injective. Consequently Br_Az(X) → Br(K) is injective and Br'(X) ↪ Br(K).

*Hypotheses.* X Noetherian integral, strictly henselian local rings factorial (regular suffices by Auslander–Buchsbaum).

*Proof outline.*

1. The divisor sequence 0 → G_m → j_*G_{m,K} → Div_X → 0 on X_et with Div_X = ⊕_{x of codimension 1} i_{x*}Z (factoriality identifies Cartier and Weil divisors étale-locally).
2. R^qj_*G_m is torsion for q ≥ 1 (Galois cohomology of fields; Hilbert 90 kills q = 1); H^q(X, i_{x*}Z) are torsion, and H^1(X, i_{x*}Z) = 0 because H^1 of a field with coefficients in Z is Hom_cont(G, Z) = 0 (Grothendieck GB II 1.4, 1.9).
3. Long exact sequences give torsion of H^q(X, G_m), q ≥ 2, and injectivity H^2(X, G_m) → H^2(K, G_m) (GB II Corollaire 1.8, 1.10; Česnavičius 2019, Lemma 3.2).

*Acceptance.* For X = Spec of a Dedekind domain with fraction field K, Br'(X) ↪ Br(K). For X = P^1_k over a field: Br'(P^1_k) = Br(k) ⊂ Br(k(t)).

*Depends on.* `hilbert-90`, `etale-galois-comparison`, `site-leray-spectral-sequence`, `cohomology-filtered-colimits`, `finite-pushforward-exact`, `SchemeAndStackFoundations:SF.2/cohomological-brauer` (accepted pass), `SchemeAndStackFoundations:SF.2/delta-injective` (accepted pass), `azumaya-trivialization-gerbe`.

*Source.* Alexander Grothendieck, Proposition 1.4, Lemme 1.9, Corollaires 1.8 and 1.10, pp.291–293; Kęstutis Česnavičius, Lemma 3.2 and its proof (arXiv:1711.06456v4).

*Suggested home.* `TauCeti/AlgebraicGeometry/Brauer/Cohomological`, namespace `TauCeti.SchemeFoundations.Brauer`.

#### The cohomological Brauer group of a field is the Brauer group (`brauer-field-comparison`, comparison)

For a field K, the composite of SF.2/etale-galois-comparison (H^2(Spec K_et, G_m) ≅ H^2_cont(G_K, (K^sep)^×)) and the crossed-product comparison of Tau Ceti's QuadraticFormInvariants Layer 7 (H^2_cont(G_K, (K^sep)^×) ≅ Br(K)) is an isomorphism Br'(Spec K) = H^2(Spec K_et, G_m) ≅ Br(K) onto Mathlib's BrauerGroup K / Tau Ceti's TauCeti.BrauerGroup K. It is compatible with the old node SchemeAndStackFoundations:SF.2/field-comparison (Br_Az(Spec K) ≅ Br(K)) through δ (SF.2/azumaya-trivialization-gerbe), so δ is an isomorphism for fields, and with restriction along field extensions.

*Hypotheses.* K a field.

*Proof outline.*

1. SF.2/etale-galois-comparison in degree 2 with F = G_m (G_m ↦ (K^sep)^×).
2. QuadraticFormInvariants Layer 7B supplies the crossed-product comparison of the Brauer group with H^2 (inflation of finite cocycles, exhaustion by finite quotients).
3. Compatibility with δ: both send a central simple algebra split by a finite Galois L/K to the class of its factor set (GB I §1; Stacks 59.62).

*Acceptance.* Br'(Spec R) ≅ Z/2. Br'(Spec F_q) = 0 (Wedderburn; ProfiniteCohomology Layer 9 records H^2(Gal(F̄_q/F_q), F̄_q^×) = 0). For K separably closed, Br'(Spec K) = 0.

*Depends on.* `etale-galois-comparison`, `azumaya-trivialization-gerbe`, `SchemeAndStackFoundations:SF.2/field-comparison` (accepted pass), `SchemeAndStackFoundations:SF.2/cohomological-brauer` (accepted pass), Tau Ceti QuadraticFormInvariants, layer 7 the brauer group in galois cohomology, `BrauerGroup` (Mathlib), `TauCeti.BrauerGroup.instCommGroup` (Tau Ceti).

*Source.* Stacks Project, Tag 03QQ (Section 59.59), Lemma 59.59.2 and Tag 03P2 (Theorem 59.22.4 discussion); Stacks Project, Tag 0A2J (Section 59.62).

*Suggested home.* `TauCeti/AlgebraicGeometry/Brauer/Cohomological`, namespace `TauCeti.SchemeFoundations.Brauer`.

#### Kummer sequences for Brauer groups (`brauer-kummer-sequence`, theorem)

Let X be a scheme and n ≥ 1. There is a natural exact sequence 0 → Pic(X)/n → H^2_fppf(X, μ_n) → Br'(X)[n] → 0, where Br'(X) is the torsion of H^2(X_et, G_m) = H^2_fppf(X, G_m); when n is invertible on X the middle term is H^2_et(X, μ_n). Passing to the colimit over n = ℓ^m (ℓ invertible) gives 0 → Pic(X) ⊗ Q_ℓ/Z_ℓ → H^2_et(X, Q_ℓ/Z_ℓ(1)) → Br'(X)[ℓ^∞] → 0, and for X over a field of characteristic 0, 0 → Pic(X) ⊗ Q/Z → H^2(X, Q/Z(1)) → Br'(X) → 0.

*Hypotheses.* X any scheme; n ≥ 1 (invertible on X for the étale form); ℓ invertible for the ℓ-primary form.

*Proof outline.*

1. Take the long exact sequence of SF.2/fppf-kummer-sequence in degrees 1–2 and identify H^i_fppf(X, G_m) = H^i_et(X, G_m) (SF.2/smooth-group-fppf-etale-comparison, SF.2/hilbert-90).
2. Colimit over m with SF.2/cohomology-filtered-colimits; in characteristic 0 every n is invertible.

*Acceptance.* For X = Spec k with k separably closed: H^2(X, μ_n) = 0. For a smooth projective curve over algebraically closed k: Pic/n ≅ Z/n = H^2(X, μ_n) and Br'(X) = 0 (SF.2/curve-roots-of-unity-cohomology). PAPER-SCHROER-23/205: Pic(S) = 0 and H^2(S, G_m) = 0 give H^2(S, μ_2) = 0.

*Depends on.* `fppf-kummer-sequence`, `smooth-group-fppf-etale-comparison`, `hilbert-90`, `cohomology-filtered-colimits`, `SchemeAndStackFoundations:SF.2/cohomological-brauer` (accepted pass).

*Source.* Stacks Project, Tag 03PK (Section 59.28), Remark 59.28.4; Alexander Grothendieck, §3, Théorème 3.1, p.300.

*Suggested home.* `TauCeti/AlgebraicGeometry/Brauer/Cohomological`, namespace `TauCeti.SchemeFoundations.Brauer`.

#### Brauer groups of henselian local rings (`brauer-henselian-local`, theorem)

Let A be a henselian local ring with residue field k. Restriction induces a bijection between isomorphism classes of Azumaya A-algebras of rank r^2 and of central simple k-algebras of degree r, hence Br_Az(A) ≅ Br(k). For n invertible in A, H^2_et(Spec A, μ_n) ≅ H^2_et(Spec k, μ_n) and Br'(A)[n] ≅ Br(k)[n]. In particular Br(A) = 0 for A henselian local with finite residue field (e.g. a complete DVR with finite residue field).

*Hypotheses.* A henselian local; n invertible in A for the cohomological part.

*Proof outline.*

1. Azumaya algebras of rank r^2 are PGL_r-torsors; PGL_r is smooth and affine, so torsors over a henselian local ring are determined by their restriction to the closed point and lift (Grothendieck GB I Théorème 6.1).
2. Cohomological part: SF.2/gabber-affine-proper-base-change for μ_n (torsion), Pic(A) = 0 for local A, and SF.2/brauer-kummer-sequence on both sides.

*Acceptance.* Br(Z_p) = Br(F_p) = 0 (PAPER-HARPAZ-WITTENBERG-16/38). For A strictly henselian, Br(A) = 0.

*Depends on.* `gabber-affine-proper-base-change`, `brauer-kummer-sequence`, `azumaya-equivalent-conditions`, `nonabelian-torsor-h1`, `SchemeAndStackFoundations:key/scheme-brauer`, `HenselianLocalRing` (Mathlib).

*Source.* Alexander Grothendieck, Théorème 6.1 (Azumaya), p.214; Stacks Project, Tag 09ZI (Theorem 59.82.7).

*Suggested home.* `TauCeti/AlgebraicGeometry/Brauer/Cohomological`, namespace `TauCeti.SchemeFoundations.Brauer`.

#### The algebraic Brauer group sequence of a variety (`brauer-hochschild-serre-sequence`, theorem)

Let k be a field with separable closure k^sep and G_k = Gal(k^sep/k), and let V be a quasi-compact quasi-separated geometrically integral k-scheme with H^0(V_{k^sep}, G_m) = (k^sep)^×. Set Br_1(V) = ker(Br'(V) → Br'(V_{k^sep})). The Hochschild–Serre spectral sequence for G_m and V_{k^sep} → V gives a natural exact sequence Br(k) → Br_1(V) → H^1(G_k, Pic(V_{k^sep})) → H^3(G_k, (k^sep)^×), with the first map injective if V(k) ≠ ∅ (and the last map zero then). It is functorial in V.

*Hypotheses.* V qcqs, geometrically integral over k, with only constant invertible functions over k^sep.

*Proof outline.*

1. Apply SF.2/hochschild-serre-galois-covering (2) to F = G_m: E_2^{r,s} = H^r(G_k, H^s(V_{k^sep}, G_m)) with H^0 = (k^sep)^× and H^1 = Pic(V_{k^sep}) (SF.2/hilbert-90).
2. The low-degree exact sequence (part (3) of that node) yields the sequence; identify H^2(G_k, (k^sep)^×) = Br(k) (SF.2/brauer-field-comparison).
3. A rational point splits the edge maps (functoriality for Spec k → V → Spec k).

*Acceptance.* For V = Spec k: Br_1 = Br(k) and Pic = 0. For V a homogeneous space with finite geometric stabiliser (PAPER-HARPAZ-WITTENBERG-23/40), the sequence (3.1) of Harpaz–Wittenberg.

*Depends on.* `hochschild-serre-galois-covering`, `hilbert-90`, `brauer-field-comparison`, `SchemeAndStackFoundations:SF.2/cohomological-brauer` (accepted pass).

*Source.* Yonatan Harpaz, §3, display (3.1) and Remark 3.1, p.8–9 (arXiv:1904.06512v2); J. S. Milne, §14, Theorem 14.9, p.96.

*Suggested home.* `TauCeti/AlgebraicGeometry/Brauer/Cohomological`, namespace `TauCeti.SchemeFoundations.Brauer`.

## SF.2g — Equivariant sheaf cohomology

The accepted key definition SchemeAndStackFoundations:key/equivariant-sheaf-cohomology defines semilinear equivariant sheaves (Γ may move the base), invariant sections, equivariant cohomology as a derived functor, Ext, supports and the spectral sequences. This sub-layer supplies the category they live in (abelian, AB5 and AB3*, Grothendieck with explicit generators — Grothendieck's Tôhoku §5.1), induction and coinduction with the adjunctions Ind ⊣ forget ⊣ Coind, the acyclicity of sections of injective equivariant modules that drives the spectral sequences, and the Ext spectral sequence.

#### The abelian category of semilinear equivariant modules (`equivariant-module-category`, construction)

Let a discrete group Γ act on a ringed space (X, O_X) by automorphisms of ringed spaces (Γ may move points of X). The Γ-equivariant O_X-modules (SchemeAndStackFoundations:SF.2/linearized-sheaf) with Γ-equivariant O_X-linear maps form a category Mod_Γ(O_X). It is abelian with kernels, cokernels, all colimits and products computed in Mod(O_X) with the induced Γ-structures; it satisfies AB5 and AB3*; the forgetful functor Mod_Γ(O_X) → Mod(O_X) is exact and faithful; Hom_Γ(F, G) = Hom_{O_X}(F, G)^Γ; and the objects L(U) = ⊕_{γ∈Γ} (extension by zero of O_{γU}) form a family of generators, so Mod_Γ(O_X) is a Grothendieck category with enough injectives.

*Hypotheses.* Γ a discrete group acting on the ringed space X; modules arbitrary O_X-modules.

*Proof outline.*

1. Kernels/cokernels of equivariant maps inherit linearisations because pullback along automorphisms is exact; AB5 and AB3* are inherited from Mod(O_X) (Grothendieck, Tôhoku, Proposition 5.1.1).
2. Generators: an equivariant map L(U) → A is determined by a section of A over U (Tôhoku §5.1); a Grothendieck category has enough injectives (Tôhoku Théorème 1.10.1).
3. Hom description: Kings–Sprang Definition A.1.

*API.*

- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules` (constructor): The category Mod_Γ(O_X) of semilinear Γ-equivariant O_X-modules.
- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules.abelian` (instance): Mod_Γ(O_X) is abelian, with kernels and cokernels computed underlying.
- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules.forget` (projection): The exact faithful forgetful functor to Mod(O_X).
- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules.forget_exact` (other): forget preserves finite limits and colimits and reflects isomorphisms.
- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules.hom_eq_invariants` (characterisation): Hom_Γ(F, G) ≅ Hom_{O_X}(F, G)^Γ.
- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules.isGrothendieckAbelian` (instance): Mod_Γ(O_X) is Grothendieck abelian (AB5 with the generators L(U)), hence has enough injectives.
- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules.trivialGroupEquiv` (equivalence): For Γ trivial, forget is an equivalence.

*Used by.* SchemeAndStackFoundations:SF.2/enough-injectives — the accepted pass states enough injectives for semilinear equivariant sheaves; this is the category it lives in; SchemeAndStackFoundations:key/equivariant-sheaf-cohomology — derived functors of invariant sections are taken in this category; ArithmeticLocallySymmetricSpaces (imports SF.2/linearized-sheaf, enough-injectives, invariants-acyclic) — equivariant cohomology of locally symmetric spaces.

*Unit tests.*

- `TauCeti.SchemeFoundations.Equivariant.test_trivial_group` (degenerate): For Γ = 1, EquivariantModules.forget is an equivalence of categories.
- `TauCeti.SchemeFoundations.Equivariant.test_point_group_ring` (computation): For X a point with O_X = Z and Γ = Z/2, Mod_Γ(O_X) is the category of Z[Z/2]-modules; the module Z with the sign action is an object not isomorphic to Z with trivial action.
- `TauCeti.SchemeFoundations.Equivariant.test_hom_invariants` (compatibility): For F = G = O_X with trivial linearisation, Hom_Γ(F, G) = Γ(X, O_X)^Γ.
- `TauCeti.SchemeFoundations.Equivariant.test_not_action_category` (non-example): For Γ = Z acting on X = R by translation, the structure sheaf with its translation linearisation is an object of Mod_Γ(O_X) but not of Mathlib's Action (X.Modules) Γ, which only allows Γ to act on a module over a fixed X.

*Acceptance.* For Γ trivial, Mod_Γ(O_X) = Mod(O_X). For X a point, Mod_Γ(O_X) is the category of O(X)[Γ]-modules with semilinear action.

*Depends on.* `SchemeAndStackFoundations:SF.2/linearized-sheaf` (accepted pass), `SchemeAndStackFoundations:SF.2/hom-invariants` (accepted pass), `AlgebraicGeometry.Scheme.Modules` (Mathlib), `Action` (Mathlib), `CategoryTheory.IsGrothendieckAbelian` (Mathlib).

*Source.* Alexander Grothendieck, Chapitre V, §5.1 and Proposition 5.1.1, p.196 (Tôhoku Math. J. 9 (1957)); Guido Kings, Appendix A.1, Definition A.1, p.79 (arXiv:1912.03657v4).

*Suggested home.* `TauCeti/AlgebraicGeometry/Equivariant/Category`, namespace `TauCeti.SchemeFoundations.Equivariant`.

#### Induction and coinduction for equivariant modules (`equivariant-coinduction`, construction)

In the setting of SF.2/equivariant-module-category, define Ind(F) = ⊕_{γ∈Γ} γ^*F and Coind(F) = ∏_{γ∈Γ} γ_*F with Γ permuting the factors (semilinearly over the action on X). Then Ind ⊣ forget ⊣ Coind; Ind is exact; forget preserves injectives (its left adjoint is exact) and Coind preserves injectives (its left adjoint is exact); the unit F → Coind(forget F) is a monomorphism. Consequently every injective object of Mod_Γ(O_X) is a direct summand of Coind(I) with I an injective O_X-module, and its underlying O_X-module is injective.

*Hypotheses.* Γ discrete acting on the ringed space X.

*Proof outline.*

1. Adjunctions: an equivariant map Ind F → G is determined by its γ = 1 component F → G; an equivariant map G → Coind F by its γ = 1 component G → F (standard induction/coinduction, as in Tôhoku §5.1 for L(U)).
2. Preservation of injectives by right adjoints of exact functors; the unit G → Coind(forget G), g ↦ (γ ↦ γ-translate of g), is injective on sections.
3. Embed G into an injective O_X-module I; then G ↪ Coind(forget G) ↪ Coind(I) with Coind(I) injective; for G injective the inclusion splits.

*API.*

- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules.ind` (constructor): Ind(F) = ⊕_γ γ^*F with the permutation Γ-structure.
- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules.coind` (constructor): Coind(F) = ∏_γ γ_*F with the permutation Γ-structure.
- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules.indForgetAdj` (universal-property): Ind ⊣ forget.
- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules.forgetCoindAdj` (universal-property): forget ⊣ Coind.
- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules.coind_injective` (other): Coind sends injective O_X-modules to injective equivariant modules.
- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules.forget_injective` (other): forget sends injective equivariant modules to injective O_X-modules.
- `TauCeti.SchemeFoundations.Equivariant.EquivariantModules.unit_mono` (characterisation): The unit G → Coind(forget G) is a monomorphism.

*Used by.* SchemeAndStackFoundations:SF.2/enough-injectives — enough injectives and the shape of injective objects; SF.2/coinduced-sections-acyclic — sections of coinduced modules are coinduced Γ-modules; SchemeAndStackFoundations:SF.2/invariants-acyclic — the retract argument named in the accepted node.

*Unit tests.*

- `TauCeti.SchemeFoundations.Equivariant.test_coind_trivial_group` (degenerate): For Γ = 1, Coind ≅ id.
- `TauCeti.SchemeFoundations.Equivariant.test_coind_point` (computation): For X a point with O = Z and Γ = Z/2, Coind(Z) = Z × Z with the swap action ≅ Z[Z/2].
- `TauCeti.SchemeFoundations.Equivariant.test_coind_global_sections` (compatibility): Γ(X, Coind F) ≅ Map(Γ, Γ(X, F)) as Γ-modules (product over γ of Γ(X, γ_*F) = Γ(X, F)).
- `TauCeti.SchemeFoundations.Equivariant.test_ind_ne_coind_infinite` (non-example): For Γ = Z and X a point, Ind(Z) = Z[Z] (finite support) differs from Coind(Z) = Map(Z, Z) (all functions); induction and coinduction differ for infinite Γ.

*Acceptance.* For Γ trivial, Ind = Coind = id. For X a point and O = Z, Coind(A) = Map(Γ, A), the coinduced Γ-module.

*Depends on.* `equivariant-module-category`, `SchemeAndStackFoundations:SF.2/linearized-sheaf` (accepted pass).

*Source.* Alexander Grothendieck, Chapitre V, §5.1 (construction of the generators L(U) and the reduction to modules), p.196; Guido Kings, Appendix A.1, p.79.

*Suggested home.* `TauCeti/AlgebraicGeometry/Equivariant/Category`, namespace `TauCeti.SchemeFoundations.Equivariant`.

#### Sections of injective equivariant modules are acyclic for invariants (`coinduced-sections-acyclic`, lemma)

For every injective object J of Mod_Γ(O_X) and every Γ-stable open U, the Γ-module Γ(U, J) satisfies H^p(Γ, Γ(U, J)) = 0 for p > 0. Hence F ↦ Γ(X, F) sends injectives of Mod_Γ(O_X) to (−)^Γ-acyclic Γ-modules, which is the input of the Grothendieck spectral sequence H^p(Γ, H^q(X, F)) ⇒ H^{p+q}(X, Γ; F). The same holds for Hom_{O_X}(F, J) (for the Ext spectral sequence) and for sections with support Γ_D(X, J).

*Hypotheses.* J injective equivariant; U, D Γ-stable.

*Proof outline.*

1. By SF.2/equivariant-coinduction, J is a direct summand of Coind(I) with I injective; Γ(U, Coind I) = Map(Γ, Γ(U, I)) is a coinduced Γ-module, acyclic by Shapiro's lemma (Mathlib/Tau Ceti group cohomology of coinduced modules); summands of acyclics are acyclic.
2. Hom_{O_X}(F, Coind I) = Map(Γ, Hom(F, I)) similarly; supported sections likewise.
3. This proves the accepted node SchemeAndStackFoundations:SF.2/invariants-acyclic in the generality stated there.

*Acceptance.* For Γ finite and X a point it is Shapiro's lemma for Map(Γ, A). Fails for non-injective objects: O_X with trivial action on a point has H^1(Z/2, Z) = 0 but H^2(Z/2, Z) = Z/2 ≠ 0.

*Depends on.* `equivariant-coinduction`, `equivariant-module-category`, `groupCohomology` (Mathlib), `SchemeAndStackFoundations:SF.2/invariants-acyclic` (accepted pass).

*Source.* Guido Kings, Appendix A.1, display (A.1.1), p.80; Alexander Grothendieck, Chapitre V, §5.2, Théorème 5.2.1, pp.200–201.

*Suggested home.* `TauCeti/AlgebraicGeometry/Equivariant/Category`, namespace `TauCeti.SchemeFoundations.Equivariant`.

#### Spectral sequence for equivariant Ext (`equivariant-ext-spectral-sequence`, theorem)

For Γ-equivariant O_X-modules F and G there is a convergent first-quadrant spectral sequence E_2^{p,q} = H^p(Γ, Ext^q_{O_X}(F, G)) ⇒ Ext^{p+q}_{Γ,O_X}(F, G) (equivariant Ext of SchemeAndStackFoundations:SF.2/ext), natural in F and G; for F = O_X it is the spectral sequence of SchemeAndStackFoundations:SF.2/spectral-sequence.

*Hypotheses.* Γ discrete acting on X; F, G equivariant.

*Proof outline.*

1. Hom_Γ(F, −) = (−)^Γ ∘ Hom_{O_X}(F, forget −); forget preserves injectives and Hom_{O_X}(F, J) is Γ-acyclic for injective J (SF.2/coinduced-sections-acyclic); apply the Grothendieck spectral sequence (Kings–Sprang (A.1.1)).

*Acceptance.* For Γ trivial it degenerates to Ext^q_{O_X}(F, G). For F = O_X it recovers H^p(Γ, H^q(X, G)) ⇒ H^{p+q}(X, Γ; G).

*Depends on.* `coinduced-sections-acyclic`, `equivariant-coinduction`, `SchemeAndStackFoundations:SF.2/ext` (accepted pass), `SchemeAndStackFoundations:SF.2/spectral-sequence` (accepted pass).

*Source.* Guido Kings, Appendix A.1, Definition A.2 and (A.1.1), p.80.

*Suggested home.* `TauCeti/AlgebraicGeometry/Equivariant/Category`, namespace `TauCeti.SchemeFoundations.Equivariant`.

## Integration of the upstream entries

Each atlas `UPSTREAM:` entry whose integration owner is SF.2, with the Tau Ceti roadmap and layers it stands for and the SF.2 nodes that complete it.

| Entry | Stands for | SF.2 nodes | Note |
|---|---|---|---|
| UPSTREAM:CohomologicalPointCounting (also UPSTREAM:CohomologicalPointCounting (PR196); UPSTREAM:CohomologicalPointCounting PR196; UPSTREAM:CohomologicalPointCounting:ConstructibleEtale/EtaleBaseChange/CompactSupport/EllAdicRealization/ComplexComparison/TraceFormula) | CohomologicalPointCounting/ConstructibleEtale layers 0–10; CohomologicalPointCounting/EtaleBaseChange layers 0–9; CohomologicalPointCounting/CompactSupport layers 0–10; CohomologicalPointCounting/EllAdicRealization layers 0–10; CohomologicalPointCounting/FrobeniusGeometry layers 0–7; CohomologicalPointCounting/TraceFormula layers 0–15; CohomologicalPointCounting/ComplexComparison layers 0–12 | `site-cohomology-pullback`, `fppf-kummer-sequence`, `proper-hypercover-descent`, `upper-shriek-compactification-independence` |  |
| UPSTREAM:CohomologicalPointCounting/ConstructibleSheaves (PR196) | CohomologicalPointCounting/ConstructibleEtale layers 4–5 (finite stratifications and constructible sheaves) | — |  |
| UPSTREAM:CohomologicalPointCounting:ConstructibleEtale:3 | CohomologicalPointCounting/ConstructibleEtale layers 3 (finite étale Galois category, paths, monodromy) | — |  |
| UPSTREAM:CohomologicalPointCounting:ConstructibleEtale:6 | CohomologicalPointCounting/ConstructibleEtale layers 6 (μ_n, Kummer exactness for n invertible, Tate twists) | `multiplicative-additive-group-sheaves`, `fppf-kummer-sequence` |  |
| UPSTREAM:CohomologicalPointCounting:ConstructibleEtale:7-9 | CohomologicalPointCounting/ConstructibleEtale layers 7–9 (D^b_c, finite Tor dimension, finite-coefficient étale cohomology) | — |  |
| UPSTREAM:CohomologicalPointCounting:EtaleBaseChange (also UPSTREAM:CohomologicalPointCounting:EtaleBaseChange:3-8; UPSTREAM:CohomologicalPointCounting:EtaleBaseChange:4-7; UPSTREAM:CohomologicalPointCounting:EtaleBaseChange:6; UPSTREAM:CohomologicalPointCounting:EtaleBaseChange:8-9) | CohomologicalPointCounting/EtaleBaseChange layers 0–9 (3–8: base-change transformation, smooth and proper base change, finiteness, local acyclicity, lisse direct images; 6: cohomological dimension and finiteness; 8–9: lisse direct images and Künneth) | `site-derived-pushforward`, `site-leray-spectral-sequence`, `finite-pushforward-exact`, `gabber-affine-proper-base-change` |  |
| UPSTREAM:CohomologicalPointCounting:CompactSupport:5-9 | CohomologicalPointCounting/CompactSupport layers 5–9 (derived Rf_!, localization, RΓ_c, finiteness and perfectness, projection formula and Künneth (Noetherian bases)) | — |  |
| UPSTREAM:CohomologicalPointCounting:EllAdicRealization (also UPSTREAM:CohomologicalPointCounting:EllAdicRealization:0-10; UPSTREAM:CohomologicalPointCounting/EllAdicRealization (PR196)) | CohomologicalPointCounting/EllAdicRealization layers 0–10 | `proetale-etale-morphism`, `proetale-classical-comparison`, `proetale-lisse-sheaves` |  |
| UPSTREAM:CohomologicalPointCounting:ComplexComparison (also UPSTREAM:CohomologicalPointCounting:ComplexComparison:8; UPSTREAM:CohomologicalPointCounting:ComplexComparison:10-12; UPSTREAM:CohomologicalPointCounting/ComplexComparison (PR196)) | CohomologicalPointCounting/ComplexComparison layers 0–12 (8: Riemann existence; 10–12: finite-level, compact-support and relative Artin comparison) | — |  |
| UPSTREAM:CohomologicalPointCounting:FrobeniusGeometry | CohomologicalPointCounting/FrobeniusGeometry layers 0–7 (6: topological invariance of the small étale site for universal homeomorphisms) | — |  |
| UPSTREAM:CohomologicalPointCounting:TraceFormula (also UPSTREAM:CohomologicalPointCounting:TraceFormula:0-4; UPSTREAM:CohomologicalPointCounting:TraceFormula:8; UPSTREAM:CohomologicalPointCounting/TraceFormula (PR196): Layers8,11,14) | CohomologicalPointCounting/TraceFormula layers 0–15 (0–4 perfect-complex traces; 8 curve–Jacobian trace; 11 Grothendieck–Lefschetz; 14 sheaf L-functions) | — |  |
| UPSTREAM:ECD:SCH_BC | CohomologicalPointCounting/EtaleBaseChange layers 4–5 (smooth and proper base change, invariance under separably closed field extension) | `gabber-affine-proper-base-change`, `etale-cohomology-limits`, `finite-pushforward-exact` | ECD is Scholze's Étale cohomology of diamonds; SCH_BC names the scheme base-change theorems it cites (proper base change over arbitrary bases, integral base change, invariance, limits). |
| UPSTREAM:ECD:SCH_SHEAVES | CohomologicalPointCounting/ConstructibleEtale layers 1–5 (module sheaves, stalks, lisse and constructible sheaves); CohomologicalPointCounting/FrobeniusGeometry layers 6 (topological invariance) | `topology-comparison-morphisms`, `finite-pushforward-exact`, `site-cohomology-pullback` | Étale cohomology with supports in this contract is owned by EtaleDualityAndPerverseSheaves EDC.0. |
| UPSTREAM:ECD:SCH_SUPPORT_NOETH | CohomologicalPointCounting/CompactSupport layers 1–7 (Nagata compactification and Rf_! over Noetherian bases) | — | The extension to limits of Noetherian bases is not planned by any layer (coverage remaining of SF.2; upstream note to CompactSupport). |
| UPSTREAM:AlgebraicGeometry:ProjectiveSchemesAndSmoothMorphisms | Mathlib: AlgebraicGeometry.Proj.toSpecZero, AlgebraicGeometry.Smooth, AlgebraicGeometry.SmoothOfRelativeDimension; StableReduction#layer-2-coherent-curve-theory-duality-and-positivity (projective morphisms and relative Proj of finitely generated graded algebras) | — | Not SF.2 mathematics: projective schemes and smooth morphisms are Mathlib, StableReduction Layer 2 and SchemeAndStackFoundations SF.0; SF.2 adds only their cohomology (SF.2/projective-space-cohomology, SF.2/upper-shriek-smooth). |
| UPSTREAM:Schemes-vector-bundles | SchemeAndStackFoundations:SF.0 (locally free sheaves and vector bundles on schemes (Tau Ceti InvertibleSheaf, Mathlib quasi-coherent sheaves of modules)) | — | Mis-assigned to SF.2: vector bundles are schemes-and-modules foundations (SF.0). |

## Requests to other roadmaps

- **Tau Ceti JacobianChallenge, layer a line bundles divisors picard group degree**: The Picard group Pic(X) of a scheme as a group (inverses of invertible sheaves), extending Tau Ceti's LineBundleClass; SF.2 identifies H^1(X_τ, G_m) with it for τ = Zariski, Nisnevich, étale, fppf. Needed by: `hilbert-90`.
- **Tau Ceti JacobianChallenge, layer b coherent cohomology over k genus riemannroch serre duality**: Coherent cohomology on Tau Ceti's Scheme.Modules.Cohomology: vanishing of H^p(U, F), p > 0, for every quasi-coherent F on every affine scheme U (not only over a field), and the Čech computation for affine covers of separated schemes; SF.2 builds quasi-coherent higher direct images, projective-space cohomology, D_QCoh and the topology comparisons on these. Needed by: `qcoh-higher-direct-images`, `projective-space-cohomology`, `ample-serre-vanishing`, `serre-affineness-criterion`, `kempf-cousin-resolution`, `quasi-coherent-topology-comparison`, `derived-quasi-coherent-category`, `curve-dualizing-comparison`.
- **Tau Ceti JacobianChallenge, layer c relative coherent cohomology and base change**: Flat base change for quasi-coherent cohomology of quasi-compact quasi-separated morphisms (Stacks 02KH), which SF.2 uses for local cohomology and as the flat case of Tor-independent base change. Needed by: `local-cohomology-flat-base-change`, `tor-independent-base-change`.
- **Tau Ceti JacobianChallenge, layer d the relative picard functor and the jacobian scheme**: The Jacobian of a smooth projective curve over an algebraically closed field with Pic^0(X)[n] ≅ (Z/n)^{2g} for n invertible, used to state H^1(X, μ_n) of a curve. Needed by: `curve-roots-of-unity-cohomology`.
- **Tau Ceti StableReduction, layer 2 coherent curve theory duality and positivity**: Coherence of R^if_* for proper morphisms over locally Noetherian bases and the relative dualizing sheaf of proper flat finitely presented relative Cohen–Macaulay curves, with trace and base change; SF.2 proves its general coherent duality agrees with this curve case (SF.2/curve-dualizing-comparison) and uses proper coherence for Serre vanishing. Needed by: `ample-serre-vanishing`, `proper-fibre-dimension-vanishing`, `cm-serre-duality`, `curve-dualizing-comparison`.
- **Tau Ceti ModularCurves, 0e effective descent and spreading out**: Effective faithfully flat descent for affine schemes, finite locally free modules and morphisms, used for descent of quasi-coherent algebras and Isom-schemes of Azumaya algebras. Needed by: `quasi-coherent-algebra-descent`.
- **Tau Ceti ProfiniteCohomology, layer 9 the galois interface hilbert 90 and kummer theory**: Galois Hilbert 90 and Kummer theory on the canonical continuous-cohomology carrier with coefficients (K^sep)^× and μ_n. Needed by: `etale-galois-comparison`.
- **Tau Ceti ProfiniteCohomology, layer 10 continuous cohomology in all degrees**: Continuous cohomology of profinite groups with discrete coefficients in all degrees, identified with the derived functors of invariants on discrete modules, used to identify étale cohomology of a field with Galois cohomology. Needed by: `etale-galois-comparison`.
- **Tau Ceti QuadraticFormInvariants, layer 7 the brauer group in galois cohomology**: The comparison of the Brauer group of a field with H^2(G_K, (K^sep)^×) (crossed products), used for the cohomological Brauer group of Spec K. Needed by: `brauer-field-comparison`.

## Recorded gaps

- **CohomologicalPointCounting/CompactSupport Layers 1–2 are not atlas stages.** Noetherian Nagata compactification of separated finite-type morphisms with cofiltered common refinements is a target of the Tau Ceti roadmap pull request 196 (CompactSupport Layers 1–2, head 4bd7237), recorded in importsFromTauCetiRoadmaps. It cannot be cited as a prerequisite until the family's layers are registered as atlas stages; the dependency is otherwise complete. Needed by: `upper-shriek-compactification-independence`.
- **CohomologicalPointCounting/EtaleBaseChange Layer 5 is not an atlas stage.** Proper base change for torsion étale sheaves (EtaleBaseChange Layer 5 of pull request 196) underlies the comparison of ph and étale cohomology used for descent along proper hypercoverings (Stacks 59.102, 85.36). Recorded in importsFromTauCetiRoadmaps; replace by a prerequisite once the layer is an atlas stage. Needed by: `proper-hypercover-descent`.
- **CohomologicalPointCounting/ConstructibleEtale Layer 6 is not an atlas stage.** The étale Kummer sequence for n invertible and the roots-of-unity sheaf μ_n as a finite locally constant Z/n-sheaf are ConstructibleEtale Layer 6 of pull request 196; SF.2 plans only the fppf sequence for all n and identifies the two μ_n (SF.2/multiplicative-additive-group-sheaves). Recorded in importsFromTauCetiRoadmaps. Needed by: `fppf-kummer-sequence`, `curve-roots-of-unity-cohomology`.
- **Constructible approximation of torsion sheaves on non-Noetherian qcqs schemes is unowned.** Gabber's theorem (Stacks 59.82.7) uses that every torsion abelian sheaf on a qcqs scheme is a filtered colimit of constructible sheaves and the limit description of constructible sheaves (Stacks Section 59.73, notably Lemma 59.73.2, together with 59.51). CohomologicalPointCounting ConstructibleEtale Layer 5 states constructible theory for Noetherian schemes only, and no atlas layer plans the qcqs statement. It should be added to ConstructibleEtale (upstream note) or planned as an SF.2 refinement node; until then it is a recorded input of the Gabber node. Needed by: `gabber-affine-proper-base-change`.
- **Grothendieck's étale–fppf comparison read only through its citation.** The theorem H^q_et(X, G) = H^q_fppf(X, G) for smooth quasi-projective commutative G (Le groupe de Brauer III, Théorème 11.7) is stated from Česnavičius 2019, §2 and Appendix A, which cites and uses it; the original (Dix exposés, 1968) was not available to this job and its exact hypotheses were not checked against the original text. Needed by: `smooth-group-fppf-etale-comparison`.

## Acceptance tests for the layer

1. Cohomology across topologies: for X = P^1_k, H^1(X, O(−2)) = k in the Zariski, Nisnevich, étale and fppf
   topologies; H^1(Spec R, μ_2) is 0 for Zariski and Z/2 for étale; H^1_fppf(Spec F_p(t), μ_p) ≠ 0 = H^1_et.
2. Hilbert 90 and Kummer: H^1_et(Spec Z[√−5], G_m) ≅ Z/2; H^1_fppf(Spec O_F, μ_p) is an extension of
   Cl(F)[p] by O_F^×/p.
3. Galois comparison: H^q_et(Spec K, G_m) = H^q(G_K, (K^sep)^×), zero for q = 1 and Br(K) for q = 2;
   H^2(Spec R, G_m) = Z/2 is the class of the Hamilton quaternions (δ and the field comparison agree).
4. Curves over an algebraically closed field: H^q(X, G_m) = 0 for q ≥ 2; H^2(X, μ_n) = Z/n via the degree;
   pullback multiplies by the degree.
5. Nisnevich: Spec C → Spec R is an étale but not a Nisnevich covering; a Zariski cover is an elementary
   distinguished square; Nisnevich cohomology of a field vanishes in positive degrees and that of a
   Noetherian scheme vanishes above its dimension.
6. Pro-étale: H^q(X_et, Z/n) = H^q(X_proet, Z/n); Sh(X_proet) is replete while Sh((Spec Q)_et) is not.
7. Coherent duality: for P^n_k, f^!k = O(−n−1)[n] and H^n(P^n, O(−n−1)) = k; for a smooth projective curve,
   deg ω = 2g − 2 and ω agrees with StableReduction's and JacobianChallenge's dualizing sheaf; for an étale
   map f^! = f^*; k[x,y]/(x,y)^2 over k has a non-invertible relative dualizing complex.
8. Equivariant: for Γ = Z/2 acting on a point, equivariant modules are Z[Z/2]-modules and Coind(Z) ≅ Z[Z/2];
   for infinite Γ induction and coinduction differ.

## Restructuring proposals

- **split** (SchemeAndStackFoundations). SF.2 now carries 140 nodes (55 from the accepted whole-roadmap pass and 85 here) in seven coherent groups; one star cannot show them and at most six planets fit a layer. *Proposal:* Divide SF.2 into sub-layers, keeping SF.2 as their parent: SF.2a site cohomology foundations (site-cohomology-pullback, site-derived-pushforward, site-leray-spectral-sequence, cech-to-cohomology, abelian-torsor-h1, nonabelian-torsor-h1, gerbe-h2-class, slice-site-cohomology, godement-resolution, flasque-cech-vanishing, noetherian-space-vanishing, cohomology-filtered-colimits); SF.2b quasi-coherent cohomology and supports (qcoh-higher-direct-images, projective-space-cohomology, ample-serre-vanishing, proper-fibre-dimension-vanishing, serre-affineness-criterion, sheaf-cohomology-with-supports, supports-localization-triangle, local-cohomology-module-comparison, local-cohomology-flat-base-change, depth-local-cohomology-vanishing, cousin-complex, kempf-cousin-resolution); SF.2c topologies and coefficient sheaves (big-site-quasi-coherent-sheaf, multiplicative-additive-group-sheaves, topology-comparison-morphisms, quasi-coherent-topology-comparison, etale-pullback-fppf-comparison, smooth-group-fppf-etale-comparison, hilbert-90, fppf-kummer-sequence, artin-schreier-sequence, and the nine Nisnevich nodes); SF.2d étale cohomology beyond finite coefficients and the pro-étale comparison (finite-pushforward-exact, etale-galois-comparison, etale-cohomology-limits, hochschild-serre-galois-covering, gabber-affine-proper-base-change, tsen-theorem, curve-multiplicative-cohomology, curve-roots-of-unity-cohomology, proper-hypercover-descent and the six pro-étale nodes); SF.2e coherent duality (the fourteen H nodes with the accepted duality nodes and key/coherent-duality); SF.2f Brauer groups (the eight I nodes with the accepted Brauer nodes and key/scheme-brauer); SF.2g equivariant sheaf cohomology (the four J nodes with the accepted equivariant nodes and key/equivariant-sheaf-cohomology). Suggested planets: SF.2a Leray spectral sequence; SF.2b Cousin complex; SF.2c Nisnevich topology, Hilbert's Theorem 90; SF.2d Bhatt–Scholze comparison, Gabber's affine proper base change; SF.2e Coherent Grothendieck duality, Serre duality for Cohen–Macaulay schemes; SF.2f Scheme Brauer group; SF.2g Equivariant sheaf cohomology.
- **rescope** (SchemeAndStackFoundations, AlgebraicModuliForArithmeticGeometry, AnalyticStacks). Confirmed finding RT-AREA-algebraicgeometry/18: coherent Serre–Grothendieck duality beyond curves was routed to three owners (A0-extension through PILLONI-20 route 10, BOXER-CALEGARI-GEE-PILLONI-21 route 11 and CALEGARI-GERAGHTY-18 route 18; SF.1/SF.3 through GUO-REINECKE-24 route 9; and AnalyticStacks AS.1). SF.2 now plans it once in the Stacks 'Duality for Schemes' generality: right adjoint of pushforward, f^! on separated finite-type morphisms of Noetherian schemes with compactification independence and flat base change, étale/smooth/lci formulas, relative dualizing complexes and modules, Serre duality for proper Cohen–Macaulay schemes, and the comparison with StableReduction Layer 2. *Proposal:* Make SchemeAndStackFoundations:SF.2 the single owner of coherent duality for schemes; re-point PILLONI-20 route 10, BOXER-CALEGARI-GEE-PILLONI-21 route 11, CALEGARI-GERAGHTY-18 route 18 and GUO-REINECKE-24 route 9 (scheme part) to SF.2, and have the classical quasi-coherent part of AnalyticStacks AS.1 import it. Add the stage link SchemeAndStackFoundations:SF.2 → AlgebraicModuliForArithmeticGeometry:A0-extension (acyclic: SF.2 does not import A0-extension). SF.5's surface Riemann–Roch and Hodge index import SF.2's Serre duality.
- **rescope** (SchemeAndStackFoundations, EtaleDualityAndPerverseSheaves, PurityForFlatCohomology, EtaleDualityAbsolutePurityPartII). Confirmed finding RT-AREA-etale/2: absolute purity was planned twice. SF.2 is in upstream tier 2 and cannot import the higher Part II. The accepted Česnavičius 2019 extraction now routes absolute purity and the Brauer-purity theorems to the proposed roadmap PurityForFlatCohomology (route 16) and only the early site, Kummer, comparison and field inputs to SF.2 (route 2). *Proposal:* SF.2 plans no purity theorem. EtaleDualityAbsolutePurityPartII is the single owner of Gabber's absolute purity (regular closed immersions of regular schemes; Fujiwara 2.1.1 / ILO XVI 3.1.1); PurityForFlatCohomology owns Brauer purity and imports both SF.2 (its early prefix: Kummer, étale–fppf comparison, regular injectivity, Gabber's affine base change) and the Part II. Re-mark CESNAVICIUS-19/absolute-purity-input and LI-LIU-21/79 as planned at the Part II, and CESNAVICIUS-19/supports (étale cohomology with supports) as planned at EtaleDualityAndPerverseSheaves:EDC.0. The graph stays acyclic: both purity owners import SF.2.
- **rescope** (SchemeAndStackFoundations, SchemeKTheoryOperations, MotivicEtaleKTheory, EnhancedDerivedSheaves). Confirmed finding RT-AREA-ktheory-2/38: no atlas stage constructed the Nisnevich topology. SF.2 now plans Nisnevich coverings, the big and small Nisnevich topologies, elementary distinguished squares as Mathlib MayerVietorisSquares, the square criterion for sheaves, points at henselizations, the cohomological-dimension bound, the Čech comparison and Brown–Gersten vanishing. *Proposal:* SchemeKTheoryOperations S.4 and MotivicEtaleKTheory M.5a import SF.2's Nisnevich nodes. The spectrum-valued descent criterion (a presheaf of spectra on qcqs schemes is a Nisnevich sheaf iff distinguished squares go to pullbacks) is stated in S.4, deduced from SF.2/nisnevich-sheaf-criterion and SF.2/brown-gersten-vanishing in S.4's homotopical setting; the Clausen–Mathew Nisnevich Part II of EnhancedDerivedSheaves, if adopted, imports SF.2 rather than redefining the site.
- **rescope** (SchemeAndStackFoundations, DiamondsAndVStacks, AdicCoefficientsAndComparisons). Upstream-tier rule: SF.2 (tier 2) needed generic site-cohomology functoriality, higher direct images, Leray and Čech spectral sequences (planned by DiamondsAndVStacks D0, tier 3) and étale cohomology of limits (planned by AdicCoefficientsAndComparisons L2, tier 10). These notions move down into SF.2. *Proposal:* DiamondsAndVStacks D0 imports SF.2/site-cohomology-pullback, SF.2/site-derived-pushforward, SF.2/site-leray-spectral-sequence and SF.2/cech-to-cohomology for ordinary sites; AdicCoefficientsAndComparisons L2/etale-cohomology-continuity imports SF.2/etale-cohomology-limits. Neither higher layer re-plans them.
- **rescope** (SchemeAndStackFoundations, EtaleDualityAndPerverseSheaves, MotivesAndAlgebraicCycles). The accepted BENOIST-WITTENBERG-20 route sends a real-étale comparison and a coniveau/Cousin/Bloch–Ogus–Gabber package to an SF.2 suffix, importing the norm-residue isomorphism (MotivicEtaleKTheory M.5) and étale cohomology with supports (EDC.0); a tier-2 layer cannot import either. *Proposal:* Plan the étale coniveau spectral sequence, Bloch–Ogus–Gabber effacement and Cousin resolutions as a sub-layer above EtaleDualityAndPerverseSheaves:EDC.0 (for instance EDC.0:coniveau) or in MotivesAndAlgebraicCycles; it imports SF.2's Zariski supports (SF.2/sheaf-cohomology-with-supports, SF.2/cousin-complex) and site cohomology. SF.2 keeps only the Zariski/coherent Cousin complexes of BCGP §3.9.

## Remaining refinements

- Lemma-level refinement of the 85 target-level nodes of this packet (each node's proof steps name the lemmas to split off) and of the 55 key-definition nodes of the accepted pass, once the roadmap moves to lemma level.
- Routed items kept as refinements of planned targets: Česnavičius 2019 Appendix A field cohomology (fields of dimension ≤ 1, fppf cohomology of α_p and finite or finite-type commutative groups over such fields, semiabelian vanishing) on top of SF.2/smooth-group-fppf-etale-comparison and SF.2/fppf-kummer-sequence; the finite-flat and punctured H^2 descent statements (h2-descent, h2-torsion-descent, etale-h2-descent, finite-flat-brauer, lci-flat-brauer, cech-alternative, completion-inject/surject, punctured-completion) on top of SF.2/cech-to-cohomology and SF.2/brauer-regular-injectivity; perfect-scheme p-primary vanishing of H^i(X, G_m) on top of SF.2/artin-schreier-sequence.
- Routed items kept as refinements: Kings–Sprang derived limits of equivariant sheaves (items 028–029) and the Borel construction (item 030) on top of SF.2/equivariant-module-category; Benoist 2019 item 194 (connecting maps versus cup products) on top of SF.2/site-cohomology-pullback; Farb–Kisin–Wolfson item 147 (exterior algebra cohomology of split tori, needing the Künneth formula of CohomologicalPointCounting EtaleBaseChange Layer 9); Harpaz–Wittenberg 2020 item 33 (units sequence of a torus torsor) on top of SF.2/site-leray-spectral-sequence; Scholze 2017 item 208 (fppf covers of strictly henselian local rings are refined by finite flat ones).
- Additional refinements: cd_ℓ(X) ≤ cd_ℓ(k) + 2 dim X over non-closed fields (from SF.2/hochschild-serre-galois-covering and CohomologicalPointCounting EtaleBaseChange Layer 6); the divisor sequence and R^sg_*G_m on Dedekind schemes (Milne, Arithmetic Duality Theorems II.2.1 inputs requested by MotivicEtaleKTheory M.2); compactly supported Rf_! over cofiltered limits of Noetherian bases (the ECD SCH_SUPPORT_NOETH extension requested by AdicCoefficientsAndComparisons and ClassicalAdicEtaleCohomology), beyond CompactSupport's Noetherian scope.
- Not planned here by ownership (see restructure and handoff): étale cohomology with supports (EtaleDualityAndPerverseSheaves EDC.0), Gabber absolute purity and Brauer purity (EtaleDualityAbsolutePurityPartII and the proposed PurityForFlatCohomology), the Benoist–Wittenberg real/coniveau étale package (needs étale supports and the norm-residue theorem), Poincaré duality on Deligne–Mumford stacks, the Hansen–Scholze ambient ULA notion, and the spectrum-valued Nisnevich descent criterion (stated in SchemeKTheoryOperations S.4 from SF.2/brown-gersten-vanishing).

## Sources

- **STACKS**: The Stacks Project Authors, *The Stacks Project*, Online, read 2026-10-09 (tags cited per node). <https://stacks.math.columbia.edu> Read: Ch. 20: Sections 20.12 (09SV), 20.20 (02UU, 02UZ), 20.21 (0A39), 20.30 (0FKR), 20.34 (0G6Y); Ch. 21: Sections 21.4 (03AG), 21.7 (01FU), 21.10 (03AV), 21.11 (0CJZ), 21.14 (072X), 21.16 (0737), 21.35 (08J7); Ch. 30: Sections 30.3 (01XE), 30.4 (01XH), 30.6 (07TA), 30.8 (01XS), 30.16 (0B5S), 30.17 (01XO), 30.19 (02O3), Lemma 30.20.9 (02V7); Ch. 35: Lemma 35.8.1 (03DT), Proposition 35.9.3 (03DW), Section 35.3 (023F); Ch. 36: Sections 36.3 (06YZ), 36.4 (08DY), 36.15 (09IP), 36.17 (09M0), 36.22 (08ET); Ch. 38: Section 38.32 (0ATT); Ch. 47: Lemma 47.9.1 (0A6R), Lemma 47.9.3 (0ALZ), Section 47.10 (0BJD), Section 47.11 (0AVY); Ch. 48: Sections 48.3 (0A9D), 48.15 (0BQV), 48.16 (0A9Y), 48.17 (0ATZ), 48.18 (0BZX), 48.22 (0AWH), 48.23 (0AWQ), 48.25 (0C02), 48.27 (0FVU), 48.28 (0E2S), 48.29 (0E9X); Ch. 51: Sections 51.2 (0DWQ), 51.9 (0DWW); Lemma 15.91.2 (05E9); Ch. 53: Section 53.4 (0E31); Ch. 59: Sections 59.17 (03OF), 59.19 (03OU), 59.22 (03OY), 59.23 (03YZ), 59.24 (03P7), 59.28 (03PK), 59.37 (04DI), 59.51 (03Q4), 59.55 (03QN), 59.59 (03QQ), 59.62 (0A2J), 59.63 (0A3J), 59.67 (0A2M), 59.68 (03RH), 59.69 (03RN), 59.82 (09Z8), 59.100 (0DDK), 59.102 (0DDV); Ch. 61: Sections 61.11 (0980), 61.19 (099R); Ch. 75: Section 75.9 (08GL); Ch. 85: Section 85.36 (0DHI).
- **MILNE-LEC**: J. S. Milne, *Lectures on Étale Cohomology*, Version 2.21, 22 March 2013 (202 pp.), read 2026-10-09. <https://www.jmilne.org/math/CourseNotes/LEC.pdf> Read: §6 Galois coverings (Definition 6.1, Proposition 6.4, Exercise 6.5), pp.42–44; §10 Example 10.1, p.70; §11 first cohomology, Remark 11.7, pp.78–80; §14 Theorem 14.9 (Hochschild–Serre) and its application to curves, pp.96–99.
- **BS-PROET**: Bhargav Bhatt and Peter Scholze, *The pro-étale topology for schemes*, arXiv:1309.1198v2, 17 December 2014 (published in Astérisque 369 (2015)); preprint read 2026-10-09. <https://arxiv.org/abs/1309.1198v2> Read: §2.4 (Definition 2.4.1, Lemma 2.4.9); §3.1–3.3 (Definition 3.1.1, Example 3.1.7, Definition 3.2.1, Proposition 3.2.3, Proposition 3.3.3); §4.1–4.2 (Definition 4.1.1, Lemmas 4.2.4, 4.2.12, Proposition 4.2.8); §5.1–5.4 (Lemmas 5.1.1–5.1.4, Corollaries 5.1.5–5.1.6, Remark 5.1.7, Proposition 5.2.6, Proposition 5.3.2, Lemmas 5.4.1, 5.4.3); §6.8 (Definition 6.8.1, Lemma 6.8.2, Proposition 6.8.4); Theorem 1.5.
- **MV99**: Fabien Morel and Vladimir Voevodsky, *A^1-homotopy theory of schemes*, Publ. Math. IHÉS 90 (1999), 45–143; Numdam scan read 2026-10-09. <http://www.numdam.org/item/PMIHES_1999__90__45_0> Read: §3.1 Nisnevich topology, pp.94–102: Proposition 1.1, Definitions 1.2–1.3, Proposition 1.4, Lemmas 1.5–1.6, Remark 1.7, Propositions 1.8–1.9, Example 1.10, the paragraph on points before Lemma 1.11, Definitions 1.12–1.13, Proposition 1.16, Lemmas 1.17–1.18.
- **GB-I**: Alexander Grothendieck, *Le groupe de Brauer : I. Algèbres d'Azumaya et interprétations diverses*, Séminaire Bourbaki, exp. 290 (1966), pp.199–219; Numdam scan read 2026-10-09. <http://www.numdam.org/item/SB_1964-1966__9__199_0> Read: §1.3 (p.200); §2 Généralisation à un topos localement annelé (pp.204–205); §5: Théorème 5.1, Corollaire 5.2, Remarque 5.3, Propositions 5.4–5.5, Corollaire 5.11 (pp.210–213); §6: Théorème 6.1 (Azumaya), p.214.
- **GB-II**: Alexander Grothendieck, *Le groupe de Brauer : II. Théories cohomologiques*, Séminaire Bourbaki, exp. 297 (1966), pp.287–307; Numdam scan read 2026-10-09. <http://www.numdam.org/item/SB_1964-1966__9__287_0> Read: §1: Proposition 1.4, Corollaire 1.5, Lemme 1.6, Proposition 1.7, Corollaire 1.8, Lemme 1.9, Corollaire 1.10 (pp.291–293); §3: Théorème 3.1 (p.300).
- **GB-III**: Alexander Grothendieck, *Le groupe de Brauer : III. Exemples et compléments*, In: Dix exposés sur la cohomologie des schémas, North-Holland, 1968. NOT READ by this job: cited only through Česnavičius 2019 (source CS19). Read: Théorème 11.7 as cited in Česnavičius, Purity for the Brauer group, §2 and Appendix A; the original text was not available.
- **CS19**: Kęstutis Česnavičius, *Purity for the Brauer group*, arXiv:1711.06456v4, 1 December 2018 (published Duke Math. J. 168 (2019)); preprint read 2026-10-09. <https://arxiv.org/abs/1711.06456v4> Read: §2 (proof of Proposition 2.3, Remark 2.7: identification of fppf and étale G_m-cohomology via [Gro68b, 11.7]); Lemma 3.2 and proof (generic injectivity and torsion of H^2(X, G_m) on regular X); Appendix A (fppf cohomology of fields; warning about μ_p and α_p).
- **SGA2**: Alexander Grothendieck (with M. Raynaud), *Cohomologie locale des faisceaux cohérents et théorèmes de Lefschetz locaux et globaux (SGA 2)*, Annotated re-edition, arXiv:math/0511279v1 (2005); read 2026-10-09. <https://arxiv.org/abs/math/0511279> Read: Exposé II (local cohomology as a colimit of Ext), Exposé III §3 (depth and vanishing of local cohomology), consulted for the statements cited by Kings–Sprang and Pilloni.
- **BCGP**: George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*, arXiv:1812.09269v3, 28 November 2021 (published Publ. Math. IHÉS 134 (2021)); preprint read 2026-10-09. <https://arxiv.org/abs/1812.09269v3> Read: §3.9.5: definition (3.9.8) of the Cousin complex, Theorem 3.9.6, Remark 3.9.7, Example 3.9.9 (pp.63–65).
- **KS25**: Guido Kings and Johannes Sprang, *Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and p-adic interpolation*, arXiv:1912.03657v4, 14 September 2024 (85-page preprint; published Annals of Math. 202 (2025)); read 2026-10-09. <https://arxiv.org/abs/1912.03657v4> Read: Appendix A.1–A.2, pp.79–81: Definitions A.1–A.3, display (A.1.1), support sequence.
- **TOHOKU**: Alexander Grothendieck, *Sur quelques points d'algèbre homologique*, Tôhoku Math. J. (2) 9 (1957), 119–221; J-STAGE scan of pp.185–221 read 2026-10-09. <https://www.jstage.jst.go.jp/article/tmj1949/9/3/9_3_185/_pdf> Read: Chapitre V §5.1 (G-O-Modules, Proposition 5.1.1, generators L(U)), p.196; §5.2 Théorème 5.2.1 (spectral sequences), pp.200–201.
- **HW23**: Yonatan Harpaz and Olivier Wittenberg, *The Massey vanishing conjecture for number fields*, arXiv:1904.06512v2, 5 January 2022 (published Duke Math. J. 172 (2023)); read 2026-10-09. <https://arxiv.org/abs/1904.06512v2> Read: §3, display (3.1) and Remark 3.1, pp.8–9.
- **KL15**: Kiran S. Kedlaya and Ruochuan Liu, *Relative p-adic Hodge theory: foundations*, arXiv:1301.0792v5 (Astérisque 371); NOT re-read by this job: cited through the accepted paper extraction PAPER-KEDLAYA-LIU-15 item 28. Read: Theorem 1.4.11, p.23, as recorded in the accepted extraction PAPER-KEDLAYA-LIU-15/28; the statement used is checked against Bhatt–Scholze Proposition 6.8.4, which this job read.
- **BOXER-PILLONI-26**: George Boxer and Vincent Pilloni, *Higher Hida theory for Siegel modular forms (as extracted)*, NOT re-read by this job: cited through the accepted paper extraction PAPER-BOXER-PILLONI-26 item ext-tor-independence. Read: §2.6.12 and Proposition 2.6.13 as recorded in the accepted extraction; the mathematical statement is checked against Stacks Definition 36.22.2 and Lemma 36.22.5.
- **CPC**: Tau Ceti roadmap pull request 196 (TauCetiProject/TauCetiRoadmap), *Cohomological comparison and point counting (family of seven Tau Ceti roadmaps)*, Head 4bd72379658126cbe9be935656396f0c9dac4de0 (open pull request), all eight README files read 2026-10-09. <https://github.com/TauCetiProject/TauCetiRoadmap/tree/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting> Read: Family README; ConstructibleEtale Layers 0–10; EtaleBaseChange Layers 0–9; CompactSupport Layers 0–10; EllAdicRealization Layers 0–10; FrobeniusGeometry Layers 6–7; TraceFormula Layers 8–11; ComplexComparison (layer list and scope).
