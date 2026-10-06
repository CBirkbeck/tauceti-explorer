# Automorphic bundles and classical automorphic forms — part B0

This is the proposed roadmap for the eight stages B0, B1, B1.general, B2,
B2.general, B3, B3.general and B4. It supplies finite-dimensional coefficients,
their canonical principal bundles and realizations, canonical/subcanonical
extensions, and classical forms. B5 owns Fourier–Jacobi expansions and the
cohomological operations. No declaration here is claimed implemented.

The target-level pass is complete: every stage is **planned**, none is closed.
The packet records exact supplier requests and proof/interface refinements.
In particular, the nominated generic associated-bundle supplier has no covering
stage; that structural gap must be assigned before geometric closure. Missing
geometric Lean carriers appear as named mathematical contracts in the suggested
file. Their comments are not compiled signatures. The actual functional adapter,
weight labels and supplied-module section type are a narrower executable slice.

Read this document together with [the packet](../packets/AutomorphicBundles--B0.json)
and [the suggested file](../suggested/AutomorphicBundles--B0.lean). All status is
unchecked. The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Conventions and ownership

Use the cohomological Hodge filtration unless a homology coefficient is explicitly
named. The standard homology coefficient is the dual of relative H¹; Tate and
similitude lines stay visible. Fix μ(z)=h_C(z,1), with action z^(−p) on H^{p,q};
then P_H=P(μ⁻¹) stabilizes the descending Hodge filtration. BCGP uses the opposite
Hodge–Tate flag and left cosets. Compare its dual/highest-weight convention before
transferring any formula.

For a principal right torsor, (t,v) is identified with (tp,ρ(p)⁻¹v), and a section
function satisfies f(tp)=ρ(p)⁻¹f(t). For a left base action the cocycle is
J(gh,x)=J(g,hx)J(h,x); its inverse gives Mathlib's indexed right slash action.
A zero section does not imply a cocycle. The determinant-negative GL₂(R) law is
semilinear over C and is not the linear adapter's SL₂ compatibility case.

The coefficient group is Gᶜ=G/Z_s in Milne's sense. Check the ineffective
arithmetic centre and every surviving finite stabilizer. Neatness alone does not
remove non-torsion Hilbert units. Coefficients are defined over their actual
representation/weight field, which can exceed the reflex field.

Generic associated bundles and representation theory belong to their existing
suppliers. ShimuraData owns compact duals, their reflex-field forms, the Borel
embedding and homogeneous variations. AbelianSchemesAndArithmeticModuli supplies
degree-one family realizations; ShimuraVarieties owns the variety-level canonical
models and general reduction; ShimuraCompactifications owns actual cusp charts,
degenerations, fan maps and minimal models. The proper-curve GL₂ forms are imported
from AlgebraicModularFormsAndSerreWeights, then compared here to the general
coefficient functor. No supplier's objects are rebuilt as private substitutes.

Canonical coefficients are locally free on the specified smooth toroidal model.
Their minimal pushforward is coherent; a minimal invertible Hodge-line power needs
its separate positivity/divisibility theorem. Subcanonical means tensoring with
the **reduced** boundary ideal. Fan independence concerns sections on different
spaces, not equality of their sheaves, and subcanonical pullback need not be an
isomorphism after a boundary blowup. General data are completed by normalized
conjugation, adjoint jets and rank-one reduction, without positing a universal
family of motives.

## Stages and declarations

Each entry is one declaration-sized target. Construction/definition entries list
the planning API and discriminating tests; other entries give their concrete
acceptance checks. Proof chains terminate in the listed baseline declarations,
existing blueprint nodes, supplier requests or the explicit gaps below.


## B0. Associated bundles and coefficient descent

Coverage: **planned**. The following targets are specified; the stage remains open at its supplier/proof and typed-carrier refinements.

### The coefficient quotient Gᶜ

`AutomorphicBundles:B0/central-split-quotient` — construction. Proposed name: `AutomorphicBundles.centralSplitQuotient`.

For a reductive Q-group G occurring in a Shimura datum, let Z_s be the largest central Q-subtorus which is R-split and has no nonzero Q-split subtorus (equivalently the character-lattice conditions in Milne III, p.52). Construct Gᶜ=G/Z_s, its quotient homomorphism, and the universal factorization of algebraic representations trivial on Z_s. Use this coefficient quotient, not Gᵈᵉʳ or Gᵃᵈ. Lan §5.3 describes Z_s equivalently as the minimal central subtorus removing the excess real split rank.

Proof/construction:

1. Use the central-torus character lattice to construct Z_s; its existence/uniqueness is the recorded reductive-group interface gap.
2. Form the algebraic quotient G/Z_s via the recorded quotient interface.
3. Apply the quotient universal property to representations with trivial Z_s action; the construction does not assert every G-representation factors.

Inputs: the exact algebraic hypotheses in the statement; the named foundational gap where specified in its proof.

Planning API:

- `AutomorphicBundles.centralSplitQuotient_quotient` (projection): The algebraic epimorphism q:G→Gᶜ has kernel Z_s.
- `AutomorphicBundles.centralSplitQuotient_factor` (universal-property): If ρ|Z_s=1 there is a unique ρᶜ with ρ=ρᶜ∘q.
- `AutomorphicBundles.centralSplitQuotient_factor_iff` (characterisation): An algebraic representation factors through q iff Z_s acts trivially.

Uses:

- Milne III §§3,5: Chooses the actual structure group of the standard principal bundle.
- Lan §5.3: Distinguishes group-valued local systems from arbitrary Levi coefficients.

Unit tests:

- `AutomorphicBundles.centralSplitQuotient_test_gl2` (computation): For G=GL2/Q, ranks of its centre over Q and R agree, so Z_s=1 and Gᶜ=G.
- `AutomorphicBundles.centralSplitQuotient_test_hilbert` (non-example): For G=Res(F/Q)GL2 with [F:Q]>1 totally real, Z_s has dimension [F:Q]−1; replacing Gᶜ by G without a central condition admits forbidden coefficients.
- `AutomorphicBundles.centralSplitQuotient_test_trivial` (degenerate): The trivial representation factors through Gᶜ and stays trivial.

