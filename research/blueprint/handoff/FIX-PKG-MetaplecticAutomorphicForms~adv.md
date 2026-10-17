# FIX-PKG-MetaplecticAutomorphicForms~adv — handoff

Job `FIX-PKG-MetaplecticAutomorphicForms~adv`, issue #10224. Worker: Claude (session claude-cau12r), 2026-10-17. Input: the adversarial review `research/blueprint/reviews/REV-PKG-MetaplecticAutomorphicForms~adv.md` (findings B1–B6). Deliverables changed: the package `README.md` and `Suggested.lean`, `review.json` and this note.

## Finding → change

| Finding | Change |
| --- | --- |
| **B1** carriers missing | Every carrier the review lists is now a named README target or a cited upstream construction. Schwartz–Bruhat spaces, self-dual measures and Fourier inversion (0.14–0.18, 4.5) are AutomorphicLFunctionsAndLocalFactors AL.0. 1.3 states how the oscillator normalizer is built on the irreducible model. 2.4b constructs the character λ₂ from the μ₂-valued normalized Rao cocycle and proves its uniqueness (Sp(W) is perfect), with new API (`lambdaTwo`, `lambdaTwo_unique`, `metaplecticCover_center`, `metaplecticCover_nonsplit`, `metaplecticCover_complex`) and Checks (W=0, the SO(2) preimage for W=ℝ², z⁴ as a negative control). Hermitian carriers (3.3) are GeometryOfNumbersAndQuadraticArithmetic §2.9's `SignedHermitianSpace`, adjoint and trace transfer; the quaternionic carrier is defined in 3.23 over Mathlib's `QuaternionAlgebra`. The new **8.28a `BFHDatum`** bundles N, m, M, k, the newform, its Fricke transform, the K-type σ, v and T, with the level conditions 8M∣N, N∣m, 4m∣N² and three Checks; it replaces 17 repeated hypothesis paragraphs, and the 12 "signature gap" notes are gone. Layer 7's standing hypotheses are stated once at the head of the layer, replacing 46 copies. |
| **B2** ownership and order | Every supplier is now a TauCetiRoadmap roadmap, either on main or an open pull request (AA #792, AF #1037, AL #924, AS #925, GL2 #931, SR #785, GN #851, Endoscopic #999), cited by upstream section; about 300 old atlas-stage tokens were remapped by content. The ML.4 loop is broken. 3.18 takes the tempered unitary packets of EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.3 (a conditional supplier). 3.40 takes quaternionic Jacquet–Langlands from GL2 R17.1.1. 3.41 states the Sp₆ local Langlands parametrization as an explicit hypothesis, since no TauCetiRoadmap roadmap constructs it. The GL₂ side of the loop no longer exists: GL2 #931 owns its own SL₂ metaplectic input (R17.4.13a) and cites nothing here. QM, LV, GS and GS3 are no longer suppliers (see "Moves" below). MetaplecticAutomorphicForms is still not among the 94 CaraianiNewton roadmaps; assigning it a tier is the manager's call, but every roadmap it cites is already upstream or an open upstream PR. |
| **B3** later-layer prerequisites | The seven listed targets now come after their prerequisites: old 1.5, 1.6, 1.7 → 2.4a, 2.4b, 2.4c (after the Leray cocycle 2.4); old 2.9, 2.10 → 3.3a, 3.3b (after 3.3); 6.21 → 5.14a (before 5.15); 7.50, 7.51 → 8.86, 8.87. A scripted check also found 19 forward edges *within* layers, which a stable DFS order removes: 3.29 → 3.32a, 7.30 → 7.28a, 7.47 → 7.31a, 7.41–7.43 → 7.32a–7.32c, 8.75 → 8.20a, 8.26 → 8.21a, 8.27, 8.28 → 8.22a, 8.22b, 8.81 → 8.79a. Every *Needs:* id now names an earlier target, and the scripted check reports none forward or undefined. The layer titles of Layers 1 and 2 changed to match. |
| **B4** normalization propagation | Resolved by derivation from the source (BFH90 pp.580–583, read from the GDZ scan). The prefactor (2mN³)⁻¹ of 8.62 is N⁻³ from the coefficient normalization (8.20) times 1/(2m) from the real Gaussian Fourier integral ∫_{ℝ²}e(−mZ⁻¹[W]−RᵀW)dW=√(−det Z)/(2m)·e(Z[R]/(4m)) (BFH p.581). I rederived this as a Gaussian with matrix 2πimZ⁻¹; the principal root is the holomorphic branch on H₂ in degree two, because det(Z/i) avoids (−∞,0]. The theta pairing of 8.21 does not enter 8.62–8.69. It enters only the projection 8.22a (old 8.27), which already divides by √det Y/(4a), and the expansion 8.23 is read off from Fourier coefficients and does not depend on the norm. The "normalization gap" paragraph is replaced by this derivation, with witnesses 1/2 (m=1) and 1/4 (m=2) at Z=iI₂, R=0 (README Check and Lean examples). The corrected norm itself (√det Y/(4a), not BFH's printed /(2a)) was rechecked, with the genus-one analogue √(v/(4m)). |
| **B5** analytic continuation inputs | The 23 "source gap" notes are now *Proof input.* paragraphs that state the needed statement and where it comes from, without process language. Inputs that upstream PRs now supply are cited. The confluent-function facts of 8.35–8.37 (BFH's Gradshteyn–Ryzhik 3.384.9 and 9.237) are AutomorphicSpectralTheory §0.26: the Euler tail integral, `whittaker_w_order_symm` and `decayingNormalization`. Schur's lemma for 1.1 is SmoothRepresentations §SR.3a.1, and the height bounds for 5.2 are AdelicAlgebraicGroups §§3.4–3.5. The rest are now parts of the targets themselves: the ramified P(s,0,r) denominators in 8.79a (BFH p.589 omits them), the chart-boundary transition in 8.43, BFH Prop. 3.15's construction in 8.50, the rank-two adelic similitude extension in 8.53, and Maass §11 primitive completion in 8.58. |
| **B6** Lean checks and docstrings | `Suggested.lean` is rewritten to the 2026-10-12 shape: 2,662 → about 595 lines, with no data definition that has a `sorry` body. The old file had ~20 sorry'd data definitions, which `scripts/check_sorry_data.py` rejects, and many wrappers that restated their own definitions. What remains: real-bodied light definitions (`bilinearFactorSet` with its cocycle proved, `extensionIsometry` and `extensionIsometryAction` with proofs, `centralCharacter`, `schroedinger`, `tensorSymplecticForm`, `orthogonalSymplecticEmbedding`, `firstOccurrence`, the finite Weil operators, the plus-space operators, the Fourier-index shift and discriminant, `SiegelSpace`, `genusTwoTheta`); the layer milestones statable at the pins; and discriminating examples, including every negative control and convention witness the review asked for. Every docstring states the mathematics. Every Lean name appears in the README (scripted check). |

## Upstream content now consumed rather than restated

- GL2AutomorphicRepresentationsAndTransfer R17.4.13a: the SL₂ case of 2.4b, 4.2, 4.4, 4.5, 5.1, 5.4 and 5.16 (stated in Scope as a specialization; GL2 owns its integral).
- GeometryOfNumbersAndQuadraticArithmetic §4.3: the holomorphic theta multiplier, nonvanishing of θ and `halfIntegralKloosterman`. 7.1 keeps only the unitary normalization J=j|cz+d|^(−1/2). 7.12 identifies K_{1/2} with GN's odd-ℓ sum; the two index orders agree because K_{1/2} is symmetric under a↦ā. §2.9 supplies the Hermitian carriers and §3.4 the lattice theta series (boundary).
- AutomorphicFormsOnReductiveGroups §6.4: GSp₄⁺(ℝ) in 8.11.
- AutomorphicSpectralTheory §§0.25–0.28, 1.16: Bessel, Whittaker and Kloosterman functions and the weight-k Laplacian, replacing the QM citations.

## Moves (notions now owned or hypothesized here; record for the other roadmaps)

- `LV.3/lagrangian-symplectic-basis` → new **0.9a** (symplectic bases over any field; Lagrangian complements, canonical when char≠2; Cannas da Silva Thm 1.1 and Prop. 8.2). MordellLawrenceVenkatesh should import 0.9a.
- `QM.1/2/3` → GN §4.3 and AS §§0.25, 1.16. QSeriesPartitionsAndMockModularForms can import the same.
- `ML.4` → hypotheses of 3.18 (Endoscopic §§11.2–11.3) and 3.41 (Sp₆ LLC); 3.40 uses GL2 R17.1.1. ModularityAndLanglandsExtensions consumes Layer 3 and, once it constructs the Sp₆ parametrization, instantiates 3.41.
- `GS.5`, `GS3` → 4.8 restated as a conditional programme with hypotheses (i)–(iii) (factorization gerbe, metaplectic geometric Satake, global excursion operators); a function-field roadmap that builds them instantiates 4.8.

## Adversarial pass on the touched statements

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| 0.9a symplectic basis / Lagrangian complement | dim 0; dim 1; 𝔽₂ alternating ad+bc vs symmetric ac+bd; canonical complement in char 2 | basis exists over every field for alternating ω; dim 1 impossible; ac+bd not covered; ½ needed only for the canonical complement | char≠2 restricted to the canonical complement; isotropy identity of the graph stated and checked |
| 2.4b λ₂ and Mp(W) | W=0; W=ℝ²; F=ℂ; z⁴ | μ₂; connected SO(2) preimage, nonsplit; split over ℂ; z⁴ gives μ₄ | Checks replaced by these witnesses; uniqueness via perfectness of Sp(W) |
| 3.18 / 3.40 / 3.41 | supplier conditions | LLC inputs explicit; 3.41 first sentence independent of the LLC hypothesis | hypotheses stated |
| 4.8 programme | N=1; N∤q−1 | reduces to Laf18 Théorème 0.1 (checked on arXiv v10); empty | Checks added |
| 7.1 J=j\|cz+d\|^(−1/2) | γ=1; γ=−I; \|J\| | 1; 1; \|j\|=\|cz+d\|^(1/2) gives \|J\|=1 | statement recast on GN's j |
| 7.12 K_{1/2} vs GN | (0,0;4); (1,0;4) vs (0,1;4); even ℓ | 1+i; both 1+i (symmetry under a↦ā); even ℓ is the conjugate of K_{1/2}(−m,−n;c) | comparison theorem and Check added |
| 8.28a BFHDatum | (M,N,m,k)=(1,8,16,12), f=Δ; N=8, m=24; k=3 | datum; 4m∤N²; no odd-weight newform with trivial character | new target |
| 8.62 Gaussian integral | Z=iI₂, R=0, m=1,2; Z=iI₂, m=1, R≠0 | 1/2, 1/4; (1/2)e^{−π\|R\|²/2} both ways | derivation replaces the gap note |
| 8.24 theta inversion | Z=iI₂, a=1, W=0, ν=0; Fourier matrix squared; W=(1,0) | θ(2i)² = ½θ(i/2)² via θ(i/2)=√2θ(2i); ν↦−ν; factor e^{2π} | Checks and Lean example added |
| 8.79a ramified regularity | p∣N factors | computation is part of the target | proof route stated |
| Lean `bilinearFactorSet`, `halfForm_center` | B=0 on ℤ; upper-triangular B on ℤ²; char 2 | center too big without nondegeneracy; commutator 1; excluded by `Invertible 2` | cocycle proved; negative controls as examples |
| Lean `extensionIsometryAction` | diag(2,1) and swap on ℚ² | f*e sends (1,1) to (1,2), e*f to (2,1) | direction example |
| Lean `schroedinger_mul`, `_isUnitary`, `heisenberg_haar` | expansion of both phases; non-square-integrable φ; B=0 | identity holds with ½ (2≠0 hypothesis); both integrals 0; product translation | statements kept with hypotheses |
| Lean `tensorSymplecticForm_isAlt`, `dualPair_kernel` | all characteristics; ω⊗ω on ℚ²; V=0 | alternating for symmetric⊗alternating; ω⊗ω gives 2 on e₀⊗e₁−e₁⊗e₀; kernel is everything when a factor is 0 | nontriviality hypotheses kept; example value corrected to 2 |
| Lean `finiteWeil_SOperator_sq` | D trivial; zero pairing on nontrivial D | c²; fails (S²φ = c²Σφ) | nondegeneracy and symmetry hypotheses |
| Lean Fourier-index classification | a=0; a=2, R=±e₀ | fails; congruence needed | negative-control examples |

## Checks run

- `lean-check research/blueprint/packages/MetaplecticAutomorphicForms/Suggested.lean`: exits 0 with only `sorry` warnings. A `run_cmd` audit on a scratch copy finds no `sorry` in any statement type or definition body, and `scripts/check_sorry_data.py` passes.
- `python3 research/blueprint/intake.py check-files` on both package files: 0 problems.
- Scripted README checks: 263 subsections with no duplicate ids; every *Needs:* id is defined earlier; every definition has at least three Checks; every Lean declaration name occurs in the README.
- Supplier citations: a Sonnet agent mapped all 335 old citation sites to upstream sections by content, and I applied and spot-checked the mapping. A second Sonnet agent swept all targets for duplicates against the upstream READMEs; its main hits, which I verified by reading, were GN §4.3, AF §6.4 and GL2 R17.4.13a. A third Sonnet agent cross-checked the final diff (see the end of this note).

## What remains (not blockers for this package)

- The *Proof input.* paragraphs name original proofs that I did not read: Fay 1977 (multiplier resolvent), Baruch–Mao Thm 1.2, Kohnen 1985 Prop. 5, MVW chapitre 2, Maass §11 and p.160, JPSS §8.3.3, and the 2011 YZZ draft (§§2.2–2.4). They are stated as inputs of the targets that use them, and none is claimed as proved.
- The tier of MetaplecticAutomorphicForms in the CaraianiNewton order is for the manager to assign.
