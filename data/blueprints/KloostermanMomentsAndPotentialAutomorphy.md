# Symmetric power moments of Kloosterman sums

Kloosterman sums begin as finite exponential sums. Their symmetric-power moments encode cohomology rather than ordinary powers of the sums. This roadmap constructs the all-rank sheaves and connections needed by the Bessel-isocrystal programme, then specializes to rank two. Explicit bases and compactifications produce the Hodge numbers of the middle moment motive. Arithmetic degeneration and comparison identify its local factors; regular polarized compatible systems then give potential automorphy and functional equations.

This is a target-level roadmap, with 62 targets in twelve layers. Its packet is complete as a planning pass: all layers are planned, none is closed, and every implementation status is unchecked. Nine gaps and thirteen supplier requests describe the exact remaining foundational inputs. In particular, an explicit issue with the cited bad-prime semistable-model argument is recorded rather than assumed resolved. No assertion here claims formalization.

Independent review accepted this complete planning pass on 2026-10-19: 48 targets verified and 14 corrected. The [review report](../reviews/REV-DESIGN-KloostermanMomentsAndPotentialAutomorphy.md) records the checks, corrections and unresolved supplier obligations.

## Conventions and scope

- Write r=n+1 for the rank of the all-rank object, and k for the symmetric-power exponent. All-rank monodromy statements assume r≥2. Rank-two arithmetic targets assume k≥1 unless explicitly addressing the zeroth moment.
- The raw sum has no prefactor. The sheaf trace is (−1)^(r−1) times that sum. Thus in rank two α+β=−RawKl₂ and αβ=q. Symmetric moments use h_k(α+β,αβ), not (α+β)^k.
- Frobenius is geometric. In this roadmap’s FSY convention the cyclotomic character has Hodge–Tate weight −1; Q_ℓ(1) has geometric Frobenius q^(−1). The weight-zero all-rank normalization uses a single square root c²=p and its powers c^m over extensions.
- This roadmap follows FSY with HT(χ_cyc)=−1 and weights equal to the de Rham filtration jumps. PadicHodgeTheory:R06.2 uses HT(χ_cyc)=+1, so HT_KM(V)=−HT_R06(V), with multiplicities; D_dR, its filtration, Tate twists and the representation itself are unchanged.
- Exponential connections are E^f=(O,d+df) as left connection modules. A cyclic module equation and the scalar equation of a horizontal solution have different sign conventions; KM.2/bessel-dictionary specifies both.
- All middle spaces are the actual image of compact-support-to-ordinary cohomology. For rank r the middle motive has weight (r−1)k+1 and pairing into Q(−(r−1)k−1). The hypersurface realization has degree (r−1)k−1 before the Tate twist (−1).
- The generic mixed-Hodge-structure carrier is Tau Ceti’s existing one. Holonomic operations, Hodge modules and irregular Hodge filtrations require the separate foundational companion in G1–G2; étale intermediate extension alone does not supply them.
- The suggested Lean file is deliberately compact under WORKERS.md’s 12 October shape rule. It contains only light definitions and representative signatures on carriers at the pins. All targets, APIs, hypotheses and tests, including those whose carriers are absent, are specified in this document.
- The even functional equation retains its actual factor at two, conductor exponent and sign. The numerical Broadhurst–Roberts predictions and the sequel’s special-value results are outside this roadmap’s targets.

## Sources and attribution

**FSY: [Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454v5)**, Javier Fresán, Claude Sabbah, Jeng-Daw Yu. Duke Mathematical Journal 171 (2022), 1649–1747; arXiv:1810.06454v5, 13 June 2022. All page numbers below are the 74-page arXiv v5 pagination. Accessed 2026-10-19. SHA-256: `835580aa6314798e2866c248d6f7179379698d61a7baae0136806d4755b1f20a`.

- §§1.1–1.3, pp. 1–8: target statements and conventions
- §§2.1–2.3, pp. 9–18: connections, tensor powers and Fourier transforms
- §§3.1–3.2, pp. 18–25: classical Hodge structures, motives and realizations
- §§4.1–4.3, pp. 26–38: explicit bases, compactifications and Hodge filtration
- §§5.1–5.3, pp. 39–59: local realizations, conductors, comparison and automorphy
- Appendix A.1–A.7, pp. 59–72: holonomic operations, Hodge modules, exponential projection and the product-potential criterion

