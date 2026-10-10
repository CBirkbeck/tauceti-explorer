# REV-FIX-RT-AREA-iwasawa-2~2 — independent review checkpoint

Codex (GPT-6), session `codex-066pQU`, 10 October 2026. Refs #6219.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6097972417).
Input `cd3293a621c3b3fc1ae0c3168bd61ad2b6fc41f0`. This reviewer did not write
Claude's fixes. This continues the `codex-pQ6N1v` checkpoint with fresh source,
library, finite-control and Lean checks; earlier complete audits retain their
attribution in `reviewHistory` and Git.

## Verdict and actual blocker

The authorized L3 fix receipt is **accepted**. The authorized PMIA receipt is
**needs_changes** because five generic targets duplicate current Tau Ceti.
Both preceding review objects were archived whole and unchanged. No packet
mathematics, coverage, gap, request, source issue or suggested file was changed.
These are bounded fix reviews, not exhaustive new audits or implementation claims.

Queue completion is **False**. The live issue permits editing L3 and PMIA,
but `queue.json` also requires top-level fix-review receipts in L3-2 and D.1.
Their current top reviews name their separate full audits. In
[issues.py](../issues.py), `deliverables_complete` requires this job's reviewer
id in every packet output; a negative verdict is a valid completed review.
Thus PMIA's mathematical revision is separate from the queue scope blocker.

[WORKERS.md](../WORKERS.md) says: “Edit only the files the issue names, plus your
own scratch space.” Scope authorization for the two omitted packets was
requested and has not arrived. Neither those packets nor the queue was edited.
An in-memory substitution of just their reviewer receipts makes the unchanged
completion predicate True. Correct the live scope before redispatching this job.

## The six findings

