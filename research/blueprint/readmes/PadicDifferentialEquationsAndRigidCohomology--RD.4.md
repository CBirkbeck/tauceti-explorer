# P-adic differential equations and rigid cohomology — RD.4

RD.4 constructs rigid cohomology with ordinary, closed and compact support, then connects it to dagger de Rham realizations and to logarithmic proper support. The coefficient and tube theory comes from RD.3. Finiteness and duality belong to RD.5; Frobenius weights belong to RD.6. The comparisons here provide the cohomology objects to which those results apply.

This continuation imports the existing RD.4 targets. It adds the descent theorem needed for their frame comparisons, the unrestricted Gysin target, the log support complexes and their spectral sequences, the special-fibre dagger comparison, specialization maps and the theta quotient used for Igusa curves. Generic derived categories, kernel submodules, quotient modules and algebraic étale differentials are library inputs.

## Conventions and interfaces

Let V be a complete mixed-characteristic discrete valuation ring with residue field k of characteristic p and fraction field K of characteristic zero. The usual frame and coefficient constructions use separated finite-type k-schemes. Statements involving q-Frobenius specify a compatible coefficient Frobenius and its pullback. For the log proper-support construction, κ is finite, W=W(κ), and K₀=Frac W. The base κ° is the standard log point, W° its Witt lift, W[t]° has the divisor log structure at t=0, and Wtriv has the trivial log structure.

All complexes are cohomologically graded. A shift C[−r] places a degree-zero class in degree r. For q-linear Frobenius, K(−1) has Frobenius q. Thus the codimension-c Gysin shift is [−2c] and its equivariant twist is (−c). Semilinear Frobenius is retained before taking a q-power; no arbitrary scalar change makes it linear.

A frame (X,X̄,𝔓) has X open in X̄ and a closed embedding of X̄ in a formal V-scheme smooth near X. Ordinary rigid cohomology is de Rham hypercohomology of its coherent j† coefficient realization on the closure tube. A closed support Z⊆X is imposed by the restriction kernel on that realization. Compact support is imposed in a proper ambient frame using the tube support complex. The ordinary support triangle has RΓ_Z(X) as the fibre of RΓ(X)→RΓ(X∖Z); it does not define compact support of an open X.

On a smooth affine weak lift with weak completion A†, the coefficient Monsky–Washnitzer complex is M⊗_(A†)Ω•_(A†/K). The inherited MW comparison supplies its canonical identification with rigid cohomology. A coherent connection admits the overconvergent coefficient interpretation only with the required Taylor convergence; invertible horizontal Frobenius provides it under Berthelot’s smooth weak-lift hypotheses.

Log proper support uses an open immersion U⊆X into a specified proper strictly semistable log scheme. The functor imposing support acts on tube sheaves before derived specialization. Its cohomology retains the parameter X. The boundary realization is log convergent cohomology. The identification of log convergent and log rigid cohomology for proper X does not change that boundary term into log rigid cohomology for a nonproper boundary.

The dagger space in the comparison is the dagger structure on a tube in a proper formal model. A generic algebraic open, an arbitrary rigid completion and this dagger tube carry different coefficient complexes. The formal-model and neighbourhood data in the theorem identify the object used by the comparison.

## Imported targets and ownership

The node prefix in the following table is `PadicDifferentialEquationsAndRigidCohomology:RD.4/`. Their complete contracts are imported from the [existing RD roadmap](PadicDifferentialEquationsAndRigidCohomology.md); this continuation introduces no second definition of them.

| Imported node suffix | Contract used here |
|---|---|
| monsky-washnitzer-cohomology | Coefficient de Rham cohomology of a smooth affine weak lift. |
| de-rham-trace | Trace on the finite coefficient de Rham realization. |
| finite-flat-pullback-injective | The inherited trace-assisted injective pullback, with its degree hypotheses. |
| finite-etale-pushforward-de-rham | Finite étale pushforward comparison at the differential-complex level. |
| overconvergent-de-rham-complex | j† coefficient forms and their integrable differential. |
| independence-of-embedding | Canonical ordinary-cohomology comparison between smooth frames. |
| independence-of-compactification | Canonical ordinary comparison for common proper compactification refinements. |
| rigid-cohomology | Ordinary hypercohomology on a frame, descended independently of the frame. |
| functoriality-of-rigid-cohomology | Pullbacks with coefficient transport and their composition laws. |
| compactly-supported-rigid-cohomology | The proper ambient tube support realization and its cohomology. |
| compact-support-independence-of-embedding | Comparison for compact-support complexes on smooth ambient embeddings. |
| compact-support-independence-of-compactification | Invariance for a proper modification identical on the open. |
| compact-support-functoriality | The inherited support-preserving maps with their stated hypotheses. |
| forget-supports-map | The natural compact-to-ordinary rigid map. |
| frobenius-vector-space | The semilinear Frobenius carrier and its coefficient conventions. |
| frobenius-on-rigid-cohomology | Canonical cohomological Frobenius from coefficient pullback. |
| excision-sequence | Compact-support excision for a closed/open decomposition. |
| rigid-cohomology-with-supports | The closed-support restriction-kernel realization. |
| localisation-sequence | Nested closed-support localization and the ordinary closed/open triangle. |
| tate-twist | The specified Frobenius scaling for a Tate twist. |
| frobenius-independent-of-lift | Coefficient Taylor comparison identifies the maps from different lifts. |
| monsky-washnitzer-comparison | The affine weak de Rham complex computes rigid cohomology. |
| compact-support-complex-of-affine-space | The affine-space supported de Rham calculation. |
| compact-support-cohomology-of-affine-space-with-coefficients | The inherited coefficient version with its actual coefficient hypotheses. |
| compactly-supported-cohomology-of-affine-space | H_c^(2d)(A^d)=K(−d), with other groups zero. |
| cohomology-of-multiplicative-group | H⁰(G_m)=K, H¹(G_m)=K(−1), represented by dlog x. |
| gysin-isomorphism | The liftable coordinate-pair purity calculation; the new target extends it. |
| finite-etale-pushforward-cohomology | Both ordinary and compact-support comparisons after finite étale pushforward. |
| finite-flat-base-change | Finite coefficient-field extension for ordinary and compact rigid cohomology. |
| mw-comparison-for-affine-curves | The inherited curve specialization of the affine MW comparison. |
| proper-rigid-equals-convergent | Proper ordinary rigid/convergent comparison with the inherited coefficients. |
| cohomology-of-affine-space | H⁰(A^d)=K and H^i=0 for i>0. |
| cohomology-of-projective-line | H⁰(P¹)=K and H²(P¹)=K(−1). |

RD.3 owns frames, tubes, j†, overconvergent isocrystals, strong fibration and the affine Frobenius/connection equivalence. `AdicSpacesPartII:F1` owns dagger algebras, spaces and differential forms, including larger-radius ambient support complexes. Its existing generic dagger/completion de Rham comparison is an input to the special-fibre comparison here. `CrystallineCohomology:CR.5` owns general log structures, log differentials, log smoothness, algebraic exactification and absolute component residues. Its requested weak-formal chart and exterior-residue extensions are distinct from the analytic realization comparisons proved in RD.4. `EnhancedDerivedSheaves:E1–E3` supplies the sheaf-derived, hypercover, totalization and inverse-limit interfaces. No stable or derived category is constructed again here.

The current CR.5 packet includes CR.6 clients for convergent log complexes and tube support and explicitly requests their analytic foundations from RD.4 or an RD Part II. The interfaces here supply those foundations. The packet proposes pointing those clients at these targets, while keeping log crystalline, log Witt and Hyodo–Kato comparisons in CR.6. Its further requests for Stein exhaustions, Fréchet topology and completed tensors lie outside this RD.4 pass.

## Proof refinements of the imported targets

These refinements add the hypotheses and proof route used by the new targets without creating duplicate nodes.

### Strong fibration theorem

Use Berthelot’s strong fibration theorem only with the proper compactification map, smooth formal map and chosen relative conormal coordinates. The result is an isomorphism of suitably shrunk strict-neighbourhood systems; it is not an unconditional global product of every tube with a disc.

The coordinate map is étale near the open subscheme. Shrink to strict neighbourhoods where the resulting map is invertible; the cofinal exhaustion uses simultaneously the closure-tube radius, the open-neighbourhood radius and increasing closed-disc radii.

**Imports:** `PadicDifferentialEquationsAndRigidCohomology:RD.3/strong-fibration-theorem`.

**Ownership:** RD.3; no duplicate RD.4 fibration node.

**Sources:** [BI] Théorème 1.3.7 and Remarque 1.3.8, global pp. 44–45 (I, pp. 20–21). Specifies the relative conormal-coordinate and cofinal strict-neighbourhood version.

### Sigma nabla module over dagger algebra

A finite module with integrable connection over a weak completion of a smooth V-algebra, equipped with a horizontal invertible Frobenius pullback map lifting residue Frobenius, has the required overconvergent Taylor isomorphism. Integrability without such Frobenius is not enough.

Choose local differential coordinates and a Frobenius-stable integral lattice. The derivative of a Frobenius lift is π-divisible, so iterating its horizontal isomorphism makes the connection matrices integral. On a Banach radius near one the normalized iterated derivatives converge for a small Taylor radius. Frobenius extends that radius by η_(n+1)=min(η_n^(1/p),η_n/c), |π|<c<1, so η_n tends to one; shrink the coefficient radius at each stage. Horizontality makes the expansions agree, giving the overconvergent diagonal stratification.

**Imports:** `PadicDifferentialEquationsAndRigidCohomology:RD.3/sigma-nabla-module-over-dagger-algebra`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/affine-smooth-description-of-overconvergent-f-isocrystals`.

**Ownership:** RD.3 coefficient theorem; request exact refinement there.

**Sources:** [BI] Théorème 2.5.7 and proof, global pp. 86–89 (II, pp. 40–43); §2.5.8, p. 89. The invertible horizontal Frobenius forces Taylor overconvergence and yields the affine coefficient equivalence.

### Independence of compactification

Ordinary cohomology is independent of the compactification and smooth frame through the canonical common-refinement comparisons.

Compare two compactifications via the closure of the diagonal, and two formal embeddings via their product. Apply the relative Poincaré comparison on a common frame. The diagram-resolution homotopy comparison makes the induced equivalence independent of further refinement.

**Imports:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/independence-of-compactification`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/independence-of-embedding`.

**Sources:** [CT03] Proposition 10.5.3, pp. 187–188; Corollaries 10.5.4–10.5.5, pp. 188–189. Descent and relative Poincaré give the ordinary independence comparisons.

### Compact support independence of compactification

For a proper map of compactifications identical on the open X and carrying boundary into boundary, compact-support cohomology is invariant.

Berthelot 1986 Théorème 4 states this invariant comparison. Its general support-respecting proof is not supplied by ordinary de Rham independence, and remains part of G1.

**Imports:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/compact-support-independence-of-compactification`.

**Sources:** [B86] Théorème 4, p. 23. States compact-support invariance under a proper change of compactification; the paper announces rather than proves the full result.

### Monsky washnitzer comparison

