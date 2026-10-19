# Independent review: ModularIwasawaMainConjectures

Job: `REV-ModularIwasawaMainConjectures` · issue #453 · reviewer: Codex, session `codex-zwwmND` · 2026-10-19. The original blueprint was written by Claude, session `claude-5sHW61`; this is an independent review.

**Verdict: accepted after correction, as a complete target-level pass with explicit gaps.** All 46 nodes are justified at this granularity: 7 verified, 39 corrected, 0 added and 0 unverifiable. The seven layers remain planned and none is closed. Nine gaps and thirteen precise supplier requests remain binding. Complete does not mean that the arithmetic has been formalized or that these obligations have been discharged.

## Inventory and coverage

| Item | Reviewed result |
|---|---|
| Nodes | 46: 8 definitions, 5 constructions, 23 theorems, 2 lemmas, 6 comparisons, 2 applications |
| Layer counts | L0: 12; L1: 6; L2: 3; L3: 6; L4: 5; L5: 11; L6: 3 |
| API and tests | 90 API entries; 49 discriminating tests across all 13 definitions/constructions; each has at least three |
| Planets | 20 named definitions, constructions or central theorems |
| Pinned baseline | 6 cited statements read and confirmed; 0 citations removed |
| Sources | 12 public mathematical PDF copies and 2 public LMFDB records, with URLs and SHA-256 identifiers |
| Supplier interfaces | 76 originally cited node exports read; stage-level machinery and new precise requests checked against their owners |
| Source findings | 6 reviewed: 5 confirmed, 1 rejected; 3 findings added during this review |
| Remaining work | 9 gaps, 13 requests, 2 maintainer restructuring proposals; 7 planned and 0 closed layers |

The target-level graph covers all layer targets in the roadmap brief: the three formulations, separate ordinary theorems, pointwise theorem, curve/form and BCS interfaces, family and signed theory, arithmetic consequences/examples, and the separately owned branch interfaces. Smaller steps stay in proof sketches. No target was split into an artificial sequence of low-level lemmas. All nodes keep implementationStatus unchecked.

## Mathematical repairs

1. **Integral normalizations.** The cohomological canonical period Ω_f and differential period P_f=−2πiΩ_f had been conflated. Skinner §2.4 footnote 6, p.14 corrects the SU interpolation exponent from m to m+1. The analytic and curve/form dictionaries, period API and normalization test now agree. An algebraic Kato period quotient plus a saturated modular-symbol lattice does not establish an integral O-unit comparison in every weight; the ordinary comparison and FW Selmer consequence now state that missing input explicitly. LLZ’s actual-image integral quotient remains valid, while a separate Néron/Pollack analytic unit comparison is recorded as an obligation.

2. **Local Galois arguments.** A lift of a residual unipotent need not have free rank-one coinvariants. The matrix g=[[1,1],[p,1+p]] has det(g)=1 and det(g−1)=−p, so over Z_p its quotient has torsion instead of free rank one. The application now uses actual characteristic-zero inertia unipotence at the auxiliary Steinberg prime. The cited compatibility supplier was changed from the coefficient-prime theorem to R19.4’s away-prime theorem. Full Tate-module image also uses a precise Serre lifting lemma for p≥5, after a commutator argument; residual surjectivity is not treated as the proof by itself.

3. **Ranges and components.** The ordinary datum includes its stated multiplicative weight-two branch. Rubin’s quoted elliptic corollary retains non-CM. FW’s purported extra scalar hypothesis is removed: at odd p and even k, det ρbar=ω^(1−k) cannot be a square on inertia. LLZ (E) concerns the full cyclotomic field Q(μ_p∞), and the unconditional FW-powered signed application is η=1; Theorem 6.5’s restrictions remain in force for any extension. Skinner’s p=3 multiplicative range requires an additional Hida-family supplier output because the existing family node starts at p≥5.

