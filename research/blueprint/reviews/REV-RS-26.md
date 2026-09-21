# REV-RS-26 — independent ownership and dependency review

**Verdict: accepted, without mathematical changes.** Issue #851.
Reviewer: ChatGPT Pro, session `astra-20260921-f6b2d8`.
Proposal author: ChatGPT, separate session `astra-7c41e9`, issue #852.
Date: 2026-09-21.

This review concerns PROTOCOL §15 restructuring, not source-proof closure or
formalization of the component theories. The reviewer did not write RS-26.
All three roadmap decisions, 25 layer records, nine owner contracts and five
links are retained unchanged. The sole proposal-file edit is its required
`review` object. An empty `corrections` list is intentional: the checks below
did not reveal a mathematical defect requiring a changed decision.

## 1. Inputs and reproducibility

Read the complete family, proposal and author report, all three member READMEs,
and all 25 stage descriptions. The descriptions in the browser extracts were
checked against both the full atlas and the README text: every description
matches the full-atlas record and occurs verbatim in its member document.
Read each existing direct external consumer's full stage statement, not just
its title, as well as the additional relative-family consumer and the relevant
analytic, cochain and inverse-limit suppliers.

The complete local input is the repository's successful Pages artifact at
`62932be6b1ea0e4aa1c8750cc03308d58f50d1ac`, run 35614205611, artifact
10644934806. Connected GitHub comparison with current main
`9d8d1e955901f08441f25b7241dd256533683ef7` showed no changes to the RS-26
inputs, member documents, atlas, aggregate audit, worker rules or validators.
The proposal and author-report blob IDs were also re-read directly at that
main commit. No git command or atlas mutation was used.

| Input | Git blob |
|---|---|
| `RS-26.json` | `f2e36e385f2fa185cad434be19ab0f19357345cf` |
| Original `RS-26.result.json` | `bd7117e20e18d3c85e30a9da30cc0b661cb2b376` |
| Original `RS-26.md` | `f63184bca497e17e65e676813bccc39a941b9c1c` |
| `data/atlas.json` | `37f2add06983c206067d1104e0f40a839cc3961a` |
| `data/library-coverage.json` | `5e708cfc74a51b10e62149113872fe4e00eb5846` |
| `scripts/check_restructure.py` | `6b55104bac20888bb964b58bdc00d38b4fca9668` |
| `research/blueprint/PROTOCOL.md` | `4cfd15ffe40ed7c8610cd769f751289f641e17ee` |

These hashes identify the actual validation inputs. Subsequent unintegrated
restructurings are not silently included in the graph claim.

## 2. Roadmap decisions and every overlap pair

Keep **PadicHodgeRegulators**, **PadicLocalLanglandsForGL2Qp**, and
**PhiGammaModulesAndIwasawaCohomology**. Their outputs are different: a
regulator and its interpolation/image theorems; a GL₂(Q_p) representation and
its local compatibility/block theorems; and a common local coefficient and
cohomology theory. Neither application becomes a duplicate simply because
it uses the same (φ,Γ)-module category.

There are no Tau Ceti anchors in RS-26. There is also no proposal to enlarge an
existing Tau Ceti roadmap or to replace its special cases. No Part II rename
is required for these distinct applications. Existing external owners remain
imports and are not edited.

The family contains 24 directed evidence rows representing **12 unordered
pairs**, all labelled `audit-unreviewed`. Reverse rows are not independent
confirmation. Reg, PLL and PG below abbreviate the three member IDs.

| Pair | Independent decision |
|---|---|
| Reg L2 / PLL R30.1 | Both expressly import PG.0–3. The regulator's generator/lattice diagrams differ from the GL₂ covariance bridge; retain both applications. |
| Reg L2 / PLL R30.3 | The same source category feeds different functors. PG owns the category; Colmez's construction stays PLL-owned. No dependency between the two applications is needed. |
| Reg L2 / PG.0 | PG owns specialized cyclotomic coefficients and semilinear modules. The analytic ring carrier is imported from the early PHT annulus stage. |
| Reg L2 / PG.1 | PG.1 constructs the Fontaine equivalence and its inverse/comparison maps; Reg L2 uses them. |
| Reg L2 / PG.3 | PG.3 owns the Herr-to-continuous-cochain comparison, including signs and dyadic descent. Reg L2 retains the additional regulator-normalization square. |
| Reg L2 / PG.5 | PG.5 proves the ψ-complex comparison; Selmer L3 independently owns its inverse-corestriction target. Reg L2 does not reconstruct either complex. |
| Reg L4 / PG.6 | Wach existence, freeness and generic basis change belong to PG.6. The LLZ logarithmic matrix and integral Coleman-image theorem remain Reg L4. |
| Reg L4 / PG.7 | PG.7 supplies qualified relative cohomology and base change. A regulator and its character-domain/interpolation theorem are additional conclusions. |
| PLL R30.1 / PG.0 | The current statement already says no second coefficient carrier is constructed. Retain the direct PG.0 import. |
| PLL R30.1 / PG.1 | A declared import of Fontaine's equivalence, followed by the separate covariance comparison. |
| PLL R30.1 / PG.2 | A declared import of overconvergence. Preserve the distinction between étale objects and all Robba modules. |
| PLL R30.1 / PG.7 | Absolute and relative categories require a comparison, not a reverse prerequisite. Do not make fixed-field Colmez theory wait for the later family theorem. |

