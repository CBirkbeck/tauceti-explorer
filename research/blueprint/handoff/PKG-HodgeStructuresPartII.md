# PKG-HodgeStructuresPartII — blocked checkpoint

Issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Codex (GPT-6), session `codex-DS6Pib`, 10 October 2026.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6094464727).
Branch: `codex-DS6Pib-hodge-package`. No manager-priority issue was available;
this available focus package followed WORKERS' fallback order. Only this job
was claimed.

## Current status and resumption gate

**Incomplete; blocked by missing supplier specifications outside this job's
editable files.** This session independently checked the H.0 consumers,
continuation G1/G3, the CR.1 and DD.1 supplier statements, current upstream
roadmaps, native library declarations and primary sources. The contracts
identified in the retained predecessor handoff remain missing:

- `H.0/ordinary-fiber` requires connections on the supplied commutative ringed
  differential site, preserving the additive operator, its exterior extension,
  curvature, horizontal maps and restriction/gluing. The present
  `CrystallineCohomology:CR.1/integrable-connection` specifies affine quotient
  differential modules and the small crystalline site with PD-base hypotheses.
  It does not export this general-site interface.
- `H.0/rees-parameter` and `H.0/rees-specialization` require an ordinary finite
  locally split Rees module sheaf with finite locally free graded pieces and
  natural zero, unit and localized fibres, including descent, tensor and
  quotient coherence. `DerivedDeRhamCohomology:DD.1/filtered-modules` and
  `DD.1/rees-description` specify enhanced derived filtrations and their graded
  derived Rees equivalence. They do not export the requested ordinary sheaf
  specialization and fibre comparisons.

The repair is to supply these contracts in their existing owners and then
reconcile H.0's references. The exact minimum statements and remaining G2/G4–G7
work are retained below. Issue #7491 expressly prohibits packet edits and
requires plan mistakes to be recorded here; PROTOCOL §§3, 15 and 20 require
exact prerequisites, shared ownership and fidelity to the accepted plan.
Defining the missing owners inside this package would duplicate shared work.
No missing Lean implementation alone is being treated as a blocker.

The input reviews are accepted, but H.0 still records seven gaps and four
requests; all nine continuation layers are `planned`, none `closed`. The
parent records 13 gaps and five requests. Passing their structural checks does
not establish mathematical closure. The full target audit remains unfinished.
This checkpoint changes only this handoff. The README and Suggested.lean are
preserved, and metadata remains absent so intake records an incomplete job.
The intended topic on eventual completion is `math.AG`.

## Additional current-library evidence

The upstream roadmap checkout remains at
`0a56d1b5303c26887a4042db834f46d9079ac593`; the current native Tau Ceti checkout
remains at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both match the preceding
checkpoint. Read AlgebraicVectorBundles and DifferentialGeometry READMEs in
full and the relevant Suggested.lean declarations. Inspected these further
candidate statements rather than relying on name matches:

- `Module.Free.of_filtration`, in Tau Ceti's
  `LinearAlgebra/FreeModule/Filtration.lean`, proves freeness from an exhaustive
  increasing natural-number filtration starting at zero and free successive
  quotients. Its chosen splitting/direct-sum proof does not construct an
  ordinary Rees sheaf, finite locally free graded fibres or their natural maps.
- `Module.iInter_freeLocus_subquotient_subset_freeLocus`, in
  `RingTheory/Spectrum/Prime/FreeLocus.lean`, bounds the free locus of a filtered
  module using its successive quotients. It supplies neither the missing
  finiteness/descent contract nor Rees specialization maps.
- `TauCeti.SheafOfModules.tensorProduct` and `tensorProductIso`, in
  `Algebra/Category/ModuleCat/Sheaf/TensorProduct/Basic.lean`, supply a genuine
  sheaf tensor construction under their sheafification assumptions. This is
  usable infrastructure, but does not supply either missing owner export.
