# REV-FIX-RT-AREA-iwasawa-2~2 — independent scoped review

Codex (GPT-6), session `codex-zSS4E1`, 10 October 2026; issue
[#6219](https://github.com/CBirkbeck/tauceti-explorer/issues/6219),
[confirmed claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6219#issuecomment-6093342990).
Input atlas commit `b6ce57e677e6304cd146c629bc47d984ccc15f92`.
This session wrote none of the fixes under review and took one job.

**L3 is accepted within the fix scope. PMIA needs coordinated reuse of
current Tau Ceti. The live issue's two-packet review is complete; the queue
requires two further packet receipts outside the issue's authorized scope.**

This pass follows codex-oYbkOx. Its two receipts are archived in
`reviewHistory`. Fresh checks cover all six verified finding dispositions,
the selected Gamma/Gross–Koblitz foundations, DK's character-ring algebra,
current native Fitting/transpose interfaces, all 57 named L6 tests, and
pinned elaboration. The inherited 50-node L6 ledger below remains credited
to codex-KQjyXV. This is a review of the fixes, not a new full audit of all
1,663 L3 nodes or 487 PMIA nodes. Source-issue reviews and external gaps are
preserved.

## Disposition of each finding

Read every finding and its verified verdict in `RT-AREA-iwasawa-2.result.json`
and `.review.json`, together with `.fixes-2.md`.

| Finding | Disposition |
|---|---|
| /1: Morita Gamma and Gross–Koblitz | Accept L3's correction: signed integer interpolation, continuous unit-valued extension, uniqueness and the unit/nonunit recurrence branches. The modulus-4 exception is respected. The chosen root, coefficient identity, finite telescoping and decay are distinct obligations. Original GK is odd-prime; Robert supplies the separately stated dyadic argument. RD.6 coefficient/splitting requests remain external. |
| /2: Ferrero–Greenberg | Accept the recorded move to L3-2 as the owner of the derivative contract. Fresh read-only preflight confirms the odd primitive character, conductor prime to p, branch θ=χω, log_p(p)=0 and conductor correction `(1−χ(p)) B_(1,χ) log_p N`. The correction disappears under χ(p)=1. Zhao's any-prime proof is distinguished from the original scope. The nonzero arithmetic projection needed for nonvanishing remains a gap. L3-2 is outside the live issue; no receipt is installed there. |
| /3: integral/open log-syntomic producer | Accept the verified ownership correction: the general producer belongs early in CohomologyComparisons Part II after the log/Hyodo–Kato inputs; D.2 imports a smooth specialization. Fresh D.1 preflight supports divided/undivided maps, modified lattices, the exact range through p−2 and the normalized rational exponential. CS.0–CS.3 remains external. D.1's newer independent regulator/source-issue reviews are preserved; no receipt is installed there. |
| /4: Dasgupta–Kakde algebra | The source correction is sound: character-evaluation image with congruences, square presentations, the actual finiteness/nonzerodivisor hypotheses, inverse-character coefficient rings, right-sided compound preimage and presentation-dependent transpose. PMIA still needs changes because current Tau Ceti already supplies its generic Fitting and transpose machinery. The migration boundary is specified below. |
| /5: derived finite slope | Retain the recorded LAD owner gap. A degreewise Fredholm product depends on the chosen compact representative; cohomological spectral support is the invariant. The 2025 solid `f_* f^*` construction has stronger requirements than ordinary monoid inversion. Preserve the shared Stein geometry's single owner. No fresh LAD source audit or closure is claimed. |
| /6: alleged endpoint duplication | Retain the verifier's rejection and RS-16 decision: the Mazur–Wiles/Wiles Hecke route and Kolyvagin–Rubin Euler-system route intentionally remain separate. This does not certify completion of either inherited proof plan. |

No new clearly fixable error was found in the authorized mathematical nodes
or suggested signatures. Changes are fresh scoped receipts, this report and
the handoff. Acceptance does not close inherited producer gaps.

## Fresh source evidence

The following public PDFs were downloaded and the selected locations read.
Scanned Morita, Robert and GK pages were inspected visually. No restricted
book was used. All mathematical descriptions here are in the reviewer's own
words; no source passage is deposited in the repository.

| Source | Locators checked | PDF SHA-256 |
|---|---|---|
| [Morita (1975)](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf) | §1, Lemma 1, Theorem 1 and recurrence, printed pp.255–256 | `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912` |
| [Robert (2001)](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf) | Theorem 2 and §4, coefficient recurrence, Theorems 3–4 and decay, printed pp.163–168 | `2229b561a4f93da503e7264b90d552306d64114e018ff4de3488e7b1b01e2581` |
| [Gross–Koblitz (1979)](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf) | Introduction and §1, (1.2), (1.5), Theorem 1.7, printed pp.569–571 | `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522` |
| [Dasgupta–Kakde, v3](https://arxiv.org/pdf/2010.00657v3) | §§2.2–2.3 pp.15–18; Lemma 3.9 pp.25–26; §6.1 p.40; Appendix B.2 pp.93–94 | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |

Gamma's controls G_p(0)=1, G_p(1)=−1 and G_3(4)=2 distinguish signed
interpolation. For p=2, arguments 1 and 5 are congruent modulo 4, while their
Gamma values −1 and −3 are not. Robert's dyadic estimate retains the binary
digit-sum contribution: telescoping alone proves neither decay nor the
splitting identity. His negative Gauss convention gives value 1 for the
trivial character; the displayed nontrivial exponent range excludes q−1.

DK Lemma 3.9's preimage applies the higher adjugate to the target vector,
embeds in the selected columns and then applies the rectangular compound
matrix. The right-sided identity proves image membership. A left-sided
identity alone would require an additional invariant-image hypothesis.
The finite-ideal reduction in `quadratic-cardinality` keeps the source's
finite-field factors. The transpose of the identity presentation of zero
vanishes, while adding a zero relation contributes a free dual summand.

## Current library reuse required by PMIA

Read-only roadmap main is `dea8191cc6047d6142a65872ebce6eeeb841a29b` and
current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Checked
StableReduction Layer 1 and QuiverRepresentations Layer 6 against the native
interfaces. Neither checkout was built or modified.

| Native declaration at current main | Contract relevant to migration |
|---|---|
| `TauCeti.fittingIdeal`, RingTheory/FittingIdeal/Basic.lean:343 | Every degree, with `Module.Finite R M`; finite presentation is a special case. |
| `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, Basic.lean:349 | Any finite free surjection onto M. |
| `TauCeti.fittingIdeal_eq_minorsIdealOfSet`, Generators.lean:109 | Any set spanning the presentation kernel; the set need not be finite. |
| `Submodule.minorsIdeal_prod_top`, Basic.lean:242; `minorsIdeal_ker_eq_of_surjective`, line 304 | Redundant generators and presentation independence. |
| `TauCeti.fittingIdeal_baseChange`, BaseChange.lean:134; `IsBaseChange.fittingIdeal_eq_map`, line 159 | Arbitrary algebra base change and localization; no flatness hypothesis. |
| `AuslanderReitenTranspose.quotientEquiv`, Algebra/Module/AuslanderReiten/Transpose.lean:192 | Semilinear quotient transport with the actual precomposition-range equality. |
| `AuslanderReitenTranspose.prodMapEquiv`, line 272; `compFstEquiv`, line 315 | Direct sums and zero-relation summands, with representative equations. |

The four nodes `higher-fitting-ideal`, `relation-minors-add-generator`,
`higher-fitting-independence` and `higher-fitting-base-change` should reuse
these APIs. Retarget their consumers, both StableReduction requests, the L4
comparison, reader and suggested signatures together. Keep the concrete
matrix-column/kernel-minor adapter, row/column orientation and specialized
order computations. Retain deficient-relation, high-degree, nonprincipal
and nonflat-base-change controls. A free-module rank test must retain the
native theorem's `Nontrivial R` hypothesis.

For `presentation-transpose`, derive zero-relation change from
`compFstEquiv` and identity-summand change from `prodMapEquiv` plus the split
identity case. `quotientEquiv` still requires the dual-coordinate range
proof and contragredient scalar comparison. Projective base change and
stable comparison of arbitrary presentations remain separate obligations.

Fresh Git-object inspection confirms the Fitting files and these three
transpose equivalences are absent at f790474. The split-identity theorem
`subsingleton_of_comp_eq_id` is present at that pin. Existing `upstreamNotes`
already record the migration. The reader is outside the named issue paths,
and no newer API is silently attributed to the pinned baseline.
`needs_changes` is this completed scoped review's verdict for PMIA.

## Read-only preflight of the omitted outputs

Read the 29 L3-2 `rjw2-gk-*`/`rjw2-fg-*` contracts and four D.1 integral/open
syntomic consumer contracts without editing their packets or suggested
files. Fresh source files match the preceding preflight's hashes.

| Source | Locators checked | PDF SHA-256 |
|---|---|---|
| [Zhao (2022)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf) | Theorem 3.3, Corollary 3.4 pp.468–469; §4, Theorem 4.1, (4.4)–(4.6), Lemma 4.2 pp.471–473 | `923b85f7e3e7e55b4636ff98be2ca5f11a469ec10abe1ee15d6ede55a6936661` |
| [Gross, historical account](https://services.math.duke.edu/~dasgupta/papers/Gross.pdf) | §2, derivative and Gauss/Jacobi projection pp.4–5 | `052d4f5f5aae5a57dfa1dcc669b4e7b431218ddc50619bd457187f557e1b2027` |
| [Ertl–Nizioł, v2](https://arxiv.org/pdf/1603.01705v2) | §2.1 pp.4–5; Proposition 2.1 p.5; §§2.2.1–2.2.2, Theorems 2.2–2.3 pp.7–8 | `131f6cf4ef32b15ceed8951eb48068c4f01fd13e6d3f42972b20e23b643c0d14` |
| [Colmez–Nizioł, v4](https://arxiv.org/pdf/1505.06471v4) | Corollary 3.16 and its proof p.37; §5.1.1 pp.52–53 | `3ab4456e31b5a6c7f21349b34fe020f619f4233a92a2f0105a1ffe2c3e1733ec` |
| [Nekovář–Nizioł, v5](https://arxiv.org/pdf/1309.7620v5) | Proposition 4.13 and its descent/exponential argument pp.53–54 | `97f319e286aa4cf5be1b9c8d100efd1ac779e985d91d8cd6b70e2a3d0870ebd0` |

Zhao's coefficient comparison uses the character χ, with no inverse-character
or additional N factor. Its signed period sum gives the derivative on the
χω branch. Lemma 4.2 evaluates the character-weighted count correction and
recovers the conductor term; χ(p)=1 is a specialization. Gross's projection
uses log_p(p)=0 and an additional arithmetic nonzero input, which is not
proved by the Gamma derivative identity.

In D.1, the complexes U=Fib(p^r−φ) and D=Fib(1−φ_r) have different
Frobenius maps even when their domains agree. Their maps ω and τ have
composites p^r, and τ is not asserted product-compatible. The modified
lattice retains `(p^a a!)⁻¹`. EN Proposition 2.1 identifies D with its
truncation in weights 0≤r≤p−2, so Theorem 2.2 supports D≃τ≤r of nearby
cycles; this is not an untruncated all-weight comparison for U. The bounded
undivided theorem has its stated semistable/root-of-unity hypotheses and
uniformity. The rational exponential is transported as ω_Q⁻¹δ_D; using
δ_U instead would introduce p^r. CN Corollary 3.16 gives the stated
isomorphism/injection range, while NN Proposition 4.13 identifies the
proper descent map with the Bloch–Kato exponential.

This preflight does not replace D.1's independent 72-node regulator review
or any source-issue verdict. It prepares the two omitted scoped fix reviews
for an authorized continuation. External nonvanishing and CS.0–CS.3 inputs
remain open.

## Validation

| Check | Fresh result |
|---|---|
| L3 packet checker after receipt update | Exit 0; 0 errors, 26 inherited short-API warnings. |
| PMIA packet checker after receipt update | Exit 0; 0 errors/warnings. |
| Full PMIA suggested file | Exit 0; 1,075 `sorry` warnings only. |
| Standalone L3 suggested file | Exit 1 at unresolved repository-local `research` imports; its body is not processed. |
| Entire L3 body with documented scratch supplier corrections | Exit 0; 7,177 `sorry` warnings only. |
| Read-only L3-2 packet/suggested-file preflight | Checker: 0 errors/warnings. Standalone Lean: exit 0, 110 `sorry` warnings only. |
| Read-only D.1 packet/suggested-file preflight | Checker: 0 errors/warnings. Standalone Lean: exit 0, 307 `sorry` warnings only. |
| Completion predicate | True for the live five-file outputs, False for the nine-file queue outputs. |

The complete L3 diagnostic concatenates suggested bodies PMIA, L0, L1, L2,
L3 in that order. Deduplicate their library imports at the top and remove
the original library/repository import commands. Apply only the preceding
review's supplier corrections in scratch:

- L1 `smoothedResidue_carry`, original lines 1753–1758: close the first
  conjunct after `(N : ℤ)` and annotate the filter binder `fun i : ℕ => ...`.
- L1 line 1883: expand `[IsBoundedSMul Z K]` to
  `[IsBoundedSMul ℤ_[p] ℚ_[p]]` to avoid the inaccessible-notation diagnostics.
- L1 before `unit_denominator_quinary`, lines 1976–1977: add a local
  `Fact (Nat.Prime 5)` instance proved by `norm_num`.
- L2 lines 3854 and 3856: remove the unused `d` notation referring to
  undefined `eisensteinTwistedDenominator` and its unused `S` notation.

The PMIA/L3 bodies are unchanged. This conditionally verifies prototype
elaboration, not original standalone compilation or supplier closure.
The preceding report retains the unmodified assembly's supplier diagnostics;
this session reproduced the corrected assembly, not every intermediate run.
Diagnostic input SHA-256:
`e9e24fa015e103eb82756442fc59a25fd4da3dc76f501b9ca8b0c850aceca774`.

| Original suggested module | SHA-256 |
|---|---|
| `PadicMeasuresIwasawaAlgebras` | `85f103506252ce8d18359d5b8610365132592e4286e182acf0760857fbde1bc5` |
| `DirichletPadicLFunctions--L0` | `4dbcf3cb98166bcce58c2d183c9396140247488edfbda05567a7b9a1cc3a1de4` |
| `DirichletPadicLFunctions--L1` | `86b69df2dc0cf3e2c3f5b75aae88b98845d57f2de478a28a11bbf081d246c1e7` |
| `DirichletPadicLFunctions--L2` | `c17e92e90269b44ddcec5b1f4f72c0e1a877c3298bd675fc1156bf96cca026cb` |
| `DirichletPadicLFunctions--L3` | `46fe3cba63b8c88eb0e0d734e8138009d421aac3fae334b70116b8f31da1af85` |

L3-2 input SHA-256 is
`d076a92eb2d65a233b4fb86001f6ddc0ebd9c2b5c429c9c33ef1801252e244d3`;
D.1 is `6398a506a4195e0f606576e60253f412d5be2cb30b6c39f455439777f9acfee8`.
All Lean runs were sequential through `lean-check` at Mathlib 082e2d3/Tau
Ceti f790474, with at least 108 GB available at launch. No language server,
Lake project/build/update/cache operation or current-main build was started.
No compiler remains running at submission.

## Scope blocker

The live issue still names five deliverables, reviewing L3 and PMIA. The
queue names nine, additionally requiring the L3-2 and D.1 packets and
suggested files. `issues.deliverables_complete` requires this exact review
id on every packet; `needs_changes` counts as complete. PMIA's verdict is
therefore not the administrative blocker.

[WORKERS.md](../WORKERS.md) requires: “Edit only the files the issue names,
plus your own scratch space.” Authorization for the four additional paths
was requested and remains pending. Those files, the queue, issue body and
labels are untouched. No authorization has arrived; this is a checkpoint
for the scope mismatch. Reconcile the issue and queue or authorize the two additional scoped reviews before dispatching again.
The authorized two-packet receipts alone cannot complete the queue.

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
