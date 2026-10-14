# Completed cohomology, homology and arithmetic towers, Part II: layers CC.0–CC.7 (part CC.0)

Completed cohomology turns the finite-level cohomology of an arithmetic tower into one module over the completed group algebra of a compact p-adic group: take the colimit over p-levels with coefficients O/varpi^s, then the limit over s. Completed homology is the dual construction, a limit over levels under covering pushforward. Layers CC.0 to CC.7 of this roadmap build the actual tower (CC.0), the smooth colimits (CC.1), their completion and the derived limit (CC.2), continuous duals and completed homology (CC.3), finite projective chain models over the Iwasawa algebra (CC.4), finiteness and admissibility (CC.5), descent to finite level (CC.6) and the support triangles (CC.7).

These layers are planned in the whole-roadmap packet CompletedCohomologyPartII.json, whose reader is research/blueprint/readmes/CompletedCohomologyPartII.md (the owner below). An independent review accepted that plan on 13 October 2026. This document is the part of the roadmap that this job (part CC.0) was asked to plan, and it plans nothing twice. For each target the stages state, it names the owner's declarations and the section of the owner's reader where they are stated with their hypotheses, API, checks and proof routes. The same holds for each item of the five papers the maintainer added to these layers, for each red-team finding handed to this job, and for each request another roadmap makes of these layers. Five targets are stated by no owner declaration, and this part plans them in full: Fu's double-limit model of completed homology and Nakamura's completed modules and Borel–Moore duality at varying tame level (CC.3), and, for the requests of CohomologyComparisons, Pan's control lemma for complete torsion-free complexes (CC.2) and the coefficient interchange of completed cohomology (CC.4). To use a result, cite the owner's declaration, or one of the five below.

## Scope and boundary

- **Owner.** The whole-roadmap packet (68 nodes over CC.0–CC.8; it also imports the 12 nodes of the accepted CC.8 part) owns every target of CC.0–CC.7 listed below. The packet of this part records the correspondence as targetCoverage (49 targets) and imports (67 declarations read: 65 of the owner and 2 of the accepted CC.8 part).
- **New here.** Five declarations: CC.2/complete-torsion-free-complex-control, CC.3/finite-coefficient-model-of-completed-homology, CC.3/tame-level-completed-modules, CC.3/tame-level-borel-moore-duality and CC.4/completed-coefficient-interchange. None is a planet: they are supporting results, and the owner's six CC.3 planets already fill that layer.
- **Not closed.** Planned is not closed. The owner's gaps G1–G12 and its supplier requests remain open and remain the owner's; they are listed with each layer. Nothing is formalised.
- **Outside this part.** CC.8 is the accepted CC.8 part and the owner's three CC.8 endpoint nodes. Nakamura's coadmissible modules and Lemma B.16 (Appendix B.2.4) are routed to CompletedCohomologyAndLocalGlobalCompatibility:R31.4 with SmoothRepresentationsOfLocalGroups:SR.5, the owners of Corollary 2.5 and of the smooth representation theory it uses. Locally analytic vectors are LocallyAnalyticDistributions:L0. The analytic group theory and the general unitary Banach category are NoncommutativeAndEquivariantIwasawa:NE.0 and the extension of PadicMeasuresIwasawaAlgebras after L1, as the owner requests.
- **Assembly.** The queued assembly of this roadmap writes to the same reader and suggested file as the whole-roadmap job. It should start from the owner's reader and add the CC.8 part and the five declarations of this part, not rebuild the reader from the two parts (the packet's restructure entry).

## Conventions

The owner's conventions apply, and the declarations below use them. O is the ring of integers of a finite extension E of Q_p, with uniformizer varpi and finite residue field k; reductions are O/varpi^s for s ≥ 1. The tame level K^p is fixed unless stated otherwise. For cohomology the level colimit is taken before the coefficient limit: H̃^n = lim_s colim_K H^n(Y_K, O/varpi^s). Completed homology is the limit over levels under covering pushforward, not transfer, and Borel–Moore homology is the relative homology of the Borel–Serre pair. A left action on a module gives a right transpose action on its dual; the left contragredient uses g⁻¹, as Mathlib's Representation.dual does. Tame trace is unnormalised: trace after pullback along a cover of degree d is multiplication by d.

For the varying tame level of CC.3: Σ₀ is a finite set of finite places of F not above p, G_{Σ₀} is the product of the groups G(F_v) for v in Σ₀, and K^Σ is the level at the finite places outside Σ = Σ₀ ∪ {places above p}. A compact open subgroup has pro-order invertible in O when every finite index of an open subgroup in it is a unit of O (SR.0). For such a K⁰\_{Σ₀}, μ is the O-valued Haar measure on G_{Σ₀} with μ(K⁰\_{Σ₀}) = 1, so that μ(K) = [K⁰\_{Σ₀} : K]⁻¹ for open K ⊂ K⁰\_{Σ₀}; G_{Σ₀} is unimodular, so μ is invariant under conjugation. For a smooth O[G_{Σ₀}]-module V, e_K is the averaging projector onto V^K and Ṽ is the smooth contragredient, the smooth vectors of Hom_O(V, O) (SmoothRepresentationsOfLocalGroups SR.0, now also a TauCetiRoadmap roadmap, section SR.0.4).

## Sources

- Frank Calegari and Matthew Emerton, Completed cohomology — a survey. Author survey PDF; printed pp.1–20. https://math.uchicago.edu/~emerton/pdffiles/survey.pdf, read 2026-10-14. Read for this part: §1.1, definitions of completed homology and cohomology, p. 2; Theorem 1.1(1) and (3), pp. 3–4.
- Weibo Fu, Sharp bounds for multiplicities of Bianchi modular forms. arXiv:2201.11190v2; printed preprint pages; Annals 200 (2024). https://arxiv.org/pdf/2201.11190v2, read 2026-10-14. Read for this part: §1, equation (4), p. 3; §7, the displayed definition, the two bullets and (38), pp. 23–24.
- Kentaro Nakamura, Zeta morphisms for rank two universal deformations. arXiv:2006.13647, fetched 14 October 2026 (the same file as the owner's record); arXiv pages are cited, and the corresponding pages of the open-access version of record, Inventiones mathematicae 234 (2023), 171–290, SHA-256 47682f856244439d8cc3d3e6e0a4e1f804e6a710ec1a2dde8fad76f94aea20e4, are given in brackets. https://arxiv.org/pdf/2006.13647, read 2026-10-14. Read for this part: §2.3.1, arXiv pp. 20–22 (Inventiones pp. 191–192); §2.3.2, Lemma 2.4 and its proof, the Hecke normalisation, the projector and the tame-level isomorphism, arXiv pp. 22–24 (Inventiones pp. 192–195); §2.3.3 and Corollary 2.5, arXiv pp. 24–25 (Inventiones pp. 195–196), for the use only; Appendix B.2.4, Definitions B.13–B.15 and Lemma B.16, arXiv pp. 95–96, to place B.16.
- Lue Pan, On locally analytic vectors of the completed cohomology of modular curves. Forum of Mathematics, Pi 10 (2022), e7, 1–82, open-access version of record, doi:10.1017/fmp.2022.1; checked against arXiv:2008.07099v3 (8 July 2021), whose Lemma 4.4.4 is on p. 48. https://doi.org/10.1017/fmp.2022.1, read 2026-10-14. Read for this part: §4.4, Corollary 4.4.3, Lemma 4.4.4 with its proof and Remark 4.4.5, published pp. 43–44 (arXiv v3 pp. 47–48).
- Lue Pan, On locally analytic vectors of the completed cohomology of modular curves II. arXiv:2209.06366v1 (14 September 2022), the version CohomologyComparisons and PAPER-PAN-26 cite; published in Annals of Mathematics 203 (2026), not read. https://arxiv.org/pdf/2209.06366v1, read 2026-10-14. Read for this part: §7.2, the construction of the maps g_{k,m}, Lemmas 7.2.5 and 7.2.6 with their proofs, pp. 118–120.

The owner's further sources (Emerton's 2006 interpolation paper, Calegari–Emerton's bounds paper, Gee–Newton, Schneider–Teitelbaum, Marshall, Boxer–Pilloni, Le–Le Hung–Levin–Morra, Boxer–Calegari–Gee–Pilloni, Milne's notes, Emerton 2011) are recorded in its packet with their versions and the sections read; the imported declarations cite them there.

## Layer overview

| Layer | Targets | Owner's nodes cited | New here |
|---|---|---|---|
| CC.0 | 6 | 8 | 0 |
| CC.1 | 4 | 5 | 0 |
| CC.2 | 7 | 9 | 1 |
| CC.3 | 9 | 16 | 3 |
| CC.4 | 8 | 7 | 1 |
| CC.5 | 4 | 9 | 0 |
| CC.6 | 5 | 7 | 0 |
| CC.7 | 6 | 10 | 0 |

## CC.0. Finite-level towers and support data

Owner: `CompletedCohomologyPartII.json`, reader layer 0. Layer prerequisites in the atlas: `ArithmeticLocallySymmetricSpaces:ALS.0`, `ArithmeticLocallySymmetricSpaces:ALS.4`.

**Indexing category of levels, with cofinal normal and pro-p sequences.** Compact opens of the p-adic group ordered by inclusion, with labelled conjugation arrows and their composition law. A countable normal basis is taken inside a fixed compact open, and it can be chosen pro-p after passing to an open uniform subgroup, which NoncommutativeAndEquivariantIwasawa:NE.0 supplies (RT-AREA-automorphic-1/3).