- `reesAlgebra.grade` and `mem_grade_iff`, in
  `RingTheory/ReesAlgebra/Grading.lean`, concern ideal powers in a polynomial
  Rees algebra. The ideal Rees construction in StableReduction and the
  filtered-module error-ideal result in IntegralHeckeAndGaloisDeterminants
  likewise do not specify the decreasing-filtered module sheaf needed here.
- DifferentialGeometry's `CurvatureForm` concerns smooth real manifold/vector
  bundle curvature, not the supplied ringed differential site's connection.

Re-read [Stacks §60.15, Lemma 60.15.1](https://stacks.math.columbia.edu/tag/07J5)
with [Situation 60.7.5](https://stacks.math.columbia.edu/tag/07MF), and Bhargav
Bhatt's [*Prismatic F-gauges*](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf),
§2.2.1, Proposition 2.2.6 and Remarks 2.2.7–2.2.8, printed pp.16–17.
These support the crystalline connection equations and derived/affine Rees
specializations; they do not change the scope of the present owner exports.
No source passage is recorded here.

## Fresh validation in session codex-DS6Pib

- All ten `python3 scripts/check_blueprint.py <packet>` checks exited 0,
  each with zero errors and zero warnings. The inventory below is unchanged.
- `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`
  exited 0: zero errors, 1619 warnings, all `declaration uses sorry`, and no
  other warnings. The managed build uses Tau Ceti f790474 / Mathlib 082e2d3;
  available memory before compilation was 113 GB. No Lean process from this
  session remains running. Elaboration does not prove the admitted results.
- Scoped intake `check-files` passed: one handoff file, zero problems.
  `git diff --check` passed. Only the issue-authorized handoff changed.
- The three packet hashes and two package hashes recorded below were freshly
  recomputed and match. README size remains 193329 bytes; Suggested.lean
  remains 812114 bytes. No packet or package artifact was edited.

Everything needed to resume is in this handoff and the repository. No scratch
file is needed. The following predecessor record is retained for its exact
contracts, chart work and remaining audit checklist. Its session-specific
validation and authorship claims refer to that earlier session.

---

# Retained predecessor handoff — codex-VdQsGE (historical)

Issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Codex (GPT-6), session `codex-VdQsGE`, 10 October 2026.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6094321233).
No manager-priority issue was available at selection. This available focus
package followed WORKERS' fallback order. Only this job was claimed.

## Status and next effective action

**Incomplete; blocked by missing supplier specifications.** This run independently
rechecked G1 and G3 against the current consumer, supplier nodes, DD package,
current upstream roadmap specifications and native library statements. The
missing contracts persist. This is not a timeout or a requirement to wait for
Lean implementations of already adequate mathematical specifications.

Issue #7491 permits only the package README, Suggested.lean, metadata and this
handoff. It prohibits packet edits and directs plan mistakes into this note.
PROTOCOL §§3, 15 and 20 require exact prerequisite interfaces, one owner for
shared mathematics, and a package faithful to its accepted plan. Repairing the
missing owner exports and consumer references is outside this issue's editable
files. Constructing the owners' general objects here would duplicate their work.

The issue's assertion that the plan is complete must be reconciled with the
accepted review: H.0 was accepted as a target-level planning pass with seven
explicit gaps and four requests, not as a closed roadmap. All nine continuation
layers are `planned`; none is `closed`. Structural validation deliberately
permits those gaps. Acceptance does not assert that the requested supplier
statement exists.

**Maintainer routing needed before another package pass:** authorize the CR.1
and DD.1 owner-contract repairs below, then authorize reconciliation of the
H.0 references. Rechecking the unchanged gaps or proving more affine chart
identities cannot replace those repairs. This checkpoint changes only this
handoff; it preserves the inherited package artifacts. Metadata remains absent
so intake does not mistake the unfinished package for a complete submission.
The final topic, when completion is justified, is `math.AG`. This run checked
the current upstream checkout below and the newly accepted crystalline
revision. No implementation wait is requested.

**Change since the preceding checkpoint:** [#8253](https://github.com/CBirkbeck/tauceti-explorer/pull/8253)
accepted `CrystallineCohomology--CR.0` as a target-level pass. Its review now
names `independent-review-REV-CrystallineCohomology--CR.0~2` and records 41 gaps
and 23 requests. The `CR.1/integrable-connection` node, including its statement,
hypotheses, API and tests, is unchanged from the revision at `d8437bf3c`.
It still specifies affine quotient differential modules and the small
crystalline site. Acceptance of the revision therefore does not provide the
general-site export requested by H.0 G1. The Rees supplier and the H.0
consumer also retain their preceding specifications. Resume only when the
actual contracts below are supplied, rather than when a supplier's review
status changes.

## Exact blocking contracts

Read the parent targets `H.0/ordinary-fiber`, `H.0/rees-parameter` and
`H.0/rees-specialization`; H.0 continuation G1/G3 and their requests; and the
full statement, hypotheses, source support and API of the supplier nodes.

| Consumer | Present supplier specification | Required repair |
| --- | --- | --- |
| H.0 `ordinary-fiber`, G1: identify the λ=1 category on a supplied commutative ringed differential site, including the same additive operator, all exterior extensions, curvature, horizontal maps and restriction/gluing | `CrystallineCohomology:CR.1/integrable-connection` in `packets/CrystallineCohomology--CR.0.json` specifies affine quotient differential modules and the small crystalline site under explicit PD-base hypotheses. Its latest review is `accepted`; the requested general-site contract is still absent. | Export the general supplied-site connection and its natural affine/crystalline specializations. Ordinary integrability has no defining crystalline quasi-nilpotence condition. Affine λ=1 equations alone do not identify the global sheaf operator. |
| H.0 `rees-parameter` and `rees-specialization`, G3: use a finite bounded locally split ordinary Rees module sheaf, finite locally free graded pieces and natural zero/unit/localized fibres | `DerivedDeRhamCohomology:DD.1/filtered-modules` specifies enhanced derived filtration diagrams; `DD.1/rees-description` specifies the graded derived equivalence, derived t-quotient and localization. The accepted DD package retains that scope. | Export the ordinary finite locally split sheaf specialization, finite local freeness, and natural t=0, t=1 and t-inverted maps with restriction/descent, tensor and quotient coherence. Keep t∇ and its transported operator comparisons in H.0. |

1. A job authorized to edit CR.1 must state the general connection contract,
   retaining the affine and crystalline specializations and their hypotheses.
2. A job authorized to edit DD.1 must state the finite ordinary Rees sheaf
   contract. A connection is not a field of the generic filtered module.
3. A job authorized to edit H.0 must point its consumer prerequisites at those
   exact exports, with the generality and comparison maps above.
4. Resume the remaining package audit below. G1/G3 repairs alone do not close
   all nine layers.

No new roadmap, source route or supplier ownership is proposed here. These
repairs implement existing consumer requests.

## Minimum owner exports needed to resume

These are precise requirements for the authorized owner repairs, not new
targets added to this package. The absence of an elaborated supplier signature
alone is not the blocker: the supplier's mathematical specification also lacks
these exports.

**CR.1:** for a supplied commutative ring sheaf O and relative exterior
differential calculus, export ordinary connections on O-module sheaves. The
operator is a morphism of underlying abelian sheaves
D:E→E tensor_O Ω¹ satisfying D(fs)=fD(s)+s tensor df on local sections.
Its extension to E tensor Ωⁱ satisfies
D(s tensor ω)=D(s) wedge ω+s tensor dω. Curvature is the composite in
degrees zero and one; integrability means it vanishes. Horizontal O-linear
maps satisfy D_F∘f=(f tensor 1)∘D_E, with the resulting category and
restriction comparisons. The finite locally free full subcategory must have
the same operators and exterior extensions as the H.0 λ=1 carrier. Preserve
the existing affine and crystalline versions as natural specializations;
quasi-nilpotence belongs only to the crystal equivalence's hypotheses.
An equivalence of abstract categories without these operator comparisons
does not meet `ordinary-fiber`.

**DD.1:** for a finite bounded decreasing subbundle filtration F on a finite
locally free O-module sheaf E, with finite locally free graded quotients and
local splittings, export the ordinary sheaf
Rees_F(E)=Σ_p FᵖE·t⁻ᵖ inside E tensor_O O[t,t⁻¹], viewed as an O[t]-module.
The polynomial and Laurent sheaf carriers and this embedding must be explicit.
Local split charts identify it with ⊕_p G_p[t]·t⁻ᵖ; the constructed object
and comparison maps are independent of a chosen splitting. Export natural
isomorphisms Rees/(t)≃⊕_p grᵖ_F E, Rees/(t−1)≃E, and
Rees[t⁻¹]≃E tensor_O O[t,t⁻¹]. Normalize the zero-fibre map by sending the
class of e·t⁻ᵖ to the class of e in grᵖ, and the unit-fibre map by sending
e·t⁻ᵖ to e. Require restriction and filtered-map naturality, local freeness,
and compatibility with the convolution filtration on tensor products and
the stated quotient tensor comparisons. This ordinary finite specialization
must be connected to the existing derived Rees description, rather than
replacing it.

The DD.1 export carries no connection. H.0 constructs t∇ from Griffiths
transversality and proves that the three imported comparison maps intertwine
its operators, keeping dt=0. This separates the generic filtered algebra from
the Hodge operation and gives an exact resume test: identify supplier nodes
with the preceding contracts, then update the H.0 prerequisites and requests
in an authorized consumer repair before resuming the package audit.

## Source and current upstream checks

Read **AlgebraicVectorBundles** and **DifferentialGeometry** READMEs in full,
with their relevant suggested signatures, in the read-only current upstream
checkout at `0a56d1b5303c26887a4042db834f46d9079ac593`. Current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake command ran in either tree.
Read the reviewed HodgeStructures L0–L3 library audit before the supplier check.

- AlgebraicVectorBundles L0A–L0C owns scheme module tensor, finite locally free
  dual, exterior, determinant and pullback comparisons. Neither missing
  general differential-site/filtered Rees contract is specified there.
- DifferentialGeometry's `CurvatureForm` is a smooth real manifold/bundle
  carrier. Its actual hypotheses do not supply arbitrary ringed-site connections.
- Read current native `TauCeti.SheafOfModules.tensorProduct`, `tensorProduct_val`
  and `tensorProductIso` in
  `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Basic.lean`.
  Their actual target is sheafification of the presheaf tensor; use this
  implementation. Tensoring global sections does not compute sheaf tensor sections.
- Read current `reesAlgebra.grade` and `mem_grade_iff` in
  `TauCeti/RingTheory/ReesAlgebra/Grading.lean`: degree n consists of monomials
  with coefficients in Iⁿ. This ideal-power Rees algebra does not supply the
  filtered module-sheaf contract.
- A name screen of the current upstream READMEs and suggested files for Rees,
  filtered-sheaf and integrable/parameter-connection interfaces found only
  Artin–Rees and ideal-blowup Rees references; neither supplies G1/G3. Read the
  actual `CurvatureForm` signature and the native tensor/Rees statements above.
  A current-library name screen for filtered-module and parameter/integrable
  connection carriers found no replacement. These screens are not an exhaustive
  library audit.

Read [Stacks §60.15, Lemma 60.15.1](https://stacks.math.columbia.edu/tag/07J5),
including its extension and functoriality argument. Its crystalline-site
hypotheses are those of Situation 60.7.5; the source does not remove G1.

Read Bhargav Bhatt, [*Prismatic F-gauges*, MAT549 Fall 2022](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf),
§2.2.1, Proposition 2.2.6 and inverse, printed p.16, and Remarks
2.2.7–2.2.8, printed pp.16–17. Proposition 2.2.6 supplies the derived Rees
equivalence. Remark 2.2.8 identifies vector bundles over the affine quotient
with genuinely finite filtrations of finite-projective modules whose graded
pieces are finite projective. This is source support for an owner repair,
not an already exported general-site sheaf comparison. The text is not titled
*Absolute prismatic cohomology*. Public PDF read on 2026-10-10, SHA-256
`a9f526ced2fc5e08e849a77ad2818689b4254129698695c9cbfbab95927cca6a`.
No source passage or restricted file is reproduced.

## Acceptance witnesses for owner repair

- **Ordinary connection:** on O=Q[x], E=O, D=d has D(x)=dx and D²=0.
  Multiplication by x is not horizontal: D(x·1)=dx, whereas xD(1)=0.
  Preserve additive, non-O-linear operators, and compare restriction/gluing.
- **Nonzero Rees zero fibre:** E has basis e₁,e₂, Fᵖ=E for p≤0,
  F¹=Oe₁ and Fᵖ=0 for p≥2. Let ∇e₁=e₂dx, ∇e₂=0. In the Rees basis
  u₁=t⁻¹e₁, u₂=e₂ and relative dt=0, D=t∇ has D(u₁)=u₂dx,
  D(u₂)=0, D(xu₁)=(xu₂+tu₁)dx. The unit fibre recovers ∇; the zero
  fibre has a nonzero Higgs field; localization recovers E[t,t⁻¹] with t∇.
  Retain rank-zero and finite one-step tests. A nonzero constant filtration
  on all integer indices is not bounded.
- **Change of splitting:** set e₁′=e₁, e₂′=e₂+xe₁, hence the Rees
  basis matrix is B=((1,xt),(0,1)). For A=E21 the transported matrix is
  B⁻¹AB+tB⁻¹δ(B)=((−xt,t²(1−x²)),(1,xt)). Its zero fibre is E21,
  its unit fibre is ((−x,1−x²),(1,x)); at x=0,t=1 the upper-right
  coefficient is 1, whereas pure conjugation gives 0. Keep the derivative
  term in actual transition and restriction comparisons.

## Preserved work and remaining audit

The inherited Lean file contains 693 examples (681 original, seven split-chart,
five change-of-frame). The twelve chart checks and the directly defined affine
operator were supplied in earlier sessions; this run does not claim authorship.
The operator uses `LinearMap.pi`, `LinearMap.proj`, `Derivation.toLinearMap`
and `Matrix.mulVecLin.restrictScalars`; its evaluation, scalar Leibniz and
zero-matrix laws are proved. Its one-direction chart uses `MvPolynomial.pderiv 0`.
The predecessor's axiom diagnostic reported no `sorryAx` in the operator,
these three laws and twelve chart checks; that diagnostic was not rerun here.
These affine checks do not construct the global Rees sheaf or descent data.

Preserve native imports, the Hodge namespace, H.5 scheme-theoretic fibres and
finite-projective lattice signatures, Betti scalar-automorphism checks and
H.7's proved negative controls. Do not restore the twenty removed H.7 results
on arbitrary receiving sets, maps, matrices or languages: geometric hypotheses
must occur in signatures. `ShimuraData:D3/variation` specifies compatible
real/rational variation data; an incomplete prototype alone does not show an
owner gap. Its `IntegralVariationFibers` prototype lacks scalar-extension
agreement and lattice naturality and cannot replace H.7's global integral datum.

Other H.0 continuation requirements remain:

- G2: native underived sheaf tensor powers, dual/exterior operations, local
  generation, restriction-compatible equality detection and descent.
- G4: global/specified-line determinant and universal wedge transport, using
  `ColemanPowerSeries:L1/derivation-determinant-unit` for Jacobi.
- G5: unbounded period lattices, actual graded-base/Tate identification,
  semilinear Galois/exterior compatibility; no reverse dependency on the
  p-adic Simpson correspondence, bounded substitute or trivial Tate character.
- G6: a global nilpotence exponent requires uniform cover bounds. Infinite
  covers/unbounded ranks do not imply one, and kernel subsheaves need not be subbundles.
- G7: coherent spectral image algebra and coefficient-equivariant adapter
  need source-specific hypotheses. Generic sheaf operations stay at E1;
  p-adic spectral/Picard and twisting correspondence stay at their consumer.

The full target-fidelity/adversarial audit still remains, especially the 569
parent nodes and seven H.0 continuation nodes. Finish definition/API/Checks
grouping and worked examples in the README, declaration docstrings and precise
omission lists, and current-library/bottom-up dependency checks for every target.
The README is 193329 bytes, below the 200 KB limit. This checkpoint establishes
the two blockers; it does not assert that all other targets have been audited.

## Input inventory and validation

All ten inputs are `complete` and review `accepted`; none has a `closed`
coverage entry. The historical parent and continuation counts overlap.

| Input | Nodes | Gaps | Requests | Coverage |
| --- | ---: | ---: | ---: | --- |
| Parent | 569 | 13 | 5 | H.0 partial; H.1–H.8 not_read |
| H.0 continuation | 7 | 7 | 4 | planned |
| H.1 | 36 | 11 | 18 | planned |
| H.2 | 33 | 19 | 14 | planned |
| H.3 | 43 | 5 | 23 | planned |
| H.4 | 30 | 6 | 3 | planned |
| H.5 | 73 | 13 | 16 | planned |
| H.6 | 32 | 6 | 7 | planned |
| H.7 | 31 | 7 | 12 | planned |
| H.8 | 31 | 5 | 11 | planned |

Fresh validation in session `codex-VdQsGE`:

- All ten `python3 scripts/check_blueprint.py <packet>` runs exited 0,
  each with zero errors and zero warnings. This checks structural validity,
  not closure of the recorded mathematical gaps.
- `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`
  exited 0: zero errors, 1619 warnings, all `declaration uses sorry`,
  zero other warnings. Available memory was 109 GB before compilation. The
  managed shared build uses Tau Ceti f790474 / Mathlib 082e2d3.
  Elaboration does not prove the admitted results. The file is unchanged.
- Scoped intake `check-files`: one handoff file, zero problems.
  `git diff --check` passed. Only this handoff changed; no input packet,
  README, Lean file or metadata changed. No Lean process remains running.

Input/package receipts (relative to `research/blueprint`):

| File | SHA-256 |
| --- | --- |
| packets/HodgeStructuresPartII--H.0.json | `4ae94aa821ea9fb8fde4a53659cfe1cef4aba1b8ce077b66d3482ee59694ac7e` |
| packets/CrystallineCohomology--CR.0.json | `90d720b682eccf1d80061213921ff7041dc895175937de5491f163e045c668fb` |
| packets/DerivedDeRhamCohomology.json | `146a591348fccd8af4605020dd796a905c508ca12ebe52753302c6b08517673b` |
| packages/HodgeStructuresPartII/README.md | `c1ddb07bbfba996f3f2730e94efe744e1b2e6bf59cea44dfcb626589cff0337d` |
| packages/HodgeStructuresPartII/Suggested.lean | `16585ed474c73db692203bb77137f4c9c403be0cc5e64b115ae3f95580ce4f5f` |

The H.0 and DD packet receipts and both package receipts above match the
predecessor's. The crystalline packet changed with the accepted review; its
connection node did not. The current upstream checkout does not replace
either missing contract. The inspected DD README has SHA-256
`f6964c2bbec2b91f18076cb0e2e7760095bddf3b981397abc2c8e9a761a55ec5`.
These fresh receipts supersede the predecessor's validation date. Everything needed
to resume is in the repository and this handoff; no scratch file is required.
