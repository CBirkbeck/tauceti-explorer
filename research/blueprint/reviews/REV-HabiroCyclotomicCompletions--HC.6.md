# Independent review: HC.6 interfaces and acceptance examples

**Verdict: accepted.** Job `REV-HabiroCyclotomicCompletions--HC.6`, issue #6414, reviewed on 2026-10-05 by Codex (GPT-6), session `codex-6EzLTP`. The submitted plan was written by the different session `codex-I5hn5G`; this reviewer did not write or review that submission or its parent packet.

The follow-up closes the retained classical HC.6 interface by importing three nodes from the independently accepted parent packet. It adds no mathematical object requiring a second definition, API or planet. This is consistent with the reviewed AUDIT-17 classification of HC.6 as a process/interface layer, the accepted RS-10 narrowing, and the checker's explicit allowance for stages realised in another packet of the same roadmap. Acceptance concerns the plan and the suggested signatures. All implementation statuses remain unchecked.

## Counts and changes

| Item | Result |
|---|---|
| New definitions, constructions, lemmas and theorems | 0 of each |
| New comparison/application nodes | 0 of each |
| Imported HC.6 nodes | 1 comparison, 2 applications; all verified |
| New node API items, definition unit tests and planets | 0 of each; these remain with HC.1–HC.5 |
| Distinct suppliers named in target coverage | 26; identifiers and statements checked |
| Baseline declarations | 17; all independently confirmed, none removed or replaced |
| Suggested examples | 39; all elaborated |
| Independent exact arithmetic checks | 75 passed |
| New nodes, source findings, gaps and requests | 0 of each |
| Coverage and packet status | HC.6 closed; packet complete |

No mathematical statement, hypothesis, source locator or suggested signature needed correction. The changes are all recorded here:

1. Replaced the 17 baseline `checked` records with this review's independent verification, preserving their references, statements and modules.
2. Renamed the last target-coverage heading from “Source ledger and executable suggested-file boundary” to “Source ledger and suggested Lean signatures”. The examples are specifications proved with placeholders, not implementations of the proposed mathematics.
3. Extended the coverage note to make the supplier boundaries explicit. Closing this interface does not discharge the parent non-Noetherian Taylor-injectivity gap, construct the HR.2 derived theory, or prove the HB.6 arithmetic comparison.
4. Added the independent `review` object with one verified entry for each imported HC.6 node, and a separate validation record.

The suggested file and reader document were read and agree with the finite acceptance specifications. Neither needed an edit. No parent node, other packet, source finding, roadmap document, atlas data or application file is changed.

## Scope, ownership and coverage

Read the HC.6 stage description, the original roadmap document, the HC.6 reader and handoff, the three parent nodes, the 26 named suppliers, the parent gaps, the reviewed library audit, RS-10 and its accepted round-2 review, the HB.6 comparison node, the HR.2 completion node, and the QT.4 consumer description. AdicSpaces and EllipticCurves supplied the two upstream style examples required by the protocol.

RS-10 was accepted by `independent-review-REV-RS-10~2` on 2026-09-29. Its HC.6 entry moves the arithmetic comparison for the number field Q to HB.6 and keeps the classical interface and acceptance examples. The arithmetic ring for Q uses integral or localized integral coefficients; the classical cyclotomic completion with coefficient ring Q is the separate HC.5 product example. There is no new HC.6 prerequisite in HB.6 and no number-field prerequisite added to QT.4. The old arithmetic-comparison sentence in the base stage description is superseded by the accepted restructuring.