4. **Integral transport.** Lattice-change errors are bounded-uniformizer-torsion, not necessarily finite groups. Curve/form transport uses the inverse-image Tate lattice λ_*^−1(T_pE) and the cohomological dual. The BCS elliptic theorem is applied in its own Néron normalization without imposing an extra unsupported Manin-unit restriction. FW primitive/partial transport uses inverse dual Euler factors; Σ-partial derived base change and primitive specialization are distinguished, including suitable/all-lifts conditions and Tor corrections. Euler-factor exactness is first used for a large ramification set and then descended by common-enlargement cancellation.

5. **Arithmetic consequences.** Exact MTT/full BSD and the p-primary up-to-unit statements are distinct. Sha finiteness and the torsion-normalized regulator are explicit. Schneider’s published Theorems 2′ and 6–7 have now been read: the unread-source placeholder was replaced by the component, reduction, torsion, height and logarithmic-coordinate factors. Applying them to ordinary Galois Selmer still requires the precise recorded flat-Selmer and height comparison; no exact MTT equality is inferred from an ideal equality. The rank-zero converse uses odd p and a finite discrete A=V/T Selmer group.

6. **Examples and branch interfaces.** Exact LMFDB curve identifiers are 11.a2 (Cremona 11a1) and 14.a6 (14a1). Independent discriminants, finite-field point counts and eta-product coefficients agree with the stated examples. The mod-7 higher-weight irreducibility test is a nonsquare Frobenius discriminant; its ramification-at-5 application stays conditional. Finite p=13 coefficient tests are only diagnostics. Database analytic Sha is not used as a proof of actual Sha. Keller–Yin’s locator is 3.0.10, CGS exclusions are kept separate, and the multiplicative anticyclotomic endpoint retains its own local conditions rather than the good-ordinary square dictionary.

## Pinned baseline audit

The actual source declarations were read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. No baseline citation was deleted. One description was corrected: ContRepresentation ensures that each operator is continuous; it does not encode continuity in the group variable.

| Declaration | Source location | Outcome |
|---|---|---|
| mathlib:Representation.invariants | Mathlib/RepresentationTheory/Invariants.lean; statement read at the pinned commit (line 74) | The submodule of vectors fixed by every group element, used for dim ρ̄^{I_ℓ} and dim ρ̄^{D_ℓ} |
| mathlib:ContRepresentation | Mathlib/RepresentationTheory/Continuous/Basic.lean; statement read at the pinned commit (line 54) | A monoid homomorphism to continuous linear endomorphisms. This ensures continuity of each operator on the module; continuity in the group variable or of the joint action must be supplied separately for a continuous Galois representation. |
| mathlib:Matrix.toLin' | Mathlib/LinearAlgebra/Matrix/ToLin.lean; statement read at the pinned commit (line 386) | Matrices as linear maps (n → R) → (m → R), used for the unipotent rank-one quotient |
| mathlib:PowerSeries | Mathlib/RingTheory/PowerSeries/Basic.lean; statement read at the pinned commit (line 60) | Formal power series R⟦X⟧, the model O⟦X⟧ of Λ |
| mathlib:Associated | Mathlib/Algebra/GroupWithZero/Associated.lean; statement read at the pinned commit (line 29) | x and y differ by a unit, the equality of principal ideals |
| mathlib:IsDiscreteValuationRing | Mathlib/RingTheory/DiscreteValuationRing/Basic.lean; statement read at the pinned commit (line 58) | The coefficient ring O |

The reviewed library audit does not place modular ordinary/signed main conjectures, integral Coleman-image quotients or the stated period comparisons in the pinned library. The prototype therefore states only light interfaces over available carriers. Current upstream ownership was checked separately from the pinned baseline.

## Current upstream and supplier ownership

