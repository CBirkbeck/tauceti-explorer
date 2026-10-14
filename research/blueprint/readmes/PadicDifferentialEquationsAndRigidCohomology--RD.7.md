# P-adic differential equations, rigid cohomology and p-adic weights — RD.7: crystalline comparison and Weil-factor export (follow-up part)

RD.7 compares rigid cohomology of a smooth proper variety over a finite field with crystalline cohomology, and exports the Weil factors P_i(X, t) = det(1 − tF | H^i_rig(X/K)) with their rationality, integrality, weights and equality with the ℓ-adic factors. It also owns the certified p-adic point-counting algorithms built on Monsky–Washnitzer cohomology. The roadmap's reviewed packet already plans eleven RD.7 targets: the comparison theorem and its Frobenius compatibility, the Weil factors, the rigid and crystalline zeta expressions, the integrality theorem, the ℓ-adic comparison for projective and for proper varieties, the export to the Weil-conjectures consumer, the remark that a de Rham comparison over a lift carries no Frobenius, the elliptic-curve slope and weight tests, and Kedlaya's hyperelliptic point-counting certificate. This part completes that layer. It supplies the proofs those nodes left open, the inputs other roadmaps have asked RD.7 for, and the targets that papers routed here.

Every target of the layer is now planned: each node's prerequisites end in Mathlib, Tau Ceti, a node of an accepted plan, a requested stage of a lower roadmap, a stage of this roadmap, or one of three recorded gaps. The parent nodes are cited by their identifiers and are not restated here, except where a statement here completes one of them.

## What this part adds

- **The comparison, proved.** Berthelot's morphism from the de Rham complex of the tube ]X[_P to the completed divided power envelope of X in P, its quasi-isomorphism property for smooth X, and Ogus's comparison with coefficients in an F-crystal (Section 1). This closes the parent's gap on Berthelot's comparison, which was stated there only in outline.
- **Weight separation.** Two lemmas carry the integrality and the ℓ-independence of the Weil factors in the parent's export: rationality descends to Q with an integral normalised presentation (Fatou), and a factorisation into pure factors of distinct weights is unique, rational and integral (Section 2). The parent assigned this argument to RD.7.
- **Abelian varieties.** For an abelian variety, the crystalline Frobenius polynomial in degree one is the characteristic polynomial of the Frobenius endomorphism, with every convention pinned (Section 3). PadicHodgeTheory:R06.5 requested this statement.
- **Point counting.** The corrected reduction bounds in Kedlaya's algorithm, the integral crystalline lattice that bounds the denominators of the Frobenius matrix, and Tuitman's algorithm for curves with a map to P^1, with its precision certificate (Section 4). EffectiveDiophantineMethods:ED.6 requested Tuitman's algorithm.
- **Kloosterman moments.** Mieda's p-adic Picard–Lefschetz map, and the two applications of Fresán, Sabbah and Yu to the Kloosterman motive (Section 5).

## Conventions

