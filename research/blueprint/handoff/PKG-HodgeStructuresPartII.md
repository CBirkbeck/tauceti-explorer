# PKG-HodgeStructuresPartII — blocked checkpoint

Issue [#7491](https://github.com/CBirkbeck/tauceti-explorer/issues/7491).
Codex (GPT-6), session `codex-8h7RgV`, 10 October 2026.
[Claim confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/7491#issuecomment-6093499985).
No manager-priority issue was available at selection. This was an available
focus package under WORKERS' fallback order. Only this job was claimed.

## Decision and authorized scope

The package remains blocked by two missing supplier statements, rather than
by implementation work or the run's time allowance. This pass independently
checked the current consumer and supplier contracts, current libraries and
upstream roadmaps, and relevant primary sources. The mismatches persist.

Issue #7491 permits only the package README, Suggested.lean, metadata and this
handoff. It prohibits packet edits and directs plan mistakes into this
handoff. PROTOCOL §§3 and 15 require exact
supplier statements and a single owner for general notions; §20 requires the
package to preserve the accepted plan. Completing the missing owner contracts
and reconciling the consumer references therefore requires jobs authorized to
edit those packets. Reconstructing the owners' general objects inside this
package would violate the ownership rule.

This submission consolidates the repeated handoff notes into one current
resumption account. No mathematical deliverable or input packet changed.
The README and Suggested.lean remain byte for byte unchanged. Metadata remains
absent because intake would otherwise classify this unfinished package as
complete. Its final topic is `math.AG`.

## Independently checked supplier mismatches

Read the H.0 parent targets `ordinary-fiber`, `rees-parameter` and
`rees-specialization`; all seven continuation gaps and four requests; the
actual supplier statements and APIs below; and the DD package's complete
“Filtered modules, Rees objects and tensor” subsection.

| Consumer contract | Actual supplier | Missing statement |
| --- | --- | --- |
| H.0 G1, `ordinary-fiber`: identify the parameter-one additive sheaf operator and every exterior extension on a supplied commutative ringed differential site, with curvature, horizontal arrows and restriction/gluing | `CrystallineCohomology:CR.1/integrable-connection`, in `packets/CrystallineCohomology--CR.0.json`, covers affine quotient differential modules and the small crystalline site under explicit PD-base hypotheses. Its review remains `needs_changes`. | The general ringed differential-site carrier and the natural comparison with those specializations. Affine lambda=1 equations do not identify the general sheaf operator. Ordinary connections must not acquire crystalline quasi-nilpotence as a defining condition. |
| H.0 G3, `rees-parameter` and `rees-specialization`: a finite locally split ordinary Rees module sheaf with finite locally free graded pieces and natural zero, unit and localized fibres | `DerivedDeRhamCohomology:DD.1/filtered-modules` defines enhanced derived filtration diagrams; `DD.1/rees-description` supplies the graded derived equivalence, derived t-quotient and localization. The accepted package retains that scope. | Export the ordinary finite locally split sheaf specialization, local freeness and all three natural fibre maps, with restriction/descent and tensor/quotient compatibility. The existing derived equivalence does not state this contract or the natural t=1 sheaf map. |

Acceptance of the H.0 planning pass and of DD.1 does not supply these missing
statements. These are specification gaps, not a demand for a supplier's Lean
implementation before its consumer can be planned.

### Current library and upstream evidence

The read-only upstream roadmap checkout is
`dea8191cc6047d6142a65872ebce6eeeb841a29b`; the current Tau Ceti library is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lake command ran there.
Read AlgebraicVectorBundles and Completed/HodgeStructures READMEs in full,
and the relevant DifferentialGeometry signatures. Read the reviewed library
coverage entries: HodgeStructures covers pure/mixed structures, polarization,
strictness and period-domain points; there is no HodgeStructuresPartII layer.

- AlgebraicVectorBundles L0A–L0C owns scheme module tensor, dual, exterior,
  determinant and pullback operations. It does not state either missing
  general differential-site or finite filtered Rees contract.
- DifferentialGeometry's `CurvatureForm` has real smooth manifold and bundle
  assumptions. It does not replace an arbitrary supplied site's connection.
- Current native `TauCeti.SheafOfModules.tensorProduct`, `tensorProductIso`,
  the unit isomorphisms and `tensorProductComm` are in
  `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Basic.lean`.
  They use sheafification of presheaf tensor and must be reused. Tensoring
  global sections does not calculate sheaf tensor sections.
- Mathlib `reesAlgebra`, in `Mathlib/RingTheory/ReesAlgebra.lean`, uses
  polynomials with degree-n coefficients in I^n. That ideal-power algebra
  does not supply the filtered module-sheaf or its operator comparisons.

A bounded replacement search of current Tau Ceti Geometry,
AlgebraicGeometry, RingTheory and Algebra, and the three roadmap directories
above, found no exact alternate supplier. This is a search receipt, not a
claim to have audited every library declaration.

### Source evidence and its limits

Read [Stacks §60.15, Lemma 60.15.1](https://stacks.math.columbia.edu/tag/07J5):
the connection/crystal construction uses the crystalline-site assumptions
of Situation 60.7.5. It does not remove the general-site owner gap.

Read Bhargav Bhatt, [*Prismatic F-gauges*, MAT549 Fall 2022](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf),
§2.2.1, Proposition 2.2.6 and Remark 2.2.8, pp.16–17; and Remark 2.3.7,
pp.25–26 in the characteristic-zero setting of §2.3. The first gives the
derived Rees equivalence; Remark 2.2.8 gives the finite-projective affine
specialization. Remark 2.3.7 identifies filtered flat bundles satisfying
Griffiths transversality and their associated graded Higgs bundles for a
smooth variety. Thus relevant source mathematics exists. It still needs to
be exported by the owners with the precise sheaf comparisons required here.
The source is not titled *Absolute prismatic cohomology*. No source passage
or restricted file is reproduced in this submission.

## Exact intervention and acceptance witnesses

1. An authorized CR.1 owner job must extend `integrable-connection` to supplied
   commutative ringed differential sites, giving the additive operator, every
   exterior extension, curvature, horizontality and restriction/gluing.
   Preserve its affine and crystalline specializations.
2. An authorized DD.1 owner job must export the finite locally split ordinary
   Rees sheaf specialization, finite local freeness and the natural t=0,
   t=1 and t-inverted maps with descent, tensor and quotient comparisons.
   The operator t∇ and its transported comparisons stay in H.0; no connection
   belongs in DD.1's generic filtered module definition.
3. In a job permitted to edit the H.0 packets, reconcile the references with
   those exact exports. Exercise the witnesses below before resuming the
   remaining package audit. Fixing G1/G3 alone does not close the roadmap.

These witnesses already describe required behaviour; they add no package
scope and authorize no owner edits in this issue.

- **Ordinary connection.** On O=Q[x], E=O with D=d must have D(x)=dx and
  D²=0. Multiplication by x is not horizontal: D(x·1)=dx whereas xD(1)=0.
  The carrier admits additive, non-O-linear operators and checks horizontal
  maps separately. The comparison must commute with restrictions and gluing.
- **Nonzero Rees zero fibre.** Let E have basis e₁,e₂, with F^p=E for p≤0,
  F^1=Oe₁ and F^p=0 for p≥2. Set ∇e₁=e₂ dx and ∇e₂=0. In the Rees basis
  u₁=t^(-1)e₁, u₂=e₂, relative dt=0 gives D=t∇ with D(u₁)=u₂ dx,
  D(u₂)=0 and D(xu₁)=(x u₂+t u₁)dx. The unit fibre recovers ∇, the zero
  fibre has a nonzero Higgs field, and localization recovers E[t,t^(-1)]
  with t∇. Retain rank-zero and finite one-step filtration checks. A nonzero
  all-index constant filtration is not bounded.
- **Change of splitting.** Take e₁′=e₁, e₂′=e₂+xe₁. The new-basis matrix
  is B=((1,xt),(0,1)). With A=E21, the transformed component matrix is
  B⁻¹AB+tB⁻¹δ(B)=((−xt,t²(1−x²)),(1,xt)). Its zero fibre is E21 and its
  unit fibre is ((−x,1−x²),(1,x)). At x=0,t=1 its upper-right entry is 1;
  pure conjugation would give 0. The actual transition and restriction
  comparisons must retain the derivative term, rather than merely identify
  ranks or associated graded objects.

## Remaining mathematical work and preserved implementation

The other H.0 continuation gaps remain explicit:

- G2: transport native underived sheaf tensor powers, dual/exterior operations,
  local generation and equality detection through restriction and descent.
- G4: global and specified-line determinants, universal wedge transport and
  the exact `ColemanPowerSeries:L1/derivation-determinant-unit` Jacobi input.
- G5: unbounded period lattices, actual graded-base/Tate identification and
  semilinear Galois compatibility. Do not invent a bounded filtration or
  trivial Tate character; do not depend backwards on the p-adic Simpson
  correspondence.
- G6: a uniform global nilpotence bound needs a uniform exponent on the cover.
  Infinite covers or unbounded local ranks do not automatically give one;
  kernel subsheaves need not be subbundles.
- G7: the coherent spectral image algebra and coefficient-equivariant adapter
  need source-specific hypotheses. Generic sheaf operations stay at E1;
  p-adic spectral/Picard and twisting correspondence stay at their consumer.

The four requests name CR.1, EnhancedDerivedSheaves:E1,
DerivedDeRhamCohomology:DD.1 and ShimuraData:D3. Their continued visibility is
part of this checkpoint, not a claim that every supplier has the same defect.
In particular, `ShimuraData:D3/variation` states compatible real/rational
variation data; its incomplete suggested carrier alone is not a mathematical
owner gap. Its `IntegralVariationFibers` prototype lacks scalar-extension
agreement and lattice naturality and cannot replace H.7's global integral
variation.

Preserve the namespace, actual native imports, opening of the native Hodge
namespace, H.5 scheme-theoretic fibre and finite-projective lattice signatures,
Betti scalar-automorphism checks and H.7 proved negative controls. Do not
restore the twenty removed H.7 results on arbitrary receiving sets, matrices,
maps or languages: geometric hypotheses must occur in signatures.

The Lean file retains 693 examples: 681 original, seven split-chart examples
and five change-of-frame examples. The seven chart examples use admitted
`Connection.operator_apply`, and the unit-fibre check also uses admitted
`Frame.polynomial_delta`; they do not construct a global Rees sheaf. The five
matrix examples prove polynomial inverse, derivative-corrected transition,
zero/unit specialization and failure of pure conjugation without admissions.
Those checks and the README's worked charts were inherited, not added here.

The full target-fidelity and adversarial mathematics audit remains,
especially the 569 parent H.0 nodes and seven H.0 continuation nodes and their
admitted results. Finish definition/API/Checks grouping and worked examples
throughout the README, Lean declaration docstrings and concise omission lists,
and current-library duplication and bottom-up dependency checks for every
target. This pass checked the demonstrated blockers, not that complete audit.

## Input inventory and fresh verification

All ten input packets have status `complete` and review `accepted`, but no
coverage entry is `closed`. These are accepted planning passes with recorded
requirements. The assembly and continuations carry the later specifications;
the parent's historical coverage is not a fresh audit of those layers.

| Input | Nodes | Gaps | Requests | Coverage |
| --- | ---: | ---: | ---: | --- |
| Parent HodgeStructuresPartII | 569 | 13 | 5 | H.0 partial; H.1–H.8 not_read |
| H.0 continuation | 7 | 7 | 4 | planned |
| H.1 | 36 | 11 | 18 | planned |
| H.2 | 33 | 19 | 14 | planned |
| H.3 | 43 | 5 | 23 | planned |
| H.4 | 30 | 6 | 3 | planned |
| H.5 | 73 | 13 | 16 | planned |
| H.6 | 32 | 6 | 7 | planned |
| H.7 | 31 | 7 | 12 | planned |
| H.8 | 31 | 5 | 11 | planned |

The counts overlap and must not be summed as distinct defects.

Fresh checks in session `codex-8h7RgV`:

- All ten `scripts/check_blueprint.py` validations exited 0 with zero errors
  and zero warnings. Structural success permits the recorded gaps and does
  not certify mathematical closure.
- `lean-check research/blueprint/packages/HodgeStructuresPartII/Suggested.lean`
  exited 0: zero errors, 1623 warnings, all `declaration uses sorry`, and zero
  other warnings. Available memory was 107 GB before compilation. The managed
  shared build is prescribed for Tau Ceti f790474 / Mathlib 082e2d3; Mathlib's
  full revision was confirmed from its manifest and checkout. No Lean process
  remains running. Elaboration does not establish the admitted theorems.
- Scoped intake `check-files` reports one file and zero problems;
  `git diff --check` passes. Only this handoff is changed.

Exact unchanged-file receipts, relative to `research/blueprint`:

| File | Bytes | SHA-256 |
| --- | ---: | --- |
| packets/HodgeStructuresPartII--H.0.json | 139416 | `4ae94aa821ea9fb8fde4a53659cfe1cef4aba1b8ce077b66d3482ee59694ac7e` |
| packets/CrystallineCohomology--CR.0.json | 1400996 | `aa6c94d292f866210a5450fbee909a0c400b5b973638298b5e3a705fe6329f58` |
| packets/DerivedDeRhamCohomology.json | 866381 | `146a591348fccd8af4605020dd796a905c508ca12ebe52753302c6b08517673b` |
| packages/DerivedDeRhamCohomology/README.md | 184952 | `f6964c2bbec2b91f18076cb0e2e7760095bddf3b981397abc2c8e9a761a55ec5` |
| packages/HodgeStructuresPartII/README.md | 192812 | `2deef8c2723cf78701b300f1117c3b587ad6a23542e46ff9cc1818b12f4feb7b` |
| packages/HodgeStructuresPartII/Suggested.lean | 811447 | `937170081712707fdbe7df648d32daaa68927f546b05bb565cbec78dc21e02ea` |

The README is below the 200 KB limit. Everything needed to resume is in these
repository inputs and this handoff. No scratch file is needed by the next
worker; scratch is removed at submission. The next effective step is an
authorized owner-contract and consumer-reference repair, followed by the
remaining package audit.
