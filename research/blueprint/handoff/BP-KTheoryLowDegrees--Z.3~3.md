# BP-KTheoryLowDegrees--Z.3~3 — revision handoff

Codex, session `codex-xKpLDv`, completed issue #6975 on 7 October 2026.
Branch: `codex-xKpLDv-k0-z3-revision`. Incoming commit:
`8ccfd68a38a91121df6cbfd0fc26e3d2d6a0ccb8`.
[Claim](https://github.com/CBirkbeck/tauceti-explorer/issues/6975#issuecomment-6043079447)
was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/6975#issuecomment-6043082148)
before work started. This is a finished revision planning pass, not a checkpoint
or a claim that the mathematics is implemented. No second job was claimed.

The input is the independent report
[REV-KTheoryLowDegrees--Z.3~2](../reviews/REV-KTheoryLowDegrees--Z.3~2.md).
It accepts the mathematical inventory after eleven in-place repairs and asks
for reconciliation of those repairs and E13/E14 with the reader. It explicitly
does not require closing supplier gaps, proving the suggested file or closing
all four stages. The packet's independent `review` object, including its
`needs_changes` verdict, is preserved for the next independent reviewer to
replace. All 260 node objects, baseline receipts, coverage, gaps, requests,
restructuring and source-issue objects are also preserved without alteration.
The preceding revision audit is archived in `priorRevisionAudits`.

## Corrections verified and propagated

| Node | Reader correction and verification |
| --- | --- |
| Z.3/associated-projective-module | The top exterior line has a K₀ class; its Picard class is the determinant. Checked Weibel I.2.5, I.5.3 and I Exercise 3.3. |
| Z.4/index-ideal-eq-rel-norm | Replaced obsolete clause references with index-ideal-localisation, index-ideal-congr and index-ideal-free, including direct prerequisites. Read the local determinant/norm argument and its six pinned primitives. |
| Z.4/ideal-restriction-determinant | Removed obsolete clause (ii); the explicit invertible-injection-class supplier supplies the Picard identity. Checked Cohen's pseudo-basis determinant and norm contexts. |
| Z.5/regular-curve-finite-resolution | Removed obsolete clause (b). The existing resolution-property supplier gives the vector-bundle quotient; its kernel has finite free stalks over fields/DVRs and is coherent. Current Stacks 09N9 and 0F8A supply the dimension-one affine-diagonal/resolution route. |
| Z.5/skyscraper-class | Replaced the orphaned sequence number with point-skyscraper-exact-sequence and corrected the quotation to physical PDF p.155/book p.147. |
| Z.5/principal-divisor-class-vanishes | Both source-match explanations now use [O/fI]−[O/I]=div(f). Current Stacks 0FDS still prints the reversed sign; the DVR test confirms E27 while leaving vanishing in G₀ valid. |
| Z.6/ring-k-zero-pi-zero | Cites Z.1/extend-scalars-projective-functor, rather than the free-matrix functor. Read its actual finite-projective additive-functor statement in the companion U.1 packet. Split conflations give exactness. |
| Z.6/projective-line-rank-pic | Added the elementary γ-filtration computation and its direct exterior-filtration/pre-λ prerequisites. The suggested geometric omission comment carries the same argument. |
| Z.5/point-ideal-sheaf | Skyscraper formula citation corrected to physical PDF p.155/book p.147. |
| Z.5/point-skyscraper-exact-sequence | Same source-page correction. |
| Z.5/point-divisor-line-inverse | Same source-page correction. |

For P¹, the ring coordinates give L=[O(1)]=1+z, z²=0 and rank kernel ℤz.
The exterior extension filtration descends the pre-λ structure to exact
vector-bundle K₀. For every integer d,
λ_t(dz)=((1+Lt)/(1+t))^d=1+dz·t/(1+t), including negative d by inversion
of the square-zero series. Substitution t/(1−t) gives γ_t(dz)=1+dz·t.
Every filtration generator of weight at least two vanishes. This proof uses
no S.6/S.7 theorem and adds no dependency on them.

All 28 reader source-correction entries now mirror the latest independently
reviewed packet, including attribution. In particular, **E13 is known**, from
Weibel's author errata, and **E14 attributes the positive exponential to the
plus-normalized author erratum**. The negative exponential is confined to the
alternative minus normalization; the combined-draft locator is physical p.101.
The incorrect verbatim erratum attribution is removed. The repaired
actual-projective determinant formula and the virtual rank-zero counterexample
remain intact throughout the reader and suggested source.

## Counts and validation

| Item | Result |
| --- | ---: |
| Nodes | 260: 41 theorems, 119 lemmas, 53 constructions, 19 definitions, 12 applications, 16 comparisons |
| Definitions/constructions | 72, with 450 API items and 280 unit-test contracts |
| All node APIs/tests | 455 / 283 |
| Planets | 18: Z.3 6, Z.4 6, Z.5 5, Z.6 1 |
| Baseline declarations | 375: 217 Mathlib, 158 Tau Ceti |
| Source findings | 28, all retaining independent confirmed verdicts |
| Gap groups / supplier requests | 3 / 16 |
| Explicit node omission contracts | 31: 30 omitted, 1 partial |

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--Z.3.json`:
  **0 errors, 0 warnings**.
- `source_issues.check_issues` and `check_errata.versions_checked` applied to
  the packet's respective fields: no errors. The standalone errata-job CLI
  expects `errata-v1`; it is not the blueprint validation command.
- JSON parsing and a full reader parity check: every node's statement,
  hypotheses, proof steps, acceptance, prerequisites, uses, API/test statements
  and source locator/match explanation occurs in its own reader section.
  Baseline provides/hypotheses, coverage notes/remaining items and supplier
  needs also agree. All 28 errata correction/reason/known fields and reviewer
  attributions agree.
- All 260 node tags and all 455 API/283 test names are represented in the
  suggested source as native outlines, fields, examples or explicit contracts;
  names have no packet duplicates. This is static inspection, not execution.
- Compared the packet with its incoming Git object: node, review, baseline,
  coverage, gap, request, restructuring and source-issue objects are identical.
  Historical source receipts remain an unchanged prefix; new receipts are
  appended and the previous revision audit is retained.
- `git diff --check` and
  `python3 research/blueprint/intake.py check-files` on the four deliverables:
  pass.

The suggested file **was not compiled**. After checking available memory,
`lean-check research/blueprint/suggested/KTheoryLowDegrees--Z.3.lean` stopped
before elaboration because the shared build lacks the prebuilt
`TauCeti.Algebra.AlgebraicGroup.GeneralLinear.DiagonalTorus.Basic` object.
The required pins remain Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; no available existing build at both
pins is recorded. No library build, cache update or language server was started.
Earlier receipts do not certify this file. When the missing prebuilt inputs at
both pins become available, rerun the same `lean-check` command and repair
integration errors while retaining honest missing-carrier contracts.

## Source and baseline scope

The appended `sourceVersions` and the reader's receipt list record the actual
public copies and scope of this revision's reading: Weibel Chapter I physical
pp.11,24,43; Chapter II pp.27–28; the 29 August 2013 combined author draft
pp.55,100–101,154–155,157,327,336; Cohen's 11 July 2001 manuscript
pp.25,30,94–95; current Stacks 09N9,0F8A,0FDS. Their bytes have fresh hashes.
Direct retrieval of Weibel's errata PDF returned 404. Its search-indexed opening
page was read for p.101 Example 4.3 and line −8; no fresh PDF hash or full errata
collation is claimed. The historical full-download receipts remain historical.
There is no claimed new full-source or published/preprint collation.

The six relevant declarations were read at the exact pins with their section
contexts: `exteriorPower.map_top_eq_det_smul`, `Algebra.norm_apply`,
`Ideal.spanIntNorm_localization`, `Ideal.spanNorm_singleton`,
`Algebra.intNorm_eq_norm`, `Module.free_of_finite_type_torsion_free'`.
The full 375-declaration semantic audit remains the independent reviewer's
evidence, rather than a falsely claimed fresh audit by this revision.
The reviewed library coverage, accepted RS-18 result, ownership boundaries
and upstream GrothendieckEulerForms and SchurWeyl documents were read.
No duplicate generic owner or new mathematical node is introduced.

## Status and next work

The planning pass remains `complete`. No stage is `closed`, and every node's
implementation remains `unchecked`. Contrary to the preceding revision's
handoff, the remaining lists are **not all empty**:

| Stage | Status | Remaining items |
| --- | --- | ---: |
| Z.3 | planned | 2 |
| Z.4 | source_decomposed | 0 |
| Z.5 | planned | 2 |
| Z.6 | planned | 1 |

The three supplier boundaries remain general Picard duality/pullback from
JacobianChallenge A; integral GL coefficient freeness, exact-category/K₀
transport and arbitrary-field character comparison; and coherent spectrum,
perfect v-descent and Witt-support determinant interfaces. Z.3 retains the
Serre and coherent-descent obligations. Z.5 retains the general Picard supplier
and assembly of the confirmed early-layer edge changes. Z.6 retains map-level
perfect/support and Euler/rank–Pic compatibility. The sixteen requests continue
to identify each supplier and consumer; Z.4's empty remaining list does not
assert a completed Lean implementation.

The next independent reviewer should check E13/E14 attribution, the eleven
reader repairs and the unchanged accepted inventory, then replace the retained
review object. The current review request is resolved at the document level;
supplier follow-ups and Lean integration remain explicitly separate work.
All information needed to continue is in the committed deliverables and this
note; the disposable scratch directory is not required.