Acceptance: For GL2/Q the quotient retains the central weight character; for a totally real restriction of scalars the excess real split centre must be removed.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §1, p.52; III §3, pp.55–56 — States the canonical-model or associated-coefficient interface with the hypotheses retained below.; [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §5.3 Theorem 5.3.1, p.63 — Equivalent coefficient-group description; this stage does not prove Liu–Zhu’s p-adic geometricity theorem..

### Ineffective stabilizers and coefficient descent

`AutomorphicBundles:B0/ineffective-fibre-descent` — theorem. Proposed name: `AutomorphicBundles.ineffectiveFibreDescent`.

In characteristic zero, for a finite stabilizer quotient admitting a tame coarse space, an equivariant vector bundle descends locally freely precisely when every geometric stabilizer acts trivially on its fibre. For Γ\X, distinguish the ineffective arithmetic centre Γ∩Z(G)(Q) from finite orbifold stabilizers; divide by the former only for coefficients on which it acts trivially. Neatness removes torsion, not non-torsion central units.

Proof/construction:

1. Import the tame coarse-quotient descent criterion from R09.5; the application to infinite arithmetic ineffective kernels is a separately recorded interface gap.
2. Compute the action of the ineffective kernel on each fibre before taking the effective quotient.
3. A nontrivial stabilizer character gives a stack coefficient but not the asserted coarse vector bundle.

Inputs: `AutomorphicBundles:B0/central-split-quotient`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

Acceptance: For a Hilbert datum a neat arithmetic subgroup can still contain infinitely many central units; no implication neat⇒trivial coefficient centre is used.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §8, pp.63–64 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### Hodge and opposite parabolic conventions

`AutomorphicBundles:B0/hodge-parabolic-convention` — comparison. Proposed name: `AutomorphicBundles.hodgeParabolicConvention`.

Fix μ_h(z)=h_C(z,1), acting by z^(−p) on H^{p,q}, and F^a=⊕_{p≥a}H^{p,q}. Its filtration stabilizer is P_H=P(μ_h⁻¹) in the dynamic-parabolic convention, with Levi M=Z_G(μ_h). The Hodge–Tate flag convention uses the opposite P_HT=P(μ_h). Right cosets G/P_H and left cosets P_H\G are compared by inversion; their associated-bundle conventions must transform ρ to the corresponding inverse/dual convention, not replace P_H by P_HT under the same name.

Proof/construction:

1. Import the exact filtration-parabolic and compact-dual nodes of ShimuraData D3.
2. Calculate the limit condition on each block of a filtered representation to identify P_H and its opposite.
3. Apply inversion to the principal right-coset description; compare fibre relations before translating highest weights.

Inputs: `ShimuraData:D3/filtration-parabolic`, `ShimuraData:D3/compact-dual`.

Acceptance: For GL2 homology type (−1,0),(0,−1), the stabilizer preserves F⁰, whereas the opposite stabilizes the complementary line.

Sources: [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §2.3, pp.669–671 — The tensor-frame/filtration construction in the version of record.; [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), §3.2.13–3.2.19, pp.44–45 — Fixes coefficient/dual/twist conventions for the added source; higher cohomology is outside this part..

### Equivariant coefficients on the compact dual

`AutomorphicBundles:B0/compact-dual-coefficient` — construction. Proposed name: `AutomorphicBundles.compactDualCoefficient`.

Over a characteristic-zero coefficient field L containing the reflex field and a field of definition of the representation, on the compact-dual form X̌_L construct the Gᶜ-equivariant bundle attached to an algebraic representation ρ of the Hodge parabolic Pᶜ. After a splitting extension it is Gᶜ_L×^{Pᶜ}V with (g,v)~(gp,ρ(p)⁻¹v). A Levi representation is inflated along Pᶜ→Mᶜ; P representations with nontrivial unipotent action are not silently declared Levi representations.

Proof/construction:

1. Import the compact-dual descent from ShimuraData D3.
2. Apply the missing generic algebraic associated-bundle interface to the principal Pᶜ torsor Gᶜ→X̌.
3. Descend the equivariant coefficient over its actual field of definition by R09.3, retaining the P action.

Inputs: `AutomorphicBundles:B0/central-split-quotient`, `AutomorphicBundles:B0/hodge-parabolic-convention`, `ShimuraData:D3/reflex-flag-descent`, `AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent`.

Planning API:

- `AutomorphicBundles.compactDualCoefficient_fibre` (projection): At the base flag the P-equivariant fibre is V with action ρ.
- `AutomorphicBundles.compactDualCoefficient_inflate` (compatibility): The coefficient for an M representation equals that for its inflation to P.
- `AutomorphicBundles.compactDualCoefficient_tensor` (functoriality): Associated coefficients preserve tensor products, duals and the tensor unit.

Uses:

- Milne III §5: Input J for automorphic bundle descent.
- BCGP §3.2.19: Compares the tautological filtered standard representation with its two graded coefficients.

Unit tests:

- `AutomorphicBundles.compactDualCoefficient_test_unit` (degenerate): The trivial one-dimensional representation yields O_X̌.
- `AutomorphicBundles.compactDualCoefficient_test_gl2` (compatibility): For GL2, the character on the Hodge line gives the tautological line or its dual according to the explicitly selected cohomology convention.
- `AutomorphicBundles.compactDualCoefficient_test_unipotent` (non-example): The standard P representation with a nontrivial upper-triangular unipotent action is not isomorphic as P-module to its associated graded inflation.

Acceptance: Evaluation at the base flag recovers the given P representation.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §2, pp.53–55 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### The analytic filtration torsor

`AutomorphicBundles:B0/homogeneous-hodge-torsor` — construction. Proposed name: `AutomorphicBundles.homogeneousHodgeTorsor`.

Pull the complex principal Pᶜ torsor Gᶜ_C→X̌_C back along the Borel embedding X→X̌(C). Its sections are frames identifying the varying Hodge filtration with the reference filtration. The quotient by U(Pᶜ) is the Levi torsor of graded frames; no flat connection on this Levi torsor is asserted.

Proof/construction:

1. Import the holomorphic Borel embedding and homogeneous variation from D3.
2. Use pullback of the existing principal P torsor, supplied by the associated-bundle gap.
3. Pass to the U quotient; identify graded frames rather than full filtered frames.

Inputs: `AutomorphicBundles:B0/compact-dual-coefficient`, `ShimuraData:D3/borel-embedding`, `ShimuraData:D3/homogeneous-variation`.

Planning API:

- `AutomorphicBundles.homogeneousHodgeTorsor_filtered_frames` (characterisation): A point is a tensor-compatible frame identifying the reference and varying filtrations.
- `AutomorphicBundles.homogeneousHodgeTorsor_graded` (projection): The U quotient parametrizes individual frames of the graded pieces.
- `AutomorphicBundles.homogeneousHodgeTorsor_pullback_coefficient` (compatibility): Associating a P coefficient to this torsor is the Borel pullback of its compact-dual bundle.

Uses:

- Caraiani–Scholze Lemmas 2.3.4–2.3.5: Defines the graded de Rham torsor and its coefficient functor.

Unit tests:

- `AutomorphicBundles.homogeneousHodgeTorsor_test_point` (computation): At the reference point the torsor has its reference frame.
- `AutomorphicBundles.homogeneousHodgeTorsor_test_standard` (compatibility): For the symplectic standard representation the associated filtration is the Hodge exact sequence.
- `AutomorphicBundles.homogeneousHodgeTorsor_test_graded` (non-example): Two filtered frames differing by a nonidentity unipotent element have the same graded frame, but remain distinct filtered frames.

Acceptance: In a Siegel example the Levi frame torsor is the frame torsor of the Hodge bundle together with the similitude line.

Sources: [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §2.3, p.670 — The tensor-frame/filtration construction in the version of record..

### Analytic arithmetic-quotient coefficients

`AutomorphicBundles:B0/analytic-coefficient` — construction. Proposed name: `AutomorphicBundles.analyticCoefficient`.

For a torsion-free effective arithmetic action Γ_eff on X, and a homogeneous coefficient on which the ineffective kernel of Γ acts trivially, descend the Borel-pullback coefficient to Γ_eff\X. On an adelic component the description is Γ\(G(R)×V)/K_∞ with (g,v)·k=(gk,ρ(k)⁻¹v), equipped with the holomorphic structure supplied by the compact-dual coefficient.

Proof/construction:

1. Use ineffectiveFibreDescent to pass to Γ_eff before asserting local freeness.
2. Use homogeneousHodgeTorsor for the holomorphic structure; a smooth homogeneous quotient alone does not provide it.
3. Apply analytic local triviality and quotient gluing, whose generic torsor interface remains a gap.

Inputs: `AutomorphicBundles:B0/ineffective-fibre-descent`, `AutomorphicBundles:B0/homogeneous-hodge-torsor`.

Planning API:

- `AutomorphicBundles.analyticCoefficient_local_trivial` (structure): A small quotient chart identifies the coefficient with its holomorphic product bundle.
- `AutomorphicBundles.analyticCoefficient_section_equiv` (equivalence): Sections correspond to equivariant functions under the diagonal fibre relation.
- `AutomorphicBundles.analyticCoefficient_change_frame` (compatibility): Changing the frame conjugates the transition cocycle and preserves the descended bundle.

Uses:

- Harris 4fibres: Connects geometric sections to functions on an adelic quotient.
- B4 analytic comparison: Supplies the holomorphic bundle behind transformation laws.

Unit tests:

- `AutomorphicBundles.analyticCoefficient_test_trivial` (degenerate): The trivial representation gives the holomorphic structure sheaf on Γ_eff\X.
- `AutomorphicBundles.analyticCoefficient_test_odd` (non-example): The −1 stabilizer acts by −1 on an odd-weight GL2 coefficient, so that coefficient does not descend to the coarse quotient unless that stabilizer is removed.
- `AutomorphicBundles.analyticCoefficient_test_rank` (characterisation): The local rank equals dim V, independent of the arithmetic component.

Acceptance: Recover f(γgk)=ρ(k)⁻¹f(g) on a homogeneous frame.

Sources: [Vector bundles (Cours 2013, 4fibres)](https://webusers.imj-prg.fr/~michael.harris/Cours_2013/4fibres.pdf), Entire note, pp.1–2 — The right quotient relation and equivariant section convention, with holomorphy treated separately..

### Sections as equivariant functions

`AutomorphicBundles:B0/sections-equivariant` — comparison. Proposed name: `AutomorphicBundles.sectionsEquivariant`.

For a principal right P torsor T→S and the associated coefficient with (t,v)~(tp,ρ(p)⁻¹v), a section is equivalent to a function f:T→V with f(tp)=ρ(p)⁻¹f(t), in the algebraic or analytic category of that torsor. With a left arithmetic action the corresponding frame factor satisfies J(gh,x)=J(g,hx)J(h,x).

Proof/construction:

1. Apply the supplier’s associated-bundle descent equivalence.
2. Evaluate a section in a torsor frame; equality of representatives forces the inverse in the right equivariance formula.
3. Compose two left frame changes and retain the shifted base point.

Inputs: `AutomorphicBundles:B0/compact-dual-coefficient`, `AutomorphicBundles:B0/analytic-coefficient`.

Acceptance: Noncommuting fibre maps distinguish this relation from the wrong product order.

Sources: [Vector bundles (Cours 2013, 4fibres)](https://webusers.imj-prg.fr/~michael.harris/Cours_2013/4fibres.pdf), p.2, transformation law — Equivariant sections of the diagonal quotient; the left cocycle follows by composing frames..

### Descent over the coefficient field

`AutomorphicBundles:B0/coefficient-galois-descent` — construction. Proposed name: `AutomorphicBundles.coefficientGaloisDescent`.

For a finite Galois extension L/E, a coefficient on the compact-dual form and its semilinear isomorphisms d_σ:σ*J→J satisfying d_στ=d_σ∘σ*d_τ descend the coefficient to E. The same applies to the compatible associated coefficient on the canonical torsor. If only the highest weight is given, first compute its Galois stabilizer; do not assume a splitting-field representation is defined over the reflex field.

Proof/construction:

1. Use fpqc quasi-coherent descent at R09.3 on the finite Galois cover.
2. Use finite locally free descent (requested separately at that stage) to preserve rank and duals.
3. Descend the equivariant structure and compare association after scalar extension.

Inputs: `AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent`, `AutomorphicBundles:B0/compact-dual-coefficient`.

Planning API:

- `AutomorphicBundles.coefficientGaloisDescent_base_change` (compatibility): The descended coefficient tensored with L is the original J with its given descent maps.
- `AutomorphicBundles.coefficientGaloisDescent_unique` (extensionality): Morphisms over E are exactly L-morphisms compatible with all d_σ.
- `AutomorphicBundles.coefficientGaloisDescent_associate` (functoriality): Descent commutes with association to a descended principal torsor.

Uses:

- Milne III Theorem 5.1: Keeps reflex and coefficient fields distinct.
- B4 unsplit Hilbert coefficients: Descends embedding-labelled weights.

Unit tests:

- `AutomorphicBundles.coefficientGaloisDescent_test_identity` (degenerate): For L=E and the identity datum descent returns J.
- `AutomorphicBundles.coefficientGaloisDescent_test_parallel` (computation): A parallel Hilbert weight has its permutation datum invariant under all embeddings, subject to the actual representation form.
- `AutomorphicBundles.coefficientGaloisDescent_test_nonparallel` (non-example): For a real quadratic F and weight (k1,k2) with k1≠k2, the nontrivial embedding permutation does not fix the label; it cannot be descended by declaring all d_σ identities.

Acceptance: A nonparallel Hilbert weight can require a coefficient field strictly larger than Q.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §5, p.58 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### Algebraic and analytic coefficient descent

`AutomorphicBundles:B0/geometric-analytic-coefficients` — comparison. Proposed name: `AutomorphicBundles.geometricAnalyticCoefficients`.

For an algebraic canonical principal bundle Π→S and its compact-dual map γ, analytification of the algebraically associated J coefficient equals the descended analytic coefficient of J. This follows by analytifying the actual descent maps. It is not an assertion that every analytic bundle on nonproper S is algebraic; GAGA is used only on a proper toroidal model.

Proof/construction:

1. Apply the missing analytification/associated-descent compatibility interface locally on Π.
2. Check that γ restricts to the Borel embedding on analytic uniformization charts.
3. Glue the local coefficient comparison; projective GAGA is unnecessary for this open-space comparison.

Inputs: `AutomorphicBundles:B0/coefficient-galois-descent`, `AutomorphicBundles:B0/analytic-coefficient`, `ComplexComparisonPartII:C0`.

Acceptance: The comparison transports the same frame factor, not merely an isomorphic unfiltered smooth bundle.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §3, pp.55–56 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

## B1. Hodge and abelian-type canonical principal bundles

Coverage: **planned**. The following targets are specified; the stage remains open at its supplier/proof and typed-carrier refinements.

### Reductive groups as tensor stabilizers

`AutomorphicBundles:B1/finite-tensor-stabilizer` — theorem. Proposed name: `AutomorphicBundles.finiteTensorStabilizer`.

Over a characteristic-zero field k, let G↪GL(V) be a faithful finite-dimensional algebraic representation of a reductive algebraic group. There is a finite family of tensors in finite direct sums of V^{⊗m}⊗(V∨)^{⊗n} whose simultaneous scheme-theoretic stabilizer in GL(V) is G. Tensor spaces, duals and scalar action are part of the statement; preserving a line instead of its tensor generator is insufficient.

Proof/construction:

1. Deligne Proposition 3.1(a,b) places a stabilizer line in mixed tensor constructions; generic Chevalley/semisimplicity are the recorded group-interface gap.
2. Reductivity supplies an invariant complement, so the projector tensor fixes the line and complement and has stabilizer G (3.1(c)).
3. Noetherianity of the defining ideal reduces the family to finitely many tensors and identifies the scheme-theoretic stabilizer in characteristic zero.

Inputs: the exact algebraic hypotheses in the statement; the named foundational gap where specified in its proof.

Acceptance: For GSp(V,ψ) include the similitude/Tate line; requiring ψ to be fixed in V∨⊗V∨ alone cuts out Sp, not GSp.

Sources: [Hodge cycles on abelian varieties](https://jmilne.org/math/Documents/Deligne82.pdf), §3 Proposition 3.1(a–c), pp.22–23 — The fixed-tensor criterion; finiteness is its noetherian consequence.; [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §2.3, p.667 — The tensor-frame/filtration construction in the version of record..

### Absolute Hodge tensors in abelian families

`AutomorphicBundles:B1/absolute-hodge-propagation` — theorem. Proposed name: `AutomorphicBundles.absoluteHodgePropagation`.

For an abelian variety over an algebraically closed characteristic-zero field admitting an embedding into C, every rational Hodge tensor formed from H¹, its dual and Tate twists is absolute Hodge. In a connected smooth proper abelian family, a horizontal tensor remaining of type (0,0) and absolute at one fibre is absolute at every fibre. The theorem does not assert such tensors are algebraic cycles, nor does it apply to arbitrary general-data motives.

Proof/construction:

1. Deligne Main Theorem 2.11 reduces by the CM-family construction (Proposition 6.1) and Principle B (2.12/2.15).
2. Principle B uses the degree-one relative Betti–de Rham/étale comparisons from A4 and horizontal rational local sections.
3. The CM absolute-cycle argument, Principle A, Weil classes and its group-theoretic reduction remain the explicit absolute-Hodge foundation gap; no completion of that chain is claimed.

Inputs: `AbelianSchemesAndArithmeticModuli:A4`.

Acceptance: Algebraic endomorphisms and polarization tensors of a CM elliptic curve satisfy the statement; no integral Hodge conjecture is used.

Sources: [Hodge cycles on abelian varieties](https://jmilne.org/math/Documents/Deligne82.pdf), Main Theorem 2.11, pp.19–21; Proposition 6.1, pp.41–42 — States the endpoint and family propagation; the intermediate CM proof is an open foundation.; [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §2.3 Lemma 2.3.2, pp.668–669 — The tensor-frame/filtration construction in the version of record..

### Descended Hodge-tensor realizations

`AutomorphicBundles:B1/hodge-tensor-realizations` — construction. Proposed name: `AutomorphicBundles.hodgeTensorRealizations`.

For a Hodge-type datum, a chosen symplectic embedding, and sufficiently small level with universal abelian scheme A/S over its canonical reflex field E, construct the Betti, étale and de Rham realizations of a finite defining family of rational Hodge tensors in H=H₁(A)=(R¹π_* )∨, including Tate twists. De Rham tensors are horizontal, in the required filtration, and defined over E; their descent uses Galois invariance from the level tower and absolute-Hodge compatibility, not merely their being of type (0,0) over C.

Proof/construction:

1. Import the universal family and complex uniformization from M3/V5 and degree-one comparisons from A4.
2. Use finiteTensorStabilizer and absoluteHodgePropagation to transport the defining family into each realization.
3. Follow CS Lemma 2.3.2 and AG §3.5: establish the tower’s Galois invariance, then descend the tensor sections and their filtration conditions over E.

Inputs: `AutomorphicBundles:B1/finite-tensor-stabilizer`, `AutomorphicBundles:B1/absolute-hodge-propagation`, `AbelianSchemesAndArithmeticModuli:A4`, `PELModuli:M3`, `ShimuraVarieties:V5`.

Planning API:

- `AutomorphicBundles.hodgeTensorRealizations_horizontal` (structure): The de Rham defining tensors satisfy ∇sα,dR=0.
- `AutomorphicBundles.hodgeTensorRealizations_compare` (compatibility): The Betti–de Rham and Betti–étale comparisons send each sα to its named realization, with the same Tate normalization.
- `AutomorphicBundles.hodgeTensorRealizations_galois` (functoriality): After base change to Ebar the named tensor sections are fixed by Gal(Ebar/E), hence descend to E.

Uses:

- AG Proposition 3.5.1: Defines the tensor-preserving de Rham frame torsor.
- CS Lemma 2.3.2: Ensures the tensor frames are defined over the reflex field.

Unit tests:

- `AutomorphicBundles.hodgeTensorRealizations_test_endomorphism` (compatibility): An algebraic endomorphism of A acts compatibly in all three degree-one realizations.
- `AutomorphicBundles.hodgeTensorRealizations_test_polarization` (characterisation): The polarization tensor is valued in the specified Tate line; ignoring that line changes GSp to Sp.
- `AutomorphicBundles.hodgeTensorRealizations_test_zero` (degenerate): Adding a zero tensor does not change the simultaneous stabilizer or the descended frame torsor.

Acceptance: For the standard symplectic coefficient the same tensors recover the polarization, endomorphisms and Tate line.

Sources: [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Lemmas 2.3.1–2.3.2, pp.668–669 — The tensor-frame/filtration construction in the version of record.; [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.3; §3.5, pp.418–422 — Representation-valued realization and absolute-Hodge descent in the version of record..

### The tensor-preserving de Rham frame torsor

`AutomorphicBundles:B1/tensor-frame-torsor` — construction. Proposed name: `AutomorphicBundles.tensorFrameTorsor`.

For the Hodge-type H and defining tensors above, the functor T(U)={η:V⊗O_U≃H_dR|U : η(sα)=sα,dR} is represented by a principal G_E torsor on S. The right action is η·g=η∘g. Comparison supplies local nonemptiness; being a closed tensor-preserving subfunctor of Isom alone does not prove it is a torsor. When required, push out to the coefficient group Gᶜ.

Proof/construction:

1. Use finiteTensorStabilizer to identify the frame automorphism group.
2. Use hodgeTensorRealizations and the relative comparison to establish fpqc-local existence of a tensor-compatible frame; representability/local freeness uses the recorded generic frame interface.
3. Check the right composition action is simply transitive and descend the frame scheme.

Inputs: `AutomorphicBundles:B1/finite-tensor-stabilizer`, `AutomorphicBundles:B1/hodge-tensor-realizations`, `AutomorphicBundles:B0/central-split-quotient`.

Planning API:

- `AutomorphicBundles.tensorFrameTorsor_frame` (projection): A T point is an invertible frame of H carrying every reference tensor to its de Rham realization.
- `AutomorphicBundles.tensorFrameTorsor_right_action` (structure): η·g=η∘g, and T×G→T×_S T is an isomorphism.
- `AutomorphicBundles.tensorFrameTorsor_coefficient` (compatibility): T×^G V identifies with H_dR for the chosen faithful coefficient.

Uses:

- AG §3.5: Constructs dR realizations of every representation.
- CS §2.3: Supplies the principal torsor from which the filtered and Levi torsors are obtained.

Unit tests:

- `AutomorphicBundles.tensorFrameTorsor_test_identity` (computation): For a constant tensor-equipped bundle V⊗O_S, identity is a global frame and T≃G×S.
- `AutomorphicBundles.tensorFrameTorsor_test_sp` (non-example): For a polarization with a separately varying similitude line, the correct tensor frame group is GSp; fixing the alternating form with no Tate line incorrectly yields Sp.
- `AutomorphicBundles.tensorFrameTorsor_test_rank` (characterisation): An isomorphism frame exists only between equal-rank modules and must preserve all tensors, not just the polarization.

Acceptance: On a trivializing fpqc cover, T is G×U with its standard right action.

Sources: [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 3.5.1, pp.421–422 — The tensor-frame construction for the CM torus instance; the general G construction is supplied by the CS passage in the same node.; [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §2.3, p.670 — The tensor-frame/filtration construction in the version of record..

### The filtered frame reduction

`AutomorphicBundles:B1/filtration-reduction` — construction. Proposed name: `AutomorphicBundles.filtrationReduction`.

The Hodge filtration on the tensor-equipped dR realization determines a Gᶜ-equivariant algebraic map γ:Tᶜ→X̌_E. Over an extension L/E where a reference parabolic P_H is defined, γ⁻¹(reference flag) is a principal P_H torsor. Its pushout along P_H→M is the torsor of graded frames. Over E, retain the descended flag variety rather than inventing an E-rational cocharacter.

Proof/construction:

1. Use tensorFrameTorsor and the filtered relative comparison to identify the filtration type locally.
2. Use D3 reflex-flag-descent to construct γ on the E-form of the compact dual.
3. Over a field with a reference flag form the fibre and Levi quotient, then compare back with homogeneousHodgeTorsor analytically.

Inputs: `AutomorphicBundles:B1/tensor-frame-torsor`, `AutomorphicBundles:B0/homogeneous-hodge-torsor`, `ShimuraData:D3/reflex-flag-descent`.

Planning API:

- `AutomorphicBundles.filtrationReduction_flag_map` (projection): γ(ηg)=g⁻¹γ(η) in the chosen right-torsor convention.
- `AutomorphicBundles.filtrationReduction_parabolic_fibre` (characterisation): After choosing the reference flag over L, its inverse image is exactly the tensor-preserving filtered frames.
- `AutomorphicBundles.filtrationReduction_levi` (compatibility): Quotienting the filtered-frame torsor by U identifies frames of gr_F H individually.

Uses:

- CS Lemmas 2.3.4–2.3.5: Turns the canonical dR torsor into the automorphic coefficient functor.

Unit tests:

- `AutomorphicBundles.filtrationReduction_test_siegel` (compatibility): For the standard Siegel family γ records the Hodge subbundle, with its actual Lagrangian condition.
- `AutomorphicBundles.filtrationReduction_test_zero` (degenerate): For a rank-zero coefficient the induced filtration is zero, even though the principal datum remains the same.
- `AutomorphicBundles.filtrationReduction_test_no_point` (non-example): The construction does not select an E-point of X̌_E when that form has none.

Acceptance: A reflex flag variety without E-points still receives γ; no global reference frame is asserted.

Sources: [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §2.3, pp.669–671 — The tensor-frame/filtration construction in the version of record..

### Canonical principal bundles of Hodge type

`AutomorphicBundles:B1/hodge-canonical-principal-bundle` — theorem. Proposed name: `AutomorphicBundles.hodgeCanonicalPrincipalBundle`.

For a Hodge-type Shimura datum and a sufficiently small effective level, Tᶜ with γ, its flat Gᶜ connection and its Hecke-tower action is the canonical standard principal bundle over E. Its analytification agrees with the homogeneous standard bundle, and its CM restriction satisfies the reciprocity normalization. The result is on characteristic-zero canonical models; it does not produce arbitrary-prime integral models.

Proof/construction:

1. Identify the analytic torsor and γ through the actual family uniformization and relative comparison.
2. Use the CM restriction/reciprocity supplier V4 to characterize its E-structure, and the hodge tensors for its algebraic construction.
3. Check the tower action and connection arise from the same tensor-preserving realization; generic connection descent is an explicit interface gap.

Inputs: `AutomorphicBundles:B1/tensor-frame-torsor`, `AutomorphicBundles:B1/filtration-reduction`, `ShimuraVarieties:V4`.

Acceptance: In the Siegel case the associated standard homology coefficient is the dual relative H¹dR with Gauss–Manin connection.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §3; Theorems 4.3–4.5, pp.55–57 — States the canonical-model or associated-coefficient interface with the hypotheses retained below.; [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 3.5.1, pp.421–422 — Representation-valued realization and absolute-Hodge descent in the version of record..

### Independence of symplectic embedding

`AutomorphicBundles:B1/embedding-independence` — theorem. Proposed name: `AutomorphicBundles.embeddingIndependence`.

Two faithful symplectic embeddings of the same Hodge-type datum give canonically isomorphic Gᶜ torsors, compact-dual maps and associated realizations over E, compatibly with composition. The canonical identification is induced by tensor constructions/projectors or by a common direct-sum embedding; it preserves tensors and filtration, not merely underlying ranks.

Proof/construction:

1. Place both representations inside mixed tensor constructions using finiteTensorStabilizer and the generic tensor-representation gap.
2. Transport the defining idempotents by absolute Hodge comparison; CS Remark 2.3.3 ensures they commute with dR descent and filtrations.
3. Compare the two tensor frame functors via these projectors, or via the common embedding; check the canonical maps on a trivializing cover.

Inputs: `AutomorphicBundles:B1/hodge-canonical-principal-bundle`, `AutomorphicBundles:B1/hodge-tensor-realizations`, `AutomorphicBundles:B1/finite-tensor-stabilizer`.

Acceptance: Adding a second faithful representation gives the same principal torsor, with the expected second associated module.

Sources: [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Remark 2.3.3; Lemma 2.3.4, pp.669–670 — The tensor-frame/filtration construction in the version of record.; [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 3.5.1, pp.421–422 — Representation-valued realization and absolute-Hodge descent in the version of record..

### The special-point normalization

`AutomorphicBundles:B1/cm-principal-normalization` — comparison. Proposed name: `AutomorphicBundles.cmPrincipalNormalization`.

On a CM subdatum (T,{h}) the canonical principal bundle and its Gᶜ pushout agree with the tensor/period torsor specified by the CM reciprocity law. For σ∈Aut(C), the conjugation isomorphism is normalized by that period torsor and the same Artin reciprocity convention as V4. This is an isomorphism of torsors, not a choice of a canonical rational frame or canonical complex period.

Proof/construction:

1. Import the CM reciprocity and reflex norm from V4.
2. Restrict the analytic standard principal bundle to the CM zero-dimensional datum and identify its tensor fibre.
3. Compare the rational and conjugate structures through the period torsor; generic period/Taniyama torsor descent is recorded as a missing supplier interface.

Inputs: `AutomorphicBundles:B1/hodge-canonical-principal-bundle`, `ShimuraVarieties:V4`.

Acceptance: Changing an Artin convention must invert the reciprocity map in both the variety and the fibre normalization.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III Theorems 4.1 and 4.5, pp.56–57 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### Canonical principal bundles of abelian type

`AutomorphicBundles:B1/abelian-canonical-principal-bundle` — theorem. Proposed name: `AutomorphicBundles.abelianCanonicalPrincipalBundle`.

The canonical principal bundle construction extends from Hodge-type to abelian-type data by connected components, central isogenies and finite quotients with trivial fibre-kernel action, then induction to the full Shimura tower. It is independent of the chosen Hodge-type cover and agrees with the CM normalization. The centre of the coefficient group and the actual arithmetic kernel remain visible.

Proof/construction:

1. Use the Hodge-type construction, embeddingIndependence and cmPrincipalNormalization.
2. Apply the central-isogeny/connected-quotient interfaces from V6, checking the coefficient-kernel action by ineffectiveFibreDescent.
3. Induce compatible connected torsors to the full tower and descend over E; their finite locally free association follows from B0.

Inputs: `AutomorphicBundles:B1/hodge-canonical-principal-bundle`, `AutomorphicBundles:B1/embedding-independence`, `AutomorphicBundles:B1/cm-principal-normalization`, `AutomorphicBundles:B0/ineffective-fibre-descent`, `ShimuraVarieties:V6`.

Acceptance: A connected abelian-type cover with a finite central kernel does not descend a coefficient on which that kernel acts nontrivially.

Sources: [Automorphic vector bundles on connected Shimura varieties](https://jmilne.org/math/articles/1988aT.pdf), §7, Propositions 7.1–7.4, pp.29–31 — The product, embedding and isogeny reductions with special-point normalization.; [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §4, pp.56–58 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### Hecke pullback of the canonical torsor

`AutomorphicBundles:B1/principal-hecke-pullback` — comparison. Proposed name: `AutomorphicBundles.principalHeckePullback`.

At finite levels K′⊂K and along a Hecke translation a, the canonical principal bundles identify under the actual finite étale tower maps, preserving γ, the flat connection and CM normalization. Associated coefficients carry induced pullback isomorphisms with identity/composition laws. This is not the pull–trace action on cohomology owned by B5.

Proof/construction:

1. Use the tower maps and algebraic uniformization supplied by V3/V5/V6.
2. Define the isomorphism on the standard analytic bundle and identify its canonical E-structure by the CM condition.
3. Check composition on a common smaller level, so the coefficient action is coherent.

Inputs: `AutomorphicBundles:B1/abelian-canonical-principal-bundle`, `ShimuraVarieties:V3`.

Acceptance: A pair of Hecke pullbacks composes to their product after passing to a level where both are defined.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III Theorem 4.5(a–b), p.57 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

## B1.general. General principal bundles and conjugation

Coverage: **planned**. The following targets are specified; the stage remains open at its supplier/proof and typed-carrier refinements.

### Conjugation of connected principal bundles

`AutomorphicBundles:B1.general/connected-principal-conjugation` — theorem. Proposed name: `AutomorphicBundles.connectedPrincipalConjugation`.

For a connected Shimura datum (G,X) with G semisimple simply connected, σ∈Aut(C) and a special point x, construct the σ-conjugate connected standard principal bundle with an algebraic normalized isomorphism compatible with its flat connection, compact-dual map, connected Hecke group and the period torsor at x. Under the V7 identification of conjugate data, the isomorphism is independent of auxiliary choices.

Proof/construction:

1. Use V7 for the actual conjugate connected variety and its normalized special-point map.
2. For abelian-type subdata use abelianCanonicalPrincipalBundle.
3. Complete the general principal-bundle step by adjoint jets and the rank-one reduction below, not by assuming a universal abelian family.

Inputs: `AutomorphicBundles:B1/abelian-canonical-principal-bundle`, `ShimuraVarieties:V7`, `AutomorphicBundles:B1.general/general-connected-reduction`.

Acceptance: The normalized isomorphism is unique with all the stated equivariance/connection conditions.

Sources: [Automorphic vector bundles on connected Shimura varieties](https://jmilne.org/math/articles/1988aT.pdf), Theorem 3.10 and Corollary 3.11, pp.18–20 — The connected bundle conjugation target, whose general proof is decomposed in §9..

### The adjoint bundle and second jets

`AutomorphicBundles:B1.general/adjoint-jet-realization` — theorem. Proposed name: `AutomorphicBundles.adjointJetRealization`.

In the connected semisimple simply connected setting, the adjoint compact-dual coefficient embeds equivariantly into the second-jet bundle of the compact-dual tangent bundle. The induced algebraic automorphic jet comparison controls the adjoint representation and reduces continuity/normalization of principal conjugation to algebraic geometric data. This uses the corrected jet argument, not Harris’s withdrawn 1984 §3.5 proof.

Proof/construction:

1. Import generic second jets and natural group actions through the recorded missing jet interface.
2. Use the homogeneous infinitesimal action on the compact dual and its order-two isotropy separation; the precise faithful jet injection in Milne Lemma 9.4 is the recorded proof-refinement leaf.
3. Transport jets along the V7 algebraic conjugation map and identify the adjoint coefficient.

Inputs: `ShimuraData:D3/compact-dual`, `ShimuraVarieties:V7`.

Acceptance: First-order tangent data alone are not asserted to give this injection.

Sources: [Automorphic vector bundles on connected Shimura varieties](https://jmilne.org/math/articles/1988aT.pdf), §9 Lemmas 9.3–9.4, pp.33–34 — The second-jet route to the adjoint case, citing the corrected Harris 1985 construction..

### The general connected bundle reduction

`AutomorphicBundles:B1.general/general-connected-reduction` — theorem. Proposed name: `AutomorphicBundles.generalConnectedReduction`.

In Milne’s connected principal-bundle conjugation problem, control of the adjoint coefficient and of all the required type-A1 subdata implies control of the standard principal bundle. The A1 subgroups generate the semisimple simply connected group after the auxiliary totally real extension prescribed by V7. The compact-dual map and connection are preserved, and uniqueness yields independence of the selected special point.

Proof/construction:

1. Use adjointJetRealization for the adjoint comparison and abelianCanonicalPrincipalBundle for type-A1 data.
2. Import from V7 the auxiliary-field construction and generating A1 family; identify the needed Lie-algebra/root-space bracket generation as an explicit supplier request.
3. Use Milne §9: adjoint triviality plus the normalized torus/A1 restrictions kills the remaining principal automorphism; establish continuity using Lemma 9.3.

Inputs: `AutomorphicBundles:B1.general/adjoint-jet-realization`, `AutomorphicBundles:B1/abelian-canonical-principal-bundle`, `ShimuraVarieties:V7`.

Acceptance: The proof never invokes a non-abelian-type family of motives.

Sources: [Automorphic vector bundles on connected Shimura varieties](https://jmilne.org/math/articles/1988aT.pdf), §9 Lemmas 9.1–9.5, pp.33–34 — The second completion, with type-A1 generation imported from the general-data owner..

### General canonical principal models

`AutomorphicBundles:B1.general/general-principal-model` — theorem. Proposed name: `AutomorphicBundles.generalPrincipalModel`.

For a general pure Shimura datum satisfying Milne II (2.1), the standard Gᶜ principal bundle on the neat effective canonical tower has a canonical algebraic model over its reflex field E. Its analytification is the homogeneous standard bundle, with the canonical flat connection. Continuous effective Weil descent is proved before inferring a model from the conjugation cocycle.

Proof/construction:

1. Apply generalConnectedReduction to obtain connected normalized bundle conjugation.
2. Combine the connected bundles with central-torus CM theory and full-tower induction from V7/V8.general.
3. Verify the cocycle and continuity, then use effective descent on the principal scheme and its structure maps; the generic torsor-descent/effectivity interface is an explicit gap.

Inputs: `AutomorphicBundles:B1.general/general-connected-reduction`, `AutomorphicBundles:B0/central-split-quotient`, `ShimuraVarieties:V7`, `ShimuraVarieties:V8.general`.

Acceptance: General models are characteristic-zero models over number fields; no integral or motivic upgrade follows.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III Theorem 4.3 and Remarks 4.4, p.57 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### The rational compact-dual map

`AutomorphicBundles:B1.general/general-compact-dual-map` — theorem. Proposed name: `AutomorphicBundles.generalCompactDualMap`.

For the general standard principal model Π_E, its complex compact-dual map γ descends as a Gᶜ-equivariant algebraic map Π_E→X̌_E over the reflex field. The target is the descended parabolic-type variety and need not have an E-point. The selected μ and P may require a larger field.

Proof/construction:

1. Use generalPrincipalModel and the normalized conjugation comparisons.
2. Use D3 reflex-flag-descent for the correct target form.
3. Check γ commutes with the descent isomorphisms at special points and hence globally by the source’s uniqueness argument.

Inputs: `AutomorphicBundles:B1.general/general-principal-model`, `ShimuraData:D3/reflex-flag-descent`.

Acceptance: The construction descends the conjugacy class of flags, not a chosen E-rational filtration.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III Theorem 4.6, p.58 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### Normalized conjugation and its cocycle

`AutomorphicBundles:B1.general/general-conjugation-cocycle` — theorem. Proposed name: `AutomorphicBundles.generalConjugationCocycle`.

The general canonical principal model and γ admit normalized conjugation isomorphisms for automorphisms of C, compatible with the full Hecke action and flat connection; the two-step conjugation equals the one-step comparison through the canonically twisted datum. Their independence of the normalizing special point supplies the cocycle. The CM uniqueness characterization which also specifies rational Betti structure requires the weight in Gᶜ to be Q-defined as in Milne III (4.5c)/(6.2).

Proof/construction:

1. Use generalConnectedReduction and V7 to compare normalizations at different special points.
2. Extend by the full-tower and central-torus constructions of generalPrincipalModel.
3. Apply uniqueness to the two composites; verify continuity separately, rather than declaring every Aut(C) cocycle effective.

Inputs: `AutomorphicBundles:B1.general/general-principal-model`, `AutomorphicBundles:B1.general/general-compact-dual-map`, `AutomorphicBundles:B1.general/general-connected-reduction`, `ShimuraVarieties:V7`.

Acceptance: σ=id gives identity; successive conjugation uses the transported datum and CM period torsor, not a fixed unchanged group.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III Theorems 4.1, 4.5 and 6.2, pp.56–57,60–61 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

## B2. Automorphic coefficients and realizations

Coverage: **planned**. The following targets are specified; the stage remains open at its supplier/proof and typed-carrier refinements.

### The automorphic coefficient functor

`AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer` — construction. Proposed name: `AutomorphicBundles.automorphicVectorBundle`.

For the canonical Gᶜ torsor Π→S over E with γ:Π→X̌_E, and a Gᶜ-equivariant coefficient J on X̌ over its actual field L/E, descend γ*J along Π_L→S_L to a locally free bundle V(J). Over a field with a reference P_H, this is the associated bundle of the filtered P_H torsor. For a Levi M coefficient inflate along P_H→M. This construction includes general P coefficients without identifying them with Levi coefficients.

Proof/construction:

1. Use abelianCanonicalPrincipalBundle (or the separate B2.general supplier below for general data), γ and compactDualCoefficient.
2. Pull back J along γ; its Gᶜ-equivariance supplies fpqc descent data on Π.
3. Apply generic associated-bundle and finite locally free descent interfaces from B0; comparison on filtered frames identifies the Levi description.

Inputs: `AutomorphicBundles:B1/abelian-canonical-principal-bundle`, `AutomorphicBundles:B1/filtration-reduction`, `AutomorphicBundles:B0/compact-dual-coefficient`, `AutomorphicBundles:B0/coefficient-galois-descent`, `AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent`.

Planning API:

- `AutomorphicBundles.automorphicVectorBundle_pullback` (characterisation): Π*V(J)≃γ*J with the specified Gᶜ descent action.
- `AutomorphicBundles.automorphicVectorBundle_levi` (compatibility): For ρ:M→GL(V), V(Jρ)≃P_dR×^{P_H}V after inflation.
- `AutomorphicBundles.automorphicVectorBundle_tensor` (functoriality): V preserves tensor products, duals and the unit through canonical descent isomorphisms.
- `AutomorphicBundles.automorphicVectorBundle_scalar_extension` (compatibility): V(J)⊗_L L′≃V(J⊗_L L′) for every field extension L′/L.

Uses:

- Milne III §7: Defines rational holomorphic forms as sections.
- BCGP §4.5: Supplies the finite-dimensional algebraic coefficient underlying the classical comparison.
- AutomorphicBundles B5: Supplies coherent coefficients; trace/cohomology are separate.

Unit tests:

- `AutomorphicBundles.automorphicVectorBundle_test_unit` (degenerate): For J=O_X̌ with trivial fibre action, V(J)=O_S.
- `AutomorphicBundles.automorphicVectorBundle_test_hodge` (compatibility): In the Siegel cohomology convention, the Hodge-line/standard Levi coefficient gives e*Ω¹_A/S, not its inverse.
- `AutomorphicBundles.automorphicVectorBundle_test_nonflat` (non-example): The construction supplies no flat connection for an arbitrary M representation; a connection is obtained functorially from a full Gᶜ representation only.

Acceptance: The rank is dim ρ. The trivial coefficient is O_S; Levi and full-group coefficients remain distinct.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §5, Theorem 5.1, pp.58–59 — States the canonical-model or associated-coefficient interface with the hypotheses retained below.; [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Lemma 2.3.5, pp.670–671 — The tensor-frame/filtration construction in the version of record..

### The algebraic automorphic bundle comparison

`AutomorphicBundles:B2/automorphic-analytic-comparison` — comparison. Proposed name: `AutomorphicBundles.automorphicAnalyticComparison`.

Over an embedding L↪C, the analytification of V(J) is canonically the arithmetic quotient of the Borel pullback of J. Its sections in a homogeneous frame obey the same transformation law. The comparison preserves the filtered P coefficient and the M graded coefficient separately.

Proof/construction:

1. Apply geometricAnalyticCoefficients to the actual canonical principal model.
2. Use the uniformization comparison for γ and the filtered frame torsor.
3. Identify the associated analytic quotient by sectionsEquivariant.

Inputs: `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `AutomorphicBundles:B0/geometric-analytic-coefficients`, `AutomorphicBundles:B0/sections-equivariant`.

Acceptance: For GL2 the chosen Hodge line is the holomorphic invariant-differential coefficient.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §5, pp.58–59 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### Highest weights and coefficient conventions

`AutomorphicBundles:B2/levi-highest-weight-convention` — comparison. Proposed name: `AutomorphicBundles.leviHighestWeightConvention`.

Over a splitting field of M with a chosen Borel and torus, an M-dominant integral highest weight λ determines the irreducible algebraic coefficient. Under the left-coset convention P\G used in BCGP, compare it with the dual highest weight −w₀^Mλ used for L(λ), together with the specified central/similitude character and the Hodge/opposite-Hodge–Tate switch. Over a nonsplit field use Galois descent of the representation; the label alone does not define a rational coefficient.

Proof/construction:

1. Import highest-weight representations and duality from the reductive representation owner through the recorded supplier gap, rather than constructing them here.
2. Apply hodgeParabolicConvention and compactDualCoefficient to compute the fibre action at a reference flag.
3. Use coefficientGaloisDescent to distinguish a rational coefficient from a split highest-weight label.

Inputs: `AutomorphicBundles:B0/hodge-parabolic-convention`, `AutomorphicBundles:B0/compact-dual-coefficient`, `AutomorphicBundles:B0/coefficient-galois-descent`, `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-3-maximal-torus-weights-and-the-highest-weight-classification`.

Acceptance: BCGP’s tautological Siegel exact sequence is compared with the full standard P representation; it is not split into a flat sum by naming the two Levi weights.

Sources: [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), §3.2.13–3.2.19, pp.44–45 — Fixes coefficient/dual/twist conventions for the added source; higher cohomology is outside this part..

### Betti coefficients of a full-group representation

`AutomorphicBundles:B2/betti-coefficient-local-system` — construction. Proposed name: `AutomorphicBundles.bettiCoefficientLocalSystem`.

For a finite-dimensional rational representation W of Gᶜ and a neat effective arithmetic component Γ\X, form the Betti local system Γ\(X×W) with its arithmetic monodromy. Its associated holomorphic flat bundle is the full-group automorphic bundle. If the projected weight is Q-defined and W is pure of one weight, it has the rational variation of Hodge structure from D3; mixed-weight representations are treated weightwise.

Proof/construction:

1. Use the effective-centre criterion and the arithmetic action on W.
2. Apply the local-system construction at the generic topological owner, recorded as an interface gap at this pin.
3. Compare the complex flat bundle through homogeneous-variation and automorphicAnalyticComparison.

Inputs: `AutomorphicBundles:B0/central-split-quotient`, `AutomorphicBundles:B0/ineffective-fibre-descent`, `AutomorphicBundles:B2/automorphic-analytic-comparison`, `ShimuraData:D3/homogeneous-variation`.

Planning API:

- `AutomorphicBundles.bettiCoefficientLocalSystem_monodromy` (characterisation): On Γ\X the local monodromy is the representation of Γ on W.
- `AutomorphicBundles.bettiCoefficientLocalSystem_tensor` (functoriality): Betti coefficients preserve tensor products and duals.
- `AutomorphicBundles.bettiCoefficientLocalSystem_complex_flat` (compatibility): W_B⊗_Q O_an is the full-group coefficient with its flat connection.

Uses:

- AG §3.3: Realizes representation-valued Betti coefficients.
- BCGP §4.8.2: Input to classical local-system cohomology, whose higher comparison is outside B0.

Unit tests:

- `AutomorphicBundles.bettiCoefficientLocalSystem_test_unit` (degenerate): For W=Q with trivial action, W_B is the constant rational local system.
- `AutomorphicBundles.bettiCoefficientLocalSystem_test_standard` (compatibility): For the Siegel homology representation, W_B=H₁ of the actual universal abelian family, not R¹π_*Q without a dual.
- `AutomorphicBundles.bettiCoefficientLocalSystem_test_levi` (non-example): An arbitrary representation of M without a specified extension to Gᶜ is not an input to this construction.

Acceptance: The tensor unit is the constant Q local system; no Betti local system is assigned to a general Levi coefficient.

Sources: [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.3, p.418 — Representation-valued realization and absolute-Hodge descent in the version of record.; [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §6, pp.59–61 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### Étale coefficients from the canonical tower

`AutomorphicBundles:B2/etale-coefficient-local-system` — construction. Proposed name: `AutomorphicBundles.etaleCoefficientLocalSystem`.

For a rational Gᶜ representation W, a prime ℓ and a level with compact ℓ-component preserving a Z_ℓ lattice in W⊗Q_ℓ, descend that lattice along the actual canonical ℓ-level étale tower to a lisse Z_ℓ sheaf, and invert ℓ to obtain W_ℓ on S_E. Changing stable lattices gives canonically the same Q_ℓ sheaf. This is a construction over E with Galois action, not just a local system on S(C).

Proof/construction:

1. Use V3/V8 for the finite étale level tower and its canonical E-structure.
2. Apply the representation to the coefficient-group tower, checking the ineffective central quotient.
3. Descend the finite lattice sheaves and pass to the ℓ-adic limit; generic lisse-sheaf/tower descent is a recorded missing interface.

Inputs: `AutomorphicBundles:B0/central-split-quotient`, `AutomorphicBundles:B1/principal-hecke-pullback`, `ShimuraVarieties:V3`, `ShimuraVarieties:V8`.

Planning API:

- `AutomorphicBundles.etaleCoefficientLocalSystem_finite_level` (projection): The lattice modulo ℓⁿ is the finite étale sheaf associated to the chosen level quotient action.
- `AutomorphicBundles.etaleCoefficientLocalSystem_lattice_independence` (equivalence): After tensoring with Q_ℓ the result is independent of a stable lattice through the common rational representation.
- `AutomorphicBundles.etaleCoefficientLocalSystem_hecke` (functoriality): Level and Hecke pullbacks preserve the descended sheaf and its canonical arithmetic Galois structure.

Uses:

- AG §3.3 Proposition 3.3.1: Provides the Betti–étale comparison.
- Lan §5.3.1: Supplies the input local system; the p-adic geometricity theorem remains with the comparison owner.

Unit tests:

- `AutomorphicBundles.etaleCoefficientLocalSystem_test_unit` (degenerate): The trivial representation gives the constant Q_ℓ sheaf over E.
- `AutomorphicBundles.etaleCoefficientLocalSystem_test_abelian` (compatibility): The symplectic homology coefficient gives (R¹π_*Q_ℓ)∨ with its arithmetic action.
- `AutomorphicBundles.etaleCoefficientLocalSystem_test_arithmetic` (non-example): A local system specified only on S(C) does not by itself determine this sheaf over E or its Gal(Ebar/E) action.

Acceptance: The sheaf at a closed number-field point carries its actual arithmetic Galois representation; no de Rham-at-p theorem is inferred here.

Sources: [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.3 Proposition 3.3.1, pp.418–419 — Representation-valued realization and absolute-Hodge descent in the version of record.; [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §6, pp.59–60 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### Filtered de Rham full-group coefficients

`AutomorphicBundles:B2/filtered-de-rham-coefficient` — construction. Proposed name: `AutomorphicBundles.filteredDeRhamCoefficient`.

For an algebraic full Gᶜ representation W over a number field L containing E, the canonical principal bundle gives a locally free filtered coefficient W_dR with integrable connection ∇ and Griffiths transversality. Its filtration is induced by γ. In Hodge type it agrees with the matching tensor construction in the universal family’s relative H₁,dR; regular-singular boundary extension is a separate B3 theorem.

Proof/construction:

1. Associate W to the canonical full-group torsor; descend the flat connection by its equivariance.
2. Pull the filtration from the compact-dual type through γ.
3. Use D3 homogeneous-variation and relative A4 comparisons for transversality and the abelian realization; generic filtered-connection descent remains an interface gap.

Inputs: `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `AutomorphicBundles:B1/hodge-canonical-principal-bundle`, `ShimuraData:D3/homogeneous-variation`, `AbelianSchemesAndArithmeticModuli:A4`.

Planning API:

- `AutomorphicBundles.filteredDeRhamCoefficient_connection` (structure): ∇²=0 and the connection descends from Π.
- `AutomorphicBundles.filteredDeRhamCoefficient_filtration` (projection): F^aW_dR is the locally direct-summand filtration encoded by γ.
- `AutomorphicBundles.filteredDeRhamCoefficient_transversality` (compatibility): ∇F^a⊂F^{a−1}⊗Ω¹_S; tensors and duals carry the induced filtered connections.

Uses:

- Milne III §6: The rational dR realization in the coefficient comparison.
- B3 logarithmic extension: Only these coefficients carry the canonical extended flat connection.

Unit tests:

- `AutomorphicBundles.filteredDeRhamCoefficient_test_unit` (degenerate): The tensor unit is (O_S,d) with its weight-zero filtration.
- `AutomorphicBundles.filteredDeRhamCoefficient_test_hodge` (compatibility): For H¹dR of an abelian family F¹=e*Ω¹_A/S and the connection is Gauss–Manin.
- `AutomorphicBundles.filteredDeRhamCoefficient_test_levi` (non-example): This full-group construction does not manufacture an integrable connection on every Levi automorphic bundle.

Acceptance: The standard cohomology coefficient is H¹dR and the homology coefficient is its dual; Tate normalization is never dropped.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §6, pp.59–61 — States the canonical-model or associated-coefficient interface with the hypotheses retained below.; [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.5, pp.421–422 — Representation-valued realization and absolute-Hodge descent in the version of record..

### Betti, étale and de Rham comparison

`AutomorphicBundles:B2/realization-comparison` — comparison. Proposed name: `AutomorphicBundles.realizationComparison`.

After an embedding L↪C, for a rational Gᶜ representation W, W_B⊗Q_ℓ≃W_ℓ|S_C under the algebraic/analytic étale comparison, and W_B⊗O_an≃W_dR^an as flat holomorphic bundles. Under the Q-defined pure weight condition these respect Hodge filtrations and the rational variation. They preserve defining tensors, Tate twists, Hecke pullback and duals. No B_dR, crystalline or p-adic Hodge theorem is included.

Proof/construction:

1. Identify all three realizations on the uniformizing component or on the Hodge-type family using A4.
2. Use the canonical torsor and lattice tower definitions to glue the Betti–étale isomorphism of AG Proposition 3.3.1.
3. For the dR comparison use the same tensor frames and horizontal sections; avoid invoking proper relative GAGA on the nonproper base.

Inputs: `AutomorphicBundles:B2/betti-coefficient-local-system`, `AutomorphicBundles:B2/etale-coefficient-local-system`, `AutomorphicBundles:B2/filtered-de-rham-coefficient`, `AbelianSchemesAndArithmeticModuli:A4`.

Acceptance: The standard representation comparison is the actual degree-one family comparison, and tensor projectors agree on both sides.

Sources: [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Proposition 3.3.1; Proposition 3.5.1, pp.418–422 — Representation-valued realization and absolute-Hodge descent in the version of record.; [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §6, pp.59–61 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### Tensor and Hecke coherence of coefficients

`AutomorphicBundles:B2/coefficient-tensor-hecke` — theorem. Proposed name: `AutomorphicBundles.coefficientTensorHecke`.

The automorphic coefficient functor and the full-group realization functors preserve tensor unit, tensor products, duals and morphisms, with coherent associativity/symmetry isomorphisms; realization comparisons commute with them. Their level and Hecke pullback identifications preserve this structure. Exactness is asserted in characteristic zero for the finite-dimensional algebraic representation categories; no all-prime semisimplicity is used.

Proof/construction:

1. Use the generic associated functor’s monoidal/local trivialization interface.
2. Check duals, tensors and maps in a canonical torsor frame, then descend.
3. Apply principalHeckePullback and realizationComparison to verify every comparison square in the same frame.

Inputs: `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `AutomorphicBundles:B1/principal-hecke-pullback`, `AutomorphicBundles:B2/realization-comparison`.

Acceptance: The dual of a Hodge-line coefficient is the inverse line; retaining it as the same line would fail this theorem.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §§5–6, pp.58–61 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### The Siegel tautological coefficient sequence

`AutomorphicBundles:B2/siegel-tautological-sequence` — theorem. Proposed name: `AutomorphicBundles.siegelTautologicalSequence`.

On the split Siegel flag variety FL=P_HT\G over a characteristic-zero coefficient field E, with G=GSp_(2g) and St its standard representation, BCGP’s conventions give the G-equivariant exact sequence 0→L_(0,…,0,−1;1)→O_FL⊗St→L_(1,0,…,0;1)→0. Both end coefficients have rank g. Its algebraic analytification agrees with the same finite locally free sequence in the analytic/solid category once that comparison functor is supplied; no infinite-dimensional equivariant category is constructed here.

Proof/construction:

1. Use the universal Lagrangian subspace/quotient on the Siegel compact dual and its standard symplectic representation from the PEL/flag suppliers.
2. Compute the two Levi fibre actions in BCGP’s left-coset/opposite convention using hodgeParabolicConvention and leviHighestWeightConvention.
3. Apply exact associated descent. The extension need not split P-equivariantly; analytic/solid compatibility is a recorded external interface gap.

Inputs: `AutomorphicBundles:B0/compact-dual-coefficient`, `AutomorphicBundles:B0/hodge-parabolic-convention`, `AutomorphicBundles:B2/levi-highest-weight-convention`, `PELModuli:M0`.

Acceptance: For g=2 this is precisely L_(0,−1;1)→St→L_(1,0;1); pulling it to the Hodge–Tate tower requires its separately constructed torsor.

Sources: [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), Remark 3.2.19, p.45; Remark 4.8.1, p.101 — Fixes coefficient/dual/twist conventions for the added source; higher cohomology is outside this part..

## B2.general. General coefficient and realization comparison

Coverage: **planned**. The following targets are specified; the stage remains open at its supplier/proof and typed-carrier refinements.

### General automorphic coefficient models

`AutomorphicBundles:B2.general/general-associated-model` — theorem. Proposed name: `AutomorphicBundles.generalAssociatedModel`.

For a general Shimura datum and a Gᶜ-equivariant compact-dual coefficient J defined over L/E, descent along the general canonical principal model constructs V(J) over L. It has the same analytic quotient, tensor/dual functoriality, Hecke pullback and coefficient-field base change as the abelian-type construction; σ-conjugation transports both the datum and J.

Proof/construction:

1. Replace the abelian-type Π and γ in automorphicVectorBundle by generalPrincipalModel and generalCompactDualMap.
2. Apply precisely the same generic associated/descent interface; it is not replanned for general data.
3. Use generalConjugationCocycle and coefficientGaloisDescent to obtain the conjugate coefficient model.

Inputs: `AutomorphicBundles:B1.general/general-principal-model`, `AutomorphicBundles:B1.general/general-compact-dual-map`, `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `AutomorphicBundles:B0/coefficient-galois-descent`, `AutomorphicBundles:B1.general/general-conjugation-cocycle`.

Acceptance: This is valid for non-abelian-type data without assigning an abelian motive to J.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III Theorem 5.1, pp.58–59 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### General full-group realizations

`AutomorphicBundles:B2.general/general-flat-realizations` — theorem. Proposed name: `AutomorphicBundles.generalFlatRealizations`.

For a rational representation W of the general coefficient group Gᶜ, the canonical principal model supplies W_dR with its integrable connection and flag filtration, and the canonical coefficient tower supplies W_ℓ. The analytic full-group coefficient supplies W_B and its comparison to both. Existence of these realizations is distinct from the unproved existence of a parameterized family of motives.

Proof/construction:

1. Use generalPrincipalModel for the filtered connection and generalAssociatedModel for its underlying coefficient.
2. Use the full canonical level tower from V8.general and the étale lattice construction.
3. Repeat realizationComparison on analytic components; its generic lisse/connection comparison interfaces remain the same recorded gaps.

Inputs: `AutomorphicBundles:B2.general/general-associated-model`, `AutomorphicBundles:B1.general/general-principal-model`, `AutomorphicBundles:B2/etale-coefficient-local-system`, `AutomorphicBundles:B2/realization-comparison`, `ShimuraVarieties:V8.general`.

Acceptance: The tensor unit remains constant; a Levi coefficient is not automatically a full-group local system.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §6, pp.59–61 — States the canonical-model or associated-coefficient interface with the hypotheses retained below.; [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §5.3, pp.63–64 — Warns explicitly that general-data étale coefficients do not supply a family of motives..

### Conjugation of rational realizations

`AutomorphicBundles:B2.general/general-realization-conjugation` — comparison. Proposed name: `AutomorphicBundles.generalRealizationConjugation`.

Under Milne’s additional condition that the weight homomorphism projected to Gᶜ is Q-defined, general canonical conjugation preserves the rational Betti structure and its ℓ-adic comparison as well as the algebraic filtered dR coefficient. State the transported datum/representation and coefficient field on both sides. Without this weight condition retain the algebraic coefficient conjugation, but do not assert Theorem 6.2’s rational Betti conclusion.

Proof/construction:

1. Use generalConjugationCocycle for Π and γ.
2. Use the CM/period normalization and the Q-defined weight to identify the rational Betti fibres as in Milne III Theorem 6.2.
3. Transport tensor and lattice comparisons via generalFlatRealizations.

Inputs: `AutomorphicBundles:B2.general/general-flat-realizations`, `AutomorphicBundles:B1.general/general-conjugation-cocycle`, `AutomorphicBundles:B1/cm-principal-normalization`.

Acceptance: The dR conjugation does not alone determine a rational Betti lattice; the extra hypothesis is retained.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III Theorem 6.2, pp.60–61 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

## B3. Canonical and subcanonical extensions

Coverage: **planned**. The following targets are specified; the stage remains open at its supplier/proof and typed-carrier refinements.

### Coefficients on degeneration charts

`AutomorphicBundles:B3/boundary-coefficient-chart` — construction. Proposed name: `AutomorphicBundles.boundaryCoefficientChart`.

For a neat characteristic-zero Hodge/PEL model with a smooth admissible fan, extend the filtered and graded coefficient frames across each toroidal cusp chart using the actual semi-abelian/1-motive degeneration supplied by C4. For an integral PEL specialization retain C5’s good-base hypotheses and finite locally free representations. Identify the extended Hodge coefficient with invariant differentials of the semi-abelian family, not with logarithmic differentials on the base.

Proof/construction:

1. Import the degeneration chart, semi-abelian extension and endomorphism structures from C4/C5.
2. Extend the relevant Lie/graded modules and their tensor-compatible frames; local freeness and chart transition compatibility are requested at the geometric interface.
3. Apply the associated coefficient functor locally and compare its restriction with automorphicVectorBundle.

Inputs: `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`.

Planning API:

- `AutomorphicBundles.boundaryCoefficientChart_restrict` (compatibility): Restriction to the open family is the given filtered/graded automorphic coefficient.
- `AutomorphicBundles.boundaryCoefficientChart_hodge` (characterisation): The Hodge coefficient is e*Ω¹_G/SΣ of the supplied semi-abelian extension.
- `AutomorphicBundles.boundaryCoefficientChart_transition` (functoriality): Degeneration-chart transition maps induce tensor-compatible frame/coefficient isomorphisms.

Uses:

- HLTT Appendix B.8: Defines canonical coefficients using semi-abelian Lie frames.
- Canonical extension below: Supplies local frames and their transition maps.

Unit tests:

- `AutomorphicBundles.boundaryCoefficientChart_test_tate` (compatibility): The dimension-one Hodge frame at a multiplicative fibre is generated by du/u.
- `AutomorphicBundles.boundaryCoefficientChart_test_unit` (degenerate): The trivial coefficient extends to O of each cusp chart.
- `AutomorphicBundles.boundaryCoefficientChart_test_base` (non-example): The base logarithmic differential dq/q is not identified with the relative invariant differential du/u.

Acceptance: At a Tate elliptic cusp the Hodge differential is du/u on the multiplicative fibre, not dq/q on the base.

Sources: [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Appendix B.8, pp.270–271 — The finite locally free coefficient and its semi-abelian boundary model.; [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, pp.49–50 — Separates toroidal vector coefficients from scalar minimal-compactification forms..

### The canonical automorphic extension

`AutomorphicBundles:B3/canonical-and-subcanonical-extensions` — construction. Proposed name: `AutomorphicBundles.canonicalExtension`.

For a neat effective characteristic-zero Shimura model S of Hodge/abelian type, a smooth projective admissible toroidal compactification j:S↪SΣ and an automorphic P/Levi coefficient V(J), construct the specified canonical locally free extension V(J)^can_Σ. It is the tensor-compatible cusp-chart extension characterized by its canonical boundary frames/growth model. Merely requiring j*V^can≃V does not characterize it: twists by boundary divisors share that open restriction. For good-base PEL integral coefficients use the separate C5 degeneration input.

Proof/construction:

1. Use boundaryCoefficientChart for Hodge/PEL chart coefficients; the abelian-type descent and general analytic extension argument are the recorded Harris-extension proof interface.
2. Identify overlap maps from the canonical degeneration frames, using the actual toroidal gluing supplied by C2.
3. Descend locally free chart coefficients, with the specified canonical normalization; canonicalExtensionGluing isolates the nonroutine gluing theorem.

Inputs: `AutomorphicBundles:B3/boundary-coefficient-chart`, `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `ShimuraCompactifications:C2`.

Planning API:

- `AutomorphicBundles.canonicalExtension_restrict` (compatibility): j*V(J)^can_Σ≃V(J) with the given canonical open comparison.
- `AutomorphicBundles.canonicalExtension_boundary_frame` (characterisation): On a canonical cusp chart V(J)^can is the locally free coefficient of the specified extended frame torsor.
- `AutomorphicBundles.canonicalExtension_tensor` (functoriality): The canonical extension functor preserves tensor products, duals and the unit.
- `AutomorphicBundles.canonicalExtension_unique` (extensionality): A chart-normalized extension with these transition maps has a unique isomorphism preserving its normalization.

Uses:

- Lan §4.2.7: Defines algebraic vector-valued forms on toroidal compactifications.
- Milne V §6: Supplies the exact tensor extension functor and rational descent.
- BCGP §4.5: Provides finite-dimensional canonical coefficient in the classical comparison.

Unit tests:

- `AutomorphicBundles.canonicalExtension_test_unit` (degenerate): The canonical extension of the unit coefficient is O_SΣ.
- `AutomorphicBundles.canonicalExtension_test_hodge` (compatibility): For an elliptic/PEL Hodge coefficient it is the semi-abelian invariant-differential bundle.
- `AutomorphicBundles.canonicalExtension_test_twist` (non-example): For nonempty boundary D, V^can(D) has the same open restriction but fails the specified canonical boundary-frame normalization.

Acceptance: The unit extends as O_SΣ, not O_SΣ(D); the family of extension functors preserves duals/tensors.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), V §6, pp.90–91 — States the canonical-model or associated-coefficient interface with the hypotheses retained below.; [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Appendix B.8, pp.270–271 — The finite locally free coefficient and its semi-abelian boundary model..

### Gluing the canonical extension

`AutomorphicBundles:B3/canonical-extension-gluing` — theorem. Proposed name: `AutomorphicBundles.canonicalExtensionGluing`.

The canonical boundary-chart coefficient identifications agree on toroidal overlaps, satisfy their cocycle law, and glue to a locally free extension functor whose restriction and chart normalization agree with the construction above. The resulting functor is independent of auxiliary frames, while its base space still depends on the fan.

Proof/construction:

1. Use C2’s actual overlap and arithmetic quotient maps, and C4’s compatible degeneration maps.
2. Check extended tensor frames and coefficient descent commute with those maps; this is the recorded canonical-extension interface, not normality alone.
3. Use effective finite locally free descent to glue, then compare any two chart-normalized choices locally.

Inputs: `AutomorphicBundles:B3/boundary-coefficient-chart`, `ShimuraCompactifications:C2`, `ShimuraCompactifications:C4`, `AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent`.

Acceptance: A boundary twist cannot be glued in as an alternative normalization merely because it is trivial on the open part.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), V §6 Theorem 6.1, p.90 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### The subcanonical automorphic extension

`AutomorphicBundles:B3/subcanonical-extension` — construction. Proposed name: `AutomorphicBundles.subcanonicalExtension`.

For the smooth toroidal model and reduced normal-crossings boundary divisor DΣ=SΣ\S, define V(J)^sub_Σ=V(J)^can_Σ⊗I_DΣ=V(J)^can_Σ(−DΣ). This is locally free because the reduced boundary is Cartier in this setting. The exact sequence 0→V^sub→V^can→i_*i*V^can→0 identifies subcanonical sections as sections vanishing on every reduced boundary component.

Proof/construction:

1. Import the reduced Cartier normal-crossings boundary from C2 (or the stated C5 integral model).
2. Tensor its ideal exact sequence with the locally free canonical coefficient.
3. Use flatness of that coefficient for exactness; define cusp vanishing through this ideal, not a multiplicity-weighted full cusp fibre.

Inputs: `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `ShimuraCompactifications:C2`.

Planning API:

- `AutomorphicBundles.subcanonicalExtension_ideal` (characterisation): V^sub≃V^can⊗I_D with D reduced.
- `AutomorphicBundles.subcanonicalExtension_inclusion` (projection): V^sub→V^can is the kernel of restriction to D.
- `AutomorphicBundles.subcanonicalExtension_restrict` (compatibility): j*V^sub≃V, while boundary restriction of its included sections is zero.

Uses:

- HLTT Appendix B.8: Supplies cuspidal coherent coefficients.
- BCGP §4.8.2 cusp: Uses the negative boundary twist of the usual coefficient.

Unit tests:

- `AutomorphicBundles.subcanonicalExtension_test_empty` (degenerate): For an empty boundary, V^sub=V^can.
- `AutomorphicBundles.subcanonicalExtension_test_crossing` (computation): On Spec k[q1,q2] with reduced D=V(q1q2), the unit subcanonical ideal is (q1q2), so sections vanish on both components.
- `AutomorphicBundles.subcanonicalExtension_test_multiplicity` (non-example): For a full divisor 2D, V^can(−2D) is not the reduced-boundary subcanonical extension.

Acceptance: The boundary ideal is reduced; multiplicities introduced by blowups are not built into its definition.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, p.50 — Separates toroidal vector coefficients from scalar minimal-compactification forms.; [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Appendix B.8, p.271 — The finite locally free coefficient and its semi-abelian boundary model..

### Canonical coefficients under fan refinement

`AutomorphicBundles:B3/refinement-canonical-extension` — comparison. Proposed name: `AutomorphicBundles.refinementCanonicalExtension`.

For a refinement f:SΣ′→SΣ between smooth admissible toroidal models, f*V^can_Σ≃V^can_Σ′. There is a natural map f*V^sub_Σ→V^sub_Σ′ since f*DΣ≥DΣ′, but these subcanonical sheaves are not generally equal under pullback. Under the toric refinement ideal-pushforward condition f_*I_DΣ′=I_DΣ and f_*O=O, the projection formula gives f_*V^sub_Σ′≃V^sub_Σ and f_*V^can_Σ′≃V^can_Σ.

Proof/construction:

1. Use C3’s refinement morphism, structure-sheaf pushforward and common refinements.
2. Pull the canonical normalized chart coefficient through the refinement; the equality is the canonical extension functor’s compatibility.
3. Request the reduced toric boundary ideal pushforward separately at C3; apply the projection formula. The subcanonical pullback equality is explicitly rejected.

Inputs: `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B3/subcanonical-extension`, `ShimuraCompactifications:C3`.

Acceptance: Blowing up the crossing of two boundary components gives exceptional multiplicity two in f*D, but multiplicity one in the reduced new boundary.

Sources: [Beilinson–Bernstein localization over Q and periods of automorphic forms](https://webusers.imj-prg.fr/~michael.harris/BBlocalization_web.pdf), §1.4, (1.4.3), pp.10–11 — Fan comparison via canonical extension; the subcanonical degree-zero ideal comparison is requested explicitly..

### Fan independence of canonical and cusp sections

`AutomorphicBundles:B3/fan-independent-sections` — theorem. Proposed name: `AutomorphicBundles.fanIndependentSections`.

For any two smooth projective admissible fans with a common refinement, pullback and the pushforward comparisons identify H⁰(SΣ,V^can_Σ) and H⁰(SΣ,V^sub_Σ) canonically across the fans. These identifications are transitive and compatible with morphisms defined on common compatible refinements. This is independence of section spaces, not equality of sheaves on different compactifications, and it does not assert all higher direct images vanish.

Proof/construction:

1. Use refinementCanonicalExtension for the degree-zero pushforward statements.
2. Apply Γ(SΣ,f_*F)=Γ(SΣ′,F) to each coefficient.
3. Compare two fans through a common refinement supplied by C3; prove transitivity by composition.

Inputs: `AutomorphicBundles:B3/refinement-canonical-extension`, `ShimuraCompactifications:C3`.

Acceptance: The identity refinement yields identity on sections; no fixed fan is declared Hecke-stable.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, p.49 — Separates toroidal vector coefficients from scalar minimal-compactification forms.; [Beilinson–Bernstein localization over Q and periods of automorphic forms](https://webusers.imj-prg.fr/~michael.harris/BBlocalization_web.pdf), §1.4, (1.4.3), pp.10–11 — The present node uses only degree zero; higher cohomology has its own coefficient hypotheses in B5..

### The logarithmic full-group extension

`AutomorphicBundles:B3/logarithmic-connection-extension` — construction. Proposed name: `AutomorphicBundles.logarithmicConnectionExtension`.

For a full Gᶜ coefficient with its regular-singular flat connection, on a neat level with unipotent local monodromy around the smooth reduced boundary, extend to the Deligne logarithmic bundle with nilpotent residues (the zero-exponent normalization). Its underlying bundle agrees with the canonical automorphic extension. Retain the Hodge filtration extension with Griffiths transversality. For non-unipotent levels one must choose a residue interval and prove the corresponding comparison separately.

Proof/construction:

1. Use filteredDeRhamCoefficient and degeneration charts to establish regular singularity and unipotent monodromy; this is an explicit missing Deligne/automorphic boundary interface.
2. Apply the generic logarithmic connection extension theorem, recorded as a new supplier-direction gap.
3. Compare the normalized local horizontal frame lattices with canonicalExtension and extend the filtration through those frames.

Inputs: `AutomorphicBundles:B2/filtered-de-rham-coefficient`, `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B3/boundary-coefficient-chart`.

Planning API:

- `AutomorphicBundles.logarithmicConnectionExtension_restrict` (compatibility): Restriction gives the original integrable flat connection.
- `AutomorphicBundles.logarithmicConnectionExtension_residue` (structure): Each boundary residue is nilpotent in the unipotent zero-exponent normalization.
- `AutomorphicBundles.logarithmicConnectionExtension_tensor` (functoriality): In that normalization the logarithmic extension preserves tensor products and duals, with induced residue actions.

Uses:

- Lan §4.2.7: Identifies canonical full-group extension with Deligne’s logarithmic extension.
- Downstream de Rham cohomology: Supplies the coefficient with logarithmic connection; de Rham cohomology is outside this node.

Unit tests:

- `AutomorphicBundles.logarithmicConnectionExtension_test_unit` (degenerate): The unit coefficient extends to (O_SΣ,d) with zero residues.
- `AutomorphicBundles.logarithmicConnectionExtension_test_tate` (computation): For a nodal elliptic degeneration the rank-two coefficient has nonzero nilpotent monodromy residue, while its determinant has zero residue.
- `AutomorphicBundles.logarithmicConnectionExtension_test_nonunipotent` (non-example): A rank-one local system with monodromy −1 cannot be put in a nilpotent-residue normalization without a cover or a different exponent choice.

Acceptance: Only full-group coefficients receive this connection functor; arbitrary Levi coefficients need not admit its prescribed flat structure.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, p.50 — Separates toroidal vector coefficients from scalar minimal-compactification forms.; [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), V §6, p.90 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### Coherent coefficients on the minimal model

`AutomorphicBundles:B3/minimal-coherent-pushforward` — construction. Proposed name: `AutomorphicBundles.minimalCoherentPushforward`.

For the proper toroidal-to-minimal map π:SΣ→Smin between noetherian characteristic-zero models, define the minimal coefficient π_*V^can. It is coherent, with the same global sections as V^can. No local freeness on the minimal boundary is claimed. Fan independence follows through the degree-zero refinement comparison.

Proof/construction:

1. Import π and noetherian proper compactifications from C1/C2.
2. Use proper coherent pushforward from the recorded coherent-sheaf interface.
3. Use refinementCanonicalExtension and functoriality of pushforward to compare fans and global sections.

Inputs: `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B3/refinement-canonical-extension`, `ShimuraCompactifications:C1`, `ShimuraCompactifications:C2`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.Scheme.Modules.presheaf`, `mathlib:SheafOfModules.sections`, `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward`, `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward_obj_obj`.

Planning API:

- `AutomorphicBundles.minimalCoherentPushforward_sections` (compatibility): H⁰(Smin,π_*V^can)=H⁰(SΣ,V^can).
- `AutomorphicBundles.minimalCoherentPushforward_coherent` (structure): Proper pushforward of the coherent canonical coefficient is coherent.
- `AutomorphicBundles.minimalCoherentPushforward_refinement` (functoriality): Compatible fan refinements induce a canonical isomorphism of these degree-zero pushforwards.

Uses:

- Lan §4.2.7: Separates vector coefficients on toroidal from minimal line bundles.
- B4 classical forms: Provides a minimal coherent description of the same sections.

Unit tests:

- `AutomorphicBundles.minimalCoherentPushforward_test_proper_open` (degenerate): When the Shimura variety is proper and π is identity, the minimal coefficient is V.
- `AutomorphicBundles.minimalCoherentPushforward_test_rank` (compatibility): On the open S the pushforward restricts to V.
- `AutomorphicBundles.minimalCoherentPushforward_test_singular` (non-example): Coherence does not imply the coefficient is locally free at a singular minimal boundary; no rank-only criterion is exported.

Acceptance: The definition allows non-locally-free coherent sheaves at a singular minimal boundary.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, pp.49–50 — Separates toroidal vector coefficients from scalar minimal-compactification forms..

### Minimal Hodge-line descent with positivity

`AutomorphicBundles:B3/minimal-hodge-line-comparison` — comparison. Proposed name: `AutomorphicBundles.minimalHodgeLineComparison`.

For the PEL/Hilbert scalar Hodge line under the compactification owner’s positivity and graded-section finite-generation hypotheses, a sufficiently divisible positive power of the toroidal Hodge line is pulled back from an ample invertible sheaf on the minimal compactification. Compare its scalar boundedness/section description with that line. This is an additional scalar theorem; it is not asserted for an arbitrary Levi vector coefficient or every undivided Hodge-line power.

Proof/construction:

1. Import the actual positive Hodge line and minimal Proj construction from C5 (Hilbert ramified specializations from C6/H2).
2. Use the chosen sufficiently divisible graded degree to construct the minimal invertible sheaf and pullback comparison.
3. Compare scalar sections in its canonical boundary frame; do not infer locally free minimal coefficients from minimalCoherentPushforward.

Inputs: `AutomorphicBundles:B3/minimal-coherent-pushforward`, `ShimuraCompactifications:C5`, `ShimuraCompactifications:C6`, `HilbertModularVarietiesAndShimuraCurves:H2`.

Acceptance: Vector-valued coefficients remain toroidal locally free; the separate scalar minimal-line claim has explicit positivity/divisibility hypotheses.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, p.49 — Separates toroidal vector coefficients from scalar minimal-compactification forms.; [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), §3.4.1, pp.109–110 — The finite locally free coefficient and its semi-abelian boundary model..

### Rationality of the canonical extension

`AutomorphicBundles:B3/canonical-rational-descent` — theorem. Proposed name: `AutomorphicBundles.canonicalRationalDescent`.

For a coefficient J defined over its number field L and a compatible smooth projective toroidal model over L, the canonical extension and reduced-boundary subcanonical extension are defined over L. Their field base-change identifications preserve the canonical chart normalization and reduced boundary. No all-prime integral extension is inferred from characteristic-zero descent.

Proof/construction:

1. Use canonicalExtensionGluing and canonicalExtension to construct the chart-normalized functor.
2. Apply normalized conjugation and C2/C3 rational boundary models to transport each chart construction.
3. Use effective coefficient descent; the uniqueness is the specified extension-functor normalization, not its open restriction alone.

Inputs: `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B3/canonical-extension-gluing`, `AutomorphicBundles:B3/subcanonical-extension`, `AutomorphicBundles:B0/coefficient-galois-descent`, `ShimuraCompactifications:C2`.

Acceptance: A coefficient over L⊃E has its extension over L; the statement does not force its descent to E.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), V §6 Theorem 6.2, p.91 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

## B3.general. General boundary completion

Coverage: **planned**. The following targets are specified; the stage remains open at its supplier/proof and typed-carrier refinements.

### General canonical automorphic extensions

`AutomorphicBundles:B3.general/general-canonical-extension` — theorem. Proposed name: `AutomorphicBundles.generalCanonicalExtension`.

On the characteristic-zero general-data toroidal models supplied by C2.general, the general automorphic coefficient V(J) admits the canonical locally free extension functor, with its specified analytic boundary normalization, rational descent and tensor/dual compatibility. Define the subcanonical extension using the reduced boundary ideal. This does not require an unspecified general-data semi-abelian family and does not assert an integral extension at all primes.

Proof/construction:

1. Use generalAssociatedModel and the actual general rational boundary/toroidal charts from C2.general.
2. Use the Deligne–Harris analytic automorphic extension construction, whose complete local proof interface remains recorded as a gap; replace no step by a universal abelian family.
3. Descend the normalized extension as in canonicalRationalDescent, and form the reduced ideal twist.

Inputs: `AutomorphicBundles:B2.general/general-associated-model`, `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B3/subcanonical-extension`, `AutomorphicBundles:B3/canonical-rational-descent`, `ShimuraCompactifications:C2.general`.

Acceptance: The unit and full-group coefficients have the same normalization as on Hodge-type subdata.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), V §6 Theorems 6.1–6.2, pp.90–91 — States the canonical-model or associated-coefficient interface with the hypotheses retained below.; [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, pp.49–50 — Separates toroidal vector coefficients from scalar minimal-compactification forms..

### General logarithmic realization comparison

`AutomorphicBundles:B3.general/general-logarithmic-comparison` — comparison. Proposed name: `AutomorphicBundles.generalLogarithmicComparison`.

For a full Gᶜ representation on a general-data neat toroidal model, establish regular singularity/unipotent boundary monodromy and identify its canonical extension with the zero-exponent logarithmic flat extension; compare tensor, dual and conjugation structures. Keep the regular-singular proof interface explicit and do not attach a flat connection to every Levi coefficient.

Proof/construction:

1. Use generalFlatRealizations for the open connection and C2.general for the rational boundary charts.
2. Apply the same missing automorphic regular-singularity/Deligne extension theorem as logarithmicConnectionExtension.
3. Compare normalized local lattices with generalCanonicalExtension and transport them under generalConjugationCocycle.

Inputs: `AutomorphicBundles:B2.general/general-flat-realizations`, `AutomorphicBundles:B3.general/general-canonical-extension`, `AutomorphicBundles:B3/logarithmic-connection-extension`, `AutomorphicBundles:B1.general/general-conjugation-cocycle`, `ShimuraCompactifications:C2.general`.

Acceptance: No assertion that all general-data full-group coefficients arise from a motivic family is needed.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), V §6, pp.90–91 — States the canonical-model or associated-coefficient interface with the hypotheses retained below.; [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, p.50 — Separates toroidal vector coefficients from scalar minimal-compactification forms..

### General boundary and conjugation compatibility

`AutomorphicBundles:B3.general/general-boundary-functoriality` — theorem. Proposed name: `AutomorphicBundles.generalBoundaryFunctoriality`.

The general canonical and subcanonical section-space comparisons commute with fan refinements, compatible extensions of datum/Hecke maps and conjugation to the transported fan and coefficient. The subcanonical comparison uses reduced-boundary ideal pushforward, not equality under every pullback. A single fixed fan is not declared invariant under all Hecke translations.

Proof/construction:

1. Import C3.general’s general-data refinement and compatible Hecke/boundary maps.
2. Use generalCanonicalExtension and the canonical pullback/degree-zero ideal comparison from refinementCanonicalExtension.
3. Compare all choices on common refinements, including conjugated fans; use normalized conjugation and uniqueness.

Inputs: `AutomorphicBundles:B3.general/general-canonical-extension`, `AutomorphicBundles:B3/refinement-canonical-extension`, `AutomorphicBundles:B3/fan-independent-sections`, `AutomorphicBundles:B1.general/general-conjugation-cocycle`, `ShimuraCompactifications:C3.general`.

Acceptance: Conjugation acts on the coefficient field and the fan; it is not an endomorphism of one fixed compactification.

Sources: [Beilinson–Bernstein localization over Q and periods of automorphic forms](https://webusers.imj-prg.fr/~michael.harris/BBlocalization_web.pdf), Theorem 1.4.2 and (1.4.3), pp.10–11 — Conjugates the fan as well as the canonical coefficient.; [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), V §6, p.91 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

## B4. Classical forms and explicit weights

Coverage: **planned**. The following targets are specified; the stage remains open at its supplier/proof and typed-carrier refinements.

### Classical automorphic forms

`AutomorphicBundles:B4/classical-forms` — definition. Proposed name: `AutomorphicBundles.classicalForms`.

For an automorphic coefficient over L and a smooth projective toroidal model SΣ/L, define M(J,K;L)=H⁰(SΣ,V(J)^can). Use the fan-independent identification to regard this as the classical finite-level form space. The finite-dimensionality assertion uses properness/coherence, not H⁰ of the open variety alone. This definition applies to the general-data coefficient via B2.general/B3.general as well.

Proof/construction:

1. Use canonicalExtension (or generalCanonicalExtension) on the supplied proper model.
2. Take global sections; the generic coherent-section interface is recorded as an open typed foundation.
3. Use fanIndependentSections/generalBoundaryFunctoriality to remove dependence of the space on the chosen fan.

Inputs: `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B3/fan-independent-sections`, `AutomorphicBundles:B3.general/general-canonical-extension`, `AutomorphicBundles:B3.general/general-boundary-functoriality`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.Scheme.Modules.presheaf`, `mathlib:SheafOfModules.sections`.

Planning API:

- `AutomorphicBundles.classicalForms_section` (projection): A classical form is a global section of the canonical coefficient.
- `AutomorphicBundles.classicalForms_fan` (equivalence): Common refinements induce a canonical identification of M for different smooth projective fans.
- `AutomorphicBundles.classicalForms_multiply` (functoriality): Tensoring sections gives M(J1)×M(J2)→M(J1⊗J2).

Uses:

- Milne III §7: Defines forms rational over number fields.
- BCGP §4.5 classical comparison: Uses the finite-dimensional algebraic coefficient; higher coherent cohomology belongs to B5.

Unit tests:

- `AutomorphicBundles.classicalForms_test_unit` (degenerate): For a proper geometrically connected model and trivial coefficient, M=L.
- `AutomorphicBundles.classicalForms_test_curve` (compatibility): For the modular Hodge coefficient ω^k the space agrees with the geometric modular-form owner’s proper-curve sections.
- `AutomorphicBundles.classicalForms_test_open` (non-example): Replacing SΣ by a nonproper affine open can give infinite-dimensional H⁰ and is not this definition.

Acceptance: Weight zero means regular functions on the proper canonical model; it need not mean all functions on the open variety.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §7, pp.61–62 — States the canonical-model or associated-coefficient interface with the hypotheses retained below.; [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, p.50 — Separates toroidal vector coefficients from scalar minimal-compactification forms..

### Cuspidal automorphic forms

`AutomorphicBundles:B4/cusp-forms` — definition. Proposed name: `AutomorphicBundles.cuspForms`.

Define S(J,K;L)=H⁰(SΣ,V(J)^sub)=ker[M(J,K;L)→H⁰(DΣ,i*V(J)^can)]. Thus a cusp form vanishes along every component of the reduced boundary in the canonical frame. Its fan-independent definition uses the ideal-pushforward comparison; no Koecher extension theorem makes this vanishing automatic.

Proof/construction:

1. Take global sections of the reduced-boundary exact sequence from subcanonicalExtension.
2. Use left exactness to identify the kernel; no H¹ vanishing is needed.
3. Apply fanIndependentSections for independence and preserve the inclusion into classicalForms.

Inputs: `AutomorphicBundles:B3/subcanonical-extension`, `AutomorphicBundles:B4/classical-forms`, `AutomorphicBundles:B3/fan-independent-sections`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.Scheme.Modules.presheaf`, `mathlib:SheafOfModules.sections`.

Planning API:

- `AutomorphicBundles.cuspForms_include` (projection): S(J)↪M(J) is induced by the boundary-ideal inclusion.
- `AutomorphicBundles.cuspForms_kernel` (characterisation): A form is cuspidal iff its restriction to every reduced boundary component is zero.
- `AutomorphicBundles.cuspForms_tensor` (functoriality): The product of a cusp form with a classical form is cuspidal in the tensor coefficient.

Uses:

- Lan §4.2.7: Subcanonical sections define cuspidal vector-valued forms.
- BCGP §4.8.2 cusp: Supplies the classical negative-boundary coefficient; the cohomological comparison is a separate consumer.

Unit tests:

- `AutomorphicBundles.cuspForms_test_empty` (degenerate): If D=∅, S(J)=M(J).
- `AutomorphicBundles.cuspForms_test_constant` (computation): For nonempty boundary and trivial coefficient on a proper geometrically connected model, a nonzero constant is not cuspidal.
- `AutomorphicBundles.cuspForms_test_crossing` (characterisation): At a two-component crossing a holomorphic coefficient is cuspidal iff it lies in the product ideal (q1q2), not merely (q1,q2).

Acceptance: On a compact Shimura variety the empty-boundary cusp and classical spaces agree.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, p.50 — Separates toroidal vector coefficients from scalar minimal-compactification forms.; [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), §4.8.2, pp.101–102 — Fixes coefficient/dual/twist conventions for the added source; higher cohomology is outside this part..

### The normalized automorphy factor

`AutomorphicBundles:B4/automorphy-factor-cocycle-and-growth-conditions` — definition. Proposed name: `AutomorphicBundles.AutomorphyFactor`.

For a left action of Γ on a complex domain X and a finite-dimensional complex vector space V, a linear holomorphic automorphy factor is J:Γ×X→GL_C(V), holomorphic in x for each γ, with J(1,x)=1 and J(gh,x)=J(g,hx)J(h,x). It defines f(gx)=J(g,x)f(x). Classical/cusp growth is a separate condition on such a holomorphic equivariant section in the specified canonical boundary frame: local holomorphic extension, respectively membership in its reduced boundary ideal. The algebraic adapter below forgets topology and retains only the normalized linear cocycle.

Proof/construction:

1. Specify invertible coefficient maps and the normalized shifted cocycle; they are data, not deductions from a zero section.
2. Obtain transition factors from analyticCoefficient/sectionsEquivariant; reversing the base-action convention requires inverseBaseActionCocycle.
3. Attach geometric growth only through canonicalExtension/subcanonicalExtension. The missing holomorphic bundle carrier is omitted honestly in the functional Lean signature.

Inputs: `AutomorphicBundles:B0/analytic-coefficient`, `AutomorphicBundles:B0/sections-equivariant`, `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B3/subcanonical-extension`, `mathlib:LinearEquiv.trans`.

Planning API:

- `AutomorphicBundles.AutomorphyFactor_one` (simp): J(1,x)=id.
- `AutomorphicBundles.AutomorphyFactor_mul` (structure): J(gh,x)=J(g,hx)∘J(h,x), with the indicated shifted base point.
- `AutomorphicBundles.AutomorphyFactor_change_frame` (equivalence): A holomorphic frame change u gives J′(g,x)=u(gx)J(g,x)u(x)⁻¹ and an isomorphic coefficient.
- `AutomorphicBundles.AutomorphyFactor_forget` (projection): Forgetting holomorphy yields the normalized linear cocycle input for the existing SlashAction adapter.

Uses:

- Lan §4.2.7: States the transformation law of analytic forms.
- Mathlib SlashAction adapter: Encodes the right slash action derived from the left action.

Unit tests:

- `AutomorphicBundles.AutomorphyFactor_test_unit` (degenerate): The constant identity coefficient is normalized and satisfies the shifted cocycle.
- `AutomorphicBundles.AutomorphyFactor_test_frame` (computation): For any invertible frame function u, J(g,x)=u(gx)u(x)⁻¹ satisfies the shifted cocycle.
- `AutomorphicBundles.AutomorphyFactor_test_order` (non-example): On Q² the noncommuting shears detect failure of the unshifted product law and of reversed composition; those tests concern the functional forgotten coefficient.

Acceptance: The zero function transforms for every J and therefore cannot force the cocycle.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, pp.49–50 — Uses the corrected shifted cocycle; the printed unshifted formula is recorded in sourceIssues..

### The convention adapter to SlashAction

`AutomorphicBundles:B4/slash-action-of-automorphy-factor` — construction. Proposed name: `AutomorphicBundles.slashActionOfAutomorphyFactor`.

For any index β, monoid G acting on X on the left, semiring R and R-module V, normalized coefficients J(k,g,x):V≃_R V with J(k,gh,x)=J(k,g,hx)∘J(k,h,x) define Mathlib’s existing SlashAction β G (X→V) by (f|_k g)(x)=J(k,g,x)⁻¹ f(gx). No new slash-action carrier is introduced. The action is additive and R-linear, and |gh equals first |g then |h.

Proof/construction:

1. Define map by inverse coefficient followed by base evaluation using LinearEquiv.symm.
2. Use the inverse composite identity LinearEquiv.trans_symm, retaining trans’s opposite argument order, to prove slash_mul.
3. Use hone and linearity for slash_one, zero_slash and add_slash; the explicit constructor is prototyped with proof placeholders.

Inputs: `mathlib:SlashAction`, `mathlib:LinearEquiv.trans`, `mathlib:LinearEquiv.trans_symm`, `mathlib:LinearEquiv.symm_apply_eq`, `mathlib:LinearEquiv.automorphismGroup`, `mathlib:LinearEquiv.applyDistribMulAction`.

Planning API:

- `AutomorphicBundles.slashActionOfAutomorphyFactor_map_apply` (simp): The map evaluates to J(k,g,x)⁻¹(f(gx)).
- `AutomorphicBundles.slashActionOfAutomorphyFactor_invariant_iff` (characterisation): ∀g,f|_k g=f iff ∀g,x,f(gx)=J(k,g,x)f(x).
- `AutomorphicBundles.slashActionOfAutomorphyFactor_map_smul` (structure): Slash is R-linear on functions.
- `AutomorphicBundles.slashActionOfAutomorphyFactor_congr` (extensionality): Pointwise equal coefficient families give equal SlashAction values, independent of proof terms.
- `AutomorphicBundles.slashActionOfAutomorphyFactor_map_of_trivial` (compatibility): If J is identity, map is precomposition by the left base action.

Uses:

- B4 analytic comparison: Translates transformation invariance into the existing right-action vocabulary.
- Pinned Mathlib SlashActions: Tests agreement with the already implemented scalar convention.

Unit tests:

- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_trivial` (degenerate): For identity J, f|g is x↦f(gx).
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_zero` (computation): The zero function is fixed for every normalized coefficient.
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_frame` (characterisation): The point-dependent frame cocycle u(gx)u(x)⁻¹ yields exactly u(x)u(gx)⁻¹f(gx).
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_noncommuting` (non-example): For the two rational shears, applying the inverse composite in the wrong order changes the value on (1,0).
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_inverse` (non-example): The rational shearX applied to the constant (0,1) has slash value (−1,1), detecting an operator that forgets the inverse.
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_sl2` (compatibility): For SL2(Z), V=C and J(k,g,z)=denom(g,z)^k as a scalar linear automorphism, the adapter equals Mathlib’s scalar slash action.
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_zero_noncocycle` (non-example): The normalized nonzero factor on C2 with nonidentity value 2 transforms the zero section but fails J(gh)=J(g)J(h); this is not accepted as an adapter input.
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_semilinear` (non-example): The determinant-negative GL2(R) slash law has conjugated scalar multiplication and cannot be represented by this C-linear adapter.

Acceptance: The existing prototype tests noncommuting coefficients, scalar SL2 compatibility and the determinant-negative semilinear boundary.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, p.49 — The vector-valued inverse convention is a deduction from the corrected transformation law and the pinned right-action class..

### Evaluation of the slash adapter

`AutomorphicBundles:B4/slash-evaluation` — lemma. Proposed name: `AutomorphicBundles.slashActionOfAutomorphyFactor_map_apply`.

For the exact parameters and normalized cocycle of slashActionOfAutomorphyFactor, its map evaluates as J(k,g,x)⁻¹(f(gx)).

Proof/construction:

1. Unfold the explicit map field of slashActionOfAutomorphyFactor.

Inputs: `AutomorphicBundles:B4/slash-action-of-automorphy-factor`.

Acceptance: No nowhere-zero assumption on f is used.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, p.49 — The evaluation formula is the algebraic convention derived from this transformation law..

### Invariance and the transformation law

`AutomorphicBundles:B4/slash-invariance` — lemma. Proposed name: `AutomorphicBundles.slashActionOfAutomorphyFactor_invariant_iff`.

For the exact adapter parameters, ∀g,f|_k g=f iff ∀g,x,f(gx)=J(k,g,x)f(x). This equivalence needs no nonzero-section hypothesis.

Proof/construction:

1. Use pointwise function equality and slashEvaluation.
2. Apply LinearEquiv.symm_apply_eq at each point.

Inputs: `AutomorphicBundles:B4/slash-evaluation`, `mathlib:LinearEquiv.symm_apply_eq`.

Acceptance: The zero function satisfies both sides.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, p.49 — Restates the transformation law as invariance for an independently specified cocycle..

### The inverse-base right cocycle

`AutomorphicBundles:B4/inverse-base-action-cocycle` — lemma. Proposed name: `AutomorphicBundles.inverse_base_action_cocycle`.

For groups G,H, a left G-action on X and J:G×X→H satisfying the left shifted cocycle, define x·g=g⁻¹x and J_right(x,g)=J(g⁻¹,x). Then J((gh)⁻¹,x)=J(h⁻¹,g⁻¹x)J(g⁻¹,x). This right base action is distinct from the right slash action on functions.

Proof/construction:

1. Expand (gh)⁻¹=h⁻¹g⁻¹.
2. Apply the specified left cocycle to h⁻¹,g⁻¹ and x.

Inputs: `AutomorphicBundles:B4/automorphy-factor-cocycle-and-growth-conditions`.

Acceptance: Noncommuting coefficient maps distinguish the product order.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, p.49 — The right-base formula follows from the corrected left cocycle, including its shifted argument..

### When a section detects a scalar cocycle

`AutomorphicBundles:B4/nonzero-section-cocycle` — lemma. Proposed name: `AutomorphicBundles.cocycle_at_of_automorphy_of_ne_zero`.

For a monoid G acting on X, a field K, J:G×X→K and f:X→K with f(gx)=J(g,x)f(x), at any point x with f(x)≠0 one has J(gh,x)=J(g,hx)J(h,x). No conclusion is inferred at a zero of f or from the zero function.

Proof/construction:

1. Evaluate f((gh)x) using the action law and twice using its transformation law.
2. Cancel the scalar f(x) using the field assumption and f(x)≠0.

Inputs: the exact algebraic hypotheses in the statement; the named foundational gap where specified in its proof.

Acceptance: For C2 acting trivially on a point, J(nonidentity)=2 and J(identity)=1 transforms zero but violates the cocycle because 4≠1.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, p.49 — The section-cancellation guard is a deduction; the source cocycle is imposed independently..

### Geometric and analytic classical forms

`AutomorphicBundles:B4/analytic-classical-comparison` — theorem. Proposed name: `AutomorphicBundles.analyticClassicalComparison`.

Over L↪C, identify classicalForms with holomorphic equivariant functions for the analytic coefficient whose components in the canonical boundary frame extend holomorphically across each cusp chart. Identify cuspForms with those components in the reduced boundary ideal. Locally, holomorphic logarithmic-growth components have removable singularities; cuspidal components are divisible by each reduced boundary parameter. Global algebraization uses proper projective GAGA on SΣ. The scalar Baily–Borel boundedness statement is limited to the separately descended scalar line coefficients.

Proof/construction:

1. Use automorphicAnalyticComparison and sectionsEquivariant on the open space.
2. Use the canonical chart normalization and the local removable-singularity/vanishing lemma; its analytic foundation is recorded separately, and the faulty course-note Dolbeault proof is not imported.
3. Use projective coherent GAGA at C2 of ComplexComparisonPartII on the proper SΣ, and subcanonicalExtension’s ideal sequence.

Inputs: `AutomorphicBundles:B4/classical-forms`, `AutomorphicBundles:B4/cusp-forms`, `AutomorphicBundles:B2/automorphic-analytic-comparison`, `AutomorphicBundles:B0/sections-equivariant`, `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B3/subcanonical-extension`, `AutomorphicBundles:B3/minimal-hodge-line-comparison`, `ComplexComparisonPartII:C2`.

Acceptance: Changing a frame arbitrarily can change apparent boundedness; the theorem names the canonical frame. Negative-determinant full GL2 uses its semilinear extension.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, pp.49–50 — Separates toroidal vector coefficients from scalar minimal-compactification forms.; [Logarithmic growth (Cours 2013, 8logarithmique)](https://webusers.imj-prg.fr/~michael.harris/Cours_2013/8logarithmique.pdf), p.3, degree-zero kernels only — Only the holomorphic local kernel criterion is used; the course-note higher-resolution errors are recorded and not treated as a proof..

### The GL₂ Hodge-line specialization

`AutomorphicBundles:B4/gl2-hodge-line-comparison` — comparison. Proposed name: `AutomorphicBundles.gl2HodgeLineComparison`.

For an actual modular-curve model with a fine level removing stabilizers, the cohomological Hodge line is ω=e*Ω¹_E/S, its canonical extension is the generalized-elliptic invariant-differential line, and the integer weight-k coefficient is ω^{⊗k} (dual powers for k<0). Compare the proper-curve geometric forms supplied by R15.1 to Mathlib’s existing scalar ModularForm Γ k / CuspForm Γ k after the actual complex uniformization and all-cusp comparison. For determinant-negative full GL2 the scalar law is semilinear; the C-linear prototype comparison is restricted to SL2.

Proof/construction:

1. Import the modular Hodge line, generalized family, q-cusp model and geometric–analytic form comparison from R12/R13/R15.1; do not reconstruct that owner’s forms.
2. Apply automorphicAnalyticComparison with the explicitly chosen cohomology/dual convention and compare canonical boundary frames.
3. Use the pinned scalar SlashActions and ModularForm/CuspForm definitions; match holomorphy and boundedness/zero at every cusp, not one selected cusp.

Inputs: `AutomorphicBundles:B2/automorphic-analytic-comparison`, `AutomorphicBundles:B4/analytic-classical-comparison`, `AlgebraicModularFormsAndSerreWeights:R15.1`, `mathlib:ModularForm`, `mathlib:CuspForm`, `mathlib:ModularForm.SL_slash_apply`, `mathlib:ModularForm.slash_action_eq'_iff`, `mathlib:ModularForm.smul_slash`, `mathlib:UpperHalfPlane.denom_ne_zero`, `mathlib:UpperHalfPlane.denom_cocycle`, `mathlib:UpperHalfPlane.denom_cocycle'`.

Acceptance: For k=0 the coefficient is O; an odd weight does not descend through a surviving −1 stabilizer.

Sources: [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, pp.49–50 — Separates toroidal vector coefficients from scalar minimal-compactification forms.; [Vector bundles (Cours 2013, 4fibres)](https://webusers.imj-prg.fr/~michael.harris/Cours_2013/4fibres.pdf), pp.1–2 — The Hodge-line coefficient must be compared with the fixed scalar slash convention..

### Arithmetic Hilbert weights

`AutomorphicBundles:B4/hilbert-arithmetic-weight` — definition. Proposed name: `AutomorphicBundles.HilbertArithmeticWeight`.

For a finite set I of real embeddings of a totally real field F, an arithmetic weight is k:I→Z together with w:Z and the parity condition k_τ≡w mod 2 for every τ. Put m_τ=(w−k_τ)/2. This is a coefficient label, not the theorem that its representation descends to Q or through every arithmetic central stabilizer. Negative k and determinant powers are allowed over the characteristic-zero coefficient field.

Proof/construction:

1. Specify the integer data and actual pointwise parity laws.
2. Define m using exact integer division; parity proves 2m_τ=w−k_τ.
3. Keep the Galois orbit and central compatibility for the separate coefficient/descent nodes.

Inputs: the exact algebraic hypotheses in the statement; the named foundational gap where specified in its proof.

Planning API:

- `AutomorphicBundles.HilbertArithmeticWeight_k` (projection): The embedding-indexed integer k_τ.
- `AutomorphicBundles.HilbertArithmeticWeight_w` (projection): The common integer central weight w.
- `AutomorphicBundles.HilbertArithmeticWeight_detExponent` (data): m_τ=(w−k_τ)/2.
- `AutomorphicBundles.HilbertArithmeticWeight_two_mul_detExponent` (characterisation): 2m_τ=w−k_τ for every τ.
- `AutomorphicBundles.HilbertArithmeticWeight_add` (constructor): Pointwise k addition and w addition preserve arithmetic parity.

Uses:

- Hilbert coefficient below: Produces integral determinant exponents and a common central character.
- Unsplit Hilbert descent: Galois permutes the embedding labels.

Unit tests:

- `AutomorphicBundles.HilbertArithmeticWeight_test_zero` (degenerate): k=0,w=0 is an arithmetic weight and every m_τ=0.
- `AutomorphicBundles.HilbertArithmeticWeight_test_negative` (computation): For one embedding, k=4,w=2 gives m=−1, so forbidding negative determinant twists would lose an allowed weight.
- `AutomorphicBundles.HilbertArithmeticWeight_test_parity` (non-example): k=3,w=2 violates parity and is not an arithmetic weight.

Acceptance: An odd k_τ cannot be paired with an even w.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §8, pp.63–64 — States the canonical-model or associated-coefficient interface with the hypotheses retained below.; [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, pp.49–50 — The parity-normalized determinant label is the explicit Hilbert cohomological convention used below; the centre warning is Milne’s..

### The split Hilbert coefficient

`AutomorphicBundles:B4/hilbert-coefficient` — construction. Proposed name: `AutomorphicBundles.hilbertCoefficient`.

Over a characteristic-zero field L splitting F and the supplied HB family, decompose H¹dR=⊕_τH_τ and ω=⊕_τω_τ, with H_τ rank two and ω_τ rank one. For an arithmetic weight define ω^{(k,w)}=⊗_τ(ω_τ^{k_τ}⊗δ_τ^{m_τ}), δ_τ=det H_τ and m_τ=(w−k_τ)/2. In the cohomological frame convention scalar t_τ acts as t_τ on ω_τ and t_τ² on δ_τ, so the central character is ∏t_τ^w=Norm(t)^w. Passing to the homology representation convention inverts that character.

Proof/construction:

1. Import the actual HB Hodge modules and the rank-one/Rapoport hypotheses from H1/H2.
2. Use HilbertArithmeticWeight to form tensor and inverse line powers and determinants.
3. Apply automorphicVectorBundle and hodgeParabolicConvention to identify this cohomological coefficient with the correct split Levi representation, retaining its centre.

Inputs: `AutomorphicBundles:B4/hilbert-arithmetic-weight`, `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `AutomorphicBundles:B0/hodge-parabolic-convention`, `HilbertModularVarietiesAndShimuraCurves:H1`, `HilbertModularVarietiesAndShimuraCurves:H2`.

Planning API:

- `AutomorphicBundles.hilbertCoefficient_formula` (characterisation): The line equals the displayed tensor of ω_τ powers and determinant powers.
- `AutomorphicBundles.hilbertCoefficient_central` (compatibility): Its cohomological-frame central action is Norm(t)^w.
- `AutomorphicBundles.hilbertCoefficient_add` (functoriality): Coefficient tensor products correspond to addition of arithmetic weights.

Uses:

- B4 Hilbert central descent: Checks the action of actual unit stabilizers.
- Hilbert p-adic consumers: Fixes the finite-dimensional coefficient before varying weights p-adically.

Unit tests:

- `AutomorphicBundles.hilbertCoefficient_test_rational` (compatibility): For F=Q, (k,w=k) has m=0 and gives ω^k.
- `AutomorphicBundles.hilbertCoefficient_test_determinant` (computation): For every embedding k_τ=0,w=2, the coefficient is ⊗_τdet H_τ.
- `AutomorphicBundles.hilbertCoefficient_test_negative` (non-example): At k_τ=4,w=2 the determinant factor is δ_τ⁻¹; replacing m by its absolute value changes the central character.

Acceptance: The ranks and splitting field are explicit; integral ramified bases outside H2’s Rapoport locus do not inherit the split formula automatically.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §8, pp.63–64 — States the canonical-model or associated-coefficient interface with the hypotheses retained below.; [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf), §4.2.7, pp.49–50 — Separates toroidal vector coefficients from scalar minimal-compactification forms..

### The Hilbert central-action check

`AutomorphicBundles:B4/hilbert-central-descent` — theorem. Proposed name: `AutomorphicBundles.hilbertCentralDescent`.

For the actual G=Res(F/Q)GL2 or G* arithmetic quotient, the split Hilbert coefficient descends through an ineffective central subgroup C iff its character Norm(t)^w (or its homology inverse) is trivial on C. Totally positive norm-one units act trivially for arithmetic (k,w), but any remaining signs and finite stabilizers must be checked separately. The G* polarization quotient uses H3/H4’s actual finite unit quotient, not a guessed quotient of the full centre.

Proof/construction:

1. Use hilbertCoefficient to compute the central character.
2. Import the full G/G* quotient and level-kernel descriptions from H0/H3/H4.
3. Apply ineffectiveFibreDescent; explicitly test every remaining finite stabilizer and retain the stack formulation otherwise.

Inputs: `AutomorphicBundles:B4/hilbert-coefficient`, `AutomorphicBundles:B0/ineffective-fibre-descent`, `HilbertModularVarietiesAndShimuraCurves:H0`, `HilbertModularVarietiesAndShimuraCurves:H3`, `HilbertModularVarietiesAndShimuraCurves:H4`.

Acceptance: Neatness alone never discharges the infinite-unit condition; norm −1 and a parity-odd w can obstruct a quotient that includes such units.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §8, pp.63–64 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### Hilbert coefficients without a global splitting

`AutomorphicBundles:B4/unsplit-hilbert-descent` — comparison. Proposed name: `AutomorphicBundles.unsplitHilbertDescent`.

Descend the split Hilbert coefficient along the Galois action permuting F embeddings and the representation’s actual descent datum. Before splitting, use the O_F⊗O-linear Hodge/de Rham modules and determinant/norm constructions; do not choose global idempotent summands over a nonsplitting base. The coefficient field is the field of definition of the embedding-indexed weight and representation, enlarged if necessary beyond the Shimura reflex field.

Proof/construction:

1. Import H1/H2’s unsplit HB modules and local rank assumptions.
2. Compare the tensor coefficient after a splitting extension, where the Galois group permutes labels and factors.
3. Apply coefficientGaloisDescent and hilbertCentralDescent to descend over the actual weight field; for integral bases require the finite locally free module hypotheses.

Inputs: `AutomorphicBundles:B4/hilbert-coefficient`, `AutomorphicBundles:B0/coefficient-galois-descent`, `AutomorphicBundles:B4/hilbert-central-descent`, `HilbertModularVarietiesAndShimuraCurves:H1`, `HilbertModularVarietiesAndShimuraCurves:H2`.

Acceptance: A nonparallel real-quadratic weight is exchanged by the two embeddings, so it is not automatically Q-defined.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §§5,8, pp.58–59,63–64 — States the canonical-model or associated-coefficient interface with the hypotheses retained below..

### Siegel Schur and determinant coefficients

`AutomorphicBundles:B4/siegel-coefficient` — construction. Proposed name: `AutomorphicBundles.siegelCoefficient`.

For the rank-g cohomological Hodge bundle ω of a principally polarized abelian family and a dominant integer weight λ₁≥⋯≥λ_g, set a_i=λ_i−λ_g and define the characteristic-zero coefficient S_a(ω)⊗(det ω)^{λ_g}, with the chosen similitude/Tate character separately specified. Use the actual Schur functor form over a good integral base when requested. In the BCGP opposite-flag convention compare the tautological exact sequence and its two Levi coefficients, with the dual and central-character conversion from B2.

Proof/construction:

1. Import the actual Siegel/PEL family and Hodge module from M3/M5 and A4.
2. Import the generic Schur/determinant representation and associated functor through the recorded missing representation interface.
3. Apply leviHighestWeightConvention; compare BCGP’s tautological filtered sequence after the specified opposite/dual switch, without splitting it by assertion.

Inputs: `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `AutomorphicBundles:B2/levi-highest-weight-convention`, `PELModuli:M3`, `PELModuli:M5`, `AbelianSchemesAndArithmeticModuli:A4`, `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-2-the-weyl-construction-via-young-symmetrizers`.

Planning API:

- `AutomorphicBundles.siegelCoefficient_schur` (characterisation): The coefficient is S_(λ−λ_g)(ω)⊗det(ω)^{λ_g} with its separately declared central twist.
- `AutomorphicBundles.siegelCoefficient_scalar` (compatibility): For λ=(r,…,r) the coefficient is det(ω)^r.
- `AutomorphicBundles.siegelCoefficient_standard` (compatibility): For λ=(1,0,…,0) it is ω.

Uses:

- BCGP §3.2.19: Fixes the standard filtered coefficient and its graded conventions.
- BCGP §4.8.2: Supplies ordinary/cuspidal finite-dimensional coefficients; the cohomology statement belongs to B5.

Unit tests:

- `AutomorphicBundles.siegelCoefficient_test_g1` (compatibility): For g=1 the coefficient is the modular Hodge-line power ω^{λ₁}.
- `AutomorphicBundles.siegelCoefficient_test_det` (computation): For λ=(−1,…,−1) it is det(ω)⁻¹, not a polynomial-only Schur coefficient.
- `AutomorphicBundles.siegelCoefficient_test_standard` (non-example): For g>1, λ=(1,0,…,0) yields rank g, so replacing every Siegel coefficient by a scalar determinant power fails.

Acceptance: For g=1 the formula is ω^{λ₁}; any Hodge–Tate graded-sequence comparison is conditional on T2, not a new p-adic comparison theorem here.

Sources: [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), §3.2.19, p.45; §4.8.1–4.8.2, pp.101–102 — Fixes coefficient/dual/twist conventions for the added source; higher cohomology is outside this part.; [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Appendix B.8, pp.270–271 — The finite locally free coefficient and its semi-abelian boundary model..

### A split unitary coefficient test

`AutomorphicBundles:B4/unitary-coefficient` — construction. Proposed name: `AutomorphicBundles.unitaryCoefficient`.

For the imaginary-quadratic GU(1,1) PEL datum over a coefficient field L containing both labelled embeddings τ,barτ of F, use the actual decomposition H¹dR=H_τ⊕H_barτ with each rank two and Hodge lines ω_τ,ω_barτ of rank one. In the chosen cohomological graded-frame convention the split Levi GL1×GL1×Gm weight (k,l;n) gives ω_τ^k⊗ω_barτ^l⊗ν^n, where ν is the declared similitude/Tate line. Negative exponents use duals. The formula is a labelled example, not an unproved identification of ν with a determinant on every model.

Proof/construction:

1. Import the GU(1,1) PEL datum and decomposition from M0/M3/M5.
2. Use the graded-frame associated functor, retaining the source’s formal Tate twist and cohomology/dual convention.
3. Apply coefficientGaloisDescent when swapping τ and barτ; import any extra central stabilizer condition from ineffectiveFibreDescent.

Inputs: `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `AutomorphicBundles:B0/coefficient-galois-descent`, `AutomorphicBundles:B0/ineffective-fibre-descent`, `PELModuli:M0`, `PELModuli:M3`, `PELModuli:M5`.

Planning API:

- `AutomorphicBundles.unitaryCoefficient_formula` (characterisation): The labelled weight coefficient is ω_τ^k⊗ω_barτ^l⊗ν^n.
- `AutomorphicBundles.unitaryCoefficient_dual` (functoriality): The dual weight is (−k,−l;−n), with dualized similitude line.
- `AutomorphicBundles.unitaryCoefficient_conjugate` (compatibility): The embedding permutation transports (k,l;n) to (l,k;n) and the transported PEL coefficient.

Uses:

- HLTT Appendix B.8: Checks the explicit unitary Levi coefficient, canonical frame and formal Tate twist.
- B4 rational coefficient field: Tests Galois permutation of labelled factors.

Unit tests:

- `AutomorphicBundles.unitaryCoefficient_test_unit` (degenerate): Weight (0,0;0) gives O.
- `AutomorphicBundles.unitaryCoefficient_test_line` (computation): Weight (1,0;0) gives ω_τ, while (0,1;0) gives the differently labelled ω_barτ.
- `AutomorphicBundles.unitaryCoefficient_test_twist` (non-example): Weight (0,0;1) is ν, so erasing the formal similitude/Tate line loses a coefficient even when k=l=0.

Acceptance: Complex conjugation swaps the two labelled Hodge-line factors; a nonparallel pair (k,l) is not fixed merely because the underlying Shimura datum is.

Sources: [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf), Appendix B.8, pp.270–271 — The finite locally free coefficient and its semi-abelian boundary model.; [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §2.3, pp.669–670 — The tensor-frame/filtration construction in the version of record..

### Rational forms and field base change

`AutomorphicBundles:B4/number-field-forms-base-change` — theorem. Proposed name: `AutomorphicBundles.numberFieldFormsBaseChange`.

For proper SΣ/L and coherent canonical or subcanonical coefficients, the form space is finite-dimensional over L and, for any field extension L′/L, H⁰(SΣ,F)⊗_L L′≃H⁰(SΣ,L′,F_L′). Under L↪C it identifies the L-rational subspace of the analytic classical/cusp space. Products and compatible coefficient maps commute with this base change. The theorem does not assert analogous flat base change for every integral special fibre.

Proof/construction:

1. Use proper coherent finiteness and flat field base change for degree-zero cohomology from the recorded coherent-sheaf foundation.
2. Use canonicalRationalDescent to identify the coefficient after base change.
3. Apply analyticClassicalComparison and the tensor maps from classicalForms/cuspForms.

Inputs: `AutomorphicBundles:B4/classical-forms`, `AutomorphicBundles:B4/cusp-forms`, `AutomorphicBundles:B3/canonical-rational-descent`, `AutomorphicBundles:B4/analytic-classical-comparison`.

Acceptance: A characteristic-zero field extension is flat; reduction modulo p may have extra forms and is not covered.

Sources: [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf), III §7, Proposition 7.3, pp.61–62 — The present finiteness proof uses the proper extension model, retaining the source’s open-space caveat..

### The classical VB coefficient normalization

`AutomorphicBundles:B4/classical-vb-tate-normalization` — comparison. Proposed name: `AutomorphicBundles.classicalVBTateNormalization`.

In the Hodge-type setting of BCGP §4.5, fix a neat tame level K^p, a p-adic coefficient field E large enough for the split group/reflex embeddings, compatible toroidal fans, and the separately constructed rational Hodge–Tate map/universal M torsor and VB functor. For a finite-dimensional algebraic Levi coefficient L_κ, identify VB⁰_Σ(L_κ)=ω^{κ,sm}(κ(μ)), where ω^{κ,sm}=colim_Kp ω^κ_Kp is the classical smooth canonical coefficient with rational structure. The μ-weight Tate twist is part of this comparison; it is absent from the untwisted coherent convention of §4.8. The action moves fans and is compared on compatible refinements.

Proof/construction:

1. Use automorphicVectorBundle and canonicalExtension to supply the finite-dimensional rational coherent coefficient on every level.
2. Compare the separately supplied rational Hodge–Tate M torsor with the canonical dR/graded frame torsor, using its actual rationality theorem; this is the recorded downstream comparison gap, not a new early-stage dependency on T2/T6.
3. Compute μ’s action on L_κ and its Tate normalization. Pass to the smooth colimit and compare Hecke maps on refinements.

Inputs: `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `AutomorphicBundles:B1/filtration-reduction`, `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B2/levi-highest-weight-convention`, `AutomorphicBundles:B1/principal-hecke-pullback`, `AutomorphicBundles:B3/fan-independent-sections`.

Acceptance: For the tensor unit κ=0 the twist is zero. In §4.8 the underlying coherent ω^κ is used without retaining the §4.5 twist twice.

Sources: [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645), §4.5, proof end p.78 — Fixes coefficient/dual/twist conventions for the added source; higher cohomology is outside this part..

## Supplier contracts

- `AlgebraicModuliForArithmeticGeometry:R09.5`: In characteristic zero, vector bundles on tame finite quotient/coarse moduli charts descend iff all geometric stabilizers act trivially on fibres; give the effective quotient and pullback equivalence, with the finite/tame hypotheses.

- `ComplexComparisonPartII:C0`: Analytification of algebraic module/torsor descent maps and compatibility of finite locally free associated coefficients with analytification on the open base. This request does not assert essential surjectivity/GAGA for arbitrary nonproper spaces.

- `AbelianSchemesAndArithmeticModuli:A4`: For the actual universal abelian schemes, locally free relative H¹dR with Hodge exact sequence and Gauss–Manin connection, Betti/Tate homology duals and tensor/Tate-compatible relative degree-one comparisons, with base-change hypotheses.

- `PELModuli:M0`: The actual symplectic and GU(1,1) PEL data, their standard representations and compact-dual filtration types, including similitude/Tate line and labelled imaginary-quadratic embeddings.

- `PELModuli:M3`: Fine-level universal abelian families and their analytic uniformization over the canonical generic field; moduli realizations for the chosen Siegel/unitary/Hodge embedding, not arbitrary-prime integral models.

- `PELModuli:M5`: The explicit Siegel and split GU(1,1) example: rank-g Hodge bundle for Siegel; rank-two H_τ and rank-one ω_τ for signature (1,1), with the specified polarizations and labelled dual/twist conventions.

- `ShimuraVarieties:V3`: Finite-level tower, level changes and Hecke translation morphisms, with their actual subgroup/effectiveness hypotheses and composition laws.

- `ShimuraVarieties:V4`: CM special-point/reflex-norm reciprocity with an explicit Artin convention and the canonical special-point normalization; do not replace the period torsor by a chosen rational frame.

- `ShimuraVarieties:V5`: Canonical Siegel/PEL model and its actual universal family, comparison of the analytic family with the fine-level moduli model.

- `ShimuraVarieties:V6`: Connected/nonconnected equivalence and central-isogeny/finite-component quotient descent for Hodge/abelian-type canonical varieties; the torsor and absolute-Hodge moduli theorem are owned here.

- `ShimuraVarieties:V7`: Actual general conjugate connected data/varieties, auxiliary totally real and CM extensions, generating type-A1 subdata (including the Lie/root bracket generation used in Milne 1988 §9), uniqueness, continuous/effective descent and independence of special point. Supply variety reduction, not a principal-bundle axiom.

- `ShimuraVarieties:V8`: Canonical finite étale arithmetic level tower over the reflex field for the indicated Hodge/abelian-type class; no invocation of V8.general is needed in the early family construction.

- `ShimuraVarieties:V8.general`: The general-data canonical full tower over E, compatible with the connected reduction, CM normalization, component induction and finite étale level maps.

- `ShimuraCompactifications:C1`: The noetherian proper minimal compactification and its actual open Shimura model, with boundary strata and the datum/level hypotheses.

- `ShimuraCompactifications:C2`: The actual smooth characteristic-zero toroidal gluing for neat effective level/smooth fan; properness and projectivity for a projective admissible fan; reduced Cartier SNC boundary, arithmetic overlap maps and the proper map to the minimal model over the reflex field.

- `ShimuraCompactifications:C3`: Refinement maps, composition/common refinements, f_*O=O, compatible extended datum/Hecke maps; additionally f_*I_(D′red)=I_(Dred) for the smooth toric boundary refinement charts and descended toroidal maps. No arbitrary subcanonical pullback equality or higher-direct-image vanishing is requested.

- `ShimuraCompactifications:C4`: Actual semi-abelian/1-motive degeneration families and filtered/graded tensor-compatible Lie/Hodge modules on cusp charts, with transition/effectivity, polarization/endomorphism compatibility and relative du/u distinct from base dq/q.

- `ShimuraCompactifications:C5`: Good-base integral PEL degeneration/compactification charts and locally free Hodge modules; positive Hodge line, graded-section finite generation, sufficiently divisible minimal invertible line and proper toroidal-to-minimal map. Preserve the source good-prime hypotheses.

- `ShimuraCompactifications:C6`: The Hilbert and modular degeneration specialization, its actual unit quotient and semi-abelian Hodge module, including the separately stated ramified/Rapoport hypotheses; scalar Koecher extension does not imply cuspidality.

- `ShimuraCompactifications:C2.general`: Actual general-data characteristic-zero toroidal gluing/descent, rational cusp charts and reduced boundary. No missing general-data universal abelian family or all-prime integral model is assumed.

- `ShimuraCompactifications:C3.general`: General-data refinement/common-refinement and compatible boundary/Hecke maps, including transported fans under conjugation; import the C3 degree-zero boundary-ideal comparison with its hypotheses.

- `ComplexComparisonPartII:C2`: Projective coherent GAGA on the actual proper smooth projective complex toroidal model, comparing global sections of canonical and reduced-boundary coefficients. It is not applied to the nonproper Shimura open.

- `AlgebraicModularFormsAndSerreWeights:R15.1`: The actual modular Hodge line/cusp ideal, proper generalized-elliptic model, geometric form spaces and analytic comparison at all cusps, including stabilizer descent at small levels. Only the GL2 specialization comparison is owned here.

- `HilbertModularVarietiesAndShimuraCurves:H0`: The actual Res(F/Q)GL2 versus G* datum, centre/effective quotient, reflex field and embedding permutation conventions.

- `HilbertModularVarietiesAndShimuraCurves:H1`: The actual O_F-linear HB family and unsplit O_F⊗O Hodge/de Rham modules, polarization structures and rank conditions.

- `HilbertModularVarietiesAndShimuraCurves:H2`: Rapoport-locus local freeness (rank one over O_F⊗O) and precise ramified integral hypotheses; no split decomposition or smoothness of the whole ramified model is assumed.

- `HilbertModularVarietiesAndShimuraCurves:H3`: The precise finite polarization/unit quotient Δ(N) preserving the moduli problem, with its actual action on the HB family.

- `HilbertModularVarietiesAndShimuraCurves:H4`: Full G/G* central level kernels, ineffective unit action, and the stabilizers at the selected effective level.

- `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-2-the-weyl-construction-via-young-symmetrizers`: The GL_n(C)-equivariant Schur image, extreme symmetric/exterior cases and natural tensor/coefficient action. Its general-number-field and integral locally free sheaf extension is an explicit separate gap, not silently included in this complex theorem.

- `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-3-maximal-torus-weights-and-the-highest-weight-classification`: Highest-weight and determinant-twist classification for the classical complex matrix groups, including the central character and dual highest weight; general nonsplit Levi representations require the separate descent interface.

- `AutomorphicBundles:B5`: For BCGP v1 §4.8.2 (p.101), GSp4, d=3, dominant κ=(k1,k2;w) with 0≥k1≥k2 and the stated parity, prove H^i_et(Sh,Vκ∨)⊗C_p=⊕_{j=0}^3 H^{i−j}(Sh,ω^{κ_j})(−a_j), κ_j=(k1,k2;−w),(2−k1,k2;−w),(3−k2,k1+1;−w),(3−k2,3−k1;−w), and 2a_j=k1+k2+w,2−k1+k2+w,4−k2+k1+w,6−k1−k2+w. Prove the parallel compact-support/cuspidal statement with ω^{κ_j}(−D_red). Preserve the untwisted §4.8 coherent convention; do not count the §4.5 κ(μ) twist twice. This is a downstream consumer request; it is outside the prerequisites of the supplied coefficients.


## Open proof and interface refinements

### Generic algebraic associated-bundle interface has no nominated stage

The campaign nominates ReductiveGroupsPartII for principal algebraic G torsors, contracted products, G-equivariant bundle descent, pullback and exact tensor/dual functoriality. Its current RG2.0–RG2.5 stages cover different targets and contain no such stage. Add an explicitly assigned extension stage rather than duplicating that construction here. QCoh fpqc descent alone does not construct representable principal/associated bundles. Analytic torsor pullback and analytification compatibility must be matched to this interface.

Needed by: `AutomorphicBundles:B0/compact-dual-coefficient`, `AutomorphicBundles:B0/homogeneous-hodge-torsor`, `AutomorphicBundles:B0/analytic-coefficient`, `AutomorphicBundles:B0/sections-equivariant`, `AutomorphicBundles:B0/geometric-analytic-coefficients`, `AutomorphicBundles:B1/tensor-frame-torsor`, `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `AutomorphicBundles:B2/coefficient-tensor-hecke`, `AutomorphicBundles:B2.general/general-associated-model`.

### Reductive algebraic group interfaces beyond the current supplier scope

Needed are the precise central Z_s torus and quotient universal property, algebraic frame/stabilizer representability, characteristic-zero Chevalley tensor realization and semisimplicity, and general algebraic Levi highest-weight/dual classification over splitting fields. Upstream ClassicalGroups supplies the complex classical Schur/highest-weight cases, not all Q-groups, nonsplit descent or integral Schur sheaves. These extensions belong in the reductive/representation direction, not as private automorphic replacements.

Needed by: `AutomorphicBundles:B0/central-split-quotient`, `AutomorphicBundles:B1/finite-tensor-stabilizer`, `AutomorphicBundles:B1/tensor-frame-torsor`, `AutomorphicBundles:B1/embedding-independence`, `AutomorphicBundles:B2/levi-highest-weight-convention`, `AutomorphicBundles:B4/siegel-coefficient`, `AutomorphicBundles:B2/siegel-tautological-sequence`.

### Absolute-Hodge foundation and CM proof refinement

Deligne 2018 author copy Main Theorem 2.11, Principles B and Proposition 6.1 were read. The CM proof through Principles A, split Weil classes and the character computation of §§3–5 was not decomposed in this target pass. A4 supplies degree-one comparisons, not the absolute-cycle theorem. Refine the absoluteHodgePropagation node with the absolute-cycle carrier, CM-case theorem and the deformation/generation proof before calling B1 closed.

Needed by: `AutomorphicBundles:B1/absolute-hodge-propagation`, `AutomorphicBundles:B1/hodge-tensor-realizations`, `AutomorphicBundles:B1/tensor-frame-torsor`.

### Period torsor and continuous principal-bundle descent

V4/V7 provide CM reciprocity and canonical variety descent, not a complete typed Taniyama/period torsor or effective descent of a principal scheme with connection. Specify the period torsor and normalized CM restriction, full-tower induction, continuity and effectivity of the bundle descent datum. Harris’s annotated errata acknowledges continuity in the historical Aut(C) argument; a cocycle alone is insufficient.

Needed by: `AutomorphicBundles:B1/cm-principal-normalization`, `AutomorphicBundles:B1/hodge-canonical-principal-bundle`, `AutomorphicBundles:B1/abelian-canonical-principal-bundle`, `AutomorphicBundles:B1.general/connected-principal-conjugation`, `AutomorphicBundles:B1.general/general-principal-model`, `AutomorphicBundles:B1.general/general-conjugation-cocycle`, `AutomorphicBundles:B2.general/general-realization-conjugation`.

### The second-jet injection and general principal reduction

Milne connected §§3,7,9 were read. Generic second-jet bundles and their equivariant functoriality are not assigned to a current supplier stage, and Lemma 9.4 refers to the corrected Harris 1985 jet injection. Supply that faithful order-two realization and the principal-automorphism argument of Lemmas 9.1–9.3; V7 is requested for the actual generating rank-one subdata, not assumed to prove the bundle step.

Needed by: `AutomorphicBundles:B1.general/adjoint-jet-realization`, `AutomorphicBundles:B1.general/general-connected-reduction`, `AutomorphicBundles:B1.general/connected-principal-conjugation`.

### Full-group local-system and filtered-connection descent interfaces

Construct or import the actual arithmetic quotient local system, continuous ℓ-adic lattice descent on the canonical coefficient tower, filtered algebraic connection descent and the tensor-compatible analytic horizontal-section comparison. Degree-one abelian A4 comparisons handle the family case but do not by themselves state these general associated-representation interfaces. Keep rational Betti weight and coefficient-group hypotheses explicit.

Needed by: `AutomorphicBundles:B2/betti-coefficient-local-system`, `AutomorphicBundles:B2/etale-coefficient-local-system`, `AutomorphicBundles:B2/filtered-de-rham-coefficient`, `AutomorphicBundles:B2/realization-comparison`, `AutomorphicBundles:B2.general/general-flat-realizations`, `AutomorphicBundles:B2.general/general-realization-conjugation`.

### The ineffective arithmetic centre beyond finite tame quotients

R09.5’s finite/tame coarse-space statements do not alone prove descent through an infinite arithmetic central kernel. Give the analytic effective quotient and algebraic coefficient-group compatibility, proving that the fibre action is trivial on that kernel. Use H0/H3/H4 for the Hilbert groups; do not infer this from neatness.

Needed by: `AutomorphicBundles:B0/ineffective-fibre-descent`, `AutomorphicBundles:B0/analytic-coefficient`, `AutomorphicBundles:B4/hilbert-central-descent`.

### Canonical extension proof and logarithmic boundary dictionary

Milne V §6 states the exact canonical extension functor and rationality; HLTT B.8 gives the semi-abelian frame model. The complete Deligne–Harris local analytic construction, chart transition/gluing, general-data extension without abelian degenerations, regular singularity/unipotence and zero-exponent logarithmic comparison still need declaration-sized refinements. No current generic regular-singular connection supplier stage was found. Integral PEL extensions remain conditional on C5’s specific good-base coefficients.

Needed by: `AutomorphicBundles:B3/boundary-coefficient-chart`, `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B3/canonical-extension-gluing`, `AutomorphicBundles:B3/logarithmic-connection-extension`, `AutomorphicBundles:B3/canonical-rational-descent`, `AutomorphicBundles:B3.general/general-canonical-extension`, `AutomorphicBundles:B3.general/general-logarithmic-comparison`.

### Coherent geometric section foundations and local analytic growth

The pin contains Scheme.Modules and its presheaf/pushforward/global-section operations, freshly read, but the exact proper coherent finiteness/base-change, locally free tensor/ideal dictionary and holomorphic logarithmic-growth removable-singularity/coordinatewise vanishing interfaces need suppliers/refinement. A section comparison does not follow from ordinary GAGA on the open Shimura variety. The course-note full Dolbeault resolutions were not used to close this chain.

Needed by: `AutomorphicBundles:B3/subcanonical-extension`, `AutomorphicBundles:B3/minimal-coherent-pushforward`, `AutomorphicBundles:B4/classical-forms`, `AutomorphicBundles:B4/cusp-forms`, `AutomorphicBundles:B4/analytic-classical-comparison`, `AutomorphicBundles:B4/number-field-forms-base-change`.

### BCGP analytic/solid and rational Hodge–Tate coefficient comparison

BCGP v1 §§3.2.19,4.5 and 4.8 were read. The finite-dimensional algebraic tautological sequence is planned here. Its embedding into the solid analytic category and the rational Hodge–Tate M-torsor/VB functor are separately supplied inputs to classicalVBTateNormalization. T2/T6 consume B1–B3; reversing those dependencies would make a cycle. Refine the downstream comparison interface and rationality/Tate normalization (BCGP p.78 cites RC22 Theorem 4.2.1) before claiming the complete p-adic comparison. No infinite-dimensional category is rebuilt here.

Needed by: `AutomorphicBundles:B2/siegel-tautological-sequence`, `AutomorphicBundles:B4/classical-vb-tate-normalization`, `AutomorphicBundles:B4/siegel-coefficient`.

### Added AG source: integral CM étale extension is outside the generic owner

AG §3.3 constructs lisse coefficients on the specific CM integral stack Y_K[1/ℓ] using its finite étale integral ℓ-level tower; its extension is stronger than the generic-fibre coefficient in B2. The reviewed paper extraction marks this extension missing. Assign/import the CM torus integral tower and finite étale model before adding the integral extension theorem; do not silently attribute it to generic Shimura B2 or to all-prime models.

Needed by: `AutomorphicBundles:B2/etale-coefficient-local-system`.

### Typed geometric signatures need the actual supplier carriers

At the pins no canonical Shimura torsor/compact-dual automorphic coefficient/toroidal canonical extension carrier was found. The suggested file therefore contains the precise named mathematical contracts for these declarations, APIs and tests in comments, not fabricated Prop axioms or arbitrary scheme surrogates. Functional normalized factors, the SlashAction adapter, arithmetic Hilbert weights and global sections of a supplied Scheme.Modules coefficient are typed. The geometric contracts and their test signatures must be elaborated once the named supplier interfaces exist. This is explicitly open, not evidence that the geometric suggested signatures compiled.

Needed by: `AutomorphicBundles:B0/central-split-quotient`, `AutomorphicBundles:B0/ineffective-fibre-descent`, `AutomorphicBundles:B0/hodge-parabolic-convention`, `AutomorphicBundles:B0/compact-dual-coefficient`, `AutomorphicBundles:B0/homogeneous-hodge-torsor`, `AutomorphicBundles:B0/analytic-coefficient`, `AutomorphicBundles:B0/sections-equivariant`, `AutomorphicBundles:B0/coefficient-galois-descent`, `AutomorphicBundles:B0/geometric-analytic-coefficients`, `AutomorphicBundles:B1/finite-tensor-stabilizer`, `AutomorphicBundles:B1/absolute-hodge-propagation`, `AutomorphicBundles:B1/hodge-tensor-realizations`, `AutomorphicBundles:B1/tensor-frame-torsor`, `AutomorphicBundles:B1/filtration-reduction`, `AutomorphicBundles:B1/hodge-canonical-principal-bundle`, `AutomorphicBundles:B1/embedding-independence`, `AutomorphicBundles:B1/cm-principal-normalization`, `AutomorphicBundles:B1/abelian-canonical-principal-bundle`, `AutomorphicBundles:B1/principal-hecke-pullback`, `AutomorphicBundles:B1.general/connected-principal-conjugation`, `AutomorphicBundles:B1.general/adjoint-jet-realization`, `AutomorphicBundles:B1.general/general-connected-reduction`, `AutomorphicBundles:B1.general/general-principal-model`, `AutomorphicBundles:B1.general/general-compact-dual-map`, `AutomorphicBundles:B1.general/general-conjugation-cocycle`, `AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `AutomorphicBundles:B2/automorphic-analytic-comparison`, `AutomorphicBundles:B2/levi-highest-weight-convention`, `AutomorphicBundles:B2/betti-coefficient-local-system`, `AutomorphicBundles:B2/etale-coefficient-local-system`, `AutomorphicBundles:B2/filtered-de-rham-coefficient`, `AutomorphicBundles:B2/realization-comparison`, `AutomorphicBundles:B2/coefficient-tensor-hecke`, `AutomorphicBundles:B2.general/general-associated-model`, `AutomorphicBundles:B2.general/general-flat-realizations`, `AutomorphicBundles:B2.general/general-realization-conjugation`, `AutomorphicBundles:B3/boundary-coefficient-chart`, `AutomorphicBundles:B3/canonical-and-subcanonical-extensions`, `AutomorphicBundles:B3/canonical-extension-gluing`, `AutomorphicBundles:B3/subcanonical-extension`, `AutomorphicBundles:B3/refinement-canonical-extension`, `AutomorphicBundles:B3/fan-independent-sections`, `AutomorphicBundles:B3/logarithmic-connection-extension`, `AutomorphicBundles:B3/minimal-coherent-pushforward`, `AutomorphicBundles:B3/minimal-hodge-line-comparison`, `AutomorphicBundles:B3/canonical-rational-descent`, `AutomorphicBundles:B3.general/general-canonical-extension`, `AutomorphicBundles:B3.general/general-logarithmic-comparison`, `AutomorphicBundles:B3.general/general-boundary-functoriality`, `AutomorphicBundles:B4/cusp-forms`, `AutomorphicBundles:B4/analytic-classical-comparison`, `AutomorphicBundles:B4/gl2-hodge-line-comparison`, `AutomorphicBundles:B4/hilbert-coefficient`, `AutomorphicBundles:B4/hilbert-central-descent`, `AutomorphicBundles:B4/unsplit-hilbert-descent`, `AutomorphicBundles:B4/siegel-coefficient`, `AutomorphicBundles:B4/unitary-coefficient`, `AutomorphicBundles:B4/number-field-forms-base-change`, `AutomorphicBundles:B2/siegel-tautological-sequence`, `AutomorphicBundles:B4/classical-vb-tate-normalization`.

## Added-paper accounting

- `PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/betti-system`: Generic representation-valued construction applies to the torus; the generic Betti construction is rational; the ℓ-adic input retains its specified integral lattice. Targets: `AutomorphicBundles:B2/betti-coefficient-local-system`, `AutomorphicBundles:B2/realization-comparison`.

- `PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/ell-system`: Generic-fibre comparison is covered; integral Y_K[1/ℓ] tower extension remains the explicit CM supplier gap. Targets: `AutomorphicBundles:B2/etale-coefficient-local-system`, `AutomorphicBundles:B2/realization-comparison`.

- `PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/dr-descent`: Includes E-linear full-group coefficient descent; filtered Q-representation conclusion is separate. No integral dR extension is inferred. Targets: `AutomorphicBundles:B1/tensor-frame-torsor`, `AutomorphicBundles:B1/embedding-independence`, `AutomorphicBundles:B2/filtered-de-rham-coefficient`.

- `PAPER-CARAIANI-SCHOLZE-17/128`: The finite tensor stabilizer theorem is explicitly owned by B1, as the routing requires. Targets: `AutomorphicBundles:B1/finite-tensor-stabilizer`, `AutomorphicBundles:B1/hodge-tensor-realizations`, `AutomorphicBundles:B1/tensor-frame-torsor`, `AutomorphicBundles:B1/filtration-reduction`.

- `PAPER-BOXER-CALEGARI-GEE-PILLONI-25/3.2.19-tautological`: Finite-dimensional algebraic coefficient and exact sequence here; analytic/solid comparison remains an explicit interface gap. Targets: `AutomorphicBundles:B2/siegel-tautological-sequence`, `AutomorphicBundles:B4/siegel-coefficient`.

- `PAPER-BOXER-CALEGARI-GEE-PILLONI-25/4.5-classical`: The exact κ(μ) Tate normalization is planned conditional on the separately constructed rational Hodge–Tate torsor and VB functor. Targets: `AutomorphicBundles:B4/classical-vb-tate-normalization`.

- `PAPER-BOXER-CALEGARI-GEE-PILLONI-25/4.8.2-usual`: The untwisted classical coefficients are supplied here. Higher étale/coherent Hodge–Tate decomposition is a precise B5 request, outside this part. Targets: `AutomorphicBundles:B4/siegel-coefficient`, `AutomorphicBundles:B4/classical-vb-tate-normalization`.

- `PAPER-BOXER-CALEGARI-GEE-PILLONI-25/4.8.2-cusp`: The reduced-boundary coefficient is supplied here. Compact-support/coherent comparison is requested from B5, not claimed as an H0 theorem. Targets: `AutomorphicBundles:B3/subcanonical-extension`, `AutomorphicBundles:B4/cusp-forms`.


## Source readings and corrections

The readings below are the accessed copies, not an assertion that every referenced book/chapter was decomposed. Exact URL, fresh SHA-256 and access date are in the packet. In particular, Deligne’s intermediate CM proof, Harris’s original 1985 jet proof and the full Deligne–Harris boundary proof remain explicit refinements.

- [Canonical models of (mixed) Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/xnotes/AA.pdf) — J. S. Milne. Author TeX revision, 11 March 2018, of the 1990 article; corrected version, not the original scan. Read: III §§1–8, pp.52–64; V §6, pp.90–91.

- [Automorphic vector bundles on connected Shimura varieties](https://jmilne.org/math/articles/1988aT.pdf) — J. S. Milne. Author TeX copy of Invent. Math. 92 (1988), pp.91–128. Read: §3 Proposition 3.9, Theorem 3.10 and Corollary 3.11, pp.18–20; §7, pp.29–31; §9, pp.33–34.

- [An Example-Based Introduction to Shimura Varieties](https://www.kwlan.org/articles/intro-sh-ex.pdf) — Kai-Wen Lan. Public author PDF served 6 October 2026. Read: §4.2.7, pp.49–50 (including visual check of p.49); §5.3, pp.63–64.

- [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf) — F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera. Version of record, Annals of Mathematics 187 (2018), 391–531. Read: §3.3, pp.418–419; §3.4, pp.419–421; §3.5 Proposition 3.5.1, pp.421–422.

- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf) — A. Caraiani, P. Scholze. Version of record, Annals of Mathematics 186 (2017), 649–766. Read: §2.2, pp.666–667; §2.3, pp.667–671.

- [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645) — G. Boxer, F. Calegari, T. Gee, V. Pilloni. arXiv:2502.20645v1, 28 February 2025; downloaded response identifies v1. Read: §3.2.13–3.2.19, pp.44–45; §4.5 classical bundle comparison, pp.72–74 and 77–78; §4.8.1–4.8.2, pp.101–102.

- [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf) — M. Harris, K.-W. Lan, R. Taylor, J. Thorne. Public author manuscript rigcoh.pdf; not collated against the journal. Read: Introduction, pp.2–4; §3.4.1, pp.109–110; Appendix B.8, pp.270–271.

- [Beilinson–Bernstein localization over Q and periods of automorphic forms](https://webusers.imj-prg.fr/~michael.harris/BBlocalization_web.pdf) — M. Harris. Public author manuscript; publication collation not claimed. Read: Introduction, pp.1–2; §1.4, Theorem 1.4.2 and (1.4.3), pp.10–11.

- [Vector bundles (Cours 2013, 4fibres)](https://webusers.imj-prg.fr/~michael.harris/Cours_2013/4fibres.pdf) — M. Harris. Public author course notes, not a version of record. Read: Entire short note.

- [Logarithmic growth (Cours 2013, 8logarithmique)](https://webusers.imj-prg.fr/~michael.harris/Cours_2013/8logarithmique.pdf) — M. Harris. Public author course notes; findings scoped to this copy. Read: Entire short note, pp.1–3.

- [Torus embeddings (Cours 2013, 7torique)](https://webusers.imj-prg.fr/~michael.harris/Cours_2013/7torique.pdf) — M. Harris. Public author course notes; findings scoped to this copy. Read: pp.1–4; beginning of p.5.

- [Hodge cycles on abelian varieties](https://jmilne.org/math/Documents/Deligne82.pdf) — P. Deligne (notes by J. S. Milne). Revised author TeX copy, 1 October 2018, of LNM 900 (1982), pp.9–100. Read: §2 Main Theorem 2.11 and Principles B 2.12/2.15, pp.19–21; §3 Proposition 3.1 and Remark 3.2, pp.22–23; §6 proof completion, Proposition 6.1, pp.41–42; intermediate CM proof not decomposed.


Source findings are scoped to the exact versions read and await independent verification; the Lan convention finding is already known. The course-note errors are not allegations against the published Harris–Phong or toroidal theorems.

- `AutomorphicBundles/E1`, §4.2.7(1), printed p.49, author PDF downloaded 2026-10-06; visually checked at that page: j(γ′γ,Z)=j(γ′,γZ)j(γ,Z) for the displayed left action. Check: Compose the two frame changes. A point-dependent frame factor u(gx)u(x)⁻¹ obeys the shifted law and generally violates the printed unshifted law. The page image confirms the omitted argument; some web-extracted summaries silently insert it. Known status: Existing independently reviewed AutomorphicBundles convention finding (REV-EXT-10/REV-EXT-07, integrated decomposition, September 2026); reverified here, not claimed new.

- `AutomorphicBundles/E2`, p.1, first Lemma, 8logarithmique.pdf course-note author copy accessed 2026-10-06: Exclude N=−1 in the power-bound lemma; at N=−1 the primitive can have log|log r| growth. For the applications to growth by some power, use a nonnegative exponent; for rapid decay use a separate corrected estimate. Check: Take g(z)=1/(bar(z) log|z|). It satisfies the displayed N=−1 bound, but the circular mean of a solution grows as 2 log(−log r), so no bounded solution (the stated N+1=0 bound) exists. The p.2 estimate also divides by N+1. Known status: new (scoped only to this author course-note copy, not the published Harris–Phong theorem).

- `AutomorphicBundles/E3`, p.3, second fine-resolution display, course-note author copy accessed 2026-10-06: Use A_rd in every degree in the rapid-decay resolution. The mixed rd/si display is not the claimed resolution. Check: On a punctured disk dbar(z)/bar(z) lies in the slowly increasing degree-one term and is closed, but has no rapidly decreasing primitive at zero (its circular-mean primitive is proportional to log r). Hence the displayed degree-one cohomology is nonzero. Known status: new (course-note display only; intended uniform rd notation is clear from the surrounding definition).

- `AutomorphicBundles/E4`, p.3, proof of the Corollary immediately before the globalization paragraph, course-note author copy accessed 2026-10-06: Differentiation of the disk Cauchy–Green operator requires a boundary term or a compact-support/cutoff formulation; include that term before deriving the logarithmic derivative estimates. Check: On a disk of radius R, for g(w)=w² the normalized ∂bar solution defined by this disk integral is I(g)=z²bar(z)−R²z. Its z derivative is 2zbar(z)−R², whereas I(2w)=2zbar(z)−2R². Their difference is R². The omitted boundary term is holomorphic but nonzero. Known status: new (scoped to the integral identity in this course-note copy; no claim that the intended growth theorem is false).

- `AutomorphicBundles/E5`, p.3, paragraph after the affine orthant example, 7torique.pdf course-note author copy accessed 2026-10-06: This holds for the appropriately simplicial cones over a real basis; lattice-basis identification with an orthant face additionally requires regularity. Arbitrary rational polyhedral cones need not be simplicial. Check: The three-dimensional rational cone with four extreme rays (1,0,1),(−1,0,1),(0,1,1),(0,−1,1) cannot be carried to a three-dimensional orthant face, which has three extreme rays. Even simplicial integral cones can fail to be unimodular. Known status: new (scoped only to the author course notes; the packet imports actual smooth/refined toric charts from C2/C3 instead).


## Structural proposal and baseline checks

AutomorphicBundles B0 names a generic associated algebraic bundle supplier, but none of ReductiveGroupsPartII RG2.0–RG2.5 contains principal torsors/contracted products. Current torus quotient and algebraic tensor-frame interfaces also need explicit assignment. Add an explicitly scoped extension stage in the reductive-group direction for representable principal algebraic torsors, associated finite locally free bundles and their exact tensor/dual/pullback/analytification descent API. Keep compact-dual coefficients, canonical Shimura principal models, realization comparison and boundary extensions in AutomorphicBundles. Assign central quotient and generic representation refinements before accepting the B0 structural closure. No new stage ID is invented in this packet.

The reviewed library audit and pinned source readings keep scalar modular forms, SlashAction, module equivalences and scheme module/global-section operations as baseline inputs. The generated SlashAction.slash_mul field was read and checked by Lean but is not separately listed in the static declaration index; the packet cites its parent class. The fresh validator uses the supplied pinned declaration index. The handoff records elaboration results and exact limits.
