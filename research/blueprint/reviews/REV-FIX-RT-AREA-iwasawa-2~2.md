# REV-FIX-RT-AREA-iwasawa-2~2 — independent review checkpoint

Codex, session `codex-Iu0m4D`, 10 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6098549442).
Input commit `0307aa1f1`. This reviewer did not contribute to Claude's fixes
(`claude-6ZAIEy`). The report replaces the preceding checkpoint with fresh
source, contract, current-library, finite-control and Lean checks. Earlier
review objects are preserved whole in `reviewHistory`.

## Verdict and completion boundary

The bounded L3 corrections are **accepted**. PMIA **needs_changes** to consume
five generic constructions already implemented in current TauCeti. The other
checked corrections are supported within their explicit supplier gaps. A
negative packet verdict completes an independent review; it does not complete
the mathematical revision it requests.

This submission is a **blocked checkpoint**, because the live issue's output
list omits L3-2 and D.1 while the queue requires this job's top-level review
receipts in both. WORKERS.md requires: “Edit only the files the issue names,
plus your own scratch space.” A review-only patch was prepared and explicit
authorization requested in this session. No authorization has arrived. Only
the issue-listed L3 and PMIA receipts are installed; neither omitted packet
nor the queue was edited. The unchanged `issues.deliverables_complete` returns
False; supplying the two prepared receipts in memory returns True.

## Finding-by-finding review

