# BP-Polylogarithms--P.4 handoff

Issue #6389; worker Codex; session codex-x7kpfq; 2026-10-06.
Branch: codex-x7kpfq-polylogarithms-p4.

## Finished pass

The packet is complete at target level. Its only stage, Polylogarithms:P.4,
is planned, not closed. All four audited targets are represented. The
accepted parent is imported by id and was not edited. New nodes have distinct
ids, and all implementation statuses remain unchecked.

Deliverables:

- [Packet](../packets/Polylogarithms--P.4.json): 18 nodes (6 theorems,
  6 constructions, 4 comparisons, 2 definitions), 47 API items, 32 tests,
  2 new planets, 13 checked baseline declarations, 5 gaps and 3 requests.
- [Reader](../readmes/Polylogarithms--P.4.md): approximately 5,800 words;
  exact conventions, proofs, ownership, all API/test statements and acceptance.
- [Suggested file](../suggested/Polylogarithms--P.4.lean): all 47 API names
  and 32 example identifiers, on native Mathlib algebraic objects.

The two new planets plus the four inherited P.4 planets meet the six-planet
limit. Do not promote the cycle obstruction as a seventh planet.

The pass reads and plans the full scalar analytic descent argument. It
corrects two source formulas, records the general-weight parity and period
normalization, refines rank existence to a nonzero rational witness, and
constructs the exact obstruction to lifting an inductive cycle through the
explicit weight-four presentation. It also supplies P.3's exact conditional
weight-four homotopy statement.

## Validation

Mathlib pin: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Tau Ceti pin: f790474821cf4256814db967cb154e7af3d0c369.

The packet checker passes with zero errors and zero warnings, both with its
ordinary invocation and with the supplied pinned declaration index. The
13 declaration statements were read at that pin. Source-issue validation and
source-version validation pass. A name cross-check finds every API declaration
and every test identifier in the suggested file. The inherited-plus-new
planet count is six.

The suggested file was elaborated with lean-check at the pinned Mathlib:
exit 0, zero errors, 83 warnings, all declaration-uses-proof-placeholder
warnings. Memory was checked before each run and exceeded the required
20 GB available. No build, package update or language server was started.

This is signature validation, not implementation or proof validation.
Unimplemented parent/supplier Lean definitions are not redeclared. Maps and
their actual mathematical compatibility hypotheses are parameters of the
new native constructions. The opening note identifies full source theorems
that cannot yet be stated against those missing definitions; it specifies
the concrete reductions actually prototyped. No unavailable condition was
replaced by an unconstrained proposition or an empty structure.

## Exact follow-up work

1. Prove specialization preserves the parent's rational-curve relation
   subspace through degenerating two-variable kernel families. Angular
   components repair the printed tensor rule, but do not establish this
   relation-descent step. Keep the joint induction across weights and fields.
2. Decompose the full weight-four proof in the proposed Polylogarithms Part II:
   GR Theorems 1.13–1.14, Corollary 1.15, Theorems 7.6 and 9.1, §9.3,
   the cycle-level Hodge period adapter and all-explicit-cycle rational
   regulator-image containment. The map from K₇ into cycles alone is
   insufficient for the every-family assertion.
3. Resolve the inductive part-(b) presentation issue: either prove every
   obstruction in ker(p₃⊗id)/δ₄-exp(ker p₄) vanishes, or prove the weaker
   calibrated regulator-period containment for every inductive cycle.
   Do not assume the conjectural B₃-exp/B₃-ind isomorphism.
4. Extend symbol specialization to finite polynomial places with residue
   fields k_p, prove relation descent and finite support, and verify the
   signed cochain squares. Uniformizer-first exterior residues satisfy
   ∂d=−d∂ in the displayed native shift convention.
5. Prove or retain the exact weight-four homotopy conjecture as a hypothesis.
   Even under it, conditional derived transfers need primitive-element
   independence, tower compatibility and agreement with Milnor transfer.

The supplier requests are:

- K3BlochGroups V.4: Suslin Corollary 5.6, B(F(t))≅B(F) for infinite F,
  with compatible specialization retractions and its K₃-ind proof input.
- BorelRegulators R.7: scalar Lₙ versus its Tate-divided Burgos coordinates,
  explicitly πⁿ⁻¹ times a nonzero rational factor, and the weight-four
  cycle-level L₄* correction. The existing factor-two comparison is not enough.
- SchemeKTheoryOperations S.6: number-field rational weight-n Adams purity
  identifying the relevant eigenspace with all K₂ₙ₋₁(F)_ℚ, compatibly with
  localization and regulator.

These retain their existing owners. The packet's restructure proposals give
named Part II exports; no new stage ids were invented.

## Sources and assembly cautions

The packet contains stable source URLs, exact editions, SHA-256 digests,
read sections and access date for all five sources. It is sufficient to
resume without the deleted scratch downloads:

- Goncharov 1994 author manuscript, §§1.4–1.5 pp. 6–9 and §2.3 pp. 13–14:
  the analytic descent proof and general-weight positive-value period.
- Goncharov 1995 published scan, pp. 220–225 and 237–241: specialization,
  derivative/descent, residues and Conjecture 1.39; scans inspected visually.
- Zagier 1990 published scan, pp. 391–394 and 410–417: parity,
  Bernoulli scalar convention and distinct numerical/motivic assertions.
- Goncharov–Rudenko arXiv v5, §§1.1–1.2, §§8.1–8.2 and §9.3:
  exact explicit complex and regulator interfaces. Full §§2–7 and §10
  proof decomposition is not claimed and has the named Part II owner.
- Suslin English translation, §5 pp. 233–238: Corollary 5.6 and the
  specialization discussion. Rational invariance means a rational-function
  extension, not merely rational coefficients.

No necessary source was inaccessible. Two new source issues await independent
review: G95 p. 222's tensor rule is not bilinear (the t and 2/t example), and
p. 223 (1.28c)'s last exponent is n−2, not n−1. The latter correction appears
already in (1.28b) and G94 (14). The parent's empty determinant correction
Polylogarithms/E2 is reused, not reported again as a new issue.

Assembly must preserve three corrections without editing the accepted parent
in this job: rank-only existence needs rationality before rational rescaling;
the explicit/inductive weight-four boundary distinction remains visible;
the GR/G94 rational-curve quotient is not equated with G95's all-smooth-curve
quotient without an adapter. The normalized empty determinant for ℚ at
weight four has rational factor 90 and cannot be column-rescaled.

No other issue was claimed. Scratch material is disposable; every continuation
input and every validation outcome needed by a reviewer is recorded here or
in the three deliverables.
