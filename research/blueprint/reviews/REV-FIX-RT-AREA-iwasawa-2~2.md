# REV-FIX-RT-AREA-iwasawa-2~2 — independent scoped review

Codex (GPT-6), session `codex-sH2uh6`, 10 October 2026.
[Issue #6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219);
[confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6094057890).
Input atlas commit: `51c3a1cdab84b86a6d2354805e723ce72061b5b9`.
This session did none of the fixes under review.

The live issue's two packet reviews are complete: **L3 accepted** for the
specified fixes; **PMIA needs changes** to reuse current native interfaces.
The two preceding codex-ldSpYt receipts are preserved whole in `reviewHistory`.
This is a scoped fix review, not a new audit of all 1,663 L3 or 487 PMIA nodes,
and acceptance does not close the packets' recorded producer gaps.

**Checkpoint blocker:** the live issue authorizes five outputs but the queue
requires nine. Completing the queue requires two further packet reviews that
the live issue does not authorize. See the dispatch section and handoff.

## Finding-by-finding disposition

Read all six original claims, all six verifier decisions and the fixer's
`RT-AREA-iwasawa-2.fixes-2.md`. The following distinguishes a confirmed
missing contract from an ownership claim that verification rejected.

| Finding | Verdict and evidence |
|---|---|
| RT-AREA-iwasawa-2/1, Morita Gamma and Gross–Koblitz | The named L3 corrections are right. Signed natural interpolation, unit-valued continuous extension, both recurrence branches, the exceptional modulus 4, compatible root choice and negative Gauss normalization are explicit. The original odd-prime theorem and Robert's dyadic route remain separate. DKV's existing L3 ownership is preserved. RD.6 coefficient/splitting suppliers remain recorded gaps. The follow-up L3-2 packet is outside this issue's named review scope. |
| /2, Ferrero–Greenberg derivative | The finding requires an explicit contract within the existing L3 owner. The fix records that contract in L3-2, which this issue does not name. Preserve the general conductor correction `(1−χ(p)) B₁,χ log_p N` and its exceptional-zero specialization; nonvanishing is a separate arithmetic input. This row records the verified disposition and inherited follow-up, not a new certification of the omitted packet. |
| /3, integral/open log-syntomic comparison | Preserve the verifier's rejection of generic D.2 ownership and its correction of previously rejected routes. General producers belong to CohomologyComparisons Part II after CR.5/CR.6; the regulator layers consume them. Small-weight divided, bounded undivided and rational exponential comparisons have different hypotheses and ranges. No D.1 receipt is installed here; CS.0–CS.3 remain open. |
| /4, DK ring-level algebra | The selected mathematical fixes are right: character-evaluation image, inverse-character coefficient ring, square presentations, determinant regularity in the required overring, finite-ideal reduction, right-sided higher-adjugate preimage and transpose attached to a presentation. PMIA nevertheless needs coordinated reuse of current generic Fitting and elementary transpose APIs. Its `needs_changes` verdict names this remaining nonduplication work. |
| /5, derived finite slope | Retain the LAD owner gap. The invariant cohomological support cannot be replaced by a representative-dependent degreewise Fredholm product. The solid construction in BCGP25 requires more than ordinary monoid inversion. Shared Stein geometry keeps its existing owner. No fresh LAD source audit or closure is claimed. |
| /6, alleged duplicate cyclotomic endpoint | Retain the verifier's rejection and accepted RS-16 decision. The Mazur–Wiles/Wiles Hecke route and Kolyvagin–Rubin Euler-system route were deliberately retained as independent methods. This fix review does not certify completion of those inherited proof plans. |

No new clearly fixable error was found in the selected authorized mathematical
contracts. This PR changes the two scoped receipts, report and handoff.
Suggested signatures, baseline pins, source findings and their verdicts are
preserved. PMIA's remaining migration involves its reader, also outside this
issue, so an inconsistent partial migration was not attempted.

## Fresh source and interface checks

Downloaded and read the selected locations of these public PDFs on
10 October 2026. Morita, Robert and Gross–Koblitz scanned pages were inspected
visually. No restricted book was used. Results below are stated in the
reviewer's own words.

| Source | Locations read | PDF SHA-256 |
|---|---|---|
| [Morita (1975)](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf) | §1, Lemma 1, Theorem 1 and recurrence, printed pp.255–256 | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| [Robert (2001)](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf) | Theorem 2; §4 recurrence, Theorems 3–4 and decay, printed pp.162–168 | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |
| [Gross–Koblitz (1979)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf) | Introduction and §1, (1.2), (1.5), Theorem 1.7, printed pp.569–571 | `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522` |
| [Dasgupta–Kakde, v3](https://arxiv.org/pdf/2010.00657v3) | §§2.2–2.3 pp.15–18; Lemma 3.9 pp.25–26; §6.1 p.40; Appendix B.2 pp.93–94 | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |

The Gamma controls G_p(0)=1, G_p(1)=−1 and G_3(4)=2 distinguish the
signed convention. At p=2, arguments 1 and 5 agree modulo 4 but their values
−1 and −3 do not; that modulus is correctly excluded from the sharper
congruence. Both unit and nonunit recurrence branches are needed.
Continuous unit lifting uses `ContinuousMap.unitsOfForallIsUnit`; integer
congruence transport uses `PadicInt.norm_int_le_pow_iff_dvd`, whose full
statements were read at the pinned Mathlib. Analytic claims retain their
smaller discs. Robert's dyadic decay estimate keeps its binary digit-sum
term; telescoping alone supplies neither that estimate nor the splitting
identity. The negative Gauss convention gives 1 at the trivial character
and the nontrivial exponent range excludes q−1.

For DK, selected L6 definitions' APIs and discriminating tests were checked
alongside the matrix-column, finite-cardinality and transpose contracts.
The retained 50-node source ledger below belongs to codex-KQjyXV.
Fresh direct checks also establish the following proof boundaries:

- The compound-image argument applies `adj_r(A_J)` to the target vector,
  then embeds the result in the chosen columns. The identity with the
  adjugate on the right proves image membership. A left-sided identity
  alone does not supply that preimage.
- In a finite ideal K, a nonzerodivisor determinant acts bijectively, and
  the adjugate makes A bijective on K^m. This proves the quotient reduction
  used for finite-field factors in the source's cardinality generality.
  Descent to an overring separately requires regularity there. For the
  graph subring B={(a,a mod p)} of ℤ×𝔽_p, (p,0) is regular in B, while
  the two scalar quotients have cardinalities p and p². The stronger
  overring hypothesis is therefore necessary.
- The extension matrix `(Ψ,−X;0,φ_C)` has square lower block φ_C. Every
  nonzero maximal minor selects all its columns and is det(φ_C) times a
  maximal minor of Ψ. This yields the rectangular Fitting multiplication
  argument without injectivity of the relation map or an uncleared book.
- Common projective presentations of M via P₀⊕Q₀ have relation sources
  F₁=P₁⊕Q₀ and F₂=Q₁⊕P₀. Projective lifts give shears comparing the
  combined relation maps. Dualizing their zero-relation enlargements
  yields tr(f)⊕F₂* ≃ tr(g)⊕F₁*, with the packet's summand order.
  Minimal-presentation uniqueness is not used for this assertion.

Read `Matrix.mul_adjugate`, `Matrix.adjugate_mul` and
`Module.projective_lifting_property` at Mathlib `082e2d3`. Read Tau Ceti's
pinned `AuslanderReitenTranspose` construction and
`subsingleton_of_comp_eq_id`; the latter needs neither projectivity nor
finiteness in that direction.

## Current native reuse required by PMIA

Read-only roadmap main: `8c72a04753b11cab07fa593cc38ceaa7c0515380`.
Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Checked StableReduction Layer 1 and QuiverRepresentations Layer 6,
including the relevant suggested interfaces, against the native declarations.
Neither current checkout was modified or built.

| Current native declaration | Contract relevant to the migration |
|---|---|
| `TauCeti.fittingIdeal`, RingTheory/FittingIdeal/Basic.lean:343 | All degrees for finite modules over a commutative ring; finite presentation is a special case. |
| `fittingIdeal_eq_minorsIdeal_ker`, Basic.lean:349 | Calculation from any finite free surjection. |
| `fittingIdeal_eq_minorsIdealOfSet`, Generators.lean:109 | Any set spanning the presentation kernel, without requiring that set to be finite. |
| `Submodule.minorsIdeal_prod_top`, Basic.lean:242; `minorsIdeal_ker_eq_of_surjective`, line 304 | Redundant generators and independence of the finite free surjection. |
| `fittingIdeal_baseChange`, BaseChange.lean:134; `IsBaseChange.fittingIdeal_eq_map`, line 159 | Arbitrary algebra base change and localization; no flatness assumption. |
| `AuslanderReitenTranspose.quotientEquiv`, Algebra/Module/AuslanderReiten/Transpose.lean:192 | Semilinear quotient transport with the actual precomposition-range equality. |
| `AuslanderReitenTranspose.prodMapEquiv`, line 272; `compFstEquiv`, line 315 | Direct sums and zero-relation summands, with representative equations. |

Retarget `L6/higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence` and `higher-fitting-base-change`, their direct
consumers, both StableReduction requests, the L4 characteristic comparison,
reader and suggested signatures together. Keep concrete matrix/kernel-minor
adapters, orientation, specialized order computations and deficient-relation,
high-degree, nonprincipal and nonflat-base-change tests. Free rank controls
must retain `Nontrivial R` when the stated rank is a fixed positive integer.

For transpose, use `compFstEquiv` for a zero relation and `prodMapEquiv`
plus the pinned split-identity theorem for an identity summand. General
stable comparison and finite-projective base change remain obligations.
`quotientEquiv` requires the dual-coordinate range proof and comparison of
the contragredient scalar structures; citing it does not prove those inputs.
The generic Fitting files and three newer transpose equivalences are absent
at the f790474 pin. No current-main declaration has been silently attributed
to that pin. Existing `upstreamNotes` already identify this migration.

## Validation

| Fresh check | Result |
|---|---|
| L3 packet | 0 errors; 26 inherited short-API warnings outside this fix scope. |
| PMIA packet | 0 errors; 0 warnings. |
| Full PMIA suggested file, pinned `lean-check` | No errors; 1,075 `sorry` warnings only. |
| Standalone L3, pinned `lean-check` | Exit 1 at unresolved repository-local `research` imports, before the body is processed. |
| Conditional complete L3 body | Exit 0; 7,177 `sorry` warnings only, under the supplier corrections below. |

The L3 diagnostic concatenates suggested bodies PMIA, L0, L1, L2, L3 in
that order, deduplicates library imports at the top and removes original
import commands. It applies only these inherited supplier corrections in
scratch, leaving PMIA/L3 signatures unchanged:

- L1 `smoothedResidue_carry`: close the first conjunct after `(N : ℤ)`
  and annotate the filter binder `fun i : ℕ => ...`.
- L1: expand `[IsBoundedSMul Z K]` to `[IsBoundedSMul ℤ_[p] ℚ_[p]]`.
- L1: add a local `Fact (Nat.Prime 5)` instance, proved by `norm_num`,
  before `unit_denominator_quinary`.
- L2: remove the unused `d` notation referring to undefined
  `eisensteinTwistedDenominator`, and its unused `S` notation.

Fresh assembled input SHA-256:
`df179e7704500cd30ab5a24e1b8d1415b5053ce8d13307bfa1768b8e6b0d0bff`.

| Original suggested module | SHA-256 |
|---|---|
| `PadicMeasuresIwasawaAlgebras` | `85f103506252ce8d18359d5b8610365132592e4286e182acf0760857fbde1bc5` |
| `DirichletPadicLFunctions--L0` | `4dbcf3cb98166bcce58c2d183c9396140247488edfbda05567a7b9a1cc3a1de4` |
| `DirichletPadicLFunctions--L1` | `86b69df2dc0cf3e2c3f5b75aae88b98845d57f2de478a28a11bbf081d246c1e7` |
| `DirichletPadicLFunctions--L2` | `c17e92e90269b44ddcec5b1f4f72c0e1a877c3298bd675fc1156bf96cca026cb` |
| `DirichletPadicLFunctions--L3` | `46fe3cba63b8c88eb0e0d734e8138009d421aac3fae334b70116b8f31da1af85` |

This is a conditional prototype diagnostic, not standalone compilation of
the original L3 module or closure of its suppliers. All runs use the existing
pinned build sequentially, with at least 100 GB available at launch.
No language server, Lake build/update/cache operation or current-main build
was started.

`intake.py check-files` passes all four changed files with 0 problems;
`git diff --check` reports no whitespace errors. Parsed comparison to the
input commit confirms that only review/history objects changed in the two
packets. All mathematical data and all 19 L3 and 20 PMIA source findings and
their verdicts are identical; each preceding receipt is archived intact.
The completion predicate is True for the live five outputs and False for
the queue nine. No compiler remains running at submission.

## Dispatch scope conflict

The live issue names five outputs: this report, L3 and PMIA packets and their
suggested files. `queue.json` names nine, additionally:

- `packets/DirichletPadicLFunctions--L3-2.json`
- `suggested/DirichletPadicLFunctions--L3-2.lean`
- `packets/PadicHodgeRegulators--D.1.json`
- `suggested/PadicHodgeRegulators--D.1.lean`

`issues.deliverables_complete` requires this exact fix-review id on every
packet. L3-2 has no receipt and D.1 retains its newer full regulator review.
A `needs_changes` verdict counts as a completed review, so PMIA's verdict
is not this administrative blocker.

[WORKERS.md](../WORKERS.md) requires: “Edit only the files the issue names,
plus your own scratch space.” Authorization for the four extra paths was
requested while the named work continued; no answer has arrived. The omitted
files, queue, issue body and labels remain untouched. Reconcile the live issue
and queue or explicitly authorize the additional scoped reviews before
redispatching. Repeating the two named receipts cannot complete the nine-file
queue job.

## Retained prior L6 audit ledger

Each node has prefix `PadicMeasuresIwasawaAlgebras:L6/`. The following ledger is retained from Codex session codex-KQjyXV's independent audit, not claimed as a new full audit by this continuation. Implementation remains unchecked.

| Node | Prior mathematical verdict | Source locator / supplied proof boundary |
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
