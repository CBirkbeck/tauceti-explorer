# REV-FIX-RT-AREA-iwasawa-2~2 — independent scoped review

Codex (GPT-6), session `codex-6EmRVa`, 10 October 2026; issue
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219),
[bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6092673984).
Input atlas commit `05548b6d34231d0b1b50ca1f10b5d85b03260f2a`.
This reviewer did none of the author fix and claimed one job.

**The live issue's review is finished: L3 is accepted within the fix scope;
PMIA needs changes to reuse current Tau Ceti. Queue completion is blocked
because it requires independent receipts on L3-2 and D.1, which the live
issue does not name.** This continuation adds substantive read-only source
and signature checks for those two inputs; it does not install their verdicts
without authorization. No new full audit of the 1,663-node L3 packet, the
487-node PMIA packet or either excluded packet is claimed. Preceding receipts
are preserved in `reviewHistory`; the retained L6 ledger remains attributed
to its original independent reviewer.

## Finding dispositions

Read all six findings, the verifier's verdicts, round-two fix report, prior
reviews and handoff, the affected interfaces and the reviewed L3/L4/L6
library audit. The disposition is:

| Finding | Scoped result |
|---|---|
| /1: Morita Gamma and Gross–Koblitz | The L3 foundation is correct: signed natural product, native unit-valued continuous extension, uniqueness and both recurrences. The modulus-four exception is necessary. Robert's telescoping identity needs the separately requested coefficient decay and chosen-root splitting identity. Read-only L3-2 checks confirm its integral root congruence and separate dyadic calculation; no unconditional Gross–Koblitz closure is claimed. |
| /2: Ferrero–Greenberg | Correctly routed to L3-2. Fresh Zhao/Gross source checks confirm the full correction term, even-character convention, conductor and prime conditions, and exceptional specialization. Its arithmetic nonvanishing proof remains an explicit gap. See the unapplied preflight below. |
| /3: integral/open log-syntomic producer | D.1 correctly routes the shared early producer to CohomologyComparisons Part II. Fresh EN/CN/NN checks support its divided/undivided distinction, directed period maps, modified lattices, exact range and normalized rational exponential. Its newer independent regulator review remains intact; the producer is still external. |
| /4: Dasgupta–Kakde algebra | Source-specific repairs are sound: evaluation image with congruences, quadratic presentations, contragredient coefficient rings, right-sided compound preimage and presentation-dependent transpose. PMIA needs coordinated migration to the current generic Fitting and transpose APIs. |
| /5: derived finite slope | Retain the verifier's outside-owner requirement: cohomological support, solid derived localization and early shared Stein geometry. A raw determinant product or ordinary monoid localization does not provide it. No fresh full LAD source audit is claimed. |
| /6: alleged endpoint duplication | Retain the verifier's rejection and accepted RS-16 decision. The independent Hecke/congruence and Euler-system routes are not deleted. |

Acceptance here concerns the round-two fixes, not closure of inherited
mathematical or supplier gaps. Coverage, requests, gaps and implementation
statuses remain unchanged. No clear new in-scope mathematical error required
a statement or suggested-signature correction.

## Sources actually checked in this continuation

All listed PDFs were fetched into disposable scratch, with hashes verified.
Morita, Robert and Gross–Koblitz were read at page images; the remaining
selected pages were read from the PDFs' extracted text. No restricted book
was used. No source excerpt or section-by-section source summary is added.

