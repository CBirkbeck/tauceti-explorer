# Independent review of ReductiveGroupsPartII

**Verdict: needs_changes.** Completed review of the atlas proposal for issue #479,
by Codex, session `codex-391GIw`, on 11 October 2026. This session did not write
the blueprint. This is a finished negative review, not a continuation checkpoint.

The decisive error is ownership. The atlas tracks the open upstream
[PR #785](https://github.com/TauCetiProject/TauCetiRoadmap/pull/785), which already
contains ReductiveGroupsPartII's seven layers. PROTOCOL §15 counts tracked open
roadmap PRs as existing work. WORKERS also excludes reviewing Tau Ceti's own
roadmaps in an atlas job. This packet instead describes all seven layers as a new
plan extending only the older ReductiveGroups anchor. It needs to import the
existing Part II targets and identify its additional scope as an extension.

## Evidence and review boundary

The upstream comparison uses
[`README.md`](https://github.com/TauCetiProject/TauCetiRoadmap/blob/bd3d0c373f9ed1aec95ea3f34ff8970ec7ed0a6d/TauCetiRoadmap/ReductiveGroupsPartII/README.md)
and
[`Suggested.lean`](https://github.com/TauCetiProject/TauCetiRoadmap/blob/bd3d0c373f9ed1aec95ea3f34ff8970ec7ed0a6d/TauCetiRoadmap/ReductiveGroupsPartII/Suggested.lean)
at PR head `bd3d0c373f9ed1aec95ea3f34ff8970ec7ed0a6d`. Both files are identical
to those in the supplied read-only checkout at
`070dc2becd74419e76303ede84b465ed4a69461f`. The PR was open and draft when
checked; it need not be merged to fall under §15. The atlas's
`upstream/CaraianiNewton.md` explicitly records #785 for this roadmap.

Every one of the 180 nodes has a `review.checked` entry identifying an upstream
location and explaining the ownership disposition. **166 have the exact same
target identifier in the upstream README.** This count establishes an ownership
overlap, not equivalence of every clause or a correctness verdict on that README.
The remaining 14 were compared individually below. Some are inside larger
upstream targets; others go beyond its declared scope.

All 180 entries use `unverifiable`: acceptance of each atlas node is withheld
until its import/extension boundary is resolved. The eight local repairs below
are recorded in these entries without changing that verdict to `corrected`,
which would imply that the whole node was justified. The review did not continue
into a mathematical review of the existing upstream targets. It does not certify
every source match, supplier contract, proof sketch, API or test in this rejected
plan. That limit is deliberate and follows WORKERS, not a claim that those
remaining statements are false.

## Counts and coverage

| Item | Before | After |
|---|---:|---:|
| Nodes | 180 | 180 |
| Definitions / constructions | 23 / 36 | 23 / 36 |
| Theorems / comparisons / applications | 110 / 2 / 9 | 110 / 2 / 9 |
| API items | 368 | 368 |
| Unit tests | 249 | 249 |
| Planets | 38 | 38 |
| Baseline declarations | 61 | 62 |
| Sources | 38 | 39 |
| Requests | 17 | 17 |
| Gaps | 0 | 5 |
| Source issues with independent verdicts | 0 | 7 |
| Stages marked planned | 7 | 0 |

All seven coverage records are now `partial`, with stage-specific `remaining`
work. The rejected blueprint's status is `partial`; the independent review is
complete. Five gaps name ownership reconciliation, the étale local-homeomorphism
input, tensor splitting over a general splitting field, determinant-norm gluing,
and non-affine lft Weil restriction for torus Néron models. No new mathematical
node or planet was added, and no atlas content was promoted.

Each definition/construction has at least four test entries. The planet counts
by layer are 5, 5, 6, 6, 6, 6 and 4. These structural counts pass the checks; they
are not an independent certification that every test discriminates every
incorrect definition or that every planet has the right owner after routing.

## The 14 targets without an exact upstream identifier

The line numbers refer to the fixed upstream README above. The packet's
per-node entries also cover the 166 exact identifier matches.

| Atlas node suffix | Upstream comparison and action |
|---|---|
| `weil-restriction-dimension` | RG2.0a.1, line 990: already a clause of smoothness and closed-immersion preservation. Import it. |
| `smooth-model-torsors` | Scope, line 62: explicitly excluded connected-special-fibre torsors. An extension can import the existing Lang and smooth-model inputs. |
| `r-smooth-torus` | Scope, line 81: explicitly excluded R-smoothness and the closure inside non-affine lft restriction of scalars. |
| `neron-model-closed-immersions` | Scope, line 83: explicitly excluded Kisin–Zhou Lemma 2.4.4 and Proposition 2.4.6 criteria. |
| `split-torus-bounded-model-smoothness` | RG2.3.1, line 3493: the related reductive closed-immersion criterion does not itself state this normalization criterion. Verify and route its precise additional input. |
| `r-smoothness-criteria` | Scope, line 83: outside the existing scope; cite its affine tame fixed-point theorem as an input. |
| `invariant-chain-direct-summand` | RG2.3.4, line 4111: the direct-summand conclusion is inside tame hyperspecial realization. Distinguish a needed interface refinement from replanning that conclusion. |
| `r-smooth-fixer-immersions` | Scope, line 90: explicitly excluded fixer immersions and the field-extension version with `p > 2`. |
| `tame-subdivision-to-hyperspecial` | RG2.3.4, line 4103: the KPZ classical realization is already present. Compare the PR24 exceptional-type/subdivision version before naming an extension. |
| `filtration-under-field-extension` | RG2.3.5, line 4151: use the existing group and Lie filtrations as inputs; identify the extra tame positive-depth rational-point comparison precisely. Adler's intersection with the original parahoric alone is narrower. |
| `invariant-cocharacter-lifting` | RG2.4.1, line 4877: already the third clause of rational Kottwitz surjectivity. |
| `simple-cell-adjacent-depth` | RG2.4.1, line 4922: adjacent integer-depth containment already occurs in simple-cell multiplication. Keep its normalization explicit when importing. |
| `adjoint-cartan-coset-lifting` | RG2.4.1, line 4877: already the fourth clause of rational Kottwitz surjectivity. |
| `l-group-levi-embedding` | RG2.5.2, line 5830: standard field-valued dual Levis already occur under `l-group-levi-subgroup`. The assertion over all coefficient algebras needs a separately specified extension. |

An exact identifier match can also contain new clauses. Examples are scheme
fibre-product compatibility, equal-characteristic infinite transcendence degree,
the general-E Witt description, preservation of étale/surjective/open maps,
centres/derived groups and relative-root multiplicities, the fppf roots-of-unity
quotient, non-split toral-embedding uniqueness/equivariance, arbitrary-adjoint
parahoric association, R-smooth kernel exactness, and the integral z-extension
dual embedding. The upstream Scope and ownership section, lines 27–100, states
these boundaries. Import the shared target before planning any genuinely new
clause. This review does not assign a new roadmap identity itself.

## Atlas corrections made in place

1. **Completed maximal unramified extension.** The algebraic closure of a local
   field E in its completion cannot be countable: it contains the uncountable
   field E. Replaced that argument with Blaszczok–Kuhlmann,
   [Theorem 1.1](https://fvkuhlmann.de/algind.pdf), manuscript pp. 2–3. Apply its
   residue-algebraic completion conclusion to E^ur/E: the extension is algebraic,
   residue degrees are unbounded, and the discrete value group has countable
   cofinality. This gives infinite transcendence degree in either characteristic.
   Added that exact source and its hash. This does not authorize recreating the
   upstream completion target.
2. **Affine-point functoriality.** The fibre-product equalizer has the required
   subspace topology without a Hausdorff hypothesis. Its claimed unconditional
   closedness was removed; closedness requires a Hausdorff value ring.
3. **Integral points.** Added the directly used `points-topological-group`
   prerequisite. The resulting graph remains acyclic.
4. **Representing algebra.** Replaced the unsupported injectivity assertion for
   scalar extension with zero detection by a finite projective dual frame. This
   works without assuming positive rank or faithful flatness everywhere.
5. **Weil-restriction base change.** Added its directly invoked adjunction node
   as a prerequisite; that addition is acyclic.
6. **Separable splitting.** The general splitting field need not be separably
   closed or algebraically closed. The two cited library results cannot be
   applied under those missing hypotheses. The sketch now distinguishes the
   separably closed decomposition from the primitive-element/CRT argument and
   uses `AlgHom.card_of_splits` for the count. Exact CRT interfaces remain a gap.
   The Lean comment now describes its actual `IsSepClosed` signature.
7. **Norm torus.** For a finite locally free algebra, define the determinant norm
   locally and glue it. The pinned `Algebra.norm` is the needed determinant on
   finite free charts; its definition uses a fallback value when no finite basis
   exists. Corrected the statement and API comparison accordingly, and recorded
   the gluing input as a gap. The suggested signature already assumes free
   modules; its comment now records that limit.
8. **Tame fixed points.** Exposed the non-affine lft input needed for the full
   Néron application. A split torus's full lft Néron model has infinitely many
   components and is not the smooth affine finite-type X of the preceding
   theorem. Corrected Edixhoven Theorem 4.2's locator to p. 296; Proposition 4.1
   is on p. 295. The full torus-model assertion remains a gap.

The `readmes/ReductiveGroupsPartII.md` reader is not an allowed deliverable of
this issue and was left unchanged. It still contains the old countability proof
(line 136), unconditional equalizer closedness (193), injectivity assertion (686),
global `Algebra.norm` API equality (1066), and Néron argument/page (1125). Its
prerequisite lists also need the two additions above. Regenerate/revise it only
after the manager resolves the import/extension identity.

## Baseline, suppliers and the handed red-team finding

Opened all 61 inherited declaration statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Every named declaration exists.
The 18 cited Tau Ceti module files in the shared pinned build were checked
against the recorded Git objects. The current Tau Ceti library and the supplied
upstream ReductiveGroups and OrthogonalSpinGroups documents were also consulted
for ownership. Nothing was built or edited in those read-only trees.

No declaration was removed. `AlgHom.card` remains a correct algebraically closed
field result in the catalogue, but its use for the node's general splitting-field
count was replaced by the newly added `AlgHom.card_of_splits` (the same pinned
module, lines 354–357). `equivPiOfIsSepClosed` is explicitly confined to its
separably closed case. Other limits read from the declarations include the valued
field input for the field structure on completion, free-module determinant
comparison, zero infinite index for `Subgroup.index`, and data rather than an
existence theorem for `Module.Basis.SmithNormalForm`. Full compatibility of every
baseline citation with every unaccepted node is not certified by this report.

The 17 supplier requests are retained as draft contracts, not all accepted.
The ownership revision must replace the requests internal to already supplied
Part II work with that roadmap's interfaces. It must also check the contracts
needed by the retained additions, including non-affine lft representability;
an affine finite-presentation result is insufficient for that purpose.

**RT-AREA-algebraicgeometry/11:** the finite-presentation Weil-restriction carrier
is correctly imported from ModularCurves 0F, whose actual README states affine
representability along finite locally free maps and arbitrary base change.
The packet's representing-algebra node includes Yoneda comparison with it, and
the reader makes the same distinction. The arbitrary affine extension is not
attributed to the general algebraic-space layer R09.3. Thus this particular
finding is addressed. It does not resolve the newly existing Part II owner.

## Source issues

All seven entries now have independent `confirmed` verdicts, with qualifications
where the original finding went too far. The version-of-record PDFs were read
alongside the preprints, and four published URLs, hashes and dates were added to
`sourceVersions`. The 34 public source-file hashes in the inherited catalogue
were checked and matched; cleared sources were read in place. Downloading a
source was not treated as verification of all its cited passages.

| Finding | Published locator | Independent conclusion |
|---|---|---|
| E40 | He, Lemma 15 and proof, pp. 16–17; Lemma 16, p. 17 | A pro-p assertion alone does not justify fixed-coset lifting. Replaced the defective illustrative example with A = ℤ/p², σ(a) = (1+p)a, H = pA. A/H is fixed but A^σ = H cannot lift its nonzero cosets. The actual geometric Lang input still needs proof; no false theorem is claimed. |
| E41 | Kisin–Pappas §1.3.8 and Proposition 1.3.9, pp. 142–143 | In the local-field case, the assumed K̃ = K̃^ur is infinite over K. The finite restriction/fixed-point proof needs a finite tame extension followed by descent. The strictly henselian case is distinct; no blanket nonrepresentability or counterexample is claimed. |
| E42 | Kisin–Pappas Proposition 1.3.3 proof, pp. 140–141 | The weight-string summands must be indexed by λ′, including the V_j display. |
| E43 | Kisin–Pappas–Zhou Proposition 2.2.2(2), p. 11 | The reductive stabilizer over the splitting field is at the adjusted hyperspecial point x′, not necessarily the original x. |
| E45 | Kisin–Pappas–Zhou Remark 2.4.3(a) and (2.4.5), p. 15 | Correct the target restriction from Õ to O and balance the fixed-point parentheses. |
| E46 | Kisin–Pappas Corollaries 4.2.12–4.2.13 and Remark 4.2.14, p. 188 | Connected special fibre is needed by the printed Lang argument and is not inferred solely from equality of rational level groups. Changed `affects` to `the proof`: no counterexample to the corollaries was established. KPZ Theorem 7.1.3(3), p. 73, supplies a connected-stabilizer formulation and separately assumes a very good embedding; it is not an unconditional replacement. |
| E47 | van Hoften §2.2.5, p. 12 | The standard Iwahori is contained in the very special parahoric; the printed inclusion is reversed. |

E46's illustrative component group is ℤ/3 with Frobenius acting by −1: it has
trivial rational components over F_q but nontrivial ones over F_q². This explains
the point/scheme distinction and is not presented as a Shimura-variety
counterexample. The finding now describes connectedness as a sufficient repair,
not a condition this review proved necessary for every conclusion.

## Validation and manager action

- `python3 scripts/check_blueprint.py research/blueprint/packets/ReductiveGroupsPartII.json`:
  zero errors and zero warnings.
- Source-issue schema and version metadata checks: pass.
- One final `lean-check` of the suggested file in the existing pinned build:
  exit 0; 693 warnings, all `declaration uses sorry`. The initial check also
  passed. No other warning was emitted. The repairs to this file change two
  comments, not the admitted signatures or proofs.
- Review completeness checks: 180 unique node dispositions, seven source-issue
  verdicts, seven precise partial coverage records; no added nodes or cycles.

The manager needs to decide how to synchronize this atlas job with tracked
upstream PR #785 and route a successor extension. This requires changes to
roadmap identity, queue, supplier links and reader/package files outside this
issue. Until that decision, the plan is `needs_changes` and must not be promoted
or packaged as a second ReductiveGroupsPartII plan. Existing upstream work is
cited as the owner; this report requests no atlas fix to that upstream roadmap.
