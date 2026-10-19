# Independent package review: ColemanPowerSeries

Verdict: **accepted with the fixes in this submission**.

Reviewer: Codex, session `codex-sSPeB5`, job `REV-PKG-ColemanPowerSeries`, issue #10894, 19 October 2026. I did not author `PKG-ColemanPowerSeries`. This reviews the package, not its historical packets, and does not claim formal proofs of its targets.

## Scope and changes

The five layers contain 483 numbered targets: 236, 124, 45, 47 and 31 respectively. I walked their statements, inherited hypotheses, prerequisite links and proof outlines. The 89 definitions consist of 88 definition-headed subsections and the independently constructed coefficient averaging operator in §1.92. All have API outlines and at least three Checks. Seven definitions have real bodies in Suggested.lean; the other 82 are named in its closing comment.

The shape was compared with `content/tau-ceti/LocalFieldsRamification/README.md` and `content/tau-ceti/ProfiniteProPGroups/README.md`, the upstream guide, and the current ProfiniteArithmetic README and suggested file. The package retains its arithmetic carriers, source locators, layer examples and dependencies. Its compact suggested file states representative milestones; it does not construct the missing arithmetic theory.

Changes made here:

- Corrected six prerequisite links in §§0.166, 0.176, 0.192, 4.6, 4.7 and 4.8. Their continuous p-adic powers come from ProfiniteArithmetic §1.3, not the free pro-p group layer of ProfiniteProPGroups. Refreshed the immutable supplier-roadmap references to the current checkout commit identified below.
- Corrected the repeated grouped RJW locator to distinguish Propositions 10.10 and 10.12 from Lemma 10.11.
- Added discriminating witnesses to §§0.73, 0.156, 0.157, 1.96, 1.116, 2.31, 2.37, 2.39, 2.45, 4.4, 4.7, 4.12 and 4.29. These distinguish the actual subgroups, norm projector, boundary, Coleman maps, cyclotomic closure and native quotient from plausible trivial or incorrectly enlarged constructions.
- Added a native Lean example computing twice the linear coefficient of `(1−φ)Δ(2+T)` at p=3 as −1. This also fixes the second-moment sign used by the new arithmetic Checks.
- Protected the coordinate equivalence in §0.235 as inline mathematics so its scalar brackets do not render as a Markdown link.
- Replaced four references to previous findings or repair activity by mathematical explanations of the congruence ring, logarithmic kernel, compact coefficient fibers and closed augmentation image.

No target was removed during this review. Metadata is unchanged. No packet was edited.

## Sources

No locator in the delivered README was marked unverified. For the required sample I selected three targets independently in each layer, using a fixed random seed of 10894. The following are the 15 targets checked against the public texts. Page numbers are printed pages; RJW's PDF page is the printed page minus 99, counting from one.

