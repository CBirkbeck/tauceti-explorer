# Independent correction review — REV-FIX-RT-AREA-iwasawa-2~2

Codex, session `codex-Kjdk5C`, 10 October 2026. Refs #6219.
[Confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6101824276).
I did none of the fixes by `claude-6ZAIEy` and took no other job.
This review checks the six finding contracts against the sources, corrections,
selected interfaces and present library ownership. It follows `codex-2zOJTT`;
its report remains at the
[input commit](https://github.com/CBirkbeck/tauceti-explorer/blob/05df76a2665f431ca610079ff24a72aafc74a392/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md).
The earlier exhaustive packet audits remain attributed to their reviewers.
I am not claiming a second exhaustive audit of these four large packets.

| Finding | Decision | Qualification |
| --- | --- | --- |
| /1 Morita Gamma and Gross–Koblitz | Accept the L3 correction contract | RD.6 coefficient/splitting inputs remain requests; the shared build cannot resolve L3's sibling imports. |
| /2 Ferrero–Greenberg | Accept; receipt prepared for L3-2 | Differentiation and arithmetic nonvanishing remain separate inputs. Scope approval is needed to install this receipt. |
| /3 Classical syntomic comparison | Accept; receipt prepared for D.1 | Integral/open producer closure is not supplied by the proper rational comparison. Scope approval is needed to install this receipt. |
| /4 Character orders and transpose | PMIA needs_changes | Source repairs are supported, but five generic nodes duplicate present Tau Ceti results. |
| /5 Finite slope for complexes | Retain the LAD supplier boundary | Bounded Banach representatives do not supply full solid analytic localization. |
| /6 Main-conjecture proof routes | Retain the verifier's rejection | The historical Hecke/congruence proofs and cyclotomic Euler-system proof remain independent. |

## Source and interface findings

### /1 — Morita Gamma and Gross–Koblitz

Read Morita §1, Lemma 1 and Theorem 1, printed pp.255–256;
Gross–Koblitz §1, equations (1.2), (1.5), (1.6) and Theorem 1.7,
pp.570–571; Robert's estimates and Theorem 4, pp.167–168.
The scanned Morita and Gross–Koblitz pages and Robert's displayed formula
were inspected as images as well as the available text layers.

The signed natural product omits multiples of p and gives values 1 at zero
and −1 at one. Its continuous extension takes values in the native unit group.
Translation has multiplier −x on units and −1 on nonunits. The packet's
buffered congruence is sufficient for all primes: the unbuffered dyadic
period-four claim fails between arguments 1 and 5 modulo four.
The selected natural-product, buffered-congruence, continuous-extension and
recurrence contracts keep the signs and the two branches. Their tests reject
the unsigned product and the unit-only recurrence.

The chosen Gross–Koblitz root must satisfy the squared-root-ideal congruence
inside the integral ring. Divisibility in the fraction field would impose no
normalization. The source uses the negative Gauss sum; its original theorem
has odd-prime and nonzero-exponent restrictions. Robert's theorem allows all
primes and exponent zero, whose negative Gauss value is one. The L3 root and
Robert comparison contracts distinguish these statements. The coefficient
bound, actual splitting identity and chosen-root/trace compatibility remain
RD.6 supplier requirements; a named Gamma formula does not prove them.

### /2 — Ferrero–Greenberg

Read Zhao §1.2, printed p.461; Theorem 4.1 and equations (4.1)–(4.6),
pp.471–473; Appendices A–B, pp.473–474. The general convention includes
p=2, with omega_2 of conductor four. The character is primitive and odd,
with conductor N>1 prime to p; the coefficient embeddings and logarithm
normalization must be compatible.

The chi*omega branch derivative is the directly chi-weighted log-Gamma sum
plus `(1-chi(p))*B_(1,chi)*log_p(N)`. Removing the second term requires
chi(p)=1. The packet separates that exceptional case from the general
identity, and neither identity by itself proves nonvanishing or order one.
Its differentiation contract still requires uniform bounds and coefficient
limits, rather than differentiating an unqualified pointwise limit.

The strict count at a positive integer x is `x-1-V_p(x-1)`; its zero value
is separately fixed. For B=p^(fn)>1 congruent to one modulo N, write
m=a+hN with 1≤a≤N. The FG permutation is
`h+1+(N-a)*(B-1)/N`. Multiplication by N identifies its residue with m
modulo B, preserving the p-power divisibility filtration. The strict Gamma
endpoint avoids Appendix B.2's inclusive-endpoint discrepancy, retained as
E37. These corrections are supported. All five gaps and eight requests stay
open; the full earlier 79-entry audit is preserved with its original author.

### /3 — Divided and undivided syntomic comparison

Read Ertl–Niziol v2 §§2.1–2.2, pp.4–8, particularly Theorem 2.2, p.7;
Colmez–Niziol v4 Corollary 3.16, p.37, and Theorem 5.4, p.54;
Nekovar–Niziol v5 Remark 2.14, p.14, and Proposition 4.13, pp.53–54.

The divided fibre D uses `1-phi_r`; the undivided fibre U uses `p^r-phi`.
Omega goes U→D with legs (p^r,id), and tau goes D→U with legs (id,p^r).
Both composites multiply by p^r. Multiplicativity is supplied for omega,
not asserted indiscriminately for tau. The modified twist has the factor
`(p^a*a!)^-1`, where r=(p−1)a+b and 0≤b<p−1.

Exact divided comparison has range 0≤i≤r≤p−2. The undivided comparison
retains bounded p-power error and the different constants and base-field
hypotheses of its sources. The rational exponential is an isomorphism for
i≤r−1 and injective for i=r, not generally surjective there. Rational
boundary transport uses omega's inverse, the p^-r coordinate scaling and
the Nekovar–Niziol coboundary sign. These distinctions survive in the D.1
contracts; no integral inverse is inferred.

The CS.0–CS.3 producer contracts are still external proposals. CP.4 is the
proper rational anchor, not a substitute for integral/open construction.
Nine gaps, twenty requests, seventeen source issues and eight planned stages
remain. The earlier complete 72-entry audit is preserved and attributed.

### /4 — Character orders, relation minors and transpose

Read Dasgupta–Kakde v3 §§2.2–2.3, pp.15–18; Lemma 3.9,
pp.25–26; §6.1/Lemma 6.1, p.40; Appendix B.2/Lemmas B.4–B.6,
pp.93–94. The relevant arithmetic hypotheses include odd p, finite abelian
G and a finite-extension valuation ring containing the character values.

The character order is the image of joint evaluation, rather than the whole
product of coefficient rings or an automatically Gorenstein order.
Sharp transports it to the inverse-character order; only an inverse-stable
character set gives an endomorphism. The cube-root counterexample in the
packet tests this distinction. Square-presentation size, regular determinant
and finite quotient/index assumptions are retained in the cardinality claims.

The Lemma 3.9 repair supplies an actual image preimage: apply the right
higher-adjugate identity to the selected square submatrix, then embed its
columns into the full matrix. The paper's left-multiplication display alone
does not prove preservation of the image. E17 remains recorded. The excess-
generator identity is equation (171) in this version, not (175).
Transpose remains attached to a presentation; opposite/contragredient actions
and the ordered projective-dual factors must accompany stable equivalence.

These source repairs hold, but the current library supplies mathematics that
five generic L6 nodes still plan. A coordinated revision must:

- Replace `higher-fitting-ideal` and `higher-fitting-independence` with
  `TauCeti.fittingIdeal` and `fittingIdeal_eq_minorsIdeal_ker`, and adapt the
  finite-presentation matrix interface as needed.
- Reconcile `relation-minors-add-generator` with the native kernel-minors
  interface. Preserve any adapter for a family that does not generate M;
  the native formula requires an actual surjection onto its module.
- Use `TauCeti.fittingIdeal_baseChange` for `higher-fitting-base-change`.
  Its commutative-algebra statement requires no flatness.
- Use `AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual` for
  `transpose-stable-equivalence`, transporting the opposite action and
  ordered dual correction factors to the arithmetic coefficient order.

Update L4, the consumers, both StableReduction requests, the reader and the
suggested interfaces together. Keep deficient relations, redundant generators,
nonflat base change, arithmetic index computations and contragredient tests.
The reader is outside this review's permitted files, so this migration cannot
be completed coherently here. PMIA therefore receives needs_changes, which
is a completed negative review result, independent of the dispatch blocker.
All eighteen gaps and three requests remain recorded.

### /5 and /6 — Supplier and proof-route boundaries

Read BCGP21 v3 §6.1.1, p.139, Lemma 6.3.14 and Theorem 6.3.16,
pp.152–153; BCGP25 v1 Definition 2.2.17, p.21, and §4.6.46 /
Remarks 4.6.47–4.6.49, pp.93–95. LAD's current contracts distinguish a
bounded projective Banach representative with degreewise compact operators
from invariant cohomological spectral support. The nonalternating Fredholm
product depends on the chosen representative; contractible summands can
change that product without supplying spectral support. A finite perfect
window's derived scalar comparison does not yield unrestricted underived
cohomology base change.

Full solid finite slope uses the analytic localization f_*f^*, analytic-ring
coefficients and the affinoid inverse-limit construction. Monoid inversion
alone is weaker. LAD explicitly retains the missing solid/topological and
Stein/inner-restriction comparisons as gaps and imports the generic Stein
owner. This bounded review retains that routing and leaves LAD unchanged.

Read the accepted `RS-16.result.json` decision for `IntegralIwasawaTheory:I.5`.
It keeps both Mazur–Wiles and odd-prime totally-real Wiles Hecke/congruence
proofs, including their lattices and divisibility inputs, independently of
the cyclotomic Euler-system method. The verifier's rejection of finding /6
is consistent with that decision; no replacement supplier edge is warranted.

## Libraries and ownership

Read the reviewed AUDIT-24/AUDIT-26 coverage before checking current ownership.
At pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, inspected
`PadicInt.isUnit_iff`, `not_isUnit_iff`, `norm_natCast_eq_one_iff`,
`norm_lt_one_iff_dvd`, `denseRange_natCast`,
`ContinuousMap.unitsOfForallIsUnit` and `DenseRange.equalizer` with their
binders. The continuous unit lift needs a complete normed ring; uniqueness
from density needs a Hausdorff codomain.

Read the transpose source at Tau Ceti pin
`f790474821cf4256814db967cb154e7af3d0c369`, including its dual quotient,
opposite and base scalar structures, `mk`, kernel/surjectivity statements
and `lift`. At current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read
`RingTheory/FittingIdeal/Basic.lean:331–357`,
`RingTheory/FittingIdeal/BaseChange.lean:125–145` and
`Algebra/Module/AuslanderReiten/StableTranspose.lean:72–98`.
Fitting ideals use finite modules; the kernel formula takes a finite-free
surjection. Stable transpose allows an arbitrary ring and exact projective
presentations without finiteness. Its factors are Dual(P0×Q1) and
Dual(P1×Q0), with opposite-linear equivalence. Verified that all three new
files are absent at f790474; the current results are not attributed to the pin.

Checked current TauCetiRoadmap
`81207c7f16d5abf770f13a7d2bdcdb465c030787`, including StableReduction,
ArithmeticDirichletSeries and QuiverRepresentations interfaces. Read these
checkouts without modifying or building them. Existing generic carriers
remain imports; the historical pinned absence of Fitting ideals does not
justify planning them again against current main.

## Validation, edits and dispatch scope

Only L3 and PMIA review metadata changed. Appended each entire former review
unchanged to reviewHistory before replacing it, keeping all older entries.
No mathematical statement, source issue, prerequisite, API, test, coverage,
gap, request or Lean file changed. The L3-2 and D.1 receipts are prepared;
the full 79- and 72-entry audits will be archived intact when authorized.
There are no source excerpt fields in the four packets. No link map or
restructuring proposal is an input to this job.

All four actual packet checks report zero errors. L3 retains 26 short-API
warnings; the others report no warnings. These full-packet API-depth concerns
are inherited, not resolved by acceptance of the bounded correction contract.
Parsed equality excluding review/reviewHistory and exact archival-history
checks passed. The intake file screen and whitespace check passed.
The checker's default declaration index was unavailable, so its baseline
checks cover reference form. The selected declaration statements were read
directly as described above; this is not a fresh indexed audit of every
baseline entry in these packets. Read-only substitution of the prepared
receipts at their actual packet paths also passes both packet checkers and
makes the unchanged completion predicate True; no file was substituted on disk.

Sequential `lean-check` runs used the existing pinned shared build, with over
20 GB available before each run. No library build, update, cache download or
language server was started.

| Suggested file | Result in this session |
| --- | --- |
| L3 | Exit 1: unknown module prefix `research` before body elaboration |
| L3-2 | Exit 0: 111 `sorry` warnings, no other diagnostics |
| D.1 | Exit 0: 307 `sorry` warnings, no other diagnostics |
| PMIA | Exit 0: 1,075 `sorry` warnings, no other diagnostics |

L3 imports sibling atlas prototypes absent from the shared module search
path. This review does not remove dependencies to conceal that failure.
Finite diagnostics passed for 160 Gamma recurrence pairs, 144 buffered
congruences, 208 strict counts, fifteen FG permutations with 7,142,370
p-power filtration checks, three Fitting controls and 729 right-adjugate
preimages (297 singular). These finite checks are not mathematical proofs.
No Lean process from this session remains running.

The live issue explicitly permits only L3 and PMIA packet edits. The queue
and unchanged `issues.deliverables_complete` additionally require this job's
review records in L3-2 and D.1. WORKERS.md's instruction, “Edit only the files
the issue names, plus your own scratch space,” forbids installing those
otherwise completed receipts without authorization. The user has been asked
to authorize those two concrete metadata-only updates. No answer has arrived.
The actual completion predicate remains False. The handoff records the exact
receipts and the installation checks; no queue, predicate, issue or label has
been changed. This is a blocked checkpoint pending scope authorization.

## Public source versions

Read on 10 October 2026. No book was used and no source passage is copied
into these deliverables. Locators above refer to the following public PDFs.

| Source | SHA-256 |
| --- | --- |
| [morita](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf) | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| [gross-koblitz](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf) | `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522` |
| [robert](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf) | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |
| [zhao](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf) | `923b85f7e3e7e55b4636ff98be2ca5f11a469ec10abe1ee15d6ede55a6936661` |
| [ertl-niziol](https://arxiv.org/pdf/1603.01705v2) | `131f6cf4ef32b15ceed8951eb48068c4f01fd13e6d3f42972b20e23b643c0d14` |
| [colmez-niziol](https://arxiv.org/pdf/1505.06471v4) | `3ab4456e31b5a6c7f21349b34fe020f619f4233a92a2f0105a1ffe2c3e1733ec` |
| [nekovar-niziol](https://arxiv.org/pdf/1309.7620v5) | `97f319e286aa4cf5be1b9c8d100efd1ac779e985d91d8cd6b70e2a3d0870ebd0` |
| [dasgupta-kakde](https://arxiv.org/pdf/2010.00657v3) | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |
| [bcgp21](https://arxiv.org/pdf/1812.09269v3) | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` |
| [bcgp25](https://arxiv.org/pdf/2502.20645v1) | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