Read-only ownership check on 2026-10-19: TauCetiRoadmap main 0d144d044dacebca17b654695b6f1ad58f159b27 and its TauCeti package a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Checked the nine post-snapshot directions, including LocalGaloisGroups and ProfiniteArithmetic for local inertia and continuous-cohomology overlap; no cyclotomic modular main-conjecture target is duplicated. OperatorTheory is an umbrella of eight roadmaps, not a missing single Suggested file. PadicMeasuresIwasawaAlgebras here is an atlas supplier, not a claim that it is a roadmap on current upstream main.

Current TauCeti already defines TauCeti.tateCurve over Z[[q]] in AlgebraicGeometry/EllipticCurve/TateCurve/Basic.lean and TauCeti.tateCurveAt in Specialization.lean, with its ellipticity and discriminant norm. Reuse these when the baseline is advanced. They do not provide point uniformization Qbar_p×/q^Z or the Tate parameter of an arbitrary split multiplicative E; those remain the upstream EllipticCurves layer-4 supplier obligation. This packet plans only the arithmetic L-invariant and its use, not a new Tate-curve construction.

Read current FieldTheory/GaloisCohomology/Kummer.lean and AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean. The Kummer map/isomorphism and restriction/corestriction are existing inputs, and WeierstrassCurve.Affine.selmerGroup₂ is a finite 2-descent Selmer group. None is a p-infinity ordinary cyclotomic Selmer group, Coleman-map local condition or Schneider height comparison. Reuse existing cohomology and descent rather than planning them here.

The supplier statements, rather than their names alone, were checked in the available atlas packets/integrated layers. In particular the Kato period quotient is algebraic, the Hida-family input has a p≥5 range, and the generic Selmer duality output does not state Schneider’s flat-Néron comparison. Those near misses became explicit requests/gaps, not false closure claims. ArithmeticGaloisRepresentations R01.6 is asked for the exact rank-two lifting output; the public LSTX introduction states that rank-two input separately from its higher-dimensional Theorem 1.

RS-11’s ownership split is preserved: no proof of the FW or BCS endpoints is replanned here. No other roadmap, campaign file, atlas data, queue or upstream tree was edited. The two restructuring proposals remain for the maintainer.

## Every node checked

The machine-readable verdicts below also appear in the packet’s review.checked list. Source theorem/section/page locators and the complete corrected statements remain in each node and in the synchronized reader.

### L0

| Node | Verdict | Check or correction |
|---|---|---|
| L0/modular-iwasawa-datum | corrected | Included the specified weight-two multiplicative datum, corrected the ordinary cohomological filtration and distinguished residual semisimplification from lattice-dependent extensions. |
| L0/ordinary-selmer-dual | corrected | Replaced finite lattice-change errors by bounded-uniformizer-torsion errors, made tame-component coefficient twists explicit, and restored the large-ramification-set hypothesis for the local exact sequence. |
| L0/ordinary-selmer-structure | corrected | Restored non-CM in the quoted Rubin elliptic corollary and changed the torsion-order test to divisibility by 50 rather than equality. |
| L0/canonical-ordinary-padic-l-function | corrected | Corrected the known SU interpolation exponent to m+1 using Skinner footnote 6, separated cohomological Ω_f from differential P_f=−2πiΩ_f, defined character/conductor notation and multiplicative interpolation, and made integral period compatibility an explicit obligation. Added a normalization test. |
| L0/ordinary-main-conjecture | corrected | Made divisibility equivalence conditional on torsion and a nonzero analytic element; allowed Schneider’s explicitly conditional use of the conjecture. |
| L0/iwasawa-fundamental-line | corrected | Used the total fraction algebra on the tame-character product, separated general Σ-partial base change from suitable primitive specialization, and retained the rank-one local correction complex. |
| L0/kato-main-conjecture | verified | Checked Fouquet–Wan Conjecture 1.5 and Kato 12.10: integral zeta-basis statement and its characteristic-ideal form retain the lattice and rank/torsion conditions. |
| L0/zeta-basis-characteristic-equivalence | corrected | Separated integral cone cohomology from generic acyclicity and replaced an arbitrary residual-unipotent lift by an actual characteristic-zero inertia unipotent; recorded source findings E4–E5. |
| L0/ordinary-cohomological-comparison | corrected | Retained the integral canonical/Kato period scalar and conditioned integral equivalence on an O-unit comparison not proved by the cited supplier statements. |
| L0/signed-selmer-dual | corrected | Restricted basis-change invariance to changes preserving the chosen signed line; a general basis mixes the two kernels. |
| L0/signed-main-conjecture | corrected | Kept LLZ’s integral characteristic ideal of the actual fractional Coleman image quotient; corrected coordinate transformation and made the Néron/Pollack analytic normalization conditional. |
| L0/signed-cohomological-comparison | corrected | Restored LLZ (E) on Gal(Qbar/Q(μ_p∞)), rather than on the smaller cyclotomic Z_p tower; kept the actual image term in the exact sequence. |

