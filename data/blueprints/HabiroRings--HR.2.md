# Habiro rings — HR.2: spherical completion and solid coefficients

This document completes the planning pass for HR.2’s remainder in the accepted HabiroRings blueprint. It supplements the parent packet; its nine HR.2 nodes retain their identities, statements and ownership. Five new support nodes provide the spherical arithmetic instance and the countable solid calculation needed to assemble the accepted B.7/B.8 targets. The scope is exactly `HabiroRings:HR.2`. The pass is complete and this stage is **planned**, with two gaps and ten supplier requests. Nothing is implemented or declared closed.

The primary source is Ferdinand Wagner, *q-Hodge complexes over the Habiro ring*, arXiv:2510.04782v2, Appendix B, pp.77–80. The fresh source reading also covers Guido Bosco’s *Rational p-adic Hodge theory for rigid-analytic varieties*, arXiv:2306.06100v1, Appendix A.1, pp.92–93; Wagner’s thesis, §§5.1–5.3, printed pp.85–86; and Jacob Lurie’s *Higher Algebra*, 18 September 2017, Proposition 2.2.1.9 and Theorem 7.1.2.13 with their hypotheses and proof context. Versions, URLs, read sections and PDF hashes are in the packet. Bosco proves an algebraic p-adic comparison for cohomologically bounded-above complexes: it is a template for, rather than a proof of, the spherical comparison here.

Use homological indexing throughout: “bounded below” means π_k=0 below a fixed integer. All spectral quotients mean homotopy cofibres, limits are homotopy limits and tensor products are derived. The integers m indexing cyclotomic factors are positive; the factorial length n can be zero, with P_0=1. Put P_n(q)=∏_{i=1}^n(1−q^i). In limits of principal completions, order m by divisibility. Distinguish the sphere S, the Eilenberg–Mac Lane ring HZ, the classical integral Habiro ring H, and its spherical counterpart SH.

## Existing ownership and the pinned boundary

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The HR.2 library audit, AUDIT-17 in `data/library-coverage.json`, says this stage is not built. The actual pinned statements of `LaurentPolynomial` (ordinary additive group-ring polynomials), `DerivedCategory` (localized cochain complexes), and `LightCondMod` (sheaves of ordinary modules) were read. None constructs spectra, E∞ module categories or light solid spectra. The provisional `CondensedMod.IsSolid` for condensed modules must not be used as a carrier for spectral solidity. A focused Mathlib PR search for “solid spectra” found no matching item; this is search evidence, not an assertion that future work cannot supply it.

Generic modules and algebra objects are already owned by `EnhancedDerivedSheaves:E5:abstract/module-objects` and `/algebra-objects`. Their concrete use here depends on `StableHomotopyKTheory:H.5:spectra` and `H.5:S-delooping`, which provide spectra and smash products. Coherent monoidal localization and relative module tensor products are precise extensions requested from E5:abstract. They are not rebuilt inside HabiroRings. E5:spectra-comparison supplies the HZ-relative realization comparison after H.5. H.6 supplies homotopy exact sequences and tower convergence; E3 supplies accessible reflection; DD.1 supplies principal derived completion. HC.1 owns the factorial/cyclotomic polynomial and ordinary-completion toolkit. QM.0 owns integral Gaussian polynomials.

Import these parent nodes without replacing them:

| Accepted node in `HabiroRings:HR.2` | Role in assembly |
| --- | --- |
| `habiro-complete-modules` | Algebraic definition in D(A[q±1]) |
| `the-two-term-resolution` | Corrected resolution of the ordinary localization Rr |
| `completeness-via-the-factorial-tower` | Algebraic reflection and derived tower criterion |
| `completeness-on-homotopy-groups` | Algebraic homotopy/Ext criterion |
| `the-derived-nakayama-lemma` | Algebraic derived and static Nakayama |
| `the-detection-results` | Degree, interval and staticity detection |
| `the-monoidal-structure` | Completed algebraic tensor, with the scalar-base clarification below |
| `habiro-complete-solid-spectra` | The B.7 embedding and its full-faithfulness target |
| `the-solid-comparison-is-bounded-below` | The B.8 target; the countable calculation below supports its proof |

The accepted erratum `HabiroRings/E8` is reused: the telescope differential is a_i−(1−q^i)a_{i−1}, not a_i−P_i a_{i−1}. Its proof and source issue are not duplicated.

