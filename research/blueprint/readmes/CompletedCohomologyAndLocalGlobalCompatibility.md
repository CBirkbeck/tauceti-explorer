# Completed cohomology and p-adic local–global compatibility over Q

## Purpose and scope

This roadmap constructs the completed cohomology of the towers of modular curves, of quaternionic Shimura curves and of definite quaternion algebras, the completed Hecke algebras acting on them with their Galois representations, and proves the p-adic local–global compatibility theorems that modern modularity lifting over Q consumes: Emerton's refined local–global compatibility for GL₂/Q and his Theorem 1.2.1, its mod p form (Theorem 1.2.6), Nakamura's dual form for completed homology, Dospinescu–Le Bras's local–global compatibility for a definite quaternion algebra, Pan's semisimple local–global compatibility for definite quaternion algebras over totally real fields, and the patched completed modules of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin, Tung and Pan with their support theorems. Finite-level Galois representations alone do not give these results: the statements are about the Banach representation B(V|G\_{Q\_p}) of GL₂(Q\_p) attached by the p-adic local Langlands correspondence, and about the multiplicity with which it occurs in completed cohomology.

The final layer exports the exact statements used by each branch of the GL₂ lifting theorems (the inputs CC1–CC5 of GL2ModularityLifting), proves promodularity and its Fontaine–Mazur consequences, and audits which globalisations each result uses, so that an argument reproving Serre's conjecture can tell which statements it may use.

Everything here is a plan at target level: each target has a precise statement, hypotheses, a proof sketch that cites its source, and prerequisites that end in Mathlib, Tau Ceti or another roadmap's layer. The construction of the generic completed tower, its duality, admissibility and Hecke localisation is CompletedCohomologyPartII's and is imported; the local p-adic Langlands correspondence is PadicLocalLanglandsForGL2Qp's and is requested.

## Conventions

- E is a finite extension of Q\_p with ring of integers O, uniformiser ϖ and residue field k; G = GL₂(Q\_p); for a finite set Σ₀ of primes not containing p, Σ = Σ₀ ∪ {p}, G\_{Σ₀} = ∏\_{ℓ∈Σ₀} GL₂(Q\_ℓ) and K₀^Σ = ∏\_{ℓ∉Σ} GL₂(Z\_ℓ).
- Completed cohomology at tame level K^p is the ϖ-adic completion of the p-level colimit of étale cohomology of the modular curves Y(K\_pK^p); the colimit over tame levels is taken afterwards, with the locally convex (O-linear) inductive-limit topology. Ordinary, compactly supported and interior cohomology are kept distinct; localisation at a residual Hecke ideal is taken on the completed object through CompletedCohomologyPartII's residual projectors.
- The G- and GL₂(A\_f)-actions follow Emerton (lg §2): the actions of Carayol's papers twisted by g ↦ (g^{-1})^t. Hecke operators T\_ℓ and S\_ℓ are the double cosets of diag(ℓ, 1) and diag(ℓ, ℓ); Frobenius elements are geometric, and a Galois representation attached to a Hecke eigensystem has characteristic polynomial X² − T\_ℓX + ℓS\_ℓ at Frob\_ℓ.
- B denotes the p-adic local Langlands correspondence for GL₂(Q\_p) in Kisin's deformation-theoretic formulation; π\_ℓ(V) for ℓ ≠ p is Emerton's modified local Langlands representation (the generic one in the Tate normalisation).
- A residual representation ρ̄ is p-distinguished if ρ̄|G\_{Q\_p} is not, after semisimplification, the sum of two copies of one character; Assumption 3.3.1 excludes ρ̄|G\_{Q\_p} ≅ χ ⊗ (1 ∗; 0 ε̄).
- Every theorem keeps its source's hypotheses, including small primes: Emerton's main results need ρ̄ absolutely irreducible and the exclusions above, his mod p theorem needs p > 2, Tung treats all odd p and p = 2 separately, and Pan excludes a block at p = 3.

## Ownership and boundaries

| Mathematics | Owner |
|---|---|
| Generic completed towers, coefficient limits, duality, admissibility, descent, supports, the CC.8 modular/Hilbert/quaternionic realisation, the completed Hecke algebra as an inverse limit and its residual localisation | CompletedCohomologyPartII CC.0–CC.8 (imported by node id) |
| Finite-level modular curves, cohomology with coefficients, boundary, Hecke correspondences, bad fibres | ModularCurvesPartII R13–R14 |
| Finite-level quaternionic forms and Shimura-curve cohomology, Jacquet–Langlands at finite level | HilbertModularVarietiesAndShimuraCurves R18.3–R18.4, GL2AutomorphicRepresentationsAndTransfer R17.3 |
| Galois representations of eigenforms and finite-level Hecke determinants | AutomorphicGaloisRepresentations R19.1–R19.6, IntegralHeckeAndGaloisDeterminants |
| Global and local deformation rings, Taylor–Wiles primes, abstract patching and support | GlobalGaloisDeformations, LocalGaloisDeformationRings, DeformationAndDerivedPatchingAlgebra |
| Definite unitary groups and their algebraic modular forms (for the CEGGPS globalisation) | PotentialAutomorphyInfrastructurePartII PL.2 |
| Colmez's functor, B(V), Kisin's equivalence, Paškūnas's blocks and projective envelopes, Berger–Breuil, the local Breuil–Mézard statements | PadicLocalLanglandsForGL2Qp R30.2–R30.6 (requested; no plan yet) |
| Local Langlands in families away from p (co-Whittaker families) | SmoothRepresentationsOfLocalGroups SR.5 (Tau Ceti) |
| Scholze's functor S^i | the pending design ScholzeFunctorAndModpCohomologyOfTheLubinTateTower (gap) |
| The patched eigenvariety and Ding's definite-unitary multiplicity input | the pending Part II design of this roadmap |
| The lifting theorems and their own dependency audit | GL2ModularityLifting R22, R32 (consumers) |

Three pieces of mathematics move down into this roadmap from its consumers: Pan's pro-modular primes and the nice-prime conditions of his Theorem 4.1.7 (from GL2ModularityLifting R32.4), and the potentially crystalline, non-crystabelline case of Emerton's Theorem 3.3.22 on locally algebraic vectors, whose proof is global and cannot sit in PadicLocalLanglandsForGL2Qp without a stage cycle.

## Sources

- M. Emerton, *Local-global compatibility in the p-adic Langlands programme for GL\_{2/Q}*, unpublished manuscript, draft of 23 March 2011 (author's page, lg.pdf) — cited as EM11; the backbone of R31.1–R31.4 and R31.6.
- M. Emerton, *A local-global compatibility conjecture in the p-adic Langlands programme for GL\_{2/Q}*, Pure Appl. Math. Q. 2 (2006); author draft of 19 August 2009 — cited as EM-PAMQ, §7.2–7.4.
- M. Emerton, *On the interpolation of systems of eigenvalues attached to automorphic Hecke eigenforms*, Invent. Math. 164 (2006); author draft — cited as EM06, §§2.1–2.2 and 4.3.
- F. Calegari and M. Emerton, *Completed cohomology — a survey* (2012), §1.1.
- K. Nakamura, *Zeta morphisms for rank two universal deformations*, Invent. Math. 234 (2023); arXiv:2006.13647v2, §2.
- G. Dospinescu and A.-C. Le Bras, *Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique*, Ann. of Math. 186 (2017); arXiv:1509.00606v2, §§4.1, 5.1, 13.
- P. Colmez, G. Dospinescu and W. Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*, Forum Math. Pi 11 (2023); arXiv:2204.11214v2, §4.1.
- Y. Ding, *p-adic Hodge parameters in the crystabelline representations of GL\_n*, Publ. Math. IHÉS 142 (2025); arXiv:2407.21237v2, §4.1.
- A. Caraiani, M. Emerton, T. Gee, D. Geraghty, V. Paškūnas and S. W. Shin, *Patching and the p-adic local Langlands correspondence*, Camb. J. Math. 4 (2016); arXiv:1310.0831v5, §§2, 4.
- M. Emerton and V. Paškūnas, *On the density of supercuspidal points of fixed regular weight in local deformation rings and global Hecke algebras*, J. Éc. polytech. Math. 7 (2020); arXiv:1809.06598v3, §6.
- L. Pan, *The Fontaine–Mazur conjecture in the residually reducible case*, J. Amer. Math. Soc. 35 (2022); arXiv:1901.07166v2, §§3–4, 8.
- S.-N. Tung, *On the automorphy of 2-dimensional potentially semi-stable deformation rings of G\_{Q\_p}*, Algebra Number Theory 15 (2021); arXiv:1803.07451v4.
- S.-N. Tung, *On the modularity of 2-adic potentially semi-stable deformation rings*, Math. Z. 298 (2021); arXiv:1908.06174v3.
- J.-P. Serre, *Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)*, Duke Math. J. 54 (1987), §3.4.

All page numbers refer to the versions listed. Five mistakes found in these sources are recorded in the packet's source issues: a misprinted determinant in Emerton's construction of ρ(K\_{Σ₀}) (lg p. 47, det = S\_ℓ for ℓS\_ℓ), Emerton's citation of a manuscript in preparation for his Theorem 6.1.2, a wrong level in Dospinescu–Le Bras's Lemme 4.7, a misnamed character in their Lemme 5.6, and Nakamura's citation of a 'Proposition 2.5' that is Corollary 2.5.

## Layer overview

| Layer | Content | Uses |
|---|---|---|
| R31.1 | Completed cohomology of modular curves, Shimura curves and definite quaternion algebras; degree zero and two, compact supports, non-Eisenstein injectivity | CompletedCohomologyPartII CC.1–CC.8; ModularCurvesPartII R14.3; HilbertModularVarietiesAndShimuraCurves R18.3–R18.4 |
| R31.2 | Locally algebraic vectors and classical cohomology; density; newforms; completed homology with coefficients; quaternionic classical forms and typed modules | R31.1; CC.6; AutomorphicGaloisRepresentations R19.1 |
| R31.3 | Completed Hecke algebras, Hecke-valued Galois representations, deformation-to-Hecke maps, Galois factorisation, classical points, pro-modular primes | R31.2; CC.8; R19.4–R19.6; IHG; GlobalGaloisDeformations R04.2 |
| R31.4 | Local Langlands families over T, the multiplicity module, Emerton's local–global compatibility and its mod p and dual forms, the quaternionic and Pan versions, the Scholze-functor comparison | R31.3; PadicLocalLanglandsForGL2Qp R30.2–R30.5; SmoothRepresentationsOfLocalGroups SR.5 |
| R31.5 | Patched modules (CEGGPS for GL\_n(F), quaternionic patched completed homology), type specialisation, support and full support (Emerton–Paškūnas, Tung), Pan's patching | R31.4; DeformationAndDerivedPatchingAlgebra R03.5–R03.6; GlobalGaloisDeformations; LocalGaloisDeformationRings; PotentialAutomorphyInfrastructurePartII PL.2 |
| R31.6 | Promodularity and Fontaine–Mazur, Böckle's R = T, the global proof of Emerton's Theorem 3.3.22, quaternionic globalisation, the globalisation audit and the export table | R31.4–R31.5 |

Inside each layer the targets are listed in dependency order. Each target gives its statement, hypotheses, a proof sketch with the source locators, its prerequisites (*Needs*), and, for definitions and constructions, the API a user needs and unit tests that a plausible wrong definition fails.


## R31.1. Towers and completed cohomology

<a id="r31-1"></a>

This layer fixes the carriers. For the modular curves it takes CompletedCohomologyPartII's coefficient-limit object of the modular tower, through CC.8's realisation of the actual canonical-model tower, and records Emerton's normalisations: the p-level colimit is taken at each finite coefficient level before completing, and the tame colimit afterwards. It then proves what is special to GL₂: the explicit degree-zero object, the vanishing of completed H² with compact supports, surjectivity of forgetting supports, and the non-Eisenstein results of Emerton §5.3 — after localising at an absolutely irreducible residual representation the boundary disappears, finite-level cohomology is recovered as invariants, and the mod ϖ^s cohomology is an injective smooth K\_p-module, so that the localised completed cohomology is C(K\_p, O)^r for pro-p K\_p.

The same layer constructs the two quaternionic carriers the later layers need: the completed cohomology of Shimura curves for a quaternion algebra over a totally real field ramified at one place above p (used with Scholze's functor), and the completed module of a definite quaternion algebra split above p — continuous functions on the profinite set D^×∖(D ⊗ A\_F^∞)^×/U^p — which is the zero-dimensional case of all the constructions and the setting of Dospinescu–Le Bras, Pan and Tung.

### Completed cohomology of the modular tower

*Construction* `R31.1/the-object-the-conjecture-is-about` — planet: Completed cohomology of the modular tower

Let E/Q\_p be finite with integers O, uniformizer ϖ and residue field k, and let G = GL\_2(Q\_p). For a compact open K\_f ⊂ GL\_2(A\_f) let Y(K\_f) be the modular curve GL\_2(Q)∖((C∖R) × GL\_2(A\_f)/K\_f) with its canonical model over Q. For A ∈ {O, O/ϖ^s, E} and a tame level K^p ⊂ GL\_2(A\_f^p) put H^1(K^p)\_A = colim\_{K\_p} H^1\_ét(Y(K\_pK^p)\_{Q̄}, A), the colimit over compact open K\_p ⊂ G, and likewise H^1\_c(K^p)\_A with compact supports and H^0(K^p)\_A. The completed cohomology at tame level K^p is the ϖ-adic completion Ĥ^1(K^p)\_O = lim\_s H^1(K^p)\_O/ϖ^s, and Ĥ^1(K^p)\_E = E ⊗\_O Ĥ^1(K^p)\_O, an E-Banach space with unit ball Ĥ^1(K^p)\_O; the same recipe gives Ĥ^1\_c(K^p) and Ĥ^0(K^p). Taking the locally convex (O-linear) inductive limit over tame levels gives Ĥ^1\_A = colim\_{K^p} Ĥ^1(K^p)\_A for A = O, E. For a finite set Σ\_0 of primes not containing p, Σ = Σ\_0 ∪ {p} and an open K\_{Σ\_0} ⊂ G\_{Σ\_0} = ∏\_{ℓ∈Σ\_0} GL\_2(Q\_ℓ), put Ĥ^1(K\_{Σ\_0})\_A = Ĥ^1(K\_{Σ\_0}K\_0^Σ)\_A with K\_0^Σ = ∏\_{ℓ∉Σ} GL\_2(Z\_ℓ), and Ĥ^1\_{A,Σ} = colim\_{K\_{Σ\_0}} Ĥ^1(K\_{Σ\_0})\_A. These carry commuting continuous actions of G\_Q, of G, of the tame group (GL\_2(A\_f^p), resp. G\_{Σ\_0}) and of the Hecke operators T\_ℓ, S\_ℓ for ℓ ∉ Σ(K^p). The carrier is the CompletedCohomologyPartII coefficient-limit object H̃^1(K^p, O) of the modular tower transported along CC.8's modular realisation; no second completed-cohomology carrier is defined. The object of Emerton’s Conjecture 1.1.1 is the multiplicity space Hom\_{E[G\_Q]}(V, Ĥ^1\_E) of a two-dimensional E-representation V of G\_Q, with its GL\_2(A\_f)-action.

*Hypotheses and conventions.*

- E/Q\_p finite, O its integers, ϖ a uniformizer, k = O/ϖ.
- Group actions follow Emerton lg §2: the G- and GL\_2(A\_f)-actions are those of Carayol twisted by g ↦ (g^{-1})^t (lg p. 45, footnote 11); this convention is fixed for the whole roadmap.
- Ĥ^1\_E is a colimit of Banach spaces with the locally convex inductive-limit topology; it is not itself ϖ-adically complete, and the tame colimit is taken after completion.

*API.*

- `TauCeti.ModularCompletedCohomology.atTameLevel` (constructor): Ĥ^1(K^p)\_O as the CC.2 coefficient limit of the modular tower at tame level K^p, with its Banach rationalisation Ĥ^1(K^p)\_E.
- `TauCeti.ModularCompletedCohomology.reductionEquiv` (characterisation): For each s ≥ 1, Ĥ^1(K^p)\_O/ϖ^s ≅ colim\_{K\_p} H^1(Y(K\_pK^p), O/ϖ^s), G\_Q × G × Hecke-equivariantly.
- `TauCeti.ModularCompletedCohomology.tameColimit` (constructor): Ĥ^1\_A = colim\_{K^p} Ĥ^1(K^p)\_A with the O-linear inductive-limit topology, for A = O, E.
- `TauCeti.ModularCompletedCohomology.atSigma` (constructor): Ĥ^1(K\_{Σ\_0})\_A and Ĥ^1\_{A,Σ} = colim\_{K\_{Σ\_0}} Ĥ^1(K\_{Σ\_0})\_A with the action of G\_Q × G × G\_{Σ\_0}.
- `TauCeti.ModularCompletedCohomology.compactSupport` (constructor): The compactly supported variant Ĥ^1\_c and the forget-supports map Ĥ^1\_c → Ĥ^1.
- `TauCeti.ModularCompletedCohomology.galoisAction` (instance): The continuous G\_Q-action, unramified outside Σ(K^p) at tame level K^p, commuting with G and the Hecke operators.
- `TauCeti.ModularCompletedCohomology.heckeOperator` (data): T\_ℓ and S\_ℓ for ℓ ∉ Σ(K^p), acting continuously and commuting with G\_Q × G.
- `TauCeti.ModularCompletedCohomology.tameRestriction_isClosedEmbedding` (functoriality): For K^{p′} ⊂ K^p the pullback on Ĥ^1(−)\_E is a closed G-equivariant embedding, compatible with the Hecke operators at primes unramified in both.
- `TauCeti.ModularCompletedCohomology.multiplicitySpace` (constructor): For a continuous representation V of G\_Q on a finite-dimensional E-space, Hom\_{E[G\_Q]}(V, Ĥ^1\_E) with its induced GL\_2(A\_f)-action; the Lean prototype is the submodule of equivariant linear maps between two representations.
- `TauCeti.ModularCompletedCohomology.multiplicityEvaluation` (constructor): The evaluation map V ⊗ Hom\_{E[G\_Q]}(V, Ĥ^1\_E) → Ĥ^1\_E, v ⊗ f ↦ f(v), equivariant for the residual actions.
- `TauCeti.ModularCompletedCohomology.multiplicityEvaluation_injective` (relation): For V finite-dimensional, irreducible and with only scalar equivariant endomorphisms, the evaluation map is injective.
- `TauCeti.ModularCompletedCohomology.equivCC` (compatibility): The canonical identification with CompletedCohomologyPartII:CC.2/coefficient-limit-completion for the modular tower of CC.8.

*Unit tests.*

- `TauCeti.ModularCompletedCohomology.degreeZero_computation` (computation): Ĥ^0\_E is isomorphic to the space of functions on Q\_{>0}∖A\_f^× that are continuous in the p-adic variable and smooth away from p, with G\_Q acting through class field theory and GL\_2(A\_f) through det (EM-PAMQ (60)); a wrong definition that completes before taking π\_0 of the tower fails this.
- `TauCeti.ModularCompletedCohomology.invariants_compatibility` (compatibility): The K^p-invariants of Ĥ^1\_E equal Ĥ^1(K^p)\_E as G-representations, with T\_ℓ matching the double coset of diag(ℓ, 1) (EM-PAMQ Lemma 7.2.8).
- `TauCeti.ModularCompletedCohomology.reduction_mod_varpi` (characterisation): Ĥ^1(K^p)\_O/ϖ is the smooth G-representation colim\_{K\_p} H^1(Y(K\_pK^p), k); a definition that completes the rational colimit without the integral lattice fails this.
- `TauCeti.ModularCompletedCohomology.no_one_dimensional_subrep` (non-example): Ĥ^1\_E contains no one-dimensional G-subrepresentation (EM11 Lemma 5.1.3); the space of smooth vectors H^1(K^p)\_E alone would not be a Banach space, and completing H^1 of a single curve gives no G-action.

*Uses.*

- EM11, Conjecture 1.1.1 and Theorem 1.2.1: The multiplicity space Hom\_{E[G\_Q]}(V, Ĥ^1\_E) is the target of the local–global maps.
- EM11, §5.3, Definition 5.3.2: Localising at a residual maximal ideal gives the ρ̄-part Ĥ^1\_{O,ρ̄,Σ}, a direct summand.
- NAK, §2.3: Its Pontryagin–Schikhof dual is completed Borel–Moore homology, the source of the zeta morphisms.
- LocallyAnalyticCompletedCohomology:LA.2: Pan identifies H̃^1(K^p, Z\_p) with perfectoid cohomology; the request to R31.1 asks for this carrier with its admissible actions.
- GL2ModularityLifting:R32.2 (through R31.6): Odd-prime lifting through local–global compatibility uses this carrier.

*Proof sketch.*

1. Identify the finite-level étale cohomology groups with the CC.0/CC.1 modular tower through CompletedCohomologyPartII:CC.8/arithmetic-tower-realisation (modular family, with ModularCurvesPartII R14.3 supplying the finite étale/Betti comparison); the p-level colimit at fixed s is CC.1's fixed-exponent object and the s-limit is CC.2's coefficient-limit completion.
2. Emerton’s isomorphism (5.1.1), H^1(K^p)\_O/ϖ^s ≅ H^1(K^p)\_{O/ϖ^s}, is torsion-freeness of H^1(K^p)\_O plus vanishing of the ϖ-torsion of the degree-two groups in the colimit (EM-PAMQ Lemma 7.2.1); it identifies Ĥ^1(K^p)\_O with lim\_s colim\_{K\_p} H^1(Y(K\_pK^p), O/ϖ^s), which is CC.2's object (EM-PAMQ Corollary 7.2.4).
3. Transport the G\_Q- and Hecke actions with CompletedCohomologyPartII:CC.8/transported-arithmetic-actions; the G-action is CC.1's smooth action through conjugated levels, extended by continuity.
4. Form the tame colimit with CompletedCohomologyPartII:CC.1/tame-level-variation; the transition maps are closed embeddings (EM06 Proposition 2.2.13), so the O-linear inductive-limit topology of lg p. 45, footnote 10, is Hausdorff.

*Checks.*

- Ĥ^1(K^p)\_O/ϖ ≅ colim\_{K\_p} H^1(Y(K\_pK^p), k), G\_Q × G-equivariantly (EM11 (5.1.2) with s = 1).
- For K^{p′} ⊂ K^p the pullback Ĥ^1(K^p)\_E → Ĥ^1(K^{p′})\_E is a closed G-equivariant embedding, and the K^p-invariants of Ĥ^1\_E are Ĥ^1(K^p)\_E (the theorem R31.1/arithmetic-actions-and-admissibility).

*Needs:* CompletedCohomologyPartII:CC.8/arithmetic-tower-realisation; CompletedCohomologyPartII:CC.8/transported-arithmetic-actions; CompletedCohomologyPartII:CC.2/coefficient-limit-completion; CompletedCohomologyPartII:CC.1/tame-level-variation; CompletedCohomologyPartII:CC.2/rational-unitary-banach-tower; ModularCurvesPartII:R14.3/integral-comparison; mathlib:AdicCompletion; mathlib:Field.absoluteGaloisGroup; mathlib:Matrix.GeneralLinearGroup.

*Sources.*

- EM11, §5.1, pp. 44–45: Defines H^1(K^p)\_A as the p-level colimit of étale cohomology of the modular curves, Ĥ^1(K^p)\_O as its ϖ-adic completion with the reduction isomorphisms (5.1.1)–(5.1.2), the Banach space Ĥ^1(K^p)\_E, the tame colimit Ĥ^1\_A with its inductive-limit topology, the fixed-away-from-Σ variants Ĥ^1(K\_{Σ\_0}) and Ĥ^1\_{A,Σ}, and the compactly supported and degree-zero analogues.
- EM11, Conjecture 1.1.1 and Remark 1.1.2, p. 2: The local–global conjecture is a statement about the multiplicity space of V in Ĥ^1\_E; Remark 1.1.2 records the case (V|G\_{Q\_p} a twist of an extension of the cyclotomic character by the trivial character) in which it is expected to fail as stated.
- EM-PAMQ, §7.2, Lemma 7.2.1, Definition 7.2.2, Lemma 7.2.3, Corollary 7.2.4, pp. 62–63: Torsion-freeness and separatedness of H^1\_\*(K^p)\_O, the Banach completion Ĥ^1\_\*(K^p)\_E, and its identification with lim\_s colim\_{K\_p} of the mod ϖ^s cohomology, for ordinary and compact supports.
- NAK, §2.1.1, pp. 14–16: Nakamura recalls the same objects Ĥ^i(K^p), Ĥ^1(K\_{Σ\_0}) and Ĥ^1\_Σ with the inductive-limit topology, which his zeta morphisms consume.
- CE, §1.1, pp. 2–4: For a fixed tower the survey defines Ĥ as the p-adic completion of the direct limit and H̃ as lim\_s lim\_r H(X\_r, Z/p^s); for the modular tower in degree one these agree at each tame level by (5.1.1) of EM11.

### Admissibility, tame-level control and the arithmetic actions

*Theorem* `R31.1/arithmetic-actions-and-admissibility`

For every tame level K^p: (a) Ĥ^1(K^p)\_E with the G-action is an admissible unitary E-Banach representation of G = GL\_2(Q\_p), and Ĥ^1(K^p)\_O is ϖ-adically admissible: Ĥ^1(K^p)\_O/ϖ is an admissible smooth k-representation of G; the same holds for compact supports. (b) The natural map Ĥ^1(K^p)\_E → (Ĥ^1\_E)^{K^p} is a G-equivariant isomorphism, under which T\_ℓ (resp. S\_ℓ) corresponds to the double coset K^p diag(ℓ,1) K^p (resp. K^p diag(ℓ,ℓ) K^p) for ℓ ≠ p unramified in K^p. (c) For K^{p′} ⊂ K^p the pullback Ĥ^1(K^p)\_E → Ĥ^1(K^{p′})\_E is a closed embedding, equivariant for G and for the Hecke operators at primes unramified in both levels. (d) The G\_Q-action on Ĥ^1(K^p)\_O is continuous, unramified outside Σ(K^p) = {p} ∪ {ℓ : K^p ramified at ℓ}, and commutes with G and the Hecke operators; on Ĥ^1\_E the G\_Q-action commutes with GL\_2(A\_f).

*Hypotheses and conventions.*

- Tame levels are compact open subgroups of GL\_2(A\_f^p); (b) is stated for the E-Banach spaces; the integral analogue needs neatness or the localisation of R31.1/non-eisenstein-boundary-and-injectivity.
- Admissibility is in the sense of Schneider–Teitelbaum: the Schikhof dual of a G-stable unit ball is finitely generated over O[[H]] for one, hence every, compact open H ⊂ G.

*Proof sketch.*

1. Each modular curve Y(K\_f) is homotopic to a finite one-dimensional simplicial complex; this verifies the finite-cell hypothesis of CompletedCohomologyPartII:CC.5/banach-admissibility, and the local group is the compact p-adic analytic GL\_2(Z\_p), so CC.5 gives (a) (EM06 Theorem 2.2.11, EM-PAMQ Lemma 7.2.5).
2. (b) is the averaging argument over K^{p′} ⊂ K^p normal, made integral by the transfer of CC.1 and passing to completions; it is EM06 Theorem 2.2.16(ii); the Hecke statement is EM-PAMQ Lemma 7.2.8 (which cites a proposition of the published version of EM06 whose number does not match the 2006 draft read here).
3. (c) is EM06 Proposition 2.2.13: the pullback is split, after inverting p, by the normalised trace, so its image is closed.
4. (d) is the transport of R31.1/the-object-the-conjecture-is-about’s G\_Q-action; unramifiedness outside Σ(K^p) follows from good reduction of Y(K\_pK^p) at ℓ ∉ Σ(K^p) for K\_p fixed and is preserved by the colimit and completion (EM-PAMQ 7.2.9).

*Checks.*

- The proof of (a) applies CC.5 only after the finite-cell and compact p-adic analytic hypotheses are verified for the modular tower.
- Concrete instance: for K^p = K\_1(N)^p and a weight-two newform f of level N prime to p, the f-isotypic part of H^1(Y\_1(N), E) embeds in (Ĥ^1\_E)^{K^p} by (b).

*Needs:* §R31.1/the-object-the-conjecture-is-about; CompletedCohomologyPartII:CC.5/banach-admissibility; CompletedCohomologyPartII:CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology; CompletedCohomologyPartII:CC.1/tame-level-variation; CompletedCohomologyPartII:CC.8/transported-arithmetic-actions; ModularCurvesPartII:R14.3/integral-comparison.

*Sources.*

- EM06, Theorem 2.2.11, p. 31; Proposition 2.2.13, p. 32; Theorem 2.2.16, p. 33: Admissibility of the completed cohomology of arithmetic quotients as Banach G-representations, closedness of the tame-level pullbacks, and recovery of a fixed tame level as invariants.
- EM-PAMQ, Lemma 7.2.5, (55), Lemma 7.2.8 and 7.2.9, pp. 63–64: The modular-curve statements: admissible unitary Banach representation, closed tame-level embeddings, invariants and Hecke double cosets, and the G\_Q-action commuting with G and Hecke.
- EM11, §5.1, p. 44 (admissibility cited to [36]): Emerton records that the G-action makes Ĥ^1(K^p)\_O ϖ-adically admissible in the sense of his Definition 3.1.1.

### Degree zero, vanishing in degree two and compact supports

*Theorem* `R31.1/degree-zero-two-and-compact-support`

For the modular tower: (a) Ĥ^0\_E ≅ C(Q\_{>0}∖A\_f^×, E), the space of functions continuous in the p-adic variable and locally constant away from p, with G\_Q acting through G\_Q^{ab} ≅ Q\_{>0}∖A\_f^× (class field theory) and GL\_2(A\_f) through det; at tame level K^p, Ĥ^0(K^p) restricted to a small compact open H ⊂ Z(Q\_p) is a direct sum of copies of C(Z\_p^×, E). (b) Ĥ^2\_c = 0, and Ĥ^n = Ĥ^n\_c = 0 for n ≥ 3; the p-adically completed H^2 (without supports) vanishes as well, because each Y(K\_f) is a non-compact curve. (c) The forget-supports maps Ĥ^1\_c(K^p)\_O → Ĥ^1(K^p)\_O and Ĥ^1\_{c,E} → Ĥ^1\_E are surjective. (d) Cup product defines continuous pairings Ĥ^0\_E ⊗ Ĥ^1\_{\*,E} → Ĥ^1\_{\*,E} for \* ∈ {∅, c}, and cupping with the class of a continuous character ψ of Q\_{>0}∖A\_f^× twists T\_ℓ to ψ(ℓ)T\_ℓ and S\_ℓ to ψ(ℓ)^2 S\_ℓ.

*Hypotheses and conventions.*

- The degree-zero description uses the determinant π\_0(Y(K\_f)) ≅ Q\_{>0}∖A\_f^×/det K\_f; continuity is in the p-adic variable only.
- (b) and (c) are statements about the completed objects; finite-level H^2\_c is nonzero.

*Proof sketch.*

1. (a): H^0 of each Y(K\_f) is the space of functions on π\_0(Y(K\_f)) = Q\_{>0}∖A\_f^×/det K\_f; the colimit over K\_p and ϖ-adic completion give continuous functions in the p-adic direction (EM-PAMQ (60)); the restriction to a small H ⊂ Z(Q\_p) follows since H acts through det on the components (EM06 proof of Proposition 4.3.1).
2. (b): for K\_p fixed choose K\_p′ ⊂ K\_p with [K\_pSL\_2(Q\_p) : K\_p′SL\_2(Q\_p)] divisible by p^r; the pullback on H^2\_c multiplies by a multiple of p^r on each component, so colim\_{K\_p} H^2\_c is p-divisible and its p-adic completion vanishes (EM06 Proposition 4.3.6). Non-compact curves have no H^2 and no cohomology above degree 2.
3. (c): compare H^1\_c with parabolic cohomology H^1(X(K\_f)) of the compactified curves and show that the cokernel of H^1\_c → H^1, the boundary cohomology, becomes p-divisible in the colimit for the same index reason (EM06 Proposition 4.3.9; EM-PAMQ 7.2.10); the boundary sequence is CompletedCohomologyPartII:CC.7/boundary-long-exact-sequences-and-the-borel-serre-tower applied to the modular tower.
4. (d): CompletedCohomologyPartII cup products on the tower, with the twisting formula of EM-PAMQ Lemma 7.3.19.

*Checks.*

- Ĥ^2\_c = 0 although H^2\_c(Y(K\_f), O) ≅ O^{π\_0(Y(K\_f))} is nonzero at every finite level.
- The twist by the cyclotomic character ψ = ε: cupping with c\_ε carries the eigensystem (T\_ℓ, S\_ℓ) of a form f to (ℓT\_ℓ, ℓ^2S\_ℓ).

*Needs:* §R31.1/the-object-the-conjecture-is-about; CompletedCohomologyPartII:CC.7/boundary-long-exact-sequences-and-the-borel-serre-tower; CompletedCohomologyPartII:CC.7/derived-completed-support-triangle; ModularCurvesPartII:R14.3/boundary-exact-sequence; mathlib:ContinuousMap; mathlib:LocallyConstant.

*Sources.*

- EM06, Proposition 4.3.1 and its proof, p. 52; Proposition 4.3.6, p. 53; Proposition 4.3.9, p. 54: Ĥ^0 restricted to a small central subgroup is a sum of C(Z\_p^×, E); Ĥ^2\_c vanishes by the p-divisibility of the colimit of H^2\_c; Ĥ^1\_c → Ĥ^1 is surjective.
- EM-PAMQ, 7.2.10 and 7.2.11, (56)–(60), pp. 64–65; Lemma 7.3.19, p. 69: Surjectivity of forgetting supports, the explicit description of Ĥ^0\_E, the cup product with Ĥ^0, and the twist of Hecke operators by cupping with a character.
- NAK, Proof of Lemma 2.4, p. 22: Nakamura uses the vanishing of Ĥ^2\_c to identify completed Borel–Moore homology with the dual of Ĥ^1\_c.

### Non-Eisenstein localisation: boundary, injectivity and freeness

*Theorem* `R31.1/non-eisenstein-boundary-and-injectivity` — planet: Non-Eisenstein injectivity of completed cohomology

Let ρ̄: G\_Q → GL\_2(k) be continuous and absolutely irreducible, unramified outside Σ = Σ\_0 ∪ {p}, and let m be a residual maximal ideal of the completed Hecke algebra of the modular tower (CompletedCohomologyPartII:CC.8/completed-hecke-algebra at tame level K\_{Σ\_0}K\_0^Σ) with T\_ℓ ≡ tr ρ̄(Frob\_ℓ), ℓS\_ℓ ≡ det ρ̄(Frob\_ℓ) for ℓ ∉ Σ. Write M\_m for the closed summand cut out by the residual projector of CC.8. Then: (a) Ĥ^1\_c(K\_{Σ\_0})\_{O,m} → Ĥ^1(K\_{Σ\_0})\_{O,m} is an isomorphism, and replacing the open curves by their compactifications does not change the m-parts. (b) If K\_p is compact open and K\_f = K\_pK\_{Σ\_0}K\_0^Σ is neat, then H^1(K\_f)\_{O,m} → (Ĥ^1(K\_{Σ\_0})\_{O,m})^{K\_p} and H^1(K\_f)\_{O/ϖ^s,m} → (H^1\_{O/ϖ^s,m,Σ})^{K\_pK\_{Σ\_0}} are isomorphisms; for non-neat K\_f the same holds unless ρ̄ is induced from a character of G\_{Q(√−1)} or G\_{Q(√−3)}. (c) For K\_f neat and each s, H^1(K\_{Σ\_0})\_{O/ϖ^s,m} is an injective smooth K\_p-representation over O/ϖ^s; equivalently Hom\_{K\_p}(−, H^1(K\_{Σ\_0})\_{O/ϖ^s,m}) is exact. (d) If moreover K\_p is pro-p, there is r ≥ 0 with Ĥ^1(K\_{Σ\_0})\_{O,m} ≅ C(K\_p, O)^r as ϖ-adically admissible K\_p-representations; dually its Schikhof dual is free of rank r over O[[K\_p]].

*Hypotheses and conventions.*

- ρ̄ is absolutely irreducible; this is what makes H^0 terms vanish after localisation and makes the boundary Eisenstein-free (an absolutely irreducible ρ̄ has a non-Eisenstein eigensystem by Chebotarev and Brauer–Nesbitt, which is the eigenvalue form of non-Eisenstein used by ModularCurvesPartII R14.3).
- ModularCurvesPartII:R14.3/boundary-non-eisenstein is stated in weight two and residue characteristic at least 3; for p = 2 the Eisenstein property of the Hecke action on the cusp boundary (Hecke operators act on H^0 of the cusps through T\_ℓ ↦ 1 + ℓ up to characters) is the same computation and is recorded as a remaining item of R31.1.
- Neatness of K\_f (no fixed points of GL\_2(Q) on (C∖R) × GL\_2(A\_f)/K\_f) is required in (b)–(d); Carayol’s lemma replaces it in (b) for ρ̄ not induced from Q(√−1) or Q(√−3).
- The localisation is CC.8's residual summand; its identification with Emerton’s T(K\_{Σ\_0})\_ρ̄ ⊗ (−) is made in R31.3/completed-hecke-algebra-of-the-modular-tower and is not used here.

*Proof sketch.*

1. (a): the Hecke action on the boundary cohomology of the modular curves is Eisenstein (ModularCurvesPartII:R14.3/boundary-non-eisenstein), so the boundary terms of the CC.7 support triangle vanish after applying the residual projector, which commutes with the triangle by CompletedCohomologyPartII:CC.8/localisation-limit-support-dual-compatibility.
2. (b): for normal K\_p′ ⊂ K\_p and K\_{Σ\_0}′ ⊂ K\_{Σ\_0} the Hochschild–Serre sequence for the free action of K\_f/K\_f′ on Y(K\_f′) has its H^1(K\_f/K\_f′, H^0) term killed by localising at m, giving H^1(K\_f)\_{O/ϖ^s,m} ≅ (H^1(K\_f′)\_{O/ϖ^s,m})^{K\_f}; pass to the limits (EM11 Lemma 5.3.8 and (5.3.9)). The non-neat case is Carayol’s lemma (EM11 Remark 5.3.10).
3. (c): for a finitely generated smooth K\_p-module M, Hom\_{K\_p}(M, H^1(K\_{Σ\_0})\_{O/ϖ^s}) is identified, after localising at m, with H^1 of the local system M^∨ on Y(K\_f) (EM11 (5.3.16)–(5.3.17)); a short exact sequence of such M gives a long exact sequence of cohomology whose H^0 terms vanish at m, so the Hom functor is exact on the right (EM11 Proposition 5.3.15; the method of Remark 5.3.18).
4. (d): (O/ϖ^s)[[K\_p]] is local for K\_p pro-p, so an injective admissible smooth K\_p-module is C(K\_p, O/ϖ^s)^r with r independent of s; pass to the limit in s (EM11 Corollary 5.3.19).

*Checks.*

- For ρ̄ the reduction of the Galois representation of the weight-two newform of level 11 at p = 3 (absolutely irreducible), (a) gives Ĥ^1\_{c,m} = Ĥ^1\_m at tame level K\_0(11)^p.
- Non-example: for an Eisenstein maximal ideal (ρ̄ = 1 ⊕ ε̄) the boundary contributes and (a) fails; the hypothesis cannot be dropped.

*Needs:* §R31.1/degree-zero-two-and-compact-support; §R31.1/arithmetic-actions-and-admissibility; CompletedCohomologyPartII:CC.8/completed-hecke-algebra; CompletedCohomologyPartII:CC.8/completed-residual-localisation; CompletedCohomologyPartII:CC.8/localisation-limit-support-dual-compatibility; CompletedCohomologyPartII:CC.6/hochschild-serre-descent-to-finite-level; ModularCurvesPartII:R14.3/boundary-non-eisenstein; ModularCurvesPartII:R14.3/localized-freeness; mathlib:Module.Projective; mathlib:IsLocalRing.

*Sources.*

- EM11, Definition 5.3.7, Lemma 5.3.8 with (5.3.9), Remark 5.3.10, pp. 50–51: Neat levels; recovery of finite-level ρ̄-localised cohomology as K\_p- and K\_{Σ\_0}-invariants of the completed objects; Carayol’s replacement of neatness.
- EM11, Proposition 5.3.15 with (5.3.16)–(5.3.17), Remark 5.3.18, Corollary 5.3.19, pp. 52–54: Exactness of H^1 after localising at a non-Eisenstein ideal, expressed as injectivity of the localised mod ϖ^s cohomology as a smooth K\_p-representation, and the resulting isomorphism with C(K\_p, O)^r for pro-p K\_p.
- NAK, §2.1.4, p. 19: For absolutely irreducible ρ̄ the compactly supported and ordinary completed cohomology agree after localisation (Ĥ^1\_{c,ρ̄,Σ} ≅ Ĥ^1\_{ρ̄,Σ}).

### Completed cohomology of quaternionic Shimura curves

*Construction* `R31.1/shimura-curve-completed-cohomology` — planet: Completed cohomology of Shimura curves

Let E\_0 be a totally real field in which p splits completely, 𝔭 | p a place (so E\_{0,𝔭} = Q\_p) and ∞\_0 a real place; let D be a quaternion algebra over E\_0 split at ∞\_0, ramified at the other real places and at 𝔭 (D\_𝔭 the quaternion division algebra over Q\_p), and D\_0 the definite algebra obtained by exchanging the invariants at 𝔭 and ∞\_0. For a tame level U^p ⊂ (D ⊗ A\_f^p)^× and open V in the 𝔭-part of the level, let Sh\_{VU^p} be the Shimura curve over E\_0. For a continuous character ψ of A\_f^×/E\_0^× and a continuous representation λ of the level at the places above p other than 𝔭 on a finite free O-module, define Ĥ^1(U^p, O/ϖ^n) = colim\_V H^1\_ét(Sh\_{VU^p, Ē\_0}, O/ϖ^n), its ψ-isotypic part Ĥ^1\_ψ, the λ-typical part Ĥ^1\_{ψ,λ}(U^p, O/ϖ^n) = Hom(λ, Ĥ^1\_ψ(U^p, O/ϖ^n)), and, after localising at a residual maximal ideal m of the abstract Hecke algebra T\_S^{univ} = O[T\_v, S\_v]\_{v∉S}, Ĥ^1\_{ψ,λ,m} = colim\_n Ĥ^1\_{ψ,λ}(U^p, O/ϖ^n)\_m and Ĥ^1\_{ψ,λ}(U^p, O)\_m = lim\_n Ĥ^1\_{ψ,λ}(U^p, O/ϖ^n)\_m with the p-adic topology. They carry commuting actions of G\_{E\_0,S}, T\_S^{univ} and D\_𝔭^× (and of A\_f^×). This is CompletedCohomologyPartII’s completed cohomology of the quaternionic Shimura-curve tower (CC.8 Hilbert/quaternionic adapter), with the 𝔭-level colimit taken over D\_𝔭^×-levels.

*Hypotheses and conventions.*

- D is split at exactly one real place and at all finite places above p other than 𝔭; D\_𝔭 is division. The tower is in the 𝔭-direction of D\_𝔭^×, a compact-mod-centre group, so finite-level H^1 of the tower is not admissible over GL\_2(Q\_p).
- ψ is the central character on A\_f^×; λ has central character compatible with ψ on the intersection with A\_f^×.

*API.*

- `TauCeti.ShimuraCurveCompleted.torsion` (constructor): Ĥ^1(U^p, O/ϖ^n) = colim\_V H^1\_ét(Sh\_{VU^p, Ē\_0}, O/ϖ^n) with its G\_{E\_0,S} × T\_S^{univ} × D\_𝔭^× × A\_f^×-action.
- `TauCeti.ShimuraCurveCompleted.isotypic` (constructor): The ψ-isotypic and λ-typical parts Ĥ^1\_{ψ,λ}(U^p, O/ϖ^n) = Hom(λ, Ĥ^1\_ψ(U^p, O/ϖ^n)).
- `TauCeti.ShimuraCurveCompleted.localized` (constructor): Ĥ^1\_{ψ,λ,m} = colim\_n Ĥ^1\_{ψ,λ}(U^p, O/ϖ^n)\_m and its integral version lim\_n.
- `TauCeti.ShimuraCurveCompleted.dualEquiv` (equivalence): (Ĥ^1\_{ψ,λ,m})^∨ ≅ Hom^cont\_O(Ĥ^1\_{ψ,λ}(U^p, O)\_m, O) as compact T\_S^{univ}[G\_{Q\_p} × D\_𝔭^×]-modules.
- `TauCeti.ShimuraCurveCompleted.invariants` (characterisation): For V open in D\_𝔭^×, (Ĥ^1(U^p, O/ϖ^n))^V = H^1\_ét(Sh\_{VU^p}, O/ϖ^n) when VU^p is sufficiently small.
- `TauCeti.ShimuraCurveCompleted.equivCC` (compatibility): Identification with the CC.2 completed cohomology of the quaternionic Shimura-curve tower of CC.8.

*Unit tests.*

- `TauCeti.ShimuraCurveCompleted.invariants_finite_level` (compatibility): For VU^p sufficiently small, the V-invariants of Ĥ^1(U^p, O/ϖ^n) are H^1\_ét(Sh\_{VU^p, Ē\_0}, O/ϖ^n).
- `TauCeti.ShimuraCurveCompleted.trivial_lambda` (degenerate): For λ the trivial one-dimensional representation, Ĥ^1\_{ψ,λ} is the space of vectors of Ĥ^1\_ψ invariant under the level at the places above p other than 𝔭.
- `TauCeti.ShimuraCurveCompleted.not_GL2_admissible` (non-example): Ĥ^1\_{ψ,λ,m} is a D\_𝔭^×-module, not a GL\_2(Q\_p)-module: a definition that takes the colimit over GL\_2(Q\_p)-levels would describe the modular-curve object of R31.1/the-object-the-conjecture-is-about instead.

*Uses.*

- CDN, Proposition 4.11: Its m-part is identified with Scholze’s functor applied to the definite quaternionic module S\_{ψ,λ,m}.
- CDN, Proposition 4.12: It factors as ρ\_m ⊗ N with ρ\_m the Hecke-valued Galois representation.
- R31.4/scholze-functor-and-completed-cohomology-of-shimura-curves: The comparison theorem is stated on this carrier.

*Proof sketch.*

1. Take the canonical-model tower and finite étale–Betti comparison from CompletedCohomologyPartII:CC.8/hilbert-finite-local-system-input and CC.8/arithmetic-tower-realisation (Hilbert/quaternionic family, quaternion algebras split at exactly one real place).
2. Retain the central-quotient comparison of CompletedCohomologyPartII:CC.8/arithmetic-shimura-central-quotient when passing from the arithmetic quotient to Sh\_{VU^p}.
3. Isotypic and λ-typical parts are taken at each finite n before the limits; localisation at m uses the finite-level Hecke images (HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology) and CC.8's residual projectors, which commute with colim\_n and lim\_n by CC.8/localisation-limit-support-dual-compatibility.
4. The Pontryagin dual (Ĥ^1\_{ψ,λ,m})^∨ is identified with the Schikhof dual of Ĥ^1\_{ψ,λ}(U^p, O)\_m (CDN after Proposition 4.11).

*Checks.*

- Taking E\_0 = Q is excluded by the requirement that D split at exactly one real place while being ramified at 𝔭; the construction needs [E\_0 : Q] even when D\_0 is unramified at all finite places.
- Ĥ^1\_{ψ,λ,m} is a smooth D\_𝔭^×-module; its D\_𝔭^×-invariants at a fixed level are finite-level H^1 of one Shimura curve.

*Needs:* CompletedCohomologyPartII:CC.8/hilbert-finite-local-system-input; CompletedCohomologyPartII:CC.8/arithmetic-tower-realisation; CompletedCohomologyPartII:CC.8/arithmetic-shimura-central-quotient; CompletedCohomologyPartII:CC.8/localisation-limit-support-dual-compatibility; CompletedCohomologyPartII:CC.3/continuous-dual-conventions; HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology.

*Sources.*

- CDN, §4.1.2, pp. 47–48; §4.1.4, pp. 50–51: The quaternionic data D\_0 (definite, split at all finite places) and D (invariants exchanged at 𝔭 and ∞\_0), the Shimura curves Sh\_{VU^p}, and the completed cohomology Ĥ^1\_{ψ,λ,m} with its integral version and duality.
- CDN, Proposition 4.5, p. 47: The globalisation setting: E\_0 totally real of even degree in which p splits completely, with a cuspidal automorphic π whose residual representation restricts to a given r̄ at every place above p.

### Completed module of a definite quaternion algebra

*Construction* `R31.1/definite-quaternionic-completed-module` — planet: Completed module of a definite quaternion algebra

Let F be a totally real field in which p splits completely and D a quaternion algebra over F ramified at every infinite place and unramified at every place above p, with fixed isomorphisms D ⊗\_F F\_v ≅ M\_2(F\_v) at the places where D is unramified; put K\_p = ∏\_{v|p} GL\_2(O\_{F\_v}) ⊂ D\_p^× = ∏\_{v|p} GL\_2(F\_v). For a tame level U^p ⊂ (D ⊗\_F A\_F^{∞,p})^× let X(U^p) = D^×∖(D ⊗\_F A\_F^∞)^×/U^p, a profinite space with a continuous right action of D\_p^×, and X(U^pU\_p) = X(U^p)/U\_p (a finite set) for U\_p ⊂ K\_p open. For a topological O-module M the space C(X(U^p), M) of continuous functions carries the right-translation action of D\_p^× and of the centre (A\_F^∞)^×; for a continuous character ψ: (A\_F^∞)^×/F^×\_{≫0} → O^× trivial on U^p ∩ (A\_F^∞)^×, S\_ψ(U^p, M) ⊂ C(X(U^p), M) is the closed subspace of ψ-equivariant functions f(gz) = ψ(z)f(g). Put S\_ψ(U^p, A) = colim\_{U\_p} S\_ψ(U^pU\_p, A) for a discrete torsion O-module A (locally constant functions), the completed cohomology S\_ψ(U^p) = Hom\_O(E/O, S\_ψ(U^p, E/O)) ≅ lim\_n S\_ψ(U^p, O/ϖ^n) with the p-adic topology, S\_ψ(U^p)\_E = E ⊗\_O S\_ψ(U^p), and the completed homology M\_ψ(U^p) = S\_ψ(U^p, E/O)^∨ (Pontryagin dual, compact-open topology); then S\_ψ(U^p) ≅ Hom^cont\_O(M\_ψ(U^p), O). For F = Q and no central character fixed, C^0(X) = C(X(K^p), L) is Dospinescu–Le Bras’s space of p-adic automorphic forms on B̄^\*.

*Hypotheses and conventions.*

- D is definite (ramified at all infinite places) and split at every place above p; p splits completely in F so that each F\_v = Q\_p.
- The quaternionic tower is degree-zero: its cohomology is functions on finite sets; nonzero higher stabiliser cohomology at non-neat levels is not claimed to vanish.
- Pan’s §3.7 variant with a smooth character ξ of U^p (functions with f(guz) = ψ(z)ξ(u^p)f(g)) is the same construction applied to the kernel of ξ, followed by the ξ-isotypic part.

*API.*

- `TauCeti.DefiniteQuaternionCompleted.space` (constructor): X(U^p) = D^×∖(D ⊗\_F A\_F^∞)^×/U^p as a profinite space with continuous right D\_p^×-action, and X(U^pU\_p) its finite quotients.
- `TauCeti.DefiniteQuaternionCompleted.functions` (constructor): C(X(U^p), M) with the right-translation action of D\_p^× × (A\_F^∞)^×, for a topological O-module M.
- `TauCeti.DefiniteQuaternionCompleted.withCentralCharacter` (constructor): S\_ψ(U^p, M) ⊂ C(X(U^p), M), the closed subspace of ψ-equivariant functions.
- `TauCeti.DefiniteQuaternionCompleted.completedCohomology` (constructor): S\_ψ(U^p) = lim\_n S\_ψ(U^p, O/ϖ^n) with the p-adic topology, and S\_ψ(U^p)\_E = E ⊗ S\_ψ(U^p).
- `TauCeti.DefiniteQuaternionCompleted.completedHomology` (constructor): M\_ψ(U^p) = S\_ψ(U^p, E/O)^∨ as a compact O[[K\_p]]-module with central character ψ^{-1}.
- `TauCeti.DefiniteQuaternionCompleted.invariants` (characterisation): S\_ψ(U^p, A)^{U\_p} = S\_ψ(U^pU\_p, A) for U\_p ⊂ K\_p open.
- `TauCeti.DefiniteQuaternionCompleted.schikhofDual` (equivalence): S\_ψ(U^p) ≅ Hom^cont\_O(M\_ψ(U^p), O) and M\_ψ(U^p) ≅ Hom\_O(S\_ψ(U^p), O).
- `TauCeti.DefiniteQuaternionCompleted.twist` (relation): For a continuous character θ of (A\_F^∞)^×/N(U^p)F^×\_{≫0}, f ↦ (θ∘N\_{D/F})·f is an isomorphism S\_ψ(U^p) ≅ S\_{ψθ^2}(U^p) intertwining T\_v with θ(Frob\_v)T\_v.
- `TauCeti.DefiniteQuaternionCompleted.equivCC` (compatibility): Identification with the CC.2 completed degree-zero object of the finite double-coset tower.

*Unit tests.*

- `TauCeti.DefiniteQuaternionCompleted.finiteLevel_computation` (computation): If U^pU\_p is sufficiently small, S\_ψ(U^pU\_p, A) ≅ ⊕\_{i∈I} A over the finite set I = D^×∖(D ⊗ A\_F^∞)^×/U^pU\_p(A\_F^∞)^× (Pan (3)); for a coarse level the summand at t\_i is the invariants of the finite stabiliser.
- `TauCeti.DefiniteQuaternionCompleted.trivial_coefficients_degenerate` (degenerate): For M = 0 the space C(X(U^p), M) is zero; for M = O and ψ trivial the constant functions are D\_p^×-invariant, and for a continuous character χ of the norm group the functions χ∘N\_{D/F} span a line on which D\_p^× acts through χ∘N\_{D/F}; on the empty set (no double cosets) every function space is zero.
- `TauCeti.DefiniteQuaternionCompleted.invariants_compatibility` (compatibility): The U\_p-invariants of S\_ψ(U^p, O/ϖ^n) are the finite-level quaternionic forms S\_ψ(U^pU\_p, O/ϖ^n) of HilbertModularVarietiesAndShimuraCurves:R18.3.
- `TauCeti.DefiniteQuaternionCompleted.not_locally_constant` (non-example): S\_ψ(U^p) consists of continuous, not locally constant, functions: the locally constant ψ-functions form the dense subspace colim\_{U\_p} S\_ψ(U^pU\_p, O), which is not complete.

*Uses.*

- PAN, Definition 3.5.2 and Theorem 3.5.5: M\_ψ(U^p)\_m is the global object whose block component is compared with Paškūnas’s projective envelope.
- DLB, Théorème 5.4 and §13: C^0(X)[𝔭] ≅ Π(𝔭)^{⊕r} is the zero-dimensional local–global compatibility.
- TUNG-2, §4.6: M\_ψ(U^p)\_m is patched into M̃\_∞.
- CDN, Proposition 4.11: Scholze’s functor is applied to S\_{ψ,λ,m}.
- GL2ModularityLifting:R32.3–R32.4 (through R31.4–R31.5): Tung’s dyadic and Pan’s residually reducible arguments work on this module.

*Proof sketch.*

1. The finite double coset sets X(U^pU\_p) and their stabilisers are HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set; X(U^p) = lim\_{U\_p} X(U^pU\_p) is profinite.
2. S\_ψ(U^p, A) for discrete torsion A is the CC.1 fixed-exponent colimit of the degree-zero tower; S\_ψ(U^p) is its CC.2 coefficient limit; these are the CompletedCohomologyPartII carriers of the finite discrete arithmetic tower, as for the definite unitary groups in CC.8/definite-unitary-degree-zero.
3. The identifications S\_ψ(U^p) ≅ lim\_n S\_ψ(U^p, O/ϖ^n) ≅ Hom^cont(M\_ψ(U^p), O) and M\_ψ(U^p) ≅ Hom\_O(S\_ψ(U^p), O) are Pontryagin and Schikhof duality (CompletedCohomologyPartII:CC.3/continuous-dual-conventions, Pan Remark 3.2.3). HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set states the finite class set in Khare–Wintenberger’s setting (F of even degree, D split at the finite places considered, quotient by the centre); the same finiteness for Pan’s D (any definite D split above p, no central quotient) is the compactness of D^×∖(D ⊗ A\_F^∞)^× modulo the centre for an anisotropic group, with the centre handled by the finiteness of F^×∖(A\_F^∞)^×/(U ∩ (A\_F^∞)^×) times its connected component.
4. The ψ-isotypic part is a closed subspace since (A\_F^∞)^× acts continuously; twisting by θ∘N\_{D/F} gives S\_ψ(U^p) ≅ S\_{ψθ^2}(U^p) (Pan 3.2.7).

*Checks.*

- For D = B̄ over Q and K^p = ∏\_{ℓ≠p} K\_ℓ with one K\_{ℓ\_0} torsion-free, the right G-action on X has finitely many GL\_2(Z\_p)-orbits (R31.1/definite-quaternionic-tower-structure).
- The U\_p-invariants of S\_ψ(U^p, A) are S\_ψ(U^pU\_p, A) (Pan Remark 3.2.3).

*Needs:* HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set; CompletedCohomologyPartII:CC.1/fixed-exponent-smooth-colimit; CompletedCohomologyPartII:CC.2/coefficient-limit-completion; CompletedCohomologyPartII:CC.3/continuous-dual-conventions; mathlib:ContinuousMap; mathlib:LocallyConstant; mathlib:QuaternionAlgebra; mathlib:IsDedekindDomain.FiniteAdeleRing.

*Sources.*

- PAN, §3 (setting), p. 17; §3.1.1, pp. 17–18; Definition 3.2.2, Remark 3.2.3, 3.2.7, pp. 19–20: The definite quaternion algebra over a totally real field in which p splits completely, the spaces S\_{τ,ψ}(U, A) of continuous functions with central character, the completed cohomology S\_ψ(U^p) and completed homology M\_ψ(U^p) with their dualities, and twisting by characters of the reduced norm.
- PAN, §3.7.1–3.7.2, p. 37: The variant S\_{ψ,ξ} with a smooth character ξ of the tame level, deduced from the untwisted case through the kernel of ξ.
- DLB, §4.1, Définition 4.3, p. 20: For B̄ over Q split at p and ramified at ∞: X = B̄^\*(Q)∖B̄^\*(A\_f)/K^p is the projective limit of the finite sets X(K\_p), with a right action of G = GL\_2(Q\_p), and C^0(X) is the space of p-adic automorphic forms.
- TUNG-2, §4.1, Lemma 4.1.1, p. 18: Tung uses the same S\_ψ(U^p, E/O) and M\_ψ(U^p) for a definite quaternion algebra over a totally real field in which 2 splits completely.

### Structure of the definite quaternionic tower

*Theorem* `R31.1/definite-quaternionic-tower-structure`

In the setting of R31.1/definite-quaternionic-completed-module: (a) X(U^p)/K\_p^{(1)} is finite, where K\_p^{(1)} is any open subgroup of D\_p^×; writing (D ⊗ A\_F^{∞,p})^×/U^p = ⊔\_{i=1}^r D^× y\_i with stabilisers Γ\_i ⊂ D^× viewed in D\_p^×, each Γ\_i is discrete and cocompact modulo centre in D\_p^× and X(U^p) ≅ ⊔\_i Γ\_i∖D\_p^× as topological D\_p^×-spaces; X(U^p) is a compact p-adic analytic manifold with a locally analytic action. (b) For F = Q and K^p with K\_{ℓ\_0} torsion-free for some ℓ\_0, GL\_2(Z\_p) acts freely on X with finitely many orbits, so C(X, M) ≅ C(GL\_2(Z\_p), M)^{⊕s} as GL\_2(Z\_p)-representations for every topological Z\_p-module M. (c) If U^pK\_p is sufficiently small and ψ is trivial on N\_{D/F}(U^p), then S\_ψ(U^p, E/O) is an injective object of the category of smooth K\_p-representations over O with central character ψ; dually M\_ψ(U^p) is projective among profinite O[[K\_p]]-modules with central character ψ^{-1} and finitely generated over O[[K\_p]], and S\_ψ(U^p)\_E is a topological direct summand of C\_ψ(K\_p, E)^{⊕d}. (d) S\_ψ(U^p, E/O) is an admissible smooth D\_p^×-representation, and after localising at a maximal ideal m of the Hecke algebra S\_ψ(U^p, E/O)\_m is admissible and injective in the smooth K\_p-representations with the central character induced by ψ.

*Hypotheses and conventions.*

- R18.3/definite-class-set is stated in Khare–Wintenberger’s even-degree setting modulo the centre; (a) uses only the finiteness argument, which holds for every definite D (see R31.1/definite-quaternionic-completed-module).
- (b) needs a torsion-free component of the tame level; (c) needs U^pK\_p sufficiently small (all the groups (t\_i^{-1}D^×t\_i ∩ U(A\_F^∞)^×)/F^× trivial) and ψ trivial on N\_{D/F}(U^p).
- Finiteness of X(U^p)/K\_p uses strong approximation for the reduced-norm-one group and finiteness of the class set; no claim is made for an indefinite quaternion algebra.

*Proof sketch.*

1. (a): finiteness of D^×∖(D ⊗ A\_F^{∞,p})^×/U^p is the finiteness of the class set (R18.3/definite-class-set); the stabilisers are discrete since D^× is discrete in (D ⊗ A\_F^∞)^×, and cocompact modulo centre since D is definite (DLB Lemma 4.4).
2. (b): a nontrivial stabiliser of a point of X in GL\_2(Z\_p) would be a finite-order element of D^× lying in a conjugate of K\_{ℓ\_0}, which is torsion-free; finitely many orbits by (a); choose a section on each orbit (DLB Lemma 13.1).
3. (c): for a finite torsion smooth K\_p-module M, S\_{M,ψ}(U^pK\_p, O) ≅ Hom\_{O[K\_p]}(M^∨, S\_ψ(U^p, E/O)) (Pan Lemma 3.2.5); the left side is exact in M at sufficiently small level by Pan Corollary 3.1.3, giving injectivity on finite modules, and Mittag-Leffler gives it in general (Pan Proposition 3.2.4); dualise and use admissibility for finite generation and the direct-summand statement (Pan Corollary 3.2.6; Tung-2 Corollary 4.2.2).
4. (d): (S\_ψ(U^p, E/O))^{U\_p} = S\_ψ(U^pU\_p, E/O) is cofinitely generated, giving admissibility; localisation is a direct summand, and injectivity passes to summands (CDN Proposition 4.7(a), citing Paškūnas).

*Checks.*

- For F = Q, B̄ of discriminant 2 and p = 3, (b) holds with K^p maximal away from 2 and Iwahori-free at an auxiliary prime ℓ\_0 ≥ 5.
- Non-example: without a torsion-free component the GL\_2(Z\_p)-action on X can have nontrivial finite stabilisers, and C(X, M) is then only a sum of induced modules from those stabilisers.

*Needs:* §R31.1/definite-quaternionic-completed-module; HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set; HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change; CompletedCohomologyPartII:CC.5/smooth-dual-admissibility; mathlib:Module.Projective; mathlib:CompactSpace.

*Sources.*

- DLB, Lemme 4.4, p. 21; Lemme 13.1, p. 69: X is a finite disjoint union of Γ\_i∖G with Γ\_i discrete cocompact, a compact p-adic analytic manifold; GL\_2(Z\_p) acts freely with finitely many orbits, so C^0(X, M) ≅ C^0(GL\_2(Z\_p), M)^{⊕s}.
- PAN, Corollary 3.1.3, p. 18; Proposition 3.2.4, Lemma 3.2.5, p. 19; Corollary 3.2.6, p. 20: Exactness of quaternionic forms at sufficiently small level, injectivity of S\_ψ(U^p, E/O) among smooth K\_p-modules with central character, projectivity and finite generation of M\_ψ(U^p), and the direct-summand embedding of S\_ψ(U^p)\_E into C\_ψ(K\_p, E)^{⊕d}.
- TUNG-2, Lemma 4.1.1, p. 18; Corollary 4.2.2, p. 19: Local admissibility of S\_ψ(U^p, E/O) and projectivity of M\_ψ(U^p) in the category of pseudo-compact modules, for the 2-adic setting.
- CDN, Proposition 4.7, p. 49: S\_ψ(U^p, L/O)\_m is nonzero, admissible and injective in the smooth K\_p-representations with central character ψ\_p.

## R31.2. Classical specialisations and locally algebraic vectors

<a id="r31-2"></a>

Classical cohomology with algebraic coefficients is recovered from completed cohomology in degree one, and only there: the Hochschild–Serre spectral sequence of CompletedCohomologyPartII CC.6, fed with Emerton's computation of the Lie-algebra Ext groups of the explicit Ĥ⁰ and the vanishing of Ĥ², identifies H¹ with coefficients in V\_W with the W̌-equivariant locally analytic vectors, and summing over W gives Emerton's description of the locally algebraic vectors. Density of algebraic vectors (Mahler) then shows that classical eigensystems are dense. The newform comparison fixes the Hecke normalisation against Mathlib's cusp forms through ModularCurvesPartII's weight-two Shimura isomorphism, and the required example — the newform of level 11 — is worked out. Nakamura's Lemmas 2.9–2.11 give the dual statement for completed Borel–Moore homology, which KatoEulerSystems consumes. For the definite quaternion algebra the comparison is elementary (functions on finite sets), and the type-specialised modules σ° ⊗ M\_ψ(U^p) are the finite-level modules of Tung's Lemma 5.3.2.

### Locally algebraic vectors of completed cohomology

*Theorem* `R31.2/locally-algebraic-vectors-of-completed-cohomology` — planet: Locally algebraic vectors of completed cohomology

For \* ∈ {∅, c} there is a natural G\_Q × GL\_2(A\_f)-equivariant isomorphism ⊕\_{k≥2, n∈Z} H^1\_\*(V\_k)\_E ⊗\_E (Sym^{k−2}E^2)^∨ ⊗\_E E(n) ≅ (Ĥ^1\_{\*,E})\_{l.alg}, where (Ĥ^1\_{\*,E})\_{l.alg} is the subspace of locally GL\_2(Q\_p)-algebraic vectors, H^1\_\*(V\_k)\_E = colim\_{K\_f} H^1\_\*(Y(K\_f), V\_k) is the cohomology of the tower with coefficients in the local system V\_k attached to Sym^{k−2} of the standard representation, E(1) is the line on which G\_Q × GL\_2(A\_f) acts by ε ⊗ (ε∘det), and GL\_2(A\_f) acts on (Sym^{k−2}E^2)^∨ through GL\_2(Q\_p). Its isotypic pieces come from the following degree statements, for an irreducible algebraic representation W of GL\_2(Q\_p) with dual W̌: (i) Ext^i\_{gl\_2}(W̌, Ĥ^0\_{la}) vanishes except for i ∈ {0, 3}, and both survivors vanish unless W is one-dimensional; (ii) H^0(V\_W) ≅ Hom\_{gl\_2}(W̌, Ĥ^0\_{la}) and H^1(V\_W) ≅ Hom\_{gl\_2}(W̌, Ĥ^1\_{la}), and Ext^1\_{gl\_2}(W̌, Ĥ^1\_{la}) ≅ Ext^3\_{gl\_2}(W̌, Ĥ^0\_{la}); (iii) for compact supports H^1\_c(V\_W) ≅ Hom\_{gl\_2}(W̌, Ĥ^1\_{c,la}) and H^2\_c(V\_W) ≅ Ext^1\_{gl\_2}(W̌, Ĥ^1\_{c,la}). Consequently, for a cuspidal newform f of weight k defined over E, V\_f ⊗\_E π(V\_f) ⊗\_E (Sym^{k−2}E^2)^∨ embeds G\_Q × GL\_2(A\_f)-equivariantly into Ĥ^1\_{\*,E}.

*Hypotheses and conventions.*

- The comparison holds only in cohomological degree one; it uses the explicit Ĥ^0, the vanishing Ĥ^n = 0 for n ≥ 2 and Ĥ^2\_c = 0 (R31.1/degree-zero-two-and-compact-support). A formal interchange of invariants and inverse limits is not used.
- Locally algebraic means: the orbit map of the vector is locally a polynomial in the matrix entries and det^{−1} on a compact open subgroup of GL\_2(Q\_p); this is stronger than locally analytic.
- (Sym^{k−2}E^2 ⊗ det^n)\_{k≥2,n∈Z} is a complete set of irreducible algebraic representations of GL\_2 over E.

*Proof sketch.*

1. CompletedCohomologyPartII:CC.6/hochschild-serre-descent-to-finite-level gives the continuous Hochschild–Serre spectral sequence H^i\_cts(U, Ĥ^j ⊗ W) ⇒ H^{i+j}(Y\_U, V\_W); passing to locally analytic vectors and Lie-algebra cohomology turns it into Ext^i\_{gl\_2}(W̌, Ĥ^j\_{la}) ⇒ H^{i+j}(V\_W) (EM06 Corollary 2.2.18). CC.6/analytic-classical-comparison warns that the underived locally analytic vectors need justification: here the Ĥ^j are admissible Banach representations, on which the functor of locally analytic vectors is exact and has no higher derived functors (Schneider–Teitelbaum; Emerton’s locally analytic vectors memoir), so the underived and derived forms agree in this case.
2. Proposition 4.3.1 of EM06: Ĥ^0 restricted to Z(Q\_p) × SL\_2(Q\_p) is the tensor product of its restriction to the centre with the trivial SL\_2-representation; a Künneth argument and vanishing of positive z-Ext for C(Z\_p^×, E) give Ext^i\_{gl\_2}(W̌, Ĥ^0\_{la}) ≅ Hom\_z(E(χ^{-1}), Ĥ^0\_{la}) ⊗ H^i(sl\_2, W); Whitehead’s lemmas give (i) (EM06 Corollary 4.3.2).
3. Feed (i) and the vanishing of H^n(V\_W) for n > 1 into the spectral sequence to get (ii) (EM06 (4.3.3)–(4.3.5)); Ĥ^2\_c = 0 gives (iii) (EM06 (4.3.7)–(4.3.8)).
4. Sum (ii)/(iii) over the irreducible W = Sym^{k−2} ⊗ det^n and identify Hom\_{gl\_2}(W̌, −) ⊗ W̌ with the W̌-isotypic locally algebraic vectors; the Tate twist E(n) records det^n (EM-PAMQ Theorem 7.4.2).
5. For a newform f, H^1\_\*(V\_k)\_E contains V\_f ⊗ π(V\_f) G\_Q × GL\_2(A\_f)-equivariantly (EM-PAMQ Theorem 2.5.1): the Galois factor is the rank-two realisation of AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation and the GL\_2(A\_f)-factor is identified with π(V\_f) by local–global compatibility away from p (R19.4) and at p (Saito, R19.5); R14.3/relative-coefficient-system supplies V\_k on the neat cofinal levels Y\_1(N), N ≥ 5, which suffice for the tower. The Manin–Drinfeld splitting of H^1\_c → H^1\_par allows either support (EM-PAMQ Corollary 7.4.3).

*Checks.*

- Weight two: the K\_p-invariant locally algebraic vectors of algebraic weight W = 1 recover H^1(Y(K\_pK^p), E), the cohomology carrying weight-two forms.
- For W one-dimensional, Ext^1\_{gl\_2}(W̌, Ĥ^1\_{la}) ≅ Ext^3\_{gl\_2}(W̌, Ĥ^0\_{la}) can be nonzero, so the degree-one comparison is exact only in the Hom term; the theorem does not claim vanishing of higher Ext for trivial W.

*Needs:* §R31.1/the-object-the-conjecture-is-about; §R31.1/degree-zero-two-and-compact-support; CompletedCohomologyPartII:CC.6/hochschild-serre-descent-to-finite-level; CompletedCohomologyPartII:CC.6/analytic-classical-comparison; CompletedCohomologyPartII:CC.6/algebraic-coefficient-untwisting; CompletedCohomologyPartII:CC.6/classical-evaluation-map; ModularCurvesPartII:R14.3/relative-coefficient-system; AutomorphicGaloisRepresentations:R19.1/newform-rank-two-realisation; AutomorphicGaloisRepresentations:R19.1/parabolic-realisation-premotive; AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility; AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime.

*Sources.*

- EM06, Proposition 4.3.1 and Corollary 4.3.2, pp. 52–53; (4.3.3)–(4.3.5), (4.3.7)–(4.3.8), p. 53: Ext groups of algebraic representations with values in the locally analytic vectors of Ĥ^0 are computed by Lie-algebra cohomology of sl\_2, which kills all but degrees 0 and 3; the Hochschild–Serre spectral sequence then identifies H^1 with coefficients in V\_W with the W̌-equivariant locally analytic vectors in degree one, and similarly with compact supports.
- EM-PAMQ, Definition 7.4.1, Theorem 7.4.2, Corollary 7.4.3, pp. 69–70: The locally algebraic vectors of Ĥ^1\_{\*,E} are the direct sum over k ≥ 2 and n of H^1\_\*(V\_k)\_E ⊗ (Sym^{k−2})^∨ ⊗ E(n); a cuspidal newform contributes V\_f ⊗ π(V\_f) ⊗ (Sym^{k−2})^∨.
- EM11, Proof of Proposition 5.3.13, p. 51; proof of Corollary 5.4.5, p. 55: Emerton’s local–global paper uses [38, Thm. 7.4.2] (= EM-PAMQ Theorem 7.4.2) to describe the locally algebraic vectors at classical points.

### Density of algebraic and classical vectors

*Theorem* `R31.2/density-of-algebraic-vectors`

(a) For every tame level K^p the GL\_2(Z\_p)-algebraic vectors of Ĥ^1(K^p)\_E are dense in Ĥ^1(K^p)\_E; the same holds for any closed G-stable topological direct summand of Ĥ^1(K^p)\_E, in particular for the summand cut out by a residual Hecke projector. (b) The E[G]-span of the GL\_2(Z\_p)-algebraic vectors of such a summand is the direct sum, over the systems of Hecke eigenvalues λ attached to classical cuspidal eigenforms of weight k ≥ 2 and tame level dividing K^p, of the λ-parts of its locally algebraic vectors; hence ⊕\_λ Ĥ^1(K^p)\_E[λ]\_{l.alg} is dense in Ĥ^1(K^p)\_E. (c) In the definite quaternionic case of R31.1/definite-quaternionic-completed-module with F = Q and B̄ split at p, the GL\_2(Z\_p)-algebraic vectors of any topological direct summand of C^0(X) are dense; for a general totally real F and ψ|\_{O\_{F\_v}^×} algebraic at a place v | p, the subspace of S\_ψ(U^p)\_E that is GL\_2(O\_{F\_v})-algebraic and locally algebraic at the other places above p is dense.

*Hypotheses and conventions.*

- Density is for the Banach topology of Ĥ^1(K^p)\_E (resp. of C^0(X), S\_ψ(U^p)\_E).
- In (b) the eigensystems run over classical cuspidal eigenforms; Eisenstein eigensystems do not occur in Ĥ^1 after localising at a non-Eisenstein ideal but may occur without localisation.

*Proof sketch.*

1. Reduce to a neat level: averaging over K^p/K^{p′} projects Ĥ^1(K^{p′})\_E onto Ĥ^1(K^p)\_E (EM11 Remark 5.4.2).
2. Since Y(GL\_2(Z\_p)K^p) is homotopic to a finite one-dimensional complex, Ĥ^1(K^p)\_E is a quotient of C(GL\_2(Z\_p), E)^s compatibly with algebraic vectors (EM06 Theorem 2.1.5); in the localised case R31.1/non-eisenstein-boundary-and-injectivity(d) makes it a direct summand of C(GL\_2(Z\_p), E)^s directly (EM11 Proposition 5.4.1).
3. Polynomial functions on GL\_2(Z\_p) are the GL\_2(Z\_p)-algebraic vectors of C(GL\_2(Z\_p), E) and are dense by Mahler’s theorem (Tau Ceti’s PadicFunctionalAnalysis roadmap, Layer 3.2, states Mahler’s theorem on Z\_p; the several-variable form on GL\_2(Z\_p) ⊂ Z\_p^4 follows by tensor products of Mahler bases); density passes to quotients and direct summands.
4. (b) is R31.2/locally-algebraic-vectors-of-completed-cohomology: every locally algebraic vector lies in a finite sum of eigenspaces of classical eigenforms (EM11 proof of Corollary 5.4.5).
5. (c) is the same argument with R31.1/definite-quaternionic-tower-structure(b) in place of the topology of the modular curve (DLB Lemme 13.2), and in Pan’s generality through the isomorphism S\_{(k,w),ψ}(U^pU\_p, E) ≅ Hom\_{U\_p}(W^\*\_{(k,w)}, S\_ψ(U^p)\_E) (Pan Proposition 3.2.9).

*Checks.*

- Katz’s density of classical modular forms in p-adic modular forms is the analogue (EM11 Remark 5.4.3).
- Non-example: locally constant (smooth) vectors alone are not dense in Ĥ^1(K^p)\_E once nonzero weights are excluded; the density needs all algebraic weights k ≥ 2.

*Needs:* §R31.1/the-object-the-conjecture-is-about; §R31.1/non-eisenstein-boundary-and-injectivity; §R31.1/definite-quaternionic-tower-structure; §R31.2/locally-algebraic-vectors-of-completed-cohomology; mathlib:ContinuousMap; mathlib:Subalgebra.topologicalClosure.

*Sources.*

- EM11, Proposition 5.4.1 and Remark 5.4.2, pp. 54–55: GL\_2(Z\_p)-algebraic vectors are dense in Ĥ^1(K\_{Σ\_0})\_{E,ρ̄}, and even without localising, by Mahler expansions and the realisation of Ĥ^1 as a quotient (or summand) of a finite sum of C(GL\_2(Z\_p), E).
- EM11, Corollary 5.4.5 and its proof, p. 55: The E[G]-span of the algebraic vectors is the sum over classical points of the locally algebraic parts, by EM-PAMQ Theorem 7.4.2.
- DLB, Lemme 13.2, p. 69: GL\_2(Z\_p)-algebraic vectors are dense in any topological direct factor of C^0(X), by Lemme 13.1 and Mahler’s theorem.
- PAN, 3.2.8, Proposition 3.2.9 and its proof, pp. 20–21: For a definite quaternion algebra over a totally real field, the subspace of vectors algebraic at one place v | p and locally algebraic at the others is dense, when the central character is algebraic at v.
- EM06, Theorem 2.1.5, p. 22: The completed cohomology of a tower of finite complexes is computed by a finite complex of C(H, E)-modules.

### Classical eigensystems and newforms in completed cohomology

*Comparison* `R31.2/classical-eigensystems-in-completed-cohomology`

Let T(Σ) = O[T\_ℓ, S\_ℓ]\_{ℓ∉Σ} be the abstract spherical Hecke algebra and λ: T(Σ) → E′ a system of Hecke eigenvalues over a finite extension E′/E. Then: (a) the λ-part of (Ĥ^1(K^p)\_{E′})\_{l.alg} is nonzero if and only if λ, up to the cyclotomic twist of R31.2/locally-algebraic-vectors-of-completed-cohomology, is the eigensystem of a classical eigenform of weight k ≥ 2 and tame level K^p (cuspidal or Eisenstein); (b) for a cuspidal newform f of weight k and conductor N prime to p, with λ\_f its eigensystem, Ĥ^1(K\_1(N)^p)\_{E′}[λ\_f]\_{l.alg} ≅ V\_f ⊗ Sym^{k−2}(E′^2)^∨ ⊗ π\_p(V\_f) as G\_Q × GL\_2(Q\_p)-representations, where π\_p(V\_f) is the local component at p of the automorphic representation of f; (c) under the identification of weight-two cusp forms with H^1 of the modular curve (ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism), the Hecke operator T\_ℓ on Ĥ^1 restricts to the classical T\_ℓ on Mathlib’s CuspForm space at level Γ\_1(N), with the normalisation of R14 (T\_ℓ the double coset of diag(ℓ, 1) after Emerton’s transpose-inverse convention); (d) every eigensystem λ with Ĥ^1(K^p)\_{E′}[λ] ≠ 0 is promodular in the sense of EM-PAMQ Definition 7.3.15, and attached to it is a two-dimensional odd continuous G\_Q-representation over E′ unramified outside Σ, unique up to semisimplification.

*Hypotheses and conventions.*

- The Hecke normalisation is that of R14 and Emerton lg §2 (the actions of [16] twisted by g ↦ (g^{-1})^t); geometric Frobenius at ℓ has characteristic polynomial X^2 − T\_ℓX + ℓS\_ℓ on the Galois factor.
- In (b), π\_p(V\_f) is the generic smooth representation of GL\_2(Q\_p) attached to f; p ∤ N is used only to identify the K\_p-type.

*Proof sketch.*

1. (a) and (b) are R31.2/locally-algebraic-vectors-of-completed-cohomology combined with the decomposition of H^1\_\*(V\_k)\_E into Hecke eigenspaces, and multiplicity one for newforms with Eichler–Shimura (EM-PAMQ Corollary 7.4.3, Remark 7.3.14; EM11 proof of Theorem 3.3.22 in §7.4).
2. (c) is the weight-two Shimura isomorphism of ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism and the Hecke compatibility of R14.1/analytic-comparison-of-correspondences, transported to the completed tower by R31.1/arithmetic-actions-and-admissibility(b).
3. (d): Remark 7.3.14 of EM-PAMQ shows eigensystems occurring in Ĥ^1 are promodular; Proposition 7.3.17 constructs the Galois representation from the pseudo-representation on the product of the T(K^p)/I\_f, using that ∩\_f I\_f = 0 by density of H^1 in Ĥ^1; oddness follows from oddness of each V\_f.

*Checks.*

- Worked example (the roadmap’s required check): for the weight-two newform f of level 11 and p = 5 (good ordinary), Ĥ^1(K\_1(11)^p)\_E[λ\_f]\_{l.alg} ≅ V\_f ⊗ π\_p(V\_f) with π\_p(V\_f) the unramified principal series whose Satake parameters are the roots of X^2 − a\_5(f)X + 5, a\_5(f) = 1, and the Hecke operator T\_ℓ acts on it by a\_ℓ(f) for ℓ ∤ 55 in R14’s normalisation.
- Non-example: an eigensystem of a weight-one form does not occur in the locally algebraic vectors, although it occurs in Ĥ^1 as a promodular eigensystem (EM-PAMQ Remark 7.3.14).

*Needs:* §R31.1/the-object-the-conjecture-is-about; §R31.1/arithmetic-actions-and-admissibility; §R31.2/locally-algebraic-vectors-of-completed-cohomology; ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism; ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences; AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform; AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility; IntegralHeckeAndGaloisDeterminants:IHG.3/rank-two-modular-normalization; mathlib:CuspForm; mathlib:ModularForm.

*Sources.*

- EM-PAMQ, Definitions 7.3.1–7.3.5, Remark 7.3.14, Definition 7.3.15, Proposition 7.3.17, Remark 7.3.18, pp. 65–69: Systems of Hecke eigenvalues, Eisenstein systems, promodularity, and the existence and oddness of the Galois representation attached to a promodular eigensystem.
- EM-PAMQ, Corollary 7.4.3, p. 70: A cuspidal newform contributes V\_f ⊗ π(V\_f) ⊗ (Sym^{k−2})^∨ to Ĥ^1.
- EM11, §7.4, pp. 97–98: At a classical point of conductor N, Ĥ^1(K\_1^p(N))[𝔭]\_{l.alg} ≅ ρ(𝔭) ⊗ Sym^{a−b−1} ⊗ det^b ⊗ π\_p(V), by [38, Thm. 7.4.2].

### Completed homology with coefficients recovers classical cohomology

*Theorem* `R31.2/completed-homology-with-coefficients`

Let H̃^{BM}\_1(K^p) = lim\_{K\_p} H\_1(Y(K\_pK^p)(C), {cusps}, O) be completed Borel–Moore homology at tame level K^p, a compact O[[GL\_2(Z\_p)]]-module with Hecke operators T′\_ℓ, S′\_ℓ. (a) For every compact O[[GL\_2(Z\_p)]]-module M there is a canonical Hecke-equivariant isomorphism M ⊗̂\_O H̃^{BM}\_1(K^p) ≅ H̃^{BM}\_1(K^p, 𝒱\_M) of compact O[[GL\_2(Z\_p)]]-modules, where 𝒱\_M is the induced pro-local system. (b) For an algebraic representation W of GL\_2/Q\_p over E, regarded as a right O[[K\_p]]-module through v·g = g^{-1}v, and any open K\_p ⊂ GL\_2(Z\_p), there is a canonical E-linear isomorphism W ⊗\_{O[[K\_p]]} H̃^{BM}\_1(K^p) ≅ H^1(K^pK\_p, 𝒱\_W)(1), compatible with Hecke operators, change of K\_p, coefficient change W → W′ and the trace maps. (c) For a smooth representation τ of GL\_2(Z\_p) on a finite free O-module and W as above, (τ ⊗ W) ⊗\_{O[[K\_p]]} H̃^{BM}\_1(K^p) ≅ H^1(K^pK\_p, 𝒱\_{τ⊗W})(1) for K\_p acting trivially on τ’s reduction, by Hochschild–Serre. No integral isomorphism and no integral self-duality of symmetric powers is asserted.

*Hypotheses and conventions.*

- (b) and (c) are rational statements (after inverting p); the integral map exists but is not claimed to be an isomorphism.
- Borel–Moore homology is relative to the cusps; H̃^{BM}\_1(K^p) is dual to Ĥ^1\_c(K^p) by R31.1/degree-zero-two-and-compact-support and Poincaré duality (Nakamura Lemma 2.4).

*Proof sketch.*

1. (a): write M = lim M\_i with M\_i of finite length; for K\_p acting trivially on M\_i, M\_i ⊗ H\_1(K^pK\_p) ≅ H\_1(K^pK\_p, 𝒱\_{M\_i}) since H\_2 vanishes for non-compact curves; pass to limits (NAK Lemma 2.9).
2. (b): apply (a) to a K\_p-stable lattice W\_0 and take K\_p-coinvariants, which compute finite-level homology by CompletedCohomologyPartII:CC.6/homological-hyperTor-descent in degree one (the hyper-Tor spectral sequence degenerates because H̃^{BM}\_0 contributes only through the determinant and H̃\_2 = 0); Poincaré duality on Y(K^pK\_p) turns H\_1^{BM}(𝒱\_W) into H^1(𝒱\_W)(1) (NAK Lemma 2.10, citing Emerton’s isomorphism (4.3.7) and Calegari–Emerton’s Theorem 2.2.17).
3. (c): tensor with τ and use Hochschild–Serre for the finite quotient through which GL\_2(Z\_p) acts on τ (NAK Lemma 2.11).

*Checks.*

- For W trivial and K\_p = GL\_2(Z\_p), (b) gives O-coinvariants of H̃^{BM}\_1(K^p) ⊗ E ≅ H^1(Y(GL\_2(Z\_p)K^p), E)(1).
- KatoEulerSystems L2 consumes (b) with W = Sym^{k−2}(Z\_p^2)^\* in the form Sym^{k−2}(Z\_p^2)^\* ⊗\_{Z\_p[[K\_m]]} H̃^{BM}\_1(K^p(N\_0))(1) → H^1(Y(N), V^\*\_k)(2) (its request to R31.2).

*Needs:* §R31.1/the-object-the-conjecture-is-about; §R31.1/degree-zero-two-and-compact-support; CompletedCohomologyPartII:CC.3/completed-homology-and-borel-moore; CompletedCohomologyPartII:CC.3/duality-between-completed-homology-and-completed-cohomology; CompletedCohomologyPartII:CC.6/homological-hyperTor-descent; ModularCurvesPartII:R14.3/parabolic-duality; ModularCurvesPartII:R14.3/relative-coefficient-system.

*Sources.*

- NAK, Lemma 2.4, p. 22; Lemmas 2.9–2.11, pp. 28–30: Completed Borel–Moore homology is the dual of compactly supported completed cohomology; its completed tensor product with a compact O[[GL\_2(Z\_p)]]-module is homology with coefficients; with an algebraic representation W over E it recovers H^1(K^pK\_p, 𝒱\_W)(1), and with τ ⊗ W by Hochschild–Serre.
- EM06, (4.3.7), p. 53: The compactly supported comparison H^1\_c(V\_W) ≅ Hom\_{gl\_2}(W̌, Ĥ^1\_{c,la}), dual to Nakamura’s Lemma 2.10.

### Classical and p-adic quaternionic forms

*Theorem* `R31.2/definite-quaternionic-classical-forms`

In the setting of R31.1/definite-quaternionic-completed-module, let W be an irreducible algebraic representation of D\_p^× = ∏\_{v|p}GL\_2(F\_v) over E (a tensor product of Sym^{k\_v−2} ⊗ det^{w\_v} through the embeddings) and U\_p ⊂ K\_p open. (a) Hom\_{U\_p}(W^\*, C(X(U^p), E)) ≅ A\_{U\_p}(W) := {f: X(U^p) → W continuous with f(xu) = u^{-1}f(x)}, the space of p-adic automorphic forms of weight W and level U^pU\_p, by φ ↦ (x ↦ ...) with inverse f ↦ (ℓ ↦ (x ↦ ℓ(f(x)))); with central character ψ algebraic of the matching weight the same holds for S\_ψ, giving S\_{W,ψ}(U^pU\_p, E) ≅ Hom\_{U\_p}(W^\*, S\_ψ(U^p)\_E) Hecke-equivariantly. (b) For F = Q and a fixed ι: Q̄\_p ≅ C, A\_{K\_p}(W) ⊗\_{E,ι} C ≅ Hom\_{B̄^\*(R)}(W\_∞^\*, Aut(K^pK\_p)), where Aut(K^pK\_p) is the space of smooth functions on B̄^\*(Q)∖B̄^\*(A)/K^pK\_p and W\_∞ = W ⊗\_ι C viewed as a representation of B̄^\*(R). (c) Consequently Hom\_{K\_p}(W, C^0(X)) ⊗\_{E,ι} C ≅ ⊕\_π π\_f^{K^pK\_p}, the sum over automorphic representations π = π\_∞ ⊗ π\_f of B̄^\*(A) with π\_∞ ≅ W\_∞, and G-equivariantly C^0(X)\_{l.alg} ⊗\_{E,ι} C ≅ ⊕\_{W} ⊕\_{π\_∞ ≅ W\_∞} W\_∞ ⊗ π\_f^{K^p}; the infinite-dimensional π correspond by global Jacquet–Langlands to cuspidal representations of GL\_2(A) discrete series at the ramified places of B̄.

*Hypotheses and conventions.*

- (b)–(c) are stated for F = Q, where DLB work; for general F the same holds with the archimedean comparison of HilbertModularVarietiesAndShimuraCurves:R18.3/definite-jl, which is stated in Khare–Wintenberger’s even-degree, parallel-weight setting; R18.3/quaternion-weight likewise covers parallel weights W\_k = ⊗ Sym^{k−2}. Non-parallel weights ⊗\_v Sym^{k\_v−2} ⊗ det^{w\_v} and B̄ over Q ramified at a finite prime use the same constructions; that extension is recorded as a remaining item of R31.2.
- Sign and dual conventions: W versus W^\* follows DLB (their Lemme 4.7 is obtained from 4.5–4.6 by replacing W with W^\*). The last display of DLB Lemme 4.7 prints π\_f^{K\_p} where π\_f^{K^pK\_p} (in the K\_p-algebraic form) or π\_f^{K^p} (in the G-equivariant form) is meant; see sourceIssues.

*Proof sketch.*

1. (a): Hom\_{U\_p}(W^\*, C(X, E)) ≅ (W ⊗ C(X, E))^{U\_p} ≅ C(X, W)^{U\_p}, and U\_p-invariance of a W-valued function is f(xu) = u^{-1}f(x) (DLB Lemme 4.5); the central-character version is Pan’s isomorphism 3.2.10.
2. (b): send f ∈ A\_{K\_p}(W) to φ\_f(ℓ)(g) = ℓ(g\_∞^{-1}·(g\_p·f(g^∞) ⊗ 1)); DLB give the map f ↦ φ\_f explicitly and leave its bijectivity as a standard exercise: the inverse evaluates φ at adelic points with trivial archimedean component, and left B̄^\*(Q)-invariance on both sides matches because B̄^\*(Q) acts on W through B̄^\*(Q\_p) and on W\_∞ through B̄^\*(R) compatibly with ι (DLB Lemme 4.6, following Taylor §1).
3. (c): replace W by W^\* in (a)–(b) and decompose Aut(K^pK\_p) under B̄^\*(A) (DLB Lemme 4.7); Jacquet–Langlands is GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl.

*Checks.*

- For W trivial and π a weight-two quaternionic automorphic representation, π\_f^{K^pK\_p} occurs in the K\_p-invariants of C^0(X)\_{l.alg} ⊗ C.
- Non-example: one-dimensional automorphic representations χ∘N\_{B̄/Q} of B̄^\*(A) occur in C^0(X) (constant functions on fibres of the norm) but have no Jacquet–Langlands partner; they are Eisenstein for the Hecke algebra.

*Needs:* §R31.1/definite-quaternionic-completed-module; HilbertModularVarietiesAndShimuraCurves:R18.3/quaternion-weight; HilbertModularVarietiesAndShimuraCurves:R18.3/definite-jl; GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl; GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity.

*Sources.*

- DLB, Lemmes 4.5, 4.6, 4.7, pp. 21–22: p-adic automorphic forms of weight W are the K\_p-homomorphisms from W^\* into C^0(X); after ι they are classical automorphic forms of weight W\_∞; the K\_p-algebraic vectors decompose over automorphic representations with π\_∞ ≅ W\_∞.
- PAN, 3.2.10, p. 22 (used in the proof of Theorem 3.5.5, pp. 29–30): For a definite quaternion algebra over a totally real field, S\_{(k,w),ψ}(U^pU\_p, E) ≅ Hom\_{U\_p}(W^\*\_{(k,w)}, S\_ψ(U^p)\_E), Hecke-equivariantly.

### Type-specialised quaternionic modules

*Construction* `R31.2/type-specialised-quaternionic-modules` — planet: Type-specialised quaternionic modules

In the setting of R31.1/definite-quaternionic-completed-module, let σ be a continuous representation of K\_p on a finite free O-module σ° (a locally algebraic type: σ ⊗ E = ⊗\_{v|p} σ\_v with each σ\_v ≅ σ(λ\_v, τ\_v) or σ^{cr}(λ\_v, τ\_v), an algebraic representation of highest weight λ\_v tensored with a smooth K\_v-type attached to an inertial type τ\_v) on which (A\_F^∞)^× ∩ K\_p acts through ψ. Put S\_{ψ,σ}(U, A) = Hom\_{U\_p}(σ, S\_ψ(U^p, A)) and, for a maximal ideal m of the Hecke algebra, the type-specialised module M(σ°) = σ° ⊗\_{O[[K\_p]]} M\_ψ(U^p)\_m. Then (Schikhof duality and Frobenius reciprocity) M(σ°)^d ≅ Hom^cont\_{O[[K\_p]]}(σ°, M\_ψ(U^p)\_m^d) ≅ S\_{ψ,σ°}(U^pK\_p, O)\_m; when U^pK\_p is sufficiently small M(σ°) is finite free over O, its formation is exact in σ°, and M(σ°)[1/p] is dual to the space of classical quaternionic forms of weight and type σ. The Hecke algebra T^S\_{ψ,σ}(U^pK\_p) acting faithfully on S\_{ψ,σ}(U^pK\_p, O)\_m is a finite reduced O-algebra, a quotient of the big Hecke algebra of R31.3/definite-quaternionic-hecke-algebra and of the global deformation ring R^S\_ψ(σ) with local conditions σ at the places above p.

*Hypotheses and conventions.*

- U^pK\_p sufficiently small (Pan Corollary 3.1.3) for the exactness and freeness assertions.
- The identification of R^S\_ψ(σ) → T^S\_{ψ,σ} requires local–global compatibility at v | p at finite level (classical, through the Bernstein centre), recorded in R31.5/type-specialised-patched-modules for the patched version.

*API.*

- `TauCeti.DefiniteQuaternionCompleted.typed` (constructor): S\_{ψ,σ}(U, A) = Hom\_{U\_p}(σ, S\_ψ(U^p, A)) for a K\_p-type σ with compatible central character.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised` (constructor): M(σ°) = σ° ⊗\_{O[[K\_p]]} M\_ψ(U^p)\_m.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_dual` (equivalence): M(σ°)^d ≅ S\_{ψ,σ°}(U^pK\_p, O)\_m, Hecke-equivariantly (Schikhof duality and Frobenius reciprocity).
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_exact` (functoriality): σ° ↦ M(σ°) is exact on finite free K\_p-types at sufficiently small tame level.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_free` (characterisation): M(σ°) is finite free over O when U^pK\_p is sufficiently small.
- `TauCeti.DefiniteQuaternionCompleted.typeHeckeAlgebra` (data): T^S\_{ψ,σ}(U^pK\_p)\_m, finite reduced over O, the image of the Hecke algebra in End(S\_{ψ,σ°}(U^pK\_p, O)\_m), with the surjection from R^S\_ψ(σ).

*Unit tests.*

- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_trivial` (degenerate): For σ° = O with trivial action, M(σ°) = M\_ψ(U^p)\_m ⊗\_{O[[K\_p]]} O is the K\_p-coinvariants, dual to S\_ψ(U^pK\_p, O)\_m.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_rank` (computation): At sufficiently small level, rank\_O M(σ°) = (number of double cosets in D^×∖(D ⊗ A\_F^∞)^×/U^pK\_p(A\_F^∞)^×) · rank\_O σ° before localisation.
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_compatibility` (compatibility): For σ = W an algebraic representation, M(σ°)[1/p]^\* is the space S\_{W,ψ}(U^pK\_p, E) of R31.2/definite-quaternionic-classical-forms(a).
- `TauCeti.DefiniteQuaternionCompleted.typeSpecialised_not_patched` (non-example): M(σ°) is a finite O-module at a fixed tame level; it is not the patched module M\_∞(σ°) of R31.5, which is finite over R\_∞(σ) but of positive relative dimension over O.

*Uses.*

- TUNG-2, Lemma 5.3.2: Condition (3), finiteness of R^S\_ψ(σ) and faithfulness of M(σ)[1/p], is equivalent to the full-support condition (1).
- GL2ModularityLifting:R32.3/typed-component-specialisation: The typed component argument identifies the nonzero fibre with the finite-level algebraic σ-space (input CC1).
- PAN, §4.4: Completed homology with auxiliary levels is specialised to types at Taylor–Wiles levels.

*Proof sketch.*

1. M(σ°)^d ≅ Hom^cont\_{O[[K\_p]]}(σ°, M^d) by Schikhof duality and ≅ Hom\_{G\_p}(c-Ind σ°, M^d) by Frobenius reciprocity (TUNG-2 §5.2.1, CEGGPS Lemma 4.14); M\_ψ(U^p)^d = S\_ψ(U^p), so M(σ°)^d = Hom\_{K\_p}(σ°, S\_ψ(U^p)) = S\_{ψ,σ°}(U^pK\_p, O).
2. Exactness and freeness: S\_ψ(U^p, E/O) is injective among smooth K\_p-modules with central character (R31.1/definite-quaternionic-tower-structure(c)), so Hom\_{K\_p}(−, S\_ψ(U^p, E/O)) is exact; finite level is a finite sum of copies of σ°'s invariants under trivial stabilisers.
3. Classicality after inverting p is R31.2/definite-quaternionic-classical-forms(a) applied to the algebraic part of σ together with the smooth type.
4. The Hecke algebra T^S\_{ψ,σ} is finite free over O and reduced since S\_{ψ,σ}(U, E) is semisimple for the Hecke action; it is a quotient of the completed Hecke algebra by restriction (R31.3/definite-quaternionic-hecke-algebra).

*Checks.*

- For σ the trivial type and m non-Eisenstein, M(σ°)[1/p] is dual to the weight-two quaternionic forms of level U^pK\_p localised at m.
- CC1 (GL2ModularityLifting supplier contract): the faithful algebraic quaternionic module consumed by Tung’s Lemma 5.3.2(3) is M(σ°)[1/p] with its R^S\_ψ(σ)-action.

*Needs:* §R31.1/definite-quaternionic-completed-module; §R31.1/definite-quaternionic-tower-structure; §R31.2/definite-quaternionic-classical-forms; HilbertModularVarietiesAndShimuraCurves:R18.3/quaternion-weight; LocalGaloisDeformationRings:R08.3/hodge-and-galois-types; CompletedCohomologyPartII:CC.3/coefficient-module-duality; mathlib:TensorProduct; mathlib:Module.Free.

*Sources.*

- TUNG-2, §4.1, definition of S\_{ψ,σ}(U, A), p. 18; §5.2.1–5.2.2, pp. 26–27; Lemma 5.3.2(3), p. 28: Type-specialised spaces S\_{ψ,σ}(U, A) = Hom\_{U\_p}(σ, S\_ψ(U^p, A)), the module σ° ⊗\_{O[[K\_p]]} M with its Hecke action via Schikhof duality and Frobenius reciprocity, and condition (3): R^S\_ψ(σ) finite over O with M(σ)[1/p] faithful.
- CEGGPS, Lemma 4.14 and Remark 4.16, pp. 60–61: For the patched module, M\_∞(σ°) ≅ lim\_n Hom^cont\_{O[[K]]}(M\_∞, (σ°/ϖ^n)^∨)^∨, the type-specialised module, and its comparison with finite-level automorphic forms of type σ.
- PAN, Corollary 3.1.3, p. 18: At sufficiently small level the functor of quaternionic forms with coefficients is exact.

## R31.3. Hecke and deformation actions

<a id="r31-3"></a>

The completed Hecke algebra of the modular tower is CompletedCohomologyPartII CC.8's inverse limit of finite Hecke images, identified here with Emerton's T(K^p) and localised at an allowable ρ̄ to the complete local noetherian T\_{ρ̄,Σ}. The Galois determinant over T(K^p) is the limit of the finite-level geometric determinants of AutomorphicGaloisRepresentations R19.6, and for absolutely irreducible ρ̄ it comes from a representation ρ^m\_Σ (Carayol). The universal deformation ring surjects onto T\_{ρ̄,Σ}; Eichler–Shimura in families factors the Galois action out of completed cohomology, Ĥ¹\_{O,ρ̄,Σ} ≅ ρ^m\_Σ ⊗ U\_Σ; crystalline classical points are Zariski dense. The commuting action of G on everything is T\_{ρ̄,Σ}-linear and ϖ-adically admissible. For the definite quaternion algebra the big Hecke algebra T\_ψ(U^p) carries only a pseudo-representation in general, and in Pan's residually reducible setting the pseudo-deformation ring surjects onto its Eisenstein localisation; pro-modular primes are those containing the kernel.

### Completed Hecke algebra of the modular tower

*Construction* `R31.3/completed-hecke-algebra-of-the-modular-tower` — planet: Completed Hecke algebra

Fix a tame level K^p and let T(K\_pK^p) be the O-subalgebra of End\_{G\_Q×G}(H^1(K\_pK^p)\_E) generated by T\_ℓ, S\_ℓ for ℓ ≠ p unramified in K^p; for K\_p′ ⊂ K\_p restriction gives surjections T(K\_p′K^p) → T(K\_pK^p). Put T(K^p) = lim\_{K\_p} T(K\_pK^p) with the projective-limit topology (each T(K\_pK^p) with its ϖ-adic topology). It is the modular-tower instance of CompletedCohomologyPartII:CC.8/completed-hecke-algebra (the inverse limit of the finite Hecke images, through CC.8’s derived-to-cohomological residual comparison), and: it is topologically generated by T\_ℓ, S\_ℓ; it acts faithfully on Ĥ^1(K^p)\_O and Ĥ^1(K^p)\_E; it is reduced, commutative, compact, and the product of finitely many complete local O-algebras T(K^p)\_m, in bijection with the Galois-conjugacy classes of mod-ϖ eigensystems of modular forms of tame level K^p, its topology being the product of the m-adic topologies; for K^{p′} ⊂ K^p there is a continuous map T(K^{p′}) → T(K^p) compatible with the closed embedding Ĥ^1(K^p)\_E → Ĥ^1(K^{p′})\_E. For ρ̄: G\_Q → GL\_2(k) absolutely irreducible, modular and unramified outside Σ = Σ\_0 ∪ {p}, a compact open K\_{Σ\_0} ⊂ G\_{Σ\_0} is allowable if T(K\_{Σ\_0}) = T(K\_{Σ\_0}K\_0^Σ) has a maximal ideal m with residue field k and T\_ℓ ≡ tr ρ̄(Frob\_ℓ), ℓS\_ℓ ≡ det ρ̄(Frob\_ℓ) mod m (ℓ ∉ Σ); T(K\_{Σ\_0})\_ρ̄ = T(K\_{Σ\_0})\_m is a direct factor; for allowable K′ ⊂ K the map T(K′)\_ρ̄ → T(K)\_ρ̄ is a surjection of complete local noetherian O-algebras, an isomorphism for K sufficiently small; and T\_{ρ̄,Σ} = lim\_{K\_{Σ\_0}} T(K\_{Σ\_0})\_ρ̄ is a complete local noetherian O-algebra with residue field k, topologically generated by the T\_ℓ.

*Hypotheses and conventions.*

- The Hecke algebra is generated by the operators at primes ℓ ≠ p unramified in K^p; U\_ℓ at bad primes is adjoined only where a statement says so (Emerton’s T(K\_{Σ\_0})^\*\_ρ̄ in the proof of Theorem 6.2.4).
- Emerton states that any sufficiently small K\_{Σ\_0} is allowable for modular ρ̄; with ρ̄ assumed modular this uses only that ρ̄ arises at some level divisible by primes in Σ, which for p > 2 is the weak-to-strong Serre theorem (EM11 Remark 5.2.3); the dependence on Serre’s conjecture enters only if ‘modular’ is replaced by ‘odd’.

*API.*

- `TauCeti.ModularCompletedCohomology.heckeAlgebra` (constructor): T(K^p) = lim\_{K\_p} T(K\_pK^p) as the CC.8 compatible-sections ring of the finite Hecke images.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_faithful` (characterisation): T(K^p) acts faithfully on Ĥ^1(K^p)\_O and Ĥ^1(K^p)\_E.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_productLocal` (structure): T(K^p) ≅ ∏\_m T(K^p)\_m over its finitely many maximal ideals, each factor complete local; T(K^p) is reduced and compact.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_dense` (characterisation): The O-subalgebra generated by the T\_ℓ, S\_ℓ is dense in T(K^p).
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_tameMap` (functoriality): For K^{p′} ⊂ K^p, a continuous map T(K^{p′}) → T(K^p) sending T\_ℓ, S\_ℓ to T\_ℓ, S\_ℓ and compatible with the closed embedding of Ĥ^1(K^p)\_E.
- `TauCeti.ModularCompletedCohomology.IsAllowableLevel` (other): A level K\_{Σ\_0} is allowable for ρ̄ if T(K\_{Σ\_0}) has a maximal ideal with residue field k matching tr ρ̄ and det ρ̄ at Frob\_ℓ, ℓ ∉ Σ.
- `TauCeti.ModularCompletedCohomology.residualHeckeAlgebra` (constructor): T\_{ρ̄,Σ} = lim over allowable K\_{Σ\_0} of T(K\_{Σ\_0})\_ρ̄.
- `TauCeti.ModularCompletedCohomology.residualHeckeAlgebra_localNoetherian` (instance): T\_{ρ̄,Σ} is a complete local noetherian O-algebra with residue field k.
- `TauCeti.ModularCompletedCohomology.residualHeckeAlgebra_eventuallyConst` (relation): For allowable K′ ⊂ K, T(K′)\_ρ̄ → T(K)\_ρ̄ is surjective, and an isomorphism once K is contained in the congruence subgroup of level N\_{Σ\_0}.

*Unit tests.*

- `TauCeti.ModularCompletedCohomology.heckeAlgebra_weightTwo` (computation): At tame level K\_0(11)^p with p = 3 and m the non-Eisenstein ideal of the newform of level 11, the image of T(K^p)\_m in End(H^1(Y\_0(11)(C), Z\_3)\_m) is Z\_3 with T\_ℓ ↦ a\_ℓ(f).
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_compatibility` (compatibility): T(K^p) is the CompletedCohomologyPartII:CC.8/completed-hecke-algebra of the modular tower at tame level K^p, as topological rings.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_noMaximal_degenerate` (degenerate): If ρ̄ does not occur at any level K\_{Σ\_0}, no level is allowable and the limit defining T\_{ρ̄,Σ} is over the empty system; Emerton’s definition presupposes ρ̄ modular.
- `TauCeti.ModularCompletedCohomology.heckeAlgebra_not_finite` (non-example): T\_{ρ̄,Σ} is not finite over O: classical points of infinitely many distinct weights occur in Spec T\_{ρ̄,Σ}[1/p] and are Zariski dense (R31.3/classical-points-and-zariski-density), so T\_{ρ̄,Σ}[1/p] has infinitely many maximal ideals, unlike each finite-level T(K\_pK\_{Σ\_0})\_ρ̄.

*Uses.*

- EM11, §5.2–5.3 and §6: T\_{ρ̄,Σ} is the coefficient ring of ρ^m\_Σ, π^m\_Σ and the multiplicity module X(θ).
- LocallyAnalyticCompletedCohomology:LA.5 and LA.12: Pan’s big Hecke algebra T(K^p) with its Galois determinant (request to R31.3).
- NAK, §2.1.2: Nakamura’s zeta morphisms are T\_{ρ̄,Σ}-linear.
- GL2ModularityLifting:R32.4 (through R31.3): Pan’s completed Hecke quotient (input CC2).

*Proof sketch.*

1. Identify Emerton’s T(K^p) with CC.8’s completed Hecke algebra for the modular tower at tame level K^p: CC.8 forms the inverse limit of finite derived images on CC.4 perfect complexes; CompletedCohomologyPartII:CC.8/derived-cohomological-residual-comparison shows the derived and cohomological images have the same residual labels and differ by a nilpotent kernel, and in degree one for the modular tower the cohomology image is Emerton’s T(K\_pK^p) (EM11 Definition 5.2.1, footnote 12 for the weak-closure description).
2. Semilocality and the product decomposition are CompletedCohomologyPartII:CC.8/completed-semilocal-product, which gives the finite-image inverse-limit topology; that this is the product of the m-adic topologies follows because each T(K^p)\_m is noetherian — a quotient of a universal deformation ring (absolutely irreducible residual case, R31.3/deformation-to-hecke-surjection) or of a pseudo-deformation ring (in general) — and a compact noetherian local ring with this profinite topology carries its m-adic topology. Reducedness: each T(K\_pK^p) is generated by operators that are normal for the Petersson product on H^1(K\_pK^p)\_C (ModularCurvesPartII:R14.3/hecke-twisted-self-adjoint, R14.3/cup-product-petersson), so it acts semisimply on H^1(K\_pK^p)\_E; its integral version is ModularCurvesPartII:R14.2/integral-hecke-algebra.
3. Lemma 5.2.4 of EM11: surjectivity because the image is closed and contains the topological generators T\_ℓ; eventual isomorphism because the prime-to-p conductor of every modular lift of ρ̄ unramified outside Σ divides a fixed N\_{Σ\_0} (Carayol, Livné), so both algebras are the same quotient of R\_{ρ̄,Σ} (see R31.3/deformation-to-hecke-surjection).
4. T\_{ρ̄,Σ} is complete local noetherian since the transition maps are surjective and eventually isomorphisms (EM11 Definition 5.2.5).

*Checks.*

- For K^p = K\_1(N)^p and m attached to a residually irreducible newform of level N and weight 2, T(K^p)\_m surjects onto the weight-two Hecke algebra T(K\_1(N))\_m acting on H^1(Y\_1(N), O)\_m.
- For ρ̄ the mod 3 representation of the newform of level 11, the level K\_0(11) away from {3, 11} is allowable.

*Needs:* CompletedCohomologyPartII:CC.8/completed-hecke-algebra; CompletedCohomologyPartII:CC.8/completed-semilocal-product; CompletedCohomologyPartII:CC.8/residual-hecke-projector; CompletedCohomologyPartII:CC.8/derived-cohomological-residual-comparison; §R31.1/the-object-the-conjecture-is-about; §R31.1/arithmetic-actions-and-admissibility; ModularCurvesPartII:R14.2/integral-hecke-algebra; ModularCurvesPartII:R14.3/hecke-twisted-self-adjoint; ModularCurvesPartII:R14.3/cup-product-petersson; IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors; IntegralHeckeAndGaloisDeterminants:IHG.1/universal-reductive-pseudocharacter-ring; mathlib:RingCat.sectionsSubring; mathlib:IsLocalRing; mathlib:IsNoetherianRing.

*Sources.*

- EM11, §5.2, Definition 5.2.1 and footnote 12, p. 46; Definitions 5.2.2, 5.2.5, Remark 5.2.3, Lemma 5.2.4, pp. 47–48: The completed Hecke algebra T(K^p) and its properties (faithful, reduced, compact, a finite product of complete local algebras); allowable levels for ρ̄, the local factors T(K\_{Σ\_0})\_ρ̄ and their limit T\_{ρ̄,Σ}, a complete local noetherian O-algebra.
- NAK, §2.1.2, pp. 16–17: Nakamura’s T(K\_{Σ\_0}), allowable levels and T\_{ρ̄,Σ}, as consumed by the zeta morphisms.
- PAN, Proposition 3.3.6 and Corollary 3.3.7, p. 24: For a pro-p level the completed Hecke algebra has the same maximal ideals as the finite-level one (Gee–Newton Lemma 2.1.14), hence is semilocal and a product of its localisations.

### Hecke-valued Galois determinant and representation

*Construction* `R31.3/hecke-galois-determinant-and-representation` — planet: Hecke-valued Galois representation

(a) For every tame level K^p there is a unique continuous two-dimensional determinant D\_{K^p}: O[G\_{Q,Σ(K^p)}] → T(K^p) (in the sense of Chenevier) with characteristic polynomial X^2 − T\_ℓX + ℓS\_ℓ at Frob\_ℓ for ℓ ∉ Σ(K^p) (geometric Frobenius), compatible with T(K^{p′}) → T(K^p); its specialisation at λ: T(K^p) → Q̄\_p is the determinant of a semisimple odd ρ\_λ: G\_{Q,Σ} → GL\_2(Q̄\_p) with det ρ\_λ(Frob\_ℓ) = ℓλ(S\_ℓ) and tr ρ\_λ(Frob\_ℓ) = λ(T\_ℓ). (b) If ρ̄ is absolutely irreducible and K\_{Σ\_0} is allowable, there is a unique deformation ρ(K\_{Σ\_0}): G\_Q → GL\_2(T(K\_{Σ\_0})\_ρ̄) of ρ̄, unramified outside Σ, with tr ρ(K\_{Σ\_0})(Frob\_ℓ) = T\_ℓ and det ρ(K\_{Σ\_0})(Frob\_ℓ) = ℓS\_ℓ; passing to the limit gives ρ^m\_Σ: G\_Q → GL\_2(T\_{ρ̄,Σ}), which equals ρ(K\_{Σ\_0}) for K\_{Σ\_0} small. For 𝔭 ∈ Spec T\_{ρ̄,Σ}, ρ(𝔭)° = ρ^m\_Σ/𝔭ρ^m\_Σ is a G\_Q-stable lattice, free of rank two over T\_{ρ̄,Σ}/𝔭, and ρ(𝔭) = κ(𝔭) ⊗ ρ^m\_Σ. (c) The analogous objects exist for the definite quaternionic Hecke algebra (R31.3/definite-quaternionic-hecke-algebra): a pseudo-representation T\_ψ: G\_{F,S} → T\_ψ(U^p) with determinant ψε^{-1}, and for non-Eisenstein m a lifting ρ\_m: G\_{F,S} → GL\_2(T\_ψ(U^p)\_m) with determinant ψε of the prescribed local type.

*Hypotheses and conventions.*

- Absolute irreducibility of ρ̄ is required in (b) and in the lifting of (c); for residually reducible ρ̄ only the determinant (pseudo-representation) exists over T, and R31.3/eisenstein-localisation-and-pro-modular-primes treats it.
- Frobenius and Hecke normalisations are those of R31.2/classical-eigensystems-in-completed-cohomology; Emerton’s ρ(K\_{Σ\_0}) has det(Frob\_ℓ) = S\_ℓ in his (5.2) display after his twist conventions, which this node records as det = ℓS\_ℓ in the geometric-Frobenius convention of R19.6.

*API.*

- `TauCeti.ModularCompletedCohomology.heckeDeterminant` (constructor): The continuous two-dimensional determinant D\_{K^p} on O[G\_{Q,Σ(K^p)}] valued in T(K^p).
- `TauCeti.ModularCompletedCohomology.heckeDeterminant_charpoly` (simp): The characteristic polynomial of D\_{K^p} at Frob\_ℓ is X^2 − T\_ℓX + ℓS\_ℓ for ℓ ∉ Σ(K^p).
- `TauCeti.ModularCompletedCohomology.heckeDeterminant_tame` (functoriality): D\_{K^{p′}} pushed along T(K^{p′}) → T(K^p) is D\_{K^p} restricted to G\_{Q,Σ(K^p)}.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation` (constructor): ρ^m\_Σ: G\_Q → GL\_2(T\_{ρ̄,Σ}) for absolutely irreducible ρ̄, unique up to conjugation.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation_trace` (simp): tr ρ^m\_Σ(Frob\_ℓ) = T\_ℓ and det ρ^m\_Σ(Frob\_ℓ) = ℓS\_ℓ for ℓ ∉ Σ.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation_reduction` (compatibility): ρ^m\_Σ mod m\_{T} ≅ ρ̄.
- `TauCeti.ModularCompletedCohomology.specialisation` (constructor): ρ(𝔭)° = ρ^m\_Σ/𝔭 and ρ(𝔭) = κ(𝔭) ⊗ ρ^m\_Σ for 𝔭 ∈ Spec T\_{ρ̄,Σ}.
- `TauCeti.ModularCompletedCohomology.specialisation_classical` (compatibility): At a classical point attached to a newform f, ρ(𝔭) ≅ V\_f.

*Unit tests.*

- `TauCeti.ModularCompletedCohomology.heckeRepresentation_det` (computation): det ρ^m\_Σ is the character G\_Q → T\_{ρ̄,Σ}^× sending Frob\_ℓ to ℓS\_ℓ; for trivial nebentypus it is ε times a finite-order character.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation_compatibility` (compatibility): Composing ρ^m\_Σ with T\_{ρ̄,Σ} → T(K\_pK\_{Σ\_0})\_ρ̄ gives Carayol’s finite-level representation (R19.6/hecke-algebra-representation-classical in weight two).
- `TauCeti.ModularCompletedCohomology.heckeDeterminant_degenerate` (degenerate): On the trivial tame level component where T(K^p) = 0 (no eigensystems) the determinant is the zero-ring determinant.
- `TauCeti.ModularCompletedCohomology.heckeRepresentation_reducible_nonexample` (non-example): For a residually reducible maximal ideal the trace D(Frob\_ℓ) = T\_ℓ need not come from a representation over T\_m; requiring one would exclude Pan’s Eisenstein case.

*Uses.*

- EM11, §6.1: ρ^m\_Σ|G\_{Q\_p} determines the deformation π^m\_Σ of π̄ through Kisin’s equivalence, and ρ^m\_Σ|G\_{Q\_ℓ} the family π\_{Σ\_0}(ρ^m\_Σ).
- EM11, Proposition 5.5.3: Ĥ^1\_{O,ρ̄,Σ} ≅ ρ^m\_Σ ⊗ U\_Σ.
- LocallyAnalyticCompletedCohomology:LA.5 and LA.12: The determinant D\_S over T(K^p) and the representations ρ\_λ at its points (request to R31.3).
- GL2ModularityLifting:R32.3 (through R31.3): Tung’s Hecke-valued representation with determinant ψε (input CC2).

*Proof sketch.*

1. (a): at each finite level T(K\_pK^p) acts on H^1 and the geometric Hecke determinant of AutomorphicGaloisRepresentations:R19.6/geometric-hecke-determinant gives a determinant over T(K\_pK^p) with the stated characteristic polynomials; these are compatible under restriction, so they define a determinant on the inverse limit by IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant (a determinant is determined by its values on a dense set of Frobenii, IHG.0/continuous-determinant-dense).
2. Specialisation: a determinant over a field is the determinant of a unique semisimple representation (IHG.1/algebraically-closed-reconstruction); oddness from the classical points (EM-PAMQ Proposition 7.3.17).
3. (b): over the local ring T(K\_pK\_{Σ\_0})\_ρ̄ with absolutely irreducible residual determinant, the determinant comes from a unique representation (Carayol; IHG.1/henselian-irreducible and GlobalGaloisDeformations:R04.2/carayol-trace-theorem); pass to the limit (EM11 discussion before Lemma 5.2.4 and Definition 5.2.7; AutomorphicGaloisRepresentations:R19.6/determinants-and-representability-over-a-hecke-algebra).
4. (c): Pan 3.3.5 builds the pseudo-representation over T\_ψ(U^p) from finite levels (twisting to finite-order ψ as in Pan 3.3.3); Tung-2 Proposition 4.2.5 and DLB §5.1 (Carayol’s theorem) give the lifting for non-Eisenstein m.

*Checks.*

- At a classical point 𝔭 attached to a newform f, ρ(𝔭) ≅ V\_f in the normalisation of R31.2/classical-eigensystems-in-completed-cohomology.
- Non-example: for ρ̄ = 1 ⊕ ε̄ there is no GL\_2(T\_m)-valued representation with the given traces in general; only the determinant exists.

*Needs:* §R31.3/completed-hecke-algebra-of-the-modular-tower; AutomorphicGaloisRepresentations:R19.6/geometric-hecke-determinant; AutomorphicGaloisRepresentations:R19.6/determinants-and-representability-over-a-hecke-algebra; AutomorphicGaloisRepresentations:R19.6/hecke-algebra-representation-quaternionic; IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant; IntegralHeckeAndGaloisDeterminants:IHG.0/continuous-determinant-dense; IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible; IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction; GlobalGaloisDeformations:R04.2/carayol-trace-theorem; mathlib:Matrix.GeneralLinearGroup; mathlib:Field.absoluteGaloisGroup.

*Sources.*

- EM11, §5.2 before Lemma 5.2.4, p. 47; Definitions 5.2.7 and 5.2.9, pp. 48–49: Construction of the deformation ρ(K\_{Σ\_0}) of ρ̄ over T(K\_{Σ\_0})\_ρ̄ as a limit of Carayol’s finite-level deformations, the representation ρ^m\_Σ over T\_{ρ̄,Σ}, and the specialisations ρ(𝔭)°, ρ(𝔭).
- PAN, 3.3.5, p. 24: A two-dimensional pseudo-representation of G\_{F,S} valued in the definite quaternionic big Hecke algebra, with determinant ψε^{-1}.
- TUNG-2, Lemma 4.2.4 and Proposition 4.2.5, pp. 19–20: Semilocality of the quaternionic big Hecke algebra and the lifting ρ\_m to GL\_2(T^S\_ψ(U^p)\_m) for non-Eisenstein m, of the prescribed type with determinant ψε.
- DLB, Définition 5.2 and §5.1 after Définition 5.3, pp. 25–26: Representations associated with a Hecke morphism, modular residual representations, and r^m = lim r^m(K\_p) over the localised quaternionic Hecke algebra A by Carayol’s theorem.
- CDN, Before Proposition 4.12, p. 51: ρ̄ deforms to ρ\_m over T(U^p)\_m with characteristic polynomial X^2 − T\_vX + N(v)S\_v at Frob\_v (Scholze, Proposition 5.7).

### The deformation-to-Hecke surjection

*Theorem* `R31.3/deformation-to-hecke-surjection`

(a) Let ρ̄ be absolutely irreducible and modular, unramified outside Σ, and R\_{ρ̄,Σ} the universal deformation ring of ρ̄ for deformations unramified outside Σ (and ∞). There is a unique local surjection φ\_Σ: R\_{ρ̄,Σ} → T\_{ρ̄,Σ} with φ\_Σ(tr ρ^u(Frob\_ℓ)) = T\_ℓ and φ\_Σ(ℓ^{-1} det ρ^u(Frob\_ℓ)) = S\_ℓ for ℓ ∉ Σ; it is the limit of compatible surjections φ(K\_{Σ\_0}): R\_{ρ̄,Σ} → T(K\_{Σ\_0})\_ρ̄, and ρ^m\_Σ is the pushforward of ρ^u. (b) For a residual pseudo-representation t̄ = 1 + χ̄ of G\_{F,S} (F totally real, Pan §4.1) let R^{ps} be the universal two-dimensional pseudo-deformation ring of t̄ with determinant χ; the pseudo-representation T\_m of R31.3/hecke-galois-determinant-and-representation(c) induces a surjection R^{ps} → T\_m, which factors through the quotient R^{ps,{ξ\_v}} imposing T\_m|\_{I\_{F\_v}} = ξ\_v + ξ\_v^{-1} at v ∈ S∖Σ\_p.

*Hypotheses and conventions.*

- R\_{ρ̄,Σ} parametrises deformations over complete local noetherian O-algebras with residue field k; it exists since ρ̄ is absolutely irreducible.
- In (b) the factorisation through R^{ps,{ξ\_v}} uses classical local–global compatibility at v ∉ Σ\_p at finite levels, after twisting to a finite-order central character.

*Proof sketch.*

1. (a): the deformation ρ(K\_{Σ\_0}) induces φ(K\_{Σ\_0}) by universality (GlobalGaloisDeformations:R04.2/universal-deformation-ring); its image is closed and contains the T\_ℓ, and also the S\_ℓ, so it is surjective; the R\_{ρ̄,Σ}-images are compatible (EM11 diagram (5.2.6)); take the limit.
2. (b): universality of R^{ps} (IntegralHeckeAndGaloisDeterminants:IHG.1/universal-reductive-pseudocharacter-ring for GL\_2) gives R^{ps} → T\_m; it is surjective because T\_m is topologically generated by the T\_v, v ∉ S (Pan 4.1.3).
3. The factorisation through R^{ps,{ξ\_v}} is classical local–global compatibility at v ∈ S∖Σ\_p for quaternionic forms at finite level (AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility), passed to the limit, after twisting ψ to finite order (Pan 4.1.3, referring to 3.3.3).

*Checks.*

- Under Böckle’s hypotheses φ\_Σ is an isomorphism (R31.6/boeckle-r-equals-t).
- At a classical point 𝔭 of T\_{ρ̄,Σ} the composite R\_{ρ̄,Σ} → κ(𝔭) classifies ρ(𝔭).

*Needs:* §R31.3/hecke-galois-determinant-and-representation; §R31.3/completed-hecke-algebra-of-the-modular-tower; GlobalGaloisDeformations:R04.2/universal-deformation-ring; GlobalGaloisDeformations:R04.2/universal-continuous-lift; IntegralHeckeAndGaloisDeterminants:IHG.1/universal-reductive-pseudocharacter-ring; AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility.

*Sources.*

- EM11, §5.2 after Remark 5.2.3, p. 47; (5.2.6) and the paragraph after Definition 5.2.5, p. 48: The universal deformation ring R\_{ρ̄,Σ} is topologically generated by traces of Frobenius; φ(K\_{Σ\_0}) is surjective; passing to the limit gives φ\_Σ: R\_{ρ̄,Σ} → T\_{ρ̄,Σ}.
- NAK, §2.1.2, p. 17: Nakamura records the surjection φ\_Σ: R\_{ρ̄,Σ} → T\_{ρ̄,Σ}.
- PAN, 4.1.3, p. 38: The natural pseudo-representation over T\_m with determinant χ, the universal pseudo-deformation ring R^{ps}, the surjection R^{ps} → T\_m and its factorisation through R^{ps,{ξ\_v}} by classical local–global compatibility at v ∈ S∖Σ\_p.

### The ρ̄-part of completed cohomology and its commuting actions

*Theorem* `R31.3/rho-bar-part-and-commuting-actions`

Let ρ̄ be absolutely irreducible and modular and, for A ∈ {O, E} and allowable K\_{Σ\_0}, Ĥ^1(K\_{Σ\_0})\_{A,ρ̄} = T(K\_{Σ\_0})\_ρ̄ ⊗\_{T(K\_{Σ\_0})} Ĥ^1(K\_{Σ\_0})\_A (a direct summand, equal to the m-adic completion for A = O) and Ĥ^1\_{A,ρ̄,Σ} = colim\_{K\_{Σ\_0}} Ĥ^1(K\_{Σ\_0})\_{A,ρ̄}, a G\_Q × G × G\_{Σ\_0}-stable direct summand of Ĥ^1\_{A,Σ} on which these actions are T\_{ρ̄,Σ}-linear and commute. Then: (a) Ĥ^1(K\_{Σ\_0})\_{O,ρ̄}/ϖ^s ≅ H^1(K\_{Σ\_0})\_{O/ϖ^s,ρ̄} and Ĥ^1\_{O,ρ̄,Σ}/ϖ^s ≅ H^1\_{O/ϖ^s,ρ̄,Σ}; (b) Ĥ^1(K\_{Σ\_0})\_{O,ρ̄} is a ϖ-adically admissible G-representation over T\_{ρ̄,Σ} (every element of Ĥ^1\_{O,ρ̄,Σ}/ϖ^i is killed by a power of the maximal ideal); (c) Ĥ^1(K\_{Σ\_0})\_{A,ρ̄} ≅ (Ĥ^1\_{A,ρ̄,Σ})^{K\_{Σ\_0}}, and for K\_p compact open with K\_pK\_{Σ\_0}K\_0^Σ neat (or ρ̄ not induced from Q(√−1), Q(√−3)), H^1(K\_pK\_{Σ\_0}K\_0^Σ)\_{A,ρ̄} ≅ (Ĥ^1(K\_{Σ\_0})\_{A,ρ̄})^{K\_p}; (d) H^1\_{O/ϖ^s,ρ̄,Σ} is an admissible smooth G × G\_{Σ\_0}-representation over O/ϖ^s; (e) (Ĥ^1\_{E,ρ̄,Σ})^{K\_p} is finitely generated over E[G\_{Σ\_0}] and (H^1\_{k,ρ̄,Σ})^{K\_p} over k[G\_{Σ\_0}].

*Hypotheses and conventions.*

- ρ̄ absolutely irreducible and modular; Σ ∋ p contains the primes where ρ̄ ramifies.
- (e) uses that the prime-to-p conductors of modular lifts unramified outside Σ are bounded (Carayol, Livné) and that the p-part of the conductor is bounded by K\_p.

*Proof sketch.*

1. The ρ̄-part is the residual summand of CompletedCohomologyPartII:CC.8/completed-residual-localisation at the label m, identified with Emerton’s T(K\_{Σ\_0})\_ρ̄ ⊗ (−) by R31.3/completed-hecke-algebra-of-the-modular-tower; localisation commutes with the limits (CC.8/localisation-limit-support-dual-compatibility), giving (a) from (5.1.2) (EM11 (5.3.3)–(5.3.4)).
2. (b): a direct summand of a ϖ-adically admissible representation is admissible, and the m-power torsion statement follows from (a) (EM11 Lemma 5.3.5).
3. (c): rational part from EM06 Proposition 2.2.13 and (4.3.4) (EM11 Lemma 5.3.6); integral part is R31.1/non-eisenstein-boundary-and-injectivity(b) (EM11 Lemma 5.3.8, Remark 5.3.10).
4. (d) from (c) and finiteness at fixed level (EM11 Proposition 5.3.11); (e) from boundedness of conductors, finiteness of classical lifts of bounded conductor in weight two, and R31.2/locally-algebraic-vectors-of-completed-cohomology (EM11 Proposition 5.3.13, Corollary 5.3.14).

*Checks.*

- The G\_Q × G × G\_{Σ\_0}-actions on Ĥ^1\_{O,ρ̄,Σ} commute with each other and with T\_{ρ̄,Σ}.
- For K\_p = GL\_2(Z\_p), (c) recovers H^1(GL\_2(Z\_p)K\_{Σ\_0}K\_0^Σ)\_{O,ρ̄}, the weight-two level-prime-to-p cohomology localised at ρ̄.

*Needs:* §R31.3/completed-hecke-algebra-of-the-modular-tower; §R31.1/non-eisenstein-boundary-and-injectivity; §R31.2/locally-algebraic-vectors-of-completed-cohomology; CompletedCohomologyPartII:CC.8/completed-residual-localisation; CompletedCohomologyPartII:CC.8/localisation-limit-support-dual-compatibility; mathlib:Module.Finite.

*Sources.*

- EM11, Definitions 5.3.1–5.3.2 and (5.3.3)–(5.3.4), p. 49; Lemmas 5.3.5–5.3.6, pp. 49–50; Proposition 5.3.11, Proposition 5.3.13, Corollary 5.3.14, pp. 51–52: The ρ̄-part of completed cohomology at allowable levels and in the limit, its reduction mod ϖ^s, ϖ-adic admissibility over T\_{ρ̄,Σ}, recovery of finite levels as invariants, admissibility of the torsion objects, and finite generation over the group ring of G\_{Σ\_0}.

### Galois factorisation of completed cohomology

*Theorem* `R31.3/galois-factorisation-of-completed-cohomology` — planet: Galois factorisation of completed cohomology

Let ρ̄ be absolutely irreducible and modular, U\_Σ = Hom\_{T\_{ρ̄,Σ}[G\_Q]}(ρ^m\_Σ, Ĥ^1\_{O,ρ̄,Σ}) with its G × G\_{Σ\_0}-action. (a) The evaluation map ρ^m\_Σ ⊗\_{T\_{ρ̄,Σ}} U\_Σ → Ĥ^1\_{O,ρ̄,Σ} is a T\_{ρ̄,Σ}[G\_Q × G × G\_{Σ\_0}]-linear isomorphism, and reducing mod ϖ and taking m-torsion gives ρ̄ ⊗\_k (U\_Σ/ϖ)[m] ≅ H^1\_{k,ρ̄,Σ}[m]. (b) (Eichler–Shimura in families) Let ρ: G\_Q → GL\_2(E) be continuous, absolutely irreducible, unramified outside Σ, K\_{Σ\_0} ⊂ G\_{Σ\_0} compact open and 𝔭 the ideal of T(K\_{Σ\_0})[1/p] generated by T\_ℓ − tr ρ(Frob\_ℓ), ℓ ∉ Σ. Then Hom\_{E[G\_Q]}(ρ, Ĥ^1(K\_{Σ\_0})\_E[𝔭]) = Hom\_{E[G\_Q]}(ρ, Ĥ^1(K\_{Σ\_0})\_E); in particular if Hom\_{E[G\_Q]}(ρ, Ĥ^1\_{E,Σ}) ≠ 0 then ρ is promodular, and for every closed point 𝔭 ∈ Spec T\_{ρ̄,Σ}[1/p] the inclusions Hom(ρ(𝔭), Ĥ^1\_{E,ρ̄,Σ}[𝔭]) ⊂ Hom(ρ(𝔭), Ĥ^1\_{E,ρ̄,Σ}) ⊂ Hom(ρ(𝔭), Ĥ^1\_{E,Σ}) are equalities. (c) In Pan’s formulation: for λ: T(K^p) → Q̄\_p with ρ\_λ irreducible, Ĥ^1(K^p, Q̄\_p)[𝔭\_λ] ≅ ρ\_λ(−1) ⊗ Hom\_{G\_Q}(ρ\_λ(−1), Ĥ^1(K^p, Q̄\_p)), where the twist matches Pan’s normalisation of the determinant.

*Hypotheses and conventions.*

- (a) needs ρ̄ absolutely irreducible; (b) needs ρ absolutely irreducible but no residual hypothesis.
- The twist (−1) in (c) is the conversion between Emerton’s and Pan’s normalisations of the Galois action on H^1 (Pan II §7.1.4); no new statement is made.

*Proof sketch.*

1. (a): the invariants of both sides at an allowable K\_{Σ\_0} are the finite-level spaces (R31.3/rho-bar-part-and-commuting-actions(c)); after inverting p the map has dense image because at classical points the locally algebraic vectors are sums of copies of ρ(𝔭) (R31.2/locally-algebraic-vectors-of-completed-cohomology) and these are dense (R31.2/density-of-algebraic-vectors); both sides are admissible, so the image is closed (Schneider–Teitelbaum), hence surjective; injectivity mod ϖ on m-torsion holds since ρ̄ ⊗ Hom(ρ̄, −) → (−) is injective for absolutely irreducible ρ̄; conclude by EM11 Lemma 3.1.6 (EM11 Proposition 5.5.3, Corollary 5.5.9; the finite-level analogue is Carayol’s Theorem 4).
2. (b): Frob\_ℓ ↦ ℓS\_ℓ extends to a continuous character of G\_{Q,Σ}; the Eichler–Shimura relation on H^1 gives ρ(Frob\_ℓ)(v) ⊗ (T\_ℓ − tr ρ(Frob\_ℓ))u + v ⊗ (ℓS\_ℓ − det ρ(Frob\_ℓ))u = 0 on ρ ⊗ U; at non-scalar ρ(Frob\_ℓ) both factors vanish, Chebotarev extends to all ℓ ∉ Σ (EM11 Proposition 6.1.12, Remark 6.1.15, Corollary 6.1.16).
3. (c) is (b) rewritten with Pan’s twist (LocallyAnalyticCompletedCohomology request, citing Pan I §6.1.1 and Pan II §7.1.4).

*Checks.*

- For ρ = V\_f attached to a newform f of tame level K\_{Σ\_0}, Hom(V\_f, Ĥ^1(K\_{Σ\_0})\_E) is the 𝔭\_f-part and is nonzero.
- Non-example: for reducible ρ = ψ\_1 ⊕ ψ\_2 the Eichler–Shimura argument gives no equality, since ρ(Frob\_ℓ) acts on the span of an eigenvector by a scalar.

*Needs:* §R31.3/rho-bar-part-and-commuting-actions; §R31.3/hecke-galois-determinant-and-representation; §R31.2/locally-algebraic-vectors-of-completed-cohomology; §R31.2/density-of-algebraic-vectors; CompletedCohomologyPartII:CC.5/banach-admissibility; AutomorphicGaloisRepresentations:R19.1/geometric-construction-and-the-eichler-congruence-relation.

*Sources.*

- EM11, §5.5, (5.5.1)–(5.5.2), Proposition 5.5.3, Corollary 5.5.9, Remarks 5.5.10–5.5.11, pp. 56–58: The Galois action factors out of the ρ̄-part: Ĥ^1\_{O,ρ̄,Σ} ≅ ρ^m\_Σ ⊗ U\_Σ, proved by density at classical points, closedness of images of admissible maps, and injectivity mod ϖ on m-torsion.
- EM11, Proposition 6.1.12 and its proof, p. 68; Remark 6.1.15 and Corollary 6.1.16, p. 69: For absolutely irreducible ρ, every G\_Q-map from ρ into Ĥ^1(K\_{Σ\_0})\_E lands in the 𝔭-eigenspace (Eichler–Shimura relations); nonvanishing forces promodularity.

### Classical points and their Zariski density

*Theorem* `R31.3/classical-points-and-zariski-density`

Let ρ̄ be absolutely irreducible and modular. A closed point 𝔭 ∈ Spec T\_{ρ̄,Σ}[1/p] is classical if its eigensystem is that of a classical cuspform of weight k ≥ 2; C ⊂ Spec T\_{ρ̄,Σ}[1/p] is the set of classical points whose Galois representations are crystalline at p, and C(K\_{Σ\_0}) its analogue at level K\_{Σ\_0}. A closed point is allowable if it is classical and ρ(𝔭)|G\_{Q\_p} is crystabelline, absolutely irreducible and not exceptional (not a twist of a crystalline representation with non-semisimple Frobenius on its Dieudonné module). Then: (a) ⊕\_{𝔭∈C(K\_{Σ\_0})} Ĥ^1(K\_{Σ\_0})\_{E,ρ̄}[𝔭]\_{l.alg} is dense in Ĥ^1(K\_{Σ\_0})\_{E,ρ̄}, and ⊕\_{𝔭∈C} Ĥ^1\_{E,ρ̄,Σ}[𝔭]\_{l.alg} is dense in Ĥ^1\_{E,ρ̄,Σ}; (b) C is Zariski dense in Spec T\_{ρ̄,Σ}; (c) the allowable points are Zariski dense in Spec T(K\_{Σ\_0})\_ρ̄ and in Spec T\_{ρ̄,Σ}; (d) for each compact open K\_p, T\_{ρ̄,Σ} → T(K\_pK\_{Σ\_0}K\_0^Σ)\_ρ̄ is surjective and the classical points of weight two and level K\_p are the closed points of Spec T(K\_pK\_{Σ\_0})\_ρ̄[1/p].

*Hypotheses and conventions.*

- Absolutely irreducible modular ρ̄.
- (c) uses the eigencurve to deform a non-allowable classical point to allowable ones; the identification of classical points with prime-to-p conductor and crystalline points is Saito’s theorem.

*Proof sketch.*

1. (a): by R31.2/density-of-algebraic-vectors the GL\_2(Z\_p)-algebraic vectors are dense; their E[G]-span is the sum of the locally algebraic parts at classical points of prime-to-p conductor, which by Saito’s theorem are exactly C(K\_{Σ\_0}) (EM11 Corollary 5.4.5).
2. (b): an element t ∈ ∩\_{𝔭∈C} 𝔭 kills a dense subspace, hence Ĥ^1\_{E,ρ̄,Σ}, and T\_{ρ̄,Σ} acts faithfully, so t = 0 (EM11 Corollary 5.4.6).
3. (c): every point of C(K\_{Σ\_0}) is a limit of allowable points along the eigencurve; combine with (b) and the eventual isomorphism T(K\_{Σ\_0})\_ρ̄ ≅ T\_{ρ̄,Σ} (EM11 Definition 5.4.7, Lemma 5.4.9).
4. (d) is the surjectivity of R31.3/completed-hecke-algebra-of-the-modular-tower onto each finite level and R31.2/classical-eigensystems-in-completed-cohomology.

*Checks.*

- The point of the weight-two newform of level 11 at p = 3 is classical and crystalline (good reduction at 3), hence in C.
- Non-example: a classical point of weight 2 with Steinberg local component at p is classical but not in C.

*Needs:* §R31.2/density-of-algebraic-vectors; §R31.2/classical-eigensystems-in-completed-cohomology; §R31.3/rho-bar-part-and-commuting-actions; §R31.3/completed-hecke-algebra-of-the-modular-tower; AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime; mathlib:PrimeSpectrum.zeroLocus.

*Sources.*

- EM11, Definitions 5.2.8, 5.4.4, 5.4.7; Corollaries 5.4.5–5.4.6; Remark 5.4.8; Lemma 5.4.9, pp. 48, 55–56: Classical, crystalline and allowable closed points of Spec T\_{ρ̄,Σ}[1/p]; density of the locally algebraic eigenspaces at crystalline classical points; Zariski density of C and of the allowable points.
- EM11, Definition 3.3.18, p. 27: A representation is exceptional if it is a twist of a crystalline representation whose Frobenius on the Dieudonné module has a double root.

### Hecke algebra of the definite quaternionic tower

*Construction* `R31.3/definite-quaternionic-hecke-algebra` — planet: Definite quaternionic Hecke algebra

In the setting of R31.1/definite-quaternionic-completed-module, fix a finite set S of places containing those above p, the infinite places and those where U^p or D ramify, and let T\_S^{univ} = O[T\_v, S\_v]\_{v∉S} (T\_v, S\_v the double cosets of diag(ϖ\_v, 1) and diag(ϖ\_v, ϖ\_v)). The big Hecke algebra is T\_ψ(U^p) = lim\_{(n,U\_p)} T\_ψ(U^pU\_p, O/ϖ^n), the limit over pairs with ψ ≡ 1 mod ϖ^n on U\_p ∩ O\_{F,p}^×, of the images of T\_S^{univ} in End(S\_ψ(U^pU\_p, O/ϖ^n)); equivalently, for F = Q without central character, T̃\_Σ = lim\_{K\_p} T̃\_Σ(K\_p) is the weak closure of the image of T\_S^{univ} in End^cont\_O(C^0(X, O)), each T̃\_Σ(K\_p) being finite free over O. It acts faithfully on S\_ψ(U^p) and M\_ψ(U^p), commuting with D\_p^×; it is independent of S; for U\_p pro-p the map T\_ψ(U^p) → T\_ψ(U^pU\_p, k) is a bijection on maximal ideals, so T\_ψ(U^p) ≅ ∏\_{i=1}^r T\_ψ(U^p)\_{m\_i} with each factor m\_i-adically complete and separated, and S\_ψ(U^p) ≅ ⊕\_i S\_ψ(U^p)\_{m\_i}. A continuous r: G\_{Q,Σ} → GL\_2(R) is associated with a continuous φ: T̃\_Σ → R if det(X − r(Frob\_ℓ)) = X^2 − φ(T\_ℓ)X + ℓφ(S\_ℓ) for all ℓ ∉ Σ, and r̄: G\_{Q,Σ} → GL\_2(k) is modular of tame level K^p if it is associated with T̃\_Σ → T̃\_Σ/m for a maximal ideal m with residue field k (DLB Définition 5.2). For m with residual representation absolutely irreducible on G\_{Q\_p} (DLB’s hypothesis), A = T̃\_{Σ,m} is a flat local noetherian reduced O-algebra with residue field k, a direct factor of T̃\_Σ, and for a T̃\_Σ-module M, M\_m = A ⊗\_{T̃\_Σ} M is a direct factor of M (DLB Définition 5.3).

*Hypotheses and conventions.*

- D definite, split above p; p splits completely in F.
- DLB assert the properties of A (flat, local, noetherian, reduced) without proof; noetherianity is used in R31.4 and follows from the surjection of a universal (pseudo)deformation ring onto A (R31.3/deformation-to-hecke-surjection in the quaternionic form).

*API.*

- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra` (constructor): T\_ψ(U^p) = lim\_{(n,U\_p)} T\_ψ(U^pU\_p, O/ϖ^n), acting faithfully on S\_ψ(U^p).
- `TauCeti.DefiniteQuaternionCompleted.heckeClosure` (constructor): The topological closure of the subalgebra generated by a set of operators in a topological algebra of operators.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_weakClosure` (characterisation): For F = Q and no central character, T̃\_Σ is the weak closure of the image of T\_S^{univ} in End^cont\_O(C^0(X, O)).
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_semilocal` (structure): T\_ψ(U^p) ≅ ∏\_i T\_ψ(U^p)\_{m\_i}, and S\_ψ(U^p) ≅ ⊕\_i S\_ψ(U^p)\_{m\_i}.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_maxIdeal_bijection` (characterisation): For U\_p pro-p, T\_ψ(U^p) → T\_ψ(U^pU\_p, k) is a bijection on maximal ideals.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_independent` (relation): T\_ψ(U^p) does not depend on the finite set S.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_commutes` (compatibility): T\_ψ(U^p) commutes with the D\_p^×-action.
- `TauCeti.DefiniteQuaternionCompleted.localHeckeAlgebra` (constructor): A = T̃\_{Σ,m}, a direct factor of T̃\_Σ, flat local noetherian reduced with residue field k, when ρ̄\_m|G\_{Q\_p} is absolutely irreducible.

*Unit tests.*

- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_finiteLevel` (computation): T̃\_Σ(K\_p) is finite free over O of rank at most the O-rank of C(X(K\_p), O) = number of points of X(K\_p).
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_eisenstein` (characterisation): On the functions factoring through the reduced norm, T\_v acts by 1 + N(v) times the norm character; the corresponding maximal ideal is Eisenstein (residual 1 ⊕ ε̄ up to twist).
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_compatibility` (compatibility): T\_ψ(U^p) is the CompletedCohomologyPartII:CC.8/completed-hecke-algebra of the degree-zero quaternionic tower.
- `TauCeti.DefiniteQuaternionCompleted.heckeAlgebra_not_finite_level` (non-example): T\_ψ(U^p)\_m is not a finite O-algebra in general (its components have dimension at least 1 + 2[F : Q], Pan Theorem 3.6.1), while each T\_ψ(U^pU\_p, O)\_m is.

*Uses.*

- PAN, Theorem 3.5.5 and Corollary 3.5.10: T\_ψ(U^p)\_m acts on the block multiplicity module m and is finite over the local pseudo-deformation ring.
- DLB, Théorème 5.4 and §13: A acts on C^0(X)\_m, and Π(𝔭) is attached to r(𝔭)|G\_{Q\_p} for 𝔭 ∈ MaxSpec A[1/p].
- TUNG-2, §4.2–4.6: T^S\_ψ(U^p)\_m receives the global deformation ring and is patched.
- GL2ModularityLifting:R32.4/nice-prime: Pan’s nice primes are primes of T\_m (input CC2).

*Proof sketch.*

1. The big Hecke algebra is the CompletedCohomologyPartII:CC.8/completed-hecke-algebra of the finite discrete tower of R31.1/definite-quaternionic-completed-module; the finite images are commutative finite O-algebras (R18.3).
2. Semilocality: a maximal ideal of the Artinian ring T\_ψ(U^pU\_p′, O/ϖ^n) has a nonzero eigenspace on which the p-group U\_p/U\_p′ has a fixed vector, so it is a maximal ideal at level U\_p mod ϖ; Artinian rings are products of their localisations; pass to the limit (Pan Proposition 3.3.6, Corollary 3.3.7; Gee–Newton Lemma 2.1.14; CC.8/completed-semilocal-product). The m\_i-adic completeness and separatedness of each factor is Pan’s Corollary 3.3.7(1), proved from the Artinian decomposition at each finite level; CC.8 alone asserts only the finite-image topology.
3. Independence of S: twisting by a character reduces to finite-order ψ, where the pseudo-representation over T\_ψ(U, O/ϖ^n) is classical (Pan 3.3.3).
4. For DLB’s A: reducedness from semisimplicity of the finite-level Hecke action on S(U, E), flatness since A ⊂ End(C^0(X, O)\_m) is torsion-free, noetherianity from the surjection of the deformation ring of r̄ (absolutely irreducible) onto A.

*Checks.*

- For F = Q, B̄ of discriminant 2 and p = 3, T̃\_Σ(GL\_2(Z\_3)) is the Hecke algebra of weight-two forms on B̄^\*, isomorphic under Jacquet–Langlands to the 2-new quotient of the weight-two Hecke algebra of level Γ\_0(2·N).
- Non-example: without the closure, the image of T\_S^{univ} in End(C^0(X, O)) is not complete and does not contain the idempotents of its maximal ideals.

*Needs:* §R31.1/definite-quaternionic-completed-module; CompletedCohomologyPartII:CC.8/completed-hecke-algebra; CompletedCohomologyPartII:CC.8/completed-semilocal-product; HilbertModularVarietiesAndShimuraCurves:R18.3/residual-hecke-ideal; HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation; GlobalGaloisDeformations:R04.2/universal-deformation-ring; mathlib:Subalgebra.topologicalClosure; mathlib:IsReduced.

*Sources.*

- PAN, Definition 3.3.4, 3.3.5, Proposition 3.3.6, Corollary 3.3.7, p. 24: The definite quaternionic big Hecke algebra T\_ψ(U^p) as a limit of finite-level Hecke algebras, faithful on S\_ψ(U^p), with a pseudo-representation, semilocal with product decomposition.
- DLB, §5.1, p. 25; Définition 5.3, p. 25: The spherical Hecke algebras at ℓ ∉ Σ, T\_Σ, T̃\_Σ(K\_p) free of finite type over O, T̃\_Σ the weak closure in End^cont(C^0(X, O)), compact reduced commutative; A the m-adic completion, flat local noetherian reduced, a direct factor.
- TUNG-2, Lemma 4.2.4, p. 19: T^S\_ψ(U^p) is profinite with finitely many maximal ideals, J-adically complete, and the product of its localisations.

### Eisenstein localisation and pro-modular primes

*Construction* `R31.3/eisenstein-localisation-and-pro-modular-primes` — planet: Pro-modular primes

Fix Pan’s §4.1 data: p odd; F totally real of even degree in which p splits completely; S ⊇ Σ\_p finite with N(v) ≡ 1 mod p for v ∈ S∖Σ\_p; χ: G\_{F,S} → O^× totally odd, unramified outside p, with χ(Frob\_v) ≡ 1 mod ϖ for v ∈ S∖Σ\_p; characters ξ\_v of p-power order of the tame inertia at v ∈ S∖Σ\_p; ψ, U^p and a character ξ of U^p as in Pan §3.7 (the variant with p-power tame characters). Assume (Pan’s Assumption in §4.1) that T\_v − (1 + χ(Frob\_v)) for v ∉ S and ϖ generate a maximal ideal m of the variant Hecke algebra T = T\_{ψ,ξ}(U^p) (the Eisenstein maximal ideal), and write T\_m for the localisation. Then: (a) there is a natural two-dimensional pseudo-representation T\_m: G\_{F,S} → T\_m lifting 1 + χ̄ with determinant χ and Frob\_v ↦ T\_v (v ∉ S); (b) the universal map R^{ps} → T\_m from the universal pseudo-deformation ring of 1 + χ̄ with determinant χ is surjective and factors through R^{ps,{ξ\_v}}; (c) a prime q ∈ Spec R^{ps,{ξ\_v}} is pro-modular if it is the contraction of a prime of T\_m, equivalently if ker(R^{ps,{ξ\_v}} → T\_m) ⊆ q; the pro-modular primes form the closed subset V(ker) of Spec R^{ps,{ξ\_v}}, so they are closed under specialisation; (d) for q ∈ Spec T\_m, ρ(q): G\_{F,S} → GL\_2(k(q)) denotes the semisimple representation with trace T\_m mod q; (e) T\_m ≠ 0, i.e. m is a proper maximal ideal, whenever the Eisenstein maximal ideal exists for the ordinary quotient (Pan Proposition 5.6.1, an input recorded as a gap). This is a different carrier from the ordinary pro-modular primes of OrdinaryAutomorphicFormsAndModularityLifting R21.4.

*Hypotheses and conventions.*

- Pan’s §4.1 standing assumptions; p = 3 needs the additional local exclusion χ̄|G\_{F\_v} ≠ ω^{±1} wherever Theorem 4.1.7 is used.
- The definite quaternion algebra is split at all finite places when [F : Q] is even, which Pan arranges by base change.
- The existence of the Eisenstein maximal ideal (Pan Proposition 5.6.1, from Skinner–Wiles Proposition 3.18 and Eisenstein congruences under ord\_ϖ L\_p(F, −1, χ̄ω̃) > 0) is not planned here; see the gap ‘Eisenstein maximal ideal for the ordinary Hilbert Hecke algebra’.

*API.*

- `TauCeti.DefiniteQuaternionCompleted.eisensteinIdeal` (constructor): The ideal of T\_{ψ,ξ}(U^p) generated by ϖ and T\_v − (1 + χ(Frob\_v)), v ∉ S.
- `TauCeti.DefiniteQuaternionCompleted.eisensteinPseudoRep` (constructor): The pseudo-representation T\_m: G\_{F,S} → T\_m with determinant χ lifting 1 + χ̄.
- `TauCeti.DefiniteQuaternionCompleted.psToHecke` (data): The surjection R^{ps,{ξ\_v}} → T\_m.
- `TauCeti.DefiniteQuaternionCompleted.IsProModular` (other): q ∈ Spec R^{ps,{ξ\_v}} is pro-modular iff ker(R^{ps,{ξ\_v}} → T\_m) ⊆ q.
- `TauCeti.DefiniteQuaternionCompleted.IsProModular.of_le` (relation): Pro-modularity passes to larger primes (closure under specialisation).
- `TauCeti.DefiniteQuaternionCompleted.isProModular_iff_comap` (characterisation): q is pro-modular iff q is the contraction of a prime of T\_m.
- `TauCeti.DefiniteQuaternionCompleted.semisimpleAtPrime` (constructor): ρ(q): G\_{F,S} → GL\_2(k(q)), the semisimple representation with trace T\_m mod q.

*Unit tests.*

- `TauCeti.DefiniteQuaternionCompleted.IsProModular_maximal` (computation): The maximal ideal of R^{ps,{ξ\_v}} is pro-modular when T\_m ≠ 0 (it contracts from m).
- `TauCeti.DefiniteQuaternionCompleted.IsProModular_kernel` (computation): A prime equal to the kernel of R^{ps,{ξ\_v}} → T\_m is pro-modular; it is the generic point of the closed image.
- `TauCeti.DefiniteQuaternionCompleted.IsProModular_zero_hecke` (degenerate): If T\_m = 0 the kernel is the unit ideal and no prime is pro-modular.
- `TauCeti.DefiniteQuaternionCompleted.IsProModular_compatibility` (compatibility): q is pro-modular iff q lies in the image of Spec T\_m → Spec R^{ps,{ξ\_v}} (Mathlib’s comap of the surjection).
- `TauCeti.DefiniteQuaternionCompleted.IsProModular_not_ordinary` (non-example): The ordinary pro-modular primes of OrdinaryAutomorphicFormsAndModularityLifting:R21.4/pro-modular-prime live on a different ring (an ordinary representation deformation ring) and are not identified with these.

*Uses.*

- PAN, Theorem 4.1.7 and Corollary 4.1.8: The nilpotence of the kernel at a nice prime shows the component through it is pro-modular.
- GL2ModularityLifting:R32.4/nice-prime and R32.4/nice-prime-component-bridge: Pan’s pro-modular primes as containment of the kernel, closed under specialisation (input CC2).
- GL2ModularityLifting:R32.4/potentially-nice-base-change: After solvable base change the determinant-fixed problem has a nonzero completed Hecke quotient.

*Proof sketch.*

1. (a) is R31.3/hecke-galois-determinant-and-representation(c) for the variant algebra T\_{ψ,ξ}(U^p) (Pan 3.7.2 deduces the variant from the untwisted case through the kernel of ξ).
2. (b) is R31.3/deformation-to-hecke-surjection(b).
3. (c) is the definition of pro-modularity (Pan 4.1.3, last paragraph) recast as membership in the closed set V(ker(R^{ps,{ξ\_v}} → T\_m)); closure under specialisation is closedness.
4. (d): over a field, a pseudo-representation is the trace of a unique semisimple representation (IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction).

*Checks.*

- Pro-modularity is stable under specialisation: if q is pro-modular and q ⊆ q′ then q′ is pro-modular.
- Non-example: a prime of R^{ps} not containing the kernel, e.g. a characteristic-zero point whose pseudo-representation is not congruent to an automorphic one at the level, is not pro-modular even if its residual pseudo-representation is 1 + χ̄.

*Needs:* §R31.3/definite-quaternionic-hecke-algebra; §R31.3/deformation-to-hecke-surjection; §R31.3/hecke-galois-determinant-and-representation; IntegralHeckeAndGaloisDeterminants:IHG.1/universal-reductive-pseudocharacter-ring; IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction; IntegralHeckeAndGaloisDeterminants:IHG.1/reducibility-ideal; mathlib:PrimeSpectrum.zeroLocus; mathlib:RingHom.ker.

*Sources.*

- PAN, §4.1, Assumption and 4.1.3, pp. 37–38: Pan’s setup for the residually reducible case: the Eisenstein maximal ideal of the variant Hecke algebra, the pseudo-representation T\_m with determinant χ, the surjection R^{ps} → T\_m factoring through R^{ps,{ξ\_v}}, and the definition of pro-modular primes.
- PAN, §3.7.1–3.7.2, p. 37: The variant completed homology M\_{ψ,ξ}(U^p) and Hecke algebra T\_{ψ,ξ}(U^p) with p-power tame characters, needed for Taylor’s Ihara avoidance.
- PAN, Proposition 5.6.1 and Remark 5.6.2, p. 86: Existence of the Eisenstein maximal ideal of the ordinary Hecke algebra under a p-adic L-value condition, generalising Skinner–Wiles Proposition 3.18.

## R31.4. p-adic local–global compatibility

<a id="r31-4"></a>

Kisin's deformation-theoretic form of the p-adic local Langlands correspondence turns ρ^m\_Σ|G\_{Q\_p} into a deformation π^m\_Σ of Colmez's π̄ over T\_{ρ̄,Σ}; Emerton–Helm's co-Whittaker families give π\_{Σ₀}(ρ^m\_Σ) away from p, whose fibres are the expected local representations by a p-adic form of Mazur's principle. The multiplicity module X(θ) of continuous maps ρ^m ⊗ θ → Ĥ¹\_{O,ρ̄,Σ} is coadmissible, and Emerton's criterion — X(θ) faithful and the evaluation map injective modulo (ϖ, m) — proves the refined compatibility ρ^m ⊗ π^m ⊗̃ π\_{Σ₀}(ρ^m) ≅ Ĥ¹\_{O,ρ̄,Σ} for p-distinguished ρ̄, hence Theorem 1.2.1 with its two different residual hypotheses, the mod p Theorem 1.2.6 for p > 2, and Nakamura's dual description of completed homology. The isomorphism of locally algebraic vectors alone is never used as the Banach statement.

For the definite quaternion algebra over Q, Dospinescu–Le Bras's appendix writes out Emerton's argument: weak compatibility at a dense set of classical crystalline points via Berger–Breuil, then an evaluation isomorphism (Π^univ ⊗̂ M)[1/p] ≅ C⁰(X)\_m. Over a totally real field Pan proves the semisimple version — the Galois and automorphic actions of the local pseudo-deformation ring on the block multiplicity module agree — which yields finiteness, faithfulness and classicality. Scholze's functor transports completed cohomology of Shimura curves to the definite side (Colmez–Dospinescu–Nizioł); this is conditional on the functor's owner.

### Local Langlands families over the completed Hecke algebra

*Construction* `R31.4/local-langlands-families-over-the-hecke-algebra` — planet: Local Langlands families over T

Let ρ̄ be absolutely irreducible and modular with ρ̄\_p = ρ̄|G\_{Q\_p} satisfying Assumption 3.3.1 (ρ̄\_p is not a twist of an extension of ε̄ by the trivial character, split or not). (a) Let π̄ be the finite-length admissible smooth k-representation of G = GL\_2(Q\_p) attached to ρ̄\_p by Colmez (MF(π̄) ≅ ρ̄\_p, central character det(ρ̄\_p)ε̄, no finite-dimensional subobject or quotient). There is a deformation π^m\_Σ of π̄ to an admissible G-representation on an orthonormalizable T\_{ρ̄,Σ}-module, unique up to isomorphism, with MF(π^m\_Σ) ≅ ρ^m\_Σ|G\_{Q\_p} and central character det(ρ^m\_Σ|G\_{Q\_p})ε; for 𝔭 ∈ Spec T\_{ρ̄,Σ}, π(𝔭)° = π^m\_Σ/𝔭 and π(𝔭) = κ(𝔭) ⊗ π^m\_Σ, and at closed points π(𝔭) = B(ρ(𝔭)|G\_{Q\_p}). (b) For ℓ ∈ Σ\_0 there is a unique smooth admissible T\_{ρ̄,Σ}-representation π^m\_ℓ of GL\_2(Q\_ℓ) which is T\_{ρ̄,Σ}-torsion-free, co-Whittaker, and at each minimal prime a has κ(a) ⊗ π^m\_ℓ ≅ π̃(ρ^m\_Σ|G\_{Q\_ℓ} ⊗ κ(a)) (the smooth contragredient of the generic local Langlands representation); π̃^m\_{Σ\_0} is the maximal torsion-free quotient of ⊗\_{ℓ∈Σ\_0} π̃^m\_ℓ and π^m\_{Σ\_0} its contragredient, a coadmissible T\_{ρ̄,Σ}[G\_{Σ\_0}]-module; this is Emerton’s π\_{Σ\_0}(ρ^m\_Σ), which exists, and for p > 2 satisfies (π\_{Σ\_0}(ρ^m\_Σ)/ϖ)[m] ≅ ⊗\_{ℓ∈Σ\_0} π(ρ̄|G\_{Q\_ℓ}) (mod p local Langlands of Emerton–Helm). (c) Φ\_{Σ\_0}(π^m\_{Σ\_0}) ≅ T\_{ρ̄,Σ} for the composite of the Kirillov (top derivative) functors, and End\_{T\_{ρ̄,Σ}[G\_{Σ\_0}]}(M ⊗ π^m\_{Σ\_0}) = End(M) for every T\_{ρ̄,Σ}-module M.

*Hypotheses and conventions.*

- Assumption 3.3.1 on ρ̄\_p is needed for Colmez’s π̄ and Kisin’s equivalence; when End(ρ̄\_p) ≠ k, Def(π̄) is not representable and π^m\_Σ is defined through the subfunctor Def^\*(π̄) ↪ Def(ρ̄\_p).
- In (b) the residue characteristic of the coefficients is p ≠ ℓ; the p = 2 mod-p statement is weaker (EM11 Remark 6.1.3: an embedding, an isomorphism when ρ̄|G\_{Q\_ℓ} is non-scalar).
- ρ^m\_Σ|G\_{Q\_p} lies in Def^{crys}(ρ̄\_p) because crystalline points are Zariski dense (R31.3/classical-points-and-zariski-density); this is what makes Kisin’s equivalence applicable.

*API.*

- `TauCeti.LocalGlobalCompatibility.colmezResidual` (data): π̄, the admissible smooth k[G]-representation with MF(π̄) ≅ ρ̄\_p (imported from R30.3).
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP` (constructor): π^m\_Σ, the deformation of π̄ over T\_{ρ̄,Σ} with MF(π^m\_Σ) ≅ ρ^m\_Σ|G\_{Q\_p} and central character det(ρ^m\_Σ|G\_{Q\_p})ε.
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP_fibre` (compatibility): κ(𝔭) ⊗ π^m\_Σ ≅ B(ρ(𝔭)|G\_{Q\_p}) at closed points 𝔭 of Spec T\_{ρ̄,Σ}[1/p].
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP_unique` (extensionality): π^m\_Σ is unique up to isomorphism among deformations of π̄ with the given MF and central character.
- `TauCeti.LocalGlobalCompatibility.localFamilyAway` (constructor): π^m\_ℓ for ℓ ∈ Σ\_0 and π^m\_{Σ\_0} = (maximal torsion-free quotient of ⊗ π̃^m\_ℓ)^∼, a coadmissible co-Whittaker T\_{ρ̄,Σ}[G\_{Σ\_0}]-module.
- `TauCeti.LocalGlobalCompatibility.localFamilyAway_minimalPrime` (characterisation): At each minimal prime a, κ(a) ⊗ π̃^m\_ℓ ≅ π̃(ρ^m\_Σ|G\_{Q\_ℓ} ⊗ κ(a)).
- `TauCeti.LocalGlobalCompatibility.localFamilyAway_modp` (compatibility): For p > 2, (π^m\_{Σ\_0}/ϖ)[m] ≅ ⊗\_{ℓ∈Σ\_0} π(ρ̄|G\_{Q\_ℓ}).
- `TauCeti.LocalGlobalCompatibility.localFamilyAway_endomorphisms` (relation): End\_{T[G\_{Σ\_0}]}(M ⊗\_T π^m\_{Σ\_0}) = End\_T(M) for every T\_{ρ̄,Σ}-module M.

*Unit tests.*

- `TauCeti.LocalGlobalCompatibility.localFamilyAway_empty` (degenerate): For Σ\_0 = ∅, π^m\_{Σ\_0} = T\_{ρ̄,Σ} with trivial action.
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP_residue` (computation): π^m\_Σ/m\_T ≅ π̄; for ρ̄\_p absolutely irreducible, π̄ is a supersingular irreducible representation and π^m\_Σ is topologically irreducible at every closed point with ρ(𝔭)|G\_{Q\_p} irreducible.
- `TauCeti.LocalGlobalCompatibility.localFamilyAway_compatibility` (compatibility): π^m\_ℓ is the co-Whittaker family of SmoothRepresentationsOfLocalGroups SR.5 attached to ρ^m\_Σ|G\_{Q\_ℓ}.
- `TauCeti.LocalGlobalCompatibility.localFamilyAtP_not_classical` (non-example): π(𝔭) is a Banach representation, not the smooth local Langlands representation π\_p(ρ(𝔭)); its locally algebraic vectors recover the latter only for de Rham ρ(𝔭) with distinct weights.

*Uses.*

- EM11, Conjecture 6.1.6 and Theorem 6.2.13: ρ^m\_Σ ⊗ π^m\_Σ ⊗̃ π\_{Σ\_0}(ρ^m\_Σ) is the source of the refined local–global isomorphism.
- NAK, Theorem 2.2 and Corollary 2.5: The same three families give the dual description of completed Borel–Moore homology.
- R31.4/multiplicity-module: θ ranges over deformations of π̄ such as π^m\_Σ.

*Proof sketch.*

1. (a): Colmez’s Theorem (EM11 Theorem 3.3.2) gives π̄; Kisin’s Theorem (EM11 Theorem 3.3.13) gives a fully faithful Def^\*(π̄) ↪ Def(ρ̄\_p) restricting to an equivalence Def^{crys}(π̄) ≅ Def^{crys}(ρ̄\_p); apply it to ρ^m\_Σ|G\_{Q\_p}, which is in Def^{crys} by density of crystalline points (EM11 §6.1 first paragraphs) — these local inputs are requested from PadicLocalLanglandsForGL2Qp R30.3 and R30.5.
2. π(𝔭) = B(ρ(𝔭)|G\_{Q\_p}) at closed points is the definition of B in the deformation-theoretic correspondence (EM11 Definition 6.1.1, Remark 3.3.19).
3. (b): uniqueness and existence of the co-Whittaker family are Emerton–Helm (EM11 Theorem 4.4.1, Definition 4.4.2, Theorem 6.1.2; NAK §2.2 with Theorem B.11), whose integral GL\_n theory is SmoothRepresentationsOfLocalGroups SR.5 (co-Whittaker families and the conditional local-Langlands family construction); the mod p fibre for p > 2 is EM11 Theorem 6.1.2.
4. (c): co-Whittaker families have free rank-one top derivative over their coefficient ring, and endomorphisms after arbitrary coefficient tensoring are scalars (SR.5; NAK Lemma B.10, used in its Lemma 2.6).

*Checks.*

- At a closed point 𝔭 attached to a newform f with ρ(𝔭)|G\_{Q\_p} crystalline and absolutely irreducible, π(𝔭) is the universal unitary completion of π\_p(f) ⊗ Sym^{k−2} (Berger–Breuil).
- Non-example: for ρ̄\_p a twist of a non-split extension of ε̄ by 1 (excluded by Assumption 3.3.1), the expected B(V) is longer than the Colmez correspondence predicts (EM11 Remark 6.1.23), so the family in (a) is not defined.

*Needs:* §R31.3/hecke-galois-determinant-and-representation; §R31.3/classical-points-and-zariski-density; PadicLocalLanglandsForGL2Qp:R30.3; PadicLocalLanglandsForGL2Qp:R30.5; SmoothRepresentationsOfLocalGroups:SR.5; CompletedCohomologyPartII:CC.3/orthonormalizable-and-profree-modules; mathlib:Module.Flat.

*Sources.*

- EM11, Assumption 3.3.1, Theorem 3.3.2, p. 24; Theorem 3.3.13, p. 26; Remark 3.3.19, p. 27: Colmez’s π̄ attached to ρ̄\_p, Kisin’s deformation-theoretic equivalence between crystalline deformations of π̄ and of ρ̄\_p, and the compatibility of B with the explicit correspondence.
- EM11, §6.1 opening paragraphs, Definition 6.1.1, Theorem 6.1.2 and Remark 6.1.3, pp. 66–67: The deformation π^m\_Σ of π̄ over T\_{ρ̄,Σ} with MF(π^m\_Σ) ≅ ρ^m\_Σ|G\_{Q\_p}, its fibres π(𝔭), the family π\_{Σ\_0}(ρ^m\_Σ) and its mod ϖ m-torsion for p > 2.
- EM11, Theorem 4.4.1, Definition 4.4.2, Proposition 4.4.3, pp. 42–44: Uniqueness and properties of the coadmissible family π\_{Σ\_0}(ρ) attached to a Galois representation over a reduced complete local ring (Emerton–Helm).
- NAK, §2.2, pp. 18–20: Under ρ̄\_p ≇ χ ⊗ (1 ∗; 0 ε), p ≥ 3 and End(ρ̄\_p) = F: the deformation π^m\_p of π̄\_p with MF(π^m\_p) ≅ ρ^m|G\_{Q\_p}, the co-Whittaker π^m\_ℓ, π^m\_{Σ\_0} as maximal torsion-free quotient, and Φ\_{Σ\_0}(π^m\_{Σ\_0}) ≅ T\_{ρ̄,Σ}.

### Fibres of the away-from-p family (Mazur’s principle in families)

*Theorem* `R31.4/fibres-of-the-away-from-p-family`

Under the hypotheses of R31.4/local-langlands-families-over-the-hecke-algebra, for every closed point 𝔭 ∈ Spec T\_{ρ̄,Σ}[1/p] there is an isomorphism π\_{Σ\_0}(ρ^m\_Σ)[𝔭] ≅ π\_{Σ\_0}(ρ(𝔭)°), hence E ⊗\_O π\_{Σ\_0}(ρ^m\_Σ)[𝔭] ≅ ⊗\_{ℓ∈Σ\_0} π\_ℓ(ρ(𝔭)|G\_{Q\_ℓ}) (Emerton’s Conjecture 6.1.4, proved as his Theorem 6.2.4). Equivalently: if Σ\_0^{ng} ⊂ Σ\_0 is the set of ℓ at which ρ(𝔭) is a non-generic principal series and χ makes χ ⊗ ρ(𝔭) unramified on Σ\_0^{ng}, then χ ⊗ ρ(𝔭) is promodular of tame level divisible only by primes in Σ\_0 ∖ Σ\_0^{ng}.

*Hypotheses and conventions.*

- The proof removes one prime ℓ ∈ Σ\_0^{ng} at a time and uses that ρ(𝔭)(Frob\_ℓ) has eigenvalue ratio ℓ^{±1}, so is not scalar.
- It uses the semistable model of X(K\_pK\_{Σ\_0}K\_0^Σ) at ℓ, the Néron model of its Jacobian, and the Eisenstein property of the component group (Ribet), after localising at the non-Eisenstein m.

*Proof sketch.*

1. Reduce to removing one ℓ with ρ(𝔭) unramified non-generic principal series at ℓ, at Iwahori level J\_ℓ (EM11 Remark 6.1.5 and proof of Theorem 6.2.4).
2. Adjoin U\_ℓ to get T(K\_{Σ\_0})^\*\_ρ̄ (finite over T(K\_{Σ\_0})\_ρ̄); refine the embedding ρ(𝔭) ↪ Ĥ^1(K\_{Σ\_0})\_{E,ρ̄}[𝔭] (from R31.4/multiplicity-module, Emerton Remark 6.4.3) to a prime 𝔭^\* over 𝔭, landing in the inertia invariants.
3. Construct the ℓ-new/ℓ-old exact sequence of the inertia invariants, with Frob\_ℓ acting by U\_ℓ on the new part and the old part ≅ two copies of the level-without-ℓ cohomology, from the Néron model sequences (6.2.9)–(6.2.11): the component group Φ is Eisenstein (Ribet), so localising at m kills it, and Frob\_ℓ acts on the torus part by ℓ^{-1}U\_ℓ (EM11 (6.2.7)–(6.2.11)); the semistable model at ℓ is ModularCurvesPartII R13.5 and the Néron-model and character-group sequences are R14.6; the Eisenstein property of the Hecke action on Φ (Ribet 1990, Corollary on p. 140) and the action of Frob\_ℓ by ℓ^{-1}U\_ℓ on the torus (Ribet, Proposition 3.8) are requested from ModularCurvesPartII R14.6, whose current nodes state the sequences and the good-reduction Eichler–Shimura relation only.
4. Since ρ(𝔭)(Frob\_ℓ) is not scalar, the embedding does not factor through the new part, so the old part at 𝔭^\* is nonzero, giving promodularity at level prime to ℓ (Mazur’s principle, EM11 Remark 6.2.12).

*Checks.*

- For ρ(𝔭) unramified at every ℓ ∈ Σ\_0 with ρ(𝔭)(Frob\_ℓ) of eigenvalue ratio ≠ ℓ^{±1}, Σ\_0^{ng} = ∅ and the statement reduces to the existence of the family.
- Under p > 2, ρ̄|G\_{Q(ζ\_p)} absolutely irreducible and ρ̄ p-distinguished, the theorem also follows from Theorem 1.2.3 (EM11 Remark 6.2.12), but that route uses Serre’s conjecture; the Mazur-principle proof does not.

*Needs:* §R31.4/local-langlands-families-over-the-hecke-algebra; §R31.4/multiplicity-module; §R31.3/galois-factorisation-of-completed-cohomology; ModularCurvesPartII:R14.6/modular-monodromy; ModularCurvesPartII:R14.6/character-degeneracy-sequences; ModularCurvesPartII:R14.6/special-fibre-eichler-shimura; ModularCurvesPartII:R13.5/one-factor-mixed-level-model.

*Sources.*

- EM11, Conjecture 6.1.4 and Remark 6.1.5, p. 67; Theorem 6.2.4 and its proof with (6.2.5)–(6.2.11), pp. 72–75; Remark 6.2.12, p. 75: The fibres of π\_{Σ\_0}(ρ^m\_Σ) at closed points are the expected local representations; the proof is a p-adic form of Mazur’s principle using the Néron model of the Jacobian at a semistable prime and the Eisenstein component group.

### The multiplicity module X(θ)

*Construction* `R31.4/multiplicity-module` — planet: Multiplicity module X(θ)

Under the hypotheses of R31.4/local-langlands-families-over-the-hecke-algebra, let θ be a deformation of π̄ over T\_{ρ̄,Σ} (an admissible G-representation on an orthonormalizable T\_{ρ̄,Σ}-module) such that θ(𝔭) ≅ π(𝔭) at every allowable closed point (Emerton’s Assumption 6.3.1; θ = π^m\_Σ qualifies, and θ ≅ π^m\_Σ when End\_G(π̄) = k). Define X(θ) = Hom\_{T\_{ρ̄,Σ}[G\_Q×G]-cont}(ρ^m\_Σ ⊗\_{T\_{ρ̄,Σ}} θ, Ĥ^1\_{O,ρ̄,Σ}), continuity for the m-adic topology on the source and the inductive-limit topology on the target, with the T\_{ρ̄,Σ}-linear action of G\_{Σ\_0} induced from Ĥ^1\_{O,ρ̄,Σ}. For a coadmissible T\_{ρ̄,Σ}[G\_{Σ\_0}]-submodule Y ⊂ X(θ) the evaluation map ev\_Y: ρ^m\_Σ ⊗ θ ⊗̃ Y → Ĥ^1\_{O,ρ̄,Σ} uses Emerton’s completed tensor product ⊗̃ (Definition C.43: ⊗̃ = colim\_H of ϖ-adically completed tensor products with the H-invariants, H ⊂ G\_{Σ\_0} open). Then X(θ) is a smooth, cofinitely generated and coadmissible representation of G\_{Σ\_0} over T\_{ρ̄,Σ} (Definitions C.23, C.32); X(θ)\_{ctf} denotes its maximal cotorsion-free quotient (Definition C.37) and closures and saturations are in the sense of Definitions C.6 and C.28. For 𝔭 closed, E ⊗ X(θ)[𝔭] ≠ 0, giving a nonzero G\_Q × G-map ρ(𝔭) ⊗ π(𝔭) → Ĥ^1\_{E,ρ̄,Σ}[𝔭] (Emerton’s Remark 6.4.3).

*Hypotheses and conventions.*

- θ must satisfy Assumption 6.3.1 (fibres π(𝔭) at allowable points); then θ(𝔭)^{ss} ≅ π(𝔭)^{ss} at every closed point (Emerton Lemma 6.3.3).
- Coadmissibility is Emerton’s notion for smooth representations of G\_{Σ\_0} over the complete local ring T\_{ρ̄,Σ} (Appendix C); it is not the Schneider–Teitelbaum notion for locally analytic representations.

*API.*

- `TauCeti.LocalGlobalCompatibility.multiplicityModule` (constructor): X(θ) = Hom\_{T[G\_Q×G]-cont}(ρ^m\_Σ ⊗\_T θ, Ĥ^1\_{O,ρ̄,Σ}) with its smooth G\_{Σ\_0}-action.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_coadmissible` (characterisation): X(θ) is a cofinitely generated coadmissible smooth T\_{ρ̄,Σ}[G\_{Σ\_0}]-module.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_invariants` (simp): X(θ)^{K\_{Σ\_0}} = Hom\_{T[G\_Q×G]-cont}(ρ^m ⊗ θ, Ĥ^1(K\_{Σ\_0})\_{O,ρ̄}) for allowable K\_{Σ\_0}.
- `TauCeti.LocalGlobalCompatibility.evaluation` (data): ev\_Y: ρ^m\_Σ ⊗ θ ⊗̃ Y → Ĥ^1\_{O,ρ̄,Σ} for a coadmissible submodule Y.
- `TauCeti.LocalGlobalCompatibility.cotorsionFreeQuotient` (constructor): X(θ)\_{ctf}, the maximal cotorsion-free quotient.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_fibre` (compatibility): E ⊗ X(θ)[𝔭] ≅ Hom\_{G\_Q×G}(ρ(𝔭) ⊗ π(𝔭), Ĥ^1\_{E,ρ̄,Σ}[𝔭]) and is nonzero for closed 𝔭.
- `TauCeti.LocalGlobalCompatibility.completedTensor` (constructor): Emerton’s ⊗̃ of an orthonormalizable admissible G-representation over T with a coadmissible G\_{Σ\_0}-representation.

*Unit tests.*

- `TauCeti.LocalGlobalCompatibility.multiplicityModule_nonzero` (computation): For every closed point 𝔭 of Spec T\_{ρ̄,Σ}[1/p], X(π^m\_Σ)[𝔭] ⊗ E ≠ 0.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_zero_target` (degenerate): If Ĥ^1\_{O,ρ̄,Σ} were replaced by 0, X(θ) = 0 and ev is the zero map; the definition is additive in the target.
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_compatibility` (compatibility): Under R31.3/galois-factorisation-of-completed-cohomology, X(θ) ≅ Hom\_{T[G]-cont}(θ, U\_Σ).
- `TauCeti.LocalGlobalCompatibility.multiplicityModule_not_algebraic_hom` (non-example): X(θ) consists of continuous maps; the space of all T[G\_Q × G]-linear maps from ρ^m ⊗ θ is larger when θ is infinite-dimensional and is not coadmissible.

*Uses.*

- EM11, Theorems 6.4.9, 6.4.16, 6.4.20 and Corollary 6.4.13: The refined local–global compatibility is the statement that ev\_{X(θ)\_{ctf}} is an isomorphism with X(θ)\_{ctf} ≅ π\_{Σ\_0}(ρ^m\_Σ).
- EM11, Theorem 6.2.1 and Remark 7.4.2: The nonzero map ρ(𝔭) ⊗ π(𝔭) → Ĥ^1[𝔭] at every closed point is the input of Theorem 1.2.1(1) and of the global proof of Theorem 3.3.22.
- R31.4/fibres-of-the-away-from-p-family: The embedding of ρ(𝔭) into Ĥ^1(K\_{Σ\_0})\_{E,ρ̄}[𝔭] starts Mazur’s principle.

*Proof sketch.*

1. Smoothness: every continuous map factors through Ĥ^1(K\_{Σ\_0})\_{O,ρ̄} for some allowable K\_{Σ\_0}, using Ĥ^1(K\_{Σ\_0})\_{O,ρ̄} = Ĥ^1(K\_{Σ\_0})\_{E,ρ̄} ∩ Ĥ^1\_{O,ρ̄,Σ} and admissibility (EM11 proof of Theorem 6.3.12, from R31.3/rho-bar-part-and-commuting-actions).
2. Cofinite generation and coadmissibility: the K\_{Σ\_0}-invariants X(θ)^{K\_{Σ\_0}} = Hom(ρ^m ⊗ θ, Ĥ^1(K\_{Σ\_0})\_{O,ρ̄}) are cofinitely generated over T\_{ρ̄,Σ} because Ĥ^1(K\_{Σ\_0})\_{O,ρ̄} is ϖ-adically admissible over T\_{ρ̄,Σ} and θ is admissible (EM11 Theorem 6.3.12, (6.3.7)).
3. Nonvanishing at closed points: X(θ) satisfies condition 4 of Emerton’s Proposition 6.4.2; Proposition C.36 gives E ⊗ X(θ)[𝔭] ≠ 0 (EM11 Remark 6.4.3).
4. The completed tensor product, closure, saturation and cotorsion-free notions are those of EM11 Appendix C, whose algebraic background (orthonormalizable and pro-free modules, Appendix B) is CompletedCohomologyPartII CC.3 (orthonormalizable coefficient modules and mixed completed tensor products).

*Checks.*

- For θ = π^m\_Σ and Σ\_0 = ∅, X(θ) is a cofinitely generated T\_{ρ̄,Σ}-module and Conjecture 6.1.6 predicts X(θ)\_{ctf} ≅ T\_{ρ̄,Σ}.
- At a closed point 𝔭, X(θ)[𝔭] ⊗ E ≅ Hom\_{G\_Q×G}(ρ(𝔭) ⊗ π(𝔭), Ĥ^1\_{E,ρ̄,Σ}[𝔭]) (EM11 (6.3.10)).

*Needs:* §R31.4/local-langlands-families-over-the-hecke-algebra; §R31.3/rho-bar-part-and-commuting-actions; §R31.3/galois-factorisation-of-completed-cohomology; CompletedCohomologyPartII:CC.3/orthonormalizable-and-profree-modules; CompletedCohomologyPartII:CC.3/mixed-completed-tensor; CompletedCohomologyPartII:CC.3/mixed-tensor-dual-comparison; mathlib:ContinuousLinearMap.

*Sources.*

- EM11, Assumption 6.3.1, Remark 6.3.2, Lemma 6.3.3, Definition 6.3.4, Theorem 6.3.12 and its proof, pp. 76–78: The multiplicity module X(θ) of continuous T\_{ρ̄,Σ}[G\_Q × G]-maps from ρ^m\_Σ ⊗ θ into Ĥ^1\_{O,ρ̄,Σ}, its smoothness and coadmissibility as a G\_{Σ\_0}-representation over T\_{ρ̄,Σ}.
- EM11, Proposition 6.4.2, Remark 6.4.3, Definitions 6.4.1 and 6.4.4, pp. 81–83: Evaluation maps from coadmissible submodules, X(θ)\_{ctf}, and the nonzero map ρ(𝔭) ⊗ π(𝔭) → Ĥ^1\_{E,ρ̄,Σ}[𝔭] at every closed point.
- EM11, Appendix C, Definitions C.6, C.23, C.28, C.32, C.37, C.43, Proposition C.36, pp. 103–115: Saturation, coadmissible and cofinitely generated smooth representations over a complete local ring, closures, cotorsion-free quotients and the completed tensor product ⊗̃.

### Emerton’s refined local–global compatibility

*Theorem* `R31.4/refined-local-global-compatibility` — planet: Emerton’s refined local–global compatibility

Let ρ̄: G\_Q → GL\_2(k) be absolutely irreducible and modular, unramified outside Σ = Σ\_0 ∪ {p}, with ρ̄\_p satisfying Assumption 3.3.1 and p-distinguished (ρ̄\_p^{ss} is not the sum of two copies of one character). Then there is a G\_Q × G × G\_{Σ\_0}-equivariant T\_{ρ̄,Σ}-linear isomorphism ρ^m\_Σ ⊗\_{T\_{ρ̄,Σ}} π^m\_Σ ⊗̃\_{T\_{ρ̄,Σ}} π\_{Σ\_0}(ρ^m\_Σ) ≅ Ĥ^1\_{O,ρ̄,Σ} (Emerton’s Conjecture 6.1.6, his Theorem 6.2.13); moreover X(π^m\_Σ)\_{ctf} ≅ π\_{Σ\_0}(ρ^m\_Σ) and the evaluation map is an isomorphism. In Nakamura’s normalisation, under ρ̄\_p ≇ χ ⊗ (1 ∗; 0 ε), p ≥ 3 and End(ρ̄\_p) = k: ρ^m ⊗\_T π^m\_p ⊗̃\_T π̃^m\_{Σ\_0} ≅ Ĥ^1\_{ρ̄,Σ} topologically and G\_Q × G\_Σ-equivariantly. The weaker statement (Conjecture 6.1.9: an isomorphism with some deformation θ of π̄ with θ(𝔭) ≅ π(𝔭) at closed points) holds whenever ρ̄\_p is a sum of distinct characters (Theorem 6.4.20) and suffices for Theorem 1.2.1(2).

*Hypotheses and conventions.*

- p-distinguished and Assumption 3.3.1: the two hypotheses on ρ̄\_p; when ρ̄\_p has only scalar endomorphisms the conclusion is Theorem 6.4.16, and when ρ̄\_p = χ\_1 ⊕ χ\_2 with χ\_1χ\_2^{-1} ≠ 1, ε^{±1} it is Theorem 6.4.20 (with Conjecture 6.1.9’s θ).
- The converse direction of Corollary 6.4.13 (ev an isomorphism ⇒ (6.4.14)) needs ρ̄\_p non-scalar (Assumption 5.7.3), which p-distinguishedness implies.
- This theorem uses no globalisation by Serre’s conjecture beyond the hypothesis that ρ̄ is modular.

*Proof sketch.*

1. Criterion (Theorem 6.4.9): for a coadmissible Y ⊂ X(θ), ev\_Y is an isomorphism iff Y is T\_{ρ̄,Σ}-faithful and ev\_Y(m) (reduce mod ϖ, take m-torsion) is injective; then Y = X(θ)\_{ctf}. The proof uses Lemma C.46/C.52 and Theorem 6.4.7 (surjectivity of ev\_E for saturated faithful Y, by density of allowable points and the fibre computation at allowable points, Proposition 6.3.15).
2. Trivial endomorphisms (Theorem 6.4.16): injectivity of ev(m) reduces, through absolute irreducibility of ρ̄ and Lemma 6.4.15, to injectivity of every nonzero G-map π̄ → Hom\_{k[G\_Q]}(ρ̄, H^1\_{k,ρ̄,Σ}[m]), which holds because π̄ has irreducible socle in this case.
3. Distinct characters (Theorem 6.4.20, §6.5): at allowable points with κ(𝔭) = E, ρ(𝔭)° ⊗ π(𝔭)° ≅ F\_{Σ\_0}(M(𝔭)\_O) (Proposition 6.5.2), built into a deformation θ of π̄ by gluing over allowable ideals (Definitions 6.4.4, 6.5.6; Propositions 6.5.11, 6.5.13); conclude Conjecture 6.1.9.
4. Corollary 6.4.13 turns ev an isomorphism into (6.4.14) with X(θ)\_{ctf} ≅ π\_{Σ\_0}(ρ^m\_Σ), using Theorem 6.4.11 (identification of X(θ)\_{ctf} under Assumption 5.7.3) and R31.4/fibres-of-the-away-from-p-family; Remark 6.1.11 gives θ ≅ π^m\_Σ when Def(π̄) is representable (EM11 Theorem 6.2.13).
5. Nakamura’s form is the same statement with π\_{Σ\_0}(ρ^m\_Σ) written as the contragredient of the maximal torsion-free quotient of ⊗ π̃^m\_ℓ (NAK Theorem 2.2).

*Checks.*

- For ρ̄\_p absolutely irreducible (so End(ρ̄\_p) = k and ρ̄ p-distinguished), Ĥ^1\_{O,ρ̄,Σ} ≅ ρ^m ⊗ π^m ⊗̃ π\_{Σ\_0}(ρ^m), and at every closed point 𝔭, Ĥ^1\_{E,ρ̄,Σ}[𝔭] ≅ ρ(𝔭) ⊗ B(ρ(𝔭)|G\_{Q\_p}) ⊗ π\_{Σ\_0}(ρ(𝔭)).
- Non-example: for ρ̄\_p ≅ χ ⊗ χ (scalar) the theorem is not proved; Emerton expects a mod p multiplicity two phenomenon there (Remark 6.1.22).

*Needs:* §R31.4/multiplicity-module; §R31.4/local-langlands-families-over-the-hecke-algebra; §R31.4/fibres-of-the-away-from-p-family; §R31.3/classical-points-and-zariski-density; §R31.3/galois-factorisation-of-completed-cohomology; PadicLocalLanglandsForGL2Qp:R30.4; PadicLocalLanglandsForGL2Qp:R30.5; SmoothRepresentationsOfLocalGroups:SR.5.

*Sources.*

- EM11, Conjectures 6.1.6 and 6.1.9, Remark 6.1.11, p. 67–68; Theorem 6.2.13, p. 75: The refined conjecture ρ^m ⊗ π^m ⊗̃ π\_{Σ\_0}(ρ^m) ≅ Ĥ^1\_{O,ρ̄,Σ}, its weaker variant with θ, and the theorem that it holds for p-distinguished ρ̄.
- EM11, Theorems 6.4.7, 6.4.9, 6.4.11, Corollary 6.4.13, Lemma 6.4.15, Theorems 6.4.16 and 6.4.20, pp. 84–89; §6.5, Proposition 6.5.2, pp. 89–94: The evaluation-map criterion, the identification of X(θ)\_{ctf}, and the proofs in the trivial-endomorphism and distinct-character cases.
- NAK, Theorem 2.2, p. 20: Emerton’s refined local–global compatibility in the form ρ^m ⊗ π^m\_p ⊗̃ π̃^m\_{Σ\_0} ≅ Ĥ^1\_{ρ̄,Σ}, under (a) ρ̄\_p ≇ χ ⊗ (1 ∗; 0 ε), (b) p ≥ 3, (c) End(ρ̄\_p) = F.

### Emerton’s local–global compatibility theorem

*Theorem* `R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses` — planet: Emerton’s local–global compatibility theorem

Let V be a continuous, irreducible, promodular two-dimensional representation of G\_Q over E, unramified outside a finite set of primes, with residual representation V̄. Assume (a) V̄ is absolutely irreducible and (b) V̄|G\_{Q\_p} ≇ χ ⊗ (1 ∗; 0 ε̄) for every k-valued character χ of G\_{Q\_p} (∗ zero or not). Then: (1) for some finite set Σ of primes containing p and the primes where V ramifies, there is a nonzero GL\_2(Q\_p) × GL\_2(A\_f^Σ)-equivariant map B(V|G\_{Q\_p}) ⊗ (⊗′\_{ℓ∉Σ} π\_ℓ(V)) → Hom\_{E[G\_Q]}(V, Ĥ^1\_E), and if V|G\_{Q\_p} is neither the direct sum of two characters nor an extension of a character by itself, every such map is an embedding; (2) if V̄ is p-distinguished (V̄|G\_{Q\_p} ≇ χ ⊗ (1 ∗; 0 1)), there is a GL\_2(A\_f)-equivariant isomorphism B(V|G\_{Q\_p}) ⊗ (⊗′\_{ℓ≠p} π\_ℓ(V)) ≅ Hom\_{E[G\_Q]}(V, Ĥ^1\_E). Here π\_ℓ(V) is the modified local Langlands representation (Tate normalisation, replaced by its generic constituent ordering when the classical representation is not generic) and B is the p-adic local Langlands correspondence. In the situation of (2) the structure of the summand of Ĥ^1\_E (and of its unit ball) localised at V̄ is given by R31.4/refined-local-global-compatibility.

*Hypotheses and conventions.*

- V must be promodular; the theorem itself does not invoke Serre’s conjecture.
- The two residual hypotheses are distinct: (b) for (1), the stronger p-distinguishedness for (2); the embedding clause of (1) has its own hypothesis on V (not V̄).
- (1) is only GL\_2(Q\_p) × GL\_2(A\_f^Σ)-equivariant, for an unspecified finite Σ; only (2) gives full GL\_2(A\_f)-equivariance.
- Emerton’s Remark 1.1.2: the unrestricted conjecture is expected to fail when V|G\_{Q\_p} is a twist of an extension of the cyclotomic character by the trivial character (B must then be longer, Remark 6.1.23); hypothesis (b) excludes the residual shape of that case.

*Proof sketch.*

1. V corresponds to a closed point 𝔭 ∈ Spec T\_{ρ̄,Σ}[1/p] with ρ̄ = V̄ (promodularity and Σ large).
2. Nonzero map: Remark 6.4.3 (R31.4/multiplicity-module) gives ρ(𝔭) ⊗ π(𝔭) → Ĥ^1\_{E,ρ̄,Σ}[𝔭] nonzero, and π(𝔭) = B(V|G\_{Q\_p}) (EM11 Theorem 6.2.1).
3. Embedding: if V|G\_{Q\_p} is irreducible, B is topologically irreducible (Proposition 3.3.24, from R30.4); otherwise V|G\_{Q\_p} is a non-split extension of distinct characters and B is a non-split extension described in Propositions 3.4.2/3.4.5; a non-injective map factors through its parabolic-induction quotient (using R31.1’s Lemma 5.1.3: Ĥ^1\_E has no one-dimensional G-subrepresentations), and the adjunction between Ind\_B and Emerton’s ordinary parts plus the abelian Galois action on Ord\_B(Ĥ^1)/Ord\_B(Ĥ^1)^{ab,S} (Corollary 5.6.13) shows such maps vanish (EM11 Proposition 6.2.2; the ordinary-parts functor and its adjunction are requested from PadicLocalLanglandsForGL2Qp R30.2).
4. Pass from Hom(V, Ĥ^1\_{E,ρ̄,Σ}[𝔭]) to Hom(V, Ĥ^1\_E) by R31.3/galois-factorisation-of-completed-cohomology(b) and add the unramified places by the argument of EM-PAMQ Proposition 7.8.7 (EM11 proof of Theorem 1.2.1, pp. 75–76).
5. (2): Theorem 6.2.4 (R31.4/fibres-of-the-away-from-p-family) and Theorem 6.2.13 (R31.4/refined-local-global-compatibility) give Conjectures 6.1.4 and 6.1.9, and Proposition 6.1.17 with Lemma 6.1.19 deduces Conjecture 1.1.1 for V.

*Checks.*

- For V = V\_f attached to a newform of weight k ≥ 2 and level prime to p with V̄ absolutely irreducible and V̄|G\_{Q\_p} absolutely irreducible, (2) gives Hom(V\_f, Ĥ^1\_E) ≅ B(V\_f|G\_{Q\_p}) ⊗ ⊗′\_{ℓ≠p} π\_ℓ(V\_f).
- Non-example: if V|G\_{Q\_p} = χ ⊕ χ′ is a sum of two characters, (1) only gives a nonzero map; injectivity can fail because B is then a sum of two principal series whose map may kill one summand.

*Needs:* §R31.4/refined-local-global-compatibility; §R31.4/fibres-of-the-away-from-p-family; §R31.4/multiplicity-module; §R31.3/galois-factorisation-of-completed-cohomology; §R31.1/the-object-the-conjecture-is-about; PadicLocalLanglandsForGL2Qp:R30.2; PadicLocalLanglandsForGL2Qp:R30.4.

*Sources.*

- EM11, Theorem 1.2.1, pp. 3–4: The main theorem with its two residual hypotheses, the nonzero (resp. injective) map in (1) and the isomorphism in (2) under p-distinguishedness.
- EM11, Theorem 6.2.1, Proposition 6.2.2, pp. 71–72; proof of Theorem 1.2.1, pp. 75–76; Proposition 6.1.17 and Lemma 6.1.19, pp. 69–70: Nonzero map from Remark 6.4.3, the closed-embedding criterion via ordinary parts and Lemma 5.1.3, and the deduction of Conjecture 1.1.1 from Conjectures 6.1.4 and 6.1.9.
- EM11, Remark 1.1.2, p. 2; Remark 6.1.23, pp. 70–71: The expected failure of the conjecture as stated when V|G\_{Q\_p} is a twist of an extension of ε by 1.

### Mod p local–global compatibility and Serre’s adelic reformulation

*Theorem* `R31.4/mod-p-multiplicity-and-serre-s-adelic-reformulation`

Let H^1\_k = colim\_{K\_f} H^1\_ét(Y(K\_f)\_{Q̄}, k) with its G\_Q × GL\_2(A\_f)-action, and let ρ̄: G\_Q → GL\_2(k) be absolutely irreducible and modular. Suppose p > 2 and ρ̄|G\_{Q\_p} ≇ χ ⊗ (1 ∗; 0 1) and ≇ χ ⊗ (1 ∗; 0 ε̄) for every k-valued χ. Then there is a k-linear GL\_2(A\_f)-equivariant isomorphism π̄ ⊗\_k (⊗′\_{ℓ≠p} π(ρ̄|G\_{Q\_ℓ})) ≅ Hom\_{k[G\_Q]}(ρ̄, H^1\_k), where π̄ is attached to ρ̄|G\_{Q\_p} by the mod p local Langlands correspondence and π(ρ̄|G\_{Q\_ℓ}) by the mod p local Langlands correspondence for GL\_2(Q\_ℓ) in families (Emerton–Helm); equivalently ρ̄ ⊗ π̄ ⊗ ⊗′\_{ℓ≠p} π(ρ̄|G\_{Q\_ℓ}) ≅ H^1\_{k,ρ̄}[m]. Taking invariants under compact open subgroups recovers classical mod p multiplicity one results; the GL\_2(Z\_p)-socle of π̄ recovers Serre’s weights and the conductor of the away-from-p factor Serre’s level, answering Serre’s question 3.4(2) for these ρ̄.

*Hypotheses and conventions.*

- p > 2 is required: the p = 2 statement is expected but unproved because the mod 2 local Langlands correspondence in families at ℓ ≠ 2 is incompletely understood (Emerton Remarks 1.2.7, 6.1.3, 6.1.21).
- The two excluded local shapes are those of Theorem 1.2.3(c); Emerton conjectures the first removable for p > 3 (Remark 1.2.9).
- The hypothesis ‘modular’ is used as stated; its replacement by ‘odd’ uses the full Serre conjecture (Khare–Wintenberger, Kisin), a globalisation dependence recorded in R31.6/globalisation-dependence-audit.
- Placement: this node was drafted in the decomposition under R31.3 as R31.3/mod-p-multiplicity-and-serre-s-adelic-reformulation; since it is a corollary of Theorem 6.2.13 it belongs to R31.4 and has been moved, with the decomposition reviewer’s placement note discharged.

*Proof sketch.*

1. Theorem 6.2.13 (R31.4/refined-local-global-compatibility) gives Conjecture 6.1.9 for every Σ\_0 (p-distinguishedness is the first exclusion).
2. Reduce (6.1.10) mod ϖ, take m-torsion, use Lemma C.45 and the mod p fibre of π\_{Σ\_0}(ρ^m\_Σ) for p > 2 (R31.4/local-langlands-families-over-the-hecke-algebra(b)) to get ρ̄ ⊗ π̄ ⊗ π\_{Σ\_0}(ρ̄) ≅ H^1\_{k,ρ̄,Σ}[m]; pass to the limit over Σ\_0 (EM11 Proposition 6.1.20, proof of Theorem 1.2.6).
3. The proof uses only the more straightforward classical multiplicity one theorems, not level lowering at p, companion forms, or the harder part of Wiles’s Theorem 2.1(ii) (EM11 Remarks 1.2.8, 6.2.15).

*Checks.*

- For ρ̄|G\_{Q\_p} absolutely irreducible, π̄ is supersingular and its GL\_2(Z\_p)-socle is the set of Serre weights W(ρ̄), so taking GL\_2(Z\_p)K^p-invariants twisted by a Serre weight σ shows Hom\_{GL\_2(Z\_p)}(σ, H^1\_{k,ρ̄}[m]) ≠ 0 exactly for σ ∈ W(ρ̄).
- For ρ̄|G\_{Q\_p} scalar (excluded) Emerton predicts multiplicity two (Remark 6.1.22).

*Needs:* §R31.4/refined-local-global-compatibility; §R31.4/local-langlands-families-over-the-hecke-algebra; PadicLocalLanglandsForGL2Qp:R30.3; AlgebraicModularFormsAndSerreWeights:R15.4/recipe-well-definedness-and-twisting.

*Sources.*

- EM11, Theorem 1.2.6 and Remarks 1.2.7–1.2.10, pp. 5–6: The mod p local–global isomorphism for H^1\_k, its expected p = 2 analogue, its relation to classical multiplicity one, and the recovery of Serre’s weight and level.
- EM11, Proposition 6.1.20, Remarks 6.1.21–6.1.22, p. 70; proof of Theorem 1.2.6 and Remark 6.2.15, p. 76: Derivation from Conjecture 6.1.9 by reduction mod ϖ, and the list of classical results not used.
- SERRE87, §3.4, question (2), p. 199: Serre asks whether his conjecture admits a reformulation in terms of mod p representations of the adelic GL\_2; the theorem answers this for the ρ̄ it covers.

### Dual local–global compatibility for completed homology

*Theorem* `R31.4/dual-local-global-compatibility-for-completed-homology`

Assume (a) ρ̄\_p ≇ χ ⊗ (1 ∗; 0 ε), (b) p ≥ 3, (c) End\_k(ρ̄\_p) = k, ρ̄ odd absolutely irreducible unramified outside Σ ∪ {∞}. Let H̃^{BM}\_{1,ρ̄,Σ} be the ρ̄-part of completed Borel–Moore homology at levels K\_{Σ\_0} (the Pontryagin–Schikhof dual of Ĥ^1\_{c,ρ̄,Σ} ≅ Ĥ^1\_{ρ̄,Σ}). Then: (1) there is a T\_{ρ̄,Σ}[G\_Q × G\_Σ]-linear topological isomorphism H̃^{BM}\_{1,ρ̄,Σ} ≅ (π^m\_p)^\* ⊗\_{T} (ρ^m)^\* ⊗\_T π^m\_{Σ\_0}; (2) for A complete local noetherian, deformations ρ of ρ̄\_p and π of π̄\_p over A and a co-Whittaker A[G\_{Σ\_0}]-module V, End^cont\_{A[G\_{Q\_p}×G\_Σ]}(π^\* ⊗\_A ρ^\* ⊗\_A V) = A; hence End^cont\_{T[G\_Q×G\_Σ]}(H̃^{BM}\_{1,ρ̄,Σ}) = End^cont\_{T[G\_{Q\_p}×G\_Σ]}(H̃^{BM}\_{1,ρ̄,Σ}) = T\_{ρ̄,Σ} and the isomorphism of (1) is unique up to T\_{ρ̄,Σ}^×; (3) under the stronger (a)′ ρ̄\_p ≇ χ ⊗ (1 ∗; 0 ε^{±1}), (b)′ p ≥ 5 and (c), with R\_p the universal deformation ring of ρ̄\_p and P̃ the projective envelope of the dual of the socle of π̄\_p (R\_p ≅ End(P̃)), H̃^{BM}\_{1,ρ̄,Σ} ≅ (P̃ ⊗̂\_{R\_p} (ρ^m)^\*) ⊗\_T π^m\_{Σ\_0}.

*Hypotheses and conventions.*

- Nakamura’s hypotheses (a)–(c), resp. (a)′–(b)′–(c); End(ρ̄\_p) = k makes Def(π̄\_p) representable and π^m\_p the pullback of the universal deformation.
- The duals are continuous T-linear duals; coadmissible modules (Nakamura Appendix B.2.4) are used for π^m\_{Σ\_0}.

*Proof sketch.*

1. (1): dualise R31.4/refined-local-global-compatibility in Nakamura’s form, using the identification H̃^{BM}\_{1,ρ̄,Σ} ≅ (Ĥ^1\_{c,ρ̄,Σ})^d ≅ (Ĥ^1\_{ρ̄,Σ})^d (NAK Lemma 2.4 and §2.1.4) and Nakamura’s Lemma B.16 on duals of completed tensor products with coadmissible modules (NAK Corollary 2.5); the tame-level duality is CompletedCohomologyPartII:CC.3/tame-level-borel-moore-duality.
2. (2): by Lemma B.10 (endomorphisms of co-Whittaker modules after coefficient tensoring, SmoothRepresentationsOfLocalGroups SR.5) reduce to End(π^\* ⊗ ρ^\*) = A, which follows from End(ρ̄\_p) = k, End(π̄\_p) = k (Emerton Remark 3.3.14) and Schikhof duality (NAK Lemma 2.6, Corollary 2.7).
3. (3): π^m\_p = π\_p ⊗\_{R\_p} T with π\_p universal, so (π^m\_p)^\* ≅ π\_p^\* ⊗̂\_{R\_p} T, and π\_p^\* ≅ P̃ by Nakamura’s Proposition B.26 (Paškūnas’s theory, requested from PadicLocalLanglandsForGL2Qp R30.5) (NAK Corollary 2.8).

*Checks.*

- Nakamura’s zeta morphisms are T\_{ρ̄,Σ}[G\_Q × G\_Σ]-linear maps out of H̃^{BM}\_{1,ρ̄,Σ}; by (2) they are determined by their values after composing with the isomorphism of (1).
- Non-example: for ρ̄\_p with End(ρ̄\_p) ≠ k (e.g. ρ̄\_p split with distinct characters), (2) fails: End(π^\* ⊗ ρ^\*) contains the idempotents of the two summands.

*Needs:* §R31.4/refined-local-global-compatibility; §R31.2/completed-homology-with-coefficients; §R31.1/non-eisenstein-boundary-and-injectivity; CompletedCohomologyPartII:CC.3/tame-level-borel-moore-duality; CompletedCohomologyPartII:CC.3/tame-level-completed-modules; SmoothRepresentationsOfLocalGroups:SR.5; PadicLocalLanglandsForGL2Qp:R30.5.

*Sources.*

- NAK, Corollary 2.5, Lemma 2.6, p. 25; Corollary 2.7, Corollary 2.8 and its proof, p. 26: The dual local–global isomorphism for completed Borel–Moore homology, the computation of its endomorphisms as T\_{ρ̄,Σ} (so the isomorphism is unique up to units), and its description through Paškūnas’s projective envelope P̃ under the stronger hypotheses.

### The multiplicity module of the definite quaternionic tower

*Construction* `R31.4/quaternionic-multiplicity-module`

In the setting of R31.1/definite-quaternionic-completed-module for F = Q and B̄ split at p, let r̄: G\_{Q,Σ} → GL\_2(k) be modular of tame level K^p with r̄|G\_{Q\_p} absolutely irreducible, m ⊂ T̃\_Σ the corresponding maximal ideal and A = T̃\_{Σ,m} (R31.3/definite-quaternionic-hecke-algebra). Let Π^{univ} be the orthonormalizable admissible A[G]-module with continuous G-action such that Π^{univ} ⊗\_A k(𝔭) ≅ Π(𝔭) for every 𝔭 ∈ MaxSpec A[1/p] (local Langlands in families for absolutely irreducible r̄\_p), and π̄ = Π^{univ}/mΠ^{univ}, a smooth irreducible k-representation. Define M = Hom^cont\_{A[G]}(Π^{univ}, C^0(X, O)\_m), with the m-adic topology on Π^{univ} and the subspace topology on C^0(X, O)\_m, and its Schikhof dual M^\* = Hom\_O(M, O) with the topology of pointwise convergence. Then M is O-flat, separated and complete for the p-adic topology, M = Hom^cont\_O(M^\*, O); M^\* is a finitely generated A-module; for 𝔭 ∈ MaxSpec A[1/p], M[𝔭][1/p] = k(𝔭) ⊗\_{A/𝔭} M[𝔭] ≅ Hom^cont\_G(Π(𝔭), C^0(X)[𝔭]) ≅ Hom^cont\_{A[G]}(Π(𝔭), C^0(X)\_m) is finite-dimensional, dual to M^\* ⊗\_A k(𝔭), and nonzero iff 𝔭 ∈ Supp M^\*[1/p].

*Hypotheses and conventions.*

- r̄|G\_{Q\_p} absolutely irreducible (DLB’s Hypothèse); this makes π̄ irreducible and Π^{univ} exist as stated.
- Π^{univ} is a local object requested from PadicLocalLanglandsForGL2Qp R30.5 (the deformation of π̄ over the universal deformation ring of r̄\_p, base-changed to A).

*API.*

- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule` (constructor): M = Hom^cont\_{A[G]}(Π^{univ}, C^0(X, O)\_m).
- `TauCeti.DefiniteQuaternionCompleted.multiplicityDual` (constructor): M^\* = Hom\_O(M, O) with the topology of pointwise convergence; M = Hom^cont\_O(M^\*, O).
- `TauCeti.DefiniteQuaternionCompleted.multiplicityDual_finite` (characterisation): M^\* is a finitely generated A-module.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_fibre` (simp): M[𝔭][1/p] ≅ Hom^cont\_G(Π(𝔭), C^0(X)[𝔭]) for 𝔭 ∈ MaxSpec A[1/p].
- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_support` (characterisation): M[𝔭][1/p] ≠ 0 iff 𝔭 ∈ Supp M^\*[1/p].
- `TauCeti.DefiniteQuaternionCompleted.multiplicityEvaluation` (data): The evaluation map Π^{univ} ⊗̂\_A M → C^0(X, O)\_m.

*Unit tests.*

- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_flat` (characterisation): M is O-torsion-free and p-adically separated and complete.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityDual_mod_m` (computation): dim\_k M^\*/mM^\* = dim\_k (M/ϖM)[m] ≤ dim\_k LC(X(K\_p), k) for K\_p fixing a vector of π̄.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_zero_degenerate` (degenerate): If C^0(X, O)\_m = 0 then M = M^\* = 0 and Supp M^\* is empty.
- `TauCeti.DefiniteQuaternionCompleted.multiplicityModule_compatibility` (compatibility): M is the quaternionic analogue of Emerton’s X(θ): Hom of the universal family into the localised completed module, with T replaced by A.

*Uses.*

- DLB, Théorème 5.4 and its proof: The evaluation map (Π^{univ} ⊗̂\_A M)[1/p] → C^0(X)\_m is shown to be an isomorphism.
- DLB, Proposition 13.5: Nonvanishing of M[𝔭][1/p] at every closed point is the weak local–global statement.

*Proof sketch.*

1. M is O-flat and p-adically complete since C^0(X, O)\_m is (closed subspace of continuous O-valued functions); Schikhof duality gives M = Hom^cont(M^\*, O) (DLB Définition 13.3).
2. Fibres: Π^{univ} ⊗\_A k(𝔭) ≅ Π(𝔭) gives Remark 13.4 directly.
3. Finite generation: M^\* is compact, so by topological Nakayama it suffices that M^\*/mM^\* is finite-dimensional; its dual (M/ϖM)[m] embeds in Hom\_{k[G]}(π̄, LC(X, k)\_m) ⊂ LC(X(K\_p), k) for K\_p fixing a nonzero vector of π̄, a finite-dimensional space since X(K\_p) is finite (DLB Lemme 13.6).
4. Finite-dimensionality and the support criterion follow from finite generation and Nakayama (DLB Lemme 13.7).

*Checks.*

- At a classical crystalline point 𝔭 (Lemma 13.9), M[𝔭] ⊗ k(𝔭) ≠ 0.
- M^\* is finitely generated over A but not in general free; its support in Spec A[1/p] is closed.

*Needs:* §R31.1/definite-quaternionic-completed-module; §R31.3/definite-quaternionic-hecke-algebra; §R31.1/definite-quaternionic-tower-structure; PadicLocalLanglandsForGL2Qp:R30.5; CompletedCohomologyPartII:CC.3/orthonormalizable-and-profree-modules; CompletedCohomologyPartII:CC.3/coefficient-module-duality; mathlib:Module.support; mathlib:Module.Finite.

*Sources.*

- DLB, §13, paragraph before Définition 13.3, Définition 13.3, Remarque 13.4, p. 69; Lemmes 13.6–13.7, p. 70: The family Π^{univ} over A, π̄ = Π^{univ}/m irreducible, the module M of continuous A[G]-maps from Π^{univ} into C^0(X, O)\_m with its Schikhof dual M^\*, the fibre isomorphisms, finite generation of M^\* and the support criterion.

### Local–global compatibility for a definite quaternion algebra

*Theorem* `R31.4/definite-quaternionic-local-global-compatibility` — planet: Local–global compatibility for B̄

In the setting of R31.4/quaternionic-multiplicity-module (F = Q, B̄ definite and split at p, r̄ modular with r̄|G\_{Q\_p} absolutely irreducible): (1) for every maximal ideal 𝔭 of A[1/p], Hom^cont\_G(Π(𝔭), C^0(X)[𝔭]) ≠ 0 (weak local–global compatibility, DLB Proposition 13.5); (2) the evaluation map (Π^{univ} ⊗̂\_A M)[1/p] → C^0(X)\_m (ϖ-adically completed tensor product) is an isomorphism; (3) for every maximal ideal 𝔭 of A[1/p], C^0(X)[𝔭] ≅ Π(𝔭)^{⊕r} as G-representations, for some integer r > 0 (Emerton’s local–global compatibility for B̄, DLB Theorem 5.4). The proof passes through the family C of classical crystalline points: σ automorphic on B̄^\*(A), unramified outside Σ, with σ\_f^{K^p} ≠ 0, σ\_p^{GL\_2(Z\_p)} ≠ 0 and r̄\_σ = r̄, giving 𝔭\_σ; C is Zariski dense in Spec A[1/p], and for 𝔭 ∈ C the locally algebraic vectors LP(X)[𝔭] lie in the image of Π(𝔭) ⊗ Hom^cont\_G(Π(𝔭), C^0(X)[𝔭]).

*Hypotheses and conventions.*

- r̄|G\_{Q\_p} absolutely irreducible; the argument is Emerton’s, simplified by this hypothesis (DLB §5.1).
- The local inputs are Berger–Breuil (for crystalline absolutely irreducible ρ with Hodge–Tate weights a < b, Π(𝔭) is the universal unitary completion of σ\_p ⊗ Sym^{b−a−1} ⊗ det^a) and the existence of Π^{univ}; both are requested from PadicLocalLanglandsForGL2Qp (R30.4, R30.5).
- Emerton’s functional-analytic lemmas on completed tensor products with admissible orthonormalizable A[G]-modules are used as DLB use them (separatedness, closed image, m-torsion of reductions, 𝔭-parts).

*Proof sketch.*

1. (1): by Lemma 13.7 it suffices that Supp M^\*[1/p] is Zariski dense; C is Zariski dense (A[1/p] acts faithfully on C^0(X)\_m, GL\_2(Z\_p)-algebraic vectors are dense (R31.2/density-of-algebraic-vectors(c)) and lie in Σ\_{𝔭∈C} C^0(X)\_m[𝔭] by R31.2/definite-quaternionic-classical-forms) (DLB Lemme 13.8); for 𝔭 ∈ C Berger–Breuil gives Hom^cont\_G(Π(𝔭), C^0(X)[𝔭]) = Hom\_G(σ\_p ⊗ W, LP(X)[𝔭]) ≠ 0 and the image statement (DLB Lemme 13.9).
2. (2) injectivity: Π^{univ} ⊗̂ M is ϖ-adically separated (Emerton [33] Lemma 3.1.16), so test mod ϖ; on m-torsion, Emerton’s Lemma B.6 identifies the source with (M/ϖ)[m] ⊗ π̄, which embeds in π̄ ⊗ Hom(π̄, LC(X, k)[m]) → LC(X, k)[m], injective as π̄ is smooth irreducible; every element of the reduction is killed by a power of m (DLB proof of Théorème 5.4).
3. (2) surjectivity: M^\* finitely generated and Π^{univ} admissible orthonormalizable give a closed image (Emerton Proposition 3.1.3 with Lemma 3.1.16); the image contains LP(X)[𝔭] for 𝔭 ∈ C, whose sum is dense.
4. (3): take 𝔭-parts of (2) with Emerton’s Lemma 3.1.17: C^0(X)[𝔭] ≅ Hom\_A(A/𝔭, M) ⊗̂ Π^{univ}[1/p] ≅ Π(𝔭) ⊗ M[𝔭][1/p], and r = dim M[𝔭][1/p] > 0 by (1).

*Checks.*

- For 𝔭 = 𝔭\_σ ∈ C with σ\_p unramified principal series and r(𝔭)|G\_{Q\_p} crystalline irreducible, r ≥ dim σ\_f^{K^p}.
- Non-example: without r̄|G\_{Q\_p} absolutely irreducible, Π^{univ} as stated need not exist and C^0(X)[𝔭] can have constituents not isomorphic to Π(𝔭).

*Needs:* §R31.4/quaternionic-multiplicity-module; §R31.2/density-of-algebraic-vectors; §R31.2/definite-quaternionic-classical-forms; §R31.3/definite-quaternionic-hecke-algebra; PadicLocalLanglandsForGL2Qp:R30.4; PadicLocalLanglandsForGL2Qp:R30.5; CompletedCohomologyPartII:CC.3/mixed-completed-tensor; CompletedCohomologyPartII:CC.3/mixed-tensor-dual-comparison; GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl.

*Sources.*

- DLB, §5.1, Théorème 5.4, p. 26; §13, Proposition 13.5, Lemmes 13.8–13.9, pp. 70–71; proof of Théorème 5.4, pp. 72–73: Emerton’s local–global compatibility for the definite quaternion algebra B̄ split at p: C^0(X)[𝔭] ≅ Π(𝔭)^{⊕r}, proved through the weak statement at a Zariski-dense set of classical crystalline points, Berger–Breuil, and the evaluation isomorphism (Π^{univ} ⊗̂ M)[1/p] ≅ C^0(X)\_m.
- EM11, Proposition 3.1.3, Lemmas 3.1.16–3.1.17, pp. 14–18; Lemma B.6, p. 100: The functional-analytic facts on admissible orthonormalizable A[G]-modules that DLB cite as [33].

### The block multiplicity module

*Construction* `R31.4/block-multiplicity-module`

In Pan’s §3 setting (F totally real, p splitting completely, D definite and split above p, so D\_p^× = ∏\_{v|p}GL\_2(Q\_p)), let m be a maximal ideal of T\_ψ(U^p) with residual pseudo-representation ρ̄\_m, and B\_m = ⊗\_{v|p} B\_{m,v} the block of the category C\_{D\_p^×,ψ}(O) of compact O[[K\_p]]-modules with compatible D\_p^×-action and central character ψ attached to (ρ̄\_m|G\_{F\_v})\_{v|p} (with the cyclotomic twist of Remark 3.5.3). Let P\_{B\_m} be a projective envelope in that category, E\_{B\_m} = End(P\_{B\_m}) and R\_p^{ps,ψε^{-1}} = ⊗̂\_{v|p} R\_v^{ps,ψε^{-1}} the completed tensor product of the universal two-dimensional pseudo-deformation rings with determinant ψε^{-1}. Define m := Hom\_{C\_{D\_p^×,ψ}(O)}(P\_{B\_m}, M\_ψ(U^p)\_m). It carries two actions of R\_p^{ps,ψε^{-1}}: τ\_Gal, through T\_ψ(U^p)\_m acting on M\_ψ(U^p)\_m and the restrictions of the Hecke pseudo-representation to the decomposition groups at v | p; and τ\_Aut, through the isomorphism of the centre of E\_{B\_m} with R\_p^{ps} (Paškūnas, Corollary 3.4.12 of Pan) acting on P\_{B\_m}. When M\_ψ(U^p)\_m lies in the block B\_m, M\_ψ(U^p)\_m ≅ m ⊗̂\_{E\_{B\_m}} P\_{B\_m}.

*Hypotheses and conventions.*

- Blocks and projective envelopes are Paškūnas’s theory for GL\_2(Q\_p) (Pan §3.4), requested from PadicLocalLanglandsForGL2Qp R30.5; p = 3 has a block (containing δ∘det) excluded in Theorem 3.5.5.
- The normalisation of Colmez’s functor in Paškūnas’s papers introduces the cyclotomic twist between ρ̄\_m|G\_{F\_v} and the block (Pan Remark 3.5.3).

*API.*

- `TauCeti.DefiniteQuaternionCompleted.block` (data): B\_m = ⊗\_{v|p} B\_{m,v}, the block of C\_{D\_p^×,ψ}(O) attached to (ρ̄\_m|G\_{F\_v})\_v with Pan’s cyclotomic twist.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity` (constructor): m = Hom\_{C\_{D\_p^×,ψ}(O)}(P\_{B\_m}, M\_ψ(U^p)\_m).
- `TauCeti.DefiniteQuaternionCompleted.galoisAction` (data): τ\_Gal: R\_p^{ps,ψε^{-1}} → End(m) through T\_ψ(U^p)\_m.
- `TauCeti.DefiniteQuaternionCompleted.automorphicAction` (data): τ\_Aut: R\_p^{ps,ψε^{-1}} → End(m) through the centre of E\_{B\_m}.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_reconstruct` (characterisation): If M\_ψ(U^p)\_m lies in B\_m, m ⊗̂\_{E\_{B\_m}} P\_{B\_m} ≅ M\_ψ(U^p)\_m.

*Unit tests.*

- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_zero` (degenerate): If M\_ψ(U^p)\_m has no constituent in B\_m then m = 0.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_supersingular` (computation): If each ρ̄\_m|G\_{F\_v} is absolutely irreducible, E\_{B\_m} = R\_p^{ps} and τ\_Aut is the structure map of m as an E\_{B\_m}-module.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_compatibility` (compatibility): For F = Q and r̄\_p absolutely irreducible, m is the Schikhof dual of DLB’s M of R31.4/quaternionic-multiplicity-module after fixing the central character.
- `TauCeti.DefiniteQuaternionCompleted.blockMultiplicity_not_hecke` (non-example): τ\_Gal and τ\_Aut are a priori different maps; equating them is the content of Pan’s Theorem 3.5.5, not part of the definition.

*Uses.*

- PAN, Theorem 3.5.5: Local–global compatibility is the equality τ\_Gal = τ\_Aut on m.
- PAN, Corollary 3.5.10 and §4.7: m is finite faithful over T\_ψ(U^p)\_m and is the module patched at a one-dimensional prime.
- GL2ModularityLifting:R32.4 (through R31.4): The block multiplicity module, finite and faithful over the completed Hecke algebra (input CC3).

*Proof sketch.*

1. The category C\_{D\_p^×,ψ}(O) is a product over v | p of Paškūnas’s categories for GL\_2(Q\_p) with central character (Pan Lemma 3.4.10–3.4.11, Corollary 3.4.12); blocks containing an absolutely irreducible object have projective envelopes P\_B with E\_B finite over its centre ≅ R^{ps}\_B (Paškūnas, Theorems 3.4.5–3.4.6 of Pan).
2. M\_ψ(U^p)\_m is a compact O[[K\_p]]-module with central character ψ^{-1} (R31.1/definite-quaternionic-tower-structure(c)) and a compatible D\_p^×-action, so it is an object of C\_{D\_p^×,ψ}(O); Hom from P\_{B\_m} is exact on the B\_m-component.
3. τ\_Gal: T\_ψ(U^p)\_m acts on M\_ψ(U^p)\_m commuting with D\_p^×, hence on m; the Hecke pseudo-representation restricted to G\_{F\_v} gives R\_v^{ps} → T\_ψ(U^p)\_m (Pan 3.3 last paragraph). τ\_Aut: the centre of E\_{B\_m} acts on P\_{B\_m}, hence on m (Pan 3.5.4).

*Checks.*

- For ρ̄\_m|G\_{F\_v} absolutely irreducible at every v | p, each B\_{m,v} contains a single supersingular representation and E\_{B\_m} is commutative, equal to R\_p^{ps}.
- m/mm is finite-dimensional over k (Pan Corollary 3.5.11 proof).

*Needs:* §R31.1/definite-quaternionic-completed-module; §R31.1/definite-quaternionic-tower-structure; §R31.3/definite-quaternionic-hecke-algebra; §R31.3/hecke-galois-determinant-and-representation; PadicLocalLanglandsForGL2Qp:R30.5; IntegralHeckeAndGaloisDeterminants:IHG.1/universal-reductive-pseudocharacter-ring.

*Sources.*

- PAN, §3.4, Theorems 3.4.5–3.4.6, Lemmas 3.4.10–3.4.11, Corollary 3.4.12, pp. 26–28: Paškūnas’s blocks, projective envelopes and their endomorphism rings for GL\_2(Q\_p), and the product version for D\_p^× = ∏ GL\_2(Q\_p) with the identification of the centre with R\_p^{ps}.
- PAN, 3.5.1, Definition 3.5.2, Remark 3.5.3, 3.5.4, p. 29: The block B\_m attached to m, the module m = Hom(P\_{B\_m}, M\_ψ(U^p)\_m), and the two actions τ\_Gal and τ\_Aut of R\_p^{ps}.

### Pan’s semisimple local–global compatibility

*Theorem* `R31.4/pan-semisimple-local-global-compatibility` — planet: Pan’s local–global compatibility

In the setting of R31.4/block-multiplicity-module, if p = 3 assume δ∘det ∉ B\_{m,v} for every v | p. Then: (1) M\_ψ(U^p)\_m lies in the block B\_m; (2) the two actions τ\_Gal and τ\_Aut of R\_p^{ps,ψε^{-1}} on m coincide (Pan’s Theorem 3.5.5); (3) m is a faithful, finitely generated T\_ψ(U^p)\_m-module and T\_ψ(U^p)\_m is a finite R\_p^{ps,ψε^{-1}}-algebra (Corollary 3.5.10); (4) S\_ψ(U^p, k)[m] is a D\_p^×-representation of finite length (Corollary 3.5.11); (5) if 𝔭 is a maximal ideal of T\_ψ(U^p)\_m[1/p] such that for every v | p, ρ(𝔭)|G\_{F\_v} is absolutely irreducible and de Rham with distinct Hodge–Tate weights (ρ(𝔭) the semisimple representation with trace the Hecke pseudo-representation mod 𝔭), then 𝔭 is the pullback of a maximal ideal of a classical Hecke algebra T\_{(k,w),ψ}(U^pU\_p)[1/p] for some weight (k, w) and U\_p ⊂ K\_p, i.e. comes from a classical automorphic representation of (D ⊗ A\_F^∞)^× and, by Jacquet–Langlands, from a regular algebraic cuspidal automorphic representation of GL\_2(A\_F) (Corollary 3.5.12); (6) every irreducible component of T\_ψ(U^p)\_m has characteristic zero and dimension at least 1 + 2[F : Q] (Theorem 3.6.1).

*Hypotheses and conventions.*

- Pan’s §3 hypotheses; the p = 3 exclusion concerns the block containing δ∘det.
- The proof relies on the semisimplicity of the Hecke action at finite levels and compares the two actions only on classical crystalline points; it does not need ρ̄\_m irreducible (it covers the residually reducible case).
- (5) uses the absolute irreducibility of ρ(𝔭) at every place above p; Paškūnas’s Theorem 1.10 (all irreducible subquotients of the specialisation are isomorphic) is the local input.

*Proof sketch.*

1. (1)–(2) follow Emerton: by the density result (R31.2/density-of-algebraic-vectors(c), Pan Proposition 3.2.9) it suffices to compare the actions at classical crystalline points, where Berger–Breuil and classical local–global compatibility at p identify them (Pan proof of Theorem 3.5.5, Lemmas 3.5.6–3.5.9; local inputs from PadicLocalLanglandsForGL2Qp R30.4–R30.5).
2. (3): faithfulness from (1); finite generation over E\_{B\_m} by Paškūnas’s Proposition 4.17 (S\_ψ(U^p, E/O) is admissible), E\_{B\_m} finite over R\_p^{ps}, and τ\_Gal = τ\_Aut factors through T\_ψ(U^p)\_m (Pan Corollary 3.5.10).
3. (4): m/mm is finite-dimensional, hence of finite length over E\_{B\_m} (Pan Corollary 3.5.11).
4. (5): for 𝔭\_v the pullback to R\_v^{ps}, all irreducible subquotients of Hom^cont(P\_{B\_m,v}/𝔭\_vP\_{B\_m,v}, E) are isomorphic to one Π\_v (Paškūnas), whose locally algebraic vectors are nonzero for de Rham with distinct weights (Colmez); a nonzero map into S\_ψ(U^p)\_E[𝔭] produces locally algebraic vectors, which are classical by R31.2/definite-quaternionic-classical-forms (Pan proof of Corollary 3.5.12); Jacquet–Langlands is GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl.
5. (6): Gelfand–Kirillov dimension of M\_ψ(U^p)\_m/ϖ over F[[K]] equals 3[F : Q], and the dimension formula of Proposition 3.6.12 bounds the special fibre (Pan §3.6).

*Checks.*

- For F = Q (where Pan’s even-degree assumption is dropped in §3) and m non-Eisenstein with ρ̄\_m|G\_{Q\_p} absolutely irreducible, (2) recovers the R\_p-linearity of DLB’s local–global compatibility (R31.4/definite-quaternionic-local-global-compatibility).
- Non-example: (5) fails for a 𝔭 with ρ(𝔭)|G\_{F\_v} reducible at some v | p: such points need not be classical (ordinary or trianguline points of positive slope).

*Needs:* §R31.4/block-multiplicity-module; §R31.2/density-of-algebraic-vectors; §R31.2/definite-quaternionic-classical-forms; §R31.2/type-specialised-quaternionic-modules; PadicLocalLanglandsForGL2Qp:R30.4; PadicLocalLanglandsForGL2Qp:R30.5; GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl; AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime; mathlib:ringKrullDim.

*Sources.*

- PAN, Theorem 3.5.5 and its proof, Lemmas 3.5.6–3.5.9, pp. 29–32; Corollaries 3.5.10–3.5.12, pp. 32–33: Local–global compatibility for the definite quaternionic completed homology: it lies in the block and the Galois and automorphic actions of R\_p^{ps} agree; finiteness and faithfulness of m; finite length of the m-torsion; classicality of de Rham points absolutely irreducible at every place above p.
- PAN, Theorem 3.6.1, Proposition 3.6.12, pp. 34–36: Lower bound 1 + 2[F : Q] for the dimension of every irreducible component of the localised big Hecke algebra.

### Scholze’s functor and the completed cohomology of Shimura curves

*Theorem* `R31.4/scholze-functor-and-completed-cohomology-of-shimura-curves`

In the setting of R31.1/shimura-curve-completed-cohomology (E\_0 totally real of even degree with p split, D\_0 definite split at all finite places, D with invariants exchanged at 𝔭 and ∞\_0, a globalising π as in CDN Proposition 4.5), let S\_{ψ,λ,m} = Hom\_{U^p\_𝔭}(λ, S\_ψ(U^p, L/O))\_m be the λ-typical, m-localised definite quaternionic module of D\_0 (R31.1/definite-quaternionic-completed-module), an admissible injective GL\_2(Q\_p)-representation in the block of r̄^{ss} (CDN Propositions 4.7–4.8). (1) There is a natural isomorphism of T\_S^{univ}[G\_{Q\_p} × D\_𝔭^×]-modules S^1(S\_{ψ,λ,m}) ≅ Ĥ^1\_{ψ,λ,m}, where S^1 is Scholze’s functor from smooth admissible GL\_2(Q\_p)-representations to D\_𝔭^× × G\_{Q\_p}-representations (the degree-one cohomology of the Lubin–Tate tower’s pro-étale torsor over P^1, with coefficients in the sheaf attached to the representation) (Paškūnas, Lemma 6.2, from Scholze). (2) ρ̄ deforms to ρ\_m: G\_{E\_0,S} → GL\_2(T(U^p)\_m) with characteristic polynomial X^2 − T\_vX + N(v)S\_v at Frob\_v (v ∉ S), and with N = Hom\_{T(U^p)\_m[G\_{E\_0,S}]}(ρ\_m, Ĥ^1\_{ψ,λ}(U^p, O)\_m) the evaluation map ρ\_m ⊗\_{T(U^p)\_m} N → Ĥ^1\_{ψ,λ}(U^p, O)\_m is an isomorphism (Carayol–Scholze isotypy). Together these turn a local question on S^1(π) into a question on completed cohomology.

*Hypotheses and conventions.*

- Scholze’s functor S^i is not planned in the atlas: it is the subject of the pending design DESIGN-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower (route of PAPER-COLMEZ-DOSPINESCU-NIZIOL-23); this node is conditional on it (gap ‘Scholze’s functor’).
- The Shimura curve here is attached to D, ramified at 𝔭; the definite algebra D\_0 is split at 𝔭, and the two are related by the exchange of invariants at 𝔭 and ∞\_0 (fixed isomorphism (4.6) away from p∞\_0).
- ρ̄ absolutely irreducible (SL\_2(k) ⊂ Im ρ̄\_π ⊂ GL\_2(k) by the globalisation of CDN Proposition 4.5).

*Proof sketch.*

1. (1) is Scholze’s comparison of the completed cohomology of the Shimura curve for D with S^1 applied to the completed degree-zero module of D\_0 in Paškūnas’s λ-typical, ψ-isotypic, m-localised form (CDN Proposition 4.11, citing [55, Lemma 6.2]); the definite-side module is R31.1/definite-quaternionic-completed-module with R31.1/definite-quaternionic-tower-structure(d).
2. (2): the deformation ρ\_m is R31.3/hecke-galois-determinant-and-representation(c) for the Shimura-curve Hecke algebra; isotypy combines Scholze’s Propositions 5.3, 5.4 and 5.8 (CDN Proposition 4.12), with the finite-level Eichler–Shimura relation for Shimura curves, which is Carayol’s construction of the Galois representations on their cohomology (AutomorphicGaloisRepresentations:R19.2/carayol-sigma-lambda-construction), the eigenspace decomposition being HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-eigenspaces.
3. The duality (Ĥ^1\_{ψ,λ,m})^∨ ≅ Ĥ^1\_{ψ,λ}(U^p, O)\_m^d of R31.1/shimura-curve-completed-cohomology transports (1) to the integral completed cohomology.

*Checks.*

- CDN use (1)–(2) to show that S^1(π) for a supersingular π has G\_{Q\_p}-action through ρ̄-isotypic pieces (their §4.1.5).
- Non-example: replacing S\_{ψ,λ,m} by the modular-curve object of R31.1/the-object-the-conjecture-is-about is wrong: Scholze’s functor relates the definite algebra split at p to the Shimura curve ramified at p, not the modular curve to itself.

*Needs:* §R31.1/shimura-curve-completed-cohomology; §R31.1/definite-quaternionic-completed-module; §R31.1/definite-quaternionic-tower-structure; §R31.3/hecke-galois-determinant-and-representation; HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-eigenspaces; AutomorphicGaloisRepresentations:R19.2/carayol-sigma-lambda-construction; AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility.

*Sources.*

- CDN, Propositions 4.7–4.8 and Remark 4.9, p. 49; Proposition 4.11, Proposition 4.12, p. 51: S\_{ψ,λ,m} is admissible and injective in the block of r̄^{ss}; Paškūnas’s Lemma 6.2 (after Scholze) gives S^1(S\_{ψ,λ,m}) ≅ Ĥ^1\_{ψ,λ,m}; ρ̄ deforms to ρ\_m over T(U^p)\_m and Ĥ^1\_{ψ,λ}(U^p, O)\_m ≅ ρ\_m ⊗ N.
- CDN, §3.1, Théorème 3.1, pp. 40–41: Recollection of Scholze’s functor S^i and his finiteness theorem.

## R31.5. Patched completed modules and support

<a id="r31-5"></a>

The patched module M\_∞ of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin is constructed once, for GL\_n(F) with p ∤ 2n, from a definite unitary globalisation; it is finite projective over S\_∞[[K]], carries a GL\_n(F)-action commuting with the patched deformation ring, recovers completed cohomology modulo the augmentation ideal, and yields admissible Banach representations V(r) = Π\_∞[𝔪\_y]. Type-specialised patched modules are Cohen–Macaulay of rank one on the generic fibre and supported on unions of components, with Hecke algebras of types acting through the Bernstein centre. Emerton–Paškūnas show the support of M\_∞ is a union of components — not, in general, full support — and Tung proves full support on every component for GL₂(Q\_p) at odd p and at p = 2, via the p-adic local Langlands correspondence on non-ordinary components and an ordinary R = T theorem on ordinary ones; the Breuil–Mézard identities follow. On the quaternionic side completed homology itself is patched (Tung, Pan), and Pan's patching at a one-dimensional nice prime proves that the pseudo-deformation-to-Hecke map has nilpotent kernel there.

### The patched module M∞

*Construction* `R31.5/ceggps-patched-module` — planet: Patched module M∞

Let F/Q\_p be finite, n ≥ 1 with p ∤ 2n, and r̄: G\_F → GL\_n(k) continuous admitting a potentially crystalline, potentially diagonalisable lift of regular weight (automatic after extending scalars if n = 2 or r̄ is semisimple). Choose a suitable globalisation (F̃/F̃^+ CM with each place v | p of F̃^+ split and F̃^+\_v ≅ F, ρ̄: G\_{F̃^+} → 𝒢\_n(k) automorphic, irreducible on G\_{F̃}, with adequate image on G\_{F̃(ζ\_p)}, restricting to r̄ at chosen ṽ | p), a definite unitary group G̃ over F̃^+, a tame level U^p, the localised completed cohomology S̃\_{ξ,τ}(U^p, O)\_m of G̃ with fixed types ξ, τ away from p, and Taylor–Wiles data Q\_N. With R^loc = R^□\_{r̄} ⊗̂ ⊗̂\_{v ∈ S∖{p}} R^{ξ,τ}\_{ṽ} (the framed local ring at p unrestricted), R\_∞ = R^loc[[x\_1, …, x\_{q−[F̃^+:Q]n(n−1)/2}]], S\_∞ = O[[z\_1, …, z\_{n^2#T}, y\_1, …, y\_q]], K = GL\_n(O\_F) and G = GL\_n(F), the patching construction produces a compact O-module M\_∞ with commuting actions of R\_∞ and G (and of S\_∞ through a map S\_∞ → R\_∞), such that: (1) M\_∞ is finitely generated and projective over S\_∞[[K]], hence finitely generated over R\_∞[[K]]; (2) with a = (z\_i, y\_j) ⊂ S\_∞, there is a G-equivariant isomorphism M\_∞/aM\_∞ ≅ S̃\_{ξ,τ}(U^p, O)^d\_m compatible with the R^loc-action; (3) M\_∞ is projective in the category of pseudo-compact Λ[[K]]-modules (Λ the completed group ring of the centre at the determinant), and M\_∞ ⊗̂\_{Λ\_Z,x} O is a nonzero projective object of the category C(O) with fixed central character. Put Π\_∞ = Hom^cont\_O(M\_∞, E) with the maximum norm, a unitary Banach representation of G with an R\_∞-action; for y: R\_∞ → O extending a point x of R^□\_{r̄}, V(r\_x) = (M\_∞ ⊗\_{R\_∞,y} O)^d[1/p] = Π\_∞[𝔪\_y] is an admissible unitary Banach representation of G. For n = 2 and F = Q\_p this is the patched module of Tung’s odd-p work and of Emerton–Paškūnas.

*Hypotheses and conventions.*

- p ∤ 2n; r̄ has a potentially diagonalisable regular-weight potentially crystalline lift (CEGGPS §2.1, Lemma 2.2).
- M\_∞ depends on the global choices (globalisation, U^p, Q\_N, ultrafilter or diagonal subsequence); V(r) is not known to be independent of them or nonzero in general (CEGGPS Remark 2.14).
- The globalisation uses Emerton–Gee Corollary A.7 and potential automorphy (BLGGT); these are globalisation inputs audited in R31.6/globalisation-dependence-audit (CC5).

*API.*

- `TauCeti.PatchedCompletedModule.patchedModule` (constructor): M\_∞, a compact O-module with commuting actions of R\_∞ and G = GL\_n(F), and an S\_∞[[K]]-module structure through S\_∞ → R\_∞.
- `TauCeti.PatchedCompletedModule.patchedModule_projective` (characterisation): M\_∞ is finitely generated projective over S\_∞[[K]], hence finitely generated over R\_∞[[K]].
- `TauCeti.PatchedCompletedModule.patchedModule_augmentation` (compatibility): M\_∞/aM\_∞ ≅ S̃\_{ξ,τ}(U^p, O)^d\_m, G-equivariantly and compatibly with the R^loc-action.
- `TauCeti.PatchedCompletedModule.patchedModule_pseudocompactProjective` (characterisation): M\_∞ is projective among pseudo-compact Λ[[K]]-modules; M\_∞ ⊗̂\_{Λ\_Z,x} O is a nonzero projective object of C(O).
- `TauCeti.PatchedCompletedModule.patchedBanach` (constructor): Π\_∞ = Hom^cont\_O(M\_∞, E) with its R\_∞-action and unitary G-action.
- `TauCeti.PatchedCompletedModule.fibreBanach` (constructor): V(r\_x) = Π\_∞[𝔪\_y] = (M\_∞ ⊗\_{R\_∞,y} O)^d[1/p] for y: R\_∞ → O over x.
- `TauCeti.PatchedCompletedModule.fibreBanach_admissible` (characterisation): V(r\_x) is an admissible unitary Banach representation of G.

*Unit tests.*

- `TauCeti.PatchedCompletedModule.patchedModule_rank_one_GL1` (degenerate): For n = 1, Π\_∞[𝔪\_y] is the character of F^× attached to the character r\_x by local class field theory.
- `TauCeti.PatchedCompletedModule.patchedModule_augmentation_compatibility` (compatibility): Reducing M\_∞ modulo a recovers the Pontryagin–Schikhof dual of the localised completed cohomology of the definite unitary group (CEGGPS Corollary 2.11).
- `TauCeti.PatchedCompletedModule.patchedModule_mod_varpi` (computation): M\_∞/(ϖ, 𝔪\_{R\_∞}) is a finitely generated k[[K]]-module whose Pontryagin dual is an admissible smooth G-representation over k.
- `TauCeti.PatchedCompletedModule.patchedModule_not_completed_cohomology` (non-example): M\_∞ is not the dual of completed cohomology at a fixed tame level: it has R\_∞-rank growing with the patching variables, and only its quotient by a recovers that dual.

*Uses.*

- TUNG-P3, §§3–4: The support of M\_∞(σ) meets every component of the potentially semistable ring, giving Breuil–Mézard for odd p (input CC4).
- EP, §6: Support of M\_∞ in Spec R\_∞ is a union of irreducible components.
- DING, §4.1: Π\_∞ and the patched eigenvariety built from J\_B(Π\_∞^{R\_∞-an}) (the eigenvariety itself is assigned to the Part II design).
- GL2ModularityLifting:R22.1 and R32.2 (through R31.5): Tung’s odd-prime Breuil–Mézard input and the de Rham lifting theorem (input CC4).

*Proof sketch.*

1. Globalise r̄ (EG14 Corollary A.7) and set up the definite unitary group, its algebraic modular forms and Hecke algebras (PotentialAutomorphyInfrastructurePartII:PL.2/definite-unitary-group, PL.2/unitary-algebraic-modular-forms, PL.2/unitary-hecke-algebra) and the polarized global deformation problem with its universal ring R^{univ}\_S and Taylor–Wiles primes (GlobalGaloisDeformations:G7/polarized-deformation-problem, G7/polarized-representability, G7/enormous-taylor-wiles-primes); the local framed rings are LocalGaloisDeformationRings:R08.1/local-lifting-ring (CEGGPS §§2.1–2.6).
2. Define M\_{1,Q\_N} as the Pontryagin dual of the projected localised forms at level U\_1(Q\_N)\_{2N} with O/ϖ^N coefficients; each is a finite projective (O/ϖ^N)[Δ\_{Q\_N}][Γ\_{2N}]-module with partial G-actions α\_N: M\_{1,Q\_N} → Ind^{G\_N}\_{KZ}((M\_{1,Q\_N})\_{K\_N}) (CEGGPS §2.8, Remark 2.9).
3. Patch by the Taylor–Wiles–Kisin method (DeformationAndDerivedPatchingAlgebra:R03.5/patched-module, R03.5/patched-ring-action, R03.5/patching-extraction): pass to the limit along a compatible subsystem to get M\_∞ with R\_∞- and S\_∞[[K]]-actions and α\_∞: M\_∞ → Ind^G\_{KZ} M\_∞; Proposition 2.10 shows M\_∞ is finite projective over S\_∞[[K]] (splitting a surjection from S\_∞[[K]]^r using projectivity at each finite level), α\_∞ is injective with G-stable image, giving the G-action.
4. (2) is the limit of the level-N isomorphisms ψ (CEGGPS Corollary 2.11), whose G-equivariance uses the analogue of Proposition 2.10 for completed cohomology (the degree-zero identification of CompletedCohomologyPartII:CC.8/definite-unitary-degree-zero, stated there for LLHLM’s definite GL\_3; its extension to the rank-n definite unitary groups of CHT/Thorne type is requested from CC.8); (3) is Proposition 4.23 (pro-free over Λ[[P]] for a pro-p Sylow P) and Corollary 4.26.
5. Admissibility of V(r): (M\_∞ ⊗\_{R\_∞,y} F)^{K\_N} is finite-dimensional because M\_∞ is finite over S\_∞[[K]] and ker y induces an open ideal of S\_∞ (CEGGPS Proposition 2.13).

*Checks.*

- For n = 1 the construction degenerates to local class field theory: M\_∞ is free of rank one over R\_∞[[K]]-coinvariant data and V(r) is the character attached to r by local reciprocity.
- For n = 2, F = Q\_p and r\_x absolutely irreducible, the local–global compatibility of R31.5/full-support-odd-p identifies V̌(Π\_y) with r\_x^{⊕n\_y}.

*Needs:* PotentialAutomorphyInfrastructurePartII:PL.2/definite-unitary-group; PotentialAutomorphyInfrastructurePartII:PL.2/unitary-algebraic-modular-forms; PotentialAutomorphyInfrastructurePartII:PL.2/unitary-hecke-algebra; GlobalGaloisDeformations:G7/polarized-deformation-problem; GlobalGaloisDeformations:G7/polarized-representability; GlobalGaloisDeformations:G7/enormous-taylor-wiles-primes; LocalGaloisDeformationRings:R08.1/local-lifting-ring; DeformationAndDerivedPatchingAlgebra:R03.5/patched-module; DeformationAndDerivedPatchingAlgebra:R03.5/patched-ring-action; DeformationAndDerivedPatchingAlgebra:R03.5/patching-extraction; CompletedCohomologyPartII:CC.8/definite-unitary-degree-zero; CompletedCohomologyPartII:CC.3/definite-degree-zero-dual-interface; mathlib:Module.Projective; mathlib:MvPowerSeries.

*Sources.*

- CEGGPS, §2.1, Lemma 2.2, pp. 15–17; §2.8 and Remark 2.9, pp. 24–26; definitions of R\_∞ and S\_∞, p. 27: The globalisation of r̄, the finite-level modules M\_{1,Q\_N} with partial G-actions, and the patching rings R\_∞ = R^loc[[x]] and S\_∞ = O[[z, y]].
- CEGGPS, Proposition 2.10, p. 30; Corollary 2.11, p. 33; §2.12 and Proposition 2.13, Remark 2.14, pp. 33–34: M\_∞ is finitely generated projective over S\_∞[[K]] with a G-action; M\_∞/aM\_∞ recovers the dual of localised completed cohomology; V(r) is admissible unitary.
- CEGGPS, Proposition 4.23 and Corollary 4.26, pp. 68–70: M\_∞ is projective among pseudo-compact Λ[[K]]-modules, and its specialisation at a central character is a nonzero projective object of C(O).
- DING, §4.1, p. 63: Π\_∞ := Hom^cont(M\_∞, E) with the maximum norm is a unitary Banach representation of GL\_n(K) with an action of R\_∞ ≅ R^□\_ρ̄ ⊗̂ R^℘\_∞.
- TUNG-P3, §3, Definition 3.2 and the definition of Π\_∞, Π\_y, pp. 9–10: For n = 2, F = Q\_p: Π\_y = Π\_∞[𝔪\_y] is admissible unitary (CEGGPS Proposition 2.13); the support of M\_∞(σ) defines the automorphic components.

### Type-specialised patched modules and their support

*Theorem* `R31.5/type-specialised-patched-modules`

In the setting of R31.5/ceggps-patched-module, for a K-stable O-lattice σ° in a locally algebraic type σ = σ^{(cr)}(λ, τ) (algebraic of highest weight λ tensored with the K-type attached to an inertial type τ by the inertial local Langlands correspondence), put M\_∞(σ°) = (Hom^cont\_{O[[K]]}(M\_∞, (σ°)^d))^d ≅ lim\_n Hom^cont\_{O[[K]]}(M\_∞, (σ°/ϖ^n)^∨)^∨. Let R\_∞(σ)′ = R\_∞ ⊗\_{R^□\_{r̄}} R^□\_{r̄}(σ) (potentially crystalline ring of type σ) and R\_∞(σ) the quotient acting faithfully on M\_∞(σ°). Then: (1) R\_∞(σ) is a reduced O-torsion-free quotient of R\_∞(σ)′; (2) M\_∞(σ°) is finitely generated over R\_∞(σ) and Cohen–Macaulay, M\_∞(σ°)[1/p] is locally free of rank one over R\_∞(σ)[1/p] (in the potentially crystalline case; over the regular locus of the support in Tung’s potentially semistable variant), and the topology is the m-adic one; (3) the support of M\_∞(σ°) in Spec R\_∞(σ)′ is a union of irreducible components (its automorphic components); (4) the Hecke algebra H(σ) = End\_G(c-Ind^G\_K σ) acts on M\_∞(σ°)[1/p] through the map H(σ) → R^□\_{r̄}(σ)[1/p] interpolating the Bernstein-centre local Langlands correspondence (local–global compatibility at p); (5) if x is a closed point of Spec R\_∞(σ)[1/p] with π\_sm(r\_x) generic, then V(r\_x)\_{l.alg} ≅ π\_sm(r\_x) ⊗ π\_alg(r\_x), the Breuil–Schneider representation.

*Hypotheses and conventions.*

- σ potentially crystalline (σ^{cr}) in CEGGPS; Tung’s and Pyvovarov’s potentially semistable variants σ(λ, τ) give the same statements with ‘regular locus of the support’ in (2).
- Genericity of π\_sm(r\_x) is needed in (5).

*Proof sketch.*

1. M\_∞(σ°) is finite projective (free) over S\_∞, being a direct summand of Hom(S\_∞[[K]]^r, (σ°)^d)^d (CEGGPS proof of Lemma 4.18); the comparison with completed homology modulo a is R31.2/type-specialised-quaternionic-modules’ unitary analogue (CEGGPS Lemma 4.14, Remark 4.16).
2. (1)–(3): classical local–global compatibility at ṽ | p at finite auxiliary levels shows the R\_∞-action factors through R\_∞(σ)′; Cohen–Macaulayness from freeness over S\_∞ and dim R\_∞(σ) = dim S\_∞; support a union of components by depth (DeformationAndDerivedPatchingAlgebra:R03.6/supported-on-components; CEGGPS Lemmas 4.17–4.18).
3. (4) is CEGGPS Theorem 4.1 and Theorem 4.19 (the map η: H(σ) → R^□(σ)[1/p] of Theorem 4.1, with its integrality Lemma 4.17(2)), using Bernstein-centre local Langlands (CEGGPS §3, SmoothRepresentationsOfLocalGroups SR.5 integral Bernstein blocks).
4. (5): x is a smooth point of Spec R\_∞(σ), so M\_∞(σ°) is locally free of rank one there; Propositions 4.33–4.34 compute V(r\_x)\_{l.alg} ≅ π ⊗ π\_alg(r\_x) with π in the Bernstein component Ω and identify π with π\_sm(r\_x) when generic (CEGGPS Theorem 4.35).

*Checks.*

- For σ = the trivial type of weight λ = (1, 0) (Barsotti–Tate, τ trivial), R^□(σ) is the crystalline Barsotti–Tate ring and M\_∞(σ°) is the classical patched module of Kisin’s method.
- Non-example: support on a union of components is not full support; Cohen–Macaulayness alone does not give support on every component (DeformationAndDerivedPatchingAlgebra R03.6).

*Needs:* §R31.5/ceggps-patched-module; §R31.2/type-specialised-quaternionic-modules; LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.3/pcris-generic-smooth; LocalGaloisDeformationRings:R08.3/hodge-and-galois-types; DeformationAndDerivedPatchingAlgebra:R03.6/supported-on-components; DeformationAndDerivedPatchingAlgebra:R03.3/free-of-maximal-depth-regular-local; DeformationAndDerivedPatchingAlgebra:R03.3/degree-indexed-multiplicity; SmoothRepresentationsOfLocalGroups:SR.5.

*Sources.*

- CEGGPS, Theorem 4.1, p. 51; Lemma 4.14, Remark 4.16, Lemma 4.17, Lemma 4.18, Theorem 4.19, pp. 60–66: The patched modules M\_∞(σ°), the reduced quotient R\_∞(σ), Cohen–Macaulayness and rank-one local freeness, support a union of irreducible components, and compatibility of the Hecke algebra H(σ) with the Bernstein-centre map to the potentially crystalline ring.
- CEGGPS, Propositions 4.33–4.34 and Theorem 4.35, pp. 72–74: Locally algebraic vectors of V(r\_x) are π\_sm(r\_x) ⊗ π\_alg(r\_x) for generic π\_sm(r\_x).
- TUNG-2, Proposition 5.2.2, p. 27: The same statements for the quaternionic patched module in Tung’s 2-adic setting, with potentially semistable types.

### Support of the patched module (Emerton–Paškūnas)

*Theorem* `R31.5/patched-support-is-a-union-of-components`

In the setting of R31.5/ceggps-patched-module with R^□\_{r̄} the unrestricted framed ring: (1) the support of M\_∞ in Spec R\_∞, defined as V(Ann\_{R\_∞} M\_∞) (M\_∞ being finitely generated over R\_∞[[K]] rather than over R\_∞), is a union of irreducible components of Spec R\_∞; (2) the Zariski closure in (Spf R\_∞)^{rig} of the crystalline points in the support is a union of irreducible components; (3) consequently, if Spf R^□\_{r̄} is irreducible (for instance formally smooth), M\_∞ has full support and R\_∞ acts faithfully on it; (4) for n = 2, F = Q\_p and r̄ not of the form (1 ∗; 0 ω) ⊗ χ nor (for p = 3) a twist of ω\_2^2 ⊕ ω\_2^6 on inertia, R\_∞^ψ acts faithfully on V̌(M\_∞^ψ) (Colmez’s functor applied to the fixed-central-character specialisation). Full support on every component is not asserted in general: (1) gives a union of components only.

*Hypotheses and conventions.*

- For a finitely generated A[[K]]-module, Supp\_A is V(annihilator); generators over A[[K]] generate an A-submodule with the same support (EP Lemma 6.2).
- (4) uses that Spec R^□\_{r̄} is irreducible and reduced in the stated cases (Paškūnas, Böckle).

*Proof sketch.*

1. (1): algebraic representations of K capture every projective object (EP Proposition 3.1), so the support of M\_∞ is the closure of the union of supports of the M\_∞(ξ) for algebraic ξ; each is reduced (CEGGPS Lemma 4.17), and by (2) the support of M\_∞[1/p] is a union of components; p-torsion-freeness passes this to Spec R\_∞ (EP Theorem 6.3).
2. (2) follows the infinite-fern approach of Chenevier and Nakamura, with Breuil–Hellmann–Schraen’s patched Jacquet module to make the argument sensitive to the support of M\_∞ (EP Theorem 6.5).
3. (3) from (1) and irreducibility (EP Remark 6.4, Corollary 5.5); faithfulness is read off directly from the annihilator definition of the support, since M\_∞ is finite over R\_∞[[K]] but not over R\_∞ (the finite-module criterion of DeformationAndDerivedPatchingAlgebra R03.6 applies to the typed modules M\_∞(σ°), not to M\_∞).
4. (4): R\_∞ ≅ R\_∞^ψ ⊗̂ Λ\_Z; apply (1) to M\_∞^ψ ⊗̂ Λ\_Z, which carries an arithmetic action, and use irreducibility and reducedness of Spec R^□\_{r̄}; then V̌ preserves faithfulness through the Cayley–Hamilton quotient (TUNG-P3 Proposition 3.9, with Theorem 3.7 and Corollary 3.8).

*Checks.*

- For r̄ absolutely irreducible with End(r̄) = k and p ≥ 5, R^□\_{r̄} is formally smooth, so M\_∞ has full support.
- CC5 caveat (GL2ModularityLifting supplier contract): Theorem 6.3 gives support on a union of components, so Tung’s Proposition 3.9 keeps its irreducibility, reducedness and density inputs.

*Needs:* §R31.5/ceggps-patched-module; §R31.5/type-specialised-patched-modules; LocalGaloisDeformationRings:R08.1/local-lifting-ring; DeformationAndDerivedPatchingAlgebra:R03.6/supported-on-components; PadicLocalLanglandsForGL2Qp:R30.3; mathlib:Module.annihilator; mathlib:PrimeSpectrum.zeroLocus.

*Sources.*

- EP, Definition 6.1, Lemma 6.2, Theorem 6.3, Remark 6.4, Theorem 6.5, pp. 25–26; Theorem 1.8, p. 3: The support of M\_∞ in Spec R\_∞ is a union of irreducible components, via density of crystalline points in the support; full support follows when the framed ring is irreducible.
- TUNG-P3, Propositions 3.4–3.5, Theorem 3.7, Corollary 3.8, Proposition 3.9, pp. 10–12: For GL\_2(Q\_p): M\_∞^ψ carries an arithmetic action, V̌(M\_∞^ψ) is finitely generated over R\_∞^ψ, and R\_∞^ψ acts faithfully on V̌(M\_∞^ψ) when Spec R^□\_{r̄} is irreducible and reduced.

### Full support of patched modules for GL₂(Q\_p), p odd (Tung)

*Theorem* `R31.5/full-support-odd-p` — planet: Full support of patched modules

Let p > 2, F = Q\_p, n = 2 in R31.5/ceggps-patched-module, and fix a determinant ψ. (1) For every closed point y ∈ Spec R\_∞[1/p] whose Galois representation r\_x is absolutely irreducible, V̌(Π\_y) ≅ r\_x^{⊕n\_y} for some n\_y ≥ 1, where V̌ is Colmez’s functor in Paškūnas’s normalisation and Π\_y = Π\_∞[𝔪\_y] (in particular Π\_y ≠ 0 for every y); hence M\_∞(σ°)[1/p] is supported on every component of R\_∞(σ)[1/p] that is non-ordinary at p, for every locally algebraic type σ (Tung Theorem 4.1). (2) If moreover r\_x is potentially semistable with π\_sm(r\_x) generic, then V̌(Π\_y) ≅ r\_x, so n\_y = 1 on an open dense set of closed points (Corollary 4.3). (3) For σ = σ(λ, τ) or σ^{cr}(λ, τ), every irreducible component of R^□\_{r̄}(σ)[1/p] is automorphic (meets the support of M\_∞(σ°)), except possibly the semistable non-crystalline component when r̄ ≅ (ω ∗; 0 1) ⊗ χ, λ = (a + 1, a) and τ = η ⊕ η (Proposition 4.4). (4) Breuil–Mézard: for each smooth irreducible k-representation σ̄ of GL\_2(Z\_p) there is a four-dimensional cycle C\_σ̄(r̄) of R^{□,ψ}\_{r̄}, independent of λ and τ, with Z(R^{□,ψ}\_{r̄}(λ, τ)/ϖ) = Σ\_σ̄ m\_σ̄(λ, τ) C\_σ̄(r̄) and the analogous identity for the potentially crystalline rings (Theorem 1.2); consequently every component of R^□\_{r̄}(σ)[1/p] is automorphic, the exception of (3) included (Corollary 4.6, through Emerton–Gee’s Theorem 5.5.2). (5) Global consequence (Theorem 4.7): for F a totally real field in which p splits completely and ρ: G\_{F,S} → GL\_2(O) continuous with ρ̄ modular, ρ̄|G\_{F(ζ\_p)} absolutely irreducible and ρ|G\_{F\_v} potentially semistable with distinct Hodge–Tate weights for each v | p, ρ comes up to twist from a Hilbert modular form.

*Hypotheses and conventions.*

- p > 2. (5) assumes ρ̄ modular (residual modularity); the globalisations inside the proofs (Tung Lemmas 4.3.3–4.3.4 in the dyadic paper, CEGGPS’s potential automorphy, Barnet-Lamb–Gee–Geraghty Theorem A.4.1 on the reducible locus) are audited for independence from Serre’s conjecture in R31.6/globalisation-dependence-audit (CC5).
- Barnet-Lamb–Gee–Geraghty’s Theorem A.4.1 assumes a potentially automorphic residual seed (recorded in the audit).
- The local consequence (4) is a statement about local deformation rings proved through global patching; consumers cite it from this node (the PadicLocalLanglandsForGL2Qp R30.6 request explains why R30.6 cannot import it).

*Proof sketch.*

1. (1): V̌(M\_∞) is finitely generated over R\_∞ (Tung Corollary 3.8) and R\_∞ acts faithfully (R31.5/patched-support-is-a-union-of-components(4)); for absolutely irreducible r\_x the action of R\_∞[[G\_{Q\_p}]] ⊗ κ(y) on V̌(Π\_y) factors through the Cayley–Hamilton quotient g^2 − tr r\_x(g) g + det r\_x(g) (Theorem 3.7), so V̌(Π\_y) ≅ r\_x^{⊕n\_y} by Boston–Lenstra–Ribet, and n\_y ≥ 1 since V̌(Π\_y) ≠ 0 (Corollary 3.10) (TUNG-P3 Theorem 4.1); Colmez’s functor and Paškūnas’s theory are requested from PadicLocalLanglandsForGL2Qp R30.3 and R30.5.
2. (2): an absolutely irreducible subrepresentation Π of Π\_y has no SL\_2(Q\_p)-invariants (Lemma 4.2), so V̌(Π) ≅ r\_x, and a multiplicity computation through Paškūnas’s category gives V̌(Π\_y) ≅ r\_x (TUNG-P3 Corollary 4.3).
3. (3): by (1) only the components in the reducible locus remain; their points are extensions of de Rham characters, treated through Barnet-Lamb–Gee–Geraghty Theorem A.4.1 except in the stated semistable case (TUNG-P3 Proposition 4.4).
4. (4): from (3) and the Paškūnas/Emerton–Gee equivalence between automorphy of all components and the cycle identities, applied type by type (TUNG-P3 Theorem 1.2), then Emerton–Gee’s Theorem 5.5.2 for the remaining component (Corollary 4.6).
5. (5): the Taylor–Wiles–Kisin argument of Kisin’s Theorem 2.2.18 and Hu–Tan’s Theorem 6.3 with all components automorphic (TUNG-P3 Theorem 4.7).

*Checks.*

- For r̄ absolutely irreducible and σ crystalline of weight (k−1, 0) with 2 ≤ k ≤ p, (3) recovers the automorphy of the (formally smooth, irreducible) crystalline ring.
- Non-example: (3) does not follow from a union-of-components support statement alone; it uses the p-adic local Langlands input of (1).

*Needs:* §R31.5/patched-support-is-a-union-of-components; §R31.5/type-specialised-patched-modules; §R31.5/ceggps-patched-module; PadicLocalLanglandsForGL2Qp:R30.3; PadicLocalLanglandsForGL2Qp:R30.4; PadicLocalLanglandsForGL2Qp:R30.5; LocalGaloisDeformationRings:R08.3/pst-deformation-ring; LocalGaloisDeformationRings:R08.3/pst-generic-fibre; DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-and-component-support-conclusions; DeformationAndDerivedPatchingAlgebra:R03.6/cycle-specialization-multiplicity.

*Sources.*

- TUNG-P3, Theorem 1.2, p. 4; Corollary 3.8, Corollary 3.10, pp. 11–12; Theorem 4.1, Lemma 4.2, Corollary 4.3, pp. 12–13; Proposition 4.4, Corollary 4.6, Theorem 4.7, pp. 14–16: For p > 2: V̌(Π\_y) ≅ r\_x^{⊕n\_y} at absolutely irreducible points (n\_y = 1 at generic potentially semistable points); automorphy of every component of the potentially semistable rings except one semistable case, then of all of them after the Breuil–Mézard identities; and the totally real automorphy theorem under residual modularity.

### Patched completed homology of a definite quaternion algebra

*Construction* `R31.5/quaternionic-patched-completed-homology` — planet: Patched completed homology

In the setting of R31.1/definite-quaternionic-completed-module (F totally real, p split, D definite and split above p) with a non-Eisenstein maximal ideal m of T^S\_ψ(U^p), a global deformation problem S for ρ̄\_m (local conditions D\_{v,ψ} at v | p, odd conditions at real places, Steinberg conditions at Σ, an auxiliary place v\_1) and Taylor–Wiles data (Q\_N, {α\_v}), the patching of the completed homology modules M\_ψ(U^p\_{Q\_N})\_m produces: a pseudo-compact O\_∞[[K\_p]]-module M̃\_∞ with compatible G\_p = ∏\_{v|p}GL\_2(F\_v)-action, a patched deformation ring R̃\_∞ (a power series ring over R^loc = ⊗̂\_{v∈S} R\_v) acting on it, and an ideal a ⊂ O\_∞ = O[[y\_1, …, y\_q]] (with framing variables) such that M̃\_∞/aM̃\_∞ ≅ M\_ψ(U^p)\_m G\_p- and R^S\_ψ-equivariantly. For an open ideal J and U\_p ⊂ K\_p the specialisations O\_∞/J ⊗ M̃\_∞ recover patched finite-level modules; M̃\_∞ is projective in the category of pseudo-compact O\_∞[[K\_p]]-modules with central character. Pan’s variant at a one-dimensional prime patches the localisation at a prime q of the pseudo-deformation ring instead (patched completed homology, Pan Definition 4.5.6).

*Hypotheses and conventions.*

- Tung’s 2-adic setting: 2 splits completely in F, v\_1 chosen so that U^pU\_p is sufficiently small; Pan’s residually irreducible §8: p > 2, F with p completely split.
- This is the quaternionic analogue of R31.5/ceggps-patched-module (definite quaternion algebra instead of definite unitary group); the general patching formalism is DeformationAndDerivedPatchingAlgebra R03.5.

*API.*

- `TauCeti.PatchedCompletedModule.quaternionicPatched` (constructor): M̃\_∞, a pseudo-compact O\_∞[[K\_p]]-module with compatible G\_p-action and an R̃\_∞-action.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_augmentation` (compatibility): M̃\_∞/aM̃\_∞ ≅ M\_ψ(U^p)\_m, G\_p- and Hecke-equivariantly.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_projective` (characterisation): M̃\_∞ is projective among pseudo-compact O\_∞[[K\_p]]-modules with the fixed central character.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_finiteLevel` (simp): O\_∞/J ⊗\_{O\_∞[[U\_p]]} M̃\_∞ recovers the patched finite-level module at level U\_p and open ideal J.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_typed` (constructor): M̃\_∞(σ°) = σ° ⊗\_{O[[K\_p]]} M̃\_∞ for a locally algebraic type σ.

*Unit tests.*

- `TauCeti.PatchedCompletedModule.quaternionicPatched_augmentation_test` (compatibility): Setting all patching variables to zero recovers M\_ψ(U^p)\_m.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_trivial_type` (computation): For σ trivial, M̃\_∞(σ°)/a is dual to S\_ψ(U^pK\_p, O)\_m, finite free over O.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_no_TW_degenerate` (degenerate): With no Taylor–Wiles primes (q = 0, minimal case with vanishing dual Selmer group), O\_∞ = O, a = 0 and M̃\_∞ = M\_ψ(U^p)\_m.
- `TauCeti.PatchedCompletedModule.quaternionicPatched_not_finite` (non-example): M̃\_∞ is not finitely generated over O\_∞: only its typed specialisations M̃\_∞(σ°) are finite over R̃\_∞(σ).

*Uses.*

- TUNG-2, §§5–8: The support of M̃\_∞(σ°) meets every component of R̃\_∞(σ), giving Breuil–Mézard at p = 2 and Theorem 8.0.1.
- PAN, §4.6–4.8 and §8.4: Full support of the patched completed homology at a nice prime, resp. in the residually irreducible case.
- GL2ModularityLifting:R32.3/typed-component-specialisation: Tung’s dyadic patched modules (input CC4).

*Proof sketch.*

1. Completed homology at auxiliary levels: M\_ψ(U^p\_{Q\_N}) is flat over O[Δ\_{Q\_N}] and its Δ\_{Q\_N}-coinvariants recover M\_ψ(U^p) (Pan Lemma 4.4.2, Corollary 4.4.3; Tung-2 §4.5).
2. Taylor–Wiles primes for the quaternionic problem (Tung-2 Lemma 4.4.1; Pan §4.3 at a one-dimensional prime) from GlobalGaloisDeformations R04.5.
3. Patch by ultraproducts or compatible subsequences (DeformationAndDerivedPatchingAlgebra:R03.5/patched-module, R03.5/patched-ring-action) to get M̃\_∞, R̃\_∞ and a with M̃\_∞/aM̃\_∞ ≅ M\_ψ(U^p)\_m (Tung-2 Propositions 4.6.5–4.6.6; Pan Definition 4.5.6, Proposition 4.5.8; Pan §8.3).
4. Projectivity: each finite-level module is projective over O/ϖ^n[Δ][K\_p/U\_p] by R31.1/definite-quaternionic-tower-structure(c), and projectivity passes to the patched limit (Tung-2 Corollary 4.2.2 and §4.6).

*Checks.*

- Specialising M̃\_∞ at the augmentation ideal and at a locally algebraic type σ gives the type-specialised module of R31.2/type-specialised-quaternionic-modules.
- Gee–Newton’s patched complex (CompletedCohomologyPartII:CC.4/patched-perfect-model-import) is the higher-degree analogue; in degree zero the complex is the module M̃\_∞.

*Needs:* §R31.1/definite-quaternionic-completed-module; §R31.1/definite-quaternionic-tower-structure; §R31.3/definite-quaternionic-hecke-algebra; §R31.3/hecke-galois-determinant-and-representation; GlobalGaloisDeformations:R04.5/taylor-wiles-datum; GlobalGaloisDeformations:R04.5/odd-taylor-wiles-primes; GlobalGaloisDeformations:R04.5/dyadic-taylor-wiles-primes; GlobalGaloisDeformations:R04.3/global-framed-ring; GlobalGaloisDeformations:R04.3/local-to-global-presentation; LocalGaloisDeformationRings:R08.1/local-lifting-ring; DeformationAndDerivedPatchingAlgebra:R03.5/patched-module; DeformationAndDerivedPatchingAlgebra:R03.5/patched-ring-action; CompletedCohomologyPartII:CC.4/patched-perfect-model-import.

*Sources.*

- TUNG-2, §4.2, Definition 4.2.1, Corollary 4.2.2, Lemma 4.2.4, Proposition 4.2.5, pp. 18–20; Lemma 4.4.1, p. 21; Propositions 4.6.5–4.6.6, pp. 25–26: Completed homology M\_ψ(U^p) of the definite quaternionic tower, its projectivity, the big Hecke algebra and ρ\_m, Taylor–Wiles data, and the patched module M̃\_∞ with M̃\_∞/a ≅ M\_ψ(U^p)\_m.
- PAN, §4.4, Lemma 4.4.2, Corollary 4.4.3; §4.5, Definition 4.5.6, Proposition 4.5.8, pp. 52–59; §8.2–8.3, pp. 126–129: Completed homology with auxiliary levels, patched completed homology at a one-dimensional prime, and patching of completed homology in the residually irreducible case.

### Full support at p = 2 (Tung)

*Theorem* `R31.5/full-support-dyadic`

In the setting of R31.5/quaternionic-patched-completed-homology with p = 2 splitting completely in F (F\_v ≅ Q\_2 for v | 2), ρ̄ modular with non-solvable image, totally odd fixed determinant ψε, odd deformation conditions at the real places, Steinberg conditions at Σ and the auxiliary place v\_1: (1) (Lemma 5.3.2) for a locally algebraic type σ the following are equivalent: (a) the support of M̃\_∞(σ°)[1/2] meets every irreducible component of Spec R^loc(σ)[1/2]; (b) M̃\_∞(σ°)[1/2] is a faithful R̃\_∞(σ)[1/2]-module, locally free of rank one over the regular locus of its support; (c) R^S\_ψ(σ) is a finite O-algebra and M(σ)[1/2] is a faithful R^S\_ψ(σ)[1/2]-module (M(σ) the type-specialised finite-level module of R31.2/type-specialised-quaternionic-modules); (d)–(e) the Hilbert–Samuel multiplicity, resp. cycle, of R̃\_∞^{inv}(σ)/ϖ equals Σ\_a m\_a μ′\_a(ρ̄), resp. Σ\_a m\_a Z′\_a(ρ̄), over Serre weights a with multiplicities m\_a in σ̄; (2) (Theorem 6.3.7) for y with r\_x absolutely irreducible, V̌(Π\_y) ≅ r\_x^{⊕n\_y}, so M̃\_∞(σ°)[1/2] is supported on every non-ordinary component of R̃\_∞(σ)[1/2]; (3) (Theorem 7.3.1) ordinary components are reached by an ordinary R = T theorem constructing automorphic ordinary lifts; (4) (Theorem 8.0.1) for every locally algebraic type σ, the support of M̃\_∞(σ°)[1/2] meets every irreducible component of R̃\_∞(σ)[1/2]; consequently the 2-adic Breuil–Mézard conjecture holds for every ρ̄: G\_{Q\_2} → GL\_2(k) (Corollary 8.0.2, the local consequence owned by PadicLocalLanglandsForGL2Qp R30.6), new when ρ̄ ≅ (χ ∗; 0 χ).

*Hypotheses and conventions.*

- p = 2 splits completely in F; ρ̄ automorphic with non-solvable image; the conditions at real places are the odd deformation conditions; the globalisation of a given local ρ̄ (Tung-2 Lemma 4.3.3) cites Calegari Proposition 3.2, Snowden Proposition 8.2.1 and the dyadic construction of Khare–Wintenberger II Theorem 6.1, and Lemma 4.3.4 cites Paškūnas Lemma 3.29 and KW II Lemma 3.5 — audited in R31.6/globalisation-dependence-audit (CC5).
- The equivalences in (1) are analogues of Paškūnas’s Proposition 3.17 and Emerton–Gee’s Lemma 5.5.1; (d)–(e) use the Hilbert–Samuel and cycle formalism of DeformationAndDerivedPatchingAlgebra R03.3/R03.6.

*Proof sketch.*

1. (1): standard comparison of support, faithfulness and multiplicities for Cohen–Macaulay patched modules of rank one (TUNG-2 Lemma 5.3.2, after Kisin Lemma 2.2.11, Gee–Kisin Lemma 4.3.9, Emerton–Gee Lemma 5.5.1, Paškūnas Proposition 3.17; DeformationAndDerivedPatchingAlgebra:R03.6/cycle-specialization-multiplicity).
2. (2): same argument as R31.5/full-support-odd-p(1) using the 2-adic Colmez functor and Paškūnas’s 2-adic blocks (TUNG-2 Theorem 6.3.7, Corollary 6.3.6), local inputs requested from PadicLocalLanglandsForGL2Qp R30.3, R30.5.
3. (3): ordinary Hida-theoretic R = T on the definite quaternion algebra (the quaternionic nearly ordinary Hecke algebra and its Galois representation, OrdinaryAutomorphicFormsAndModularityLifting R21.1, R21.3) gives automorphic ordinary lifts with prescribed local data (TUNG-2 Theorem 7.3.1, Propositions 7.1.6, 7.2.1, Corollaries 7.2.2–7.2.3).
4. (4): for each component C pick, place by place, a point of C reached by (2) or (3) (TUNG-2 Theorem 8.0.1); (1) and Theorem 5.3.3 give the cycle identity (Corollary 8.0.2).

*Checks.*

- For ρ̄|G\_{Q\_2} ≅ (χ ∗; 0 χ), Corollary 8.0.2 is new (not covered by Paškūnas 2016).
- Non-example: (2) alone gives only the non-ordinary components; ordinary components need (3).

*Needs:* §R31.5/quaternionic-patched-completed-homology; §R31.2/type-specialised-quaternionic-modules; §R31.5/type-specialised-patched-modules; PadicLocalLanglandsForGL2Qp:R30.3; PadicLocalLanglandsForGL2Qp:R30.5; DeformationAndDerivedPatchingAlgebra:R03.6/cycle-specialization-multiplicity; DeformationAndDerivedPatchingAlgebra:R03.3/free-of-maximal-depth-regular-local; DeformationAndDerivedPatchingAlgebra:R03.3/degree-indexed-multiplicity; LocalGaloisDeformationRings:R08.3/pst-deformation-ring; OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-nearly-ordinary-hecke-algebra; OrdinaryAutomorphicFormsAndModularityLifting:R21.3/integral-hecke-galois-representation.

*Sources.*

- TUNG-2, Lemma 5.3.2, Theorem 5.3.3, p. 28; Proposition 5.4.1, p. 29; Corollary 6.3.6, Theorem 6.3.7, p. 33; Theorem 7.3.1, p. 37; Theorem 8.0.1, Corollary 8.0.2, p. 38: Equivalent forms of full support, the non-ordinary components through 2-adic local Langlands, ordinary components through an ordinary R = T theorem, and full support on every component for p = 2, giving Breuil–Mézard for G\_{Q\_2}.

### Pan’s patching at a nice prime

*Theorem* `R31.5/pan-patching-at-a-nice-prime` — planet: Pan’s patching at a nice prime

In the setting of R31.3/eisenstein-localisation-and-pro-modular-primes (p odd, F of even degree with p split, residual pseudo-representation 1 + χ̄ with χ totally odd, the Eisenstein maximal ideal m of the variant Hecke algebra T\_m), call a prime q ⊂ T\_m nice if (i) p ∈ q and dim T\_m/q = 1; (ii) with A the normalisation of T\_m/q in k(q), there is a lattice ρ(q)°: G\_{F,S} → GL\_2(A) with ρ(q)° ⊗ k(q) ≅ ρ(q) irreducible; (iii) its reduction mod m\_A is a non-split extension (∗ ∗; 0 ∗) of the two residual characters; (iv) if ρ(q) is induced from a character of G\_L for a quadratic L/F then L ∩ F(ζ\_p) = F; (v) for every v ∈ S∖Σ\_p, ρ(q)°|G\_{F\_v} is the constant lift of its reduction. If p = 3 assume χ̄|G\_{F\_v} ≠ ω^{±1} for v | p. Then for a nice q with q^{ps} = q ∩ R^{ps,{ξ\_v}}, the surjection (R^{ps,{ξ\_v}})\_{q^{ps}} → T\_q has nilpotent kernel (Pan’s Theorem 4.1.7). Consequently (Corollary 4.1.8): if 𝔭 is a maximal ideal of R^{ps,{ξ\_v}}[1/p] with ρ(𝔭)|G\_{F\_v} irreducible and de Rham with distinct Hodge–Tate weights for every v | p, and some irreducible component of R^{ps,{ξ\_v}} contains both 𝔭 and a nice prime, then ρ(𝔭) arises from a regular algebraic cuspidal automorphic representation of GL\_2(A\_F).

*Hypotheses and conventions.*

- The nice-prime conditions are stated inline here; GL2ModularityLifting:R32.4/nice-prime restates the same definition for its consumers, and should import this statement.
- p = 3 needs χ̄|G\_{F\_v} ≠ ω^{±1}; the ordinary/residual analysis that produces nice primes on a component (Pan §§5–7) belongs to the consumer GL2ModularityLifting R32.4.

*Proof sketch.*

1. Local and global framed deformation rings at q (Pan §4.2: completions at the constant lift at v ∈ S∖Σ\_p are ordinary local deformation rings, by condition (v)), Taylor–Wiles primes at a one-dimensional prime (Pan §4.3, Proposition 4.3.2, Lemmas 4.3.4–4.3.11, using condition (iv) and the irreducible lattice ρ(q)°; GlobalGaloisDeformations R04.5 treats an absolutely irreducible residual representation and does not cover this case, so the construction is part of this node’s proof), completed homology with auxiliary levels (§4.4).
2. Patch the completed homology and the deformation rings at q (Pan §§4.5–4.6, R31.5/quaternionic-patched-completed-homology in Pan’s variant; patched pseudo-deformation and representation rings, Definition 4.6.3, Proposition 4.6.16).
3. Apply Paškūnas’s theory and the local–global compatibility of R31.4/pan-semisimple-local-global-compatibility to the patched block multiplicity module m\_∞ (Pan §4.7, Proposition 4.7.7): it is finitely generated over the localised patched ring and of the expected dimension, by the dimension bound Theorem 3.6.1.
4. Full support: dim(R^{(ξ\_v)})′(m\_∞) ≥ 4|P| − 1 + r + 2[F : Q] (Lemma 4.8.2) and equidimensionality of the local rings (Proposition 4.2.4) give full support (Lemma 4.8.5, Corollary 4.8.4), hence nilpotent kernel (Pan §4.8).
5. Corollary 4.1.8 combines the theorem (the component through q lies in the closed image of Spec T\_m, so 𝔭 is pro-modular) with classicality, R31.4/pan-semisimple-local-global-compatibility(5).

*Checks.*

- Corollary 4.1.8 is the input of GL2ModularityLifting:R32.4/nice-prime-component-bridge (input CC4).
- Non-example: for a one-dimensional prime with ρ(q)° residually split (condition (iii) fails), Pan’s local analysis at the constant lift does not apply.

*Needs:* §R31.3/eisenstein-localisation-and-pro-modular-primes; §R31.4/pan-semisimple-local-global-compatibility; §R31.4/block-multiplicity-module; §R31.5/quaternionic-patched-completed-homology; LocalGaloisDeformationRings:R08.6/ordinary-pcris-lifts-reducible; DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-and-component-support-conclusions; IntegralHeckeAndGaloisDeterminants:IHG.1/reducibility-ideal; mathlib:IsNilpotent; mathlib:RingHom.ker.

*Sources.*

- PAN, Definition 4.1.4, Remarks 4.1.5–4.1.6, Theorem 4.1.7, Corollary 4.1.8, p. 39: Nice primes of T\_m, nilpotence of the kernel of (R^{ps,{ξ\_v}})\_{q^{ps}} → T\_q at a nice prime, and automorphy of de Rham points on a component through a nice prime.
- PAN, §§4.2–4.8, Proposition 4.2.4, Definition 4.5.6, Proposition 4.6.16, Proposition 4.7.7, Lemmas 4.8.2–4.8.5, pp. 40–70: Patching at a one-dimensional prime: local and global deformation rings, Taylor–Wiles primes, patched completed homology, patched rings, the application of Paškūnas’s theory and the full-support argument.

### Pan’s patching in the residually irreducible case

*Theorem* `R31.5/pan-residually-irreducible-patching`

Let p > 2, F totally real with p split completely, and ρ: G\_F → GL\_2(O) continuous irreducible with (1) finitely many ramified places, (2) ρ̄|G\_{F(ζ\_p)} absolutely irreducible, (3) ρ|G\_{F\_v} absolutely irreducible and de Rham with distinct Hodge–Tate weights for every v | p, and if p = 3, ρ̄|G\_{F\_v} not of the form (η ∗; 0 ηω) or (ηω ∗; 0 η), (4) det ρ(c) = −1 for every complex conjugation c, (5) ρ̄ arises from a regular algebraic cuspidal automorphic representation π\_0 of GL\_2(A\_F). Then ρ arises from a regular algebraic cuspidal automorphic representation of GL\_2(A\_F) (Pan’s Theorem 8.0.1). The proof shows that the patched completed homology m\_∞ has full support on Spec R^v\_∞ (Proposition 8.4.9) and hence the kernel of R^{(ξ\_v)} → T\_m is nilpotent (Corollary 8.4.10). When F = Q, hypothesis (5) follows from Serre’s conjecture (Khare–Wintenberger), which gives Pan’s unconditional Theorem 1.0.4 (Remark 8.0.4); that route is a full-Serre consequence and is excluded from any independent proof of Serre’s conjecture.

*Hypotheses and conventions.*

- Hypothesis (5), residual modularity, is retained; replacing it by Serre’s conjecture for F = Q (Remark 8.0.4) uses the full Serre theorem.
- Tung’s thesis removes Pan’s extra p = 3 restriction (Pan Remark 8.0.2); that strengthening is not planned here.

*Proof sketch.*

1. Standard reductions by solvable base change: unipotent inertia away from p, N(v) ≡ 1 mod p at ramified v ∤ p with ρ̄ trivial there, [F : Q] even, π\_0 unramified outside p (Pan 8.0.5).
2. Galois deformation rings and completed homology with auxiliary levels (Pan §§8.1–8.2), patching (§8.3, R31.5/quaternionic-patched-completed-homology).
3. Apply Paškūnas’s theory and local–global compatibility (R31.4/pan-semisimple-local-global-compatibility) to the patched block module: full support (Proposition 8.4.9) and nilpotent kernel (Corollary 8.4.10) (Pan §8.4).
4. Conclude with classicality of points absolutely irreducible and de Rham at every v | p (R31.4/pan-semisimple-local-global-compatibility(5)) and Jacquet–Langlands.

*Checks.*

- Applied with F = Q and ρ̄ residually modular by hypothesis, the theorem is the residually irreducible Fontaine–Mazur theorem in the form GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur consumes (input CC4).
- Non-example: dropping (5) and invoking Theorem 1.0.4 instead is not admissible in an independent proof of Serre’s conjecture.

*Needs:* §R31.5/quaternionic-patched-completed-homology; §R31.4/pan-semisimple-local-global-compatibility; §R31.4/block-multiplicity-module; GlobalGaloisDeformations:R04.3/global-framed-ring; GlobalGaloisDeformations:R04.3/local-to-global-presentation; GlobalGaloisDeformations:R04.4/restriction-ring-map; GlobalGaloisDeformations:R04.4/enlarging-ramification; GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl; DeformationAndDerivedPatchingAlgebra:R03.6/nearly-faithful-iff-support-eq-univ.

*Sources.*

- PAN, Theorem 8.0.1, p. 124; Remarks 8.0.2–8.0.4 and 8.0.5, p. 125; Proposition 8.4.9, Corollary 8.4.10, p. 132: Fontaine–Mazur in the residually irreducible case under residual modularity, via full support of patched completed homology; Remark 8.0.4 records that for F = Q residual modularity follows from Khare–Wintenberger.
- PAN, Theorem 1.0.4, p. 5: The unconditional consequence for F = Q obtained through Serre’s conjecture.

## R31.6. Exports and source independence

<a id="r31-6"></a>

This layer states the global consequences and the contracts. Promodularity (Theorem 1.2.3) and its Fontaine–Mazur and Kisin consequences are recorded with their dependence on Serre's conjecture made explicit; Böckle's R = T identifies the completed Hecke algebra with the deformation ring under his hypotheses; the potentially crystalline non-crystabelline case of Emerton's Theorem 3.3.22 is proved by realising the local representation in completed cohomology; Dospinescu–Le Bras globalise a supercuspidal representation on a definite quaternion algebra through a CM form. The audit lists, result by result, which globalisations are used and which invoke the full Serre conjecture, and the export table names, for each branch of the GL₂ lifting theorems and for the other consumers, the node that states what it needs.

### Promodularity and the Fontaine–Mazur and Kisin consequences

*Theorem* `R31.6/promodularity-and-the-consequences-for-classical-and-overconvergent-forms` — planet: Promodularity and Fontaine–Mazur

(Corollary 1.2.2) Let V be promodular, continuous, irreducible, two-dimensional over E, unramified outside finitely many primes, with V̄ absolutely irreducible and V̄|G\_{Q\_p} ≇ χ ⊗ (1 ∗; 0 ε̄). (1) If V|G\_{Q\_p} is trianguline, V is a twist of the Galois representation of an overconvergent p-adic cuspidal eigenform of finite slope. (2) If V|G\_{Q\_p} is de Rham with distinct Hodge–Tate weights and is not the direct sum of two characters with isomorphic reductions, V is a twist of the Galois representation of a classical cuspidal eigenform of weight k ≥ 2. (Theorem 1.2.3, Böckle, Diamond–Flach–Guo, Khare–Wintenberger, Kisin) If V is continuous, irreducible, odd, two-dimensional over E, unramified outside a finite Σ, and (a) p > 2, (b) V̄|G\_{Q(ζ\_p)} is absolutely irreducible, (c) V̄|G\_{Q\_p} ≇ χ ⊗ (1 ∗; 0 1) and ≇ χ ⊗ (1 ∗; 0 ε̄) for every k-valued χ, then V is promodular of tame level divisible only by the primes in Σ∖{p}. (Theorem 1.2.4) Under (a)–(c), the conclusions of Corollary 1.2.2 hold without assuming promodularity: Kisin’s conjecture in the trianguline case and the Fontaine–Mazur conjecture in the de Rham case.

*Hypotheses and conventions.*

- Corollary 1.2.2 uses the promodularity hypothesis; Theorem 1.2.3 supplies it, but its proof uses Serre’s conjecture (Khare–Wintenberger, Kisin) to know that V̄ is modular (EM11 §7.3), so Theorem 1.2.4 inherits that dependence (R31.6/globalisation-dependence-audit).
- Corollary 1.2.2(2) has an extra hypothesis absent from Theorem 1.2.4; under (c) a sum of two characters with isomorphic reductions has V̄|G\_{Q\_p} a twist of 1 ⊕ 1, which (c) excludes (a deduction, not stated in the source).
- Kisin’s parallel result replaces (c) by V̄|G\_{Q\_p} ≇ χ ⊗ (ε̄ ∗; 0 1) (Emerton Remark 1.2.5); the two are different statements.
- Conclusions are up to twist; (1) relies on the proof of EM-PAMQ Theorem 7.5.8, which is only sketched there, and Emerton replaces it by an equidimensionality argument (EM11 §7.2).

*Proof sketch.*

1. Corollary 1.2.2(2) (EM11 Theorem 7.1.1): Theorem 1.2.1(1) embeds B(V|G\_{Q\_p}) into Hom(V, Ĥ^1\_E); by Colmez (EM11 Theorem 3.3.21, requested from PadicLocalLanglandsForGL2Qp R30.4) B(V|G\_{Q\_p})\_{l.alg} ≠ 0, so Hom(V, (Ĥ^1\_E)\_{l.alg}) ≠ 0 and R31.2/locally-algebraic-vectors-of-completed-cohomology gives a classical form.
2. Corollary 1.2.2(1) (EM11 Theorem 7.2.1): pass to locally analytic Jacquet modules J\_B; for trianguline V each Jordan–Hölder factor of B(V)^{an} has nonzero Jacquet module, so the eigensystem of V appears in Spec A(K^p)\_ρ̄, which is equidimensional of dimension two by R31.1/non-eisenstein-boundary-and-injectivity(d) and Emerton’s Jacquet-module dimension result; hence V is a twist of a finite-slope overconvergent eigenform (the Jacquet functor is requested from PadicLocalLanglandsForGL2Qp R30.2).
3. Theorem 1.2.3 (EM11 §7.3): Serre’s conjecture gives V̄ modular; Böckle’s Corollary 3.8 handles V̄|G\_{Q\_p} absolutely reducible and the finite flat case; Diamond–Flach–Guo’s extensions of Wiles–Taylor–Wiles–Diamond and Ramakrishna to arbitrary absolutely irreducible V̄|G\_{Q\_p} give the rest; the p-adic Langlands correspondence plays no role.
4. Theorem 1.2.4 combines Theorem 1.2.3 with Corollary 1.2.2.

*Checks.*

- For V = V\_f ⊗ ψ with f classical and ψ a finite-order character, all hypotheses can be checked and the conclusion recovers f up to twist.
- Non-example: for p = 2 Theorem 1.2.3 is not available, so Theorem 1.2.4 gives nothing at p = 2.

*Needs:* §R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses; §R31.2/locally-algebraic-vectors-of-completed-cohomology; §R31.1/non-eisenstein-boundary-and-injectivity; §R31.6/boeckle-r-equals-t; PadicLocalLanglandsForGL2Qp:R30.2; PadicLocalLanglandsForGL2Qp:R30.4.

*Sources.*

- EM11, Corollary 1.2.2, Theorems 1.2.3–1.2.4, Remark 1.2.5, pp. 4–5: The Fontaine–Mazur and Kisin consequences for promodular V, the promodularity theorem with hypotheses (a)–(c), and their combination.
- EM11, Theorems 7.1.1 and 7.2.1 with proofs, pp. 94–95; §7.3, pp. 95–96: Proofs of the two parts of Corollary 1.2.2 from Theorem 1.2.1, Colmez’s non-vanishing of locally algebraic vectors and Jacquet modules; the proof of Theorem 1.2.3 from Serre’s conjecture, Böckle and Diamond–Flach–Guo.

### Böckle’s R = T for the completed Hecke algebra

*Theorem* `R31.6/boeckle-r-equals-t`

Let ρ̄: G\_Q → GL\_2(k) be absolutely irreducible, odd and modular, unramified outside Σ = Σ\_0 ∪ {p}. Assume (1) p ≥ 3, (2) ρ̄|G\_{Q(ζ\_p)} absolutely irreducible, (3) ρ̄|G\_{Q\_p} is neither χ ⊗ (1 ∗; 0 1) nor χ ⊗ (1 ∗; 0 ε̄) for any k-valued χ. Then the surjection φ\_Σ: R\_{ρ̄,Σ} → T\_{ρ̄,Σ} of R31.3/deformation-to-hecke-surjection is an isomorphism. In particular every deformation of ρ̄ unramified outside Σ is promodular, and T\_{ρ̄,Σ} is a complete intersection of relative dimension three over O when R\_{ρ̄,Σ} is unobstructed.

*Hypotheses and conventions.*

- ρ̄ modular is a hypothesis; replacing it by ρ̄ odd uses Serre’s conjecture (Khare–Wintenberger, Kisin).
- The relative-dimension remark holds only in the unobstructed case (H^2(G\_{Q,Σ}, ad ρ̄) = 0); it is not used elsewhere.

*Proof sketch.*

1. Böckle’s Corollary 3.8 (with Diamond–Flach–Guo in the case ρ̄|G\_{Q\_p} absolutely irreducible): R\_{ρ̄,Σ} is shown to be generated by its classical points of weight two and finite flat type, which are modular by Wiles–Taylor–Wiles–Diamond, using that the finite-flat (weight-two crystalline) local ring with fixed determinant is formally smooth of relative dimension one for irreducible ρ̄|G\_{Q\_p} (Ramakrishna; LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible) and a dimension count; the details are EM11 §7.3 and NAK Theorem 2.1.
2. Since φ\_Σ is surjective (R31.3/deformation-to-hecke-surjection) and both rings have the same reduced quotient with dense classical points (R31.3/classical-points-and-zariski-density), the identification of the classical points on both sides gives injectivity once R\_{ρ̄,Σ} is reduced, which is part of Böckle’s result.

*Checks.*

- Nakamura uses this to transfer his zeta morphisms from T\_{ρ̄,Σ} to R\_{ρ̄,Σ} (his Theorem 1.1).
- Non-example: for ρ̄|G\_{Q\_p} ≅ χ ⊗ (1 ∗; 0 ε̄) the theorem is not asserted; this is the case excluded by Emerton’s Remark 1.1.2 and Assumption 3.3.1.

*Needs:* §R31.3/deformation-to-hecke-surjection; §R31.3/classical-points-and-zariski-density; GlobalGaloisDeformations:R04.2/universal-deformation-ring; GlobalGaloisDeformations:R04.3/global-framed-ring; GlobalGaloisDeformations:R04.3/local-to-global-presentation; LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible.

*Sources.*

- NAK, Theorem 2.1 and its proof, p. 17: Under p ≥ 3, ρ̄|G\_{Q(ζ\_p)} absolutely irreducible and the two local exclusions, φ\_Σ: R\_{ρ̄,Σ} → T\_{ρ̄,Σ} is an isomorphism (Böckle Corollary 3.8 and the proof of Emerton’s Theorem 1.2.3).
- EM11, §7.3, pp. 95–96: The proof of Theorem 1.2.3 through Böckle’s deformation-theoretic method and Diamond–Flach–Guo.

### Locally algebraic vectors of B(V) by a global argument

*Theorem* `R31.6/global-proof-of-locally-algebraic-vectors`

Let V\_E be a continuous two-dimensional representation of G\_{Q\_p} over E, de Rham with distinct Hodge–Tate weights a > b. Then B(V\_E)\_{l.alg} ≅ Sym^{a−b−1}E^2 ⊗ det^{b+1} ⊗ π\_p(V\_E), G-equivariantly, where π\_p(V\_E) is the smooth representation attached by classical local Langlands to the Weil–Deligne representation of V\_E (Emerton’s Theorem 3.3.22). For V\_E crystabelline or a twist of semistable this is Colmez’s Theorem VI.6.50; for V\_E potentially crystalline but not crystabelline Emerton’s proof is global: realise V\_E (up to unramified twist and extension of scalars) as the local component at p of a classical eigenform whose automorphic representation has a type σ of V\_E at p, and compare the locally algebraic vectors of Ĥ^1(K\_1^p(N))\_{E,ρ̄,Σ}[𝔭] computed by EM-PAMQ Theorem 7.4.2 with those of ρ(𝔭) ⊗ B(ρ(𝔭)|G\_{Q\_p}) given by Theorem 1.2.1. Only a nonzero G\_Q × G-map ρ(𝔭) ⊗ B(ρ(𝔭)|G\_{Q\_p}) → Ĥ^1[𝔭] is needed (Emerton’s Remark 7.4.2).

*Hypotheses and conventions.*

- The global proof is placed here, downstream of R31.4, and is exported to consumers of Kisin’s Hypothesis (1.2.6) (input LL3 of GL2ModularityLifting); the local owner PadicLocalLanglandsForGL2Qp R30.4 states Colmez’s cases and must not import this node, or the stages R30 and R31 would form a cycle.
- Colmez’s non-vanishing B(V\_E)\_{l.alg} ≠ 0 (Theorem VI.6.18) and the irreducibility of B for irreducible V\_E (Emerton Proposition 3.3.24) are local inputs (R30.4).
- The global realisation uses an auxiliary modular ρ̄ with ρ̄|G\_{Q\_p} irreducible (the reduction of the induction of a Grössencharacter of an imaginary quadratic field in which p is inert) having a chosen Serre weight W, and the weight part of Serre’s conjecture for that ρ̄ (Emerton Remark 5.7.4 notes this is its only use in the paper); it does not invoke Khare–Wintenberger for the representation under study.

*Proof sketch.*

1. By Colmez (Theorem VI.6.42) B(V\_E)\_{l.alg} depends only on π\_p(V\_E) and the weights, so it suffices to treat one V′\_E with the same π\_p and weights; π\_p(V\_E) is cuspidal since V\_E is potentially crystalline and not crystabelline (EM11 §7.4, p. 97).
2. Let σ be the minimal type of π\_p(V\_E), τ\_0 = Sym^{a−b−1}O^2 ⊗ det^b ⊗ σ\_0 and W a constituent of τ\_0/ϖ; choose a modular ρ̄ with ρ̄|G\_{Q\_p} irreducible and W ∈ W(ρ̄) (a CM-induced ρ̄); choosing ρ̄|G\_{Q\_p} ≅ Ind ω\_2^{r+1} up to twist when W = Sym^r ⊗ det^b makes W the weight of Serre’s k(ρ̄) = r + 2, so Edixhoven’s weight theorem (SerreWeightAndLevelOptimisation:R20.3/edixhoven-weight-theorem, which concerns the minimal weight) suffices to embed W into H^1(K\_{Σ\_0})\_{k,ρ̄,Σ}[m] at an allowable neat level K\_{Σ\_0} (Emerton invokes the full weight part, Remark 5.7.4, which this choice avoids); lift to τ\_0 → Ĥ^1(K\_{Σ\_0})\_{O,ρ̄,Σ} by injectivity (R31.1/non-eisenstein-boundary-and-injectivity(c)) and pick 𝔭 with Hom\_{GL\_2(Z\_p)}(τ, Ĥ^1(K\_{Σ\_0})\_{E,ρ̄,Σ})[𝔭] ≠ 0 (EM11 (7.4.1)).
3. 𝔭 is classical (the vectors are locally algebraic of weight Sym^{a−b−1} ⊗ det^b) and its automorphic representation has π\_p ≅ π\_p(V\_E) up to unramified twist by the theory of types (CEGGPS §3, SmoothRepresentationsOfLocalGroups SR.5).
4. By R31.2/classical-eigensystems-in-completed-cohomology, Ĥ^1(K\_1^p(N))\_{E,ρ̄,Σ}[𝔭]\_{l.alg} ≅ ρ(𝔭) ⊗ Sym^{a−b−1} ⊗ det^b ⊗ π\_p(V\_E); by R31.4/multiplicity-module (Remark 6.4.3) there is a nonzero, hence injective (irreducibility of B), map ρ(𝔭) ⊗ B(ρ(𝔭)|G\_{Q\_p}) → Ĥ^1[𝔭]; taking locally algebraic vectors gives an embedding of a nonzero space into an irreducible one, hence an isomorphism (EM11 §7.4, Remark 7.4.2).

*Checks.*

- For V\_E = V\_f|G\_{Q\_p} with f of weight k and level prime to p, B(V\_E)\_{l.alg} ≅ Sym^{k−2} ⊗ π\_p(f) up to the determinant twist, the Breuil–Schneider representation.
- Non-example: for V\_E de Rham with equal Hodge–Tate weights, B(V\_E)\_{l.alg} = 0 (Colmez’s converse); the theorem needs distinct weights.

*Needs:* §R31.4/multiplicity-module; §R31.2/classical-eigensystems-in-completed-cohomology; §R31.2/locally-algebraic-vectors-of-completed-cohomology; §R31.3/classical-points-and-zariski-density; §R31.1/non-eisenstein-boundary-and-injectivity; SerreWeightAndLevelOptimisation:R20.3/edixhoven-weight-theorem; PadicLocalLanglandsForGL2Qp:R30.4; SmoothRepresentationsOfLocalGroups:SR.5.

*Sources.*

- EM11, Theorems 3.3.21–3.3.22 and Remark 3.3.23, pp. 27–28; §7.4 with (7.4.1) and Remark 7.4.2, pp. 96–98: B(V\_E)\_{l.alg} ≅ Sym^{a−b−1} ⊗ det^{b+1} ⊗ π\_p(V\_E) for de Rham V\_E with distinct weights; Colmez proves the crystabelline and semistable cases and Emerton the remaining potentially crystalline case by the global comparison.

### Globalising a supercuspidal π on a definite quaternion algebra

*Theorem* `R31.6/quaternionic-globalisation-of-supercuspidal-types`

Let π be an irreducible supercuspidal smooth representation of GL\_2(Q\_p) over L (with trivial central character on a fixed uniformiser up to twist), B̄ the definite quaternion algebra over Q of discriminant ℓ (ℓ ≠ p, ramified at ℓ and ∞), and Σ, K^p as in R31.1/definite-quaternionic-completed-module. Then there is a quaternionic modular form f of weight 2 for B̄^\* such that, with π(f) its automorphic representation, π(f)\_p ≅ π ⊗ (ξ∘det) for an unramified character ξ, and r̄\_f: G\_Q → GL\_2(F̄\_p) is absolutely irreducible on G\_{Q\_p} (Dospinescu–Le Bras Theorem 5.5). The proof uses: (Lemma 5.6) for a minimal GL\_2(Z\_p)-type σ of π, a GL\_2(Z\_p)-stable lattice σ\_0 and a Serre weight W in the socle of σ̄\_0, there is a quaternionic form g whose residual r̄\_p is absolutely irreducible with W in the GL\_2(Z\_p)-socle of the mod p local Langlands π̄ of r̄\_p, obtained as the Jacquet–Langlands transfer of the weight-two CM form attached to a Hecke character of an imaginary quadratic F in which p and ℓ are inert; and (Hecke) the automorphic induction of a Hecke character χ of F with χ\_∞(z) = z^{-1}, not factoring through the norm, is a weight-two cusp form whose component at an inert prime is the local automorphic induction and whose p-adic Galois representation is the induction of the Galois character of χ.

*Hypotheses and conventions.*

- The CM form is constructed from a Hecke character with prescribed reduction at p and supercuspidal local induction at ℓ; this globalisation uses class field theory and automorphic induction only, not Serre’s conjecture.
- DLB’s proof of Lemma 5.6 prints η̄\_p where the condition is on the Galois character attached to χ (sourceIssues); the node uses the corrected condition.

*Proof sketch.*

1. Reduce to W = Sym^r F\_p^2 (0 ≤ r ≤ p − 1); by the explicit mod p local Langlands correspondence it suffices that r̄\_p ≅ Ind\_{Q\_{p^2}}^{Q\_p} ω\_2^{r+1} up to unramified twist (requested from PadicLocalLanglandsForGL2Qp R30.3).
2. Choose F imaginary quadratic with p and ℓ inert and a Hecke character χ with χ\_∞(z) = z^{-1}, Galois character reducing to ω\_2^{r+1} at p up to unramified twist, and χ\_ℓ with supercuspidal local induction; its automorphic induction is a weight-two cusp form (GL2AutomorphicRepresentationsAndTransfer:R17.5/prescribed-local-induction, applied over Q with the prescribed place p, L\_p = Q\_{p^2}, and with v = ℓ where L/Q is not split and ξ\_ℓ does not factor through the norm, so the component at ℓ is supercuspidal), discrete series at ℓ, which transfers to B̄^\* by global Jacquet–Langlands (R17.3/global-jl) (DLB Lemme 5.6).
3. From g, use R31.4/definite-quaternionic-local-global-compatibility (or its weak form Proposition 13.5), exactness of Hom\_{GL\_2(Z\_p)}(−, C^0(X(K^p), O/ϖ^n)\_m) (R31.1/definite-quaternionic-tower-structure(b)) and Henniart’s unicity of types to produce f with π(f)\_p ≅ π ⊗ ξ∘det (DLB Théorème 5.5 and its proof, after Emerton and Breuil–Emerton Theorem 5.1).
4. GL2AutomorphicRepresentationsAndTransfer:R17.3/supercuspidal-globalization states an analogous globalisation in CDN’s setting (B̌ ramified at 𝔭, existence left as a gap there); it is not used: for B̄ over Q with weight two the construction above is self-contained.

*Checks.*

- For π the supercuspidal of conductor p^2 attached to a regular character of Q\_{p^2}^×, the CM form of Lemma 5.6 can be taken with χ of conductor p at the inert prime p.
- Non-example: for π a principal series the theorem is not needed; a global form with given principal series at p exists by Hida/eigencurve arguments and has reducible r̄\_p in general.

*Needs:* §R31.4/definite-quaternionic-local-global-compatibility; §R31.1/definite-quaternionic-tower-structure; §R31.2/definite-quaternionic-classical-forms; GL2AutomorphicRepresentationsAndTransfer:R17.5/prescribed-local-induction; GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl; PadicLocalLanglandsForGL2Qp:R30.3.

*Sources.*

- DLB, Théorème 5.5 and its proof with Lemme 5.6, pp. 26–27: A weight-two quaternionic form with p-component π up to unramified twist and residual representation absolutely irreducible at p, built from a CM form with a prescribed Serre weight and Emerton’s local–global compatibility for B̄.

### Audit of globalisation inputs and dependence on Serre’s conjecture

*Application* `R31.6/globalisation-dependence-audit`

Record, for each result of this roadmap consumed by the lifting theorems, which globalisations it uses and whether any invokes the full Serre conjecture (Khare–Wintenberger, Kisin): (i) Theorem 1.2.1 and Corollary 1.2.2 (R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses, R31.6/promodularity-…) assume V promodular and ρ̄ modular; they invoke no globalisation beyond that hypothesis, and Theorem 6.2.4 is proved by Mazur’s principle, not by Theorem 1.2.3; (ii) Emerton’s Remark 5.2.3 (allowable levels at the Artin conductor) cites the proof of Serre’s conjecture but, for p > 2, only needs the earlier weak-to-strong Serre theorem; (iii) Theorem 1.2.3 (promodularity) and hence Theorem 1.2.4 use Serre’s conjecture explicitly (EM11 §7.3) — excluded from any independent proof of Serre; (iv) Theorem 1.2.6’s hypothesis ‘modular (equivalently odd)’ — the equivalence is Serre’s conjecture; with ‘modular’ as hypothesis it is independent; (v) Emerton’s §7.4 (R31.6/global-proof-of-locally-algebraic-vectors) uses an auxiliary CM-induced modular ρ̄ and the weight part of Serre’s conjecture for it (EM11 p. 97, Remark 5.7.4), not Khare–Wintenberger for the representation studied; (vi) Dospinescu–Le Bras Theorem 5.5 uses CM forms and Jacquet–Langlands only; (vii) CEGGPS’s patched module uses Emerton–Gee Corollary A.7 (suitable globalisation via potential automorphy, BLGGT) and Proposition A.2, independent of Serre; (viii) Tung (odd p): Lemma 4.3.3 globalises r̄ through Calegari Proposition 3.2 (Moret-Bailly), Snowden Proposition 8.2.1 and, at p = 2, Khare–Wintenberger II Theorem 6.1’s construction (dyadic Hilbert–Blumenthal abelian varieties); Lemma 4.3.4 cites Paškūnas Lemma 3.29 (which keeps a given-automorphic hypothesis) and KW II Lemma 3.5; (ix) Barnet-Lamb–Gee–Geraghty Theorem A.4.1 (reducible locus) assumes a potentially automorphic residual seed in addition to adequacy and potentially diagonalisable regular local lifts; (x) Emerton–Paškūnas Theorem 6.3 gives support on a union of components, not full support, so Tung’s Proposition 3.9 keeps its irreducibility, reducedness and density inputs; (xi) Pan’s Theorem 8.0.1 keeps residual modularity as hypothesis (5), while his Theorem 1.0.4 (via Remark 8.0.4) and Emerton’s §7.3 are full-Serre consequences and are excluded; (xii) Pan’s residually reducible Theorem 4.1.7 needs no residual modularity. The audit records what the sources state and what their immediate cited proofs use; it certifies leaves only where those proofs were read, and lists the uninspected leaves as gaps.

*Hypotheses and conventions.*

- The audit is a record of dependencies, not a claim that they are unavoidable; promodularity and residual modularity are hypotheses that can be verified independently.
- Leaves read for this audit: EM11 §§6.2, 7.3, 7.4 (pp. 71–98); DLB §5.1 (pp. 25–27); CEGGPS §2.1 (pp. 15–17); TUNG-P3 §§3–4; TUNG-2 §§4.3, 8 (pp. 21, 38); EP §6 (p. 26); PAN Theorem 8.0.1 and Remark 8.0.4 (pp. 124–125). Calegari Proposition 3.2, Snowden Proposition 8.2.1, KW II Theorem 6.1 and Lemma 3.5, Paškūnas Lemma 3.29, EG14 Proposition A.2/Corollary A.7 and BLGG13 Theorem A.4.1 were not re-read in this job; GL2ModularityLifting:R32.6 records the reading of several of them (its request text).

*Proof sketch.*

1. Read each consumed theorem’s proof for its global inputs (leaves listed in the hypotheses) and classify each input as hypothesis, independent globalisation, or full-Serre consequence.
2. Emerton: §7.3 opens by invoking Serre’s conjecture for V̄; §6.2’s proofs use only the modular-ρ̄ hypothesis and Mazur’s principle; §7.4 uses completed cohomology at an allowable level.
3. Tung/CEGGPS/BLGG/EP/Pan: as listed in the statement, with the Serre-free status certified only for the leaves read; the rest are recorded in the gap ‘Uninspected globalisation leaves’.
4. Supply this record to GL2ModularityLifting:R32.6/globalisation-dependency-audit (the existing owner of the lifting-side audit), not a second audit there.

*Checks.*

- Applied to an argument claiming to reprove Serre’s conjecture: it may use R31.4’s Theorem 1.2.1 and R31.6’s Corollary 1.2.2 with independently established promodularity, Pan’s Theorem 4.1.7, Tung’s full support (subject to the uninspected leaves), but not Theorem 1.2.3, Theorem 1.2.4, the ‘odd’ form of Theorem 1.2.6, Pan’s Theorem 1.0.4, or Emerton’s §7.3.
- The audit is consumed by GL2ModularityLifting:R32.6/globalisation-dependency-audit (inputs CC5).

*Needs:* §R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses; §R31.4/fibres-of-the-away-from-p-family; §R31.4/mod-p-multiplicity-and-serre-s-adelic-reformulation; §R31.6/promodularity-and-the-consequences-for-classical-and-overconvergent-forms; §R31.6/global-proof-of-locally-algebraic-vectors; §R31.6/quaternionic-globalisation-of-supercuspidal-types; §R31.5/ceggps-patched-module; §R31.5/full-support-odd-p; §R31.5/full-support-dyadic; §R31.5/patched-support-is-a-union-of-components; §R31.5/pan-patching-at-a-nice-prime; §R31.5/pan-residually-irreducible-patching.

*Sources.*

- EM11, Theorems 1.2.1, 1.2.3, 1.2.6 and Remark 5.2.3, pp. 3–5, 47; §7.3, pp. 95–96; §7.4, pp. 96–98: Which results assume promodularity or modularity of ρ̄, and where Serre’s conjecture is invoked (§7.3 for promodularity; the ‘equivalently odd’ form of Theorem 1.2.6).
- TUNG-2, Lemmas 4.3.3–4.3.4, p. 21: The suitable globalisation of a local residual representation through Calegari, Snowden and KW II at p = 2, and the automorphy of the globalisation through Paškūnas Lemma 3.29 and KW II Lemma 3.5.
- CEGGPS, §2.1 and Lemma 2.2, pp. 15–17: The globalisation of r̄ via Emerton–Gee Corollary A.7, with automorphic, adequate, unramified-away-from-p properties.
- EP, Theorem 6.3 and Remark 6.4, p. 26: Support on a union of irreducible components, with full support only when the framed ring is irreducible.
- PAN, Theorem 8.0.1 and Remarks 8.0.2–8.0.4, pp. 124–125: Residual modularity as hypothesis (5), and its replacement by Khare–Wintenberger for F = Q.
- DLB, Proof of Théorème 5.5 and Lemme 5.6, pp. 26–27: The globalisation through a CM form and Jacquet–Langlands.

### Exports to the GL₂ lifting theorems and other consumers

*Application* `R31.6/export-table-for-gl2-lifting`

The exact statements this roadmap exports, by consumer branch: (CC1) type-specialised quaternionic modules and their faithful algebraic module (R31.2/type-specialised-quaternionic-modules), with Pan’s classicality (R31.4/pan-semisimple-local-global-compatibility(5)); (CC2) Pan’s completed Hecke quotient, determinant-fixed pseudo-character with p-power tame characters, pro-modular primes as kernel containment closed under specialisation (R31.3/eisenstein-localisation-and-pro-modular-primes), Tung’s Hecke-valued representation with determinant ψε (R31.3/hecke-galois-determinant-and-representation(c)); (CC3) Pan’s Theorem 3.5.5, Corollaries 3.5.10 and 3.5.12 (R31.4/pan-semisimple-local-global-compatibility); (CC4) the CEGGPS patched module with projectivity (R31.5/ceggps-patched-module), Emerton–Paškūnas support and faithfulness (R31.5/patched-support-is-a-union-of-components), Tung’s full support at odd p (R31.5/full-support-odd-p) and at p = 2 with Lemma 5.3.2’s equivalences and Theorem 8.0.1 (R31.5/full-support-dyadic), Pan’s Theorem 4.1.7 with §§4.2–4.8 (R31.5/pan-patching-at-a-nice-prime) and §8 with its residual-modularity hypothesis (R31.5/pan-residually-irreducible-patching); (CC5) the globalisation audit (R31.6/globalisation-dependence-audit). Branches of GL2ModularityLifting R32: odd-prime residually modular de Rham lifting (Kisin/Emerton, then Paškūnas p ≥ 5 with End ρ̄\_p = k, Hu–Tan for split non-scalar ρ̄\_p, Tung for all odd p including p = 3) uses CC4–CC5 with the local Breuil–Mézard input LL1 from PadicLocalLanglandsForGL2Qp R30.6; the dyadic branch (Kisin’s 2-adic BT, Paškūnas 2016, Tung p = 2) uses CC1, CC4, CC5; Pan’s p ≥ 5 residually reducible branch uses CC2–CC4; Pan’s residually irreducible branch uses CC3–CC5. Other consumers: KatoEulerSystems L2 (R31.2/completed-homology-with-coefficients, Lemma 2.10 form); LocallyAnalyticCompletedCohomology LA.2/LA.5/LA.12 (R31.1/the-object-the-conjecture-is-about with R31.1/degree-zero-two-and-compact-support; R31.3/completed-hecke-algebra-of-the-modular-tower, R31.3/hecke-galois-determinant-and-representation, R31.3/galois-factorisation-of-completed-cohomology; R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses and R31.3/classical-points-and-zariski-density for the dense classical vectors with semisimple Hecke action; R31.6/promodularity-… for Emerton’s Theorem 1.2.3); AutomorphicCongruences L3 and TorsionCohomologyInfrastructure TC.2 (through CompletedCohomologyPartII CC.8, not through this roadmap).

*Hypotheses and conventions.*

- Every export keeps the hypotheses of its source theorem; no unqualified ‘p-adic local–global compatibility theorem’ is exported.
- The local statements (Paškūnas, Hu–Tan, Tung’s Breuil–Mézard, Kisin’s (1.2.6)) are PadicLocalLanglandsForGL2Qp R30.6’s exports (inputs LL1–LL3), except the global proof of Emerton’s Theorem 3.3.22 (R31.6/global-proof-of-locally-algebraic-vectors).

*Proof sketch.*

1. Match each consumer request (GL2ModularityLifting R22.1, R32.3, R32.6; KatoEulerSystems; LocallyAnalyticCompletedCohomology) against the nodes of this packet and record the node that answers it, with any part left open as a gap (handoff ledger).
2. Check that no exported statement drops a hypothesis of its source (p = 3 exclusions, residual modularity, local irreducibility, End ρ̄\_p = k).

*Checks.*

- GL2ModularityLifting’s package lists inputs CC1–CC5 as conditional; this table names, for each, the node that now states it.
- KatoEulerSystems’ request is answered by R31.2/completed-homology-with-coefficients(b) without any integral isomorphism, as the request stipulates.

*Needs:* §R31.2/type-specialised-quaternionic-modules; §R31.3/eisenstein-localisation-and-pro-modular-primes; §R31.4/pan-semisimple-local-global-compatibility; §R31.5/ceggps-patched-module; §R31.5/patched-support-is-a-union-of-components; §R31.5/full-support-odd-p; §R31.5/full-support-dyadic; §R31.5/pan-patching-at-a-nice-prime; §R31.5/pan-residually-irreducible-patching; §R31.6/globalisation-dependence-audit; §R31.2/completed-homology-with-coefficients; §R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses; §R31.6/global-proof-of-locally-algebraic-vectors; PadicLocalLanglandsForGL2Qp:R30.6.

*Sources.*

- EM11, §1.2, pp. 3–6: The hypothesis tables of Emerton’s main results, which the export table preserves.
- TUNG-P3, Theorem 1.2 and Theorem 4.7, pp. 4, 16: The odd-prime Breuil–Mézard and automorphy statements and their hypotheses.
- TUNG-2, Theorem 8.0.1, Corollary 8.0.2, Theorem 8.0.3, p. 38: The dyadic statements and their hypotheses.
- PAN, Theorems 1.0.2, 4.1.7, 8.0.1, pp. 3, 39, 124: Pan’s residually reducible and irreducible statements and their hypotheses.

## Requests to other roadmaps

- **PadicLocalLanglandsForGL2Qp:R30.2.** For G = GL\_2(Q\_p): (i) the categories of admissible G-representations on orthonormalizable modules over a complete local noetherian O-algebra A (Emerton lg §3.1, Definition 3.1.1), with the facts used for completed tensor products: Emerton lg Proposition 3.1.3 (a continuous equivariant map between admissible continuous representations has closed image), Lemmas 3.1.6, 3.1.16 (ϖ-adic separatedness of Π ⊗̂\_A M for M^\* finitely generated) and 3.1.17 (𝔭-parts of Π ⊗̂\_A M), and Lemma B.6; (ii) Emerton’s ordinary-parts functor Ord\_B on admissible representations with its adjunction Hom\_G(Ind\_B^G U, V) ≅ Hom\_T(U, Ord\_B V) (Emerton, Ordinary parts I, Theorem 4.4.6) and its compatibility with completed cohomology as used in lg Proposition 6.2.2 and Corollary 5.6.13; (iii) Emerton’s locally analytic Jacquet functor J\_B with left exactness, as used in lg §7.2. Needed by: §R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses, §R31.6/promodularity-and-the-consequences-for-classical-and-overconvergent-forms.
- **PadicLocalLanglandsForGL2Qp:R30.3.** Colmez’s Montréal functor MF (and Paškūnas’s normalisation V̌) on admissible finite-length G-representations, exact and compatible with central characters; for ρ̄: G\_{Q\_p} → GL\_2(k) not a twist of (1 ∗; 0 ε̄), Colmez’s π̄ with MF(π̄) ≅ ρ̄, central character det(ρ̄)ε̄, no finite-dimensional subquotient (Emerton lg Theorem 3.3.2); the explicit mod p correspondence for irreducible ρ̄ (supersingular π̄ attached to Ind ω\_2^{r+1}, used in DLB Lemme 5.6 and in the socle description of Serre weights). Needed by: §R31.4/local-langlands-families-over-the-hecke-algebra, §R31.4/mod-p-multiplicity-and-serre-s-adelic-reformulation, §R31.5/patched-support-is-a-union-of-components, §R31.5/full-support-odd-p, §R31.5/full-support-dyadic, §R31.6/quaternionic-globalisation-of-supercuspidal-types.
- **PadicLocalLanglandsForGL2Qp:R30.4.** (i) Topological irreducibility of B(V) for absolutely irreducible V (Emerton lg Proposition 3.3.24; Colmez Theorem 0.17(ii)); (ii) Colmez’s non-vanishing of locally algebraic vectors for de Rham V with distinct Hodge–Tate weights (Theorem VI.6.18) and the description B(V)\_{l.alg} ≅ Sym^{a−b−1} ⊗ det^{b+1} ⊗ π\_p(V) in the crystabelline and semistable cases (Theorem VI.6.50) and its dependence only on π\_p(V) and the weights (Theorem VI.6.42); (iii) Berger–Breuil: for crystalline absolutely irreducible V with weights a < b and π\_p(V) unramified, B(V) is the universal unitary completion of π\_p(V) ⊗ Sym^{b−a−1} ⊗ det^a, so Hom^cont\_G(B(V), Π) = Hom\_G(π\_p(V) ⊗ Sym, Π) for unitary Banach Π; (iv) Colmez’s locally algebraic vectors for potentially semistable V in the form used by Tung (Corollary 4.3). The global case of Emerton lg Theorem 3.3.22 is not requested: it is R31.6/global-proof-of-locally-algebraic-vectors and must not be imported by R30. Needed by: §R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses, §R31.4/refined-local-global-compatibility, §R31.4/definite-quaternionic-local-global-compatibility, §R31.4/pan-semisimple-local-global-compatibility, §R31.5/full-support-odd-p, §R31.6/promodularity-and-the-consequences-for-classical-and-overconvergent-forms, §R31.6/global-proof-of-locally-algebraic-vectors.
- **PadicLocalLanglandsForGL2Qp:R30.5.** (i) Kisin’s theorem (Emerton lg Theorem 3.3.13): Def^\*(π̄) → Def(ρ̄) fully faithful, restricting to an equivalence Def^{crys}(π̄) ≅ Def^{crys}(ρ̄) (and Def^{crys} = Def under Assumption 3.3.1, Emerton Remark 3.3.14); (ii) the universal deformation π\_p of π̄\_p over R\_p when End(ρ̄\_p) = k, and for absolutely irreducible ρ̄\_p the orthonormalizable admissible family Π^{univ} with Π^{univ} ⊗ k(𝔭) ≅ Π(𝔭) (DLB §13); (iii) Paškūnas’s blocks of the category of compact O[[GL\_2(Z\_p)]]-modules with G-action and central character, their projective envelopes P\_B with E\_B = End(P\_B) finite over its centre ≅ R\_B^{ps} (Pan Theorems 3.4.5–3.4.6, Corollary 3.4.12), the finite generation of Hom(P\_B, M) over E\_B for admissible duals (Paškūnas, Image of Colmez’s functor, Proposition 4.17), Theorem 1.10 of that paper (irreducible subquotients of a specialisation at an absolutely irreducible point are isomorphic), and the projective envelope P̃ of the dual of the socle of π̄\_p with R\_p ≅ End(P̃) and π\_p^\* ≅ P̃ (Nakamura Proposition B.26); (iv) the 2-adic versions used by Tung. Needed by: §R31.4/local-langlands-families-over-the-hecke-algebra, §R31.4/refined-local-global-compatibility, §R31.4/dual-local-global-compatibility-for-completed-homology, §R31.4/quaternionic-multiplicity-module, §R31.4/definite-quaternionic-local-global-compatibility, §R31.4/block-multiplicity-module, §R31.4/pan-semisimple-local-global-compatibility, §R31.5/full-support-odd-p, §R31.5/full-support-dyadic.
- **PadicLocalLanglandsForGL2Qp:R30.6.** The purely local statements that the export table hands on, stated with their hypotheses: Breuil–Mézard in cycle form for p > 2 (Paškūnas 2015 Theorem 1.1 for p ≥ 5 with End ρ̄ = k; Hu–Tan for split non-scalar ρ̄; Tung Theorem 1.2 for all odd p) and for p = 2 (Tung Corollary 8.0.2), with the Hilbert–Samuel and cycle formalism of DeformationAndDerivedPatchingAlgebra. Tung’s proofs go through the global patched modules, which this roadmap plans (R31.5/full-support-odd-p part (4) and R31.5/full-support-dyadic part (4) state the resulting cycle identities); since the atlas orders R30.6 before R31.4, R30.6 must not import R31.5: it should state the local theorems with the global input marked as a supplier from R31.5, or the Breuil–Mézard statements proved by patching should be cited by consumers directly from R31.5. Needed by: §R31.6/export-table-for-gl2-lifting.
- **SmoothRepresentationsOfLocalGroups:SR.5.** Integral local Langlands in families for GL\_2(Q\_ℓ), ℓ ≠ p, over reduced complete local O-algebras: the co-Whittaker family π(ρ) attached to ρ: G\_{Q\_ℓ} → GL\_2(A) (unique, A-torsion-free, generic fibres the contragredient local Langlands representations; Emerton–Helm), unconditionally for n = 2; Φ (top derivative) of a co-Whittaker family is free of rank one; End\_{A[G]}(M ⊗ V) = End\_A(M) for co-Whittaker V and any A-module M (Nakamura Lemma B.10); the mod p fibre statement for p > 2 used in Emerton lg Theorem 6.1.2; and the Bernstein-centre inertial local Langlands for types used in CEGGPS §3. The current Tau Ceti SR.5 states the family construction conditionally on Helm’s conjecture; the n = 2 case is requested unconditionally. Needed by: §R31.4/local-langlands-families-over-the-hecke-algebra, §R31.4/refined-local-global-compatibility, §R31.4/dual-local-global-compatibility-for-completed-homology, §R31.5/type-specialised-patched-modules, §R31.6/global-proof-of-locally-algebraic-vectors.
- **ModularCurvesPartII:R14.6.** At a prime ℓ ≠ p where the level has Iwahori (Γ\_0(ℓ)) structure and the curve has the semistable model of R13.5: (i) the Hecke algebra generated by T\_q, S\_q for q prime to the level acts on the component group Φ of the Néron model of the Jacobian through an Eisenstein quotient, so Φ\_m = 0 for a non-Eisenstein m (Ribet, Invent. Math. 100 (1990), Corollary on p. 140, under the neatness of the level away from ℓ); (ii) geometric Frobenius at ℓ acts on the character group (torus) part of the special fibre by ℓ^{-1}U\_ℓ (Ribet, Proposition 3.8). The current R14.6 nodes state the character-group and component sequences and the good-reduction Eichler–Shimura relation only. Needed by: §R31.4/fibres-of-the-away-from-p-family.
- **CompletedCohomologyPartII:CC.8.** Extend CC.8/definite-unitary-degree-zero (stated for LLHLM §5.3’s definite outer form of GL\_3) to the definite unitary groups G̃ of rank n over a totally real F̃^+ used by CEGGPS §2.3 (Clozel–Harris–Taylor/Thorne type, quasi-split at finite places, compact at infinity): the completed degree-zero object lim\_s colim\_{U\_p} S\_{ξ,τ}(U\_pU^p, O/ϖ^s) with its tame Hecke and GL\_n(F̃^+\_p)-actions is the CC.2 completed object of the finite discrete tower, with the same stabiliser caveat. Needed by: §R31.5/ceggps-patched-module.

## Recorded gaps

- **Scholze’s functor is not planned.** Scholze’s functor S^i (cohomology of the Lubin–Tate tower’s pro-étale GL\_2(Q\_p)-torsor over P^1 with coefficients in the sheaf attached to an admissible smooth representation) and his comparison with completed cohomology of Shimura curves are routed by PAPER-COLMEZ-DOSPINESCU-NIZIOL-23 to the new roadmap of the pending design DESIGN-ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, which has no stages yet. Until it does, CDN Proposition 4.11 (Paškūnas Lemma 6.2) is stated here conditionally; once the design is accepted the node’s prerequisite becomes that roadmap’s stage. Needed by: §R31.4/scholze-functor-and-completed-cohomology-of-shimura-curves.
- **Local p-adic Langlands inputs await their owner’s plan.** PadicLocalLanglandsForGL2Qp has no blueprint packet (BP-PadicLocalLanglandsForGL2Qp, issue #970, is unplanned). The six requests to R30.2–R30.6 state the exact local statements consumed; until R30 is planned they are stage-level prerequisites, and the global theorems here are conditional on them in the same way GL2ModularityLifting’s package is conditional on LL1–LL3. Needed by: §R31.4/local-langlands-families-over-the-hecke-algebra, §R31.4/refined-local-global-compatibility, §R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses, §R31.4/definite-quaternionic-local-global-compatibility, §R31.4/pan-semisimple-local-global-compatibility, §R31.5/full-support-odd-p, §R31.5/full-support-dyadic.
- **Eisenstein maximal ideal for the ordinary Hilbert Hecke algebra.** Pan’s Proposition 5.6.1 (generalising Skinner–Wiles Proposition 3.18): under ord\_ϖ L\_p(F, −1, χ̃ω) > 0, ϖ and T\_v − (1 + χ(Frob\_v)) generate a maximal ideal of the ordinary Hecke algebra, via Eisenstein series and congruences of Hilbert modular forms. No accepted packet states it (OrdinaryAutomorphicFormsAndModularityLifting R21 plans the Skinner–Wiles R = T theory but not this congruence, and the Deligne–Ribet p-adic L-function belongs to the p-adic L-function roadmaps). Here the maximal ideal is a hypothesis; part (e) of the node, nonvanishing of T\_m, is conditional on this gap. Suggested owner: OrdinaryAutomorphicFormsAndModularityLifting R21 (Skinner–Wiles Eisenstein congruences). Needed by: §R31.3/eisenstein-localisation-and-pro-modular-primes.
- **Uninspected globalisation leaves.** The audit certifies Serre-independence only for the proofs read in this job (listed in the node’s hypotheses). Not re-read here: Calegari, Even Galois representations and the Fontaine–Mazur conjecture II, Proposition 3.2 (Moret-Bailly); Snowden, On two dimensional weight two odd representations of totally real fields, Proposition 8.2.1 and its inputs 8.2.2, 8.1.1, 5.1.1, 7.6.1, 4.4.2; Khare–Wintenberger, Serre’s modularity conjecture II, Theorem 6.1 and Lemma 3.5; Paškūnas, On 2-dimensional 2-adic Galois representations of local and global fields, Lemma 3.29; Emerton–Gee, A geometric perspective on the Breuil–Mézard conjecture, Proposition A.2 and Corollary A.7; Barnet-Lamb–Gee–Geraghty, Serre weights for rank two unitary groups, Theorem A.4.1 (which assumes a potentially automorphic residual seed). GL2ModularityLifting:R32.6’s request records partial readings of several of these; a follow-up must read each leaf and complete the classification. Needed by: §R31.6/globalisation-dependence-audit, §R31.5/ceggps-patched-module, §R31.5/full-support-odd-p, §R31.5/full-support-dyadic.
- **Emerton’s functional analysis and coadmissible modules.** Emerton’s Appendix C (coadmissible and cofinitely generated smooth G\_{Σ\_0}-representations over a complete local ring, closures, cotorsion-free quotients, the completed tensor product ⊗̃, Lemmas C.45–C.52, Proposition C.36) and Appendix A (Banach modules over A\_𝔭) are used through the multiplicity module and the evaluation-map criterion; CompletedCohomologyPartII CC.3 owns orthonormalizable and pro-free modules and mixed completed tensor products, but no accepted node states Appendix C’s coadmissibility theory, which Nakamura’s Appendix B.2.4 (Lemma B.16) also uses. It is planned here only through its uses in R31.4/multiplicity-module; the general theory should be owned by CompletedCohomologyPartII CC.3 (follow-up) or SmoothRepresentationsOfLocalGroups. Needed by: §R31.4/multiplicity-module, §R31.4/refined-local-global-compatibility, §R31.4/definite-quaternionic-local-global-compatibility.
- **Böckle’s density theorem and Diamond–Flach–Guo not read.** Böckle, On the density of modular points in universal deformation spaces (Amer. J. Math. 123 (2001)), Corollary 3.8, and Diamond–Flach–Guo (Ann. Sci. ÉNS 37 (2004)) are cited through Nakamura Theorem 2.1 and Emerton §7.3; their proofs were not read in this job. The nodes state the theorems with the citing sources’ hypotheses; a follow-up must read Böckle §3 and DFG’s R = T and local smoothness statements and replace the citing-source locators. Needed by: §R31.6/boeckle-r-equals-t, §R31.6/promodularity-and-the-consequences-for-classical-and-overconvergent-forms.
- **Emerton’s Theorem 6.1.2 cites a manuscript in preparation.** Emerton attributes the existence of π\_{Σ\_0}(ρ^m\_Σ) and its mod ϖ m-torsion description (for p > 2) to his reference [42], listed as ‘in preparation’. Existence in the cases used follows from his Corollary 6.4.13 with Theorems 6.4.16 and 6.4.20 (ρ̄\_p non-scalar), and from Emerton–Helm Proposition 6.2.4 (Nakamura §2.2) when End(ρ̄\_p) = k; the mod p fibre for p > 2, needed for Theorem 1.2.6, rests on Emerton–Helm’s mod ℓ local Langlands in families, requested from SmoothRepresentationsOfLocalGroups SR.5. Recorded also as a source issue. Needed by: §R31.4/local-langlands-families-over-the-hecke-algebra, §R31.4/mod-p-multiplicity-and-serre-s-adelic-reformulation.

## Source issues

- **E1** (EM11, §5.2, display after Remark 5.2.3, p. 47 (draft of 23 March 2011); misprint, affects nothing). The deformation ρ(K\_{Σ\_0}) is characterised by trace ρ(K\_{Σ\_0})(Frob\_ℓ) = T\_ℓ and det ρ(K\_{Σ\_0})(Frob\_ℓ) = S\_ℓ for ℓ ∉ Σ. Correction: det ρ(K\_{Σ\_0})(Frob\_ℓ) = ℓS\_ℓ. Reason: Definition 5.2.2 on the same page has ℓS\_ℓ ≡ det ρ̄(Frob\_ℓ) mod m; the parenthetical two lines later says Carayol’s deformation has characteristic polynomial X^2 − T\_ℓX + ℓS\_ℓ on Frob\_ℓ; and the deformation-ring element s\_ℓ = ℓ^{-1} det ρ^u(Frob\_ℓ) is mapped to S\_ℓ. Nakamura’s restatement (§2.1.2, p. 17) has det(ρ^m(Frob\_l)) = lS\_l.
- **E2** (EM11, Theorem 6.1.2 and its proof, pp. 66–67; reference [42], p. 117; gap, affects the proof). The existence of π\_{Σ\_0}(ρ^m\_Σ), and for p > 2 the identification of its mod ϖ m-torsion with ⊗\_ℓ π(ρ̄|G\_{Q\_ℓ}), are said to be proved in [42], which the bibliography lists as Emerton, ‘Local-global compatibility for mod p and p-adic modular forms’, in preparation. Correction: Existence is proved in the paper itself when ρ̄\_p is non-scalar (Corollary 6.4.13 with Theorems 6.4.16 and 6.4.20, as the proof notes) and follows from Emerton–Helm, Ann. Sci. ÉNS 47 (2014), Proposition 6.2.4, when End(ρ̄\_p) = k (as Nakamura §2.2 cites); the mod p fibre statement needs Emerton–Helm’s mod ℓ local Langlands in families. Reason: A result cited to an unavailable manuscript cannot be checked; Theorem 1.2.6 uses the mod p fibre statement through Proposition 6.1.20.
- **E3** (DLB, §4.1, Lemme 4.7, last display, p. 22 (arXiv v2); misprint, affects nothing). The K\_p-algebraic vectors of C^0(X), tensored with C, are written as the sum over W and π with π\_∞ ≅ W\_∞ of W\_∞ ⊗ π\_f^{K\_p}. Correction: π\_f^{K^pK\_p} in the K\_p-algebraic display (π\_f^{K^p} in the G-equivariant form over all K\_p). Reason: The first display of the lemma, from which the second is deduced, has π\_f^{K^pK\_p}; the tame level K^p is fixed throughout and C^0(X) only sees K^p-invariant vectors. Recorded by PAPER-DOSPINESCU-LEBRAS-17/E13.
- **E4** (DLB, §5.1, proof of Lemme 5.6, p. 27 (arXiv v2); misprint, affects nothing). The Hecke character χ of F is required to satisfy η̄\_p = ω\_2^{r+1}. Correction: The condition is on the p-adic Galois character η attached to χ: the reduction of η|G\_{F\_p} equals ω\_2^{r+1} up to unramified twist (F\_p = Q\_{p^2}), so that r̄\_p ≅ Ind\_{Q\_{p^2}}^{Q\_p} of that reduction. Reason: η is not defined in the proof; the required shape of r̄\_p is a condition on the Galois character of χ, not on its local component χ\_p. Recorded by PAPER-DOSPINESCU-LEBRAS-17/E2.
- **E5** (NAK, Proof of Corollary 2.8, p. 26 (arXiv v2); misprint, affects nothing). The corollary is said to follow from ‘Proposition 2.5’ and the isomorphism π\_p^\* ≅ P̃. Correction: Corollary 2.5. Reason: There is no Proposition 2.5; the dual local–global isomorphism is Corollary 2.5 on p. 25. Recorded by PAPER-NAKAMURA-23/E4.

## Acceptance tests for the roadmap

- The finite-level specialisation at a weight-two newform (level 11, p = 5, and the residually irreducible prime p = 3) recovers V\_f ⊗ π\_p(f) in the locally algebraic vectors, with the Hecke normalisation of ModularCurvesPartII R14 (§R31.2/classical-eigensystems-in-completed-cohomology).
- The limit constructions preserve R14's Hecke operator normalisation: T\_ℓ on Ĥ¹ restricts to the classical T\_ℓ on cusp forms at every finite level (§R31.1/arithmetic-actions-and-admissibility, §R31.2/classical-eigensystems-in-completed-cohomology).
- A classical weight-two eigensystem is run through the finite-level, completed, locally algebraic and Banach comparisons with the same normalisation: §R31.2 for the first three and §R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses for the Banach statement, which is not deduced from the isomorphism of locally algebraic vectors.
- The nonzero-map, injective-map and isomorphism branches of Emerton's Theorem 1.2.1 are separate statements with separate residual hypotheses.
- Every export to GL2ModularityLifting retains its source hypotheses (p = 3 exclusions, residual modularity, local irreducibility) and every use of Serre's conjecture is recorded (§R31.6/globalisation-dependence-audit, §R31.6/export-table-for-gl2-lifting).