The nine owner records are exhaustive for these shared constructions: analytic
annulus carriers; specialized cyclotomic coefficients; Fontaine equivalence;
overconvergence; Herr comparison; ψ; ψ/Iwasawa comparison; Wach theory; and
qualified relative cohomology. Their IDs and every `formerly` endpoint exist.
The first owner is the existing external PHT early stage; the remaining eight
are precisely PG.0–7. Here `formerly` records overlapping occurrences/imports,
not a claim that an unchanged consumer loses a theorem.

A further sweep of the full member texts found no additional construction
shared by two member roadmaps without an owner. In particular, generic
Bloch–Kato maps are Reg L1 input to PG.5's late comparison, not PG constructions;
PG.6's D_cris comparison is not a new regulator; and the K₃/syntomic strand is
not part of Colmez theory. Cross-family leads remain separately identified in
section 7 rather than being dismissed as resolved.

## 3. Conservation of all 25 stages

All records have action `keep`. No target, ID, existing prerequisite or
consumer edge is removed. This includes the complete statements and appended
implementation/acceptance contracts, not only the following summaries.

| Stage | Content retained and ownership boundary |
|---|---|
| Reg D.1 | Branch, Frobenius, modified-dilogarithm and scalar comparison; generic Coleman functions remain imported. |
| Reg D.2 | Smooth/unramified étale–syntomic regulator comparison and the degree-three/weight-two Bloch formula, with integral ranges. |
| Reg D.3 | Derived-completed K₃ over finite products of unramified fields, p>3, valid Bloch classes, residue spanning and the p²-integral target. |
| Reg D.4 | Global-to-local arithmetic maps, product-of-completions comparison, norm/trace, Frobenius and controlled denominators; no global injectivity assertion. |
| Reg D.5 | Good-reduction curve regulator, symbols and pullback/pushforward/specialization; bad reduction needs its own logarithmic theorem. |
| Reg KU-padicreg | Existing source-unit readiness aggregation, with all original supplier and consumer links. |
| Reg L0 | Period and realization imports plus conventions, not another period-ring construction. |
| Reg L1 | Actual Bloch–Kato exponential/dual exponential, domains, kernels, twists, duality and semilocal maps. |
| Reg L2 | PG import interface and the additional generator, lattice, basis and regulator comparison maps. |
| Reg L3 | Vector-valued crystalline big logarithm, growth/interpolation, singular Euler operators, reciprocity, integrality and rank-one comparison. |
| Reg L4 | LLZ maps, their integral images and matrix/basis corrections, plus the qualified de Rham regulator extension. |
| PLL R30.1 | Fixed-field PG imports and GL₂ covariance/classical-normalization bridge. |
| PLL R30.2 | Distinct smooth mod-p, admissible unitary Banach and locally analytic categories, duals and classification/finiteness inputs. |
| PLL R30.3 | The actual Colmez and Galois functors, valid exactness, determinant/central-character and irreducibility conclusions. |
| PLL R30.4 | Locally algebraic vectors for distinct integral de Rham weights, classical compatibility and qualified density. |
| PLL R30.5 | Projective envelopes, deformation-ring comparison, support and multiplicity in each permitted block. |
| PLL R30.6 | Separate p≥5, p=3 and p=2 local theorem branches; global completed-cohomology occurrence remains R31 work. |
| PG.0 | Field-of-norms/cyclotomic coefficient constructions and stable-lattice étaleness, on the imported analytic carrier. |
| PG.1 | Integral, torsion and rational Fontaine equivalences with actual inverse maps. |
| PG.2 | Bounded-radius overconvergence and comparison of the precise scalar extensions. |
| PG.3 | Herr complex, chain-level cohomology/cup/duality comparisons and the separately proved p=2 descent. |
| PG.4 | Integral continuous ψ, trace divisibility, basis independence and exceptional kernels. |
| PG.5 | Degree-(1,2) ψ complex, derived Iwasawa comparison, finite-character maps and late Bloch–Kato normalization. |
| PG.6 | Unramified bounded-weight Wach existence/freeness and reconstruction; no extension to arbitrary ramified de Rham families. |
| PG.7 | Relative Herr/Iwasawa complexes, perfectness/base change with Tor and exceptional loci. |