The Eilenberg–Mac Lane equivalence is symmetric monoidal between D(A) and modules over H(A), with A-relative tensor. Restriction along S[q±1]→HZ[q±1] commutes with Habiro completion, by base-changing the localization; it is only lax monoidal. Consequently the parent’s tensor comparison must be read with **HZ[q±1]-relative** tensor on its algebraic side. It must not identify tensor over the sphere with tensor over HZ. This clarification does not change the accepted algebraic completion API or conflate SH with H(H).

## HR.2 support targets

### 1. Spherical cyclotomic localization

Node `HabiroRings:HR.2/spherical-rational-localization` (construction).

Put R = S[Z] = S[q±1], the commutative spherical group ring, and P_n = ∏_{i=1}^n(1−q^i), with P_0=1. Construct the E∞ R-algebra T = R[(q^m−1)^{-1} : m≥1] as the sequential telescope R --(1−q)--> R --(1−q²)--> R --(1−q³)--> … on underlying modules, with coherent localization multiplication. T is idempotent: T⊗_R T ≃ T. Its π_0 is the ordinary localization Rr = Z[q±1,{(q^m−1)^{-1}}_{m≥1}]. This is a spherical localization, not the Eilenberg–Mac Lane spectrum of Rr.

Hypotheses: Sp has its closed presentable stable symmetric monoidal structure and integer-indexed homotopy groups. Generic E∞ algebras, modules, localizations and relative tensor products are supplied by E5:abstract; the present packet specifies only this arithmetic instance.

Construction or proof:

1. Import generic spectral localization; the factors 1−q^m commute and generate the same multiplicative set as the P_n. The countable telescope gives the underlying localization module.
2. Obtain multiplication and its coherence from the generic universal property, not from an arbitrarily chosen equivalence of underlying spectra. The unit T→T⊗_R T is an equivalence by localization.
3. Homotopy groups commute with filtered colimits, so π_kT is π_kR localized at these factors; in particular π_0T=Rr.
4. Use the localization cofiber sequence to identify fib(R→T) with Σ^{-1}colim_n R/P_n, whose transition R/P_n→R/P_{n+1} is multiplication by 1−q^{n+1}.

Direct prerequisites: `StableHomotopyKTheory:H.5:spectra`, `StableHomotopyKTheory:H.5:S-delooping`, `EnhancedDerivedSheaves:E5:abstract/algebra-objects`, `EnhancedDerivedSheaves:E5:abstract/module-objects`, `HabiroCyclotomicCompletions:HC.1/the-factorial-polynomials`.

Source: Wagner.HR2.v2, Appendix B.1 and proof of B.2, printed/PDF p.77. Defines the localization and its idempotence; the proof gives the fibre telescope.

Named API:

- `SphericalCyclotomicLocalization` (constructor): The commutative R-algebra T with its unit R→T.
- `SphericalCyclotomicLocalization.map` (universal-property): For a commutative R-algebra B in which every q^m−1, m≥1, is invertible, the space of R-algebra maps T→B is contractible; otherwise it is empty.
- `SphericalCyclotomicLocalization.invert` (simp): Multiplication by q^m−1 on T is an equivalence for every m≥1.
- `SphericalCyclotomicLocalization.idempotent` (characterisation): The multiplication T⊗_R T→T is an equivalence of commutative R-algebras.
- `SphericalCyclotomicLocalization.fibre` (equivalence): fib(R→T) ≃ Σ^{-1}colim_{n≥1}R/P_n with transition multiplication by 1−q^{n+1}.
- `SphericalCyclotomicLocalization.pi` (compatibility): π_kT ≅ π_kR[{(q^m−1)^{-1}}_{m≥1}], naturally as Z[q±1]-modules.

Unit tests:

- `SphericalCyclotomicLocalization.pi_zero` (compatibility): π_0T ≅ Rr as Z[q±1]-algebras.
- `SphericalCyclotomicLocalization.first_transition` (computation): The first transition R/P_1→R/P_2 is induced by 1−q², so P_2=P_1(1−q²).
- `SphericalCyclotomicLocalization.cyclotomic_tensor_zero` (degenerate): T⊗_R(R/(q^m−1)) ≃ 0 for every positive m.

Uses: Wagner B.1–B.2: The right orthogonal to T defines spectral Habiro completeness. HabiroRings:HR.2/habiro-complete-modules: The HZ base change identifies T with the ordinary localized ring, supplying the spectral-to-algebraic boundary.

Acceptance: Both telescope transition and cofiber transition use the next factor, not the whole P_{n+1}. All m in the localization are strictly positive: including m=0 would invert zero.

### 2. Spectral Habiro completion

Node `HabiroRings:HR.2/spectral-habiro-completion` (construction).

