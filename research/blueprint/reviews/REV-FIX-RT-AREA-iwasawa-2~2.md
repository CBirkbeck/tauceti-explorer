# REV-FIX-RT-AREA-iwasawa-2~2 — independent scoped review

Codex (GPT-6), session `codex-oYbkOx`, 10 October 2026; issue
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219),
[bot-confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6093007956).
Input atlas commit `15da55e6f65878bbea28010a47d360dbd47cf57c`.
This reviewer did none of the author fix and took one job.

**L3 is accepted within the fix scope. PMIA needs changes to reuse current
Tau Ceti. The live issue's review is finished; queue completion remains
blocked by its additional, issue-unnamed L3-2/D.1 receipts.**

This pass follows codex-6EmRVa. Its two preceding receipts are retained in
`reviewHistory`. Fresh work covers the six finding dispositions, the Gamma
foundation and Robert comparison, L6 statements/proof outlines, selected
pinned/current interfaces, and compiler diagnostics through the entire L3
body. It does not claim a new full source/baseline audit of all 1,663 L3 nodes,
487 PMIA nodes or the two omitted packets. The retained 50-node source ledger
is still credited to codex-KQjyXV. Source-issue verdicts and inherited
arithmetic/geometric gaps are preserved.

## Finding dispositions

Read every claim and verified verdict in `RT-AREA-iwasawa-2.result.json` and
`.review.json`, and the round-two fix report `.fixes-2.md`.

| Finding | Verdict and reason |
|---|---|
| /1: Morita Gamma and Gross–Koblitz | Accept the in-scope L3 correction. The signed natural product, native continuous unit-valued extension, uniqueness and both recurrence branches agree with Morita §1 and GK's introduction. The exceptional modulus 4 is excluded; buffered precision handles all primes. Robert's finite telescoping and decay are distinct inputs. The coefficient and chosen-root splitting requests remain explicit. The original GK theorem is odd-prime; the dyadic route needs Robert's separate argument. No unconditional GK closure is certified. |
| /2: Ferrero–Greenberg | The fix routes the derivative contract to L3-2. Retain the prior independent preflight: the general formula has the correction term `(1−χ(p)) B_(1,χ) log_p N`, with odd primitive χ, conductor prime to p and branch θ=χω; the exceptional specialization assumes χ(p)=1. Zhao supplies the separately recorded any-prime route. The nonvanishing deduction still requires its nonzero arithmetic projection. No new L3-2 receipt or fresh source audit is installed in this pass. |
| /3: integral/open log-syntomic producer | Retain the verifier's corrected ownership. The early general producer belongs to CohomologyComparisons Part II after the log/Hyodo–Kato inputs; D.2 consumes its smooth specialization. The prior D.1 preflight retains modified lattices, divided/undivided maps, exact small-weight comparison through p−2 and the normalized rational exponential. CS.0–CS.3 remains external. The newer independent regulator/source-issue reviews are preserved; no fresh D.1 verdict is installed. |
| /4: Dasgupta–Kakde algebra | The source-specific correction is mathematically sound: evaluation image with congruences, square presentations, finiteness and nonzerodivisor hypotheses, inverse-character coefficient ring, right-sided compound preimage and presentation-dependent transpose. PMIA nevertheless needs coordinated migration to the generic Fitting and transpose APIs already present in current Tau Ceti; see the exact boundary below. |
| /5: derived finite slope | Retain the recorded unresolved LAD owner obligation. The 2021 degreewise Fredholm product is auxiliary to a chosen compact representative; cohomological spectral support supplies the invariant. The 2025 solid derived construction `f_* f^*` is stronger than ordinary monoid inversion. The early shared Stein geometry must retain a single owner. This two-packet review neither edits LAD nor closes that gap. |
| /6: alleged endpoint duplication | Retain the verifier's rejection and accepted RS-16 ownership decision. Independent Hecke/congruence and Euler-system proof routes remain intentional. Their separation does not assert either inherited proof plan is complete. |

Acceptance concerns the fixes, not closure of every inherited stage. No clear
new in-scope mathematical error required a node or signature correction.

## Fresh primary-source checks

The four public PDFs were read at the following selected locators. Scanned
Morita, Robert and GK pages were inspected visually; DK was read from its
PDF text. No restricted book was needed. Repository text states the checked
results in our own words, with no source passage or section-by-section
summary.

