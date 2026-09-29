# P-adic Hodge theory and geometric comparison — part R06.5

## Purpose

This is part 2 of 2 of the roadmap `PadicHodgeTheory`. Part 1 (`PadicHodgeTheory--P7`: stages P7, P7:annulus-foundations, P8, P8:local-rational and R06.1–R06.4) plans the period rings, the period functors, the p-adic monodromy theorem and the small-weight interface. This part plans the two remaining stages:

- R06.5, geometric comparison theorems: the comparison of CohomologyComparisons CP.2 read through the period functor D_cris, its applications to abelian varieties (D_cris of abelian schemes, Hodge–Tate weights, Weil-pairing duality, ordinary and supersingular elliptic curves), and to modular curves and Kuga–Sato varieties (the de Rham realisation of a newform, crystallinity at primes not dividing the level, weight two);
- R06.6, arithmetic consequences: Kummer extensions and the Tate curve, the p-adic criterion of good reduction, semistable reduction, elliptic curves with v(j) < 0, local–global compatibility at good places, and the inputs of AutomorphicGaloisRepresentations R19: compatibility at p with local Langlands for modular forms (Scholl, Saito) and for Hilbert modular forms through Shimura curves (Saito).

This document is the second checkpoint. Its sources are public:

- Berger, *An introduction to the theory of p-adic representations* (arXiv:math/0210184), II.3–II.5, for the Tate curve and the Kummer extensions;
- Brinon–Conrad, *CMI Summer School notes on p-adic Hodge theory* (2009), §§7–9, for Grothendieck's criterion, the filtered φ-module of a smooth proper O_K-scheme, the ordinary/supersingular example and the Kummer classes;
- Coleman–Iovita, *The Frobenius and monodromy operators for curves and abelian varieties* (arXiv:math/9701229), Introduction, for the statement of the good-reduction criterion;
- Diamond–Flach–Guo, *Adjoint motives of modular forms and the Tamagawa number conjecture* (arXiv:2512.02348v2, the revised version of their Ann. Sci. ÉNS 2004 article), for the motive of a newform, its Hodge filtration, Scholl's crystalline Frobenius and the compatibility with local Langlands;
- T. Saito, *Hilbert modular forms and p-adic Hodge theory* (arXiv:math/0612077), §2, for the Hilbert case and the method;
- Darmon–Diamond–Taylor, *Fermat's Last Theorem* (revision of 2007), Theorem 3.1, for weight two.

The heavy inputs are imported, not rebuilt: the proper-smooth comparison isomorphisms from CohomologyComparisons CP.2 and PadicHodgeTheory P8, Tsuji's semistable comparison from CP.4, Katz–Messing from PadicDifferentialEquationsAndRigidCohomology RD.7, p-divisible groups and Kisin's classification from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.6, the modular abelian varieties and Eichler–Shimura from ModularCurvesPartII R14.5–R14.6, and Berger's theorem on de Rham extensions of semistable representations from PadicHodgeTheory R06.4.

## Scope and boundaries

- Sites, crystals and the geometric comparison morphisms are not constructed here (stage text). The crystalline comparison is CohomologyComparisons CP.2; the de Rham comparison and its compatibilities are PadicHodgeTheory P8/proper-smooth-de-rham-comparison-application.
- Tate modules of abelian varieties are ArithmeticGaloisRepresentations R01.6, the Weil pairing AbelianSchemesAndArithmeticModuli A3, relative de Rham cohomology A4, Néron models and Raynaud's uniformisation NeronModelsAndSemistableAbelianVarieties R11.1 and R11.3, the Tate curve the Tau Ceti EllipticCurves Layer 4, and Kummer theory in continuous cohomology ArithmeticGaloisDuality R02.1.
- The Galois representations of modular forms and their Kuga–Sato construction are AutomorphicGaloisRepresentations R19.1, Carayol's theorem R19.4, local Langlands for GL_2 GL2AutomorphicRepresentationsAndTransfer R16.3, Deligne–Rapoport models ModularCurvesPartII R13.5 and Shimura curves HilbertModularVarietiesAndShimuraCurves R18.2. Each enters through a request.
- Néron–Ogg–Shafarevich for ℓ ≠ p and the relation between N and the monodromy pairing are NeronModelsAndSemistableAbelianVarieties R11.5.
- The stage text's two warnings are respected: the Tate curve is the stage's de Rham representation that is not crystalline, and the local–global statements concern newforms and Tate modules, never a compatible system without the extra hypothesis of its source.

## Conventions

K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], v_p(p) = 1, and log_K is the Iwasawa logarithm (log_K(p) = 0). Period functors are covariant, D_B(V) = (B ⊗ V)^{G_K}; the monodromy operator on B_st is N = −d/du (Fontaine–Ouyang, Berger; Brinon–Conrad use −N), so Nφ = pφN and a geometric Frobenius F satisfies FNF^{−1} = q^{−1}N on Weil–Deligne representations; for crystalline V it acts through φ^f. Hodge–Tate weights follow HT(χ_p) = +1: they are the negatives of the jumps of D_dR, so V_p(A) has weights 0 and 1 while H^1_et(A_K̄, Q_p) has weights 0 and −1. For a newform g of weight k, M_{g,λ} is the cohomological realisation (weights 0 and 1 − k, geometric Frobenius polynomial X² − a_pX + ψ(p)p^{k−1} at p ∤ Nℓ, in Diamond–Flach–Guo's normalisation) and V_g its dual. Examples use 11a1 (y² + y = x³ − x² − 10x − 20), 15a1 (y² + xy + y = x³ + x² − 10x − 10) and Δ.

## R06.5 Geometric comparison theorems

The stage identifies the R06.2 period functors with geometric cohomology and recovers Hodge filtrations, weights, duals and twists: for smooth proper O_K-schemes, abelian varieties, modular curves and Kuga–Sato varieties.

### Theorems, comparisons and applications

#### Theorem. Crystalline comparison for smooth proper O_K-schemes, read through D_cris

*Node* `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`.

Throughout: K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], K̄ an algebraic closure, G_K = Gal(K̄/K), χ the p-adic cyclotomic character, v_p the valuation with v_p(p) = 1 and log_K the Iwasawa logarithm on K̄^× (log_K(p) = 0, PadicHodgeTheory:R06.1/log-extension-to-kbar). Period functors are covariant, D_B(V) = (B ⊗_{Q_p} V)^{G_K}, N = −d/du on B_st (PadicHodgeTheory:R06.1/semistable-period-ring), and Hodge–Tate weights follow HT(χ) = +1 (weights are the negatives of the jumps of D_dR). Let 𝔛 be a smooth proper O_K-scheme with generic fibre X and special fibre 𝔛_k, and i ≥ 0. Then V^i := H^i_et(X_K̄, Q_p) is a crystalline G_K-representation, and there are natural isomorphisms of filtered φ-modules D_cris(V^i) ≅ H^i_cris(𝔛_k/W(k))[1/p], where the right side carries the crystalline Frobenius and the filtration on K ⊗_{K_0} H^i_cris(𝔛_k/W(k))[1/p] ≅ H^i_dR(X/K) (Berthelot–Ogus) given by the Hodge filtration. Moreover D_dR(V^i) ≅ H^i_dR(X/K) as filtered K-spaces, the isomorphisms are functorial in 𝔛 and compatible with cup products, and gr^a D_dR(V^i) ≅ H^{i−a}(X, Ω^a), so the Hodge–Tate weight −a of V^i has multiplicity h^{a,i−a}: V^i has its weights in [−i, 0].

*Hypotheses.* The comparison itself is CohomologyComparisons:CP.2 (Bhatt–Morrow–Scholze, Integral p-adic Hodge theory, Theorems 14.5(i) and 14.6(i)) applied to the p-adic completion of 𝔛. This node supplies the item that CP.2 lists as remaining: the identification of its isomorphism with the R06.2 period functor D_cris through B_cris^{G_K} = K_0. The algebraic–analytic comparison H^i_et(X_K̄, Z/p^n) ≅ H^i_et(X^ad_C, Z/p^n) for proper X is requested from ClassicalAdicEtaleCohomology H5 (Huber). CP.2 records the G_K- and Frobenius-compatibility of its isomorphism as remaining work; this node inherits that dependency.

*Proof outline.*

1. Apply CP.2/crystalline-comparison-over-discretely-valued-base to the p-adic completion of 𝔛, a proper smooth formal O_K-scheme with rigid generic fibre X^ad, and transport along Huber's comparison (H5 request): H^i_et(X_K̄, Q_p) ⊗_{Q_p} B_cris ≅ H^i_cris(𝔛_k/W(k)) ⊗_{W(k)} B_cris, G_K- and φ-equivariant and filtered after ⊗_{K_0} K.
2. Take G_K-invariants. G_K acts trivially on H^i_cris(𝔛_k/W(k)) and B_cris^{G_K} = K_0 (PadicHodgeTheory:R06.1/crystalline-semistable-invariants), so D_cris(V^i) ≅ H^i_cris(𝔛_k/W(k))[1/p]; both sides of the comparison are free of rank dim V^i, so dim_{K_0} D_cris(V^i) = dim_{Q_p} V^i and V^i is crystalline (PadicHodgeTheory:R06.2/admissibility-dimension-bound).
3. Filtration: K ⊗_{K_0} D_cris(V^i) = D_dR(V^i) for crystalline V^i (PadicHodgeTheory:R06.2/crystalline-semistable-de-rham-implications), and D_dR(V^i) ≅ H^i_dR(X/K) with its Hodge filtration (PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application (a)); CP.2's filtered compatibility identifies this filtration with the Berthelot–Ogus transport of the crystalline side.
4. Functoriality and cup products: on D_dR from P8/proper-smooth-de-rham-comparison-application (b); on φ from the naturality of CP.2 (inherited remaining item).
5. Weights: the Hodge–de Rham spectral sequence degenerates (P8 application (a)), so gr^a H^i_dR(X/K) ≅ H^{i−a}(X, Ω^a), and a jump a is the Hodge–Tate weight −a (PadicHodgeTheory:R06.2/hodge-tate-weight-convention).

*Acceptance.*

- 𝔛 = P^1_{O_K}, i = 2: V^2 = Q_p(−1), D_cris(V^2) = K_0 t with φ = p and single jump 1, matching H^2_cris(P^1_k/W(k)) = W(k) with φ = p; weight −1.
- 𝔛 an abelian scheme, i = 1: PadicHodgeTheory:R06.5/abelian-scheme-dcris.
- An elliptic curve with good reduction: PadicHodgeTheory:R06.5/elliptic-curve-ordinary-supersingular.

*Uses.* `CohomologyComparisons:CP.2/crystalline-comparison-over-discretely-valued-base`, `ClassicalAdicEtaleCohomology:H5`, `PadicHodgeTheory:R06.1/crystalline-semistable-invariants`, `PadicHodgeTheory:R06.2/admissibility-dimension-bound`, `PadicHodgeTheory:R06.2/crystalline-semistable-de-rham-implications`, `PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.2/period-functors`.

*Planet:* Crystalline comparison for smooth proper models.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §7.3, display (7.3.1), p. 97: “The comparison isomorphism between crystalline and de Rham cohomology” The Berthelot–Ogus isomorphism H^i_dR(X/K) ≅ K ⊗_{K_0} H^i_cris(X_0/W(k))[1/p] and the filtered φ-module attached to a smooth proper O_K-scheme.
- An introduction to the theory of p-adic representations, II.5.1, p. 19: “After that, Fontaine and Messing proved the comparison theorem for the” History of the crystalline comparison (Fontaine–Messing, then Kato, Hyodo, Tsuji); the proof used here is CP.2's.

#### Application. The filtered φ-module of an abelian scheme: D_cris(V_p(A)) is dual to H^1_cris

*Node* `PadicHodgeTheory:R06.5/abelian-scheme-dcris`.

Throughout: K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], K̄ an algebraic closure, G_K = Gal(K̄/K), χ the p-adic cyclotomic character, v_p the valuation with v_p(p) = 1 and log_K the Iwasawa logarithm on K̄^× (log_K(p) = 0, PadicHodgeTheory:R06.1/log-extension-to-kbar). Period functors are covariant, D_B(V) = (B ⊗_{Q_p} V)^{G_K}, N = −d/du on B_st (PadicHodgeTheory:R06.1/semistable-period-ring), and Hodge–Tate weights follow HT(χ) = +1 (weights are the negatives of the jumps of D_dR). Let 𝒜/O_K be an abelian scheme of relative dimension g with generic fibre A and special fibre A_0. (a) V_p(A) is crystalline and D_cris(V_p(A)) ≅ H^1_cris(A_0/W(k))[1/p]^∨ as filtered φ-modules (dual object), because V_p(A) = H^1_et(A_K̄, Q_p)^∨. (b) Its filtration has jumps −1 and 0, each with multiplicity g: dualising the Hodge exact sequence 0 → H^0(A, Ω^1) → H^1_dR(A/K) → H^1(A, O_A) → 0 gives Fil^0 D_dR(V_p(A)) = H^1(A, O_A)^∨ ≅ Lie(A^∨)^∨ and gr^{−1} D_dR(V_p(A)) ≅ H^0(A, Ω^1)^∨ = Lie(A); hence t_H = t_N = −g. (c) (Dieudonné module) H^1_cris(A_0/W(k)) ≅ D(A_0[p^∞])^{(p)} Frobenius-compatibly (Berthelot–Breen–Messing), so the slopes of D_cris(V_p(A)) are the negatives of the Newton slopes of A_0 and lie in [−1, 0]. For g = 1 and W(k) this answers the request of MordellLawrenceVenkatesh LV.4.

*Hypotheses.* Part (c) is quoted from Brinon–Conrad Remark 7.3.3 (Berthelot–Breen–Messing, not read here); (a) and (b) do not use it. The identification T_p(A) = Hom(H^1_et(A_K̄, Z_p), Z_p) is requested from ArithmeticGaloisRepresentations R01.6; the Hodge exact sequence from AbelianSchemesAndArithmeticModuli A4.

*Proof outline.*

1. PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction with i = 1 gives D_cris(H^1_et(A_K̄, Q_p)) ≅ H^1_cris(A_0/W(k))[1/p] with the Hodge filtration.
2. V_p(A) is the Q_p-dual of H^1_et(A_K̄, Q_p) (R01.6 request; Brinon–Conrad p. 97), and D_cris commutes with duals on crystalline representations (PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful).
3. The dual filtration is Fil^i(D^∨) = (Fil^{1−i} D)^⊥; with Fil^1 H^1_dR = H^0(A, Ω^1) of dimension g (A4 request) this gives the jumps −1 and 0.
4. t_H = −g is the sum of the jumps; t_N = t_H because D_cris of a crystalline representation is weakly admissible (PadicHodgeTheory:R06.2/admissible-implies-weakly-admissible).
5. (c): Brinon–Conrad Remark 7.3.3 and FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible for D(A_0[p^∞]).

*Acceptance.*

- g = 1: PadicHodgeTheory:R06.5/elliptic-curve-ordinary-supersingular.
- A_0 ordinary: the slopes of D_cris(V_p(A)) are −1 and 0, each with multiplicity g.
- A_0 supersingular elliptic: a single slope −1/2 with multiplicity 2.