For a smooth affine weak lift, the functorial MW de Rham complex computes ordinary rigid cohomology, with the inherited coefficient hypotheses.

Take a projective closure of the weak affine lift. Its strict-neighbourhood affinoids have vanishing higher coherent cohomology, and their filtered global forms recover Ω•_(A†/K). Weak lifts of maps extend on a smaller radius; the graph common frame compares these maps with rigid pullback.

**Imports:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/mw-comparison-for-affine-curves`.

**Sources:** [B97] Proposition 1.10 and proof, pp. 15–16. The radius calculation and graph-frame comparison establish the MW identification and functoriality.

### Finite flat base change

Retain the inherited finite K′/K comparison for ordinary and compact supports, and its compatibility with closed-support triangles. It is finite scalar extension, not arbitrary relative smooth base change.

Use finite affinoid pushforward, flatness and filtered radius colimits to compare the coefficient realizations after scalar extension. Tensoring over K is exact; it commutes with the kernel and finite support Čech constructions. CT Corollary 11.8.2 gives the coefficient version. The closed-support comparison follows from the localization triangle.

**Imports:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/finite-flat-base-change`.

**Sources:** [B97] Proposition 1.8 and proof, pp. 12–13. Finite scalar extension is proved by finite affinoid pushforward and exact tensoring.; [CT03] Theorem 11.8.1 and Corollary 11.8.2, pp. 210–213. The finite-flat frame theorem and its DVR scalar-extension corollary include coefficients.

### Rigid cohomology with supports

For closed T⊆Z⊆X, the support sequence uses RΓ_T→RΓ_Z→RΓ_(Z∖T)(X∖T)→RΓ_T[1]. Excision restricts to an open neighbourhood of the support; disjoint closed supports split.

On j† coherent realizations take the kernel of restriction to the support complement. The nested-kernel sequence gives localization, and restriction to an open neighbourhood preserves this kernel. On disjoint supports the restriction kernels decompose. Exactness before derived pushforward gives the triangles and natural boundary maps, including their coefficient and Frobenius compatibility.

**Imports:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology-with-supports`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/localisation-sequence`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/excision-sequence`.

**Sources:** [B97] §§2.1–2.5 and proof of Proposition 2.5, pp. 16–19. Defines the support kernel, its locality, disjoint splitting and nested-support exact sequence.

### Finite etale pushforward de rham

Retain both ordinary and compact-support finite étale coefficient pushforward comparisons, with the inherited hypotheses.

Étale base change of differential modules uses Mathlib’s tensorKaehlerEquivOfFormallyEtale and TauCeti’s basis transport; finite pushforward is coherent and exact on the analytic radius pieces. Global support and proper-compactification compatibility still require the general proof recorded in G1; the algebraic differential identity alone does not discharge it.

**Imports:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/finite-etale-pushforward-de-rham`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/finite-etale-pushforward-cohomology`.

**Sources:** [CT03] §§7.3–7.4, pp. 148–152, and Theorem 9.1.1, p. 168. Supplies coherent étale descent and its passage to de Rham descent; this is not claimed to replace the unread compact-support pushforward proof.

The compact-support independence proof and global finite-étale support comparison remain the specific obligation G1. The ordinary frame-independence proof uses the de Rham descent theorem below. The strong-fibration and automatic-Taylor statements remain owned by RD.3 and have an explicit request there.

## New targets

The target names below are planning names in namespace `TauCeti.RigidCohomology`. A heavy geometric object is a reader target until its carrier and supplier interfaces are available. Every construction gives its user-facing API and discriminating checks; its proof route states which existing carrier or requested comparison each step needs.

### 1. Relative overconvergent Poincaré lemma

**Target:** `relativeOverconvergentPoincare`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/relative-overconvergent-poincare`.

For a separated morphism u of frames inducing an isomorphism on the open scheme, proper on the compactification, and smooth on the formal ambient space near the open scheme, a coherent j†-module E on the target satisfies E ≃ Ru_* DR†_relative(u†E). The relative differential is the canonical one on the pullback; E need not carry an absolute connection for this assertion.

**Hypotheses and conventions.**

- Complete mixed-characteristic DVR V, fraction field K; finite-type separated frames; smoothness is required only near the open scheme.
- Use strict neighbourhoods and coherent modules; the completed closed unit disc is not a substitute for the open-disc system.

**Construction or proof.**

1. Use strong fibration to obtain étale local coordinates and a cofinal system of products with discs, retaining the compactification hypotheses.
2. On one variable, primitive coefficients a_l/(l+1) converge after shrinking the disc radius: for 0<r<1, |1/(l+1)| r^l tends to zero. The differential has constants as kernel. Iterate in the relative coordinates.
3. Coherent acyclicity on the radius pieces and the cofinality lemmas identify derived direct images with these calculations. Totalize the finite Čech diagram; the augmentation is a quasi-isomorphism.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.3/frame`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/j-dagger`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/strong-fibration-theorem`, `AdicSpacesPartII:R3/open-polydisc-coherent-acyclicity`, `EnhancedDerivedSheaves:E3`, `SchemeAndStackFoundations:SF.4`.

**Acceptance.**

- A zero-dimensional relative coordinate gives the identity.
- Integration is checked on every radius piece; no bounded inverse to differentiation on the closed unit disc is asserted.

**Sources:** [CT03] Proposition 8.3.5 and Proposition 8.3.4, pp. 156–162; Lemmas 2.6.3–2.6.8, pp. 76–79. The relative de Rham augmentation is an equivalence under these frame hypotheses; radius refinement is part of the proof.

### 2. Étale-proper de Rham descent

**Target:** `etaleProperDeRhamDescent`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/etale-proper-de-rham-descent`.

An étale-proper hypercover of frames is universally of cohomological descent for overconvergent de Rham complexes with overconvergent isocrystal coefficients. For its augmentation ε, the target complex is equivalent to Rε_* of the total simplicial de Rham realization, and the associated first-quadrant spectral sequence computes rigid cohomology.

**Hypotheses and conventions.**

- Open schemes form an étale hypercover; compactifications form the proper part of the frame hypercover.
- The coefficient objects have compatible descent data; all totalizations use the cohomological grading convention.

**Construction or proof.**

1. First obtain coherent descent from smooth-proper covers and the standard étale polynomial covers, using local monic-polynomial presentations and their diagonal factorization.
2. Apply the relative Poincaré equivalence levelwise; filtered relative forms identify the de Rham totalization with the descended coefficient realization.
3. Use injective resolutions of diagrams and the homotopy uniqueness of their comparison maps to make the augmentation and spectral sequence functorial.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/relative-overconvergent-poincare`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-isocrystal`, `EnhancedDerivedSheaves:E2`, `EnhancedDerivedSheaves:E3`, `SchemeAndStackFoundations:SF.4`.

**Acceptance.**

- The constant hypercover yields the identity augmentation.
- Replacing a cover by a common refinement gives the same comparison in the derived category.

**Sources:** [CT03] Theorem 9.1.1 and Corollary 9.1.2, p. 168; §§6.4, 7.3–7.4, pp. 136–139, 148–152; §4.2, pp. 112–115. Coherent descent and the relative Poincaré lemma yield de Rham descent for étale-proper hypercovers.

### 3. Exact sequences in rigid coefficients

**Target:** `rigidCoefficientLongExactSequence`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/coefficient-long-exact-sequence`.

For a short exact sequence 0 → E′ → E → E″ → 0 of overconvergent isocrystals on X/K, rigid cohomology has its natural long exact coefficient sequence. The same holds with a fixed closed support Z and with compact support; if the sequence has Frobenius structures, every map is Frobenius compatible.

**Hypotheses and conventions.**

- X is separated of finite type over k; support and compactification conventions are those of the inherited RD.4 complexes.

**Construction or proof.**

1. Realize the short exact coefficient sequence as coherent j†-modules on a frame; tensoring with locally free forms is exact.
2. Use exactness of j† and of the supported realization functor before deriving global sections. The short exact sequence of complexes gives a triangle.
3. Glue by de Rham descent, then take cohomology. Use naturality of the boundary map to retain Frobenius.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology-with-supports`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/compactly-supported-rigid-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/etale-proper-de-rham-descent`, `mathlib:DerivedCategory`.

**Acceptance.**

- The boundary maps for a split coefficient sequence vanish.
- Closed-support and compact-support coefficient triangles commute with their forget-supports maps.

**Sources:** [CT03] Proposition 10.5.1, pp. 185–186; Proposition 2.7.2, pp. 79–81. Coefficient exactness gives the ordinary cohomology triangle.; [B97] §1.2, pp. 6–7, and §2.1–2.5, pp. 16–19 of author copy. Supported realizations use kernels and their exact localization sequences.

### 4. Rigid Gysin isomorphism

**Target:** `rigidGysin`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/general-rigid-gysin`.

If i:Z ↪ X is a closed immersion of smooth separated k-schemes of pure constant codimension c and E is an overconvergent isocrystal on X/K, then RΓ_Z,rig(X/K,E) ≃ RΓ_rig(Z/K,i*E)[−2c]. With compatible q-Frobenius structures this is RΓ_rig(Z/K,i*E)(−c)[−2c]. The comparison is natural for restriction and finite scalar extension. This extends the inherited target restricted to liftable coordinate pairs.

**Hypotheses and conventions.**

- k is perfect of characteristic p, and K is a complete characteristic-zero coefficient field with residue field k.
- Mixed codimension components require separate shifts; the Frobenius twist is part of the equivariant statement.
- The global coordinate-independence proof is an explicit gap, G1; this node records the full target.

**Construction or proof.**

1. Reduce smooth closed pairs étale locally to coordinate pairs and import the inherited liftable Gysin calculation.
2. The required gluing checks that the residue generator transforms canonically when normal coordinates change, and that the local maps respect support Čech descent. This is the unclosed step in G1.
3. Use localization for the resulting Gysin sequence; scalar extension is inherited. The divisor example determines the twist sign.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/gysin-isomorphism`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/localisation-sequence`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/tate-twist`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/etale-proper-de-rham-descent`, `SchemeAndStackFoundations:SF.4`.

**Acceptance.**

- For {0} in A¹, the sole supported group is H² = K(−1); the shift is 2.
- For c=0 and Z=X the comparison is the identity.

**Sources:** [T03] Lemma 4.1.2 and its proof, p. 908; Example 2.2.2, p. 895. Tsuzuki applies the unrestricted smooth-pair Gysin isomorphism and records base-extension compatibility, referring to his 1999 Theorem 4.1.1.

### 5. Quasi-étale specialization to the special fibre

