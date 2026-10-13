# BP-ShimuraCompactifications — complete target-level plan

Issue: #9431. Agent: Codex (GPT-6), session `codex-BbHPTk`. Date: 13 October 2026.
This is the complete nine-layer blueprint, not a checkpoint. It awaits independent
review; the author has not inserted a review verdict. Nothing is claimed implemented.

The authoritative deliverables are [the packet](../packets/ShimuraCompactifications.json),
[the reader](../readmes/ShimuraCompactifications.md), and
[the suggested signatures](../suggested/ShimuraCompactifications.lean).
The reader states all targets, hypotheses, proof outlines, locators, APIs and checks.

## Scope and coverage

The title is **Analytic toric geometry, Part II: arithmetic toroidal compactifications**.
It extends the unchanged upstream AnalyticToricGeometry L0–L5 complex finite-fan
anchor, as accepted by RS-32. No stage id or neighbouring roadmap was edited.
All nine layers are `planned`, none `closed`; all 147 nodes remain `unchecked`.
Here `complete` describes completion of the planning job, including explicit supplier
requests and proof gaps, and does not describe completed mathematical formalization.

| Layer | Targets | Atlas planets | Main addition beyond the finite complex anchor |
| --- | ---: | ---: | --- |
| C0 | 20 | 5 | Uniform coefficient/torsor charts, arithmetic fans, integral boundary and completion comparisons |
| C1 | 6 | 5 | Mixed boundary group, torsors, effective stabilizers and cusp labels |
| C2 | 9 | 6 | Controlled arithmetic quotient gluing, properness, algebraization and canonical descent |
| C2.general | 1 | 1 | The V8.general datum/canonical-boundary interface |
| C3 | 12 | 5 | Compatible refinements, maps, Hecke spans and separate coherent comparisons |
| C3.general | 1 | 1 | The general-data map/span descent interface |
| C4 | 15 | 5 | Relative polarized effectivity, Raynaud/Tate interfaces and boundary Hasse comparison |
| C5 | 30 | 6 | Good-prime ordinary PEL construction, minimal model and distinct normalized extensions |
| C6 | 53 | 6 | Direct integral Hilbert construction, cusp series, Koecher and modular comparisons |

There are 28 definition/construction targets, with 125 named API items and 97
explicit definition/construction tests. Each of the 28 has at least three tests;
additional theorem acceptance checks and worked examples occur throughout the reader.
The packet has 45 external supplier requests, 25 explicit gaps, 27 read pinned
baseline declarations and 18 routed source-item coverage records.

## Continuation and identifier reconciliation

The inputs are `ShimuraCompactifications--C0` (90 nodes) and
`ShimuraCompactifications--C6` (52 nodes), their latest independent reviews, RS-32,
the nine stage audits, routed paper entries, and the applicable source corrections.
The C0 review corrected the mathematics but requested full geometric prototypes in
Lean; that older requirement is superseded by the binding 12 October 2026 shape.
The C6 part was independently accepted after correction. Neither part was changed.
Those verdicts are historical inputs, not an independent review of this new root.

All 142 existing target contracts continue here, with revised hypotheses and supplier
chains where the full-roadmap reconciliation needed them. The checker rejects an id
that occurs in both a new root packet and an unchanged part. The issue permits only
the four root deliverables, so it does not permit deleting those parts. Root ids use
`<stage>/roadmap/<slug>` and each node records `continues`; the complete 142-pair map
is `continuation.nodeIdMap`. This is one roadmap owner and explicit continuation,
not a second roadmap claiming the same mathematical construction. Four former
internal supplier requests are resolved by the root target chains and retained only
as historical records under `continuation.resolvedInternalRequests`.

Five targets were added to make those internal comparisons explicit:

1. C0 `regular-boundary-union`: the product coordinate ideal, its free quotient basis,
   flatness and geometric reducedness over arbitrary coefficients, retaining nilpotents.