| Public primary source | Selected locators checked | SHA-256 |
|---|---|---|
| [Morita (1975)](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf) | §1, Lemma 1, Theorem 1 and recurrence, printed pp.255–256 | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| [Robert (2001)](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf) | §4, finite telescoping, coefficient decay and Theorem 4, printed pp.164–168 | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |
| [Dasgupta–Kakde, v3](https://arxiv.org/pdf/2010.00657v3) | §§2.2–2.3 pp.15–18; Lemma 3.9 pp.25–26; §6.1 p.40; Appendix B.2 pp.93–94 | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |
| [Gross–Koblitz (1979)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf) | Introduction and §1, (1.2), (1.5), Theorem 1.7, printed pp.569–571 | `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522` |
| [Gross–Dasgupta](https://services.math.duke.edu/~dasgupta/papers/Gross.pdf) | §2, printed pp.4–5, Gamma derivative and Gauss/Jacobi logarithmic projection | `052d4f5f5aae5a57dfa1dcc669b4e7b431218ddc50619bd457187f557e1b2027` |
| [Zhao (2022)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf) | Introduction/notation pp.460–461; Theorem 3.3 and Corollary 3.4 pp.467–469; §4, Theorem 4.1, (4.4)–(4.6), Lemma 4.2 and Appendices A–B pp.470–474 | `923b85f7e3e7e55b4636ff98be2ca5f11a469ec10abe1ee15d6ede55a6936661` |
| [Ertl–Nizioł, v2](https://arxiv.org/pdf/1603.01705v2) | §§2.1–2.2.1, pp.4–8; Proposition 2.1, products, symbols and Theorems 2.2–2.3 | `131f6cf4ef32b15ceed8951eb48068c4f01fd13e6d3f42972b20e23b643c0d14` |
| [Colmez–Nizioł, v4](https://arxiv.org/pdf/1505.06471v4) | Corollary 3.16, Lemma 3.17, Remark 3.18 and Proposition 3.19, pp.37–38; Theorem 5.4 and local period construction, p.54 | `3ab4456e31b5a6c7f21349b34fe020f619f4233a92a2f0105a1ffe2c3e1733ec` |
| [Nekovář–Nizioł, v5](https://arxiv.org/pdf/1309.7620v5) | Remark 2.14, p.14; Proposition 4.13 and its square, Remark 4.14, pp.53–54 | `97f319e286aa4cf5be1b9c8d100efd1ac779e985d91d8cd6b70e2a3d0870ebd0` |

Morita's basic discriminators remain valid: empty product 1, first signed
value −1, and G_3(4)=2. The dyadic values G_2(1)=−1 and G_2(5)=−3 fail
congruence modulo 4 despite congruent arguments. Robert's binary digit-sum
estimate handles the dyadic loss; the odd-prime estimate cannot simply be
reused. Finite telescoping alone does not establish decay.

For DK Lemma 3.9, the corrected preimage first applies the higher adjugate to
the target vector, embeds it along the selected columns, then applies the
rectangular compound matrix. The stated equality gives range membership
without assuming that the image is invariant under left multiplication.
The transpose controls distinguish the identity presentation of zero from
the two-generator/one-target presentation: their transposes differ by a free
summand. Presentation dependence is essential.

## Current library migration required by PMIA

Read the relevant current StableReduction Layer 1 and
QuiverRepresentations Layer 6 interfaces. The read-only current roadmap
commit is `dea8191cc6047d6142a65872ebce6eeeb841a29b`; Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Neither tree was modified or built.

| Existing current Tau Ceti declaration | Required reuse |
|---|---|
| `TauCeti.fittingIdeal`, RingTheory/FittingIdeal/Basic.lean:343 | All degrees for `Module.Finite`; finite presentation is a special case. |
| `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, Basic.lean:349 | Any finite free surjection onto the module. |
| `TauCeti.fittingIdeal_eq_minorsIdealOfSet`, Generators.lean:109 | Any generating set of its kernel. |
| `Submodule.minorsIdeal_prod_top`, Basic.lean:242; `Submodule.minorsIdeal_ker_eq_of_surjective`, Basic.lean:304 | Redundant-generator and presentation-independence machinery. |
| `TauCeti.fittingIdeal_baseChange`, BaseChange.lean:134; `IsBaseChange.fittingIdeal_eq_map`, line 159 | Arbitrary base change, including localization, without flatness. |
| `AuslanderReitenTranspose.quotientEquiv`, Algebra/Module/AuslanderReiten/Transpose.lean:192 | Semilinear quotient transport after proving the required range equality. |
| `AuslanderReitenTranspose.prodMapEquiv`, line 272; `compFstEquiv`, line 315 | Generic direct-sum and zero-relation equivalences and their representative equations. |

The four L6 targets `higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence` and `higher-fitting-base-change` must reuse the
native implementations. Retarget their direct consumers, both
StableReduction requests, the L4 characteristic comparison and the
reader/signatures together. Retain the necessary column-kernel/matrix-minor
adapter and concrete order computations. Keep the deficient-relation,
high-degree, nonprincipal two-cyclic and nonflat-base-change controls.

For `presentation-transpose`, specialize `compFstEquiv` for `equivAddZero`;
use `prodMapEquiv` and the split identity case for `equivAddId`. Quotient
transport still needs the dual-coordinate range proof and contragredient
scalar comparison. Projective base change and arbitrary-presentation stable
comparison are not supplied by these generic equivalences alone.

Fresh Git-object checks confirm that the Fitting modules and three new
transpose equivalences are absent at f790474; the split identity theorem
`subsingleton_of_comp_eq_id` is already present. The pinned character point,
tagged orthogonality and transpose modules in the shared build match their
f790474 Git objects byte for byte. Read their statements with all finite-group,
domain, enough-roots and opposite/scalar restrictions intact. Mathlib's
shared checkout is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`.

The existing `upstreamNotes` already record the correct migration boundary.
No new carrier is introduced and no current declaration is falsely attributed
to the pin. Coordinated baseline and reader reconciliation remains outside
this scoped correction; `needs_changes` is the finished review verdict.

## Read-only preflight for the omitted queue outputs

This section is additional evidence for resuming after a scope decision,
not installed packet review receipts or a claim of complete audits.

For L3-2, checked the three root nodes and 26 Ferrero–Greenberg nodes, including
the native suggested declarations. The root-ideal argument uses a local
integer ring, so the square-ideal congruence has an integral witness. At 2,
π=−2 and ζ=−1 are a direct calculation, not an extension of the odd-prime
1979 theorem. The exponent endpoint remains excluded; the trivial negative
Gauss value is separately 1.

Zhao's any-prime convention supports the proposed all-prime derivative route.
The formula retains `(1−χ(p)) B_(1,χ) log_p N`, with θ=χω, conductor prime
to p, the actual Gamma and the normalized logarithm. Its sign follows from
differentiating `−L_p(−s)`; replacing the flat residue by the positive one
requires the outer character cancellation. The normalized log-Gamma
antidifference uses the strict natural endpoint; the existing source issue
records the printed shift. The dyadic Taylor bound uses 1/4, not 1/2.

The prototypes expose their limits: `fg_differentiation` still takes the
analytic-series identification, and `ferrero_greenberg` takes the first
coefficient/count identities from the requested arithmetic interfaces.
`fg_nonvanishing` explicitly takes a nonzero projection. Gross–Dasgupta's
cited logarithmic-independence argument does not supply the missing ideal
basis/character-projection decomposition. Thus this preflight does not
accept unconditional simplicity or close any of L3-2's five recorded gaps.

For D.1, checked the four D.2 consumer nodes `log-syntomic-complex`,
`fontaine-messing-kato-period-map`, `small-twist-comparison` and
`syntomic-exponential`, their requests and suggested forms. EN's ω has legs
(p^r,id), τ has legs (id,p^r), and both composites are p^r. Only ω is
multiplicative. The divided period map is directed through the syntomic–étale
site/Godement construction; the undivided map is its composition with ω.
The weight-one unit class therefore acquires a factor p on the undivided
side. This is not an integral inversion of a bounded comparison.

Exact divided comparison uses r≤p−2. The bounded undivided statement retains
CN Theorem 5.4's N(K,p,r), rather than silently strengthening it to e-only
dependence. EN's factorial-modified lattice and CN's lattice agree in the
weights used here, with a separate all-weight boundary. The normalized
rational exponential transports the divided boundary through ω_Q⁻¹ and
keeps the factor p^(−r) relative to the unscaled quotient coordinate.
NN Proposition 4.13 fixes the exponential/sign convention; the retained
range excludes the valuation-class counterexample at r=1. The proposed
CS.0–CS.3 producer remains a supplier request, not something CP.4 already
contains. D.1's 8 October independent review and source-issue verdicts remain
untouched.

The 29 L3-2 nodes have 9 API items and 9 tests; the four D.2 nodes have 14 API
items and 9 tests. Their declaration/API/test names occur in their suggested
files. Both full files elaborate at the shared pin; this validates prototype
types, not omitted arithmetic/geometric hypotheses, interfaces or proofs.

## Validation and changes

| Fresh check | Result |
|---|---|
| L3 packet checker | 0 errors, 26 inherited short-API warnings outside the fix scope |
| PMIA packet checker | 0 errors, 0 warnings |
| L3-2 and D.1 read-only packet checks | Each: 0 errors, 0 warnings |
| Full PMIA `lean-check` | Exit 0; 1,075 warnings, all `sorry` |
| Full L3 `lean-check` | Exit 1 at unresolved `research` imports; no declarations elaborated |
| Full L3-2 read-only `lean-check` | Exit 0; 110 warnings, all `sorry` |
| Full D.1 read-only `lean-check` | Exit 0; 307 warnings, all `sorry` |
| L6 inventory | 50 nodes, 172 API items, 57 tests; all test names occur in the suggested file |
| Source-text inventory | Neither authorized packet contains an `excerpt` key |

Checks ran sequentially, with more than 100 GB available at launch. No
language server, dependency build, private Lake project or current-main
build was started. No Lean process from this session remains.

Updated only the two authorized top-level review receipts, preserving their
predecessors in `reviewHistory`, this report and the handoff. No mathematical
node, source issue, request, pin or suggested signature changed.

## Administrative blocker

The live issue still names five outputs: this report, L3/PMIA packets and
suggested files. The queue names nine, additionally requiring L3-2/D.1
packets and suggested files. `issues.deliverables_complete` requires this
review's exact identifier on all four packets, and permits `needs_changes`.
A finished PMIA verdict therefore does not prevent completion; the omitted
packet receipts do. The live scope is complete and the queue scope is not.

[WORKERS.md](../WORKERS.md) explicitly requires: “Edit only the files the
issue names, plus your own scratch space.” Requested authorization for the
four additional files; no answer has arrived. No excluded file, queue entry,
issue body or label is edited. This checkpoint is necessary for that scope
blocker, not because the review ran out of time. Authorize the two additional
scoped reviews or reconcile the queue to the live scope before redispatching.
The read-only preflight above provides source/signature evidence for that
continuation; an unchanged two-packet review cannot finish the queue.

## Retained prior L6 audit ledger

Each node has prefix `PadicMeasuresIwasawaAlgebras:L6/`. The following ledger is retained from Codex session codex-KQjyXV's independent audit, not claimed as a new full audit by this continuation. Implementation remains unchecked.

| Node | Current verdict | Source locator / supplied proof boundary |
|---|---|---|
| `character-evaluation` | correct | §2.2, arXiv v3 PDF p. 15 |
| `joint-evaluation-injective` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-scaled-idempotent` | correct | Proof of Lemma 2.5, arXiv v3 PDF p. 17 |
| `character-group-ring-lattice` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-finite-index` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-nonzerodivisor` | correct | Proof of Lemma 2.5, arXiv v3 PDF p. 17 |
| `norm-element-kernel` | correct | Lemma 2.2 and proof, arXiv v3 PDF p. 16 |
| `character-idempotent-evaluation` | correct | §2.2, arXiv v3 PDF p. 15 |
| `component-character-group-ring` | correct | §2.2, arXiv v3 PDF p. 15 |
| `component-group-ring-equiv` | correct | §2.2, arXiv v3 PDF p. 15 |
| `group-ring-component-decomposition` | correct | §2.2, arXiv v3 PDF p. 15 |
| `component-norm-quotient` | correct | Corollary 2.3, arXiv v3 PDF p. 16 |
| `character-group-ring-unit-criterion` | correct | §2.3, arXiv v3 PDF p. 18 |
| `character-group-ring-unit-one-character` | correct | §5.2, arXiv v3 PDF p. 34 |
| `character-group-ring-local` | correct | §2.2, arXiv v3 PDF p. 15 |
| `character-group-ring-maximal-ideal-power` | correct | §7.2.9, arXiv v3 PDF p. 49 |
| `character-group-ring-eval-local-hom` | correct | §5.1, arXiv v3 PDF p. 34 |
| `character-group-ring-residue-field` | correct | Proof of Lemma 8.22, arXiv v3 PDF p. 64 |
| `character-group-ring-adic-complete` | correct | §7.2.9, arXiv v3 PDF p. 49 |
| `character-group-ring-index` | correct | Lemma 2.5, arXiv v3 PDF p. 17 |
| `sharp-involution` | correct | §6.1, arXiv v3 PDF p. 40 |
| `contragredient-dual` | correct | §6.1, equation (80), arXiv v3 PDF p. 40 |
| `quadratic-presentation` | correct | §2.3, arXiv v3 PDF p. 16 |
| `fitting-quadratic` | correct | §2.3, arXiv v3 PDF p. 16 |
| `higher-fitting-ideal` | correct | Appendix B.2, first paragraph, arXiv v3 PDF p. 93 |
| `relation-minors-add-generator` | correct | Appendix B.2, the paragraph before Lemma B.5, arXiv v3 PDF p. 94 |
| `higher-fitting-independence` | correct | Appendix B.2, first paragraph, arXiv v3 PDF p. 93 |
| `higher-fitting-base-change` | correct | Appendix B.2, after (172), arXiv v3 PDF p. 93 |
| `locally-quadratic-presentation` | correct | Remark A.7, arXiv v3 PDF p. 86 |
| `extension-relation-matrix` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `quadratic-presentation-extension` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `fitting-extension` | correct | Lemma 2.6, arXiv v3 PDF p. 18 |
| `fitting-fibre-product` | correct | Lemma 2.7 and proof, arXiv v3 PDF p. 18 |
| `pid-cokernel-cardinality` | correct | Proof of Lemma 2.4, the case of a PID, arXiv v3 PDF pp. 16–17 |
| `finite-index-cokernel-descent` | correct | Proof of Lemma 2.4, displays (27) and (28), arXiv v3 PDF p. 17 |
| `cokernel-modulo-finite-ideal` | correct | Proof of Lemma 2.4, arXiv v3 PDF p. 17 |
| `finite-index-subring-nonzerodivisor` | correct | Proof of Lemma 2.4, arXiv v3 PDF p. 17 |
| `quadratic-cardinality` | correct | Lemma 2.4, arXiv v3 PDF p. 16–17 |
| `compound-matrix` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `complement-shuffle-sign` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `generalised-laplace-expansion` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `higher-adjugate` | correct | Proof of Lemma 3.9, arXiv v3 PDF p. 26 |
| `compound-image-determinant` | correct | Proof of Lemma 3.9, last step, arXiv v3 PDF p. 26 |
| `exterior-cokernel-annihilator` | correct | Lemma 3.9, arXiv v3 PDF p. 25–26 |
| `presentation-transpose` | correct | §6.1, (81), arXiv v3 PDF p. 40 |
| `transpose-stable-equivalence` | correct | §6.1, arXiv v3 PDF p. 40 |
| `transpose-fitting` | correct | Lemma 6.1, arXiv v3 PDF p. 40 |
| `transpose-higher-fitting-free` | correct | Proof of Kurihara's conjecture after Lemma B.4, arXiv v3 PDF p. 94 |
| `transpose-higher-fitting` | correct | Proof of Lemma B.4, equation (171), arXiv v3 PDF p. 93 |
