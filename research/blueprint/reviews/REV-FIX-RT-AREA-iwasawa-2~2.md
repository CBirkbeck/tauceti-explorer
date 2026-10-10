# REV-FIX-RT-AREA-iwasawa-2~2 — independent review checkpoint

Codex, session `codex-pQ6N1v`, 10 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6097730847).
Initial input `7357c4a73ecbe366ebb59079f1509eda955c122c`; updated input
`5cf3e3cc49802c9c4f3b0beee2e565dc34fc91b1` incorporates the concurrently
merged full L3-2 review. This reviewer did not write the Claude fixes.

## Verdict and completion boundary

Installed this session's bounded top-level fix reviews in the two packets
named by the live issue: L3 is **accepted** and PMIA **needs_changes**.
Their preceding complete review objects are archived unchanged in
`reviewHistory`. Packet mathematics and suggested interfaces were not altered.
Acceptance concerns the checked fixes, not implementation or supplier closure.

The review job remains blocked on an issue/queue scope mismatch. The unchanged
queue additionally requires L3-2 and D.1 packets to name this fix-review job
at the top level; the live issue does not permit editing either packet.
[WORKERS.md](../WORKERS.md) restricts edits to the files the issue names.
An explicit scope clarification was requested; none has arrived. The actual
`issues.deliverables_complete(job)` returns **False**. A scratch overlay
substituting only the two exact proposed packets returns **True**. PMIA's
negative verdict counts as a completed review and is not this scope blocker.
Do not alter the queue to bypass the mismatch, or redispatch the unchanged job.

## Findings checked