| Retained target | Verified supply and boundary |
|---|---|
| Rings, finite quotients and projections | HC.1 completion, finite-quotient and topology nodes provide compatible families, surjective projections, principal kernels, completeness and continuous lifting. The empty quotient is the zero ring. |
| Restriction and coefficient change | HC.1 supplies the two commuting functorialities. No tensor/inverse-limit interchange is asserted. |
| Normalization and finite arithmetic | HC.1 factorial/cofinality nodes and HC.2 expansion/algorithm nodes supply the digit bounds and quotient correctness. Odd factorial products are replaced by their monic associates when using Mathlib remainder. |
| Values, Taylor coefficients and re-expansion | HC.3 supplies evaluation, integral Hasse coefficients, naturality and convergent p-adic translation. General evaluation requires a cyclotomic root; the separate finite divisibility example only needs a positive d with the d-th power of the element equal to 1. |
| Integral rigidity and non-surjectivity | HC.4 supplies these statements under its stated hypotheses. The HC.6 tests use Z and its finite cyclotomic extensions, which are Noetherian. The parent gap for arbitrary non-Noetherian domains is retained with its owner. Arbitrary infinite-set evaluation is not exported as a proved theorem. |
| Modules and the derived boundary | HC.5 supplies ordinary completion of coefficient-polynomial modules. Its product description explains exactness. The Laurent-module comparison imports HR.2's derived completion; it neither assumes exactness for arbitrary Laurent-polynomial modules with torsion nor rebuilds their completion. |
| Localized, rational and characteristic-two examples | HC.5 supplies the component limits; HC.6 supplies their finite acceptance representatives. A single finite idempotent calculation is not used as proof of an infinite decomposition. |
| Sources and Lean boundary | Exact versions and four canonical source corrections are recorded; the 39 examples test existing polynomial operations without a private completion type. |

The three imported nodes form a dependency graph with 37 transitive mathematical nodes and only library-reference terminals. Expanding all 26 coverage suppliers reaches 42 nodes; the extra stage terminals are DD.1 and EnhancedDerivedSheaves E0/E1 through the explicitly imported HR.2 theory. Both graphs were checked for cycles. This graph check is separate from the mathematical statement and hypothesis checks above; it does not certify that the suppliers' whole roadmaps are closed. HC.6's retained acceptance obligations are discharged by the named classical suppliers and examples, so its closed process-stage coverage is appropriate. No duplicate definition or generic theorem is introduced to satisfy this bookkeeping layer.

## Source verification

The two downloaded PDFs match the packet's SHA-256 digests exactly. Both were read on 2026-10-05:

- Habiro, [*Cyclotomic Completions of Polynomial Rings*, publisher version](https://ems.press/content/serial-article-files/40881), Publ. RIMS 40 (2004), 1127–1146, digest `f56094672ada5ba71bbce69785be8c9d1377807c937b1011b1004f51dbf3071f`. Checked the imported excerpts in §1 p.1128, Conjecture 6.1 and Proposition 7.1 p.1141, §7.3 p.1144, the proof of Proposition 7.4(1) p.1145, and §7.5 pp.1145–1146. Also read §3.1 pp.1130–1131 and Theorem 5.2 with its proof pp.1137–1138 for the completion and integral injectivity assumptions.
- Garoufalidis–Scholze–Wheeler–Zagier, [*The Habiro ring of a number field*, arXiv:2412.04241v2](https://arxiv.org/pdf/2412.04241v2), digest `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9`. Checked §§1.3–1.4 pp.4–7, §5.1 pp.59–62, and Examples 5.6–5.7 p.66, including (334), (338) and (339). The coordinate change between additive and multiplicative variables is retained.
- Checked the imported [OEIS A022493](https://oeis.org/A022493) title, initial data and generating-function entry. Its numbers agree with the independent Taylor computation; no combinatorial theorem about them is needed by this stage.

The four `sourceIssueReferences` were checked against the exact passages and their canonical confirmed review records: PAPER-GSWZ E74 (the reversed root-vanishing inequality), E77 (p-adic completion versus tensoring when a prime is inverted), E82 (finite-level coefficient base change), and HabiroNumberFields E22 (the attribution of the gluing-image characterization). The packet uses their corrections and does not introduce a duplicate finding. Its `sourceIssues` list is empty, so there is no new finding requiring a verdict. No required source was inaccessible.

## Pinned baseline verification

Read every actual declaration, its namespace and surrounding variables at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The local source checkout has that exact full commit. The following are the complete baseline list, grouped by module:

| Mathlib module | Declarations confirmed | Required behavior |
|---|---|---|
| `Algebra/Polynomial/Eval/Defs.lean` | `Polynomial.eval` | Evaluation in the coefficient semiring. |
| `Algebra/Polynomial/Taylor.lean` | `Polynomial.taylor`, `Polynomial.taylor_coeff`, `Polynomial.taylor_coeff_zero` | Translation by X plus the constant; coefficients are evaluated Hasse derivatives, including the constant term. No factorial inversion. |
| `Algebra/Polynomial/Div.lean` | `Polynomial.modByMonic` | Monic remainder; returns the original polynomial for a nonmonic divisor. |
| `RingTheory/Polynomial/Cyclotomic/Basic.lean` | `Polynomial.cyclotomic`, `Polynomial.cyclotomic_one`, `Polynomial.cyclotomic_two`, `Polynomial.cyclotomic_three` | Integral base change and the small-order polynomials, including characteristic two. |
| `RingTheory/AdjoinRoot.lean` | `AdjoinRoot`, `AdjoinRoot.mk`, `AdjoinRoot.root`, `AdjoinRoot.mk_eq_mk` | Polynomial quotient, canonical root and equality iff the difference is divisible by the quotient polynomial. |
| `RingTheory/Localization/Away/Basic.lean` | `IsLocalization.Away`, `IsLocalization.Away.invSelf`, `IsLocalization.Away.mul_invSelf` | Existing localization class and inverse of the inverted element. Applied to 2 in a commutative Z-algebra. |
| `Data/ZMod/Defs.lean` | `ZMod` | Existing coefficient type; the suggested file imports its ring API through `Data/ZMod/Basic`. |

The package's baseline also records Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. There are no Tau Ceti baseline entries or Tau Ceti imports in this part's suggested file. The shared Tau Ceti source is newer; it was not used to verify a Tau Ceti citation or to prototype a replacement for an existing API. The reviewed audit contains no mathematical HC.6 construction to plan anew; its suppliers own the missing completion theory.

## Arithmetic and Lean validation

The exact calculation was implemented independently in scratch using rational coefficient vectors, polynomial addition/multiplication, long division, binomial Taylor coefficients, and separate reduction/division modulo 2. It passed 75 checks. The repetitions across precisions are consistency checks, not additional packet nodes or definition tests. They covered:

- Empty precision and leading signs; quotient compatibility, the telescoping inverse and the normalized product with the factorial series for precisions 0–12; the normalized square modulo precision 4.
- Values at all six small cyclotomic orders, independently compared with a longer truncation; ten coefficients at 1, seven at −1 and three at a cube root.
- Both localized representatives, their compatibility, idempotence, odd/even CRT components and complement's Taylor/value test; the rational representatives' idempotence, tangent component, other components and nonzero remainder; all four characteristic-two assertions.

The localized divisions use monic polynomials up to sign, so starting with denominators that are powers of 2 produces witnesses in Z[1/2], not merely in Q. For general positive d, each factor with index divisible by d contributes a factor X minus the specified root. Counting these factors proves the suggested precision divisibility; quotient compatibility then proves Taylor stabilization. The unit obstruction is its zero value at 1, and the divergent geometric partial sums have distinct integer values there. These arguments check the symbolic examples that cannot be established by bounded numerical tests alone.

With 95 GB available before compilation, ran `lean-check research/blueprint/suggested/HabiroCyclotomicCompletions--HC.6.lean`. Exit status 0; exactly 39 warnings for declarations using placeholders, and no other diagnostics. The imports are individual Mathlib modules. The file preserves the standard note, asserts no implementation, and introduces no proposition-valued stand-in for an unavailable condition. Signature elaboration and the independent arithmetic checks remain distinct evidence.

Ran `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCyclotomicCompletions--HC.6.json` on the final packet: **0 errors, 0 warnings**. No library build, cache download or language server was started.

## Handoff to the orchestrator

No HC.6 revision or additional HC.6 follow-up is requested. Keep the accepted RS-10 ownership boundary: HB.6 performs the arithmetic rational-field comparison; the parent HC.4 jobs retain their general-domain gaps and refinements. This review does not clear those gaps or certify HR.2, the parent suggested file or any implementation. The accepted review identifier is `independent-review-REV-HabiroCyclotomicCompletions--HC.6`.