### L1

| Node | Verdict | Check or correction |
|---|---|---|
| L1/residual-hypothesis-predicates | corrected | Restricted lattice independence to semisimplification or the irreducible case, corrected the auxiliary unramified quadratic character and separated the inertia ramification criterion from rational-local p-th powers. |
| L1/unipotent-rank-one-quotient | corrected | Used an actual Steinberg inertia unipotent, replaced the coefficient-prime compatibility citation by R19.4 away-prime local compatibility, and supplied the explicit arbitrary-lift counterexample in Suggested.lean. |
| L1/su-ordinary-theorem | corrected | Corrected the cohomological weight-two residual filtration in the acceptance example; kept the SU weight congruence and auxiliary-prime range separate from FW. |
| L1/fw-ordinary-theorem | corrected | Corrected the cohomological filtration in the example while preserving the FW §4.8 GU(3,1)/Beilinson–Flach route and its distinct local hypothesis. |
| L1/fw-ordinary-selmer-form | corrected | Made the integral canonical/Kato-good-pair unit comparison an explicit hypothesis and gap; algebraic period ratios alone do not give integral equality. |
| L1/skinner-multiplicative-theorem | corrected | Replaced chosen-generator congruence by congruence of principal ideals modulo p^m and recorded the missing p=3 Hida-family supplier range. |

### L2

| Node | Verdict | Check or correction |
|---|---|---|
| L2/fw-convention-dictionary | corrected | Corrected primitive/Σ-partial transport to inverse dual Euler factors, retaining their nonunit determinant corrections. |
| L2/fw-pointwise-theorem | corrected | Removed the spurious scalar-exclusion assumption: parity of det=χ_cyc^(1−k) already excludes that case at odd p. Matched the auxiliary quadratic-character condition to Theorem 5.1. |
| L2/fw-ordinary-and-signed-consequences | corrected | Kept the independent KMC endpoint unconditional in its source range and made only its ordinary integral canonical-period transport conditional. |

### L3

| Node | Verdict | Check or correction |
|---|---|---|
| L3/curve-form-lattice-dictionary | corrected | Used λ_*^−1(T_pE) inside V_p(A_f), not the image lattice, and its cohomological dual; corrected the differential/Néron period ratio and retained nonunit isogeny and Manin factors. |
| L3/msd-padic-l-function | corrected | Corrected the analytic form-to-curve scalar to P_f/Ω_E with P_f=−2πiΩ_f. |
| L3/mazur-main-conjecture | corrected | Used the differential period P_f in the canonical/Néron unit criterion. |
| L3/bcs-rational-theorem | verified | Checked BCS v2 Theorems 1.1.2 and 1.2.2 and the AutomorphicCongruences L5b supplier: rational equality keeps the non-CM and ordinary hypotheses. |
| L3/bcs-integral-theorem | corrected | Applied the elliptic BCS endpoint in its own Néron normalization; removed an unsupported extra Manin-unit step that would incorrectly narrow its nonsemistable range. |
| L3/surjective-implies-rank-one-image | corrected | Inserted the commutator and rank-two Serre lifting argument for p≥5 with cyclotomic determinant; made the exact missing R01.6 supplier output a request. |