*Uses.* `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`, `ArithmeticGaloisRepresentations:R01.6`, `AbelianSchemesAndArithmeticModuli:A4`, `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`, `PadicHodgeTheory:R06.2/admissible-implies-weakly-admissible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §7.3, p. 97: “this Tate module is the Zp -linear dual of” T_p(A) is the Z_p-linear dual of H^1_et, so D_cris(V_p(A)) is the dual of the filtered φ-module of H^1.
- CMI Summer School notes on p-adic Hodge theory, Remark 7.3.3, pp. 97–98: “By work of Berthelot–Breen–Messing” Part (c): D(A[p^∞])^{(p)} ≅ H^1_cris(A/W(k)) ≅ H^1_dR(𝒜/W(k)), Hodge filtration matching Fontaine's module of logarithms.

#### Theorem. Tate modules of abelian varieties are de Rham with Hodge–Tate weights 0 and 1

*Node* `PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights`.

Throughout: K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], K̄ an algebraic closure, G_K = Gal(K̄/K), χ the p-adic cyclotomic character, v_p the valuation with v_p(p) = 1 and log_K the Iwasawa logarithm on K̄^× (log_K(p) = 0, PadicHodgeTheory:R06.1/log-extension-to-kbar). Period functors are covariant, D_B(V) = (B ⊗_{Q_p} V)^{G_K}, N = −d/du on B_st (PadicHodgeTheory:R06.1/semistable-period-ring), and Hodge–Tate weights follow HT(χ) = +1 (weights are the negatives of the jumps of D_dR). Let A/K be an abelian variety of dimension g, with no hypothesis on its reduction. Then V_p(A) is de Rham, D_dR(V_p(A)) ≅ H^1_dR(A/K)^∨ with the dual Hodge filtration, and V_p(A) has Hodge–Tate weights 0 and 1, each with multiplicity g. Equivalently (Hodge–Tate decomposition) C_K ⊗_{Q_p} V_p(A) ≅ (C_K(1) ⊗_K Lie(A)) ⊕ (C_K ⊗_K H^1(A, O_A)^∨). When A has good reduction this is Tate's decomposition for the p-divisible group of its Néron model.

*Hypotheses.* Étale cohomology of the algebraic variety is compared with that of its analytification through the H5 request (Huber).

*Proof outline.*

1. A^an is proper smooth over K; PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application (a) makes H^1_et(A_K̄, Q_p) de Rham with D_dR ≅ H^1_dR(A/K) and its Hodge filtration (H5 request for the comparison with the analytification).
2. V_p(A) = H^1_et(A_K̄, Q_p)^∨ (R01.6 request) is de Rham with D_dR(V_p(A)) = D_dR(H^1)^∨ (PadicHodgeTheory:R06.2/ddr-exact-strict-tensor).
3. dim H^0(A, Ω^1) = dim H^1(A, O_A) = g (A4 request) gives jumps −1 and 0 of multiplicity g; weights are negatives of jumps (PadicHodgeTheory:R06.2/hodge-tate-weight-convention), and de Rham implies Hodge–Tate with gr D_dR = D_HT (PadicHodgeTheory:R06.2/de-rham-implies-hodge-tate), which is the decomposition.
4. Good reduction cross-check: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/hodge-tate-p-divisible for 𝒜[p^∞] gives the same multiplicities (dim 𝒜[p^∞] = g, dim of its Cartier dual = g).

*Acceptance.*

- det V_p(E) = Q_p(1) has weight 1 = 0 + 1 (PadicHodgeTheory:R06.5/weil-pairing-duality).
- Tate curve: weights {0, 1} (PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module).
- Non-example: H^1_et(A_K̄, Q_p) itself has weights 0 and −1; confusing it with V_p(A) flips the sign (see sourceIssue PadicHodgeTheory/E45).

*Uses.* `PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application`, `ClassicalAdicEtaleCohomology:H5`, `ArithmeticGaloisRepresentations:R01.6`, `AbelianSchemesAndArithmeticModuli:A4`, `PadicHodgeTheory:R06.2/ddr-exact-strict-tensor`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.2/de-rham-implies-hodge-tate`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/hodge-tate-p-divisible`.

*Planet:* Hodge–Tate weights of abelian varieties.

*Sources.*

- An introduction to the theory of p-adic representations, II.5.1, p. 19: “It was shown early on by Fontaine that the Tate modules” Fontaine: V_p(A) is de Rham for every abelian variety A, with D_dR(V_p(A)) dual to H^1_dR(A/K).
- CMI Summer School notes on p-adic Hodge theory, §7.2, after Theorem 7.2.8, p. 94: “for abelian varieties A over K with good reduction, and to then” Tate's Hodge–Tate decomposition in the good-reduction case.

#### Theorem. Weil-pairing duality, Tate twists and the determinant test

*Node* `PadicHodgeTheory:R06.5/weil-pairing-duality`.

Throughout: K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], K̄ an algebraic closure, G_K = Gal(K̄/K), χ the p-adic cyclotomic character, v_p the valuation with v_p(p) = 1 and log_K the Iwasawa logarithm on K̄^× (log_K(p) = 0, PadicHodgeTheory:R06.1/log-extension-to-kbar). Period functors are covariant, D_B(V) = (B ⊗_{Q_p} V)^{G_K}, N = −d/du on B_st (PadicHodgeTheory:R06.1/semistable-period-ring), and Hodge–Tate weights follow HT(χ) = +1 (weights are the negatives of the jumps of D_dR). Let A/K be an abelian variety with dual A^∨. (a) The Weil pairing T_p(A) × T_p(A^∨) → Z_p(1) is perfect and G_K-equivariant, so V_p(A^∨) ≅ V_p(A)^∨(1) and H^1_et(A_K̄, Q_p) ≅ V_p(A)^∨ ≅ V_p(A^∨)(−1). (b) For B ∈ {B_cris, B_st, B_dR} with V_p(A) B-admissible, D_B(V_p(A^∨)) ≅ D_B(V_p(A))^∨ ⊗ D_B(Q_p(1)) compatibly with φ, N and filtrations, where D_cris(Q_p(1)) = K_0 t^{−1} with φ = p^{−1} and single jump −1. A polarization A → A^∨ gives a G_K-equivariant perfect alternating pairing V_p(A) × V_p(A) → Q_p(1), hence an alternating pairing D_B(V_p(A)) × D_B(V_p(A)) → D_B(Q_p(1)) compatible with φ, N and the filtrations. (c) For an elliptic curve E, det V_p(E) ≅ Q_p(1), so det D_st(V_p(E)) ≅ K_0 t^{−1}: for K_0 = Q_p the linear map φ has determinant p^{−1}, and the two filtration jumps sum to −1. This is the determinant test of the roadmap: with HT(χ) = +1 the determinant has weight +1 and Frobenius p^{−1} on D_cris.

*Hypotheses.* The Weil pairing and polarization pairings are AbelianSchemesAndArithmeticModuli A3 (request); the Tate-module determinant is ArithmeticGaloisRepresentations R01.6 (request).

*Proof outline.*

1. (a): the pairings A[p^n] × A^∨[p^n] → μ_{p^n} are perfect and compatible in n (A3 request); pass to the limit. H^1_et(A_K̄, Q_p) = V_p(A)^∨ (R01.6 request), and V_p(A)^∨ ≅ V_p(A^∨)(−1) by (a).
2. (b): D_B is an exact tensor functor commuting with duals on B-admissible representations (PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful, PadicHodgeTheory:R06.2/ddr-exact-strict-tensor), and D_cris(Q_p(1)) is computed in PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified (1).
3. (c): a perfect alternating pairing on a rank-two V with values in Q_p(1) identifies Λ²V with Q_p(1); D_B commutes with Λ².

*Acceptance.*

- Tate curve D_q (PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module): det φ = p^{−1}·1 and jumps −1 + 0 = −1.
- 11a1 at p = 19 (supersingular): the linear φ on D_cris(V_19(E)) has characteristic polynomial X² + 1/19, determinant 1/19.
- Sign test: in Brinon–Conrad's covariant weight convention the determinant has weight −1; the dictionary is PadicHodgeTheory:R06.2/hodge-tate-weight-convention.

*Uses.* `AbelianSchemesAndArithmeticModuli:A3`, `ArithmeticGaloisRepresentations:R01.6`, `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`, `PadicHodgeTheory:R06.2/ddr-exact-strict-tensor`, `PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`.

*Sources.*

- An introduction to the theory of p-adic representations, II.5.1, p. 19: “One should remember that for an abelian variety A,” Berger states the duality between T_p(A) and H^1_et; as printed the Tate twist is misplaced (sourceIssue PadicHodgeTheory/E45), corrected in (a).

#### Theorem. Good ordinary and good supersingular elliptic curves: same Hodge filtration, different Frobenius

*Node* `PadicHodgeTheory:R06.5/elliptic-curve-ordinary-supersingular`.

Throughout: K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], K̄ an algebraic closure, G_K = Gal(K̄/K), χ the p-adic cyclotomic character, v_p the valuation with v_p(p) = 1 and log_K the Iwasawa logarithm on K̄^× (log_K(p) = 0, PadicHodgeTheory:R06.1/log-extension-to-kbar). Period functors are covariant, D_B(V) = (B ⊗_{Q_p} V)^{G_K}, N = −d/du on B_st (PadicHodgeTheory:R06.1/semistable-period-ring), and Hodge–Tate weights follow HT(χ) = +1 (weights are the negatives of the jumps of D_dR). Let E/K be an elliptic curve with good reduction E_0 over k = F_q, q = p^f, and a := q + 1 − #E_0(k). Let D = D_cris(V_p(E)), a filtered φ-module of rank 2 over K_0 with jumps −1 and 0. (a) The K_0-linear map φ^f on D has characteristic polynomial X² − (a/q)X + 1/q. (b) E_0 is ordinary (p ∤ a) iff D has slopes −1 and 0; then D = D_{−1} ⊕ D_0 into φ-stable lines, (D_{−1})_K ≠ Fil^0 D_K, and D_{−1} is a weakly admissible subobject, so V_p(E) has a G_K-stable line that is an unramified twist of Q_p(1) (from the formal group); it is the only G_K-stable line unless Fil^0 D_K = (D_0)_K, in which case V_p(E) is the direct sum of it and an unramified line (as for a canonical lift). (c) E_0 is supersingular (p | a) iff D is isoclinic of slope −1/2; then D has no φ-stable K_0-line and V_p(E) is irreducible. (d) Hence good ordinary and good supersingular curves have the same Hodge–Tate weights {0, 1} and the same Hodge polygon, but non-isomorphic φ-modules.

*Hypotheses.* The comparison with Dieudonné modules (Brinon–Conrad Example 8.1.10 via Berthelot–Breen–Messing) is a consistency check; the proof uses Katz–Messing on H^1_cris.

*Proof outline.*

1. D ≅ H^1_cris(E_0/W(k))[1/p]^∨ (PadicHodgeTheory:R06.5/abelian-scheme-dcris) ≅ H^1_cris(E_0/W(k))[1/p] ⊗ D_cris(Q_p(1)) by PadicHodgeTheory:R06.5/weil-pairing-duality (a) with E = E^∨.
2. Katz–Messing (PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective): φ^f on H^1_cris(E_0/W(k)) ⊗ K_0 has characteristic polynomial X² − aX + q; tensoring with D_cris(Q_p(1)), where φ^f = q^{−1}, gives (a).
3. Newton polygon of X² − aX + q: root valuations {0, f} if p ∤ a and {f/2, f/2} if p | a (|a| ≤ 2√q); divide by f and shift by −1. The slope decomposition (PadicHodgeTheory:R06.2/slope-decomposition) gives D = D_{−1} ⊕ D_0 in the ordinary case; a φ-stable line has integral slope (PadicHodgeTheory:R06.2/newton-number-tN), so none exists in the supersingular case.
4. Subrepresentations of a crystalline V correspond to weakly admissible φ-stable subobjects with the induced filtration (PadicHodgeTheory:R06.2/crystalline-subobjects-strict). For D_{−1}: t_N = −1, and t_H(D_{−1}) = −1 unless (D_{−1})_K = Fil^0, which weak admissibility of D excludes (t_H would be 0 > t_N). D_0 is a subobject with t_H = t_N only if Fil^0 = (D_0)_K (the split case); otherwise it is not a subrepresentation.
5. Consistency with Dieudonné theory: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/elliptic-dieudonne (ordinary ⇔ M1, supersingular ⇔ M2).

*Acceptance.*

- 11a1, p = 3: a_3 = −1 (ordinary); X² + X/3 + 1/3 has root valuations −1 and 0 (point count by script).
- 11a1, p = 19: a_19 = 0 (supersingular); X² + 1/19 has both roots of valuation −1/2.
- 11a1, p = 2: a_2 = −2 (supersingular); X² + X + 1/2 has both roots of valuation −1/2.
- All three have jumps −1 and 0: the required example "same Hodge weights, different Frobenius structures".

*Uses.* `PadicHodgeTheory:R06.5/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/weil-pairing-duality`, `PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective`, `PadicHodgeTheory:R06.2/slope-decomposition`, `PadicHodgeTheory:R06.2/newton-number-tN`, `PadicHodgeTheory:R06.2/crystalline-subobjects-strict`, `PadicHodgeTheory:R06.2/weak-admissibility`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/elliptic-dieudonne`, `mathlib:WeierstrassCurve.HasGoodReduction`.

*Planet:* Ordinary and supersingular elliptic curves.

*Sources.*

- An introduction to the theory of p-adic representations, II.3.2, p. 14: “curve over F with good ordinary reduction, then Dcris (V ) is a 2-dimensional F” The ordinary case: φ(x) = α_0p^{−1}x, φ(y) = β_0y with α_0, β_0 ∈ O_F^×, and Fil^0 = F(y + λx).
- An introduction to the theory of p-adic representations, II.3.2, p. 14: “the operator ϕ : Dcris (V ) → Dcris (V ) is irreducible” The supersingular case: no φ-stable line.
- CMI Summer School notes on p-adic Hodge theory, Example 8.1.10, p. 107: “In contrast, the structure of D as an isocrystal depends on whether the reduction E0” Same Hodge polygon, Newton polygon depending on ordinary versus supersingular.

#### Theorem. The p-adic realisation of a modular form is de Rham, with Hodge–Tate weights 0 and 1 − k

*Node* `PadicHodgeTheory:R06.5/modular-form-de-rham-realisation`.

Throughout: a newform g of weight k ≥ 2, level N and character ψ has coefficients in a number field K ⊂ C; λ is a place of K above the prime p, and M_g is the rank-two premotivic structure over K cut out of the parabolic cohomology of the modular curve with coefficients in Sym^{k−2} of the relative H^1 of the universal elliptic curve (equivalently of a Kuga–Sato variety) by the Hecke ideal of g, in the normalisation of Diamond–Flach–Guo (arXiv v2): ∧²M_g ≅ M_ψ(1 − k) and Frob_p denotes a geometric Frobenius. Its λ-adic realisation M_{g,λ} is the cohomological representation, and V_g := M_{g,λ}^∨ is the covariant one (det V_g = ψ^{−1}χ^{k−1}). Period functors are covariant and Hodge–Tate weights follow HT(χ) = +1. For every prime p and λ | p, M_{g,λ}|_{G_{Q_p}} is de Rham, and the comparison isomorphism identifies D_dR(M_{g,λ}) ≅ K_λ ⊗_K M_{g,dR} as filtered K_λ-spaces: Fil^0 = D_dR, Fil^{k−1} = K_λ·g (the line of g) and Fil^k = 0. Hence M_{g,λ} has Hodge–Tate weights 0 and 1 − k, V_g has Hodge–Tate weights 0 and k − 1, and the perfect alternating pairing ∧²M_{g,λ} ≅ K_λ(ψ)(1 − k) is compatible with D_dR (the filtration jumps add up to k − 1). For k = 2 the weights of V_g are {0, 1}, those of a Tate module.

*Hypotheses.* The construction of M_g (Hecke projector, parabolic cohomology with coefficients, its Kuga–Sato model and the rank-two statement) belongs to AutomorphicGaloisRepresentations R19.1 (request); Diamond–Flach–Guo Lemma 5.7 is quoted for rank two and Fil^{k−1} M_{g,dR} = Kg. Diamond–Flach–Guo obtain the λ-adic–de Rham comparison from Faltings' theorem with coefficients; the proof below uses the smooth proper Kuga–Sato model instead, through the de Rham comparison of part P7.

*Proof outline.*

