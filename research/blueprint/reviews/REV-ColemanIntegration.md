# REV-ColemanIntegration

Accepted after corrections as a completed **target-level planning pass** for L0–L3. Codex, session `codex-RHAkSv`, 5 October 2026; issue [#373](https://github.com/CBirkbeck/tauceti-explorer/issues/373). This session did not author BP-ColemanIntegration or its follow-ups. The latest input is the `codex-grgRy0` end-comparison pass in PR #6201 (BP issue #698). Acceptance follows the review issue's explicit rule permitting honest open gaps; it does not claim formalization or closed stages.

All **177 nodes** have individual verdicts in `review.checked`: **126 verified, 51 corrected, zero added, zero unverifiable**. Their implementation status remains unchecked. The inventory is 19 definitions, 11 constructions, 98 lemmas, 39 theorems and 10 comparisons. There are **257 API entries, 152 test records** (134 on definitions/constructions, at least three each), **22 planets**, **124 baseline declarations**, **23 supplier requests** and **seven gaps**. L0 remains `source_decomposed`; L1–L3 remain `planned`; no stage is closed. The checker counts all four as planned coverage. Every target is represented by a node or an explicitly scoped remaining comparison/input, rather than silently claimed proved.

The review read WORKERS, both protocols, UPSTREAM_GUIDE, BROWSER_AGENTS, the roadmap and reader, the reviewed L0–L3 library audit, ownership/overlap records and upstream density examples. All nodes were read in full, including hypotheses, proof steps, direct prerequisites, API, tests and acceptance conditions. Sixteen distinct foreign node contracts were read from their supplier packets. This verifies the imported statement needed here, not every supplier's proof. General analytic spaces, annuli, distributions, rigid cohomology, complex polylogarithms and regulator carriers retain their owners; no foundational supplier was replanned.

The allowed review deliverables exclude the reader. The packet and suggested file are corrected; reader synchronization is an explicit orchestrator action below.

## Baseline and closure

Every one of the **123 original declarations** was located under its actual name at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, and its statement and required hypotheses were read. None was removed. One native definition was added, **`Metric.eball`**, from `Mathlib/Topology/EMetricSpace/Defs.lean`: the ENNReal-radius domain of `HasFPowerSeriesOnBall`. `Metric.ball` still supplies ordinary real-radius neighborhoods; the disc-analytic node's mistaken use of it for an ENNReal radius is corrected.

Existence of a nearby library theorem was never treated as the whole mathematical input. In particular:

- Generic power-series change-of-origin bounds do not give the whole ultrametric disc. The corrected node gives the binomial coefficient estimate for every smaller radius, uses the strong triangle inequality to identify centers, and justifies the double-sum interchange. The elementary whole-disc uniqueness argument now names this prerequisite directly.
- `spectralNorm` supplies the norm on the algebraic closure; it supplies neither the finite-extension value group nor finiteness of the residue field. A precise P7 request now states these facts and the passage to the completed algebraic closure.
- `PowerSeries.IsRestricted`, `AdicCompletion` and `Localization.Away` provide native carriers. They are not cited as a theorem that every completed-localization element becomes a restricted series under `s=t/(1-t)`: `t=s/(1+s)` disproves that claim. Restrictedness is proved for the particular globally glued integral modified polylogarithm, using the requested affinoid/Tate-algebra compatibility.
- The global declaration `gaussSum_mulShift_of_isPrimitive` really has the primitive-character hypothesis needed here. Primitive conductor and primitive-character fibre vanishing are now explicit before division by a Gauss sum. `AlgHom.IsArithFrobAt` really uses the residue cardinality, which forces the q-map correction described below.

The local dependency graph has **665 edges and no cycles**. Requests specify the needed carriers/maps or exact theorem hypotheses; stage edges remain honest supplier inputs. Three requests were added: finite-extension valuation/residue facts to P7; finite-order automorphism/fixed-field linear algebra to RD.0; and the complex weight-one boundary convergence interface to Polylogarithms P.1. The existing F1 request was strengthened with analytic scalar extension, meromorphic pole removal, integral etale coordinates, uniform divided-derivative estimates, same-reduction cross-map bounds and affinoid compatibility. The algebraic filtered union of finite extensions was not mistaken for completed analytic scalar extension to C_p.

## Main mathematical corrections

**Arithmetic and semilinear Frobenius.** Over `K_N=Q_p(mu_N)` with residue cardinality `q=p^f`, arithmetic K_N-linear Frobenius is `z -> z^q`, with cohomology matrix `q I`. Its eigenvalue norm is `q^(-nm)`, not the complex absolute value `q^(nm)`. The p-power map remains an explicitly labeled auxiliary C_p-valued map permuting tame roots. Its f-fold iterate gives the q-map. The `p=2,N=3,q=4` test distinguishes them. Iterating a q-power lift gives a q^m-power lift, rather than another `IsArithFrobAt` at fixed q. Based-primitive compatibility now uses q too.

For a semilinear pullback `phi*omega=B omega+dg` and `sigma=phi_K`, direct composition gives `phi^2*omega=sigma(B)B omega+d(phi(g)+sigma(B)g)`. The corrected orbit-linear algebra uses the reverse ordered product `sigma^(m-1)(B)...sigma(B)B`. Heidelberg's actual formula corroborates this; BBK's printed column-vector order does not. A finite-order fixed-field input is requested in the abstract coefficient-field case, rather than assuming an unproved finite-dimensional Q_p argument there.

**Tangential normalization and constants.** Constant term is linear on Laurent-log germs but not multiplicative: `CT(t^-1)=CT(t)=0`, whereas `CT(t^-1*t)=1`. Word normalization is restricted to simple-pole bases and nonnegative-power regular-log expansions. Tangential Frobenius additionally preserves the stated CT normalization; this is not asserted for every lift at every puncture. Higher-pole regularization is a new gap: under `t'=t+a t^2`, the constant term of `t^-1` already changes. Ordinary endpoints remain available without this hypothesis. Coefficient-extended integration is modulo **C_p**, not K: constants outside K would contradict the claimed kernel/quotient identity. The original K-valued source formulation is retained separately.

Frobenius correction constants are uniquely solved by the finite-orbit equation; no free constant vector remains afterward. The global end germ differs from separately CT-normalized local word solutions by its actual shuffle constants. For example, the CT of Li_3 at1 need not be0. Rebasing the full one-B hierarchy is Chen base change, not individual subtraction: at depth2 it is `Li_2(z)-Li_2(x)-Li_1(x)(log z-log x)`. Subtracting a value remains valid for one fixed primitive/integrand.

**Word independence, Taylor comparison and functoriality.** Differentiating a coefficient times a word preserves the depth bound; only a pure nonempty word lowers its length. The former coefficient-comparison proof of local word independence assumed the independence it was proving. The corrected proof chooses a relation of minimal length and minimal top support over the meromorphic fraction field, normalizes one coefficient to1, differentiates, and obtains a smaller relation unless its formal differential is zero. Characteristic-zero pole removal preserves the H1 obstruction, and H0 gives C_p constants. Analytic scalar extension and strict-neighborhood pole removal are explicit supplier inputs.

Freeness of Omega alone does not imply a uniform Taylor estimate. The coordinate proof requires an integral etale coordinate and uniform divided-derivative bounds of radius `R>|pi|` on strict neighborhoods. At fixed word depth the polynomial losses are absorbed by `(delta/R)^j`; cross-map bounds are stated separately for functoriality. For two lifts without a common fixed point, image independence rebases at a point fixed by a power of the second lift, uses Taylor stability, and applies homogeneous uniqueness. Equality of normalized realizations uses a common chosen base when available. Nonfree differential modules still require the recorded local/sheaf/gluing argument.

**Polylogarithms and L-values.** The lambda recurrence starts at2; the root-of-unity inversion consequence starts at1 because weight0 has a constant term. The unsupported assertion that every higher Li_k is nondifferentiable at1 was removed; endpoint continuity stays in its separate node, keeping the graph acyclic. Distribution continuation covers all rotated tame-root end discs and names logarithmic independence. The sign is `Li_1(1/p)=a-log(1-p)`, and a ramified uniformizer satisfies `e log_a(pi_K)=a+log(pi_K^e/p)`.

The complex weight-one formula needs Dirichlet convergence and Abel's boundary theorem, rather than only an open-disc Taylor series. The multiplicative parameter for a small nonzero w has image `D(w,|w|)`, while w=0 gives a singleton. The Amice ambiguity counterexample uses a tame/mixed root and a proper subdisc; the pure p-power case meets the singular disc and uses smoothing. Equality of character normalizations occurs exactly for `k=1 mod(p-1)`; equality of numerical values can also happen through vanishing, so no converse/nonvanishing claim remains. The decomposed Dirichlet-motive Beilinson comparison is explicitly for odd p. BBdJR states the full result including2, whose dyadic normalization is recorded as a new gap.

## Sources and source findings

All **15 registered public PDFs** were freshly obtained, and every SHA-256 matched the packet's source register. All locators and excerpts used by the nodes were checked against those texts; mathematics was distinguished from worker-derived deductions. Three earlier arXiv versions were also reopened for ledger collation: BBK v1, Besser–de Jeu v1 and BBdJR v1. Their hashes and version boundaries remain in `sourceVersions`; the new GSWZ version entry records the fresh read and page-image check.

The principal reading is recorded below. The packet retains the more detailed per-node locators and literal short excerpts.

| Public source | Passages checked for this packet |
| --- | --- |
| [RJW, arXiv v2](https://arxiv.org/pdf/2309.15692v2) | The character normalization in Definition5.18/Remark5.19/Theorem5.20; geometric measure scope in Theorem5.7; section6, including full proofs and Theorem6.7; section7 logarithm and smoothing identities. |
| [RJW, version of record](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf) | Printed pp149–154 and158: all corresponding sign, conductor, weight and twist findings collated. |
| [Furusho, arXiv v2](https://arxiv.org/pdf/math/0304085v2) | Sections2.1–2.2, component/word properties and Lemma2.15; section3.1, Theorem3.3 and the adjoining formulas/examples. The log-Laurent determination argument and its p11 image were checked. |
| [Besser, Heidelberg lectures](https://www.math.bgu.ac.il/~bessera/Heidelberg-lecture.pdf) | Sections1.3–1.4: semilinear algebra, continuation, omitted Taylor proof; sections1.5.3–1.5.4: tangential normalization and word iteration. |
| [Besser, Tannakian formalism](https://arxiv.org/pdf/math/0011269v1) | Corollary3.2; Definition4.7; Proposition4.11–4.12, Corollary4.13–4.14, Theorem4.15; Proposition5.3–5.5, Remark5.6 and Theorem5.7. |
| [BBK, arXiv v2](https://arxiv.org/pdf/1004.4936v2) | Sections2–3.3, logarithm normalization, cohomological matrix, Algorithm11 and Remark12; v1 collated for E1. |
| [Besser, finite polylogarithms](https://arxiv.org/pdf/math/0006051v1) | Sections1–2 and section3, Proposition3.1 and the following ambiguity remark. The mistaken section2/Proposition2.3 locator was corrected. |
| [McCallum–Poonen](https://math.mit.edu/~poonen/papers/chabauty.pdf) | Section5.2 and Remark8.3, for the integration and lift-dependence context. |
| [Besser–de Jeu, version of record](https://www.numdam.org/item/10.1016/j.ansens.2003.01.003.pdf) | Section1 through Theorems1.10/1.12, pp874–877 and full Proposition2.6; Theorem1.12 proof on p910. Sections3–7 are retained as an undecomposed regulator input, not independently completed here. |
| [Besser–de Jeu, arXiv v2](https://arxiv.org/pdf/math/0110334v2) | Proposition2.6 and its proof, collated with v1 and the corrected published auxiliary factor and m=p qualification. |
| [BBdJR, arXiv v2](https://arxiv.org/pdf/0707.3682v2) | Lemma2.15, Definition3.6, Conjecture3.18; section4, Theorem4.14 and Proposition4.17 with proof, collated with v1 where needed. |
| [BHYY, arXiv v2](https://arxiv.org/pdf/2003.08157v2) | Theorem1.1, Lemma3.3, Propositions3.4/3.6 and5.6/5.8, including the comparison arguments used here. |
| [GSWZ, arXiv v2](https://arxiv.org/pdf/2412.04241v2) | Section2.1 pp18–19, equation(54) and its page image; section3.1 pp37–38. |
| [Wojtkowiak, version of record](http://www.numdam.org/item/BSMF_1991__119_3_343_0/) | Section0 p345, visually checking the derivative sign; section4 pp362–365 and Proposition4.4 with the weight-one case. |
| [de Jeu, functional equations, v1](https://arxiv.org/pdf/2007.11014v1) | Proposition2.10 pp6–7 and the p-adic normalization discussion/proof pp14–15. |

The Furusho Springer PDF request returned cookie/access HTML, so E25 remains a **preprint-only** finding. The BBK ANTS version was not read; E26 likewise concerns only arXiv v2. Coleman 1982 remains unread, as already recorded. No unserved version-of-record text was inferred from a preprint.

Of **27 source findings**, **25 are confirmed and two rejected**. E9's suppressed logarithm convention is harmless in the nontrivial primitive-character sum: its branch change cancels. E16 explicitly refers to Coleman's canonical functions; describing them as locally analytic is not permission to substitute arbitrary local primitives. Useful interface explanations remain, but these two sentences are not source errata. E5 and E23 are confirmed proof omissions, not false theorem statements. E10–E11 were already fixed in the published Besser–de Jeu text.

Two missed findings were added, each with a bounded search and its own confirmed review verdict:

- **E26, BBK Remark12, arXiv v2 p8.** The stated column convention reverses the semilinear product and corresponding g-correction. The direct two-step calculation above proves the issue. For `B=[[sqrt2,1],[0,1]]` and `sigma(sqrt2)=-sqrt2`, the competing upper-right entries are `1-sqrt2` and `1+sqrt2`. The current arXiv version history, Kedlaya publication list and title/author erratum search yielded no relevant correction; this does not claim exhaustive absence or a published-text finding.
- **E27, GSWZ equation(54), arXiv v2 p19.** The displayed range `k=0,...,p^N-1` with representative `r+pk` has period `p^(N+1)`, whereas the printed progression and denominator use `p^N`. For `p=2,N=1,n=1`, the printed t^3 coefficient is `4/3`, while the actual coefficient is `1/3`: discrepancy1 modulo2. Keeping the range and replacing the period by `p^(N+1)` agrees with equation(53); alternatively shorten the range. The v2/version-history, MPIM record, public author index and title/equation searches yielded no correction in this bounded search. The intended integrality lemma survives with the corrected indexing.

Fresh exact cyclotomic unit-moment sums for `p=5,theta=chi_-3,k=2` reproduce the missing-twist obstruction: the printed RHS is2 modulo5 while the untwisted L-value is zero by parity. Two consecutive finite Riemann levels also gave scalar57 modulo `5^3`, `5^4` and `5^5`. Those extra digits are finite consistency checks; the independently proved measure/congruence argument supplies the nonzero residue. No high-precision numerical L-value or nonvanishing theorem is inferred from the finite calculations.

The following table records every source-finding verdict. The full reasons and version limits are in each ledger entry.

| Finding | Verdict | Checked correction or reason |
| --- | --- | --- |
| E1 | confirmed | BBK logarithm series: missing leading minus, v1/v2. |
| E2 | confirmed | BBK Weil magnitude is complex, not the asserted p-adic norm. |
| E3 | confirmed | Heidelberg final coordinate must be g_n rather than a repeated g_1. |
| E4 | confirmed | Heidelberg orbit specialization uses d^r rather than d^i. |
| E5 | confirmed | Acknowledged Taylor-proof omission; explicit uniform-coordinate hypotheses and general gluing gap retained. |
| E6 | confirmed | Weak-completion multi-index exponent means total degree. |
| E7 | confirmed | Tannakian recursion references an undefined initial stage; shift to preceding depth. |
| E8 | confirmed | Tannakian differential target is T-prime. |
| E9 | rejected | Conventional branch notation and cancellation in a nontrivial character sum; no erroneous theorem. |
| E10 | confirmed | Auxiliary 1/(n-1) factor omitted in preprints, already repaired in published p877. |
| E11 | confirmed | The preprint root-count argument requires m=p; published p877 already says so. |
| E12 | confirmed | Normalization is Li_n(0)=0, not Li_n(z)=0 identically. |
| E13 | confirmed | BBdJR introduces a branch of the logarithm, not a branch of the polylogarithm. |
| E14 | confirmed | Published Wojtkowiak derivative sign: 1/(1-z); page image checked. |
| E15 | confirmed | RJW missing omega^(1-k) twist; preprint and published p154; congruence concerns normalization, not nonvanishing. |
| E16 | rejected | Explicit Coleman attribution already fixes the canonical functions; local analytic description is not an erratum. |
| E17 | confirmed | RJW geometric-measure proof excludes pure p-power conductor; smoothed proof fixes the scope gap. |
| E18 | confirmed | RJW positive CRT/twist sum has the wrong leading minus. |
| E19 | confirmed | RJW conductor case must include n=1. |
| E20 | confirmed | RJW complex indicator uses modulus N, not D. |
| E21 | confirmed | RJW root and unit sum use full conductor N. |
| E22 | confirmed | RJW logarithmic subtraction gives a plus in the second summand. |
| E23 | confirmed | Weight-one complex boundary needs Abel/Dirichlet justification; the formula is not false. |
| E24 | confirmed | BBdJR starred determinant must also use the starred regulator. |
| E25 | confirmed | Furusho Lemma2.15 limit is toward0; preprint-only, publisher text unavailable. |
| E26 | confirmed | BBK column-vector semilinear product and g-correction order; arXiv v2 only. |
| E27 | confirmed | GSWZ equation(54) period/range duplicates terms; arXiv v2 page image and exact coefficient counterexample. |

## API, tests, suggested Lean and planets

All 30 definitions/constructions have at least three discriminating tests and usable APIs covering their applicable constructor, extensionality, normalization, structure, compatibility and relation laws. Examples distinguish locally analytic from whole-disc analytic functions, restricted from dagger primitives, p-map from q-map, primitive from imprimitive character sums, canonical from perturbed primitives, and unsmoothed from smoothed endpoint formulas. The reviewer-added Laurent CT counterexample is an additional packet test and typed example in the suggested file. The 22 planets respect the per-layer limit and represent key objects and named central theorems; none were added or renamed.

The entire suggested Lean file was read. In addition to the convention comments, these signatures were repaired:

- Annulus coefficients only impose conditions at positive radii; exactness and kernel signatures require a nonnegative inner radius.
- Generic L3 coefficient fields explicitly have characteristic zero. The polylogarithm ODE applies at every nonzero point distinct from1, including the punctured disc needed for smoothing.
- `HasLocalFormAtOne` includes the logarithm's multiplicative law, derivative and convergent series; the regular analytic center agrees with Li_k(1) for k>=2; the weight-one regular part is zero. The old abstract hypotheses admitted arbitrary logarithms and arbitrary center values.
- The weight-one Taylor coefficient example includes the actual ODE. Modified-polylogarithm distribution requires every rotated argument and the powered argument to belong to its domain; otherwise a permitted z can make z^m=1.
- The new sign example checks Li_1(1/p). Comments expose arithmetic q-data, the simple-pole CT scope, uniform Taylor prerequisites, particular-function restrictedness and the odd-prime regulator comparison.

Existing missing-carrier comments remain honest omissions; no replacement carrier or proposition asserting the desired conclusion was introduced. Input-worker slice compilation and finite chart-test receipts are explicitly labeled historical provenance. They were not replayed by this review and do not establish compilation of the revised file.

`lean-check research/blueprint/suggested/ColemanIntegration.lean` was attempted on the final file with **96GB available**. It exited1 before declaration elaboration, at line44: **unknown module prefix `research`**, for the required `research.blueprint.suggested.«DirichletPadicLFunctions--L1»` import. Its olean is absent from the shared pinned build. Therefore the full suggested file is **not compiled** by this review. No library build, cache download, language server, stripped-import variant or Lean file outside the allowed suggested file was used. No compile remains running.

## Complete correction inventory

The table enumerates all 51 corrected nodes. No new mathematical node was necessary at target granularity. Baseline, scope, checks/provenance, source-version and ledger metadata changes are recorded in the sections above.

| Node (ColemanIntegration prefix omitted) | Correction |
| --- | --- |
| `L0/disc-analytic-functions` | Use the actual ENNReal-radius ball, matching HasFPowerSeriesOnBall and the Lean prototype. Supply a whole-radius binomial recentering proof; the generic changeOrigin bound does not suffice. |
| `L0/locally-analytic-primitive-nonunique` | Correct the Furusho locator to section3.1 before Theorem3.3, preprint p15. |
| `L0/annulus-residue` | Give the general-differential coordinate-change argument and its direct log-convergence prerequisite. |
| `L0/annulus-exact-iff-residue-zero` | Separate real integer growth from the ultrametric norm and the outer radius. |
| `L0/cp-unit-power-principal` | Record the finite-extension value-group and finite-residue-field input explicitly; spectralNorm is only the norm carrier. |
| `L0/iwasawa-logarithm` | Avoid an unlisted Ax–Sen–Tate fixed-field assertion in the automorphism test. |
| `L0/annulus-log-ring` | Keep the change-of-parameter coefficients over K and require distinct branches for the nonconstancy test. |
| `L0/annulus-branch-change` | Specify the common primitive normalization and the nonzero branch-residue product. |
| `L1/residue-disc-parametrisation` | Separate disc translation between different lifts from multiplicative parameter change at a fixed end. |
| `L1/frobenius-lift` | Distinguish q^m-power lifts from IsArithFrobAt at fixed residue cardinality q. |
| `L1/frobenius-h1-datum` | Make the iterated exponent and coefficient-extended hypotheses explicit. |
| `L1/frobenius-orbit-linear-algebra` | Correct the semilinear product order, as in the actual Heidelberg Lemma1. |
| `L1/word-algebra-local-expansion` | Restrict the tangential word construction to simple-pole forms; add the Laurent constant-term counterexample. |
| `L1/word-algebra-frobenius` | State the tangential pullback hypothesis and correct the factor in the depth-two correction. |
| `L1/coleman-realization` | Correct the constant-correction uniqueness argument and the tangential hypotheses. |
| `L1/coleman-functions` | Differentiating coefficients preserves depth; only D of a pure nonempty word lowers its word length. |
| `L1/coleman-uniqueness-principle` | Replace the circular top-coefficient comparison with a minimal-relation proof and expose its meromorphic pole-removal/base-change input. |
| `L1/coleman-integral` | Keep the coefficient-extended primitive quotient C_p and restrict tangential endpoint evaluation to regular-log primitives. |
| `L1/coleman-integration-characterisation` | Use the correct constant field in the integration quotient and preserve the original K-valued source formulation separately. |
| `L1/taylor-homotopy` | Expose the integral coordinate and uniform Taylor estimate, including the cross-map version used by functoriality. |
| `L1/frobenius-lift-independence` | Prove image independence by rebasing at a point fixed by the second lift; a common fixed point was wrongly assumed for arbitrary lifts. |
| `L1/coleman-pullback` | State cross-map Taylor hypotheses and give the source-Coleman primitive/constant-defect argument in the Dwork induction. |
| `L1/branch-independence-principle` | Base branch transport on ordinary normalization, and qualify the tangential case. |
| `L1/cohomological-analytic-pullback` | Add the direct prerequisite for cohomological lift independence. |
| `L1/punctured-line` | Use q=#k_N for arithmetic Frobenius over the unramified coefficient field. |
| `L1/punctured-line-frobenius` | Correct arithmetic Frobenius over Q_p(mu_N), retaining the explicitly distinguished auxiliary p-power prototype. |
| `L1/punctured-line-datum` | Correct the q-linear datum and the p-adic eigenvalue norm. |
| `L1/punctured-line-coleman-functions` | Match the arithmetic q-datum and explain the p-power word-action prototype. |
| `L1/punctured-line-based-primitive` | Match based-primitive Frobenius compatibility to the arithmetic q-map, retaining the auxiliary p-map separately. |
| `L1/punctured-line-singular-disc-expansion` | Distinguish the actual globally normalized end germ from each separately CT-normalized local solution. |
| `L2/existence-and-uniqueness-of-coleman-polylogarithms` | Distinguish an individually based primitive from rebasing the full iterated hierarchy. |
| `L2/polylogarithms-on-the-punctured-residue-discs` | The lambda recurrence starts at k=2; lambda_0 is not defined here. Use precise local-versus-rigid analyticity language for the logarithmic non-example. |
| `L2/tangential-base-point-at-zero` | Correct the false one-B rebasing formula with the depth-two Chen correction. |
| `L2/differential-recursion` | Remove the unsupported all-depth non-differentiability assertion; continuity is proved in the separate value-at-one node. The continuity assertion lives solely in value-at-one, avoiding a recursion/distribution/continuity dependency cycle. |
| `L2/distribution-relation` | Cover every rotated tame-root end disc and cite formal logarithm independence. |
| `L2/inversion-relation` | The root-of-unity consequence excludes k=0, whose inversion has constant -1. Use logarithmic independence in the punctured-disc extension. |
| `L2/galois-equivariance` | Correct Li_1(1/p)=-log_a(1-1/p)=a-log(1-p). |
| `L2/integral-modified-polylogarithm` | Fix the congruence proof and prove restrictedness only for the globally glued integral ell_k, not every element of the completed localization. Require all distribution arguments to lie in the stated affinoid; the Lean signature previously permitted a pole at z^m=1. |
| `L2/frobenius-relation` | Make the induction needed for the zero differential explicit. |
| `L2/elementary-characterisation` | Cite the proved whole-disc ultrametric recentering lemma for the elementary uniqueness argument. |
| `L2/values-in-finite-extensions` | Correct the uniformizer logarithm: e_K log_a(pi_K)=a+log(pi_K^e_K/p). |
| `L2/polylogarithm-expansion-at-a-root-of-unity` | Require the primitive character hypothesis before dividing by its Gauss sum. |
| `L2/twisted-sums-for-primitive-characters` | Confirm the globally named gaussSum_mulShift_of_isPrimitive declaration and add the direct primitive-character fibre-sum prerequisite. |
| `L2/complex-polylogarithm-at-roots-of-unity` | Supply the conditionally convergent k=1 boundary argument and its precise supplier request. |
| `L3/polylog-primitive-on-residue-disc` | Correct the image of the multiplicative parameter when  / w / <1 and cite finite-field-of-values inputs. Strengthen the generic Lean coefficient field to characteristic zero and the weight-one coefficient test to include the actual differential recursion. |
| `L3/smoothed-polylog-combination` | Keep the index restrictions in the derivative and root-of-unity API. Strengthen the Lean local-form interface with logarithm laws, differential recursion near1, and the regularized center values; otherwise its smoothing theorems admitted arbitrary plog and arbitrary values Li_k(1). |
| `L3/coleman-formula-rjw-normalisation` | Do not infer an iff about equality of values from an iff about equality of character normalizations. |
| `L3/coleman-functions-versus-locally-analytic` | Qualify the Amice counterexample by the tame/mixed condition and a proper subdisc. Correct the distribution/locally-constant ambiguity locator to section3 after Proposition3.1. |
| `L3/independence-of-branch-and-frobenius-lift` | Cite actual lift independence, rather than uniqueness for one fixed datum, for the lift comparison. |
| `L3/padic-beilinson-for-dirichlet-motives` | Restrict the decomposed proof to odd p and record the missing dyadic normalization needed for the full published theorem. |
| `L1/regular-image-end-pullback` | Distinguish local end composition from the uniform cross-map Taylor input used in functoriality. |

## Validation and orchestrator actions

- `python3 scripts/check_blueprint.py research/blueprint/packets/ColemanIntegration.json`: **0 errors, 0 warnings**.
- Source-ledger validators `source_issues.check_issues` and `check_errata.versions_checked`: **27 entries, zero errors**. The standalone errata checker requires an errata wrapper, so the appropriate functions were applied directly to this blueprint.
- Independent DFS: **177 local nodes, 665 local edges, zero cycles**; every node has exactly one independent verdict.
- Pure-Python exact arithmetic: noncommuting quadratic matrices, the GSWZ coefficient discrepancy, cyclotomic unit-moment parity/twist controls and all ten formal five-term wedge coefficients passed. These are finite algebraic checks, not a proof of analytic continuation or a Lean compilation claim.
- Exact four-file `intake.py check-files`: **zero problems**; `git diff --check`: passed. Full-file Lean check has the missing-import limit described above.

The seven gaps are precise follow-ups, not contradictory unqualified conclusions: general-curve algebraic de Rham comparison; nonfree differential/gluing; field-general projective/Bloch comparison; the full syntomic regulator proof; coefficient-valued general Artin L-functions; higher-pole tangential regularization; and dyadic L-function/Beilinson normalization.

The orchestrator should:

1. Synchronize `research/blueprint/readmes/ColemanIntegration.md` with this packet's q-map, C_p quotient, Chen normalization, Taylor/simple-pole scope, corrected signs/index restrictions, odd-prime comparison, new test and new counts. That path was outside the review's allowed edits.
2. Route the three new precise requests and the strengthened F1 contract to their existing owners. Assign the recorded general Artin L-function input rather than duplicate another roadmap.
3. Queue the dyadic comparison and higher-pole regularization as the recorded refinements; keep the planned-stage status until their inputs are supplied. The full regulator decomposition and projective/Bloch refinements also remain open.
4. Supply cached real supplier modules to the shared Lean checker and elaborate the entire suggested file. Resolve any resulting elaboration issues before treating these signatures as checked. Historical compilation receipts do not apply to this revision.

The packet's accepted review is justified under the issue's explicit planning-pass rule: every node is verified or corrected within its stated hypotheses and recorded supplier/gap scope, all baseline citations are confirmed, and no unresolved mathematical contradiction is retained.