2. C0 `completed-regular-chart-support`: the exact finite-support condition modulo
   each power of the product ideal, quotientwise convolution and fixed localization shifts.
3. C0 `integral-changed-lattice-comparison`: a finite-index lattice/pullback-fan map
   is finite over every coefficient ring; its normalization interpretation has separate
   normal-domain hypotheses, and later subdivisions can be nonfinite.
4. C4 `semiabelian-hasse-boundary-comparison`: relative Frobenius, Verschiebung and
   the determinant Hodge section over characteristic p, abelian compatibility, split-torus
   value one and base-change/gluing. This is the boundary extension moved down from T0.
5. C6 `hilbert-boundary-global-functions`: proper flat finitely presented boundary
   over its finite étale cusp base, with geometrically reduced connected fibres, has
   universally constant global functions for g>1. The deduction uses explicit SF.0 inputs.

## Mathematical distinctions preserved

- C0 uses actual monoid algebras, ideal quotients and torsor weight algebras. Its fans
  are locally finite on the positive open domain and finite modulo the effective action;
  they need not have finitely many cones, and local finiteness at zero is not required.
- An off-face closed-stratum ideal, a boundary-union product ideal, and an intersection
  of boundary branches are different. The Z/4 examples preserve the nilpotent 2.
  Product-adic completion is not an unrestricted formal-series ring or a general
  tensor/completion interchange theorem.
- C1 uses the corrected exhaustive filtration on Lie P, not a quotient Lie V in a
  filtration step. Ineffective stabilizer kernels are separate from finite effective actions.
- C2 separates controlled analytic quotient construction, algebraization of the abstract
  analytic space, and special mixed canonical descent. An algebraic-source GAGA Hom
  theorem does not construct the algebraization. Local normal crossings does not imply
  global simple normal crossings without the face no-self-identification condition.
- C3 separates structure-sheaf pushforward, higher direct images, and boundary-ideal
  comparison. For a coordinate blow-up, total pullback has exceptional multiplicity two
  while the new boundary has multiplicity one. There is no false equality of the two
  subcanonical line bundles. Changed-level invariants use the finer-to-coarser deck group.
- C4 requests real relative effectivity and its theta construction from the appropriate
  owners, imports local R11.3 theory, and supplies the relative extension. The full Tate
  extension in period u is distinct from the identity-component model over based q.
  Extended quasi-finite flat kernels are not silently declared finite flat. Torus-rank
  factorization is on the stated constant-rank strata, not a global rank-jump splitting.
- C5 good-prime ordinary smooth moduli, finite normalization of a compatible same-fan
  generic level cover, and Lan's projective normalized blow-up are three distinct objects.
  Finite normalization is not automatic identification with a smooth higher-level moduli
  space. The normalized blow-up uses its own ramified interior/minimal supplier.
- C6 constructs the fine Hilbert model over Z[1/N(n)] directly from C0/C4 and exact
  H2/formal-gluing inputs, including discriminant primes. It does not import good-prime
  C5 smoothness at those primes. The gluing request includes the dense-open relation,
  DVR and Artinian-thickening lifting and uniqueness in Dimitrov Theorem 5.11.
- Hilbert Hodge generation uses the normal-base semiampleness and curve isotriviality
  inputs. Finite generation uses coherent section modules over a Veronese algebra, not
  merely integrality. Minimal fan independence uses a common refinement and actual
  integral pushforward/line comparison, not agreement only on the generic fibre.
- For Hilbert Koecher g>1, zero exponents are retained and nonzero nonpositive exponents
  are excluded. Constant-term vanishing needs a regular character difference. In Z/4,
  character 3 fixes the nonzero coefficient 2. Module q-expansion detection uses directed
  unions and injective coefficient maps, never colimit commutation of the full series module.
- Integral cusp ideals use actual boundary global functions and contraction Stein
  equality. Native Hasse/differential comparisons retain their integral models. Wild full
  levels remain conditional on H2/H4/SF.3 local-model and finite-normalization interfaces;
  BHW's characteristic-zero added-level construction does not prove all those integral claims.