1. M_{g,λ} is the image of a Hecke idempotent (a correspondence) acting on H^{k−1}_et of a smooth proper Kuga–Sato variety over Q (Scholl; R19.1 request), and M_{g,dR} is the image of the same correspondence on H^{k−1}_dR.
2. The de Rham comparison for smooth proper varieties is compatible with correspondences (PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application (a), (b)), so it restricts to the summands: M_{g,λ} is de Rham and D_dR(M_{g,λ}) ≅ K_λ ⊗_K M_{g,dR} with the induced Hodge filtration.
3. Rank two and Fil^{k−1} M_{g,dR} = Kg (Diamond–Flach–Guo Lemma 5.7); the jumps are therefore 0 and k − 1, since the graded pieces of the Hodge filtration of the Kuga–Sato summand sit in degrees 0 and k − 1 only.
4. Weights are the negatives of the jumps (PadicHodgeTheory:R06.2/hodge-tate-weight-convention); V_g = M_{g,λ}^∨ has the negated weights (PadicHodgeTheory:R06.2/ddr-exact-strict-tensor).
5. The pairing ∧²M_g ≅ M_ψ(1 − k) respects the comparison isomorphisms (Diamond–Flach–Guo §3, pairings against Faltings' comparison), and D_dR(K_λ(ψ)(1 − k)) has its single jump at k − 1 = 0 + (k − 1).

*Acceptance.*

- k = 2: M_{g,λ} ⊆ H^1_et(X_1(N)_{Q̄}, K_λ), weights 0 and −1, dual weights {0, 1} (PadicHodgeTheory:R06.5/weight-two-modular-abelian-varieties).
- Δ (k = 12, N = 1): V_Δ has Hodge–Tate weights {0, 11}.
- Non-example: a representation with Hodge–Tate weights {0, 1} and determinant of weight 2 is not a V_g (the determinant of V_g has weight k − 1 = 0 + (k − 1)).

*Uses.* `AutomorphicGaloisRepresentations:R19.1`, `PadicHodgeTheory:P8/proper-smooth-de-rham-comparison-application`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.2/ddr-exact-strict-tensor`, `PadicHodgeTheory:R06.2/period-functors`.

*Planet:* de Rham comparison for modular forms.

*Sources.*

- Adjoint motives of modular forms and the Tamagawa number conjecture, Lemma 5.7, p. 58 (arXiv v2): “Mg is a premotivic structure of rank 2 over K and Filk−1 Mg,dR = Kg.” Rank two and the Hodge line of g.
- Adjoint motives of modular forms and the Tamagawa number conjecture, §0.2, p. 4 (arXiv v2): “the comparison between ℓ-adic and de Rham cohomology being” The λ-adic–de Rham comparison for M_{N,k} is Faltings' theorem; Scholl's Kuga–Sato construction allows Tsuji's.

#### Theorem. Modular forms are crystalline at primes not dividing the level, with Frobenius polynomial X² − a_pX + ψ(p)p^{k−1}

*Node* `PadicHodgeTheory:R06.5/modular-form-crystalline-good-primes`.

Throughout: a newform g of weight k ≥ 2, level N and character ψ has coefficients in a number field K ⊂ C; λ is a place of K above the prime p, and M_g is the rank-two premotivic structure over K cut out of the parabolic cohomology of the modular curve with coefficients in Sym^{k−2} of the relative H^1 of the universal elliptic curve (equivalently of a Kuga–Sato variety) by the Hecke ideal of g, in the normalisation of Diamond–Flach–Guo (arXiv v2): ∧²M_g ≅ M_ψ(1 − k) and Frob_p denotes a geometric Frobenius. Its λ-adic realisation M_{g,λ} is the cohomological representation, and V_g := M_{g,λ}^∨ is the covariant one (det V_g = ψ^{−1}χ^{k−1}). Period functors are covariant and Hodge–Tate weights follow HT(χ) = +1. Let p ∤ N and λ | p. Then M_{g,λ}|_{G_{Q_p}} is crystalline, and the K_λ-linear map φ on D_cris(M_{g,λ}) has characteristic polynomial X² − a_p(g)X + ψ(p)p^{k−1}; D_cris(M_{g,λ}) is weakly admissible with t_H = t_N = k − 1. M_{g,λ}|_{G_{Q_p}} is ordinary iff a_p(g) is a λ-adic unit: then D_cris = D_0 ⊕ D_{k−1} into φ-stable lines of slopes 0 and k − 1, D_0 is a subobject, and M_{g,λ}|_{G_{Q_p}} has an unramified subrepresentation on which the geometric Frobenius acts by the unit root α of X² − a_pX + ψ(p)p^{k−1}; dually V_g|_{G_{Q_p}} has an unramified quotient. If a_p(g) is not a unit, both slopes are positive and M_{g,λ}|_{G_{Q_p}} has no unramified subrepresentation.

*Hypotheses.* Crystallinity and the Frobenius polynomial are Scholl's theorem, quoted from Diamond–Flach–Guo (arXiv v2, proof of Lemma 8.13) and not read in Scholl's paper; for p > k Diamond–Flach–Guo obtain the crystalline realisation from Faltings' comparison with coefficients. The Eichler–Shimura relation used to compare with the ℓ-adic side is ModularCurvesPartII R14.6 (weight two) and R19.1 (request) for higher weight.

*Proof outline.*

1. A Kuga–Sato variety of level N has a smooth proper model over Z[1/N] on which the Hecke idempotent of g acts (Scholl; R19.1 request); PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction for this model, restricted to the summand, makes M_{g,λ}|_{G_{Q_p}} crystalline with D_cris equal to the g-part of H^{k−1}_cris of the special fibre.
2. Frobenius: Katz–Messing (PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective) identifies the characteristic polynomial of φ on the crystalline summand with that of a geometric Frobenius on the ℓ-adic summand, which is X² − a_pX + ψ(p)p^{k−1} by Eichler–Shimura (ModularCurvesPartII:R14.6/special-fibre-eichler-shimura for k = 2; R19.1 request).
3. t_N = v_p(ψ(p)p^{k−1}) = k − 1 = t_H (PadicHodgeTheory:R06.5/modular-form-de-rham-realisation).
4. Newton polygon: the root valuations are {0, k − 1} iff a_p is a unit and are both positive otherwise; the slope decomposition (PadicHodgeTheory:R06.2/slope-decomposition) and weak admissibility force (D_0)_{K} ≠ Fil^{k−1}, so D_0 has t_H = 0 = t_N and is a subobject, i.e. an unramified subrepresentation (PadicHodgeTheory:R06.2/crystalline-subobjects-strict, PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified (2)); a geometric Frobenius acts on it through φ, by α.
5. Consistency with local Langlands: PadicHodgeTheory:R06.6/modular-form-local-global-compatibility-at-p with π_p(g) unramified.

*Acceptance.*

- Δ (k = 12, N = 1): at p = 11, τ(11) = 534612 ≡ 1 mod 11, ordinary; at p = 2, τ(2) = −24, non-ordinary; at p = 2411, τ(2411) ≡ 0 mod 2411, non-ordinary (τ(p) mod p computed from the product formula by script).
- 11a1 (k = 2): ordinary at 3 (a_3 = −1), not at 2 or 19 (PadicHodgeTheory:R06.5/elliptic-curve-ordinary-supersingular).
- Slopes: X² − a_pX + ψ(p)p^{k−1} has root valuations summing to k − 1 = t_H.

*Uses.* `PadicHodgeTheory:R06.5/modular-form-de-rham-realisation`, `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`, `PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective`, `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura`, `AutomorphicGaloisRepresentations:R19.1`, `PadicHodgeTheory:R06.2/slope-decomposition`, `PadicHodgeTheory:R06.2/crystalline-subobjects-strict`, `PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`, `PadicHodgeTheory:R06.2/weak-admissibility`.

*Planet:* Crystalline at primes not dividing the level.

*Sources.*

- Adjoint motives of modular forms and the Tamagawa number conjecture, Proof of Lemma 8.13, p. 104 (arXiv v2): “By [Scho2] we know that the characteristic polynomial of ϕ on M := Mf,λ-crys is” X² − a_ℓX + ψ(ℓ)ℓ^{k−1} on the crystalline realisation (ℓ ∤ N, ℓ > k), after Scholl.
- Fermat's Last Theorem, Theorem 3.1(f) and its proof, pp. 86–87 (revision of 9 September 2007): “Moreover ρ|G` is ordinary if and only if a` is” Weight two: ordinary iff a_ℓ is a unit, with the unramified quotient given by the unit root.

#### Application. Weight two: the Tate modules of modular abelian varieties at p

*Node* `PadicHodgeTheory:R06.5/weight-two-modular-abelian-varieties`.

Let f be a newform of weight 2, level N and character ψ with coefficient field K_f, A_f = J_1(N)/p_fJ_1(N) the modular abelian variety (ModularCurvesPartII R14.5), λ | p a place of K_f and ρ_f = K_{f,λ} ⊗_{K_f ⊗ Q_p} V_p(A_f) its λ-adic representation (arithmetic Frobenius at ℓ ∤ Np of characteristic polynomial X² − a_ℓX + ℓψ(ℓ); Darmon–Diamond–Taylor Theorem 3.1). (a) If p ∤ N, A_f has good reduction at p, so ρ_f|_{G_{Q_p}} is crystalline with Hodge–Tate weights {0, 1} and comes from the p-divisible group of the Néron model: it is Barsotti–Tate. (b) Then ρ_f|_{G_{Q_p}} is ordinary iff a_p is a λ-adic unit, with unramified quotient on which the arithmetic Frobenius acts by the unit root of X² − a_pX + pψ(p). (c) If p ∥ N, p is odd and p does not divide the conductor of ψ, A_f has semistable reduction at p, ρ_f|_{G_{Q_p}} is semistable and not crystalline (N ≠ 0), ordinary, with unramified quotient on which Frobenius acts by a_p. (d) In general ρ_f|_{G_{Q_p}} is potentially semistable, and potentially Barsotti–Tate iff N = 0 on its Weil–Deligne representation.

*Hypotheses.* The comparison V_p(A_f) ≅ ⊕_{λ|p} ρ_{f,λ} and the characteristic polynomials are R19.1 and ModularCurvesPartII R14.5–R14.6; Darmon–Diamond–Taylor Theorem 3.1 is quoted for their form. Their "good" and "ordinary" are the finite flat and ordinary conditions of Wiles; (a)–(c) translate them into p-adic Hodge theory. Semistable reduction of A_f at p ∥ N (Deligne–Rapoport) is requested from ModularCurvesPartII R13.5.

*Proof outline.*

1. (a): A_f has good reduction over Z[1/N] (ModularCurvesPartII:R14.5/modular-quotient); PadicHodgeTheory:R06.6/good-reduction-iff-crystalline (a) gives crystallinity with weights {0, 1}, and FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/abelian-scheme-torsion-finite-flat gives T_p(A_f) = T_p(𝒜_f[p^∞]); the K_f ⊗ Z_p-action splits it along λ | p (ModularCurvesPartII:R14.5/quotient-tate-exact).
2. (b): the Frobenius polynomial of D_cris is that of PadicHodgeTheory:R06.6/local-global-compatibility-good-reduction (b) applied to A_f; the slope argument of PadicHodgeTheory:R06.5/elliptic-curve-ordinary-supersingular (b) applies λ-componentwise.
3. (c): as ψ is unramified at p, A_f is a quotient of the Jacobian of the modular curve of level Γ_1(N/p) ∩ Γ_0(p), which has semistable reduction at p (Deligne–Rapoport; R13.5 request); PadicHodgeTheory:R06.6/semistable-reduction-semistable gives semistability; N ≠ 0 because π_p(f) is a twist of Steinberg (PadicHodgeTheory:R06.6/modular-form-local-global-compatibility-at-p), and the ordinary form is Darmon–Diamond–Taylor 3.1(g).
4. (d): PadicHodgeTheory:R06.6/modular-form-local-global-compatibility-at-p and PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion (b).

*Acceptance.*

- 11a1 = A_f for the newform of level 11: good at 3 (crystalline, ordinary), split multiplicative at 11 (case (c), PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module).
- 15a1 at 3: p ∥ 15, ψ trivial, case (c) with a_3 = −1 (non-split).

*Uses.* `ModularCurvesPartII:R14.5/modular-quotient`, `ModularCurvesPartII:R14.5/quotient-tate-exact`, `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/abelian-scheme-torsion-finite-flat`, `PadicHodgeTheory:R06.6/local-global-compatibility-good-reduction`, `PadicHodgeTheory:R06.5/elliptic-curve-ordinary-supersingular`, `PadicHodgeTheory:R06.6/semistable-reduction-semistable`, `PadicHodgeTheory:R06.6/modular-form-local-global-compatibility-at-p`, `PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion`, `ModularCurvesPartII:R13.5`, `AutomorphicGaloisRepresentations:R19.1`.

*Sources.*

- Fermat's Last Theorem, Theorem 3.1(a), p. 86 (revision of 9 September 2007): “has characteristic poly-” ρ_f unramified outside Nℓ with Frobenius polynomial X² − a_pX + pψ(p).
- Fermat's Last Theorem, Proof of Theorem 3.1, p. 87: “The first assertion of (f) follows from the fact that Af has good reduction” Good reduction of A_f at ℓ ∤ N; (g) from Deligne–Rapoport.

### What is missing

- The endpoint-weight case consumed by R19.5 (k = p + 1 and weight p) is not planned; it is PadicHodgeTheory R06.4's weight-p branches applied to V_g.
- The semistable geometric branch for general semistable models (CP.4 Hyodo–Kato; WeightsInEtaleCohomology R34.3) is used only through requests; the Shimura-curve de Rham realisation (Hodge filtration of Carayol's coefficient systems) is quoted from Saito at statement level.
- Berthelot–Breen–Messing (Dieudonné module versus H^1_cris) is quoted from Brinon–Conrad Remark 7.3.3, not read.
- Scholl's crystalline theorem and Frobenius polynomial are quoted through Diamond–Flach–Guo; Scholl's paper is not read.
- CP.2's remaining G_K- and Frobenius-compatibility is inherited by PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction.

## R06.6 Arithmetic consequences

The stage deduces the good-reduction and semistable-reduction statements for Tate modules, computes the Tate curve, and supplies the local–global compatibility inputs used by R19.

### Objects

#### Construction. The Kummer representation V(q) of an element q ∈ K^×

*Module* `TauCeti/PadicHodge/Geometric/Kummer.lean`. *Node* `PadicHodgeTheory:R06.6/kummer-representation`.

Throughout: K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], K̄ an algebraic closure, G_K = Gal(K̄/K), χ the p-adic cyclotomic character, v_p the valuation with v_p(p) = 1 and log_K the Iwasawa logarithm on K̄^× (log_K(p) = 0, PadicHodgeTheory:R06.1/log-extension-to-kbar). Period functors are covariant, D_B(V) = (B ⊗_{Q_p} V)^{G_K}, N = −d/du on B_st (PadicHodgeTheory:R06.1/semistable-period-ring), and Hodge–Tate weights follow HT(χ) = +1 (weights are the negatives of the jumps of D_dR). Fix a compatible system ε = (ε^{(n)})_n of primitive p^n-th roots of unity. For q ∈ K^× choose q̃ = (q^{(n)})_n with q^{(0)} = q and (q^{(n+1)})^p = q^{(n)}, and define c_q: G_K → Z_p by g(q^{(n)}) = q^{(n)}(ε^{(n)})^{c_q(g)} for all n. Then c_q is a continuous 1-cocycle, c_q(gh) = c_q(g) + χ(g)c_q(h), and T(q) = Z_p e ⊕ Z_p f with g e = χ(g)e, g f = f + c_q(g)e is a continuous Z_p[G_K]-module; V(q) := Q_p ⊗ T(q). (i) 0 → Z_p(1) → T(q) → Z_p → 0 is exact and its class in H^1(K, Z_p(1)) is the Kummer class δ(q). (ii) Another choice of q̃ changes c_q by a coboundary, so V(q) is well defined up to isomorphism of extensions. (iii) V(q) ≅ V(q^a) as representations for every integer a ≠ 0. (iv) V(q) is split iff q is a root of unity. (v) The classes δ(q), q ∈ K^×, span H^1(K, Q_p(1)) ≅ Q_p ⊗ K̂^× (K̂^× the p-adic completion) over Q_p, and q ↦ (v_p(q), log_K(q)) induces an isomorphism Q_p ⊗ K̂^× ≅ Q_p ⊕ K.

*Hypotheses.* Continuous cohomology with Z_p(1) and Q_p(1) coefficients and the Kummer isomorphism are requested from ArithmeticGaloisDuality R02.1; the construction itself uses only the explicit cocycle.

*API.*

- `CompatibleRoots` (*structure*) — A compatible system of p-power roots of q in a field L: root : ℕ → L with root 0 = q and root (n+1) ^ p = root n.
- `KummerCocycle` (*structure*) — For χ : G →* ℤ_[p]ˣ, a map c : G → ℤ_[p] with c (g * h) = c g + χ g * c h.
- `KummerCocycle.IsCoboundary` (*other*) — ∃ b, ∀ g, c g = (χ g − 1) * b.
- `kummerCocycleOf` (*constructor*) — The cocycle c_q attached to q and a compatible system of p-power roots, for L with all p-power roots of unity and χ = cyclotomicCharacter L p.
- `kummerRep` (*data*) — The representation G →* Matrix (Fin 2) (Fin 2) ℚ_[p], g ↦ !![χ g, c g; 0, 1] in the basis (e, f).
- `kummerRep_apply` (*simp*) — kummerRep c g = !![χ g, c g; 0, 1].
- `kummerCocycleOf_pow` (*functoriality*) — c_{q^a} = a • c_q for the system (q^{(n)})^a, a ∈ ℕ.

*Used by.*

- `PadicHodgeTheory:R06.6/kummer-representations-semistable` — D_st(V(q)) is computed from the periods t and λ_st(q̃).
- `PadicHodgeTheory:R06.6/tate-curve-tate-module` — T_p(E_q) ≅ T(q) through Tate's uniformisation.
- `PadicHodgeTheory:R06.6/tate-curve-l-invariant` — the L-invariant classifies the non-crystalline V(q) up to isomorphism.
- `PadicHodgeTheory:R06.4/ordinary-implies-semistable` — acceptance item "Kummer extensions 0 → Q_p(1) → V → Q_p → 0".
- Berger survey II.4.4 — every extension of Q_p by Q_p(1) is a Kummer extension.

*Unit tests.* A wrong definition fails one of these.

- `kummerRep_one` (degenerate) — kummerRep c 1 = 1 (the cocycle identity forces c 1 = 0).
- `kummerRep_zero` (degenerate) — For the zero cocycle, kummerRep 0 g = diag(χ g, 1): the split extension Q_p(1) ⊕ Q_p.
- `kummerRep_sub` (compatibility) — The (0,0) entry of kummerRep c g is χ g and the (1,0) entry is 0: e spans Q_p(1) with Mathlib's cyclotomicCharacter.
- `kummerCocycleOf_root_of_unity` (value) — For q a root of unity of p-power order, kummerCocycleOf q is a coboundary.
- `kummerCocycleOf_p_not_isCoboundary` (non-example) — For L an algebraic closure of ℚ_p and q = p, the cocycle is not a coboundary: V(p) does not split.

*Construction.*

1. c_q(g) mod p^n is well defined: g(q^{(n)})/q^{(n)} is a p^n-th root of unity, and the compatibility of q̃ and ε under p-th powers makes the residues compatible, so c_q(g) ∈ Z_p = lim Z/p^n.
2. Cocycle: gh(q^{(n)}) = g(q^{(n)}(ε^{(n)})^{c_q(h)}) = q^{(n)}(ε^{(n)})^{c_q(g) + χ(g)c_q(h)}. Continuity: c_q mod p^n factors through Gal(K(ε^{(n)}, q^{(n)})/K).
3. (ii): replacing q̃ by q̃·ε^b (b ∈ Z_p) changes c_q by g ↦ (χ(g) − 1)b; f ↦ f + be identifies the two modules.
4. (iii): with the system (q^{(n)})^a one has c_{q^a} = a c_q, and e ↦ ae, f ↦ f is a G_K-isomorphism V(q) → V(q^a).
5. (i), (iv), (v): Kummer theory (R02.1 request): the connecting map of 0 → μ_{p^n} → K̄^× → K̄^× → 0 sends q to the class of g ↦ g(q^{(n)})/q^{(n)}, i.e. c_q mod p^n; on Q_p ⊗ K^× its kernel is the image of the roots of unity; K^× = π_K^Z × μ(K) × (1 + m_K) with 1 + m_K a Z_p-module, so every element of Q_p ⊗ K̂^× is p^{−n}(a ⊗ π_K) + p^{−n} ⊗ u with u ∈ 1 + m_K, and log: Q_p ⊗ (1 + m_K) ≅ K (Brinon–Conrad Lemma 8.3.9, proof).

*Acceptance.*

- q = p, K = Q_p: T(p) is the Tate module of the Tate curve E_p (PadicHodgeTheory:R06.6/tate-curve-tate-module).
- q a root of unity: c_q is a coboundary and V(q) ≅ Q_p(1) ⊕ Q_p.
- q = 1 + p, K = Q_p, p odd: V(q) is the non-split crystalline extension of Brinon–Conrad Example 9.2.8.

*Uses.* `mathlib:cyclotomicCharacter`, `ArithmeticGaloisDuality:R02.1`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Example 9.2.8, p. 142: “This is exactly the extension class in H1 (GK , Qp (1)) arising from u, and its isomorphism” The matrix (χ η_u; 0 1) realises the Kummer class of u.
- CMI Summer School notes on p-adic Hodge theory, Proof of Lemma 8.3.9, p. 125: “Kummer theory provides a concrete description of H1 (GK , Qp (1)) for any p-adic field” H^1(K, Q_p(1)) = Q_p ⊗ K̂^×, an extension of Q_p by Q_p ⊗ (1 + m_K) ≅ K.
- An introduction to the theory of p-adic representations, II.4.4, p. 18: “described by Kummer theory” All extensions of Q_p by Q_p(1) come from Kummer theory.

#### Definition. The L-invariant of a semistable non-crystalline extension of Q_p by Q_p(1)

*Module* `TauCeti/PadicHodge/Geometric/TateCurve.lean`. *Node* `PadicHodgeTheory:R06.6/tate-curve-l-invariant`.

Throughout: K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], K̄ an algebraic closure, G_K = Gal(K̄/K), χ the p-adic cyclotomic character, v_p the valuation with v_p(p) = 1 and log_K the Iwasawa logarithm on K̄^× (log_K(p) = 0, PadicHodgeTheory:R06.1/log-extension-to-kbar). Period functors are covariant, D_B(V) = (B ⊗_{Q_p} V)^{G_K}, N = −d/du on B_st (PadicHodgeTheory:R06.1/semistable-period-ring), and Hodge–Tate weights follow HT(χ) = +1 (weights are the negatives of the jumps of D_dR). Call D ∈ MF^{φ,N,wa}_K of Tate type if dim_{K_0} D = 2, N ≠ 0, the filtration jumps are −1 and 0, and D^{φ=1} contains an element y with N(y) ≠ 0; by Colmez–Fontaine and PadicHodgeTheory:R06.6/kummer-representations-semistable these are the D_st(V) of the non-crystalline extensions V of Q_p by Q_p(1). The L-invariant L(D) ∈ K is the unique element with y + L(D)·N(y) ∈ Fil^0 D_K for y ∈ D^{φ=1} ∖ {0}. It does not depend on y (D^{φ=1} is a Q_p-line and y ↦ ay scales N(y) by a), and it exists because Fil^0 D_K ≠ K·N(y) by weak admissibility. For V = V(q) with v_p(q) ≠ 0: L(V) := L(D_st(V)) = log_K(q)/v_p(q); in particular the Tate curve has L(E_q) = log_K(q)/v_p(q), which for K = Q_p is log_p(q)/ord_p(q). Classification: for v_p(q), v_p(q′) ≠ 0, V(q) ≅ V(q′) iff L(q) = L(q′); E_q and its isogenous curve E_{q^n} have the same L.

*Hypotheses.* The name follows Mazur–Tate–Teitelbaum's invariant log_p(q)/ord_p(q) (not read here). Berger calls log_p(q/p^{v_p(q)}) itself the ℓ-invariant of V and Brinon–Conrad give c_q = −λ(q); neither is an isomorphism invariant (sourceIssues PadicHodgeTheory/E44 and PadicHodgeTheory/E46); both are corrected here.

*API.*

- `TateTypeModule` (*structure*) — Normal form over ℚ_[p] (K = Q_p): v ∈ ℚ, v ≠ 0 (the value v_p(q)) and ℓ ∈ ℚ_[p] (the value log_p(q)), with φ = diag(p^{−1}, 1), N = !![0, v; 0, 0] and Fil^0 spanned by (ℓ, 1) in the basis (x, y).
- `TateTypeModule.phi` (*data*) — The matrix of φ, !![p⁻¹, 0; 0, 1].
- `TateTypeModule.mono` (*data*) — The matrix of N, !![0, v; 0, 0].
- `TateTypeModule.mono_phi` (*relation*) — mono * phi = p • (phi * mono), i.e. Nφ = pφN.
- `TateTypeModule.lInvariant` (*data*) — L := ℓ / v.
- `TateTypeModule.ofKummer` (*constructor*) — The module D_q from (v_p(q), log_p(q)).
- `TateTypeModule.Iso` (*other*) — Isomorphism of the normal forms: a pair of nonzero scalars (α, β) with x ↦ αx, y ↦ βy carrying N and Fil^0 to N′ and Fil^0′.
- `TateTypeModule.iso_iff_lInvariant` (*characterisation*) — Iso D D′ ↔ D.lInvariant = D′.lInvariant.

*Used by.*

- `GrossZagierAndArithmeticHeights:GZ.9` — the Tate-period/L-invariant term of the multiplicative exceptional-zero formula.
- `PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module` — the filtration line of D_q is y + L·N(y).
- Brinon–Conrad Proposition 8.3.8 — classification of two-dimensional semistable non-crystalline representations of G_{Q_p} by c.

*Unit tests.* A wrong definition fails one of these.

- `TateTypeModule.lInvariant_ofKummer_p` (degenerate) — For q = p (v = 1, ℓ = 0) the L-invariant is 0.
- `TateTypeModule.lInvariant_pow` (compatibility) — Replacing (v, ℓ) by (n v, n ℓ) (the curve E_{q^n}) leaves L unchanged.
- `TateTypeModule.lInvariant_11a1` (value) — For 11a1 at 11, v = 5 and L ≡ 11·10225 mod 11^5 (needs the 11-adic logarithm).
- `TateTypeModule.not_wa_of_fil_eq_ker` (non-example) — The module with Fil^0 = ker N = span(x) is not weakly admissible: t_H(span x) = 0 > −1 = t_N(span x).
- `TateTypeModule.ell_not_invariant` (non-example) — ℓ alone is not an isomorphism invariant: (v, ℓ) and (2v, 2ℓ) are isomorphic but have different ℓ when ℓ ≠ 0.

*Construction.*

1. In D_st(V(q)) take y as in PadicHodgeTheory:R06.6/kummer-representations-semistable: φ(y) = y, N(y) = v_p(q)x and Fil^0 = K(y + log_K(q)x) = K(y + (log_K(q)/v_p(q))N(y)).
2. Independence of y: D^{φ=1} = Q_p y (φ is σ-semilinear, (K_0)^{σ=1} = Q_p), and replacing y by ay replaces N(y) by aN(y).
3. Existence: if Fil^0 D_K = K·N(y) then the subobject K_0N(y) = ker N has t_H = 0 > −1 = t_N, contradicting weak admissibility (PadicHodgeTheory:R06.2/weak-admissibility; Brinon–Conrad p. 124).
4. Classification: V(q) ≅ V(q′) iff δ(q′) ∈ Q_p^× δ(q) (a non-split extension of Q_p by Q_p(1) determines its class up to Q_p^×) iff (v_p(q′), log_K(q′)) is proportional to (v_p(q), log_K(q)) (PadicHodgeTheory:R06.6/kummer-representation (v)) iff L(q) = L(q′). Equivalently D_st is fully faithful (PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful) and Tate-type modules are isomorphic iff their L agree (scale x, y).
5. E_q → E_{q^n}, induced by x ↦ x^n on K̄^×, is an isogeny, and L(q^n) = n log_K(q)/(n v_p(q)) = L(q).

*Acceptance.*

- 11a1 at p = 11: v_11(q) = 5, v_11(L) = 1 and L ≡ 11·10225 mod 11^5 (computed from the q-expansion of j and log_11(u) = log_11(u^{10})/10 for the unit part u).
- q = p: L = 0 (log_p(p) = 0).

*Uses.* `PadicHodgeTheory:R06.6/kummer-representations-semistable`, `PadicHodgeTheory:R06.6/kummer-representation`, `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`, `PadicHodgeTheory:R06.2/colmez-fontaine-theorem`, `ArithmeticGaloisDuality:R02.1`.

*Planet:* L-invariant of the Tate curve.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, Proof of Proposition 8.3.8, p. 124: “Thus, c is intrinsic to D.” The line Fil = Q_p(ce_1 + e_2) with e_1 = N(e_2) defines a parameter c intrinsic to D; up to sign and duality it is L(D).
- CMI Summer School notes on p-adic Hodge theory, §8.3, end, p. 126: “one finds that cq = −λ(q)” Brinon–Conrad's value for the Tate curve, missing the factor 1/ord_p(q) (sourceIssue PadicHodgeTheory/E46).
- An introduction to the theory of p-adic representations, II.4.3, p. 18: “is canonically attached to V and is” Berger's "ℓ-invariant", corrected to log_p(q)/v_p(q) (sourceIssue PadicHodgeTheory/E44).

### Theorems, comparisons and applications

#### Theorem. Extensions of Q_p by Q_p(1) are semistable, with an explicit filtered (φ,N)-module

*Node* `PadicHodgeTheory:R06.6/kummer-representations-semistable`.

Throughout: K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], K̄ an algebraic closure, G_K = Gal(K̄/K), χ the p-adic cyclotomic character, v_p the valuation with v_p(p) = 1 and log_K the Iwasawa logarithm on K̄^× (log_K(p) = 0, PadicHodgeTheory:R06.1/log-extension-to-kbar). Period functors are covariant, D_B(V) = (B ⊗_{Q_p} V)^{G_K}, N = −d/du on B_st (PadicHodgeTheory:R06.1/semistable-period-ring), and Hodge–Tate weights follow HT(χ) = +1 (weights are the negatives of the jumps of D_dR). Let q ∈ K^× and V = V(q) (PadicHodgeTheory:R06.6/kummer-representation). (a) V is semistable: with u_q := λ_st(q̃) ∈ B_st^+ (so g(u_q) = u_q + c_q(g)t, φ(u_q) = pu_q, N(u_q) = −v_p(q)), the elements x = t^{−1} ⊗ e and y = −u_q t^{−1} ⊗ e + 1 ⊗ f form a K_0-basis of D_st(V) with φ(x) = p^{−1}x, φ(y) = y, N(x) = 0, N(y) = v_p(q)x. (b) In D_dR(V) = K ⊗_{K_0} D_st(V) (embedding with log_K(p) = 0): Fil^{−1} = D_dR(V), Fil^0 = K(y + log_K(q)x), Fil^1 = 0; so V has Hodge–Tate weights 0 and 1 and t_H = t_N = −1. (c) V is crystalline iff v_p(q) = 0, and then D_cris(V) = D_st(V). (d) Every extension of Q_p by Q_p(1) is semistable, and the crystalline classes form the Q_p-hyperplane Q_p ⊗ Ô_K^× (≅ K via log) of H^1(K, Q_p(1)) ≅ Q_p ⊗ K̂^×, which has dimension [K : Q_p] + 1.

*Hypotheses.* For K = Q_p this is Berger's computation (survey II.4.3–II.4.4); for ramified K the same formulas hold with v_p(q) ∈ (1/e)Z and λ_st of PadicHodgeTheory:R06.1/semistable-period-ring in place of Berger's log[q̃] = v_p(q)Y + log[q̃/p̃^{v_p(q)}]. Brinon–Conrad's monodromy operator is −N; with their N the sign of N(y) changes.

*Proof outline.*

1. Invariance: g(x) = χ(g)^{−1}t^{−1} ⊗ χ(g)e = x and g(y) = −(u_q + c_q(g)t)χ(g)^{−1}t^{−1} ⊗ χ(g)e + 1 ⊗ (f + c_q(g)e) = y (Berger II.4.3).
2. x and y are B_st-linearly independent (triangular coordinates), so dim_{K_0} D_st(V) ≥ 2 = dim V; B_st is regular (PadicHodgeTheory:R06.2/period-rings-are-regular), so V is semistable and x, y is a basis (PadicHodgeTheory:R06.2/admissibility-dimension-bound).
3. φ(t) = pt and φ(u_q) = pu_q give φ(x) = p^{−1}x and φ(y) = y; N(t) = 0 and N(u_q) = −v_p(q) give N(y) = v_p(q)x.
4. Filtration: ι(u_q) = log_dR([q̃]/q) + log_K(q) with [q̃]/q ≡ 1 mod ker θ (PadicHodgeTheory:R06.1/bst-embedding-into-bdr), so ι(u_q) − log_K(q) ∈ tB_dR^+ and y + log_K(q)x = −(ι(u_q) − log_K(q))t^{−1} ⊗ e + 1 ⊗ f ∈ B_dR^+ ⊗ V. x ∉ Fil^0 since t^{−1} ∉ B_dR^+, and y + log_K(q)x ∉ Fil^1 since its f-coordinate is 1 ∉ tB_dR^+.
5. (c): D_cris(V) = D_st(V)^{N=0} (PadicHodgeTheory:R06.2/crystalline-semistable-de-rham-implications) is K_0x when v_p(q) ≠ 0; when q ∈ O_K^×, u_q = λ(q̃) lies in B_cris^+ (PadicHodgeTheory:R06.1/crystalline-logarithm).
6. (d): semistable representations are closed under direct sums and subquotients (PadicHodgeTheory:R06.2/admissible-category-tannakian); a Baer sum of extensions is a subquotient of their direct sum, and the δ(q) span H^1(K, Q_p(1)) (PadicHodgeTheory:R06.6/kummer-representation (v)). The crystalline classes are those of units by (c) (Brinon–Conrad Lemma 8.3.9).

*Acceptance.*

- q = p, K = Q_p: φ = diag(p^{−1}, 1), N(y) = x, Fil^0 = Q_p y (log_p(p) = 0).
- q = 1 + p, K = Q_p, p odd: crystalline, Fil^0 = Q_p(y + log_p(1 + p)x) with v_p(log_p(1 + p)) = 1.
- Non-example: a non-split extension of Q_p(1) by Q_p (the opposite order) is not de Rham (Brinon–Conrad Example 6.3.5, recorded under PadicHodgeTheory:R06.2), so (d) does not extend to it.

*Uses.* `PadicHodgeTheory:R06.6/kummer-representation`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.1/crystalline-logarithm`, `PadicHodgeTheory:R06.1/bst-embedding-into-bdr`, `PadicHodgeTheory:R06.1/log-extension-to-kbar`, `PadicHodgeTheory:R06.1/fontaine-element-t`, `PadicHodgeTheory:R06.2/period-functors`, `PadicHodgeTheory:R06.2/admissibility-dimension-bound`, `PadicHodgeTheory:R06.2/period-rings-are-regular`, `PadicHodgeTheory:R06.2/crystalline-semistable-de-rham-implications`, `PadicHodgeTheory:R06.2/admissible-category-tannakian`, `ArithmeticGaloisDuality:R02.1`.

*Planet:* Kummer extensions are semistable.

*Sources.*

- An introduction to the theory of p-adic representations, II.4.4, p. 19: “It is now easy to show that every extension of Qp by Qp (1) is semi-stable” Statement (d), with the basis x, y, φ and Fil^0 = F(y + log_p(q)x) for K = F unramified.
- An introduction to the theory of p-adic representations, II.4.3, p. 18: “the action of Frobenius on Dst (V ) is therefore given by” φ(x) = p^{−1}x and φ(y) = y.
- CMI Summer School notes on p-adic Hodge theory, Lemma 8.3.9, p. 125: “a semistable GK -representation and there is a Qp -hyperplane consisting of the crystalline” Statement (d) for any p-adic field K.

#### Theorem. The Tate module of the Tate curve is the Kummer lattice of q

*Node* `PadicHodgeTheory:R06.6/tate-curve-tate-module`.

Throughout: K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], K̄ an algebraic closure, G_K = Gal(K̄/K), χ the p-adic cyclotomic character, v_p the valuation with v_p(p) = 1 and log_K the Iwasawa logarithm on K̄^× (log_K(p) = 0, PadicHodgeTheory:R06.1/log-extension-to-kbar). Period functors are covariant, D_B(V) = (B ⊗_{Q_p} V)^{G_K}, N = −d/du on B_st (PadicHodgeTheory:R06.1/semistable-period-ring), and Hodge–Tate weights follow HT(χ) = +1 (weights are the negatives of the jumps of D_dR). Let q ∈ K^× with 0 < |q| < 1 and E_q the Tate curve over K (y² + xy = x³ + a_4(q)x + a_6(q), split multiplicative reduction, j(E_q) = 1/q + 744 + 196884q + ⋯). Tate's G_K-equivariant uniformisation α: K̄^×/q^Z ≅ E_q(K̄) restricts to isomorphisms {x ∈ K̄^×/q^Z : x^{p^n} ∈ q^Z} ≅ E_q[p^n](K̄), whose source consists of the p^{2n} classes (ε^{(n)})^i(q^{(n)})^j, 0 ≤ i, j ≤ p^n − 1. In the limit, T_p(E_q) ≅ T(q) (PadicHodgeTheory:R06.6/kummer-representation), G_K-equivariantly, with lim α(ε^{(n)}) ↦ e and lim α(q^{(n)}) ↦ f; so 0 → Z_p(1) → T_p(E_q) → Z_p → 0 is exact with class δ(q), the sub Z_p(1) being the image of μ_{p^∞}.