For M∈Mod_R(Sp), define L_H M = RHom_R(fib(R→T),M). The unit M→L_H M is a reflection onto the full subcategory C_H where RHom_R(T,M)=0. There are natural equivalences L_H M ≃ lim_{n≥1}cofib(P_n:M→M) ≃ lim_{m≥1}M^∧_{(q^m−1)}, where the second limit uses divisibility in m and principal derived completions. Put SH=L_H R. The kernel is the T-local module category; it is a tensor ideal. Hence C_H has tensor L_H(M⊗_RN), unit SH and coherent symmetric monoidal structure. Completeness is equivalent to Habiro completeness of every π_kM as a Z[q±1]-module. Derived cyclotomic reductions jointly detect zero and each homotopy degree on C_H. These are spectral extensions of the accepted algebraic nodes, not a second theory of derived completion.

Hypotheses: R,T,P_n are the preceding arithmetic localization. All quotients are homotopy cofibres, all limits derived; no boundedness is imposed on the completeness or Nakayama assertions. The spectral t-structure is left and right complete; the source convergence argument is used with the two-term localization resolution.

Construction or proof:

1. Use the fibre telescope and duality of the perfect principal cofiber R/P_n to identify RHom of the fibre with lim M/P_n. Import the polynomial cofinality and the generic principal derived-completion interface, rather than rebuilding them.
2. Apply RHom_R(−,M) to fib(R→T)→R→T. Its first term RHom_R(T,M) is T-local, while RHom_R(T,L_HM)=0; the triangle therefore proves reflection, idempotence and the kernel statement.
3. The T-local kernel is a tensor ideal, since T is an idempotent localization. Apply HA 2.2.1.9 through E5:abstract to obtain the coherent completed tensor. The inclusion is lax monoidal; completeness is not the assertion SH⊗_RSH≃SH in ordinary spectra.
4. Base change T along R→HZ[q±1] gives H(Rr). For Eilenberg–Mac Lane modules use HA 7.1.2.13 through E5:spectra-comparison. Import the accepted corrected two-term resolution of Rr. The Postnikov filtration of RHom_R(T,M) has graded pieces Σ^kRHom_{Z[q±1]}(Rr,π_kM), of amplitude [k−1,k]; the complete/exhaustive filtration and this uniform two-degree bound give the natural short exact sequence in the API. Do not infer unbounded convergence merely from a displayed spectral sequence.
5. Use the accepted algebraic Nakayama and homotopy criterion on π_kM. The cofiber long exact sequence injects the underived quotient π_kM/Φ_m into π_k(M/Φ_m). Thus the vanishing of all degree-k reductions implies π_kM=0; equivalently vanishing of all reductions implies M=0. B.5 permits q^m−1 or P_n instead.

Direct prerequisites: `HabiroRings:HR.2/spherical-rational-localization`, `StableHomotopyKTheory:H.6`, `EnhancedDerivedSheaves:E3`, `EnhancedDerivedSheaves:E5:abstract/symmetric-monoidal-infinity-category`, `EnhancedDerivedSheaves:E5:spectra-comparison/late-realisation`, `DerivedDeRhamCohomology:DD.1`, `HabiroRings:HR.2/the-two-term-resolution`, `HabiroRings:HR.2/completeness-via-the-factorial-tower`, `HabiroRings:HR.2/completeness-on-homotopy-groups`, `HabiroRings:HR.2/the-derived-nakayama-lemma`, `HabiroRings:HR.2/the-detection-results`, `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`.

Source: Wagner.HR2.v2, B.1–B.5, printed/PDF pp.77–79. B.2 gives the reflection and homotopy criterion, B.3–B.5 give detection.

Source: Lurie.HA.2017, Proposition 2.2.1.9, printed p.197. The generic localization input is imported, with tensor-ideal hypothesis verified here.

Source: Lurie.HA.2017, Theorem 7.1.2.13, printed p.1212. Only HZ-relative module categories are symmetric monoidally identified with derived categories.

Named API:

- `SpectralHabiroCompletion` (constructor): M↦L_HM with a natural unit η_M:M→L_HM and SH=L_HR.
- `SpectralHabiroCompletion.factorial` (equivalence): L_HM ≃ lim_{n≥1}M/P_n, with transition induced by P_n | P_{n+1}.
- `SpectralHabiroCompletion.adjunction` (universal-property): For complete N, Map_R(L_HM,N)→Map_R(M,N) is an equivalence.
- `SpectralHabiroCompletion.idempotent` (simp): η_{L_HM} and L_H(η_M) are equivalences, agreeing under the reflection coherence.
- `SpectralHabiroCompletion.tensor` (structure): The tensor on C_H is L_H(M⊗_RN); its unit is SH, with associativity, unit and symmetry inherited via monoidal localization.
- `SpectralHabiroCompletion.homotopy_exact` (characterisation): 0→Ext¹_{Z[q±1]}(Rr,π_{k+1}M)→π_kRHom_R(T,M)→Hom_{Z[q±1]}(Rr,π_kM)→0, naturally in M and k∈Z.
- `SpectralHabiroCompletion.complete_iff_pi` (characterisation): M is complete iff each π_kM is complete in the accepted algebraic sense.
- `SpectralHabiroCompletion.nakayama` (characterisation): If M is complete and M/Φ_m=0 for every positive m, then M=0.
- `SpectralHabiroCompletion.detect_degree` (characterisation): For complete M and k∈Z, π_k(M/Φ_m)=0 for all positive m implies π_kM=0.
- `SpectralHabiroCompletion.restrict_HZ` (compatibility): Under Mod_{HZ[q±1]}≃D(Z[q±1]), restriction along R→HZ[q±1] commutes with L_H. The tensor comparison uses the HZ[q±1]-relative tensor followed by completion; restriction to R-modules is only lax monoidal.

Unit tests:

- `SpectralHabiroCompletion.zero` (degenerate): L_H0≃0.
- `SpectralHabiroCompletion.local_zero` (non-example): L_HT≃0 although π_0T=Rr≠0; localization and completion are different functors.
- `SpectralHabiroCompletion.cyclotomic_fixed` (characterisation): η_{R/(q−1)} is an equivalence; its homotopy groups are complete because 1−q acts by zero.
- `SpectralHabiroCompletion.integral_unit` (compatibility): L_H(HZ[q±1]) ≃ H(H), where H is HC.1’s classical integral Habiro ring. Surjective transition maps and finite-free polynomial quotients eliminate higher derived limits in this case.

Uses: Wagner B.7 and B.8: Completes the discrete condensed embedding and identifies its unit. HabiroRings HR.3–HR.5; HabiroCohomologyFoundations HQ.3–HQ.5: Their algebraic completion and detection stay on the accepted HR.2 algebraic imports; solid foundations are not prerequisites of this path.

Acceptance: Classical Habiro completion is recovered only on the stated algebraic/static objects, not by deleting derived inverse limits. The Ext term uses π_{k+1}M, not π_{k−1}M. If every reduction has homotopy supported in the same interval [a,b], then M does too; the interval must be common to all reductions.

### 3. Solid idempotence of the Habiro unit

Node `HabiroRings:HR.2/solid-habiro-unit-idempotence` (theorem).

In light solid spectra, regard SH as the condensed factorial limit lim_n R/P_n. Then multiplication SH⊗■_RSH→SH is an equivalence of commutative algebras. Moreover (∏_NS)⊗■SH≃∏_NSH, and shifts of ∏_NSH compactly generate Mod_SH(Sp■). The comparison identifies this SH with the image of the spherical complete unit under the accepted B.7 embedding.

Hypotheses: The proposed light-solid-spectra supplier has proved solidification, the countable product tensor formula and the associated tower and relative-base-change lemmas; these are recorded in gap G-solid. Each finite stage R/P_n is equivalent as an S-module to a finite direct sum of d_n=n(n+1)/2 spheres, by monic polynomial division; q is already invertible in that quotient.

Construction or proof:

1. Use monic polynomial division to give the finite stage its sphere basis and split transition R/P_{n+1}→R/P_n as an S-module map. Obtain a countable-product model of SH from the tower, keeping its R-action.
2. Invoke the supplier’s countable-product solid tensor formula and its compatibility with the split finite-free towers to compute SH⊗■SH by the double tower in independent q_1,q_2. This is an absolute solid tensor computation.
3. Invoke relative base change (derived identification q_1=q_2) and the same tower compatibility to get SH⊗■_RSH≃SH. A pointwise evaluation calculation alone does not justify exchanging relative tensor and the double limit; that supplier obligation remains in G-solid.
4. Apply the product formula to (∏_NS)⊗■SH. Import the generic compact generator Null■≃∏_NS and the module-category generator theorem; extension of scalars gives ∏_NSH.

Direct prerequisites: `HabiroRings:HR.2/spectral-habiro-completion`, `HabiroRings:HR.2/habiro-complete-solid-spectra`, `EnhancedDerivedSheaves:E5:abstract/module-objects`, `HabiroCyclotomicCompletions:HC.1/the-factorial-polynomials`.