| Target | Locator checked | Assessment |
| --- | --- | --- |
| 0.70, unit norm transitions | Rodrigues Jacinto–Williams (RJW), equation (10-1), p.166; Lemma 10.9 and Propositions 10.10 and 10.12, Lemma 10.11 and Theorem 10.13, pp.167–169 | Correct norm direction and unit tower. Continuity on the integral carrier is a deduction using the named local-field supplier. |
| 0.161, norm of the Teichmüller section | RJW §9, pp.161–163; Lemmas 12.2–12.3 and Proposition 12.5, pp.178–180 | Constant scalar norm is the pth power; a prime-field Teichmüller unit is consequently stationary. |
| 0.228, continuous coefficient-fixed action | Sharifi, Iwasawa Theory §5.4 opening, p.143, and Notation 5.4.10, p.146 | Correct context. Joint continuity is the package's coordinatewise finite-quotient argument, not a separately numbered theorem of the notes. |
| 1.9, coordinate surjectivity | RJW Lemma 10.8 and proof, p.167 (PDF 68) | Correct degree-p input. The integral coordinate construction is explicitly supplied in the roadmap. |
| 1.35, trace continuity | RJW Lemma 10.8, p.167; Proposition 10.12, pp.168–169 | The continuous finite coordinate inverse and the formula p times its zeroth coordinate give the stated deduction. |
| 1.98, closed arithmetic image | RJW Theorem 10.2, p.164, and Propositions 10.10 and 10.12, Lemma 10.11 and Theorem 10.13, pp.167–169 | Correct interpolation context. Closedness follows from compact source and Hausdorff target before surjectivity. |
| 2.1, logarithmic derivative | RJW Definition 12.8, p.180; Proposition 12.1, pp.177–178, and Remark 12.4, p.179 | The multiplicative coordinate contributes the factor 1+T. The package states the ring-general formal identity separately. |
| 2.13, cyclotomic unit series value | RJW passage between Lemma 10.3 and Proposition 10.4, p.165 | Correct geometric sum for positive a; invertibility requires p not dividing a. |
| 2.40, raw reciprocity sign | RJW Lemma 10.5, p.165; Definition 10.14 and Theorem 10.15, p.170; proof of Theorem 12.17, pp.184–185 | Raw composite gives the negative of the independently normalized numerator. The new p=3 second moment witnesses the sign. |
| 3.3, decay of substitution iterates | RJW Lemma 12.15, pp.183–184 | Requires zero constant coefficient; the source argument supplies coefficientwise decay. |
| 3.37, binomial derivative | RJW Definition 12.16 and Theorem 12.17, pp.184–185; Lemmas 12.2–12.3, pp.178–179 | The p-adic exponent derivative and interpolation conventions agree. |
| 3.43, Coleman image | RJW Theorem 12.17 and proof, pp.184–185 | The endpoint is the first cyclotomic moment; it is not the mass functional. |
| 4.17, plus algebra comparison | RJW proof of Theorem 12.23, pp.188–189 | The source uses the real quotient. The explicit averaging, identity e⁺ and regular-denominator comparison are additional proved steps in the package outline. |
| 4.23, real principal image | RJW Definition 11.8, p.176; Lemmas 12.20–12.22, pp.186–188; Theorem 12.23, pp.188–189 | The plus Tate component vanishes for odd p; the restricted Coleman map is onto the plus algebra. |
| 4.25, chosen-generator augmentation ideal | RJW Proposition 11.5, p.176; proof of Theorem 12.23, pp.188–189 | The closed principal-image and dense-Dirac argument is the package's explicit justification; it does not infer closedness from algebraic generation alone. |

The sampled source numbers and pages agree. I also corrected the repeated grouped locator that called results 10.10–10.12 all propositions: 10.11 is a lemma, while 10.10 and 10.12 are propositions. It was important to distinguish a printed theorem from the native-carrier, topology and finite-free refinements derived from it.

I also read Coleman's original journal page images: Theorem 4 and Corollary 5(i), p.98; Theorem 11 and Corollary 12(ii), p.102; Lemma 13 and equation (2), p.103; Proposition 14 and Theorems 15–16, pp.104–105; Corollary 17 and proof, pp.105–106. They confirm the coefficient-Frobenius correction, the positive interpolation twist, the inverse negative twist and the norm/evaluation direction. Sharifi §5.4, pp.143–147, and §6.1, pp.157–158, were checked for the unramified and semilocal settings. The source-convention appendix is mathematical commentary, not a source transcription or a sequential summary of a source.