| Source | Locators actually read | PDF SHA-256 |
|---|---|---|
| [Morita (1975)](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf) | §1, Lemma 1, Theorem 1 and recurrence, printed pp.255–256 | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| [Robert (2001)](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf) | §4, coefficient recurrence, Theorem 3, decay lemma and Theorem 4, printed pp.164–168 | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |
| [Gross–Koblitz (1979)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf) | Introduction and §1, (1.2), (1.5), Theorem 1.7, printed pp.569–571 | `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522` |
| [Dasgupta–Kakde, v3](https://arxiv.org/pdf/2010.00657v3) | §§2.2–2.3 pp.15–18; Lemma 3.9 pp.25–26; §6.1 p.40; Appendix B.2 pp.93–94 | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |

Gamma's distinguishing controls include G_p(0)=1, G_p(1)=−1 and G_3(4)=2.
At 2, congruent arguments 1 and 5 give signed values −1 and −3, which differ
modulo 4. Extending the unsigned product or asserting period 4 is wrong.
Robert's dyadic decay retains the digit-sum estimate; finite telescoping
alone supplies neither decay nor the splitting-value identity. His negative
Gauss convention gives trivial-character value 1 and excludes the exponent
endpoint q−1 from the displayed nontrivial range.

For DK Lemma 3.9, the preimage applies the higher adjugate to the target
vector, embeds along the selected columns, and then applies the rectangular
compound matrix. The right-sided identity establishes range membership
without an unstated image-invariance hypothesis. The finite-ideal reduction
in `quadratic-cardinality` also handles finite-field factors, where an
ambient nonzerodivisor cannot be inferred directly from a subring one.
The transpose of the identity presentation of zero is zero; a presentation
with an extra zero relation has a nonzero free transpose summand.

## Current library migration required by PMIA

The read-only roadmap commit is `dea8191cc6047d6142a65872ebce6eeeb841a29b`;
current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read the pertinent StableReduction Layer 1 and QuiverRepresentations Layer 6
contracts and the complete native statements below. Neither tree was built
or modified.

| Native declaration at current main | Required reuse |
|---|---|
| `TauCeti.fittingIdeal`, RingTheory/FittingIdeal/Basic.lean:343 | Every degree for `Module.Finite`; finite presentation is a special case. |
| `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, Basic.lean:349 | Any finite free surjection onto the module. |
| `TauCeti.fittingIdeal_eq_minorsIdealOfSet`, Generators.lean:109 | Any generating set of its kernel. |
| `Submodule.minorsIdeal_prod_top`, Basic.lean:242; `Submodule.minorsIdeal_ker_eq_of_surjective`, line 304 | Redundant-generator and presentation-independence machinery. |
| `TauCeti.fittingIdeal_baseChange`, BaseChange.lean:134; `IsBaseChange.fittingIdeal_eq_map`, line 159 | Arbitrary base change and localization; flatness is unnecessary. |
| `AuslanderReitenTranspose.quotientEquiv`, Algebra/Module/AuslanderReiten/Transpose.lean:192 | Semilinear transport with the actual precomposition-range equality. |
| `AuslanderReitenTranspose.prodMapEquiv`, line 272; `compFstEquiv`, line 315 | Generic direct-sum and zero-relation equivalences, with representative equations. |

Replace the generic work in `higher-fitting-ideal`,
`relation-minors-add-generator`, `higher-fitting-independence` and
`higher-fitting-base-change` with reuse of those native APIs. Retarget their
direct consumers, both StableReduction requests, the L4 characteristic
comparison and reader/signatures together. Retain the matrix-column/kernel
adapter, row/column orientation and specialized order computations. Keep
the deficient-relation, high-degree, nonprincipal two-cyclic and nonflat
base-change controls. The native free-module top-iff-rank theorem additionally
requires `Nontrivial R`; that assumption cannot be dropped from its test.

For `presentation-transpose`, derive `equivAddZero` from `compFstEquiv`, and
`equivAddId` from `prodMapEquiv` plus the split identity case. `quotientEquiv`
still requires the dual-coordinate range proof and contragredient scalar
comparison. Projective base change and arbitrary-presentation stable
comparison are separate obligations; these generic equivalences do not
supply them alone.

Fresh Git-object checks show the Fitting files and the three new transpose
equivalences are absent at the f790474 pin. The split identity theorem
`subsingleton_of_comp_eq_id` is already present. Read the pinned character
point, tagged orthogonality, subgroup character sum and transpose interfaces
with their actual domain, finite-group, roots-of-unity and opposite-scalar
restrictions. The build's Mathlib checkout is exactly 082e2d3. No newer
native declaration is cited as if it existed at the old baseline.

Existing `upstreamNotes` already record this boundary. The reader is outside
the live issue's named files; a partial migration would leave its contracts
and baseline inconsistent. `needs_changes` is the completed scoped review
verdict, not a claim of completed migration.

## Validation and additional compiler findings

| Check | Result |
|---|---|
| L3 packet checker, after receipt update | Exit 0; 0 errors, 26 inherited short-API warnings. |
| PMIA packet checker, after receipt update | Exit 0; 0 errors, 0 warnings. |
| Full PMIA suggested file | Exit 0; 1,075 `sorry` warnings only. |
| Standalone L3 suggested file | Exit 1 at repository-local `research` imports, before elaboration. |
| Full unmodified dependency assembly | Exit 1; 48 supplier diagnostics (two ordinary errors and 46 repeated unknown-constant diagnostics), 7,153 `sorry` warnings. |
| Final scratch-only supplier corrections | Exit 0; 7,177 `sorry` warnings only, no errors or other warnings. |
| First scratch supplier correction | Exit 1; L1 filter inference error plus the 46 repeated unknown-constant diagnostics, 7,153 `sorry` warnings. |

All 57 named L6 unit tests occur in PMIA's suggested file. This checks their
presence, not whether their proof placeholders establish their claims.

The unmodified dependency experiment deduplicates library imports and
concatenates PMIA, L0, L1, L2 and L3 bodies in dependency order, removing only
repository-local import commands. It processes the entire L3 body with
4,746 `sorry` warnings and no L3 error, but fails on supplier commands:

- L1 `smoothedResidue_carry`, lines 1753–1758: the first conjunct lacks its
  closing parenthesis before `∧`. Add it after `(N : ℤ)`.
- L2 line 3854: an unused local `d` notation refers to undefined
  `eisensteinTwistedDenominator`. Its dependent `S` notation is also unused
  in that test namespace. Reconcile or remove these stale notations in their
  owner job rather than inventing a new denominator.
- L1 line 1883, `variable [IsBoundedSMul Z K]`: 46 repeated
  `error(lean.unknownIdentifier)` diagnostics for `p✝`. This occurs in the unmodified and first two corrected
  assemblies and must be included alongside ordinary `error:` diagnostics.

The follow-up experiment changes only those supplier lines in scratch:
balances L1's first conjunct and removes the two unused L2 notations.
That run reveals another L1 error: Lean infers the filter's `i` as
`ZMod (p^m)` instead of `ℕ`. The next scratch experiment also annotates that
binder `fun i : ℕ => ...`.
With those three changes the assembly exits 1 with only the 46 repeated
notation diagnostics and 7,154 `sorry` warnings. The next experiment also
expands L1 line 1883 to `variable [IsBoundedSMul ℤ_[p] ℚ_[p]]` in scratch.
It exits 1 with 7,176 `sorry` warnings and three diagnostics for the same
missing `Fact (Nat.Prime 5)` instance, in L1's
`SuggestedArithmeticCharacterTests.unit_denominator_quinary`, lines
1976–1977. Its concrete p-adic types require that primality instance. The
last experiment adds a local instance proved by `norm_num` immediately
before that example; it adds no proof placeholder.
L3 and PMIA bodies remain unchanged. This final assembly exits 0 with 7,177 `sorry` warnings only. The entire L3
body elaborates under these scratch-only supplier corrections.
These checks establish prototype elaboration, not mathematical proofs or
closure of supplier gaps. The standalone L3 file still cannot compile in the
shared build without its repository-local dependency artifacts.

Final assembled diagnostic SHA-256: `6ff2d6df08a4891d410a0f58352648fde21777da2b7a0b903485c4ef05d7095c`.

Input hashes for reproducing the experiment:

| Suggested module | SHA-256 |
|---|---|
| `PadicMeasuresIwasawaAlgebras` | `85f103506252ce8d18359d5b8610365132592e4286e182acf0760857fbde1bc5` |
| `DirichletPadicLFunctions--L0` | `4dbcf3cb98166bcce58c2d183c9396140247488edfbda05567a7b9a1cc3a1de4` |
| `DirichletPadicLFunctions--L1` | `86b69df2dc0cf3e2c3f5b75aae88b98845d57f2de478a28a11bbf081d246c1e7` |
| `DirichletPadicLFunctions--L2` | `c17e92e90269b44ddcec5b1f4f72c0e1a877c3298bd675fc1156bf96cca026cb` |
| `DirichletPadicLFunctions--L3` | `46fe3cba63b8c88eb0e0d734e8138009d421aac3fae334b70116b8f31da1af85` |

All runs were sequential through `lean-check`, with at least 98 GB
available at launch. No language server, dependency build, private Lake
project or current-main build was started. Updated only the two authorized
review receipts (archiving predecessors), this report and the handoff;
mathematical nodes, requests, pins, source-issue reviews and suggested files
are unchanged.

## Scope blocker and retained preflight

The live issue names five deliverables; the queue names nine, additionally
requiring L3-2/D.1 packets and suggested files. `issues.deliverables_complete`
requires this exact review id on every packet and allows `needs_changes`.
PMIA's verdict therefore does not block administrative completion; the two
omitted receipts do.

[WORKERS.md](../WORKERS.md) requires: “Edit only the files the issue names,
plus your own scratch space.” Authorization for the additional four paths
was requested; none has arrived. No excluded file, queue entry, issue body
or label was edited. This is a checkpoint for a scope blocker, not elapsed
time. Reconcile the live issue and queue, or authorize the two additional
scoped reviews, before redispatching. Repeating two unchanged receipts
cannot finish the queue.

The [predecessor report](https://github.com/CBirkbeck/tauceti-explorer/blob/15da55e6f65878bbea28010a47d360dbd47cf57c/research/blueprint/reviews/REV-FIX-RT-AREA-iwasawa-2%7E2.md)
retains codex-6EmRVa's 29-node L3-2 and four-node D.2 consumer preflight,
with Zhao/Gross and EN/CN/NN source locators/hashes and read-only compiler
results. That inherited evidence remains useful for the omitted-output
continuation; it is not a fresh audit by this session.

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
