# DESIGN-FunctionFieldArithmeticPartII — native coordinate continuation

Codex — session codex-J6LwjP, 2 October 2026. Refs #3403.
Claim comment 5951692548 was explicitly confirmed by the bot. Continued the
merged #5742 checkpoint, retaining its handoff below as historical evidence.
Status is partial: no stage is closed and no implementation is certified.

## What changed

Adds six declaration-sized nodes: one construction, two lemmas, two
comparisons and one theorem. They specify the canonical trivial-power
isomorphism, native section-power coordinates, the computed unit coefficient
of a root identification, the actual root equation and scalar equations for
root arrows. The sectionPower.mapIso API is promoted to a prerequisite node;
its existing suggested signature is retained. The affine-chart consumer now
uses the two root-coordinate outputs explicitly.

The previously omitted RootObject.test_trivialization now has an actual
native signature: its bundled unit is equal to the computed image-of-one
coefficient, and it satisfies the actual coordinate power equation. Helpers
only expose the native freePUnitIsoUnit and freeSection maps. The root object,
sheaf, module, ring and tensor carriers are unchanged. Three new canonical
trivial-power API items and three tests accompany the construction, and one
new planet names the coordinate root equation. The root identification unit
is proved from an actual inverse; it is not an assumed theorem condition.

Current totals: 91 nodes (16 construction, 8 definition, 8 comparison,
36 lemma, 22 theorem, 1 application), 79 API entries, 75 planned tests,
35 planets, 52 inspected baseline references, 7 gap groups and 8 requests.
The suggested file has 20 native examples, including the root-object
trivialization example. All implementationStatus values remain unchecked.

All previous 85 node IDs are preserved. Their records are unchanged except
the affine-chart dependency/proof refinement. The previous 47 baseline
records, source metadata/version hashes, nine source findings, both complete
route inventories, sibling restructuring proposal and reserved root-stack
owner are preserved. No new source erratum or independent verdict is issued.
JAC-A's existing request now explicitly requires coordinate multiplication
and unit evaluation for the generic native section tensor map; the six new
root-specific nodes do not rebuild that supplier theory. LEAN-SECTION-COMP
now records outstanding proofs and full-file elaboration after completing
its formerly omitted signature. All other mathematical gap scopes remain.

## Fresh evidence and checks

Read the actual AUDIT-01 SF.1/SF.3 and AUDIT-20 FA.1/FA.2/FA.4 records and
accepted review metadata, native SF.1/SF.3 and parent FA.2/FA.4 descriptions,
and all touching blueprint link records (none mention this Part II).
The existing JAC-A contract matches JacobianChallenge Layer A; read its full
upstream document and the StableReduction shared native sheaf contract.
The latter full document was already read in this continuous work loop.

At Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369, read the native invertible-sheaf
carrier, trivial sheaf, tensor products/congruences/unit isomorphisms and
pinned freePUnitIsoUnit, freeHomEquiv, freeHomEquiv_apply, unitHomEquiv,
unit/unit-section definitions and Hom.app_smul statements with parameters.
Five fresh baseline records include source blob hashes. The generic
sheafified tensor construction was inspected; its section-unit/naturality
proof contract stays with SF.3/JAC-A rather than being certified present.

Read AGV arXiv:math/0603151v2 Appendix B.1–B.2 pp. 52–54, including the
trivial-line quotient calculation and nilpotent-section distinction. The
fresh download has the preserved SHA-256
c2889c567c21aa5473ba0be75221dbb67ca122210fa4e4973f4727c490bdd5eb.
This is an inspected preprint source, not a fresh version-of-record collation
or a reread of the whole 59-page paper. Earlier Yun–Zhang, Talpo–Vistoli,
Bresciani and AV source receipts remain attributed to preceding workers.

The standard blueprint checker with the pinned declaration index reports
0 errors and 0 warnings. Intake checks report five files, zero problems;
whitespace and the exact preserved-node/baseline/source/route checks pass.
Executable finite checks verify 11,455 scalar-arrow transformations and
84,015 compositions over Z/m for m=1,…,12 and exponents 1,…,5. Negative
checks retain nonzero nilpotent roots over Z/4, the power constraint even
for a zero section, units lacking square roots, and characteristic-two
dual-number stabilizers. These finite ring checks are not native sheaf proofs.

