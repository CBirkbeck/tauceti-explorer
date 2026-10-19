# Roadmap: Automorphic congruences and reverse main-conjecture divisibilities

Eisenstein congruences produce Galois extension classes and lower bounds for Selmer groups. This roadmap plans that route to the reverse divisibility in Iwasawa main conjectures for modular forms, then plans its compatibility with universal deformation families and cyclotomic descent. Its endpoints are Skinner–Urban's ordinary divisibilities, the source-qualified Castella–Liu–Wan and Fouquet–Wan results, Fouquet–Wan's pointwise and universal-family statements, and Burungale–Castella–Skinner's rational and conditional integral cyclotomic equality for ordinary elliptic curves. Each statement retains its own residual, local, coefficient-ring and period hypotheses.

The arithmetic targets below are plans. Their proof outlines retain the missing supplier contracts and source-reading limitations listed at the end. In particular, acceptance of a plan does not prove its theorems, establish torsion by convention, or discharge a period comparison. The [suggested Lean file](../suggested/AutomorphicCongruences.lean) states the interfaces expressible at the pinned libraries; absent arithmetic carriers remain mathematical targets in this document.

## Scope and boundaries

This roadmap owns source-specific Eisenstein data, integral coefficient and boundary identities, congruence-to-Selmer instances, and the compatibility maps that assemble its endpoints. General constructions are imported from their owners. The boundaries below also apply when an imported roadmap has not yet supplied the required refinement.

| Neighbour | Imported interface and boundary |
| --- | --- |
| [PadicFamilies](../../../content/campaign/PadicFamilies/README.md), L1, L4, L5 | Generic congruence modules and period lines, big ordinary GL₂ representations and Hilbert Hida theory. This roadmap identifies the precise SU/Wan lattices and periods; the integral homology/cohomology and Hilbert pairing comparisons remain explicit obligations. |
| [IntegralHeckeAndGaloisDeterminants](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants), Layers 2, 4, 6 | Existing roadmap for integral Hecke images, determinants and the rank-two two-character Ribet/Fitting theorem. The polarized residual shape 1+n+1 of SU and 1+2+1 of Wan requires the stated extension contract; the rank-two theorem is not its proof. The SU source-specific construction remains in L0 pending Part II routing. |
| [ProfiniteCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ProfiniteCohomology), Layer 7, and the current Tau Ceti library | Continuous Shapiro for discrete coefficients. Finite p-primary coefficients and their direct limits, or the discrete Iwasawa dual coefficient, are used through the requested Selmer adapter; the compact Tate lattice is not a discrete coefficient module. |
| [EllipticCurves](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), Layer 2, and Tau Ceti's quadratic-twist API | Existing torsion/Tate-module plan and point-group twist equivariance. The integral inverse-limit, ordinary-filtration and Selmer dictionaries are comparisons required here, not a second construction of elliptic geometry. |
| [PadicMeasuresIwasawaAlgebras](../../../content/campaign/PadicMeasuresIwasawaAlgebras/README.md), L4–L5 | Characteristic ideals and graded determinants of perfect complexes. The normal/Krull divisor, principal-majorant specialization, faithful coefficient descent and determinant-line refinements are supplier requests. This roadmap is absent from the current upstream checkout inspected for this assembly; it is not cited as an implemented upstream package. |
| [SelmerIwasawaCohomology](../../../content/campaign/SelmerIwasawaCohomology/README.md), L2–L4 | Selmer structures, Pontryagin duals, ordinary and unramified local conditions, derived control and Poitou–Tate. L0 and L5b instantiate these with the exact source conventions and coefficient maps. |
| [AutomorphicPadicLFunctions](../../../content/campaign/AutomorphicPadicLFunctions/README.md), L3, L3h, L4, L4e, L5; [AutomorphicBundles](../../../content/campaign/AutomorphicBundles/README.md) | Katz/Hida functions, nonvanishing inputs, unitary PEL varieties, compactifications, bundles, Igusa towers, local doubling and the analytic Klingen carrier. L1, L2s, L2 and L5w own their source-specific control, coefficient divisibility and congruence arguments. |
| [MetaplecticAutomorphicForms](../../../content/campaign/MetaplecticAutomorphicForms/README.md), MP.6; [AutomorphicLFunctionsAndLocalFactors](../../../content/campaign/AutomorphicLFunctionsAndLocalFactors/README.md), AL.3 | Jacobi groups and Fourier–Jacobi periods; triple-product formulas and local integrals. Missing Ikeda/Ichino refinements remain requests rather than duplicated general theories. |
| [AutomorphicGaloisRepresentationsPartII](../../../content/campaign/AutomorphicGaloisRepresentationsPartII/README.md), AG2.2, AG2.5, AG2.6 | Unitary Galois representations and local–global compatibility. The precise imaginary-quadratic descent and ordinary filtration required by SU are recorded adapters. |
| [OrdinaryAutomorphicFormsAndModularityLifting](../../../content/campaign/OrdinaryAutomorphicFormsAndModularityLifting/README.md), R21.4; [GlobalGaloisDeformations](../../../content/campaign/GlobalGaloisDeformations/README.md), R04.6 | The exact Fujiwara minimal totally real R=T, freeness and minimal-lift contracts. L5w applies them and verifies local types; it does not replan general modularity lifting. |
| [CompletedCohomologyAndLocalGlobalCompatibility](../../../content/campaign/CompletedCohomologyAndLocalGlobalCompatibility/README.md), R31.4; [PadicLocalLanglandsForGL2Qp](../../../content/campaign/PadicLocalLanglandsForGL2Qp/README.md), R30.5–R30.6; [SmoothRepresentationsOfLocalGroups](../../../content/campaign/SmoothRepresentationsOfLocalGroups/README.md), SR.5 | Completed (co)homology, local–global factorization, p-adic local Langlands and co-Whittaker families. L3 owns their zeta-morphism application, with the BM/smooth-dual, essential-vector and p=3 refinements retained. |
| [GeneralizedHeegnerCycles](../../../content/campaign/GeneralizedHeegnerCycles/README.md), GH.7 | A checkpoint/request for the local Part II Yager and unramified-by-cyclotomic regulator input. The boundedness argument in L2 still requires that supplier. |
| [KatoEulerSystems](../../../content/campaign/KatoEulerSystems/README.md), L2–L4 and proposed L5 | Kato classes, reciprocity, nonvanishing and the opposite divisibility, including their actual integral image hypotheses. The ordinary BSTW two-variable zeta/reciprocity comparison has the single proposed owner L5; L5a states its consumed contract. |
| [ModularSymbolsPadicLFunctions](../../../content/campaign/ModularSymbolsPadicLFunctions/README.md), L1–L2 | MSD functions, Néron periods, ordinary interpolation and uniqueness; L5b proves the four-twist cyclotomic comparison with the required units. |
| [ModularIwasawaMainConjectures](../../../content/campaign/ModularIwasawaMainConjectures/README.md), L0–L3 | Scalar ordinary main conjectures, canonical-period and curve-to-form transport, and final assembly. It imports L1/L2/L4/L5b endpoints directly. L5 here is only an aggregate. |
| [HeegnerPointEulerSystems](../../../content/campaign/HeegnerPointEulerSystems/README.md), HE.8b; [RankZeroOneBSD](../../../content/campaign/RankZeroOneBSD/README.md), BSD.6a–BSD.7a | The former consumes the early L5a input; its anticyclotomic endpoint is not a prerequisite of L5b. The latter owns its BSD and supersingular applications and imports the shared Beilinson–Flach and CLW contracts. |

A general main conjecture for arbitrary unitary representations, a general CM-field main conjecture, and a stronger universal-family theorem over the full possibly nonfactorial deformation ring are outside the statements made here.

## Conventions and coefficient dictionaries

- **Fields and towers.** K is imaginary quadratic in the SU/CLW/FW and BCS descent arguments. In the Hilbert engine F is totally real and M/F is CM quadratic; in the quartic application F is real quadratic and M=FK. The suffix g^F or E^F means quadratic twist over Q, while g_F means base change to F. Γ_K has cyclotomic and anticyclotomic directions Γ_K⁺ and Γ_K⁻. Coefficient rings and completed tensor products are specified at each node.
- **Selmer conditions.** Σ relaxes conditions only at places away from p. At every v|p the chosen Greenberg condition remains in force, even if v∈Σ. In the inertia-kernel convention T_v=0 means unramified at p; it is not the strict zero local condition. Primitive, inertia-kernel and locally-trivial conditions are compared by explicit maps before being identified. Compact integral Tate lattices, discrete p-divisible representations and their Iwasawa dual coefficients are distinct carriers.
- **Characteristic divisors.** For a finite torsion module over a noetherian normal domain, Ch or char denotes the divisorial ideal determined by its height-one lengths. Such an ideal need not be principal on a normal Hida branch. Principal characteristic generators are used only with the required UFD hypothesis. Some source theorems extend the characteristic ideal to zero for non-torsion modules; that convention gives no torsion proof. Control specializes a principal analytic majorant with nonzero specialization, not an arbitrary nonprincipal characteristic ideal.
- **Containment direction.** Ch(X)⊆(L) is the reverse divisibility: L divides a characteristic generator when a generator exists. Kato supplies the opposite containment (L)⊆Ch(X). All products, cancellations and scalar descent take place in the coefficient ring stated, with nonzero/torsion hypotheses retained.
- **Forms and ideals.** ℰ_D denotes an Eisenstein family, I_D the ideal of Hecke-operator differences in the cuspidal algebra, and 𝔈_D=ker(Λ_D→h_D/I_D) its coefficient-ring ideal. Context-dependent E_D notation in the sources is separated here into the family ℰ_D and the coefficient ideal 𝔈_D. A nonvanishing hypothesis modulo a prime concerns ℰ_D. Full and cuspidal Hecke algebras are distinguished; a full Eisenstein eigencharacter need not lift the cuspidal quotient character to Λ_D.
- **Frobenius and twists.** Each source retains its own reciprocity convention. SU Lemma 3.2.17 uses det(1−X·frob_ℓ⁻¹ | (T⊗Frac A)^{I_ℓ}) and substitutes ℓ⁻¹ε(frob_ℓ). Nakamura's newform Euler polynomial is 1−a_ℓX+ℓ^{k−1}ε(ℓ)X². Passing to Mathlib's det(T·I−M), a dual representation or a Tate twist requires the explicit reciprocal-polynomial/representation dictionary.
- **Periods.** SU uses its cohomological canonical periods Ω_f⁺Ω_f⁻, with the stabilization and archimedean factors of Lemma 12.2.2. Wan's Hilbert canonical period uses Definition 79. MSD functions for curves use the specified Néron periods and Manin-constant comparison. A p-adic unit comparison preserves ideals; a rational scalar comparison preserves them only after p-inversion. No canonical/Gross-period identity is assumed.
- **Localizations and nonvanishing.** Inverting p differs from localizing the entire cyclotomic coefficient subring. CLW's addendum supplies two rational Klingen families whose Fourier–Jacobi values jointly avoid every height-one prime away from p. One chooses a family locally at each prime; no single-family unit coefficient is inferred. The auxiliary ℓ-power nonvanishing repair is separate from the p-power μ=0 input. Its general-weight FW extension remains a gap.
- **Quadratic splitting.** At an odd unramified prime use the Jacobi criterion for a fundamental discriminant D. At 2 with D odd, splitting means D≡1 mod 8 and inertia means D≡5 mod 8. The auxiliary-field conditions include this case when 2 divides a level.
- **Universal families.** FW's regular subring Λ=O[[X₁,X₂,X₃]] and the finite free deformation/Hecke algebra T have different roles. Restriction of scalars uses a determinant norm. For a primal line trivialization t and its dual t∨, t∨(Δ⁻¹)=αΛ corresponds to t(Δ)=α⁻¹Λ. The full fundamental line has local corrections at Σ∖{p}, and its base change requires Iwasawa suitability.

## Sources and version conventions

The bibliography fixes the versions used by the target locators. SU always means the 226-page author manuscript, not journal pagination. BCS-v2 and BCS-published are kept separate. Wan-2015 is the Hilbert paper, whereas Wan-2020 is the GU(3,1) Rankin–Selberg paper. Nakamura locators use arXiv v2, with published numbers where §5 was renumbered. The CLW addendum overrides the original auxiliary simultaneous-unit argument. Exact access records and hashes remain in the two part packets; unread proof inputs remain listed under mathematical obligations.

- **SU**: Christopher Skinner and Eric Urban. [The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf). Inventiones mathematicae 195 (2014), 1–277; locators refer to the final author manuscript, dated 21 December 2012, 226 pages.

- **FW-v3**: Olivier Fouquet and Xin Wan. [The Iwasawa main conjecture for universal families of modular motives](https://arxiv.org/pdf/2107.13726v3). arXiv:2107.13726v3 (103 pages); page numbers are those printed, which equal the PDF pages.

- **CLW-v1**: Francesc Castella, Zheng Liu and Xin Wan. [Iwasawa–Greenberg main conjecture for non-ordinary modular forms and Eisenstein congruences on GU(3,1)](https://arxiv.org/pdf/2109.08375v1). arXiv:2109.08375v1 (83 pages); page numbers are the PDF pages.

- **NAK-v2**: Kentaro Nakamura. [Zeta morphisms for rank two universal deformations](https://arxiv.org/pdf/2006.13647v2). arXiv:2006.13647v2, 109 pages; published Inventiones mathematicae 234 (2023), 171–290. ArXiv v2 and published §5 numbering are distinguished below.

- **BCS-v2**: Ashay Burungale, Francesc Castella and Christopher Skinner. [Base change and Iwasawa main conjectures for GL2](https://arxiv.org/pdf/2405.00270v2). arXiv:2405.00270v2 (12 pages).

- **CW-v1**: Francesc Castella and Xin Wan. [The Iwasawa main conjectures for GL2 and derivatives of p-adic L-functions](https://arxiv.org/pdf/2001.03878v1). arXiv:2001.03878v1 (33 pages).

- **Wan-2020**: Xin Wan. [Iwasawa main conjecture for Rankin–Selberg p-adic L-functions](https://arxiv.org/pdf/1408.4044v5). arXiv:1408.4044v5 (15 September 2019, 100 pages); published in Algebra & Number Theory 14 (2020). Cited as Wan20 by CLW and as \[126\] by FW.

- **CLW-addendum**: Francesc Castella, Zheng Liu and Xin Wan. [Addendum to Iwasawa–Greenberg main conjecture for non-ordinary modular forms and Eisenstein congruences on GU(3,1)](https://web.math.ucsb.edu/~castella/CLW-addendum.pdf). Six-page author-hosted addendum, accessed 19 October 2026; its theorem numbers are separate from CLW-v1.

- **BCS-published**: Ashay Burungale, Francesc Castella, Christopher Skinner. [Base Change and Iwasawa Main Conjectures for GL2](https://web.math.ucsb.edu/~castella/BCS-print.pdf). IMRN 2025(8), rnaf082, published author-hosted copy, 15 pages

- **Wan-2015**: Xin Wan. [The Iwasawa main conjecture for Hilbert modular forms](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf). Forum of Mathematics, Sigma 3 (2015), e18, 95 pages, published open-access PDF

- **Fujiwara**: Kazuhiro Fujiwara. [Deformation rings and Hecke algebras in the totally real case](https://arxiv.org/pdf/math/0602606v2). arXiv:math/0602606v2, 25 July 2006, manuscript pagination

- **CGS-v1**: Francesc Castella, Giada Grossi, Christopher Skinner. [Mazur’s main conjecture at Eisenstein primes](https://arxiv.org/pdf/2303.04373v1). arXiv:2303.04373v1, 8 March 2023, 33 pages; only the independently applicable analytic factorization is used

- **Kato**: Kazuya Kato. [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf). Astérisque 295 (2004), pp.117–290, published Numdam scan

- **CGS-v2**: Francesc Castella, Giada Grossi, Christopher Skinner. [Mazur’s main conjecture at Eisenstein primes](https://arxiv.org/pdf/2303.04373v2). arXiv:2303.04373v2, 15 October 2025, final preprint; normalization comparison only

## Layer overview and reading order

The first group develops L0–L4, the early L5a bound and the L5 aggregate. The second gives L5w and L5b. This keeps the two source parts in order while making their forward references explicit. Their mathematical order is L0/L1 → L5w → L5a → L5b → L5; the independent L2s/L2 and L3/L4 routes feed the other endpoints. L5w's selected-field result is conditional on the listed field hypotheses; L5a proves the required field existence, with the additional narrow-class-field refinement still recorded as an obligation.

| Layer | Purpose and main output |
| --- | --- |
| [L0](#layer-l0) | Σ-imprimitive ordinary Selmer instances and control; coefficient Eisenstein ideal; polarized SU lattice and local extension conditions; canonical-period and CM-theta comparison contracts. |
| [L1](#layer-l1) | Ordinary GU(2,2) theory over Q, Klingen coefficients and the SU two-variable/cyclotomic product divisibilities. |
| [L2s](#layer-l2s) | Weight-two semi-ordinary GU(3,1) control, repaired two-family coprimality, and the precisely localized CLW bounds. |
| [L2](#layer-l2) | General-weight semi-ordinary GU(3,1), Greenberg/Beilinson–Flach comparison, local regulator boundedness, and ordinary/crystalline FW seed targets. |
| [L3](#layer-l3) | Residual predicates, deformation-ring structure, completed homology, fundamental lines and Nakamura's universal zeta morphism. |
| [L4](#layer-l4) | Integral dual trivialization, family descent over the regular subring, pointwise specialization and residual congruence propagation. |
| [L5a](#layer-l5a) | The early BCS two-variable product bound, quartic-to-K transport, auxiliary fields and the μ upgrade. |
| [L5](#layer-l5) | Aggregate of the L4 and L5b endpoints; adds no second proof. |
| [L5w](#layer-l5w) | The totally real Wan–Fujiwara engine and its conditional selected-base-change hypothesis check, exported to L5a. |
| [L5b](#layer-l5b) | Four-twist lattice, analytic and Selmer dictionaries; cyclotomic product control; Kato factor separation; rational and conditional integral equality. |

Every target has an exact identifier, statement, hypotheses, proof outline, checks, source locators and prerequisites. A definition or construction also has its use-derived API and discriminating unit tests. Links between the two parts refer to exact nodes. Where the field, local condition or period normalization differs, an explicit consuming obligation prevents the link from being mistaken for an already supplied theorem.

## Congruences, universal families and the early product input

<a id="layer-l0"></a>

### Layer L0: Congruence ideals and Selmer classes

The coefficient ideal measures the automorphic congruence; polarized lattice data turn it into Galois extension classes satisfying the specified ordinary local conditions. Primitive/imprimitive transport retains its Euler factors, and specialization retains its hypotheses. The final CM-theta comparison is the restricted CLW integrality input, with the exact Hida–Tilouine denominator map still requested.

<a id="node-l0-sigma-primitive-selmer"></a>

#### Σ-primitive ordinary Selmer groups over Iwasawa towers

`AutomorphicCongruences:L0/sigma-primitive-selmer` (construction).

Atlas landmark: Σ-primitive Selmer groups.

**Statement.** Let F be a number field, A a profinite ℤ\_p-algebra, T a free A-module of finite rank with a continuous A-linear G\_F-action, and for each place v | p a G\_{F\_v}-stable A-direct summand T\_v ⊆ T with T/T\_v free. For a finite set Σ of finite places, Sel^Σ\_F(T,(T\_v)) is the kernel of the restriction from H¹(F, T ⊗\_A A^∨) (A^∨ the Pontryagin dual) to the product over v ∉ Σ, v ∤ p of H¹(I\_v, T ⊗ A^∨) and over v | p of H¹(I\_v, (T/T\_v) ⊗ A^∨): no condition at Σ away from p, unramified elsewhere away from p, and the ordinary (Greenberg) condition at p. Its dual X^Σ\_F = Hom\_A(Sel^Σ\_F, A^∨) is finitely generated over A. For an extension E/F inside a ℤ\_p^d-tower, Sel^Σ\_E is the direct limit over finite subextensions and X^Σ\_E the inverse limit, and Shapiro's lemma identifies Sel^Σ\_{F\_∞}(T) with Sel^Σ\_F(T ⊗\_A Λ\_{F,A}(ε\_F^{-1})) as Λ\_{F,A}-modules, where Λ\_{F,A} = A ⊗̂ ℤ\_p\[\[Gal(F\_∞/F)\]\] and ε\_F is the tautological character. When A is noetherian and normal, Ch^Σ\_{F,A}(T) denotes the characteristic ideal of X^Σ\_F(T) and Ft^Σ\_{F,A}(T) its Fitting ideal. The p-condition is imposed for every v|p regardless of membership in Σ. For torsion X, Ch means the divisorial ideal of its length divisor; noetherian normal does not imply principal. Use SU’s zero characteristic-ideal convention if X is not torsion.

**Hypotheses.**

- T free of finite rank over the profinite ℤ\_p-algebra A, with a continuous action of G\_F; T\_v free direct summands with free quotients for v | p.
- Σ is finite. If S contains Σ, p and the ramification of T, the same kernel may be computed using H¹(G\_{F,S},−); membership of p in Σ does not remove its local condition.
- The characteristic ideal is used only over noetherian normal A, as the divisorial ideal of height-one lengths.

**Proof outline.**

1. Instantiate the imported Selmer kernel with relaxed conditions at Σ away from p, unramified conditions at other non-p places, and Greenberg conditions from T\_v at all v|p.
2. Finite generation of the dual: H¹(G\_{F,S}, M ⊗ A^∨) is cofinitely generated for finitely generated M (SU Lemma 3.1.9, after Greenberg).
3. Shapiro: the coinduced module of A^∨ along Gal(F\_n/F) has direct limit Λ\_{F,A}^∨(ε\_F^{-1}); the restriction maps at v correspond to the products over places of F\_n above v (SU 3.1.2, Prop. 3.2.3).
4. Define Ch^Σ via the height-one length divisor of X^Σ and Ft^Σ via Fitting ideals of a presentation.

**Checks.**

- If T\_v=T at all p-places and S contains Σ, p and ram(T), then Sel^Σ\_F=H¹(G\_{F,S},T⊗A^∨) when S=Σ∪{v|p}∪ram(T) and ram(T) away from p lies in Σ.
- For Σ⊂Σ′ the quotient embeds in the sum of changed local-condition quotients; surjectivity onto all local terms needs the additional hypotheses of primitive-imprimitive-comparison.

**Uses.**

- SU Thm 3.6.1, p. 41: Ch^Σ\_{K\_∞}(f) is the characteristic ideal of the Σ-primitive dual over the two-variable tower
- CLW-v1 proof of Thm 8.2.1, p. 79: the Σ ∪ {ℓ,ℓ′}-primitive Selmer group in the lattice argument
- BCS-v2 §2, p. 6: the ordinary Selmer group H¹\_{F\_Λ}(M, M\_g) over a quartic CM tower, consumed by L5a
- AutomorphicCongruences:L5b/cyclotomic-control: the Σ-primitive groups whose specialization L5b controls

**API.**

- `SigmaSelmer.mk` (constructor): Sel^Σ\_F(T,(T\_v)) as an A-submodule of H¹(F, T ⊗\_A A^∨), defined by the local conditions above.
- `SigmaSelmer.dual` (data): X^Σ\_F = Hom\_A(Sel^Σ\_F, A^∨), finitely generated over A.
- `SigmaSelmer.mono` (functoriality): Σ ⊆ Σ′ gives an inclusion Sel^Σ ⊆ Sel^{Σ′} and a surjection X^{Σ′} → X^Σ.
- `SigmaSelmer.shapiro` (equivalence): Sel^Σ\_{F\_∞}(T) ≅ Sel^Σ\_F(T ⊗\_A Λ\_{F,A}(ε\_F^{-1})) as Λ\_{F,A}-modules, compatibly with the local conditions.
- `SigmaSelmer.charIdeal` (data): For finite torsion X over a noetherian normal domain, Ch is the divisorial ideal corresponding to div(X). In a UFD this agrees with PMIA’s native charIdeal. Its comparison with the divisorial hull of Fitt uses the finite-presentation/normal-ring theorem requested below.
- `SigmaSelmer.baseChange` (compatibility): For an ideal 𝔞 with A/𝔞 profinite, the natural map X^Σ(T)/𝔞 → X^Σ(T/𝔞T) (an isomorphism under L0/selmer-specialization-control).
- `SigmaSelmer.of_upstream` (coercion): Agreement with the imported Selmer kernel whose local conditions are relaxed at non-p places of Σ, unramified at other non-p places and Greenberg at every p-place.
- `SigmaSelmer.ext` (extensionality): Two classes in Sel^Σ are equal iff their images in global H¹ agree; membership is exactly the vanishing of the stated localization maps.

**Unit tests.**

- `sigmaSelmer_full_relaxed` (degenerate): With T\_v=T and Σ containing all non-p ramification, Sel^Σ\_F is full H¹(G\_{F,Σ∪p},T⊗A^∨).
- `sigmaSelmer_trivial_coefficients` (computation): For the zero coefficient module T=0 all local/global groups and X vanish; Ch=(1). This rejects a construction that inserts a coefficient-independent local summand.
- `sigmaSelmer_strict_is_not_ordinary` (non-example): With T\_v=0 the condition is unramified at p, not strict zero: for trivial Q\_p/Z\_p coefficients at Q\_p, a nonzero unramified homomorphism G\_Qp/I\_p→Q\_p/Z\_p belongs to this local kernel. A strict zero local condition excludes it.
- `sigmaSelmer_upstream_agreement` (agreement): For the relaxed/unramified/Greenberg structure, SigmaSelmer.of\_upstream identifies the module with SelmerIwasawaCohomology:L2/galois-selmer-group.

**Prerequisites.** `SelmerIwasawaCohomology:L2/selmer-data`, `SelmerIwasawaCohomology:L2/greenberg-condition`, `SelmerIwasawaCohomology:L2/unramified-condition`, `SelmerIwasawaCohomology:L2/galois-selmer-group`, `SelmerIwasawaCohomology:L2/pontryagin-dual`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-0`, `tauceti:TauCeti.ContCohomology.H1`, `mathlib:Module.length`, `mathlib:LocalizedModule`.

**Sources.**

- **SU**, §3.1.3, p. 18: Skinner–Urban define the Σ-primitive Selmer group by unramified conditions outside Σ ∪ {p} and the ordinary condition given by T\_v at p, with its Pontryagin dual X^Σ.
- **SU**, §3.1.8, pp. 20–21, and Prop. 3.2.3, p. 21: Characteristic and Fitting ideals of X^Σ, and Shapiro's identification of the tower Selmer group with one over Λ\_{F,A}.
- **CLW-v1**, (1.0.1)–(1.0.2) p. 3 and proof of Thm 8.2.1, p. 79: CLW use the instance with relaxed condition at one prime above p and unramified at the other, and its Σ ∪ {ℓ,ℓ′}-primitive variant.

<a id="node-l0-eisenstein-ideal"></a>

#### The Eisenstein ideal of an Eisenstein family

`AutomorphicCongruences:L0/eisenstein-ideal` (definition).

Atlas landmark: Eisenstein ideal.

**Statement.** Let Λ be a noetherian complete local domain, 𝕋 a reduced finite Λ-algebra generated over Λ by the images of a set 𝒯 of Hecke operators acting on a space of Λ-adic cusp forms, and λ: 𝒯 → Λ the system of eigenvalues of a Λ-adic Eisenstein family E (a Λ-algebra homomorphism from the abstract Hecke algebra). The Eisenstein ideal I\_E ⊆ 𝕋 is the ideal generated by t − λ(t) for t ∈ 𝒯; when the structure map Λ → 𝕋/I\_E is surjective, the Eisenstein ideal of Λ is its kernel E\_E, so that Λ/E\_E ≅ 𝕋/I\_E. When I\_E is proper, 𝕋\_E denotes the localization of 𝕋 at the maximal ideal containing I\_E.

**Hypotheses.**

- 𝕋 is generated over Λ by 𝒯 together with the U\_p-operators, so Λ → 𝕋/I\_E is surjective; otherwise E\_E is defined as the kernel on the image.
- The Hecke operators are those at primes outside a fixed finite set Σ, the U\_p-operators, and the central or diamond operators used by the source.

**Proof outline.**

1. Define I\_E as the ideal generated by {t − λ(t) : t ∈ 𝒯} and E\_E := ker(Λ → 𝕋/I\_E).
2. Surjectivity follows because the generators of 𝕋 over Λ act by scalars of Λ modulo I\_E.

**Checks.**

- The congruence statements of L1, L2 and L2s are lower bounds ord\_P(E\_E) ≥ ord\_P(L) for height-one primes P of Λ, from a cuspidal family congruent to E.

**Uses.**

- L1/eisenstein-datum: the SU generators of I\_D
- L2s/clw-eisenstein-congruence: E\_{π,ξ} bounded below by L\_{π,K,ξ}L\_{ξ,ℚ}
- L2/fw-fourier-jacobi-unit: Lemma 7.31's comparison ord\_P(L) ≤ ord\_P(𝔈\_D)
- L0/lattice-construction: the ideal J := E\_E A and I := I\_E R of the abstract set-up

**API.**

- `EisensteinIdeal.hecke` (constructor): I\_E ⊆ 𝕋 generated by t − λ(t), t ∈ 𝒯.
- `EisensteinIdeal.base` (constructor): E\_E := ker(Λ → 𝕋/I\_E).
- `EisensteinIdeal.quotientEquiv` (equivalence): Λ/E\_E ≃ 𝕋/I\_E as Λ-algebras when the structure map is onto.
- `EisensteinIdeal.localize` (functoriality): Formation of I\_E and E\_E commutes with localization at a height-one prime P of Λ and completion.
- `EisensteinIdeal.proper_iff` (characterisation): For a unital structure map, E\_E≠⊤ iff I\_E≠⊤. For finite local Λ-algebras, this is equivalent to existence of a residue-field cuspidal eigensystem satisfying the specified congruences.
- `EisensteinIdeal.mono` (functoriality): Enlarging 𝒯 enlarges I\_E; restricting to a direct factor of 𝕋 enlarges E\_E.
- `EisensteinIdeal.ext` (extensionality): Equality of the generated Hecke ideals implies equality of their contractions; membership in E is equivalent to the image in 𝕋/I being zero.

**Unit tests.**

- `eisensteinIdeal_ramanujan_level1` (computation): For weight 12, level 1 cusp forms over ℤ\_691 with E = E\_12 (λ(T\_ℓ) = 1 + ℓ^{11}), 𝕋 = ℤ\_691 and E\_E = (691), since τ(ℓ) ≡ 1 + ℓ^{11} mod 691 and the numerator of B\_12/24 has 691-adic valuation one.
- `eisensteinIdeal_no_congruence` (degenerate): If no cusp form is congruent to E, then I\_E = 𝕋 and E\_E = Λ (for example weight 12 at p = 5).
- `eisensteinIdeal_mazur` (agreement): In a weight-two prime-level Mazur setting, I\_E in the cuspidal Hecke algebra is generated by the appropriate T\_ℓ−1−ℓ and 1+w\_N. E\_E is its contraction along Λ→𝕋, an ideal in Λ; it is not identified with that Hecke ideal.
- `eisensteinIdeal_not_congruence_ideal` (non-example): E\_E differs from the congruence ideal of a cuspidal eigenform: for weight 12, level 1 and p = 691 the congruence ideal of Δ in the cuspidal Hecke algebra is the unit ideal (𝕋 = ℤ\_p), while E\_E = (691).

**Prerequisites.** `mathlib:Ideal.span`, `mathlib:RingHom.ker`, `mathlib:Ideal.map`.

**Sources.**

- **SU**, §6.5.3, pp. 97–98, (6.5.3.a): Skinner–Urban define I\_D by the coefficients of Q\_v(X) − Q\_{v,D}(X), the U\_p-relations and the central operators, and 𝔈\_D as the kernel of Λ\_D → h\_D/I\_D.
- **FW-v3**, Def. 7.30, p. 96: Fouquet–Wan define I\_D by t − λ(t) for the Klingen Eisenstein family and 𝔈\_D as its inverse image in O\[\[Γ\_K\]\].
- **CLW-v1**, proof of Thm 8.2.1, p. 79: The ideal E\_{π,ξ} used in the set-up (5).

<a id="node-l0-su-lattice-datum"></a>

#### The Skinner–Urban lattice datum

`AutomorphicCongruences:L0/su-lattice-datum` (definition).

**Statement.** Let H = G ⋊ {1, c} with c of order two, A a complete discrete valuation ring with fraction field F and maximal ideal m, and R a local reduced finite flat A-algebra with R/M = A/m. A lattice datum consists of: (1) a character ν: H → A^×; (2) a character χ: G → A^× with χ̄ ≠ ν̄χ̄^{-c}, and χ′ := νχ^{-c}; (3) a representation ρ: G → Aut\_A(V), V ≅ A^n, with ρ^c ≅ ρ^∨ ⊗ ν, ρ̄ absolutely irreducible and ρ residually disjoint from χ and χ′ (some x ∈ A\[G\] has coprime residual characteristic polynomials); (4) a representation σ: G → Aut\_{R⊗F}(M), M ≅ (R ⊗ F)^{n+2}, with σ^c ≅ σ^∨ ⊗ ν, tr σ(G) ⊆ R and finitely generated R\[G\]-orbits; (5) a proper ideal I ⊂ R with J := A ∩ I ≠ 0, A/J ≅ R/I and tr σ ≡ χ′ + tr ρ + χ mod I. Local data at a subgroup D ⊂ G: a D-stable free summand M^+ ⊆ M with free quotient, a D-stable free summand V^+ ⊆ V, and the congruence Ch(M^+, x, T) ≡ Ch(V^+, x, T)(1 − Tχ(x)) mod I for x ∈ R\[D\]. The datum is ν-polarized when ν is compatible (Φ^t = −ν(c)Φ) with the polarization of ρ.

**Hypotheses.**

- The polarization conditions are those of SU 4.2.2; residual disjointness is in the sense of SU 4.1.2.
- In applications G = G\_{K,Σ}, H = G\_{ℚ,Σ}, D a decomposition group at a prime above p, A the completion of a localization of a two-variable Iwasawa algebra at a height-one prime P, and R a completed local Hecke algebra.
- SU §4.3 requires the common residue field κ to have at least n+2 nonzero elements. To deduce compatibility of ν with σ from Lemma 4.3.3, require char κ≠2 and absolute irreducibility of every field factor σ\_i; otherwise compatibility with σ is a separate hypothesis of the Selmer consequence.
- SU Ch(θ,x,T)=det(1−Tθ(x)); convert Mathlib’s det(TI−θ(x)) before invoking polynomial congruences.

**Proof outline.**

1. Record the data (1)–(5) and the local data 4.5.1–4.5.3 as fields; derive the congruence for the quotients M^- and V^- from 4.3.1.
2. Residual disjointness gives projectors x\_1, x\_2 ∈ B\[G\] with x\_i acting as identity on one summand and zero on the other (SU Lemma 4.1.3, via the Henselian property).

**Checks.**

- The SU instance (SU 7.3.2), the CLW instance (proof of CLW Thm 8.2.1, items (1)–(5)) and the FW instance (proof of FW Thm 7.32) are all lattice data with n = 2.

**Uses.**

- L1/su-selmer-lower-bound: the instance of SU 7.3.2 with A = Λ̂\_{D,P} and R = 𝕋̂\_{D,Q}
- L2s/clw-main-divisibility: the GU(3,1) instance with ν trivial
- L2/fw-greenberg-divisibility: the general-weight GU(3,1) instance
- AutomorphicCongruences:L5w/galois-selmer-instance: the Hilbert GU(2,2) instance over a totally real field

**API.**

- `LatticeDatum.chiPrime` (projection): χ′ = νχ^{-c}.
- `LatticeDatum.trace_congr` (characterisation): tr σ ≡ χ′ + tr ρ + χ modulo I.
- `LatticeDatum.residualProjectors` (data): The elements x\_1, x\_2 ∈ R\[G\] separating the residually disjoint constituents (SU Lemma 4.1.3).
- `LatticeDatum.localize` (functoriality): Given descent data satisfying SU §4.4 and the freeness/residual conditions, localization and completion produce the datum; preservation of absolute irreducibility and disjointness must be checked, not inferred for arbitrary base change.
- `LatticeDatum.localData` (structure): The D-stable summands M^±, V^± with the congruence of characteristic polynomials and its consequence for the quotients.
- `LatticeDatum.toGMA` (coercion): The R\[G\]-span of a lattice in M carries a generalized-matrix-algebra structure of type (1, n, 1) relative to the residual decomposition.
- `LatticeDatum.mk` (constructor): Construct from the five SU §4.2.3 fields, compatibility with ρ, and the explicitly specified local data.
- `LatticeDatum.ext` (extensionality): Isomorphisms of the coefficient representations preserving χ,ν,I and the chosen local summands transport the datum and its trace/polynomial identities.

**Unit tests.**

- `latticeDatum_ribet_case` (degenerate): Rank n=0 is excluded by the absolutely irreducible middle-constituent requirement. A bare two-character Ribet datum cannot be passed to this constructor; the rank-two Ribet theorem is a distinct supplier contract.
- `latticeDatum_su_instance` (computation): In SU 7.3.2, χ = σ\_{χ̄\_f,0}σ^c\_ψ ε^{-3}, ρ\_0 = ρ\_f ⊗ σ\_{χ̄\_f,0}σ^{-c}\_ξ σ^c\_ψ ε^{-2}, χ′ = σ\_{χ̄\_f,0}ε^{-1}det ρ\_f σ^{-1}\_{ξ′}σ^c\_ψ, and ν is fixed by χ^cχ′ = σ^2\_{χ̄\_f,0}ε^{-7}ε\_ℚ^{-2}; these satisfy χ′ = νχ^{-c}, and the trace of ρ\_D in (6.5.2.a) is χ + tr ρ\_0 + χ′.
- `latticeDatum_requires_distinct` (non-example): If χ̄ = ν̄χ̄^{-c} then condition (2) fails; SU (dist) and CLW's ξ\_p ≢ ξ\_p̄ are exactly what rule this out.
- `latticeDatum_gma_agreement` (agreement): For a lattice datum with σ residually multiplicity free, LatticeDatum.toGMA agrees with IntegralHeckeAndGaloisDeterminants:IHG.1/generalized-matrix-algebra.

**Prerequisites.** `IntegralHeckeAndGaloisDeterminants:IHG.1/generalized-matrix-algebra`, `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-idempotent-lifting`, `IntegralHeckeAndGaloisDeterminants:IHG.1/reducibility-ideal`, `mathlib:IsDiscreteValuationRing`, `mathlib:IsReduced`, `mathlib:Matrix.charpoly`.

**Sources.**

- **SU**, §4.1.2, Lemma 4.1.3, p. 48; §4.2.1–4.2.3, pp. 48–49; §4.5.1–4.5.3, p. 59: The rings A and R, the polarized data (1)–(5) and the local conditions with their congruence of characteristic polynomials.
- **CLW-v1**, proof of Thm 8.2.1, p. 79: CLW list the data (1)–(5) for GU(3,1), taking ν trivial and σ from the pseudo-representation of the semi-ordinary Hecke algebra.
- **Wan-2020**, introduction, p. 4: Wan's U(3,1) argument follows the SU set-up; its lattice construction (Prop. 9.2, set-up (1)–(9)) is the variant used by CLW and FW.

<a id="node-l0-canonical-period-congruence-number"></a>

#### Canonical periods, Petersson norms and the congruence number

`AutomorphicCongruences:L0/canonical-period-congruence-number` (comparison).

**Statement.** For the p-stabilized ordinary newform f over a finite integral Z\_p-algebra R satisfying (irred) and (dist), SU Lemma 12.2.2 gives η\_f = u\_f·2^{-3}(2i)^{κ+1} S(f)·⟨f,f^c|W\_{p^rM}⟩/(Ω\_f^+Ω\_f^-), with u\_f∈R^× and S(f) the explicit stabilization correction of SU (11.7.3.b). Under the stated integral/Gorenstein hypotheses η\_f generates the congruence ideal. For a primitive ordinary family over an integral finite Λ-algebra I satisfying (irred),(dist), the family congruence generator η\_I specializes to the η\_f choices (SU pp. 194–195); Lemma 12.2.7 supplies the integral functional used in the canonical-period-normalized Eisenstein coefficients. No canonical/Gross period comparison or unproved identification of EPW homology and SU cohomology period lattices is used.

**Hypotheses.**

- (irred) and (dist) for f, which give the freeness of the relevant Hecke modules and the Gorenstein property used to make the congruence module cyclic.
- The unit u\_{f\_φ} in SU Thm 12.3.1(ii) depends only on f\_φ and is not specified further.

**Proof outline.**

1. Use SU’s integral cohomological lattice and Lemma 12.2.2, retaining S(f) and every displayed normalization; do not replace the formula by an unqualified Petersson quotient.
2. Use the family construction on p. 195 and the functional of Lemma 12.2.7 (pp. 197–198) to obtain the two normalizations of Thm 12.3.1 and Thms 12.4.1–12.4.2.
3. The generic congruence module remains PadicFamilies:L1’s. Its EPW integral period dictionary to SU’s cohomological normalization requires the separately recorded comparison.

**Checks.**

- The integral normalization is the one in which the lattice construction measures congruences; replacing Ω^+Ω^- by a non-integral period breaks the integrality of ℰ\_D's coefficients.

**Prerequisites.** `PadicFamilies:L1/congruence-module`, `PadicFamilies:L1/congruence-ideal`, `PadicFamilies:L1/family-congruence-module`, `PadicFamilies:L1/family-period-line`, `PadicFamilies:L1/period-change-of-trivialisation`.

**Sources.**

- **SU**, Thm 12.3.1 (i)–(ii), p. 199; Thm 12.4.1, pp. 202–203: The Petersson-normalized and the Ω^+Ω^--normalized interpolation formulas, the latter integral under (irred) and (dist).
- **FW-v3**, remark before Thm 1.6, p. 6: Deducing Thm 1.6 from SU would need a comparison of the canonical and Gross periods, which Fouquet–Wan say may not exist in the literature in the generality needed.
- **SU**, Lemma 12.2.2 and family discussion, author-copy pp. 194–195; Lemma 12.2.7, pp. 197–198; (11.7.3.b): The full congruence-period formula and the family integral functional.

**Open obligations.** integral-period-dictionary. See the detailed list below.

<a id="node-l0-primitive-imprimitive-comparison"></a>

#### Primitive against Σ-primitive Selmer groups and the removed Euler factors

`AutomorphicCongruences:L0/primitive-imprimitive-comparison` (theorem).

**Statement.** Let T, (T\_v) and A be as in L0/sigma-primitive-selmer with A noetherian normal, F any number field, and S a finite set of finite places not above p at which T is unramified, contained in Σ. Then (i) Ch^Σ\_{F,A}(T) ⊇ Ch^{Σ∖S}\_{F,A}(T) · ∏\_{v∈S} det\_A(1 − q\_v^{-1} frob\_v^{-1} | T) (SU Lemma 3.2.15, Cor. 3.2.16); (ii) over ℚ\_∞, the Pontryagin dual of H¹\_Σ(ℚ\_∞, T ⊗ A^∨) = ∏\_{v∈Σ, v∤p} H¹(ℚ\_{∞,v}, T ⊗ A^∨) is a finitely generated torsion Λ\_{ℚ,A}-module with no nonzero pseudo-null submodule, and its characteristic ideal is generated by ∏\_{ℓ∈Σ} P\_{T,ℓ}(ℓ^{-1} ε\_ℚ(frob\_ℓ)), P\_{T,ℓ}(X) = det(1 − X frob\_ℓ^{-1} | (T⊗\_A Frac A)^{I\_ℓ}) (SU Lemma 3.2.17); (iii) when the primitive dual is torsion and the global-to-local map is surjective (Greenberg–Vatsal), Ch^Σ = Ch^∅ · ∏\_{ℓ∈Σ} P\_{T,ℓ}(ℓ^{-1}ε(frob\_ℓ)) (SU Prop. 3.2.18). On the analytic side the Σ-imprimitive p-adic L-functions are defined by multiplying the primitive ones by the same Euler-factor elements, so every removed factor is matched by the identical element of Λ.

**Hypotheses.**

- For (i), A is noetherian normal and T is unramified at S, a finite set away from p. For the local cyclotomic module in (ii), use the compact finite-type coefficients of SU §3.2.2; the characteristic-divisor assertion also requires normal noetherian A.
- For the exact sequence in (iii), A admits decreasing ideals I\_n with intersection zero and each A/I\_n finite free over Z\_p; the primitive X\_Q∞(T,T\_p) is Λ\_Q,A-torsion; T* (the Pontryagin dual in SU §3.1.3) has no nonzero A-submodule with trivial G\_Q action; Σ∪{p} contains ram(T). For every finite Σ′⊂Σ, localization onto H¹\_{Σ\Σ′} is then surjective (SU Prop. 3.2.18).
- The Euler polynomial of Lemma 3.2.17 uses inverse frob\_ℓ on rational inertia invariants. A rank-one invariant space gives 1−αX, where α is the eigenvalue of that precise inverse Frobenius. Integral lattices and analytic conventions must be compared explicitly.

**Proof outline.**

1. (i): the cokernel of Sel^{Σ∖S} → Sel^Σ injects into ∏\_{v∈S} H¹(I\_v, T ⊗ A^∨)^{G\_{F\_v}}, whose dual has characteristic ideal det(1 − q\_v^{-1}frob\_v^{-1}|T) because T is unramified at v.
2. (ii): Shapiro over ℚ\_∞ and local Tate duality compute the local terms; each is Λ-torsion with characteristic ideal the displayed Euler factor, and has no pseudo-null submodule.
3. (iii): with the localization map surjective the sequence 0 → Sel^∅ → Sel^Σ → H¹\_Σ → 0 is exact, and multiplicativity of characteristic ideals gives equality.
4. Analytic matching: the Σ-imprimitive p-adic L-function is by definition the primitive one times ∏\_{ℓ∈Σ} P\_ℓ(ℓ^{-1}γ\_ℓ), so the comparison of characteristic ideals and of analytic functions involves the same elements.

**Checks.**

- Transfer a primitive/imprimitive bound only after matching identical Euler elements on the arithmetic and analytic sides; do not cancel a vanishing specialization.
- A Steinberg Euler element is a unit in the local power-series ring exactly when its residue at augmentation is nonzero. With ℓ=11, p=5 and α=1, 1−ℓ^{-1}γ has augmentation 10/11, so it is not a unit even though the residual representation can be ramified.

**Prerequisites.** [`AutomorphicCongruences:L0/sigma-primitive-selmer`](#node-l0-sigma-primitive-selmer), `SelmerIwasawaCohomology:L2/condition-change-triangle`, `PadicMeasuresIwasawaAlgebras:L4/pseudo-null`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-0`.

**Sources.**

- **SU**, Lemma 3.2.15 and Cor. 3.2.16, author-copy p. 26; Lemma 3.2.17, pp. 26–27; Prop. 3.2.18, p. 27: The three comparisons of Selmer groups as Σ varies, with the Euler-factor characteristic ideals.
- **CLW-v1**, proof of Thm 8.2.1, p. 79: CLW reduce to the Σ ∪ {ℓ,ℓ′}-primitive inclusion using that unramified local cohomology is controlled by local Euler factors (Greenberg–Vatsal Prop. 2.4).

<a id="node-l0-selmer-specialization-control"></a>

#### Specializing Σ-primitive Selmer groups and their characteristic ideals

`AutomorphicCongruences:L0/selmer-specialization-control` (theorem).

**Statement.** Let F\_∞ be ℚ\_∞, K\_∞ or K^+\_∞, A a profinite ℤ\_p-algebra, 𝔞 ⊂ A an ideal and T as in L0/sigma-primitive-selmer. Assume the explicit SU Prop. 3.2.8 hypotheses below, so that X^Σ\_{F\_∞}(T)/𝔞 ≅ X^Σ\_{F\_∞}(T/𝔞T). Then (i) Ft^Σ\_{F,A/𝔞}(T/𝔞T) = Ft^Σ\_{F,A}(T) mod 𝔞; (ii) if A and A/𝔞 are noetherian normal domains and (f) ⊇ Ch^Σ\_{F,A}(T) is principal, then f mod 𝔞 divides Ch^Σ\_{F,A/𝔞}(T/𝔞T); in particular when A is factorial Ch^Σ\_{F,A}(T) mod 𝔞 divides Ch^Σ\_{F,A/𝔞}(T/𝔞T). (iii) For the descent K\_∞ → K^+\_∞ along I^- = ker(Λ\_K → Λ\_ℚ), X^Σ\_{K\_∞}(T)/I^- ≅ X^Σ\_{K^+\_∞}(T), and when A is factorial Ch^Σ\_{K\_∞}(T) mod I^- divides Ch^Σ\_{K^+\_∞}(T).

**Hypotheses.**

- In SU Prop. 3.2.8, inertia at p acts on T/T\_p through Γ\_Q; Σ∪{p} contains ram(T); F∞ is Q∞, K∞ or K⁺∞; T* (the Pontryagin dual in SU §3.1.3) has no nonzero A-subquotient on which G\_F acts trivially. These hypotheses apply for every ideal 𝔞 under consideration, not merely a presumed control isomorphism.
- The control isomorphism for a general ideal 𝔞 of the coefficient ring is SU Prop. 3.2.8 and is owned here; the upstream derived control (SelmerIwasawaCohomology:L3) covers the specialization to finite layers of a one-variable tower and is used only there. The control isomorphism needs SU Prop. 3.2.8's hypotheses; without them only a map with kernel and cokernel controlled by H⁰ and local terms exists.
- Characteristic ideals do not commute with base change in general; only the principal majorant transfers (ii). A specialization at which f vanishes gives no information.

**Proof outline.**

1. Fitting ideals commute with base change of a presentation (i).
2. The characteristic ideal is the smallest divisorial ideal containing the Fitting ideal; a principal ideal is divisorial, so (f) ⊇ Ch ⊇ Ft and reduction gives f mod 𝔞 ∣ Ft(T/𝔞) ⊆ Ch(T/𝔞) (ii).
3. For (iii), Shapiro along Γ^-\_K and Prop. 3.2.8 identify Sel^Σ\_{K^+\_∞} with the I^- torsion of Sel^Σ\_{K\_∞}, and (ii) applies.

**Checks.**

- Vanishing check: if f ∈ 𝔞 the conclusion of (ii) is empty, and no cancellation of f against the specialized characteristic ideal is allowed.
- Used by L1/su-cyclotomic-divisibility (descent from two variables to the cyclotomic line) and by L5a/quartic-cm-selmer-restriction.

**Prerequisites.** [`AutomorphicCongruences:L0/sigma-primitive-selmer`](#node-l0-sigma-primitive-selmer), `SelmerIwasawaCohomology:L3/derived-control`, `PadicMeasuresIwasawaAlgebras:L6/higher-fitting-base-change`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-0`.

**Sources.**

- **SU**, Prop. 3.2.8, p. 23; Cor. 3.2.9, Prop. 3.2.11, p. 24: The control isomorphism, the Fitting base change, the principal-majorant divisibility and the descent from K\_∞ to K^+\_∞.
- **BCS-v2**, proof of Lemma 5.1.1, p. 9: BCS apply SU Props 3.6–3.7 and Cor. 3.8 (journal numbering) to restrict from a quartic CM tower to K.

<a id="node-l0-extension-class-local-conditions"></a>

#### Local conditions satisfied by the automorphic extension classes

`AutomorphicCongruences:L0/extension-class-local-conditions` (theorem).

**Statement.** In the situation of L0/lattice-construction, the classes \[c\_φ\] obtained from the off-diagonal blocks of σ satisfy, after multiplication by an element t ∉ P: (a) at every place v ∉ Σ they are unramified, since σ is unramified outside Σ; (b) at the primes above p they lie in the kernel of restriction to H¹(D, V^-\_0 ⊗ A\_0^∨(χ^{-1})) for D = G\_{K,p} (the ordinary condition), and by the polarization the corresponding statement holds at G\_{K,p̄}; (c) at places v ∈ Σ, v ∤ p, no condition is imposed (Σ-primitive). At a Steinberg place, pass between Σ-primitive and primitive objects using the precise Euler element of primitive-imprimitive-comparison; residual ramification alone does not make that element a unit.

**Hypotheses.**

- The residual disjointness of V^+ ⊕ A(χ) and V^- ⊕ A(χ′) modulo P (SU (7.3.3.a)) is what produces the D-projector; it is verified in each instance (SU proof of Thm 7.3.5, CLW and FW checks).

**Proof outline.**

1. (a) σ, hence every block, factors through G\_{K,Σ}.
2. (b) is SU Prop. 4.5.4(ii): the projector x^+ acts as identity on M^+ and kills M^-, so the extension restricted to D splits along the filtration.
3. At Steinberg places compute the Euler element by local duality. FW Assumption 3.7 imposes dim ρ̄^{I\_ℓ}=1; Thm 1.6(2) additionally imposes dim ρ̄^{G\_ℓ}=0. Neither substitutes for the unit criterion of primitive-imprimitive-comparison.

**Checks.**

- Checks the three kinds of local condition named by the stage: unramified, Steinberg via relaxing and Euler factors, ordinary at p.

**Prerequisites.** [`AutomorphicCongruences:L0/su-lattice-datum`](#node-l0-su-lattice-datum), [`AutomorphicCongruences:L0/primitive-imprimitive-comparison`](#node-l0-primitive-imprimitive-comparison), `SelmerIwasawaCohomology:L2/greenberg-condition`, `SelmerIwasawaCohomology:L2/unramified-condition`, `IntegralHeckeAndGaloisDeterminants:IHG.5/lattice-class-local-conditions`.

**Sources.**

- **SU**, Prop. 4.5.4, pp. 59–60; proof of Thm 7.3.5, p. 107: The ordinary local condition at p from the projector, and the verification of residual disjointness of the four characters at p.
- **FW-v3**, Thm 1.6(2), p. 6; Assumption 3.7, p. 25: Thm 1.6(2) has both the inertia-dimension and decomposition-invariants conditions; Assumption 3.7 has only the former.

<a id="node-l0-lattice-construction"></a>

#### The lattice construction: Eisenstein ideals bound Selmer groups

`AutomorphicCongruences:L0/lattice-construction` (theorem).

Atlas landmark: Lattice construction.

**Statement.** Let (ν, χ, ρ, σ, I) be a ν-polarized lattice datum (L0/su-lattice-datum) with H = G\_{ℚ,Σ}, G = G\_{K,Σ}, local data at D = G\_{K,p} satisfying SU 4.5.1–4.5.3, with V^+\_0 ⊕ A(χ) and V^-\_0 ⊕ A(χ′) residually disjoint modulo P, where A = Â\_{0,P} for a height-one prime P of a noetherian normal domain A\_0, and J = A ∩ I. Then (i) ord\_P Ch^Σ\_ℚ(ψν) ≥ ℓ\_P(L(χ′)/J(χ′)); (ii) ord\_P Ch^Σ\_K(ρ\_0 ⊗ χ^{-1}) ≥ ℓ\_P(N/N′), and in particular ord\_P Ch^Σ\_K(ρ\_0 ⊗ χ^{-1}) ≥ ord\_P(J) when N′ = 0 (SU Prop. 4.5.6); (iii) if ord\_P Ch^Σ\_ℚ(ψν) = 0 then ord\_P Ch^Σ\_K(ρ\_0 ⊗ χ^{-1}) ≥ ord\_P(J) (SU Cor. 4.5.7); (iv) under SU Lemma 4.3.11, if ord\_P(J) > ord\_P Ch^Σ\_ℚ(ψν) then ord\_P Ch^Σ\_K(ρ\_0 ⊗ χ^{-1}) ≥ 1 (SU Prop. 4.5.8). Here the Selmer groups are the Σ-primitive ones of L0/sigma-primitive-selmer for the pairs (A\_0(ψν), 0) and (V\_0(χ^{-1}), V^+\_0(χ^{-1})). The variant of Wan20 Prop. 9.2 replaces the irreducibility of σ by condition (9): every specialization σ\_λ is absolutely irreducible or contains an absolutely irreducible two-dimensional subrepresentation with trace ≡ χ + χ′ modulo I.

**Hypotheses.**

- P is a height-one prime of A\_0 with A\_0 noetherian normal; the polarization ν is compatible with the polarization of ρ (4.5.5.a).
- The bound concerns the Σ-primitive groups; primitive versions follow by L0/primitive-imprimitive-comparison.
- The excluded case ord\_P Ch^Σ\_ℚ(ψν) > 0 is where the abelian Selmer group may absorb the extensions; CLW and Wan exclude such P explicitly.
- Use SU §4.4 descent: A\_0 is a profinite Krull domain with height-one P and completion A; R\_0 is a reduced local finite A\_0-algebra with Q over P and completed R; ρ descends to the free A\_0-representation V\_0, σ has trace in R\_0 and finite R\_0\[G\]-orbits, and I\_0,J\_0 are the contractions. G,H are profinite and representations continuous.
- For SU §4.5.5 require ν compatible with the polarization Φ of σ, and V⁺\_0 an A\_0-free direct summand stable under G\_Qp. This compatibility follows from Lemma 4.3.3 only in odd residue characteristic with each σ\_i absolutely irreducible.
- The Wan20 Prop. 9.2 variant requires all its setup (1)–(9), including a rank-one local M⁺ character congruence and disjoint M⁻ constituent. Its condition (9) permits a two-dimensional absolutely irreducible subrepresentation whose trace is congruent to χ+χ′, not χ+χ^{-c} unless ν=1. The auxiliary one-dimensional Selmer factor must have valuation zero for the full length-of-J bound.

**Proof outline.**

1. Choose a lattice ℒ ⊂ M stable under R\[G\]; the residual projectors of the datum decompose ℒ into pieces ℒ(χ′), ℒ(ρ), ℒ(χ) with submodules 𝒥(·) cut out by I (SU 4.3, Cor. 4.3.9).
2. Off-diagonal blocks define cocycles: φ ↦ c\_φ(g) = (φ ⊗ id)(χ^{-1}(g)σ(g)ε̄* − ε̄*) gives Hom\_{A\_0}(N, A\_0^∨) → H¹(G, V\_0 ⊗ A\_0^∨(χ^{-1})), whose dual is surjective after localizing at P (SU Props 4.4.4–4.4.5).
3. Local conditions: the projector x^+ ∈ R\[D\] splits the D-extension, so a multiple t ∉ P of the image lies in the kernel of restriction to H¹(D, V^-\_0 ⊗ A\_0^∨(χ^{-1})), i.e. satisfies the ordinary condition (SU Prop. 4.5.4); by polarization the same holds at the conjugate prime.
4. Lengths: the dual Selmer group surjects onto Hom(N, A\_0^∨)^∨ localized at P, giving (ii); (iii) and (iv) follow from (i), Lemma 4.3.8 and Lemma 4.3.11.
5. For Wan20 Prop. 9.2 read and verify setup (1)–(9), retaining its rank-one ordinary line and alternative two-dimensional irreducible-subrepresentation case. This source-specific polarized construction is not a specialization of the supplier’s two-dimensional local Ribet theorem.

**Checks.**

- A height-one prime with ord\_P(J) = 2 and N′ = 0 must give ord\_P(Ch) ≥ 2, not just ≥ 1.
- Excluded-prime check: when ord\_P Ch^Σ\_ℚ(ψν) > 0 and Lemma 4.3.11 fails, no conclusion is drawn.
- The extension classes are those of the automorphic family; the theorem does not presuppose any divisibility of characteristic ideals.

**Prerequisites.** [`AutomorphicCongruences:L0/su-lattice-datum`](#node-l0-su-lattice-datum), [`AutomorphicCongruences:L0/sigma-primitive-selmer`](#node-l0-sigma-primitive-selmer), [`AutomorphicCongruences:L0/extension-class-local-conditions`](#node-l0-extension-class-local-conditions), `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-module`, `IntegralHeckeAndGaloisDeterminants:IHG.1/gma-extension-injection`, `mathlib:Module.length`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-0`.

**Sources.**

- **SU**, §4.3–4.5, Props 4.4.4–4.4.5, 4.5.4, 4.5.6, Cor. 4.5.7, Prop. 4.5.8, pp. 52–61: The cocycle construction, the local conditions at p and the length bounds.
- **CLW-v1**, proof of Thm 8.2.1, pp. 79–80: CLW verify Wan20's properties (6)–(9), with (9) by the CAP-exclusion argument, then apply Wan20 Prop. 9.2 at height-one P with ord\_P(E\_{π,ξ}) > 0 and (X\_{ξ∘Nm} ⊗ ℚ)\_P = 0.
- **FW-v3**, proof of Thm 7.32, pp. 96–97: Fouquet–Wan apply the lattice construction (Wan20 Prop. 9.2) to the semi-ordinary GU(3,1) pseudo-character.
- **Wan-2020**, §9, setup (1)–(9) and Prop. 9.2, PDF pp. 93–94: The variant’s complete local/descent setup and alternative irreducibility condition, read independently in this review.

<a id="node-l0-hida-tilouine-anticyclotomic"></a>

#### CM theta-family congruence and Katz normalization for the CLW integrality input

`AutomorphicCongruences:L0/hida-tilouine-anticyclotomic` (comparison).

**Statement.** Required CM-theta congruence comparison: in CLW Thm 8.2.1(2), K is imaginary quadratic, p splits, ξ has the stated infinity type and ξ\_p is not congruent to ξ\_p̄ modulo m. The associated ordinary CM theta family is residually irreducible and distinguished. The Hida–Tilouine/Hida comparison for this CM family, combined with Hida’s Rankin–Selberg construction, gives the integral normalization L^{Hida}\_{π,K,ξ} used in CLW’s proof on PDF p. 81. This node records that source-qualified input and its comparison contract. It asserts no general CM-field characteristic-ideal equality: the exact HT hypotheses and congruence-ideal map remain the named gap and supplier request.

**Hypotheses.**

- All hypotheses of CLW Thm 8.2.1(2), in particular ξ\_p≢ξ\_p̄; the CM Rankin function and its congruence-ideal denominator are supplied with compatible Katz normalization.
- The exact HT93/HT94/Hid06 theorem and integral comparison map must be obtained before this contract is discharged. Those papers were not read, and no unspecified list of their hypotheses is treated as a proved theorem.

**Proof outline.**

1. Identify the CM theta family and its residual irreducibility/distinguishedness from ξ\_p≢ξ\_p̄.
2. Request the exact CM congruence-ideal/Katz comparison and Hida Rankin denominator theorem invoked by CLW p. 81; retain their integral normalization, rather than infer integrality from a general µ=0 slogan.
3. Apply that comparison to the CLW Rankin function once supplied. This is a partial proof chain, recorded by hida-tilouine-not-read.

**Checks.**

- Consumed by L2s/clw-integrality (CLW's integrality of L\_{π,K,ξ} through L^Hida) and requested by HeegnerPointEulerSystems:HE.8b as 'Hida–Tilouine from proposed AC L0c'.

**Prerequisites.** `AutomorphicPadicLFunctions:L3/katz-hida-tilouine-tame`, `AutomorphicPadicLFunctions:L3h/hida-katz-mu-vanishing`, `PadicFamilies:L1/congruence-module`, [`AutomorphicCongruences:L0/lattice-construction`](#node-l0-lattice-construction).

**Sources.**

- **CLW-v1**, proof of Thm 8.2.1(2), p. 81: CLW deduce integrality of L^Hida\_{π,K,ξ} from the anticyclotomic main conjecture of Hida–Tilouine and Hida (HT93, HT94, Hid06).
- **Wan-2020**, Thm 1.1 and the remark after Thm 1.2, pp. 2–3: Wan proves integrality of Hida's p-adic L-function under (irred) and (dist) for the CM form g\_ξ.

**Open obligations.** hida-tilouine-not-read. See the detailed list below.

<a id="layer-l1"></a>

### Layer L1: The ordinary GU(2,2) argument

Ordinary control and the boundary sequence let one lift the singular coefficients of a Klingen family and subtract a cusp form. A surviving nonsingular coefficient supplies the height-one congruence. The four-dimensional pseudocharacter and L0 lattice argument then give the SU Selmer bound. The source range here is Q with imaginary quadratic K; its Hilbert extension is a separate L5w obligation.

<a id="node-l1-gu22-ordinary-hermitian-forms"></a>

#### Ordinary p-adic Hermitian modular forms on GU(2,2) and their Hecke algebra

`AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms` (construction).

**Statement.** Let K be an imaginary quadratic field in which p splits, G = G\_2 = GU(2,2) the unitary similitude group of the skew-Hermitian form w\_2 = (0 1\_2; −1\_2 0) over O\_K, and K′ ⊂ G(𝔸^p\_f) a neat open compact subgroup. On the ordinary locus of the integral model of the Shimura variety S\_G(K′K\_p) (with its toroidal and minimal compactifications), and over its Igusa tower, define the space V^q\_{a,ord} (dual of the ordinary p-adic Hermitian modular forms; q = 0 for cusp forms, q = 1 for all forms) of weight a with coefficients in Λ\_2 = ℤ\_p\[\[Γ\_2\]\], Γ\_2 = (1 + pℤ\_p)^4 ⊂ T\_2(ℤ\_p), with the q-expansions at the cusps x = diag(u, t ū^{-1}), the Hecke operators at unramified places, the U\_p-operators u\_t for t = diag(p^{a\_1},…,p^{a\_4}), the ordinary projector e = lim u\_t^{n!}, and the universal ordinary cuspidal Hecke algebra h\_{Σ,0}(K′; Λ). Specializations at arithmetic weights are classical holomorphic Hermitian modular forms of weight (κ, κ; 0, 0)-type when the weight is sufficiently regular. Write M^q=Hom\_Λ(V^q,Λ) for the module of forms carrying q-expansions: V and M are dual carriers and are not identified without a pairing.

**Hypotheses.**

- p splits in K; K′K\_p neat; the p-adic weights are characters of T\_2(ℤ\_p) through Γ\_2 and µ\_{p−1}^4.
- The Shimura variety, its compactifications, the automorphic bundles and the ordinary Igusa tower are imported from AutomorphicPadicLFunctions:L4 (unitary PEL data) and AutomorphicBundles; this node instantiates them for GU(2,2) in SU's normalization.

**Proof outline.**

1. Instantiate AutomorphicPadicLFunctions:L4's unitary PEL datum at signature (2,2) and its ordinary forms, using SU §5 conventions (G\_n, the Siegel parabolic, cusps C\_{n−1}(K)).
2. Define the ordinary projector by the profinite ordinary projector of PadicFamilies:L0a applied to u\_t on the p-adic forms.
3. q-expansions at x and the Fourier–Jacobi expansions along the Klingen parabolic come from AutomorphicBundles:B5.

**Checks.**

- The degree-one analogue GU(1,1) recovers elliptic modular forms twisted by characters of K, which is how the Eisenstein family is built from a Hida family f.

**Uses.**

- L1/gu22-hida-control: the spaces whose freeness and control are proved
- L1/padic-eisenstein-family: ℰ\_D is an element of M^{ord}\_a(K′; Λ\_D)
- L1/gu22-galois-pseudocharacter: the Hecke algebra h\_D on which the pseudo-character lives
- AutomorphicCongruences:L5w/klingen-interpolation: the totally real analogue over F imports the same carrier through AutomorphicPadicLFunctions:L4

**API.**

- `GU22Forms.space` (constructor): V^q\_{a,ord}(K′; Λ\_2) and M^q\_{a,ord}(K′; Λ\_2) for q ∈ {0, 1} (cusp forms, all forms).
- `GU22Forms.qExp` (projection): The cusp q-expansion of a form in M^q=Hom\_Λ(V^q,Λ), with injectivity on M^q by the q-expansion principle; it is not a q-expansion map on the compact dual V^q.
- `GU22Forms.hecke` (data): The Hecke operators T\_v, Z\_{ℓ,0}, Z^{(i)}\_{ℓ,0} and u\_t, commuting, with e the ordinary projector.
- `GU22Forms.specialize` (functoriality): Specialization at an arithmetic weight φ lands in classical holomorphic ordinary forms of weight φ for sufficiently regular φ.
- `GU22Forms.siegelOperator` (projection): The Siegel operator Φ to the boundary, fitting in the exact sequence of Cor. 5.5.9 and Thm 6.3.10.
- `GU22Forms.heckeAlgebra` (data): h\_{Σ,0}(K′; Λ) := the Λ-algebra generated by the Hecke operators acting on ordinary cusp forms; finite and reduced over Λ\_D after base change.
- `GU22Forms.ext` (extensionality): Forms in M^q are equal when every coefficient at every permitted cusp agrees.

**Unit tests.**

- `gu22Forms_degree_one` (agreement): For n = 1 the same construction for GU(1,1) gives ordinary p-adic elliptic modular forms twisted by Hecke characters of K, with Hida's ordinary projector.
- `gu22Forms_qexp_injective` (characterisation): A form whose q-expansions vanish at every cusp x with x\_p ∈ Q(ℤ\_p) is zero (q-expansion principle on each connected component).
- `gu22Forms_eisenstein_not_cuspidal` (non-example): For the Eisenstein family with nonzero boundary value, ℰ\_D belongs to M^1 and not M^0. This rejects confusing the boundary kernel with the full space or the forms with their compact duals.
- `gu22Forms_projector_idempotent` (computation): e ∘ e = e and e commutes with every T\_v; on a classical form of weight a whose u\_t-eigenvalue is a p-adic unit, e acts as the identity.

**Prerequisites.** `AutomorphicPadicLFunctions:L4/ehls-unitary-datum`, `AutomorphicPadicLFunctions:L4/ehls-ordinary-forms-hecke`, `AutomorphicPadicLFunctions:L4/dl-siegel-hermitian-varieties`, `AutomorphicBundles:B5/global-fj-expansion`, `AutomorphicBundles:B5/fj-injectivity`, `PadicFamilies:L0a/profinite-ordinary-projector`, `mathlib:MvPowerSeries`.

**Sources.**

- **SU**, §5 (groups G\_n §5.1, Shimura varieties §5.2, cusps and boundary §5.4–5.5, Cor. 5.5.9), pp. 61–80; §6.1–6.2, pp. 81–91: Skinner–Urban's unitary similitude groups, Shimura varieties and ordinary automorphic forms with q-expansions and Hecke operators.
- **SU**, §6.3–6.4 (Thms 6.3.3, 6.3.10, 6.4.1), pp. 91–95: Λ-adic ordinary forms and the universal ordinary Hecke algebra h\_{S,0}.

<a id="node-l1-gu22-hida-control"></a>

#### Hida theory for GU(2,2): freeness, control and the boundary sequence

`AutomorphicCongruences:L1/gu22-hida-control` (theorem).

Atlas landmark: Hida theory for GU(2,2).

**Statement.** For n = 2 and q = 0 (cusp forms) or q = 1 (all forms): (i) V^q\_{a,ord} is free of finite rank over Λ\_n, and its specializations at finite-order characters ψ of level s have rank independent of ψ and of the weight (SU Thm 6.3.3); (ii) for any Λ\_n-algebra A there is a short exact sequence 0 → M^0\_{a,ord}(K^p, A) → M^1\_{a,ord}(K^p, A) →Φ ⊕\_{\[g\] ∈ C\_{n−1}(K)} M^0\_{a′,ord}(K^p\_{n−1,g}, Λ\_{n−1}) ⊗ A → 0, Φ the sum of the Siegel operators to the boundary components (cusp forms on G\_{n−1} = GU(1,1)) (SU Thm 6.3.10, from Cor. 5.5.9); (iii) for every sufficiently regular algebraic dominant weight k the canonical surjection h^{S,q}(K^p; Λ\_n) ⊗ Λ\_n/P\_k ↠ h^{S,q}\_{k,ord}(K) has nilpotent kernel, so every ℚ̄\_p-valued character of the Λ-adic Hecke algebra at P\_k comes from a classical ordinary eigenform of weight k (SU Thm 6.4.1). Consequently h\_{Σ,0}(K′; Λ) is finite over Λ\_2 and its arithmetic points of regular weight are Zariski dense.

**Hypotheses.**

- Weights sufficiently regular in the sense of SU 6.2; neat level; p split in K.

**Proof outline.**

1. Freeness from vertical control on the Igusa tower (SU §6.2–6.3, Props 6.2.5, Cor. 6.2.6, Thm 6.2.10).
2. Boundary exact sequence: the Siegel operator surjects onto boundary ordinary forms (SU Cor. 5.5.9, Thm 6.3.10).
3. Control of the Hecke algebra in sufficiently regular weight (nilpotent kernel, SU Thm 6.4.1); density of such weights in Spec Λ\_2.

**Checks.**

- The boundary sequence is what lets one subtract an Eisenstein family from a lift and obtain a cusp form congruent to it.

**Prerequisites.** [`AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms`](#node-l1-gu22-ordinary-hermitian-forms), `PadicFamilies:L0a/ordinary-part-complexes`, `PadicFamilies:L0a/profinite-projector-exact`, `AutomorphicPadicLFunctions:L4/ehls-ordinary-forms-hecke`.

**Sources.**

- **SU**, Thm 6.3.3, p. 91; Thm 6.3.10 and Thm 6.4.1, p. 95; Cor. 5.5.9, p. 78: Freeness of ordinary forms over Λ\_n, the boundary exact sequence and control in sufficiently regular weight.

**Open obligations.** su-proofs-cited. See the detailed list below.

<a id="node-l1-eisenstein-datum"></a>

#### The p-adic Eisenstein datum and its Eisenstein ideal

`AutomorphicCongruences:L1/eisenstein-datum` (definition).

Atlas landmark: Skinner–Urban Eisenstein ideal.

**Statement.** A p-adic Eisenstein datum D = (A, 𝕀, 𝐟, ψ, ξ, Σ) consists of the ring of integers A of a finite extension of ℚ\_p containing ℤ\[µ\_{M\_D p}, i, D\_K^{1/2}\], a normal domain 𝕀 finite over Λ\_{W,A}, an 𝕀-adic ordinary eigenform 𝐟 of tame level M, finite idele class characters ψ and ξ of 𝔸\_K^× (ψ|\_{𝔸^×} = χ\_𝐟), and a finite set of primes Σ containing those dividing M p D\_K and the ramification of ξ. Put Λ\_D = 𝕀\[\[Γ^-\_K × Γ\_K\]\], a finite local reduced Λ\_2-algebra via α ⊗ β (SU 6.5.1), the characters σ\_ψ, σ\_ξ, σ\_{ξ′} = σ\_ξσ^c\_ξ, and the semisimple representation ρ\_D = σ\_{χ̄\_f,0}σ^c\_ψε^{-3} ⊕ (ρ\_𝐟 ⊗ σ\_{χ̄\_f,0}σ^{-c}\_ξσ^c\_ψε^{-2}) ⊕ σ\_{χ̄\_f,0}ε^{-1}det ρ\_𝐟 σ^{-1}\_{ξ′}σ^c\_ψ of G\_K over Frac Λ\_D (6.5.2.a). The Eisenstein ideal I\_D ⊆ h\_D = h\_{Σ,0}(K′; Λ\_D) is generated by the coefficients of Q\_v(X) − Q\_{v,D}(X) (v ∉ Σ), the relations u\_t − ∏β\_i^{a\_i} for the U\_p-operators with the prescribed (β\_1,…,β\_4), and the central operators Z\_{ℓ,0}, Z^{(i)}\_{ℓ,0} minus their values on the Eisenstein characters; 𝔈\_D ⊆ Λ\_D is the kernel of Λ\_D → h\_D/I\_D, so Λ\_D/𝔈\_D ≅ h\_D/I\_D (6.5.3.a), and 𝕋\_D is the localization of h\_D at the maximal ideal containing I\_D. The two p-adic L-functions attached to D are L^Σ\_{𝐟,K,ξ} ∈ 𝕀\[\[Γ\_K\]\] (L1/su-padic-l-function) and L^Σ\_{χ̄\_𝐟ξ̄′}, the image of the Kubota–Leopoldt function of the Dirichlet character χ̄\_𝐟ξ̄′; their product is L\_D.

**Hypotheses.**

- ψ exists with ψ|\_{𝔸^×} = χ\_𝐟 and unramified outside Σ (SU Thm 12.3.1 hypothesis); (irred)\_𝐟 and (dist)\_𝐟 when 𝕋\_D is used.

**Proof outline.**

1. Define Λ\_D, the characters and ρ\_D as in SU 6.5.1–6.5.2.
2. Instantiate L0/eisenstein-ideal with the Hecke operators listed in SU 6.5.3 and the eigensystem of ρ\_D and the U\_p-characters.

**Checks.**

- The specialization of ρ\_D at an arithmetic point with an associated Eisenstein series is the Galois representation of that Eisenstein series (SU remark after (6.5.2.a)).

**Uses.**

- L1/padic-eisenstein-family: Thm 6.5.4 bounds ord\_P(𝔈\_D) below by ord\_P(L\_D)
- L1/su-selmer-lower-bound: the lattice datum of SU 7.3.2 takes J\_0 = 𝔈\_D and I\_0 = I\_D
- L1/gu22-galois-pseudocharacter: the residual pseudo-character of 𝕋\_D is tr ρ̄\_D

**API.**

- `EisensteinDatum.lambdaD` (data): Λ\_D = 𝕀\[\[Γ^-\_K × Γ\_K\]\] with its Λ\_2-algebra structure via α ⊗ β.
- `EisensteinDatum.rhoD` (data): The semisimple G\_K-representation ρ\_D of (6.5.2.a), unramified outside Σ, with det(1 − ρ\_D(g)X) ∈ Λ\_D\[X\].
- `EisensteinDatum.heckeIdeal` (constructor): I\_D ⊆ h\_D generated as in SU 6.5.3.
- `EisensteinDatum.ideal` (constructor): 𝔈\_D := ker(Λ\_D → h\_D/I\_D).
- `EisensteinDatum.quotientEquiv` (equivalence): Λ\_D/𝔈\_D ≃ h\_D/I\_D (6.5.3.a).
- `EisensteinDatum.LD` (data): L\_D = L^Σ\_{𝐟,K,ξ}·L^Σ\_{χ̄\_𝐟ξ̄′} ∈ Λ\_D.
- `EisensteinDatum.specialize` (compatibility): At an arithmetic φ ∈ X^a\_D with an associated Eisenstein series, φ(ρ\_D) is that series' Galois representation and φ(Q\_{v,D}) its Hecke polynomial.
- `EisensteinDatum.ext` (extensionality): Transport of A,I, the family and characters preserving their stated identities transports ρ\_D, I\_D and 𝔈\_D; equality of all generator eigenvalues identifies the ideals.

**Unit tests.**

- `eisensteinDatum_trace_shape` (computation): tr ρ\_D is the sum of two characters and the trace of a twist of ρ\_𝐟; its reduction modulo the maximal ideal is the residual trace used in Thm 7.3.1, with exactly one irreducible two-dimensional constituent under (irred)\_𝐟.
- `eisensteinDatum_proper` (characterisation): 𝔈\_D ≠ Λ\_D exactly when some cuspidal ordinary eigensystem is residually congruent to the eigensystem of ρ\_D.
- `eisensteinDatum_rank_count` (degenerate): At an arithmetic quotient I→O of a genuine finite Iwasawa branch, Λ\_D⊗\_I O≅O\[\[Γ\_K^-×Γ\_K\]\] has three Iwasawa variables and Krull dimension four. The original I still has its weight variable; I=O is not a finite extension of O\[\[W\]\].
- `eisensteinDatum_not_gl2` (non-example): Replacing h\_D by the GL₂ Hecke algebra of 𝐟 does not give an Eisenstein ideal of this datum: ρ\_D has rank four and its Hecke polynomials Q\_v have degree four.

**Prerequisites.** [`AutomorphicCongruences:L0/eisenstein-ideal`](#node-l0-eisenstein-ideal), [`AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms`](#node-l1-gu22-ordinary-hermitian-forms), `IntegralHeckeAndGaloisDeterminants:IHG.3/gln-hecke-polynomial`, `PadicFamilies:L4/ordinary-big-galois-representation`, `DirichletPadicLFunctions:L4`.

**Sources.**

- **SU**, §6.5.1–6.5.3, pp. 96–98: The datum D, the ring Λ\_D, the representation ρ\_D, the generators of I\_D and the isomorphism Λ\_D/𝔈\_D ≅ h\_D/I\_D.

**Open obligations.** hida-representation-conventions. See the detailed list below.

<a id="node-l1-klingen-eisenstein-series"></a>

#### Klingen Eisenstein series on GU(2,2) as pullbacks of Siegel Eisenstein series on GU(3,3)

`AutomorphicCongruences:L1/klingen-eisenstein-series` (construction).

**Statement.** For a cuspidal eigenform f on GU(1,1) (from an elliptic newform and a character ψ), a character ξ of 𝔸\_K^× and a choice of local sections at the places of Σ and at p, construct the holomorphic Klingen-type Eisenstein series E(Z, x; F) on GU(2,2), induced from the Klingen parabolic with Levi GU(1,1) × Res\_{K/ℚ}𝔾\_m, of weight κ > 6 (SU §9, 'good Eisenstein series' Prop. 9.3.3), its Hecke eigenvalues and Satake parameters (SU §9.5–9.6), and its expression through the pullback of a Siegel Eisenstein series on GU(3,3) along GU(2,2) × GU(1,1) ↪ GU(3,3) paired against f (SU §11, Prop. 11.2.3). The local sections at p and at Σ are chosen as in SU §11.4, so that the Fourier coefficients c(β, x) are products of local Whittaker integrals with explicit values (SU Cor. 11.7.5–11.7.6, §11.8), the singular ones (det β = 0) being multiples of the L-values L^Σ\_K(f, χ̄\_fξ, κ − 1)·L^Σ(χ̄\_fξ̄′, κ − 2).

**Hypotheses.**

- κ > 6 for the absolutely convergent range; the sections at p have conductor dividing p as in (12.4.2.a) when the family is formed.
- The doubling/pullback formalism, the Siegel Eisenstein series on unitary groups and the local doubling integrals are imported; this node owns the Klingen-specific choices and coefficient formulas.

**Proof outline.**

1. Pullback (doubling) formula: restricting E^{Sieg}\_{GU(3,3)} to GU(2,2) × GU(1,1) and integrating against f gives the Klingen series times the standard L-value (SU Prop. 11.2.3, from Shimura/Garrett).
2. Local computations at unramified places, at Σ and at p (SU §11.4, Props 11.4.13, 11.4.17, 11.4.18, 11.4.23) and the Fourier coefficients (SU §11.6–11.7).
3. Hecke eigenvalues: E is an eigenform with Hecke polynomial Q\_{v,D} (SU §9.5–9.6).

**Checks.**

- The constant terms (Siegel operator images) and all singular Fourier coefficients are divisible by the product of the two L-values; the nonsingular ones are not in general.

**Uses.**

- L1/padic-eisenstein-family: the classical members G\_{D\_φ} interpolated by ℰ\_D
- L1/nonsingular-coefficient-coprimality: the nonsingular coefficients c\_D(β\_i, x) analysed in §13
- AutomorphicCongruences:L5w/klingen-interpolation: Wan 2015's Hilbert analogue uses the same pullback pattern

**API.**

- `KlingenEisenstein.series` (constructor): E(Z, x; F) on GU(2,2) from (f, ψ, ξ, Σ, local sections).
- `KlingenEisenstein.pullback` (characterisation): E is the pairing of the pullback of E^{Sieg}\_{GU(3,3)} with f (doubling identity).
- `KlingenEisenstein.fourierCoeff` (data): c(β, x) as a product of local Whittaker integrals with the values of SU Cor. 11.7.5–11.7.6.
- `KlingenEisenstein.singular_dvd` (characterisation): For det β = 0, c(β, x) is a multiple of L^Σ\_K(f, χ̄\_fξ, κ−1)·L^Σ(χ̄\_fξ̄′, κ−2) divided by the period.
- `KlingenEisenstein.hecke` (characterisation): E is a Hecke eigenform with Hecke polynomials Q\_{v,D} at v ∉ Σ and the U\_p-eigenvalues ∏β\_i^{a\_i}.
- `KlingenEisenstein.siegelOperator` (projection): The Siegel-operator image of E at each boundary component is f (or 0) times the constant-term L-value.
- `KlingenEisenstein.ext` (compatibility): Equality follows from equality of all q-expansion coefficients at the specified cusps; compatible coefficient extension carries the local-section integrals and their eigenvalues to the extended series.

**Unit tests.**

- `klingen_constant_term_divisible` (characterisation): The Siegel-operator image of E at the standard boundary component equals the L-value product times f, up to the explicit nonzero archimedean constant of SU §11.
- `klingen_not_siegel` (non-example): The Siegel Eisenstein series on GU(2,2) itself (induced from the Siegel parabolic) has Hecke polynomials of a different shape (four characters, no two-dimensional constituent) and is not E.
- `klingen_hecke_matches_rhoD` (agreement): At v ∉ Σ, the Hecke polynomial of E equals φ(Q\_{v,D}), the characteristic polynomial of Frob\_v on the specialization of ρ\_D (L1/eisenstein-datum).

**Prerequisites.** `AutomorphicPadicLFunctions:L4/doubling-global-identity`, `AutomorphicPadicLFunctions:L4/local-zeta-at-p`, `AutomorphicPadicLFunctions:L4/ehls-eisenstein-measure`, `AutomorphicPadicLFunctions:L4e/ew-pullback-and-local-computations`, [`AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms`](#node-l1-gu22-ordinary-hermitian-forms).

**Sources.**

- **SU**, §9 (Props 9.2.6, 9.3.3, 9.5.3, 9.6.1, 9.6.2), pp. 113–135: The Klingen-type cuspidal Eisenstein series on GU(2,2), their Hecke eigenvalues and U\_p-behaviour.
- **SU**, §11 (Prop. 11.2.3; Props 11.4.13–11.4.23; Props 11.6.1–11.6.2; Cor. 11.6.3; Props 11.7.1–11.7.4; Cors 11.7.5–11.7.6; Prop. 11.8.2), pp. 140–190: Siegel Eisenstein series on GU(3,3), their pullbacks and the computation of Fourier coefficients.

**Open obligations.** su-proofs-cited. See the detailed list below.

<a id="node-l1-gu22-galois-pseudocharacter"></a>

#### The four-dimensional pseudo-character of the ordinary GU(2,2) Hecke algebra

`AutomorphicCongruences:L1/gu22-galois-pseudocharacter` (construction).

**Statement.** For a neat K = K^0\_pK^p ⊂ G(𝔸\_f) and a finite set S of primes containing p and the primes where K\_ℓ is not hyperspecial, there is a pseudo-representation T^S\_{K^p}: G\_K → h\_{S,0}(K^p) of dimension four such that tr R\_p(π) = λ^{ord}\_π ∘ T^S\_{K^p} for every p-ordinary cuspidal π of weight k with π\_f^{K^p} ≠ 0 (SU Prop. 7.2.1), where R\_p(π) is the four-dimensional Galois representation attached to π (imported from AutomorphicGaloisRepresentationsPartII: polarized, unramified outside S, crystalline at p when π\_p is unramified, with the ordinary filtration at the primes above p). For a datum D, T\_D is its composite with h\_D, R\_D the semisimple representation over the total fraction ring of h\_D with trace T\_D, and for each irreducible component J, R\_J is either absolutely irreducible or, over a finite extension of Frac J, R\_1 ⊕ R\_2 with two-dimensional R\_i satisfying R\_i^c ≅ R\_i^∨ ⊗ ε^{-3}ω^{1+c}\_{K′} (SU Thm 7.3.1).

**Hypotheses.**

- k regular for the attachment of R\_p(π) (SU Thm 7.1.1, from Morel and Shin as explained in Skinner 2010); (irred)\_𝐟 and (dist)\_𝐟 for Thm 7.3.1.
- The Galois representations of cuspidal representations of GU(2,2) and their local–global compatibility at p are imported (RT-AREA-iwasawa-1/6), not constructed here.

**Proof outline.**

1. Define T(frob\_v) := T\_v (the Hecke operator giving −1 times the X^3-coefficient of the Hecke polynomial) for v ∉ S ∪ {p}, extend by continuity using Chebotarev density and compactness of h, and check independence of the approximating sequence on a Zariski-dense set of arithmetic points (proof of SU Prop. 7.2.1).
2. The pseudo-representation identities hold because they hold at each classical point and these are dense.
3. Thm 7.3.1: if R\_J were a sum of two characters and an irreducible two-dimensional piece, specialize at a regular-weight point unramified at p to get a CAP representation, excluded by the residual shape tr ρ̄\_D; otherwise R\_J = R\_1 ⊕ R\_2 with the stated polarization.

**Checks.**

- The residual pseudo-character of 𝕋\_D is tr ρ̄\_D: two characters and one irreducible two-dimensional constituent.

**Uses.**

- L1/su-selmer-lower-bound: σ of the lattice datum is the representation R\_D over the localized Hecke algebra
- L2s/cap-exclusion: CLW and FW use the same pseudo-character argument on GU(3,1) (SU Prop. 7.2.1 cited there)

**API.**

- `GU22PseudoChar.T` (constructor): T^S\_{K^p}: G\_K → h\_{S,0}(K^p), a continuous four-dimensional pseudo-representation.
- `GU22PseudoChar.specialize` (characterisation): λ^{ord}\_π ∘ T = tr R\_p(π) for every ordinary cuspidal π of level K^p.
- `GU22PseudoChar.frob` (characterisation): T(frob\_v) = T\_v for v ∉ S ∪ {p}; the characteristic polynomial of frob\_v is the Hecke polynomial Q\_v.
- `GU22PseudoChar.polarization` (characterisation): T(c g c) = T(g^{-1})·(similitude character) — the polarization inherited from each R\_p(π).
- `GU22PseudoChar.components` (structure): Dichotomy of Thm 7.3.1 for components J of 𝕋\_D.
- `GU22PseudoChar.residual` (characterisation): T\_D modulo the maximal ideal is tr ρ̄\_D.
- `GU22PseudoChar.ext` (extensionality): Continuous pseudocharacters agreeing at all unramified Frobenius classes agree by Chebotarev density; compatible Hecke quotient maps transport the pseudocharacter.

**Unit tests.**

- `gu22PseudoChar_dimension` (computation): T(1) = 4.
- `gu22PseudoChar_eisenstein_point` (agreement): The cuspidal pseudocharacter modulo I\_D agrees with tr ρ\_D modulo 𝔈\_D through Λ\_D/𝔈\_D≅h\_D^cusp/I\_D. It need not admit an Eisenstein eigencharacter into Λ\_D itself.
- `gu22PseudoChar_not_gl2` (non-example): A pseudo-character of dimension two (the GL₂ one of 𝐟) does not satisfy GU22PseudoChar.specialize: its value at 1 is 2.
- `gu22PseudoChar_cap_excluded` (characterisation): No component J has R\_J = character ⊕ character ⊕ irreducible two-dimensional (the CAP shape), under (irred)\_𝐟 and (dist)\_𝐟.

**Prerequisites.** `AutomorphicGaloisRepresentationsPartII:AG2.2/shin-regular-geometric-existence`, `AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly`, `AutomorphicGaloisRepresentationsPartII:AG2.5/good-prime-unramified-polynomial`, `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`, `IntegralHeckeAndGaloisDeterminants:IHG.4/classical-interpolation`, `IntegralHeckeAndGaloisDeterminants:IHG.4/frobenius-determinant-uniqueness`, [`AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms`](#node-l1-gu22-ordinary-hermitian-forms), [`AutomorphicCongruences:L1/eisenstein-datum`](#node-l1-eisenstein-datum).

**Sources.**

- **SU**, Thm 7.1.1, p. 99; Prop. 7.2.1 and its proof, p. 101: The Galois representations of ordinary cuspidal representations of GU(2,2) and the pseudo-representation on the universal ordinary Hecke algebra.
- **SU**, Thm 7.3.1 and its proof, pp. 103–105: Components of the Hecke algebra give irreducible or polarized-reducible representations.

**Open obligations.** unitary-galois-adapter. See the detailed list below.

<a id="node-l1-su-padic-l-function"></a>

#### The Skinner–Urban three-variable p-adic L-function

`AutomorphicCongruences:L1/su-padic-l-function` (theorem).

Atlas landmark: Skinner–Urban p-adic L-function.

**Statement.** Let A, 𝕀, 𝐟, ξ and Σ be as in a p-adic Eisenstein datum, and suppose there is a finite A-valued idele class character ψ with ψ|\_{𝔸^×} = χ\_𝐟, unramified outside Σ. (i) There is L̃^Σ\_{𝐟,K,ξ} ∈ Frac(𝕀) ⊗\_𝕀 𝕀\_K whose value at every φ ∈ X\_{𝕀\_K,A}(𝐟, ψ, ξ) is the Petersson-normalized algebraic part of L^Σ\_K(f\_φ, χ̄\_{f\_φ}ξ\_φ, κ\_φ − 1) (SU Thm 12.3.1(i)); (ii) under (irred)\_𝐟 and (dist)\_𝐟 there is L^Σ\_{𝐟,K,ξ} ∈ 𝕀\_K whose value at φ is u\_{f\_φ} times the same L-value normalized by the canonical periods Ω^+\_{f\_φ}Ω^-\_{f\_φ}, u\_{f\_φ} a p-adic unit (SU Thm 12.3.1(ii)). (iii) If moreover χ\_𝐟 = 1, ξ = ξ̄^c with conductor dividing (p), (M, D\_K) = 1, M = M^+M^- with M^- squarefree with an odd number of primes, all inert in K, and ρ̄\_𝐟 ramified at every ℓ | M^-, then L^Σ\_{𝐟,K,ξ} lies in no prime of 𝕀\[\[Γ\_K\]\] of the form Q·𝕀\[\[Γ\_K\]\] with Q a height-one prime of 𝕀\[\[Γ^+\_K\]\] (SU Prop. 12.3.6, from Vatsal's µ = 0). Precisely, the common numerator at φ is a(p,f\_φ)^{-ord\_p Nm(f\_{χ̄\_f ξ\_φ})}·((κ\_φ−2)!)²·g(χ̄\_f ξ\_φ)·Nm(f\_{ξ\_φ}d)^{κ\_φ−2}·L\_K^Σ(f\_φ,χ̄\_f ξ\_φ,κ\_φ−1). In (i) divide it by (−2πi)^{2κ\_φ−2}·2^{-3}(2i)^{κ\_φ+1}S(f\_φ)⟨f\_φ,f\_φ^c|W\_{N\_φ}⟩; in (ii) divide by (−2πi)^{2κ\_φ−2}Ω^+\_{f\_φ}Ω^-\_{f\_φ} and multiply by u\_{f\_φ}.

**Hypotheses.**

- As stated; the interpolation set X\_{𝕀\_K,A}(𝐟, ψ, ξ) is defined in SU §12.3 (conductor conditions at p).
- A contains i, sqrt(D\_K), and the local Gauss sums g(ξ\_ℓ^c,a\_ℓδ\_K), g(χ̄\_f,ℓ ξ\_ℓ^c,b\_ℓδ\_K), g(χ\_f,ℓ ξ̄′\_ℓ) for ℓ∈Σ\{p}, with conductors as in Prop. 12.2.5.
- In (iii), every prime of M⁺ splits in K; the stated inert conditions apply to M⁻.

**Proof outline.**

1. Apply the interpolation lemma 12.2.7 to the family g = f^{(1)}\_{D,1/M,1} of Prop. 12.2.5; Cor. 11.7.5 identifies the specializations (proof of SU Thm 12.3.1).
2. Density of X′\_D and independence of φ|\_{Γ^-\_K} place L̃ in Frac(𝕀) ⊗ 𝕀\_K; the integral version N\_g of Lemma 12.2.7(ii) gives (ii) (L0/canonical-period-congruence-number).
3. (iii): expand in γ^- − 1; the anticyclotomic specialization at a weight-two point has µ = 0 by Vatsal (through AutomorphicPadicLFunctions:L3h/finis-divisibility), so some coefficient is a unit and the series lies in no prime pulled back from 𝕀\[\[Γ^+\_K\]\].

**Checks.**

- Integrality (ii) requires (irred) and (dist); without them only (i) holds.
- The interpolation uses the canonical periods Ω^±; the anticyclotomic restriction is compared with Bertolini–Darmon's function only up to a unit (SU 3.6.14).

**Prerequisites.** [`AutomorphicCongruences:L1/klingen-eisenstein-series`](#node-l1-klingen-eisenstein-series), [`AutomorphicCongruences:L0/canonical-period-congruence-number`](#node-l0-canonical-period-congruence-number), `AutomorphicPadicLFunctions:L3h/finis-divisibility`, `AutomorphicPadicLFunctions:L3h/mod-p-nonvanishing`, `PadicFamilies:L1/family-period-line`.

**Sources.**

- **SU**, Thm 12.3.1, p. 199; Prop. 12.3.6, p. 202: The two interpolation statements and the non-divisibility by pulled-back height-one primes from Vatsal's theorem.
- **SU**, Prop. 12.2.5, author-copy p. 196; Thm 12.3.1, p. 199: The coefficient/Gauss-sum conditions and all factors of the two interpolation formulas.

**Open obligations.** vatsal-mu. See the detailed list below.

<a id="node-l1-padic-eisenstein-family"></a>

#### The Λ_D-adic Klingen Eisenstein family and its constant terms

`AutomorphicCongruences:L1/padic-eisenstein-family` (theorem).

Atlas landmark: Klingen Eisenstein family.

**Statement.** Let D be a p-adic Eisenstein datum with cond(ψ\_p), cond(ξ\_p) | p, (irred)\_𝐟 and (dist)\_𝐟, and K′ ⊆ K′\_D with K′K\_p neat. (i) There is ℰ\_D ∈ M^{a,ord}(K′; Λ\_D) whose specialization at every φ ∈ X″\_D is u\_φ·G\_{D\_φ}/(Ω^+\_{f\_φ}Ω^-\_{f\_φ}) with |u\_φ|\_p = 1, G\_{D\_φ} the classical Klingen Eisenstein series (SU Thm 12.4.2(i), Thm 12.4.1); (ii) for x with x\_p ∈ Q(ℤ\_p) and det β = 0, the β-Fourier coefficient c\_D(β, x) lies in L^Σ\_{𝐟,K,ξ}·L^Σ\_{χ̄\_𝐟ξ̄′}·Λ\_D (Thm 12.4.2(ii)); (iii) The full ordinary Hecke algebra h\_D^full acting on all forms has the Eisenstein eigencharacter λ\_D^full:h\_D^full→Λ\_D. The cuspidal Hecke algebra h\_D^cusp only acquires this eigensystem modulo 𝔈\_D, through Λ\_D/𝔈\_D≅h\_D^cusp/I\_D. SU uses h\_D for the full algebra on p. 204 and the cuspidal algebra in §6.5.3. Consequently, if P ⊂ Λ\_D is a height-one prime with ℰ\_D ≢ 0 modulo P, then ord\_P(𝔈\_D) ≥ ord\_P(L\_D) (SU Thm 6.5.4): subtracting a lift of ℰ\_D's constant terms produces a cuspidal family congruent to ℰ\_D modulo L\_D. Here ℰ\_D denotes the Eisenstein form and 𝔈\_D the coefficient-ring ideal; a hypothesis that the form is nonzero modulo P concerns ℰ\_D.

**Hypotheses.**

- (irred)\_𝐟, (dist)\_𝐟; A satisfies the hypotheses of SU Prop. 12.2.5; conductor condition (12.4.2.a) at p.
- The conclusion of Thm 6.5.4 is conditional on ℰ\_D being nonzero modulo P; L1/nonsingular-coefficient-coprimality supplies this.

**Proof outline.**

1. Interpolate each q-expansion coefficient by Lemma 12.2.7 applied to f^{(2)}\_{D,β,x} (proof of SU Thm 12.4.1), using Cor. 11.7.6.
2. Assemble a Λ\_D-adic ordinary form by the q-expansion principle and Hida theory (L1/gu22-hida-control).
3. Thm 6.5.4: if ord\_P(L\_D) = r and ℰ\_D ≢ 0 mod P, the boundary exact sequence lets one subtract a Λ\_D-adic lift of ℰ\_D's boundary values times L\_D^{-1}·(unit), producing a cusp form H ≡ ℰ\_D mod P^r, whence 𝕋\_D/I\_D surjects onto Λ\_D/(𝔈\_D, P^r).

**Checks.**

- The congruence is with the whole family ℰ\_D, not with an individual Eisenstein series; an interpolation formula for ℰ\_D alone does not give it.
- Excluded case: if ℰ\_D ≡ 0 mod P no bound is claimed.

**Prerequisites.** [`AutomorphicCongruences:L1/klingen-eisenstein-series`](#node-l1-klingen-eisenstein-series), [`AutomorphicCongruences:L1/gu22-hida-control`](#node-l1-gu22-hida-control), [`AutomorphicCongruences:L1/eisenstein-datum`](#node-l1-eisenstein-datum), [`AutomorphicCongruences:L1/su-padic-l-function`](#node-l1-su-padic-l-function), [`AutomorphicCongruences:L0/eisenstein-ideal`](#node-l0-eisenstein-ideal), [`AutomorphicCongruences:L0/canonical-period-congruence-number`](#node-l0-canonical-period-congruence-number), `AutomorphicPadicLFunctions:L4/ehls-eisenstein-measure`.

**Sources.**

- **SU**, Thms 12.4.1–12.4.2, pp. 202–203; Thm 6.5.4 and the paragraph before it, p. 98: The Λ\_D-adic Eisenstein series, divisibility of its singular coefficients by L\_D, and the resulting lower bound for the Eisenstein ideal.

<a id="node-l1-nonsingular-coefficient-coprimality"></a>

#### A nonsingular Fourier coefficient is prime to the p-adic L-function

`AutomorphicCongruences:L1/nonsingular-coefficient-coprimality` (theorem).

**Statement.** Let A be the ring of integers of a finite extension of ℚ\_p, 𝕀 a domain finite over Λ\_{W,A}, 𝐟 ∈ M^{ord}(M, 1; 𝕀) an 𝕀-adic newform with (irred)\_𝐟 and (dist)\_𝐟, and Σ\_0 ⊇ {ℓ | pMD\_K}. There is a finite Σ ⊇ Σ\_0 such that for D = (A, 𝕀, 𝐟, 1, 1, Σ) the set C\_D of nonsingular coefficients c\_D(β\_i, x) of ℰ\_D satisfies: (i) every height-one prime of Λ\_D containing C\_D is of the form PΛ\_D with P a height-one prime of 𝕀\[\[Γ^+\_K\]\]; (ii) if M = M^+M^- with M^- squarefree with an odd number of prime factors, all inert in K, and ρ̄\_𝐟 ramified at every ℓ | M^-, then no height-one prime of Λ\_D contains both L^Σ\_{𝐟,K,1} and C\_D (SU Prop. 13.4.1).

**Hypotheses.**

- The hypotheses of SU Prop. 12.2.5 on A; the auxiliary primes of Prop. 13.2.5 (a set of primes split in K not dividing the level) are part of the choice of Σ.

**Proof outline.**

1. Express a Λ\_D-combination of the c\_D(β\_i, x) as a product of Hecke L-values attached to auxiliary CM forms (SU §13.2–13.3, Props 13.2.5, 13.3.4).
2. Apply the mod-p nonvanishing results of Vatsal and Finis for anticyclotomic twists (AutomorphicPadicLFunctions:L3h/finis-divisibility, mod-p-nonvanishing) to show that combination is not divisible by any height-one prime other than those pulled back from 𝕀\[\[Γ^+\_K\]\].
3. Combine with L1/su-padic-l-function (iii), which excludes the pulled-back primes from L^Σ\_{𝐟,K,1}, to get (ii).

**Checks.**

- This is what makes ℰ\_D nonzero modulo every height-one prime dividing L^Σ\_{𝐟,K}, so that Thm 6.5.4 applies at those primes.

**Prerequisites.** [`AutomorphicCongruences:L1/padic-eisenstein-family`](#node-l1-padic-eisenstein-family), [`AutomorphicCongruences:L1/su-padic-l-function`](#node-l1-su-padic-l-function), `AutomorphicPadicLFunctions:L3h/finis-divisibility`, `AutomorphicPadicLFunctions:L3h/mod-p-nonvanishing`, `AutomorphicPadicLFunctions:L3h/hsieh-hecke-nonvanishing`.

**Sources.**

- **SU**, Prop. 13.4.1 and the paragraph before it, p. 217; Props 13.2.5, 13.3.4, pp. 210–213: Existence of a datum whose nonsingular coefficients share no height-one prime with L^Σ\_{𝐟,K,1}.
- **SU**, §1.4.5, p. 9: The proof uses formulas from §11 and the mod-p nonvanishing results of Vatsal and Finis.

**Open obligations.** su-proofs-cited; vatsal-mu. See the detailed list below.

<a id="node-l1-su-selmer-lower-bound"></a>

#### The Skinner–Urban Selmer lower bound from the Eisenstein ideal

`AutomorphicCongruences:L1/su-selmer-lower-bound` (theorem).

**Statement.** Assume (irred)\_𝐟, (dist)\_𝐟 and 𝕀 integrally closed. Let T = (T\_𝐟 ⊗\_𝕀 𝕀\[\[Γ\_K\]\])(det ρ\_𝐟^{-1}σ^{-c}\_ξε^{-c}\_K) with its ordinary summand T^+, and Ch^Σ\_K(ρ\_𝐟 ⊗ σ\_ξε\_K) ⊆ 𝕀\[\[Γ\_K\]\] the characteristic ideal of X^Σ\_K(T, T^+). For a height-one prime P\_0 ⊂ 𝕀\[\[Γ\_K\]\] with P = P\_0Λ\_D such that the four G\_{K,p}-characters of SU (7.3.3.a) are residually distinct modulo P: (i) if ord\_P(L^Σ\_{χ̄\_𝐟ξ̄′}) = 0 then ord\_{P\_0}(Ch^Σ\_K(ρ\_𝐟 ⊗ σ\_ξε\_K)) ≥ ord\_P(𝔈\_D) (SU Thm 7.3.3); (ii) if ℰ\_D ≢ 0 modulo P and ord\_P(L^Σ\_{𝐟,K,ξ}) ≥ 1, then ord\_P(Ch^Σ\_K) ≥ 1, and if moreover ord\_P(L^Σ\_{χ̄\_𝐟ξ̄′}) = 0 then ord\_P(Ch^Σ\_K) ≥ ord\_P(L^Σ\_{𝐟,K,ξ}) (SU Thm 7.3.5).

**Hypotheses.**

- Residual disjointness (7.3.3.a) is verified in the proof of Thm 7.3.5: the four characters δ²\_fσ^{-1}\_{χ\_f}ε\_Wε, δ\_fσ^{-1}\_{χ\_f}σ\_ξε\_W, δ\_fσ^{-1}\_{χ\_f}σ^c\_ξε\_W, σ\_{χ\_f}ε^{-1}\_Wσ^{-1}\_{ξ′}ε are not ≡ 1 modulo P, by (dist)\_𝐟 and a codimension count.

**Proof outline.**

1. Set up the lattice datum of SU 7.3.2: A\_0 = Λ\_D, A = Λ̂\_{D,P}, J\_0 = 𝔈\_D, R\_0 = 𝕋\_D, I\_0 = I\_D, V\_0 = T\_𝐟 ⊗ Λ\_D, ρ\_0 = ρ\_𝐟 ⊗ σ\_{χ̄\_f,0}σ^{-c}\_ξσ^c\_ψε^{-2}, V^±\_0 from T^+\_𝐟, χ, χ′, ν, and σ from R\_D.
2. Apply L0/lattice-construction (Prop. 4.5.6 and Cor. 4.5.7) and Shapiro (L0/sigma-primitive-selmer) to pass from ρ\_0 ⊗ χ^{-1} over Λ\_D to ρ\_𝐟 ⊗ σ\_ξε\_K over 𝕀\[\[Γ\_K\]\].
3. Thm 7.3.5 combines (i) with L1/padic-eisenstein-family (Thm 6.5.4) and checks (7.3.3.a).

**Checks.**

- The bound is height-one-prime by height-one-prime and needs ℰ\_D ≢ 0 mod P; L1/nonsingular-coefficient-coprimality supplies this at every P dividing L^Σ\_{𝐟,K}.

**Prerequisites.** [`AutomorphicCongruences:L0/lattice-construction`](#node-l0-lattice-construction), [`AutomorphicCongruences:L0/su-lattice-datum`](#node-l0-su-lattice-datum), [`AutomorphicCongruences:L0/sigma-primitive-selmer`](#node-l0-sigma-primitive-selmer), [`AutomorphicCongruences:L1/eisenstein-datum`](#node-l1-eisenstein-datum), [`AutomorphicCongruences:L1/gu22-galois-pseudocharacter`](#node-l1-gu22-galois-pseudocharacter), [`AutomorphicCongruences:L1/padic-eisenstein-family`](#node-l1-padic-eisenstein-family).

**Sources.**

- **SU**, §7.3.2 set-up, Thm 7.3.3, p. 105; Thm 7.3.5 and proof, pp. 107–108: The SU instance of the lattice construction and the passage from the Eisenstein ideal to the p-adic L-function.

<a id="node-l1-su-two-variable-theorem"></a>

#### Skinner–Urban's two-variable divisibility over K

`AutomorphicCongruences:L1/su-two-variable-theorem` (theorem).

Atlas landmark: Skinner–Urban two-variable theorem.

**Statement.** Let L ⊆ ℚ̄\_p be a finite extension of ℚ\_p containing ℚ\[µ\_{Np}, i, D\_K^{1/2}\], 𝕀 a normal domain finite over Λ\_{W,O\_L}, and 𝐟 an 𝕀-adic ordinary eigenform of tame level N with χ\_𝐟 = 1. Suppose N = N^+N^- with N^+ divisible only by primes split in K and N^- only by primes inert in K, N^- squarefree with an odd number of prime factors, (irred)\_𝐟 and (dist)\_𝐟, and ρ̄\_𝐟 ramified at every ℓ | N^-. For every finite Σ containing the primes dividing ND\_K, Ch^Σ\_{K\_∞}(𝐟) ⊆ (L^Σ\_{𝐟,K}) (SU Thm 3.6.1). For a classical p-ordinary eigenform f ∈ S\_k(Np^r, χ; L), k ≥ 2, with χ = ω^{k−2}χ\_1 (χ\_1 of p-power order and conductor) and the same hypotheses, Ch^Σ\_{K\_∞,L}(f) ⊆ (L^Σ\_{f,K}) (SU Cor. 3.6.2).

**Hypotheses.**

- As stated; the hypotheses on N^- and ρ̄\_𝐟|\_{I\_ℓ} enter through Vatsal's theorem (L1/su-padic-l-function (iii)); χ\_𝐟 = 1 enters there and in the Galois argument; Σ ⊇ primes dividing ND\_K avoids local–global compatibility away from p (SU remarks (i)–(v) after Thm 3.6.1).

**Proof outline.**

1. For each height-one prime P\_0 of 𝕀\[\[Γ\_K\]\] dividing L^Σ\_{𝐟,K}, choose the datum of L1/nonsingular-coefficient-coprimality so that ℰ\_D ≢ 0 mod P = P\_0Λ\_D.
2. If ord\_P L^Σ\_{χ̄\_𝐟ξ̄′} = 0 apply L1/su-selmer-lower-bound (ii); the Dirichlet factor is a unit at P because it lives in the cyclotomic variable only and P\_0 is not pulled back (L1/su-padic-l-function (iii)).
3. Conclude ord\_{P\_0}(Ch^Σ) ≥ ord\_{P\_0}(L^Σ\_{𝐟,K}) for every height-one P\_0, hence the divisorial containment (end of SU §7, p. 108).
4. Cor. 3.6.2: specialize along 𝕀 → O\_L using (3.3.12.b), L0/selmer-specialization-control (ii) and the comparison of L^Σ\_{𝐟,K} with L^Σ\_{f,K} (SU 3.4.6).

**Checks.**

- Oriented: the characteristic ideal is contained in the ideal of the p-adic L-function (L divides the characteristic power series).
- Integral, not after inverting p, under the stated hypotheses.

**Prerequisites.** [`AutomorphicCongruences:L1/su-selmer-lower-bound`](#node-l1-su-selmer-lower-bound), [`AutomorphicCongruences:L1/nonsingular-coefficient-coprimality`](#node-l1-nonsingular-coefficient-coprimality), [`AutomorphicCongruences:L1/su-padic-l-function`](#node-l1-su-padic-l-function), [`AutomorphicCongruences:L0/selmer-specialization-control`](#node-l0-selmer-specialization-control), [`AutomorphicCongruences:L0/primitive-imprimitive-comparison`](#node-l0-primitive-imprimitive-comparison), `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-0`.

**Sources.**

- **SU**, Thm 3.6.1 and remarks (i)–(v), pp. 41–42; Cor. 3.6.2 and proof, p. 42; end of §7, p. 108: The two-variable divisibility for Hida families and its specialization to classical forms.

<a id="node-l1-su-cyclotomic-divisibility"></a>

#### Skinner–Urban's cyclotomic divisibility

`AutomorphicCongruences:L1/su-cyclotomic-divisibility` (theorem).

Atlas landmark: Skinner–Urban cyclotomic divisibility.

**Statement.** Let f ∈ S\_k(Np^r, χ; L), k ≥ 2, be a p-ordinary cuspidal eigenform with (irred) and (dist) for ρ\_f, χ = ω^{k−2}χ\_1 with χ\_1 of p-power order and conductor, and a prime q ≠ p with q ∥ N at which ρ̄\_f is ramified; choose an imaginary quadratic K in which p splits, every prime dividing N/q splits and q is inert, so N^- = q. Then for every finite set of primes Σ, Ch^Σ\_{ℚ\_∞,L}(f)·Ch^Σ\_{ℚ\_∞,L}(f ⊗ χ\_K) ⊆ (L^Σ\_f·L^Σ\_{f⊗χ\_K}) (SU Cor. 3.6.3). This is the reverse divisibility exported to ModularIwasawaMainConjectures:L1/su-ordinary-theorem, in the normalization of the Σ-imprimitive ordinary Selmer dual and the canonical-period p-adic L-function; the equality (SU Thm 3.6.4, with Kato) is assembled there, not here.

**Hypotheses.**

- As stated; the integral containment needs only these hypotheses. The integral equality additionally uses Kato's image condition (a basis with image containing SL₂(ℤ\_p)), owned by the consumer.
- The identification with ModularIwasawaMainConjectures:L0's ordinary Selmer dual and canonical-period p-adic L-function is made in that roadmap's range (trivial character, p ∤ N, the range of SU Thm 3.6.4); outside it the statement is about SU's own Σ-primitive Selmer group and L^Σ\_f.

**Proof outline.**

1. Reduce to Σ ∪ {p} containing all primes dividing ND\_K (SU Lemma 3.2.17 and L0/primitive-imprimitive-comparison).
2. Apply L1/su-two-variable-theorem (Cor. 3.6.2), then descend from K\_∞ to the cyclotomic line: L0/selmer-specialization-control (iii) (SU Prop. 3.2.11, Lemma 3.2.5, Cor. 3.2.9) gives Ch^Σ\_{K^+\_∞} = Ch^Σ\_{ℚ\_∞}(f)·Ch^Σ\_{ℚ\_∞}(f ⊗ χ\_K) by Shapiro, and the restriction of L^Σ\_{f,K} to Γ^+\_K is L^Σ\_f·L^Σ\_{f⊗χ\_K} up to unit (SU 3.4.6).

**Checks.**

- Matches the request of ModularIwasawaMainConjectures for SU Thm 3.6.1 and Cor. 3.6.3 in its stated source range; the auxiliary field K is allowed to depend on f.

**Prerequisites.** [`AutomorphicCongruences:L1/su-two-variable-theorem`](#node-l1-su-two-variable-theorem), [`AutomorphicCongruences:L0/selmer-specialization-control`](#node-l0-selmer-specialization-control), [`AutomorphicCongruences:L0/primitive-imprimitive-comparison`](#node-l0-primitive-imprimitive-comparison), `ModularIwasawaMainConjectures:L0/ordinary-selmer-dual`, `ModularIwasawaMainConjectures:L0/canonical-ordinary-padic-l-function`.

**Sources.**

- **SU**, Cor. 3.6.3 and proof, p. 42; proof of Thm 3.6.4 (choice of K), p. 43: The cyclotomic product divisibility and the choice of the auxiliary imaginary quadratic field.

<a id="layer-l2s"></a>

### Layer L2s: Semi-ordinary GU(3,1) in weight two

The two-variable semi-ordinary direction permits a nonordinary GL2 constituent. Freeness and the full-torus boundary sequence combine with the two Klingen families of the CLW addendum. Joint height-one coprimality gives the congruence prime by prime. CAP exclusion and the lattice argument lead to the cyclotomic-localized containment, and to the more precise integral/p-inverted statements under their additional hypotheses.

<a id="node-l2s-semi-ordinary-weight-space"></a>

#### The semi-ordinary weight space and projector for GU(3,1)

`AutomorphicCongruences:L2s/semi-ordinary-weight-space` (definition).

Atlas landmark: Semi-ordinary projector.

**Statement.** Let K be imaginary quadratic with p = v\_0v̄\_0 split, and GU(3,1) the unitary similitude group of signature (3,1), so that GU(3,1)(ℚ\_p) ≅ GL\_4(ℚ\_p) × ℚ\_p^× and the diagonal torus of the p-adic group gives a four-coordinate p-adic weight space (after fixing the similitude character) of characters (a\_1, a\_2, a\_3; b\_1). The semi-ordinary torus T\_so(ℤ\_p) ⊂ T(ℤ\_p) is the two-dimensional subtorus of weights (0, 0, t^+; t^-), with Iwasawa algebra Λ\_so = ℤ\_p\[\[T\_so(1+pℤ\_p)\]\]. On the p-adic forms V on the Igusa tower put U\_p := U^+\_{p,2}U^+\_{p,3}U^-\_{p,1}; for every f ∈ V the limit e\_so f := lim\_{r→∞} U\_p^{r!} f exists and defines the semi-ordinary projector e\_so. A classical form is semi-ordinary if it is fixed by e\_so; this asks unit U\_p-eigenvalues only in the two directions of T\_so, so it allows forms whose GL\_2 part at p is not ordinary (a\_p = 0 is allowed). Keep the finite character of T\_so(ℤ\_p)/T\_so(1+pℤ\_p) when using the full group algebra; it is not another power-series variable.

**Hypotheses.**

- p ≥ 3 split in K; the operators U^±\_{p,i} are those of CLW (3.0.7)–(3.0.8) on p-integral forms.
- The convergence of U\_p^{r!} on every f uses the finiteness property (F) of CLW Thm 4.6.1, proved there; the generic profinite projector is imported.

**Proof outline.**

1. Define U\_p and verify property (F) for forms in V^♭ by CLW Prop. 3.0.2 and Prop. 4.5.2, and for all of V by Prop. 4.5.3.
2. Apply the profinite ordinary projector of PadicFamilies:L0a to the locally finite endomorphism U\_p to obtain e\_so.

**Checks.**

- Semi-ordinary is weaker than ordinary: an ordinary form is semi-ordinary, while a form whose GL\_2 constituent at p has a\_p = 0 can be semi-ordinary and is killed by the ordinary projector.

**Uses.**

- L2s/semi-ordinary-hida-theory: the freeness and control theorems are for e\_so-parts
- L2s/semi-ordinary-klingen-family: E^{Kling} is a measure valued in e\_so V
- L2/general-weight-semi-ordinary-control: FW §7.3 extends the same projector to general weight

**API.**

- `SemiOrd.torus` (data): The two-dimensional torus T\_so; Λ\_so=Z\_p\[\[T\_so(1+pZ\_p)\]\] and its finite-character components inside Z\_p\[\[T\_so(Z\_p)\]\].
- `SemiOrd.Up` (data): U\_p = U^+\_{p,2}U^+\_{p,3}U^-\_{p,1} acting on p-adic forms.
- `SemiOrd.proj` (constructor): e\_so = lim U\_p^{r!}, an idempotent commuting with the Hecke operators away from p.
- `SemiOrd.proj_idem` (simp): e\_so ∘ e\_so = e\_so.
- `SemiOrd.ord_le_so` (relation): e\_so ∘ e\_ord = e\_ord: ordinary forms are semi-ordinary.
- `SemiOrd.weight` (projection): The weight map from Λ\_so-families to characters (τ^+, τ^-) of T\_so(ℤ\_p).
- `SemiOrd.ext` (extensionality): Two semi-ordinary forms are equal iff their ambient forms are equal; membership is e\_so(f)=f. The projector transports along equivariant maps.

**Unit tests.**

- `semiOrd_projector_eigenvalue` (computation): On a classical eigenform whose U\_p-eigenvalue is a p-adic unit u, U\_p^{r!}f = u^{r!}f → f because u^{r!} → 1 in ℤ\_p^× along r!; on an eigenform with U\_p-eigenvalue in pℤ\_p the limit is 0.
- `semiOrd_nonordinary_survives` (characterisation): In the unitary normalization, a good supersingular weight-two GL₂ constituent has Satake valuations 0,0. It can occur in CLW’s semi-ordinary Klingen family although its classical GL₂ U\_p roots have valuation 1/2,1/2. The extreme unitary valuations ±1/2 describe the ordinary case; they are not the supersingular example.
- `semiOrd_two_dimensional` (degenerate): After fixing a\_1=a\_2=0, Λ\_so has two weight variables and Krull dimension three over Z\_p; the finite torus character is retained separately. The unfixed weight tuple has four coordinates.
- `semiOrd_not_ordinary_projector` (non-example): Using the ordinary projector in place of e\_so on the weight-two forms of a supersingular π gives zero, so it cannot produce the Klingen family of L2s/semi-ordinary-klingen-family.

**Prerequisites.** `PadicFamilies:L0a/locally-finite-action`, `PadicFamilies:L0a/locally-finite-ordinary-projector`, `PadicFamilies:L0a/profinite-ordinary-projector`, `AutomorphicPadicLFunctions:L4/ehls-unitary-datum`, `AutomorphicPadicLFunctions:L4/ehls-ordinary-forms-hecke`, `mathlib:MvPowerSeries`.

**Sources.**

- **CLW-v1**, Thm 2.9.1(1), p. 13; Thm 4.6.1 and proof, p. 29: The operator U\_p = U^+\_{p,2}U^+\_{p,3}U^-\_{p,1}, convergence of U\_p^{r!} on every p-adic form, and the semi-ordinary projector e\_so.
- **CLW-v1**, §1, p. 3: The modular form is not assumed ordinary at p, so the standard Hida theory does not apply; the semi-ordinary theory replaces it.

<a id="node-l2s-cap-exclusion"></a>

#### Irreducibility of the GU(3,1) pseudo-character: excluding CAP components

`AutomorphicCongruences:L2s/cap-exclusion` (theorem).

**Statement.** Let 𝕋 be the semi-ordinary (or ordinary) cuspidal Hecke algebra of GU(3,1) localized at the Eisenstein maximal ideal, T: G\_K → 𝕋 its four-dimensional pseudo-character (built as in L1/gu22-galois-pseudocharacter from the Galois representations of cuspidal representations of U(3,1)), and suppose ρ̄\_π|\_{G\_K} is irreducible. Then for every Frac(A)-algebra map λ: 𝕋 ⊗ Frac(A) → K′, the representation σ\_λ is absolutely irreducible or contains an absolutely irreducible two-dimensional subrepresentation whose trace is ≡ χ + χ′ (with χ′=χ^{-c} here because ν=1) modulo I — Wan20's property (9) (CLW proof of Thm 8.2.1). If instead T = δ\_1 + δ\_2 + δ\_3 with δ\_3 two-dimensional and residually tr ρ̄\_π, then at an arithmetic point x of weight (0,0,t^+;t^-) with 0 ≫ t^+ ≫ −t^-, a twist of the specialization of δ\_3 descends to a G\_ℚ-representation ρ′\_{3,x} which is modular (ordinary case: as in SU Thm 7.3.1; non-ordinary case: ρ\_Π|\_{G\_{K,p}} is crystalline by a Jacquet-module argument and the semi-ordinary slopes, and Kisin's theorem applies; in general weight FW uses Pan's theorem), so Π is CAP, which Harris's Thm 2.5.6 excludes in these weights.

**Hypotheses.**

- ρ̄\_π|\_{G\_K} irreducible; arithmetic points in the absolutely convergent range of sufficiently regular weight.
- The unitary forms and Hecke operators are the AutomorphicPadicLFunctions:L4 carriers; the semi-ordinary projector is L2s's own, since L4 plans only the ordinary one.
- Harris (1984) Thm 2.5.6 (no holomorphic CAP forms of these weights on U(3,1)) is an input not planned in the atlas (gap 'harris-cap').

**Proof outline.**

1. Suppose the pseudo-character is a sum δ\_1 + δ\_2 + δ\_3; residual irreducibility of ρ̄\_π gives a two-dimensional 𝕋-valued representation for δ\_3.
2. Ordinary π: the specialization of δ\_3 at x is ordinary and modular by the SU argument.
3. Non-ordinary π: Edixhoven makes ρ̄\_π|\_{G\_{ℚ\_p}} irreducible; Jacquet modules show Π\_p is an unramified principal series (the semi-ordinary valuations (8.2.4)–(8.2.5) force distinct ratios ≠ p^{±1}), so ρ\_Π|\_{G\_{K,p}} and ρ′\_{3,x} are crystalline; ρ̄′\_{3,x} is not induced from ℚ(√p*), so Kisin's modularity lifting applies (FW: Pan's Fontaine–Mazur theorem for de Rham ρ with ρ̄|\_{G\_{ℚ\_p}} absolutely irreducible).
4. Modularity of ρ′\_{3,x} makes Π CAP (Klingen type), contradicting Harris Thm 2.5.6 for the chosen weights.

**Checks.**

- Shared by L2s/clw-main-divisibility and L2/fw-greenberg-divisibility; the RT-AREA-iwasawa-1/6 addendum asks exactly for these GL₂ modularity and Harris inputs.

**Prerequisites.** [`AutomorphicCongruences:L1/gu22-galois-pseudocharacter`](#node-l1-gu22-galois-pseudocharacter), `AutomorphicGaloisRepresentationsPartII:AG2.2/discrete-unitary-galois-assembly`, `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`, `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`, `GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`.

**Sources.**

- **CLW-v1**, proof of Thm 8.2.1, property (9), pp. 79–80: The CAP-exclusion argument in the ordinary case (SU Thm 7.5, Harris Thm 2.5.6) and the non-ordinary case (Jacquet modules, crystallinity, Kisin).
- **FW-v3**, proof of Thm 7.32, p. 97: The same argument in general weight, with modularity from Pan's Thm 1.0.4.

**Open obligations.** harris-cap; unitary-galois-adapter. See the detailed list below.

<a id="node-l2s-semi-ordinary-hida-theory"></a>

#### Semi-ordinary Hida theory and the fundamental exact sequence

`AutomorphicCongruences:L2s/semi-ordinary-hida-theory` (theorem).

Atlas landmark: Semi-ordinary Hida theory.

**Statement.** With e\_so as in L2s/semi-ordinary-weight-space: (1) the duals V^{0,*}\_so = Hom(e\_so V^0, ℚ\_p/ℤ\_p) and V^*\_so = Hom(e\_so V, ℚ\_p/ℤ\_p) are free of finite rank over Λ\_so (vertical control, CLW Thm 3.0.7 for cusp forms, Thm 4.6.1 for all forms); (2) the spaces of Λ\_so-families of tame level K^p\_f, M^0\_so = Hom\_{Λ\_so}(V^{0,*}\_so, Λ\_so) and M\_so = Hom\_{Λ\_so}(V^*\_so, Λ\_so), specialize isomorphically at every weight (τ^+, τ^-) with 0 ≥ t^+ ≥ −t^- + 4 onto the limits of e\_so-parts of mod p^m forms of that weight, and classical semi-ordinary forms embed into the specialization after inverting p (CLW (2.9.1)); (3) Thm 2.9.1(4) gives the exact sequence 0→M\_so^0→M\_so→⊕\_g M\_(0,0)(K′\_{f,g};Z\_p)⊗\_Zp Z\_p\[\[T\_so(Z\_p)\]\]→0. Thus the boundary uses the full torus group algebra, with its finite-character action. Only after the specified ξ/Γ\_K base change does one obtain the boundary form used in Thm 8.1.1. Thm 2.9.1(3) gives surjectivity onto classical cuspidal forms for t^-≥A(t^+); this extra condition is not automatic from the cone in (2).

**Hypotheses.**

- The weights in (2) satisfy 0 ≥ t^+ ≥ −t^- + 4; for the Klingen family, 0 ≫ t^+ ≫ −t^-.
- The Shimura variety of GU(3,1), its toroidal and minimal compactifications, the Igusa tower and the boundary strata are imported from AutomorphicPadicLFunctions:L4 and AutomorphicBundles.
- Retain the finite torus character when passing from Λ\_so to the full boundary group algebra. Classical cusp-surjectivity additionally requires t^-≥A(t^+).

**Proof outline.**

1. Base change and q-expansion: CLW Props 3.0.1–3.0.6; vertical control for cusp forms (Thm 3.0.7).
2. The boundary: restriction to the strata Z\_{g,n} gives the exact sequences (4.4.2)–(4.4.3) with the Siegel operators Φ\_g (Prop. 4.4.1), whose global sections are forms on the zero-dimensional Shimura variety of GU(2).
3. Finiteness (F) and the vertical control for all forms (Props 4.5.1–4.5.3, Thm 4.6.1); combine into Thm 2.9.1.

**Checks.**

- The exactness on the right is what allows a Λ\_so-adic lift of the boundary values of the Klingen family, hence a cuspidal family congruent to it.

**Prerequisites.** [`AutomorphicCongruences:L2s/semi-ordinary-weight-space`](#node-l2s-semi-ordinary-weight-space), `PadicFamilies:L0a/profinite-projector-exact`, `PadicFamilies:L0a/ordinary-part-complexes`, `AutomorphicBundles:B5/global-fj-expansion`, `AutomorphicBundles:B5/fj-injectivity`, `AutomorphicPadicLFunctions:L4/ehls-ordinary-forms-hecke`.

**Sources.**

- **CLW-v1**, Thm 2.9.1, PDF pp. 13–14; Thm 3.0.7, p. 19; Prop. 4.4.1, p. 24; Thm 4.6.1, p. 29: Freeness, control, the boundary exact sequences and the vertical control theorem for semi-ordinary forms on GU(3,1).
- **CLW-v1**, proof of Thm 8.1.1, p. 77: The fundamental exact sequence in the form used for the congruence.

<a id="node-l2s-semi-ordinary-klingen-family"></a>

#### The semi-ordinary Klingen Eisenstein family on GU(3,1)

`AutomorphicCongruences:L2s/semi-ordinary-klingen-family` (construction).

Atlas landmark: Semi-ordinary Klingen family.

**Statement.** Let π and ξ satisfy CLW §5.2: π is weight two, each π\_v is unramified, Steinberg or its unramified quadratic twist, π\_p is unramified, some nonsplit q has π\_q ramified, π is ramified at 2 if 2 is nonsplit, ρ̄\_π|G\_K is irreducible, and ξ has infinity type (0,k\_0) with k\_0 even. CLW addendum Thm 4.0.1 constructs two families E^{Kling}\_i (i=1,2) in the specified space of ♮ semi-ordinary measures tensored with Q. They use different auxiliary data, have the same unramified/U\_p eigensystem, and specialize to the semi-ordinary holomorphic Klingen series at ξτ of type (0,k), k≥6 even. Every constant term of either family is divisible by L^{Σ∪{ℓ,ℓ′}}\_{ξ,Q}L^{Σ∪{ℓ,ℓ′}}\_{π,K,ξ} in R\[1/p\], R=O\_L^{ur}\[\[Γ\_K\]\]. No integral unscaled measure or single-family unit coefficient is asserted.

**Hypotheses.**

- Use the two auxiliary data sets of CLW addendum §3, not the original simultaneous-unit choice. The weakened ℓ-tower nonvanishing and the additional finite-set avoidance there are required.
- The Siegel Eisenstein measures on unitary groups, the pullback formula and the local doubling integrals are imported from AutomorphicPadicLFunctions:L4 and L4e (Eischen–Wan's ordinary U(3,1) family is their r = 2 case); CLW's semi-ordinary sections at p, which replace Eischen–Wan's ordinary ones, and the Klingen choices are owned here.

**Proof outline.**

1. Choose the quaternion transfer and two local auxiliary data sets as in the addendum §§2–3. Its weakened nonvanishing suffices to make two selected factors units for each set, rather than all three for one set.
2. Interpolate the Siegel Eisenstein series on GU(3,3) into a measure (Thm 5.9.1) and pull back along GU(3,1) × GU(0,2) ↪ GU(3,3) against π\_D (Thm 5.5.1, doubling formula), applying e\_so (Prop. 5.10.1).
3. Use the local calculations of CLW §§5–7 and addendum Thm 4.0.1: both ♮ measure families have the same eigensystem and the specified constant-term divisibility in R\[1/p\]. CLW’s nonordinary p-sections are owned here; the ordinary local-zeta-at-p supplier does not supply them.

**Checks.**

- Shared local test data: the sections at p and the auxiliary characters are fixed before any arithmetic conclusion, and FW's general-weight family (L2/vector-valued-klingen-family) reuses them.

**Uses.**

- L2s/fourier-jacobi-primitivity: the joint ideal of the two families’ Fourier–Jacobi functional values avoids every height-one prime after inverting p
- L2s/clw-eisenstein-congruence: the congruence of E^{Kling} with a cuspidal family bounds E\_{π,ξ}
- L2/vector-valued-klingen-family: FW's general-weight analogue

**API.**

- `SemiOrdKlingen.family` (constructor): An indexed pair E\_i in the ♮ semi-ordinary measure space tensored with Q, as in CLW addendum Thm 4.0.1; no unscaled integral measure is claimed.
- `SemiOrdKlingen.specialize` (characterisation): Its value at τ is e\_so of the holomorphic Klingen Eisenstein series of weight given by ξτ (∞-type (0,k), k ≥ 6).
- `SemiOrdKlingen.constantTerm` (characterisation): For i=1,2 every constant term is divisible by L\_{ξ,Q}L\_{π,K,ξ} in R\[1/p\].
- `SemiOrdKlingen.hecke` (characterisation): E^{Kling}\_φ is an eigenvector for the unramified Hecke operators and U\_p, with eigensystem λ\_{π,ξ} defining the Eisenstein ideal E\_{π,ξ}.
- `SemiOrdKlingen.fourierJacobi` (projection): Its Fourier–Jacobi coefficients along the Klingen parabolic, valued in sections of line bundles on the boundary abelian scheme.
- `SemiOrdKlingen.sharedData` (data): Both families share π,ξ and the eigensystem; their auxiliary characters and local sections are indexed by i. A general-weight adaptation must retain that index.
- `SemiOrdKlingen.ext` (extensionality): Equality of measure-valued forms follows from all permitted cusp Fourier–Jacobi expansions; integrating a character and extracting a coefficient commute wherever the construction is defined.

**Unit tests.**

- `semiOrdKlingen_weight_range` (degenerate): The interpolation theorem asserts the convergent holomorphic construction at type (0,k) with k≥6 even. It makes no assertion of nonexistence or nonconvergence at every smaller weight.
- `semiOrdKlingen_constant_term` (characterisation): At an interpolation point of either indexed family, its standard constant term has the complex L-value factors and local normalizations of CLW (6.1.1)–(6.1.2). On the family their divisibility is in R\[1/p\], not an unproved integral measure lattice.
- `semiOrdKlingen_eigen_shape` (computation): The Galois representation of an interpolation point is ρ\_π|\_{G\_K} twisted, plus two characters: three constituents of dimensions 2, 1, 1.
- `semiOrdKlingen_not_ordinary_family` (non-example): For a supersingular π (a\_p = 0) the ordinary-projected Klingen family vanishes, while E^{Kling}\_φ does not.

**Prerequisites.** [`AutomorphicCongruences:L2s/semi-ordinary-hida-theory`](#node-l2s-semi-ordinary-hida-theory), `AutomorphicPadicLFunctions:L4e/klingen-family`, `AutomorphicPadicLFunctions:L4e/ew-siegel-eisenstein-measure`, `AutomorphicPadicLFunctions:L4e/ew-pullback-and-local-computations`, `AutomorphicPadicLFunctions:L4e/constant-term-divisibility`, `AutomorphicPadicLFunctions:L4/doubling-global-identity`, `AutomorphicPadicLFunctions:L3h/hsieh-hecke-nonvanishing`, `AutomorphicPadicLFunctions:L3h/theorem-c`.

**Sources.**

- **CLW-v1**, §5.2–5.4, p. 31; Thm 5.5.1, p. 34; Prop. 5.6.1 and §5.6, pp. 35–36; Thm 5.9.1, p. 42; Prop. 5.10.1, p. 44: Set-up, doubling formula, auxiliary choices, the p-adic Siegel measure and the semi-ordinary Klingen family.
- **CLW-v1**, §6.1, (6.1.1)–(6.1.2) and Thm 6.1.1, p. 46: Divisibility of the degenerate Fourier–Jacobi coefficients by L\_{ξ,ℚ}·L\_{π,K,ξ}.
- **CLW-addendum**, §§2–3, pp. 2–3; Thm 4.0.1, pp. 4–5: Two ♮ Klingen families with the same eigensystem and rational constant-term divisibility.

<a id="node-l2s-fourier-jacobi-primitivity"></a>

#### Joint height-one coprimality of two semi-ordinary Fourier–Jacobi families

`AutomorphicCongruences:L2s/fourier-jacobi-primitivity` (theorem).

**Statement.** For the pair E\_i of semi-ordinary-klingen-family, let J⊂R\[1/p\] be the ideal generated by all β=1 Fourier–Jacobi functional values indexed by i and the permitted (g,u) of CLW addendum Thm 4.0.1. Then J is contained in no height-one prime of R\[1/p\]. This does not assert that either single family has a unit coefficient or that J is the unit ideal. The local expansions, triple-product identities and Rallis pairings are those of CLW §7; the addendum replaces the original auxiliary-unit choice.

**Hypotheses.**

- Use precisely the two auxiliary data sets of addendum §3. Its first set makes L\_5,L\_6 units with L\_1 nonzero; its second makes L\_1,L\_5 units with L\_6 nonzero, while L\_2 remains a fixed nonzero scalar.
- Ichino's triple product formula for definite U(2) / D^× and the local triple product integrals at nonsplit places are inputs (requested from AutomorphicLFunctionsAndLocalFactors:AL.3; gap 'ichino-triple-product').

**Proof outline.**

1. The β-th Fourier–Jacobi coefficient of the Siegel Eisenstein series on GU(3,3) is a finite sum of products of Siegel Eisenstein series on U(2,2) and theta functions on the unitary Jacobi group (CLW Prop. 7.4.2; the Jacobi group and Fourier–Jacobi periods are MetaplecticAutomorphicForms:MP.6's).
2. Restrict to (N·U(2)) × U(2), pair with θ⋆ and then with h via the doubling formula; the result is a triple product integral ∫ h θ f (Props 7.6.1, 7.7.1).
3. Apply addendum Thm 4.0.1: after its finite integral coefficient extension and power map, J contains, up to units, the nonzero factors L\_{1,1} and L\_{6,2} in independent rank-one directions. They have no common height-one prime. Descend this assertion along the finite integral extension; it gives height-one avoidance for J in R\[1/p\].

**Checks.**

- For each P∤p choose one indexed family and functional whose value is not in P. This local choice, rather than a global unit from one family, is the input to the congruence proof.

**Prerequisites.** [`AutomorphicCongruences:L2s/semi-ordinary-klingen-family`](#node-l2s-semi-ordinary-klingen-family), `MetaplecticAutomorphicForms:MP.6/unitary-jacobi-group`, `MetaplecticAutomorphicForms:MP.6/fourier-jacobi-period`, `MetaplecticAutomorphicForms:MP.6/rallis-inner-product`, `MetaplecticAutomorphicForms:MP.6/theta-integral-factorization`, `AutomorphicPadicLFunctions:L3h/hsieh-hecke-nonvanishing`, `AutomorphicPadicLFunctions:L3h/theorem-b`, `AutomorphicPadicLFunctions:L3/katz-padic-l-function`, `AutomorphicLFunctionsAndLocalFactors:AL.3`.

**Sources.**

- **CLW-v1**, §7: Prop. 7.4.2 p. 57, Prop. 7.6.1 p. 61, Prop. 7.7.1 p. 64, Prop. 7.9.1 p. 67, Props 7.11.1–7.11.3 pp. 68–73, Prop. 7.12.1 p. 73: The Fourier–Jacobi computation: Jacobi-group expansion, CM family, Rallis inner products, triple product integrals at nonsplit places.
- **Wan-2020**, introduction, steps (1)–(5), pp. 5–6: The five-step pattern: Fourier–Jacobi coefficient of the Siegel series, restriction, pairing with θ⋆ and h, interpolation, Ichino's formula.
- **CLW-addendum**, §3, pp. 2–3; Thm 4.0.1 and proof, pp. 4–5: The two auxiliary choices and joint height-one coprimality, proved using independent variable directions.

**Open obligations.** ichino-triple-product. See the detailed list below.

<a id="node-l2s-clw-eisenstein-congruence"></a>

#### The CLW Eisenstein ideal is bounded by the p-adic L-functions

`AutomorphicCongruences:L2s/clw-eisenstein-congruence` (theorem).

**Statement.** Let ϕ be as in CLW Prop. 7.11.2 and E\_{π,ξ} ⊆ Ô^{ur}\_L\[\[Γ\_K\]\] the Eisenstein ideal (L0/eisenstein-ideal) of the semi-ordinary cuspidal Hecke algebra 𝕋^0\_{so,ξ,Γ\_K} for the eigensystem of E^{Kling}\_ϕ. For every height-one prime P of Ô^{ur}\_L\[\[Γ\_K\]\] with P ∩ Ô^{ur}\_L = 0, ord\_P(L^{Σ∪{ℓ,ℓ′}}\_{π,K,ξ}·L^{Σ∪{ℓ,ℓ′}}\_{ξ,ℚ}) ≤ ord\_P(E\_{π,ξ}) (CLW Thm 8.1.1).

**Hypotheses.**

- P not containing p (P ∩ Ô^{ur}\_L = 0).

**Proof outline.**

1. Fix P∤p and choose one of the two families with a Fourier–Jacobi functional value outside P (addendum Thm 5.0.1). Use the fundamental exact sequence to lift its boundary values divided by L\_{π,K,ξ}L\_{ξ,Q} modulo P^r.
2. Subtract to obtain a cuspidal family modulo P^r; its chosen functional value is a P-unit, so the congruence class is nonzero.
3. The eigensystem therefore yields E\_{π,ξ}⊂P^r locally for r=ord\_P(L·L); hence ord\_P(E\_{π,ξ})≥r. The original proof’s final ≤ sign on PDF p. 78 is reversed, while its theorem statement is correct.

**Checks.**

- The bound is height-one prime by height-one prime and excludes P ∋ p; it is one-sided.

**Prerequisites.** [`AutomorphicCongruences:L2s/semi-ordinary-hida-theory`](#node-l2s-semi-ordinary-hida-theory), [`AutomorphicCongruences:L2s/semi-ordinary-klingen-family`](#node-l2s-semi-ordinary-klingen-family), [`AutomorphicCongruences:L2s/fourier-jacobi-primitivity`](#node-l2s-fourier-jacobi-primitivity), [`AutomorphicCongruences:L0/eisenstein-ideal`](#node-l0-eisenstein-ideal).

**Sources.**

- **CLW-v1**, Thm 8.1.1 and proof, p. 77: The congruence between the semi-ordinary Klingen family and cusp forms, measured by L\_{π,K,ξ}L\_{ξ,ℚ}.
- **CLW-addendum**, Thm 5.0.1, PDF p. 6: The repaired proof of CLW Thm 8.1.1, choosing an indexed family separately at each height-one prime.

<a id="node-l2s-clw-main-divisibility"></a>

#### The Castella–Liu–Wan divisibility over the cyclotomic-localized ring

`AutomorphicCongruences:L2s/clw-main-divisibility` (theorem).

Atlas landmark: Castella–Liu–Wan divisibility.

**Statement.** Let K be imaginary quadratic, p ≥ 3 split in K, and π, ξ as in CLW §5.2. Let Γ^+\_K ⊂ Γ\_K be the rank-one ℤ\_p-submodule on which complex conjugation acts by +1 and R := O^{ur}\_L\[\[Γ\_K\]\] ⊗\_{O\_L\[\[Γ^+\_K\]\]} Frac(O\_L\[\[Γ^+\_K\]\]), the localization inverting every nonzero element of the cyclotomic coefficient subring O\_L\[\[Γ^+\_K\]\]. Then, as fractional ideals of R, (L\_{π,K,ξ}) ⊇ char\_R(X^{ur}\_{π,K,ξ} ⊗\_{A} R), where X\_{π,K,ξ} is the dual of the Selmer group of T\_{π,K,ξ} = T\_π(ε^2\_{cyc})|\_{G\_K}(ξ^{-1}) ⊗ ℤ\_p\[\[Γ\_K\]\](Ψ^{-1}\_K) with relaxed condition at p, unramified condition at p̄, and unramified conditions at every place away from p (CLW Thm 8.2.1(1)). The localization is in the cyclotomic subring; it is not the inversion of p. Here A=O\_L^{ur}\[\[Γ\_K\]\] and X^{ur} denotes extension to A first. The final tensor is over A; tensoring the A-module X again over the smaller cyclotomic subring would duplicate variables. This localization also inverts p, but inverts many additional elements.

**Hypotheses.**

- CLW §5.2; the excluded height-one primes are exactly those with P ∩ O\_L\[\[Γ^+\_K\]\] ≠ 0 (pulled back from the cyclotomic line) — in particular primes where (X\_{ξ∘Nm} ⊗ ℚ)\_P ≠ 0 may be among them.
- If X\_{π,K,ξ} is not torsion its characteristic ideal is 0 and the statement is empty.

**Proof outline.**

1. Reduce to the Σ ∪ {ℓ,ℓ′}-primitive inclusion (L0/primitive-imprimitive-comparison; JSW Thm 6.1.6 and Greenberg–Vatsal Prop. 2.4).
2. For P with P ∩ O\_L\[\[Γ^+\_K\]\] = 0, the inequality ord\_P(L) ≤ length(X\_P) follows from ord\_P(E\_{π,ξ}) ≤ length(X\_P) by L2s/clw-eisenstein-congruence (L\_{ξ,ℚ} lives in the cyclotomic variable, hence is a unit at P).
3. Set up the lattice datum (1)–(5) with ν trivial, χ = ξΨ\_K, ρ from ρ\_π, σ the pseudo-representation of the semi-ordinary Hecke algebra, I = E\_{π,ξ}A\_P; check (6)–(8) as in Wan20 and (9) by L2s/cap-exclusion; apply L0/lattice-construction (Wan20 Prop. 9.2) where ord\_P(E\_{π,ξ}) > 0 and (X\_{ξ∘Nm} ⊗ ℚ)\_P = 0.

**Checks.**

- The statement is one-sided and localized; neither torsion of X nor equality is proved here.
- Height-one primes pulled back from O\_L\[\[Γ^+\_K\]\] are not controlled: CLW cannot prove the analogue of Wan20 Lemma 9.3 with π fixed.

**Prerequisites.** [`AutomorphicCongruences:L2s/clw-eisenstein-congruence`](#node-l2s-clw-eisenstein-congruence), [`AutomorphicCongruences:L2s/cap-exclusion`](#node-l2s-cap-exclusion), [`AutomorphicCongruences:L0/lattice-construction`](#node-l0-lattice-construction), [`AutomorphicCongruences:L0/su-lattice-datum`](#node-l0-su-lattice-datum), [`AutomorphicCongruences:L0/sigma-primitive-selmer`](#node-l0-sigma-primitive-selmer), [`AutomorphicCongruences:L0/primitive-imprimitive-comparison`](#node-l0-primitive-imprimitive-comparison), `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

**Sources.**

- **CLW-v1**, Thm 8.2.1(1), p. 78; proof pp. 79–81: The divisibility over R and its proof by the lattice construction, with the explicit exclusion of cyclotomic height-one primes.
- **CLW-v1**, (1.0.1)–(1.0.2), p. 3: The Selmer group with relaxed condition at p and unramified condition at p̄.
- **CLW-addendum**, Thm 5.0.2, PDF p. 6: The main theorem’s statements remain unchanged after the repair.

<a id="node-l2s-clw-integrality-and-p-inverted"></a>

#### Integrality of the CLW p-adic L-function and the p-inverted divisibility

`AutomorphicCongruences:L2s/clw-integrality-and-p-inverted` (theorem).

**Statement.** In the setting of L2s/clw-main-divisibility: (a) if ξ\_p ≢ ξ\_p̄ modulo the maximal ideal of O\_L, then L\_{π,K,ξ} ∈ O^{ur}\_L\[\[Γ\_K\]\]; (b) if moreover ξ|\_{𝔸\_ℚ^×} = ω² (ω the Teichmüller character) with k\_0 ≡ 0 mod 2(p − 1), the local base-change root number ε\_v(1/2, BC(π) × ξ\_0) equals 1 at every finite place v nonsplit in K, and the conductor of ξ is divisible only by primes split in K, then (L\_{π,K,ξ}) ⊇ char\_{O^{ur}\_L\[\[Γ\_K\]\] ⊗ ℚ}(X\_{π,K,ξ} ⊗ ℚ) (CLW Thm 8.2.1(2)): the containment holds after inverting p, without the cyclotomic localization. This is the source-qualified input that RankZeroOneBSD:BSD.6a imports for its supersingular branch; it is not a nonordinary equality.

**Hypotheses.**

- (a) needs residual distinctness ξ\_p ≢ ξ\_p̄, which gives (irred) and (dist) for the CM form σ\_ξ.
- (b) adds the four listed conditions; the containment is only after ⊗ ℚ.

**Proof outline.**

1. (a): as in Wan20 §7E, build L^{Hida}\_{π,K,ξ} as the product of Hida's Rankin–Selberg p-adic L-function for the ordinary CM family g through σ\_ξ and the newform f, and Katz's p-adic L-function on the line interpolating values at 1; only the ordinarity of g is used.
2. Use the CM-theta comparison contract of L0/hida-tilouine-anticyclotomic: CLW p. 81 invokes HT93 Thm 7.1 and (8.8b), Hid91 Lemma 5.3(vi), and HT93/HT94/Hid06. Their exact integral congruence-ideal/Katz dictionary remains hida-tilouine-not-read; no general CM-field theorem is asserted here.
3. (b): Hsieh's vanishing of the anticyclotomic µ-invariant shows L\_{π,K,ξ} lies in no height-one prime pulled back from O\_L\[\[Γ^+\_K\]\] other than possibly (p), so combining with L2s/clw-main-divisibility the excluded primes contribute nothing after inverting p.

**Checks.**

- RT-AREA-iwasawa-1/25: the µ = 0 input is AutomorphicPadicLFunctions:L3h's Theorem B; RT-AREA-iwasawa-1/26: the integrality rests on Hida's Rankin–Selberg family p-adic L-function and the Hida–Tilouine main conjecture, both recorded with their owners.

**Prerequisites.** [`AutomorphicCongruences:L2s/clw-main-divisibility`](#node-l2s-clw-main-divisibility), [`AutomorphicCongruences:L0/hida-tilouine-anticyclotomic`](#node-l0-hida-tilouine-anticyclotomic), `AutomorphicPadicLFunctions:L3h/theorem-b`, `AutomorphicPadicLFunctions:L3h/theorem-a`, `AutomorphicPadicLFunctions:L3/katz-padic-l-function`, `AutomorphicPadicLFunctions:L3/katz-hida-tilouine-tame`, `AutomorphicPadicLFunctions:L3`.

**Sources.**

- **CLW-v1**, Thm 8.2.1(2), p. 78; proof of (2), p. 81: Integrality via L^{Hida}, Hida–Tilouine and Hida's anticyclotomic main conjecture, and the second containment from Hsieh's µ = 0.
- **Wan-2020**, Thm 1.1, pp. 2–3: Wan's three-variable theorem under conditions (a)–(g), with L^{Hida} integral when g\_ξ satisfies (dist) and (irred).
- **CLW-addendum**, Thm 5.0.2, PDF p. 6: The integrality and main-divisibility statements survive the two-family correction.

**Open obligations.** hida-tilouine-not-read. See the detailed list below.

<a id="layer-l2"></a>

### Layer L2: General-weight GU(3,1) and the FW seed points

This layer extends the semi-ordinary control and Fourier–Jacobi comparison to general weight, and connects the Greenberg and Beilinson–Flach formulations. Its ordinary and crystalline seed targets retain the unramified-regulator, analytic control, integral Kato-witness and general-weight nonvanishing-repair obligations. Their propagation to L4 does not close those proof inputs.

<a id="node-l2-general-weight-semi-ordinary-control"></a>

#### Semi-ordinary Hida theory on GU(3,1) in general weight

`AutomorphicCongruences:L2/general-weight-semi-ordinary-control` (theorem).

**Statement.** For f a normalized cuspidal eigenform of even weight k ≥ 2 and the vector-valued semi-ordinary forms on GU(3,1) of weight k = (a\_1, a\_2, a\_3; b\_1) in the family set X\_ρ of Fouquet–Wan: the semi-ordinary parts e\_α·V\_k(K\_0(p,p^n)) are p-divisible with uniformly bounded classical dimensions (Props 7.9–7.10); for each weight k = (a\_1, a\_2, a\_3; b\_1) ∈ X\_ρ there is A(a) such that, for b\_1 large compared with A(a), the restriction e\_α M\_k(K\_0(p), O) ⊗ ℚ\_p/ℤ\_p → e\_α·V\_k(K\_0(p)) is an isomorphism (FW Thm 7.11); for q = 0 or ∅ the Λ̃-adic families V^q\_so are free of finite rank and M^q\_so(K, Λ̃) ⊗ Λ̃/P\_k ≅ e\_α M^q\_k(K, O) at such weights (Thm 7.12), with Thm 7.15 and the weight-k boundary sequence of Thm 7.17; and the short sequence of cusp forms, forms and boundary forms is exact (Thm 7.18). These extend L2s/semi-ordinary-hida-theory (CLW, weight two) to general weight and are the only new Hida-theoretic input L2 owns.

**Hypotheses.**

- Weights in FW's set X\_ρ; level K\_0(p, p^n); the unitary Shimura data and Igusa varieties as in FW §7.3.1–7.3.3, imported from AutomorphicPadicLFunctions:L4.
- Fix ρ=(a\_1,a\_2). The full torus algebra has four variables; the fixed-ρ family varies (a\_3,b\_1). Thm 7.11 requires b\_1>A(a,n); Thm 7.12 identifies classical specializations only in its sufficiently regular range.
- Prop. 7.13 additionally assumes ρ̄\_f|G\_Qp irreducible, a\_1=a\_2=0, a\_3≡b\_1≡0 mod p−1, and a\_2−a\_3 and a\_3+b\_1 sufficiently large; its conclusion gives the required unramified principal-series points.

**Proof outline.**

1. Vertical control for the vector-valued sheaves (FW Props 7.5, 7.7–7.10) following CLW §§3–4.
2. Uniform boundedness of dimensions and classicality (Thm 7.11, Prop. 7.13).
3. Freeness and the boundary exact sequence (Thms 7.12, 7.15, 7.17, 7.18), with the Siegel operators of L2s.

**Checks.**

- RT-AREA-iwasawa-1/24: L2 imports CLW's weight-two semi-ordinary Hida theory from L2s and adds only FW §7.3's general-weight control.

**Prerequisites.** [`AutomorphicCongruences:L2s/semi-ordinary-hida-theory`](#node-l2s-semi-ordinary-hida-theory), [`AutomorphicCongruences:L2s/semi-ordinary-weight-space`](#node-l2s-semi-ordinary-weight-space), `AutomorphicPadicLFunctions:L4/ehls-ordinary-forms-hecke`, `PadicFamilies:L0a/profinite-projector-exact`.

**Sources.**

- **FW-v3**, §7.3.4–7.3.5: Props 7.5, 7.7–7.10, Thms 7.11, 7.12, Prop. 7.13, Thms 7.15, 7.17, 7.18, pp. 83–88: Semi-ordinary forms and control theorems on GU(3,1) for general weight.
- **FW-v3**, §7.1, p. 80: The Hida theory of CLW §§2–4 (with its fundamental exact sequence) is the input; §7.3 develops what is needed in general weight.

<a id="node-l2-klz-beilinson-flach-classes"></a>

#### Λ-adic Beilinson–Flach classes for a Hida family and the CM family

`AutomorphicCongruences:L2/klz-beilinson-flach-classes` (construction).

Atlas landmark: Beilinson–Flach classes.

**Statement.** Let 𝐟 be a Hida family with coefficient ring 𝕀 and g the canonical CM Hida family of K (with T\_g ≅ Ind^ℚ\_K ℤ\_p\[\[Γ\_p\]\]). The Kings–Loeffler–Zerbes Beilinson–Flach class BF\_{𝐟,g} ∈ H¹(ℚ, T\_𝐟 ⊗̂ T\_g ⊗̂ Λ\_Γ), obtained from Rankin–Eisenstein classes on products of modular curves (diagonal pushforward of Eisenstein classes, Siegel units) with tame and p-power norm relations, defines through Shapiro's lemma a class BF ∈ H¹(K, T) and, after the twist tw\_{Θ^{-1}}, a class BF† ∈ Sel^{Gr,∅}(K, T†) (Greenberg condition at one prime above p, relaxed at the other) over 𝕀\[\[Γ\_K\]\] (CW Thm 3.6, from KLZ17 Def. 8.1.1 with m = 1 and LLZ14 Lemma 6.8.9 to remove the auxiliary c; membership in the Selmer group by KLZ17 Prop. 8.1.7). Specializations at weight-k points give the classes used in FW §4.4 and §4.8.

**Hypotheses.**

- 𝐟 an ordinary Hida family (or a point of weight k in the crystalline setting of FW §4.4 via analytic families of Beilinson–Flach elements); p split in K.
- KLZ17 and LLZ14 were not read for this packet: the construction is stated through CW Thm 3.6 and FW §4.4 (gap 'klz-not-read').

**Proof outline.**

1. Rankin–Eisenstein classes: pushforward along the diagonal Y\_1(N) → Y\_1(N)² of Eisenstein classes (from Siegel units, KatoEulerSystems:L0), with the étale realization and the moment maps.
2. Norm relations in the tame and p-power directions give a Λ-adic class over the tower (KLZ).
3. Specialize the second family to the canonical CM family g and apply Shapiro to obtain BF ∈ H¹(K, T); twist by Θ^{-1}.

**Checks.**

- RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity specializes the same KLZ classes to weight two in its Eisenstein branch; the general Hida-family construction is planned here (stage L2's own target).

**Uses.**

- L2/bf-explicit-reciprocity: the Coleman images of loc\_p(BF†) are the two Rankin–Selberg p-adic L-functions
- L2/castella-wan-equivalence: BF† generates the rank-one Selmer module in the Beilinson–Flach main conjecture
- L2/fw-crystalline-main-conjecture: the analytic families of Beilinson–Flach elements in FW §4.4–4.6
- RankZeroOneBSD:BSD.7a/beilinson-flach-integral-reciprocity: its weight-two Eisenstein specialization

**API.**

- `BF.lambdaAdic` (constructor): BF\_{𝐟,g} ∈ H¹(ℚ, T\_𝐟 ⊗̂ T\_g ⊗̂ Λ\_Γ).
- `BF.overK` (equivalence): Shapiro identifies BF\_{𝐟,g} with BF ∈ H¹(K, T), T = T\_𝐟 ⊗ 𝕀\[\[Γ\_K\]\]-coinduced.
- `BF.twisted` (data): BF† = tw\_{Θ^{-1}}(BF) ∈ H¹(K, T†).
- `BF.mem_selmer` (characterisation): BF† belongs to Sel^{Gr,∅}: Greenberg at p, relaxed at p̄, and the specified unramified conditions away from p (CW Thm 3.6).
- `BF.normRelation` (characterisation): Tame norm relations with Euler factors P\_ℓ(Frob\_ℓ^{-1}) and p-power norm compatibility.
- `BF.specialize` (functoriality): Specialization along arithmetic points of 𝕀 and of Γ\_K commutes with Shapiro and the twist.
- `BF.loc_nontorsion` (characterisation): loc\_v(BF†) is non-torsion over 𝕀\[\[Γ\_K\]\] for each v | p (CW Thm 3.6, last sentence).
- `BF.ext` (extensionality): Under Shapiro and the critical-twist isomorphism two BF classes are equal iff their inverse images are equal; the distinguished class includes its norm-compatible construction, not just its local images.

**Unit tests.**

- `bf_rank_one_specialization` (computation): The universal class satisfies both Coleman reciprocity identities in their specified fractional congruence-ideal targets. Specialization commutes wherever defined; a specialized L-value may vanish, so no fixed weight-two/trivial-character value is required to be nonzero.
- `bf_selmer_condition` (characterisation): loc\_{v\_0}(BF†) satisfies the Greenberg condition, while loc\_{v̄\_0}(BF†) is unrestricted (relaxed).
- `bf_not_kato` (non-example): Kato's zeta element of f alone (KatoEulerSystems:L2) is a class for T\_f over ℚ\_∞, not for T\_𝐟 ⊗ T\_g over the two-variable tower; replacing BF by Kato's class fails BF.overK.
- `bf_cm_family_shapiro` (agreement): With g the canonical CM family, T\_g ≅ Ind^ℚ\_K ℤ\_p\[\[Γ\_p\]\] (BST19), and Shapiro gives the identification BF.overK used by Castella–Wan.

**Prerequisites.** `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`, `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`, `PadicFamilies:L4/ordinary-big-galois-representation`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/universal-norms-unramified`.

**Sources.**

- **CW-v1**, Thm 3.6 and its proof, p. 15: The class BF† ∈ Sel^{Gr,∅}(K,T†) from KLZ17 Def. 8.1.1 (m = 1), LLZ14 Lemma 6.8.9 and the CM family via BST19 and Shapiro.
- **FW-v3**, §4.4 (Prop. 4.22, §4.4.2), pp. 49–51: Hida families of CM representations and analytic families of Beilinson–Flach elements used in the crystalline case.

**Open obligations.** klz-not-read; hida-representation-conventions. See the detailed list below.

<a id="node-l2-unramified-exponential-boundedness"></a>

#### Boundedness of the Bloch–Kato exponential along unramified extensions

`AutomorphicCongruences:L2/unramified-exponential-boundedness` (theorem).

**Statement.** Under FW Assumption 4.1 (short crystalline V with irreducible residual representation) and for a chosen lattice T, Prop. 4.12 gives a fixed m such that exp(W(F̄\_p)·ω\_V)⊂p^{-m}H¹(I\_p,T). Cor. 4.13 gives its Yager-module description after the unramified twist ρ(Frob)=1+x with v\_p(x)>0. In Cor. 4.14 assume every unramified specialization V′ satisfies D\_crys(V′)^{φ=1}=0. The exponential line is then a rank-one direct summand after inverting p; after a fixed rescaling b∈E^× it determines the saturated integral local line. The raw exponential is not asserted integral. Keep the constants b\_p,d\_p of Def. 4.15 in subsequent comparisons. The Yager and unramified-by-cyclotomic regulator construction is requested through GH.7’s local Part II checkpoint; it is not already implemented there.

**Hypotheses.**

- FW Assumption 4.1, the unramified twist of Cor. 4.13, and the φ=1 exclusion at every unramified specialization in Cor. 4.14.
- The separate local Part II Yager/regulator supplier must be supplied; GH.7 currently records a checkpoint/request for it.

**Proof outline.**

1. Use the integral short-crystalline comparison to prove the uniform denominator bound of Prop. 4.12.
2. Use the requested Yager module to compute the unramified-family exponential as in §4.2.2–4.2.3.
3. Under the φ=1 exclusion prove the rational direct-summand assertion of Cor. 4.14, then choose the fixed rescaling and saturated integral line of Def. 4.15.

**Checks.**

- RT-AREA-iwasawa-1/27 is an ownership checkpoint: GH.7 requests a local regulator Part II. AC owns the FW boundedness/application, not a duplicate generic Yager theory.

**Prerequisites.** `GeneralizedHeegnerCycles:GH.7/yager-unramified-checkpoint`, `SelmerIwasawaCohomology:L4/fontaine-laffaille-comparison`, `SelmerIwasawaCohomology:L4/integral-finite-comparison`.

**Sources.**

- **FW-v3**, §4.2.1 Prop. 4.12, p. 43; §4.2.2 (Yager modules after Loeffler–Zerbes §3.2), p. 43; §4.2.3 Cors 4.13–4.14, pp. 44–45: Boundedness of the exponential map along the unramified family and the integral local subspace replacing the ± theory.
- **FW-v3**, §1.2.1, pp. 11–12: The integral local theory along the line unramified at v\_0 replaces a two-variable ± theory.

**Open obligations.** unramified-regulator-supplier. See the detailed list below.

<a id="node-l2-vector-valued-klingen-family"></a>

#### The vector-valued Klingen Eisenstein family and the Greenberg p-adic L-function

`AutomorphicCongruences:L2/vector-valued-klingen-family` (theorem).

**Statement.** Let π = π\_f be the unitary automorphic representation of a weight-k form f and Σ a finite set containing the bad primes. (i) There is L^Σ\_{f,K,ξ\_0} ∈ Λ\_{K,O^{ur}} ⊗ ℚ\_p interpolating, at characters ξ\_φ of Γ\_K that are avatars of Hecke characters of conductor p and infinity type (κ\_φ/2 + m\_φ, −κ\_φ/2 − m\_φ) with κ\_φ ≥ 6 even and m\_φ ≥ (k−2)/2, the values L^Σ(π̃, ξ\_φ, (κ\_φ − 1)/2) times the stated periods and local factors (FW Prop. 7.19(i), from Eischen–Wan Thm 1.2); (ii) there is a family of formal q-expansions E\_{f,ξ\_0} whose specializations at a Zariski-dense set of arithmetic points are the Fourier–Jacobi expansions of the highest weight vectors of the holomorphic vector-valued Klingen Eisenstein series on GU(3,1) built by the pullback formula, eigen for U\_{t+} with nonzero eigenvalue (Prop. 7.19(ii)); (iii) the constant terms a\_{t,\[g\]}(0) are divisible by L^Σ\_{f,K,ξ\_0}·L^Σ\_{τ̄′} (Prop. 7.19(iii)). After the reparametrization t^{-c}\_{ξ′\_0}, L^{Gr,Σ}\_{f,K} := t^{-c}\_{ξ′\_0}(L\_{f,K,ξ\_0}) is the Greenberg Rankin–Selberg p-adic L-function, it equals L^{Hida}\_{f⊗g}·L^{Katz}\_K·h\_K (FW Cor. 7.21, L2/greenberg-function-factorization) and lies in O^{ur}\[\[Γ\_K\]\] (FW Lemma 7.22). The multiplier in Prop. 7.19(i) is Ω\_p^{4m+2κ}/Ω\_∞^{4m+2κ} · c′\_φ · p^{κ−3} · g(ξ\_{φ,2})² · ∏\_{i=1}²(χ\_i^{-1}ξ\_{φ,2}^{-1})(p), where Lemma 7.20 gives c′\_φ=Γ(κ+m−k/2)Γ(κ+m+k/2−1)2^{−3κ−4m+1}π^{1−2κ−2m}i^{k−κ−2m−1}. The highest weight is (m+(k−2)/2,m−(k−2)/2,0;κ); after reparametrization it is ((k−2)/2,−(k−2)/2,−m;κ+m).

**Hypotheses.**

- Eischen–Wan's distinct-Satake-parameter assumption is unnecessary in the U(2) case (FW remark after Prop. 7.19).
- The Klingen family of Eischen–Wan (AutomorphicPadicLFunctions:L4e) is the analytic carrier; FW's reparametrization, the Ikeda-type archimedean factorization and the integrality are owned here.

**Proof outline.**

1. Translate Eischen–Wan Thm 1.2 to the semi-ordinary GU(3,1) setting with the shared local data of L2s/semi-ordinary-klingen-family (FW Prop. 7.19).
2. Reparametrize by t^{-c}\_{ξ′\_0} (γ′ ↦ γ′ξ′\_0(γ′)^{-1}, then γ′ ↦ γ′^{-c}).
3. Apply FW Lemma 7.22 with its two independent denominator bounds: one supported at p and the explicit Euler factors and one in the CM-family variable. Prove that these supports are disjoint using that lemma; a nonzero rational scalar alone does not prove integrality.

**Checks.**

- Only the vector-valued, general-weight construction is new here; the weight-two scalar family is L2s's.

**Prerequisites.** [`AutomorphicCongruences:L2s/semi-ordinary-klingen-family`](#node-l2s-semi-ordinary-klingen-family), [`AutomorphicCongruences:L2/general-weight-semi-ordinary-control`](#node-l2-general-weight-semi-ordinary-control), `AutomorphicPadicLFunctions:L4e/klingen-family`, `AutomorphicPadicLFunctions:L4e/ew-padic-l-function`, `AutomorphicPadicLFunctions:L4e/constant-term-divisibility`, `AutomorphicPadicLFunctions:L4/archimedean-zeta-integral`.

**Sources.**

- **FW-v3**, Prop. 7.19 and the reparametrization after it, p. 88; Cor. 7.21 and Lemma 7.22, p. 89: The Klingen family on U(3,1), its constant terms divisible by the Rankin–Selberg and Dirichlet p-adic L-functions, the factorization and the integrality.
- **FW-v3**, Lemma 7.20 and Cor. 7.21, PDF p. 89: The gamma, power-of-two, π and i factors and the change of highest weight.

<a id="node-l2-bf-explicit-reciprocity"></a>

#### Explicit reciprocity for Beilinson–Flach classes

`AutomorphicCongruences:L2/bf-explicit-reciprocity` (theorem).

**Statement.** Over I\[\[Γ\_K\]\], CW Thm 3.6 gives injections with pseudo-null cokernel Col^{(1),†}:H¹(K\_p̄,F^-T†)→I\_f⊗\_I I\[\[Γ\_K\]\] and Col^{(2),†}:H¹(K\_p,F^+T†)→I\_g⊗̂\_Zp I\[\[Γ\_K\]\]. Their images on loc\_p̄(BF†) and loc\_p(BF†) are respectively tw\_{Θ^{-1}}L\_p(f,g) and tw\_{Θ^{-1}}L\_p(g,f). The targets I\_f and I\_g are the specified fractional congruence ideals, not units that may be silently discarded. The maps are obtained by pairing the family Perrin–Riou logarithm with η\_f⊗ω\_g and η\_g⊗ω\_f. Each universal localization of BF† is non-torsion; this does not require every arithmetic specialization to be nonzero.

**Hypotheses.**

- As in L2/klz-beilinson-flach-classes; the big logarithm in families is imported.

**Proof outline.**

1. Construct Col^{(i)} by pairing the Perrin-Riou big logarithm of the graded pieces F^∓ with the differentials η, ω (PadicFamilies:L4/family-big-logarithm, PadicHodgeRegulators:L3/crystalline-regulator).
2. Use KLZ reciprocity through CW Thm 3.6 in the two different local groups just specified, preserving the congruence-ideal factors and critical twist. The original KLZ construction remains the explicit klz-not-read gap.
3. Injectivity with pseudo-null cokernel from the structure of local Iwasawa cohomology of rank-one graded pieces.

**Checks.**

- Weight moments: specializing at weight-k points gives the reciprocity laws FW uses in §4.4–4.6 for the analytic families.

**Prerequisites.** [`AutomorphicCongruences:L2/klz-beilinson-flach-classes`](#node-l2-klz-beilinson-flach-classes), `PadicFamilies:L4/family-big-logarithm`, `PadicHodgeRegulators:L3/crystalline-regulator`, `PadicHodgeRegulators:L3/explicit-reciprocity`.

**Sources.**

- **CW-v1**, Thm 3.6 and proof, p. 15: The Coleman maps and the explicit reciprocity law of KLZ17 Thm 10.2.2 for BF†.
- **FW-v3**, §4.4.2 and §4.5, pp. 51–57: Analytic families of Beilinson–Flach elements, Selmer complexes and Rankin–Selberg p-adic L-functions.

**Open obligations.** klz-not-read. See the detailed list below.

<a id="node-l2-greenberg-function-factorization"></a>

#### Factorization of the Greenberg function into Hida and Katz factors

`AutomorphicCongruences:L2/greenberg-function-factorization` (comparison).

**Statement.** With the normalizations of FW §4.5.2 and Appendix B, the Greenberg Rankin–Selberg p-adic L-function of f over K factors as L^{Gr}\_K(f) = L^{Hida}\_{f⊗g}·L^{Katz}\_K·h\_K, where L^{Hida}\_{f⊗g} is Hida's Rankin–Selberg p-adic L-function of f against the canonical CM Hida family g, L^{Katz}\_K is Katz's p-adic L-function of K restricted to the relevant line and h\_K the class number factor (FW Cor. 7.21, with Prop. 4.35 for the Katz normalization). The factorization is an identity in Frac(O^{ur}\[\[Γ\_K\]\]) obtained by comparing interpolation formulas on a Zariski-dense set; it carries the class-number, period and local factors explicitly and is not routed to L5a.

**Hypotheses.**

- Interpolation formulas of FW Prop. 7.19 and Prop. 4.35 on both sides; the set of comparison points is Zariski dense.

**Proof outline.**

1. Compare interpolation formulas at the arithmetic points of Prop. 7.19 using the doubling interpolation on one side and Hida's Rankin–Selberg plus Katz's interpolation on the other (FW Lemma before Cor. 7.21).
2. Density of the comparison points and the Weierstrass preparation in O^{ur}\[\[Γ\_K\]\] give the identity.

**Checks.**

- Requested by RankZeroOneBSD:BSD.6a (castella-higher-weight-input) together with FW Thm 4.41; the erratum's citation of a corollary in another paper does not apply.

**Prerequisites.** [`AutomorphicCongruences:L2/vector-valued-klingen-family`](#node-l2-vector-valued-klingen-family), `AutomorphicPadicLFunctions:L3/katz-padic-l-function`, `AutomorphicPadicLFunctions:L3`.

**Sources.**

- **FW-v3**, Cor. 7.21 and the lemma before it, p. 89; Prop. 4.35, p. 57: L^{Hida}\_{f⊗g}·L^{Katz}\_K h\_K = L^{Gr}\_K(f), from the interpolation formulas.

<a id="node-l2-fw-fourier-jacobi-unit"></a>

#### General-weight Fourier–Jacobi comparison and its auxiliary repair contract

`AutomorphicCongruences:L2/fw-fourier-jacobi-unit` (theorem).

**Statement.** Conditional original formula: with the auxiliary data of FW Prop. 7.29, if L\_1,L\_5,L\_6 are simultaneously units and L\_2 is a fixed nonzero scalar, FJ\_{h,β,θ⋆}(E^{Kling}) is a unit times an element of Q̄\_p^×. This only excludes height-one primes away from p. Together with Thm 7.18, the original argument yields ord\_P(L^{Gr,Σ}\_{f,K})≤ord\_P(𝔈\_D) for the admissible P≠(p) of Lemma 7.31. The cited auxiliary nonvanishing no longer proves the simultaneous-unit hypothesis: the CLW addendum replaces it in weight two by two families whose functional values jointly avoid every height-one prime of R\[1/p\]. A vector-valued, general-weight version of that repair is required here; it is an explicit gap, not a consequence of the scalar weight-two theorem.

**Hypotheses.**

- The local Fourier–Jacobi and triple-product identities of FW §7.4, including all normalizations. The original simultaneous-unit choice is a conditional hypothesis only. The weakened auxiliary ℓ-tower nonvanishing must instead be used in a general-weight version of the CLW two-family argument.
- When π\_ℓ is supercuspidal the local computation of FW Prop. 7.27 / Cor. 7.28 is used, which removes the squarefree-conductor assumption of earlier work.

**Proof outline.**

1. Express the Fourier–Jacobi coefficient of the Siegel series as finite sums of products of Eisenstein series and theta functions on the Jacobi group containing U(2,2) (FW Lemma 7.26, after Ikeda); factor out the archimedean integrals by a conceptual argument instead of computing them (FW §1.2.1 outline).
2. Ichino's formula evaluates the resulting triple product as L\_3L\_4 times Rallis inner products (interpolated by L\_3, L\_4) and local integrals; the ratio to L\_1L\_2L\_5L\_6 is a fixed nonzero constant (FW Prop. 7.29). This evaluation does not by itself establish the simultaneous-unit choice.
3. Adapt CLW addendum Thms 4.0.1 and 5.0.1 to the vector-valued family and its archimedean functional. Prove that the two auxiliary values have independent variable supports and their joint ideal avoids height-one primes after inverting p. Only after that missing step may the congruence argument establish Lemma 7.31 unconditionally in this plan.

**Checks.**

- Scalar versus vector-valued: the vector-valued computation is FW's addition over L2s/fourier-jacobi-primitivity.

**Prerequisites.** [`AutomorphicCongruences:L2/vector-valued-klingen-family`](#node-l2-vector-valued-klingen-family), [`AutomorphicCongruences:L2/general-weight-semi-ordinary-control`](#node-l2-general-weight-semi-ordinary-control), [`AutomorphicCongruences:L2s/fourier-jacobi-primitivity`](#node-l2s-fourier-jacobi-primitivity), [`AutomorphicCongruences:L0/eisenstein-ideal`](#node-l0-eisenstein-ideal), `MetaplecticAutomorphicForms:MP.6/fourier-jacobi-period`, `MetaplecticAutomorphicForms:MP.6/fourier-jacobi-extraction`, `MetaplecticAutomorphicForms:MP.6/rallis-inner-product`, `AutomorphicLFunctionsAndLocalFactors:AL.3`, `AutomorphicPadicLFunctions:L3h/hsieh-hecke-nonvanishing`.

**Sources.**

- **FW-v3**, §7.4.2, Props 7.27, Cor. 7.28, Prop. 7.29, Def. 7.30, Lemma 7.31, pp. 90–96: The Fourier–Jacobi functional is a unit up to a constant, and the resulting bound of the Eisenstein ideal by L^{Gr}.
- **FW-v3**, §1.2.1, p. 11: Ikeda's theory and Ichino's triple product formula give a Fourier–Jacobi coefficient prime to the p-adic L-function.
- **CLW-addendum**, §1, p. 1; Thms 4.0.1 and 5.0.1, pp. 4–6: The weakened nonvanishing and the weight-two two-family repair; no general-weight extension is asserted in this addendum.

**Open obligations.** ichino-triple-product; general-weight-nonvanishing-repair. See the detailed list below.

<a id="node-l2-exceptional-height-one-primes"></a>

#### Removing the excluded height-one primes

`AutomorphicCongruences:L2/exceptional-height-one-primes` (theorem).

**Statement.** Let L ∈ O^{ur}\[\[Γ\_K\]\] be L^{Gr}\_K(f) (or Wan's L\_{f,K,ξ}). If the anticyclotomic restriction of L has vanishing µ-invariant — which holds when every prime ℓ | N nonsplit in K is ramified in K with π\_ℓ the appropriately twisted Steinberg representation and the residual and conductor hypotheses of Hsieh's Theorem B are met — then L lies in no height-one prime of O^{ur}\[\[Γ\_K\]\] of the form Q·O^{ur}\[\[Γ\_K\]\] with Q a height-one prime of O\[\[Γ^+\]\]; hence it is prime to the cyclotomic Dirichlet factor L^Σ\_{τ̄′} of the constant terms, and a divisibility proved up to those pulled-back primes extends over them (any independent p-power ambiguity must also be removed). For a Hida family, Wan20 Lemma 9.3 gives the same conclusion; for a single form outside the µ = 0 range the exceptional primes remain excluded.

**Hypotheses.**

- Hypotheses of AutomorphicPadicLFunctions:L3h/theorem-b (Hsieh's µ = 0) for the anticyclotomic specialization; the auxiliary-field choice of L2/auxiliary-field-selection must preserve them (no nonsplit-prime or minimality condition dropped).
- The CLW addendum weakens the auxiliary ℓ-tower nonvanishing used for Fourier–Jacobi choices, not Hsieh’s p-tower µ=0 theorem. Do not replace one by the other.

**Proof outline.**

1. Write L = Σ a\_i (γ^- − 1)^i with a\_i ∈ O^{ur}\[\[Γ^+\]\]; L ∈ Q·O^{ur}\[\[Γ\_K\]\] iff every a\_i ∈ Q.
2. Specialize at the trivial character of Γ^+ (or at a weight point): the anticyclotomic function has µ = 0, so some a\_i is a unit there, so not all a\_i lie in Q (the argument of SU Prop. 12.3.6, with Hsieh in place of Vatsal).
3. The Dirichlet factor lives in the cyclotomic variable, so it is a product of pulled-back primes and is coprime to L.

**Checks.**

- Test: an excluded height-one prime pulled back from O\[\[Γ^+\]\] at which the Dirichlet factor vanishes is not claimed for L unless the µ = 0 hypothesis holds.

**Prerequisites.** `AutomorphicPadicLFunctions:L3h/theorem-b`, `AutomorphicPadicLFunctions:L3h/theorem-a`, [`AutomorphicCongruences:L2/vector-valued-klingen-family`](#node-l2-vector-valued-klingen-family).

**Sources.**

- **FW-v3**, proof of Thm 7.32, last paragraph, p. 97: The Steinberg-twist assumption lets Fouquet–Wan apply the vanishing of the anticyclotomic µ-invariant, so L is in no height-one prime of O\[\[Γ^+\]\].
- **CLW-v1**, proof of Thm 8.2.1(1), p. 81: In Wan20 such primes need not be excluded thanks to Lemma 9.3 and Hsieh; with π fixed CLW cannot prove the analogue.

<a id="node-l2-castella-wan-equivalence"></a>

#### Greenberg and Beilinson–Flach main conjectures over K are equivalent

`AutomorphicCongruences:L2/castella-wan-equivalence` (theorem).

**Statement.** Let 𝐟 be a Hida family with ρ\_𝐟|\_{G\_K} irreducible. The following are equivalent, up to powers of p: (i) X^{Gr,0}(K\_∞, A†\_𝐟) is 𝕀\[\[Γ\_K\]\]-torsion, Sel^{Gr,∅}(K, T†) has rank one, and char(X^{Gr,0}) = char(Sel^{Gr,∅}(K,T†)/𝕀\[\[Γ\_K\]\]·BF†); (ii) X^{∅,0}(K\_∞, A†\_𝐟) and Sel^{0,∅}(K, T†) are torsion and char(X^{∅,0})·𝕀^{ur}\[\[Γ\_K\]\] = (tw\_{Θ^{-1}}(L\_p(𝐟/K))) (CW Thm 3.8). The same argument holds for a weight-k specialization with the Greenberg main conjecture supplied by L2/fw-greenberg-divisibility in place of the weight-two input (FW §4.8). Each divisibility direction in (ii) corresponds to the same direction in (i).

**Hypotheses.**

- ρ\_𝐟|\_{G\_K} irreducible; the comparison is up to powers of p, so it does not by itself remove a power of p.

**Proof outline.**

1. The two Poitou–Tate four-term exact sequences for the Selmer structures (Gr,∅) ⊃ (Gr,0) and (∅,∅) ⊃ (∅,0) relate the four modules; the Coleman maps of L2/bf-explicit-reciprocity identify the local terms with the p-adic L-functions.
2. Rank and torsion statements are proved before any cancellation: loc\_v(BF†) is non-torsion, so Sel^{Gr,∅} has rank one when X^{Gr,0} is torsion.
3. Multiplicativity of characteristic ideals along the exact sequences gives the equivalence, with pseudo-null cokernels absorbed.

**Checks.**

- Integrality is not claimed: the p-power ambiguity is removed only in L2/fw-ordinary-reverse-bound, using Kato's bound and the §4.6.3-type argument.

**Prerequisites.** [`AutomorphicCongruences:L2/bf-explicit-reciprocity`](#node-l2-bf-explicit-reciprocity), [`AutomorphicCongruences:L2/klz-beilinson-flach-classes`](#node-l2-klz-beilinson-flach-classes), `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-poitou-tate-sequence`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

**Sources.**

- **CW-v1**, Thm 3.8, p. 16: The equivalence of the Beilinson–Flach and Greenberg two-variable main conjectures over K, up to powers of p.
- **FW-v3**, §4.8, p. 68: The argument goes through in general weight by replacing Greenberg's main conjecture there by Thm 7.32.

<a id="node-l2-fw-greenberg-divisibility"></a>

#### Fouquet–Wan's GU(3,1) divisibility for the Greenberg main conjecture

`AutomorphicCongruences:L2/fw-greenberg-divisibility` (theorem).

Atlas landmark: Fouquet–Wan GU(3,1) divisibility.

**Statement.** Let f be a normalized cuspidal eigenform of even weight k, trivial character and conductor N prime to p, such that either ρ̄\_f|\_{G\_{ℚ\_p}} is absolutely irreducible or f is ordinary at p; suppose every prime q | N nonsplit in K satisfies q ∥ N and there is at least one such q, that 2 ∥ N if 2 is nonsplit in K, and that ρ̄\_f is absolutely irreducible over G\_K. Then char\_{O^{ur}\[\[Γ\_K\]\]}(X^{Gr}\_K(f) ⊗\_O O^{ur}) ⊆ (L^{Gr}\_K(f)) up to height-one primes pulled back from O\[\[Γ^+\]\]; if moreover every ℓ | N nonsplit in K is ramified in K with π\_ℓ the Steinberg representation twisted by the unramified character sending ℓ to −ℓ^{k/2−1}, the whole containment holds (FW Thm 7.32 = Thm 4.41 = Thm 1.12). Here X^{Gr}\_K(f) is the dual of the Greenberg Rankin–Selberg Selmer group (FW Def. 4.39: Greenberg condition at v\_0, strict at v̄\_0, unramified-quotient conditions away from p).

**Hypotheses.**

- As stated; ρ\_f|\_{G\_{ℚ\_p}} crystalline in Thm 4.41's form.
- The first containment excludes height-one primes pulled back from O\[\[Γ^+\]\]; the second needs the Steinberg-twist hypothesis to invoke the anticyclotomic µ = 0 theorem.
- This is the source theorem target. The roadmap proof remains partial pending general-weight-nonvanishing-repair; the later scalar CLW repair alone does not discharge it.

**Proof outline.**

1. Σ-primitive version first: lattice construction (Wan20 Prop. 9.2; L0/lattice-construction) shows that 𝔈\_D contains the characteristic ideal of the dual Selmer group, with Wan20's condition (9) by L2s/cap-exclusion (modularity from Pan's theorem in general weight).
2. Lemma 7.31 (L2/fw-fourier-jacobi-unit) bounds ord\_P(L^{Gr,Σ}) ≤ ord\_P(𝔈\_D) for P ≠ (p).
3. Put back the Euler factors at Σ (Greenberg–Vatsal Prop. 2.4; K\_∞ contains the cyclotomic ℤ\_p-extension; L0/primitive-imprimitive-comparison).
4. Under the Steinberg hypothesis apply Hsieh's anticyclotomic µ = 0 to see that L^{Gr}\_K(f) lies in no height-one prime of O\[\[Γ^+\]\], hence is prime to the Dirichlet factor in the constant terms (L2/exceptional-height-one-primes).

**Checks.**

- One-sided; RT-AREA-iwasawa-1/24 is answered by importing CLW's weight-two Hida theory and the lattice argument from L2s and L0.

**Prerequisites.** [`AutomorphicCongruences:L2/fw-fourier-jacobi-unit`](#node-l2-fw-fourier-jacobi-unit), [`AutomorphicCongruences:L2s/cap-exclusion`](#node-l2s-cap-exclusion), [`AutomorphicCongruences:L2s/clw-main-divisibility`](#node-l2s-clw-main-divisibility), [`AutomorphicCongruences:L0/lattice-construction`](#node-l0-lattice-construction), [`AutomorphicCongruences:L0/primitive-imprimitive-comparison`](#node-l0-primitive-imprimitive-comparison), [`AutomorphicCongruences:L2/exceptional-height-one-primes`](#node-l2-exceptional-height-one-primes), [`AutomorphicCongruences:L1/gu22-galois-pseudocharacter`](#node-l1-gu22-galois-pseudocharacter), `SelmerIwasawaCohomology:L2/greenberg-condition`.

**Sources.**

- **FW-v3**, Thm 7.32 and proof, pp. 96–97; Thm 4.41 and Def. 4.39, pp. 58–59; Thm 1.12, pp. 10–11: The GU(3,1) divisibility with and without the Steinberg-twist hypothesis, and its proof by the lattice construction, CAP exclusion, Euler factors and µ = 0.

**Open obligations.** general-weight-nonvanishing-repair. See the detailed list below.

<a id="node-l2-wan-rankin-selberg-divisibility"></a>

#### Wan's ordinary GU(3,1) Rankin–Selberg divisibility

`AutomorphicCongruences:L2/wan-rankin-selberg-divisibility` (theorem).

**Statement.** Let K be imaginary quadratic with p = v\_0v̄\_0 split, f\_0 a weight-two form of trivial character and square-free tame level N in an ordinary Hida family 𝐟, and ξ a Hecke character of infinity type (κ/2, −κ/2), κ ≥ 6 even, with ord\_{v\_0}, ord\_{v̄\_0} of its conductor ≤ 1. (Thm 1.1) If p ≥ 5, ξ|\_{𝔸^×\_ℚ} = ω∘Nm with κ ≡ 0 mod 2(p − 1), ρ̄\_𝐟|\_{G\_K} irreducible, some q | N nonsplit in K with ρ̄\_𝐟 ramified at q, the CM form g\_ξ satisfies (dist) and (irred), every local root number ε(π\_{f,v}, ξ\_v, 1/2) = 1 at nonsplit v, and the conductor of ξ is divisible only by split primes, then L^{Hida}\_{𝐟,ξ,K} ∈ Î^{ur}\[\[Γ\_K\]\] and (L^{Hida}\_{𝐟,ξ,K}) ⊇ char(X\_{𝐟,K,ξ}). (Thm 1.2) For the single form f\_0, if p ≥ 5, the p-adic avatar of ξ|·|^{κ/2}(ω^{-1}∘Nm) factors through Γ\_K with κ ≡ 0 mod 2(p − 1), ρ̄\_{f}|\_{G\_K} is irreducible and some q ∥ N is nonsplit in K, then (L\_{f,ξ,K}) ⊇ char(X\_{f,K,ξ}) as fractional ideals of Ô^{ur}\_L\[\[Γ\_K\]\] ⊗ L, allowing both global root numbers; this p-inverted, imprimitive two-variable bound (with the exceptional-prime and normality arguments of Wan20 §9) is the input exported to RankOneConverse.

**Hypotheses.**

- As stated in Wan20 Thms 1.1–1.2; the published ordinary theorem (arXiv:1408.4044, Algebra Number Theory 2020), not the withdrawn arXiv:1412.1767 nor the nonordinary replacement (L2s).

**Proof outline.**

1. Construct the Klingen Eisenstein family on U(3,1) whose constant terms are L^Σ\_{𝐟,K,ξ} (Wan20 step (1)), with the Siegel section at p of Wan20 §4.3.
2. Fourier–Jacobi coprimality through the functional l\_{θ⋆}, the doubling formula for U(2) × U(2) and Ichino's formula (Wan20 steps (2)–(5); L2s/fourier-jacobi-primitivity is the weight-two semi-ordinary analogue).
3. Galois argument: lattice construction (Wan20 Prop. 9.2, L0/lattice-construction) with CAP exclusion (L2s/cap-exclusion); Thm 1.2 by specializing a weaker three-variable statement after inverting all nonzero elements of 𝕀.

**Checks.**

- RankOneConverse:PC.2/wan-divisibility consumes Thm 1.2; BSD.6a's anticyclotomic input uses the same theorem through JSW §6.

**Prerequisites.** [`AutomorphicCongruences:L0/lattice-construction`](#node-l0-lattice-construction), [`AutomorphicCongruences:L2s/cap-exclusion`](#node-l2s-cap-exclusion), [`AutomorphicCongruences:L2s/fourier-jacobi-primitivity`](#node-l2s-fourier-jacobi-primitivity), [`AutomorphicCongruences:L2/exceptional-height-one-primes`](#node-l2-exceptional-height-one-primes), `AutomorphicPadicLFunctions:L4e/klingen-family`, `AutomorphicPadicLFunctions:L4e/ew-siegel-eisenstein-measure`, `AutomorphicPadicLFunctions:L3h/theorem-b`, `AutomorphicPadicLFunctions:L3h/hsieh-hecke-nonvanishing`.

**Sources.**

- **Wan-2020**, Thms 1.1–1.2 and the discussion after them, pp. 2–4; outline pp. 4–6: The three-variable and two-variable divisibilities for Rankin–Selberg p-adic L-functions on U(3,1) and the steps of their proof.

<a id="node-l2-auxiliary-field-selection"></a>

#### Choosing the auxiliary imaginary quadratic field for the Fouquet–Wan route

`AutomorphicCongruences:L2/auxiliary-field-selection` (application).

**Statement.** Let f ∈ S\_k(Γ\_0(N)), p ∤ N, k ≥ 2 even, satisfy the hypotheses of FW Thm 1.6 (ρ̄\_f absolutely irreducible; some ℓ ∥ N with dim ρ̄^{I\_ℓ}\_f = 1 and dim ρ̄^{G\_ℓ}\_f = 0; ordinary with χ̄\_1 ≠ χ̄\_2). Then there is an imaginary quadratic K with p split, the chosen ℓ inert in K (so ℓ is a nonsplit prime with ℓ ∥ N), every other prime dividing N split in K, 2 split or ramified-Steinberg as required, and ρ̄\_f|\_{G\_K} absolutely irreducible; for such K all hypotheses of L2/fw-greenberg-divisibility (first containment) and of L2/castella-wan-equivalence hold, and no nonsplit-prime or minimality condition is dropped in passing from f to f over K.

**Hypotheses.**

- Only the hypotheses of FW Thm 1.6 on f; the conditions on K are finitely many local conditions at finitely many primes plus the avoidance of the finitely many quadratic subfields of the splitting field of ρ̄\_f.

**Proof outline.**

1. Impose local splitting conditions at p, ℓ and the primes of N by choosing D\_K in finitely many residue classes; infinitely many such K exist.
2. Absolute irreducibility of ρ̄\_f|\_{G\_K}: ρ̄\_f is absolutely irreducible over ℚ, so it fails over K only if ρ̄\_f is induced from K; this excludes at most finitely many K.
3. Check each hypothesis of Thm 7.32 and of the Castella–Wan comparison: q = ℓ is nonsplit with q ∥ N; all nonsplit primes are q ∥ N; ρ̄\_f|\_{G\_K} irreducible; ordinary at p.

**Checks.**

- The Steinberg-twist hypothesis of the second containment is not automatic; when it fails the exceptional primes are handled by L2/exceptional-height-one-primes or remain excluded.

**Prerequisites.** [`AutomorphicCongruences:L2/fw-greenberg-divisibility`](#node-l2-fw-greenberg-divisibility), [`AutomorphicCongruences:L2/castella-wan-equivalence`](#node-l2-castella-wan-equivalence).

**Sources.**

- **FW-v3**, §4.8, p. 68; Thm 1.6, pp. 6–7: Choose an auxiliary quadratic field K 'in the same way' as in §4.6 and prove the two-variable Rankin–Selberg main conjecture over K.
- **SU**, proof of Thm 3.6.4, p. 43: The analogous choice of K for SU: p split, primes of N/q split, q inert.

<a id="node-l2-fw-crystalline-main-conjecture"></a>

#### Fouquet–Wan's main conjecture at crystalline short points

`AutomorphicCongruences:L2/fw-crystalline-main-conjecture` (theorem).

Atlas landmark: Fouquet–Wan crystalline theorem.

**Statement.** Let f ∈ S\_k(Γ\_0(N)) be a normalized eigencuspform of weight k ≥ 2 with ρ\_f|\_{G\_{ℚ\_p}} crystalline (p ∤ N) and short, ρ̄\_f|\_{G\_{ℚ\_p}} absolutely irreducible, and some ℓ ∥ N with dim ρ̄^{I\_ℓ} = 1 and dim ρ̄^{G\_{ℚ\_ℓ}} = 0. Then Kato's main conjecture holds for M(f): char H²(ℤ\[1/p\], T ⊗ Λ\_Iw) = char H¹(ℤ\[1/p\], T ⊗ Λ\_Iw)/Λ\_Iw·z(f)\_Iw (FW Thm 4.51 = Thm 1.13; Thm 4.38 under the residual hypothesis of Thm 1.7). The proof first gives the equalities of Prop. 4.42 after inverting p (through Pottharst's analytic Iwasawa theory and Selmer complexes over ΛK,∞), then removes the power of p by the unramified local theory along the line through the point (§4.6.3, Prop. 4.48), and treats equal Satake parameters through the Bianchi three-variable p-adic L-function of Betina–Williams (§4.7).

**Hypotheses.**

- As stated; the distinct-Satake-parameter case first, then §4.7 for the p-irregular case.
- Kato's one-sided bound (KatoEulerSystems:L4) supplies the divisibility F\_1 | F of the proof of Thm 4.51.
- The source theorem is the target; general-weight-nonvanishing-repair and the regulator supplier are unresolved proof inputs. Kato’s integral bound must be applied with its actual free rank-one τ-quotient condition, not merely residual irreducibility.

**Proof outline.**

1. Prop. 4.42: from L2/fw-greenberg-divisibility over K and the Beilinson–Flach reciprocity of L2/bf-explicit-reciprocity in analytic families, via Poitou–Tate for Selmer complexes (FW §4.5, Props 4.28, 4.30, 4.43, Cor. 4.44), get the equality after inverting p.
2. §4.3: control of Selmer groups and absence of pseudo-null submodules (Prop. 4.20).
3. §4.6.3: along the unramified line through the point, the integral local subspace of L2/unramified-exponential-boundedness gives the bound at a generic arithmetic point (Prop. 4.48, Lemmas 4.49–4.50); with Kato's divisibility F\_1 | F and Kato's explicit reciprocity this gives Thm 4.51.
4. §4.7: when the Satake parameters coincide, compare with the Betina–Williams Bianchi p-adic L-function (Prop. 4.53).

**Checks.**

- Integral, not only after inverting p; this is the seed FW Prop. 5.6 uses at crystalline-short points of the deformation space.

**Prerequisites.** [`AutomorphicCongruences:L2/fw-greenberg-divisibility`](#node-l2-fw-greenberg-divisibility), [`AutomorphicCongruences:L2/bf-explicit-reciprocity`](#node-l2-bf-explicit-reciprocity), [`AutomorphicCongruences:L2/unramified-exponential-boundedness`](#node-l2-unramified-exponential-boundedness), [`AutomorphicCongruences:L2/castella-wan-equivalence`](#node-l2-castella-wan-equivalence), `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `PadicFamilies:L4/coleman-family-regulator`, `SelmerIwasawaCohomology:L3/infinite-selmer-complex`, `SelmerIwasawaCohomology:L3/selmer-no-pseudonull`, `PadicHodgeRegulators:L4/noncritical-refinement`, `ModularIwasawaMainConjectures:L0/kato-main-conjecture`.

**Sources.**

- **FW-v3**, Thm 4.38 p. 58; Prop. 4.42 p. 59; §4.6.3 and Thm 4.51 with proof pp. 61–65; §4.7 Prop. 4.53 pp. 66–67: Kato's main conjecture at crystalline short points with residually irreducible local representation.
- **FW-v3**, §1.2.1, pp. 11–12: Outline: analytic Iwasawa theory after inverting p, then the unramified line to remove powers of p, then the Betina–Williams comparison.

**Open obligations.** fw-crystalline-proofs; general-weight-nonvanishing-repair; kato-integral-quotient-witness. See the detailed list below.

<a id="node-l2-fw-ordinary-reverse-bound"></a>

#### The Fouquet–Wan ordinary reverse divisibility (Theorem 1.6 by §4.8)

`AutomorphicCongruences:L2/fw-ordinary-reverse-bound` (theorem).

Atlas landmark: Fouquet–Wan ordinary reverse divisibility.

**Statement.** Let f ∈ S\_k(Γ\_0(N)), p ∤ N, k ≥ 2, be an eigencuspform with (1) ρ̄\_f absolutely irreducible; (2) some ℓ ∥ N with dim\_𝔽 ρ̄^{I\_ℓ}\_f = 1 and dim\_𝔽 ρ̄^{G\_ℓ}\_f = 0; (3) ρ\_f|\_{G\_{ℚ\_p}} an extension 0 → χ\_1 → ρ\_f|\_{G\_{ℚ\_p}} → χ\_2 → 0 with χ̄\_1 ≠ χ̄\_2. Then char\_{Λ\_Iw} H¹(ℤ\[1/p\], T ⊗ Λ\_Iw)/Λ\_Iw·z(f)\_Iw divides char\_{Λ\_Iw} H²(ℤ\[1/p\], T ⊗ Λ\_Iw) (FW Thm 1.6). The route is FW §4.8, not SU plus a period lemma: over an auxiliary K (L2/auxiliary-field-selection) prove the two-variable Greenberg Rankin–Selberg main conjecture divisibility by L2/fw-greenberg-divisibility, transfer it through L2/castella-wan-equivalence to the Beilinson–Flach formulation, descend to the cyclotomic line, separate the twist factor f ⊗ χ\_K, and remove the power of p by a §4.6.3-type integral argument that uses Kato's one-sided bound. No comparison of canonical and Gross periods is used.

**Hypotheses.**

- Hypotheses (1)–(3) of FW Thm 1.6 exactly; trivial character, even weight for the GU(3,1) input.
- FW §4.8 only indicates this argument (the weight-two details are referred to Castella–Wan Thm 3.8); the p-power step in the ordinary case is not written out in the source (gap 'fw-4-8-sketch').
- The source theorem is the target; general-weight-nonvanishing-repair and the regulator supplier are unresolved proof inputs. Kato’s integral bound must be applied with its actual free rank-one τ-quotient condition, not merely residual irreducibility.

**Proof outline.**

1. Choose K by L2/auxiliary-field-selection; L2/fw-greenberg-divisibility gives char(X^{Gr}) ⊆ (L^{Gr}) up to pulled-back primes, integrally when L2/exceptional-height-one-primes applies.
2. L2/castella-wan-equivalence (weight k) converts this into the Beilinson–Flach divisibility char(X^{Gr,0}) ⊆ char(Sel^{Gr,∅}/BF†), up to powers of p.
3. Specialize to the cyclotomic line (L0/selmer-specialization-control) and compare BF† with Kato's zeta elements of f and f ⊗ χ\_K (as in FW §4.6.2–4.6.3), separating the two factors.
4. Remove the power of p as in FW §4.6.3: Kato's divisibility (KatoEulerSystems:L4/cohomological-divisibility-one-direction) and an integral local subspace along a line in Spec Λ\_K reduce the integral statement to a cardinality at one generic arithmetic point.

**Checks.**

- Export to ModularIwasawaMainConjectures:L1/fw-ordinary-theorem, which combines it with Kato's bound into the equality; RS-11 requires the KatoEulerSystems:L4 input inside this proof, not only in the consumer.
- RT-AREA-iwasawa-1/22: this target lives in L2 (its inputs are L2's), not in L1; no canonical/Gross period comparison is an input; the ordinary integral descent is the actual recorded gap.

**Prerequisites.** [`AutomorphicCongruences:L2/auxiliary-field-selection`](#node-l2-auxiliary-field-selection), [`AutomorphicCongruences:L2/fw-greenberg-divisibility`](#node-l2-fw-greenberg-divisibility), [`AutomorphicCongruences:L2/castella-wan-equivalence`](#node-l2-castella-wan-equivalence), [`AutomorphicCongruences:L2/exceptional-height-one-primes`](#node-l2-exceptional-height-one-primes), [`AutomorphicCongruences:L2/unramified-exponential-boundedness`](#node-l2-unramified-exponential-boundedness), [`AutomorphicCongruences:L0/selmer-specialization-control`](#node-l0-selmer-specialization-control), `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `ModularIwasawaMainConjectures:L0/kato-main-conjecture`.

**Sources.**

- **FW-v3**, Thm 1.6 and the remark before it, pp. 6–7; §4.8, p. 68: Theorem 1.6 and its proof sketch: auxiliary K, two-variable Rankin–Selberg main conjecture via Thm 7.32, Beilinson–Flach reciprocity and Poitou–Tate as in Castella–Wan, then Kato.
- **CW-v1**, Thm 3.8, p. 16: The weight-two equivalence that FW §4.8 extends.

**Open obligations.** fw-4-8-sketch; general-weight-nonvanishing-repair; kato-integral-quotient-witness. See the detailed list below.

<a id="layer-l3"></a>

### Layer L3: Universal deformation families and zeta morphisms

Separate residual predicates govern the FW and Nakamura theorems. The deformation/Hecke algebra is finite free over a regular power-series subring; it is not thereby regular. Completed Borel–Moore homology supplies the intrinsic co-Whittaker factor used by the universal zeta morphism. Graded determinant lines retain duals, local corrections and the conditions for base change.

<a id="node-l3-fw-residual-hypotheses"></a>

#### The residual hypotheses of the Fouquet–Wan and Nakamura theorems

`AutomorphicCongruences:L3/fw-residual-hypotheses` (definition).

**Statement.** For an odd prime p, a finite field 𝔽 of characteristic p and an odd absolutely irreducible continuous ρ̄: G\_ℚ → GL\_2(𝔽) unramified outside a finite set Σ ∋ p, define the predicates: (A2.1) ρ̄|\_{G\_{ℚ(√p*)}} is absolutely irreducible (p* = (−1)^{(p−1)/2}p), and if ρ̄|\_{G\_{ℚ\_p}} is an extension of χ\_2 by χ\_1 then χ\_1^{-1}χ\_2 ∉ {1, χ̄\_cyc} (FW Assumption 2.1); (A3.5) if (ρ̄|\_{G\_{ℚ\_p}})^{ss} = χ̄\_1 ⊕ χ̄\_2 then χ̄\_1^{-1}χ̄\_2 ≠ χ̄\_cyc (FW Assumption 3.5); (A3.7) there is ℓ ∥ N, ℓ ≠ p, with dim\_𝔽 ρ̄^{I\_ℓ} = 1 (FW Assumption 3.7); (T1.7) (ρ̄|\_{G\_{ℚ\_p}})^{ss} ≠ χ̄ ⊕ χ̄χ̄\_cyc for every character χ̄, and there is ℓ ∤ p with ρ̄|\_{G\_{ℚ\_ℓ}} a ramified extension 0 → µχ^{1−k/2}\_cyc → ρ̄|\_{G\_{ℚ\_ℓ}} → µχ^{−k/2}\_cyc → 0, µ the nontrivial unramified quadratic character (FW Thm 1.7); and Nakamura's (N1) p ≥ 5, (N2) ρ̄|\_{G\_{ℚ(ζ\_p)}} absolutely irreducible, (N3) End\_{𝔽\[G\_{ℚ\_p}\]}(ρ̄\_p) = 𝔽, (N4) ρ̄\_p not of the form (1 ∗; 0 ε^{±1}) ⊗ χ, (N5) ρ̄\_p not of the form (1 ∗; 0 1) ⊗ χ (Nakamura Thm 1.1). Define T5.1 separately: the same global irreducibility, local semisimple exclusion and ramified Steinberg-shape witness, but µ may be trivial when ρ̄|G\_Qp is reducible; it must be nontrivial when that local representation is irreducible. The pointwise and family theorems of §5 use T5.1, not an identification of these two predicates.

**Hypotheses.**

- The predicates are on the residual representation only; the scalar exclusion (ρ̄|\_{G\_{ℚ\_p}})^{ss} ≠ χ̄ ⊕ χ̄ is part of A2.1 through its second clause and the endomorphism remark after it (FW p. 17).

**Proof outline.**

1. Record each predicate as a Prop on ρ̄ with its source.
2. Under A2.1 the local endomorphism algebra is F: its scalar semisimplification exception has already been excluded by A2.1(2).
3. Nakamura's remark on N2/N5 (they can be dropped for the promodular ring) and FW's remark on p ≥ 5 (removed by Paškūnas–Tung's generalization) are recorded as API facts.

**Checks.**

- Answers the consumer question of ModularIwasawaMainConjectures (source issue E1): whether FW Assumption 2.1(2)'s scalar exclusion is needed is decided by recording it as a separate predicate used by L3/universal-deformation-ring-structure and L3/nakamura-universal-zeta-morphism.

**Uses.**

- L3/universal-deformation-ring-structure: A2.1 makes R\_Σ(ρ̄) representable, CI and isomorphic to the Hecke algebra
- L3/nakamura-universal-zeta-morphism: N1–N5 (or N1, N3, N4 for the promodular ring)
- L4/fw-pointwise-theorem: T51 is the §5 pointwise hypothesis; T17 is the narrower introductory formulation
- ModularIwasawaMainConjectures:L2/fw-pointwise-theorem: T51 is the §5 pointwise hypothesis; T17 is the narrower introductory formulation

**API.**

- `FWResidual.A21` (constructor): Assumption 2.1 as a predicate on ρ̄.
- `FWResidual.A35` (constructor): Assumption 3.5.
- `FWResidual.A37` (constructor): Assumption 3.7 (a prime ℓ ∥ N with one-dimensional inertia invariants).
- `FWResidual.T17` (constructor): The residual hypotheses of FW Thm 1.7, with nontrivial µ in every case.
- `FWResidual.Nakamura` (constructor): Nakamura's (N1)–(N5).
- `FWResidual.scalar_endomorphisms` (characterisation): A21 implies End\_{F\[G\_Qp\]}(ρ̄\_p)=F, without an additional exception.
- `FWResidual.twist_invariant` (compatibility): A21, A35 and the Nakamura exclusions are invariant under character twists. A37 is preserved by a twist unramified at its chosen witness ℓ. The specified Steinberg shape and µ in T17/T51 are not invariant under arbitrary twists.
- `FWResidual.T51` (constructor): The residual hypotheses of FW Thm 5.1, with µ allowed trivial only when ρ̄\_p is reducible.
- `FWResidual.ext` (extensionality): Each predicate transports under an isomorphism of residual representations; predicates including a witness retain the chosen prime and its local characters.

**Unit tests.**

- `fwResidual_A21_quadratic` (computation): For p = 5 and ρ̄ induced from a character of G\_{ℚ(√5)} (dihedral with respect to ℚ(√p*)), A21 fails while ρ̄ itself is absolutely irreducible.
- `fwResidual_T17_excludes_cyclotomic` (non-example): For E/ℚ with good ordinary reduction at p, (ρ̄\_{E,p}|\_{G\_{ℚ\_p}})^{ss} = u ⊕ u^{-1}χ̄\_cyc with u unramified, u(Frob\_p) = a\_p mod p; this has the form χ̄ ⊕ χ̄χ̄\_cyc exactly when a\_p ≡ ±1 mod p, and then the first clause of T1.7 fails.
- `fwResidual_A37_steinberg` (agreement): For E/ℚ with split multiplicative reduction at ℓ and p ∤ ord\_ℓ(Δ\_E), ρ̄\_{E,p} is ramified at ℓ with dim ρ̄^{I\_ℓ} = 1, so A37 holds for ℓ ∥ N (Tate curve).
- `fwResidual_scalar_case` (degenerate): If (ρ̄|\_{G\_{ℚ\_p}})^{ss} ≅ χ̄ ⊕ χ̄, the endomorphism algebra of a split ρ̄|\_{G\_{ℚ\_p}} is M\_2(𝔽), so N3 fails.
- `fwResidual_T17_vs_T51` (characterisation): For a reducible-at-p residual representation with the required ramified local Steinberg shape and µ=1, that witness is allowed by T51 and excluded by T17. This distinguishes the two source statements rather than conflating their µ hypotheses.

**Prerequisites.** `GlobalGaloisDeformations:R04.2/universal-deformation-ring`, `GL2ModularityLifting:R32.1/quadratic-cyclotomic-irreducibility`, `GL2ModularityLifting:R32.1/exceptional-local-cases`, `GL2ModularityLifting:R32.1/p-star`.

**Sources.**

- **FW-v3**, Assumption 2.1, p. 17; Assumption 3.5, p. 24; Assumption 3.7, p. 25; Thm 1.7, p. 7; Thm 5.1, p. 68: The residual hypotheses of the deformation-theoretic part and of the main theorems.
- **NAK-v2**, Thm 1.1 (1)–(5) and Remark 1.2, pp. 4–5: Nakamura's hypotheses, with the remark that (2) and (5) can be removed for the promodular ring and why (1), (3), (4) are needed.

<a id="node-l3-universal-deformation-ring-structure"></a>

#### The universal deformation ring is a reduced complete intersection, finite free over Λ, and equal to the Hecke algebra

`AutomorphicCongruences:L3/universal-deformation-ring-structure` (theorem).

Atlas landmark: Universal deformation ring.

**Statement.** Under FW Assumption 2.1 (L3/fw-residual-hypotheses), the universal deformation ring R\_Σ(ρ̄) of ρ̄ unramified outside Σ is a flat O-algebra which is a complete intersection of Krull dimension 4 (FW Prop. 2.4); there is a Zariski-dense open X^sm ⊂ Spec R\_Σ(ρ̄) containing every point that is ordinary up to twist (if ρ̄|\_{G\_{ℚ\_p}} is reducible) or crystalline and short up to twist (if irreducible), at which Spec R^χ\_Σ(ρ̄) → Spec O is formally smooth, and R\_Σ(ρ̄) is reduced (Cor. 2.5); the classical points (up to twist) are Zariski dense, so the surjection R\_Σ(ρ̄) → 𝕋^Σ\_{m\_ρ̄} is an isomorphism (Prop. 2.6); and there is a regular sequence (x\_1, x\_2, x\_3) in 𝕋^Σ\_{m\_ρ̄} making it a finite free module over Λ = O\[\[X\_1, X\_2, X\_3\]\], such that classical points with the same image in Spec Λ are all crystalline-short (resp. ordinary) up to twist or none are (Cor. 2.7). Finite flatness over the regular ring Λ does not make R\_Σ(ρ̄) regular; the main conjecture over R\_Σ(ρ̄) is formulated through perfect complexes and the regular subring Λ.

**Hypotheses.**

- FW Assumption 2.1; p odd; Σ finite containing p and the ramification of ρ̄.
- The existence of a classical point of the Serre weight (FW cites Edixhoven/Gross–Coleman–Voloch-type results \[31\]) and the local deformation rings at p (ordinary or crystalline-short) are inputs.
- The complete-intersection and density proof here is FW Prop. 2.4–2.6 with its local hypotheses. Do not replace it by the supplier’s unobstructed-ring hypothesis or assume all such rings regular.

**Proof outline.**

1. Twisting by canonical square roots of characters in 1 + ϖO identifies R\_Σ(ρ̄) ≅ R^χ\_Σ(ρ̄) ⊗̂ R\_Σ(𝟙), reducing to fixed determinant (proof of FW Prop. 2.4).
2. Fixed determinant: the ordinary (resp. crystalline-short) quotient is cut out by a regular sequence (x\_2, x\_3) and is a finite Hecke algebra at a classical point; a presentation over the local rings gives the complete-intersection property (GlobalGaloisDeformations:R04.3/local-to-global-presentation, global-dimension-lower-bound).
3. Use FW Cor. 2.5 and Prop. 2.6: establish reducedness and density with the specified ordinary/crystalline local quotients, then identify R with T. R31.6/boeckle-r-equals-t supplies a related unobstructed statement; it does not prove this obstructed complete-intersection theorem on its own.
4. Choose x\_1 from R\_Σ(𝟙) to get the Λ-structure of Cor. 2.7.

**Checks.**

- The Λ-structure depends on the initial classical point; the map Spec 𝕋 → Spec Λ may be ramified, even at classical points, but not at points of X^sm.
- No axiom 'R = T' is imported: the isomorphism is proved from density of classical points and reducedness.

**Prerequisites.** [`AutomorphicCongruences:L3/fw-residual-hypotheses`](#node-l3-fw-residual-hypotheses), `GlobalGaloisDeformations:R04.2/universal-deformation-ring`, `GlobalGaloisDeformations:R04.2/fixed-determinant-rings`, `GlobalGaloisDeformations:R04.3/local-to-global-presentation`, `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`, `LocalGaloisDeformationRings:R08.1/local-lifting-ring`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`, `LocalGaloisDeformationRings:L7/geraghty-fixed-weight-ordinary-rings`, `LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.6/boeckle-r-equals-t`, `GL2ModularityLifting:R32.2/odd-prime-de-rham-lifting`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersection-local`, `DeformationAndDerivedPatchingAlgebra:R03.3/free-of-maximal-depth-regular-local`, `mathlib:IsRegularLocalRing`, `mathlib:IsReduced`.

**Sources.**

- **FW-v3**, Prop. 2.4 and proof, p. 18; Cor. 2.5, p. 19; Prop. 2.6 and Cor. 2.7 with proofs, p. 20: Flatness and the complete-intersection property, the smooth locus X^sm, R = 𝕋 and the finite free Λ-structure.
- **FW-v3**, §1.2, p. 9; §1.2.2, p. 14: R\_Σ(ρ̄) ≅ 𝕋 is a reduced complete intersection of relative dimension 3, not known to be factorial; the descent is carried out over the regular ring Λ.

<a id="node-l3-completed-homology-factorization"></a>

#### Completed (co)homology localized at ρ̄ and its local–global factorization

`AutomorphicCongruences:L3/completed-homology-factorization` (comparison).

**Statement.** Under Nakamura (N1),(N3),(N4), use the intrinsic BM co-Whittaker factor B\_{Σ\_0} and its smooth dual B^∨\_{Σ\_0}. In NAK-v2 Cor. 2.5 (p. 25), completed Borel–Moore homology factors as (π\_p^m)^*⊗(ρ^m)^*⊗B\_{Σ\_0}; the factor is the untilde π of that version. NAK-v2 Thm 2.2 (p. 20) describes completed cohomology using the smooth-dual factor, denoted tilde π there. The published version reverses these notational roles. The zeta construction uses the BM factor as in NAK-v2 (47), p. 63; do not identify B with B^∨. In the GL₂ families used by FW Props 6.7–6.9, the specified essential-vector level has free rank-one invariants with the stated classical base change. This last property uses the explicit GL₂ classification, not merely the rank-one top derivative in the definition of co-Whittaker.

**Hypotheses.**

- (N1), (N3), (N4); in particular p ≥ 5, which is the range of PadicLocalLanglandsForGL2Qp:R30.5's nodes. FW's extension to p = 3 rests on Paškūnas–Tung's generalization (FW remark after Thm 3.6), which the imported nodes do not cover; the request to R30.5 asks for it. The co-Whittaker families exist (Helm's local Langlands in families, conditional in general in SmoothRepresentationsOfLocalGroups:SR.5, proved in the GL\_2 cases needed by FW Prop. 6.8).

**Proof outline.**

1. Import Emerton's local–global compatibility (CompletedCohomologyAndLocalGlobalCompatibility:R31.4) and the Paškūnas description of the Montréal functor (PadicLocalLanglandsForGL2Qp:R30.5).
2. Use NAK-v2 Cor. 2.5 for BM homology and its untilde co-Whittaker factor; use Thm 2.2 for cohomology and the smooth-dual factor. Track the factors by their intrinsic property before importing notation from the published version.
3. Essential vectors in families: co-Whittaker modules are unique (FW Prop. 6.7), have the explicit shapes of Prop. 6.8, and their K\_1(ϖ^m)-invariants are free of rank one with base change (Prop. 6.9).

**Checks.**

- R31.4 and R30.5/R30.6 are the owners of generic local–global compatibility and p-adic local Langlands. Existing upstream SmoothRepresentationsOfLocalGroups owns the generic co-Whittaker API. The specific unconditional GL₂ family and essential-vector comparison of FW Props 6.7–6.9 still require the recorded supplier contract; the conditional general LLC-family node is not itself an unconditional proof.

**Prerequisites.** `CompletedCohomologyAndLocalGlobalCompatibility:R31.4/the-main-local-global-theorem-with-its-two-residual-hypotheses`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.4/dual-local-global-compatibility-for-completed-homology`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.4/local-langlands-families-over-the-hecke-algebra`, `PadicLocalLanglandsForGL2Qp:R30.5/paskunas-endomorphism-rings`, `PadicLocalLanglandsForGL2Qp:R30.5/dual-of-universal-deformation`, `SmoothRepresentationsOfLocalGroups:SR.5/co-whittaker`, `SmoothRepresentationsOfLocalGroups:SR.5/llc-family-conditional`, `SmoothRepresentationsOfLocalGroups:SR.5/essential-vector-contract`, `SmoothRepresentationsOfLocalGroups:SR.5/reduced-family-reconstruction`, [`AutomorphicCongruences:L3/fw-residual-hypotheses`](#node-l3-fw-residual-hypotheses).

**Sources.**

- **NAK-v2**, Thm 2.2, p. 20; Cor. 2.5 (§2.3), p. 25; §4.1 (47), p. 63: The factorization of completed cohomology and its dual for completed Borel–Moore homology, used to define the zeta morphism.
- **FW-v3**, Props 6.7–6.9, pp. 77–78; Thm 6.10, p. 79: Co-Whittaker modules in families, essential vectors and Emerton's theorem in FW's form.

**Open obligations.** nakamura-proofs. See the detailed list below.

<a id="node-l3-smooth-classical-points"></a>

#### Classical points of good reduction type exist and are dense

`AutomorphicCongruences:L3/smooth-classical-points` (theorem).

**Statement.** Under FW Assumption 2.1: (i) if ρ̄|\_{G\_{ℚ\_p}} is irreducible there is a crystalline and short classical point λ\_f with R\_Σ(ρ̄) ≅ R\_Σ(ρ̄\_f) (FW Lemma 2.2), and in general a point of Spec 𝕋^Σ\_{m\_ρ̄} that is crystalline-short, crystalline-short up to the quadratic twist ω^{(p−1)/2}, good ordinary, or good ordinary up to a quadratic twist (FW Lemma 2.8, used in the proof of Thm 5.1); (ii) X^sm is Zariski dense and the set of specializations that are not Iwasawa-suitable, or at which Spec 𝕋 is not étale over Spec Λ, is contained in a locus of codimension at least one (FW Props 2.6, 3.16).

**Hypotheses.**

- As stated; Iwasawa-suitable in the sense of FW Def. 3.19.

**Proof outline.**

1. Lemma 2.2: twist so that the inertial weights are fundamental characters of level 2 and use the Serre weight conjecture (now a theorem) to produce a crystalline short form.
2. Lemma 2.8: the analogous statement covering the reducible-at-p case with ordinary points.
3. Density and codimension from Cor. 2.5 and Prop. 3.16.

**Checks.**

- These are the seed points at which L4/etale-point-descent applies L2's crystalline theorem or the ordinary theorem.

**Prerequisites.** [`AutomorphicCongruences:L3/universal-deformation-ring-structure`](#node-l3-universal-deformation-ring-structure), `SerreWeightAndLevelOptimisation:R20.6`, `LocalGaloisDeformationRings:R08.6/export-fontaine-laffaille-irreducible`.

**Sources.**

- **FW-v3**, Lemma 2.2 and proof, p. 17; proof of Thm 5.1 (Lemma 2.8), p. 73; Prop. 2.6, p. 20; §3.2.2 (Prop. 3.16), p. 29: Existence of crystalline-short or ordinary points and density of good specializations.

<a id="node-l3-fundamental-line"></a>

#### Fundamental lines over the deformation ring and its quotients

`AutomorphicCongruences:L3/fundamental-line` (construction).

Atlas landmark: Fundamental line.

**Statement.** Let A be a quotient of 𝕋^Σ\_{m\_ρ̄} or of Λ (for example 𝕋, R(𝔞) = 𝕋/𝔞 for a minimal prime 𝔞, Λ, O\_Iw or O) and T := T\_Σ ⊗ A. The complexes RΓ\_et(ℤ\[1/Σ\], T) and RΓ(G\_{ℚ\_ℓ}, T) are perfect and commute with derived base change (FW Lemma 3.17). The Σ-partial fundamental line is the graded invertible A-module Δ\_Σ(T) := Det^{-1}\_A RΓ\_et(ℤ\[1/Σ\], T) ⊗\_A Det^{-1}\_A T(−1)^+ (FW Def. 3.18); for A a domain and ℓ ∈ Σ prime to p put X\_ℓ(T) := Det\_A RΓ(G\_{ℚ\_ℓ}/I\_ℓ, T^{I\_ℓ}) if rank T^{I\_ℓ} ≠ 1 and Det\_A\[A —(1−α\_ℓ)→ A\] if rank T^{I\_ℓ} = 1, and the fundamental line Δ(T) := Δ\_Σ(T) ⊗ ⊗\_{ℓ∈Σ∖{p}}(X\_ℓ(T) ⊗ Det^{-1}\_A RΓ(G\_{ℚ\_ℓ}, T)). Any ψ: A → A′ induces Δ\_A(T) ⊗\_A A′ ≅ Δ\_{A′}(T′) for the Σ-partial line, and for the full line when ψ is Iwasawa-suitable; when both are defined, Δ\_A(T) ≅ Det^{-1}RΓ\_et(ℤ\[1/p\], T) ⊗ Det^{-1}T(−1)^+ (FW Prop. 3.20). In the rank-one correction \[A→(1−α\_ℓ)A\], the two terms are in degrees 0 and 1. Under the acyclic trivialization its determinant basis maps to 1−α\_ℓ; the inverse determinant gives (1−α\_ℓ)^{-1}. No local X\_p is used.

**Hypotheses.**

- Use the requested Knudsen–Mumford graded determinant functor on perfect complexes, owned by PadicMeasuresIwasawaAlgebras:L5 but not present in the current upstream checkout; T(−1)^+ is the complex-conjugation + part.

**Proof outline.**

1. Perfectness and base change of étale cohomology complexes (Nekovář's Selmer complexes, FW Lemma 3.17).
2. Define Δ\_Σ and Δ by the determinant functor; the local factors X\_ℓ use the explicit two-term complex when the inertia invariants have rank one.
3. Prop. 3.20: identify Δ with the {p}-partial line through the cone of RΓ(ℤ\[1/Σ\]) ⊕ ⊕RΓ(G\_{ℚ\_ℓ}) → ⊕RΓ(G\_{ℚ\_ℓ}/I\_ℓ, T^{I\_ℓ}), and check base change of X\_ℓ when ranks of inertia invariants agree and ψ(α\_ℓ) = α′\_ℓ.

**Checks.**

- Fitting ideals commute with ordinary module base change but need not be invertible and do not encode the alternating determinant of all cohomology. Characteristic divisors require the appropriate normal-ring hypotheses and are principal only in a UFD. Perfect-complex determinant lines commute with derived base change; the full local correction also requires Iwasawa-suitability.

**Uses.**

- L3/zeta-trivialization: the zeta morphism trivializes Δ\_Σ(T\_Σ) inside Frac Λ
- L4/fw-universal-family-theorem: the statement Δ\_Σ(T\_Σ) ≅ Λ
- L4/derived-specialization-corrections: the Euler-factor lines X\_ℓ and their base change at non-Iwasawa-suitable points
- ModularIwasawaMainConjectures:L4/fw-universal-family-theorem: the consumer's formulation

**API.**

- `FundLine.partial` (constructor): Δ\_Σ(T) = Det^{-1}RΓ\_et(ℤ\[1/Σ\], T) ⊗ Det^{-1}T(−1)^+, a graded invertible A-module.
- `FundLine.full` (constructor): Δ\_Σ(T) tensored with X\_ℓ(T)⊗Det^{-1}RΓ(G\_Qℓ,T) for ℓ∈Σ∖{p}.
- `FundLine.eulerFactorLine` (data): X\_ℓ=Det\[A→(1−α\_ℓ)A\] in degrees 0,1 in rank one. Its acyclic trivialization has image (1−α\_ℓ)A when 1−α\_ℓ≠0.
- `FundLine.baseChange_partial` (compatibility): Δ\_Σ(T) ⊗\_A A′ ≅ Δ\_Σ(T ⊗ A′) for every ring map A → A′.
- `FundLine.baseChange_full` (compatibility): Δ(T) ⊗\_{A,ψ} A′ ≅ Δ(T′) for ψ Iwasawa-suitable (FW Prop. 3.20).
- `FundLine.compare_p` (equivalence): Δ\_A(T) ≅ Det^{-1}RΓ\_et(ℤ\[1/p\], T) ⊗ Det^{-1}T(−1)^+ when the latter is defined.
- `FundLine.trivial_of_torsion` (characterisation): Over a regular domain, a trivialization of Δ inside Frac A is A itself iff the corresponding characteristic ideals agree (with ModularIwasawaMainConjectures:L0/zeta-basis-characteristic-equivalence pointwise).
- `FundLine.ext` (extensionality): The determinant functor transports isomorphisms of perfect complexes and their distinguished-triangle identifications; specified trivializations agree iff their generic maps agree.

**Unit tests.**

- `fundLine_rank` (computation): For A = O\_Iw and T = T(f)\_Iw with H¹ free of rank one and H² torsion, Δ\_Σ(T) is concentrated in degree zero and is a free O\_Iw-module of rank one.
- `fundLine_eulerFactor_rank_one` (computation): For \[A→d A\] in degrees 0,1 with d≠0, the standard determinant basis maps to d, giving the fractional lattice dA; Det^{-1} gives d^{-1}A. For d a unit both are A. This fixes the sign rather than leaving ±1 unspecified.
- `fundLine_base_change` (agreement): For ψ: 𝕋 → R(𝔞) the base change of Δ\_Σ(T\_Σ) is Δ\_Σ(T(𝔞)) — the left column of FW (1.2.2).
- `fundLine_not_fitting` (non-example): Take A=k\[\[x,y\]\] and M=A/(x,y). M has finite projective dimension two, characteristic divisor zero and divisorial characteristic ideal A, but Fitt₀(M)=(x,y), which is not invertible. Replacing its perfect-complex determinant by this Fitting ideal loses invertibility even though Fitting ideals themselves commute with module base change.

**Prerequisites.** `PadicMeasuresIwasawaAlgebras:L5`, `SelmerIwasawaCohomology:L3/selmer-determinant`, `SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler`, `SelmerIwasawaCohomology:L2/selmer-complex`, `ModularIwasawaMainConjectures:L0/iwasawa-fundamental-line`, [`AutomorphicCongruences:L3/universal-deformation-ring-structure`](#node-l3-universal-deformation-ring-structure).

**Sources.**

- **FW-v3**, §3.3: Lemma 3.17, Defs 3.18–3.19, Prop. 3.20 and proof, pp. 31–32: The Σ-partial and full fundamental lines over quotients of 𝕋 or Λ and their base change.
- **FW-v3**, §1.2.2, pp. 12–14: Why fundamental lines rather than characteristic or Fitting ideals.

<a id="node-l3-equivariant-zeta-morphism-completed-homology"></a>

#### The G_Σ-equivariant zeta morphism on completed homology

`AutomorphicCongruences:L3/equivariant-zeta-morphism-completed-homology` (construction).

**Statement.** For N ≥ 3, n ≥ 1 with prime(Np) = Σ and (n, Σ) = 1, Nakamura constructs from Kato's full-level Hecke-linear zeta classes a ℤ\_p\[GL\_2(ℤ/N)\]-linear map z^{Iw}\_{N,n}(k, −): H¹(Y(N), 𝒱^*\_k)(1) → H¹\_Iw(ℤ\[1/Σ\_n, ζ\_n\], H¹(X(N), j\_*𝒱^*\_k(2)))\_{Q\_{k,n}} (Prop. 3.8, Q\_{k,n} the multiplicative set of the smoothing factors); after localizing at the non-Eisenstein ideal of ρ̄ it lands in the unlocalized Iwasawa cohomology of H¹(Y(N), 𝒱^*\_k)\_ρ̄(2) (Cor. 3.14, Prop. 3.15); the limits over p-power level define a continuous 𝕋\_{ρ̄,Σ}\[G\_Σ\]-linear map z^{Iw}\_{Σ,n,ρ̄}: H̃^{BM}\_{1,ρ̄,Σ} → H¹\_Iw(ℤ\[1/Σ\_n, ζ\_n\], H̃^{BM}\_{1,ρ̄,Σ}(1)) with z(τv) = σ\_{−1}z(v) and the Euler-system norm relations (Thm 3.16); and the weight-k maps are recovered from weight two by tensoring over O\[\[K\_m\]\] with W = Sym^{k−2}(O²)^* (Prop. 3.17).

**Hypotheses.**

- Localization at the non-Eisenstein maximal ideal of ρ̄ (absolutely irreducible) is what makes H¹(X(N), j\_*𝒱) and H¹(Y(N), 𝒱) agree and the map integral.

**Proof outline.**

1. Prop. 3.8: assemble Kato's classes c,d-z\_{N,n}(k, r, r′) into a Hecke- and GL\_2(ℤ/N)-equivariant map, removing the c,d smoothing in the localization Q\_{k,n} (following Fukaya–Kato).
2. Use NAK-v2 Prop. 3.15 to remove the smoothing denominators after non-Eisenstein localization, via freeness and the finite-level comparison. Its c² smoothing coefficient is already correct in arXiv v2; PAPER-NAKAMURA-23/E5 concerns the later published bare-c misprint.
3. Thm 3.16: pass to the limit over N\_0p^∞ and over levels in Σ\_0; Prop. 3.17 compares weights.

**Checks.**

- The modular input is imported from KatoEulerSystems:L2 (full-level Hecke-linear zeta classes), which says the universal-deformation map is owned here.

**Uses.**

- L3/nakamura-universal-zeta-morphism: z^{Iw}\_{Σ,n,ρ̄} is transported through φ\_1 to define z\_{Σ,n}(ρ^m)
- L3/nakamura-specialization-theorem: Prop. 3.17 and the finite-level maps compute the specialization at classical points

**API.**

- `CompZeta.finiteLevel` (constructor): z^{Iw}\_{N,n}(k, −), ℤ\_p\[GL\_2(ℤ/N)\]-linear, valued in the Q\_{k,n}-localized Iwasawa cohomology.
- `CompZeta.integral` (characterisation): After localization at ρ̄ the map is integral (no Q\_{k,n}-denominators).
- `CompZeta.limit` (constructor): z^{Iw}\_{Σ,n,ρ̄} on H̃^{BM}\_{1,ρ̄,Σ}, continuous and 𝕋\_{ρ̄,Σ}\[G\_Σ\]-linear.
- `CompZeta.conj` (characterisation): z(τv) = σ\_{−1}z(v) for complex conjugation τ.
- `CompZeta.norm` (characterisation): Cor ∘ z\_{Σ,nl} = z\_{Σ,n} if l | n and P\_l(σ\_l^{-1})z\_{Σ,n} if (l, n) = 1, l ∉ Σ.
- `CompZeta.weight` (compatibility): Use the completed tensor W⊗\_{O\[\[K\_m\]\]}H̃^{BM}\_1\[1/p\] in NAK-v2 Prop. 3.17, not a plain tensor over O. It is identified with the indicated finite-level weight-k cohomology, and the induced zeta maps commute.
- `CompZeta.ext` (extensionality): The continuous limit map is determined by its finite-level compatible maps. Its weight maps retain the K\_m coinvariants.

**Unit tests.**

- `compZeta_weight_two` (degenerate): At k=2, W is the trivial representation, so tensoring over O\[\[K\_m\]\] takes K\_m-coinvariants and gives the finite-level comparison. It does not identify the entire infinite-level homology with a finite-level group by an ordinary tensor.
- `compZeta_norm_l_divides` (computation): For l | n, corestriction from level nl to n is the identity on the zeta morphism (no Euler factor).
- `compZeta_eisenstein_not_integral` (non-example): For j=0 and the trivial cyclotomic character, the augmentation of c²−c^{2−j}σ\_c is zero, so the smoothing element cannot be inverted integrally there. This rejects a universal unsmoothing-by-unit argument; it does not assert nonintegrality of every Eisenstein component.
- `compZeta_kato_agreement` (agreement): At finite level N and weight k the map agrees with KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes after removing the smoothing factors.

**Prerequisites.** `KatoEulerSystems:L2/full-level-hecke-linear-zeta-classes`, `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`, `KatoEulerSystems:L2/hecke-dual-twist-dictionary`, [`AutomorphicCongruences:L3/completed-homology-factorization`](#node-l3-completed-homology-factorization), `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

**Sources.**

- **NAK-v2**, §3.2 Prop. 3.8 (p. 48), Cors 3.10–3.11 (p. 52); §3.3 Cor. 3.14, Prop. 3.15 (p. 56); §3.4 Thm 3.16 (p. 60), Prop. 3.17 (p. 61) — statements: The equivariant zeta morphisms at finite level, their integrality after localization, the limit on completed homology and the weight comparison.

<a id="node-l3-nakamura-universal-zeta-morphism"></a>

#### Nakamura's universal zeta morphism

`AutomorphicCongruences:L3/nakamura-universal-zeta-morphism` (construction).

Atlas landmark: Nakamura's universal zeta morphism.

**Statement.** Let ρ̄: G\_ℚ → GL\_2(𝔽) satisfy (N1)–(N5) of L3/fw-residual-hypotheses (or (N1), (N3), (N4) with R\_{ρ̄,Σ} replaced by the promodular ring 𝕋\_{ρ̄,Σ}), with universal deformation ρ^u over R\_{ρ̄,Σ}. There is a family of R\_{ρ̄,Σ}-linear maps z\_{Σ,n}(ρ^u): (ρ^u)^* → H¹\_Iw(ℤ\[1/Σn, ζ\_n\], (ρ^u)^*(1)), n ≥ 1 prime to Σ, such that (i) z\_{Σ,n}(ρ^u)(τv) = σ\_{−1}z\_{Σ,n}(ρ^u)(v) for complex conjugation τ; (ii) Cor ∘ z\_{Σ,nl}(ρ^u) = z\_{Σ,n}(ρ^u) if l | n and P\_l(σ\_l^{-1})·z\_{Σ,n}(ρ^u) if (l, n) = 1; (iii) at every point x\_f of Spec R\_{ρ̄,Σ}(ℚ̄\_p) attached to a newform f, z\_{Σ,1}(f) = ∏\_{l∈Σ∖{p}} P\_{f,l}(σ\_l^{-1})·z(f) with P\_{f,l}(u) = det(1 − Frob\_l u | ρ\_f^{I\_l}) (Nakamura Thm 1.1, Cor. 4.2, Thm 4.3). Condition (i) makes z\_{Σ,n}(ρ^u) an R ⊗̂ Λ\_n-linear map on (ρ^u)^* ⊗̂\_{ℤ\_p\[±1\]} Λ\_n (Remark 1.2). It is defined by transporting z^{Iw}\_{Σ,n,ρ̄} along φ\_1 (L3/completed-homology-factorization), factoring out the projective envelope P̃ and applying the Whittaker functor Ψ\_{Σ\_0} at the primes of Σ\_0 (§4.1, Lemma 4.1).

**Hypotheses.**

- (N1)–(N5); FW's version (FW Thm 3.6) works under Assumptions 2.1 and 3.5 and removes p ≥ 5 via Paškūnas–Tung's generalization of the relevant local results (FW remark after Thm 3.6).

**Proof outline.**

1. Lemma 4.1: φ\_1 induces an isomorphism H¹\_Iw(ℤ\[1/Σ\_n, ζ\_n\], H̃^{BM}\_{1,ρ̄,Σ}(1)) ≅ (π^m\_p)^* ⊗̂ H¹\_Iw(ℤ\[1/Σ\_n, ζ\_n\], (ρ^m)^*(1) ⊗ B^m\_{Σ\_0}), via a perfect complex computing Iwasawa cohomology.
2. Remove the factor (π^m\_p)^* using Paškūnas's identification of P̃ with the dual of the universal deformation of π̄ (removing-projective-envelope), and apply the Whittaker functor to B^m\_{Σ\_0}, which is co-Whittaker so that Ψ\_{Σ\_0}(B) ≅ 𝕋 (§4.1).
3. Properties (i)–(ii) follow from Thm 3.16 (Cor. 4.2); (iii) is L3/nakamura-specialization-theorem.

**Checks.**

- It is the morphism FW call z\_Σ: T\_Σ(−1)^+ → H¹(ℤ\[1/Σ\], T\_Σ) (FW Thm 3.6) after the identifications of FW §3.2.1.

**Uses.**

- L3/zeta-trivialization: z\_Σ trivializes the fundamental line Δ\_Σ(T\_Σ)
- L4/zeta-morphism-congruences: congruent newforms have congruent Euler-corrected zeta morphisms because they are specializations of one z\_{Σ,n}(ρ^u)
- L4/residual-zeta-morphism: base change to 𝔽 gives z\_{Σ,n}(ρ̄)

**API.**

- `NakamuraZeta.map` (constructor): z\_{Σ,n}(ρ^u): (ρ^u)^* → H¹\_Iw(ℤ\[1/Σn, ζ\_n\], (ρ^u)^*(1)), R\_{ρ̄,Σ}-linear.
- `NakamuraZeta.conj` (characterisation): z(τv) = σ\_{−1}z(v); hence R ⊗̂ Λ\_n-linearity on (ρ^u)^* ⊗̂\_{ℤ\_p\[±1\]} Λ\_n.
- `NakamuraZeta.norm` (characterisation): The Euler-system norm relations in n.
- `NakamuraZeta.specialize` (compatibility): Base change along x: R\_{ρ̄,Σ} → A commutes with Iwasawa cohomology (perfect complexes) and gives z\_{Σ,n}(ρ\_x).
- `NakamuraZeta.changeSigma` (compatibility): For Σ ⊂ Σ′, z\_{Σ′,n}(ρ^m\_{Σ′}) ⊗ id = ∏\_{l∈Σ′∖Σ} P\_l(σ\_l^{-1})·z\_{Σ,n}(ρ^m\_Σ) (Nakamura (77)).
- `NakamuraZeta.classical` (characterisation): At a newform point, z\_{Σ,1}(f) = ∏\_{l∈Σ\_0} P\_{f,l}(σ\_l^{-1})·z(f) (Thm 4.3).
- `NakamuraZeta.ext` (extensionality): The map is uniquely specified by the equivariant completed-homology construction after the projective-envelope and Whittaker identifications; compatible changes of those identifications give the same transported morphism.

**Unit tests.**

- `nakamuraZeta_norm_coprime` (computation): For l ∉ Σ, (l, n) = 1, Cor ∘ z\_{Σ,nl} = P\_l(σ\_l^{-1})·z\_{Σ,n} with P\_l(u) = det(1 − Frob\_l u | ρ^u) of degree two in u.
- `nakamuraZeta_sigma_p_only` (degenerate): If Σ = {p} (ρ̄ unramified outside p), the Euler factor in NakamuraZeta.classical is empty and z\_{Σ,1}(f) = z(f).
- `nakamuraZeta_kato_point` (agreement): At a weight-two newform of an elliptic curve E of conductor N, the specialization is ∏\_{l | N} P\_{E,l}(σ\_l^{-1}) times Kato's zeta morphism of E (KatoEulerSystems:L2/nakamura-twisted-zeta-morphism).
- `nakamuraZeta_needs_irreducible` (non-example): For residually reducible ρ̄ (Eisenstein) the construction is not available: Emerton's factorization and Kato's Λ-freeness of H¹\_Iw are only known for absolutely irreducible ρ̄ (Nakamura Remark 1.2).

**Prerequisites.** [`AutomorphicCongruences:L3/equivariant-zeta-morphism-completed-homology`](#node-l3-equivariant-zeta-morphism-completed-homology), [`AutomorphicCongruences:L3/completed-homology-factorization`](#node-l3-completed-homology-factorization), [`AutomorphicCongruences:L3/universal-deformation-ring-structure`](#node-l3-universal-deformation-ring-structure), `PadicLocalLanglandsForGL2Qp:R30.5/removing-projective-envelope`, `PadicLocalLanglandsForGL2Qp:R30.5/dual-of-universal-deformation`, `SmoothRepresentationsOfLocalGroups:SR.5/universal-whittaker`, `SmoothRepresentationsOfLocalGroups:SR.5/co-whittaker`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

**Sources.**

- **NAK-v2**, Thm 1.1 and Remark 1.2, pp. 4–5; §4.1 (47)–(48), Lemma 4.1 and the construction, pp. 63–65; Cor. 4.2, p. 65: The universal zeta morphisms and their τ-equivariance and Euler-system relations (published §4.1, pp. 239–242).
- **FW-v3**, §3.2.1, Assumption 3.5 and Thm 3.6, p. 24: Fouquet–Wan's statement of Nakamura's theorem and the removal of p ≥ 5.

<a id="node-l3-nakamura-specialization-theorem"></a>

#### The universal zeta morphism specializes to Kato's

`AutomorphicCongruences:L3/nakamura-specialization-theorem` (theorem).

Atlas landmark: Specialization to Kato's zeta morphism.

**Statement.** Under the assumptions of Nakamura §4 ((N1), (N3), (N4)), for every modular point x\_f ∈ Spec(𝕋\_{ρ̄,Σ})(E) attached to a newform f ∈ S\_k(Γ\_1(N\_f))^{new} of weight k ≥ 2 and every n ≥ 1 prime to Σ, z\_{Σ,n}(f) = ∏\_{l∈Σ\_0} P\_{f,l}(σ\_l^{-1})·z\_n(f) as maps V′\_1(f)\_E → H¹\_Iw(ℤ\[1/Σn, ζ\_n\], V′\_1(f)\_E(1)) under V′\_1(f)\_E ≅ ρ\_f^* (55), where z\_n(f) is Kato's (Nakamura-twisted) zeta morphism and Σ\_0 = Σ ∖ {p}; the equality does not depend on the choice of (55) since End\_{E\[G\_ℚ\]}(ρ\_f) = E (Nakamura Thm 4.3, Remark 4.4). In particular the morphism specializes to the Kato class used in KatoEulerSystems:L3–L4.

**Hypotheses.**

- (N1), (N3), (N4); x\_f modular.

**Proof outline.**

1. Let τ be the Galois type of ρ\_f|\_{G\_{ℚ\_p}} and ⋄ = cr or st; x\_f factors through Kisin's potentially semistable (crystalline) quotient R^⋄\_p(k, τ) (Nakamura Thm 4.5).
2. Use NAK-v2 Cor. 4.8 and Prop. 4.9 with M^⋄(k,τ), the algebraic dual and σ^⋄(τ), tensoring over O\[\[K\_0\]\] with completed BM homology. The type/coinvariant construction is essential and is not the plain tensor with W from a trivial local type.
3. Under these identifications z\_{Σ,n}(f) is the base change of Ψ\_{Σ\_0}(z^{Iw}\_{Σ\_0,n,ρ̄}(k, σ^⋄(τ), −)); comparing motivic structures with Kato's construction (Nakamura §4.4, (68)–(78)) gives the equality with the Euler factors at Σ\_0.

**Checks.**

- The Euler factors at Σ\_0 are exactly those of NakamuraZeta.classical; dropping them would contradict the change-of-Σ formula (79).

**Prerequisites.** [`AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`](#node-l3-nakamura-universal-zeta-morphism), [`AutomorphicCongruences:L3/equivariant-zeta-morphism-completed-homology`](#node-l3-equivariant-zeta-morphism-completed-homology), `KatoEulerSystems:L2/nakamura-twisted-zeta-morphism`, `KatoEulerSystems:L2/rational-kato-zeta-morphism`, `LocalGaloisDeformationRings:R08.3/pst-deformation-ring`, `PadicLocalLanglandsForGL2Qp:R30.6/paskunas-bm-scalar-endomorphisms`, `PadicLocalLanglandsForGL2Qp:R30.6/kisin-local-inequality`, `PadicLocalLanglandsForGL2Qp:R30.5/kisin-deformation-comparison`.

**Sources.**

- **NAK-v2**, Thm 4.3 and Remark 4.4, PDF p. 66; Cor. 4.8 and Prop. 4.9, pp. 69–70; motivic comparison in §4.4, pp. 70–74: The specialization theorem and its proof through Kisin's and Paškūnas's results (published Thm 4.3 p. 243, proof pp. 249–253).
- **FW-v3**, Thm 3.6, p. 24: The diagram expressing that z\_Σ specializes to z(f)\_{Σ,Iw} at classical points.

**Open obligations.** nakamura-proofs. See the detailed list below.

<a id="node-l3-zeta-trivialization"></a>

#### The zeta trivialization of the fundamental line

`AutomorphicCongruences:L3/zeta-trivialization` (construction).

Atlas landmark: Zeta trivialization.

**Statement.** Let z\_Σ: T\_Σ(−1)^+ → H¹\_et(ℤ\[1/Σ\], T\_Σ) be Nakamura's zeta morphism (FW Thm 3.6). Since H²\_et(ℤ\[1/Σ\], T\_Σ) is torsion and H¹ has generic rank equal to that of T\_Σ(−1)^+ over 𝕋 (or over Λ), z\_Σ determines an injective trivialization triv\_{z\_Σ}: Δ\_Σ(T\_Σ) ↪ Q(𝕋^Σ\_{m\_ρ̄}), equivalently an isomorphism Δ\_Σ ≅ (x/y)𝕋 for an invertible fractional ideal (FW (1.2.1)); over Λ it gives triv\_{z\_Σ}: Δ\_Σ(T\_Σ) ↪ Frac Λ (Conj. 3.30's map). For every specialization λ: 𝕋 → R(𝔞) to a minimal prime and every classical point λ\_f: R(𝔞) → O\_Iw there are commutative diagrams relating triv\_{z\_Σ}, triv\_{z(𝔞)} and triv\_{z(f)\_Iw} (FW (1.2.2), (1.2.3), Props 3.22–3.23), and for Iwasawa-suitable λ the same holds for the full fundamental lines with Euler factors. The Λ-valued map is obtained by the determinant after restriction of scalars; it is the norm construction, not an identification Q(T)=Frac Λ. Define the dual trivialization t^∨ on Δ\_Σ^{-1}; if t^∨(Δ\_Σ^{-1})=αΛ then t(Δ\_Σ)=α^{-1}Λ. FW Prop. 5.5 proves integrality for this dual image.

**Hypotheses.**

- FW Assumptions 2.1, 3.5; the specializations in the diagrams with full lines are Iwasawa-suitable (Def. 3.19).

**Proof outline.**

1. Torsion of H² and the rank of H¹ over the total fraction ring (Kato's results at classical points, density) make Det^{-1}RΓ ⊗ Det^{-1}T(−1)^+ ⊗ Q(𝕋) canonically trivial once a generator of the image of z\_Σ is chosen.
2. Compatibility with base change (L3/fundamental-line) and with specialization of z\_Σ (L3/nakamura-specialization-theorem) gives the diagrams (FW Props 3.22–3.23).
3. Over Λ, view T\_Σ as a free Λ-module of rank 2d and repeat (FW proof of Prop. 5.5).

**Checks.**

- The universal main conjecture is the statement that the image of triv\_{z\_Σ} is 𝕋 (resp. Λ); over the non-factorial 𝕋 this cannot be deduced from pointwise statements, which is why the family statement is made over Λ.

**Uses.**

- L3/kato-generalized-main-conjecture: the conjectures assert the image of triv is the whole ring
- L4/integrality-of-universal-trivialization: FW Prop. 5.5 puts the image of the dual map on Δ^{-1} inside Λ
- L4/family-to-point-limit: the diagram at a classical point is the one used in the limit argument

**API.**

- `ZetaTriv.map` (constructor): triv\_{z\_Σ}: Δ\_Σ(T\_Σ) ↪ Q(𝕋), injective, image an invertible fractional ideal (x/y)𝕋.
- `ZetaTriv.overLambda` (constructor): Apply determinant after restricting the finite free T-representation to Λ; generically this is the determinant norm from the finite Λ-algebra. It does not identify its total fraction algebra with Frac Λ.
- `ZetaTriv.specialize` (compatibility): Diagram (1.2.2) for 𝕋 → R(𝔞) and (1.2.3) for R(𝔞) → O\_Iw.
- `ZetaTriv.full` (compatibility): For Iwasawa-suitable λ, the analogous diagram for the full lines Δ with Euler-factor lines X\_ℓ.
- `ZetaTriv.image` (projection): Keep t(Δ\_Σ)=α^{-1}Λ and t^∨(Δ\_Σ^{-1})=αΛ distinct. Both are unit lattices exactly when α∈Λ^×.
- `ZetaTriv.pointwise` (compatibility): At a classical point, triv\_{z(f)\_Iw} is Kato's trivialization of Δ(f)\_Iw (FW Thm 3.4).
- `ZetaTriv.ext` (extensionality): Two trivializations of the same invertible module agreeing after extension to the total fraction algebra agree; scalar extension uses the determinant norm.

**Unit tests.**

- `zetaTriv_unit_iff_mc` (characterisation): At a classical point with O\_Iw regular, triv\_{z(f)\_Iw}(Δ) = O\_Iw iff char H² = char(H¹/z(f)\_Iw) (Kato's main conjecture).
- `zetaTriv_eisenstein_excluded` (non-example): For residually reducible ρ̄ no z\_Σ is available and ZetaTriv.map is undefined.
- `zetaTriv_base_change_point` (computation): At the finite étale fiber used in FW Prop. 5.7, the dual αΛ specializes to the product of the dual pointwise lattices. The primal lattice specializes to the inverse product; this detects swapping Δ and Δ^{-1}.
- `zetaTriv_regular_vs_deformation_ring` (degenerate): If the deformation problem is unobstructed, 𝕋 = Λ is itself a power series ring and ZetaTriv.map and ZetaTriv.overLambda coincide.

**Prerequisites.** [`AutomorphicCongruences:L3/fundamental-line`](#node-l3-fundamental-line), [`AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`](#node-l3-nakamura-universal-zeta-morphism), [`AutomorphicCongruences:L3/nakamura-specialization-theorem`](#node-l3-nakamura-specialization-theorem), [`AutomorphicCongruences:L3/universal-deformation-ring-structure`](#node-l3-universal-deformation-ring-structure), `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `ModularIwasawaMainConjectures:L0/iwasawa-fundamental-line`.

**Sources.**

- **FW-v3**, §1.2.2 (1.2.1)–(1.2.3), pp. 13–14; §3.3 Props 3.22–3.23, p. 33; Conj. 3.30, p. 36: The trivialization defined by the zeta morphism and its compatibility diagrams.
- **FW-v3**, Def. 3.19, p. 31; Props 3.14–3.16, pp. 27–29: Iwasawa-suitable specializations.

<a id="node-l3-kato-generalized-main-conjecture"></a>

#### Kato's generalized main conjecture for the universal family and its specializations

`AutomorphicCongruences:L3/kato-generalized-main-conjecture` (definition).

**Statement.** For an Iwasawa-suitable λ:T→S, FW Conj. 3.25 is the proposition that the Σ-partial zeta trivialization on the cyclotomic deformation T\_{λ,Iw} has image S\_Iw in Q(S\_Iw). When S is a domain it also asserts the corresponding full-line trivialization Δ\_{S\_Iw}(T\_{λ,Iw})≅S\_Iw. The coefficient ring is S\_Iw, not S. At a classical point Conj. 3.24 is the full O\_Iw-line statement, equivalent to Kato’s characteristic-ideal equality. Conj. 3.27 states the minimal-component full-line assertion. Conj. 3.30 is the Σ-partial Λ-line statement for the regular subring Λ=O\[\[X\_1,X\_2,X\_3\]\]; Conj. 3.26 is the separate stronger assertion over T itself.

**Hypotheses.**

- The propositions are stated, not assumed; Λ-structure as in L3/universal-deformation-ring-structure.

**Proof outline.**

1. Define each conjecture as the proposition that the image of the corresponding trivialization is the unit fractional ideal.
2. Record the implications: Conj. 3.26 (over 𝕋) ⇒ Conj. 3.30 (over Λ) by restriction of scalars; Conj. 3.30 ⇒ Conj. 3.24 at classical points is FW Prop. 5.8 (L4/family-to-point-limit).

**Checks.**

- Distinguishes the regular-subring statement of FW Thm 1.8 from the stronger statement over the deformation ring (stage L4's requirement).

**Uses.**

- L4/fw-universal-family-theorem: proves Conj. 3.30
- L4/fw-pointwise-theorem: proves Conj. 3.24 at every classical point under FW Thm 5.1's hypotheses
- ModularIwasawaMainConjectures:L2/fw-pointwise-theorem: consumer restatement

**API.**

- `GenMC.point` (constructor): Conj. 3.25 for λ:T→S is the Σ-partial S\_Iw assertion, with its full-line version when S is a domain. At λ(f)\_Iw use Conj. 3.24 over O\_Iw.
- `GenMC.component` (constructor): Conj. 3.27 for R(𝔞).
- `GenMC.family` (constructor): Conj. 3.30 over Λ.
- `GenMC.familyOverT` (constructor): Conj. 3.26 over 𝕋, a separate and stronger proposition.
- `GenMC.familyOverT_imp_family` (relation): GenMC.familyOverT → GenMC.family.
- `GenMC.point_iff_kato` (equivalence): At a classical point, GenMC.point is Kato's main conjecture char H² = char(H¹/z(f)\_Iw) (ModularIwasawaMainConjectures:L0/zeta-basis-characteristic-equivalence).
- `GenMC.ext` (extensionality): These are propositions attached to a specified representation, zeta morphism and trivialization; isomorphisms preserving those data preserve the propositions.

**Unit tests.**

- `genMC_trivial_family` (degenerate): If 𝕋 = Λ (unobstructed), GenMC.familyOverT and GenMC.family are the same proposition.
- `genMC_point_kato` (agreement): For a weight-two GL₂-type abelian variety with L(A,1)≠0 and every hypothesis of FW Thm 5.1 satisfied, Cor. 5.4 deduces the p-part BSD formula from the full O\_Iw main conjecture. The L-value and residual hypotheses cannot be dropped.
- `genMC_fitting_not_enough` (non-example): For A=k\[\[x,y\]\], M=A/(x,y) has Fitt₀(M)=(x,y) but zero characteristic divisor. Its determinant comparison is divisorial; replacing the zeta-basis assertion by a bare Fitting containment confuses these different invariants.
- `genMC_component_vs_point` (characterisation): GenMC.component for 𝔞 implies GenMC.point at every classical point of R(𝔞) that is Iwasawa-suitable, by ZetaTriv.specialize.

**Prerequisites.** [`AutomorphicCongruences:L3/zeta-trivialization`](#node-l3-zeta-trivialization), [`AutomorphicCongruences:L3/fundamental-line`](#node-l3-fundamental-line), `ModularIwasawaMainConjectures:L0/kato-main-conjecture`, `ModularIwasawaMainConjectures:L0/zeta-basis-characteristic-equivalence`.

**Sources.**

- **FW-v3**, Conjs 3.24–3.27, p. 34; Conj. 3.30, p. 36; Conj. 1.5, p. 6; Thm 1.8, p. 8: The pointwise, minimal-prime and universal-family forms of Kato's generalized main conjecture.

<a id="layer-l4"></a>

### Layer L4: From seed points to the family and its specializations

The integral bound is on the dual line. An étale seed proves the family statement over the regular subring, and the limit argument reaches classical points ramified over that subring. The separate residual route records congruences and constancy of the λ-defect with its nonvanishing and integral image assumptions.

<a id="node-l4-integrality-of-universal-trivialization"></a>

#### The zeta trivialization over Λ is integral

`AutomorphicCongruences:L4/integrality-of-universal-trivialization` (theorem).

**Statement.** Under the hypotheses of FW Thm 5.1, let t\_Λ:Δ\_Σ(T\_Σ)↪Frac Λ be the zeta trivialization and t\_Λ^∨:Δ\_Σ(T\_Σ)^{-1}↪Frac Λ its dual. FW Prop. 5.5 gives t\_Λ^∨(Δ\_Σ^{-1})=αΛ with α∈Λ. Equivalently the primal image is α^{-1}Λ. This is an integrality bound on the dual lattice; equality with Λ still requires the seed-point argument.

**Hypotheses.**

- FW Thm 5.1's residual hypotheses; Λ = O\[\[X\_1, X\_2, X\_3\]\] factorial and regular.
- The integral Kato bound needs its actual lattice/image hypotheses at the chosen classical points; this is part of kato-integral-quotient-witness, not supplied by residual irreducibility alone.

**Proof outline.**

1. Suppose the image of Δ^{-1} is (x/y)Λ with x/y ∉ Λ; since Λ is factorial there is a height-one prime 𝔭 = (y\_0) containing y but not x.
2. By density (L3/smooth-classical-points) choose an Iwasawa-suitable λ\_Iw, étale over Λ, with λ(y\_0) ∈ m^n\_{O\_Iw} and λ(x) ∉ m^n for large n; at such a point T\_{λ,Iw} is a lattice in a direct sum of classical representations V\_{λ,r,Iw}.
3. Kato's one-sided divisibility at each classical point (KatoEulerSystems:L4/cohomological-divisibility-one-direction, integral where T\_{λ,Iw} has the needed image) gives t\_Λ^∨(Δ^{-1}) ⊆ O\_Iw at λ, contradicting λ(x/y) ∉ O\_Iw.

**Checks.**

- This uses only Kato's divisibility and density; Zariski density alone is not used to conclude that a rational section is an integral generator — the height-one prime argument over the factorial Λ is.

**Prerequisites.** [`AutomorphicCongruences:L3/zeta-trivialization`](#node-l3-zeta-trivialization), [`AutomorphicCongruences:L3/smooth-classical-points`](#node-l3-smooth-classical-points), [`AutomorphicCongruences:L3/universal-deformation-ring-structure`](#node-l3-universal-deformation-ring-structure), `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`, `mathlib:UniqueFactorizationMonoid`.

**Sources.**

- **FW-v3**, Prop. 5.5 and proof, pp. 70–71: The image of Δ\_Σ(T\_Σ)^{-1} lies in Λ, by a height-one prime of the factorial ring Λ and Kato's bound at well-chosen classical points.

<a id="node-l4-derived-specialization-corrections"></a>

#### Euler factors, Tor terms and the regular subring in specialization

`AutomorphicCongruences:L4/derived-specialization-corrections` (comparison).

**Statement.** For a specialization λ: A → A′ between quotients of 𝕋^Σ\_{m\_ρ̄} or Λ: (i) the Σ-partial fundamental line commutes with every base change, Δ\_Σ(T) ⊗ A′ ≅ Δ\_Σ(T′); (ii) the full fundamental line commutes with λ when λ is Iwasawa-suitable, the Euler-factor lines X\_ℓ(T) specializing to X\_ℓ(T′) because the ranks of inertia invariants and the eigenvalues α\_ℓ are preserved (FW Prop. 3.20); otherwise the rank of T^{I\_ℓ} can jump and the comparison acquires the factor relating X\_ℓ(T) ⊗ A′ and X\_ℓ(T′); (iii) Nakamura's change-of-Σ formula z\_{Σ′,n} ⊗ id = ∏\_{l∈Σ′∖Σ} P\_l(σ\_l^{-1})·z\_{Σ,n} matches the passage from Δ\_{Σ′} to Δ\_Σ with the Euler factors P\_l; (iv) a statement over the regular subring Λ (FW Thm 1.8) is a statement about T\_Σ as a Λ-module of rank 2d, and at a point x of Λ it is a statement about the product over all points of 𝕋 above x — it implies the statement over 𝕋 only at points étale over Λ, and at ramified points only through L4/family-to-point-limit.

**Hypotheses.**

- As stated; Iwasawa-suitable as in FW Def. 3.19.

**Proof outline.**

1. (i)–(ii): perfectness and derived base change of RΓ (FW Lemma 3.17), and the explicit two-term complexes defining X\_ℓ (FW Prop. 3.20's proof).
2. Use NAK-v2 change-of-Σ formula (77), p. 78, together with the H¹ isomorphism (78) and H² exact sequence (79), p. 80. These are different formulas and must not share a locator.
3. (iv): restriction of scalars along the finite free Λ → 𝕋 and the étale-point analysis of FW Props 5.7–5.8.

**Checks.**

- A change of stable lattice is handled by the determinant of its global and local correction cones, with the specified Euler terms. It is not summarized by one unspecified scalar index. Use the universal lattice and record a full cone comparison before transporting a zeta basis.

**Prerequisites.** [`AutomorphicCongruences:L3/fundamental-line`](#node-l3-fundamental-line), [`AutomorphicCongruences:L3/zeta-trivialization`](#node-l3-zeta-trivialization), [`AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`](#node-l3-nakamura-universal-zeta-morphism), `SelmerIwasawaCohomology:L3/derived-control`, `SelmerIwasawaCohomology:L3/correction-complex`, `SelmerIwasawaCohomology:L2/lattice-change-cone`.

**Sources.**

- **FW-v3**, Lemma 3.17, Prop. 3.20, pp. 31–32; Props 5.7–5.8, pp. 71–73; §1.2.2, p. 14: Base change of fundamental lines with and without Euler factors, and the role of points étale over Λ.
- **NAK-v2**, §5.3: (77), PDF p. 78; (78)–(79), p. 80: Change of Σ for the zeta morphism and for H²\_Iw.

<a id="node-l4-zeta-morphism-congruences"></a>

#### Congruences between Kato's zeta morphisms

`AutomorphicCongruences:L4/zeta-morphism-congruences` (theorem).

**Statement.** Let f, g be normalized newforms with coefficients in E, ρ̄\_f absolutely irreducible, and the assumptions of Nakamura §4 holding for ρ̄ = ρ̄\_f. If f ≡ g modulo ϖ^m (Hecke eigenvalues congruent at all but finitely many primes), then ∏\_{l∈Σ\_0} P\_{f,l}(σ\_l^{-1})·z\_n(f) ≡ ∏\_{l∈Σ\_0} P\_{g,l}(σ\_l^{-1})·z\_n(g) modulo ϖ^m as maps ρ^*\_{f,m} → H¹\_Iw(ℤ\[1/Σ\_n, ζ\_n\], ρ^*\_{f,m}(1)) (Nakamura Cor. 5.6).

**Hypotheses.**

- Nakamura §4 assumptions ((N1), (N3), (N4)); Σ containing the levels of f and g and p.

**Proof outline.**

1. x\_f and x\_g are points of the same Spec 𝕋\_{ρ̄,Σ} that agree modulo ϖ^m (the printed ϖ^n in the proof is ϖ^m, PAPER-NAKAMURA-23/E11).
2. Both Euler-corrected zeta morphisms are specializations of the one universal z\_{Σ,n}(ρ^m) (L3/nakamura-specialization-theorem), so they agree modulo ϖ^m.

**Checks.**

- This is the congruence of zeta morphisms that propagates Kato's main conjecture along congruences (L4/nakamura-lambda-defect).

**Prerequisites.** [`AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`](#node-l3-nakamura-universal-zeta-morphism), [`AutomorphicCongruences:L3/nakamura-specialization-theorem`](#node-l3-nakamura-specialization-theorem).

**Sources.**

- **NAK-v2**, Cor. 5.6, p. 77 (published §5.2, Cor. 5.6, pp. 255–256): Congruent newforms have congruent Euler-corrected zeta morphisms.

<a id="node-l4-etale-point-descent"></a>

#### From pointwise main conjectures at an étale point to the family over Λ

`AutomorphicCongruences:L4/etale-point-descent` (theorem).

**Statement.** Suppose there is a point x: Λ → O at which Spec 𝕋^Σ\_{m\_ρ̄} → Spec Λ is étale and every point ψ: 𝕋 → O above x satisfies Kato's main conjecture (FW Conj. 3.24). Then triv\_{z\_Σ}: Δ\_Σ(T\_Σ) ↪ Frac(Λ) is an isomorphism onto Λ (FW Prop. 5.7).

**Hypotheses.**

- As stated; all λ\_Iw above x are Iwasawa-suitable because of étaleness.

**Proof outline.**

1. Use the dual trivialization of integrality-of-universal-trivialization, with image αΛ and α∈Λ.
2. Specialize along x\_Iw: by the base-change diagram (FW Prop. 3.23; L3/zeta-trivialization), x\_Iw(α)O\_Iw is the product over ψ ∈ S\_x of the pointwise images, each O\_Iw by hypothesis, so x\_Iw(α) is a unit.
3. An element of the local ring Λ whose specialization is a unit is a unit; hence αΛ = Λ.

**Checks.**

- Every invertible module over the local deformation ring is abstractly free. The issue is the prescribed rational zeta trivialization: its lattice need not be the unit lattice. FW proves the needed integrality over the factorial regular subring Λ, then uses the finite étale fiber and its determinant norm to prove α is a unit.

**Prerequisites.** [`AutomorphicCongruences:L4/integrality-of-universal-trivialization`](#node-l4-integrality-of-universal-trivialization), [`AutomorphicCongruences:L3/zeta-trivialization`](#node-l3-zeta-trivialization), [`AutomorphicCongruences:L3/kato-generalized-main-conjecture`](#node-l3-kato-generalized-main-conjecture), `mathlib:IsLocalRing`.

**Sources.**

- **FW-v3**, Prop. 5.7 and proof, pp. 71–72: An étale point all of whose preimages satisfy the pointwise conjecture forces the family conjecture over Λ.

<a id="node-l4-residual-zeta-morphism"></a>

#### The residual zeta morphism and the space of points X(ρ̄)

`AutomorphicCongruences:L4/residual-zeta-morphism` (construction).

**Statement.** Let Σ\_ρ̄ = {p} ∪ ram(ρ̄). For Σ\_ρ̄ ⊆ Σ ⊆ Σ′, ρ^m\_{Σ′} ⊗ 𝕋\_{ρ̄,Σ} ≅ ρ^m\_Σ and z\_{Σ′,n}(ρ^m\_{Σ′}) ⊗ id = ∏\_{l∈Σ′∖Σ} P\_l(σ\_l^{-1})·z\_{Σ,n}(ρ^m\_Σ) (Nakamura (77)). The residual zeta morphism z\_{Σ,n}(ρ̄) is the base change of z\_{Σ,n}(ρ^m) to 𝔽, a Λ\_{n,𝔽}-linear map ρ̄^* ⊗\_{𝔽\[±1\]} Λ\_{n,𝔽} → H¹\_Iw(ℤ\[1/Σn, ζ\_n\], ρ̄^*(1)). Put X(ρ̄) = ∪\_Σ Spec(𝕋\_{ρ̄,Σ})(ℤ̄\_p) with its modular points X(ρ̄)^{mod}, and for a character η of Δ = Gal(ℚ(ζ\_p)/ℚ) consider η-components over Λ^η.

**Hypotheses.**

- Nakamura §4 assumptions; absolute irreducibility of ρ̄.

**Proof outline.**

1. Base change of z\_{Σ,n}(ρ^m) along 𝕋\_{ρ̄,Σ} → 𝔽, using that H¹\_Iw is computed by a perfect complex.
2. Compatibility with change of Σ from (77).

**Checks.**

- The residual morphism carries the information of the whole family: its nonvanishing is equivalent to µ = 0 at one, hence every, modular point (L4/nakamura-residual-structure).

**Uses.**

- L4/nakamura-residual-structure: Thms 5.7, 5.9, 5.11 (published numbering) are statements about z\_{Σ,1}(ρ̄)^η
- L4/nakamura-lambda-defect: the λ-defect at every point equals the residual defect

**API.**

- `ResZeta.map` (constructor): z\_{Σ,n}(ρ̄): ρ̄^* ⊗\_{𝔽\[±1\]} Λ\_{n,𝔽} → H¹\_Iw(ℤ\[1/Σn, ζ\_n\], ρ̄^*(1)).
- `ResZeta.changeSigma` (compatibility): z\_{Σ′,n}(ρ̄) = ∏\_{l∈Σ′∖Σ} P̄\_l(σ\_l^{-1})·z\_{Σ,n}(ρ̄) for Σ\_ρ̄ ⊆ Σ ⊆ Σ′.
- `ResZeta.points` (data): X(ρ̄) = ∪\_Σ Spec(𝕋\_{ρ̄,Σ})(ℤ̄\_p) and the modular subset X(ρ̄)^{mod}.
- `ResZeta.etaPart` (projection): The η-component z\_{Σ,1}(ρ̄)^η for a character η of Δ.
- `ResZeta.reduction` (compatibility): For x ∈ X(ρ̄), z\_{Σ,1}(ρ\_x) mod ϖ = z\_{Σ,1}(ρ̄).
- `ResZeta.ext` (extensionality): The residual map is the reduction of the universal map; compatible coefficient and Σ maps give the same reduction. Equality is tested on the residual source module, with its η projection.

**Unit tests.**

- `resZeta_reduction_of_point` (agreement): For x\_f modular, z\_{Σ,1}(ρ̄) is the reduction modulo ϖ of ∏\_{l∈Σ\_0}P\_{f,l}(σ\_l^{-1})·z(f) (Thm 4.3 mod ϖ).
- `resZeta_minimal_sigma` (degenerate): For Σ = Σ\_ρ̄, ResZeta.changeSigma is the identity.
- `resZeta_vanishing_iff_mu` (characterisation): z\_{Σ\_ρ̄,1}(ρ̄)^η ≠ 0 iff µ(H¹\_Iw/Im z\_1(f)^η) = 0 at one (equivalently every) modular point (Nakamura Thm 5.7).
- `resZeta_not_kato_lattice` (non-example): The residual Euler element 1−γ in F\[\[γ−1\]\] equals −(γ−1): it is nonzero and is not a unit. Therefore an Euler-corrected residual map cannot be replaced by the uncorrected Kato map by discarding this factor, even though the formal factor has not vanished.

**Prerequisites.** [`AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`](#node-l3-nakamura-universal-zeta-morphism), [`AutomorphicCongruences:L4/derived-specialization-corrections`](#node-l4-derived-specialization-corrections), `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

**Sources.**

- **NAK-v2**, §5.3, (77) and the residual definitions, PDF p. 78; Thm 5.7, p. 79: The residual zeta morphism, change of Σ, and the points X(ρ̄).

<a id="node-l4-fw-universal-family-theorem"></a>

#### Fouquet–Wan's universal-family main conjecture

`AutomorphicCongruences:L4/fw-universal-family-theorem` (theorem).

Atlas landmark: Fouquet–Wan universal-family theorem.

**Statement.** Let p ≥ 3 and ρ̄: G\_ℚ → GL\_2(𝔽) satisfy the hypotheses of FW Thm 5.1 (absolutely irreducible; (ρ̄|\_{G\_{ℚ\_p}})^{ss} ≠ χ̄ ⊕ χ̄χ̄\_cyc; a prime ℓ ∤ p with ρ̄|\_{G\_{ℚ\_ℓ}} a ramified extension of µχ^{−k/2}\_cyc by µχ^{1−k/2}\_cyc, µ unramified and nontrivial if ρ̄|\_{G\_{ℚ\_p}} is irreducible). For Σ finite, viewing the universal deformation T\_Σ as a free module over Λ ≅ O\[\[X\_1, X\_2, X\_3\]\], the zeta morphism z\_Σ induces an isomorphism triv\_{z\_Σ}: Δ\_Σ(T\_Σ) ≅ Λ (FW Thm 5.2 = Thm 1.8; Kato's Conjecture 3.2.2 for (Spec ℤ\[1/Σ\], Λ, T\_Σ)). The statement is over the regular subring Λ; the stronger statement over 𝕋 ≅ R\_Σ(ρ̄) itself is not asserted.

**Hypotheses.**

- FW Thm 5.1’s T51 residual hypotheses. For the even-weight Γ₀ modular normalization, the scalar local semisimplification is automatically excluded by the determinant parity argument of FW p. 69; see fw-pointwise-theorem.
- The proof imports the ordinary/crystalline seed targets, whose general-weight nonvanishing, regulator and integral Kato-witness gaps remain explicit. No stronger theorem over the nonfactorial deformation ring is asserted.

**Proof outline.**

1. Find a seed point: by FW Lemma 2.8 (L3/smooth-classical-points) there is a classical point that is crystalline-short, crystalline-short up to the quadratic twist ω^{(p−1)/2}, good ordinary, or good ordinary up to quadratic twist.
2. At such a point Kato's main conjecture holds (FW Prop. 5.6): crystalline-short points by L2/fw-crystalline-main-conjecture (Thm 4.51), ordinary points by the ordinary theorem — the ordinary seed is the equality of ModularIwasawaMainConjectures:L1/fw-ordinary-theorem, which combines L2/fw-ordinary-reverse-bound with Kato's bound; twists are handled in the same way.
3. Points near the seed that are étale over Λ and of the same type satisfy the pointwise conjecture; apply L4/etale-point-descent.

**Checks.**

- Exported to ModularIwasawaMainConjectures:L4/fw-universal-family-theorem; the determinant over Λ must not be read as a statement over the deformation ring.

**Prerequisites.** [`AutomorphicCongruences:L4/etale-point-descent`](#node-l4-etale-point-descent), [`AutomorphicCongruences:L4/integrality-of-universal-trivialization`](#node-l4-integrality-of-universal-trivialization), [`AutomorphicCongruences:L3/smooth-classical-points`](#node-l3-smooth-classical-points), [`AutomorphicCongruences:L3/kato-generalized-main-conjecture`](#node-l3-kato-generalized-main-conjecture), [`AutomorphicCongruences:L2/fw-crystalline-main-conjecture`](#node-l2-fw-crystalline-main-conjecture), [`AutomorphicCongruences:L2/fw-ordinary-reverse-bound`](#node-l2-fw-ordinary-reverse-bound), `ModularIwasawaMainConjectures:L1/fw-ordinary-theorem`.

**Sources.**

- **FW-v3**, Thm 5.2, p. 69; Thm 1.8, p. 8; Prop. 5.6, p. 71; proof of Thm 5.1, p. 73: The universal-family isomorphism over Λ and its proof from a seed point of known type.

<a id="node-l4-nakamura-residual-structure"></a>

#### Residual nonvanishing, µ = 0 and the structure of residual Iwasawa cohomology

`AutomorphicCongruences:L4/nakamura-residual-structure` (theorem).

**Statement.** Fix a character η of Δ. (i) The following are equivalent: z\_{Σ\_ρ̄,1}(ρ̄)^η ≠ 0; µ(H¹\_Iw(ℤ\[1/Σ\_f\], ρ\_f^*(1))^η/Im(z\_1(f)^η)) = 0 for some x\_f ∈ X(ρ̄)^{mod}; the same for all x\_f ∈ X(ρ̄)^{mod} (Nakamura Thm 5.7; the published version adds Conj. 5.8 that these always hold). (ii) Assume X(ρ̄)^{mod}\_a ≠ ∅ (modular points with Nakamura's condition (a)) and (i) holds for η. Then H¹\_Iw(ℤ\[1/Σ\_ρ̄\], ρ̄^*(1))^η is free of rank one over Λ^η\_𝔽, and H¹\_Iw/Im(z\_{Σ\_ρ̄,1}(ρ̄)^η) and H²\_Iw(ℤ\[1/Σ\_ρ̄\], ρ̄^*(1))^η are finite-dimensional (arXiv Thm 5.8 = published Thm 5.9); the η-part of Kato's main conjecture for ρ̄ is the equality of their dimensions (arXiv Conj. 5.9 = published 5.10). (iii) For every x ∈ Spec(𝕋\_{ρ̄,Σ})(O) ⊂ X(ρ̄): H¹\_Iw(ℤ\[1/Σ\], ρ\_x^*(1))^η is free of rank one over Λ^η\_O; the quotient by Im z\_{Σ,1}(ρ\_x)^η and H²\_Iw are torsion with µ = 0; and if x is modular, or there is τ ∈ Gal(ℚ̄/ℚ(ζ\_{p^∞})) with (ρ\_x/(τ−1)ρ\_x)\[1/p\] one-dimensional, then Char(H¹\_Iw/Im z^η) ⊆ Char(H²\_Iw^η) (arXiv Thm 5.10 = published Thm 5.11).

**Hypotheses.**

- Nakamura §4 assumptions. In (ii)–(iii), assume both residual nonvanishing in the selected η-component and existence of a modular point satisfying condition (a) of NAK-v2 Thm 5.2: there is τ∈Gal(Q̄/Q(ζ\_p∞)) such that ρ\_f/(τ−1)ρ\_f is O-free of rank one. A quotient of rational dimension one alone does not meet this integral condition.
- Under these inputs, rank-one freeness, torsion and µ=0 hold at all promodular points. The characteristic-ideal containment in (iii) additionally needs modularity or the weaker rational condition (b); do not infer it at every promodular point.

**Proof outline.**

1. (i): the mod-ϖ exact sequences relating H¹\_Iw(ρ\_f^*(1))/ϖ and H¹\_Iw(ρ̄^*(1)), freeness of H¹\_Iw (Kato Thm 12.4(3)) and L4/zeta-morphism-congruences.
2. (ii): Kato's theorem 5.2 at a point of X^{mod}\_a gives the rank and finiteness; descend modulo ϖ.
3. (iii): lift freeness and torsion from the residual statement; µ = 0 from (i); the divisibility from the Euler system bound (EulerSystemsAndKolyvaginSystems:ES.8 / KatoEulerSystems:L4) under the image condition.

**Checks.**

- Residual nonvanishing and the integral condition-(a) modular witness are hypotheses. The theorem does not prove unconditional µ=0. The published additional conjecture of nonvanishing is absent from arXiv v2.

**Prerequisites.** [`AutomorphicCongruences:L4/residual-zeta-morphism`](#node-l4-residual-zeta-morphism), [`AutomorphicCongruences:L4/zeta-morphism-congruences`](#node-l4-zeta-morphism-congruences), `KatoEulerSystems:L4/rational-iwasawa-module-structure`, `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`.

**Sources.**

- **NAK-v2**, Thm 5.2(a),(b), PDF p. 75; Thms 5.7–5.8, Conj. 5.9 and Thm 5.10, p. 79; proofs pp. 80–84 (published numbers after 5.7 are shifted by one): Residual nonvanishing versus µ = 0, and the structure of residual and pointwise Iwasawa cohomology.

<a id="node-l4-family-to-point-limit"></a>

#### From the family over Λ to every classical point

`AutomorphicCongruences:L4/family-to-point-limit` (theorem).

**Statement.** Assume the family Σ-partial trivialization is an isomorphism over Λ. FW Prop. 5.8 gives the corresponding Σ-partial trivialization at every classical point, including points ramified over Λ. Its morphism is the Euler-corrected z\_Σ(f)\_Iw. With the full-line local correction comparison of §§3.3–3.4 this yields Conj. 3.24 for the full line and Kato’s z(f)\_Iw. Keep these two lines and their morphisms distinct; a specialized Euler factor that vanishes cannot simply be cancelled.

**Hypotheses.**

- As stated; the Σ-partial lines and the Euler-factor-corrected morphisms are used, which both commute with specialization at a classical point even if it is ramified over Λ.

**Proof outline.**

1. Kato’s bound puts the dual pointwise lattice in O\_Iw, say γO\_Iw with γ∈O\_Iw. The primal lattice is then γ^{-1}O\_Iw.
2. Over 𝕋 write the image of Δ\_Σ as (α/β)𝕋 with λ(f)\_Iw(β) ≠ 0 (FW Prop. 3.23).
3. Choose λ close to λ(f), outside the zero set of β, étale over Λ with all points above Iwasawa-suitable; the family isomorphism forces each pointwise γ\_ψ to be a unit there, so λ\_Iw(α/β) is a unit.
4. By continuity, taking λ close to λ(f), 1/γ = λ(f)\_Iw(α/β) is a unit.

**Checks.**

- A specialization at which a value vanishes is never cancelled: the argument avoids the zero set of β and works with the Euler-factor-corrected lines.

**Prerequisites.** [`AutomorphicCongruences:L4/fw-universal-family-theorem`](#node-l4-fw-universal-family-theorem), [`AutomorphicCongruences:L3/zeta-trivialization`](#node-l3-zeta-trivialization), [`AutomorphicCongruences:L3/smooth-classical-points`](#node-l3-smooth-classical-points), [`AutomorphicCongruences:L3/fundamental-line`](#node-l3-fundamental-line), `KatoEulerSystems:L4/cohomological-divisibility-one-direction`.

**Sources.**

- **FW-v3**, Prop. 5.8 and proof, pp. 72–73: The limit argument: family isomorphism over Λ implies the pointwise main conjecture at every classical point.

<a id="node-l4-nakamura-lambda-defect"></a>

#### The λ-defect is constant on the family and Kato's main conjecture propagates along congruences

`AutomorphicCongruences:L4/nakamura-lambda-defect` (theorem).

**Statement.** Under the assumptions of L4/nakamura-residual-structure (ii), for every x ∈ X(ρ̄): λ(H¹\_Iw(ℤ\[1/Σ\], ρ\_x^*(1))^η/Im z\_{Σ,1}(ρ\_x)^η) − λ(H²\_Iw(ℤ\[1/Σ\], ρ\_x^*(1))^η) equals dim\_𝔽(H¹\_Iw(ℤ\[1/Σ\_ρ̄\], ρ̄^*(1))^η/Im z\_{Σ\_ρ̄,1}(ρ̄)^η) − dim\_𝔽 H²\_Iw(ℤ\[1/Σ\_ρ̄\], ρ̄^*(1))^η, hence is independent of x (arXiv Thm 5.13 = published Thm 5.14); consequently the η-part of Kato's main conjecture for ρ̄ holds iff the weak (λ-) version holds for some x iff it holds for all x (arXiv Cor. 5.14 = published Cor. 5.15). In particular (Nakamura Thm 1.4): if g\_1, g\_2, g\_3 are congruent to f with (1) some τ ∈ Gal(ℚ̄/ℚ(ζ\_{p^∞})) making ρ\_{g\_1}/(τ − 1)ρ\_{g\_1} free of rank one over O, (2) µ = 0 for g\_2, and (3) Kato's main conjecture for g\_3, then µ = 0 and Kato's main conjecture hold for f.

**Hypotheses.**

- As in L4/nakamura-residual-structure; the proof's last display prints H¹ for H² (PAPER-NAKAMURA-23/E12, corrected).

**Proof outline.**

1. For a module with µ = 0, λ(M) = λ\_𝔽(M/ϖ) − λ\_𝔽(M\[ϖ\]) (Nakamura (92)); apply it to H¹\_Iw/Im z and to H²\_Iw and use the residual comparison (91).
2. Constancy gives the equivalence of weak λ-equality at some/all promodular points and the residual equality. Full characteristic-ideal equality additionally uses the one-sided containment, available for modular points or those satisfying condition (b) of Thm 5.2; it is not asserted at every promodular point merely from equal λ-invariants.
3. Thm 1.4 is the specialization of these statements to modular points, as in Kim–Lee–Ponsinet.

**Checks.**

- Gives the pointwise consequences of the universal zeta element that stage L4 owns (Nakamura §5); the conjectures are recorded as propositions, not assumed.

**Prerequisites.** [`AutomorphicCongruences:L4/nakamura-residual-structure`](#node-l4-nakamura-residual-structure), [`AutomorphicCongruences:L4/zeta-morphism-congruences`](#node-l4-zeta-morphism-congruences), `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`, `ModularIwasawaMainConjectures:L0/kato-main-conjecture`.

**Sources.**

- **NAK-v2**, Thm 5.13 and Cor. 5.14, PDF p. 80; proof pp. 80–84; Thm 1.4, pp. 6–7 (published Thm 5.14/Cor. 5.15): Constancy of the λ-defect, equivalence of the residual and pointwise main conjectures, and propagation along congruences.

<a id="node-l4-fw-pointwise-theorem"></a>

#### Fouquet–Wan's main conjecture at every point of the family

`AutomorphicCongruences:L4/fw-pointwise-theorem` (theorem).

Atlas landmark: Fouquet–Wan pointwise theorem.

**Statement.** Let p ≥ 3 and f ∈ S\_k(Γ\_0(Np^r)) a normalized eigencuspform of weight k ≥ 2 whose residual representation satisfies the hypotheses of FW Thm 5.1 (L3/fw-residual-hypotheses, T51), with the auxiliary prime ℓ satisfying ℓ ∥ N. Then the zeta morphism gives an isomorphism triv\_{z(f)\_Iw}: Δ\_{O\_Iw}(T(f)\_Iw) ≅ O\_Iw (FW Thm 5.1; Thm 1.7 is its narrower nontrivial-µ formulation); equivalently char\_{Λ\_Iw}H²(ℤ\[1/p\], T ⊗ Λ\_Iw) = char\_{Λ\_Iw}H¹(ℤ\[1/p\], T ⊗ Λ\_Iw)/Λ\_Iw·z(f)\_Iw. This covers non-ordinary and bad-reduction points at p (π(f)\_p principal series, Steinberg or supercuspidal) and needs no µ-invariant hypothesis. Consequences: Sel\_ℚ(f) is finite iff L(f, k/2) ≠ 0 (Cor. 5.3), and for an abelian variety of GL\_2-type with L(A,1) ≠ 0 satisfying the hypotheses, the p-part of the BSD formula holds (Cor. 5.4).

**Hypotheses.**

- All hypotheses of FW Thm 5.1, including the global Γ₀ form, even k, and ℓ∥N. The Thm 1.7 formulation additionally requires µ nontrivial even in the reducible-at-p case.
- The scalar local semisimplification is automatically impossible: det ρ̄\_f|I\_p=ω^{k−1} with k−1 odd; a scalar semisimplification would give ω^{2a} for some integer a, contradicting 2a≡k−1 mod p−1 because p is odd. Thus no additional scalar exclusion is missing from the displayed theorem (FW p. 69).
- For the normalized residual representation in the proof on p. 73, the ramified Steinberg witness also excludes quadratic-induced restriction exceptions: its nontrivial unipotent p-element cannot occur in an induction from the index-two quadratic cyclotomic field, since ℓ≠p is unramified there and prime-to-p characters have no such inertia image. Together with the local exclusion, this supplies the A21/A35 dictionary; preserve the source’s critical twist.

**Proof outline.**

1. Use the determinant-parity and Steinberg-witness arguments in the hypotheses to pass to the normalized residual datum of FW p. 73. The consumer’s alleged scalar-hypothesis source issue should be rejected, not propagated.
2. Apply L4/fw-universal-family-theorem to ρ̄\_f.
3. Apply L4/family-to-point-limit at λ(f) (FW proof of Thm 5.1, p. 73).
4. Translate the fundamental-line statement into characteristic ideals over the regular O\_Iw (L3/kato-generalized-main-conjecture, GenMC.point\_iff\_kato).

**Checks.**

- Exported to ModularIwasawaMainConjectures:L2/fw-pointwise-theorem in the cohomological (Kato) form; the signed or ordinary scalar versions are the consumer's, after its separate local comparison.

**Prerequisites.** [`AutomorphicCongruences:L4/fw-universal-family-theorem`](#node-l4-fw-universal-family-theorem), [`AutomorphicCongruences:L4/family-to-point-limit`](#node-l4-family-to-point-limit), [`AutomorphicCongruences:L3/kato-generalized-main-conjecture`](#node-l3-kato-generalized-main-conjecture), [`AutomorphicCongruences:L3/fw-residual-hypotheses`](#node-l3-fw-residual-hypotheses), `ModularIwasawaMainConjectures:L0/zeta-basis-characteristic-equivalence`.

**Sources.**

- **FW-v3**, Thm 5.1, p. 68; Thm 1.7, p. 7; Cors 5.3–5.4, p. 69; proof of Thm 5.1, p. 73: The pointwise main conjecture for all eigencuspforms with the residual hypotheses, and its corollaries.
- **FW-v3**, Remark after Thm 5.1, PDF p. 69; proof of Thm 5.1, p. 73: Automatic scalar exclusion by odd cyclotomic determinant and the normalized residual representation used in the proof.

<a id="layer-l5a"></a>

### Layer L5a: The early BCS product input

The quartic-CM engine is L5w, referenced by exact nodes below. Quadratic restriction and analytic factorization produce a product bound over K; the ordinary Perrin–Riou/Greenberg equivalence and μ=0 upgrade give the early integral Proposition 5.2.1 bound. This is available as a target before either L5b or the Heegner anticyclotomic endpoint. The auxiliary-field narrow-Δ refinement and the BSTW supplier remain explicit obligations.

<a id="node-l5a-ordinary-two-variable-equivalence"></a>

#### Interface: the ordinary two-variable Perrin-Riou/Greenberg equivalence (BCS Theorem 4.1.3, Corollary 4.1.4)

`AutomorphicCongruences:L5a/ordinary-two-variable-equivalence` (comparison).

**Statement.** Let g ∈ S\_2(Γ\_0(N)) be an elliptic newform, p ∤ 2N an ordinary prime for g, and K imaginary quadratic with p split (spl), (D\_K, N) = 1 and ρ̄\_g irreducible over G\_K (irr\_K). The following are equivalent: (i) X\_ord(g/K\_∞) is Λ\_K-torsion and (L^{PR}\_p(g/K)) ⊇ ch\_{Λ\_K}(X\_ord(g/K\_∞)) in Λ\_K ⊗ ℚ\_p; (ii) X\_Gr(g/K\_∞) is Λ\_K-torsion and (L^{Gr}\_p(g/K)) ⊇ ch\_{Λ\_K}(X\_Gr(g/K\_∞)) in Λ^{ur}\_K ⊗ ℚ\_p; the same holds for the opposite divisibilities and before inverting p (BCS Thm 4.1.3, from BSTW §9.3.2). For two newforms g, g′ with p ∤ 2NN′ ordinary for both and K satisfying (spl), (D\_K, NN′) = 1 and (irr\_K) for both, the product statements (L^{PR}\_p(g/K)·L^{PR}\_p(g′/K)) ⊇ ch(X\_ord(g/K\_∞))·ch(X\_ord(g′/K\_∞)) and (L^{Gr}\_p(g/K)·L^{Gr}\_p(g′/K)) ⊇ ch(X\_Gr(g/K\_∞))·ch(X\_Gr(g′/K\_∞)) are equivalent, in either direction (BCS Cor. 4.1.4). This node states the exact contract L5a consumes; its proof (the ordinary BSTW two-variable zeta element, both explicit reciprocity laws, and the two four-term Poitou–Tate sequences) belongs to the planned owner KatoEulerSystems L5 of RS-11, which does not yet exist.

**Hypotheses.**

- BCS Thm 4.1.3 has (irr\_K), which implies H⁰(K,g\[p\])=0 and hence the van\_K condition needed in the integral comparison. The source asserts both directions, including the integral version under these hypotheses. No claim is made about what survives if van\_K is removed outside this setting.
- BCS cite the theorem as Proposition 4.1.3 in the proof of Prop. 5.2.1; it is Thm 4.1.3 in v2 (RT-AREA-iwasawa-1/29).

**Proof outline.**

1. Writing H for the rank-one global module, Z for the two-variable zeta class and X\_st for the strict Selmer dual, the two Poitou–Tate sequences give ch(H/ΛZ)·ch(X\_Gr) = (L\_Gr)·ch(X\_st) and ch(H/ΛZ)·ch(X\_ord) = (L\_PR)·ch(X\_st) after the unramified coefficient extension, using both explicit reciprocity laws (RS-11 handoff).
2. Prove rank one, torsion and nonvanishing of the terms before cancelling; this gives ch(X\_Gr)·(L\_PR) = ch(X\_ord)·(L\_Gr), hence both directions of the equivalence.
3. Cor. 4.1.4: direct sums of the two pairs of sequences for g and g′.

**Checks.**

- Does not use the anticyclotomic Theorem 4.2.1, which belongs to HeegnerPointEulerSystems:HE.8/HE.8b.

**Prerequisites.** `KatoEulerSystems:L4`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`.

**Sources.**

- **BCS-v2**, Thm 4.1.3 and proof, Cor. 4.1.4, p. 8: Equivalence of the two-variable Perrin-Riou and Greenberg main conjectures from the BSTW two-variable zeta element, in both directions and before inverting p, and its two-form product version.

**Open obligations.** ordinary-bstw-owner. See the detailed list below.

<a id="node-l5a-quartic-cm-selmer-restriction"></a>

#### Restricting the quartic-CM characteristic ideal to K

`AutomorphicCongruences:L5a/quartic-cm-selmer-restriction` (theorem).

**Statement.** Let g ∈ S\_2(Γ\_0(N)) be an elliptic newform, p > 3 a good ordinary prime with ρ̄\_g irreducible, F a real quadratic field, K imaginary quadratic, M = FK the quartic CM field, K̃\_∞ = FK\_∞, Λ̃\_K = O\[\[Gal(K̃\_∞/M)\]\] ≅ Λ\_K and π\_K: Λ\_M → Λ̃\_K ≅ Λ\_K induced by Gal(M\_∞/M) ↠ Gal(K̃\_∞/M). Then π\_K(ch\_{Λ\_M}(X\_ord(g/M\_∞))) ⊇ ch\_{Λ\_K}(X\_ord(g/K\_∞))·ch\_{Λ\_K}(X\_ord(g^F/K\_∞)) in Λ\_K, where g^F is the twist of g by the quadratic character of F/ℚ (BCS Lemma 5.1.1).

**Hypotheses.**

- As in BCS §5; the containment is integral and in the stated direction only.

**Proof outline.**

1. Use control at I\_K to identify the restricted quartic Selmer module with the corresponding module over M with coefficients T\_g⊗Λ̃\_K^∨. Shapiro then identifies it with the direct sum of the two Selmer modules over K for T\_g and T\_g⊗η\_F; the right-hand cohomology groups are over K, not M as printed in BCS p. 9. The quadratic character η\_F is trivial on G\_M.
2. Restriction from M to K of a module induced along Gal(M/K) ≅ Gal(F/ℚ) splits by the characters of Gal(M/K) (Shapiro).
3. SU Cor. 3.8 (journal): π\_K(ch\_{Λ\_M}(X)) ⊇ ch\_{Λ\_K}(X/I\_K) (L0/selmer-specialization-control (ii)).

**Checks.**

- Direction check: the image of the quartic characteristic ideal contains the product of the two K-characteristic ideals, so a divisibility for M gives one for the product over K.

**Prerequisites.** [`AutomorphicCongruences:L0/selmer-specialization-control`](#node-l0-selmer-specialization-control), [`AutomorphicCongruences:L0/sigma-primitive-selmer`](#node-l0-sigma-primitive-selmer), `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`.

**Sources.**

- **BCS-v2**, Lemma 5.1.1 and proof, p. 9: The restriction from the quartic CM tower to K and the resulting containment of characteristic ideals.

<a id="node-l5a-quartic-cm-l-function-factorization"></a>

#### The quartic-CM p-adic L-function restricted to K

`AutomorphicCongruences:L5a/quartic-cm-l-function-factorization` (theorem).

**Statement.** In the setting of L5a/quartic-cm-selmer-restriction, (π\_K(L\_p(g^F/M))) = (L^{PR}\_p(g/K)·L^{PR}\_p(g^F/K)) in Λ\_K ⊗ ℚ\_p, where L\_p(g^F/M) is Wan's p-adic L-function of the base change g\_F over M (BCS Lemma 5.1.2).

**Hypotheses.**

- The identity is only after inverting p (the comparison of interpolation properties involves periods whose p-integral comparison is open — BCS Remark 1.1.3(ii)).

**Proof outline.**

1. Compare interpolation formulas on a Zariski-dense set of characters of Γ\_K: the base-change L-value L(g\_F/M ⊗ χ, 1) factors as L(g/K ⊗ χ, 1)·L(g^F/K ⊗ χ, 1) (Wan's Prop. 84 in the journal numbering).
2. The interpolation comparison identifies the restricted function with the product up to the fixed nonzero period scalar and the specified normalizations. After inverting p this scalar is a unit, giving equality of principal ideals. Density alone cannot remove the period scalar to yield an exact identity of normalized functions.

**Checks.**

- Exported only after inverting p; the integral statement of L5a/two-variable-product-containment uses µ = 0 instead of an integral period comparison.

**Prerequisites.** [`AutomorphicCongruences:L5w/quartic-cm-divisibility`](#node-l5w-quartic-cm-divisibility), `AutomorphicPadicLFunctions:L4`.

**Sources.**

- **BCS-v2**, Lemma 5.1.2 and proof, p. 9; §2 (p-adic L-functions), p. 6: The factorization of the restricted quartic p-adic L-function by direct comparison of interpolation properties.

<a id="node-l5a-auxiliary-field-existence"></a>

#### Existence of the auxiliary fields K and F

`AutomorphicCongruences:L5a/auxiliary-field-existence` (theorem).

**Statement.** Let g ∈ S\_2(Γ\_0(N)) be an elliptic newform and p ≥ 5 a prime of good ordinary reduction with ρ̄\_g irreducible over G\_ℚ. There exist an imaginary quadratic K satisfying (disc) (D\_K odd, D\_K ≠ −3), (Heeg) (every ℓ | N splits in K), (spl) (p splits in K) and (irr\_K), and a real quadratic F with (i) p inert in F, (ii) D\_F odd with every prime dividing D\_F split in K, (iii) every ℓ | N inert in F if ℓ ≡ −1 mod p and split otherwise, (iv) (irr\_M) for M = FK, (v) ρ̄\_g|\_{G\_{F(ζ\_p)}} irreducible, (vi) F ≠ ℚ(ζ\_5)^+ if p = 5 (BCS Lemma 5.2.3). Moreover such M/F satisfies (pN, D\_F) = 1, (N O\_F, D\_{M/F}) = 1, (spl\_F) and (Δ), and n^- = O\_F, so the hypotheses of Wan's theorem (L5w) other than Hypothesis 3.1.1 hold, and (H1)–(H3) follow from (v), (vi), the minimal-lift argument and (iii) (proof of BCS Prop. 5.2.1).

**Hypotheses.**

- As stated; the conditions are independent splitting conditions satisfied by a positive proportion of quadratic fields.

**Proof outline.**

1. Since p ∤ N, conditions (i) and (iii) on F are independent splitting conditions; fix F with odd D\_F.
2. Similarly (spl), (Heeg) and (ii) hold for a positive proportion of K; choose one with (disc) and (irr\_K).
3. (irr\_M) holds if FK is not in the splitting field of ρ\_g|\_{G\_K}; if ρ̄\_g|\_{G\_{F(ζ\_p)}} is reducible, ρ̄\_g|\_{G\_F} is induced from an index-two subgroup containing G\_{F(ζ\_p)}, which forces p = 5 and F = ℚ(ζ\_5)^+.
4. Check the hypotheses of BCS Thm 3.2.1: (ii) gives n^- = O\_F; (H2) from the base change of a minimal modular lift (Wan's Thm 103); (H3) from (iii) (AutomorphicCongruences:L5w/selected-base-change-hypotheses).

**Checks.**

- Answers the L5b request for Lemma 5.2.3; the stronger 'new ramified K-prime outside D\_F' requirement mentioned there is not in BCS v2 and is not added.
- HeegnerPointEulerSystems:HE.8b/auxiliary-quadratic-field-verification consumes this node (HE.8b comes after L5a); it is not a prerequisite here.
- The splitting tests include the prime 2 when 2 divides N. For an odd fundamental discriminant D, 2 splits when D≡1 (mod 8) and is inert when D≡5 (mod 8). The Jacobi-symbol criterion is used only at odd primes. The suggested integer predicates distinguish these cases.

**Prerequisites.** [`AutomorphicCongruences:L5w/selected-base-change-hypotheses`](#node-l5w-selected-base-change-hypotheses), [`AutomorphicCongruences:L5w/fujiwara-instance`](#node-l5w-fujiwara-instance).

**Sources.**

- **BCS-v2**, Lemma 5.2.3 and proof, p. 10; conditions (i)–(vi) of Prop. 5.2.1, p. 9; proof of Prop. 5.2.1 (hypothesis checks), p. 10: Existence of K and F and the verification of Wan's hypotheses for M = FK.

**Open obligations.** auxiliary-field-narrow-delta. See the detailed list below.

<a id="node-l5a-greenberg-mu-vanishing"></a>

#### Vanishing of the µ-invariant of the Greenberg function

`AutomorphicCongruences:L5a/greenberg-mu-vanishing` (theorem).

**Statement.** Let g ∈ S\_2(Γ\_0(N)) be an elliptic newform with good reduction at p > 2 and K satisfying (disc), (Heeg), (spl) and (irr\_K). Then µ(L^{Gr}\_p(g/K)) = µ(L^{BDP}\_p(g/K)) = 0 (BCS Prop. 4.2.2). Here L\_p^{BDP} is BCS §2’s normalized BDP function, which already interpolates the squared quantity. The comparison of principal ideals in Prop. 4.2.2 introduces no additional square.

**Hypotheses.**

- As stated; the projection comparison is CGS23 Prop. 1.4.5 (Lemma 2.4.4/Prop. 2.4.5 in a later version), which needs Rubin's main conjecture and the Hida–Tilouine input for the CM factor.

**Proof outline.**

1. L^{BDP}\_p(g/K) has µ = 0 by Hsieh's Theorem B (AutomorphicPadicLFunctions:L3h/theorem-b, through its BDP/Castella–Hsieh specialization).
2. The projection of L^{Gr}\_p(g/K) to Λ^{-,ur}\_K generates the same ideal as L^{BDP}\_p(g/K) by comparing interpolation properties (CGS23 Prop. 1.4.5); µ of a two-variable function is bounded by µ of a one-variable specialization.

**Checks.**

- Exported to HeegnerPointEulerSystems:HE.8b/primitive-greenberg-mu-vanishing; this is BCS's Proposition 4.2.2, not Theorem 4.2.1.

**Prerequisites.** `AutomorphicPadicLFunctions:L3h/theorem-b`, `AutomorphicPadicLFunctions:L3h/bdp-castella-hsieh-specialisation`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-p-adic-l-function`, [`AutomorphicCongruences:L0/hida-tilouine-anticyclotomic`](#node-l0-hida-tilouine-anticyclotomic), `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`.

**Sources.**

- **BCS-v2**, Prop. 4.2.2 and proof, p. 9: µ = 0 for L^{Gr} and L^{BDP}, from Hsieh's Theorem B and the CGS23 projection comparison.

<a id="node-l5a-two-variable-product-containment"></a>

#### Burungale–Castella–Skinner's two-variable product divisibility

`AutomorphicCongruences:L5a/two-variable-product-containment` (theorem).

Atlas landmark: BCS two-variable product divisibility.

**Statement.** Let g ∈ S\_2(Γ\_0(N)) be an elliptic newform, p ≥ 5 a good ordinary prime, K satisfying (disc), (Heeg), (spl), (irr\_K), and F a real quadratic field satisfying (i)–(vi) of L5a/auxiliary-field-existence. Then (L^{PR}\_p(g/K)·L^{PR}\_p(g^F/K)) ⊇ ch\_{Λ\_K}(X\_ord(g/K\_∞))·ch\_{Λ\_K}(X\_ord(g^F/K\_∞)) in Λ\_K, and (L^{Gr}\_p(g/K)·L^{Gr}\_p(g^F/K)) ⊇ ch\_{Λ\_K}(X\_Gr(g/K\_∞))·ch\_{Λ\_K}(X\_Gr(g^F/K\_∞)) in Λ^{ur}\_K (BCS Prop. 5.2.1). Both containments are integral.

**Hypotheses.**

- As stated; Wan's quartic-CM theorem (BCS Thm 3.2.1) is imported from L5w with its hypotheses discharged by L5a/auxiliary-field-existence.

**Proof outline.**

1. Wan's theorem for M/F (AutomorphicCongruences:L5w/quartic-cm-divisibility): (π\_K(L\_p(g^F/M))) ⊇ π\_K(ch\_{Λ\_M}(X\_ord(g/M\_∞))).
2. Lemmas 5.1.1–5.1.2 (L5a/quartic-cm-selmer-restriction, L5a/quartic-cm-l-function-factorization) give the Perrin-Riou product containment in Λ\_K ⊗ ℚ\_p.
3. L5a/ordinary-two-variable-equivalence (Cor. 4.1.4) converts it to the Greenberg product containment in Λ^{ur}\_K ⊗ ℚ\_p.
4. µ(L^{Gr}\_p(g/K)·L^{Gr}\_p(g^F/K)) = 0 (L5a/greenberg-mu-vanishing for g and g^F), so the Greenberg containment holds integrally in Λ^{ur}\_K; Cor. 4.1.4 again gives the integral Perrin-Riou containment.

**Checks.**

- Exported to AutomorphicCongruences:L5b (cyclotomic descent) and HeegnerPointEulerSystems:HE.8b (anticyclotomic endpoints) as the early product input; neither L5b's endpoint nor HE.8b's completed result is an input here.

**Prerequisites.** [`AutomorphicCongruences:L5a/quartic-cm-selmer-restriction`](#node-l5a-quartic-cm-selmer-restriction), [`AutomorphicCongruences:L5a/quartic-cm-l-function-factorization`](#node-l5a-quartic-cm-l-function-factorization), [`AutomorphicCongruences:L5a/ordinary-two-variable-equivalence`](#node-l5a-ordinary-two-variable-equivalence), [`AutomorphicCongruences:L5a/greenberg-mu-vanishing`](#node-l5a-greenberg-mu-vanishing), [`AutomorphicCongruences:L5a/auxiliary-field-existence`](#node-l5a-auxiliary-field-existence), [`AutomorphicCongruences:L5w/quartic-cm-divisibility`](#node-l5w-quartic-cm-divisibility), [`AutomorphicCongruences:L5w/selected-base-change-hypotheses`](#node-l5w-selected-base-change-hypotheses).

**Sources.**

- **BCS-v2**, Prop. 5.2.1 and proof, pp. 9–10: The integral Perrin-Riou and Greenberg product containments over K from Wan's quartic-CM divisibility, Lemmas 5.1.1–5.1.2, Thm 4.1.3 and Prop. 4.2.2.

**Open obligations.** ordinary-bstw-owner; auxiliary-field-narrow-delta. See the detailed list below.

<a id="layer-l5"></a>

### Layer L5: The ordinary elliptic-curve aggregate

This layer collects the FW and BCS endpoints with their original hypotheses and unresolved inputs. The BCS proof is given in L5b below. Final scalar, canonical-period and curve-to-form assembly belongs to ModularIwasawaMainConjectures.

<a id="node-l5-ordinary-elliptic-refinement-aggregate"></a>

#### The ordinary elliptic-curve refinement: aggregate of the endpoints

`AutomorphicCongruences:L5/ordinary-elliptic-refinement-aggregate` (application).

**Statement.** For an elliptic curve E/ℚ and a prime p of good ordinary reduction, stage L5 collects, without a second proof, the two reverse-divisibility endpoints planned in this roadmap: (a) Burungale–Castella–Skinner's cyclotomic theorem — for p > 3 with E\[p\] irreducible, X\_ord(E/ℚ\_∞) is Λ-torsion and char\_Λ X\_ord(E/ℚ\_∞) = (L\_p(E/ℚ)) in Λ ⊗ ℚ\_p, with equality in Λ under the rank-one image condition (im) (BCS Thm 1.1.2), proved in L5b from L5a's early product input and four Kato bounds; and (b) Fouquet–Wan's cohomological theorem at good ordinary points (L4/fw-pointwise-theorem, through L2/fw-ordinary-reverse-bound). The scalar ordinary main conjecture with canonical periods, the curve-to-form lattice and Manin-constant transport and the final assembly are ModularIwasawaMainConjectures L1–L3's, which import the endpoints directly from L5b and L4.

**Hypotheses.**

- Hypotheses are those of each endpoint; nothing is added or removed here.
- RS-11: L5 is an aggregate only; it is not a prerequisite of ModularIwasawaMainConjectures:L3 (the requested cut C.L5 → I.L3).

**Proof outline.**

1. List the endpoints with their owners: AutomorphicCongruences:L5b/rational-cyclotomic-endpoint and L5b/integral-cyclotomic-endpoint for (a), L4/fw-pointwise-theorem for (b).
2. Record that the BCS rational/integral distinction survives: (a) is in Λ ⊗ ℚ\_p without (im) and in Λ with (im).

**Checks.**

- Acceptance of the roadmap: opposite divisibilities on the same integral objects as Kato's; no hidden 'assume the divisibility' field; the BCS rational/integral distinction kept.

**Prerequisites.** [`AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`](#node-l5b-rational-cyclotomic-endpoint), [`AutomorphicCongruences:L5b/integral-cyclotomic-endpoint`](#node-l5b-integral-cyclotomic-endpoint), [`AutomorphicCongruences:L4/fw-pointwise-theorem`](#node-l4-fw-pointwise-theorem), [`AutomorphicCongruences:L2/fw-ordinary-reverse-bound`](#node-l2-fw-ordinary-reverse-bound), [`AutomorphicCongruences:L5a/two-variable-product-containment`](#node-l5a-two-variable-product-containment).

**Sources.**

- **BCS-v2**, Thm 1.1.2 and Remark 1.1.3, p. 2; proof of Thm 1.1.2, p. 10: The rational and integral cyclotomic theorems and their proof from Prop. 5.2.1 and Kato's bounds.
- **FW-v3**, Thm 1.6, Thm 1.7, pp. 6–7: The ordinary and pointwise theorems.

## Totally real engine and cyclotomic descent

<a id="layer-l5w"></a>

### Layer L5w: The totally real Wan–Fujiwara engine

Apply the exact minimal totally real R=T/freeness input, identify the Hilbert canonical period, and build the integral congruence and ordinary Selmer lower bound. Ordinary boundary control over F, Hilbert period duality and the polarized rank-four extension are separate refinements of the Q-case interfaces. Characteristic divisors over a normal branch and specialization of a principal analytic majorant retain their precise domains. The conditional selected-field check does not depend on L5a existence or the L5b endpoint.

<a id="node-l5w-fujiwara-instance"></a>

#### Fujiwara’s minimal theorem in the Wan instance

`AutomorphicCongruences:L5w/fujiwara-instance` (application).

Suggested name: `fujiwaraInstance`.

**Statement.** For the specified nearly ordinary weight-two residual Hilbert representation and its minimal deformation type D, identify Wan’s localized Hecke algebra with the R=T algebra supplied by R21.4. Verify every condition of Fujiwara 11.1, then use 11.2 and 11.5 for freeness of the precise quaternionic/Hilbert module and the Hida-family comparison. The minimal algebra is a relative complete intersection; the appropriate finite flat Hecke algebra is Gorenstein. This is an application of the supplier theorem, not a new proof of totally real R=T.

**Hypotheses.**

- p>3; F totally real, p unramified in F; residual representation absolutely irreducible on G\_{F(ζ\_p)}.
- For p=5 exclude the simultaneous PGL2(F5) projective-image and mod-p-cyclotomic factorization through its abelianization of order two.
- The local nearly ordinary types are distinguished; flat types satisfy Fujiwara’s unramified base-field restriction; a minimal modular lift exists as in Definition 6.11.
- Verify Hypothesis 6.7 via Theorem 6.8 in the ordinary/weight-two instance; retain Hypothesis 5.9 in exactly the nonminimal cases where 11.1 requires it. Odd \[F:Q\] requires the Shimura-curve Ihara input in Wan 8.
- Exclude the actual exceptional 0E case using the induced-representation description: the local representation is absolutely irreducible, its inertia restriction is absolutely reducible, and q\_v≡−1 mod p. BCS H3 excludes this case. Additionally verify Wan 8’s literally printed irreducible-inertia q\_v test. SourceIssues E1/E5 explain the wording discrepancy; the literal test alone is not used as an exclusion of the actual induced type.

**Proof outline.**

1. Match the determinant, Teichmuller twist characters, finite local deformations away p and nearly ordinary/flat local deformation conditions, not just residual representations.
2. Apply the exact minimal supplier theorem and freeness; the existing nice-prime Skinner–Wiles theorem in R21.4 is not by itself this theorem.
3. Use finite flatness over the regular weight ring and complete-intersection duality to deduce Gorenstein; finite flatness alone does not imply regularity.

**Checks.**

- At real quadratic F no odd-degree Ihara condition is invoked.
- A general residual irreducibility statement without minimal lift or local types does not satisfy this target.

**Prerequisites.** `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`, `GlobalGaloisDeformations:R04.6`, `PadicFamilies:L5`.

**Sources.**

- **Fujiwara**, Definition 6.11, pp.54–55; Theorems 11.1–11.2, p.95; Corollary 11.5, p.97: Exact minimal conditions and freeness.
- **Wan-2015**, Theorem 8, pp.6–7: Gorenstein input and the actual inertia condition.
- **BCS-published**, Hypothesis 3.1.1 and Remark 3.1.2, pp.7–8: Application conditions; BCS H3 matches the induced exceptional type, while the source wording discrepancies are recorded.

**Open obligations.** Exact minimal theorem and period suppliers; Full arithmetic Lean signatures. See the detailed list below.

<a id="node-l5w-eisenstein-coefficient-ideal"></a>

#### Wan’s coefficient Eisenstein ideal

`AutomorphicCongruences:L5w/eisenstein-coefficient-ideal` (definition).

Atlas landmark: Eisenstein congruence ideal.

Suggested name: `wanEisensteinIdeal`.

**Statement.** For Λ\_D→h\_D, where h\_D is the reduced localized cuspidal ordinary Hecke image, let J index the exact characteristic-polynomial coefficients, central-character values and ordinary U\_p eigenvalues in Wan §9.1. For every unramified inert place include all coefficients of Q\_v−Q\_v,D and its central Z\_v,0 difference; for each split place include Q\_w−Q\_w,D, Q\_wbar−Q\_wbar,D and both central Z\_v,0^(i) differences. Use i\_w=1 and i\_wbar=2: Q\_w uses T\_i^(i\_w) with the complementary central operator Z\_0^(3−i\_w), and Q\_wbar uses T\_i^(i\_wbar) with Z\_0^(3−i\_wbar). Correct the repeated i\_w in the printed second polynomial as recorded in E6. The polynomial constant coefficient is 1, so only degrees 1–4 contribute. At every v|p include u\_t,v−λ\_ℰ\_D(u\_t,v) for t=diag(p^a1,p^a2,p^a4,p^a3), a1≤a2≤a3≤a4. Reciprocity uses geometric Frobenius and the central character is σ\_ψσ\_ξ^−1. Write H\_j∈h\_D and λ\_j∈Λ\_D for these cuspidal operators and Eisenstein values. Let I\_D be the ideal generated by H\_j−λ\_j, and define 𝔈\_D=I\_D∩Λ\_D, equivalently the kernel of Λ\_D→h\_D/I\_D. The exact Hecke-generator dictionary proves the structure map onto h\_D/I\_D is surjective, so Λ\_D/𝔈\_D≅h\_D/I\_D. The definition does not assume surjectivity or identify a reducibility ideal with a congruence ideal.

**Hypotheses.**

- The coefficient inclusion is a unital ring map; the Hecke carrier, reduced image and eigenvalues are supplied by the ordinary-form/IHG owners.
- The actual index set J contains all operators listed in Wan §9.1, with its central and U\_p relations.

**Proof outline.**

1. Use the existing ideal span, preimage and quotient API to specialize the generic congruence construction to the source eigenpacket.
2. Prove its kernel and generator relations using membership in a generated ideal.
3. Use the IHG/form supplier’s exact Hecke-generation dictionary: polynomial-coefficient, central and ordinary differences reduce every generator to its Eisenstein scalar. Check that inverted central/ordinary/localizing elements have unit scalar images. This proves coefficient-to-quotient surjectivity; scalar maps otherwise give only the stated kernel inclusion.

**Checks.**

- The ideal lives in Λ\_D, distinct from I\_D in h\_D.
- The coefficient map need not be injective in the general algebraic prototype; arithmetic h\_D uses the actual coefficient action.
- At a split prime the two independent Satake operator families are retained; changing only the central operator in Q\_wbar is insufficient.

**Uses.**

- AutomorphicCongruences:L5w/height-one-congruence: Its local quotient length measures the cuspidal Eisenstein congruence.
- AutomorphicCongruences:L5w/galois-selmer-instance: 𝔈\_D is the coefficient intersection J0 required for the Ribet extension theorem.

**API.**

- `wanEisensteinIdeal_mem` (characterisation): r∈𝔈\_D iff its image in h\_D belongs to the ideal generated by the operator differences.
- `wanEisensteinIdeal_quotient_kernel` (compatibility): 𝔈\_D equals the kernel of the coefficient map followed by the quotient h\_D→h\_D/I\_D.
- `wanEisensteinIdeal_generator` (relation): Each operator H\_j and the image of λ\_j agree in h\_D/I\_D.
- `wanEisensteinIdeal_quotient_surjective` (universal-property): If the coefficient-to-quotient map is surjective, its induced map Λ\_D/𝔈\_D→h\_D/I\_D is a ring equivalence.
- `wanEisensteinIdeal_baseChange_le` (functoriality): For a commuting coefficient/Hecke square and transported operator values, the extension of 𝔈\_D is contained in the new coefficient Eisenstein ideal; equality requires a proved kernel-base-change condition.

**Unit tests.**

- `eisenstein_equal_eigenvalues` (degenerate): For Λ=h=ℤ, identity coefficient map, one operator H=7 and λ=7, E=(0).
- `eisenstein_mod_five` (computation): For Λ=h=ℤ, identity coefficient map, H=8 and λ=3, E=(5), not (25).
- `eisenstein_unit_difference` (non-example): For Λ=h=ℤ, identity coefficient map, H=2 and λ=1, E=ℤ.
- `eisenstein_kernel_noninjective` (characterisation): For the coefficient map ℤ→ZMod 5 and an operator equal to its eigenvalue, I\_D=0 but 𝔈\_D=(5), detecting the coefficient kernel.

**Prerequisites.** `mathlib:Ideal.comap`, `mathlib:Ideal.mem_comap`, `mathlib:Ideal.map_span`, [`AutomorphicCongruences:L0/eisenstein-ideal`](#node-l0-eisenstein-ideal), `IntegralHeckeAndGaloisDeterminants:IHG.2`.

**Sources.**

- **Wan-2015**, §9.1, pp.81–83 (definitions of h\_D, I\_D and 𝔈\_D): The source-specific operator list and coefficient kernel, using existing ideal theory.
- **SU**, §§9.5.2–9.5.5, pp.130–132: The two split Hecke families and complementary Satake variables justify the corrected conjugate-prime operator index.

**Open obligations.** Full arithmetic Lean signatures. See the detailed list below.

<a id="node-l5w-canonical-period-duality"></a>

#### Integral projector and canonical period

`AutomorphicCongruences:L5w/canonical-period-duality` (comparison).

Suggested name: `canonicalPeriodDuality`.

**Statement.** In the specified ordinary Hilbert Hecke algebra T over the normal Hida coefficient ring I, let e\_f be the rational idempotent of the f-component. Identify T∩I\_frac e\_f with the rank-one integral congruence line generated by ℓ\_f=η\_f e\_f, using the supplied Gorenstein duality and free Hecke module. Wan’s canonical period divides the specified Petersson pairing by η\_f with the archimedean factors of Definition 79. Replacing ℓ\_f by uℓ\_f, u∈I×, changes the normalized p-adic L-function and Eisenstein family by the matching unit; their ideals are unchanged.

**Hypotheses.**

- The Hecke algebra and module are those in the preceding Fujiwara instance, not an arbitrary finite flat algebra.
- The f-component is generically isolated; the congruence number is nonzero at the chosen arithmetic point; the actual integral lattice and pairing are fixed.

**Proof outline.**

1. Use the exact minimal free Hecke module and the source-specific Gorenstein pairing/congruence-line comparison requested from AC L0. Current IHG.6 is a rank-two Ribet/Fitting theorem and does not by itself identify this Hilbert congruence line.
2. Match Wan 7.2.1/Definition 79, including the choice of generator, powers of 2 and i, conductor and conjugate/twisted form.
3. Use the integral projector ℓ\_f in interpolation; retain e\_f only for the rational version.

**Checks.**

- The rational idempotent is not declared integral.
- No equality of the period over F with the square of a period over Q is inferred.
- Gorenstein of an arbitrary finite flat algebra, without this free module and pairing, is not the asserted congruence-line comparison.

**Prerequisites.** [`AutomorphicCongruences:L5w/fujiwara-instance`](#node-l5w-fujiwara-instance), [`AutomorphicCongruences:L0/canonical-period-congruence-number`](#node-l0-canonical-period-congruence-number), `mathlib:Ideal.span_singleton_mul_left_unit`.

**Sources.**

- **Wan-2015**, §7.2.1, Definition 79, Remark 80, pp.65–66; Theorem 82, pp.66–68: Canonical normalization and integral versus rational projector.

**Open obligations.** Exact minimal theorem and period suppliers; Full arithmetic Lean signatures; Hilbert extensions of the L0 period and Selmer interfaces. See the detailed list below.

<a id="node-l5w-quaternionic-period-primitivity"></a>

#### Quaternionic period and primitive anticyclotomic input

`AutomorphicCongruences:L5w/quaternionic-period-primitivity` (comparison).

Suggested name: `quaternionicPeriodPrimitivity`.

**Statement.** For the Jacquet–Langlands transfer of the parallel even-weight member of the Hilbert family, compare the quaternionic self-pairing congruence period with Wan’s canonical period up to an integral unit. Under squarefree n− of parity \[F:Q\] and residual ramification at every n− factor, the transfer has the same localized Hecke algebra and rank-one module needed for this comparison. Import Hung/Hsieh nonvanishing with that period: NV1 is nonzero, and under the Fujiwara instance NV2 is primitive modulo the uniformizer. Nonsplit imprimitive Euler factors are kept and may contribute positive μ.

**Hypotheses.**

- p≥5 unramified in F; M/F CM with p split; residual irreducibility and ordinary distinctness.
- n− squarefree with #prime factors ≡\[F:Q\] mod 2; residual ramification at each factor; the branch character used in Wan 86 is trivial.

**Proof outline.**

1. Check stabilizer orders are prime to p (a p-torsion element would yield a quadratic field containing μ\_p, impossible here for p≥5 unramified in F).
2. Use the imported free quaternion module and integral pairing to identify the congruence generator.
3. Apply the precise toric nonvanishing supplier on its character domain and compare primitive versus removed-Euler-factor normalizations.

**Checks.**

- n−=1 is allowed when \[F:Q\]=2.
- A μ=0 assertion for every imprimitive function fails at nonsplit Euler factors and is excluded.

**Prerequisites.** [`AutomorphicCongruences:L5w/canonical-period-duality`](#node-l5w-canonical-period-duality), `AutomorphicPadicLFunctions:L3h`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`.

**Sources.**

- **Wan-2015**, Definition 85 and Theorem 86, pp.69–70; Lemma 87, pp.70–71: Period comparison, NV1/NV2, and exceptional Euler factors.

**Open obligations.** Exact minimal theorem and period suppliers; Full arithmetic Lean signatures. See the detailed list below.

<a id="node-l5w-klingen-interpolation"></a>

#### Normalized Hilbert Klingen family and its boundary

`AutomorphicCongruences:L5w/klingen-interpolation` (theorem).

Atlas landmark: Hilbert Klingen family.

Suggested name: `wanKlingenInterpolation`.

**Statement.** In the imported ordinary GU(2,2)/F module of p-adic forms, take the Klingen family ℰ\_D supplied by APL L4 from the actual local sections and pullback, and prove its normalized coefficient and boundary identities. At every cusp x its coefficients c\_D(β,x) lie in Λ\_D and specialize at each generic arithmetic point φ to the classical Klingen coefficient normalized by Ω\_{f\_φ,can}. Indices β are positive semidefinite Hermitian rank-two matrices; the degenerate indices det β=0 are included. Every degenerate coefficient (det β=0) belongs to (L\_f,M,ξ^Σ L\_ξ′^Σ). This is the boundary divisibility needed for a cuspidal congruence.

**Hypotheses.**

- D=(A,I,f,ψ,ξ,Σ) is Wan’s p-adic Eisenstein datum; Σ contains p and every bad prime; local sections are generic at the interpolation points.
- Residual irreducibility, ordinary distinctness and the Gorenstein instance hold; the auxiliary finite ψ has the specified central restriction and is unramified outside Σ.

**Proof outline.**

1. Import the GU(2,2) carrier, doubling/pullback integrals and Λ-adic q-expansion/control from APL L4 and the ordinary unitary-form supplier.
2. Use ℓ\_f rather than e\_f to obtain integral coefficients, then check the local p sections and tame local factors against Wan’s interpolation formula.
3. Evaluate the Siegel operator at every cusp; the degenerate coefficient computation gives the product of Rankin and abelian p-adic L-functions.

**Checks.**

- Use GU(2,2), not GU(3,1) or the semi-ordinary projector.
- Check boundary divisibility at all cusps, not just the standard constant coefficient.

**Prerequisites.** [`AutomorphicCongruences:L5w/canonical-period-duality`](#node-l5w-canonical-period-duality), `AutomorphicPadicLFunctions:L4`, [`AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms`](#node-l1-gu22-ordinary-hermitian-forms), [`AutomorphicCongruences:L1/gu22-hida-control`](#node-l1-gu22-hida-control), `PadicFamilies:L5`.

**Sources.**

- **Wan-2015**, §§6–7; Theorem 82, pp.66–68; Theorem 88, p.71; Theorem 27, p.23: Actual source-specific integral family and boundary ideal.

**Open obligations.** Integral fixed-form analytic/control refinements; Full arithmetic Lean signatures; Totally real extension of the L1 ordinary boundary sequence. See the detailed list below.

<a id="node-l5w-exceptional-height-one-primes"></a>

#### The pulled-back height-one primes

`AutomorphicCongruences:L5w/exceptional-height-one-primes` (theorem).

Suggested name: `wanExceptionalPrimes`.

**Statement.** For a height-one P pulled back from I\[\[Γ\_M+\]\], bound ord\_P(L^Σ) by the sum of valuations of the nonsplit removed Euler factors, using primitive NV2 and the period comparison. If X^Σ is torsion, Poitou–Tate and the vanishing of the compact global term give the exact primitive/imprimitive characteristic-ideal comparison with those local factors. Hence ord\_P(char X^Σ)≥ord\_P(L^Σ). If X^Σ is not torsion, record only the zero extended-ideal containment. No uniform imprimitive μ=0 assertion is made.

**Hypotheses.**

- The ordinary primitive and imprimitive local conditions use the same lattice; Σ includes bad primes and p.
- NV2 holds for the primitive function; local H¹ finite-part modules have the indicated Euler characteristic ideals; the necessary compact global term vanishes after checking torsion and torsion-freeness.

**Proof outline.**

1. Apply Wan 87 to the primitive-normalized function with the nonsplit Euler product retained.
2. Use the Selmer supplier’s Poitou–Tate exact sequence; prove its global compact term is both torsion-free (residual irreducibility) and torsion under the stated cotorsion hypothesis.
3. Match each local characteristic divisor with its analytic Euler factor and use divisorial characteristic multiplicativity. Use the requested normal/Krull extension of L4, not the principal-generator theorem available only for a UFD.

**Checks.**

- Nonsplit factors with positive μ are included on both sides.
- The non-torsion case is not reported as a proof of torsionness.

**Prerequisites.** [`AutomorphicCongruences:L5w/quaternionic-period-primitivity`](#node-l5w-quaternionic-period-primitivity), [`AutomorphicCongruences:L0/primitive-imprimitive-comparison`](#node-l0-primitive-imprimitive-comparison), `SelmerIwasawaCohomology:L4`, `PadicMeasuresIwasawaAlgebras:L4`.

**Sources.**

- **Wan-2015**, Lemma 87, p.71; proof of Theorem 101, p.89: Exceptional primes and local-factor comparison rather than automatic primitivity.

**Open obligations.** Torsion and local convention bridge; Full arithmetic Lean signatures; Normal coefficient-ring characteristic and faithful descent extensions; Hilbert extensions of the L0 period and Selmer interfaces. See the detailed list below.

<a id="node-l5w-fourier-coefficient-coprimality"></a>

#### Nonconstant Fourier coefficient coprimality

`AutomorphicCongruences:L5w/fourier-coefficient-coprimality` (theorem).

Suggested name: `wanFourierCoprimality`.

**Statement.** For ℰ\_D, the ideal generated by the selected nondegenerate Fourier–Jacobi/theta pairings is contained in no height-one prime of Λ\_D except possibly a prime pulled back from R+=I\[\[Γ\_M+\]\]. At each remaining height-one prime dividing L\_f,M,ξ^Σ there is an actual nonconstant coefficient which is a unit after localization. This supplies the coefficient which survives the cuspidal congruence; nonzero interpolation alone is insufficient.

**Hypotheses.**

- Wan’s irreducibility/distinctness and Gorenstein conditions, auxiliary theta/CM characters and their prescribed local conductors are satisfied.
- The CM character is chosen with its period-normalized algebraic value a p-adic unit, with local Euler factors units and CM residual irreducibility/distinctness; all factors are tested on the chosen lattice.

**Proof outline.**

1. Apply the explicit Fourier–Jacobi identity and Hecke projection of Wan 95; keep its A\_D,g factor in R+ and its B\_D,g factor in Λ\_D.
2. Choose the auxiliary CM family and characters as in 96, importing the CM p-adic L-value and congruence-period theorem from APL L3h/L3.
3. Show the B factor is a unit and identify the remaining possible divisors as pulled-back primes.

**Checks.**

- At an excluded prime from R+ use the exceptional-prime target, rather than this coprimality statement.
- A single dense set of nonzero classical coefficients does not imply integral primitivity.

**Prerequisites.** [`AutomorphicCongruences:L5w/klingen-interpolation`](#node-l5w-klingen-interpolation), [`AutomorphicCongruences:L5w/quaternionic-period-primitivity`](#node-l5w-quaternionic-period-primitivity), `AutomorphicPadicLFunctions:L3h`, `AutomorphicPadicLFunctions:L3`.

**Sources.**

- **Wan-2015**, Proposition 95, pp.78–79; Proposition 96 and proof, pp.79–81: Selected coefficient ideal and the CM unit computation.

**Open obligations.** Full arithmetic Lean signatures. See the detailed list below.

<a id="node-l5w-height-one-congruence"></a>

#### Cuspidal lift and Eisenstein congruence length

`AutomorphicCongruences:L5w/height-one-congruence` (theorem).

Atlas landmark: Eisenstein congruence bound.

Suggested name: `wanHeightOneCongruence`.

**Statement.** At a height-one prime P of Λ\_D not pulled back from R+, with a nonconstant Fourier coefficient of ℰ\_D outside P, construct a cusp family congruent to ℰ\_D modulo the Rankin factor L^Σ. After localizing the source at P, the induced Λ\_D,P-algebra map (h\_D/I\_D)⊗\_ΛD Λ\_D,P→Λ\_D,P/(L^Σ) is onto. The separate global coefficient map Λ\_D→h\_D/I\_D is onto by the Hecke-generator dictionary. Its kernel 𝔈\_D satisfies ord\_P(𝔈\_D)≥ord\_P(L^Σ). In the rational projector variant retain b e\_f integral, b(φ0)≠0, P⊂φ0, and the coefficient nonvanishing condition on b times the rational family.

**Hypotheses.**

- The integral family and coprimality theorem, ordinary boundary exact sequence and lifting/control theorem hold for all cusps.
- P is height one; the local ring is a DVR; the Rankin factor is nonzero. The unwanted abelian factor is removed only with the actual unit/localization argument of Wan.

**Proof outline.**

1. Use Wan 27 to lift the cuspidal reduction of the family; verify the boundary and flatness hypotheses of the form module.
2. In the localized cusp module, evaluate a Hecke translate at a coefficient invertible at P. Divide by that coefficient to obtain a Λ\_D,P-linear functional. The congruent eigenvalue relations modulo P^r prove multiplicativity and unit preservation on the Hecke quotient; linearity alone does not make a ring map.
3. The localized quotient map gives 𝔈\_D Λ\_D,P⊂P^r Λ\_D,P, with r=ord\_P(L^Σ). Use source-specific Gorenstein duality only where required, and keep the coefficient/global quotient distinct from its localization.

**Checks.**

- The inequality is ≥, not strict >; verify against the PDF symbols.
- A vanishing/nonunit coefficient cannot be used as a denominator.
- The unlocalized map R/P→Frac(R/P) need not be onto: for R=k\[x,y\], P=(x), it is k\[y\]→k(y). Localization of the Hecke source is essential.

**Prerequisites.** [`AutomorphicCongruences:L5w/klingen-interpolation`](#node-l5w-klingen-interpolation), [`AutomorphicCongruences:L5w/fourier-coefficient-coprimality`](#node-l5w-fourier-coefficient-coprimality), [`AutomorphicCongruences:L5w/eisenstein-coefficient-ideal`](#node-l5w-eisenstein-coefficient-ideal), [`AutomorphicCongruences:L1/gu22-hida-control`](#node-l1-gu22-hida-control), `PadicMeasuresIwasawaAlgebras:L4`.

**Sources.**

- **Wan-2015**, Theorem 27, p.23; §9.1 and Theorem 97, pp.81–84: Cuspidal congruence and orientation of the local length bound.

**Open obligations.** Integral fixed-form analytic/control refinements; Full arithmetic Lean signatures; Normal coefficient-ring characteristic and faithful descent extensions; Totally real extension of the L1 ordinary boundary sequence. See the detailed list below.

<a id="node-l5w-galois-selmer-instance"></a>

#### Polarized 1+2+1 extension with ordinary local conditions

`AutomorphicCongruences:L5w/galois-selmer-instance` (application).

Suggested name: `wanGaloisSelmerInstance`.

**Statement.** Import integral determinant/reconstruction ingredients from IHG, and apply the exact polarized rank-four three-block extension theorem of Wan Proposition 98 as a recorded supplier refinement to the actual cuspidal rank-four Galois representation congruent to χ′⊕ρ⊕χ. Verify all ten hypotheses of Wan §9.2.1 on the completed height-one Hecke algebra. The resulting extension classes belong to the Σ-imprimitive ordinary Selmer group for the same rank-two lattice and twist as the Rankin function. For P0⊂I\[\[Γ\_M\]\] height one not pulled back from R+=I\[\[Γ\_M+\]\], require that P=P0Λ\_D is the corresponding height-one prime. If the plus/minus local constituents are residually disjoint modulo P, obtain ord\_P0(char X^Σ)≥ord\_P(𝔈\_D).

**Hypotheses.**

- Λ\_D is a Krull domain; h\_D is finite, local and reduced. The selected localized/completed congruence model satisfies the coefficient-intersection and quotient clauses of Wan §9.2.1; these clauses require proof and do not follow merely from finite flatness.
- The three residual constituents are disjoint, the rank-two one absolutely irreducible, and the polarization and local ordinary characteristic polynomials have Wan’s twists.
- The cuspidal characteristic-zero constituents are absolutely irreducible or satisfy the precise rank-two alternative in condition (10); CAP exclusion and ordinary modularity lifting prove this alternative.
- The scalar-character Selmer characteristic ideal has valuation zero at P by the totally real character main conjecture; the plus/minus local pieces have no common irreducible constituent modulo P.
- For primes containing 𝔈\_D, use A=completion of (Λ\_D)\_P, a DVR, and the corresponding completed Hecke factor R. Choose the source model A0,R0,I0,J0 so I0∩A0=J0, A0/J0≅R0/I0 and the extended ideals contract as required by Wan §9.2.1. Global I\_D,𝔈\_D do not automatically contract unchanged after height-one localization. A supplier may use their P-primary saturations only after proving the same local quotient lengths and valuations. At a prime not containing 𝔈\_D the congruence valuation is zero.
- Wan setup (1)–(3): use H=G\_F,Σ, G=G\_M,Σ and its conjugation c. The continuous polarization character ν extends to H; χ is a continuous character of G and χ′=νχ^(−c) has different residual character. The rank-two ρ is defined on a free A0-lattice, satisfies ρ^c≅ρ^∨⊗ν, and its residual representation is absolutely irreducible and disjoint from both residual characters. Residual disjointness is witnessed by coprime characteristic polynomials of some group-algebra element, as in the supplier theorem.
- Wan setup (4)–(6): the rank-four σ is defined over the image of R0 in R, with integral traces and a finitely generated R-orbit module for every vector. It satisfies the same polarization; the proper congruence ideal I has nonzero J=A∩I and A/J≅R/I, and tr σ≡χ′+tr ρ+χ modulo I. The irreducible ρ has a compatible polarization pairing Φ with Φ^t=−ν(c)Φ.
- Wan setup (7)–(9): at every v|p the plus and minus rank-two lattice pieces are free over A0, and the plus and minus rank-four pieces are free over R⊗\_A Frac(A). For every element x of the local group algebra, the plus characteristic polynomial of σ agrees modulo I with Ch(ρ^+,x,T)(1−χ(x)T); the minus relation uses χ′. The two combined local pieces have no common residual irreducible constituent.
- Wan setup (10): for each characteristic-zero specialization of R⊗\_A Frac(A), σ is absolutely irreducible or has the specified absolutely irreducible rank-two subrepresentation whose trace is congruent to χ+χ′. The ordinary lifting and CAP exclusion supplier proves this alternative; it is not assumed for an arbitrary trace.
- Match the exact twist dictionary of Wan §9.2.2, p.87: ρ=ρ\_f⊗σ\_ξ^(−c)σ\_ψ^c ε^(−2), χ=σ\_ψ^c ε^(−3), and χ′=νχ^(−c), using ε for the p-adic cyclotomic character. The final Selmer lattice is (T\_f⊗I\[\[Γ\_M\]\])(ε\_M^(−c))⊗ε and its ordinary line, with the actual coefficient map and primitive/Σ conventions. All height-one extension and coefficient normalization comparisons are verified before identifying the valuations.
- Characteristic valuations use the divisorial height-one-length construction over the normal coefficient ring, with faithful localized/completed scalar transport; principality is not inferred from normality.

**Proof outline.**

1. Use IHG determinant/Hecke algebra ingredients. The current upstream IHG.6 statement concerns rank-two representations with two residual characters; it is not Wan’s rank-four χ′⊕ρ⊕χ theorem. Request that exact general extension input without replanning the existing rank-two theorem, and use the AC L0 bridge for its ordinary Selmer realization.
2. Match Wan’s characters χ, χ′, ν, rank-two lattice and cyclotomic/CM twists using the displayed formulas on p.87; keep the polarization sign.
3. Use the ordinary lifting/CAP theorem for condition (10), and IntegralIwasawaTheory I.5 with the precise scalar-character/local-condition comparison to kill the unwanted character extension.
4. Apply the length theorem and compare the resulting local conditions with the source Selmer group; if X is not torsion the source’s extended characteristic ideal is zero, not a nonzero genuine characteristic ideal.

**Checks.**

- A trace congruence alone is not used to produce an integral representation.
- The scalar Selmer term and the common-local-constituent condition are not suppressed.
- A two-character rank-two Ribet theorem does not supply the polarized rank-four three-block length theorem.
- For example, localizing an ideal with an extra factor away from P removes that factor; equality with its original global contraction must be proved, not presumed.

**Prerequisites.** [`AutomorphicCongruences:L5w/eisenstein-coefficient-ideal`](#node-l5w-eisenstein-coefficient-ideal), [`AutomorphicCongruences:L5w/height-one-congruence`](#node-l5w-height-one-congruence), `IntegralHeckeAndGaloisDeterminants:IHG.4`, `IntegralHeckeAndGaloisDeterminants:IHG.6`, [`AutomorphicCongruences:L0/su-lattice-datum`](#node-l0-su-lattice-datum), [`AutomorphicCongruences:L0/lattice-construction`](#node-l0-lattice-construction), [`AutomorphicCongruences:L0/extension-class-local-conditions`](#node-l0-extension-class-local-conditions), [`AutomorphicCongruences:L0/sigma-primitive-selmer`](#node-l0-sigma-primitive-selmer), `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`, `IntegralIwasawaTheory:I.5`, `SelmerIwasawaCohomology:L3/kernel-control`, `PadicMeasuresIwasawaAlgebras:L4`.

**Sources.**

- **Wan-2015**, §9.2.1, Proposition 98, pp.84–86; §9.2.2, Theorem 100, pp.87–88: Actual polarized extension instance and ordinary local-condition check.

**Open obligations.** Torsion and local convention bridge; Full arithmetic Lean signatures; Normal coefficient-ring characteristic and faithful descent extensions; Polarized rank-four extension and localized congruence model; Hilbert extensions of the L0 period and Selmer interfaces. See the detailed list below.

<a id="node-l5w-wan-family-divisibility"></a>

#### Wan’s parallel Hilbert-family divisibility

`AutomorphicCongruences:L5w/wan-family-divisibility` (theorem).

Atlas landmark: Wan’s Hilbert divisibility.

Suggested name: `wanFamilyDivisibility`.

**Statement.** Let F be totally real of degree d, p≥5 unramified in F, M/F CM with p split, and I a local normal finite integral extension of the parallel Hida weight algebra. Let f be a nearly ordinary I-adic eigenform of trivial character with an ordinary specialization of even parallel weight κ0≥2. Under residual irreducibility over M, distinctness, the full Wan 8/Fujiwara instance, Δ+ (M not in the narrow Hilbert class field of F and F/Q-ramified primes split in M), squarefree n− with parity d, and residual ramification at all n−, prove char^Σ(X\_f,M)⊂(L\_f,M^Σ). For Σ including all bad primes, the normalized function is integral. For arbitrary Σ the result is a fractional-ideal statement with the Euler factors restored. Here char^Σ is the divisorial characteristic ideal defined by height-one lengths over the normal coefficient ring when the finite dual is torsion; it need not be principal. The existing UFD characteristic-generator node is insufficient in this generality; in the non-torsion case Wan’s assertion uses zero.

**Hypotheses.**

- All conditions in the statement, including the integral Gorenstein period normalization and the same lattice in the analytic and Galois comparisons.
- No general main conjecture for an arbitrary unitary-group representation or arbitrary weight Hida family is inferred.

**Proof outline.**

1. Combine the coefficient coprimality, congruence length and Galois extension bounds at non-pulled-back primes.
2. Use the exceptional-prime target on the complementary primes.
3. Import height-one detection of divisorial ideal containment over the normal coefficient ring; remove/add local factors through Poitou–Tate to treat each Σ.

**Checks.**

- Test p=5 and κ0=2 against the PDF, whose text extraction drops ≥.
- Separate the source’s extended ideal from cotorsion needed to use a nonzero characteristic divisor.

**Prerequisites.** [`AutomorphicCongruences:L5w/height-one-congruence`](#node-l5w-height-one-congruence), [`AutomorphicCongruences:L5w/galois-selmer-instance`](#node-l5w-galois-selmer-instance), [`AutomorphicCongruences:L5w/exceptional-height-one-primes`](#node-l5w-exceptional-height-one-primes), `PadicMeasuresIwasawaAlgebras:L4`.

**Sources.**

- **Wan-2015**, Theorems 3 and 101, pp.3–4 and 88–89: Parallel-family theorem with fractional and integral domains separated.

**Open obligations.** Full arithmetic Lean signatures; Normal coefficient-ring characteristic and faithful descent extensions; Polarized rank-four extension and localized congruence model. See the detailed list below.

<a id="node-l5w-arithmetic-specialization"></a>

#### Arithmetic specialization with control corrections

`AutomorphicCongruences:L5w/arithmetic-specialization` (comparison).

Suggested name: `wanArithmeticSpecialization`.

**Statement.** At the ordinary weight-two point φ:I→O giving g\_F, extend φ to Λ\_D→Λ\_M and compare the specialized Rankin function with the fixed-form normalization. Choose the principal analytic majorant (f) containing the big divisorial characteristic ideal, as supplied by the family divisibility. Prove φ(f)≠0 and the ordinary Selmer control hypotheses; SU Corollary 3.2.9 then gives char\_ΛM(X\_specialized)⊂(φ(f)), with any nonvanishing Tor/local correction retained in the precise corrected bound. This does not assert that the image of a possibly nonprincipal big characteristic ideal contains the specialized characteristic ideal. In a separately proved principal/UFD case one may take f to be a characteristic generator. The Eisenstein coefficient kernel has only the stated base-change inclusion until its own kernel compatibility is proved.

**Hypotheses.**

- φ is the point of the same parallel family; the integral period/projector matches the fixed-form normalization.
- Finite Selmer duals and compatible ordinary/away-p local conditions; residual no-invariants and local ordinary quotient hypotheses needed for control. A height-one generator must have nonzero specialization before cancellation.

**Proof outline.**

1. Use the imported Hida control theorem to identify the form and its Galois lattice at φ.
2. Apply derived control and its Tor spectral sequence; prove the kernel/localization-image corrections vanish using the actual residual representation, not irreducibility as a generic substitute.
3. Apply SU Corollary 3.2.9 to a nonzero-specializing principal majorant f of the big characteristic divisor, in particular the analytic Rankin bound. Then compare its specialized period and Euler factors on the same O\[\[Γ\_M\]\]. Rational-specialization supplies only its rational-lattice statement; it does not prove the integral comparison.
4. Use P7 residual Nakayama only for a pseudo-coherent comparison cone; use R03.6 support-base-change for finite modules only.

**Checks.**

- No assertion that tensor product commutes with every Selmer kernel.
- No replacement of a normal Hida branch by a regular ring just because it is finite flat.
- A map applied to a divisorial ideal is not used as a characteristic-ideal specialization theorem; the selected principal analytic majorant and its nonzero specialization are explicit.

**Prerequisites.** [`AutomorphicCongruences:L5w/wan-family-divisibility`](#node-l5w-wan-family-divisibility), `SelmerIwasawaCohomology:L3/derived-control`, `SelmerIwasawaCohomology:L3/kernel-control`, `SelmerIwasawaCohomology:L3/rational-specialization`, `PadicFamilies:L5`, `DeformationAndDerivedPatchingAlgebra:P7/pseudo-coherent-residual-nakayama`, `DeformationAndDerivedPatchingAlgebra:R03.6/support-base-change`, `PadicMeasuresIwasawaAlgebras:L4`, [`AutomorphicCongruences:L0/selmer-specialization-control`](#node-l0-selmer-specialization-control).

**Sources.**

- **BCS-published**, Proof of Theorem 3.2.1, p.8 (arXiv v2 p.7): Weight-two specialization, whose control and integral normalization must be checked.
- **SU**, Proposition 3.2.8, Corollary 3.2.9, pp.23–24: Control followed by specialization of a principal majorant of the characteristic divisor; the normal coefficient ring need not be a UFD.

**Open obligations.** Integral fixed-form analytic/control refinements; Full arithmetic Lean signatures; Normal coefficient-ring characteristic and faithful descent extensions; Hilbert extensions of the L0 period and Selmer interfaces. See the detailed list below.

<a id="node-l5w-quartic-cm-divisibility"></a>

#### The BCS quartic-CM input

`AutomorphicCongruences:L5w/quartic-cm-divisibility` (theorem).

Atlas landmark: Quartic-CM divisibility.

Suggested name: `quarticCMDivisibility`.

**Statement.** For a weight-two elliptic newform g of level N and good ordinary p>3, let F be real quadratic with gcd(pN,D\_F)=1, and M/F CM quadratic, p split, gcd(NO\_F,D\_M/F)=1. Require residual irreducibility over M, the exact H1/minimal-lift conditions, both local inertia checks of the Fujiwara instance, and Δ+. If n− is squarefree with an even number of inert prime factors and the residual representation is ramified at each factor, prove (L\_p(g\_F/M))⊇char(X\_ord(g/M∞)) in O\[\[Γ\_M\]\], in the torsion case. State separately the source’s zero-ideal containment when the dual is not torsion; torsion must come from the explicit Selmer/Kato supplier. This is the source-qualified integral engine exported to L5a.

**Hypotheses.**

- All field, local and residual hypotheses in the statement; p>3 entails p≥5.
- The integral ordinary local conditions away p are BCS §2’s locally trivial ones; compare Wan’s inertia/Σ conventions through actual local Euler modules before changing primitive status.
- The fixed-form analytic object is the normalized specialization of the family object; sourceIssues E1/E5 record the incompatible inertia wording in Fujiwara/Wan, and E2 explains why ordinary Δ alone is not used to discharge the narrow condition.

**Proof outline.**

1. Verify the full minimal theorem instance and the canonical period.
2. Apply the family divisibility and arithmetic specialization targets on the same coefficient ring and lattice.
3. Remove precisely the Euler factors for the fixed primitive Selmer convention; record any nonunit rather than cancel it without a comparison.
4. Use the separate torsion supplier for a genuine characteristic ideal.

**Checks.**

- The empty n− product has zero factors and satisfies parity in degree two.
- The output is one divisibility; no quartic-CM main-conjecture equality is claimed.

**Prerequisites.** [`AutomorphicCongruences:L5w/fujiwara-instance`](#node-l5w-fujiwara-instance), [`AutomorphicCongruences:L5w/arithmetic-specialization`](#node-l5w-arithmetic-specialization), [`AutomorphicCongruences:L0/sigma-primitive-selmer`](#node-l0-sigma-primitive-selmer), [`AutomorphicCongruences:L0/primitive-imprimitive-comparison`](#node-l0-primitive-imprimitive-comparison), `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `SelmerIwasawaCohomology:L3`.

**Sources.**

- **BCS-published**, Theorem 3.2.1, pp.7–8; §2, pp.5–7: The quartic-CM specialization with strengthened explicit supplier conditions.
- **Wan-2015**, Theorems 8, 82 and 101, pp.6–7, 66–68, 88–89: Integral family input, not a universal torsion theorem.

**Open obligations.** Integral fixed-form analytic/control refinements; Torsion and local convention bridge; Full arithmetic Lean signatures; Hilbert extensions of the L0 period and Selmer interfaces. See the detailed list below.

<a id="node-l5w-selected-base-change-hypotheses"></a>

#### Discharging the auxiliary-field hypotheses

`AutomorphicCongruences:L5w/selected-base-change-hypotheses` (application).

Suggested name: `selectedBaseChangeHypotheses`.

**Statement.** For K,F selected by L5a’s BCS Lemma 5.2.3 contract, prove the quartic engine’s conditions. K has odd discriminant not −3, all primes N split, and p splits; F has odd discriminant coprime pN, p inert, D\_F-primes split in K, and an N-prime ℓ is inert in F exactly when ℓ≡−1 mod p. Residual irreducibility holds over M=FK and G\_{F(ζ\_p)} (absolute irreducibility is verified for the elliptic application), with the p=5 exceptional case excluded. Then p splits in M/F, discriminants are coprime to N, n−=1, both local q\_v tests hold, and a minimal modular lift base-changes to a minimal lift over F. Ensure K has a new ramified prime outside D\_F, so M/F is ramified at a finite place and cannot lie in the narrow Hilbert class field.

**Hypotheses.**

- The complete selected-field conditions, rather than arbitrary quadratic fields, and the exact minimal modular lift over Q supplied by R04.6/R21.4.
- The p=5 auxiliary exclusion F≠Q(ζ5)+ is available; for elliptic representations the projective exception is also excluded by Fujiwara 9.8.

**Proof outline.**

1. Use the pinned multiquadratic Galois and prime-splitting declarations for F, K and their compositum; the character/tower identifications are inherited from the supplied elliptic/Selmer comparison. The current NumberFieldArithmetic roadmap records this splitting theory as built. Auxiliary-field existence stays in L5a.
2. At ℓ|N, inertness in F turns q=ℓ into q=ℓ²≡1 when ℓ≡−1; otherwise q≠−1 already. Outside N the residual representation is unramified; at p the ordinary residual representation is reducible/distinguished. Thus BOTH local inertia tests are discharged.
3. Match all six clauses of Fujiwara 6.11 under base change; invoke the specific local minimality theorem supplied by the deformation owner.
4. Since K is chosen ramified at a new odd prime outside D\_F, M/F is not unramified at all finite places. Verify n−=1 directly from Heegner splitting in K.

**Checks.**

- No Heegner or anticyclotomic endpoint is used.
- Record the ownership of auxiliary-field existence in L5a; this target verifies its Wan/Fujiwara application, not a second existence theorem.

**Prerequisites.** [`AutomorphicCongruences:L5w/quartic-cm-divisibility`](#node-l5w-quartic-cm-divisibility), `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`, `GlobalGaloisDeformations:R04.6`, `tauceti:NumberField.ncard_primesOver_multiquadratic_iff`, `tauceti:TauCeti.Multiquadratic.isGalois`.

**Sources.**

- **BCS-published**, Proposition 5.2.1 and Lemma 5.2.3, pp.11–12 (v2 pp.9–10): Discharge all conditions before using the weaker endpoint hypotheses.
- **Wan-2015**, Proof of Theorem 103, pp.91–92: Minimal base-change lift route.
- **Fujiwara**, Definition 6.11, pp.54–55; Proposition 9.8, p.83: Minimality and elliptic p=5 exception.

**Open obligations.** Exact minimal theorem and period suppliers; Full arithmetic Lean signatures. See the detailed list below.

<a id="layer-l5b"></a>

### Layer L5b: Four twists and cyclotomic factor separation

The early L5a product inequality is projected to the cyclotomic line through explicit Selmer and analytic comparisons. Quadratic decomposition produces four twists. Four Kato bounds and nonzero characteristic generators separate the factors, giving equality after p-inversion; the integral endpoint keeps the actual rank-one image condition. The dual is finite over Λ and torsion, which does not mean finite as an abelian group.

<a id="node-l5b-four-twist-lattice-dictionary"></a>

#### The four quadratic twists on integral Tate lattices

`AutomorphicCongruences:L5b/four-twist-lattice-dictionary` (comparison).

Suggested name: `fourTwistLatticeDictionary`.

**Statement.** For E/Q, distinct quadratic fields K imaginary and F real, and p>3 unramified in K and F, identify T\_p(E^χ) with T\_p(E)⊗χ integrally for χ∈{1,η\_K,η\_F,η\_Kη\_F}. Use the existing quadratic-twist point isomorphism and its character-equivariance, restrict to all p-power torsion and take the compatible inverse limit. Every twist has good ordinary reduction at p; its ordinary line is the transported line twisted by χ. The cyclotomic Iwasawa coefficient ring and reciprocal tautological action are the same for all four twists.

**Hypotheses.**

- E has good ordinary reduction at p; the quadratic discriminants are prime to p; all extensions and the algebraic closure embeddings are fixed.
- The inverse-limit transition maps and ordinary filtration are the actual Tate-module ones; no rational isogeny is substituted for an integral lattice equivalence.

**Proof outline.**

1. Apply the pinned Tau Ceti point-group isomorphism with its quadratic character, then restrict to E\[p^n\] and check compatibility with multiplication by p.
2. Pass to the inverse limit and verify the selected ordinary sublattice using unramified quadratic twisting at p.
3. For the product character use composition of the two twists and the canonical integral scalar action; keep the character Galois restriction maps.

**Checks.**

- A p-power index in the lattice comparison would invalidate the integral endpoint and must not be discarded.
- The product character is the third quadratic subfield character, not the real base-change representation g\_F.

**Prerequisites.** `tauceti:WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `SelmerIwasawaCohomology:L2`.

**Sources.**

- **BCS-published**, Proof of Theorem 1.1.2, p.12; Lemma 5.1.1, p.10: The four twists must satisfy Kato on their actual integral lattices.
- **SU**, §3.1.1–3.1.5, pp.16–19: Twisted coefficient convention used in Shapiro.

**Open obligations.** Torsion and local convention bridge; Full arithmetic Lean signatures. See the detailed list below.

<a id="node-l5b-quadratic-selmer-decomposition"></a>

#### Integral quadratic Selmer decomposition

`AutomorphicCongruences:L5b/quadratic-selmer-decomposition` (theorem).

Atlas landmark: Quadratic Selmer decomposition.

Suggested name: `quadraticSelmerDecomposition`.

**Statement.** For any finite extension of the cyclotomic tower in the chosen setting, restriction and the idempotents (1±c)/2 give Sel\_ord(E/KQ∞)≅Sel\_ord(E/Q∞)⊕Sel\_ord(E^K/Q∞), on the discrete p-primary coefficients A\_χ=T\_p(E^χ)⊗\_Zp Q\_p/Z\_p derived from the integral lattices, with the matched ordinary local conditions. Compact T\_p(E^χ) itself is not used as a discrete Shapiro coefficient. The Pontryagin dual decomposition is Λ-linear. Apply it also to E^F and, when needed for the early torsion check, to the biquadratic compositum to obtain all four summands. For torsion duals, characteristic ideals multiply exactly. At away-p places retain the localization-image and primitive/imprimitive errors until the matching local-condition comparison proves them absent.

**Hypotheses.**

- p odd makes 2 a unit; coefficient ring O is the fixed p-adic integer ring.
- The ordinary sublattice is stable under the larger decomposition group and transports to both primes of K over p; the same Σ is pulled back from Q.
- The local condition is specified: BCS uses the locally trivial away-p condition; the inertia-kernel convention in SU requires a proved comparison or explicit Euler corrections.

**Proof outline.**

1. Apply ProfiniteCohomology Shapiro to the finite-level discrete p-primary coefficients, then pass through the compatible filtered direct limit. For the Iwasawa model use the discrete module T⊗Λ∨ with the reciprocal tautological action. The Selmer L2/L3 supplier supplies continuity, duality and global/local transition maps; do not invoke this discrete theorem on compact T\_p(E) itself.
2. Split the quadratic group ring using the integral ± idempotents, dualize, and use the Tate-twist lattice dictionary.
3. Apply the existing characteristic-ideal multiplicativity theorem only after proving finiteness and torsion.

**Checks.**

- After inverting p the decomposition agrees with the rational representation decomposition.
- At p=2 the idempotents are unavailable; the theorem excludes that case.
- The compact Tate lattice and the discrete p-primary module are distinguished; discrete Shapiro is used only on the latter.

**Prerequisites.** [`AutomorphicCongruences:L5b/four-twist-lattice-dictionary`](#node-l5b-four-twist-lattice-dictionary), `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma`, `SelmerIwasawaCohomology:L3/kernel-control`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`, `SelmerIwasawaCohomology:L2`, `SelmerIwasawaCohomology:L3`.

**Sources.**

- **SU**, Lemma 3.1.5, p.19; Lemma 3.2.5, p.22: Integral quadratic and cyclotomic-tower decompositions.
- **BCS-published**, Proof of Theorem 1.1.2, p.12: The decomposition used in four-factor descent.

**Open obligations.** Torsion and local convention bridge; Full arithmetic Lean signatures. See the detailed list below.

<a id="node-l5b-cyclotomic-analytic-factorization"></a>

#### Period-normalized analytic quadratic factorization

`AutomorphicCongruences:L5b/cyclotomic-analytic-factorization` (theorem).

Atlas landmark: Cyclotomic analytic factorization.

Suggested name: `cyclotomicAnalyticFactorization`.

**Statement.** For E/Q and imaginary quadratic K with odd discriminant, p split and all N-primes split, project the Perrin–Riou Rankin function to the cyclotomic line. With CGS’s normalization by deg(π\_E)/c\_E² and H\_p(E), prove (π+L\_PR(E/K))=(L\_MSD(E/Q)L\_MSD(E^K/Q)) in the integral cyclotomic coefficient ring when the analytic objects are integral, and in its p-inversion for the rational normalization. The relation is up to a Λ\_Q-unit; its derivation tracks the discriminant character factor, the constant discriminant/twist-period scalar and the real-component factor, with p odd. Prove the analogous identity for E^F using its own Néron periods and primitive Euler factors.

**Hypotheses.**

- The modular parametrization π\_E, Manin constant c\_E, ordinary unit root α\_p and Néron differentials of E and E^K are the actual objects used by CGS.
- Use a common coefficient extension containing the character values and required discriminant/period scalars, then descend by the supplier’s faithful coefficient comparison. All four primitive functions are nonzero.
- At E^F its level may acquire D\_F²; those primes split in K, so its required Heegner and period comparison conditions still hold.
- Keep the actual period ratio, including the discriminant square root implicit in CGS Remark 1.2.3. In the selected split, prime-to-p case it contributes a p-adic unit; no exact equality of unscaled complex periods is assumed.

**Proof outline.**

1. Import the MSD/Rankin interpolation carriers; compare at finite characters of positive p-power conductor using complex quadratic factorization and the Gauss-sum identity.
2. Use π\_E*ω\_E=c\_Eω\_f and integration under the finite map: the raw Petersson integral is deg(π\_E)/c\_E² times the raw Néron area. With CGS’s Ω\_E/K, division by sqrt(|D\_K|) also occurs, so its displayed identity misses that factor (E7). Track the resulting discriminant and twist-period scalars under the chosen p-adic embedding; they are units since p splits and avoids D\_K. The real-component factor is a power of two.
3. Use uniqueness of the bounded p-adic measure/interpolation on the stated domain, not bare Zariski density.
4. Repeat for E^F with its own Manin constant, modular degree and Néron differential, matching every tame Euler factor. Descend a finite coefficient extension by faithful extension/contraction after the characteristic base-change comparison, not by the norm theorem for restriction of scalars.

**Checks.**

- There is no assumed canonical-period-over-F equals period-over-Q squared identity.
- Do not use a character interpolation identity before checking the functions lie in the same bounded/integral function space.

**Prerequisites.** [`AutomorphicCongruences:L5b/four-twist-lattice-dictionary`](#node-l5b-four-twist-lattice-dictionary), `ModularSymbolsPadicLFunctions:L1`, `ModularSymbolsPadicLFunctions:L2`, `AutomorphicPadicLFunctions:L5`, `PadicMeasuresIwasawaAlgebras:L4`, `mathlib:Ideal.span_singleton_mul_left_unit`.

**Sources.**

- **CGS-v1**, Definition 1.2.2, Remark 1.2.3, Proposition 1.2.4 and proof, pp.7–8: The actual Perrin–Riou to MSD normalization and cyclotomic product.
- **BCS-published**, Proof of Theorem 1.1.2, p.12: Apply analytic factorization to both quadratic-twist pairs.
- **CGS-v2**, Definition 2.2.2, Remark 2.2.3 and Proposition 2.2.4, pp.7–8: The same normalization and missing discriminant factor persist in the final preprint; the cyclotomic ideal identity requires unit tracking rather than the literally displayed complex period equality.

**Open obligations.** Integral fixed-form analytic/control refinements; Full arithmetic Lean signatures; Normal coefficient-ring characteristic and faithful descent extensions. See the detailed list below.

<a id="node-l5b-rank-one-image-twist"></a>

#### The rank-one image condition survives quadratic twisting

`AutomorphicCongruences:L5b/rank-one-image-twist` (theorem).

Suggested name: `rankOneImageQuadraticTwist`.

**Statement.** Let T=T\_p(E), p odd, and σ∈G\_Q(μ\_p∞) satisfy T/(σ−1)T≅Z\_p as Z\_p-modules. Then every quadratic twist T⊗χ satisfies the same condition for some element of G\_Q(μ\_p∞). If χ(σ)=1 use σ. If χ(σ)=−1 use σ²: det ρ(σ)=1, the free rank-one cokernel forces ρ(σ) to be a nontrivial unipotent with unit off-diagonal in a suitable integral basis, and σ²−1 doubles that unit. The factor 2 is a unit. Hence one exact (im) hypothesis on E suffices for all four twists; residual surjectivity is only a stronger sufficient condition.

**Hypotheses.**

- The determinant is the cyclotomic character, so it equals 1 on the chosen group.
- T is free rank two over Z\_p; the cokernel is free of rank one, rather than merely having rank one after tensoring with Q\_p.
- χ takes values ±1 and p>2.

**Proof outline.**

1. Use the direct-summand kernel/image consequence of the free cokernel and determinant one to choose an integral unipotent basis.
2. Compute (1+N)²−1=2N, N²=0, on the same lattice.
3. Use χ(σ²)=1 and invertibility of 2 to preserve the integral cokernel; pass through the existing twist-lattice equivalence.

**Checks.**

- The matrix \[\[1,p\],\[0,1\]\] has cokernel Z\_p⊕Z/p and fails (im).
- For p=2 the squaring argument loses the unit and the target is not asserted.

**Prerequisites.** [`AutomorphicCongruences:L5b/four-twist-lattice-dictionary`](#node-l5b-four-twist-lattice-dictionary), `KatoEulerSystems:L4`.

**Sources.**

- **BCS-published**, Theorem 1.1.2(b), p.2; proof, p.12: The exact image condition used for the integral four-twist argument.
- **Kato**, Theorem 17.4, p.273: The integral strengthening needs an integral lattice condition, not just rational rank.

**Open obligations.** Full arithmetic Lean signatures. See the detailed list below.

<a id="node-l5b-cyclotomic-control"></a>

#### Cyclotomic projection and characteristic inequality

`AutomorphicCongruences:L5b/cyclotomic-control` (comparison).

Suggested name: `cyclotomicControl`.

**Statement.** For each of E and E^F over K, construct the map X\_ord(K∞)/I−X\_ord(K∞)→X\_ord(KQ∞), where π+:Λ\_K→Λ\_Q and I−=ker π+. Under the actual no-invariants, ordinary inertia-quotient and primitive local-control hypotheses, prove the required isomorphism; otherwise retain the finite/pseudo-null correction with its divisor. In the exact case, π+(char\_ΛK X)⊇char\_ΛQ(X/I−X). This is a divisibility, not a general equality of specialized characteristic ideals. Use Kato’s cyclotomic torsion for the two twists and Nakayama with the finite dual to establish the torsion needed for the nonzero two-variable characteristic ideal.

**Hypotheses.**

- Λ\_K≅O\[\[T+,T−\]\], Λ\_Q≅O\[\[T+\]\] are normal domains with the actual continuous quotient map.
- The source control condition excludes a trivial subquotient of T* over the tower; its p-inertia quotient action factors through the cyclotomic group. Σ∪{p} contains every ramified prime for the imprimitive comparison.
- Every removed Euler factor is compared on both sides before passing back to primitive Selmer groups; specialization of the analytic/characteristic generator is nonzero.

**Proof outline.**

1. Apply the Selmer kernel-control theorem to global and local restriction maps, including the image of localization.
2. Use SU 3.2.8 and 3.2.11 on the verified ordinary lattice; import derived control for correction complexes.
3. Apply the Fitting-to-characteristic inequality of SU 3.2.9(ii) or its exact supplier implementation.
4. Use the quadratic decomposition and early Kato torsion to prove the quotient dual torsion, then localized Nakayama to rule out positive generic rank of the two-variable dual. This does not import the completed cyclotomic equality.

**Checks.**

- π+(char X) is not replaced by char(X/I−X) without an additional theorem.
- The zero extended characteristic ideal of a non-torsion module cannot be canceled.

**Prerequisites.** [`AutomorphicCongruences:L5b/quadratic-selmer-decomposition`](#node-l5b-quadratic-selmer-decomposition), `SelmerIwasawaCohomology:L3/kernel-control`, `SelmerIwasawaCohomology:L3/derived-control`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility`, [`AutomorphicCongruences:L0/selmer-specialization-control`](#node-l0-selmer-specialization-control), [`AutomorphicCongruences:L0/primitive-imprimitive-comparison`](#node-l0-primitive-imprimitive-comparison).

**Sources.**

- **SU**, Proposition 3.2.8, Corollary 3.2.9(ii), Proposition 3.2.11, pp.23–24: Control and the correct direction of characteristic specialization.
- **BCS-published**, §5.1 and proof of Theorem 1.1.2, pp.10–12: The projection used for descent.

**Open obligations.** Integral fixed-form analytic/control refinements; Torsion and local convention bridge; Full arithmetic Lean signatures; Hilbert extensions of the L0 period and Selmer interfaces. See the detailed list below.

<a id="node-l5b-four-twist-kato-bound"></a>

#### Kato’s four ordinary bounds with period and image conditions

`AutomorphicCongruences:L5b/four-twist-kato-bound` (application).

Suggested name: `fourTwistKatoBound`.

**Statement.** For each E^χ in the selected set of four twists, apply the ordinary cyclotomic torsion and Euler-system bound on T\_p(E^χ), with the MSD/Néron period normalization: (L\_MSD(E^χ/Q))⊂char(X\_Eχ/Q∞) after inverting p. Under (im) on E, use its twist stability and the exact strengthened Kato elliptic contract to obtain all four inclusions integrally. The general non-CM modular-form 17.4(3) hypotheses and the elliptic (im) refinement are distinguished. If the endpoint includes CM curves, import their separately proved rational elliptic-unit bound; never apply a non-CM theorem to them.

**Hypotheses.**

- p>3 good ordinary, residual E\[p\] irreducible; the four quadratic characters are unramified at p, so each twist is good ordinary and residual irreducible.
- Nonzero primitive analytic functions, compatible dual-form lattices and good period generators.
- Integral version: exact (im) on the original Tate lattice, not an assertion that every irreducible residual representation is surjective.

**Proof outline.**

1. Check the four residual representations remain irreducible under scalar quadratic twisting and the actual integral Tate lattices match.
2. Invoke the rational ordinary supplier, including the separate CM branch if applicable.
3. For the integral case invoke the (im) refinement and the rank-one-twist theorem; preserve every period, bad-prime Euler factor and local-condition comparison.
4. Use the analytic nonvanishing supplier before factoring characteristic generators.

**Checks.**

- No HE.8b or completed main-conjecture equality is used as an upper bound.
- The existing Kato packet does not yet prove the exact elliptic (im)+MSD refinement; the precise request is retained.

**Prerequisites.** `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility`, `KatoEulerSystems:L4/cm-exclusion-and-the-separate-treatment`, `KatoEulerSystems:L4/analytic-twist-nonvanishing`, [`AutomorphicCongruences:L5b/rank-one-image-twist`](#node-l5b-rank-one-image-twist), [`AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`](#node-l5b-cyclotomic-analytic-factorization).

**Sources.**

- **Kato**, Theorem 17.4 and §17.5, pp.273–274; Theorem 12.5, pp.221–222: Rational torsion/divisibility and qualified integral hypotheses.
- **BCS-published**, Theorem 1.1.2 and its proof, pp.2,12: The elliptic (im) refinement used on all four factors.

**Open obligations.** Exact elliptic image refinement and CM upper bound; Full arithmetic Lean signatures. See the detailed list below.

<a id="node-l5b-four-factor-product-bound"></a>

#### The early four-factor cyclotomic bound

`AutomorphicCongruences:L5b/four-factor-product-bound` (theorem).

Atlas landmark: Four-twist product bound.

Suggested name: `fourFactorProductBound`.

**Statement.** For the auxiliary K,F supplied by L5a’s Lemma 5.2.3 contract, project its early integral ordinary product bound (L\_PR(E/K)L\_PR(E^F/K))⊇char(X\_E/K∞)char(X\_EF/K∞) to Λ\_Q. The analytic factorization, Selmer decompositions and correctly oriented characteristic-control comparisons give ∏\_{χ∈{1,η\_K,η\_F,η\_Kη\_F}}(L\_MSD(E^χ/Q))⊇∏\_χ char(X\_Eχ/Q∞). The same assertion holds after p-inversion. This is the only reverse input used for factor separation; it is not an individual reverse inequality.

**Hypotheses.**

- All of L5a’s selected-field, minimality, μ and integral product-bound conditions are proved in that supplier; the Fourier/period/Euler normalization is matched here.
- The four cyclotomic duals are finite torsion and the four functions nonzero; the control and analytic comparison targets apply to E and E^F.

**Proof outline.**

1. Import the early Proposition 5.2.1 bound, independently of the Heegner endpoint; the μ upgrade belongs to L5a.
2. Extend the product ideal through π+ using Ideal.map\_mul, then apply the analytic identity.
3. Use the two Selmer projection inequalities and quadratic multiplicativity to reach the four-factor characteristic product on the same ring.

**Checks.**

- HE.8b, Theorem 4.2.1 and the anticyclotomic main conjectures are not prerequisites.
- Record the product orientation: characteristic product is contained in the analytic product ideal.

**Prerequisites.** [`AutomorphicCongruences:L5a/two-variable-product-containment`](#node-l5a-two-variable-product-containment), [`AutomorphicCongruences:L5a/auxiliary-field-existence`](#node-l5a-auxiliary-field-existence), [`AutomorphicCongruences:L5b/cyclotomic-control`](#node-l5b-cyclotomic-control), [`AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`](#node-l5b-cyclotomic-analytic-factorization), `mathlib:Ideal.map_mul`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`.

**Sources.**

- **BCS-published**, Proposition 5.2.1, pp.11–12; proof of Theorem 1.1.2, p.12: The early product bound and its four-factor cyclotomic projection.

**Open obligations.** Integral fixed-form analytic/control refinements; Torsion and local convention bridge; Full arithmetic Lean signatures. See the detailed list below.

<a id="node-l5b-factor-separation"></a>

#### Separating four characteristic factors

`AutomorphicCongruences:L5b/factor-separation` (theorem).

Atlas landmark: Characteristic-factor separation.

Suggested name: `factorSeparation`.

**Statement.** Over A=O\[\[Γ\_Q\]\] or A\[1/p\], a noetherian normal UFD, let all X\_χ be finite torsion, J\_χ=char\_A(X\_χ) nonzero principal, and L\_χ nonzero. Suppose (L\_χ)⊂J\_χ separately for each χ and ∏J\_χ⊂(∏L\_χ). Then J\_χ=(L\_χ) for every χ. At each height-one prime, each ord(L\_χ)−ord(J\_χ) is nonnegative and their sum is nonpositive; hence each is zero. Equivalently choose generators j\_χ, write L\_χ=j\_χa\_χ and conclude ∏a\_χ is a unit, so each a\_χ is a unit. This argument needs every individual upper inequality; the product bound alone cannot separate factors.

**Hypotheses.**

- All four factors lie in the same domain and use the same integral/rational coefficient extension and primitive normalizations.
- Torsion and nonvanishing have already been proved; principal characteristic ideals are supplied by the Iwasawa algebra owner.
- The integral claim uses integral inequalities at the prime (p) too; rational equality has no information there.

**Proof outline.**

1. Import UFD characteristic ideals and their height-one lengths. If the analytic comparison uses a finite coefficient extension, request its faithful characteristic base-change and ideal-contraction theorem; L4/api-9 concerns a norm after restriction of scalars and is not that theorem.
2. Choose nonzero generators or work with the associated finite effective divisors; orient the inequalities correctly.
3. Apply the four individual Kato inequalities and early product inequality; use normality/principality to conclude equality of ideals.

**Checks.**

- A rational equality cannot be upgraded integrally without eliminating the p-primary defect.
- Test a product with factors p and p^−1 over the fraction field: without individual upper bounds a product equality gives no integral factor equality.

**Prerequisites.** [`AutomorphicCongruences:L5b/four-factor-product-bound`](#node-l5b-four-factor-product-bound), [`AutomorphicCongruences:L5b/four-twist-kato-bound`](#node-l5b-four-twist-kato-bound), `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4`.

**Sources.**

- **BCS-published**, Proof of Theorem 1.1.2, p.12: Nonnegative defects and factorwise equality.

**Open obligations.** Full arithmetic Lean signatures; Normal coefficient-ring characteristic and faithful descent extensions. See the detailed list below.

<a id="node-l5b-rational-cyclotomic-endpoint"></a>

#### BCS’s rational cyclotomic theorem

`AutomorphicCongruences:L5b/rational-cyclotomic-endpoint` (theorem).

Atlas landmark: Rational cyclotomic equality.

Suggested name: `rationalCyclotomicEndpoint`.

**Statement.** For E/Q and good ordinary p>3 with E\[p\] irreducible as a G\_Q-module, X\_ord(E/Q∞) is finite Λ\_Q-torsion and char\_ΛQ(X)Λ\_Q\[1/p\]=(L\_p(E/Q))Λ\_Q\[1/p\]. Here L\_p is the MSD function with the actual Néron periods, and X is the Pontryagin dual of the classical p-primary Selmer group. Apply the auxiliary-field existence supplied by L5a, the four-factor product bound and Kato’s rational individual inequalities, then select the trivial character factor. No residual surjectivity or multiplicative-reduction prime is added.

**Hypotheses.**

- Precisely p>3 good ordinary and residual irreducibility, plus the verified supplier conclusions used to construct the auxiliary fields and compare classical/ordinary Selmer conventions.
- CM and non-CM curves use the correct separately owned upper-bound route.

**Proof outline.**

1. Choose K,F by the supplier’s existence theorem and verify all field/local hypotheses, including the new ramified K-prime refinement.
2. Apply factor separation over Λ\_Q\[1/p\] to the four finite torsion cyclotomic duals.
3. Use the actual classical-Selmer versus ordinary-Galois-Selmer comparison, with primitive local conditions; descend coefficient scalars if enlarged.
4. Export the equality to ModularIwasawaMainConjectures:L3, never import that consumer’s result back.

**Checks.**

- It includes p=5; p=3 and supersingular reduction are outside scope.
- The statement remains rational even if an integral analytic object is separately available.

**Prerequisites.** [`AutomorphicCongruences:L5b/factor-separation`](#node-l5b-factor-separation), [`AutomorphicCongruences:L5a/auxiliary-field-existence`](#node-l5a-auxiliary-field-existence), `SelmerIwasawaCohomology:L2`, `PadicMeasuresIwasawaAlgebras:L4`.

**Sources.**

- **BCS-published**, Theorem 1.1.2(a), p.2; proof, p.12: The endpoint under irreducibility, after p-inversion.

**Open obligations.** Exact elliptic image refinement and CM upper bound; Full arithmetic Lean signatures; Normal coefficient-ring characteristic and faithful descent extensions. See the detailed list below.

<a id="node-l5b-integral-cyclotomic-endpoint"></a>

#### BCS’s integral rank-one-image refinement

`AutomorphicCongruences:L5b/integral-cyclotomic-endpoint` (application).

Suggested name: `integralCyclotomicEndpoint`.

**Statement.** Under the rational endpoint hypotheses and (im): there exists σ∈G\_Q(μ\_p∞) with T\_p(E)/(σ−1)T\_p(E)≅Z\_p as Z\_p-modules, prove char\_ΛQ(X\_ord(E/Q∞))=(L\_p(E/Q)) in Λ\_Q itself. Apply the twist-stable (im) hypothesis and the integral Kato inequalities to all four factors, then separate them using the integral early product bound. Every p-power lattice, Euler and period discrepancy has been accounted for before equality. Residual surjectivity is not substituted for (im); its use is only as a sufficient implication if separately proved.

**Hypotheses.**

- Exactly the preceding rational endpoint hypotheses and the free rank-one quotient condition on the integral Tate lattice.
- The early product bound, analytic factorization and all four Kato bounds are integral on the same lattice and Néron-normalized functions.

**Proof outline.**

1. Use rankOneImageQuadraticTwist, not rational lattice independence, for the four integral upper bounds.
2. Apply factorSeparation in Λ\_Q, including the height-one prime (p).
3. Descend any coefficient extension by the faithful characteristic-ideal/analytic comparison supplier; export precisely this hypothesis-bearing endpoint to the consumer.

**Checks.**

- A cokernel with nonzero finite p-torsion fails the hypothesis.
- The theorem does not assume a canonical Hilbert period is the square of an elliptic period.

**Prerequisites.** [`AutomorphicCongruences:L5b/rank-one-image-twist`](#node-l5b-rank-one-image-twist), [`AutomorphicCongruences:L5b/factor-separation`](#node-l5b-factor-separation), [`AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`](#node-l5b-rational-cyclotomic-endpoint), `PadicMeasuresIwasawaAlgebras:L4`.

**Sources.**

- **BCS-published**, Theorem 1.1.2(b), p.2; proof, p.12: Integral equality under the exact image condition.

**Open obligations.** Exact elliptic image refinement and CM upper bound; Full arithmetic Lean signatures; Normal coefficient-ring characteristic and faithful descent extensions. See the detailed list below.

## Library baseline and mathematical obligations

The prototypes use Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current upstream roadmap scope is checked separately from implementation at these pins. The library audit records the arithmetic layers as unbuilt. The following declarations are imported ingredients, not evidence that the Selmer, unitary-form, zeta-morphism or period targets are already formalized.

| Imported declaration | Module | Available ingredient |
| --- | --- | --- |
| `mathlib:Module.length` | `Mathlib/RingTheory/Length.lean` | The module length in ℕ∞, defined using the Krull dimension of the submodule lattice. Exact-sequence additivity is additional length theory, not the statement of this definition. |
| `mathlib:LocalizedModule` | `Mathlib/Algebra/Module/LocalizedModule/Basic.lean` | The localization of a module at a submonoid, used for lengths at height-one primes. |
| `mathlib:Ideal.span` | `Mathlib/RingTheory/Ideal/Span.lean` | The ideal generated by a set. |
| `mathlib:Ideal.map` | `Mathlib/RingTheory/Ideal/Maps.lean` | The extension of an ideal along a ring homomorphism. |
| `mathlib:RingHom.ker` | `Mathlib/RingTheory/Ideal/Maps.lean` | The kernel of a ring homomorphism as an ideal. |
| `mathlib:IsDiscreteValuationRing` | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean` | Discrete valuation rings (the coefficient ring A of the lattice datum). |
| `mathlib:IsReduced` | `Mathlib/Algebra/GroupWithZero/Basic.lean` | Reduced rings (no nonzero nilpotents). |
| `mathlib:Matrix.charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean` | det(XI−M), with this precise polynomial convention. SU uses det(1−TM); convert by the reciprocal-polynomial identity rather than identifying the two definitions. |
| `mathlib:MvPowerSeries` | `Mathlib/RingTheory/MvPowerSeries/Basic.lean` | Multivariate formal power series, the carrier of Λ = O\[\[X\_1, X\_2, X\_3\]\] and of Iwasawa algebras in coordinates. |
| `mathlib:UniqueFactorizationMonoid` | `Mathlib/RingTheory/UniqueFactorizationDomain/Defs.lean` | Unique factorization, used for the factorial ring Λ in FW Prop. 5.5. |
| `mathlib:IsLocalRing` | `Mathlib/RingTheory/LocalRing/Defs.lean` | The local-ring class: nontriviality and the unit alternative when a+b=1. Residue-field unit criteria are consequences supplied by its API. |
| `mathlib:IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean` | Regular local rings (Λ is regular; 𝕋 need not be). |
| `tauceti:TauCeti.ContCohomology.H1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` | At the Tau Ceti pin, the additive quotient of continuous 1-cocycles by coboundaries (LowDegree.lean:674). This alone supplies neither the compact Iwasawa coefficient construction nor its intended topology; those are imported through the continuous-cochain suppliers. |
| `mathlib:Ideal.comap` | `Mathlib/RingTheory/Ideal/Maps.lean` | Preimage ideal under a ring homomorphism; coefficient kernel of the specialized Eisenstein quotient. |
| `mathlib:Ideal.mem_comap` | `Mathlib/RingTheory/Ideal/Maps.lean` | Membership is membership of the mapped element; no flatness assumption. |
| `mathlib:Ideal.map_span` | `Mathlib/RingTheory/Ideal/Maps.lean` | Extension of a generated ideal is generated by the images. |
| `mathlib:Ideal.map_mul` | `Mathlib/RingTheory/Ideal/Maps.lean` | Extension of ideals respects products; it does not commute with kernels in general. |
| `mathlib:Ideal.span_singleton_mul_left_unit` | `Mathlib/RingTheory/Ideal/Span.lean` | Multiplying a generator by a unit does not change its principal ideal. |
| `tauceti:WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map` | `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean` | Quadratic-character equivariance of the existing elliptic point-group isomorphism over a separable quadratic tower. Restriction to p-power torsion, compatible inverse limits and the ordinary filtration are additional comparison obligations; this declaration alone does not supply them. |
| `tauceti:NumberField.ncard_primesOver_multiquadratic_iff` | `TauCeti/NumberTheory/Multiquadratic/MultiquadraticSplitting.lean` | For a number field generated by finitely many square roots of integers, an odd prime avoiding the radicands splits completely exactly when all the radicands have Legendre symbol one. Applies to the selected F, K and FK splitting checks; does not prove auxiliary-field existence. |
| `tauceti:TauCeti.Multiquadratic.isGalois` | `TauCeti/NumberTheory/Multiquadratic/Galois/Basic.lean` | The intermediate field generated by specified square roots is Galois when two is nonzero in the base field. Supplies the existing compositum carrier, not the auxiliary arithmetic selection or the Selmer character comparison. |

### Obligations retained by the target statements

These obligations include missing comparisons and unread proof inputs. A downstream theorem inherits the obligations of its prerequisites. The two-field adapters and the strengthened auxiliary-field choice are retained explicitly even where the available prototype has an exact cross-part node link.

**fw-4-8-sketch.** FW §4.8 only indicates the proof of Thm 1.6 (a shorter adaptation of §4.6, with the weight-two case referred to Castella–Wan Thm 3.8). The removal of the power of p in the ordinary case, the twist/factor separation of f ⊗ χ\_K and the transfer to the cyclotomic line are not written out in the source; L2/fw-ordinary-reverse-bound states the route and its inputs.

Consumers: [`AutomorphicCongruences:L2/fw-ordinary-reverse-bound`](#node-l2-fw-ordinary-reverse-bound).

**ichino-triple-product.** Ichino's triple product formula for definite U(2)/D^× and the local triple product integrals are used by CLW §7, FW Prop. 7.29 and Wan20 but are planned by no atlas stage; requested from AutomorphicLFunctionsAndLocalFactors:AL.3.

Consumers: [`AutomorphicCongruences:L2s/fourier-jacobi-primitivity`](#node-l2s-fourier-jacobi-primitivity), [`AutomorphicCongruences:L2/fw-fourier-jacobi-unit`](#node-l2-fw-fourier-jacobi-unit).

**harris-cap.** Harris (1984) Theorem 2.5.6 (no holomorphic CAP forms of the relevant weights on U(3,1)) is used in the CAP-exclusion step of CLW and FW and is planned by no atlas stage; it was not read.

Consumers: [`AutomorphicCongruences:L2s/cap-exclusion`](#node-l2s-cap-exclusion).

**klz-not-read.** Kings–Loeffler–Zerbes (2017) Def. 8.1.1, Prop. 8.1.7, Thm 10.2.2 and Loeffler–Lei–Zerbes (2014) Lemma 6.8.9 were not read; the Beilinson–Flach construction and reciprocity law are stated through Castella–Wan Thm 3.6 and FW §4.4.

Consumers: [`AutomorphicCongruences:L2/klz-beilinson-flach-classes`](#node-l2-klz-beilinson-flach-classes), [`AutomorphicCongruences:L2/bf-explicit-reciprocity`](#node-l2-bf-explicit-reciprocity).

**hida-tilouine-not-read.** The exact CM-theta congruence-ideal/Katz comparison and Rankin denominator theorem from HT93/HT94/Hid06 invoked by CLW Thm 8.2.1(2), PDF p. 81, remain unread. The node has been narrowed to this imaginary-quadratic application; no general CM main conjecture is asserted. Supply the theorem hypotheses and integral map for the CM family satisfying ξ\_p≢ξ\_p̄. CLW additionally specifies HT93 Thm 7.1 and (8.8b), and Hid91 Lemma 5.3(vi); these exact period/congruence maps are the request, not a generic CM-field main-conjecture assertion.

Consumers: [`AutomorphicCongruences:L0/hida-tilouine-anticyclotomic`](#node-l0-hida-tilouine-anticyclotomic), [`AutomorphicCongruences:L2s/clw-integrality-and-p-inverted`](#node-l2s-clw-integrality-and-p-inverted).

**ordinary-bstw-owner.** The ordinary BSTW two-variable zeta element, its two reciprocity laws and the ordinary Perrin-Riou/Greenberg comparison have the single planned owner KatoEulerSystems L5 (RS-11, RT-AREA-iwasawa-1/30), which is not yet a stage; RankZeroOneBSD:BSD.6a owns only the supersingular construction. L5a/ordinary-two-variable-equivalence states the contract it consumes.

Consumers: [`AutomorphicCongruences:L5a/ordinary-two-variable-equivalence`](#node-l5a-ordinary-two-variable-equivalence), [`AutomorphicCongruences:L5a/two-variable-product-containment`](#node-l5a-two-variable-product-containment).

**su-proofs-cited.** The proofs of Skinner–Urban §§5, 6, 9, 10, 11 and 13.1–13.3 (Shimura varieties and Hida theory for GU(2,2), the Klingen and Siegel Eisenstein series and their Fourier coefficients, the auxiliary-prime analysis) were not read; the L1 nodes cite their numbered statements.

Consumers: [`AutomorphicCongruences:L1/gu22-hida-control`](#node-l1-gu22-hida-control), [`AutomorphicCongruences:L1/klingen-eisenstein-series`](#node-l1-klingen-eisenstein-series), [`AutomorphicCongruences:L1/nonsingular-coefficient-coprimality`](#node-l1-nonsingular-coefficient-coprimality).

**fw-crystalline-proofs.** The generic Pottharst analytic Iwasawa/Selmer-complex comparison over Λ\_{K,∞}, including the exact finite-slope base change used in FW §§4.4–4.6, has no verified supplier. The target and the selected boundedness/seed proofs were read, but a list of theorem statements is not a closed proof of this analytic step. The equal-Satake comparison of §4.7 also needs its Bianchi-family supplier contract.

Consumers: [`AutomorphicCongruences:L2/fw-crystalline-main-conjecture`](#node-l2-fw-crystalline-main-conjecture).

**nakamura-proofs.** The GL₂ local–global factorization must be supplied with the intrinsic BM co-Whittaker factor (untilde in arXiv v2), its finite-level/type coinvariant maps and the unconditional GL₂ essential-vector theorem. The corresponding generic upstream API exists, but its conditional family construction alone does not discharge this instance. Preserve the separate p=3 Paškūnas–Tung extension request.

Consumers: [`AutomorphicCongruences:L3/completed-homology-factorization`](#node-l3-completed-homology-factorization), [`AutomorphicCongruences:L3/nakamura-specialization-theorem`](#node-l3-nakamura-specialization-theorem).

**vatsal-mu.** Vatsal (2003) µ = 0 for anticyclotomic L-values, used in SU Prop. 12.3.6 and Prop. 13.4.1, is a recorded gap of AutomorphicPadicLFunctions:L3h (finis-divisibility); the L1 statements depending on it inherit that gap.

Consumers: [`AutomorphicCongruences:L1/su-padic-l-function`](#node-l1-su-padic-l-function), [`AutomorphicCongruences:L1/nonsingular-coefficient-coprimality`](#node-l1-nonsingular-coefficient-coprimality).

**integral-period-dictionary.** PadicFamilies:L1’s family-period-line records an integral homology/cohomology comparison gap. Supply a map of the saturated EPW period lattice to SU’s cohomological canonical-period lattice and prove the scalar is a unit before transporting integral normalizations. SU’s own Lemma 12.2.2 remains the source of the formula here.

Consumers: [`AutomorphicCongruences:L0/canonical-period-congruence-number`](#node-l0-canonical-period-congruence-number).

**unitary-galois-adapter.** AG2.2/shin-regular-geometric-existence assumes a CM field EF⁺ with \[F⁺:Q\]≥2 and its stated ramification conditions. It does not directly supply SU Thm 7.1.1 over imaginary quadratic K. Supply the descent/base-change and discrete constituent assembly in that exact range, including the local p filtration; retain the CAP argument separately.

Consumers: [`AutomorphicCongruences:L1/gu22-galois-pseudocharacter`](#node-l1-gu22-galois-pseudocharacter), [`AutomorphicCongruences:L2s/cap-exclusion`](#node-l2s-cap-exclusion).

**hida-representation-conventions.** PadicFamilies:L4’s ordinary big representation is in an Ochiai cohomological dual/twist normalization. Supply the explicit dual, Tate twist and Frobenius dictionary to SU’s ρ\_f and to the CW critical twist before identifying their integral lattices. Generic family existence alone does not identify these carriers.

Consumers: [`AutomorphicCongruences:L1/eisenstein-datum`](#node-l1-eisenstein-datum), [`AutomorphicCongruences:L2/klz-beilinson-flach-classes`](#node-l2-klz-beilinson-flach-classes).

**general-weight-nonvanishing-repair.** FW Prop. 7.29 uses the original simultaneous-unit auxiliary choice. CLW’s later addendum replaces that argument for weight-two π by two Klingen families and joint height-one coprimality after inverting p. Supply its vector-valued/general-weight analogue, retaining FW’s archimedean and supercuspidal calculations, before discharging Lemma 7.31 and the downstream FW proof chain.

Consumers: [`AutomorphicCongruences:L2/fw-fourier-jacobi-unit`](#node-l2-fw-fourier-jacobi-unit), [`AutomorphicCongruences:L2/fw-greenberg-divisibility`](#node-l2-fw-greenberg-divisibility), [`AutomorphicCongruences:L2/fw-ordinary-reverse-bound`](#node-l2-fw-ordinary-reverse-bound), [`AutomorphicCongruences:L2/fw-crystalline-main-conjecture`](#node-l2-fw-crystalline-main-conjecture).

**unramified-regulator-supplier.** GH.7/yager-unramified-checkpoint records a request to the local regulator Part II, not a completed Yager/unramified-by-cyclotomic exponential. Supply that object and its lattice comparison before the boundedness proof is closed.

Consumers: [`AutomorphicCongruences:L2/unramified-exponential-boundedness`](#node-l2-unramified-exponential-boundedness).

**kato-integral-quotient-witness.** For the integral KatoEulerSystems:L4 bound used inside FW’s argument, supply an element τ over Q(ζ\_p∞) for which T/(τ−1)T is O-free of rank one (or the exact source-approved alternate hypothesis). Explain the passage from the selected Steinberg place and lattice to this integral witness; a rational one-dimensional quotient or residual irreducibility is insufficient.

Consumers: [`AutomorphicCongruences:L2/fw-ordinary-reverse-bound`](#node-l2-fw-ordinary-reverse-bound), [`AutomorphicCongruences:L2/fw-crystalline-main-conjecture`](#node-l2-fw-crystalline-main-conjecture).

**auxiliary-field-narrow-delta.** The reviewed L5w/selected-base-change-hypotheses contract requires K to have a new finite ramification prime outside D\_F, ensuring that M=FK is not contained in the narrow Hilbert class field of F (Wan 2015 Δ+, compared with BCS Δ; L5b source finding E2). L5a/auxiliary-field-existence lists the original BCS Lemma 5.2.3 conditions, but does not yet prove this additional simultaneous choice. Supply the refinement while preserving all splitting, minimality and residual restrictions. The broad existence claim is not silently strengthened during assembly.

Consumers: [`AutomorphicCongruences:L5a/auxiliary-field-existence`](#node-l5a-auxiliary-field-existence), [`AutomorphicCongruences:L5a/two-variable-product-containment`](#node-l5a-two-variable-product-containment).

**Exact minimal theorem and period suppliers.** R21.4’s written nodes do not yet export Fujiwara 11.1/11.2/11.5 in this exact ordinary Hilbert type. R04.6 must supply minimal lift and base-change minimality, and APL L3h must supply the matching quaternionic period/primitivity instance. Requests identify those mathematical targets; this packet does not redevelop their generic theories.

Consumers: [`AutomorphicCongruences:L5w/fujiwara-instance`](#node-l5w-fujiwara-instance), [`AutomorphicCongruences:L5w/canonical-period-duality`](#node-l5w-canonical-period-duality), [`AutomorphicCongruences:L5w/quaternionic-period-primitivity`](#node-l5w-quaternionic-period-primitivity), [`AutomorphicCongruences:L5w/selected-base-change-hypotheses`](#node-l5w-selected-base-change-hypotheses).

**Integral fixed-form analytic/control refinements.** Wan 82 is integral for the imprimitive normalization with all bad primes removed; arbitrary Σ is only fractional. The BCS fixed primitive integral landing, coefficient/ordinary Selmer control and Euler reinstatement need the exact requested maps. Bare interpolation, density, finite flatness or the Katz carrier do not supply them.

Consumers: [`AutomorphicCongruences:L5w/klingen-interpolation`](#node-l5w-klingen-interpolation), [`AutomorphicCongruences:L5w/height-one-congruence`](#node-l5w-height-one-congruence), [`AutomorphicCongruences:L5w/arithmetic-specialization`](#node-l5w-arithmetic-specialization), [`AutomorphicCongruences:L5w/quartic-cm-divisibility`](#node-l5w-quartic-cm-divisibility), [`AutomorphicCongruences:L5b/cyclotomic-control`](#node-l5b-cyclotomic-control), [`AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`](#node-l5b-cyclotomic-analytic-factorization), [`AutomorphicCongruences:L5b/four-factor-product-bound`](#node-l5b-four-factor-product-bound).

**Torsion and local convention bridge.** Wan 101 uses characteristic ideal zero for a non-torsion dual. That convention is separated from genuine torsion characteristic ideals. The Selmer supplier must prove finiteness/torsion for the quartic and two-variable modules using compatible early Kato/control inputs, and compare local-trivial versus inertia Selmer conventions before cancellation.

Consumers: [`AutomorphicCongruences:L5w/galois-selmer-instance`](#node-l5w-galois-selmer-instance), [`AutomorphicCongruences:L5w/exceptional-height-one-primes`](#node-l5w-exceptional-height-one-primes), [`AutomorphicCongruences:L5w/quartic-cm-divisibility`](#node-l5w-quartic-cm-divisibility), [`AutomorphicCongruences:L5b/four-twist-lattice-dictionary`](#node-l5b-four-twist-lattice-dictionary), [`AutomorphicCongruences:L5b/quadratic-selmer-decomposition`](#node-l5b-quadratic-selmer-decomposition), [`AutomorphicCongruences:L5b/cyclotomic-control`](#node-l5b-cyclotomic-control), [`AutomorphicCongruences:L5b/four-factor-product-bound`](#node-l5b-four-factor-product-bound).

**Exact elliptic image refinement and CM upper bound.** The existing Kato packet retains a general large-image condition and p-power error; it does not yet supply the BCS (im)+MSD normalized integral export. Its separate CM early elliptic-unit input is also an explicit request. Endpoints here are planning targets contingent on those proved supplier results, not claims that the gaps are already filled.

Consumers: [`AutomorphicCongruences:L5b/four-twist-kato-bound`](#node-l5b-four-twist-kato-bound), [`AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`](#node-l5b-rational-cyclotomic-endpoint), [`AutomorphicCongruences:L5b/integral-cyclotomic-endpoint`](#node-l5b-integral-cyclotomic-endpoint).

**Full arithmetic Lean signatures.** The pinned libraries lack Hilbert/ordinary GU(2,2) form carriers, continuous Selmer/Iwasawa arithmetic objects and the named analytic functions. The suggested file elaborates concrete ideal, matrix, kernel and algebraic reduction interfaces; full arithmetic targets remain clearly marked mathematical comments with omitted conditions. No opaque proposition fields, fake expected-conclusion structures or formalization claims are used.

Consumers: [`AutomorphicCongruences:L5w/fujiwara-instance`](#node-l5w-fujiwara-instance), [`AutomorphicCongruences:L5w/canonical-period-duality`](#node-l5w-canonical-period-duality), [`AutomorphicCongruences:L5w/quaternionic-period-primitivity`](#node-l5w-quaternionic-period-primitivity), [`AutomorphicCongruences:L5w/klingen-interpolation`](#node-l5w-klingen-interpolation), [`AutomorphicCongruences:L5w/fourier-coefficient-coprimality`](#node-l5w-fourier-coefficient-coprimality), [`AutomorphicCongruences:L5w/eisenstein-coefficient-ideal`](#node-l5w-eisenstein-coefficient-ideal), [`AutomorphicCongruences:L5w/height-one-congruence`](#node-l5w-height-one-congruence), [`AutomorphicCongruences:L5w/galois-selmer-instance`](#node-l5w-galois-selmer-instance), [`AutomorphicCongruences:L5w/exceptional-height-one-primes`](#node-l5w-exceptional-height-one-primes), [`AutomorphicCongruences:L5w/wan-family-divisibility`](#node-l5w-wan-family-divisibility), [`AutomorphicCongruences:L5w/arithmetic-specialization`](#node-l5w-arithmetic-specialization), [`AutomorphicCongruences:L5w/quartic-cm-divisibility`](#node-l5w-quartic-cm-divisibility), [`AutomorphicCongruences:L5w/selected-base-change-hypotheses`](#node-l5w-selected-base-change-hypotheses), [`AutomorphicCongruences:L5b/four-twist-lattice-dictionary`](#node-l5b-four-twist-lattice-dictionary), [`AutomorphicCongruences:L5b/quadratic-selmer-decomposition`](#node-l5b-quadratic-selmer-decomposition), [`AutomorphicCongruences:L5b/cyclotomic-control`](#node-l5b-cyclotomic-control), [`AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`](#node-l5b-cyclotomic-analytic-factorization), [`AutomorphicCongruences:L5b/four-factor-product-bound`](#node-l5b-four-factor-product-bound), [`AutomorphicCongruences:L5b/rank-one-image-twist`](#node-l5b-rank-one-image-twist), [`AutomorphicCongruences:L5b/four-twist-kato-bound`](#node-l5b-four-twist-kato-bound), [`AutomorphicCongruences:L5b/factor-separation`](#node-l5b-factor-separation), [`AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`](#node-l5b-rational-cyclotomic-endpoint), [`AutomorphicCongruences:L5b/integral-cyclotomic-endpoint`](#node-l5b-integral-cyclotomic-endpoint).

**Normal coefficient-ring characteristic and faithful descent extensions.** The written PadicMeasures L4 principal characteristic generator assumes a UFD. Wan’s normal finite Hida branch need not be one. Divisorial length/multiplicativity/completed-transport and principal-majorant specialization are requested explicitly. Its api-9 norm under restriction of scalars is not the faithful extension/base-change/contraction needed for descent to the original coefficient ring.

Consumers: [`AutomorphicCongruences:L5w/height-one-congruence`](#node-l5w-height-one-congruence), [`AutomorphicCongruences:L5w/galois-selmer-instance`](#node-l5w-galois-selmer-instance), [`AutomorphicCongruences:L5w/exceptional-height-one-primes`](#node-l5w-exceptional-height-one-primes), [`AutomorphicCongruences:L5w/wan-family-divisibility`](#node-l5w-wan-family-divisibility), [`AutomorphicCongruences:L5w/arithmetic-specialization`](#node-l5w-arithmetic-specialization), [`AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`](#node-l5b-cyclotomic-analytic-factorization), [`AutomorphicCongruences:L5b/factor-separation`](#node-l5b-factor-separation), [`AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`](#node-l5b-rational-cyclotomic-endpoint), [`AutomorphicCongruences:L5b/integral-cyclotomic-endpoint`](#node-l5b-integral-cyclotomic-endpoint).

**Polarized rank-four extension and localized congruence model.** Current upstream IHG.6’s written matrix/lattice theorem is rank two with two residual characters. Wan 98 needs polarized rank four with residual blocks 1+2+1 and all ten hypotheses. The general enlargement needs supplier/Part II routing, and the AC L0 ordinary Selmer comparison must verify the exact localized quotient and contraction clauses. Global ideal contraction after localization is not automatic. No existing upstream theorem is replanned or declared to supply this gap.

Consumers: [`AutomorphicCongruences:L5w/galois-selmer-instance`](#node-l5w-galois-selmer-instance), [`AutomorphicCongruences:L5w/wan-family-divisibility`](#node-l5w-wan-family-divisibility).

**Hilbert extensions of the L0 period and Selmer interfaces.** The exact L0 node references identify the available SU constructions, not a proof of their totally real extensions. L0/canonical-period-congruence-number is the GL2/Q canonical-period formula; Wan 2015 Definition 79, pp.65–66, needs the Hilbert minimal free Hecke module and its integral pairing. L0/lattice-construction and extension-class-local-conditions use G\_Q and imaginary quadratic K; Wan Proposition 98, pp.84–86, needs the totally real polarized rank-four instance with its source-localized coefficient intersection, quotient, P-primary saturation and local-length comparison. L0/primitive-imprimitive-comparison and selmer-specialization-control supply the SU local-condition/control prototypes; the arbitrary totally real field and locally-trivial/inertia convention adapters, nonzero analytic-majorant specialization and torsion inputs remain the precise L0, Selmer and characteristic-divisor requests. No cross-part link discharges them.

Consumers: [`AutomorphicCongruences:L5w/canonical-period-duality`](#node-l5w-canonical-period-duality), [`AutomorphicCongruences:L5w/galois-selmer-instance`](#node-l5w-galois-selmer-instance), [`AutomorphicCongruences:L5w/exceptional-height-one-primes`](#node-l5w-exceptional-height-one-primes), [`AutomorphicCongruences:L5w/arithmetic-specialization`](#node-l5w-arithmetic-specialization), [`AutomorphicCongruences:L5w/quartic-cm-divisibility`](#node-l5w-quartic-cm-divisibility), [`AutomorphicCongruences:L5b/cyclotomic-control`](#node-l5b-cyclotomic-control).

**Totally real extension of the L1 ordinary boundary sequence.** L1/gu22-ordinary-hermitian-forms and L1/gu22-hida-control state the GU(2,2) construction over Q for imaginary quadratic K (SU Theorems 6.3.3, 6.3.10 and 6.4.1, pp.91–95). Wan Theorems 27 and 97, pp.23 and 83–84, use its totally real F version, with integral coefficient change, all-cusp q-expansions and a cuspidal lift. The precise extension remains requested from L1 with the geometric/doubling carrier imported from AutomorphicPadicLFunctions:L4; the Q-case nodes alone do not supply it.

Consumers: [`AutomorphicCongruences:L5w/klingen-interpolation`](#node-l5w-klingen-interpolation), [`AutomorphicCongruences:L5w/height-one-congruence`](#node-l5w-height-one-congruence).

### Exact supplier contracts

The following contracts delimit the imported work. An exact node reference supplies only the statement at that node; the additional need below remains outstanding. Generic upstream mathematics is routed to its existing owner, with a Part II refinement where necessary.

**PadicMeasuresIwasawaAlgebras:L5.** Supply the Knudsen–Mumford graded determinant line of perfect complexes, derived base change, acyclic trivialization, and the complex \[A→(1−α)A\] in specified degrees. Ownership is PMIA L5 (RS-16); no L5 nodes or package were found in the current checked-out upstream main, so this remains a supplier request.

Consumers: [`AutomorphicCongruences:L3/fundamental-line`](#node-l3-fundamental-line).

**AutomorphicLFunctionsAndLocalFactors:AL.3.** Ichino's triple product formula for the definite unitary group U(2) (equivalently D^× for a definite quaternion algebra) with explicit local triple product integrals at split, nonsplit and supercuspidal places, in the form used by CLW Props 7.9.1–7.12.1, FW Prop. 7.29 and Wan20 step (5); also the Rallis inner product normalization it is combined with. No atlas stage plans it.

Consumers: [`AutomorphicCongruences:L2s/fourier-jacobi-primitivity`](#node-l2s-fourier-jacobi-primitivity), [`AutomorphicCongruences:L2/fw-fourier-jacobi-unit`](#node-l2-fw-fourier-jacobi-unit).

**DirichletPadicLFunctions:L4.** The Kubota–Leopoldt p-adic L-function of a Dirichlet character as an element of A\[\[Γ\_ℚ\]\] with Σ-imprimitive Euler factors, and its image under γ ↦ (1+W)^{-1}γ²\_+ in 𝕀\[\[Γ\_K\]\] (SU's L^Σ\_{χ̄\_fξ̄′}, CLW's L\_{ξ,ℚ} of (6.1.1)).

Consumers: [`AutomorphicCongruences:L1/eisenstein-datum`](#node-l1-eisenstein-datum).

**SerreWeightAndLevelOptimisation:R20.6.** Existence of a classical eigenform of the Serre weight and minimal level whose residual representation is a given odd absolutely irreducible ρ̄ (Khare–Wintenberger with weight optimisation), in the form FW Lemma 2.2, Lemma 2.8 and the proof of Prop. 2.4 use, including the crystalline-short and ordinary cases up to twist.

Consumers: [`AutomorphicCongruences:L3/smooth-classical-points`](#node-l3-smooth-classical-points).

**KatoEulerSystems:L4.** For the stage KatoEulerSystems L5 planned by RS-11 (implementationHandoffs.ordinaryBSTW; not yet in the atlas): the ordinary BSTW two-variable zeta element for E (or an elliptic newform g) over imaginary quadratic K with p split, both normalized explicit reciprocity laws, and the ordinary Perrin-Riou/Greenberg characteristic-ideal identity in both directions, before inverting p under van\_K, with the two-form product (BCS Thm 4.1.3, Cor. 4.1.4). Until it exists, L5a states the contract in L5a/ordinary-two-variable-equivalence. In the BCS application irr\_K implies van\_K. The missing ordinary L5 owner remains a request; Kato L4 alone is not the two-variable comparison.

Consumers: [`AutomorphicCongruences:L5a/ordinary-two-variable-equivalence`](#node-l5a-ordinary-two-variable-equivalence).

**tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma.** Import (existing Tau Ceti layer): Shapiro's lemma for coinduced discrete modules, used to restrict the quartic-CM Selmer group to K and split it by the characters of Gal(M/K); the compact-coefficient comparison is SelmerIwasawaCohomology:L3's.

Consumers: [`AutomorphicCongruences:L5a/quartic-cm-selmer-restriction`](#node-l5a-quartic-cm-selmer-restriction).

**AutomorphicPadicLFunctions:L4.** Instantiate the unitary PEL data at signature (2,2) and (3,1) in Skinner–Urban's and Castella–Liu–Wan's normalizations: ordinary and semi-ordinary Igusa towers, q-expansion and Fourier–Jacobi expansions, Siegel-operator boundary sequences and the ordinary Hecke algebras; and supply Wan 2015's GU(2,2) p-adic L-function over a totally real field with the base-change interpolation comparison used in BCS Lemma 5.1.2 (Wan's Prop. 84).

Consumers: [`AutomorphicCongruences:L1/gu22-ordinary-hermitian-forms`](#node-l1-gu22-ordinary-hermitian-forms), [`AutomorphicCongruences:L5a/quartic-cm-l-function-factorization`](#node-l5a-quartic-cm-l-function-factorization).

**AutomorphicPadicLFunctions:L3.** Hida's GL₂ × GL₂ Rankin–Selberg p-adic L-function of a CM Hida family against a fixed form or Hida family, with its comparison to Katz's p-adic L-function on the line interpolating values at 1 (Wan20 §7E, CLW proof of Thm 8.2.1(2), FW Cor. 7.21); RT-AREA-iwasawa-1/26 proposes a layer for it. PadicFamilies:L1/branch-l-functions is the cyclotomic family L-function of one form and does not cover it.

Consumers: [`AutomorphicCongruences:L2s/clw-integrality-and-p-inverted`](#node-l2s-clw-integrality-and-p-inverted), [`AutomorphicCongruences:L2/greenberg-function-factorization`](#node-l2-greenberg-function-factorization).

**AutomorphicPadicLFunctions:L3h.** Export Hsieh's Theorems A, B and C to AutomorphicCongruences:L2s and L2 as well as L5a (RT-AREA-iwasawa-1/25): µ = 0 of the anticyclotomic Rankin–Selberg function under the Steinberg-twist hypotheses of FW Thm 7.32 and CLW Thm 8.2.1(2), Hsieh 2012's nonvanishing for the auxiliary characters of CLW §5.6, and Vatsal 2003's µ = 0 (a recorded gap there) for SU Prop. 12.3.6. For auxiliary ℓ-power twists use only the infinitely-many nonvanishing statements of CLW addendum Thms 1.0.1–1.0.2 and §3, together with its finite-exception avoidance. Do not use the superseded cofinite assertion to choose three simultaneous units. This correction does not weaken the p-tower µ=0 Theorem B.

Consumers: [`AutomorphicCongruences:L1/su-padic-l-function`](#node-l1-su-padic-l-function), [`AutomorphicCongruences:L2/exceptional-height-one-primes`](#node-l2-exceptional-height-one-primes), [`AutomorphicCongruences:L2s/semi-ordinary-klingen-family`](#node-l2s-semi-ordinary-klingen-family), [`AutomorphicCongruences:L2s/clw-integrality-and-p-inverted`](#node-l2s-clw-integrality-and-p-inverted).

**GeneralizedHeegnerCycles:GH.7.** Coordinate the Yager module/unramified-by-cyclotomic exponential request recorded at GH.7 with the local PadicHodgeRegulators Part II owner. GH.7 is a checkpoint, not a proof of that generic construction. Supply the exact FW §4.2.2 module and integral-lattice comparison; AC retains the short-crystalline denominator bound and scaled saturated line.

Consumers: [`AutomorphicCongruences:L2/unramified-exponential-boundedness`](#node-l2-unramified-exponential-boundedness).

**MetaplecticAutomorphicForms:MP.6.** Ikeda's description of the Fourier–Jacobi coefficients of (nearly holomorphic) Siegel Eisenstein series on U(3,3) as finite sums of products of Siegel Eisenstein series on U(2,2) and theta functions on the unitary Jacobi group (FW Lemma 7.26; Wan20 Prop. 6.44; CLW Prop. 7.4.2), using MP.6's unitary Jacobi group and Fourier–Jacobi periods (RT-AREA-automorphic-1/20).

Consumers: [`AutomorphicCongruences:L2s/fourier-jacobi-primitivity`](#node-l2s-fourier-jacobi-primitivity), [`AutomorphicCongruences:L2/fw-fourier-jacobi-unit`](#node-l2-fw-fourier-jacobi-unit).

**AutomorphicGaloisRepresentationsPartII:AG2.2.** Galois representations of cohomological cuspidal representations of GU(2,2) and U(3,1) over an imaginary quadratic K in SU Thm 7.1.1's form: polarized, unramified outside S with the Hecke-polynomial characteristic polynomial of Frobenius, crystalline at the primes above p when π\_p is unramified, and with the ordinary (resp. semi-ordinary) filtration at p for p-ordinary π (RT-AREA-iwasawa-1/6; AG2.5 and AG2.6 for the local–global compatibility). The present AG2 existence statement has \[F⁺:Q\]≥2; an explicit base-change/descent adapter to imaginary quadratic K is required. Discrete assembly may be used only after its cuspidal constituent representations are attached, and must not itself be treated as CAP exclusion.

Consumers: [`AutomorphicCongruences:L1/gu22-galois-pseudocharacter`](#node-l1-gu22-galois-pseudocharacter), [`AutomorphicCongruences:L2s/cap-exclusion`](#node-l2s-cap-exclusion).

**CompletedCohomologyAndLocalGlobalCompatibility:R31.4.** Emerton's local–global compatibility for completed cohomology localized at a non-Eisenstein ρ̄, in the form of Nakamura Thm 2.2 and FW Thm 6.10 (with co-Whittaker π\_ℓ at ℓ ∈ Σ\_0), and its dual for completed Borel–Moore homology (Nakamura Cor. 2.5), with p ≥ 5 removed by Paškūnas–Tung's generalization (RT-AREA-iwasawa-1/28).

Consumers: [`AutomorphicCongruences:L3/completed-homology-factorization`](#node-l3-completed-homology-factorization).

**PadicLocalLanglandsForGL2Qp:R30.5.** Paškūnas's identification of the projective envelope P̃ with the dual of the universal deformation of π̄ and the removal of P̃ from Hom, under Nakamura's conditions (N1), (N3), (N4), as used in Nakamura §4.1; and Paškūnas's freeness result (Nakamura Thm 4.7) for M^⋄(k, τ) at potentially semistable points (R30.6). R30.5's nodes assume p ≥ 5; FW extend Nakamura's theorem to p = 3 through Paškūnas–Tung's generalization (their Props 2.13, 2.33, cited in FW's remark after Thm 3.6), which R30.5/R30.6 should state if the p = 3 case is to be covered.

Consumers: [`AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`](#node-l3-nakamura-universal-zeta-morphism), [`AutomorphicCongruences:L3/nakamura-specialization-theorem`](#node-l3-nakamura-specialization-theorem).

**SmoothRepresentationsOfLocalGroups:SR.5.** Co-Whittaker families attached to families of GL₂(ℚ\_ℓ)-representations of Weil–Deligne type over reduced complete local rings, with uniqueness, the explicit principal-series/Steinberg/supercuspidal shapes and freeness of rank one of the K\_1(ϖ^m)-invariants with base change (FW Props 6.7–6.9); SR.5's local Langlands family construction is conditional on Helm's conjecture in general, and the GL₂ case used here must be unconditional.

Consumers: [`AutomorphicCongruences:L3/completed-homology-factorization`](#node-l3-completed-homology-factorization), [`AutomorphicCongruences:L3/nakamura-universal-zeta-morphism`](#node-l3-nakamura-universal-zeta-morphism).

**GL2ModularityLifting:R32.4.** Pan's modularity theorem in the form cited by FW \[95, Thm 1.0.4\]: an odd ρ: G\_ℚ → GL₂(O), unramified outside finitely many primes, with ρ̄|\_{G\_{ℚ\_p}} absolutely irreducible and de Rham with distinct Hodge–Tate weights, is modular; and Kisin's crystalline lifting theorem in CLW's non-ordinary CAP-exclusion step.

Consumers: [`AutomorphicCongruences:L2s/cap-exclusion`](#node-l2s-cap-exclusion).

**IntegralHeckeAndGaloisDeterminants:IHG.6.** Import the existing upstream generic GMA/reducibility tools. Its rank-two Ribet statements do not supply the polarized 1+n+1 SU theorem. Keep the source-specific construction at AC L0; update the L5b request to point here rather than create a duplicate at IHG. The n=0 case does not satisfy our middle-constituent datum.

Consumers: [`AutomorphicCongruences:L0/lattice-construction`](#node-l0-lattice-construction).

**PadicMeasuresIwasawaAlgebras:L4.** For finite presented torsion modules over general noetherian normal domains, supply the divisorial fractional ideal associated to charDivisor, its equality with the divisorial hull of Fitt\_0, exact-sequence multiplicativity and principal-majorant specialization. The current native charIdeal statement assumes a UFD; SU’s normal Hida branches need the divisor interface.

Consumers: [`AutomorphicCongruences:L0/sigma-primitive-selmer`](#node-l0-sigma-primitive-selmer), [`AutomorphicCongruences:L0/selmer-specialization-control`](#node-l0-selmer-specialization-control).

**AutomorphicPadicLFunctions:L3.** Supply the Hida Rankin–Selberg function for f against the ordinary CM theta family g, including its fractional congruence-ideal target, both orderings, critical twist and Katz/class-number normalization. PadicFamilies:L4/two-variable-l-function varies one form and a cyclotomic character and does not furnish this CM Rankin function.

Consumers: [`AutomorphicCongruences:L2/greenberg-function-factorization`](#node-l2-greenberg-function-factorization), [`AutomorphicCongruences:L2/bf-explicit-reciprocity`](#node-l2-bf-explicit-reciprocity).

**AutomorphicPadicLFunctions:L3h.** Supply the corrected auxiliary ℓ-tower nonvanishing and finite-set avoidance needed by CLW addendum §3 (including its cited Hung input). The old almost-all assertion cannot be used for simultaneous three-unit selection. Prove the exact two-data-set choice, while keeping Hsieh’s p-tower µ=0 theorem separate.

Consumers: [`AutomorphicCongruences:L2s/semi-ordinary-klingen-family`](#node-l2s-semi-ordinary-klingen-family), [`AutomorphicCongruences:L2s/fourier-jacobi-primitivity`](#node-l2s-fourier-jacobi-primitivity), [`AutomorphicCongruences:L2/fw-fourier-jacobi-unit`](#node-l2-fw-fourier-jacobi-unit), [`AutomorphicCongruences:L2/wan-rankin-selberg-divisibility`](#node-l2-wan-rankin-selberg-divisibility).

**OrdinaryAutomorphicFormsAndModularityLifting:R21.4.** Supply Fujiwara v2 Definition 6.11, Theorems 11.1/11.2 and Corollary 11.5 for the actual nearly ordinary minimal totally real problem: determinant/twist type, local flat restrictions, Hypotheses 6.7 and applicable 5.9, p=5 exception, free quaternionic/Hilbert module, finite flat Hida lift and Gorenstein duality. Existing nice-prime Skinner–Wiles nodes are insufficient for this exact contract. Also supply the ordinary lifting/CAP alternative of Wan 9.2 condition (10).

Consumers: [`AutomorphicCongruences:L5w/fujiwara-instance`](#node-l5w-fujiwara-instance), [`AutomorphicCongruences:L5w/quaternionic-period-primitivity`](#node-l5w-quaternionic-period-primitivity), [`AutomorphicCongruences:L5w/galois-selmer-instance`](#node-l5w-galois-selmer-instance), [`AutomorphicCongruences:L5w/selected-base-change-hypotheses`](#node-l5w-selected-base-change-hypotheses).

**GlobalGaloisDeformations:R04.6.** Export the exact minimal modular lift for the selected residual elliptic representation and its quadratic base change; prove all six Fujiwara 6.11 clauses under the specified local splitting pattern, with determinant/Teichmuller types fixed. Distinguish existence, modularity, and preservation of local minimality.

Consumers: [`AutomorphicCongruences:L5w/fujiwara-instance`](#node-l5w-fujiwara-instance), [`AutomorphicCongruences:L5w/selected-base-change-hypotheses`](#node-l5w-selected-base-change-hypotheses).

**PadicFamilies:L5.** Use L5/totally-real-weight-algebra, L5/hida-freeness, L5/hida-hecke-finite, L5/hida-control-nearly-ordinary and L5/algebraic-primes-dense. Extend their exact contract to Wan’s parallel ordinary Hilbert branch through g\_F, with its integral eigenlattice and fixed arithmetic specialization. Supply ordinary GU(2,2) form/boundary control with compatible coefficient change, rather than merely GL2 eigenforms.

Consumers: [`AutomorphicCongruences:L5w/fujiwara-instance`](#node-l5w-fujiwara-instance), [`AutomorphicCongruences:L5w/klingen-interpolation`](#node-l5w-klingen-interpolation), [`AutomorphicCongruences:L5w/arithmetic-specialization`](#node-l5w-arithmetic-specialization).

**AutomorphicPadicLFunctions:L4.** Provide Wan 2015 §§4–7 local sections, pullback/doubling, GU(2,2)/F ordinary module and q-expansion/Siegel-operator interface, Theorems 82/88 with all cusp and degenerate coefficients, correct ψ, ξ, α\_p and period normalization. L3’s Katz object alone is not the Hilbert Rankin function. Analytic carrier/existence is owned here; L5w proves the source-specific congruence and arithmetic compatibility.

Consumers: [`AutomorphicCongruences:L5w/klingen-interpolation`](#node-l5w-klingen-interpolation).

**AutomorphicPadicLFunctions:L3h.** Supply Hung’s theorem used in Wan 86 and the exact quaternionic/canonical-period comparison domain, primitive NV1/NV2 for p≥5 including the empty n− degree-two case. Supply the CM auxiliary-character unit value and Fourier–Jacobi pairing inputs of Wan 96; retain nonsplit imprimitive Euler μ terms.

Consumers: [`AutomorphicCongruences:L5w/quaternionic-period-primitivity`](#node-l5w-quaternionic-period-primitivity), [`AutomorphicCongruences:L5w/fourier-coefficient-coprimality`](#node-l5w-fourier-coefficient-coprimality).

**AutomorphicPadicLFunctions:L3.** Provide the abelian CM-character p-adic L-function and canonical congruence-period unit comparison used in Wan 88 and 96; the argument needs the specified character infinity type, conductors and Euler units, not just existence of a Katz measure.

Consumers: [`AutomorphicCongruences:L5w/fourier-coefficient-coprimality`](#node-l5w-fourier-coefficient-coprimality).

**AutomorphicPadicLFunctions:L5.** Supply the actual Perrin–Riou/Hida Rankin normalization on the elliptic cyclotomic line, matching CGS 1.2.2–1.2.4, and the MSD comparison for both E and E^F. Track Manin constants, modular degrees, Néron periods, p unit roots, discriminant character units and primitive local Euler factors.

Consumers: [`AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`](#node-l5b-cyclotomic-analytic-factorization).

**AutomorphicCongruences:L0.** The exact supplied prototypes are L0/canonical-period-congruence-number, L0/su-lattice-datum, L0/lattice-construction, L0/extension-class-local-conditions, L0/sigma-primitive-selmer, L0/primitive-imprimitive-comparison and L0/selmer-specialization-control. Extend the period and Selmer/control contracts to Wan’s totally real setting as specified in the consuming Hilbert-extension gap: Hilbert Gorenstein congruence-line comparison (Definition 79), primitive/inertia/local-trivial comparison, ordinary extension-to-Selmer bridge and finite Fitting-to-characteristic control. Import the separately requested polarized rank-four theorem for Wan 98 and verify the source-localized intersection/quotient, P-primary saturation and equality of lengths. The generic Eisenstein coefficient kernel is already supplied by L0/eisenstein-ideal and is no longer an outstanding internal request.

Consumers: [`AutomorphicCongruences:L5w/canonical-period-duality`](#node-l5w-canonical-period-duality), [`AutomorphicCongruences:L5w/galois-selmer-instance`](#node-l5w-galois-selmer-instance), [`AutomorphicCongruences:L5w/exceptional-height-one-primes`](#node-l5w-exceptional-height-one-primes), [`AutomorphicCongruences:L5w/quartic-cm-divisibility`](#node-l5w-quartic-cm-divisibility), [`AutomorphicCongruences:L5b/cyclotomic-control`](#node-l5b-cyclotomic-control), [`AutomorphicCongruences:L5w/arithmetic-specialization`](#node-l5w-arithmetic-specialization).

**AutomorphicCongruences:L1.** Extend L1/gu22-ordinary-hermitian-forms and L1/gu22-hida-control from Q/imaginary quadratic K to the totally real F ordinary GU(2,2) boundary exact sequence and cuspidal lifting used by Wan 27/97, with integral coefficient change, flatness and all-cusp q-expansion checks. The geometric carrier and local doubling machinery stay with AutomorphicPadicLFunctions:L4.

Consumers: [`AutomorphicCongruences:L5w/klingen-interpolation`](#node-l5w-klingen-interpolation), [`AutomorphicCongruences:L5w/height-one-congruence`](#node-l5w-height-one-congruence).

**IntegralHeckeAndGaloisDeterminants:IHG.2.** Import the current upstream roadmap’s actual integral Hecke images and localized reduced cuspidal Hecke algebra, with the eigenvalue polynomial/central/U\_p dictionary used for the Wan quotient. The atlas snapshot is not evidence that this roadmap needs replanning.

Consumers: [`AutomorphicCongruences:L5w/eisenstein-coefficient-ideal`](#node-l5w-eisenstein-coefficient-ideal).

**IntegralHeckeAndGaloisDeterminants:IHG.4.** Import current upstream determinant interpolation with the actual rank-four GU(2,2) Hecke polynomial normalization, coefficient ring and ramification set; obtain the integral trace/determinant data needed for Wan 9.2.

Consumers: [`AutomorphicCongruences:L5w/galois-selmer-instance`](#node-l5w-galois-selmer-instance).

**IntegralHeckeAndGaloisDeterminants:IHG.6.** The current upstream layer supplies the rank-two two-character integral Ribet/Fitting theorem (including the residual-coincidence refinement). Wan Proposition 98, §§9.2.1–9.2.2, pp.84–88, additionally needs a polarized rank-four χ′⊕ρ⊕χ lattice/extension and length theorem with all ten hypotheses, local plus/minus disjointness and the scalar-character Selmer term. This broader general input is an explicit gap requiring extension/Part II routing; do not treat the written rank-two theorem or a determinant as its proof, and do not replan the existing theorem here.

Consumers: [`AutomorphicCongruences:L5w/galois-selmer-instance`](#node-l5w-galois-selmer-instance).

**IntegralIwasawaTheory:I.5.** Supply the odd-prime totally real abelian-character main-conjecture bound used in Wan Theorem 100, pp.87–88, and identify its class/Galois module with the scalar Selmer module for χ′/χ and the stated local conditions and cyclotomic twist. Prove its valuation is zero at the non-pulled-back prime after the specified coefficient transport. DirichletPadicLFunctions L4 plans GL1 Eisenstein coefficient families, not this totally real main conjecture.

Consumers: [`AutomorphicCongruences:L5w/galois-selmer-instance`](#node-l5w-galois-selmer-instance).

**SelmerIwasawaCohomology:L4.** Provide the exact Poitou–Tate primitive/Σ-imprimitive sequence of Wan 101, local H¹\_f characteristic Euler factors, and vanishing of the compact global term under stated torsion/torsion-free hypotheses.

Consumers: [`AutomorphicCongruences:L5w/exceptional-height-one-primes`](#node-l5w-exceptional-height-one-primes).

**SelmerIwasawaCohomology:L3.** In addition to the existing kernel-control and derived-control nodes, prove the precise ordinary coefficient specialization, cyclotomic quotient and torsion lifting used by Wan/BCS/SU, including localization-image, local Euler and Tor terms. A nonzero characteristic ideal requires torsion; Wan 101’s zero-extended convention does not prove it. Supply the quartic-CM torsion verification from early Kato bounds and compatible quadratic descent without using the final endpoint. Supply the discrete Iwasawa coefficient and tower-control adapter used with upstream Shapiro; arithmetic specialization uses a principal analytic majorant over the normal big ring and nonzero specialization, not an unjustified image of its characteristic ideal.

Consumers: [`AutomorphicCongruences:L5w/galois-selmer-instance`](#node-l5w-galois-selmer-instance), [`AutomorphicCongruences:L5w/arithmetic-specialization`](#node-l5w-arithmetic-specialization), [`AutomorphicCongruences:L5w/quartic-cm-divisibility`](#node-l5w-quartic-cm-divisibility), [`AutomorphicCongruences:L5b/quadratic-selmer-decomposition`](#node-l5b-quadratic-selmer-decomposition), [`AutomorphicCongruences:L5b/cyclotomic-control`](#node-l5b-cyclotomic-control).

**SelmerIwasawaCohomology:L2.** Supply the integral p-divisible Tate-module and ordinary-filtration comparison under unramified quadratic twisting, and the actual classical elliptic p-primary Selmer versus BCS ordinary Selmer identification, including finite/inertia/local-trivial away-p conventions. Distinguish the compact integral Tate lattice from its discrete p-divisible module and the discrete Iwasawa dual coefficient; compare finite-level Shapiro, filtered direct limits and ordinary/away-p local conditions for quadratic restriction.

Consumers: [`AutomorphicCongruences:L5b/four-twist-lattice-dictionary`](#node-l5b-four-twist-lattice-dictionary), [`AutomorphicCongruences:L5b/quadratic-selmer-decomposition`](#node-l5b-quadratic-selmer-decomposition), [`AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`](#node-l5b-rational-cyclotomic-endpoint).

**ModularSymbolsPadicLFunctions:L1.** Supply MSD p-adic functions with the precise Néron periods for E and its three twists, modular parametrization/Manin-constant comparison of CGS 1.2.3, and good-period alignment with Kato’s dual-form lattice.

Consumers: [`AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`](#node-l5b-cyclotomic-analytic-factorization).

**ModularSymbolsPadicLFunctions:L2.** Supply ordinary refinement/interpolation with the chosen unit root and finite-character normalization, plus the uniqueness principle in the bounded measure space used for CGS cyclotomic factorization.

Consumers: [`AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`](#node-l5b-cyclotomic-analytic-factorization).

**KatoEulerSystems:L4.** Refine the existing ordinary-selmer-divisibility and elliptic-ordinary-and-multiplicative-divisibility exports to the exact BCS elliptic (im) condition on T\_p(E), the MSD/Néron periods and primitive ordinary Selmer group: torsion and (L)⊂char X rationally, and integrally under (im), for all four quadratic twists. The existing general SL2-image criterion and error p^t are not silently identified with (im). Export the separately proved CM rational elliptic-unit case for the elliptic endpoint; do not apply the non-CM theorem there. Nonvanishing is provided by the existing analytic-twist-nonvanishing node.

Consumers: [`AutomorphicCongruences:L5b/cyclotomic-control`](#node-l5b-cyclotomic-control), [`AutomorphicCongruences:L5b/rank-one-image-twist`](#node-l5b-rank-one-image-twist), [`AutomorphicCongruences:L5b/four-twist-kato-bound`](#node-l5b-four-twist-kato-bound).

**AutomorphicCongruences:L5a.** The early integral bound of BCS Proposition 5.2.1 and original Lemma 5.2.3 field existence are supplied at target level by L5a/two-variable-product-containment and L5a/auxiliary-field-existence, with quartic-to-K Lemmas 5.1.1–5.1.2 owned there. Complete their recorded BSTW, period/Euler/lattice, torsion/nonzero-function and coefficient-map contracts, and the added auxiliary-field-narrow-delta refinement: a new finite ramification prime of K outside D\_F while preserving all original field conditions. The exact node links replace the broad stage dependencies; they do not discharge these residual obligations. Neither HE.8b nor the L5b endpoint is an input.

Consumers: [`AutomorphicCongruences:L5b/four-factor-product-bound`](#node-l5b-four-factor-product-bound), [`AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`](#node-l5b-rational-cyclotomic-endpoint).

**tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68.** Import the existing torsion/Tate-module construction, retaining the integral inverse limit, twist-equivariant transition maps and Weil-pairing determinant; no new elliptic geometry roadmap is planned.

Consumers: [`AutomorphicCongruences:L5b/four-twist-lattice-dictionary`](#node-l5b-four-twist-lattice-dictionary).

**tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-7-coinduced-modules-and-shapiros-lemma.** Use the existing continuous Shapiro theorem for discrete coefficients: the finite-level p-primary modules followed by their filtered direct limit, or the discrete Iwasawa coefficient T⊗Λ∨ with reciprocal action. It does not apply directly to the compact nondiscrete Tate lattice. The Selmer L2/L3 requests supply the integral-lattice/discrete-coefficient comparison, continuity, Pontryagin duality and compatible global/local maps; no upstream Shapiro theory is replanned.

Consumers: [`AutomorphicCongruences:L5b/quadratic-selmer-decomposition`](#node-l5b-quadratic-selmer-decomposition).

**PadicMeasuresIwasawaAlgebras:L4.** Extend the written principal/UFD characteristic-ideal and multiplicativity nodes to finite torsion modules over the normal noetherian/Krull Hida coefficient ring: divisorial characteristic ideals by height-one lengths, multiplicativity, detection of inclusion in a principal ideal, and transport of lengths under the specified localized completed coefficient extension. Supply SU Corollary 3.2.9’s specialization of a principal analytic majorant with nonzero specialization and its precise Fitting/Tor conditions. For finite coefficient integer-ring extensions O→O′, prove faithful flat characteristic base change for O\[\[Γ\]\]→O′\[\[Γ\]\] (and p-inversions) and contraction of extended ideals, together with the analytic unit comparison. Existing api-9 is the norm for restriction of scalars, not extension/contraction or arbitrary kernel specialization.

Consumers: [`AutomorphicCongruences:L5w/height-one-congruence`](#node-l5w-height-one-congruence), [`AutomorphicCongruences:L5w/galois-selmer-instance`](#node-l5w-galois-selmer-instance), [`AutomorphicCongruences:L5w/exceptional-height-one-primes`](#node-l5w-exceptional-height-one-primes), [`AutomorphicCongruences:L5w/wan-family-divisibility`](#node-l5w-wan-family-divisibility), [`AutomorphicCongruences:L5w/arithmetic-specialization`](#node-l5w-arithmetic-specialization), [`AutomorphicCongruences:L5w/quartic-cm-divisibility`](#node-l5w-quartic-cm-divisibility), [`AutomorphicCongruences:L5b/quadratic-selmer-decomposition`](#node-l5b-quadratic-selmer-decomposition), [`AutomorphicCongruences:L5b/cyclotomic-control`](#node-l5b-cyclotomic-control), [`AutomorphicCongruences:L5b/cyclotomic-analytic-factorization`](#node-l5b-cyclotomic-analytic-factorization), [`AutomorphicCongruences:L5b/four-factor-product-bound`](#node-l5b-four-factor-product-bound), [`AutomorphicCongruences:L5b/factor-separation`](#node-l5b-factor-separation), [`AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`](#node-l5b-rational-cyclotomic-endpoint), [`AutomorphicCongruences:L5b/integral-cyclotomic-endpoint`](#node-l5b-integral-cyclotomic-endpoint).

### Source corrections carried into the statements

The statements above incorporate the source corrections recorded in the reviewed packets. The following list records their mathematical effect and version locators in paraphrase; it contains no source excerpts.

- **AutomorphicCongruences/E8**, arXiv:2109.08375v1, proof of Thm 8.2.1(2), p. 81: Under the conditions (irred) and (dist) for the CM form σ\_ξ, which the preceding paragraph derives from ξ\_p ≢ ξ\_p̄.

- **AutomorphicCongruences/E9**, arXiv:2405.00270v2, proof of Prop. 5.2.1, p. 10: Theorem 4.1.3 (with Corollary 4.1.4 for the product form).

- **AutomorphicCongruences/E10**, arXiv:2107.13726v3, §4.8, p. 68: A complete proof must extend Castella–Wan Thm 3.8 to weight k, descend from K to the cyclotomic line separating the f and f ⊗ χ\_K factors, and remove the power of p (Castella–Wan's equivalence holds only up to powers of p) by an argument of §4.6.3 type using Kato's bound; these steps are planned in L2/fw-ordinary-reverse-bound.

- **AutomorphicCongruences/E11**, Proof of Thm 8.1.1, PDF p. 78: Use ord\_P(E\_{π,ξ})≥m after E\_{π,ξ}⊂P^m locally.

- **AutomorphicCongruences/E12**, Proof of Lemma 5.1.1, PDF p. 9: Both groups on the right are over K, one with η\_F twist.

- **AutomorphicCongruences/E13**, Proof of Thm 5.13, PDF p. 84: Use the H² residual term in the λ-defect.

- **AutomorphicCongruences/E14**, §1, p. 1; Thms 4.0.1 and 5.0.1–5.0.2, pp. 4–6: Use only infinitely-many nonvanishing and the two-family joint height-one-coprimality repair.

- **AutomorphicCongruences/E1**, arXiv:math/0602606v2, §3.1, p.16, exceptional type 0E; compared with BCS Hypothesis 3.1.1(H3), published p.8: In the induced exceptional type, inertia is absolutely reducible. Retain absolute irreducibility of the whole local representation, q\_v≡−1, and the induced-character description. BCS H3 uses this reducible-inertia condition and excludes that exceptional type.

- **AutomorphicCongruences/E2**, Published §2.1 condition Δ, p.7, and Theorem 3.2.1, pp.7–8; arXiv v2 §2.1 p.6: Use the narrow Hilbert class field condition Δ+ required by Wan §1. For the selected M=FK choose a K-ramified prime outside D\_F, proving finite ramification of M/F and hence excluding containment in the narrow Hilbert class field. Retain the stronger condition in the general quartic engine.

- **AutomorphicCongruences/E3**, Published proof of Proposition 5.2.1, p.11; arXiv v2 p.10: The intended locator is Wan’s 2015 Hilbert paper, Theorem 103 and proof, pp.91–92.

- **AutomorphicCongruences/E4**, Published proof of Lemma 5.1.2, p.11; arXiv v2 p.9: Use Wan 2015, Proposition 84 and its proof, pp.68–69, comparing Hida and Wan on the parallel arithmetic subfamily with the stated local Euler factors.

- **AutomorphicCongruences/E5**, Published Theorem 8, final local bullet, p.7; compared with Fujiwara v2 §3.1, p.16 and BCS H3, published p.8: For the exact Hilbert/quaternionic Hecke comparison also exclude the actual induced exceptional type 0E: absolutely irreducible local representation with absolutely reducible inertia and q\_v≡−1. Verify both the printed Wan condition and the corrected exceptional-type exclusion in the selected instance; use Fujiwara’s full exact theorem rather than infer this exclusion from the printed condition alone.

- **AutomorphicCongruences/E6**, Published §9.1.1, unramified split case, p.82; compare the two Satake formulas on that page and Skinner–Urban author §9.5.3, p.131: Use T\_i^(i\_wbar), with i\_wbar=2, in the polynomial for the conjugate prime, paired with the complementary central operator. The first prime uses i\_w=1. Keep both independent split Satake families in the Eisenstein ideal.

- **AutomorphicCongruences/E7**, arXiv:2303.04373v1, Remark 1.2.3, p.7; persists in v2 Remark 2.2.3, p.7: First compare the raw areas: the Petersson area equals the modular degree divided by the square of the Manin constant times the raw Néron area. In terms of the defined quadratic period, restore the discriminant square-root factor. Track that scalar and the quadratic-twist period ratio under the chosen p-adic embedding when proving the up-to-unit cyclotomic ideal identity.

Restructuring and ownership proposals are collected in the [assembly handoff](../handoff/ASM-AutomorphicCongruences.md). They do not broaden the theorem statements or remove the obligations above.
