# (φ,Γ)-modules, Herr complexes and local Iwasawa cohomology

This roadmap builds on the cyclotomic period modules, Fontaine's equivalence, overconvergence and field-coefficient Herr cohomology that PadicHodgeTheory (P7 interfaces, P8 relative period sheaves) and FiniteFlatGroupsAndIntegralPadicHodgeTheory now own, and constructs their integral, extended-ring and relative extensions, the integral ψ operator, the φ–ψ comparison and the comparison with independently defined Iwasawa cohomology. It also supplies crystalline Wach lattices and the precise relative finiteness and triangulation statements required by regulators and local Langlands consumers. Each comparison is a map between independently constructed objects, with its normalization and functoriality specified.

The target-level planning pass is **complete** in the sense of blueprint PROTOCOL §0: all eight stages are planned. Its 98 targets retain the 32 identifiers from the earlier algebraic checkpoint and add 66 arithmetic and relative targets. Nine of them are comparison receipts that state an imported lower-tier result and only what PG adds, and twelve more are narrowed to their additions. There are 103 API items, 102 named acceptance examples, 26 planets, 12 pinned baseline declarations, 12 explicit gaps and 10 supplier requests. **No stage is closed and no target is claimed formalised.** The gaps below identify the source proofs, estimates and comparison inputs needed for refinement and independent review.

The [packet](../packets/PhiGammaModulesAndIwasawaCohomology.json) is the dependency graph. This document states the mathematics, API, examples and acceptance conditions. The [suggested Lean companion](../suggested/PhiGammaModulesAndIwasawaCohomology.lean) contains only light definitions on carriers available at the pins, end statements and selected examples. Its `herrD0` and `herrD1` name the two linear differential expressions displayed below. Arithmetic carriers, native comparison constructions and their full APIs are targets of this document. The companion has 190 lines and elaborates at the pinned baseline, with only admitted-proof warnings.

## Conventions and interfaces

Fix a prime p, a finite extension K/Q_p, a compatible algebraic closure and p-power roots of unity. Put K_∞=∪K(μ\_{pⁿ}), H_K=Gal(K̄/K_∞), Γ\_K=G_K/H_K and χ=χ\_cyc. For coefficients E/Q_p write O_E for its integers; relative coefficients A are Q_p-affinoid algebras. A_K is the integral cyclotomic coefficient ring, B_K=A_K[1/p], their dagger versions are overconvergent, and R_K is the Robba realization. The universal, tilde and sheaf variants carry the specified scalar inclusions. Finite projectivity, freeness, étaleness and existence of a global integral lattice are distinct conditions.

At a fixed radius use two rings R,S with the specified Frobenius map R→S. The linearization is S⊗\_(R,φ)M→N, with S acting through that map on the tensor's right R-action. An inferred identity self-algebra gives the wrong object even if the underlying ring types coincide. General K retains Witt Frobenius on its unramified coefficients.

The operators in the algebraic Herr calculations are linear over a fixed coefficient ring C. They can be semilinear over the period ring. Kernel splittings asserted C-linearly are not asserted period-ring-linearly. Algebraic finite freeness does not supply continuous coordinates in an arbitrary weak or annular topology.

For commuting F,G use d⁰(x)=((F−1)x,(G−1)x) and d¹(a,b)=(G−1)a−(F−1)b, in degrees 0,1,2. The signed comparison from φ-Herr to ψ-Herr has components id, diag(−ψ,id), −ψ. The separate ψ complex has ψ−1 in degrees **1 and 2**. Derived character specialization puts the resulting Herr complex in degrees 0,1,2, without an additional shift.

KPX's Δ\_K is the p-primary torsion subgroup of Γ\_K, trivial for odd p. The presentation that removes all finite torsion and uses a Z_p quotient is compared explicitly with it. At p=2 rational order-two averaging does not give integral descent: integral coefficients use a finite-group derived resolution. A topological generator and its completed group-algebra quotient are required for genuine p-adic generator changes; a finite polynomial identity alone proves only the stated finite-power map.

Hodge–Tate weights satisfy HT(Q_p(1))=+1. Berger-positive means weights ≤0. To treat an interval [a,b], first use T(−b), then N(T)=π^(−b)N(T(−b)) with its Tate basis. Frobenius on a Wach localization has arrival N[1/φ(π)], not generally N[1/π]. KPX radii transform [s,r]→[s/p,r/p]; Berger's convergence parameter has a different direction. These numerical parameters require an adapter.

Functional composition FS means F∘S. Thus FS=id and id−SF=dH+Hd for the retained Herr retraction. The tensor pairing D⊗E in cup products is over the common period ring; the complexes and their cup map are over fixed coefficients.

## Ownership and existing work

RS-26 assigned the canonical cyclotomic coefficient, Fontaine, overconvergence and Herr objects to PG.0–PG.3. Under the tier order of 2026-10-09, PadicHodgeTheory (tier 13) and FiniteFlatGroupsAndIntegralPadicHodgeTheory (tier 10) lie below PG, which is outside the 94, and the PadicHodgeTheory package moved this material down into its §§1.4–1.5 and 4.1–4.5. PG therefore imports the cyclotomic field of norms and coefficient rings, (φ,Γ)-modules and étaleness, Fontaine's equivalence, overconvergence and D_rig, Herr cohomology over a finite coefficient field, the Kedlaya–Liu relative local systems and the Wach–D_cris comparison, and states only its additions (packet restructure entry 1). The following inputs remain with their suppliers; the target lists give precise node IDs when a matching node exists.

| Supplier | Input and boundary |
| --- | --- |
| PadicHodgeTheory P7 annulus foundations | Existing plus/Amice/dagger scalar rings, cyclotomic Frobenius and Γ action; analytic annuli, norms and completed tensors. PG adds the relative annuli over affinoid algebras. |
| PadicHodgeTheory P7 interfaces | cyclotomic-field-of-norms-interface, phi-gamma-module-interface, etale-realization-and-overconvergence, herr-complex-interface, plan/robba-ring-of-p-adic-field, plan/robba-realisation-comparison, plan/wach-dcris-comparison: the field of norms, A_K and B_K, étale (φ,Γ)-modules, Fontaine's equivalence, overconvergence, D_rig, field-coefficient Herr cohomology and the Wach–D_cris comparison. PG adds integral, extended-ring, affinoid and normalization clauses. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 | Fontaine's equivalence over the Cohen ring of a characteristic-p field, torsion included, and finite coefficient change. |
| PadicHodgeTheory P7/P8 | B-pairs, the classical B-pair–Robba equivalence and B-pair cohomology handoff; Witt/Robba period-sheaf carriers; Kedlaya–Liu relative local systems, Frobenius cohomology and the relative bundle and B-pair equivalence. PG supplies the Γ-equivariant extended-ring, bundle and period-sheaf comparisons over K. |
| ArithmeticGaloisDuality R02/D7 | Actual continuous cochains, the topological carrier adapter, derived tensor/Tor, continuous Hochschild–Serre and field duality. Its finite-type adic contracts require an explicit extension for the affinoid Banach coefficients used here. |
| SelmerIwasawaCohomology L3 | Derived inverse-corestriction cochains, Shapiro, completed Galois action, descent and rational specialization. PG compares these with ψ complexes. |
| ColemanPowerSeries L1 | Canonical scalar ψ, trace divisibility, and base-valued trace=pψ on Z_p[[T]]. PG never reconstructs a competing scalar operator. |
| PadicMeasuresIwasawaAlgebras L0a/L1/L2 | Character and weight spaces, universal characters, completed group algebras and bounded ψ/Mellin interfaces. PG records their rank-one/Sen interpretation and arithmetic compatibility. |
| LocallyAnalyticDistributions L3 | Classical Mellin and generator change, plus the requested relative analytic and Robba-type Γ rings, coadmissible scalar extension and tensor exactness. |
| PadicHodgeTheory R06.2/R06.3 | Period functors, labeled rank-one Galois-character classification, crystalline inputs and N_dR=N_rig. PG proves the Wach and specialized cohomology comparisons. |
| PadicHodgeRegulators L1/L4 | Bloch–Kato local conditions and exponential (exact nodes L1/bloch-kato-subgroups and L1/bloch-kato-exponential), big logarithms, Coleman maps, interpolation and regulator images. PG exports the ψ-fixed and selected good-basis interfaces. |
| TauCetiRoadmap AdicSpaces/LocalFieldsRamification | Existing curve/GAGA and unramified-field/Frobenius machinery, imported through the named layers. |
| TauCetiRoadmap ClassFieldTheory Layers 7–9 | Continuous local reciprocity and the topological Weil abelianization. Use its geometric Artin map obtained by inversion from the primary arithmetic convention. |
| TriangulineVarietyAndItsLocalModel and local Langlands consumers | Almost de Rham deformation groupoids, localized-character rigidity, eigenvariety/paraboline geometry and GL₂ representation identifications. PG exports the routed coefficient modules, Herr/Ext and qualified triangulation results. |

