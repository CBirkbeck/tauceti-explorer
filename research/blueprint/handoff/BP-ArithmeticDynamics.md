# Handoff — BP-ArithmeticDynamics

## Completed planning pass — 10 October 2026

Agent: Codex (GPT-6), session `codex-SXV6c2`; issue #1023; branch
`codex-SXV6c2-arithmetic-dynamics`. The bot confirmed
[claim comment 6102090848](https://github.com/CBirkbeck/tauceti-explorer/issues/1023#issuecomment-6102090848),
and the live issue was reread after confirmation. This is the completion of the
bounded blueprint pass, submitted for independent review. It is neither an
implementation nor an independent review of the inherited mathematics.

### What changed

The issue explicitly instructs a worker inheriting more than 300 nodes to add
none, reconcile the deliverables and set the packet to complete. The inherited
packet already has 415 nodes. This pass therefore preserves every node object,
including its statement, prerequisites, proof sketch, API, tests, planet and
unchecked implementation status. It also preserves all 46 source records,
47 source findings, the source-version records, 429 baseline citations,
17 gaps, 26 requests and five restructuring proposals.

- Set packet status to `complete`. This marks the end of this planning pass;
  no layer is closed and no theorem is certified as formalised.
- Record DY.0, DY.1, DY.4 and DY.5 as `planned` under the target-level coverage
  rule. Requested suppliers and named gaps are permitted leaves of a plan.
  DY.5's selected image/index targets already have nodes; additional survey
  results are explicitly identified as extensions, rather than a reason to
  require every theorem of those sources in this stage.
- Keep DY.2, DY.3 and DY.6 `partial`, with exact missing statements and proof
  inputs. Give all seven layers explicit remaining lists. Replace obsolete
  demands for one node per source estimate with verification and expansion of
  target proof sketches. The unresolved Lech presentation and transport
  contracts remain open, while the inherited parameter/residue/Hensel chain
  stays discharged at planning level.
- Correct the reader's stale 410-node/403-citation/DY.6-88 counts, add the
  target-to-node map and mirror all remaining lists. Source readings retain
  their earlier dates and provenance; this pass makes no fresh source-reading,
  published-version collation or source-error claim.
- Import the pinned Tau Ceti elliptic canonical height, absolute Galois group
  and permutation wreath product directly. Replace the locally reconstructed
  elliptic height in the Lattès and specialization signatures with native
  `Point.canonicalHeight`. State the existing DY.1 Tate-limit comparison on
  that carrier, including the factor two, with zero, torsion and multiplication
  by three acceptance examples. Use native carriers for the wreath recursion
  and arboreal representation. No packet node or new mathematical target is added.

### Inventory and validation

**415 nodes:** 69 definitions, 23 constructions, 155 lemmas, 148 theorems,
9 comparisons and 11 applications. There are **627 API items**, **359 packet
unit tests**, **406 typed Lean examples**, **42 planets**, **429 pinned
baseline declarations**, **17 gaps** and **26 requests**. Layer counts are
39, 29, 55, 68, 66, 65 and 93 for DY.0 through DY.6 respectively.

Checks run on the final deliverables:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticDynamics.json --json`
  uses the supplied declaration index at the required Mathlib/Tau Ceti pins:
  **zero errors and zero warnings**, four planned stages, zero closed stages.
- `lean-check research/blueprint/suggested/ArithmeticDynamics.lean`:
  **exit 0**, **1,181 declaration-uses-sorry warnings**, no other Lean diagnostics.
  The wrapper uses the existing shared pinned build; no library build, update,
  cache download or language server was started.
- Compared all inherited node objects, source records, gaps, requests,
  baseline records, restructuring proposals and source-version records for
  exact JSON equality. The only packet changes are pass status/summary,
  coverage and the normalization migration note.
- All 92 definitions/constructions retain an API and at least three packet
  tests. All 359 qualified test names and all 627 API names (qualified or in
  their local namespace form) occur in the suggested file. This name check
  does not replace independent review of the statements or assertions.
- Checked the authorized four-file diff and whitespace. No source excerpt,
  restricted source file or scratch log is included in the submission.

Read WORKERS, PROTOCOL, the expansion protocol, UPSTREAM_GUIDE, the complete
live issue, campaign scope, seven reviewed AUDIT-08 rows and inherited handoff.
The two upstream style documents are Completed/EffectiveBounds and
ArithmeticDirichletSeries. Screened the nine roadmap additions named in
WORKERS, including nested Suggested files, against the dynamical, Berkovich,
moduli and potential-theory targets. Their current main is commit
`81207c7f16d5abf770f13a7d2bdcdb465c030787`. The existing native elliptic-height
implementation is used, and no supplier roadmap or native library is changed.
The library access index was read; no restricted book was fetched or copied.

### Baseline migration observation (`upstreamNotes`)

The required Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369` defines
`Point.canonicalHeight` at half the naive x-coordinate Tate limit. Current
Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` instead uses the full
limit, in `CanonicalHeight/Basic.lean`. This is a convention change, not an
upstream error. The packet's comparison factors and the suggested signatures
are consistent with the required pin and elaborate there. A package using
current upstream must adapt DY.1's elliptic and DY.6's Lattès/specialization
factors to that convention, while continuing to import the native height.

### Where the independent reviewer and follow-ups resume

Start from the current coverage records and reader's target map, not the old
checkpoint status below. Review the target-level scope, all supplier/gap leaves,
source hypotheses and the native-carrier comparison signatures. Do not add
nodes to this 415-node pass. No stage is claimed closed.

- **DY.0, planned:** receive the SF.0 projective-line/morphism interface and
  resolve scheme-level GIT moduli; the set quotient does not supply a scheme.
- **DY.1, planned:** receive RP.0's general height machine and check normalization
  when the upstream baseline changes. The P¹ and native elliptic inputs remain distinct.
- **DY.2, partial:** plan Fatou/Julia carriers and support statements; resolve
  the Riemann-sphere Laplacian, maximal-entropy-measure and Zieve-proof gaps.
- **DY.3, partial:** supply dynatomic scheme/curve models and genus interfaces,
  the Morton 3-cycle reduction and complex-dynamics inputs, and receive the
  exact-arithmetic, bounded-height and certified-point-list requests.
- **DY.4, planned:** resolve G1–G5 and receive TB.1/TB.6/RP.0 inputs. The P¹
  equidistribution theorem does not prove the general-variety/moduli endpoints.
- **DY.5, planned:** receive its six supplier interfaces and verify finite-level
  and inverse-limit compatibility. Broader PCF, positive-characteristic,
  rational-function and prime-density results are separately scoped extensions.
- **DY.6, partial:** finish the arbitrary-field Lech presentation and embedding
  transport; verify the named degeneration, variation, critical-height and
  orbit-intersection proof inputs; extend specialization to the required
  general base; receive TB.0/SF.0/RP.0 interfaces. Keep conjectures as statements
  or explicit conditional parameters.

The earlier checkpoints below are provenance and contain superseded counts and
status labels. Their precise mathematical contracts remain useful; their
historical reading/check receipts are not new receipts of this session.

## Earlier checkpoints

## Independent-parameter and Hensel checkpoint — 27 September 2026

Agent: Codex, session `codex-hjdg0j`; issue #1023. Claim comment 5853960443
was explicitly confirmed by bot comment 5853961396. Continue the merged PR #3199.
This is a partial blueprint checkpoint, not an implementation or independent review.

### Contribution

Five new DY.6 declarations complete the parameter/root portion of the Lech–Cassels
argument from a supplied integral polynomial presentation:

1. `lech-padic-independent-family`: finite algebraically independent families in ℚ_p,
   derived from a transcendence basis, countability of polynomial/algebraic extensions,
   and the existing Cantor injection into a nonempty complete perfect space.
2. `lech-affine-independent-family`: rational diagonal affine changes preserve
   independence, for arbitrary index types and nonzero scale factors, via inverse
   polynomial substitutions.
3. `lech-independent-residue-tuple`: an independent family of integral p-adic parameters
   in any prescribed integral residue box. Independence is stated in ℚ_p, since ℤ_p
   is not a ℚ-algebra. The empty family and p = 2 are included.
4. `lech-residue-hensel-lift`: reduction commutes with parameter and polynomial
   evaluation, so a supplied simple residue root lifts; leading coefficient and
   denominator exclusions give units and unchanged degree. This statement requires
   neither independence nor generic separability.
5. `lech-independent-hensel-specialization`: the preceding steps and the existing
   prime-selection node supply an independent integral tuple and simple integral root
   above every prime bound, preserving degree and all denominator units.

Only the proof steps and prerequisites of the stable `lech-embedding-lemma` endpoint
change. Its statement and all other 409 inherited node objects are exactly preserved.
All 46 sources, 47 source findings, 26 requests, five restructuring proposals and
42 planets are preserved; no new carrier, definition or API inventory is introduced.
The Lech gap retains exactly the arbitrary-field presentation and embedding transport
contracts. Its parameter/residue/Hensel obligations are no longer open.

Totals: **415 nodes** (69 definitions, 23 constructions, 155 lemmas, 148 theorems,
9 comparisons, 11 applications); **627 API items**, **359 packet unit tests**, and
**403 typed examples** in the suggested file, including 20 new discriminating
acceptance examples. There are **429 pinned baseline citations**, **42 planets**,
**17 gaps** and **26 inherited requests**. All nodes remain unchecked; no stage is closed.

### Evidence and checks

Reread Cassels, *An embedding theorem for fields*, Bull. Austral. Math. Soc. 14
(1976), 193–198, in full, using the exact publisher-scan hash already recorded
in the packet. Read at most three physical PDF pages per extraction and inspect
printed p. 197 as an image for the rescaling, congruence, Hensel and unit calculations.
The source's Lemma 3 and pp. 196–197 support this slice. The affine lemma's arbitrary
index type is an explicit worker generalization: the same inverse substitutions
work for finite-support polynomials. No new source-error finding is asserted.
The other inherited sources and findings are preserved, not independently re-extracted.
The inherited packet lacked the required `sourceVersions` index. This checkpoint
adds the reread Cassels scan and transcribes the existing reading provenance for
the four preprints with stated-result findings. Their exact editions, dates, hashes
and published-text limitations remain those of the inherited records; no new
collation or source-error verdict is claimed.

Read the seven reviewed audit rows before planning, the campaign and seven atlas stages,
the applicable accepted RS-03/25/29 boundary records, the index and relevant Lech nodes,
reader sections and full handoff. Screened all packet statements for a matching independent
p-adic-parameter supplier and checked both pinned libraries. The 53 touching link-map
entries are negative screens; the atlas and accepted restructurings retain the actual
supplier links. The two upstream style documents read in full are Completed/EffectiveBounds
and ArithmeticDirichletSeries. There is no AGENTS.md in the snapshot.

All new baseline references were checked against actual statements with surrounding
hypotheses and byte-verified against the pinned GitHub blobs. The proof uses native
algebraic independence, multivariable/univariate polynomials, p-adic numbers, p-adic
integers, residue homomorphisms and units.

- Packet checker with the pinned declaration index: **0 errors, 0 warnings**.
- Complete suggested file: Lean 4.34.0-rc2 against Mathlib 082e2d3, with only the
  required placeholder warnings: **0 errors, 1,176 placeholder warnings**.
- All 8,482 transitive Mathlib source files byte-match the pinned cache. No Tau Ceti
  module is imported by this inherited suggested file.
- Temporary proof checks were appended only to the authorized suggested file, then
  removed. Complete proofs checked the finite-family and rational-affine lemmas
  directly against the baseline. A complete residue-tuple proof used exactly those
  two planned contracts. The polynomial reduction identity was proved directly from
  baseline homomorphism extensionality. A complete proof of the degree/unit/root
  lifting statement used exactly the inherited simple-reduction Hensel contract.
  All five proof checks elaborated without errors or additional diagnostics.
  These checks validate the routes; the published planning signatures retain placeholders.
- Twenty new typed examples distinguish the empty family, the singleton/transcendence
  comparison, rational/diagonal dependent families, zero scale factors, nonrational
  translations, odd 2-adic transcendental parameters, equal residues with independent
  coordinates, simple versus repeated residue roots, lost degree, and nonzero versus
  unit denominators. An algebraic root is not claimed jointly independent of its parameters.
- Source-issue and source-version checks pass; semantic preservation, acyclicity
  and the four-file intake checks pass. The submission guard rechecks the claim and
  all relevant repository input blobs against the current main branch.
- Only the issue's four deliverable files are changed. No auxiliary Lean file, downloaded
  source, image, build artifact, private path or scratch proof belongs in the PR.

### Resume exactly here

1. Preserve `DY.6/lech-embedding-lemma` and its finite-field-generation hypothesis
   `Algebra.EssFiniteType ℚ L`. Choose and reindex a finite transcendence basis, identify
   its generated field with `FractionRing (MvPolynomial (Fin n) ℤ)`, establish finite
   separability of L over that field, and use the native primitive-element theorem.
2. Extract an integral polynomial H of positive Y-degree with generically separable
   image, a primitive element y satisfying it, and marked expressions U(y,T)/V(T)
   with integral polynomial numerators, parameter-only nonzero denominators, and
   all transport/evaluation identities. H need not be monic after denominator clearing.
   Use baseline localization and common-denominator APIs; do not rebuild them.
3. Feed precisely that H and the marked denominator set into
   `DY.6/lech-independent-hensel-specialization`, with bound max(N,3). This supplies
   every parameter, prime, Hensel-root, leading-coefficient and unit-denominator output.
   Do not replan the now-decomposed independent-perturbation or polynomial-reduction step.
4. Independence makes parameter evaluation injective and hence extends it to the fraction
   field. Transport through the primitive extension, using its defining irreducible
   relation over the parameter field and the supplied root η; prove all evaluation
   identities and injectivity. Irreducibility over the parameter subfield is the relevant
   condition. Do not assert irreducibility of H(Y,ξ) over all of ℚ_p, where it has a root.
5. Evaluate each marked numerator in ℤ_p and divide by its unit denominator. The existing
   unit and localized-coefficient-ring corollaries then apply. The other 16 gaps and all
   unrelated coverage/requests remain as in the historical handoff.

## Historical checkpoint and original roadmap handoff

The following accounts are retained as provenance. Their counts and descriptions of
open independent-perturbation work are superseded by the checkpoint above.

# Handoff — BP-ArithmeticDynamics

## Specialization checkpoint — 27 September 2026

Agent: Codex, session `codex-a71f92`. Issue #1023; claim comment 5853404251
confirmed by bot 5853404992. Base afdcc79b9be9c3047b3c73375bf6a87f29ed19af.
This continues the merged PR #3177. The intervening AdditiveCombinatorics
PR #3195 merged at 06:32:24 UTC.

This remains a partial blueprint, not a completed Lech embedding proof or an
independent review of the inherited roadmap.

### Changes and ownership

- Add two declaration-sized DY.6 nodes:
  `lech-integral-specialization-certificate` and `lech-specialized-simple-prime`.
  Starting from a generically separable integral equation and finite nonzero
  denominator polynomials, they supply a simultaneous integral specialization,
  a nonzero resultant/Bézout certificate, preserved degree, and an arbitrarily
  large prime with a simple root avoiding every marked denominator and leading
  coefficient.
- The hypothesis is separability over the fraction field, not coprimality over
  the integral polynomial ring. No monicity or positive parameter-count
  assumption is introduced.
- Reuse the existing resultant certificate, finite transcendence basis,
  primitive-element and common-denominator machinery. Add ten precise baseline
  citations; no generic algebraic construction is replanned and no new carrier,
  definition, API inventory or planet is introduced.
- Change only the proof/dependency text of the stable Lech endpoint and the
  simple-root certificate consumer, together with the matching coverage/gap
  text. Their statements are unchanged. Preserve all other 406 existing nodes
  and all requests, sources, source findings, restructuring metadata and planets.
- The suggested file adds two theorem signatures and ten discriminating examples,
  all with the required placeholders. The reader states the same mathematics.

Current totals: 410 nodes (151 lemmas, 147 theorems, 69 definitions,
23 constructions, 11 applications, 9 comparisons), 627 API entries,
359 definition/construction tests, 42 planets, 403 baseline citations,
46 source records, 47 inherited source-issue findings, 17 gaps and 26 requests.
DY.6 has 88 nodes. All nodes remain unchecked; no stage is closed.

### Evidence and verification

Cassels's six-page 1976 paper was reread in full for this continuation; its
addendum and Bell v2 §3 retain the exact version/hash provenance of PR #3177.
The resultant formulation is an explicit reformulation of Cassels pp. 195–196,
not a newly discovered source theorem or error. No new source finding is added.
The earlier 43 source records and their inherited findings are preserved, not
represented as independently re-extracted.

Before planning, read the seven reviewed audit rows. Compare 103 relevant
snapshot inputs with the previously read continuation: no changes. Reuse the
unchanged ownership/RS-03/25/29, audit/verifier, links and historical readings;
search both pinned libraries and packet ownership again for this narrower
specialization step. Read all cited new baseline statements with their ambient
hypotheses. A generic polynomial denominator-clearing proof was tested, but
the submitted route uses the shorter existing resultant certificate instead.

- Packet checker with the exact pinned declaration index: 0 errors, 0 warnings.
- Complete suggested file: Lean 4.34.0-rc2, 1,151 expected placeholder warnings,
  no other diagnostics. All 8,482 transitive Mathlib source files byte-match the
  pinned cache; no Tau Ceti module is imported.
- Separate scratch proof file: five general proofs and ten examples, no
  placeholders or diagnostics. Four proofs use only the baseline; the final
  prime assembly takes exactly the existing planned simple-root theorem as an
  explicit argument. That argument is not an extra hypothesis of the published
  endpoint. Neither prime selection itself nor the full field embedding is
  claimed implemented.
- Tests distinguish a vanishing marked denominator from separability, loss of
  degree at a vanishing leading coefficient, a repeated factor with no nonzero
  certificate, good versus bad residue characteristic, zero parameters and
  empty products. The polynomial identities are checked by Lean proofs, not
  numerical sampling.
- Four-file intake: zero problems. Semantic preservation against the immutable
  snapshot: 406 unchanged existing nodes, only the two stated consumers changed;
  all source findings preserved. Fresh-main guard: 112 consulted paths unchanged,
  no new matching links. No source downloads, scratch proofs, build artifacts or
  local paths belong in the PR.

### Resume here

1. Keep `DY.6/lech-embedding-lemma` stable. Build the missing presentation adapter
   from an arbitrary `Algebra.EssFiniteType ℚ L`: choose/reindex the baseline finite
   transcendence basis, identify its generated field with
   `FractionRing (MvPolynomial (Fin n) ℤ)`, establish finite separability over it,
   and use the existing primitive-element theorem. Extract an integral,
   positive-degree, generically separable H and marked expressions U(y,T)/V(T),
   V nonzero, with all evaluation identities. The ten new baseline records
   identify existing pieces, not a closed chain for this adapter.
2. Feed H and the marked denominator set to the two new nodes. They discharge
   the polynomial certificate and integral-specialization/prime-exclusion
   obligations; do not leave these in the presentation gap or replan them.
3. Construct an algebraically independent p-adic tuple in that integral residue
   box, prove polynomial-reduction compatibility, then use the existing Hensel
   bridge. Integral a itself is not algebraically independent.
4. Transport the fraction-field embedding through the primitive extension and
   check injectivity and marked-element evaluation. The earlier units and
   localized-ring corollaries then apply.
5. All unrelated gaps in the historical handoff remain. No independent review
   or completion claim has been made.

## Historical PR #3177 handoff

## Continuation checkpoint — 27 September 2026

Agent: Codex, session `codex-a71f92`. Issue #1023; winning claim comment 5852417168,
confirmed by bot comment 5852417814. Continue from the merged first-pass checkpoint,
not from an empty roadmap.

This is a **partial, source-scoped Lech–Cassels checkpoint**, not a completed roadmap
and not an independent review of the inherited 403 nodes.

### Changed

- Preserve all existing node IDs and every unrelated node, API, test, request, planet
  and source-issue record.
- Add five DY.6 nodes: elementary prime selection outside finite exclusions,
  the simple-root consequence of an integral Bézout certificate, Hensel lifting in
  residue-field form, prescribed-unit embeddings, and integral images of a localized
  coefficient ring.
- Correct the existing embedding signature: finite generation of the field is
  `Algebra.EssFiniteType ℚ L`, not finite generation as an algebra; the marked finite
  set is arbitrary and separate from any field-generating set. Zero is allowed for
  integrality and excluded for units.
- Make the existing p-adic-model consumer use the localized-coefficient-ring node,
  retaining the geometric spreading-out dependency.
- Add three versioned source records with downloaded-PDF SHA-256 values, 14 new
  baseline records, and 14 suggested Lean examples. No new structures, private
  supplier carriers, planets or source-error findings.
- Keep 17 gaps and 26 requests. The Lech gap is narrowed, not removed: its remaining
  finite-field presentation, independent-perturbation and embedding-transport
  contracts are stated explicitly.

Current totals: **408 nodes** (150 lemmas, 146 theorems, 69 definitions,
23 constructions, 11 applications, 9 comparisons), 627 API items, 359 existing
definition/construction unit tests, 42 planets, 393 baseline citations, 46 sources.
DY.6 has 86 nodes. Every node remains unchecked and every stage remains non-closed.

### Sources and boundaries

Read Cassels, *An embedding theorem for fields*, Bull. Austral. Math. Soc. 14
(1976), 193–198, and the addendum, 479–480, in full; check the key equations on
rendered pages. The addendum supplies an elementary proof of prime selection,
so this route does not require Chebotarev. It replaces a proof, not the theorem's
statement. Cassels's Selberg application was read for context and is not a DY.6 target.

Read Bell, arXiv:math/0501309v2 (15 September 2007), §3 pp. 5–6, including Lemma 3.1,
its proof and coefficient-ring application. Locate the 2008 corrigendum,
doi:10.1112/jlms/jdn012: its publisher abstract concerns the analytic arc lemma.
Do not claim its complete proof was read or that it corrects the embedding lemma.
The three downloaded hashes and exact read sections are in the packet.

Before planning, read the seven reviewed library-audit rows and REV-AUDIT-08;
check the applicable RS-03, RS-25 and RS-29 boundaries and the RT-AUDIT-08 verifier.
The two nearby upstream style documents read in this continuous session were
`content/tau-ceti/Completed/EffectiveBounds/README.md` and
`content/tau-ceti/ArithmeticDirichletSeries/README.md`.

Search both pinned source trees, the declaration index and atlas/packet ownership
records for the embedding theorem and prime-divisor step. No exact supplier node
was found. In particular, the existing primes-congruent-to-one theorem handles
cyclotomic values, not general polynomial values; Tau Ceti's integer separation
by all primes is a different statement. The five additions reuse existing
polynomials, intermediate fields, generated subalgebras, p-adic numbers,
p-adic integers and reduction maps.

The inherited packet and its 43 earlier source records were not independently
re-extracted in full. Read its coverage, requests, gaps, structural records,
node index and the relevant embedding/model/DML nodes. The inherited 47 source
issues are preserved, not newly verified. Unrelated source and proof gaps in
the historical handoff below still apply.

### Verification

- Full packet checker with the pinned declaration index: **0 errors, 0 warnings**.
- Full suggested file elaborates with Lean 4.34.0-rc2 and the exact pinned Mathlib
  sources: **1,139 expected declaration-uses-placeholder warnings, no other
  diagnostics**. All 8,482 transitive Mathlib source files were byte-compared with
  the available build cache; this file imports no Tau Ceti modules. The inherited
  file also compiled before editing, with 1,120 such warnings.
- Scratch probes typechecked all six changed/new theorem signatures. Actual proof
  probes checked the simple-root deduction from the explicit prime-selection
  contract, the full Hensel residue/norm bridge, the units corollary from the
  integral contract, the field-generator-to-EssFiniteType conversion, the arbitrary
  rational-denominator application, and six polynomial calculations. Only the
  unproved prime-selection, full embedding and localized-ring endpoints in that
  scratch file retain placeholders. This is signature/proof-route testing,
  not implementation of the roadmap.
- Four deliverable files only. No downloaded sources, proof probes, build artifacts
  or local paths are included in the pull request.

### Resume here

1. Keep the stable `DY.6/lech-embedding-lemma` endpoint. Extract its remaining
   primitive-element/common-denominator/Bézout-presentation contracts into
   declaration-sized nodes after exact matches against the pinned field-theory API.
2. Construct an algebraically independent tuple in an arbitrary integral residue
   box. Cassels Lemma 3 uses uncountability versus finite-transcendence-degree
   algebraic extensions, then rational scaling and translation. The outline does
   not yet provide a closed Lean dependency chain for that argument.
3. Transport the polynomial evaluation through the fraction field and primitive
   extension, prove injectivity and the required evaluation identities, and only
   then consider closing the Lech gap. Do not replace these tasks with a hidden
   hypothesis asserting the desired embedding.
4. Continue the other source and cross-roadmap gaps in the previous handoff. This
   slice did not address the Cohen structure theorem, scheme spreading out, or
   the wider height/dynamics sources.

## Historical first-pass handoff (24 September 2026)

The account and counts below describe the inherited checkpoint, before this
continuation. Its unchanged work is retained; the current counts are above.

Job `BP-ArithmeticDynamics`, issue #1023. Agent: Claude Code, session `cc-2aeb03`, 24 September 2026.

This is a first pass: no packet or reviewed decomposition existed. No restructuring proposal has this roadmap as a member.
Three accepted ones record links into it, and the packet follows them:
- **RS-03:** CN.0 → DY.3 and DY.5, and Tau Ceti EllipticCurves layer 6 → DY.1 and DY.4;
- **RS-25:** StableReduction layer 2 → DY.0;
- **RS-29:** ModularCurves 0D → DY.5.

## Deliverables

- **Packet:** `research/blueprint/packets/ArithmeticDynamics.json`.
  - 403 nodes: 147 lemmas, 144 theorems, 69 definitions, 23 constructions, 11 applications and 9 comparisons.
  - 627 API items, 359 unit tests and 42 planets (six per layer).
  - 379 pinned baseline declarations and 43 sources.
  - 47 source issues, 17 gaps, 26 requests and 5 structural proposals.
  - `python3 scripts/check_blueprint.py … --index <pinned index>` reports 0 errors and 0 warnings.
- **Roadmap document:** `research/blueprint/readmes/ArithmeticDynamics.md`, one section per layer, which agrees with the
  packet.
- **Suggested Lean file:** `research/blueprint/suggested/ArithmeticDynamics.lean`, 7,826 lines in namespace
  `TauCeti.ArithmeticDynamics`.
  - It **compiles**: `lake env lean` at Mathlib `082e2d3` gives only `declaration uses 'sorry'` warnings.
  - Every API item and unit test in the packet occurs in it under its packet name.
  - All layers use DY.0's `RationalMap`, the DY.1 heights and the DY.2 escape rates, with no private copies.
  - The only stand-ins left are for external suppliers, each marked in its section: the Berkovich line, Laplacians,
    potentials and energies (TB.0, TB.1, TB.6), and a moduli height (RP.0). Tau Ceti's elliptic canonical height is
    written with DY.1's Tate limit.

## What is closed and what remains

| Layer | Status | Nodes | What remains |
|---|---|---|---|
| DY.0 | source decomposed | 39 | nothing in the sources; the scheme structure of M_d, M_d^cm and Milnor's M₂ ≅ 𝔸² over ℤ waits for a GIT owner (gap, structural proposal) |
| DY.1 | source decomposed | 29 | nothing in the sources; the theorems for general varieties rest on RP.0's Weil height machine (request) |
| DY.2 | partial | 55 | Berkovich Fatou and Julia sets with supp µ = J; the archimedean nodes rest on two gaps (the measure-valued Laplacian on the Riemann sphere; Lyubich–Freire–Lopes–Mañé); Zieve's period-exponent bound (no public text) |
| DY.3 | partial | 68 | the CN.0, ED.0, ED.3 and ED.4 requests (exact arithmetic, point lists, Chabauty certificates); smoothness and irreducibility of the unicritical dynatomic curves (gap); the genus of X₁(n) and X₀(n); Morton's reduction of Φ₃ to an elliptic curve |
| DY.4 | source decomposed | 66 | nothing in the sources; the global Arakelov inputs to Yuan's theorem, Yuan–Zhang theory, the bifurcation measure and multiplicities of periodic points are gaps G1–G5 |
| DY.5 | partial | 65 | Jones's infinite-index theorem for PCF maps (needs Ihara); Jones's finite-index theorem (needs Siegel's theorem); Juul in positive characteristic; quadratic rational functions; the density theorems |
| DY.6 | partial | 81 | the proofs recorded as gaps (Cohen structure theorem, Lech, DeMarco–Faber/Favre degeneration, DeMarco–Wang–Ye, Tate's variation theorem, McMullen and Silverman for Ingram, Ghioca–Tucker–Zieve inputs); Ingram's Lemmas 7–12; specialisation over a general base curve |

**Acceptance conditions:**

- **DY.0.** Compares conjugate maps and a map whose resultant vanishes at a bad prime. Equality of iterates is equality
  of morphisms.
- **DY.1.** Uses the power map and multiplication on elliptic curves and abelian varieties. The ampleness-free
  statement (`canonical-height-for-a-divisorial-eigenclass`) is separate and does not carry the zero-height criterion.
- **DY.2.** Computes z² − z − 1 (good reduction everywhere) and bad-reduction maps, with the residue characteristic
  kept.
- **DY.3.** Handles a root of lower exact period with nontrivial dynatomic multiplicity.
- **DY.4.** Keeps sequences inside exceptional sets out of the generic hypothesis.
- **DY.5.** Proves every level for x² + 1 over ℚ, by Stoll's theorem.
- **DY.6.** Gives the power-map and Lattès examples. Uniform boundedness, dynamical Lehmer, general dynamical
  Mordell–Lang and André–Oort are statements consumed only as explicit hypotheses.

**Request answered.** The canonical height of a rational map of ℙ¹ normalised against Mathlib's Weil height is
`DY.1/canonical-height-on-the-projective-line`. ClassicalArithmeticCompletion CA.6 requested it.

**Sources beyond the roadmap document.** The accepted source routes of two paper extractions name these layers, and
their items are covered:

- **DeMarco–Krieger–Ye** (Ann. of Math. 2020), in DY.2, DY.4 and DY.6. This covers escape rates of the Legendre Lattès
  maps, canonical measures, adelic metrics and the Arakelov–Zhang pairing, the energy estimates, and Theorem 1.4.
- **DeMarco–Mavraki–Ye** (Forum Math. Pi 2026), in DY.0, DY.4 and DY.6. This covers M_d and M_d^cm, the critical height
  and Ingram's comparison, and equidistribution of PCF parameters.

The issue did not list either paper.

## Merge decisions

- **Duplicates removed.** Three DY.6 nodes duplicated earlier layers and were removed. Their users now cite the
  earlier node:
  - DY.6's critical divisor → `DY.0/critical-points-of-a-rational-map`;
  - DY.6's relative canonical height → `DY.1/canonical-height-over-a-global-height-field`;
  - DY.6's uniform-boundedness statement → `DY.3/uniform-boundedness-conjecture`.
- **API and tests carried over.** The removed nodes' useful API and tests moved to the surviving nodes:
  - the chain rule `RationalMap.criticalPoints_comp` (local degrees multiply) and `RationalMap.criticalPoints_iterate`;
  - the function-field test `relCanonicalHeight_sq_add_t_zero`: ĥ of z² + t at 0 over k(t) is 1/2;
  - the ℙ¹ form of uniform boundedness with an explicit constant.
- **Prototype restrictions.** Where the combined Lean file needed it, a statement was stated in a narrower form:
  - `periodForm_map` and `dynatomicForm_map` hold for field homomorphisms;
  - the function-field test takes the admissible absolute values of k(t) as a hypothesis.

## Requests made (26)

- **TropicalAndBerkovichArithmetic:**
  - TB.0 (three): the Berkovich line, analytification and the hybrid space;
  - TB.1 (two): potential theory and pull-backs;
  - TB.6 (two): local potential theory, metrics and Chambert-Loir measures.

  DY.2's TB.1 request and DY.4's TB.6 request cover overlapping potential theory, and their owners should merge them.
- **HeightsRationalPointsAndObstructions RP.0 (three):** the Weil height machine, Néron–Tate heights and ample heights on
  M_d.
- **SchemeAndStackFoundations:** SF.0 (two) and SF.5.
- **ComputationalNumberTheory CN.0.**
- **EffectiveDiophantineMethods:** ED.0, ED.3 (four) and ED.4.
- **InverseGaloisAndArithmeticFundamentalGroups IG.2:** Hilbert irreducibility.
- **Tau Ceti:** ModularCurves 0D, NumberFieldArithmetic layer 3, and AlgebraicCurves layers 6, 7 and 8.

## For the orchestrator

1. **Structural proposals:**
   - Geometric invariant theory as a layer of AlgebraicModuliForArithmeticGeometry, for M_d.
   - An owner for global adelic intersection theory and Yuan's arithmetic Siu inequality: the ArakelovGeometryAndAbelianHeights
     Part II proposed by PAPER-YUAN-26.
   - Move equidistribution of PCF maps in moduli to the proposed ArithmeticDynamicsPartIIBifurcation.
   - Sub-layers DY.4a–e.
   - Drop the unused stage edges ED.0, CN.0 and IG.0 → DY.5, and add IG.2 → DY.5.
2. **Stoll's Lean formalisation.** Stoll's own Lean formalisation of his 1992 theorem exists (GitHub
   `MichaelStollBayreuth/QuadraticIterates`, Apache-2.0). The DY.5 section cites it; integrating it should be coordinated
   with its author.
3. **Retired supplier.** The roadmap's input `FoundationsAndLibraryIntegration` (LI.4) names a roadmap retired on
   16 September 2026. No node names it.

## Sources

43 free sources were read. Their URLs, the sections read and the SHA-256 of each are in the packet. Among them:

- Call–Silverman (Compositio 1993, Numdam);
- Silverman's and Benedetto's Arizona Winter School notes;
- Milnor, and Levy;
- Rumely on the minimal resultant locus;
- Morton–Silverman, Hutz, Poonen, Flynn–Poonen–Schaefer and Stoll (2008);
- Baker–Rumely, Favre–Rivera-Letelier, Chambert-Loir, Petsche–Szpiro–Tucker and Yuan;
- Jones's survey, Aitken–Hajir–Maire and Juul;
- Ingram;
- Ghioca–Tucker–Zieve and Bell–Ghioca–Tucker;
- Milnor on Lattès maps;
- the two DeMarco papers.

All 33 arXiv numbers recorded in the packet were checked against their abstract pages.

**Missing:** Silverman's *The Arithmetic of Dynamical Systems*, Baker–Rumely's book, Tate's variation paper and Zieve's
thesis. Public substitutes are used wherever they exist.
