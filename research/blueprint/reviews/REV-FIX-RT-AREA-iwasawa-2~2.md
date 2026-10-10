# Independent fix review: REV-FIX-RT-AREA-iwasawa-2~2

Latest continuation: Codex, session `codex-eh5SHn`, 10 October 2026,
input `e9e4af08c`, branch `codex-eh5SHn-review-iwasawa`.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6099006386).
The bounded checks below retain the preceding review and its negative PMIA
verdict. Dispatch still prevents the two missing review receipts; this is a
checkpoint, not a finished review job.

Codex, session `codex-x3M7Sz`, 10 October 2026. Refs #6219.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6098734409).
The input is commit `31c60725c`. I did not write the fixes by
`claude-6ZAIEy`. This continues the preceding `codex-Iu0m4D` review with
fresh source readings, selected contract checks, current-library comparisons,
finite controls and four sequential Lean checks. It does not replace the
older exhaustive audits with a claim to have repeated them.

## Verdicts and scope

The bounded L3 source corrections are **accepted**. PMIA **needs_changes**
because generic Fitting and stable-transpose results now exist in Tau Ceti.
Findings /2 and /3 support bounded accepted receipts for L3-2 and D.1;
finding /5 preserves restricted routing with explicit gaps; the verifier's
rejection of finding /6 remains correct. Acceptance here concerns the fixes
and preserves the packets' existing mathematical and compilation limits.

There is a dispatch blocker independent of those verdicts. The live issue
names only L3 and PMIA packets, whereas the queue also requires this job's
reviewer in L3-2 and D.1. WORKERS.md says: “Edit only the files the issue
names, plus your own scratch space.” A concrete review-only patch for the two
omitted packets was prepared and explicit scope authorization requested.
Until authorization arrives, those two files remain unchanged. The report
and handoff describe the receipts so they can be installed without another
full source audit. The completion predicate currently returns False.

## /1 — Morita Gamma and Gross–Koblitz

**The correction is supported within its stated suppliers.** Read
[Morita, §1, Lemma 1 and Theorem 1, pp.255–256](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf)
against the natural product, continuity, uniqueness and recurrence contracts.
The product has sign `(−1)^n` and includes exactly the positive integers below
n prime to p. In particular its values at 0 and 1 are 1 and −1. The extension
is a continuous function on the native p-adic integers with unit values;
the unit and nonunit recurrence branches must both be present. At p=2,
arguments 1 and 5 show why unbuffered congruence modulo 4 fails. The packet's
buffered precision avoids using that false uniform claim.

Read [Gross–Koblitz, §1, (1.2), (1.5), Theorem 1.7,
pp.570–571](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf),
including formula images. The original route uses odd p, a prime-to-p
conductor and nonzero exponent classes, with the negative Gauss-sum
convention. Its chosen root satisfies both the power equation and the
congruence relative to the chosen primitive root. That congruence is in the
integral ring modulo `(zeta−1)^2`; field divisibility would impose no useful
condition. The zero exponent is handled separately, with negative sum 1.

[Robert 2001, Theorems 2–4, pp.162,165,168, and estimates
pp.167–168](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf)
gives the separate all-prime route, including the dyadic estimate. I inspected
the formula images because text extraction drops the equations. The packet
continues to require RD.6's actual coefficient bounds and trace-splitting
identity; those requirements are not discharged by naming the final formula.
No Robert book copy was used. No mathematical correction was needed in these
selected contracts.

## /2 — Ferrero–Greenberg and the strict endpoint

**The correction is supported.** Read
[Zhao, §1.2 p.461, Theorem 4.1 and (4.1)–(4.6)
pp.471–473, Appendices A–B pp.473–474](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf).
The relevant character is primitive and odd, has conductor N>1 prime to p,
and determines the even chi-omega p-adic branch. The scope includes p=2,
with its dyadic omega convention. All logarithms and coefficient embeddings
must agree. The general derivative contains the weighted Gamma-log sum plus
`(1−chi(p)) B_(1,chi) log_p N`; the shortened formula requires chi(p)=1.
It cannot be used for an arbitrary character or with inverse-character or
averaged weights substituted silently.

The normalized Gamma-log antidifference uses the strict interval m<n and
returns Gamma(x). Example B.2's inclusive endpoint would instead shift the
argument. Existing source issue E37 and the packet's strict-count statements
preserve the repair. The differentiation contract obtains the first Taylor
coefficient from bounds and coefficient limits, rather than assuming the
derivative as an input. Nonvanishing and the simple-zero conclusion still
need their separate arithmetic suppliers.

The proposed L3-2 receipt is bounded to these fix contracts and follows the
existing independent 79-entry audit. Installing it must archive that audit
whole and retain all five gaps, eight requests and E37. Its accepted status
would not certify that the inherited supplier gaps have been solved.