### L4

| Node | Verdict | Check or correction |
|---|---|---|
| L4/fw-universal-family-theorem | verified | Checked Fouquet–Wan Theorem 5.2, Proposition 3.23 and AutomorphicCongruences L4: the regular coefficient subring is distinguished from the big Hecke algebra. |
| L4/family-specialization-corrections | corrected | Separated derived Σ-partial base change for matching maps from primitive suitable/pure specializations, required all lifts in FW Definition 3.19, and retained Euler and Tor terms. |
| L4/llz-signed-main-conjecture | corrected | Restricted the FW-powered unconditional application to η=1 for both signs; nontrivial tame components require their own KMC input and must obey LLZ Theorem 6.5’s sign restriction. |
| L4/llz-basis-adjusted-simplification | verified | Checked LLZ Theorem 4.28 and Corollaries 5.18/5.22: full or augmentation image is component-dependent, so no image term is silently discarded. |
| L4/kobayashi-pollack-comparison | corrected | Separated rational-unit equality of kernels and actual integral image quotients from the additional integral Néron/Pollack period-unit comparison. |

### L5

| Node | Verdict | Check or correction |
|---|---|---|
| L5/euler-factor-change | corrected | Restored the large ramification-set hypothesis and common-enlargement cancellation before asserting invariance for arbitrary Σ. |
| L5/coefficient-extension-invariance | corrected | Included extension of signed bases and actual Coleman image lattices, rather than only abstract modules. |
| L5/mu-lambda-comparison | verified | Checked characteristic-ideal/Weierstrass supplier statements: equality implies equality of both invariants; unit invariance and rational equality are distinguished. |
| L5/rank-zero-converse | corrected | Restored p≥3 and finiteness of the discrete A=V/T Bloch–Kato Selmer group; vector-coefficient vanishing is a different statement. The all-level Wan route remains a reported supplier obligation. |
| L5/tate-l-invariant | verified | Checked Colmez Definition 0.9 and Remark 0.13: log_p(q)/ord_p(q), normalization independence, and transcendence/nonvanishing remain explicit upstream requests. |
| L5/mtt-padic-bsd-conjecture | corrected | Separated exact MTT/full BSD from the Z_p-unit MTT_p/p-primary BSD statement, made the appropriate Sha finiteness explicit, retained torsion in the regulator exactly once, and qualified the numerical Sha input. |
| L5/greenberg-stevens-trivial-zero | corrected | Corrected exact-versus-p-part equivalence and the rank-zero torsion-normalized regulator; retained nonzero anomalous Euler factors and the nonzero L-invariant. |
| L5/schneider-padic-bsd-from-mc | corrected | Read published Theorems 2′ and 6–7, recorded all leading-term factors and raw-versus-normalized regulators, and replaced the unread-source gap by precise flat-Selmer, height and logarithmic-coordinate comparison obligations. |
| L5/greenberg-and-coates-perrin-riou-instances | corrected | Made V^∨ the Tate dual and projected Greenberg’s Q(μ_p∞)^+ formulation to the trivial tame component before comparison with one Γ branch. |
| L5/weight-two-examples | corrected | Added exact LMFDB identifiers, independently checked discriminants and point counts, separated SU/BCS from the FW local test, and conditioned the final Néron-normalized signed analytic transport on its period comparison. |
| L5/higher-weight-example | corrected | Replaced the unsupported residual classification by a nonsquare Frobenius discriminant at 2 modulo 7, retained the ramification-at-5 gap and downgraded finite p=13 coefficient checks to a diagnostic rather than a reducibility proof. |

### L6