Source: Wagner.HR2.v2, Proof of B.8, printed/PDF pp.79–80, first two paragraphs. The statement and finite-stage/countable-product proof sketch occur here.

Source: Wagner.Thesis.2025, §5.3, printed p.86 (PDF p.90), paragraph defining Null_R. Supplies the compact generator recollection; the supplier must still prove it.

Acceptance: P_1 quotient has rank 1, P_2 quotient rank 3; these are sums of spheres, not degree-zero abelian groups. Idempotence is asserted in the solid tensor category, not in ordinary Mod_R(Sp). The unit multiplication and generator equivalence retain their module actions.

### 4. Completed countable free solid modules

Node `HabiroRings:HR.2/completed-countable-free-solid-modules` (construction).

For a sequence of countable sets I_n, put F_I=⊕_{n∈N}∏_{i∈I_n}SH in Mod_SH(Sp■), and C_I=L_HF_I. Let W consist of f:N→N tending to infinity: for every k, f(n)≥k for all sufficiently large n. Give W reverse pointwise order: an arrow f→g means f(n)≥g(n) for all n. Define J_r=fib(SH→SH/P_r), equivalently the principal ideal with specified multiplication map P_r:SH→SH, and J_0=SH. Then C_I ≃ colim_{f∈W}∏_n∏_{i∈I_n}J_{f(n)}, with arrows the ideal inclusions. This is an equivalence of complete solid SH-modules, natural in block maps. The ideal notation denotes fibre objects and maps, not an untyped subset of a spectrum.

Hypotheses: All I_n are countable, including empty and finite sets. Use the light solid supplier’s product/tower and bounded-below realization inputs (G-solid); the integral topology and factorial polynomials remain owned by HC.1.

Construction or proof:

1. Identify F_I/P_r through the principal cofiber, finite-stage sphere bases and the countable product formula. Its tower completion describes families uniformly tending to zero in the block index, with the same weight bound for all i∈I_n.
2. For any such uniformly null family, choose a proper weight f with the family landing in ∏_{n,i}J_{f(n)}. Conversely every proper weight is uniformly null modulo each P_r. The supplier must justify this at the spectrum/hypersheaf level, including higher homotopy, not merely on degree-zero point sections.
3. The reverse order is filtered: min(f,g) is still proper and receives the ideal-inclusion arrows from f and g. Prove the colimit equivalence and naturality under finite-support block maps.
4. Identify C_I with the image of the ordinary spectral completion of the corresponding discrete countable free/product blocks where B.7 applies; do not claim that the colimit of ideal objects is already a discrete condensed coproduct.

Direct prerequisites: `HabiroRings:HR.2/solid-habiro-unit-idempotence`, `HabiroRings:HR.2/habiro-complete-solid-spectra`, `HabiroCyclotomicCompletions:HC.1/topology-completeness-and-universal-property`.

Source: Wagner.HR2.v2, Proof of B.8, printed/PDF p.80, completed sum formula. The construction includes countable product blocks, not just singleton summands.

Source: Bosco.2023, Lemma A.4 and its proof, printed/PDF p.93. The p-adic null-family analogue explains uniform decay and inclusion orientation; it does not prove the spectral statement.

Named API:

- `CountableSolidHabiroFree` (constructor): For a countable block family I, construct C_I=L_H(⊕_n∏_{i∈I_n}SH).
- `CountableSolidHabiroFree.ideal` (data): J_r is fib(SH→SH/P_r), with transition J_s→J_r for r≤s induced by P_r | P_s.
- `CountableSolidHabiroFree.null_family` (equivalence): C_I ≃ colim_{f→∞}∏_{n,i∈I_n}J_{f(n)}, natural in finite-support block maps.
- `CountableSolidHabiroFree.inclusion` (constructor): The nth block map ∏_{i∈I_n}SH→C_I is the completed coproduct injection.
- `CountableSolidHabiroFree.ext` (extensionality): For complete Q, restriction to the block inclusions gives Map(C_I,Q)≃∏_n Map(∏_{i∈I_n}SH,Q).
- `CountableSolidHabiroFree.complete` (characterisation): RHom_R(T,C_I)=0, and C_I→lim_r C_I/P_r is an equivalence.
- `CountableSolidHabiroFree.transition` (functoriality): If f≥g pointwise, the profile transition is ∏J_{f(n)}→∏J_{g(n)}; min(f,g) gives a common target.

Unit tests:

- `CountableSolidHabiroFree.empty` (degenerate): If every I_n is empty then C_I=0.
- `CountableSolidHabiroFree.one_block` (computation): If I_0 is a singleton and every other I_n is empty then C_I≃SH.
- `CountableSolidHabiroFree.constant_not_null` (non-example): For singleton blocks, the constant family (1,1,…) in ∏_NSH is not in the image of C_I→∏_NSH: modulo P_1=q−1 it is nonzero in infinitely many coordinates.
- `CountableSolidHabiroFree.decaying_family` (characterisation): For singleton blocks the maps P_n:SH→SH in the nth coordinate assemble to a map SH→C_I, since n↦n is a proper weight.

Uses: Wagner proof of B.8, p.80: This family is the countable free model on which solid tensor closure is calculated. HabiroRings:HR.2/the-solid-comparison-is-bounded-below: Compact generation, ω₁-filtered colimits and uniformly bounded-below resolutions reduce the target to these blocks.

Acceptance: For singleton blocks the model is the null-sequence formula used on p.80 of B.8. The profile is independent of i within each block; separate unbounded weights per element would give a different formula. The colimit orientation is from larger weights/smaller ideals to smaller weights/larger ideals.

### 5. Countable solid Habiro tensor comparison

Node `HabiroRings:HR.2/countable-solid-habiro-tensor` (theorem).

For countable block families I,J, the canonical map C_I⊗■_SHC_J→L_H(F_I⊗■_SHF_J) is an equivalence; its target is the completed countable family indexed by (m,n) with blocks I_m×J_n. Thus this tensor is Habiro-complete. Combined with the supplier’s uniformly bounded-below resolution and ω₁-filtered-colimit compatibility, this discharges the accepted B.8 target for all bounded-below complete spectra: e(M)⊗■_SHe(N)≃e(L_H(M⊗_RN)), where e is the accepted B.7 embedding. There is no assertion for arbitrary unbounded objects.

Hypotheses: I_m,J_n are countable. For the final B.8 consequence, M,N have uniform integer lower homotopy bounds (which may differ). The generic solid supplier supplies the product tensor and bounded-below reduction; until G-solid is resolved the final consequence is conditional.

Construction or proof:

1. Apply null-family models, colimit preservation of solid tensor and the solid product formula. In singleton notation the tensor is colim_{f,g→∞}∏_{m,n}(P_{f(m)}P_{g(n)})SH. Keep the module structure and the countable blocks.
2. Import Gaussian-polynomial integrality from QM.0: P_aP_b divides P_{a+b} in Z[q]. For every radial proper h:N²→N, construct proper f,g with f(m)+g(n)≤h(m,n). One construction uses the increasing proper lower envelope a(k)=min{h(m,n):m+n≥k} and f(k)=g(k)=⌊a(k)/2⌋.
3. Check both cofinal containment directions: P_hSH⊆P_{f+g}SH⊆P_fP_gSH for that choice of f,g; for fixed f,g, P_fP_gSH⊆P_max(f,g)SH, and max(f(m),g(n)) is radial proper. Consequently the product-ideal colimit agrees with the colimit over all radial proper h, not merely a one-sided inclusion.
4. Identify the radial null-family colimit with the factorial completion of the double coproduct using a bijection N²≃N respecting finite subsets; proper means finite sublevel sets, so the model is enumeration independent.
5. For the full B.8 target, import the compact generator ∏_NSH, express arbitrary generator sums by ω₁-filtered unions of countable subsums, and use commutation of countable limits with ω₁-filtered colimits. Resolve connective objects by simplicial countable/product-block models and use a spectral-sequence/realization argument with a common lower bound to commute completion with these realizations. The generic supplier must prove these steps; Bosco A.3 is an algebraic p-adic template, not that proof. After shifting the two bounds, the comparison follows by colimit preservation of solid tensor.

Direct prerequisites: `HabiroRings:HR.2/completed-countable-free-solid-modules`, `QSeriesPartitionsAndMockModularForms:QM.0/q-binomial-coefficient`.

Source: Wagner.HR2.v2, Proof of B.8, printed/PDF p.80, final three paragraphs. Gives product divisibility, proper profiles and the completed double sum.

Source: Bosco.2023, Proposition A.3, printed/PDF pp.92–93. Documents the uniformly connective resolution argument only in the algebraic p-adic setting.

Named API:

- `CountableSolidHabiroTensor.comparison` (equivalence): C_I⊗■_SHC_J ≃ L_H(F_I⊗■_SHF_J), naturally in countable block families.
- `CountableSolidHabiroTensor.factorial_mul_dvd` (compatibility): For a,b∈N, P_aP_b divides P_{a+b} in Z[q], obtained from QM.0’s Gaussian polynomial.
- `CountableSolidHabiroTensor.separable_weights` (other): If for each k there exists B such that m+n≥B implies h(m,n)≥k, there are f,g:N→N tending to infinity with f(m)+g(n)≤h(m,n) for every m,n.
- `CountableSolidHabiroTensor.radial_max` (other): If f,g tend to infinity, max(f(m),g(n)) tends to infinity as m+n→∞.
- `CountableSolidHabiroTensor.bounded_below` (compatibility): For bounded-below complete M,N, e(M)⊗■_SHe(N)≃e(L_H(M⊗_RN)); this is the accepted B.8 target, with G-solid’s resolution hypothesis discharged by its future supplier.

Acceptance: For one nonempty singleton block on each side, this is SH⊗■_SHSH≃SH. The polynomial instance a=b=1 is P_2=P_1²(1+q), testing the divisibility orientation. h(m,n)=m+n admits f(m)=m,g(n)=n. A constant h is not radial proper and is excluded. The proof needs both ideal containments and the bounded-below realization argument; a pointwise tensor identity is insufficient.

## The generic solid supplier and the substage decision

B.6’s category is light **hypersheaves of spectra**, with an internal Hom test for solidity. If Null is the cofiber of the free condensed sphere at ∞ into the free sphere on N∪{∞}, and σ is the shift fixing ∞, solidity asks that 1−σ* on internal Hom(Null,M) be an equivalence. Testing only point sections gives a weaker condition. Solid tensor is solidification of the condensed tensor, with the resulting coherence. B.7 sends an ordinary complete spectrum M to the **condensed Habiro completion of its discrete image**. Discreteness alone does not commute with countable limits. Point evaluation commutes with the factorial limit and cofibres, so the resulting adjunction unit is an equivalence and yields full faithfulness. This uses the imported parent node, not a second definition of the embedding.

The missing generic category belongs in a proposed **Artin v-stacks, solid and lisse coefficient categories, Part II: light solid spectra**, extending VS2’s solid abelian/module theory. Its detailed contract is G-solid below. The proposal creates no stage id and no generic solidification nodes in this packet. VS2 is requested only for HZ-relative compatibility. A solid abelian group has no sphere-valued higher homotopy and does not supply B.6’s category.

Retain the accepted proposal for a substage `HR.2:solid`, titled *Solid Habiro-complete spectra*. It would contain the parent B.7/B.8 nodes and the three solid support nodes here. Its prerequisites are HR.2’s spherical completion and the new generic solid supplier. The present packet keeps the existing HR.2 parent ids until an atomic structural promotion. This separates the dependency paths: HR.3–HR.5 and HQ.3–HQ.5 need the algebraic completion/detection exports; the solid comparison is an analytic-coefficient input at HQ.6. The latter must not silently become a prerequisite of relative Habiro-ring construction.

The proposed planets are Spherical cyclotomic localization, Spherical Habiro ring, Solid Habiro unit, and Completed countable free modules. Together with the parent’s Habiro-completion planet this gives five at the current HR.2 layer, within its limit of six. On promotion, the first two stay in HR.2 and the second pair goes to HR.2:solid.

## Exact remaining work and acceptance

**G-solid — Light solid spectra have no assigned supplier.** Create Artin v-stacks, solid and lisse coefficient categories, Part II: light solid spectra, building on VS2, H.5 and E5. The exact generic contract is: light profinite hypersheaves of spectra; fully faithful symmetric monoidal discrete functor left adjoint to point evaluation; Null and the internal-Hom 1−σ* solidity criterion; discrete spectra solid; limit/colimit closure, accessible solidification and symmetric monoidal coherence; Null■≃∏_NS compact generator; (∏_NS)⊗■(∏_NS)≃∏_{N²}S with functorial maps; split finite-free tower tensor and derived relative-base-change compatibility, not arbitrary tensor/limit commutation; countable limits commuting with ω₁-filtered colimits; compatible t-structure and uniformly bounded-below simplicial resolution/realization comparison sufficient for B.8; the null-family calculation at hypersheaf/spectrum level including higher homotopy. Wagner B.6/B.8 and thesis §§5.1–5.3 state/recollect these, but their full spectral foundations are delegated to lecture recordings; only Bosco’s algebraic p-adic proof was established from a written primary source here. No source theorem read here proves that spectral supplier contract in full. Do not mark HR.2 closed or pretend CondensedMod.IsSolid is this category.