The review does not reinterpret a ψ operator as the multiplicative Coleman
norm, a rational equivalence as an integral classification, or a vector
regulator as a scalar p-adic L-function. Likewise, no exact averaging over
order-two torsion is inserted into the integral dyadic branch.

## 4. Five links: mathematical use and full-graph check

| Added edge | Justification and graph effect |
|---|---|
| PHT P7:annulus-foundations → Reg L2 | Makes the already stated analytic carrier import direct. The old graph already reaches L2 through PG.0–5. |
| PHT P7:annulus-foundations → PLL R30.1 | Makes the stated early analytic import direct; the old two-edge path passes through PG.0. |
| PG.6 → Reg L4 | Supplies Wach freeness/basis data at the actual signed-map consumer. There was already a path through PG.7; its existence does not prove the LLZ image theorem. |
| PG.7 → PadicFamilies L4 | The only addition changing reachability. PG.7 expressly names this consumer; L4's nonordinary/family suffix requires relative cohomology, triangulation and specialization with hypotheses. |
| Reg L1 → PG.5 | Supplies the promised final normalization against Bloch–Kato maps. Even this link is already transitive through Selmer L2 → L3. It is not an input to the core ψ-complex proof. |

The complete recorded graph has **1,968 stage vertices**, plus **51 external
input vertices**, and **3,508 edges**. `stageEdges` and the union of all
`stages[].requires` give exactly the same edge set. Including isolated stages,
the baseline and proposed graphs each have **2,019 vertices**. The proposal
adds five distinct edges, none already direct, giving **3,513 edges**. Both
graphs are acyclic; no new edge has a return path.

Thus **four**, not merely the three immediately obvious links, expose existing
transitive requirements. The author report does not deny the fourth path;
this review supplies the full-graph refinement of its partial check.
The current coarse Selmer L2/L3 stages already account for that Bloch–Kato
reachability. At proof-node granularity preserve the early cochain/inverse-limit
construction independently of the later local-condition comparisons.

Four deliberately invalid variants were tested and each creates a cycle:
Reg L2 → PG.5, Reg L3 → PG.5, Reg L4 → PG.5, and full PHT P7 → PG.0.
The last fails because full P7 consumes PG.3/6; its early annulus prefix does
not. The proposal uses the correct prefix. No PG.7 → PLL R30.1 edge is proposed;
its rejection is a mathematical scope decision, not a fabricated cycle claim.

These results concern the full **recorded** atlas plus RS-26, not unrecorded
proof dependencies or the simultaneous application of every pending proposal.

## 5. External consumer conservation

The full graph has **21 existing direct external consuming stages**. Each
full statement was read. Every one retains its supplier, since all member
stages and edges survive unchanged. The following groups enumerate all 21.

| Consumers | Preserved requirement |
|---|---|
| CompletedCohomology R31.4; GL2ModularityLifting R32.1 | The exact local theorem, with nonzero-map, injectivity and isomorphism hypotheses distinct, and exceptional small-prime branches retained. |
| GeneralizedHeegnerCycles GH.2, GH.4, GH.7 | Correct local conditions, a specified functional on the vector regulator and source-normalized reciprocity; the two-variable/Yager input is additional work. |
| GrossZagier GZ.9; HeegnerPointEulerSystems HE.3 | Bloch–Kato/Kummer comparisons and actual local conditions; neither a nonzero cohomology class nor a generic regulator gives the required logarithm identity. |
| Kato L3; ModularIwasawaMainConjectures L0 | Differential/refinement projection, growth-uniqueness range, and the integral image-of-Coleman-map correction before a principal-ideal simplification. |
| RankZeroOneBSD BSD.6a, BSD.7a | Branch-specific arithmetic reciprocity/control and residual/local conditions, not a generic main conjecture inferred from the regulator. |
| EllipticRegulators ER.8, KU-ellipticpadic | Good-reduction symbol/syntomic comparison and readiness aggregation; no p-adic conjecture added to the real CM theorem. |
| HabiroNumberFields HB.7, KU-habiromodules | D.4 normalization and the original K₃ readiness interface, with p>3/unramified restrictions tracked. |
| MotivicEtaleKTheory M.8 | Syntomic/étale regulator and local-condition inputs, distinct from a claim proving the Tamagawa-number conjecture. |
| PHT P7 | Late period/Herr/Wach comparison, never substituted for the early analytic carrier. |
| Polylogarithms P.6; SpecialValuesBirchTate KU-conjectures | The defined logarithm/regulator used to state further conjectures; no assumption of Leopoldt is introduced. |
| Selmer L2, L4 | Actual finite/local-condition and integral/discrete comparison maps, not newly duplicated cohomology constructions. |