| Node | Verdict | Check or correction |
|---|---|---|
| L6/anticyclotomic-formulation-dictionary | verified | Checked HE.8b supplier and BCS v2 Theorem 1.2.4: ordinary anticyclotomic local conditions and BDP square are retained, and not substituted into the separate multiplicative endpoint. |
| L6/eisenstein-branch-interface | corrected | Corrected Keller–Yin’s locator to 3.0.10 and distinguished its odd-good-Eisenstein range from the CGS character exclusions; retained the imaginary-quadratic infrastructure gap. |
| L6/supersingular-and-multiplicative-branch-interface | corrected | Kept the multiplicative anticyclotomic endpoint’s own strict/unrestricted Selmer group and BDP normalization instead of the good-ordinary square dictionary; matched the BSTW supplier without inventing residual hypotheses. |

## Source findings

All original findings were checked at their locators, and three additional findings were recorded. These are scoped to the actual copy read. No passage is reproduced; the packet’s printed descriptions are paraphrases. The bounded errata search is evidence of the search performed, not a claim of exhaustive novelty.

### ModularIwasawaMainConjectures/E1 — rejected

arXiv:2107.13726v3, Theorem 1.7 (p.7) and Theorem 5.1 (p.68), against Theorem 1.1 (p.3) and Assumption 2.1(2) (p.17)

The remark immediately after Theorem 5.1 (v3, p.69) explicitly explains the omission: trivial nebentypus and even weight give det ρ̄ = χ̄_cyc^(1−k), an odd power. A scalar local semisimplification would have square determinant on tame inertia; the odd exponent is not a square character since p−1 is even. No extra scalar hypothesis or gap is needed.

Effect: a stated result. Known correction: new.

### ModularIwasawaMainConjectures/E2 — confirmed

arXiv:2107.13726v3, §1, paragraph after Theorem 1.1, p.3

In the cohomological normalization the inertia-fixed line has Frobenius μ(ℓ)ℓ^{1−k/2}, so absence of fixed vectors is the noncongruence of that eigenvalue to 1, not merely μ(ℓ)=−1. The weight-four tests in the finding distinguish them. The theorem statements retain their own hypotheses; this finding concerns the explanatory equivalence in the arXiv v3 remark only.

Effect: nothing. Known correction: new.

### ModularIwasawaMainConjectures/E3 — confirmed

arXiv:2107.13726v3, Theorem 1.6 and the preceding paragraph, p.6

Confirmed the incompatible 3.19/3.29 citations on Fouquet–Wan v3 p.6 and the 3.6.4 statement in the Skinner–Urban author copy. The correction is scoped to those texts; the Springer endpoint served an HTML challenge, so published numbering remains uncollated.

Effect: nothing. Known correction: new.

### ModularIwasawaMainConjectures/E4 — confirmed

arXiv:2107.13726v3, proof of Lemma 3.13, p.26

Over Z_p, g=[[1,1],[p,1+p]] has determinant 1 and reduces to a nonidentity unipotent, but det(g−1)=−p, so ker(g−1)=0 and coker(g−1)≅Z_p/p. This refutes the matrix inference, not the main theorem. The corrected local proof uses a lift with (g−1)^2=0.

Effect: the proof. Known correction: new.

### ModularIwasawaMainConjectures/E5 — confirmed

arXiv:2107.13726v3, proof of Lemma 3.13, p.26, the complex C and its cohomology

Cohomology of a complex of fraction-field vector spaces is a vector space over that field; integral torsion modules cannot be identified with it before tensoring. The surrounding proof makes the intended acyclicity conclusion clear.

Effect: nothing. Known correction: new.

### ModularIwasawaMainConjectures/E6 — confirmed

Skinner–Urban author copy §1.1 pp.1–2 and §3.4.4 p.38; corrected by Skinner arXiv:1407.1093v1 §2.4 footnote 6 p.14

Skinner’s equation (2.4.1) and footnote 6 explicitly give the correction and explain the difference between the two period conventions. In weight two the Néron-period ratio must compare Ω_E with P_f.

Effect: nothing. Known correction: Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2, §2.4 equation (2.4.1) and footnote 6 (arXiv v1 p.14).

