# Review of PAPER-BHATT-SCHOLZE-22

**Job** REV-PAPER-BHATT-SCHOLZE-22 (issue #1104) · **Date** 2026-09-23 · Claude Code, session
`cc-7b31c4` · **Verdict: accept.** All three routes accepted; all four `sourceIssues` confirmed;
nothing corrected, rejected or deleted.

Paper: Bhargav Bhatt and Peter Scholze, *Prisms and prismatic cohomology*,
[Ann. of Math. **196** (2022), 1135–1275](https://doi.org/10.4007/annals.2022.196.3.5); read in
arXiv [1905.08229](https://arxiv.org/abs/1905.08229) v4, whose hash reproduces as
`1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`.

## Statuses

**83 of 96 items are `planned` and only 12 missing.** As in
REV-PAPER-CARAIANI-SCHOLZE-24, that ratio is the thing to check first, and it is right for the same
reason: `PrismaticCohomology` PR.0–PR.8 was designed **from this paper**. I read those layer
descriptions in full earlier today while reviewing AUDIT-38, and they cite BS22 by section and
theorem throughout — δ-rings and prisms with the perfection theorem 3.9 in PR.0, the relative site
and the Hodge–Tate comparison 6.3 in PR.1, Construction 7.6 and the discreteness statements 7.7–7.10
in PR.2, the Lη_I factorisation of §15 in PR.3, §16's q-crystalline theory and Theorem 17.2 in PR.6.
So 74 of the 83 planned items land in the roadmap built for them, and the rest in
`DerivedDeRhamCohomology`, `AInfCohomology`, `RefinedTraceMethods` and `PerfectoidQuotients`, which
own what is sent to them. All **26** distinct planned layer ids exist.

The **12 missing items** go to three source routes whose five stages all exist: PR.2 for the derived
extension and quasisyntomic descent, `PerfectoidQuotients` Q2/Q4 for universal perfectoidization and
the surjectivity theorem, and `PerfectoidSpaces` P0/P3 for the almost mathematics and almost purity
the paper consumes. The single library item cites `WittVector`, `WittVector.frobenius`,
`verschiebung` and `teichmuller`, all in Mathlib at the pin.

## Locators

Of the 145 checks, **142 land on exactly the page given** once the locators' two-place form is
parsed properly. These locators habitually cite both the introduction and the body in one string —
"Theorem 13.1, Lemma 13.2 and Theorem 1.14 (3), Remark 1.15, **pp. 7–8 and 94–95**" — which is a
virtue, not a defect: the introduction is where each theorem is announced in the form the roadmap
quotes. The three remaining cases are multi-part statements whose cited part falls on the next page,
Example 1.9 opening on p. 5 with its parts (3) and (4) on p. 6.

## The four recorded mistakes

All four are printed exactly as quoted, and all four are typographic.

- **E4**, Theorem 1.8(3) on p. 4: "of commutative **algberas** in D(A)".
- **E1**, Corollary 15.4 on p. 104: "…there is a canonical isomorphism of E_∞-algebras in
  D(X_ét, A/I), Δ_{X/A} ⊗̂^L_{A,φ} A/I ≅ **Ω*_{R/(A/I)}**", where the statement quantifies over a
  smooth formal A/I-scheme X and no ring R is introduced anywhere.
- **E3**, Remark 2.37 (pp. 24–25): "…and thus coincides with the ring ℤ_(p){x, φ(x)/p} ≃
  **D_(x)(ℤ_(p))** above", where Lemma 2.36, which the remark comments on, gives
  D_(x)(ℤ_(p){x}) — and x is not an element of ℤ_(p).
- **E2**, Example 7.12 on p. 61: "In particular, the natural map **A/ItoD/IC** factors over the
  p-completely étale A/I-algebra R_∞." The diagnosis is right and is confirmed elsewhere in the
  paper: an unescaped `to` in math mode typesets as the italic product of two letters, and the same
  slip is visible on p. 104 as "by **Construction6.1to** crystalline A".

## What this review did not do

- The published Annals text was not compared; the extraction reads arXiv v4 and says so.
- The thirteen prerequisites were read only as this paper cites them.
- No Lean file was written or compiled; the only library claim is the four Witt-vector citations.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BHATT-SCHOLZE-22.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the result, the report, the review JSON and this file: no problems.