The additional direct consumer is **PadicFamilies L4**. Its new PG.7 link is
confined to the qualified family-theory use; it does not assert uniform
integral lattices, constant D_cris rank or universal triangulations. Arithmetic
classes and their reciprocity laws still have to be constructed in their
own roadmaps.

Also read AutomorphicCongruences L3 and ModularIwasawaMainConjectures L4 to
check the author report's textual applications. They are not counted as new
or existing direct RS-26 edges: their displayed import prose and transitive
uses do not justify pretending a direct graph edge is already recorded.

## 6. Aggregate audit and pinned-library boundary

The full `data/library-coverage.json` is now available. It contains 31 accepted
batch reviews and 11 pending batches. Reproducing the exact projection of
`scripts/merge_library_audit.py` without writing the aggregate confirms that
**all ten** regulator records D.1–D.5 and L0–L4 agree with AUDIT-26, including
verdicts, target notes, selected declaration evidence and duplicate lists.
The complete accepted REV-AUDIT-26 report was read as well. In particular,
L2/L3/L4 have empty duplicate lists because their PG imports are deliberate.

KU-padicreg is a readiness checkpoint and has **no** aggregate audit record.
Neither PLL's six stages nor PG's eight stages occur in the reviewed aggregate:
AUDIT-33 and AUDIT-38 remain explicitly pending. Their relevant target and
overlap records were inspected as leads and checked against the member texts,
not promoted to reviewed absence claims. The author's aggregate-access
limitation is discharged only to this extent; this ownership acceptance does
not accept either outstanding library audit.

Independently opened at Mathlib commit
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

- `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`, lines 280–355:
  `cyclotomicCharacter`, its `spec`/`toZModPow` and Galois continuity statements.
  The roots-of-unity hypothesis is required for the intended specification;
  the definition is trivial otherwise. It does not construct a Robba action.
- `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`, full file:
  `TopRep.homogeneousCochains` and `continuousCohomology`, with their actual
  topological carrier. The documented iterated-function construction and
  outstanding comparison to the usual locally compact n-variable model
  prevent using this as an already-proved Herr or Iwasawa comparison.

The paired Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`.
No new exhaustive search of either Lean tree, general absence proof,
primary-paper proof audit or Lean compilation is claimed by this review.

## 7. Checks, change log and integration notes

Executed on the complete validation snapshot:

```text
python3 scripts/check_restructure.py research/blueprint/restructure/RS-26.result.json
research/blueprint/restructure/RS-26.result.json: ok

python3 -m unittest discover -s tests -p test_check_restructure.py
Ran 8 tests: OK
```

The CLI was run on both the original and reviewed proposal. Additional Python
checks verified exact three-member/25-stage conservation; 24/12 evidence
accounting; nine distinct owners and all endpoints; all five edge additions;
full-graph acyclicity and four failing cyclic controls; 21 preserved direct
external consumers; and equality of the ten reviewed aggregate projections.
JSON round-trip and equality after removing the added `review` object ensure
that no mathematical action, reason, owner or edge changed unnoticed.

**Change log:** add the required accepted review object; add this report and
its permitted handoff. No modification to the original author report, roadmap
documents, audits, source decompositions, atlas, labels or Lean files. A Lean
file is not required for this ownership job and was not compiled.

The orchestrator should apply the five links and ownership annotations, leaving
all existing mathematics and IDs intact. Keep the early-annulus and late-PG.5
comparison cuts at blueprint granularity. Coordinate the already identified
outside-family leads at D.2/M.8, D.5/ER.8, R30.2's generic smooth/distribution
inputs and the differential-equation Robba carrier with their owners; RS-26
does not claim those broader restructurings have been completed. There is no
remaining blocking question for the five-edge RS-26 proposal itself.

## Summary (under 200 words)

Accepted RS-26 without mathematical changes. All three roadmaps and 25 stages
remain; the nine owner contracts distinguish common (φ,Γ)-module inputs from
regulator and GL₂(Q_p) applications. All 12 evidence pairs and 21 existing direct
external consumer statements were checked. The five new direct links preserve
acyclicity of the full recorded atlas: 1,968 stages, 51 external input vertices,
and 3,508 → 3,513 edges. Four links expose existing paths; PG.7 → PadicFamilies
L4 alone adds reachability. Four invalid circular alternatives were rejected.
The official validator and eight tests passed. All ten reviewed regulator
records match the aggregate; AUDIT-33/38 remain pending, and KU-padicreg is a
readiness checkpoint rather than an audited construction. The two cited pinned
Mathlib statements were independently checked. Only the review object, report
and handoff are added. This accepts the ownership proposal, not completion of
the mathematical proofs or the outstanding library audits.