*Hypotheses.* Tate's uniformisation and its Galois equivariance are the Tau Ceti EllipticCurves Layer 4 target (request); the Tate module as a G_K-module is ArithmeticGaloisRepresentations R01.6 (request).

*Proof outline.*

1. If x^{p^n} = q^m then x = (q^{(n)})^m ζ with ζ^{p^n} = 1, and modulo q^Z only m mod p^n matters; so the p^n-torsion of K̄^×/q^Z is free over Z/p^n on the classes of ε^{(n)} and q^{(n)}, with p^{2n} elements (Berger II.4.2, index range corrected: sourceIssue PadicHodgeTheory/E42).
2. α is G_K-equivariant, so g acts on α(ε^{(n)}) through χ(g) and on α(q^{(n)}) by q^{(n)} ↦ q^{(n)}(ε^{(n)})^{c_q(g)}.
3. α is a homomorphism, so p·α(q^{(n+1)}) = α(q^{(n)}) and p·α(ε^{(n+1)}) = α(ε^{(n)}); the two systems give a Z_p-basis of T_p(E_q) with the Galois action of T(q).

*Acceptance.*

- 11a1 at p = 11 (split multiplicative, a_11 = 1): the q ∈ Q_11 with j(E_q) = −122023936/161051 has v_11(q) = 5 = v_11(Δ) (inverting j = 1/q + 744 + 196884q + ⋯ in a script; j(q) agrees with j(E) to 11^60).
- p-torsion: E_q[p](K̄) ≅ (Z/p)² generated by α(ζ_p) and α(q^{1/p}).