1. **Morita Gamma / Gross–Koblitz — checked correction supported.**
   [Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf),
   §1, Lemma 1 and Theorem 1, printed pp.255–256, supports the signed product
   omitting multiples of p, continuous extension, uniqueness and recurrence.
   The dyadic modulus-4 exception matters: G₂(1)=−1 and G₂(5)=−3 are not
   congruent modulo 4. The retained buffered precision avoids it.
   [Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
   §1, (1.2), (1.5), Theorem 1.7, printed pp.570–571, fixes the negative Gauss
   sum, nontrivial additive character, compatible root of −p, odd-prime scope
   and nonzero exponent range. Root congruence belongs in the integral ring;
   field divisibility loses the condition. The trivial negative Gauss sum is
   treated separately. [Robert 2001](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf),
   Theorems 2–4, printed pp.162,165,168, supplies the separate all-prime route.
   RD.6's coefficient bounds and actual trace-splitting identity remain explicit
   supplier obligations. Scanned formulas were inspected as images.

2. **Ferrero–Greenberg — checked correction supported; receipt outside live scope.**
   [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
   §1.2 p.461 and §4, Theorem 4.1, (4.1)–(4.6), pp.471–473, permits every
   prime, including 2. The primitive odd χ has conductor N>1 prime to p; the
   L-function branch is the even χω branch. Its derivative includes
   Σχ(a)logₚΓₚ(a/N)+(1−χ(p))B₁,χ logₚN. Only χ(p)=1 removes the conductor
   term. Arithmetic nonvanishing and order-one claims retain separate inputs.
   Appendix B, Example B.2 p.474 requires the strict endpoint m<n and Γₚ(x),
   recorded by E37. The newer full 79-node audit already repaired the old E34
   locator and count shift. Checked its normalization/uniqueness and strict-sum
   Lean probe, coefficient-limit differentiation probe and quartic-character
   test. The analytic expansion is a conclusion from bounds, coefficient limits
   and pointwise identification, not an assumed final derivative.

3. **Integral/open log-syntomic consumers — checked correction supported; receipt outside live scope.**
   [Ertl–Nizioł v2](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2, pp.4–8,
   distinguishes the undivided pʳ−φ and divided 1−φᵣ complexes even where
   their domain ideals agree. The ω and τ maps have respectively (pʳ,id) and
   (id,pʳ) legs; their composites are pʳ. Only ω is asserted multiplicative.
   The modified Tate lattice includes a factorial. Exact divided comparison
   has range 0≤i≤r≤p−2; it is not an exact undivided comparison.
   [Colmez–Nizioł v4](https://arxiv.org/pdf/1505.06471v4), Corollary 3.16 p.37
   and Theorem 5.4 p.54, preserves the exponential range and the dependence of
   bounded comparison on roots of unity and K,p,r. [Nekovář–Nizioł v5](https://arxiv.org/pdf/1309.7620v5),
   Remark 2.14 p.14 and Proposition 4.13 pp.53–54, fixes the rational boundary
   sign and Bloch–Kato square. The raw undivided boundary needs the recorded
   p⁻ʳ normalization in the EN period convention. Checked the four D.2
   contracts and their proposed external CS.0–CS.3 producers. CP.4 is the
   proper rational routing anchor; it does not supply integral/open producers.
   D.1's nine gaps, twenty requests, seventeen source issues and eight planned
   stages remain. Its 72-entry full audit must be preserved whole.

4. **Dasgupta–Kakde algebra — source corrections supported; native reuse needs changes.**
   [DK v3](https://arxiv.org/pdf/2010.00657v3), §§2.2–2.3 pp.15–18,
   Lemma 3.9 pp.25–26, §6.1/Lemma 6.1 p.40 and Appendix B.2,
   (171)–(173), pp.93–94, supports the selected ring algebra. Character rings
   are image orders; cardinality arguments require finite index, a regular
   determinant and finite quotient. Square presentations have positive size.
   Sharp maps RΨ to RΨ⁻¹ and is an endomorphism only for an inverse-stable set.
   To establish compound-image membership, apply the right-sided adjugate to
   the target and extend that preimage along the selected columns. The printed
   left-sided identity alone is insufficient (existing E17). Transposes belong
   to presentations, with opposite/contragredient scalar transport; the
   nonzero zero-module counterexample requires a nontrivial ring.
   The current native reuse revision below remains necessary.

5. **Compact perfect complexes and derived slopes — routing supported within its stated limits.**
   Read LAD's compact representative, representative Fredholm product,
   finite-perfect window, strict equivariant homotopy, derived base change and
   classical/solid finite-window contracts. The raw degree-product series is
   representative-dependent; cohomological invariant support is a separate
   statement. Underived cohomology base change requires additional Tor or
   flatness hypotheses. “Derived numerical slopes and homotopy-category
   comparison” and “Stein geometry and full analytic solid localization” keep
   the general homotopy comparison and full solid localization inputs open.
   This checks the fix's routing, not construction of those external inputs.

6. **Main-conjecture proof routes — verifier rejection retained.**
   Read RS-16's I.5 ownership decision and its accepted independent review.
   The Mazur–Wiles/Wiles Hecke and congruence route and the cyclotomic
   Euler-system route retain different arithmetic inputs and proof structure.
   Their shared final conclusion does not establish redundancy.

## Review selections and library reuse

L3: `morita-natural-values`, `morita-natural-congruence`, `morita-gamma`,
`morita-gamma-functional-equation`, `morita-gamma-unique`,
`gross-koblitz-integral-pi-existence`, `gross-koblitz-negative-gauss-zero`,
`robert-gross-koblitz-comparison` under `DirichletPadicLFunctions:L3/`.
L3-2: all three `rjw2-gk-`, twenty-five `rjw2-fg-` and
`rjw2-ferrero-greenberg` nodes, twenty-nine total. D.1: the four
`PadicHodgeRegulators:D.2/` consumers `log-syntomic-complex`,
`fontaine-messing-kato-period-map`, `small-twist-comparison`, `syntomic-exponential`.

PMIA: selected L6 character-image and regularity contracts, `sharp-involution`,
`contragredient-dual`, `quadratic-presentation`, `fitting-quadratic`,
`higher-fitting-ideal`, `relation-minors-add-generator`, `higher-fitting-independence`,
`higher-fitting-base-change`, `quadratic-cardinality`, `compound-matrix`,
`higher-adjugate`, `compound-image-determinant`, `presentation-transpose`,
`transpose-stable-equivalence`, `transpose-fitting`, `transpose-higher-fitting`.
Statements, hypotheses, prerequisite chains, sketches, definition APIs/tests and
relevant suggested signatures were compared. This is not a new exhaustive audit
of L3's 1,663 or PMIA's 487 nodes, nor of every baseline citation.

Programme pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read the pinned
p-adic norm/unit statements, Hopf antipode equivalence, opposite-ring transpose
carrier/API and `TauCeti.Module.Dual.baseChangeEvaluationEquiv`; the dual
isomorphism requires finite generation and projectivity. Read the relevant
reviewed library coverage and the complete current ArithmeticDirichletSeries
and QuiverRepresentations roadmaps, plus StableReduction's relevant contracts.

Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Current roadmap main: `670582c502e1d4497d9ccd492b36c67028ef6666`.
No current checkout was modified or built. Read these exact current statements:

- `TauCeti.fittingIdeal`, `RingTheory/FittingIdeal/Basic.lean:343`, covers finite
  modules and every index. `fittingIdeal_eq_minorsIdeal_ker` at line 350 computes
  it from any finite-free surjection; finite presentation is unnecessary.
- `TauCeti.fittingIdeal_baseChange`, `RingTheory/FittingIdeal/BaseChange.lean:134`,
  works for any commutative coefficient algebra, without flatness.
- `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`,
  `Algebra/Module/AuslanderReiten/StableTranspose.lean:91`, compares arbitrary
  projective presentations over any ring, without finiteness. Reorder P₀,Q₁
  and transport opposite scalars to obtain the commutative PMIA specialization.

Migrate the five generic nodes `higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence`, `higher-fitting-base-change`,
`transpose-stable-equivalence` with their direct consumers, both StableReduction
requests, L4 comparison, reader and suggested interfaces. Keep matrix/kernel
adapters, order computations, finite-projective scalar/range transport and
nonflat, deficient-relation, rank and nontriviality controls. The reader is
outside the live issue's scope, so this review retains `needs_changes` rather
than leaving a partial migration. Current declarations are not credited to the
old pin, at which the newer generic modules are absent.

## Fresh validation

All four packet checkers pass with zero errors. L3 has 26 inherited short-API
warnings; the other three have no warnings. Before/after JSON comparisons show
that only the two authorized top reviews and appended whole review-history
objects changed. All four packets contain no `excerpt` fields.

Independent finite controls passed: 120 buffered signed-Gamma congruences;
64 native permutation examples with all filtration endpoints; exact natural
counts and quartic-character weighted count correction; deficient-relation
and nonflat mod-2 Fitting examples; the rectangular adjugate preimage; and
rational weight-two boundary rescaling. These support the finite contracts,
not the unresolved arithmetic or geometric suppliers.

Sequential `lean-check`, with available memory checked before each compile:

| Suggested file | Result |
| --- | --- |
| PMIA | Exit 0; 1,075 proof-placeholder warnings only. |
| L3-2 | Exit 0; 111 proof-placeholder warnings only. |
| D.1 | Exit 0; 307 proof-placeholder warnings only. |
| L3 | Exit 1; unavailable `research` module prefix at line 1, before its body. |

No Lean file changed, no standalone L3-body elaboration is claimed, and no
compile from this session remains running. Only `lean-check` was used; no library was rebuilt.

## Receipts to install after scope authorization

Archive each then-current top review **whole**, including checked entries,
before installing these bounded receipts. Preserve newer mathematical changes;
do not restore old snapshots. These proposals were tested only in memory.

`research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`:

```json
{
  "status": "accepted",
  "reviewer": "independent-review-REV-FIX-RT-AREA-iwasawa-2~2",
  "date": "2026-10-10",
  "notes": "Independent bounded fix review by Codex (GPT-6), session codex-066pQU, following the full independent-review-REV-DirichletPadicLFunctions--L3-2 audit, whose entire object and 79 checked entries must be archived unchanged. Checked all 29 selected GK/FG contracts against Zhao section 1.2 p.461, section 4 Theorem 4.1 and equations (4.1)-(4.6) pp.471-473, Appendix B Example B.2 p.474, and inherited Morita/GK conventions. Retain all-prime scope, primitive odd conductor N>1 prime to p, even chi-omega branch, conductor correction, common log, normalized strict antidifference, coefficient-limit differentiation and quartic control. Nonvanishing and simple-zero suppliers remain explicit gaps. No packet mathematics, sourceIssue, coverage, gap or request changed. Original checker: zero errors/warnings; fresh original lean-check: 111 proof-placeholder warnings only. This receipt accepts the bounded fixes, not all suppliers or a new full 79-node audit."
}
```

`research/blueprint/packets/PadicHodgeRegulators--D.1.json`:

```json
{
  "status": "accepted",
  "reviewer": "independent-review-REV-FIX-RT-AREA-iwasawa-2~2",
  "date": "2026-10-10",
  "notes": "Independent bounded fix review by Codex (GPT-6), session codex-066pQU, following the full independent-review-REV-PadicHodgeRegulators--D.1~2 audit, whose entire object and 72 checked entries must be archived unchanged. Checked the four D.2 log-syntomic/period/small-weight/exponential consumers against Ertl-Niziol v2 sections 2.1-2.2 pp.4-8, Colmez-Niziol v4 Corollary 3.16 p.37 and Theorem 5.4 p.54, and Nekovar-Niziol v5 Remark 2.14 p.14 and Proposition 4.13 pp.53-54. Retain distinct divided/undivided complexes, directed omega/tau legs, factorial-modified twist, exact divided range through p-2, bounded undivided comparison and rational boundary normalization/sign. The CS.0-CS.3 producers remain proposed external inputs; CP.4 supplies only the proper rational routing anchor. No sourceIssue, coverage, gap, request or stage changed. Original checker: zero errors/warnings; fresh original lean-check: 307 proof-placeholder warnings only. This receipt does not claim construction of the integral/open suppliers or a new complete regulator audit."
}
```

The [handoff](../handoff/REV-FIX-RT-AREA-iwasawa-2~2.md) records resumption.
All cited public PDFs were fetched anew on 10 October 2026. No source passages
or restricted files were copied into the repository.

## Source version receipts

| Public source | SHA-256 |
| --- | --- |
| morita | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| gross-koblitz | `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522` |
| robert | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |
| zhao | `923b85f7e3e7e55b4636ff98be2ca5f11a469ec10abe1ee15d6ede55a6936661` |
| dasgupta-kakde | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |
| ertl-niziol | `131f6cf4ef32b15ceed8951eb48068c4f01fd13e6d3f42972b20e23b643c0d14` |
| colmez-niziol | `3ab4456e31b5a6c7f21349b34fe020f619f4233a92a2f0105a1ffe2c3e1733ec` |
| nekovar-niziol | `97f319e286aa4cf5be1b9c8d100efd1ac779e985d91d8cd6b70e2a3d0870ebd0` |
