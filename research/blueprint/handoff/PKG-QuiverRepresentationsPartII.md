# PKG-QuiverRepresentationsPartII

Agent: Codex. Session: `codex-gG1hGz`. Date: 2026-10-14.
Issue: [#9190](https://github.com/CBirkbeck/tauceti-explorer/issues/9190).
The bot confirmed the claim at 04:03:56 UTC. Branch:
`codex-gG1hGz-quiver-multisegment-package`.

## Deliverable and status

The package is complete as a roadmap specification, ready for its independent
package review. It does not claim an implementation or mathematical closure
of the accepted packet's two recorded gaps. Only the three package files and
this handoff changed; the accepted packet, reader and earlier suggested file
are untouched.

- `research/blueprint/packages/QuiverRepresentationsPartII/README.md` gives all
  six layers, exact conventions, supplier contracts, every target, API and
  discriminating Check, proof routes, worked examples and downstream interfaces.
- `research/blueprint/packages/QuiverRepresentationsPartII/Suggested.lean` has
  429 lines of light real-bodied definitions, milestone statements and examples
  over carriers available at the pins. Its omitted-constructions comment points
  back to the complete README. The geometric and representation constructions
  have no invented or sorry-filled carriers.
- `research/blueprint/packages/QuiverRepresentationsPartII/metadata.toml` is
  `topic = "math.RT"`.

The input was the accepted planning packet
`research/blueprint/packets/QuiverRepresentationsPartII.json`, together with
its whole reader and suggested file. Its checker reports 35 nodes, 62 API
items, 48 unit tests, 21 planets, ten baseline declarations, four supplier
requests and two gaps; all six stages are planned and zero are closed. The
literal API arrays contain 63 named entries, including the occurrence-label
data entry. All those names and the 48 original Checks remain in the README,
with extra controls for source signs, grid boundaries and the representation
adapter. No separate planet renaming or packet edit belongs to this job.

| Packet targets | Package locations |
| --- | --- |
| MS.0 interval, multisegment, maximal | §§0.1–0.3 |
| MS.1 space, pair, standard, classification, image, reconstruct | §§1.1–1.6 |
| MS.2 centralizer, coordinates, restrict-up, restrict-down, zariski, generic, conormal, dual, involution | §§2.1–2.9 |
| MS.3 admissible, image-generic, simultaneous, ram, commute | §§3.1–3.5 |
| MS.4 cut, poset, dilworth, rank, grid, path-chain, adjacent | §§4.1–4.7 |
| MS.5 truncate-peel, chain-peel, split, representation, consumers | §§5.1–5.5 |

## Supplier and duplication decisions

The pinned Mathlib commit is
`082e2d37e8b0463410cdb532e111cd43d5a66174`; pinned Tau Ceti is
`f790474821cf4256814db967cb154e7af3d0c369`. Read the statements of all ten
packet baseline declarations, and the graded-linear-map API additionally used
by this package. `Homogeneous` in the Lean file is an abbreviation of
`TauCeti.LinearMap.IsHomogeneous`, with its real coordinate grade submodules.
It imports `TauCeti.LinearAlgebra.Graded.LinearMap` directly.

Checked `data/library-coverage.json`, the relevant link inventory, the current
upstream roadmaps including the nine newer directions and Completed roadmaps,
and the current Tau Ceti library by mathematical operators and hypotheses.
The read-only upstream project was at
`0d144d044dacebca17b654695b6f1ad58f159b27`; its Tau Ceti library was at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake command ran there.
QuiverRepresentations and SemisimpleAlgebras README/Suggested pairs were read
in full as the nearby roadmap models. The smooth-representation SR.5.3
highest-derivative adapter was read for the exact final supplier contract.

Reuse, rather than additional general targets:

- QuiverRepresentations Layers 1, 2 and 5 supply the left path-algebra
  equivalence, Krull–Schmidt with multiplicities and finite type-A interval
  classification. This package owns only the finite-window graded adapter.
- Tau Ceti's graded homogeneity and `homogeneousSubmodule` own the general
  degree calculus. The duplicate generic predicate was replaced by the alias
  above; the opposite centralizer adds the commuting equation.
- Current `Module.End.exists_pow_apply_eq_zero_of_forall_mem_support_lt`
  supplies pointwise local nilpotence for a strictly lowering well-founded
  basis weight. The retained `Pair.nilpotent` target has finite grading and
  one exponent killing the entire endomorphism, for either direction.
- Current `TauCeti.isLocallyClosed_orbit_of_isConstructible` supplies local
  closedness under its Noetherian, translation-continuity and constructibility
  hypotheses. The package cites it, and still requires constructibility and
  the actual orbit/conormal dimension comparisons. The Hopf-ideal conormal
  space at a subgroup identity does not supply the orbit conormal bundle.
- SmoothRepresentationsOfLocalGroups owns the actual GLₙ carrier, normalized
  induction, general Z/L classification and involution. Replace the packet's
  upward ET.6 request by direct SR.0–SR.3 and SR.5.3 contracts. The new local
  comparison inputs and unramified-character adapter stay here. Point ET.6 at
  these owners when its plan is next reconciled; do not copy classification
  into either package.

No accepted interval-specific target was found already supplied elsewhere.
The searches found no relevant open Mathlib PR for multisegments or orbit
conormal symmetry. The bounded Zulip/domain search did find
[Mathlib PR #40741](https://github.com/leanprover-community/mathlib4/pull/40741),
open at head `fb338777dff96ab3aa3d9b373c1fa5349aa86776`. Read its finite
chain-cover and partition signatures. The README adopts its weak/strong
duality vocabulary and retains the occurrence-specific matching corollary.
That PR is not a pinned-library import. Direct attempts to read both the
roadmap-guidance Zulip topic and the PR's linked Zulip topic returned an
unsupported-browser page; neither topic is claimed read.

## Exact limitations and where review should resume

**G1 remains a mathematical implementation bridge.** README §2.7 now spells
out the actual algebraic action and affine point models, smooth constructible
orbits and tangent maps, conormal vector bundles, irreducible equal-dimensional
closures, incidence components, opposite projection and its dense orbit, and
the associated-bundle comparison with a fixed centralizer fibre. These are
scoped targets, not consequences of `IsIrreducible` alone. No claim is made
that their scheme/dimension carriers or proofs exist at the pins. The
independent reviewer should walk that chain and its compatibility maps. Z81
§4.3 applies Pyasetskii; MW II.7 imports that geometric involution. The finite
experiments below are not an independent proof of involutivity.

**G2 has exact local proof inputs, not baseline closure.** README §5.4 states
the arbitrary-unramified-character adapter with
`c = -log |χ(ϖ)| / log q` and real endpoints `[b+c,e+c]` on the unitary line.
It adds `mw_singleton_extract`, `mw_involution_embedding`,
`mw_right_singleton_candidates`, and `mw_algorithm_reinsertion`, with actual
equivariant embeddings, factor order, occurrence matching and exact source
locators. The first three are representation statements to expose from the
supplier or prove in this scoped comparison; classification by itself does
not imply them. MW II.6 and II.13 then connect the algorithm to geometric
and representation labels. Their carriers are README-only. Review these
specializations and the two inductions before treating the comparison as
proved. General Aubert duality is not replanned.

**Additional source-order issue for the reviewer.** MW Remark II.10.3 on
printed p.174 appears to put the two factors in the opposite order from
Lemma II.10.2 and its use in Theorem II.13 on p.176. The rendered p.174 was
read. The package states the right-induced product `Z(q) × α`, derives its
exclusion from II.10.2's greedy matching, and cites II.13's matching use;
it does not reproduce the apparent slip. This contextual resolution needs
independent checking. No official-correction search was completed for this
new observation, and no errata job was claimed.

Preserved the input's two AKY corrections: the grid terminal vertex is `(1,r)`
despite the inconsistent converse-path sentence on p.20; the shortened dual
in the rank-17 example retains the original degree labels, rather than
resetting their displayed origin. The package gives the once-shortened
intervals explicitly. The inherited published-version/official-correction
collation was not independently repeated in this package job.

## Sources actually checked

All mathematical prose is in the worker's own words. Public PDFs and OCR were
read in scratch only. No book or restricted-library file was used or copied.
Source locations use printed pages, not PDF page indices.

| Source | Pass made in this job | SHA-256 of public download |
| --- | --- | --- |
| AKY, arXiv:2110.09070v4 | §§2.1, 2.3–2.5, pp.7–13, and §§3.1–3.3, pp.14–22; operator/image/genericity proofs and rank-17 example | `32326ab828c5cfb524cfb479e337fdd9834496cd9ec39409266c281c49883a6c` |
| MW, J. reine angew. Math. 372 (1986), 136–177 | I.7 pp.144–147; II.1–II.3 pp.148–160; II.4–II.7 pp.160–169; II.10–II.13 pp.172–177; OCR and rendered pp.148,150,151,173,174 for order/formula checks | `49198255b00bc0c005649794a809383c15c87f9c8afbf545b4a692764f4589f0` (whole GDZ journal volume) |
| Z81, original pp.9–21 | §4.3 and Proposition 4.4, pp.20–21, public MathNet original; distinguished §4.5's conjecture from MW's later theorem | No local PDF hash: direct download failed; readable browser extraction used |
| Z98, Documenta Math. ICM 1998 III, pp.407–415 | Whole nine-page source, especially §2 p.410, §3 Theorem 1 pp.410–411 and §5 p.412 | `e609bb40f4aeb41bf0c86c5902dd31a50e202d90c4b70dedcc55f5507175a015` |
| DIL, finite Dilworth lecture | All five pages; first inductive proof of Theorem 3, pp.6-1–6-2, split poset p.6-3, weighted occurrences p.6-4 | `b8ba9e30e36dccc3cead26847ad62d56200406d0035d9374f3806f5fbf943ce3` |

URLs and publication data are in the package's References. No full
Knight–Zelevinsky 1996 article was obtained; the package proves only the
adjacent-rank specialization by independent-coordinate minors and matching,
and uses Z98 to locate the surrounding formula.

## Adversarial mathematics pass

This was the author's validation, not an independent package review.

| Attack | Result and scope |
| --- | --- |
| Empty space, empty multisegment and absent grades | Zero images and centralizers have their actual carriers; one-point Zariski genericity; empty peeling has no `+1`; no interior grid cut for a one-grade window |
| Endpoint direction and shifts | Nonzero E₂₁ detects up versus down; VN image shifts by −1; singleton images disappear; transposition preserves labels while reflection negates them |
| Wrong trace sign or anticommuting substitution | E₂₁ and E₁₂ give commutator `diag(-1,1)`, paired nontrivially with `diag(1,0)` |
| Collapsing copies or keeping every maximal copy | Repeated interval tests; one copy per distinct inclusion maximum; independent occurrence coordinates and injective matching projections |
| Meet versus contain at adjacent cuts | Cut uses membership in either grade; endpoint antichains agree with full-weight inclusion chains; nesting and two isolated adjacent singletons give different ranks |
| Genericity on varying images | Actual range carrier and restricted commuting maps; separate image-admissibility condition; one simultaneous choice over all iterated images |
| False arbitrary-sum additivity | Two adjacent singletons have a nonsingleton dual; additivity is asserted only for the canonical maximal split |
| Rectangular dimensions and nonzero minors | The `2×3` zero-arrow example has generic rank 2; matrix coordinates are separately indexed by source and target occurrences |
| Representation normalizations | GL₀ line, singleton agreement, determinant/Steinberg distinction, unitary χ and `χ=|·|²`; `q>1` and nonzero χ-value make the logarithmic formula defined |
| Source grid and rank-17 labels | Endpoint `(1,r)`, zero invalid-start weight and multiplicity weights; seven intervals of total length 17 give ram length 8 with the displayed original labels |

A standalone finite calculation tested all **1,001** multisets of cardinality
0 through 4 drawn from the ten intervals `[b,e]` with `0≤b≤e≤3`.
It made **40,040 assertions, zero failures**. The right-endpoint MW and
left-endpoint Z98 recursions were implemented independently. Checks covered
their agreement, dual square, graded dimensions, truncation length, ram/tr
commutation, canonical ram split, maximal/remainder truncation, matching
versus antichain width, all cuts −1 through 4, nonempty/empty chain peeling,
adjacent ranks, and all three interior grid cuts after shifting to `[1,4]`.

For each input, construct standard N and the full allowed block-coordinate L
over the prime field of order 1,000,003. Use three nonzero-coordinate samples
with deterministic seeds `271828 + 3*inputIndex + trial`, enumerating cardinality
first and lexicographic endpoint combinations within each cardinality.
Check `NL=LN` and ranks of every degree path between 0 and 3 against the
algorithmic interval type, taking the maximum of the three samples.
Reduction modulo this prime provides rank witnesses below characteristic-zero
generic rank; finite samples and the recursions do not prove the general
geometric theorem. The rank-17 and duplicate-chain examples were also
calculated separately. These computations are described here so their scope
survives deletion of disposable scratch files.

## Validation and submission

- `lean-check research/blueprint/packages/QuiverRepresentationsPartII/Suggested.lean`:
  exit 0 against the shared pinned build, with only `declaration uses sorry`
  warnings. Memory was checked before compiling; checks ran one at a time,
  with no language server or build/cache operation.
- `python3 scripts/check_blueprint.py research/blueprint/packets/QuiverRepresentationsPartII.json`:
  exit 0, zero errors and zero warnings; the input packet remains unchanged.
- All 35 nodes and all named API entries were cross-checked against the README;
  every original definition/construction has its three discriminating Checks.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  exit 0, four files and zero problems.
- The inventory check found 35 target sections, all 63 named API entries,
  19 README Check groups and 58 Lean examples; TOML parsed with exactly the
  intended topic. Git whitespace validation passed for the four-file change.

Next authorized work is the independent package review, starting with §2.7's
geometric bridge and §5.4's exact MW comparison inputs and factor order. The
package worker submits this one job and stops; it does not review this package
or claim another job.