E1 is rejected, so its alleged scalar gap is not carried into any theorem hypothesis. E2 and E3 are retained with their limited local-formula/reference effects. E4 concerns the arbitrary-lift step and does not refute the main theorem. E5 separates the integral cone from its generically acyclic localization. E6 is already corrected in Skinner 2016 and is not claimed as new. The Springer version-of-record endpoint returned a browser challenge; assertions about SU are confined to the public 226-page author copy actually read. FW findings refer to arXiv v3 only.

## Handed red-team findings

| Finding | Disposition checked |
|---|---|
| RT-AREA-iwasawa-1/4 | (a) L1/skinner-multiplicative-theorem with sub-layer proposal L1m; (b) Greenberg–Stevens requested from PadicFamilies:L3 and used in L5/greenberg-stevens-trivial-zero; (c) BDGP transcendence requested from DiophantineApproximationAndTranscendence:DT.5 and used in L5/tate-l-invariant. |
| RT-AREA-iwasawa-1/5 | Recorded as a gap on L6/eisenstein-branch-interface and as a restructure proposal for a roadmap on elliptic units and imaginary-quadratic main conjectures. |
| RT-AREA-iwasawa-1/14 | L1/su-ordinary-theorem is the Skinner–Urban/Skinner Theorem A (p ∤ N) form with its own route; L1/fw-ordinary-theorem keeps FW 1.6. In Fouquet–Wan's cohomological normalisation the extra condition dim ρ̄^{G_ℓ} = 0 excludes, in weight two, every split multiplicative auxiliary prime (not only those with ℓ ≡ 1 mod p, which is the homological reading). |
| RT-AREA-iwasawa-1/17 | L3/curve-form-lattice-dictionary imports GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit and keeps every nonunit factor. |
| RT-AREA-iwasawa-1/22 | L1/fw-ordinary-theorem follows FW §4.8 (GU(3,1) Theorem 7.32, Beilinson–Flach reciprocity, Poitou–Tate, Castella–Wan Theorem 3.8 in weight k) owned by AutomorphicCongruences:L2; the Skinner–Urban U(2,2) route is the separate L1/su-ordinary-theorem with SU's weight condition, so Wan 2015 is not needed; the canonical/Gross comparison is a recorded gap. |
| RT-AREA-iwasawa-1/23 | L3/curve-form-lattice-dictionary has EllipticCurveModularity:R29.5/modular-parametrisation and R29.6/modularity-theorem as prerequisites. |

## Remaining obligations for the orchestrator

These are implementation/supplier obligations and scope proposals, not unresolved contradictions in the corrected statements. The reader reproduces their full output specifications; no additional permission or question is needed to record them.

