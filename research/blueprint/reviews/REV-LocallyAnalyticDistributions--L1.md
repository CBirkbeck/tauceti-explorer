# Independent review of LocallyAnalyticDistributions L1

**Accepted after corrections.** Issue #9249; reviewer Codex, session `codex-ZSqvgp`, 13 October 2026. The input was written by Codex session `codex-oIMBvc` for #9291; this reviewer did not participate in that work. The original provenance is preserved.

The pass remains complete, with L1 planned and implementation unchecked. Its 19 nodes comprise one definition, five constructions, four comparisons and nine theorems. This review corrects ten and verifies nine; it adds no nodes and removes no baseline citations. The six constructors/definitions now have 41 API items and 25 discriminating tests, up from 27 and 24. Five new planets together with the parent’s Amice planet give six. Two gaps and one precise L0 request remain visible.

## Evidence and sources

I read every node’s statement, hypotheses, source match, proof, direct inputs, acceptance examples and API/test contract, the full reader and compact Lean file, the original handoff, the parent’s 25 L1 imports and relevant L0 statements, the PMIA L2 suppliers, the L1 atlas targets and consumer edges, the reviewed library audit and accepted RS-16 ownership decision. The current read-only AdicSpaces, ProfiniteArithmetic and OperatorTheory roadmap material and current Tau Ceti sources were checked for overlapping carriers and results. OperatorTheory is a family of real/complex Hilbert-space roadmaps; it supplies no p-adic compact-type strong dual. AdicSpaces retains general weighted restricted-series/Tate geometry. PMIA retains bounded Amice, weighting, phi/psi, unit inversion and the Mahler derivation. No owner or tier is changed.

All six public primary PDFs were retrieved afresh and match the packet’s SHA-256 hashes. The passages read were:

- [Colmez, *Fonctions d’une variable p-adique*](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf): §§I.4.1–I.4.3, pp. 13–16; §I.6, pp. 27–28; §§II.1–II.2, pp. 29–30; §§II.4.1–II.4.6, pp. 34–37. The key locators are Theorem I.4.7/Corollary I.4.8, Theorem II.2.2, Proposition II.4.1 and Lemma II.4.2 with its proof. Proposition II.4.3 is on p. 37 and concerns bounded/growth compatibility, while the analytic convolution proof crosses pp. 36–37.
- [Rodrigues Jacinto–Williams, arXiv:2309.15692v2](https://arxiv.org/pdf/2309.15692v2): §§3.7–3.8, pp. 23–26, especially Theorem 3.43 and Remark 3.44, p. 25. The bounded inclusion and unbounded transform agree with the planned distinction.
- [Schneider–Teitelbaum, *p-adic Fourier theory*](https://arxiv.org/pdf/math/0102012v1): §1, pp. 3–6, including Lemmas 1.1–1.2 and Proposition 1.4. This supports the distribution/Fréchet and Fourier context without replacing L0.
- [Schneider–Teitelbaum, *Locally analytic distributions and p-adic representation theory*](https://arxiv.org/pdf/math/9912073v1): §§1–2 through Lemma 2.1, pp. 1–6; Theorem 1.1 and Proposition 1.2, p. 3, and Corollary 1.4, p. 4. Their spherical-completeness hypothesis holds for the standing finite extensions of Q_p. Exact duality and reflexivity are imported from L0, not attributed to a real/complex locally convex class.
- [Kohlhaase, *The cohomology of locally analytic representations*](https://esaga.net/f/jan.kohlhaase/Kohlhaase_Locally_Analytic_Cohomology.pdf): §4, pp. 19–22, especially Proposition 4.2 and Corollary 4.3 with proofs. The finite-K, Z_p specialization uses its bounded-total-set obstruction and strict finite-conductor topology without the general-group completed coefficient-extension reduction.
- [Colmez–Nizioł, *The C_st-conjecture*](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf): Appendix A, pp. 58–59, especially Remark A.6, p. 59. The function-side derivative and dual logarithm quotient are nonsplit in the stated finite-extension setting.

No source error is alleged; `sourceIssues` remains empty. No restricted textbook or source excerpt was used. The primary papers’ general functional-analysis references remain supplier-side prerequisites, rather than claimed fresh book reads.

## Corrections and node verdicts

The principal dependency correction removes `logarithm-apparent-poles` as an input to `log-local-cancellation`, which itself supplies that inherited target. The source identity `amice-derivative` gives the guaranteed global case directly. Analytic affine recentering and finite coefficient descent are now explicit direct inputs. The combined parent/part L1 graph is acyclic, including the explicit supplier links that the packet-only checker does not inspect.

API additions expose coefficient extensionality and cofinal Gauss topology; inverse pairing linearity; affine identity/composition; primitive coefficients/linearity; unit reciprocal evaluation, stage bound, transpose evaluation/linearity and unique supported division; and ball normalization/uniqueness, same-centre restriction and the stage norm bound. The stage bound uses original norm radius p^(-h) and smaller radius p^(-(h+1)); fixed representatives are explicit. It gives no compatibility across h and no continuous global section.

Finite tensor topology is specified by a finite K-basis. The negative-moment root exponent uses b’s residue class modulo p^m. One test’s unsupported `example` kind becomes `computation`, and a new polynomial sequence distinguishes coefficientwise convergence from Gauss convergence. The source pagination and every contract change are synchronized with the reader. Two actual coefficient proofs were added to the compact suggested file. All fifteen baseline records now record independent statement reads; the checks and omission inventory are updated.

The following suffixes complete `LocallyAnalyticDistributions:L1/`.

| Node | Verdict | Reason |
| --- | --- | --- |
| `open-disc-frechet-carrier` | corrected | Added native coefficient extensionality and the cofinal seminorm/truncation API. Reclassified the geometric test and added a sequence separating Gauss from coefficient topology; the inverse-limit proof uses L0 Banach discs. |
| `inverse-amice-stage-pairing` | corrected | Factorial-normalized test coefficients tend to zero, while Banach dual values need only be bounded. The strict interior valuation radius supplies boundedness and the converse uses a finer stage. Added the continuous-linear API law. |
| `bounded-inclusion-topology` | verified | The norm-decreasing analytic-test inclusion gives continuity; native bounded-transform injectivity and the PMIA inverse identify the bounded image. Dirac density and the unbounded logarithm prove the image is dense and nonclosed. |
| `analytic-affine-substitution` | corrected | The strict intermediate radius makes the nonzero-constant substitution converge. Added identity and correctly ordered composition laws and widened the character-twist locator to cover its discussion. |
| `finite-coefficient-descent` | corrected | Finite K-basis bounds prove the stage, dual and Gauss comparisons; Galois invariants descend coefficientwise. Specified the finite-product topology on the algebraic tensor explicitly. |
| `derivative-gauss-control` | verified | Integral derivative factors and binomial coefficients give the stated Gauss bounds. The zero constant permits native substitution for dilation; the prime binomial estimate includes p=2. |
| `normalized-series-primitive` | corrected | The reciprocal-integer bound and a larger input radius prove restrictedness and continuity. Added coefficient normalization and linearity contracts; two native coefficient examples elaborate with actual proofs. |
| `hasse-stage-estimate` | verified | In normalized disc coordinates Hasse derivatives are bounded by coefficient tails, which also tend to zero. Transpose estimates respect the positive derivative convention. |
| `convolution-banach-control` | corrected | Colmez §II.4.6 proves intermediate analyticity on pp. 36–37 and the stage product bound. Proposition II.4.3 is on p. 37, rather than p. 36; corrected the locator and distinguished its bounded/growth compatibility role. |
| `operator-stage-control` | verified | Resolved masks and fixed analytic multipliers satisfy Banach estimates; unit affine pullbacks are isometries. The masked inverse dilation genuinely shifts the input seminorm from h to h+1. |
| `analytic-unit-inverse` | corrected | The geometric reciprocal series is analytic on every unit residue disc and zero on all nonunits. Added evaluation, norm, transpose-evaluation/linearity and unique supported-solution API laws; the PMIA bounded comparison remains an import. |
| `coordinate-division-ambiguity` | verified | A normalized primitive of F/(1+T) gives coordinate surjectivity, while native derivative extensionality gives precisely Kδ_0 ambiguity. The supported inverse does not assume the target it supplies. |
| `local-ball-primitive-map` | corrected | Smaller-ball coefficient integration is valid with its coordinate factor. Added centre normalization/uniqueness, same-centre restriction functoriality and the finer-stage linear norm bound; no global compatibility is inferred. |
| `locally-constant-topology-input` | verified | The induced LC topology and strict duality are mathematical targets conditional on the explicit L0 request. The packet does not claim that its existing compact-type statement alone supplies the kernel-limit comparison. |
| `bounded-total-obstruction` | verified | The finite-K Mahler basis makes LA_0’s bounded unit ball total. Finite-level boundedness in LC then rules out every continuous surjection and hence a derivative section; no general completed coefficient extension is needed. |
| `dual-log-exact-sequence` | verified | Strict compact-type duality identifies the closed logarithm range and quotient; reflexive transpose transfers a hypothetical splitting to the excluded LC projection. The L0 dependency remains explicit. |
| `torsion-log-domain` | verified | Logarithm coefficients have subexponential reciprocal growth, p-power roots lie in 1+the maximal ideal, and characteristic zero kills their logarithms. Convergent affine recentering gives derivative ξ^(-1) at each torsion zero. |
| `log-local-cancellation` | corrected | Removed the dependency on the downstream inherited apparent-poles target, which closed a supplier cycle. Added explicit affine recentering and finite descent. Local unit inversion gives the iff criterion; the guaranteed global case follows directly from amice-derivative. |
| `negative-moment-independence` | corrected | Specified b∈Z_p and its residue-class root exponent. Repeated coordinate division has polynomial-in-log ambiguity; root orthogonality kills it precisely off the zero residue. Nonunit balls avoiding zero remain admitted. |

## All baseline citations confirmed

All fifteen entries were read with their enclosing hypotheses at Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`, which is also the shared build’s Mathlib HEAD. No Tau Ceti library declaration is cited by this part. A newly scanned full pinned Mathlib index was used for the checker; existence alone was not used to establish adequacy.

| Module under Mathlib | Declarations and applicability |
| --- | --- |
| `RingTheory.PowerSeries.Restricted` | `PowerSeries.IsRestricted` and `PowerSeries.isRestricted_iff'`: normed-ring coefficient decay in the radius-weighted sequence; finite K satisfies the context. |
| `RingTheory.PowerSeries.GaussNorm` | `PowerSeries.gaussNorm` and `PowerSeries.HasGaussNorm`: conditional real supremum and the separate boundedness condition. Restrictedness provides the bound before any Gauss inequality is applied. |
| `RingTheory.PowerSeries.Derivative` | `PowerSeries.derivative`, `PowerSeries.coeff_derivative`, `PowerSeries.derivative.ext`: formal derivation and shifted coefficients; extensionality needs a torsion-free commutative ring, satisfied in characteristic zero. |
| `RingTheory.PowerSeries.Log` | `PowerSeries.log`, `PowerSeries.derivative_log_mul_one_add_X`: native formal logarithm and derivative identity over a commutative Q-algebra. Analytic convergence is a new target, not supplied by this formal identity. |
| `RingTheory.PowerSeries.Basic` | `PowerSeries.mk`: actual native coefficient constructor used by the light primitive formula. |
| `NumberTheory.Padics.Measure.AmiceTransform` | `AbstractMeasure.amiceTransform`, `AbstractMeasure.coeff_amiceTransform`, `AbstractMeasure.injective_amiceTransform`: the bounded continuous-test measure transform and its Mahler values; injectivity’s complete ultrametric coefficient-algebra and bounded scalar-action hypotheses apply to normalized finite K. These do not construct the locally analytic strong dual. |
| `NumberTheory.Padics.PadicNumbers` | `Padic.norm_int_le_one`: integer coefficient bound in Q_p, inherited by a finite extension with the specified extending norm. |
| `Topology.Algebra.InfiniteSum.Nonarchimedean` | `NonarchimedeanGroup.multipliable_of_tendsto_cofinite_one`: complete nonarchimedean convergence criterion. Its generated additive counterpart is resolved directly in the suggested file; the source index records the multiplicative declaration. |

## Coverage, closure and remaining supplier input

The target-coverage map covers all five L1 target groups: unbounded Amice/bounded agreement, the operation toolbox, support-sensitive division/negative moments, analytic primitives/nonsplitting, and torsion logarithm/apparent poles. Every needed construction or key estimate has a node or an inherited supplier. Routine coefficient arguments stay in proof sketches. No definition already implemented by the reviewed audit is assigned a competing node: native coefficients/derivation/logarithm and the bounded PMIA theory are reused. Coleman continuation, C^r spaces and regulators remain with their owners.

The two gaps concern implementation and a precisely named supplier interface. In particular, the existing L0 compact-type dual statement alone does not identify the subspace topology of LC with its strict finite-level limit. The request explicitly asks for that comparison, bounded-set confinement, strict/open quotient differentiation and strict strong-dual exactness/reflexive transpose. The LC topology, bounded-total obstruction and logarithm quotient depend on it. No unresolved mathematical contradiction or hidden hypothesis remains, but no implementation-closed claim is made.

## Validation

- `check_blueprint.py` with the freshly scanned pinned index: **0 errors, 0 warnings**, 19 nodes, 41 API items, 25 tests, 15 baseline declarations.
- `check_sorry_data.py`: passes; two light definitions have actual bodies and there is no placeholder data.
- `lean-check`: exit **0**, 137 lines, eight scalar milestones and eight examples, with **13 intended `sorry` warnings and no others**. The summability example and both added coefficient examples have actual proofs. Signature elaboration does not establish the proposed global mathematics.
- Combined L1 prerequisites and parent/part supplier links: **44 nodes, 87 edges, acyclic**; no repeated ids; six planets.
- Independent exact-arithmetic checks: **7,074 assertions** over p=2,3,5. These comprise 1,200 reciprocal bounds; 90 each of primitive coefficient identities, radius bounds, affine composition and affine identity; 630 unit reciprocal coefficient checks; 24 each of sparse primitive failures and logarithm growth; 2,388 each of negative Dirac moment averages and off-zero constant-ambiguity cancellation; and 60 Gauss topology counterexample values. Root averages are computed by traces in Q[X]/(X^N−1), without approximate roots. These finite tests do not replace infinite convergence or topology proofs. The earlier 11,958-check record remains attributed to the planning pass.
- Packet/reader synchronization and whitespace checks pass. Files are restricted to this issue’s deliverables and its handoff.

## Questions for the orchestrator

No decision blocks acceptance. Preserve and route the existing exact L0 topology request before claiming implementation closure or replacing the README-only global signatures. The accepted part is suitable for packaging with this dependency stated explicitly; this review does not fulfill that request or change upstream ownership.
