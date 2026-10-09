# Hodge–Tate theory, canonical subgroups, and automorphic period maps: T6

This part builds the finite-level logarithmic comparison package for canonical
Shimura coefficients. It constructs the analytic logarithmic sites, establishes
their primitive comparison, and builds logarithmic period sheaves and
Riemann–Hilbert functors. For representations of the full canonical quotient
Gᶜ, the associated étale and de Rham realizations then give a Hodge–Tate flag and
a Levi-torsor comparison with its central cyclotomic twist. The infinite-level
toroidal diamond and its Hodge–Tate map are supplied by
`PerfectoidShimuraVarieties:S6` (Boxer–Pilloni Theorem 4.4.40, p. 80).

The three stages are **planned** at target level. A complete planning pass is
recorded; supplier requests and precise mathematical gaps still prevent closure.
All declarations have implementation status `unchecked`. The packet and this
reader state the mathematical targets; the suggested Lean file supplies honest
component signatures and identifies the full signatures it cannot yet state.

## Conventions and construction route

A log structure is a monoid sheaf on the ordinary étale ringed site, with unit
fibre equal to the sheaf of units. Its characteristic is the quotient by that
unit fibre. Generic logification and pullback belong to
`CrystallineCohomology:CR.5:log-algebra`; that supplier must extend its current
scheme setting to arbitrary ringed sites. The analytic specialization starts
with the existing A1 étale-site interface. A chart has its structural image in
the specified plus sheaf. By contrast, the index in the Kummer étale criterion
is invertible in **O**, without requiring invertibility in **O⁺**. Fine and fs
are étale-local chart conditions. Saturated products use the fs category.

Normal crossings means étale locally a union of coordinate hyperplanes; global
components may self-intersect. A strict normal crossings hypothesis is imposed
only where a statement uses global smooth components. Continuous log
differentials represent derivations into complete Hausdorff topological
modules. Finiteness implies completeness in the natural topology under the
explicit noetherian-type hypotheses of the differential construction, rather
than for arbitrary complete Huber rings. For a coordinate boundary, residue
sends dlog T to 1 and dT to 0.

Kummer root covers retain their boundary points. A pro-Kummer cover is jointly
surjective on all underlying topological points and has the ordinal tower
conditions recorded below: a stage maps to the inverse limit of earlier stages
by a pulled-back Kummer étale map, and sufficiently late maps are finite
surjective. Log affinoid perfectoid presentations need an all-integer-divisible
chart limit; taking only p-power roots misses the prime-to-p divisibility.
Completed affinoids and their presentation diagrams are distinguished.

The primitive comparison is an almost isomorphism in the proper log-smooth
setting, over a characteristic-zero algebraically closed field of residue
characteristic p. The toric calculation needs a perfectoid base. Almost
acyclicity, exact acyclicity, local-system extension, and cohomological
finiteness each have separate hypotheses. The log-sites prefix takes no P8 or
CP.3 input. The decided ordinary primitive export is **after** P8:local-rational;
it is still proposed, so current prerequisites retain the reviewed P8 citation.

For Riemann–Hilbert, k is a complete discretely valued p-adic field with perfect
residue field, and K may be any perfectoid extension containing k∞ unless the
particular theorem requires the completion of an algebraic closure. Structural
periods include a further filtration completion after inverting t, even with
trivial logs. Residues are normalized in [0,1). Tensor equivalences require
unipotent geometric boundary monodromy; the ramified-pullback isomorphisms have
the stated multiplicity condition. Properness is required for every conclusion
of the proper period-cohomology comparison.

For canonical coefficients, put M = Ŵₚ⊗B⁺dR and
M⁰ = (WdR⊗OB⁺dR,log)^(∇=0) in their common BdR module. **Each lattice has its
own t-adic filtration**, FilʲL=tʲL. The second lattice is not filtered by
intersecting the Hodge filtration on the structural-period tensor product.
The ascending image filtration is
F₋ⱼ=image(M∩FilʲM⁰ → M/Fil¹M), with kernel Fil¹M∩FilʲM⁰.
For M⁰=tᵃM in rank one the jump is a; for the Tate line it is −1.
In the homological Siegel convention F₋₁=Lie(A)⊗Ô(1) and F₀=H₁(A,Qₚ)⊗Ô.
The graded relation is Grⱼ(Ŵₚ⊗Ô)(j)≃GrʲWdR⊗Ô, and the finite-level Levi
comparison is MHT≃MdR×^{µ,Zₚ×}Zₚ(1).

Representations of Gᶜ supply flat canonical local systems. An arbitrary Levi
representation supplies no such full-group realization. Special-point
normalization and arithmetic monodromy recognition establish the general
canonical comparison. In the Hodge-type compatibility statement V₀ is realized
by H₁, the dual of R¹f_*; irreducible representations are cut out of individual
tensor powers, and the general case follows by additivity.

## Sources and pinned library boundary

All mathematical descriptions below are in the roadmap’s own words. Locators use the printed page numbers of the identified public author copies; these equal their PDF page numbers. The historical independent review is retained in the packet. Its earlier reference to excerpts describes that review, not the citation format used here.

### DLLZ-adic: Logarithmic adic spaces: some foundational results

Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu. [Logarithmic adic spaces: some foundational results](https://www.kwlan.org/articles/log-adic.pdf). Public author copy, 100 pages; arXiv:1912.09836v2 final-version record (2022-10-30); published chapter DOI 10.1007/978-3-031-21550-6_3 (2022), text not served by publisher. Copy checked 2026-10-09.

SHA-256: `209e59836048eabbbf9735012a38c7c393fb2a30f69ce50ffac7e83b37ee1105`.

Target-relevant reading: §§2.1–2.3 (log structures, charts, analytic pairs, saturated products); §§3.1–3.3 (log smoothness and continuous differentials); §§4.1–4.4, 4.6 (Kummer covers, Abhyankar, descent, boundary extension); §§5.1, 5.3–5.4 (corrected pro-Kummer site and perfectoid basis); §§6.1–6.3 (toric cohomology, primitive comparison, local systems, monodromy).

### DLLZ-RH: Logarithmic Riemann–Hilbert correspondences for rigid varieties

Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu. [Logarithmic Riemann–Hilbert correspondences for rigid varieties](https://www.kwlan.org/articles/log-RH.pdf). Public author copy, 80 pages; J. Amer. Math. Soc. 36 (2023), DOI 10.1090/jams/1002; publisher access refused. Copy checked 2026-10-09.

SHA-256: `dccd18f6605380a92e6fa9e2143547b7cfa12ddb01b08ff5af0e083818539d04`.

Target-relevant reading: §§2.1–2.4 (period sheaves, local coordinates, Poincaré); §§3.1–3.6 (functors, decompletion inputs, residue normalization, tensor/pullback restrictions, proper comparison); §§5.2–5.6 (general canonical coefficients, special-point normalization, arithmetic monodromy recognition); Appendix A: A.1.2, A.1.6, A.1.9, A.1.10, A.2.1.2, A.2.2.3, A.2.3.4 (decompletion theorem statements and their application in §3.3).

### BP: Higher Coleman theory

George Boxer, Vincent Pilloni. [Higher Coleman theory](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf). Public author manuscript, 180 pages; §4.4.38 and Remark 4.4.39, pp. 79–80 (finite-level comparison); Theorem 4.4.40, p. 80 (ownership boundary). Copy checked 2026-10-09.

SHA-256: `d340c9a020cc5fdbca781a8630b6fae35e14607142bed700d6ab82334faa80ae`.

Target-relevant reading: §4.4.38 (General Shimura varieties), Remark 4.4.39 and the text following it up to Theorem 4.4.40, pp. 79–80; Theorem 4.4.40, p. 80: ownership boundary only; §4.4.8, p. 68 and §4.4.23, p. 74 (the cyclotomic twist); §4.0, p. 49 (the parabolics P_µ and P^std_µ); §4.6.1, p. 90 (boundary with PerfectoidShimuraVarieties S6).

The source issues below are scoped to these copies. The published DLLZ-adic chapter and DLLZ-RH journal text have not been collated; publisher metadata does not settle the recorded corrections.

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each baseline declaration and its surrounding assumptions were re-read at the pin.

| Existing declaration | What it supplies |
| --- | --- |
| `tauceti:TauCeti.Huber.Pair` | Huber pair with an explicit open integrally closed plus subring contained in the power-bounded subring. |
| `tauceti:TauCeti.Huber.Pair.Hom` | Continuous ring map respecting the specified plus subrings. |
| `tauceti:TauCeti.Huber.Pair.Hom.spaComap` | Contravariant continuous map on Spa attached to a pair homomorphism; only affinoid spectra, not a log adic site. |
| `mathlib:CategoryTheory.GrothendieckTopology` | Covering sieves with maximality, pullback stability and transitivity. |
| `mathlib:CategoryTheory.Sheaf` | Sheaves of objects of a category on a Grothendieck site, implemented by the full subcategory of presheaves satisfying the sheaf condition. |
| `mathlib:Derivation` | An R-linear derivation A→M with Leibniz rule; continuity is extra data in the analytic refinement. |
| `mathlib:AdicCompletion` | Inverse limit of M/IⁿM for an ideal I, including the completion ring when M is the ring. Not the Banach completed tensor product. |
| `mathlib:BDeRhamPlus` | Completion at ker θ after inverting p in Witt vectors of the pretilt of a p-adically complete ring; the declaration alone supplies no field, principal-kernel or sheaf theorem. |
| `mathlib:fontaineThetaInvertP` | Localized Fontaine map from p-inverted Witt vectors to R[1/p], under the prime, nonunit-p and p-adic-completeness hypotheses. |

data/library-coverage.json has no direct T6 record; neighbouring HodgeTate duplicate routes concern T0–T5 and do not constitute a T6 baseline proof. Affine Spa is built, not bundled log adic geometry. BDeRhamPlus is a carrier construction under explicit assumptions, not proof of principal kernel/DVR, acyclic period sheaf or logarithmic comparison. Generic log algebra is imported from CR.5 rather than planned twice.

## Layers and target index

| Stage | Coverage | Remaining closure |
| --- | --- | --- |
| `HodgeTateAndCanonicalSubgroups:T6:log-sites` | planned | Supplier closure: the R0 normalization request (with [Han20], [Lüt93], [Bar76]), the R3 request for étale descent of coherent modules (DLLZ-adic Proposition A.10), the CR.5:log-algebra request for topos-generic log structures, and the H0 request items. Add the stage edges from H0, R3, A4, P0, P1 and P3 listed in the dependency-line restructure entry. |
| `HodgeTateAndCanonicalSubgroups:T6:comparison` | planned | Adopt PadicHodgeTheory:P8:primitive and T6:log-primitive (FIX-RT-AREA-padic-1, finding /24) and replace the PadicHodgeTheory:P8 citations by P8:primitive nodes. Settle the owner of the Liu–Zhu ordinary Riemann–Hilbert package (PAPER-LIU-ZHU-17 route 8) and cite it from log-riemann-hilbert, arithmetic-log-de-rham, log-rh-pullback, unipotent-log-tensor and the canonical-coefficient nodes. Close the PerfectoidSpaces Part II decompletion, ALS.1 Part II rigidity and V8.general embedding requests, find an early owner for the CM special-point inputs, and the external inputs named in the gaps (Katz, André–Baldassarri, Kisin, Huber's comparison, log purity). |
| `HodgeTateAndCanonicalSubgroups:T6` | planned | Apply the narrowed finite-level texts of FIX-RT-AREA-padic-1 (finding /4) to T6, T6:comparison and the roadmap summary, and the dependency-line changes of the restructure entries. |

Prerequisites below distinguish existing library declarations, exact supplier nodes, local targets and supplier-stage requests. A request records missing mathematical content; its stage label is not evidence that a theorem is already available. The proposed primitive split is recorded under ownership and is not inserted as an existing prerequisite.

## Log adic geometry and continuous calculus

Integral charts turn generic log algebra into analytic geometry. Continuous differentials and residues then provide the calculus used by all later connections.

- [Log structures on an adic étale site](#log-adic-space)
- [Monoid-algebra log adic spaces](#toric-log-adic-space)
- [Integral charts and characteristic stalks](#integral-adic-chart)
- [Analytic normal-crossings log structures](#divisorial-analytic-log)
- [Saturated analytic log fibre products](#saturated-adic-products)
- [Analytic log smoothness and log étaleness](#log-smooth-chart-criterion)
- [Continuous analytic log derivations](#continuous-log-derivation)
- [Continuous log differential modules](#continuous-log-differentials)
- [Analytic log differentials and transitivity](#log-differential-descent)
- [Analytic log de Rham complexes and residues](#analytic-log-de-rham)

<a id="log-adic-space"></a>

### Log structures on an adic étale site

`HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space` · definition · proposed declaration `TauCeti.LogAdic.LogAdicData`.

Atlas planet: **Log adic spaces**.

Let X be an étale sheafy adic space. A pre-log structure on X is a sheaf M_X of commutative monoids on X_ét with a monoid map α:M_X→(O_{X_ét},·); morphisms of pre-log structures commute with the structure maps. It is a log structure, and (X,M_X,α) a log adic space, if α restricts to an isomorphism α⁻¹(O×_{X_ét})≃O×_{X_ét}. The log structure ᵃM associated with a pre-log structure is the pushout O×_{X_ét}←α⁻¹(O×_{X_ét})→M_X in sheaves of monoids, and logification is left adjoint to the inclusion of log structures into pre-log structures. The characteristic is M̄_X=M_X/α⁻¹(O×_{X_ét}); its geometric stalks are sharp. M_X is integral (resp. saturated) if it is a sheaf of integral (resp. saturated) monoids, equivalently if every geometric stalk is. A morphism (Y,M_Y,α_Y)→(X,M_X,α_X) is a morphism f:Y→X of adic spaces with a monoid-sheaf map f♯:f⁻¹M_X→M_Y compatible with f♯:f⁻¹O_{X_ét}→O_{Y_ét} and the structure maps. The pullback f*M_X is the log structure associated with f⁻¹M_X→f⁻¹O_{X_ét}→O_{Y_ét}; f is strict if f*M_X→M_Y is an isomorphism, equivalently if M̄_{X,f(ȳ)}→M̄_{Y,ȳ} is an isomorphism at every geometric point ȳ, and exact if, at every geometric point ȳ, the induced homomorphism (f*M_X)_ȳ→M_{Y,ȳ} is exact (for integral log structures, equivalently the induced map of characteristic stalks is exact). Properties of the underlying adic space or morphism (locally noetherian, affinoid, lft, proper, finite, …) are attributed to the log adic space or log morphism.

**Hypotheses and conventions.**

- X is étale sheafy (DLLZ Convention 2.2.1). The packet instantiates the étale site and structure sheaves of AdicEtaleGeometry A1, which are built for locally strongly sheafy analytic adic spaces (including locally noetherian analytic adic spaces and perfectoid spaces). DLLZ's non-analytic locally noetherian spaces, such as Spa(A,A) for a formal scheme in Proposition 2.2.22, are outside this specialisation.
- Coherent, fine and fs log adic spaces are defined through integral charts (integral-adic-chart, DLLZ Definition 2.3.5), not through finite generation of section monoids.

**Construction or proof route.**

1. Apply the CR.5 logification and pullback constructions to the étale ringed site (X_ét,O_{X_ét}) of A1; Remark 2.2.3 gives the adjunction.
2. Check the unit condition, sharpness of M̄ and integrality or saturation on geometric stalks (Lemma 2.2.4, Remark 2.2.5).
3. Compose morphisms through the canonical isomorphism (g∘f)*≅f*∘g* of logified pullbacks; the stalk criterion for strictness is Remark 2.2.6, using that f♯ is local on stalks and Lemma 2.1.5.

**Acceptance checks.**

- The trivial log structure is O_X×, not the one-element monoid when X has nontrivial units.
- Strictness is tested on f*M_X→M_Y, the logified pullback, not on f⁻¹M_X→M_Y.

**Planning API.**

- `TauCeti.LogAdic.LogAdicData` (constructor): Bundle the monoid sheaf, structural map and unit isomorphism over the imported étale ringed adic carrier.
- `TauCeti.LogAdic.LogAdicData.strict` (characterisation): f is strict exactly when the logified pullback map is an isomorphism.
- `TauCeti.LogAdic.LogAdicData.map_id` (functoriality): Identity inverse image induces the identity log morphism.
- `TauCeti.LogAdic.LogAdicData.map_comp` (functoriality): The composite log map is the composite of the inverse-image structural maps.
- `TauCeti.LogAdic.LogAdicData.associated` (universal-property): The log structure associated with a pre-log structure, with its canonical map from the pre-log structure; it is initial among maps to log structures over O_{X_ét} (Remark 2.2.3).
- `TauCeti.LogAdic.LogAdicData.pullback` (functoriality): f*M_X, the logification of f⁻¹M_X→f⁻¹O_{X_ét}→O_{Y_ét}, with canonical isomorphisms id*≅id and (g∘f)*≅f*∘g*.
- `TauCeti.LogAdic.LogAdicData.characteristic` (projection): The characteristic M̄_X=M_X/α⁻¹(O×_{X_ét}); its geometric stalks are sharp, and when M_X is integral M_{X,x̄}^gp/O×_{X_ét,x̄}≃M̄_{X,x̄}^gp (Remark 2.2.5).
- `TauCeti.LogAdic.LogAdicData.trivial` (example): The trivial log structure O×_{X_ét}→O_{X_ét} (Example 2.2.7); it is the pullback of the trivial log structure along any morphism.
- `TauCeti.LogAdic.LogAdicData.strict_iff_stalk` (characterisation): f is strict if and only if M̄_{X,f(ȳ)}→M̄_{Y,ȳ} is an isomorphism at every geometric point ȳ of Y (Remark 2.2.6).

**Discriminating unit tests.**

- `TauCeti.LogAdic.LogAdicData.trivial_units` (degenerate): For M=O_X× the unit comparison is the identity.
- `TauCeti.LogAdic.LogAdicData.unit_fiber` (characterisation): At every geometric stalk, each unit of O_X has a unique lift in α⁻¹(O_X×).
- `TauCeti.LogAdic.LogAdicData.not_terminal_monoid` (non-example): For Spa(Q_p,Z_p), the one-element monoid mapping to 1 is not a log structure because Q_p× has more than one element.

**Prerequisites.** `AdicEtaleGeometry:A1/etale-site`, `AdicEtaleGeometry:A1/etale-structure-sheaf`, `CrystallineCohomology:CR.5:log-algebra/log-structure`, `CrystallineCohomology:CR.5:log-algebra/associated-log`, `CrystallineCohomology:CR.5:log-algebra/log-pullback`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Convention 2.2.1, p. 7. States the étale-sheafiness convention behind the node; the packet further restricts to the analytic carriers of the A1 étale site, as recorded in the hypotheses.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 2.2.2(3), p. 8. Defines the unit condition α⁻¹(O×)≃O× that makes a pre-log structure a log structure; parts (1)-(2) and (4)-(6) of the same definition give pre-log structures, integrality/saturation, the characteristic and the associated log structure stated here.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 2.2.2(7)-(8), p. 8. Defines morphisms of log adic spaces, the pullback log structure f*M_X and strictness exactly as in the node; part (8) defines exactness of (f*M_X)_ȳ→M_{Y,ȳ} at geometric points.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Example 2.2.7 and Remark 2.2.6, p. 9. Example 2.2.7 identifies the trivial log structure as O×_{X_ét} with its inclusion (the node's degenerate test); Remark 2.2.6 on the same page gives the stalkwise criterion for strictness.

**Uses.**

- DLLZ-adic §4.1: Kummer maps are tested on log characteristic stalks.
- PrismaticCohomology:PR.8: Imports the analytic log-site geometry without a p-adic comparison.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="toric-log-adic-space"></a>

### Monoid-algebra log adic spaces

`HodgeTateAndCanonicalSubgroups:T6:log-sites/toric-log-adic-space` · construction · proposed declaration `TauCeti.LogAdic.MonoidAlgebraLog`.

For a Huber pair (R,R⁺) with ring of definition R₀ adic for a finitely generated ideal I and a monoid P, (R[P],R⁺[P]) with ring of definition R₀[P] and ideal of definition IR₀[P] is a Huber pair (Lemma 2.2.11); (R⟨P⟩,R⁺⟨P⟩) is its completion and Spa(R[P],R⁺[P])=Spa(R⟨P⟩,R⁺⟨P⟩) (Remark 2.2.12). If P is finitely generated and R is analytic and strongly noetherian, or finitely generated over a noetherian ring of definition, then so is R⟨P⟩, Spa(R⟨P⟩,R⁺⟨P⟩) is étale sheafy, and the formation of Spa(R⟨P⟩,R⁺⟨P⟩)→Spa(R,R⁺) is compatible with rational localisation (Lemma 2.2.13). When it is étale sheafy, Spa(R⟨P⟩,R⁺⟨P⟩) carries the log structure P^log associated with the constant pre-log structure P_X→O_{X_ét}, a↦e^a (Definition 2.2.17, Convention 2.2.18). For a locally noetherian adic space Y with trivial log structure and P finitely generated, gluing over noetherian affinoid opens gives a morphism of log adic spaces Y⟨P⟩→Y (Example 2.2.19); for P toric and Y=Spa(k,k⁺) this is an affinoid toric log adic space, and for P=ℕⁿ it is the unit polydisc Dⁿ with the log structure associated with (a₁,…,aₙ)↦T₁^{a₁}⋯Tₙ^{aₙ} (Examples 2.2.20-2.2.21).

**Hypotheses and conventions.**

- Lemma 2.2.13 needs P finitely generated and R analytic strongly noetherian or finitely generated over a noetherian ring of definition; the packet's carriers are the analytic case.
- The tautological map P→R⟨P⟩, a↦e^a, takes values in R⁺⟨P⟩, so it satisfies the integral-image condition of DLLZ charts.

**Construction or proof route.**

1. R⁺[P] is open and integrally closed in R[P]: reduce to finitely generated P and use the normality result cited by DLLZ ([BG09, Thm. 4.42]) (Lemma 2.2.11).
2. For finitely generated P, a surjection ℕʳ→P gives a continuous surjection R⟨T₁,…,T_r⟩→R⟨P⟩, so strong noetherianity, or a noetherian ring of definition, passes to R⟨P⟩; étale sheafiness is then the locally noetherian case (DLLZ Corollary A.11) (Lemma 2.2.13).
3. Define P^log by the CR.5 associated log structure on the étale site, and glue Y⟨P⟩ along rational localisations.

**Acceptance checks.**

- For P=ℕ over k, Spa(k⟨P⟩,k°⟨P⟩) is the closed unit disc with log structure generated by T, not the punctured disc with the trivial log structure.

**Planning API.**

- `TauCeti.LogAdic.MonoidAlgebraLog.huberPair` (constructor): (R[P],R⁺[P]) with ring of definition R₀[P] and ideal of definition IR₀[P] is a Huber pair, with completion (R⟨P⟩,R⁺⟨P⟩) (Lemma 2.2.11, Remark 2.2.12).
- `TauCeti.LogAdic.MonoidAlgebraLog.noetherian` (compatibility): For finitely generated P, R⟨P⟩ is analytic and strongly noetherian (resp. finitely generated over a noetherian ring of definition) when R is, and Spa(R⟨P⟩,R⁺⟨P⟩) is étale sheafy (Lemma 2.2.13).
- `TauCeti.LogAdic.MonoidAlgebraLog.logStructure` (constructor): The log structure P^log associated with P_X→O_{X_ét}, a↦e^a (Definition 2.2.17).
- `TauCeti.LogAdic.MonoidAlgebraLog.tautologicalChart` (projection): P→P^log(X), a↦e^a, with values in R⁺⟨P⟩; it is a chart of P^log.
- `TauCeti.LogAdic.MonoidAlgebraLog.relative` (constructor): Y⟨P⟩→Y for a locally noetherian Y with trivial log structure and finitely generated P, glued over noetherian affinoid opens (Example 2.2.19).
- `TauCeti.LogAdic.MonoidAlgebraLog.map` (functoriality): A monoid map u:P→Q induces Y⟨Q⟩→Y⟨P⟩ over Y, compatible with the tautological charts, with identity and composition laws.
- `TauCeti.LogAdic.MonoidAlgebraLog.rational_localization` (compatibility): The formation of Spa(R⟨P⟩,R⁺⟨P⟩)→Spa(R,R⁺) commutes with rational localisation of Spa(R,R⁺) (Lemma 2.2.13).
- `TauCeti.LogAdic.MonoidAlgebraLog.lift` (universal-property): For a log adic space X over Y, morphisms X→Y⟨P⟩ of log adic spaces over Y correspond to monoid maps P→M_X(X) whose composite with α lands in O⁺_{X_ét}(X) (Remarks 2.3.2-2.3.3).

**Discriminating unit tests.**

- `TauCeti.LogAdic.MonoidAlgebraLog.nat_polydisc` (computation): For P=ℕⁿ and (R,R⁺)=(k,k°), Spa(k⟨P⟩,k°⟨P⟩) is the unit polydisc Dⁿ and P^log is the log structure associated with (a₁,…,aₙ)↦T₁^{a₁}⋯Tₙ^{aₙ}.
- `TauCeti.LogAdic.MonoidAlgebraLog.int_circle` (degenerate): For P=ℤ, Spa(k⟨P⟩,k°⟨P⟩) is the circle |T|=1 and P^log is the trivial log structure, because the image of P consists of units.
- `TauCeti.LogAdic.MonoidAlgebraLog.zero_monoid` (degenerate): For P=0, Y⟨P⟩→Y is the identity of Y with the trivial log structure.
- `TauCeti.LogAdic.MonoidAlgebraLog.origin_nontrivial` (non-example): For P=ℕ, the point T=0 lies in Spa(k⟨ℕ⟩,k°⟨ℕ⟩) and has characteristic ℕ, so P^log is not trivial and Spa(k⟨ℕ⟩,k°⟨ℕ⟩) is not the punctured disc.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space](#log-adic-space), `CrystallineCohomology:CR.5:log-algebra/associated-log`, `tauceti:TauCeti.Huber.Pair`, `AdicSpacesPartII:R0/noetherian-type-huber-ring`, `AdicSpacesPartII:R0/topologically-finite-type-noetherian-type`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `AdicEtaleGeometry:A1/etale-structure-sheaf`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 2.2.11 and Remark 2.2.12, pp. 9-10. Gives the Huber pair (R[P],R⁺[P]) and, in Remark 2.2.12, its completion (R⟨P⟩,R⁺⟨P⟩), as in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 2.2.13, p. 10. Noetherianity, étale sheafiness and compatibility with rational localisation for finitely generated P, with the two cases on R kept in the hypotheses.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 2.2.17 and Convention 2.2.18, p. 11. Defines the log structure P^log on Spa(R⟨P⟩,R⁺⟨P⟩).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Examples 2.2.19-2.2.21, pp. 11-12. Constructs Y⟨P⟩→Y by gluing; Examples 2.2.20-2.2.21 give affinoid toric log adic spaces and the log polydisc Dⁿ.

**Uses.**

- DLLZ-adic Remarks 2.3.2-2.3.3: charts are strict morphisms to Spa(R⟨P⟩,R⁺⟨P⟩) or Y⟨P⟩
- DLLZ-adic Definition 3.1.1: log smoothness compares Y with X×_{X⟨P⟩}X⟨Q⟩
- DLLZ-adic Remark 2.3.26 and Definition 4.1.5: saturation X×_{Y⟨P⟩}Y⟨P^sat⟩ and root covers X×_{X⟨P⟩}X⟨(1/n)P⟩
- DLLZ-RH §2.1: smooth toric charts X→Dⁿ give the local coordinates of the period sheaves

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="integral-adic-chart"></a>

### Integral charts and characteristic stalks

`HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart` · definition · proposed declaration `TauCeti.LogAdic.IntegralChart`.

Let (X,M_X,α) be a log adic space and P a monoid with constant sheaf P_X on X_ét. A (global) chart of X modeled on P is a monoid-sheaf map θ:P_X→M_X such that α(θ(P_X))⊂O⁺_{X_ét} and the induced map ᵃP_X→M_X from the log structure associated with α∘θ is an isomorphism; it is finitely generated (fine, fs) when P is. Equivalently θ is a monoid map P→M_X(X) whose composite with α lands in O⁺_{X_ét}(X); when X lies over Spa(R,R⁺), P is finitely generated and Spa(R⟨P⟩,R⁺⟨P⟩) is étale sheafy (e.g. R strongly noetherian, toric-log-adic-space), this is a morphism X→Spa(R⟨P⟩,R⁺⟨P⟩) of log adic spaces, and θ is a chart exactly when that morphism is strict (Remarks 2.3.2-2.3.3). At each geometric point x̄, θ induces P/(α∘θ)⁻¹(O×_{X_ét,x̄})≃M̄_{X,x̄} (Remark 2.3.4), so P_X→M̄_X is surjective; a chart need not be sharp or equal to the characteristic monoid. X is coherent (fine, fs) if it étale locally admits charts modeled on finitely generated (fine, fs) monoids (Definition 2.3.5); a locally noetherian coherent X is fine (fs) exactly when it is integral (saturated) (Proposition 2.3.11). A chart of a morphism f:Y→X consists of charts θ_X:P_X→M_X, θ_Y:Q_Y→M_Y and u:P→Q with f♯∘f⁻¹(θ_X)=θ_Y∘u_Y (Definition 2.3.19); a fine (fs) log adic space admits, étale locally at x̄, a chart modeled on M̄_{X,x̄} (Proposition 2.3.13), and morphisms of fine (fs) log adic spaces étale locally admit fine (fs) charts (Proposition 2.3.22).

**Hypotheses and conventions.**

- The integral-image condition α(θ(P_X))⊂O⁺_{X_ét} is part of DLLZ's definition and has no counterpart for log schemes (CR.5 log-chart); it is stated against the plus sheaf of X.
- Proposition 2.3.11 needs X locally noetherian and coherent; Proposition 2.3.13 needs X fine; Propositions 2.3.21-2.3.22 need coherent, resp. fine or fs, source and target.

**Construction or proof route.**

1. Instantiate the CR.5 chart logification on the étale site of log-adic-space and add the factorisation of α∘θ through O⁺_{X_ét}.
2. Identify charts with strict morphisms to Spa(R⟨P⟩,R⁺⟨P⟩) or Y⟨P⟩ (toric-log-adic-space) by the universal property of the associated log structure (Remarks 2.3.2-2.3.3).
3. Compute the quotient by elements becoming units at each stalk via Lemma 2.1.5 and Remark 2.2.5 (Remark 2.3.4); Proposition 2.3.11 combines Lemma 2.3.7 (integral and saturated replacement charts, using that O⁺ is integrally closed) with Lemma 2.2.4.
4. For local and morphism charts use Lemma 2.3.6 (refining finitely generated charts while keeping O⁺-integrality) and the O⁺-adjusted splitting M̄_{X,x̄}→M_{X,x̄} of Lemma 2.3.12 (Propositions 2.3.13, 2.3.21-2.3.22).

**Acceptance checks.**

- On Spa(Q_p,Z_p), N→Q_p, 1↦p⁻¹, logifies to the trivial log structure but is not a chart, while 1↦p is a chart of the same log structure: the integral-image condition is checked against O⁺.

**Planning API.**

- `TauCeti.LogAdic.IntegralChart` (constructor): A monoid map P→M(U), its factorization through O⁺(U), and the associated-log isomorphism.
- `TauCeti.LogAdic.IntegralChart.mem_plus` (projection): Every structural image of a chart element belongs to the designated plus ring.
- `TauCeti.LogAdic.IntegralChart.characteristic` (compatibility): Its stalk characteristic is the quotient by the face of elements with unit structural image.
- `TauCeti.LogAdic.IntegralChart.pullback` (functoriality): Adic pullback gives the compatible integral chart on the pullback log structure.
- `TauCeti.LogAdic.IntegralChart.equivStrictToric` (characterisation): For finitely generated P and X over Spa(R,R⁺) with Spa(R⟨P⟩,R⁺⟨P⟩) étale sheafy, charts of X modeled on P correspond to strict morphisms X→Spa(R⟨P⟩,R⁺⟨P⟩) of log adic spaces (Remark 2.3.2); over a locally noetherian Y, to strict morphisms X→Y⟨P⟩ (Remark 2.3.3).
- `TauCeti.LogAdic.IsFsLogAdic` (characterisation): X is coherent, fine or fs when it étale locally admits charts modeled on finitely generated, fine or fs monoids (Definition 2.3.5); for locally noetherian coherent X, fine iff integral and fs iff saturated (Proposition 2.3.11).
- `TauCeti.LogAdic.IntegralChart.exists_characteristic` (other): A fine (fs) log adic space admits, étale locally at each geometric point x̄, a chart modeled on M̄_{X,x̄} (Proposition 2.3.13).
- `TauCeti.LogAdic.IntegralChart.Hom` (constructor): A chart of a morphism f: charts P_X→M_X and Q_Y→M_Y with u:P→Q making the square with f♯ commute (Definition 2.3.19); morphisms of fine (fs) log adic spaces admit such fine (fs) charts étale locally (Proposition 2.3.22).

**Discriminating unit tests.**

- `TauCeti.LogAdic.IntegralChart.unit_chart` (degenerate): A chart with all images units has zero characteristic.
- `TauCeti.LogAdic.IntegralChart.coordinate_axis` (computation): For the chart N→k⟨T⟩, 1↦T, the characteristic at T=0 is N and off T=0 is zero.
- `TauCeti.LogAdic.IntegralChart.reject_inverse_p` (non-example): For Spa(Q_p,Z_p), the prelog map N→Q_p, 1↦p⁻¹, fails the chart integral-image condition even though logification is trivial.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space](#log-adic-space), [HodgeTateAndCanonicalSubgroups:T6:log-sites/toric-log-adic-space](#toric-log-adic-space), `CrystallineCohomology:CR.5:log-algebra/log-chart`, `tauceti:TauCeti.Huber.Pair`, `AdicSpacesPartII:R0/locally-noetherian-adic-space`, `AdicSpacesPartII:R0/topologically-finite-type-noetherian-type`, `AdicSpacesPartII:R0/noetherian-type-stably-sheafy`, `CrystallineCohomology:CR.5:log-algebra`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 2.3.1, p. 13. Defines charts with the integral-image condition α(θ(P_X))⊂O⁺ and the logification isomorphism, as stated in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), §2.3 introduction, p. 12; Remarks 2.3.2-2.3.4, p. 13. Explains that DLLZ charts involve O⁺ as well as O; Remarks 2.3.2-2.3.4 on the next page give the strict-morphism description to Spa(R⟨P⟩,R⁺⟨P⟩) and the characteristic formula stated in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 2.3.5, p. 13. Defines coherent, fine and fs log adic spaces through charts, as in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 2.3.11, p. 15. States the equivalence of fine/fs with integral/saturated, with the locally noetherian coherent hypothesis kept in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 2.3.19, p. 17; Propositions 2.3.13 and 2.3.22, pp. 16-18. Defines charts of morphisms; Propositions 2.3.13 and 2.3.22 give the étale-local existence statements included in the node.

**Uses.**

- DLLZ-adic Proposition 3.1.4: Chart changes prove intrinsic log smoothness.
- DLLZ-RH §2.2: Integral monoid lifts define the structural period relations.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="divisorial-analytic-log"></a>

### Analytic normal-crossings log structures

`HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log` · construction · proposed declaration `TauCeti.LogAdic.DivisorialLog`.

Let X be a normal rigid analytic variety over a nonarchimedean field k, viewed as a locally noetherian adic space, D⊂X an effective Cartier divisor and j:U=X−D→X. Setting M_X(V)={f∈O_{X_ét}(V): f is invertible on the preimage of U}, that is M_X=O_{X_ét}∩j_*O×_{U_ét}, with α the inclusion, makes X a locally noetherian fs log adic space (normality is used for saturation), and U is the maximal open subspace on which M_X is trivial (Example 2.3.16). If X is smooth and D is a (reduced) normal crossings divisor, i.e. étale locally, equivalently analytic locally after a finite separable extension of k, (X,D)≅(S×D^m,S×{T₁⋯T_m=0}) with S smooth, then M_X is the pullback of the log structure of D^m (toric-log-adic-space), so étale locally ℕ^m→M_X, e_i↦T_i, is an fs chart whose images lie in O⁺, and at a geometric point lying on exactly s local branches M̄_{X,x̄}≅ℕ^s (Example 2.3.17). Étale locally X then admits a smooth toric chart X→Dⁿ, n=dim X, pulling {T₁⋯T_m=0} back to D, so X is log smooth over k (Example 3.1.13). For a smooth scheme with a strict normal crossings divisor, the same construction on the analytification (a smooth pair of AdicSpacesPartII R4) agrees with the logified pullback of the algebraic divisorial log structure, local algebraic equations being rescaled by constants of small absolute value where they are not power-bounded.

**Hypotheses and conventions.**

- X normal over any nonarchimedean field k for Example 2.3.16 (no characteristic assumption); X smooth and D a normal crossings divisor in DLLZ's étale-local sense for the chart statements (Example 2.3.17). A smooth pair of AdicSpacesPartII:R4/smooth-pair is the strict special case in which the charts exist analytic-locally over k itself.
- Chart functions must lie in O⁺ (integral-adic-chart): on S×D^m the coordinates T_i do; pulled-back algebraic equations may need rescaling by a constant, which changes neither M_X nor its characteristic.

**Construction or proof route.**

1. On an étale chart S×D^m, sections of O∩j_*O× are units times monomials in the T_i; this gives the log structure of D^m (Example 2.2.21) and saturation by normality (Examples 2.3.16-2.3.17).
2. The characteristic at a point on s branches is ℕ^s by Remark 2.3.4 applied to the chart ℕ^m→M_X.
3. Smooth toric charts: compose S→T^{n−m} (rational localisations and finite étale maps) with T^{n−m}×D^m⊂Dⁿ (Example 3.1.13); log smoothness then follows from log-smooth-chart-criterion.
4. For algebraic pairs, use AdicSpacesPartII:R4/analytification-of-smooth-pair and the CR.5 divisorial chart, rescaling the local equations into O⁺ before comparing charts.

**Acceptance checks.**

- The construction applies to toroidal compactifications only with the requisite smooth/normal crossings charts.
- U is exactly the locus where the log structure is trivial.

**Planning API.**

- `TauCeti.LogAdic.DivisorialLog` (constructor): The log structure O_X∩j_*O_U× associated to the specified boundary complement.
- `TauCeti.LogAdic.DivisorialLog.restrict_open` (compatibility): Restriction to U is the trivial log structure.
- `TauCeti.LogAdic.DivisorialLog.chart` (characterisation): Étale locally on a normal crossings chart S×D^m, ℕ^m→M_X, e_i↦T_i, is an fs chart with images in O⁺; the characteristic at a point on exactly s branches is ℕ^s.
- `TauCeti.LogAdic.DivisorialLog.analytification` (compatibility): For an algebraic smooth pair with strict normal crossings boundary, the logified pullback of the algebraic divisorial log structure to the analytification agrees with the analytic divisorial log structure; charts use local equations rescaled into O⁺.
- `TauCeti.LogAdic.DivisorialLog.trivial_locus` (characterisation): U=X−D is the maximal open subspace on which M_X is the trivial log structure (Example 2.3.16).
- `TauCeti.LogAdic.DivisorialLog.smoothToricChart` (compatibility): Étale locally X has a strictly étale X→Dⁿ, n=dim X, composed of rational localisations and finite étale maps, pulling {T₁⋯T_m=0} back to D (Example 3.1.13); hence X is log smooth over k.

**Discriminating unit tests.**

- `TauCeti.LogAdic.DivisorialLog.empty_boundary` (degenerate): If D is empty, M=O_X×.
- `TauCeti.LogAdic.DivisorialLog.double_intersection` (computation): At the crossing T₁=T₂=0, characteristic monoid is N², while at its generic branches it is N.
- `TauCeti.LogAdic.DivisorialLog.not_all_functions` (non-example): At a point of U, a function vanishing at that point is not a section of M; M is not all of O_X.
- `TauCeti.LogAdic.DivisorialLog.unscaled_equation` (non-example): On the closed unit disc over k with D={T=0} and c∈k with |c|>1, the map ℕ→M_X, 1↦cT, logifies to M_X but is not a chart because cT∉O⁺; the map 1↦T is a chart.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart](#integral-adic-chart), [HodgeTateAndCanonicalSubgroups:T6:log-sites/toric-log-adic-space](#toric-log-adic-space), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion](#log-smooth-chart-criterion), `CrystallineCohomology:CR.5:log-algebra/divisorial-log`, `AdicSpacesPartII:R4/smooth-pair`, `AdicSpacesPartII:R4/analytification-of-smooth-pair`, `AdicSpacesPartII:R1/analytification-functor`, `AdicSpacesPartII:R0/smooth-morphism`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Example 2.3.16, p. 16. Example 2.3.16 defines M_X(V) as functions invertible on the preimage of X−D on a normal rigid variety and asserts it is a locally noetherian fs log structure; the node keeps the normality hypothesis.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Example 2.3.17, pp. 16-17. Defines normal crossings divisors étale locally, which the node keeps rather than restricting to strict normal crossings.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Example 2.3.17, p. 17. States that the divisorial log structure is the pullback of the toric log structure of D^m, which gives the chart ℕ^m→M_X of the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Example 3.1.13, p. 25. Gives the smooth toric charts and log smoothness over k included in the node.

**Uses.**

- AutomorphicBundles:B3.general: The canonical extension uses the same boundary pair.
- DLLZ-RH §3.2: SNC boundary supplies residue coordinates for the functors.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="saturated-adic-products"></a>

### Saturated analytic log fibre products

`HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products` · construction · proposed declaration `TauCeti.LogAdic.FsAdicPullback`.

(1) The inclusion of locally noetherian (resp. noetherian) fine log adic spaces into coherent ones has a right adjoint X↦X^int whose underlying map X^int→X is a closed immersion, and the inclusion of fs into fine ones has a right adjoint X↦X^sat whose underlying map is finite and surjective; X^sat:=(X^int)^sat is right adjoint to the inclusion of fs into coherent log adic spaces (Proposition 2.3.23, Remark 2.3.24). Both functors preserve strict finite and strict étale morphisms, and for X over a locally noetherian fs Y with a global chart modeled on a finitely generated (fine) P, X^int≅X×_{Y⟨P⟩}Y⟨P^int⟩ (X^sat≅X×_{Y⟨P⟩}Y⟨P^sat⟩) (Remarks 2.3.25-2.3.26). (2) If the fibre product W=Y×_X Z of the underlying locally noetherian adic spaces exists (for instance when Y→X is lft), W with the log structure associated with pr_Y⁻¹M_Y⊕_{pr_X⁻¹M_X}pr_Z⁻¹M_Z is the fibre product of log adic spaces, coherent when X, Y, Z are; the fine and fs fibre products are W^int and W^sat, modeled on (Q⊕_P R)^int and (Q⊕_P R)^sat for charts P→Q, P→R (Proposition 2.3.27, Remark 2.3.29). Their underlying adic spaces can differ from W (Remark 2.3.30); fibre products of fs log adic spaces are taken in the fs category (Convention 2.3.31). (3) Four-point lemma: if f:Y→X and g:Z→X are lft morphisms of locally noetherian fs log adic spaces and f is exact, then for y∈Y and z∈Z over the same x∈X some w∈Y×_X Z maps to y and to z (Proposition 2.3.32, via Lemma 2.3.33).

**Hypotheses and conventions.**

- Locally noetherian carriers throughout; integralisation is defined on coherent, saturation on fine log adic spaces.
- Fibre products exist only when the underlying adic fibre product exists (e.g. one map lft); the four-point lemma needs both maps lft and f exact.

**Construction or proof route.**

1. Affinoid case with a global chart P: X^?=Spa(R⊗_{ℤ[P]}ℤ[P^?], integral closure of R⁺⊗_{ℤ[P]}ℤ[P^?]); ℤ[P^?] is finite over ℤ[P], giving a closed immersion (int) or a finite surjection (sat), and the adjunction follows from Proposition 2.3.11 (Proposition 2.3.23).
2. Glue the local constructions by étale descent of coherent sheaves and finite morphisms (DLLZ Proposition A.10); functoriality uses Proposition 2.3.22.
3. Fibre products: logify the pushout of the pulled-back log structures; coherence via charts P→Q, P→R from Proposition 2.3.21 and S=Q⊕_P R; the fine and fs cases apply (1) (Proposition 2.3.27).
4. Four-point lemma: reduce to geometric points by Huber Lemma 1.1.10; with P=M̄_x, Q=M̄_y, R=M̄_z, exactness of u and sharpness of R make S=Q⊕_P R quasi-integral (Nakayama Lemma 2.2.6), so the kernel of l⟨S⟩→l⟨S^sat⟩ lies in the ideal generated by the nonzero monomials and W is nonempty (Lemma 2.3.33).

**Acceptance checks.**

- Keep the fs universal property separate from any claim about ordinary adic product points.
- The fs self-product of a Kummer root cover is computed through the saturated pushout, not the ordinary product.

**Planning API.**

- `TauCeti.LogAdic.FsAdicPullback` (constructor): The analytic fs fibre product, with projections and compatibility over the base.
- `TauCeti.LogAdic.FsAdicPullback.lift` (universal-property): Compatible fs log maps have a unique map to the fs pullback.
- `TauCeti.LogAdic.FsAdicPullback.strict_base_change` (compatibility): Under strict base change the induced log structure is the ordinary pullback structure.
- `TauCeti.LogAdic.FsAdicPullback.symmetry` (equivalence): Interchanging factors gives the canonical involutive isomorphism.
- `TauCeti.LogAdic.FsAdicPullback.integralization` (universal-property): X↦X^int is right adjoint to the inclusion of locally noetherian fine into coherent log adic spaces, with X^int→X a closed immersion (Proposition 2.3.23(1)).
- `TauCeti.LogAdic.FsAdicPullback.saturation` (universal-property): X↦X^sat is right adjoint to the inclusion of locally noetherian fs into fine (and, via (X^int)^sat, coherent) log adic spaces, with X^sat→X finite and surjective (Proposition 2.3.23(2), Remark 2.3.24).
- `TauCeti.LogAdic.FsAdicPullback.chart` (compatibility): For fs charts P→Q, P→R of Y→X, Z→X, the fs product is modeled on (Q⊕_P R)^sat (Remark 2.3.29); separately, for a locally noetherian W over a locally noetherian fs T with a global chart modeled on a fine P, W^sat≅W×_{T⟨P⟩}T⟨P^sat⟩ as adic spaces (Remark 2.3.26).
- `TauCeti.LogAdic.FsAdicPullback.exists_point_of_exact` (relation): For lft f, g with f exact, points y, z over a common x lift to a point of the fs product (Proposition 2.3.32).

**Discriminating unit tests.**

- `TauCeti.LogAdic.FsAdicPullback.identity` (degenerate): Y×_X X≃Y as fs log adic spaces.
- `TauCeti.LogAdic.FsAdicPullback.root_double` (computation): For X the closed unit disc over k with chart ℕ (1↦T), Y=Spa(k⟨U⟩) with Uⁿ=T and chart ℕ→ℕ multiplication by n, where n is invertible in k and μ_n⊂k: (ℕ⊕_ℕℕ)^sat≅ℕ⊕ℤ/n, so the fs product Y×_X Y is the disjoint union over ζ∈μ_n of copies of Y (V=ζU), whereas the ordinary product Spa(k⟨U,V⟩/(Uⁿ−Vⁿ)) is connected.
- `TauCeti.LogAdic.FsAdicPullback.mapping_property` (characterisation): Two morphisms from an fs test space coincide if their two projection maps coincide.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart](#integral-adic-chart), [HodgeTateAndCanonicalSubgroups:T6:log-sites/toric-log-adic-space](#toric-log-adic-space), `CrystallineCohomology:CR.5:log-algebra/integral-log-fiber-product`, `CrystallineCohomology:CR.5:log-algebra/saturated-monoid`, `AdicSpacesPartII:R0/fibre-products-existence`, `AdicSpacesPartII:R0/fibre-product-points`, `AdicSpacesPartII:R0/finite-morphism`, `AdicSpacesPartII:R3`, `AdicSpacesPartII:R0/closed-adic-subspaces-and-embeddings`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 2.3.23(1)-(2), p. 18. States saturation as a right adjoint with finite surjective underlying map; part (1) gives integralisation with a closed immersion, both as in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 2.3.27(2), p. 19. Gives the existence condition kept in the node; part (1) and the proof give the coherent product and its chart model.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Remark 2.3.30, p. 20. States that the fine and fs fibre products can have a different underlying adic space, as in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 2.3.32 and Lemma 2.3.33, p. 20. The four-point lemma for lft morphisms of locally noetherian fs log adic spaces with f exact; Lemma 2.3.33 is its geometric-point case.

**Uses.**

- DLLZ-adic §4.1: Kummer root covers are stable under fs base change.
- DLLZ-adic §5.3: Products of log perfectoid objects use these finite-level products.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="log-smooth-chart-criterion"></a>

### Analytic log smoothness and log étaleness

`HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion` · theorem · proposed declaration `TauCeti.LogAdic.log_smooth_chart_criterion`.

Atlas planet: **Log smooth chart criterion**.

Let f:Y→X be a morphism of locally noetherian fs log adic spaces. f is log smooth (resp. log étale) if étale locally on Y and X it has an fs chart u:P→Q such that ker(u^gp) and the torsion part of coker(u^gp) (resp. ker(u^gp) and coker(u^gp)) are finite of order invertible in O_X, and the induced morphism Y→X×_{X⟨P⟩}X⟨Q⟩ is étale on underlying adic spaces (Definition 3.1.1); such f is lft, so fs fibre products along it exist (Remark 3.1.2). If X has a global fs chart P, then étale locally on Y and X, f has an injective fs chart P→Q satisfying these conditions, with Q torsion-free when P is (Proposition 3.1.4). Log smooth (log étale) morphisms are stable under fs base change by arbitrary morphisms of locally noetherian fs log adic spaces and under composition (Propositions 3.1.3, 3.1.6), and a strict log smooth (log étale) morphism is smooth (étale) on underlying adic spaces (Proposition 3.1.7). If X is log smooth over an affinoid field Spa(k,k⁺) with trivial log structure, then étale locally X has a toric chart, a strictly étale X→Spa(k⟨P⟩,k⁺⟨P⟩) with P a sharp fs monoid that is a composition of rational localisations and finite étale maps; if moreover X is smooth one may take P=ℕⁿ, a smooth toric chart X→Dⁿ (Proposition 3.1.10, Corollary 3.1.11, Definition 3.1.12).

**Hypotheses and conventions.**

- The index is invertible in O_X, not necessarily O_X⁺. Log smoothness does not imply ordinary smoothness without strictness.
- Toric charts need X log smooth over an affinoid field with the trivial log structure on the base.

**Construction or proof route.**

1. Base change: by Proposition 2.3.22 the base change Z→X has an fs chart P→R; Z×_X Y is modeled on (R⊕_P Q)^sat, whose group cokernel over R^gp is that of u^gp, and the comparison map is a base change of Y→X×_{X⟨P⟩}X⟨Q⟩ (Remarks 2.3.25-2.3.29; Proposition 3.1.3).
2. Chart change (Proposition 3.1.4): refine charts by Lemma 2.3.6, make P₁→Q₁ injective through a cartesian diagram of groups, and extract n-th roots of units (n invertible in O_X) to lift the group extension; finite group corrections are étale by Huber Proposition 1.7.1; for torsion-free P adjoin roots of torsion units by a finite étale cover (after Nakayama).
3. Composition follows from Definition 3.1.1 and Proposition 3.1.4 (Proposition 3.1.6).
4. Strict case: with P=M̄_{X,f(ȳ)}, write coker(u^gp)=K_tor⊕ℤʳ, replace Q by u(P)⊕K_tor⊕ℕʳ, and use that X⟨K_tor⟩×_X X⟨ℕʳ⟩ is smooth, and étale when r=0, by Huber Corollary 1.6.10 and Proposition 1.7.1 (Proposition 3.1.7).
5. Toric charts: from Proposition 3.1.4 take Q torsion-free, split Q≅Q̄⊕ℤʳ and localise; in the smooth case regularity of κ(z)[[Q̄_F]] forces Q̄_F≅ℕˢ (Proposition 3.1.10, Corollary 3.1.11).

**Acceptance checks.**

- Toric singularities are valid log smooth examples.
- In characteristic zero, p-th coordinate roots are log étale although p is not a unit of O⁺.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products](#saturated-adic-products), [HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart](#integral-adic-chart), [HodgeTateAndCanonicalSubgroups:T6:log-sites/toric-log-adic-space](#toric-log-adic-space), `CrystallineCohomology:CR.5:log-algebra/log-smooth-chart-criterion`, `AdicEtaleGeometry:A1/etale-site`, `AdicSpacesPartII:R0/smooth-morphism`, `AdicSpacesPartII:R0/differentials-unramified-smooth-etale`, `AdicSpacesPartII:R0/restricted-power-series-smooth`, `AdicSpacesPartII:R0/smooth-etale-base-change`, `AdicSpacesPartII:R0/etale-smooth-composition`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 3.1.1 and Remark 3.1.2, p. 21. Defines log smoothness and log étaleness by fs charts with this group condition and étaleness of Y→X×_{X⟨P⟩}X⟨Q⟩, with invertibility in O_X as kept in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Propositions 3.1.3 and 3.1.6, pp. 21-23. States stability under fs base change; Proposition 3.1.6 gives stability under composition.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.1.4, pp. 21-23. Gives injective (and torsion-free when P is) charts over a given fs chart of the base, as stated in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.1.7, p. 24. The strict case stated in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.1.10, Corollary 3.1.11 and Definition 3.1.12, pp. 24-25. Existence of toric charts for log smooth X over an affinoid field; Corollary 3.1.11 gives smooth toric charts X→Dⁿ when X is smooth.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="continuous-log-derivation"></a>

### Continuous analytic log derivations

`HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-derivation` · definition · proposed declaration `TauCeti.LogAdic.ContinuousLogDerivation`.

A pre-log Huber ring (A,M,α) is a Huber ring A (not necessarily complete), a monoid M and a monoid map α:M→(A,·); it is a log Huber ring if A is complete and α⁻¹(A×)→A× is an isomorphism; a homomorphism (A,M,α)→(B,N,β) is a continuous ring map f with a monoid map f♯:M→N such that β∘f♯=f∘α (Definition 3.2.1). For such a homomorphism and a complete topological B-module L, an (A,M,α)-derivation of (B,N,β) into L is a pair (d,δ): d:B→L is a continuous A-linear derivation and δ:N→(L,+) is a monoid map with δ(f♯(m))=0 and d(β(n))=β(n)·δ(n) for all m∈M, n∈N (Definition 3.2.2). These form a B-module Der^log_A(B,L); for trivial log structures M=α⁻¹(A×), N=β⁻¹(B×) it is the module Der_A(B,L) of continuous A-derivations. Each pair extends to (B,ᵃN,β) without changing Der^log_A(B,L), and δ extends uniquely to a group map (ᵃN)^gp→L (Remark 3.2.3).

**Hypotheses and conventions.**

- L is complete. The packet's carriers take L complete and Hausdorff, which loses nothing because the representing module of continuous-log-differentials is Hausdorff; continuous derivations are not replaced by algebraic derivations.

**Construction or proof route.**

1. Refine Mathlib Derivation by continuity and the compatible monoid map.
2. Extend δ across logification using δ(u)=u⁻¹d(u) on units.
3. Use the group completion universal property for δ^gp.
4. For trivial log structures δ is forced by δ(n)=β(n)⁻¹d(β(n)), giving Der^log_A(B,L)=Der_A(B,L).

**Acceptance checks.**

- On a coordinate chart, δ(T) is dlog T even at T=0.

**Planning API.**

- `TauCeti.LogAdic.ContinuousLogDerivation` (constructor): Bundle a continuous derivation and monoid-to-additive map satisfying the relative-zero and compatibility equations.
- `TauCeti.LogAdic.ContinuousLogDerivation.ext` (extensionality): Equality of d and δ gives equality of the log derivation.
- `TauCeti.LogAdic.ContinuousLogDerivation.map_structural` (relation): d(βn)=βn·δ(n).
- `TauCeti.LogAdic.ContinuousLogDerivation.postcompose` (functoriality): A continuous B-linear map L→L′ induces a log derivation to L′; identity and composite maps agree.
- `TauCeti.LogAdic.ContinuousLogDerivation.instModule` (instance): Der^log_A(B,L) is a B-module, with operations computed componentwise on d and δ (Definition 3.2.2).
- `TauCeti.LogAdic.ContinuousLogDerivation.toDerivation` (projection): (d,δ)↦d, the forgetful B-linear map to continuous A-derivations; it is bijective when M=α⁻¹(A×) and N=β⁻¹(B×).
- `TauCeti.LogAdic.ContinuousLogDerivation.deltaGp` (projection): The unique group map (ᵃN)^gp→L extending δ, which vanishes on the image of M^gp (Remark 3.2.3).
- `TauCeti.LogAdic.ContinuousLogDerivation.logificationEquiv` (equivalence): Der^log_A(B,L) is unchanged when (B,N,β) is replaced by its logification (B,ᵃN,β) (Remark 3.2.3).

**Discriminating unit tests.**

- `TauCeti.LogAdic.ContinuousLogDerivation.zero` (degenerate): The pair of zero maps is a continuous log derivation.
- `TauCeti.LogAdic.ContinuousLogDerivation.unit_formula` (computation): For a unit β(n), δ(n)=β(n)⁻¹d(β(n)).
- `TauCeti.LogAdic.ContinuousLogDerivation.boundary_value` (non-example): For B=k⟨T⟩ with N=ℕ, β(1)=T, over k with the pre-log structure given by the zero monoid M=0 (whose logification is the trivial log structure; with M=k× no compatible f♯:k×→ℕ exists): into L=B, d=T·d/dT gives d(T)=T and forces δ(1)=1; into L=B/(T)=k, the pair d=0, δ(1)=1 is a log derivation, so d(T)=0 at T=0 does not force δ(1)=0 and δ is not determined by d.
- `TauCeti.LogAdic.ContinuousLogDerivation.trivial_log` (characterisation): If M=α⁻¹(A×) and N=β⁻¹(B×), every continuous A-derivation d:B→L extends uniquely to a log derivation, by δ(n)=β(n)⁻¹d(β(n)).

**Prerequisites.** `CrystallineCohomology:CR.5:log-algebra/prelog-ring`, `CrystallineCohomology:CR.5:log-algebra/associated-log`, `mathlib:Derivation`, `tauceti:TauCeti.Huber.Pair`, `AdicSpacesPartII:R0/continuous-differentials`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 3.2.1, p. 26. Defines pre-log Huber rings; parts (2)-(4) give log Huber rings, associated log Huber rings and homomorphisms as stated in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 3.2.2, p. 26. Defines the pair (d,δ) with δ(f♯m)=0 and d(βn)=β(n)δ(n), its B-module Der^log_A(B,L) and the trivial-log case; the node adds Hausdorffness of L as a packet convention.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Remark 3.2.3, p. 26. Invariance under logification and the extension δ^gp stated in the node.

**Uses.**

- DLLZ-adic Proposition 3.2.9: The analytic log differential module represents these pairs.
- DLLZ-RH (2.2.14): Defines the structural period connection on monoid generators.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="continuous-log-differentials"></a>

### Continuous log differential modules

`HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-differentials` · construction · proposed declaration `TauCeti.LogAdic.ContinuousLogDifferentials`.

Let f:(A,M,α)→(B,N,β) be a tft homomorphism of pre-log Huber rings: A and B complete, A→B topologically of finite type, and N^gp/((f♯M)^gp·β⁻¹(B×)) finitely generated (Definition 3.2.4). Let I⊂(B⊗̂_A B)[N] be the ideal generated by e^{f♯(m)}−1 and (β(n)⊗1)−(1⊗β(n))e^n, J the kernel of ((B⊗̂_A B)[N])/I→B (b₁⊗b₂↦b₁b₂, e^n↦1), and Ω^log_{B/A}:=J/J² with d(b)=class of b⊗1−1⊗b and δ(n)=class of e^n−1. Then Ω^log_{B/A}≅(Ω_{B/A}⊕(B⊗_ℤN^gp))/R, where Ω_{B/A} is the module of continuous differentials and R is generated by (dβ(n),−β(n)⊗n) and (0,1⊗f♯(m)) ((3.2.7)-(3.2.8)); it is a finite B-module, complete for its natural topology, d is continuous, and (Ω^log_{B/A},d,δ) is universal among (A,M,α)-derivations of (B,N,β) into complete topological B-modules (Proposition 3.2.9). For a strict homomorphism of log Huber rings, Der^log_A(B,L)→Der_A(B,L) is bijective and Ω_{B/A}≅Ω^log_{B/A} (Lemma 3.2.10).

**Hypotheses and conventions.**

- f is tft, including the finite generation of N^gp/((f♯M)^gp·β⁻¹(B×)); the unrestricted algebraic Kähler module is not the analytic carrier.
- A is of noetherian type (Huber's standing assumption (1.1.1)), as presupposed by DLLZ's use of Huber's continuous differentials (1.6.2) and needed for finite B-modules to be complete; all DLLZ applications are locally noetherian.

**Construction or proof route.**

1. Build Ω^log as J/J² from the completed tensor product and the monoid algebra; d is an A-linear derivation and δ a monoid map with the relations of Definition 3.2.2.
2. Identify J/J² with the presentation (3.2.7)-(3.2.8) over the imported continuous Ω_{B/A}; finiteness gives completeness and continuity of d.
3. Universal property: a derivation (d,δ) into L gives (B⊗̂_A B)[N]/I→B∗L, b₁⊗b₂↦(b₁b₂,b₁d(b₂)), e^n↦(1,δ(n)), hence J/J²→L (Proposition 3.2.9).
4. Strict case: every n∈N is a unit times f♯(m), so δ is determined by d (Lemma 3.2.10).

**Acceptance checks.**

- Its rank on a log toric n-disc is n, including along the boundary.

**Planning API.**

- `TauCeti.LogAdic.ContinuousLogDifferentials` (constructor): The complete representing module with d and dlog.
- `TauCeti.LogAdic.ContinuousLogDifferentials.lift` (universal-property): Continuous B-linear maps out correspond bijectively to continuous log derivations.
- `TauCeti.LogAdic.ContinuousLogDifferentials.lift_unique` (extensionality): A map is determined by values on d(b) and dlog(n).
- `TauCeti.LogAdic.ContinuousLogDifferentials.strict` (compatibility): For a strict map the module identifies with the imported continuous Ω¹_{B/A}.
- `TauCeti.LogAdic.ContinuousLogDifferentials.presentation` (characterisation): Ω^log_{B/A}≅(Ω_{B/A}⊕(B⊗_ℤN^gp))/R with R generated by (dβ(n),−β(n)⊗n) and (0,1⊗f♯(m)) ((3.2.7)-(3.2.8)).
- `TauCeti.LogAdic.ContinuousLogDifferentials.finite` (instance): Ω^log_{B/A} is a finite B-module, complete and Hausdorff for its natural topology, and d is continuous.
- `TauCeti.LogAdic.ContinuousLogDifferentials.dlog_unit` (simp): If β(n) is a unit then δ(n)=β(n)⁻¹·d(β(n)); δ(f♯(m))=0.
- `TauCeti.LogAdic.ContinuousLogDifferentials.exact_sequence` (relation): For tft (A,M)→(B,N)→(C,O), C⊗_BΩ^log_{B/A}→Ω^log_{C/A}→Ω^log_{C/B}→0 is exact; it is split exact on the left when B→C is formally log smooth for first-order log thickenings, Ω^log_{C/B}=0 when B→C is formally log unramified, and the converses hold when C is formally log smooth over A (Theorem 3.2.18, Definitions 3.2.11 and 3.2.14).
- `TauCeti.LogAdic.ContinuousLogDifferentials.monoidAlgebra` (example): For fine monoids u:P→Q with ker(u^gp) and the torsion of coker(u^gp) (resp. coker(u^gp)) finite of order invertible in R, R⟨Q⟩ is formally log smooth (resp. log étale) over R⟨P⟩ and δ induces Ω^log_{R⟨Q⟩/R⟨P⟩}≅R⟨Q⟩⊗_ℤ(Q^gp/u^gp(P^gp)), a finite free R⟨Q⟩-module because the torsion of the cokernel has order invertible in R (Proposition 3.2.25).

**Discriminating unit tests.**

- `TauCeti.LogAdic.ContinuousLogDifferentials.identity` (degenerate): For the identity log Huber map the module is zero.
- `TauCeti.LogAdic.ContinuousLogDifferentials.toric_rank` (computation): Over k, Ω¹_log of k⟨T₁,…,T_r⟩ with coordinate log structure is free on dlog T_i.
- `TauCeti.LogAdic.ContinuousLogDifferentials.coordinate_relation` (characterisation): In that module dT_i=T_i dlog T_i; imposing dlog T_i=0 at T_i=0 is incorrect.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-derivation](#continuous-log-derivation), `CrystallineCohomology:CR.5/log-differentials`, `AdicSpacesPartII:R0/continuous-differentials`, `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R0/first-fundamental-sequence`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 3.2.4, p. 26. Defines tft homomorphisms of pre-log Huber rings, including the finite generation condition on N^gp kept in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), (3.2.7)-(3.2.8), p. 27. Gives the presentation of Ω^log_{B/A} over Huber's continuous differentials stated in the node; the following sentence deduces finiteness and completeness.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.2.9, p. 27. States the universal property among derivations into complete topological B-modules.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 3.2.10, p. 28. The strict comparison Ω_{B/A}≅Ω^log_{B/A} stated in the node.

**Uses.**

- DLLZ-adic Construction 3.3.4: Descent glues the affine module.
- DLLZ-RH Corollary 2.4.2: The log de Rham complex uses the locally free module.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="log-differential-descent"></a>

### Analytic log differentials and transitivity

`HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent` · theorem · proposed declaration `TauCeti.LogAdic.log_differential_descent`.

For an lft morphism f:Y→X of locally noetherian coherent log adic spaces, the modules Ω^log_{B/A} of étale affinoid charts of f by noetherian affinoids inducing tft maps of log Huber rings glue, by étale descent of coherent sheaves, to a coherent O_{Y_ét}-module Ω^log_{Y/X} with a derivation (d_{Y/X},δ_{Y/X}), δ_{Y/X}:M_Y→Ω^log_{Y/X}, that is universal among derivations of Y over X into sheaves of complete topological O_{Y_ét}-modules and restricts to Ω^log_{V/U} on affinoid V→U in Y_ét, X_ét (Constructions 3.3.2-3.3.4, Lemmas 3.3.3 and 3.3.5). (1) For a cartesian square in the category of locally noetherian coherent (resp. fine, resp. fs) log adic spaces with Y→X lft and base change Y′→X′, the pullback of Ω^log_{Y/X} to Y′ is Ω^log_{Y′/X′} (Proposition 3.3.7). (2) For lft Y→X→S of locally noetherian coherent log adic spaces, f*Ω^log_{X/S}→Ω^log_{Y/S}→Ω^log_{Y/X}→0 is exact (Theorem 3.3.17(1)). (3) For f log smooth between locally noetherian fs log adic spaces, f*Ω^log_{X/S}→Ω^log_{Y/S} is injective and Ω^log_{Y/X} is locally free of rank equal to the rank of Q^gp/u^gp(P^gp) for a chart u as in Definition 3.1.1; for f log étale, f*Ω^log_{X/S}≅Ω^log_{Y/S} and Ω^log_{Y/X}=0; if X, Y, S are fs and g∘f is log smooth, the converses hold; if g is log étale, Ω^log_{Y/S}≅Ω^log_{Y/X} and f is log smooth (log étale) iff g∘f is (Theorem 3.3.17(2)-(5)). (4) An lft morphism of locally noetherian fs log adic spaces is formally log smooth (formally log étale), i.e. has étale-locally at least one (exactly one) lift along strict first-order log thickenings (Definitions 3.3.8, 3.3.10), exactly when it is log smooth (log étale) in the chart sense (Proposition 3.3.16).

**Hypotheses and conventions.**

- Ω^log_{Y/X} is defined for lft morphisms of locally noetherian coherent log adic spaces; parts (3)-(4) need fs log adic spaces, and fs products and pullbacks are the fs fibre products of saturated-adic-products.
- The injection in (3) is not asserted split as a map of sheaves; DLLZ prove splitting at the ring level (Theorem 3.2.18(2)), and local splitting follows from local freeness of Ω^log_{Y/X}.

**Construction or proof route.**

1. Affinoid construction: Theorem 3.2.18 identifies Ω^log_{C/A} with C⊗_BΩ^log_{B/A} on each Spa(C,C⁺)∈Y_ét, giving a coherent sheaf with a universal derivation (Construction 3.3.2, Lemma 3.3.3); glue over finitely indexed étale affinoid coverings {X_i→X}, {Y_i→Y} from Proposition 2.3.21 by étale descent of coherent sheaves (DLLZ Proposition A.10; Construction 3.3.4, Lemma 3.3.5).
2. Base change: compare Der^log for B′=B⊗̂_A A′ (resp. its integral or saturated modification) using Remark 3.2.3 and the arguments of Ogus IV.1.1.3 and IV.1.1.9, with (Q′)^gp=((Q′)^int)^gp=((Q′)^sat)^gp (Proposition 3.3.7).
3. Transitivity, injectivity and vanishing: globalise Theorem 3.2.18(1)-(5) and use the toric computation of Proposition 3.2.25 with Proposition 3.3.7 (Theorem 3.3.17).
4. Formal versus chart log smoothness: chart log smooth maps are formally log smooth by Proposition 3.2.25 and Remark 3.3.13; conversely Lemma 3.3.15 (local freeness for formally log smooth maps) yields an fs chart from elements t_i with δ(t_i) a basis, and Lemma 3.3.14 makes the strict comparison map étale (Proposition 3.3.16).

**Acceptance checks.**

- A strict étale pullback preserves Ω¹_log.
- A Kummer étale coordinate root has relative Ω¹_log=0 after its index is invertible.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-differentials](#continuous-log-differentials), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion](#log-smooth-chart-criterion), [HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products](#saturated-adic-products), `AdicSpacesPartII:R3/coherent-sheaf`, `AdicSpacesPartII:R3/coherent-sheaf-operations`, `AdicSpacesPartII:R3/sheaf-of-continuous-differentials`, `AdicSpacesPartII:R3`, `AdicSpacesPartII:R3/tate-kiehl-affinoid`, `AdicSpacesPartII:R3/locally-free-sheaf`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Constructions 3.3.2-3.3.4 and Lemma 3.3.5, pp. 34-35. Construction 3.3.4 glues the affinoid log differentials by étale descent; Lemma 3.3.5 extends the definition to lft morphisms of locally noetherian coherent log adic spaces, as stated in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.3.7, pp. 35-36. Base change of Ω^log along any cartesian square in the coherent, fine or fs category with Y→X lft; the node states this, not a log-étale base change.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.3.16, p. 38. The equivalence of formal and chart log smoothness for lft morphisms of locally noetherian fs log adic spaces, part (4) of the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 3.3.17, pp. 39-40. Part (1) is the right-exact transitivity sequence; parts (2)-(5) give injectivity and local freeness (with the rank formula) for log smooth f, vanishing for log étale f and the converses, as in the node.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="analytic-log-de-rham"></a>

### Analytic log de Rham complexes and residues

`HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham` · construction · proposed declaration `TauCeti.LogAdic.AnalyticLogDR`.

Let X→S be a log smooth morphism of locally noetherian fs log adic spaces. Then Ω^log_{X/S} is locally free of finite rank and Ω^{log,a}_{X/S}:=∧^aΩ^log_{X/S} (DLLZ-adic Definition 3.3.19); d extends to a graded differential on Ω^{log,•}_{X/S} with d(δ(m))=0, which is the ordinary continuous de Rham complex for trivial log structures. For X log smooth over k, a log connection on a coherent O_X-module E is a k-linear map ∇:E→E⊗_{O_X}Ω^log_X satisfying the Leibniz rule; it is integrable if ∇²=0, and then DR_log(E)=(E⊗_{O_X}Ω^{log,•}_X,∇) is the log de Rham complex, with log de Rham cohomology H^i(X,DR_log(E)) (DLLZ-RH Definition 3.1.7(4)); the S-linear relative version is defined in the same way. If X is a smooth rigid analytic variety over k with a normal crossings divisor D (DLLZ-RH Example 2.1.2), F a vector bundle with an integrable log connection ∇ and Z an irreducible component of D, then after shrinking X so that Z is smooth and connected, and enlarging k so that a smooth toric chart has Z={T₁=0}, Res_Z(∇)=∇(T₁∂/∂T₁) mod T₁ is an O_Z-linear endomorphism of F|_Z, independent of the coordinate and compatible with rational localisation (DLLZ-RH (3.4.1)); on forms, contraction with T₁∂/∂T₁ followed by restriction to Z sends dlog T₁ to 1 and dlog T_j (j≠1) and all dT_j to 0. For a morphism h:Y→X of such log adic spaces, E the boundary of Y and m_{WZ} the multiplicity of a component W of E in h⁻¹(Z), Res_W(h*∇)=Σ_{h(W)⊂Z}m_{WZ}·h_{WZ}*Res_Z(∇) (DLLZ-RH Theorem 3.2.3(4) and proof of Corollary 3.5.7).

**Hypotheses and conventions.**

- DLLZ-RH Definition 3.1.7(4) imposes only k-linearity and the Leibniz rule; continuity of ∇ for coherent E on affinoids follows from the Leibniz rule, the continuity of d and the open mapping property of finite modules, so it is not an extra condition. Unrestricted algebraic modules are not the carrier.
- Residues are taken along irreducible components of a normal crossings divisor (components via the normalisation of D); for a smooth pair of AdicSpacesPartII:R4 the charts exist over k itself, so k need not be enlarged; R4 imposes no condition on irreducible components (a component may be singular, e.g. an analytically split node), so X is still shrunk to make Z smooth. DLLZ-RH work over p-adic fields in §3, but the residue construction uses only smooth toric charts.

**Construction or proof route.**

1. Exterior powers and differential: take ∧^a of the locally free Ω^log_{X/S} (log-differential-descent) and extend d by the graded Leibniz rule with d(δ(m))=0, locally on charts where Ω^log is free on the δ of chart elements; for trivial log structures this is AdicSpacesPartII R3 (f).
2. Coefficient complex: the CR.5 formalism of integrable log connections applies to coherent modules on X_an (DLLZ-RH Definition 3.1.7(4)).
3. Residues: define Res_Z(∇) on a smooth toric chart and check independence of T₁ under T₁↦uT₁, u a unit, since dlog(uT₁)=dlog T₁+dlog u and dlog u restricts to a regular form (DLLZ-RH §3.4).
4. Pullback: locally h*T₁=u·∏_W s_W^{m_{WZ}} with u a unit, so h*dlog T₁=Σ m_{WZ} dlog s_W+dlog u, giving the residue formula (proof of DLLZ-RH Corollary 3.5.7).

**Acceptance checks.**

- The degree-zero term is E and its first differential is ∇.
- The residue of dT₁ along T₁=0 is 0, since dT₁=T₁ dlog T₁.

**Planning API.**

- `TauCeti.LogAdic.AnalyticLogDR` (constructor): The cohomological continuous coefficient log de Rham complex.
- `TauCeti.LogAdic.AnalyticLogDR.d_sq` (relation): Successive differentials compose to zero by integrability.
- `TauCeti.LogAdic.AnalyticLogDR.residue` (projection): The residue along an irreducible boundary component Z: Res_Z(∇)=∇(T₁∂/∂T₁) mod T₁ on F|_Z, and on forms the map Ω^log_X|_Z→O_Z, dlog T₁↦1.
- `TauCeti.LogAdic.AnalyticLogDR.pullback_residue` (functoriality): Residues transform by the integer boundary-multiplicity matrix: Res_W(h*∇)=Σ_{h(W)⊂Z}m_{WZ}h_{WZ}*Res_Z(∇).
- `TauCeti.LogAdic.AnalyticLogDR.forms` (constructor): Ω^{log,a}_{X/S}=∧^aΩ^log_{X/S} for log smooth X→S, with the graded differential extending d and d(δ(m))=0 (DLLZ-adic Definition 3.3.19).
- `TauCeti.LogAdic.AnalyticLogDR.leibniz` (relation): ∇(fe)=f∇(e)+e⊗df for sections f of O_X and e of E, extended to E⊗Ω^{log,•} by the graded Leibniz rule.
- `TauCeti.LogAdic.AnalyticLogDR.residue_independent` (characterisation): Res_Z(∇) does not depend on the local equation T₁ of Z and is compatible with rational localisation (DLLZ-RH §3.4).

**Discriminating unit tests.**

- `TauCeti.LogAdic.AnalyticLogDR.empty_boundary` (compatibility): With trivial log structure this is the ordinary continuous de Rham complex.
- `TauCeti.LogAdic.AnalyticLogDR.residue_coordinate` (computation): res_{T=0}(dlog T)=1, while res(dT)=0.
- `TauCeti.LogAdic.AnalyticLogDR.root_pullback` (computation): Under T=S^n, pullback dlog T=n dlog S and its residue is n.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent](#log-differential-descent), [HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log](#divisorial-analytic-log), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion](#log-smooth-chart-criterion), `CrystallineCohomology:CR.5/log-de-rham`, `AdicSpacesPartII:R3/sheaf-of-continuous-differentials`, `AdicSpacesPartII:R3/coherent-sheaf-operations`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 3.3.19, p. 40. Defines Ω^{log,a}_{X/S} as exterior powers of the locally free Ω^log_{X/S} for log smooth X→S, as in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 3.1.7(4), p. 24. Defines log connections on coherent sheaves, integrability ∇²=0, the log de Rham complex and its cohomology; no continuity condition is imposed.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §3.4, (3.4.1), p. 33. Defines Res_Z(∇)=∇(T₁∂/∂T₁) mod T₁ along an irreducible component of a normal crossings divisor, independent of the coordinate, as in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.3(4), p. 25, and proof of Corollary 3.5.7, p. 40. The pullback formula Res_W(h*∇)=Σ_{h(W)⊂Z}m_{WZ}h_{WZ}*Res_Z(∇), with m_{WZ} the multiplicity of W in h⁻¹(Z) defined in Theorem 3.2.3(4).

**Uses.**

- DLLZ-RH Corollary 2.4.2: The period Poincaré resolution is a coefficient log complex.
- DLLZ-RH Corollary 3.5.7: Pullback residue normalization controls base change.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

## Kummer geometry, descent and boundary extension

Root covers and ramification control build the Kummer site. Cohomology and finite descent distinguish its boundary behavior from the ordinary étale site; rigid Abhyankar then relates covers on the open complement to finite Kummer covers.

- [Analytic Kummer étale maps](#kummer-etale-morphism)
- [Finite root covers and their Galois group](#kummer-root-covers)
- [Characteristic ramification index](#kummer-ramification-index)
- [The Kummer étale ringed site](#kummer-etale-site)
- [Affinoid Kummer coherent acyclicity](#kummer-coherent-acyclicity)
- [Finite Kummer descent and local systems](#finite-kummer-descent)
- [Higher direct images to the étale site](#kummer-etale-higher-direct-images)
- [Rigid logarithmic Abhyankar lemma](#rigid-abhyankar)
- [Extension across a normal crossings boundary](#boundary-local-system-extension)

<a id="kummer-etale-morphism"></a>

### Analytic Kummer étale maps

`HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism` · definition · proposed declaration `TauCeti.LogAdic.KummerEtale`.

A morphism f:Y→X of locally noetherian fs log adic spaces is Kummer (resp. finite Kummer) if, étale locally on X and Y (resp. étale locally on X), it admits an fs chart u:P→Q that is a Kummer homomorphism of saturated monoids: u is injective, every element of Q has a positive multiple in u(P), and Q^gp/u^gp(P^gp) is finite. It is Kummer étale (resp. finite Kummer étale) if u can be chosen with |Q^gp/u^gp(P^gp)| invertible in O_Y and with Y→X×_{X⟨P⟩}X⟨Q⟩ étale (resp. finite étale) on underlying adic spaces. Equivalently, f is Kummer étale iff it is log étale and Kummer, iff it is log étale and exact; it is finite Kummer étale iff it is log étale and finite Kummer. For Kummer f every characteristic stalk map M̄_{X,f(y)}→M̄_{Y,y} is a Kummer homomorphism, with group cokernel of order invertible in O_{Y,y} when f is Kummer étale. Kummer étale and finite Kummer étale maps are stable under composition and under fs base change along arbitrary morphisms of locally noetherian fs log adic spaces; if f=g∘h with f and g Kummer étale then h is Kummer étale; Kummer étale maps are open.

**Hypotheses and conventions.**

- X and Y are locally noetherian fs log adic spaces; base change is the fs fibre product of Proposition 3.1.3 and Remark 3.1.2.
- The index condition is invertibility of the cokernel order in O_Y (not in O_Y⁺); since O_{X,f(y)}→O_{Y,y} is local this is the same as invertibility in O_X near f(y). The order and the exponent of the cokernel have the same prime divisors.

**Construction or proof route.**

1. Import the saturated-monoid Kummer homomorphism (Definition 4.1.1) from CR.5 and form the chart fibre product X×_{X⟨P⟩}X⟨Q⟩ (Remark 2.3.3).
2. Lemma 4.1.10 re-charts a Kummer étale map with a prescribed (sharp, torsion-free) P; Lemma 4.1.11 then shows that each f_y^♯ is Kummer with cokernel order invertible in O_{Y,y} and that f is exact (Remark 4.1.4).
3. Lemma 4.1.13: a log étale exact map has, étale locally, an injective chart from the log étale chart criterion (Propositions 2.3.13, 3.1.4) that exactness makes Kummer; the finite case passes to the prime-to-ℓ part Q′ of Q.
4. Proposition 4.1.14 (composition by Proposition 3.1.6 and Lemma 4.1.13; base change because R→(R⊕_P Q)^sat is Kummer), Proposition 4.1.15 (cancellation by Theorem 3.3.17(5) and stalkwise Kummer maps) and Corollary 4.1.9 (openness, from standard covers and strictly étale maps).

**Acceptance checks.**

- Trivial log structures give ordinary étale (resp. finite étale) morphisms.
- Over a p-adic field the p-th root map of the log disc is Kummer étale: the index is required to be invertible in O_Y, not in O_Y⁺.

**Planning API.**

- `TauCeti.LogAdic.KummerEtale` (constructor): A morphism with étale-local Kummer charts whose cokernel order is invertible in O_Y and whose induced map to X×_{X⟨P⟩}X⟨Q⟩ is étale.
- `TauCeti.LogAdic.KummerEtale.root_chart` (characterisation): Étale locally a Kummer étale map is an étale map to X×_{X⟨P⟩}X⟨Q⟩ for a Kummer chart P→Q, which may be chosen with the prescribed chart P of X and Q sharp when P is (Lemma 4.1.10).
- `TauCeti.LogAdic.KummerEtale.comp` (functoriality): Composition preserves Kummer étaleness and finite Kummer étaleness.
- `TauCeti.LogAdic.KummerEtale.base_change` (functoriality): Fs base change along any morphism of locally noetherian fs log adic spaces preserves Kummer étaleness and finite Kummer étaleness.
- `TauCeti.LogAdic.KummerEtale.iff_logEtale_exact` (characterisation): f is Kummer étale iff log étale and Kummer iff log étale and exact; finite Kummer étale iff log étale and finite Kummer (Lemma 4.1.13).
- `TauCeti.LogAdic.KummerEtale.stalk_kummer` (characterisation): For Kummer f each characteristic stalk map is a Kummer homomorphism of sharp fs monoids, with group cokernel of order invertible in O_{Y,y} when f is Kummer étale (Lemma 4.1.11(2)).
- `TauCeti.LogAdic.KummerEtale.of_comp` (functoriality): If f=g∘h with f and g Kummer étale, then h is Kummer étale (Proposition 4.1.15).
- `TauCeti.LogAdic.KummerEtale.isOpenMap` (compatibility): Kummer étale morphisms are open (Corollary 4.1.9).
- `TauCeti.LogAdic.KummerEtale.of_strictEtale` (constructor): A strictly étale morphism is Kummer étale (Remark 4.1.17(1)).

**Discriminating unit tests.**

- `TauCeti.LogAdic.KummerEtale.strict` (compatibility): A strict Kummer étale map is ordinarily étale.
- `TauCeti.LogAdic.KummerEtale.p_root_char_zero` (computation): T=S^p with coordinate logs is Kummer étale over a characteristic-zero p-adic field.
- `TauCeti.LogAdic.KummerEtale.reject_p_root_char_p` (non-example): Over characteristic p, the same nontrivial coordinate root map is not log étale because the index p is not invertible in O_X.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion](#log-smooth-chart-criterion), `CrystallineCohomology:CR.5:log-algebra/kummer-morphism`, [HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products](#saturated-adic-products), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent](#log-differential-descent).

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.2(1)–(2), p. 41. Defines (finite) Kummer maps through étale-local Kummer charts; part (2) adds the cokernel order invertible in O_Y and étaleness of Y→X×_{X⟨P⟩}X⟨Q⟩, as in the node's definition.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.1.13, p. 45. The log-étale characterisations recorded in the statement and in the api item iff_logEtale_exact.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.1.14, p. 46. Composition and fs base-change stability (api comp and base_change).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.1.15, p. 46; Corollary 4.1.9, p. 43. Cancellation (api of_comp); openness is the separate Corollary 4.1.9 on p. 43.

**Uses.**

- DLLZ-adic Definition 4.1.16: Defines objects and generating covers of the Kummer étale site.
- DLLZ-adic §5.1: Finite Kummer étale maps are the eventual transition steps.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="kummer-root-covers"></a>

### Finite root covers and their Galois group

`HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers` · construction · proposed declaration `TauCeti.LogAdic.RootCover`.

Let X be a locally noetherian log adic space with a chart modeled on a torsion-free fs monoid P and n≥1. Put X^{1/n}:=X×_{X⟨P⟩}X⟨(1/n)P⟩ with its chart (1/n)P, where P↪(1/n)P is isomorphic to [n]:P→P. More generally, for a Kummer homomorphism u:P→Q of fs monoids with G:=Q^gp/u^gp(P^gp) finite, Y:=X×_{X⟨P⟩}X⟨Q⟩→X is a finite surjective Kummer cover with an action of G^D_X:=X⟨G⟩ such that G^D_X×_X Y≃Y×_X Y, and for affinoid X the sequence 0→O(X)→O(Y)→O(Y×_X Y) is exact. When G is annihilated by an integer invertible in O_X, Y→X is an open Galois finite Kummer étale cover with group G^D_X, which is the constant group Hom(G,O_X(X)^×) when O_X(X) contains the relevant roots of unity; for X^{1/n} with μ_n⊂O_X(X) this is Hom(((1/n)P)^gp/P^gp,μ_n) acting on root monomials by characters. These Y→X are the standard Kummer (étale) covers. If X is noetherian with a sharp fs chart P, every Kummer étale (resp. finite Kummer étale) Y→X becomes étale (resp. finite étale) after base change to some X^{1/n}, and every Kummer étale covering indexed by a finite set is refined by one whose members V_j are étale over root covers X^{1/n_j}; n may be taken invertible on X when X has at most one positive residue characteristic.

**Hypotheses and conventions.**

- X locally noetherian with a chart modeled on a torsion-free fs monoid P (Definition 4.1.5); the refinement statements (Lemmas 4.2.5–4.2.6) assume X noetherian with a sharp fs chart.
- The Galois description needs the order of G invertible in O_X; the constant-group form needs the corresponding roots of unity in O_X(X), otherwise G^D_X is only an étale group object.

**Construction or proof route.**

1. Monoid side from CR.5: (1/n)P, and (Q⊕_P Q)^sat≃Q⊕G for Kummer u ([Ill02, Lem. 3.3], as cited in Proposition 4.1.6).
2. Proposition 4.1.6: finiteness and injectivity of O(X)→O(Y) since Z[P] is a direct summand of the finite Z[P]-module Z[Q]; exactness in low degrees by [Niz08, Lem. 3.28]; the torsor isomorphism from (Q⊕_P Q)^sat≃Q⊕G; for |G| invertible, R⟨Q⟩^Γ=R⟨P⟩ and the finite quotient construction of Lemma 4.1.7 give the Galois property and openness.
3. Lemma 4.3.2: the full Čech complex of a standard Kummer cover is exact, by the explicit contracting homotopy of [Niz08, Lem. 3.28] on O(Y)⊗R[G]^{⊗•}.
4. Lemmas 4.2.5–4.2.6: re-chart with the prescribed sharp P (Lemma 4.1.10), choose n with P→Q_i→(1/n)P, and use (Q_i⊕_P(1/n)P)^sat≃G_i⊕(1/n)P to see that the base change to X^{1/n} is strictly étale; finiteness by [Hub96, Lem. 1.4.5].

**Acceptance checks.**

- Do not call the cover ordinarily étale along its boundary.

**Planning API.**

- `TauCeti.LogAdic.RootCover` (constructor): The n-th root cover X×_{X⟨P⟩}X⟨(1/n)P⟩ of a torsion-free fs chart, and more generally the standard cover X×_{X⟨P⟩}X⟨Q⟩ of a Kummer chart P→Q.
- `TauCeti.LogAdic.RootCover.action` (structure): Hom((1/n)P^gp/P^gp,μ_n) acts by multiplying the root monomial of a by its character.
- `TauCeti.LogAdic.RootCover.refine` (functoriality): For n dividing m the m-th root cover maps to the n-th root cover, compatibly under divisibility composition.
- `TauCeti.LogAdic.RootCover.strictify` (compatibility): For X noetherian with a sharp fs chart, every Kummer étale (resp. finite Kummer étale) Y→X becomes étale (resp. finite étale) after base change to some X^{1/n} (Lemma 4.2.5).
- `TauCeti.LogAdic.RootCover.finite_surjective` (compatibility): The standard cover is finite and surjective, and finite Kummer étale when the order of G is invertible in O_X (Definition 4.1.5, Proposition 4.1.6(1)).
- `TauCeti.LogAdic.RootCover.galois` (structure): G^D_X×_X Y≃Y×_X Y, and for |G| invertible Y→X is an open Galois finite Kummer étale cover with group G^D_X (Proposition 4.1.6(3)–(4)).
- `TauCeti.LogAdic.RootCover.cech_exact` (characterisation): For affinoid X with a sharp chart the Čech complex O(X)→O(Y)→O(Y×_X Y)→⋯ of a standard Kummer cover is exact, with an O(X)-linear contracting homotopy (Lemma 4.3.2).
- `TauCeti.LogAdic.RootCover.refine_covering` (characterisation): A finitely indexed Kummer étale covering of a noetherian X with a sharp chart is refined by one whose members are étale over root covers X^{1/n_j} and become a strict étale covering over X^{1/n} (Lemma 4.2.6).

**Discriminating unit tests.**

- `TauCeti.LogAdic.RootCover.one` (degenerate): The first root cover is X.
- `TauCeti.LogAdic.RootCover.disc_action` (computation): For P=N and μ_n present, ζ sends S to ζS on T=S^n.
- `TauCeti.LogAdic.RootCover.ramified_boundary` (non-example): For n>1 the root map on the log disc has ramification index n at T=0 and is not strict étale there.
- `TauCeti.LogAdic.RootCover.polydisc_degree` (computation): For P=N^r over an affinoid field k with n invertible in k and μ_n⊂k, X^{1/n}→X is finite of degree n^r with Galois group μ_n^r acting coordinatewise on S_i, S_i^n=T_i.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism](#kummer-etale-morphism), [HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart](#integral-adic-chart), [HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products](#saturated-adic-products), `AdicSpacesPartII:R0/fibre-products-existence`, `AdicSpacesPartII:R0/finite-algebra-over-affinoid`, `AdicSpacesPartII:R0/finite-morphism`, [HodgeTateAndCanonicalSubgroups:T6:log-sites/toric-log-adic-space](#toric-log-adic-space).

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.5, p. 41. The root cover X^{1/n}=X×_{X⟨P⟩}X⟨(1/n)P⟩ for a torsion-free fs chart, finite Kummer étale when n is invertible.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.1.6, pp. 41–42; Definition 4.1.8, p. 43. The group object G^D_X=X⟨G⟩ acting on Y=X×_{X⟨P⟩}X⟨Q⟩; parts (1)–(4) give finiteness, surjectivity, the torsor isomorphism and the Galois property recorded in the statement.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.3.2, p. 52. Čech exactness of O for standard Kummer covers (api cech_exact), valid without the étale condition.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemmas 4.2.5–4.2.6, pp. 49–50. Lemma 4.2.6 (refinement by members étale over root covers); Lemma 4.2.5 just before it gives strictification after base change to X^{1/n}. The node keeps the noetherian sharp-chart hypothesis.

**Uses.**

- DLLZ-adic §5.3: All-root inverse limits give the log perfectoid basis.
- DLLZ-RH §2.3: Characters of the chart group control periods and residues.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="kummer-ramification-index"></a>

### Characteristic ramification index

`HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-ramification-index` · definition · proposed declaration `TauCeti.LogAdic.RamificationIndex`.

For a Kummer morphism f:Y→X of locally noetherian fs log adic spaces and a geometric point y of Y, the ramification index of f at y is the smallest positive integer n annihilating the finite group coker(M̄^gp_{X,f(y)}→M̄^gp_{Y,y}), i.e. its exponent, not its order. The ramification index of a Kummer étale f is the least common multiple of the indices at the geometric points of Y, when this exists (it is not always defined). For Kummer étale f the index at y is invertible in O_{Y,y}, and the ramification index of a Kummer étale f is 1 if and only if f is strictly étale.

**Hypotheses and conventions.**

- f is Kummer; the cokernel is finite because the characteristic stalk map is a Kummer homomorphism of sharp fs monoids (Lemma 4.1.11(2)).
- The index is an exponent: for N^r→N^r, a↦na, it is n although the cokernel has order n^r.

**Construction or proof route.**

1. Lemma 4.1.11(2): f_y^♯ is Kummer, so its group cokernel is finite and its exponent exists; for Kummer étale f the order, hence the exponent, is invertible in O_{Y,y}.
2. If every local index is 1, each f_y^♯ is an injective Kummer map with trivial group cokernel; Kummer maps are exact (Remark 4.1.4), so f_y^♯ is an isomorphism and f is strict.
3. For strict Kummer étale f the Kummer charts M̄_{X,f(y)}→M̄_{Y,y} of Lemmas 4.1.10 and 4.1.13 are isomorphisms, so Y→X×_{X⟨P⟩}X⟨P⟩=X is étale; conversely a strictly étale map has isomorphic characteristic stalks.

**Acceptance checks.**

- A product of two n-th coordinate roots has index n, not n².

**Planning API.**

- `TauCeti.LogAdic.RamificationIndex` (constructor): The exponent of the characteristic group cokernel at the specified geometric point of a Kummer map.
- `TauCeti.LogAdic.RamificationIndex.index_one` (characterisation): A Kummer étale map has index one at every geometric point iff it is strictly étale.
- `TauCeti.LogAdic.RamificationIndex.base_change` (compatibility): Compute the index from the saturated base-changed characteristic map; it can decrease after root base change.
- `TauCeti.LogAdic.RamificationIndex.global` (constructor): The least common multiple of the local indices of a Kummer étale map, when it exists.
- `TauCeti.LogAdic.RamificationIndex.isUnit` (compatibility): For Kummer étale f the local index at y is invertible in O_{Y,y} (Lemma 4.1.11(2)).

**Discriminating unit tests.**

- `TauCeti.LogAdic.RamificationIndex.identity` (degenerate): The identity has index one.
- `TauCeti.LogAdic.RamificationIndex.two_coordinates` (computation): Multiplication by n on N² has index n, since the cokernel is (Z/n)².
- `TauCeti.LogAdic.RamificationIndex.off_boundary` (computation): On the boundary complement the coordinate-root characteristic cokernel is zero and the index is one.
- `TauCeti.LogAdic.RamificationIndex.root_cover_strata` (computation): For the n-th root cover of a chart modeled on N^r, the index at a point where exactly s≥1 coordinates vanish is n (cokernel (Z/n)^s), and 1 where none vanish.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism](#kummer-etale-morphism), `CrystallineCohomology:CR.5:log-algebra/characteristic-monoid`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.12, p. 44. The local index is the exponent of the group cokernel of the characteristic stalk map (the pdftotext layer drops the superscripts gp).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.12, p. 44. The global index (api global), including the caveat that it need not exist.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.12, p. 44. The index-one characterisation (api index_one); the source states it without proof, the node's proof sketch supplies it.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.1.11(2) proof, p. 44. Invertibility of the cokernel order, hence of the local index, for Kummer étale f (api isUnit).

**Uses.**

- DLLZ-adic Lemma 5.3.8: Divisibility of the limit characteristic removes finite Kummer ramification.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="kummer-etale-site"></a>

### The Kummer étale ringed site

`HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site` · construction · proposed declaration `TauCeti.LogAdic.KummerEtaleSite`.

Atlas planet: **Kummer étale site**.

For a locally noetherian fs log adic space X, X_két is the full subcategory of locally noetherian fs log adic spaces over X consisting of the Kummer étale Y→X (morphisms over X between them are automatically Kummer étale, Proposition 4.1.15), with coverings the families {U_i→U} that are jointly surjective on underlying topological spaces; fs fibre products and composition (Proposition 4.1.14) make this a site, and its topology is generated by surjective strictly étale maps and standard Kummer étale covers. The presheaves U↦O_U(U), U↦O_U⁺(U) and U↦M_U(U) are sheaves, and for every morphism Y→X of locally noetherian fs log adic spaces Mor_X(−,Y) is a sheaf on X_két. If X is affinoid then H^i(X_két,O)=0 for i>0. Viewing objects of X_ét with the restricted log structure gives ε_ét:X_két→X_ét (and ε_an:X_két→X_an), an isomorphism of sites for trivial log structure, with O_{X_ét}≃Rε_ét,*O_{X_két}, O_{X_an}≃Rε_an,*O_{X_két} and ε_ét,*M_{X_két}≃M_X. A morphism f:Y→X induces f_két:Y_két→X_két with f_két,*F(U)=F(U×_X Y) and exact left adjoint f_két⁻¹.

**Hypotheses and conventions.**

- All topological points, including higher-rank points, count in joint surjectivity.
- Affinoid acyclicity of O is for affinoid (hence noetherian) X; it is the case F=O of the coherent acyclicity theorem.

**Construction or proof route.**

1. Definition 4.1.16 with Propositions 2.3.32, 4.1.14–4.1.15 and Remark 4.1.4 (fibre products, cancellation); Remark 4.1.18 for the generating covers.
2. Theorem 4.3.1: étale sheafiness and the refinement Lemma 4.2.6 reduce sheafiness of O to the Čech exactness of Lemma 4.3.2 for standard Kummer covers; O⁺ is cut out by |f(x)|≤1; affinoid acyclicity by Lemma 4.2.6 and Proposition A.10; Corollary 4.3.3 follows.
3. Proposition 4.3.4 by strict localisation and exactness of 0→P→Q⇉Q⊕G; Proposition 4.3.5 by writing Mor(−,Y) for affinoid charted Y as a fibre product of the sheaves Hom(R,O), Hom(P,M) and Hom(P,O).
4. ε_ét from the continuous inclusion of strict étale objects (Remark 4.1.17(1)); f_két from fs base change (Remark 4.1.17(2) and the opening of §4.5).

**Acceptance checks.**

- The site agrees with the ordinary étale site for trivial log structures.

**Planning API.**

- `TauCeti.LogAdic.KummerEtaleSite` (constructor): The category of Kummer étale objects over X, the joint-surjectivity topology, and the sheaves O, O⁺ and M.
- `TauCeti.LogAdic.KummerEtaleSite.epsilon` (projection): The morphism of sites ε_ét:X_két→X_ét induced by strict étale objects, an isomorphism for trivial log structure.
- `TauCeti.LogAdic.KummerEtaleSite.pullback` (functoriality): A morphism f:Y→X induces f_két with f_két,*F(U)=F(U×_X Y) and exact left adjoint f_két⁻¹, with identity and composition coherence.
- `TauCeti.LogAdic.KummerEtaleSite.representable` (structure): For every morphism Y→X of locally noetherian fs log adic spaces, Mor_X(−,Y) is a sheaf on X_két (Proposition 4.3.5).
- `TauCeti.LogAdic.KummerEtaleSite.generated` (characterisation): The topology is generated by surjective strictly étale maps and standard Kummer étale covers (Remark 4.1.18).
- `TauCeti.LogAdic.KummerEtaleSite.epsilon_structureSheaf` (compatibility): O_{X_ét}≃Rε_ét,*O_{X_két}, O_{X_an}≃Rε_an,*O_{X_két} and ε_ét,*M_{X_két}≃M_X (Corollary 4.3.3, Proposition 4.3.4).
- `TauCeti.LogAdic.KummerEtaleSite.affinoid_chart_basis` (structure): Affinoids with global fs charts form a basis of X_két inducing an equivalence of topoi (Lemma 4.3.10).

**Discriminating unit tests.**

- `TauCeti.LogAdic.KummerEtaleSite.trivial_log` (compatibility): For the trivial log structure, X_két≃X_ét as ringed sites.
- `TauCeti.LogAdic.KummerEtaleSite.root_is_cover` (computation): For n invertible on the log disc D, the n-th root cover D→D, T=S^n, is a single-member covering, surjective also over T=0.
- `TauCeti.LogAdic.KummerEtaleSite.no_closed_point_shortcut` (non-example): On the closed unit disc with trivial log structure, the open disc ⋃_{m≥1}{|T|^m≤|ϖ|} (ϖ a pseudo-uniformiser) and the circle {|T|=1} cover every rank-one point but miss the rank-two point with |T| infinitesimally below 1, so this family is not a covering of X_két.
- `TauCeti.LogAdic.KummerEtaleSite.root_invariants` (computation): For the n-th root cover of the log disc over k with n invertible in k and μ_n⊂k, the equaliser of O(D)⇉O(D×_D D) is k⟨S⟩^{μ_n}=k⟨S^n⟩=k⟨T⟩, as sheafiness of O requires.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism](#kummer-etale-morphism), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers](#kummer-root-covers), `AdicEtaleGeometry:A1/etale-site`, `mathlib:CategoryTheory.GrothendieckTopology`, `mathlib:CategoryTheory.Sheaf`, `AdicEtaleGeometry:A1/etale-structure-sheaf`, `ClassicalAdicEtaleCohomology:H0/etale-acyclicity-of-vector-bundles`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.1.16, pp. 46–47. Defines X_két as the category of Kummer étale objects over X with jointly surjective (topological) coverings.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Remark 4.1.17(1), p. 47. The projection ε_ét, an isomorphism for trivial log structure (api epsilon, test trivial_log).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.3.1(2), p. 52. Affinoid acyclicity of O; part (1), just above, gives sheafiness of O and O⁺.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.3.4, p. 53. Sheafiness of M on X_két with ε_ét,*M_{X_két}≃M_X.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.3.5, p. 54. Representable descent for every log adic space over X, not only objects of X_két (api representable).

**Uses.**

- DLLZ-adic Theorem 6.2.1: The primitive comparison uses cohomology on X_két.
- PrismaticCohomology:PR.8: Imports chartwise log descent.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="kummer-coherent-acyclicity"></a>

### Affinoid Kummer coherent acyclicity

`HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-coherent-acyclicity` · theorem · proposed declaration `TauCeti.LogAdic.kummer_coherent_acyclicity`.

Let X be an affinoid noetherian fs log adic space. An O_{X_két}-module is analytic coherent if it is isomorphic to the inverse image of a coherent sheaf on X_an, and coherent if its restrictions to the members of some Kummer étale covering are analytic coherent. Then H^i(X_két,F)=0 for all i>0 if (1) F is analytic coherent, or (2) F is coherent and X is over an affinoid field (k,k⁺). The analytic qualification and the field alternative are retained: no claim is made for every coherent module over an arbitrary affinoid base, and Kummer étale descent of coherent sheaves is not effective in general.

**Hypotheses and conventions.**

- Use the two alternatives of DLLZ Theorem 4.3.7 and the definitions of Definition 4.3.6.

**Construction or proof route.**

1. Reduce, by Lemma 4.2.6 and Proposition A.10, to the Čech complex of a standard Kummer cover Y→X of an affinoid X with a sharp fs chart.
2. (1): Y, Y×_X Y, … are finite over X (Proposition 4.1.6), so C•_F(Y/X)≃C•(Y/X)⊗_{O(X)}F(X), and the O(X)-linear contracting homotopy of Lemma 4.3.2 makes it exact.
3. (2): with a sharp chart P, reduce to F|_U analytic coherent for U=X^{1/n} with n invertible in k; by (1) the higher cohomology of U×_X⋯×_X U vanishes, and the Čech complex of U/X computes H^i(G,F(U)) for G=((1/n)P)^gp/P^gp, which vanishes for i>0 because |G| is invertible in k and F(U) is a k-vector space.
4. Hence R^jε_ét,*F=0 for j>0 and ε_ét,*F is coherent on X_ét; this is étale local (Proposition 2.3.13), so H^i(X_két,F)≅H^i(X_ét,ε_ét,*F)=0 by Proposition A.10.

**Acceptance checks.**

- For F=O recover Theorem 4.3.1.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site](#kummer-etale-site), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers](#kummer-root-covers), `ClassicalAdicEtaleCohomology:H0`, `AdicSpacesPartII:R3/coherent-sheaf`, `AdicSpacesPartII:R3/tate-kiehl-affinoid`, `ClassicalAdicEtaleCohomology:H0/etale-acyclicity-of-vector-bundles`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 4.3.6(1), p. 55. Definition of analytic coherent O_{X_két}-modules; part (2) defines coherent ones Kummer étale locally.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.3.7(2), p. 55. The field alternative of the theorem, kept as a hypothesis of case (2).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.3.7, proof of (2), p. 56. The group-cohomology vanishing used in proof step 3.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="finite-kummer-descent"></a>

### Finite Kummer descent and local systems

`HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent` · theorem · proposed declaration `TauCeti.LogAdic.finite_kummer_descent`.

Let X be a locally noetherian fs log adic space. (i) For lft morphisms, being log smooth, log étale or Kummer étale can be checked after a surjective Kummer étale base change, and descends along a surjective Kummer étale source map: for surjective Kummer étale f:Y→X and lft g:X→S, g has the property iff g∘f has. (ii) Kummer étale covers are effective descent morphisms for finite Kummer étale objects: for surjective Kummer étale f:Y→X and Y̆∈Y_fkét with an isomorphism pr₁⁻¹Y̆≃pr₂⁻¹Y̆ satisfying the cocycle condition, there is a unique X̆∈X_fkét with Y̆≃X̆×_X Y. (iii) Y↦Mor_X(−,Y) is an equivalence X_fkét≃Loc(X_két) onto locally constant sheaves of finite sets, preserving fibre products and quotients by finite groups. (iv) Every geometric point has a log geometric point above it (complete separably closed l, characteristic monoid uniquely n-divisible for n invertible in l), and these give a conservative family of fibre functors; for connected X and a log geometric point ζ, X_fkét with Y↦Mor_X(ζ,Y) is a Galois category, and X_fkét≃Loc(X_két)≃π₁^két(X,ζ)-FSets. (v) For the strict localisation X(ξ) at a geometric point ξ=Spa(l,l⁺), π₁^két(X(ξ))≃π₁^két(ξ)≃Hom(M̄^gp_{X,ξ},Ẑ′(1)(l)), where Ẑ′(1)(l)=lim μ_m(l) over m invertible in l. Consequently locally constant sheaves of finite Λ-modules (Λ a finite ring) correspond to finite Λ-modules with continuous π₁^két(X,ζ)-action.

**Hypotheses and conventions.**

- X locally noetherian fs; the fundamental-group statements need X connected and a log geometric point (not an unlogged geometric point) as base point.
- The Λ-module form is a formal consequence of (4.4.20) applied to module objects; DLLZ state only the finite-set form.

**Construction or proof route.**

1. Propositions 4.2.7–4.2.8: reduce by Lemma 4.2.6 to a root cover X^{1/m}→X with a global chart, and descend formal log étaleness through Γ-invariants of the Galois cover (Proposition 4.1.6).
2. Construction 4.4.3 builds ξ̃ above ξ from the reduced fibres of the root covers; Lemma 4.4.4 gives fibre functors and conservativity.
3. Propositions 4.4.7 and 4.4.9: over a log point and over a strict localisation, finite Kummer étale covers are disjoint unions of standard covers X(ξ)_Q, so X(ξ)_fkét≃Hom(M̄^gp,Ẑ′(1))-FSets (Corollary 4.4.22).
4. Theorem 4.4.12: étale localise to a Galois standard Kummer étale cover with group Γ, take Γ-invariants (Lemma 4.1.7), descend the log structure, verify the descent isomorphism on strict localisations via Proposition 4.4.9, and conclude by Lemma 4.1.13 and Proposition 4.2.8.
5. Theorem 4.4.15 from Proposition 4.3.5 and Theorem 4.4.12; Corollary 4.4.13 for quotients; Lemma 4.4.16 and Corollary 4.4.18 for the Galois category and π₁^két.

**Acceptance checks.**

- On an fs log point over a complete separably closed field l with characteristic monoid N^r, π₁^két≃Ẑ′(1)(l)^r; over a general field it is an extension of Gal(k^sep/k) by this group, split for a split log point (Example 4.4.24).

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site](#kummer-etale-site), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers](#kummer-root-covers), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion](#log-smooth-chart-criterion), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent](#log-differential-descent), `ClassicalAdicEtaleCohomology:H0`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Propositions 4.2.7–4.2.8, pp. 50–52. Part (i) of the statement, used in the proof of Theorem 4.4.12.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.4.12, p. 60. Introduces Theorem 4.4.12: effective descent of finite Kummer étale objects along Kummer étale covers, part (ii).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.4.15(2), p. 62. Part (iii): the equivalence φ:X_fkét≃Loc(X_két) and its compatibility with quotients (and, in (1), fibre products).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 4.4.18, p. 63. Part (iv): π₁^két(X,ζ) and the equivalences (4.4.19)–(4.4.20) with finite continuous π₁-sets.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 4.4.22, p. 63. Part (v): the local fundamental group Hom(M̄^gp,Ẑ′(1)(l)) of a strictly local log adic space.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="kummer-etale-higher-direct-images"></a>

### Higher direct images to the étale site

`HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-higher-direct-images` · theorem · proposed declaration `TauCeti.LogAdic.kummer_etale_higher_direct_images`.

Let X be a locally noetherian fs log adic space, ε=ε_ét:X_két→X_ét, and ξ=Spa(l,l⁺) a geometric point of X with a log geometric point ξ̃ above it and M̄=M̄_{X,ξ}. (1) For every sheaf F of finite abelian groups on X_két, (R^iε_*F)_ξ≅H^i(π₁^két(ξ,ξ̃),F_ξ̃) (continuous cohomology), where π₁^két(ξ)≅Hom(M̄^gp,Ẑ′(1)(l)). (2) For n invertible in O_X, the sequence 1→μ_n→M^gp_{X_két}→M^gp_{X_két}→1 (the middle map multiplication by n) is exact on X_két; with ε_*μ_n=μ_n its pushforward, compared with the Kummer sequence of O^×_{X_ét}, gives a canonical map M̄^gp_X/nM̄^gp_X→R^1ε_*(μ_n), which is an isomorphism. (3) Cup product gives isomorphisms ∧^iR^1ε_*(μ_n)≅R^iε_*(μ_n^{⊗i}) for all i≥0; equivalently R^iε_*(Z/n)≅∧^i(M̄^gp_X/nM̄^gp_X)(−i), where (−i) means ⊗μ_n^{⊗(−i)}. Since O^×_{X_ét} is n-divisible étale locally, M^gp_X/nM^gp_X=M̄^gp_X/nM̄^gp_X, so this is the form ∧^i(M^gp/nM^gp)(−i) used by PR.8. DLLZ print the target of Lemma 4.4.29 as R^iε_*(μ_n); the twist μ_n^{⊗i} is needed for i≠1, and is the form DLLZ use in Lemma 4.6.2. For trivial log structure R^iε_*F=0 for i>0.

**Hypotheses and conventions.**

- X locally noetherian fs. (1) holds for every sheaf of finite abelian groups; (2)–(3) need n invertible in O_X. Over Spa(Q_p,Z_p), the case requested by PR.8, every n is invertible in O_X.
- Ẑ′(1)(l)=lim μ_m(l) over m invertible in l; it is Ẑ(1)(l) in characteristic zero. The log geometric point is that of Construction 4.4.3.

**Construction or proof route.**

1. (1) Lemma 4.4.27: (R^iε_*F)_ξ=colim H^i(U_két,F) over étale neighbourhoods; with a chart modeled on P=M̄ (Proposition 2.3.13) every Kummer étale covering of ξ is refined by the standard covers of [n]:P→P with n invertible in l, which come from the neighbourhoods, so by Proposition 4.4.7 ξ_két^~≃lim U_két^~ and the colimit is H^i(ξ_két,F)=H^i(π₁^két(ξ,ξ̃),F_ξ̃).
2. π₁^két(ξ)≅Hom(M̄^gp,Ẑ′(1)(l)) by Proposition 4.4.9 and Corollary 4.4.22 (finite-kummer-descent).
3. (2) The Kummer sequence of M^gp_két is exact at log geometric points, where the characteristic monoid is uniquely n-divisible (Construction 4.4.3, Lemma 4.4.4); push forward along ε (Corollary 4.3.3, Proposition 4.3.4) and compare with 1→μ_n→O^×→O^×→1 on X_ét to get (4.4.28). At ξ it is the inverse of (1) for i=1, since H^1(Hom(M̄^gp,Ẑ′(1)),μ_n)=Hom(Hom(M̄^gp,Ẑ′(1)),μ_n)=M̄^gp/n.
4. (3) For n invertible in l, H^•(Ẑ′(1)^r,Z/n) is the exterior algebra on H^1 (Künneth over procyclic factors); with (1) and (2) this gives the cup-product isomorphism with target R^iε_*(μ_n^{⊗i}), i.e. Lemma 4.4.29 in the form used in Lemma 4.6.2.

**Acceptance checks.**

- For trivial log structure R^iε_*F=0 for i>0 (ε is an isomorphism of sites).
- On an fs log point Spa(k) with M̄=N and n invertible in k: R^1ε_*(μ_n)≅Z/n, R^1ε_*(Z/n)≅Z/n(−1), and R^iε_*=0 for i≥2.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site](#kummer-etale-site), [HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent](#finite-kummer-descent), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers](#kummer-root-covers), `ClassicalAdicEtaleCohomology:H0`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.4.27, p. 64. Lemma 4.4.27: stalks of R^iε_ét,*F are the continuous cohomology of π₁^két of the strictly local log point, part (1).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Discussion before Lemma 4.4.29, p. 64. Exactness of the Kummer sequence for M^gp on X_két, the input of (4.4.28).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), (4.4.28), p. 65. The map M̄^gp/nM̄^gp→R^1ε_ét,*(μ_n) of part (2) and its identification with Lemma 4.4.27.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.4.29, p. 65. Part (3); the source prints the target R^iε_ét,*(μ_n), corrected here to R^iε_ét,*(μ_n^{⊗i}) (see the source issue); Lemma 4.6.2 (p. 69) uses the equivalent form ∧^i(M̄^gp/n)(−i)≅R^iε_ét,*(Z/n).

**Uses.**

- PrismaticCohomology:PR.8/log-scheme-vs-log-adic-kummer (Koshikawa–Yao II Lemma 6.5): Identifies R^iε_*(Z/n) on the adic side with ∧^i(M^gp/nM^gp)(−i), to compare with Kato–Nakayama on the scheme side.
- PrismaticCohomology:PR.8/log-diamond (Koshikawa–Yao II Example 7.6): Uses the Kummer étale site of an fs log adic space and its projection to the underlying étale site.
- DLLZ-adic Lemma 4.6.2: Input to the purity theorem 4.6.1 (boundary-local-system-extension).

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="rigid-abhyankar"></a>

### Rigid logarithmic Abhyankar lemma

`HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar` · theorem · proposed declaration `TauCeti.LogAdic.rigid_abhyankar`.

Let X be a smooth rigid analytic variety over a nonarchimedean field k of characteristic zero, D⊂X a normal crossings divisor (étale locally, equivalently analytic locally after a finite separable extension of k, of the form S×{T₁⋯T_m=0}⊂S×D^m; strict normal crossings is a special case) with the fs log structure of Example 2.3.17, and U=X−D. Every finite étale surjective h:V→U extends to a finite surjective Kummer étale f:Y→X, where Y is a normal rigid analytic variety with the log structure defined by f⁻¹(D); Y_an has a basis of affinoids W with π₀(W∩f⁻¹(U))=π₀(W). Locally, on X_ρ=S×D^r_ρ with ρ=p^{−b(d,p)} and after a finite extension of k and a strictly finite étale cover of S, each component of Y_ρ is S⟨Q⟩_ρ for a toric Q with N^r⊂Q⊂⊕_i(1/d_i)N, d_i≤d=deg f, and the pullback of Y to X_ρ^{1/m}, m=d!, splits completely and so is strictly finite étale.

**Hypotheses and conventions.**

- char k=0, X smooth, D normal crossings in the sense of Example 2.3.17; h finite étale surjective; nothing is assumed about h over D.
- The splitting statement is local on X and holds after finite extension of k; the radius ρ depends only on d and p.

**Construction or proof route.**

1. Extend h to a finite ramified cover by a normal rigid variety Y ([Han20, Thm. 1.6], after [Lüt93, Thm. 3.1]); the basis statement follows from the unique extension of bounded functions across f⁻¹(D) ([Bar76, §3]).
2. Kummer étaleness is analytic local on X up to finite extension of k: reduce to X=S×D^r, D=S×{T₁⋯T_r=0}, with chart P=N^r.
3. Lemma 4.2.3, by induction on r using [Lüt93, Lem. 3.2] to extract d_r-th roots of T_r over a punctured polydisc of radius ρ and [Bar76] to extend them, gives the cover-refinement hypothesis of Lemma 4.2.2 with d_i≤d.
4. Lemma 4.2.2: components of Y_ρ are quotients of S⟨P′⟩_ρ by subgroups of the Galois group of Proposition 4.1.6, hence S⟨Q⟩_ρ with Q toric, identified by normality and uniqueness of normal extensions; (Q⊕_P(1/m)P)^sat is (1/m)P times a finite group, giving the splitting.

**Acceptance checks.**

- The n-th root cover of the punctured disc extends as its log root cover, not as an ordinarily étale disc cover.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log](#divisorial-analytic-log), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers](#kummer-root-covers), `AdicSpacesPartII:R0`, `AdicSpacesPartII:R3/finite-morphism-coherent-algebra-equivalence`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.2.1, p. 47. The extension statement; the proposition's hypotheses (smooth X over k of characteristic zero, D a normal crossings divisor) are kept, SNC being a special case.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 4.2.1, proof, p. 47. The external normal-extension input of proof step 1.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.2.3, p. 48. The bound d_i≤d and, in the same lemma, ρ=p^{−b(d,p)} and m=d!.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.2.2, p. 48. The local strictification after the root cover X_ρ^{1/m}.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="boundary-local-system-extension"></a>

### Extension across a normal crossings boundary

`HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension` · theorem · proposed declaration `TauCeti.LogAdic.boundary_local_system_extension`.

Let X be a smooth rigid analytic variety over a nonarchimedean field k with char(k)=0 and k⁺=O_k, D⊂X a normal crossings divisor with the log structure of Example 2.3.17, U=X−D and j:U↪X (so U_két=U_ét). For every torsion local system L on U_ét, j_két,*L is a torsion local system on X_két and R^ij_két,*L=0 for i>0; hence H^i(U_ét,L)≅H^i(X_két,j_két,*L) for all i≥0. Conversely every torsion local system L̄ on X_két satisfies L̄≅j_két,*j⁻¹L̄, so restriction and j_két,* are inverse equivalences between torsion local systems on X_két and on U_ét. In particular Z/n≅Rj_két,*(Z/n), Rε_ét,*(Z/n)≅Rj_ét,*(Z/n) and R^ij_ét,*(Z/n)≅∧^i(M̄^gp_X/nM̄^gp_X)(−i). No properness is assumed; finiteness of cohomology is a separate statement for proper X.

**Hypotheses and conventions.**

- char k=0 and k⁺=O_k, as in Theorem 4.6.1; D normal crossings (strict normal crossings is a special case).
- Corollary 4.6.7 is stated for F_p-local systems; its proof (L̄→Rj_két,*j⁻¹L̄ is a map of local systems that is the identity on the dense open U) applies verbatim to torsion local systems, which is the form recorded here.

**Construction or proof route.**

1. Trivialise L on a finite étale cover V→U and extend it by rigid Abhyankar (Proposition 4.2.1) to a finite Kummer étale Y→X with Y normal; sections of constant torsion sheaves over the preimage of U extend uniquely over every Kummer étale Y′→Y (Example 2.2.20, Proposition 4.1.6, Corollary 4.1.9), so j_két,*L is constant on Y and a local system on X.
2. Étale locally take X^{1/m}→X as in Lemma 4.2.5 so that Z=Y×_X X^{1/m} is smooth with a normal crossings log structure and Z→X is Kummer étale; this reduces the vanishing to L=Z/n.
3. Lemma 4.6.2: Rε_ét,*(Z/n)→Rj_ét,*(Z/n) is an isomorphism, by Lemma 4.4.29 (in its twisted form) and, étale locally after algebraising D, Huber's comparison [Hub96, Prop. 2.1.4, Thm. 3.8.1] with log purity for schemes [Ill02, Thm. 7.2].
4. Lemma 4.6.5: the cone of Z/n→Rj_két,*(Z/n) has vanishing cohomology on every composite of an étale covering and a standard Kummer étale cover, by Lemma 4.6.2 applied to it; Corollary 4.6.7 then follows by adjunction.

**Acceptance checks.**

- For empty boundary this is the identity; this alone gives no finiteness statement for a nonproper disc.
- For the punctured unit disc and L=Z/n, R^1j_ét,*(Z/n) is Z/n(−1) supported at 0, while R^1j_két,*(Z/n)=0.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar](#rigid-abhyankar), [HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent](#finite-kummer-descent), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers](#kummer-root-covers), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site](#kummer-etale-site), [HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log](#divisorial-analytic-log), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-higher-direct-images](#kummer-etale-higher-direct-images), `ClassicalAdicEtaleCohomology:H0/torsion-local-systems`, `ClassicalAdicEtaleCohomology:H0/local-systems-and-finite-etale-covers`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.6.1, p. 68. The hypotheses of the purity theorem (including k⁺=O_k); its conclusion, j_két,*L a torsion local system with vanishing higher direct images, follows in the same sentence.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 4.6.1, proof, p. 69. The reduction to constant coefficients through root covers (proof steps 2–4).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 4.6.2, proof, p. 69. Lemma 4.6.2 rests on the higher-direct-image computation of Lemma 4.4.29 and the algebraic purity comparison.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 4.6.7, p. 69. The converse half of the equivalence, stated for F_p and extended here to torsion coefficients by the same proof.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

## The pro-Kummer site, perfectoid basis and local systems

The corrected covering condition builds the pro-Kummer topology. All-root toric presentations produce its log perfectoid basis and completed sheaves, after which p-adic local systems and their boundary monodromy are defined.

- [Pro-Kummer étale presentations](#pro-kummer-presentations)
- [Corrected transfinite pro-Kummer coverings](#corrected-pro-kummer-covers)
- [The corrected pro-Kummer étale site](#pro-kummer-etale-site)
- [Pro-Kummer projection and cohomological descent](#log-site-projections)
- [All-root toric Kummer towers](#all-root-toric-tower)
- [Log affinoid perfectoid pro-objects](#log-affinoid-perfectoid)
- [Perfectoid basis and Kummer strictification](#log-perfectoid-basis)
- [Completed and tilted structural log sheaves](#completed-structural-log-sheaves)
- [Almost acyclicity on log perfectoid objects](#log-perfectoid-almost-acyclicity)
- [Kummer étale p-adic local systems](#kummer-padic-local-systems)
- [Completion of Kummer local systems](#completed-kummer-local-systems)
- [Unipotent geometric boundary monodromy](#geometric-boundary-monodromy)

<a id="pro-kummer-presentations"></a>

### Pro-Kummer étale presentations

`HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations` · definition · proposed declaration `TauCeti.LogAdic.ProKummerPresentation`.

Let X be a locally noetherian fs log adic space; objects of pro-X_két are cofiltered limits U=lim_{i∈I}U_i of objects of X_két, with |U|:=lim|U_i|. A morphism U→V of pro-X_két is Kummer étale (resp. finite Kummer étale, étale, finite étale) if it is the pullback along some V→V₀ of a Kummer étale (resp. finite Kummer étale, strictly étale, strictly finite étale) morphism U₀→V₀ of X_két; this is a condition on the pro-morphism, stronger than a property of |U|→|V|. U→V is pro-Kummer étale if U=lim_i U_i with each U_i→V Kummer étale and U_j→U_i finite Kummer étale and surjective for all sufficiently large i (a pro-Kummer étale presentation), and pro-finite Kummer étale if moreover all U_i→V are finite Kummer étale. All these classes are stable under base change (the fibre products exist and |U×_V W|→|U|×_{|V|}|W| is surjective); the finite-stage classes are stable under composition; pro-Kummer étale morphisms are open; over W∈X_prokét, composites of pro-Kummer étale morphisms are pro-Kummer étale with source in X_prokét; and finite limits exist in X_prokét.

**Hypotheses and conventions.**

- Cofiltered small presentations as in [Sch13a, Prop. 3.2]; the eventual clause of Definition 5.1.1(2) ('for all i≥i₀') is part of the definition, not a consequence of surjectivity of |U|→|V|.

**Construction or proof route.**

1. Use the description of pro-C by cofiltered diagrams with Mor(F,G)=lim_J colim_I Mor(F_i,G_j).
2. Lemma 5.1.4(1)–(7), following [Sch13a, Lem. 3.10], with Propositions 2.3.23, 2.3.27 and 2.3.32, Corollary 4.1.9 (openness) and Proposition 4.1.14 (base change).
3. Cofinal reindexing changes neither the pro-object nor the eventual condition.

**Acceptance checks.**

- A constant Kummer object is allowed; no perfectoid condition is required.

**Planning API.**

- `TauCeti.LogAdic.ProKummerPresentation` (constructor): A cofiltered finite-level Kummer presentation with eventually finite surjective transitions.
- `TauCeti.LogAdic.ProKummerPresentation.reindex` (equivalence): Cofinal reindexing represents the same pro-object.
- `TauCeti.LogAdic.ProKummerPresentation.base_change` (functoriality): Base change of the finite-level presentation represents the fs pullback pro-object, and |U×_V W|→|U|×_{|V|}|W| is surjective (Lemma 5.1.4(1)).
- `TauCeti.LogAdic.ProKummerPresentation.comp` (functoriality): Over W∈X_prokét, a composite U→V→W of pro-Kummer étale (resp. pro-finite Kummer étale) morphisms is pro-Kummer étale (resp. pro-finite Kummer étale) and U, V lie in X_prokét (Lemma 5.1.4(6)).
- `TauCeti.LogAdic.ProKummerPresentation.isOpenMap` (compatibility): Pro-Kummer étale morphisms induce open maps of underlying spaces (Lemma 5.1.4(4)).
- `TauCeti.LogAdic.ProKummerPresentation.IsProFinite` (structure): The presentation is pro-finite Kummer étale when every U_i→V is finite Kummer étale (Definition 5.1.1(3)).

**Discriminating unit tests.**

- `TauCeti.LogAdic.ProKummerPresentation.constant` (degenerate): Every Kummer étale U→X in X_két is pro-Kummer étale via the one-term presentation.
- `TauCeti.LogAdic.ProKummerPresentation.root_tower` (computation): For X with a global sharp fs chart P over a characteristic-zero field, the divisibility-indexed system of root covers X^{1/m} is a pro-finite Kummer étale presentation over X.
- `TauCeti.LogAdic.ProKummerPresentation.eventual_surjectivity` (non-example): On the closed unit disc X with trivial log structure, the system of rational discs {|T|≤|ϖ|^n} has no eventually surjective transitions, and its limit is not pro-Kummer étale over X under any presentation: its image {T=0} in |X| is not open, while pro-Kummer étale maps are open.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site](#kummer-etale-site), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-morphism](#kummer-etale-morphism), `AdicEtaleGeometry:A1/pro-etale-morphism`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.1(1), p. 70. Finite-stage Kummer étale morphisms in the pro-category are pullbacks of morphisms of X_két.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.1(2), p. 70. The pro-Kummer étale presentation with its eventual finite surjective clause.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 5.1.4(4), p. 71. Openness (api isOpenMap), which excludes the shrinking-disc system of the non-example test.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 5.1.4(7), p. 71. Finite limits; parts (1), (2), (5), (6) give base change, composition and the surjective-pullback property.

**Uses.**

- DLLZ-adic Definition 5.1.2: Provides the objects of the pro-Kummer site.
- DLLZ-adic Definition 5.3.1: Adds sharp charts and perfectoid completion to this presentation.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="corrected-pro-kummer-covers"></a>

### Corrected transfinite pro-Kummer coverings

`HodgeTateAndCanonicalSubgroups:T6:log-sites/corrected-pro-kummer-covers` · definition · proposed declaration `TauCeti.LogAdic.CorrectedProKummerCover`.

Let U∈X_prokét. A covering of U is a family of pro-Kummer étale morphisms {f_a:U_a→U} with |U|=∪f_a(|U_a|) such that each f_a is an inverse limit U_a=lim_{μ<λ}U_μ→U over the ordinals less than some ordinal λ, with every U_μ∈X_prokét, U₀=U the initial term, and, for each μ<λ, U_μ→U_{<μ}:=lim_{μ′<μ}U_{μ′} (limits over U, the empty one being U) the pullback of a Kummer étale morphism of X_két, and the pullback of a surjective finite Kummer étale morphism of X_két for all sufficiently large μ. This is DLLZ Definition 5.1.2, the log analogue of the transfinite covering condition of Scholze's corrigendum [Sch16] to the pro-étale site of [Sch13a]; 'corrected' refers to that corrigendum. These tower conditions, not arbitrary jointly surjective families of pro-Kummer étale morphisms, define the coverings; they are stable under base change and composition.

**Hypotheses and conventions.**

- Use Definition 5.1.2(1)–(3) exactly, including the eventual surjective finite clause; joint surjectivity is on |U|=lim|U_i|, all points included.

**Construction or proof route.**

1. Record the ordinal tower as data attached to each member of the family.
2. Base change (Lemma 5.1.4(8)): pull the tower back termwise (Lemma 5.1.4(1)); for surjectivity reduce to quasi-compact U, a finite covering, and then a single map.
3. Composition: concatenate the towers along the ordinal sum, the second tower starting at the limit of the first; the eventual clause holds in the tail of the second tower. DLLZ leave this implicit, as in [Sch16].
4. A jointly surjective family of X_két gives the two-term towers U₀=U, U₁=U_a; an ℕ-indexed surjective presentation gives a tower of type ω, using Lemma 5.1.4(5)–(6).

**Acceptance checks.**

- Keep the transfinite certificate with the covering family.

**Planning API.**

- `TauCeti.LogAdic.CorrectedProKummerCover` (constructor): A joint-surjectivity proof plus the ordinal tower certificates with eventual finite-surjective steps.
- `TauCeti.LogAdic.CorrectedProKummerCover.pullback` (functoriality): Pullback of a certified cover is a certified cover (Lemma 5.1.4(8)).
- `TauCeti.LogAdic.CorrectedProKummerCover.refinement` (structure): Composite coverings are coverings, certified by the ordinal-sum concatenation of towers with the same step conditions.
- `TauCeti.LogAdic.CorrectedProKummerCover.ofCountablePresentation` (constructor): A surjective pro-Kummer étale U→V with an ℕ-indexed presentation is a one-member covering, certified by a tower of type ω.

**Discriminating unit tests.**

- `TauCeti.LogAdic.CorrectedProKummerCover.identity` (degenerate): The identity family is a cover.
- `TauCeti.LogAdic.CorrectedProKummerCover.finite_stage` (compatibility): Every finite-stage jointly surjective Kummer étale family gives a cover of constant pro-objects.
- `TauCeti.LogAdic.CorrectedProKummerCover.need_tower` (non-example): On the closed unit disc X with trivial log structure, {X−{0}→X, lim_n{|T|≤|ϖ|^n}→X} is jointly surjective and each member is a transfinite limit of pullbacks of étale maps, but it is not a covering: the second tower never has surjective finite steps (and its limit is not pro-Kummer étale, its image not being open).
- `TauCeti.LogAdic.CorrectedProKummerCover.root_tower` (computation): For X with a global sharp fs chart over a characteristic-zero field, {lim_m X^{1/m}→X} is a covering, certified by the ω-tower of the root covers X^{1/n!}.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations](#pro-kummer-presentations), `AdicEtaleGeometry:A1/corrected-covers-pretopology`, `mathlib:CategoryTheory.GrothendieckTopology`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.2, p. 70. The covering condition is introduced with an explicit reference to [Sch16]; the three conditions follow.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.2(3), p. 70. The step condition of the ordinal tower, with its eventual surjective finite clause.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 5.1.4(8), p. 71. Pullback stability (api pullback).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Bibliography, [Sch16], p. 99. [Sch16] is Scholze's corrigendum, the source of the transfinite covering condition that the word 'corrected' refers to.

**Uses.**

- DLLZ-adic Proposition 5.1.5: Needed for the algebraic topos and qcqs basis.
- DLLZ-adic Proposition 5.3.13: Refinement is used for acyclic torsion covers.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="pro-kummer-etale-site"></a>

### The corrected pro-Kummer étale site

`HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site` · construction · proposed declaration `TauCeti.LogAdic.ProKummerEtaleSite`.

Atlas planet: **Pro-Kummer étale site**.

For a locally noetherian fs log adic space X, X_prokét is the full subcategory of pro-X_két of objects pro-Kummer étale over X, with the coverings of Definition 5.1.2 (a pretopology: Lemma 5.1.4(8) and tower concatenation); finite limits exist. Objects with a pro-Kummer étale presentation by affinoids are quasi-compact and quasi-separated, generate X_prokét and are stable under fibre products; the topos is algebraic; U is quasi-compact (resp. quasi-separated) iff |U| is, likewise for morphisms; X_prokét is quasi-separated (resp. coherent) iff |X| is. Constant objects give the projection ν:X_prokét→X_két, and f:Y→X induces f_prokét. For trivial log structure X_két=X_ét (Remark 4.1.17) and X_prokét is the pro-étale site of [Sch13a] with the covering condition of [Sch16], not the naive covering definition; this comparison follows from the definitions and is not separately stated in DLLZ. The pro-finite Kummer étale site X_profkét has underlying category pro-X_fkét and transfinite-tower coverings by pro-finite Kummer étale maps (Definition 5.1.9); for a profinite group G, G-PFSets is the category of profinite sets with continuous G-action with the analogous coverings (Definition 5.1.10). If X is connected and ζ is a log geometric point, U=lim_i U_i↦S(U)=lim_i Mor_X(ζ,U_i) is an equivalence of sites X_profkét≃π_1^két(X,ζ)-PFSets, matching coverings (Proposition 5.1.12).

**Hypotheses and conventions.**

- X locally noetherian fs, pro-objects and covers as the preceding definitions.

**Construction or proof route.**

1. Definition 5.1.2 with Lemma 5.1.4(6)–(8) for the pretopology and finite limits.
2. Proposition 5.1.5 via openness of pro-Kummer étale maps (Lemma 5.1.4(4)) and the arguments of [Sch13a, Prop. 3.12] as corrected in [Sch16].
3. ν from the constant-object functor X_két→X_prokét, which preserves fibre products and coverings; f_prokét by base change of presentations (opening of §5.2).
4. Trivial log: compare categories (Remark 4.1.17(1)) and the covering conditions term by term.
5. Proposition 5.1.12: by Corollary 4.4.18, X_fkét≃π_1^két(X,ζ)-FSets; pass to pro-categories, use G-PFSets≃pro-(G-FSets) (Remark 5.1.11), and compare the covering conditions of Definitions 5.1.9 and 5.1.10.

**Acceptance checks.**

- Its structure sheaves are defined by inverse image, not ad hoc values on the completed perfectoid space.

**Planning API.**

- `TauCeti.LogAdic.ProKummerEtaleSite` (constructor): The category, the Definition 5.1.2 coverings and the qcqs basis.
- `TauCeti.LogAdic.ProKummerEtaleSite.nu` (projection): The site morphism ν induced by constant Kummer objects.
- `TauCeti.LogAdic.ProKummerEtaleSite.pullback` (functoriality): Fs log maps induce pullback functors on the pro-Kummer topoi.
- `TauCeti.LogAdic.ProKummerEtaleSite.trivial_log` (equivalence): Trivial logs recover the corrected ordinary pro-étale site.
- `TauCeti.LogAdic.ProKummerEtaleSite.qcqs_basis` (structure): Objects with affinoid pro-Kummer étale presentations are qcqs, generate the site and are stable under fibre products (Proposition 5.1.5(1)–(2)).
- `TauCeti.LogAdic.ProKummerEtaleSite.hasFiniteLimits` (structure): X_prokét has all finite limits (Lemma 5.1.4(7)).
- `TauCeti.LogAdic.ProKummerEtaleSite.isQuasiCompact_iff` (characterisation): An object (resp. morphism) is quasi-compact or quasi-separated iff its underlying space (resp. map) is (Proposition 5.1.5(4), (6)).
- `TauCeti.LogAdic.ProKummerEtaleSite.profinite_galois_equivalence` (equivalence): For connected X with log geometric point ζ, U=lim U_i↦lim_i Mor_X(ζ,U_i) is an equivalence of sites X_profkét≃π_1^két(X,ζ)-PFSets compatible with coverings (Proposition 5.1.12).

**Discriminating unit tests.**

- `TauCeti.LogAdic.ProKummerEtaleSite.final_object` (degenerate): Constant X is final in the site category.
- `TauCeti.LogAdic.ProKummerEtaleSite.constant_root` (computation): A finite root cover of X gives a constant covering object of X_prokét.
- `TauCeti.LogAdic.ProKummerEtaleSite.ordinary_compatibility` (compatibility): On a trivially logged X, the ν projection matches the ordinary corrected ν under the site equivalence.
- `TauCeti.LogAdic.ProKummerEtaleSite.log_point_root_tower` (computation): For the split fs log point s=(Spa(l,l⁺),N) with l algebraically closed of characteristic zero, π_1^két(s)≅Ẑ(1) (Corollary 4.4.22), and the root tower lim_m s^{1/m} corresponds under Proposition 5.1.12 to Ẑ(1) with its translation action.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/corrected-pro-kummer-covers](#corrected-pro-kummer-covers), [HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations](#pro-kummer-presentations), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site](#kummer-etale-site), `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `mathlib:CategoryTheory.Sheaf`, [HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent](#finite-kummer-descent), `AdicEtaleGeometry:A1/profinite-g-sets-site`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.2, p. 70. The underlying category; the coverings are those of corrected-pro-kummer-covers.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.1.5(1), p. 71. The qcqs basis of affinoid presentations (api qcqs_basis); parts (2)–(7) give generation, algebraicity and the topological qcqs criteria.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.1.5(7), p. 72. Coherence of the site in terms of |X|.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), §5.1, p. 72. The projection ν (written υ in the source).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.1.9, p. 72. Defines the pro-finite Kummer étale site added to the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.1.12, p. 73. States the equivalence X_profkét≃π_1^két(X,ζ)-PFSets; its proof also matches the coverings.

**Uses.**

- DLLZ-RH §2.2: All period sheaves are defined on this site.
- PrismaticCohomology:PR.8: Uses the early site construction independently of P8.
- DLLZ-adic Lemma 5.2.3 and Proposition 6.1.1: Pro-finite Kummer étale Galois covers are described by profinite π_1^két-sets.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="log-site-projections"></a>

### Pro-Kummer projection and cohomological descent

`HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections` · theorem · proposed declaration `TauCeti.LogAdic.log_site_projections`.

Let X be a locally noetherian fs log adic space and ν:X_prokét→X_két the projection. For every abelian sheaf F on X_két and every qcqs U=lim_i U_i in X_prokét (presented as in Proposition 5.1.5(1)), H^j(U_prokét,ν⁻¹F)=colim_i H^j(U_{i,két},F) for all j≥0. The unit F→Rν_*ν⁻¹F is an isomorphism; hence ν⁻¹:Sh_Ab(X_két)→Sh_Ab(X_prokét) is fully faithful and RΓ(X_két,F)≅RΓ(X_prokét,ν⁻¹F). The composites with ε_ét:X_két→X_ét and X_ét→X_an are the projections from X_prokét used later. In the setting of Theorem 4.6.1, for a torsion local system L on U_ét, H^i(U_ét,L)≅H^i(X_két,j_két,*L)≅H^i(X_prokét,ν⁻¹j_két,*L). For a quasi-compact quasi-separated morphism f:Y→X of locally noetherian fs log adic spaces and every abelian sheaf F on Y_két, the adjunction morphism ν_X⁻¹Rf_két,*(F)→Rf_prokét,*ν_Y⁻¹(F) is an isomorphism (Proposition 5.2.1).

**Hypotheses and conventions.**

- Use qcqs U and finite-level basis as in Proposition 5.1.6, not an unrestricted sections formula on arbitrary objects.

**Construction or proof route.**

1. Proposition 5.1.6: as [Sch13a, Lem. 3.16], using that affinoid presentations give a qcqs generating family stable under fibre products (Proposition 5.1.5(1)–(2)), so cohomology of qcqs objects commutes with the cofiltered limit.
2. Proposition 5.1.7: R^jν_*ν⁻¹F is the sheaf associated with U↦H^j(U_prokét,ν⁻¹F); for j=0 Proposition 5.1.6 gives F, for j>0 Kummer étale cohomology classes vanish locally. Corollary 5.1.8 follows.
3. Compose with Theorem 4.6.1 and Corollary 4.6.7 (boundary-local-system-extension) for the boundary statement.
4. Proposition 5.2.1: the i-th cohomology sheaves of both sides of the adjunction morphism are the sheafification of the presheaf U=lim_j U_j↦colim_j H^i(U_j×_X Y,F) on qcqs U in X_prokét (Proposition 5.1.6 on Y and quasi-compactness of f).

**Acceptance checks.**

- Constant torsion sheaves have the same Kummer and pro-Kummer cohomology.
- For f=id_X, Proposition 5.2.1 reduces to ν⁻¹F≅ν⁻¹F; for X=Spa(k,O_k) with k algebraically closed it identifies ν⁻¹ of the constant sheaf H^i(Y_két,F) with R^if_prokét,*ν⁻¹F.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site](#pro-kummer-etale-site), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site](#kummer-etale-site), [HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension](#boundary-local-system-extension), `AdicEtaleGeometry:A1/proetale-projection-nu`, `DiamondsAndVStacks:D0/quasicompact-objects-in-a-topos`, `DiamondsAndVStacks:D0/filtered-colimits-and-cohomology-on-coherent-sites`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.1.6, proof, p. 72. Proof of the colimit formula for qcqs U, which the node keeps restricted to qcqs objects.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.1.7, p. 72. The unit isomorphism.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 5.1.8, p. 72. Full faithfulness of ν⁻¹.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.2.1, p. 73. Hypothesis of the base-change isomorphism ν_X⁻¹Rf_két,*≅Rf_prokét,*ν_Y⁻¹ added to the node; f must be qcqs.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Proposition 5.2.1, p. 73. The proof the node follows: both sides compute the sheafified colimit of finite-level cohomology.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="all-root-toric-tower"></a>

### All-root toric Kummer towers

`HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower` · construction · proposed declaration `TauCeti.LogAdic.AllRootTower`.

Let P be a sharp fs monoid, (1/m)P its m-th root monoid and P_{Q≥0}=colim_m (1/m)P along the divisibility order (m|m′); P_{Q≥0} is uniquely n-divisible for every integer n≥1. (0) Toric charts (Proposition 3.1.10, Definition 3.1.12): a log smooth fs X over an affinoid field (k,k⁺) étale locally admits a toric chart, a strictly étale map X→Spa(k⟨P⟩,k⁺⟨P⟩) with P sharp fs that is a composition of rational localizations and finite étale maps. (a) Geometric tower (Lemma 5.3.4): if X is an analytic locally noetherian adic space over Spa(Z_p,Z_p) with trivial log structure, Y=X⟨P⟩ and lim_{i∈I} U_i is an affinoid perfectoid object of X_proét, then, with I×Z_{≥1} ordered by (i,m)≥(j,n) iff i≥j and n|m, the system U_i⟨(1/n)P⟩ is a pro-Kummer étale presentation over Y with an initial object, sharp fs charts (1/n)P, Kummer transition charts, perfectoid completed colimit and chart colimit P_{Q≥0}; it is a pro-Kummer étale (resp. pro-finite Kummer étale) cover of Y when lim U_i is a pro-étale (resp. pro-finite étale) cover of X. (b) Toric tower over a field (§6.1): for k a perfectoid field of characteristic zero containing all roots of unity, k⁺=O_k and E=Spa(k⟨P⟩,k⁺⟨P⟩), the tower Ẽ=lim_m E_m with E_m=Spa(k⟨(1/m)P⟩,k⁺⟨(1/m)P⟩) has associated perfectoid space Spa(k⟨P_{Q≥0}⟩,k⁺⟨P_{Q≥0}⟩); E_m→E is a Galois finite Kummer étale cover with group Γ/m=Hom(P^gp,μ_m), and Ẽ→E is a Galois pro-finite Kummer étale cover with group Γ=lim_m Γ/m=Hom(P^gp,Ẑ(1)). The finite-order characters of Γ are identified with P_Q^gp/P^gp, and k⁺[P_{Q≥0}]=⊕_χ k⁺[P_{Q≥0}]_χ, where the χ-summand is spanned by the e^a with a∈P_{Q≥0} of class χ; the trivial-character summand is k⁺[P] and every summand is a finite k⁺[P]-module (Lemma 6.1.6). Pullback along a toric chart V→E gives Ṽ=V×_E Ẽ=lim_m V_m. (c) Arithmetic tower (DLLZ-RH §2.3 and (3.3.4)): over a p-adic field k with k_m=k(μ_m) and k_∞=∪_m k_m, the tower of Spa(k_m⟨(1/m)P⟩,k_m⁺⟨(1/m)P⟩) has associated perfectoid space Spa(k̂_∞⟨P_{Q≥0}⟩,k̂_∞⁺⟨P_{Q≥0}⟩), and its Galois group Γ is an extension 1→Γ_geom→Γ→Gal(k_∞/k)→1 with Γ_geom=Hom(P^gp,Ẑ(1)) (≅Ẑ(1)^n for P=Z^n_{≥0}) on which Gal(k_∞/k) acts through the cyclotomic character.

**Hypotheses and conventions.**

- Characteristic zero; residue characteristic p wherever the tower is required to be perfectoid.
- In (b) k is perfectoid: DLLZ-adic §6.1 assumes only that k has characteristic zero and contains all roots of unity, but k⟨P_{Q≥0}⟩ is perfectoid only when k is (already for P=0); every application (Theorem 6.2.1) has k algebraically closed. In (c) k is a p-adic field in DLLZ-RH's sense (complete discretely valued, perfect residue field) and roots of unity are adjoined level by level.
- The index set is ordered by divisibility over all integers m≥1, not only powers of p.

**Construction or proof route.**

1. Toric charts: by Proposition 3.1.4 étale locally there is a strictly étale map to Spa(k⟨Q⟩,k⁺⟨Q⟩) with Q torsion-free fs; split Q≅Q̄⊕Z^r (Lemma 2.1.10) and compose with the rational localization Spa(k⟨Q⟩,k⁺⟨Q⟩)→Spa(k⟨P⟩,k⁺⟨P⟩), P=Q̄⊕Z^r_{≥0} (Proposition 3.1.10).
2. Geometric tower: each U_i⟨(1/n)P⟩→U_i⟨P⟩ is a finite Kummer étale root cover (Proposition 4.1.6, Lemma 2.2.15), transition charts (1/n)P→(1/m)P are Kummer for n|m, cofinality and the pro-Kummer étale cover property follow from Lemma 5.1.4, and the completed colimit is the completed R⟨P_{Q≥0}⟩ over the perfectoid completion R of colim U_i, which is perfectoid (Lemma 5.3.4).
3. Galois groups: Γ/m=Hom(((1/m)P)^gp/P^gp,μ_∞)≅Hom(P^gp,μ_m) acts on e^a by the character attached to the class of a, giving (6.1.3)–(6.1.4) and the decomposition (6.1.5); Lemma 6.1.6 uses P_{Q≥0}∩P^gp=P and a finite description of the cone of P to show each character summand is finite over k⁺[P].
4. Arithmetic tower: adjoin μ_m at level m; Gal(k_∞/k) acts on the root monomials through the cyclotomic character, which gives the extension (3.3.4).

**Acceptance checks.**

- The chart-limit divisibility is for every integer n, not just powers of p.
- For P=N, Γ/m≅μ_m and ζ∈μ_m acts by e^{1/m}↦ζ·e^{1/m}; the invariant summand of k⁺[N_{Q≥0}] is k⁺[N].

**Planning API.**

- `TauCeti.LogAdic.AllRootTower` (constructor): The divisibility-indexed root presentation together with its field/root-of-unity data.
- `TauCeti.LogAdic.AllRootTower.character_action` (simp): γ(e^a)=χ_a(γ)e^a on a root monomial.
- `TauCeti.LogAdic.AllRootTower.geometric_group` (characterisation): The geometric group is Hom(P^gp,Ẑ(1)).
- `TauCeti.LogAdic.AllRootTower.cyclotomic_conjugation` (relation): Arithmetic conjugation acts on the geometric Ẑ(1)-directions through the cyclotomic character.
- `TauCeti.LogAdic.AllRootTower.chart_limit_divisible` (characterisation): The chart colimit is P_{Q≥0}=colim_m (1/m)P, sharp, saturated and uniquely n-divisible for every n≥1.
- `TauCeti.LogAdic.AllRootTower.character_decomposition` (relation): k⁺[P_{Q≥0}]=⊕_χ k⁺[P_{Q≥0}]_χ over the finite-order characters χ∈P_Q^gp/P^gp of Γ; the trivial summand is k⁺[P] and each summand is a finite k⁺[P]-module (Lemma 6.1.6).
- `TauCeti.LogAdic.AllRootTower.exists_toric_chart` (other): A log smooth fs X over (k,k⁺) étale locally admits a toric chart X→Spa(k⟨P⟩,k⁺⟨P⟩), P sharp fs, that is a composition of rational localizations and finite étale maps (Proposition 3.1.10).

**Discriminating unit tests.**

- `TauCeti.LogAdic.AllRootTower.rank_zero` (degenerate): For P=0, the geometric root group is trivial.
- `TauCeti.LogAdic.AllRootTower.two_coordinates` (computation): For P=N² the geometric group is Ẑ(1)².
- `TauCeti.LogAdic.AllRootTower.p_only_insufficient` (non-example): The monoid N[1/p] is not q-divisible for a prime q≠p; its p-only tower does not satisfy the all-root chart-limit condition.
- `TauCeti.LogAdic.AllRootTower.trivial_character_summand` (characterisation): For P=N, the Γ-invariant summand of k⁺[N_{Q≥0}] is k⁺[N]: e^{1/2} lies in the summand of the character of order 2, not in the invariants.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers](#kummer-root-covers), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion](#log-smooth-chart-criterion), [HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations](#pro-kummer-presentations), `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `AdicEtaleGeometry:A4/perfectoid-uniform-completion`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 3.1.10 and Definition 3.1.12, pp. 24–25. States the existence of toric charts recorded in part (0); Definition 3.1.12 names such a map a toric chart.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 5.3.4, p. 75. Gives the divisibility-indexed geometric tower of part (a), which the lemma shows is log affinoid perfectoid and a pro-Kummer étale (pro-finite Kummer étale) cover.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), §6.1, (6.1.3)–(6.1.5) and Lemma 6.1.6, pp. 81–82. Part (b): the Galois groups Γ/m and Γ=Hom(P^gp,Ẑ(1)) of the toric tower and the character decomposition; the node adds the perfectoid hypothesis on k that the tower needs.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §2.3, p. 15, and (3.3.4), p. 29. Part (c): the arithmetic tower over k_m=k(μ_m) and the extension of Gal(k_∞/k) by Γ_geom with the cyclotomic action.

**Uses.**

- DLLZ-adic §6.1: Characters and Koszul computations prove local cohomology bounds.
- DLLZ-RH §3.3: Good finite-level models yield period pushforward acyclicity.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="log-affinoid-perfectoid"></a>

### Log affinoid perfectoid pro-objects

`HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid` · definition · proposed declaration `TauCeti.LogAdic.LogAffinoidPerfectoid`.

Atlas planet: **Log affinoid perfectoid objects**.

Let X be an analytic locally noetherian fs log adic space over Spa(Z_p,Z_p). An object U of X_prokét is log affinoid perfectoid if it has a pro-Kummer étale presentation U=lim_{i∈I} U_i, U_i=Spa(R_i,R_i⁺) with log structures, such that (1) I has an initial object 0; (2) each U_i has a global sharp fs chart P_i and each transition U_j→U_i is modeled on a Kummer chart P_i→P_j; (3) the completion (R,R⁺) of colim_i (R_i^u,R_i^{u+}), where (R_i^u,R_i^{u+}) is the uniformization of (R_i,R_i⁺), is a perfectoid affinoid algebra; (4) P=colim_i P_i is n-divisible for every n≥1, equivalently (P being sharp and saturated) uniquely n-divisible. Over Spa(Q_p,Z_p), (R,R⁺) is simply the p-adic completion of colim_i (R_i,R_i⁺). The associated Û=Spa(R,R⁺) is an affinoid perfectoid space and |Û|≃lim|U_i|; Û itself is not asserted to be an object of X_prokét.

**Hypotheses and conventions.**

- Analytic locally noetherian fs X over Spa(Z_p,Z_p); the structural-sheaf conclusions below use X over Q_p.

**Construction or proof route.**

1. Use Definition 5.3.1 with uniformization before completing the colimit; over Q_p use Remark 5.3.2 (R_i⁺/p^n≅R_i^{u+}/p^n).
2. Show all-integer divisibility of the chart limit and sharpness/saturation (Remark 5.3.3, Kummer charts are injective) and the topological identification of Lemma 5.3.6 (continuous valuations and Kedlaya–Liu Lemma 2.6.5 on rational subsets).
3. Use Lemma 5.3.7 for strict closed pullbacks and Lemma 5.3.8 (via the root covers of Lemma 4.2.5 and condition (4)) to make finite-level Kummer maps strict étale after passage to U.

**Acceptance checks.**

- The object/presentation and its completed affinoid realization are different data.

**Planning API.**

- `TauCeti.LogAdic.LogAffinoidPerfectoid` (constructor): The finite-stage sharp-chart presentation, all-integer divisibility and perfectoid completed-pair data.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.realization` (projection): The associated completed perfectoid Huber pair and its Spa.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.topology` (compatibility): The realization topology is canonically the inverse-limit topology of the presentation.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.strict_pullback` (functoriality): Strict closed pullback and Kummer étale localization preserve these objects with the source completion convention.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.isQcqs` (other): A log affinoid perfectoid object is quasi-compact and quasi-separated in X_prokét (Remark 5.3.3, from Proposition 5.1.5).
- `TauCeti.LogAdic.LogAffinoidPerfectoid.realization_map` (functoriality): U↦Û is a functor from log affinoid perfectoid objects to affinoid perfectoid spaces (Remark 5.3.5), compatible with the homeomorphism |Û|≅lim|U_i| of Lemma 5.3.6.

**Discriminating unit tests.**

- `TauCeti.LogAdic.LogAffinoidPerfectoid.trivial_chart` (compatibility): With zero characteristic chart the definition agrees with ordinary affinoid perfectoid pro-objects.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.all_divisibility` (characterisation): For each n>0 and a in colim P_i there is a unique b with nb=a.
- `TauCeti.LogAdic.LogAffinoidPerfectoid.no_p_only` (non-example): A presentation over a perfectoid base whose chart colimit is N[1/p] (the p-power root tower of a coordinate) is not a perfectoid presentation: condition (4) fails for every n>1 prime to p.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower](#all-root-toric-tower), [HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site](#pro-kummer-etale-site), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers](#kummer-root-covers), `AdicSpacesPartII:R0/uniformization`, `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `PerfectoidSpaces:P3/almost-purity-theorem`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.3.1, pp. 74–75. Defines the notion by conditions (1)–(4), which the node lists with the same hypotheses on X.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.3.1(3), p. 75. Fixes the completion convention of condition (3) recorded in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Remark 5.3.3, p. 75. Supports the equivalence of n-divisibility and unique n-divisibility of the chart colimit.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 5.3.8, p. 76. Hypothesis of the localization statement behind the strict_pullback API item; Remark 5.3.5 and Lemma 5.3.6 give the realization and its topology.

**Uses.**

- DLLZ-adic Theorem 5.4.3: Computes completed structural sheaves and almost cohomology.
- DLLZ-RH Definition 2.2.10: Defines periods by presentations on this basis.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="log-perfectoid-basis"></a>

### Perfectoid basis and Kummer strictification

`HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis` · theorem · proposed declaration `TauCeti.LogAdic.log_perfectoid_basis`.

Let X be an analytic locally noetherian fs log adic space over Spa(Z_p,Z_p). (1) The log affinoid perfectoid objects form a basis of X_prokét (Proposition 5.3.12) and are stable under fibre products, with (V×_U W)^≅V̂×_Û Ŵ (Proposition 5.3.11). (2) For a strict closed immersion Z→X and log affinoid perfectoid U, U×_X Z is log affinoid perfectoid in Z_prokét and (U×_X Z)^→Û is a closed immersion (Lemma 5.3.7). (3) If V→U is the pullback of a Kummer étale (resp. finite Kummer étale) map V₀→U₀ of affinoids in X_két, then V→U is étale (resp. finite étale), V is log affinoid perfectoid and V̂→Û is étale (resp. finite étale); V↦V̂ induces an equivalence of topoi Û_proét^∼≃(X_prokét/U)^∼ (Lemma 5.3.8). (4) X_prokét has a basis B of log affinoid perfectoid objects with H^i(X_prokét/V,ν⁻¹L)=0 for all V∈B, all p-torsion locally constant sheaves L on X_két and all i>0 (Proposition 5.3.13).

**Hypotheses and conventions.**

- Analytic locally noetherian fs X over Spa(Z_p,Z_p); neither log smoothness nor a perfectoid base field is required for Propositions 5.3.12–5.3.13.

**Construction or proof route.**

1. Lemma 5.3.8: by Lemma 4.2.5 a root cover U₀^{1/m} makes V₀ strictly étale; m-divisibility of the chart colimit factors P₀→(1/m)P₀→P_i, so the pullback is strictly étale at a finite stage; the topos equivalence follows from Kedlaya–Liu Lemma 2.6.5 and Proposition 2.6.8. Lemma 5.3.7 uses strictness, uniform quotients and Kedlaya–Liu Theorem 3.6.17(b).
2. Proposition 5.3.11: re-present V and W over a common chart system (Lemma 5.3.10) and use Scholze 2012 Proposition 6.18 for the perfectoid fibre product.
3. Proposition 5.3.12: localize to an affinoid X with a sharp chart, embed strictly into X⟨P⟩, pull back the tower of Lemma 5.3.4 over an affinoid perfectoid pro-étale cover (Scholze 2013 Proposition 4.8, Scholze 2017 Lemma 15.3) by Lemma 5.3.7, and conclude with Lemma 5.1.4 and Corollary 5.3.9.
4. Proposition 5.3.13: refine U to V with V̂ the completed universal cover Û_∞ (Lemma 5.3.8); L|V is trivial since finite Kummer étale covers of V split, and H^i(X_prokét/V,ν⁻¹L)≅H^i(V̂_proét,ν⁻¹L)≅H^i(V̂_ét,L)=0 by Scholze 2013 Corollary 3.17(i) and the argument of the last paragraph of the proof of Scholze 2013 Theorem 4.9 (Artin–Schreier on the tilt and almost acyclicity of O⁺ on affinoid perfectoid spaces), imported as ordinary perfectoid-space facts from PerfectoidSpaces:P3, not from P8.

**Acceptance checks.**

- Retain the analytic locally noetherian fs hypotheses; a smoothness assumption would unnecessarily weaken the source.
- For X with trivial log structure, (1) recovers the affinoid perfectoid basis of X_proét (Scholze 2013 Proposition 4.8).

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid](#log-affinoid-perfectoid), [HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower](#all-root-toric-tower), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-root-covers](#kummer-root-covers), [HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-presentations](#pro-kummer-presentations), `PerfectoidSpaces:P3/almost-purity-theorem`, `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `AdicEtaleGeometry:A4/perfectoid-uniform-completion`, `ClassicalAdicEtaleCohomology:H0`, `PerfectoidSpaces:P3/etale-almost-acyclicity`, `PerfectoidSpaces:P3/etale-site-tilting-equivalence`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.3.12, p. 77. States part (1), the basis property, under the same hypotheses on X.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.3.11, p. 77. Stability under fibre products in part (1).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 5.3.8, p. 76. Hypothesis of part (3); the lemma concludes étaleness, log affinoid perfectoidness and the equivalence of topoi.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.3.13, p. 78. Part (4): the basis on which inverse images of p-torsion locally constant sheaves are acyclic.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="completed-structural-log-sheaves"></a>

### Completed and tilted structural log sheaves

`HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves` · construction · proposed declaration `TauCeti.LogAdic.CompletedLogStructure`.

For X a locally noetherian fs log adic space over Spa(Q_p,Z_p), define on X_prokét: O⁺=ν⁻¹O⁺_két and O=ν⁻¹O_két; Ô⁺=lim_n O⁺/p^n and Ô=Ô⁺[1/p]; Ô^{♭+}=lim_Φ Ô⁺≅lim_Φ O⁺/p and Ô^♭=lim_Φ Ô, with transition maps Φ: x↦x^p; M=ν⁻¹M_két with α: M→O, and M♭=lim_{a↦a^p} M with the induced α♭: M♭→Ô♭. For every pro-Kummer étale presentation U=lim U_i, M(U)=colim_i M_{U_i}(U_i) (Proposition 5.4.2). Limits and localizations are formed in sheaves; ring sections alone do not define the topology.

**Hypotheses and conventions.**

- X locally noetherian fs over Spa(Q_p,Z_p); Frobenius is applied in characteristic p for the tilt.

**Construction or proof route.**

1. Use inverse image along ν and sheaf limits/quotients.
2. Construct the tilts as inverse limits along Frobenius and the compatible log structural maps α and α♭.
3. Proposition 5.4.2: as in Proposition 5.1.6, reduce exactness of the Čech sequence of the presheaf U↦colim M_{U_j}(U_j) to a single Kummer étale cover (Proposition 5.1.5, Scholze 2013 Lemma 3.16) and conclude by the sheaf property of M_két (Proposition 4.3.4).

**Acceptance checks.**

- Distinguish O⁺, Ô⁺ and their tilt before inverting p.

**Planning API.**

- `TauCeti.LogAdic.CompletedLogStructure` (constructor): The inverse-image, completed and tilted ring/monoid sheaves with their maps.
- `TauCeti.LogAdic.CompletedLogStructure.mod_p` (compatibility): On the perfectoid basis Ô⁺/p identifies with O⁺/p.
- `TauCeti.LogAdic.CompletedLogStructure.tilt_projection` (projection): The nth Frobenius-limit projection and the multiplicative sharp map.
- `TauCeti.LogAdic.CompletedLogStructure.functorial` (functoriality): Log pullback gives compatible maps of all structural sheaves and their completions.
- `TauCeti.LogAdic.CompletedLogStructure.monoid_sections` (characterisation): For every pro-Kummer étale presentation U=lim U_i, M(U)=colim_i M_{U_i}(U_i) (Proposition 5.4.2).

**Discriminating unit tests.**

- `TauCeti.LogAdic.CompletedLogStructure.constant_point` (computation): For a log affinoid perfectoid U whose associated perfectoid space is Spa(K,K⁺) with K a perfectoid field, Ô⁺(U)=K⁺ and Ô(U)=K.
- `TauCeti.LogAdic.CompletedLogStructure.frobenius_relation` (characterisation): A tilt sequence satisfies x_{n+1}^p=x_n modulo p.
- `TauCeti.LogAdic.CompletedLogStructure.not_localize_first` (non-example): Taking p-adic completion after inverting p yields zero quotients, so it cannot replace Ô⁺ followed by inversion.
- `TauCeti.LogAdic.CompletedLogStructure.trivial_log` (compatibility): If X has trivial log structure, X_prokét=X_proét and O⁺, Ô⁺, Ô, Ô^{♭+} are Scholze's sheaves of the same names, with M=O^× and α the inclusion.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections](#log-site-projections), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site](#kummer-etale-site), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid](#log-affinoid-perfectoid), `AdicEtaleGeometry:A1/etale-structure-sheaf`, `mathlib:AdicCompletion`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.4.1, p. 78. Introduces the integral, completed and tilted structure sheaves and the log structures α, α♭ defined in the node, with the same hypothesis on X.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 5.4.1(4), p. 78. Defines M=ν⁻¹M_két, its tilt M♭ and the structural maps.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 5.4.2, p. 78. Gives M(U)=colim M_{U_i}(U_i) for every pro-Kummer étale presentation, as in the monoid_sections API item.

**Uses.**

- DLLZ-RH Definition 2.2.3: The tilt and θ feed the ordinary period-ring functor on this site.
- DLLZ-adic Theorem 6.2.1: O⁺/p is the primitive-comparison coefficient sheaf.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="log-perfectoid-almost-acyclicity"></a>

### Almost acyclicity on log perfectoid objects

`HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity` · theorem · proposed declaration `TauCeti.LogAdic.log_perfectoid_almost_acyclicity`.

Let X be a locally noetherian fs log adic space over Spa(Q_p,Z_p) and U a log affinoid perfectoid object of X_prokét with Û=Spa(R,R⁺) and tilt (R♭,R^{♭+}). (1) O⁺(U)/p^n≅R⁺/p^n, canonically almost isomorphic to (O⁺/p^n)(U), for each n>0. (2) H^i(U,O⁺/p^n) and H^i(U,Ô⁺) are almost zero for all i>0. (3) Ô⁺(U)≅R⁺, Ô(U)≅R, and Ô⁺(U) is the p-adic completion of O⁺(U). (4) Ô^{♭+}(U)≅R^{♭+} and Ô^♭(U)≅R♭. (5) H^i(U,Ô^{♭+}) is almost zero for all i>0. (6) (Theorem 5.4.4) H↦H(U) is an equivalence from finite locally free Ô|_U-modules on X_prokét/U to finite projective Ô(U)-modules, with quasi-inverse H↦(V↦H⊗_{Ô(U)}Ô(V)) on log affinoid perfectoid V over U, and H^i(X_prokét/U,H)=0 for all i>0; in particular H^i(U,Ô)=0 for i>0.

**Hypotheses and conventions.**

- Use Theorems 5.4.3–5.4.4 with their locally noetherian fs/Q_p and basis hypotheses; retain the valuation ideal defining almost mathematics.
- Integral statements are almost; exact statements are (3), (4), (6) and the rational vanishing.

**Construction or proof route.**

1. By Proposition 5.3.12, sheaves on X_prokét are determined on log affinoid perfectoid objects; for (1)–(2) reduce, by Proposition 5.1.5 and the almost Čech criterion (Scholze 2013 Lemma 3.16), to Kummer étale covers pulled back from compositions of finite Kummer étale maps and rational localizations, which become étale over Û by Lemma 5.3.8; conclude with almost acyclicity of O⁺/p^n on affinoid perfectoid spaces (Scholze 2012 Theorem 7.13) and Scholze 2013 Lemma 3.18.
2. (3): the images of (O⁺/p^n)(U) in (O⁺/p^m)(U) are R⁺/p^m, so the inverse limit is R⁺.
3. (4)–(5): apply Scholze 2013 Lemma 3.18 to G=O⁺/p along Frobenius, then check the sheaf property of U↦R^{♭+} as the Frobenius limit of the exact sequences 0→R⁺/p→S⁺/p→T⁺/p.
4. (6): Lemma 5.3.8 reduces the equivalence to Kedlaya–Liu Theorem 9.2.15; the vanishing follows as in Liu–Zhu 2017 Proposition 2.3 with Lemma 5.1.4(3).

**Acceptance checks.**

- Integral higher cohomology is almost zero, not asserted to vanish exactly.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis](#log-perfectoid-basis), [HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves](#completed-structural-log-sheaves), [HodgeTateAndCanonicalSubgroups:T6:log-sites/pro-kummer-etale-site](#pro-kummer-etale-site), `PerfectoidSpaces:P3/almost-purity-theorem`, `PerfectoidSpaces:P0/almost-cech-acyclicity-criterion`, `EnhancedDerivedSheaves:E2`, `PerfectoidSpaces:P3/etale-almost-acyclicity`, `PerfectoidSpaces:P3/etale-site-tilting-equivalence`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 5.4.3, p. 79. Hypotheses of parts (1)–(5), which the node restates.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 5.4.3(3), p. 79. The exact identification Ô⁺(U)≅R⁺ with the p-adic completion of O⁺(U) in part (3).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 5.4.4, p. 80. Part (6): finite locally free Ô-modules over U and their higher cohomology vanishing.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="kummer-padic-local-systems"></a>

### Kummer étale p-adic local systems

`HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems` · definition · proposed declaration `TauCeti.LogAdic.KummerLisse`.

A lisse Z_p-sheaf on X_két is an inverse system L_n of locally constant finite-generated Z/p^n-module sheaves, isomorphic in the pro-category to one satisfying L_{n+1}/p^n≃L_n. Torsion is allowed. A Q_p-local system is an object of the stackification of the isogeny category, so a global Z_p lattice is not part of its definition.

**Hypotheses and conventions.**

- X a locally noetherian fs log adic space; no base field is needed for the definition.
- Use the finite-generated, not necessarily finite-free, convention of DLLZ Definition 6.3.1.

**Construction or proof route.**

1. Build the torsion-system category from finite Kummer local systems.
2. Localize morphisms by p and stackify for the rational category.
3. Use finite-level compatibility for morphisms, dual/tensor on the finite-free rational part.

**Acceptance checks.**

- Fp is a valid torsion Z_p-local system; rational tensor assertions use finite-rank local systems.

**Planning API.**

- `TauCeti.LogAdic.KummerLisse` (constructor): The compatible locally constant torsion system, with pro-isomorphism to a strict system.
- `TauCeti.LogAdic.KummerLisse.reduction` (projection): Evaluation at level n and the reduction isomorphism for a strict representative.
- `TauCeti.LogAdic.KummerLisse.rationalization` (functoriality): Pass to the isogeny stack to obtain the associated Q_p-local system.
- `TauCeti.LogAdic.KummerLisse.morphism` (characterisation): Morphisms are compatible pro-morphisms of torsion systems; rational morphisms are local isogeny morphisms glued in the stack.
- `TauCeti.LogAdic.KummerLisse.stalk` (projection): At a log geometric point ξ̃ the stalk L_ξ̃=lim_n (L_n)_ξ̃ of a strict representative is a finitely generated Z_p-module with a continuous action of π_1^két(X,ξ̃); for a Q_p-local system, Definition 6.3.7 tests monodromy on the Q_p-stalk (L_ξ̃ of a local Z_p-representative, ⊗Q_p) under the restricted action of π_1^két(X(ξ),ξ̃), X(ξ) the strict localization with pulled-back log structure.

**Discriminating unit tests.**

- `TauCeti.LogAdic.KummerLisse.constant_free` (computation): The constant system (Z/p^n)^r realizes a free rank-r Z_p-local system.
- `TauCeti.LogAdic.KummerLisse.constant_torsion` (non-example): The compatible constant Fp-system is permitted and is not free over Z_p.
- `TauCeti.LogAdic.KummerLisse.zero` (degenerate): The zero system has rank zero and rationalizes to zero.
- `TauCeti.LogAdic.KummerLisse.torsion_rationalizes_zero` (characterisation): The constant F_p-system (L_n=F_p with identity transitions) becomes zero in the isogeny category, so its associated Q_p-local system is 0, while Z_p itself rationalizes to the constant rank-one Q_p-local system.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent](#finite-kummer-descent), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-site](#kummer-etale-site), `DiamondsAndVStacks:D0/stackification`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 6.3.1(1), p. 88. Defines Z_p-local systems as inverse systems of locally constant sheaves of finitely generated Z/p^n-modules, pro-isomorphic to strict systems; torsion is allowed.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 6.3.1(2), p. 88. Defines Q_p-local systems through the stack of the isogeny category, as in the node.

**Uses.**

- DLLZ-adic Lemma 6.3.3: Completion transports these objects to the pro-Kummer site.
- DLLZ-RH §3.2: The rational stack is the input to log Riemann–Hilbert.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="completed-kummer-local-systems"></a>

### Completion of Kummer local systems

`HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems` · construction · proposed declaration `TauCeti.LogAdic.CompletedKummerLisse`.

Let X be a locally noetherian fs log adic space over Spa(Q_p,Z_p). On X_prokét let Ẑ_p=lim_n Z/p^n and Q̂_p=Ẑ_p[1/p]; a Ẑ_p-local system is a sheaf of Ẑ_p-modules locally isomorphic to L⊗_{Z_p}Ẑ_p for a finitely generated Z_p-module L, and Q̂_p-local systems are defined similarly. (1) L=(L_n)↦L̂=lim_n ν⁻¹(L_n) is an equivalence from Z_p-local systems on X_két to Ẑ_p-local systems on X_prokét, independent of the strict representative up to canonical isomorphism, and L̂⊗_{Ẑ_p}Q̂_p is a Q̂_p-local system. (2) R^i lim_n ν⁻¹(L_n)=0 for all i>0. (3) (Lemma 6.3.6) If ı:Z→X is a strict closed immersion of locally noetherian fs log adic spaces over Spa(Q_p,Z_p) and L̂ is a Q̂_p-local system on X_prokét, then for every log affinoid perfectoid U of X_prokét there is a canonical isomorphism (L̂⊗_{Q̂_p}Ô_X)(U)⊗_{Ô_X(U)}Ô_Z(U×_X Z)≅(ı_prokét⁻¹(L̂)⊗_{Q̂_p}Ô_Z)(U×_X Z).

**Hypotheses and conventions.**

- X locally noetherian fs over Spa(Q_p,Z_p); do not take an unrestricted inverse limit of arbitrary sheaves without acyclicity.
- The source asserts no equivalence for Q_p-local systems; only that L̂⊗Q̂_p is a Q̂_p-local system.

**Construction or proof route.**

1. Use the basis B of Proposition 5.3.13, on which the ν⁻¹(L_n) are acyclic.
2. Apply Scholze 2013 Lemma 3.18 (derived inverse limits over a basis with vanishing higher cohomology and surjective transition maps) to get (2) and L̂/p^n≅ν⁻¹(L_n) for strict systems.
3. Check the equivalence of (1) by reductions modulo p^n, local triviality on B and descent.
4. (3): U×_X Z is log affinoid perfectoid (Lemma 5.3.7) and Ô_X(U)→Ô_Z(U×_X Z) is surjective (Proposition 5.4.5, from Lemma 5.3.7 and Theorem 5.4.3); by Theorem 5.4.4 it suffices to check the isomorphism after passing to a log affinoid perfectoid V over U on which L̂ is trivial, where it is clear.

**Acceptance checks.**

- The construction commutes with finite direct sums and rationalization.

**Planning API.**

- `TauCeti.LogAdic.CompletedKummerLisse` (constructor): The inverse limit of ν⁻¹L_n over the completed coefficient ring.
- `TauCeti.LogAdic.CompletedKummerLisse.mod_pn` (compatibility): For a strict system the nth reduction agrees with ν⁻¹L_n.
- `TauCeti.LogAdic.CompletedKummerLisse.equivalence` (equivalence): Completion and reduction are quasi-inverse on the specified lisse categories.
- `TauCeti.LogAdic.CompletedKummerLisse.map_comp` (functoriality): Completion preserves identity and composition of local-system morphisms.
- `TauCeti.LogAdic.CompletedKummerLisse.rlim_vanishing` (relation): R^i lim_n ν⁻¹(L_n)=0 for all i>0, so L̂=R lim_n ν⁻¹(L_n) and RΓ(X_prokét,L̂)=R lim_n RΓ(X_két,L_n) (Lemma 6.3.3(2) with Proposition 5.1.7).
- `TauCeti.LogAdic.CompletedKummerLisse.rationalization` (functoriality): L̂⊗_{Ẑ_p}Q̂_p is a Q̂_p-local system on X_prokét, where Q̂_p=Ẑ_p[1/p] (Lemma 6.3.3(1)).
- `TauCeti.LogAdic.CompletedKummerLisse.closed_pullback_completed` (compatibility): For a strict closed immersion ı:Z→X over Spa(Q_p,Z_p), a Q̂_p-local system L̂ on X_prokét and log affinoid perfectoid U, (L̂⊗Ô_X)(U)⊗_{Ô_X(U)}Ô_Z(U×_X Z)≅(ı⁻¹L̂⊗Ô_Z)(U×_X Z) canonically (Lemma 6.3.6).

**Discriminating unit tests.**

- `TauCeti.LogAdic.CompletedKummerLisse.constant` (computation): A constant finite-generated Z_p module L completes to L⊗Z_p Ẑ_p.
- `TauCeti.LogAdic.CompletedKummerLisse.torsion` (compatibility): The constant Fp-system completes to the constant Fp-sheaf.
- `TauCeti.LogAdic.CompletedKummerLisse.representative` (characterisation): Pro-isomorphic strict representatives give canonically isomorphic completed local systems.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems](#kummer-padic-local-systems), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis](#log-perfectoid-basis), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections](#log-site-projections), `EnhancedDerivedSheaves:E2`, [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity](#log-perfectoid-almost-acyclicity), [HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves](#completed-structural-log-sheaves).

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 6.3.2, p. 88. Definition of Ẑ_p-local systems on X_prokét as sheaves locally isomorphic to L⊗Ẑ_p with L finitely generated.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 6.3.3(1), p. 88. The completion functor L↦L̂ is an equivalence onto Ẑ_p-local systems, as in part (1).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 6.3.3, proof, p. 88. The proof the node follows: the acyclic basis of Proposition 5.3.13 and Scholze's derived-limit lemma, giving part (2).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 6.3.6, p. 89. Hypotheses of part (3), the pullback of completed Q̂_p-local systems along strict closed immersions.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Lemma 6.3.6, p. 89. The proof followed in the node: Lemma 5.3.7, surjectivity of completed structure sheaves and Theorem 5.4.4.

**Uses.**

- DLLZ-RH §2.2 and §3.2: L̂ tensors with periods before geometric/arithmetic pushforward.
- DLLZ-RH Lemma 3.4.9: Restriction of L̂⊗B_dR-type sheaves to boundary strata Z_i, used for residues in normalized-log-residues.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

<a id="geometric-boundary-monodromy"></a>

### Unipotent geometric boundary monodromy

`HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy` · definition · proposed declaration `TauCeti.LogAdic.BoundaryMonodromy`.

Let k, X, D be as in Example 2.3.17 (X smooth rigid analytic over k, D a normal crossings divisor), U=X−D, and L a Q_p-local system on X_két. L|U_ét has unipotent (respectively quasi-unipotent) geometric monodromy along D if, for each geometric point ξ of D and each log geometric point ξ̃ above ξ, π_1^két(X(ξ),ξ̃) acts unipotently (respectively quasi-unipotently: an open subgroup acts unipotently) on the stalk L_ξ̃, where the strict localization X(ξ) carries the log structure pulled back from X. At a geometric point ξ where exactly r local branches of D meet, π_1^két(X(ξ))≅Hom(M̄^gp_ξ,Ẑ′(1))≅Ẑ′(1)^r (Corollary 4.4.22; Ẑ′(1)=Ẑ(1) when char k=0), a commuting product of one inertia factor per local branch; in the setting of Example 6.3.8 (each X_J smooth and geometrically connected), the branches at a point of the stratum U_J are the components D_j, j∈J, and this is Ẑ′(1)^J≅Γ^J. It suffices to test geometric points over the smooth locus of D (Lemma 6.3.11). For an irreducible component Z of D, L|U_ét has unipotent (respectively quasi-unipotent) geometric monodromy along Z if, at every geometric point ξ of Z lying over the smooth locus of D (so J={Z} and π_1^két(X(ξ))≅Ẑ′(1)), this inertia acts unipotently (respectively quasi-unipotently) on L_ξ̃; equivalently, by the specialization argument of Lemma 6.3.11, at every geometric point ξ of Z the factors of π_1^két(X(ξ)) indexed by the local branches of Z at ξ do. L|U_ét has unipotent (respectively quasi-unipotent) geometric monodromy along D if and only if it does along every irreducible component of D (Lemma 6.3.11, Remark 6.3.13).

**Hypotheses and conventions.**

- This is geometric inertia, not the whole arithmetic Galois group.
- X, D, k as in Example 2.3.17 (normal crossings, not necessarily strict); L a Q_p-local system on X_két; when char k=0 and k⁺=O_k (the setting of Theorem 4.6.1, assumed by Corollary 6.3.4), equivalently, by Corollary 6.3.4's extension statement, a Q_p-local system on U_ét.

**Construction or proof route.**

1. Use log geometric points and the Kummer fundamental group of the strict localization (Proposition 4.4.9, Corollary 4.4.22).
2. Define unipotence of the inertia action on the finite-dimensional stalk; for Q_p-local systems pass through an isogeny class of Z_p-local systems.
3. Lemma 6.3.11: after base change to a complete algebraically closed field and étale localization to a smooth toric chart X→D^n, use the toric tower of §6.1 to embed the inertia groups Γ^{J′}⊂Γ^J for J′⊂J and pass from geometric points ξ′ of U_{J′} lifted into Kummer étale neighbourhoods of ξ (U_J lies in the closure of U_{J′}), identifying π_1^két(X(ξ′))↪π_1^két(X(ξ)) with Γ^{J′}↪Γ^J; Γ^J is generated by the commuting Γ^{{j}}.
4. Per component: the smooth locus of D is the disjoint union of the strata U_{{j}}, so Lemma 6.3.11 splits the condition along D into one condition per component; at a point of Z on several strata, the Z-factor of Γ^J is the image of the inertia of a nearby point of U_{{Z}} (proof of Lemma 6.3.11), so both per-component formulations agree.

**Acceptance checks.**

- A finite nontrivial tame character is quasi-unipotent and is not unipotent.

**Planning API.**

- `TauCeti.LogAdic.BoundaryMonodromy` (constructor): The geometric inertia action with its specified log geometric stalk.
- `TauCeti.LogAdic.BoundaryMonodromy.logarithm` (data): For a unipotent generator, its finite logarithm is nilpotent; commuting generators give commuting logarithms.
- `TauCeti.LogAdic.BoundaryMonodromy.smooth_locus` (characterisation): Unipotence/quasi-unipotence can be checked on the smooth part of each boundary component.
- `TauCeti.LogAdic.BoundaryMonodromy.tensor` (compatibility): Tensor and dual of unipotent boundary local systems remain unipotent.
- `TauCeti.LogAdic.BoundaryMonodromy.unipotent_along` (characterisation): For an irreducible component Z of D: unipotence (quasi-unipotence) of the inertia Ẑ′(1) at geometric points of Z over the smooth locus of D; L|U has unipotent geometric monodromy along D iff it has along every component. This defines n_Z in DLLZ-RH Theorem 3.2.3(4).

**Discriminating unit tests.**

- `TauCeti.LogAdic.BoundaryMonodromy.trivial` (degenerate): The constant local system has zero logarithm and unipotent inertia.
- `TauCeti.LogAdic.BoundaryMonodromy.jordan` (computation): For U=[[1,1],[0,1]], log U=[[0,1],[0,0]] and its square is zero.
- `TauCeti.LogAdic.BoundaryMonodromy.finite_character` (non-example): A rank-one local system given by a finite-order character whose restriction to π_1^két(X(ξ)) is nontrivial for some geometric point ξ of D (e.g. the quadratic character of adjoining √T on the closed unit disc with D={T=0}, char k≠2) has quasi-unipotent but not unipotent geometric monodromy along D; a nontrivial finite-order character that is trivial on all these inertia groups has unipotent monodromy.
- `TauCeti.LogAdic.BoundaryMonodromy.componentwise` (characterisation): On X=D² over k with char k≠2 and D=Z₁∪Z₂, Z_i={T_i=0}, the rank-one Kummer local system on which γ₁ acts trivially and γ₂ by −1 (from adjoining √T₂) has unipotent geometric monodromy along Z₁ but not along Z₂, hence not along D.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems](#kummer-padic-local-systems), [HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent](#finite-kummer-descent), [HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower](#all-root-toric-tower), [HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log](#divisorial-analytic-log), `ClassicalAdicEtaleCohomology:H0`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 6.3.7, p. 89. The defining condition on the action of π_1^két(X(ξ),ξ̃) on stalks, with the strict localization convention kept in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), §6.3, before Definition 6.3.7, p. 89. Sets the normal crossings setting of Example 2.3.17 for the definition.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Example 6.3.8, p. 90. Identifies the local inertia with Γ^J on the strata U_J, as in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 6.3.11, p. 90. The smooth-locus reduction used in the smooth_locus API item.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Remark 6.3.13, p. 91. Componentwise formulation at geometric points over the generic points (smooth locus) of the components, via the algebraic analogue of Lemma 6.3.11.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.3(4), p. 25. Use of unipotent geometric monodromy along a single component Z, which the unipotent_along API item supplies.

**Uses.**

- DLLZ-RH Theorem 3.2.12: Controls tensor compatibility and nilpotent residues.
- AutomorphicBundles:B3.general: Canonical full-group coefficients have unipotent boundary monodromy.
- DLLZ-RH Theorem 3.2.3(4) and Corollary 3.5.7: n_Z, and nilpotence of Res_Z, use unipotence along a single component Z (log-rh-pullback).

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Sites`, namespace `TauCeti.LogAdic`.

## Logarithmic primitive comparison

Toric character cohomology supplies local almost calculations. Properness turns them into finiteness and the primitive comparison; the following consequences retain separate properness and lissity assumptions.

- [Toric character cohomology estimates](#toric-kummer-cohomology)
- [Proper log almost finiteness](#proper-log-almost-finiteness)
- [Logarithmic primitive comparison](#log-primitive-comparison)
- [Logarithmic cohomological finiteness and vanishing](#log-cohomology-finite-vanishing)
- [Proper p-adic boundary cohomology](#proper-padic-boundary-cohomology)
- [Kummer proper pushforward of p-adic local systems](#kummer-proper-pushforward-local-systems)

<a id="toric-kummer-cohomology"></a>

### Toric character cohomology estimates

`HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology` · theorem · proposed declaration `TauCeti.LogAdic.toric_kummer_cohomology`.

Let k be a perfectoid field of characteristic zero and residue characteristic p containing all roots of unity, k⁺=O_k, P a sharp fs monoid, V=Spa(S₁,S₁⁺) a log smooth affinoid fs log adic space over Spa(k,k⁺) with a toric chart V→E=Spa(k⟨P⟩,k⁺⟨P⟩), n=dim V, and L an F_p-local system on V_két. (1) H^i(V_két,L⊗_{F_p}O⁺_V/p) is almost zero for all i>n. (2) If V′⊂V is a rational subset strictly contained in V (the closure of V′ lies in V), the image of H^i(V_két,L⊗O⁺_V/p)→H^i(V′_két,L⊗O⁺_V/p) is an almost finitely generated k⁺-module for each i≥0. (3) (Lemma 6.1.7) Fix any r≥0 (independent of n=dim V). For Γ=Hom(P^gp,Ẑ(1)) and a k⁺/p^r-module M on which Γ acts through a primitive character χ:Γ→μ_m, every H^i(Γ,M) is killed by ζ_m−1 for any primitive m-th root of unity ζ_m; if moreover M≅M₀⊗_{k₀⁺/p^r}k⁺/p^r as Γ-modules for a finite extension k₀ of Q_p(μ_m) in k, a finitely generated k₀⁺/p^r-algebra T₀ and a finite T₀-module M₀, then H^i(Γ,M) is a finitely presented T₀⊗_{k₀⁺/p^r}k⁺/p^r-module.

**Hypotheses and conventions.**

- Strict containment means closure(V′)⊂V. For Lemma 6.1.7 the finite-presentation assertion requires its finite coefficient model.
- k perfectoid over Q_p: DLLZ-adic Proposition 6.1.1 assumes only that k has characteristic zero and contains all roots of unity, but its proof uses that Ẽ is log affinoid perfectoid, which needs k perfectoid (see sourceIssues); Theorem 6.2.1 applies it with k algebraically closed. Almost mathematics is with respect to the maximal ideal of O_k.

**Construction or proof route.**

1. Decompose k⁺[P_{Q≥0}] by the finite-order characters of Γ (Lemma 6.1.6) and compute H^i(Γ,M) by the Koszul complex of Γ≅Ẑ(1)^{rk P^gp} as in Scholze 2013 Lemma 5.5, with flat base change for the finite-presentation clause (Lemma 6.1.7, Remark 6.1.8).
2. For a log affinoid perfectoid U, H^i(U_két,L⊗O⁺/p) is almost zero for i>0 and its H^0 is almost finitely generated projective over R⁺/p (Lemma 6.1.11: Theorem 5.4.3 on a trivializing finite Kummer étale cover and almost faithfully flat descent).
3. (1): for the Galois cover Ṽ→V with group Γ, the Cartan–Leray spectral sequence with Propositions 5.1.7 and 5.1.12 and Scholze 2013 Proposition 3.7(iii) gives H^i(V_két,L⊗O⁺/p)≅^a H^i(Γ,L(Ṽ)); Γ has cohomological dimension n.
4. (2): choose rational V=V^{(1)}⊃⋯⊃V^{(n+2)}=V′, each strictly contained in the previous, approximate by finite levels (Lemma 6.1.9, analogue of Scholze 2013 Lemma 4.5), and use the Hochschild–Serre spectral sequence for mΓ⊂Γ, Remark 6.1.8 and Scholze 2013 Lemma 5.4.

**Acceptance checks.**

- For a nontrivial character χ of order m, every H^i(Γ,(k⁺/p)[P_{Q≥0}]_χ) is killed by ζ_m−1 (Lemma 6.1.7); for χ=1 the summand is (k⁺/p)[P] with trivial Γ-action and H^i(Γ,(k⁺/p)[P])≅(k⁺/p)[P]^{⊕C(r,i)}, r=rk P^gp, which is nonzero for 0≤i≤r.
- For P=0 and V=Spa(k,O_k), Γ is trivial and H^i(V_két,O⁺/p) is almost zero for every i>0.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower](#all-root-toric-tower), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity](#log-perfectoid-almost-acyclicity), [HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent](#finite-kummer-descent), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections](#log-site-projections), `PerfectoidSpaces:P0/almost-faithfully-flat-descent`, `PadicHodgeTheory:P8`, `ClassicalAdicEtaleCohomology:H0`, `PerfectoidSpaces:P0/almost-finitely-generated-and-presented`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 6.1.1, p. 81. Hypotheses of Proposition 6.1.1; the node adds that k is perfectoid, which the proof uses.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 6.1.1(1), p. 81. Part (1): almost vanishing above the dimension.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proposition 6.1.1(2), p. 81. Part (2): almost finite generation of restriction images to strictly contained rational subsets.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 6.1.7, p. 83. Part (3): the character cohomology estimate and, in the same lemma, the finite-presentation clause.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="proper-log-almost-finiteness"></a>

### Proper log almost finiteness

`HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-almost-finiteness` · theorem · proposed declaration `TauCeti.LogAdic.proper_log_almost_finiteness`.

Let (k,k⁺) be an affinoid field with k algebraically closed of characteristic zero and residue characteristic p, X a proper log smooth fs log adic space over Spa(k,k⁺) and L an F_p-local system on X_két. Then H^i(X_két,L⊗_{F_p}O⁺_X/p) is an almost finitely generated k⁺-module for each i≥0 and is almost zero for i sufficiently large. Almost mathematics is with respect to the maximal ideal m_k of O_k (contained in k⁺). This is an integral almost statement, not finite generation or vanishing before almost localization.

**Hypotheses and conventions.**

- Properness and log smoothness are both required; arbitrary open affinoids are excluded.
- k is over Q_p: the source states only 'characteristic zero', but the proof uses log affinoid perfectoid objects, which live over Spa(Z_p,Z_p) (see sourceIssues).

**Construction or proof route.**

1. Reduce to k⁺=O_k: for X′=X×_{Spa(k,k⁺)}Spa(k,O_k), compare the Čech spectral sequences of a covering by log affinoid perfectoid objects using Lemma 6.1.11 and Proposition 5.1.7.
2. Lemma 6.2.4: by Proposition 3.1.10 and the argument of Scholze 2013 Lemma 5.3 (properness), choose N affinoid étale coverings by chains V_h^{(N)}⊂⋯⊂V_h^{(1)} of rational subsets, each strictly contained in the previous, with toric charts on V_h^{(1)} and fibre products that are compositions of rational localizations and finite étale maps.
3. Map the Čech spectral sequences of the N coverings to each other, apply Proposition 6.1.1(2) to the transition maps and Scholze 2013 Lemma 5.4 for almost finite generation; Proposition 6.1.1(1) and the first spectral sequence give almost vanishing in large degrees.

**Acceptance checks.**

- Proper smooth trivial-log spaces specialize to the ordinary primitive input.
- For X=Spa(k,O_k) and L=F_p, H^0 is k⁺/p and H^i=0 for i>0.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology](#toric-kummer-cohomology), [HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower](#all-root-toric-tower), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis](#log-perfectoid-basis), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections](#log-site-projections), `PadicHodgeTheory:P8`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `PerfectoidSpaces:P0/almost-finitely-generated-and-presented`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 6.2.1, p. 85. Hypotheses of Theorem 6.2.1, kept in the node (properness and log smoothness).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 6.2.1(1), p. 85. The almost finite generation conclusion of part (1).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Lemma 6.2.4, p. 86. The covering lemma used in the proof, with its properness hypothesis.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Theorem 6.2.1(1), p. 86. The reduction to k⁺=O_k recorded as the first proof step.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="log-primitive-comparison"></a>

### Logarithmic primitive comparison

`HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison` · theorem · proposed declaration `TauCeti.LogAdic.log_primitive_comparison`.

Atlas planet: **Logarithmic primitive comparison**.

For proper log smooth fs X over Spa(k,k⁺), k algebraically closed of characteristic zero and residue characteristic p, and an F_p-local system L on X_két, the canonical map H^i(X_két,L)⊗_{F_p}(k⁺/p)→H^i(X_két,L⊗_{F_p}O⁺_X/p) is an almost isomorphism of k⁺-modules for every i≥0. Transport along ν gives the matching pro-Kummer formulation. Its properness hypothesis is retained by every finite-level application.

**Hypotheses and conventions.**

- DLLZ Theorem 6.2.1; no SNC assumption is needed for the comparison itself.

**Construction or proof route.**

1. The Artin–Schreier sequence 0→L→L⊗Ô^♭→L⊗Ô^♭→0 (σ=Id⊗(Φ−Id)) is exact on X_prokét, checked on log affinoid perfectoid objects trivializing L via Lemma 5.3.8 and the argument of Scholze 2013 Theorem 5.1.
2. Choose ϖ∈k♭ with ϖ♯=p; by Theorem 6.2.1(1) and Scholze 2013 Lemma 2.12, H^i(X_prokét,L⊗Ô^{♭+}/ϖ^m)^a≅(O^a_{k♭}/ϖ^m)^r compatibly in m and with Frobenius; Scholze 2013 Lemma 3.18 passes to Ô^{♭+} and inverting ϖ to Ô^♭≅(k♭)^r.
3. Take Frobenius invariants in the long exact sequence and use Proposition 5.1.7: H^i(X_két,L)≅F_p^r and H^i(X_két,L)⊗k^{+a}/p≅H^i(X_két,L⊗O⁺/p)^a.

**Acceptance checks.**

- For the constant Fp-sheaf on a geometric point the map is Fp⊗Fp k⁺/p≃k⁺/p.
- Empty boundary agrees with Scholze’s ordinary primitive theorem.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-almost-finiteness](#proper-log-almost-finiteness), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity](#log-perfectoid-almost-acyclicity), [HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves](#completed-structural-log-sheaves), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis](#log-perfectoid-basis), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections](#log-site-projections), `PadicHodgeTheory:P8`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), §6.2 and Theorem 6.2.1(2), p. 85. Introduces Theorem 6.2.1, whose part (2) is the almost isomorphism H^i(X_két,L)⊗k⁺/p→H^i(X_két,L⊗O⁺/p) stated in the node with the same hypotheses plus residue characteristic p (source issue on Theorem 6.2.1).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Theorem 6.2.1(2), p. 87. The Artin–Schreier step of the proof followed in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Theorem 6.2.1(2), p. 87. The tilt-side computation; it uses that k has residue characteristic p, made explicit in the node.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="log-cohomology-finite-vanishing"></a>

### Logarithmic cohomological finiteness and vanishing

`HodgeTateAndCanonicalSubgroups:T6:comparison/log-cohomology-finite-vanishing` · theorem · proposed declaration `TauCeti.LogAdic.log_cohomology_finite_vanishing`.

Let k be algebraically closed of characteristic zero and residue characteristic p. (1) Under the hypotheses of Theorem 6.2.1 (X proper log smooth fs over Spa(k,k⁺), L an F_p-local system on X_két), H^i(X_két,L) is a finite-dimensional F_p-vector space for each i≥0 and vanishes for i sufficiently large. (2) If moreover X is a smooth rigid analytic variety with the log structure of a normal crossings divisor (Example 2.3.17), H^i(X_két,L)=0 for i>2 dim X. (3) (Corollary 6.2.3) If U is a smooth rigid analytic variety over k that is Zariski open in a proper rigid analytic variety, then H^i(U_ét,L) is finite-dimensional for each F_p-local system L on U_ét and each i≥0, and H^i(U_ét,L)=0 for i>2 dim U.

**Hypotheses and conventions.**

- The 2 dim bound is the normal crossings case; neither it nor finiteness is asserted for arbitrary nonproper rigid spaces.
- In (3) the compactification is a hypothesis on U (Zariski open in a proper rigid space); resolution of singularities then supplies a smooth compactification with normal crossings boundary.

**Construction or proof route.**

1. (1): Theorem 6.2.1(2) with Theorem 6.2.1(1) gives H^i(X_két,L)⊗k⁺/p almost finitely generated and almost zero in large degrees, hence finiteness and vanishing.
2. (2): by Theorem 6.2.1(2) it suffices that H^i(X_két,L⊗O⁺/p) is almost zero for i>2 dim X; using smooth toric charts X→D^n (Example 3.1.13) the coverings of Lemma 6.2.4 can be taken analytic, Proposition 6.1.1 gives R^jλ_*(L⊗O⁺/p)^a=0 for j>dim X for λ:X_két→X_an, and X_an has cohomological dimension at most dim X (de Jong–van der Put Proposition 2.5.8).
3. (3): by resolution of singularities (Bierstone–Milman) choose a smooth compactification U=X−D with D a normal crossings divisor, then apply Theorem 4.6.1 (H^i(U_ét,L)≅H^i(X_két,j_két,*L)) and (1)–(2).

**Acceptance checks.**

- The closed unit disc is a counterexample to finiteness without proper compactification, as Remark 6.2.2 states.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison](#log-primitive-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-almost-finiteness](#proper-log-almost-finiteness), [HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology](#toric-kummer-cohomology), [HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension](#boundary-local-system-extension), [HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log](#divisorial-analytic-log), `ClassicalAdicEtaleCohomology:H0`, `AdicSpacesPartII:R4/smooth-pair`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 6.2.1, consequences, p. 85. Part (1), deduced in the source from the primitive comparison.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Theorem 6.2.1, last sentence, p. 85. Part (2), for the normal crossings log structure of Example 2.3.17.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Remark 6.2.2, p. 85. Supports the acceptance criterion: no finiteness without a proper compactification.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.2.3, p. 85. Part (3) with its hypothesis; its proof (p. 86) uses resolution of singularities and Theorems 4.6.1 and 6.2.1.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="proper-padic-boundary-cohomology"></a>

### Proper p-adic boundary cohomology

`HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology` · theorem · proposed declaration `TauCeti.LogAdic.proper_padic_boundary_cohomology`.

Let k be a complete nonarchimedean extension of Q_p with k⁺=O_k, X a smooth rigid analytic variety over k with a normal crossings divisor D and its log structure (Example 2.3.17), U=X−D and j:U→X; k̄ denotes a completed algebraic closure of k. (1) For an étale Z_p-local system L on U_ét (torsion allowed), L̄=j_két,*(L) is a Kummer étale Z_p-local system on X_két extending L, and every Kummer étale Z_p-local system on X_két is of this form; the first comparison H^i(U_{k̄,ét},L)≅H^i(X_{k̄,két},L̄) holds levelwise by Theorem 4.6.1. Neither statement needs properness. (2) If X is proper, there are canonical isomorphisms H^i(U_{k̄,ét},L)≅H^i(X_{k̄,két},L̄)≅H^i(X_{k̄,prokét},L̄^) of finite Z_p-modules for each i≥0. This is the corrected form of DLLZ-adic Corollary 6.3.4 recorded in source issue E1: the printed corollary has no properness hypothesis.

**Hypotheses and conventions.**

- Properness of X is added (source issue E1) for the finiteness and for the second isomorphism read with H^i(X_két,L̄)=lim_n H^i(X_két,L̄_n), whose proof needs lim^1_n H^{i−1}(X_két,L̄_n)=0; torsion Z_p-local systems are permitted.
- Over k̄ the hypotheses of Theorem 6.2.1 hold for X_{k̄} (proper log smooth over an algebraically closed field over Q_p).

**Construction or proof route.**

1. Extend each torsion reduction L_m by Theorem 4.6.1 and Corollary 4.6.7 (R^i j_két,*L_m=0 for i>0) and pass to the inverse system; the extended system is again strict.
2. By Theorem 6.2.1 applied to X_{k̄}, each H^i(X_{k̄,két},L̄_m) is finite, so the systems are Mittag-Leffler and the limits are finite Z_p-modules.
3. Compare with the completed pro-Kummer system by Proposition 5.1.7 and Lemma 6.3.3(2): RΓ(X_prokét,L̄^)=R lim_m RΓ(X_két,L̄_m), whose lim^1 terms vanish by finiteness.

**Acceptance checks.**

- Constant Fp on the nonproper closed disc is excluded from the finite-cohomology claim.
- For X proper with D=∅ and L=Z_p, the statement is the finiteness of H^i(X_{k̄,ét},Z_p) and its agreement with pro-étale cohomology of Ẑ_p.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/log-cohomology-finite-vanishing](#log-cohomology-finite-vanishing), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems](#kummer-padic-local-systems), [HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems](#completed-kummer-local-systems), [HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension](#boundary-local-system-extension), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections](#log-site-projections), `EnhancedDerivedSheaves:E2`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.4, p. 88. The corollary's hypotheses: those of Theorem 4.6.1, without properness; the node adds properness for the finiteness (source issue E1).
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.4, p. 88. The extension statement of part (1), valid without properness.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.4, p. 88. The finiteness clause, which the node keeps only for proper X.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Corollary 6.3.4, p. 88. The proof invokes Theorem 6.2.1, whose hypothesis requires X proper; this is why properness is added.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="kummer-proper-pushforward-local-systems"></a>

### Kummer proper pushforward of p-adic local systems

`HodgeTateAndCanonicalSubgroups:T6:comparison/kummer-proper-pushforward-local-systems` · theorem · proposed declaration `TauCeti.LogAdic.kummer_proper_pushforward_local_systems`.

Let k be a nonarchimedean field of characteristic zero with k⁺=O_k, and let f:X→Y be a log smooth morphism of log adic spaces, where X and Y are smooth rigid analytic varieties over k whose log structures are defined by normal crossings divisors D⊂X and E⊂Y as in Example 2.3.17. Assume that the underlying morphisms of adic spaces of f and of f|_{X−D}:X−D→Y−E are both proper. Then, for every Z_p-local system L on X_két and every i≥0, R^if_két,*(L) is a Z_p-local system on Y_két.

**Hypotheses and conventions.**

- Both properness hypotheses are those of DLLZ-adic Corollary 6.3.5 and are kept; the proof uses properness of f|_{X−D} (to get X−D=f⁻¹(Y−E) and to apply SW Theorem 10.5.1) and separatedness of f. No claim is made that either hypothesis is necessary.
- The characteristic-zero, k⁺=O_k setting is that of Theorem 4.6.1 and Corollary 6.3.4, which the proof uses; the source states only the setting of Example 2.3.17.
- Only the extension statements of Corollary 6.3.4 are used, which hold without properness (source issue E1), so the corollary is unaffected by E1.

**Construction or proof route.**

1. Write U=X−D, V=Y−E and j_X:U→X, j_Y:V→Y. Since f is a log morphism, f⁻¹(E)⊂D; since f|_U:U→V is proper and U is dense in f⁻¹(V), U=f⁻¹(V). U and V carry trivial log structures, so f|_U is strict and log smooth, hence smooth.
2. By Theorem 4.6.1 and Corollary 4.6.7 applied levelwise, L=j_X,két,*(L|_U) with R^q j_X,két,*(L_m|_U)=0 for q>0, so Rf_két,*(L_m)≅R(f∘j_X)_*(L_m|_U)=Rj_Y,két,*R(f|_U)_ét,*(L_m|_U).
3. The relative finiteness theorem for the proper smooth morphism f|_U (Scholze–Weinstein, Berkeley lectures, Theorem 10.5.1) makes each R^q(f|_U)_ét,*(L_m|_U) an étale local system on V, and the system over m an étale Z_p-local system; Theorem 4.6.1 on Y gives R^if_két,*(L_m)≅j_Y,két,*R^i(f|_U)_ét,*(L_m|_U).
4. By the extension statement of Corollary 6.3.4 on Y, j_Y,két,* of an étale Z_p-local system on V is a Kummer étale Z_p-local system on Y_két; hence R^if_két,*(L) is a Z_p-local system.

**Acceptance checks.**

- If D=E=∅ the statement is the relative finiteness theorem for étale Z_p-local systems along a proper smooth morphism of rigid analytic varieties.
- If Y=Spa(k,O_k) with k algebraically closed and E=∅, properness of X−D forces D=∅ and the conclusion is that H^i(X_ét,L) is a finitely generated Z_p-module.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology](#proper-padic-boundary-cohomology), [HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension](#boundary-local-system-extension), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-padic-local-systems](#kummer-padic-local-systems), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion](#log-smooth-chart-criterion), [HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log](#divisorial-analytic-log), `ClassicalAdicEtaleCohomology:H0`.

**Sources and relation to this target.**

- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.5, p. 89. The setting of the node, with normal crossings (not necessarily strict) divisors as in Example 2.3.17.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.5, p. 89. The two properness hypotheses, kept in the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.5, p. 89. The conclusion of the node.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Proof of Corollary 6.3.5, p. 89. The two inputs of the proof sketch: the relative finiteness theorem for proper smooth maps and the Kummer extension of local systems.

**Uses.**

- DLLZ-RH Theorem 3.2.7(5) and Corollary 3.5.14: R^if_két,*(L) is a Z_p-local system before its log de Rham comparison is formed.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

## Period sheaves and logarithmic Poincaré

Constant periods use imported Fontaine constructions. Structural periods additionally record monoid relations and a log connection. Their toric evaluation proves the strict filtered Poincaré complexes and the Faltings extension.

- [Ordinary periods on the pro-Kummer site](#constant-log-periods)
- [Positive structural logarithmic periods](#structural-log-period-plus)
- [Filtered completion of structural periods](#structural-log-period-complete)
- [Continuous structural log connection](#structural-period-connection)
- [Toric power-series description of log periods](#toric-structural-period-model)
- [Logarithmic period Poincaré lemma](#log-poincare)
- [Logarithmic Faltings extension](#log-faltings-extension)

<a id="constant-log-periods"></a>

### Ordinary periods on the pro-Kummer site

`HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods` · construction · proposed declaration `TauCeti.LogAdic.LogConstantPeriods`.

Let X be a locally noetherian fs log adic space over Spa(Q_p,Z_p), with Ô⁺, Ô and Ô^{♭+}=lim_Φ Ô⁺ on X_prokét. Set A_inf=W(Ô^{♭+}), B_inf=A_inf[1/p] with θ:B_inf→Ô, B_dR⁺=lim_r B_inf/(ker θ)^r with Fil^r B_dR⁺=(ker θ)^r B_dR⁺, and B_dR=B_dR⁺[t⁻¹] for any local generator t of (ker θ)B_dR⁺, with Fil^r B_dR=∑_{s≥−r} t^{−s}Fil^{r+s}B_dR⁺ (Definition 2.2.3). For every log affinoid perfectoid U∈X_prokét with associated perfectoid space Û=Spa(R,R⁺) the canonical maps are isomorphisms A_inf(U)≅A_inf(R,R⁺)=W(R^{♭+}), B_inf(U)≅B_inf(R,R⁺), B_dR⁺(U)≅B_dR⁺(R,R⁺), B_dR(U)≅B_dR(R,R⁺), and H^j(U,B_dR⁺)=H^j(U,B_dR)=0 for all j>0 (Proposition 2.2.4). Hence t exists locally and is a nonzerodivisor, so B_dR and its filtration are well defined and independent of t (Remark 2.2.5). If X lies over a perfectoid field containing all roots of unity, gr^•B_dR≅⊕_{r∈Z}Ô(r) (Corollary 2.2.6). These are the ordinary period functors applied on X_prokét; no new local period ring is defined.

**Hypotheses and conventions.**

- X is a locally noetherian fs log adic space over Spa(Q_p,Z_p) (Definition 2.2.3); no log smoothness and no p-adic base field is needed for the definitions or for Proposition 2.2.4.
- The evaluation and acyclicity are asserted only on log affinoid perfectoid objects U of X_prokét (DLLZ-adic Definition 5.3.1), via the associated perfectoid pair (R,R⁺).
- The Tate-twisted identification gr^r B_dR≅Ô(r) keeps the hypothesis of Corollary 2.2.6 (X over a perfectoid field containing all roots of unity); without it only gr^r B_dR(R,R⁺)≅ξ^rR ((2.2.2)) is asserted sectionwise.
- Sectionwise the pinned Mathlib carrier BDeRhamPlus is used with its own hypotheses (p prime, p not a unit, p-adically complete ring), applied to R⁺.

**Construction or proof route.**

1. Apply W, inversion of p and (ker θ)-adic completion to the tilted completed structure sheaf Ô^{♭+} (completed-structural-log-sheaves); log affinoid perfectoid objects form a basis of X_prokét (DLLZ-adic Proposition 5.3.12), so it suffices to work on them.
2. Proposition 2.2.4: argue as in the ordinary case (Scholze 2013, Theorem 6.5; P8 period-sheaves-on-affinoid-perfectoids and rational-acyclicity-of-de-rham-period-sheaves), with the ordinary almost acyclicity input replaced by DLLZ-adic Theorem 5.4.3 (Ô^{♭+}(U)=R^{♭+} and almost vanishing of higher cohomology on log affinoid perfectoid U).
3. Remark 2.2.5: ker θ on A_inf(R,R⁺) is principal, generated by a nonzerodivisor ξ ((2.2.1)), so a local generator t exists; two generators differ by a unit, so B_dR⁺[t⁻¹] and the filtration do not depend on t.
4. Corollary 2.2.6: combine gr^r B_dR(R,R⁺)≅ξ^rR ((2.2.2)) with Proposition 2.2.4 as in the ordinary case (P8 graded-de-rham-period-sheaf-tate-twist); Corollary 2.2.7 (surjectivity along strict closed immersions on log affinoid perfectoid sections) follows from DLLZ-adic Proposition 5.4.5 and Proposition 2.2.4.

**Acceptance checks.**

- There is no new local period-ring definition duplicating P8: sectionwise the rings are A_inf(R,R⁺), B_dR⁺(R,R⁺), B_dR(R,R⁺) of the associated perfectoid pair.
- On every log affinoid perfectoid U the sections are those of the associated perfectoid pair and H^j(U,B_dR⁺)=H^j(U,B_dR)=0 for j>0; this is the evaluation used by PerfectoidShimuraVarieties S6.

**Planning API.**

- `TauCeti.LogAdic.LogConstantPeriods` (constructor): The sheaves A_inf, B_inf, B_dR⁺, B_dR on X_prokét obtained from Ô^{♭+} by the ordinary period functors, with θ and the filtrations of Definition 2.2.3.
- `TauCeti.LogAdic.LogConstantPeriods.theta` (projection): θ:A_inf→Ô⁺, and its p-inverted and completed versions θ:B_inf→Ô, θ:B_dR⁺→Ô, surjective with kernel Fil¹.
- `TauCeti.LogAdic.LogConstantPeriods.fil` (structure): Fil^r B_dR⁺=(ker θ)^r B_dR⁺ and Fil^r B_dR=∑_{s≥−r}t^{−s}Fil^{r+s}B_dR⁺; decreasing, separated and complete, independent of the local generator t.
- `TauCeti.LogAdic.LogConstantPeriods.grade` (compatibility): If X lies over a perfectoid field containing all roots of unity, gr^r B_dR≅Ô(r) canonically for all r∈Z (Corollary 2.2.6); sectionwise gr^r B_dR(R,R⁺)≅ξ^rR in general.
- `TauCeti.LogAdic.LogConstantPeriods.sections` (compatibility): For a log affinoid perfectoid U with associated perfectoid Û=Spa(R,R⁺): A_inf(U)≅W(R^{♭+}), B_inf(U)≅W(R^{♭+})[1/p], B_dR⁺(U)≅B_dR⁺(R,R⁺) and B_dR(U)≅B_dR(R,R⁺), compatibly with θ and filtrations (Proposition 2.2.4(1)).
- `TauCeti.LogAdic.LogConstantPeriods.acyclic_log_affinoid_perfectoid` (other): For a log affinoid perfectoid U, H^j(U,B_dR⁺)=H^j(U,B_dR)=0 for all j>0 (Proposition 2.2.4(2)).
- `TauCeti.LogAdic.LogConstantPeriods.closed_restriction_surjective` (compatibility): For a strict closed immersion ı:Z→X, B_dR,X⁺→ı_{prokét,*}B_dR,Z⁺ is surjective, already on sections over every log affinoid perfectoid U (Corollary 2.2.7).

**Discriminating unit tests.**

- `TauCeti.LogAdic.LogConstantPeriods.trivial_log` (compatibility): For the trivial log structure, under X_prokét≃X_proét these sheaves, θ and filtrations are P8's A_inf, B_inf, B_dR⁺, B_dR.
- `TauCeti.LogAdic.LogConstantPeriods.grade_zero` (computation): θ induces B_dR⁺/Fil¹B_dR⁺≅Ô; on a log affinoid perfectoid U this is B_dR⁺(R,R⁺)/ξ≅R.
- `TauCeti.LogAdic.LogConstantPeriods.not_integral_completion` (non-example): (lim_r A_inf(R,R⁺)/ξ^r)[1/p]=A_inf(R,R⁺)[1/p] is not B_dR⁺(R,R⁺): the convergent series ∑_{n≥0}p^{−n}ξ^n lies in B_dR⁺(R,R⁺) but not in A_inf(R,R⁺)[1/p].
- `TauCeti.LogAdic.LogConstantPeriods.point_values` (degenerate): For X=Spa(K,O_K) with K a perfectoid field and trivial log structure, U=X is log affinoid perfectoid and B_dR⁺(U)=B_dR⁺(K,O_K), Fontaine's ring, with Fil^r=ξ^rB_dR⁺(K,O_K).

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves](#completed-structural-log-sheaves), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity](#log-perfectoid-almost-acyclicity), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid](#log-affinoid-perfectoid), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis](#log-perfectoid-basis), `PadicHodgeTheory:P8:local-rational/period-sheaves-definitions`, `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`, `PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf`, `PadicHodgeTheory:P8:local-rational/graded-de-rham-period-sheaf-tate-twist`, `mathlib:BDeRhamPlus`, `mathlib:fontaineThetaInvertP`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 2.2.3(2), p. 12. Definition 2.2.3(2) sets B_dR=B_dR⁺[t⁻¹] for any generator t of (ker θ)B_dR⁺ and only later fixes t=log[ε] in (2.3.2); the node keeps the arbitrary local generator and the convolution filtration of Definition 2.2.3(3).
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 2.2.4(1)–(2), p. 12. Proposition 2.2.4 gives the values of A_inf, B_inf, B_dR⁺, B_dR on a log affinoid perfectoid U through its associated perfectoid pair and the vanishing of higher cohomology of B_dR⁺ and B_dR; the node states both parts.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark 2.2.5, p. 12. Remark 2.2.5 is the well-definedness of B_dR and its filtration recorded in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.2.6, p. 12. Corollary 2.2.6 identifies gr^•B_dR with ⊕Ô(r) under the stated base hypothesis, which the node keeps.

**Uses.**

- DLLZ-RH Definition 2.2.10: The structural periods are B_dR⁺-algebras containing these constant coefficient periods.
- DLLZ-RH Proposition 2.3.15: B_dR⁺|_X̃[[P−1]] is built on the values B_dR⁺(U) of Proposition 2.2.4.
- DLLZ-RH Corollaries 2.4.2(4) and 2.4.5: gr^r B_dR≅Ô(r) gives the Tate twists in the graded Poincaré lemma and the Faltings extension.
- DLLZ-RH Lemma 3.6.1: Primitive comparison upgrades to B_dR⁺-cohomology.
- PerfectoidShimuraVarieties:S6: Evaluation of A_inf, B_dR⁺, B_dR on log affinoid perfectoid test objects over the toroidal tower (sections and acyclic_log_affinoid_perfectoid), to restrict P_HT to perfectoid test objects.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="structural-log-period-plus"></a>

### Positive structural logarithmic periods

`HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus` · construction · proposed declaration `TauCeti.LogAdic.StructuralLogPeriodPlus`.

Atlas planet: **Structural logarithmic periods**.

Let X be a locally noetherian fs log adic space over Spa(k,k⁺) (k of characteristic 0, residue field κ of characteristic p). For a log affinoid perfectoid U=lim_{i∈I}U_i∈X_prokét with U_i=(Spa(R_i,R_i⁺),M_i,α_i) and associated perfectoid pair (R,R⁺), put M_i=M_i(U_i), M=colim_iM_i=M(U) and M♭=lim_{a↦pa}M=M♭(U), with α♭:M♭→R♭. For r≥1, S_{i,r} is the quotient of the monoid algebra (R_i⊗̂_{W(κ)}(W(R^{♭+})/ξ^r))[M_i×_M M♭] by the elements α_i(a′)⊗1−(1⊗[α♭(a″)])e_a for a=(a′,a″) (equation (2.2.8)); [α♭(a″)]∈W(R^{♭+})[1/p]/ξ^r acts because p is invertible in R_i. The map θ_log:S_{i,r}→R induced by R_i→R and θ with θ_log(e_a)=1 is well defined since θ([α♭(a″)])=α_i(a′) ((2.2.9)). Put Ŝ_i=lim_{r,s}S_{i,r}/(ker θ_log)^s; colim_iŜ_i depends only on U. OB⁺_dR,log is the sheaf on X_prokét associated with U↦colim_iŜ_i on the log affinoid perfectoid basis, with θ_log:OB⁺_dR,log→Ô and Fil^rOB⁺_dR,log=(ker θ_log)^rOB⁺_dR,log (Definition 2.2.10(1)). It is an O_{X_prokét}-algebra and a filtered B_dR⁺-algebra.

**Hypotheses and conventions.**

- X is a locally noetherian fs log adic space over Spa(k,k⁺), k nonarchimedean of characteristic 0 with residue characteristic p (DLLZ-RH §2); the source applies the sheaf only to X log smooth over a p-adic field or to strata with induced log structure (Remark 2.2.12).
- The completed tensor product is over W(κ), which uses W(κ)-algebra structures on R_i and W(R^{♭+}); these exist when κ is perfect, in particular over p-adic fields.
- The relation is α_i(a′)=[α♭(a″)]e_a, imposed without inverting α_i(a′) or [α♭(a″)]; where α♭(a″)=0 it reduces to α_i(a′)=0 and leaves e_a free (DLLZ-RH p. 18).

**Construction or proof route.**

1. Form S_{i,r} by (2.2.8) and check that θ_log is well defined from θ([α♭(a″)])=α_i(a′) in R ((2.2.9)).
2. Complete at ker θ_log, take the limit over r and the colimit over i; a cofinal change of presentation of U induces canonical filtered isomorphisms, so colim_iŜ_i depends only on U.
3. Sheafify on the basis of log affinoid perfectoid objects (DLLZ-adic Proposition 5.3.12) and set Fil^r=(ker θ_log)^r; the maps R_i→S_{i,r} and W(R^{♭+})/ξ^r→S_{i,r} give the O_{X_prokét}- and B_dR⁺-algebra structures (using Proposition 2.2.4 for B_dR⁺(U)).

**Acceptance checks.**

- Boundary coordinates remain visible through e_a; replacing them by ordinary tensor periods loses dlog terms.
- For the trivial log structure the relation forces e_a=α_i(a′)[α♭(a″)]⁻¹ and S_{i,r}=R_i⊗̂_{W(κ)}(W(R^{♭+})/ξ^r), so OB⁺_dR,log agrees with P8's corrected OB_dR⁺.

**Planning API.**

- `TauCeti.LogAdic.StructuralLogPeriodPlus` (constructor): The sheafification of U↦colim_iŜ_i on log affinoid perfectoid objects, with θ_log and the filtration Fil^r=(ker θ_log)^r.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.theta_generator` (simp): θ_log(e_a)=1 for every a∈M_i×_M M♭.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.structural_relation` (relation): α_i(a′)=[α♭(a″)]e_a in S_{i,r}, hence in OB⁺_dR,log, for a=(a′,a″).
- `TauCeti.LogAdic.StructuralLogPeriodPlus.presentation_invariance` (equivalence): Cofinal changes of the pro-presentation of U induce canonical filtered isomorphisms of colim_iŜ_i.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.theta_surjective` (projection): θ_log:OB⁺_dR,log→Ô is surjective with kernel Fil¹OB⁺_dR,log.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.bdr_algebra` (structure): The filtered B_dR⁺-algebra structure induced by W(R^{♭+})/ξ^r→S_{i,r}; θ_log restricts to θ on B_dR⁺.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.structure_algebra` (structure): The O_{X_prokét}-algebra structure induced by R_i→S_{i,r}; θ_log restricts to O_{X_prokét}→Ô.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.pullback` (functoriality): A morphism f:X→Y of locally noetherian fs log adic spaces over Spa(k,k⁺) induces a filtered map f_prokét⁻¹OB⁺_dR,log,Y→OB⁺_dR,log,X compatible with θ_log, the e_a and the B_dR⁺-structures, with map_id and map_comp.

**Discriminating unit tests.**

- `TauCeti.LogAdic.StructuralLogPeriodPlus.rank_zero` (compatibility): For the trivial log structure, under X_prokét≃X_proét, OB⁺_dR,log is filtered isomorphic to P8's corrected OB_dR⁺, each e_a being α_i(a′)[α♭(a″)]⁻¹.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.theta` (computation): θ_log induces OB⁺_dR,log/Fil¹≅Ô.
- `TauCeti.LogAdic.StructuralLogPeriodPlus.boundary_relation` (non-example): If α♭(a″)=0 (a boundary coordinate vanishing on the stratum), the relation gives α_i(a′)=0 and imposes no constraint on e_a; the relation is not rewritten as e_a=α_i(a′)/[α♭(a″)].

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart](#integral-adic-chart), [HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-structural-log-sheaves](#completed-structural-log-sheaves), [HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods](#constant-log-periods), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid](#log-affinoid-perfectoid), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis](#log-perfectoid-basis), `mathlib:AdicCompletion`, `AdicSpacesPartII:R0/completed-tensor-product`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (2.2.8) and following, p. 13. The relation ring S_{i,r} of (2.2.8) with the structural relation α_i(a′)=[α♭(a″)]e_a, as in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (2.2.9), p. 13. The well-definedness of θ_log with θ_log(e_a)=1 recorded in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 2.2.10(1), p. 13. OB⁺_dR,log is the sheafification of U↦colim_iŜ_i with Fil^r=(ker θ_log)^r, for X over Spa(k,k⁺) as in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark 2.2.12, p. 14. Confirms that the definition is general and the applications are log smooth over p-adic fields or strata; the node keeps the general definition.

**Uses.**

- DLLZ-RH §2.3: Completed monoid relations give the power-series coordinates.
- DLLZ-RH Corollary 2.4.2: Positive log Poincaré resolution starts with this sheaf.
- DLLZ-RH Corollary 2.3.20 and Corollary 2.4.6: Pullback along strict closed immersions and log smooth maps.
- PerfectoidShimuraVarieties:S6: Evaluation of the logarithmic period sheaves on log affinoid perfectoid test objects over the toroidal tower diamond: OB⁺_dR,log(U)=colim_iŜ_i, and over a toric chart Ŝ_i≅OB⁺_dR,log(U)≅B_dR⁺(U)[[P−1]].

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="structural-log-period-complete"></a>

### Filtered completion of structural periods

`HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete` · construction · proposed declaration `TauCeti.LogAdic.StructuralLogPeriod`.

Let t be a local generator of Fil¹B_dR⁺ as in Definition 2.2.3(2). On OB⁺_dR,log[t⁻¹] put Fil^r=∑_{s≥−r}t^{−s}Fil^{r+s}OB⁺_dR,log (Definition 2.2.10(2)). OB_dR,log is the completion of OB⁺_dR,log[t⁻¹] for this filtration: Fil^rOB_dR,log=lim_{s≥0}Fil^r(OB⁺_dR,log[t⁻¹])/Fil^{r+s}(OB⁺_dR,log[t⁻¹]) and OB_dR,log=∪_{r∈Z}Fil^rOB_dR,log (Definition 2.2.10(3)); OC_log=gr⁰OB_dR,log. Fil⁰OB_dR,log is a sheaf of rings and OB_dR,log=(Fil⁰OB_dR,log)[t⁻¹]. In general OB_dR,log≠OB⁺_dR,log[t⁻¹], already for the trivial log structure, where OB_dR,log differs from the uncompleted OB_dR of Brinon and Scholze (Remark 2.2.11).

**Hypotheses and conventions.**

- X is as for OB⁺_dR,log (locally noetherian fs over Spa(k,k⁺)).
- The additional completion of Definition 2.2.10(3) is part of the definition; the filtration is the convolution filtration, not the t-adic filtration alone, and it does not depend on the choice of local generator t.

**Construction or proof route.**

1. Define the convolution filtration on OB⁺_dR,log[t⁻¹]; two local generators of Fil¹B_dR⁺ differ by a unit, so it is independent of t.
2. Complete each Fil^r against Fil^{r+s}, s≥0, as an inverse limit of sheaves, and take the union over r.
3. Check that Fil⁰ is a sheaf of rings with OB_dR,log=Fil⁰[t⁻¹], that B_dR→OB_dR,log is filtered, and set OC_log=gr⁰.

**Acceptance checks.**

- Trivial logs compare with the filtration-completed ordinary structural periods, not with the uncompleted OB_dR⁺[t⁻¹] of Brinon and Scholze (Remark 2.2.11).
- OC_log=gr⁰OB_dR,log is an Ô-algebra; over a toric chart it is Ô[W_1,…,W_n] (toric-structural-period-model).

**Planning API.**

- `TauCeti.LogAdic.StructuralLogPeriod` (constructor): The filtration completion of OB⁺_dR,log[t⁻¹], with its filtration pieces and OC_log=gr⁰.
- `TauCeti.LogAdic.StructuralLogPeriod.completion_map` (projection): The filtered map from OB⁺_dR,log[t⁻¹] into its filtration completion.
- `TauCeti.LogAdic.StructuralLogPeriod.grade` (compatibility): The completion map induces isomorphisms on all gr^r.
- `TauCeti.LogAdic.StructuralLogPeriod.complete_piece` (characterisation): Each Fil^r is the inverse limit of its Fil^r/Fil^{r+s} quotients, s≥0.
- `TauCeti.LogAdic.StructuralLogPeriod.fil_zero_ring` (structure): Fil⁰OB_dR,log is a sheaf of rings, Fil^r·Fil^s⊂Fil^{r+s}, and OB_dR,log=(Fil⁰OB_dR,log)[t⁻¹].
- `TauCeti.LogAdic.StructuralLogPeriod.oc_log` (projection): OC_log=gr⁰OB_dR,log, an Ô-algebra receiving Fil⁰OB_dR,log.
- `TauCeti.LogAdic.StructuralLogPeriod.bdr_algebra` (structure): The filtered B_dR-algebra map B_dR→OB_dR,log extending B_dR⁺→OB⁺_dR,log.
- `TauCeti.LogAdic.StructuralLogPeriod.t_independent` (characterisation): The filtration and the completion do not depend on the local generator t of Fil¹B_dR⁺.

**Discriminating unit tests.**

- `TauCeti.LogAdic.StructuralLogPeriod.zero_log` (compatibility): For the trivial log structure OB_dR,log is the filtration completion of P8's OB_dR⁺[t⁻¹] and contains the series of cauchy_sum, which is not in OB_dR⁺[t⁻¹]; it is not the uncompleted OB_dR.
- `TauCeti.LogAdic.StructuralLogPeriod.cauchy_sum` (computation): In the local one-variable model with W=y/t, ∑_{n≥0}t^nW^{n²} converges in Fil⁰=B_dR⁺{W} for the coefficientwise t-adic completion.
- `TauCeti.LogAdic.StructuralLogPeriod.localization_insufficient` (non-example): The same series has y^{n²}-coefficient t^{n−n²}, with unbounded negative t-valuations, and hence is not in B_dR⁺[[y]][1/t]; its inclusion requires the additional filtration completion.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus](#structural-log-period-plus), [HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods](#constant-log-periods).

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 2.2.10(3) and the note after it, p. 13. States the ring structure of Fil⁰ and OB_dR,log=(Fil⁰)[t⁻¹] after the filtration completion defined in Definition 2.2.10(2)–(3), as in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark 2.2.11, p. 13. The additional completion is present even for trivial log structure; the node's trivial-log test records this.

**Uses.**

- DLLZ-RH §2.3: The completed local model has t-adically convergent power-series coefficients in W.
- DLLZ-RH §3.2: RH_log uses the completed structural sheaf.
- DLLZ-RH Proposition 3.3.3: OC_log=gr⁰OB_dR,log is the coefficient sheaf of the Higgs computation.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="structural-period-connection"></a>

### Continuous structural log connection

`HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection` · construction · proposed declaration `TauCeti.LogAdic.StructuralLogConnection`.

For a log affinoid perfectoid U=lim U_i and r≥1 there is a unique B_dR⁺(U)/ξ^r-linear log connection ∇:S_{i,r}→S_{i,r}⊗_{R_i}Ω^log_X(U_i) extending d:R_i→Ω^log_X(U_i) and δ:M_i→Ω^log_X(U_i) with ∇(e_a)=e_aδ(a′) for a=(a′,a″)∈M_i×_M M♭ ((2.2.13)–(2.2.14)); it satisfies ∇((ker θ_log)^s)⊂(ker θ_log)^{s−1}⊗_{R_i}Ω^log_X(U_i) for s≥1. Completing, taking the limit over r and the colimit over i gives a B_dR⁺-linear log connection ∇:OB⁺_dR,log→OB⁺_dR,log⊗_{O_{X_prokét}}Ω^log_X ((2.2.15)); it extends B_dR-linearly to OB⁺_dR,log[t⁻¹] with ∇(Fil^r)⊂Fil^{r−1}⊗Ω^log_X ((2.2.16)), and to OB_dR,log with ∇(Fil^rOB_dR,log)⊂Fil^{r−1}OB_dR,log⊗_{O_{X_prokét}}Ω^log_X for all r∈Z ((2.2.17)). The connection is integrable. In the toric coordinates of §2.3, ∇y_j=δ(a_j) and ∇W_j=t⁻¹δ(a_j) ((2.4.3)–(2.4.4)).

**Hypotheses and conventions.**

- X is as for OB⁺_dR,log (locally noetherian fs over Spa(k,k⁺)); Ω^log_X is the sheaf of log differentials of DLLZ-adic Definition 3.3.6, pulled back to X_prokét; it is a vector bundle when X is as in Remark 2.4.1.
- The connection is B_dR⁺-linear (B_dR-linear after inverting t), not O_{X_prokét}-linear; it satisfies the log Leibniz rule for (d,δ).

**Construction or proof route.**

1. On S_{i,r} define ∇ by d on R_i, B_dR⁺(U)/ξ^r-linearity and ∇e_a=e_aδ(a′); it preserves the relation ideal because d(α_i(a′))=α_i(a′)δ(a′), so ∇(α_i(a′)−[α♭(a″)]e_a)=(α_i(a′)−[α♭(a″)]e_a)δ(a′); uniqueness holds because R_i, the coefficients and the e_a generate.
2. Since ∇ lowers the (ker θ_log)-adic order by at most one, it extends to the completions, the limit over r and the colimit over i, then to the t-localization and the filtration completion with ∇Fil^r⊂Fil^{r−1}⊗Ω^log_X.
3. Integrability: ∇² vanishes on R_i and on each e_a because d∘δ=0 and δ(a′)∧δ(a′)=0 in Ω^{log,2}_X; the coordinate formulas follow from (2.2.14) with y_j=log(e^{(a_j⁺,a_j⁺)})−log(e^{(a_j⁻,a_j⁻)}) and W_j=t⁻¹y_j.

**Acceptance checks.**

- The connection is not O_X-linear; it satisfies the log Leibniz rule.
- On S_{i,r}, ∇(α_i(a′)−[α♭(a″)]e_a)=(α_i(a′)−[α♭(a″)]e_a)δ(a′), so the structural relation is preserved.

**Planning API.**

- `TauCeti.LogAdic.StructuralLogConnection` (constructor): The continuous B_dR-linear log connection on OB_dR,log restricting to the B_dR⁺-linear one on OB⁺_dR,log.
- `TauCeti.LogAdic.StructuralLogConnection.generator` (simp): ∇e_a=e_aδ(a′) for a=(a′,a″)∈M_i×_M M♭.
- `TauCeti.LogAdic.StructuralLogConnection.transverse` (compatibility): ∇(Fil^r)⊂Fil^{r−1}⊗Ω^log_X on OB⁺_dR,log, OB⁺_dR,log[t⁻¹] and OB_dR,log.
- `TauCeti.LogAdic.StructuralLogConnection.integrable` (relation): ∇∘∇=0 on the associated log de Rham complex OB_dR,log⊗Ω^{log,•}_X.
- `TauCeti.LogAdic.StructuralLogConnection.leibniz` (relation): ∇(fx)=f∇x+x⊗df for f∈O_{X_prokét}, and ∇ restricted to O_{X_prokét} is d.
- `TauCeti.LogAdic.StructuralLogConnection.bdr_linear` (compatibility): ∇ is B_dR-linear; the image of B_dR in OB_dR,log is horizontal.
- `TauCeti.LogAdic.StructuralLogConnection.relative` (other): For a log smooth f:X→X′, composing with Ω^log_X→Ω^log_{X/X′} gives the relative connection ∇_{X/X′}, linear over the image of f_prokét⁻¹OB_dR,log,X′ (used in Corollary 2.4.6).

**Discriminating unit tests.**

- `TauCeti.LogAdic.StructuralLogConnection.constants` (degenerate): ∇ vanishes on the image of B_dR→OB_dR,log.
- `TauCeti.LogAdic.StructuralLogConnection.log_coordinate` (computation): For X=D¹ with log structure at 0 and y=log(e^{(a,a)}) over its all-root cover, ∇y=δ(a)=dlog T; the same holds on the stratum {T=0} with the induced log structure, where dlog T is still a nonzero section of Ω^log.
- `TauCeti.LogAdic.StructuralLogConnection.normalized_coordinate` (computation): ∇W_T=t⁻¹dlog T for W_T=y/t, so omitting the t⁻¹ would give the wrong filtered connection.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete](#structural-log-period-complete), [HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus](#structural-log-period-plus), [HodgeTateAndCanonicalSubgroups:T6:log-sites/continuous-log-derivation](#continuous-log-derivation), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent](#log-differential-descent), [HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham](#analytic-log-de-rham).

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equations (2.2.13)–(2.2.14), p. 14. Uniqueness and existence of the log connection on S_{i,r} extending d and δ with ∇(e_a)=e_aδ(a′), as stated in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (2.2.15), p. 14. The B_dR⁺-linear connection on OB⁺_dR,log obtained from the (ker θ_log)-transversality, as in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equations (2.2.16)–(2.2.17), p. 14. The B_dR-linear extensions to OB⁺_dR,log[t⁻¹] and OB_dR,log with ∇Fil^r⊂Fil^{r−1}⊗Ω^log_X, as in the node.

**Uses.**

- DLLZ-RH Corollary 2.4.2: The connection gives the Poincaré resolution.
- DLLZ-RH §3.2–3.3: Tensoring with L̂ and the projection formula (3.3.1) transfer it to RH_log(L).

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="toric-structural-period-model"></a>

### Toric power-series description of log periods

`HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model` · theorem · proposed declaration `TauCeti.LogAdic.toric_structural_period_model`.

Let k be a p-adic field, P=P̄⊕Q toric monoids, E=Spa(k⟨P̄⟩,k⁺⟨P̄⟩)↪Spa(k⟨P⟩,k⁺⟨P⟩) the stratum with pulled-back log structure, X=Spa(A,A⁺) an affinoid fs log adic space with a strictly étale map X→E, and X̃→X the pullback of the all-root tower Ẽ=lim E_m, log affinoid perfectoid with Galois group Γ. Let M⊂B_dR⁺|_X̃[P] be the ideal generated by {e_a−1}_{a∈P}, B_dR⁺|_X̃[[P−1]]=lim_r B_dR⁺|_X̃[P]/M^r with Fil^r=(ξ,M)^r. (1) There is a unique v:O_{X_prokét}|_X̃→B_dR⁺|_X̃[[P−1]] lifting O→Ô and sending a∈P_{Q≥0} to [T^{ā♭}]e_a (Lemma 2.3.7), and β:M♭|_X̃→(B_dR⁺|_X̃[[P−1]])^× with v(α(a♯))=[α♭(a)]β(a) (Lemma 2.3.12). (2) The map B_dR⁺|_X̃[[P−1]]→OB⁺_dR,log|_X̃ of (2.3.14), e_a↦e_{(a,a)}, is an isomorphism of filtered sheaves (Proposition 2.3.15); for every log affinoid perfectoid U=lim U_i in X_prokét/X̃, OB⁺_dR,log(U)≅B_dR⁺(U)[[P−1]] and each Ŝ_i→OB⁺_dR,log(U) is an isomorphism. (3) For a Z-basis a_1,…,a_n of P^gp and y_j=y_{a_j} (y_a=log(e^{a⁺})−log(e^{a⁻}) for a=a⁺−a⁻), B_dR⁺|_X̃[[P−1]]≅B_dR⁺|_X̃[[y_1,…,y_n]], matching M^r with (y_1,…,y_n)^r and (ξ,M)^r with (ξ,y_1,…,y_n)^r ((2.3.6)). (4) With W_j=t⁻¹y_j, Fil^rOB_dR,log≅t^rB_dR⁺{W_1,…,W_n} (t-adically convergent series) for all r∈Z, gr^rOB_dR,log≅t^rÔ[W_1,…,W_n] and gr^•OB_dR,log≅Ô[t^{±1},W_1,…,W_n] (Corollary 2.3.17). (5) For a strict closed immersion Z→X pulled back from the closed stratum of a direct summand Q′ of P̄, these isomorphisms for X and Z are compatible with pullback and pushforward, and B_dR,X⁺(U)/ξ^r modulo the completed ideal generated by the [T^{sa♭}] (s∈Q_{>0}, a∈Q′−{0}) is B_dR,Z⁺(V)/ξ^r ((2.3.21), Corollary 2.3.20).

**Hypotheses and conventions.**

- k is a p-adic field (§2.3), with k_∞=k(µ_∞), t=log[ε] ((2.3.2)) and k→B_dR⁺ the unique lift of k→k̂_∞.
- P is a toric (fs, sharp) monoid, not necessarily free; n is the rank of P^gp; Q≠0 covers strata with the pulled-back log structure (Remark 2.4.1(2)).
- The isomorphisms hold on the localized site X_prokét/X̃ (equivalently on log affinoid perfectoid objects over X̃); the formal power series B_dR⁺[[y]] of the positive case and the t-adically convergent series B_dR⁺{W} of the completed case are not identified.

**Construction or proof route.**

1. Lemma 2.3.7: for each U_i choose m_i with U_i×_E E_{m_i}→E_{m_i} strictly étale (DLLZ-adic Lemma 4.2.5), write its ring as the p-adic completion of an étale finite-type k[(1/m_i)P̄]/(Q−{0})-algebra (Huber, Corollary 1.7.3(iii)), and lift uniquely to B_dR⁺(U)[[P−1]] by Scholze's power-series lifting lemma (P8 bdr-plus-power-series-extension-lemma).
2. Lemma 2.3.11: A⊗̂_k(B_dR⁺/ξ^r)⊗̂(B_dR⁺/ξ^r)⟨P̄_{Q≥0}⟩→B_dR⁺(X̃)/ξ^r is a Γ-equivariant isomorphism, by passing to ξ-graded pieces and the toric tower computation (DLLZ-adic Lemma 6.1.9); Lemma 2.3.12 constructs β from v and generators of M♭|_X̃.
3. Proposition 2.3.15: (2.3.16) induces S_{i,r}→(B_dR⁺(U)/ξ^r)[[P−1]] sending ker θ_log into (ξ,M); after completion it is inverse to (2.3.14), both composites being B_dR⁺(U)-linear, fixing the e_a and agreeing on R_i by the uniqueness in Lemma 2.3.7; this also shows Ŝ_i≅OB⁺_dR,log(U).
4. Corollary 2.3.17: transport the filtration through (2.3.6) and compute the convolution-filtration completion of B_dR⁺[[y]][t⁻¹] as t^rB_dR⁺{W}; Corollary 2.3.20 by comparing the constructions for X and Z through the surjection of Corollary 2.2.7.

**Acceptance checks.**

- For P=Z_{≥0} (X=D¹ with log structure at 0, Q=0): OB⁺_dR,log|_X̃≅B_dR⁺|_X̃[[y]] with y=log(e^{(a,a)}) and Fil^r=(ξ,y)^r, and Fil⁰OB_dR,log≅B_dR⁺{W} with W=y/t; ∑_n t^nW^{n²} lies in Fil⁰OB_dR,log but not in B_dR⁺[[y]][t⁻¹].
- The positive model uses formal power series B_dR⁺[[y]], the completed one t-adically convergent series B_dR⁺{W}; neither is replaced by the other.
- On every log affinoid perfectoid U over X̃ the presheaf value Ŝ_i is already the sheaf value OB⁺_dR,log(U) (the evaluation used by PerfectoidShimuraVarieties S6).

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-plus](#structural-log-period-plus), [HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete](#structural-log-period-complete), [HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods](#constant-log-periods), [HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower](#all-root-toric-tower), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-affinoid-perfectoid](#log-affinoid-perfectoid), `PadicHodgeTheory:P8:local-rational/bdr-plus-power-series-extension-lemma`, `PadicHodgeTheory:P8:local-rational/etale-algebras-over-torus-models`, `AdicSpacesPartII:R0/etale-algebraic-model`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 2.3.15, p. 18. Proposition 2.3.15 is part (2) of the node, for the toric chart X→E of §2.3 with P=P̄⊕Q.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark after the proof of Proposition 2.3.15, p. 19. The evaluation Ŝ_i≅OB⁺_dR,log(U) on log affinoid perfectoid U over X̃ stated in part (2).
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.3.17, p. 19. Corollary 2.3.17 gives Fil^rOB_dR,log≅t^rB_dR⁺{W} and the graded pieces, part (4) of the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.3.20, pp. 19–20. Corollary 2.3.20 is the stratum compatibility, part (5) of the node.

**Uses.**

- DLLZ-RH Corollaries 2.4.2 and 2.4.6: Reduce the Poincaré lemmas to explicit power-series complexes.
- DLLZ-RH Proposition 3.3.3 and §3.4: OC_log|_Z̃=Ô[W_1,…,W_n] computes Γ_geom-cohomology and residues.
- PerfectoidShimuraVarieties:S6: Evaluation of OB⁺_dR,log and Fil^rOB_dR,log on log affinoid perfectoid test objects over toric charts of the toroidal tower: Ŝ_i≅OB⁺_dR,log(U)≅B_dR⁺(U)[[P−1]].

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="log-poincare"></a>

### Logarithmic period Poincaré lemma

`HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare` · theorem · proposed declaration `TauCeti.LogAdic.log_poincare`.

Atlas planet: **Logarithmic Poincaré lemma**.

Let X be as in Remark 2.4.1 over a p-adic field k. On X_prokét, with tensor products over O_{X_prokét}: (1) 0→B_dR⁺→OB⁺_dR,log→OB⁺_dR,log⊗Ω^{log,1}_X→OB⁺_dR,log⊗Ω^{log,2}_X→⋯ (differentials ∇) is exact; (2) the same holds with B_dR and OB_dR,log; (3) for each r∈Z the subcomplex 0→Fil^rB_dR→Fil^rOB_dR,log→Fil^{r−1}OB_dR,log⊗Ω^{log,1}_X→Fil^{r−2}OB_dR,log⊗Ω^{log,2}_X→⋯ is exact; (4) for each r∈Z the quotient complex 0→gr^rB_dR→gr^rOB_dR,log→gr^{r−1}OB_dR,log⊗Ω^{log,1}_X→⋯ is exact and identifies with 0→Ô(r)→OC_log(r)→OC_log(r)⊗Ω^{log,1}_X(−1)→OC_log(r)⊗Ω^{log,2}_X(−2)→⋯ (Corollary 2.4.2). If f:X→X′ is log smooth with X and X′ both as in Remark 2.4.1, then 0→B⁺_dR,X⊗̂_{f⁻¹B⁺_dR,X′}f⁻¹OB⁺_dR,log,X′→OB⁺_dR,log,X→OB⁺_dR,log,X⊗Ω^{log,1}_{X/X′}→OB⁺_dR,log,X⊗Ω^{log,2}_{X/X′}→⋯ is exact, where ⊗̂ is the tensor product completed for the filtration (locally B⁺_dR,X[[y′_1,…,y′_{n′}]] in the base coordinates); the analogous complex with B_dR,X, B_dR,X′, OB_dR,log,X, OB_dR,log,X′ (first term locally B_dR,X{W′_1,…,W′_{n′}}) is exact and strictly compatible with the filtrations (Corollary 2.4.6, with the completed tensor product).

**Hypotheses and conventions.**

- k is a p-adic field and X is as in Remark 2.4.1: either (1) X is log smooth over k, or (2) X is a smooth intersection of irreducible components of a normal crossings divisor of a smooth Y over k, with the log structure pulled back from Y.
- In the relative statement f:X→X′ is log smooth and X′ is also as in Remark 2.4.1; Ω^log_{X/X′} is a vector bundle and 0→f*Ω^log_{X′}→Ω^log_X→Ω^log_{X/X′}→0 is exact.
- The first term of the relative complex is the filtration-completed tensor product; with the uncompleted tensor product printed in Corollary 2.4.6 exactness at OB⁺_dR,log,X fails.
- Exactness is a statement about sheaves on X_prokét, not about global sections.

**Construction or proof route.**

1. Étale locally choose a strictly étale toric chart X→E=Spa(k⟨P̄⟩,k⁺⟨P̄⟩) (Q=0 in case (1), Q a direct summand in case (2)) and pass pro-Kummer étale locally to X̃ (proof of Corollary 2.4.2).
2. By Proposition 2.3.15 and Corollary 2.3.17 replace OB⁺_dR,log and OB_dR,log by B_dR⁺|_X̃[[y_1,…,y_n]] and B_dR|_X̃{W_1,…,W_n}; Ω^log_X=⊕_jO_Xδ(a_j) (DLLZ-adic Theorem 3.3.17, Corollary 3.3.18, Proposition 3.2.25, Corollary 3.2.29) and ∇y_j=δ(a_j), ∇W_j=t⁻¹δ(a_j) ((2.4.3)–(2.4.4)).
3. Exactness, filtered and graded, is the formal Poincaré lemma for power series in the y_j, respectively the W_j (anti-derivatives preserve t-adic convergence; P8 formal-poincare-lemma); identify the graded complex using gr^rB_dR≅Ô(r) and gr^rOB_dR,log≅t^rÔ[W_1,…,W_n].
4. Relative case: take an injective sharp fs chart P′↪P (DLLZ-adic Propositions 3.1.4 and 3.1.10), compatible X̃→X̃′, and a′_{n′+1},…,a′_n∈P completing a basis of (P′)^gp_Q to one of P^gp_Q; then Ω^log_{X/X′}=⊕_{j>n′}O_Xδ(a′_j), the horizontal Q-linear combinations of the y_j are spanned by y′_1,…,y′_{n′}, and the same computation gives exactness with first term B⁺_dR,X[[y′_1,…,y′_{n′}]] (respectively B_dR,X{W′}).

**Acceptance checks.**

- In rank zero (Ω^log_X=0) the resolution is B_dR≅OB_dR,log with no higher log-coordinate terms.
- The filtration of the qth term is r−q, not r.
- For X=D¹ with log structure at 0, locally 0→B⁺_dR→B⁺_dR[[y]]→B⁺_dR[[y]]·dlog T→0 with ∇=∂/∂y⊗dlog T is exact.
- For the projection T²→T¹ (trivial log), the section ∑_k[T₂♭]^ky₁^k of B⁺_dR,X[[y₁,y₂]] is horizontal for ∇_{X/X′} but is not in the image of the uncompleted tensor product, so the completed tensor product is needed.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model](#toric-structural-period-model), [HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection](#structural-period-connection), [HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods](#constant-log-periods), [HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham](#analytic-log-de-rham), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent](#log-differential-descent), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-smooth-chart-criterion](#log-smooth-chart-criterion), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis](#log-perfectoid-basis), `PadicHodgeTheory:P8:local-rational/formal-poincare-lemma`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark 2.4.1, p. 20. Remark 2.4.1 gives the two cases (log smooth X, or a smooth stratum with pulled-back log structure) kept as the node's hypothesis.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.4.2 and its proof, pp. 20–21. The proof of Corollary 2.4.2 reduces parts (1)–(4) to the explicit power-series complexes, as in the node's proof sketch.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.4.6, p. 21. Corollary 2.4.6 is the relative Poincaré lemma with filtered strictness; the node uses the filtration-completed tensor product in its first term instead of the printed uncompleted one.

**Uses.**

- DLLZ-RH Lemma 3.3.2 and §3.6: The resolution computes Rµ′_*(L̂⊗OB_dR,log) and the de Rham comparison.
- DLLZ-RH Theorem 3.2.7(5): The relative version gives the relative log de Rham comparison.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="log-faltings-extension"></a>

### Logarithmic Faltings extension

`HodgeTateAndCanonicalSubgroups:T6:comparison/log-faltings-extension` · theorem · proposed declaration `TauCeti.LogAdic.log_faltings_extension`.

Let X be as in Remark 2.4.1 over a p-adic field k. There is a short exact sequence of Ô-modules on X_prokét 0→Ô(1)→gr¹OB⁺_dR,log→Ô⊗_{O_{X_prokét}}Ω^log_X→0 (Corollary 2.4.5). The first map is gr¹B_dR⁺≅Ô(1) followed by gr¹ of B_dR⁺→OB⁺_dR,log; the second is the graded piece of ∇, gr¹OB⁺_dR,log→gr⁰OB⁺_dR,log⊗Ω^log_X=Ô⊗Ω^log_X. Over a toric chart, on X̃ one has gr¹OB⁺_dR,log=Ô·ξ⊕⊕_jÔ·y_j with y_j↦δ(a_j), so the sequence is locally split.

**Hypotheses and conventions.**

- k is a p-adic field and X is as in Remark 2.4.1: either (1) X is log smooth over k, or (2) X is a smooth intersection of irreducible components of a normal crossings divisor of a smooth Y over k, with the log structure pulled back from Y.
- gr¹B_dR⁺≅Ô(1) is the canonical Galois-equivariant identification; Corollary 2.2.6 states it over a perfectoid base containing all roots of unity, and over k it is obtained on X_prokét/X_{k̂_∞} and descended.

**Construction or proof route.**

1. Over a toric chart and on X̃, Proposition 2.3.15 and (2.3.6) give gr¹OB⁺_dR,log=(ξ,y_1,…,y_n)/(ξ,y_1,…,y_n)²=Ô·ξ⊕⊕_jÔ·y_j.
2. By (2.4.3) and Ω^log_X=⊕_jO_Xδ(a_j), gr¹(∇) sends y_j to δ(a_j) and kills ξ; its kernel is Ô·ξ=gr¹B_dR⁺≅Ô(1) (Corollary 2.2.6 on X_prokét/X_{k̂_∞}); this is the r=1 positive part of the graded Poincaré complex of Corollary 2.4.2.
3. The maps are defined globally (gr¹ of B_dR⁺→OB⁺_dR,log and gr¹∇), so local exactness gives the sequence on X_prokét.

**Acceptance checks.**

- For the trivial log structure (X smooth) the sequence is P8's Faltings extension 0→Ô(1)→gr¹OB_dR⁺→Ô⊗Ω¹_X→0.
- For X=D¹ with log structure at 0, the class of y=log(e^{(a,a)}) maps to dlog T, which is not in Ô⊗Ω¹_X along T=0; a log coordinate contributes its dlog class.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model](#toric-structural-period-model), [HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods](#constant-log-periods), [HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection](#structural-period-connection), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare](#log-poincare), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent](#log-differential-descent), `PadicHodgeTheory:P8:local-rational/faltings-extension`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.4.5, p. 21. Corollary 2.4.5 is the node's short exact sequence; the node records the hypothesis of Remark 2.4.1 under which Corollary 2.4.2 is proved.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark 2.4.1, p. 20. The standing hypothesis on X for §2.4, kept by the node.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

## Logarithmic Riemann–Hilbert and relative comparison

Coefficient sheaves and decompletion give the target categories and direct-image functors. Regularity and normalized residues govern extension, pullback and the unipotent tensor subcategory; proper and relative comparisons then use those interfaces.

- [B_dR-coefficient structure sheaves on analytic sites](#bdr-coefficient-sheaves)
- [Filtered period log connections and Higgs reduction](#filtered-log-connection)
- [Decompletion of logarithmic Kummer towers](#log-tower-decompletion)
- [Logarithmic OC pushforward and coherence](#log-oc-pushforward)
- [Geometric logarithmic Riemann–Hilbert](#log-riemann-hilbert)
- [Geometric logarithmic Higgs functor](#log-higgs-functor)
- [Regularity and normalized log extensions](#log-regularity-and-extension)
- [Rational normalized logarithmic residues](#normalized-log-residues)
- [Arithmetic logarithmic de Rham functor](#arithmetic-log-de-rham)
- [Restricted logarithmic comparison under pullback](#log-rh-pullback)
- [Tensor comparison for unipotent boundary systems](#unipotent-log-tensor)
- [Proper logarithmic period cohomology comparison](#proper-log-period-cohomology)
- [Relative logarithmic de Rham comparison](#relative-log-comparison)

<a id="bdr-coefficient-sheaves"></a>

### B_dR-coefficient structure sheaves on analytic sites

`HodgeTateAndCanonicalSubgroups:T6:comparison/bdr-coefficient-sheaves` · construction · proposed declaration `TauCeti.LogAdic.BdRCoefficientSheaf`.

Let k be a p-adic field, K a perfectoid field containing k_∞, B_dR⁺=B_dR⁺(K,O_K), B_dR=B_dR(K,O_K), t=log[ε]∈B_dR⁺, and k→B_dR⁺ the unique lift of k→K (Definition 3.1.1(1)). For a locally noetherian adic space X over k, O_X⊗̂_k(B_dR⁺/t^r) is the sheaf on X_an associated with Spa(A,A⁺)↦A⊗̂_k(B_dR⁺/t^r); O_X⊗̂_kB_dR⁺=lim_rO_X⊗̂_k(B_dR⁺/t^r) and O_X⊗̂_kB_dR=(O_X⊗̂_kB_dR⁺)[t⁻¹], with Fil^r(O_X⊗̂_kB_dR⁺)=t^r(O_X⊗̂_kB_dR⁺) and Fil^r(O_X⊗̂_kB_dR)=t^{−s}Fil^{r+s}(O_X⊗̂_kB_dR⁺) for any s≥−r; the same on X_ét using étale maps from affinoids (Definition 3.1.1(2)–(4)). Lemma 3.1.4: (1) for affinoid X=Spa(A,A⁺), H^i(X_ét,O_{X_ét}⊗̂_k(B_dR⁺/t^r)) is A⊗̂_k(B_dR⁺/t^r) for i=0 and 0 for i>0; (2) gr^r(O_{X_ét}⊗̂_kB_dR)≅O_{X_ét}⊗̂_kK(r); (3) O_X⊗̂_k(B_dR⁺/t^r)≅λ_*(O_{X_ét}⊗̂_k(B_dR⁺/t^r))≅Rλ_*(O_{X_ét}⊗̂_k(B_dR⁺/t^r)), and likewise for B_dR⁺ and B_dR; (4) for affinoid X, finite projective A⊗̂_kB_dR⁺-modules, finite locally free O_X⊗̂_kB_dR⁺-modules and finite locally free O_{X_ét}⊗̂_kB_dR⁺-modules are equivalent; (5) λ_* is an equivalence from finite locally free O_{X_ét}⊗̂_k(B_dR⁺/t^r)-modules (resp. O_{X_ét}⊗̂_kB_dR⁺-modules) to the corresponding modules on X_an. The ringed spaces are X⁺=(X_an,O_X⊗̂_kB_dR⁺) and X=(X_an,O_X⊗̂_kB_dR) (3.1.5); a vector bundle on X⁺ is a finite locally free O_X⊗̂_kB_dR⁺-module, and vector bundles on X are the global sections of the stack obtained from vector bundles on X⁺ over open subspaces by passing to the t-isogeny category.

**Hypotheses and conventions.**

- k is a p-adic field and K a perfectoid field containing k_∞=k(µ_∞) (§3); X is any locally noetherian adic space over k.
- The tensor products are completed tensor products of Banach k-algebras (A⊗̂_k(B_dR⁺/t^r) with B_dR⁺/t^r a Banach k-algebra); the uncompleted O_X⊗_kB_dR⁺ is not used.
- A vector bundle on X is not required to come from a vector bundle on X⁺ by a global extension of scalars (unlike Liu–Zhu Definition 3.5).

**Construction or proof route.**

1. Define the sheaves on X_an and X_ét from the affinoid completed tensor products and take the limit over r and the localization at t.
2. Lemma 3.1.4: by Remark 3.1.3 (X_{K,an}, X_{K,ét} are generated by base changes from finite extensions k′ of k) the categories agree with those of Liu–Zhu §3.1, and the arguments of Liu–Zhu Lemmas 3.1–3.2, Proposition 3.3 and Corollary 3.4 apply: Tate acyclicity and Kiehl gluing for A⊗̂_k(B_dR⁺/t^r) by dévissage along t, gr^r via t^r, and étale descent for λ.
3. Form the stack of vector bundles on X⁺ over opens and its t-isogeny category to define vector bundles on X.

**Acceptance checks.**

- For X=Spa(k), O_X⊗̂_kB_dR⁺=B_dR⁺ with Fil^r=t^rB_dR⁺ and gr⁰=K.
- gr⁰(O_X⊗̂_kB_dR)=O_X⊗̂_kK, so finite locally free gr⁰-modules are vector bundles on X_{K,an} (Remark 3.1.3).

**Planning API.**

- `TauCeti.LogAdic.BdRCoefficientSheaf` (constructor): The sheaves O_X⊗̂_k(B_dR⁺/t^r), O_X⊗̂_kB_dR⁺=lim_r and O_X⊗̂_kB_dR=(⋯)[t⁻¹] on X_an and on X_ét.
- `TauCeti.LogAdic.BdRCoefficientSheaf.fil` (structure): Fil^r=t^r(O_X⊗̂_kB_dR⁺) and Fil^r(O_X⊗̂_kB_dR)=t^{−s}Fil^{r+s}(O_X⊗̂_kB_dR⁺) for any s≥−r; [a,b]-truncations (O_X⊗̂_kB_dR)^{[a,b]}=Fil^a/Fil^{b+1}.
- `TauCeti.LogAdic.BdRCoefficientSheaf.affinoid_sections` (characterisation): Lemma 3.1.4(1): on affinoid X=Spa(A,A⁺), sections are A⊗̂_k(B_dR⁺/t^r) and higher étale cohomology vanishes.
- `TauCeti.LogAdic.BdRCoefficientSheaf.grade` (compatibility): Lemma 3.1.4(2): gr^r(O_{X_ét}⊗̂_kB_dR)≅O_{X_ét}⊗̂_kK(r), Gal(K/k)-equivariantly.
- `TauCeti.LogAdic.BdRCoefficientSheaf.analytic_etale` (equivalence): Lemma 3.1.4(3),(5): the analytic sheaves are λ_* and Rλ_* of the étale ones, and λ_* is an equivalence on finite locally free modules.
- `TauCeti.LogAdic.BdRCoefficientSheaf.affinoid_modules` (equivalence): Lemma 3.1.4(4): on affinoid X, finite projective A⊗̂_kB_dR⁺-modules are equivalent to finite locally free modules on X_an and on X_ét.
- `TauCeti.LogAdic.BdRCoefficientSheaf.VectorBundle` (other): Vector bundles on X⁺ (finite locally free O_X⊗̂_kB_dR⁺-modules) and on X (t-isogeny stack); E⊗_{O_X}M for a vector bundle E on X_an.
- `TauCeti.LogAdic.BdRCoefficientSheaf.pullback` (functoriality): A morphism f:Y→X of locally noetherian adic spaces over k induces f⁻¹(O_X⊗̂_kB_dR⁺)→O_Y⊗̂_kB_dR⁺ compatibly with filtrations, with map_id and map_comp; Gal(K/k) acts through the coefficients.

**Discriminating unit tests.**

- `TauCeti.LogAdic.BdRCoefficientSheaf.point` (degenerate): For X=Spa(k,O_k), O_X⊗̂_kB_dR⁺=B_dR⁺(K,O_K) with Fil^r=t^rB_dR⁺ and gr⁰=K.
- `TauCeti.LogAdic.BdRCoefficientSheaf.gr_zero` (computation): gr⁰(O_X⊗̂_kB_dR)=O_X⊗̂_kK; for X=Spa(k⟨T⟩) its sections are K⟨T⟩.
- `TauCeti.LogAdic.BdRCoefficientSheaf.not_algebraic_tensor` (non-example): For X=Spa(k⟨T⟩), the section ∑_np^nx_nT^n of O_X⊗̂_kK, with x_n∈O_K linearly independent over k, is not in k⟨T⟩⊗_kK, whose elements have coefficients in a finite-dimensional k-subspace of K.
- `TauCeti.LogAdic.BdRCoefficientSheaf.twist` (characterisation): Gal(K/k) acts on gr¹(O_X⊗̂_kB_dR⁺)=t·(O_X⊗̂_kK) through σ(tf)=χ(σ)t·σ(f), so gr¹≅O_X⊗̂_kK(1) and not O_X⊗̂_kK as Galois-equivariant sheaves.

**Prerequisites.** `PadicHodgeTheory:R06.1/de-rham-period-ring`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R3`, `ClassicalAdicEtaleCohomology:H0`, `EnhancedDerivedSheaves:E1`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 3.1.1(1), p. 22. Definition 3.1.1 fixes B_dR⁺=B_dR⁺(K,O_K), t=log[ε] and the lift k→B_dR⁺ used to form O_X⊗̂_kB_dR⁺, as in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.1.4, p. 22. Introduces Lemma 3.1.4 with the proof route through Liu–Zhu recorded in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.1.4(5), p. 23. Lemma 3.1.4(5), the equivalence between étale and analytic finite locally free modules used in Proposition 3.3.3.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (3.1.5) and following, p. 23. The definition of vector bundles on X⁺ and X recorded in the node.

**Uses.**

- DLLZ-RH Definitions 3.1.6–3.1.7: The ringed spaces X⁺ and X carry log connections, t-connections and Higgs fields.
- DLLZ-RH Lemma 3.3.2 and Proposition 3.3.3: Lemma 3.1.4(3),(5) reduce µ′_* to ν′_* on the étale site.
- DLLZ-RH Theorem 3.2.3: RH_log(L) is a vector bundle on X with filtration by locally free O_X⊗̂_kB_dR⁺-submodules.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="filtered-log-connection"></a>

### Filtered period log connections and Higgs reduction

`HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection` · definition · proposed declaration `TauCeti.LogAdic.FilteredLogConnection`.

Let k be a p-adic field, K a perfectoid field containing k_∞, X a log smooth fs log adic space over k, and X⁺=(X_an,O_X⊗̂_kB_dR⁺), X=(X_an,O_X⊗̂_kB_dR) as in bdr-coefficient-sheaves, with Ω^log_{X/B_dR}=Ω^log_X⊗̂_kB_dR and Ω^log_{X⁺/B_dR⁺}=Ω^log_X⊗̂_kB_dR⁺ (Definition 3.1.6). (1) A log connection on a vector bundle E on X is a B_dR-linear ∇:E→E⊗_{O_X}Ω^log_{X/B_dR} with the usual Leibniz rule; it is integrable if ∇²=0, with log de Rham complex DR_log(E)=(E⊗Ω^{log,•}_{X/B_dR},∇). (2) A log t-connection on a vector bundle E⁺ on X⁺ is a B_dR⁺-linear ∇⁺:E⁺→E⁺⊗_{O_{X⁺}}Ω^log_{X⁺/B_dR⁺} with ∇⁺(fe)=(te)⊗df+f∇⁺(e); it is integrable if (∇⁺)²=0. (3) A log Higgs bundle on X_K is a vector bundle E on X_{K,an} with an O_{X_K}-linear θ:E→E⊗Ω^log_{X_K}(−1) such that θ∧θ=0, with Higgs complex (E⊗Ω^{log,•}_{X_K}(−•),θ). (4) A log connection on a coherent sheaf E on X is a k-linear ∇:E→E⊗Ω^log_X with the Leibniz rule; a decreasing filtration by coherent subsheaves with ∇(Fil^rE)⊂Fil^{r−1}E⊗Ω^log_X gives Fil^rDR_log(E)=(Fil^{r−•}E⊗Ω^{log,•}_X,∇) with O_X-linear graded differentials (Definition 3.1.7). A filtered log connection on X is an integrable log connection (E,∇) on X with a decreasing filtration (Fil^r)_{r∈Z} by locally free O_X⊗̂_kB_dR⁺-submodules satisfying Griffiths transversality ∇(Fil^r)⊂Fil^{r−1}⊗Ω^log_{X⁺/B_dR⁺} (the target of Theorem 3.2.3(1)). Lemma 3.1.8: (E⁺,∇⁺)↦(E⁺⊗_{B_dR⁺}B_dR,t⁻¹∇⁺,{t^rE⁺}_{r≥0}) is an equivalence from integrable log t-connections on X⁺ to integrable log connections on X with filtrations {Fil^r}_{r≥0} by locally free O_X⊗̂_kB_dR⁺-submodules satisfying Fil^r=t·Fil^{r−1} (r≥1) and Griffiths transversality. Lemma 3.1.9: (E⁺,∇⁺)↦(E⁺/t,∇⁺ mod t) is a functor to log Higgs bundles on X_K.

**Hypotheses and conventions.**

- k is a p-adic field, K a perfectoid field containing k_∞=k(µ_∞), B_dR⁺=B_dR⁺(K,O_K) and t=log[ε] (Definition 3.1.1(1)); X is log smooth fs over k (for (4), X as in Definition 3.1.7(4)).
- Connections on X are B_dR-linear, t-connections B_dR⁺-linear, Higgs fields O_{X_K}-linear and valued in Ω^log_{X_K}(−1), coherent connections k-linear; a t-connection is not an ordinary connection modulo t.
- Filtrations of filtered log connections are by locally free O_X⊗̂_kB_dR⁺-submodules indexed by r∈Z; Lemma 3.1.8 concerns only filtrations {Fil^r}_{r≥0} with Fil^r=t·Fil^{r−1}.

**Construction or proof route.**

1. Instantiate the CR.5 log-connection and log de Rham notions on the ringed spaces X⁺ and X of bdr-coefficient-sheaves, with Ω^log_{X/B_dR} of Definition 3.1.6.
2. Lemma 3.1.8: t⁻¹∇⁺ satisfies the usual Leibniz rule and maps t^rE⁺ into t^{r−1}E⁺⊗Ω^log; conversely E⁺=Fil⁰ and ∇⁺=t∇|_{Fil⁰}, using Fil^r=t·Fil^{r−1} and transversality.
3. Lemma 3.1.9: modulo t the term (te)⊗df vanishes, so ∇⁺ induces an O_{X_K}-linear map with θ∧θ=0 from (∇⁺)²=0; since ∇⁺=t∇ and σ(t)=χ(σ)t, θ is Gal(K/k)-equivariant as a map to E⊗Ω^log_{X_K}(−1).

**Acceptance checks.**

- The graded differential is O-linear; its Tate twist is −1.
- Lemma 3.1.8 sends (E⁺,∇⁺) to the filtration {t^rE⁺}_{r≥0}; it does not produce arbitrary transversal filtrations.

**Planning API.**

- `TauCeti.LogAdic.FilteredLogConnection` (constructor): An integrable B_dR-linear log connection on a vector bundle on X with a decreasing filtration by locally free O_X⊗̂_kB_dR⁺-submodules satisfying Griffiths transversality.
- `TauCeti.LogAdic.FilteredLogConnection.transversality` (relation): ∇(Fil^r)⊂Fil^{r−1}⊗Ω^log; on the de Rham complex the qth term carries Fil^{r−q} and the differential maps Fil^{r−q} into Fil^{r−q−1}.
- `TauCeti.LogAdic.FilteredLogConnection.t_connection` (equivalence): Lemma 3.1.8: (E⁺,∇⁺)↦(E⁺⊗B_dR,t⁻¹∇⁺,{t^rE⁺}_{r≥0}) is an equivalence onto filtered log connections with Fil^r=t·Fil^{r−1} for r≥1.
- `TauCeti.LogAdic.FilteredLogConnection.higgs` (functoriality): Lemma 3.1.9: reduction of an integrable log t-connection modulo t is a log Higgs bundle E⁺/t→E⁺/t⊗Ω^log_{X_K}(−1), functorial in (E⁺,∇⁺).
- `TauCeti.LogAdic.FilteredLogConnection.de_rham_complex` (other): The log de Rham complex DR_log(E)=(E⊗Ω^{log,•}_{X/B_dR},∇) and log de Rham cohomology H^i_{log dR}(X,E)=H^i(X,DR_log(E)) (Definition 3.1.7(1)).
- `TauCeti.LogAdic.FilteredLogConnection.higgs_complex` (other): For a log Higgs bundle, the complex (E⊗Ω^{log,•}_{X_K}(−•),θ) and H^i_{log Higgs}(X_K,E) (Definition 3.1.7(3)).
- `TauCeti.LogAdic.FilteredLogConnection.coherent_filtered` (other): Definition 3.1.7(4): a k-linear log connection on a coherent sheaf with a Griffiths-transversal coherent filtration, Fil^rDR_log(E)=(Fil^{r−•}E⊗Ω^{log,•}_X,∇), log Hodge cohomology H^{a,b}_{log Hodge}=H^{a+b}(X,gr^aDR_log(E)) and the Hodge–de Rham spectral sequence.

**Discriminating unit tests.**

- `TauCeti.LogAdic.FilteredLogConnection.trivial` (degenerate): E=O_X⊗̂_kB_dR with ∇=d⊗1 and Fil^r=t^r(O_X⊗̂_kB_dR⁺) is a filtered log connection; under Lemma 3.1.8 it corresponds to (O_X⊗̂_kB_dR⁺,t·d), whose reduction modulo t is (O_{X_K},θ=0).
- `TauCeti.LogAdic.FilteredLogConnection.mod_t_linear` (computation): The term (te)⊗df vanishes modulo t, so the reduced map is O-linear.
- `TauCeti.LogAdic.FilteredLogConnection.not_unshifted` (non-example): The filtered de Rham qth term has Fil^{r−q}; an unshifted Fil^r in every degree does not encode transversality.
- `TauCeti.LogAdic.FilteredLogConnection.higgs_twist` (characterisation): If ∇ is Gal(K/k)-equivariant then ∇⁺=t∇ satisfies ∇⁺(σe)=χ(σ)⁻¹σ(∇⁺e), so θ=∇⁺ mod t is equivariant as a map to E⊗Ω^log_{X_K}(−1) and not to E⊗Ω^log_{X_K}(1).

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/bdr-coefficient-sheaves](#bdr-coefficient-sheaves), [HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham](#analytic-log-de-rham), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent](#log-differential-descent).

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 3.1.7(2), p. 24. The modified Leibniz rule defining log t-connections, as in part (2) of the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 3.1.7(3), p. 24. The definition of log Higgs bundles with the (−1) twist, part (3) of the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.1.8, p. 24. Lemma 3.1.8, the equivalence with filtrations {t^rE⁺}_{r≥0}, Fil^r=t·Fil^{r−1}, recorded in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.1.9, p. 24. Lemma 3.1.9, reduction modulo t to log Higgs bundles, recorded in the node.

**Uses.**

- DLLZ-RH Theorem 3.2.3: Describes the geometric RH target category.
- DLLZ-RH Theorem 3.2.4: Its degree-zero reduction gives the log Higgs functor.
- DLLZ-RH Theorem 3.2.7: Part (4) is the target category of D_dR,log and the log Hodge–de Rham spectral sequence.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="log-tower-decompletion"></a>

### Decompletion of logarithmic Kummer towers

`HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion` · theorem · proposed declaration `TauCeti.LogAdic.log_tower_decompletion`.

A triple ({A_i}_{i∈I},Â_∞,Γ) (filtered system of topological rings, a complete ring Â_∞ with lim A_i→Â_∞ of dense image, a topological group Γ acting compatibly) is a decompletion system if (1) every finite projective Γ-module L_∞ over Â_∞ has a model, a finite projective Γ-module L_i over some A_i with L_i⊗_{A_i}Â_∞≅L_∞, and (2) for every model there is i_0≥i such that L_i⊗_{A_i}A_{i′} is good, H^•(Γ,L_{i′})≅H^•(Γ,L_∞), for all i′≥i_0 (Definition A.1.2); then lim_iProj_{A_i}(Γ)→Proj_{Â_∞}(Γ) is an equivalence and two models agree after base change (Remark A.1.3). Twisted models (Corollary A.1.21): if the triple is weakly (resp. stably) decompleting with initial index 0 and {ψ_s:Γ→A_0^×}_{s∈S} is a family of continuous characters such that for every open neighbourhood U of 1 in A_0 some open neighbourhood V of 1 in Γ has ψ_s(V)⊂U for all s, then for a model L_i of a finite free (resp. finite projective) L_∞ each L_i(ψ_s)=L_i⊗_{A_0}A_0(ψ_s) is a model of L_∞(ψ_s), and there is i_0≥i such that L_{i′}(ψ_s) is good for all i′≥i_0 and all s∈S simultaneously. The following are decompletion systems. (A.2.1.2) Arithmetic towers: for a Huber pair (A,A⁺) over (Q_p,Z_p), A_{p^l}=A⊗_{Q_p}Q_p(µ_{p^l}) and Â_{p^∞} the p-adic completion of ∪_lA_{p^l}, all stably uniform, ({A_{p^l}}_{l≥0},Â_{p^∞},Γ_1) with Γ_1=Gal(Q_p(µ_{p^∞})/Q_p); also with A_{p^l}=A⊗_kk(µ_{p^l}) for a Banach algebra A over a p-adic field k (Remark A.2.1.3). (A.2.2.3) Geometric towers: in the setup of §2.3 (X=Spa(A,A⁺) strictly étale over E, X̃ with ring Â_∞), ({A_{m,k̂_∞}}_{m≥1},Â_∞,Γ̃) with Γ_1=Hom(P^gp_Q/P^gp,µ_∞)≅Hom(P^gp,Ẑ(1)) acting by γT^a=γ(a)T^a and Γ̃=Γ_1⋊Gal(k_∞/k), and also for every closed subgroup of Γ̃ containing Γ_1 (Remark A.2.2.4). (A.2.3.4) Deformations: for every r≥1, ({B_{r,m}}_{m≥1},B̂_{r,∞},Γ_1) with B_{r,m}=A⊗̂_k(B_dR⁺/ξ^r)⊗_{(B_dR⁺/ξ^r)⟨P⟩}(B_dR⁺/ξ^r)⟨(1/m)P⟩ and B̂_{r,∞}≅B_dR⁺(X̃)/ξ^r (Lemma 2.3.11). The first two triples are stably decompleting (Propositions A.2.1.1, A.2.2.1); the third is only shown to be weakly decompleting (Proposition A.2.3.3), and A.2.3.4 is not asserted to be stably decompleting.

**Hypotheses and conventions.**

- Arithmetic towers: (A_{p^l},A_{p^l}⁺) and (Â_{p^∞},Â_{p^∞}⁺) stably uniform; Remark A.2.1.3 for Banach algebras over a p-adic field.
- Geometric and deformation towers: k a p-adic field and the setup of §2.3 (toric chart X=Spa(A,A⁺)→E strictly étale, all-root tower, norms as in Appendix A.2.2–A.2.3).
- Decompletion is asserted only for these towers and their pullbacks used in §3.3 (R_{K,m}, the boundary quotients R̄_{K,m}, and {R′_{p^l}}); no arbitrary tower is asserted to decomplete.

**Construction or proof route.**

1. General formalism (requested from PerfectoidSpaces P3 Part II): a weakly decompleting triple (Definition A.1.6: isometric action, isometric splittings of Â_∞→Â_∞/A_i, uniform strict exactness of C^•(Γ_i,Â_∞/A_i)) is a weak decompletion system (Theorem A.1.8); a stably decompleting triple (Definition A.1.9) is a decompletion system (Theorem A.1.10).
2. Arithmetic towers: the Tate–Sen estimates with Banach coefficients (Berger–Colmez TS(3)) give uniform strict exactness with constant p², norm-direct supplements give the splittings, and rational localization gives stability (Proposition A.2.1.1); combine with Theorem A.1.10.
3. Geometric towers: spectral norm, the decomposition (A.2.2.2) of k_∞⁺[P_{Q≥0}] into finite-order Γ_1-characters, and DLLZ-adic Lemma 6.1.7 give constant c=p^{1/(p−1)}; rational subsets are stabilized by open subgroups (Proposition A.2.2.1); combine with Theorem A.1.10.
4. Deformations: (A.2.2.2) gives submetric splittings, Lemma A.2.3.2 and induction on r give uniform strict exactness with constant (2|ϖ|⁻¹)^{r−1}c^r (Proposition A.2.3.3); models come from freeness over a finite rational cover, Theorem A.1.8 and gluing (Liu–Zhu, Proposition 3.3), and goodness from the ξ-adic dévissage to r=1 (Theorem A.2.3.4).

**Acceptance checks.**

- For r=1 the deformation tower is the geometric tower: B_{1,m}=A_{m,k̂_∞} and B̂_{1,∞}=Â_∞ with equivalent norms.
- For P=Z_{≥0}, (A.2.2.2) reads k_∞⁺[Q_{≥0}]=k_∞⁺[Z_{≥0}]⊕⊕_{χ≠1}(k_∞⁺[Q_{≥0}])_χ, the χ-part spanned by the T^a with a∉Z on which Γ_1 acts through χ.
- Decompletion is not used beyond the listed towers; Remark 3.3.12 (non-isomorphic boundary comparison) is a property of the unipotent part, not of the models.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/all-root-toric-tower](#all-root-toric-tower), [HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model](#toric-structural-period-model), [HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology](#toric-kummer-cohomology), `ClassicalAdicEtaleCohomology:H0`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition A.1.2(2), p. 67. The good-model condition of a decompletion system, stated in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem A.2.1.2 and its proof, p. 73. Proof of Theorem A.2.1.2 (arithmetic towers are decompletion systems) from stable decompletion and Theorem A.1.10, as in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem A.2.2.3 and its proof, p. 74. Proof of Theorem A.2.2.3 (geometric towers) from Proposition A.2.2.1 and Theorem A.1.10; the theorem prints {A_m} for the tower {A_{m,k̂_∞}} of Proposition A.2.2.1.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem A.2.3.4, pp. 75–76. Theorem A.2.3.4 for the deformation towers B_{r,m}, every r≥1, as in the node.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="log-oc-pushforward"></a>

### Logarithmic OC pushforward and coherence

`HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward` · theorem · proposed declaration `TauCeti.LogAdic.log_oc_pushforward`.

Let k be a p-adic field, K a perfectoid field containing k_∞, X a smooth rigid analytic variety over k with the log structure of a normal crossings divisor D (Example 2.1.2), and Z either X or an open subspace of a smooth intersection of irreducible components of D with the log structure pulled back from X; µ′_Z:Z_prokét/Z_K→Z_an. For a Q_p-local system L on X_két with pullback L̂_Z: (1) R^iµ′_{Z,*}(L̂_Z⊗_{Q̂_p}OC_log,Z)=0 for all i>0; (2) µ′_{Z,*}(L̂_Z⊗_{Q̂_p}OC_log,Z) is a finite locally free O_Z⊗̂_kK-module (=gr⁰(O_Z⊗̂_kB_dR)), of rank rk_{Q_p}L if Z=X (Proposition 3.3.3). Locally, for a smooth toric chart X→Dⁿ with Z={T_1=⋯=T_l=0} and K=k̂_∞, H⁰(Z_prokét/Z_K,L̂_Z⊗OC_log,Z)≅L(Z_K), the unipotent part of a good decompleted model, and the higher cohomology vanishes (Lemma 3.3.15); L(Z_K) is finite projective over R̄_K, of rank rk L if Z=X, and its formation commutes with compositions of rational embeddings and finite étale maps Y→Z (Lemma 3.3.16). The natural map L(X_K)⊗_{R_K}R_{K,m_0}→L_{m_0}(X_K) need not be an isomorphism (Remark 3.3.12), and L(X_K)/(T_1,…,T_l)→L(Z_K) is in general only surjective (Remark 3.3.14).

**Hypotheses and conventions.**

- k is a p-adic field and K a perfectoid field containing k_∞=k(µ_∞) (§3); the proof reduces to K=k̂_∞ and obtains larger K by base change.
- X is smooth over k with the log structure of a normal crossings divisor D (Example 2.1.2), not necessarily strict normal crossings; Z is X or an open subspace of a smooth intersection of irreducible components of D (second case of Remark 2.4.1).
- L is any Q_p-local system on X_két (no unipotence or de Rham hypothesis); the rank statement is only for Z=X.

**Construction or proof route.**

1. Reduce to K=k̂_∞, to ν′_Z:Z_prokét/Z_K→Z_ét by Lemma 3.1.4(5) (bdr-coefficient-sheaves), and to affinoid X with a smooth toric chart and Z={T_1=⋯=T_l=0}; then (L̂_Z⊗OC_log,Z)|_Z̃≅L_Z|_Z̃[W_1,…,W_n] (Corollary 2.3.17), and it suffices to prove statements (a) and (b) of §3.3.
2. By Theorem A.2.2.3, L_X(X̃) has a good model L_{m_0}(X_K) over R_{K,m_0}; by DLLZ-adic Lemma 6.3.6 its reduction L_{m_0}(Z_K) is a model of L_Z(Z̃), good after enlarging m_0.
3. Lemma 3.3.8: Γ_geom acts quasi-unipotently (descent to k′(µ_{p^l}) by Theorem A.2.1.2 and Remark A.2.1.3, then the argument of Liu–Zhu Lemma 2.15); decompose by finite-order characters τ (3.3.9), take unipotent parts (3.3.10); (3.3.11) gives rank rk L for Z=X.
4. For τ≠1 some γ_j−1 is invertible, so only the unipotent part contributes; Lemma 3.3.5 (DLLZ-adic Theorem 5.4.4 and Corollary 2.3.17) identifies pro-Kummer cohomology with Γ_geom-cohomology, the W-variable argument of Liu–Zhu Lemma 2.9 gives Lemma 3.3.15, and base change of good models (Definition A.1.2) gives Lemma 3.3.16, hence (a), (b) and the proposition.

**Acceptance checks.**

- Keep the non-surjective boundary-model comparison of Remark 3.3.12 as a rejection test for an overly strong base-change claim.
- For Z≠X the rank of µ′_{Z,*}(L̂_Z⊗OC_log,Z) can be smaller than rk L (only the unipotent part along the stratum survives); no rank equality is asserted there.
- For L trivial of rank one and Z=X, the pushforward is O_X⊗̂_kK, with L(X_K)=R_K.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion](#log-tower-decompletion), [HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model](#toric-structural-period-model), [HodgeTateAndCanonicalSubgroups:T6:comparison/structural-log-period-complete](#structural-log-period-complete), [HodgeTateAndCanonicalSubgroups:T6:comparison/bdr-coefficient-sheaves](#bdr-coefficient-sheaves), [HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems](#completed-kummer-local-systems), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity](#log-perfectoid-almost-acyclicity), [HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy](#geometric-boundary-monodromy), `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H0/profinite-g-set-cohomology`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 3.3.3 and the definition of Z before Lemma 3.3.2, p. 28. Proposition 3.3.3 for Z equal to X or an open subspace of a smooth stratum of D; the node keeps 'rank rk L if Z=X' and reads gr⁰(O_X⊗̂_kB_dR) as O_Z⊗̂_kK.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.3.15, p. 31. Lemma 3.3.15: the pro-Kummer cohomology of L̂_Z⊗OC_log,Z is the unipotent part L(Z_K) in degree 0 and vanishes above, as in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.3.16, p. 31. Lemma 3.3.16: rank and base-change compatibility of L(Z_K), as in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark 3.3.12, p. 31. Remark 3.3.12: the comparison of the unipotent part with the full model need not be an isomorphism; the node keeps this as a rejection test.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="log-riemann-hilbert"></a>

### Geometric logarithmic Riemann–Hilbert

`HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert` · construction · proposed declaration `TauCeti.LogAdic.LogRH`.

Atlas planet: **Logarithmic Riemann–Hilbert**.

Let k be a p-adic field (complete, discretely valued, characteristic 0, perfect residue field of characteristic p), K a perfectoid field containing k_∞=k(µ_∞), X a smooth rigid analytic variety over k with the log structure of a normal crossings divisor D, 𝒳=(X_an,O_X⊗̂_k B_dR) and µ′:X_prokét/X_K→X_an. For a Q_p-local system L on X_két, RH_log(L)=Rµ′_*(L̂⊗_{Q̂_p}OB_dR,log) is concentrated in degree zero, and L↦RH_log(L) is an exact functor to Gal(K/k)-equivariant vector bundles on 𝒳 of rank rk_{Q_p}L, with integrable log connection ∇_L:RH_log(L)→RH_log(L)⊗Ω^log_{𝒳/B_dR} and decreasing filtration Fil^r RH_log(L)=µ′_*(L̂⊗Fil^r OB_dR,log), r∈Z, by locally free O_X⊗̂_k B_dR⁺-submodules satisfying Griffiths transversality. It is not asserted to be a tensor functor on all Q_p-local systems.

**Hypotheses and conventions.**

- k is a p-adic field in the DLLZ-RH sense and K is any perfectoid field containing k_∞ (DLLZ-RH §3 opening); Gal(K/k) is the group of continuous automorphisms of K over k. The proofs may first take K=k̂_∞ and then base change.
- D is a reduced normal crossings divisor as in DLLZ-RH Example 2.1.2 (étale locally SNC with smooth toric charts).
- L is a Q_p-local system on X_két; tensor compatibility is the separate unipotent theorem.

**Construction or proof route.**

1. By the OC pushforward theorem (Proposition 3.3.3), R^iµ′_*(L̂⊗OC_log)=0 for i>0 and µ′_*(L̂⊗OC_log) is finite locally free of rank rk L; induct over gr^r OB_dR,log≅OC_log(r) and pass to the t-adic limit (as in LZ17 Theorems 2.1(i), 3.8(i)) to get Rµ′_*(L̂⊗Fil^r OB_dR,log) locally free over O_X⊗̂_k B_dR⁺ of rank rk L for every r (§3.3, pp. 27–28).
2. Invert t: RH_log(L)≅Rµ′_*(L̂⊗Fil⁰OB_dR,log)[t⁻¹] is a vector bundle on 𝒳 with the stated filtration; the Gal(K/k)-action comes from factoring µ′ through X_K,prokét→X_K,ét→X_K,an→X_an.
3. Transport the structural period connection by the projection formula (3.3.1); integrability and Griffiths transversality come from those of the connection (2.2.17).
4. Exactness follows from the vanishing of all higher direct images in the first step.

**Acceptance checks.**

- Its rank equals that of L, without a de Rham assumption on L.
- K ranges over all perfectoid fields containing k_∞; the comparison theorems that need K to be the completion of k̄ are separate nodes.

**Planning API.**

- `TauCeti.LogAdic.LogRH` (constructor): The geometric derived pushforward Rµ′_*(L̂⊗OB_dR,log), identified with a degree-zero Gal(K/k)-equivariant filtered vector bundle on 𝒳 with integrable log connection.
- `TauCeti.LogAdic.LogRH.rank` (structure): The bundle has rank rk_{Q_p}L.
- `TauCeti.LogAdic.LogRH.grade` (compatibility): gr^r RH_log(L)≅µ′_*(L̂⊗OC_log)(r) for every r∈Z; this is H_log(L)(r) once the log Higgs functor is defined.
- `TauCeti.LogAdic.LogRH.plus` (characterisation): RH⁺_log(L)=Fil⁰RH_log(L) is a vector bundle on 𝒳⁺ with integrable log t-connection t∇_L, and Fil^r RH_log(L)=t^r RH⁺_log(L) for all r (Lemma 3.1.8).
- `TauCeti.LogAdic.LogRH.exact` (functoriality): L↦RH_log(L) is exact, and R^iµ′_*(L̂⊗Fil^r OB_dR,log)=0 for i>0 and all r.
- `TauCeti.LogAdic.LogRH.map_comp` (functoriality): Pushforward of coefficient maps preserves identities and composition.
- `TauCeti.LogAdic.LogRH.restrict_open` (compatibility): For an open immersion j:X′→X with the restricted divisor, j*RH_log(L)≅RH_log(j⁻¹L) compatibly with connections and filtrations (Remark 3.5.1).
- `TauCeti.LogAdic.LogRH.trivial_log` (compatibility): Trivial-log specialization is the ordinary RH functor with the corrected filtration-completed structural periods.

**Discriminating unit tests.**

- `TauCeti.LogAdic.LogRH.constant` (computation): RH_log(Q_p)≅O_X⊗̂_k B_dR with connection d⊗1 (all residues zero) and Fil^r=t^r(O_X⊗̂_k B_dR⁺) (Lemma 3.3.2 with the whole interval).
- `TauCeti.LogAdic.LogRH.zero` (degenerate): The zero local system gives the zero bundle.
- `TauCeti.LogAdic.LogRH.fractional_residue` (non-example): A finite boundary character with normalized residue 2/3 has a tensor square with normalized residue 1/3; it cannot be modeled by an unrestricted tensor functor adding residues to 4/3.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward](#log-oc-pushforward), [HodgeTateAndCanonicalSubgroups:T6:comparison/structural-period-connection](#structural-period-connection), [HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection](#filtered-log-connection), [HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems](#completed-kummer-local-systems), `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`, [HodgeTateAndCanonicalSubgroups:T6:comparison/bdr-coefficient-sheaves](#bdr-coefficient-sheaves).

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §3 opening, p. 22. Fixes the coefficient field: K is any perfectoid field containing k_∞ (k a p-adic field, k̄ its algebraic closure, bar lost in extraction); the node uses exactly this generality.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (3.2.2) and Theorem 3.2.3(1), p. 25. States that RH_log(L)=Rµ′_*(L̂⊗OB_dR,log) is an exact functor to Gal(K/k)-equivariant vector bundles on 𝒳 with integrable log connection and locally free O_X⊗̂B_dR⁺-lattice filtration, as in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §3.3, proof of Theorem 3.2.3(1), pp. 27–28. Gives the rank rk_{Q_p}L of RH_log(L) on 𝒳 and its filtration Fil^r=µ′_*(L̂⊗Fil^r OB_dR,log), deduced from the locally free B_dR⁺-lattices; no de Rham hypothesis is used.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §3.3, (3.3.1) and following, p. 28. Constructs ∇_L by the projection formula and derives integrability and Griffiths transversality from the structural period connection, as in the node's proof steps.

**Uses.**

- DLLZ-RH Theorem 5.3.1: Arithmetic descent and normalized boundary extension compare canonical coefficients.
- BP Proposition 4.4.38: Uses the canonical p-adic/de Rham association.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="log-higgs-functor"></a>

### Geometric logarithmic Higgs functor

`HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor` · construction · proposed declaration `TauCeti.LogAdic.LogHiggs`.

In the setting of the geometric log Riemann–Hilbert functor, H_log(L):=gr⁰RH_log(L)=RH⁺_log(L)/t≅µ′_*(L̂⊗OC_log) defines a natural functor from Q_p-local systems on X_két to Gal(K/k)-equivariant log Higgs bundles θ_L:H_log(L)→H_log(L)⊗Ω^log_{X_K}(−1) on X_K,an, of rank rk_{Q_p}L, where θ_L is the reduction modulo t of the log t-connection t∇_L on RH⁺_log(L)=Fil⁰RH_log(L) (Lemmas 3.1.8–3.1.9), so θ_L∧θ_L=0. Its log Higgs complex has degree q term H_log(L)⊗Ω^{log,q}_{X_K}(−q).

**Hypotheses and conventions.**

- Same p-adic field k, perfectoid K⊇k_∞ and normal crossings pair (X,D) as RH_log; use the −q twists in the complex (Definition 3.1.7(3)).

**Construction or proof route.**

1. By Lemma 3.1.8, RH⁺_log(L)=Fil⁰RH_log(L) is a vector bundle on 𝒳⁺ with integrable log t-connection t∇_L; reduce it modulo t (Lemma 3.1.9) to get an O_{X_K}-linear θ_L with θ_L∧θ_L=0.
2. Identify gr⁰RH_log(L) with µ′_*(L̂⊗OC_log), finite locally free of rank rk L, by the OC pushforward theorem (Proposition 3.3.3).
3. Galois equivariance and functoriality are inherited from RH_log.

**Acceptance checks.**

- The Tate twist cannot be discarded when describing the Higgs field.

**Planning API.**

- `TauCeti.LogAdic.LogHiggs` (constructor): Degree-zero reduction with its O-linear integrable log Higgs field.
- `TauCeti.LogAdic.LogHiggs.underlying` (compatibility): Its underlying module is gr⁰ RH_log(L).
- `TauCeti.LogAdic.LogHiggs.pushforward_OC` (characterisation): H_log(L)≅µ′_*(L̂⊗OC_log), and R^iµ′_*(L̂⊗OC_log)=0 for i>0.
- `TauCeti.LogAdic.LogHiggs.rank` (structure): H_log(L) is a vector bundle on X_K,an of rank rk_{Q_p}L.
- `TauCeti.LogAdic.LogHiggs.field` (projection): The field takes values in Ω¹_log(−1).
- `TauCeti.LogAdic.LogHiggs.complex` (structure): The log Higgs complex (H_log(L)⊗Ω^{log,•}_{X_K}(−•),θ_L) and its hypercohomology H^i_logHiggs(X_K,an,H_log(L)) (Definition 3.1.7(3)).
- `TauCeti.LogAdic.LogHiggs.map_comp` (functoriality): The assignment preserves identity and composition of coefficient morphisms.

**Discriminating unit tests.**

- `TauCeti.LogAdic.LogHiggs.constant` (degenerate): The constant local system has H_log(Q_p)=O_{X_K} with zero log Higgs field.
- `TauCeti.LogAdic.LogHiggs.twist` (compatibility): The qth Higgs-complex term carries Tate twist −q.
- `TauCeti.LogAdic.LogHiggs.residue` (computation): For X the closed unit disc over k with D={T=0} and a rank-two Q_p-local system on X_két whose boundary inertia acts unipotently but nontrivially, θ_L is nonzero, θ_L∧θ_L=0, and its residue along D is a nonzero nilpotent endomorphism of H_log(L)|_D (valued in the (−1) twist); for the constant system the residue is zero.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert](#log-riemann-hilbert), [HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection](#filtered-log-connection), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward](#log-oc-pushforward).

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.4(1), p. 25. States the existence of the natural functor H_log to Gal(K/k)-equivariant log Higgs bundles with θ_L valued in Ω^log_{X_K}(−1) on X_K,an, as in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.4(1), p. 26. Defines H_log as gr⁰RH_log=RH⁺_log/t via Lemmas 3.1.8–3.1.9, which is the node's construction.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.1.9, p. 24. Reduction modulo t of an integrable log t-connection gives a log Higgs bundle; this produces θ_L.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Definition 3.1.7(3), p. 24. Defines log Higgs bundles with θ:E→E⊗Ω^log(−1), θ∧θ=0, and the complex with terms E⊗Ω^{log,q}(−q) used by the node.

**Uses.**

- DLLZ-RH Theorem 3.2.7(3): Its proper cohomology gives the Hodge–Tate decomposition.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="log-regularity-and-extension"></a>

### Regularity and normalized log extensions

`HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension` · theorem · proposed declaration `TauCeti.LogAdic.log_regularity_and_extension`.

Let X be a smooth rigid analytic variety over k with normal crossings divisor D and U=X−D. (1) A torsion-free coherent O_X-module F with integrable log connection ∇:F→F⊗Ω^log_X is locally free if F is reflexive and, along every irreducible component of D, all eigenvalues of the residue of ∇ lie in Q∩[0,1). (2) If F is locally free and F′ is torsion-free coherent, both with integrable log connections whose residues along all irreducible components of D have eigenvalues in Q∩[0,1), then every horizontal morphism F→F′ whose restriction to U is an isomorphism is an isomorphism on X. Statement (2) also holds for O_X⊗̂_k B_dR-modules with integrable log connections on 𝒳.

**Hypotheses and conventions.**

- Retain reflexivity for the local-freeness result, the normalized residue interval for both sheaves, and the horizontal morphism.
- For a torsion-free coherent sheaf the residue along a component Z is taken on the locally free locus, whose complement has codimension at least two and contains no component of D (DLLZ-RH §3.4, p. 33).

**Construction or proof route.**

1. (1): under reflexivity and the residue condition the completion of the stalk of F at each classical point is free, as in André–Baldassarri [AB01, Ch. 1, Prop. 4.5 and Lem. 4.6.1] or [ABC20, Lem. 11.5.1] (Proposition 3.4.16).
2. (2): replace F′ by its bidual F″ with the induced log connection, which has the same residues; F″ is locally free by (1), and F→F′→F″ are injective because they are isomorphisms on the dense U.
3. Locally on a strictly étale chart to Dⁿ with F and F″ free of rank d, the matrix of F→F″ is invertible off D; the normalized residue condition makes the meromorphic entries of its inverse regular (classical argument of [AB01, Ch. 1, Prop. 4.7] or the uniqueness in [ABC20, Thm. 11.2.2]) (Proposition 3.4.17).
4. For O_X⊗̂_k B_dR-modules run the same argument through the filtration of Lemma 3.1.4.

**Acceptance checks.**

- A boundary modification changing residue by an integer shows why the normalization interval matters.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham](#analytic-log-de-rham), [HodgeTateAndCanonicalSubgroups:T6:log-sites/divisorial-analytic-log](#divisorial-analytic-log), [HodgeTateAndCanonicalSubgroups:T6:comparison/filtered-log-connection](#filtered-log-connection), `AdicSpacesPartII:R3/coherent-sheaf`, `AdicSpacesPartII:R3/coherent-sheaf-operations`, `AdicSpacesPartII:R3/locally-free-sheaf`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 3.4.16, p. 37. States part (1): local freeness under reflexivity and residue eigenvalues in Q∩[0,1), with exactly these two conditions.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 3.4.17, p. 37. States part (2) for F locally free and F′ torsion-free with normalized residues; the source adds that the same holds for O_X⊗̂_k B_dR-modules, which the node keeps.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proof of Proposition 3.4.17, p. 37. The bidual reduction used in the node's second proof step.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="normalized-log-residues"></a>

### Rational normalized logarithmic residues

`HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues` · theorem · proposed declaration `TauCeti.LogAdic.normalized_log_residues`.

Let k, K, (X,D) be as for the geometric log Riemann–Hilbert functor and L a Q_p-local system on X_két. For an irreducible component Z of D with Z_k̄ irreducible (always achievable after a finite extension of k), all eigenvalues of Res_Z(∇_L) on RH_log(L) lie in Q∩[0,1). Locally, on an affinoid X with a smooth toric chart and Z_i={T_i=0}, Lemma 3.4.3 identifies RH⁺_log(L)(X) with N⁺, the elements c of N_∞=(L̂⊗B_dR⁺)(X̃) with (γ−1)^Λc→0 t-adically, and RH_log(L)(X) with N=N⁺[t⁻¹]; under this identification Res_{Z_i}(∇_L) is the endomorphism t⁻¹log(γ_i) of N/T_iN, independent of the choice of roots of unity. If the boundary inertia along Z_i acts unipotently, in particular if L|U has unipotent geometric monodromy along D, Res_{Z_i}(∇_L) is nilpotent.

**Hypotheses and conventions.**

- Z_k̄ irreducible for the RH_log statement, so that the characteristic polynomial of Res_Z has coefficients in B_dR; otherwise replace k by a finite extension. Z is an irreducible component in the sense of Conrad and the residue is defined by (3.4.1).
- Nilpotence needs unipotent geometric (not arithmetic) boundary monodromy (DLLZ-adic Definition 6.3.7).
- The arithmetic analogue for D_dR,log(L) is part of arithmetic-log-de-rham, which consumes this node.

**Construction or proof route.**

1. Reduce to an affinoid X with smooth toric chart, Z_i irreducible and RH_log(L) free; use the toric period model to identify RH⁺_log(L)(X)≅N⁺ (Lemma 3.4.3, Lemma 3.4.6) and compute the residue as t⁻¹log(γ_i) on N/T_iN (Lemma 3.4.7, Remark 3.4.8).
2. At a k-point of Z_i the boundary inertia acts quasi-unipotently, so eigenvalues of γ_i on the boundary fibre are ζ^y with y∈Q (Lemma 3.4.11, using Lemma 3.4.9).
3. Decomplete N_∞/ξ^r to a finite level (Lemma 3.4.12, Theorem A.2.3.4) and use the T_i^{a/m}-filtration to show eigenvalues of γ_i on N⁺/(ξ^r,T_i) have the form ζ^y[ε^z] with z∈Q∩[0,1) (Lemma 3.4.13).
4. Combine with the t-adic convergence of (γ_i−1)^l v to get eigenvalues z∈Q∩[0,1) of t⁻¹log γ_i (end of the proof of Theorem 3.2.3(2), p. 36).
5. If γ_i acts unipotently on the stalks, x=1 in Lemmas 3.4.11 and 3.4.13, so all eigenvalues vanish (proof of Theorem 3.2.12).

**Acceptance checks.**

- Unipotent Jordan inertia produces zero residue eigenvalues, not necessarily a zero residue operator.
- A nontrivial finite-order Kummer character along D gives a nonzero rational residue eigenvalue, so nilpotence genuinely needs unipotence.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert](#log-riemann-hilbert), [HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy](#geometric-boundary-monodromy), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion](#log-tower-decompletion), [HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model](#toric-structural-period-model), [HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham](#analytic-log-de-rham), [HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems](#completed-kummer-local-systems).

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.3(2), p. 25. The normalization for RH_log; the extracted 'Zk' is Z_k̄ (bar lost in extraction), the geometric-irreducibility hypothesis the node keeps.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.4.7, p. 35. The local residue formula stated in the node; Remark 3.4.8 records independence of the choice of roots of unity.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proof of Theorem 3.2.12, p. 38. Nilpotence of the residues under unipotent geometric boundary monodromy, the node's last clause.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="arithmetic-log-de-rham"></a>

### Arithmetic logarithmic de Rham functor

`HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham` · construction · proposed declaration `TauCeti.LogAdic.ArithmeticLogDR`.

For µ:X_prokét→X_an (k, (X,D) as in the geometric functor, K any perfectoid field containing k_∞) set D_dR,log(L)=µ_*(L̂⊗_{Q̂_p}OB_dR,log)≅RH_log(L)^{Gal(K/k)} with Fil^•D_dR,log(L)=(Fil^•RH_log(L))^{Gal(K/k)}. Then L↦D_dR,log(L) is a functor to vector bundles on X_an with integrable log connection ∇_L and decreasing filtration by coherent subsheaves satisfying Griffiths transversality; for every irreducible component Z of D all eigenvalues of Res_Z(∇_L) lie in Q∩[0,1), and they are 0 if L|U has unipotent geometric monodromy along D. The adjunction map D_dR,log(L)⊗̂_k B_dR→RH_log(L) is injective and strictly compatible with filtrations. If L|U is de Rham it is an isomorphism compatible with connections and filtrations, and gr D_dR,log(L) is a vector bundle of rank rk_{Q_p}L. Without that hypothesis the rank of D_dR,log(L) need not equal rk L.

**Hypotheses and conventions.**

- The same p-adic field and normal crossings pair as the geometric RH construction; no geometric-irreducibility hypothesis is needed for the arithmetic residues (Theorem 3.2.7(2)).
- De Rham means L|U de Rham in Scholze's sense (as reviewed in the DLLZ-RH introduction); it is needed only for the adjunction isomorphism and the graded rank.

**Construction or proof route.**

1. Compute D_dR,log(L) as the sheaf associated with Y↦H⁰(Gal(K/k),RH_log(L)(Y)); with K=k̂_∞, decompletion (Theorem A.2.1.2, Corollary A.1.21) gives finitely generated graded pieces compatible with rational and finite étale localization, so D_dR,log(L) is coherent (Lemma 3.3.17); it is reflexive by the codimension-two extension argument [Kis99, Cor. 2.2.4], [Ser66, Prop. 7] (Lemma 3.3.18).
2. D_dR,log(L)(X)≅N^{Gal(K/k)} and its residue is still t⁻¹log(γ_i), so the eigenvalue analysis of normalized-log-residues gives eigenvalues in Q∩[0,1) (Proposition 3.4.15), and 0 under unipotent monodromy (proof of Theorem 3.2.12(2)); Proposition 3.4.16 then gives local freeness (Theorem 3.2.7(1)).
3. The adjunction map is injective and strict by comparing ⊕_{a+b=r}gr^a(RH_log(L))^{Gal(K/k)}⊗K(b) with gr^r RH_log(L) (Lemma 3.4.18).
4. If L|U is de Rham the map is an isomorphism on U (LZ17 Cor. 3.12(ii), from Scholze's association L̂⊗OB_dR≅E⊗OB_dR), hence on X by Proposition 3.4.17 and the normalized residues on both sides (Corollary 3.4.21); then ⊕_a gr^a D_dR,log(L)⊗K(−a)≅H_log(L) gives the graded rank (Corollary 3.4.22).

**Acceptance checks.**

- Do not require de Rham input to define the functor or assert equal ranks for non-de Rham input.

**Planning API.**

- `TauCeti.LogAdic.ArithmeticLogDR` (constructor): The arithmetic degree-zero pushforward with its induced connection and coherent filtration.
- `TauCeti.LogAdic.ArithmeticLogDR.geometric_invariants` (characterisation): It is the arithmetic Galois-invariant sheaf of the geometric RH object, with Fil^r D_dR,log(L)=(Fil^r RH_log(L))^{Gal(K/k)}.
- `TauCeti.LogAdic.ArithmeticLogDR.residue_eigenvalues` (relation): For every irreducible component Z of D the eigenvalues of Res_Z(∇_L) lie in Q∩[0,1); they are all 0 when L|U has unipotent geometric monodromy along D.
- `TauCeti.LogAdic.ArithmeticLogDR.toRH` (projection): The adjunction map D_dR,log(L)⊗̂_k B_dR→RH_log(L) is horizontal, injective and strictly compatible with filtrations (Lemma 3.4.18).
- `TauCeti.LogAdic.ArithmeticLogDR.toRH_iso_of_isDeRham` (compatibility): If L|U is de Rham, the adjunction map is an isomorphism of filtered vector bundles with log connection (Corollary 3.4.21).
- `TauCeti.LogAdic.ArithmeticLogDR.de_rham_grade_rank` (compatibility): For de Rham interior input its total graded rank equals rk L.
- `TauCeti.LogAdic.ArithmeticLogDR.restrict_interior` (compatibility): On U with trivial log structure, D_dR,log(L)|U is the ordinary arithmetic de Rham functor of L|U (Remark 3.5.1).
- `TauCeti.LogAdic.ArithmeticLogDR.map_comp` (functoriality): Coefficient maps induce horizontal filtered maps, preserving composition.

**Discriminating unit tests.**

- `TauCeti.LogAdic.ArithmeticLogDR.constant` (computation): For the trivial Q_p coefficient system, D_dR,log=O_X with d and its weight-zero filtration.
- `TauCeti.LogAdic.ArithmeticLogDR.tate` (computation): For L=Q_p(m), D_dR,log(L)=O_X·(e_m⊗t^{−m}) with ∇=d, and gr^{−m} is its only nonzero graded piece.
- `TauCeti.LogAdic.ArithmeticLogDR.zero` (degenerate): The zero local system maps to the zero filtered bundle.
- `TauCeti.LogAdic.ArithmeticLogDR.non_de_rham` (non-example): For X=Spa(k,O_k) with empty boundary and a Q_p-character of Gal(k̄/k) whose Sen weight is not an integer, D_dR,log(L)=0 although rk L=1, so the rank equality needs the de Rham hypothesis.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert](#log-riemann-hilbert), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor](#log-higgs-functor), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward](#log-oc-pushforward), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion](#log-tower-decompletion), [HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues](#normalized-log-residues), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension](#log-regularity-and-extension), `PadicHodgeTheory:P8:local-rational/de-rham-period-sheaf`, `PadicHodgeTheory:P8/de-rham-lisse-sheaf`, `ClassicalAdicEtaleCohomology:H0`, `AdicSpacesPartII:R3/coherent-sheaf`, `AdicSpacesPartII:R3/coherent-sheaf-operations`, `AdicSpacesPartII:R3/locally-free-sheaf`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (3.2.6) and Theorem 3.2.7(1), p. 26. Defines D_dR,log(L)=µ_*(L̂⊗OB_dR,log) and states it is a functor (not claimed exact) to vector bundles with integrable log connection and coherent Griffiths-transversal filtration.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.7(2), p. 26. The arithmetic residue normalization, stated without a geometric-irreducibility hypothesis; the same item gives the graded rank rk_{Q_p}L for de Rham L|U.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.4.18, p. 38. The adjunction map D_dR,log(L)⊗̂_k B_dR→RH_log(L) is injective and strict, as in the node and its toRH API item.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 3.4.21, p. 38. The de Rham isomorphism with RH_log stated in the node; Corollary 3.4.22 then gives the graded rank.

**Uses.**

- DLLZ-RH Theorem 5.3.1: Canonical coefficients are identified with their standard filtered de Rham realizations.
- DLLZ-RH §§3.4–3.6 (Theorem 3.2.12(2), Corollary 3.5.7, Lemmas 3.6.3–3.6.4, Corollary 3.5.14): The adjunction isomorphism with RH_log for de Rham interior input drives the tensor, pullback, proper and relative comparisons.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="log-rh-pullback"></a>

### Restricted logarithmic comparison under pullback

`HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback` · theorem · proposed declaration `TauCeti.LogAdic.log_rh_pullback`.

Let h:Y→X be a morphism of log adic spaces, where X and Y are smooth rigid analytic varieties over k with log structures given by normal crossings divisors D and E (so h⁻¹(D)⊂E set-theoretically), and let L be a Q_p-local system on X_két. The adjunction maps h*H_log(L)→H_log(h⁻¹L), h*RH_log(L)→RH_log(h⁻¹L) and h*D_dR,log(L)→D_dR,log(h⁻¹L) are injective, the last two strictly compatible with filtrations. For components Z of D and W of E let m_WZ≥0 be the multiplicity of W in h⁻¹(Z), and n_Z=0 (resp. 1) if L|U has (resp. does not have) unipotent geometric monodromy along Z. If ∑_Z m_WZ n_Z≤1 for every W, the three maps are Gal(K/k)-equivariant (for the geometric ones) isomorphisms compatible with log connections, Higgs fields and filtrations. In local coordinates Res_W(h*∇_L)=∑_{h(W)⊂Z} m_WZ h*_{WZ}Res_Z(∇_L), with commuting summands.

**Hypotheses and conventions.**

- Boundary multiplicities are those of the divisors h⁻¹(Z); n_Z refers to geometric boundary monodromy; no isomorphism is claimed when ∑_Z m_WZ n_Z≥2 for some W.

**Construction or proof route.**

1. Injectivity (Lemma 3.5.3): V_K is dense in Y_K, h*H_log(L) is a vector bundle and the interior Higgs pullback map for h|V:V→U is an isomorphism (LZ17 Thm. 2.1(iii)); deduce the RH_log case from gr^r RH_log≅H_log(r), and the D_dR,log case from Lemma 3.4.18.
2. Compute Res_W(h*∇_L)=∑m_WZ h*_{WZ}Res_Z(∇_L) in toric coordinates; Res_Z is nilpotent when n_Z=0, so under the hypothesis at most one summand is non-nilpotent and it has m_WZ₀=1; hence the eigenvalues lie in Q∩[0,1) (Theorems 3.2.3(2), 3.2.7(2)).
3. Both sides then have normalized residues and agree over V by the interior pullback theorem (LZ17 Thm. 3.8(iv), 3.9(ii)); Proposition 3.4.17 gives the isomorphisms for RH_log and D_dR,log, and taking gr⁰ gives the Higgs case (Corollary 3.5.7).

**Acceptance checks.**

- For h:S↦T=S² on the disc (m_WZ=2) and a Kummer character along Z={T=0} with residue 2/3 (n_Z=1), the pulled-back residue is 4/3 while RH_log(h⁻¹L) has residue 1/3, so the adjunction map is injective but not an isomorphism.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert](#log-riemann-hilbert), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor](#log-higgs-functor), [HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham](#arithmetic-log-de-rham), [HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues](#normalized-log-residues), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension](#log-regularity-and-extension), [HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy](#geometric-boundary-monodromy), [HodgeTateAndCanonicalSubgroups:T6:log-sites/analytic-log-de-rham](#analytic-log-de-rham).

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.3(4), p. 25. Defines m_WZ and n_Z; the same item assumes ∑_Z m_WZ n_Z≤1 for each component W of E (checked on the rendered page) and gives the filtered RH_log isomorphism; Theorems 3.2.4(3), 3.2.7(4) give the Higgs and D_dR,log analogues.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.5.3, p. 39. Unconditional injectivity and strictness of the RH_log and D_dR,log adjunction maps (the Higgs map is stated injective).
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 3.5.7, p. 39. The conditional isomorphism stated in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proof of Corollary 3.5.7, p. 40. Starts the residue argument: nilpotent residues along unipotent components leave at most one non-nilpotent summand, with multiplicity 1.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="unipotent-log-tensor"></a>

### Tensor comparison for unipotent boundary systems

`HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor` · theorem · proposed declaration `TauCeti.LogAdic.unipotent_log_tensor`.

(1) RH_log (resp. H_log) restricts to a tensor functor from the category of Q_p-local systems L on X_két such that L|U has unipotent geometric monodromy along D to the category of filtered Gal(K/k)-equivariant vector bundles on 𝒳 with integrable log connection with nilpotent residues along D (resp. Gal(K/k)-equivariant log Higgs bundles on X_K,an). (2) D_dR,log restricts to a tensor functor from the category of Q_p-local systems L on X_két such that L|U is de Rham and has unipotent geometric monodromy along D to filtered vector bundles on X_an with integrable log connection with nilpotent residues along D. For such L the period maps µ′⁻¹H_log(L)⊗OC_log→L̂⊗OC_log and µ′⁻¹RH_log(L)⊗OB_dR,log→L̂⊗OB_dR,log, and in case (2) µ⁻¹D_dR,log(L)⊗OB_dR,log→L̂⊗OB_dR,log, are isomorphisms. No tensor compatibility is asserted for arbitrary Q_p-local systems.

**Hypotheses and conventions.**

- Unipotence is geometric boundary unipotence as in DLLZ-adic Definition 6.3.7; D_dR,log also requires L|U de Rham.

**Construction or proof route.**

1. Unipotent geometric monodromy forces x=1 in Lemmas 3.4.11 and 3.4.13, so the residues of RH_log(L) are nilpotent (Lemma 3.4.7), and those of D_dR,log(L) as well by Proposition 3.4.15.
2. In the decomposition (3.3.9) only characters τ with τ(γ_i)=1 for every boundary coordinate occur, so after enlarging m₀ the map (3.3.13) is an isomorphism; hence the period maps for H_log and RH_log are isomorphisms (cf. LZ17 Thm. 2.1(ii), 3.8(iii)).
3. With these isomorphisms argue as in LZ17 Thm. 2.1(iv) and 3.8(i): the multiplication maps for tensor products and the unit are isomorphisms, compatibly with connections, filtrations, Higgs fields and Galois actions.
4. For (2), Corollary 3.4.21 makes D_dR,log(L)⊗̂_k B_dR→RH_log(L) an isomorphism, so the arithmetic period map is an isomorphism and one concludes as in LZ17 Thm. 3.9(v).

**Acceptance checks.**

- For a Kummer character χ along D with residue 2/3, RH_log(χ)⊗RH_log(χ) has residue 4/3 while RH_log(χ²) has residue 1/3, so the unrestricted tensor statement is false; χ does not have unipotent monodromy.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert](#log-riemann-hilbert), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor](#log-higgs-functor), [HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham](#arithmetic-log-de-rham), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward](#log-oc-pushforward), [HodgeTateAndCanonicalSubgroups:T6:comparison/normalized-log-residues](#normalized-log-residues), [HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy](#geometric-boundary-monodromy), `PadicHodgeTheory:P8/de-rham-lisse-sheaf`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.12(1), p. 27. Part (1) for RH_log and H_log, with targets filtered equivariant bundles with nilpotent residues (resp. equivariant log Higgs bundles), as in the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.12(2), p. 27. Part (2): the arithmetic functor needs de Rham and unipotent interior restriction.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Paragraph before Theorem 3.2.12, p. 27. Supports the node's refusal of an unrestricted tensor statement.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proof of Theorem 3.2.12, p. 39. The final step of the proof sketch, after the period maps are shown to be isomorphisms.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="proper-log-period-cohomology"></a>

### Proper logarithmic period cohomology comparison

`HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-period-cohomology` · theorem · proposed declaration `TauCeti.LogAdic.proper_log_period_cohomology`.

Let X be proper over k (smooth, with normal crossings divisor D), K the completion of an algebraic closure k̄ of k, and L a Z_p-local system on X_két. For each i≥0 there are canonical Gal(K/k)-equivariant isomorphisms H^i(X_K,két,L)⊗_{Z_p}B_dR≅H^i_logdR(𝒳,RH_log(L)), compatible with filtrations, and H^i(X_K,két,L)⊗_{Z_p}K≅H^i_logHiggs(X_K,an,H_log(L)); they factor through H^i(X_K,prokét,L̂⊗B_dR) and H^i(X_K,prokét,L̂⊗Ô) (Lemmas 3.6.1–3.6.2). If moreover L|U is de Rham, H^i(X_K,két,L)⊗_{Z_p}B_dR≅H^i_logdR(X_an,D_dR,log(L))⊗_k B_dR compatibly with filtrations, the log Hodge–de Rham spectral sequence of D_dR,log(L) degenerates at E₁, and H^i(X_K,két,L)⊗_{Z_p}K≅⊕_{a+b=i}H^{a,b}_logHodge(X_an,D_dR,log(L))⊗_k K(−a), the 0-th graded piece of the previous isomorphism. No compactly supported or subcanonical version is asserted.

**Hypotheses and conventions.**

- X proper over k and K the completion of k̄ for every conclusion; L|U de Rham only for the D_dR,log comparison, the E₁-degeneration and the Hodge–Tate decomposition; the RH_log/H_log comparisons hold for every Z_p-local system (torsion allowed, DLLZ-adic Definition 6.3.1).

**Construction or proof route.**

1. Lemma 3.6.1: as in Scholze's Theorem 8.4, with his primitive comparison replaced by the log primitive comparison (DLLZ-adic Theorem 6.2.1) and the finiteness of H^i(X_K,két,L), obtain H^i(X_K,két,L)⊗B_dR⁺≅H^i(X_K,prokét,L̂⊗B_dR⁺) compatibly with filtrations, and its gr⁰ version with Ô.
2. Lemma 3.6.2: by the log Poincaré lemma (Corollary 2.4.2) L̂⊗B_dR≃DR_log(L̂⊗OB_dR,log) and L̂⊗Ô≃Higgs_log(L̂⊗OC_log); by Theorem 3.2.3(1), Proposition 3.3.3 and the projection formula, Rµ′_* of these complexes are DR_log(RH_log(L)) and Higgs_log(H_log(L)). This gives Theorems 3.2.3(3) and 3.2.4(2).
3. Lemmas 3.6.3–3.6.4: for L|U de Rham, Corollary 3.4.21 gives RH_log(L)≅D_dR,log(L)⊗̂_k B_dR, and Lemma 3.5.9 (proper pushforward commutes with ⊗̂_k B_dR, via gr^r B_dR≅K(r)) moves B_dR outside the hypercohomology; taking gr⁰ gives the Hodge–Tate decomposition.
4. E₁-degeneration: (3.2.8) and (3.2.9) give dim_k H^i_logdR=∑_{a+b=i}dim_k H^{a,b}_logHodge.

**Acceptance checks.**

- The Tate twist is −a; the decomposition concerns coefficient log Hodge cohomology, not just ordinary differential-form cohomology.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology](#proper-padic-boundary-cohomology), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison](#log-primitive-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods](#constant-log-periods), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare](#log-poincare), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert](#log-riemann-hilbert), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward](#log-oc-pushforward), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-higgs-functor](#log-higgs-functor), [HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham](#arithmetic-log-de-rham), `PadicHodgeTheory:P8/de-rham-lisse-sheaf`, `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`, `AdicSpacesPartII:R3/kiehl-proper-mapping-theorem`, `AdicSpacesPartII:R3/proper-coherent-cohomology-field-extension`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.3(3), p. 25. The standing hypotheses of all cohomology comparisons: X proper and K the completed algebraic closure (the hat and bar are lost in extraction); Theorems 3.2.4(2) and 3.2.7(3) refer back to them.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 3.6.1, pp. 41–42. The B_dR⁺ upgrade of the log primitive comparison, the node's first proof step.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §3.6, after Lemma 3.6.2, p. 42. The RH_log and H_log comparisons hold for every Z_p-local system, without a de Rham hypothesis.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.7(3), p. 26. The de Rham-interior comparison with D_dR,log(L)⊗_k B_dR, E₁-degeneration and Hodge–Tate decomposition with twist K(−a), as in the node.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="relative-log-comparison"></a>

### Relative logarithmic de Rham comparison

`HodgeTateAndCanonicalSubgroups:T6:comparison/relative-log-comparison` · theorem · proposed declaration `TauCeti.LogAdic.relative_log_comparison`.

Let f:X→Y be a proper log smooth morphism, where X and Y are smooth rigid analytic varieties over k with log structures given by normal crossings divisors D and E, such that f|_U:U→V (U=X−D, V=Y−E) is proper smooth; then D=f⁻¹(E). For a Z_p-local system L on X_két with L|U de Rham, each R^if_két,*(L) is a Z_p-local system on Y_két whose restriction to V is de Rham, and there is a canonical isomorphism D_dR,log(R^if_két,*L)≅(R^if_logdR,*(D_dR,log(L),∇_L))_free compatible with log connections (Gauss–Manin) and filtrations, where the subscript free denotes the O_Y-torsion-free quotient.

**Hypotheses and conventions.**

- Both proper log smooth f and proper smooth interior restriction are required; L|U de Rham; retain the torsion-free quotient.

**Construction or proof route.**

1. D=f⁻¹(E) by the argument of Lemma 3.5.2 and density of U; R^if_két,*(L) is a Z_p-local system by DLLZ-adic Corollary 6.3.5, and its completion is R^if_prokét,*(L̂) (DLLZ-adic Definition 6.3.2, Proposition 5.2.1).
2. The relative log Poincaré lemma (Corollary 2.4.6), Rµ′_{Y,*} and the projection formula give the filtered map (3.5.8) RH_log(R^if_két,*L)→R^if_logdR,*(RH_log(L)); for L|U de Rham rewrite the target as R^if_logdR,*(D_dR,log(L))⊗̂_k B_dR (Corollary 3.4.21, Lemma 3.5.9) and take Gal(K/k)-invariants to get (3.5.10).
3. R^if_*(L)|V is de Rham by Scholze's relative comparison (Sch13 Thm. 8.8); by Corollary 3.4.22 and density of V the induced map to the torsion-free quotient is injective and strictly filtered (Lemma 3.5.11).
4. By Katz's argument [Kat71, Sec. VII] the residues of (R^if_logdR,*D_dR,log(L))_free have eigenvalues in Q∩[0,1); Proposition 3.4.17, Theorem 3.2.7(1) and the interior comparison on V give the isomorphism (Corollary 3.5.14).

**Acceptance checks.**

- A relative conclusion omitting the interior properness or the torsion-free quotient is rejected.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare](#log-poincare), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert](#log-riemann-hilbert), [HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham](#arithmetic-log-de-rham), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension](#log-regularity-and-extension), [HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems](#completed-kummer-local-systems), [HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension](#boundary-local-system-extension), `PadicHodgeTheory:P8/relative-de-rham-comparison`, `ClassicalAdicEtaleCohomology:H0`, [HodgeTateAndCanonicalSubgroups:T6:comparison/kummer-proper-pushforward-local-systems](#kummer-proper-pushforward-local-systems), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-site-projections](#log-site-projections), `AdicSpacesPartII:R3/kiehl-proper-mapping-theorem`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.7(5), p. 26. The two properness hypotheses of the node; the same item states that R^if_két,*(L) is a Z_p-local system on Y_két that is de Rham on V.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 3.2.7(5), p. 27. The torsion-free quotient in the comparison isomorphism, which the node retains.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proof of Corollary 3.5.14, p. 41. The final extension-uniqueness step, after Katz's residue argument shows the free quotient has normalized residues.
- [DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Corollary 6.3.5, p. 89. The Kummer proper pushforward used in the first proof step; its hypotheses (f log smooth, f and f|_{X−D} proper) are those of the node.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

## Canonical coefficients, lattices and finite-level flags

Canonical realizations are normalized at special points and recognized by arithmetic monodromy. Their filtered connection comparison yields two t-adic lattices, the ascending Hodge–Tate filtration, its parabolic reduction and the twisted Levi comparison.

- [Canonical Gᶜ coefficients on the log site](#canonical-pro-kummer-realizations)
- [Special-point normalization of canonical comparison](#special-point-comparison)
- [Arithmetic recognition of the general canonical monodromy](#canonical-arithmetic-monodromy)
- [Canonical p-adic and de Rham association](#canonical-log-period-comparison)
- [The two de Rham lattices of a canonical coefficient](#two-de-rham-lattices)
- [The lattice Hodge–Tate filtration](#lattice-hodge-tate-filtration)
- [Tensor and Hecke compatibility of the finite-level HT flag](#canonical-ht-tensor)
- [The Hodge–Tate P^c_µ-reduction of the canonical p-adic torsor](#hodge-tate-parabolic-reduction)
- [Finite-level cyclotomic Levi-torsor comparison](#finite-levi-torsor)
- [Hodge-type agreement with the abelian-scheme comparison](#hodge-type-comparison-agreement)

<a id="canonical-pro-kummer-realizations"></a>

### Canonical Gᶜ coefficients on the log site

`HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations` · construction · proposed declaration `TauCeti.LogAdic.CanonicalLogRealizations`.

Let (G,X) be a Shimura datum, Gᶜ its central split quotient, K a neat level and S^tor_{K,Σ} a smooth projective toroidal compactification whose boundary D is a normal-crossings divisor. For an algebraic representation W of Gᶜ, import the canonical automorphic étale Q_p-local system W_p on S_K and the automorphic filtered connection W_dR with its canonical extension (nilpotent residues along D, filtration by subbundles). W_p extends uniquely to a Kummer-étale Q_p-local system on S^tor_{K,Σ} (boundary local-system equivalence, characteristic 0), completed to Ŵ_p on the pro-Kummer-étale site, and this extension has unipotent geometric monodromy along D (DLLZ-RH p. 55, from (5.2.13)). Over a finite extension k of Q_p containing the p-adic completion of the reflex field (and the coefficient field), W_p|S_K is de Rham, and p-W_dR:=D_dR,log(W_p) is a filtered log connection on S^tor_{K,Σ,k} with nilpotent residues along D; after ι:Q̄_p≅C, the horizontal sections of the analytified base change of p-W_dR|S_K form the C-local system p-W_B. Each of W↦W_p, W_dR, p-W_dR, p-W_B is a G(A_f)-equivariant tensor functor on Rep(Gᶜ), functorial for morphisms of Shimura data. Full-group coefficients, not arbitrary Levi representations, carry these flat connections.

**Hypotheses and conventions.**

- Smooth projective toroidal compactification with normal-crossings boundary (strict normal crossings after étale localization); canonical full-group coefficients and their tensor/Hecke functoriality come from AutomorphicBundles.
- De Rham-ness of W_p on the open Shimura variety is an imported input (Liu–Zhu, Theorem 1.2, as cited in DLLZ-RH §5.2); it is not deduced from the comparison planned later in this stage.

**Construction or proof route.**

1. Import B2.general’s full-group realizations W_p and W_dR and B3.general’s canonical logarithmic extension of W_dR with nilpotent residues (DLLZ-RH Proposition 5.2.10).
2. Unipotent geometric monodromy of W_p along D (DLLZ-RH p. 55, after (5.2.13)) and the boundary local-system equivalence give the Kummer-étale extension; complete it on the pro-Kummer-étale site.
3. Apply D_dR,log to the de Rham local system W_p (DLLZ-RH (5.2.14)–(5.2.16)); nilpotent residues and the tensor property come from Theorem 3.2.12(2); push out along L⊗k→k, algebraize by rigid GAGA on the proper S^tor_{K,Σ,k} (Köpf; DLLZ-RH p. 55, D^alg_dR,log), base change the algebraic object via ι and take horizontal sections to obtain p-W_B (Proposition 5.2.17).
4. Check tensor, dual, unit and Hecke pullback compatibility on the unipotent coefficient subcategory.

**Acceptance checks.**

- No universal abelian scheme or motive for a general datum is introduced.

**Planning API.**

- `TauCeti.LogAdic.CanonicalLogRealizations` (constructor): The imported coefficient functors instantiated on the toroidal Kummer/pro-Kummer ringed sites, together with the p-adic realizations p-W_dR and p-W_B.
- `TauCeti.LogAdic.CanonicalLogRealizations.etale_restriction` (compatibility): Restriction to the interior recovers the canonical p-adic local system.
- `TauCeti.LogAdic.CanonicalLogRealizations.de_rham_extension` (compatibility): Its filtered log bundle is B3.general’s nilpotent-residue canonical extension.
- `TauCeti.LogAdic.CanonicalLogRealizations.hecke` (functoriality): Pullbacks under finite-level Hecke maps agree with the coefficient representation action.
- `TauCeti.LogAdic.CanonicalLogRealizations.unipotent_monodromy` (structure): W_p|S_K has unipotent geometric monodromy along every boundary component, which makes the residues of p-W_dR nilpotent (DLLZ-RH Theorem 3.2.12(2)); the Kummer-étale extension itself is unique by the boundary local-system equivalence, independently of unipotence.
- `TauCeti.LogAdic.CanonicalLogRealizations.p_de_rham` (data): p-W_dR=D_dR,log(W_p) is a filtered log connection with nilpotent residues on S^tor_{K,Σ,k}; W↦p-W_dR is a tensor functor (DLLZ-RH Theorem 3.2.12(2)).
- `TauCeti.LogAdic.CanonicalLogRealizations.p_betti` (data): After ι:Q̄_p≅C, the horizontal sections of the analytified p-W_dR|S_K form a C-local system p-W_B; W↦p-W_B is a G(A_f)-equivariant tensor functor.
- `TauCeti.LogAdic.CanonicalLogRealizations.tensor` (compatibility): Tensor, dual and unit isomorphisms for W_p, W_dR, p-W_dR and p-W_B are canonical and coherent.

**Discriminating unit tests.**

- `TauCeti.LogAdic.CanonicalLogRealizations.unit` (degenerate): The trivial representation gives the constant Q_p sheaf and trivial filtered O bundle.
- `TauCeti.LogAdic.CanonicalLogRealizations.siegel` (compatibility): In the Siegel case the standard representation is the semiabelian Tate/de Rham coefficient with its boundary extension.
- `TauCeti.LogAdic.CanonicalLogRealizations.no_levi_connection` (non-example): An arbitrary Levi coefficient has an automorphic bundle but is not thereby assigned a full-group flat local system.
- `TauCeti.LogAdic.CanonicalLogRealizations.p_de_rham_unit` (degenerate): For the trivial representation p-W_dR is O with d and the filtration Fil⁰=O, Fil¹=0, and p-W_B is the constant sheaf C; a nontrivial filtration jump or residue would fail this.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension](#boundary-local-system-extension), [HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems](#completed-kummer-local-systems), [HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy](#geometric-boundary-monodromy), [HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham](#arithmetic-log-de-rham), [HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor](#unipotent-log-tensor), `AutomorphicBundles:B2/etale-coefficient-local-system`, `AutomorphicBundles:B2.general/general-flat-realizations`, `AutomorphicBundles:B3.general/general-logarithmic-comparison`, `ShimuraCompactifications:C2/smooth-normal-crossings`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 5.2.10, p. 54. States the Betti and automorphic de Rham coefficient functors as G(A_f)-equivariant tensor functors on Rep(Gᶜ); the node imports them and their canonical log extension.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), §5.2, (5.2.12)–(5.2.16), p. 55. Gives the unipotent boundary monodromy of the étale coefficient used for the Kummer extension; the same page records de Rham-ness via Liu–Zhu Theorem 1.2 and builds p-dR V^can with nilpotent residues.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 5.2.17, p. 56. States the tensor-functor and Hecke properties of the p-adic realizations p-dR and p-B that the node constructs.
- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), §4.4.38, p. 79. BP’s finite-level coefficients on S^tor_{K,Σ}: the pro-Kummer-étale local system and the filtered log connection that the node supplies.

**Uses.**

- DLLZ-RH Theorem 5.3.1: The comparison identifies these two canonical realizations.
- PerfectoidShimuraVarieties:S6: Imports these finite-level tensor-compatible coefficients.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="special-point-comparison"></a>

### Special-point normalization of canonical comparison

`HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison` · theorem · proposed declaration `TauCeti.LogAdic.special_point_comparison`.

Let h∈X be a special point, so h factors through T_R for a maximal Q-torus T⊆G, and K neat. For every W∈Rep(Gᶜ), the pullbacks of the Betti system W_B,C and of the p-adically reconstructed Betti system p-W_B to (G(Q)h)×G(A_f) are canonically and G(Q)×G(A_f)-equivariantly isomorphic to the trivial local system (G(Q)h)×W_C×G(A_f), on which G(Q) acts by diagonal left multiplication on all three factors and G(A_f) by right multiplication on the last. For p-W_B the identification passes through a CM motive M (Artin motives and abelian varieties potentially of CM type, absolute Hodge cycles) whose p-adic realization is the special-point Galois representation r(µ,W)⁺_{K,g,p}, and it does not depend on the choice of M. At h the Hodge filtrations of the pullbacks of p-W_dR and W_dR are both the one defined by the Hodge cocharacter µ_h. These identifications normalize the general coefficient comparison and its reflex-field descent.

**Hypotheses and conventions.**

- Use the proven CM/abelian-motive realizations and absolute Hodge-tensor compatibility (Blasius); this does not assert existence of motives for every general Shimura coefficient.
- h is a special point: h:S→G_R factors through T_R for a maximal torus T of G over Q; the level K is neat.

**Construction or proof route.**

1. Factor h through T, form the reciprocity map r(µ) of (5.4.2)–(5.4.3) and the Galois representation r(µ,W)⁺_{K,g,p} describing the pullback of W_p to the image of (h,g); since T_R stabilizes h, the maximal Q-anisotropic R-split subtorus of T is that of the centre, which acts trivially on W∈Rep(Gᶜ); with neatness of gKg⁻¹ this makes W trivial on gKg⁻¹∩T(Q) (as in the proof of Liu–Zhu Lemma 4.5).
2. This representation is potentially crystalline (Liu–Zhu Lemma 4.4) and factors through T(Q_p), hence is the p-adic realization of a CM motive M (Patrikis Theorem 2.3.13); Blasius Theorem 0.3 makes Faltings’s comparison D_dR(M_p)≅M_dR⊗k respect the absolute Hodge cycles; identify the pullbacks of W_dR and p-W_dR to h (using compatibility of D_dR with pullback to points) and then of W_B,C and p-W_B by the trivial Riemann–Hilbert correspondence at h.
3. Independence of M from Deligne–Milne–Ogus–Shih IV (D); G(Q)-equivariance by conjugating all data by γ, G(A_f)-equivariance because the second factor is not involved.
4. The characters of T(Q_p) in r(µ,W) are locally algebraic, induced by the local Artin map and µ, so both Hodge filtrations at h are determined by µ_h (proof of Proposition 5.4.4).

**Acceptance checks.**

- Tensor identifications are normalized at special points rather than chosen up to an unspecified scalar.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations](#canonical-pro-kummer-realizations), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback](#log-rh-pullback), `ShimuraVarieties:V8.general`, `PadicHodgeTheory:P8/relative-de-rham-comparison`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 5.4.1, p. 58. The statement of the node: canonical equivariant trivialization of both Betti systems over (G(Q)h)×G(A_f), with the actions recorded exactly as printed.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), proof of Proposition 5.4.1, p. 59. The CM-motive route of the proof (potential crystallinity, Patrikis, Blasius) that the node’s proof steps follow.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), proof of Proposition 5.4.4, p. 60. Source of the node’s clause that both Hodge filtrations at h are those of µ_h; this is proved inside Proposition 5.4.4, not in Proposition 5.4.1.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="canonical-arithmetic-monodromy"></a>

### Arithmetic recognition of the general canonical monodromy

`HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy` · theorem · proposed declaration `TauCeti.LogAdic.canonical_arithmetic_monodromy`.

Fix a connected component Γ⁺_{K,g₀}\X⁺ of S^an_{K,C} and identify the fibres of W_B,C and p-W_B at the image of the special point h with W_C by special-point-comparison. Then the monodromy representation ρ^{+,(p)}_{K,g₀}(W):Γ^{+,c}_{K,g₀}→GL(W_C) of p-W_B extends to an algebraic representation of G^{der,c} equal to W_C|G^{der,c}; the extension is unique by Borel density. The proof reduces to G^{der,c} Q-simple and simply connected. If G^der_R is of type A or has real rank ≤1, the datum is of abelian type and may be replaced by a Hodge-type datum, where the comparison is induced by the universal abelian scheme and Hodge tensors. Otherwise (real rank ≥2, not of type A) it uses Margulis superrigidity, the congruence subgroup property, Hecke compatibility and Borel density, and the Piatetski-Shapiro pair of embeddings, to identify every simple factor.

**Hypotheses and conventions.**

- Only the arithmetic-group instances permitted by DLLZ-RH §§5.4–5.6 are requested; generic superrigidity and congruence results are imported from an arithmetic roadmap addition.
- K neat; W∈Rep(Gᶜ); the comparison is made on one connected component at a time through the special-point identification of Proposition 5.4.1.

**Construction or proof route.**

1. Apply Lemmas 5.4.7–5.4.8 for finite-cover and simply connected reduction.
2. For abelian type, use faithful polarized abelian coefficients and Hodge tensors to reconstruct the coefficient tensor category (Lemmas 5.5.1, 5.5.3, 5.5.6, Corollary 5.5.7, Proposition 5.5.9 with Remark 5.5.10).
3. For the remaining case, apply superrigidity (Theorem 5.6.1) and the congruence subgroup property to extend monodromy, eliminate the Hecke discrepancy by Schur/Borel density (Lemma 5.6.5), and prove faithfulness on every factor using Lemma 5.6.7.

**Acceptance checks.**

- Recognition includes all derived simple factors; checking only the abelian-type subdatum is not the general proof.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison](#special-point-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations](#canonical-pro-kummer-realizations), `ArithmeticLocallySymmetricSpaces:ALS.1`, `ShimuraVarieties:V8.general`, `PadicHodgeTheory:P8/relative-de-rham-comparison`, `AutomorphicBundles:B1/hodge-tensor-realizations`, `AutomorphicBundles:B1/absolute-hodge-propagation`.

**Sources and relation to this target.**

- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 5.4.5, p. 61. The node’s statement; Remark 5.4.6 on the same page gives uniqueness by Borel density.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 5.5.9, pp. 63–64. The type A / real rank ≤1 (abelian-type) case of the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 5.6.7 and its proof, pp. 65–66. The Piatetski-Shapiro embedding step identifying every simple factor in the real rank ≥2, non-type-A case.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), end of §5.6, p. 66. Conclusion of the remaining case via Lemmas 5.6.5 (Schur/Borel density) and 5.6.7.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="canonical-log-period-comparison"></a>

### Canonical p-adic and de Rham association

`HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison` · theorem · proposed declaration `TauCeti.LogAdic.canonical_log_period_comparison`.

Atlas planet: **Canonical logarithmic comparison**.

For every algebraic representation W of Gᶜ, on the pro-Kummer-étale site of S^tor_{K,Σ} over a finite extension k of Q_p containing the p-adic completion of the reflex field, there is a canonical isomorphism Ŵ_p⊗_{Q_p}OB_dR,log≃W_dR⊗_{O}OB_dR,log compatible with filtrations, connections and the Hecke action. It is the composite of the log Riemann–Hilbert isomorphism µ⁻¹D_dR,log(W_p)⊗OB_dR,log≃Ŵ_p⊗OB_dR,log (µ:S^tor_{K,Σ,prokét}→S^tor_{K,Σ,an} the projection of sites of arithmetic-log-de-rham, not the Hodge cocharacter µ; W_p is de Rham on S_K with unipotent boundary monodromy) with the isomorphism of filtered log connections p-W_dR≃W_dR⊗_E k of DLLZ-RH Theorem 5.3.1. It is an isomorphism of tensor functors, compatible with duals, change of level and maps of Shimura data, and descends compatibly with reflex-field canonical models. It identifies the nilpotent-residue boundary extensions, not just their interior restrictions.

**Hypotheses and conventions.**

- Use full-group canonical coefficients, their unipotent geometric boundary monodromy and the source canonical models.
- S^tor_{K,Σ} smooth projective with normal-crossings boundary and K neat, as in DLLZ-RH §5.2.

**Construction or proof route.**

1. Recognize the reconstructed Betti monodromy (Proposition 5.4.5) and normalize the isomorphism p-W_B≃W_B,C at special points (Proposition 5.4.1); this is the Betti part of Theorem 5.3.1, functorial and tensor-compatible.
2. Apply Proposition 5.4.4: the Betti isomorphism gives (p-W_dR,∇)≃(W_dR,∇) on S_K, which extends uniquely to the nilpotent-residue extensions; filtrations agree because they agree at the dense special points; the descent data are determined at special points and extend to canonical extensions.
3. Compose with the period isomorphism µ⁻¹D_dR,log(W_p)⊗OB_dR,log≃Ŵ_p⊗OB_dR,log, which holds for de Rham local systems with unipotent geometric boundary monodromy (DLLZ-RH Corollary 3.4.21 and the proof of Theorem 3.2.12(2)).
4. Use normalized-extension uniqueness and the unipotent tensor theorem to extend tensor, dual and Hecke compatibilities across the toroidal boundary.

**Acceptance checks.**

- Siegel semiabelian comparison and the Hodge-type tensor construction are specializations, not substitutes for the general arithmetic-recognition step.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy](#canonical-arithmetic-monodromy), [HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison](#special-point-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations](#canonical-pro-kummer-realizations), [HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham](#arithmetic-log-de-rham), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension](#log-regularity-and-extension), [HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor](#unipotent-log-tensor), `AutomorphicBundles:B3.general/general-canonical-extension`, `AutomorphicBundles:B3.general/general-boundary-functoriality`, [HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback](#log-rh-pullback).

**Sources and relation to this target.**

- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), §4.4.38, p. 79. The node’s isomorphism W_p⊗OB_dR,log=W_dR⊗OB_dR,log on S^tor_{K,Σ}, which BP calls a consequence of DLLZ-RH Theorem 5.3.1.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem 5.3.1, p. 56. The canonical isomorphism p-dR V≃dR V (and of the log versions, last paragraph of the theorem) with tensor, Hecke, functoriality and canonical-model descent that the node composes with the period isomorphism.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 5.4.4, p. 60. The passage from the Betti comparison to the filtered log connections and descent used in the node’s second proof step.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), proof of Theorem 3.2.12(2), pp. 38–39. The same paragraph states that the canonical map µ⁻¹D_dR,log(L)⊗OB_dR,log→L̂⊗OB_dR,log is an isomorphism for such L; this is the period isomorphism the node composes with Theorem 5.3.1.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="two-de-rham-lattices"></a>

### The two de Rham lattices of a canonical coefficient

`HodgeTateAndCanonicalSubgroups:T6:comparison/two-de-rham-lattices` · construction · proposed declaration `TauCeti.LogAdic.TwoDeRhamLattices`.

On the pro-Kummer-étale site of S^tor_{K,Σ}, for W∈Rep(Gᶜ) put M:=Ŵ_p⊗_{Q_p}B_dR⁺ and M⁰:=(W_dR⊗_{O}OB⁺_dR,log)^{∇=0}. Both are B_dR⁺-local systems of rank dim W, and they are lattices in one B_dR-local system: M⊗_{B_dR⁺}B_dR=Ŵ_p⊗B_dR and M⁰⊗_{B_dR⁺}B_dR=(W_dR⊗OB_dR,log)^{∇=0}, identified by the horizontal sections of the canonical comparison isomorphism. Each lattice L∈{M,M⁰} defines the decreasing filtration Fil^iL:=Fil^iB_dR·L (=t^iL wherever t is defined), i∈Z, of this B_dR-local system; Fil⁰M=M, Fil⁰M⁰=M⁰ and M/Fil¹M=Ŵ_p⊗Ô. Horizontal sections are taken before extracting the lattice filtration; the filtration of M⁰ is its own t-adic one, not the Hodge filtration of W_dR (whose horizontal part is Fil^jM).

**Hypotheses and conventions.**

- Canonical associated unipotent/de Rham full-group coefficient; sheafwise lattices in the same localized module.
- S^tor_{K,Σ} log smooth with normal-crossings boundary, so the toric description of OB⁺_dR,log and the log Poincaré lemma apply.

**Construction or proof route.**

1. Use the canonical association and the log Poincaré lemma (OB_dR,log)^{∇=0}=B_dR to identify Ŵ_p⊗B_dR with (W_dR⊗OB_dR,log)^{∇=0}; since t is horizontal and OB_dR,log=OB⁺_dR,log[1/t], this is M⁰[1/t].
2. Locally on a log affinoid perfectoid over a toric chart, OB⁺_dR,log is a power-series ring over B_dR⁺ in the log coordinates; the integrable log connection of W_dR then has a full set of formal horizontal sections, so M⁰ is a B_dR⁺-local system of rank dim W with M⁰⊗_{B_dR⁺}OB⁺_dR,log≅W_dR⊗OB⁺_dR,log.
3. Carry both lattice filtrations into the common ambient space and identify M/Fil¹M with Ŵ_p⊗Ô using B_dR⁺/Fil¹=Ô.

**Acceptance checks.**

- The construction needs the relative position of two lattices; a single filtration of W_dR alone is insufficient.

**Planning API.**

- `TauCeti.LogAdic.TwoDeRhamLattices` (constructor): The common localized module with M, M⁰ and their specified filtrations.
- `TauCeti.LogAdic.TwoDeRhamLattices.common_localization` (compatibility): Inverting t identifies both lattice localizations with the association’s period local system.
- `TauCeti.LogAdic.TwoDeRhamLattices.first_quotient` (projection): M/Fil¹M identifies with W_p⊗Ô.
- `TauCeti.LogAdic.TwoDeRhamLattices.map` (functoriality): A morphism of canonical coefficient representations carries both lattices and filtrations compatibly.
- `TauCeti.LogAdic.TwoDeRhamLattices.fil_eq` (characterisation): Fil^iM=Fil^iB_dR·M and Fil^iM⁰=Fil^iB_dR·M⁰ for all i∈Z; in particular Fil^{i+1}L=t·Fil^iL where t is defined.
- `TauCeti.LogAdic.TwoDeRhamLattices.horizontal_frame` (compatibility): M⁰⊗_{B_dR⁺}OB⁺_dR,log≅W_dR⊗_{O}OB⁺_dR,log compatibly with connections.
- `TauCeti.LogAdic.TwoDeRhamLattices.tensor` (compatibility): M and M⁰ of W⊗W′ and of W^∨ are the tensor products and duals of those of W and W′, compatibly with their filtrations.

**Discriminating unit tests.**

- `TauCeti.LogAdic.TwoDeRhamLattices.unit` (degenerate): For the trivial representation the two lattices agree with B_dR⁺.
- `TauCeti.LogAdic.TwoDeRhamLattices.relative_position` (computation): For scalar rank-one lattices M=Ae and M⁰=tᵃAe in A[1/t]e, both localize to A[1/t]e, Fil^iM⁰=t^{a+i}Ae=Fil^{a+i}M for all i∈Z, and M∩Fil^jM⁰=t^{max(0,a+j)}Ae; for a≠0 the lattices differ although their localizations agree.
- `TauCeti.LogAdic.TwoDeRhamLattices.horizontal_requirement` (non-example): The unrestricted module W_dR⊗OB_dR,log⁺ is not itself M⁰; its horizontal kernel is required.
- `TauCeti.LogAdic.TwoDeRhamLattices.tate_line` (computation): For a rank-one associated pair with Ŵ_p≅Q_p(1) and W_dR=(O,d) with Gr^{−1}W_dR=W_dR, one has M⁰=Fil^{−1}B_dR·M=t⁻¹M, whereas Fil⁰ of the Hodge-induced filtration on (W_dR⊗OB_dR,log)^{∇=0} is M itself.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison](#canonical-log-period-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare](#log-poincare), [HodgeTateAndCanonicalSubgroups:T6:comparison/constant-log-periods](#constant-log-periods), [HodgeTateAndCanonicalSubgroups:T6:comparison/toric-structural-period-model](#toric-structural-period-model).

**Sources and relation to this target.**

- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), Remark 4.4.39 and following text, p. 79. BP’s definition of the two lattices M and M⁰ in a common B_dR-local system. BP prints M=W_p⊗B⁺_{dR,log}; the sheaf meant is B_dR⁺ (the sentence quoted calls M a B_dR⁺-local system), and the node uses B_dR⁺.
- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), Remark 4.4.39 and following text, p. 79. The two filtrations Fil^iM and Fil^iM⁰ are the ones determined by the two lattices; the node defines them as Fil^iB_dR·L.

**Uses.**

- BP Remark 4.4.39: Intersection images in the first-lattice quotient define the ascending HT filtration.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="lattice-hodge-tate-filtration"></a>

### The lattice Hodge–Tate filtration

`HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration` · construction · proposed declaration `TauCeti.LogAdic.LatticeHTFiltration`.

Atlas planet: **Lattice Hodge–Tate filtration**.

With M, M⁰ and their lattice filtrations from two-de-rham-lattices, define the ascending filtration F_{−j}(Ŵ_p⊗Ô):=(M∩Fil^jM⁰)/(Fil¹M∩Fil^jM⁰), equivalently the image of M∩Fil^jM⁰ in M/Fil¹M=Ŵ_p⊗Ô. Each F_i is a locally direct-summand Ô-submodule, the filtration is of the type of the Hodge cocharacter, and with BP’s negative filtration indexing its graded pieces satisfy Gr_j(Ŵ_p⊗Ô)(j)≃Gr^jW_dR⊗_{O}Ô. Record the convention by the displayed F_{−j} formula, rather than silently replacing the ascending filtration by the de Rham one.

**Hypotheses and conventions.**

- Two associated B_dR⁺ lattices from the canonical coefficient comparison; intersections and quotients are sheafwise.

**Construction or proof route.**

1. Use intersection submodules in the common B_dR space and project to M/Fil¹M.
2. Compute locally: the horizontal part of the j-th filtered piece of W_dR⊗OB_dR,log is Fil^jM by the filtered comparison and the filtered log Poincaré lemma, and the relative position of M⁰ with respect to M has elementary divisors given by the jumps of the Hodge filtration; this gives local splitting and the ranks (the argument of Caraiani–Scholze §2.2 for the open case, to which BP Remark 4.4.39 refers, run with OB_dR,log).
3. Apply the graded comparison and gr^rB_dR≃Ô(r) to identify each graded component with the specified Tate twist.

**Acceptance checks.**

- Increasing the ascending index enlarges F.
- For scalar t-adic filtration and a rank-one second lattice M⁰=t^aM, the ascending filtration jumps at a; translating this to named Tate weights requires the imported T1 convention.

**Planning API.**

- `TauCeti.LogAdic.LatticeHTFiltration` (constructor): The image filtration with F_{−j}=image(M∩Fil^jM⁰→M/Fil¹M).
- `TauCeti.LogAdic.LatticeHTFiltration.mem` (characterisation): A quotient class lies in F_{−j} iff it has a lift belonging to M∩Fil^jM⁰.
- `TauCeti.LogAdic.LatticeHTFiltration.mono` (structure): The image filtration is increasing in the HT index because Fil^jM⁰ is decreasing.
- `TauCeti.LogAdic.LatticeHTFiltration.grade` (compatibility): With the displayed BP indexing, its graded identification has the Tate twist (j): Gr_j(Ŵ_p⊗Ô)(j)≃Gr^jW_dR⊗Ô.
- `TauCeti.LogAdic.LatticeHTFiltration.map` (functoriality): Compatible maps of the two filtered lattices induce filtered quotient maps.
- `TauCeti.LogAdic.LatticeHTFiltration.locally_split` (structure): Each F_i is a locally direct-summand Ô-submodule, F_i=0 for i below the lowest Hodge jump and F_i=Ŵ_p⊗Ô from the highest jump on.

**Discriminating unit tests.**

- `TauCeti.LogAdic.LatticeHTFiltration.weight_zero` (degenerate): For a weight-zero line, F_i=0 for i<0 and F_i is the full line for i≥0.
- `TauCeti.LogAdic.LatticeHTFiltration.lattice_shift` (computation): For scalar t-adic filtration and M⁰=t^aM in rank one, F_i is zero for i<a and the full quotient for i≥a.
- `TauCeti.LogAdic.LatticeHTFiltration.correct_denominator` (characterisation): The quotient kernel at −j is Fil¹M∩Fil^jM⁰, not all of Fil¹M when that is not contained in Fil^jM⁰.
- `TauCeti.LogAdic.LatticeHTFiltration.tate_line` (computation): For the associated pair Ŵ_p≅Q_p(1), W_dR=(O,d) with Gr^{−1}W_dR=W_dR, F_{−2}=0 and F_{−1}=Ô(1), so Gr_{−1}(−1)≅Ô≅Gr^{−1}W_dR⊗Ô; a convention with F_j in place of F_{−j} would put the jump at +1.
- `TauCeti.LogAdic.LatticeHTFiltration.siegel_h1` (compatibility): On the open Siegel variety, for the pair (H₁(A,Q_p),H_{1,dR}(A)) of the universal abelian scheme, F_{−2}=0, F_{−1}=Lie(A)⊗Ô(1) and F₀=H₁(A,Q_p)⊗Ô, recovering 0→Lie(A)⊗Ô(1)→H₁(A,Q_p)⊗Ô→ω_{A^t}⊗Ô→0 (BP §4.4.8, p. 67).

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/two-de-rham-lattices](#two-de-rham-lattices), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison](#canonical-log-period-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-poincare](#log-poincare), `HodgeTateAndCanonicalSubgroups:T1`, `HodgeTateAndCanonicalSubgroups:T2`.

**Sources and relation to this target.**

- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 79. Introduces the displayed definition Fil_{−j}(W_p⊗Ô)=(M∩Fil^jM⁰)/(Fil¹M∩Fil^jM⁰) that the node states verbatim.
- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 79. The filtration is defined from the canonical comparison of §4.4.38 on S^tor_{K,Σ}; the relation Gr_j(W_p⊗Ô)(j)=Gr^jW_dR⊗Ô is displayed at the top of p. 80.

**Uses.**

- PerfectoidShimuraVarieties:S6: Imports the finite-level flag before trivializing the p-adic torsor on its tower.
- BP Remark 4.4.39: The filtration defines P_HT and the Levi reduction.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="canonical-ht-tensor"></a>

### Tensor and Hecke compatibility of the finite-level HT flag

`HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor` · theorem · proposed declaration `TauCeti.LogAdic.canonical_ht_tensor`.

For canonical full-group Gᶜ coefficients the lattice HT filtration is compatible with tensor products, duals, the unit representation and finite-level Hecke pullbacks: F_i(W⊗W′)=∑_{a+b=i}F_a(W)⊗F_b(W′), F_i(W^∨)=(F_{−i−1}(W))^⊥, and for the unit F_{−1}=0, F₀=Ô. The functor W↦(Ŵ_p⊗Ô,F_•) is exact, its graded pieces are exact in W, and it is of type µ. This is the filtered fibre functor from which hodge-tate-parabolic-reduction extracts the prescribed P^c_µ-reduction of the completed p-adic coefficient torsor.

**Hypotheses and conventions.**

- Use canonical unipotent tensor association; this is not a tensor theorem for arbitrary log local systems.

**Construction or proof route.**

1. Use the tensor-compatible association to compare the two filtered lattice systems: M and M⁰ are tensor and dual compatible.
2. Check the lattice image filtration in locally split cocharacter coordinates; exactness of the graded pieces follows from the graded relation with Gr^jW_dR, which is exact in W.
3. Verify Hecke naturality from the Hecke equivariance of the comparison.

**Acceptance checks.**

- Tate lines of weights m,n tensor to the line of weight m+n.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration](#lattice-hodge-tate-filtration), [HodgeTateAndCanonicalSubgroups:T6:comparison/two-de-rham-lattices](#two-de-rham-lattices), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison](#canonical-log-period-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor](#unipotent-log-tensor), `HodgeTateAndCanonicalSubgroups:T2`, `AutomorphicBundles:B2/coefficient-tensor-hecke`, [HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback](#log-rh-pullback).

**Sources and relation to this target.**

- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 80. BP’s statement that the lattice HT filtration is Hecke functorial and tensor compatible, which the node makes precise (sums over a+b=i, duals, unit, exactness).

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="hodge-tate-parabolic-reduction"></a>

### The Hodge–Tate P^c_µ-reduction of the canonical p-adic torsor

`HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-tate-parabolic-reduction` · construction · proposed declaration `TauCeti.LogAdic.HodgeTateReduction`.

Over S^tor_{K,Σ} (K neat, smooth projective toroidal compactification with normal-crossings boundary, over a finite extension F of Q_p containing the reflex field and splitting G, with a cocharacter µ in the Hodge class defined over F), let G_pet,p be the pro-Kummer-étale Gᶜ(Q_p)-torsor of tensor isomorphisms W⊗_{Q_p}Q̂_p≅Ŵ_p, W∈Rep_{Q_p}(Gᶜ), so that G_pet,p×^{Gᶜ(Q_p)}W=Ŵ_p. Extend G^{c,an} to the pro-Kummer-étale site by U↦Gᶜ(Ô(U)) as in BP §4.4.8. The subsheaf P_HT⊆G_pet,p×^{Gᶜ(Q_p)}G^{c,an} of tensor trivializations W⊗Ô≅Ŵ_p⊗Ô carrying the standard ascending filtration Fil_iW:=⊕_{w≥−i}W[µ-weight w] to the lattice HT filtration F_i(Ŵ_p⊗Ô) for all W is a P^{c,an}_µ-torsor, P^c_µ={g: lim_{t→0}Ad µ(t)g exists}. On the de Rham side the canonical-extension torsor G^an_dR (étale site) has the P^{std,c,an}_µ-reduction P_dR given by the Hodge filtration, P^{std,c}_µ={g: lim_{t→∞}Ad µ(t)g exists}. Both reductions are Hecke-equivariant and compatible with change of level.

**Hypotheses and conventions.**

- The HT filtration is the tensor-compatible, exact, locally split filtration of type µ of canonical-ht-tensor; arbitrary filtered local systems are not claimed to give parabolic reductions.
- G_pet,p is defined from the coefficient functor W↦Ŵ_p, not from the toroidal level tower; its comparison with the tower’s deck group and its triviality over the tower diamond belong to PerfectoidShimuraVarieties:S6 (BP Theorem 4.4.40, §4.6.1).

**Construction or proof route.**

1. G_pet,p is a torsor: locally on the pro-Kummer-étale site the coefficient functor W↦Ŵ_p is tensor-isomorphic to the constant one, since it comes from Gᶜ(Q_p)-representations through the canonical coefficient construction.
2. An exact tensor filtration of type µ of a fibre functor is locally splittable, so P_HT is locally nonempty; it is a torsor under the stabilizer of the µ-filtration, which is P^c_µ (Tannakian extraction, imported convention).
3. For a faithful W the stabilizer of Fil_•W in Gᶜ is P^c_µ, so membership in P_HT may be tested on one faithful representation.
4. Hecke equivariance and level change follow from those of the comparison, the lattices and the filtration; the de Rham reduction is imported.

**Acceptance checks.**

- P_HT has structure group P^c_µ and P_dR has structure group P^{std,c}_µ; they are opposite parabolics with common Levi M^c_µ.
- No statement about the toroidal tower, its diamond or v-descent is made here.

**Planning API.**

- `TauCeti.LogAdic.HodgeTateReduction` (constructor): The pair (G_pet,p, P_HT) on the pro-Kummer-étale site of S^tor_{K,Σ}, with the imported de Rham reduction P_dR.
- `TauCeti.LogAdic.HodgeTateReduction.torsor_assoc` (characterisation): G_pet,p×^{Gᶜ(Q_p)}W≅Ŵ_p naturally and tensor-compatibly in W.
- `TauCeti.LogAdic.HodgeTateReduction.mem` (characterisation): A local trivialization lies in P_HT iff it carries Fil_•W⊗Ô to F_•(Ŵ_p⊗Ô) for one (equivalently every) faithful W.
- `TauCeti.LogAdic.HodgeTateReduction.isTorsor` (structure): P_HT is locally nonempty and simply transitive under P^{c,an}_µ.
- `TauCeti.LogAdic.HodgeTateReduction.levi` (projection): P_HT×^{P^{c,an}_µ}M^{c,an}_µ is M_HT^an, the Levi torsor of finite-levi-torsor; similarly P_dR gives M_dR^an.
- `TauCeti.LogAdic.HodgeTateReduction.hecke` (functoriality): Hecke pullbacks and change of level carry (G_pet,p,P_HT) and P_dR to the corresponding objects.
- `TauCeti.LogAdic.HodgeTateReduction.open_restriction` (compatibility): Restricted to the pro-étale site of S_K, P_HT is the reduction defined by the same filtration of the interior local systems.

**Discriminating unit tests.**

- `TauCeti.LogAdic.HodgeTateReduction.torus` (degenerate): If Gᶜ is a torus (µ central), P^c_µ=Gᶜ and P_HT is the whole pushed-out torsor.
- `TauCeti.LogAdic.HodgeTateReduction.siegel` (compatibility): On the open Siegel variety P_HT is the torsor of similitude trivializations of H₁(A,Q_p)⊗Ô carrying the µ-weight-one Lagrangian of Q_p^{2g} (which is Fil_{−1}) to Lie(A)⊗Ô(1) (BP §4.4.8, with W the standard representation realized as H₁(A,Q_p)).
- `TauCeti.LogAdic.HodgeTateReduction.stabilizer_faithful` (characterisation): For a faithful W the stabilizer in Gᶜ of the ascending filtration Fil_•W is P^c_µ, not P^{std,c}_µ; the latter stabilizes the Hodge filtration of W_dR.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor](#canonical-ht-tensor), [HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration](#lattice-hodge-tate-filtration), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations](#canonical-pro-kummer-realizations), `HodgeTateAndCanonicalSubgroups:T2`, `AutomorphicBundles:B0/central-split-quotient`, `AutomorphicBundles:B0/hodge-parabolic-convention`, `AutomorphicBundles:B1/filtration-reduction`, `AutomorphicBundles:B3.general/general-canonical-extension`.

**Sources and relation to this target.**

- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 80. BP’s finite-level torsor G_pet,p over S^tor_{K,Σ}, whose P^c_µ-reduction P_HT (“corresponding to the filtration on W_p⊗Ô”) and de Rham P^{std,c}_µ-reduction P_dR are defined in the same paragraph.
- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 80. The defining property of P_HT stated by the node (layout text of the PDF).
- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), §4.4.8, p. 68. In the Siegel case BP define P_HT as the trivializations of H₁(A,Q_p)⊗Ô respecting the HT filtration, which is the node’s membership description for a faithful representation.
- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), §4.0, p. 49. Conventions P^std_µ (limit t→∞) and P_µ (limit t→0) used for P_dR and P_HT.

**Uses.**

- PerfectoidShimuraVarieties:S6/kummer-to-v-bridge: Evaluates P_HT on perfectoid test objects over the toroidal tower diamond.
- BP text after Remark 4.4.39: M_HT^an:=P_HT×^{P^{c,an}_µ}M^{c,an}_µ.
- OverconvergentAutomorphicForms:O8: Uses the opposite parabolic conventions for the HT and de Rham reductions.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="finite-levi-torsor"></a>

### Finite-level cyclotomic Levi-torsor comparison

`HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor` · construction · proposed declaration `TauCeti.LogAdic.FiniteLeviComparison`.

Let P_dR⊆G_dR^an be the P^{std,c,an}_µ-reduction of the canonical-extension de Rham torsor given by the Hodge filtration (étale site of S^tor_{K,Σ}) and P_HT the P^{c,an}_µ-reduction of G_pet,p×^{Gᶜ(Q_p)}G^{c,an} given by the lattice HT filtration (pro-Kummer-étale site), where P^{std}_µ={g: lim_{t→∞}Ad µ(t)g exists} and P_µ={g: lim_{t→0}Ad µ(t)g exists} have common Levi M_µ. Put M_dR^an:=P_dR×^{P^{std,c,an}_µ}M^{c,an}_µ and M_HT^an:=P_HT×^{P^{c,an}_µ}M^{c,an}_µ. There is a canonical isomorphism of M^{c,an}_µ-torsors M_HT^an≃M_dR^an×^{µ,Z_p^×}Z_p(1) on the pro-Kummer-étale site of S^tor_{K,Σ}, compatible with the Hecke action, where Z_p(1) is the pro-étale Z_p^×-torsor of generators and µ:Z_p^×→M^{c,an}_µ is central. Hence a cyclotomic twist of M_HT^an is defined on the étale site. An untwisted equality requires an explicit cyclotomic trivialization.

**Hypotheses and conventions.**

- The central cocharacter µ acts on the common Levi; the de Rham and HT parabolic conventions are distinguished (P^{std,c}_µ stabilizes the Hodge filtration, P^c_µ the ascending HT filtration).
- BP states the identification “on the pro-étale site”; the node states it on the pro-Kummer-étale site of S^tor_{K,Σ}, where P_HT and the graded relation live.

**Construction or proof route.**

1. Import canonical de Rham torsor and flag conventions from AutomorphicBundles (canonical extension, P^{std,c}_µ-reduction by the Hodge filtration).
2. Take the HT torsor and its P^c_µ-reduction from hodge-tate-parabolic-reduction.
3. Use the graded comparison Gr_j(Ŵ_p⊗Ô)≃Gr^jW_dR⊗Ô(−j), tensor-compatibly in W, to identify the two Levi fibre functors after twisting the µ-weight w part by Z_p(1)^{⊗w}; this is the central cyclotomic contracted product. Check descent and Hecke coherence.

**Acceptance checks.**

- The result exported to S6 includes the central cyclotomic twist; it does not construct the tower map.

**Planning API.**

- `TauCeti.LogAdic.FiniteLeviComparison` (constructor): The finite-level comparison of Levi torsors with the µ-contracted cyclotomic torsor.
- `TauCeti.LogAdic.FiniteLeviComparison.central_twist` (characterisation): The twisting action is through the central cocharacter µ:Z_p×→M_µᶜ.
- `TauCeti.LogAdic.FiniteLeviComparison.hecke` (functoriality): The comparison commutes with finite-level Hecke pullbacks.
- `TauCeti.LogAdic.FiniteLeviComparison.trivialization` (compatibility): Choosing a compatible generator of Z_p(1) identifies the contracted product with M_dR; changing that generator acts through µ.
- `TauCeti.LogAdic.FiniteLeviComparison.assoc_bundle` (compatibility): For an M^c_µ-representation V on which µ(z) acts by z^w, M_HT^an×^{M^c_µ}V≅(M_dR^an×^{M^c_µ}V)⊗Ô(w), compatibly with tensor products and duals.

**Discriminating unit tests.**

- `TauCeti.LogAdic.FiniteLeviComparison.weight_zero` (degenerate): For central weight zero the cyclotomic twist is trivial.
- `TauCeti.LogAdic.FiniteLeviComparison.weight_one` (computation): On a central weight-one character the contracted product is the associated Tate line, not an untwisted line with the same Galois action.
- `TauCeti.LogAdic.FiniteLeviComparison.change_generator` (characterisation): Replacing a cyclotomic generator by u times it changes the trivialized comparison by µ(u); there is no generator-independent untwisted equality.
- `TauCeti.LogAdic.FiniteLeviComparison.graded_compatibility` (compatibility): For W∈Rep(Gᶜ), the isomorphism induced on associated graded bundles is Gr_j(Ŵ_p⊗Ô)≅Gr^jW_dR⊗Ô(−j), the graded relation of lattice-hodge-tate-filtration; the twist by µ⁻¹ instead of µ would give Ô(j).

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-tate-parabolic-reduction](#hodge-tate-parabolic-reduction), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor](#canonical-ht-tensor), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison](#canonical-log-period-comparison), `HodgeTateAndCanonicalSubgroups:T2`, `AutomorphicBundles:B0/hodge-parabolic-convention`, `AutomorphicBundles:B3.general/general-canonical-extension`.

**Sources and relation to this target.**

- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 80. Introduces the displayed identification M_HT^an=M_dR^an×^{µ,Z_p^×}Z_p(1), compatible with Hecke, which is the node’s statement.
- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), text after Remark 4.4.39, p. 80. The Hecke compatibility and the étale-site descent of the twisted torsor stated in the node.
- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), §4.4.8, p. 68. Definition of the contracted product M_dR×^{µ,Z_p^×}Z_p(1) through the central cocharacter µ, used by the node (Siegel case; §4.4.23, p. 74, repeats it for Hodge type).
- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), §4.0, p. 49. BP’s conventions P^std_µ (limit t→∞) and P_µ (limit t→0) with common Levi M_µ, which the node records.

**Uses.**

- PerfectoidShimuraVarieties:S6; BP Theorem 4.4.40: The tower trivialization pulls back this finite-level Levi comparison, including its twist.
- OverconvergentAutomorphicForms:O8 toroidal coefficient instance: Imports M_HT=M_dR×^{µ,Z_p^×}Z_p(1) with its tensor/dual compatibility over the toroidal boundary.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

<a id="hodge-type-comparison-agreement"></a>

### Hodge-type agreement with the abelian-scheme comparison

`HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-type-comparison-agreement` · theorem · proposed declaration `TauCeti.LogAdic.hodge_type_comparison_agreement`.

Let (G,X) be of Hodge type (Gᶜ=G) with a Siegel embedding, faithful symplectic representation V₀ and universal abelian scheme f:A→S_K, with V₀ realized by H₁(A)=(R¹f_*)^∨ as in BP §4.4.8 and AutomorphicBundles:B1/hodge-tensor-realizations (DLLZ-RH (5.5.2) use the contragredient normalization V₀↦R¹f_*; the argument of their Lemma 5.5.3 applies verbatim to the dual realizations), so that the realizations of V₀^{⊗m}(−t) are the duals of the cohomology of A^m, up to Tate twist. On the open Shimura variety: (i) for W=V₀^{⊗m}(−t) the canonical isomorphism p-W_dR≃W_dR of canonical-log-period-comparison is the one induced by Scholze’s relative de Rham comparison for A^m, and for every irreducible W∈Rep(G) it is induced from these by the Hodge tensor s_W cutting W out of some V₀^{⊗m_W}(−t_W) (Lemma 5.5.6, Corollary 5.5.7), hence for every W∈Rep(G) by additivity; (ii) hence on S_K the period isomorphism Ŵ_p⊗OB_dR≃W_dR⊗OB_dR is the abelian-scheme comparison with Hodge tensors (Caraiani–Scholze §§2.2–2.3), and the lattice HT filtration, P_HT and the Levi comparison restrict to those built from A and its tensors.

**Hypotheses and conventions.**

- Hodge type with a fixed Siegel embedding and neat K; the statement is on the open Shimura variety S_K only (BP Remark 4.4.39, p. 79).
- The identification of the lattice HT filtration of (H₁(A,Q_p),H_{1,dR}(A)) with the relative Hodge–Tate filtration of A is T2’s (Caraiani–Scholze §2.2), imported, not re-proved.

**Construction or proof route.**

1. DLLZ-RH Lemma 5.5.3: GAGA full faithfulness and Scholze’s relative comparison give (5.5.4) for V₀^{⊗m}(−t), equal to the identity at the special point h.
2. Lemma 5.5.6 and Corollary 5.5.7: each irreducible W is cut out of V₀^{⊗m}(−t) by a Hodge tensor s_W, giving (5.5.8).
3. Proposition 5.5.9 with Remark 5.5.10 (Faltings’s and Scholze’s comparisons agree for CM abelian varieties; Blasius for Hodge tensors): (5.5.8) is the identity at h on each component, hence equals the canonical isomorphism of Theorem 5.3.1, and Proposition 5.4.4 transfers this to the de Rham side.
4. The period isomorphism is µ⁻¹D_dR of the de Rham side tensored up, and for R^if_*Q_p the D_dR-identification is the one induced by Scholze’s comparison; so the lattices M, M⁰, the HT filtration and P_HT on S_K are those of the abelian-scheme comparison; conclude with T2’s description of the HT filtration and the faithful-representation test for P_HT.

**Acceptance checks.**

- The agreement is proved on the open Shimura variety; across the boundary the canonical extension is characterized by nilpotent residues, not by an abelian-scheme comparison.
- It does not give a new proof of the general comparison; it identifies the general canonical comparison with the abelian one in Hodge type.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison](#canonical-log-period-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy](#canonical-arithmetic-monodromy), [HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison](#special-point-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration](#lattice-hodge-tate-filtration), [HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-tate-parabolic-reduction](#hodge-tate-parabolic-reduction), [HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor](#finite-levi-torsor), `PadicHodgeTheory:P8/relative-de-rham-comparison`, `AutomorphicBundles:B1/hodge-tensor-realizations`, `AutomorphicBundles:B1/absolute-hodge-propagation`, `HodgeTateAndCanonicalSubgroups:T2`.

**Sources and relation to this target.**

- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), Remark 4.4.39, p. 79. BP’s statement that in Hodge type, off the boundary, the comparison is the abelian-variety one with Hodge tensors; the node states this agreement and its consequences for the HT filtration and P_HT.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Lemma 5.5.3, p. 62. The abelian-scheme comparison for V₀^{⊗m}(−t) via Scholze’s relative comparison, normalized at h; part (i) of the node.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 5.5.9 and its proof, pp. 63–64. The Hodge-tensor-induced morphism (5.5.8) is the identity at h, hence the canonical comparison of Theorem 5.3.1; part (i) for general W.
- [DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Remark 5.5.10, p. 64. Faltings’s and Scholze’s p-adic de Rham comparisons agree for CM abelian varieties, used to match the special-point normalization.

**Uses.**

- PerfectoidShimuraVarieties:S6/general-toroidal-period-map: Identifies π^tor_HT on the open subdiamond with the Hodge-type period map of S3.
- BP Remark 4.4.39: The Hodge-type, open-variety case of the identity.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

## Finite-level exported package

The aggregate exports only the finite-level canonical package to S6, the early log-site geometry to PR.8, and the primitive theorem to the cohomology consumers.

- [Finite-level general canonical comparison package](#finite-level-canonical-package)

<a id="finite-level-canonical-package"></a>

### Finite-level general canonical comparison package

`HodgeTateAndCanonicalSubgroups:T6/finite-level-canonical-package` · application · proposed declaration `TauCeti.LogAdic.finite_level_canonical_package`.

For every neat pure Shimura datum and smooth projective toroidal model S^tor_{K,Σ}, the canonical Gᶜ coefficient tensor functors are associated through completed logarithmic periods on the pro-Kummer-étale site. They yield the ascending Hodge–Tate flag, its P^c_µ-reduction P_HT and the cyclotomic Levi comparison M_HT≅M_dR×^{µ,Z_p^×}Z_p(1) at finite level, Hecke-compatibly, and for Hodge-type data they agree on the open Shimura variety with the constructions from the universal abelian scheme and its Hodge tensors. Export the full package to PerfectoidShimuraVarieties:S6, which owns the general toroidal-tower diamond Hodge–Tate map and coefficient pullback (BP Theorem 4.4.40). Export only early log-site geometry to PrismaticCohomology:PR.8 and log primitive comparison separately to completed/coherent cohomology consumers.

**Hypotheses and conventions.**

- This application is the narrowed T6 aggregate; it assumes no general-datum toroidal diamond is a perfectoid space.

**Construction or proof route.**

1. Assemble the canonical association, flag tensor compatibility, the P^c_µ-reduction, the finite Levi comparison and the Hodge-type agreement.
2. Name the S6 interface with the central twist and the smooth/SNC hypotheses preserved.
3. Keep the site-only and primitive-comparison exports independent of the late canonical arithmetic argument.

**Acceptance checks.**

- S6 imports the finite-level package; there is no reverse prerequisite S6→T6.

**Prerequisites.** [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison](#canonical-log-period-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor](#finite-levi-torsor), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor](#canonical-ht-tensor), [HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-tate-parabolic-reduction](#hodge-tate-parabolic-reduction), [HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-type-comparison-agreement](#hodge-type-comparison-agreement), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison](#log-primitive-comparison).

**Sources and relation to this target.**

- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), §4.4.38, p. 79. Opens the finite-level general-datum passage (§4.4.38–Remark 4.4.39 and the text before Theorem 4.4.40) that the package assembles.
- [BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), text before Theorem 4.4.40, p. 80. Ownership boundary: from this sentence on (diamond limit, Theorem 4.4.40) the material belongs to PerfectoidShimuraVarieties:S6; the package asserts nothing about the tower.

Proposed library placement: `TauCeti/AlgebraicGeometry/LogAdic/Comparison`, namespace `TauCeti.LogAdic`.

## Supplier requests

### `AdicSpacesPartII:R0`

Finite normal analytic extension across a normal crossings boundary: for a smooth rigid space X over a characteristic-zero nonarchimedean field, D⊂X a normal crossings divisor and a finite étale cover of X−D, its normalization over X is finite and is the unique normal extension (the input of DLLZ-adic Proposition 4.2.1, through [Han20, Thm. 1.6] after Lütkebohmert). Every other R0 need of this packet is met by exact R0 nodes (fibre products, finite and smooth morphisms, continuous differentials, completed tensor products, noetherian-type and uniformization nodes). R0's stated scope does not name normalization, so the gap 'Analytic normalization, root extraction and rigid resolution' carries this until R0 or a Part II owns it.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar](#rigid-abhyankar).

### `AdicSpacesPartII:R3`

Étale descent of coherent modules on a locally noetherian adic space X: coherent O_{X_ét}-modules correspond to coherent O_X-modules, with H^i(U_ét, M̃_ét)=0 for affinoid U and i>0 (DLLZ-adic Proposition A.10), beyond the finite projective case stated by the existing R3 nodes; and the same for the coefficient sheaves O_X⊗̂_k(B_dR⁺/t^r) used in DLLZ-RH Lemma 3.1.4(3)–(5).

Needed by: [HodgeTateAndCanonicalSubgroups:T6:log-sites/saturated-adic-products](#saturated-adic-products), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-differential-descent](#log-differential-descent), [HodgeTateAndCanonicalSubgroups:T6:comparison/bdr-coefficient-sheaves](#bdr-coefficient-sheaves).

### `CrystallineCohomology:CR.5:log-algebra`

State log structures, the associated log structure, inverse image of log structures, charts, characteristic monoids and the coherent/fine/fs conditions for an arbitrary ringed site (Kato's definitions use only the ringed topos), so that they apply to the étale ringed site (X_ét, O_{X_ét}) of a locally noetherian adic space. The existing CR.5:log-algebra nodes are stated for the étale site of a scheme; T6 adds the integral-image condition of DLLZ charts and the analytic constructions.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-adic-space](#log-adic-space), [HodgeTateAndCanonicalSubgroups:T6:log-sites/integral-adic-chart](#integral-adic-chart).

### `ClassicalAdicEtaleCohomology:H0`

Classical étale inputs with no exact node: étale acyclicity of M̃_ét for finite (not necessarily projective) modules M over noetherian affinoids; Scholze 2013 Corollary 3.17(i) for perfectoid spaces that are not locally noetherian (the existing H0/proetale-etale-comparison assumes locally noetherian; DLLZ-adic Proposition 5.3.13 notes the assumption is not needed); the Cartan–Leray spectral sequence for pro-finite Kummer Galois covers (H0/cartan-leray-spectral-sequence (b) is stated for pro-finite-étale torsors on X_proét); the cohomological-dimension bounds cd(X_an)≤dim X (de Jong–van der Put Proposition 2.5.8) and H^i(U_ét,L)=0 for i>2dim U with torsion coefficients; continuous Galois cohomology of arithmetic invariants. Generic site statements come from DiamondsAndVStacks:D0 nodes instead.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-coherent-acyclicity](#kummer-coherent-acyclicity), [HodgeTateAndCanonicalSubgroups:T6:log-sites/finite-kummer-descent](#finite-kummer-descent), [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-basis](#log-perfectoid-basis), [HodgeTateAndCanonicalSubgroups:T6:log-sites/geometric-boundary-monodromy](#geometric-boundary-monodromy), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-higher-direct-images](#kummer-etale-higher-direct-images), [HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology](#toric-kummer-cohomology), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-cohomology-finite-vanishing](#log-cohomology-finite-vanishing), [HodgeTateAndCanonicalSubgroups:T6:comparison/kummer-proper-pushforward-local-systems](#kummer-proper-pushforward-local-systems), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion](#log-tower-decompletion), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-oc-pushforward](#log-oc-pushforward), [HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham](#arithmetic-log-de-rham), [HodgeTateAndCanonicalSubgroups:T6:comparison/relative-log-comparison](#relative-log-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/bdr-coefficient-sheaves](#bdr-coefficient-sheaves).

### `EnhancedDerivedSheaves:E1`

Projection formula Rµ′_*(L̂⊗OB_dR,log)≅… for the morphism of ringed sites µ′:X_prokét/X_K→X_an with locally free coefficients, and hypercohomology of the log de Rham and B_dR-coefficient complexes. E1/presentability-and-derived-tensor supplies the pullback/pushforward adjunction and the derived tensor product but does not state the projection formula.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert](#log-riemann-hilbert), [HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-period-cohomology](#proper-log-period-cohomology), [HodgeTateAndCanonicalSubgroups:T6:comparison/bdr-coefficient-sheaves](#bdr-coefficient-sheaves).

### `EnhancedDerivedSheaves:E2`

R lim_n vanishing for inverse systems on X_prokét whose terms are (almost) acyclic on a basis, as in Scholze 2013 Lemma 3.18. The E2 nodes surjective-system-derived-limit and inverse-limit-amplitude assume a replete topos, which is not established for X_prokét, so they are near misses. PAPER-SCHOLZE-13 route 5 sends Scholze's Lemma 3.18 to AInfCohomology:AI.3; if AI.3 states it in this generality, retarget this request there (the edge AI.3→T6:log-sites is acyclic).

Needed by: [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity](#log-perfectoid-almost-acyclicity), [HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems](#completed-kummer-local-systems), [HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology](#proper-padic-boundary-cohomology), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert](#log-riemann-hilbert), [HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-period-cohomology](#proper-log-period-cohomology).

### `PadicHodgeTheory:P8`

Scholze 2013 §5 inputs: Lemmas 5.3, 5.4, 5.5 and 5.9 and the Artin–Schreier argument of the proof of Theorem 5.1 (DLLZ-adic Lemma 6.1.7, Theorem 6.2.1 and Lemma 6.2.4 cite exactly these), held by P8 through the accepted routes PAPER-SCHOLZE-13 route 1, PAPER-ZAVYALOV-25 route 7 and PAPER-BHATT-MORROW-SCHOLZE-18 route 14. FIX-RT-AREA-padic-1 (finding /24) decided their owner: the new sub-stage PadicHodgeTheory:P8:primitive, placed after P8:local-rational (Scholze's §5 uses the toric charts of his Lemma 5.2, planned at P8:local-rational/toric-charts-for-smooth-spaces) and before P8, CohomologyComparisons CP.3, AInfCohomology AI.4, TorsionCohomologyInfrastructure TC.2, IgusaVarietiesAndTorsionConcentration IG.3 and HodgeTateAndCanonicalSubgroups T6:log-primitive. Replace this stage citation by the P8:primitive nodes once that stage is in the atlas. Citing P8 creates no cycle: P8 is already an ancestor of T6:comparison (P8→T1→T2→T6:comparison).

Needed by: [HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology](#toric-kummer-cohomology), [HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-almost-finiteness](#proper-log-almost-finiteness), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison](#log-primitive-comparison).

### `ArithmeticLocallySymmetricSpaces:ALS.1`

Part II arithmetic-rigidity addition: Borel density and Margulis superrigidity (DLLZ-RH Theorem 5.6.1: H Q-simple simply connected, rk_R(H_R)≥2, Γ arithmetic) and the congruence subgroup input for groups not of type A, as actually used in DLLZ-RH §5.6 (Lemmas 5.6.5 and 5.6.7). The existing local-system layer is not evidence that these theorems are supplied.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy](#canonical-arithmetic-monodromy).

### `ShimuraVarieties:V8.general`

General pure Shimura data, the central split quotient Gᶜ, reflex-field canonical models, special-point conjugation and descent, simply connected reduction and the Piatetski-Shapiro pair of embeddings used in DLLZ-RH Lemma 5.6.7. The absence of the precise embeddings is recorded as a gap.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison](#special-point-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy](#canonical-arithmetic-monodromy).

### `HodgeTateAndCanonicalSubgroups:T1`

Tate twists, the Hodge–Tate weight convention and the functorial tensor-filtration interface; applied to the finite-level logarithmic lattice construction, not to a universal abelian family.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration](#lattice-hodge-tate-filtration).

### `HodgeTateAndCanonicalSubgroups:T2`

The algebraic Hodge cocharacter/parabolic convention and the Tannakian extraction of a flag of prescribed type from filtered representations; for Hodge-type data, the identification of the lattice Hodge–Tate filtration of (H₁(A,Q_p), H_{1,dR}(A)) with the relative Hodge–Tate filtration of the universal abelian scheme and Caraiani–Scholze's P_µ-reduction P_p (Caraiani–Scholze 2017 §§2.2–2.3). Its period map is only a compatibility example; no T2 construction is duplicated.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:comparison/lattice-hodge-tate-filtration](#lattice-hodge-tate-filtration), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-ht-tensor](#canonical-ht-tensor), [HodgeTateAndCanonicalSubgroups:T6:comparison/finite-levi-torsor](#finite-levi-torsor), [HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-tate-parabolic-reduction](#hodge-tate-parabolic-reduction), [HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-type-comparison-agreement](#hodge-type-comparison-agreement).

## Ownership and proposed restructuring

RT-AREA-padic-1/4 (confirmed) found BP Theorem 4.4.40 planned in both T6:comparison and PerfectoidShimuraVarieties:S6. FIX-RT-AREA-padic-1 (RT-AREA-padic-1.fixes.md, finding /4, edits 2–6) gives the narrowed texts; the atlas text of T6, T6:comparison and the roadmap summary still contains Theorem 4.4.40.

Apply the fix's edits: T6:comparison keeps the logarithmic period sheaves, Poincaré lemma, Riemann–Hilbert, the canonical association W_p⊗OB_dR,log≅W_dR⊗OB_dR,log with regularity, boundary extension and arithmetic rigidity, and at each finite level S^tor_{K,Σ} the Hodge–Tate filtration, its tensor and Hecke compatibility, the reduction P_HT and M_HT=M_dR×^{µ,Z_p^×}Z_p(1) (BP 4.4.38, Remark 4.4.39 and the text before Theorem 4.4.40). The toroidal tower diamond, the triviality of G_pet,p on it, π^tor_HT and its pullback statement (Theorem 4.4.40) are PerfectoidShimuraVarieties:S6's, imported through the existing T6→S6 edge. The packet's nodes already stop at the finite-level package.

RT-AREA-padic-1/24 (confirmed): Scholze's primitive comparison had no stage owner and its logarithmic version (DLLZ-adic Theorem 6.2.1) was planned nowhere. FIX-RT-AREA-padic-1 (finding /24, edits 1–4) decided the split; neither new stage is in the atlas yet. It rejected the finding's order (P8:primitive before P8:local-rational, a 2-cycle because Scholze's §5 uses Lemma 5.2's toric charts) and the P7 packet's CP.3:primitive alternative.

Adopt the fix as decided. PadicHodgeTheory:P8:primitive comes after P8:local-rational, with inputs P8:local-rational, AInfCohomology AI.3, PerfectoidSpaces P0/P3/P7, AdicEtaleGeometry A1/A2, ClassicalAdicEtaleCohomology H0 and AdicSpacesPartII R3, and exports to P8, CohomologyComparisons CP.3, AInfCohomology AI.4, TorsionCohomologyInfrastructure TC.2, IgusaVarietiesAndTorsionConcentration IG.3 and T6:log-primitive. HodgeTateAndCanonicalSubgroups:T6:log-primitive comes after T6:log-sites and before T6:comparison; it consists of this packet's toric-kummer-cohomology, proper-log-almost-finiteness, log-primitive-comparison, log-cohomology-finite-vanishing, proper-padic-boundary-cohomology and kummer-proper-pushforward-local-systems, imports P8:primitive (not late P8), and exports to T6:comparison (DLLZ-RH Lemma 3.6.1), TC.2 and the HigherHidaAndColemanTheory design. Until then these nodes stay in T6:comparison and cite PadicHodgeTheory:P8; proposed stage ids are not used as prerequisites.

RT-AREA-padic-1/23 (confirmed): PAPER-BOXER-CALEGARI-GEE-PILLONI-25 route 23 assigns the four Theorem 4.4.1 comparisons (4.4.1-usual, -cusp, -analytic-usual, -analytic-cusp) to T4, T5 and T6, none of which plans them. FIX-RT-AREA-padic-1 (finding /23) decided the re-routing; at this packet's baseline the paper result still lists the four items in route 23.

Apply the fix: route 4.4.1-usual and 4.4.1-cusp to TorsionCohomologyInfrastructure:TC.2 (Hodge-type toroidal rational form) and 4.4.1-analytic-usual/-cusp to route 22 (HigherHidaAndColemanTheory). Both import the logarithmic primitive comparison (this packet's log-primitive-comparison, later T6:log-primitive). No T6 node owns completed or coherent cohomology of the tower.

The existing P3 and ALS.1 descriptions do not contain the general supplier statements needed for DLLZ-RH Appendix A/§3.3 and §5.6.

Add a PerfectoidSpaces Part II for Banach decompletion systems: Definitions A.1.2, A.1.6, A.1.9, Theorems A.1.8, A.1.10 and Corollary A.1.21 of DLLZ-RH, the Tate–Sen axioms with Banach-algebra coefficients (Berger–Colmez 2008, Propositions 3.1.4 and 4.1.1) and Liu–Zhu's gluing of finite projective modules over A⊗̂_k(B_dR⁺/ξ^r) (Proposition 3.3); T6 owns only the logarithmic tower instances. Add an ArithmeticLocallySymmetricSpaces Part II for the Borel-density, superrigidity and congruence-subgroup instances used in DLLZ-RH §5.6; T6 owns their application to canonical Gᶜ coefficients.

Dependency lines. The nodes cite exact supplier nodes in stages that are not yet atlas ancestors of their T6 stage, and the stage texts list dependencies the plan does not use.

T6:log-sites: add ClassicalAdicEtaleCohomology H0, AdicSpacesPartII R3, AdicEtaleGeometry A4 and PerfectoidSpaces P0, P1, P3 to its Dependencies line and stage edges (all acyclic; P8 and CP.3 stay excluded). T6:comparison: add ArithmeticLocallySymmetricSpaces ALS.1 (request present); do not add MotivesAndAlgebraicCycles MC.7, which would close a cycle (the CM special-point inputs are a gap); drop DiamondsAndVStacks D4/D6 and ShimuraCompactifications C3.general, which serve only Theorem 4.4.40 (S6); keep CohomologyComparisons CP.3 only as a compatibility mention, since no T6 node uses it as an input.

### Routed inputs outside this part

**CS17 Theorem 4.1.4 and classification/modification inputs.** Imported only through the T1/T2 interfaces; targets belong to T2 and VectorBundlesOnCurvesAndSlopeTheory. CS17 §§2.2–2.3 (Hodge-type comparison with Hodge tensors) is the source of the Hodge-type agreement node and is requested from T2.

**Bijakowski–Pilloni–Stroh 2016; BP Higher Hida 2026; Pilloni 2020; BCGP 2021; Scholze 2015.** Fargues degree, Hasse invariants, integral lattices, canonical-subgroup bounds and early Siegel period estimates belong to T0–T5. None is a new definition or theorem of this finite-level T6 pass.

**BCGP-25 route 23 items 4.4.1-usual/-cusp/-analytic-usual/-analytic-cusp.** Not T6 targets. FIX-RT-AREA-padic-1 (finding /23) re-routes them to TC.2 and route 22; the paper result still lists them in route 23 at this baseline. Their logarithmic primitive input is log-primitive-comparison.

**Liu–Zhu 2017 (PAPER-LIU-ZHU-17 route 8).** Its review judged the ordinary prefix of T6:comparison the right owner but sent the route back for revision. Until it is accepted, the interior Riemann–Hilbert inputs are a recorded gap, not T6 nodes.

**Lan–Liu–Zhu, De Rham comparison and Poincaré duality for rigid varieties (arXiv:1912.13030).** DLLZ-RH proves no compactly supported comparison; AutomorphicBundles B5's request to T6:comparison for a compact-support/subcanonical version needs this source, which is not among this packet's sources. Not planned here.

**DLLZ-adic §§2–6 (with §4.5, §6.4 read for boundaries), DLLZ-RH §§2–3, 5 and Appendix A; BP 4.4.38–4.4.39.** Actual sources of this packet; read in the public author copies.

**BP 4.4.40 and §4.6.1.** Read to verify the boundary with PerfectoidShimuraVarieties:S6; not local targets. S6's 'kummer-to-v-bridge' request is part of Theorem 4.4.40's proof and stays with S6.

## Precise mathematical gaps

### Early ordinary primitive owner decided but not yet a stage

FIX-RT-AREA-padic-1 (finding /24) decided that Scholze 2013 Theorems 4.9 and 5.1, Lemma 4.12, Lemmas 5.3–5.9 and the finiteness corollaries are owned by a new sub-stage PadicHodgeTheory:P8:primitive after P8:local-rational. That stage is not yet in the atlas, and the P7 packet has no node for Lemma 4.12, Lemmas 5.3–5.9 or Theorem 5.1. Until it exists the three consumers cite PadicHodgeTheory:P8, which holds these results through accepted routes; this creates no cycle. The reason to move to P8:primitive is that TC.2 and the HigherHidaAndColemanTheory design should import an early stage, not that late P8 would close a cycle with T6.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:comparison/toric-kummer-cohomology](#toric-kummer-cohomology), [HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-almost-finiteness](#proper-log-almost-finiteness), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-primitive-comparison](#log-primitive-comparison).

### Analytic normalization, root extraction and rigid resolution

Rigid Abhyankar (DLLZ-adic Proposition 4.2.1) uses three analytic inputs no atlas node states: finite étale covers of X−D extend to finite normal covers of X ([Han20, Thm. 1.6], after Lütkebohmert); extraction of roots of the boundary coordinates on covers of punctured polydiscs of radius p^{−b(d,p)} ([Lüt93, Lem. 3.2 and Thm. 2.2]); and Bartenwerfer's extension of bounded functions across a divisor ([Bar76, §3]). DLLZ-adic Corollary 6.2.3 uses resolution of singularities in the rigid analytic category (as cited there, after Bierstone–Milman) to give a smooth Zariski open U of a proper rigid space a proper smooth compactification with normal crossings boundary; AlgebraicModuliForArithmeticGeometry:R09.7 owns resolution only for varieties of finite type, and the review of PAPER-LIU-ZHU-17 (route 9) records that a rigid-analytic resolution supplier statement is missing. No claim is made that an arbitrary nonproper rigid space has such a compactification.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:log-sites/rigid-abhyankar](#rigid-abhyankar), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-cohomology-finite-vanishing](#log-cohomology-finite-vanishing).

### General Banach decompletion input

PerfectoidSpaces:P3 supplies almost purity and étale tilting, not DLLZ-RH Appendix A's decompletion systems and stably decompleting towers (Definitions A.1.2, A.1.6, A.1.9, Theorems A.1.8, A.1.10, and Corollary A.1.21 on models good for a family of twists, used in Lemma 3.3.17). Their proofs also use the Tate–Sen axioms with Banach-algebra coefficients (Berger–Colmez 2008, Propositions 3.1.4 and 4.1.1, axiom TS(3), in Proposition A.2.1.1) and Liu–Zhu's gluing of finite projective modules over A⊗̂_k(B_dR⁺/ξ^r) (Liu–Zhu 2017 Proposition 3.3, in Theorem A.2.3.4). A PerfectoidSpaces Part II supplier is proposed (restructure); the logarithmic tower instances remain T6 nodes.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:comparison/log-tower-decompletion](#log-tower-decompletion).

### Arithmetic-group rigidity and congruence instances

ALS.1’s existing local systems do not establish Borel density, Margulis superrigidity or the non-type-A congruence subgroup theorem used in §5.6. The exact groups and hypotheses must be closed by an arithmetic Part II supplier; this packet does not equate an owner label with a proof.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy](#canonical-arithmetic-monodromy).

### Shimura rigidity embeddings and descent

The exact pair of Piatetski-Shapiro embeddings in DLLZ-RH Lemma 5.6.7 and their simple-factor nontriviality, plus special-point descent conventions, need V8.general supplier closure. Mere existence of special points is insufficient.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-arithmetic-monodromy](#canonical-arithmetic-monodromy), [HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison](#special-point-comparison).

### CM special-point comparison inputs

No atlas node supplies the CM/potentially crystalline tensor package of DLLZ-RH Proposition 5.4.1: Blasius's theorem on Hodge tensors under p-adic comparison [Bla94], potential good reduction of CM abelian varieties [ST68, §5], and the agreement of Faltings's and Scholze's de Rham comparison isomorphisms for abelian varieties with potentially good reduction [IIK21, §11] (Remark 5.5.10). MotivesAndAlgebraicCycles:MC.7 states no node with these results, and citing its stage would close a cycle through other planned roadmaps (AutomorphicBundles B5 cites T6:comparison, and B5→C5→PELModuli M6→R28.1→R28.4→MC.7), so the inputs need an owner that does not depend on T6 — an early CM abelian-variety comparison supplier — rather than MC.7. No hypothetical general Shimura motive is assumed.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:comparison/special-point-comparison](#special-point-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/hodge-type-comparison-agreement](#hodge-type-comparison-agreement).

### Derived limits on the pro-Kummer étale site

The R lim_n vanishing of Scholze 2013 Lemma 3.18 type on X_prokét (inverse systems acyclic on a basis of log affinoid perfectoid objects) has no exact supplier: the E2 nodes assume a replete topos, which is not established for X_prokét. The generic filtered-colimit, Čech-to-derived and stackification statements are exact DiamondsAndVStacks:D0 nodes and are cited directly.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:log-sites/log-perfectoid-almost-acyclicity](#log-perfectoid-almost-acyclicity), [HodgeTateAndCanonicalSubgroups:T6:log-sites/completed-kummer-local-systems](#completed-kummer-local-systems), [HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology](#proper-padic-boundary-cohomology), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert](#log-riemann-hilbert), [HodgeTateAndCanonicalSubgroups:T6:comparison/proper-log-period-cohomology](#proper-log-period-cohomology).

### Liu–Zhu ordinary p-adic Riemann–Hilbert package has no accepted owner

DLLZ-RH builds on the interior theory of Liu–Zhu, 'Rigidity and a Riemann–Hilbert correspondence for p-adic local systems' (2017): Theorem 2.1(i)–(iv) and Theorems 3.8–3.9 (the functors RH and D_dR on smooth rigid varieties, their pullback and tensor compatibility), Corollary 3.12(ii), and Theorem 1.2 (the automorphic étale local systems W_p are de Rham on the open Shimura variety, used on DLLZ-RH p. 55 to define D_dR,log(W_p)). PadicHodgeTheory:P8 supplies Scholze's de Rham notion and relative comparison (P8/de-rham-lisse-sheaf, P8/relative-de-rham-comparison) but not RH pullback, tensor compatibility or Liu–Zhu rigidity. The independent review of PAPER-LIU-ZHU-17 judged the ordinary prefix of T6:comparison the right direction (route 8) but sent the route back for revision, so no owner is accepted yet.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:comparison/log-riemann-hilbert](#log-riemann-hilbert), [HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham](#arithmetic-log-de-rham), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-rh-pullback](#log-rh-pullback), [HodgeTateAndCanonicalSubgroups:T6:comparison/unipotent-log-tensor](#unipotent-log-tensor), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-pro-kummer-realizations](#canonical-pro-kummer-realizations), [HodgeTateAndCanonicalSubgroups:T6:comparison/canonical-log-period-comparison](#canonical-log-period-comparison).

### Further external inputs of the logarithmic proofs without an atlas owner

boundary-local-system-extension (DLLZ-adic Lemma 4.6.2): Huber's comparison of algebraic and analytic étale cohomology [Hub96, Prop. 2.1.4, Thm. 3.8.1] and log purity for schemes [Ill02, Thm. 7.2] (Fujiwara–Kato). log-regularity-and-extension (DLLZ-RH Propositions 3.4.16–3.4.17): André–Baldassarri's regular-singular local freeness and uniqueness [AB01, Ch. 1, 4.5–4.7], [ABC20, 11.2.2, 11.5.1]. arithmetic-log-de-rham (DLLZ-RH Lemma 3.3.18): Kisin's codimension-two extension [Kis99, Cor. 2.2.4]. relative-log-comparison (DLLZ-RH §3.5): Katz's normalized residues of the Gauss–Manin connection [Kat71, §VII]. kummer-proper-pushforward-local-systems (DLLZ-adic Corollary 6.3.5): the relative finiteness theorem [SW20, Thm. 10.5.1] (R^if_ét,* of an étale Z_p-local system along a proper smooth morphism of rigid analytic varieties over a characteristic-zero field is a local system). Each needs a supplier node or a request once an owner is identified; none is assumed here.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:log-sites/boundary-local-system-extension](#boundary-local-system-extension), [HodgeTateAndCanonicalSubgroups:T6:comparison/log-regularity-and-extension](#log-regularity-and-extension), [HodgeTateAndCanonicalSubgroups:T6:comparison/arithmetic-log-de-rham](#arithmetic-log-de-rham), [HodgeTateAndCanonicalSubgroups:T6:comparison/relative-log-comparison](#relative-log-comparison), [HodgeTateAndCanonicalSubgroups:T6:comparison/kummer-proper-pushforward-local-systems](#kummer-proper-pushforward-local-systems).

### Published-source collation of DLLZ-adic findings

Springer DOI 10.1007/978-3-031-21550-6_3 served only a subscription preview. The DLLZ-adic findings (E1 on Corollary 6.3.4 and the later entries on Lemma 4.4.29, §3.2, §6.1 and Theorem 6.2.1) are scoped to the hashed author copy; collate them with the published chapter before asserting a version-of-record error. The nodes state the corrected forms, supported independently by Theorem 6.2.1 and Lemma 4.6.2.

Needed by: [HodgeTateAndCanonicalSubgroups:T6:comparison/proper-padic-boundary-cohomology](#proper-padic-boundary-cohomology), [HodgeTateAndCanonicalSubgroups:T6:log-sites/kummer-etale-higher-direct-images](#kummer-etale-higher-direct-images).

## Source corrections carried into the targets

These are the 13 findings confirmed by `REV-HodgeTateAndCanonicalSubgroups--T6`. Their descriptions state the source behavior and correction in our own words; the packet retains the reviewer’s separate verdicts. The chapter and journal versions remain uncollated.

### E1: error

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Author copy log-adic.pdf, Corollary 6.3.4, p. 88; compare Remark 6.2.2, p. 85. Published chapter not collated..

Source behavior: The source asserts finiteness of the Zp-modules for every i ≥ 0.

Correction: Require X proper for the finiteness assertion. Keep the local-system extension equivalence without that extra hypothesis; do not silently infer nonproper cohomological finiteness.

Reason: The hypotheses are those of Theorem 4.6.1 (X smooth over k with a normal crossings divisor as in Example 2.3.17, char(k)=0, k⁺=O_k), not properness; no properness appears at the start of §6, §6.1 or §6.3 or in the conventions. Definition 6.3.1 allows torsion Z_p-systems. For the nonproper closed unit disc with empty boundary and the constant F_p-system, Remark 6.2.2 explicitly states that H¹(D,F_p) is infinite. The printed proof invokes Theorem 6.2.1, which assumes X proper, both for the limit argument and for the finiteness. The extension statements and the first comparison hold levelwise without properness. DLLZ-RH applies the corollary only with a proper compactification (Corollary 3.2.10), so DLLZ-RH is unaffected.

Affects: a stated result. Independent verdict: `confirmed`.

### E2: gap

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Definition 3.2.4 and the paragraph after (3.2.8), p. 27; Proposition 3.2.9 and Theorem 3.2.18.

Source behavior: The source asserts that Ω^log_{B/A} is finite over B and deduces that its natural B-module topology is complete and that d_{B/A} is continuous.

Correction: Add Huber's standing assumption ([Hub96, (1.1.1)]: A has a noetherian ring of definition or is strongly noetherian Tate) to the tft setting of Definition 3.2.4, or state Proposition 3.2.9 and Theorem 3.2.18 for such A; all later uses (§3.3, locally noetherian log adic spaces) satisfy it.

Reason: The presentation (3.2.7) uses Huber's continuous differentials Ω_{B/A} ([Hub96, (1.6.2)]), which are defined and finite under (1.1.1), and the inference from finite generation to completeness needs finite modules over B to be complete in the natural topology, which holds for B of noetherian type but not for an arbitrary complete Huber ring; Definition 3.2.4 only asks A, B complete and A→B tft.

Affects: the proof. Independent verdict: `confirmed`.

### E3: misprint

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Author copy log-adic.pdf (arXiv:1912.09836v2 final version), Lemma 4.4.29, p. 65.

Source behavior: The lemma asserts invertibility of the canonical morphism ∧i R1 εét,∗ (µn ) → Ri εét,∗ (µn ).

Correction: the canonical (cup-product) morphism ∧^i R^1ε_ét,*(μ_n) → R^iε_ét,*(μ_n^{⊗i}) is an isomorphism; equivalently ∧^i(M̄^gp_X/nM̄^gp_X)(−i) ≅ R^iε_ét,*(Z/n), the form used in Lemma 4.6.2.

Reason: By Lemma 4.4.27 and Corollary 4.4.22 the stalk of R^iε_ét,*(μ_n) is H^i(Hom(M̄^gp,Ẑ′(1)),μ_n)≅∧^i(M̄^gp/n)⊗μ_n^{⊗(1−i)}, whereas ∧^iR^1ε_ét,*(μ_n)≅∧^i(M̄^gp/n) by (4.4.28). The two differ by the twist μ_n^{⊗(1−i)}, which is nontrivial as a Galois module when μ_n⊄O_X: for an fs log point over Q_5 with M̄=N² and n=3, the printed statement for i=2 asks for Z/3≅μ_3^{⊗−1}, and for i=0 for Z/3≅μ_3, both false. The cup product lands in R^iε_*(μ_n^{⊗i}). Lemma 4.6.2 (p. 69) states the correctly twisted form ∧^i(M̄^gp/nM̄^gp)(−i)≅R^iε_*(Z/n) and its proof invokes Lemma 4.4.29 in that form. Confirmed on the rendered page image of p. 65 (μ_n untwisted in both places).

Affects: a stated result. Independent verdict: `confirmed`.

### E4: gap

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Author copy log-adic.pdf, §6.1 (setting before Proposition 6.1.1) and Proposition 6.1.1, p. 81; published chapter not collated..

Source behavior: The source takes V = Spa(S1, S1+) to be an affinoid fs log adic space, log smooth over Spa(k, k+), with (k, k+) as in Definition 3.1.9 and k+ = Ok. It further requires characteristic zero for k and all roots of unity in k, then calls Ẽ := lim Em a log affinoid perfectoid object.

Correction: Assume moreover that k is a perfectoid field (of residue characteristic p), e.g. algebraically closed as in Theorem 6.2.1, the only place Proposition 6.1.1 is applied.

Reason: Definition 5.3.1(3) requires the completed colimit k⟨P_{Q≥0}⟩ to be perfectoid, which holds only if k is perfectoid (for P=0 it is k itself; in general k⁺⟨P_{Q≥0}⟩/p=(k⁺/p)[P_{Q≥0}] has surjective Frobenius only if k⁺/p does). A complete field of characteristic zero containing all roots of unity need not be perfectoid (e.g. the Gauss-norm completion of the completed Q_p(μ_∞)(T), whose residue field F̄_p(T) is imperfect). The proof of Proposition 6.1.1 applies Lemma 6.1.11 (via Theorem 5.4.3) to Ṽ, so it needs Ẽ log affinoid perfectoid. Checked on the rendered page 81.

Affects: the proof. Independent verdict: `confirmed`.

### E5: gap

[DLLZ-adic](https://www.kwlan.org/articles/log-adic.pdf), Author copy log-adic.pdf, Theorem 6.2.1 and the sentence 'Consequently, …', p. 85; proof p. 87; published chapter not collated..

Source behavior: The theorem assumes an affinoid field (k, k+) with k algebraically closed of characteristic zero, and concludes that H^i(Xkét, L) is finite dimensional over Fp for every i ≥ 0.

Correction: Assume that k has residue characteristic p (k is an extension of Q_p), as the proof does.

Reason: If the residue characteristic of k is not p, then p is a unit in k⁺, so k⁺/p=0 and O⁺/p=0; parts (1) and (2) hold trivially and the deduced finiteness of H^i(X_két,L) does not follow. The proof also uses log affinoid perfectoid objects (defined over Spa(Z_p,Z_p)) and an element ϖ∈k♭ with ϖ♯=p. Every application in DLLZ-adic and DLLZ-RH is over an extension of Q_p. Checked on the rendered page 85.

Affects: the proof. Independent verdict: `confirmed`.

### E6: error

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollary 2.4.6, p. 21 (author copy = arXiv:1803.05786v4).

Source behavior: The source declares exactness of 0 → B+_dR,X ⊗_{f⁻¹_prokét(B+_dR,X′)} f⁻¹_prokét(OB+_dR,log,X′) → OB+_dR,log,X → OB+_dR,log,X ⊗ Ω^{log,1}_{X/X′} → ⋯. Its initial tensor product is uncompleted; it makes analogous claims for B_dR and OB_dR,log.

Correction: The first term must be the tensor product completed for the filtration, locally B+_dR,X|_X̃[[y′_1,…,y′_{n′}]] in the base coordinates (and B_dR,X|_X̃{W′_1,…,W′_{n′}} in the B_dR version); with it the complexes are exact and strictly compatible with the filtrations, which is what the printed proof shows.

Reason: The proof reduces to 0→B+_dR,X|_X̃[[y′]]→B+_dR,X|_X̃[[y]]→⋯, whose first term is the completed tensor product. Take X=T²→X′=T¹ (projection, trivial log structure, a log smooth map between spaces as in Remark 2.4.1(1)): ∇_{X/X′}=∂/∂y₂⊗δ(a₂) has kernel B+_dR,X[[y₁]], which contains ∑_k[T₂♭]^k y₁^k. Every element in the image of the uncompleted tensor product has y₁-coefficients in a finitely generated f⁻¹B+_dR,X′-submodule, while θ([T₂♭]^k)=T₂^k are linearly independent over the functions pulled back from X′; so exactness fails at OB+_dR,log,X. Same mechanism as PadicHodgeTheory/E12 for Scholze 2013, Proposition 8.5.

Affects: a stated result. Independent verdict: `confirmed`.

### E7: misprint

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Proposition 3.3.3(2), p. 28.

Source behavior: The source asserts that µ′_{Z,∗}(L̂_Z ⊗_{Q̂_p} OC_{log,Z}) is locally free and finite over gr⁰(O_X ⊗̂_k B_dR), with rank rk_{Q_p}(L) when Z = X.

Correction: ... a finite locally free gr⁰(O_Z ⊗̂_k B_dR) = O_Z ⊗̂_k K-module ...

Reason: µ′_Z lands in Z_an, Z is X or an open subspace of a stratum of D, and the proof establishes statement (a) over R̄_K = R̄ ⊗̂_k K with R̄ = R/(T₁,…,T_l); Lemma 3.3.2 on the same page uses O_Z. For Z ≠ X the module is not locally free over O_X ⊗̂_k K.

Affects: nothing. Independent verdict: `confirmed`.

### E8: misprint

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Theorem A.2.2.3, p. 74.

Source behavior: The theorem asserts that ({A_m}_{m≥1}, Â_∞, Γ̃) forms a decompletion system.

Correction: ({A_{m,k̂_∞}}_{m≥1}, Â_∞, Γ̃) is a decompletion system.

Reason: A_m is not defined in A.2.2; the proof combines Proposition A.2.2.1, which is about {A_{m,k̂_∞}}, with Theorem A.1.10, and §3.3 applies the theorem to R_{K,m} over K.

Affects: nothing. Independent verdict: `confirmed`.

### E9: gap

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Corollaries 2.4.2(4) and 2.4.5, pp. 20–21, citing Corollary 2.2.6, p. 12.

Source behavior: The source derives the log Faltings’s extension from Corollaries 2.2.6 and 2.4.2: ... 0 → Ô_{X_prokét}(1) → gr¹ OB+_dR,log → ...

Correction: Corollary 2.2.6 assumes X over a perfectoid field containing all roots of unity, while Corollaries 2.4.2(4) and 2.4.5 concern X over a p-adic field k. Apply Corollary 2.2.6 on X_prokét/X_{k̂_∞} (X_{k̂_∞}=lim X_{k(µ_m)} is a pro-finite-étale cover in X_prokét) and descend the canonical, Galois-equivariant isomorphism gr^r B_dR ≅ Ô(r), or cite the ordinary statement over any X over Spa(Q_p,Z_p).

Reason: The hypothesis of Corollary 2.2.6 is not satisfied by X over a p-adic field; the identification is canonical (t^r f ↦ f ⊗ ε^{⊗r} is independent of ε), so the descent step is routine but not stated.

Affects: nothing. Independent verdict: `confirmed`.

### E10: gap

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Equation (2.2.8) and Definition 2.2.10, p. 13 (with the §2 standing assumption, p. 9).

Source behavior: For k with characteristic zero and residue characteristic p, it defines S_{i,r} := (R_i ⊗̂_{W(κ)} (W(R^{♭+})/ξ^r))[M_i ×_M M^♭]/(α̃_{i,r}(a)).

Correction: Assume the residue field κ perfect (automatic for the p-adic fields to which the sheaf is applied, Remark 2.2.12), or replace W(κ) by a base over which R_i and W(R^{♭+}) are canonically algebras.

Reason: §2 only assumes k complete nonarchimedean of characteristic 0 with residue characteristic p. The W(κ)-algebra structures on R_i and on W(R^{♭+}) need maps W(κ)→O_k and κ→R^{♭+}, which exist canonically when κ is perfect but not for imperfect κ.

Affects: nothing. Independent verdict: `confirmed`.

### E11: misprint

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Author copy log-RH.pdf, proof of Corollary 3.5.7, p. 40 (page image checked).

Source behavior: The source allows no more than one summand m_{WZ₀} h*_{WZ₀}(Res_Z(∇_L)) that is non-nilpotent; if such a summand occurs, m_{WZ₀}=1.

Correction: … summand m_{WZ₀} h*_{WZ₀}(Res_{Z₀}(∇_L)) …

Reason: The summand indexed by Z₀ in Res_W(h*(∇_L))=∑_{h(W)⊂Z} m_WZ h*_{WZ}(Res_Z(∇_L)) involves Res_{Z₀}; the next sentence of the proof uses Res_{Z₀}(∇_L).

Affects: nothing. Independent verdict: `confirmed`.

### E12: misprint

[DLLZ-RH](https://www.kwlan.org/articles/log-RH.pdf), Author copy log-RH.pdf, proof of Proposition 3.4.16, p. 37 (page image checked).

Source behavior: The source asserts freeness for the completed stalk of 𝓔 at every classical point belonging to X.

Correction: the completion of the stalk of F at each classical point of X is free

Reason: Proposition 3.4.16 concerns the torsion-free coherent module F; no 𝓔 occurs in its statement.

Affects: nothing. Independent verdict: `confirmed`.

### E13: misprint

[BP](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/HigherColeman.pdf), Higher Coleman theory (author manuscript, sha256 d340c9a0…), text after Remark 4.4.39, p. 79 (definition of M and M₀) and the displayed formula for Fil_{−j}.

Source behavior: It defines M = W_p ⊗_{Q_p} B⁺_{dR,log} together with M₀ = (W_dR ⊗ OB⁺_{dR,log})^{∇=0}, and gives … Fil_{−j} W_p ⊗ Ô = (M ∩ Fil^j M⁰)/(Fil¹M ∩ Fil^j M⁰).

Correction: M = W_p ⊗_{Q_p} B⁺_dR, and one symbol for the second lattice (M₀ = M⁰).

Reason: No sheaf B⁺_{dR,log} is defined: BP lists only B⁺_dR, B_dR, OB⁺_{dR,log} and OB_{dR,log}, DLLZ-RH defines no unadorned log period sheaf B_{dR,log}, and the next sentence calls M a B⁺_dR-local system. The second lattice is named M₀ in its definition and M⁰ in the displayed formula. Checked on the rendered page (220 dpi), not only in pdftotext output.

Affects: nothing. Independent verdict: `confirmed`.

## Suggested Lean file and validation

The [suggested file](../suggested/HodgeTateAndCanonicalSubgroups--T6.lean)
imports individual modules at the pinned baseline. Its affine, chart and module
components use existing carriers: Huber pairs, monoid algebras, derivations,
completion, localization, module quotients, representations and generic sheaves.
Each component says which geometric conditions are omitted. In particular,
`IntegralChart` does not encode the associated-log isomorphism, generic sheaf
carriers do not construct the Kummer topology, and `TwoDeRhamLattices` does not
encode horizontal sections or geometric lattice descent.

The continuous log derivation component supplies the B-module operations and the
B-linear projection to **continuous** derivations, with postcomposition and its
composition law. A diagonal two-lattice model in K((t))ⁿ identifies its reduction
modulo t with Kⁿ and its intersection filtration with the cocharacter weight
flag. An explicit idempotent projector expresses the pointwise splitting. The
weights (1,0) test the homological Siegel indices; identifying its summands with
Lie(A)(1) and ω_{Aᵗ} requires the imported T2 theorem. The central-twist component
also records the action of a change of Tate generator, including the inverse
scalar at weight −1.

Every node, API item and unit test has its full contract in the final catalogue,
under the packet name. A catalogue entry marked “not stated” is a signature
omission. No untyped geometric statement is counted as an elaborated theorem,
and no missing condition is replaced by an arbitrary proposition field. The
full geometric theorem nodes await the exact supplier carriers listed above.
The final file has typed components for 123 of 406 distinct packet names:
20 of 68 node declarations, 49 of 212 API names after removing the names that
also name nodes, and 54 of 126 tests. The 246 API entries include 34 node names.
The other 283 distinct names have explicit signature omissions. No full geometric
theorem node is typed. Elaboration with `lean-check` exits 0; its 130 warnings all
concern unproved declarations. The packet checker reports zero errors and warnings.
The round-2 [handoff](../handoff/BP-HodgeTateAndCanonicalSubgroups--T6~2.md)
records the checks and the reproducible catalogue synchronization recipe.
