# Quaternionic integral geometry and cohomology, R18.2–R18.6

This part builds the finite-level quaternionic input for automorphic Galois representations, modularity lifting and completed cohomology. Its main objects are the actual integral Shimura curves and their special formal modules, the definite integral coefficient modules with their effective stabilisers, and the Drinfeld formal model and arithmetic quotients at division primes. The generic PEL moduli problem, algebraic modular-form carrier, étale-cohomology functors and formal quotient machinery belong to their existing supplier roadmaps. The declarations here specialize those theories to the quaternionic tower and verify its arithmetic hypotheses.

The plan is at target level. R18.2–R18.5 are planned, with the seven precise gaps below, including descent of the connected comparison over K; none is closed or implemented. R18.6 is an export index with no new mathematical node, in accordance with the reviewed library audit and accepted RS-23. A complete planning pass does not certify the still-unproved ramified source repairs or integral Ihara statement. Every packet declaration remains unchecked.

## Conventions and boundaries

In R18.2 and the global part of R18.5, F is totally real and B/F is division, split at exactly one real place τ. The canonical compact curve X_U over the reflex copy τ(F), its effective central quotients and complex uniformisation are imported from R18.1. At a finite place v, K denotes F_v when discussing the local Drinfeld model; a completed maximal unramified extension is written Ǩ. In the R18.2 source conventions K can itself denote this completion. Every comparison fixes its base explicitly. A split finite place uses Carayol's good reduction/deformation theorem; a division place uses the totally-real Boutot–Zink theorem. The rational Boutot–Carayol arithmetic theorem has F=Q and does not silently establish the totally-real version.

In R18.3, D is totally definite over an even-degree totally real F, O is a sufficiently large p-adic integer ring and k its residue field. The auxiliary CM field E of R18.2 and the totally real E of CDN's globalisation have different meanings. The right-level convention is f(dgu)=τ(u)⁻¹f(g), with f(gz)=ψ(z)f(g) and τ(z)=ψ(z)⁻¹ on the level centre. Stabiliser groups are divided by F× before claiming finiteness. The generic AF.5 carrier must be extended to this fixed-central-character quotient: its current discrete-centre hypothesis does not accommodate positive-rank O_F×.

The good-place arithmetic Hecke polynomial is X²−T_vX+q_vS_v, with S_v=ψ(π_v). Residual evaluation sends S_v to q_v⁻¹ det ρ̄(Frob_v). Purity uses geometric Frobenius; the residual dictionary uses arithmetic Frobenius. Covariant crystalline conventions, Cartier duals and relative O_v-heights are explicit: a special quaternionic formal module has relative height 4, absolute p-height 4[F_v:Q_p], and relative Lie rank 2. A raw τ-quotient of an absolute crystal at a ramified place cannot be used as an exact direct summand.

The StableReduction roadmap supplies regular surfaces, codimension-two extension, dual multigraphs and thickness. Its mathematics is imported rather than replanned. The RepresentationTheory and JacobianChallenge upstream documents supply the vocabulary of coefficient lattices, line bundles and Picard groups. Global JL is supplied by R17.3. Patching, choices of Taylor–Wiles primes, auxiliary totally real fields, Galois representations and height identities belong to R22, R23, R19 and R35 respectively. Their existence theorems are not hidden inside a geometric construction here.

## Dependency order

First specialize the PEL and effective component tower in R18.2. Local Drinfeld representability and maximal-level arithmetic uniformisation from R18.5 supply its division-prime regular model. This dependency is acyclic: the local moduli and arithmetic uniformisation nodes use the canonical R18.1 tower and shared suppliers, not the regular-model theorem they establish. Integral coefficient comparisons then give the Hodge line, strict formal-module extension and the bridge lattices.

The definite class set, weight and extended AF.5 evaluation theorem precede all integral arguments in R18.3. Prime-to-p isotropy gives ordinary integral base change; KW's controlled isotropy exponents and the quotient by N-torsion give the Taylor–Wiles freeness theorem even where automatic neatness is unavailable. Localised control alone consumes the early R19 local–global theorem. Its requested R19 declaration may use the early coefficient/eigenspace construction, but may not depend on that control theorem or on R22/R23. This keeps the geometric freeness theorem independent of modularity.

R18.4 first imports the actual coefficient and finite-level cohomology complexes. Integral freeness and reduction are conditional on two explicit residual H⁰ vanishings. The indefinite degeneracy maps are constructed, with traces and local degree, but injectivity/saturation is a separate recorded gap. Manning–Shotton's patching proof of indefinite Ihara cannot be used upstream of the patching consumer. R18.5 ends with the arithmetic tree graph and its identification with the generic semistable Jacobian monodromy supplied by R11.4.

## R18.2

The fine tower is the source of universal torsion and deformation data. Coarse quotients retain normality and the rational Hodge line, but they do not inherit regularity or a universal family without a separate argument. The divisor factor in integral Kodaira–Spencer is fixed before transporting the torus bridge.

### Quaternionic auxiliary PEL instance

**Declaration:** `QuaternionPELInstance`; construction; node `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance`.

For E=F(√λ), λ<0 rational with p split in Q(√λ), specialize the shared PEL datum to B′=B⊗F E, V′=B′, ψ′(x,y)=Tr_E/Q Trd_B′/E(γ′xȳ), and involution b*=γ′⁻¹ b̄γ′. At p use O_B′,p=O_B,p*⊕O_B,p and the self-dual lattice O_B,p^∨⊕O_B,p. Verify the special O_B,v Lie condition and zero Lie component away from v. This full regular representation has abelian dimension 4[F:Q]; the Morita-reduced E-representation has dimension 2[F:Q]. Generic PEL moduli and representability are imports.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- γ′ chosen with the required positivity; sufficiently small tame level; integral trace/different factors retained.

**Construction or proof.**

1. Check involution, trace pairing and positivity on the existing PEL carriers.
2. Compute the split E_p factors, dual lattice and determinant/Lie condition; use Carayol §2 and YZ §3.2, with the reviewed dimension correction.
3. Use the PEL representability theorem only at its verified good primes; division-prime geometry is supplied independently by R18.5.

**Consumers determining the API.**

- Carayol §§2,4–5 and YZ Proposition 3.2: Supplies the actual auxiliary object used to construct integral quaternionic curves, with no new generic PEL engine.

**API.**

- `QuaternionPELInstance.tracePairing` (data): The specialized pairing is Tr_E/Q Trd(γ′xȳ), with its induced involution.
- `QuaternionPELInstance.selfDual` (characterisation): The chosen p-lattice equals its pairing dual.
- `QuaternionPELInstance.lieCondition` (characterisation): The active v-part is special of rank one over the unramified quadratic order, and the complementary Lie part is zero.
- `QuaternionPELInstance.genericComparison` (compatibility): The represented generic curve is the auxiliary canonical X′ at the specified level.

**Unit tests.**

- `QuaternionPELInstance.regularDimension` (computation): For F=Q the full B′ regular representation yields abelian dimension 4, not 2.
- `QuaternionPELInstance.moritaDimension` (compatibility): For F=Q the Morita-reduced E-instance yields abelian dimension 2.
- `QuaternionPELInstance.dualLattice` (non-example): If the trace lattice is not self-dual, O_B,p⊕O_B,p fails the perfect-pairing test; replacing the first factor by its dual passes.

**Direct prerequisites.** `PELModuli:M0`, `PELModuli:M1`, `PELModuli:M2`, `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`.

**Acceptance checks.**

- Full B′ regular module has Q-dimension 8[F:Q], hence abelian dimension 4[F:Q].
- The dual lattice pairing is perfect even when the trace different is nontrivial.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §§3.1–3.2, pp.551–555. Specialized integral datum; correct dimension using PAPER-YUAN-ZHANG-18/E19.

**Atlas planet:** Quaternionic PEL datum.

**Implementation status:** `unchecked`.

### Effective small level and genus

**Declaration:** `EffectiveSmallLevel`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.2/effective-small-level`.

If U⊂(1+N O_B)^× with integer N≥3, each geometric connected component of X_U has genus at least 2 and its arithmetic group acts freely on the upper half-plane after quotienting by F×. The effective tower action divides out the closure of F× in B_f×; for F≠Q the closure must not be replaced by the discrete rational centre.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Compact curve hypothesis; principal level N≥3.

**Construction or proof.**

1. Specialize R18.1/quaternionic-effective-stabilizers to the compact canonical tower and the chosen principal integral order level.
2. Reuse its scalar-stabilizer, central-closure and hyperbolic genus conclusions; no second small-level theorem is constructed in R18.2.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-effective-stabilizers`.

**Acceptance checks.**

- The full arithmetic stabiliser can contain infinitely many central units; only the effective stabiliser is trivial.
- The Q split modular curve requires compactification and is imported separately.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §4.1, pp.561–562, Proposition 4.1. Small-level freeness modulo centre and genus bound.

**Implementation status:** `unchecked`.

### Quaternionic p-divisible sheaf

**Declaration:** `QuaternionPDiv`; definition; node `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower`.

On the pro-level canonical curve define H_n=(B_p/O_B,p×X)/U_p(n), with U_p(n)=(1+n O_B,p)^× acting on the fibre by right multiplication and n supported above p. For each fixed torsion level m, shrink tame level until U_p(1)/U_p(m) acts freely; H_n[m] then descends as a finite étale O_B,p-module on that finite generic level. Do not assert a common finite tame level for the entire p-divisible group without proof.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- The effective free pro-level action and all fibre actions are specified; n may be 1.

**Construction or proof.**

1. Use the quotient/torsor construction on the imported tower.
2. Construct compatible finite torsion sheaves, verifying freeness at each torsion level.
3. Take the filtered union and descend each finite stage, with tame level allowed to depend on that stage.

**Consumers determining the API.**

- YZ Propositions 4.3–4.4 and Theorem 4.9: Compares coefficient sheaves and constructs the integral deformation and level interpretation.
- AutomorphicGaloisRepresentations:R19.2: Supplies geometric coefficient objects before constructing Galois representations.

**API.**

- `QuaternionPDiv.torsion` (projection): H_n[m] has fibre m⁻¹O_B,p/O_B,p.
- `QuaternionPDiv.changeLevel` (functoriality): Pullback along n′-level to n-level identifies H_n with H_n′.
- `QuaternionPDiv.splitMorita` (compatibility): At split v, e11H_v identifies with Carayol E∞.
- `QuaternionPDiv.finiteDescent` (structure): For each m a sufficiently small tame level supports its descended finite étale sheaf.

**Unit tests.**

- `QuaternionPDiv.unitTorsion` (degenerate): H_n[O_F]=0.
- `QuaternionPDiv.splitRank` (computation): For F_v=Q_p and B_v=M₂(Q_p), H_v[p] has geometric cardinality p^4; e11H_v[p] has cardinality p^2.
- `QuaternionPDiv.rightAction` (characterisation): A local unit u sends a fibre element x to xu; replacing it by ux generally gives a different action.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/effective-small-level`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, `PELModuli:M1`.

**Acceptance checks.**

- At a split v, e11H_v is Carayol’s one-dimensional O_v-divisible group E∞.
- The quotient action on the coefficient fibre is right multiplication.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §4.1, p.562, p-divisible groups. Associated p-divisible sheaf and finite torsion descent.

**Atlas planet:** Quaternionic p-divisible group.

**Implementation status:** `unchecked`.

### Connected quaternionic and PEL comparison

**Declaration:** `ConnectedPelComparison`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.2/connected-pel-comparison`.

Over F̄ identify the identity pro-components X⁰ and X′⁰ equivariantly for the norm-positive effective groups Δ̄≅Δ̄′. After quotient by O_B,p^1, whose identity components X₁⁰ and X′₁⁰ are defined over K, identify H|X₁⁰ with H′|X′₁⁰ with the transported effective group action. The comparison is of connected components with specified descent, not an isomorphism of the full unrelated global towers.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- The auxiliary split CM choice and effective central kernels are fixed.

**Construction or proof.**

1. Reuse R18.1/yz-component-comparison for the geometric connected components over a common algebraic closure; apply Carayol §4.2 for the pro-tower and norm-one quotient. The geometric supplier does not close the K-descent obligation recorded below.
2. Transport the p-divisible coefficients by §4.4, retaining the centre quotient.
3. Check the norm-one quotient and equivariance, correcting the printed inclusion to an isomorphism.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-component-comparison`.

**Acceptance checks.**

- The component maps commute with effective group action.
- The generic coefficient comparison induces the same finite-torsion map.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §4.1, pp.562–563, Propositions 4.2–4.3. Connected-component and p-divisible comparisons, corrected E39.
- [Henri Carayol, Sur la mauvaise réduction des courbes de Shimura](https://www.numdam.org/item/CM_1986__59_2_151_0.pdf), §§4.2,4.4. Primary comparison of the connected canonical and auxiliary PEL curves.

**Implementation status:** `unchecked`.

### Finite-level PEL comparison

**Declaration:** `FinitePelComparison`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.2/finite-pel-comparison`.

For n supported above p and coprime to d_B, and tame U^p sufficiently small depending on n, choose U′^p so that the connected n-level quaternionic and auxiliary PEL curves are isomorphic over K; the maps and coefficient sheaves agree under this isomorphism.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- n prime to the quaternion discriminant; smallness depends on n.

**Construction or proof.**

1. Use the connected and coefficient comparisons to identify level trivialisations.
2. Choose finite-level tame subgroups killing the effective residual action as in Carayol Proposition 4.5.5.
3. The named R18.1 supplier gives the geometric finite-level comparison only. Restore the exact Carayol descent field and cocycle before asserting the target over K; see the consuming-part gap.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/connected-pel-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-component-comparison`.

**Acceptance checks.**

- Do not replace “depending on n” by uniform smallness.
- No p-level at a division place is covered by this coprime-to-d_B comparison.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Proposition 4.4, pp.563–564. Finite-level passage with the discriminant restriction.

**Implementation status:** `unchecked`.

### Carayol split-place integral model

**Declaration:** `CarayolSplitModel`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`.

If B_v is split, U_v=GL₂(O_v) and tame level is sufficiently small, X_U has a proper smooth model over O_v with canonical generic fibre; at principal v^n level the normalised cover is the regular model representing the Drinfeld-basis level problem on the special one-dimensional height-two O_v-divisible group. Transition and tame Hecke maps extend over O_v. Higher v-level models are not asserted smooth or semistable.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Carayol assumes [F:Q]>1; for Q use the modular or fake-elliptic supplier separately.
- The p-components away from v meet the source’s fixed-level hypotheses.

**Construction or proof.**

1. Construct the auxiliary integral moduli problem by Carayol §5 and its special p-divisible factor.
2. Apply Serre–Tate/deformation theory and Drinfeld bases in §§6–7.
3. Transfer through the connected PEL comparison and normalisation in §9.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/finite-pel-comparison`, `PELModuli:M2`, `PELModuli:M4`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Acceptance checks.**

- Maximal split v-level is smooth.
- At nonmaximal v-level assert regularity only, with actual completed local deformation ring.

**Sources.**

- [Henri Carayol, Sur la mauvaise réduction des courbes de Shimura](https://www.numdam.org/item/CM_1986__59_2_151_0.pdf), §0.2, §§5.4,6–7,9. Split finite place and Drinfeld-level regularity.

**Atlas planet:** Carayol integral model.

**Implementation status:** `unchecked`.

### Regular quaternionic model tower

**Declaration:** `RegularModelTower`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower`.

Let n be coprime to d_B and U^p⊂U^p(N) for an integer N≥3 prime to p. The minimal regular models X_{n,U^p}/O_v form a projective system extending canonical level maps. At v∤n the model is smooth if B_v splits and a semistable relative Mumford curve if B_v is division. The division case has maximal local level.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Fine principal tame level as stated; no assertion for arbitrary level at d_B.

**Construction or proof.**

1. Use split-place Carayol geometry and the division-place formal uniformisation separately.
2. Use genus≥2 minimal regular-model uniqueness and the effective-level freeness argument of YZ Theorem 4.5.
3. Extend transition maps through the common moduli/normalisation interpretation.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/effective-small-level`, `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Acceptance checks.**

- Division special-fibre components over k̄ are P¹ and nodes have local equation xy=π at fine maximal level.
- Refinement in split p-level need not retain a nodal special fibre.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §4.2, Theorem 4.5, pp.564–565. Regular projective tower with exact local good/bad conditions.

**Atlas planet:** Regular quaternionic models.

**Implementation status:** `unchecked`.

### Coarse quaternionic integral models

**Declaration:** `CoarseModel`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.2/coarse-model`.

For any decomposed compact open U maximal at each prime dividing d_B, construct X_U as the effective finite quotient of a sufficiently small normal fine model. It is normal, projective and flat over O_F, independent of the auxiliary prime used to rigidify level, and has canonical generic fibre. The quotient map is finite of degree the effective group order; it need not be flat everywhere or have regular target.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Fine normal cover U′⊂U and effective group Ū/Ū′; maximality at d_B.

**Construction or proof.**

1. Choose auxiliary p coprime to 2d_B with maximal U_p and principal p-level.
2. Take the finite invariant quotient on the imported scheme-quotient carrier.
3. Compare two auxiliary primes using the regular tower; deduce normality, projectivity and flatness over the Dedekind base.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower`, `PELModuli:M4`, `tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs`, `mathlib:AlgebraicGeometry.Flat`.

**Acceptance checks.**

- Degree uses effective quotient, not the raw central-unit group.
- Local flatness of X_U/O_F does not imply flatness of X_U′/X_U.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §4.2, p.565 and Corollary 4.6. Coarse quotients with honest flatness scope.

**Atlas planet:** Coarse integral models.

**Implementation status:** `unchecked`.

### Integral Hecke extensions

**Declaration:** `HeckeIntegralExtension`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.2/hecke-integral-extension`.

For admissible levels maximal at d_B, a finite generic level map extends to the model tower. Tame Hecke correspondences whose local v-component preserves the specified model problem extend via the two finite maps from the common intersection level, with composition and generic-fibre agreement. Finite étaleness over O_v is asserted only when local p-level/lattice data are unchanged and the relevant PEL deformation criterion applies.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Both source, target and intersection levels satisfy the model hypotheses.
- No unqualified extension of every p-isogeny as an étale map.

**Construction or proof.**

1. Use the projective-system maps and transport the adelic g-action through the local integral moduli interpretation.
2. Apply finite-map comparison and normalization for each leg.
3. Check Hecke composition on the generic fibre and use separatedness for uniqueness.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.2/coarse-model`, `AdelicAlgebraicGroups:AA.4`.