- k is a perfect field of characteristic p, W = W(k), K_0 = W[1/p], and σ is the Witt vector Frobenius. Over k = F_q with q = p^f, K is a complete discretely valued field with residue field F_q, and the Frobenius lift on K is the identity.
- Crystalline cohomology H^i_crys(X/W, M) is the cohomology of the crystalline site of X over (W, pW, canonical divided powers), with the σ-semilinear Frobenius φ of CrystallineCohomology:CR.3/frobenius-map. Over F_q the map φ^f is W-linear, and its characteristic polynomial is the invariant. The characteristic polynomial of φ itself depends on the basis when f > 1 (parent unit test `weilFactor_semilinear_basis`).
- Rigid cohomology, tubes and the linear q-Frobenius F are those of RD.3, RD.4 and RD.6. For proper X, rigid cohomology is computed on the tube ]X[_P with no overconvergence condition (RD.4/proper-rigid-equals-convergent).
- The divided power envelope D_P(X) of the ideal 𝔦 of X in P is taken compatible with the canonical divided powers of (p). D̂ is its p-adic completion, and x^{[n]} = x^n/n!.
- Weil factors are reverse characteristic polynomials, P_i(t) = det(1 − tF) (Mathlib's `Matrix.charpolyRev`). A Weil q-number of weight w is an algebraic number all of whose complex conjugates have absolute value q^{w/2} (DeligneWeightsAndPurity:DWP.0/weil-q-number).
- Tate modules are covariant. The q-Frobenius endomorphism π_A of an abelian variety acts on V_ℓA as the arithmetic Frobenius acts on torsion points. Étale H^1 is the dual of V_ℓA, and the geometric Frobenius acts on it as the transpose of V_ℓ(π_A).
- Matrices of semilinear Frobenius maps are written in the row convention: row i holds the coordinates of the image of the i-th basis vector. The n-th power of a σ-semilinear map with matrix F then has matrix F^{σ^{n−1}}⋯F^{σ}F. In the column convention the product runs the other way, and for n ≥ 3 the two orders give different characteristic polynomials.
- Coefficients of the comparison theorems are F-crystals, or more generally locally free convergent isocrystals E with their crystalline isocrystals Φ(E) (Shiho). The isocrystal of a crystal without Frobenius structure need not be convergent.

## Owners, suppliers and consumers

- **From this roadmap.** RD.3 supplies tubes, the weak fibration theorem and the convergent coefficient model. RD.4 supplies rigid cohomology, its independence of the embedding, the Frobenius and the Monsky–Washnitzer comparison. RD.6 supplies the linear q-Frobenius, purity, the Gysin sequence of a punctured curve and the Kloosterman F-isocrystal. RD.0 supplies Frobenius lifts on dagger algebras.
- **CrystallineCohomology** (tier 9) supplies the divided power envelopes CR.0, crystals CR.1, the embedding computations and the formal comparison for proper smooth lifts CR.2, the Frobenius and descent CR.3, log crystalline cohomology CR.5, and Hyodo–Kato theory CR.6.
- **DeligneWeightsAndPurity** (tier 11) supplies Weil numbers, the Frobenius endomorphism of an abelian variety, the Weil estimate for abelian varieties and their zeta functions. **AbelianSchemesAndArithmeticModuli** supplies the characteristic polynomial of an endomorphism on V_ℓA. **SchemeAndStackFoundations** SF.4 supplies the deformation theory of smooth schemes.
- **Requested from lower tiers.** ArithmeticGaloisRepresentations:R01.6 (the Tate realisation), NeronModelsAndSemistableAbelianVarieties:R11.5 (period rings and the functors D_st, D_cris) and FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3 (weak admissibility of D_st).
- **Libraries.** Mathlib supplies `PowerSeries`, Gauss's lemma `IsIntegrallyClosed.eq_map_mul_C_of_dvd`, Galois descent `IsGalois.mem_range_algebraMap_iff_fixed` and `Matrix.charpolyRev`. Tau Ceti supplies the elliptic Frobenius trace `WeierstrassCurve.frobeniusTrace` (= q + 1 − #E(F_q) on an elliptic model).
- **Consumers.**
  - WeilConjectures:WC.6 consumes the export.
  - PadicHodgeTheory:R06.5–R06.6 consumes the degree-one Katz–Messing statement.
  - EffectiveDiophantineMethods:ED.6 consumes Tuitman's Frobenius matrix and primitives.
  - CohomologyComparisons:CP.4 is the proposed home of the Kloosterman applications.
  - DeligneWeightsAndPurity:DWP.0 is the proposed final owner of the weight-separation lemmas.

## Planets of RD.7

The parent plan shows three planets: *Rigid–crystalline comparison*, *Katz–Messing comparison of Weil factors* and *Weil-factor export*. This part adds three more: *Ogus comparison with coefficients*, *Weight separation of Weil factors* and *Tuitman's point-counting algorithm*. That makes six, the maximum for a layer.

## Dependencies inside RD.7

- The comparison chain runs through four nodes:
  1. `RD.7/tube-to-envelope-comparison-map`.
  2. `RD.7/comparison-map-quasi-isomorphism`, which proves the parent's `RD.7/rigid-crystalline-comparison`.
  3. `RD.7/crystalline-rigid-comparison-with-coefficients`.
  4. The parent's `RD.7/frobenius-compatibility-of-comparison`, the constant-coefficient case.
- The weight chain is `RD.7/rational-zeta-descent-and-fatou` → `RD.7/weight-separated-factor-extraction`. The parent's `RD.7/weil-factors-rational-and-integral` and `RD.7/ell-adic-comparison-smooth-projective` consume it.
- `RD.7/abelian-variety-crystalline-frobenius-polynomial` consumes the parent's rigid zeta expression and integrality theorem through `RD.7/weight-separated-factor-extraction`. It does not need the ℓ-adic comparison.
- The point-counting nodes run `RD.7/kedlaya-reduction-denominators` → `RD.7/hyperelliptic-integral-frobenius-lattice` → `RD.7/tuitman-precision-certification`, which also uses `RD.7/tuitman-frobenius-structure-algorithm`. The first two prove items (iv)–(vi) of the parent's `RD.7/kedlaya-point-counting-certification`, so that node consumes them: the assembly adds them to its prerequisites, and there is no edge in the other direction.
- The Kloosterman chain is `RD.7/mieda-p-adic-picard-lefschetz` → `RD.7/kloosterman-semistable-realization` → `RD.7/kloosterman-newton-above-hodge`.

## Acceptance tests for the layer

- P^1 over F_q has factors 1 − t, 1 and 1 − qt. Crystalline and rigid H^2 are both K_0, with linear Frobenius q.
- y^2 = x^3 + x + 1 over F_7 is ordinary: a = 3 and P_1 = 1 − 3t + 7t^2, with slopes 0 and 1 and weights 1. y^2 = x^3 + x over F_7 is supersingular: P_1 = 1 + 7t^2 over F_7 and (1 + 7t)^2 over F_49, with slopes 1/2.
- For y^2 = x^5 + x + 3 over F_7, the factor P_1 is 1 + 3t + 7t^2 + 21t^3 + 49t^4. Its coefficients are recovered modulo 7^3 from Tuitman's bound B = 3, and #C(F_7) = 11.
- For Q = x^3 + x + 1 and p = 5, the reduction of y dx needs the factor 5. The bound printed in Kedlaya's Lemma 3 fails here, and so does the errata formula read in that lemma's indexing.

## Suggested Lean file

`research/blueprint/suggested/PadicDifferentialEquationsAndRigidCohomology--RD.7.lean` elaborates against the pinned Mathlib and Tau Ceti, and its only warnings are `sorry`. It states only what the pins can carry:

- `rationalSeries_descent`, `fatou_local`, `fatou` and `weightSeparated_factor_extraction`, for Section 2;
- the light definition `ellipticWeilFactor` (1 − a t + q t^2, built from `WeierstrassCurve.frobeniusTrace`) with its constant-coefficient and degree lemmas, and the F_7 examples, for Section 3;
- the exponents `kedlayaNegativeExponent`, `kedlayaPositiveExponent`, `latticeDefectExponent` and `tuitmanReconstructionPrecision`, with the p = 5 polynomial check of the corrected Lemma 3, for Section 4.

The constructions on tubes, PD envelopes, rigid and crystalline cohomology, dagger algebras and period rings have no carriers at the pins. Their API and test names are listed in the file's closing "Unstated interfaces" comment, under the names this document gives them.

## 1. The rigid–crystalline comparison, with coefficients

The parent plan states the comparison H^i_rig(X/K_0) ≅ H^i_crys(X/W) ⊗ K_0 (`RD.7/rigid-crystalline-comparison`) and its Frobenius compatibility, but recorded Berthelot's argument as a gap. The three nodes below supply it. The morphism is defined for every embedded X, through the closed tube of radius |p|^{1/p}; smoothness makes it a quasi-isomorphism by reduction to a lift; properness identifies the left side with rigid cohomology. The coefficient version is Ogus's theorem, whose proof is the same reduction (Shiho, Theorem 2.36). Its coefficients are F-crystals, or locally free convergent isocrystals in Shiho's form; a crystal without Frobenius structure need not have a convergent isocrystal.

#### Berthelot's comparison morphism from the tube to the completed PD envelope

**Construction.** Node `PadicDifferentialEquationsAndRigidCohomology:RD.7/tube-to-envelope-comparison-map`.
Proposed namespace `TauCeti.RigidCohomology`, module `TauCeti/RigidCohomology/CrystallineComparison`.

Let k be a perfect field of characteristic p, W = W(k), K_0 = W[1/p], X a separated k-scheme of finite type and i : X → P a closed immersion into a p-adic formal W-scheme P that is smooth over W in a neighbourhood of X. Let sp : ]X[_P → X be the specialisation map from the tube (RD.3/tube), 𝔦 ⊂ O_P the ideal of X (it contains p), D = D_P(X) the divided power envelope of 𝔦 compatible with the canonical divided powers of pW, and D̂ its p-adic completion, a sheaf of O_P-algebras supported on X. There is a unique morphism of sheaves of O_P-algebras c_{X,P} : sp_* O_{]X[_P} → D̂ ⊗_Z Q that is continuous on affine opens; it commutes with the derivations of O_P, so it induces a morphism of complexes of sheaves on X, c_{X,P} : sp_*Ω^•_{]X[_P} → D̂ ⊗_{O_P} Ω^•_{P/W} ⊗ Q (Berthelot's (1.9.2)). On an affine open U = Spf A of P on which 𝔦 is generated by f_1, …, f_r, the map factors through the closed tube of radius λ = |p|^{1/p}, whose ring of functions is A{T_1, …, T_r}/(f_j^p − pT_j) ⊗ Q, and sends T_j to (p − 1)!·f_j^{[p]}. No properness or smoothness of X is needed for the construction. With coefficients: for a locally free convergent isocrystal E on X over W, realised on ]X[_P as a module with integrable connection, let Φ(E) be its associated crystalline isocrystal (Shiho's functor) and Φ(E)_D its value on D̂, a D̂ ⊗ Q-module with integrable connection; the same recipe gives c_{X,P}(E) : sp_*(E ⊗ Ω^•_{]X[_P}) → Φ(E)_D ⊗_{O_P} Ω^•_{P/W}. For an F-crystal M, E is the convergent F-isocrystal of M (RD.3/restriction-to-convergent) and Φ(E) = M ⊗ Q. The coefficient is a convergent isocrystal, not an arbitrary crystal: the isocrystal of a crystal without Frobenius structure need not be convergent (RD.7/crystalline-rigid-comparison-with-coefficients, acceptance).

**Hypotheses.**

- k perfect of characteristic p; X separated of finite type over k.
- i : X → P closed immersion into a p-adic formal W-scheme P, smooth over W in a neighbourhood of X.
- Divided powers on 𝔦 are taken compatible with the canonical divided powers of (p) ⊂ W.

**API.**

- `RigidCohomology.tubeToEnvelope` (data): The morphism of sheaves of O_P-algebras c_{X,P} : sp_* O_{]X[_P} → D̂_P(X) ⊗ Q.
- `RigidCohomology.tubeToEnvelope_affine` (characterisation): On U = Spf A with 𝔦 = (p, f_1, …, f_r): c_{X,P} factors through A{T}/(f_j^p − pT_j) ⊗ Q and sends T_j to (p − 1)!·f_j^{[p]}.
- `RigidCohomology.tubeToEnvelope_unique` (extensionality): c_{X,P} is the only morphism of A ⊗ Q-algebras sp_*O_{]X[_P}(U) → D̂(U) ⊗ Q that is continuous for the natural topologies.
- `RigidCohomology.tubeToEnvelope_comm_deriv` (compatibility): c_{X,P} commutes with the derivations of O_P, and so induces a map of complexes sp_*Ω^•_{]X[_P} → D̂ ⊗ Ω^•_{P/W} ⊗ Q.
- `RigidCohomology.tubeToEnvelope_naturality` (functoriality): For a morphism u : P' → P with u ∘ i' = i, the two maps c_{X,P} and c_{X,P'} commute with the pullbacks of tubes and of PD envelopes along u; c is compatible with restriction to open formal subschemes of P.
- `RigidCohomology.tubeToEnvelope_lift` (example): If P is a smooth formal lift of X (so 𝔦 = pO_P), then D̂ = O_P, the tube is P_K and c_{X,P} is the identity.
- `RigidCohomology.tubeToEnvelope_coeff` (data): For a locally free convergent isocrystal E with associated crystalline isocrystal Φ(E) (value Φ(E)_D on D̂): a morphism of complexes sp_*(E ⊗ Ω^•) → Φ(E)_D ⊗ Ω^•, natural in E and equal to c_{X,P} for E = O.
- `RigidCohomology.tubeToEnvelope_cohomology` (compatibility): For X proper, the map induced on hypercohomology over X goes from H^*_rig(X/K_0, E) (RD.4/proper-rigid-equals-convergent) to the crystalline cohomology of Φ(E), which is H^*_crys(X/W, M) ⊗ K_0 when Φ(E) = M ⊗ Q for a crystal M (CrystallineCohomology:CR.2/smooth-ambient-comparison).

**Uses.**

- Berthelot, Finitude et pureté, Proposition 1.9: the map (1.9.2) whose hypercohomology is the comparison map H^*_rig(X/K) → H^*_crys(X/W) ⊗ K
- Shiho, Relative log convergent cohomology I, Theorem 2.36: the coefficient and log version whose quasi-isomorphism property is the convergent–crystalline comparison
- RD.7/comparison-map-quasi-isomorphism: the map shown to be a quasi-isomorphism for smooth X
- RD.7/crystalline-rigid-comparison-with-coefficients: the coefficient version, giving Ogus's comparison for proper smooth X
- RD.7/rigid-crystalline-comparison: supplies the comparison map whose isomorphism property the inherited theorem asserts

**Unit tests.**

- `RigidCohomology.tubeToEnvelope_point_in_disc` (computation): For X = Spec k ⊂ P = Spf W⟨t⟩, c sends t^n to n!·t^{[n]}, hence Σ b_n t^n (convergent on |t| < 1) to Σ b_n n!·t^{[n]}; the coefficients b_n n! tend to 0 because v_p(n!) = (n − s_p(n))/(p − 1), with s_p the sum of the p-adic digits.
- `RigidCohomology.tubeToEnvelope_lift_eq_id` (degenerate): For X = Spec k[t] with the lift P = Spf W⟨t⟩, the map is the identity of W⟨t⟩ ⊗ Q.
- `RigidCohomology.tubeToEnvelope_not_surjective` (non-example): For X = Spec k ⊂ Spf W⟨t⟩ the element Σ_k p^k t^{[p^k]} of D̂ is not in the image: as a power series it is Σ_k (p^k/(p^k)!) t^{p^k}, which diverges at points with |p|^{1/(p−1)} < |t| < 1, so the map is a quasi-isomorphism of de Rham complexes (for smooth X), not an isomorphism of rings.
- `RigidCohomology.tubeToEnvelope_compat_crystalline` (compatibility): For X = P^1_k embedded as the special fibre of the formal completion of P^1_W (a lift), the induced map H^*_rig(P^1/K_0) → H^*_crys(P^1/W) ⊗ K_0 is the identity of H^*_dR(P^1_{K_0}), an isomorphism K_0 → K_0 in degrees 0 and 2 and 0 → 0 in degree 1.

**Construction or proof.**

1. Affine description: on U = Spf A with 𝔦 = (p, f_1, …, f_r) the tube is the rigid subspace |f_j| < 1, and its functions restrict to the closed sub-tube |f_j| ≤ |p|^{1/p}, whose affinoid algebra is A{T}/(f_j^p − pT_j) ⊗ Q (Berthelot, Finitude, proof of Proposition 1.9).
2. Since f_j^p = p!·f_j^{[p]} in D, the assignment T_j ↦ (p − 1)!·f_j^{[p]} kills f_j^p − pT_j and defines an A-algebra map A[T]/(f_j^p − pT_j) → D; it extends to the p-adic completions and, after inverting p, to the stated map; uniqueness: it is the only continuous A ⊗ Q-algebra map between these rings (CrystallineCohomology:CR.0/pd-envelope, CR.0/completed-envelope). Berthelot states uniqueness on the closed tube; it holds on sp_*O_{]X[_P}(U) too, because A ⊗ Q is dense there: on each closed tube |f_j|^n ≤ |p|^m of an exhausting family the coordinate f_j^n/p^m already lies in A ⊗ Q, so A ⊗ Q is dense in each affinoid algebra and hence in their inverse limit.
3. The local maps agree on overlaps by uniqueness, so they glue to c_{X,P}; continuity gives compatibility with derivations, hence a map of de Rham complexes, and functoriality in (X, P) follows from uniqueness.
4. Coefficients: a locally free convergent isocrystal E is realised on ]X[_P as a module with integrable connection whose Taylor series converge on the tube of the diagonal; Shiho's functor Φ pulls it back along the canonical maps from the completed PD envelopes of X in P, P × P and P × P × P to the corresponding enlargements, and the value Φ(E)_D, a module with integrable connection on D̂ ⊗ Q (CrystallineCohomology:CR.1/taylor-equivalence), receives the module version of the same map, compatibly with the connections (Shiho, Relative log convergent cohomology I, §2, Proposition 2.35 and p. 31, constructs Φ and the log and relative version of the map 'by the same method' as his earlier paper). For an F-crystal M the convergent F-isocrystal E is supplied by RD.3/restriction-to-convergent, and Φ(E) = M ⊗ Q.

**Acceptance.**

- For X = Spec k inside P = Spf W⟨t⟩ (𝔦 = (p, t)), the map sends a function Σ b_n t^n on the open unit disc to Σ b_n n!·t^{[n]}.
- For a smooth affine X with a smooth formal lift P (𝔦 = pO_P), D̂ = O_P, ]X[_P = P_K and c_{X,P} is the identity of O_P ⊗ Q.

**Prerequisites.** `RD.3/tube`, `RD.3/restriction-to-convergent`, `RD.4/proper-rigid-equals-convergent`, `CrystallineCohomology:CR.0/pd-envelope`, `CrystallineCohomology:CR.0/completed-envelope`, `CrystallineCohomology:CR.1/crystal`, `CrystallineCohomology:CR.1/taylor-equivalence`, `CrystallineCohomology:CR.2/smooth-ambient-comparison`.

**Sources.**

- [P. Berthelot, Finitude et pureté cohomologique en cohomologie rigide (avec un appendice par A. J. de Jong)](https://web.archive.org/web/2016/https://perso.univ-rennes1.fr/pierre.berthelot/publis/Finitude.pdf), Proposition 1.9, proof, pp. 14–15 of the author's 1997 preprint. Constructs the map from functions on the tube, through the closed tube of radius p^{-1/p}, to the rationalised completed PD envelope by sending T_i to (p − 1)! times the p-th divided power of f_i, and shows it is unique, glues, commutes with derivations and is functorial without any properness hypothesis.
- [A. Shiho, Relative log convergent cohomology and relative rigid cohomology I](https://arxiv.org/abs/0707.1742v2), §2, Proposition 2.35 (the functor Φ) and the paragraph before Theorem 2.36, pp. 29–31 (arXiv v2). Constructs the functor Φ from locally free isocrystals on the log convergent site to isocrystals on the log crystalline site, through maps from completed log PD envelopes to universal enlargements, and gives the corresponding morphism from the log de Rham complex of a convergent isocrystal E on the tube to the log de Rham complex of Φ(E) on the p-adically completed log PD envelope, by the method of his earlier paper.

#### Berthelot's comparison morphism is a quasi-isomorphism for smooth X

**Theorem.** Node `PadicDifferentialEquationsAndRigidCohomology:RD.7/comparison-map-quasi-isomorphism`.

In the situation of RD.7/tube-to-envelope-comparison-map, assume X smooth over k. Then c_{X,P} : sp_*Ω^•_{]X[_P} → D̂ ⊗_{O_P} Ω^•_{P/W} ⊗ Q is a quasi-isomorphism of complexes of sheaves of K_0-vector spaces on X, and so is its version c_{X,P}(E) with coefficients in a locally free convergent isocrystal E, whose target is the de Rham complex of the crystalline isocrystal Φ(E) on D̂ (Shiho, Theorem 2.36). The induced isomorphism in the derived category does not depend on the embedding P, and is compatible with the canonical isomorphisms between two embeddings on each side. If X is in addition proper, taking hypercohomology on X gives the canonical isomorphism H^i_rig(X/K_0) ≅ H^i_crys(X/W) ⊗_W K_0 of RD.7/rigid-crystalline-comparison, now with its proof.

**Hypotheses.**

- X smooth separated of finite type over the perfect field k.
- i : X → P closed immersion into a p-adic formal W-scheme smooth near X.

**Construction or proof.**

1. The assertion is local on X and on P, so P = Spf A may be taken affine and X = Spec A/𝔦 affine and smooth.
2. Independence of the embedding on both sides, compatibly with c: for two embeddings X → P and X → P' compare both with the diagonal embedding in P × P'. On the tube side the projection ]X[_{P×P'} → ]X[_P is locally a fibration in open polydiscs (RD.3/weak-fibration-theorem) and the de Rham complex of an open polydisc is a resolution, which is the content of RD.4/independence-of-embedding; on the PD side, CrystallineCohomology:CR.2/smooth-ambient-comparison and CR.2/embedding-independence give the canonical quasi-isomorphisms at each finite level W_n, and the p-adic version is their derived limit, which equals D̂ ⊗ Ω^• because on affines the transition maps are surjective (CR.0/completed-envelope). Naturality of c in the embedding (API tubeToEnvelope_naturality) makes the squares commute.
3. Choose a smooth formal lift P' of the smooth affine X: lifts exist at every finite level because the obstructions lie in H^2(X, T_X) ⊗ I = 0 on an affine (SchemeAndStackFoundations:SF.4/deformations-of-smooth-schemes), and the compatible system defines a smooth affine formal scheme (Elkik's theorem is the usual citation; Kedlaya, Notes on isocrystals, Definition 2.1).
4. For the lift, 𝔦' = pO_{P'}, the PD envelope is O_{P'} itself (p has divided powers in W), the tube is P'_K, and c is the identity (API tubeToEnvelope_lift). By the previous two steps c_{X,P} is a quasi-isomorphism (Berthelot, Finitude, end of the proof of Proposition 1.9).
5. Coefficients: the same three steps apply with Φ(E)_D ⊗ Ω^• on the PD side (CrystallineCohomology:CR.2/smooth-ambient-comparison, applied to a crystal M of finite type with M ⊗ Q = Φ(E), for instance an F-crystal; Shiho's proof treats Φ(E) directly) and E ⊗ Ω^• on the tube side (RD.4/independence-of-embedding for the coefficient E); this is Shiho's proof of Theorem 2.36 with trivial log structures and base Spf W.
6. For X proper: RΓ_rig(X/K_0) = RΓ(X, sp_*Ω^•_{]X[_P}) because the strict neighbourhoods are the whole tube and R^q sp_* vanishes for q > 0 on the quasi-Stein inverse images of affines (RD.4/proper-rigid-equals-convergent; Berthelot, Finitude, proof of 1.9), and RΓ_crys(X/W) ⊗ Q = RΓ(X, D̂ ⊗ Ω^•) ⊗ Q because X is quasi-compact; take hypercohomology of the quasi-isomorphism. A non-embeddable proper X is handled by a finite Zariski cover by embeddable opens and Čech descent on both sides (CrystallineCohomology:CR.3/crystalline-descent; RD.4/rigid-cohomology).

**Acceptance.**

- X = A^1_k with the lift P = Spf W⟨t⟩: c is the identity and both sides compute the de Rham cohomology of the Tate algebra K_0⟨t⟩, whose H^1 is infinite-dimensional (the form Σ_k p^k t^{p^{2k}−1}dt has formal primitive with coefficients p^{−k}, so it is not exact); this is why the rigid form of the comparison needs X proper.
- X = P^1_k: H^0 = K_0, H^1 = 0, H^2 = K_0 on both sides; with the embedding of P^1_k as the special fibre of the formal completion of P^1_W the map c is the identity, so the comparison is the identity of H^*_dR(P^1_{K_0}) (unit test tubeToEnvelope_compat_crystalline).
- The map is a quasi-isomorphism without being an isomorphism of complexes: for X = Spec k ⊂ Spf W⟨t⟩ the degree-zero terms differ (API test tubeToEnvelope_not_surjective), yet both complexes resolve K_0.

**Prerequisites.** `RD.7/tube-to-envelope-comparison-map`, `RD.3/weak-fibration-theorem`, `RD.4/independence-of-embedding`, `RD.4/proper-rigid-equals-convergent`, `RD.4/rigid-cohomology`, `CrystallineCohomology:CR.2/smooth-ambient-comparison`, `CrystallineCohomology:CR.2/embedding-independence`, `CrystallineCohomology:CR.0/completed-envelope`, `CrystallineCohomology:CR.3/crystalline-descent`, `SchemeAndStackFoundations:SF.4/deformations-of-smooth-schemes`.

**Sources.**

- [P. Berthelot, Finitude et pureté cohomologique en cohomologie rigide (avec un appendice par A. J. de Jong)](https://web.archive.org/web/2016/https://perso.univ-rennes1.fr/pierre.berthelot/publis/Finitude.pdf), Proposition 1.9 and its proof, pp. 14–15 of the author's 1997 preprint. States the canonical isomorphism between rigid and crystalline cohomology for proper smooth X over k with a Cohen ring W, and proves it by reducing to the case of a smooth affine lift, using that both sides are independent of the embedding and that the map is functorial in it.
- [A. Shiho, Relative log convergent cohomology and relative rigid cohomology I](https://arxiv.org/abs/0707.1742v2), Theorem 2.36 and its proof, p. 31 (arXiv v2). The convergent–crystalline comparison for log smooth X with a locally free convergent isocrystal is proved by the same reduction: independence of the embedding on both sides, then the case where the embedding is a lift, where the two complexes coincide.
- [K. S. Kedlaya, Notes on isocrystals](https://arxiv.org/abs/1606.01321v6), Definition 2.1, p. 2. Smooth affine varieties admit smooth affine formal lifts over W(k) (Elkik, Arabia), which the notes use to describe convergent F-isocrystals.

#### Ogus's comparison: crystalline cohomology of an F-crystal versus rigid cohomology of its isocrystal

**Theorem.** Node `PadicDifferentialEquationsAndRigidCohomology:RD.7/crystalline-rigid-comparison-with-coefficients`. Planet: *Ogus comparison with coefficients*.

Let k be a perfect field of characteristic p, W = W(k), K_0 = W[1/p], X a smooth proper k-scheme and (M, Φ) an F-crystal of finite locally free O_{X/W}-modules relative to the Witt vector Frobenius σ (CrystallineCohomology:CR.1/crystal, CR.3/frobenius-map). Let E be the associated convergent F-isocrystal (RD.3/restriction-to-convergent: F-crystals up to isogeny and convergent F-isocrystals correspond, Kedlaya, Notes, Theorem 2.2); because X is proper it is an overconvergent F-isocrystal. Then there are canonical isomorphisms H^i_crys(X/W, M) ⊗_W K_0 ≅ H^i_rig(X/K_0, E) for every i, functorial in (M, Φ) and in X, compatible with finite extensions K/K_0 (RD.4/finite-flat-base-change), and carrying the σ-semilinear crystalline Frobenius to the Frobenius of RD.4/frobenius-on-rigid-cohomology; for k = F_q, q = p^f, the K_0-linear map φ^f on the left corresponds to the linear q-Frobenius F of RD.6/linear-q-frobenius. For M = O_{X/W} this is RD.7/rigid-crystalline-comparison together with RD.7/frobenius-compatibility-of-comparison. Without Frobenius structures the same isomorphism, functorial in E, holds for a crystal M of finite locally free modules whose isocrystal M ⊗ Q is Φ(E) for a locally free convergent isocrystal E (Shiho, Theorem 2.36, with the identification of convergent and rigid cohomology for proper X); not every crystal is of this form, because the isocrystal of a crystal need not be convergent (acceptance tests). Properness is used only to identify the convergent cohomology of E with its rigid cohomology; the crystalline–convergent isomorphism itself holds for smooth X (Ogus; Shiho, Theorem 2.36), while for non-proper X crystalline cohomology is not finite and is not the right comparison object (Kedlaya, Notes on isocrystals, Remark 8.5).

**Hypotheses.**

- k perfect; X smooth and proper over k.
- (M, Φ) an F-crystal of finite locally free O_{X/W}-modules relative to σ; E its convergent (hence overconvergent) F-isocrystal.
- Frobenius-free variant: M a crystal of finite locally free modules with M ⊗ Q = Φ(E) for a locally free convergent isocrystal E; the Frobenius clause is then dropped.

**Construction or proof.**

1. Choose a finite Zariski cover of X by opens admitting closed immersions into p-adic formal W-schemes smooth near them; rigid cohomology of E is computed on the tubes because X is proper (RD.4/proper-rigid-equals-convergent, RD.4/rigid-cohomology), and crystalline cohomology of M by the completed PD envelopes (CrystallineCohomology:CR.2/smooth-ambient-comparison).
2. The coefficient version of Berthelot's morphism (RD.7/tube-to-envelope-comparison-map, API tubeToEnvelope_coeff) is a quasi-isomorphism (RD.7/comparison-map-quasi-isomorphism); glue by Čech descent and take hypercohomology.
3. Functoriality in (M, Φ), or in E for the Frobenius-free variant, is that of the evaluation of crystals and of Φ; base change to K uses RD.4/finite-flat-base-change.
4. Frobenius: the absolute Frobenius of X over σ induces the crystalline Frobenius (CrystallineCohomology:CR.3/frobenius-map) and, through any Frobenius lift on the embeddings, the rigid Frobenius (RD.4/frobenius-on-rigid-cohomology, independent of the lift by RD.4/frobenius-independent-of-lift); naturality of the comparison morphism for morphisms of pairs lying over σ identifies them. Over F_q, σ^f = id on W(F_q), so φ^f is linear and equals F (RD.6/linear-q-frobenius).

**Acceptance.**

- M = O_{X/W}: the theorem is the inherited rigid–crystalline comparison; for X = P^1 both sides are K_0, 0, K_0 with Frobenius 1, ·, p·σ.
- Rank-one F-crystal on X = Spec F_p: M = W with Φ = p^a gives H^0_crys = Z_p with Frobenius p^a and H^0_rig = Q_p with Frobenius p^a.
- Non-example: for X = A^1_k (not proper) H^1_crys(A^1/W) ⊗ Q is the de Rham H^1 of K_0⟨t⟩, which is infinite-dimensional (the form Σ_k p^k t^{p^{2k}−1}dt is not exact), whereas H^1_rig(A^1/K_0) = 0; properness cannot be dropped from the rigid form.
- Why the coefficient must be convergent: on X = G_m over W = W(F_{p^2}), let μ ∈ W with μ mod p ∉ F_p and a = pμ. The rank-one module W⟨t, t^{−1}⟩ with ∇ = d + a·dt/t is a crystal, since ∇_{d/dt}^n(1) = a(a − 1)⋯(a − n + 1)·t^{−n} tends to 0 p-adically (each multiple of p among 0, …, n − 1 contributes a factor of valuation 1), so the connection is topologically quasi-nilpotent. Its Taylor series Σ_n binom(a, n)(ξ/t)^n converges only for |ξ| < |p|^{1/(p(p−1))}: v_p(binom(a, n)) = 1 + ⌊(n − 1)/p⌋ − v_p(n!), which is about −n/(p(p − 1)). So it does not converge on the whole tube |ξ| < 1 of the diagonal, and the isocrystal of this crystal is not convergent. X is not proper here; the example shows only that crystals do not all give convergent isocrystals, which is why the theorem takes an F-crystal or a convergent isocrystal.

**Prerequisites.** `RD.7/tube-to-envelope-comparison-map`, `RD.7/comparison-map-quasi-isomorphism`, `RD.7/rigid-crystalline-comparison`, `RD.7/frobenius-compatibility-of-comparison`, `RD.3/restriction-to-convergent`, `RD.4/proper-rigid-equals-convergent`, `RD.4/rigid-cohomology`, `RD.4/finite-flat-base-change`, `RD.4/frobenius-on-rigid-cohomology`, `RD.4/frobenius-independent-of-lift`, `RD.6/linear-q-frobenius`, `CrystallineCohomology:CR.1/crystal`, `CrystallineCohomology:CR.2/smooth-ambient-comparison`, `CrystallineCohomology:CR.3/frobenius-map`.

**Sources.**

- [K. S. Kedlaya, Notes on isocrystals](https://arxiv.org/abs/1606.01321v6), Theorem 8.3, p. 20, with Theorem 2.2, p. 2 and Remark 8.5, p. 20. For X smooth proper and a crystal of finite modules whose isocrystal carries a Frobenius structure, rational crystalline cohomology equals rigid cohomology of the corresponding (over)convergent F-isocrystal; the proof is referred to Ogus's convergent topos paper. Remark 8.5 notes that without properness the convergent statement survives but crystalline cohomology is no longer finite.
- [A. Shiho, Relative log convergent cohomology and relative rigid cohomology I](https://arxiv.org/abs/0707.1742v2), Theorem 2.36 and Corollary 2.37, p. 31 (arXiv v2); Introduction, p. 1. Proves, in the relative log setting, that convergent cohomology of a locally free convergent isocrystal is quasi-isomorphic to crystalline cohomology of the associated crystalline isocrystal, and recalls that Ogus proved the absolute convergent–crystalline comparison for smooth X and the convergent–rigid comparison for proper smooth X.
- [H. Guo and E. Reinecke, A prismatic approach to crystalline local systems](https://arxiv.org/abs/2203.09490v3), Theorem 6.13 and its proof, arXiv v3, PDF p. 60. Uses exactly this comparison (Ogus over a point, Shiho in general) to identify rational crystalline pushforwards with convergent F-isocrystals.

## 2. Weight separation and the integrality of the Weil factors

The parent node `RD.7/weil-factors-rational-and-integral` deduces that each rigid Weil factor P_i lies in 1 + tZ[t] from purity (`RD.6/purity-smooth-proper`) and a local weight-separation argument; `RD.7/ell-adic-comparison-smooth-projective` uses the same argument to identify the rigid and ℓ-adic factors. That argument is planned here as two statements about power series and Weil numbers, independent of any cohomology theory: rationality descends from any field to Q and has an integral normalised presentation (Fatou), and a factorisation of a rational integral series into pure factors of distinct weights is unique, rational and integral (Deligne, Weil I, proof of (1.7) ⇒ (1.6)).

#### Rational power series descend to Q and have integral normalised numerator and denominator (Fatou)

**Lemma.** Node `PadicDifferentialEquationsAndRigidCohomology:RD.7/rational-zeta-descent-and-fatou`.

(a) Descent of rationality. Let k ⊂ L be fields and f ∈ k[[t]]. If there are A, B ∈ L[t] with B(0) ≠ 0 and Bf = A in L[[t]], then there are such A, B in k[t]; that is, k[[t]] ∩ L(t) = k(t) inside L((t)). (b) Local Fatou. Let ℓ be a prime (ℓ = p allowed), f ∈ 1 + tZ_ℓ[[t]], and G, H ∈ Q_ℓ[t] coprime with G(0) = H(0) = 1 and Hf = G. Then G, H ∈ Z_ℓ[t]. (c) Global Fatou. If f ∈ 1 + tZ[[t]] lies in Q(t), there are unique coprime A, B ∈ 1 + tZ[t] with f = A/B; the reciprocal roots of A and of B are algebraic integers. The equality is in Q[[t]], and A, B do not depend on any auxiliary field in which f was first shown to be rational.

**Hypotheses.**

- (a): any field extension k ⊂ L.
- (b): f has ℓ-adically integral coefficients and constant term 1; G, H coprime with constant term 1.
- (c): f has integer coefficients and constant term 1.

**Construction or proof.**

1. (a) Bf = A with deg A ≤ N, deg B ≤ M is a system of linear equations over k in the coefficients of A and B (the vanishing of the Hankel determinants of order > M of the coefficient sequence of f beyond degree N); a system with coefficients in k that has a nonzero solution over L has one over k, and B(0) ≠ 0 may be arranged after cancelling a power of t (Deligne, Weil I, proof of (1.7) ⇒ (1.6), p. 276; Milne, Lemma 27.9).
2. (b) Work in a finite extension of Q_ℓ splitting H with the extended absolute value. If a reciprocal root α of H had |α| > 1, then α^{−1} lies in the open unit disc, where f converges because its coefficients are bounded by 1, and evaluating Hf = G at α^{−1} gives G(α^{−1}) = 0, contradicting coprimality. So the reciprocal roots of H have absolute value at most 1; since 1/f ∈ 1 + tZ_ℓ[[t]] and (1/f)G = H, the same holds for G. Elementary symmetric functions of elements of absolute value ≤ 1 have absolute value ≤ 1 (Milne, Lemma 27.10, with the non-strict inequality at the boundary).
3. (c) Write f = A/B in lowest terms over Q with A(0) = B(0) = 1 (possible since f(0) = 1 and B(0) ≠ 0 after (a)); apply (b) at every prime ℓ to get A, B ∈ Z_ℓ[t] for all ℓ, hence A, B ∈ Z[t]. Reciprocal roots of a polynomial in 1 + tZ[t] are roots of its reverse, a monic integer polynomial, hence algebraic integers (Deligne, Weil I, p. 276, 'lemme de Fatou').

**Acceptance.**

- Z(P^1_{F_q}, t) = 1/((1 − t)(1 − qt)): A = 1, B = (1 − t)(1 − qt) ∈ 1 + tZ[t].
- Integrality cannot be dropped: f = 1/(1 − t/2) ∈ 1 + tQ[[t]] is rational with denominator 1 − t/2 ∉ Z[t].
- Coprimality cannot be dropped in (b): G = H = 1 − t/ℓ with f = 1 shows that a non-reduced presentation need not be integral.
- Boundary case: f = 1/(1 − t) ∈ 1 + tZ_ℓ[[t]] has a reciprocal root of absolute value exactly 1, so the bound in (b) is ≤ 1, not < 1.

**Prerequisites.** `mathlib:PowerSeries.ext`, `mathlib:IsIntegrallyClosed.eq_map_mul_C_of_dvd`.

**Sources.**

- [P. Deligne, La conjecture de Weil. I](http://www.numdam.org/item/PMIHES_1974__43__273_0/), §1, proof of (1.7) ⇒ (1.6), pp. 276–277. Shows by Hankel determinants that the integral zeta series, rational over Q_ℓ, is rational over Q, and invokes Fatou's lemma to make the coprime integral numerator and denominator have constant term 1.
- [J. S. Milne, Lectures on étale cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Lemma 27.9 and proof, pp. 156–157; Lemma 27.10 and proof, p. 158 (v2.21). Lemma 27.9: rationality over a larger field descends to the smaller field (via Bourbaki's exercise). Lemma 27.10: coprime normalised numerator and denominator of an ℓ-adically integral rational series are ℓ-adically integral.

#### Weight separation: pure factors of a rational zeta function are unique, rational and integral

**Theorem.** Node `PadicDifferentialEquationsAndRigidCohomology:RD.7/weight-separated-factor-extraction`. Planet: *Weight separation of Weil factors*.

Let q > 1 be an integer and R ∈ 1 + tZ[[t]] ∩ Q(t), written R = A/B with A, B ∈ 1 + tZ[t] coprime (RD.7/rational-zeta-descent-and-fatou). Let L be a field of characteristic 0 with algebraic closure L̄ and P_0, …, P_N ∈ 1 + tL[t] with ∏_{i=0}^{N} P_i^{(−1)^{i+1}} = R in L[[t]], such that every reciprocal root of P_i in L̄ is algebraic over Q and a Weil q-number of weight i (DeligneWeightsAndPurity:DWP.0/weil-q-number). Then: (1) the P_i are pairwise coprime, and A = ∏_{i odd} P_i, B = ∏_{i even} P_i in L[t]; (2) for each i there is a unique Π_i ∈ 1 + tZ[t] whose image in L[t] is P_i, namely Π_i = ∏(1 − αt)^{m(α)}, the product over the reciprocal roots α of A (i odd) or B (i even) that are Weil q-numbers of weight i, with their multiplicities m(α) as roots; (3) the reciprocal roots of Π_i are algebraic integers and deg Π_i = deg P_i; (4) if (P'_i) is a second family over another field L' of characteristic 0 with the same R and the same purity property, then P_i and P'_i are images of the same Π_i. The integrality in (2)–(3) comes from Fatou's lemma and the separation of weights, not from the alternating product alone; without purity, cancellation between degrees can occur and the factors are not determined by R.

**Hypotheses.**

- q > 1 an integer; R ∈ 1 + tZ[[t]] rational.
- L a field of characteristic 0; P_i ∈ 1 + tL[t] with alternating product R.
- Every reciprocal root of P_i is a Weil q-number of weight i (all complex conjugates of absolute value q^{i/2}).

**Construction or proof.**

1. Weights separate: a Weil q-number has a unique weight (DWP.0/weil-q-number), so P_i and P_j have no common root for i ≠ j; hence ∏_{i odd} P_i and ∏_{i even} P_i are coprime and their quotient is a reduced presentation of R over L. Comparing with the reduced presentation A/B over Q (both normalised by constant term 1) gives (1).
2. Let K ⊂ L̄ be the splitting field over Q of AB. The set of reciprocal roots of AB of weight i, with multiplicities, is stable under Gal(K/Q), because being a Weil q-number of weight i depends only on the minimal polynomial over Q (DWP.0/weil-q-number). So the coefficients of Π_i are fixed by Gal(K/Q) and lie in Q (mathlib:IsGalois.mem_range_algebraMap_iff_fixed).
3. The reverse of Π_i is a monic factor in Q[T] of the monic integral reverse of A or B, so by Gauss's lemma it has integer coefficients (mathlib:IsIntegrallyClosed.eq_map_mul_C_of_dvd); equivalently its roots are algebraic integers by RD.7/rational-zeta-descent-and-fatou (c).
4. Uniqueness and (4): Π_i is described by R alone, so any second pure family gives the same polynomials (Deligne, Weil I, end of the proof of (1.7) ⇒ (1.6), p. 277).

**Acceptance.**

- X = P^1_{F_q}: R = 1/((1 − t)(1 − qt)), P_0 = 1 − t (weight 0), P_1 = 1, P_2 = 1 − qt (weight 2).
- Elliptic curve E/F_7, y^2 = x^3 + x + 1: R = (1 − 3t + 7t^2)/((1 − t)(1 − 7t)) and Π_1 = 1 − 3t + 7t^2, whose roots have absolute value 7^{−1/2}.
- Purity is needed: P_0 = 1, P_1 = P_2 = 1 − 2t give the alternating product R = 1, as do P_0 = P_1 = P_2 = 1, so R does not determine the factors; the hypothesis excludes this because 2 cannot be a Weil q-number of weight 1 and of weight 2.
- Genus-two curve y^2 = x^5 + x + 3 over F_7: Π_1 = 1 + 3t + 7t^2 + 21t^3 + 49t^4 (PARI/GP hyperellcharpoly), with all roots of absolute value 7^{−1/2}.

**Prerequisites.** `RD.7/rational-zeta-descent-and-fatou`, `DeligneWeightsAndPurity:DWP.0/weil-q-number`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`, `mathlib:IsGalois.mem_range_algebraMap_iff_fixed`, `mathlib:IsIntegrallyClosed.eq_map_mul_C_of_dvd`.

**Sources.**

- [P. Deligne, La conjecture de Weil. I](http://www.numdam.org/item/PMIHES_1974__43__273_0/), §1, proof of (1.7) ⇒ (1.6), pp. 276–277. From purity of every eigenvalue the factors P_i are pairwise coprime, so the cohomological product is already reduced; each factor's roots are the roots of the reduced numerator or denominator with the right absolute value, a Galois-stable set, so the factor has rational, then (Gauss, or integrality of the reciprocal roots) integral coefficients independent of the cohomology theory.
- [J. S. Milne, Lectures on étale cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), 27.14(c)–(d), p. 159 (v2.21). Summary statement that the factors P_i are integral and independent of ℓ once purity holds.
- [K. S. Kedlaya, Fourier transforms and p-adic 'Weil II'](https://arxiv.org/abs/math/0210149v3), §6.6, statement (c) and its proof, pp. 51–52. Deduces from rigid Weil II (Theorem 6.6.2) and Poincaré duality that H^i_rig of a smooth proper variety is ι-pure of weight i for every ι, the purity input that this theorem turns into integral, realisation-independent factors.

## 3. Abelian varieties: the crystalline Frobenius polynomial

This is the degree-one form of the Katz–Messing comparison, with every convention pinned: which Tate module, which Frobenius, which dual. It is the statement p-adic Hodge theory consumes at a prime of good reduction and the one D'Addezio and Calegari–Geraghty use. It is proved here by weight separation from the zeta function of the abelian variety, without the Katz–Messing argument.

#### The crystalline Frobenius polynomial of an abelian variety is its Weil polynomial

**Theorem.** Node `PadicDifferentialEquationsAndRigidCohomology:RD.7/abelian-variety-crystalline-frobenius-polynomial`.

Let A be an abelian variety of dimension g over F_q, q = p^f, W = W(F_q), K_0 = W[1/p], π_A ∈ End(A) its q-Frobenius endomorphism (DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field) and P_A(T) = det(T − V_ℓπ_A | V_ℓA) ∈ Z[T] its characteristic polynomial, independent of ℓ ≠ p (AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module). Conventions: V_ℓA is the covariant rational Tate module, on which π_A acts as the arithmetic Frobenius x ↦ x^q of Gal(F̄_q/F_q) acts on torsion points; H^1_et(A_{F̄_q}, Q_ℓ) = Hom(V_ℓA, Q_ℓ), on which the geometric Frobenius acts as the transpose of V_ℓπ_A; φ is the σ-semilinear crystalline Frobenius on the contravariant H^1_crys(A/W). Then: (1) the K_0-linear map φ^f on H^1_crys(A/W) ⊗ K_0 has characteristic polynomial P_A(T), so P_1(A, t) := det(1 − tφ^f | H^1_crys(A/W) ⊗ K_0) = t^{2g}P_A(1/t) = det(1 − t·Frob_q | H^1_et(A_{F̄_q}, Q_ℓ)); (2) for every i, det(1 − tφ^f | H^i_crys ⊗ K_0) = ∏_{|I| = i}(1 − α_I t), where α_1, …, α_{2g} are the roots of P_A and α_I = ∏_{j ∈ I} α_j; (3) for an elliptic curve E given by a Weierstrass model over F_q, P_1(E, t) = 1 − a t + q t^2 with a = q + 1 − #E(F_q) the Frobenius trace (tauceti:WeierstrassCurve.frobeniusTrace). No inversion of the Frobenius and no dualisation changes the characteristic polynomial: transposition preserves it, and the geometric/arithmetic dictionary is absorbed by the contravariance of H^1.

**Hypotheses.**

- A an abelian variety over F_q, q = p^f; ℓ ≠ p.
- Crystalline Frobenius taken relative to the Witt vector Frobenius σ of W(F_q), so φ^f is K_0-linear.

**Construction or proof.**

1. Weil numbers: P_A ∈ Z[T] is independent of ℓ (AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module) and its roots α_1, …, α_{2g} are Weil q-numbers of weight 1 (DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties); so each α_I is a Weil q-number of weight |I| (DWP.0/weil-number-arithmetic).
2. Zeta function: Z(A, t) = ∏_{r=0}^{2g} P_r(t)^{(−1)^{r+1}} with P_r(t) = ∏_{|I|=r}(1 − α_I t) ∈ 1 + tZ[t] (DWP.1/point-counts-of-abelian-varieties); this is a family over Q whose degree-r factor is pure of weight r.
3. Crystalline side: A is smooth and proper, so Z(A, t) = ∏_i P_i(A, t)^{(−1)^{i+1}} with P_i(A, t) = det(1 − tF | H^i_rig(A/K)) = det(1 − tφ^f | H^i_crys(A/W) ⊗ K_0) (RD.7/rigid-zeta-expression, RD.7/frobenius-compatibility-of-comparison), and the reciprocal roots of P_i(A, t) are Weil q-numbers of weight i (RD.7/weil-factors-rational-and-integral). Weight separation (RD.7/weight-separated-factor-extraction (4)) applied to the two pure families gives P_i(A, t) = P_i for every i. This is (2); for i = 1 it gives P_1(A, t) = ∏_j(1 − α_j t) = t^{2g}P_A(1/t), which is (1) on the crystalline side.
4. ℓ-adic side: H^1_et(A_{F̄_q}, Q_ℓ) ≅ Hom(V_ℓA, Q_ℓ) Frobenius-equivariantly, with geometric Frobenius the transpose of V_ℓπ_A (request to ArithmeticGaloisRepresentations:R01.6); a transpose has the same characteristic polynomial, so det(1 − t·Frob_q | H^1_et) = t^{2g}P_A(1/t), which completes (1). The equality of crystalline and ℓ-adic factors in every degree is also Katz–Messing's theorem (RD.7/ell-adic-comparison-smooth-projective); this proof does not use it.
5. Elliptic curves: P_A(T) = T^2 − aT + q with a = Tr π_A = q + 1 − deg(1 − π_A) = q + 1 − #E(F_q) (DWP.1/point-counts-of-abelian-varieties), which is Tau Ceti's WeierstrassCurve.frobeniusTrace for an elliptic model (WeierstrassCurve.frobeniusTrace_eq_card_point).

**Acceptance.**

- y^2 = x^3 + x + 1 over F_7: #E(F_7) = 5, a = 3, P_1 = 1 − 3t + 7t^2; the crystalline polynomial T^2 − 3T + 7 has a unit root in Z_7 (E ordinary).
- y^2 = x^3 + x over F_5: #E(F_5) = 4, a = 2, slopes 0 and 1; y^2 = x^3 − x over F_3: a = 0, φ has characteristic polynomial T^2 + 3 with slopes 1/2, 1/2 (agreeing with CrystallineCohomology:CR.3/elliptic-frobenius).
- Supersingular y^2 = x^3 + x over F_7 and its base change to F_49: P_1 = 1 + 7t^2 and (1 + 7t)^2.
- Degenerate g = 0 (A = Spec F_q): H^0 only, P_0 = 1 − t.

**Prerequisites.** `RD.7/rigid-zeta-expression`, `RD.7/weil-factors-rational-and-integral`, `RD.7/weight-separated-factor-extraction`, `RD.7/frobenius-compatibility-of-comparison`, `DeligneWeightsAndPurity:DWP.1/frobenius-endomorphism-over-a-finite-field`, `DeligneWeightsAndPurity:DWP.1/weil-estimate-for-abelian-varieties`, `DeligneWeightsAndPurity:DWP.1/point-counts-of-abelian-varieties`, `DeligneWeightsAndPurity:DWP.0/weil-number-arithmetic`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`, `ArithmeticGaloisRepresentations:R01.6`, `tauceti:WeierstrassCurve.frobeniusTrace`.

**Sources.**

- [M. D'Addezio, Parabolicity conjecture of F-isocrystals](https://arxiv.org/abs/2012.12879v4), proof of Theorem 5.1.6, p. 25 (arXiv v4). Uses that the overconvergent F-isocrystal R^1f_crys,*O of an abelian scheme is pure, by the Riemann hypothesis for abelian varieties (the crystalline Frobenius eigenvalues on H^1 of each fibre are Weil numbers of weight 1), and that the linear Frobenius on the crystalline cohomology of a fibre is semisimple because it is central in its endomorphism algebra.
- [K. S. Kedlaya, Fourier transforms and p-adic 'Weil II'](https://arxiv.org/abs/math/0210149v3), §1.1, p. 3. Records that Chiarellotto's rigid version of Weil II is not purely p-adic because it rests on Katz and Messing's crystalline version of the Weil conjectures, which in turn rests on Deligne. The node is the degree-one case of that comparison for abelian varieties; here it is obtained from weight separation instead.

## 4. Certified point counting: Kedlaya and Tuitman

The parent node `RD.7/kedlaya-point-counting-certification` states Kedlaya's algorithm for hyperelliptic curves with its reconstruction bound, and recorded as gaps the corrected Lemma 3 and the integrality of the Frobenius matrix on the basis x^i dx/y. Both are planned here from Kedlaya's errata note and Edixhoven's course notes; the answer to the second is that the matrix is not integral in general, but its denominators are bounded by p^{⌊log_p(2g−1)⌋} because the crystalline lattice has bounded index. Tuitman's algorithm extends the method to every curve with a map to P^1 and certifies the working precision; it is the algorithm the explicit quadratic Chabauty computations of Balakrishnan, Dogra, Müller, Tuitman and Vonk rely on.

#### Denominator bounds in the reduction of hyperelliptic differentials (Kedlaya Lemma 2, corrected Lemma 3)

**Lemma.** Node `PadicDifferentialEquationsAndRigidCohomology:RD.7/kedlaya-reduction-denominators`.

Let p be odd, q = p^n, Z_q = W(F_q), Q ∈ Z_q[x] monic of degree d = 2g + 1 with squarefree reduction, and A† the dagger algebra of the affine curve y^2 = Q(x) with the Weierstrass points removed (y invertible). The minus part H^1(A†)^− of its Monsky–Washnitzer cohomology has basis x^i dx/y, 0 ≤ i ≤ 2g − 1 (Edixhoven, Proposition 4.3.2). (a) (Kedlaya, Lemma 2; Edixhoven, Lemma 4.3.4.) For m ≥ 0 and B ∈ Z_q[x] of degree ≤ 2g, write B dx/y^{2m+1} = b dx/y + dφ with deg b ≤ 2g and φ = Σ_{j=1}^{m} F_j(x)/y^{2j−1}, deg F_j ≤ 2g; then p^{⌊log_p(2m+1)⌋}·b and p^{⌊log_p(2m+1)⌋}·F_j have coefficients in Z_q. (b) (Corrected Lemma 3; Edixhoven, Lemma 4.3.5; Harvey §4.) For m ≥ 0 and B ∈ Z_q[x] of degree ≤ 2g, write B·y^{2m+1} dx = b dx/y + dφ with deg b ≤ 2g and φ = Σ_{j=1}^{m+1} F_j(x)y^{2j−1}; then multiplication by p^{⌊log_p((2g+1)(2m+3) − 2)⌋} makes b and the F_j integral. Equivalently, for F(x)y^e dx with e > 0 odd the factor is p^{⌊log_p((2g+1)(e+2) − 2)⌋}. (c) Removing the remaining x^{2g} dx/y with the exact form dy = (Q'/2) dx/y divides by d = 2g + 1 and costs a further factor p^{v_p(2g+1)}. The bound printed as Lemma 3 in the source, p^{⌊log_p(2m+1)⌋}, is false, and so is the errata's replacement read literally in that lemma's indexing (sourceIssues E701).

**Hypotheses.**

- p odd; Q monic of degree 2g + 1 over Z_q with squarefree reduction modulo p.
- B ∈ Z_q[x] of degree at most 2g; m ≥ 0.

**Construction or proof.**

1. Negative powers: the poles of φ lie at the Weierstrass points T_i = (r_i, 0), where y is a uniformiser; expand dφ in y with integral coefficients for negative exponents, integrate termwise, and note that the denominators are the odd exponents of y down to −(2m+1); since the r_i are distinct modulo p, integrality of F_m(r_i) for all i forces integrality of F_m, and descending induction gives the rest (Kedlaya, proof of Lemma 2; Edixhoven, proof of 4.3.4).
2. Positive powers: the only pole is ∞, where v_∞(x) = −2, v_∞(y) = −d and z = x^{(d−1)/2}/y is a uniformiser with ι(z) = −z; expand dφ in z, whose coefficients are integral in exponents ≤ −d, integrate, and bound the denominators j + 1 by |j + 1| ≤ dm' + d − 2 for the even exponent m' = 2m + 2; the valuations v_∞(x^i y^j), 0 ≤ i < d, are distinct, which separates the F_j (Edixhoven, proof of 4.3.5).
3. The last reduction uses dy and divides by the leading coefficient d of Q' (Edixhoven, p. 17).
4. These bounds are what the working precision of the parent's RD.7/kedlaya-point-counting-certification (its items (iv)–(v)) absorbs. That node consumes this one, so it is not a prerequisite here (Harvey, §4, proof of Proposition 2, uses (b) with e = −p(2k + 1) + 2j).

**Acceptance.**

- Q = x^3 + x + 1, p = 5 (good reduction: disc = −31), m = 0: y dx = Q dx/y reduces to (2/5 x + 3/5) dx/y + d((2/5)xy), so the factor 5 = 5^{⌊log_5 7⌋} of (b) is needed, while the printed Lemma 3 (factor 5^{⌊log_5 1⌋} = 1) and the errata formula with m = 0 (factor 5^{⌊log_5 1⌋} = 1) both fail (exact computation with rational arithmetic).
- m = 0 in (a): B dx/y with deg B ≤ 2g − 1 is already reduced and needs no factor (p^{⌊log_p 1⌋} = 1).
- For p > (2g + 1)(2m + 3) − 2 every factor in (a)–(b) is 1, matching the observation that large p needs no extra precision.

**Prerequisites.** `RD.4/mw-comparison-for-affine-curves`, `RD.6/gysin-sequence-for-curves`.

**Sources.**

- [K. S. Kedlaya, Counting points on hyperelliptic curves using Monsky–Washnitzer cohomology](https://arxiv.org/abs/math/0105031v2), Lemma 2 and its proof, Lemma 3 as printed, p. 5 (arXiv v2). Lemma 2 bounds the denominators in reducing A(x)dx/y^{2m+1} by p^{⌊log_p(2m+1)⌋} through expansions at the Weierstrass points; Lemma 3 asserts the same bound for A(x)y^{2m+1}dx without proof.
- [K. S. Kedlaya, Comments/errata for 'Counting points on hyperelliptic curves using Monsky–Washnitzer cohomology'](https://kskedlaya.org/papers/hyperell-errata.pdf), list of errata, p. 1–2 (13 October 2003). Replaces 2m + 1 by d(m + 1) − 2 at the journal's page 331, line 8, and records Edixhoven's remark that the Frobenius matrix on the monomial basis is not integral.
- [B. Edixhoven, Point counting after Kedlaya (EIDMA-Stieltjes Graduate course, Leiden, 22–26 September 2003)](https://www.math.leidenuniv.nl/~edix/oww/mathofcrypt/carls_edixhoven/kedlaya.pdf), Proposition 4.3.2, p. 12; Lemma 4.3.4, p. 13; Lemma 4.3.5, p. 14; §5.2, p. 17. Proves the basis statement, the negative-power bound p^{⌊log_p(m−1)⌋} for ay^{−m}dx/y (m even) and the positive-power bound p^{⌊log_p(dm+d−2)⌋} for ay^m dx/y (m even) by local expansions at the Weierstrass points and at infinity, and notes the extra division by d in the last step.
- [D. Harvey, Kedlaya's algorithm in larger characteristic](https://arxiv.org/abs/math/0610973v2), §4, proof of Proposition 2, p. 6 (arXiv v2). States the corrected positive-power multiplier p^{⌊log_p((2g+1)(e+2)−2)⌋} for F_j(x)y^e dx, citing the errata and Edixhoven's Lemma 4.3.5.

#### The crystalline lattice in hyperelliptic H^1 and the denominators of the Frobenius matrix

**Theorem.** Node `PadicDifferentialEquationsAndRigidCohomology:RD.7/hyperelliptic-integral-frobenius-lattice`.

In the situation of RD.7/kedlaya-reduction-denominators let C_Q be the smooth projective model of y^2 = Q(x) over Z_q, M = ⊕_{0 ≤ i ≤ 2g−1} Z_q·x^i dx/y ⊂ H^1(A†)^−, t a uniformiser at ∞ with ι(t) = −t (for example t = x^g/y), and L ⊆ M the submodule of those ω whose principal part at ∞, an element of (t^{−2g}Z_q[[t]]dt)/(t^{−1}Z_q[[t]]dt), is the differential of an element of t^{−2g+1}Z_q[[t]]/Z_q[[t]]. Then: (1) L is the image of H^1_dR(C_Q/Z_q) ≅ H^1_crys(C/Z_q) in H^1(A†)^− = H^1_rig(C/K), so the p-power Frobenius F_p (and every power of it) maps L into L; (2) M/L ≅ ⊕_{i odd, −(2g−1) ≤ i < 0} Z_q/iZ_q, so p^c M ⊆ L ⊆ M with c = ⌊log_p(2g − 1)⌋; (3) consequently the matrix of every power F_p^r on the basis x^i dx/y lies in p^{−c}M_{2g}(Z_q), and if the matrix of F_p is known modulo p^N then the n-fold σ-twisted product computing the q-power Frobenius is known modulo p^{N−(n−1)c}, whereas on a Z_q-basis of L all matrices are integral and the product loses no precision; (4) the matrix of F_p on the monomial basis is in general not integral (computations of Vercauteren; the reduction estimates allow denominators of valuation up to v_p(d) + ⌊log_p(d − 2/p)⌋).

**Hypotheses.**

- p odd; Q ∈ Z_q[x] monic of degree 2g + 1 with squarefree reduction; g ≥ 1.
- F_p a σ-semilinear Frobenius lift on A† with x ↦ x^p (Kedlaya's lift, an instance of RD.0/frobenius-lift-on-dagger-algebra), acting on H^1(A†)^−.

**Construction or proof.**

1. H^1_dR(C_Q/Z_q) is computed by the complex O(0·∞) → Ω^1(∞); twisting by m·∞ gives complexes C(m) whose quotient C(2g − 1)/C(0) is the principal-part differential in the statement, and the resulting diagram identifies L with the image of H^1(C(0)) = H^1_dR(C_Q/Z_q) and computes M/L (Edixhoven, Proposition 5.3.1 and its sketch; Tuitman, Counting points II, Proposition 4.5, gives the complete argument for general curves, generalising it).
2. H^1_dR(C_Q/Z_q) = H^1_crys(C/Z_q) with its Frobenius (CrystallineCohomology:CR.2/formal-and-end0 for the proper smooth lift, CrystallineCohomology:CR.3/smooth-curve-lift), and it is free over Z_q. The endomorphism F_p of H^1(A†)^− is the rigid Frobenius and does not depend on the lift (RD.4/mw-comparison-for-affine-curves, RD.4/frobenius-independent-of-lift (b)). Its restriction to H^1_rig(C/K) ⊆ H^1_rig(C'/K) (RD.6/gysin-sequence-for-curves) corresponds to the σ-semilinear crystalline Frobenius under the comparison (RD.7/crystalline-rigid-comparison-with-coefficients with M = O, which extends RD.7/rigid-crystalline-comparison). So F_p(L) ⊆ L.
3. Since F_p is σ-semilinear, F_p(M) ⊆ F_p(p^{−c}L) = p^{−c}F_p(L) ⊆ p^{−c}M; the same for F_p^r.
4. Precision: let P_j be the exact product of the first j factors, which is the matrix of a power of Frobenius on M and so lies in p^{−c}M_{2g}(Z_q); an input error in p^N M_{2g}(Z_q) propagates to an error in p^{N−(j−1)c} after j factors by induction on j.

**Acceptance.**

- g = 1, p ≥ 3: c = ⌊log_p 1⌋ = 0, so L = M and the matrix on dx/y, x dx/y is integral.
- g = 2, p = 3: c = ⌊log_3 3⌋ = 1 and M/L ≅ Z_q/3Z_q (from i = −3), so one extra digit suffices.
- Kedlaya's errata: the denominators on the monomial basis are bounded independently of the extension degree n, which is (3) with c = ⌊log_p(2g − 1)⌋.

**Prerequisites.** `RD.7/kedlaya-reduction-denominators`, `RD.7/rigid-crystalline-comparison`, `RD.7/crystalline-rigid-comparison-with-coefficients`, `RD.0/frobenius-lift-on-dagger-algebra`, `RD.4/mw-comparison-for-affine-curves`, `RD.4/frobenius-independent-of-lift`, `RD.6/gysin-sequence-for-curves`, `CrystallineCohomology:CR.2/formal-and-end0`, `CrystallineCohomology:CR.3/smooth-curve-lift`.

**Sources.**

- [B. Edixhoven, Point counting after Kedlaya (EIDMA-Stieltjes Graduate course, Leiden, 22–26 September 2003)](https://www.math.leidenuniv.nl/~edix/oww/mathofcrypt/carls_edixhoven/kedlaya.pdf), §5.2, pp. 17–18, and Proposition 5.3.1 with its proof sketch, pp. 18–19. Notes that the reduction estimates do not show integrality of the Frobenius matrix on x^i dx/y and that it often fails, and proves that the submodule of forms with integrable principal part at infinity is the image of integral de Rham (= crystalline) cohomology, stable under Frobenius, with quotient killed by p^{⌊log_p(2g−1)⌋}.
- [K. S. Kedlaya, Comments/errata for 'Counting points on hyperelliptic curves using Monsky–Washnitzer cohomology'](https://kskedlaya.org/papers/hyperell-errata.pdf), p. 1. Explains that the Frobenius matrix on the monomial basis is not integral, that the denominators stay bounded, and that the submodule of forms whose expansion at infinity integrates over Z_q is Frobenius-stable and gives integral matrices.
- [J. Tuitman, Counting points on curves using a map to P^1, II](https://arxiv.org/abs/1412.7217v2), Definition 4.3, Definition 4.4, Proposition 4.5 and proof, Corollary 4.6, pp. 13–14 (arXiv v2). Proves the lattice inclusions p^{δ_1}Λ ⊂ Λ_cris ⊂ p^{−δ_2}Λ for general curves by the same twisted de Rham complexes, generalising Edixhoven's Proposition 5.3.1.

#### Tuitman's Frobenius lift and cohomological reduction for curves with a map to P^1

**Construction.** Node `PadicDifferentialEquationsAndRigidCohomology:RD.7/tuitman-frobenius-structure-algorithm`. Planet: *Tuitman's point-counting algorithm*.
Proposed namespace `TauCeti.RigidCohomology`, module `TauCeti/RigidCohomology/PointCounting`.

Let X be a smooth projective curve of genus g over F_q, q = p^n, with a finite separable map x : X → P^1 of degree d_x and a rational function y generating the function field, satisfying an irreducible equation Q(x, y) = 0 monic in y of degree d_x; let Q ∈ Z_q[x, y] be a lift with the same support, still monic in y, Δ its discriminant in y, r = Δ/gcd(Δ, dΔ/dx), U = Spec Z_q[x, 1/r, y]/(Q) and R† its weak completion. Assume Tuitman's Assumption 1 in its corrected form: (1) matrices W^0 ∈ GL_{d_x}(Z_q[x, 1/r]) and W^∞ ∈ GL_{d_x}(Z_q[x, 1/x, 1/r]) give integral bases of the function field over Q_q[x] and over Q_q[1/x] whose reductions are integral bases over F_q[x] and F_q[1/x]; (2) the discriminant of r is a unit; (3) the discriminants of the reduced parts (quotients by the nilradicals) of the finite Z_q-algebras R^0/(r) and R^∞/(1/x) are units (June 2020 erratum). Then: (a) U is the complement of a smooth relative divisor D_X in a smooth proper curve X over Z_q with special fibre X (Tuitman, Proposition 2.3); (b) there is a σ-semilinear Frobenius lift F_p on R† with F_p(x) = x^p, computed by Newton iteration modulo p^{2^i} (Theorem 2.6); (c) cohomological reduction at the finite and infinite points produces a basis ω_1, …, ω_κ of H^1_rig(U) from algebraic differentials, whose first 2g elements span H^1_rig(X) (the kernel of the residue map), together with, for every overconvergent 1-form ν on U, its coordinates and an overconvergent primitive: ν = Σ_j c_jω_j + dh; (d) applied to F_p^*ω_i this gives the Frobenius matrix F and overconvergent functions f_i with F_p^*ω_i = Σ_j F_{ij}ω_j + df_i, the q-power Frobenius F^{(n)} = F^{σ^{n−1}}⋯F^{σ}F (row convention: the i-th row of F holds the coordinates of F_p^*ω_i, as in BDMTV and in Tuitman's implementation; in the column convention of Tuitman's Step III the product is taken in the opposite order, F·F^{σ}⋯F^{σ^{n−1}}, sourceIssues E707), and the reverse characteristic polynomial χ(T) = det(1 − F^{(n)}T | H^1_rig(X)), which equals the Weil factor P_1(X, T) of RD.7/weil-factor (so #X(F_{q^r}) = q^r + 1 − Tr(F^{(n)r}|H^1_rig(X))). Consumers apply (c) to further forms, for example to the right-hand sides of the equations for the Frobenius structure of a unipotent connection (Balakrishnan–Dogra–Müller–Tuitman–Vonk, (22)).

**Hypotheses.**

- X smooth projective geometrically connected curve over F_q with a finite separable x : X → P^1 and a plane model Q monic in y.
- Tuitman's Assumption 1 with condition (3) as corrected in June 2020.

**API.**

- `RigidCohomology.Tuitman.Assumption1` (structure): The data (Q, W^0, W^∞) and the three conditions, with condition (3) on the reduced parts of R^0/(r) and R^∞/(1/x).
- `RigidCohomology.Tuitman.goodCompactification` (constructor): Under Assumption 1, a smooth proper curve X over Z_q and a smooth relative divisor D_X with U = X − D_X and X ⊗ F_q ≅ X.
- `RigidCohomology.Tuitman.frobeniusLift` (constructor): A σ-semilinear ring endomorphism F_p of R† lifting the p-power map with F_p(x) = x^p.
- `RigidCohomology.Tuitman.reduce` (data): For an overconvergent 1-form ν on U: coordinates c ∈ Q_q^κ and an overconvergent h with ν = Σ c_jω_j + dh.
- `RigidCohomology.Tuitman.reduce_unique` (extensionality): The coordinates c are unique, and h is unique up to an additive constant.
- `RigidCohomology.Tuitman.frobeniusMatrix` (data): The matrix F with F_p^*ω_i = Σ_j F_{ij}ω_j + df_i (row i holds the coordinates of F_p^*ω_i), and the primitives f_i.
- `RigidCohomology.Tuitman.frobeniusMatrix_eq_rigid` (compatibility): F is the matrix of the rigid Frobenius of H^1_rig(U) in the basis ω (independent of the Frobenius lift).
- `RigidCohomology.Tuitman.charpolyRev_eq_weilFactor` (relation): The reverse characteristic polynomial of F^{(n)} = F^{σ^{n−1}}⋯F on H^1_rig(X) is P_1(X, T).
- `RigidCohomology.Tuitman.hyperelliptic` (example): For Q = y^2 − f(x) with f of odd degree, the construction specialises to Kedlaya's algorithm.

**Uses.**

- EffectiveDiophantineMethods:ED.6: the Frobenius matrix on H^1_rig, the overconvergent primitives f, and solutions of the further reduction equations for g, h (BDMTV item /95 request)
- Balakrishnan–Dogra–Müller–Tuitman–Vonk, §5.2, (22)–(23): computing the Frobenius structure of the unipotent connection and the Teichmüller-point splitting
- Tuitman, Counting points II, §4.4: the zeta function of X from χ(T)
- RD.7/tuitman-precision-certification: the precision analysis of the computed matrix

**Unit tests.**

- `RigidCohomology.Tuitman.hyperelliptic_genus_two` (computation): For y^2 = x^5 + x + 3 over F_7 the computed χ(T) is 1 + 3T + 7T^2 + 21T^3 + 49T^4.
- `RigidCohomology.Tuitman.genus_zero` (degenerate): For Q = y − x (X = P^1, d_x = 1) the basis of H^1_rig(X) is empty and χ(T) = 1.
- `RigidCohomology.Tuitman.assumption_printed_too_strong` (non-example): For Q = y^2 − f(x) the printed condition (3) fails (R^0/(r) is not reduced, discriminant 0) while the corrected condition holds when disc(f) is a unit.
- `RigidCohomology.Tuitman.lift_independent` (compatibility): Replacing F_p by another Frobenius lift of R† changes the primitives f_i but not the matrix F (RD.4/mw-comparison-for-affine-curves).
- `RigidCohomology.Tuitman.frobeniusPower_order` (non-example): The order of the twisted product matters once n ≥ 3. Take n = 3, F_8 = F_2[a]/(a^3 + a + 1) and any lift A ∈ M_2(W(F_8)) of the matrix with rows (0, 1) and (a, a^2). Modulo 2 the trace of A^{σ^2}A^{σ}A is 0 and the trace of A·A^{σ}·A^{σ^2} is 1. In the row convention only the first is the matrix of the cube of the σ-semilinear map with matrix A.

**Construction or proof.**

1. (a): glue Spec R^0 and Spec R^∞ along U; flatness and regularity of both fibres (from the integral bases) give smoothness, and the unit discriminants give étaleness of the boundary (Tuitman, proof of Proposition 2.3).
2. (b): define F_p(1/r) and F_p(y) as limits of the Newton iterations α_{i+1} = α_i(2 − α_i r^σ(x^p)) and the analogous iteration for y with 1/Δ = g(x)/r(x)^m; convergence in R† is the Hensel argument for the étale map U → V (Tuitman, Theorem 2.6). This is an instance of RD.0/frobenius-lift-on-dagger-algebra with a chosen form.
3. (c): reduce poles along r = 0 using the integral basis b^0 and the relation from d of b^0_j/r^ℓ, then poles above ∞ using b^∞; H^1_rig(X) is the kernel of the residue map on H^1_rig(U) (Tuitman, Theorem 3.11, quoted there as well known; here RD.6/gysin-sequence-for-curves), and the basis is chosen with ω_1, …, ω_{2g} spanning that kernel (Tuitman, §4.1, Step I).
4. (d): F is the matrix of the rigid Frobenius on H^1_rig(U) for the basis ω (RD.4/mw-comparison-for-affine-curves: the Frobenius on Ω^1_{R†}/dR† is independent of the lift); its characteristic polynomial on H^1_rig(X) is the Weil factor by RD.7/weil-factor and RD.6/monsky-washnitzer-fixed-point-formula.

**Acceptance.**

- Hyperelliptic case: Q = y^2 − f(x), d_x = 2, with f squarefree of odd degree 2g + 1 and unit discriminant; Assumption 1 holds with W^0 = 1, and the algorithm recovers Kedlaya's: for y^2 = x^5 + x + 3 over F_7, χ(T) = 1 + 3T + 7T^2 + 21T^3 + 49T^4 and #X(F_7) = 11.
- Genus zero: for x : P^1 → P^1 the identity (Q = y − x), H^1_rig(X) = 0 and χ = 1.
- The printed Assumption 1(3) excludes every hyperelliptic curve: R^0/(r) = (Z_q[x]/(f))[y]/(y^2) is not reduced, so its discriminant is 0, while its reduced part Z_q[x]/(f) has unit discriminant; the corrected condition holds.

**Prerequisites.** `RD.0/frobenius-lift-on-dagger-algebra`, `RD.4/mw-comparison-for-affine-curves`, `RD.6/gysin-sequence-for-curves`, `RD.6/monsky-washnitzer-fixed-point-formula`, `RD.7/weil-factor`, `RD.7/frobenius-compatibility-of-comparison`, `mathlib:Matrix.charpolyRev`, `mathlib:Matrix.reverse_charpoly`.

**Sources.**

- [J. Tuitman, Counting points on curves using a map to P^1, II](https://arxiv.org/abs/1412.7217v2), Definition 2.1, p. 2; Assumption 1, Remark 2.2 and Proposition 2.3, p. 3; Definition 2.5, Theorem 2.6 and Remark 2.7, p. 5; Theorem 3.11, p. 9; §4.1 Step I, p. 11; §4.3 Step III and §4.4 Step IV, p. 12 (arXiv v2). Sets up the lift of the plane model, the integral-basis assumption, the good compactification it implies, the Frobenius lift with x ↦ x^p obtained by Newton iteration, the residue sequence cutting H^1_rig(X) out of H^1_rig(U), the choice of a basis whose first 2g elements span H^1_rig(X), the Frobenius matrix F (its index convention is E707) and χ(T).
- [J. Tuitman, Erratum: Counting points on curves using a map to P^1, II](https://jtuitman.github.io/erratum.pdf), the single correction (June 2020). Condition (3) of Assumption 1 should require unit discriminants only for the reduced parts of R^0/(r(x)) and R^∞/(1/x); the printed condition is sufficient but far too restrictive.
- [J. S. Balakrishnan, N. Dogra, J. S. Müller, J. Tuitman and J. Vonk, Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://arxiv.org/abs/1711.05846v1), §5.2, equations (22)–(23), pp. 25–26 (arXiv v1). Uses Tuitman's algorithms to compute the Frobenius matrix F, the primitives f with φ^*ω = Fω + df, and to solve the further equations for g and h that give the Frobenius structure on the unipotent connection.

#### Certified precision for Tuitman's algorithm

**Theorem.** Node `PadicDifferentialEquationsAndRigidCohomology:RD.7/tuitman-precision-certification`.

In the situation of RD.7/tuitman-frobenius-structure-algorithm, write χ(T) = det(1 − F^{(n)}T | H^1_rig(X)) ∈ Z[T]. Let e_0, e_∞ be the maximal ramification indices of x over the zeros of r and over ∞, ord_0(W), ord_∞(W^{−1}) the orders of the change-of-basis matrix W = (W^0)^{−1}W^∞, and put B = max_{1≤i≤g}(⌊log_p binom(4g, i) + ni/2⌋ + 1), δ_1 = ⌊log_p(−(ord_0(W) + 1)e_∞)⌋, δ_2 = ⌊log_p((⌊(2g−2)/d_x⌋ + 1)e_∞)⌋, δ = δ_1 + δ_2, f_1(m) = ⌊log_p(p(m − 1)e_0)⌋ + ⌊log_p(−(ord_∞(W^{−1}) + 1)e_∞)⌋ and f_2 = ⌊log_p(−p(ord_0(W) + 1)e_∞)⌋. Then: (1) χ is determined by its residue modulo p^B; (2) with Λ the Z_q-span of the reduction basis and Λ_cris the image of the log-crystalline H^1_cris(X, D_X), p^{δ_1}Λ ⊆ Λ_cris ⊆ p^{−δ_2}Λ, so ord_p(F) ≥ −δ; (3) knowing F modulo p^{B+δ} suffices to recover χ; (4) it suffices to run the computation at working p-adic precision N such that m − max(f_1(m), f_2) ≥ B + δ for every m ≥ N, and N can be taken in Õ(d_x d_y n). For the hyperelliptic case this recovers RD.7/hyperelliptic-integral-frobenius-lattice.

**Hypotheses.**

- The hypotheses of RD.7/tuitman-frobenius-structure-algorithm (corrected Assumption 1).

**Construction or proof.**

1. (1): the coefficients of χ satisfy the functional equation and the Weil bounds of RD.7/weil-factor-export, so the first g of them are integers of absolute value at most binom(2g, i)q^{i/2} ≤ binom(4g, i)q^{i/2}/2 and are determined by their residues modulo p^B (Tuitman, Proposition 4.2; Kedlaya's reconstruction lemma).
2. (2): compare the log de Rham complex of (X, D_X) twisted by m·D_∞ with the untwisted one, whose H^1 is the log-crystalline H^1_cris(X, D_X) (CrystallineCohomology:CR.5/log-poincare, CR.5/p-adic-log-crystalline); the cokernel is killed by p^{⌊log_p(m e_∞)⌋}; Serre duality kills H^1(O(m_2D_∞)) for m_2 = ⌊(2g − 2)/d_x⌋ + 1 (Tuitman, Proposition 4.5). Since Frobenius preserves Λ_cris, ord_p(F) ≥ −δ (Corollary 4.6).
3. (3): compute χ in a basis of Λ_cris, where no precision is lost, and change basis (Proposition 4.7).
4. (4): track the denominators in reducing F_p(ω_i) at the finite and infinite points, bounded by f_1(m) and f_2 (Definition 4.8, Proposition 4.9).

**Acceptance.**

- Hyperelliptic genus two over F_7 (y^2 = x^5 + x + 3): B = max(⌊log_7 8 + 1/2⌋ + 1, ⌊log_7 28 + 1⌋ + 1) = max(2, 3) = 3; |a_1| ≤ 4·7^{1/2} < 11 and |a_2| ≤ 6·7 = 42, and 7^3 = 343 > 2·42, so the residues modulo 343 determine a_1 = 3 and a_2 = 7.
- Genus zero: the maximum over 1 ≤ i ≤ g is over the empty set; χ = 1 needs no precision.
- The bound uses binom(4g, i) rather than the sharper 2·binom(2g, i); the certification is valid with either, and Kedlaya's N_1 of RD.7/kedlaya-point-counting-certification is the hyperelliptic instance.

**Prerequisites.** `RD.7/tuitman-frobenius-structure-algorithm`, `RD.7/hyperelliptic-integral-frobenius-lattice`, `RD.7/weil-factor-export`, `CrystallineCohomology:CR.5/log-poincare`, `CrystallineCohomology:CR.5/p-adic-log-crystalline`.

**Sources.**

- [J. Tuitman, Counting points on curves using a map to P^1, II](https://arxiv.org/abs/1412.7217v2), §4.5: Proposition 4.2, Definitions 4.3–4.4, Proposition 4.5, Corollary 4.6, Proposition 4.7, Definition 4.8 and Proposition 4.9, pp. 13–15 (arXiv v2). Gives the reconstruction precision, the lattices of reduction and of log-crystalline cohomology with their inclusions, the resulting bound on the valuation of the Frobenius matrix, and the working precision that certifies χ.

## 5. Kloosterman moments: the p-adic realisation and Newton above Hodge

Fresán, Sabbah and Yu compare the middle rigid cohomology of the symmetric powers of the Kloosterman F-isocrystal with the p-adic realisation of the Kloosterman motive. The rigid input (the Kloosterman F-isocrystal and its middle cohomology) is RD.6's; the comparison map from rigid cohomology of a special fibre with ordinary quadratic singularities is Mieda's p-adic Picard–Lefschetz formula, planned here; the passage to Galois representations uses the p-adic comparison theorems C_dR and C_st, which lie above this roadmap's tier and are recorded as a gap, with a proposal to move the two applications to their owner.

#### Mieda's p-adic Picard–Lefschetz map for ordinary quadratic degenerations

**Theorem.** Node `PadicDifferentialEquationsAndRigidCohomology:RD.7/mieda-p-adic-picard-lefschetz`.

Let p be odd, L = Q_p(√−p) with ring of integers O_L and uniformiser √−p, and 𝒳 a proper flat Z_p-scheme of relative dimension N whose generic fibre is smooth and whose special fibre 𝒳_{F_p} is smooth outside finitely many ordinary quadratic points, each of which over O_L is formally given by an equation Q − u·(√−p)^2 with u a unit and Q a quadratic form defining a smooth quadric in P^N over O_L. Then: (1) the blow-up 𝒳'' of 𝒳 ⊗ O_L at these points is strictly semistable over O_L, with generic fibre 𝒳_L; (2) there is an injective L-linear map β : H^N_rig(𝒳_{F_p}/Q_p) ⊗ L → H^N_dR(𝒳_{Q_p}) ⊗ L, compatible with Frobenius when the right-hand side carries the Hyodo–Kato Frobenius of 𝒳'' (constructed with logarithmic de Rham–Witt complexes), and compatible with the restriction maps to the boundary strata (the commutative square of the Picard–Lefschetz formula); (3) if 𝒳_{F_p} is smooth, β is the rigid–de Rham comparison isomorphism of a smooth proper lift (RD.7/rigid-crystalline-comparison with CrystallineCohomology:CR.2/formal-and-end0).

**Hypotheses.**

- p odd; 𝒳 proper flat over Z_p with smooth generic fibre.
- Special fibre smooth away from finitely many ordinary quadratic points of the stated formal type over O_L = Z_p[√−p].

**Construction or proof.**

1. (1): blowing up an ordinary quadratic point of a family Q = u·π^2 gives two components meeting transversally, the exceptional quadric and the strict transform (Mieda, (2.3), as recalled by Fresán–Sabbah–Yu).
2. (2): the log-crystalline (Hyodo–Kato) cohomology of the special fibre of 𝒳'' carries Frobenius and monodromy (CrystallineCohomology:CR.6/log-de-rham-witt-model, CR.6/proper-log-rigid-hk) and is compared with de Rham cohomology of 𝒳_L by the Hyodo–Kato isomorphism (CrystallineCohomology:CR.6/hk-comparison); β is the composite of the map from rigid cohomology of the singular special fibre into it (Mieda, Theorem 1.1 and Theorem 2.13). Its injectivity and the Picard–Lefschetz square are Mieda's theorem; his paper was not read for this plan (recorded gap).
3. (3): when the special fibre is smooth there is nothing to blow up and the construction reduces to the comparison of rigid cohomology with de Rham cohomology of a lift.

**Acceptance.**

- Fresán–Sabbah–Yu apply it to the compactification 𝒦̄' of the hypersurface 𝒦 attached to Sym^k Kl_2 (N = k − 1), where Q is the quadratic form Q_{ap} or Q_{bp} of their (5.6), (5.16).
- Degenerate: no singular points, then 𝒳'' = 𝒳 ⊗ O_L is smooth and β is an isomorphism.
- Non-example: without the extension to L = Q_p(√−p) the equation Q − u·p is not of the form Q − u·π^2 with π a uniformiser, and the blow-up over Z_p is not semistable; the ramified base change is necessary.

**Prerequisites.** `RD.7/rigid-crystalline-comparison`, `CrystallineCohomology:CR.2/formal-and-end0`, `CrystallineCohomology:CR.6/log-de-rham-witt-model`, `CrystallineCohomology:CR.6/proper-log-rigid-hk`, `CrystallineCohomology:CR.6/hk-comparison`, `RD.4/frobenius-on-rigid-cohomology`.

**Sources.**

- [J. Fresán, C. Sabbah and J.-D. Yu, Hodge theory of Kloosterman connections](https://arxiv.org/abs/1810.06454v5), proof of Proposition 5.23, pp. 49–51 (arXiv v5). Recalls Mieda's p-adic Picard–Lefschetz formula: for ordinary quadratic singularities the blow-up over Z_p[√−p] is semistable, and there is a commutative diagram with an injective Frobenius-compatible map β from rigid cohomology of the special fibre to de Rham cohomology of the generic fibre, built with logarithmic de Rham–Witt complexes; in the smooth case β is the usual comparison isomorphism.

#### The p-adic realisation of the Kloosterman moments and middle rigid cohomology (Fresán–Sabbah–Yu, Proposition 5.23)

**Application.** Node `PadicDifferentialEquationsAndRigidCohomology:RD.7/kloosterman-semistable-realization`.

Fix k > 1, a prime p, and a place of Q̄ above p; let V_{k,p} be the p-adic étale realisation of the Kloosterman motive M_k of Fresán–Sabbah–Yu, ϖ ∈ Q̄_p with ϖ^{p−1} = −p, K = Q_p(ϖ), and H^1_{rig,mid}(G_m/K, Sym^k Kl_2) = gr^W_{k+1}H^1_{rig,c}(G_m/K, Sym^k Kl_2) the middle rigid cohomology of the symmetric power of the Kloosterman F-isocrystal (RD.6), of dimension ⌊(k − 1)/2⌋ − δ_{4Z}(k) when p > k for odd k and p > k/2 for even k. Then: (1) V_{k,p} is de Rham as a representation of Gal(Q̄_p/Q_p); (2) if p is odd, V_{k,p} is semistable over Q_p(√−p) and there is an injection of Frobenius modules H^1_{rig,mid}(G_m/K, Sym^k Kl_2) → (V_{k,p} ⊗ B_st)^{Gal(Q̄_p/Q_p(√−p))} ⊗ K; (3) if moreover p > k for odd k (respectively p > k/2 for even k), V_{k,p} is crystalline and the map is an isomorphism with (V_{k,p} ⊗ B_cris)^{Gal(Q̄_p/Q_p)} ⊗ K.

**Hypotheses.**

- k > 1; p prime (odd for (2)–(3)); the bounds on p in (3).
- The period rings and functors of NeronModelsAndSemistableAbelianVarieties:R11.5 and the p-adic comparison theorems C_dR and C_st (recorded gap).

**Construction or proof.**

1. (1): V_{k,p} is a subquotient of the cohomology of the smooth proper varieties 𝒦̄ or 𝒦̄', which is de Rham by the de Rham comparison theorem (gap), and subquotients of de Rham representations are de Rham.
2. (2), even k: the localisation spectral sequence for compact-support rigid cohomology of 𝒦̄' with its boundary (RD.4/excision-sequence) identifies the middle cohomology with gr^W_{k−1} of the kernel of the restriction α to the boundary; Mieda's injective β (RD.7/mieda-p-adic-picard-lefschetz) embeds that kernel into the kernel of the de Rham restriction over L, which by the semistable comparison theorem for the semistable model 𝒦̄'' (gap) is (V_{k,p}(1) ⊗ B_st)^{Gal(Q̄_p/L)} ⊗ L; β is Frobenius-compatible; extend scalars to K and take χ-isotypic parts.
3. (3): when 𝒦̄' is smooth, β is the comparison isomorphism and the kernel is pure of weight k − 1, giving the crystalline statement.
4. Odd k: the same argument with 𝒦' = 𝒦 (no first resolution).

**Acceptance.**

- Dimensions from the formula ⌊(k − 1)/2⌋ − δ_{4Z}(k): k = 5, p > 5 gives 2; k = 8, p > 4 gives 3 − 1 = 2.
- Small k: dimension 0 for k = 2 and k = 4 (so (3) is an equality of zero spaces) and 1 for k = 3 with p > 3.

**Prerequisites.** `RD.7/mieda-p-adic-picard-lefschetz`, `RD.6`, `RD.4/excision-sequence`, `RD.4/frobenius-on-rigid-cohomology`, `RD.6/p-adic-weil-ii`, `NeronModelsAndSemistableAbelianVarieties:R11.5`.

**Sources.**

- [J. Fresán, C. Sabbah and J.-D. Yu, Hodge theory of Kloosterman connections](https://arxiv.org/abs/1810.06454v5), §5.1.5, Proposition 5.23 and its proof, pp. 49–51 (arXiv v5). States and proves that the p-adic realisation is de Rham, semistable over Q_p(√−p) with an inclusion of the middle rigid cohomology into its D_st, and crystalline with equality under the bounds on p, using the localisation spectral sequence, Mieda's p-adic Picard–Lefschetz formula and the p-adic comparison theorem.

#### Newton above Hodge for Kloosterman moments and the valuation of their coefficients (Fresán–Sabbah–Yu, Corollary 5.27)

**Application.** Node `PadicDifferentialEquationsAndRigidCohomology:RD.7/kloosterman-newton-above-hodge`.

Let k ≥ 1 and p an odd prime. The Newton polygon of the Frobenius module H^1_{rig,c}(G_m,F_p/K, Sym^k Kl_2) lies on or above the Hodge polygon of H^1_{dR,c}(G_m, Sym^k Kl_2), with the same endpoints when p > k for odd k and 2p > k for even k. Consequently, writing the moment L-function as Z_k(p; T) = Σ_n c_n T^n, one has v_p(c_n) ≥ n(n − 1) for every n and every p ≥ 3.

**Hypotheses.**

- k ≥ 1; p odd.
- RD.7/kloosterman-semistable-realization (with its recorded comparison-theorem gap).

**Construction or proof.**

1. The filtered (φ, N)-module (V_{k,p} ⊗ B_st)^{Gal(Q̄_p/Q_p(√−p))} of the semistable representation V_{k,p} is weakly admissible (FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3, weak admissibility of D_st(V)): its Newton polygon lies above its Hodge polygon with the same endpoints.
2. Newton and Hodge polygons are additive for direct sums (Minkowski sums of the regions above them); the middle rigid cohomology injects into the Frobenius module of V_{k,p} (RD.7/kloosterman-semistable-realization (2)), so its Newton polygon lies above that of V_{k,p}, which lies above the Hodge polygon of the middle de Rham cohomology; under the bounds on p the two modules are equal and the endpoints agree.
3. Add back the trivial factor: one-dimensional with slopes 0 if k ≢ 0 mod 4, two-dimensional with slopes 0 and k/2 otherwise.
4. The valuation bound: c_n is, up to sign, the n-th elementary symmetric function of the Frobenius eigenvalues, so its valuation is at least the sum of the n smallest Newton slopes, hence at least the sum of the n smallest Hodge slopes; Fresán–Sabbah–Yu read off v_p(c_n) ≥ n(n − 1) from the Hodge numbers of the middle de Rham cohomology computed in their §5 (Remark 5.28). RD.6/slope-bounds-for-rigid-cohomology gives the coarser consistency check that all slopes lie in [0, k + 1].

**Acceptance.**

- The bound v_p(c_n) ≥ n(n − 1) sharpens Haessig's (1 − 1/(p − 1))n(n − 1) for p ≥ 5 (Fresán–Sabbah–Yu, Remark 5.28).
- Small n: the bound is empty for n = 0, 1 and for n = 2 asserts p^2 | c_2.

**Prerequisites.** `RD.7/kloosterman-semistable-realization`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`, `RD.6/slope-bounds-for-rigid-cohomology`, `RD.6`.

**Sources.**

- [J. Fresán, C. Sabbah and J.-D. Yu, Hodge theory of Kloosterman connections](https://arxiv.org/abs/1810.06454v5), Corollary 5.27 and its proof, Remark 5.28 with (5.29), p. 51 (arXiv v5). Deduces from weak admissibility of D_st and the injection of Proposition 5.23 that the Newton polygon of compactly supported rigid cohomology lies above the Hodge polygon, with equal endpoints under the bounds on p, and that the coefficients of the moment L-function satisfy v_p(c_n) ≥ n(n − 1) for all p ≥ 3.

## Requests to other roadmaps

- **ArithmeticGaloisRepresentations:R01.6** — For an abelian variety A over F_q and ℓ ≠ p: a Frobenius-equivariant isomorphism H^1_et(A_{F̄_q}, Q_ℓ) ≅ Hom(V_ℓA, Q_ℓ) under which the geometric Frobenius of the étale side is the transpose of V_ℓ(π_A), π_A the q-Frobenius endomorphism; equivalently the arithmetic Frobenius of Gal(F̄_q/F_q) acts on V_ℓA through V_ℓ(π_A). The DeligneWeightsAndPurity package imports the same statement from this layer (its input E11). Needed by `RD.7/abelian-variety-crystalline-frobenius-polynomial`.
- **NeronModelsAndSemistableAbelianVarieties:R11.5** — Fontaine's period rings B_cris ⊂ B_st with φ and N, the functors D_cris, D_st, D_dR on continuous p-adic representations of Gal(K̄/K) for K/Q_p finite, the predicates crystalline, semistable and de Rham, and D_cris = D_st^{N=0}, as planned in §5.3 of that roadmap's package; used for the representation V_{k,p} over K = Q_p and Q_p(√−p). Needed by `RD.7/kloosterman-semistable-realization`.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3** — Weak admissibility of D_st(V) for a semistable p-adic representation V of Gal(K̄/K), K/Q_p finite (the package's dSt_isWeaklyAdmissible), in the form: the Newton polygon of the filtered (φ, N)-module lies on or above its Hodge polygon with the same endpoints. Needed by `RD.7/kloosterman-newton-above-hodge`.

## Recorded gaps

- **Mieda's p-adic Picard–Lefschetz formula not read.** Y. Mieda, 'The Picard–Lefschetz formula for p-adic cohomology', Math. Z. 257 (2007), 403–425, Theorem 1.1, (2.3) and Theorem 2.13, is used only through Fresán–Sabbah–Yu's account in the proof of their Proposition 5.23 (pp. 49–51). The injectivity of β, its Frobenius compatibility through logarithmic de Rham–Witt complexes and the semistability of the blow-up are therefore stated, not decomposed. The paper (doi:10.1007/s00209-007-0131-6) is not freely available: the author's publication page gives only the DOI and no arXiv version was found on 14 October 2026. NEXT ACTION: once a copy is cleared, read it and split the node into the semistable-model lemma and the comparison map. Needed by `RD.7/mieda-p-adic-picard-lefschetz`, `RD.7/kloosterman-semistable-realization`.
- **p-adic comparison theorems C_dR and C_st are owned above this tier.** Fresán–Sabbah–Yu, Proposition 5.23, uses that étale cohomology of a smooth proper variety over Q_p is de Rham and that of a proper semistable model over Q_p(√−p) is semistable, with D_st identified with Hyodo–Kato/log-de Rham cohomology (Tsuji's C_st). The atlas plans these comparisons in CohomologyComparisons:CP.4 (proper-rigid-potential-semistable-comparison, semistable-filtered-bdr-agreement) and PadicHodgeTheory, both in higher tiers than this roadmap (tier 12), so they cannot be cited here; moving them down into RD.7 would duplicate the core of p-adic Hodge theory. The two Kloosterman applications therefore rest on this gap; the restructuring proposal below moves them up to the owner of C_st. Needed by `RD.7/kloosterman-semistable-realization`, `RD.7/kloosterman-newton-above-hodge`.
- **Katz–Messing's paper not accessible.** Katz–Messing, Invent. Math. 23 (1974), 73–77 (doi:10.1007/BF01405203) is behind the publisher's paywall and no author or GDZ copy was found on 14 October 2026. The plan does not use their argument (the crystalline–ℓ-adic equality is obtained from Kedlaya's p-adic purity and RD.7/weight-separated-factor-extraction), so no step depends on the paper; RD.7/abelian-variety-crystalline-frobenius-polynomial, the degree-one case, is also proved by weight separation. The comparison of routes stays open. Needed by `RD.7/ell-adic-comparison-smooth-projective`.

## Structure proposals

- **rescope** (PadicDifferentialEquationsAndRigidCohomology, DeligneWeightsAndPurity, WeilConjectures). The characteristic-zero weight-separation theorem and the rationality-descent/Fatou lemma (RD.7/weight-separated-factor-extraction, RD.7/rational-zeta-descent-and-fatou) restate WeilConjectures:WC.3/degreewise-pure-factor-extraction and WC.1/local-fatou-normalization, WC.1/rationality-over-q-via-hankel-determinants. WeilConjectures is outside the upstream tiers and consumes RD.7, so the accepted parent review moved this argument down into RD.7. DeligneWeightsAndPurity (tier 11) also cites the same WC.1/WC.3 statements (its package inputs E50–E53) and is below this roadmap. *Proposal:* Give both statements a single owner at the lowest consumer: DeligneWeightsAndPurity:DWP.0 (eigenvalue weights and functorial linear algebra), as pure statements about power series and Weil numbers. When DWP's upward WC citations are moved down, transfer the two RD.7 nodes there unchanged; RD.7, WC.1 and WC.3 then import them. Until that move RD.7 owns them, as the accepted parent review decided.
- **rescope** (PadicDifferentialEquationsAndRigidCohomology, CohomologyComparisons). Fresán–Sabbah–Yu Proposition 5.23 and Corollary 5.27 (routed to RD.6/RD.7 by PAPER-FRESAN-SABBAH-YU-22) are statements about the p-adic Galois representation V_{k,p}: semistability over Q_p(√−p), crystallinity for large p and weak admissibility. Their proofs need C_dR and C_st, which CohomologyComparisons:CP.4 plans in a higher tier. *Proposal:* Move RD.7/kloosterman-semistable-realization and RD.7/kloosterman-newton-above-hodge to CohomologyComparisons:CP.4 as applications of its proper semistable comparison, importing from this roadmap the middle rigid cohomology of Sym^k Kl_2 (RD.6) and Mieda's comparison map RD.7/mieda-p-adic-picard-lefschetz, which stay here because they are statements about rigid and log-crystalline cohomology.
- **rescope** (PadicDifferentialEquationsAndRigidCohomology). The parent packet lists 'the rational Ogus–Shiho cohomology comparison used in RD.7' among the remaining work of both RD.3 and RD.7. *Proposal:* RD.3 owns the convergent coefficient model (the ordinary convergent site, convergent isocrystals and the equivalence with F-crystals up to isogeny, Kedlaya's Notes Theorem 2.2); RD.7 owns the cohomological comparisons (RD.7/tube-to-envelope-comparison-map, RD.7/comparison-map-quasi-isomorphism, RD.7/crystalline-rigid-comparison-with-coefficients). The RD.3 follow-up and the assembly should drop the cohomology comparison from RD.3's list and cite these nodes.

## Mistakes found in the sources

- **E701** (error; K. S. Kedlaya, Comments/errata for 'Counting points on hyperelliptic curves using Monsky–Washnitzer cohomology', item for the journal's page 331, line 8, p. 1 of the errata note (13 October 2003); read against Lemma 3 of arXiv v2, p. 5). The errata replaces 2m + 1 by d(m + 1) − 2 (d = 2g + 1) in the bound of Lemma 3, whose form ω = A(x)y^{2m+1}dx has odd exponent 2m + 1. *Correction:* With Lemma 3's own m the multiplier must be p^{⌊log_p(d(2m + 3) − 2)⌋}, i.e. p^{⌊log_p((2g + 1)(e + 2) − 2)⌋} for F(x)y^e dx with e odd (Harvey §4; Edixhoven Lemma 4.3.5 with even exponent m' = 2m + 2 in the form a·y^{m'}dx/y). The errata formula d(m + 1) − 2 is right only if m is read as Edixhoven's even exponent. *Why:* For Q = x^3 + x + 1, p = 5 (good reduction, discriminant −31) and m = 0, the reduction of y dx = Q dx/y is (2/5)x dx/y + (3/5) dx/y + d((2/5)xy), computed exactly; it needs the factor 5 = 5^{⌊log_5 7⌋}, while d(m + 1) − 2 = 1 gives 5^0 = 1. *Reach:* the proof. *Known:* new as a reading of the errata in the arXiv numbering; the journal's own indexing of Lemma 3 (page 331) was not available to check whether it uses the even exponent, and Edixhoven's Lemma 4.3.5 and Harvey §4 state the correct bound. *Review:* confirmed. Checked against the errata note (item for page 331, line 8) and arXiv v2 Lemma 3, p. 5. The reduction of y dx for Q = x^3 + x + 1 at p = 5 was recomputed exactly: whatever F = c_2x^2 + c_1x + c_0 is used in d(Fy), the coefficient of x dx/y in the reduced form is forced to be 2/5, so the factor 5 is needed and the literal d(m + 1) − 2 = 1 is too small. Edixhoven, Lemma 4.3.5 (p. 14), and Harvey, §4, proof of Proposition 2 (p. 6), give d(m' + 1) − 2 for the even exponent m' = 2m + 2. Confirmed, scoped as the packet scopes it to Lemma 3's indexing in arXiv v2; the journal page was not available to the review either.
- **E702** (misprint; K. S. Kedlaya, Comments/errata for 'Counting points on hyperelliptic curves using Monsky–Washnitzer cohomology', paragraph on the integral basis, p. 1 of the errata note). The note describes the Frobenius-stable lattice inside the Z_q-span of x^i dx/y for i = 1, …, 2g − 1. *Correction:* The span is over 0 ≤ i ≤ 2g − 1 (2g forms, a basis of H^1(A; K)^−), as in Edixhoven's Proposition 5.3.1. *Why:* H^1(A; K)^− has dimension 2g; the printed index range has only 2g − 1 elements and would miss dx/y, the invariant differential of an elliptic curve when g = 1. *Reach:* nothing. *Known:* new; Edixhoven, Proposition 5.3.1 (pp. 18–19), states the lattice with the correct range. *Review:* confirmed. The errata note (p. 1) describes the Frobenius-stable submodule inside the Z_q-span of x^i dx/y for i = 1, …, 2g − 1; the basis of H^1(A; K)^− is indexed from 0 (Kedlaya arXiv v2, p. 4; Edixhoven, Proposition 4.3.2, p. 12, and Proposition 5.3.1, p. 18). Confirmed.
- **E703** (misprint; B. Edixhoven, Point counting after Kedlaya (EIDMA-Stieltjes Graduate course, Leiden, 22–26 September 2003), proof of Lemma 4.3.5, p. 14 (version of 25 October 2006)). The proof gives the valuations at infinity as v_∞(x) = −2 and v_∞(y) = −2. *Correction:* v_∞(y) = −d (d = deg Q = 2g + 1), since y^2 = Q and v_∞(x) = −2. *Why:* 2v_∞(y) = v_∞(Q) = d·v_∞(x) = −2d; the next values in the proof, v_∞(dx/y) = d − 3 and v_∞(f) ≥ −md − d + 2, use v_∞(y) = −d, so the bound is unaffected. *Reach:* nothing. *Known:* new; no later version of the notes was found. *Review:* confirmed. Checked on the page image of p. 14: the proof of Lemma 4.3.5 prints v_∞(y) = −2 and then uses v_∞(dx/y) = d − 3, which needs v_∞(y) = −d. Confirmed misprint; the bound is unaffected.
- **E704** (error; J. Tuitman, Counting points on curves using a map to P^1, II, Assumption 1, condition (3), p. 3 (arXiv v2 and the journal version)). Condition (3) requires the discriminants of the finite Z_q-algebras R^0/(r(x)) and R^∞/(1/x) to be units. *Correction:* Require unit discriminants only for their reduced parts (quotients by the nilradical). *Why:* The printed condition is sufficient but excludes every ramified map x, for example every hyperelliptic model y^2 = f(x): R^0/(r) = (Z_q[x]/(f))[y]/(y^2) is not reduced, so its discriminant is 0. *Reach:* a stated result. *Known:* Tuitman's erratum of June 2020 (jtuitman.github.io/erratum.pdf), crediting F. Vermeulen and W. Castryck. *Review:* confirmed. The June 2020 erratum (one page) replaces condition (3) by the condition on reduced parts and credits Vermeulen and Castryck; for y^2 = f(x) the algebra R^0/(r) = (Z_q[x]/(f))[y]/(y^2) has nilpotents, so its trace form is degenerate. Confirmed, known.
- **E705** (misprint; J. S. Milne, Lectures on étale cohomology, proof of Lemma 27.10, p. 158 (version 2.21, 22 March 2013)). After ruling out a reciprocal root c_i of h with |c_i|_ℓ > 1, the proof concludes that every |c_i|_ℓ is strictly less than 1. *Correction:* Every |c_i|_ℓ is at most 1, which is what the first sentence of the proof sets out to show and what integrality of h needs. *Why:* The argument excludes only |c_i|_ℓ > 1. Equality occurs: f = 1/(1 − t) is in 1 + tZ_ℓ[[t]] with h = 1 − t and c = 1. *Reach:* nothing. *Known:* new. *Review:* confirmed. Added by the review after reading the page image of p. 158; the packet's node already uses the non-strict bound.
- **E706** (gap; J. S. Milne, Lectures on étale cohomology, Summary 27.14(c) and the paragraph proving it, p. 159 (version 2.21, 22 March 2013)). (c) asserts that if, for one ℓ, the factors P_{r,ℓ} are pairwise coprime, then each lies in 1 + tZ[t]. The proof gets integrality of the odd and even products from Proposition 27.11, then says the reciprocal roots of each P_{r,ℓ} are algebraic integers and that this implies P_{r,ℓ} ∈ 1 + tZ[t]. *Correction:* Pairwise coprimality gives only that the coefficients of P_{r,ℓ} are algebraic integers lying in Q_ℓ. Rationality, and with it integrality, needs the multiset of reciprocal roots of each P_{r,ℓ} to be Gal(Q̄/Q)-stable. Purity, the hypothesis of (d), supplies this, as in Deligne, Weil I, p. 277, and RD.7/weight-separated-factor-extraction. State (c) with the conclusion 'coefficients integral over Z', or assume the hypothesis of (d). *Why:* Two conjugate quadratic algebraic integers α, ᾱ in Q_ℓ can be split as P_1 = 1 − αt and P_3 = 1 − ᾱt. The two factors are coprime and their product is in 1 + tZ[t], but neither factor is in Q[t]. So algebraic-integer reciprocal roots do not put an individual factor in Z[t] without a rationality argument. *Reach:* the proof. *Known:* new. *Review:* confirmed. Added by the review. The packet cites 27.14(c)–(d) only for the summary, and its node rests on purity, so no planned statement is affected.
- **E707** (misprint; J. Tuitman, Counting points on curves using a map to P^1, II, §4.3 Step III, p. 12, against the proof of Proposition 4.7, p. 14 (arXiv v2)). Step III defines the Frobenius matrix by F_p(ω_i) = Σ_j F_{j,i}ω_j, so column i holds the coordinates of F_p(ω_i). The proof of Proposition 4.7 then takes the q-power matrix to be F^{σ^{n−1}}F^{σ^{n−2}}⋯F. *Correction:* The two do not match. In the column convention the matrix of F_p^n is F·F^{σ}⋯F^{σ^{n−1}}; the product F^{σ^{n−1}}⋯F is the matrix of F_p^n in the row convention F_p(ω_i) = Σ_j F_{i,j}ω_j. The author's Magma implementation (pcc_q, zeta_q.m, functions frobmatrix and galois_norm) uses rows with the decreasing product, so read F_{i,j} in Step III. *Why:* For a σ-semilinear map a with column matrix A, a^2 has column matrix A·σ(A). For n = 3 the two orders give different characteristic polynomials: over W(F_8), F_8 = F_2[a]/(a^3 + a + 1), any lift of the matrix with rows (0, 1) and (a, a^2) has trace of A^{σ^2}A^{σ}A ≡ 0 and trace of A·A^{σ}·A^{σ^2} ≡ 1 modulo 2 (computed by hand and by machine). *Reach:* nothing. *Known:* new. *Review:* confirmed. Added by the review. The precision bound of Proposition 4.7 does not depend on the order. The packet's node uses the row convention with the decreasing product, which is consistent; the node now states its convention explicitly.

## What remains for RD.7

- Read Mieda (Math. Z. 257, 2007) and decompose RD.7/mieda-p-adic-picard-lefschetz into the semistable blow-up lemma and the injective Frobenius-compatible comparison map (gap 1).
- The Kloosterman applications RD.7/kloosterman-semistable-realization and RD.7/kloosterman-newton-above-hodge depend on C_dR and C_st, owned by CohomologyComparisons:CP.4 above this tier (gap 2); apply the restructuring proposal or move the comparisons down, then re-point the prerequisites.
- The Kloosterman F-isocrystal, its middle rigid cohomology and the identification with the hypersurface 𝒦 are cited at stage level (PadicDifferentialEquationsAndRigidCohomology:RD.6); replace the stage citation by the node ids the RD.6 follow-up plans.
- The étale trace formula and arithmetic zeta function remain the inherited pending upstream TraceFormula request (parent packet, SchemeAndStackFoundations:SF.2; PR 196 still open at 4bd72379658126cbe9be935656396f0c9dac4de0 on 14 October 2026); when it lands, cite its Layers 12–13 in RD.7/rigid-zeta-expression and RD.7/ell-adic-comparison-smooth-projective.
- Compare the Katz–Messing argument with the plan's purity route when the paper is accessible (gap 3); no step depends on it.
- Assembly: add RD.7/kedlaya-reduction-denominators and RD.7/hyperelliptic-integral-frobenius-lattice to the prerequisites of the parent's RD.7/kedlaya-point-counting-certification, whose items (iv)–(vi) they prove, and drop that node's recorded gap on Edixhoven's Lemma 4.3.5 (now read). The edges run from these two nodes to the parent node, never back.
- Shiho's functor Φ from locally free convergent isocrystals to crystalline isocrystals, without Frobenius structures, is sketched inside RD.7/tube-to-envelope-comparison-map (proof step 4; Shiho §2, pp. 29–30) and used by the Frobenius-free variant of RD.7/crystalline-rigid-comparison-with-coefficients. RD.3 supplies the convergent category and, with Frobenius, the equivalence with F-crystals up to isogeny (RD.3/restriction-to-convergent). The RD.3 follow-up, or the assembly, should give Φ a node of its own and cite it from these two nodes.

## Sources

- [P. Berthelot, *Finitude et pureté cohomologique en cohomologie rigide (avec un appendice par A. J. de Jong)*](https://web.archive.org/web/2016/https://perso.univ-rennes1.fr/pierre.berthelot/publis/Finitude.pdf), Invent. Math. 128 (1997), 329–377; author's preprint of November 1997 (47 pp.), read in the Internet Archive copy of the author's former Rennes publication page; journal pagination not collated. Read: §1, Propositions 1.8, 1.9 (with its proof) and 1.10, printed pp. 13–16 of the preprint.
- [A. Shiho, *Relative log convergent cohomology and relative rigid cohomology I*](https://arxiv.org/abs/0707.1742v2), arXiv:0707.1742v2 (21 May 2008). Read: Introduction, p. 1; §2, Proposition 2.35 (the functor Φ) with its sketched proof, pp. 29–30; §2, the construction before Theorem 2.36, Theorem 2.36 with proof, Corollaries 2.37–2.38, pp. 30–31.
- [K. S. Kedlaya, *Notes on isocrystals*](https://arxiv.org/abs/1606.01321v6), arXiv:1606.01321v6. Read: Definition 2.1, Theorem 2.2, Remark 2.3, pp. 2–3; Definition 8.1, Remark 8.2, Theorems 8.3–8.4, Remark 8.5, pp. 19–20.
- [H. Guo and E. Reinecke, *A prismatic approach to crystalline local systems*](https://arxiv.org/abs/2203.09490v3), Invent. Math. 236 (2024); arXiv:2203.09490v3 (27 Oct 2023) read here. Read: Theorem 6.13 and its proof with footnote 13, PDF pp. 60–61.
- [P. Deligne, *La conjecture de Weil. I*](http://www.numdam.org/item/PMIHES_1974__43__273_0/), Publ. Math. IHÉS 43 (1974), 273–307 (Numdam). Read: §1, (1.5)–(1.7) and the proof of (1.7) ⇒ (1.6), pp. 275–277.
- [J. S. Milne, *Lectures on étale cohomology*](https://www.jmilne.org/math/CourseNotes/LEC.pdf), Version 2.21, 22 March 2013. Read: §27, Lemma 27.9, Lemma 27.10 and Summary 27.14, pp. 156–159.
- [K. S. Kedlaya, *Fourier transforms and p-adic 'Weil II'*](https://arxiv.org/abs/math/0210149v3), arXiv:math/0210149v3. Read: §1.1, p. 3; §6.6, Proposition 6.6.1, Theorem 6.6.2 and the Weil-conjecture statements (a)–(c) with their proofs, pp. 50–52.
- [M. D'Addezio, *Parabolicity conjecture of F-isocrystals*](https://arxiv.org/abs/2012.12879v4), arXiv:2012.12879v4. Read: Proof of Theorem 5.1.6, p. 25.
- [K. S. Kedlaya, *Counting points on hyperelliptic curves using Monsky–Washnitzer cohomology*](https://arxiv.org/abs/math/0105031v2), J. Ramanujan Math. Soc. 16 (2001), 323–338; arXiv:math/0105031v2 read here. Read: §3, Lemma 2 with proof and Lemma 3, p. 5; the trace computation and the precision N_1, pp. 5–6.
- [K. S. Kedlaya, *Comments/errata for 'Counting points on hyperelliptic curves using Monsky–Washnitzer cohomology'*](https://kskedlaya.org/papers/hyperell-errata.pdf), author's note dated 13 October 2003 (2 pp.). Read: whole note, pp. 1–2.
- [B. Edixhoven, *Point counting after Kedlaya (EIDMA-Stieltjes Graduate course, Leiden, 22–26 September 2003)*](https://www.math.leidenuniv.nl/~edix/oww/mathofcrypt/carls_edixhoven/kedlaya.pdf), course notes, version of 25 October 2006 (23 pp.). Read: §4.3, Propositions 4.3.1–4.3.2, Remark 4.3.3, Lemmas 4.3.4–4.3.5, pp. 9–14; §5.2–5.3, Proposition 5.3.1 with its sketch, pp. 16–19.
- [D. Harvey, *Kedlaya's algorithm in larger characteristic*](https://arxiv.org/abs/math/0610973v2), arXiv:math/0610973v2. Read: §3, p. 5 (sketch of Kedlaya's algorithm); §4, Proposition 2 and its proof, pp. 5–6 (the use of Kedlaya's Lemmas 2 and 3).
- [J. Tuitman, *Counting points on curves using a map to P^1, II*](https://arxiv.org/abs/1412.7217v2), Finite Fields Appl. 45 (2017), 301–322; arXiv:1412.7217v2 read here. Read: §2, Definition 2.1–Remark 2.7, pp. 2–5; §3, Definition 3.10 and Theorem 3.11, p. 9; §4.1 Step I, p. 11; §4.3 Step III and §4.4 Step IV, p. 12; §4.5, Proposition 4.2–Proposition 4.9, pp. 13–15.
- [J. Tuitman, *Erratum: Counting points on curves using a map to P^1, II*](https://jtuitman.github.io/erratum.pdf), author's one-page erratum, June 2020. Read: whole erratum.
- [J. S. Balakrishnan, N. Dogra, J. S. Müller, J. Tuitman and J. Vonk, *Explicit Chabauty–Kim for the split Cartan modular curve of level 13*](https://arxiv.org/abs/1711.05846v1), Ann. of Math. 189 (2019); arXiv:1711.05846v1 read here. Read: §5.2, equations (22)–(24), pp. 25–26.
- [J. Fresán, C. Sabbah and J.-D. Yu, *Hodge theory of Kloosterman connections*](https://arxiv.org/abs/1810.06454v5), Duke Math. J. 171 (2022); arXiv:1810.06454v5 read here. Read: §5.1.5, Proposition 5.23 with proof, Corollary 5.27 with proof, Remark 5.28, pp. 49–52 (p. 51 checked on the page image).