**G-signatures — Spectral and solid typed signatures await the imported carriers.** The pins have LaurentPolynomial, DerivedCategory and LightCondMod, but no Sp, spectral module category, light hypersheaf spectra or solid tensor types. The suggested file therefore contains an exact name/statement ledger for all unavailable spectral definitions, APIs and tests, and actual typed signatures/examples only for the polynomial and proper-profile calculations. No placeholder proposition or private spectrum carrier is introduced. Replacing the ledger by typed signatures is required after H.5/E5 and the G-solid supplier land; elaboration of the current file checks only the existing algebraic/index interfaces.

Supplier requests (contracts, not claims of implemented exports):

- `StableHomotopyKTheory:H.5:spectra`: Concrete Sp, cofibres, integer homotopy, complete Postnikov t-structure and filtered-colimit homotopy comparison; do not import the E5 spectra-comparison return back into early H.5.
- `StableHomotopyKTheory:H.5:S-delooping`: Presentable closed symmetric monoidal Sp with the required E∞ refinement, sphere and group ring S[Z]; H.5 explicitly owns smash products, so HR.2 does not reconstruct spectra.
- `StableHomotopyKTheory:H.6`: Principal cofiber homotopy exact sequences, homotopy inverse limits with Milnor lim¹, and complete/exhaustive filtered-spectrum convergence with a uniform two-degree graded amplitude; generalize the scalar integer cofiber interface to module endomorphisms via E5 module objects.
- `EnhancedDerivedSheaves:E3`: Accessible reflective full subcategories of presentable stable categories, with enhanced adjunction and uniqueness. Exhibit accessibility before invoking the reflection. The light-solid limit/colimit interface remains in G-solid, rather than being presumed from this abstract adjoint theorem.
- `EnhancedDerivedSheaves:E5:abstract`: Import module-objects and algebra-objects; additionally supply coherent E∞ localization, relative module tensor products and HA 2.2.1.9 for tensor-ideal localizations. This is a requested extension of this generic owner, not a private Habiro module-category model.
- `EnhancedDerivedSheaves:E5:spectra-comparison`: HA 7.1.2.13: Mod_{H(A)}≃D(A) with A-relative symmetric monoidal comparison and change-of-scalars. Underlying restriction to S[q±1] preserves Habiro completion by the localization base-change identity, but is only lax monoidal.
- `DerivedDeRhamCohomology:DD.1`: Generic principal derived completion and cofinal-tower comparison in the enhanced module setting; HR.2 adds only the cyclotomic family.
- `HabiroCyclotomicCompletions:HC.1`: Reuse factorial polynomials, mutual cofinality with principal q^m−1-power ideals, static integral completion, and polynomial monic division. Supply finite-free quotient rank deg(P_n)=n(n+1)/2; this is the ordinary polynomial toolkit, not a new spectral definition.
- `QSeriesPartitionsAndMockModularForms:QM.0`: Import q-binomial-coefficient: Gaussian polynomials have integral coefficients and P_aP_b divides P_{a+b}, including a=0 or b=0. Only this polynomial identity is used, not analytic q-series.
- `VStackSheavesAndLisseCategories:VS2`: Only the HZ-relative compatibility with solid abelian groups and their derived solid tensor. VS2 does not supply light solid spectra or justify replacing the spherical unit by HZ.

Assembly must account for every Appendix B target: B.1/B.2 are the new spherical construction plus the accepted algebraic imports; B.3–B.5 are its detection API with the accepted Nakayama/detection proof; B.6 is G-solid’s generic input; B.7 remains the accepted embedding; B.8 remains the accepted bounded-below theorem, supported by the three solid targets and conditioned on G-solid’s precise reduction/coherence contract. No part of B.8 has been promoted to an unbounded theorem.

The arithmetic acceptance checks discriminate the sphere from HZ, localization from completion, the next telescope factor from the whole factorial, ordinary from derived quotients, and uniformly null families from arbitrary products. The tensor proof additionally checks both cofinal containments: the Gaussian-polynomial identity supplies one and the radial maximum supplies the other. Uniform lower bounds are necessary in the resolution argument. Sources recollect the generic solid formalism but do not supply a written proof of the whole spectral contract read in this pass; that remains an explicit gap.

The suggested file is an interface prototype. Its polynomial/profile portion uses genuine pinned Mathlib types. Its exact name/statement ledger records all spectral constructions, theorem signatures, APIs and tests whose carriers are absent; it introduces no stand-in spectrum or empty proposition. Elaborating that file checks the available interfaces and does not validate the higher comments. G-signatures lists the work needed to replace them. All node implementation statuses remain unchecked.