Public copies used: [RJW](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), [Sharifi](https://math.ucla.edu/~sharifi/notes/iwasawa.pdf), and [Coleman's journal scan](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002095289). The RJW file has SHA-256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`. Sharifi's is `e5308be4c3d9ded6002cefb50df64b31f62b584b6ff68be7f21dc939f2508c26`. No source files or passages are included in the repository.

## Prerequisites and duplication

The pinned declarations were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. In particular:

- `Algebra.norm_norm` has the actual finite-free tower hypotheses. The chosen substitution scalar algebra must first be shown free of rank p.
- `mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt` supports the integral-generator argument after clearing a power of p; the package does not infer integral monogenicity just from field generation.
- `PowerSeries.eval₂Hom` requires a continuous coefficient map and `HasEval` in a complete Hausdorff linearly topologized receiving ring. Tau Ceti's `PowerSeries.aeval_subst` supplies the continuous algebra-homomorphism substitution comparison without imposing discrete coefficients.
- `AbstractMeasure.amiceTransformEquiv` at the pin is the ℤ_p-coefficient equivalence. The independent finite-free O-valued extension is an explicit §1.92 target, not an assumed generic pinned equivalence.
- `TauCeti.Algebra.normUnits` is the native units lift of the algebraic norm. Merely having that term available does not establish the intended rank or arithmetic norm comparison.

The reviewed AUDIT-24 entries in `data/library-coverage.json` were read for all five layers. Their old claims of absent generic finite-extension structures, pro-p powers and completed actions were not treated as current-library evidence.

The current read-only roadmaps were checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, including the newer roadmaps and Completed roadmaps. The current Tau Ceti library was checked at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches used chosen primitive roots and their orders, integer-ring comparisons, norm/trace hypotheses, pro-p powers, completed actions, substitution coordinates, logarithmic derivatives and actual cyclotomic closures, as well as names.

| Existing supplier | Checked disposition |
| --- | --- |
| LocalGaloisGroups Layer 0; current `NumberTheory/Cyclotomic/Irreducible.lean` and `LocalField/RootsOfUnity/Cyclotomic.lean` | Shifted cyclotomic constant/Eisenstein calculation, irreducibility and absolute degree were already removed by the package author. I confirmed those four deferrals and found no removal stubs. |
| Current `LocalField/FiniteExtension/{Basic,IntermediateField,Tower}.lean` | Generic structures and integer-ring equivalences are already supplied. Kept targets add chosen-root, residue, inclusion and topology coherence on this specific tower. |
| Current `LocalField/Norm/Basic.lean` | `coe_norm_integerRing`, `coe_trace_integerRing` and `continuous_normUnits` are inputs; the kept norm targets add chosen-basis specialization, scalar/root formulas and compatible tower maps. |
| ProfiniteArithmetic §1.3; current `ProP/PadicPow.lean` and `ProP/CompletedGroupAlgebraModule.lean` | Generic continuous powers and actions remain deferrals. The six corrected links now name this supplier. Kept targets verify the principal arithmetic carrier and identify its scalar and Galois actions. |
| Current `CompletedGroupAlgebra/{Basic,Map}.lean` | Native finite projections and continuous induced maps, including compact-coefficient surjectivity, are inputs. The new plus comparison identifies the specific quotient algebra and pseudomeasure. |
| PMIA Layers 1, 2, 4, 5 | Completed measures/algebras, independent ψ, inverse weighting, preparation and compact exactness are consumed. Coleman only compares them with determinant trace, arithmetic maps and this sequence. |
| IntegralIwasawaTheory Layer 0 | Actual global groups and finite cyclic generation are consumed; only their local embeddings, closures and inverse limits are planned here. |

The `CaraianiNewton.md` order was checked. ColemanPowerSeries and IntegralIwasawaTheory are not assigned tiers in its 94-roadmap list; no numerical lower-tier assertion is inferred for them. PMIA is Tier 1. The external arithmetic uses are restricted to the explicit foundational contracts: Dirichlet Layer 1's independent smoothing/numerator normalization and IntegralIwasawaTheory Layer 0's global generators. Their later Coleman-dependent theorems are not used. No upward edge to such a theorem, `FoundationsAndLibraryIntegration` or `UPSTREAM:` placeholder remains. No ownership move is introduced by this review.

The explicit internal dependency graph has 483 target vertices, no forward target edges and no cycles. The added arithmetic receiver targets precede their Layer 1 consumers. In particular §0.235 supplies a relative basis of length p, §0.236 supplies specialization and polynomial unit lifts, and §1.92 defines averaging independently before comparing it with trace. The norm/evaluation square and interpolation equivalence are conclusions, never receiver assumptions.

## Lean statement comparison

The following comparisons check mathematical hypotheses and conclusions, beyond successful elaboration.

| Suggested signature | README | Comparison |
| --- | --- | --- |
| `coordinates_injective`, `coordinates_surjective` | 1.78–1.79 | The selected action is Φ, not the ordinary rank-one self-action. Coefficients have the specified finite-free, complete unramified DVR and topology hypotheses. |
| `norm_Y` | 1.22–1.23, 1.82 | Both Y and T have base-valued norm `(−1)^(p−1)` times themselves, including p=2. |
| `trace_powers` | 1.46, 1.84 | For m=0 the result is p; for m=1 it is zero. The divided exponent occurs only in the divisible branch. |
| `norm_residue_frobenius` | 1.88 | Coefficient Frobenius is a supplied p-Frobenius lift, not coefficient-fixed Φ or q-Frobenius. |
| `norm_near_one_gain` | 1.89 | r≥1 is present. The conclusion is in the base ideal (p)^(r+1). |
| `iteration_precision` | 1.95 | a≥b is present; corrected iterates use Σ⁻¹N and agree modulo p^(b+1). |
| `normLimit_tendsto` | 1.116, 1.122 | Convergence is in the native units topology and the limit satisfies N=Σ. It does not claim convergence of the uncorrected norm for general coefficients. |
| `norm_root_product` | 1.86 | The left side is the coefficient extension of Φ(Nf), not Nf. Primitive roots, injective coefficient map, continuity and convergent translations are explicit. |
| `interpolation_existence` | 1.117 | Actual adjoined fields and integral closures, coherent inclusions, relative basis of length p, growing degrees, native evaluations, polynomial unit lifts and Frobenius compatibilities are exposed. Evaluation equals σ_n^n(u_n). |
| `logDeriv_mul` | 2.1–2.2 | The ring-general formal operator is YF′F⁻¹; no characteristic-zero kernel theorem is claimed here. |
| `psiFixedBoundary_range` | 3.12 | ψ is continuous and characterized on Y^m independently of trace. g is ψ-zero; the obstruction is its constant coefficient. |
| `principal_closure_eq_span` | 4.8 | Finite r, Hausdorff topological additive group and continuous ℤ_p action are explicit. The zero module and r=0 are allowed. |

All seven real-bodied definitions are light specializations on native carriers. There are no sorry-bodied data definitions, invented arithmetic carriers or auxiliary theory developments. The sign example uses an actual unit with value 2+T over ℤ_3; its unit hypothesis is satisfiable because 2 is a unit. Heavy README definitions are deliberately absent from declarations and retained by name in the closing comment.

## Adversarial mathematics pass

Every numbered target belongs to a row below. Ranges include their definition APIs and inherited hypotheses. A retained hypothesis in this table means it was checked and did not need changing; added witnesses are identified explicitly.

| Statements | Instances and failure modes checked | Result or change |
| --- | --- | --- |
| Conventions: levels, coefficients, valuations | n=0; p=2; f=1 and f=2; extended versus residue-normalized absolute value | Root order is p^(n+1); dyadic bottom is −1 with difference −2. Valuation of p is d_n, while the residue-normalized exponent includes f. q=1 and f=0 are outside the hypotheses. |
| Conventions: operators and twists | O=ℤ_p; residue field 𝔽_9; s=−1 at p=2 | Φ fixes coefficients, Σ is arithmetic p-Frobenius, M=Σ⁻¹N; interpolation and inverse use opposite twists. The signed root is norm compatible, not asserted square compatible. |
| Conventions: arithmetic range and plus quotient | odd p versus p=2; first moment versus mass; ramified and equal-characteristic coefficients | Odd-prime hypotheses remain on arithmetic exactness and real quotient. Unramified arithmetic coefficients are distinct from finite-flat scalar change. Plus averaging divides by 2 only for odd p. |
| 0.1–0.17 | First two dyadic levels; degree p transition; norm of ζ and ζ−1 | The relative polynomial has degree p; the norm sign is retained. |
| 0.18–0.43 | 1, π_n, a polynomial with zero constant residue; dyadic bottom degree one | Integral basis and residue map distinguish a unit from a uniformizer. Unit lifting requires nonzero constant residue. |
| 0.44–0.66 | Zero element, π_n, p; positive ideal powers; evaluation of 1 and T | Norm balls and ideal topologies agree on the actual integral closure; `HasEval` uses topological nilpotence. |
| 0.67–0.79 | Scalar norm c^p; signed root tuple; unsigned dyadic tuple | Norm equalizer uses consecutive native unit maps. Added a nonidentity signed-root member in 0.73 to reject the trivial group. |
| 0.80–0.85 | Identity on scalars and chosen roots; residue-one versus nonprincipal unit | Comparisons add carrier coherence to the generic supplier, not another local-field construction. |
| 0.86–0.112 | E=ℚ_p; unramified quadratic coefficients; p=2,n=0; one and two semilocal factors | f remains positive, σ is nontrivial when appropriate, signed root order has its stated dyadic exception, and norm is componentwise. No ramified-coefficient extension is claimed. |
| 0.113–0.150 | Basis vectors, coefficient scalars, ρ_n; Frobenius of a residue outside 𝔽_p | Every API specializes the specified maps; norm of a coefficient scalar is its pth power and σ fixes roots. |
| 0.151–0.155 | Norm on residues; base k=𝔽_p versus k=𝔽_9 | Base residues are stationary; coefficient residues follow inverse Frobenius along the tower. |
| 0.156–0.180 | Stationary −1 at p=3; nontrivial root tuple; p=2 principal factor; kˣ of order q−1 | Added nonconstant residue and proper-kernel tests. Full U∞ keeps its finite residue factor; only principal units receive the ℤ_p-module action. |
| 0.181–0.193 | One factor; factor exchange; coefficient Frobenius; cyclotomic action by 2 at p=5 | Shuffle, permutation and Frobenius are different actions. Corrected continuous-power supplier in 0.192. |
| 0.194–0.233 | Coordinates, residue sections and inverse maps; non-prime-field residue; finite quotient action | API formulas agree with the twisted splitting and joint continuity; no abstract action replaces the arithmetic one. |
| 0.234–0.236 | p=2,n=0; p=3,n=0; scalar, root and unit polynomial lifts | Relative basis length is p, not d_n or d_(n+1). The field-value comparison and matrix specialization precede interpolation. |
| 1.1–1.13 | Basis e_0 and e_(p−1); p=2 multiplication matrix; scalar T | Substitution action and matrix orientation agree; coefficient reconstruction inserts Φ. |
| 1.14–1.25 | Y, T, constants, trace of 1 and Y; p=2 determinant | N(Y)=sY and N(T)=sT. The norm is base-valued; fixed constants satisfy c^p=c over ℤ_p. |
| 1.26–1.44 | r=1 and r=0; ideal (p) before ramified extension; fixed and nonfixed unit | Gain requires r≥1. Congruences are in B, preventing loss of descent information in a ramified receiving ring. |
| 1.45–1.60 | m=0, m=1, p dividing m; all p root factors; Vandermonde determinant nonunit | τ=pψ; root sum/product is embedded by Φ. Only nonvanishing, not invertibility, is used for determinant cancellation. |
| 1.61–1.76 | Unit 1; polynomial finite-level lift; nonzero series with finitely many cyclotomic zeros | Norm evaluation specializes the relative multiplication matrix. Separation uses preparation and unbounded degrees; π_n does not tend to zero. |
| 1.77–1.96 | O=ℤ_p and quadratic unramified O; C(1+p); nonconstant fixed sY | Added C(1+p) as a nonmember of N=Σ. Independent coefficient ψ is built before trace comparison. |
| 1.97–1.102 | Empty candidate fiber versus a finite-level approximant; compact image | Nonemptiness uses previous approximations; closed image and nested fibers do not assume surjective unit-coordinate projections. |
| 1.103–1.124 | Twisted Teichmüller tower; σ=id; fixed sY and nonfixed C(1+p) | Positive interpolation twist and negative inverse twist retained. Added projector test fixing sY, excluding a constant-only projector. |
| 2.1–2.11 | F=1, F=Y; characteristic p unit 1+T^p; a=0 and a=1 in geometric sums | Formal identities are ring-general; the derivative-kernel result needs characteristic zero. Geometric-sum degeneracies do not become units. |
| 2.12–2.25 | a=1, a=−1, p dividing a, p=3,a=2; signed and p-adic exponents | Unit criterion is p not dividing a; negative parameter uses the cleared quotient. Added native coefficient sign example for 2+T. |
| 2.26–2.31 | Constant unit, Y, 2+T at p=3 | Determinant differentiation gives ψΔ=Δ on fixed units. Added nonzero boundary coefficient −1/2, rejecting the zero boundary. |
| 2.32–2.45 | c(1), c(2) at p=3; Teichmüller adjustment; two different G-action twists | Added raw second moment −1/2, normalized +1/2 and the same nonzero normalized moment on a principal tower. The action twists cancel exactly. |
| 3.1–3.14 | Constant unit; F=T; p=2; first nonzero term of degree r=2; constant g | Kernel among norm-fixed constants is μ_(p−1); leading coefficient gains p^r, not p. Zero constant term is required for the summable iterate solution. |
| 3.15–3.23 | n=0 precision; zero correction; p-adic divisibility in torsion-free B | Signed corrections and compact closed image give surjectivity from the residual calculation. No division inside characteristic p is used here. |
| 3.24–3.35 | Characteristic p; m prime to p and m divisible by p; Euler factor a=0; missing radial coefficient | Corrections run only along p-free indices; the remainder is pole-free. PMIA's independent fixed-error criterion removes it. Constant-unit kernel remains μ_(p−1), not μ_p. |
| 3.36–3.47 | Binomial exponent 0 and 1; δ_1; odd-prime Tate line; finite-flat zero algebra | First-moment endpoint, principal kernel and all four transported terms agree. Finite free coefficient tensors are finite products before completion. |
| 4.1–4.7 | Global root and conjugate; p=3 bottom; p=5 unit 1+ζ | Added an infinite-order member of C_0 at p=5 and a nontrivial real principal member. Real torsion −1 and principal torsion are not conflated. |
| 4.8–4.16 | r=0; zero module; one generator; p=5,a=2; p=3 bottom | Compact finite scalar image gives closed span. Added q(2)_0²=−(2+ζ+ζ⁻¹)≠1; the identity tower fails. Corrected power supplier for the principal closure argument. |
| 4.17–4.22 | e⁺ as source identity; odd p; trivial quotient; two direct factors | Native quotient map restricts to an algebra equivalence. A regular element in a direct product has regular components; localization does not invert a zero denominator. Nested compact coefficient fibers justify inverse cyclicity. |
| 4.23–4.31 | Plus Tate part; identity generator excluded by dense powers; compact principal image; actual quotient relation | Augmentation ideal is the closed principal image for the specified generator. Added equality-of-classes criterion using the entire closed subgroup. Final comparison keeps U∞,1⁺/C∞,1⁺ on the left. |
| Source-convention appendix | a=0,1,−1; k=1 Euler factor; zero preparation input; non-prime-field coefficients; missing identity root factor | Restrictions and cleared identities are consistent with the numbered targets. No additional convention change was necessary. |

## Validation and handoff

- `lean-check` on the final Suggested.lean: exit 0, 31 warnings, all `declaration uses sorry`. The file has 436 lines. Memory was checked before compilation; no Lean server or build of either read-only checkout was run.
- All three unchanged input packets passed `scripts/check_blueprint.py`: 0 errors and 0 warnings. Their historical gap/request records were not edited or mistaken for implemented mathematics.
- Definition inventory: 89 definitions covered by seven real declarations and 82 closing-comment names; at least three prose Checks per definition. The added sign test is among the elaborated examples.
- Internal target dependency audit: 483 unique explicit target anchors, no forward edges or cycles. Local Markdown file and anchor audit passed.
- `python3 research/blueprint/intake.py check-files` on the submission and unchanged metadata: 0 problems. `git diff --check` passed.

No unresolved package defect remains from this review. This is a completed review, not a checkpoint. The package is ready for the maintainer's upstream draft PR. Its later Lean implementation still has to prove the stated targets; successful elaboration with sorry establishes their type correctness only. No source downloads or scratch files are needed by the next worker.