The suggested file was not compiled. An existing Mathlib build at its pin
was found; the existing native Tau Ceti builds inspected were at other
commits and cannot certify this file. No Tau Ceti build at the exact pin
with the needed native imports was found. No Lake project, library build,
cache download or language server was started for this job. Native source
signatures are not claimed elaborated. No process is left running.

## Exact continuation

1. Resolve JAC-A's natural bilinear section tensor map, trivial-line unit
   coordinate evaluation and tensor-power transport identity/composition
   coherence on the existing native carriers. Do not create another line
   bundle or generic section tensor category here.
2. Implement and elaborate the six comparison nodes and all native examples
   in an existing build at both exact pins. The earlier missing root-object
   signature is now present; the work remaining is its proof, not a vacuous
   replacement by the defining root equation.
3. Use those equations in SF.1's actual torsor/quotient presentation proof;
   retain the unit u, root scalar and both arrow equations until generic
   descent justifies local normalization. Do not set u=1 globally or test
   only field-valued stabilizers. Finish geometric root-stack/base-change/
   coarse/infinite-limit signatures through the existing supplier contracts.
4. Follow the unchanged ST-LISSE, ST-OPS, NORM-2EXACT, FA-APPROX and
   EXTERIOR-COMP neededBy lists and the previous all-degree/trace worklists.
   The AV sibling retains its separate coordinated design and published
   proof-reading obligations.

All durable statements, source/baseline receipts and validation outcomes are
in the five deliverables. Own scratch is removed after publication; no local
path is needed to resume.

---

## Preserved predecessor handoff

# DESIGN-FunctionFieldArithmeticPartII handoff

