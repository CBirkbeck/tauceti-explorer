# Verification of RT-PAPER-YUN-ZHANG-17

Codex, session `codex-rtOQ9t`, 30 September 2026. Refs #4115.

**14 confirmed, 1 rejected.** Finding /3 is rejected: YZ19/116 already belongs to the SF source route, including at the red team's submission. Seven medium and seven low findings are confirmed. A confirmation authorizes the corrected scope below, not every assertion or edit in the original finding.

The verifier did not extract, review or red-team this paper. The reviewed repository revision is `6e1ed66260f8ecc7da97c20cd8e8dd8e6b8e1ced`. The red team entered in `43e82e6`. Only this report and the verification JSON are deliverables; extraction, earlier reviews, source-issue verdicts, queue generation and other papers are not edited here.

## Evidence and limits

I downloaded the [Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf) and the [author's published copy](https://math.mit.edu/~zyun/Taylor_Expansion_published.pdf). Both have SHA-256 `b02ed5cbe5e6443a59360551cd41048ebb1e589d3c4cbe89f7fcbbbec50fc111`, matching the extraction. The 145-page PDF uses journal pages 767–911. [arXiv v3](https://arxiv.org/pdf/1512.02683v3) has SHA-256 `76bb3576bc75dc1c5214597197e3d8ef62abc10784e2b2625657a0e7ea1821ff`.

This is a targeted verification, not another whole-paper reading. I read the published passages relevant to the findings: pp. 783–789, 791–792, 795–796, 798, 800–809, 818, 822–824, 828, 830, 832, 848–849, 857–858, 862, 864, 866–867, 870, 872–873, 878, 889, 896–897 and 902–906; the p. 821 typo was checked in its text context. Page 824 was also rendered and inspected to distinguish the hatted and unhatted spaces. I checked the erroneous Lemma 7.15 citation in v3, PDF p. 77. I did not collate every source issue against every preprint version.

I read all 43 extraction item statements, notes and locators, the five route reasons, the Part II brief, the relevant earlier review, and the neighboring items identified below. I checked the actual route grouping code and accepted routes, the relevant roadmap stages and GS packet nodes, the reviewed SF.5/AL.2/FA.1/FA.6/GS.0 library audits, and the cited library declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. A roadmap import is planned work, not a formalized result. Negative library searches below are limited to the named trees and APIs.

The [Annals article page](https://annals.math.princeton.edu/2017/186-3/p02), [arXiv record](https://arxiv.org/abs/1512.02683), and a targeted erratum search exposed no correction to the passages checked. This is not a complete novelty audit: I did not independently inspect all Crossref relations or arXiv v1–v2. The fixer must not copy the red team's claimed search history as this verifier's work.

## /1 — confirmed: the analytic function-field route

GZ's conventions fix a totally real field and a CM extension, and GZ.5 imports its number-field spectral/theta suppliers. It does not supply the function-field regularization, Eisenstein ideal or kernel identity of YZ17 §§2–4. Published pp. 800–806 explicitly construct that analytic spectral argument; its conclusion is Theorem 4.7. The Part II brief incorrectly requests this theorem from GZ.5, while its six missing analytic items are sent there as a source.

Move the function-field analytic adapter into the shared shtuka special-cycle tranche, coalescing the corresponding YZ19 analytic items, or give that tranche an explicit function-field analytic supplier. Keep the foundational harmonic analysis, local factors and Satake imports at their current owners. Theorem 4.7's relation to Waldspurger is a comparison, not evidence that GZ's present hypotheses cover this theorem. Coordinate the item-route move, empty-route removal and route-review renumbering; do not create a second general spectral or relative trace formalism. YZ19's analogous GZ assignment also needs reconciliation, rather than treating its current routing as proof of coverage.

## /2 — confirmed: preserve the special-cycle tranche in the merged design

I reproduced `accepted_routes` and `paper_designs`. The generator groups Part IIs by parent, preserves their briefs, and permits a designer to plan the first independent direction while proposing a restructure for the rest. The GlobalShtukas parent has nine accepted contributions, in registry order: CIUBOTARU–HARRIS (26 items), YU (77), DADDEZIO (1), YZ19 (112), YZ17 (22), FYZ24 (25), FENG (33), ABE (17), and BOCKLE–HARRIS–KHARE–ETAL (22). The cycle tranche contains 159 items. The pending job is `DESIGN-GlobalShtukasAndFunctionFieldLanglandsPartII`; there is no job with the proposed cycle id.

Confirm the risk of deferring this required tranche and the inaccurate treatment of a proposed id as an existing supplier. Parent grouping does not discard its items, and a dedicated job for every proposed id is not automatically correct: the grouping deliberately reconciles overlaps. Amend the extraction brief to identify the mandatory joint YZ17/YZ19/FYZ24 tranche and its dependency obligation, with the id explicitly provisional. A maintainer can choose a coordinated split or require the merged design to preserve all necessary tranches without deferral. Changes to `make_queue.py` or the queue are maintainer decisions, not extraction-fixer edits. This is the same kind of deferral risk verified in RT-PAPER-BENOIST-19/1.

## /3 — rejected: the alleged second Octahedron owner does not exist

YZ19/116 is already in its **source route 5 to SchemeAndStackFoundations SF.1/SF.5**, not route 7 to the shtuka Part II. Its note explicitly sends the general theorem there and identifies YZ17/34. YZ19/117 keeps the application to the ramified diagram in the Part II. I checked the YZ19 result at this review's base, at `43e82e6`, and at `43e82e6^`: all three file contents have SHA-256 `7777bdb2059e5eca92c8d3577dfb46d507dc7b73b181db5aef20206d8ba311b9`. Thus the allegation was already false when submitted, not merely repaired later.

Keep this shared source ownership. Do not attempt to remove /116 from a route that does not contain it, or mark a still-missing foundational theorem implemented/planned merely because its source route exists. FYZ24/32's stale note can be clarified together with /4, but it does not establish two planned owners. The actual stack-coverage deficiency is /4.

## /4 — confirmed: scheme intersection theory does not cover the stack input

SF.5's scheme intersection theory does not establish all of item 41's stack operations. CANNING–LARSON–PAYNE24/12 already identifies the stack extension as missing. Published §A.2.10, p. 889, requires representability, a vector-bundle normal cone stack, a regular-immersion presentation and dimension conditions. Lemma A.11, p. 897, explicitly needs the DM deformation-to-the-normal-cone argument in addition to the scheme cycle-class compatibility.

Split the scheme imports from the missing stack extension, coalescing it with the Canning item and YZ17's existing Appendix A items at one shared foundational owner. The source-to-SF.5 proposal is an addition to be planned, not evidence that SF.5 already supplies it. Specify the precise classes of Artin/DM stacks, morphisms, coefficients and finiteness conditions for each operation; do not replace the overclaim with unrestricted Gysin theory on every Artin stack. Coordinate the sheaf/cycle-class side with the proposed EDC stacks Part II, and correct FYZ24/32 consistently. Include the Kresch reference used on p. 897. Do not duplicate Proposition A.5 or the Octahedron Lemma.

## /5 — confirmed, narrowed: the spectral decomposition is missing, cuspidal finiteness is planned

Published pp. 800–803 use induced families, continued Eisenstein series and the cuspidal/residual/Eisenstein decomposition of the automorphic kernel. FA.6 does not plan that full analytic package, and AS.1–AS.4 explicitly use number fields. Item 42 therefore overstates its supplier.

However, the finding's assertion that finite-dimensional unramified cuspidal spaces are unplanned is false: FA.6 states finiteness at fixed level and central character, and `GS.0/cuspidal-automorphic-forms` also supplies it. Preserve that import. Separate the missing function-field Eisenstein/kernel adapter and place it with /1's analytic supplier. Identify ordinary multiplicity one and strong multiplicity one as distinct contracts; coordinate the latter with YZ19/233, already in the special-cycle route, rather than adding a duplicate. A theorem distinguishing irreducible representations by their eigenvalues does not alone prove multiplicity one inside an automorphic function space.

## /6 — confirmed: source-route text still transmits false statements

`make_queue.py` puts each accepted source route's **reason** into `ADDED_SOURCES`. Route 5 still omits the entireness restriction in B.2 and extends B.5's number-field pole clearer to function fields. Route 2 leaves the exceptional orbital formula unqualified, despite corrected items and source issues E9/E15/E17.

Independent checks agree with those corrections. For q=3 and C=sqrt(q)+1/sqrt(q), the nontrivial degree-parity GL1 character gives Lambda(1/2+t)=1/(2cosh(t log q)+C), whose second derivative is about -0.1299825549. For the trivial character, the second derivative of (t²-1/4)/(2cosh(t log q)-C) is about -0.1601152096. For the infinity orbital representative [[0,1],[1,1]], integrality of squared entries divided by determinant forces v(x)+v(y)=0, hence the weight is constant in s; the other open infinity orbit gives the same conclusion. The corrected infinity value is 2L(eta,0), while the zero value retains L(eta,2s)+L(eta,-2s).

Synchronize all route reasons with the corrected statements: entireness for B.2, the non-polynomial restriction for B.1's strict derivative assertion, B.5's field distinction, and the two different exceptional orbital values. Coordinate Hadamard with /7. **Do not add `FunctionFieldArithmetic:FA.5` to an AL route's stages**, as proposed: source-route stages belong to that route's roadmap. Use a separate FA source contribution if genuinely new FA work remains, or identify FA.5 as an imported supplier and leave the consumer adapter at AL. Keep routes and review indices consistent.

## /7 — confirmed, narrowed: expose the Hadamard dependency and reuse existing debt

Published pp. 902–904 use canonical products and finite-order factorization before Proposition B.1 and its L-function application. Item 36 mentions the background but does not expose its formal contract or supplier, and AL.2's current stage does not supply it. The pinned Mathlib Jensen statement (`AnalyticOnNhd.circleAverage_log_norm_of_ne_zero`) is a circle-average result under analytic/nonvanishing hypotheses, not Hadamard factorization. Tau Ceti's `hadamardFactor` in Analysis/Calculus/Hadamard is an averaged derivative used for differentiable factorization, also not the required entire-function theorem.

The claim that the atlas contains nothing relevant is too broad. `AnalyticNumberTheory:AN.2/classical-zero-free-region` explicitly needs Hadamard, and the accepted packet's **AN.2 analytic proof decomposition** gap records that unresolved input. Add an explicit missing dependency and coordinate one reusable complex-analytic supplier with that existing debt; AL.2 consumes it. Do not independently plan another copy simply inside AL.2. State the sufficient order-at-most-one hypothesis, the zero/product convergence and real-symmetry conditions actually used by B.1, and verify how the completed L-function meets them. A function-field Laurent polynomial in q^{-s} is still a function of s, not an ordinary polynomial in s; handle constant exceptions and the strict-positivity conclusion separately.

## /8 — confirmed, narrowed: make geometric imports and residual adapters explicit

The source supports all eight families of inputs, but several are mentioned in bundled items or already have suppliers. The correction is to expose and connect the contracts, not classify every family as wholly unplanned:

- **Trace functions:** pp. 795–796 need the scheme sheaf–function/trace formula. Import the upstream point-counting owner named by EDC.8; use the proposed EDC stacks extension for stack statements, with its hypotheses. RT-AREA-etale/3 already specifies this extension and the YZ trace adapter.
- **Quadratic local systems:** p. 792 uses the Picard/curve H¹ comparison and Abel–Jacobi pullback. Import GS.0's Picard/GL1 theory, while separately identifying the precise comparison not stated by its general Lang/class-field node. Coalesce with YZ19/170's ramified geometric class-field supplier when applicable.
- **Symmetric powers and norm:** pp. 789, 791–792 and 823–824 use the universal section stack, large-degree Abel–Jacobi smoothness, and the norm/Prym sequence. Item 38 already mentions Picard/Prym geometry; separate its reusable SF.3 input from the exact norm and section-stack adapters. Retain d>=2g-1 or d>=2g'-1 where used.
- **Lang:** GS.0's `picard-and-the-gl1-case` already states the Picard Lang isogeny and its rational-point kernel. Import it for p. 818; do not create a second missing Picard Lang theorem in the cycle Part II. The finite-field descent at p. 857 needs the group/Frobenius version with its own precise supplier or remaining gap.
- **Symmetric-power cohomology and Künneth:** pp. 870 and 873 use them. Item 27 already quotes the exterior-power formula, so the defect is its missing separate dependency. Reuse YZ19/165 in the ramified geometric-class-field route; import Künneth with the needed sheaf/stack scope.
- **Compact supports and duality:** §§7.1 and A.4.3 require compatibility with truncation colimits, the trace and cycle maps, and smooth-DM duality. Items 30/40 already contain pieces. Generic stack operations belong to the shared EDC stacks proposal; shtuka truncations and Hecke support control remain GS/cycle adapters. Preserve E34's correction: a trace map, not a general identification of top cohomology with one copy of Q_l.
- **Weights:** p. 864 uses the weight filtration and pure-cohomology bounds in Lemma 7.13, independently of the later RH application. Add the appropriate DWP.7–DWP.8 import to this proof path.
- **Torsion sheaves:** p. 832 uses Laumon's smooth dimension-zero Coh_0^d stack. State this input explicitly, with its geometry supplier; a bibliography entry alone does not close the proof plan.

These shared additions must follow the already-proposed `EtaleDualityAndPerverseSheavesPartIIStacks`, not create another sheaf theory. Its draft ST keys are proposals, not existing atlas stage ids. Exact hypotheses remain obligations wherever the current source item or supplier does not state them.

## /9 — confirmed, narrowed: analytic imports need the actual normalization adapters

Published pp. 804–806 use the Petersson/Whittaker and toric integrals, local unramified factors and self-dual measures to obtain the factor |omega_X|/2. Page 786 uses Poisson summation, p. 788 the h_D basis, p. 798 class-field/Chebotarev input, and p. 867 the Hecke-finite cuspidality theorem. These should be explicit imports or adapters, not only bibliography.

FA.2 supplies function-field harmonic analysis; FA.4/FA.5 supply the stated arithmetic inputs; FA.6 and `GS.1/unramified-hecke-algebra-and-satake-isomorphism` supply the Hecke/Satake foundation. The exact GS.3 node for the last input is **`cuspidality-equals-hecke-finiteness`**, not merely the definition of Hecke-finiteness. Check the coefficient/lattice formulation when applying it. AL.3's general unfolding plan is not, by itself, a proof of every function-field period normalization: retain the local values theta_x^natural=zeta_x(2)^{-1}, lambda_x^natural=1 and the global measure comparison as explicit adapters alongside /1. Do not mark that entire package planned just because AL.3 mentions Rankin–Selberg. The Picard involution and Eisenstein quotient remain in item 12.

## /10 — confirmed for the typos and missing dependency, not an established false theorem

Published p. 878 and v3 PDF p. 77 cite a nonexistent third part of Lemma 7.15. Published p. 866 has two parts, with part (2) giving the identity used. The p. 862 lemma/proposition slip and p. 828 missing prepositions also occur. **The duplicated article before “action” is on p. 821, not p. 822.** Correct that locator.

The p. 867 proof also needs the disjointness of cuspidal and Eisenstein Hecke eigensystems. Make this a formal dependency of items 24/29, tied to the multiplicity-one/GL2 correspondence supplier identified in /5. A naive non-strict Ramanujan bound does not prove the required disjointness. But the absence of a proof of this standard input in that paragraph does **not** by itself establish a mathematical gap in the published theorem. Do not file a new claim that the conclusion or proof is invalid merely because the source abbreviates this step. A source-issue entry, if retained, must explicitly say it records an unstated dependency in the formal plan, not a counterexample or failed implication.

The proposed three-issue fix needs this qualification and a genuine novelty search before marking new errata. I checked the Annals/arXiv records and a targeted search, not all Crossref relations or v1–v2. Record only searches actually performed; no invented 30 September collation history. The harmless typos are independently confirmed regardless of that novelty limitation.

## /11 — confirmed: remove the third alleged E28 misprint

The printed smoothness over the **unhatted** X'_d on p. 824 is valid. In the stated range, the hatted section stack is a vector bundle over Pic^d(X') of rank d-g'+1. The norm has smooth relative dimension g-1: its differential is the trace, split after composing with pullback because p is not 2. Since g'=2g-1, the composite to Pic^d(X) is smooth of relative dimension d-g+1. Base change gives the printed assertion for each of the two open pieces. I checked the definitions on p. 789, the norm construction on p. 823, and both the text and rendered p. 824.

Drop E28's third accusation and retain its other two parts. It is unnecessary to replace this valid statement by a “gap”: the extra vector-bundle sentence is a useful formal proof explanation, not evidence of a failed argument. Smoothness over the hatted factor is also true, but does not make the printed alternative a misprint. Changes to an earlier review's recorded verdict must follow the maintainer's review policy.

## /12 — confirmed: preserve truthful structured provenance

The result has no `sourceVersions`. Running the current `collation.versions`, `provenance` and `stated` on it returns [], preprint, and 6; REQUESTS.md lists those six claims. The two published downloads are byte-identical and match the extraction's recorded author's-copy hash. Structured published provenance is appropriate and prevents this redundant collation request.

Use the author's-copy URL with its actually reported original read date, and the verified published identity. If recording this review's Annals fetch, use **2026-09-30**, not a fabricated Annals fetch on 2026-09-22. Record the actual v3 reading history similarly, distinguishing the earlier whole-paper comparison claimed by the extraction from this review's targeted check. Do not label metadata or an unsuccessful fetch as a published reading. Regenerating the collation outputs is a maintainer/tooling step unless the fix issue authorizes those paths. No mathematical source issue is resolved merely by adding a hash.

## /13 — confirmed: cite the existing arithmetic building blocks

The report's blanket Library/Nothing line is inaccurate. I read the cited Tau Ceti declarations at f790474: `Divisor` and `Divisor.degree` (Divisor/Basic.lean), `degree_weilDifferentialDivisor` (Differential/CanonicalDivisor.lean), the finite-dimensional Riemann–Roch space theorem (RiemannRoch/Basic.lean), and `Divisor.finite_setOf_isEffective_degree_le`, `Divisor.classNumber` and `Divisor.classNumber_pos` (RiemannRoch/ClassNumber.lean). The FA.1 reviewed audit likewise identifies divisors, Riemann–Roch and degree-zero class finiteness as built.

Cite these as the arithmetic inputs for degree bookkeeping, bounded effective divisors and the class number, retaining their finite-constant-field, function-field and exact-constants hypotheses as applicable. They do not already identify the scheme's section space, Picard/Jacobian rational points or the automorphic period constant: those comparisons remain adapters. Thus update the report and the relevant item citations without marking all of items 11/14/42/43 formalized. The particular stack, shtuka and spectral constructions remain absent from these inspected APIs; avoid an unrestricted claim about every possible library result.

## /14 — confirmed, narrowed: acknowledge the positivity proposal without a cycle

The accepted RT-AREA-iwasawa-1/16 fix report explicitly proposes the GZ.5 central-value nonnegativity node for PGL2 over Q and quadratic/trivial twists. Its unrestricted denial in route 5 is stale. Published Remark B.6 also recognizes an unconditional central-value theorem. B.2's conditional all-derivatives statement and this unconditional GL2 central-value specialization are related, not identical.

Replace the denial by a scoped cross-reference, clearly identifying the GZ addition as a **pending proposal**, not a node already implemented in the current GZ.5 text. Retain B.2 at its actual all-derivatives/entire-L-function scope. **Do not add GZ.5 -> AL.2:** GZ.5 already depends on AL.2, so that suggestion would create a cycle. A source/overlap cross-reference needs no prerequisite edge; a future dependency requires a specified direction, theorem use and cycle check. In particular the conditional B.2 specialization does not prove the unconditional BSD sign input.

## /15 — confirmed: correct bundled contracts and locators

Published pp. 807–809 allow the Hecke stack before imposing the balance condition needed for GLn shtukas. Page 830 states the fundamental-cycle restriction in Lemma 6.7; add it explicitly even though item 19's preceding construction suggests the intended cycle. Without that restriction the lemma is not a statement about an arbitrary class. Page 872 says the degree bound does not imply smallness, not that every map in the family is non-small. Pages 896–897 require both C and M to be DM stacks for Lemma A.11. These are precise statement corrections, not changes to the main formula.

Remove §6.2 from the perverse/middle-extension item's locator: that subsection's correspondence geometry is not the claimed perverse-sheaf input; the relevant semismall application in the earlier geometric part is §6.4.4. The regularization/finiteness argument in §§2.3–2.5 ends on p. 786, so use pp. 783–786 for item 8's aggregate locator. Restore the exponent s on the first absolute-value factor in E9's explanation of the Weyl substitution. Synchronize the affected earlier review/report language without silently rewriting review verdicts outside authorized scope.

## Reproduction and validation

The verification JSON contains exactly one decision for each of the fifteen original finding ids. The report's important counterchecks are reproducible from the repository: YZ19/116's membership and the three equal blob hashes; the nine accepted Part II contributions; and `collation.provenance(result) == 'preprint'` with six stated-result issues before adding structured provenance. The two negative second derivatives in /6 were recomputed directly from the displayed functions. The orbital support conclusion follows symbolically from the simultaneous inequalities -v(x)-v(y)>=0 and v(x)+v(y)>=0; a small integer-valuation grid was also checked as a sanity test.

Validation commands for these two deliverables:

```sh
python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-YUN-ZHANG-17.review.json
python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-PAPER-YUN-ZHANG-17.review.json research/blueprint/reviews/REV-RT-PAPER-YUN-ZHANG-17.md
git diff --check
```

No Lean file is required by this verification issue. None was compiled, and no library build, Lake project or language server was started.