## /3 — Integral and rational log-syntomic consumers

**The correction is supported.** Read
[Ertl–Nizioł v2, §§2.1–2.2 pp.4–8, especially Theorem 2.2
p.7](https://arxiv.org/pdf/1603.01705v2),
[Colmez–Nizioł v4, Corollary 3.16 p.37 and Theorem 5.4
p.54](https://arxiv.org/pdf/1505.06471v4), and
[Nekovář–Nizioł v5, Remark 2.14 p.14 and Proposition 4.13
pp.53–54](https://arxiv.org/pdf/1309.7620v5), against the four D.2 consumers.

The undivided complex is the fibre of `p^r−phi`; the divided one uses
`1−phi_r` and the divided ideal. Coinciding domain ideals in the small range
do not identify these differentials. Omega from undivided to divided has
legs `(p^r,id)`, and tau in the reverse direction has `(id,p^r)`; their
composites multiply by p^r. Only omega carries the asserted multiplicativity.
The modified Tate lattice includes `p^a a!`, where
`r=(p−1)a+b` and `0≤b<p−1`; it is not the same convention as a p-power alone.

Exact divided comparison has `0≤i≤r≤p−2`. The undivided comparison has
bounded p-power kernel and cokernel, with the source's distinct enough-roots
and general K-dependent bounds. It does not give a universal exact theorem
at r=p−1. The exponential is an isomorphism through i≤r−1 and injective at
i=r. Rational transport through omega requires p^-r normalization of the
undivided boundary, together with the Nekovář–Nizioł sign convention.

CS.0–CS.3 remain proposed external producers. CP.4 supplies a proper rational
anchor, not the entire integral/open construction. The proposed D.1 receipt
archives its previous independent 72-entry audit, retains nine gaps, twenty
requests, seventeen source issues and all eight planned stages, and certifies
only these correction contracts.

## /4 — Character orders, Fitting ideals and transposes

**The source corrections are supported; native reuse needs changes.** Read
[Dasgupta–Kakde v3, §§2.2–2.3 pp.15–18, Lemma 3.9
pp.25–26, §6.1 and Lemma 6.1 p.40, Appendix B.2 (171)–(173)
pp.93–94](https://arxiv.org/pdf/2010.00657v3).
A character group ring is the image of joint evaluation, which can be a
proper order in the product. Its definition does not include a Gorenstein
assumption. The finite-index, determinant-regularity, finite-quotient and
positive square-size hypotheses remain explicit at the applications that
need them. Sharp maps `R_Psi` to `R_(Psi inverse)` and is an endomorphism only
for an inverse-stable set. A transpose belongs to its presentation and needs
the opposite/contragredient scalar transport.

For rectangular compound image membership, take an m-column submatrix A_J,
embed `adj_r(A_J)x` into the larger exterior-coordinate space and use
`C_r(A_J) adj_r(A_J) x = det(A_J)x`. The left-sided identity printed in the
source alone does not give that preimage. Existing E17 retains this repair.
Singular submatrices are allowed in the polynomial identity; no inverse is
introduced to bypass that case.

The programme pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. At that Tau Ceti pin I read the
existing transpose carrier and presentation transport in
`Algebra/Module/AuslanderReiten/Transpose.lean`, and the local-field
Teichmuller statements. At the Mathlib pin I read the p-adic unit/norm and
finite-projective dual statements used by the selected adapters.

Current read-only Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, and current roadmap main is
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`. Reading the current
ArithmeticDirichletSeries, QuiverRepresentations and StableReduction
interfaces and the actual declarations confirms these stronger suppliers:

| Current declaration | Statement needed by the revision |
| --- | --- |
| `TauCeti.fittingIdeal`, `RingTheory/FittingIdeal/Basic.lean:343` | All indices for finite modules, without a finite-presentation requirement. |
| `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, same file:350 | Computation from any finite-free surjection onto the module. |
| `TauCeti.fittingIdeal_baseChange`, `RingTheory/FittingIdeal/BaseChange.lean:134` | Base change along every commutative coefficient algebra; no flatness requirement. |
| `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`, `Algebra/Module/AuslanderReiten/StableTranspose.lean:91` | Arbitrary projective presentations over any ring, as opposite-ring modules, without finiteness. |

The newer Fitting and StableTranspose modules are absent at the programme pin,
as checked directly in git. They must not be attributed to that older pin.
Under the standing current-library reuse rule, replace the generic plans in
`higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence`, `higher-fitting-base-change` and
`transpose-stable-equivalence` with imports and the necessary adapters.
Update their direct consumers, both StableReduction requests, the L4
comparison, reader and suggested interfaces together. Reordering product
factors and transporting the opposite-ring action supplies the PMIA stable
transpose form; it does not require a new generic proof.

Retain the order calculations, non-generating-family relation kernels and
matrix adapters, finite-projective transport, and deficient-relation,
nonflat and constant-rank controls. A family that does not generate M is not
a surjection to M, so the native kernel theorem cannot compute M's Fitting
ideal from that family. The reader needed for a coherent migration lies
outside this live review scope. I therefore record the precise revision in
`needs_changes`, without a partial mathematical rewrite.

## /5 — Compact complexes and derived finite slopes

**Restricted routing is supported, with the existing gaps retained.** Read
[BCGP21 v3, §6.1.1 p.139 and Theorem 6.3.16 with its proof
pp.152–153](https://arxiv.org/pdf/1812.09269v3), and
[BCGP25 v1, §§4.6.46–4.6.49 pp.93–95](https://arxiv.org/pdf/2502.20645v1).
LAD keeps the finite nonalternating Fredholm product of a chosen representative
separate from invariant cohomological support. Adding an acyclic identity
complex changes that raw product by two determinant factors. The algebraic
perfectness assertion concerns a selected finite window with simultaneous
factorization and finite-projective module inputs. Its homotopy restriction
uses strict equivariant maps; an arbitrary comparison commuting only up to
homotopy remains an obligation. Cohomology base change also needs the stated
flatness or vanishing-Tor input.

BCGP25's finite-slope functor is solid derived `f_*f^*`, reconstructed by
inverse limits over analytic affinoid exhaustions. Monoid inversion or a
union of classical windows does not supply it; the Laurent-series nonexample
makes that distinction concrete. LAD retains the gaps “Derived numerical
slopes and homotopy-category comparison” and “Stein geometry and full analytic
solid localization”. No LAD file was edited, and this review does not claim
the full solid foundations have been constructed.

## /6 — Independent main-conjecture proof routes

**The verifier's rejection is upheld.** The integrated accepted RS-16
`IntegralIwasawaTheory:I.5` decision, its reader and review deliberately retain
the Mazur–Wiles/Wiles Hecke and congruence methods alongside the cyclotomic
Euler-system method. Their common arithmetic conclusion does not make their
proof inputs interchangeable. Shared carriers and normalizations can be
imported while keeping the independent routes. No corrective edit is needed;
this verdict does not assert that either proof decomposition is closed.

## Validation and changes made

All four packet checkers exit 0 with zero errors. L3 has 26 inherited
short-API warnings; the other three have none. These are structural checks,
not an exhaustive fresh audit of all baseline declarations. The targeted
pinned statements and current-library statements were inspected separately.

| Suggested file | Sequential `lean-check` result |
| --- | --- |
| DirichletPadicLFunctions--L3 | Exit 1: missing `research` module prefix during import resolution. The body was not elaborated. |
| DirichletPadicLFunctions--L3-2 | Exit 0; 111 `sorry` warnings and no other warnings. |
| PadicHodgeRegulators--D.1 | Exit 0; 307 `sorry` warnings and no other warnings. |
| PadicMeasuresIwasawaAlgebras | Exit 0; 1,075 `sorry` warnings and no other warnings. |

The L3 header already identifies the missing prototype dependency artifacts.
No suggested file changed. No library build, update or cache fetch was run,
and no Lean language server was started. Placeholder elaboration checks types;
it does not prove the statements.

Fresh finite falsification controls passed: 108 buffered signed-Gamma
congruences and the modulus-4 rejection; 29 Ferrero–Greenberg permutation
examples with 5,921 congruence and 52,448 strict-filtration checks; 236 strict
natural counts; exact quartic-character weight and carry controls; 234
rectangular right-adjugate preimages including singular cases; redundant and
deficient relations, non-generating families and nonflat mod-2 base change;
two stable-transpose summand checks; and directed syntomic cone composites
and rational scaling. The contractible Fredholm example also distinguishes
representative products from cohomological support. These finite calculations
cannot prove the infinite analytic or arithmetic supplier theorems.

Only the live issue's L3 and PMIA review objects were refreshed, appending
both previous reviews whole to `reviewHistory`. No source, node, prerequisite,
API, test, gap, request, coverage or source-issue field was changed. The report
and handoff were updated. No packet has an `excerpt` key, and no source passage
or book file was put in the repository. The two omitted receipt patches are
pending scope authorization.

## Source versions

The public PDFs were fetched and checked on 10 October 2026. The links and
locators above identify the material read; these hashes fix the versions.

| Source | SHA-256 |
| --- | --- |
| Morita | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| Gross–Koblitz | `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522` |
| Robert 2001 | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |
| Zhao | `923b85f7e3e7e55b4636ff98be2ca5f11a469ec10abe1ee15d6ede55a6936661` |
| Dasgupta–Kakde | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |
| Ertl–Nizioł | `131f6cf4ef32b15ceed8951eb48068c4f01fd13e6d3f42972b20e23b643c0d14` |
| Colmez–Nizioł | `3ab4456e31b5a6c7f21349b34fe020f619f4233a92a2f0105a1ffe2c3e1733ec` |
| Nekovář–Nizioł | `97f319e286aa4cf5be1b9c8d100efd1ac779e985d91d8cd6b70e2a3d0870ebd0` |
| BCGP21 | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` |
| BCGP25 | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |

## Continuation by codex-eh5SHn

The session is independent of fixer `claude-6ZAIEy`. The live issue was read
in full after the bot confirmed the claim. Its allowed packets are L3 and
PMIA. The queue's output list additionally includes L3-2 and D.1; the actual
`issues.deliverables_complete` function requires this job's reviewer in all
four. It currently returns **False**. L3-2 has reviewer
`independent-review-REV-DirichletPadicLFunctions--L3-2`, and D.1 has
`independent-review-REV-PadicHodgeRegulators--D.1~2`.

Concrete review-only patches were prepared in scratch for L3-2 and D.1.
Whole-object assertions verify that only `review` and `reviewHistory` change.
Each patch archives the entire preceding review, including respectively
79 and 72 node verdicts; mathematical statements, dependencies, source issues,
API/tests, gaps, requests and coverage remain identical. Scope authorization
was requested from the run's user because WORKERS.md explicitly limits edits
to issue-named paths. No authorization has been received. The patches were
not installed, and neither the queue nor the issue body was edited.

Selected fresh readings support the existing finding verdicts:

- **/1:** inspected Morita's scanned §1 pp.255–256 and Gross–Koblitz's scanned
  §1 pp.570–571, including (1.2), (1.5) and Theorem 1.7. The signed product,
  dyadic precision restriction, chosen-root congruence, negative Gauss sign,
  odd-prime range and separate zero exponent agree with the report. Robert's
  text confirms the separate dyadic estimate and Theorem 4; this continuation
  relies on the preceding formula-image review for its full Dwork identity.
- **/2:** read Zhao §1.2 p.461, Theorem 4.1 and (4.1)–(4.6) pp.471–473,
  Appendices A–B pp.473–474 against the selected L3-2 nodes. The general
  correction is present, the exceptional formula has `chi(p)=1`, and E37
  correctly repairs the inclusive Gamma endpoint. The first coefficient
  comes from the stated coefficient bounds/limits. Nonvanishing stays a
  separate arithmetic gap.
- **/3:** read Ertl–Nizioł v2 §§2.1–2.2 pp.4–8, Colmez–Nizioł v4
  Corollary 3.16 p.37/Theorem 5.4 p.54, and Nekovář–Nizioł v5
  Remark 2.14 p.14/Proposition 4.13 pp.53–54 against the D.2 consumers.
  Directed maps, factorial twist, exact divided range through `p−2`, bounded
  undivided comparison and rational boundary/sign agree. Proposed external
  producers remain requests.
- **/4:** read Dasgupta–Kakde v3 §§2.2–2.3 pp.15–18, Lemma 3.9 pp.25–26,
  and §6.1/Lemma 6.1 p.40. The image order, square-presentation hypotheses,
  inverse-character target and right-adjugate repair remain supported.
  Read the actual current `fittingIdeal`,
  `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_baseChange` and
  `AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual` statements.
  Their current commit is the one recorded above; the Fitting and
  StableTranspose modules are absent from the programme pin. The five-node
  migration described above remains necessary and is not performed partly.
- **/5:** the current LAD L4 coverage and both named gaps retain the precise
  separation between strict compact-complex windows and full solid
  localization. This continuation checks the routing and gap preservation;
  the preceding BCGP source audit remains the source evidence.
- **/6:** reread accepted RS-16's I.5 decision. It explicitly retains the
  independent Hecke/congruence routes, supporting the verifier's rejection.

Read the reviewed library audit of L3, D.2 and L6 and the current
StableReduction/QuiverRepresentations interfaces; the audit's pinned absence
of generic Fitting ideals must not be extended to the current library.
All eight downloaded PDFs have the same SHA-256 hashes as the table above.
The public links and exact versions are unchanged. No verbatim source passage
or private source file was added to the repository.

Fresh finite controls passed: 132 buffered Gamma congruences and the rejected
unbuffered dyadic modulus-4 claim; 60 strict permutation/filtration checks;
6,561 rectangular right-adjugate preimages, including 891 singular
submatrices; a non-generating-family relation control; and directed syntomic
composites/rational scaling. These are falsification controls, not proofs of
analytic or arithmetic suppliers.

All four packet checkers pass with zero errors; L3 has 26 inherited API
warnings and the other three have none. No packet or suggested Lean file was
changed, and no Lean run was repeated for this metadata-only continuation.
The preceding compilation results above remain attributed to that session.
The submission consists of this report and the handoff. Completion still
requires dispatch correction or explicit authorization for the two receipts.
