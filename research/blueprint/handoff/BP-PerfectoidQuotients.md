# BP-PerfectoidQuotients — completed target-level planning pass

Codex — codex-LrLkX3. Refs #971. The winning claim is comment 6026336618,
confirmed by bot comment 6026338732; the issue was reread after confirmation.
This is a complete planning pass under blueprint protocol §0. All seven stages
are planned, with precise closure work remaining. No stage is closed, and every
implementation status is unchecked. Stop here for independent review; further
refinement belongs to the follow-up jobs that review acceptance creates.

## Deliverables and counts

The packet, reader and suggested file cover the same **61 nodes**:
3 definitions, 4 constructions, 15 lemmas, 31 theorems, 2 comparisons and
6 applications. They include **42 API items, 34 definition/construction tests,
3 additional theorem tests, 12 planets and 65 baseline declarations**. The
reader has about 23,600 words. Every definition/construction has recorded uses,
an API and at least three discriminating tests. The planets satisfy the
per-stage limit. All 20 predecessor node identifiers and the 12 historical
aggregate objects are retained; the historical aggregates are not counted as
additional current graph nodes. Their valid material is reconciled into local
nodes or exact supplier imports.

| Scoped stage | Status | Closure work |
| --- | --- | --- |
| Q0 | planned | G1 normalization; G2 supplier interfaces |
| Q0:animated-application | planned | G2 prism/animation interfaces |
| Q0:integral-algebra | planned | G1 completion/normalization; G2 interfaces |
| Q1 | planned | G2 PR.1 comparison interfaces |
| Q2 | planned | G2 carriers; G3 stationarity; G5 base change; G6 colimits |
| Q3 | planned | G2 carriers; G4 André limits/ind-syntomic refinement |
| Q4 | planned | G2 carriers; G5 descent; G6 colimits; G7 analytic transport |

The integral prefix includes the BMS1/BMS2 normalization, finite-Witt
Frobenius equivalences, primitive kernel, elementary bounded torsion, relative
cotangent vanishing and the absolute completed cotangent module. It adds the
Česnavičius–Scholze integral operations and p-integral closure, and the
Anschütz–Le Bras completely étale/henselian extension. Q2 has the initial
prism, universal perfectoidization and its actual universal mapping property;
Q3 covers the prism lifting import, André refinements, Bhatt root
neighborhoods, monic root extensions and the functorial almost construction.
Q4 states surjectivity, the principal compatible-root quotient formula and
the analytic strongly closed quotient, with their precise hypotheses.

## Validation and suggested signatures

The final suggested file elaborated with `lean-check`: **0 errors and 91
warnings, all proof-placeholder warnings**. It imports 13 individual Mathlib
modules and no Tau Ceti module. Memory was checked before compilation; no
language server, package update, cache download or library build was started.
Compilation validates signatures and instances, not theorem proofs.

There are **26 full and 10 restricted typed target signatures**, **20 explicit
signature omissions** and **5 generic supplier applications**. The file has
71 named declarations and 33 examples. Of the 42 API items, 25 are typed and
17 are explicitly omitted; of the 37 packet tests, 24 are typed and 13 are
explicitly omitted. Twenty-one typed examples are definition/construction
tests, three are theorem tests and nine are further acceptance examples.
Each restricted target identifies the missing clauses; each omitted target
lists its mathematical statement, API and tests as comments. Comments are not
counted as signatures. The semiperfectoid and perfectoidization prototypes use
actual ring properties and a quantified universal mapping property, without
unspecified proposition fields or replacement prism/derived carriers.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The source statements of
all cited baseline declarations were read. `data/library-coverage.json` has
no PerfectoidQuotients entry in this snapshot, so the accepted AUDIT-38 and
REV-AUDIT-38 records were read directly. AdicSpaces and
LocalFieldsRamification were read as the two upstream style examples.

The indexed blueprint checker reports **0 errors and 0 warnings**. The
four-file intake reports zero problems. Source-issue validation, identifier
and API/test parity, literal source excerpts, inherited aggregate preservation
and authorized-path checks pass. All 80 excerpts are at most 300 characters:
76 PDF excerpts match the acquired text after typography normalization; the
four Stacks passages were checked on their source pages. No private paths,
source PDFs or extracted source text are submitted.

