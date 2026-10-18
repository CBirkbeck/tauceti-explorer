# DESIGN-ProbabilisticAndMetricNumberTheoryPartII

Completed by Codex, session `codex-NMw7uJ`, on 2026-10-18. Refs #3404.
The bot confirmed this session's claim before work began. This submission is a
complete target-level design, ready for independent review, not a checkpoint or
an implementation claim.

## Delivered and checked

The new roadmap, packet and reader agree on eight layers, TO.0–TO.7. They cover
all 22 routed GMR items, with the item-to-node crosswalk in both the packet and
reader. There are 40 nodes: nine definitions, four constructions, 25 theorems,
one comparison and one application. The definitions and constructions carry 49
API statements and 42 discriminating checks; 34 nodes are planets, with at most
six in each layer. Seventeen exact pinned declarations are baseline inputs.
All implementation statuses remain `unchecked`.

TO.0–TO.2 are closed at planning granularity. TO.3–TO.7 are planned with the
single owner-index gap G1 and the finite-matrix compatibility request inherited
through their prerequisite chains. Every mathematical target has a statement,
hypotheses, proof route, source locator and acceptance criterion. No further
mathematical scope is left for a continuation worker to discover.

Validation on the submitted files:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ProbabilisticAndMetricNumberTheoryPartII.json`
  reports zero errors and zero warnings.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/ProbabilisticAndMetricNumberTheoryPartII.lean`
  passes.
- `lean-check research/blueprint/suggested/ProbabilisticAndMetricNumberTheoryPartII.lean`
  elaborated successfully at the shared pinned build, with only the permitted
  proof-admission warnings. Available memory was checked first; the process
  completed and no Lean process was left running.
- The suggested file has 169 lines. Its definitions have actual light bodies
  on native carriers. Missing C¹, operator, cone and eigendata constructions are
  explicit README targets, with a packet omission ledger. The file states the
  native counting and uniform Tauberian milestones without pretending to build
  that infrastructure.

## Existing owners and remaining integration work

Mathlib was checked at `082e2d37e8b0463410cdb532e111cd43d5a66174`, and Tau
Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. Baseline claims were checked
against actual declarations at those git objects, not merely search hits.
The reviewed PM.0–PM.5 library audit and touching roadmap links were read.
The accepted PM.4 packet supplies the Gauss map, branch derivative, density
transfer formula, telescope and probability measure. The accepted
ArithmeticDirichletSeriesPartII supplies `HP.0/laplace` and
`HP.3/laplace-theorem`; this roadmap adds the uniform parameter adapter.