Current worker: Codex — codex-a71f92. Refs [#3403](https://github.com/CBirkbeck/tauceti-explorer/issues/3403). Claim 5950985903 was confirmed by bot 5950987593. This is a partial continuation of the merged codex-rtOQ9t checkpoint, not a complete design or implementation claim.

## New affine work

Six declaration-sized additions: one construction, three lemmas, one comparison and one theorem. They specify the root-chart Hopf coaction, character weights, actual counit and coassociativity maps, specialization through Tau Ceti's native μ_n Hopf points, and invariants equal to the coefficient image. The affine-chart and coarse-space consumers now list these prerequisites and use their proof contracts explicitly. Two planets name the new central construction and invariant theorem.

The invariant proof handles the zero ring separately, uses the native monic AdjoinRoot basis in the nontrivial case, and compares character/root-power coefficients in the native tensor basis. It is valid when n is not invertible and when A has nilpotents. The characteristic-p unit test rejects geometric-point invariants. No μ_n group, generic polynomial quotient basis, tensor algebra or algebraic-stack carrier is reconstructed.

All six new declarations, three coaction API items and three unit tests have actual native Lean signatures with sorry proofs. Two additional theorem-acceptance examples cover a potentially nonreduced base and the zero ring. These are suggested forms, not compiled declarations. The existing geometric omission ledger and root-object trivialization omission remain.

## Current totals and preserved work

85 nodes: 15 construction, 8 definition, 6 comparison, 34 lemma, 21 theorem, 1 application. 76 API items; 72 planned unit tests; 34 planets; 47 baseline references; 7 gaps; 8 requests. All implementationStatus values remain unchecked and all ten stages remain partial. There are sixteen native examples in the suggested file: the previous eleven, three coaction tests and two invariant acceptance examples.

All 79 preceding node IDs and content are retained except the explicit dependency/proof refinements of affine-chart and coarse-space. All 28 YZ19 route assignments, the complete 38-item independent AV sibling proposal, nine source issues, source-version receipts, eight supplier requests and seven gaps are preserved. The reserved root-stacks definition remains the unique owner; its coarse-space ring step has new native algebra support, but its geometric signature and SF.1 contracts are not marked resolved.

## Fresh reading and baseline checks

Read Talpo–Vistoli arXiv:1410.1164v2 §3.1 pp. 14–16, including the grading, Lemma 3.7 proof, quotient description and finite Corollary 3.13. Downloaded SHA-256 matches the recorded TV17 edition. The arbitrary-A finite invariant proof is an explicit coefficient derivation here, not a literal restatement of the infinite-monoid lemma. Other source/errata reading in the historical receipt below belongs to the preceding worker, not a claimed new audit.

Read reviewed FunctionFieldArithmetic FA.1/FA.2/FA.4 and SF.1/SF.3 target/evidence/duplication rows, the supplier stage descriptions and touching edges, and screened blueprint link records for this Part II. Read upstream JacobianChallenge fully and StableReduction fully in this continuous session. At the two recorded pins, read Tau Ceti RootsOfUnity Basic and Scheme and the relevant Mathlib quotient lift/extensionality, Hopf/bialgebra group-algebra, tensor-map/unit/associator, monic quotient-basis and tensor-basis statements. The Hopf points use an unlifted character group; the scheme group uses ULift. No definitional carrier equality is assumed.

## Where to resume

Start with the existing JAC-A native section-tensor/trivialization contract if continuing RS.0; the affine algebra no longer hides its invariant calculation. Obtain actual SF.1 geometric quotient/coarse/root-stack types and their universal properties to finish RS.1/RS.2 signatures. Then follow the unchanged neededBy lists for ST-LISSE, ST-OPS, NORM-2EXACT, FA-APPROX, EXTERIOR-COMP, LEAN-GEOMETRY and LEAN-SECTION-COMP. Do not re-plan native μ_n or the generic bases, and do not confuse field-point invariance with the Hopf equalizer. The AV sibling still needs its own coordinated design and full version-of-record proof reading.

No Lean compilation: no existing build at both pinned commits is available. No Lake setup/cache/build or language server was started. No orbital coefficient fitting was rerun; this continuation changes only blueprint deliverables, not atlas data or UI.

## Validation

The actual check_blueprint against the pinned declaration index reports 0 errors and 0 warnings: 85 nodes, 76 API items, 72 tests, 34 planets and 47 baseline declarations, with 7 gaps, 8 requests and no closed stage. Actual intake file rules report no problems for the exact five deliverables. Historical node/source/finding/route/request/gap preservation and new reader/native-signature/test parity pass. New dependency edges are acyclic against atlas, packet/decomposition and typed upstream imports. Actual in-memory new-roadmap insertion and blueprint projection succeed; the projected 2,012-stage/3,580-edge graph is acyclic. The TV17 edition hash matches. Independent coefficient-algebra checks pass 7,044 cases over Z/m for m=1,2,3,4,5 and F₂[ε]/ε², testing multiplicativity, counit, coassociativity and coefficient-image invariants for all f and n=1,2,3,4. Field-point counterexamples at primes 2,3,5,7 also pass. These finite tests and structural checks are not Lean elaboration or proof certification. The source PDF and all own scratch will be removed after verified GitHub publication; the handoff needs no scratch path.

## Historical receipt from the preceding worker

The following is retained as attribution and continuation context, not a claim of newly repeated checks.

# DESIGN-FunctionFieldArithmeticPartII handoff

Worker: Codex, session codex-rtOQ9t. Issue: [#3403](https://github.com/CBirkbeck/tauceti-explorer/issues/3403). Claim comment 5949202019 was confirmed by bot comment 5949204352. This is a checkpoint with a complete first-route source inventory and an explicit mathematical/typed continuation; no stage is falsely marked closed.

The five deliverables define ten stages and 79 declaration-sized nodes: {'construction': 14, 'definition': 8, 'comparison': 5, 'lemma': 31, 'theorem': 20, 'application': 1}. There are 73 API items, 69 planned unit tests, 32 planets and 24 baseline declarations whose statements were read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Every implementationStatus is unchecked. The reader is about 16,000 words and gives every statement, dependency, proof outline, API and test.

## Source and ownership work completed

All 28 first-route YZ19 records and all 38 AV sibling-route records were read. Yun–Zhang Appendix A pp. 514–526 was read in full with its proofs; published images at pp. 515, 519, 521, 523 were checked. The introduction and actual §6.2.1/6.2.3 consumers were read. AGV B.1–B.2 pp. 52–54, Talpo–Vistoli §3 through Corollary 3.13 pp. 12–16, and Bresciani’s published pp. 135–136 were read for the finite/infinite root interfaces. AV’s arithmetic setup and proof architecture were inspected in v1; the entire §§3–6/App. D proof is not claimed read and the 2025 version of record was not inspected.

Reviewed AUDIT-20 parent rows and reviewed SF.1/SF.3 targets/evidence/duplicates were read. The upstream JacobianChallenge and ClassFieldTheory documents were read in this continuous session. Pinned native declarations were read individually; full-tree root/quotient-stack searches found no concrete geometric root stack. Abstract IsStack and a pseudofunctor Grothendieck construction are not algebraic-stack implementations.

The reserved FunctionFieldArithmeticPartII:key/root-stacks is defined once here, including arbitrary exponents, line bundles with sections, scheme/stack bases, affine charts, full nonreduced fibres, relative coarse space, finite/infinite transitions and DVR gerbes. The old SF.1 generic-root routing is explicitly rescoped; SF.1 retains foundational stack geometry. Coalesce YZ17/49 and /54 with the empty-R character and exterior-power construction. All 38 AV contracts and their source caveats are preserved in a six-stage sibling proposal, with the same FunctionFieldArithmetic parent, the reserved StableReductionPartII moduli owner and route-A finite-coefficient input.

Eight inherited YZ19 source corrections retain their extraction/review provenance separately from this packet’s pending review. The new E8 is a scoped proof-interpretation gap for (A.11): ordinary Picard-kernel exactness fails for the ramified P¹ double cover because O(1) is σ-invariant but pullbacks have even degree. The coherent Picard-stack statement still needs its definition and proof. Published p. 525 and arXiv v2 p. 89 were freshly collated and contain the same assertion; no linked correction was found on the journal, arXiv listing or author publication page. This finding does not assert that every intended two-categorical exactness notion is false. It does not block the independent trace proof.

## Exact remaining work

The packet has 8 requests and 7 gaps. Finish STACK-GEOM, CURVE-GEOM, FA-ADELES, FA-RECIPROCITY, PI1, TAME-INERTIA, DUALITY-SCHEME and JAC-A against the actual supplier declarations. Do not re-plan their foundational objects here.

Resolve ST-LISSE and ST-OPS through the coordinated EtaleDualityAndPerverseSheavesPartIIStacks proposal. It has no registered ST stages or reserved node IDs yet, so this packet deliberately does not invent such prerequisites. The lisse fibre-descent theorem must cover the nonproper high-degree affine charts, and the perverse/pushforward theorem must cover p_d’s actual nonrepresentable tame stabilizers. Preserve rational coefficients and the unshifted L_d versus L_d[d] distinction.

Resolve NORM-2EXACT with the two short exact sheaf sequences, their connecting maps and coherent root-normalized descent data. Resolve FA-APPROX with support moving that preserves residue-root frames. Resolve EXTERIOR-COMP against the actual native exterior-power universal-property/antisymmetrizer interface. Complete LEAN-GEOMETRY and the one affine trivialization example in LEAN-SECTION-COMP. The exact neededBy lists identify where to resume; existing node IDs must be retained.

The suggested file has four native root-interface objects, their typed APIs and eleven typed examples. It uses native invertible sheaves, native section transport and native AdjoinRoot/root-of-unity types. Its complete omission ledger names every other node, API and test needing absent geometric carriers. The remaining RootObject trivialization example is explicitly omitted; it is not replaced by a vacuous defining-equation test. The file was **not compiled**: no existing build at both pinned commits was available. No Lake project, dependency build, cache download or Lean language server was started.

## Validation

Validation results are appended after the final checks. The PR is a checkpoint because external native signatures and the source proof-interpretation gap remain; it is not labelled a closed blueprint. The mathematical source inventory and every source-derived correction are saved in the deliverables, so scratch PDFs/texts can be deleted after submission. A continuation resumes from the named leaves, not by reacquiring sources or redoing the 79-node inventory.

Final validation: check_blueprint against the pinned declaration index: 0 errors, 0 warnings. intake check-files: exact five deliverables, 0 problems. The actual atlas assembly and blueprint projection changed 2,956 stages/8,639 stage edges to 2,998 stages (10 layers and 32 planets)/8,711 edges. The full projected graph is acyclic; all 44 declared dependency edges are present and no blueprint link was skipped. Existing external endpoints remain in the graph audit (3,049 total vertices). All 28 first-route and 38 sibling-route items have unique complete inventory assignments. All 79 node source fragments match the inspected texts after Unicode/whitespace normalization. Reader/API/test names agree with the suggested file or its explicit omission ledger. Eleven native examples are present. No compilation was performed.
