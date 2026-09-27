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