**Target:** `TubeSpecialization`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/quasi-etale-specialization`.

For a finite-type O_K′-scheme Z and a closed subscheme X of its special fibre, define the specialization morphism of sites s_(X,Z): ]X[_Zη,qét → X_ét by composing the tube-to-formal-completion map with the equivalence from the étale site of the completion along X to X_ét. Keep pullback and derived pushforward as part of this interface.

**Hypotheses and conventions.**

- K′ is a finite extension of K₀=Frac W(κ), κ finite; Zη is the Berkovich generic fibre of the formal completion.
- The equivalence is between the formal-completion and special-fibre étale sites; the tube site itself is not asserted equivalent to X_ét.

**Construction or proof.**

1. Use the generic-fibre construction and the tube map into the formal completion.
2. Compose with the nilpotent/formal invariance of the étale site.
3. Retain the induced adjunction and the derived pushforward on bounded-below sheaf complexes; restrictions of closed strata give the compatible specialization maps.

**Direct prerequisites:** `AdicSpacesPartII:R2/raynaud-generic-fibre`, `AdicSpacesPartII:R2/tube`, `AdicEtaleGeometry:A1`, `EnhancedDerivedSheaves:E1`.

**Uses.**

- Disegni–Liu, Appendix B.2: Pushes the tube log de Rham realization to X_ét.
- PadicDifferentialEquationsAndRigidCohomology:RD.4/tube-proper-support-functor: Allows support to be imposed on the tube before specialization.

**API.**

- `TubeSpecialization.pullback` (functoriality): s* is the inverse-image functor of sheaves and respects identities and composition.
- `TubeSpecialization.derivedPushforward` (functoriality): Rs_* acts on bounded-below complexes of R-module sheaves.
- `TubeSpecialization.adjunction` (universal-property): s* is left adjoint to s_*, with the induced derived unit/counit where defined.
- `TubeSpecialization.restrictStratum` (compatibility): Restriction to a closed special-fibre stratum commutes with its tube specialization square.

**Checks and worked examples.**

- **formal_point**: For X=Spec κ′ in Spf O_K′, the intermediate formal étale site identifies with the residue-field étale site; this does not identify all analytic sheaves with residue-field sheaves.
- **empty_tube**: X empty gives the empty tube and zero derived pushforward of module sheaves.
- **same_special_fibre**: Replacing the formal completion by an infinitesimal thickening leaves its special-fibre étale-site comparison unchanged.

**Acceptance.**

- The construction distinguishes its two maps; étale invariance is used only for formal completion.

**Sources:** [DL] Appendix B.1, p. 113. The tube quasi-étale site maps to the special-fibre étale site through the formal completion.

### 6. Proper support on a tube

**Target:** `TubeProperSupport`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/tube-proper-support-functor`.

