# Independent verification of RT-PAPER-ZHU-17

Job `REV-RT-PAPER-ZHU-17`, issue #4109. Verifier: Codex, session
`codex-J6LwjP`, 2 October 2026. Reviewed repository base: `3bd3241`.

All 44 findings require corrections: **44 confirmed, 0 rejected**
(5 high, 19 medium, 20 low). Confirmation applies to the defect specified
in each JSON reason, including its qualifications; it does not endorse every
sentence or suggested fix of a compound finding. The verdict file is
[`RT-PAPER-ZHU-17.review.json`](../redteam/RT-PAPER-ZHU-17.review.json).
Findings /17, /19, /30, /39 and /41 particularly require narrower conclusions.

I did none of the extraction, its original review or the red-team job.
The original extraction records another Codex session; that is not this
session's work. I checked the session's previous deliverables before claiming.
Only the two review deliverables are changed.

## Evidence read independently

I read all 44 claims, evidence entries and proposed fixes; the affected
statements, proof outlines, locators, route briefs and sourceIssues in
`PAPER-ZHU-17.result.json`; its reader document and original independent
review; and all 104 review-added mathematical items. These additions have no
prerequisite/ownerKey/consumer fields, and no other item points to them.
That is a concrete disconnected proof graph, even where their prose contains
useful source citations. The extraction currently has 324 items, 18 routes
and 75 sourceIssues; those are counts before canonicalizing duplicates.

I compared the current SF.0/SF.1/SF.2/SF.4, RF0, GS0 Witt geometry, GS1,
GS2 correspondences/closure, GS3 fusion, GS4 rational reductivity, Global
Shtukas GS.1, L2, BG0/BG1 and relevant RG2 stages, with the corresponding
reviewed library-coverage entries where present. RF has no matching reviewed
coverage entry in this snapshot; its stage prose alone is planning evidence.
I also checked the named FS21, HE21, BS17, Kisin–Pappas18 and
Kisin–Pappas–Zhou26 items, the current GS0/GS1 packets, RS-22's accepted
parent title, and RT-AREA-etale/16 with its fixes/handoff. A proposed area fix
is not evidence that its new route is installed.

Public primary sources and the portions read:

| Source | Public version and reading |
| --- | --- |
| Zhu | [Published Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), 90 pages, printed pp. 403–492. Read the complete text, including references; inspected images at pp. 428, 432, 433, 438, 449, 450, 452, 458 and 464 for bars, indices and diagrams. |
| Lusztig–Vogan | [arXiv:1109.4606v3](https://arxiv.org/pdf/1109.4606v3), 25 pages. Read §§7.1–7.2, pp. 23–24, and pp. 9–10 for the geometric trace construction; these locators use manuscript numbering. |
| Lusztig–Yun | [arXiv:1203.0521v1](https://arxiv.org/pdf/1203.0521v1), 21 pages. Read pp. 3–5, 8–10 and 14–19, including geometric polynomials, complex Satake, the orbit sign argument and the restricted affine identity. This version's §§2/6 differ from the published §§3/7 cited by Zhu. |
| Ngo–Polo | [Author manuscript](https://www.math.uchicago.edu/~ngo/ngo-polo.pdf), 33 pages. Read §8, pp. 18–20, Lemmas 8.1–8.3 and the flag-cell/cohomology calculation. |
| Mirković–Vilonen | [Published Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v166-n1-p03.pdf), 49 pages. Read §7, printed pp. 121–122, for the precise Deligne–Milne suppliers. |
| Deligne–Milne | [Corrected public text](https://www.math.columbia.edu/~dejong/tannakian/Deligne-Milne-Tannakian-Categories.pdf), 72 pages. Read pp. 15, 24–25: Proposition 1.20, Proposition 2.20 and Corollary 2.22. |
| Anschütz–Gleason–Lourenço–Richarz | [arXiv:2201.01234v2](https://arxiv.org/pdf/2201.01234v2), 59 pages, revised 30 January 2026. Read pp. 19, 24–25, including depth definitions, Lemma 3.15, Theorem 3.16 and Remark 3.17. |

SHA-256 of the downloaded PDFs, in table order:

```text
Zhu: 5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7
LV: 39d443fe161cea1bc8e167b1f095a8b5a6396ffa61bcf21e495780f935c95ebb
LY: f3dfd16b135ec484ce644a10a25d0fc18d963bcbc80f297ffdef1b12d0782fe3
NP: 4ca83c061ffbc75fd36c6a14cf483decc23f264d2021d9bdd462c325ce3a91a9
MV: ace87be795e20392ff0691b65a136d5723417811442c368d97a152c458223107
DM: 48f8af5249081217fc4a806414a764d9d69d66eff9092ddd8e2cf0ea078579e8
AGLR: 4fa96d9e2c774f1d943b3dcdcc548db5562ec9f56a6a2b746efadaa16ee5461e
```

Other papers cited by Zhu were checked here as invoked prerequisites in Zhu's
proofs/reference list, not audited in their entirety. In particular, this
review does not claim an independent reading of the published LY version or
of the later CL25 comparison proof mentioned by AGLR.

## Pinned library reuse

The existing checkouts have the required commits:
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. I read declaration statements,
surrounding assumptions and the indicated construction scopes, rather than
crediting name matches.

* [WittVector.Complete](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Complete.lean):
  p-torsion-freeness, coefficient/power divisibility, the p quotient and
  completeness under PerfectRing/CharP assumptions.
* [Truncated](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Truncated.lean),
  [DiscreteValuationRing](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/DiscreteValuationRing.lean),
  [Teichmuller](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Teichmuller.lean)
  and [TeichmullerSeries](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/TeichmullerSeries.lean):
  truncation/kernel, perfect-field DVR, multiplicative Teichmüller lift and
  finite expansions. The series file explicitly leaves uniqueness as a TODO.
* [FreeModule/PID](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/PID.lean):
  `Submodule.exists_smith_normal_form_of_rank_eq` gives diagonalization,
  with full-rank finite-free PID hypotheses. Clearing denominators and
  absorbing DVR units remains an application adapter.
* [Grassmannian](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Grassmannian.lean):
  quotient convention and module functor, not relative scheme representability.
* [Sites/Fpqc](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Fpqc.lean),
  [Sites/Etale](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean)
  and [Morphisms/Etale](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Etale.lean):
  exact scheme-level topology, subcanonical/EffectiveEpi and étale definitions.
* [PerfectClosure](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/PerfectClosure.lean),
  [Smooth](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean),
  [ZariskiMain](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean)
  and [ValuativeCriterion](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/ValuativeCriterion.lean):
  affine perfection adjunction, dense smooth locus and conditional scheme
  criteria. They do not automatically supply perfect algebraic-space extensions.

The Tau Ceti declarations read were
`smoothCommHopfAlgProperty_of_geometricallyReduced` and
`characterCocharacterPairing_galois_invariant`, in the
[pinned Tau Ceti tree](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369).
The former still needs the reduced-to-geometrically-reduced adapter over a
perfect field; the latter does not supply positive-system/Frobenius transport.
No upstream roadmap or link is edited or replanned by this verification.

## Finding coverage and fix boundaries

Every row is confirmed; the corresponding JSON reason carries the precise
evidence and correction.

| Finding | Verified defect and necessary boundary |
| --- | --- |
| /1 | Duplicate numbered/named items and conflicting routes. Canonicalize with aliases, preserving added atomic content. |
| /2 | Accepted source corrections absent from live statements/proofs. Repair nonemptiness, closure, parahoric, cohomology, σ indexing, tensor filtration and model scaling. |
| /3 | Missing/planned conflicts with GS suppliers. Split dimension from component counts and exact carrier extensions. |
| /4 | Proposed Witt/coefficient and conjecture-owner loops. Moving B02/B03 alone leaves B04 behind. |
| /5 | Unsupported SF.0 ownership for perfect algebraic spaces. Establish one foundation owner after ordinary spaces. |
| /6 | Ramified restriction of scalars invalidates the cited reductivity reduction, not Theorem 1.4 itself. |
| /7 | Missing G29/G24/G17/Gabber edges; representability and properness must be separated. |
| /8 | Omitted prerequisites and imprecise MV weight-functor locator. |
| /9 | Equivariant IH has no finite total-degree bound: μ=0, SL₂ gives H*(BSL₂). |
| /10 | Concentration omitted from equidimensionality proof; naive insertion creates a real item loop. |
| /11 | Satake category and its later monoidal closure are combined prematurely. |
| /12 | 104 additions are disconnected; add only justified edges after merging aliases. |
| /13 | Connected Demazure fibres do not supply the affine paving needed for parity. |
| /14 | Ngo–Polo's flag-cell/cohomology calculation is a missing proof input. |
| /15 | Proposition 2.21, involution and later comparisons lack load-bearing edges. |
| /16 | Reversed Levi inputs, wrong RZ supplier and wrong base category. |
| /17 | Missing twisted trace interface. LV does give an affine adaptation sketch; expand it rather than claiming no proof exists. |
| /18 | Norm comparison belongs with its construction, not an unspecified BG stage. |
| /19 | Duplicate L2 approximation supply; no installed SF→L2 cycle was found. |
| /20 | Appendix A omits cited site/model/quotient suppliers. |
| /21 | Grassmannian dualization warning is wrong; scheme representability is still additional. |
| /22 | Separate general group theory from Witt-Grassmannian geometry and reconcile BS17. |
| /23 | The proposed alternative imports the current fusion-dependent lane. Share endpoints and prove any earlier lane independently. |
| /24 | Credit ordinary Witt declarations; retain uniqueness/ramified gaps. |
| /25 | Elementary-divisor existence uses pinned DVR/PID results plus an adapter; uniqueness is not thereby credited. |
| /26 | Missing small-N equal-characteristic comparisons and product-position inequality. |
| /27 | fpqc carrier is supplied as fppf; coordinate with /35. |
| /28 | RF0's finite-local-field scope is narrower than arbitrary perfect k. |
| /29 | Inexact locators, duplicate Sat⁰ and conflated Q_r specializations. |
| /30 | Omitted typo/proof records. The terse induction is a closure obligation pending errata review, not a certified new error here. |
| /31 | Complex-topological H05/H06 exceed GS1's finite-field ℓ-adic scope. |
| /32 | Deligne–Milne rigidity/algebraicity/connectedness suppliers omitted. |
| /33 | Equivariant half of Proposition 2.20 and opposite compatibility omitted. |
| /34 | Labels, diagram location, finite-field and Galois-transport interfaces need repair. |
| /35 | Same topology repair as /27; reuse the actual scheme-level descent API. |
| /36 | Missed ordinary/affine library reuse, with hypotheses and extensions retained. |
| /37 | One php typo counted twice; keep the unrelated coefficient-field correction. |
| /38 | References to nonexistent source errors survive a rejected interpretation. |
| /39 | Record AGLR's restricted, hypothesis-dependent progress; do not declare the unrestricted conjecture proved. |
| /40 | Restore separated pfp algebraic-space and ℓ≠p hypotheses. |
| /41 | Imports are incomplete/inconsistent. The subsidiary claim of no inter-Part-II imports is false. |
| /42 | Part II titles retain the old RS-22 parent title. |
| /43 | Reader inventory, route titles and error coverage remain stale beyond flagged headline counts. |
| /44 | Conflicting equal-characteristic suppliers need exact common scope, not a blanket planned-status change. |

The important counterexamples were recomputed directly: empty semi-infinite
intersections for μ=0, a nonmaximal SL₃ half-level parahoric, Gr(2,4)'s
H²/H⁴ dimensions, unbounded H*(BSL₂), and the unipotent special fibre of
ramified Res G_m. They distinguish false assertions from true statements with
incomplete proofs. The RZ σ shift was checked against the Dieudonné lattice
condition and the published conventions, not just a sourceIssue verdict.

## Dependency checks and handoff

I assembled the current atlas using `assemble(require_distances=False)` and
combined real stage edges with prerequisite edges oriented supplier→consumer.
There are 2,956 stages and 8,563 distinct edges; Kahn's algorithm removes
every stage. This assembled graph is acyclic. There is no SF.0/SF.1→L2 path;
there is a GS3→GS4:rational-reductivity path. New extraction Part IIs are not
installed stages here, so this check cannot certify their future graph.
Findings /4 and /5 concern their proposed imports; /10 and /11 concern the
extraction's item proof order. These three graph levels must remain distinct.

The fixer should first canonicalize items and hypotheses, then settle shared
owners, then add and test proof edges. In particular, move the B04 coefficient
application together with B02/B03, split the finite-model E06 supplier from
perfect transport, and place BC4 after its M_{N,h} object. Keep both useful
proof approaches to commutativity while avoiding duplicate endpoint ownership.
Errata additions follow §18's review rules; this verification is not that
independent errata review. Refresh reader counts and imports only after the
canonical mathematical inventory is settled.

Validation: `scripts/check_redteam.py` on the review; `intake.py check-files`
on both authorized deliverables; all 44 IDs present exactly once; severity
totals reconciled; JSON parsing, private-path scan and `git diff --check`.
No Lean file is a deliverable for this verification. No Lean compilation,
Lake setup/cache download or language server was run. Library/source reads
establish planning evidence, not newly formalized mathematics.