**XZ: [Bessel F-isocrystals for reductive groups](https://arxiv.org/pdf/1910.13391v2)**, Daxin Xu, Xinwen Zhu. Inventiones Mathematicae 227 (2022), 997–1092; arXiv:1910.13391v2, 19 December 2019. Locators use the 71-page preprint, not journal pagination. Accessed 2026-10-19. SHA-256: `b8d153ef1822a20e8179005d4775e43fc3af7430d840d2b077b45cb8583667cd`.

- §1.1.1–1.1.2, pp. 2–4: Bessel equations, normalized sheaves and monodromy table
- §2.1.5, p. 10 and §4.1.13, p. 42: exponential and Dwork sign conventions

**Serre: [On the mod p reduction of orthogonal representations](https://arxiv.org/pdf/1708.00046v3)**, Jean-Pierre Serre. arXiv:1708.00046v3, 8 August 2018; preprint pagination 1–13. Accessed 2026-10-19. SHA-256: `d7dd0dd3ec4b26513f9785a0acae39df55d4b9f52c34a07fe818ce3ab1fb4ae0`.

- §4.1–4.2, pp. 9–10: finite-dimensional modules over an algebra with involution, Theorem 4.2.1 and Lemma 4.2.4, including their proofs

The target statements below are written in our own words, arranged by mathematical construction rather than as a summary of a source. FSY page references always mean the arXiv v5 pagination, not the journal’s pagination. Original sources not read directly are identified in the gaps; their cited conclusions are not represented as independently checked proofs.

## Baseline and ownership

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each following declaration’s actual statement was inspected at the pin.

- **mathlib:AddChar** (Mathlib/Algebra/Group/AddChar.lean): Additive characters from an additive monoid into a multiplicative monoid; the zero character is the constant-one map. The finite-field applications specialize to commutative coefficient rings.
- **mathlib:AddChar.sum_eq_ite** (Mathlib/Algebra/Group/AddChar.lean): For a finite additive group and character into a commutative semiring that is a domain, the full additive-character sum is the cardinality for the trivial character and zero otherwise.
- **mathlib:FiniteField.trace_to_zmod_nondegenerate** (Mathlib/FieldTheory/Finite/Trace.lean): Nondegeneracy of the finite-field trace to its prime field; composing a nontrivial prime-field additive character with trace is nontrivial.
- **mathlib:FiniteField.algebraMap_trace_eq_sum_pow** (Mathlib/FieldTheory/Finite/Trace.lean): Finite-field trace after the algebra map is the sum of the Frobenius powers for a finite extension.
- **mathlib:Complex.Gamma** (Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean): Mathlib complex Gamma function, with its total-function convention at poles; analytic conclusions concern its meromorphic interpretation.
- **tauceti:TauCeti.Hodge.MixedHodgeStructure** (TauCeti/Geometry/Hodge/Mixed/Basic.lean): Existing integral/rational/complex models with bounded increasing rational weight filtration, bounded decreasing complex Hodge filtration and pure graded pieces. Use its rational-module specialization; do not introduce a competing Hodge carrier.
- **mathlib:SymmetricPower** (Mathlib/LinearAlgebra/TensorPower/Symmetric.lean): The symmetric tensor-power module is the additive-congruence quotient of the tensor power by permutation relations over a commutative semiring. This supplies the underlying local module, not an induced connection or holonomic functor.

**reviewedCoverage:** data/library-coverage.json: inspected FiniteFieldsAndCharacterSums:FF.1, ArithmeticGaloisRepresentations:R01.2 and the built Hodge-structure layers; no Kloosterman-specific layer existed for this new roadmap. The audit does not establish the missing Hodge-module or Nori-weight inputs.

**currentLibrary:** Searched current Tau Ceti and Mathlib sources for Kloosterman, holonomic/DModule, Nori motives and irregular Hodge constructions; no implementation matching these targets found. Read AddChar, finite-field trace, Gamma and MixedHodgeStructure at the exact pins; the seven baseline entries give only their inspected contracts, including the local symmetric tensor-power module.

**currentRoadmaps:** Read current TauCetiRoadmap ArithmeticDirichletSeries and ProfiniteArithmetic for structure and suppliers; searched the current tree, including the nine post-snapshot roadmaps, and their Suggested files. Read AnalyticToricGeometry’s actual algebraic supplier and inspected the toric library; consumed its implemented fan/gluing carriers rather than replanning them. No Kloosterman target found.

**linksChecked:** No links or reserved stages for KloostermanMomentsAndPotentialAutomorphy or MixedHodgeModulesAndIrregularHodgeTheory were found. Route coverage records all 49 coalesced extraction items.

**scope:** No generic MHS, potential-automorphy, gamma-recipe, epsilon-factor, conductor or pure-associated-graded WD node is recreated.

The existing generic potential-automorphy and L-function consequences are imported from ModularityAndLanglandsExtensions:ML.2; epsilon factors and conductors from ArithmeticGaloisRepresentations:R01.2–R01.3; the archimedean recipe from ML.0; and Nori motives from MotivesAndAlgebraicCycles:MC.5, with its missing weight/realization extension made explicit. The signed fan and Kloosterman computations belong here; the fan, affine toric schemes and gluing machinery are Tau Ceti’s. The arithmetic extension of the current complex toric supplier is a request, not a duplicate construction.

The period inputs are supplied by PadicHodgeTheory:R06.2/admissible-category-tannakian, /ddr-exact-strict-tensor, /dst-exact-tensor-fully-faithful, /admissible-implies-weakly-admissible and /hodge-tate-weight-convention. Their exact statements were inspected; the weight-label dictionary above applies at every import. Rational perverse coefficients are supplied by EtaleDualityAndPerverseSheaves:EDC.6/rational-perverse-coefficient-extension in addition to the finite-coefficient EDC.5 theorem.

## Layer overview

| Layer | Targets | Role |
| --- | ---: | --- |
| [KM.0](#km0) | 4 | Finite sums and symmetric-power moments |
| [KM.1](#km1) | 6 | Kloosterman sheaves and normalized monodromy |
| [KM.2](#km2) | 6 | Connections in every rank |
| [KM.3](#km3) | 6 | Exponential cohomology and middle extensions |
| [KM.4](#km4) | 6 | Classical Hodge structures and moment motives |
| [KM.5](#km5) | 6 | Rank-two local structure and explicit bases |
| [KM.6](#km6) | 6 | Compactifications and Hodge numbers |
| [KM.7](#km7) | 4 | Arithmetic models and Galois realizations |
| [KM.8](#km8) | 6 | Local factors and conductors |
| [KM.9](#km9) | 3 | p-adic comparison and compatible systems |
| [KM.10](#km10) | 4 | Gamma factors and completion |
| [KM.11](#km11) | 5 | Potential automorphy and functional equations |

<a id="km0"></a>
## KM.0: Finite sums and symmetric-power moments

Define the raw all-rank finite-field Kloosterman sum, symmetric traces, rank-two moments and their formal generating series. Pin the negative trace convention and distinguish k=0 from k≥1.

**Layer inputs:** Pinned finite sums, rings and characters..

**Atlas planets:** Kloosterman sums; Symmetric-power traces; Symmetric-power moments; Moment generating series.

### KM.0/raw-sum: Kloosterman sums

**Definition.** For a finite field F of q elements, an additive character ψ:F→C× and n≥0, set RawKl_{n+1}(a;ψ)=Σ_{x∈(F×)^n} ψ(Σ_i x_i+a/(Π_i x_i)), for a∈F×. For F/F_p use ψ=ψ_p∘Tr_{F/F_p}, where ψ_p is nontrivial. The empty product defines RawKl_1(a)=ψ(a). The exported all-rank sheaf interface assumes r=n+1≥2.

**Hypotheses.** F a finite field; ψ_p nontrivial when claiming Weil or monodromy conclusions. All summation coordinates and a are units.

**Construction / proof route.**

1. Use the pinned additive-character and finite-field trace carriers.
2. Index the finite sum by functions Fin n→F×; prove reindexing and trace-extension identities by finite-sum congruence.

**Direct inputs:** mathlib:AddChar; mathlib:FiniteField.trace_to_zmod_nondegenerate; mathlib:FiniteField.algebraMap_trace_eq_sum_pow.

**Source:** FSY, §1.1, pp. 2–3. Rank-two raw sums and their symmetric-power moments.
**Source:** XZ, §1.1.2, p. 3. The all-rank finite-field sum and its trace sign.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Moments; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- XZ §1.1.2, p. 3; KloostermanSheavesAndBesselIsocrystals: Supplies the raw trace before the weight-zero normalization.
- KM.0/symmetric-trace; FSY §1.1: Determines the sign of the rank-two eigenvalue sum.

**API.**

- **TauCeti.Kloosterman.rawSum** (constructor): The finite sum above on the existing field and AddChar carriers.
- **TauCeti.Kloosterman.rawSum_reindex** (functoriality): A finite-field isomorphism carrying ψ and a to ψ′ and a′ preserves RawKl.
- **TauCeti.Kloosterman.rawSum_rank_one** (simp): With n=0 the empty-coordinate sum is ψ(a).
- **TauCeti.Kloosterman.rawSum_trivial** (characterisation): For the trivial additive character the value is (q−1)^n; this character does not satisfy purity assertions.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.rawSum_f2**: For n=1, a=1 over F_2 and ψ(1)=−1, the sum is 1.
- **TauCeti.Kloosterman.rawSum_empty**: For n=0 the value is ψ(a), not 1 or zero.
- **TauCeti.Kloosterman.rawSum_trivial_f3**: For n=1 over F_3 and the trivial character the value is 2, distinguishing the nontrivial-character hypothesis.

**Check / worked cases.**

- Over F_2, with ψ(1)=−1, RawKl_2(1)=1.
- The trace of the rank-r sheaf will be (−1)^(r−1) times this raw sum.

### KM.0/symmetric-trace: Symmetric-power traces

**Definition.** Over a commutative ring, define h_0(t,d)=1, h_1(t,d)=t and h_{k+2}(t,d)=t h_{k+1}(t,d)−d h_k(t,d). For roots α+β=t, αβ=d, h_k=Σ_{i=0}^k α^iβ^(k−i); it is the trace of Sym^k of any rank-two endomorphism with trace t and determinant d.

**Hypotheses.** k≥0; commutative coefficient ring; use characteristic zero only for subsequent cohomological realizations.

**Construction / proof route.**

1. Define the recurrence with its two initial values.
2. Prove the root formula by multiplying the geometric-sum expression and cancelling terms; obtain the matrix trace identity by the universal polynomial identity.

**Direct inputs:** mathlib:SymmetricPower.

**Source:** FSY, §1.1, p. 2. Symmetric-power traces; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Moments; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- KM.0/moments; FSY §1.1: Defines moments without choosing an ordering of Frobenius roots.
- KM.1/cohomological-moments: Matches the symmetric-power trace of the sheaf.

**API.**

- **TauCeti.Kloosterman.symmetricTrace** (constructor): The real-bodied two-variable recurrence over any commutative ring.
- **TauCeti.Kloosterman.symmetricTrace_roots** (characterisation): h_k(α+β,αβ)=Σ_i α^iβ^(k−i).
- **TauCeti.Kloosterman.symmetricTrace_map** (functoriality): A ring homomorphism commutes with every h_k.
- **TauCeti.Kloosterman.symmetricTrace_matrix** (compatibility): Trace on Sym^k of a rank-two linear map equals h_k(trace,det).

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.symmetricTrace_zero**: h_0(t,d)=1, including t=d=0.
- **TauCeti.Kloosterman.symmetricTrace_two**: h_2(3,2)=7, whereas 3²=9.
- **TauCeti.Kloosterman.symmetricTrace_repeated**: h_k(2a,a²)=(k+1)a^k, so coincident roots cause no division.

**Check / worked cases.**

- h_2=t²−d, h_3=t³−2dt; these differ from powers of the trace.

### KM.0/moments: Symmetric-power moments

**Definition.** For k≥0 and q=p^m, put m_2^k(q)=Σ_{a∈F_q×} h_k(−RawKl_2(a;ψ_p∘Tr),q). Equivalently, use roots α_a+β_a=−RawKl_2(a;q) and α_aβ_a=q and sum Σ_i α_a^iβ_a^(k−i). The minus sign is fixed even for k=1.

**Hypotheses.** p prime, m≥1 and ψ_p nontrivial; k≥0.

**Construction / proof route.**

1. Combine the finite sums and the symmetric-trace recurrence.
2. Use finite-field isomorphism invariance to remove dependence on a chosen finite-field model; character independence is a theorem in KM.1.

**Direct inputs:** KM.0/raw-sum; KM.0/symmetric-trace.

**Source:** FSY, §1.1, pp. 2–3. Symmetric-power moments; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Moments; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- KM.0/moment-series: The moments supply its logarithmic coefficients.
- FSY §5.1.1: Frobenius determinants recover these finite sums.

**API.**

- **TauCeti.Kloosterman.moment** (constructor): The displayed finite sum of symmetric traces.
- **TauCeti.Kloosterman.moment_roots** (characterisation): Any choices of the two roots with fixed sum and product give the same moment.
- **TauCeti.Kloosterman.moment_fieldIso** (functoriality): Transport along a finite-field isomorphism preserves the moment.
- **TauCeti.Kloosterman.moment_zero** (simp): The zeroth moment is q−1.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.moment_f2_one**: For F_2, ψ(1)=−1, k=1 the value is −1.
- **TauCeti.Kloosterman.moment_f2_three**: For the same field and k=3 the value is 3.
- **TauCeti.Kloosterman.moment_zero_f3**: The zeroth moment over F_3 is 2; a definition summing over all a would give 3.

**Check / worked cases.**

- m_2^0(q)=q−1; over F_2 the first three positive moments are −1,−1,3.

### KM.0/moment-series: Moment generating series

**Definition.** In C[[T]], define Z_k(p;T)=exp(Σ_{m≥1} m_2^k(p^m) T^m/m). The constant coefficient of the exponent is zero, so formal exponential is legitimate. Polynomiality is claimed only for k≥1; for k=0 one obtains (1−T)/(1−pT).

**Hypotheses.** p prime, k≥0; compatible trace characters over all finite extensions.

**Construction / proof route.**

1. Use coefficientwise formal series operations in characteristic zero; construct the series from extension moments.
2. Compare coefficients via T Z′/Z=Σ_{m≥1}m_2^k(p^m)T^m. No analytic convergence is used.

**Direct inputs:** KM.0/moments.

**Source:** FSY, §1.1, pp. 2–3. Moment generating series; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Moments; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- KM.1/cohomological-moments: The trace formula identifies this formal object with a determinant.
- KM.8/degree-formulas: Trivial-factor removal is applied to this polynomial.

**API.**

- **TauCeti.Kloosterman.momentSeries** (constructor): The formal exponential with constant coefficient one.
- **TauCeti.Kloosterman.momentSeries_logDerivative** (characterisation): T Z′=Z Σ_{m≥1}m_2^k(p^m)T^m.
- **TauCeti.Kloosterman.momentSeries_coeff_one** (simp): [T]Z=m_2^k(p).
- **TauCeti.Kloosterman.momentSeries_zero** (characterisation): Z_0=(1−T)/(1−pT), as formal power series.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.momentSeries_const**: The constant coefficient is 1.
- **TauCeti.Kloosterman.momentSeries_f2_k3**: For k=3, p=2, Z=(1−T)(1+4T), hence [T]Z=3.
- **TauCeti.Kloosterman.momentSeries_k0**: For k=0, [T²]Z=p(p−1)≠0; polynomiality cannot be asserted uniformly in k.

**Check / worked cases.**

- The coefficient of T is m_2^k(p); the coefficient of T² is (m_2^k(p)²+m_2^k(p²))/2.

<a id="km1"></a>
## KM.1: Kloosterman sheaves and normalized monodromy

Construct all-rank Deligne sheaves, their weight-zero twists, local structure and normalized monodromy groups. Identify rank-two moment series with Frobenius determinants and prove integrality and polynomiality for k≥1.

**Layer inputs:** KM.0; SchemeAndStackFoundations:SF.2; EtaleDualityAndPerverseSheaves:EDC.1; DeligneWeightsAndPurity:DWP.7; EtaleDualityAndPerverseSheaves:EDC.5; EtaleDualityAndPerverseSheaves:EDC.6.

**Atlas planets:** Kloosterman sheaves; Normalized Kloosterman sheaves; Local structure of Kloosterman sheaves; Kloosterman monodromy groups; Cohomology of Kloosterman moments; Integrality of moment polynomials.

### KM.1/deligne-sheaf: Kloosterman sheaves

**Construction.** For r≥2, p prime and ℓ≠p, choose a nontrivial ψ:F_p→Q̄_ℓ×. On (G_m)^(r−1)×G_m let f(x,z)=Σ_i x_i+z/Π_i x_i and let π be projection to z. Define Kl_r=Rπ_! f*AS_ψ[r−1]. The comparison to Rπ_* is an isomorphism, and the shifted complex is a lisse sheaf in degree zero. Its trace at a∈F_{p^m}× is (−1)^(r−1)RawKl_r(a;ψ∘Tr).

**Hypotheses.** r≥2, ℓ≠p; coefficients contain the values of ψ; geometric Frobenius throughout.

**Construction / proof route.**

1. Import Artin–Schreier sheaves and the six operations through the stated scheme-cohomology request.
2. Apply Deligne’s Kloosterman direct-image construction; concentration and the !→* comparison are part of the target, not definitions by assertion.
3. Check the cohomological shift against the rank-two negative trace.

**Direct inputs:** KM.0/raw-sum; SchemeAndStackFoundations:SF.2; EtaleDualityAndPerverseSheaves:EDC.1.

**Source:** FSY, §1.2, p. 4; §3.2.1, pp. 23–24. The exponential direct image and its cohomological shift, with the torus dimension corrected as in E1.
**Source:** XZ, §1.1.2, p. 3. The rank-r lisse sheaf and its signed trace over finite extensions.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Sheaves; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- XZ §1.1.2; KloostermanSheavesAndBesselIsocrystals: All-rank sheaves are the ℓ-adic side of the companion comparison.
- KM.1/cohomological-moments: Symmetric powers of Kl_2 realize the moments.

**API.**

- **TauCeti.Kloosterman.deligneSheaf** (constructor): The actual shifted direct image with chosen additive character.
- **TauCeti.Kloosterman.deligneSheaf_trace** (characterisation): The trace is (−1)^(r−1) times the raw sum at every finite extension point.
- **TauCeti.Kloosterman.deligneSheaf_baseChange** (functoriality): Extension of the finite field agrees with restriction of the sheaf and trace composition.
- **TauCeti.Kloosterman.deligneSheaf_supportComparison** (equivalence): The !- and *-direct images are naturally isomorphic in this construction.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.deligneSheaf_rank_two_sign**: At a=1 over F_2 its trace is −1, not 1.
- **TauCeti.Kloosterman.deligneSheaf_shift**: The unshifted r−1-dimensional compact direct image is concentrated in degree r−1.
- **TauCeti.Kloosterman.deligneSheaf_rank_one_boundary**: The r=1 sum is the rank-one Artin–Schreier character; exclude it from the r≥2 monodromy table.

**Check / worked cases.**

- Rank two has trace −RawKl_2 and determinant Q̄_ℓ(−1).

### KM.1/normalized-sheaf: Normalized Kloosterman sheaves

**Construction.** Choose c∈Q̄_ℓ with c²=p and the compatible unramified rank-one character whose geometric Frobenius at p is c^(−(r−1)). Define Kl_r^0 as the tensor product of Kl_r with this character. At degree-m points its trace is (−1)^(r−1)c^(−m(r−1))RawKl_r(a;p^m), and it is pure of weight zero. This is XZ’s normalization; for odd r it is an integral Tate twist, whereas even r requires the chosen square root.

**Hypotheses.** r≥2; square-root choice fixed once at p, not chosen separately over each extension.

**Construction / proof route.**

1. Tensor the sheaf with the chosen unramified character.
2. Use the rank-r purity theorem below and show multiplicativity of normalization under extension degree.

**Direct inputs:** KM.1/deligne-sheaf; KM.1/sheaf-structure.

**Source:** XZ, XZ §1.1.2, (1.1.2.1)–(1.1.2.3), p. 3. Normalized Kloosterman sheaves; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Sheaves; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- KM.1/monodromy; XZ §1.1.2: The arithmetic and geometric monodromy groups are compared in weight-zero normalization.
- KloostermanSheavesAndBesselIsocrystals: Exports the precise normalization for all-rank companions.

**API.**

- **TauCeti.Kloosterman.normalizedSheaf** (constructor): The weight-zero twist with its square-root datum.
- **TauCeti.Kloosterman.normalizedSheaf_trace** (characterisation): The normalized trace is (−1)^(r−1)p^(−m(r−1)/2)RawKl_r using c^m.
- **TauCeti.Kloosterman.normalizedSheaf_changeRoot** (compatibility): Changing c to −c tensors by the unramified sign character to the power r−1.
- **TauCeti.Kloosterman.normalizedSheaf_extension** (functoriality): Restriction to F_{p^m} uses the square root c^m.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.normalizedSheaf_rank_two**: Rank two includes the negative sign and the inverse square root.
- **TauCeti.Kloosterman.normalizedSheaf_rank_three**: Rank three is Kl_3(1), using geometric Frobenius p^−1 on Q̄_ℓ(1).
- **TauCeti.Kloosterman.normalizedSheaf_root_change**: For r even the degree-one trace changes sign under c↦−c; for r odd it is unchanged.

**Check / worked cases.**

- The rank-two normalized trace at F_2,a=1 is −1/c.

### KM.1/sheaf-structure: Local structure of Kloosterman sheaves

**Theorem.** Kl_r is geometrically irreducible of rank r and pure of weight r−1. At zero it is tame with a single unipotent Jordan block. At infinity its Swan conductor is one. For r=2 its determinant is Q̄_ℓ(−1), so geometric Frobenius eigenvalues satisfy αβ=q and all complex absolute values equal q^(1/2).

**Hypotheses.** r≥2; p prime, ℓ≠p; nontrivial additive character; all embeddings of algebraic eigenvalues in C.

**Construction / proof route.**

1. Apply the Deligne rank, purity and local-monodromy theorem cited by XZ and FSY.
2. Track the unshifted sheaf convention and extract the rank-two determinant.
3. The original Deligne/Katz proof leaves beyond the statements read here are explicitly recorded in gap G8; do not present the introductory citations as a proof.

**Direct inputs:** KM.1/deligne-sheaf.

**Source:** FSY, §1.2, pp. 4–5; §3.2.1, p. 24. Purity and the rank-two determinant convention.
**Source:** XZ, §1.1.2(i)–(iv), p. 3. Rank, geometric irreducibility, purity, one tame unipotent block at zero and Swan conductor one at infinity.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Sheaves; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- A rank-two fiber has trace −RawKl_2 and determinant q.
- The trivial additive character fails irreducibility and weight r−1.

### KM.1/monodromy: Kloosterman monodromy groups

**Theorem.** For the weight-zero sheaf Kl_r^0, r≥2, the geometric and arithmetic algebraic monodromy groups coincide and are Sp_r if r is even; SL_r if p and r are odd; SO_r if p=2 and r is odd with r≠7; and G_2 in its seven-dimensional standard representation if p=2,r=7. These are groups over the algebraic closure of the coefficient field, with the standard Kloosterman pairing and determinant normalization.

**Hypotheses.** r≥2; normalized sheaf and compatible square root as in KM.1/normalized-sheaf.

**Construction / proof route.**

1. Use Katz’s table as reproduced in XZ, retaining all characteristic-two branches.
2. Use the normalized determinant/pairing to identify arithmetic with geometric monodromy; original proof leaves are gap G8.
3. For finite-field symmetric powers do not infer absence of invariants in the odd-rank SO/G_2 cases.

**Direct inputs:** KM.1/normalized-sheaf; KM.1/sheaf-structure.

**Source:** XZ, §1.1.2, (1.1.2.3), p. 3. The normalized monodromy table, including the G₂ exception at rank seven in characteristic two.
**Source:** FSY, §3.2.1, p. 24. The corresponding monodromy cases used for symmetric-power cohomology.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Sheaves; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- r=7,p=2 gives G_2, not SO_7.
- For p=2, odd r≥3, Sym² of the standard orthogonal representation has an invariant; one cannot discard all H⁰/H².

### KM.1/cohomological-moments: Cohomology of Kloosterman moments

**Theorem.** For k≥1 and ℓ≠p, H_c^i(G_m,F̄_p,Sym^k Kl_2) and H^i vanish outside i=1. With geometric Frobenius F_p, Z_k(p;T)=det(1−T F_p|H_c¹). Define the middle space as im(H_c¹→H¹); it is pure of weight k+1, and its determinant polynomial is M_k. In general rank r, concentration in degree one holds for p odd or for p=2 with r even; outside these cases retain the full alternating trace formula.

**Hypotheses.** Nontrivial additive character, k≥1, ℓ≠p; rational ℓ-adic coefficients.

**Construction / proof route.**

1. Combine symmetric-power traces, the trace formula requested from SF.2 and geometric irreducibility/invariants from monodromy.
2. Use the exact DWP cohomological-bounds node for weights on smooth G_m with lisse coefficients.
3. Apply the formal determinant/logarithm identity to identify every coefficient of Z.

**Direct inputs:** KM.0/moment-series; KM.1/sheaf-structure; KM.1/monodromy; DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6; SchemeAndStackFoundations:SF.2; EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension; EtaleDualityAndPerverseSheaves:EDC.6/rational-perverse-coefficient-extension.

**Source:** FSY, §1.2, pp. 4–5; §3.2.1, pp. 23–25. Cohomology of Kloosterman moments; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Sheaves; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- At k=0 the missing H_c² term gives the rational function (1−T)/(1−pT).
- The pairing on the middle space exchanges reciprocal eigenvalues α and p^(k+1)/α.

### KM.1/moment-integrality: Integrality of moment polynomials

**Theorem.** For every k≥1 and prime p, each m_2^k(p^m) is a rational integer independent of the nontrivial prime-field additive character, and Z_k(p;T) belongs to Z[T] with constant term one. The cases k=1,2 have Z=1−T; k=3 has Z=(1−T)(1−(p/3)p²T); k=4 has Z=1−T for p=2 and (1−T)(1−p²T) for odd p. Here (p/3)=0 when p=3.

**Hypotheses.** k≥1, m≥1; the symmetric-power, rather than ordinary-power, convention.

**Construction / proof route.**

1. Changing ψ_p by a nonzero scalar is absorbed by x↦cx and a↦c²a in rank two; this also proves invariance under cyclotomic Galois automorphisms.
2. Moments are algebraic integers, hence rational integers.
3. The determinant description gives polynomiality; use Galois invariance and integral eigenvalues to obtain integral coefficients.
4. Verify the small cases directly or with the local factors in KM.8.

**Direct inputs:** KM.1/cohomological-moments; KM.0/moments; mathlib:AddChar.sum_eq_ite.

**Source:** FSY, §1.1, pp. 2–3. Integrality of moment polynomials; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Sheaves; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For p=2,k=3, Z=(1−T)(1+4T), agreeing with moment 3.
- For p=3,k=3, the middle factor is 1.

<a id="km2"></a>
## KM.2: Connections in every rank

Construct exponential direct-image connections, cyclic covers and symmetric powers. Prove the hypergeometric, local and differential-Galois descriptions and give the Bessel sign dictionary.

**Layer inputs:** KM.0.

**Atlas planets:** Kloosterman connections; Cyclic Kloosterman cover; Hypergeometric Kloosterman structure; Symmetric Kloosterman connections; Differential Galois groups.

### KM.2/connection: Kloosterman connections

**Construction.** Let K have characteristic zero, r=n+1≥2 and f_r(x,z)=Σ_{i=1}^n x_i+z/(Π_i x_i) on G_m^n×G_m. Fix E^f=(O,d+df), viewed as a left connection module. Define Kl_r=π_+E^f, with the direct-image convention normalized so it is a connection in degree zero. It descends to Q and has a cyclic presentation D_Gm/D_Gm((z∂_z)^r−z).

**Hypotheses.** Smooth algebraic tori over a characteristic-zero field. Holonomic operations and their cohomological shift convention supplied by gap G1.

**Construction / proof route.**

1. Use the exponential connection and the actual relative de Rham direct-image complex.
2. Compute the Koszul reduction to the cyclic hypergeometric generator as in FSY Proposition 2.4.
3. Keep the operator presentation as an equivalence theorem, not a replacement for the direct-image construction.

**Direct inputs:** KM.0/raw-sum.

**Source:** FSY, §2.1, Proposition 2.4 and Lemma 2.5, pp. 10–12. Kloosterman connections; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Connections; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- KM.2/bessel-dictionary; XZ §1.1.1: Provides the all-rank de Rham foundation for the Bessel equation.
- KM.3/tensor-potentials; FSY §2.2: Tensor products are realized by sums of the exponential potentials.

**API.**

- **TauCeti.Kloosterman.connection** (constructor): The relative exponential direct image on G_m.
- **TauCeti.Kloosterman.connection_cyclic** (equivalence): An isomorphism with the cyclic left D-module of θ^r−z.
- **TauCeti.Kloosterman.connection_scalarExtension** (functoriality): Characteristic-zero scalar extension commutes with Kl_r and its rational model.
- **TauCeti.Kloosterman.connection_rank** (characterisation): The underlying O_Gm-module is free of rank r.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.connection_rank_two**: The classes 1,θ form a basis and θ²=z.
- **TauCeti.Kloosterman.connection_not_regular_infinity**: For r=2 the formal slopes at infinity are 1/2, so a regular-singular replacement fails.
- **TauCeti.Kloosterman.connection_sign**: For E^f=d+df use θ^r−z on the cyclic module; replacing f by −f pulls back z by (−1)^r.

**Check / worked cases.**

- At r=2 one obtains θ²−z with θ=z∂_z.

### KM.2/cyclic-cover: Cyclic Kloosterman cover

**Definition.** For r=n+1≥2 let [r]:G_m,t→G_m,z be z=t^r and define tildeKl_r=[r]^+Kl_r. Under x_i=t y_i the pulled-back potential is t g_r(y), where g_r(y)=Σ_i y_i+1/Π_i y_i. Deck transformations act by (t,y)↦(ζt,ζ^−1y) for ζ∈μ_r, and Kl_r is recovered by descent/invariants.

**Hypotheses.** Characteristic zero; r≥2; the μ_r-action is algebraic before adjoining roots of unity.

**Construction / proof route.**

1. Perform the explicit coordinate change.
2. Construct the equivariant structure from the cyclic pullback and use finite étale descent; invert r in the characteristic-zero coefficients.

**Direct inputs:** KM.2/connection.

**Source:** FSY, §2.1, pp. 10–12; §3.1, pp. 21–22. Cyclic Kloosterman cover; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Connections; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- FSY Theorem 3.2: The product potential t g permits the classical-Hodge criterion.
- KM.3/sign-projector: The μ_r-invariants are combined with the symmetric projector.

**API.**

- **TauCeti.Kloosterman.cyclicConnection** (constructor): The pullback connection along z=t^r.
- **TauCeti.Kloosterman.cyclicPotential** (data): The potential t(Σ y_i+1/Π y_i).
- **TauCeti.Kloosterman.cyclicConnection_deck** (structure): The μ_r-equivariant structure with y scaled by ζ^−1.
- **TauCeti.Kloosterman.cyclicConnection_descent** (equivalence): The descended invariant object is Kl_r.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.cyclicConnection_two**: At r=2, f=x+z/x becomes t(y+y^−1).
- **TauCeti.Kloosterman.cyclicConnection_three_action**: At r=3, scaling y by ζ rather than ζ^−1 fails invariance of t g except in special cases.
- **TauCeti.Kloosterman.cyclicConnection_rank**: The pulled-back rank stays r; it is not multiplied by the degree r.

**Check / worked cases.**

- For r=2, t(y+y^−1) is invariant under (t,y)↦(−t,−y).

### KM.2/connection-structure: Hypergeometric Kloosterman structure

**Theorem.** Kl_r is regular singular at zero with one unipotent Jordan block, and at infinity has pure slope 1/r and irregularity one. Its dual is ι_r^+Kl_r, where ι_r(z)=(−1)^r z. The cyclic pullback is a localized Fourier transform of the regular holonomic Gauss–Manin object g_{r,+}O_{G_m^(r−1)}. The rank recursion is Kl_{r+1}=j_0^+ FT(j_{0,+} inv^+Kl_r), with the source direct-image/localization conventions fixed in G1.

**Hypotheses.** r≥2, characteristic zero; FT uses kernel E^{tτ} consistently with E^f=d+df.

**Construction / proof route.**

1. Use the cyclic operator to compute the logarithmic lattice at zero.
2. Use the cyclic cover to read the exponential factors and divide their slope by r.
3. Identify duality and the rank recursion through inversion and Fourier transform.

**Direct inputs:** KM.2/connection; KM.2/cyclic-cover.

**Source:** FSY, Proposition 2.4 and Lemma 2.5, pp. 10–12. Hypergeometric Kloosterman structure; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Connections; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- Rank r has irregularity r·(1/r)=1.
- For odd r the dual requires z↦−z; for even r it is self-dual.

### KM.2/symmetric-connections: Symmetric Kloosterman connections

**Construction.** For k≥1 form Sym^k Kl_r and Sym^k tildeKl_r by applying the existing module SymmetricPower locally and equipping it with the induced connection from G1. The rank is binomial(r−1+k,k); tensor and differential actions obey the Leibniz rule. The rational structure and deck action are inherited functorially.

**Hypotheses.** r≥2, k≥1, characteristic zero; symmetric powers are over the structure sheaf in characteristic zero, not a divided-power integral replacement.

**Construction / proof route.**

1. Take the signed-free symmetric quotient of tensor powers of the underlying vector bundle; the connection descends by the Leibniz rule.
2. Use the pinned module quotient locally; G1 must supply its descent and induced-connection functor, including scalar and pullback compatibility.

**Direct inputs:** KM.2/connection; KM.2/cyclic-cover; mathlib:SymmetricPower.

**Source:** FSY, §2.1, Proposition 2.7, p. 12; §2.2, pp. 13–14. Symmetric Kloosterman connections; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Connections; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- KM.3/de-rham-realization: Positive symmetric powers have cohomology concentrated in degree one.
- KM.5/rank-two-frame: The Leibniz action becomes an explicit sparse matrix.

**API.**

- **TauCeti.Kloosterman.symmetricConnection** (constructor): Sym^k Kl_r with its induced connection.
- **TauCeti.Kloosterman.symmetricConnection_rank** (characterisation): Rank binomial(r−1+k,k).
- **TauCeti.Kloosterman.symmetricConnection_leibniz** (simp): The differential on a symmetric monomial differentiates each factor with its multiplicity.
- **TauCeti.Kloosterman.symmetricConnection_pullback** (compatibility): Cyclic pullback commutes with Sym^k and its μ_r-action.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.symmetricConnection_two_two**: For r=2,k=2 the rank is 3, not 4.
- **TauCeti.Kloosterman.symmetricConnection_one**: For k=1 it agrees with Kl_r, including its connection.
- **TauCeti.Kloosterman.symmetricConnection_zero_boundary**: The natural k=0 extension is the trivial rank-one connection and is excluded from the positive-k irreducibility/cohomology assertions.

**Check / worked cases.**

- For r=2 the rank is k+1.

### KM.2/differential-galois: Differential Galois groups

**Theorem.** Over C the differential Galois groups of Kl_r and tildeKl_r are SL_r for odd r and Sp_r for even r. Consequently, for k≥1 both symmetric powers are irreducible of rank binomial(r−1+k,k). This characteristic-zero statement has no SO/G_2 branch.

**Hypotheses.** r≥2, k≥1; differential Galois group in the standard faithful representation.

**Construction / proof route.**

1. Apply Katz’s differential-Galois result as used in FSY Proposition 2.7; missing original proof decomposition is G8.
2. Check that the cyclic pullback has the same connected group.
3. Use irreducibility of symmetric powers of the standard SL or Sp representation.

**Direct inputs:** KM.2/connection-structure; KM.2/symmetric-connections.

**Source:** FSY, Proposition 2.7, p. 12. Differential Galois groups; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Connections; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For r=2 every positive symmetric power is irreducible.
- Do not transfer this conclusion to Sym² of odd-rank characteristic-two orthogonal sheaves.

### KM.2/bessel-dictionary: Bessel connection dictionary

**Comparison.** For λ∈K×, the rank-r Bessel connection d+M(x)dx/x with superdiagonal ones and lower-left entry λ^r x is identified with the pullback of Kl_r along z=λ^r x, after choosing the cyclic last basis vector and matching the transpose convention. The cyclic module generator satisfies θ^r−λ^r x. Horizontal coefficient vectors solve the dual system; their first coefficient satisfies θ^r f−(−1)^r λ^r x f=0. Thus a statement about horizontal solutions must specify the dual or replace λ by −λ. Replacing E^{λs}=(O,d+λds) by E^{−λs} pulls the Kloosterman object back by x↦(−1)^r x.

**Hypotheses.** r≥2, characteristic zero, λ≠0; left connection modules, not an unidentified solution functor.

**Construction / proof route.**

1. Write the cyclic basis θ^i e and rescale to the Bessel matrix.
2. Derive the horizontal coefficient recurrence θf_i=−f_{i+1} and its last equation, giving the parity sign.
3. Use the convention of XZ §4.1.13 rather than combining its two exponential signs; source issue E8 records the discrepancy.

**Direct inputs:** KM.2/connection-structure.

**Source:** XZ, XZ §1.1.1, (1.1.1.1)–(1.1.1.6), pp. 2–3; §4.1.13, p. 42. Bessel connection dictionary; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Connections; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For odd r the module equation and scalar equation on horizontal first coefficients have opposite signs.
- λ=0 gives a connection regular at infinity and is excluded from the Kloosterman irregularity-one assertion.

<a id="km3"></a>
## KM.3: Exponential cohomology and middle extensions

Construct tensor potentials and the signed symmetric projector; prove Thom–Sebastiani, de Rham concentration, duality and support-to-ordinary middle identifications. Construct the Kloosterman inverse Fourier objects using imported holonomic and Hodge-module formalism.

**Layer inputs:** KM.2.

**Atlas planets:** Tensor Kloosterman potentials; Signed symmetric projector; Tensor Thom–Sebastiani comparison; Middle Kloosterman cohomology; Exponential de Rham realization; Inverse Fourier Kloosterman objects.

### KM.3/tensor-potentials: Tensor Kloosterman potentials

**Definition.** For r=n+1≥2 and k≥1 define f_{r,k}(x,z)=Σ_{j=1}^k(Σ_{i=1}^n x_{ij}+z/Π_i x_{ij}) on G_m^(nk+1), and g_{r,k}(y)=Σ_j(Σ_i y_{ij}+1/Π_i y_{ij}) on G_m^(nk). After z=t^r,x_{ij}=t y_{ij}, the cover potential is tildef=t g_{r,k}. S_k permutes blocks and μ_r scales all y by ζ^−1 while t↦ζt.

**Hypotheses.** r≥2, k≥1; use characteristic-zero exponential modules or characteristic-p Artin–Schreier coefficients as specified by the realization.

**Construction / proof route.**

1. Form the sums on products of the original torus, without confusing n with nk.
2. Check equivariance and the coordinate substitution term by term.

**Direct inputs:** KM.2/cyclic-cover.

**Source:** FSY, §2.2, (2.8)–(2.9), pp. 13–14; §3.1, (3.9), p. 21. Tensor Kloosterman potentials; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Exponential; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- FSY Proposition 2.10: Relative direct images realize tensor powers.
- KM.4/hypersurface: The zero locus g=0 replaces the product-potential cohomology.

**API.**

- **TauCeti.Kloosterman.tensorPotential** (constructor): The sum of k rank-r potentials sharing z.
- **TauCeti.Kloosterman.coverTensorPotential** (data): The product t g_{r,k} after the cyclic substitution.
- **TauCeti.Kloosterman.tensorPotential_action** (structure): The S_k×μ_r action and invariance of tildef.
- **TauCeti.Kloosterman.tensorPotential_one** (compatibility): For k=1 this is the original potential, with no extra coordinates.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.tensorPotential_two_two**: For r=2,k=2, tildef=t(y_1+y_1^−1+y_2+y_2^−1).
- **TauCeti.Kloosterman.tensorPotential_dimensions**: For r=3,k=2 the y-torus has dimension 4 and the exponential torus dimension 5.
- **TauCeti.Kloosterman.tensorPotential_deck**: The action y↦ζ^−1y is needed for r=3; using ζy does not preserve t g.

**Check / worked cases.**

- The hypersurface g=0 has expected dimension nk−1; the exponential torus has dimension nk+1.

### KM.3/sign-projector: Signed symmetric projector

**Construction.** With n=r−1 let χ_n(σ)=sgn(σ)^n on S_k and trivial on μ_r. For a rational linear cohomological action of S_k×μ_r define e_χ=(k!r)^−1 Σ_{σ,ζ}sgn(σ)^n(σ,ζ), and take its image. The sign compensates for permuting n-dimensional differential blocks, so Sym^k of the connection corresponds to this isotypic piece of exponential cohomology. The same rational projector is used in motives and ℓ-adic cohomology.

**Hypotheses.** Characteristic-zero coefficients; μ_r interpreted geometrically with descent. In characteristic p the nonreduced part is handled separately in KM.4/finite-field-realization.

**Construction / proof route.**

1. Average the character action and prove idempotence by reindexing the group sum.
2. Compute the Koszul sign from swapping blocks of degree n and compare to the unsigned symmetric power before the cohomological shift.

**Direct inputs:** KM.3/tensor-potentials; KM.2/symmetric-connections.

**Source:** FSY, §2.2, proof of Proposition 2.13, pp. 14–15; §3.1, pp. 21–22. Signed symmetric projector; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Exponential; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- KM.4/middle-motive: Cuts out the symmetric-power moment motive as an actual direct summand.
- KM.4/finite-field-realization: Carries signed symmetric extraction through trace and weight functors.

**API.**

- **TauCeti.Kloosterman.signedProjector** (constructor): The rational averaging idempotent e_χ.
- **TauCeti.Kloosterman.signedProjector_image** (characterisation): v is in its image iff σv=sgn(σ)^n v and ζv=v.
- **TauCeti.Kloosterman.signedProjector_functor** (functoriality): Every equivariant linear map commutes with e_χ and induces a map on its image.
- **TauCeti.Kloosterman.signedProjector_realization** (compatibility): Exact rational realization functors preserve the projector image.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.signedProjector_transposition**: For r=2,k=2 a transposition acts by −1 on the selected cohomology.
- **TauCeti.Kloosterman.signedProjector_even_block**: For r=3,k=2 a transposition acts by +1.
- **TauCeti.Kloosterman.signedProjector_denominator**: Over Q_ℓ the projector remains defined when ℓ divides k!r; an integral projector with those denominators is not claimed.

**Check / worked cases.**

- For r=2 the S_k action is the sign-isotypic piece; for r=3 it is the invariant piece.

### KM.3/thom-sebastiani: Tensor Thom–Sebastiani comparison

**Theorem.** The relative exponential direct image for f_{r,k} is canonically Kl_r^⊗k, and for tildef it is tildeKl_r^⊗k. The comparison is S_k-equivariant with the cohomological sign convention above, commutes with cyclic pullback, and identifies H¹_dR of these tensor powers with H^{nk+1}_dR of the corresponding exponential torus.

**Hypotheses.** r=n+1≥2, k≥1, characteristic zero; relative direct images normalized as in KM.2.

**Construction / proof route.**

1. Apply relative Künneth to the k factors sharing the base coordinate.
2. Identify the tensor product of exponentials with the exponential of the sum.
3. Use the Leray comparison and the relative degree nk; include the one-dimensional base degree.

**Direct inputs:** KM.3/tensor-potentials; KM.2/connection.

**Source:** FSY, Proposition 2.10 and Corollary 2.11, pp. 13–14. Tensor Thom–Sebastiani comparison; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Exponential; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For k=1 the comparison is the original relative de Rham direct image.
- The resulting cohomological degree is nk+1, not nk.

### KM.3/middle-cohomology: Middle Kloosterman cohomology

**Definition.** For E=Sym^k Kl_r or its cyclic pullback, define H¹_dR,mid(G_m,E)=im(H¹_dR,c(G_m,E)→H¹_dR(G_m,E)). With j:G_m→P¹ this is H¹_dR(P¹,j_{†+}E), where j_{†+} is the image of the holonomic !→+ map. Retain the actual comparison maps, not merely a dimension-equal vector space.

**Hypotheses.** r≥2,k≥1, characteristic zero; finite-dimensional de Rham groups and abelian holonomic image available through G1.

**Construction / proof route.**

1. Construct the natural support-to-ordinary morphism and its image.
2. Use the no-boundary-subquotient characterization of the holonomic intermediate extension from G1.
3. The analogous étale intermediate-extension interface does not supply this holonomic construction; its exact missing input remains G1.

**Direct inputs:** KM.2/symmetric-connections.

**Source:** FSY, Corollary 2.15, pp. 15–16. Middle Kloosterman cohomology; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Exponential; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- FSY Theorem 3.2: The pure lowest-weight part is exactly this image.
- KM.4/middle-motive: The de Rham realization of the motive must recover this space with its pairing.

**API.**

- **TauCeti.Kloosterman.middleDeRham** (constructor): The image of the support-to-ordinary map.
- **TauCeti.Kloosterman.middleDeRham_maps** (data): The canonical surjection from H¹_c and injection into H¹.
- **TauCeti.Kloosterman.middleDeRham_intermediate** (equivalence): Identification with H¹(P¹,j_{†+}E), compatible with these two maps.
- **TauCeti.Kloosterman.middleDeRham_duality** (compatibility): The support/ordinary duality descends to the perfect middle pairing.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.middleDeRham_k1**: For r=2,k=1 the middle group is zero but full H¹ has dimension one.
- **TauCeti.Kloosterman.middleDeRham_k3**: For r=2,k=3 the middle dimension is one, full dimension two.
- **TauCeti.Kloosterman.middleDeRham_k4**: For r=2,k=4 the middle group is zero although full H¹ has dimension two.

**Check / worked cases.**

- Middle is an image, and generally differs from either H¹_c or H¹.

### KM.3/de-rham-realization: Exponential de Rham realization

**Theorem.** For r=n+1≥2,k≥1, ordinary, compact-support and middle de Rham cohomology of Sym^k Kl_r and its cyclic pullback vanish in degrees other than one. Degree one is identified with the corresponding χ_n-isotypic H^{nk+1} of the exponential torus. There is a perfect middle pairing to K with symmetry sign (−1)^(nk+1); with Hodge structures it takes values in Q(−nk−1).

**Hypotheses.** Characteristic zero, r≥2,k≥1; χ_n and the μ_r action fixed above.

**Construction / proof route.**

1. Use irreducibility to remove H⁰ and duality to remove H²_c.
2. Apply the tensor Thom–Sebastiani comparison and signed projector.
3. Compare supports and intermediate extensions, then descend the graded-symmetric Poincaré pairing.

**Direct inputs:** KM.2/differential-galois; KM.3/thom-sebastiani; KM.3/sign-projector; KM.3/middle-cohomology.

**Source:** FSY, Proposition 2.13 and Corollary 2.15, pp. 15–16. Exponential de Rham realization; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Exponential; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For r=2 the middle pairing is symmetric for odd k and alternating for even k.
- A middle pairing with the opposite sign fails at k=3 versus k=6.

### KM.3/inverse-fourier: Inverse Fourier Kloosterman objects

**Construction.** Let Mtilde=FT^−1(j_{0,†+}Sym^k tildeKl_r) and let Π be the exponential projector on regular holonomic objects. Construct a regular holonomic M and an exact sequence 0→M→ΠM→M′→0 identifying ΠM with Mtilde. Here M is the image of the support-to-ordinary Gauss–Manin morphism for g_{r,k}; it has an irreducible pure Hodge-module lift M^H of weight nk. The quotient has weights ≥nk+1 and, for r=2, is pure of weight 2k+1.

**Hypotheses.** r=n+1≥2,k≥1, characteristic zero; Hodge-module and Fourier/projector contracts G1–G2.

**Construction / proof route.**

1. Express the inverse Fourier transform as the exponential projection of the regular Gauss–Manin object.
2. Take the support-to-ordinary image before applying Π and prove exactness.
3. Use generic Hodge-module direct-image weights from G2 and irreducibility from KM.2; do not construct a new general MHM category here.

**Direct inputs:** KM.3/de-rham-realization; KM.3/tensor-potentials.

**Source:** FSY, Proposition 2.21 and Lemma 2.24, pp. 16–18. Inverse Fourier Kloosterman objects; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Exponential; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- FSY Theorem 3.2: Transfers classical Hodge-module weights to exponential cohomology.
- KM.5/inverse-fourier-local: The rank-two singularities and monodromies make this object explicit.

**API.**

- **TauCeti.Kloosterman.inverseFourierObject** (constructor): FT^−1 of the intermediate extension of Sym^k tildeKl_r.
- **TauCeti.Kloosterman.gaussManinMiddle** (constructor): M as the actual image of the support Gauss–Manin map.
- **TauCeti.Kloosterman.inverseFourier_exact** (structure): The exact sequence with explicit inclusion and quotient M′.
- **TauCeti.Kloosterman.gaussManinMiddle_hodge** (compatibility): The pure Hodge-module lift forgets to M and has weight nk.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.inverseFourier_rank_two**: For r=2 the ranks are rank ΠM=k+1 and rank M=k.
- **TauCeti.Kloosterman.inverseFourier_weights**: The pure Hodge-module M has weight nk, not nk+1; the degree-one fiber has the latter weight.
- **TauCeti.Kloosterman.inverseFourier_quotient_weight**: At r=2 the quotient weight is 2k+1, distinguishing ordinary MHM weights from exponential-projector weights.

**Check / worked cases.**

- The subobject M is regular and pure while ΠM need not be pure as an ordinary mixed Hodge module.

<a id="km4"></a>
## KM.4: Classical Hodge structures and moment motives

Prove classicality and weight bounds, define the zero-locus hypersurface and its Nori middle motive, and identify de Rham, finite-field étale and rigid realizations, including inseparable-cover cases.

**Layer inputs:** KM.3; MotivesAndAlgebraicCycles:MC.5; DeligneWeightsAndPurity:DWP.7; KM.1; EtaleDualityAndPerverseSheaves:EDC.1; EtaleDualityAndPerverseSheaves:EDC.2; PadicDifferentialEquationsAndRigidCohomology:RD.4; PadicDifferentialEquationsAndRigidCohomology:RD.6.

**Atlas planets:** Classicality of moment cohomology; Kloosterman moment hypersurface; Hypersurface realization of middle cohomology; Kloosterman middle motive; Finite-field hypersurface comparison; Rigid Kloosterman realization.

### KM.4/classical-hodge: Classicality of moment cohomology

**Theorem.** For r=n+1≥2,k≥1, the exponential objects realizing H¹, H¹_c and H¹_mid of Sym^k Kl_r and its cyclic pullback lie in the classical rational mixed-Hodge subcategory. Their irregular Hodge filtrations agree with the ordinary Hodge filtrations. The weights are respectively ≥nk+1, ≤nk+1 and pure nk+1. The maps on gr^W_{nk+1} identify both extreme graded pieces with middle cohomology, and H¹_mid=W_{nk+1}H¹. The perfect pairing has target Q(−nk−1) and sign (−1)^(nk+1).

**Hypotheses.** r≥2,k≥1; use rational mixed Hodge structures on Tau Ceti’s existing carrier, with exact rational models.

**Construction / proof route.**

1. Apply the product-potential classicality criterion A.24 to t g_{r,k} using the constant A¹ factor; its general proof is supplier gap G2.
2. Transfer through the signed projector and finite cyclic descent.
3. Use the pure Gauss–Manin subobject and strictness of weights to identify the lowest-weight image, with ordinary Hodge carriers imported from the pin.

**Direct inputs:** KM.3/inverse-fourier; KM.3/de-rham-realization; tauceti:TauCeti.Hodge.MixedHodgeStructure.

**Source:** FSY, Theorem 3.2, pp. 19–21; Theorem A.24, pp. 68–70. Classicality of moment cohomology; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Motives; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- The assertion is classicality, not merely existence of an exponential mixed Hodge object.
- For r=2 the pure weight is k+1.

### KM.4/hypersurface: Kloosterman moment hypersurface

**Definition.** For r=n+1≥2,k≥1 with nk≥2, let K_{r,k}⊂G_m^(nk) be the zero scheme of g_{r,k}=Σ_j(Σ_i y_{ij}+1/Π_i y_{ij}). Give it the block-permutation S_k action and diagonal μ_r action y_{ij}↦ζ^−1y_{ij}. It is defined over Q and over Z by the same Laurent equation; the zero-locus construction is independent of a choice of roots of unity.

**Hypotheses.** nk≥2 for the middle-motive formula in degree nk−1; coefficient and smoothness assumptions are stated separately in each realization.

**Construction / proof route.**

1. Take the closed subscheme of the Laurent polynomial torus and construct the action from invariance of its vanishing ideal.
2. Descend the μ_r action over Q instead of replacing it by chosen complex points.

**Direct inputs:** KM.3/tensor-potentials; KM.3/sign-projector.

**Source:** FSY, §3 introduction, (3.1), p. 18; Theorem 3.8 and (3.9), pp. 21–23. Kloosterman moment hypersurface; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Motives; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- FSY Theorem 3.8: Ordinary hypersurface cohomology identifies the pure middle Hodge structure.
- KM.7/galois-realization: An integral model controls bad-prime vanishing cycles.

**API.**

- **TauCeti.Kloosterman.momentHypersurface** (constructor): The closed zero scheme in the torus over the admitted base.
- **TauCeti.Kloosterman.momentHypersurface_action** (structure): The S_k×μ_r scheme action with inverse scalar on y.
- **TauCeti.Kloosterman.momentHypersurface_baseChange** (functoriality): Every base change carries the Laurent zero scheme and its action to the corresponding construction.
- **TauCeti.Kloosterman.momentHypersurface_equation** (characterisation): A torus point lies on K exactly when g_{r,k}=0.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.momentHypersurface_two**: At r=2,k=2, the numerator factors as (y_1+y_2)(1+y_1 y_2).
- **TauCeti.Kloosterman.momentHypersurface_k3_signs**: At r=2,k=3, a point with all coordinates ±1 is not a zero over Q, since an odd sum of ±1 is nonzero.
- **TauCeti.Kloosterman.momentHypersurface_deck**: For r=3, ζ^−1 scales g by ζ^−1, preserving the zero locus even though g is not invariant as a function.

**Check / worked cases.**

- For r=2,k=2, the Laurent equation factors after clearing denominators and the hypersurface is singular; smoothness is not part of the definition.

### KM.4/hypersurface-comparison: Hypersurface realization of middle cohomology

**Theorem.** For nk≥2 there are natural S_k×μ_r-equivariant identifications H¹_dR,mid(G_m,Sym^k Kl_r)≅(gr^W_{nk−1}H_c^{nk−1}(K_{r,k},Q))^χ_n(−1)≅(gr^W_{nk+1}H_{K_{r,k}}^{nk+1}(G_m^(nk),Q))^χ_n. If K_{r,k} is smooth, the support expression equals (gr^W_{nk−1}H^{nk−1}(K_{r,k},Q))^χ_n(−1). These are filtered Hodge isomorphisms preserving the middle pairing and rational structures.

**Hypotheses.** r=n+1≥2,k≥1,nk≥2; the final ordinary-cohomology form additionally assumes the hypersurface smooth.

**Construction / proof route.**

1. Use the product-potential localization isomorphism A.27: H_c^a(A¹×V,tg)=H_c^{a−2}(K)(−1); retain local cohomology for the ordinary version when K is singular.
2. Remove the t=0 piece and compare lowest weight as in Theorem 3.8.
3. Apply e_χ and the classicality theorem; the generic exponential localization theorem remains in G2.

**Direct inputs:** KM.4/classical-hodge; KM.4/hypersurface; KM.3/sign-projector.

**Source:** FSY, Theorem 3.8, pp. 21–23; Example A.27, pp. 70–71. Hypersurface realization of middle cohomology; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Motives; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- The twist (−1) raises weight nk−1 to nk+1.
- No smoothness assumption is silently added to the singular-support version.

### KM.4/middle-motive: Kloosterman middle motive

**Construction.** In the rational Nori category over Q define M_{r,k}=(gr^W_{nk−1}H_c^{nk−1}(K_{r,k}))^χ_n(−1), equivalently gr^W_{nk+1} of the twisted compact-support object. Here W must be the functorial Nori weight filtration compatible with realizations, not a filtration chosen on one realization. For r=2 write M_k; define the exceptional k=1 case as the zero motive, consistent with its vanishing middle cohomology.

**Hypotheses.** r=n+1≥2,k≥1,nk≥2 for the geometric formula; rational coefficients split the finite projector. The Nori weight and realization contract is request MC.5 and gap G3.

**Construction / proof route.**

1. Import the Nori category, tensor structure and cohomology-with-supports nodes.
2. Construct compact support from the algebraic pair, apply the functorial weight graded piece, take the projector image and Tate-twist.
3. Transport the hypersurface comparison through exact realizations; do not identify Nori motives with numerical or arbitrary Voevodsky motives.

**Direct inputs:** KM.4/hypersurface-comparison; MotivesAndAlgebraicCycles:MC.5/nori-motives; MotivesAndAlgebraicCycles:MC.5/nori-tensor-category; MotivesAndAlgebraicCycles:MC.5/cohomology-with-supports; MotivesAndAlgebraicCycles:MC.5.

**Source:** FSY, (3.1), p. 18; §3.1, pp. 21–23. Kloosterman middle motive; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Motives; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- KM.7/galois-realization: Produces a geometric family of ℓ-adic representations.
- FSY §5.3.3: The orthogonal odd-k motive is the input for the root-number application.

**API.**

- **TauCeti.Kloosterman.middleMotive** (constructor): The weight-graded compact-support Nori object cut out by e_χ and twisted by (−1).
- **TauCeti.Kloosterman.middleMotive_deRham** (compatibility): Its filtered de Rham realization is H¹_dR,mid with its rational structure.
- **TauCeti.Kloosterman.middleMotive_etale** (compatibility): Its ℓ-adic realization is the same projector on gr^W H_c with the same Tate twist.
- **TauCeti.Kloosterman.middleMotive_pairing** (structure): The realization-compatible perfect pairing of sign (−1)^(nk+1), valued in Q(−nk−1).

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.middleMotive_weight**: For r=2,k=3 the motive has weight 4, not weight 2.
- **TauCeti.Kloosterman.middleMotive_zero_cases**: M_1,M_2,M_4 have zero Betti/de Rham/étale realizations; do not conclude an arbitrary unrelated motive category has no phantom objects.
- **TauCeti.Kloosterman.middleMotive_projector**: For r=2 the S_k-isotypic character is sign; replacing it by invariants changes the selected object.

**Check / worked cases.**

- For rank two the realization dimension is d_k=floor((k−1)/2)−δ_{4|k}; M_1,M_2,M_4 have zero realizations.

### KM.4/finite-field-realization: Finite-field hypersurface comparison

**Theorem.** For r=n+1≥2,k≥1,nk≥2 and ℓ≠p, the middle étale cohomology of Sym^k Kl_r is naturally (gr^W_{nk−1}H_c^{nk−1}(K_{r,k,F̄_p},Q_ℓ(ζ_p)))^χ_n(−1), compatible with geometric Frobenius. If p divides r=p^a m, factor the cyclic map through the degree-m étale cover and a purely inseparable universal homeomorphism; μ_r acts through its reduced μ_m on étale cohomology. This middle statement does not assert full-cohomology concentration in the odd-rank p=2 cases.

**Hypotheses.** ℓ≠p; rational ℓ-adic coefficients; the chosen additive character is realized in Q_ℓ(ζ_p).

**Construction / proof route.**

1. Apply the Artin–Schreier version of the product-potential calculation and localization.
2. Use topological invariance under the purely inseparable factor and exact finite-group projectors.
3. Extract the pure middle weight with DWP; use EDC duality without assuming K smooth.

**Direct inputs:** KM.4/hypersurface; DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6; KM.1/cohomological-moments; EtaleDualityAndPerverseSheaves:EDC.1; EtaleDualityAndPerverseSheaves:EDC.2.

**Source:** FSY, Theorem 3.12, pp. 23–25. Finite-field hypersurface comparison; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Motives; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- The case r=p=2 must work via the inseparable factor, not a fictitious étale μ_2 cover.
- The exponent of the weight before twisting is nk−1.

### KM.4/rigid-realization: Rigid Kloosterman realization

**Theorem.** Let p be prime, K contain a Dwork parameter ϖ with ϖ^(p−1)=−p and use E=(O,d+ϖ dz) with horizontal F*E→E multiplier exp(ϖ(z^p−z)). Match the induced additive character to the chosen ℓ-adic one. The rigid analogues of the tensor/symmetric exponential realization and the hypersurface middle formula hold, with Frobenius, supports, weight grading and Tate twist (−1) preserved. In rank two they identify H¹_rig,mid(G_m,Sym^k Kl_2) with the χ piece of gr^W_{k−1}H_c^{k−1}(K_{2,k})(−1) after extending to K.

**Hypotheses.** Overconvergent F-isocrystal coefficients; k≥1, r≥2,nk≥2 for the hypersurface formula; Frobenius and weights from RD.4–RD.6.

**Construction / proof route.**

1. Use the Dwork coefficient and relative rigid cohomology operations from the requested RD contracts.
2. Repeat the equivariant product-potential localization construction using the geometric Fourier transform.
3. Use the sign convention checked by horizontality; do not infer it from XZ’s printed incompatible choices.

**Direct inputs:** KM.4/hypersurface; KM.3/sign-projector; PadicDifferentialEquationsAndRigidCohomology:RD.4; PadicDifferentialEquationsAndRigidCohomology:RD.6.

**Source:** FSY, §3.2.2, p. 25; Proposition 5.23, pp. 49–50. Rigid exponential and hypersurface realizations with weight grading and Tate twist.
**Source:** XZ, §2.1.5, p. 10; §4.1.13, p. 42. The Dwork exponential coefficient; the printed sign choices require the horizontality correction E8.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Motives; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For d+ϖ dz, exp(ϖ(z−z^p)) has the opposite logarithmic derivative and is not the stated F*→E map.
- Geometric p-Frobenius on the Tate twist (−1) multiplies eigenvalues by p.

<a id="km5"></a>
## KM.5: Rank-two local structure and explicit bases

Compute the symmetric-power connection, its formal type and intermediate extensions, inverse Fourier local structure, cohomological dimensions and explicit de Rham bases.

**Layer inputs:** KM.2; KM.3.

**Atlas planets:** Rank-two Kloosterman frame; Formal symmetric-power decomposition; Symmetric-power intermediate extensions; Local inverse Fourier structure; Dimensions of moment cohomology; Explicit moment de Rham bases.

### KM.5/rank-two-frame: Rank-two Kloosterman frame

**Definition.** Fix the cyclic basis v_0,v_1 of Kl_2 with θv_0=v_1 and θv_1=zv_0. In Sym^k use u_a=v_0^(k−a)v_1^a for 0≤a≤k, so θu_a=(k−a)u_{a+1}+a z u_{a−1}, with absent endpoint terms zero. On z=t² the operator θ equals (t/2)∂_t. This frame fixes the normalization of the differential forms in the Hodge computation.

**Hypotheses.** k≥1, characteristic zero, θ=z∂_z acting on connection sections.

**Construction / proof route.**

1. Use the cyclic operator from KM.2 and the symmetric Leibniz rule.
2. Construct the monomial basis and prove the endpoint formulas without accessing nonexistent indices.

**Direct inputs:** KM.2/symmetric-connections; KM.2/connection-structure.

**Source:** FSY, §4.1, pp. 26–27; Lemma 4.15, pp. 30–31. Rank-two Kloosterman frame; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/RankTwo; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- KM.5/de-rham-bases: Defines the representatives z^j v_0^k dz/z.
- KM.6/filtered-bases: Tracks the factor two under cyclic pullback.

**API.**

- **TauCeti.Kloosterman.rankTwoFrame** (constructor): The symmetric monomial basis u_a.
- **TauCeti.Kloosterman.rankTwoFrame_derivative** (simp): The sparse connection formula with integer multiplicities.
- **TauCeti.Kloosterman.rankTwoFrame_cover** (compatibility): Pullback identifies θ with (t/2)∂_t and z with t².
- **TauCeti.Kloosterman.rankTwoFrame_cyclic** (characterisation): v_0 generates the rank-two cyclic D-module θ²−z.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.rankTwoFrame_k1**: θv_0=v_1 and θv_1=zv_0.
- **TauCeti.Kloosterman.rankTwoFrame_k2**: θ(v_0v_1)=v_1²+zv_0², so omitting either Leibniz term fails.
- **TauCeti.Kloosterman.rankTwoFrame_pullback**: The double-cover differential satisfies dz/z=2dt/t, not dt/t.

**Check / worked cases.**

- For k=2, θu_1=u_2+z u_0.

### KM.5/formal-type: Formal symmetric-power decomposition

**Theorem.** At infinity the double-cover symmetric connection has exponential factors E^{2(2j−k)t}⊗L_{−1}^k for j=0,…,k. For the original Sym^k Kl_2, pair opposite nonzero factors through the double cover; when k is even there is one regular rank-one factor, whose local monodromy is 1 exactly when 4 divides k. Thus irr_∞Sym^k Kl_2=floor((k+1)/2), while the cover has irregularity k+1 for odd k and k for even k.

**Hypotheses.** k≥1; formal Laurent fields at infinity in characteristic zero; L_a denotes the regular rank-one factor with local monodromy a.

**Construction / proof route.**

1. Diagonalize the rank-two formal connection after the double cover.
2. Take symmetric powers of the two exponential factors and their regular twist.
3. Descend the paired factors and compute the middle zero exponent when k is even.

**Direct inputs:** KM.5/rank-two-frame.

**Source:** FSY, Proposition 4.6 and Lemma 4.7, pp. 27–28. Formal symmetric-power decomposition; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/RankTwo; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- At k=4 the regular factor is trivial; at k=2 it has monodromy −1.
- At k=3 the original irregularity is 2 and the cover irregularity 4.

### KM.5/intermediate-extensions: Symmetric-power intermediate extensions

**Theorem.** At infinity the map from the intermediate extension of Sym^k Kl_2 to its meromorphic extension is an isomorphism exactly when 4 does not divide k. For the double-cover object it is an isomorphism exactly when k is odd. At zero the unique proper holonomic submodule of j_{0,+}Sym^k Kl_2 that restricts to the connection is j_{0,†+}Sym^k Kl_2; the quotient is the boundary contribution determined by the single unipotent block.

**Hypotheses.** k≥1; holonomic extension functors supplied by G1.

**Construction / proof route.**

1. Use the formal regular factor to test the presence of a monodromy-one contribution at infinity.
2. At zero use irreducibility and the single-block local monodromy; apply the no-boundary-subquotient characterization.

**Direct inputs:** KM.5/formal-type; KM.3/middle-cohomology; KM.2/differential-galois.

**Source:** FSY, Corollary 4.9, pp. 28–29. Symmetric-power intermediate extensions; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/RankTwo; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- At k=4 the infinity intermediate-to-meromorphic map is not an isomorphism.
- This is not an assertion that j!→j* is an isomorphism whenever k is odd.

### KM.5/inverse-fourier-local: Local inverse Fourier structure

**Theorem.** For rank two, the inverse Fourier object ΠM has rank k+1 and its middle Gauss–Manin subobject M has rank k. Their finite singularities are τ=2(2j−k), j=0,…,k. At each such point the vanishing-cycle rank is one and its monodromy is (−1)^k. At infinity the monodromy is unipotent with a single block of the corresponding rank.

**Hypotheses.** k≥1; distinguish the rank k middle object from the rank k+1 projected object.

**Construction / proof route.**

1. Apply stationary phase to the formal exponential factors.
2. Use the extension calculation at zero and infinity to compute nearby/vanishing-cycle ranks.
3. The generic stationary-phase and Hodge nearby-cycle tools are in G1–G2, not a new local theory here.

**Direct inputs:** KM.3/inverse-fourier; KM.5/formal-type; KM.5/intermediate-extensions.

**Source:** FSY, Corollary 4.10, p. 29. Local inverse Fourier structure; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/RankTwo; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- Zero is a finite singularity exactly when k is even.
- For k=3 the finite singular values are −6,−2,2,6.

### KM.5/dimensions: Dimensions of moment cohomology

**Theorem.** For k≥1, dim H¹_dR(G_m,Sym^k Kl_2)=floor((k+1)/2), and its middle dimension is d_k=floor((k−1)/2)−δ_{4|k}. Equivalently d_k=(k−1)/2 for odd k and 2 floor((k−1)/4) for even k. On the double cover, the full dimension is k+1 for odd k and k for even k, and the middle dimension is k for odd k and k−2 for even k.

**Hypotheses.** k≥1; integer floors; the formula is not extended to k=0 by truncated subtraction.

**Construction / proof route.**

1. Apply the connection Euler characteristic with the formal irregularity calculation.
2. Subtract the zero and infinity invariant contributions using the intermediate extension exact sequences.
3. Use the double-cover decomposition to check all four formulas.

**Direct inputs:** KM.3/de-rham-realization; KM.5/formal-type; KM.5/intermediate-extensions.

**Source:** FSY, Proposition 4.12 and (4.13), p. 30. Dimensions of moment cohomology; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/RankTwo; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- d_1=d_2=d_4=0; d_3=1,d_5=2,d_6=2,d_7=3,d_8=2.
- The even d_k is always even, as required by its alternating pairing.

### KM.5/de-rham-bases: Explicit moment de Rham bases

**Theorem.** For k≥1 the classes z^j v_0^k dz/z, 0≤j<floor((k+1)/2), form a basis of full H¹_dR on the original torus. The cover basis is t^j tildev_0^k dt/t, 0≤j<2 floor((k+1)/2). The logarithmic canonical extension at zero is ⊕_a K[z]u_a with nilpotent residue, and its de Rham complex computes full cohomology. With deg z=2,deg u_a=a, the leading connection determinant for odd k is (k!!)^2(−z)^((k+1)/2); for even k its leading kernel is generated by Σ_i(−1)^i binomial(k/2,i)z^i u_{k−2i}.

**Hypotheses.** k≥1; full rather than middle H¹; v_0 is the cyclic basis section fixed above.

**Construction / proof route.**

1. Use the logarithmic canonical-extension quasi-isomorphism from G1 and the single-block residue.
2. Filter the algebraic de Rham complex by the indicated grading; compute the leading determinant or kernel.
3. Use the associated spectral sequence and dimension theorem to prove spanning and independence.

**Direct inputs:** KM.5/rank-two-frame; KM.5/dimensions.

**Source:** FSY, Proposition 4.14, Lemma 4.15 and Lemma 4.17, pp. 30–32. Explicit moment de Rham bases; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/RankTwo; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For k=3 the original basis has j=0,1 and the cover basis j=0,1,2,3.
- For k=4 the same original two classes span full cohomology while the middle space is zero.

<a id="km6"></a>
## KM.6: Compactifications and Hodge numbers

Construct the signed-permutation fan and the Kloosterman compactifications. Compute Newton weights and filtered bases, then the complete Hodge-number tables on the double cover and the original torus.

**Layer inputs:** KM.4; tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier; KM.3; KM.5.

**Atlas planets:** Kloosterman toric compactification; Nondegenerate moment compactification; Newton weights of moment forms; Hodge filtration in moment bases; Hodge numbers on the double cover; Hodge numbers of Kloosterman moments.

### KM.6/signed-fan: Kloosterman toric compactification

**Construction.** For k≥1 take the fan in Z^k whose rays are generated by nonzero vectors in {0,±1}^k and whose maximal cones are generated by successive signed partial sums of a signed permutation of the standard basis. It has 2^k k! regular maximal cones and 3^k−1 rays. Its toric variety X compactifies G_m^k. On the standard cone the coordinates are z_r=y_r/y_{r+1} for r<k and z_k=y_k, and g=Σ_i(y_i+y_i^−1)=g_1/(z_1⋯z_k), where g_1=1+Σ_{r=2}^k z_1⋯z_{r−1}+(z_1⋯z_k)Σ_{r=1}^k z_r⋯z_k.

**Hypotheses.** k≥1; fan and character lattices use the existing toric carriers. Complex toric geometry comes from the current upstream layer; the integral-base extension is gap G7.

**Construction / proof route.**

1. Construct the finite signed-permutation fan on the imported lattice/cone/fan types and prove regularity from unimodular triangular generator matrices.
2. Use the imported fan gluing rather than constructing a competing toric category.
3. Compute the displayed monomial chart and its Laurent numerator; request arithmetic base change separately.

**Direct inputs:** KM.4/hypersurface; tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier.

**Source:** FSY, §4.3.2, (4.22)–(4.23), pp. 35–36. Kloosterman toric compactification; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/HodgeNumbers; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- KM.6/product-compactification: Provides the boundary on which the product potential is resolved.
- KM.7/integral-boundary: The same explicit charts verify arithmetic boundary smoothness.

**API.**

- **TauCeti.Kloosterman.signedPermutationFan** (constructor): The finite fan with signed partial-sum maximal cones.
- **TauCeti.Kloosterman.signedPermutationFan_regular** (characterisation): Every maximal cone is regular and the fan is complete.
- **TauCeti.Kloosterman.kloostermanToricCompactification** (constructor): The toric variety of that fan using the supplier’s gluing.
- **TauCeti.Kloosterman.kloostermanToric_chart** (compatibility): The standard chart has the specified z coordinates and numerator g_1.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.signedPermutationFan_one**: At k=1 there are 2 rays and 2 maximal cones; X=P¹.
- **TauCeti.Kloosterman.signedPermutationFan_two**: At k=2 there are 8 rays and 8 maximal cones, distinguishing this fan from the four-ray product fan.
- **TauCeti.Kloosterman.signedPermutationFan_g1**: At k=2, g_1=1+z_1+z_1²z_2²+z_1z_2², and division by z_1z_2 recovers y_1+y_1^−1+y_2+y_2^−1.

**Check / worked cases.**

- For k=1 the fan is the fan of P¹, with rays ±1 and two charts.

### KM.6/product-compactification: Nondegenerate moment compactification

**Theorem.** Starting with P¹_t×X, blow up successively the intersections of the strict transform of t=0 with each toric boundary divisor. For odd k the resulting compactification of (G_m^(k+1),tΣ_i(y_i+y_i^−1)) is nondegenerate with strict-normal-crossings boundary. For even k its only failures are at t=∞ and balanced sign vectors y_i=±1, Σ_i y_i=0; blowing up each such point and then the intersection of its exceptional divisor with the strict transform of t=∞ gives a nondegenerate compactification. The resulting exceptional divisors E_1,E_2 have vanishing orders ord_{E_1}tildef=1 and ord_{E_2}tildef=0, so neither is a pole divisor.

**Hypotheses.** Characteristic zero; nondegenerate means a local form f=1/ξ^e or ζ_1/ξ^e with boundary (ξη)=0. Algebraic blowups and filtered de Rham invariance are supplied by G1–G2 and G7.

**Construction / proof route.**

1. Check the local monomial model at t=0 times a boundary chart.
2. Near each balanced point apply the ordinary quadratic normal form to g and compute the two blowup charts.
3. Verify the boundary, zero and pole orders needed by the irregular Hodge complex.

**Direct inputs:** KM.6/signed-fan; KM.3/tensor-potentials.

**Source:** FSY, §4.3.2–§4.3.3, pp. 35–37. Nondegenerate moment compactification; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/HodgeNumbers; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For k=2 there are two balanced sign points; for odd k none exist over Q.
- The positive order on E_1 is a zero, not a pole.

### KM.6/newton-weights: Newton weights of moment forms

**Theorem.** For rank two, the monomials of f_k=Σ_i x_i+zΣ_i x_i^−1 lie on 2α_0+Σ_i α_i=1. Its cone is given by α_0+Σ_i ε_iα_i≥0 for ε_i∈{0,1}. The Laurent polynomial f_k, and its cover tildef_k, are Newton-nondegenerate exactly when k is odd. In that case the Newton degrees of z^j and t^j are 2j and j, giving Hodge bounds k+1−2j and k+1−j for the associated nonzero top-form classes.

**Hypotheses.** k≥1; characteristic zero; Newton-to-irregular-Hodge theorem imported through gap G2.

**Construction / proof route.**

1. Compute the exponent set and its supporting hyperplane and face equations.
2. Check the torus critical equations on the faces; a balanced sign solution exists precisely for even k.
3. Apply the Newton filtration theorem with the chosen logarithmic volume form.

**Direct inputs:** KM.3/tensor-potentials; KM.5/de-rham-bases.

**Source:** FSY, §4.3.1, p. 35. Newton weights of moment forms; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/HodgeNumbers; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- The z exponent has degree two while the t exponent has degree one.
- Even k requires the blowup calculation rather than the odd nondegenerate Newton argument.

### KM.6/filtered-bases: Hodge filtration in moment bases

**Theorem.** For the cover, F^pH¹ is spanned by basis classes t^j tildev_0^k dt/t with 0≤j<2 floor((k+1)/2) and j≤k+1−p. For the original, F^pH¹ is spanned by z^jv_0^k dz/z with 0≤j<floor((k+1)/2) and 2j≤k+1−p. These equalities hold for every integer p when k is odd, and for p>k/2 when k is even. Pullback sends the original representative to 2t^(2j)tildev_0^k dt/t. Negative upper bounds mean an empty span, not truncated natural subtraction.

**Hypotheses.** k≥1; for even k retain the strict range p>k/2; basis-index bounds always apply.

**Construction / proof route.**

1. For odd k use the Newton weights.
2. For even k use the product compactification: the top form has extra logarithmic vanishing (k−j)E_1+(k−2j)E_2, giving the bound j≤k/2 on the cover.
3. Apply generic filtered blowup invariance and E₁ degeneration from G2, then use the cover Hodge dimensions and strict μ_2-invariants to turn inclusions into equalities.

**Direct inputs:** KM.6/newton-weights; KM.6/product-compactification; KM.6/cover-hodge-numbers; KM.5/de-rham-bases; KM.4/classical-hodge.

**Source:** FSY, Proposition 4.21 and its proof, pp. 34–38. Hodge filtration in moment bases; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/HodgeNumbers; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For k=3, F⁴ is the span of j=0, F² contains both j=0,1, and F⁵=0.
- For even k the theorem does not assert the unproved lower half of the basis formula.

### KM.6/cover-hodge-numbers: Hodge numbers on the double cover

**Theorem.** For H¹(G_m,Sym^k tildeKl_2), all nonzero h^{p,q} equal one. If k is odd they occur at p+q=k+1 with 1≤p≤k, and at (k+1,k+1). If k is even they occur at p+q=k+1 with 1≤p≤k except p=k/2,k/2+1, and additionally at (k/2+1,k/2+1) and (k+1,k+1). All other Hodge numbers vanish. Middle cohomology is exactly the weight-(k+1) part.

**Hypotheses.** k≥1, classical MHS on the existing carrier; Hodge numbers refer to weight-graded pieces.

**Construction / proof route.**

1. Use the pure Hodge module M of rank k and its single-block infinity monodromy to compute rank-one Hodge graded bundles.
2. Use nearby-cycle primitive decomposition at τ=0 and the quotient M′ to obtain the two extra even-k weights and the top Tate class.
3. The generic Hodge-nearby-cycle comparison is gap G2; correct the primitive-index misprint recorded in E2.

**Direct inputs:** KM.5/inverse-fourier-local; KM.4/classical-hodge; KM.5/dimensions.

**Source:** FSY, Proposition 4.20, pp. 32–34. Hodge numbers on the double cover; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/HodgeNumbers; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For k=2 the cover has only (2,2) and (3,3), and its middle space is zero.
- For k=3 the cover middle has (1,3),(2,2),(3,1), plus top (4,4).

### KM.6/hodge-numbers: Hodge numbers of Kloosterman moments

**Theorem.** For H¹(G_m,Sym^k Kl_2), k≥1, every nonzero Hodge number equals one. For odd k the positions are p+q=k+1 with p=2,4,…,k−1, together with (k+1,k+1). For even k they are p+q=k+1 with min(p,q)∈{2,4,…,2 floor((k−1)/4)}, the position (k/2+1,k/2+1) exactly when 4 divides k, and (k+1,k+1). All others vanish. Middle cohomology is the pure weight-(k+1) part, with these distinct p-indices and dimension d_k.

**Hypotheses.** k≥1; an empty displayed progression contributes no positions.

**Construction / proof route.**

1. Pull back the explicit basis and use the μ_2-invariant filtered comparison.
2. For odd k read the even p-indices directly; for even k compute the upper half and use Hodge symmetry and the dimension theorem for the remaining positions.
3. Use the exact weight decomposition to separate the top Tate class and the k+2 weight from middle cohomology.

**Direct inputs:** KM.6/filtered-bases; KM.6/cover-hodge-numbers; KM.5/dimensions.

**Source:** FSY, Theorem 1.8, p. 7; proof pp. 37–38. Hodge numbers of Kloosterman moments; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/HodgeNumbers; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- k=3 has middle (2,2); k=5 has (2,4),(4,2); k=6 has (2,5),(5,2).
- k=4 has no middle positions but has extra (3,3) and top (5,5).
- k=7 has middle (2,6),(4,4),(6,2), so no repeated Hodge–Tate weights.

<a id="km7"></a>
## KM.7: Arithmetic models and Galois realizations

Verify the integral boundary geometry, classify bad-prime quadratic points, construct the even-degree resolution, and define continuous Galois realizations of the middle motive.

**Layer inputs:** KM.6; KM.4; LefschetzPencilsAndVanishingCycles:LPV.2; EtaleDualityAndPerverseSheaves:EDC.4; KM.3; SchemeAndStackFoundations:SF.2.

**Atlas planets:** Integral boundary geometry; Arithmetic quadratic singularities; Resolution of the even moment hypersurface; Galois realizations of moment motives.

### KM.7/integral-boundary: Integral boundary geometry

**Theorem.** For r=2 and k≥2, the closure Kbar of Σ_i(y_i+y_i^−1)=0 in the signed-fan toric model over Z is smooth along the toric boundary, and its boundary is a relative strict-normal-crossings divisor. On the standard chart Kbar∩(z_1=0) is empty. On Kbar∩(z_r=0), r≥2, the equation gives ∂g_1/∂z_1=−1/z_1, hence a unit. The same calculation for distinct boundary indices proves all required relative smooth intersections.

**Hypotheses.** Integral toric model and base-change maps requested in G7; boundary intersections use distinct components.

**Construction / proof route.**

1. Use the explicit Laurent numerator from the fan chart.
2. On its zero locus with z_r=0 solve 1+z_1A=0, so A=−1/z_1 is a unit in every residue characteristic.
3. Repeat on intersections and transport by signed permutations. The derivative need not be a unit on the entire ambient divisor z_r=0; source issue E4 fixes that claim.

**Direct inputs:** KM.6/signed-fan; KM.4/hypersurface.

**Source:** FSY, §5.1.2, pp. 40–41; Remark 3.10, p. 22. Integral boundary geometry; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/ArithmeticGeometry; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- The proof works along the boundary at p=2 as well as at odd primes.
- Interior singularities remain possible and are handled separately.

### KM.7/singularities: Arithmetic quadratic singularities

**Theorem.** Over an odd residue characteristic p, the interior singular points are the sign vectors y_i=±1 satisfying Σ_i y_i=0 in F_p. For odd k the S_k×μ_2-orbits are indexed by positive odd a with ap≤k, giving floor(k/(2p)+1/2) orbits; their local expansions have constant term 2ap and nondegenerate quadratic term Q_{ap}. For even k the orbit indices are even b≥0 with bp≤k, giving 1+floor(k/(2p)) orbits; b=0 describes the characteristic-zero balanced points and positive b the additional bad-prime points. For odd k at p=2 there is one singular point y_i=1, of isolated nonordinary quadratic type.

**Hypotheses.** k≥2; ordinary-quadratic statements require p odd; the odd-k characteristic-two branch uses a different theorem, gap G4.

**Construction / proof route.**

1. Solve the critical equations 1−y_i^−2=0 and the zero-locus equation.
2. Use permutations and simultaneous inversion of all signs to count orbits.
3. Compute the Hessian and the constant term in the formal Morse coordinates at odd primes; at two identify the nonordinary model instead of applying ordinary Picard–Lefschetz.

**Direct inputs:** KM.7/integral-boundary; KM.4/hypersurface; LefschetzPencilsAndVanishingCycles:LPV.2/fsy-discriminant-example.

**Source:** FSY, §5.1.3, pp. 41–44; §5.1.4, p. 45. Arithmetic quadratic singularities; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/ArithmeticGeometry; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For k=3,p=3 there is one positive-a orbit; for k=9,p=3 there are a=1,3, with constant terms 6 and 18.
- The a=3 point has higher p-adic thickness and does not meet the unit-thickness hypothesis of the existing Mieda node.

### KM.7/even-resolution: Resolution of the even moment hypersurface

**Construction.** For even k≥4, blow up the ambient torus and its toric compactification at the balanced sign points and take the strict transform K′ of Kbar. Over Q it is smooth, its boundary is strict normal crossings, and exceptional divisors are the corresponding smooth quadrics. The χ-isotypic compact-support middle-degree realization is unchanged by this modification. At odd primes the remaining interior singularities are the positive-b ordinary quadratic points. The weight-(k−2) boundary correction in the χ component has dimension δ_{4|k}. Handle k=2 by its directly vanishing middle motive.

**Hypotheses.** k even, k≥4; all equivariance and exceptional contributions tracked; no all-characteristics smoothness assertion for the integral blowup.

**Construction / proof route.**

1. Blow up the finite S_k×μ_2-stable balanced locus and compute the strict transform in local quadratic charts.
2. Use localization and the projective-quadric exceptional calculation; after e_χ the indicated degree is preserved.
3. Use the boundary spectral sequence and its differentials to isolate the weight-(k−1) part and the δ_{4|k} correction.

**Direct inputs:** KM.7/singularities; KM.7/integral-boundary; EtaleDualityAndPerverseSheaves:EDC.4; KM.3/sign-projector.

**Source:** FSY, proof of Theorem 5.17, (5.18)–(5.21), pp. 45–48. Resolution of the even moment hypersurface; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/ArithmeticGeometry; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- KM.8/even-local: Computes the invariant quotient and the unipotent monodromy.
- KM.9/padic-comparison: Supplies the compactification and boundary maps for period comparison.

**API.**

- **TauCeti.Kloosterman.evenMomentResolution** (constructor): The strict transform with its equivariant proper map to Kbar.
- **TauCeti.Kloosterman.evenMomentResolution_boundary** (structure): The resolved boundary and its strata with normal-crossings maps.
- **TauCeti.Kloosterman.evenMomentResolution_cohomology** (compatibility): The χ-isotypic H_c^{k−1} map is an isomorphism in the stated realizations.
- **TauCeti.Kloosterman.evenMomentResolution_weight** (characterisation): The weight-(k−2) χ correction has dimension δ_{4|k}.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.evenMomentResolution_k4**: For k=4 the boundary correction has dimension one but middle dimension zero.
- **TauCeti.Kloosterman.evenMomentResolution_k6**: For k=6 the boundary correction has dimension zero.
- **TauCeti.Kloosterman.evenMomentResolution_bad_prime**: After resolving balanced points, at k=6,p=3 the positive-b=2 singular orbit remains; the integral model is not everywhere smooth.

**Check / worked cases.**

- For k=4 the resolution does not create a nonzero middle motive.

### KM.7/galois-realization: Galois realizations of moment motives

**Construction.** For k≥2 and every prime ℓ let V_{k,ℓ}=(gr^W_{k−1}H_c^{k−1}(K_{2,k,Q̄},Q_ℓ))^χ(−1), with its continuous G_Q action r_{k,ℓ}. For k=1 use V=0. This is the ℓ-adic realization of M_k, has dimension d_k and a perfect G_Q-equivariant pairing to Q_ℓ(−k−1), symmetric for odd k and alternating for even k. For odd k it is the χ-weight piece of the smooth proper compactification with boundary correction; for even k use the resolved model and its boundary map.

**Hypotheses.** Q_ℓ coefficients, continuous Galois action from geometric étale cohomology; realization compatibility is G3.

**Construction / proof route.**

1. Use the Nori étale realization with functorial weights and rational projectors.
2. Use the compactification and boundary spectral sequence to produce actual continuous subquotients of smooth proper cohomology.
3. Transfer dimensions and pairing through Betti/de Rham comparison, not by choosing an arbitrary representation of the right rank.

**Direct inputs:** KM.4/middle-motive; KM.6/hodge-numbers; KM.7/integral-boundary; KM.7/even-resolution; SchemeAndStackFoundations:SF.2.

**Source:** FSY, (5.5), p. 40; (5.9), pp. 42–43; (5.19), pp. 46–47. Galois realizations of moment motives; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/ArithmeticGeometry; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- FSY Theorems 5.8 and 5.17: Local specialization identifies the finite-field middle factors and correction lines.
- KM.9/compatible-system: The family over all ℓ is the input to potential automorphy.

**API.**

- **TauCeti.Kloosterman.momentGaloisRealization** (constructor): The specified geometric Q_ℓ representation.
- **TauCeti.Kloosterman.momentGaloisRealization_dimension** (characterisation): Its dimension is d_k, independent of ℓ.
- **TauCeti.Kloosterman.momentGaloisRealization_pairing** (structure): The equivariant perfect pairing with Tate twist and parity sign.
- **TauCeti.Kloosterman.momentGaloisRealization_comparison** (compatibility): Its de Rham/Betti realization has the filtered middle cohomology from KM.4.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.momentGaloisRealization_zero**: k=1,2,4 give zero-dimensional representations.
- **TauCeti.Kloosterman.momentGaloisRealization_parity**: k=6 gives a two-dimensional alternating representation, whereas k=7 gives a three-dimensional orthogonal one.
- **TauCeti.Kloosterman.momentGaloisRealization_frobenius**: At a good prime geometric Frobenius has pairing multiplier p^(k+1), not p^−(k+1).

**Check / worked cases.**

- At k=3 the representation is one-dimensional with pairing weight four.

<a id="km8"></a>
## KM.8: Local factors and conductors

Define the finite-field middle polynomial. Compute its degree and trivial factors, the odd/even local Galois structures, exact bad-prime Euler factors, and conductors, retaining the unknown even factor at two.

**Layer inputs:** KM.1; SchemeAndStackFoundations:SF.2; KM.7; KM.4; LefschetzPencilsAndVanishingCycles:LPV.2; ArithmeticGaloisRepresentations:R01.3.

**Atlas planets:** Middle moment polynomial; Degrees and trivial moment factors; Odd symmetric-power local realization; Even symmetric-power local realization; Odd moment Euler factors and conductor; Even moment Euler factors and conductor.

### KM.8/middle-polynomial: Middle moment polynomial

**Definition.** For k≥1,p prime, define M_k(p;T)=det(1−T F_p|im(H_c¹(G_m,F̄_p,Sym^k Kl_2)→H¹)), with geometric Frobenius. Its constant term is one; it is a polynomial with algebraic coefficients descending as specified by the compatible realization. Its reciprocal eigenvalues have all complex absolute values p^((k+1)/2), and are stable under α↦p^(k+1)/α. Polynomial roots in T have inverse absolute value p^−((k+1)/2).

**Hypotheses.** ℓ≠p; k≥1; rational coefficient descent and independence are proved by local realization and compatibility nodes, not imposed as data.

**Construction / proof route.**

1. Take the determinant on the actual middle image defined in KM.1.
2. Use cohomological purity and its perfect pairing; distinguish reciprocal eigenvalues from zeros of the polynomial.

**Direct inputs:** KM.1/cohomological-moments.

**Source:** FSY, §5.1.1, pp. 39–40. Middle moment polynomial; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/LocalFactors; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- KM.8/odd-conductor; KM.8/even-conductor: Bad-prime local Euler factors are this polynomial times explicit correction lines.
- KM.10/completed-l-function: The good Euler product is expressed through M_k.

**API.**

- **TauCeti.Kloosterman.middlePolynomial** (constructor): The determinant on the finite-field middle image.
- **TauCeti.Kloosterman.middlePolynomial_const** (simp): M_k(p;0)=1.
- **TauCeti.Kloosterman.middlePolynomial_purity** (characterisation): Every reciprocal eigenvalue is a Weil number of weight k+1.
- **TauCeti.Kloosterman.middlePolynomial_duality** (compatibility): The reciprocal spectrum is stable under α↦p^(k+1)/α.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.middlePolynomial_k1**: M_1=M_2=M_4=1 at every prime.
- **TauCeti.Kloosterman.middlePolynomial_k3_p2**: M_3(2;T)=1+4T, with reciprocal eigenvalue −4 and polynomial zero −1/4.
- **TauCeti.Kloosterman.middlePolynomial_pairing**: At k=3,p=2, the partner of −4 is 16/(−4)=−4; the erroneous factor p^((k+1)/2) would give −1.

**Check / worked cases.**

- At k=3, M_k(p;T)=1−(p/3)p²T; it has degree zero at p=3.

### KM.8/degree-formulas: Degrees and trivial moment factors

**Theorem.** For odd k, deg Z=(k+1)/2 at p=2 and (k+1)/2−floor(k/(2p)+1/2) at odd p, and Z=(1−T)M. For even k and odd p, put u=floor(k/(2p)),v=floor(k/(4p)+1/2),m=u+δ_{4|k}. Then deg Z=k/2−u and Z=(1−T)(1−(−1)^((p−1)/2)p^(k/2)T)^v(1−p^(k/2)T)^(m−v)M. For even k at p=2, deg Z=floor((k+2)/4), Z=(1−T)(1−2^(k/2)T)^a(1+2^(k/2)T)^b M, deg M=2 floor((k+2)/12)−2δ_{12|k}, with a=floor(k/24)+1 for residues k mod 24 in {0,8,12,16,18,20} and a=floor(k/24) otherwise; b=floor(k/24)+1 for residues in {6,12,14,18,20,22} and b=floor(k/24) otherwise. Since H_c is concentrated in degree one, each displayed deg Z is also the Swan conductor of Sym^k Kl_2 at infinity.

**Hypotheses.** k≥1; p prime; all exponents are nonnegative integers in their stated parity cases.

**Construction / proof route.**

1. Use the local invariant and Swan-conductor computations of Fu–Wan and Yun as collected in FSY; their original proof decomposition is G8.
2. Apply Grothendieck–Ogg–Shafarevich from the SF.2 trace/conductor request.
3. Separate the weights 0,k,k+1 to identify the trivial factors uniquely; use the corrected weight-(k+1) pairing.

**Direct inputs:** KM.8/middle-polynomial; KM.1/moment-integrality; SchemeAndStackFoundations:SF.2.

**Source:** FSY, §1.2, pp. 4–5; §5.1.1, (5.1)–(5.4), pp. 39–40. Degrees and trivial moment factors; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/LocalFactors; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- k=4,p odd gives (1−T)(1−p²T), while p=2 gives only 1−T.
- At k=12,p=2, deg Z=3, a=b=1, deg M=0; at k=10,p=2, deg M=2.

### KM.8/odd-local: Odd symmetric-power local realization

**Theorem.** Let k=2m+1≥1 and ℓ≠p. At p=2, V_{k,ℓ} is unramified and after adjoining ζ_2 its Frobenius module is the finite-field middle cohomology. At odd p it is tamely ramified and has an orthogonal decomposition V=M⊕E, with M unramified and M[ζ_p] the middle cohomology. E has one line for each positive odd a with ap≤k, on which G_Qp acts as ε_a χ_cyc^(−m−1), where ε_a is the quadratic character of Q_p(sqrt((−1)^((1+ap)/2)2ap)). Put Θ_p^+={a:v_p(a) odd}, Θ_p^−={a:v_p(a) even}. Then V^I=M⊕E^+, and on the a-line of E^+ geometric Frobenius is ((−1)^((1+ap)/2)2a′/p)p^(m+1), where a′=a/p^{v_p(a)}.

**Hypotheses.** k odd and positive; p and ℓ distinct; chosen decomposition group; the Legendre symbol in the eigenvalue formula is at odd p.

**Construction / proof route.**

1. Use the compactification boundary spectral sequence and finite-field hypersurface comparison.
2. Apply the ordinary Picard–Lefschetz and discriminant imports at odd primes to split off the orthogonal vanishing lines.
3. At p=2 use the nonordinary quadratic vanishing-cycle concentration, gap G4, plus equality of dimensions; do not apply the ordinary node there.
4. Classify each quadratic local character by the parity of its radicand valuation.

**Direct inputs:** KM.7/galois-realization; KM.7/singularities; KM.4/finite-field-realization; LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula; LefschetzPencilsAndVanishingCycles:LPV.2/fsy-discriminant-example; KM.8/degree-formulas.

**Source:** FSY, Theorem 5.8 and Remark 5.12, pp. 42–44. Odd symmetric-power local realization; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/LocalFactors; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- At k=9,p=3, the a=1 line is ramified and a=3 line is unramified: Θ^-={1},Θ^+={3}.
- The theorem concerns a local orthogonal decomposition and does not assert global semisimplicity.

### KM.8/even-local: Even symmetric-power local realization

**Theorem.** For even k≥2, odd p and ℓ≠p, inertia on V_{k,ℓ} is unipotent with (σ−1)²=0. Its logarithm has isotropic image U of dimension u=floor(k/(2p)); V^I=U^⊥, and inertia is trivial on V/U. After adjoining ζ_p, V^I is H_c¹(G_m,F̄_p,Sym^k Kl_2)/E, where E=Q_ℓ(0) if 4 does not divide k, and otherwise E is an extension of Q_ℓ(−k/2) by Q_ℓ(0). This is an actual quotient, not an asserted direct-sum splitting.

**Hypotheses.** k even, k≥2; p odd; rational ℓ-adic coefficients; k=2 handled directly.

**Construction / proof route.**

1. Use the even resolution and the boundary spectral sequence to identify invariant and vanishing-cycle subspaces.
2. Apply the odd-dimensional Picard–Lefschetz transvection formula and compute the image of monodromy.
3. Use weight dimensions from the trivial-factor theorem to show the inclusions in FSY (5.21) are equalities; compute Frobenius on the quadratic exceptional pieces.

**Direct inputs:** KM.7/even-resolution; KM.7/galois-realization; LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula; KM.8/degree-formulas; KM.4/finite-field-realization.

**Source:** FSY, Theorem 5.17, pp. 45–48. Even symmetric-power local realization; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/LocalFactors; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For p>k/2, U=0 and the representation is unramified.
- At k=6,p=3, dim U=1, dim V=2 and dim V^I=1.

### KM.8/odd-conductor: Odd moment Euler factors and conductor

**Theorem.** For odd k, define L_{k,p}(T)=det(1−T F_p|V_{k,ℓ}^{I_p})^−1, ℓ≠p. It equals M_k(p;T)^−1 at p=2, and at odd p its inverse equals M_k(p;T) times the product of (1−((−1)^((1+ap)/2)2a′/p)p^((k+1)/2)T) over a∈Θ_p^+. The conductor is N_k=Π_{p odd}p^{|Θ_p^-|}=Π_{1≤j≤k,j odd}sf(j), where sf(j) is the product of primes occurring to an odd valuation in j. These local factors and conductor do not change on global semisimplification in the odd case.

**Hypotheses.** k odd and positive; sf is the square-class representative, not the radical.

**Construction / proof route.**

1. Take inertia invariants in the explicit odd local decomposition.
2. Apply the imported WD conductor formula; tameness removes the Swan term.
3. Count odd j by the parity of v_p(j) to obtain the product of square-class representatives. The odd local decomposition has finite inertia image and N=0. In characteristic zero taking these finite-group invariants is exact on a global Jordan–Hölder filtration restricted locally; hence the Frobenius determinant on invariants and the tame conductor are unchanged. No semisimplicity of the unramified Frobenius is required.

**Direct inputs:** KM.8/odd-local; ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation.

**Source:** FSY, (5.13)–(5.14) and Remark 5.15, pp. 44–45. Odd moment Euler factors and conductor; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/LocalFactors; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- At k=9, sf(9)=1, whereas rad(9)=3; the wrong radical convention gives the wrong conductor.
- For k=3 the conductor is 3 and the p=3 local factor is 1.

### KM.8/even-conductor: Even moment Euler factors and conductor

**Theorem.** For even k≥2 and odd p let u=floor(k/(2p)),v=floor(k/(4p)+1/2). Then L_{k,p}(T)^−1=M_k(p;T)(1−p^(k/2)T)^u for p≡1 mod4, and M_k(p;T)(1+p^(k/2)T)^v(1−p^(k/2)T)^(u−v) for p≡3 mod4. The conductor is 2^{r_k}N′_k, with N′_k=Π_{p odd}p^{floor(k/(2p))}=Π_{2≤j≤k,j even}oddRad(j), where oddRad is the product of distinct odd prime divisors. Here r_k=Sw_2(V)+codim V^{I_2}≥0; no explicit formula at two is asserted. Strict compatibility will give L_{k,2}(T) as the reciprocal of a rational polynomial with constant coefficient one.

**Hypotheses.** k even and positive; odd p only in the explicit local formulas; no independence-at-two argument before KM.11/local-transport.

**Construction / proof route.**

1. Take the determinant on the invariant quotient from the even local theorem and remove E.
2. Use the computed signs on the vanishing-cycle image U to obtain the two p mod4 cases.
3. Use the WD conductor formula with finite Weil inertia trivial, so the monodromy term is rank N=u; multiply over odd primes.

**Direct inputs:** KM.8/even-local; ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation.

**Source:** FSY, (5.22) and the conductor formula, pp. 48–49. Even moment Euler factors and conductor; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/LocalFactors; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- At k=6,p=3, the extra factor in L^−1 is 1+27T.
- The even formula uses odd radicals, while the odd-k formula uses square-class representatives.
- The conjecture r_k=floor(k/6) remains outside this theorem.

<a id="km9"></a>
## KM.9: p-adic comparison and compatible systems

Establish the Kloosterman p-adic comparison and Newton bounds using geometric suppliers, and prove the purity, regularity, polarizations and weak compatibility needed for potential automorphy.

**Layer inputs:** KM.7; KM.4; PadicDifferentialEquationsAndRigidCohomology:RD.7; CohomologyComparisons:CP.2; CohomologyComparisons:CP.3; CohomologyComparisons:CP.4; PadicHodgeTheory:R06.2; KM.6; KM.8; ArithmeticGaloisRepresentations:G7; ModularityAndLanglandsExtensions:ML.2.

**Atlas planets:** p-adic comparison for moment motives; Newton bounds for moment polynomials; Regular polarized moment systems.

### KM.9/padic-comparison: p-adic comparison for moment motives

**Theorem.** For every k≥1 and prime p, V_{k,p} is de Rham and its filtered D_dR identifies with the filtered middle de Rham cohomology over Q_p. At odd p it is semistable over L=Q_p(sqrt(−p)), and there is a Frobenius-compatible injection H¹_rig,mid(G_m/F_p,K,Sym^k Kl_2)→D_st,L(V_{k,p})⊗_{L_0} K, where L_0=Q_p is the maximal unramified subfield of L and K is a compatible Dwork coefficient field. If p>k for odd k, or p>k/2 for even k, with p odd, it is crystalline over Q_p and the map identifies the rigid middle module with D_cris(V_{k,p})⊗K.

**Hypotheses.** Geometric proper-smooth and semistable comparisons CP.2–CP.4, period exactness R06.2, and rigid comparison RD.7. The bad-prime semistable model required by the existing Mieda node is not verified for higher-thickness points; gap G6 explicitly conditions the proof route, not the target theorem.

**Construction / proof route.**

1. Realize V as a subquotient of smooth proper cohomology over Q_p via the boundary maps; use CP.3 and exactness to prove de Rham admissibility for all p.
2. At odd bad primes use Mieda’s injective rigid-to-de Rham map compatible with boundary and projectors, and CP.4 for a suitable semistable model; the insufficient unit-thickness argument is G6/E9.
3. At the stated good primes the model is smooth, so CP.2 and the rigid/crystalline comparison give the isomorphism and crystallinity.

**Direct inputs:** KM.7/galois-realization; KM.7/even-resolution; KM.4/rigid-realization; PadicDifferentialEquationsAndRigidCohomology:RD.7/mieda-p-adic-picard-lefschetz; CohomologyComparisons:CP.2; CohomologyComparisons:CP.3; CohomologyComparisons:CP.4; PadicHodgeTheory:R06.2/admissible-category-tannakian; PadicHodgeTheory:R06.2/ddr-exact-strict-tensor; PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful.

**Source:** FSY, Proposition 5.23, pp. 49–51. p-adic comparison for moment motives; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Compatibility; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- The good-prime claim at odd p avoids the unverified bad-model thickness step.
- The de Rham assertion includes p=2; the explicit semistable comparison in this node is only at odd p.

### KM.9/newton-polygon: Newton bounds for moment polynomials

**Theorem.** For k≥1 and odd p, the Newton polygon of H¹_rig,c(G_m,Sym^k Kl_2) lies on or above the Hodge polygon of H¹_dR,c(G_m,Sym^k Kl_2). Their endpoints coincide when p>k for odd k or p>k/2 for even k. Consequently, if Z_k(p;T)=Σ_n c_nT^n then v_p(c_n)≥n(n−1) at odd p.

**Hypotheses.** Use the compact-support Hodge polygon, not the full ordinary Hodge table without duality. The odd bad-prime geometric proof inherits G6.

**Construction / proof route.**

1. Apply weak admissibility to the filtered semistable representation from the comparison theorem.
2. Use the rigid middle injection, then restore the weight-zero and possible weight-k trivial compact-support factors.
3. Read slopes of the explicit Hodge filtration and apply the coefficient/Newton polygon relation.

**Direct inputs:** KM.9/padic-comparison; KM.6/hodge-numbers; KM.8/degree-formulas; PadicHodgeTheory:R06.2/admissible-implies-weakly-admissible.

**Source:** FSY, Corollary 5.27 and Remark 5.28, pp. 51–52; Remark 5.41, p. 59. Newton bounds for moment polynomials; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Compatibility; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- At k=3,p=3, Z=1−T, so the bound holds also when the middle space vanishes.
- No p=2 even-k valuation bound is claimed here.

### KM.9/compatible-system: Regular polarized moment systems

**Theorem.** For each k≥1 the family {r_{k,ℓ}^{ss}} is a rational weakly compatible system, pure of weight k+1, de Rham at ℓ and crystalline for sufficiently large ℓ, with distinct Hodge–Tate weights equal to the p-indices of the middle Hodge table. Use the convention HT(χ_cyc)=−1. The semisimplified system retains a perfect pairing of sign (−1)^(k+1) with multiplier χ_cyc^(−k−1): it is orthogonal with an even multiplier at real places for odd k, and symplectic with an odd multiplier for even k. Thus it is regular, odd and essentially self-dual in the Patrikis–Taylor sense. The zero-rank k=1,2,4 cases are treated as empty systems; k=3 is a rank-one character case.

**Hypotheses.** For positive-rank automorphy k∉{1,2,4}; exact all-prime local compatibility is a conclusion after potential automorphy, not an input here. Preservation of the form under semisimplification is the missing extension requested from G7, gap G5. This roadmap follows FSY with HT(χ_cyc)=−1 and weights equal to the de Rham filtration jumps. PadicHodgeTheory:R06.2 uses HT(χ_cyc)=+1, so HT_KM(V)=−HT_R06(V), with multiplicities; D_dR, its filtration, Tate twists and the representation itself are unchanged.

**Construction / proof route.**

1. Use the local factors at almost all primes and geometric Frobenius polynomials to establish weak compatibility over Q.
2. Use the good-prime branch of KM.9/padic-comparison to establish de Rham and eventual crystalline properties and identify the Hodge–Tate multiset, negating the R06 weight labels according to the explicit convention dictionary.
3. Use the pairing on the motive and the generic characteristic-zero semisimplification-with-involution theorem (G5).
4. Check the real-place multiplier sign explicitly in the orthogonal and symplectic branches against the imported potential-automorphy hypotheses.

**Direct inputs:** KM.7/galois-realization; KM.8/odd-local; KM.8/even-local; KM.9/padic-comparison; KM.6/hodge-numbers; ArithmeticGaloisRepresentations:G7; ModularityAndLanglandsExtensions:ML.2/patrikis-taylor-potential-automorphy; PadicHodgeTheory:R06.2/hodge-tate-weight-convention.

**Source:** FSY, §5.3.3, pp. 57–58. Regular polarized moment systems; the target below fixes coefficients, degree shifts and normalization explicitly.
**Source:** Serre, §4.1–4.2, Theorem 4.2.1 and Lemma 4.2.4, pp. 9–10. A nondegenerate symmetric (in characteristic different from two) or alternating form compatible with an algebra involution induces a form of the same type on the semisimplification. For the moment pairing use g* = χ_cyc(g)^(−k−1)g^−1.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Compatibility; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For k=7 the Hodge–Tate weights are 2,4,6 and the orthogonal multiplier is even.
- For k=6 the weights are 2,5 and the symplectic multiplier is odd.
- Weak compatibility alone does not determine the local factor at two.
- For k=7 the supplier R06 weights are −2,−4,−6, while the FSY/KM weights are 2,4,6; both conventions give regularity.

<a id="km10"></a>
## KM.10: Gamma factors and completion

Compute determinant characters, real signs, normalized archimedean factors and epsilon factors; define Euler products and completed functions with the paper and standard gamma normalizations distinguished.

**Layer inputs:** KM.9; KM.6; ArithmeticGaloisRepresentations:R01.5; ModularityAndLanglandsExtensions:ML.0; KM.8; ArithmeticGaloisRepresentations:R01.2; ArithmeticGaloisRepresentations:R01.3.

**Atlas planets:** Determinants of odd moment systems; Gamma factor of moment motives; Epsilon factors of moment motives; Completed moment L-functions.

### KM.10/determinant: Determinants of odd moment systems

**Theorem.** For odd k≥1, det r_{k,ℓ}=χ_{k!!} χ_cyc^((1−k²)/4), where k!!=1·3·5⋯k and χ_{k!!} is the quadratic Dirichlet/Kronecker character (·/k!!). Equivalently its quadratic field is Q(sqrt(±k!!)), with plus for k≡1,7 mod8 and minus otherwise, allowing the trivial square case. For k=4r+3 the unique diagonal middle Hodge line has complex-conjugation sign −1.

**Hypotheses.** k odd and positive; ℓ arbitrary; use the signed discriminant convention at two, not the unsigned radicand indiscriminately.

**Construction / proof route.**

1. Use Fu–Wan’s good-prime determinant formula as reproduced in FSY, with original proof decomposition in G8.
2. Use Frobenius recognition from R01.5 to identify the determinant character globally.
3. On the Hodge decomposition pair conjugate unequal bidegrees, giving det σ=(−1)^r ε; the determinant character forces ε=−1 on the diagonal line.

**Direct inputs:** KM.9/compatible-system; KM.6/hodge-numbers; ArithmeticGaloisRepresentations:R01.5.

**Source:** FSY, proof of Corollary 5.30, pp. 52–53; §5.3.1, p. 55. Determinants of odd moment systems; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Completion; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- k=3 gives quadratic field Q(sqrt(−3)) and exponent −2 on χ_cyc.
- At k=7 the radicand sign is positive; a uniform negative sign fails.

### KM.10/gamma-factor: Gamma factor of moment motives

**Theorem.** Put d=d_k. With Γ_R(s)=π^(−s/2)Γ(s/2), the standard Serre archimedean factor of M_k is Π_{j=1}^d Γ_R(s−j). The factor used in the paper’s completed function is G_k(s)=π^(−ds/2)Π_{j=1}^d Γ((s−j)/2); hence L_standard(∞,s)=π^{d(d+1)/4}G_k(s). The extra factor is a nonzero constant and leaves its functional equation unchanged. The Hodge recipe, including the minus real sign on the diagonal line for k≡3 mod4, is imported rather than redefined.

**Hypotheses.** k≥1, d≥0; equality as meromorphic functions; empty products are one.

**Construction / proof route.**

1. Use the exact ML.0 archimedean-factor contract and the middle Hodge table.
2. Use the determinant computation for the diagonal-line sign.
3. Combine adjacent Γ_R factors into Γ_C where needed, then multiply the explicit π powers to distinguish the standard factor from the paper’s normalization.

**Direct inputs:** KM.10/determinant; KM.6/hodge-numbers; ModularityAndLanglandsExtensions:ML.0/compatible-system-archimedean-factors; mathlib:Complex.Gamma.

**Source:** FSY, Corollary 5.30, pp. 52–53; §5.2, p. 52. Gamma factor of moment motives; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Completion; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- For k=3, d=1, the standard factor is Γ_R(s−1)=π^(1/2)G_3(s).
- For k=5, d=2, the standard factor Γ_C(s−2) is π^(3/2)G_5(s).

### KM.10/epsilon-factors: Epsilon factors of moment motives

**Theorem.** Use ψ_p(x)=exp(2πi[x]) and vol(Z_p)=1 at finite primes, ψ_∞(x)=exp(−2πix) with Lebesgue measure at infinity, and geometric reciprocity. Write the WD relation ρ(F_p)Nρ(F_p)^−1=p^−1N and import the local epsilon-factor construction. For odd k, at odd p the factor is w_p p^{|Θ_p^-|((k+2)/2−s)}, with w_p²=(−1,±k!!)_p; at unramified primes, including two, it is one. The infinite factor is i^((k²−1)/8), and the global product is ±N_k^((k+2)/2−s). For even k at odd p it is (−1)^{v_p}p^{u_p((k+2)/2−s)}, with u_p=floor(k/(2p)) and v_p=u_p if p≡1 mod4, v_p=floor(k/(4p)) if p≡3 mod4. The infinite factor is (−1)^{δ_{8|k}}. The remaining two-adic factor is kept explicitly; no conjectural even global sign is substituted.

**Hypotheses.** k≥1; at each finite p use ℓ≠p and an embedding into C; all character, measure and reciprocity choices fixed.

**Construction / proof route.**

1. Apply the imported epsilon formula ε_WD=ε_0 det(−p^−sF_p|V^{ρ(I)}/(ker N)^{ρ(I)}).
2. For odd k use N=0, the quadratic determinant and local duality; use the Hilbert product formula for the global sign ambiguity.
3. For even k use unramified finite Weil inertia and the computed eigenvalues on U; evaluate the archimedean sign with the Hodge table.

**Direct inputs:** KM.8/odd-local; KM.8/even-local; KM.10/determinant; KM.10/gamma-factor; ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor; ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation.

**Source:** FSY, §5.3.1, (5.31)–(5.36), Remarks 5.35 and 5.37, pp. 53–56. Epsilon factors of moment motives; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Completion; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- At k=6,p=3, u=1,v=0, so the odd-prime sign is +1 even though the Euler correction is 1+27T.
- The monodromy determinant term is essential for even k; semisimplifying the Weil representation while discarding N is invalid.

### KM.10/completed-l-function: Completed moment L-functions

**Definition.** For each p choose an auxiliary ℓ_p≠p and a coefficient embedding into C, and initially define L_{k,p}(T)=det(1−TF_p|V_{k,ℓ_p}^{I_p})^−1 with these choices retained. Put L_k(s)=Π_p L_{k,p}(p^−s) in its right half-plane of absolute convergence. KM.11/local-transport removes the auxiliary choices, and KM.11 proves convergence for Re(s)>(k+3)/2 along with continuation. For odd k put Λ_k(s)=N_k^{s/2}G_k(s)L_k(s). For even k let Λ′_k(s)=(N′_k)^{s/2}G_k(s)Π_{p≠2}L_{k,p}(p^−s) and Λ_k(s)=2^{r_k s/2}L_{k,2}(2^−s)Λ′_k(s). Use real logarithms for positive conductors. The source’s earlier partial Euler product over p>k is related to this full product by the explicitly specified finite factors.

**Hypotheses.** k≥1; d=d_k; geometric local factors and paper-normalized gamma factor; auxiliary choices are retained until KM.11/local-transport.

**Construction / proof route.**

1. Construct the Euler product with auxiliary choices on a sufficiently far right half-plane: good-prime purity controls the infinite product and the finitely many bad factors impose a finite bound. The precise convergence region is a KM.11 consequence of local purity.
2. Attach the conductor and archimedean factors with fixed logarithms.
3. Keep the two-adic factor and exponent separate in the even definition; apply meromorphic continuation only after automorphy.

**Direct inputs:** KM.8/odd-conductor; KM.8/even-conductor; KM.10/gamma-factor; ModularityAndLanglandsExtensions:ML.0/compatible-system-archimedean-factors.

**Source:** FSY, §1.1, pp. 2–4; (5.13)–(5.14), pp. 44–45; (5.22), pp. 48–49. Completed moment L-functions; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Completion; namespace TauCeti.Kloosterman.

**Uses that determine the interface.**

- FSY Theorems 1.2 and 1.3: These are the precise analytic functions to which meromorphic continuation and reflection apply.
- KM.11/odd-functional-equation; KM.11/even-functional-equation: Converts the dual-system functional equation to s↦k+2−s.

**API.**

- **TauCeti.Kloosterman.momentLFunction** (constructor): The geometric Euler product with explicit auxiliary choices on its absolute-convergence region; the KM.11 consequences remove choices and give Re(s)>(k+3)/2.
- **TauCeti.Kloosterman.paperGammaFactor** (data): G_k(s)=π^(−d_k s/2)Π_{j=1}^{d_k}Γ((s−j)/2).
- **TauCeti.Kloosterman.completedMomentLFunction** (constructor): The conductor-normalized complete function with every ramified factor included.
- **TauCeti.Kloosterman.completedMomentLFunction_partial** (compatibility): Removing a finite set of Euler factors gives the explicitly corrected partial function.
- **TauCeti.Kloosterman.completedMomentLFunction_standard** (compatibility): The standard-Serre completion differs by π^{d_k(d_k+1)/4}, independent of s.

**Discriminatory unit tests.**

- **TauCeti.Kloosterman.completedMomentLFunction_rank_zero**: At k=4, d=0 and the geometric local factors and completion are one.
- **TauCeti.Kloosterman.completedMomentLFunction_reflection**: For k=3 the reflection is s↦5−s and center 5/2.
- **TauCeti.Kloosterman.completedMomentLFunction_two_factor**: For even k, omitting L_{k,2} or 2^{r_ks/2} gives Λ′_k rather than the asserted full completion.

**Check / worked cases.**

- At k=1,2,4 all middle Euler products and completions equal one.

<a id="km11"></a>
## KM.11: Potential automorphy and functional equations

Apply the imported Patrikis–Taylor theorem, transport local factors through semisimplification, establish the odd root number, and deduce the odd and even meromorphic functional equations. Keep conductor and sign predictions at two outside the proved even target.

**Layer inputs:** KM.9; ModularityAndLanglandsExtensions:ML.2; ArithmeticGaloisRepresentations:R01.2; ArithmeticGaloisRepresentations:R01.3; KM.6; KM.8; PadicHodgeTheory:R06.2; KM.4; KM.7; KM.10.

**Atlas planets:** Local factors under semisimplification; Odd moment functional equation; Even moment functional equation.

### KM.11/potential-automorphy: Potential automorphy of moment systems

**Application.** For k∉{1,2,4}, after enlarging coefficients the semisimplified moment system becomes, over one finite Galois totally real extension, a direct sum of regular algebraic cuspidal polarized automorphic compatible systems. The original positive-rank system is therefore potentially isobaric automorphic. Its completed L-function has meromorphic continuation and the dual-system functional equation. Cuspidality of the whole system is not asserted without irreducibility. For k=3 the conclusion agrees with the one-dimensional Hecke-character case; the rank-zero cases have trivial L-function.

**Hypotheses.** The pure, regular, odd essentially self-dual weakly compatible system is supplied by KM.9/compatible-system; use every hypothesis of the exact PT node.

**Construction / proof route.**

1. Match the coefficient field, purity weight, Hodge–Tate regularity and polarization to the imported theorem.
2. Apply the PT decomposition and common totally real extension, then the imported L-function consequence.
3. Separate the empty and rank-one cases, and retain the isobaric conclusion for reducible higher-rank systems.

**Direct inputs:** KM.9/compatible-system; ModularityAndLanglandsExtensions:ML.2/patrikis-taylor-potential-automorphy; ModularityAndLanglandsExtensions:ML.2/patrikis-taylor-l-function-consequences.

**Source:** FSY, Theorem 5.38, Corollary 5.39 and §5.3.3, pp. 56–58. Potential automorphy of moment systems; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Automorphy; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- No new proof or definition of potential automorphy is planned here.
- The conclusion supplies strict local compatibility for the semisimplified system.

### KM.11/local-transport: Local factors under semisimplification

**Theorem.** For every k≥1, prime p and ℓ≠p, WD_p(r_{k,ℓ}) is pure of weight k+1 and has the same local L- and epsilon factors as WD_p(r_{k,ℓ}^{ss}). The local L-polynomials are independent of ℓ and descend to Q; epsilon factors agree after compatible embeddings into C with the fixed additive characters and measures. In particular the even two-adic factor is the reciprocal of a polynomial in Q[T] with constant term one. The integer conductor is also independent of ℓ. This uses pure associated-graded Weil–Deligne representations and does not assert that inertia invariants commute with arbitrary semisimplification. For odd k the strict p-adic compatibility and admissibility argument also gives v_2(c_n)≥n(n−1) for Z_k(2;T)=Σ c_nT^n, by restoring the trivial factor to the middle Newton bound.

**Hypotheses.** Positive-rank automorphy and its strict compatibility consequence established first; use the zero-rank convention for k=1,2,4.

**Construction / proof route.**

1. Use PTL to obtain purity and strict compatibility for the semisimplified compatible system.
2. Choose a global stable Jordan–Hölder filtration, restrict it locally and apply the exact imported pure-associated-graded WD node.
3. Transport L/epsilon factors and conductor; use coefficient-field automorphisms and rational compatibility to descend local polynomials.
4. For the odd-k two-adic bound apply admissibility to the strictly compatible p-adic realization, then restore the trivial compact-support factor as in Remark 5.41.

**Direct inputs:** KM.11/potential-automorphy; ArithmeticGaloisRepresentations:R01.2/pure-graded-weil-deligne; ModularityAndLanglandsExtensions:ML.2/patrikis-taylor-l-function-consequences; ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation; KM.6/hodge-numbers; KM.8/degree-formulas; PadicHodgeTheory:R06.2/admissible-implies-weakly-admissible; PadicHodgeTheory:R06.2/ddr-exact-strict-tensor.

**Source:** FSY, Lemma 5.40, p. 58; Remark 5.41, p. 59. Local factors under semisimplification; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Automorphy; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- The tame even local monodromy N is retained throughout the argument.
- The result applies at p=2 without providing a conjectural closed formula for its even factor.

### KM.11/odd-root-number: Positive odd moment root number

**Application.** For odd k the global root number of the orthogonal motive M_k, with its even weight k+1, is +1. The application needs the precise theorem on root numbers of even-weight orthogonal motives invoked by FSY from T. Saito; its hypotheses and realization conventions must match this Nori motive and the chosen additive characters. The generic theorem is supplier gap G9 and is not reproved or weakened to an assertion about arbitrary self-dual systems.

**Hypotheses.** k odd and positive; motive with symmetric realization-compatible pairing; a verified version of the orthogonal-motive root-number theorem is required.

**Construction / proof route.**

1. Check that the pairing and weight put M_k in the exact geometric scope of the missing theorem.
2. Apply that theorem with the global character/measure convention of KM.10.
3. Use local-factor transport to identify this motivic root number with the automorphic functional-equation sign.

**Direct inputs:** KM.4/middle-motive; KM.7/galois-realization; KM.10/epsilon-factors; KM.11/local-transport.

**Source:** FSY, §5.3.3, last paragraph, p. 58. Positive odd moment root number; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Automorphy; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- Even weight alone is not a replacement for the orthogonal-motive hypothesis.

### KM.11/odd-functional-equation: Odd moment functional equation

**Theorem.** For every positive odd k, the completed function Λ_k(s)=N_k^{s/2}π^(−d_k s/2)Π_{j=1}^{d_k}Γ((s−j)/2)Π_p L_{k,p}(p^−s) extends meromorphically to C and satisfies Λ_k(s)=Λ_k(k+2−s). Here d_k=(k−1)/2, N_k=Π_{j≤k,j odd}sf(j), and the local factors are those of KM.8, including the exceptional ramified corrections. The full Euler product converges absolutely for Re(s)>(k+3)/2.

**Hypotheses.** k odd and positive; dependencies include the explicit root-number supplier gap G9.

**Construction / proof route.**

1. Use potential automorphy for meromorphic continuation of the semisimplified system.
2. Use local transport and the polarization to rewrite the dual functional equation as the reflection k+2−s.
3. Insert the explicit conductor and gamma factor; the constant discrepancy in the standard gamma normalization cancels.
4. Use the positive odd root number; the rank-zero k=1 case is the identity 1=1.
5. Use local purity after local transport to bound the finitely many bad factors; good-prime purity gives the stated half-plane of absolute convergence.

**Direct inputs:** KM.10/completed-l-function; KM.11/potential-automorphy; KM.11/local-transport; KM.11/odd-root-number.

**Source:** FSY, Theorem 1.2, p. 3; proof §5.3.3, pp. 57–58. Odd moment functional equation; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Automorphy; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- At k=3 the conductor is 3, d=1 and the reflection is s↦5−s.
- No assertion of entire continuation or absence of poles is added.

### KM.11/even-functional-equation: Even moment functional equation

**Theorem.** For every positive even k there exist the actual conductor exponent r_k≥0, the rational reciprocal-polynomial local factor L_{k,2}(T) with L_{k,2}(0)=1, and a sign ε_k∈{±1}, such that Λ_k(s)=2^{r_k s/2}L_{k,2}(2^−s)Λ′_k(s) extends meromorphically to C and satisfies Λ_k(s)=ε_kΛ_k(k+2−s). Here Λ′_k uses the odd-prime factors, N′_k and d_k=floor((k−1)/2)−δ_{4|k} as defined above. The source conjectures r_k=floor(k/6) and the two-adic sign w″_k=(−1)^floor(k/8). The corresponding global sign prediction is ε_k=(−1)^{floor(k/8)+v′_k}, where v′_k=Σ_{p≡1 mod4}floor(k/(2p))+Σ_{p≡3 mod4}floor(k/(4p))+δ_{8|k}, the sums running over odd primes. These are boundary questions, not conclusions. The full Euler product converges absolutely for Re(s)>(k+3)/2.

**Hypotheses.** k even and positive; k=2,4 give the trivial completion and sign +1.

**Construction / proof route.**

1. Apply the potential-automorphy L-function consequence and local transport at every prime, including two.
2. Use the polarization for the reflection and the explicit odd-prime factors, conductor and gamma factor.
3. Package the uncomputed two-adic invariants as their actual geometric objects; do not choose them arbitrarily to force the equation.
4. Use local purity after local transport to bound the finitely many bad factors; good-prime purity gives the stated half-plane of absolute convergence.

**Direct inputs:** KM.10/completed-l-function; KM.11/potential-automorphy; KM.11/local-transport; KM.10/epsilon-factors.

**Source:** FSY, Theorem 1.3, p. 4; §5.3.1–§5.3.3, pp. 55–58. Even moment functional equation; the target below fixes coefficients, degree shifts and normalization explicitly.

**Proposed home:** TauCeti/NumberTheory/Kloosterman/Automorphy; namespace TauCeti.Kloosterman.

**Check / worked cases.**

- The result proves existence and rationality of the two-adic factor without proving the Broadhurst–Roberts conductor or sign predictions.
- The trivial k=2 and k=4 cases have r_k=0,L_{k,2}=1,ε_k=1.
- At k=8 the conjectured two-adic sign is −1 and v′_8=1, so the conjectured global sign is +1; this is a convention check, not a proved sign formula.



## Supplier requests

These are contracts to the named owner, not new definitions in this roadmap. An exact external node is used wherever the inspected supplier already has one. Requests name the missing extension when only the stage is available.

### R1: SchemeAndStackFoundations:SF.2

Provide the actual rational ℓ-adic complexes on finite-type schemes, compact support and support-to-ordinary maps, finite/proper/smooth base change, Künneth, geometric Galois action, trace formula for every finite extension and Grothendieck–Ogg–Shafarevich on G_m. The rank-one Artin–Schreier coefficient is the ψ eigensummand of the pushforward along u↦u^p−u, with trace ψ∘Tr. Import PR196 suppliers where already owned; no second six-functor implementation is requested.

**Consumers:** KM.1/deligne-sheaf; KM.1/cohomological-moments; KM.7/galois-realization; KM.8/degree-formulas.

### R2: EtaleDualityAndPerverseSheaves:EDC.1

Use rational ℓ-adic Verdier duality, localization and the ordinary/compact-support exchange maps for the finite-type tori and hypersurface pairs over Q, F_p and their algebraic closures. Preserve geometric rather than absolute Galois cohomology and retain every shift.

**Consumers:** KM.1/deligne-sheaf; KM.4/finite-field-realization.

### R3: EtaleDualityAndPerverseSheaves:EDC.2

Use smooth Poincaré duality and trace with the normalization on G_m and the ambient smooth torus; use cohomology with supports for the singular zero locus instead of falsely applying smooth purity to it.

**Consumers:** KM.4/finite-field-realization.

### R4: EtaleDualityAndPerverseSheaves:EDC.4

Use projective-quadric cohomology, the projective-bundle and smooth-center blowup/localization maps, with Tate twists, Frobenius and group equivariance, to compare the χ-isotypic cohomology of the even resolution.

**Consumers:** KM.7/even-resolution.

### R5: ArithmeticGaloisRepresentations:G7

Consume its existing symmetric-power/polarization carrier, and extend as Arithmetic Galois Representations, Part II if necessary to the following exact missing contract: for a characteristic-zero field E, an E-algebra with E-linear anti-involution *, and a finite-dimensional module with nondegenerate *-compatible symmetric or alternating bilinear form, its semisimplification admits a *-compatible form of the same type. Source: Serre, arXiv:1708.00046v3, Theorem 4.2.1, pp. 9–10; apply to E[G_Q] with g*=χ_cyc(g)^(−k−1)g^−1. Ordinary self-duality without the form’s symmetry is insufficient.

**Consumers:** KM.9/compatible-system.

### R6: MotivesAndAlgebraicCycles:MC.5

Extend the existing rational Nori-category and pair-cohomology nodes by a functorial exhaustive finite weight filtration on H_c and exact weight-compatible Betti, de Rham and ℓ-adic realizations, Tate twists and projector images. FSY (3.1), p. 18 cites Huber–Müller-Stach Theorem 10.2.5 for weights; that original theorem has not been read here. Specify an extension Part II; MC.5’s current category nodes do not assert this contract. See G3.

**Consumers:** KM.4/middle-motive.

### R7: PadicDifferentialEquationsAndRigidCohomology:RD.4

Use the actual overconvergent coefficient cohomology and compact-support complexes, finite-field Frobenius, Künneth, localization and finite-equivariant base-change maps for Dwork exponential coefficients on the Kloosterman tori. Retain coefficient-field extension to a field containing ϖ.

**Consumers:** KM.4/rigid-realization.

### R8: PadicDifferentialEquationsAndRigidCohomology:RD.6

Use the geometric Fourier transform, rigid trace formula, weights and purity for the indicated overconvergent exponential coefficient, compatible with supports and the signed symmetric projector. Fix d+ϖ dz and the F*→E multiplier exp(ϖ(z^p−z)); do not depend on an unchecked explicit Weyl-algebra Frobenius-series formula.

**Consumers:** KM.4/rigid-realization.

### R9: tauceti:TauCetiRoadmap/AnalyticToricGeometry#layer-0-the-toric-compatible-algebraic-supplier

Consume the finite regular fan, character monoid, monoid-algebra charts and gluing on the existing toric carriers for the complex fiber. Its current main has these objects already. The Z/Q arithmetic extension and base-change compatibility needed by the Kloosterman model are additional Part II contracts, G7, rather than a new general fan implementation.

**Consumers:** KM.6/signed-fan.

### R10: CohomologyComparisons:CP.2

Use the smooth-proper rational crystalline comparison with Frobenius and Tate-twist compatibility for the good integral compactification or resolution and its smooth proper boundary strata, then pass through the projector and boundary kernels.

**Consumers:** KM.9/padic-comparison.

### R11: CohomologyComparisons:CP.3

Use the filtered proper-smooth de Rham comparison over Q_p for the geometric compactification/resolution and every boundary stratum. Require strict compatibility with boundary maps, rational projectors and the Tate twist to identify D_dR(V_{k,p}).

**Consumers:** KM.9/padic-comparison.

### R12: CohomologyComparisons:CP.4

Use the proper semistable B_st comparison with Frobenius, N, filtration and boundary restriction over Q_p(sqrt(−p)) for a verified semistable Kloosterman model. This request does not assert existence of that model; the higher-thickness construction is G6.

**Consumers:** KM.9/padic-comparison.

### R13: ArithmeticGaloisRepresentations:R01.5

Use characteristic-zero Frobenius-polynomial recognition for one-dimensional continuous characters over a common coefficient field to identify the determinant character from the good primes p>k. No unobstructed coefficient descent theorem for arbitrary higher-dimensional systems is requested.

**Consumers:** KM.10/determinant.

## Gaps and closure obligations

All twelve layers are planned with empty target worklists. None is closed: the following gaps and the supplier contracts remain open. These are mathematical and ownership obligations, not hidden assumptions in an implementation.

### G1: Holonomic operations and Fourier foundations

No existing companion MixedHodgeModulesAndIrregularHodgeTheory definition, packet or reserved stage was found. The exact general input is the category of algebraic holonomic left D-modules on smooth characteristic-zero varieties; direct/inverse images with the de Rham shifts of FSY A.1, pp. 59–61; duality and intermediate extension; exponential tensor connections and induced symmetric-power connections on the existing local module quotient; Fourier inversion, stationary phase and the regular Gauss–Manin comparison; logarithmic canonical extensions and local formal slope calculations. These must be owned by a new foundational companion extending the existing analytic/derived suppliers. EDC.5 only treats étale/perverse coefficients and does not provide these operations. No invented stage id is used as an already supplied prerequisite.

**Affected targets:** KM.2/connection; KM.2/cyclic-cover; KM.2/connection-structure; KM.2/symmetric-connections; KM.3/thom-sebastiani; KM.3/middle-cohomology; KM.3/de-rham-realization; KM.3/inverse-fourier; KM.5/rank-two-frame; KM.5/formal-type; KM.5/intermediate-extensions; KM.5/inverse-fourier-local; KM.5/de-rham-bases.

### G2: Mixed Hodge modules and irregular Hodge comparison

The missing companion must provide Saito mixed Hodge modules, strict filtered morphisms, six operations with weights, nearby/vanishing cycles, exponential projector Π and its de Rham fiber functor (FSY Appendix A.2–A.5, pp. 61–67). Needed exact milestones are Proposition A.13 (classical subcategory has the ordinary filtration), Theorem A.24 (product t g on A¹×V, constant A¹ factor, and the stated *0/!0 variants), Example A.27 (compact-support/local-support hypersurface comparison), Theorem A.30/Corollary A.31 (Fourier fibers and nearby-cycle Hodge data), pp. 65–72; also the filtered blowup invariance, E₁ degeneration and Newton filtration results used in §4.3, pp. 35–37. Tau Ceti already has MHS carriers and strictness; HodgeStructuresPartII concerns variations/Higgs objects and does not supply MHM or these irregular operations. This is a precise new-companion request, not a claim of closure.

**Affected targets:** KM.3/inverse-fourier; KM.4/classical-hodge; KM.4/hypersurface-comparison; KM.6/cover-hodge-numbers; KM.6/newton-weights; KM.6/product-compactification; KM.6/filtered-bases.

### G3: Nori weights and realization compatibility

MC.5 supplies a rational Nori category, tensor structure and cohomology-with-supports nodes, but no exact node inspected states the functorial Nori weight filtration and all realization compatibilities needed for gr^W H_c. Request the specified MC.5 extension as Motives and Algebraic Cycles, Part II. FSY (3.1), p. 18 points to Huber–Müller-Stach Theorem 10.2.5; its original text was not consulted and a theorem/page-level primary check remains. No passage or file from a restricted book was copied. A vector-space weight filtration cannot be promoted to a motivic one by definition.

**Affected targets:** KM.4/middle-motive; KM.7/galois-realization.

### G4: Characteristic-two nonordinary quadratic vanishing cycles

The exact input at p=2 and odd k is concentration of the vanishing-cycle cohomology in degree k−1 for the isolated nonordinary quadratic singularity y_i=1, giving injective cospecialization in that degree (FSY proof of Theorem 5.8, p. 43, citing Illusie, Perversité et variation, Corollary 2.10). The inspected LPV.2 ordinary-quadratic contract excludes this case. Add the nonordinary theorem as Lefschetz Pencils and Vanishing Cycles, Part II; the Illusie source and its exact hypotheses have not been read here. Dimension equality alone does not establish injectivity.

**Affected targets:** KM.7/singularities; KM.8/odd-local.

### G5: Generic preservation of similitude forms under semisimplification

The needed general statement is now pinned directly to Serre Theorem 4.2.1, pp. 9–10, read with its proof. A maximal isotropic submodule gives an anisotropic semisimple quotient and a paired hyperbolic summand; this produces the same symmetric or alternating type on the semisimplification. G7 has the symmetric-power polarization API but no exact node found for this theorem for algebras with involution. The request specifies it and the χ_cyc-twisted group-algebra involution; add it to that owner as a Part II extension, not as another Kloosterman theorem.

**Affected targets:** KM.9/compatible-system.

### G6: Higher-thickness semistable model in the bad-prime comparison

The existing RD.7 Mieda node requires each local equation over Z_p[sqrt(−p)] to be Q−u(sqrt(−p))² with u a unit. The expansion in FSY (5.6)/(5.16) has constant 2ap/2bp. For example k=9,p=3,a=3 gives constant 18 of valuation two, not one; p may divide the orbit parameter. The assertion on FSY p. 50 does not verify this unit hypothesis. A resolution for arbitrary thickness, a stronger comparison theorem, or another proof of semistability and Frobenius compatibility is required. The good-prime crystalline branch and the all-prime de Rham assertion do not use this step. Record source issue E9 and the limitation of the imported RD.7 node; do not silently treat it as an unconditional supplier.

**Affected targets:** KM.9/padic-comparison; KM.9/newton-polygon.

### G7: Arithmetic base extension of the current toric supplier

The current AnalyticToricGeometry README and Suggested file are built on the implemented toric fan/monoid-algebra/gluing API, but their scheme carrier is over C. The Kloosterman model needs the same regular signed fan over Z and Q, compatible base changes to all F_p and Z_p, properness, smoothness, monomial charts, toric boundary and equivariant blowups. Specify Analytic Toric Geometry, Part II: arithmetic toric models, importing the current layer unchanged. The signed fan and its explicit g_1 calculation are owned here; general toric geometry is not replanned.

**Affected targets:** KM.6/signed-fan; KM.6/product-compactification; KM.7/integral-boundary; KM.7/even-resolution.

### G8: Original proof leaves of arithmetic Kloosterman inputs

The exact theorem statements were read in FSY Proposition 2.7, §3.2.1 and §5.1.1, pp. 12,24,39–40, and XZ §1.1.2, p. 3. The original Deligne construction, Katz local/differential monodromy proofs, Fu–Wan determinant/local invariant calculations and Yun’s characteristic-two formula were not read at proof level in this run. Their full cited conclusions are separate targets here, with all exceptional branches retained; the backward proof chain still needs original-source decomposition. Locate Deligne SGA 4½ Sommes trig. 7.4/7.8, Katz’s referenced monodromy results, Fu–Wan 2005 Theorem 0.2 and 2010 Theorem 0.1, and Yun Lemma 4.3.4/Corollary 4.3.5 before treating those proof leaves as supplied. No unconsulted source is represented as read.

**Affected targets:** KM.1/sheaf-structure; KM.1/monodromy; KM.2/differential-galois; KM.8/degree-formulas; KM.10/determinant.

### G9: Orthogonal-motive root-number theorem and scope

FSY p. 58 invokes T. Saito, The sign of the functional equation of the L-function of an orthogonal motive, Invent. Math. 120 (1995), 119–142. The original theorem and its exact motive/realization hypotheses have not been read, and no matching atlas node was found. A Motives and Algebraic Cycles, Part II extension should supply the precise even-weight orthogonal-motive root-number theorem, with compatibility for this Nori motive and the global measure/character convention. The generic epsilon-factor node supplies local constants, not positivity of their global product. Until that contract is verified, the explicit + sign of the odd functional equation has this recorded input gap.

**Affected targets:** KM.11/odd-root-number; KM.11/odd-functional-equation.

## Ownership and structural proposals

1. **extend: MixedHodgeModulesAndIrregularHodgeTheory.** Create the foundational companion proposed in the FSY extraction: it has no current definition or reserved stage. It owns G1–G2 in a single compatible holonomic/MHM/EMHS theory and imports existing Hodge structures and perverse categories. Keep only the explicit Kloosterman Gauss–Manin objects, signed potentials, compactifications and computations here. A design job for the companion must name actual stages before consumers can use stage prerequisites.
2. **extend: MotivesAndAlgebraicCycles.** Motives and Algebraic Cycles, Part II must add Nori weights/realization compatibility (G3) and the orthogonal-motive root-number input (G9), building on MC.5/MC.2 without changing their existing nodes. Retain the precise MC.5 request and both gaps; locate primary statements and compatible realizations in the extension.
3. **extend: LefschetzPencilsAndVanishingCycles.** Lefschetz Pencils and Vanishing Cycles, Part II adds Illusie’s isolated nonordinary quadratic case in characteristic two, G4. Import the ordinary LPV.2 formula unchanged; no ordinary-p≠2 theorem is relabeled as a characteristic-two result.
4. **extend: ArithmeticGaloisRepresentations.** Arithmetic Galois Representations, Part II adds Serre’s algebra-with-involution semisimplification theorem to the existing dimension-general polarization supplier, G5. Use the explicit G7 request, with Serre §4.1–4.2 as primary source; the Kloosterman system node is only its application.
5. **extend: tauceti:TauCetiRoadmap/AnalyticToricGeometry.** Analytic Toric Geometry, Part II: arithmetic toric models extends complex toric gluing to the base rings and compatibilities in G7. A new proposed extension starts at the current library’s fan/scheme API and does not edit or replan the upstream roadmap.
6. **rescope: KloostermanMomentsAndPotentialAutomorphy, KloostermanSheavesAndBesselIsocrystals.** The three Xu–Zhu foundations are coalesced here with the FSY foundations in every rank r≥2. The Bessel-isocrystal companion consumes KM.1 and KM.2, including weight-zero monodromy and the Bessel module/solution sign dictionary. It retains reductive-group constructions and the actual F-isocrystal companion theorem. Rank-two arithmetic moments remain here.

**Upstream note, PadicDifferentialEquationsAndRigidCohomology:RD.7/mieda-p-adic-picard-lefschetz:** The existing node is usable only under its stated unit-thickness local model. G6/E9 records a Kloosterman application that does not verify that hypothesis. No edit to the supplier is made.

## Source issues used in this plan

The following are proposed corrections or proof obligations, with their status distinguished from an independent erratum review. The targets use the corrected conventions. No source passages are reproduced.

### E1: FSY arXiv v5, §3.2.1, p. 23

**Kind / effect:** misprint / nothing.

**Issue:** The single Kloosterman sheaf’s Gauss–Manin expression uses a torus dimension involving k.

**Correction or obligation:** Use n coordinates, not nk, before forming the kth tensor power.

**Reason:** The single-sheaf potential has n integration coordinates; k is introduced only by the tensor construction.

**Status:** Already reported in the FSY extraction and its sourceIssues; checked independently here. No published correction identified.

**Independent review:** confirmed — Confirmed directly at FSY p. 23: the single-sheaf integral has n coordinates, while nk belongs to the tensor-power construction.

**Searches performed.**

- FSY arXiv v5 and XZ arXiv v2 at the cited pages, read 2026-10-19
- Existing PAPER-FRESAN-SABBAH-YU-22 and PAPER-XU-ZHU-22 sourceIssues/reviews
- Web search 2026-10-19 for paper title plus erratum/correction; no published correction found in the results inspected

### E2: FSY arXiv v5, proof of Proposition 4.20, p. 33

**Kind / effect:** misprint / nothing.

**Issue:** The primitive part for the infinity monodromy is indexed by k.

**Correction or obligation:** Use the primitive piece with index k−1 in the indicated Hodge–Lefschetz decomposition.

**Reason:** The monodromy weight filtration there is centered at k−1; the following graded calculation uses that center.

**Status:** Already reported in the FSY extraction and its sourceIssues; checked independently here. No published correction identified.

**Independent review:** confirmed — Confirmed at FSY p. 33: the monodromy filtration is centered at k−1; the primitive index is k−1 and the top weight of the length-k block is 2k−2.

**Searches performed.**

- FSY arXiv v5 and XZ arXiv v2 at the cited pages, read 2026-10-19
- Existing PAPER-FRESAN-SABBAH-YU-22 and PAPER-XU-ZHU-22 sourceIssues/reviews
- Web search 2026-10-19 for paper title plus erratum/correction; no published correction found in the results inspected

### E3: FSY arXiv v5, §5.1.1, p. 40

**Kind / effect:** misprint / nothing.

**Issue:** The reciprocal-eigenvalue pairing uses p to half the cohomological weight.

**Correction or obligation:** The partner of α is p^(k+1)/α.

**Reason:** A weight-(k+1) eigenvalue has absolute value p^((k+1)/2). Dividing this same magnitude by α would give magnitude one. The k=3,p=2 eigenvalue −4 is fixed by 16/α, not by 4/α.

**Status:** Already reported in the FSY extraction and its sourceIssues; checked independently here. No published correction identified.

**Independent review:** confirmed — Confirmed at FSY p. 40: purity and self-duality pair α with p^(k+1)/α. The eigenvalue −4 at k=3,p=2 is fixed by this corrected involution.

**Searches performed.**

- FSY arXiv v5 and XZ arXiv v2 at the cited pages, read 2026-10-19
- Existing PAPER-FRESAN-SABBAH-YU-22 and PAPER-XU-ZHU-22 sourceIssues/reviews
- Web search 2026-10-19 for paper title plus erratum/correction; no published correction found in the results inspected

### E4: FSY arXiv v5, §5.1.2, p. 41

**Kind / effect:** misprint / the proof.

**Issue:** The derivative is said to be nowhere zero on an entire ambient coordinate divisor, and the normal-crossings index sequence permits repetition.

**Correction or obligation:** Restrict the derivative assertion to the hypersurface’s intersection with that divisor and use distinct component indices.

**Reason:** On g_1=z_r=0, the derivative is −1/z_1 and hence a unit. On z_r=0 alone, its displayed polynomial can vanish; repeated components do not test transverse crossings.

**Status:** Already reported in the FSY extraction and its sourceIssues; checked independently here. No published correction identified.

**Independent review:** confirmed — Confirmed at FSY p. 41: the derivative is a unit on the hypersurface intersection with the boundary, not on the entire ambient divisor; crossing components must be distinct.

**Searches performed.**

- FSY arXiv v5 and XZ arXiv v2 at the cited pages, read 2026-10-19
- Existing PAPER-FRESAN-SABBAH-YU-22 and PAPER-XU-ZHU-22 sourceIssues/reviews
- Web search 2026-10-19 for paper title plus erratum/correction; no published correction found in the results inspected

### E5: FSY arXiv v5, Corollary 5.30, p. 52

**Kind / effect:** error / a stated result.

**Issue:** The displayed paper-normalized gamma product is identified exactly with the preceding standard Serre recipe.

**Correction or obligation:** They differ by the nonzero constant π^{d_k(d_k+1)/4}. Keep both factors and identify them only after this multiplication.

**Reason:** Multiplying Γ_R(s−j)=π^(−(s−j)/2)Γ((s−j)/2) over j=1,…,d_k gives that constant. All completed functional equations are unaffected.

**Status:** Already reported in the FSY extraction and its sourceIssues; checked independently here. No published correction identified.

**Independent review:** confirmed — Confirmed at FSY p. 52 by multiplying the standard Γ_R factors: their ratio to the displayed paper normalization is π^{d_k(d_k+1)/4}. This constant cancels from the functional equation.

**Searches performed.**

- FSY arXiv v5 and XZ arXiv v2 at the cited pages, read 2026-10-19
- Existing PAPER-FRESAN-SABBAH-YU-22 and PAPER-XU-ZHU-22 sourceIssues/reviews
- Web search 2026-10-19 for paper title plus erratum/correction; no published correction found in the results inspected

### E6: FSY arXiv v5, Example A.3, p. 63

**Kind / effect:** misprint / nothing.

**Issue:** The first divisor-pullback display identifies the unshifted i*Q_U^p and its degree-zero cohomology with Q_D^p.

**Correction or obligation:** For the normalized perverse constant objects use i*Q_U^p[−1] ≃ H^(−1)i*Q_U^p ≃ Q_D^p. The following exceptional-pullback display with i! and shift [1] is correct.

**Reason:** A divisor has dimension one less than its ambient smooth variety, so pulling back Q_U[dim U] gives Q_D^p[1].

**Status:** Already reported in the FSY extraction and its sourceIssues; checked independently here. No published correction identified.

**Independent review:** confirmed — Confirmed with the description corrected after inspecting FSY p. 63: the first i* display omits the shift and uses degree zero. For a smooth divisor i*Q_U^p=Q_D^p[1], giving perverse degree −1. The next i! display is not erroneous.

**Searches performed.**

- FSY arXiv v5 and XZ arXiv v2 at the cited pages, read 2026-10-19
- Existing PAPER-FRESAN-SABBAH-YU-22 and PAPER-XU-ZHU-22 sourceIssues/reviews
- Web search 2026-10-19 for paper title plus erratum/correction; no published correction found in the results inspected

### E7: FSY arXiv v5, Example A.27, p. 71

**Kind / effect:** misprint / nothing.

**Issue:** The pushforward supported at the zero point is described as the zero operation.

**Correction or obligation:** It is a functor supported at zero, not the zero functor.

**Reason:** The subsequent nonzero hypersurface cohomology is carried by that point-supported object; killing it would erase the comparison.

**Status:** Already reported in the FSY extraction and its sourceIssues; checked independently here. No published correction identified.

**Independent review:** confirmed — Confirmed at FSY p. 71: the composite factors through the zero point and is point-supported; it is not the zero functor.

**Searches performed.**

- FSY arXiv v5 and XZ arXiv v2 at the cited pages, read 2026-10-19
- Existing PAPER-FRESAN-SABBAH-YU-22 and PAPER-XU-ZHU-22 sourceIssues/reviews
- Web search 2026-10-19 for paper title plus erratum/correction; no published correction found in the results inspected

### E8: XZ arXiv v2, §1.1.1, pp. 2–3; §2.1.5, p. 10; §4.1.13, p. 42

**Kind / effect:** error / the proof.

**Issue:** The introduction and §4.1.13 left D-module presentation use opposite exponential signs; the displayed Dwork multiplier is combined with the incompatible connection direction.

**Correction or obligation:** Fix E^λ=(O,d+λdx)=D/D(∂−λ). A horizontal map F*E→E for λ=ϖ has multiplier exp(ϖ(x^p−x)); inverse exponential conventions require inversion of the additive character and the corresponding parity pullback. Distinguish the scalar equation of horizontal coefficients from the cyclic module equation.

**Reason:** Horizontality gives d log u=ϖ(d(x^p)−dx) for this map. The Bessel matrix horizontal recurrence introduces (−1)^r, whereas its cyclic last basis vector satisfies θ^r−λ^r x.

**Status:** The exponential/Frobenius mismatch is already PAPER-XU-ZHU-22/E22. The module-versus-horizontal-coefficient check is stated explicitly here; no published correction identified.

**Independent review:** confirmed — Confirmed at XZ pp. 2,10,42. For d+ϖdx a multiplier u:F*E→E satisfies d log u=ϖ(d(x^p)−dx); exp(ϖ(x^p−x)) has that derivative. The cyclic module and horizontal-solution equations must retain their separate signs.

**Searches performed.**

- FSY arXiv v5 and XZ arXiv v2 at the cited pages, read 2026-10-19
- Existing PAPER-FRESAN-SABBAH-YU-22 and PAPER-XU-ZHU-22 sourceIssues/reviews
- Web search 2026-10-19 for paper title plus erratum/correction; no published correction found in the results inspected

### E9: FSY arXiv v5, proof of Proposition 5.23, p. 50, compared with (5.6), p. 41 and (5.16), p. 45

**Kind / effect:** gap / the proof.

**Issue:** Every remaining ordinary quadratic point is asserted to have a local smoothing parameter equal to a unit times (sqrt(−p))².

**Correction or obligation:** Either restrict this assertion to orbit parameters prime to p, or supply the higher-thickness semistable resolution/comparison argument. The proposition remains a target; this proof step is unresolved.

**Reason:** For k=9,p=3,a=3, the all-plus critical point has critical value 18. The formal Morse normal form over Z_3 has smoothing thickness v_3(18)=2, whereas a unit times (sqrt(−3))² has valuation one. The same issue occurs for even positive b divisible by p. The imported RD.7 theorem explicitly assumes unit thickness and cannot be applied as written.

**Status:** Independent review REV-DESIGN-KloostermanMomentsAndPotentialAutomorphy confirms the recorded proof gap. No disproof of Proposition 5.23 is claimed.

**Independent review:** confirmed — Confirmed as a gap in the stated proof, not a disproof of Proposition 5.23. FSY pp. 41,45,50 give critical constant 2ap or 2bp. At k=9,p=3,a=3 the Hessian is nondegenerate and the critical value 18 has valuation two. Formal Morse reduction retains this thickness, whereas the imported RD.7 node assumes valuation one. An additional resolution/comparison argument is still required.

**Searches performed.**

- FSY arXiv v5 and XZ arXiv v2 at the cited pages, read 2026-10-19
- Existing PAPER-FRESAN-SABBAH-YU-22 and PAPER-XU-ZHU-22 sourceIssues/reviews
- Web search 2026-10-19 for paper title plus erratum/correction; no published correction found in the results inspected

## Routed-item coverage

All 46 FSY items and all three Xu–Zhu items routed to this coalesced roadmap have a disposition. An imported item keeps its owner; a boundary item does not become an extra target.

- **PAPER-FRESAN-SABBAH-YU-22/29** — own target: KM.0/raw-sum; KM.0/symmetric-trace; KM.0/moments; KM.0/moment-series.
- **PAPER-FRESAN-SABBAH-YU-22/30** — own target: KM.8/middle-polynomial; KM.10/completed-l-function.
- **PAPER-FRESAN-SABBAH-YU-22/31** — own target: KM.11/odd-functional-equation.
- **PAPER-FRESAN-SABBAH-YU-22/32** — own target: KM.11/even-functional-equation.
- **PAPER-FRESAN-SABBAH-YU-22/33** — own target: KM.1/deligne-sheaf; KM.1/cohomological-moments.
- **PAPER-FRESAN-SABBAH-YU-22/34** — own target: KM.2/connection; KM.2/symmetric-connections.
- **PAPER-FRESAN-SABBAH-YU-22/35** — own target: KM.2/connection-structure.
- **PAPER-FRESAN-SABBAH-YU-22/36** — own target: KM.2/differential-galois.
- **PAPER-FRESAN-SABBAH-YU-22/37** — own target: KM.3/thom-sebastiani.
- **PAPER-FRESAN-SABBAH-YU-22/38** — own target: KM.3/de-rham-realization.
- **PAPER-FRESAN-SABBAH-YU-22/39** — own target: KM.3/middle-cohomology; KM.3/de-rham-realization.
- **PAPER-FRESAN-SABBAH-YU-22/40** — own target: KM.3/inverse-fourier.
- **PAPER-FRESAN-SABBAH-YU-22/41** — own target: KM.4/classical-hodge.
- **PAPER-FRESAN-SABBAH-YU-22/42** — own target: KM.4/hypersurface-comparison.
- **PAPER-FRESAN-SABBAH-YU-22/43** — own target: KM.4/middle-motive.
- **PAPER-FRESAN-SABBAH-YU-22/44** — own target: KM.4/finite-field-realization.
- **PAPER-FRESAN-SABBAH-YU-22/45** — own target: KM.5/formal-type.
- **PAPER-FRESAN-SABBAH-YU-22/46** — own target: KM.5/intermediate-extensions.
- **PAPER-FRESAN-SABBAH-YU-22/47** — own target: KM.5/inverse-fourier-local.
- **PAPER-FRESAN-SABBAH-YU-22/48** — own target: KM.5/dimensions.
- **PAPER-FRESAN-SABBAH-YU-22/49** — own target: KM.5/de-rham-bases.
- **PAPER-FRESAN-SABBAH-YU-22/50** — own target: KM.6/cover-hodge-numbers.
- **PAPER-FRESAN-SABBAH-YU-22/51** — own target: KM.6/filtered-bases.
- **PAPER-FRESAN-SABBAH-YU-22/52** — own target: KM.6/hodge-numbers.
- **PAPER-FRESAN-SABBAH-YU-22/53** — own target: KM.8/odd-local.
- **PAPER-FRESAN-SABBAH-YU-22/54** — own target: KM.8/even-local.
- **PAPER-FRESAN-SABBAH-YU-22/57** — own target: KM.10/gamma-factor.
- **PAPER-FRESAN-SABBAH-YU-22/60** — own target: KM.8/degree-formulas.
- **PAPER-FRESAN-SABBAH-YU-22/62** — own target: KM.10/epsilon-factors.
- **PAPER-FRESAN-SABBAH-YU-22/63** — boundary:  Broadhurst–Roberts two-adic exponent and even sign predictions are not proved in the source and are excluded from the theorem. KM.11/even-functional-equation retains the actual unknown invariants..
- **PAPER-FRESAN-SABBAH-YU-22/65** — boundary:  Bessel periods and special L-values are sequel targets outside this roadmap; no theorem about them is asserted..
- **PAPER-FRESAN-SABBAH-YU-22/67** — own target: KM.1/monodromy; KM.2/differential-galois.
- **PAPER-FRESAN-SABBAH-YU-22/71** — own target: KM.5/rank-two-frame; KM.2/connection-structure.
- **PAPER-FRESAN-SABBAH-YU-22/72** — own target: KM.6/signed-fan; KM.6/product-compactification.
- **PAPER-FRESAN-SABBAH-YU-22/74** — own target: KM.7/integral-boundary.
- **PAPER-FRESAN-SABBAH-YU-22/75** — own target: KM.7/singularities.
- **PAPER-FRESAN-SABBAH-YU-22/76** — own target: KM.7/galois-realization.
- **PAPER-FRESAN-SABBAH-YU-22/79** — own target: KM.7/even-resolution.
- **PAPER-FRESAN-SABBAH-YU-22/80** — own target: KM.8/degree-formulas.
- **PAPER-FRESAN-SABBAH-YU-22/81** — own target: KM.8/odd-conductor.
- **PAPER-FRESAN-SABBAH-YU-22/82** — own target: KM.8/even-conductor.
- **PAPER-FRESAN-SABBAH-YU-22/86** — own target: KM.10/determinant.
- **PAPER-FRESAN-SABBAH-YU-22/87** — import: ModularityAndLanglandsExtensions:ML.0/compatible-system-archimedean-factors Serre’s general real-Hodge gamma recipe is already owned by ML.0; only its Kloosterman evaluation is KM.10/gamma-factor..
- **PAPER-FRESAN-SABBAH-YU-22/90** — own target: KM.9/compatible-system.
- **PAPER-FRESAN-SABBAH-YU-22/91** — supplier extension: ArithmeticGaloisRepresentations:G7 Exact generic contract in the G7 request and G5, directly sourced to Serre Theorem 4.2.1; do not duplicate the generic theorem here..
- **PAPER-FRESAN-SABBAH-YU-22/92** — supplier extension: KM.11/odd-root-number G9 records the exact missing orthogonal-motive sign input; its Kloosterman application is named explicitly..
- **PAPER-XU-ZHU-22/1** — own target: KM.2/connection; KM.2/bessel-dictionary.
- **PAPER-XU-ZHU-22/2** — own target: KM.0/raw-sum; KM.1/deligne-sheaf; KM.1/normalized-sheaf; KM.1/sheaf-structure.
- **PAPER-XU-ZHU-22/3** — own target: KM.1/monodromy.

## Closure criteria

Closure requires the contracts in G1–G9 and every supplier request, with the exact normalizations and exceptional branches stated above. In particular, characteristic-two vanishing cycles, the higher-thickness semistable comparison and the orthogonal-motive root-number input require their precise hypotheses. The structural checker and suggested signatures validate interfaces; they do not prove these mathematical targets. The handoff records the compilation and consistency checks.
