# BP-HabiroCohomologyFoundations — complete planning pass

Issue: [#10917](https://github.com/CBirkbeck/tauceti-explorer/issues/10917).
Worker: Codex, session `codex-beQ2WO`, 2026-10-19.
Branch: `codex-beQ2WO-habiro-cohomology`.
This is a complete target-level blueprint for independent review, not an
implementation or a self-review. No second issue was claimed.

## Deliverables and coverage

The full packet, reader and compact suggested file cover exactly HQ.1, HQ.2,
HQ.3, HQ.4, HQ.5, HQ.5-trace, HQ.6, HQ.7 and HQ.8, with `part: null`.
There are 149 nodes: 58 theorems, 28 lemmas, 24 comparisons, 23 constructions,
15 definitions and one application. There are 269 API items, 154 tests attached
to definitions/constructions, 174 tests over all nodes, 36 planets and 37
baseline declarations. Every definition/construction has uses, an API and at
least three discriminating tests. Every node remains implementation-unchecked.

| Stage | Status | Outstanding work |
| --- | --- | --- |
| HQ.1 | planned | Implement the complete framing and enhanced lattice interfaces; retain interim ownership until the QW transfer. |
| HQ.2 | planned | Implement DD.1/DD.2 enhanced completion, animation and filtered scalar extension with the specified ideals. |
| HQ.3 | planned | Prove the raw framed Habiro Koszul identification; resolve the stated base-change range and supplier compatibilities. |
| HQ.4 | planned | Prove restriction-free ordinary FV initiality and relative factorization; transfer QW targets atomically on promotion. |
| HQ.5 | planned | Prove smooth-proper uniform perfectness and coherent canonical-section uniqueness. |
| HQ.5-trace | planned | Obtain the exact all-prime E₁ identity-cover theorem and general resolution hypotheses from RT.4. |
| HQ.6 | planned | Construct the analytic comparison and its completed coefficient change. |
| HQ.7 | closed | Process layer, with no mathematical nodes. Removal is proposed; worked examples remain in reader Layer 8. |
| HQ.8 | planned | Prove canonical θ/Witt map equalities with full-functor normalization and sheaf descent. |

The four accepted split packets supplied 151 inherited nodes. The full pass
removes the two HQ.7 process nodes and the HQ.8 executable-boundary node and
adds the missing Meyer–Wagner lift lemma. The corrected reviewed package
reader was used as a specification, then its mathematical statements were
checked against the source passages and supplier contracts. Its acceptance is
not represented as independent acceptance of this full packet.

The old suggested file's long development and placeholder carriers have been
replaced with a 183-line native file: four light real-bodied definitions, six
milestone statements and eight proved examples. All heavy enhanced objects,
cohomology theories and comparison maps are reader targets. This follows the
current WORKERS/UPSTREAM_GUIDE shape and import rules rather than the issue's
older exhaustive-prototype instruction.

## IDs and promotion

The four accepted part packet files are unchanged:

- `HabiroCohomologyFoundations--HQ.1.json` (122 nodes).
- `HabiroCohomologyFoundations--HQ.1-2.json` (7 nodes).
- `HabiroCohomologyFoundations--HQ.3.json` (3 nodes).
- `HabiroCohomologyFoundations--HQ.8.json` (19 nodes).

They remain in the checker's global world. Repeating their IDs in a new full
packet produces duplicate-ID errors. Following the existing full-packet
migration pattern, the full packet uses `/plan/` IDs and includes an explicit
148-entry `nodeIdMigration`, with each original ID and its originating packet.
Declaration names and target identities are retained. Internal prerequisites,
request consumers and gap consumers use the new IDs. The new lift lemma has
its own ID. The three omitted nodes are listed in `provenance`.

After this full packet's independent review, promotion must supersede the
split plan and transport external consumers through this mapping atomically.
Do not delete accepted part files, silently leave consumers on stale targets,
or treat the new IDs as a second mathematical development. No independent
review verdict was assigned to this packet by its author. The 35 inherited
source-issue records retain their named reviewers and historical provenance;
E901 is new and awaits independent checking.

## Confirmed red-team findings addressed individually

### RT-AREA-etale/6

HQ.5 §5.19a now plans Meyer–Wagner v4 Lemma 3.16 explicitly: its recursive
polynomials, cyclotomic divisibility and lifts of iterated divided powers,
with α≥2, all primes including p=2, and Lemma 3.17's auxiliary flatness
estimate in the proof. The source is `2410.23115v4`, pp.38–40. The inherited
E302 records the 3.16/3.17 citation mismatch. QH Theorem 4.22(a) depends on
this lemma. Part (b) is HQ.5-trace §6.4 and lifts
R∞=(R⊗_A A∞)^∧_p, rather than R. The RT.4:q-Hodge request names KU
Theorems 4.17, 4.14 and 4.16, including the all-prime E₁ identity-cover case
and its prime-two proof. The broader E₂ case retains its extra E₁ resolution
condition at p=2. There is no backward edge to topological trace theory in
HQ.5's algebraic construction.

### RT-AREA-etale/27

RS-10 round 2 is accepted, but QWittVectors is not installed in the atlas at
this checkout. The packet records the atomic promotion rather than citing
nonexistent QW atlas stages. Until then HR.1 supplies Λ/Adams data, HR.4
supplies degree-zero relative q-Witt theory, HQ.4 owns positive-degree
q-Witt/Nygaard/twisted theory, and HQ.1 owns the common framing prefix.
Future destinations are QW.1, QW.2–QW.4, QW.5/QW.7 and QW.6:framings,
respectively. These moves and consumer forwarding are explicit in
`restructure`; no second generic carrier is planned.

Keep HQ.4 → HQ.3 for this interim build: HQ.4's raw framed Habiro constructor
is independent of chosen-filtration descent, while HQ.3 owns its comparison
with that descent. Removing this edge before the QW transfer would lose real
inputs. The future narrowing of HQ.4 and the relevant CR.4/HR.4 edge changes
must be applied together by the maintainer on promotion; this job edits no
other roadmap or atlas data.

### RT-AREA-etale/28

HQ.1 §1.1 states one I-completely étale framing interface, for I=(h) or
(p,h), with coefficient automorphisms, divided differences, commuting
operators, twisted Leibniz, Koszul complex and reduction. QW.6:framings is
its future destination and has no QW.5 prerequisite. PR.6 imports and
p-completes this prefix and keeps q-PD envelopes, the q-crystalline site and
prismatic comparison. The requests distinguish these ownership boundaries.

### RT-AREA-etale/29

HQ.1 §§1.22–1.28 distinguish ordinary framed flat q-connections, modified
connections and coherent derived lattice equivariance. Scholze §7 is read
and cited, including the framing-independence conjecture and the tensor
warning. Current Tau Ceti's torus-character API is reused; only the scaling
automorphisms and specified descent are new. The quotient is formed as a
prestacks/action-groupoid construction with flat sheafification and right Kan
extension of QCoh. Its infinite lattice is not a quasi-compact fpqc torsor;
its nerve is an infinite coproduct, not the spectrum of a product ring.
Stabilizers at q=1 and roots of unity and the distinction between
underlying-perfect and equivariantly compact objects are retained.

These application targets require E0/E1/E5 enhancements, not Langlands
parameter stacks. Ordinary finite locally free descent is imported from
AlgebraicVectorBundles. HQ.4 §3.31 constructs the raw framed Habiro ring's
operators and Koszul object; HQ.3 §4.21 owns the Example 3.12 comparison,
whose missing proof is a gap. The twisted q-de Rham and twisted q-Hodge
objects are explicit in HQ.4/HQ.3 before descent.

### RT-AREA-etale/30

HQ.6 explicitly has no installed analytic supplier. Its HS.3 request records
the edge to route when AnalyticHabiroStack is promoted, through
SolidAnalyticRings, AnalyticStacks and RingStacksAndTransmutation. Aoki
2603.01877v1 Theorem 1.7 and Wagner's thesis 1.44–1.46 are cited with their
actual scope. Aoki gives a realization; neither source constructs the
algebraic-to-analytic comparison. Its map, completed localization and
equivalence range remain a gap and are not algebraic prerequisites.

### RT-AREA-etale/31

HQ.3 §4.17 constructs the Habiro–Hodge limit, and §4.20 puts Theorem
3.11(b)'s ascending filtration on that object's reduction modulo q^m−1.
Its graded terms are the derived q-Witt forms with the displayed shifts.
The h-completed qHdg has only the corresponding h-completed version. The
reader and packet keep the two objects and their coefficient changes distinct.

### RT-AREA-etale/32

The actual HR.1 Λ-ring node is a direct HQ.1 prerequisite; HQ.2 imports that
base and its Adams operations. The transfer to QW.1 is recorded as a future
atomic forwarding operation, not a present dependency on an absent stage.

### RT-AREA-etale/33

HQ.7 has no mathematical nodes because its reviewed audit calls it process.
Its concrete trace example in reader §8.1 now consumes HQ.5-trace explicitly
and does not depend on the analytic problem. The removal proposal explains
how to remove the process edges on promotion. Trace existence is an actual
mathematical target in HQ.5-trace rather than an isolated acceptance test.

### RT-AREA-etale/34

HQ.2 imports DD.1 for enhanced filtered modules, completion and completed
tensor and DD.2 for derived de Rham and its Hodge filtration. No DD.6
logarithmic dependency is used. E4 is explicitly a consumer of DD.1, not a
second owner of completion. The maintainer's atlas edge update is recorded;
this job does not edit atlas data.

### RT-AREA-etale/35

HQ.5 §5.13 gives an actual affine-to-scheme descent argument using the bounded
cyclotomic filtration, q-Witt étale descent, limits and complete
conservativity. It is restricted to the stated smooth ℤ-scheme domain.
For smooth proper schemes, §5.14 records introduction 1.16's assertion as an
unproved target. The gap separates global-sections/reduction base change,
finite-level proper perfectness, uniform Tor-amplitude and finite
presentation, and a valid inverse-limit perfectness criterion. Appendix B
conservativity alone proves none of the missing finiteness assertions. The
inherited source gap E303 is retained; the thesis passage adds no proof.

## Mathematical gaps and supplier requests

There are eleven explicitly bounded gaps. The reader's final section lists
all eleven: Example 3.12's framed Koszul comparison; restriction-free ordinary
FV initiality; smooth-proper perfectness; unrestricted Λ-base change of
chosen filtrations; the finite-projective PR.3/AI.1 compatibility exports;
relative ordinary de Rham–Witt/crystalline factorization; the absent proper
étale square; canonical θ/Witt map equalities; the analytic comparison;
enhanced coherent lattice interfaces; coherent uniqueness of canonical
sections. The lattice gap concerns unimplemented generic interfaces, not a
claim that the mathematical quotient comparison lacks a proof: its DAG VIII
argument is spelled out.

The 59 `requests` in the packet are the durable routing list. Their exact
statements and `neededBy` IDs distinguish existing imports from extensions:

- HR.1–HR.5 and HC.1/HC.3: Λ/Adams/perfect coverage, derived Habiro completion,
  coherent cyclotomic reconstruction, relative degree-zero q-Witt and Taylor
  equalizers. HR.6 and HB.6/HB.7 remain consumers, not prerequisites.
- DD.0–DD.4 and AI.1: full cotangent/derived de Rham, the one enhanced
  completion owner, filtered finite-projective scalar extension, Koszul and
  décalage, and their stated coefficient-change compatibility. The existing
  unfiltered DD.2 base-change node is reused; the filtered strengthening is
  requested rather than assumed.
- E0/E1/E2/E5: coherent diagrams and transport, affine enhanced modules,
  finite covering descent, animation and monoidal/operadic transport. The
  finite-group action export is used only for the finite group μ_(p−1);
  infinite-lattice interfaces have their own precise stage requests.
- PR.0–PR.3/PR.6 and Q3: universal δ/q-PD/prismatic objects, relative Frobenius,
  Nygaard and complete comparison, including source versus target completion
  ideals. PR.6 does not own a duplicate generic framing calculus.
- CR.0/CR.2/CR.4 and AI.3–AI.4/CP.1/CP.6: PD and classical specialization
  maps, relative de Rham–Witt initiality/factorization, and canonical
  normalization and sheaf-level compatibility. BMS Theorem 14.1 and BS
  Theorem 18.2 alone do not equate arbitrarily chosen reduced maps.
- RT.4:q-Hodge, RT.4:Habiro-comparison and RT.6: exact spherical lift and
  resolution domains, all-prime identity-cover theorem, structured quotient
  examples and the number-field genuine-fixed-point export.
- HS.3: the analytic objects and comparison problem to route on promotion.

The finite-projective base-change statements remain conditional on their
named compatibility exports. Flatness alone does not commute arbitrary
completions or inverse limits. The rescaling functor is lax monoidal, not
strong monoidal. The admissible smooth tensor operations form a simplicial
subset, not a suboperad closed under composition. These inherited corrections
are preserved in both deliverables.

## Baseline and current-upstream checks

All 37 listed baseline declaration statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Ordinary category prototypes that
supply no enhanced cohomological interface have been removed. Near misses
such as ordinary filtered subobjects, ordinary adic completeness and
`DerivedCategory` are explicitly separated from the enhanced supplier
contracts. Universal completed PD/q-PD envelopes are not inferred from the
existing divided-power algebra.

The reviewed library audit was read. The current read-only TauCetiRoadmap
checkout at `0d144d044dacebca17b654695b6f1ad58f159b27` and its Tau Ceti
library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were screened,
including all nine newer named roadmaps and the Completed roadmaps.
AlgebraicVectorBundles L0B/L2B and the current torus-character declarations
were read at the actual statements and are imports, not new targets.
AlgebraicVectorBundles and AnalyticToricGeometry readers were read for
presentation and ownership. No build or Lake operation was run in either
read-only checkout. No private book was needed.

## Sources read and absent sources

The packet records precise versions, public URLs, read dates and PDF hashes;
Stacks HTML snapshots are hashed too. All repository descriptions are in the
worker's own words; there are no source excerpts or copied source files.

- Wagner, q-Hodge complexes over the Habiro ring, arXiv:2510.04782v2:
  §§1–4 and Appendices A–B, pp.1–80, including the proofs used by every
  mathematical layer. §2 is read as the HR supplier contract, not replanned.
- Wagner, q-Witt vectors and q-Hodge complexes, arXiv:2410.23078v5:
  §§3–5 including their proofs, pp.34–80, plus the no-restriction and relative
  coefficient passages in §2. In particular the Frobenius construction and
  joint smoothness/torsion induction were checked, not replaced with a
  circular reference to the theorem being proved.
- Wagner, ku and q-de Rham cohomology, arXiv:2510.06057v1:
  introductory statements, Assumptions 3.1–3.2 p.24, §§4.3–4.4 pp.40–50,
  and the arithmetic proofs of Theorem 6.10 p.83 and Corollary 6.15 p.86.
  RT owns the remaining trace construction; it is not claimed read in full.
- Meyer–Wagner, arXiv:2410.23115v4: §3.2 pp.38–40, especially Lemmas
  3.16–3.17 with their proofs. No claim to have read the rest.
- Scholze, arXiv:1606.01796v1: §§2–4 cited coefficient/comparison passages,
  pp.5–10, and §7 pp.15–16 on q-connections.
- Lurie, DAG VIII, 5 November 2011: §§2.6–2.7 cited passages, pp.66–76,
  particularly 2.7.6, 2.7.8 and 2.7.14 and the descent/perfectness proof.
- Bhatt–Scholze, arXiv:1905.08229v4: the cited introductory and derived
  Hodge–Tate statements, §15's relative Frobenius/Nygaard interfaces,
  §§16–18 pp.110–120 and 122–124 containing the envelope, q-crystalline,
  perfectoid and uniqueness proofs used here.
- BMS I, arXiv:1602.03148v3: Theorem 1.10(i) pp.6–7; décalage passages
  pp.49–50 and 55; Lemma 12.4/Corollary 12.5 pp.97–98; Theorem 14.1
  and its proof pp.118–119.
- BMS II, arXiv:1802.03261v2: Theorem 1.12 pp.6–7; Proposition 5.8 and
  Corollary 5.10 pp.32–33; Lemma 8.3 p.55; Propositions 8.12–8.13 and
  Theorem 8.14 pp.59–61. The latter is a theorem, not a proposition.
- Bhatt, arXiv:1204.6560v1: Proposition 8.5/Corollary 8.6 p.32, the
  nonsmooth derived de Rham/crystalline boundary.
- Stacks tags 091N (derived completeness, including Lemma 15.93.20's
  proof), 03OY (quasi-coherent cohomology and affine Amitsur descent),
  06WT (ordinary groupoid descent for QCoh), 00NV (finite-projective
  characterizations and splitting). These supply only their stated ordinary
  or enhanced-completion arguments, not an automatic infinity-category model.
- Wagner's author PDF q-Hodge filtrations, Habiro cohomology, and ku,
  1.44–1.46 printed pp.19–20; Aoki arXiv:2603.01877v1 Theorem 1.7 p.4.
  Both delimit the analytic comparison problem.

Lecture V5A4 was not obtained. The Langer–Zink restriction-free universal
property was not verified from its original source; its precise statement
and relative factorization remain CR.4 obligations. No source read here
supplies the smooth-proper uniform perfectness proof, the canonical-section
coherent uniqueness proof or the algebraic-to-analytic comparison.

In addition to the 35 inherited source findings, E901 records a new error
in the prime-completed part of QH Lemma 2.12's proof, p.18. Coprimality does
not imply irreducibility of Φ_m modulo ℓ: for (m,ℓ)=(7,2) it splits as
(q³+q+1)(q³+q²+1). Use squarefreeness and the full finite étale cyclotomic
algebra, proving the Taylor comparison on each factor. The source result
survives this repair. The arXiv version history and a targeted correction
search found no correction; this finding still needs independent review.

## Validation and next action

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroCohomologyFoundations.json`:
  zero errors and zero warnings.
- Independent local structural checks: 149-node internal DAG is acyclic;
  own prerequisites resolve, reader target/API/test statements match the
  packet, all nine stages occur, migration is injective, and no stage has
  more than six planets.
- `lean-check research/blueprint/suggested/HabiroCohomologyFoundations.lean`:
  exit 0 at the pinned shared build, only six intended declaration-uses-sorry
  warnings. Four real-bodied definitions and eight examples elaborate; every
  example has a proof. Available memory was checked before compilation.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/HabiroCohomologyFoundations.lean`:
  exit 0, no admitted data definitions.
- Intake file validation: four authorized files, zero problems.
- `git diff --check`: exit 0. The packet JSON and source-version metadata
  parse successfully; repository deliverables contain no private absolute paths.

Next is independent review of this full plan, including E901, the migration
and the explicitly conditional theorem targets. Follow-up implementation
must consume the exact supplier contracts and close the eleven gaps before
claiming their mathematical targets proved. Promotion must apply the recorded
ownership/edge transfers without duplicate generic theories. No further
blueprint breadth or additional issue is part of this run.