Current TauCetiRoadmap main was read at
`0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine post-snapshot
roadmap directories and the relevant Completed roadmaps. OperatorTheory and
Completed/ContourIntegration readers were read in full; the specific
DifferentialGeometry and OptimalTransport supplier sections and signatures
were checked. General Schauder, function-cone contraction, the two-norm
spectral criterion and complex simple Banach eigenvalue perturbation were not
found in either pinned library or an existing upstream owner of those targets.
The searches distinguished unrelated PBW Birkhoff, path-measure
Ionescu–Tulcea, homological perturbation, Hilbert/selfadjoint Kato–Rellich and
partial-linear-map resolvent results.

G1 is an atlas indexing issue, not a request to prove Brouwer again. Existing
DifferentialGeometry Layer 10 §10.5 owns
`TauCetiRoadmap.DifferentialGeometry.exists_fixedPoint_closedBall`. Its exact
commit, URL, signature requirements and use in the finite convex hull reduction
are recorded in `upstreamDependencies`. The atlas stage index lacks this
post-snapshot owner, so entering it as a pinned library declaration would be
false. At packaging, register/import that existing stage and discharge G1.
The zero-dimensional case is separate; Euclidean projection and rescaling
reduce a finite convex hull to the owner's unit-ball theorem.

The one request is to existing OptimalTransport Layer 13B, item 9, for its
finite strictly positive matrix Hilbert max/min metric and Birkhoff
`tanh(diameter/4)` contraction. TO.3 owns the general comparable-cone and C¹
function-cone extension. Verify exact agreement on positive finite vectors;
do not duplicate the finite theorem. No mathematics was moved from a higher
tier, no new independent direction was split off, and no upstream file was
edited.

## Sources, corrections and review priorities

Seven public sources were read. The packet and reader preserve URLs, edition
information, reading date, section/theorem/page locators and file hashes:

- Gamburd–Magee–Ronan, Annals 190 (2019), pp.751–809: §1 and §§4–5,
  especially pp.790–804; arXiv v3 §5.3, pp.46–53, supplies the omitted
  derivative calculations. Published numbering is used unless v3 is named.
- Lalley, Acta Mathematica 163 (1989), §§7–8, pp.23–32: the resolvent pole,
  growth bound, smoothing and unsmoothing argument.
- Liverani, *Decay of correlations*, author preprint dated 1993 of the 1995
  Annals article: Theorem 1.1, Lemma 1.3 and §2, preprint pp.3–12. Locators
  explicitly refer to preprint pages.
- Morris–Noussair, Matematický časopis 25(2) (1975), §§1–2, pp.165–168,
  especially Theorem 2.6: compact-convex fixed points via finite-dimensional
  approximation. Journal metadata was also checked in the DML-CZ record.
- Kloeckner, Journal of Operator Theory 81(1) (2019), pp.177–189:
  simple-eigenvalue implicit-function proof, derivatives and gap stability.
- Hennion, PSMIR (1995), fascicule 2, §§1,3,5 and Appendix A,
  pp.2–3,11–13,19–22,43–46: ball-cover noncompactness and the spectral
  decomposition proof behind the two-norm criterion.

The private source index was inspected. Kato is not cleared and was not
obtained; the public Kloeckner proof replaces that dependency. No restricted
book or passage was copied. No source remains necessary but unread for the
chosen proof route. Pollicott's ambiguous reference and finite-type symbolic
theory are not used as substitutes for the countable-branch argument.

Ten source findings are recorded as paraphrases, awaiting independent review.
Important corrections are the closure of the coding image, the `2^σ` weight
bound, real-part operators in complex derivative inequalities, the exact
resolvent splitting, the counting residue `h/(β|λ′|)`, squared derivative
denominators, closed cusp boundary, the supplement's column comparison and
coordinate misprints, and boundary fixed vectors being nonnegative. The journal
landing page, Magee's publication list, arXiv history and bounded web searches
for an erratum/correction located no separate correction; this is not an
exhaustive nonexistence claim. The index-range correction already appears in
the published version. No finding is presented as independently confirmed.

The reader records a fresh, explicitly uncertified n=4 collocation diagnostic:
mesh/cutoff `(16,100)` gives eigenvalue estimates
`1.02201312, 1.00155870, 0.98166645` at `s=2.42,2.44,2.46`;
`(32,300)` gives `1.02398743, 1.00333699, 0.98326670`.
Both use piecewise affine interpolation, both branch indices, `A=0,…,B`,
max-normalized power iteration from one, and a coordinate-change tolerance
of `10⁻¹¹` (20–21 iterations). Mesh coordinates, interpolation and the analytic
tail bound are in TO.7. These are reproducible acceptance diagnostics, not
certified bounds for the infinite-dimensional eigenvalue.

Independent review should concentrate on the closed-jet carrier and boundary
chain rule, the cone-order-to-C¹ convergence estimate, Hennion's Appendix-A
spectral step, the uniform Tauberian smoothing and squeeze, inverse-letter
freeness and the Rauzy sorting/permutation comparison. The proof of the
exponent's existence uses the two pressure limits directly, without invoking
arithmetic counting or making a Hausdorff-dimension assertion. All material
needed after scratch cleanup is preserved in these deliverables.
