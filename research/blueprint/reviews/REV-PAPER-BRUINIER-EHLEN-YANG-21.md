# Independent review: Bruinier–Ehlen–Yang higher Green functions

**Verdict: revise.** Codex, session `codex-7e92bd`, 23 September 2026. Review issue [#1289](https://github.com/CBirkbeck/tauceti-explorer/issues/1289); input by Claude Code `cc-39fac3`, issue [#1288](https://github.com/CBirkbeck/tauceti-explorer/issues/1288). This reviewer did not write that input.

This is a finished negative review. The corrected extraction is **partial**, with the same 46 stable item IDs: **1 library, 5 planned, 40 missing**. Each missing aggregate is provisionally routed exactly once. All eight routes are rejected for intake until the concrete obligations below are discharged. The six original routes retain their indices; routes 7 and 8 record two residuals that the input incorrectly treated as fully planned. No Lean file was required or compiled, and no new formalization is claimed.

## Findings that determine the verdict

The extraction promoted an unproved correction into its main statements and design brief. Its proposed odd-j coefficients `4 sqrt(m)` and `+2^(j-2)` do not follow from the checks given: the proof also confuses the Poincaré input with twice the normalized principal-part input, defines `p_z` with opposing signs, and switches between SL₂ and PSL₂ stabilizer conventions. A numerical example that repeats one convention cannot choose a globally consistent repair. E3 remains a confirmed inconsistency; its proposed replacement is explicitly withdrawn. E12 and E25 record the independent sign and group-multiplicity problems. Both parities require comparison.

The example intended to validate the constants identifies two different lattices. The actual rescaling of the negative norm lattice of discriminant −7 has Gram matrix `[-6,-3;-3,-12]` and discriminant group Z/3 × Z/21. The displayed order norm lattice has Gram matrix `[-2,-3;-3,-36]` and cyclic discriminant group Z/63. Their equal determinant does not make them isometric. E17 requires recomputing the theta-coefficient construction on a consistent carrier. It does not, by itself, disprove the final logarithmic value.

Several source and extraction hypotheses were missing: positive j; the H! preimage space rather than the cuspidal-shadow H space; the small-CM sublattice restriction; the actual L² uniqueness range; coprimality and parity at the height endpoints; and avoidance of all contributing Hecke divisors when using an unregularized Green function. Real-to-complex linearity in the classical L-derivative comparison also needs a hypothesis or conjugation. Clear fixes have been applied; the uncertain rationality and normalization implications remain explicit gaps.

Routing does not close the proof. The input quotes large external constructions from Bruinier, Oda–Tsuzuki, Borcherds, Bruinier–Funke, Howard–Madapusi Pera, Zhang, Xue and others without extracting their theorem-level interiors. It combines multiple numbered results in single rows and gives no structured API/tests for its definition/construction rows. This review does not certify those omissions as ordinary design work.

The ownership audit also changes the plan: import Tau Ceti’s imaginary-quadratic two-rank formula and Mathlib’s shifted Legendre polynomials; import GH.0/GH.1 for the Kuga–Sato/projector and CM-isogeny cycle constructions. MP.4’s adelic Weil representation does not alone supply the finite discriminant-module comparison; generic Jacobi forms do not alone supply the weak-ring generators and their normalizations. Those last two aggregates now remain missing.

## Sources, versions and scope

The primary article is Bruinier–Ehlen–Yang, *CM values of higher automorphic Green functions for orthogonal groups*, Inventiones Mathematicae 225 (2021), 693–785, [DOI](https://doi.org/10.1007/s00222-021-01038-0), CC BY 4.0. All access dates below are 23 September 2026. The full mathematical body and appendix of arXiv v2 were read from TeX, and the published references were read. Every finding was collated at its journal-page locator. This review does not claim a complete new PDF-versus-TeX diff or complete reading of the prerequisite originals.

- **published:** [public source](https://tuprints.ulb.tu-darmstadt.de/server/api/core/bitstreams/4aa456f4-e7bc-4d5e-88cf-78ab8c8c8de3/content); SHA-256 `729e4f9daff82e8e98ae27bcd8084c4e89c8a08b91f2b5106c048ab35cda4160`. Targeted collation of item locators and every recorded source finding; selected formula-page images inspected.
- **author:** [public source](https://www.mathematik.tu-darmstadt.de/media/algebra/homepages/bruinier/publikationen/higher-green-final.pdf); SHA-256 `ca3c622e51c571ee9cbfb17c839056cf2edf020957d942d752448e361659715b`. Downloaded as a public alternate copy; no separate full reading or full diff claimed.
- **arxiv-tex:** [public source](https://arxiv.org/src/1912.12084v2); SHA-256 `8a0bf7ad73146f2c37e9b0c509ee66d6af7cf63537d7d66c6b32123ba064be04`. Full mathematical body and appendix read, including standing conventions and proofs.
- **arxiv-abs:** [public source](https://arxiv.org/abs/1912.12084); SHA-256 `73e9f73fdbec11fa4c8f64d45a19f8691aa31262bccd1c389e92a2289404b21f`. Submission history checked: only v1 and v2 listed; v2 is described as revised and final.

Published pages checked for the source findings include 694, 696, 700, 722, 729, 731–734, 736–739, 741, 743–744, 755–761, 763–769, 773–775, 777–778 and 781–783. Images were used for the ambiguous signs, weights and Gram matrices, including pp.722, 729, 733, 755, 773 and 782. The source code preserves the earlier extractor’s reading claims as history; they are not attributed to this reviewer.

The publisher article page, Crossref metadata, arXiv history, author page and title-plus-erratum/correction searches found no applicable correction. Crossref returned an empty relation and no update-to field. This bounded search supports the `known: new` entries; it is not proof that no correction exists anywhere. New prerequisite entries distinguish bibliographic verification from reading the original proof.

## Independent mathematical checks

For E1, substitute `C(0,j)=2(4π)^(-j)Γ(2j+1/2)`, `deg Z(U)=2 sqrt(|D₀|)L(χ,1)/π` and `|D₀|=4Mm₀` into the first formula of Lemma 6.3. The surviving factor is sqrt(M), as in the later height formula. The symbolic simplification checks this factor without claiming the external height comparison.

For E2, coefficient comparison in `(1-x²)P″-2xP′+2j(2j+1)P=0` gives denominator `(2m+2)(2m+1)`. For j=3,m=1 the ratio is −3, not −9/2. The finite-sum beta polynomial equals the standard even Legendre polynomial for j=0,…,8 in a symbolic diagnostic. Mathlib’s shifted convention is `P_n(1-2X)`, so the intended bridge is substitution `(1-x)/2`; an all-j proof is still needed in the extraction.

For E5 the concrete witness is `(j_modular-504)E₁₀/Δ=q⁻²−2160+O(q)`, with integral coefficients. At `(i,2i)` the determinant-two Hecke term reaches Q₁(1). This corrects the old witness’s inaccurate `O(q)` after q⁻² to `O(1)`. It proves that different CM points do not suffice for a raw finite Green value. Avoiding the union of all contributing Hecke correspondences is a precise sufficient condition; it must not be silently identified with support of a signed sum in the presence of cancellation.

For E12, at z=i and λ=[0,−1;1,0], the printed X₁ is −λ/√2. Thus `(λ,X₁)=−√2`, the abstract p is +1, and the displayed coordinate p is −1. Its absolute value is √Q(λ_positive)=1, disproving the factor two in E3’s proof. Separately, `F_{m,μ}` has principal coefficient `φμ+φ−μ`, which is `2φμ` in this level-one discriminant group, while `f_m` has `φμ`. These facts are inputs to a future recomputation, not a shortcut to a repaired final coefficient.

For E25 one can already use s=2: `Q₁(t)=(t/2)log((t+1)/(t−1))−1` has leading coefficient −1/2 at log(t−1). Each stabilizer element in the paper’s −2 SL₂ sum contributes `log|z₁−z₂|²`. There are 2e such elements when e is the PSL₂ stabilizer order. The coefficient is therefore 2e under that definition, whereas p.731 says e. Fixing only the odd theta kernel cannot settle this discrepancy.

For E17, Smith reduction gives (3,21) for the rescaled Gram matrix and (1,63) for the order matrix. For E23 the degree-eight defining polynomial modulo 5 is a squarefree product of four irreducible quadratics: complete splitting is relative to the inert quadratic base prime, not over Q. For E22 substituting the chosen alpha₁ into the repaired alpha₂ expression reproduces the displayed complex approximation.

For E15 equal moduli do not imply a root of unity: in Q(i,√2)/Q(i), take α=√2+i. Its relative conjugate has equal modulus, but their ratio has primitive minimal polynomial `3X²+2X+3`, so is not integral. Relative norm gives the needed descended logarithm directly: `log|Norm α|=[L:K]log|α|`. This repairs that inference without claiming to have proved the rest of Corollary 7.15.

For E18 the supplied bound gives `A c₀ x∈Z`. The abstract example A=c₀=2,x=1/4 shows that lcm(A,c₀) need not clear x. The safe bound A|c₀| suffices, with the cutoff enlarged to include the constant term. This is a failure of the stated inference, not a claim that those three numbers occur in the canonical basis. E24 is similarly limited: the orbit regrouping double-counts fixed classes unless a separate argument handles them; the final integral-linear-combination claim is not disproved here.

For E4, D′=−84 has three distinct prime factors but four positive fundamental-discriminant splittings, indexed by 1,12,21,28. In the averaging argument E16 requires exponent `t/(h t_i)`, not `t/t_i`, when `t=h lcm(t_i)`. These are independent of the unresolved theta constants.

## Library and ownership checks

The atlas search snapshot is `ecde729eccb1597061df979da160e044b5a7d498`, covering 607 roadmap extracts, candidate paper results/reviews, audits, decomposition files and upstream documents. This is a search corpus, not a claim to have read every file. Every originally cited layer description and the relevant reviewed library-coverage rows were read. The relevant audits are AUDIT-02, AUDIT-11, AUDIT-15, AUDIT-24 and AUDIT-25.

The complete Multiquadratic and EffectiveBounds upstream documents had already been read for earlier jobs in this session; selected ModularForms/ModularCurves conventions were additionally consulted. The full multi-thousand-line ModularForms and ModularCurves documents are not claimed newly read. Planned library-audit entries are evidence about scope, not declarations or proofs.

All six original library references and seven additional declarations were opened; the nine source files were compared byte-for-byte with raw GitHub at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The retained carrier and adjacent reusable statements are:

| Declaration | Pinned statement fit |
|---|---|
| [mathlib:UpperHalfPlane](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean#L25) | Complex coordinate with positive imaginary part. |
| [mathlib:ModularForm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean#L74) | Integer-weight slash invariant form, holomorphic and bounded at every cusp. |
| [mathlib:CuspForm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean#L82) | Integer-weight slash invariant form, holomorphic and zero at every cusp. |
| [mathlib:ModularForm.eisensteinSeriesMF](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/EisensteinSeries/Basic.lean#L35) | Congruence-level Eisenstein form for N nonzero and weight at least 3. |
| [mathlib:ModularForm.E](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/EisensteinSeries/Basic.lean#L47) | Normalized level-one E_k for natural k at least 3, covering E₄/E₈/E₁₀. |
| [mathlib:CuspForm.discriminant](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Discriminant.lean#L239) | Δ as a level-one weight-12 cusp form. |
| [mathlib:Complex.Gamma](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean#L287) | Complex Gamma carrier. |
| [mathlib:ordinaryHypergeometric](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean#L76) | Power-series sum; documented junk value outside convergence, not global continuation. |
| [mathlib:ModularGroup.fd](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Modular.lean#L366) | The standard closed SL₂ fundamental-domain set. |
| [mathlib:Polynomial.shiftedLegendre](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/ShiftedLegendre.lean#L36) | Integral shifted polynomial with explicit finite sum; different coordinate convention. |
| [mathlib:Polynomial.factorial_mul_shiftedLegendre_eq](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/ShiftedLegendre.lean#L43) | Shifted Rodrigues derivative identity. |
| [mathlib:Polynomial.coeff_shiftedLegendre](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/ShiftedLegendre.lean#L82) | Exact integral binomial coefficient formula. |
| [tauceti:TauCeti.Multiquadratic.twoRank_eq_ncard_ramifiedPrimes_sub_one](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Multiquadratic/Quadratic/TwoRank.lean#L152) | Imaginary quadratic class-group two-rank under squarefree negative generator/minimal-polynomial/generation hypotheses; not the full binary-form CM comparison. |

MP.2/MP.4 provide the local/adelic Weil direction, MP.5 theta kernels, MP.6 coherent/incoherent integral conventions, MP.7 half-integral forms, and MP.8 Jacobi/theta decomposition. QM.1 explicitly imports the Jacobi owner; QM.3 owns Maass/xi/Poincaré infrastructure. HE.1 imports the common CM and reciprocity owners. V4/V6 cover canonical models and their inheritance. GH.0 and GH.1 already cover Kuga–Sato/projectors and CM-isogeny cycles; they must be consumed by the new height work. GZ.6 and GZ.7 are appropriate directions for incoherent derivatives and finite intersections. R35.1’s arithmetic bundles/degree over curves do not supply arbitrary higher arithmetic Chow theory.

PAPER-LI-23 proposes the same HigherGreenFunctionCMValues direction and should coalesce. Its review is absent in this snapshot. The GSpinSpecialDivisorHeights candidate is also unreviewed and its principal b≥3 scope does not automatically supply n=1,2 comparisons. FiniteWeilRepresentationsPartII is a finite-field odd-characteristic proposal, not the finite discriminant-module construction required here. None is treated as a completed import.

Independent `rg` searches cover both pinned source trees. Matching atlas stage descriptions and candidate routes were searched separately. Generic hits such as Lie-theoretic half-integral weights were excluded after inspection; “Legendre” was not dismissed merely because many hits were Legendre symbols. Searches establish no exact whole-item implementation found, not logical proof of absence. Every missing input row has one or more search groups in the machine-readable ledger.

| Search group | Input item numbers covered | Scope |
|---|---|---|
| weil | 2, 3, 9, 11, 23, 29, 39 | `Weil.?[Rr]ep / metaplectic / discriminant.*(module / form) / vector.?valued / finite.index.sublattice` |
| maass | 4, 5, 21, 22, 24, 25, 26, 28, 30, 31, 32 | `Maass / Maaß / Poincar[eé] / Rankin.?Cohen / raising.operator / lowering.operator / Jacobi.form / Cohen.operator` |
| green | 17, 18, 19, 24, 26, 27, 28, 29, 30, 31, 32, 33, 34, 37, 40, 42, 43, 44, 45, 46 | `Green.function / Green.current / Borcherds / theta.lift / Oda / Tsuzuki / regularized / Legendre / hypergeometric` |
| cm | 6, 7, 11, 12, 18, 24, 29, 31, 32, 33, 39, 43, 44, 45, 46 | `genus.char / genus.theory / genus.field / twoRank / CM.point / CM.cycle / complex.multiplication / ring.class / Shimura.reciprocity` |
| heegner | 8, 14, 15, 16, 20, 35, 36, 38 | `Heegner / Kuga / Gillet / Soul[eé] / arithmetic.Chow / arithmetic.intersection / finite.intersection` |
| eisenstein | 9, 10, 13, 16, 20, 30, 32, 34, 36, 38, 40, 41, 42, 43, 44 | `incoherent / Siegel.Weil / Eisenstein.*derivative / Shimura.(lift / correspondence) / Zagier.lift / Millson / Kohnen / half.integral` |

## Item-by-item disposition

All 46 stable rows were checked against source statements and context. The source locators are journal locators, with v2 TeX used to read formulas. A retained aggregate is not a claim that its components have been fully split or its quoted suppliers recursively proved.

| Item | Status | Review finding / correction |
|---|---|---|
| 1 | library → library | All six original declarations and the three added carrier declarations were opened at the exact pin. The special-function transformations, Whittaker functions and Legendre Q kernel required below remain separate missing interfaces; their absence is a bounded search result, not a consequence of a name alone. No consumer Lean elaboration was run. |
| 2 | planned → missing | MP.2/MP.4 plan local and adelic Weil representations; they do not explicitly give this finite discriminant-module representation and its vector-valued modular-form comparison. Keep the residual comparison missing and provisionally route it to that owner. The finite-field odd-characteristic proposal FiniteWeilRepresentationsPartII is not automatically the dyadic finite-quadratic-module interface used here. Import Tau Ceti’s existing integral-lattice discriminant objects rather than reconstructing them. |
| 3 | planned → planned | MetaplecticAutomorphicForms MP.5 plans theta kernels and convergence. |
| 4 | planned → planned | QM.3 explicitly plans the Laplacian, growth, xi and Bruinier–Funke pairing/exact-sequence interface. That supports planned status, not an implemented theorem. The finite Weil comparison of row 2 and weakly holomorphic rational structures still need exact imports. |
| 5 | planned → missing | QM.1 imports Jacobi forms from MP.8. Their descriptions plan forms and theta decomposition, but not the full weak-Jacobi ring-generator theorem or the normalizations <psi_-2,1,theta_P>=0 and <psi_0,1,theta_P>=12. The aggregate is therefore missing at its asserted scope; route 8 names MP.8. Eichler–Zagier Theorem 9.3 must be extracted, with the weak/weakly-holomorphic distinction retained. |
| 6 | planned → planned | HE.1 plans ring-class-field CM points; import the common CM.1/CM.2 and ShimuraVarieties V5 reciprocity interfaces it names. Idele, proper-ideal and binary-form presentations and the Artin orientation require comparisons, not parallel CM theories. |
| 7 | planned → planned | V4 and V6 supply canonical-model/reciprocity and Hodge/abelian-type directions. The GSpin lattice stabilizer and the specific equality K_T=O_D-hat-units in Corollary 5.6 need an explicit comparison; a layer title alone does not prove it. |
| 8 | planned → planned | GH.0 supplies the desingularized fiber powers and projector conventions. GH.1 also already owns CM-isogeny graph cycles and homological triviality. The later height construction must import both. |
| 9 | missing → missing | Keep coherent weight -1 Siegel–Weil, incoherent weight +1 vanishing, and the raising/lowering identities as separate results with Tamagawa and compact-open volume conventions. The paper quotes the analytic Siegel–Weil supplier; it has not been recursively extracted here. |
| 10 | missing → missing | GZ.6 is the appropriate derivative-kernel direction, but the rational-log Fourier coefficients, constant term, ramified local factors and Hilbert analogue are distinct supplier contracts. Kudla–Yang and Bruinier–Kudla–Yang must be sourced explicitly before this aggregate is complete. |
| 11 | missing → missing | Definition 7.1 and Lemmas 7.2–7.3 require the fundamental-discriminant, parity, Hilbert-symbol and support conditions; generic characters on ideals are not the same carrier as the function on trace-zero matrices. Import existing quadratic-form/Hilbert-symbol owners, and isolate this comparison. |
| 12 | missing → missing | The imaginary-quadratic two-rank formula is already implemented: tauceti:TauCeti.Multiquadratic.twoRank_eq_ncard_ramifiedPrimes_sub_one, for a squarefree negative generator with the stated minimal polynomial and generation hypothesis. The row remains missing only as the composite binary-form genus-character/class-field comparison and Fourier inversion used here. Do not re-plan Gauss two-rank theory. E4 and E16 correct the character count and exponent in the application. |
| 13 | missing → missing | MP.7 plans the half-integral comparison direction, not an already proved Shimura/Skoruppa–Zagier isomorphism. Separate the explicit Dirichlet-series lift from the newform isomorphism and retain M>0, weight, sign and normalization. Read the quoted Gross–Kohnen–Zagier and Skoruppa–Zagier sources before closing. |
| 14 | missing → missing | GZ.7 is the intended finite-intersection owner. Import actual modular-curve/CM moduli objects, track invertibility of the level ideal and conductor coprimality, and split the Cartier, closure, pullback, local length and Legendre-weighted intersection statements. The external Bruinier–Yang/Howard/Xue proofs are not recursively supplied by this aggregate. |
| 15 | missing → missing | GZ.7 is the intended finite-intersection owner. Import actual modular-curve/CM moduli objects, track invertibility of the level ideal and conductor coprimality, and split the Cartier, closure, pullback, local length and Legendre-weighted intersection statements. The external Bruinier–Yang/Howard/Xue proofs are not recursively supplied by this aggregate. |
| 16 | missing → missing | GZ.7 is the intended finite-intersection owner. Import actual modular-curve/CM moduli objects, track invertibility of the level ideal and conductor coprimality, and split the Cartier, closure, pullback, local length and Legendre-weighted intersection statements. The external Bruinier–Yang/Howard/Xue proofs are not recursively supplied by this aggregate. |
| 17 | missing → missing | Gross–Zagier (1986) V.4 Conj. (4.4); Gross–Kohnen–Zagier (1987) V.1. PAPER-LI-23 proves it at individual CM points using this paper. |
| 18 | missing → missing | Theorem 1.2 and Corollary 1.4 are separate endpoints with different discriminant hypotheses. Formula constants remain subject to the normalization gap; algebraicity must be reproved after that comparison, not inferred from one numerical example. |
| 19 | missing → missing | These are introduction restatements of rows 28–32 and 43. Replace duplicate targets by explicit aliases/comparisons when splitting the extraction. Theorem 1.6 is the positive even-j introduction specialization, with sublattice restriction understood. |
| 20 | missing → missing | Corollary 6.13. |
| 21 | missing → missing | Split operator definitions, transformation rules, adjointness with its growth/boundary assumptions, and Rankin–Cohen identities. Import QM.3’s Laplacian/xi and the existing modular-form carriers. No separate generic Rankin–Cohen owner was located in the scanned atlas descriptions; this does not justify rebuilding those imports. |
| 22 | missing → missing | Keep the Poincare parameter restrictions from row 4, the binomial/Gamma constants and the order-zero boundary. The three statements must be split and tested independently, including j=1 weight checking. |
| 23 | missing → missing | Statement and source context checked; split bundled results and close the applicable G1–G6 obligations before acceptance. |
| 24 | missing → missing | Use H!_{1,rho_N}, not the cuspidal-shadow H space. Split existence, the exceptional (0,0) coefficient, a single uniform denominator r depending only on N, and the reciprocity law. Corollary 9.7’s uniform multiplier argument and the CM nonvanishing/cancellation argument are external supplier gaps. |
| 25 | missing → missing | Split coefficient-functional bases, existence via Bruinier–Funke, duality, uniform denominators and the canonical preimage. Repair component indices in (9.1)/(9.3) (E20), preserving a consistent half-symmetrized versus ordinary coefficient convention. The rational bounded-denominator and Ehlen–Sankaran preimage suppliers are not extracted. |
| 26 | missing → missing | The bounded-denominator inference needs E18: A∣c_0∣ is a safe bound after including the constant-term cutoff. Separate the rational-input theta identity from the scaled integral Borcherds-product existence/finite-order multiplier and Q-rationality statements. Source (9.9) is an off-divisor identity; extension across cancellations requires the argument on p.783, not direct substitution. |
| 27 | missing → missing | The Bruinier and Oda–Tsuzuki continuation, current-equation and L² theorems are separate missing proof suppliers. GSpinSpecialDivisorHeights is an unreviewed candidate with a higher-dimensional b≥3 scope, so its name does not discharge the n=1,2 endpoint or the analytic comparison. |
| 28 | missing → missing | Statement and source context checked; split bundled results and close the applicable G1–G6 obligations before acceptance. |
| 29 | missing → missing | The source itself supplies the restriction convention immediately before Section 5’s formula; the extraction had omitted it. This is an extraction correction, not an allegation against the paper. Split weighted cycles, stabilizer factors, degree and rationality from the theta comparison. |
| 30 | missing → missing | Retain the conjugate of g’s Fourier coefficients in the convolution. Split the truncated-integral boundary term, the L-series, its central vanishing and the derivative identity. These are not a single API operation. |
| 31 | missing → missing | Corollary 5.6 requires integral Fourier coefficients and disjointness, and specifies A and uniform r. The more general finite regularized lift in Theorem 5.5 is not automatically the raw Green value on a divisor. The lattice stabilizer/CM-order comparison must be supplied. |
| 32 | missing → missing | Split the general totally real setup from the real-quadratic d=1 specialization and keep the signed CM cycle. The post-Theorem-5.10 shadow weight is 2+2j (E8). The unconditional rational-log conclusion for arbitrary complex coefficients is not certified: the coefficient/rationality assumptions and the omitted analogous proof need an explicit derivation. |
| 33 | missing → missing | The old statement’s “different” points condition is insufficient. E9 repairs the determinant-m Mobius rewrite and E25 requires reconciliation of the SL/PSL convention before importing the precise numerical Green/theta identity. |
| 34 | missing → missing | E1 is confirmed as the missing sqrt(M) in Lemma 6.3’s derivative specialization. E10 and E11 correct the discriminant quadratic form and projection numerator. The hypergeometric transformation and Legendre-Q integral are missing interfaces beyond Mathlib’s power-series carrier. |
| 35 | missing → missing | Import GH.0’s Kuga–Sato/projector construction and GH.1’s CM-isogeny cycles and homological triviality; construct only the Zhang normalization and higher arithmetic Chow/Green-current height comparison beyond those imports. Arakelov R35.1 supplies bundles/degree over arithmetic curves, not the entire higher-codimension Gillet–Soule theory. The newly reviewed UnitaryKudlaRapoportCycles candidate also plans Green-current star products and arithmetic degrees: extract a shared supplier/comparison rather than duplicate that substrate. Its unitary cycle endpoints do not supply Zhang’s orthogonal/modular comparison. E27 corrects the cycle-class degree on the total variety. |
| 36 | missing → missing | The elementary Gamma/degree simplification verifies the displayed sqrt(M) constant conditional on consistent Green-height normalizations. It does not certify Zhang’s archimedean comparison or the external finite-intersection formula; E25 makes that comparison explicit work. |
| 37 | missing → missing | Mathlib already has Polynomial.shiftedLegendre, factorial_mul_shiftedLegendre_eq and coeff_shiftedLegendre. Its convention is P_n(1-2X); compare P_{2j}(x) with shiftedLegendre(2j)((1-x)/2). This row remains missing for the Rankin–Cohen coefficient formula and normalization bridge. Symbolic j=0..8 checks are diagnostics, not an all-j proof. E2 repairs the source’s recurrence. |
| 38 | missing → missing | Split support projection, newform/Hecke uniqueness, Borcherds duality criterion, height modularity and congruence-level corollary. The quoted Schwagenscheidt and Borcherds proofs are separate prerequisites. Do not package the entire proof into one “modularity” import. |
| 39 | missing → missing | Fix the sign of p_z before exporting a Millson kernel (E12). The finite Weil intertwiner psi_Delta requires its actual representation change for each sign; generic MP.4 does not supply that comparison automatically. E6 restores the twisted divisor character. Cases Delta=1 and Delta≠1 have different component counts. |
| 40 | missing → missing | The finite lift is well defined only under its stated regularization/growth setup. Supply the Whittaker Laplace transform and its hypotheses, then recompute both equalities in (7.10) from the actual normalized input. |
| 41 | missing → missing | Keep j>0, fundamental d and the parity sign, and split existence/principal part, weak holomorphy criterion and integral coefficients. The scalar plus-space/vector-valued comparison and the Duke–Jenkins and Alfes-Neumann–Schwagenscheidt originals are unacquired proof suppliers; do not regard the paper’s attribution as their extraction. |
| 42 | missing → missing | Separate the integral Hecke action on weighted CM divisors from the analytic lift comparison. The even branch also needs the SL/PSL conversion, so this review does not declare it unchanged. |
| 43 | missing → missing | The original Theorem-7.13 locator p.698 was the introduction theorem instead. The preimage needs H! (E13). Track finite-index restriction, discriminant modules and theta weights explicitly; Example 3 cannot settle the constants without rebuilding its carrier. |
| 44 | missing → missing | The root-of-unity inference in the descent proof is replaced by a relative norm (E15). The orbit-doubling argument must treat self-inverse classes separately (E24). Theorem 3.9 gives a uniform denominator for a fixed lattice; to retain uniformity in j, the bracket-integrality claim must actually be proved. |
| 45 | missing → missing | E4 gives 2^(s-1) genus characters, and E16 restores both the 1/h exponent and the discriminant scaling in the averaging proof. Import the implemented quadratic two-rank theorem and an explicit binary-form genus-character comparison. |
| 46 | missing → missing | No independent high-precision Green-series computation is claimed here. E17 requires a consistent N_-3 lattice; E21–E23 correct example labels, the alpha_2 symbol and the relative splitting description. Before treating these values as tests, recompute from independently normalized definitions with error bounds. |

## Source findings

All six inherited findings were independently checked. E3 is confirmed only at its narrowed inconsistency scope; its earlier proposed repair is preserved as history, not used as a theorem. E5’s witness and E6’s equation references were corrected. E7–E27 are new findings from this review. “Confirmed” certifies the stated local error or proof gap, not a false final theorem when the entry explicitly says otherwise.

### E1 — misprint; affects nothing

Lemma 6.3, the 'In particular' formula, p. 736

**Printed:** "L′(g, U, 0) = 2^{2−4j} π^{−3/2−2j} Γ(2j + 1/2) / (m_0^j deg(Z(U))) · b(m_0, μ_0) L′(G, 1 + 2j)"

**Correction / obligation:** L′(g, U, 0) = 2^{2−4j} √M π^{−3/2−2j} Γ(2j + 1/2) / (m_0^j deg(Z(U))) · b(m_0, μ_0) L′(G, 1 + 2j)

**Independent check:** Independently collated at the published locator and checked algebraically; see the independent report for the scope of the correction.

### E2 — misprint; affects nothing

Proof of Lemma 6.8, p. 743 (and the displayed identity on p. 744)

**Printed:** "(1 − x)² P′′ − 2xP′ + 2j(2j + 1)P = 0 … a_{2m+2}/a_{2m} = −(2j − 2m)(2j + 2m + 1)/((2m + 2)(m + 1))" and "x^{(m+1)}_{s−1,+} + x^{(m+1)}_{s,−} = (2j − 2m)(2j + 2m + 1)/((2m + 2)(m + 1)) x^{(m)}_s"

**Correction / obligation:** (1 − x²)P″ − 2xP′ + 2j(2j + 1)P = 0 and a_{2m+2}/a_{2m} = −(2j − 2m)(2j + 2m + 1)/((2m + 2)(2m + 1)); likewise (2m + 2)(2m + 1) in the identity on p. 744.

**Independent check:** Independently collated at the published locator and checked algebraically; see the independent report for the scope of the correction.

### E3 — error; affects a stated result

Theorem 7.9 (p. 758), its proof (p. 759), (7.10) (p. 760), Theorem 7.11 and its proof (p. 761), Theorem 7.13(2) (p. 763)

**Printed:** "Φ^𝓜_{Δ,m}(z, h, s) = −16√m/Γ(s − 1/4) Σ_{λ>0} … = 8√m/Γ(s − 1/4) G_{2s−1/2}(Z_Δ(m, h), (z, h))"; "Moreover, using 2√Q(λ_{z⊥}) = |p_z(λ)|"; "(7.10) … = 4m^{j/2} G_{1+j}(Z_Δ(m, h), (z, h))"; "Theorem 7.11 … G_{j+1,f}(Z_Δ(m_1, h), (z, h)) = −2^{j−1} Φ̃^j_Δ(z, h, Za^j_{d_1}(f))" and its proof "… = −2^{1−j} Σ_{m>0} …" for both parities; Theorem 7.13(2) "G_{j+1,f}(Z_Δ(m_1, h), (z^+_U, h)) = −2^{j−1} CT(…)"

**Correction / obligation:** The printed formulas are inconsistent. Replace |p_z(lambda)|=2 sqrt(Q(lambda_positive)) by |p_z(lambda)|=sqrt(Q(lambda_positive)). Do not yet assert a repaired numerical coefficient in Theorems 7.9, 7.11 or 7.13: first choose the sign convention in (7.2), account for F_{m,mu}=2 f_m at level one, and compare the SL_2 sum with the positively oriented weighted divisor. The previous proposed 4 sqrt(m) and +2^(j-2) repairs are withdrawn as unproved.

**Independent check:** Confirmed only as an inconsistency and the displayed p-norm error. The extraction’s claimed unique corrected constants and unconditional assurance about every downstream algebraicity proof are not established; rows 40, 42–44 and route 6 remain diagnostic.

### E4 — misprint; affects nothing

Proof of Corollary 7.18, p. 768

**Printed:** "Note that there are exactly s splittings D′ = ΔΔ̃ where Δ and Δ̃ are both fundamental discriminants and (−1)^jΔ > 0 since D′ < 0. We denote the fundamental discriminants satisfying these criteria by Δ_1, …, Δ_s."

**Correction / obligation:** There are exactly 2^{s−1} such splittings, Δ_1, …, Δ_{2^{s−1}}, and the sums in the proof run over i = 1, …, 2^{s−1} = h_{D′}.

**Independent check:** Independently collated at the published locator and checked algebraically; see the independent report for the scope of the correction.

### E5 — error; affects a stated result

Corollary 1.4, p. 696, and Corollary 7.18, p. 767 (also Theorem 6.1, p. 732)

**Printed:** "Let z_1 be any CM point of discriminant d_1 and let z_2 be any CM point of discriminant d_2 < 0 (not necessarily fundamental), where z_1 ≠ z_2 if d_1 = d_2. Then, there is an α ∈ H_{d_1}·H_{d_2} and an r ∈ Z_{>0} such that (d_1d_2)^{j/2}G_{j+1,f}(z_1, z_2) = (1/r)log|α|."

**Correction / obligation:** For the unregularized Green function require avoidance of every contributing Hecke correspondence T_m with c_f(-m) nonzero. This is a sufficient precise off-divisor hypothesis; do not identify it with support of a signed sum without handling cancellation. Alternatively define and separately prove a finite regularized extension. Distinct CM points alone do not suffice.

**Independent check:** Independently collated at the published locator and checked algebraically; see the independent report for the scope of the correction.

### E6 — misprint; affects nothing

Published (7.6), p.757; definitions of f_m following (7.5), p.756, and before (7.10), p.760; also arXiv v2.

**Printed:** "Z_Δ(m) = Σ_{λ ∈ L′ mod SL_2(Z), Q(λ)=m|Δ|, λ>0} (2/w(λ)) z_λ" and "f_m = q^mφ_μ + O(1)"

**Correction / obligation:** Z_Δ(m) = Σ_{λ ∈ L′ mod SL_2(Z), Q(λ)=m|Δ|, λ>0} χ_Δ(λ)(2/w(λ)) z_λ, and f_m = q^{−m}φ_μ + O(1).

**Independent check:** Independently collated at the published locator and checked algebraically; see the independent report for the scope of the correction.

### E7 — misprint; affects nothing

Published Theorem 5.4, final sentence, p.722; also arXiv v2.

**Printed:** "the Rankin–Cohen bracket is computed with respect to the weights (1, 1)"

**Correction / obligation:** Use weights (n/2,1).

**Independent check:** theta_P has weight n/2 and E_N has weight 1. For bracket order one the expression is theta_P prime times E_N minus (n/2) theta_P times E_N prime; the proof uses precisely this weight through k=1-n/2. The printed weights only agree when n=2.

### E8 — misprint; affects nothing

Published paragraph following Theorem 5.10, p.729; also arXiv v2.

**Printed:** "g ∈ S_{2−2j,rho_L}"

**Correction / obligation:** Use S_{2+2j,rho_L}.

**Independent check:** xi_{-2j} has shadow weight 2+2j and the Cohen operator on weight (1,1) has weight 2+2j. The printed negative weight does not type the Petersson pairing.

### E9 — misprint; affects nothing

Published Section 6.1, last hypergeometric-to-Legendre display, p.731; also arXiv v2.

**Printed:** "1 + |z_1−gamma z_2|²/(2m Im(z_1) Im(gamma z_2))"

**Correction / obligation:** Remove m from this denominator.

**Independent check:** Im(gamma z_2)=m Im(z_2)/|cz_2+d|² cancels the previous denominator’s m. For gamma=diag(2,1), z_1=z_2=i, the previous expression is 5/4 whereas this display gives 9/8.

### E10 — misprint; affects nothing

Published Section 6.2, discriminant group identification, p.733; also arXiv v2.

**Printed:** "L′/L ≅ Z/2MZ with the quadratic form x ↦ −x²"

**Correction / obligation:** The quadratic form is x ↦ -x²/(4M) modulo Z.

**Independent check:** The stated representative diag(x/(2M),-x/(2M)) has M times determinant -x²/(4M). At M=x=1 this is -1/4 modulo Z, whereas -x² is zero modulo Z.

### E11 — misprint; affects nothing

Published equation (6.7), p.733; also arXiv v2.

**Printed:** "|a−b Re(z)+c|z|²|/(sqrt(4mM) Im(z))"

**Correction / obligation:** Use |a-b Re(z)+M c|z|²| in the numerator.

**Independent check:** For lambda=[[b/(2M),-a/M],[c,-b/(2M)]], direct projection onto X(z)-perp gives the factor M c. At M=2,a=c=1,b=0,z=i,m=1, the correct square root of Q(lambda_positive)/m is 3/(2sqrt(2)); the printed value 1/sqrt(2) is even below 1.

### E12 — error; affects a stated result

Published equation (7.2), p.755; also arXiv v2.

**Printed:** "p_z(lambda)=-2^(-1/2)(lambda,X_1(z))=-(c|z|²-bx+a)/(2y)"

**Correction / obligation:** With the printed X_1 and bilinear form, the abstract expression equals +(c|z|²-bx+a)/(2y). To retain the negative coordinate convention used later, change the abstract prefactor to +2^(-1/2). Propagate the chosen convention through the Millson lift before fixing E3.

**Independent check:** At z=i, lambda=[[0,-1],[1,0]], X_1=-lambda/sqrt(2) and (lambda,X_1)=-sqrt(2), so the abstract expression is +1 and the coordinate expression is -1. Both formulas cannot define the same function.

### E13 — misprint; affects nothing

Published Theorem 7.13, p.763, and Example 1, p.769; also arXiv v2.

**Printed:** "G_N ∈ H_{1,rho_N}"

**Correction / obligation:** Use H!_{1,rho_N}.

**Independent check:** Section 3.2 defines H as the subspace with cuspidal shadow, but lowering this preimage gives the binary theta function, whose associated holomorphic theta series has nonzero constant coefficient at the zero coset. Theorem 3.9 and Lemma 9.3 correctly use H!.

### E14 — gap; affects a stated result

Published Theorem 7.11, p.761, and Corollary 7.15, p.764; also arXiv v2.

**Printed:** "Let j ∈ Z_{≥0}."

**Correction / obligation:** Use j>0 for these statements with the constructions given; a j=0 version requires separate definitions and regularization.

**Independent check:** Theorem 7.10 constructs Za^j only for j>0 and Section 7.3 defines the lifts for positive j. At j=0, G_1 is at the pole and the ordinary Green series is not a finite function. The printed endpoint therefore invokes undefined objects.

### E15 — gap; affects the proof

Published proof of Corollary 7.15, p.766; also arXiv v2.

**Printed:** "there is a root of unity zeta_sigma such that sigma(alpha)/alpha=zeta_sigma"

**Correction / obligation:** Use beta=Norm_{H_{d_2 Delta²}/H_{d_2}(sqrt(Delta))}(alpha). If all relative conjugates have the same absolute value, |beta|=|alpha|^[extension degree], which supplies descent and the uniform denominator without a root-of-unity assertion.

**Independent check:** Equal complex absolute values do not imply a quotient is a root of unity for arbitrary algebraic numbers. In Q(i,sqrt(2))/Q(i), alpha=sqrt(2)+i and its conjugate have equal modulus, but the quotient (-1+2i sqrt(2))/3 has primitive minimal polynomial 3X²+2X+3 and is not integral. The relative norm repairs the descent step without this inference; this is not a counterexample to the corollary’s final algebraicity assertion.

### E16 — misprint; affects nothing

Published proof of Corollary 7.18, p.768, product defining alpha; also arXiv v2.

**Printed:** "alpha(z)=product_i alpha_{Delta_i}(z)^{(t/t_{Delta_i})chi_{Delta_i}([a])}"

**Correction / obligation:** With t=h_{D′} lcm_i(t_{Delta_i}), use exponent t/(h_{D′} t_{Delta_i}). Also retain |DD′|^(j/2) on the left of the preceding averaged identity.

**Independent check:** Taking (-1/t)log of the printed product gives the character sum without the required 1/h_{D′}. The corrected exponents are integers by the chosen t and reproduce the preceding average. The scaling on p.767 must persist into this equality.

### E17 — error; affects the proof

Published Example 3, p.773, lattice identification and discriminant group; also arXiv v2.

**Printed:** "N_{−3} is isomorphic to the order O_{−63}"; Gram matrix [[-2,-3],[-3,-36]]; "Z/21Z × Z/3Z"

**Correction / obligation:** Keep the actual rescaled lattice N_{-3}: its Gram matrix in the scaled N basis is [[-6,-3],[-3,-12]], with discriminant group Z/3 × Z/21. The order norm lattice has the printed Gram matrix and cyclic discriminant group Z/63; they are not isometric. Recheck the theta coefficients using one consistent carrier.

**Independent check:** Both determinants are 63, but their Smith invariants are (3,21) and (1,63), respectively. Lattice isometry preserves the discriminant group. The common determinant does not identify an imprimitive scaled norm lattice with an order norm lattice. This does not by itself disprove the final logarithmic value.

### E18 — gap; affects the proof

Published proof of Proposition 9.6, p.782, denominator bound; also arXiv v2.

**Printed:** "Thus, c_0 x ∈ Z"; "B=lcm(A,c_0)"

**Correction / obligation:** From the displayed hypotheses one obtains A c_0 x integral; use the safe positive bound A|c_0|, enlarging the cutoff to include the constant coefficient if necessary. The stated existence of some B is preserved.

**Independent check:** The cancelled constant coefficient is only known to have denominator dividing A. For A=c_0=2 and cancelled coefficient 1/2, x=1/4: A c_0 x is integral but lcm(A,c_0)x is not. This is a counterexample to the inference from the supplied bounds, not an assertion that this numerical triple occurs for the canonical basis.

### E19 — misprint; affects nothing

Published introduction, automorphic Green series, p.700; also arXiv v2.

**Printed:** "Re(s) ≥ s_0"; "The sum converges normally"

**Correction / obligation:** Use Re(s)>s_0 for the series; values at s_0 require the separately normalized meromorphic/regularized value.

**Independent check:** Section 4 gives the open half-plane and a simple pole at s_0 for the nontrivial Green kernel. Normal convergence including that point cannot yield the claimed smooth finite family.

### E20 — misprint; affects nothing

Published equations (9.1) and (9.3), p.777, Fourier tails; also arXiv v2.

**Printed:** "sum_{nu} sum_{n≥0} a_{m,mu}(n,nu) q^n (phi_mu+phi_-mu)"

**Correction / obligation:** The tail must use the running component nu, with a consistent ordinary-coefficient convention (sum a(n,nu) q^n phi_nu), or the equivalent half-symmetrized convention. Do not keep the fixed input component mu in every summand.

**Independent check:** A vector-valued Fourier coefficient indexed by nu belongs to phi_nu. The printed tail forces all components into the input pair ±mu and cannot represent the arbitrary vector-valued forms being parametrized. Recheck the half factors in the duality identity when choosing the coefficient convention.

### E21 — misprint; affects nothing

Published Example 1, pp.768–769, lift and CM divisor labels; also arXiv v2.

**Printed:** "tilde Phi^1(f,z)"; "Z(1/4)"; "M!_{1/2,rho_L}"

**Correction / obligation:** For j=2 use the lift tilde Phi^2; for d_1=-4 the positively oriented CM divisor is Z_1(1); Za^2 has weight -3/2 and representation rhobar_L, with its corresponding plus-space multiplier.

**Independent check:** The definitions give m=|d_1|/4=1, lift index j=2 and Zagier weight 1/2-j=-3/2. The quoted labels are inconsistent with the example’s own parameters; the scalar Fourier exponents are rescaled by the plus-space comparison.

### E22 — misprint; affects nothing

Published Example 3, p.774, formula for alpha_2; also arXiv v2.

**Printed:** "... + (1/2)a² + a + 1/2"

**Correction / obligation:** Replace a by alpha_1 in these two terms.

**Independent check:** Only alpha_1 has been introduced as the chosen root of X^8+X^6-3X^4+X²+1; a is undefined. The resulting polynomial expression is the one whose numerical embedding is displayed.

### E23 — misprint; affects nothing

Published Example 3, p.775, factorization of 5; also arXiv v2.

**Printed:** "5 is inert in Q(sqrt(-7)) and splits completely in R_{-63}"

**Correction / obligation:** Over Q, 5 has four primes of residue degree two in H_{-63}; equivalently the prime of Q(sqrt(-7)) splits completely in the relative ring class extension.

**Independent check:** An inert quadratic subfield prevents complete splitting over Q. The displayed degree-eight defining polynomial reduces mod 5 to four distinct irreducible quadratic factors, consistent with the four displayed primes and residue degree two.

### E24 — gap; affects the proof

Published proof of Corollary 7.15, p.766, regrouping modulo ±1; also arXiv v2.

**Printed:** "sum_{mu mod ±1}(a(m,mu)b(-m,mu)+a(m,-mu)b(m,-mu))"

**Correction / obligation:** Use b(-m,-mu) in the second summand and weight fixed orbits separately. Establish the required parity for self-inverse discriminant classes instead of automatically doubling them.

**Independent check:** For mu=-mu the proposed orbit sum counts a singleton twice. Discriminant groups here have fixed classes, including zero. The displayed symmetry alone cannot justify the remaining denominator cancellation; no vanishing or parity argument for those classes is supplied in this step. This is a proof gap, not a disproof of the final integrality claim.

### E25 — error; affects a stated result

Published Section 6.1, property (iii), p.731, compared with the introduction definition on p.694; also arXiv v2.

**Printed:** "G_s(z_1,z_2)=e_{z_2} log|z_1-z_2|²+O(1)"; e is the PSL_2 stabilizer order.

**Correction / obligation:** With the printed -2 sum over SL_2(Z), the coefficient is 2e_{z_2}. Alternatively sum over PSL_2(Z) if retaining e_{z_2}; propagate that convention through all divisor and theta comparisons.

**Independent check:** Already for s=2, Q_1(t)=(t/2)log((t+1)/(t-1))-1 has leading term -(1/2)log(t-1). Each stabilizer element in -2 sum contributes log|z_1-z_2|², and the SL_2 stabilizer has 2e_{z_2} elements. The nonstabilizer terms are locally bounded. This independent factor-two issue prevents treating the even branch as automatically normalized.

### E26 — gap; affects the proof

Published Theorem 6.4, p.737, and linearity argument for Corollary 6.6, p.741; also arXiv v2.

**Printed:** "Let f ∈ H_{1/2−2j,rhobar_L}"; Corollary 6.6 follows "by linearity".

**Correction / obligation:** For the displayed unconjugated classical L-derivative formula, retain a real-coefficient shadow hypothesis; for Corollary 6.6 restrict to real principal coefficients. A complex-linear extension must conjugate the classical L-derivative at the real central point and specify the extension of the height pairing.

**Independent check:** Lemma 6.3 explicitly assumes g has real coefficients. The convolution in Lemma 5.3 is conjugate-linear in g, xi is conjugate-linear in f, and the classical Shimura L-series is linear in g. Consequently replacing f by i f changes the two candidate L-derivative terms in opposite ways. No real-to-complex comparison is supplied. This confirms a missing hypothesis/comparison in the inference, without claiming a particular nonzero derivative or a false final arithmetic statement.

### E27 — misprint; affects nothing

Published Section 6.3, p.739, cohomology degree of the CM cycle; also arXiv v2.

**Printed:** "the class of S_kappa(x) in H^{2kappa−2}(Y(C),C) vanishes"

**Correction / obligation:** The cycle class on the total generic-fiber Kuga–Sato variety belongs to H^{2kappa}(Y(C),C). Distinguish its codimension kappa-1 in the elliptic fiber from codimension kappa after pushforward to Y.

**Independent check:** The fiber has dimension 2kappa-2 and S_kappa(E) codimension kappa-1. Embedding that fiber in the variety over a curve raises codimension by one. The same page correctly calls the arithmetic CM-cycle codimension kappa; the corresponding complex cycle class is in degree 2kappa.

## Routes and revision conditions

**Route 1: reject.** Reject the present aggregate: import the built imaginary-quadratic two-rank/genus infrastructure and split off the binary-form/matrix genus-character comparison. GN.2 is a plausible adapter owner; it must not rebuild Tau Ceti Multiquadratic or the upstream Hilbert-symbol theory.

**Route 2: reject.** MP.6 is the right theta-integral direction, but row 9 combines coherent Siegel–Weil, incoherent vanishing and operator identities without separate normalizations or extracted suppliers. Split these and state the volume/representation contracts before using this source route.

**Route 3: reject.** MP.7 is a plausible extension owner, but its description does not explicitly supply the asserted full Shimura/Skoruppa–Zagier newform correspondence. Split the explicit lift from the isomorphism and acquire their precise sources and hypotheses.

**Route 4: reject.** GZ.6 owns the incoherent derivative direction. Row 10 leaves the Kudla–Yang Fourier formulas, constant coefficient and Hilbert analogue inside quoted prerequisites; a source attribution alone does not establish this whole interface.

**Route 5: reject.** GZ.7 owns finite local intersections, but rows 14–16 need separate moduli, Cartier/closure, pullback, deformation-length and weighted-intersection contracts and the external Howard/Xue/Bruinier–Yang proof suppliers.

**Route 6: reject.** The proposed Part II has the right broad direction and should coalesce with PAPER-LI-23, but the brief is not buildable: unresolved global and odd-branch normalization, nonisometric example lattices, missing hypotheses, unsplit API/definition rows, and quoted analytic/arithmetic suppliers. Import GH.0/GH.1 rather than rebuilding their cycle construction; the unreviewed GSpin candidate is not a completed dependency and its n=1,2 boundary is uncovered.

**Route 7: reject.** The new source route records the residual finite-discriminant Weil comparison in the shared MP.2/MP.4 direction. It is not accepted until S/T relations, contragredient/central-character conventions, dyadic cases and the finite-index sublattice comparison are individually specified.

**Route 8: reject.** The new source route assigns weak-Jacobi generators and their normalizations to MP.8, the Jacobi/theta-decomposition owner imported by QM.1. It remains incomplete until the weak-ring theorem and its vector-valued comparison are extracted with API and coefficient tests.

## Remaining closure and API work

**G1 — Normalization and singular-domain closure.** Fix E3/E12/E25 simultaneously; separate raw and finite regularized values, principal-part factors, group quotients and weighted cycles. Recompute independent numerical examples with error bounds.

**G2 — Granularity, API and tests.** The 46 rows are aggregate summaries, often containing several numbered results. Split each definition/construction and every used theorem; specify constructors, coefficient/normalization maps, transformation and composition laws, and positive/negative acceptance propositions. The route-level numerical examples do not supply APIs or unit tests for these carriers.

**G3 — Analytic proof suppliers.** Acquire the named prerequisite originals and extract the exact-sequence, analytic continuation/current/L², Fourier-coefficient, bounded-denominator and lift comparison results recursively. No acceptance is implied by their occurrence in prerequisites.

**G4 — Arithmetic and CM proof suppliers.** Supply stabilizer/order comparison, proper CM ideals and binary forms, class-field reciprocity, scaled Borcherds rationality with uniform multiplier, nonvanishing/cancellation, Gillet–Soule intersection theory and Zhang/Xue/Howard comparisons. Use norm descent (E15); close fixed-orbit integrality (E24).

**G5 — Hypotheses and component conventions.** Resolve finite Weil and weak-Jacobi residuals, restriction carriers, weights and real/complex linearity. State rational/integral hypotheses for the post-Theorem-5.10 rational-log consequence and supply its omitted proof.

**G6 — Ownership and candidate boundaries.** Import built Multiquadratic and shifted Legendre material; import GH.0/GH.1 and common CM interfaces. Coalesce PAPER-LI-23 without treating its absent review as acceptance. GSpinSpecialDivisorHeights also has no review and does not automatically cover n=1,2. Do not replace the discriminant-module comparison with a finite-field Weil representation.

The input has 5 definition rows and 5 construction rows. None supplies structured per-definition API and unit-test lists. This review leaves that as G2 rather than manufacturing closure from a few example values. Concrete revision contracts include:

- **Finite Weil carrier:** the same finite quadratic module as the lattice library; explicit S/T matrices, central/parity law, dual/conjugate comparison, and the restriction/trace adjunction. Test the rank-one discriminant-two module and a dyadic module; check composition through two finite-index sublattices.
- **Poincaré inputs:** principal-part extraction, uniqueness at the specified negative weights, raising with all Gamma factors, and separate fixed/nonfixed μ under sign. At μ=−μ the F input must produce twice the normalized φμ coefficient.
- **Green kernels and lifts:** distinct carriers for the convergent raw kernel and the finite regularized extension; linearity on the declared input space, domain-of-definition lemmas, local singularity coefficients and the normalized theta comparison. Test the determinant-two Mobius identity and a Hecke pole; neither is covered by numerical CM values away from the divisor.
- **CM restriction and preimages:** the actual group-ring map for P⊕N⊂L, coefficient pairing/trace, H! lowering, exceptional constant coefficient and one uniform denominator. Test that an impossible cuspidal shadow is rejected and that nonisometric determinant-63 lattices remain distinct.
- **Descent and averaging:** norm compatibility with Artin action, explicit degree dependence, character orthogonality and denominator clearing. Test D′=−84, the 1/h exponent, and self-inverse discriminant classes before claiming an integral linear combination.

These are required revision work, not implemented APIs. The ten new prerequisite entries supply public bibliographic starting points and explicitly state that their original proofs remain unread in this review. Further missing supplier interiors must be extracted, not hidden in hypotheses.

## Changes and validation

The result JSON contains a field-level change ledger for all 123 changed item fields, separate historical reading/search claims, pinned declaration statements and hashes, per-item search groups, all 27 source verdicts and the open G1–G6 register. Top-level changes are: complete→partial; revised summary/current reading scope; 2 and 5 planned→missing; two residual source routes; corrected/rejected Part II brief; ten added prerequisite entries; independent review metadata. Stable original IDs and the six route indices are preserved. The human extraction report is rewritten to reflect the current status rather than retain stale assertions of corrected constants.

Validation: `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BRUINIER-EHLEN-YANG-21.result.json` passes. Focused checks verify stable IDs, exact-once routing of all 40 missing items, complete route/source verdict lists, all 13 cited declaration records, source-file pins, and the field-level change ledger. Mathematical diagnostics cover Gamma-factor simplification, finite Legendre checks, the pole witness, two Smith forms, finite-field factorization and the denominator/norm counterexamples. These finite checks are not formal proofs. The exact four deliverables are checked against swarm intake before publication; no unrelated worktree files are included.
