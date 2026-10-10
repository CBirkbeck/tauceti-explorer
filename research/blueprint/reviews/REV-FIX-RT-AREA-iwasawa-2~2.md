# REV-FIX-RT-AREA-iwasawa-2~2 — independent review checkpoint

Codex, session `codex-7tHQKP`, 10 October 2026.
[Issue #6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219);
[bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6096970616).
Input atlas: `f9d4c17fd933f5012756238a55f02350f8a21fd0`.
This reviewer performed none of the fixes and took no second job.

**The mathematical review supports the retained bounded verdicts, but the job
cannot finish within the live issue's file scope.** Its queue requires review
records in two packets the issue does not authorize editing. No authorization
arrived after the scope question. The actual queue completion predicate is
False; an overlay with the two concrete proposed edits makes it True.
This is a scope-blocked checkpoint, not a complete submission.

This continuation independently rechecked the source formulas, selected
contracts and compiler results below; it found no reason to change the
preceding mathematical dispositions. The [preceding report and its earlier
ledgers](https://github.com/CBirkbeck/tauceti-explorer/blob/f9d4c17fd933f5012756238a55f02350f8a21fd0/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md)
retain their original attribution. The existing packet reviews and their
whole review histories are unchanged, including D.1's full 72-entry independent
regulator review. Refreshing the two named receipts cannot resolve this job.

## Findings and bounded verdicts

Read all six original findings, the verifier's dispositions and the round-two
fix report. Fresh checks below concern the selected fixes and their source,
API, test and ownership boundaries; they are not a new full audit of 1,663 L3
nodes, 487 PMIA nodes, LAD or the cyclotomic main-conjecture proofs.

1. **Morita Gamma and Gross–Koblitz: selected fix contracts supported.**
   [Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf),
   §1, Lemma 1 and Theorem 1, printed pp.255–256, supports the signed natural
   product and its continuous extension. The modulus-4 case at p=2 is
   exceptional; unit-valuedness does not prove period four. Both unit and
   nonunit recurrence branches, uniqueness by density and native unit-valued
   continuity remain separate obligations.
   [Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
   §1, (1.2), (1.5) and Theorem 1.7, pp.570–571, uses a negative Gauss sum
   and the compatible root congruence in the integer ring. Its odd-prime,
   nontrivial-character theorem is distinct from the trivial character.
   [Robert](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf),
   Theorems 2–4, pp.162,165,168, gives the separate all-prime route. The dyadic
   estimate retains the binary digit sum, and the comparison keeps the two
   exact RD.6 coefficient-bound and splitting-value inputs unclosed. Scanned
   formulas were inspected as images; the uncleared Robert book was not used.

2. **Ferrero–Greenberg: supported after one source-locator correction.**
   [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
   §1.2 p.461 and §4, Theorem 4.1, (4.1)–(4.6), pp.471–473, supports every
   prime, primitive odd χ of conductor N>1 prime to p and the even branch χω.
   The formula retains the conductor term:
   `L′p(χω,0) = Σa χ(a) logp Γp(a/N) + (1−χ(p))B1,χ logp N`.
   Equivalently its correction is `−(1−χ(p))L(0,χ) logp N`.
   Appendix C's odd-prime hypothesis does not restrict §4. At χ(p)=1 the
   conductor term vanishes; nonvanishing and a simple zero still need the
   separate arithmetic suppliers. Appendix B.2 p.474 has an incompatible
   inclusive endpoint. The packet already uses the strict endpoint and
   log Γp(x), but `rjw2-fg-log-antidifference` cites E34 instead of
   `DirichletPadicLFunctions/E37`. The prepared edit changes only that locator,
   retaining the sourceIssue and the mathematical statement. It is not installed.

3. **Integral/open log-syntomic comparison: four consumer contracts supported.**
   [Ertl–Nizioł](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2 pp.4–8,
   Proposition 2.1 and Theorems 2.2–2.3; [Colmez–Nizioł](https://arxiv.org/pdf/1505.06471v4),
   Corollary 3.16 p.37 and Theorem 5.4 p.54; and
   [Nekovář–Nizioł](https://arxiv.org/pdf/1309.7620v5), Remark 2.14 p.14 and
   Proposition 4.13 pp.53–54, support the corrected interfaces. Undivided
   `Fib(p^r−φ)` and divided `Fib(1−φr)` have distinct differentials.
   The directed maps ω and τ have p^r composites; only ω is asserted
   multiplicative. EN's factorial-modified twist and its explicit comparison
   with CN's twist are retained. Exact divided comparison is restricted to
   `0≤i≤r≤p−2`; the undivided all-weight comparison has the stated bounded
   kernel/cokernel and roots hypotheses. There is no exact r=p−1 endpoint.
   Rational comparison retains the raw boundary's p^r scale and the normalized
   boundary's NN exponential sign. Proper semistable and local degree ranges
   are distinct. D.2 consumes these producers; CS.0–CS.3 remain proposed early
   CohomologyComparisons Part II contracts after CR.5/CR.6. CP.4 is a routing
   anchor, not evidence that the producers exist. The verifier's ownership
   correction is preserved.

4. **Dasgupta–Kakde algebra: mathematical fixes supported; native reuse needs changes.**
   [DK v3](https://arxiv.org/pdf/2010.00657v3), §§2.2–2.3 pp.15–18,
   Lemma 3.9 pp.25–26, §6.1/Lemma 6.1 p.40 and Appendix B.2, (171),
   pp.93–94, supports the selected L6 fixes. Character rings are image
   orders, not full products; # maps RΨ to the inverse-character order.
   Quadratic presentations have positive size. Cardinality descent requires
   determinant regularity in the overring; reduction by a finite ideal uses
   injectivity on that ideal. Rectangular extension matrices retain their
   relation-generation and sign conditions. Compound image membership uses
   the adjugate on the right to supply a preimage. A transpose belongs to a
   presentation; the zero-module non-example already requires nontrivial R.
   Current Tau Ceti supplies five generic nodes that PMIA still replans:
   `higher-fitting-ideal`, `relation-minors-add-generator`,
   `higher-fitting-independence`, `higher-fitting-base-change`, and
   `transpose-stable-equivalence`. The migration must update their consumers,
   both StableReduction requests, L4 comparison, reader and suggested
   interfaces together. The reader lies outside this review's scope. Retain
   matrix/kernel adapters, order calculations, nonflat and deficient-relation
   controls, finite-projective dual/base-change transport and explicit rank,
   scalar and range hypotheses. An inconsistent partial migration is not accepted.

5. **Derived finite slopes: routed plan supported with explicit gaps.**
   Read the current LAD finite-perfect, strict equivariant homotopy,
   derived-base-change and classical/solid finite-window contracts and both
   relevant gap entries. Its representative product of degree Fredholm series
   is distinguished from invariant cohomological support. Underived
   cohomology base change still needs extra hypotheses. The current gaps are
   “Derived numerical slopes and homotopy-category comparison” and “Stein
   geometry and full analytic solid localization.” Strict U-equivariant
   homotopies do not prove the comparison for maps commuting only up to
   homotopy; compact finite windows do not supply full solid localization.
   This confirms the recorded routing, not closure of those stronger inputs.

6. **Independent main-conjecture proof routes: retain verifier rejection.**
   Read the RS-16 decision, its I.5 ownership entry and accepted independent
   review. Historical Mazur–Wiles/Wiles Hecke and congruence methods and the
   Kolyvagin–Rubin Euler-system route are intentionally separate methods.
   Equality of their eventual conclusion is not a reason to delete either
   route or regard their arithmetic prerequisites as already proved.

## Exact scope and library boundary

The fresh L3 selection has prefix `DirichletPadicLFunctions:L3/`:
`morita-natural-values`, `morita-natural-congruence`, `morita-gamma`,
`morita-gamma-functional-equation`, `morita-gamma-unique`,
`gross-koblitz-integral-pi-existence`, `gross-koblitz-negative-gauss-zero`,
`robert-gross-koblitz-comparison`. It does not certify the later
Gross–Koblitz multiplication/Hecke-character construction.

The 29 L3-2 contracts comprise the three `rjw2-gk-` root nodes, all 25
`rjw2-fg-` nodes and `rjw2-ferrero-greenberg`. The four D.2 nodes are
`log-syntomic-complex`, `fontaine-messing-kato-period-map`,
`small-twist-comparison`, `syntomic-exponential`. The PMIA selection is every
node with `parentStageId = PadicMeasuresIwasawaAlgebras:L6` (50 nodes).
Their statements, proof sketches, prerequisites and relevant API/tests were
read. The baseline verification here is bounded to the native transpose,
finite-projective dual and current Fitting/stable-comparison interfaces below;
it is not a fresh audit of every baseline entry. No full-packet proof closure
follows from these bounded checks.

Programme pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
Read the pinned transpose carrier, quotient/scalar API and finite-projective
`TauCeti.Module.Dual.baseChangeEvaluationEquiv`; the latter requires both
finite generation and projectivity. Current read-only Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current roadmap main:
`48cda9fcc5dbdc8f8d51e717f6a3090e0c4cd688`. Relevant StableReduction and
QuiverRepresentations contracts and native modules were inspected; neither
checkout was modified or built.

Current `TauCeti.fittingIdeal` (`FittingIdeal/Basic.lean:343`) works for finite
modules and all indices. Its kernel/minors independence and
`FittingIdeal/BaseChange.lean:134` base change do not require a flat ring map.
`TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`
(`AuslanderReiten/StableTranspose.lean:91`) compares arbitrary projective
presentations over any ring without finiteness or minimality. To use it here,
swap P0 and Q1 in the left dual summand and transport opposite scalars through
σ. These newer modules are absent at the programme pin; that does not license
planning them again when current main already contains them.

The shared Lean environment's `AuslanderReiten/Transpose.lean` and
`LinearAlgebra/Dual/BaseChange.lean` were compared byte for byte with their
`f790474` Git blobs in the current read-only checkout; both match. Its
Mathlib manifest names the full `082e2d3` pin. The three newer Fitting and
stable-transpose module paths were independently checked absent at `f790474`.
Thus the old baseline and current-main reuse obligation are distinguished
by actual source versions, rather than by a declaration-name search alone.

## Checks and corrections in this run

All four original packets pass `scripts/check_blueprint.py`: zero errors;
26 inherited short-API warnings in L3 and none in the other three.
Both proposed omitted-packet edits also pass with zero errors and warnings.
An exact comparison verifies that they alter only review/history and the one
L3-2 locator; the D.1 predecessor is archived whole, including 72 checked entries.

Original suggested files checked with `lean-check` at the pins:

| Suggested file | Result |
| --- | --- |
| `DirichletPadicLFunctions--L3-2.lean` | Success; 110 `sorry` warnings only. |
| `PadicHodgeRegulators--D.1.lean` | Success; 307 `sorry` warnings only. |
| `PadicMeasuresIwasawaAlgebras.lean` | Success; 1,075 `sorry` warnings only. |
| `DirichletPadicLFunctions--L3.lean` | Fails at the unavailable local `research` module prefix, before its body. |

No suggested file was edited. Earlier conditional assembly checks are their
original authors' results, not standalone L3 elaboration in this run. No compiler
remains running. The eight public PDFs were fetched anew. Their SHA-256
digests are:

| Source | SHA-256 |
| --- | --- |
| Morita | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| Gross–Koblitz | `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522` |
| Robert 2001 | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |
| Zhao | `923b85f7e3e7e55b4636ff98be2ca5f11a469ec10abe1ee15d6ede55a6936661` |
| DK v3 | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |
| EN v2 | `131f6cf4ef32b15ceed8951eb48068c4f01fd13e6d3f42972b20e23b643c0d14` |
| CN v4 | `3ab4456e31b5a6c7f21349b34fe020f619f4233a92a2f0105a1ffe2c3e1733ec` |
| NN v5 | `97f319e286aa4cf5be1b9c8d100efd1ac779e985d91d8cd6b70e2a3d0870ebd0` |

No restricted book or source passage was copied into the repository.

Repository changes in this run are this consolidated report and the handoff.
Existing packet reviews are retained, not relabelled as this session's work.
The exact pending edits, completion reproduction and remaining PMIA work are
in the [handoff](../handoff/REV-FIX-RT-AREA-iwasawa-2~2.md).