The local graph has 123 node edges and is acyclic. Following existing exact
supplier nodes recursively, with the three proposed narrowed Q0 bindings,
gives 405 reachable declarations and 1,426 edges, with no cycles. Twenty-two
stage or reserved imports remain opaque contracts. This is an explicit-node
audit under the stated proposals, not a global certification of the coarse
supplier-stage graph. Supplier packets whose reviews say needs_changes remain
planned mathematics and contribute to G2.
The publication check refreshed changed supplier inputs against main
`9f506ae2ba5be082cadc46e3cb77531b1ee03660`; the exact-node graph retained
these counts. CR.0 still does not state the requested Frobenius-pullback
syntomic formula. Forty changed collated source records were screened; the
four source-adjacent changes lie outside the scoped passages. The four
deliverables were unchanged on main and the issue retains this worker’s claim.

## Sources read and source corrections

Ten public PDFs were acquired afresh on 6 October 2026. The packet records
URLs, exact SHA-256 hashes, editions and reading ranges. The source reading is:

- Bhatt–Scholze: all statements and proofs of §7, pp.55–62; Lemma 4.8,
  pp.38–39. The late-extension boundary was checked against Corollaries
  8.11–8.14, Definition 10.1–Lemma 10.5, Theorem 10.9's statement,
  Theorem 10.11 and Lemma 10.12. Generic earlier inputs use their supplier
  contracts and the specified source readings; no full-paper reading is claimed.
- BMS1: Lemma 3.2, Definition 3.5, Remark 3.8, Lemmas 3.9–3.14 and
  3.20–3.21, including the proofs, pp.19–27 at the recorded locators.
- BMS2: Lemmas 4.15–4.17, Definitions 4.18 and 4.20, Proposition 4.19
  including both torsion proofs, Remarks 4.21–4.22, pp.21–23.
- Česnavičius–Scholze: §2.1.1–2.1.11, including all five integral operations,
  pp.10–17; the first §2.1.12 statement fixes the Part II boundary.
- Česnavičius: §4.2–4.8, definitions and proofs, pp.7–9.
- Anschütz–Le Bras: §2.1 through Remark 2.1.11, including the independent
  completely étale/henselization proof, pp.12–14.
- Bhatt's direct-summand paper: Notation 1.4 and §2.1–2.7, including
  footnote 6 and the saturation distinction, pp.3–5.
- Davis–Kedlaya: §3, pp.6–11, finite-Witt conditions and the implication
  (xiv)′ to (ii) in Theorem 3.2.
- Scholze's 14 April 2026 ECD revision: Definitions 5.6–5.7, Theorem 5.8,
  remark and Proposition 5.9, pp.24–25.
- Bhatt's 23 April 2017 perfectoid lecture notes: Theorem 9.4.3 through
  Corollary 9.4.7 and its full transfinite proof, pp.113–117. The relevant
  rendered page was inspected.

Stacks 091N/091P/091S/091T/091U and 0G3I were read for the derived-completion
criteria and comparisons. The published BMS2 PDF and its correction evidence
are inherited provenance, not a fresh download. There is no missing-source
entry from the scoped reading: the cited Bhatt Corollary 9.4.7 was located,
acquired and read, resolving the missing-source gap G8. Its actual supplier
carriers and completed-colimit interfaces remain G2 obligations.

The five inherited PerfectoidQuotients/E1–E5 source-issue records retain their
identifiers and review status. PerfectoidSpaces/E29 supplies the corrected
integral-map direction in ECD Definition 5.7. The monic-root construction uses
the corrected coefficient ring of PerfectoidSpaces/E53. Neither finding is
duplicated. PerfectoidSpaces/E33 remains a pending lead and is not treated as
an accepted correction.

## Ownership and the three confirmed red-team findings

Accepted RS-01 is binding. PR.0 owns prisms and δ-algebra, PR.1 the smooth
site and comparisons, PR.2 derived prismatic cohomology, DD the derived and
quasisyntomic objects, and P1/P4 the Tate/analytic carriers. Exact supplier
node identifiers are used whenever they state the required result.