*Uses.* `PadicHodgeTheory:R06.6/kummer-representation`, `ArithmeticGaloisRepresentations:R01.6`.

*Sources.*

- An introduction to the theory of p-adic representations, II.4.2, p. 17: “therefore form a basis of” ε^{(n)} and q^{(n)} give a basis of E_q[p^n] and of T_p(E_q), with g(f) = f + c(g)e.
- CMI Summer School notes on p-adic Hodge theory, Example 9.2.9, p. 143: “Vp (Eq ) is Bst -admissible” The Tate-curve representation realised inside B_st.

#### Theorem. The filtered (φ,N)-module of the Tate curve

*Node* `PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module`.

Throughout: K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], K̄ an algebraic closure, G_K = Gal(K̄/K), χ the p-adic cyclotomic character, v_p the valuation with v_p(p) = 1 and log_K the Iwasawa logarithm on K̄^× (log_K(p) = 0, PadicHodgeTheory:R06.1/log-extension-to-kbar). Period functors are covariant, D_B(V) = (B ⊗_{Q_p} V)^{G_K}, N = −d/du on B_st (PadicHodgeTheory:R06.1/semistable-period-ring), and Hodge–Tate weights follow HT(χ) = +1 (weights are the negatives of the jumps of D_dR). With q and E_q as in PadicHodgeTheory:R06.6/tate-curve-tate-module, V = V_p(E_q) is semistable and not crystalline, and D_st(V) ≅ D_q := K_0x ⊕ K_0y with φ(x) = p^{−1}x, φ(y) = y, N(x) = 0, N(y) = v_p(q)x, and on D_{q,K}: Fil^{−1} = D_{q,K}, Fil^0 = K(y + log_K(q)x), Fil^1 = 0. Consequently V has Hodge–Tate weights {0, 1}; D_q is weakly admissible with t_H = t_N = −1, its only nonzero proper subobject being K_0x = ker N; V is not potentially crystalline (N ≠ 0 on WD(V)), hence not potentially Barsotti–Tate although its weights are {0, 1}; V is ordinary with ordinary filtration Q_p(1) ⊂ V. For K = Q_p, D_q is the module that PadicHodgeTheory:R06.3/tate-curve-weil-deligne-example takes as given; this node discharges that hypothesis. V is the stage's example of a de Rham representation that is not crystalline.

*Hypotheses.* q ∈ K^× with 0 < |q| < 1, so v_p(q) > 0; log_K(p) = 0 fixes the filtration (another choice of log_K(p) ∈ K_0 moves the line by a K_0-multiple of x).

*Proof outline.*

1. T_p(E_q) ≅ T(q) (PadicHodgeTheory:R06.6/tate-curve-tate-module); apply PadicHodgeTheory:R06.6/kummer-representations-semistable (a)–(c) with v_p(q) > 0.
2. Weak admissibility: t_H(D_q) = −1 + 0 = −1 and t_N(D_q) = −1 + 0 = −1. A (φ, N)-stable line lies in ker N = K_0x (a φ-stable line through y + cx is not N-stable); t_H(K_0x) = −1 because Fil^0 is not K·x, and t_N(K_0x) = −1 (PadicHodgeTheory:R06.2/weak-admissibility).
3. Not potentially crystalline: N ≠ 0 on WD(V) (PadicHodgeTheory:R06.3/weil-deligne-descent (b)); hence not potentially Barsotti–Tate (PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion (b)).
4. Ordinary: the filtration Q_p(1) = V(1)-part ⊂ V with quotient Q_p (PadicHodgeTheory:R06.4/ordinary-representation).

*Acceptance.*

- 11a1 at p = 11: φ = diag(1/11, 1), N = (0 5; 0 0), Fil^0 = Q_11(y + log_11(q)x) with log_11(q) = 5L, L ≡ 11·10225 mod 11^5 (PadicHodgeTheory:R06.6/tate-curve-l-invariant).
- Weil–Deligne check (PadicHodgeTheory:R06.3/tate-curve-weil-deligne-example): r(Φ) = φ^{−1} = diag(11, 1) with characteristic polynomial (X − 11)(X − a_11), a_11 = 1.
- Non-example for "de Rham ⇒ crystalline": V_p(E_q) is de Rham, even semistable, but not crystalline.

*Uses.* `PadicHodgeTheory:R06.6/tate-curve-tate-module`, `PadicHodgeTheory:R06.6/kummer-representations-semistable`, `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.3/weil-deligne-descent`, `PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion`, `PadicHodgeTheory:R06.4/ordinary-representation`.

*Planet:* Filtered (φ,N)-module of the Tate curve.

*Sources.*

- An introduction to the theory of p-adic representations, II.4.3, p. 18: “This implies that V is semi-stable” D_dR(V) with basis x, y, Fil^0 = (y + log_p(q)x)F and semistability via u = v_p(q)Y + log[q̃/p̃^{v_p(q)}].
- An introduction to the theory of p-adic representations, II.4.3, p. 18: “the action of Frobenius on Dst (V ) is therefore given by” φ(x) = p^{−1}x, φ(y) = y.
- CMI Summer School notes on p-adic Hodge theory, Example 9.2.9, p. 143: “Vp (Eq ) is Bst -admissible” Semistability for general K.

#### Theorem. The p-adic criterion of good reduction: good reduction iff V_p(A) is crystalline

*Node* `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`.

Throughout: K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], K̄ an algebraic closure, G_K = Gal(K̄/K), χ the p-adic cyclotomic character, v_p the valuation with v_p(p) = 1 and log_K the Iwasawa logarithm on K̄^× (log_K(p) = 0, PadicHodgeTheory:R06.1/log-extension-to-kbar). Period functors are covariant, D_B(V) = (B ⊗_{Q_p} V)^{G_K}, N = −d/du on B_st (PadicHodgeTheory:R06.1/semistable-period-ring), and Hodge–Tate weights follow HT(χ) = +1 (weights are the negatives of the jumps of D_dR). Let A/K be an abelian variety of dimension g. (a) A has good reduction (it extends to an abelian scheme 𝒜 over O_K) iff V_p(A) is crystalline; then T_p(A) = T_p(𝒜[p^∞]), V_p(A) has Hodge–Tate weights 0 and 1 with multiplicity g, and D_cris(V_p(A)) is PadicHodgeTheory:R06.5/abelian-scheme-dcris. (b) A has potentially good reduction iff V_p(A) is potentially crystalline iff N = 0 on WD(V_p(A)). (c) For an elliptic curve E/K with minimal Weierstrass equation W over O_K: W.HasGoodReduction (Mathlib) iff V_p(E) is crystalline, and E has potentially good reduction (v(j(E)) ≥ 0) iff N = 0 on WD(V_p(E)). V_p(A) is never unramified for g ≥ 1 (weight 1 occurs), so unramifiedness, the ℓ ≠ p criterion of Néron–Ogg–Shafarevich (NeronModelsAndSemistableAbelianVarieties R11.5), is not the criterion at p.

*Hypotheses.* Grothendieck's criterion (A has good reduction iff A[p^∞] extends to a p-divisible group over O_K; SGA 7 IX Theorem 5.13 as quoted in Brinon–Conrad Theorem 7.1.13) is requested from NeronModelsAndSemistableAbelianVarieties R11.3. Coleman–Iovita state (a) (arXiv version, Introduction); their proof (Chapter II) is not in the arXiv version, and the proof here follows the route of Brinon–Conrad p. 84: Grothendieck's criterion plus Fontaine, Breuil and Kisin.

*Proof outline.*

1. (a) ⇒: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/abelian-scheme-torsion-finite-flat gives 𝒜[p^∞] over O_K of height 2g with T_p(A) = T_p(𝒜[p^∞]); for every p-divisible group G over O_K, T_p(G)[1/p] is crystalline with weights in {0, 1} (FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-01-is-bt); the multiplicities are dim 𝒜[p^∞] = g and the dimension of its Cartier dual 𝒜^∨[p^∞], also g (FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/hodge-tate-p-divisible).
2. (a) ⇐: V_p(A) has weights in {0, 1} (PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights); if it is crystalline, the lattice form of R07.4/crystalline-01-is-bt gives a p-divisible group G over O_K with T_p(G) ≅ T_p(A). Finite étale K-group schemes are Galois modules, so G_K ≅ A[p^∞]: A[p^∞] extends to O_K, and Grothendieck's criterion (R11.3 request) gives good reduction.
3. (b): potentially good reduction means good reduction over some finite L/K; by (a) over L this is crystallinity of V_p(A)|_{G_L}, and for de Rham V (PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights) potentially crystalline ⇔ N = 0 on WD(V) (PadicHodgeTheory:R06.3/weil-deligne-descent (b)).
4. (c): HasGoodReduction of a minimal equation says the minimal model is an elliptic curve over O_K (Mathlib hasGoodReduction_iff_isElliptic_reduction), i.e. an abelian scheme of relative dimension 1 (NeronModels R11.1 request); potentially good reduction ⇔ v(j) ≥ 0 is the EllipticCurves Layer 4 statement (request).

*Acceptance.*

- 11a1 at p = 3: good ordinary reduction, V_3(E) crystalline (PadicHodgeTheory:R06.5/elliptic-curve-ordinary-supersingular).
- 11a1 at p = 11: split multiplicative, V_11(E) semistable, not crystalline (PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module).
- Non-example: V_p(E) is ramified even for good reduction (its Hodge–Tate weight 1), unlike V_ℓ(E), ℓ ≠ p.