**Acceptance checks.**

- A p-level refinement is finite but may be ramified in the special fibre.
- At unchanged p-components the tame cover is étale on fine models.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Theorem 4.5 and Corollary 4.6, pp.564–566. Integral tower and finite correspondence specialization.

**Implementation status:** `unchecked`.

### Q-factorial coarse models

**Declaration:** `QfactorialModel`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.2/qfactorial-model`.

If L/F is finite and unramified at all finite places where B ramifies or U is not maximal, X_U⊗O_L is Q-factorial: every Weil divisor has a positive multiple Cartier. This does not assert regularity of the coarse model.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- U maximal at d_B; unramified base change at the bad set.

**Construction or proof.**

1. Use regular fine covers after the allowed base extension.
2. Apply the product norm over the finite quotient to local divisor equations.
3. Use two auxiliary primes to cover the entire arithmetic surface.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/coarse-model`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Acceptance checks.**

- The positive Cartier multiple may be the effective quotient degree.
- Ramified base change at a node can destroy regularity, so do not remove the base-change hypothesis.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Corollary 4.6(2), p.566. Q-factoriality in precisely the source’s base-change range.

**Implementation status:** `unchecked`.

### Quaternionic arithmetic Hodge line

**Declaration:** `QuaternionHodgeLine`; construction; node `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`.

Specialize the imported rational line-bundle and metric theory to the unique hermitian Q-line L_U on X_U: compatible under level pullback, equal locally to the relative dualizing line at fine level and maximal U_v, with archimedean norm |dz|=2 Im z. On the coarse generic fibre L_U=ω_{X_U/F}+Σ_Q(1−1/e_Q)[Q]. Extend by norms from fine models and glue away from two auxiliary primes.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- U maximal at d_B; fine models and rational line bundles supplied; e_Q is the effective ramification index.

**Construction or proof.**

1. Apply the generic divisor/line and norm/descent API on each rigidifying cover.
2. Normalize by the effective degree and glue; the regular model tower proves independence.
3. Check the archimedean metric against the explicit Hodge calculation, using the corrected sign.

**Consumers determining the API.**

- YZ Theorem 4.10 and ArakelovGeometryAndAbelianHeights:R35.2: Exports the quaternionic arithmetic Hodge line and its metric; generic hermitian/Q-line and norm theory remain supplier work.

**API.**

- `QuaternionHodgeLine.pullback` (functoriality): Every admissible level map pulls L_target back to L_source.
- `QuaternionHodgeLine.fineDualizing` (compatibility): At fine maximal local level L_U|O_v is the relative dualizing line.
- `QuaternionHodgeLine.coarseCorrection` (characterisation): At branch point Q the correction coefficient is 1−1/e_Q.
- `QuaternionHodgeLine.metric` (data): Under uniformisation the differential dz has norm 2 Im z.
- `QuaternionHodgeLine.unique` (characterisation): Any system of hermitian Q-line bundles on the models X_U (U maximal at d_B) that is compatible with level pullback, equals the relative dualizing line at fine level and maximal U_v, and has archimedean metric |dz|=2 Im z, is canonically isomorphic to L_U (YZ Theorem 4.7, uniqueness).

**Unit tests.**

- `QuaternionHodgeLine.unramified` (degenerate): When every e_Q=1, the generic L_U equals ω.
- `QuaternionHodgeLine.indexTwo` (computation): At an effective ramification point of index 2, the correction is [Q]/2.
- `QuaternionHodgeLine.imaginaryUnit` (computation): At z=i, |dz|=2.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/qfactorial-model`, `AutomorphicBundles:B2`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `ArakelovGeometryAndAbelianHeights:R35.2`.

**Acceptance checks.**

- Coarse branch corrections are required; ω alone fails pullback compatibility.
- The metric is 2y, not y or its reciprocal.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §4.2, Theorem 4.7, pp.567–568. Specialized arithmetic Q-line, including effective ramification.

**Atlas planet:** Arithmetic Hodge bundle.

**Implementation status:** `unchecked`.

### Integral quaternionic p-divisible group

**Declaration:** `IntegralPdiv`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-pdiv`.

For n prime to d_B the generic H_n extends over the pro-limit of fine models over O_K. Its v-factor is a strict special formal O_B,v-module and the factors away from v are étale. The completed maximal-local-level model is the deformation space with the prescribed O_B-action; n=v^a n′ level classifies a Drinfeld v^a-basis and a full étale n′-level structure. At division v the allowed n has a=0.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Strict O_v-module convention; active relative Lie rank 2 and O_v-height 4; absolute p-height 4[F_v:Q_p].

**Construction or proof.**

1. Transfer the auxiliary PEL p-divisible group using connected components and finite torsion descent.
2. Apply Carayol deformation theory at split v and Drinfeld representability at division v.
3. Recover the exact integral level problem; retain strictness and coefficient component conditions.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability`, `PELModuli:M1`.

**Acceptance checks.**

- An absolute Dieudonné crystal at ramified F_v has rank 4[F_v:Q_p], not 4.
- Do not classify unrestricted division p-levels by this theorem.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Theorem 4.9, pp.568–569. Integral special factor, relative deformation and discriminant-qualified levels.

**Implementation status:** `unchecked`.

### Integral quaternionic Kodaira–Spencer

**Declaration:** `IntegralKodairaSpencer`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-kodaira-spencer`.

Using the strict O_v-relative crystal with rank-2 Hodge pieces W,W^t, set N=det W⊗det W^t. The determinant of the Kodaira–Spencer map identifies N with ω^{⊗2}(−d_B,v), where d_B,v=0 at split v and the reduced special fibre at division v. At ramified F_v/Q_p this target requires the relative/saturated filtration, not the raw τ-quotient of the absolute crystal.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Fine regular finite-level models; maximal v-level; relative Dieudonné filtration and Cartier dual convention explicitly supplied.

**Construction or proof.**

1. Apply the relative Grothendieck–Messing tangent calculation; split matrix idempotents give the unramified B_v case.
2. At division v compute on the smooth locus of the special fibre and on the generic fibre; both j-maps can be nonunits at nodes.
3. Extend the determinant isomorphism across codimension two on the regular surface; retain the source repair gap for the ramified relative filtration.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-pdiv`, `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`, `CrystallineCohomology:CR.7`, `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

**Acceptance checks.**

- The determinant is det W⊗det W^t, not det W∨⊗det W^t.
- At xy=π, x and y are both nonunits at the node; this does not invalidate extension across codimension two.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Theorem 4.10, pp.569–570. Corrected determinant and relative crystal; E8, E9 (review-amended correction), E30.

**Implementation status:** `unchecked`.

### Torus bridge and Tate coefficients

**Declaration:** `BridgeTateComparison`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-tate-comparison`.

Import the canonical torus Y and datum morphism (X×Y)/Δ(A_F,f×)≅X″ from R18.1, with Δ(z)=(z,z⁻¹) and effective rational-central closures. On X₁×Y₁, identify f₁*T(H″) with π₁*T(H)⊗O_E,p π₂*T(I), where I=(E_p/O_E,p×Y)/O_E,p×. The two centre actions cancel and H″|X′=H′.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- E embeds in B; the maximal order contains O_E,p, not merely its units; prescribed nearby CM types.

**Construction or proof.**

1. Apply the imported torus bridge to the actual coefficient actions x(b,e)=exb.
2. Compute the three Tate lattices and tensor over O_E,p.
3. Check diagonal centre cancellation and finite-torsion descent.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.1/yz-torus-bridge`, `PELModuli:M1`.

**Acceptance checks.**

- The tensor product is not a Cartesian product of Tate modules.
- The diagonal action is (z,z⁻¹), so its centre acts trivially on the tensor.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §5.1, pp.571–573, Proposition 5.1. Imported bridge with owned coefficient specialization.

**Implementation status:** `unchecked`.

### Integral torus-bridge model

**Declaration:** `BridgeIntegralModel`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-integral-model`.

Over K′, the completed maximal unramified reflex extension at v′, the bridge identifies X″₁ with the quotient of X₁×Y₁. Extending Y₁ by copies of Spec O_K′ transports the model of X₁ to a flat model of X″₁ and its open-and-closed X′₁ components. It is smooth if B_v splits and has stable Mumford fibres if B_v is division; ramified K′/K base change need not preserve regularity.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- The bridge’s effective quotient and descent data are supplied.

**Construction or proof.**

1. Extend the zero-dimensional unramified torus components.
2. Descend the product model along the effective diagonal action.
3. Compute the completed node after ramified base change.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-tate-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower`, `AdicSpacesPartII:R2/admissible-formal-scheme`.

**Acceptance checks.**

- After ramification index e, a node has xy=π′^e, which is not regular for e>1.
- No global fine moduli extension of the case-2 universal family is asserted.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §5.2, pp.573–574. Integral bridge with exact regularity boundary.

**Implementation status:** `unchecked`.

### Pointwise p-divisible extension

**Declaration:** `BridgePointExtension`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-point-extension`.

For a finite L/K′ and points y∈Y₁(L), x′∈X′₁(L), x″∈X″₁(L), the corresponding I_y,H′_x′,H″_x″ extend uniquely over O_L. For H″ use the Tate tensor, checking that at each embedding only one factor contributes weight −1 so that no weight −2 occurs. The p=2 case requires the integral Barsotti–Tate classification including the dyadic theorem. This is pointwise and does not by itself construct a global universal abelian scheme.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Integral crystalline lattice functor and full faithfulness over O_L; a finite extension may be used to lift the bridge point.

**Construction or proof.**

1. Compute the torus crystalline character and componentwise weights.
2. Tensor with the strict quaternionic factor, excluding simultaneous weight −1.
3. Apply the all-prime classification and descend using uniqueness/full faithfulness.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-tate-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-pdiv`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

**Acceptance checks.**

- Tensoring two arbitrary {0,−1}-weight representations can produce −2; the component check is necessary.
- For p=2, citing the p>2 classification is insufficient.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Proposition 5.2, p.574. Pointwise theorem with E34–E35 corrections.

**Implementation status:** `unchecked`.

### Filtered bridge crystal comparison

**Declaration:** `BridgeFilteredCrystal`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-filtered-crystal`.

The covariant filtered integral crystal of H″_x″ is the coefficient tensor of those of H_x and I_y over O_E,p, with base change to O_L. This is a structured crystalline tensor comparison supplied by the integral p-adic Hodge owner. On the τ-part the resulting Hodge-piece tensor formulas hold as direct-summand formulas when F_v/Q_p is unramified; at ramified v raw τ-quotients are not exact.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- Chosen integral crystalline functor, compatible tensor and Hodge filtration; local p=2 coverage supplied.

**Construction or proof.**

1. Apply the Tate tensor comparison and the integral crystalline functor.
2. At unramified v take exact idempotent summands.
3. At ramified v record the required saturated/relative determinant comparison as a gap rather than asserting τ-exactness.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-point-extension`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Acceptance checks.**

- For ramified F_v=Q_p(√p), a mismatched τ-quotient may contain O_L/(2√p).
- The integral statement is stronger than a rational crystalline isomorphism.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Proposition 5.3 and discussion of Proposition 5.4, pp.574–575. Filtered tensor versus the nonexact ramified τ-quotient; E31.

**Implementation status:** `unchecked`.

### Bridge Hodge determinant cancellation

**Declaration:** `BridgeDeterminant`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-determinant`.

At unramified F_v/Q_p, the rank-one torus Hodge factor twists W(H″) by its dual and W(H″^t) by itself. Thus det W(H″)⊗det W(H″^t)≅(det W(H)⊗det W(H^t))⊗O_L, as lattices in the generic square-canonical line. The same intended ramified-prime export must use a proved saturated determinant comparison; it is an explicit source-repair gap. No equality Hom_OE=Hom_OB or unrestricted OE-linear universal deformation is claimed.

**Hypotheses.**

- F totally real; B/F a division quaternion algebra split at exactly one real place τ; canonical compact curve X_U/F supplied by R18.1.
- A maximal finite-adelic order O_B and its local split identifications are fixed; v|p and K=completion of F_v^ur.
- For the established direct-summand proof F_v/Q_p is unramified; retain the ramified target as a gap.

**Construction or proof.**

1. Use the filtered tensor comparison and exact τ-idempotent Hodge pieces.
2. Cancel the rank-one factor and its inverse in the two determinants.
3. Use the corrected quaternionic Kodaira–Spencer line; do not use the false rank-2 versus rank-1 Hom identity.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-filtered-crystal`, `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-kodaira-spencer`.

**Acceptance checks.**

- Hom_OE has generic rank 2 while Hom_OB has rank 1 in the standard split representation.
- The lattices lie in ω², not ω⁻².

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Proposition 5.4 and Corollary 5.5, pp.575–576. Determinant cancellation with E31–E32 corrected scope.

**Implementation status:** `unchecked`.

## R18.3

These declarations supply finite integral modules and geometric auxiliary-level control. The norm branch is removed before cuspidal Jacquet–Langlands. All averaging denominators, factorial pairings, isotropy exponents and dyadic sign choices are stated explicitly; arbitrary coefficient representations do not inherit the KW assertions without their lattice hypotheses.

### Definite quaternionic class set

**Declaration:** `DefiniteClassSet`; definition; node `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set`.

Specialize the existing double-coset quotient to C_U=D×\D_f×/(U A_F,f×). Its effective stabiliser at t is Γ_t=(U A_F,f×∩t⁻¹D×t)/F×. Use the quotient by the rational centre before asserting finiteness. Changing t by dtu z transports the stabiliser and its coefficient action by conjugation.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.

**Construction or proof.**

1. Instantiate DoubleCoset.Quotient using the adelic centre times U as right subgroup.
2. Use finiteness of the definite quaternion ideal-class set modulo the centre.
3. Compute isotropy of right level action and divide out F×; verify coefficient action is well-defined.

**Consumers determining the API.**

- KW §7.2 and Lemma 7.4: Computes isotropy, coefficient invariants and the free diamond action.
- Taylor §1: Indexes the weighted pairing.

**API.**

- `DefiniteClassSet.quotient` (compatibility): The carrier is DoubleCoset.Quotient D× (U A_F,f×).
- `DefiniteClassSet.finite` (instance): For definite D and admissible U the class set is finite.
- `DefiniteClassSet.stabiliser` (data): At t the acting finite group is (UZ∩t⁻¹D×t)/F×.
- `DefiniteClassSet.changeRepresentative` (equivalence): Equivalent representatives give conjugate stabilisers and canonically transported invariant modules.

**Unit tests.**

- `DefiniteClassSet.centralUnits` (non-example): For a real quadratic F, quotienting by F× removes its infinite central units; the unquotiented arithmetic group is not finite.
- `DefiniteClassSet.trivialOrbit` (degenerate): A class with Γ_t=1 contributes exactly W, with no averaging denominator.
- `DefiniteClassSet.doubleCosetEquality` (compatibility): Two representatives agree exactly when t′=dtu z for d∈D×, u∈U and z∈A_F,f×.

**Direct prerequisites.** `mathlib:DoubleCoset.Quotient`, `mathlib:DoubleCoset.eq`, `AdelicAlgebraicGroups:AA.5`.

**Acceptance checks.**

- C_U is finite; Γ_t is finite even though the undiscarded arithmetic central units need not be.
- At a representative with trivial effective stabiliser the coefficient summand is all W.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7 (opening), pp.57–59, display (5); §7.2, pp.61–62. Central quotient and finite isotropy, used in every integral assertion.

**Atlas planet:** Definite quaternionic class set.

**Implementation status:** `unchecked`.

### Quaternionic integral weights

**Declaration:** `QuaternionWeight`; construction; node `HilbertModularVarietiesAndShimuraCurves:R18.3/quaternion-weight`.

Specialize AF.4 coefficient lattices to parallel weight k≥2: W_k=⊗_{σ:F→E} Sym^{k−2} O², using chosen splittings at v|p and the restricted U_p action. The centre acts by N_{F/Q}(z)^{k−2}; hence ψ near p must have inverse this action. For p=2 KW uses k=2. At a dyadic ramified division place use its discrete order-two quotient and one of the two sign characters, rather than a nonexistent GL₂ splitting.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- p unramified in F for the KW weight construction; D split at each active p-adic weight place.

**Construction or proof.**

1. Import integral symmetric powers and tensor coefficient lattices with their semigroup actions.
2. Check the product of central scalar powers and its inverse character.
3. For a division dyadic factor distinguish maximal compact from the full D_v× and its sign extension.

**Consumers determining the API.**

- KW Lemmas 7.1–7.4 and Taylor §1: Fixes the integral coefficient action needed for base change, isotropy and pairing.
- R18.4 coefficient comparison: Matches the algebraic representation after checking dual and central-character conventions.

**API.**

- `QuaternionWeight.rank` (structure): Parallel weight k over a degree-d field has rank (k−1)^d.
- `QuaternionWeight.centralAction` (characterisation): A scalar z acts by N(z)^{k−2}.
- `QuaternionWeight.baseChange` (functoriality): Scalar extension commutes with the tensor of symmetric-power lattices.
- `QuaternionWeight.weightTwo` (compatibility): At k=2 the lattice is the trivial rank-one O-representation.

**Unit tests.**

- `QuaternionWeight.weightTwoRank` (degenerate): For any d, weight 2 has rank 1.
- `QuaternionWeight.quadraticWeightFour` (computation): For d=2 and k=4 the rank is 9.
- `QuaternionWeight.factorialObstruction` (non-example): At p=2 and k=4 the natural pairing on Sym²(Z₂²) pairs X² with Y² to ±2 and XY with itself to ±1, so its Gram matrix has determinant ±4 and it is not perfect over Z₂.

**Direct prerequisites.** `AutomorphicFormsOnReductiveGroups:AF.4`, `mathlib:Representation`.

**Acceptance checks.**