## Library and current-upstream boundary

Compilation baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
The actual statements and hypotheses of the 27 baseline declarations were inspected,
including native monoid-algebra, ideal-quotient, units/Dirichlet, trace-dual and MHS APIs.
Only the requested interfaces are claimed supplied by them.

Current-main inspection used TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. AnalyticToricGeometry,
AdicSpaces and AlgebraicVectorBundles were inspected in their relevant sections.
The nine roadmaps newer than the atlas snapshot were searched for overlaps, including
all nested OperatorTheory suggested modules. Current `affineToricScheme`,
`Fan.algebraicRealization`, chart inclusions and native relative-Spec functors are existing
work and are imported through their owners. They are not claimed available at the older
compilation pin. Uniform coefficient/torsor descent and arithmetic quotient comparisons
remain genuine extensions. No build or Lake command ran in the current-main checkout.

## Source provenance and limitations

Every repository statement and proof discussion is in our own words with theorem,
section and page locators. No source passage or section-by-section summary is included.
The packet retains the previous part/review reading dates separately from this run.
Fourteen matching public PDF hashes were reverified; matching a binary does not claim
fresh reading of its entire contents. The source list and version records distinguish
arXiv copies, author copies, published PDFs and uncollated publisher editions.

Fresh selected reading used for the substantive additions/reconciliation includes:

- Dimitrov author copy, main text printed pp. 525–549, particularly toric completion
  (§2), formal gluing (5.11), lattice maps (Remark 7.3), boundary geometry (Corollary 7.4),
  Koecher (8.3), coefficient descent (8.5) and the six minimal-model assertions (8.6).
- BHW published copy, pp. 1745–1748 and 1758–1760: exact added-level setup, Lemma 5.12,
  semiabelian boundary and invariant differential comparison. The general C4 determinant
  comparison is our deduction from the named group-scheme suppliers, not a claim of a
  separately printed theorem giving every generalization.
- Boxer–Pilloni author copy, 3.4.15–3.4.25, pp. 39–40; 4.1.1–4.1.18 and 4.2.2,
  pp. 41–43: actual partial-ordinary comparison and quasi-finite flat isogeny setting.
- BCGP 2021 §8.2, p. 240, and BCGP 2025 Theorem 1.8.29 with its proof context,
  pp. 17–18: formal H0 Hartogs versus the downstream étale comparison.
- Yuan's recovered author copy dated 21 August 2024, §3.4, printed pp. 54–56,
  Theorem 3.8: the coarse minimal Hodge Q-line input. Its inspected SHA-256 is
  `b36f4860cc0f098ef062523e8a5147e8172d1e4e357fc76a63cd7c0d782a813e`.
  The author publication page and Annals publication metadata were checked. The source id
  `YUAN-2024` stays stable; the earlier arXiv version remains separately recorded.
- The maintainer-cleared Faltings–Chai reference copy, V.2.1–2.8 and V.3.1–3.4,
  printed pp. 149–166: hypotheses of Hodge generation, Stein/Veronese construction,
  theta argument and finite-level descent. Only selected cleared pages were read; no
  private file or extracted text was copied or saved. Earlier I.2 source reading remains
  identified by its earlier provenance.

The detailed Lan/Pink/BPS/Pilloni/CG/Stacks and companion-paper locator scopes and
independent checks carried by the earlier parts are preserved in `sources`. They are
not relabelled as a fresh full-paper reading. Original AMRT and KKMS arguments,
Moret–Bailly's original proof, Pink special mixed-model 12.13–12.17, some normalization
and theta proof leaves, and publisher-version collation remain explicit limitations.
Cleared Faltings–Chai reading reduces the previous V.3 source-access gap; it does not
implement theta machinery or make the cited original Moret–Bailly proof read.