*Uses.* `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6/abelian-scheme-torsion-finite-flat`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/crystalline-01-is-bt`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/hodge-tate-p-divisible`, `PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.3/weil-deligne-descent`, `PadicHodgeTheory:R06.2/admissible-representations`, `NeronModelsAndSemistableAbelianVarieties:R11.3`, `NeronModelsAndSemistableAbelianVarieties:R11.1`, `ArithmeticGaloisRepresentations:R01.6`, `mathlib:WeierstrassCurve.HasGoodReduction`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`.

*Planet:* p-adic criterion of good reduction.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §7.1, p. 84: “a necessary and sufficient condition for A to” Good reduction iff V_p(A) is crystalline, via Grothendieck's criterion and the work of Fontaine, Breuil and Kisin.
- CMI Summer School notes on p-adic Hodge theory, Theorem 7.1.13, p. 90: “Then A has good reduction if and only if A[ℓn ] admits an integral model Gn for” Grothendieck's criterion, including ℓ = p.
- The Frobenius and monodromy operators for curves and abelian varieties, Introduction, p. 3 (arXiv v1): “crystalline if and only if A has good reduction.” Statement (a).

#### Theorem. Abelian varieties with semistable reduction have semistable Tate modules

*Node* `PadicHodgeTheory:R06.6/semistable-reduction-semistable`.

Throughout: K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], K̄ an algebraic closure, G_K = Gal(K̄/K), χ the p-adic cyclotomic character, v_p the valuation with v_p(p) = 1 and log_K the Iwasawa logarithm on K̄^× (log_K(p) = 0, PadicHodgeTheory:R06.1/log-extension-to-kbar). Period functors are covariant, D_B(V) = (B ⊗_{Q_p} V)^{G_K}, N = −d/du on B_st (PadicHodgeTheory:R06.1/semistable-period-ring), and Hodge–Tate weights follow HT(χ) = +1 (weights are the negatives of the jumps of D_dR). Let A/K be an abelian variety with semistable reduction (the identity component of the special fibre of its Néron model is an extension of an abelian variety by a torus). Then V_p(A) is semistable, and N = 0 on D_st(V_p(A)) iff A has good reduction. Explicitly, Raynaud's uniformisation A^an = G^an/Γ, with 0 → T → G → B → 0 (T a torus of rank r split by an unramified extension, B an abelian variety with good reduction, Γ ≅ Z^r a lattice with unramified G_K-action), gives a G_K-stable filtration 0 ⊆ V_t ⊆ V_f ⊆ V_p(A) with V_t ≅ V_p(T) (an unramified twist of Q_p(1)^r), V_f/V_t ≅ V_p(B) and V_p(A)/V_f ≅ Γ ⊗ Q_p (unramified), all graded pieces crystalline. Since every abelian variety acquires semistable reduction over a finite extension, V_p(A) is potentially semistable in general.

*Hypotheses.* Raynaud's uniformisation and Grothendieck's semistable reduction theorem are requested from NeronModelsAndSemistableAbelianVarieties R11.3. That N has rank r (Grothendieck's monodromy pairing; Coleman–Iovita identify Fontaine's N with it) belongs to NeronModelsAndSemistableAbelianVarieties R11.4–R11.5 and is not claimed here.

*Proof outline.*

1. V_p(A) is de Rham (PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights).
2. The graded pieces are crystalline: unramified twists of Q_p(1)^r and unramified representations by PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified; V_p(B) by PadicHodgeTheory:R06.6/good-reduction-iff-crystalline (a).
3. V_f is de Rham, as a subrepresentation of a de Rham representation (PadicHodgeTheory:R06.2/admissible-category-tannakian), and an extension of V_p(B) by V_t, so it is semistable by PadicHodgeTheory:R06.4/ordinary-implies-semistable (a); V_p(A) is a de Rham extension of V_p(A)/V_f by V_f, hence semistable by the same theorem.
4. N = 0 iff V_p(A) is crystalline (D_cris = D_st^{N=0}, PadicHodgeTheory:R06.2/crystalline-semistable-de-rham-implications) iff A has good reduction (PadicHodgeTheory:R06.6/good-reduction-iff-crystalline (a)).
5. Potential semistability: semistable reduction over a finite L/K (R11.3 request) and the above over L.

*Acceptance.*

- Elliptic curves: r = 1 for multiplicative reduction, B = 0, V_t = Q_p(1) up to the unramified quadratic twist (PadicHodgeTheory:R06.6/multiplicative-reduction-elliptic-curves).
- A = E × E′ with E of good reduction and E′ split multiplicative: D_st(V_p(A)) = D_cris(V_p(E)) ⊕ D_{q′} and N has rank 1.

*Uses.* `PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.4/ordinary-implies-semistable`, `PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`, `PadicHodgeTheory:R06.2/admissible-category-tannakian`, `PadicHodgeTheory:R06.2/crystalline-semistable-de-rham-implications`, `NeronModelsAndSemistableAbelianVarieties:R11.3`.

*Planet:* Semistable reduction and semistable Tate modules.

*Sources.*

- The Frobenius and monodromy operators for curves and abelian varieties, Introduction, p. 1 (arXiv v1): “Suppose for example that A is an Abelian variety with split semi-stable” The p-adic uniformisation cross T → G → B, Γ → G → A used to describe D_st(V(A)).
- The Frobenius and monodromy operators for curves and abelian varieties, Introduction, p. 2 (arXiv v1): “nius Monodromy module Dst (V (A))∗ provided by Fontaine’s theory, where” D_st(V(A)) for split semistable A is compared with the Hyodo–Kato structure of H^1_dR(A).
- An introduction to the theory of p-adic representations, II.5.1, p. 19: “they were potentially semi-stable” Fontaine: Tate modules of abelian varieties are potentially semistable.

#### Theorem. Elliptic curves with potentially multiplicative reduction

*Node* `PadicHodgeTheory:R06.6/multiplicative-reduction-elliptic-curves`.

Throughout: K/Q_p is finite with residue field k = F_{p^f}, K_0 = W(k)[1/p], K̄ an algebraic closure, G_K = Gal(K̄/K), χ the p-adic cyclotomic character, v_p the valuation with v_p(p) = 1 and log_K the Iwasawa logarithm on K̄^× (log_K(p) = 0, PadicHodgeTheory:R06.1/log-extension-to-kbar). Period functors are covariant, D_B(V) = (B ⊗_{Q_p} V)^{G_K}, N = −d/du on B_st (PadicHodgeTheory:R06.1/semistable-period-ring), and Hodge–Tate weights follow HT(χ) = +1 (weights are the negatives of the jumps of D_dR). Let E/K be an elliptic curve with v(j(E)) < 0 and W a minimal Weierstrass equation over O_K; let q ∈ K^× be the unique element with 0 < |q| < 1 and j(E_q) = j(E). (a) If W.HasSplitMultiplicativeReduction (Mathlib), E ≅ E_q over K, V_p(E) ≅ V(q) and D_st(V_p(E)) ≅ D_q (PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module). (b) If W.HasMultiplicativeReduction but not split, E is the twist of E_q by the unramified quadratic character η of G_K, V_p(E) ≅ V(q) ⊗ η is semistable and not crystalline, and D_st(V_p(E)) ≅ D_q ⊗ D_cris(η); for K = Q_p: φ(x) = −p^{−1}x, φ(y) = −y, N(y) = v_p(q)x, same filtration. (c) If W has additive reduction, E is the twist of E_q by a ramified quadratic character ψ, and V_p(E) ≅ V(q) ⊗ ψ is potentially semistable, not semistable, with WD(V_p(E)) ≅ WD(V(q)) ⊗ rec(ψ) (inertia acting through ψ, N ≠ 0). In all three cases V_p(E) is not potentially crystalline.

*Hypotheses.* Tate's theorem and the twist description (for v(j) < 0: E ≅ E_q over K iff split multiplicative; otherwise the quadratic twist by a character that is unramified iff the reduction is multiplicative) are requested from the Tau Ceti EllipticCurves Layer 4 (Tate curve, ATAEC V); Silverman's text is not read here.

*Proof outline.*

1. Tate's theorem (EllipticCurves Layer 4 request) gives the unique q and the twist; V_p of a quadratic twist by γ is V_p ⊗ γ.
2. (a): PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module.
3. (b): D_st is a tensor functor (PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful); D_cris(η) = K_0e with φe = λe, λ = −1 for K = Q_p (PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified (3)); a semistable representation tensored with a crystalline one is semistable; N is unchanged, so V is not crystalline.
4. (c): ψ is trivial on G_L for the quadratic extension L it cuts out, so V|_{G_L} ≅ V(q)|_{G_L} is semistable (PadicHodgeTheory:R06.2/crystalline-semistable-base-change); V is not semistable because WD(V)|_{I_K} contains ψ|_{I_K} ≠ 1 (PadicHodgeTheory:R06.3/weil-deligne-descent (b)).
5. Twisting by a character does not change N ≠ 0, so no case is potentially crystalline (R06.3/weil-deligne-descent (b)).

*Acceptance.*

- 11a1 at p = 11: a_11 = 1, split; case (a) with v_11(q) = 5.
- 15a1 at p = 3: a_3 = −1, non-split (point count by script); case (b): φ = −diag(1/3, 1), N = (0 4; 0 0), v_3(q) = v_3(Δ) = 4 (Δ(15a1) = 15^4).
- 15a1 at p = 5: a_5 = 1, split; case (a).
- Case (c): the twist of 11a1 by the quadratic character of Q_11(√−11) has additive reduction at 11 and v_11(j) < 0.

*Uses.* `PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module`, `PadicHodgeTheory:R06.6/kummer-representation`, `ArithmeticGaloisRepresentations:R01.6`, `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`, `PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`, `PadicHodgeTheory:R06.2/crystalline-semistable-base-change`, `PadicHodgeTheory:R06.3/weil-deligne-descent`, `mathlib:WeierstrassCurve.HasSplitMultiplicativeReduction`, `mathlib:WeierstrassCurve.HasMultiplicativeReduction`.

*Sources.*

- An introduction to the theory of p-adic representations, II.4.1, p. 17: “then there exists q such that E is isomorphic to Eq over F” Stated for all bad semistable reduction; true only for split multiplicative reduction (sourceIssue PadicHodgeTheory/E43); case (b) is the correction.

#### Theorem. p-adic local–global compatibility for abelian varieties at places of good reduction

*Node* `PadicHodgeTheory:R06.6/local-global-compatibility-good-reduction`.

Let F be a number field, A/F an abelian variety of dimension g, v a place of F above p at which A has good reduction A_v over k_v = F_{q_v} (q_v = p^{f_v}), and ℓ ≠ p. Let P_v(X) = det(X − Frob_v | V_ℓ(A)) for an arithmetic Frobenius Frob_v; it lies in Z[X], is independent of ℓ ≠ p and is the characteristic polynomial of the Frobenius endomorphism of A_v. Then V_p(A)|_{G_{F_v}} is crystalline and: (a) the K_0-linear map φ^{f_v} on D_cris(H^1_et(A_{F̄_v}, Q_p)) ≅ H^1_cris(A_v/W(k_v))[1/p] has characteristic polynomial P_v(X); (b) WD(V_p(A)|_{G_{F_v}}) is unramified with N = 0 and arithmetic Frobenius of characteristic polynomial P_v(X), so WD(V_p(A)|_{G_{F_v}})^{F-ss} ≅ WD(V_ℓ(A)|_{G_{F_v}})^{F-ss} after any field isomorphism Q̄_p ≅ Q̄_ℓ; (c) for an elliptic curve with multiplicative reduction at v the p-adic and ℓ-adic Weil–Deligne representations agree as well, with N ≠ 0. These are the coefficient-prime inputs consumed by AutomorphicGaloisRepresentations R19.5 and by the local-factor comparisons of NeronModelsAndSemistableAbelianVarieties R11.5.

*Hypotheses.* Nothing here determines the Weil–Deligne parameter at a place above the coefficient prime for a general (almost strictly) compatible system without the extra hypothesis of the source; the node is about Tate modules of abelian varieties. ℓ-adic inputs (unramifiedness at good places, P_v, smooth proper base change) are requested from ArithmeticGaloisRepresentations R01.6.

*Proof outline.*

1. Crystalline: PadicHodgeTheory:R06.6/good-reduction-iff-crystalline (a) over F_v.
2. (a): D_cris(H^1) ≅ H^1_cris(A_v/W(k_v))[1/p] (PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction); Katz–Messing (PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective) gives det(1 − tφ^{f_v} | H^1_cris ⊗ K_0) = det(1 − t·Frob_geom | H^1_et(A_{v,k̄_v}, Q_ℓ)); smooth proper base change identifies the latter with H^1_et(A_{F̄_v}, Q_ℓ) = V_ℓ(A)^∨, on which geometric Frobenius has the eigenvalues of arithmetic Frobenius on V_ℓ(A) (R01.6 request).
3. (b): for crystalline V, Fontaine's recipe (PadicHodgeTheory:R06.3/weil-deligne-parameter, PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor) gives WD(V) = D_cris(V) with N = 0, trivial inertia and arithmetic Frobenius the linearisation of φ^{−f}; on D_cris(V_p(A)) = D_cris(H^1)^∨ (PadicHodgeTheory:R06.5/abelian-scheme-dcris) its eigenvalues are those of φ^f on D_cris(H^1), the roots of P_v. V_ℓ(A) is unramified at v with the same characteristic polynomial, so the Frobenius-semisimplifications agree.
4. (c): split case by PadicHodgeTheory:R06.3/tate-curve-weil-deligne-example with D_st(V_p(E)) ≅ D_q (PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module); non-split by twisting both sides by η (PadicHodgeTheory:R06.6/multiplicative-reduction-elliptic-curves (b)).

*Acceptance.*

- 11a1, v = 3: P_3 = X² + X + 3 (a_3 = −1); on D_cris(V_3(E)) the linear φ has characteristic polynomial X² + X/3 + 1/3, and the arithmetic Frobenius of WD has X² + X + 3.
- 11a1 at 11 (multiplicative): characteristic polynomial (X − 11)(X − 1) on both sides (PadicHodgeTheory:R06.3/tate-curve-weil-deligne-example).

*Uses.* `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.5/abelian-scheme-dcris`, `PadicDifferentialEquationsAndRigidCohomology:RD.7/ell-adic-comparison-smooth-projective`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/fontaine-weil-deligne-functor`, `PadicHodgeTheory:R06.3/tate-curve-weil-deligne-example`, `PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module`, `PadicHodgeTheory:R06.6/multiplicative-reduction-elliptic-curves`, `ArithmeticGaloisRepresentations:R01.6`.

*Sources.*

- CMI Summer School notes on p-adic Hodge theory, §7, p. 83: “The Néron-Ogg-Shafarevich criterion is extremely useful” The ℓ ≠ p side at good places (Néron–Ogg–Shafarevich) against which the p-adic side is compared.

#### Theorem. Local–global compatibility at p for modular forms (Scholl, Saito)

*Node* `PadicHodgeTheory:R06.6/modular-form-local-global-compatibility-at-p`.

Throughout: a newform g of weight k ≥ 2, level N and character ψ has coefficients in a number field K ⊂ C; λ is a place of K above the prime p, and M_g is the rank-two premotivic structure over K cut out of the parabolic cohomology of the modular curve with coefficients in Sym^{k−2} of the relative H^1 of the universal elliptic curve (equivalently of a Kuga–Sato variety) by the Hecke ideal of g, in the normalisation of Diamond–Flach–Guo (arXiv v2): ∧²M_g ≅ M_ψ(1 − k) and Frob_p denotes a geometric Frobenius. Its λ-adic realisation M_{g,λ} is the cohomological representation, and V_g := M_{g,λ}^∨ is the covariant one (det V_g = ψ^{−1}χ^{k−1}). Period functors are covariant and Hodge–Tate weights follow HT(χ) = +1. For every prime p and λ | p, M_{g,λ}|_{G_{Q_p}} is potentially semistable, and the Frobenius-semisimplification of its Weil–Deligne representation WD(M_{g,λ}|_{G_{Q_p}}) is K-rational and corresponds to π_p(g) under the local Langlands correspondence normalised as in Carayol. Hence the p-adic and ℓ-adic Frobenius-semisimple Weil–Deligne representations of g at p agree for every ℓ, and: (a) M_{g,λ}|_{G_{Q_p}} is crystalline iff π_p(g) is unramified (p ∤ N), recovering PadicHodgeTheory:R06.5/modular-form-crystalline-good-primes; (b) it is semistable iff π_p(g) has nonzero Iwahori-fixed vectors (an unramified principal series or an unramified twist of Steinberg), for instance p ∥ N with ψ unramified at p, where N ≠ 0; (c) it is potentially crystalline iff π_p(g) is not a twist of Steinberg; (d) the inertial type of M_{g,λ}|_{G_{Q_p}} is that of π_p(g).

*Hypotheses.* Scholl proved the case p ∤ N and T. Saito (Invent. Math. 129, 1997) the general case; Saito's 1997 paper is not public and is not read here. The statement is quoted from Diamond–Flach–Guo (arXiv v2, §5.5) and the proof outline follows Saito's Hilbert-modular paper, which uses the same method (PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p). This is a statement about newforms. It does not make an almost strictly compatible system strict, and it does not fix the Weil–Deligne parameter at the coefficient prime of a compatible system that is not known to come from a newform.

*Proof outline.*