- Weight 2 has rank one with trivial algebraic action.
- For degree d, parallel weight k has coefficient rank (k−1)^d.
- The invariant perfect pairing requires factorials through k−2 to be units.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7 (opening), pp.58–59. Integral coefficient module and dyadic convention.
- [Richard Taylor, On the Meromorphic Continuation of Degree Two L-Functions](https://ems.press/content/book-chapter-files/27484?nt=1), §1, pp.741–742. The natural differential pairing on Sym^{k−2} pairs monomials with factorial coefficients; it is perfect only in the stated weight range.

**Implementation status:** `unchecked`.

### Fixed-central-character algebraic forms

**Declaration:** `DefiniteSpecialisation`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-specialisation`.

Use the extended AF.5 carrier, not a new generic definition, for functions f:D_f×→W_A satisfying f(dgu)=τ(u)⁻¹f(g), f(gz)=ψ(z)f(g). Evaluation at class representatives identifies S_{τ,ψ}(U,A) with ⊕_{t∈C_U} W_A^{Γ_t}. This requires AF.5 to admit the adelic central quotient: its current discrete-centre hypothesis does not cover O_F× of positive rank.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- A is an O-algebra; τ and ψ extend by scalars.

**Construction or proof.**

1. Request the fixed-central-character version of AF.5 and specialize D×.
2. At each t compute its effective stabiliser action using τ and ψ.
3. Evaluate and reconstruct equivariant functions; show independence of representatives.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set`, `HilbertModularVarietiesAndShimuraCurves:R18.3/quaternion-weight`, `AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms`, `AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms-structure`.

**Acceptance checks.**

- For τ=1, ψ=1 and trivial stabilisers this is A^{C_U}.
- Replacing Γ_t by the full group containing F× is not the finite-invariants formula.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7 (opening), pp.58–59, display (5). Specialization of shared carrier; extension of generic supplier is explicit.

**Implementation status:** `unchecked`.

### Neat-level reduction and base change

**Declaration:** `NeatnessBaseChange`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change`.

If every effective Γ_t has order invertible in O, S_{τ,ψ}(U,O) is finite free and base change to every O-algebra A identifies S(U,O)⊗A with S(U,A). Thus reduction modulo the uniformizer is surjective. Taylor Lemma 1.1 ensures this when p>3 is unramified in F in its stated compact definite setup. For p=2 or 3 use a specified auxiliary torsion-free level, not the automatic p>3 argument.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- All stabiliser orders prime to p, or an explicitly constructed auxiliary effective torsion-free level.

**Construction or proof.**

1. Apply the averaging idempotent |Γ_t|⁻¹Σγ to each finite free coefficient module.
2. Its image is a direct summand and scalar extension commutes with the idempotent.
3. Use the exact neatness source hypotheses; request the degree/auxiliary-level argument referenced as Khare Lemma 2.2.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-specialisation`, `mathlib:Module.Free`, `mathlib:Module.Finite`.

**Acceptance checks.**

- Finiteness of Γ_t alone is insufficient in residue characteristic dividing its order.
- For a cyclic group of order p, averaging is unavailable over Z_p.

**Sources.**

- [Richard Taylor, On the Meromorphic Continuation of Degree Two L-Functions](https://ems.press/content/book-chapter-files/27484?nt=1), Lemma 1.1 and Corollary 1.2, pp.738–739. Automatic prime-to-l isotropy with exact restrictions.
- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §8.2, p.73; §8.4, p.77. Auxiliary smallness is geometric, not a modularity input.

**Atlas planet:** Neat-level base change.

**Implementation status:** `unchecked`.

### Perfect quaternionic pairing

**Declaration:** `IntegralPairing`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing`.

For a perfect τ-pairing satisfying the determinant/central-character similitude law and prime-to-p effective stabilisers, the sum over class representatives, weighted by |Γ_t|⁻¹ and ψ(Nrd t)⁻¹, is a perfect O-pairing on S(U,O). For the standard differential pairing on Sym^{k−2}, require its factorial entries to be units (Taylor uses 2≤k≤p+1). The adjoint of [UgU] is ψ(Nrd g)[Ug⁻¹U] with the matching coefficient action.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- A perfect integral coefficient pairing and unit isotropy denominators; Taylor weight range only where invoked.

**Construction or proof.**

1. Use the invariant direct-summand decomposition and average the coefficient pairing.
2. Check representative independence using the similitude factor.
3. Reverse the finite double-coset correspondence to compute its adjoint.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change`, `AutomorphicFormsOnReductiveGroups:AF.4`, `AutomorphicFormsOnReductiveGroups:AF.5`.

**Acceptance checks.**

- At k=p+2 the factorial pairing can degenerate modulo p.
- A one-point class set with trivial coefficient and stabiliser has pairing ab.

**Sources.**

- [Richard Taylor, On the Meromorphic Continuation of Degree Two L-Functions](https://ems.press/content/book-chapter-files/27484?nt=1), §1, pp.741–742. Weighted integral pairing and inverse-double-coset adjoint.

**Implementation status:** `unchecked`.

### Split Hecke normalization

**Declaration:** `SplitHeckeNormalisation`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation`.

At v∉S with D_v=M₂(F_v), U_v=GL₂(O_v) and unramified coefficients, specialize AF.5 double-coset Hecke action: T_v=[U diag(π_v,1)U], S_v=[U diag(π_v,π_v)U]=ψ(π_v). The arithmetic Satake polynomial is X²−T_vX+q_vS_v. All change-of-level and commuting away-place actions are imported and checked with these local and coefficient conventions.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.

**Construction or proof.**

1. Compute the q_v+1 single cosets in the spherical T_v double coset.
2. Use the generic semigroup coefficient extension and Hecke convolution.
3. Match the arithmetic Satake normalization to R17.3.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-specialisation`, `AutomorphicFormsOnReductiveGroups:AF.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/split-hecke`.

**Acceptance checks.**

- S_v is the scalar character, not q_v times it.
- For q_v=p the determinant specialization is p S_v.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7 (opening), p.59; §7.4, p.65. The polynomial normalization used by the eigenroot and residual ideal.

**Implementation status:** `unchecked`.

### Norm-factor forms and Eisenstein support

**Declaration:** `NormBranch`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.3/norm-branch`.

For parallel weight 2 and compatible finite character, and equally for residual k-valued forms whose finite coefficient action is killed by the level, the forms factoring through Nrd are exactly the SL₂-invariant local branch under the strong-approximation hypotheses of KW §7.1. Their good-place Hecke eigenvalues give sums of characters, so their localization at a non-Eisenstein maximal ideal vanishes. Following KW §7, a maximal ideal m of T_ψ(U) is Eisenstein if T_v−2 and S_v−1 lie in m for all but finitely many places v split in a fixed finite abelian extension of F; non-Eisenstein means not Eisenstein. No Galois representation is constructed here.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×; or, for the residual use in R18.3/definite-degeneracy, τ̄ is a finite-dimensional representation over k on which U acts trivially and ψ̄:A_F,f×/F×→k× satisfies τ̄(z)=ψ̄(z)⁻¹ on U∩A_F,f×.
- Weight 2; strong approximation for D¹ at a chosen split finite place.

**Construction or proof.**

1. Translate the invariance into constancy on norm fibres by strong approximation.
2. Compute T_v and S_v on a norm character.
3. Use a good-place operator outside the ideal to annihilate the localized branch.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation`, `AdelicAlgebraicGroups:AA.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

**Acceptance checks.**

- The norm character branch must be excluded from global Jacquet–Langlands.
- A residual absolutely irreducible system supplied by R19 yields a non-Eisenstein ideal.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7 (opening), pp.59–60: definition of Eisenstein maximal ideals and proof of Lemma 7.1. Character branch and geometric support of degeneracy kernels.

**Implementation status:** `unchecked`.

### Definite Ihara degeneracy map

**Declaration:** `DefiniteDegeneracy`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-degeneracy`.

At a finite place w∉Σ (so D is split at w), with w added to S for the Hecke algebra, compact U with hyperspecial U_w and a finite-dimensional residual coefficient module W̄_τ over k on which U_w acts trivially, the degeneracy map S_{W̄_τ,ψ̄}(U,k)²→S_{W̄_τ,ψ̄}(U₀(w),k), (f₁,f₂)↦f₁+diag(1,π_w)f₂, has kernel supported on the norm-factor Eisenstein branch. Hence it is injective after non-Eisenstein localization (KW Lemma 7.1). This node supplies the residual input to KW Corollary 7.5; arbitrary coefficient-algebra base change and an integral indefinite Ihara theorem are not consequences of Lemma 7.1.

**Hypotheses.**

- F is totally real of even degree, p is unramified in F, and D/F is totally definite, with finite ramification set Σ as in KW §7.
- U is compact open. W̄_τ is a finite-dimensional continuous representation over the finite residue field k, with ψ̄:A_F,f×/F×→k× and τ̄(z)=ψ̄(z)⁻¹ on U∩A_F,f×. The residual action factors through a finite quotient.
- w∉Σ, U_w=GL₂(O_w), U_w acts trivially on W̄_τ, and the smaller level changes only its w-component to the Iwahori U₀(w). The Hecke algebra omits w.

**Construction or proof.**

1. Pass to an open subgroup that kills the finite residual coefficient action. A kernel relation then forces f₁ to be invariant under U·SL₂(F_w).
2. Use generation by the two conjugate maximal compact subgroups at w, and apply strong approximation for the norm-one quaternion group.
3. The resulting function factors through Nrd and is killed by non-Eisenstein localization. The later integral control theorem uses this residual injectivity together with its separate equal-rank and characteristic-zero comparisons.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/norm-branch`, `AutomorphicFormsOnReductiveGroups:AF.5`.

**Acceptance checks.**

- No automorphy-lifting theorem or R23 input enters this proof.
- Non-Eisenstein localization is necessary.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7 (opening), Lemma 7.1, p.60. Precise definite degeneracy input for TW control.

**Implementation status:** `unchecked`.

### Definite Jacquet–Langlands realization

**Declaration:** `DefiniteJl`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-jl`.

Apply R17.3 global Jacquet–Langlands to the characteristic-zero cuspidal definite module after removing χ∘Nrd. At split finite places the Hecke eigensystems agree; at ramified places the GL₂ component is discrete series. Parallel Sym^{k−2} corresponds to holomorphic discrete series of weight k at every real place. Rational realization requires actual compatible coefficient-field models, not merely equality of rationality fields.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- Characteristic zero; exclude one-dimensional norm characters and fix embeddings/splittings.

**Construction or proof.**

1. Decompose the finite-level module in automorphic representations using the generic spectral supplier.
2. Apply global-jl and definite-infinity from R17.3.
3. Use its rational-models comparison only after the coefficient field and descent obstruction have been handled.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-specialisation`, `HilbertModularVarietiesAndShimuraCurves:R18.3/norm-branch`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/definite-infinity`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`.

**Acceptance checks.**

- Weight-2 norm forms have no cuspidal GL₂ transfer.
- Integral lattice equality is not implied by a complex JL bijection.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7 (opening), pp.59–60. Owned transfer imported; this node is its quaternionic finite-level application.

**Implementation status:** `unchecked`.

### Quaternionic isotropy exponent bound

**Declaration:** `IsotropyExponent`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.3/isotropy-exponent`.

For an auxiliary split place w∤p with hyperspecial local control, write N_w=|GL₂(k_w)|. The Sylow-p subgroups of all Γ_t have exponent dividing 2N_w in the compact-level case and 4N_w in KW’s allowed noncompact dyadic division-factor case. The norm maps to ((A_F,f×)²V∩F×)/(F×)²; this final map need not be surjective. Its target has exact sequence 0→O_F×/(O_F×)²→target→Cl(O_F)[2]→0.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- U,V and the distinguished w satisfy KW §7.2; in the noncompact case U⁰ is used for local compactness.

**Construction or proof.**

1. Control the norm-one subgroup by injective reduction at w and divide by ±1.
2. Bound the norm-square quotient by its unit/class-group two-torsion sequence.
3. Combine exponents, distinguishing p=2 and the extra elementary-two level quotient.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set`, `AdelicAlgebraicGroups:AA.5`.

**Acceptance checks.**

- Do not promote the first norm sequence to short exact at its right end.
- For odd p the extra factors of 2 do not affect the p-primary exponent.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.2, displays (6)–(7), pp.61–62. Uniform p-isotropy bound with compact/noncompact distinction.

**Implementation status:** `unchecked`.

### Base-changed local characters annihilate isotropy

**Declaration:** `BaseChangeAnnihilator`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.3/base-change-annihilator`.

Let F′/F be totally real with w split and impose KW Lemma 7.3 residue-field divisibility at the chosen Iwahori places. Choose χ₀ of p-power order equal to the p-part of 2p(4N_w), and χ=χ₀^{4N_w}. Then χ kills every effective stabiliser; it is nontrivial, and when p=2 has order 4. Its local action is through the ratio a/d of the triangular reduction. This statement concerns a given F′ and local characters; choosing global auxiliary fields is R23 work.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- The prescribed residue fields admit χ₀, and all isotropy exponents divide 4N_w.

**Construction or proof.**

1. Compute the norm-ratio image of a stabiliser using the exponent bound.
2. Raise the local character to 4N_w and verify it vanishes on that image.
3. Check its remaining p-power order, including dyadic order four.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/isotropy-exponent`.

**Acceptance checks.**

- A character whose order only divides the isotropy exponent is not sufficient.
- At p=2 the resulting character has order 4 rather than 2.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.3, Lemma 7.3 and its proof, pp.62–63. Field/base-change and residue divisibility retained.

**Implementation status:** `unchecked`.

### Quaternionic Taylor–Wiles level

**Declaration:** `QuaternionTWLevel`; construction; node `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-level`.

For any finite Q away S with D split, q_v≡1 mod p^n, and fixed p-power N divisible by all Sylow-p isotropy exponents, let Δ′_v be the maximal p-quotient of k_v× and Δ_v=Δ′_v/Δ′_v[N]. Put U′_v=Iwahori and U_v=ker(a/d:U′_v→Δ_v), with unchanged factors away Q. Then U′_Q/U_Q=Δ_Q=∏_vΔ_v. The quotient kills N-torsion; it is not the quotient by Nth powers.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- N and Q are inputs; no existence or selection of Taylor–Wiles primes is claimed.

**Construction or proof.**

1. Use the cyclic residue-unit group to construct Δ′ and its N-torsion quotient.
2. Define the ratio on invertible triangular reductions and its open normal kernel.
3. Identify the product quotient and lifts diag(h,1).

**Consumers determining the API.**

- KW Lemma 7.4 and Corollary 7.5: Produces the free diamond action and localized control module.
- GL2ModularityLifting:R22.2: R22 chooses primes and applies this geometric level theorem; it does not own it.

**API.**

- `QuaternionTWLevel.diamondGroup` (data): Δ_Q is the product of the maximal residue p-quotients modulo their N-torsion.
- `QuaternionTWLevel.levelQuotient` (equivalence): U′_Q/U_Q≅Δ_Q via the product diagonal ratios.
- `QuaternionTWLevel.normal` (structure): U_Q is open normal in U′_Q.
- `QuaternionTWLevel.changeQ` (functoriality): For Q′⊂Q the level and diamond quotient forget the factors Q\Q′.

**Unit tests.**

- `QuaternionTWLevel.empty` (degenerate): At Q=∅, Δ_Q=1 and U_Q=U.
- `QuaternionTWLevel.cyclicOrder` (computation): For Δ′=C₈ and N=2, Δ=C₄.
- `QuaternionTWLevel.torsionNotPowers` (non-example): For Δ′=C₈ and N=2 the quotient by Nth powers has order 2, and is the wrong quotient.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/isotropy-exponent`, `mathlib:QuotientGroup.mk`, `AutomorphicFormsOnReductiveGroups:AF.5`.

**Acceptance checks.**

- If |Δ′_v|≤N then Δ_v is trivial.
- If Δ′_v=C_{p^a} and N=p^b with b≤a, |Δ_v|=p^{a−b}.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.4, p.63 (auxiliary levels before Lemma 7.4). Geometric auxiliary level for arbitrary admissible Q.

**Atlas planet:** Quaternionic Taylor–Wiles level.

**Implementation status:** `unchecked`.

### Stabiliser equality at Taylor–Wiles level

**Declaration:** `TwStabilisers`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-stabilisers`.

For the level above, every character of Δ_Q kills the effective isotropy at U′_Q; the effective stabilisers at U_Q and U′_Q agree. Consequently Δ_Q acts freely on the class-set fibres C_{U_Q}→C_{U′_Q}. The invariant coefficient modules attached to all twists have equal O-rank; modulo the uniformizer their identifications are Hecke-equivariant, while arbitrary integral twist identifications need not be.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- N kills all p-isotropy exponents; Δ_Q is the quotient by Δ′[N].

**Construction or proof.**

1. Map stabilisers to residue p-quotients and use their exponent bound.
2. Their images vanish in Δ_Q, so level reduction preserves isotropy.
3. Compare coefficient invariants and free class-set fibres; distinguish integral and residual Hecke compatibility.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-level`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-specialisation`.

**Acceptance checks.**

- The freeness of the diamond action follows from isotropy annihilation, not just finiteness.
- An arbitrary O-linear twisted-module identification is not claimed to preserve Hecke operators.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.4, proof of Lemma 7.4, display (8), pp.64–65. The geometric mechanism behind group-ring freeness.

**Implementation status:** `unchecked`.

### Integral diamond freeness

**Declaration:** `TwFreeness`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-freeness`.

Under KW Lemma 7.4’s coefficient and level hypotheses, S_{τ,ψ}(U_Q,O) is finite free over O[Δ_Q], of rank rank_O S_{τ,ψ}(U′_Q,O). On each free Δ_Q-orbit, the common finite-free invariant coefficient summand gives a regular O[Δ_Q] factor. The localized non-Eisenstein direct factors inherit freeness when the Hecke idempotent is Δ_Q-equivariant.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- Invariant coefficient summands finite free as established in the KW setting; an arbitrary representation without this condition is not covered.

**Construction or proof.**

1. Use the free orbit decomposition and equal stabiliser invariant modules.
2. Identify each orbit module with O[Δ_Q]⊗_O W^{Γ_t}.
3. Use locality of the p-group algebra over the local O-ring for finite projective localized factors.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-stabilisers`, `mathlib:MonoidAlgebra`, `mathlib:Module.Free`.

**Acceptance checks.**

- The rank is measured at U′_Q, not multiplied again by |Δ_Q|.
- The O-rank at U_Q equals |Δ_Q| times the group-ring rank.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.4, Lemma 7.4(2), p.64 (proof p.65). Ownership R18.3; no prime-choice or patching input.

**Atlas planet:** Δ_Q-freeness in presence of isotropy.

**Implementation status:** `unchecked`.

### Localized eigenroot and coinvariant control

**Declaration:** `TwLocalisedControl`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control`.

Given a non-Eisenstein residual system unramified at Q with two distinct Frobenius eigenvalues α_v,β_v, choose the Hensel lift A_v of α_v in X²−T_vX+q_vψ(π_v). Localizing at U_v−α_v selects a finite-free O[Δ_Q] module with rank rank_O S(U,O)_m; its Δ_Q-coinvariants identify with S(U,O)_m via ξ_v(f)=A_vf−diag(1,π_v)f. The Steinberg exclusion used in KW’s proof requires the stated R19 local–global compatibility; geometric Lemma 7.4 is independent of that input.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- Residual irreducibility/non-Eisenstein localization; q_v≡1 mod p, distinct α_v,β_v; actual characteristic-zero local–global compatibility supplied.

**Construction or proof.**

1. Apply the Hensel eigenroot factorization and construct the ξ_v maps.
2. Use R19 compatibility to exclude the unwanted Steinberg branch at Q and obtain the characteristic-zero isomorphism/equal ranks.
3. Use the residual definite-degeneracy theorem (KW Lemma 7.1) as in KW Corollary 7.5 to prove integral surjectivity. Take the Δ_Q-equivariant direct factor and prove the coinvariant/rank comparison.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-freeness`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-degeneracy`, `AutomorphicGaloisRepresentations:R19.2`.

**Acceptance checks.**

- Repeated residual roots do not give the stated direct-summand projector.
- At coinvariants diamonds act as 1 and U_v acts as A_v.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.4, construction of ξv and Corollary 7.5 with its proof, pp.65–66. Compatibility-dependent refinement separated from geometric freeness.

**Implementation status:** `unchecked`.

### Dyadic reduced-norm twist

**Declaration:** `DyadicNormTwist`; construction; node `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-norm-twist`.

For p=2 and a given quadratic character χ:G_n/2G_n→O×, split at S and infinity and unramified outside Q, with 2^n>N ensuring χ(Nrd U_Q)=1, define T_χf(g)=χ(Nrd g)f(g). This O-linear involution preserves the weight, level and central character because Nrd(z)=z². Existence of χ and selection of Q belong to R22/R04, not to this construction.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- p=2; χ²=1; prescribed χ is trivial on the level norms.

**Construction or proof.**

1. Multiply the fixed-central-character functions by χ∘Nrd.
2. Check left D× invariance, level invariance and the square on the centre.
3. Use χ²=1 to obtain the inverse and verify reduction χ≡1 mod the dyadic maximal ideal.

**Consumers determining the API.**

- KW Proposition 7.6 and GL2ModularityLifting:R22.2: Transports auxiliary-level modules under the dyadic character action without choosing the primes.

**API.**

- `DyadicNormTwist.apply` (projection): T_χf(g)=χ(Nrd g)f(g).
- `DyadicNormTwist.involutive` (characterisation): T_χ∘T_χ=id for χ²=1.
- `DyadicNormTwist.centralCharacter` (compatibility): The central character remains ψ since χ(z²)=1.
- `DyadicNormTwist.reduction` (compatibility): At residue characteristic two the reduction of T_χ is the identity.

**Unit tests.**

- `DyadicNormTwist.trivial` (degenerate): The trivial χ gives the identity.
- `DyadicNormTwist.scalar` (computation): A central scalar z contributes χ(z²)=1.
- `DyadicNormTwist.nonquadratic` (non-example): An order-four character with χ(z)=i changes the scalar action by −1 and does not preserve ψ.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-level`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-specialisation`, `mathlib:LinearEquiv`.

**Acceptance checks.**

- Quadratic twisting preserves ψ, while a general character changes it by χ².
- Reduction mod the uniformizer is the identity on the same residual module.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7.5, p.66, before Proposition 7.6. Geometric dyadic involution, owned by R18.3.

**Atlas planet:** Dyadic norm twist.

**Implementation status:** `unchecked`.

### Dyadic twist and Hecke transport

**Declaration:** `DyadicHeckeTwist`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-hecke-twist`.

For the norm twist, T_v and U_v are multiplied by χ(π_v), S_v is fixed, and (f|⟨h⟩)_χ=χ(h)⁻¹(f_χ|⟨h⟩). Since χ≡1 modulo the dyadic uniformizer, the residual maximal ideal is preserved. These equations transport the localized Taylor–Wiles modules and their ranks and coinvariants as in Proposition 7.6, conditional on the given auxiliary character.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- The dyadic norm-twist hypotheses and compatible local diamond lifts.

**Construction or proof.**

1. Move the norm multiplier through each finite coset sum.
2. Use norm of diag(π,1), scalar diag(π,π), and diag(h,1).
3. Reduce the units modulo the dyadic maximal ideal and transport the localized free module.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-norm-twist`, `HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation`, `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control`.

**Acceptance checks.**

- The diamond factor is inverse on the displayed left side.
- S_v is fixed because its norm is π_v².

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Proposition 7.6, pp.66–67. Hecke and diamond formulas with the scalar-square normalization.

**Implementation status:** `unchecked`.

### Dyadic division-place sign extensions

**Declaration:** `DyadicSignExtension`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-sign-extension`.

At a dyadic division place with U_v=D_v×, its maximal compact U_v⁰ has quotient U_vF_v×/(U_v⁰F_v×) of order two. For weight two, each choice of sign extends the compact coefficient action; over characteristic two the two reductions agree. With a set Σ₀ of such places there are 2^{|Σ₀|} sign choices. Compactness-based arguments must use U⁰ and retain this quotient.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- KW noncompact variant allowed only at the specified dyadic division factors; weight two.

**Construction or proof.**

1. Use the local valuation on the division algebra and its centre-square valuation.
2. Identify the effective quotient and its two characters.
3. Take products and reduce signs in characteristic two.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/quaternion-weight`, `GL2AutomorphicRepresentationsAndTransfer:R16.2`.

**Acceptance checks.**

- Over O the signs +1 and −1 differ; over k of characteristic two they coincide.
- The full U_v is not a compact open subgroup.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7 (opening), pp.58–59. Noncompact level convention and its coefficient extensions.

**Implementation status:** `unchecked`.

### Residual quaternionic Hecke ideal

**Declaration:** `ResidualHeckeIdeal`; construction; node `HilbertModularVarietiesAndShimuraCurves:R18.3/residual-hecke-ideal`.

In the CDN §4.1.3 setup, let T^S=O[T_v,S_v:v∉S] be the shared abstract good-place Hecke algebra. Given a continuous residual ρ̄:G_E→GL₂(k) unramified outside S, evaluate T_v↦tr ρ̄(Frob_v), S_v↦q_v⁻¹ det ρ̄(Frob_v), and coefficients by O→k. Define m_ρ̄ as the kernel. The coefficient reduction is surjective, hence this is a maximal ideal. Factoring this evaluation through the acting quotient Hecke algebra requires the eigen-system existence theorem supplied by R19.

**Hypotheses.**

- F totally real of even degree; D/F ramified at every real place, split at the finite places under discussion; O the integers of a sufficiently large finite extension of Q_p, with residue field k.
- U is compact open unless the dyadic division-place variant is explicitly invoked; τ is a finite free coefficient representation and ψ:A_F,f×/F×→O× a continuous idele-class character with τ(z)=ψ(z)⁻¹ on U∩A_F,f×.
- For the CDN application p>2, local F=Q_p, global E even degree with p completely split, D₀ definite and finite-unramified; keep E distinct from the earlier auxiliary CM field.
- q_v is a unit in k; arithmetic Frobenius convention fixed.

**Construction or proof.**

1. Specialize the generic polynomial Hecke algebra and evaluate its two generators.
2. Use surjective coefficient reduction for maximality of the kernel.
3. Request Galois-to-acting-Hecke compatibility from R19; do not infer it from a formal evaluation.

**Consumers determining the API.**

- CDN §4.1.3 and §4.2: Localizes quaternionic automorphic modules at the residual system.
- R22 patching: Provides the fixed residual Hecke ideal with the arithmetic normalization.

**API.**

- `ResidualHeckeIdeal.evalT` (simp): T_v evaluates to tr ρ̄(Frob_v).
- `ResidualHeckeIdeal.evalS` (simp): S_v evaluates to q_v⁻¹ det ρ̄(Frob_v).
- `ResidualHeckeIdeal.maximal` (structure): Surjective O→k makes the evaluation kernel maximal.
- `ResidualHeckeIdeal.actingFactor` (compatibility): When R19 supplies the eigen-system, the abstract evaluation factors through the acting Hecke quotient.

**Unit tests.**

- `ResidualHeckeIdeal.normThree` (computation): In k=F₇, q=3 and determinant=6 give S=2.
- `ResidualHeckeIdeal.scalarDeterminant` (compatibility): The arithmetic polynomial has constant term qS=det ρ̄(Frob).
- `ResidualHeckeIdeal.nonsurjective` (non-example): The kernel of Z→Q is zero and not maximal; surjectivity cannot be dropped.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation`, `AutomorphicFormsOnReductiveGroups:AF.5`, `AutomorphicGaloisRepresentations:R19.2`, `mathlib:MvPolynomial.eval₂Hom`, `mathlib:RingHom.ker`, `mathlib:RingHom.ker_isMaximal_of_surjective`.

**Acceptance checks.**

- For q_v=3, trace=5 and determinant=6, S_v evaluates to 2, not 6 (in residue characteristic not 2 or 3).
- An evaluation without surjective coefficient image need not have maximal kernel.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://arxiv.org/pdf/2204.11214), §4.1.3, pp.48–49. Exact residual dictionary; the inverse norm is essential.

**Atlas planet:** Residual Hecke ideal.

**Implementation status:** `unchecked`.

## R18.4

The generic automorphic coefficient and cohomology constructions are imported. The quaternionic specializations retain duals, Tate twists, residual vanishing assumptions and actual change-level correspondences. Characteristic-zero eigensystem comparison does not identify the entire definite function space with the entire curve cohomology.

### Quaternionic algebraic local systems

**Declaration:** `QuaternionLocalSystem`; construction; node `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-local-systems`.

Specialize the shared automorphic local-system construction to X_U and an algebraic B×-representation W. On each complex component Γ\H, the Betti system is (H×W)/Γ; on the canonical curve the étale O/l^n systems descend the matching finite-level torsors, compatibly in n. Identify their pullbacks to the complex analytic curve using the fixed coefficient/dual convention. At split quaternionic p-level the rank-two Morita factor of H supplies the standard geometric representation of weight one. Parallel automorphic weight k uses its tensor of Sym^{k−2} constituents; automorphic weight two has the trivial rank-one coefficient system.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.

**Construction or proof.**

1. Import the generic coefficient-lattice and local-system descent API.
2. Compute the quaternionic arithmetic action and compare the finite torsor descriptions.
3. Apply generic Betti–étale comparison to the coefficient systems, retaining all embeddings and duals.

**Consumers determining the API.**

- R18.4 finite cohomology and R19.2: Defines coefficient systems before cohomology, purity and Galois construction.
- CDN20 §5.2.1: Weight-two trivial coefficient realization is the special case used in the tower.

**API.**

- `QuaternionLocalSystem.betti` (projection): On Γ\H the system is the Γ-associated W-bundle.
- `QuaternionLocalSystem.etaleReduction` (data): Reduction modulo l^n is the descended finite-level torsor coefficient system.
- `QuaternionLocalSystem.changeLevel` (functoriality): Level pullback identifies the corresponding local systems.
- `QuaternionLocalSystem.trivial` (compatibility): Trivial W gives the constant local system in both realizations.

**Unit tests.**

- `QuaternionLocalSystem.constant` (degenerate): The trivial rank-one representation gives the constant O-system.
- `QuaternionLocalSystem.rank` (computation): A rank-r lattice gives fibre rank r, not r times the covering degree.
- `QuaternionLocalSystem.monodromy` (non-example): On a loop acting by −1 on W, parallel transport is −1; the constant system is wrong when 2 is invertible.

**Direct prerequisites.** `AutomorphicFormsOnReductiveGroups:AF.4/coefficient-lattices`, `ArithmeticLocallySymmetricSpaces:ALS.1`, `tauceti:TauCeti.LocalCoefficientSystem`, `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower`.

**Acceptance checks.**

- At trivial weight the Betti system is the constant O-system.
- Fundamental-groupoid functors exist in Tau Ceti; their étale realization and cohomology do not follow from that definition.

**Sources.**

- [Henri Carayol, Sur la mauvaise réduction des courbes de Shimura](https://www.numdam.org/item/CM_1986__59_2_151_0.pdf), §1.4, pp.159–160; §4.4, pp.186–188. Quaternionic coefficient sheaf and its canonical descent.

**Atlas planet:** Quaternionic coefficient systems.

**Implementation status:** `unchecked`.

### Quaternionic finite-level cohomology

**Declaration:** `QuaternionCohomology`; construction; node `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`.

Apply the imported cohomology functors to define M_U=H¹_et(X_U,Fbar,L_O) and M_U^B=H¹_B(X_U(C),L_O), with continuous G_F action on the étale side and finite O-modules. The good-place and change-level Hecke correspondences act by coefficient transport followed by pullback and trace. The Betti–étale comparison is Hecke-equivariant; integral O-freeness is a separate theorem, not part of the definition.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.

**Construction or proof.**

1. Import étale/Betti finiteness, coefficient comparison and pull-push for finite correspondences.
2. Specialize all functors to the canonical quaternionic curve.
3. Check compositions against generic Hecke convolution and away-place commutativity.

**Consumers determining the API.**

- AutomorphicGaloisRepresentations:R19.2: Supplies the geometric Hecke module; the Galois representation and its compatibility are owned there.
- GL2ModularityLifting:R22.1: Supplies a finite module before any localization or patching.

**API.**

- `QuaternionCohomology.hecke` (data): A correspondence acts by p₂,*∘coefficientTransport∘p₁*.
- `QuaternionCohomology.changeLevel` (functoriality): Level pullback and trace compose with the degree on a finite étale cover.
- `QuaternionCohomology.comparison` (compatibility): Betti–étale comparison intertwines the Hecke actions.
- `QuaternionCohomology.galoisCommutes` (relation): G_F commutes with correspondences defined over F.

**Unit tests.**

- `QuaternionCohomology.genusTwo` (computation): Constant rational coefficients on a connected genus-two curve give dimension 4.
- `QuaternionCohomology.identityCorrespondence` (degenerate): The identity correspondence acts as the identity.
- `QuaternionCohomology.coverDegree` (compatibility): For a finite étale cover of degree d, trace∘pullback=d on cohomology.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-local-systems`, `HilbertModularVarietiesAndShimuraCurves:R18.2/hecke-integral-extension`, `ClassicalAdicEtaleCohomology:H0`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `ClassicalAdicEtaleCohomology:H3`, `ClassicalAdicEtaleCohomology:H5`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`.

**Acceptance checks.**

- For constant coefficients on a connected genus-g complex curve, rank_Q_l H¹=2g.
- Compactness removes the modular-curve cusp correction, but does not remove coefficient torsion.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §5.2.1, proof of Proposition 5.2, pp.41–42. Finite-level cohomology and commuting global/tower actions; generic machinery imported.

**Atlas planet:** Quaternionic Hecke cohomology.

**Implementation status:** `unchecked`.

### Integral torsion and reduction criteria

**Declaration:** `IntegralCohomologyControl`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control`.

For a maximal ideal m of the good-place Hecke algebra, if H⁰(X,L_k)_m and H⁰(X,L_k∨(1))_m vanish, then the localized H¹(X,L_O)_m is finite free over O, H²(X,L_O)_m has no O-torsion, and H¹(X,L_O)_m⊗k→H¹(X,L_k)_m is an isomorphism. Proving these vanishings for the intended non-Eisenstein systems is an explicit quaternionic coefficient-system obligation; arbitrary non-Eisenstein language alone is not substituted for them.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
- Generic integral coefficient long exact sequences, Poincaré duality, and compatible Hecke localization.

**Construction or proof.**

1. Use the O→O→k coefficient exact sequence to identify H¹[λ] from H⁰(L_k).
2. Apply duality to control H² torsion using the residual dual H⁰.
3. Use finiteness over the DVR for freeness and the coefficient exact sequence for reduction.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `ClassicalAdicEtaleCohomology:H0`, `ClassicalAdicEtaleCohomology:H3`.

**Acceptance checks.**

- Finite generation alone does not imply free integral cohomology.
- Nontrivial residual invariant vectors can introduce torsion or defeat reduction control.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §5.2.1, p.41. Only the rational finite-level realization is stated in CDN20; the integral H⁰-vanishing criterion is the routine coefficient long exact sequence plus duality spelled out in the proof steps, with no source passage claimed for it.

**Implementation status:** `unchecked`.

### Quaternionic cohomological duality

**Declaration:** `CohomologyPairing`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomology-pairing`.

Specialize Poincaré duality to obtain the perfect rational pairing H¹(X,L_E)×H¹(X,L_E∨(1))→E. At integral level the duality is a derived duality; it gives a perfect O-pairing on localized H¹ only under the preceding torsion/vanishing criteria and a chosen perfect coefficient lattice pairing. Pullback is adjoint to trace, and Hecke adjoints reverse the correspondence with its coefficient similitude factor.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.

**Construction or proof.**

1. Apply generic smooth proper curve duality and the coefficient evaluation map.
2. Compare to Betti cup product and oriented fundamental class.
3. Reverse the correspondence and invoke the integral torsion criterion when asserting perfection over O.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control`, `ClassicalAdicEtaleCohomology:H3`, `ArithmeticLocallySymmetricSpaces:ALS.3`, `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`.

**Acceptance checks.**

- The Tate twist (1) is necessary on the étale dual coefficient.
- For constant rational coefficients the form is alternating on H¹.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §5.2.1, pp.41–42. CDN20 uses the finite-level étale H¹ of the curve; the duality is the generic proper-smooth-curve Poincaré duality (requested from ClassicalAdicEtaleCohomology H3), not a CDN20 statement.

**Implementation status:** `unchecked`.

### Cohomological automorphic eigenspaces

**Declaration:** `CohomologicalEigenspaces`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-eigenspaces`.

Over a splitting characteristic-zero field, identify the cuspidal Hecke eigenspaces of the algebraic coefficient H¹ of X_U with the automorphic representations cohomological at the split real place and of the specified algebraic type at the other real places. For trivial coefficients the split real component has weight-two discrete series. Galois action on the multiplicity space is retained, but identifying it with a two-dimensional ρ_π and proving local–global compatibility are R19 statements.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
- Characteristic zero; actual coefficient-field models; generic Matsushima/cohomological decomposition and strong multiplicity one imported.

**Construction or proof.**

1. Compute the degree-one relative Lie algebra cohomology at the split real place.
2. Specialize the generic compact locally symmetric cohomological decomposition.
3. Apply R17.3 transfer with exact infinity types; leave the Galois identification to R19.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`, `ArithmeticLocallySymmetricSpaces:ALS.5`.

**Acceptance checks.**

- The cohomological decomposition is not itself a purity theorem.
- A complex automorphic correspondence gives no automatic integral lattice equality.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §5.2.1, pp.41–42, Proposition 5.2. The weight-two automorphic realization; Galois compatibility imported rather than recreated.

**Implementation status:** `unchecked`.

### Definite and indefinite Jacquet–Langlands eigenspaces

**Declaration:** `DefiniteIndefiniteComparison`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.4/definite-indefinite-comparison`.

For quaternion algebras D⁰ and B with invariants exchanged at a finite place v and the designated real place, and a cuspidal GL₂ representation discrete series at every ramified place of either algebra, apply the two global JL correspondences. At levels transported away {v,τ}, identify their away-place Hecke eigensystems and multiplicity factors over actual common rational models. At v the split GL₂ representation and its division JL partner remain different carriers; the full definite functions and the full curve H¹ are not isomorphic.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
- The transfer domain and infinity weights match; actual common coefficient field as in R17.3 rational-models.

**Construction or proof.**

1. Import the invariant-exchange construction where its CDN hypotheses apply.
2. Apply global-jl separately for both ramification sets in the more general domain.
3. Take the specified level invariants and preserve away-place Hecke operators.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-jl`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-eigenspaces`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/global-jl`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/invariant-exchange`, `GL2AutomorphicRepresentationsAndTransfer:R17.3/rational-models`.

**Acceptance checks.**

- Only matching eigenspaces are compared; H¹ has a cohomological multiplicity factor.
- Norm-factor characters are excluded on the definite side.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §5.2.1, pp.40–42. Exchange of the local and real invariant with away-place identification.

**Implementation status:** `unchecked`.

### Cohomological degeneracy maps

**Declaration:** `QuaternionDegeneracy`; construction; node `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-degeneracy`.

At w with B split, hyperspecial level and coefficient system unramified at w, the two canonical maps X_{U₀(w)}→X_U induce δ=(δ₁*,δ₂*):M_U²→M_{U₀(w)}. Their trace maps give the dual degeneracy map. They commute with G_F and away-w Hecke operators; the pullback/trace composition matrix is obtained from the local double-coset computation with degree q_w+1. Integral injectivity and saturated image require an Ihara theorem with explicit hypotheses, and are not inferred from the definite Lemma 7.1.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
- The coefficient action extends to the local semigroup; the two level morphisms use a specified diag(1,π_w).

**Construction or proof.**

1. Build the two maps by intersection of U with its conjugate.
2. Transport the coefficient sheaf and apply generic pullback and trace.
3. Compute the degree and off-diagonal double cosets; request the integral Ihara input separately.

**Consumers determining the API.**

- R22 finite-level control: Defines the actual maps before imposing the integral Ihara/saturation hypothesis.
- R19 level comparisons: Provides equivariance on finite cohomology.

**API.**

- `QuaternionDegeneracy.pullback` (data): δ maps (a,b) to δ₁*a+δ₂*b with transported coefficients.
- `QuaternionDegeneracy.trace` (data): The reverse map is the pair of coefficient-compatible traces.
- `QuaternionDegeneracy.awayHecke` (compatibility): Both maps intertwine all Hecke correspondences away w.
- `QuaternionDegeneracy.degree` (characterisation): Each hyperspecial-to-Iwahori map has degree q_w+1.

**Unit tests.**

- `QuaternionDegeneracy.qTwo` (computation): For residue field F₂ the covering degree is 3.
- `QuaternionDegeneracy.tracePullback` (compatibility): The diagonal trace–pullback composition is q_w+1.
- `QuaternionDegeneracy.badPlace` (non-example): At a division place there is no hyperspecial GL₂-to-Iwahori map of this shape.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation`, `ArithmeticLocallySymmetricSpaces:ALS.3`.

**Acceptance checks.**

- Each single hyperspecial-to-Iwahori cover has degree q_w+1.
- The definite norm-fibre proof does not establish the indefinite integral injectivity theorem.

**Sources.**

- [Chandrashekhar Khare and Jean-Pierre Wintenberger, Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7 (opening), Lemma 7.1, p.60. The definite model of the two level maps at w with U′w = U0(w). The indefinite cohomological construction is the standard pullback/trace along the two level morphisms; no packet source states it, and Carayol §§9.2–9.4 (previously cited) studies the p-level morphism v : Mn,H → Mn,v(H) instead.

**Atlas planet:** Cohomological degeneracy maps.

**Implementation status:** `unchecked`.

### Quaternionic coefficient purity

**Declaration:** `QuaternionPurity`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-purity`.

At a finite good place away l, a specified algebraic projector on the auxiliary abelian scheme gives a rank-two lisse coefficient constituent pure of weight one. An algebraic symmetric/tensor coefficient system of total geometric weight r is pure of weight r; since X is proper smooth, H¹(X,L) is pure of weight r+1 for geometric Frobenius. The quaternionic rank-two constituent and its projector must be verified; the current R34.5 elliptic-family node alone is insufficient for this higher-dimensional auxiliary PEL family.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
- Good smooth fibre; l invertible; compatible Frobenius-commuting projectors and actual pure coefficient constituents.

**Construction or proof.**

1. Request the abelian-family/projector extension of R34.5.
2. Check the Morita/splitting constituent and the symmetric/tensor weight arithmetic.
3. Apply proper smooth Weil II purity to H¹.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-local-systems`, `WeightsInEtaleCohomology:R34.5/parabolic-cohomology-weight-comparison`, `WeightsInEtaleCohomology:R34.5`.

**Acceptance checks.**

- For a standard rank-two weight-one constituent and Sym^{k−2}, H¹ has weight k−1.
- Purity is imported from R34, not from JL or a trace formula.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §3.2, moduli problem F1,U′p, pp.553–554. The auxiliary quaternionic PEL family to which the requested projector purity applies; purity itself is Deligne’s Weil II via WeightsInEtaleCohomology R34.5, not a statement of YZ.

**Atlas planet:** Quaternionic coefficient purity.

**Implementation status:** `unchecked`.

### Finite-level invariants and trace control

**Declaration:** `FiniteLevelDescent`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-level-descent`.

For a finite effective étale Galois level cover X_{U′}→X_U with group Δ of order invertible in the coefficient ring and compatible local systems, pullback identifies H¹(X_U,L) with H¹(X_{U′},L)^Δ and |Δ|⁻¹trace is its inverse on invariants. When p divides |Δ|, replace this assertion by the Hochschild–Serre spectral sequence and coefficient torsion terms; no unconditional integral invariants equality is asserted.

**Hypotheses.**

- B/F division quaternion algebra split at exactly one real place; U sufficiently small and effective so X_U/F is a smooth proper curve with no cusp boundary.
- O is a finite extension of Z_l, and the algebraic coefficient lattice is U-stable with a specified central character and an integral coefficient pairing where duality is used.
- Cover finite étale on the generic fibre and genuinely effective; |Δ| invertible for the displayed equality.

**Construction or proof.**

1. Apply the generic Cartan–Leray/Hochschild–Serre sequence.
2. Average the finite group to kill higher group cohomology.
3. Check trace/pullback and their equivariance under the away-level Hecke algebra.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `HilbertModularVarietiesAndShimuraCurves:R18.2/effective-small-level`, `ClassicalAdicEtaleCohomology:H0`.

**Acceptance checks.**

- For a p-group cover with Z_p coefficients the averaging inverse does not exist.
- An ineffective central level subgroup does not give the claimed deck group.

**Sources.**

- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §4.2, construction of the coarse models, p.565. Effective finite level quotients; the invariants/trace statement is generic Hochschild–Serre for finite étale covers (ClassicalAdicEtaleCohomology H0), not stated in YZ.

**Implementation status:** `unchecked`.

## R18.5

The local formal model is constructed by increasing formal opens in blow-ups, not an inverse limit of the projective blow-up models. Framing height, the direction of the quasi-isogeny and Weil descent are separate conventions. The maximal-level integral theorem and all-level rigid theorem have distinct outputs.

### Drinfeld upper half-plane

**Declaration:** `DrinfeldHalfPlane`; definition; node `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-half-plane`.

The Drinfeld half-plane Ω_K is the rigid analytic open P¹_K\P¹(K), formed by removing the K-rational analytic points. Ω_K(C)=P¹(C)\P¹(K)=C\K in the affine chart with infinity removed. PGL₂(K) acts by homographies. This is not the algebraic complement of a Zariski-closed subscheme P¹(K). The affinoid exhaustion supplies its actual analytic open structure.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Construction or proof.**

1. Construct the standard rational affinoids in P¹ using the imported analytic geometry.
2. Glue their increasing open union and prove its C-point description.
3. Use homographies to transport rational affinoids and descend the centre-trivial GL₂ action.

**Consumers determining the API.**

- Čerednik–Drinfeld uniformisation: The analytic local factor of the quaternionic curve.
- CDN20 §§1.2,5.2: Provides the actual local geometry and its tower.

**API.**

- `DrinfeldHalfPlane.points` (characterisation): Its C-points are P¹(C) minus P¹(K).
- `DrinfeldHalfPlane.homography` (data): PGL₂(K) acts through the usual fractional linear formula.
- `DrinfeldHalfPlane.affineChart` (compatibility): The affine chart identifies the C-points with C minus K.
- `DrinfeldHalfPlane.baseChange` (functoriality): Scalar extension identifies the Ω_K affinoid exhaustion with its C-exhaustion; it does not replace the removed set by P¹(C).

**Unit tests.**

- `DrinfeldHalfPlane.infinity` (degenerate): The point infinity is excluded.
- `DrinfeldHalfPlane.quadraticPoint` (example): For z∈K₂\K in a quadratic extension, z lies in Ω_K(C).
- `DrinfeldHalfPlane.scalarAction` (compatibility): Every central scalar in GL₂(K) acts trivially.
- `DrinfeldHalfPlane.algebraicComplement` (non-example): Removing finitely many K-rational points is insufficient: all P¹(K) must be excluded.

**Direct prerequisites.** `AdicSpacesPartII:R2/generic-fibre-functor-d`, `ReductiveGroupsPartII:RG2.2`.

**Acceptance checks.**

- Infinity is a K-rational point and is excluded.
- A point in a quadratic extension not in K belongs to Ω.

**Sources.**

- [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part I §§1–2, pp.49–53. Analytic structure from the Bruhat–Tits norm map.
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §1.2, pp.12–13. Actual analytic complement, not a scheme complement.

**Atlas planet:** Drinfeld upper half-plane.

**Implementation status:** `unchecked`.

### Affinoid exhaustion and tree reduction

**Declaration:** `DrinfeldExhaustion`; construction; node `HilbertModularVarietiesAndShimuraCurves:R18.5/affinoid-reduction`.

For n≥1, set P_n=P¹(O_K/π^n) and U_n=P¹_C minus the union of open balls centered at P_n of radius |π|^n in the standard projective metric. These affinoids increase to Ω_C. The norm-class reduction r:Ω_C→|T_K| is PGL₂(K)-equivariant, and U_n is the inverse image of the closed tree ball of radius n about the standard vertex. Tree vertices are homothety classes of rank-two lattices; adjacent representatives satisfy πL⊊L′⊊L.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Construction or proof.**

1. Import the GL₂ Bruhat–Tits tree specialization, including the norm-class realization.
2. Compute vertex/edge affinoids using the two adjacent lattice bases.
3. Identify the finite-ball inverse images and prove increasing exhaustive union.

**Consumers determining the API.**

- CDN20 §1.2: Controls explicit affinoids and integral functions.
- R18.5 graph identification: Provides the tree indexing of components and nodes.

**API.**

- `DrinfeldExhaustion.affinoid` (structure): Each U_n descends from an affinoid over K.
- `DrinfeldExhaustion.increasing` (relation): U_n⊂U_{n+1} and their union is Ω_C.
- `DrinfeldExhaustion.treeBall` (characterisation): U_n=r⁻¹ of the radius-n tree ball.
- `DrinfeldExhaustion.equivariant` (compatibility): r(gz)=g r(z) for g∈PGL₂(K).

**Unit tests.**

- `DrinfeldExhaustion.residueTwo` (computation): For q=2 a vertex has 3 incident edges.
- `DrinfeldExhaustion.firstSphere` (computation): The radius-one tree ball has q+2 vertices.
- `DrinfeldExhaustion.centralScalar` (compatibility): Scaling a lattice changes neither its vertex nor the reduction class.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-half-plane`, `ReductiveGroupsPartII:RG2.2`.

**Acceptance checks.**

- Every tree vertex has q+1 incident edges, in bijection with P¹(k).
- U_n depends on the chosen central vertex; Ω and its full group action do not.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §1.2, p.12. Explicit affinoids and equivariant reduction.

**Atlas planet:** Drinfeld affinoid exhaustion.

**Implementation status:** `unchecked`.

### Standard Drinfeld formal model

**Declaration:** `DrinfeldFormalModel`; construction; node `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model`.

Start with X₀=P¹_O_K and form X_n by blowing up every smooth k-rational special-fibre point of X_{n−1}; take the π-adic completions. Remove the smooth k-rational points from X_n to form the formal open Ũ_n. Then Ũ_n⊂Ũ_{n+1}, its generic fibre is U_n,K, and Ω̂=⋃Ũ_n is a flat regular semistable formal model of Ω_K. Its components are P¹_k indexed by tree vertices and its nodes by tree edges, locally xy=π. The full GL₂(K) action factors through PGL₂(K).

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Construction or proof.**

1. Use the existing admissible blow-up and generic-fibre-invariance API.
2. Compute the exceptional and strict-transform components and edge charts.
3. Glue formal opens, not an inverse limit of the projective blow-up models; extend the group action through lattice charts.

**Consumers determining the API.**

- Boutot–Carayol II §8 and BZ Theorem 6.7: Represents local moduli and uniformizes integral curves.
- CDN20 §1.2: Actual formal model underlying its reduction/exhaustion.

**API.**

- `DrinfeldFormalModel.genericFibre` (compatibility): The generic fibre of Ω̂ is Ω_K.
- `DrinfeldFormalModel.nodeChart` (data): At an edge the completed local equation is xy=π.
- `DrinfeldFormalModel.components` (equivalence): Special-fibre components and nodes identify with tree vertices and edges.
- `DrinfeldFormalModel.action` (functoriality): The PGL₂(K) action extends the analytic homography action.

**Unit tests.**

- `DrinfeldFormalModel.centralComponent` (compatibility): The initial vertex component is P¹_k with its q+1 rational attaching points.
- `DrinfeldFormalModel.qTwo` (computation): For q=2 each component meets three branches in the full model.
- `DrinfeldFormalModel.ramifiedNode` (non-example): For e=2, xy=π′² is a singular total-space local ring; regularity is not preserved.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/affinoid-reduction`, `AdicSpacesPartII:R2/admissible-blow-up`, `AdicSpacesPartII:R2/generic-fibre-inverts-admissible-blow-ups`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Acceptance checks.**

- At finite radius the outermost components have smaller valence; only the full tree has valence q+1 everywhere.
- The node xy=π is regular; ramified base change gives xy=π′^e and is not regular for e>1.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §1.2, pp.12–13. Iterated blow-ups and union of formal opens.
- [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part I §3, pp.53–56. Lattice/edge charts for the standard model.

**Atlas planet:** Drinfeld formal model.

**Implementation status:** `unchecked`.

### Special formal quaternionic moduli

**Declaration:** `SpecialFormalModuli`; definition; node `HilbertModularVarietiesAndShimuraCurves:R18.5/special-formal-moduli`.

Let D/K be the local division quaternion algebra, O_D its maximal order containing the unramified quadratic order O₂. A strict special formal O_D-module X over a π-nilpotent O_Ǩ-scheme has O_K-height 4 and Lie(X) locally free of rank one over O₂⊗O_K O_S (hence rank two over O_S), with strict O_K action. Fix a framing Φ over kbar. The functor M_Dr(0) classifies (X,ρ) where ρ:X_Sbar→Φ_Sbar is an O_D-linear quasi-isogeny of relative height zero, modulo compatible isomorphism. M̃ allows heights 2m, m∈Z. BC uses the inverse framing arrow; invert it when comparing conventions.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- The strict formal-module and relative height carriers are supplied by R07.1–R07.2.

**Construction or proof.**

1. Specialize the generic p-divisible/Cartier-module carrier with the O_D action and special Lie condition.
2. Form the isomorphism-class functor with height-zero framing.
3. Check base change, arrow reversal and the locally constant relative-height components.

**Consumers determining the API.**

- Drinfeld representability and BZ §5: Determines the true local moduli problem and the component action.
- R18.2 integral-pdiv: Supplies the division-prime deformation interpretation.

**API.**

- `SpecialFormalModuli.specialLie` (characterisation): Lie is rank one over O₂⊗O_S.
- `SpecialFormalModuli.baseChange` (functoriality): Pull back X and its special-fibre framing along every nilpotent-base map.
- `SpecialFormalModuli.framingAction` (data): A framing quasi-isogeny δ acts by δ∘ρ.
- `SpecialFormalModuli.heightComponents` (structure): The arbitrary-height functor decomposes into the height-2m components.

**Unit tests.**

- `SpecialFormalModuli.heightZero` (degenerate): The framing object with identity ρ lies in M_Dr(0).
- `SpecialFormalModuli.absoluteHeight` (computation): When [K:Q_p]=2 the absolute p-height is 8.
- `SpecialFormalModuli.wrongLie` (non-example): An O_D-module whose Lie O₂ action has ranks (2,0) is not special.

**Direct prerequisites.** `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Acceptance checks.**

- Absolute p-height is 4[K:Q_p], not 4 for ramified or higher-degree K.
- Dropping the special Lie condition gives the wrong moduli problem.

**Sources.**

- [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part II §§2, 5.16, Definition 8.1, pp.79–84, 97–98, 107. Local functor and BC framing direction.
- [Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1), §5, pp.38–39, (5.18)–(5.20). Relative height and framing direction used here.

**Atlas planet:** Special formal quaternionic moduli.

**Implementation status:** `unchecked`.

### Drinfeld representability theorem

**Declaration:** `DrinfeldRepresentability`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability`.

The special formal O_D-module functor M_Dr(0) is represented by Ω̂⊗O_K O_Ǩ. The equivalence is functorial on π-nilpotent bases, not just a bijection on geometric points, and identifies the universal special formal module. The group of framing quasi-isogenies is GL₂(K); on height zero the normalized action factors through PGL₂(K).

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Strict special modules, fixed frame and arrow convention as above.

**Construction or proof.**

1. Use Dieudonné–Cartier theory to construct the rank-two lattice/sheaf data and its critical-index filtration.
2. Compare with the lattice-chart functor representing Ω̂, using BC II §§5–8.
3. Prove both natural transformations inverse on nilpotent bases and match the universal object/actions.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/special-formal-moduli`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

**Acceptance checks.**

- A geometric point classification alone does not prove representability.
- The central scalar action on height zero must be normalized before factoring through PGL₂.

**Sources.**

- [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part II Theorems 8.2,8.4, pp.107–109. Actual functorial local theorem.

**Implementation status:** `unchecked`.

### Height action and Frobenius descent

**Declaration:** `HeightAndDescent`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.5/height-and-descent`.

Normalize arbitrary-height M̃_Dr≅M_Dr(0)×Z by a division uniformizer Π and its Hecke shift h(Π). Under BZ §5.9, δ∈GL₂(K) acts by (ω,m)↦(pr(δ)ω,m+ord_K det δ), where pr(δ)=h(Π)^{−ord det δ}δ on height zero. The product identification is independent of Π. For arithmetic descent use τ_c=Spf τ⁻¹ and the separate right Π⁻¹ Hecke translation in Theorem 6.7; do not conflate this translation with the normalized PGL₂ action.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Construction or proof.**

1. Identify each height component with height zero using h(Π).
2. Compute the valuation shift and central scalar correction.
3. Compare the Frobenius twist diagram with BZ 6.7 using contravariance of Spf.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability`.

**Acceptance checks.**

- A scalar πI has determinant valuation 2 and shifts the height index by 2 even though its normalized Ω action is trivial.
- Replacing Π⁻¹ by Π reverses the displayed descent convention.

**Sources.**

- [Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1), Proposition 5.9, p.39; Theorem 6.7, p.49. Separate height and Weil descent actions.

**Implementation status:** `unchecked`.

### Arithmetic Drinfeld quotient

**Declaration:** `ArithmeticDrinfeldQuotient`; construction; node `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`.

For B/F division split at τ only and division at v, let B̌ exchange invariants at {τ,v}, so it is totally definite and split at v. For compact level U with U_v=O_B,v× and small U^v, form B̌×\[(Ω̂⊗O_Fv O_Fv̌)×B_f×/U], using fixed away-v identifications; B̌_v× acts by homography and the local valuation component ord_v Nrd. Its finite component decomposition uses Γ_g={b∈B̌×∩gU^v g⁻¹:ord_v det b=0}, projected to PGL₂(F_v). These projected groups are discrete cocompact and become torsion-free with sufficiently small tame level.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Global B/F, τ,v and level as stated; effective central quotient and finite component representatives fixed.

**Construction or proof.**

1. Apply adelic finiteness and approximation for the definite exchange algebra.
2. Compute the valuation-zero stabilisers and their effective projective images.
3. Construct separated proper formal quotients by the free cocompact action using edge charts; algebraize via the generic proper formal-curve theorem.

**Consumers determining the API.**

- BZ Theorem 6.7 and BC III Theorem 5.2: Builds the arithmetic local object before asserting canonical-curve identification.

**API.**

- `ArithmeticDrinfeldQuotient.components` (data): Connected pieces are the specified projective Γ_g quotients after unramified base change.
- `ArithmeticDrinfeldQuotient.cocompact` (structure): Each effective Γ_g is discrete and cocompact in PGL₂(F_v).
- `ArithmeticDrinfeldQuotient.changeLevel` (functoriality): Nested tame levels give the corresponding finite quotient maps.
- `ArithmeticDrinfeldQuotient.algebraisation` (compatibility): At sufficiently small level the proper formal curve algebraizes with the same generic fibre.

**Unit tests.**

- `ArithmeticDrinfeldQuotient.scalar` (compatibility): Central scalar homographies are ineffective; their valuation effect is retained separately.
- `ArithmeticDrinfeldQuotient.node` (computation): At free level an edge orbit has node chart xy=π.
- `ArithmeticDrinfeldQuotient.nonfree` (non-example): A quotient with a nontrivial effective vertex stabiliser cannot use the free-action regularity argument.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/height-and-descent`, `AdelicAlgebraicGroups:AA.3`, `AdelicAlgebraicGroups:AA.4`, `AdicSpacesPartII:R2`, `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`.

**Acceptance checks.**

- The quotient by full B̌× includes the valuation component; a single Γ_g quotient is only one component after the specified unramified base change.
- Removing the tame-smallness hypothesis yields a coarse finite quotient and loses automatic regularity.

**Sources.**

- [Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1), §1, pp.1–3; §6, pp.45–50. Totally real arithmetic quotient and fixed-point-free level.
- [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III §§5.1–5.3, pp.139–142. Rational-field component decomposition and small-level fence.

**Implementation status:** `unchecked`.

### Čerednik–Drinfeld uniformisation

**Declaration:** `TotallyRealUniformisation`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`.

For totally real F, B division split only at τ, v with B_v division, U_v=O_B,v× and the other p-adic factors and tame level as in BZ (6.31), the completion of the canonical integral Shimura curve over O_Eν identifies with B̌×\[(Ω̂_Fv⊗O_Fv O_Eν̌)×B_f×/U]. Here E=τ(F), E_ν=F_v. It is compatible with level transitions and Hecke operators at the permitted levels. With τ_c=Spf τ⁻¹, natural descent corresponds on the quotient to id_Ω×|Π⁻¹×τ_c. For small tame level the model is regular semistable and stable.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- All local factors match BZ (6.31); sufficiently small U^v for the final stable/regular claim.

**Construction or proof.**

1. Use the shared PEL/Rapoport–Zink basic uniformisation theorem with its Hasse-principle/surjectivity hypotheses.
2. Identify the local RZ factor with Drinfeld moduli, and transfer from the auxiliary PEL curve via the open-and-closed component comparison.
3. Apply BZ Theorem 6.7 and check the Π⁻¹ Frobenius diagram; obtain regular/stable geometry from Corollary 6.8.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`, `HilbertModularVarietiesAndShimuraCurves:R18.2/connected-pel-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:R18.1/canonical-quaternionic-curve`, `HilbertModularVarietiesAndShimuraCurves:R18.1/quaternionic-reflex-dimension`, `PELModuli:M2`.

**Acceptance checks.**

- This is over the completed maximal unramified local field, not a finite extension substituted for it.
- BC III proves the arithmetic theorem over Q; it is not the citation for arbitrary F.

**Sources.**

- [Jean-François Boutot and Thomas Zink, On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1), Theorem 6.7 and Corollary 6.8, pp.49–50. Totally real theorem with exact level and descent data.

**Atlas planet:** Čerednik–Drinfeld uniformisation.

**Implementation status:** `unchecked`.

### Rational-field comparison

**Declaration:** `RationalUniformisation`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.5/rational-uniformisation`.

For F=Q, a division quaternion algebra ramified at p and split at infinity, and maximal p-level with sufficiently small tame U^p, specialize the uniformisation to BC III Theorem 5.2. Match its left/right actions via the chosen algebra anti-isomorphism and its Frobenius–determinant twist with the BZ convention. The isomorphism also compares the universal special formal O_D modules. The split B=M₂(Q) modular curve is outside this division-prime assertion.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.

**Construction or proof.**

1. Apply the totally real theorem with F=Q.
2. Identify the invariant-swapped definite algebra and BC’s level component set.
3. Match anti-isomorphism, determinant-valuation descent and universal formal module.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `ModularCurvesPartII:R12.2`.

**Acceptance checks.**

- The arithmetic base is Q_p here; BC’s local Parts I–II permit general K.
- The rational split modular curve uses the ModularCurves supplier, not this compact theorem.

**Sources.**

- [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III Theorem 5.2 and comments, pp.140–142. Primary rational-field arithmetic theorem and action conventions.

**Implementation status:** `unchecked`.

### All-level Drinfeld tower uniformisation

**Declaration:** `TowerUniformisation`; theorem; node `HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation`.

In CDN20 §5.2.1, E is totally real with E_𝔭=K; B̌ is split only at ∞₀ and division at 𝔭; B exchanges these invariants and is definite. With the fixed identifications of local and away-𝔭 groups, sufficiently small tame U and the exact congruence subgroups Ǧ_n at 𝔭, there are rigid isomorphisms Sh_n(U)^an≅B×\[M_n×B(A_f^𝔭)×/U] for every n≥1, compatible in n,U. M_n is the corresponding Drinfeld cover defined by the universal special formal module’s level structure. The theorem is on rigid generic fibres; it does not assert every high-level integral cover is semistable without alteration.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Exact CDN20 tower convention Ǧ_n retained; U sufficiently small.

**Construction or proof.**

1. Construct the generic Drinfeld covers from the universal formal module and matching local congruence levels.
2. Use the basic Rapoport–Zink uniformisation of the auxiliary PEL family with p-level structures on the rigid generic fibre (PELModuli:M2 request), transported through the open-and-closed component comparison; it identifies the v-part of the quaternionic p-divisible group with the pullback of the universal special formal module, so the level-n covers on both sides are the same torsors of level structures. The maximal-level theorem alone does not give the tower.
3. Apply CDN Proposition 5.4 and verify the commuting transitions and away-level actions.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `PELModuli:M2`, `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower`.

**Acceptance checks.**

- The n-level source and target use the same local congruence subgroup.
- Compatibility in n is part of the theorem, not a consequence of unrelated levelwise isomorphisms.

**Sources.**

- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2), §5.2.1–5.2.2, pp.40–43, Proposition 5.4. Tower theorem with explicit global setup.
- [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III §5.5, Théorème (5.5), p.146. The rational-field all-level statement; the totally real case is CDN20 Proposition 5.4.

**Implementation status:** `unchecked`.

### Quaternionic dual graph identification

**Declaration:** `TreeDualGraph`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.5/tree-dual-graph`.

At small maximal division-prime level, the geometric special-fibre dual graph is the finite disjoint union of Γ_g\T_K corresponding to the arithmetic quotient components. Vertices index rational components and edges index nodes, with loops and repeated edges retained in the quotient graph. The graph carries the Frobenius permutation induced by the Π⁻¹ descent, and Hecke/level maps are the transported adelic correspondences on vertex/edge orbits.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Tame level sufficiently small for free local charts; generic dual multigraph supplied by StableReduction.

**Construction or proof.**

1. Read the quotient’s local semistable charts and index its components and intersections.
2. Apply the generic normalization/dual-graph API with branch incidence, including loops.
3. Transport descent, Hecke and level correspondences through uniformisation.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model`, `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

**Acceptance checks.**

- The quotient graph need not be a tree although T_K is a tree.
- Over an unramified base every node has thickness 1.

**Sources.**

- [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III §5.4, pp.144–146 (graph); generic monodromy imported from R11.4. Dual-graph quotient and arithmetic descent.
- [Xinyi Yuan and Shou-Wu Zhang, On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), §8.3, ‘Multiplicity function: the superspecial case’, pp.619–620. Lattice class indexing of quaternionic special-fibre components.

**Implementation status:** `unchecked`.

### Quaternionic character lattice and monodromy

**Declaration:** `CharacterMonodromy`; comparison; node `HilbertModularVarietiesAndShimuraCurves:R18.5/character-monodromy`.

For the Jacobian of a small-level semistable uniformized curve, identify the toric character lattice with H₁(Γ_g\T_K,Z), compatibly with Hecke and descent. Under the generic semistable-Jacobian monodromy theorem the pairing is the oriented cycle edge pairing Σ_e thickness(e)a_e b_e. At the unramified regular maximal-level model thickness is 1. Its cokernel presents the geometric component group using the dual lattice; Frobenius descent determines the arithmetic group.

**Hypotheses.**

- K/Q_p finite, O_K its integers, uniformizer π, residue field k of cardinality q, and C the completed algebraic closure; Ǩ is the completed maximal unramified extension.
- Formal schemes and generic-fibre functor are supplied by AdicSpacesPartII:R2; all actions and quotient groups are effective.
- Generic semistable Jacobian/Néron and graph monodromy theorem supplied; connected component handled separately.

**Construction or proof.**

1. Apply the supplied character-lattice theorem to the identified nodal graph.
2. Compute all edge lengths from xy=π charts.
3. Transport Hecke/Frobenius action and distinguish geometric component-group cokernel from its descended points.

**Direct prerequisites.** `HilbertModularVarietiesAndShimuraCurves:R18.5/tree-dual-graph`, `NeronModelsAndSemistableAbelianVarieties:R11.4`, `tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion`, `WeightsInEtaleCohomology:R34.3/proper-trait-specialization-comparison`.

**Acceptance checks.**

- A graph with one cycle of r edges of thickness 1 gives pairing value r on its cycle generator.
- Replacing the quotient graph by the universal tree would falsely give zero toric rank.

**Sources.**

- [Jean-François Boutot and Henri Carayol, Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf), Part III §5.4, pp.144–146 (graph); generic monodromy imported from R11.4. Graph identification; monodromy theorem is a separate supplier, not attributed to these pages.

**Implementation status:** `unchecked`.

## R18.6: exports and owner contracts

This stage adds no mathematical declaration. It identifies the precise outputs already constructed above and the conditions their consumers must discharge. H6 is outside this job: the Allen torsion-twist moduli and nonempty local opens are requested there, with their actual elliptic/Hilbert pairing and component conventions.

- **AutomorphicGaloisRepresentations:R19.2** consumes regular-model-tower, hecke-integral-extension, integral-pdiv, quaternion-local-systems, finite-cohomology, quaternion-purity. Actual canonical proper curves, discriminant-qualified regular models, local systems, commuting Hecke/G_F action and conditional R34-purity. Constructing ρ_π and its local–global compatibility is R19 work.
- **GL2ModularityLifting:R22.1, GL2ModularityLifting:R22.2, GL2ModularityLifting:R22.6** consumes neatness-base-change, integral-pairing, tw-level, tw-freeness, tw-localised-control, dyadic-norm-twist, dyadic-hecke-twist, integral-cohomology-control, cohomological-degeneracy. Finite integral modules with all smallness, coefficient pairing, residual vanishing, distinct-root, isotropy-exponent and Ihara hypotheses visible. R22 chooses Q and applies patching; the indefinite integral Ihara gap is not advertised as proved.
- **SerreWeightAndLevelOptimisation:R20.6, PotentialModularityAndCompatibleSystems:R23.3** consumes neatness-base-change, integral-pairing. Reduction-surjectivity and pairing under verified neatness hypotheses, with the Khare Lemma 2.2 exact-statement gap retained; no modularity imported upstream.
- **SerreWeightAndLevelOptimisation:R20.4, NeronModelsAndSemistableAbelianVarieties:R11.6, CompletedCohomologyAndLocalGlobalCompatibility:R31.1** consumes totally-real-uniformisation, tower-uniformisation, tree-dual-graph, character-monodromy. Exact division-prime maximal-level formal theorem and Frobenius descent, all-level rigid tower maps, arithmetic dual graphs and supplier-based monodromy.
- **PerfectoidShimuraVarieties:S5** consumes quaternion-pel-instance, regular-model-tower, tower-uniformisation. Effective canonical finite-level tower and its actual normal integral models. Perfectoid limits and Hodge–Tate maps are proved by the consumer, independently of finite-level modularity.
- **PotentialModularityAndCompatibleSystems:R23.1, PotentialModularityAndCompatibleSystems:R23.2** consumes HilbertModularVarietiesAndShimuraCurves:H6. Out-of-scope requested torsion-twist moduli and nonempty local opens, including Allen /329 elliptic case; Moret–Bailly does not create these inputs.

## Supplier requests

These contracts use the suppliers’ existing carriers. A request records the exact interface needed by the listed consumers.

### `PELModuli:M0`

Supply the integral PEL datum carrier with involution, trace/different dual lattice, signatures and determinant condition; the B′ datum here is only an instance.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance`.

### `PELModuli:M1`

Supply generic PEL functors, O_B-actions, universal abelian schemes and p-divisible torsion sheaves with level-compatible descent. The quaternionic specialization does not reconstruct these carriers.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-pdiv`, `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-tate-comparison`.

### `PELModuli:M2`

Supply good-prime PEL representability and the generic basic Rapoport–Zink uniformisation comparison, including p-level structures on the rigid generic fibre and the identification of the universal p-divisible group, with its Hasse-principle/surjectivity and nilpotent-base deformation hypotheses. The latter is a PELModuli Part II extension, not supplied by current M5 examples; BZ §6.2 is the source contract.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation`.

### `PELModuli:M4`

Supply canonical-model comparison, finite normal integral level changes and finite effective coarse quotients; no universal family on an arbitrary normalization is assumed.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`, `HilbertModularVarietiesAndShimuraCurves:R18.2/coarse-model`.

### `AdelicAlgebraicGroups:AA.3`

Supply compactness modulo centre and finiteness of the definite adelic component/class set, with exact rational versus adelic central quotients.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`.

### `AdelicAlgebraicGroups:AA.4`

Supply strong approximation for quaternion norm-one groups with a noncompact split finite factor, and level-map degrees/effective stabilisers. No false strong approximation for tori is used.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/hecke-integral-extension`, `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`.

### `AdelicAlgebraicGroups:AA.5`

Supply the definite quaternion compactness/class-set validation. Use AA.3 for general reduction theory and AA.4 for the norm-fibre strong-approximation theorem.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set`, `HilbertModularVarietiesAndShimuraCurves:R18.3/norm-branch`, `HilbertModularVarietiesAndShimuraCurves:R18.3/isotropy-exponent`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.2`

Supply local division-quaternion valuation, maximal compact and scalar-square quotient conventions; the dyadic sign specialization here is arithmetic geometry, not a new local Langlands correspondence.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-sign-extension`.

### `GL2AutomorphicRepresentationsAndTransfer:R17.3`

Supply global JL after excluding norm characters, infinity-weight matching, split Hecke normalization and actual rational models. Add the supplier edge to R18.3 required by RT-AREA-automorphic-1/12; R18.4 inherits it.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.3/norm-branch`.

### `AutomorphicFormsOnReductiveGroups:AF.4`

Supply Sym^{k−2} tensor coefficient lattices, scalar extension, semigroup coefficient action and its perfect-pairing range; quaternionic weight specialization retains all local splitting hypotheses.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.3/quaternion-weight`, `HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing`.

### `AutomorphicFormsOnReductiveGroups:AF.5`

Extend the existing AF.5 carrier and evaluation theorem to fixed central character on D×\D_f×/(UZ) with effective Γ_t=(UZ∩t⁻¹D×t)/F×. The existing discrete-centre hypothesis excludes positive-rank O_F×. Supply generic coefficient-function Hecke and level maps and abstract versus acting Hecke algebra; R18.3 only specializes them.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing`, `HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-degeneracy`, `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-level`, `HilbertModularVarietiesAndShimuraCurves:R18.3/residual-hecke-ideal`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-specialisation`.

### `AutomorphicBundles:B2`

Supply rational automorphic line bundles, norm/pullback maps and the generic Hodge/dualizing identification. R18.2 owns its coarse quaternionic branch correction and metric normalization.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`.

### `ArakelovGeometryAndAbelianHeights:R35.2`

Supply generic hermitian rational lines, arithmetic degree and norm descent of metrics; consume the quaternionic Hodge line without redoing its integral model. Heights and Colmez identity remain here, not in R18.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`.

### `CrystallineCohomology:CR.7`

Supply strict O_v-relative covariant Dieudonné crystals, special Lie/Hodge filtration and Grothendieck–Messing tangent comparison. At ramified v the raw τ-quotient is nonexact: a saturated relative filtration/determinant theorem is required.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-kodaira-spencer`.

### `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`

Supply strict formal O_K-modules, special O_D-actions, relative heights, Cartier duals, finite torsion levels and moduli of framed quasi-isogenies; absolute p-height must scale by [K:Q_p].

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.5/special-formal-moduli`, `HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation`.

### `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`

Supply integral Dieudonné/Cartier equivalence on nilpotent bases, compatible duality and structured tensor/filtration comparison in the admissible coefficient components, including strict O_K-relative ranks.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-filtered-crystal`, `HilbertModularVarietiesAndShimuraCurves:R18.5/special-formal-moduli`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability`.

### `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`

Supply full faithfulness and all-prime crystalline Barsotti–Tate lattice classification over O_L, including p=2 (Kim/Lau/Liu scope), with descent after finite extension. Tensor products require the componentwise absence of weight −2.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-point-extension`, `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-filtered-crystal`.

### `ArithmeticLocallySymmetricSpaces:ALS.1`

Supply the generic associated coefficient local system and its singular chain/sheaf realization. TauCeti.LocalCoefficientSystem supplies only the fundamental-groupoid functor carrier.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-local-systems`.

### `ArithmeticLocallySymmetricSpaces:ALS.3`

Supply coefficient-compatible Hecke correspondence pullback/trace and composition on actual complexes, with finite-cover and orientation conventions.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomology-pairing`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-degeneracy`.

### `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality`

Supply early finite-level derived integral duality, pullback/trace adjoints and coefficient change before completed cohomology or automorphic comparison.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomology-pairing`.

### `ArithmeticLocallySymmetricSpaces:ALS.5`

Supply the characteristic-zero cohomological automorphic decomposition and real discrete-series/relative Lie algebra computation. Only this late spectral comparison uses the spectral supplier; it is not imported into early finite-level duality.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-eigenspaces`.

### `ClassicalAdicEtaleCohomology:H0`

Supply actual derived étale cohomology with integral inverse systems, coefficient exact sequence and Hochschild–Serre for finite étale covers; extend to the finite proper-curve finiteness theorem needed here rather than interpreting the definition as finiteness.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control`, `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-level-descent`.

### `ClassicalAdicEtaleCohomology:H3`

Supply proper smooth curve trace, Poincaré duality with L∨(1), and integral derived duality. A perfect integral H¹ pairing requires the explicitly stated torsion/vanishing conditions.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomology-pairing`.

### `ClassicalAdicEtaleCohomology:H5`

Supply algebraic–analytic étale and complex Betti comparison for proper curves with finite coefficient local systems, compatibly in l^n and with Hecke pull-push.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`.

### `WeightsInEtaleCohomology:R34.5`

Extend the elliptic-family Sym-power purity node to a rank-two Morita/projector constituent of the higher-dimensional quaternionic PEL abelian family, and the general pure-coefficient proper H¹ theorem. Verify relative splitting projectors and total tensor weight; do not invoke elliptic purity without this extension.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-purity`.

### `AutomorphicGaloisRepresentations:R19.2`

Supply the residual Galois-to-acting-Hecke dictionary and the characteristic-zero local–global compatibility excluding Steinberg at distinct-root TW places. Restrict this contract to the early coefficient/eigenspace construction from R18.2 and early R18.4: it must not depend on R18.3/tw-localised-control, R22 patching or R23 modularity, avoiding a declaration-level cycle.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control`, `HilbertModularVarietiesAndShimuraCurves:R18.3/residual-hecke-ideal`.

### `ReductiveGroupsPartII:RG2.2`

Supply the GL₂ reduced building as the lattice/norm-class tree, adjacency, q+1 valence and PGL₂ action; R18.5 constructs the analytic reduction and its formal charts, not a second general building.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-half-plane`, `HilbertModularVarietiesAndShimuraCurves:R18.5/affinoid-reduction`.

### `AdicSpacesPartII:R2`

Supply gluing/separated quotients and algebraisation for the flat locally finite-type semistable formal curves used in the arithmetic quotient; extend the existing admissible-formal/generic-fibre machinery as AdicSpacesPartII Part II where quotient representability is not yet stated.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`.

### `NeronModelsAndSemistableAbelianVarieties:R11.4`

Supply the semistable Jacobian graph character lattice, thickness-weighted monodromy pairing, component-group cokernel and Hecke/degeneracy functoriality. R18.5 only identifies this generic graph/lattice with its arithmetic tree quotient.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.5/character-monodromy`.

### `tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs`

Import the existing upstream relative-curve/DVR extension and descent framework, with unramified versus ramified base change distinguished.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/coarse-model`.

### `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`

Import the existing node/normalization and dual multigraph API, including thickness, branches, loops and repeated edges; do not replan it.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model`, `HilbertModularVarietiesAndShimuraCurves:R18.5/tree-dual-graph`.

### `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`

Import regular-surface codimension-two extension and divisor Cartier/norm tools. At the node both multiplication factors can be nonunits; extend the generic/smooth-locus determinant across codimension two.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/qfactorial-model`, `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-kodaira-spencer`.

### `tauceti:TauCetiRoadmap/StableReduction#layer-5-regular-and-minimal-models`

Import the regular proper model, relative minimality and the uniqueness of the minimal regular model for positive generic genus (Layer 5), used for the fine models of genus at least 2. Layer 5 does not state finite group quotients or formal algebraisation: the effective finite quotient is requested from PELModuli:M4 and the algebraisation of proper formal curves from AdicSpacesPartII:R2.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`, `HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`.

### `tauceti:TauCetiRoadmap/StableReduction#layer-6-numerical-types-and-picard-torsion`

Import graph/Picard numerical compatibility; the full generic Jacobian monodromy theorem is specifically requested from R11.4.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.5/character-monodromy`.

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`

Import existing line/divisor/Picard degree and base-change maps; require the rational-line and finite norm extension from the assigned arithmetic owner rather than inventing it here.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`.

### `ModularCurvesPartII:R12.2`

Import the rational split modular-curve moduli and compactification with compatible tame-level conventions; this is outside the compact division-prime theorem.

Required by: `HilbertModularVarietiesAndShimuraCurves:R18.5/rational-uniformisation`.

## Remaining mathematical and signature gaps

### 1. Ramified relative Kodaira–Spencer

Construct and prove the saturated strict O_v-relative crystal/Hodge filtration at ramified F_v, with determinant matching the absolute filtered crystal. YZ’s raw τ-quotient rank argument is invalid; the node is a target with this unproved repair, not an established arbitrary-ramification theorem.

Affected declarations: `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-kodaira-spencer`.

### 2. Ramified bridge determinant

Prove the integral saturated determinant tensor comparison at ramified F_v and hence the intended extension of Corollary 5.5. The unramified direct-summand cancellation is planned; the printed Hom_OE=Hom_OB deformation argument is false.

Affected declarations: `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-filtered-crystal`, `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-determinant`.

### 3. Khare Lemma 2.2 exact statement

The routed /209 statement is not supplied by KW, which only describes its use. Read and collate Lemma 2.2 in Duke 134 (2006), 557–589, DOI 10.1215/S0012-7094-06-13434-8. The accessible arXiv math/0504080v1 has a different title and Proposition 2.2, so cannot certify the requested lemma. Project Euclid returned HTML rather than the final PDF. Separate automatic p>3/unramified neatness, actual auxiliary smallness, and the degree argument removing neatness restrictions; avoid the R23→R18 cycle.

Affected declarations: `HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change`.

### 4. Indefinite integral Ihara and saturation

Prove the exact mod-l injectivity/saturation statement consumed by R22 for the coefficient system and image hypothesis in use. Manning–Shotton (arXiv:1907.06043; Math. Ann. 379 (2021), Theorem 1.1) assumes l>2 and large residual image, with an extra exceptional l=5 condition; its patching proof cannot be imported upstream of R22. Definite KW Lemma 7.1 does not prove it. Only the actual degeneracy construction, traces and degree are asserted in this pass.

Affected declarations: `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-degeneracy`.

### 5. Residual cohomological vanishing

Verify H⁰(L_k)_m=H⁰(L_k∨(1))_m=0 for each quaternionic weight/level residual system exported to R22. Until this is checked the integral-freeness theorem is used under its two explicit vanishing hypotheses.

Affected declarations: `HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control`.

### 6. Missing formal carriers in suggested Lean

At the pinned baseline there are no strict quaternionic p-divisible moduli, formal Drinfeld schemes, PEL universal family or integral étale-cohomology carrier. The suggested file gives actual elementary double-coset, group-ring/level, norm-twist and polynomial-kernel prototypes, and the underlying weight module, the point set of Ω_K and the counting tests, where typeable; it records each omitted definition, API, test and theorem by its packet name and full statement. These entries are signature obligations, not Lean declarations or fake proposition fields. Obtain the supplier carriers, then replace the ledger entries with typed signatures and rerun at both pins.

Affected declarations: `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance`, `HilbertModularVarietiesAndShimuraCurves:R18.2/effective-small-level`, `HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.2/connected-pel-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.2/finite-pel-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model`, `HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower`, `HilbertModularVarietiesAndShimuraCurves:R18.2/coarse-model`, `HilbertModularVarietiesAndShimuraCurves:R18.2/hecke-integral-extension`, `HilbertModularVarietiesAndShimuraCurves:R18.2/qfactorial-model`, `HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line`, `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-pdiv`, `HilbertModularVarietiesAndShimuraCurves:R18.2/integral-kodaira-spencer`, `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-tate-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-integral-model`, `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-point-extension`, `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-filtered-crystal`, `HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-determinant`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set`, `HilbertModularVarietiesAndShimuraCurves:R18.3/quaternion-weight`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-specialisation`, `HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change`, `HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing`, `HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation`, `HilbertModularVarietiesAndShimuraCurves:R18.3/norm-branch`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-degeneracy`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-jl`, `HilbertModularVarietiesAndShimuraCurves:R18.3/isotropy-exponent`, `HilbertModularVarietiesAndShimuraCurves:R18.3/base-change-annihilator`, `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-level`, `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-stabilisers`, `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-freeness`, `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control`, `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-norm-twist`, `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-hecke-twist`, `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-sign-extension`, `HilbertModularVarietiesAndShimuraCurves:R18.3/residual-hecke-ideal`, `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-local-systems`, `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-cohomology`, `HilbertModularVarietiesAndShimuraCurves:R18.4/integral-cohomology-control`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomology-pairing`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-eigenspaces`, `HilbertModularVarietiesAndShimuraCurves:R18.4/definite-indefinite-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.4/cohomological-degeneracy`, `HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-purity`, `HilbertModularVarietiesAndShimuraCurves:R18.4/finite-level-descent`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-half-plane`, `HilbertModularVarietiesAndShimuraCurves:R18.5/affinoid-reduction`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-formal-model`, `HilbertModularVarietiesAndShimuraCurves:R18.5/special-formal-moduli`, `HilbertModularVarietiesAndShimuraCurves:R18.5/drinfeld-representability`, `HilbertModularVarietiesAndShimuraCurves:R18.5/height-and-descent`, `HilbertModularVarietiesAndShimuraCurves:R18.5/arithmetic-quotient`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`, `HilbertModularVarietiesAndShimuraCurves:R18.5/rational-uniformisation`, `HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation`, `HilbertModularVarietiesAndShimuraCurves:R18.5/tree-dual-graph`, `HilbertModularVarietiesAndShimuraCurves:R18.5/character-monodromy`.

### 7. Cross-part connected-comparison descent over K

R18.1/yz-component-comparison supplies the comparison over a common algebraic closure, with finite n supported at p and prime to d_B. It explicitly leaves Carayol’s descent field, cocycle and tame-level dependence unresolved. R18.2/connected-pel-comparison and /finite-pel-comparison still target descent over K=completion of F_v^ur; this stronger output is not provided by the geometric supplier. Restore and verify Carayol §§4.2–4.5 with the exact norm-one quotient and finite-level action. Until then the integral transfer and totally-real uniformisation routes that consume this descent remain conditional; BZ’s uniformisation theorem itself is unchanged.

Affected declarations: `HilbertModularVarietiesAndShimuraCurves:R18.2/connected-pel-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.2/finite-pel-comparison`, `HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation`.

## Source corrections and routing

The packet carries 19 findings from the independently reviewed Yuan–Zhang extraction, retaining each original finding ID and review provenance. The mathematical corrections constrain the nodes here: effective central groups and order containment, distinct full/Morita dimensions, inverse-sign Kodaira–Spencer determinant, division discriminant levels, pointwise versus global family extension, ramified filtered-crystal nonexactness and the rank mismatch in the printed Hom argument. These inherited findings await this packet’s independent review; no self-review is claimed.

- **E1**, §2.3, proof of Theorem 2.7, p. 549 (not p. 550); restated in §1.2, p. 537; Erratum §1, p. 1: Replace Theorem 2.7 by Erratum Theorem 1 (p. 2): A, A1 and A2 have good reduction over O_K, and the kernel of the O_E-isogeny A1 × A2 → A is the graph of an O_E-isomorphism A1[δ_{E/F}] ≅ A2[δ_{E/F}]. Restrict the introduction's claim (p. 537), that h(Φ1,Φ2) = ½h(A0,τ) 'for any abelian variety A0 with an action by O_E and isogenous to A_Φ1 × A_Φ2', in the same way.
- **E8**, §4.3, definition of KS_℘ before Theorem 4.10, p. 569: N_℘ := det W^t_℘ ⊗ det W_℘
- **E9**, §4.3, proof of Theorem 4.10, division case, p. 570: The claim holds off the double points of the special fibre, where π is a prime local equation of the reduced special fibre, and on the generic fibre, where both j_i are isomorphisms. There the printed computation gives ω^{-2} = π·N^∨, i.e. N = πω^2 = ω^{⊗2}(−d_{B,℘}); the extraction's 'π^{-1}N^∨' has the wrong power of π. The double points are closed points, of codimension 2, of the regular finite-level models 𝒳_{1,U^p} ⊗ O_K (Theorem 4.5). On such a normal scheme a map of line bundles N → ω^{⊗2}(−d) that is an isomorphism off codimension 2 is an isomorphism. So Theorem 4.10 stands.
- **E19**, §3.2, proof of Proposition 3.2, p. 554: The relative dimension is 4g, and the moduli space is M_{4g,d,n}. The same paragraph also writes F′_{U′p}, X′_{0,U′p} and F̃_{0,U′p} for F̃_{U′p}, X′_{1,U′p} and F̃_{U′p}.
- **E20**, §3.3, 'CM points', p. 558: X′^{T′} is a single T̂′-orbit: a principal homogeneous space under T̂′ modulo the closure of T′(Q), namely {[z0, t] : t ∈ T̂′}.
- **E23**, §4.2, proof of Theorem 4.5, first sentence, p. 564; the slip recurs on p. 565: Proposition 3.2 in both places.
- **E27**, §3.3, proof of Theorem 3.7, p. 559: ∇(e_z) = (−1, 0)dz = (e_z − ē_z)/(2iy) dz, so dz = −2iy e_z/ē_z under Kodaira–Spencer. |dz| = 2y is unchanged.
- **E28**, Hypothesis of Theorem 1.6 (§1.2, p. 536) and of Theorem 1.7 (§1.3, p. 539); the step used is in §7.2, p. 591, and §5.3, p. 576 assumes the stronger condition: In Theorems 1.6 and 1.7 (and §§1.2–1.3), take U = Ô_𝔹^× for a maximal order Ô_𝔹 of 𝔹_f containing Ô_E. This follows from 'U maximal ⊇ Ô_E^×' unless some place v | 2 of F with residue field F_2 splits in E. Theorem 1.1 is unaffected, since such a U can always be chosen.
- **E29**, §1.2, Theorem 1.6, p. 537, against the standing assumption of §4.1, p. 561: Add to Theorem 1.6 the hypothesis of Theorem 1.7 that at least two places of F ramify in 𝔹 (X_U compact), or supply the cusp analysis. Theorem 1.1 is unaffected: 𝔹 can be chosen with |Σ(𝔹)| ≥ 3 (for g = 1, add two finite places inert in E).
- **E30**, §4.3, before Theorem 4.10, p. 569: Take M_℘, W_℘ and W^t_℘ to be the τ-parts for O_℘ ⊗_{Z_p} O_X → O_X, or the O_℘-relative Dieudonné crystal of the strict special formal O_{B,℘}-module ℋ_℘ with its Hodge filtration. These have ranks 4, 2 and 2, as §5.2 implicitly uses. If F_℘/Q_p is ramified, the τ-quotient of Lie(ℋ^t_℘)^∨ has torsion, and one must use its image in M_℘ or the relative theory.
- **E31**, §5.2, before Proposition 5.4, p. 575: True when F_℘/Q_p is unramified. Then O_{F,p} ⊗_{Z_p} O_L is a product, the τ-quotients are exact direct summands, and Proposition 5.4 follows from Proposition 5.3 by taking τ-components. When e(F_℘/Q_p) > 1, W(I_y) is a nonzero torsion module, the τ-quotient sequences 0 → W(G^t) → M(G) → W(G)^∨ → 0 displayed on p. 575 need not be left exact, and Proposition 5.4 and Corollary 5.5 need a separate integral argument. For example, W(−) could be redefined as the image in the generic fibre and the identities re-proved at the level of determinants. The paper gives no such argument.
- **E32**, §5.2, deformation display and Corollary 5.5, pp. 575–576: Identity (3) is false. Consequently 𝒳̂″_{1,x″} is not the universal deformation of ℋ″_{x″} as a p-divisible O_{E,p}-module; it can be at most the universal deformation with extra structure, such as the polarization from X′, and the claim is not used later. Corollary 5.5 follows directly without this chain. By Proposition 5.4 the W(I^t_y)-twists cancel in det W(ℋ″) ⊗ det W(ℋ″^t), which gives det W(ℋ_x) ⊗ det W(ℋ^t_x) ⊗ O_{K′} = N_{1,℘,x} ⊗ O_{K′} (E8 convention). The lattices lie in the generic fibre of N″ ≅ ω^{⊗2}, not ω^{-2}. In the first line, H should be H″ throughout.
- **E33**, §4.3, proof of Theorem 4.9, p. 569: Proposition 3.5, together with Proposition 3.2 and the description of H′ on pp. 555–556.
- **E34**, §5.2, proof of Proposition 5.2 and the 'Deformation theory' paragraph, p. 574: the tensor product T(H_x) ⊗_{O_{E,p}} T(I_y) … by Theorem 4.9 … D(ℋ″_{x″}), D(ℋ_x), D(ℐ_y) over O_L.
- **E35**, §5.2, before and in the proof of Proposition 5.2, p. 574: For p = 2 cite Kim [Kim12], Lau [Lau14] and Liu [Liu13], as the paper itself does in the proof of Proposition 5.3. Also justify 'weights 0 and −1': at embeddings above τ, I has weight 0; above τ′ ≠ τ, ℋ_℘ has weight 0 because it is strict; and ℋ^℘ is étale.
- **E36**, §5.2, 'Integral models', p. 573: X″_{1,℘′} = X″_1 ⊗_{F′} K′
- **E37**, §4.2, proof of Corollary 4.6(2), p. 566: This proves the case H = F.
- **E38**, §4.3, proof of Theorem 4.10, pp. 569–570: Ω(ℋ_℘) … Now assume that ℘ is nonsplit in 𝔹 (i.e. ℘ | d_B).
- **E39**, §4.1, Proposition 4.3 and the preceding paragraph, p. 563: Δ̄_0/O^1_{B,p} ≅ Δ̄′_0/O^1_{B,p}, identified through G → G″ (the proof of Theorem 4.5 writes Δ_0 = Δ′_0).

Every maintainer-routed paper item has the following explicit owner decision. The exact extraction item IDs make this a coverage crosswalk, rather than attributing an entire paper to one stage.

- **PAPER-YUAN-ZHANG-18/quaternion-datum** → HilbertModularVarietiesAndShimuraCurves:R18.1: Canonical incoherent/nearby quaternion datum; order-containment and compactness corrections imported.
- **PAPER-YUAN-ZHANG-18/pel-groups** → HilbertModularVarietiesAndShimuraCurves:R18.1: Canonical group/reflex and torus bridge; owned integral instance is quaternion-pel-instance.
- **PAPER-YUAN-ZHANG-18/reflex-contains-F** → HilbertModularVarietiesAndShimuraCurves:R18.1: Canonical reflex-field theorem, not re-planned.
- **PAPER-YUAN-ZHANG-18/pel-moduli** → HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pel-instance: Generic moduli/representability imported from M1–M2, actual quaternionic integral datum checked.
- **PAPER-YUAN-ZHANG-18/pel-integral** → HilbertModularVarietiesAndShimuraCurves:R18.2/carayol-split-model: Split finite-place integral PEL specialization; division place uses uniformisation.
- **PAPER-YUAN-ZHANG-18/level-integral** → HilbertModularVarietiesAndShimuraCurves:R18.2/integral-pdiv: Discriminant-qualified level interpretation, with generic normalization M4.
- **PAPER-YUAN-ZHANG-18/pel-pdiv** → HilbertModularVarietiesAndShimuraCurves:R18.2/integral-pdiv: Auxiliary PEL p-divisible carrier imported, quaternionic extension specialized.
- **PAPER-YUAN-ZHANG-18/complex-ks** → HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line: Metric 2 Im z and sign-corrected generic Kodaira–Spencer instance; generic bundles imported.
- **PAPER-YUAN-ZHANG-18/point-good-reduction** → PELModuli:M2: Generic PEL compact/proper and good reduction theorem; actual local specialization in carayol-split-model.
- **PAPER-YUAN-ZHANG-18/genus-small-level** → HilbertModularVarietiesAndShimuraCurves:R18.2/effective-small-level: Principal level ≥3 effective freeness and genus.
- **PAPER-YUAN-ZHANG-18/quaternion-pdiv** → HilbertModularVarietiesAndShimuraCurves:R18.2/quaternion-pdiv-tower: Right fibre action and torsion-dependent finite tame descent.
- **PAPER-YUAN-ZHANG-18/component-comparison** → HilbertModularVarietiesAndShimuraCurves:R18.2/connected-pel-comparison: Connected effective groups and coefficient maps.
- **PAPER-YUAN-ZHANG-18/quaternion-regular-model** → HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower: Split Carayol and division BZ models with distinct local scopes.
- **PAPER-YUAN-ZHANG-18/coarse-model** → HilbertModularVarietiesAndShimuraCurves:R18.2/coarse-model: Fine normal quotient; regularity not inherited automatically.
- **PAPER-YUAN-ZHANG-18/qfactorial** → HilbertModularVarietiesAndShimuraCurves:R18.2/qfactorial-model: Exact unramified base-change hypothesis.
- **PAPER-YUAN-ZHANG-18/hodge-qline** → HilbertModularVarietiesAndShimuraCurves:R18.2/arithmetic-hodge-line: Coarse ramification correction, norms and metric.
- **PAPER-YUAN-ZHANG-18/integral-pdiv** → HilbertModularVarietiesAndShimuraCurves:R18.2/integral-pdiv: Relative height and special formal module.
- **PAPER-YUAN-ZHANG-18/integral-ks** → HilbertModularVarietiesAndShimuraCurves:R18.2/integral-kodaira-spencer: Correct determinant sign/factor; ramified relative filtration gap.
- **PAPER-YUAN-ZHANG-18/bridge-torus** → HilbertModularVarietiesAndShimuraCurves:R18.1: Torus/group/canonical X″ owned there; integral coefficient specialization in bridge-tate-comparison.
- **PAPER-YUAN-ZHANG-18/tate-tensor** → HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-tate-comparison: Tensor over O_E,p and diagonal centre cancellation.
- **PAPER-YUAN-ZHANG-18/point-pdiv-extension** → HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-point-extension: Pointwise only, all-prime classification and no weight −2.
- **PAPER-YUAN-ZHANG-18/cotangent-tensor** → HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-filtered-crystal: Integral structured tensor; raw ramified τ quotient nonexact.
- **PAPER-YUAN-ZHANG-18/cm-alignment** → HilbertModularVarietiesAndShimuraCurves:R18.1: CM-point alignment on canonical torus bridge; height identity owned by R35.
- **PAPER-YUAN-ZHANG-18/level-projective-system** → HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower: Fine level regular model tower and compatible transitions.
- **PAPER-YUAN-ZHANG-18/pdiv-comparison** → HilbertModularVarietiesAndShimuraCurves:R18.2/connected-pel-comparison: Corrected effective group isomorphism and split local sheaf comparison.
- **PAPER-YUAN-ZHANG-18/finite-level-comparison** → HilbertModularVarietiesAndShimuraCurves:R18.2/finite-pel-comparison: Finite level connected component choices retained.
- **PAPER-YUAN-ZHANG-18/determinant-cancellation** → HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-determinant: Unramified cancellation plus explicit ramified repair.
- **PAPER-YUAN-ZHANG-18/rev-cm-points-of-x-prime** → HilbertModularVarietiesAndShimuraCurves:R18.1: Correct effective CM torus orbits and universal family point scope.
- **PAPER-YUAN-ZHANG-18/rev-case-2-p-divisible-group** → HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-point-extension: Case-2 extension only pointwise; no global universal family claimed.
- **PAPER-YUAN-ZHANG-18/rev-projective-system-of-quaternionic-models** → HilbertModularVarietiesAndShimuraCurves:R18.2/regular-model-tower: Actual finite-level compatibility and allowed discriminant levels.
- **PAPER-YUAN-ZHANG-18/rev-integral-models-of-x-double-prime** → HilbertModularVarietiesAndShimuraCurves:R18.2/bridge-integral-model: X″ rather than X′, ramified base change loses regularity.
- **PAPER-YUAN-ZHANG-18/rev-cerednik-drinfeld-uniformization** → HilbertModularVarietiesAndShimuraCurves:R18.5/totally-real-uniformisation: Division-prime formal uniformisation; distinguish BZ totally-real theorem from BC rational global case.
- **PAPER-YUAN-ZHANG-18/rev-cm-points-on-x-u** → HilbertModularVarietiesAndShimuraCurves:R18.1: Canonical CM point and actual order containing O_E. Erratum graph check and arithmetic heights imported.
- **PAPER-COLMEZ-DOSPINESCU-NIZIOL-23/4-quaternionic-setup** → HilbertModularVarietiesAndShimuraCurves:R18.3/residual-hecke-ideal: Formal residual kernel and inverse-norm dictionary; actual Galois eigen-system requested from R19.
- **PAPER-COLMEZ-DOSPINESCU-NIZIOL-23/4-hecke-algebra** → HilbertModularVarietiesAndShimuraCurves:R18.3/residual-hecke-ideal: Formal residual kernel and inverse-norm dictionary; actual Galois eigen-system requested from R19.
- **PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B/1.2-half-plane-models** → HilbertModularVarietiesAndShimuraCurves:R18.5/affinoid-reduction: Affinoids and blow-up union model, also drinfeld-formal-model.
- **PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B/5.2-shimura-setup** → HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation: All-level rigid uniformisation with the CDN global setup and transition maps.
- **PAPER-COLMEZ-DOSPINESCU-NIZIOL-20-B/5.2-prop-5-4** → HilbertModularVarietiesAndShimuraCurves:R18.5/tower-uniformisation: All-level rigid uniformisation with the CDN global setup and transition maps.
- **PAPER-KHARE-WINTENBERGER-09-II/209** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/212** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/213** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/214** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/215** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/216** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/217** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/218** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/219** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/221** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/222** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/224** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/225** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/226** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/228** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/229** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/230** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/233** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/234** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/235** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/236** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/237** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/242** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/243** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/244** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/272** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.
- **PAPER-KHARE-WINTENBERGER-09-II/276** → HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change: Exact Khare Lemma 2.2 source gap retained; Taylor neatness/reduction and pairing stated with their restrictions.

## Baseline and suggested signatures

The recorded baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 with Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The cited declarations have been read at those pins; each provides only the following substrate. No name search is treated as proof of a quaternionic carrier.

- **mathlib:DoubleCoset.Quotient**, Mathlib/GroupTheory/DoubleCoset.lean: Existing double-coset quotient; specialized, never reconstructed.
- **mathlib:DoubleCoset.eq**, Mathlib/GroupTheory/DoubleCoset.lean: Equality is witnessed by left and right subgroup multiplication.
- **mathlib:Representation**, Mathlib/RepresentationTheory/Basic.lean: Monoid homomorphism into linear endomorphisms.
- **mathlib:Submodule**, Mathlib/Algebra/Module/Submodule/Defs.lean: Linear subobjects, including invariant coefficient submodules.
- **mathlib:MonoidAlgebra**, Mathlib/Algebra/MonoidAlgebra/Defs.lean: Group-algebra substrate for diamond actions.
- **mathlib:QuotientGroup.mk**, Mathlib/GroupTheory/Coset/Defs.lean: Quotient by a subgroup; group structure requires normality.
- **mathlib:AlgebraicGeometry.Scheme**, Mathlib/AlgebraicGeometry/Scheme.lean: Schemes with affine open covers.
- **mathlib:AlgebraicGeometry.Flat**, Mathlib/AlgebraicGeometry/Morphisms/Flat.lean: Flat scheme morphisms; affine/stalk conditions.
- **mathlib:IsRegularLocalRing**, Mathlib/RingTheory/RegularLocalRing/Defs.lean: Noetherian local regularity via maximal ideal and Krull dimension.
- **mathlib:Module.Free**, Mathlib/LinearAlgebra/FreeModule/Basic.lean: Freeness via existence of a basis, not just finiteness.
- **mathlib:Module.Finite**, Mathlib/RingTheory/Finiteness/Defs.lean: Finite generation over a specified scalar ring.
- **tauceti:TauCeti.LocalCoefficientSystem**, TauCeti/AlgebraicTopology/LocalCoefficient.lean: Fundamental-groupoid functor to modules, not a cohomology theorem.
- **mathlib:MvPolynomial.eval₂Hom**, Mathlib/Algebra/MvPolynomial/Eval.lean: Evaluation in a commutative target via a coefficient ring map and values of variables.
- **mathlib:RingHom.ker**, Mathlib/RingTheory/Ideal/Maps.lean: Ideal kernel of the residual polynomial evaluation.
- **mathlib:RingHom.ker_isMaximal_of_surjective**, Mathlib/RingTheory/Ideal/Maps.lean: Surjective homomorphism to a division ring has maximal ideal kernel.
- **mathlib:LinearEquiv**, Mathlib/Algebra/Module/Equiv/Defs.lean: Invertible linear map on actual coefficient-function spaces.

The companion suggested file gives genuine signatures for elementary double cosets, the N-torsion diamond factor, norm multiplication and the residual polynomial kernel. Its declaration ledger repeats all packet names, hypotheses, APIs and unit-test statements. Entries lacking actual supplier types are comments specifying an omitted signature, not Lean axioms or proposition-valued stand-ins. Elaboration checks the typed prototypes only, and supplies no proof or implementation of a planned theorem. The packet and this document are definitive for the omitted targets.

## Sources and versions

- [Sur la mauvaise réduction des courbes de Shimura](https://www.numdam.org/item/CM_1986__59_2_151_0.pdf) — Henri Carayol; Compositio Mathematica 59 (1986), 151–230; published scan. Read: §0, pp.151–154; §§1.4 and 2.2 (coefficients/PEL); §§4.1–4.5, pp.181–189; §§5.1–5.6, pp.189–194; §§6.1–6.7, pp.194–197; §7 introduction and §7.2, pp.197–198; §9.2–9.5, pp.207–210. SHA-256: 22c01e577504a9963168e78373286d8ecac6ecc8178db64262cf8d473b91b3b3.
- [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) — Xinyi Yuan and Shou-Wu Zhang; Annals of Mathematics 187 (2018), 533–638; version of record. Read: §§3–5, pp.550–577; §8.2 superspecial uniformisation, pp.619–621; reviewed source corrections checked against these passages. SHA-256: 29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507.
- [Erratum to On the Averaged Colmez Conjecture](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf) — Xinyi Yuan and Shou-Wu Zhang; Author revision 18 December 2022; final journal erratum Annals 198 (2023), 867–878 not collated. Read: §1, Theorems 1–2, verification of graph-of-different-torsion kernel. SHA-256: 18b46acd0f6be352d4bc5b4d7797650be3e228712e13de94bbb45ec25b576c91.
- [Uniformisation p-adique des courbes de Shimura: les théorèmes de Cerednik et de Drinfeld](https://www.numdam.org/item/AST_1991__196-197__1_0.pdf) — Jean-François Boutot and Henri Carayol; Astérisque 196–197 (1991), article pp.45–158; full-volume PDF. Read: Introduction, pp.45–48; Part I §§1–3, pp.49–56 (tree, norms, charts); Part II §§5.12–5.17, pp.96–98; §§7.4–7.6 and 8.1–8.4, pp.105–109; §9.3, pp.110–111; Part III §§5.1–5.4, pp.139–146; OCR-defective formulas checked on page images. SHA-256: 2a9aa0b0a046cb37e4d6b6ccc06dfaa00f10d90223ac9d2cb94918d069295119.
- [On the p-adic uniformization of quaternionic Shimura curves](https://arxiv.org/pdf/2212.06886v1) — Jean-François Boutot and Thomas Zink; arXiv:2212.06886v1, 13 December 2022 (text dated 15 December). Read: §1, pp.1–3; §5.7–5.11, pp.37–40; §6.2–6.3, pp.42–45; §6.6–6.8, pp.46–50; (6.29)–(6.31) local level convention. SHA-256: 89efb1ef16c2f7704d7f375f7aca4a2a5bcf81053211035b8c09d037545060dd.
- [Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Chandrashekhar Khare and Jean-Pierre Wintenberger; Author copy proofs.pdf, 98 pages, dated 30 May 2009; published Inventiones 178 (2009), 505–586. Read: §§7.1–7.5, pp.57–67; references to auxiliary neatness in §§8.2,8.4, pp.73,77. SHA-256: 53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4.
- [On the Meromorphic Continuation of Degree Two L-Functions](https://ems.press/content/book-chapter-files/27484?nt=1) — Richard Taylor; Documenta Mathematica Extra Volume Coates (2006), 729–779; revised 28 June 2006. Read: §1, pp.737–742, Lemma 1.1, Corollary 1.2, integral pairings; §2 Lemmas 2.2–2.4. SHA-256: 6ec26bfc12e1cf38d410b36c18f985e2fb26c1cb1bb03d6e5197ccf58f92c51c.
- [Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928v2) — Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł; arXiv:1704.08928v2, 7 June 2018; source for JAMS 33 (2020), 311–362. Read: §1.2, pp.12–13; §5.2.1–5.2.2, pp.41–43, Proposition 5.4. SHA-256: 15e4868f5b11ad113e2806b5e9884d7b100f529e67c6cd6030f24cf8e3ae9073.
- [Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://arxiv.org/pdf/2204.11214) — Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł; arXiv:2204.11214v2; source for Forum of Mathematics Pi 11 (2023), e16. Read: §4.1.1–4.1.3, pp.47–49, residual Hecke ideal. SHA-256: c5711666b845a48f6fc2cd944b22bbde0c45567fe29dacb00a3429619baecbee.