1. **Morita Gamma and Gross–Koblitz: checked fixes supported.**
   [Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf),
   §1, Lemma 1/Theorem 1, printed pp.255–256, supplies the signed dense
   natural values and continuity argument. The finite constructor omits
   multiples of p; it is not a factorial. The exceptional dyadic modulus is
   retained: G₂(1)=−1 and G₂(5)=−3 disagree modulo 4. The buffered precision
   avoids that exception. The native continuous unit-valued construction,
   uniqueness and unit/nonunit recurrence match the source convention.
   [Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
   §1, equations (1.2), (1.5) and Theorem 1.7, pp.570–571, fixes the negative
   Gauss sum and compatible root of −p. Congruence modulo (ζ−1)² belongs
   in the integral ring; divisibility in the field would erase its content.
   Its original scope is odd primes and nontrivial exponents.
   [Robert 2001](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf),
   Theorems 2–4, pp.162,165,168, gives the separate all-prime comparison.
   L3's RD.6 coefficient-bound and actual trace-splitting inputs stay explicit;
   the consumer does not prove them by assuming its final Gauss identity.
   Scanned formulas were inspected as images. No unread book was used.

2. **Ferrero–Greenberg: checked correction supported; receipt awaits scope.**
   [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
   §1.2 p.461 and §4, Theorem 4.1/equations (4.1)–(4.6), pp.471–473,
   permits all primes, including 2. The primitive odd character has conductor
   N>1 prime to p; the analytic branch is the even χω branch. With the common
   logarithm normalized at p, its derivative contains the Gamma sum plus
   (1−χ(p))B₁,χ logₚN. The χ(p)=1 specialization removes that term;
   nonvanishing and order-one conclusions require their separate arithmetic
   inputs. Appendix B, Example B.2 p.474 needs the strict upper endpoint m<n
   and Gamma argument x, as recorded by E37. The concurrently merged full
   review corrected E34 to E37, repaired the count reindexing, added a quartic
   character-sum control and strengthened the Lean antidifference and
   differentiation probes. Those changed contracts were inspected here.
   The antidifference now includes normalization, strict natural sums and
   uniqueness; differentiation derives the analytic expansion from coefficient
   limits, a common bound and pointwise identification. The pending draft
   expands E37's locator to its full roadmap id and preserves the entire
   preceding 79-entry review. No arithmetic nonvanishing input is discharged.

3. **Integral/open log-syntomic interface: corrected consumers supported.**
   [Ertl–Nizioł v2](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2 pp.4–8,
   distinguishes the undivided pʳ−φ complex from the divided 1−φᵣ complex,
   even when the domain ideals agree. The directed ω/τ maps have respectively
   (pʳ,id) and (id,pʳ) legs, with composites pʳ; only ω is multiplicative.
   The modified integral twist includes the factorial factor. Exact divided
   comparison is restricted to 0≤i≤r≤p−2. The undivided comparison has bounded
   kernel/cokernel, not arbitrary-weight integral equality.
   [Colmez–Nizioł v4](https://arxiv.org/pdf/1505.06471v4), Corollary 3.16 p.37
   and Theorem 5.4 p.54, retains the degree/range and roots-of-unity dependence
   of those bounds. [Nekovář–Nizioł v5](https://arxiv.org/pdf/1309.7620v5),
   Remark 2.14 p.14 and Proposition 4.13 pp.53–54, fixes the rational boundary
   sign and normalized exponential comparison under its geometric hypotheses.
   D.1 records four consumer contracts. CP.4 is a proper rational routing
   anchor, not a constructed integral/open producer; CS.0–CS.3 remain proposed
   external inputs after the crystalline prerequisites. All nine gaps, twenty
   requests, seventeen source issues and eight planned stages remain unchanged.
   The pending receipt archives the whole preceding 72-entry regulator audit.

4. **Dasgupta–Kakde algebra: source corrections supported; native reuse needs changes.**
   [DK v3](https://arxiv.org/pdf/2010.00657v3), §§2.2–2.3 pp.15–18,
   Lemma 3.9 pp.25–26, §6.1/Lemma 6.1 p.40 and Appendix B.2,
   equations (171)–(173) pp.93–94, supports the selected algebra.
   Character rings are image orders, with finite-index hypotheses for the
   cardinality comparison. Sharp sends the character set to its inverse set;
   it is an endomorphism only when that set is inverse-stable. Square
   presentations have positive size, and cardinality descent needs regularity
   and finite quotient hypotheses. In the exterior-power image argument,
   multiply the target by the higher adjugate first and then embed it among
   the selected columns: the right-sided identity supplies a preimage.
   The printed left multiplication alone does not show image membership.
   Transposes remain attached to presentations, with contragredient scalar
   transport; the zero-module counterexample explicitly needs a nontrivial ring.
   Five generic PMIA nodes still duplicate current Tau Ceti. Their coordinated
   migration below is required; a partial edit would leave the reader and
   interfaces inconsistent. PMIA therefore remains `needs_changes`.

5. **Derived finite slopes: routing supported, stronger inputs remain gaps.**
   Read LAD's current compact-complex representative, representative Fredholm
   product, finite-perfect window, strict equivariant homotopy, derived base
   change and classical/solid finite-window contracts. The raw degree-product
   series is representative-dependent; invariant cohomological support is a
   different conclusion. Underived cohomology base change needs further
   flatness or Tor hypotheses. The current gaps “Derived numerical slopes
   and homotopy-category comparison” and “Stein geometry and full analytic
   solid localization” retain comparisons commuting only up to homotopy and
   the full solid localization theorem. This checks the recorded routing
   and its limits, not a new independent proof of those external inputs.

6. **Main-conjecture proof routes: verifier rejection retained.**
   Read RS-16's I.5 ownership decision and its accepted independent review.
   Mazur–Wiles/Wiles Hecke and congruence arguments are intentionally retained
   independently of the cyclotomic Euler-system method. Their common eventual
   conclusion does not make either proof route or its arithmetic inputs redundant.

## Bounded selections and native reuse

The L3 selection is `morita-natural-values`, `morita-natural-congruence`,
`morita-gamma`, `morita-gamma-functional-equation`, `morita-gamma-unique`,
`gross-koblitz-integral-pi-existence`, `gross-koblitz-negative-gauss-zero`,
`robert-gross-koblitz-comparison` under `DirichletPadicLFunctions:L3/`.
L3-2 includes all three `rjw2-gk-`, all twenty-five `rjw2-fg-` and
`rjw2-ferrero-greenberg` nodes, twenty-nine in total. D.1 includes the four
`PadicHodgeRegulators:D.2/` nodes `log-syntomic-complex`,
`fontaine-messing-kato-period-map`, `small-twist-comparison`,
`syntomic-exponential`.

The central PMIA selection under `PadicMeasuresIwasawaAlgebras:L6/` comprises
`sharp-involution`, `contragredient-dual`, `quadratic-presentation`,
`fitting-quadratic`, `higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence`, `higher-fitting-base-change`,
`quadratic-cardinality`, `compound-matrix`, `higher-adjugate`,
`presentation-transpose`, `transpose-stable-equivalence`, `transpose-fitting`,
`transpose-higher-fitting`. Related character-image and compound-image
interfaces were inspected. Selected statements, source hypotheses, dependencies,
proof sketches, APIs, tests and relevant Lean signatures were compared.
This is not a new exhaustive audit of L3's 1,663 or PMIA's 487 nodes. Earlier
complete audits keep their own attribution in the packet histories and Git.

Programme pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read the pinned Mathlib
p-adic norm/unit/divisibility statements, the native opposite-ring transpose
carrier and the finite-projective dual/base-change equivalence. The latter
requires finite generation and projectivity; it is not a general dual/tensor
commutation assertion. Read the relevant reviewed library-coverage entries.

Current read-only Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; roadmap main is
`39200cfdcc19dbfeb09ffa3154f721eb56977e92`.
`TauCeti.fittingIdeal` in `RingTheory/FittingIdeal/Basic.lean:343` covers finite
modules and all indices. Its `fittingIdeal_eq_minorsIdeal_ker` computes from
any finite-free surjection, and `fittingIdeal_baseChange` in
`RingTheory/FittingIdeal/BaseChange.lean:134` allows arbitrary coefficient
algebras without flatness. `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`
in `Algebra/Module/AuslanderReiten/StableTranspose.lean:91` compares arbitrary
projective presentations over any ring, with no finiteness assumption. Reorder
P₀ and Q₁ and transport opposite scalars to specialize it to the PMIA interface.
The three newer Fitting/stable-transpose modules are absent at the programme pin;
the older transpose and dual-base-change declarations exist there. Relevant
StableReduction and QuiverRepresentations contracts were read; neither current
checkout was modified or built.

Migrate `higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence`, `higher-fitting-base-change` and
`transpose-stable-equivalence`, together with their direct consumers, both
StableReduction requests, L4 comparison, reader and suggested interfaces.
Retain matrix/kernel adapters, order computations, finite-projective scalar/range
transport and the nonflat, deficient-relation, rank and nontriviality controls.
The reader is outside this issue's scope; these are precise remaining revisions.

## Validation and exact pending receipts

All four original packets pass `scripts/check_blueprint.py` with zero errors:
L3 has twenty-six inherited short-API warnings; the others have none. Both
updated authorized packets and the two proposed packets also pass. Exact JSON
comparisons confirm unchanged mathematical data, gaps, requests, source issues
and coverage, except the proposed full E37 locator. Earlier review objects are
preserved whole, including the newer L3-2 audit and D.1's 72 checked entries.
Small finite controls independently verify Gamma signs/the modulus-4 failure,
translated prime-power blocks and the nonflat mod-2 higher-Fitting example.

Sequential `lean-check` at the pins, with memory checked before compiling:

| Suggested file | Result |
| --- | --- |
| L3-2, updated after the concurrent merge | 111 proof-placeholder warnings only; no errors. |
| D.1 | 307 proof-placeholder warnings only; no errors. |
| PMIA | 1,075 proof-placeholder warnings only; no errors. |
| L3 | Stops at line 1: unknown module prefix `research`, before its body. |

The earlier L3-2 input separately passed with 110 placeholder warnings. No
suggested file was edited by this session. No standalone L3 body elaboration
or proof closure is claimed, and no compiler is left running.

The following receipts are **uninstalled proposals**. They are preserved here
because scratch is removed after submission. After scope authorization, archive
the entire then-current top review in `reviewHistory`, install a bounded receipt
with the continuing reviewer's attribution, and expand the E37 locator to
`DirichletPadicLFunctions/E37` if still needed. Preserve the newer full L3-2
review, its mathematical corrections and 79 checked entries; never restore
this run's older snapshot over a concurrent update.

`research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`:

```json
{
  "status": "accepted",
  "reviewer": "independent-review-REV-FIX-RT-AREA-iwasawa-2~2",
  "date": "2026-10-10",
  "notes": "Independent bounded fix review by Codex, session codex-pQ6N1v, following and archiving the entire independent-review-REV-DirichletPadicLFunctions--L3-2 audit, including its 79 checked entries, and earlier fix-review reports. Checked all 29 rjw2-gk-/rjw2-fg-/rjw2-ferrero-greenberg contracts against Zhao section 1.2 p.461 and section 4 Theorem 4.1, equations (4.1)-(4.6), pp.471-473, plus Appendix B p.474. Inspected the newly merged normalization/strict-sum/uniqueness and coefficient-limit differentiation probes and quartic finite-sum test. All-prime scope, conductor N>1 prime to p, primitive odd chi and even chi-omega branch, conductor correction term, common logarithm and strict antidifference endpoint are retained. Nonvanishing and simple-zero arithmetic suppliers remain separate gaps. Expanded only the already corrected Zhao antidifference locator E37 to DirichletPadicLFunctions/E37, without changing its mathematics. All five gaps, eight requests, sourceIssue and coverage remain. Original checker: zero errors/warnings. Original suggested file: 111 proof-placeholder warnings only. This bounded fix receipt does not certify every baseline entry or close all 79 nodes."
}
```

`research/blueprint/packets/PadicHodgeRegulators--D.1.json`:

```json
{
  "status": "accepted",
  "reviewer": "independent-review-REV-FIX-RT-AREA-iwasawa-2~2",
  "date": "2026-10-10",
  "notes": "Independent bounded fix review by Codex, session codex-pQ6N1v, following and preserving the entire independent-review-REV-PadicHodgeRegulators--D.1~2 audit unchanged in reviewHistory, including its 72 checked entries. Checked the four D.2 consumers log-syntomic-complex, fontaine-messing-kato-period-map, small-twist-comparison and syntomic-exponential against Ertl-Niziol sections 2.1-2.2 pp.4-8, Colmez-Niziol Corollary 3.16 p.37 and Theorem 5.4 p.54, and Nekovar-Niziol Remark 2.14 p.14 and Proposition 4.13 pp.53-54. Preserve distinct divided/undivided complexes, directed omega/tau legs, factorial-modified twists, exact divided range through p-2, bounded undivided comparison, rational exponential normalization/sign and proposed external CS.0-CS.3 producer contracts. All 17 sourceIssues, nine gaps, twenty requests and eight planned stages remain. Original checker: zero errors/warnings. Original suggested file: 307 proof-placeholder warnings only. This bounded consumer review neither replaces the full regulator audit nor certifies construction of its integral/open producers."
}
```

## Source versions

The eight public PDFs were fetched anew and the cited loci read; SHA-256:

| Source | SHA-256 |
| --- | --- |
| zhao | `923b85f7e3e7e55b4636ff98be2ca5f11a469ec10abe1ee15d6ede55a6936661` |
| en | `131f6cf4ef32b15ceed8951eb48068c4f01fd13e6d3f42972b20e23b643c0d14` |
| cn | `3ab4456e31b5a6c7f21349b34fe020f619f4233a92a2f0105a1ffe2c3e1733ec` |
| nn | `97f319e286aa4cf5be1b9c8d100efd1ac779e985d91d8cd6b70e2a3d0870ebd0` |
| dk | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |
| morita | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| gk | `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522` |
| robert | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |

No source passages or restricted files were copied into the repository.
The [handoff](../handoff/REV-FIX-RT-AREA-iwasawa-2~2.md) records the precise
scope correction and remaining PMIA migration.