1. Potential semistability: M_{g,λ} is a summand of the étale cohomology of a smooth proper Kuga–Sato variety, hence de Rham (PadicHodgeTheory:R06.5/modular-form-de-rham-realisation) and potentially semistable by the p-adic monodromy theorem (PadicHodgeTheory:R06.3/p-adic-monodromy-theorem).
2. Saito's method: over Z_p[ζ_{p^r}] the Kuga–Sato variety of full level p^r acquires a semistable model; Tsuji's C_st (CohomologyComparisons CP.4, request) identifies D_st with its log-crystalline (Hyodo–Kato) cohomology, and the Lefschetz trace formula, which has the same shape for log-crystalline and ℓ-adic cohomology, gives Tr WD_p(σ) = Tr WD_ℓ(σ) for σ in the positive part of the Weil group.
3. Monodromy: the weight spectral sequence (WeightsInEtaleCohomology R34.3, request) and the Weil conjectures show that the monodromy filtration is pure; with equal traces this forces N_p = 0 iff N_ℓ = 0, and then the Frobenius-semisimple representations agree (Saito's Lemma 1).
4. ℓ-adic side: Carayol's theorem (AutomorphicGaloisRepresentations R19.4, request) matches WD_ℓ with π_p(g) under local Langlands (GL2AutomorphicRepresentationsAndTransfer R16.3, request).
5. (a)–(c) from PadicHodgeTheory:R06.3/weil-deligne-descent (b): semistable iff inertia acts trivially on WD, crystalline iff moreover N = 0, potentially crystalline iff N = 0; π_p(g) has nonzero Iwahori-fixed vectors iff its parameter is unramified on inertia.

*Acceptance.*

- Δ at any p: π_p(Δ) is unramified, so V_Δ|_{G_{Q_p}} is crystalline for every p.
- 11a1 at 11 (weight two, p ∥ N): π_11 is Steinberg, WD has N ≠ 0: the Tate curve D_q (PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module).
- A newform with supercuspidal π_p: WD irreducible, inertia acts through a nonabelian finite quotient, V_g is potentially crystalline but not semistable.

*Uses.* `PadicHodgeTheory:R06.5/modular-form-de-rham-realisation`, `PadicHodgeTheory:R06.5/modular-form-crystalline-good-primes`, `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/weil-deligne-descent`, `CohomologyComparisons:CP.4`, `WeightsInEtaleCohomology:R34.3`, `AutomorphicGaloisRepresentations:R19.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `AutomorphicGaloisRepresentations:R19.1`.

*Planet:* Local–global compatibility at p for modular forms.

*Sources.*

- Adjoint motives of modular forms and the Tamagawa number conjecture, §5.5, p. 60 (arXiv v2): “This is due to Eichler, Shimura and Igusa for λ not dividing pNg , by Langlands, Deligne” D_pst(M_λ|G_p)^ss corresponds to π_p via local Langlands for all p and λ.
- Adjoint motives of modular forms and the Tamagawa number conjecture, §5.5, p. 60 (arXiv v2): “and Carayol [Ca0] for λ ∤ p, and by Scholl [Scho2] and Saito [Sai] in general.” Attribution: Scholl at good primes, Saito in general.
- Hilbert modular forms and p-adic Hodge theory, Abstract, p. 1 (arXiv v2): “as is shown for an elliptic” Saito's Hilbert paper refers to his 1997 paper for elliptic modular forms.

#### Theorem. Saito's theorem for Hilbert modular forms: potential semistability and compatibility with local Langlands

*Node* `PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p`.

Let F be a totally real field of degree g > 1, f a normalised Hilbert eigen-newform of multiweight k = (k_1, …, k_g, w) (w ≥ k_i ≥ 2, k_i ≡ w mod 2) with coefficient field L(f), and assume, when g is even, that π_{f,v} is in the discrete series at some finite place v (Carayol's hypothesis). Let 𝔭 be a place of F above p and μ a place of L(f) above p, and ρ_{f,μ} the associated μ-adic representation (geometric Frobenius at 𝔭 ∤ nℓ with characteristic polynomial the Euler factor of f). Then (Theorem 1) ρ_{f,μ}|_{G_{F_𝔭}} is potentially semistable and its Frobenius-semisimple Weil–Deligne representation is isomorphic to σ̌_h(π_{f,𝔭}), the dual of the Hecke-normalised local Langlands parameter; and (Theorem 2) the monodromy filtration of the Weil–Deligne representations of ρ_{f,λ}|_{G_{F_𝔭}} (λ ∤ p) and of ρ_{f,μ}|_{G_{F_𝔭}} is pure of weight w − 1: an eigenvalue of a Frobenius lift has weight w − 1 if N = 0, and weight w − 2 on ker N and w on coker N if N ≠ 0. With the Weil–Deligne relation normalised as F N F^{−1} = N𝔭^{−1}·N for a geometric Frobenius F (not Saito's printed sign; sourceIssue PadicHodgeTheory/E50).

*Hypotheses.* The Shimura curves and their semistable models are HilbertModularVarietiesAndShimuraCurves R18.2 (request); Carayol's ℓ-adic theorem (Saito's Theorem 0) is AutomorphicGaloisRepresentations R19.4 (request). Saito's proof of Proposition 1 (§10) and the construction of §§6–7 were read at statement level only.

*Proof outline.*

1. Carayol's construction: ρ_{f,λ} is cut out of H^1 of a Shimura curve with coefficients (§3), and Saito realises it in the étale cohomology of a Kuga–Sato analogue over the Shimura curve by algebraic correspondences (§§4–6).
2. The construction extends to semistable models (§7); Tsuji's semistable comparison (CohomologyComparisons CP.4, request) and the weight spectral sequence (WeightsInEtaleCohomology R34.3, request) compute traces and monodromy in terms of the reduction.
3. The Lefschetz trace formula, of the same form for ℓ-adic and crystalline cohomology, gives Claim 1(1): equal traces of the p-adic and ℓ-adic Weil–Deligne representations on the positive part of the Weil group; this includes potential semistability (Claim 1(0)).
4. Theorem 2 (purity) follows from the Weil conjectures and a vanishing of global sections; with equal traces it distinguishes N = 0 from N ≠ 0 by absolute values (Claim 1(2)), and Saito's Lemma 1 gives the isomorphism of Frobenius-semisimplifications.
5. Transport to local Langlands: Carayol's Theorem 0 on the ℓ-adic side (R19.4 request), normalised by σ̌_h (GL2AutomorphicRepresentationsAndTransfer R16.3, request); the Weil–Deligne functor is PadicHodgeTheory:R06.3/weil-deligne-parameter.

*Acceptance.*

- Unramified π_{f,𝔭}: ρ_{f,μ}|_{G_{F_𝔭}} is crystalline (N = 0, trivial inertia; PadicHodgeTheory:R06.3/weil-deligne-descent (b)).
- Special π_{f,𝔭} (unramified twist of Steinberg): semistable, N ≠ 0, Frobenius weights w − 2 and w.
- Sign check with the Tate curve over Q_p (w = 2): on H^1 = V_p(E_q)^∨ a geometric Frobenius acts by 1 on ker N and by p on coker N (weights 0 = w − 2 and 2 = w, as in Theorem 2), and N maps the p-eigenline to the 1-eigenline, so F N F^{−1} = p^{−1}N.

*Uses.* `HilbertModularVarietiesAndShimuraCurves:R18.2`, `AutomorphicGaloisRepresentations:R19.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `CohomologyComparisons:CP.4`, `WeightsInEtaleCohomology:R34.3`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.3/weil-deligne-descent`, `PadicHodgeTheory:R06.3/p-adic-monodromy-theorem`.

*Sources.*

- Hilbert modular forms and p-adic Hodge theory, Theorem 1, p. 12 (arXiv v2): “is potentially semi-stable and there is an isomorphism” Theorem 1.
- Hilbert modular forms and p-adic Hodge theory, Theorem 2, p. 13 (arXiv v2): “the monodromy filtration of” Theorem 2: purity of the monodromy filtration, weight w − 1.
- Hilbert modular forms and p-adic Hodge theory, Introduction, p. 1 (arXiv v2): “We prove the compatibility by comparing the p-adic and ℓ-adic representations” The method: comparison with the ℓ-adic side through traces and the monodromy-weight conjecture.

### What is missing

- T. Saito's 1997 paper (the elliptic case of the compatibility at p | N) is not public; the statement is quoted from Diamond–Flach–Guo and the proof follows the Hilbert-modular paper.
- Rank of N on D_st(V_p(A)) equal to the toric rank is left to NeronModelsAndSemistableAbelianVarieties R11.4–R11.5.
- The converse semistable criterion (V_p(A) semistable ⇒ semistable reduction) is not planned.
- Weil–Deligne comparison at p for abelian varieties with bad reduction other than multiplicative elliptic curves is not planned.

## Required examples and checks

The roadmap asks for Q_p, Q_p(1), an unramified twist and the Tate curve, for a good ordinary and a good supersingular curve with the same Hodge weights but different Frobenius, and for a duality-sign test against the determinant. Where each is met:

- Q_p(1) and unramified twists: PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified (part P7), used in the determinant test of `PadicHodgeTheory:R06.5/weil-pairing-duality`.
- Tate curve: `PadicHodgeTheory:R06.6/tate-curve-filtered-phi-n-module`; for 11a1 at 11, v_11(q) = 5 and the L-invariant is ≡ 11·10225 mod 11^5 (script: q from the q-expansion of j, j(q) checked against j(E) to 11^60).
- Good ordinary versus good supersingular: `PadicHodgeTheory:R06.5/elliptic-curve-ordinary-supersingular`, with 11a1 at 3 (a_3 = −1), at 19 (a_19 = 0) and at 2 (a_2 = −2), point counts by script.
- Determinant: `PadicHodgeTheory:R06.5/weil-pairing-duality` (c); det D_q has φ = p^{−1} and jump −1.
- Non-split multiplicative reduction: 15a1 at 3 (a_3 = −1), `PadicHodgeTheory:R06.6/multiplicative-reduction-elliptic-curves` (b).
- Higher weight: Δ is ordinary at 11 (τ(11) ≡ 1 mod 11) and not at 2 or 2411 (τ(2411) ≡ 0 mod 2411), `PadicHodgeTheory:R06.5/modular-form-crystalline-good-primes`; τ(p) mod p computed from the product formula by script.
- Weil–Deligne sign: the Tate curve fixes FNF^{−1} = q^{−1}N for a geometric Frobenius (`PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p`, acceptance; sourceIssue PadicHodgeTheory/E50).

## Requests

- **tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv** — For K complete discretely valued (in particular K/Q_p finite) and q ∈ K^× with 0 < |q| < 1: the Tate curve E_q: y² + xy = x³ + a_4(q)x + a_6(q), with j(E_q) = 1/q + 744 + 196884q + ⋯ and split multiplicative reduction; the G_K-equivariant uniformisation K̄^×/q^Z ≅ E_q(K̄), compatible with finite extensions; Tate's theorem: for E/K with v(j(E)) < 0 there is a unique such q with j(E_q) = j(E), E ≅ E_q over K iff E has split multiplicative reduction, and otherwise E is the quadratic twist of E_q by a quadratic character that is unramified iff E has multiplicative reduction; E has potentially good reduction iff v(j(E)) ≥ 0. Needed by: `PadicHodgeTheory:R06.6/tate-curve-tate-module`, `PadicHodgeTheory:R06.6/multiplicative-reduction-elliptic-curves`, `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`.
- **ArithmeticGaloisRepresentations:R01.6** — For an abelian variety A over a field F of characteristic 0 (K/Q_p finite, or a number field) and any prime ℓ: T_ℓ(A) = lim A[ℓ^n](F̄) as a continuous Z_ℓ[G_F]-module, free of rank 2 dim A, and V_ℓ(A); the identification T_ℓ(A) = Hom_{Z_ℓ}(H^1_et(A_F̄, Z_ℓ), Z_ℓ); det V_ℓ(E) ≅ Q_ℓ(1) for elliptic curves (Weil pairing); for A with good reduction at v ∤ ℓ: V_ℓ(A) is unramified at v, det(X − Frob_v | V_ℓ(A)) (arithmetic Frobenius) is the characteristic polynomial P_v of the Frobenius endomorphism of the reduction, lies in Z[X] and is independent of ℓ, and smooth proper base change H^1_et(A_{F̄_v}, Q_ℓ) ≅ H^1_et(A_{v,k̄_v}, Q_ℓ) holds. Needed by: `PadicHodgeTheory:R06.6/tate-curve-tate-module`, `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/multiplicative-reduction-elliptic-curves`, `PadicHodgeTheory:R06.6/local-global-compatibility-good-reduction`, `PadicHodgeTheory:R06.5/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights`, `PadicHodgeTheory:R06.5/weil-pairing-duality`.
- **AbelianSchemesAndArithmeticModuli:A3** — The Weil pairing A[n] × A^∨[n] → μ_n of an abelian scheme: perfect, compatible in n and with base change (hence G_K-equivariant over a field); for a polarization λ, the induced alternating pairing on A[n] and T_p(A). Needed by: `PadicHodgeTheory:R06.5/weil-pairing-duality`.
- **AbelianSchemesAndArithmeticModuli:A4** — For an abelian scheme f: A → S of relative dimension g: relative H^1_dR(A/S) locally free of rank 2g with the Hodge exact sequence 0 → f_*Ω^1 → H^1_dR(A/S) → R^1f_*O_A → 0 (ranks g, 2g, g), f_*Ω^1 = Lie(A)^∨ and R^1f_*O_A ≅ Lie(A^∨), compatible with base change. Needed by: `PadicHodgeTheory:R06.5/abelian-scheme-dcris`, `PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights`.
- **NeronModelsAndSemistableAbelianVarieties:R11.1** — Néron models of abelian varieties over O_K; A has good reduction iff its Néron model is an abelian scheme iff A extends to an abelian scheme over O_K; for elliptic curves, agreement with Mathlib's HasGoodReduction of a minimal Weierstrass equation. Needed by: `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`.
- **NeronModelsAndSemistableAbelianVarieties:R11.3** — (i) Grothendieck's criterion for ℓ = p (SGA 7 IX Theorem 5.13, as in Brinon–Conrad Theorem 7.1.13): A/K has good reduction iff A[p^∞] extends to a p-divisible group over O_K; (ii) the semistable reduction theorem (after a finite extension); (iii) Raynaud's uniformisation for semistable A, with the G_K-equivariant exact sequences 0 → G[p^n](K̄) → A[p^n](K̄) → Γ/p^nΓ → 0 and 0 → T[p^n](K̄) → G[p^n](K̄) → B[p^n](K̄) → 0, compatible in n (T a torus split by an unramified extension, B with good reduction, Γ a lattice with unramified action). Needed by: `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/semistable-reduction-semistable`.
- **ClassicalAdicEtaleCohomology:H5** — For X proper smooth over K (K/Q_p finite; not only curves): Huber's comparison H^i_et(X_K̄, Z/p^n) ≅ H^i_et(X^ad_C, Z/p^n) (Hub96 3.7.2/3.8.1), G_K-equivariant and compatible with cup products, so that the algebraic étale cohomology is the one compared in CohomologyComparisons CP.2–CP.4 and PadicHodgeTheory P8. Needed by: `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`, `PadicHodgeTheory:R06.5/abelian-variety-hodge-tate-weights`.
- **ArithmeticGaloisDuality:R02.1** — Continuous cohomology of G_K with coefficients Z_p(1), Q_p(1) and the Kummer isomorphism lim K^×/(K^×)^{p^n} ≅ H^1(G_K, Z_p(1)) (hence Q_p ⊗ K̂^× ≅ H^1(G_K, Q_p(1))), with the explicit cocycle g ↦ c_q(g); Ext^1(Q_p, Q_p(1)) in continuous representations ≅ H^1(G_K, Q_p(1)). Needed by: `PadicHodgeTheory:R06.6/kummer-representation`, `PadicHodgeTheory:R06.6/kummer-representations-semistable`, `PadicHodgeTheory:R06.6/tate-curve-l-invariant`.
- **AutomorphicGaloisRepresentations:R19.1** — For a newform g of weight k ≥ 2, level N, character ψ: the rank-two premotivic structure M_g (Betti, de Rham with Hodge filtration, λ-adic realisations) cut out of parabolic cohomology with Sym^{k−2} coefficients by the Hecke ideal of g, with Fil^{k−1}M_{g,dR} = Kg and ∧²M_g ≅ M_ψ(1 − k); its realisation as a summand of H^{k−1} of a smooth proper Kuga–Sato variety over Q with a smooth proper model over Z[1/N] and the Hecke idempotent as a correspondence (Scholl); the Eichler–Shimura relation giving the characteristic polynomial X² − a_pX + ψ(p)p^{k−1} of a geometric Frobenius at p ∤ Nℓ; and for k = 2 the identification V_p(A_f) ≅ ⊕_{λ|p} ρ_{f,λ}. Needed by: `PadicHodgeTheory:R06.5/modular-form-de-rham-realisation`, `PadicHodgeTheory:R06.5/modular-form-crystalline-good-primes`, `PadicHodgeTheory:R06.5/weight-two-modular-abelian-varieties`, `PadicHodgeTheory:R06.6/modular-form-local-global-compatibility-at-p`.
- **AutomorphicGaloisRepresentations:R19.4** — Carayol's theorem: for elliptic and Hilbert newforms (with his discrete-series hypothesis when [F : Q] is even), the Frobenius-semisimple Weil–Deligne representation of ρ_{f,λ}|_{G_{F_𝔭}}, 𝔭 ∤ ℓ, corresponds to π_{f,𝔭} under local Langlands (Hecke normalisation σ̌_h). Needed by: `PadicHodgeTheory:R06.6/modular-form-local-global-compatibility-at-p`, `PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p`.
- **GL2AutomorphicRepresentationsAndTransfer:R16.3** — The local Langlands correspondence for GL_2 over p-adic fields with its normalisations (Hecke σ_h, Carayol), matching unramified principal series with unramified parameters, twists of Steinberg with N ≠ 0, and supercuspidals with irreducible parameters; compatibility with twists and central characters. Needed by: `PadicHodgeTheory:R06.6/modular-form-local-global-compatibility-at-p`, `PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p`.
- **ModularCurvesPartII:R13.5** — Deligne–Rapoport: for p ∥ N the modular curve of level Γ_1(N/p) ∩ Γ_0(p) has a semistable model over Z_p, so its Jacobian and the quotients A_f of weight-two newforms of level N with character unramified at p have semistable reduction at p. Needed by: `PadicHodgeTheory:R06.5/weight-two-modular-abelian-varieties`.
- **HilbertModularVarietiesAndShimuraCurves:R18.2** — Shimura curves attached to a quaternion algebra over a totally real F split at one real place, Carayol's integral models and the semistable models at primes of level p used by T. Saito (Hilbert modular forms and p-adic Hodge theory, §§4–7). Needed by: `PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p`.
- **CohomologyComparisons:CP.4** — Tsuji's C_st: for a proper semistable scheme over O_K, H^i_et(X_K̄, Q_p) is semistable and D_st(H^i) ≅ the Hyodo–Kato cohomology with φ, N and the filtration from de Rham cohomology, compatibly with correspondences. Needed by: `PadicHodgeTheory:R06.6/modular-form-local-global-compatibility-at-p`, `PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p`.
- **WeightsInEtaleCohomology:R34.3** — The Rapoport–Zink/Mokrane weight spectral sequences (ℓ-adic and log-crystalline) for semistable models and the Weil-conjecture purity input used to prove that the monodromy filtration of the modular-form summand is pure (Saito's Theorem 2). Needed by: `PadicHodgeTheory:R06.6/modular-form-local-global-compatibility-at-p`, `PadicHodgeTheory:R06.6/hilbert-modular-form-compatibility-at-p`.

## Coverage

- **PadicHodgeTheory:R06.5** (partial). The abelian-variety applications and the modular-curve and Kuga–Sato applications are planned: CP.2 read through D_cris, D_cris of abelian schemes, Hodge–Tate weights, Weil-pairing duality, the ordinary/supersingular example, the de Rham realisation of modular forms with weights 0 and 1 − k, crystallinity at p ∤ N with Frobenius polynomial X² − a_pX + ψ(p)p^{k−1} and the ordinary criterion, and the weight-two Barsotti–Tate and ordinary cases.
  - Remaining: The endpoint-weight case consumed by R19.5 (k = p + 1 and weight p) is not planned; it is PadicHodgeTheory R06.4's weight-p branches applied to V_g.
  - Remaining: The semistable geometric branch for general semistable models (CP.4 Hyodo–Kato; WeightsInEtaleCohomology R34.3) is used only through requests; the Shimura-curve de Rham realisation (Hodge filtration of Carayol's coefficient systems) is quoted from Saito at statement level.
  - Remaining: Berthelot–Breen–Messing (Dieudonné module versus H^1_cris) is quoted from Brinon–Conrad Remark 7.3.3, not read.
  - Remaining: Scholl's crystalline theorem and Frobenius polynomial are quoted through Diamond–Flach–Guo; Scholl's paper is not read.
  - Remaining: CP.2's remaining G_K- and Frobenius-compatibility is inherited by PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction.
- **PadicHodgeTheory:R06.6** (partial). Kummer extensions and the Tate curve, the p-adic criterion of good reduction, semistable reduction, elliptic curves with v(j) < 0, local–global compatibility at good places for abelian varieties, and the R19 inputs for modular forms (Scholl, Saito) and Hilbert modular forms (Saito) are planned.
  - Remaining: T. Saito's 1997 paper (the elliptic case of the compatibility at p | N) is not public; the statement is quoted from Diamond–Flach–Guo and the proof follows the Hilbert-modular paper.
  - Remaining: Rank of N on D_st(V_p(A)) equal to the toric rank is left to NeronModelsAndSemistableAbelianVarieties R11.4–R11.5.
  - Remaining: The converse semistable criterion (V_p(A) semistable ⇒ semistable reduction) is not planned.
  - Remaining: Weil–Deligne comparison at p for abelian varieties with bad reduction other than multiplicative elliptic curves is not planned.

## Gaps

- **Coleman–Iovita Chapter II is not in the arXiv version** (needed by `PadicHodgeTheory:R06.6/good-reduction-iff-crystalline`, `PadicHodgeTheory:R06.6/semistable-reduction-semistable`). arXiv:math/9701229v1 contains only the Introduction and Chapter I; the proof that T_p(A) crystalline implies good reduction and the comparison of D_st(V(A))^* with the Hyodo–Kato lattice are in Chapter II (Duke 1999, not available). The packet proves the good-reduction criterion through Grothendieck's criterion and Kisin's lattice classification instead; the D_st comparison for semistable abelian varieties is not used. NEXT ACTION: find a public copy of the Duke version or Iovita's thesis if the explicit Hyodo–Kato description is wanted by R11.5.
- **Berthelot–Breen–Messing not read** (needed by `PadicHodgeTheory:R06.5/abelian-scheme-dcris`). Part (c) of the abelian-scheme node quotes Brinon–Conrad Remark 7.3.3 for H^1_cris(A_0/W(k)) ≅ D(A_0[p^∞])^{(p)}; the Lecture Notes volume is not public. The ordinary/supersingular example uses Katz–Messing instead, so no conclusion depends on it.
- **Tate's twist theorem cited through a request** (needed by `PadicHodgeTheory:R06.6/multiplicative-reduction-elliptic-curves`, `PadicHodgeTheory:R06.6/tate-curve-tate-module`). Silverman, Advanced Topics V.3–V.5, is not public; the Tate-curve facts are requested from the Tau Ceti EllipticCurves Layer 4, which plans them. Berger II.4.1 states the isomorphism with E_q without the split hypothesis (sourceIssue PadicHodgeTheory/E43).
- **Saito 1997 not public** (needed by `PadicHodgeTheory:R06.6/modular-form-local-global-compatibility-at-p`). The elliptic case of compatibility at p | N (T. Saito, Invent. Math. 129 (1997), 607–620) is behind a paywall. The statement is quoted from Diamond–Flach–Guo §5.5 and Saito's Hilbert paper states that the method is the same; the node's proof outline follows the Hilbert paper. NEXT ACTION: look for an author copy on T. Saito's page (ms.u-tokyo.ac.jp/~t-saito/pp/).
- **Scholl's Kuga–Sato motives not read** (needed by `PadicHodgeTheory:R06.5/modular-form-de-rham-realisation`, `PadicHodgeTheory:R06.5/modular-form-crystalline-good-primes`). Scholl, Motives for modular forms (Invent. Math. 100, 1990) supplies the smooth proper Kuga–Sato model over Z[1/N] and the crystalline Frobenius polynomial; both are quoted through Diamond–Flach–Guo and requested from R19.1.

## Source issues

Mistakes found in the sources (PROTOCOL.md §18). The nodes use the corrected statements.

- **PadicHodgeTheory/E40** (misprint; An introduction to the theory of p-adic representations, II.3.3, p. 14 (arXiv v1); checked on the page image; affects nothing; known: new). Printed: “Bst = Bcris [Y ], where we have decided that ϕ(Y ) = Y^p and g(Y ) = Y + c(g)t” Correction: φ(Y) = pY. Reason: Y is mapped to log[p̃] and φ(log[x]) = p·log[x] (Berger's own p. 18: φ(t) = pt, φ(u) = pu). With φ(Y) = Y^p the relation Nφ = pφN fails on Y: for N = −d/dY, N(φ(Y)) = −pY^{p−1} while pφ(N(Y)) = −p.
- **PadicHodgeTheory/E41** (misprint; An introduction to the theory of p-adic representations, II.3.3, p. 15 (arXiv v1); checked on the page image; affects nothing; known: new). Printed: “log[p̃] = logp(p) − Σ_{n=1}^{+∞} (1 − [p̃]/p)^{n−1} / n” Correction: The exponent is n: log[p̃] = log_p(p) − Σ_{n≥1} (1 − [p̃]/p)^n/n. Reason: log(1 − z) = −Σ z^n/n; as printed the n = 1 term is the constant 1, so θ(log[p̃]) would be log_p(p) − 1 instead of log_p(p). The analogous series for u on p. 18 has exponent n.
- **PadicHodgeTheory/E42** (misprint; An introduction to the theory of p-adic representations, II.4.2, p. 17 (arXiv v1); checked on the page image; affects nothing; known: new). Printed: “{x ∈ F̄*/⟨q⟩, x^{p^n} ∈ ⟨q⟩} = {(ε^(n))^i (q^(n))^j, 0 ≤ i, j < p^n − 1}” Correction: 0 ≤ i, j ≤ p^n − 1 (equivalently 0 ≤ i, j < p^n). Reason: E_q[p^n](F̄) has p^{2n} elements; the printed range lists only (p^n − 1)^2 of them.
- **PadicHodgeTheory/E43** (error; An introduction to the theory of p-adic representations, II.4.1, p. 17 (arXiv v1); checked on the page image; affects a stated result; known: new). Printed: “Furthermore, if E is an elliptic curve over F with bad semi-stable reduction, then there exists q such that E is isomorphic to Eq over F.” Correction: This holds iff E has split multiplicative reduction. If the reduction is non-split multiplicative, E is the quadratic twist of E_q by the unramified quadratic character, isomorphic to E_q only over the unramified quadratic extension of F. Reason: E_q has split multiplicative reduction (its reduction y² + xy = x³ has node tangents y = 0 and y = −x, both rational), and the reduction type of the minimal model is an isomorphism invariant. For example 15a1 over Q_3 has non-split multiplicative reduction (a_3 = −1, point count mod 3), so it is isomorphic over Q_3 to no E_q. The conclusion of II.4 (V semistable) survives, since the twist is by an unramified character (PadicHodgeTheory:R06.6/multiplicative-reduction-elliptic-curves (b)).
- **PadicHodgeTheory/E44** (error; An introduction to the theory of p-adic representations, II.4.3, p. 18 (arXiv v1); checked on the page image; affects a stated result; known: new). Printed: “The p-adic number logp(q^(0)/p^{vp(q^(0))}) is canonically attached to V and is called the ℓ-invariant of V.” Correction: The isomorphism invariant of V is log_p(q)/v_p(q) (with log_p(p) = 0, equal to log_p(q/p^{v_p(q)})/v_p(q)), the Mazur–Tate–Teitelbaum L-invariant; log_p(q/p^{v_p(q)}) itself depends on q, not only on V. Reason: E_q and E_{q²} are isogenous (x ↦ x² on F̄^×), so V_p(E_q) ≅ V_p(E_{q²}), but log_p(q²/p^{2v_p(q)}) = 2 log_p(q/p^{v_p(q)}). In D_st(V) the rescaling y ↦ ay (and hence N(y) ↦ aN(y)) keeps only the ratio of log_p(q) to v_p(q) (PadicHodgeTheory:R06.6/tate-curve-l-invariant).
- **PadicHodgeTheory/E45** (misprint; An introduction to the theory of p-adic representations, II.5.1, p. 19 (arXiv v1); checked on the page image; affects nothing; known: new). Printed: “One should remember that for an abelian variety A, we have Hom_{G_K}(T_pA, Z_p(1)) ≃ H^1_ét(A_K̄, Z_p).” Correction: Hom_{Z_p}(T_pA, Z_p) ≃ H^1_ét(A_K̄, Z_p), equivalently Hom_{Z_p}(T_pA, Z_p(1)) ≃ H^1_ét(A_K̄, Z_p(1)). Reason: For an elliptic curve E, Hom_{Z_p}(T_pE, Z_p(1)) ≅ T_pE by the Weil pairing and has determinant Z_p(1), while H^1_ét(E_K̄, Z_p) = Hom(T_pE, Z_p) has determinant Z_p(−1); their Hodge–Tate weights are {0, 1} and {0, −1}. Read literally, Hom_{G_K} (G_K-equivariant maps) would be a finite group.
- **PadicHodgeTheory/E46** (error; CMI Summer School notes on p-adic Hodge theory, §8.3, last paragraph, pp. 125–126 (2009 preliminary version); checked on the page image; affects a stated result; known: new). Printed: “D*st(Vp(Eq)) is classified by some parameter cq ∈ Q×p in terms of our preceding description of crystalline classes in H1(GQp, Qp(1)) … If one does a direct calculation with Bst using the contravariant functors, one finds that cq = −λ(q).” Correction: c_q = −λ(q)/ord_p(q), an element of Q_p that can be 0 (for q = p when λ(p) = 0). Reason: By Brinon–Conrad's own proof of Proposition 8.3.8 (p. 124) c is intrinsic to D, hence an isomorphism invariant of V_p(E_q). E_q and E_{q²} are isogenous, so V_p(E_q) ≅ V_p(E_{q²}), whereas −λ(q²) = −2λ(q). Directly: with their N = v_0·d/dX (p. 139) the covariant D_st(V_p(E_q)) has N(y) = −ord_p(q)x and Fil^0 = Q_p(y + λ(q)x); in the dual, e_2 = x^*, e_1 = N(e_2) = ord_p(q)y^* and Fil^1 = Q_p(x^* − λ(q)y^*) = Q_p(ce_1 + e_2) with c = −λ(q)/ord_p(q).
- **PadicHodgeTheory/E47** (misprint; The Frobenius and monodromy operators for curves and abelian varieties, Introduction, p. 3 (arXiv v1); affects nothing; known: new). Printed: “Theorem. Let A be an Abelian variety over the local field K. Then Tp (A) is crystalline if and only if A has good reduction. … The only if part of this statement is known by work of J.-M.Fontaine [Fo-BT] and the if part was conjectured by J.-M.Fontaine in [Fo-MGF].” Correction: Swap "if" and "only if": the "if" part (good reduction ⇒ T_p(A) crystalline) is Fontaine's; the "only if" part (crystalline ⇒ good reduction) was conjectured in [Fo-MGF] and proved there when e < p − 1. Reason: In "T_p(A) is crystalline if A has good reduction" the known direction is good ⇒ crystalline, which is Fontaine's work on p-divisible groups (Brinon–Conrad p. 84 credit Fontaine for linking Grothendieck's criterion to crystallinity), and the next sentence says "The conjecture was proved in [Fo-MGF] if the ramification index of K is less then p − 1", which only makes sense for the converse, the new result of the paper.
- **PadicHodgeTheory/E48** (misprint; The Tamagawa number conjecture of adjoint motives of modular forms, §1.1.1, p. 669 (Ann. Sci. ÉNS 2004); checked on the page image; affects nothing; known: corrected in the authors' arXiv version 2512.02348v2 (11 Dec 2025), §1.1, p. 6: Frob_p is geometric, φ_p = Frob_p^{−1}, and (ρ, N) with ρ(g) = gφ^{ν(g)}). Printed: “We recall that Mλ|Gp is crystalline if and only if WDp(Mλ) is unramified …, in which case WDp(Mλ) = Q_p^ur ⊗Qp Dcrys(Mλ) with Frobp acting via 1 ⊗ φ^{−1}.” Correction: With Frob_p the geometric Frobenius (p. 668), it acts via 1 ⊗ φ; equivalently the arithmetic Frobenius acts via 1 ⊗ φ^{−1}. Reason: For V = Q_p(1), D_crys = Q_p t^{−1} with φ = p^{−1}, and the geometric Frobenius acts on the ℓ-adic Q_ℓ(1) by p^{−1}; with 1 ⊗ φ^{−1} it would act by p. For M_f, (18) gives the geometric Frobenius the characteristic polynomial X² − ψ(p)^{−1}a_pX + ψ(p)^{−1}p^{k−1}; with φ^{−1} this would make det φ of valuation 1 − k, while the Hodge jumps 0 and k − 1 force t_N = k − 1.
- **PadicHodgeTheory/E49** (misprint; The Tamagawa number conjecture of adjoint motives of modular forms, §1.6.3, p. 684 (Ann. Sci. ÉNS 2004); checked on the page image; affects nothing; known: corrected in arXiv:2512.02348v2, §5.5, p. 60: "by Langlands, Deligne and Carayol [Ca0] for λ ∤ p, and by Scholl [Scho2] and Saito [Sai] in general"). Printed: “For λ not dividing p and p not dividing N, this is the Eichler–Shimura relation (18); for λ dividing p and p dividing N, this is due to Deligne, Langlands and Carayol [9]; for λ|p, p ∉ S, this is due to Scholl [75].” Correction: "for λ not dividing p and p dividing N, this is due to Deligne, Langlands and Carayol". Reason: Carayol's theorem concerns λ ∤ p; and λ | p with p | N lies in the excluded set S = S_N (primes dividing Nk!, p. 673), so the printed case is outside the statement.
- **PadicHodgeTheory/E50** (misprint; Hilbert modular forms and p-adic Hodge theory, §2, p. 9 and p. 12 (arXiv v2); checked on the page images; affects nothing; known: new). Printed: “p. 9: "a nilpotent endomorphism N of V satisfying ρ(σ)Nρ(σ)^{−1} = N𝔭^{n(σ)}N. … n : W(F̄_𝔭/F_𝔭) → Z is the canonical surjection sending a geometric Frobenius … to 1." p. 12: "satisfying σN = N𝔭^{n(σ)}Nσ since φN = pNφ."” Correction: ρ(σ)Nρ(σ)^{−1} = N𝔭^{−n(σ)}N, and σN = N𝔭^{−n(σ)}Nσ since Nφ = pφN. Reason: Fontaine's B_st satisfies Nφ = pφN (on u = log[p̃]: N(φu) = −p = pφ(Nu)), which gives F N F^{−1} = N𝔭^{−1}N for a geometric Frobenius F; this is Deligne's relation and the one forced by Grothendieck's ℓ-adic monodromy theorem. Saito's own Theorem 2 (p. 13: weight w − 2 on ker N, w on coker N; N: Gr_1^W(1) ≅ Gr_{−1}^W) also requires F N F^{−1} = N𝔭^{−1}N. The two printed relations are reversed consistently, so the construction and the theorems are unaffected.

## Sources

- **An introduction to the theory of p-adic representations**, L. Berger. arXiv:math/0210184v1 (12 Oct 2002), the only arXiv version; published in Geometric Aspects of Dwork Theory, 255–292, de Gruyter 2004 (not seen). Printed page = PDF page. https://arxiv.org/abs/math/0210184v1 (SHA-256 fac038cb2e7a3c939f7b0c85d1060985876abc5d55407d7172fc1f6f2cc16ecc, accessed 2026-09-29). Read: II.3.2–II.3.3 (pp. 14–15): good ordinary and supersingular elliptic curves, B_st, N = −d/dY, log[p̃]; II.4.1–II.4.4 (pp. 16–19): Tate's elliptic curve, its p-adic representation and periods, Kummer theory; II.5.1 (p. 19): comparison theorems.
- **CMI Summer School notes on p-adic Hodge theory**, O. Brinon and B. Conrad. Preliminary version (PDF dated 26 June 2009), the only version posted; printed page = PDF page. https://math.stanford.edu/~conrad/papers/notes.pdf (SHA-256 f27d508bc64b3c9e2e9de5041429b2cb6a909b2cd72ff8096c20493f27b5a187, accessed 2026-09-29). Read: §7 opening and §7.1 through Theorem 7.1.13 and the following paragraphs (pp. 83–90); Theorem 7.2.8 and §7.3 through Remark 7.3.3 and Definition 7.3.4 (pp. 94–98); Example 8.1.10 (p. 107); §8.3 from the proof of Proposition 8.3.8 to the end (pp. 124–126); §9.2: the monodromy operator N = v_0·d/dX and Remark 9.2.5 (p. 139); Examples 9.2.8–9.2.9 and Theorem 9.2.10 (pp. 142–143).
- **The Frobenius and monodromy operators for curves and abelian varieties**, R. Coleman and A. Iovita. arXiv:math/9701229v1 (2 Jan 1997), 22 pages: the Introduction and Chapter I only (Chapter II, with the proof of the good-reduction theorem, is not in this file); published in Duke Math. J. 97 (1999), 171–215 (not seen). https://arxiv.org/abs/math/9701229v1 (SHA-256 797d8361ffdb5db2460a5830ef913a8ea7d9cefc6803ae4b8265d651fa039530, accessed 2026-09-29). Read: Introduction (pp. 1–3); Chapter I, opening paragraphs (p. 3).
- **Adjoint motives of modular forms and the Tamagawa number conjecture**, F. Diamond, M. Flach and L. Guo. arXiv:2512.02348v2 (11 Dec 2025), the authors' revised version of the Ann. Sci. ÉNS 37 (2004) article; printed page = PDF page. https://arxiv.org/abs/2512.02348v2 (SHA-256 0f4984acdabd2efd542aae932850da83c36ec023185a47f40c8ef5813bd21898, accessed 2026-09-29). Read: Abstract and §0.2 (pp. 1–5); §1.1 (pp. 6–8): conventions for Frobenius, D_crys, D_st, D_pst and Weil–Deligne representations; §5.4, Lemma 5.7 with proof (pp. 58–59); §5.5 through Lemma 5.9 (pp. 59–61); Lemma 8.13 with proof (p. 104).
- **The Tamagawa number conjecture of adjoint motives of modular forms**, F. Diamond, M. Flach and L. Guo. Ann. Sci. École Norm. Sup. (4) 37 (2004), 663–727, the Numdam copy (65 pages; printed page = PDF page + 662). https://www.numdam.org/item/ASENS_2004_4_37_5_663_0/ (SHA-256 385dc212a14bf884a29564375cf6308f310feac2c0b634c418e7bb46d50472a3, accessed 2026-09-29). Read: §1.1.1 (pp. 668–669); §1.6.2–1.6.3 (pp. 683–684).
- **Hilbert modular forms and p-adic Hodge theory**, T. Saito. arXiv:math/0612077v2 (11 Dec 2006); published in Compositio Math. 145 (2009), 1081–1113 (not seen). https://arxiv.org/abs/math/0612077v2 (SHA-256 fb5b69b76d2257ce20f47366c4bd165ccdb571333e7f25a4ed6e92dbb4b55df7, accessed 2026-09-29). Read: Introduction (pp. 1–2); §1 opening (p. 2); §2 with Theorems 0, 1, 2, Claim 1 and the remarks (pp. 8–13).
- **Fermat's Last Theorem**, H. Darmon, F. Diamond and R. Taylor. Authors' revised version dated 9 September 2007 (167 pages) of the article in Current Developments in Mathematics 1995; printed page = PDF page. https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf (SHA-256 254f6e29957f95219eff046c29478f5ee584615bee12c8aa8357f499c8cbe8b3, accessed 2026-09-29). Read: §3.1: Theorem 3.1 with its proof and the paragraph after it (pp. 85–87).