1. **No owner for the p-adic height pairing of an elliptic curve.** The Mazur–Tate/Schneider p-adic height ⟨ , ⟩_{p,α} on E(Q) and its regulator R_{p,α}(E) are needed to state MTT and Schneider's implication. The atlas has only Nekovář's height as a Bockstein map (NoncommutativeAndEquivariantIwasawa:NE.7/height-pairing-bockstein); the 'SelmerIwasawaCohomology, Part II: p-adic height pairings' direction accepted in the review of PAPER-DISEGNI-LIU-24 is not yet a roadmap (its design job is open). Until it exists the two nodes cite NE.7 and this gap.
2. **Flat Néron-model and ordinary Galois Selmer comparison.** Schneider’s published Theorems 2′ and 7 have now been read. Applying them to MMC still needs an explicit comparison of his alternating flat Néron-model cohomology characteristic factors with X_ord(E/Q∞), plus the normalization of the analytic κ-height relative to the MTT height and X↔s coordinate. The existing Selmer L3 duality statement does not itself provide this comparison; the added L3 request states the needed output. The node is conditional on it.
3. **Ramification at 5 in the higher-weight example.** For f = η(z)⁴η(5z)⁴ at p = 7, ramification of ρ̄ at 5 follows from Mazur's principle in weight 4 ≤ p + 1 (5 ≢ 1 mod 7, S_4(SL₂(Z)) = 0); the cited level-lowering statement in weight 4 has not been fixed. The example is not used by any theorem.
4. **Iwasawa main conjectures for imaginary quadratic fields (RT-AREA-iwasawa-1/5).** The Eisenstein-prime branch interface re-exports RankZeroOneBSD:BSD.7a's integral cyclotomic theorems, which rest on Rubin's two-variable main conjecture via elliptic units, the Hida–Tilouine anticyclotomic main conjecture and Hida's μ = 0 for anticyclotomic Katz p-adic L-functions, none of which any roadmap plans. The restructure entry proposes the owning roadmap; this interface carries the gap until it exists.
5. **Canonical versus Gross periods.** Deducing Fouquet–Wan Theorem 1.6 from Skinner–Urban's U(2,2) argument would need a comparison of canonical and Gross periods that, as Fouquet–Wan note (p.6), is not in the literature in the required generality. The plan does not use it: L1/fw-ordinary-theorem follows the §4.8 route owned by AutomorphicCongruences:L2, and L1/su-ordinary-theorem keeps Skinner–Urban's own hypotheses. Any alternative route through the comparison must first supply it.
6. **Integral Kato-good-pair versus canonical-period comparison.** The cited Kato L3 period quotient is algebraic, and the modular-symbol supplier supplies saturated lattices. Neither cited statement proves that Kato’s good pair for the dual lattice yields the same integral canonical normalization up to O× in every weight (factorials, congruence factors and dual lattices must be tracked). L1/fw-ordinary-selmer-form is explicitly conditional on this comparison; the direct Skinner–Urban theorem retains its own canonical normalization.
7. **Hida congruences at p=3 for the multiplicative theorem.** Skinner’s Theorem A is valid for p≥3, but the imported R21.6 ordinary-family membership theorem is stated for p≥5. The p=3 family, good-ordinary approximants and compatible principal-ideal congruences are an additional supplier obligation, not an application of that p≥5 statement.
8. **Nontrivial tame components of the signed theorem.** Fouquet–Wan’s pointwise theorem in this packet supplies KMC^{η=1}. Its trivial-nebentypus range does not automatically include f⊗η for nontrivial η. LLZ Theorem 6.5 further restricts i=2 to η=1. The proven signed application is restricted accordingly; any wider component theorem needs its own compatible KMC input.
9. **Integral Pollack-period normalization.** LLZ Proposition 5.10/Corollary 5.11 give units in Λ_E and equality of Coleman kernels. Restriction to the integral domain transports the actual image lattices and zeta quotients, but identification with a separately Néron-normalized Pollack L-function must still track the period scalar. The node claims that final integral analytic equality only under the unit comparison.

The maintainer should route the thirteen requests to their recorded owners and decide the L1m and imaginary-quadratic restructuring proposals. No new roadmap or cross-roadmap edit was made by this review.

## Validation

- Packet checker against the pinned declaration index: 0 errors, 0 warnings; 46 nodes, 90 API entries, 49 tests, 20 planets, 9 gaps, 13 requests.
- Shared sourceIssues and sourceVersions validators: pass for all six findings and twelve PDF versions.
- Suggested Lean: lean-check completed successfully at the pinned Mathlib/Tau Ceti build; eight existing declaration-uses-sorry warnings, no errors and no other warnings. No new admissions were added. The new matrix and nonsquare examples are proved by finite computation.
- Numerical audit: independent Weierstrass discriminants, point counts and eta-product coefficients; only diagnostic conclusions are drawn where a complete arithmetic certificate is absent.
- Intake path/content validation and git diff whitespace validation: pass for all five deliverables.

The reader was regenerated from the corrected node fields, including all hypotheses, proof sketches, APIs, tests, locators, requests and gaps. There are no source excerpts, local private paths or claims of completed formalization.