1. **/1 — Morita Gamma and Gross–Koblitz: correction supported.**
   Freshly read [Morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf),
   §1, Lemma 1 and Theorem 1, printed pp.255–256, including images. The natural
   values use the sign `(−1)^n` and omit multiples of p; continuity and both
   recurrence branches determine the extension. At p=2 the naive modulus-4
   congruence fails, whereas the packet's buffered precision avoids that case.
   [Gross–Koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
   §1, (1.2), (1.5), Theorem 1.7, pp.570–571, uses a negative Gauss sum,
   compatible pi, odd p and nonzero exponents. The root congruence must be in
   the integral ring modulo the square of the chosen principal ideal;
   divisibility in a field would erase its content. The exponent-zero sum is
   separate. [Robert 2001](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf),
   Theorems 2–4, pp.162,165,168, supplies the all-prime alternative; those
   formulas and the dyadic bound on pp.167–168 were also inspected as images.
   RD.6 still owes coefficient bounds and the actual trace-splitting identity.
   This is a bounded correction review, not full proof closure.

2. **/2 — Ferrero–Greenberg: correction supported.**
   [Zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf),
   §1.2 p.461 and §4, Theorem 4.1, (4.1)–(4.6), pp.471–473, supports all
   primes, including 2. A primitive odd chi has conductor N>1 prime to p; the
   interpolated branch is the even chi-omega branch. The derivative is the
   weighted Gamma-log sum plus `(1−chi(p)) B1,chi log_p N`. Only chi(p)=1
   eliminates that term. The same logarithm and coefficient embeddings must
   be used throughout. Appendix B, Example B.2 p.474 has the endpoint shift
   addressed by existing E37: the normalized antidifference sums over m<n,
   giving Gamma(x), rather than summing through n. The packet derives the
   first coefficient from bounds, coefficient limits and identification of
   the function; it does not assume the derivative as an analytic input.
   Arithmetic nonvanishing and simple-zero suppliers remain separate. Read
   the normalization, strict-count, differentiation and quartic-control
   contracts and their suggested probes. The full preceding 79-entry audit
   must be archived unchanged when installing this bounded receipt.

3. **/3 — log-syntomic consumers: correction supported.**
   [Ertl–Nizioł v2](https://arxiv.org/pdf/1603.01705v2), §§2.1–2.2 pp.4–8,
   distinguishes the undivided `p^r−phi` complex from the divided `1−phi_r`
   complex, including where their domain ideals coincide. The omega map has
   legs `(p^r,id)`; tau has `(id,p^r)`; each composite is multiplication by
   p^r. Only omega is asserted multiplicative. The modified Tate lattice
   includes the factorial. Theorem 2.2 p.7 gives exact *divided* comparison
   for `0≤i≤r≤p−2`; it cannot supply an exact undivided or universal endpoint
   r=p−1 theorem. [Colmez–Nizioł v4](https://arxiv.org/pdf/1505.06471v4),
   Corollary 3.16 p.37, gives exponential isomorphisms for i≤r−1 and an
   injection at i=r. Theorem 5.4 p.54 distinguishes enough-roots-of-unity
   bounds from the general constant depending on K,p,r.
   [Nekovář–Nizioł v5](https://arxiv.org/pdf/1309.7620v5), Remark 2.14 p.14
   and Proposition 4.13 pp.53–54, fixes the boundary sign and Bloch–Kato
   square. In the EN convention the undivided rational boundary requires
   p^-r normalization. The four D.2 consumers preserve these distinctions.
   CS.0–CS.3 remain proposed external producers; CP.4 is a proper rational
   anchor. D.1 retains nine gaps, twenty requests, seventeen source issues
   and eight planned stages; its full 72-entry audit must remain intact.

4. **/4 — Dasgupta–Kakde algebra: source fixes supported; native reuse needs changes.**
   [DK v3](https://arxiv.org/pdf/2010.00657v3), §§2.2–2.3 pp.15–18,
   Lemma 3.9 pp.25–26, §6.1/Lemma 6.1 p.40 and Appendix B.2,
   (171)–(173), pp.93–94, supports the selected contracts. A character ring
   is an image order, generally smaller than the product; arbitrary such
   orders are not Gorenstein. Finite index, regular determinants, finite
   quotients and positive square size are retained where needed. Sharp goes
   from R_Psi to R_Psi-inverse, and is an endomorphism only for inverse-stable
   character sets. A transpose depends on its presentation and requires the
   stated opposite/contragredient scalar transport. For rectangular compound
   image membership, embed the vector `adj_r(A_J)x` and apply the right-sided
   identity `C_r(A_J)adj_r(A_J)=det(A_J)I`. The printed left-sided identity
   alone does not establish that membership; existing E17 records the repair.
   The current-library duplication below remains a substantive revision.

5. **/5 — compact complexes and derived slopes: restricted routing supported.**
   Freshly read [BCGP21 v3](https://arxiv.org/pdf/1812.09269v3), §6.1.1 p.139
   and Theorem 6.3.16/proof pp.152–153, and [BCGP25 v1](https://arxiv.org/pdf/2502.20645v1),
   §§4.6.46–4.6.49 pp.93–95. LAD distinguishes the representative's finite
   nonalternating Fredholm product from the invariant cohomological support.
   A contractible identity complex can contribute extra raw determinant
   factors. The finite window is perfect only under the stated simultaneous
   factorization and module-theory inputs. Strict equivariant homotopy
   restriction is planned; general comparisons commuting only up to homotopy
   remain a gap. Underived cohomology base change needs Tor/flatness input.
   BCGP25 uses solid derived `f_*f^*` localization and inverse limits, which
   are stronger than monoid inversion or a union of classical finite windows.
   Its Laurent-series counterexample is retained. The two explicit gaps
   “Derived numerical slopes and homotopy-category comparison” and “Stein
   geometry and full analytic solid localization” preserve those obligations.
   This receipt checks that restricted routing; it does not construct the
   full solid or Stein foundations or re-audit the entire LAD packet.

6. **/6 — alleged duplicate main-conjecture proofs: verifier rejection retained.**
   Read the I.5 entry in `restructure/RS-16.result.json`, the associated
   decision in RS-16.md and its accepted independent review REV-RS-16.md.
   Mazur–Wiles/Wiles Hecke and congruence proofs retain distinct arithmetic
   inputs from the cyclotomic Euler-system proof. The accepted ownership
   decision deliberately keeps both methods. A common conclusion does not
   justify deleting either route.

## Native reuse revision

Programme pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and TauCeti `f790474821cf4256814db967cb154e7af3d0c369`. Current read-only
TauCeti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current roadmap main
is `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`. No current checkout was built
or edited. Read ArithmeticDirichletSeries and QuiverRepresentations roadmaps
and the relevant StableReduction interfaces before assessing ownership.

Current TauCeti supplies these exact statements:

- `TauCeti.fittingIdeal`, `RingTheory/FittingIdeal/Basic.lean:343`, defines all
  indices for finite modules. `fittingIdeal_eq_minorsIdeal_ker`, line 350,
  computes them from any finite-free surjection; finite presentation is not
  required.
- `TauCeti.fittingIdeal_baseChange`, `RingTheory/FittingIdeal/BaseChange.lean:134`,
  permits every commutative coefficient algebra without flatness.
- `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`,
  `Algebra/Module/AuslanderReiten/StableTranspose.lean:91`, compares arbitrary
  projective presentations over any ring, without finiteness, as opposite-ring
  modules. Reorder product factors and transport scalars for the PMIA form.

Migrate `higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence`, `higher-fitting-base-change` and
`transpose-stable-equivalence`, together with direct consumers, both
StableReduction requests, the L4 comparison, reader and suggested interfaces.
Keep the adapters for non-generating families and their relation kernels,
order calculations and finite-projective scalar/range transport. The native
kernel theorem cannot be applied as a whole-module Fitting computation when
the family does not generate that module. Retain deficient-relation, nonflat,
constant-rank and nontrivial-ring controls.

At the old pin, the existing transpose and dual APIs are available; the newer
generic modules above are absent. The pinned
`TauCeti.Module.Dual.baseChangeEvaluationEquiv` requires finite generation and
projectivity. The pinned commutative Hopf antipode equivalence and p-adic
unit/norm statements support the other selected adapters. Do not attribute
the new modules to the old pin. A coherent migration also changes the reader,
which is outside this review's live file list, so no partial rewrite is made.

## Fresh validation

All four `scripts/check_blueprint.py` checks pass with zero errors. L3 has
26 inherited short-API warnings; the other three have none. Whole-object JSON
comparisons show that the authorized changes affect only top-level reviews
and append the previous reviews unchanged. No mathematical, coverage, gap,
request or source-issue field changed; no packet contains an `excerpt` key.

Sequential `lean-check` runs at the programme pins give:

| Suggested file | Fresh result |
| --- | --- |
| PMIA | Exit 0; 1,075 `sorry` warnings only. |
| L3-2 | Exit 0; 111 `sorry` warnings only. |
| D.1 | Exit 0; 307 `sorry` warnings only. |
| L3 | Exit 1; missing `research` import before the body. |

No suggested file changed. L3's body was not independently elaborated, and
typing with proof placeholders is not formal proof completion. No libraries
were rebuilt and no Lean processes remain running.

Fresh finite controls passed: 72 buffered signed-Gamma congruences and the
dyadic modulus-4 rejection; 55 FG permutation examples with every filtration
endpoint; 120 strict natural counts; quartic adapter weight/inverse/averaging
rejections; 56 rectangular right-adjugate preimages; deficient-relation and
nonflat mod-2 examples; and three rational weight-two scaling controls. These
finite calculations check the advertised conventions, not infinite analytic
or arithmetic supplier theorems.

Selection: eight L3 Gamma/GK contracts; twenty-nine L3-2 GK/FG contracts;
four D.2 syntomic consumers; nineteen PMIA L6 character-order, compound,
Fitting and transpose contracts; the LAD compact/finite-window consumers and
their two retained gaps. This is not a new exhaustive audit of all 1,663 L3
or 487 PMIA nodes, or every baseline entry.

## Pending review receipts

Once scope is explicitly authorized, append each then-current top-level audit
whole to `reviewHistory`, and install a bounded **accepted** review with
reviewer `independent-review-REV-FIX-RT-AREA-iwasawa-2~2`, the current date and
continuing session attribution in these two paths:

- `research/blueprint/packets/DirichletPadicLFunctions--L3-2.json`: the receipt
  covers finding /2 as assessed above; preserve the full 79-entry audit and
  all five gaps/eight requests, E37 and strict antidifference conventions.
- `research/blueprint/packets/PadicHodgeRegulators--D.1.json`: the receipt
  covers finding /3 and its four D.2 consumers; preserve the full 72-entry
  audit and every mathematical and planning field.

Then run the four packet checkers, review-history/non-review-field preservation
assertions, intake file checks and the real completion predicate. Require
True before reporting this review job complete. PMIA remains `needs_changes`.
Fix the live dispatch scope before sending another worker to this unchanged
blocker; the bounded receipts do not require another exhaustive source audit.

## Source and file receipts

Public PDFs were fetched on 10 October 2026. No book copy or source passage
was added to the repository. Hashes identify the exact versions read.

| Source | SHA-256 |
| --- | --- |
| morita | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| gross-koblitz | `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522` |
| robert | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |
| zhao | `923b85f7e3e7e55b4636ff98be2ca5f11a469ec10abe1ee15d6ede55a6936661` |
| dasgupta-kakde | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |
| ertl-niziol | `131f6cf4ef32b15ceed8951eb48068c4f01fd13e6d3f42972b20e23b643c0d14` |
| colmez-niziol | `3ab4456e31b5a6c7f21349b34fe020f619f4233a92a2f0105a1ffe2c3e1733ec` |
| nekovar-niziol | `97f319e286aa4cf5be1b9c8d100efd1ac779e985d91d8cd6b70e2a3d0870ebd0` |
| bcgp21 | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` |
| bcgp25 | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |

Unchanged suggested-file hashes:

| File | SHA-256 |
| --- | --- |
| DirichletPadicLFunctions--L3 | `46fe3cba63b8c88eb0e0d734e8138009d421aac3fae334b70116b8f31da1af85` |
| DirichletPadicLFunctions--L3-2 | `d8be865820fe7491d3bd196c4a47c78e753595786bd939e8328ac20b121fa2a2` |
| PadicHodgeRegulators--D.1 | `6398a506a4195e0f606576e60253f412d5be2cb30b6c39f455439777f9acfee8` |
| PadicMeasuresIwasawaAlgebras | `85f103506252ce8d18359d5b8610365132592e4286e182acf0760857fbde1bc5` |
