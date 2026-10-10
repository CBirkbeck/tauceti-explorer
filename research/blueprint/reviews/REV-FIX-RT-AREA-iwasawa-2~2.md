# Independent fix review: REV-FIX-RT-AREA-iwasawa-2~2

Codex, session `codex-VFmAUK`, 10 October 2026. Refs #6219.
[Bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6101616259).
I did none of fixer `claude-6ZAIEy`'s work. This continues the completed
bounded six-finding review by `codex-2zOJTT`. The input report and its
attributed earlier checks remain available at
[the input commit](https://github.com/CBirkbeck/tauceti-explorer/blob/331ab9424e8e40925f5053a1bb7ee53f8930d99c/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2~2.md).
The complete earlier packet audits retain their original reviewers and checked
arrays. The fresh checks below concern the correction contracts and their
supplier boundaries.

## Verdicts

| Finding | Verdict | Boundary retained |
| --- | --- | --- |
| /1 Morita Gamma and Gross–Koblitz | L3 accepted for the bounded corrections | Dwork coefficients and trace comparison remain exact RD.6 requests; whole L3 elaboration has the dependency failure below. |
| /2 Ferrero–Greenberg | L3-2 accepted receipt prepared | Differentiation and arithmetic nonvanishing retain separate suppliers; installation is pending scope authorization. |
| /3 Fontaine–Messing–Kato comparison | D.1 accepted receipt prepared | CS.0–CS.3 remain proposed external producers; installation is pending scope authorization. |
| /4 Character orders and presentation algebra | PMIA needs_changes | Five generic L6 nodes require current native Fitting/stable-transpose reuse. |
| /5 Finite slope for complexes | Existing LAD routing retained | Compact finite-window contracts preserve the solid-localization and Stein comparison gaps. |
| /6 Alleged duplicate main-conjecture route | Verifier's rejection retained | Accepted RS-16 explicitly preserves the two independent proof methods. |

The authorized changes replace only `review` and append each complete former
review to `reviewHistory` in L3 and PMIA. All mathematics, source records, APIs,
tests, coverage, gaps, requests, Lean files and older history remain unchanged.
The two other receipts are prepared for the queue's additional packet outputs.
Their complete 79- and 72-entry prior audits will be archived whole on
installation. No link map or restructuring proposal is under review.

## /1: Gamma and the chosen Gauss normalization

Freshly read Morita §1, Lemma 1/Theorem 1, printed pp.255–256, and
Gross–Koblitz §1, (1.2), (1.5), (1.6), Theorem 1.7, pp.570–571.
Both scanned formula pages were inspected as images. The selected packet
contracts use the signed natural product, with Gamma_p(0)=1 and Gamma_p(1)=-1,
and its continuous unit-valued extension. Translation multiplies by -x at
units and by -1 at nonunits. The finite congruence retains the dyadic
exponent-two exception and the construction's stronger precision buffer.

The Gauss sum keeps the source's minus sign. The chosen root satisfies
pi^(p-1)=-p and the second-order congruence in the integer ring. A principal
ideal in the fraction field would lose that constraint. Gross–Koblitz's
original theorem has odd-prime and nonzero-character scope. Its root and
negative-sum contracts are correctly distinguished from the separately
sourced Robert formulation and its exponent-zero case. The older attributed
Robert analysis remains in the input report. The packet retains the exact
Dwork coefficient and splitting/trace inputs instead of deriving them from
the formula's name. Acceptance concerns finding /1's correction contract.

## /2: Ferrero–Greenberg

Freshly read Zhao §1.2, p.461, Theorem 4.1 and (4.1)–(4.6), pp.471–473,
and Appendices A–B, pp.473–474. The selected L3-2 nodes use primitive odd chi,
conductor N>1 prime to p, compatible embeddings, log_p(p)=0, and the even
chi*omega branch; the dyadic omega has conductor four. The derivative has
direct chi weights and the correction
(1-chi(p))*B_(1,chi)*log_p(N). The simplified exceptional formula requires
chi(p)=1. Exact order one requires the independently recorded nonvanishing
input.

The permutation uses positive representatives a in {1,...,N} and
m=a+hN, with iota(m)=h+1+(N-a)(B-1)/N. Its congruence and filtration
identities agree with Appendix A. The strict Gamma/count endpoint agrees
with the corrected B.2 contract recorded as E37. Differentiation still
requires uniform bounds and coefficient limits. The five gaps, eight
requests and planned L3 coverage are preserved. These checks support the
prepared accepted fix receipt and follow the archived full 79-node audit.

## /3: Classical syntomic comparison

Freshly read Ertl–Niziol v2 §§2.1–2.2, pp.4–8, especially Theorem 2.2,
p.7; Colmez–Niziol v4 Corollary 3.16, p.37; and Nekovar–Niziol v5
Remark 2.14, p.14, and Proposition 4.13, pp.53–54.
The selected D.1 contracts distinguish the undivided p^r-phi fibre U
from the divided 1-phi_r fibre D. Omega:U→D has legs (p^r,id), and
tau:D→U has legs (id,p^r); their composites are p^r. Omega preserves
products. The modified twist includes the specified factorial factor.

The exact integral divided comparison uses 0≤i≤r≤p-2. The undivided
comparison retains bounded p-power error and its source-dependent bounds.
The rational exponential is an isomorphism through i≤r-1 and injective
at i=r. Its boundary transport uses omega's rational inverse, the p^-r
quotient-coordinate scaling and the Bloch–Kato coboundary sign. The integral
contracts assert no inverse. Nine gaps, twenty requests, seventeen source
issues and all eight planned stages remain. CS.0–CS.3 are external proposed
producers; the proper rational CP.4 anchor does not supply the full integral
open theory. These checks support the prepared accepted fix receipt and
follow the archived full 72-node audit.

## /4: Character orders, minors and transpose

Freshly read Dasgupta–Kakde v3 §§2.2–2.3, pp.15–18, the proof of
Lemma 3.9, pp.25–26, §6.1/Lemma 6.1, p.40, and Appendix B.2,
Lemma B.4/(171), p.93. R_Psi is the character-evaluation image. Sharp
lands in the inverse-character ring. Cardinality statements retain regular
determinants and finite-index/finite-quotient hypotheses. E17's repaired
image proof uses the right higher adjugate identity and the embedded
preimage. Transpose retains presentation dependence, projective correction
factors and coefficient transport. The source identities support those
repairs.

Current Tau Ceti supplies generic mathematics still planned by five L6 nodes:

- `higher-fitting-ideal` and `higher-fitting-independence`: import
  `TauCeti.fittingIdeal` and `fittingIdeal_eq_minorsIdeal_ker`.
- `relation-minors-add-generator`: reconcile with the native kernel/minors
  API, retaining any required adapter for an arbitrary family. The native
  kernel formula requires an actual finite-free surjection onto the module.
- `higher-fitting-base-change`: import `fittingIdeal_baseChange`, whose
  commutative-algebra statement requires no flatness assumption.
- `transpose-stable-equivalence`: import
  `AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`, preserving its
  opposite scalar structure and ordered dual correction factors.

A coherent revision must reconcile consumers, L4, both StableReduction
requests, the reader and suggested interfaces together. Preserve the
non-generating-family, deficient-relation and nonflat controls, arithmetic
order/index results, and contragredient conventions. The reader lies outside
this review's file scope. The existing needs_changes verdict identifies that
coordinated revision and completes this review portion.

## /5 and /6: Established supplier boundaries

Freshly read BCGP21 v3 §6.1.1, p.139, and Lemma 6.3.14/Theorem 6.3.16,
p.152; BCGP25 v1 Definition 2.2.17, p.21, and §4.6.46/Remark 4.6.47,
p.94. Compactness is through a bounded projective Banach representative.
The product of degreewise Fredholm series belongs to that representative;
cohomology determines invariant spectral support. BCGP25 uses analytic-ring
coefficients, a Stein exhaustion and derived f_*f^* localization with inverse
limits. Its construction is stronger than monoid inversion. LAD's accepted
plan records the Stein/inner-restriction and full solid-localization inputs
as gaps. That routing is retained, with LAD unchanged and its complete audit
attributed to its reviewer.

For /6, reread accepted `RS-16.result.json` at `IntegralIwasawaTheory:I.5`.
It explicitly keeps independent Mazur–Wiles and odd-prime totally-real
Wiles Hecke/congruence proofs, including their lattice and divisibility
inputs. The cyclotomic Euler-system proof is another method. The verifier's
rejected finding and the absence of a replacement supplier edge remain right.

## Libraries and upstream boundaries

Read the reviewed AUDIT-24/AUDIT-26 coverage for the relevant L3, L6 and D.2
layers. At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, freshly read
`PadicInt.isUnit_iff`, `not_isUnit_iff`, `norm_natCast_eq_one_iff`,
`norm_lt_one_iff_dvd`, `denseRange_natCast`,
`ContinuousMap.unitsOfForallIsUnit` and `DenseRange.equalizer`, including
ambient assumptions. The continuous unit lift uses a complete normed ring;
the dense equalizer uses a Hausdorff codomain.
At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, read the native
transpose quotient and its opposite/base-scalar actions and quotient maps.

Read current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`:
`RingTheory/FittingIdeal/Basic.lean:331–357`,
`RingTheory/FittingIdeal/BaseChange.lean:125–140`, and
`Algebra/Module/AuslanderReiten/StableTranspose.lean:72–98`.
Fitting ideals apply to finite modules, with arbitrary commutative-algebra
base change. Stable transpose works over an arbitrary ring, with exact
surjective projective presentations and no finiteness assumption.
Git object checks confirm all three files are absent at the programme pin.
These inputs belong to the current library and are not attributed to f790474.
The read-only current TauCetiRoadmap checkout is
`81207c7f16d5abf770f13a7d2bdcdb465c030787`; StableReduction and
ArithmeticDirichletSeries boundaries and their suggested interfaces were
consulted. No generic upstream carrier was planned or changed.

## Public source provenance

All ten public PDFs were fetched on 10 October 2026; their hashes match the
input report's versions. Fresh readings are scoped above. Prior exhaustive
source readings and finite diagnostics remain attributed to their sessions.
No book or copied source passage was used in the changes.

| Public source | SHA-256 |
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

## Validation

All four actual packets pass `scripts/check_blueprint.py`: zero errors.
L3 retains 26 inherited short-API warnings; the other three have none.
These advisories concern the inherited full packet, and its open coverage
and supplier obligations remain explicit. No source excerpt field was added.
Parsed equality excluding review/reviewHistory, complete archived-review
preservation and absence of excerpt fields pass for both installed receipts.
Both omitted packets remain exactly equal to the input commit. There are no Lean
source changes.

Fresh sequential `lean-check` runs used the existing pinned build with
sufficient memory checked before each run:

| Suggested file | Result |
| --- | --- |
| L3 | Exit 1 before body elaboration: unknown module prefix `research`. |
| L3-2 | Exit 0; 111 `sorry` warnings only. |
| D.1 | Exit 0; 307 `sorry` warnings only. |
| PMIA | Exit 0; 1,075 `sorry` warnings only. |

L3 imports sibling atlas prototype modules absent from the shared build's
compiled module tree. The imports were retained. No Lake build, update,
cache fetch or Lean language server was run. All Lean processes from this
session ended. The accepted L3 verdict is explicitly a bounded correction
review, without a whole-file compilation or closure claim.

## Remaining scope authorization

The live issue names L3 and PMIA; the current queue also lists L3-2 and D.1.
The unchanged `issues.deliverables_complete` predicate requires this job's
reviewer in all four packets. It currently returns False. Both additional
receipts are prepared. They archive complete original audits and change no
mathematics; simulated reads at their actual paths make the unchanged
predicate return True.

[WORKERS.md](../WORKERS.md) says: “Edit only the files the issue names, plus
your own scratch space.” The live issue repeats the restriction. Authorization
for the two extra queue-owned packet updates was requested with the concrete
review-only changes. It remains pending, so neither update is installed.
No queue, issue, label or completion rule was changed. The handoff retains
the exact receipts and installation/preservation checks.