For U open in the closed special-fibre subscheme X of Z and g: ]X∖U[_Zη ↪ ]X[_Zη, define f!_(U,X)(F)=ker(F → g_*g*F), the kernel of the unit, on R-module sheaves on the tube quasi-étale site. Here g*, g_* and f! are exact. There is a canonical natural map F!F* Rs_* → Rs_* f! for the open immersion F:U ↪ X; no general isomorphism or commuting special-fibre endofunctor is included.

**Hypotheses and conventions.**

- The complement tube is the indicated open analytic subspace; f! is an endofunctor on the tube, not extension by zero from ]U[.

**Construction or proof.**

1. Take the kernel of the adjunction unit objectwise in sheaves. Establish exactness using the open tube restriction and direct-image exactness in this setting.
2. For the natural transformation, factor the unit after Rs_* through the closed special-fibre complement G:X∖U ↪ X. Its restriction after F* vanishes.
3. Use the kernel universal property to obtain the natural map, and exactness to pass to bounded-below derived complexes.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/quasi-etale-specialization`, `EnhancedDerivedSheaves:E1`, `mathlib:LinearMap.ker`.

**Uses.**

- Disegni–Liu, (B.2)–(B.3): Creates supported log complexes and their localization triangle.
- PadicDifferentialEquationsAndRigidCohomology:RD.4/log-rigid-proper-support-cohomology: Defines cohomology relative to the pair U⊆X.

**API.**

- `TubeProperSupport.ι` (projection): There is a natural inclusion f!F → F whose composite with F → g_*g*F is zero.
- `TubeProperSupport.lift` (universal-property): A map A → F killed by the unit factors uniquely through f!F.
- `TubeProperSupport.exact` (structure): The functor takes short exact sequences to short exact sequences.
- `TubeProperSupport.monotone` (functoriality): For U⊆U′⊆X there is a natural map f!_(U,X)F → f!_(U′,X)F compatible with composition.
- `TubeProperSupport.specializationMap` (compatibility): F!F*Rs_* maps naturally to Rs_*f!; it is not specified to be invertible.

**Checks and worked examples.**

- **whole**: For U=X, g has empty domain, so f! is the identity.
- **empty**: For U empty, g is the identity and f! is zero.
- **away_from_complement**: If g*F=0, the inclusion f!F → F is an isomorphism.
- **kernel_agreement**: On module sections with restriction r:V→W, the support condition is r(v)=0, matching Mathlib LinearMap.ker; using ker of the zero map for all r fails when r=id.

**Acceptance.**

- The support is imposed before Rs_* in every log complex.

**Sources:** [DL] Definition B.1, Remark B.2 and Lemma B.3, pp. 113–114. The kernel defines an exact tube support functor and a canonical comparison from special-fibre extension by zero.

### 7. Log de Rham complexes with proper support

**Target:** `SupportedLogComplex`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-de-rham-complexes`.

Fix a Zariski-log scheme (X,L) over κ° and an admissible embedding system (X_•,L_•) ↪ (Z_•,N_•) over W[t]°. Put Y_•=(t=0) in Z_•, with induced log structure M_•. Let u:X_•→X be the hypercover augmentation. Form ω_X=Ru_*Rs_*(Ω•_(Y_•,M_•)/W°⊗O_tube) and its supported version ω_(U,X) by applying f!_(U_•,X_•) inside Rs_*. Form tildeω similarly using Ω•_(Z_•,N_•)/Wtriv⊗O_Y_•. Invert p throughout. The short exact sequence of log form complexes defined by right wedging with dlog t gives ω[−1]→tildeω→ω→ω and its connecting operator N.

**Hypotheses and conventions.**

- Admissible means: X_• is a Zariski hypercover with exact closed embeddings; Z_• is log smooth over W[t]°; at level zero it is flat with smooth generic fibre over W[t] and smooth over W; Y_0 is a relative simple normal-crossings divisor; N_0 is its divisor log structure; the special-fibre bases have the specified identifications. Higher levels satisfy the embedding-system compatibility conditions.
- This is a realization after choosing a system. RD.4 supplies its analytic common-refinement comparisons through the log rigid realization; CR.5 supplies log charts and exactification, with the weak-formal extensions explicitly requested. A generic ordinary log connection alone does not supply such a system.

**Construction or proof.**

1. Import log structures, log differentials and exactification from CR.5. Use the semistable local weak lifts and product/refinement construction of the log rigid realization to build the admissible system.
2. Tensor the absolute and relative log form sequences with analytic tube functions. Apply the exact tube support functor, then derived specialization and hypercover pushforward.
3. Retain the triangle and its connecting map N as canonical data. Use common admissible refinements and the log Poincaré comparison to identify realizations.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/tube-proper-support-functor`, `CrystallineCohomology:CR.5/log-differentials`, `CrystallineCohomology:CR.5`, `EnhancedDerivedSheaves:E2`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-rigid-realization`.

**Uses.**

- Disegni–Liu, Definition B.4 and (B.11): Supplies the pair-dependent proper-support cohomology and its boundary sequence.
- Disegni–Liu, Lemmas B.5–B.6: Supplies the abutments of the supported spectral sequences.

**API.**

- `SupportedLogComplex.refine` (equivalence): Admissible refinement gives a canonical quasi-isomorphism compatible with repeated refinement.
- `SupportedLogComplex.forgetSupports` (projection): ω_(U,X) → ω_X and tildeω_(U,X) → tildeω_X come from the tube kernel inclusions.
- `SupportedLogComplex.monodromyTriangle` (structure): ω_(U,X)[−1] → tildeω_(U,X) → ω_(U,X) →ᴺ ω_(U,X) is distinguished.
- `SupportedLogComplex.enlargeOpen` (functoriality): U⊆U′ gives maps between both supported complexes compatible with N.
- `SupportedLogComplex.nonlogAgreement` (compatibility): For a proper smooth pair with trivial relative log structure, the proper-support realization agrees with the inherited ordinary rigid compact-support realization.

**Checks and worked examples.**

- **full_support**: U=X recovers ω_X and tildeω_X.
- **no_support**: U empty gives zero complexes and zero N.
- **smooth_point**: For the standard log point over κ°, relative ω has K₀ in degree zero; the absolute log complex retains a dlog t term. Identifying ω and tildeω fails this test.
- **support_order**: A replacement F!F*ω_X is not part of the definition; the only general map from it to ω_(U,X) is the one furnished by Lemma B.3.

**Acceptance.**

- All complexes are bounded below K₀-sheaf complexes; N is a connecting map, not a separately chosen matrix.

**Sources:** [DL] Appendix B.1–B.2, pp. 114–116; (B.1)–(B.2). An admissible log embedding system constructs the absolute/relative complexes and applies proper support before derived specialization.; [GK05] §§5.1–5.2, pp. 26–28; §5.4, p. 29. The weak-formal absolute/relative log complexes and the wedge-dlog t sequence supply the dagger counterpart and connecting monodromy.

### 8. Localization compatible with log monodromy

**Target:** `logMonodromyLocalization`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-monodromy-localization`.

For U open in X, the complexes above fit in localization triangles ω_(U,X)→ω_X→G_*ω_(X∖U)→ω_(U,X)[1] and their tildeω versions. They form a diagram of distinguished triangles with the monodromy triangles, so the connecting operators N commute with every localization arrow.

**Hypotheses and conventions.**

- G is the closed immersion X∖U→X; its boundary complex retains the induced log structure and computes log convergent cohomology.

**Construction or proof.**

1. Use the exact tube kernel sequence 0→f!F→F→g_*g*F→0.
2. Apply specialization and hypercover pushforward; restrict the embedding system to the boundary.
3. The wedge-dlog t form sequence is natural for this restriction and for the kernel inclusions, giving the triangle diagram.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-de-rham-complexes`, `mathlib:DerivedCategory`.

**Acceptance.**

- For U=X the boundary term vanishes and the first arrow is an equivalence.
- For U empty the second arrow is the identity; N commutes in this degenerate triangle.

**Sources:** [DL] Appendix B.2, (B.3), pp. 116–117. Support localization is a triangle of the absolute/relative log monodromy triangles.

### 9. Log rigid cohomology with proper support

**Target:** `LogProperCohomology`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-rigid-proper-support-cohomology`.

For X proper strictly semistable over the standard log point κ°, of pure dimension n−1, and U⊆X open, define H^q_rig((U,X)/W°)=H^q RΓ(X_ét,ω_(U,X)). Its coefficient field is K₀. Keep X in the notation: independence from the chosen proper compactification is not asserted. Its boundary long exact sequence has log convergent cohomology of X∖U and log rigid cohomology of proper X.

**Hypotheses and conventions.**

- κ is finite of characteristic p, W=W(κ), K₀=Frac W; all complexes are rationalized.
- The assertion identifies log rigid and log convergent cohomology for proper X, not for its nonproper boundary.

**Construction or proof.**

1. Take hypercohomology of the supported log realization.
2. Use its refinement comparison for independence of the admissible embedding system while keeping U⊆X fixed.
3. Apply the localization triangle. Properness identifies ω_X cohomology with log rigid cohomology; the boundary remains log convergent.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-de-rham-complexes`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-monodromy-localization`, `CrystallineCohomology:CR.5`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/proper-log-rigid-convergent-comparison`.

**Uses.**

- Disegni–Liu, Lemma B.5: Compares this pair group to proper log cohomology in high degrees.
- Disegni–Liu, (B.13): Receives a spectral sequence from compact-support cohomology of the smooth strata.

**API.**

- `LogProperCohomology.forgetSupports` (projection): H^q_rig((U,X)/W°) → H^q_rig(X/W°) is induced by the supported-complex inclusion.
- `LogProperCohomology.enlargeOpen` (functoriality): U⊆U′⊆X induces a map H^q((U,X)) → H^q((U′,X)).
- `LogProperCohomology.localisation` (structure): The sequence H^(q−1)_conv(X∖U/W°) → H^q((U,X)) → H^q_rig(X/W°) → H^q_conv(X∖U/W°) is exact.
- `LogProperCohomology.monodromy` (structure): N on the complex induces a K₀-linear operator commuting with the support maps.
- `LogProperCohomology.smoothProperAgreement` (compatibility): With smooth proper X and its standard semistable log structure, supported groups agree with ordinary H_c,rig(U/K₀).

**Checks and worked examples.**

- **full**: For U=X, H^q((X,X))=H^q_rig(X/W°).
- **empty**: For U empty all pair groups vanish.
- **point**: For X the proper standard log point and U=X, H⁰=K₀ and H^q=0 for q≠0.
- **smooth_line**: For X=P¹ with smooth special fibre and U=A¹, the proper-support group is K₀(−1) in degree two and zero in other degrees. It cannot be replaced by ordinary H⁰(A¹).

**Acceptance.**

- The correct compactification parameter is visible in both the type and every comparison statement.

**Sources:** [DL] Definition B.4 and (B.11), pp. 119–120. The pair-dependent group is supported log hypercohomology; its boundary is log convergent cohomology.

### 10. Log residue double complex

**Target:** `LogResidueComplex`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-residue-double-complex`.

On an admissible system define P_j Ω^m_log as the image of Ω^j_log⊗Ω^(m−j)_regular→Ω^m_log. Put A^(i,j)=Ω^(i+j+1)_log/P_j for i,j≥0, restricted to Y. Its horizontal differential is (−1)^j d and its vertical differential is right wedge α↦α∧dlog t, with total differential their sum. Set P_k A^(i,j)=P_(2j+k+1)Ω^(i+j+1)_log/P_j, with the zero/whole endpoint conventions. The augmentation from relative log forms to Tot A is a quasi-isomorphism; residues identify graded pieces with forms on intersections of irreducible components.

**Hypotheses and conventions.**

- The admissible system and Zariski log structure are those of the supported log complex.
- Normal-crossings strata are disjoint unions indexed by unordered subsets of distinct components; use a fixed ordering only to specify incidence signs.

**Construction or proof.**

1. Construct the quotient filtration from wedges of log and ordinary forms. The indicated differentials anticommute by the (−1)^j sign.
2. Import the absolute component residues from CR.5/semistable-residues; the requested exterior SNC residue isomorphism extends these to the graded log-form complex with the alternating incidence convention.
3. Apply tube support and specialization to the filtered total complex, and use the log Poincaré augmentation.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-de-rham-complexes`, `CrystallineCohomology:CR.5/semistable-residues`, `CrystallineCohomology:CR.5`, `EnhancedDerivedSheaves:E3`.

**Uses.**

- PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-weight-spectral-sequence: Supplies the filtration and residue calculation of its first page.
- PadicDifferentialEquationsAndRigidCohomology:RD.4/positive-log-support-complex: Its zeroth column is the positive quotient complex.

**API.**

- `LogResidueComplex.total` (constructor): Tot A has d²=0 under the stated horizontal sign and vertical wedge convention.
- `LogResidueComplex.filtration` (structure): P_k is an increasing filtration by subcomplexes, with P_k A^(i,j) determined by P_(2j+k+1).
- `LogResidueComplex.residue` (characterisation): The associated graded identifies with direct sums of shifted de Rham complexes of the appropriate component intersections.
- `LogResidueComplex.augmentation` (equivalence): Relative log forms augment quasi-isomorphically to Tot A, compatibly with restrictions and support.

**Checks and worked examples.**

- **single_component**: For a smooth fibre with one component, all intersection terms of order ≥2 vanish; the spectral sequence has its single ordinary cohomology column.
- **two_components**: For two transverse components, order-two terms consist of their intersection once, not twice from ordered pairs; the two face maps have opposite incidence signs.
- **differential_sign**: In column j=1 the horizontal differential is −d; using +d in every column fails anticommutation with wedge dlog t.

**Acceptance.**

- The comparison is between total complexes, not between individual columns.

**Sources:** [DL] Appendix B.3, pp. 119–120, preceding (B.12). The log residue double complex, its differential signs and filtration yield the stratum spectral sequences.; [GK05] §5.2, pp. 27–28. Residues and the exact alternating intersection complex give the augmentation and graded calculation of the double complex.

### 11. Supported log weight spectral sequence

**Target:** `supportedLogWeightSpectralSequence`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-weight-spectral-sequence`.

Write X^(h) for the disjoint union of h-fold intersections of distinct components of proper strictly semistable X, and U^(h)=U×_X X^(h). There is a convergent spectral sequence of underlying K₀-vector spaces E₁^(−k,q+k)=⊕_(j≥max(0,−k)) H_c,rig^(q−2j−k)(U^(2j+k+1)/K₀) ⇒ H^q_rig((U,X)/W°). Its maps to the proper X and boundary spectral sequences are induced by support localization. Tate twists and Frobenius normalization of this page are not specified by this underlying-vector-space statement.

**Hypotheses and conventions.**

- X is proper strictly semistable of finite type over κ°, of pure dimension n−1; the component-intersection and cohomological conventions are fixed above.
- No degeneration claim is part of the target. Frobenius-normalized weights belong to RD.6 and require its own residue convention.

**Construction or proof.**

1. Filter the supported residue total complex. Residues compute its graded pieces on component intersections.
2. Each X^(h) is smooth proper; its nonlog pair support agrees with Berthelot compact support on U^(h).
3. The finite dimension of the stratum index and bounded-below form complexes give convergence. Natural support maps give the comparison of spectral sequences.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-residue-double-complex`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-rigid-proper-support-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/compactly-supported-rigid-cohomology`.

**Acceptance.**

- For one component, this reduces to H_c,rig(U) ⇒ H_rig((U,X)).
- For two components the index 2j+k+1 detects the intersection row and its exact degree shift.

**Sources:** [DL] Appendix B.3, (B.12)–(B.13), pp. 120–121. Residues give the underlying-vector-space first pages and identify nonlog proper stratum support with ordinary compact support.

### 12. Positive log complex with proper support

**Target:** `PositiveLogComplex`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/positive-log-support-complex`.

Define Ξ^i=Ω^(i+1)_log(Z/Wtriv)/Ω^(i+1)_regular(Z/W), restricted to Y, with the differential inherited from A^(i,0). Put ω⁺_(U,X)=Ru_*Rs_*f!_(U_•,X_•)(Ξ•⊗O_tube). Projection Tot A→A^(•,0)=Ξ• yields ω_(U,X)→ω⁺_(U,X), and the absolute log complex has the compatible map tildeω_(U,X)→ω⁺_(U,X)[−1].

**Hypotheses and conventions.**

- Use the same admissible system and its totalization signs. The superscript + denotes this quotient complex and is not a positivity condition on slopes.

**Construction or proof.**

1. Take the j=0 column of the residue double complex.
2. Project the total complex to its zeroth column; the column-index behavior of the differentials makes this a chain map.
3. Apply the exact tube support functor and derived pushforwards. The wedge-dlog t augmentation yields the relative map and the absolute shifted map.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-residue-double-complex`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/tube-proper-support-functor`.

**Uses.**

- Disegni–Liu, Lemma B.6: Its filtered cohomology is computed by the positive supported spectral sequence.
- Disegni–Liu, (B.9)–(B.10): Relates relative and absolute support maps through the quotient realization.

**API.**

- `PositiveLogComplex.quotient` (constructor): Ξ^i is the specified quotient, not a submodule of log forms.
- `PositiveLogComplex.relativeMap` (functoriality): ω_(U,X) maps to ω⁺_(U,X) by projection of residue columns.
- `PositiveLogComplex.absoluteMap` (functoriality): tildeω_(U,X) maps to ω⁺_(U,X)[−1], with the source triangle compatibility.
- `PositiveLogComplex.supportMaps` (compatibility): Enlarging U and forgetting supports commute with both maps.

**Checks and worked examples.**

- **empty**: For U empty, ω⁺_(U,X)=0.
- **standard_log_point**: For the standard log point, Ξ⁰ is generated by the class of dlog t and gives K₀ in degree zero, so the quotient by ordinary forms cannot be discarded.
- **projection_column**: For a two-component fibre, the map on the first spectral-sequence page retains j=0 terms only; retaining every j fails the defining column projection.

**Acceptance.**

- The quotient has forms of degree i+1 and is indexed in degree i.

**Sources:** [DL] Appendix B.2, (B.7)–(B.10), pp. 118–119; Lemma B.6, p. 121. The quotient by ordinary forms is the zeroth residue column and receives the supported relative and shifted absolute maps.

### 13. Positive support spectral sequence

**Target:** `positiveSupportSpectralSequence`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/positive-support-spectral-sequence`.

There is a convergent spectral sequence E⁺_c,1^(−k,q+k)=H_c,rig^(q−k)(U^(k+1)/K₀) for k≥0 and zero for k<0, abutting to H^q(X_ét,ω⁺_(U,X)). The map from the supported log spectral sequence to this one is projection onto the j=0 summand on E₁.

**Hypotheses and conventions.**

- The strictly semistable proper pair and grading conventions above apply; this is a statement of underlying K₀-vector spaces.

**Construction or proof.**

1. Restrict the residue filtration to the zeroth column.
2. Compute its graded pieces by the residue isomorphisms; only the intersection order k+1 remains.
3. The total-to-column projection preserves the filtrations and produces the asserted map on pages and abutments.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/positive-log-support-complex`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-weight-spectral-sequence`.

**Acceptance.**

- For k<0 the first page is zero.
- For a smooth fibre with one component its sole term is H_c,rig(U).

**Sources:** [DL] Lemma B.6, p. 121. The zeroth residue column gives the positive spectral sequence and the projection on its first page.

### 14. High-degree comparison for log proper support

**Target:** `highDegreeLogSupportComparison`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/high-degree-log-support-comparison`.

Assume d≥1 and dim(X^(h)∖U^(h))≤d−h for every h≥1. Then H^q_rig((U,X)/W°)→H^q_rig(X/W°) is an isomorphism for q≥2d. The E₁ support comparison in bidegree (−k,q+k) is an isomorphism for q≥2d−|k|. In bidegree (0,2d−1), the direct sum of the j≥1 summands is an isomorphism; the j=0 term is excluded.

**Hypotheses and conventions.**

- An empty stratum is assigned vanishing cohomology and satisfies every dimension bound.
- The ordinary rigid vanishing above twice dimension is supplied by RD.4/rigid-support-cohomological-bounds, distinct from the existing RD.5 compact-support-vanishing target.

**Construction or proof.**

1. Use the boundary spectral sequence: degree q−2j−k is above twice the dimension of X^(2j+k+1)∖U^(2j+k+1) for q≥2d−1. This kills boundary cohomology in the two degrees needed for localization.
2. For pagewise comparison kill both degrees q−2j−k−1 and q−2j−k on each boundary stratum using j≥max(0,−k) and q≥2d−|k|.
3. At k=0,q=2d−1, the same inequalities hold for j≥1, retaining the stated exception for j=0.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-weight-spectral-sequence`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-monodromy-localization`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-support-cohomological-bounds`.

**Acceptance.**

- The endpoint q=2d is included.
- No isomorphism is asserted for the j=0 summand at degree 2d−1.

**Sources:** [DL] Lemma B.5 and its proof, p. 121. Boundary dimension bounds imply the three high-degree comparisons, with a specific excluded j=0 summand.

### 15. Dagger–rigid cohomology comparison

**Target:** `daggerBerthelotComparison`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/dagger-berthelot-comparison`.

Let R be a complete mixed-characteristic DVR with fraction field K, and let 𝔓 be a proper admissible formal R-scheme. For Y locally closed in its special fibre, let Q be the dagger structure on the partially proper tube of its closure Ȳ, and let D⊆Q have underlying rigid space ]Y[_𝔓. For a coherent sheaf F on Q, H^q(D,F|_D) ≅ H^q(]Ȳ[_𝔓,j†F′), where F′ is its completion. If D is smooth, the same comparison applies to de Rham hypercohomology. If 𝔓 is smooth near Y, H^i_dR(D) ≅ H^i_rig(Y/K). The comparison is natural for maps of these framed data and intertwines compatible Frobenius lifts; canonical rigid Frobenius follows from lift independence.

**Hypotheses and conventions.**

- The dagger space is the tube equipped with the indicated overconvergent structure, not arbitrary analytification of a nonproper generic fibre.
- For a smooth quasi-projective O_K-model use a proper compactification/formal embedding smooth along its special open fibre; its dagger tube supplies D. Coefficients require a coherent connection on Q or descent to a fixed strict neighbourhood before applying the argument.

**Construction or proof.**

1. Use the partially proper dagger/completion equivalence to put Q on the closure tube.
2. Compare coherent cohomology using finite Čech covers and the two cofinal radius systems in the proof of Theorem 5.1(a). A cocycle is solved after shrinking its individual radius; no uniform choice for all sections is assumed.
3. Apply the comparison termwise to the coherent differential sheaves; a bounded hypercohomology spectral sequence gives the de Rham comparison. The frame definition of rigid cohomology gives the final identification.
4. Naturality of completions, forms and radius restrictions gives Frobenius compatibility whenever the maps lift; use the inherited lift-independence theorem for canonical Frobenius.

**Direct prerequisites:** `AdicSpacesPartII:F1/dagger-space`, `AdicSpacesPartII:F1/dagger-differentials`, `AdicSpacesPartII:F1/dagger-rigid-de-rham-comparison`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/frobenius-independent-of-lift`.

**Acceptance.**

- For a smooth affine line tube H⁰=K and H^i=0 for i>0.
- For the multiplicative-group tube H¹ is the dlog class, with q-Frobenius q; completing to a closed-disc complex cannot replace the dagger restriction.
- Maps between proper models which are identical on the special open induce the same rigid comparison by frame independence.

**Sources:** [GK00] Theorem 5.1(a)–(c) and proof, pp. 23–24 of arXiv v1; §4.7, p. 21. The comparison identifies dagger tube cohomology with j† on the closure tube and, under smoothness, with Berthelot rigid cohomology.

### 16. Dagger support and compact-support comparisons

**Target:** `daggerSupportedComparison`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/dagger-supported-comparison`.

For a smooth framed Y and closed Z⊆Y, compatible dagger tube realizations identify the supported triangle with the homotopy fibre of RΓ_dR(D_Y)→RΓ_dR(D_(Y∖Z)), hence RΓ_Z,rig(Y/K) with that fibre. Separately, for smooth affine dagger D, use Grosse-Klönne’s definition of compact support via derived sections supported on D inside a larger-radius rigid ambient space, then glue by compact-support excision to obtain RΓ_dR,c(D_Y) ≃ RΓ_c,rig(Y/K). The second comparison, including changes of radius and proper model, is a target with gap G2, not a consequence of ordinary localization alone.

**Hypotheses and conventions.**

- D_Y and D_(Y∖Z) come from one compatible proper formal frame; coefficients descend coherently to the chosen neighbourhoods.
- The source compact-support construction uses an ambient support functor and larger-radius presentations. It is not the fibre of ordinary global sections on the open Y.

**Construction or proof.**

1. Apply the ordinary dagger comparison to the two terms of the Z-support localization triangle; its naturality identifies their homotopy fibres.
2. For compact support import the F1 carrier for larger-radius ambient supported forms and compare its support complex with the inherited RD.4 tube support complex.
3. Prove invariance under enlarging the ambient radius, then glue via compact-support excision and proper-model independence. The complete proof of these latter comparisons remains G2.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/dagger-berthelot-comparison`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology-with-supports`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/localisation-sequence`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/compactly-supported-rigid-cohomology`, `AdicSpacesPartII:F1`.

**Acceptance.**

- For A¹, ordinary H⁰=K while compact H²=K(−1); replacing compact support by ordinary support localization of A¹ itself fails.
- For Z empty the ordinary supported fibre is zero; for Z=Y it is ordinary rigid cohomology.

**Sources:** [GK00] §4.8, pp. 21–22; §5.2, p. 24. Compact support is defined by ambient supported forms for smooth affine dagger spaces; the relation to rigid compact support is announced.; [B97] §2.1–2.5, pp. 16–19. Supports and their excision triangles provide the rigid comparison target.

### 17. Log dagger comparison on a fixed admissible model

**Target:** `logDaggerComparison`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-dagger-comparison`.

For an admissible log embedding system as above whose terms have compatible proper formal frames and coherent log-form extensions to their closure tubes, also allowing a coherent integrable log coefficient with the same termwise extension property, termwise dagger realization of the relative and absolute log complexes is canonically equivalent to their j† log-form realization. With the supported ambient dagger carrier and its comparison, it also identifies the proper-support log complexes ω_(U,X) and tildeω_(U,X), preserving their wedge-dlog t triangle, N and the forget-supports maps. Applying this target to the HLTT ordinary locus requires an explicit identification of HLTT’s dagger log complex with these admissible-model complexes; that identification and the supported extension remain gap G2.

**Hypotheses and conventions.**

- The formal log model and strict-neighbourhood extension of its log forms are required data.
- Only the fixed-model comparison is asserted; no independence of the proper compactification of log pair cohomology is added.
- No weight or finite-slope finiteness conclusion is supplied by this comparison; those import RD.5 and RD.6.
- For coefficients, tensor the relative/absolute log form complexes with the fixed coherent log connection and require every term to extend coherently to the closure tube. Independence of that coefficient log model is not assumed from the constant-coefficient DL construction.

**Construction or proof.**

1. Log differentials on the smooth log embedding system are coherent. Apply Theorem 5.1(a) to each coherent sheaf and differential, and take bounded totalizations and hypercover descent. Restriction of the log connection and wedge-dlog t commute with the comparison of its coherent terms, giving a comparison of K₀-sheaf complexes even though the de Rham differential is not O-linear.
2. Wedge dlog t is natural in these maps, so the relative/absolute triangles and their connecting N agree.
3. For supports use the ambient dagger-support comparison before specialization. Verify the HLTT horizontal boundary and semistable log structures give the required admissible realization; both obligations are retained in G2.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/dagger-berthelot-comparison`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/dagger-supported-comparison`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-de-rham-complexes`, `CrystallineCohomology:CR.5/log-differentials`.

**Acceptance.**

- A smooth proper model with no horizontal boundary recovers the ordinary proper comparison.
- For the standard log point the absolute dlog t class and zero relative monodromy are respected.
- For a nonproper open the chosen log compactification remains visible.

**Sources:** [GK00] Theorem 5.1(a)–(b), pp. 23–24. The coherent-sheaf comparison can be applied termwise to coherent log forms; the source does not state a general log compact-support theorem.; [DL] Appendix B.2, (B.1)–(B.3), pp. 115–117. The log support realization and its relative/absolute triangle specify the comparison target.

### 18. Specialization and cospecialization of de Rham cohomology

**Target:** `Specialization`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/algebraic-rigid-specialization-maps`.

Let X be smooth of pure dimension over a complete mixed-characteristic DVR R and admit a smooth proper R-compactification X̄. Let (M,∇) be a coherent algebraic integrable connection on X_K whose dagger restriction M† is overconvergent. Construct ρ_M:RΓ_dR(X_K,M)→RΓ_rig(X_k/K,M†) by analytification and j† restriction, and ρ_c,M:RΓ_c,rig(X_k/K,M†)→RΓ_dR,c(X_K,M) by ambient tube support and rigid GAGA. Algebraic compact support is the derived inverse limit of the boundary-ideal pro-de Rham complexes, independent of a coherent extension of M.

**Hypotheses and conventions.**

- Take a coherent extension M̄ to X̄_K and boundary ideal I; ∇ acts as a connection on the pro-system (I^n M̄)_n, permitting shifts of n, not necessarily on every individual I^n M̄.
- Derived inverse limits and rigid coherent GAGA are suppliers; no ordinary inverse limit or single IΩ complex is substituted.
- The maps are not asserted to be isomorphisms for nonproper X.

**Construction or proof.**

1. Construct algebraic-to-analytic de Rham restriction, then restrict to the dagger tube coefficient realization to obtain ρ.
2. Define the compact algebraic complex by Rlim of boundary-ideal powers tensored with forms; change of coherent extension gives a cofinal equivalent pro-system. Rigid GAGA compares its proper global sections with the analytic pro-complex.
3. Identify tube-supported analytic sections with compact rigid cohomology using the admissible cover by the generic open and boundary tube. Forget the tube support, then use the GAGA comparison to obtain ρ_c.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/compactly-supported-rigid-cohomology`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/forget-supports-map`, `EnhancedDerivedSheaves:E2`, `AdicSpacesPartII:R3`, `EnhancedDerivedSheaves:E1`.

**Uses.**

- Xu–Zhu, Proposition 2.2.5: Compares the two forget-supports maps.
- PadicDifferentialEquationsAndRigidCohomology:RD.4/specialization-forget-supports-square: Provides all four objects and the directions of the two vertical arrows of the forget-supports square.

**API.**

- `Specialization.ordinary` (constructor): ρ maps algebraic generic-fibre de Rham cohomology to special-fibre rigid cohomology.
- `Specialization.compact` (constructor): ρ_c maps special-fibre compact rigid cohomology to generic-fibre compact de Rham cohomology.
- `Specialization.coefficientMap` (functoriality): A horizontal map of coherent connections commutes with both arrows.
- `Specialization.extensionIndependent` (equivalence): Cofinal boundary-ideal pro-systems from different coherent extensions give the same compact arrow.
- `Specialization.supportSquare` (compatibility): ρ ∘ ι_dR ∘ ρ_c = ι_rig in the derived category.

**Checks and worked examples.**

- **proper_point**: For X=Spec R and the trivial connection both maps are the identity on K in degree zero.
- **affine_line**: For X=A¹_R, ordinary H⁰ and compact H² are distinct; a purported single ordinary-to-compact specialization map has the wrong degrees.
- **pro_connection**: For M=O on a line compactified by P¹, d(I^n) is contained in I^(n−1)Ω; the definition must accept a pro-connection rather than require d to preserve each boundary-ideal power.
- **zero_coefficient**: M=0 gives zero complexes and zero maps in both directions.

**Acceptance.**

- The source and target arrows have opposite directions on ordinary and compact support.

**Sources:** [XZ] §§2.2.1–2.2.4, pp. 11–12. Analytification and overconvergent restriction give specialization, while supported analytic pro-complexes give the opposite-direction cospecialization.

### 19. Specialization and forget-supports square

**Target:** `specializationForgetSupportsSquare`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/specialization-forget-supports-square`.

Under the specialization-map hypotheses, the square is commutative in D(K): ι_rig = ρ_M ∘ ι_dR ∘ ρ_c,M. Consequently the compact rigid map to ordinary rigid cohomology factors through generic-fibre compact and ordinary de Rham cohomology.

**Hypotheses and conventions.**

- Use the pro-complex definition of compact de Rham cohomology and the tube support unit for rigid compact support.

**Construction or proof.**

1. Replace algebraic compact de Rham by its analytic form via proper rigid GAGA.
2. The support-to-identity unit is natural for restriction to the generic open and the overconvergent realization. Compare the two composites using their adjunction units.
3. Push forward and apply the inverse GAGA comparison; the resulting diagram is the stated square.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/algebraic-rigid-specialization-maps`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/forget-supports-map`.

**Acceptance.**

- For a proper point every arrow is the identity.
- For a nonproper variety commutativity does not imply invertibility of either vertical map.

**Sources:** [XZ] Proposition 2.2.5 and proof, pp. 12–13. The ordinary and compact specialization arrows intertwine the two forget-supports maps.

### 20. Igusa theta-cokernel interface

**Target:** `IgusaThetaCohomology`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/igusa-theta-cokernel`.

For finite tame level K^p, n≥0 and k≥0, take Pan’s overconvergent modular-form spaces M†_(−k)(K^pΓ(p^n)) and M†_(k+2)(K^pΓ(p^n)) over C, their determinant line D₀, and the geometric differential operator θ_(k+1). Define the finite-level theta cohomology as the algebraic cokernel of θ_(k+1):M†_(−k)→M†_(k+2)⊗D₀^(−k−1). The direct limit over n carries the induced smooth B(Q_p)-action. The comparison of this cokernel with logarithmic rigid cohomology of the Igusa curve with Sym^k coefficient is a separate obligation G3, and its finite-level finiteness imports RD.5 only after that comparison.

**Hypotheses and conventions.**

- C is Pan’s complete algebraically closed characteristic-zero coefficient field. θ includes the determinant twist; its realization is not assumed from an abstract derivative on arbitrary analytic functions.
- This node owns the cohomology interface over the supplied geometric data. Construction of modular curves, Igusa level structures and overconvergent modular forms stays with their geometric owners; their realization for Pan’s data is recorded in G3 rather than imported from an upward-tier roadmap.
- No finiteness of the infinite-level direct limit is asserted.

**Construction or proof.**

1. Use Mathlib’s quotient by LinearMap.range for the cokernel, with its quotient projection and universal property.
2. Level-change and Borel maps commuting with θ preserve the image of θ and descend to the quotient. Exactness of filtered colimits of vector spaces identifies the infinite-level cokernel with the direct limit of finite-level cokernels.
3. Under a change of determinant-line trivialization, use the D₀^(−k−1) factor to intertwine the operators.
4. To identify the quotient geometrically, construct the logarithmic coefficient de Rham complex and its theta resolution using Coleman’s comparison cited by Pan. This specific realization proof is G3; neither the name H¹_rig nor an abstract quotient proves it.

**Direct prerequisites:** `mathlib:LinearMap.range`, `mathlib:Submodule.mkQ`, `PadicDifferentialEquationsAndRigidCohomology:RD.3/overconvergent-isocrystal`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-dagger-comparison`, `EnhancedDerivedSheaves:E3`.

**Uses.**

- Pan, Proposition 5.1.8: Identifies the cokernel of the locally analytic differential with the finite/infinite-level theta quotient.
- PadicDifferentialEquationsAndRigidCohomology:RD.5: After the exact log-rigid realization, supplies the finite-level finiteness target.

**API.**

- `IgusaThetaCohomology.mk` (projection): The target form has its canonical class in the quotient by im θ.
- `IgusaThetaCohomology.class_eq_zero` (characterisation): A target form has zero class exactly when it lies in im θ.
- `IgusaThetaCohomology.desc` (universal-property): A linear map killing θ factors uniquely through the quotient.
- `IgusaThetaCohomology.levelMap` (functoriality): Level maps commuting with θ induce quotient maps and their composition law.
- `IgusaThetaCohomology.determinantEquiv` (compatibility): Changing a trivialization of D₀ gives the canonical equivalent quotient with the determinant factor retained.
- `IgusaThetaCohomology.levelColimit` (equivalence): The infinite-level quotient is the filtered colimit of finite-level quotients; its B(Q_p)-action is smooth.

**Checks and worked examples.**

- **zero_operator**: For supplied θ=0, the quotient is canonically the full target space.
- **surjective_operator**: For supplied surjective θ, the quotient is zero; replacing the cokernel by ker θ fails.
- **image_relation**: For any source form f, the class of θ(f) is zero, agreeing with Mathlib’s quotient by LinearMap.range.
- **level_limit**: A filtered system of finite-dimensional quotient spaces can have infinite-dimensional limit, e.g. C^n with standard inclusions; no infinite-level finite-dimensional assertion follows.

**Acceptance.**

- Use the quotient interface without redefining the existing generic Mathlib cokernel machinery.

**Sources:** [Pan] Definition 5.1.6 and Proposition 5.1.7, pp. 53–54 of arXiv v1; §§5.1.3–5.1.5, p. 53. The theta cokernel includes the determinant twist, commutes with the level limit, and receives a geometric log-rigid interpretation for its finiteness claim.

### 21. Cohomological bounds for smooth rigid supports

**Target:** `rigidSupportCohomologicalBounds`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/rigid-support-cohomological-bounds`.

Let X be smooth separated of finite type over perfect k, with dim X≤d, Z⊆X closed of codimension at least e≥0, and E an overconvergent isocrystal on X/K. Then H^q_Z,rig(X/K,E)=0 for q<2e and for q>2d. In particular H^q_rig(X/K,E)=0 for q>2 dim X by taking Z=X. No coefficient Frobenius is required for this vanishing.

**Hypotheses and conventions.**

- K is the complete mixed-characteristic discrete-valuation coefficient field. Codimension is measured componentwise; the empty support has zero groups in every degree.
- This is an amplitude theorem, not finite-dimensionality. It is located in RD.4 because the supported log comparison needs it before RD.5.

**Construction or proof.**

1. Use induction on ambient dimension and support codimension. Stratify the support into a smooth dense stratum and a higher-codimension remainder, then apply the nested-support exact sequence.
2. For a smooth support apply the general Gysin comparison: the lower bound follows from the shift 2e, and the upper bound follows inductively from the smaller-dimensional support. Its general gluing obligation is the inherited G1.
3. For codimension zero, remove an affine open meeting every component and use localization; the complement has positive codimension, where the supported bound has already been proved. On the affine open a smooth weak lift and coherent j† acyclicity reduce ordinary cohomology to a form complex of length at most d. This proves the ambient bound; decompose connected components if their dimensions differ. Finite scalar extension preserves the induction comparisons.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/general-rigid-gysin`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/localisation-sequence`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/finite-flat-base-change`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/monsky-washnitzer-comparison`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/etale-proper-de-rham-descent`.

**Acceptance.**

- For a point Z inside A¹, the only possible supported degree is q=2.
- For Z=X, e=0 and q>2 dim X vanishes; this makes no finite-dimensionality claim.

**Sources:** [T03] Lemma 4.1.2 and proof, p. 908. The two support-degree bounds are proved by Gysin, excision and dimension induction, for overconvergent coefficients without requiring Frobenius.

### 22. Proper log rigid–convergent comparison

**Target:** `properLogRigidConvergentComparison`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/proper-log-rigid-convergent-comparison`.

For a proper strictly semistable fine Zariski-log scheme X of pure dimension over κ°, the natural map RΓ_log-rig(X/W°)→RΓ_log-conv(X/W°) is a quasi-isomorphism over K₀. In particular the admissible-system complex ω_X computes log rigid cohomology as well as log convergent cohomology. This statement is for constant coefficients and this proper semistable class; it does not replace the boundary log convergent realization by a rigid one.

**Hypotheses and conventions.**

- κ is finite, W=W(κ), K₀=Frac W, and X is proper over κ.
- The two realizations use the same admissible weak lift and its completion, with constant coefficient K₀. Properness of the component intersections supplies the ordinary rigid/convergent comparisons.

**Construction or proof.**

1. Build the residue-filtered double complex for both the weak-formal dagger realization and its completed formal/rigid realization.
2. Residues identify both first pages with direct sums of shifted cohomology of the same component intersections, using ordinary rigid respectively convergent cohomology. Each intersection is proper and smooth; the inherited ordinary proper comparison identifies these terms.
3. The natural completion map respects the filtration, residues and augmentations. Comparison of the convergent spectral sequences proves a quasi-isomorphism, identifying the completed admissible-system ω_X with the log rigid realization.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-rigid-realization`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-residue-double-complex`, `PadicDifferentialEquationsAndRigidCohomology:RD.4/proper-rigid-equals-convergent`.

**Acceptance.**

- For the standard log point the comparison identifies K₀ in degree zero.
- No comparison is exported for an arbitrary nonproper log boundary.

**Sources:** [DL] Appendix B.3, p. 119, immediately before Definition B.4. The proper strictly semistable case identifies log rigid with log convergent cohomology, citing Grosse-Klönne Theorem 5.3(ii), while boundary terms retain the convergent notation.; [GK05] Theorem 5.3(ii) and proof, pp. 28–29; §§5.1–5.2, pp. 26–28. Proper component intersections identify the residue spectral sequences of log rigid and log convergent realizations. The coefficient theorem is for Zariski locally constant coefficients; this target uses only the constant coefficient.

### 23. Log rigid and log convergent realizations

**Target:** `LogRigidRealization`. **Node:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/log-rigid-realization`.

For a fine κ°-log scheme X admitting a Zariski open cover with exact closed embeddings into log-smooth weak formal W°-schemes, and a finite-rank Zariski locally constant K₀-sheaf E, construct RΓ_log-rig(X/W°,E) from the simplicial dagger tubes of exactifications of the embedding-product diagonals, with coefficient complex sp⁻¹E⊗Ω•_log. The completed-formal/rigid version gives RΓ_log-conv(X/W°,E) and the natural map from the dagger realization. Exactifications and common cover refinements give canonical comparison equivalences. For the strictly semistable class, admissible weak lifts provide the local embedding data.

**Hypotheses and conventions.**

- Use the standard log point κ° and its weak formal Witt lift W°, with K₀=Frac W. Fix the cohomological totalization and alternating cover signs.
- Only finite-rank Zariski locally constant coefficients are included in this source realization. A general overconvergent logarithmic connection, including the Sym^k Igusa coefficient, requires the separate G3 realization and cannot use the locally constant coefficient theorem by changing its name.

**Construction or proof.**

1. Choose the local exact log embeddings. For each finite intersection take a product embedding and its exactification, then its dagger tube. The specialization pullback of E tensors with the relative log form complex.
2. Use the alternating cover diagram and derived global sections to form the realization. Compare choices through product exactifications of a common refinement; the relevant projections are strict and smooth near the embedded scheme, so relative open-polydisc Poincaré gives their quasi-isomorphisms.
3. Replace weak formal schemes by their completions to obtain the convergent version and the canonical comparison. For a semistable log scheme construct local admissible weak lifts using its normal-crossings embedding and smooth affine lift.

**Direct prerequisites:** `PadicDifferentialEquationsAndRigidCohomology:RD.4/relative-overconvergent-poincare`, `CrystallineCohomology:CR.5/log-exactification`, `CrystallineCohomology:CR.5/log-de-rham`, `CrystallineCohomology:CR.5`, `SchemeAndStackFoundations:SF.4`, `AdicSpacesPartII:F1/dagger-space`, `AdicSpacesPartII:F1/dagger-differentials`, `EnhancedDerivedSheaves:E2`.

**Uses.**

- PadicDifferentialEquationsAndRigidCohomology:RD.4/proper-log-rigid-convergent-comparison: Provides the two source/target cohomology realizations for the proper comparison.
- PadicDifferentialEquationsAndRigidCohomology:RD.4/supported-log-de-rham-complexes: Provides the weak-formal counterpart of the completed admissible-system log complexes.

**API.**

- `LogRigidRealization.refine` (equivalence): Cover refinement and a change of exactification give canonical quasi-isomorphisms, independent of further common refinement.
- `LogRigidRealization.pullback` (functoriality): A morphism of admissible log schemes and the induced pullback of E give the contravariant realization map, with identities and composition.
- `LogRigidRealization.toConvergent` (compatibility): Completing the weak formal embeddings gives a natural map from log rigid to log convergent cohomology.
- `LogRigidRealization.smoothAgreement` (compatibility): For a smooth scheme with log structure pulled back from the standard base, the relative log form complex is the ordinary form complex, and the realization agrees with the inherited ordinary rigid/coefficient realization whenever those coefficient classes coincide.

**Checks and worked examples.**

- **standard_log_point**: For the standard log point and constant coefficient K₀, relative H⁰=K₀ and H^q=0 for q≠0.
- **two_points**: For two disjoint standard log points with constant coefficient, H⁰=K₀², not a single K₀.
- **duplicate_cover**: Covering the standard log point by two copies of itself still gives H⁰=K₀; the cover totalization removes duplicate sections, unlike a direct sum of chart cohomology.
- **smooth_projective_line**: For P¹ with the log structure pulled back from κ°, the constant realization has H⁰=K₀, H²=K₀(−1), and H¹=0, agreeing with ordinary rigid cohomology.

**Acceptance.**

- The coefficient class is explicit in every signature.
- The completion map respects the de Rham differential and cover refinements.

**Sources:** [GK05] Lemma 1.4 and §1.5, pp. 8–9; §5.1, p. 26. Exactifications, relative Poincaré and weak-formal dagger tubes define log rigid cohomology, its comparison with the convergent realization, and semistable embedding data.

## Worked support and Frobenius checks

The trivial coefficient on A¹ has ordinary cohomology K in degree zero. Compact support gives K(−1) in degree two. With the closed point Z={0}, the ordinary support triangle and H¹(G_m)=K(−1) give H²_Z(A¹)=K(−1), while H⁰_Z(A¹)=0. This separates the three support conventions and fixes the Gysin twist sign. For q-Frobenius x↦x^q, the form dx/x pulls back to q·dx/x; this verifies Frobenius on H¹(G_m) and the codimension-one purity class.

For a smooth proper special fibre X and open U=A¹ inside X=P¹, the log proper-support group agrees with H_c,rig(A¹): its nonzero class is in degree two. Its map to H²(P¹) is an isomorphism. When U=X, every support kernel is the identity; when U is empty it is zero. For the standard log point the relative log complex has only K₀ in degree zero, while the absolute complex retains dlog t. These are tests of the complexes, including their grading, rather than assumptions on the spectral sequence.

In the log spectral sequence the intersection order is h=2j+k+1. For a single smooth component h>1 terms vanish, so only k=j=0 remains. For two components meeting transversely, the order-two term uses their intersection once. Projection to the positive complex retains j=0 and gives h=k+1; negative k disappears. The high-degree comparison at k=0,q=2d−1 retains only j≥1. Its j=0 exception prevents an unjustified claim about all degree-2d−1 cohomology.

The abstract theta presentation uses the existing quotient W/im θ. A zero operator leaves W unchanged and a surjective operator makes the quotient zero. Every θ(v) has zero class. These checks determine the quotient interface; identifying the actual modular differential with the Igusa coefficient de Rham differential is the additional geometric theorem G3. A direct limit of finite-dimensional finite-level quotients need not be finite-dimensional.

## Ordinary-locus consumer and dagger ownership

The proposed links are `PadicDifferentialEquationsAndRigidCohomology:RD.4 → AutomorphicGaloisRepresentationsPartII:AG2.4`, `RD.5 → AG2.4`, and `RD.6 → AG2.4`. The first supplies the comparison with the precise log coefficient realization. The second supplies finite-dimensional cohomology after that identification. The third supplies Frobenius weight bounds with the same coefficient and normalization. They are lower-to-consumer links and do not create reverse prerequisites in RD.4.

Grosse-Klönne Theorem 5.1 proves the ordinary coherent/dagger tube comparison with Berthelot’s j† realization. Applying it termwise to coherent log forms on a specified model gives a framed log comparison. A compact-support comparison also needs an ambient supported carrier, radius invariance and compatibility with proper changes of model. The HLTT ordinary-locus log realization must be matched to those exact complexes. These requirements are G2; the source’s ordinary theorem is not used as a blanket statement of the supported log extension.

F1 continues to own the dagger spaces, differential and ambient support/localization carriers. RD.4 owns their comparison with Berthelot and model-specific log proper support. This division retains one carrier-level theory and one special-fibre cohomology comparison. The three new planet candidates are the general Rigid Gysin isomorphism, Dagger–rigid cohomology comparison and Log rigid cohomology with proper support. Assembly must reconcile them with the inherited flags to obtain the six-planet inventory specified in the packet.

## Mathematical obligations for closure

- **G1 — Global support comparison and unrestricted Gysin proof**: Obtain and read Tsuzuki, Hiroshima Math. J. 29 (1999), 479–527, Theorem 4.1.1 and Corollaries 2.6.5–2.6.6, plus a full support-independence proof behind Berthelot 1986 Théorème 4. The publisher returned a bot-protection page; no 1999 proof was read. Supply the normal-coordinate residue-change compatibility needed to descend the local Gysin maps, and the support-preserving proper/finite-étale comparison. The 2003 primary statement witness fixes the unrestricted target and base-change compatibility but does not fill these proofs.
- **G2 — Global compact and log dagger comparison for the ordinary-locus consumer**: Prove that the F1 larger-radius ambient dagger support complex agrees with Berthelot compact support under radius changes and proper frame changes, then extend the coherent Theorem 5.1 comparison to the admissible supported log realization. Identify the exact HLTT ordinary-locus dagger log complex and horizontal boundary with that admissible model. Grosse-Klönne 2000 §5.2 announces compact support, while Theorem 5.1 itself is ordinary and contains no blanket log-support statement; its citation alone cannot close this obligation.
- **G3 — Geometric realization of the Igusa theta quotient**: Read Coleman 1996 §8 and Coleman 1997 Theorem 2.1 with the Igusa-level log coefficient model used by Pan v1 Proposition 5.1.7. Construct or import the finite-level geometric spaces, determinant line and theta resolution from their curve/modular-form owners, identifying their complex with log rigid Sym^k cohomology after extension to C. Check coefficient extension and finite-level finiteness hypotheses. Pan’s quotient definition was read; his cited geometric proof was not. No upward-tier geometric prerequisite is silently inserted into RD.4.

The planning pass represents every remaining RD.4 target, but these three obligations and the supplier contracts below prevent stage closure.

## Supplier contracts

- **`PadicDifferentialEquationsAndRigidCohomology:RD.3`**: Refine the inherited strong-fibration and affine coefficient-equivalence targets to the exact conormal-coordinate/cofinal-radius hypotheses and invertible horizontal-Frobenius Taylor-convergence proof from Berthelot I 1.3.7–1.3.8 and II 2.5.7–2.5.8. RD.4 imports these nodes and does not duplicate them. Required by `relative-overconvergent-poincare`.
- **`CrystallineCohomology:CR.5`**: Extend the existing CR.5/log-exactification, log-de-rham and semistable-residues interfaces to the weak-formal W[t] admissible systems used by GK05 and Disegni–Liu: exactifications of embedding-product diagonals, strict/smooth local projection charts, and the exterior SNC residue isomorphism with incidence signs. Existing algebraic exactification and absolute component residues are imported by node id. Analytic open-polydisc Poincaré, common-refinement independence of tube realizations and proper log rigid/convergent comparison are RD.4 targets; the PD Poincaré lemma is not used as an analytic substitute. Required by `supported-log-de-rham-complexes`, `log-residue-double-complex`, `log-rigid-proper-support-cohomology`, `log-rigid-realization`.
- **`AdicEtaleGeometry:A1`**: Provide the Berkovich tube quasi-étale specialization map to the formal-completion étale site and formal/special étale equivalence, including closed-stratum restriction, as the analytic-site interface used by Disegni–Liu B.1. This extends that roadmap’s A1 site interfaces; it is not an equivalence of tube sheaves with special-fibre sheaves. Required by `quasi-etale-specialization`.
- **`EnhancedDerivedSheaves:E1`**: Import derived pushforward, support-kernel triangles and adjunction transformations for bounded-below module-sheaf complexes on these sites, including naturality of connecting maps. Required by `quasi-etale-specialization`, `tube-proper-support-functor`, `algebraic-rigid-specialization-maps`.
- **`EnhancedDerivedSheaves:E2`**: Import hypercover descent and compatible derived pushforwards for coherent/log coefficient realizations; analytic and log comparison theorems themselves remain in RD.4/CR.5. Also supply the bounded-below derived inverse limits of boundary-ideal pro-de Rham complexes, cofinal invariance and compatibility with proper global sections used by Xu–Zhu. This is an inverse-limit construction, not adic module completion. Required by `etale-proper-de-rham-descent`, `supported-log-de-rham-complexes`, `algebraic-rigid-specialization-maps`, `log-rigid-realization`.
- **`EnhancedDerivedSheaves:E3`**: Import injective resolutions of diagrams, homotopy-independent totalizations, bounded filtered-complex spectral sequences and exact filtered colimits of vector spaces. These are homological foundations, not new rigid coefficient definitions. Required by `relative-overconvergent-poincare`, `etale-proper-de-rham-descent`, `log-residue-double-complex`, `igusa-theta-cokernel`.
- **`SchemeAndStackFoundations:SF.4`**: Supply the proper projective refinements of compactifications used in the Chow-lemma step of CT03 §6.4/§8.3, the smooth affine weak lifts from Elkik used by the MW comparison, and smooth closed-pair local-coordinate lift data for the Gysin reduction. Keep these model/lifting results in the birational/formal geometry owner; their rigid comparisons belong to RD.4. Required by `relative-overconvergent-poincare`, `etale-proper-de-rham-descent`, `general-rigid-gysin`, `log-rigid-realization`.
- **`AdicSpacesPartII:R3`**: Supply proper rigid coherent GAGA for analytification of the boundary-ideal pro-complex and its coherent terms, and the admissible-cover/tube support comparisons in Xu–Zhu §§2.2.3–2.2.4. This is a requested extension in that roadmap’s analytic direction. Required by `algebraic-rigid-specialization-maps`.
- **`AdicSpacesPartII:F1`**: Keep ownership of dagger spaces/forms and their larger-radius ambient support/localization carrier complexes. Supply the exact compact-support carrier of GK00 §4.8 with radius-change maps. The comparisons with Berthelot rigid and log proper-support cohomology belong to RD.4; do not duplicate them in F1. Required by `dagger-supported-comparison`.

## Baseline and prototype

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. Each of the following declaration statements was read at that commit, and its local shared-build source file matched the pinned raw GitHub file byte for byte.

- `mathlib:DerivedCategory` in `Mathlib.Algebra.Homology.DerivedCategory.Basic`: The derived category of an abelian category, assuming HasDerivedCategory; the homotopy localization and triangle machinery are imported, not new rigid-cohomology carriers.
- `mathlib:LinearMap.ker` in `Mathlib.Algebra.Module.Submodule.Ker`: The kernel submodule of a (semi)linear map; the light support-section illustration uses this existing carrier.
- `mathlib:LinearMap.range` in `Mathlib.Algebra.Module.Submodule.Range`: The image submodule of a linear map, used for the theta quotient.
- `mathlib:Submodule.mkQ` in `Mathlib.LinearAlgebra.Quotient.Defs`: The quotient projection M→M/S with its existing module structure.
- `mathlib:KaehlerDifferential.tensorKaehlerEquivOfFormallyEtale` in `Mathlib.RingTheory.Etale.Kaehler`: For commutative R,S,T, compatible algebra structures and a scalar tower, formally étale S→T gives T⊗_S Ω[S/R]≃Ω[T/R]. This supplies the algebraic coordinate-change ingredient; analytic overconvergence is not part of the declaration.
- `tauceti:TauCeti.kaehlerBasisOfFormallyEtale` in `TauCeti.RingTheory.Kaehler.FormallyEtale`: Base change of a basis of algebraic Kähler differentials across a formally étale map; the analytic local form bases still use RD.3/F1.

The reviewed library audit has no direct RD.4 entry. Its ColemanIntegration L0/L1 entries distinguish partial analytic foundations from missing MW/rigid cohomology; the specialized declarations were searched independently. The current Tau Ceti library and the nine roadmaps newer than the atlas snapshot were checked for the planned specialized carriers. Current AdicSpaces and StablePeriodicCurved supplied the nearby roadmap style and confirmed that their generic analytic and derived directions are inputs.

The [suggested file](../suggested/PadicDifferentialEquationsAndRigidCohomology--RD.4.lean) is a compact statement sketch. `SupportedSections`, `ThetaCokernel` and `thetaClass` have real bodies using the existing Mathlib kernel and quotient carriers. The universal-property endpoint and four examples elaborate at the pins. Heavy geometric names and signatures have a closing-comment inventory; their complete targets, APIs and checks are above. The sketch supplies no rigid or log cohomology implementation.

## Sources and versions read

Locators use printed pages for CT03, B86 and T03; global author-copy pages for BI and B97; PDF pages for GK00, GK05, DL, XZ and Pan. Each statement and proof route above is written for its target, in original prose. The read sections below identify the actual source inspection rather than assert that every surrounding section was read.

- **[CT03]** Bruno Chiarellotto and Nobuo Tsuzuki, [Cohomological descent of rigid cohomology for étale coverings](https://www.numdam.org/item/RSMUP_2003__109__63_0.pdf). Rend. Sem. Mat. Univ. Padova 109 (2003), 63–215, published PDF. Read 2026-10-14: §2.6 and Proposition 2.7.2, pp. 76–81; §4.2, pp. 112–115; §6.4, pp. 136–139; §§7.3–7.4, pp. 148–152; §8.3, pp. 156–162; proof passages in §§8.4–8.7, pp. 162–168; Theorem 9.1.1 and Corollary 9.1.2, p. 168; Propositions 10.5.1–10.5.3, pp. 185–188; Theorem 11.8.1 and Corollary 11.8.2, pp. 210–213; §12, pp. 213–215. SHA256 `f332fdec43e968bf5501e2442744eac35678c0bf19515724c084580c65aed271`.
- **[B86]** Pierre Berthelot, [Géométrie rigide et cohomologie des variétés algébriques de caractéristique p](https://www.numdam.org/article/MSMF_1986_2_23__R3_0.pdf). Mém. Soc. Math. France 23 (1986), 7–32, published PDF. Read 2026-10-14: Théorème 4, p. 23, and its compact-support setup; theorem announcement, not a full proof. SHA256 `dcbbfffefeb2b80a13de43c6d98ff3778792ea193839ba476c09517c4f827ad3`.
- **[BI]** Pierre Berthelot, [Cohomologie rigide et cohomologie rigide à supports propres, première partie](https://wstein.org/people/berthelo/publis/Cohomologie_Rigide_I.pdf). Author prepublication IRMAR 96-03, January 1996; global PDF pagination used alongside chapter pagination. Read 2026-10-14: Théorème 1.3.7 and Remarque 1.3.8, global pp. 44–45 (chapter I, pp. 20–21); Théorème 2.5.7 and its proof, global pp. 86–89 (chapter II, pp. 40–43); §2.5.8, p. 89. SHA256 `0630136eca195bed8208783d4931540220342fb95c883159f4fe3ec6bc8e0907`.
- **[B97]** Pierre Berthelot, [Finitude et pureté cohomologique en cohomologie rigide](https://wstein.org/people/berthelo/publis/Finitude.pdf). Author copy of Invent. Math. 128 (1997), 329–377; locators use author-copy page numbers. Read 2026-10-14: Proposition 1.8, pp. 12–13; Proposition 1.10, pp. 15–16; §§2.1–2.5, pp. 16–19, including proof of support localization; §1.2, pp. 6–7, support kernel exactness and its restriction sequence. SHA256 `0d08a9650307fa9e750b22d3bd70302ca2f776a5a718fc04939d24b81eb2a0be`.
- **[T03]** Nobuo Tsuzuki, [On base change theorem and coherence in rigid cohomology](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/tsuzuki.dm.pdf). Documenta Math., Extra Volume Kato (2003), 891–918, published PDF. Read 2026-10-14: §2.2, p. 895; Lemma 4.1.2 and proof, p. 908, as a primary statement witness for general Gysin; not the 1999 Gysin proof. SHA256 `e8ff85920449765c45ddf3f10e8d644b8e422771e9757e02f4d3c90ed1617cde`.
- **[GK00]** Elmar Grosse-Klönne, [Rigid analytic spaces with overconvergent structure sheaf](https://arxiv.org/pdf/1408.3329v1). arXiv:1408.3329v1, 2014 author version of J. reine angew. Math. 519 (2000), 73–95, with corrected Lemma 4.7. Read 2026-10-14: §§4.7–4.8, pp. 21–22; Theorem 5.1 and proof, pp. 23–24; §5.2, p. 24. SHA256 `f75311cc7638b225ec79a528d59abdc71f3cf7e3270ff081287c328d60cb071b`.
- **[DL]** Daniel Disegni and Yifeng Liu, [A p-adic arithmetic inner product formula](https://disegni-daniel.perso.math.cnrs.fr/AIPF.pdf). Published author PDF from the author site, version identified by SHA256; PDF pp. 113–121. Read 2026-10-14: Appendix B.1–B.3, PDF pp. 113–121, Definitions B.1 and B.4, Remark B.2, Lemmas B.3, B.5 and B.6, and (B.1)–(B.13). SHA256 `03237af87c4c5d8ee5aa8ea253f6c6f0607e98fea645635f4da98e21ff62e7b9`.
- **[XZ]** Daxin Xu and Xinwen Zhu, [Bessel F-isocrystals for reductive groups](https://arxiv.org/pdf/1910.13391). arXiv:1910.13391 downloaded 2026-10-14; exact bytes identified by SHA256. Read 2026-10-14: §2.2, pp. 11–13, including construction of the two maps and proof of Proposition 2.2.5. SHA256 `b8d153ef1822a20e8179005d4775e43fc3af7430d840d2b077b45cb8583667cd`.
- **[Pan]** Lue Pan, [On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1). arXiv:2209.06366v1, 14 September 2022. Read 2026-10-14: §§5.1.3–5.1.8, pp. 53–54, including Definition 5.1.6 and Proposition 5.1.7. SHA256 `0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4`.
- **[GK05]** Elmar Grosse-Klönne, [Frobenius and monodromy operators in rigid analysis, and Drinfel’d’s symmetric space](https://arxiv.org/pdf/1408.3346v1). arXiv:1408.3346v1, 2014 author version of J. Algebraic Geom. 14 (2005), 391–437; read in the cleared library. Read 2026-10-14: Lemma 1.4 and §1.5, pp. 8–9, including the realization and independence proof; §§5.1–5.2, pp. 26–28, admissible weak lifts and the residue double complex; Theorem 5.3(ii) and proof, pp. 28–29; §5.4, p. 29, connecting monodromy; Proposition 5.5 statement and proof, p. 29. SHA256 `84d6c4b36a3e1908f989ac1a139fb28055f6e7ab51384c26a48cd517f87e0713`.