The current upstream roadmaps beyond the atlas snapshot and the current Tau Ceti library were screened. LocalGaloisGroups already plans the local cyclotomic character and continuity. Mathlib supplies the underlying character, but the referenced local-character Tau Ceti file is absent from the supplied current library; continuity is not claimed built. PadicMeasuresIwasawaAlgebras is on TauCetiRoadmap main; its §2.2 and §3a.1 are the upstream forms of the L2 and L0a contracts used here (the read-only checkout used for planning sat on a pull-request branch). LocalGaloisDeformationRings §0.4 (TauCetiRoadmap #923) states Herr cohomology over finite local coefficient algebras; PG.3/herr-ext should cite it once its atlas packet carries the section. The reviewed AUDIT-38 and REV-AUDIT-38 identify existing continuous low-degree cup products and corestriction; their construction is reused here.

## Stage milestones

Stages are listed in atlas order. PG.3 imports ψ from PG.4; its analytic inverse is then used in the retained conditional homotopy. PG.5 imports the independent Iwasawa supplier. PG.6 combines the equivalences and crystalline period inputs. PG.7 uses all preceding comparisons for its relative finiteness and parameter results.

| Stage | Targets | Milestone | Coverage |
| --- | ---: | --- | --- |
| PG.0 | 7 | Imported coefficient system and étale condition, with the Kedlaya–Liu all-component comparison, relative annuli and extended-ring étale variants added here | planned; open |
| PG.1 | 14 | Imported Fontaine equivalence and relative local systems, with the torsion and change-of-field clauses, Witt-vector descent and (c,d)-pure comparison added here | planned; open |
| PG.2 | 6 | Imported overconvergence and D_rig, with integral overconvergent lattices, extended-ring and all-module decompletion and equivariant period comparisons added here | planned; open |
| PG.3 | 24 | Signed φ–ψ homotopy, affinoid and integral Galois–Herr comparison, cochain-level cups and field maps, residue normalization and derived dyadic descent; field-coefficient Herr theory imported | planned; open |
| PG.4 | 16 | Integral canonical ψ instantiated with topology and radius compatibility | planned; open |
| PG.5 | 10 | Independent inverse-corestriction comparison and normalized analytic pairings | planned; open |
| PG.6 | 8 | Unramified crystalline Wach theory with the imported filtered D_cris comparison, unramified base change and selected good bases | planned; open |
| PG.7 | 13 | Perfectness and derived base change, rank-one classification and qualified global triangulation | planned; open |

## PG.0. Cyclotomic coefficients and semilinear actions

The field-level cyclotomic coefficient rings, their φ and Γ\_K actions and the étale condition are owned by PadicHodgeTheory (P7 interfaces and annulus foundations), below PG in the tier order, and are imported. The work here is the general Frobenius category with its free covers and Ext, the comparison with the Kedlaya–Liu all-component system, the relative annuli over affinoid algebras, and the integral and extended-ring étale variants. Every linearization records its scalar map.

**Planets:** Frobenius modules.

<a id="phigammamodulesandiwasawacohomology-pg-0-phi-module"></a>

### 0.1. Semilinear Frobenius modules

**Target:** `PhiModule` (definition); `PG.0/phi-module`.

For a commutative ring S with endomorphism σ, a Frobenius module consists of an S-module M and an S-linear isomorphism S⊗\_{S,σ}M → M. Its associated map F(m)=L(1⊗m) is σ-semilinear. Morphisms are S-linear maps commuting with F. Finite generation, projectivity and freeness are separate conditions.

**Hypotheses.** S commutative; σ:S→S unital; no invertibility of σ assumed.

**Inputs.** `mathlib:TensorProduct.lift`.

**Proof route.** 1. Use the existing tensor product with right S-action through σ. 2. Recover L from a semilinear F by the tensor universal property; require that this L is invertible. 3. Composition and identities are those of underlying linear maps.

**Source locators.** [KL-I](#source-kl-i), §1.5, Convention 1.5.1, p.24.

**Uses.** PG.1: State the étale category without suppressing the linearization. Kedlaya–Liu §3.2: Form the Witt-vector Frobenius categories.

**API.**

- `PhiModule.linearization_apply` (characterisation): L(s⊗m)=s F(m).
- `PhiModule.hom_ext` (extensionality): Morphisms agreeing on underlying vectors agree.
- `PhiModule.baseChange` (functoriality): An equivariant ring map S→S′ induces scalar extension with its canonical linearization.

**Acceptance examples.**

- `phi_module_identity`: For σ=id, the datum is an invertible S-linear operator.
- `phi_module_frobenius_ring`: For S=F_p[U], σ(U)=U^p, M=S and F=σ, the linearization is an isomorphism although F is not surjective.
- `phi_module_zero_operator`: On a nonzero free module over a nonzero ring, F=0 does not give an invertible linearization.

**Check.** Do not replace invertible linearization by a bijective underlying F; those differ when σ is not surjective.

<a id="phigammamodulesandiwasawacohomology-pg-0-free-cover"></a>

### 0.2. Free Frobenius covers and projective complements

**Target:** `phiModule_freeCover` (theorem); `PG.0/free-cover`.

Every finitely generated Frobenius module is a quotient of a finite free Frobenius module. For finite projective M, the kernel N of such a cover is finite projective and the underlying S-module M⊕N is finite free; no equivariant splitting of the quotient is asserted.

**Hypotheses.** The Frobenius action is an invertible linearization; M finitely generated; projectivity is added only for the complement assertion.

**Inputs.** [PG.0/phi-module](#phigammamodulesandiwasawacohomology-pg-0-phi-module).

**Proof route.** 1. Choose generators of M and matrices describing the linearization and its inverse. 2. Enlarge the generator set using the defect matrix; the block matrix is invertible by clearing its top-left block. 3. For projective M split the surjection S-linearly and give its kernel the induced Frobenius action.

**Source locators.** [KL-I](#source-kl-i), Lemma 1.5.2 and Corollary 1.5.3, pp.24–25.; [KL-II](#source-kl-ii), Appendix A, first correction to Lemma 1.5.2, p.189.

**Check.** A splitting of underlying modules need not commute with Frobenius; keep that distinction in all complement arguments.

<a id="phigammamodulesandiwasawacohomology-pg-0-phi-cohomology"></a>

### 0.3. Frobenius cohomology as Ext

**Target:** `phiCohomologyExt` (comparison); `PG.0/phi-cohomology`.

The complex [M --(F−1)→ M] in degrees 0 and 1 computes Ext^i_{S{F}}(S,M); its cohomology is the kernel in degree 0, cokernel in degree 1 and zero in higher degrees.

**Hypotheses.** S{F} is the skew polynomial ring with F s=σ(s)F; S is its left module via σ; M is a left skew-ring module.

**Inputs.** [PG.0/phi-module](#phigammamodulesandiwasawacohomology-pg-0-phi-module), `mathlib:CochainComplex.of`.

**Proof route.** 1. Use the two-term free left S{F}-resolution of S whose differential is right multiplication by F−1. 2. Compare its Hom complex to the displayed additive differential; the latter is generally not S-linear. 3. For F^d use cyclic induction, retaining the enlarged scalar fixed ring.

**Source locators.** [KL-I](#source-kl-i), Definition 1.5.4, p.24; Remarks 1.5.5–1.5.6, p.25.

**Check.** Use additive or fixed-scalar cochains: F−1 is not an S-linear map for arbitrary σ.

<a id="phigammamodulesandiwasawacohomology-pg-0-field-of-norms"></a>

### 0.4. Field of norms of the cyclotomic tower (imported)

**Target:** `fieldOfNorms` (comparison); `PG.0/field-of-norms`.

PG uses the field of norms only for the cyclotomic tower, and imports it. PadicHodgeTheory:P7/cyclotomic-field-of-norms-interface constructs, for K/Q_p finite and K_∞=K(μ\_{p^∞}), the field of norms X_K (norm-compatible sequences, addition by limits of norms of sums), identifies it with E_K inside C^♭, matches finite extensions L_∞/K_∞ with finite separable extensions of X_K, and so identifies H_K with G_{X_K}. This node records that PG.0–PG.2 use exactly that statement, for the algebraic closure and roots of unity fixed in the conventions. No general APF construction and no Kummer-tower statement is planned here.

**Hypotheses.** K finite over Q_p; the closure and the compatible system of p-power roots of unity are those of the PG conventions.

**Inputs.** `PadicHodgeTheory:P7/cyclotomic-field-of-norms-interface`.

**Proof route.** 1. Cite the owner construction, its finite-extension dictionary and the identification H_K≅G_{X_K}; closure changes are the owner's natural equivalences.

**Source locators.** [Berger-intro](#source-berger-intro), §III.2.1, pp.22–23.

**Uses.** PG.0/cyclotomic-coefficients: Read A_K, B_K and H_K≅G_{X_K} from the owner.

**Check.** Do not plan a second norm-field construction. The Kummer tower is FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kummer-field-of-norms and is not used by any PG target; the general APF theory of Fontaine–Wintenberger is not needed here.

<a id="phigammamodulesandiwasawacohomology-pg-0-cyclotomic-coefficients"></a>

### 0.5. Cyclotomic integral and bounded coefficients

**Target:** `cyclotomicCoefficients` (comparison); `PG.0/cyclotomic-coefficients`.

The cyclotomic coefficient rings are imported. PadicHodgeTheory:P7/cyclotomic-field-of-norms-interface supplies the Cohen ring A_K⊂W(C^♭) lifting E_K, B_K=A_K[1/p], the p-adically completed maximal unramified extensions A⊂B with B^{H_K}=B_K, and the overconvergent rings B^{†,r}=B∩B̃^{†,r} and B_K^{†,r}=(B^{†,r})^{H_K}. PadicHodgeTheory:P7:annulus-foundations/plan/overconvergent-cyclotomic-rings gives the presentation for K=Q_p in the variable π, and PadicHodgeTheory:P7/plan/robba-ring-of-p-adic-field gives B^†\_{rig,K}=R_K with its Fréchet and LF topologies, its identification with Laurent series in π\_K over F′, and the continuous extension of φ and Γ\_K. This node adds only the comparison with the Kedlaya–Liu cyclotomic coefficient system, on which Γ=Z_p^× acts on all components: for K≠Q_p its rings are induced from the Γ\_K-rings above, and induction and restriction are inverse equivalences of the corresponding (φ,Γ)-module categories.

**Hypotheses.** K finite over Q_p; fixed compatible p-power roots of unity; the unramified coefficient field is F′=K_∞∩K_0^nr, with Witt Frobenius, as the owner node records. The all-component convention is that of Kedlaya–Liu Remark 9.5.3; it is compared with the Γ\_K convention by induction, not identified with it by notation.

**Inputs.** `PadicHodgeTheory:P7/cyclotomic-field-of-norms-interface`, `PadicHodgeTheory:P7:annulus-foundations/plan/overconvergent-cyclotomic-rings`, `PadicHodgeTheory:P7/plan/robba-ring-of-p-adic-field`, `mathlib:cyclotomicCharacter`.

**Proof route.** 1. Read the rings, their inclusions and topologies from the three owner nodes; the cyclotomic character is the Mathlib map. 2. Write the Kedlaya–Liu rings of Definitions 9.5.1–9.5.2 as the induction of the owner rings from Γ\_K to Z_p^×, and check that induction and restriction are mutually inverse on (φ,Γ)-modules, as Remark 9.5.3 asserts.

**Source locators.** [CC-1998](#source-cc-1998), §I.1–I.4, pp.3–6; §II.1–II.2, pp.6–10, author PDF pagination.; [KL-I](#source-kl-i), Definitions 9.5.1–9.5.2, p.200; Remark 9.5.3, p.201.

**Uses.** PG.1: Provide the actual coefficient rings for D and V. PG.2–PG.4: Compare bounded, dagger and annular realizations without conflating carriers.

**API.**

- `cyclotomicCoefficients.allComponents` (equivalence): Induction from Γ\_K to Z_p^× identifies (φ,Γ\_K)-modules over the owner rings with Kedlaya–Liu all-component (φ,Γ)-modules; restriction is the inverse.

**Check.** The owner distinctions stand: the weak topology is not the p-adic topology, and A_K, A_K^† are not the rational Robba ring. Do not identify the all-component category with the Γ\_K category by notation.

<a id="phigammamodulesandiwasawacohomology-pg-0-coefficient-actions"></a>

### 0.6. Commuting actions and radius changes

**Target:** `cyclotomicActions` (theorem); `PG.0/coefficient-actions`.

The field-level actions are imported: for K=Q_p, PadicHodgeTheory:P7:annulus-foundations/plan/cyclotomic-frobenius and /cyclotomic-gamma-action give φ(π)=(1+π)^p−1 and γ(π)=(1+π)^{χ(γ)}−1 with integral binomial coefficients, their commutation and radius behaviour, and the basis (1+π)^i, 0≤i<p, of A_{Q_p} over φ(A_{Q_p}); PadicHodgeTheory:P7/plan/robba-ring-of-p-adic-field extends them to R_K for finite K. This node states the relative form used in PG.4 and PG.7. For a Q_p-affinoid algebra A and 0<s≤r≤C(π\_K) put R_A^{[s,r]}(π\_K)=R^{[s,r]}(π\_K)⊗̂\_{Q_p}A. Then φ:R_A^{[s,r]}(π\_K)→R_A^{[s/p,r/p]}(π\_K) and the Γ\_K-action are A-linear, continuous and commuting, and φ makes the target R_A^{[s/p,r/p]}(π\_K) a free module of rank p over the source; for K=Q_p a basis is (1+π)^i, 0≤i<p. For finite L/K and small r, R_A^{rẽ\_K/ẽ\_L}(π\_L) is finite étale over R_A^r(π\_K), free of rank [L(μ\_{p^∞}):K(μ\_{p^∞})], equivariantly for Γ\_L⊂Γ\_K and φ.

**Hypotheses.** 0<s≤r≤C(π\_K) and A a Q_p-affinoid algebra; on F′ Frobenius acts by Witt functoriality and Γ\_K through Gal(F′/F).

**Inputs.** [PG.0/cyclotomic-coefficients](#phigammamodulesandiwasawacohomology-pg-0-cyclotomic-coefficients), `PadicHodgeTheory:P7:annulus-foundations/plan/cyclotomic-frobenius`, `PadicHodgeTheory:P7:annulus-foundations/plan/cyclotomic-gamma-action`, `PadicHodgeTheory:P7/plan/robba-ring-of-p-adic-field`, `PadicHodgeTheory:P7:annulus-foundations`.

**Proof route.** 1. Take the field-level operators, their commutation and radius bounds from the owner nodes. 2. Complete the tensor product with A; A-linearity and commutation are inherited, and continuity follows from the owners' Gauss-norm bounds and the completed-tensor contract of the annulus stage. 3. For K=Q_p pass the owner decomposition f=Σ\_{i<p}(1+π)^iφ(f_i) to the completed tensor product. For general K descend through the finite étale extension of KPX Remark 2.2.4 and track the radius constants.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 2.2.2, Notation 2.2.3 and Remark 2.2.4, p.16.

**Check.** The free module is the target annulus over the source annulus via φ, as corrected in source issue E1; the retrieved KPX v3 prints the opposite orientation. Retain both the radius shift [s,r]→[s/p,r/p] and the coefficient Frobenius on F′.

<a id="phigammamodulesandiwasawacohomology-pg-0-etale-phi-module"></a>

### 0.7. Étale Frobenius lattices

**Target:** `EtalePhiModule` (definition); `PG.0/etale-phi-module`.

The étale condition over B_K, B_K^† and the Robba ring R_K, with finite coefficients, is the owner's (PadicHodgeTheory:P7/phi-gamma-module-interface): a lattice over A_K or A_K^† with invertible Frobenius linearization, and over R_K descent to such an overconvergent module, equivalently all Newton slopes zero. This node adds the two variants PG.1–PG.2 use. (i) Over the integral rings A_K and A_K^†, an étale (φ,Γ\_K)-module is a finite projective module with invertible Frobenius linearization and a continuous semilinear Γ\_K-action commuting with φ. (ii) Over the extended rings B̃\_K, B̃\_K^† and R̃\_K, a (φ,Γ\_K)-module is étale when its underlying φ-module descends to a φ-module over Ã\_K, Ã\_K^† and Ã\_K^† respectively. In each case the property does not depend on the chosen descent, and Γ\_K acts on some descent but not necessarily on every one.

**Hypotheses.** Integral lattice spans the rational module; Γ-stable lattices are chosen when transporting integral representations. For a relative affinoid, global lattice existence is additional data and is not deduced from pointwise conditions.

**Inputs.** `PadicHodgeTheory:P7/phi-gamma-module-interface`, [PG.0/phi-module](#phigammamodulesandiwasawacohomology-pg-0-phi-module), [PG.0/cyclotomic-coefficients](#phigammamodulesandiwasawacohomology-pg-0-cyclotomic-coefficients), [PG.0/coefficient-actions](#phigammamodulesandiwasawacohomology-pg-0-coefficient-actions).

**Proof route.** 1. Use the owner definition over B_K, B_K^† and R_K. 2. For the integral and extended rings impose descent of the underlying φ-module with invertible linearization, using the Frobenius category of PG.0/phi-module. 3. Prove that compatible scalar extensions preserve the property and formulate morphisms without fixing a descent.

**Source locators.** [KL-I](#source-kl-i), Definition 9.5.5, p.201.; [KPX-v3](#source-kpx-v3), Definitions 2.2.6 and 2.2.12, pp.17–18.

**Uses.** PG.1–PG.2: State the essential image of Galois representations. PG.7: Keep global and fiberwise conditions distinct.

**API.**

- `EtalePhiModule.lattice_spans` (characterisation): The selected integral lattice extends isomorphically to the rational module.
- `EtalePhiModule.isInvariant` (relation): Γ and φ satisfy γφ=φγ on vectors and on scalars.
- `EtalePhiModule.baseChange` (compatibility): The specified integral/rational extension maps carry the lattice and its linearization to the corresponding étale object.

**Acceptance examples.**

- `etale_trivial_line`: The unit line with φ(e)=e and Γ(e)=e is étale.
- `etale_nonunit_slope`: The rational line with φ(e)=p e is not étale over B_K; its nonzero slope cannot be removed by an integral lattice.
- `etale_semilinear_identity`: For nontrivial scalar Frobenius, the unit-line φ sends a e to φ(a)e, not to a e.

**Check.** A stable submodule with merely F(N)⊂N is insufficient; require the integral linearization isomorphism.

**Stage acceptance.** Imported coefficient system and étale condition, with the Kedlaya–Liu all-component comparison, relative annuli and extended-ring étale variants added here. All comparisons must be the stated natural maps, with the sign, scalar, topology and coefficient hypotheses above.

**Remaining refinement.** Field-level coefficient rings, actions and the étale condition are owned by PadicHodgeTheory P7 (cyclotomic-field-of-norms-interface, phi-gamma-module-interface, robba-ring-of-p-adic-field). Remaining here: the Kedlaya–Liu all-component comparison, the relative-annulus bounds and the extended-ring étale variants.


## PG.1. Fontaine’s étale equivalence

Fontaine's equivalence (rational, with coefficients and for lattices) is owned by PadicHodgeTheory:P7/etale-realization-and-overconvergence, and the Kedlaya–Liu relative local systems by PadicHodgeTheory P8; the corresponding nodes below are receipts. PG adds the torsion and change-of-field clauses, and keeps the Witt-vector descent over perfect F_p-algebras and the (c,d)-pure comparison, whose placement is recorded for the maintainer.

**Planets:** Frobenius-fixed basis torsor, Artin–Schreier–Witt descent.

<a id="phigammamodulesandiwasawacohomology-pg-1-fontaine-d"></a>

### 1.1. Fontaine invariants functor

**Target:** `fontaineD` (comparison); `PG.1/fontaine-D`.

Fontaine's functor is imported. PadicHodgeTheory:P7/etale-realization-and-overconvergence states that V↦D(V)=(B⊗V)^{H_K} is an exact tensor equivalence onto étale (φ,Γ\_K)-modules over B_K, extending to finite coefficients and to stable Z_p-lattices T↦D(T)=(A⊗\_{Z_p}T)^{H_K} over A_K; FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-cohen-ring gives the underlying equivalence for the Cohen ring of the norm field E_K, which with H_K≅G_{E_K} identifies D(T) as a finite free A_K-module of rank rank(T) with A⊗\_{A_K}D(T)≅A⊗T. PG uses D(T) with the diagonal H_K-invariants, the residual Γ\_K-action and the coefficient Frobenius, and adds nothing to its construction.

**Hypotheses.** K finite over Q_p; T finite free over Z_p with continuous G_K-action; the rings are those of PG.0/cyclotomic-coefficients.

**Inputs.** `PadicHodgeTheory:P7/etale-realization-and-overconvergence`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-cohen-ring`, [PG.0/etale-phi-module](#phigammamodulesandiwasawacohomology-pg-0-etale-phi-module), [PG.0/field-of-norms](#phigammamodulesandiwasawacohomology-pg-0-field-of-norms).

**Proof route.** 1. Cite the owner equivalence for lattices and the Cohen-ring equivalence for the comparison isomorphism A⊗\_{A_K}D(T)≅A⊗T and the rank. 2. Read the Γ\_K-action as the residual action G_K/H_K on invariants, as the owner does.

**Source locators.** [CC-1998](#source-cc-1998), §I.4, pp.5–6.; [KL-I](#source-kl-i), Theorem 9.5.4(a)–(b), p.201.

**Uses.** PG.1 equivalence: Build the functor and its unit/counit from evaluation. PG.4–PG.5: Use actual étale module coordinates in ψ-cohomology.

**Check.** Take invariants of the diagonal tensor product, never invariants of A alone followed by an unproved tensor identity.

<a id="phigammamodulesandiwasawacohomology-pg-1-fontaine-v"></a>

### 1.2. Frobenius-fixed inverse functor

**Target:** `fontaineV` (comparison); `PG.1/fontaine-V`.

The inverse functor is imported with the owner's equivalence (PadicHodgeTheory:P7/etale-realization-and-overconvergence): for an étale (φ,Γ\_K)-module D over A_K, V(D)=(A⊗\_{A_K}D)^{φ=1} is a finite free Z_p-module of rank rank(D) with continuous G_K-action, and A⊗V(D)→A⊗D is an equivariant isomorphism; over the Cohen ring this is FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-cohen-ring. PG uses V(D) to reconstruct lattices in PG.2 and PG.6.

**Hypotheses.** D finite free étale over A_K; G_K acts through A and its quotient action on D.

**Inputs.** `PadicHodgeTheory:P7/etale-realization-and-overconvergence`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-cohen-ring`, [PG.0/etale-phi-module](#phigammamodulesandiwasawacohomology-pg-0-etale-phi-module).

**Proof route.** 1. Cite the owner inverse functor and its comparison isomorphism.

**Source locators.** [CC-1998](#source-cc-1998), §I.4, pp.5–6.; [KL-I](#source-kl-i), Theorem 9.5.4(a)–(b), p.201.

**Uses.** PG.1 equivalence: Construct the inverse and its counit. PG.6: Reconstruct a crystalline lattice from its Wach realization.

**Check.** An arbitrary Robba Frobenius module does not satisfy this finite-rank fixed-vector theorem.

<a id="phigammamodulesandiwasawacohomology-pg-1-fontaine-equivalence"></a>

### 1.3. Fontaine equivalence and comparison identities

**Target:** `fontaineEquivalence` (comparison); `PG.1/fontaine-equivalence`.

Fontaine's equivalence is imported: PadicHodgeTheory:P7/etale-realization-and-overconvergence states that D and V are mutually inverse exact tensor equivalences between continuous Q_p-representations of G_K and étale (φ,Γ\_K)-modules over B_K, and between stable Z_p-lattices and integral étale modules over A_K, compatibly with finite coefficient fields. PG uses the unit T→V(D(T)), t↦1⊗t, and counit D→D(V(D)) of that equivalence, and their compatibility with the comparison isomorphisms over A.

**Hypotheses.** K finite over Q_p; integral categories and topologies as in the owner node.

**Inputs.** `PadicHodgeTheory:P7/etale-realization-and-overconvergence`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-cohen-ring`, [PG.1/fontaine-D](#phigammamodulesandiwasawacohomology-pg-1-fontaine-d), [PG.1/fontaine-V](#phigammamodulesandiwasawacohomology-pg-1-fontaine-v).

**Proof route.** 1. Cite the owner equivalence; the unit and counit are its natural transformations, checked on pure tensors after extension to A.

**Source locators.** [KL-I](#source-kl-i), Theorem 9.5.4(a)–(b), p.201; Theorem 9.5.6(a)–(b), p.201.; [CC-1998](#source-cc-1998), §I.4, pp.5–6.

**Check.** The equivalence is the owner's theorem, not a structure field assumed in either functor.

<a id="phigammamodulesandiwasawacohomology-pg-1-torsion-rational-compatibility"></a>

### 1.4. Torsion, rational coefficients and change of field

**Target:** `fontaineCoefficientCompatibility` (theorem); `PG.1/torsion-rational-compatibility`.

Over the owner's rational and lattice equivalences (PadicHodgeTheory:P7/etale-realization-and-overconvergence), PG adds the torsion and change-of-field clauses it uses. The functor T↦(A⊗T)^{H_K} identifies finite p-primary Z_p-modules with continuous G_K-action with finite étale torsion (φ,Γ\_K)-modules over A_K; it commutes with reduction of a lattice modulo p^n, with inverting p after choosing a lattice, with finite flat coefficient extension (FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-with-coefficients), with tensor products and duals, and with restriction and induction for finite L/K through the ring maps of PG.0/coefficient-actions.

**Hypotheses.** Finite torsion objects may have mixed elementary divisors; finite free Z/p^n coefficients are the basic ASW case, extended by exact devissage. For Q_p coefficients choose a G_K-stable Z_p-lattice and prove independence; scalar extensions are finite flat, not arbitrary nonflat functors.

**Inputs.** `PadicHodgeTheory:P7/etale-realization-and-overconvergence`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-cohen-ring`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-with-coefficients`, [PG.1/fontaine-equivalence](#phigammamodulesandiwasawacohomology-pg-1-fontaine-equivalence), [PG.0/coefficient-actions](#phigammamodulesandiwasawacohomology-pg-0-coefficient-actions), [PG.1/asw-projectivity](#phigammamodulesandiwasawacohomology-pg-1-asw-projectivity).

**Proof route.** 1. Torsion modules: the Cohen-ring equivalence of the FiniteFlat owner covers finitely generated étale φ-modules over the Cohen ring, torsion included; add the Γ\_K-action by the residual action as the owner of the rational case does, and use exact dévissage for mixed elementary divisors. 2. A rational representation has a stable lattice by compactness; compare lattice choices after inverting p. 3. Coefficient change is the FiniteFlat owner's; identify restriction on rings and residual Γ-groups and construct induction and trace maps with their transitivity.

**Source locators.** [KL-I](#source-kl-i), Proposition 3.2.7, p.74; Theorem 9.5.6(a)–(b), p.201.; [KPX-v3](#source-kpx-v3), Lemma 2.2.18, p.20.

**Check.** Do not call a mixed-torsion object finite free over Z/p^n; do not assert arbitrary integral exactness for nonflat coefficient change.

<a id="phigammamodulesandiwasawacohomology-pg-1-rank-one-dictionary"></a>

### 1.5. Rank-one and unramified normalizations

**Target:** `fontaineRankOne` (theorem); `PG.1/rank-one-dictionary`.

With local reciprocity sending a uniformizer to geometric Frobenius, the cyclotomic character corresponds to x↦N_{K/Q_p}(x)|x|\_K. Over Q_p the associated line has φ(e)=e and γ(e)=χ(γ)e. An unramified character whose geometric Frobenius value is u has φ(e)=u e. Tensor and dual send parameters to product and inverse.

**Hypotheses.** Integral unramified characters have u∈O_E^×; rational characters and non-étale rank-one Robba modules are distinguished. At general K use the character construction with all embeddings, not a single coordinate δ(p).

**Inputs.** `PadicHodgeTheory:P7/etale-realization-and-overconvergence`, [PG.1/torsion-rational-compatibility](#phigammamodulesandiwasawacohomology-pg-1-torsion-rational-compatibility), [PG.7/rank-one-characters](#phigammamodulesandiwasawacohomology-pg-7-rank-one-characters).

**Proof route.** 1. Trace the chosen reciprocity normalization through the tensor fixed-vector comparisons. 2. Calculate the cyclotomic and unramified generators and check them under duals and restriction.

**Source locators.** [Ding-2025](#source-ding-2025), §2.1, p.9, reciprocity and cyclotomic normalization.; [KPX-v3](#source-kpx-v3), Construction 6.2.4, Examples 6.2.6 and Notation 6.2.7, pp.56–58.

**Check.** Geometric and arithmetic Frobenius values are inverse; the convention must accompany every rank-one formula.

<a id="phigammamodulesandiwasawacohomology-pg-1-frobenius-idempotents"></a>

### 1.6. Fixed scalars and clopen components

**Target:** `frobeniusFixedIdempotents` (theorem); `PG.1/frobenius-idempotents`.

For a perfect F_p-algebra R, each x with x^p=x has a unique decomposition x=Σ\_{i∈F_p} i e_i into pairwise orthogonal idempotents with Σe_i=1; e_i is the Lagrange polynomial selecting x=i. Thus R^{φ=1} consists of locally constant F_p-valued functions, and equals F_p for nonzero connected R.

**Hypotheses.** R perfect of characteristic p; connectedness and nonzeroness are needed for the last assertion.

**Inputs.** .

**Proof route.** 1. Use the separable factorization X^p−X=∏(X−i) and the existing Chinese remainder/idempotent API. 2. Prove orthogonality, sum and recovery by polynomial identities; uniqueness follows componentwise.

**Source locators.** [KL-I](#source-kl-i), Lemma 3.1.3 and Corollary 3.1.4, pp.65–66.

**Check.** Disconnected rings can have more fixed scalars than F_p. This is not a claim that every fixed element is a single constant.

<a id="phigammamodulesandiwasawacohomology-pg-1-asw-fixed-basis"></a>

### 1.7. Frobenius-fixed basis torsor

**Target:** `aswFixedBasisCover` (construction); `PG.1/asw-fixed-basis`.

Let n,a≥1, R perfect over F_p and M finite projective over W_n(R), with strictly positive rank on each component and invertible φ^a-linearization. Construct a faithfully finite étale R-algebra S on which M acquires a φ^a-fixed basis. A selected fixed basis modulo p^m, m≤n, lifts after a further such cover. The representing cover parametrizes bases, through the determinant-unit closed-open locus of the fixed-tuple scheme.

**Hypotheses.** Treat each rank component separately; the rank-zero object needs no basis cover.

**Inputs.** [PG.0/phi-module](#phigammamodulesandiwasawacohomology-pg-0-phi-module), [PG.1/frobenius-idempotents](#phigammamodulesandiwasawacohomology-pg-1-frobenius-idempotents).

**Proof route.** 1. Write the Frobenius equations for tuples; modulo p their differential is invertible. 2. Restrict to the determinant-unit locus before asserting a basis torsor; fixed determinant values make this locus closed and open after trivialization. 3. Lift through Witt truncations, using formal étaleness and the compatible chosen mod-p^m basis.

**Source locators.** [KL-I](#source-kl-i), Lemma 3.2.6, pp.71–73.; [KL-II](#source-kl-ii), Appendix A, correction to Lemma 3.2.6, p.189.

**Uses.** PG.1 ASW equivalence: Trivialize modules to obtain locally constant fixed sections. PG.1 Fontaine inverse: Supply fixed bases at each torsion level.

**API.**

- `aswFixedBasisCover.isBasis` (characterisation): The universal tuple is a basis, not just a fixed tuple.
- `aswFixedBasisCover.fixed` (relation): Each basis vector satisfies φ^a(e)=e.
- `aswFixedBasisCover.truncate` (compatibility): The chosen mod-p^m basis is recovered under truncation.

**Acceptance examples.**

- `asw_basis_trivial`: For M=W_n(R)^d with standard Frobenius, the standard basis defines a section.
- `asw_basis_dependent_tuple`: The zero tuple is fixed but lies outside the determinant-unit locus for d>0.
- `asw_basis_rank_components`: For R=F_p×F_p with ranks 1 and 2, the cover uses the two clopen rank components rather than a spurious single rank.

**Check.** The scheme of all fixed tuples includes dependent tuples and is not the required basis torsor.

<a id="phigammamodulesandiwasawacohomology-pg-1-asw-equivalence"></a>

### 1.8. Nonabelian Artin–Schreier–Witt descent

**Target:** `artinSchreierWittEquivalence` (theorem); `PG.1/asw-equivalence`.

For perfect R over F_p and n≥1, finite locally free Z/p^n-local systems on Spec(R)\_ét are tensor-equivalent to finite projective W_n(R)-modules with invertible φ-linearization. The fixed-vector sheaf is the inverse. On a finite Galois trivializing cover R′/R with descent group G, the module is (W_n(R′)⊗\_{Z/p^n}(Z/p^n)^d)^G with diagonal action determined by the local system.

**Hypotheses.** Locally free means a locally constant finite rank; separate clopen rank strata.

**Inputs.** [PG.1/asw-fixed-basis](#phigammamodulesandiwasawacohomology-pg-1-asw-fixed-basis), [PG.1/frobenius-idempotents](#phigammamodulesandiwasawacohomology-pg-1-frobenius-idempotents).

**Proof route.** 1. Associate the fixed-vector sheaf to the basis torsor and descend the free module by its actual GL_d(Z/p^n) cocycle. 2. Construct inverse evaluations after the faithfully finite étale cover and descend; tensor products and truncation follow on those covers.

**Source locators.** [KL-I](#source-kl-i), Proposition 3.2.7, pp.73–74.; [KL-II](#source-kl-ii), Appendix A, correction to Proposition 3.2.7, p.189.

**Check.** The diagonal tensor factor is essential; W_n(R′)^G alone loses the representation.

<a id="phigammamodulesandiwasawacohomology-pg-1-asw-projectivity"></a>

### 1.9. Frobenius-stable ideals and projectivity

**Target:** `frobeniusProjectivity` (theorem); `PG.1/asw-projectivity`.

A finitely generated ideal J satisfying φ(J)=J of a perfect F_p-algebra is generated by an idempotent. A finitely presented W_n(R)-module that is flat over Z/p^n and has invertible Frobenius linearization is finite projective over W_n(R).

**Hypotheses.** R perfect; n≥1; the module is finitely presented and Z/p^n-flat, not merely finitely generated. The ideal condition is equality under the Frobenius automorphism, not merely φ(J)⊂J. In the perfect closure of F_p[T], (T) satisfies only the latter and is not idempotent-generated.

**Inputs.** [PG.0/phi-module](#phigammamodulesandiwasawacohomology-pg-0-phi-module), [PG.1/frobenius-idempotents](#phigammamodulesandiwasawacohomology-pg-1-frobenius-idempotents).

**Proof route.** 1. For generators x_i write x=Aφ(x), and put B=diag(x_i^{p−1}). At every residue field det(1−AB) is either 0 or 1, according to whether the generators have a nonzero image. Reducedness makes it an idempotent; separate its two clopen pieces to identify J. 2. Apply the ideal result to the relevant Fitting ideals, separate rank components, and lift the resulting locally free module through Witt truncations using coefficient flatness.

**Source locators.** [KL-I](#source-kl-i), Lemma 3.2.12 and Proposition 3.2.13, pp.75–76.

**Check.** Do not drop either finite presentation or coefficient flatness; W_2(R)/p has invertible Frobenius but is not Z/p²-flat.

<a id="phigammamodulesandiwasawacohomology-pg-1-unipotent-lang"></a>

### 1.10. Small unipotent Lang descent

**Target:** `unipotentLangClassification` (theorem); `PG.1/unipotent-lang`.

Let g⊂M_d(Q_p) be an algebraic Lie subalgebra, g_n=g∩p^nM_d(Z_p), and G_{n,m} its Greenberg unipotent group over F_p obtained from the BCH group g_n⊗Z/p^m. For perfect R, conjugacy classes for the action a:b↦a^{-1}bφ(a) on G_{n,m}(R) classify H¹\_ét(Spec R,G_{n,m}(F_p)).

**Hypotheses.** d,m≥1; n≥2, or n=1 if p>2. The BCH/exp correspondence on this small lattice must be supplied; it is not the full group GL_d.

**Inputs.** [PG.1/asw-equivalence](#phigammamodulesandiwasawacohomology-pg-1-asw-equivalence).

**Proof route.** 1. Construct the small BCH group and its Greenberg realization with the displayed p=2 bound. 2. Use the Lang map φ−1 as a finite étale torsor on a central series of the unipotent group. 3. Descend torsors and identify changes of trivialization with φ-conjugacy. The Lie-group construction is a recorded input gap.

**Source locators.** [KL-I](#source-kl-i), Proposition 3.2.9, pp.74–75.

**Check.** Exclude n=1 at p=2; do not generalize this theorem to arbitrary nonunipotent algebraic groups.

<a id="phigammamodulesandiwasawacohomology-pg-1-perfectoid-integral-local-systems"></a>

### 1.11. Integral local systems over perfectoid bases

**Target:** `perfectoidIntegralPhiEquivalence` (comparison); `PG.1/perfectoid-integral-local-systems`.

The integral local-system equivalence is imported from PadicHodgeTheory:P8/relative-local-systems-and-frobenius-modules: for X preadic over Q_{p^d}, finite locally free étale Z_{p^d}-local systems are equivalent to φ^d-modules over Ã\_X and over Ã\_X^†, compatibly with rank, tensor products, duals and pullback, with inverse given by φ^d-fixed sections. The ring statement for a perfect uniform Banach algebra and its untilts (Kedlaya–Liu Theorems 8.5.3 and 8.5.5) is the affinoid perfectoid case used inside the owner proof. PG uses it only for X=Spa(K,O_K), through the cyclotomic perfectoid cover, in PG.2 and PG.3.

**Hypotheses.** d>0; X preadic over Q_{p^d} with the Kedlaya–Liu pro-étale site; the period sheaves are those of PadicHodgeTheory:P8/relative-witt-and-robba-period-sheaves.

**Inputs.** `PadicHodgeTheory:P8/relative-local-systems-and-frobenius-modules`, `PadicHodgeTheory:P8/relative-witt-and-robba-period-sheaves`.

**Proof route.** 1. Cite the owner equivalence and specialize to X=Spa(K,O_K).

**Source locators.** [KL-I](#source-kl-i), Lemma 8.5.2 and Theorem 8.5.3, p.169; Theorem 8.5.5, p.171.

**Check.** The ring-level and sheaf-level statements are the owner's; PG does not restate Kedlaya–Liu's perfectoid descent.

<a id="phigammamodulesandiwasawacohomology-pg-1-pure-local-systems"></a>

### 1.12. Isogeny and pure local systems

**Target:** `PureLocalSystem` (definition); `PG.1/pure-local-systems`.

An isogeny Z_{p^d}-local system is a Z_{p^d}-local system tensored with Q_p, remembering the existence of a global lattice. A (c,d)-local system is such an object V with a Frobenius-semilinear automorphism τ over Q_{p^d} satisfying p^c τ^d=id. Its slope is c/d. This definition does not assert that every Q_p-local system admits a global lattice.

**Hypotheses.** d>0, c∈Z; σ on Q_{p^d} is the arithmetic Witt Frobenius; τ is σ-semilinear.

**Inputs.** [PG.1/perfectoid-integral-local-systems](#phigammamodulesandiwasawacohomology-pg-1-perfectoid-integral-local-systems).

**Proof route.** 1. Use the existing local-system category, rationalization and semilinear-map carriers. 2. Package the τ relation and identify equal-ratio presentations by coefficient extension and Hilbert 90.

**Source locators.** [KL-I](#source-kl-i), Definition 8.5.7, pp.171–172.

**Uses.** PG.1 pure equivalence: Keep the scalar Frobenius, lattice and slope conventions explicit. Kedlaya–Liu Chapter 8: Distinguish global étaleness from local pure slope.

**API.**

- `PureLocalSystem.iterate` (relation): τ^d=p^{-c}id.
- `PureLocalSystem.scalarExtension` (functoriality): Coefficient extension to a common unramified degree compares equal slopes.
- `PureLocalSystem.zeroSlope` (characterisation): At c=0, the descent is the isogeny étale local-system category.

**Acceptance examples.**

- `pure_local_system_zero_slope`: A trivial Q_p-local system with τ=id has (c,d)=(0,1).
- `pure_local_system_sign`: On Q_p with τ=p^{-1}, the relation is (c,d)=(1,1), and (−1,1) fails.
- `pure_local_system_equal_ratio`: The same τ=p^{-1} satisfies the (2,2) relation after unramified quadratic coefficient extension.

**Check.** The relation is p^c τ^d=id, not p^{-c}τ^d=id; retain the sign in the slope comparison.

<a id="phigammamodulesandiwasawacohomology-pg-1-pure-equivalence"></a>

### 1.13. Global étale and pure comparison

**Target:** `globallyPurePhiEquivalence` (theorem); `PG.1/pure-equivalence`.

The étale case is imported: PadicHodgeTheory:P8/relative-local-systems-and-frobenius-modules identifies rational Q_{p^d}-local systems with étale φ^d-modules over B̃\_X, B̃\_X^† and C̃\_X. This node keeps the ring-level (c,d) statement of Kedlaya–Liu used for the slope bookkeeping in PG.1: on a perfect uniform base R, isogeny (c,d)-local systems correspond to globally (c,d)-pure φ^d-modules over W(R)[1/p], the bounded extended Robba ring and the extended Robba ring, with the untilt versions; the completed-perfection comparison needs a complete R₀.

**Hypotheses.** The definitions of PG.1/pure-local-systems; globally pure means a single integral lattice for the twisted iterate, not merely pointwise slope. VectorBundlesAndIsocrystals:VB4/pure-modules-local-systems states the sheaf version; ownership between the two higher roadmaps is recorded for the maintainer.

**Inputs.** `PadicHodgeTheory:P8/relative-local-systems-and-frobenius-modules`, [PG.1/perfectoid-integral-local-systems](#phigammamodulesandiwasawacohomology-pg-1-perfectoid-integral-local-systems), [PG.1/pure-local-systems](#phigammamodulesandiwasawacohomology-pg-1-pure-local-systems), `PadicHodgeTheory:P7:annulus-foundations`.

**Proof route.** 1. For c=0 cite the owner equivalence on X=Spa(R,R^+). 2. Reduce the twisted-iterate condition to the étale case by the unramified cyclic descent encoded by τ. 3. Prove bounded-to-Robba descent for the globally pure lattice; keep it separate from local pure-slope criteria.

**Source locators.** [KL-I](#source-kl-i), Theorems 8.5.6 and 8.5.8, pp.171–172.

**Check.** Restore completeness in the R₀ clause of Theorem 8.5.8, as required by the accepted routed correction; no novelty claim.

<a id="phigammamodulesandiwasawacohomology-pg-1-etale-phi-cohomology"></a>

### 1.14. Étale cohomology from Frobenius

**Target:** `etalePhiCohomologyComparison` (comparison); `PG.1/etale-phi-cohomology`.

The comparison of cohomology with Frobenius cohomology is imported from PadicHodgeTheory:P8/relative-frobenius-cohomology-comparison: for a local system T or V and its integral or étale rational φ^d-module realization, pro-étale cohomology is the hypercohomology of [M→M] with differential φ^d−1. The Spec R statement of Kedlaya–Liu Theorem 8.6.2 is the affinoid case inside the owner proof. PG uses the comparison for X=Spa(K,O_K) in PG.3/period-sheaf-cohomology.

**Hypotheses.** d>0; the module is the realization of a local system, not an arbitrary positive sheaf.

**Inputs.** `PadicHodgeTheory:P8/relative-frobenius-cohomology-comparison`, [PG.0/phi-cohomology](#phigammamodulesandiwasawacohomology-pg-0-phi-cohomology), [PG.1/perfectoid-integral-local-systems](#phigammamodulesandiwasawacohomology-pg-1-perfectoid-integral-local-systems).

**Proof route.** 1. Cite the owner comparison and specialize to X=Spa(K,O_K); the Ext reading of degrees 0 and 1 is PG.0/phi-cohomology.

**Source locators.** [KL-I](#source-kl-i), Theorem 8.6.2, pp.175–176; Lemma 8.6.3 and Theorem 8.6.4, pp.176–177.

**Check.** Do not infer acyclicity of a p-adic sheaf from acyclicity of each truncation without controlling the inverse limit.

**Stage acceptance.** Imported Fontaine equivalence and relative local systems, with the torsion and change-of-field clauses, Witt-vector descent and (c,d)-pure comparison added here. All comparisons must be the stated natural maps, with the sign, scalar, topology and coefficient hypotheses above.

**Remaining refinement.** Fontaine's equivalence is owned by PadicHodgeTheory:P7/etale-realization-and-overconvergence and the relative local systems by PadicHodgeTheory P8. Remaining here: the torsion and change-of-field clauses, the BCH/Greenberg construction for the small-unipotent variant, and the (c,d)-pure descent.


## PG.2. Overconvergence and Robba realization

Cherbonnier–Colmez overconvergence and D_rig(V) are owned by PadicHodgeTheory:P7/etale-realization-and-overconvergence. PG adds the integral overconvergent lattices, radius descent for arbitrary Frobenius modules, the extended-ring clauses, decompletion for all Robba (φ,Γ)-modules (a distinct theorem using Γ, including non-étale modules) and the Γ-equivariant period-sheaf and bundle comparisons. The classical B-pair equivalence is imported.

**Planets:** Robba decompletion.

<a id="phigammamodulesandiwasawacohomology-pg-2-cherbonnier-colmez"></a>

### 2.1. Cherbonnier–Colmez overconvergence

**Target:** `cherbonnierColmez` (theorem); `PG.2/cherbonnier-colmez`.

Overconvergence of representations is imported: PadicHodgeTheory:P7/etale-realization-and-overconvergence states that for every finite-dimensional continuous Q_p-representation V of G_K, D^{†,r}(V)=(B^{†,r}⊗V)^{H_K} has rank dim V for r large, D(V)=B_K⊗D^†(V), and D_rig(V)=R_K⊗D^†(V), with finite coefficients. PG adds only the integral clause it uses: for a stable lattice T, D^†(T)=(A^†⊗T)^{H_K} is an étale (φ,Γ\_K)-module over A_K^† with A_K⊗D^†(T)=D(T).

**Hypotheses.** The G_K-action is essential: an arbitrary continuous H_K-representation need not be overconvergent. The integral clause uses the integral étale categories of PG.0/etale-phi-module.

**Inputs.** `PadicHodgeTheory:P7/etale-realization-and-overconvergence`, [PG.1/fontaine-equivalence](#phigammamodulesandiwasawacohomology-pg-1-fontaine-equivalence), [PG.0/coefficient-actions](#phigammamodulesandiwasawacohomology-pg-0-coefficient-actions), [PG.0/etale-phi-module](#phigammamodulesandiwasawacohomology-pg-0-etale-phi-module).

**Proof route.** 1. Cite the owner theorem for the rational statement and its radius models. 2. For the integral clause intersect D^†(V) with D(T) inside D(V), and show it is an A_K^†-lattice spanning D(T) by the descent of Cherbonnier–Colmez §III; the trace estimates of §III.2 remain the recorded gap.

**Source locators.** [CC-1998](#source-cc-1998), Theorem III.1.1, p.16; §III.2–III.4, pp.16–23; Proposition III.5.1 and Corollary III.5.2, p.23.; [KL-I](#source-kl-i), Theorem 9.5.4(a),(d), p.201.

**Check.** Finite-rank representations only; this is neither the relative affinoid theorem nor a theorem for all Robba modules.

<a id="phigammamodulesandiwasawacohomology-pg-2-radius-models"></a>

### 2.2. Radius descent and realization comparisons

**Target:** `robbaRadiusModels` (theorem); `PG.2/radius-models`.

For representations the radius models are the owner's (PadicHodgeTheory:P7/etale-realization-and-overconvergence and PadicHodgeTheory:P7/plan/robba-realisation-comparison). PG adds the statement for arbitrary finite projective Frobenius modules, needed in PG.3 and PG.7: a finite projective φ-module over R_K descends to some R_K^{r₀} with φ^\*M^{r₀}≅M^{r₀/p}; module maps descend to any common admissible radius once source and target models are fixed; further shrinking gives canonical compatible restrictions, and scalar extensions from integral and bounded models agree with these Robba models.

**Hypotheses.** Use the KPX decreasing-radius convention. General affinoid models are finite projective, not assumed free.

**Inputs.** `PadicHodgeTheory:P7/etale-realization-and-overconvergence`, `PadicHodgeTheory:P7/plan/robba-realisation-comparison`, [PG.2/cherbonnier-colmez](#phigammamodulesandiwasawacohomology-pg-2-cherbonnier-colmez), [PG.0/phi-module](#phigammamodulesandiwasawacohomology-pg-0-phi-module), `PadicHodgeTheory:P7:annulus-foundations`.

**Proof route.** 1. Choose a finite presentation and a radius containing its matrix entries and the inverse linearization. 2. Use Frobenius iteration to extend a commuting morphism over successive annuli; prove compatibility on overlaps. 3. Compare all realization maps on the universal period extension, then descend their inverses.

**Source locators.** [KPX-v3](#source-kpx-v3), Definitions 2.2.6 and 2.2.8, Proposition 2.2.7 and Lemma 2.2.9, pp.17–19.; [KL-I](#source-kl-i), Theorem 9.5.6, pp.201–202.

**Check.** Do not claim a uniform radius for an arbitrary set of representations; the radius depends on the object and chosen model.

<a id="phigammamodulesandiwasawacohomology-pg-2-etale-tilde-equivalence"></a>

### 2.3. Étale realization over classical and extended rings

**Target:** `etaleRobbaTildeEquivalence` (theorem); `PG.2/etale-tilde-equivalence`.

The classical clauses are imported: Q_p-representations of G_K are equivalent to étale (φ,Γ\_K)-modules over B_K, B_K^† and R_K (PadicHodgeTheory:P7/etale-realization-and-overconvergence with PadicHodgeTheory:P7/plan/robba-realisation-comparison). PG adds the extended-ring clauses of Kedlaya–Liu: the same representations are equivalent to étale (φ,Γ\_K)-modules over B̃\_K, B̃\_K^† and R̃\_K, with inverse the φ=1 vectors after extension to the universal extended Robba ring, and stable Z_p-lattices correspond to étale modules over Ã\_K and Ã\_K^†. All maps are the canonical scalar extensions.

**Hypotheses.** K finite over Q_p; étaleness is the lattice condition of PG.0. Retain the Γ\_K connected-component convention, or explicitly induce to the all-component Γ convention of KL §9.5.

**Inputs.** `PadicHodgeTheory:P7/etale-realization-and-overconvergence`, `PadicHodgeTheory:P7/plan/robba-realisation-comparison`, `PadicHodgeTheory:P8/relative-local-systems-and-frobenius-modules`, [PG.2/radius-models](#phigammamodulesandiwasawacohomology-pg-2-radius-models), [PG.1/fontaine-V](#phigammamodulesandiwasawacohomology-pg-1-fontaine-v), [PG.1/pure-equivalence](#phigammamodulesandiwasawacohomology-pg-1-pure-equivalence).

**Proof route.** 1. For the classical rings cite the owners. 2. For the extended rings apply the owner local-system equivalence on Spa(K,O_K) and descend along the cyclotomic perfectoid cover, as in Kedlaya–Liu's proofs of Theorems 9.5.4 and 9.5.6; use the integral extended lattices of PG.0/etale-phi-module. 3. Check ranks, both comparison triangles, tensor/dual and finite-field-change compatibility on the common universal ring.

**Source locators.** [KL-I](#source-kl-i), Theorems 9.5.4 and 9.5.6, pp.201–202.; [FF-2018](#source-ff-2018), Colmez preface, Theorem 2.41(i)–(iii), p.27.

**Check.** The extended-ring clauses are the target here; the classical Robba equivalence is the owner's.

<a id="phigammamodulesandiwasawacohomology-pg-2-all-module-decompletion"></a>

### 2.4. Decompletion for all Robba modules

**Target:** `allRobbaDecompletion` (theorem); `PG.2/all-module-decompletion`.

Scalar extension R_K→tilde R_K is a tensor equivalence on all continuous (φ,Γ\_K)-modules, including non-étale ones. Its quasi-inverse is Tate–Sen decompletion using Γ\_K. This is larger than the étale Galois-representation equivalence and does not imply that every Robba module comes from a finite-dimensional G_K-representation.

**Hypotheses.** K finite over Q_p; finite projective modules with invertible Frobenius linearization; continuity and the cyclotomic Γ action are required.

**Inputs.** [PG.2/radius-models](#phigammamodulesandiwasawacohomology-pg-2-radius-models), [PG.0/phi-module](#phigammamodulesandiwasawacohomology-pg-0-phi-module).

**Proof route.** 1. Apply normalized Tate traces and the Γ-complement inverse to descend morphisms and module matrices. 2. Prove effective descent after an admissible radius and check the resulting comparison maps. 3. Use the equivalence to distinguish the slope-zero étale subcategory from the full category.

**Source locators.** [FF-2018](#source-ff-2018), §11.5, Theorem 11.5.1 and preceding decompletion argument, pp.383–384.; [KL-I](#source-kl-i), Theorem 9.5.8(a)–(b), p.202.

**Check.** Without Γ the scalar-extension assertion is not an equivalence in this generality; record the precise decompletion estimates as a gap.

<a id="phigammamodulesandiwasawacohomology-pg-2-period-sheaf-equivalences"></a>

### 2.5. Period sheaves, B-pairs and equivariant bundles

**Target:** `phiGammaPeriodSheafEquivalences` (theorem); `PG.2/period-sheaf-equivalences`.

Import the classical B-pair–Robba equivalence (PadicHodgeTheory:P7/b-pair-robba-equivalence) and the relative equivalence of φ-modules over C̃\_X with vector bundles and B-pairs (PadicHodgeTheory:P8/relative-all-module-bundle-b-pair-equivalence). PG adds their Γ-equivariant form over K: the categories of (φ,Γ\_K)-modules over R_K and over R̃\_K are equivalent to continuous Γ-equivariant vector bundles on the Fargues–Fontaine curve of the completed cyclotomic field, to continuous G_K-equivariant vector bundles on the curve of C_p, and to φ-modules over C̃ on Spa(K,O_K) and B-pairs over Spa(K,O_K); these comparison functors agree with the imported classical B-pair bridge on their common domain.

**Hypotheses.** K finite over Q_p; B-pair definitions are imported from P7 and generic curve/GAGA carriers from AdicSpaces Layer 6. Use KL’s all-component convention or its explicit Γ-induction comparison.

**Inputs.** [PG.2/all-module-decompletion](#phigammamodulesandiwasawacohomology-pg-2-all-module-decompletion), [PG.2/etale-tilde-equivalence](#phigammamodulesandiwasawacohomology-pg-2-etale-tilde-equivalence), `PadicHodgeTheory:P8`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`, `PadicHodgeTheory:P7/coefficient-b-pairs`, `PadicHodgeTheory:P7/b-pair-robba-equivalence`, `PadicHodgeTheory:P8/relative-all-module-bundle-b-pair-equivalence`, `PadicHodgeTheory:P8/relative-witt-and-robba-period-sheaves`.

**Proof route.** 1. Descend the owner relative equivalence (for X=Spa(K,O_K)) along the cyclotomic perfectoid cover, keeping the Γ- and G_K-actions. 2. Apply the imported B-pair bridge and identify its two period components with the pro-étale period construction; do not construct a competing classical bridge. 3. Use the curve and GAGA supplier for the bundle comparisons; verify naturality of each comparison and its inverse.

**Source locators.** [KL-I](#source-kl-i), Theorem 9.5.4(f)–(g), Theorem 9.5.6(h)–(j), and Theorem 9.5.8, pp.201–202.; [FF-2018](#source-ff-2018), Theorem 11.5.1, pp.383–384.

**Check.** The classical B-pair equivalence is imported. The new targets are extended-ring, period-sheaf and equivariant-bundle compatibility maps, with their natural comparison triangles.

<a id="phigammamodulesandiwasawacohomology-pg-2-realization-operations"></a>

### 2.6. Operations on overconvergent realizations

**Target:** `robbaRealizationOperations` (theorem); `PG.2/realization-operations`.

The canonical D^† and D_rig maps commute with finite coefficient extension, tensor products, duals and restriction to finite L/K. Induction is induction along Γ\_L⊂Γ\_K with the finite étale scalar extension; its degree is [L∞:K∞], not always [L:K]. The equivalences preserve the chosen Tate-twist normalization.

**Hypotheses.** Finite extensions of Q_p for both fields and coefficient fields; finite projective realization modules.

**Inputs.** `PadicHodgeTheory:P7/etale-realization-and-overconvergence`, [PG.2/etale-tilde-equivalence](#phigammamodulesandiwasawacohomology-pg-2-etale-tilde-equivalence), [PG.0/coefficient-actions](#phigammamodulesandiwasawacohomology-pg-0-coefficient-actions).

**Proof route.** 1. Construct each operation through tensor extension and the evaluated universal-ring comparisons. 2. Use faithful descent to prove the comparison isomorphisms and their coherence. 3. Track norm-field ramification and Γ index separately in induction and trace.

**Source locators.** [CC-1998](#source-cc-1998), Theorem II.3.2(i) and Proposition II.4.1, pp.11–12.; [KPX-v3](#source-kpx-v3), Remark 2.2.4 and Lemma 2.2.18, pp.16–17 and 20–21.

**Check.** Do not replace the tower degree by the full local-field degree when cyclotomic levels already lie in L.

**Stage acceptance.** Imported overconvergence and D_rig, with integral overconvergent lattices, extended-ring and all-module decompletion and equivariant period comparisons added here. All comparisons must be the stated natural maps, with the sign, scalar, topology and coefficient hypotheses above.

**Remaining refinement.** Overconvergence and D_rig(V) are owned by PadicHodgeTheory:P7/etale-realization-and-overconvergence. Remaining here: the integral overconvergent lattices (trace estimates of Cherbonnier–Colmez §III.2), all-module Tate–Sen decompletion, and the Γ-equivariant period-sheaf and bundle descent.


## PG.3. Herr cochains and continuous Galois cohomology

Herr cohomology over a finite coefficient field, with generator independence, Galois comparison, Euler characteristic and duality, is owned by PadicHodgeTheory:P7/herr-complex-interface. The algebraic core below is conditional on its explicit operators and inverse. Put P=1−φψ and B=γ−1. If e=B on ker ψ is invertible, q=e⁻¹P satisfies Bq=qB=P, qφ=ψq=0. The corrected section is S¹(a,b)=(−φ(a)−q(b),b), S²=−φ and H²(c)=(q(c),0). These formulas prove the retraction; they do not establish the analytic inverse or Galois comparison by themselves. The arithmetic targets add affinoid and integral coefficients and the residue normalization.

**Planets:** Herr complex, Phi-to-psi comparison, Psi-zero resolvent, Herr comparison homotopy, Phi-psi homotopy equivalence, Herr–Galois comparison.

<a id="phigammamodulesandiwasawacohomology-pg-3-herr-differentials"></a>

### 3.1. Herr differentials square to zero

**Target:** `herrDifferentials_sq` (lemma); `PG.3/herr-differentials`.

For d0(x)=((F-1)x,(G-1)x) and d1(a,b)=(G-1)a-(F-1)b, d1 d0=0 when F,G commute.

**Hypotheses.** C commutative; M a C-module; F,G C-linear and FG=GF.

**Inputs.** .

**Proof route.** 1. Expand; the remaining commutator GF-FG vanishes.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 2.3.3, diagram (2.3.3.1), p.21.

**Check.** The second sign in d1 is negative; the positive-sign variant fails.

<a id="phigammamodulesandiwasawacohomology-pg-3-herr-complex"></a>

### 3.2. Herr complex

**Target:** `herrComplex` (construction); `PG.3/herr-complex`.

Construct the native cochain complex M→M×M→M in degrees 0,1,2, zero elsewhere, with d0=((F-1),(G-1)), d1=((G-1),-(F-1)).

**Hypotheses.** C commutative; M a C-module; F,G C-linear and commuting.

**Inputs.** [PG.3/herr-differentials](#phigammamodulesandiwasawacohomology-pg-3-herr-differentials), `mathlib:CochainComplex.of`, `mathlib:ModuleCat.ofHom`.

**Proof route.** 1. Use native module-category objects and zero modules outside the support. 2. Wrap the linear differentials with ModuleCat.ofHom and use the zero-composition proof.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 2.3.3, diagram (2.3.3.1), p.21.

**Uses.** PG.3 and KPX Definition 2.3.3: Use the native cochain and homology API for phi and psi versions.

**API.**

- `herrComplex_d0` (characterisation): d(0,1)(x)=((F-1)x,(G-1)x).
- `herrComplex_d1` (characterisation): d(1,2)(a,b)=(G-1)a-(F-1)b.
- `herrComplex_above_two` (characterisation): All terms in degrees at least 3 are zero modules.

**Acceptance examples.**

- `herr_trivial_actions`: For F=G=id on Q, both differentials vanish and degree one still has two coordinates.
- `herr_numeric_sign`: For F=2id,G=3id on Q, d0(7)=(7,14) and d1(5,11)=-1.
- `herr_wrong_sign`: For F=2id,G=3id, replacing the minus in d1 by plus gives d1d0(1)=4.

**Check.** The arithmetic application must supply the actual chosen torsion-invariant module; no Galois cohomology is defined by this declaration.

<a id="phigammamodulesandiwasawacohomology-pg-3-herr-functoriality"></a>

### 3.3. Functoriality of Herr cochains

**Target:** `herrMap` (construction); `PG.3/herr-functoriality`.

For h intertwining F,G with F′,G′, construct the cochain map with components h,h×h,h.

**Hypotheses.** C-modules M,M′; commuting C-linear operator pairs; h C-linear with hF=F′h and hG=G′h.

**Inputs.** [PG.3/herr-complex](#phigammamodulesandiwasawacohomology-pg-3-herr-complex), `mathlib:CochainComplex.ofHom`.

**Proof route.** 1. Use the two intertwining equalities in the differential squares. 2. Identity and composition hold degreewise; other terms are zero.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 2.3.3, p.21.

**Uses.** PG.3 comparisons: Transport actual module maps through Herr cochains.

**API.**

- `herrMap_f0` (characterisation): The degree-zero component is h.
- `herrMap_f1` (characterisation): The degree-one component sends (a,b) to (h(a),h(b)).
- `herrMap_f2` (characterisation): The degree-two component is h.

**Acceptance examples.**

- `herr_map_identity`: Identity h induces the identity cochain map.
- `herr_map_zero`: Zero h induces the zero map.
- `herr_map_composition`: Scalars 2 then 3 on the Q-model induce 6 in both degree-one coordinates.

**Check.** The statement is on actual cochains, not just cohomology groups.

<a id="phigammamodulesandiwasawacohomology-pg-3-signed-phi-psi-map"></a>

### 3.4. Signed phi-to-psi comparison

**Target:** `phiPsiComparison` (construction); `PG.3/signed-phi-psi-map`.

Construct F:C_phi,gamma→C_psi,gamma with degree maps id,diag(-psi,id),-psi.

**Hypotheses.** C commutative; phi,psi,gamma C-linear on M; psi phi=id; gamma commutes with phi and psi.

**Inputs.** [PG.3/herr-complex](#phigammamodulesandiwasawacohomology-pg-3-herr-complex), `mathlib:CochainComplex.ofHom`.

**Proof route.** 1. The first square uses -psi(phi-1)=psi-1. 2. The second uses psi gamma=gamma psi and -psi(1-phi)=1-psi.

**Source locators.** [KPX-v3](#source-kpx-v3), Diagram (2.3.3.1), p.21; Proposition 2.3.6, p.22.

**Uses.** KPX Proposition 2.3.6: The actual morphism whose kernel inverse implies a quasi-isomorphism.

**API.**

- `phiPsiComparison_f0` (characterisation): F0=id.
- `phiPsiComparison_f1` (characterisation): F1(a,b)=(-psi(a),b).
- `phiPsiComparison_f2` (characterisation): F2(c)=-psi(c).

**Acceptance examples.**

- `signed_identity_case`: Even for phi=psi=id, F1(a,b)=(-a,b) and F2(c)=-c.
- `signed_frobenius_monomial`: In the p=3 polynomial model, F2(U^3)=-U.
- `signed_kernel_monomial`: In that model F2(U)=0 and F1(U,0)=0.

**Check.** Neither -psi can be replaced by +psi.

<a id="phigammamodulesandiwasawacohomology-pg-3-signed-map-surjectivity"></a>

### 3.5. Degreewise surjectivity

**Target:** `phiPsiComparison_surjective` (lemma); `PG.3/signed-map-surjectivity`.

The signed comparison is surjective in every degree. Degreewise right inverses are id,diag(-phi,id),-phi; that collection is not asserted to be a chain map.

**Hypotheses.** C-linear phi,psi,gamma with psi phi=id and both Gamma commutations.

**Inputs.** [PG.3/signed-phi-psi-map](#phigammamodulesandiwasawacohomology-pg-3-signed-phi-psi-map).

**Proof route.** 1. Use psi phi=id in degrees 1 and 2; degree 0 is identity, and other terms are zero.

**Source locators.** [KPX-v3](#source-kpx-v3), Proposition 2.3.6, proof, p.22.

**Check.** The uncorrected graded section need not commute with differentials.

<a id="phigammamodulesandiwasawacohomology-pg-3-signed-map-kernel"></a>

### 3.6. Kernel of the signed comparison

**Target:** `phiPsiComparison_kernel` (lemma); `PG.3/signed-map-kernel`.

The kernel is zero in degree 0, ker psi embedded as (a,0) in degree 1, and ker psi in degree 2. Its differential under these identifications is gamma-1.

**Hypotheses.** C-linear phi,psi,gamma with psi phi=id and both Gamma commutations.

**Inputs.** [PG.3/signed-phi-psi-map](#phigammamodulesandiwasawacohomology-pg-3-signed-phi-psi-map).

**Proof route.** 1. Read the kernels off the degree maps. 2. On (a,0), the differential is (gamma-1)a, and gamma preserves ker psi.

**Source locators.** [KPX-v3](#source-kpx-v3), Proposition 2.3.6, kernel proof, p.22.

**Check.** For gamma=1 and nonzero ker psi the kernel complex is not acyclic.

<a id="phigammamodulesandiwasawacohomology-pg-3-kernel-resolvent"></a>

### 3.7. Inverse on the psi-zero summand

**Target:** `kernelResolvent` (construction); `PG.3/kernel-resolvent`.

Let e:ker psi≃\_C ker psi have forward map gamma-1. Define q:M→M as inclusion composed with e inverse composed with P_M.

**Hypotheses.** C-linear phi,psi,gamma with psi phi=id and both Gamma commutations. e is an actual C-linear equivalence realizing gamma-1 on ker psi. Its analytic existence is not assumed for every module.

**Inputs.** [PG.4/psi-zero-projection](#phigammamodulesandiwasawacohomology-pg-4-psi-zero-projection).

**Proof route.** 1. Compose the three native linear maps. 2. The analytic construction of e is a separate theorem, not a property assigned to every integral coefficient ring.

**Source locators.** [KPX-v3](#source-kpx-v3), Proposition 2.3.6, p.22; Theorem 3.1.1, p.25, with Lemma 3.1.2 and Corollary 3.1.3, pp.26–28.

**Uses.** Explicit lift of KPX Proposition 2.3.6: Correct the graded section and build the homotopy.

**API.**

- `kernelResolvent_formula` (characterisation): q(x)=inclusion(e inverse(P_M(x))).
- `kernelResolvent_mem` (characterisation): psi(q(x))=0.
- `kernelResolvent_spec` (characterisation): For B=gamma-1, Bq=qB=P, q phi=0 and psi q=0.

**Acceptance examples.**

- `resolvent_zero_kernel`: When phi=psi=id, q=0.
- `resolvent_polynomial`: For the polynomial model with gamma=2id, q=P; q(U)=U and q(U^p)=0.
- `resolvent_hypothesis_essential`: For gamma=id in that model, gamma-1 on ker psi is not injective since U is a nonzero kernel vector.

**Check.** A rational Robba inverse is not an integral-lattice inverse without another theorem.

<a id="phigammamodulesandiwasawacohomology-pg-3-kernel-resolvent-identities"></a>

### 3.8. Resolvent identities

**Target:** `kernelResolvent_spec` (lemma); `PG.3/kernel-resolvent-identities`.

With B=gamma-1, Bq=qB=P, q phi=0 and psi q=0.

**Hypotheses.** C-linear phi,psi,gamma with psi phi=id and both commutations; e realizes B as an equivalence on ker psi.

**Inputs.** [PG.3/kernel-resolvent](#phigammamodulesandiwasawacohomology-pg-3-kernel-resolvent), [PG.4/psi-zero-projection](#phigammamodulesandiwasawacohomology-pg-4-psi-zero-projection).

**Proof route.** 1. Bq=P follows from the inverse property. 2. Use PB=BP and uniqueness of the B-preimage inside ker psi to prove qB=P. 3. P phi=0 gives q phi=0; the image of q lies in ker psi.

**Source locators.** [KPX-v3](#source-kpx-v3), Proposition 2.3.6, p.22; Theorem 3.1.1, p.25.

**Check.** Retain both inverse identities, not merely a right inverse.

<a id="phigammamodulesandiwasawacohomology-pg-3-herr-comparison-section"></a>

### 3.9. Corrected section of the comparison

**Target:** `herrComparisonSection` (construction); `PG.3/herr-comparison-section`.

Construct S:C_psi,gamma→C_phi,gamma with S0=id, S1(a,b)=(-phi(a)-q(b),b), S2(c)=-phi(c).

**Hypotheses.** C-linear phi,psi,gamma with psi phi=id and both commutations; the actual equivalence e realizing gamma-1 on ker psi and q defined from it.

**Inputs.** [PG.3/signed-phi-psi-map](#phigammamodulesandiwasawacohomology-pg-3-signed-phi-psi-map), [PG.3/kernel-resolvent-identities](#phigammamodulesandiwasawacohomology-pg-3-kernel-resolvent-identities), `mathlib:CochainComplex.ofHom`.

**Proof route.** 1. First square: -phi(psi-1)-qB=phi-1 because qB=P=1-phi psi. 2. Second square: use Bq=P and Bphi=phiB to obtain d_phi S1=S2 d_psi.

**Source locators.** [KPX-v3](#source-kpx-v3), Proposition 2.3.6, p.22; Theorem 3.1.1, p.25, for the kernel inverse.

**Uses.** Explicit Herr comparison inverse: Supply a chain map, not an abstract equality of dimensions.

**API.**

- `herrComparisonSection_f0` (characterisation): S0=id.
- `herrComparisonSection_f1` (characterisation): S1(a,b)=(-phi(a)-q(b),b).
- `herrComparisonSection_f2` (characterisation): S2(c)=-phi(c).

**Acceptance examples.**

- `section_zero_kernel`: For phi=psi=id,gamma=2id, S1(a,b)=(-a,b).
- `section_correction`: For p=3 and gamma=2id on Q[U], S1(0,U)=(-U,U), not (0,U).
- `section_degree_two`: In that model S2(U)=-U^3.

**Check.** The q(b) correction is essential.

<a id="phigammamodulesandiwasawacohomology-pg-3-herr-section-right-inverse"></a>

### 3.10. The section is a right inverse

**Target:** `herrComparisonSection_rightInverse` (lemma); `PG.3/herr-section-right-inverse`.

F composed with S is identity on C_psi,gamma as a cochain map.

**Hypotheses.** All signed comparison and actual kernel-inverse hypotheses of herr-comparison-section.

**Inputs.** [PG.3/herr-comparison-section](#phigammamodulesandiwasawacohomology-pg-3-herr-comparison-section), [PG.3/signed-phi-psi-map](#phigammamodulesandiwasawacohomology-pg-3-signed-phi-psi-map), [PG.3/kernel-resolvent-identities](#phigammamodulesandiwasawacohomology-pg-3-kernel-resolvent-identities).

**Proof route.** 1. Degree 1 uses psi phi=id and psi q=0; degree 2 uses psi phi=id; degree 0 is identity.

**Source locators.** [KPX-v3](#source-kpx-v3), Proposition 2.3.6, p.22.

**Check.** Categorically S followed by F is identity.

<a id="phigammamodulesandiwasawacohomology-pg-3-herr-comparison-homotopy"></a>

### 3.11. Explicit comparison homotopy

**Target:** `herrComparisonHomotopy` (construction); `PG.3/herr-comparison-homotopy`.

Construct the native homotopy id_(C_phi) ~ S composed with F. Its only nonzero component is H2(c)=(q(c),0):C_phi^2→C_phi^1.

**Hypotheses.** C-linear phi,psi,gamma with psi phi=id and both commutations, and the actual kernel inverse e defining q.

**Inputs.** [PG.3/herr-comparison-section](#phigammamodulesandiwasawacohomology-pg-3-herr-comparison-section), [PG.3/signed-phi-psi-map](#phigammamodulesandiwasawacohomology-pg-3-signed-phi-psi-map), [PG.3/kernel-resolvent-identities](#phigammamodulesandiwasawacohomology-pg-3-kernel-resolvent-identities), `mathlib:Homotopy`.

**Proof route.** 1. In degree 1, id-SF maps (a,b) to (P(a)+q(b),0). H2 d1 gives this because qB=P and q phi=0. 2. In degree 2, id-SF=P=d1 H2 because Bq=P. Degree 0 and all other degrees vanish. 3. Package id=dH+Hd+SF in the native convention.

**Source locators.** [KPX-v3](#source-kpx-v3), Proposition 2.3.6, p.22; Theorem 3.1.1, p.25, for the analytic hypothesis.

**Uses.** Homotopy equivalence and coefficient changes: Provide actual components, stronger than a bare quasi-isomorphism assertion.

**API.**

- `herrComparisonHomotopy_h1` (characterisation): The degree-1-to-0 component is zero.
- `herrComparisonHomotopy_h2` (characterisation): H2(c)=(q(c),0).
- `herrComparisonHomotopy_identity` (characterisation): The components satisfy id-SF=dH+Hd in every degree.

**Acceptance examples.**

- `homotopy_zero_kernel`: For phi=psi=id, the homotopy is zero.
- `homotopy_kernel_monomial`: For p=3,gamma=2id on Q[U], H2(U)=(U,0).
- `homotopy_image_monomial`: In that model H2(U^3)=0; H2(c)=(c,0) would fail.

**Check.** H1 is zero; the nonzero component lowers degree 2 to 1.

<a id="phigammamodulesandiwasawacohomology-pg-3-herr-comparison-equivalence"></a>

### 3.12. Phi-psi homotopy equivalence

**Target:** `herrComparisonEquiv` (construction); `PG.3/herr-comparison-equivalence`.

Package F,S, FS=id and SF~id as a native homotopy equivalence. The induced canonical homology map is the one induced by F.

**Hypotheses.** C-linear phi,psi,gamma with psi phi=id and both commutations; an actual inverse for gamma-1 on ker psi.

**Inputs.** [PG.3/herr-section-right-inverse](#phigammamodulesandiwasawacohomology-pg-3-herr-section-right-inverse), [PG.3/herr-comparison-homotopy](#phigammamodulesandiwasawacohomology-pg-3-herr-comparison-homotopy), `mathlib:HomotopyEquiv.toHomologyIso`.

**Proof route.** 1. Take the symmetric homotopy for SF~id and the equality homotopy for FS=id. 2. Use the existing toHomologyIso, not a new cohomology carrier.

**Source locators.** [KPX-v3](#source-kpx-v3), Proposition 2.3.6, p.22.

**Uses.** PG.3 comparisons: Compose these actual maps with the genuine arithmetic comparison when constructed.

**API.**

- `herrComparisonEquiv_hom` (characterisation): The forward map is phiPsiComparison.
- `herrComparisonEquiv_inv` (characterisation): The inverse map is herrComparisonSection.
- `herrComparisonEquiv_homology` (compatibility): The induced canonical homology isomorphism has forward map homologyMap(F).

**Acceptance examples.**

- `equivalence_forward_sign`: On Q with phi=psi=id, the forward degree-two map sends 1 to -1.
- `equivalence_inverse_correction`: For p=3,gamma=2id on Q[U], the inverse degree-one map sends (0,U) to (-U,U).
- `equivalence_section_identity`: In that model the forward map after the inverse sends (0,U) back to (0,U).

**Check.** This conditional algebra does not prove the analytic inverse or comparison to continuous Galois cochains.

<a id="phigammamodulesandiwasawacohomology-pg-3-herr-generator-map"></a>

### 3.13. Generator-power comparison

**Target:** `herrGeneratorMap` (construction); `PG.3/herr-generator-map`.

For n≥0, Q_n=Σ\_(i<n)G^i gives a chain map C_(F,G)→C_(F,G^n) with components id,diag(id,Q_n),Q_n, even when G^n is not a generator.

**Hypotheses.** C commutative; F,G commuting C-linear operators on M.

**Inputs.** [PG.3/herr-complex](#phigammamodulesandiwasawacohomology-pg-3-herr-complex), `mathlib:CochainComplex.ofHom`.

**Proof route.** 1. Finite induction gives G^n-1=Q_n(G-1)=(G-1)Q_n. 2. Q_n commutes with F; check the differential squares.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 2.3.3, generator-change formula after (2.3.3.1), p.21.

**Uses.** PG.3 generator independence: Supply finite-power algebra before proving completed generator-change units.

**API.**

- `herrGeneratorMap_f0` (characterisation): The degree-zero map is identity.
- `herrGeneratorMap_f1` (characterisation): The degree-one map sends (a,b) to (a,Q_n b).
- `herrGeneratorMap_f2` (characterisation): The degree-two map is Q_n.

**Acceptance examples.**

- `generator_one`: For n=1, the degree maps are identity.
- `generator_geometric_sum`: For G=2id on Q,n=3, Q_n=7id.
- `generator_divisible_index`: For G=id on F_3,n=3, Q_n=0 and the degree-two map is not invertible.

**Check.** Do not infer a generator change or isomorphism for arbitrary n.

<a id="phigammamodulesandiwasawacohomology-pg-3-herr-generator-isomorphism"></a>

### 3.14. Admitted generator change is invertible

**Target:** `herrGeneratorMap_isIso` (theorem); `PG.3/herr-generator-isomorphism`.

If Q_n is invertible as a C-linear endomorphism, herrGeneratorMap is a cochain isomorphism with inverse components id,diag(id,Q_n inverse),Q_n inverse.

**Hypotheses.** Commuting C-linear F,G; Q_n invertible.

**Inputs.** [PG.3/herr-generator-map](#phigammamodulesandiwasawacohomology-pg-3-herr-generator-map).

**Proof route.** 1. The degree maps are invertible. Multiply the original differential squares by their inverses.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 2.3.3, generator comparison, p.21.

**Check.** A p-adic generator quotient requires its own completed-action unit proof.

<a id="phigammamodulesandiwasawacohomology-pg-3-arithmetic-herr"></a>

### 3.15. Arithmetic Herr cochains and torsion conventions

**Target:** `arithmeticHerrComplex` (construction); `PG.3/arithmetic-herr`.

For a continuous (φ,Γ\_K)-module D and a generator γ of Γ\_K/Δ\_K, take the retained Herr complex on D^{Δ\_K}. In the KPX rational convention Δ\_K is the p-primary torsion subgroup. For odd p compare this to the presentation using invariants under all finite torsion and a generator of the resulting Z_p quotient. The two models carry canonical derived comparison maps. Rational averaging is available for every finite torsion order; integral averaging requires that order be invertible. For a finite coefficient field the complex, its generator independence and its finite-extension compatibility are those of PadicHodgeTheory:P7/herr-complex-interface; this node adds the comparison of the KPX p-primary convention with the full-torsion presentation and the integral branch.

**Hypotheses.** K finite over Q_p; D a finite projective Robba module or an integral étale module in the separate integral branch. Use continuous completed group-algebra actions; γ is a topological generator, not an arbitrary nonidentity element.

**Inputs.** `PadicHodgeTheory:P7/herr-complex-interface`, [PG.3/herr-complex](#phigammamodulesandiwasawacohomology-pg-3-herr-complex), [PG.3/herr-generator-isomorphism](#phigammamodulesandiwasawacohomology-pg-3-herr-generator-isomorphism), [PG.0/etale-phi-module](#phigammamodulesandiwasawacohomology-pg-0-etale-phi-module), `PadicMeasuresIwasawaAlgebras:L1`.

**Proof route.** 1. Instantiate the fixed-coefficient linear maps with actual commuting period actions. 2. Resolve the procyclic quotient by γ−1 and use exact prime-to-p averaging for the finite quotient. 3. For a change γ→γ^u, prove the completed quotient (γ^u−1)/(γ−1) is a unit when u is a p-adic unit, then apply the retained generator comparison.

**Source locators.** [KPX-v3](#source-kpx-v3), Notation 2.3.1 and Definition 2.3.3, p.21.; [Berger-intro](#source-berger-intro), §III.2.4, p.24, full prime-to-p torsion convention.

**Uses.** PG.3 Galois comparison: Select the actual arithmetic model before comparing to continuous cochains. BHS §3.3: Relate its full-torsion presentation and opposite degree-two sign to the chosen complex.

**API.**

- `arithmeticHerrComplex.terms` (characterisation): The terms are D^Δ, (D^Δ)^2, D^Δ in degrees 0,1,2 with the fixed signs.
- `arithmeticHerrComplex.torsionComparison` (compatibility): The KPX and full odd-prime torsion presentations agree through the finite-quotient derived comparison.
- `arithmeticHerrComplex.generatorComparison` (functoriality): Changing a genuine topological generator gives a cochain isomorphism satisfying the composition cocycle.

**Acceptance examples.**

- `herr_torsion_character`: For odd p and a nontrivial character of the finite torsion subgroup, the full-torsion invariant unit line is zero; the alternative presentation must have acyclic finite-character component.
- `herr_generator_unit`: For γ′=γ^u with u∈Z_p^×, the quotient has augmentation u, hence is a unit in the relevant completed local group algebra.
- `herr_dyadic_no_average`: On Z/2 with trivial C_2 action, derived invariants have nonzero positive cohomology; averaging by 1/2 is unavailable.

**Check.** A choice of p-primary torsion is not silently replaced by all finite torsion. Do not apply order-two averaging over Z_2.

<a id="phigammamodulesandiwasawacohomology-pg-3-analytic-kernel-inverse"></a>

### 3.16. Analytic inverse on ψ-zero modules

**Target:** `gammaSubOne_psiZero_isIso` (theorem); `PG.3/analytic-kernel-inverse`.

For a finite projective (φ,Γ\_K)-module M over the relative Robba ring with Q_p-affinoid coefficients A, and a topological generator γ of Γ\_K/Δ\_K, γ−1 is invertible on M^{ψ=0}. At every sufficiently small admissible radius, the ψ-zero module carries the compatible analytic group-ring structure and is finite projective of rank [K:Q_p]rank(M). The retained signed φ-to-ψ comparison therefore is a quasi-isomorphism in this rational setting.

**Hypotheses.** Use the analytic group ring at the radius appearing in KPX Theorem 3.1.1; the full Robba assertion is obtained by compatible gluing. This theorem asserts no integral-lattice preservation of the inverse.

**Inputs.** [PG.2/radius-models](#phigammamodulesandiwasawacohomology-pg-2-radius-models), [PG.0/free-cover](#phigammamodulesandiwasawacohomology-pg-0-free-cover), [PG.4/period-psi](#phigammamodulesandiwasawacohomology-pg-4-period-psi), [PG.3/herr-comparison-equivalence](#phigammamodulesandiwasawacohomology-pg-3-herr-comparison-equivalence), `LocallyAnalyticDistributions:L3`, `PadicHodgeTheory:P7:annulus-foundations`.

**Proof route.** 1. Reduce by induction to Q_p. On a sufficiently small annulus decompose ψ-zero vectors into unit-index Frobenius cosets. 2. Choose a small Γ power for which ||γ\_n−1|| is bounded below the annular parameter norm. Invert G=(1+π)γ\_n−1 by factoring out π and summing the resulting convergent Neumann series. 3. Choose a projective complement making the underlying module free; extend the auxiliary operator by π on the complement, without asserting an equivariant splitting. 4. Use the near-identity substitution and uniform finite generation to obtain finite projectivity over the analytic group ring, pass between Γ powers and glue the radius-compatible inverses. 5. Restrict to the torsion-invariant summand and apply the algebraic signed comparison.

**Source locators.** [KPX-v3](#source-kpx-v3), Theorem 3.1.1, p.25, with Lemma 3.1.2 and Corollary 3.1.3 in its proof, pp.25–28; Proposition 2.3.6, p.22.

**Check.** The proof must converge in the annular seminorms actually used; a formal geometric series is insufficient.

<a id="phigammamodulesandiwasawacohomology-pg-3-galois-herr-comparison"></a>

### 3.17. Herr–Galois comparison

**Target:** `galoisHerrComparison` (theorem); `PG.3/galois-herr-comparison`.

For a finite projective continuous A-representation V of G_K, there is a functorial quasi-isomorphism RΓ\_cont(G_K,V)≅C_{φ,γ}(D_rig(V)) in the derived category of A-modules. It agrees with the Fontaine bounded realization, with cup products and with the Yoneda description in degrees 0 and 1. Integral étale and finite-torsion variants require their own exact-sequence and descent comparison, with the dyadic case routed through derived finite-group descent. For a finite coefficient field the identification of Herr cohomology of D_rig(V) with continuous cohomology is PadicHodgeTheory:P7/herr-complex-interface; this node adds the functorial quasi-isomorphism for Q_p-affinoid A, its cup and Yoneda compatibilities, and the integral variants.

**Hypotheses.** A a Q_p-affinoid algebra for the relative rational statement; continuous cochains supplied by D7. Do not claim that a rational affinoid theorem supplies integral cochains by reduction.

**Inputs.** `PadicHodgeTheory:P7/herr-complex-interface`, [PG.1/fontaine-equivalence](#phigammamodulesandiwasawacohomology-pg-1-fontaine-equivalence), [PG.2/etale-tilde-equivalence](#phigammamodulesandiwasawacohomology-pg-2-etale-tilde-equivalence), [PG.3/arithmetic-herr](#phigammamodulesandiwasawacohomology-pg-3-arithmetic-herr), [PG.3/analytic-kernel-inverse](#phigammamodulesandiwasawacohomology-pg-3-analytic-kernel-inverse), [PG.7/relative-representation-realization](#phigammamodulesandiwasawacohomology-pg-7-relative-representation-realization), `ArithmeticGaloisDuality:D7`, `ArithmeticGaloisDuality:R02.1/carrier-comparison`, `ArithmeticGaloisDuality:D7/continuous-derived-cochains`.

**Proof route.** 1. Use the universal overconvergent period exact sequence with φ−1 and identify the kernel with the coefficient representation. 2. Prove H_K-acyclicity of the enlarged period tensor and apply continuous Hochschild–Serre descent. 3. Compare the resulting mapping fibre to the bounded Herr model, then use radius descent and the φ/ψ comparison for the Robba model. 4. For affinoid tensors use the potentially orthonormalizable Banach tensor argument in Pottharst Lemma 2.9; do not assume completed tensor is always exact. 5. Construct the integral comparison separately and verify that rationalization recovers this map.

**Source locators.** [Pottharst-2013](#source-pottharst-2013), Theorem 2.8 and Lemma 2.9, pp.1598–1599.; [KPX-v3](#source-kpx-v3), Proposition 2.3.7, p.22.

**Check.** The universal-period H_K-acyclicity and the integral comparison remain explicit gaps; the source proof is not a baseline declaration.

<a id="phigammamodulesandiwasawacohomology-pg-3-herr-cup"></a>

### 3.18. Cup product with the Herr sign convention

**Target:** `herrCup` (construction); `PG.3/herr-cup`.

Construct the cochain cup C_φ(D)⊗C_φ(E)→C_φ(D⊗E) in the chosen sign convention, inducing the usual graded cohomological product. For degree-one pairs x=(x₁,x₂), y=(y₁,y₂), its degree-two representative is x₂⊗γ(y₁)−x₁⊗φ(y₂). Degree-zero factors use the corresponding operator-twisted multiplication. Under the Galois comparison this is the existing continuous cup product. Over a finite coefficient field the compatibility of cup products with the Galois comparison is the owner's (PadicHodgeTheory:P7/herr-complex-interface); this node supplies the cochain-level product over affinoid A.

**Hypotheses.** Finite projective (φ,Γ\_K)-modules with the diagonal tensor action; tensor over their common period ring and cochains over fixed coefficients.

**Inputs.** `PadicHodgeTheory:P7/herr-complex-interface`, [PG.3/arithmetic-herr](#phigammamodulesandiwasawacohomology-pg-3-arithmetic-herr), [PG.3/galois-herr-comparison](#phigammamodulesandiwasawacohomology-pg-3-galois-herr-comparison), `tauceti:TauCeti.ContCohomology.explicitCup11`.

**Proof route.** 1. Build the cup by the mapping-fibre resolution of the commuting φ and γ actions. 2. Check the Leibniz identity with d₁=(γ−1,1−φ), retaining the twists in the displayed formula. 3. Use the common continuous resolution to prove compatibility with the existing topological cup, and construct graded commutativity on cohomology.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 2.3.10, pp.23–24.; [Pottharst-2013](#source-pottharst-2013), Theorem 2.8, pp.1598–1599, cup compatibility.

**Uses.** PG.3 duality: Pair D with D∨(1) by the degree-two cup. KPX §4.2: Construct the Iwasawa pairing with its involution.

**API.**

- `herrCup.degreeOne` (characterisation): The H¹×H¹ representative is x₂⊗γ(y₁)−x₁⊗φ(y₂).
- `herrCup.leibniz` (relation): d(x∪y)=dx∪y+(−1)^deg(x)x∪dy.
- `herrCup.galois` (compatibility): The comparison carries this product to the continuous cohomology cup, including its coefficient pairing.

**Acceptance examples.**

- `herr_cup_trivial`: For trivial actions on Q_p, (a,b)∪(c,d)=bc−ad in degree two.
- `herr_cup_swap`: For trivial actions, exchanging the two degree-one factors negates the result; (1,0)∪(0,1)=−1.
- `herr_cup_twisted`: The general representative retains γ(y₁) and φ(y₂); replacing them both by y without an invariance hypothesis is not an API equality.

**Check.** A coordinatewise exterior product without the operator twists is incorrect.

<a id="phigammamodulesandiwasawacohomology-pg-3-herr-tate-duality"></a>

### 3.19. Euler characteristic and Tate duality

**Target:** `herrTateDuality` (comparison); `PG.3/herr-tate-duality`.

Finiteness, the Euler characteristic and duality over a finite coefficient field are imported from PadicHodgeTheory:P7/herr-complex-interface: for a finite free (φ,Γ\_K)-module D over the Robba ring with coefficients in E, Herr cohomology is finite-dimensional, vanishes outside 0,1,2, satisfies Σ(−1)^i dim_E H^i=−[K:Q_p]rank D, and cup product with D∨(1) followed by the trace is a perfect pairing H^i(D)×H^{2−i}(D∨(1))→E. PG adds the explicit residue model of the degree-two invariant for K=Q_p: Res^γ(f⊗ε)=(log χ(γ))^{-1}Res(f dπ/(1+π)), which equals C_p times the Tate invariant for a constant C_p∈Q_p^× independent of A and γ. The value of C_p is not assumed.

**Hypotheses.** E finite over Q_p; D finite projective, not necessarily étale. Fix the Tate twist, generator and local reciprocity orientation. The owner uses Liu's coordinate order; the cochain isomorphism with maps 1, (a,b)↦(b,a) and −1 converts it to PG's signs, as the PadicHodgeTheory package records in §4.5.

**Inputs.** `PadicHodgeTheory:P7/herr-complex-interface`, [PG.3/herr-cup](#phigammamodulesandiwasawacohomology-pg-3-herr-cup), [PG.3/galois-herr-comparison](#phigammamodulesandiwasawacohomology-pg-3-galois-herr-comparison), `ArithmeticGaloisDuality:D7/local-coefficient-field-duality`.

**Proof route.** 1. Cite the owner theorem for finiteness, Euler characteristic and perfectness, and transport it to PG's signs through the cochain isomorphism 1, (a,b)↦(b,a), −1. 2. For K=Q_p define the residue map, check its invariance under φ, ψ and Γ, and compare it with the Tate isomorphism by base change from A=Q_p, which produces the constant C_p.

**Source locators.** [KPX-v3](#source-kpx-v3), Theorem 2.3.11, Remark 2.3.12 and Notation 2.3.13, p.24; residue pairing diagram, p.25.

**Check.** KPX Remark 2.3.12 records that the value of C_p is only claimed in the literature; do not set C_p=1.

<a id="phigammamodulesandiwasawacohomology-pg-3-herr-field-maps"></a>

### 3.20. Restriction and corestriction of Herr cochains

**Target:** `herrFiniteFieldMaps` (construction); `PG.3/herr-field-maps`.

For finite L/K, construct derived restriction and corestriction on the Herr models, matching the existing continuous Galois maps for étale realizations. They satisfy transitivity, projection formula and cor∘res=[L:K] on cohomology with restricted coefficients; under local duality restriction and corestriction are adjoint. Ring traces and Γ cosets are both retained in the cochain maps. Over a finite coefficient field generator independence and finite-extension compatibility on cohomology are the owner's (PadicHodgeTheory:P7/herr-complex-interface); this node supplies the cochain-level maps.

**Hypotheses.** Finite extensions of p-adic fields, compatible closures, and the finite étale coefficient comparison; topological coefficient hypotheses of D7.

**Inputs.** `PadicHodgeTheory:P7/herr-complex-interface`, [PG.2/realization-operations](#phigammamodulesandiwasawacohomology-pg-2-realization-operations), [PG.3/galois-herr-comparison](#phigammamodulesandiwasawacohomology-pg-3-galois-herr-comparison), [PG.3/herr-cup](#phigammamodulesandiwasawacohomology-pg-3-herr-cup), `tauceti:TauCeti.ContCohomology.explicitCor1`, `ArithmeticGaloisDuality:D7`, `ArithmeticGaloisDuality:R02.1/carrier-comparison`.

**Proof route.** 1. Transport restriction through the compatible field-extension realization and compare the two continuous resolutions. 2. Construct trace over the finite étale ring extension and sum over Γ cosets for corestriction; identify these with the existing continuous corestriction. 3. Verify composition and the trace/cup projection formula before passing to cohomology.

**Source locators.** [KPX-v3](#source-kpx-v3), Remark 2.2.4, p.16; Lemma 2.3.5 and Proposition 2.3.7, p.22.; [CC-1998](#source-cc-1998), Proposition II.4.1, pp.11–12.

**Uses.** PG.5: Identify ψ transitions with finite-layer corestriction. ArithmeticGaloisDuality D7: Reuse its low-degree topological maps and higher continuous resolution.

**API.**

- `herrFiniteFieldMaps.transitive` (functoriality): Restriction and corestriction compose along a tower.
- `herrFiniteFieldMaps.res_cor` (relation): Corestriction after restriction is [L:K] on cohomology.
- `herrFiniteFieldMaps.cup` (compatibility): cor(x∪res(y))=cor(x)∪y, with the same invariant normalization.

**Acceptance examples.**

- `herr_unramified_degree`: For an unramified degree-f extension and a trivial H⁰ class a, corestriction after restriction is f a.
- `herr_cyclotomic_step`: If L is already a cyclotomic level, [L∞:K∞]=1 but a Γ index contributes the full [L:K].
- `herr_identity_extension`: For L=K both cochain maps are identities.

**Check.** The coefficient extension degree is [L∞:K∞]; the full [L:K] identity also uses the Γ index.

<a id="phigammamodulesandiwasawacohomology-pg-3-integral-two-descent"></a>

### 3.21. Integral dyadic derived descent

**Target:** `dyadicHerrDescent` (construction); `PG.3/integral-two-descent`.

For p=2, K′=K(μ₄) and Q=Gal(K′/K), construct RΓ(Q,C_Herr(K′,T)) using the coherent Q-action obtained from a continuous resolution, and compare its totalization to RΓ\_cont(G_K,T). If K′=K, use the torsion-free cyclotomic subgroup already available. The descent is derived: replacing RΓ(Q,−) by degreewise fixed vectors is not allowed over Z₂.

**Hypotheses.** T a finite free Z₂-representation, or a finite 2-primary representation in the integral étale category. C_Herr(K′,T) uses a torsion-free cyclotomic quotient; a finite presentation of its cohomology does not by itself carry a strict coherent Q-action.

**Inputs.** [PG.3/arithmetic-herr](#phigammamodulesandiwasawacohomology-pg-3-arithmetic-herr), [PG.3/galois-herr-comparison](#phigammamodulesandiwasawacohomology-pg-3-galois-herr-comparison), `ArithmeticGaloisDuality:R02.2/compact-hochschild-serre`, `ArithmeticGaloisDuality:D7/continuous-derived-cochains`, `ArithmeticGaloisDuality:R02.1/carrier-comparison`.

**Proof route.** 1. Restrict actual continuous cochains to G_K′ and use its quotient action in a bar or homotopy-coherent model. 2. Compare to the torsion-free Herr complex by the integral period resolution. 3. Totalize the finite-group resolution and apply continuous Hochschild–Serre; prove convergence and comparison before cancelling extra terms.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 2.3.3, p.21, rational torsion convention.; [Berger-intro](#source-berger-intro), §III.2.4, p.24, odd-prime scope; dyadic extension here is an explicit worker proof obligation.

**Uses.** PG.5: Supply the integral dyadic branch of the Iwasawa comparison. PG.3: Prevent exporting an odd-prime proof as an integral p=2 theorem.

**API.**

- `dyadicHerrDescent.comparison` (compatibility): The totalization maps naturally to continuous G_K cochains.
- `dyadicHerrDescent.restriction` (functoriality): The edge map agrees with restriction to K′.
- `dyadicHerrDescent.rationalization` (compatibility): After inverting 2, finite-group averaging identifies the derived model with ordinary invariants.

**Acceptance examples.**

- `dyadic_trivial_quotient`: For K containing μ₄, the extra finite quotient is trivial and its resolution contracts.
- `dyadic_mod_two_group`: For trivial C₂ action on F₂, H¹(C₂,F₂)=F₂; degreewise invariants miss it.
- `dyadic_rational_average`: For a Q₂-vector space with C₂ action, the projector (1+s)/2 is defined and higher finite-group cohomology vanishes.

**Check.** This is a specified construction obligation, not a theorem proved by KPX’s rational order-two averaging.

<a id="phigammamodulesandiwasawacohomology-pg-3-herr-ext"></a>

### 3.22. Herr cohomology, extensions and tangent classes

**Target:** `herrExtComparison` (comparison); `PG.3/herr-ext`.

Herr H^i(D) identifies with Ext^i(1,D) in the appropriate (φ,Γ)-extension category; in degree one it classifies extensions with their actual action matrices. For finite field coefficients, Ext¹(D,D) identifies with first-order (φ,Γ)-deformations over E[ε]/ε² with a fixed reduction. If H⁰(End D)=E and H²(End D)=0, its dimension is 1+[K:Q_p]rank(D)².

**Hypotheses.** For the tangent statement D is finite projective over R_{K,E}; deformations are finite projective and framed by the reduction, modulo isomorphisms inducing identity on it. Higher Ext uses the source extension category, not an unconstructed abelian category of all finite projective objects.

**Inputs.** [PG.3/arithmetic-herr](#phigammamodulesandiwasawacohomology-pg-3-arithmetic-herr), [PG.3/herr-tate-duality](#phigammamodulesandiwasawacohomology-pg-3-herr-tate-duality).

**Proof route.** 1. Split an extension as an underlying module and read the φ and γ off-diagonal entries as a Herr cocycle. 2. Changing the splitting adds a coboundary; reconstruct the extension from a cocycle. 3. Apply to End D and let ε act by inclusion followed by projection; use Euler characteristic with the two stated end-group hypotheses.

**Source locators.** [BHS-2019](#source-bhs-2019), §3.3, complex (3.10), p.342, and formulas (3.11)–(3.13), p.343.; [Ding-2025](#source-ding-2025), §2.1, pp.9–10; Euler-characteristic use in §2.3.

**Check.** The displayed tangent dimension is conditional; exceptional endomorphism and H² classes change it.

<a id="phigammamodulesandiwasawacohomology-pg-3-localized-herr"></a>

### 3.23. Herr cohomology after inverting t

**Target:** `localizedHerrComplex` (construction); `PG.3/localized-herr`.

For a local finite-dimensional E-algebra A and M=D[1/t], define C_Herr(M) by the full-torsion invariant three-term model and H^i(M)=colim_n H^i(t^{-n}D). It is independent of the chosen stable Robba lattice D, allowing the underlying lattice specified over R_K in BHS Remark 3.3.1 rather than assuming an R_{A,K}-lattice exists. Compare BHS’s d₁=(1−γ,φ−1) with our sign using −id in degree two; identify H¹ with extension classes of localized objects.

**Hypotheses.** E splits K; M finite free over R_{A,K}[1/t], with the source’s stable lattice condition; A is Artinian, not an arbitrary affinoid for this clause.

**Inputs.** [PG.3/arithmetic-herr](#phigammamodulesandiwasawacohomology-pg-3-arithmetic-herr), [PG.3/herr-ext](#phigammamodulesandiwasawacohomology-pg-3-herr-ext), [PG.7/relative-category](#phigammamodulesandiwasawacohomology-pg-7-relative-category).

**Proof route.** 1. Take the t-power filtered union of cochains and use exactness of filtered colimits and rational finite-torsion invariants. 2. Compare two lattices by bounded t powers in both directions. 3. Check the opposite differential sign explicitly and transport cocycle extension data; import the de Rham period/B-pair functor rather than define it here.

**Source locators.** [BHS-2019](#source-bhs-2019), Remark 3.3.1, Definition 3.3.2 and complex (3.10), p.342; formulas (3.11)–(3.13), p.343; Lemma 3.3.5, p.344.

**Uses.** BHS local model §3.3: Provide its localized cohomology and extension dictionary. PG.7 characters: Use period exactness without assuming absent affinoid lattices.

**API.**

- `localizedHerrComplex.lattice_independent` (compatibility): Commensurable stable lattices induce canonical identical colimit cohomology.
- `localizedHerrComplex.signComparison` (equivalence): Identity in degrees 0 and 1 and −identity in degree 2 compare the two sign conventions.
- `localizedHerrComplex.extOne` (characterisation): H¹(M) classifies localized extensions of the unit object by M.

**Acceptance examples.**

- `localized_herr_sign`: If our d₁(a,b)=c, the BHS degree-two representative is −c.
- `localized_herr_t_shift`: Replacing D by t^{-m}D leaves the filtered colimit unchanged.
- `localized_herr_zero`: The zero module has zero localized Herr cohomology in every degree.

**Check.** Finite freeness over A⊗B_dR and exactness of the period functor require the Artinian coefficient and period-flatness proof of BHS Lemma 3.3.5.

<a id="phigammamodulesandiwasawacohomology-pg-3-period-sheaf-cohomology"></a>

### 3.24. Period-sheaf and B-pair cohomology

**Target:** `herrPeriodSheafCohomology` (comparison); `PG.3/period-sheaf-cohomology`.

Under the equivalences of PG.2, the derived cohomology of a cyclotomic (φ,Γ)-module agrees with the Frobenius mapping-fibre cohomology of its pro-étale period sheaf and with B-pair hypercohomology. On étale objects this comparison is the actual Galois–Herr map, and hence respects cups and finite-field maps.

**Hypotheses.** K finite over Q_p; use KL’s period-sheaf and all-component conventions with the explicit Γ comparison.

**Inputs.** `PadicHodgeTheory:P8/relative-frobenius-cohomology-comparison`, [PG.2/period-sheaf-equivalences](#phigammamodulesandiwasawacohomology-pg-2-period-sheaf-equivalences), [PG.3/galois-herr-comparison](#phigammamodulesandiwasawacohomology-pg-3-galois-herr-comparison), [PG.1/etale-phi-cohomology](#phigammamodulesandiwasawacohomology-pg-1-etale-phi-cohomology), `PadicHodgeTheory:P8`, `ArithmeticGaloisDuality:D7`, `PadicHodgeTheory:P7/b-pair-cohomology-handoff`, `PadicHodgeTheory:P8/relative-witt-and-robba-period-sheaves`.

**Proof route.** 1. Apply the pro-étale period exact sequence and acyclicity to the cyclotomic perfectoid cover. 2. Identify the continuous Γ resolution with the Herr mapping fibre. 3. Use the existing P7 B-pair cohomology handoff and compare its resolution with the period-sheaf mapping fibre. Only this compatibility comparison is new here.

**Source locators.** [KL-I](#source-kl-i), Remark 9.4.3, pp.199–200; Remark 9.5.9, p.202.

**Check.** A category equivalence alone does not identify these derived cohomology functors.

**Stage acceptance.** Signed φ–ψ homotopy, affinoid and integral Galois–Herr comparison, cochain-level cups and field maps, residue normalization and derived dyadic descent; field-coefficient Herr theory imported. All comparisons must be the stated natural maps, with the sign, scalar, topology and coefficient hypotheses above.

**Remaining refinement.** Field-coefficient Herr cohomology, generator independence, Galois comparison and duality are owned by PadicHodgeTheory:P7/herr-complex-interface. Remaining here: universal-period H_K-acyclicity for affinoid coefficients and the integral Herr comparison; integral dyadic derived descent; the residue constant C_p; period-sheaf cohomology compatibility.


## PG.4. The ψ operator and its topology

Scalar ψ is fixed by the existing Coleman comparison before extending it to modules. The balanced map s⊗m↦ψ\_scalar(s)m followed by inverse Frobenius linearization gives module ψ without division by p. In torsion-free scalars trace=pψ determines the quotient; after reduction modulo p this equation can become 0=0. Module-basis independence keeps that canonical scalar ψ fixed. It is not independence of arbitrary scalar coordinate choices.

**Planets:** Module psi operator, Rank-one psi, Psi-zero projection, One minus Frobenius.

<a id="phigammamodulesandiwasawacohomology-pg-4-balanced-psi"></a>

### 4.1. Balanced scalar psi on a tensor product

**Target:** `psiTensor` (construction); `PG.4/balanced-psi`.

Construct the R-linear map psiTensor_r:S tensor_R M→M by s tensor m ↦ r(s)m.

**Hypotheses.** R,S are commutative rings with a specified algebra map R→S. M is an R-module. The action on S is this map, modelling Frobenius, not an inferred identity self-action. r:S→R is R-linear for that action.

**Inputs.** `mathlib:TensorProduct.lift`.

**Proof route.** 1. The map is additive in both variables. For a∈R, r(a·s)m=a r(s)m=r(s)(am), so it is balanced. 2. Apply the existing TensorProduct.lift.

**Source locators.** [KPX-v3](#source-kpx-v3), Section 2.2.6, module psi through Frobenius linearization, pp.16–17.

**Uses.** PG.4 module psi: Descend the canonical scalar map through actual tensor relations before linearization.

**API.**

- `psiTensor_tmul` (characterisation): psiTensor(s tensor m)=r(s)m.
- `psiTensor_one` (simp): If r(1)=1, psiTensor(1 tensor m)=m.
- `psiTensor_zero` (simp): The zero tensor maps to zero.

**Acceptance examples.**

- `tensor_zero`: The zero tensor maps to zero, including for p-torsion M.
- `tensor_identity_scalar`: For S=R and r=id, s tensor m maps to sm.
- `tensor_projection_not_product`: For S=Q×Q with diagonal Q-action and r(s1,s2)=s1, (0,1) tensor 7 maps to 0 and (1,0) tensor 7 maps to 7.

**Check.** Do not invert p. The proof also works for torsion modules M.

<a id="phigammamodulesandiwasawacohomology-pg-4-linearized-psi"></a>

### 4.2. Psi on a linearized module

**Target:** `psiOfLinearization` (construction); `PG.4/linearized-psi`.

Define psi_N=psiTensor_r composed with L inverse, as an R-linear map N→M. It is integral whenever the actual input rings, r and L are integral.

**Hypotheses.** R,S are commutative, with specified R→S; M is an R-module and r:S→R is R-linear for that map. N is an S-module with compatible restricted R-action. L:S tensor_R M ≃\_S N is the actual Frobenius linearization, not the Galois/module equivalence.

**Inputs.** [PG.4/balanced-psi](#phigammamodulesandiwasawacohomology-pg-4-balanced-psi).

**Proof route.** 1. Restrict scalars on L inverse and compose with psiTensor. 2. Keep source N and target M distinct at a fixed radius; identify them only through the supplied full-ring transition maps.

**Source locators.** [KPX-v3](#source-kpx-v3), Section 2.2.6, pp.16–17.

**Uses.** PG.4 and PG.5: Supply the module left inverse for Herr and Iwasawa constructions. PadicHodgeRegulators:L4: Use the actual psi-fixed module after period-module comparison exists.

**API.**

- `psiOfLinearization_pure` (characterisation): psi_N(L(s tensor m))=r(s)m.
- `psiOfLinearization_leftInverse` (relation): If r(1)=1, psi_N(L(1 tensor m))=m.
- `psiOfLinearization_zero` (simp): psi_N(0)=0.

**Acceptance examples.**

- `linearized_zero`: Zero maps to zero.
- `linearized_scaled`: Over Q, let L(s tensor m)=2sm and r=id. Then psi_N(6)=3, not 6.
- `linearized_torsion`: For the canonical Z-linearization on Z/5, psi_N(1)=1. Multiplication by 5 is zero, so a reduced equation 5 psi=0 cannot by itself define the operator.

**Check.** A linearization alone does not supply topology, a stable lattice or a Galois representation.

<a id="phigammamodulesandiwasawacohomology-pg-4-linearized-psi-pure"></a>

### 4.3. Psi on pure Frobenius tensors

**Target:** `psiOfLinearization_pure` (lemma); `PG.4/linearized-psi-pure`.

For all s,m, psi_N(L(s tensor m))=r(s)m.

**Hypotheses.** The specified R→S, R-linear r, compatible module actions and actual S-linear equivalence L of linearized-psi.

**Inputs.** [PG.4/linearized-psi](#phigammamodulesandiwasawacohomology-pg-4-linearized-psi), [PG.4/balanced-psi](#phigammamodulesandiwasawacohomology-pg-4-balanced-psi).

**Proof route.** 1. Cancel L inverse against L and use the pure-tensor formula.

**Source locators.** [KPX-v3](#source-kpx-v3), Section 2.2.6, pp.16–17.

**Check.** The coefficient is r(s), not s or phi(r(s)).

<a id="phigammamodulesandiwasawacohomology-pg-4-linearized-psi-left-inverse"></a>

### 4.4. Left inverse without division

**Target:** `psiOfLinearization_leftInverse` (lemma); `PG.4/linearized-psi-left-inverse`.

If r(1)=1, psi_N(phi_M(m))=m for phi_M(m)=L(1 tensor m).

**Hypotheses.** The ring/module/linearization hypotheses of linearized-psi; r(1)=1.

**Inputs.** [PG.4/linearized-psi-pure](#phigammamodulesandiwasawacohomology-pg-4-linearized-psi-pure).

**Proof route.** 1. Set s=1 in the pure-tensor formula.

**Source locators.** [KPX-v3](#source-kpx-v3), Section 2.2.6, pp.16–17.

**Check.** No cancellation by p occurs after reduction of M modulo p.

<a id="phigammamodulesandiwasawacohomology-pg-4-linearized-psi-uniqueness"></a>

### 4.5. Uniqueness and basis independence

**Target:** `psiOfLinearization_unique` (theorem); `PG.4/linearized-psi-uniqueness`.

An R-linear q:N→M satisfying q(L(s tensor m))=r(s)m for all s,m equals psi_N. Computation in different bases of the same linearized module therefore gives the same operator.

**Hypotheses.** The specified ring actions, canonical scalar r and actual L of linearized-psi.

**Inputs.** [PG.4/linearized-psi-pure](#phigammamodulesandiwasawacohomology-pg-4-linearized-psi-pure), `mathlib:TensorProduct.ext'`.

**Proof route.** 1. Precompose both maps with L and use tensor extensionality. 2. Use surjectivity of L. The canonical scalar r remains fixed.

**Source locators.** [KPX-v3](#source-kpx-v3), Section 2.2.6, pp.16–17.

**Check.** This does not identify the zeroth coordinate of every arbitrary scalar basis with r.

<a id="phigammamodulesandiwasawacohomology-pg-4-linearized-psi-naturality"></a>

### 4.6. Naturality of module psi

**Target:** `psiOfLinearization_natural` (theorem); `PG.4/linearized-psi-naturality`.

For R-linear f:M→M′ and S-linear g:N→N′ with g(L(s tensor m))=L′(s tensor f(m)), psi_N′ g=f psi_N.

**Hypotheses.** The two actual linearizations use the same specified R→S and scalar r; all scalar actions are compatible.

**Inputs.** [PG.4/linearized-psi-pure](#phigammamodulesandiwasawacohomology-pg-4-linearized-psi-pure), [PG.4/linearized-psi-uniqueness](#phigammamodulesandiwasawacohomology-pg-4-linearized-psi-uniqueness).

**Proof route.** 1. On L(s tensor m), both sides equal r(s)f(m). 2. Apply tensor extensionality and surjectivity. Quotient modules are allowed when their actual maps and linearization exist.

**Source locators.** [KPX-v3](#source-kpx-v3), Section 2.2.6, pp.16–17.

**Check.** The algebraic statement uses neither flatness nor torsion-freeness.

<a id="phigammamodulesandiwasawacohomology-pg-4-linearized-psi-semilinear"></a>

### 4.7. Semilinear Gamma compatibility

**Target:** `psiOfLinearization_semilinear` (theorem); `PG.4/linearized-psi-semilinear`.

Let sigma_R,sigma_S commute with R→S, and g_M,g_N be the corresponding semilinear maps. If g_N(L(s tensor m))=L(sigma_S(s) tensor g_M(m)) and r sigma_S=sigma_R r, then psi_N g_N=g_M psi_N.

**Hypotheses.** The actual ring/module/linearization data of linearized-psi, with the stated scalar semilinearity and compatibility equations. No finite-group averaging.

**Inputs.** [PG.4/linearized-psi-pure](#phigammamodulesandiwasawacohomology-pg-4-linearized-psi-pure).

**Proof route.** 1. On L(s tensor m), both sides equal sigma_R(r(s))g_M(m). 2. Use additivity, pure-tensor spanning and surjectivity of L.

**Source locators.** [KPX-v3](#source-kpx-v3), Sections 2.2.2 and 2.2.6, pp.16–17.

**Check.** Retain the general-K coefficient action rather than declaring it trivial.

<a id="phigammamodulesandiwasawacohomology-pg-4-linearized-psi-continuity"></a>

### 4.8. Continuity from actual finite coordinates

**Target:** `psiOfLinearization_continuous` (theorem); `PG.4/linearized-psi-continuity`.

Suppose finitely many b_i∈S and continuous c_i:N→M satisfy x=Σ L(b_i tensor c_i(x)). If M is a topological additive group with continuous constant R-scalar multiplication, psi_N is continuous.

**Hypotheses.** The actual algebraic data of linearized-psi; the stated finite reconstruction and coordinate continuity in the claimed topology.

**Inputs.** [PG.4/linearized-psi-pure](#phigammamodulesandiwasawacohomology-pg-4-linearized-psi-pure).

**Proof route.** 1. The pure formula gives psi_N(x)=Σ r(b_i)c_i(x). 2. Every summand is continuous and the sum is finite.

**Source locators.** [KPX-v3](#source-kpx-v3), Sections 2.2.2–2.2.6, radius models and module psi, pp.16–17.

**Check.** Algebraic freeness alone is not continuous coordinates for every weak or annular topology.

<a id="phigammamodulesandiwasawacohomology-pg-4-rank-one-psi"></a>

### 4.9. Rank-one psi formula

**Target:** `rankOnePsi` (definition); `PG.4/rank-one-psi`.

For additive psi:A→A and a unit a in a commutative ring, define rankOnePsi(a)(f)=psi(a inverse times f). This is the coefficient formula when phi_D(e)=a e and the linearization is invertible.

**Hypotheses.** A is commutative, psi additive and a∈A×.

**Inputs.** .

**Proof route.** 1. Precompose psi with multiplication by a inverse. 2. A general positive-height Wach multiplier need not be a unit; that case needs its own stability or localization proof.

**Source locators.** [KPX-v3](#source-kpx-v3), Section 2.2.6, module psi formula, pp.16–17.

**Uses.** PG.4 rank-one computations: Detect the inverse multiplier and compare module bases.

**API.**

- `rankOnePsi_apply` (characterisation): rankOnePsi(a)(f)=psi(a inverse times f).
- `rankOnePsi_one` (simp): For a=1, the map is psi.
- `rankOnePsi_zero` (simp): Zero maps to zero.

**Acceptance examples.**

- `rank_one_half`: For A=Q, phi=psi=id,a=2, the value on 6 is 3.
- `rank_one_negative`: For A=Q,psi=id,a=-1, the value on 7 is -7.
- `rank_one_no_pullout`: For A=Q×Q,phi=psi=swap,a=(2,3), the value on 1 is (1/3,1/2), not (1/2,1/3).

**Check.** Do not move a inverse outside psi without the required Frobenius-scalar identity.

<a id="phigammamodulesandiwasawacohomology-pg-4-rank-one-left-inverse"></a>

### 4.10. Rank-one Frobenius left inverse

**Target:** `rankOnePsi_phi` (lemma); `PG.4/rank-one-left-inverse`.

If psi(phi(f))=f, rankOnePsi(a)(a phi(f))=f.

**Hypotheses.** A commutative; phi a ring endomorphism; psi additive with psi phi=id; a a unit.

**Inputs.** [PG.4/rank-one-psi](#phigammamodulesandiwasawacohomology-pg-4-rank-one-psi).

**Proof route.** 1. Cancel a inverse times a inside psi, then use the scalar left inverse.

**Source locators.** [KPX-v3](#source-kpx-v3), Section 2.2.6, pp.16–17.

**Check.** Do not infer A-linearity of psi.

<a id="phigammamodulesandiwasawacohomology-pg-4-rank-one-basis-covariance"></a>

### 4.11. Rank-one basis covariance

**Target:** `rankOnePsi_changeBasis` (theorem); `PG.4/rank-one-basis-covariance`.

For e′=b e set a′=phi(b)a b inverse. If psi(phi(c)f)=c psi(f), then rankOnePsi(a′)(b inverse f)=b inverse rankOnePsi(a)(f).

**Hypotheses.** A commutative; phi a ring endomorphism; psi additive with the stated projection formula; a,b units.

**Inputs.** [PG.4/rank-one-psi](#phigammamodulesandiwasawacohomology-pg-4-rank-one-psi).

**Proof route.** 1. Compute a′ inverse times b inverse f=phi(b inverse)a inverse f. 2. Apply the projection formula with c=b inverse.

**Source locators.** [KPX-v3](#source-kpx-v3), Section 2.2.6, pp.16–17.

**Check.** Retain both the Frobenius on b and the inverse on coordinates.

<a id="phigammamodulesandiwasawacohomology-pg-4-psi-zero-projection"></a>

### 4.12. Projection onto the psi-zero module

**Target:** `psiProjection` (construction); `PG.4/psi-zero-projection`.

Define P_M:M→ker psi by x↦x-phi(psi(x)), C-linearly for the fixed coefficient ring.

**Hypotheses.** C commutative; M a C-module; phi,psi C-linear; psi phi=id.

**Inputs.** .

**Proof route.** 1. Applying psi gives zero by psi phi=id. 2. Use the existing linear-map kernel subtype and inherited module structure.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 2.3.3 and Proposition 2.3.6, pp.21–22.

**Uses.** PG.3 signed comparison: Construct the corrected section and homotopy. PG.4 psi API: Separate phi psi from identity.

**API.**

- `psiProjection_val` (characterisation): The underlying value is x-phi(psi(x)).
- `psiProjection_phi` (simp): P(phi(x))=0.
- `psiProjection_onKer` (simp): P(k)=k on ker psi.

**Acceptance examples.**

- `projection_zero_kernel`: For phi=psi=id on Q, P=0.
- `projection_nonzero_kernel`: On Q[U], phi(U)=U^p and coefficient-extracting psi give P(U)=U for p>1.
- `projection_frobenius_image`: In that model P(U^p)=0.

**Check.** Do not assert period-ring linearity.

<a id="phigammamodulesandiwasawacohomology-pg-4-psi-zero-splitting"></a>

### 4.13. Unique Frobenius-kernel decomposition

**Target:** `psiProjection_uniqueSplit` (theorem); `PG.4/psi-zero-splitting`.

Every x has a unique pair (m,k)∈M×ker psi with x=phi(m)+k, namely (psi(x),P_M(x)).

**Hypotheses.** C commutative; phi,psi C-linear on M; psi phi=id.

**Inputs.** [PG.4/psi-zero-projection](#phigammamodulesandiwasawacohomology-pg-4-psi-zero-projection).

**Proof route.** 1. Existence is the definition of P. 2. Apply psi to recover m; subtract phi(m) to recover k.

**Source locators.** [KPX-v3](#source-kpx-v3), Proposition 2.3.6, kernel proof, p.22.

**Check.** This is an additive/C-linear splitting, not generally a period-ring-module splitting.

<a id="phigammamodulesandiwasawacohomology-pg-4-psi-one-to-zero"></a>

### 4.14. One minus Frobenius on psi-fixed vectors

**Target:** `oneSubPhiOnPsiOne` (construction); `PG.4/psi-one-to-zero`.

Restrict 1-phi to the C-linear map ker(psi-id)→ker psi, x↦x-phi(x).

**Hypotheses.** C commutative; phi,psi C-linear on M; psi phi=id.

**Inputs.** [PG.4/psi-zero-projection](#phigammamodulesandiwasawacohomology-pg-4-psi-zero-projection).

**Proof route.** 1. For psi(x)=x, psi(x-phi(x))=psi(x)-x=0. 2. Restrict the actual endomorphism to the fixed-vector submodule.

**Source locators.** [LLZ-2011](#source-llz-2011), §3A, p.1116: the map 1−φ from N(T)^{ψ=1} to (φ^\*N(T))^{ψ=0} defined before Remark 3.1.

**Uses.** PadicHodgeRegulators:L4: Define the actual input map before taking Coleman coordinates.

**API.**

- `oneSubPhiOnPsiOne_val` (characterisation): The underlying value is x-phi(x).
- `oneSubPhiOnPsiOne_zero` (simp): Zero maps to zero.
- `oneSubPhiOnPsiOne_vanish` (characterisation): Its value at x vanishes iff phi(x)=x.

**Acceptance examples.**

- `one_sub_phi_identity`: For phi=psi=id, the map is zero.
- `one_sub_phi_zero`: Zero maps to zero for every admitted pair.
- `one_sub_phi_not_surjective`: In the p=2 polynomial model psi-fixed polynomials are constant, so the image is zero while U is a nonzero element of ker psi.

**Check.** Do not assert surjectivity onto ker psi.

<a id="phigammamodulesandiwasawacohomology-pg-4-period-psi"></a>

### 4.15. Scalar ψ on the cyclotomic models

**Target:** `periodPsi` (construction); `PG.4/period-psi`.

Extend the Coleman scalar ψ through the integral cyclotomic coefficient rings and their finite étale norm-field extensions. For Q_p write f=Σ\_{i=0}^{p−1}(1+π)^i φ(f_i); set ψ(f)=f₀. On rational annuli it equals φ^{-1}Tr_{target/φ(source)}(f)/p and changes radius in the direction opposite to φ. Integral trace divisibility is proved before reduction. The operators commute with Γ and agree under bounded, dagger and Robba inclusions.

**Hypotheses.** Use the specific Frobenius ring map, including coefficient Frobenius for general K. The annular source and target may differ; a fixed-radius endomorphism is not presumed.

**Inputs.** [PG.0/coefficient-actions](#phigammamodulesandiwasawacohomology-pg-0-coefficient-actions), `ColemanPowerSeries:L1/frobenius-zeroth-coordinate-psi`, `ColemanPowerSeries:L1/coleman-trace-psi`, `ColemanPowerSeries:L1/coleman-trace-divisibility`, `PadicHodgeTheory:P7:annulus-foundations`.

**Proof route.** 1. Localize the existing plus-ring coordinate operator and prove compatible p-adic completion. 2. For finite étale norm-field extensions compare the lifted Frobenius trace and its integral coordinates. 3. Bound the coordinate projections in each weak/annular seminorm and extend to dagger and Robba limits. 4. Prove the trace identity on a finite basis and transport it through each embedding, without defining a reduced operator by division by p.

**Source locators.** [KPX-v3](#source-kpx-v3), Definitions 2.2.2 and 2.2.6, pp.16–18.; [LLZ-2011](#source-llz-2011), §1C1–1C2, pp.1103–1105.

**Uses.** PG.4 module ψ: Supply the scalar map for the retained tensor extension. PG.3 analytic inverse: Use the actual Frobenius coset decomposition and topology.

**API.**

- `periodPsi.frobenius` (relation): ψ(φ(f))=f and ψ(φ(a)f)=aψ(f).
- `periodPsi.gamma` (compatibility): ψγ=γψ with the specified scalar actions.
- `periodPsi.coordinates` (characterisation): ψ extracts the zeroth Frobenius coordinate, with continuous coordinate projections on the stated annular models.

**Acceptance examples.**

- `period_psi_unit_coset`: ψ(1)=1 but ψ(1+π)=0 for every p>1.
- `period_psi_not_inverse`: φψ(1+π)=0 differs from 1+π.
- `period_psi_mod_p`: The integral operator reduces with ψφ=1 modulo p even though the reduced trace is zero.

**Check.** ψφ=1 but φψ is a projection; integral trace quotient uniqueness is used only before p-torsion reduction.

<a id="phigammamodulesandiwasawacohomology-pg-4-period-module-psi"></a>

### 4.16. Integral module ψ and arithmetic rank-one formulas

**Target:** `periodModulePsiProperties` (theorem); `PG.4/period-module-psi`.

For integral étale modules and their bounded/dagger/Robba extensions, instantiate the retained tensor-linearization ψ, continuous in the relevant topologies and compatible with Γ, maps, finite-flat coefficient change, torsion reduction and period inclusions. It preserves each specified étale lattice. On the cyclotomic line D(Z_p(1)) with representation basis e, φ(e)=e and γ(e)=χ(γ)e, hence ψ(fe)=ψ(f)e; after an arbitrary unit basis change use the retained covariance formula. Mellin identifies the plus-ring ψ-zero module with the corresponding Iwasawa/analytic group algebra under its fixed normalization.

**Hypotheses.** Integral ψ comes from the already integral scalar operator; φ-linearization is invertible on the selected étale lattice. A positive-height Wach lattice is not an étale φ-linearization lattice, so this argument does not assert ψ preservation there.

**Inputs.** [PG.4/period-psi](#phigammamodulesandiwasawacohomology-pg-4-period-psi), [PG.4/linearized-psi](#phigammamodulesandiwasawacohomology-pg-4-linearized-psi), [PG.4/linearized-psi-continuity](#phigammamodulesandiwasawacohomology-pg-4-linearized-psi-continuity), [PG.4/rank-one-basis-covariance](#phigammamodulesandiwasawacohomology-pg-4-rank-one-basis-covariance), [PG.1/rank-one-dictionary](#phigammamodulesandiwasawacohomology-pg-1-rank-one-dictionary), `LocallyAnalyticDistributions:L3`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`, `PadicMeasuresIwasawaAlgebras:L2/unit-support-psi`, `PadicMeasuresIwasawaAlgebras:L1`, `LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism`, `LocallyAnalyticDistributions:L3/mellin-generator-change`.

**Proof route.** 1. Use the scalar-coordinate topological bounds and finite-projective direct-summand models to supply the continuity hypotheses of the retained theorem. 2. Apply tensor naturality to inclusion and coefficient maps; reduce the integral operator rather than the divided trace. 3. Calculate in the actual representation basis and compare to Mellin on the plus ring; track any change to a Wach or algebraic-character basis explicitly.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 2.2.6 and equation (2.2.6.1), pp.17–18.; [LLZ-2011](#source-llz-2011), §1C and §3A, pp.1103–1106 and 1116.

**Check.** The toy polynomial Frobenius U↦U^p used in algebraic tests is not the cyclotomic substitution π↦(1+π)^p−1.

**Stage acceptance.** Integral canonical ψ instantiated with topology and radius compatibility. All comparisons must be the stated natural maps, with the sign, scalar, topology and coefficient hypotheses above.

**Remaining refinement.** Instantiate annular and integral ψ coordinates and prove all topological bounds, finite-extension and lattice maps, using the already planned Coleman scalar operator.


## PG.5. The ψ complex and derived Iwasawa comparison

The native ψ complex supplies canonical kernel/cokernel maps. Its identification with Iwasawa cohomology requires the independent derived corestriction tower, Shapiro and limit control. Rationalization is after the integral inverse limit. Analytic generation uses the larger Robba-type Γ ring and both ψ-cokernel hypotheses of KPX Proposition 4.3.8. The Dospinescu–Le Bras application retains the unresolved verification of those hypotheses, inverse-(γ−1) semilinearity and radius control.

**Planets:** Psi complex, Iwasawa–ψ comparison, Derived character specialization.

<a id="phigammamodulesandiwasawacohomology-pg-5-psi-complex"></a>

### 5.1. Two-term psi complex

**Target:** `psiComplex` (construction); `PG.5/psi-complex`.

Construct the native cochain complex with M in degrees 1 and 2, differential psi-id from 1 to 2, and zero terms elsewhere.

**Hypotheses.** C commutative; M a C-module; psi C-linear.

**Inputs.** `mathlib:CochainComplex.of`, `mathlib:ModuleCat.ofHom`.

**Proof route.** 1. Use the actual supported module objects and zero modules outside them. 2. Only d(1,2) is nonzero, so consecutive composites vanish.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 4.2.2 and Proposition 4.2.3, p.36.

**Uses.** PG.5 derived Iwasawa comparison: Provide the actual source complex to compare with the independent corestriction tower.

**API.**

- `psiComplex_d12` (characterisation): d(1,2)=psi-id.
- `psiComplex_X1` (characterisation): The degree-one term is M.
- `psiComplex_X2` (characterisation): The degree-two term is M.

**Acceptance examples.**

- `psi_complex_identity`: For psi=id on Q, the differential is zero, not identity.
- `psi_complex_zero_operator`: For psi=0 on Q, the differential is -id and both kernel and cokernel vanish.
- `psi_complex_degree_zero`: Degree zero is a zero module; for M=Q, degree one is nonzero. This rejects placement in degrees 0 and 1.

**Check.** This definition does not identify its homology with a derived inverse limit or name it H_Iw.

<a id="phigammamodulesandiwasawacohomology-pg-5-psi-complex-functoriality"></a>

### 5.2. Functoriality of psi complexes

**Target:** `psiComplexMap` (construction); `PG.5/psi-complex-functoriality`.

For h intertwining psi and psi′, construct the map of psi complexes given by h in degrees 1 and 2 and zero elsewhere.

**Hypotheses.** C-modules M,M′ and C-linear psi,psi′,h with h psi=psi′ h.

**Inputs.** [PG.5/psi-complex](#phigammamodulesandiwasawacohomology-pg-5-psi-complex), `mathlib:CochainComplex.ofHom`.

**Proof route.** 1. The nontrivial square is h(psi-1)=(psi′-1)h. 2. Identity and composition hold degreewise.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 4.2.2 and Proposition 4.2.3, p.36.

**Uses.** PG.5 coefficient and module compatibility: Transport actual intertwiners through the two-term construction.

**API.**

- `psiComplexMap_f1` (characterisation): The degree-one map is h.
- `psiComplexMap_f2` (characterisation): The degree-two map is h.
- `psiComplexMap_id` (functoriality): Identity induces identity.

**Acceptance examples.**

- `psi_map_zero`: The zero intertwiner gives the zero map.
- `psi_map_identity`: Identity intertwiner gives identity.
- `psi_map_composition`: Scalar maps 2 then 3 on Q give scalar 6 in both degrees.

**Check.** No interchange with an arbitrary inverse limit is asserted.

<a id="phigammamodulesandiwasawacohomology-pg-5-psi-complex-h1"></a>

### 5.3. Degree-one psi homology

**Target:** `psiComplexH1Iso` (comparison); `PG.5/psi-complex-h1`.

The native degree-one homology is canonically isomorphic to ker(psi-id), sending a cycle class to the same vector because there are no incoming boundaries.

**Hypotheses.** C commutative; M a C-module; psi C-linear.

**Inputs.** [PG.5/psi-complex](#phigammamodulesandiwasawacohomology-pg-5-psi-complex), `mathlib:CategoryTheory.ShortComplex.moduleCatHomologyIso`, `mathlib:CategoryTheory.ShortComplex.moduleCatCyclesIso`.

**Proof route.** 1. Use the native short complex 0→M→M at degree 1. 2. Apply moduleCatHomologyIso and quotient by zero; the cycles inclusion fixes the actual map.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 4.2.2, p.36.

**Check.** This is not yet H1_Iw(K,T)=psi-fixed vectors.

<a id="phigammamodulesandiwasawacohomology-pg-5-psi-complex-h2"></a>

### 5.4. Degree-two psi homology

**Target:** `psiComplexH2Iso` (comparison); `PG.5/psi-complex-h2`.

The native degree-two homology is canonically isomorphic to M/range(psi-id), by the actual quotient map on the degree-two term.

**Hypotheses.** C commutative; M a C-module; psi C-linear.

**Inputs.** [PG.5/psi-complex](#phigammamodulesandiwasawacohomology-pg-5-psi-complex), `mathlib:CategoryTheory.ShortComplex.moduleCatHomologyIso`.

**Proof route.** 1. Use the native short complex M→M→0 at degree 2. 2. All of M is cycles; apply the native quotient-by-image identification.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 4.2.2 and Proposition 4.2.3, p.36.

**Check.** Derived specialization can have additional Tor terms; ordinary base change is not asserted.

<a id="phigammamodulesandiwasawacohomology-pg-5-integral-iwasawa-comparison"></a>

### 5.5. Derived integral Iwasawa comparison

**Target:** `integralIwasawaPsiComparison` (theorem); `PG.5/integral-iwasawa-comparison`.

For a finite free O_E-representation T of G_K, compare the independent inverse-corestriction complex Rlim_n RΓ\_cont(K_n,T) to [D(T) --(ψ−1)→D(T)] in degrees 1 and 2 as a complex of continuous Λ\_{O_E}(Γ\_K)-modules. Establish the comparison before deducing H¹\_Iw≅D(T)^{ψ=1} and H²\_Iw≅coker(ψ−1). Finite O_E-torsion variants use the integral descent theorem, not rational division of trace. At p=2 use PG.3’s derived torsion descent.

**Hypotheses.** K finite over Q_p; E finite over Q_p with ring O_E; K_n a fixed cofinal cyclotomic tower; continuous and derived inverse limits are the supplier’s objects. The concrete integral comparison proof and inverse-limit hypotheses remain named gaps.

**Inputs.** [PG.5/psi-complex](#phigammamodulesandiwasawacohomology-pg-5-psi-complex), [PG.4/period-module-psi](#phigammamodulesandiwasawacohomology-pg-4-period-module-psi), [PG.3/herr-field-maps](#phigammamodulesandiwasawacohomology-pg-3-herr-field-maps), [PG.3/integral-two-descent](#phigammamodulesandiwasawacohomology-pg-3-integral-two-descent), `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `ArithmeticGaloisDuality:D7/continuous-derived-cochains`, `PadicMeasuresIwasawaAlgebras:L1`.

**Proof route.** 1. Compare each finite-layer continuous complex with its integral period resolution and identify corestriction with the normalized trace transition. The degree-one isomorphism D(T)^{ψ=1}≅H¹\_Iw is Cherbonnier–Colmez 1999, Théorème II.1.3 (after Fontaine); the cochain-level comparison and the degree-two term are the targets here. 2. Construct the compatible inverse-system comparison at cochain level; the Γ action is the actual tower action. 3. Compute its derived inverse limit, retaining H⁰ and lim¹ terms until their vanishing or cancellation is proved. 4. Identify the resulting fibre with ψ−1 in the specified shift and prove naturality; only then apply the retained native homology isomorphisms.

**Source locators.** [CC-1999](#source-cc-1999), Proposition II.1.2 and Théorème II.1.3, p.12.; [KPX-v3](#source-kpx-v3), Definition 4.2.2, p.36; Corollary 4.4.11 and proof, p.46, classical comparison and its Pottharst reference.; [LLZ-2011](#source-llz-2011), §3A, p.1116, integral ψ-fixed identification and reference to Berger, Théorème A.3.

**Check.** No interchange of rationalization and infinite inverse limit is implicit. The absence of a degree-zero term in the ψ complex is a comparison theorem, not an argument that all inverse-limit corrections vanish.

<a id="phigammamodulesandiwasawacohomology-pg-5-iwasawa-functoriality"></a>

### 5.6. Iwasawa field maps, twists and coefficients

**Target:** `iwasawaPsiNaturality` (theorem); `PG.5/iwasawa-functoriality`.

The derived Iwasawa–ψ comparison commutes with maps of lattices, finite extension L/K and corestriction, finite-flat coefficient extension and Tate twisting. Γ acts continuously on both complexes and the Iwasawa algebra action extends the group action. The rational object is (Rlim_n RΓ(K_n,T))⊗^L_{O_E}E; it is compared with the rational ψ model through this order, without identifying it with an arbitrary inverse limit of rational cochains.

**Hypotheses.** T finite free O_E; finite-flat coefficient maps for underived tensor; compatible tower and closure choices.

**Inputs.** [PG.5/integral-iwasawa-comparison](#phigammamodulesandiwasawacohomology-pg-5-integral-iwasawa-comparison), [PG.2/realization-operations](#phigammamodulesandiwasawacohomology-pg-2-realization-operations), [PG.4/period-module-psi](#phigammamodulesandiwasawacohomology-pg-4-period-module-psi), `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `SelmerIwasawaCohomology:L3/rational-specialization`.

**Proof route.** 1. Check finite-level restriction, trace, coefficient and twist maps on the common period resolution. 2. Pass their coherent diagrams through derived inverse limit and then rationalization. 3. Prove continuity and the completed Λ action using the supplier’s topology; retain any required completion rather than using an algebraic group ring.

**Source locators.** [KPX-v3](#source-kpx-v3), Corollary 4.4.11, p.46, and Proposition 4.2.3, p.36.; [Pottharst-2013](#source-pottharst-2013), §1.6–§1.7, pp.1581–1583, coefficient and inverse-limit framework.

**Check.** Twisting affects Γ characters even in a basis where Frobenius on a Tate twist is unchanged.

<a id="phigammamodulesandiwasawacohomology-pg-5-finite-character-specialization"></a>

### 5.7. Derived finite-character specialization

**Target:** `iwasawaCharacterSpecialization` (theorem); `PG.5/finite-character-specialization`.

For a finite-order character η of a finite cyclotomic quotient and suitable finite coefficient extension E′, derived specialization of C_ψ(D) at η identifies with C_{ψ,γ}(D⊗η^{-1}) in degrees 0,1,2, with no additional shift, and hence with the corresponding twisted Galois cochains for étale D. The comparison preserves the finite-layer integration/corestriction normalization. Ordinary specialization of H^i requires vanishing of the adjoining Tor term; otherwise retain the derived base-change spectral sequence.

**Hypotheses.** Use the universal inverse Γ character in the cyclotomic deformation and specify the evaluation Λ→E′; for integral specialization include the coefficient extension and its flatness hypotheses.

**Inputs.** [PG.5/iwasawa-functoriality](#phigammamodulesandiwasawacohomology-pg-5-iwasawa-functoriality), [PG.7/cyclotomic-deformation](#phigammamodulesandiwasawacohomology-pg-7-cyclotomic-deformation), [PG.3/galois-herr-comparison](#phigammamodulesandiwasawacohomology-pg-3-galois-herr-comparison), `SelmerIwasawaCohomology:L3/iwasawa-descent`, `SelmerIwasawaCohomology:L3/rational-specialization`, `ArithmeticGaloisDuality:D7/derived-tensor-and-tor`.

**Proof route.** 1. Resolve character evaluation by the corresponding γ−η(γ) mapping fibre. 2. Compare the specialized cyclotomic-deformation Herr model to C_ψ(D⊗η^{-1}) using the signed φ/ψ map. 3. Check its compatibility with the finite-level Shapiro map and present the Tor spectral sequence.

**Source locators.** [KPX-v3](#source-kpx-v3), Proposition 4.2.3, p.36; Definition 4.4.7 and Theorem 4.4.8, p.45; Corollary 4.4.11, p.46.

**Check.** The inverse character is essential; do not replace η^{-1} by η or erase derived tensor. C_ψ starts in degree 1; derived coinvariants use a resolution in degrees −1,0 and give Herr degrees 0,1,2. Rationally select the appropriate finite-torsion character component before quotienting by the procyclic generator.

<a id="phigammamodulesandiwasawacohomology-pg-5-iwasawa-pairing"></a>

### 5.8. Iwasawa pairing and the Γ involution

**Target:** `iwasawaPairing` (construction); `PG.5/iwasawa-pairing`.

Construct the Iwasawa pairing for M and M∨(1) from the ψ-zero residue pairing and the map φ−1 on ψ-fixed vectors. It is sesquilinear for the involution ι(γ)=γ^{-1}. Specializing at a character compares it with the Herr Tate pairing with the generator/logarithm and residue-to-Galois constants of KPX Proposition 4.2.9; those constants are part of the comparison, not silently 1.

**Hypotheses.** Rational relative Robba modules; use the analytic group-ring and residue normalization of KPX §4.2. Finite-character specializations are derived when cohomology is not flat.

**Inputs.** [PG.3/herr-tate-duality](#phigammamodulesandiwasawacohomology-pg-3-herr-tate-duality), [PG.4/psi-one-to-zero](#phigammamodulesandiwasawacohomology-pg-4-psi-one-to-zero), [PG.3/analytic-kernel-inverse](#phigammamodulesandiwasawacohomology-pg-3-analytic-kernel-inverse), [PG.5/finite-character-specialization](#phigammamodulesandiwasawacohomology-pg-5-finite-character-specialization), `LocallyAnalyticDistributions:L3`, `LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism`, `LocallyAnalyticDistributions:L3/mellin-generator-change`.

**Proof route.** 1. Identify the analytic dual of the ψ-zero module with the ψ-zero dual twist using residue adjunction. 2. Show the pairing on (φ−1)x and (φ−1)y lies in the analytic group ring rather than only its localization. 3. Define the pairing and compare its finite-level evaluation with the normalized cup; track log χ(γ) and the source constant.

**Source locators.** [KPX-v3](#source-kpx-v3), Lemma 4.2.5, p.36; Corollary 4.2.6 and Lemma 4.2.7, p.37; Definition 4.2.8 and Proposition 4.2.9, p.38.

**Uses.** KPX Theorem 4.4.8: Provide derived Iwasawa duality. PadicHodgeRegulators: Fix specialization orientation before using an interpolation formula.

**API.**

- `iwasawaPairing.sesquilinear` (relation): Pair(ax,by)=aι(b)Pair(x,y).
- `iwasawaPairing.specialize` (compatibility): Evaluation gives the Tate pairing with exactly the factors of Proposition 4.2.9.
- `iwasawaPairing.functorial` (functoriality): Maps of modules and their duals are adjoint for the pairing.

**Acceptance examples.**

- `iw_pairing_involution`: Pair(γx,y)=γPair(x,y) while Pair(x,γy)=γ^{-1}Pair(x,y).
- `iw_pairing_zero`: A zero argument gives zero.
- `iw_pairing_generator`: Replacing the chosen generator changes the residue normalization by its logarithm ratio; the normalized Tate comparison stays invariant.

**Check.** Duality uses Γ inversion on the second coefficient action.

<a id="phigammamodulesandiwasawacohomology-pg-5-analytic-iwasawa"></a>

### 5.9. Analytic Iwasawa comparison and generation after Robba scalar extension

**Target:** `analyticIwasawaPsiComparison` (comparison); `PG.5/analytic-iwasawa`.

For a finite-dimensional E-representation V of G_K, analytic extension of classical rational Iwasawa cohomology identifies with H^i(C_ψ(D_rig(V))) as in KPX Theorem 4.4.11; rationalization is after the integral inverse limit. For the generation assertion of Proposition 4.3.8, take K=Q_p, A=E, M a Robba (φ,Γ)-module and M\*=M∨(1), and assume M/(ψ−1)=M\*/(ψ−1)=0. Then φ−1 is injective on M^{ψ=1}, the Iwasawa pairing is perfect, and, for an admissible r₀, C⊗\_{R_E^∞(Γ)}R_E^{r₀}(Γ)≅(M^{r₀})^{ψ=0}, where C=(φ−1)M^{ψ=1}. Here R_E^∞(Γ) is the distribution algebra and R_E^{r₀}(Γ) is the larger Robba-type Γ ring. No generation over distributions alone follows.

**Hypotheses.** E finite over Q_p; the first comparison allows finite K/Q_p. The generation clause is the stated K=Q_p field case and requires both ψ cokernels to vanish. Admissible radius, analytic group-ring topology and coadmissible scalar extension are supplied by LocallyAnalyticDistributions.

**Inputs.** [PG.5/integral-iwasawa-comparison](#phigammamodulesandiwasawacohomology-pg-5-integral-iwasawa-comparison), [PG.7/relative-perfectness](#phigammamodulesandiwasawacohomology-pg-7-relative-perfectness), [PG.7/cyclotomic-deformation](#phigammamodulesandiwasawacohomology-pg-7-cyclotomic-deformation), [PG.4/psi-one-to-zero](#phigammamodulesandiwasawacohomology-pg-4-psi-one-to-zero), `LocallyAnalyticDistributions:L3`.

**Proof route.** 1. Compare the classical tower through compact induction, Shapiro and the ψ-complex; rationalize after the inverse limit. 2. Apply the derived cyclotomic deformation comparison for the analytic extension. 3. Under both vanishing hypotheses use Iwasawa duality to prove perfectness; compare the two finite free modules of the same rank after extension to R_E^{r₀}(Γ), as in Proposition 4.3.8. 4. For a Dospinescu–Le Bras consumer retain the separate obligations to verify these hypotheses on tN_rig(V), extend the involution through (γ−1)^{-1}, and control its radius. The paper does not verify them.

**Source locators.** [KPX-v3](#source-kpx-v3), Corollary 4.4.11, p.46; Proposition 4.3.8(1)–(3) and proof, pp.41–42.; [DLB-2017](#source-dlb-2017), §8.1, Theorem 8.3 and proof of Proposition 8.4(a), pp.367–370; accepted route correction E24.

**Check.** Adopt the existing accepted PAPER-DOSPINESCU-LEBRAS-17/E24 correction. It changes the coefficient ring in the generation step and leaves the application hypotheses as a gap; this is not a new erratum claim.

<a id="phigammamodulesandiwasawacohomology-pg-5-analytic-bloch-kato-image"></a>

### 5.10. The exponential-image condition in analytic cohomology

**Target:** `analyticBlochKatoImage` (comparison); `PG.5/analytic-bloch-kato-image`.

In the Dospinescu–Le Bras setting, let π be a smooth supercuspidal representation of GL₂(Q_p) with trivial central character, Π an absolutely irreducible admissible unitary Banach completion with Π^sm=π, and V its two-dimensional potentially crystalline Galois representation of weights (0,1). The analytic cohomology submodule of classes whose integration to every cyclotomic level lies in H¹\_e=image(exp_BK) identifies with (1−φ)(tN_rig(V))^{ψ=1}. The map 1−φ is injective here. PG exports this cohomological comparison; the GL₂ representation and Drinfeld-cover identifications remain with their owning roadmaps.

**Hypotheses.** Finite coefficient field E as in the paper; det V=χ\_cyc and the specified supercuspidal/nontrianguline setting. Import N_dR(V)=N_rig(V), its weight-normalized t-lattice from R06.3 and the Bloch–Kato exponential from regulator L1. H¹\_e is not replaced by H¹\_f or H¹\_g; the exact lattice comparison remains an explicit gap.

**Inputs.** [PG.5/analytic-iwasawa](#phigammamodulesandiwasawacohomology-pg-5-analytic-iwasawa), `PadicHodgeRegulators:L1/bloch-kato-subgroups`, `PadicHodgeRegulators:L1/bloch-kato-exponential`, `LocallyAnalyticDistributions:L3`, `PadicHodgeTheory:R06.3/plan/de-rham-differential-equation`.

**Proof route.** 1. Use the source’s analytic Iwasawa identification and its exact tN_rig lattice. 2. Apply the cited Colmez finite-level exponential-image criterion; its original proof is a recorded gap. 3. Use absence of φ-fixed vectors in this nontrianguline situation to prove injectivity of 1−φ; compare the ψ-fixed and image models.

**Source locators.** [DLB-2017](#source-dlb-2017), Theorem 1.9, p.333; Theorem 8.3, pp.367–369; §12.1, p.398, with its Colmez reference [17], pp.20 and 174.

**Check.** No assertion for arbitrary two-dimensional de Rham V is exported from this special theorem.

**Stage acceptance.** Independent inverse-corestriction comparison and normalized analytic pairings. All comparisons must be the stated natural maps, with the sign, scalar, topology and coefficient hypotheses above.

**Remaining refinement.** Integral inverse-corestriction comparison and derived-limit hypotheses; analytic Γ-ring scalar extension and exceptional cokernel verification in the DLB application; original Colmez exponential-image criterion.


## PG.6. Wach modules and crystalline lattices

This stage is restricted to crystalline representations over finite unramified extensions of Q_p. Weight intervals, q-height, Tate twists and Frobenius localization are explicit. The filtered D_cris comparison is imported from PadicHodgeTheory:P7/plan/wach-dcris-comparison, and the PadicHodgeTheory package states Wach existence, height and reconstruction in its §4.4, so those nodes are kept here only until that roadmap's atlas packet carries them. Good bases are selected with a proof of their property; LLZ Remark 2.14 does not prove that every Wach basis is good. Coleman maps and interpolation remain regulator targets.

**Planets:** Wach modules, Crystalline Wach existence, Wach reconstruction, Good Wach basis.

<a id="phigammamodulesandiwasawacohomology-pg-6-wach-module"></a>

### 6.1. Wach modules with a weight interval

**Target:** `WachModule` (definition); `PG.6/wach-module`.

Let F/Q_p be finite unramified and q=φ(π)/π. For weights in [a,b], a Wach lattice N is finite free over A_F^+ (or the E-coefficient analogue), with continuous semilinear Γ\_F action trivial on N/πN, and a semilinear map φ:N[1/π]→N[1/φ(π)] commuting with Γ\_F such that φ(π^bN)⊂π^bN and the linearized quotient of π^bN by φ^\*(π^bN) is killed by q^{b−a}. For the rational version over B_F^+, where p is a unit, also require that B_F⊗\_{B_F^+}N is an étale (φ,Γ\_F)-module (Berger's 2026 erratum to Definition III.4.1; source issue E2); for an integral lattice over A_F^+ this holds because q is a unit in A_F. Require the prescribed embedding into the étale period module when N is attached to a representation. Use HT(Q_p(1))=+1 throughout.

**Hypotheses.** F is unramified; a≤b integers; rational N(V) uses B_F^+, integral N(T) uses A_F^+. Frobenius changes the localization from π to φ(π)=qπ; it is not generally an endomorphism of N[1/π], since q need not be a unit there.

**Inputs.** [PG.0/phi-module](#phigammamodulesandiwasawacohomology-pg-0-phi-module), [PG.0/coefficient-actions](#phigammamodulesandiwasawacohomology-pg-0-coefficient-actions), `PadicHodgeTheory:R06.2`.

**Proof route.** 1. Use finite free modules and commuting semilinear actions on the positive period ring. 2. Impose trivial residual Γ action and the q-power linearized height condition after the indicated weight shift. 3. Define morphisms by intertwining the actions; keep the embedding in D(T) as comparison data.

**Source locators.** [Berger-Wach-2004](#source-berger-wach-2004), Definition III.4.1, p.21; positive case Proposition II.1.1, p.11.; [Berger-errata](#source-berger-errata), §2, entry for Definition III.4.1, p.3.

**Uses.** Berger III.4: State the lattice and rational crystalline equivalences. PadicHodgeRegulators L4: Receive the exact weight and height convention before choosing a basis.

**API.**

- `WachModule.gamma_mod_pi` (characterisation): Every γ acts as identity on N/πN.
- `WachModule.height` (relation): q^{b−a} annihilates the stated linearized cokernel on π^bN.
- `WachModule.twist` (compatibility): N(T)=π^{-b}N(T(−b)) with the corresponding Tate basis, converting to weights [a−b,0].

**Acceptance examples.**

- `wach_trivial`: For T=Z_p, N=A_F^+e with φ(e)=e and Γ(e)=e has interval [0,0].
- `wach_negative_tate`: For T=Z_p(−r), r≥0, the basis n=π^r e has φ(n)=q^r n and γ(n)=(γ(π)/π)^rχ(γ)^{−r}n, trivial modulo π.
- `wach_height_not_etale`: For r>0 this linearization has cokernel killed by q^r and is not an isomorphism over A_F^+; the étale-module ψ argument cannot be applied to it as if height were zero.

**Check.** Do not strengthen the height condition to invertibility of φ^\*N→N; nonzero weights can have nonzero height. Record both localization rings in the Frobenius map; do not invert q without an explicit scalar extension. Without the étaleness of B_F⊗N the rational definition does not force N to come from a representation (source issue E2).

<a id="phigammamodulesandiwasawacohomology-pg-6-wach-existence"></a>

### 6.2. Crystalline Wach existence and uniqueness

**Target:** `wachModule_exists_unique` (theorem); `PG.6/wach-existence`.

For a crystalline Q_p-representation V of G_F, F/Q_p finite unramified, and a G_F-stable Z_p-lattice T, there is a unique Wach module N(T)⊂D(T) with the stated weight interval, spanning D(T) after the prescribed period extension. For positive V, with all weights ≤0, it lies in D^+(T) and contains π^rD^+(T) when weights lie in [−r,0]. Its rationalization is N(V), and arbitrary intervals are obtained by the fixed Tate twist.

**Hypotheses.** V crystalline, F unramified, T finite free; coefficient E variants use commuting finite coefficient action. No arbitrary ramified-field, merely de Rham, or pointwise crystalline family version is asserted.

**Inputs.** [PG.6/wach-module](#phigammamodulesandiwasawacohomology-pg-6-wach-module), [PG.1/fontaine-equivalence](#phigammamodulesandiwasawacohomology-pg-1-fontaine-equivalence), `PadicHodgeTheory:R06.2`.

**Proof route.** 1. Use finite-height crystalline descent to choose a positive lattice and kill the residual Γ action. 2. Prove saturation by the distinguished q_n factors; use the residual O_F-module and lifting to prove freeness, rather than treating A_F^+ as a PID. 3. Prove uniqueness by comparing the lowest π-power of two candidate lattices and the nontrivial χ-power on its quotient. 4. Intersect the rational Wach object with the étale lattice to recover N(T); twist for arbitrary [a,b].

**Source locators.** [Berger-Wach-2004](#source-berger-wach-2004), Proposition II.1.1 and Lemmas II.1.2–II.1.3, pp.11–13; Proposition II.1.4, p.13; Definition III.4.1, p.21.

**Check.** Finite height alone is not equated with crystallinity; the Γ-trivial residual condition and source hypotheses remain essential.

<a id="phigammamodulesandiwasawacohomology-pg-6-wach-height"></a>

### 6.3. Height and determinant bounds

**Target:** `wachModule_height` (theorem); `PG.6/wach-height`.

If the crystalline weights of V are −r₁,…,−r_d with 0≤r_i≤r, then q^r kills N(V)/φ^\*N(V). The elementary divisors have the source weight bounds and det(φ) is q^{Σr_i} times a unit. The integral comparison π^r(A^+⊗T)⊂A^+⊗N(T) gives the required bounded lattice control. General intervals use the fixed twist.

**Hypotheses.** The displayed positive-case quotient is formed by the image of the linearization; do not replace its q-adic elementary divisors by those of an arbitrary nonsaturated integral quotient.

**Inputs.** [PG.6/wach-existence](#phigammamodulesandiwasawacohomology-pg-6-wach-existence).

**Proof route.** 1. Use the cyclotomic-level comparison of Γ action on the localized period module to bound the elementary divisors. 2. Apply the determinant comparison and compare the positive period lattice with the representation lattice. 3. Transport the resulting inequalities under the explicit interval twist.

**Source locators.** [Berger-Wach-2004](#source-berger-wach-2004), Theorem III.3.1, pp.19–20; Definition III.4.1 and Remark III.4.3, p.21.

**Check.** Strong divisibility for all weight ranges is not a consequence of these bounds.

<a id="phigammamodulesandiwasawacohomology-pg-6-wach-dcris"></a>

### 6.4. Crystalline periods from Wach reduction

**Target:** `wachModule_dcris` (comparison); `PG.6/wach-dcris`.

The filtered comparison is imported: PadicHodgeTheory:P7/plan/wach-dcris-comparison states that for crystalline V over unramified F, with N(V) carrying Fil^iN(V)={x:φ(x)∈q^iN(V)} in the nonpositive-weight range, the map D_cris(V)→N(V)/πN(V) induced by D_cris(V)⊂B^+\_{rig,F}⊗N(V) is an isomorphism of filtered φ-modules, with the general interval obtained by the fixed twist. PG uses it for the good bases of PG.6 and the regulator interface.

**Hypotheses.** V crystalline over finite unramified F; weights and twist as in the PG conventions; rational Wach reduction only.

**Inputs.** `PadicHodgeTheory:P7/plan/wach-dcris-comparison`, [PG.6/wach-height](#phigammamodulesandiwasawacohomology-pg-6-wach-height), `PadicHodgeTheory:R06.2`.

**Proof route.** 1. Cite the owner theorem; the Wach module it uses is the one of PG.6/wach-existence, which the PadicHodgeTheory package states in its §4.4 (see the restructure entry).

**Source locators.** [Berger-Wach-2004](#source-berger-wach-2004), Proposition II.2.1, pp.13–14; Theorem III.4.4 and Corollary III.4.5, p.22.

**Check.** An arbitrary integral quotient is not asserted to be a strongly divisible lattice.

<a id="phigammamodulesandiwasawacohomology-pg-6-wach-reconstruction"></a>

### 6.5. Wach reconstruction and allowed operations

**Target:** `wachModule_reconstruction` (theorem); `PG.6/wach-reconstruction`.

Rational Wach modules are equivalent to crystalline representations over unramified F, compatibly with tensor products, duals and exact sequences. For each crystalline V, G_F-stable lattices in V correspond inclusion-preservingly to integral Wach lattices in N(V). Recover T from the étale φ-fixed construction after extending the Wach lattice to its étale period module. The integral correspondence is not asserted to preserve every short exact sequence or arbitrary quotient.

**Hypotheses.** Source weight-interval conditions and finite freeness; exactness is claimed for the rational equivalence.

**Inputs.** [PG.6/wach-dcris](#phigammamodulesandiwasawacohomology-pg-6-wach-dcris), [PG.1/fontaine-V](#phigammamodulesandiwasawacohomology-pg-1-fontaine-v).

**Proof route.** 1. Extend the Wach lattice to an étale module and recover the representation through the already constructed inverse functor. 2. Use Wach uniqueness to identify both comparison maps, and to compare tensor and dual lattices after rationalization. 3. Compare intersections with D(T) to prove the lattice inclusion correspondence; leave nonsaturated integral quotients outside the exactness claim.

**Source locators.** [Berger-Wach-2004](#source-berger-wach-2004), Proposition III.4.2 and Remark III.4.3, p.21; Corollary III.4.5, p.22.

**Check.** Berger Remark III.4.3 explicitly warns against the stronger integral conclusions.

<a id="phigammamodulesandiwasawacohomology-pg-6-wach-unramified-base-change"></a>

### 6.6. Unramified base and coefficient changes

**Target:** `wachModule_unramifiedBaseChange` (theorem); `PG.6/wach-unramified-base-change`.

For finite unramified F′/F, the Wach module of T|G_F′ is A_F′^+⊗\_{A_F^+}N_F(T), with the canonical descent comparison. Finite flat extension of integral coefficient rings commutes with Wach formation; rational coefficient change commutes with N(V), D_cris and their filtered comparison. These maps respect interval twists and compose along towers.

**Hypotheses.** Both local base fields unramified over Q_p; the integral coefficient map is finite flat; weights are those of a crystalline representation, not only pointwise family data.

**Inputs.** [PG.6/wach-existence](#phigammamodulesandiwasawacohomology-pg-6-wach-existence), [PG.6/wach-reconstruction](#phigammamodulesandiwasawacohomology-pg-6-wach-reconstruction), `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

**Proof route.** 1. Use the imported unramified ring extension and the Witt Frobenius on its coefficients. 2. Check freeness, Γ reduction and q-height after flat extension; uniqueness identifies the result with the new Wach module. 3. Prove the composition cocycle by the same uniqueness and compare the filtered period maps.

**Source locators.** [Berger-Wach-2004](#source-berger-wach-2004), Proposition II.1.1, pp.11–13; Proposition III.4.2, p.21; flat-base-change argument from uniqueness.

**Check.** An unramified base-change proof supplies no arbitrary ramified Wach construction.

<a id="phigammamodulesandiwasawacohomology-pg-6-wach-good-basis"></a>

### 6.7. Good Wach bases for the regulator interface

**Target:** `wachGoodBasis` (construction); `PG.6/wach-good-basis`.

For crystalline V over Q_p with coefficients E, choose the LLZ source-normalized Wach model. Given a basis ν\_i of D_cris(V), there exists a B^+\_{Q_p}⊗E-basis n_i of N(V) lifting ν\_i such that (1+π)φ(n_i) is a Λ\_E(Γ)-basis of (φ^\*N(V))^{ψ=0}; the analytic scalar extension is an H_E(Γ)-basis. Under the integral hypotheses of LLZ §3A there exists an integral good basis. Export the chosen basis and its linear coordinate isomorphism; Coleman maps and their images belong to the regulator roadmap.

**Hypotheses.** E/Q_p is finite and V is crystalline over Q_p; N(V) uses the Tate-twist normalization of LLZ §1C4. The rational basis statement is Theorem 2.12, independent of the noncritical refinement used for the preceding elementary-divisor theorem. For the integral §3A interface, all Hodge–Tate weights are nonnegative, V has no trivial quotient, and T is a G_Qp-stable O_E-lattice. Existence of an integral good basis does not prescribe its reduction or make every basis good.

**Inputs.** [PG.6/wach-dcris](#phigammamodulesandiwasawacohomology-pg-6-wach-dcris), [PG.4/period-psi](#phigammamodulesandiwasawacohomology-pg-4-period-psi), `LocallyAnalyticDistributions:L3`, `LocallyAnalyticDistributions:L3/mellin-frechet-isomorphism`, `LocallyAnalyticDistributions:L3/mellin-generator-change`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`, `PadicMeasuresIwasawaAlgebras:L1`.

**Proof route.** 1. The source recalls rational good-basis existence from LLZ 2010, Lemma 3.15, and integral existence from its Theorem 3.5. Their original proofs remain a recorded gap; do not present the 2011 recall as a proof. 2. Compare bounded and analytic bases by the closedness/density argument of Proposition 2.11. 3. Construct the coordinate isomorphism and state its transformation under two selected good bases using their actual Λ-linear coordinate change.

**Source locators.** [LLZ-2011](#source-llz-2011), Proposition 2.11, Theorem 2.12, Corollary 2.13 and Remark 2.14, pp.1114–1116; §3A, p.1116.

**Uses.** PadicHodgeRegulators L4: Supply the actual basis and coordinates used in regulator components. LLZ Theorem 2.12 and §3A: Keep rational prescribed reduction and integral existence distinct.

**API.**

- `wachGoodBasis.coordinateIso` (equivalence): The selected ψ-zero vectors give the Λ- or H-linear coordinate isomorphism.
- `wachGoodBasis.mod_pi` (characterisation): The rational chosen n_i reduce to the prescribed ν\_i.
- `wachGoodBasis.change` (compatibility): Two selected good bases are related by a unique invertible matrix over the appropriate group algebra, and their coordinate maps transform contragrediently.

**Acceptance examples.**

- `wach_basis_unit_line`: For the trivial Wach line n=1, (1+π)φ(n)=1+π gives the standard Mellin generator of the ψ-zero Frobenius pullback.
- `wach_basis_constant_change`: A constant invertible E-matrix between chosen rational bases induces the corresponding invertible group-algebra coordinate change.
- `wach_basis_no_universal_claim`: The constructor requires the good-basis proof; a bare arbitrary B^+\_{rig}-basis is not accepted as sufficient evidence.

**Check.** LLZ Remark 2.14 calls the arbitrary-basis assertion a conjecture; no such assertion is exported. The Wach φ matrix changes by B^{-1}Pφ(B) for column-coordinate convention; the induced analytic coordinate change must be proved, not obtained by replacing φ(B) with B.

<a id="phigammamodulesandiwasawacohomology-pg-6-wach-iwasawa"></a>

### 6.8. Wach ψ-fixed vectors and local Iwasawa classes

**Target:** `wachPsiOneIwasawa` (comparison); `PG.6/wach-iwasawa`.

For crystalline V over Q_p with nonnegative Hodge–Tate weights and no quotient isomorphic to the trivial representation, and a stable O_E-lattice T, the canonical map N(T)^{ψ=1}→H¹\_Iw(Q_p,T) is an isomorphism. Since N(T)⊂φ^\*N(T), the map 1−φ lands in (φ^\*N(T))^{ψ=0}, with good-basis coordinates as above. Its definition and normalization are exported, without planning the Coleman map or interpolation here.

**Hypotheses.** Exactly the hypotheses of LLZ §3A; general Wach weight intervals require the explicit twist and do not inherit this conclusion unchanged.

**Inputs.** [PG.6/wach-existence](#phigammamodulesandiwasawacohomology-pg-6-wach-existence), [PG.6/wach-good-basis](#phigammamodulesandiwasawacohomology-pg-6-wach-good-basis), [PG.5/integral-iwasawa-comparison](#phigammamodulesandiwasawacohomology-pg-5-integral-iwasawa-comparison), [PG.4/psi-one-to-zero](#phigammamodulesandiwasawacohomology-pg-4-psi-one-to-zero).

**Proof route.** 1. Use the integral étale ψ-fixed comparison and prove that its ψ-fixed vectors lie in the specified Wach lattice under the source hypotheses. 2. Check N(T)⊂φ^\*N(T) from the nonnegative-weight convention. 3. Apply the retained 1−φ identity in the ambient étale module, then identify its image in the Frobenius pullback lattice.

**Source locators.** [LLZ-2011](#source-llz-2011), §3A, p.1116; Lemma 1.7, p.1103; reference to Berger (2003), Théorème A.3.

**Check.** The cited Berger Théorème A.3 proof is an explicit source gap; the general tensor ψ construction alone does not prove this lattice equality.

**Stage acceptance.** Unramified crystalline Wach theory with the imported filtered D_cris comparison, unramified base change and selected good bases. All comparisons must be the stated natural maps, with the sign, scalar, topology and coefficient hypotheses above.

**Remaining refinement.** The filtered D_cris comparison is owned by PadicHodgeTheory:P7/plan/wach-dcris-comparison, and the PadicHodgeTheory package states Wach existence, height and reconstruction in its §4.4. Remaining here: exact N_rig/t-lattice normalization, Berger Théorème A.3 and the original LLZ 2010 good-basis proofs.


## PG.7. Relative cohomology and qualified families

Relative objects are finite projective. Perfectness of the ψ complex has amplitude [0,2], although its displayed terms are in degrees 1,2; H¹ need not be flat. All specialization comparisons are derived unless Tor vanishing is established. Character spaces and weight coordinates are supplied by L0a. Rank-one modules retain coefficient line bundles. Global triangulation requires specified ordered characters, a dense strict locus and a proper modification, with a closed bad locus and integral parameter shifts on exceptional fibres.

**Planets:** Relative Robba modules, Relative cohomology theorem, Character-type Robba modules, Saturated triangulations, Global triangulation theorem.

<a id="phigammamodulesandiwasawacohomology-pg-7-relative-category"></a>

### 7.1. Relative Robba modules and localized objects

**Target:** `RelativePhiGammaModule` (definition); `PG.7/relative-category`.

For a Q_p-affinoid algebra A and K/Q_p finite, use the imported relative annular Robba rings R_A(π\_K). A relative (φ,Γ\_K)-module is a finite projective module with invertible φ-linearization and continuous semilinear Γ\_K-action commuting with φ; use radius models and their canonical restrictions. Define M[1/t] by localization. Morphisms, tensor, dual and determinant use the existing module operations. For an Artinian coefficient algebra retain the stable-lattice condition used by BHS for the localized subcategory.

**Hypotheses.** Finite projectivity is the category hypothesis. General local freeness over R_A is KPX Conjecture 2.2.15, not a theorem used here. Relative analytic carriers and completed tensors are supplied by the annulus owner.

**Inputs.** [PG.0/phi-module](#phigammamodulesandiwasawacohomology-pg-0-phi-module), [PG.0/coefficient-actions](#phigammamodulesandiwasawacohomology-pg-0-coefficient-actions), [PG.2/radius-models](#phigammamodulesandiwasawacohomology-pg-2-radius-models), `PadicHodgeTheory:P7:annulus-foundations`.

**Proof route.** 1. Form the semilinear Frobenius category on the imported coefficient ring and impose finite projectivity and continuous Γ action. 2. Use finite projective summands and radius descent to construct scalar extension, tensor and dual. 3. Localize at the nonzerodivisor t with φ(t)=pt and γ(t)=χ(γ)t; specify the extra lattice condition for the BHS subcategory.

**Source locators.** [KPX-v3](#source-kpx-v3), Definitions 2.2.6 and 2.2.12, Proposition 2.2.14 and Conjecture 2.2.15, pp.17–20.; [BHS-2019](#source-bhs-2019), §3.3 and Remark 3.3.1, pp.342–343.; [Ding-2025](#source-ding-2025), §2.1, p.9.

**Uses.** KPX §4.4: Provide the category for perfectness and base change. BHS §3.3 and Ding §2.1: Provide the Artinian and localized module categories.

**API.**

- `RelativePhiGammaModule.baseChange` (functoriality): Continuous affinoid A→B induces R_B⊗\_{R_A}M with its commuting actions and compatible radius model.
- `RelativePhiGammaModule.tensor_dual` (structure): Tensor, dual and determinant remain finite projective with the induced actions.
- `RelativePhiGammaModule.localize` (compatibility): M→M[1/t] is equivariant and commutes with scalar extension; the BHS lattice condition is additional.

**Acceptance examples.**

- `relative_unit`: R_A with scalar φ,Γ actions is rank one.
- `relative_nonetale`: φ(e)=pe defines a relative rational rank-one object even though it has no slope-zero integral étale lattice.
- `relative_nilpotents`: A=E[ε]/ε² is allowed; reducing a deformation modulo ε does not identify it with the constant deformation.

**Check.** Pointwise étaleness does not supply a global integral lattice; all relative cochain statements are for finite projective objects.

<a id="phigammamodulesandiwasawacohomology-pg-7-relative-representation-realization"></a>

### 7.2. Relative Galois realization

**Target:** `relativeDrig` (construction); `PG.7/relative-representation-realization`.

Construct the canonical exact fully faithful functor from finite projective continuous A-representations of G_K to relative (φ,Γ\_K)-modules D_rig(V), compatible with arbitrary affinoid coefficient change, tensor products, duals and Tate twists. On field-valued points and fixed-field objects it agrees with PG.2. Do not equate its essential image with all objects that happen to be pointwise étale.

**Hypotheses.** A Q_p-affinoid; representations finite projective over A; continuity in the coefficient Banach topology. Use the corrected relative construction cited by KPX Theorem 2.2.17; its original proof is a named gap.

**Inputs.** [PG.7/relative-category](#phigammamodulesandiwasawacohomology-pg-7-relative-category), [PG.2/etale-tilde-equivalence](#phigammamodulesandiwasawacohomology-pg-2-etale-tilde-equivalence), `PadicHodgeTheory:P7:annulus-foundations`.

**Proof route.** 1. Use finite projective affinoid descent to construct compatible sufficiently small-radius modules with the required actions. 2. Compare their universal-period evaluations and glue them to the relative Robba object. 3. Use the source relative descent theorem to prove exactness and full faithfulness; check coefficient maps through its construction.

**Source locators.** [KPX-v3](#source-kpx-v3), Theorem 2.2.17, p.20, with the cited relative-realization construction.

**Uses.** PG.3 Galois comparison: Supply the exact relative object appearing in Pottharst’s theorem. PadicFamilies L4: Keep coefficient-base-change maps canonical.

**API.**

- `relativeDrig.baseChange` (compatibility): D_rig(V)⊗\_A B≅D_rig(V⊗\_A B) canonically.
- `relativeDrig.hom` (equivalence): G_K-equivariant A-linear maps correspond exactly to (φ,Γ)-maps.
- `relativeDrig.tensor` (compatibility): Realization commutes with tensor, dual and the fixed Tate basis convention.

**Acceptance examples.**

- `relativeDrig_trivial`: A with trivial G_K action realizes as the unit Robba module.
- `relativeDrig_tate`: A(1) has φ(e)=e and γ(e)=χ(γ)e in the representation basis.
- `relativeDrig_dual_numbers`: Realizing an E[ε]/ε² extension preserves its Herr extension class rather than retaining only the residual E-representation.

**Check.** A single uniform lattice over the whole base is not inferred from étale fibres.

<a id="phigammamodulesandiwasawacohomology-pg-7-psi-cokernel-finiteness"></a>

### 7.3. Finite ψ cokernel and t-divisibility devissage

**Target:** `psiCokernelFinite` (theorem); `PG.7/psi-cokernel-finiteness`.

For a relative Robba module M, coker(ψ−1) is finite over A and ψ−1 is surjective on t^{-n}M for all sufficiently large n. For M/tM, Herr cohomology is finite and supported in degrees 0 and 1, ψ−1 is surjective, and the ψ-fixed Γ complex admits the finite projective analytic group-ring resolution used by KPX.

**Hypotheses.** A Q_p-affinoid, M finite projective; all-annulus convergence and source normal-basis identifications are retained.

**Inputs.** [PG.7/relative-category](#phigammamodulesandiwasawacohomology-pg-7-relative-category), [PG.4/period-psi](#phigammamodulesandiwasawacohomology-pg-4-period-psi), `PadicHodgeTheory:P7:annulus-foundations`, `LocallyAnalyticDistributions:L3`.

**Proof route.** 1. Write M/tM as the product of cyclotomic evaluation modules; φ shifts levels and ψ is normalized trace. 2. Apply the normal-basis calculation with diagonal Γ action to identify the ψ-fixed resolution. 3. For the full module choose a finite projective cover and a bounded Laurent window; correct tails by a contracting operator. 4. Control convergence across all required annular norms, then use the bounded window to prove finite generation of the cokernel.

**Source locators.** [KPX-v3](#source-kpx-v3), Propositions 3.2.4–3.2.5, pp.29–31; Proposition 3.3.2 and its proof, pp.31–34.

**Check.** Convergence in only one Banach norm does not prove convergence in the Robba topology.

<a id="phigammamodulesandiwasawacohomology-pg-7-relative-perfectness"></a>

### 7.4. Relative finiteness and perfect complexes

**Target:** `relativeHerrIwasawaPerfect` (theorem); `PG.7/relative-perfectness`.

For rank-d relative M over A, C_{φ,γ}(M) is perfect of amplitude [0,2] over A, with finite cohomology, Euler characteristic −[K:Q_p]d and derived Tate duality. C_ψ(M), despite its displayed terms in degrees 1 and 2, is perfect of amplitude [0,2] over the analytic Iwasawa algebra R_A^∞(Γ\_K). Its cohomology vanishes outside 1,2; H¹ is finitely presented of generic rank [K:Q_p]d and H² is A-finite and torsion over the analytic group ring.

**Hypotheses.** A Q_p-affinoid; M finite projective with continuous (φ,Γ\_K) action; the analytic group ring and its coadmissible topology are fixed. The amplitude for C_ψ is not strengthened to [1,2]: H¹ need not be projective or flat.

**Inputs.** [PG.7/psi-cokernel-finiteness](#phigammamodulesandiwasawacohomology-pg-7-psi-cokernel-finiteness), [PG.3/analytic-kernel-inverse](#phigammamodulesandiwasawacohomology-pg-3-analytic-kernel-inverse), [PG.3/herr-tate-duality](#phigammamodulesandiwasawacohomology-pg-3-herr-tate-duality), `LocallyAnalyticDistributions:L3`.

**Proof route.** 1. Use the ψ-cokernel and t-divisibility devissage, together with the uniform finiteness construction of KPX §5, to prove derived finite presentation. 2. Pass from ψ to Herr through the signed mapping-fibre comparison. 3. Detect the perfect amplitude and duality fibrewise by finite field cohomology and the perfect-complex Nakayama criterion. 4. Compute ranks from Euler characteristic and isolate the analytic torsion support.

**Source locators.** [KPX-v3](#source-kpx-v3), Theorems 4.4.1–4.4.3, 4.4.5 and 4.4.6, pp.42–45; uniform proof in §5.2–§5.3, pp.48–55.

**Check.** The uniform §5 proof remains a specified refinement gap; pointwise finiteness alone is insufficient.

<a id="phigammamodulesandiwasawacohomology-pg-7-derived-base-change"></a>

### 7.5. Derived base change and Tor corrections

**Target:** `relativeCohomologyBaseChange` (theorem); `PG.7/derived-base-change`.

For every morphism A→B of Q_p-affinoid algebras, C_Herr(M)⊗^L_A B≅C_Herr(M_B), and the analogous analytic-Iwasawa scalar change holds for C_ψ. Their cohomology is related by Tor spectral sequences. Ordinary H^i⊗\_A B≅H^i(M_B) is asserted for flat B, or under the exact cohomological Tor-vanishing conditions, not for arbitrary specialization. The comparisons respect cup products, duality and field maps.

**Hypotheses.** M finite projective relative; use the relevant analytic group-algebra coefficient change in the ψ version.

**Inputs.** [PG.7/relative-perfectness](#phigammamodulesandiwasawacohomology-pg-7-relative-perfectness), [PG.7/relative-category](#phigammamodulesandiwasawacohomology-pg-7-relative-category), `ArithmeticGaloisDuality:D7/derived-tensor-and-tor`.

**Proof route.** 1. Construct the cochain scalar-change map on common annular models. 2. Use perfect finite presentation, the source coefficient-change theorem and fibrewise detection to prove it a quasi-isomorphism. 3. Apply the hyper-Tor spectral sequence; if only Tor₀ and Tor₁ contribute, display 0→H^i(C)⊗B→H^i(C⊗^L B)→Tor₁(H^{i+1}(C),B)→0.

**Source locators.** [KPX-v3](#source-kpx-v3), Theorem 4.4.3, pp.42–43, and proofs of Theorems 4.4.5–4.4.6, pp.43–45.

**Check.** Check: for A=E⟨X⟩, C=[A --X→A] in degrees 0,1 and B=A/(X), H⁰(C)=0 but H⁰(C⊗^L B)=B, contributed by Tor₁(A/(X),B).

<a id="phigammamodulesandiwasawacohomology-pg-7-cyclotomic-deformation"></a>

### 7.6. Universal inverse-character deformation

**Target:** `cyclotomicDeformation` (construction); `PG.7/cyclotomic-deformation`.

Form Dfm(M)=M⊗\_A R_A^∞(Γ\_K) with the original Γ action multiplied by the inverse universal group character on the new factor and Frobenius acting trivially on that factor. Its Herr complex is canonically quasi-isomorphic to C_ψ(M). The dual comparison is sesquilinear for ι:γ↦γ^{-1} and gives derived Iwasawa duality with shift [−2].

**Hypotheses.** M a relative Robba module; the completed/deformation scalar extension and analytic coefficient ring are those of KPX Definition 4.4.7. The specialized character η produces M⊗η^{-1}.

**Inputs.** [PG.7/relative-category](#phigammamodulesandiwasawacohomology-pg-7-relative-category), [PG.7/relative-perfectness](#phigammamodulesandiwasawacohomology-pg-7-relative-perfectness), [PG.3/analytic-kernel-inverse](#phigammamodulesandiwasawacohomology-pg-3-analytic-kernel-inverse), `LocallyAnalyticDistributions:L3`, `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof route.** 1. Use the diagonal completed tensor action and verify commutation with Frobenius. 2. Compare the procyclic mapping fibre with the ψ complex by the same signed comparison and the analytic Γ resolution. 3. Construct duality through the residue pairing and the Γ inversion on the deformation coefficient algebra.

**Source locators.** [KPX-v3](#source-kpx-v3), Definition 4.4.7 and Theorem 4.4.8, pp.45–46.

**Uses.** PG.5: Provide character specialization of Iwasawa classes. KPX Theorem 4.4.8: Supply the derived Iwasawa duality carrier.

**API.**

- `cyclotomicDeformation.action` (characterisation): γ(m⊗f)=γ\_M(m)⊗[γ]^{-1}f.
- `cyclotomicDeformation.specialize` (compatibility): Evaluation at η gives M⊗η^{-1}.
- `cyclotomicDeformation.cohomology` (equivalence): Its Herr complex identifies canonically with C_ψ(M), with the ι-twisted duality comparison.

**Acceptance examples.**

- `deformation_trivial_character`: At η=1 the specialized module is M.
- `deformation_inverse_character`: At η of order greater than two the extra action is η(γ)^{-1}; using η(γ) gives a distinguishable twist.
- `deformation_frobenius`: On the universal coefficient factor φ is identity; a Tate twist still follows the original representation-basis convention.

**Check.** The deformation character is inverse universal, not universal; the sign determines finite-character specialization.

<a id="phigammamodulesandiwasawacohomology-pg-7-rank-one-characters"></a>

### 7.7. Character-type modules and embedding parameters

**Target:** `rankOneCharacterModule` (construction); `PG.7/rank-one-characters`.

For a continuous δ:K^×→A^× construct R_{A,K}(δ) by the KPX local-reciprocity convention and finite unramified/Γ descent, functorial in A. Allow a coefficient line bundle as a separate tensor factor. For K=Q_p the standard basis has φ(e)=δ(p)e and γ(e)=δ(χ(γ))e. For E splitting K, the embedding characters x_σ and their canonical ideals (t_σ) satisfy ∏\_σ(t_σ)=(t), pairwise comaximal, and R_E(x_σ) identifies with (t_σ). The cyclotomic character corresponds to ε=N_{K/Q_p}|N_{K/Q_p}|.

**Hypotheses.** Continuous characters and affinoid A; finite field E containing all embeddings for the t_σ assertions. Local reciprocity is normalized as in KPX and Ding; no Lubin–Tate tower generalization of PG.5 is inferred.

**Inputs.** [PG.7/relative-category](#phigammamodulesandiwasawacohomology-pg-7-relative-category), `PadicHodgeTheory:P7:annulus-foundations`, `PadicMeasuresIwasawaAlgebras:L0a`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Proof route.** 1. Import ClassFieldTheory Layers 7–9, including geometricArtinMap and the topological localWeilArtinEquiv. Its primary Artin convention is arithmetic; use inversion to obtain the geometric convention here. Do not reconstruct local reciprocity. 2. Construct the unramified character module and the continuous Γ-character module and combine them by the source local-reciprocity decomposition. 3. Glue over affinoid coefficient charts and prove compatibility with rank-one coefficient line bundles. 4. Use the embedding period ideals to identify algebraic-character inclusions; define t_σ only up to unit and state canonical ideal comparisons.

**Source locators.** [KPX-v3](#source-kpx-v3), Construction 6.2.4, Examples 6.2.6 and Notation 6.2.7, pp.56–58.; [Ding-2025](#source-ding-2025), §2.1, p.9.; [BHS-2019](#source-bhs-2019), Definition 3.3.2, p.342; Lemma 3.3.4, p.343.

**Uses.** PG.1 rank-one dictionary: Compare unramified and cyclotomic Galois characters with explicit basis conventions. BHS, Ding and KPX §6.3: Supply trianguline parameters, localized characters and algebraic modifications.

**API.**

- `rankOneCharacterModule.tensor` (compatibility): R(δ₁)⊗R(δ₂)≅R(δ₁δ₂), and R(δ)∨≅R(δ^{-1}).
- `rankOneCharacterModule.coefficients` (functoriality): A→B transports the character and its rank-one module; coefficient lines remain explicit.
- `rankOneCharacterModule.algebraicIdeal` (characterisation): The x_σ module embeds as the ideal (t_σ); products of these ideals give algebraic modifications.

**Acceptance examples.**

- `character_tate`: For K=Q_p and δ=x|x|, φ(e)=e, γ(e)=χ(γ)e.
- `character_algebraic`: For K=Q_p and δ=x, φ(e)=pe and γ(e)=χ(γ)e; this differs from the étale Tate module.
- `character_unramified`: For δ trivial on Z_p^× with δ(p)=a, Γ fixes e while φ(e)=ae.

**Check.** For K=Q_p and δ=x|x|, δ(p)=1, recovering φ(e)=e for the Galois Tate basis.

<a id="phigammamodulesandiwasawacohomology-pg-7-character-cohomology"></a>

### 7.8. Rank-one exceptional cohomology

**Target:** `rankOneCharacterCohomology` (theorem); `PG.7/character-cohomology`.

For E/Q_p finite splitting K and continuous δ:K^×→E^×, H⁰(R_E(δ)) is one-dimensional exactly when δ=∏x_σ^{k_σ} with every k_σ≤0 and is zero otherwise. H² is one-dimensional exactly when δ=|N_{K/Q_p}|∏x_σ^{k_σ} with every k_σ≥1. H¹ has dimension [K:Q_p]+dim H⁰+dim H². Every nonzero (φ,Γ)-submodule of a field-coefficient character-type module is ∏t_σ^{m_σ}R_E(δ) with m_σ≥0.

**Hypotheses.** Use finite field coefficients and all embeddings; these dimensions are not claimed to remain constant under arbitrary affinoid specialization.

**Inputs.** [PG.7/rank-one-characters](#phigammamodulesandiwasawacohomology-pg-7-rank-one-characters), [PG.3/herr-tate-duality](#phigammamodulesandiwasawacohomology-pg-3-herr-tate-duality), `PadicHodgeTheory:R06.2`.

**Proof route.** 1. Compute H⁰ through the crystalline rank-one period dictionary and classify its algebraic parameter. 2. Apply Tate duality for H², then Euler characteristic for H¹. 3. Apply the H⁰ classification to a nonzero rank-one inclusion to identify its embedding-period ideal.

**Source locators.** [KPX-v3](#source-kpx-v3), Proposition 6.2.8 and Corollary 6.2.9, pp.58–59.

**Check.** For δ=1, dim H⁰=1 and dim H¹=[K:Q_p]+1; for δ=ε, dim H²=1. These are the exceptional fibres that prevent constant-rank assertions.

<a id="phigammamodulesandiwasawacohomology-pg-7-triangulation"></a>

### 7.9. Saturated triangulations and strict parameters

**Target:** `Triangulation` (definition); `PG.7/triangulation`.

A triangulation of a rank-d relative module M is an exhaustive increasing φ,Γ-stable filtration by finite projective submodules with finite projective successive quotients R_A(δ\_i)⊗\_A L_i, where each L_i is an invertible A-module. Saturation means the quotient remains finite projective in the source Robba category. Over a field it is strict with the ordered parameters when each successive rank-one embedding is unique up to scalar, expressed by the source H⁰-dimension-one conditions. A pointwise triangulation is additional data and need not extend over the base.

**Hypotheses.** Continuous parameters δ\_i and coefficient line bundles; full Robba modules, not only Galois realizations.

**Inputs.** [PG.7/rank-one-characters](#phigammamodulesandiwasawacohomology-pg-7-rank-one-characters), [PG.7/relative-category](#phigammamodulesandiwasawacohomology-pg-7-relative-category), [PG.7/rank-one-classification](#phigammamodulesandiwasawacohomology-pg-7-rank-one-classification).

**Proof route.** 1. Specify the stable filtration and graded identifications rather than merely a list of characters. 2. Use finite projective quotients for saturation; compare rank-one embeddings with their H⁰ spaces. 3. Define strictness inductively on the residual quotient and prove compatibility with flat scalar change.

**Source locators.** [KPX-v3](#source-kpx-v3), Definitions 6.3.1–6.3.2, pp.65–66.

**Uses.** KPX global triangulation: Specify exactly which flag persists after modification. PadicFamilies and trianguline geometry: Export parameters and coefficient line bundles without claiming constant de Rham rank.

**API.**

- `Triangulation.graded` (data): The i-th graded piece is R(δ\_i)⊗L_i with its equivariant isomorphism.
- `Triangulation.saturated` (characterisation): Each specified quotient is finite projective, so the rank-one flag is saturated.
- `Triangulation.strict` (characterisation): At each successive step, the relevant H⁰ space has dimension one and the chosen map has saturated image.

**Acceptance examples.**

- `triangulation_rank_one`: R_A(δ) has the length-one triangulation with coefficient line A.
- `triangulation_split`: R_A(δ₁)⊕R_A(δ₂) has the ordered direct-summand triangulation, but strictness requires the separate H⁰ condition.
- `triangulation_unsaturated`: The inclusion tR_E⊂R_E has a torsion quotient; it is an algebraic modification and not a saturated rank-one subquotient flag.

**Check.** An unsaturated coherent filtration with t-power torsion in its graded quotients is not a triangulation on every fibre.

<a id="phigammamodulesandiwasawacohomology-pg-7-global-triangulation"></a>

### 7.10. Global triangulation after a birational modification

**Target:** `globalTriangulationAfterModification` (theorem); `PG.7/global-triangulation`.

Let X be a reduced rigid E-analytic space whose connected components are irreducible, and M a rank-d family with continuous ordered parameters δ\_i. Suppose a Zariski-dense subset is pointwise strictly trianguline with those parameters in the source admissible-cover sense. After a proper birational f:X′→X there is a coherent equivariant filtration whose graded pieces embed in R_{X′}(δ\_i)⊗L_i with cokernel supported on a closed bad locus disjoint from that dense set and locally killed by a power of t. It is a saturated triangulation away from that locus; the first graded comparison is an isomorphism. If X is a smooth rigid analytic curve, take X′=X.

**Hypotheses.** The connected-component irreducibility assumption is that of the retrieved KPX-v3 Corollary 6.3.10; no version-of-record collation is claimed. There is an admissible affinoid cover of X on each member of which X_alg is Zariski dense; every z in X_alg has a strict saturated triangulation with the prescribed ordered δ\_{i,z}. The δ\_i:K^×→Γ(X,O_X)^× are continuous global characters. Pointwise triangulations with unspecified parameters do not suffice.

**Inputs.** [PG.7/triangulation](#phigammamodulesandiwasawacohomology-pg-7-triangulation), [PG.7/character-cohomology](#phigammamodulesandiwasawacohomology-pg-7-character-cohomology), [PG.7/derived-base-change](#phigammamodulesandiwasawacohomology-pg-7-derived-base-change).

**Proof route.** 1. Use cohomology base change and flattening of the rank-one Hom sheaf to construct a line-valued quotient after a proper modification. 2. Use saturation at dense points to identify a closed bad locus with locally t-power-torsion cokernel and a rank-(d−1) kernel. 3. Induct on the quotient/kernel family, keeping coefficient line bundles and coherent rather than automatically projective graded pieces on the bad locus. 4. Track the initial graded isomorphism and prove saturation on its open complement.

**Source locators.** [KPX-v3](#source-kpx-v3), Theorem 6.3.9, pp.68–70; Corollary 6.3.10 and proof, pp.71–72.; [Ding-2025](#source-ding-2025), §4.1, p.62; §4.2.2, Proposition 4.17 proof, pp.68–69, uses of global triangulation.

**Check.** A global coherent filtration is not asserted to be a saturated triangulation at all bad fibres. The source’s full flattening proof remains a refinement gap.

<a id="phigammamodulesandiwasawacohomology-pg-7-triangulation-specialization"></a>

### 7.11. Algebraic shifts at exceptional fibres

**Target:** `triangulationSpecialization` (theorem); `PG.7/triangulation-specialization`.

Under the global triangulation hypotheses, every closed-point fibre is trianguline, but its parameters at an exceptional point may be δ\_{i,z}∏\_σx_σ^{n_{i,z,σ}} with integral exponents. On the saturated good locus they are the stated δ\_{i,z}. This is the qualified specialization statement exported to family regulators and eigenvariety consumers.

**Hypotheses.** Use the proper birational source model and the t-power modifications in the preceding theorem; ordered parameters are retained where saturation holds.

**Inputs.** [PG.7/global-triangulation](#phigammamodulesandiwasawacohomology-pg-7-global-triangulation), [PG.7/character-cohomology](#phigammamodulesandiwasawacohomology-pg-7-character-cohomology).

**Proof route.** 1. Specialize the coherent filtration and remove the t-power torsion in each graded quotient. 2. Classify the resulting rank-one algebraic modifications using the embedding ideals (t_σ). 3. Identify the unchanged parameter on the good locus and retain the integer shifts at the exceptional points.

**Source locators.** [KPX-v3](#source-kpx-v3), Theorem 6.3.13, p.72.

**Check.** The theorem does not give a family of crystalline periods of constant rank or an integral Wach lattice on every fibre.

<a id="phigammamodulesandiwasawacohomology-pg-7-character-weights"></a>

### 7.12. Character weights and algebraicity

**Target:** `CharacterWeights` (definition); `PG.7/character-weights`.

Use the character-space weight coordinates supplied by L0a, with the following interpretation for the PG rank-one and Sen interfaces. For E splitting K and an Artinian local E-algebra A, differentiate a continuous character δ:K^×→A^× on a sufficiently small open subgroup of O_K^× and write d(log δ)=Σ\_σ wt_σ(δ)dσ. An algebraic character is ∏\_σ x_σ^{k_σ} with fixed integers k_σ; a constant character takes values in E^×; a smooth character has all weights zero; a locally algebraic character is a product of a smooth and an algebraic character. In this Artinian setting the weights must equal the specified integers in A itself, including its nilpotents.

**Hypotheses.** E/Q_p finite containing the embeddings of K; A Artinian local over E; continuous characters are locally Q_p-analytic after shrinking the unit subgroup.

**Inputs.** [PG.7/rank-one-characters](#phigammamodulesandiwasawacohomology-pg-7-rank-one-characters), `PadicMeasuresIwasawaAlgebras:L0a`.

**Proof route.** 1. Import the weight coordinates from L0a and identify their logarithmic derivative on a small unit subgroup with the embedding decomposition in this statement; do not construct a second weight space. 2. A zero derivative gives local constancy in characteristic zero; subtract a fixed algebraic character to characterize local algebraicity. 3. Compare the weights with the Sen action of the imported period functor; keep that functor outside PG.

**Source locators.** [BHS-2019](#source-bhs-2019), §3.3, character conventions, pp.342–343.; [KPX-v3](#source-kpx-v3), Definition 6.2.11 and Lemma 6.2.12, p.60.

**Uses.** BHS §3.3: Specify the Artinian character conventions without discarding infinitesimal weights. Relative rank-one classification: Compare parameter derivatives with the Sen weight.

**API.**

- `CharacterWeights.product` (relation): wt_σ(δδ′)=wt_σ(δ)+wt_σ(δ′).
- `CharacterWeights.algebraic` (characterisation): wt_σ(∏x_τ^{k_τ})=k_σ as an element of A.
- `CharacterWeights.locallyAlgebraic` (characterisation): Local algebraicity requires all weights to be constant integers in A, not just in its residue field.

**Acceptance examples.**

- `weight_algebraic`: For K=Q_p and δ=x^k, the weight is k.
- `weight_smooth`: A finite-order character has weight zero and is smooth.
- `weight_dual_numbers`: On a small unit subgroup δ(u)=1+ε log(u) over E[ε]/ε² has weight ε. Its residue is trivial, but δ is not locally algebraic.

**Check.** The localized-character rigidity theorem and almost de Rham deformation arguments belong to TriangulineVarietyAndItsLocalModel; PG exports the character and weight vocabulary used there. The character and weight spaces belong to L0a. This target pins their Artinian interpretation and the PG/Sen compatibility, including nilpotents.

<a id="phigammamodulesandiwasawacohomology-pg-7-rank-one-classification"></a>

### 7.13. Rank-one classification with coefficient lines

**Target:** `rankOneModuleClassification` (theorem); `PG.7/rank-one-classification`.

For a rigid E-analytic space X and a rank-one (φ,Γ\_K)-module M over R_X, there is a unique continuous δ:K^×→Γ(X,O_X)^× and a line bundle L, unique up to isomorphism, such that M≅R_X(δ)⊗L. Canonically L=H⁰\_Herr(M(δ^{-1})); the evaluation map is the stated isomorphism. For Artinian local coefficients L is free of rank one. Over a coefficient field this says that every rank-one module is of character type. Over a coefficient field E, R_E(δ) is de Rham exactly when δ is locally algebraic; this uses the imported period-functor definition, not a definition of de Rham by character weights.

**Hypotheses.** K/Q_p finite; E splits K as in KPX §6; X is a rigid E-analytic space. No reducedness is imposed for this theorem.

**Inputs.** [PG.7/rank-one-characters](#phigammamodulesandiwasawacohomology-pg-7-rank-one-characters), [PG.7/character-weights](#phigammamodulesandiwasawacohomology-pg-7-character-weights), [PG.7/derived-base-change](#phigammamodulesandiwasawacohomology-pg-7-derived-base-change), [PG.3/galois-herr-comparison](#phigammamodulesandiwasawacohomology-pg-3-galois-herr-comparison), `PadicMeasuresIwasawaAlgebras:L0a`, `PadicHodgeTheory:P7/coefficient-b-pairs`, `PadicHodgeTheory:R06.2/plan/period-functors`, `PadicHodgeTheory:R06.2/rank-one-de-rham-crystalline-classification`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Proof route.** 1. Over a field shift the pure slope to zero, apply rank-one local class field theory through the étale equivalence, and descend a finite coefficient extension. 2. Induct on the Artinian length; use the Herr/Galois comparison to match first-order character lifts and rank-one extensions. 3. For X construct the parameter graph by the two dual H²-support conditions. Derived base change identifies its Artinian fibres. 4. Bound the unramified coordinate using ψ-cokernel finiteness; control the weight coordinate by a tensor power and a character twist. This proves quasicompactness, which is essential beyond bijectivity on rigid points. 5. Recover the line by H⁰ and the canonical evaluation map. 6. Import the field-valued Galois-character criterion from R06.2/rank-one-de-rham-crystalline-classification. Transport it through P7’s B-pair bridge, and extend to arbitrary rank-one Robba parameters by separating the unramified slope factor, whose de Rham weights are zero. The Artinian deformation rigidity theorem is owned by TriangulineVarietyAndItsLocalModel.

**Source locators.** [KPX-v3](#source-kpx-v3), Lemma 6.2.13 and Theorem 6.2.14, pp.61–62; Definition 6.2.15, Lemmas 6.2.16–6.2.20 and proof, pp.62–64; Example 6.2.21, p.65.; [Ding-2025](#source-ding-2025), §2.1, p.9, rank-one character classification and the locally algebraic de Rham criterion.

**Check.** A bijective open immersion on rigid points need not be an isomorphism: the quasicompactness step in KPX Example 6.2.21 is essential.

**Stage acceptance.** Perfectness and derived base change, rank-one classification and qualified global triangulation. All comparisons must be the stated natural maps, with the sign, scalar, topology and coefficient hypotheses above.

**Remaining refinement.** Original relative representation realization; uniform finiteness in KPX §5 and full flattening argument; affine character-space and line-bundle descent for rank-one classification.


## Pinned library inputs

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration statement below was read at its pin. The reviewed audit plus targeted searches support the absence claims; this is not a new exhaustive audit.

| Existing declaration | Input reused |
| --- | --- |
| `mathlib:TensorProduct.lift` | Existing balanced tensor-product universal construction as a linear map; use the specified scalar actions, not a second tensor carrier. |
| `mathlib:TensorProduct.ext'` | Equality of tensor-product maps from equality on pure tensors. |
| `mathlib:ModuleCat.ofHom` | Wrap an actual linear map as a native module-category morphism. Categorical f followed by g represents g composed with f. |
| `mathlib:CochainComplex.of` | Construct a native cochain complex from terms, successive differentials and their zero-composition proof. |
| `mathlib:CochainComplex.ofHom` | Construct a native cochain map from degree maps and commuting squares. |
| `mathlib:Homotopy` | Native chain homotopy with degree-minus-one components and the equation f=dH+Hd+g. |
| `mathlib:HomotopyEquiv.toHomologyIso` | Canonical homology isomorphism induced by a constructed homotopy equivalence. |
| `mathlib:CategoryTheory.ShortComplex.moduleCatHomologyIso` | Native homology as the actual outgoing-map kernel modulo the incoming-map image, with quotient/cycle maps. |
| `mathlib:CategoryTheory.ShortComplex.moduleCatCyclesIso` | Native cycles as the linear-map kernel; the inclusion comparison fixes the map, not just its isomorphism class. |
| `mathlib:cyclotomicCharacter` | Underlying automorphism-to-Z_p-unit monoid homomorphism, source line 307; it does not alone prove local topological continuity. |
| `tauceti:TauCeti.ContCohomology.explicitCup11` | H¹×H¹→H² for continuous topological coefficients and a continuous additive equivariant coefficient pairing; source line 577. Reuse the existing continuous cup. |
| `tauceti:TauCeti.ContCohomology.explicitCor1` | Degree-one corestriction from an open finite-index subgroup with continuous topological coefficients; source line 457. It is an input, not the full derived Herr comparison. |

The tensor, module-category, complex, homotopy and homology interfaces are native Mathlib objects. A displayed three-term algebraic complex is not a definition of continuous Galois cohomology. The existing continuous topological cup and degree-one corestriction maps are inputs to compatibility comparisons.

## Precise gaps and supplier contracts

Every gap is attached to its consuming targets. These refinements keep stages open after this target-level pass.

### G1. Integral overconvergent lattices

Fontaine's equivalence and rational overconvergence are now owned by PadicHodgeTheory:P7/etale-realization-and-overconvergence. What PG adds is the integral clause D^†(T)=(A^†⊗T)^{H_K} with A_K⊗D^†(T)=D(T): its proof needs the trace estimates of Cherbonnier–Colmez §III.2, which were located but not read, and the integral descent of their §III.4–III.5; the matrix-correction and final rational arguments were read.

Needed by [PG.2/cherbonnier-colmez](#phigammamodulesandiwasawacohomology-pg-2-cherbonnier-colmez).

### G2. Small unipotent group construction

Construct the BCH small-lattice group, its Greenberg realization and convergent exp/log comparison with the exact n bound. ASW descent alone does not construct this group.

Needed by [PG.1/unipotent-lang](#phigammamodulesandiwasawacohomology-pg-1-unipotent-lang).

### G3. All-module and sheaf descent

Decompose the original all-module Tate–Sen decompletion estimates and prove the new period-sheaf/equivariant-bundle comparison triangles. Classical B-pair functors are imported from P7.

Needed by [PG.2/all-module-decompletion](#phigammamodulesandiwasawacohomology-pg-2-all-module-decompletion), [PG.2/period-sheaf-equivalences](#phigammamodulesandiwasawacohomology-pg-2-period-sheaf-equivalences), [PG.3/period-sheaf-cohomology](#phigammamodulesandiwasawacohomology-pg-3-period-sheaf-cohomology).

### G4. Arithmetic coordinate topology

Prove the actual coordinate projections continuous on each weak, integral and annular model and compatible with finite étale base extension. Conditional tensor-linearization algebra does not give these estimates.

Needed by [PG.0/coefficient-actions](#phigammamodulesandiwasawacohomology-pg-0-coefficient-actions), [PG.4/period-psi](#phigammamodulesandiwasawacohomology-pg-4-period-psi), [PG.4/period-module-psi](#phigammamodulesandiwasawacohomology-pg-4-period-module-psi).

### G5. Universal period acyclicity and integral Herr theorem

Pottharst Theorem 2.8 and Lemma 2.9 were read. The original H_K-acyclicity theorem and its topological hypotheses still require source proof decomposition; integral and finite-torsion comparisons need a separate exact-sequence argument.

Needed by [PG.3/galois-herr-comparison](#phigammamodulesandiwasawacohomology-pg-3-galois-herr-comparison).

### G6. Integral dyadic derived descent

Construct the finite C_2-resolution over the torsion-free cyclotomic subfield, with compatible corestriction and the open-subgroup continuous Hochschild–Serre comparison. No averaging by 2.

Needed by [PG.3/integral-two-descent](#phigammamodulesandiwasawacohomology-pg-3-integral-two-descent), [PG.5/integral-iwasawa-comparison](#phigammamodulesandiwasawacohomology-pg-5-integral-iwasawa-comparison).

### G7. Tate residue constant

Finiteness, Euler characteristic and duality for field coefficients are owned by PadicHodgeTheory:P7/herr-complex-interface (after Liu). What remains for PG is the constant C_p with Res^γ=C_p·Ta for K=Q_p: KPX Remark 2.3.12 reports only a claimed value. Establish it, or carry C_p through PG.3/herr-tate-duality and the Iwasawa pairing of PG.5.

Needed by [PG.3/herr-tate-duality](#phigammamodulesandiwasawacohomology-pg-3-herr-tate-duality), [PG.5/iwasawa-pairing](#phigammamodulesandiwasawacohomology-pg-5-iwasawa-pairing).

### G8. Integral derived Iwasawa comparison

Cherbonnier–Colmez 1999, Théorème II.1.3 (after Fontaine) gives the degree-one isomorphism D(T)^{ψ=1}≅H¹\_Iw(K,T); its proof was not read here. Construct the cochain map from the independent derived corestriction system, justify the cofinal tower and Mittag-Leffler hypotheses, and identify the degree-two term and the shifted ψ fibre. The LLZ citation of Berger, Théorème A.3, is a recall, not an original-proof reading.

Needed by [PG.5/integral-iwasawa-comparison](#phigammamodulesandiwasawacohomology-pg-5-integral-iwasawa-comparison), [PG.5/iwasawa-functoriality](#phigammamodulesandiwasawacohomology-pg-5-iwasawa-functoriality).

### G9. DLB analytic application inputs

For tN_rig(V), verify both ψ-cokernel vanishings before applying KPX Proposition 4.3.8, with Robba-type Γ scalar extension. Any GL₂ involution consumer must prove inverse-(γ−1) semilinearity and radius control. The original Colmez exponential-image proof and exact R06.3 t-lattice comparison remain unread/unproved inputs.

Needed by [PG.5/analytic-iwasawa](#phigammamodulesandiwasawacohomology-pg-5-analytic-iwasawa), [PG.5/analytic-bloch-kato-image](#phigammamodulesandiwasawacohomology-pg-5-analytic-bloch-kato-image).

### G10. Wach integral ψ and good bases

Read and decompose the original Berger Théorème A.3 used by LLZ §3A and LLZ 2010 Lemma 3.15/Theorem 3.5 for rational/integral good bases. The 2011 statements and analytic-extension proof are read, but the original existence proofs are not. Keep the integral lattice and no-trivial-quotient assumptions; no arbitrary-basis assertion follows.

Needed by [PG.6/wach-good-basis](#phigammamodulesandiwasawacohomology-pg-6-wach-good-basis), [PG.6/wach-iwasawa](#phigammamodulesandiwasawacohomology-pg-6-wach-iwasawa).

### G11. Relative realization and uniform finiteness

The original relative representation realization cited by KPX Theorem 2.2.17 and the uniform proof in §5.2–§5.3 remain unread. They must supply effectivity and uniform finite presentation, not only fieldwise finiteness.

Needed by [PG.7/relative-representation-realization](#phigammamodulesandiwasawacohomology-pg-7-relative-representation-realization), [PG.7/relative-perfectness](#phigammamodulesandiwasawacohomology-pg-7-relative-perfectness).

### G12. Global flattening and rank-one descent

Complete the full flattening proof of KPX Theorem 6.3.9 and verify the generic-rank/Fitting-ideal constructions. The rank-one classification needs the imported character space, cohomological support graph and quasicompactness; their target proof route has been read, not formalised.

Needed by [PG.7/rank-one-classification](#phigammamodulesandiwasawacohomology-pg-7-rank-one-classification), [PG.7/global-triangulation](#phigammamodulesandiwasawacohomology-pg-7-global-triangulation), [PG.7/triangulation-specialization](#phigammamodulesandiwasawacohomology-pg-7-triangulation-specialization).

### Supplier requests

Exact foreign nodes are imported in the target lists. The following stage contracts state the additional input not supplied by a matching fine node. They are requests rather than new definitions in this roadmap.

- **`ArithmeticGaloisDuality:D7`.** Extend the independently defined continuous-cochain and duality framework to the exact affinoid Banach/period coefficient cases used by the Pottharst comparison, and provide period-sheaf totalizations. The existing finite-type adic/cofinite contracts alone do not imply this extension. Consumers: [PG.3/galois-herr-comparison](#phigammamodulesandiwasawacohomology-pg-3-galois-herr-comparison), [PG.3/herr-field-maps](#phigammamodulesandiwasawacohomology-pg-3-herr-field-maps), [PG.3/period-sheaf-cohomology](#phigammamodulesandiwasawacohomology-pg-3-period-sheaf-cohomology).
- **`LocallyAnalyticDistributions:L3`.** Relative analytic Γ rings R_A^∞(Γ\_K), larger Robba-type R_A^{r₀}(Γ\_K), restriction and completed scalar-change maps, coadmissible/Fréchet–Stein and tensor exactness needed in KPX. Existing classical Mellin and generator-change nodes are imported separately; they do not alone provide these relative rings. Also the rigid character space of O_K^× and of Γ\_K with its universal character, used for the parameter graph of PG.7/rank-one-classification. Consumers: [PG.3/analytic-kernel-inverse](#phigammamodulesandiwasawacohomology-pg-3-analytic-kernel-inverse), [PG.4/period-module-psi](#phigammamodulesandiwasawacohomology-pg-4-period-module-psi), [PG.5/iwasawa-pairing](#phigammamodulesandiwasawacohomology-pg-5-iwasawa-pairing), [PG.5/analytic-iwasawa](#phigammamodulesandiwasawacohomology-pg-5-analytic-iwasawa), [PG.5/analytic-bloch-kato-image](#phigammamodulesandiwasawacohomology-pg-5-analytic-bloch-kato-image), [PG.6/wach-good-basis](#phigammamodulesandiwasawacohomology-pg-6-wach-good-basis), [PG.7/psi-cokernel-finiteness](#phigammamodulesandiwasawacohomology-pg-7-psi-cokernel-finiteness), [PG.7/relative-perfectness](#phigammamodulesandiwasawacohomology-pg-7-relative-perfectness), [PG.7/cyclotomic-deformation](#phigammamodulesandiwasawacohomology-pg-7-cyclotomic-deformation).
- **`PadicHodgeTheory:P7:annulus-foundations`.** Early analytic annuli, Gauss/Fréchet/LF topologies, finite-projective gluing and completed coefficient tensors, independent of PG representation/cohomology outputs. Fine scalar Robba nodes cover only the classical part; the affinoid and norm estimates remain this stage contract. Consumers: [PG.0/coefficient-actions](#phigammamodulesandiwasawacohomology-pg-0-coefficient-actions), [PG.1/pure-equivalence](#phigammamodulesandiwasawacohomology-pg-1-pure-equivalence), [PG.2/radius-models](#phigammamodulesandiwasawacohomology-pg-2-radius-models), [PG.3/analytic-kernel-inverse](#phigammamodulesandiwasawacohomology-pg-3-analytic-kernel-inverse), [PG.4/period-psi](#phigammamodulesandiwasawacohomology-pg-4-period-psi), [PG.7/relative-category](#phigammamodulesandiwasawacohomology-pg-7-relative-category), [PG.7/relative-representation-realization](#phigammamodulesandiwasawacohomology-pg-7-relative-representation-realization), [PG.7/psi-cokernel-finiteness](#phigammamodulesandiwasawacohomology-pg-7-psi-cokernel-finiteness), [PG.7/rank-one-characters](#phigammamodulesandiwasawacohomology-pg-7-rank-one-characters).
- **`PadicHodgeTheory:P8`.** The exact Witt, integral/bounded/extended Robba and pro-étale period sheaf carriers, their pullback and descent maps used in KL §8.5 and §9.5. Use existing carrier nodes where applicable; the required all-component and integral gluing API must be supplied by this stage. Consumers: [PG.2/period-sheaf-equivalences](#phigammamodulesandiwasawacohomology-pg-2-period-sheaf-equivalences), [PG.3/period-sheaf-cohomology](#phigammamodulesandiwasawacohomology-pg-3-period-sheaf-cohomology).
- **`PadicHodgeTheory:R06.2`.** De Rham/crystalline representations and their period-functor definitions, D_cris, filtered Frobenius and Tate weight normalization, and crystalline comparison after finite coefficients. PG owns the specialized character, Wach and (φ,Γ) comparison targets. Consumers: [PG.6/wach-module](#phigammamodulesandiwasawacohomology-pg-6-wach-module), [PG.6/wach-existence](#phigammamodulesandiwasawacohomology-pg-6-wach-existence), [PG.6/wach-dcris](#phigammamodulesandiwasawacohomology-pg-6-wach-dcris), [PG.7/character-cohomology](#phigammamodulesandiwasawacohomology-pg-7-character-cohomology).
- **`PadicMeasuresIwasawaAlgebras:L0a`.** Rigid character and weight spaces with their universal character, coordinates and Artinian pullback. For Z_p^× this is upstream PadicMeasuresIwasawaAlgebras §3a.1 (on TauCetiRoadmap main), built on PadicFunctionalAnalysis §§5.1–5.3. PG.7 also needs the character space of K^×, the product of the character space of O_K^× and the multiplicative group; the space of a compact abelian p-adic Lie group such as O_K^× or Γ\_K is constructed in LocallyAnalyticDistributions Layer 3. PG constructs modules from these characters, not a second character space. Consumers: [PG.7/cyclotomic-deformation](#phigammamodulesandiwasawacohomology-pg-7-cyclotomic-deformation), [PG.7/rank-one-characters](#phigammamodulesandiwasawacohomology-pg-7-rank-one-characters), [PG.7/character-weights](#phigammamodulesandiwasawacohomology-pg-7-character-weights), [PG.7/rank-one-classification](#phigammamodulesandiwasawacohomology-pg-7-rank-one-classification).
- **`PadicMeasuresIwasawaAlgebras:L1`.** Completed group algebra Λ\_{O_E}(Γ\_K), its continuous-action universal property, finite-quotient maps, Γ inversion and completed generator quotient (γ^u−1)/(γ−1) with augmentation u a unit. Existing Z_p-unit measure coordinates cover a special case, not this whole contract. Consumers: [PG.3/arithmetic-herr](#phigammamodulesandiwasawacohomology-pg-3-arithmetic-herr), [PG.4/period-module-psi](#phigammamodulesandiwasawacohomology-pg-4-period-module-psi), [PG.5/integral-iwasawa-comparison](#phigammamodulesandiwasawacohomology-pg-5-integral-iwasawa-comparison), [PG.6/wach-good-basis](#phigammamodulesandiwasawacohomology-pg-6-wach-good-basis).
- **`tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`.** Import the existing adic Fargues–Fontaine curve and vector-bundle/GAGA constructions from current AdicSpaces Layer 6; PG proves only specialized equivariant period comparisons. Consumers: [PG.2/period-sheaf-equivalences](#phigammamodulesandiwasawacohomology-pg-2-period-sheaf-equivalences).
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.** Import ClassFieldTheory Layers 7–9: continuous local Artin map, geometricArtinMap by inversion, and localWeilArtinEquiv onto the topological Weil abelianization for finite K/Q_p. PG constructs character-type period modules and proves its normalization comparison; it does not construct reciprocity. Consumers: [PG.7/rank-one-characters](#phigammamodulesandiwasawacohomology-pg-7-rank-one-characters), [PG.7/rank-one-classification](#phigammamodulesandiwasawacohomology-pg-7-rank-one-classification).
- **`tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.** Import the existing unramified extension and Frobenius maps from LocalFieldsRamification Layer 2; PG proves their compatibility with Wach uniqueness. Consumers: [PG.6/wach-unramified-base-change](#phigammamodulesandiwasawacohomology-pg-6-wach-unramified-base-change).

## Routed-source coverage

The accepted paper routes assign 34 items to this roadmap. This table locates their target statements; source results assigned to other owners are imported or left with those owners. In particular, BHS localized-character deformation rigidity and Ding eigenvariety geometry are not recreated here.

| Accepted route item | Realising targets |
| --- | --- |
| `PAPER-KEDLAYA-LIU-15/30` | [PG.0/phi-module](#phigammamodulesandiwasawacohomology-pg-0-phi-module), [PG.0/phi-cohomology](#phigammamodulesandiwasawacohomology-pg-0-phi-cohomology) |
| `PAPER-KEDLAYA-LIU-15/31` | [PG.0/free-cover](#phigammamodulesandiwasawacohomology-pg-0-free-cover) |
| `PAPER-KEDLAYA-LIU-15/113` | [PG.1/frobenius-idempotents](#phigammamodulesandiwasawacohomology-pg-1-frobenius-idempotents) |
| `PAPER-KEDLAYA-LIU-15/124` | [PG.1/asw-fixed-basis](#phigammamodulesandiwasawacohomology-pg-1-asw-fixed-basis) |
| `PAPER-KEDLAYA-LIU-15/125` | [PG.1/asw-equivalence](#phigammamodulesandiwasawacohomology-pg-1-asw-equivalence) |
| `PAPER-KEDLAYA-LIU-15/126` | [PG.1/unipotent-lang](#phigammamodulesandiwasawacohomology-pg-1-unipotent-lang) |
| `PAPER-KEDLAYA-LIU-15/128` | [PG.1/asw-projectivity](#phigammamodulesandiwasawacohomology-pg-1-asw-projectivity) |
| `PAPER-KEDLAYA-LIU-15/129` | [PG.1/asw-projectivity](#phigammamodulesandiwasawacohomology-pg-1-asw-projectivity) |
| `PAPER-KEDLAYA-LIU-15/283` | [PG.1/perfectoid-integral-local-systems](#phigammamodulesandiwasawacohomology-pg-1-perfectoid-integral-local-systems). The PG target imports the owner statement from PadicHodgeTheory:P8/relative-local-systems-and-frobenius-modules (moved down under the tier order); it states only what PG adds. |
| `PAPER-KEDLAYA-LIU-15/284` | [PG.1/perfectoid-integral-local-systems](#phigammamodulesandiwasawacohomology-pg-1-perfectoid-integral-local-systems). The PG target imports the owner statement from PadicHodgeTheory:P8/relative-local-systems-and-frobenius-modules (moved down under the tier order); it states only what PG adds. |
| `PAPER-KEDLAYA-LIU-15/285` | [PG.1/perfectoid-integral-local-systems](#phigammamodulesandiwasawacohomology-pg-1-perfectoid-integral-local-systems). The PG target imports the owner statement from PadicHodgeTheory:P8/relative-local-systems-and-frobenius-modules (moved down under the tier order); it states only what PG adds. |
| `PAPER-KEDLAYA-LIU-15/286` | [PG.1/pure-equivalence](#phigammamodulesandiwasawacohomology-pg-1-pure-equivalence). The PG target imports the owner statement from PadicHodgeTheory:P8/relative-local-systems-and-frobenius-modules (moved down under the tier order); it states only what PG adds. |
| `PAPER-KEDLAYA-LIU-15/287` | [PG.1/pure-local-systems](#phigammamodulesandiwasawacohomology-pg-1-pure-local-systems) |
| `PAPER-KEDLAYA-LIU-15/288` | [PG.1/pure-equivalence](#phigammamodulesandiwasawacohomology-pg-1-pure-equivalence). The PG target imports the owner statement from PadicHodgeTheory:P8/relative-local-systems-and-frobenius-modules (moved down under the tier order); it states only what PG adds. |
| `PAPER-KEDLAYA-LIU-15/289` | [PG.1/pure-equivalence](#phigammamodulesandiwasawacohomology-pg-1-pure-equivalence). The PG target imports the owner statement from PadicHodgeTheory:P8/relative-local-systems-and-frobenius-modules (moved down under the tier order); it states only what PG adds. |
| `PAPER-KEDLAYA-LIU-15/302` | [PG.1/etale-phi-cohomology](#phigammamodulesandiwasawacohomology-pg-1-etale-phi-cohomology). The PG target imports the owner statement from PadicHodgeTheory:P8/relative-frobenius-cohomology-comparison (moved down under the tier order); it states only what PG adds. |
| `PAPER-KEDLAYA-LIU-15/304` | [PG.1/etale-phi-cohomology](#phigammamodulesandiwasawacohomology-pg-1-etale-phi-cohomology). The PG target imports the owner statement from PadicHodgeTheory:P8/relative-frobenius-cohomology-comparison (moved down under the tier order); it states only what PG adds. |
| `PAPER-KEDLAYA-LIU-15/399` | [PG.2/period-sheaf-equivalences](#phigammamodulesandiwasawacohomology-pg-2-period-sheaf-equivalences) |
| `PAPER-KEDLAYA-LIU-15/402` | [PG.2/etale-tilde-equivalence](#phigammamodulesandiwasawacohomology-pg-2-etale-tilde-equivalence) |
| `PAPER-KEDLAYA-LIU-15/403` | [PG.2/period-sheaf-equivalences](#phigammamodulesandiwasawacohomology-pg-2-period-sheaf-equivalences) |
| `PAPER-KEDLAYA-LIU-15/405` | `PadicHodgeTheory:P7/b-pair-robba-equivalence`, [PG.2/all-module-decompletion](#phigammamodulesandiwasawacohomology-pg-2-all-module-decompletion) |
| `PAPER-KEDLAYA-LIU-15/406` | [PG.2/period-sheaf-equivalences](#phigammamodulesandiwasawacohomology-pg-2-period-sheaf-equivalences) |
| `PAPER-KEDLAYA-LIU-15/407` | [PG.2/period-sheaf-equivalences](#phigammamodulesandiwasawacohomology-pg-2-period-sheaf-equivalences) |
| `PAPER-KEDLAYA-LIU-15/408` | [PG.3/period-sheaf-cohomology](#phigammamodulesandiwasawacohomology-pg-3-period-sheaf-cohomology) |
| `PAPER-DOSPINESCU-LEBRAS-17/52` | [PG.5/analytic-iwasawa](#phigammamodulesandiwasawacohomology-pg-5-analytic-iwasawa) |
| `PAPER-DOSPINESCU-LEBRAS-17/kpx-psi0-generated-by-one-minus-phi` | [PG.5/analytic-iwasawa](#phigammamodulesandiwasawacohomology-pg-5-analytic-iwasawa) |
| `PAPER-DOSPINESCU-LEBRAS-17/colmez-bloch-kato-image-tN-psi1` | [PG.5/analytic-bloch-kato-image](#phigammamodulesandiwasawacohomology-pg-5-analytic-bloch-kato-image) |
| `PAPER-BREUIL-HELLMANN-SCHRAEN-19/3.3-phigamma` | [PG.7/relative-category](#phigammamodulesandiwasawacohomology-pg-7-relative-category), [PG.3/localized-herr](#phigammamodulesandiwasawacohomology-pg-3-localized-herr) |
| `PAPER-BREUIL-HELLMANN-SCHRAEN-19/3.3-characters` | [PG.7/rank-one-characters](#phigammamodulesandiwasawacohomology-pg-7-rank-one-characters), [PG.7/character-weights](#phigammamodulesandiwasawacohomology-pg-7-character-weights) |
| `PAPER-BREUIL-HELLMANN-SCHRAEN-19/3.3-cohomology` | [PG.3/herr-ext](#phigammamodulesandiwasawacohomology-pg-3-herr-ext), [PG.3/localized-herr](#phigammamodulesandiwasawacohomology-pg-3-localized-herr) |
| `PAPER-DING-25/2.1-robba` | [PG.7/relative-category](#phigammamodulesandiwasawacohomology-pg-7-relative-category) |
| `PAPER-DING-25/2.1-rank-one` | [PG.7/rank-one-characters](#phigammamodulesandiwasawacohomology-pg-7-rank-one-characters), [PG.7/rank-one-classification](#phigammamodulesandiwasawacohomology-pg-7-rank-one-classification), [PG.7/character-weights](#phigammamodulesandiwasawacohomology-pg-7-character-weights) |
| `PAPER-DING-25/2.1-ext-herr` | [PG.3/herr-ext](#phigammamodulesandiwasawacohomology-pg-3-herr-ext), [PG.3/herr-tate-duality](#phigammamodulesandiwasawacohomology-pg-3-herr-tate-duality). The PG target imports the owner statement from PadicHodgeTheory:P7/herr-complex-interface (moved down under the tier order); it states only what PG adds. |
| `PAPER-DING-25/4.2-global-triangulation` | [PG.7/global-triangulation](#phigammamodulesandiwasawacohomology-pg-7-global-triangulation), [PG.7/triangulation-specialization](#phigammamodulesandiwasawacohomology-pg-7-triangulation-specialization) |

## Source corrections and version discipline

**PhiGammaModulesAndIwasawaCohomology/E1.** Retrieved arXiv:1203.5718v3, Definition 2.2.2, printed p.16/PDF index15, finite-free sentence following phi:R_A^[s,r]→R_A^[s/p,r/p]. Paraphrase of the source assertion: the finite-free module structure is assigned to the departure annulus over the arrival annulus. The target R_A^\[s/p,r/p](π\_K) is rank p over the source R_A^\[s,r](π\_K) via phi; reverse the two rings in that sentence. The structural map has the opposite direction to the printed module assertion. The following trace and the Q_p coordinate decomposition use the corrected orientation. The page was visually inspected. Retained preprint-scoped finding from the earlier checkpoint; no new novelty or publication-version claim. Definition 2.2.2 was re-read with the trace/coordinate formulas. Review verdict: confirmed. In KPX v3, Definition 2.2.2 (p.16) gives φ from R_A^{[s,r]}(π\_K) to R_A^{[s/p,r/p]}(π\_K) and then calls the source free over the target; the ψ formula there and the decomposition R_A^{[s,r]}=⊕(1+π)^iφ(R_A^{[ps,pr]}) in Notation 2.2.3 use the reverse orientation, so the sentence has its two rings exchanged.

**PhiGammaModulesAndIwasawaCohomology/E2.** Berger-Wach-2004, Définition III.4.1, p.21. Paraphrase: a Wach module with weights in [a;b] over B_F^+ is defined by freeness, Γ-triviality modulo π and the q^{b−a} condition on the Frobenius linearization, with no condition on its extension to B_F. Over B_F^+, where p is a unit, add that B_F⊗\_{B_F^+}N is an étale (φ,Γ\_F)-module over B_F; the integral definition over A_F^+ needs no change. Without it the rational definition does not force N to come from a representation, so Proposition III.4.2 needs the extra condition. Known: Berger, Errata for my articles (2026), §2, p.3; recorded as PadicHodgeTheory/E10 (confirmed by REV-PadicHodgeTheory). Review verdict: confirmed. Checked at Definition III.4.1, p.21, of the recorded author PDF and against Berger's erratum.

- **KL-II, Appendix A, p.189.** Use the top-left block elimination, determinant-unit closed-open basis locus and diagonal representation tensor in the corrected KL-I arguments. Targets: [PG.0/free-cover](#phigammamodulesandiwasawacohomology-pg-0-free-cover), [PG.1/asw-fixed-basis](#phigammamodulesandiwasawacohomology-pg-1-asw-fixed-basis), [PG.1/asw-equivalence](#phigammamodulesandiwasawacohomology-pg-1-asw-equivalence).
- **PAPER-KEDLAYA-LIU-15.** Retain completeness of R₀ in the completed-perfection/pure comparison and interpret X in Theorem 8.6.2 as Spec R. Adopted from accepted routing, not new findings. Targets: [PG.1/pure-equivalence](#phigammamodulesandiwasawacohomology-pg-1-pure-equivalence), [PG.1/etale-phi-cohomology](#phigammamodulesandiwasawacohomology-pg-1-etale-phi-cohomology).
- **PAPER-DOSPINESCU-LEBRAS-17/E24.** Replace distribution-only generation by KPX’s larger Robba-type Γ-ring scalar extension and retain both cokernel hypotheses and involution/radius obligations. Targets: [PG.5/analytic-iwasawa](#phigammamodulesandiwasawacohomology-pg-5-analytic-iwasawa).

The KPX connected-component hypothesis in global triangulation is explicitly scoped to the retrieved preprint. No claim about a change in the JAMS version follows. The different Δ presentations are compared rather than classified as an error. The retained E1 finding and accepted corrections above are not new independent errata verdicts.

## References and source identities

All statements and proof routes are paraphrased at their mathematical target, with numbered locators. Page references follow the identified edition; CC and Fargues–Fontaine use author-PDF pagination. Original proofs not read are named in the gaps. SHA-256 values identify the actual reading copy; cleared restricted sources were read in place and no source text is included.

<a id="source-kpx-v3"></a>

- **KPX-v3.** Kiran S. Kedlaya, Jonathan Pottharst, Liang Xiao, [Cohomology of arithmetic families of (phi,Gamma)-modules](https://arxiv.org/pdf/1203.5718v3). arXiv:1203.5718v3, 79-page retrieved PDF: margin 19 November 2013, cover 1 November 2018. Not collated with JAMS version of record.. SHA-256 `dfd271fa2ef3f329b717ad02637f77def77295bb9197843eba8851fde9212b8c`.

<a id="source-llz-2011"></a>

- **LLZ-2011.** Antonio Lei, David Loeffler, Sarah Livia Zerbes, [Coleman maps and the p-adic regulator](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf). Algebra & Number Theory 5(8) (2011), 1095–1131; publisher PDF. SHA-256 `e8c488028a3000313db2fee031506f1bb8414ec71af54b80ca97f01982b6950c`.

<a id="source-berger-intro"></a>

- **Berger-intro.** Laurent Berger, [An introduction to the theory of p-adic representations](https://arxiv.org/pdf/math/0210184). arXiv:math/0210184v1, 12 October 2002, 44-page preprint. SHA-256 `fac038cb2e7a3c939f7b0c85d1060985876abc5d55407d7172fc1f6f2cc16ecc`.

<a id="source-cc-1998"></a>

- **CC-1998.** Frédéric Cherbonnier, Pierre Colmez, [Représentations p-adiques surconvergentes](https://webusers.imj-prg.fr/~pierre.colmez/CCinv.pdf). Author retypeset 24-page PDF of Inventiones Mathematicae 133 (1998), 581–611; locators use the author PDF, not journal pagination.. SHA-256 `cee9e8588ba1042fd0c52edc132eb3476b8ae9b65df6456047306d67118beb3f`.

<a id="source-berger-wach-2004"></a>

- **Berger-Wach-2004.** Laurent Berger, [Limites de représentations cristallines](https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf). Author 35-page PDF, November 2004; distinct from the 15-page arXiv 2002 version. SHA-256 `52e188211dfba449a92e5a8a66cc65379fe17688e6384a8eb6ece3a19a932110`.

<a id="source-pottharst-2013"></a>

- **Pottharst-2013.** Jonathan Pottharst, [Analytic families of finite-slope Selmer groups](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf). Algebra & Number Theory 7(7) (2013), 1571–1612; publisher PDF. SHA-256 `41410c5e95be1f5e6db08b3176563b8d3076d3dacdf924ddd9f809b448190f9e`.

<a id="source-kl-i"></a>

- **KL-I.** Kiran S. Kedlaya, Ruochuan Liu, [Relative p-adic Hodge theory: Foundations](https://arxiv.org/abs/1301.0792v5). Maintainer-cleared author PDF arXiv:1301.0792v5, 9 May 2015; cover 2 May 2015. SHA-256 `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942`.

<a id="source-kl-ii"></a>

- **KL-II.** Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory, II: Imperfect period rings*. Maintainer-cleared author PDF, cover 21 October 2019. SHA-256 `97383900492daf1c6778959c37e993f67dd5ad379ac03c31049b870382e5d42c`.

<a id="source-ff-2018"></a>

- **FF-2018.** Laurent Fargues, Jean-Marc Fontaine; preface by Pierre Colmez, [Courbes et fibrés vectoriels en théorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf). Author PDF dated 16 April 2017 of the work published as Astérisque 406 (2018); locators refer to this author PDF. SHA-256 `cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3`.

<a id="source-bhs-2019"></a>

- **BHS-2019.** Christophe Breuil, Eugen Hellmann, Benjamin Schraen, [A local model for the trianguline variety and applications](https://numdam.org/item/10.1007/s10240-019-00111-y.pdf). Publications Mathématiques de l’IHÉS 130 (2019), 299–412; publisher/Numdam PDF. SHA-256 `34ffd69795468054b4caab7847d5ae90393826c889b187397dbe53e16993967a`.

<a id="source-ding-2025"></a>

- **Ding-2025.** Yiwen Ding, [p-adic Hodge parameters in the crystabelline representations of GLn](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf). Publications Mathématiques de l’IHÉS (2025), publisher PDF DOI 10.1007/s10240-025-00156-2. SHA-256 `741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba`.

<a id="source-dlb-2017"></a>

- **DLB-2017.** Gabriel Dospinescu, Arthur-César Le Bras, [Revêtements du demi-plan de Drinfeld et correspondance de Langlands p-adique](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n2-p01-p.pdf). Annals of Mathematics 186 (2017), 321–411; publisher PDF. SHA-256 `00fb89502da84ea38738734652733ea6487e13686a8e54d32eecf4575d6b0094`.

<a id="source-cc-1999"></a>

- **CC-1999.** Frédéric Cherbonnier, Pierre Colmez, [Théorie d'Iwasawa des représentations p-adiques d'un corps local](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf). Author 28-page PDF of J. Amer. Math. Soc. 12 (1999), 241–268; locators use the author PDF pagination.. SHA-256 `d8f422d1f02a116ad3387826ec1947f8fa1afcac4ed8b89b6564e0e9f245f395`.

<a id="source-berger-errata"></a>

- **Berger-errata.** Laurent Berger, [Errata for my articles](https://perso.ens-lyon.fr/laurent.berger/articles/errata.pdf). Author PDF, 12 pages, created 13 October 2026. SHA-256 `bb42b4f8d684882625adb4b0994cbaeb214141522d4f7ac27237e69317e92f5d`.

## Validation and review boundary

The packet/world-declaration-index checker reports zero errors and zero warnings. The local inventory check preserves all 32 previous node identifiers and verifies every target, API item and named example appears in this document. The compact suggested file elaborated with `lean-check` at the pins; its only warnings concern admitted proofs. This is elaboration of the suggested signatures, not implementation or arithmetic proof verification. The earlier 1,011-scenario algebra simulation was not rerun and is not current validation. Independent review must check the source qualifications, stage coverage, proof gaps and cross-roadmap contracts before the plan goes live.

Independent review (REV-PhiGammaModulesAndIwasawaCohomology, 2026-10-19) found that the plan restated material the lower-tier PadicHodgeTheory and FiniteFlatGroupsAndIntegralPadicHodgeTheory roadmaps now own, and rewrote the affected targets as receipts or narrowed them to PG's additions, with the owners as prerequisites. It corrected 28 source locators against the source PDFs, added Cherbonnier–Colmez 1999 for the degree-one Iwasawa comparison and Berger's 2026 errata, replaced the Bloch–Kato stage request by exact nodes, confirmed source issue E1, added E2 (the rational Wach definition needs B_F⊗N étale), and re-elaborated the suggested file with lean-check. The packet review object lists every node verdict.