Owned by `CC.0/arithmetic-level-index` (owner's reader §0.1).

**Finite covering correspondences, their composition identities and the conjugation maps.** One diagram of ordinary, compact-support and boundary complexes with pullback in the level and reduction in the exponent; trace is a separate reverse system. Identity and composition laws, compatibility with reduction, supports and tame Hecke operators. Same-lattice integral conjugation is restricted to H_int.

Owned by `CC.0/tower-axioms-and-the-standing-hypotheses` (owner's reader §0.2); `CC.0/conjugation-and-tame-coherence` (owner's reader §0.3).

**Levels with stabilisers: the stack or derived group-cohomology model, with torsion retained.** The ALS groupoid or derived group-cohomology model at a non-neat level, descent from a neat normal refinement by RΓ(Q, −) including Q-torsion. A neat cofinal tower does not remove the stabilisers of a fixed non-neat level.

Owned by `CC.0/non-neat-tower-realisation` (owner's reader §0.4).

**Compact support through compatible compactifications or the j! model, with trace maps.** Topologically, compact support is the ALS Borel–Serre model with proper pullback and trace. For Shimura varieties the j! model of a proper algebraic compactification is compared with it, naturally in finite étale level maps, together with the unnormalised trace and the orientation dictionary.

Owned by `CC.0/tower-axioms-and-the-standing-hypotheses` (owner's reader §0.2); `CC.0/finite-etale-betti-support-comparison` (owner's reader §0.6); `CC.0/finite-etale-trace-orientation-comparison` (owner's reader §0.7).

**Singular, cellular and étale finite-coefficient models compared under exact hypotheses.** Étale–Betti comparison for finite locally constant coefficients on neat characteristic-zero Shimura varieties, with compact support; the cellular–singular comparison is part of the lifted cellular tower of CC.4. Constructible-coefficient and compactification-independence proofs are the owner's gap G10.

Owned by `CC.0/finite-etale-betti-support-comparison` (owner's reader §0.6); `CC.0/finite-etale-trace-orientation-comparison` (owner's reader §0.7); `CC.4/lifted-cellular-tower` (owner's reader §4.1).

**Acceptance tests on actual towers.** Neat modular curves through ModularCurvesPartII:R14.3 and an anisotropic compact quotient: pullback, trace (trace after pullback is the degree), conjugation, supports and the cusp incidence diagram.

Owned by `CC.0/arithmetic-tower-tests` (owner's reader §0.5).

*Open items, all the owner's:* G1 analytic index supplier; G10 finite coefficient support comparison.

Named declarations, API and unit tests of this layer: the owner's. Layer coverage: planned; every target is cited to its owner or to this part.

## CC.1. Torsion colimits and the smooth group action

Owner: `CompletedCohomologyPartII.json`, reader layer 1. Layer prerequisites in the atlas: `CompletedCohomologyPartII:CC.0`, `SmoothRepresentationsOfLocalGroups:SR.0`.

**Filtered colimit at fixed exponent, in modules and in complexes; independence of cofinal restriction; exactness.** A^n_{\*,s} = colim_K H^n(C^\*\_{K,s}) for the three supports, the colimit of complexes, and the exact-colimit identification of their cohomology; cofinal restriction through the final-functor comparison.

Owned by `CC.1/fixed-exponent-smooth-colimit` (owner's reader §1.1).

**Action of the local group by conjugating levels; open stabilisers; smoothness.** Left action through the CC.0 conjugation dictionary; every class has an open stabiliser, so the action is smooth. For a fixed algebraic lattice only H_int acts integrally.

Owned by `CC.1/full-local-group-smooth-action` (owner's reader §1.2).

**Commuting tame Hecke operators from double correspondences, with explicit normalisation.** The ALS double-correspondence maps on the colimits and their complexes, commuting with the local action and obeying the convolution law; the completed Hecke algebra is the accepted CC.8 part's.

Owned by `CC.1/tame-hecke-on-colimits` (owner's reader §1.3).

**Mackey and restriction–corestriction identities with degree factors, never inverted integrally.** cor∘res is the index and res∘cor is the group sum for a normal subgroup, on the tower, the colimits and the descent diagrams; tame-level variation is a separate diagram whose interchange with completion needs its own comparison (see CC.3/tame-level-completed-modules).

Owned by `CC.1/restriction-corestriction-normalisation` (owner's reader §1.4); `CC.1/tame-level-variation` (owner's reader §1.5).

*Open items, all the owner's:* Import SR.0 smooth action; the arithmetic conjugation/Hecke checks remain required.

Named declarations, API and unit tests of this layer: the owner's. Layer coverage: planned; every target is cited to its owner or to this part.

## CC.2. Completion, derived inverse limits and topology

Owner: `CompletedCohomologyPartII.json`, reader layer 2. Layer prerequisites in the atlas: `ArithmeticGaloisDuality:D7`, `CompletedCohomologyPartII:CC.1`.

**Inverse system in the exponent and its topological limit; topology, separatedness, completeness.** H̃^n_\* = lim_s A^n_{\*,s} with the projection topology, compared with the varpi-adic topology, separated, complete and with bounded torsion only under the finite-cell admissible model.

Owned by `CC.2/coefficient-limit-completion` (owner's reader §2.1); `CC.2/adic-topology-and-continuous-actions` (owner's reader §2.5).

**Derived inverse limit of complexes and the Milnor sequence, with the lim¹ term displayed.** Rlim_s as the countable homotopy limit, distinct from H̃^n_\*, and the natural sequence 0 → lim¹ A^{n−1} → H^n(Rlim) → H̃^n → 0.

Owned by `CC.2/derived-completed-tower` (owner's reader §2.2); `CC.2/milnor-and-mittag-leffler-control` (owner's reader §2.3).

**Surjectivity and Mittag-Leffler criteria at each use.** Mittag-Leffler of cohomology (not only of terms) removes lim¹; integral admissible complexes give essentially-null kernel and cokernel systems.

Owned by `CC.2/milnor-and-mittag-leffler-control` (owner's reader §2.3); `CC.2/integral-admissible-complex-control` (owner's reader §2.4).

**Reduction of the completed module against the finite-coefficient module, under explicit torsion and control hypotheses, with counterexample tests.** The Bockstein sequence 0 → H̃^n/varpi^s → A^n_s → H̃^{n+1}[varpi^s] → 0 after integral control; the completion and Tate module of the integral colimit and the exact sequence relating them, with the counterexamples recorded in the owner's tests.

Owned by `CC.2/coefficient-bockstein-comparison` (owner's reader §2.8); `CC.2/completion-and-tate-module` (owner's reader §2.6); `CC.2/the-four-completed-modules-and-the-p-adic-completion-versus-tate-module-splitting` (owner's reader §2.7); `CC.2/integral-admissible-complex-control` (owner's reader §2.4).

**Unitary Banach module after inverting p.** Gauge norm of the torsion-free quotient lattice; full-group unitarity needs a stable lattice. The general unitary Banach and Schikhof category is requested from PadicMeasuresIwasawaAlgebras:L1 (RT-AREA-automorphic-1/17).

Owned by `CC.2/rational-unitary-banach-tower` (owner's reader §2.9).

**Continuity of the group and Hecke actions.** Joint continuity of the integral local action and continuity of the transported Hecke endomorphisms, from smoothness at each exponent and the topology comparison.

Owned by `CC.2/adic-topology-and-continuous-actions` (owner's reader §2.5).

**Control of complexes of complete torsion-free modules (Pan 2022, Lemma 4.4.4; requested by CohomologyComparisons for CP.6).** No divisible elements in cohomology, the Bockstein sequences with multiplication by varpi on the torsion terms and their vanishing limit, and completeness under bounded torsion; planned by this packet for any bounded-above complex, the owner's nodes giving the tower-specific forms.

Owned by `CC.2/complete-torsion-free-complex-control` (this part); `CC.2/coefficient-bockstein-comparison` (owner's reader §2.8); `CC.2/completion-and-tate-module` (owner's reader §2.6).

*Open items, all the owner's:* G2 integral strict control; R02.1 enhanced Rlim and L1 Banach foundations.

The declaration below is new. It is pure algebra over O, used by CC.4 below and requested by CohomologyComparisons.

### CC.2/complete-torsion-free-complex-control

**Control of complete torsion-free complexes** (theorem). Let M^• be a bounded-above complex of varpi-adically complete, varpi-torsion-free O-modules. Then (1) no H^i(M^•) has a nonzero varpi-divisible element: Hom_O(E, H^i(M^•)) = 0, hence its varpi-adic Tate module lim_n H^i(M^•)[varpi^n] (transitions multiplication by varpi) is zero; (2) for every n there is a natural exact sequence 0 → H^i(M^•)/varpi^n → H^i(M^•/varpi^n) → H^{i+1}(M^•)[varpi^n] → 0, and these sequences form an inverse system whose third terms have transition multiplication by varpi; (3) the induced map lim_n H^i(M^•)/varpi^n → lim_n H^i(M^•/varpi^n) is an isomorphism; (4) if moreover lim_n H^i(M^•/varpi^n) has bounded varpi-power torsion for every i, then H^i(M^•) → lim_n H^i(M^•)/varpi^n is also an isomorphism, so H^i(M^•) is varpi-adically complete and separated and equals lim_n H^i(M^•/varpi^n). The statement is for complete and torsion-free terms: for M = E in degree 0 the limit of H^0(M/varpi^n) is 0 while H^0(M) = E.

*Hypotheses.*

- O is the ring of integers of a finite extension E of Q_p, with uniformizer varpi and finite residue field k.
- M^• is bounded above; each M^i is varpi-adically complete and separated (IsAdicComplete for the ideal (varpi)) and varpi-torsion-free.
- Clause (4) also assumes that every lim_n H^i(M^•/varpi^n) has bounded varpi-power torsion.

**Acceptance.**

- M = O in degree 0: both limits are O.
- M = [O → O] in degrees 0, 1 with differential multiplication by varpi: H^0 = 0 and H^1 = O/varpi = k. H^0(M/varpi^n) = varpi^{n−1}O/varpi^n ≅ k is nonzero for every n, and the Bockstein sequence identifies it with H^1[varpi^n] = k, whose transitions are multiplication by varpi, hence zero: the limit of the H^0(M/varpi^n) is 0 = H^0(M).
- Completeness is needed: M = E in degree 0 is torsion-free but not complete, and E is varpi-divisible with lim_n E/varpi^n = 0 ≠ E.

*Proof route.*

1. Divisible elements: if x_n ∈ H^i(M) satisfy varpi x_n = x_{n−1} with x_0 ≠ 0, lift them to cocycles x̃\_n and choose y_n with d y_n = x̃\_{n−1} − varpi x̃\_n; the convergent sum y = Σ varpi^{n−1} y_n satisfies dy = x̃\_0, a contradiction. So Hom_O(E, H^i) = 0, and the Tate module, a submodule of Hom_O(E, H^i) by the sequence 0 → O → E → E/O → 0, vanishes.
2. Bockstein: M is varpi-torsion-free, so 0 → M → M → M/varpi^n → 0 (multiplication by varpi^n) is exact; its long exact sequence gives (2), and comparing n + 1 with n shows that the transition on the third terms is multiplication by varpi.
3. The third terms form a system with zero limit by (1). The first terms H^i/varpi^n have surjective transitions, so their lim¹ vanishes (ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one) and the limit of the exact sequences gives (3).
4. Completeness: H^i(M) is a quotient of the complete module of cocycles, so H^i(M) → lim H^i(M)/varpi^n is onto. If its kernel K were nonzero, bounded torsion (varpi^k kills the torsion of the limit) shows varpi K = K, which with (1) forces K = 0.

*Needs:* `ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one`, `mathlib:IsAdicComplete`.

*Used by:* CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit: Pan's bounded-torsion inverse-limit argument for A_inf-coefficient cohomology of the perfectoid modular curve applies this lemma to a Čech complex; the request to CC.2 asks for exactly this control. CompletedCohomologyPartII:CC.4/completed-coefficient-interchange: Identifies the completed tensor form of completed cohomology with arbitrary complete torsion-free coefficients.

*Sources:* Pan22, §4.4, Lemma 4.4.4 and its proof, Forum Math. Pi 10 (2022), e7, p. 44 (arXiv:2008.07099v3, p. 48): For a bounded-above complex of p-adically complete p-torsion-free modules whose mod-p^n cohomologies have limits with bounded torsion, cohomology is the limit of its reductions and the limit of the mod-p^n cohomologies; the proof shows there are no divisible elements, uses the universal-coefficient sequence with multiplication by p on the torsion terms, and concludes by a divisibility argument.

*Lean location (suggested):* `TauCeti/Arithmetic/CompletedCohomology/Layer2`, namespace `TauCeti.CompletedCohomology`.

Named declarations, API and unit tests of this layer: the one above; all others are the owner's. Layer coverage: planned; every target is cited to its owner or to this part.

## CC.3. Continuous duals and completed homology

Owner: `CompletedCohomologyPartII.json`, reader layer 3. Layer prerequisites in the atlas: `CompletedCohomologyPartII:CC.2`, `PadicMeasuresIwasawaAlgebras:L1`.

**Continuous O-linear and Pontryagin duals with their coefficient targets and topologies.** D_t into E/O with the discrete or compact topology and D_O into O with the uniform varpi-adic or pointwise compact topology; the transpose action is right-handed and inversion gives the left contragredient.

Owned by `CC.3/continuous-dual-conventions` (owner's reader §3.1).

**Dual of the smooth torsion colimit as a projective system; completed homology with its transfer direction.** Completed homology and Borel–Moore homology as limits under covering pushforward; at a residue field the duals of the torsion colimits are the finite-coefficient completed homology. This packet adds the comparison of H̃\_n with the double limit over exponent and level, which is Fu's model.

Owned by `CC.3/completed-homology-and-borel-moore` (owner's reader §3.3); `CC.3/finite-coefficient-duality-and-bockstein` (owner's reader §3.5); `CC.3/finite-coefficient-model-of-completed-homology` (this part).

**Module structure over O[[K_0]]; left modules distinguished from the opposite action of duality.** Tau Ceti's completedGroupAlgebra and IsCompactModule.completedGroupAlgebraModule (current library) give the left action; duals carry the transpose right action, converted by the inversion anti-isomorphism.

Owned by `CC.3/iwasawa-action-on-homology` (owner's reader §3.4); `CC.3/continuous-dual-conventions` (owner's reader §3.1).

**Biduality only in the compact–discrete or admissible category.** Biduality for compact modules that are limits of finite varpi-primary modules, for discrete torsion modules, and for torsion-free compact modules and complete torsion-free lattices; nothing for modules with torsion or other topologies.

Owned by `CC.3/qualified-biduality` (owner's reader §3.2); `CC.3/admissible-complex-convention` (owner's reader §3.8); `CC.3/admissible-perfect-anti-equivalence` (owner's reader §3.9).

**Compatibility with localisation and completion, without commuting duals with arbitrary base change.** Integral completed duality and its completion–Tate dual sequence; the mixed tensor duality for finite local coefficient algebras only; localisation at residual ideals in the accepted CC.8 part.

Owned by `CC.3/duality-between-completed-homology-and-completed-cohomology` (owner's reader §3.6); `CC.3/dual-completion-tate-sequence` (owner's reader §3.7); `CC.3/mixed-tensor-dual-comparison` (owner's reader §3.13); `CC.8/localisation-limit-support-dual-compatibility` (accepted CC.8 part).

**Completed Borel–Moore homology and its duality with compactly supported completed cohomology, at fixed and at varying tame level (Nakamura §2.3).** At fixed tame level, the compact-support and Borel–Moore case of the owner's duality (Nakamura, Lemma 2.4, once the torsion term vanishes). The colimit over tame levels and its identification with the smooth contragredient are planned by this packet's two nodes.

Owned by `CC.3/completed-homology-and-borel-moore` (owner's reader §3.3); `CC.3/duality-between-completed-homology-and-completed-cohomology` (owner's reader §3.6); `CC.3/tame-level-completed-modules` (this part); `CC.3/tame-level-borel-moore-duality` (this part).

**Coefficient-module duality and completed tensor products (Nakamura, Appendix B.1).** Definitions B.1–B.4 and Lemmas B.5–B.6 with Emerton's Appendices B–C as proofs.

Owned by `CC.3/orthonormalizable-and-profree-modules` (owner's reader §3.10); `CC.3/coefficient-module-duality` (owner's reader §3.11); `CC.3/mixed-completed-tensor` (owner's reader §3.12); `CC.3/mixed-tensor-dual-comparison` (owner's reader §3.13).

**Admissible complexes and their perfect duals (Boxer–Pilloni §1.4, §5.4).** Terms are finite direct summands of C(K_0, O)^{n_i} for a profinite K_0, free for pro-p K_0; degreewise continuous duality reverses amplitude; the completed tensor product is used; Λ acts by t ↦ [t]; transpose and contragredient structures are kept apart; the Serre adjoint carries the twist t ↦ w₀t⁻¹ (PAPER-BOXER-PILLONI-26/E7, E9, E110).

Owned by `CC.3/admissible-complex-convention` (owner's reader §3.8); `CC.3/admissible-perfect-anti-equivalence` (owner's reader §3.9).

**Pontryagin and Schikhof duals of the definite degree-zero tower (LLHLM §5.3).** The completed lattice is the CC.1/CC.2 carrier; its two duals use the CC.3 conventions; the unitary geometry stays in the accepted CC.8 part.

Owned by `CC.3/definite-degree-zero-dual-interface` (owner's reader §3.14); `CC.3/continuous-dual-conventions` (owner's reader §3.1); `CC.3/qualified-biduality` (owner's reader §3.2); `CC.8/definite-unitary-degree-zero` (accepted CC.8 part).

*Open items, all the owner's:* G3 continuous integral duality; G4 noncommutative tensor action; P7 coefficient completion extensions.

The three declarations below are new. They need the owner's fixed-level completed homology, its integral duality and the CC.1 tame variation, and SmoothRepresentationsOfLocalGroups SR.0 for smooth representations over O, averaging projectors and the smooth contragredient.

### CC.3/finite-coefficient-model-of-completed-homology

**Finite-coefficient model of completed homology** (comparison). Fix the tame level K^p, a compact open K_0 of the p-adic group with a countable basis of open normal subgroups U, and the neat finite-type tower Y_U with the finite free O-local system of CC.3/completed-homology-and-borel-moore. For every n the coefficient-reduction maps induce an O[[K_0]]-linear homeomorphism H̃\_n ≅ lim_s H̃\_{n,s}, where H̃\_{n,s} = lim_U H_n(Y_U, O/varpi^s); likewise H̃\_n^{BM} ≅ lim_s lim_U H_n^{BM}(Y_U, O/varpi^s). The isomorphisms commute with the support map H̃\_n → H̃\_n^{BM}, covering pushforward, conjugation and the transported tame Hecke maps. Consequently the rational completed homology of Fu, (lim_s lim_U H_n(Y_U, Z/p^s)) ⊗\_{Z_p} K for a finite extension K/Q_p, is K ⊗\_{Z_p} H̃\_n for O = Z_p: rationalisation is applied after both limits. It is not the limit lim_U H_n(Y_U, E) of rational finite-level homology: in the tower of connected degree-p covers of a circle the first is 0 and the second is E.

*Hypotheses.*

- O is the ring of integers of a finite extension E of Q_p, with uniformizer varpi and finite residue field k.
- Fixed tame level K^p; every Y_U is a neat finite level with the finite cellular model of ALS.1/finite-complex-model (relative cells of the Borel–Serre pair for Borel–Moore homology), so its homology with coefficients in a finite O-module is a finite O-module.
- The coefficient system is the finite free O-local system fixed in CC.3/completed-homology-and-borel-moore; for an algebraic lattice W_0 the integral local actions are those of H_int = Stab_H(W_0).
- Fu's instance: O = Z_p and the rationalisation is ⊗\_{Z_p} K for a finite extension K of Q_p.

**Acceptance.**

- Circle tower of connected degree-p covers: H̃\_{1,s} = lim(O/varpi^s ← O/varpi^s ← …) along multiplication by p is 0 for every s, H̃\_1 = 0, and the comparison is the zero isomorphism.
- Zero-dimensional regular tower Y_U = K_0/U: H̃\_{0,s} = (O/varpi^s)[[K_0]] and its limit over s is O[[K_0]] = H̃\_0, the owner's test regular_zero_homology.
- Non-example for commuting limits with rationalisation: in the circle tower E ⊗\_O H̃\_1 = 0 while lim_U H_1(Y_U, E) = E.
- At s = 1 the composite H̃\_n ≅ lim_s H̃\_{n,s} → H̃\_{n,k} is the reduction map of the Bockstein sequence of CC.3/finite-coefficient-duality-and-bockstein, with cokernel H̃\_{n−1}[varpi]; in the circle tower H̃\_{0,k} = k and H̃\_0 = O, consistent with H̃\_{−1} = 0.

*Proof route.*

1. At a fixed level U the cellular chain complex C_U is a bounded complex of finite free O-modules (ALS.1/finite-complex-model), and H_n(Y_U, O/varpi^s) = H_n(C_U/varpi^s) is a finite O-module; for Borel–Moore homology use the relative complex of the Borel–Serre pair.
2. For fixed n the systems s ↦ Z_n(C_U/varpi^s) and s ↦ B_n(C_U/varpi^s) consist of finite modules, so they are Mittag-Leffler and their lim¹ vanishes (ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one). So lim_s is exact on 0 → B_n → Z_n → H_n → 0 and on 0 → Z_n → C_n → B_{n−1} → 0, and lim_s H_n(C_U/varpi^s) = H_n(lim_s C_U/varpi^s) = H_n(C_U) since C_U is varpi-adically complete.
3. Coefficient reduction commutes with covering pushforward, so (U, s) ↦ H_n(Y_U, O/varpi^s) is a functor on a product of two directed sets and its limit may be taken in either order: lim_s lim_U H_n(Y_U, O/varpi^s) ≅ lim_U lim_s H_n(Y_U, O/varpi^s) = lim_U H_n(Y_U, O) = H̃\_n.
4. Both sides are compact Hausdorff, being limits of finite discrete modules, and the comparison is a continuous bijection, hence a homeomorphism. Deck transformations, supports and the transported Hecke correspondences commute with coefficient reduction, so the map is O[[K_0]]-linear for the action of CC.3/iwasawa-action-on-homology.
5. Rationalisation: K ⊗\_{Z_p} (−) is applied to the integral limit. In the tower of connected degree-p covers of a circle, pushforward on H_1(−, O) = O is multiplication by p, so H̃\_1 = 0, whereas lim(E ← E ← …) along multiplication by p is E because p is invertible in E.

*Needs:* `CC.3/completed-homology-and-borel-moore` (owner's reader §3.3), `CC.3/iwasawa-action-on-homology` (owner's reader §3.4), `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`, `ArithmeticGaloisDuality:R02.1/mittag-leffler-lim-one`.

*Used by:* Fu, §7, before (38), arXiv v2 p. 23: The finitely generated torsion Iwasawa module and the descent spectral sequence (38) are stated for this rational double-limit model; CC.5/semisimple-homology-torsion and CC.6/homological-hyperTor-descent prove them for H̃\_n, and this comparison transports them. CompletedCohomologyPartII:CC.3/finite-coefficient-duality-and-bockstein: The fixed-exponent modules H̃\_{n,s} are the ones that duality pairs with the fixed-exponent cohomology; this node says how they assemble to H̃\_n.

*Sources:* Fu, §1, equation (4), p. 3; §7, the displayed definition before (38), p. 23: Fu defines completed homology at a fixed tame level as the limit over the exponent s of the limit over p-levels of homology with Z/p^s coefficients, tensored afterwards with a finite extension K of Q_p, and quotes its finite generation over K[[G]] from Emerton and Calegari–Emerton. CE, §1.1, p. 2; Theorem 1.1(1), p. 3: Calegari and Emerton define completed homology as the limit over the tower of homology with Z_p coefficients, assuming each space has the homotopy type of a finite simplicial complex so that all these groups are finitely generated, and state that the projective-limit topology is the canonical one.

*Lean location (suggested):* `TauCeti/Arithmetic/CompletedCohomology/Layer3`, namespace `TauCeti.CompletedCohomology`.

### CC.3/tame-level-completed-modules

**Completed modules at varying tame level** (construction). Let Σ₀ be a finite set of finite places of F not above p, G_{Σ₀} = ∏\_{v∈Σ₀} G(F_v), and fix the level K^Σ at the finite places outside Σ = Σ₀ ∪ {places above p}. For a compact open K_{Σ₀} ⊂ G_{Σ₀} with K_{Σ₀}K^Σ neat, write H̃^n_c(K_{Σ₀}) for the completed compact-support cohomology (CC.2, support c) and H̃\_n^{BM}(K_{Σ₀}) for the completed Borel–Moore homology (CC.3) of the p-tower at tame level K_{Σ₀}K^Σ. For K'\_{Σ₀} ⊂ K_{Σ₀}, finite-cover pullback gives res: H̃^n_c(K_{Σ₀}) → H̃^n_c(K'\_{Σ₀}) and the finite-cover transfer gives tr: H̃\_n^{BM}(K_{Σ₀}) → H̃\_n^{BM}(K'\_{Σ₀}); both commute with the p-level and coefficient transitions. Define H̃^n_{c,Σ} = colim_{K_{Σ₀}} H̃^n_c(K_{Σ₀}) along res and H̃\_{n,Σ}^{BM} = colim_{K_{Σ₀}} H̃\_n^{BM}(K_{Σ₀}) along tr. Conjugation of tame levels gives each a smooth O-linear action of G_{Σ₀}, commuting with the action of the p-adic group at each tame level and with the tame Hecke operators at places outside Σ. The colimit is taken after completion in s; it is a different construction from the fixed-exponent tame colimit of CC.1/tame-level-variation, and the two are not identified here.

*Hypotheses.*

- O is the ring of integers of a finite extension E of Q_p, with uniformizer varpi and finite residue field k.
- Σ₀ is finite and contains no place above p; K^Σ is fixed; every tame level K_{Σ₀}K^Σ used is neat.
- For K'\_{Σ₀} normal in K_{Σ₀}, the cover at level K'\_{Σ₀}K^Σ over level K_{Σ₀}K^Σ is a finite Galois cover whose group is the effective quotient of K_{Σ₀}/K'\_{Σ₀}; its degree divides [K_{Σ₀} : K'\_{Σ₀}]. For Shimura quotients with infinite central units the owner verifies the effective deck group (its gap G12).
- The invariants statement requires K_{Σ₀} of pro-order invertible in O (SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/unit-pro-order).

*Provide.*

- `TameCompleted.ι` (constructor): Structure maps H̃^n_c(K_{Σ₀}) → H̃^n_{c,Σ} and H̃\_n^{BM}(K_{Σ₀}) → H̃\_{n,Σ}^{BM}, compatible with res and tr respectively.
- `TameCompleted.smooth` (characterisation): Every element of either colimit is fixed by a compact open subgroup of G_{Σ₀}; an element in the image of level K_{Σ₀} is fixed by K_{Σ₀}.
- `TameCompleted.invariants` (equivalence): For K_{Σ₀} of pro-order invertible in O, ι identifies H̃^n_c(K_{Σ₀}) with (H̃^n_{c,Σ})^{K_{Σ₀}} and H̃\_n^{BM}(K_{Σ₀}) with (H̃\_{n,Σ}^{BM})^{K_{Σ₀}}; in particular ι is injective.
- `TameCompleted.averaging_comp_ι` (compatibility): For K' ⊂ K of index invertible in O, e_K ∘ ι\_{K'} = ι\_K ∘ [K : K']⁻¹ cor on H̃^n_c(K'), with e_K the averaging projector of SR.0.
- `TameCompleted.equivariant` (functoriality): The G_{Σ₀}-action commutes with the action of the p-adic group at each tame level and with tame Hecke operators at places outside Σ.
- `TameCompleted.of_empty` (example): For Σ₀ = ∅ the structure maps are isomorphisms from the fixed-level modules.

**Checks.**

- `tameCompleted_empty` (degenerate): With Σ₀ empty, H̃^n_{c,Σ} = H̃^n_c(K^p) and H̃\_{n,Σ}^{BM} = H̃\_n^{BM}(K^p).
- `tameCompleted_points` (value): For levels Y(K) = K⁰/K of a profinite K⁰ of pro-order invertible in O with trivial p-tower, H̃^0_{c,Σ} = C^∞(K⁰, O) with translation action, and its K-invariants are the functions on K⁰/K; H̃\_{0,Σ}^{BM} = colim_K O[K⁰/K] along the maps sending a coset to the sum of the smaller cosets it contains.
- `tameCompleted_p_index` (non-example): For the connected degree-p cover of a circle, pullback on H^1(−, F_p) = F_p is zero; with a p-power index the transition is not injective and level invariants are not recovered.
- `tameCompleted_transfer_not_pushforward` (characterisation): For the connected double cover of a circle with p odd, transfer H_1(S^1, O) → H_1(S^1, O) is an isomorphism and pushforward after transfer is multiplication by 2; the Borel–Moore colimit uses transfer, not pushforward.

**Acceptance.**

- An element in the image of level K_{Σ₀} is fixed by every g ∈ K_{Σ₀}: conjugation by g maps level K_{Σ₀} to itself and acts there as the identity.
- For a finite group acting with invertible order, the averaging identity of TameCompleted.averaging_comp_ι is Tau Ceti's Representation.averageMap_eq_invOf_card_smul_norm (averageMap = ⅟|G| • norm).
- Pushforward after transfer is multiplication by the degree on the Borel–Moore side, and cor after res is multiplication by the degree on the cohomology side, at every exponent and after completion.

*Proof route.*

1. At each p-level and exponent, pullback and finite-cover transfer between tame levels are the ALS pullback and the finite-cover transfer of the AlgebraicTopology supplier; they commute with p-level pushforward and pullback and with coefficient reduction, so they pass to the completed modules of CC.2/coefficient-limit-completion and CC.3/completed-homology-and-borel-moore.
2. Form the two filtered colimits in O-modules. Conjugation by g ∈ G_{Σ₀} carries level K_{Σ₀} to gK_{Σ₀}g⁻¹ and commutes with res and tr, so G_{Σ₀} acts; a class coming from level K_{Σ₀} is fixed by K_{Σ₀}, so the action is smooth (SR.0:abelian-category/smooth-rep-category).
3. For K' normal in K of index invertible in O: cor∘res is multiplication by the degree and res∘cor is the group sum over the deck group (CC.1/restriction-corestriction-normalisation, applied at every exponent and passed to the limit). Hence res is injective with image the invariants, and the averaging projector e_K of SR.0 satisfies e_K∘ι\_{K'} = ι\_K∘[K : K']⁻¹ cor; the finite form of this identity is Tau Ceti's Representation.averageMap_eq_invOf_card_smul_norm. The Borel–Moore side is the same with tr and pushforward exchanged.
4. Invariants commute with filtered colimits of smooth modules when e_K exists, which gives (H̃^n_{c,Σ})^{K} = H̃^n_c(K) and the Borel–Moore analogue.

*Needs:* `CC.2/coefficient-limit-completion` (owner's reader §2.1), `CC.3/completed-homology-and-borel-moore` (owner's reader §3.3), `CC.1/tame-level-variation` (owner's reader §1.5), `CC.1/restriction-corestriction-normalisation` (owner's reader §1.4), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-rep-category`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/unit-pro-order`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/averaging-projector`, `tauceti:Representation.averageMap_eq_invOf_card_smul_norm`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

*Used by:* Nakamura, §2.3.1, arXiv p. 22 (Inventiones 234, p. 192): The completed Borel–Moore homology of modular curves at tame level Σ₀ is the colimit of the fixed-tame-level modules along restriction, with its smooth action of G_{Σ₀}; restriction there is the Poincaré dual of the transfer used here. Nakamura, §2.3.2, arXiv pp. 23–24 (Inventiones 234, pp. 194–195): The compactly supported completed cohomology at tame level Σ₀ has K_{Σ₀}-invariants equal to the fixed-level module, and the projector restricted to a smaller level is the normalised trace. CompletedCohomologyPartII:CC.3/tame-level-borel-moore-duality: Both colimits, the invariants identification and the projector formula are the inputs of the tame-level duality. CompletedCohomologyAndLocalGlobalCompatibility:R31.4 (Nakamura, Corollary 2.5, through PAPER-NAKAMURA-23/12): The residual-localised Borel–Moore module at tame level Σ₀ is built from this colimit.

*Sources:* Nakamura, §2.3.1, arXiv p. 22 (Inventiones 234, p. 192): The completed Borel–Moore homology at tame level Σ₀ is defined as the direct limit over compact opens of G_{Σ₀} of the fixed-level modules along restriction maps, and carries a smooth action of G_{Σ₀}. Nakamura, §2.3.2, arXiv pp. 23–24 (Inventiones 234, pp. 194–195): For a compact open of pro-order prime to p, the projector onto invariants is defined with the normalised Haar measure; the invariants of the tame-level compactly supported completed cohomology are the fixed-level module, and the projector restricted to a smaller level is the corestriction divided by the index.

*Lean location (suggested):* `TauCeti/Arithmetic/CompletedCohomology/Layer3`, namespace `TauCeti.CompletedCohomology`.

### CC.3/tame-level-borel-moore-duality

**Tame-level Borel–Moore duality** (theorem). In the setting of CC.3/tame-level-completed-modules, fix a compact open K⁰\_{Σ₀} ⊂ G_{Σ₀} of pro-order invertible in O, the O-valued Haar measure μ on G_{Σ₀} with μ(K⁰\_{Σ₀}) = 1, and a degree n. Suppose that H̃^{n+1}\_c(K_{Σ₀})[varpi^∞] = 0 for every open K_{Σ₀} ⊂ K⁰\_{Σ₀}, so that by the compact-support and Borel–Moore case of CC.3/duality-between-completed-homology-and-completed-cohomology the evaluation map h_{K_{Σ₀}}: H̃\_n^{BM}(K_{Σ₀}) → Hom_O(H̃^n_c(K_{Σ₀}), O) is a homeomorphism of compact O-modules. Put V = H̃^n_{c,Σ}. Then the maps μ(K_{Σ₀})·h_{K_{Σ₀}}, followed by the identification Hom_O(V^{K_{Σ₀}}, O) ≅ (Ṽ)^{K_{Σ₀}}, λ ↦ λ∘e_{K_{Σ₀}}, of SR.0, are compatible with the transfer transitions, and induce an O-linear isomorphism H̃\_{n,Σ}^{BM} ≅ Ṽ onto the smooth contragredient of V. It restricts at each K_{Σ₀} to a homeomorphism H̃\_n^{BM}(K_{Σ₀}) ≅ (Ṽ)^{K_{Σ₀}}, and it is equivariant for G_{Σ₀}, for the p-adic group with the contragredient convention of CC.3/continuous-dual-conventions, and for each tame Hecke correspondence at places outside Σ, which acts on Borel–Moore homology by the transposed correspondence. Without the torsion hypothesis h_{K_{Σ₀}} has kernel Hom_O(H̃^{n+1}\_c(K_{Σ₀})[varpi^∞], E/O) and no isomorphism is asserted.

*Hypotheses.*

- O is the ring of integers of a finite extension E of Q_p, with uniformizer varpi and finite residue field k.
- The hypotheses of CC.3/tame-level-completed-modules, with K⁰\_{Σ₀}K^Σ neat; for GL₂ one may take K⁰\_{Σ₀} = ∏\_{l∈Σ₀}(1 + l M₂(Z_l)), which is pro-l at each l ∈ Σ₀.
- G_{Σ₀} is unimodular (a product of groups of points of reductive groups), so μ(gKg⁻¹) = μ(K).
- H̃^{n+1}\_c(K_{Σ₀})[varpi^∞] = 0 for all open K_{Σ₀} ⊂ K⁰\_{Σ₀}. For modular curves and n = 1 this holds because the completed H^2_c vanishes, the result of Emerton that Nakamura cites in the proof of his Lemma 2.4.

**Acceptance.**

- Zero-dimensional example of CC.3/tame-level-completed-modules: the isomorphism sends the coset gK to the functional f ↦ ∫\_{gK} f dμ on C^∞(K⁰, O). Without the factor μ(K) the maps fail to commute with transfer by the factor [K : K'].
- Modular curves, n = 1: the isomorphism is Nakamura's identification of H̃\_{1,Σ}^{BM} with the smooth contragredient of Ĥ¹\_{c,Σ}; its Galois equivariance uses the Galois action transported by the accepted CC.8 adapter.
- If H̃^{n+1}\_c(K)[varpi^∞] ≠ 0, the kernel Hom_O(H̃^{n+1}\_c(K)[varpi^∞], E/O) of h_K is nonzero.
- With K⁰ = GL₂(Z_l) and p dividing |GL₂(F_l)| the normalisation μ(K) is not defined in O; first pass to a pro-l open subgroup.

*Proof route.*

1. Fixed tame level: the compact-support and Borel–Moore case of the owner's integral duality gives 0 → Hom_O(H̃^{n+1}\_c[varpi^∞], E/O) → H̃\_n^{BM} → Hom_O(H̃^n_c, O) → 0. Under the hypothesis h_K is a continuous bijection of compact Hausdorff modules, hence a homeomorphism (Nakamura, Lemma 2.4, for the modular curve).
2. Transitions: for K' ⊂ K ⊂ K⁰, transfer on Borel–Moore homology is adjoint under evaluation to the trace (corestriction) on compact-support cohomology (ALS.3/level-trace). With e_K∘ι\_{K'} = ι\_K∘[K : K']⁻¹ cor (TameCompleted.averaging_comp_ι) and μ(K') = [K : K']⁻¹ μ(K), the square formed by μ(K)h_K, λ ↦ λ∘e_K, transfer and μ(K')h_{K'} commutes. This is Nakamura's second diagram in §2.3.2, whose lower row lands in Hom_O(Ĥ¹\_c(K'\_{Σ₀}), O) (PAPER-NAKAMURA-23/E3).
3. SR.0 smooth-dual (3) identifies Hom_O(V^K, O) with (Ṽ)^K for K of pro-order invertible in O, and TameCompleted.invariants gives V^K = H̃^n_c(K); these identifications are compatible with the inclusions (Ṽ)^K ⊂ (Ṽ)^{K'}.
4. Pass to the colimit over the cofinal family of open K ⊂ K⁰: every vector of Ṽ is fixed by some such K, so the union of the (Ṽ)^K is Ṽ, and the colimit of H̃\_n^{BM}(K) along transfer is H̃\_{n,Σ}^{BM}.
5. Equivariance: conjugation by g carries μ(K)h_K to μ(gKg⁻¹)h_{gKg⁻¹} because μ is conjugation invariant; the p-adic group acts through the contragredient convention; a Hecke correspondence acts on homology by its transpose, for which evaluation is invariant (CC.1/tame-hecke-on-colimits). In Nakamura's cohomological model of H̃\_1^{BM} through Poincaré duality this transposed action is T'\_l = T_l S_l⁻¹, S'\_l = S_l⁻¹.

*Needs:* `CC.3/tame-level-completed-modules` (this part), `CC.3/duality-between-completed-homology-and-completed-cohomology` (owner's reader §3.6), `CC.3/continuous-dual-conventions` (owner's reader §3.1), `CC.1/tame-hecke-on-colimits` (owner's reader §1.3), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/averaging-projector`, `SmoothRepresentationsOfLocalGroups:SR.1/a-valued-haar-measure`, `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`.

*Used by:* Nakamura, §2.3.3 and Corollary 2.5, arXiv p. 25 (Inventiones 234, pp. 195–196): The residual-localised completed Borel–Moore homology at tame level Σ₀ is identified with the smooth contragredient of completed cohomology, the starting point of the zeta morphisms; that corollary is routed to CompletedCohomologyAndLocalGlobalCompatibility:R31.4.

*Sources:* Nakamura, §2.3.2, Lemma 2.4 and its proof, arXiv p. 22 (Inventiones 234, p. 193): At a fixed tame level the evaluation map from completed Borel–Moore homology to the O-dual of compactly supported completed cohomology is a topological isomorphism, because the Calegari–Emerton sequence has a torsion term that vanishes since the completed H^2_c is zero. Nakamura, §2.3.2, arXiv p. 23 (Inventiones 234, p. 193): Hecke operators on the Borel–Moore side are normalised as T'\_l = T_l S_l⁻¹ and S'\_l = S_l⁻¹ so that the duality map is Hecke-linear. Nakamura, §2.3.2, arXiv pp. 23–24 (Inventiones 234, pp. 194–195): With a compact open of pro-order prime to p and the normalised Haar measure, the normalised fixed-level duality maps composed with the projector identification assemble into a Hecke- and group-equivariant topological isomorphism from the tame-level Borel–Moore homology to the smooth contragredient of the tame-level compactly supported completed cohomology. CE, Theorem 1.1(3), second sequence, p. 3: Completed homology maps onto the O-dual of completed cohomology with kernel the E/O-dual of the torsion of the next completed cohomology group, with Borel–Moore and compact-support variants.

*Lean location (suggested):* `TauCeti/Arithmetic/CompletedCohomology/Layer3`, namespace `TauCeti.CompletedCohomology`.

Named declarations, API and unit tests of this layer: the three above; all others are the owner's. Layer coverage: planned; every target is cited to its owner or to this part.

## CC.4. Finite-level chain models and the completed tower complex

Owner: `CompletedCohomologyPartII.json`, reader layer 4. Layer prerequisites in the atlas: `ArithmeticLocallySymmetricSpaces:ALS.3`, `ArithmeticLocallySymmetricSpaces:ALS.4`, `CompletedCohomologyPartII:CC.0`, `CompletedCohomologyPartII:CC.3`, `DeformationAndDerivedPatchingAlgebra:P7`.

**Cellular complexes on finite CW or Borel–Serre models; equivariant lifted cell complexes on a cofinal torsion-free tower.** A finite CW pair from the neat ALS Borel–Serre model, lifted cell by cell through a regular covering tower, giving bounded finite free O[K_0/U_r]-complexes with quotient transitions.

Owned by `CC.4/lifted-cellular-tower` (owner's reader §4.1).

**Comparison with singular and étale cochains; compatibility of refinement maps.** Homotopy-coherent cellular–singular comparisons compatible with supports, coefficients and Hecke maps; the étale side through the CC.0 comparison.

Owned by `CC.4/lifted-cellular-tower` (owner's reader §4.1); `CC.0/finite-etale-betti-support-comparison` (owner's reader §0.6).

**Bounded complexes of finite free or projective O[[K_0]]-modules, for a finite-cell compact quotient and compact p-adic analytic K_0.** Terms Λ^{c_i d} with the limit of the attaching matrices; perfect, finite free in the lifted model, finite projective after prime-to-p descent.

Owned by `CC.4/completed-equivariant-cell-complex` (owner's reader §4.2); `CC.4/perfectness-and-cochain-comparison` (owner's reader §4.3).

**A finite projective complex kept distinct from projectivity of its homology.** The degree bounds are cell bounds; no projective homology or concentration is asserted.

Owned by `CC.4/perfectness-and-cochain-comparison` (owner's reader §4.3).

**Replacements for torsion stabilisers and noncompact spaces, with boundary chains preserved.** Induced derived stabiliser complexes, a finite projective model only under a uniform bound or invertible stabiliser orders; the compact Borel–Serre pair with relative chains for Borel–Moore homology.

Owned by `CC.4/stabilizers-and-boundary-replacements` (owner's reader §4.5).

**Derived finite-level coinvariants recover the finite-level complex.** (O/varpi^s)[K_0/U] ⊗ᴸ\_Λ 𝒫 ≅ C_•(Z_U, O/varpi^s), naturally; underived coinvariants of homology are not a substitute.

Owned by `CC.4/derived-finite-level-coinvariants` (owner's reader §4.4).

**Patched perfect model (finite-level perfect-complex route of RT-AREA-automorphic-1/18).** Gee–Newton Proposition 3.4.16 imported through DeformationAndDerivedPatchingAlgebra:P8; never used as perfectness of an unpatched tower.

Owned by `CC.4/patched-perfect-model-import` (owner's reader §4.6).

**Integral cochain model and completed coefficients (Pan II, Lemma 7.2.6; requested by CohomologyComparisons for CP.6).** The complete torsion-free cochain complex with H^i = H̃^i and mod-varpi^m cohomology A^i_m, and completed cohomology with complete torsion-free coefficients M as lim_m (A^i_m ⊗ M); planned by this packet on the owner's admissible cochain model.

Owned by `CC.4/completed-coefficient-interchange` (this part); `CC.4/perfectness-and-cochain-comparison` (owner's reader §4.3).

*Open items, all the owner's:* G2/G3 chain/cochain comparison; P7/P8 noncommutative perfect and patched extensions.

The declaration below is new. It rests on the owner's completed chain complex and admissible cochain model and on the CC.2 control lemma above.

### CC.4/completed-coefficient-interchange

**Integral cochain model and completed coefficients** (theorem). For the lifted finite-cell tower of CC.4 at fixed tame level, let S̃^• be its integral admissible cochain model, the termwise continuous O-dual of the completed chain complex 𝒫 (CC.4/perfectness-and-cochain-comparison). Then S̃^• is a bounded complex of varpi-adically complete, varpi-torsion-free O-modules, with natural isomorphisms H^i(S̃) ≅ H̃^i and H^i(S̃/varpi^m) ≅ A^i_m, where A^i_m = colim_U H^i(Y_U, O/varpi^m), compatible with tower transitions, the integral local action and the transported Hecke maps; the same holds for the compact-support and boundary models. For every varpi-adically complete, varpi-torsion-free O-module M, with trivial action on the tower, the completed cohomology with coefficients M, H̃^i(M) = lim_m colim_U H^i(Y_U, M/varpi^m), is naturally isomorphic to lim_m (A^i_m ⊗\_O M). If the varpi-power torsion of H̃^{i+1} is bounded, as CC.5/bounded-integral-torsion proves for this tower, H̃^i(M) is moreover the varpi-adic completion of H̃^i ⊗\_O M.

*Hypotheses.*

- O is the ring of integers of a finite extension E of Q_p, with uniformizer varpi and finite residue field k.
- The hypotheses of CC.4/completed-equivariant-cell-complex and CC.4/perfectness-and-cochain-comparison: a lifted finite-cell regular tower over a compact p-adic analytic K_0, at fixed tame level.
- M is varpi-adically complete, separated and varpi-torsion-free, and the tower acts trivially on it; any further action on M (for example a Galois action on A_inf-type coefficients) is carried along by naturality.
- The completed-tensor clause assumes that varpi^c kills the varpi-power torsion of H̃^{i+1} for some c.

**Acceptance.**

- M = O: the coefficient formula is lim_m A^i_m = H̃^i, the owner's definition.
- M = O[[T]] (complete and torsion-free, not finitely generated over O): when H̃^{i+1} has bounded torsion, H̃^i(O[[T]]) is the module H̃^i[[T]] of power series with coefficients in H̃^i.
- Circle tower of connected degree-p covers: A^0_m = O/varpi^m and A^1_m = 0 (pullback is multiplication by p on H^1), so H̃^0(M) = M and H̃^1(M) = 0 for every complete torsion-free M.

*Proof route.*

1. Terms: 𝒫\_i = Λ^{c_i d}, so S̃^i = Hom_cont,O(𝒫\_i, O) = C(K_0, O)^{c_i d}, varpi-adically complete and torsion-free (finite projective summands in the descended model).
2. Reductions: continuous maps into the discrete O/varpi^m factor through finite levels, so S̃/varpi^m = colim_U Hom_O(𝒫 ⊗\_Λ (O/varpi^m)[K_0/U], O/varpi^m) = colim_U C^•(Z_U, O/varpi^m) by CC.4/derived-finite-level-coinvariants (underived, as 𝒫 is finite projective); exactness of filtered colimits (CC.1/fixed-exponent-smooth-colimit) gives H^i(S̃/varpi^m) ≅ A^i_m.
3. Integral cohomology: CC.2/integral-admissible-complex-control gives H^i(S̃) ≅ lim_m H^i(S̃/varpi^m) = H̃^i, naturally for the transitions and actions of the owner's CC.4 comparison.
4. Coefficients: M/varpi^m is flat over O/varpi^m because M is torsion-free, so colim_U C^•(Z_U, M/varpi^m) = (S̃/varpi^m) ⊗\_{O/varpi^m} M/varpi^m and its cohomology is A^i_m ⊗\_O M; take the limit over m.
5. Completed tensor: tensoring the Bockstein sequences of CC.2/complete-torsion-free-complex-control for S̃ with the flat M/varpi^m gives 0 → (H̃^i ⊗ M)/varpi^m → A^i_m ⊗ M → H̃^{i+1}[varpi^m] ⊗ M → 0. With varpi^c killing the torsion, c consecutive transitions of the third terms vanish, so their limit and lim¹ are zero and the limit of the middle terms is the completion of H̃^i ⊗\_O M.

*Needs:* `CC.4/perfectness-and-cochain-comparison` (owner's reader §4.3), `CC.4/derived-finite-level-coinvariants` (owner's reader §4.4), `CC.4/completed-equivariant-cell-complex` (owner's reader §4.2), `CC.2/integral-admissible-complex-control` (owner's reader §2.4), `CC.1/fixed-exponent-smooth-colimit` (owner's reader §1.1), `CC.2/complete-torsion-free-complex-control` (this part).

*Used by:* CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent: Pan's identification of completed cohomology with A_inf/(ker θ)^k coefficients is the case M = A_inf/(ker θ)^k of the coefficient formula; the request to CC.4 asks for this complex and this interchange. Pan, On locally analytic vectors II, Lemma 7.2.6, arXiv v1 p. 120: The stronger form for every p-adically complete torsion-free coefficient module.

*Sources:* PanII, §7.2, Lemma 7.2.6(1) and its proof, arXiv:2209.06366v1, p. 120: Completed cohomology with coefficients in a p-adically complete torsion-free module is the limit over m of the mod-p^m completed cohomology tensored with the module; the proof uses a complex of complete torsion-free modules computing completed cohomology and its reductions (attributed to Emerton), the universal-coefficient sequences and multiplication by p on the torsion terms.

*Lean location (suggested):* `TauCeti/Arithmetic/CompletedCohomology/Layer4`, namespace `TauCeti.CompletedCohomology`.

Named declarations, API and unit tests of this layer: the one above; all others are the owner's. Layer coverage: planned; every target is cited to its owner or to this part.

## CC.5. Noetherian finiteness and admissibility

Owner: `CompletedCohomologyPartII.json`, reader layer 5. Layer prerequisites in the atlas: `CompletedCohomologyPartII:CC.3`, `CompletedCohomologyPartII:CC.4`, `PadicMeasuresIwasawaAlgebras:L1`.

**Finite generation of completed homology over the noetherian completed group algebra.** Finitely generated left O[[K_0]]-modules with the canonical topology, for compact p-adic analytic K_0, using NE.0's noetherianity (RT-AREA-automorphic-1/3); not freeness or concentration.

Owned by `CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology` (owner's reader §5.1).

**Dual admissibility criterion; admissibility in the torsion and unitary Banach categories.** Smooth admissible duals of finitely generated k[[K_0]]-modules; admissible unitary Banach completed cohomology through the general Schneider–Teitelbaum category requested after L1 (RT-AREA-automorphic-1/17).

Owned by `CC.5/smooth-dual-admissibility` (owner's reader §5.3); `CC.5/banach-admissibility` (owner's reader §5.4).

**Explicit finite-generation, separatedness and finiteness-of-invariants hypotheses.** Bounded varpi-power torsion and complete torsion-free quotients for the actual finite-cell tower; no statement for arbitrary profinite groups, towers or coefficient rings.

Owned by `CC.5/bounded-integral-torsion` (owner's reader §5.2); `CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology` (owner's reader §5.1).

**Iwasawa dimension, codimension and the torsion theorem for completed homology.** Grade and canonical dimension imported from NE.0 (Venjakob, RT-AREA-automorphic-1/3); torsion of H̃\_n without discrete series or outside the middle degree, Fu's first bullet in §7.

Owned by `CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem` (owner's reader §5.5); `CC.5/semisimple-homology-torsion` (owner's reader §5.7); `CC.5/normalized-classical-growth` (owner's reader §5.6); `CC.5/uniform-filtration-growth` (owner's reader §5.8); `CC.5/classical-middle-rank-and-tate-torsion` (owner's reader §5.9).

*Open items, all the owner's:* G1 analytic/Auslander foundations; G5 classical multiplicity leaves and regular-filtration leading-rank input.

Named declarations, API and unit tests of this layer: the owner's. Layer coverage: planned; every target is cited to its owner or to this part.

## CC.6. Descent and classical comparison

Owner: `CompletedCohomologyPartII.json`, reader layer 6. Layer prerequisites in the atlas: `ArithmeticGaloisDuality:D7`, `CompletedCohomologyPartII:CC.5`.

**Continuous Hochschild–Serre (descent) spectral sequence with its edge maps.** H^i_cts(U, H̃^j) ⇒ H^{i+j}(Y_U, O) in the integral admissible category, and the fixed-exponent version; Milnor errors kept for a general tower.

Owned by `CC.6/hochschild-serre-descent-to-finite-level` (owner's reader §6.1); `CC.6/fixed-exponent-descent` (owner's reader §6.2).

**Derived-invariants formulation and Hecke functoriality.** Derived descent model, functorial for supports and Hecke maps; edge isomorphism only in the lowest nonvanishing degree.

Owned by `CC.6/hochschild-serre-descent-to-finite-level` (owner's reader §6.1); `CC.6/lowest-degree-recovery` (owner's reader §6.6).

**Classical comparison maps for algebraic coefficients through finite-level evaluation, with hypotheses and degree ranges.** Untwisting by a K_0-stable lattice, the edge map to invariants of H̃^n(E) ⊗ W, and its kernel and cokernel controlled by the spectral sequence.

Owned by `CC.6/algebraic-coefficient-untwisting` (owner's reader §6.4); `CC.6/classical-evaluation-map` (owner's reader §6.5); `CC.6/lowest-degree-recovery` (owner's reader §6.6).

**Homological hyper-Tor descent with algebraic coefficients (Fu, (38)).** O ⊗ᴸ\_{O[[U]]} (𝒫 ⊗ W_0) ≅ C_•(Y_U, W_0) and the completed Tor spectral sequence; Fu's rational form through CC.3/finite-coefficient-model-of-completed-homology.

Owned by `CC.6/homological-hyperTor-descent` (owner's reader §6.3).

**Derived locally analytic comparison; locally algebraic vectors only through R31.** BCGP Theorem 4.8.3 as the derived comparison, with the derived functors from LocallyAnalyticDistributions:L0 (owner's gap G6); no recovery of every classical form from degree-zero invariants.

Owned by `CC.6/analytic-classical-comparison` (owner's reader §6.7).

*Open items, all the owner's:* G2 strict descent control; G6 derived analytic comparison; D7 continuous coefficient contract.

Named declarations, API and unit tests of this layer: the owner's. Layer coverage: planned; every target is cited to its owner or to this part.

## CC.7. Compact-support and boundary triangles

Owner: `CompletedCohomologyPartII.json`, reader layer 7. Layer prerequisites in the atlas: `ArithmeticLocallySymmetricSpaces:ALS.4`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`, `CompletedCohomologyPartII:CC.4`.

**The support triangle passed through the derived tower, with exactness and connecting morphisms.** RΓ̃\_c → RΓ̃ → RΓ̃\_∂ → RΓ̃\_c[1], equivariant for all actions.

Owned by `CC.7/derived-completed-support-triangle` (owner's reader §7.1).

**Derived limits against conventional completed cohomology, with lim¹ and torsion errors.** Conventional long exact sequence under strict admissible control or vanishing lim¹; otherwise the derived sequence with its Milnor errors.

Owned by `CC.7/boundary-long-exact-sequences-and-the-borel-serre-tower` (owner's reader §7.2); `CC.2/milnor-and-mittag-leffler-control` (owner's reader §2.3).

**Completed interior cohomology as the specified image, each comparison proved separately.** The image of H̃\_c → H̃ and the limit of the finite images, compared through lim¹ of the kernel system.

Owned by `CC.7/completed-interior-image` (owner's reader §7.4); `CC.7/interior-image-comparison` (owner's reader §7.5).

**Localisation-compatible triangles exported to ALS.6 and TC.2.** The derived triangle commutes with the local and Hecke actions; residual localisation is the accepted CC.8 part's.

Owned by `CC.7/derived-completed-support-triangle` (owner's reader §7.1); `CC.8/localisation-limit-support-dual-compatibility` (accepted CC.8 part).

**Boundary vanishing, Igusa concentration and compactification geometry kept as arithmetic inputs.** Only the implication from a residual projector killing the boundary to a quasi-isomorphism is generic (the interface for BCGP Theorem 4.9.4); the boundary strata keep Levi cohomology and parabolic induction (owner's gap G8).

Owned by `CC.7/boundary-vanishing-support-comparison` (owner's reader §7.8); `CC.7/boundary-strata-and-completed-induction` (owner's reader §7.7).

**Homological support sequence and completed Poincaré duality.** The relative chain triangle of the compact completed models and the Ext spectral sequence from the chain-level pairing (owner's gap G7).

Owned by `CC.7/completed-homological-support-sequence` (owner's reader §7.3); `CC.7/completed-iwasawa-poincare-duality` (owner's reader §7.6).

*Open items, all the owner's:* G7 arithmetic Iwasawa chain pairing; G8 boundary nilpotent calculation; kernel-system control for interior image.

Named declarations, API and unit tests of this layer: the owner's. Layer coverage: planned; every target is cited to its owner or to this part.

## Added sources

Each item of the five papers the maintainer added to these layers, with the declarations that plan it.

**PAPER-FU-24** (CC.3, CC.4, CC.5, CC.6). Planned by the owner, except the identification of Fu's double-limit rational model (4) with the owner's completed homology, which this packet plans as CC.3/finite-coefficient-model-of-completed-homology.

- `PAPER-FU-24/completed-homology`: `CC.3/completed-homology-and-borel-moore` (owner's reader §3.3); `CC.3/finite-coefficient-model-of-completed-homology` (this part).
- `PAPER-FU-24/completed-homology-finite-generation`: `CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology` (owner's reader §5.1).
- `PAPER-FU-24/completed-homology-torsion`: `CC.5/semisimple-homology-torsion` (owner's reader §5.7); `CC.5/normalized-classical-growth` (owner's reader §5.6); `CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem` (owner's reader §5.5).
- `PAPER-FU-24/completed-descent-spectral-sequence`: `CC.4/completed-equivariant-cell-complex` (owner's reader §4.2); `CC.4/derived-finite-level-coinvariants` (owner's reader §4.4); `CC.6/hochschild-serre-descent-to-finite-level` (owner's reader §6.1); `CC.6/fixed-exponent-descent` (owner's reader §6.2).
- `PAPER-FU-24/homological-descent-comparison`: `CC.6/homological-hyperTor-descent` (owner's reader §6.3).

**PAPER-BOXER-PILLONI-26** (CC.3). Planned by the owner for a profinite K_0 with T′(Z_p) and T(Z_p) as instances: summands of C(K_0, O)^{n_i} for a general profinite group, free terms for pro-p groups, completed tensor, the action t ↦ [t], transpose versus contragredient structures, and the Serre twist t ↦ w₀t⁻¹. The noncommutative completed-tensor verification is the owner's gap G4.

- `PAPER-BOXER-PILLONI-26/admissible-complex`: `CC.3/admissible-complex-convention` (owner's reader §3.8).
- `PAPER-BOXER-PILLONI-26/admissible-perfect-anti-equivalence`: `CC.3/admissible-perfect-anti-equivalence` (owner's reader §3.9).
- `PAPER-BOXER-PILLONI-26/dual-of-admissible-complex-is-perfect`: `CC.3/admissible-complex-convention` (owner's reader §3.8); `CC.3/admissible-perfect-anti-equivalence` (owner's reader §3.9).

**PAPER-NAKAMURA-23** (CC.3). Fixed-level Borel–Moore homology, its compact-support duality and Appendix B.1 are planned by the owner. The tame-level colimit of item 10 and the smooth-contragredient isomorphism of item 11 are planned by this packet. Lemma B.16 in item 52 concerns coadmissible modules (Appendix B.2.4, Definitions B.13–B.15), which PAPER-NAKAMURA-23/53 routes to CompletedCohomologyAndLocalGlobalCompatibility:R31.4 with SmoothRepresentationsOfLocalGroups:SR.5; its only use is Corollary 2.5 (PAPER-NAKAMURA-23/12, also R31.4), so it is not planned in CC.3. The Hecke normalisation T'\_l = T_l S_l⁻¹ is part of CC.3/tame-level-borel-moore-duality; its modular-curve instance and the Galois action belong to the accepted CC.8 adapter.

- `PAPER-NAKAMURA-23/10`: `CC.3/completed-homology-and-borel-moore` (owner's reader §3.3); `CC.3/tame-level-completed-modules` (this part).
- `PAPER-NAKAMURA-23/11`: `CC.3/duality-between-completed-homology-and-completed-cohomology` (owner's reader §3.6); `CC.3/tame-level-borel-moore-duality` (this part).
- `PAPER-NAKAMURA-23/51`: `CC.3/orthonormalizable-and-profree-modules` (owner's reader §3.10); `CC.3/coefficient-module-duality` (owner's reader §3.11).
- `PAPER-NAKAMURA-23/52`: `CC.3/mixed-completed-tensor` (owner's reader §3.12); `CC.3/mixed-tensor-dual-comparison` (owner's reader §3.13).

**PAPER-LE-LEHUNG-LEVIN-ETAL-20** (CC.1, CC.2, CC.3). Planned by the owner; the CC.8 part of the route (unitary geometry) is the accepted CC.8 packet's.

- `PAPER-LE-LEHUNG-LEVIN-ETAL-20/P04`: `CC.1/fixed-exponent-smooth-colimit` (owner's reader §1.1); `CC.2/coefficient-limit-completion` (owner's reader §2.1); `CC.3/definite-degree-zero-dual-interface` (owner's reader §3.14); `CC.8/definite-unitary-degree-zero` (accepted CC.8 part).
- `PAPER-LE-LEHUNG-LEVIN-ETAL-20/def-pontryagin-dual`: `CC.3/continuous-dual-conventions` (owner's reader §3.1); `CC.3/qualified-biduality` (owner's reader §3.2).
- `PAPER-LE-LEHUNG-LEVIN-ETAL-20/def-schikhof-dual`: `CC.3/continuous-dual-conventions` (owner's reader §3.1); `CC.3/qualified-biduality` (owner's reader §3.2); `CC.3/definite-degree-zero-dual-interface` (owner's reader §3.14).

**PAPER-BOXER-CALEGARI-GEE-PILLONI-25** (CC.6, CC.7). Planned by the owner as generic interfaces: the derived locally analytic comparison (gap G6, LocallyAnalyticDistributions:L0) and the projector implication. The GSp₄ boundary vanishing and the GSp₄ comparison are the arithmetic consumer's; no GL₂ result is used for GSp₄.

- `PAPER-BOXER-CALEGARI-GEE-PILLONI-25/4.8.3`: `CC.6/analytic-classical-comparison` (owner's reader §6.7).
- `PAPER-BOXER-CALEGARI-GEE-PILLONI-25/4.9.4`: `CC.7/boundary-vanishing-support-comparison` (owner's reader §7.8).

## Red-team findings handed to this job

**RT-AREA-automorphic-1/3** (high, missing). Discharged by the owner. CC.0/arithmetic-level-index cites NoncommutativeAndEquivariantIwasawa:NE.0/compact-padic-analytic-group, and the CC.5 nodes finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology, codimension-iwasawa-dimension-and-the-torsion-theorem and uniform-filtration-growth cite NE.0/iwasawa-noetherian. The owner's requests ask NE.0 for open uniform subgroups and noetherianity of O[[K_0]] and k[[K_0]] for every compact p-adic analytic K_0, Auslander regularity, grade comparison, finite-index invariance and uniform Hilbert growth; its gap G1 records the open proof leaves; its restructure entry proposes widening NE.0. The edge NE.0 → CC.5 is acyclic (NE.0's ancestors are L1 and LI.4).

Declarations: `CC.0/arithmetic-level-index` (owner's reader §0.1); `CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology` (owner's reader §5.1); `CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem` (owner's reader §5.5); `CC.5/uniform-filtration-growth` (owner's reader §5.8).

**RT-AREA-automorphic-1/17** (medium, missing). Discharged by the owner. Its request to PadicMeasuresIwasawaAlgebras:L1 asks for the general unitary Banach category with a stable unit ball, Schikhof duality, Schneider–Teitelbaum Theorems 2.3 and 3.5, abelianness for compact p-adic Lie groups and admissibility tested on a compact open subgroup. CC.2/rational-unitary-banach-tower and CC.5/banach-admissibility apply it, and the owner's restructure entry has PadicLocalLanglandsForGL2Qp:R30.2 specialise it to GL₂(Q_p) instead of building a second category.

Declarations: `CC.2/rational-unitary-banach-tower` (owner's reader §2.9); `CC.5/banach-admissibility` (owner's reader §5.4).

**RT-AREA-automorphic-1/18** (medium, error). Discharged. The finite-level perfect complexes are the owner's CC.4 nodes; the completed Hecke algebra, its semilocal decomposition and residual localisation are nodes of the accepted CC.8 part, with the owner's request to IntegralHeckeAndGaloisDeterminants:IHG.2.

Declarations: `CC.4/perfectness-and-cochain-comparison` (owner's reader §4.3); `CC.4/derived-finite-level-coinvariants` (owner's reader §4.4); `CC.4/patched-perfect-model-import` (owner's reader §4.6).

## Requests from other roadmaps

**CohomologyComparisons → CC.2** (for `CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit`). Answered. The accepted request asked for derived limits, ML and lim¹ conditions, the multiplication-by-p transition on adjacent torsion with its vanishing limit, and Pan's completeness input (Lemma 4.4.4). Its review found the last two missing. The owner's CC.2 nodes give the first, and CC.2/complete-torsion-free-complex-control gives the rest for any bounded-above complex of complete torsion-free modules, the form Pan applies to Čech complexes.

Answered by `CC.2/complete-torsion-free-complex-control` (this part); `CC.2/derived-completed-tower` (owner's reader §2.2); `CC.2/milnor-and-mittag-leffler-control` (owner's reader §2.3); `CC.2/coefficient-bockstein-comparison` (owner's reader §2.8); `CC.2/completion-and-tate-module` (owner's reader §2.6).

**CohomologyComparisons → CC.4** (for `CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent`). Answered by CC.4/completed-coefficient-interchange: the complete torsion-free complex with H^i = H̃^i and mod-p^m cohomology the fixed-exponent groups, natural for transitions and Hecke maps, and the coefficient interchange of Pan II, Lemma 7.2.6. The flag-variety half of the consuming node is not a CC.4 matter.

Answered by `CC.4/completed-coefficient-interchange` (this part); `CC.4/perfectness-and-cochain-comparison` (owner's reader §4.3).

**CohomologyComparisons → CC.8** (for `CohomologyComparisons:CP.6/pan-graded-analytic-decompletion`, `CohomologyComparisons:CP.6/pan-bounded-torsion-inverse-limit`, `CohomologyComparisons:CP.6/pan-completed-coefficient-and-flag-descent`, `CohomologyComparisons:CP.6/pan-truncated-period-isomorphism`). Outside this part: CC.8 belongs to the accepted CC.8 part and the owner.

**TorsionCohomologyInfrastructure → CC.4** (for `TorsionCohomologyInfrastructure:TC.2/iwasawa-consequences`). Answered by the owner: the finite projective completed chain complex at a torsion-free pro-p level, its support versions, the Iwasawa duality comparison with its hypotheses (the arithmetic chain pairing is the owner's gap G7) and the tame action.

Answered by `CC.4/completed-equivariant-cell-complex` (owner's reader §4.2); `CC.4/perfectness-and-cochain-comparison` (owner's reader §4.3); `CC.7/completed-iwasawa-poincare-duality` (owner's reader §7.6); `CC.1/tame-hecke-on-colimits` (owner's reader §1.3).

## Mistakes in the sources

**CompletedCohomologyPartII/E5** (misprint, affects nothing; new). Forum Math. Pi 10 (2022), e7, proof of Lemma 4.4.4, p. 44 (arXiv:2008.07099v3, p. 48). After the universal-coefficient sequence, the proof writes the limit over n of H^{i+1}(M^•)[p^n] as Hom_{Z_p}(Q_p/Z_p, H^i(M^•)). Correction: The limit of H^{i+1}(M^•)[p^n] along multiplication by p is Hom_{Z_p}(Q_p/Z_p, H^{i+1}(M^•)). Reason: The terms H^{i+1}(M^•)[p^n] are submodules of H^{i+1}, and a compatible system for multiplication by p is a homomorphism Q_p/Z_p → H^{i+1}. The proof has just shown Hom(Q_p/Z_p, H^j(M^•)) = 0 for every degree j, so the conclusion is unaffected. Searched: The version of record, Forum of Mathematics, Pi 10 (2022), e7, open-access PDF fetched 14 October 2026: the same text. arXiv:2008.07099v3 (8 July 2021): the same text. The article page at cambridge.org, 14 October 2026: no correction notice; the errata register of this programme (research/blueprint/errata/) has no entry for this paper.

The following confirmed findings bear on the declarations of these layers; the declarations use the corrected statements.

- `CompletedCohomologyPartII/E1` (Theorem 1.1(3), p. 3): The first duality sequence takes the E/O-dual of the torsion submodule of H̃\_{n−1}; the owner's integral duality node uses the corrected sequence. CC.3/tame-level-borel-moore-duality uses the second sequence, which needs no correction.
- `CompletedCohomologyPartII/E2` (Lemma 1.17, proof, p. 14): Used by the imported CC.5 grade node.
- `CompletedCohomologyPartII/E3` (Theorem 1.18, p. 14): Used by the imported CC.5 growth node: the exponent holds for regular uniform-power filtrations.
- `CompletedCohomologyPartII/E4` (§1.3, p. 6): Used by the imported completed Poincaré duality node: unrestricted integral Ext amplitude is dim(U) + 1.
- `PAPER-BOXER-PILLONI-26/E9` (§1.4, display before Proposition 1.4.7, p. 5): The completed tensor product, as in §5.4; CC.3/admissible-perfect-anti-equivalence uses it.
- `PAPER-BOXER-PILLONI-26/E110` (§5.4, Remark 5.4.3, p. 57): Λ acts through t ↦ [t] in the invariants defining the complexes, with the universal character normalised accordingly; CC.3/admissible-perfect-anti-equivalence fixes this action.
- `PAPER-BOXER-PILLONI-26/E7` (§1.4, Theorem 1.4.8, p. 5; Theorem 5.5.2, p. 57): The Λ-structure of the second factor of the Serre pairing is twisted by the involution induced by t ↦ w₀t⁻¹; the imported node records this twist.
- `PAPER-NAKAMURA-23/E3` (§2.3.2, second commutative diagram, Inventiones p. 195 (arXiv p. 24)): The lower row of the diagram lands in Hom_O(Ĥ¹\_c(K'\_{Σ₀}), O); CC.3/tame-level-borel-moore-duality uses the corrected diagram.

## Requests

- To `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`: Finite-cover transfer on homology and on Borel–Moore (relative) homology of finite CW pairs, with pushforward after transfer equal to multiplication by the degree, transfer after pushforward equal to the deck-group sum for a Galois cover, and transfer adjoint to the cohomological trace under the evaluation pairing. The owner's request to the same stage already asks for finite-cover transfer and deck-group descent; this records the homological and adjointness clauses used here. For `CC.3/tame-level-completed-modules`.

The owner's seventeen supplier requests (SR.0, L1, two NE.0 nodes, R02.1, D7, P7, P8, L0, R14.3, IHG.2, three AlgebraicTopology stages, E1, C2 and the ProfiniteProPGroups receipt) are recorded in its packet and apply to the imported declarations.

## Acceptance tests of this part

- Every target of CC.0–CC.7 above names at least one declaration of the owner or of this part, and every named owner declaration is in the packet's imports.
- Each item of the five added papers has an owning declaration, or a named owner outside these layers.
- The tower of connected degree-p covers of a circle has H̃\_1 = 0 integrally while the limit of rational finite-level H_1 is E: rationalisation comes after both limits.
- In the zero-dimensional tower of levels K⁰/K, the tame-level duality sends a coset gK to integration over gK against μ; without μ(K) the maps do not commute with transfer.
- A p-power index breaks the tame-level invariants: pullback along the degree-p cover of a circle is zero on H^1 with F_p coefficients.