The six previously independently confirmed accessible-copy source issues are retained:
Pink's filtration; Lan's arbitrary-base reduced-stratum identification; Lan 2017's reversed
level quotient; the nonzero exponent needed in Dimitrov's proof; the zero coefficient
module wording; and the false filtered-colimit claim for full formal series. No new
independent verdict was inserted, and no uninspected publisher edition is accused.
Five routed corrections (Pilloni E40/E109, Boxer–Pilloni E67, BPS E14 and CG E165)
are incorporated in the corrected contracts, with their scope in `sourceCorrections`.

## Owner actions outside this issue

Only the four authorized root files were edited. The following changes to other
owners are proposals for the maintainer or their own jobs, not edits made here:

- RT-AREA-algebraicgeometry/3: put the actual nilpotent-preserving complex analytic
  carrier/gluing layer before ComplexComparisonPartII comparisons; retain agreement
  with PR196 if it merges. Repoint outgoing consumers V2, M3 and R12.3 there.
- RT-AREA-algebraicgeometry/27: C1 now consumes HodgeStructures L2 and native MHS
  declarations. Add the remaining D1/D3, Selmer L4 and Abelian A5 outgoing links there.
- RT-AREA-algebraicgeometry/34: the Binda–Kato–Vezzani nonarchimedean Part II imports
  C0's single arbitrary-ring scheme theorem and starts new work at formal/adic/perfectoid
  geometry; valuation rings do not justify a second scheme owner.
- RT-AREA-padic-1/26 and the tier rule: R07.2 owns generic Ha/LF/BT₁ Hodge–Tate;
  C4 owns its semiabelian boundary extension and C6 imports it. T0 must import that
  C4 comparison and retain its own quantitative canonical-subgroup work.
- Repoint AG2.4 to consume C5's good-boundary geometry export; no C5 input requests
  the downstream cohomological conclusion.
- Split early C1 boundary-group exports from late cusp labels, and early C5 toroidal
  exports from B5/late-C5 minimal comparisons, without changing scope ids. The local
  node graph is acyclic; it does not prove the whole atlas graph acyclic.
- Repair the R11.3 local supplier: its current Raynaud node verbally consumes early
  C4, while RS-32 imports local R11.3 into relative C4. Provide the independent local
  interface in that owner before using the relative extension. This remains a real
  supplier-direction obligation, not an asserted globally closed chain.

The 45 requests state their exact interfaces and `neededBy` lists. The 25 gaps name
what remains unproved or unavailable. In particular no informal supplier citation is
used to mark a node or layer closed. Independent review should check the H2/SF.3
ramified-Hilbert gluing inputs, C4/R07.2 determinant interface and the integral boundary
function deduction against the precise source and model hypotheses.

## Validation

- `lean-check research/blueprint/suggested/ShimuraCompactifications.lean`: passed
  at the compilation pins on 13 October 2026. Eleven warnings, all `declaration uses
  sorry`; five theorem signatures and six examples, no errors or other warnings.
  The final file uses the `TauCetiRoadmap.ShimuraCompactifications` namespace,
  individual imports, one opening module docstring and layer comments. It states
  rather than develops. There are no new data definitions or fabricated geometric carriers.
- `scripts/check_sorry_data.py`: passed. The suggested file is below the 5,000-line limit.
- `scripts/check_blueprint.py`: passed with zero errors and zero warnings, using the
  available pinned declaration index rather than only the form-only fallback.
- Intake `check-files` for all four deliverables: passed, with no local machine paths.
- Cross-file inventory: all 147 node contracts/anchors, 125 API statements and 97
  definition/construction tests retained; 28 definitions/constructions each have at least
  three tests; five Lean theorem names match the reader. Local prerequisite DFS passed;
  all reader internal anchors resolve. `git diff --check` passed.

Lean elaboration checks signatures, not the truth of proofs replaced by `sorry`.
The full geometric targets deliberately remain in the reader because their required
carriers are not at the compilation pins. No process, build, downloaded public source,
private source, generated text, or scratch notes need to persist for the next worker;
all actionable handoff details are above and in the packet.