**RT-AREA-padic-1/1:** the requested late Q5 extension is reconciled with the
already accepted `PerfectoidQuotientsPartIIIntegralPerfectoidization` route.
The packet records its scope and downstream P8/S2/S4/PR.4 edges, after Q4,
PR.2 and the arc-topology inputs. It does not add an eighth stage to this job.
General integral perfectoidization, J-almost purity and the §10 inputs belong
there; generic arc topology and almost algebra retain their existing owners.

**RT-AREA-padic-1/6:** the packet proposes removing Q4 as an input of
AdicEtaleGeometry:A3. Characteristic-p closed-space and tilting inputs come
from P4/P3. No foreign atlas edge or document was edited.

**RT-AREA-padic-1/7:** the seven duplicated ČS24 items /010, /012–014 and
/017–019 are planned in the integral prefix; /037 is routed to P7. The
integral-perfectoid Part II retains fibre products, valuation-ring tilting,
§2.1.12, /020, ordinary ind-syntomic André extensions and semiperfectoid
covers, and its tilting supplier is P3. The packet records the full ownership
proposal without modifying that roadmap's files.

The additional proposals retain P1's existing Tate adapter and import the
already planned PR.2 lifting theorem pending its RS-01 relocation. Three
coarse imports of Q0 are narrowed to the actual early integral predicate,
torsion/cotangent results and elementary operations. They prevent a supplier
from acquiring the complete later Q0 dependency set. The maintainer must apply
these proposals; the exact bindings are in `restructure` and the reader.

## Remaining closure work and where to resume

Seven gaps and nine supplier requests remain. Their consuming node identifiers
and precise statements are in the packet; use those identifiers in follow-up
packets rather than repeating this source decomposition.

- **G1:** transport BMS1 pseudouniformizer completeness to the BMS2 p-adic
  predicate; implement ordinary quotient-completion, torsion removal and finite
  sharp-ideal comparisons, retaining the reducedness and finiteness hypotheses.
- **G2:** provide the genuine PR/DD/animation/almost/analytic carrier interfaces
  and the normalization comparisons. Suggested-file comments identify each
  untyped clause; supplier existence is not an implementation claim.
- **G3:** establish stationarity, fixed-size bounds and completed transfinite
  limits for the initial-prism construction on PR.0's actual carriers.
- **G4:** establish the André successor/limit flatness arguments, the exact
  Frobenius-flatness criterion and the divided-power/ind-syntomic modulo-p step.
- **G5:** prove the unit-cofiber completed base-change comparison and
  complete-flat descent of surjectivity. Do not import Proposition 8.5 or
  §8/§10 v/arc descent into the proof of Theorem 7.4 that those results use.
- **G6:** identify the completed perfectoid colimit of finite quotient
  perfectoidizations with ordinary p-completion of R/K, where K is the union
  of the compatible finite-stage unit kernels. The baseline already supplies
  surjectivity once this carrier comparison is established.
- **G7:** implement the analytic Tate localization/topology and minimal open
  integrally closed plus-ring comparison, including almost surjectivity in the
  correct direction and the relation to P4's strongly closed immersion.

The principal compatible-root quotient no longer has an image gap:
`AdicCompletion.map_surjective`, `of_surjective` and `map_of` give its
surjective unit with no closedness or finite-generation assumption. For the
analytic quotient, the same baseline argument makes R⁺→S surjective;
ordinary principal-ideal completeness and Stacks 091T/091P(2) give derived
p-completeness when ϖ^p divides p. Thus S is semiperfectoid. Localizing the two
surjections gives the surjective ring map. G7 concerns the actual topology and
plus model, rather than an unestablished algebraic image assertion.

Requests are addressed to **PR.0, PR.1, PR.2, DD.0, DD.1, DD.5,
EnhancedDerivedSheaves:E5:animation, CrystallineCohomology:CR.0 and
PerfectoidSpaces:P4**. Read each request together with its exact existing
supplier prerequisites. For Q2/Q4 resume first at G5 and G6; for the integral
prefix at G1 and the concrete missing comparisons; for Q3 at G4. Review the
recorded ownership proposals before expanding coarse supplier dependencies.
All facts needed to resume are in these four deliverables and their public
source references; nothing depends on the worker's disposable scratch files.
