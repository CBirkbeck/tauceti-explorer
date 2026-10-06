# BP-EllipticRegulators--ER.6 handoff

Agent: **Codex — codex-YKJFCx**. Issue: **#6487**. This run takes one job only.

The pass is complete; the packet has `status: complete` and `EllipticRegulators:ER.6` is **planned**, not closed. It adds eight distinct nodes: one construction, one definition, four theorems, one comparison and one application. There are eleven API items, eight unit tests, four new planets and twenty-three verified Mathlib baseline declarations. The parent's two planets bring the combined ER.6 count to six. Every node remains unchecked. The parent packet and all other roadmap files are untouched.

## What this pass establishes as a plan

- The existing arithmetic integral part, restricted regulator, rational target and full conjecture are imported by parent IDs. No second K-theory, Deligne or determinant foundation is planned.
- `regulator-determinant-in-betti-coordinates` fixes a signed determinant relative to a rational Betti basis, with frame-change and target-basis formulas.
- `constructed-determinant-witness` describes the exact determinant formula on a constructed subspace, without an implicit finite-rank assumption on the full integral group.
- `full-integral-basis-criterion` identifies real injectivity as the additional condition needed for the whole-group formulation. Rational injectivity and scalar-extended surjectivity are explicitly distinguished.
- `potentially-good-integrality-by-local-descent` supplies a published-input proof route for the parent's unsourced potentially-good integrality claim. Good reduction after a local finite extension, reflection of integral membership, and local-global localisation give the rational equality. This is a derived application of Scholl, not a claim that he prints the exact blanket theorem. The weightwise-to-unweighted supplier step remains explicit.
- The elliptic substitution into DJZ Theorem 8.3(2), with (f=x+12), (m=x-4), exhibits a horizontal rational class with a nontrivial arithmetic obstruction at (2). The Mathlib equation has (c_4=289), discriminant (-561600), and (v_2(j)=-6).
- The Bloch application proves integral membership under potentially good reduction, and universal-regulator nonvanishing only under the explicitly stated ER.2 comparison hypothesis. It proves neither full integral rank nor an automatic rational determinant comparison from a rescaled dilogarithm.

## Confirmed red-team finding

**RT-AREA-ktheory-2/9** is handled by `modularity-supplied-leading-term-limit` and `determinant-witnesses-in-the-two-normalisations`. They explicitly depend on **EllipticCurveModularity:R29.6**, including its named continuation theorem. The stage edge R29.6 → ER.6 was checked against the atlas graph: there is no return path from ER.6 to R29.6.

The exact comparison is (L^*(E,0)=wN(2\pi)^{-2d}L(E,2)), hence the rational coefficient changes by (wN2^{-2d}). For (E/\mathbb Q), modularity supplies the continuation/functional equation; the raw Mathlib series is not its value at zero. The general number-field comparison is conditional on the specified completed continuation and functional equation, with (N=|\operatorname{disc}F|^2\operatorname{Norm}(\mathfrak f_E)). The CM analytic route imports ER.5 and its AL.1 supplier. Nonvanishing at two is explicitly requested for the exact-order conclusion.

## Remaining interfaces and inherited gap

Three requests are recorded in the packet:

1. **EllipticKTheory:E.6:** finite-extension reflection and local-global membership for the full rational (K_2) image, over number fields and their local completions. Scholl gives motivic weightwise statements; justify their sum using the finite Adams-weight decomposition owned by S.6. Retain regular models and the generic-fibre maps.
2. **EllipticCurveModularity:R29.6:** expose the actual continued function, its equality with the Dirichlet series in its convergence region, conductor/root-sign completion, and Euler-product nonvanishing at two. Its existing named theorem already owns the FE transfer.
3. **Tau Ceti EllipticCurves, local-reduction layer:** consume its existing potentially-good predicate with minimisation after base change and its (j)-integrality criterion. E.6, rather than the equation-only layer, supplies the smooth proper model.

One inherited gap is recorded: **ER.2's comparison of Bloch/Brunault symbol normalisation with the M.8 universal Deligne regulator**. It is needed before claiming an explicit Bloch determinant formula in the fixed Betti rational structure. This pass does not discharge that comparison or the parent's other stages. The full rank/isomorphism assertion remains the Beilinson conjecture, not an unfinished proof that another worker should silently supply.

## Sources and verification

Read on 6 October 2026, from public PDFs; source URLs, edition distinctions, hashes and short excerpts are in the packet:

- DJZ, arXiv `math/0405040v2`, §§2–3 and §8 through Theorem 8.3's proof.
- Schappacher–Scholl, author-hosted retypesetting, §§0–1.2.3 and §7.
- Scholl I, author-hosted version, introduction and §1 in full, especially §1.3.3, Corollary 1.3.4 and Proposition 1.3.6.
- Scholl II, arXiv `0710.5453v1`, §1 and §2 through diagram (3). Its ℓ-adic unramified group is never confused with horizontal tame unramifiedness.

The maintainer's private Bloch scan was not available or read. Its class and corrected formula remain imports from the reviewed parent. Upstream style documents read in full: `content/tau-ceti/ArithmeticDirichletSeries/README.md` and `content/tau-ceti/HodgeStructures/README.md`; the elliptic local-reduction layer was also read for the supplier boundary.

Checks:

- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticRegulators--ER.6.json`: **zero errors, zero warnings**, using the configured pinned declaration index.
- `lean-check research/blueprint/suggested/EllipticRegulators--ER.6.lean`: **exit 0**, with only placeholder-proof warnings. Available memory exceeded the required threshold. The file imports only individual Mathlib modules; that tree is exactly the pinned Mathlib commit. No Tau Ceti modules are imported, so this does not claim compilation of missing arithmetic objects or against the shared build's newer Tau Ceti tree.
- Packet API/test names checked against the suggested file; all eleven API items and eight tests are present. New IDs are disjoint from the parent. Combined planet count checked.
- Exact factorisation, invariant values and conductor-factor examples checked arithmetically. Source excerpts are at most 28 characters.
- Deliverable scope and whitespace checked before submission.

The suggested file contains genuine tensor-product and matrix signatures. The arithmetic signatures `potentiallyGoodIntegralityByDescent` and `integralCMClassNonzero` are explicitly omitted at the unavailable higher-object boundary, with their exact statements and hypotheses in the packet and reader. No dummy propositions or fake K-groups stand in for them.

Independent review should check the local descent application and the weightwise supplier requirement, then the fixed rational target/normalisation and precise analytic interface. A follow-up can close ER.6 only after the recorded supplier interfaces and ER.2 comparison are supplied; proving full Beilinson rank is not a condition silently imposed on this planning pass.
