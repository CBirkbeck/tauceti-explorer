# REV-RT-AUDIT-05 — independent verification

Codex / codex-7e92bd · 2026-09-24 · explorer `ec8fd3cee1dfad8cd48ac687cce1788750b9cf57`

**All 40 findings are confirmed**, with the qualifications below and in each JSON reason:
3 high, 9 medium and 28 low. Confirmation approves the identified correction, not every
phrase or optional construction in the proposed fix. No audit, roadmap or library file
is changed by this review. The normal fix job should use these qualified reasons.

The largest corrections go in both directions. The pinned library already proves L5’s
Jordan-domain closure homeomorphism. Conversely, the full contour winding propositions
and the arbitrary-primitive FTC along a curve with corners are not supplied at their
stated generality. The binary-quaternion equivalence has a short construction through
Mathlib’s Clifford API, so its absence claim must be replaced by partial support.

The ledger identifies AUDIT-05’s completed author as `claude4/1` (earlier checkpoints
`claude/2` and `claude6/2`), REV-AUDIT-05 as `claude2/1`, and the red-team report identifies
Claude Code / `cc-2aeb03`. None is this session. Bot confirmation 5806276270 on issue #1559
accepted claim 5806274875; I reread the complete issue after that confirmation.

I read all 40 findings, the complete red-team report and original review, the affected
audit entries and roadmap passages, and the relevant pinned declaration statements,
ambient hypotheses and implementation passages. Targeted contrary searches included
both whole Lean trees with ignored files included. This is verification of those findings,
not a fresh semantic review of all 695 audit citations. All 49 audit layers match the
coverage mirror on target text, library status, note, layer verdict and duplicate entries;
the mirror omits per-target declaration arrays. Regenerate it through normal audit intake.

The JSON gives the public full-pin source URLs for each finding and detailed correction
instructions. The table is the complete finding inventory; all verdicts are confirmed.

| Finding | Severity | Verified correction |
| --- | --- | --- |
| RT-AUDIT-05/1 | medium | Credit Mathlib partition plus Tau Ceti’s extended cycle-type API. |
| RT-AUDIT-05/2 | medium | Monic same-degree lifts and finite-family CRT are reusable; coefficientwise assembly remains. |
| RT-AUDIT-05/3 | low | Finite fields, primitive elements and minimal polynomials supply the existence route. |
| RT-AUDIT-05/4 | low | Use restrict_surjective with splitting, not the divisibility-only restriction. |
| RT-AUDIT-05/5 | low | The sign/transport bundle remains partial despite the discriminant criterion. |
| RT-AUDIT-05/6 | low | Distinct polynomial factors, not distinct factor degrees: equal degrees can repeat. |
| RT-AUDIT-05/7 | low | Orbit-card degree is proved; subgroup index and ResolventSpec naturality still need bridges. |
| RT-AUDIT-05/8 | low | Eight reference rows already have named subgroup identifications; preserve zero-based indices. |
| RT-AUDIT-05/9 | low | Record the missing D8 wreath example and use an actual multiplicative cyclic-group carrier. |
| RT-AUDIT-05/10 | low | Include the Gauss-lemma step from integer to rational irreducibility. |
| RT-AUDIT-05/11 | low | Credit normal-closure uniqueness and automorphism transport as supporting inputs. |
| RT-AUDIT-05/12 | low | Correct Jordan attribution and the claim that Layer 9 has no declarations. |
| RT-AUDIT-05/13 | high | Binary quaternion equivalence is accessible through Clifford equivalences; mark partial. |
| RT-AUDIT-05/14 | medium | Add the built square-subgroup/power-range dictionary, keeping the Kummer bridge separate. |
| RT-AUDIT-05/15 | medium | Openness/closedness does not establish finite index of local power subgroups. |
| RT-AUDIT-05/16 | low | Distinguish multiplicative valuation one from additive valuation one; avoid private adapters. |
| RT-AUDIT-05/17 | low | Cite the direct universality theorem for isotropic nondegenerate forms. |
| RT-AUDIT-05/18 | low | Credit radical and polarized isotropic-subspace APIs without claiming general Witt index. |
| RT-AUDIT-05/19 | low | Use basis discr and discr_comp, with invertible two, for the determinant bridge. |
| RT-AUDIT-05/20 | low | Reuse Grothendieck additive completion; Witt ring laws and quotient remain. |
| RT-AUDIT-05/21 | low | Credit starAe and equivEven, retaining central simplicity and odd-rank normalization work. |
| RT-AUDIT-05/22 | low | Credit finite Hilbert 90 and finite-quotient cohomology; retain carrier comparisons. |
| RT-AUDIT-05/23 | low | Correct the centrality owner from Layer 2 to Layer 5. |
| RT-AUDIT-05/24 | high | Mark the unrestricted winding propositions partial and Layer 1 partly built. |
| RT-AUDIT-05/25 | medium | Mark general piecewise-C1 primitive FTC partial; retain integrability in its proposed wrapper. |
| RT-AUDIT-05/26 | medium | Correct the blanket completed-contour summary using findings 24 and 25. |
| RT-AUDIT-05/27 | low | State clockwise fdBoundary’s negative winding values and retain supplier/consumer ownership. |
| RT-AUDIT-05/28 | medium | Describe direct Chebyshev measure-basis assembly and the B2 envelope/isometry comparison. |
| RT-AUDIT-05/29 | low | Correct oscillator normalization and Fourier-diagonalization citation fit. |
| RT-AUDIT-05/30 | low | Distinguish private Hermite helper constructions from public API. |
| RT-AUDIT-05/31 | low | Add compact-support/RCLike completeness and the actually consumed moment-determinacy citation. |
| RT-AUDIT-05/32 | low | Add shifted Legendre as algebraic related input to the deferred Jacobi family. |
| RT-AUDIT-05/33 | low | Qualify the orthogonal-basis summary by library ownership, scope and assembly route. |
| RT-AUDIT-05/34 | high | Carathéodory closure homeomorphism is already public and proved at the pin. |
| RT-AUDIT-05/35 | medium | Two Mathlib RMT steps are module-private prior work, not importable API. |
| RT-AUDIT-05/36 | medium | Arbitrary-point derivative rigidity remains unassembled; maintain target/layer consistency. |
| RT-AUDIT-05/37 | low | Correct argument-principle generality, open-mapping input and contour-layer attribution. |
| RT-AUDIT-05/38 | low | Distinguish continuous branches from the consumed holomorphic logarithm/root route. |
| RT-AUDIT-05/39 | low | Credit Mathlib Morera, conjugate differentiation and countable-exception removability. |
| RT-AUDIT-05/40 | low | Correct the approximate count and retain global injectivity as a Jordan-boundary hypothesis. |

Several qualifications are essential for the fixer:

- **6:** Squarefree normalized factors can have repeated degrees. Never assert that the
  degree multiset is nodup. **8–9:** distinguish subgroup index 2 from label 4T2, and use
  `Multiplicative (ZMod 2)` where a multiplicative group is required.
- **13:** use partial as the conservative classification until the coordinate-isometry
  composition is named. This review did not compile the proposed Lean wrapper. The
  Clifford equivalence does not establish the whole Brauer/Hasse-invariant package.
- **15–16:** conditional openness from a unit subgroup index is not a proof of finite
  index. `normalizedValuation = 1` is the unit equation; a uniformizer has value
  `Multiplicative.ofAdd 1`. Private local comparisons are not callable adapters.
- **18, 21–22:** retain separation-of-points/finite-dimensionality hypotheses on
  polarization, central simplicity for the Brauer order-dividing-two theorem, the
  special `Q ⊥ <-1>` form of `equivEven`, and the finite-level/continuous-cohomology
  carrier comparisons. A degree-two cocone and descent are not a colimit proof. The
  twisted monoid algebra uses a trivial coefficient action, not a semilinear Galois
  action, so it does not furnish the H²–Brauer comparison.
- **24–26:** the on-curve results exclude a singularity at the join. Existing
  `basepointAngle` and `ConditionB` do not remove that restriction. An arbitrary-
  primitive countable-exception FTC still needs the composed primitive continuous
  and its derivative integrand interval-integrable. Layer 4’s expressly restricted
  scope does not exclude the distinct gaps in Layers 1 and 2.
- **27–33:** negative clockwise winding values are compatible with positive elliptic
  weights after orientation bookkeeping. The Chebyshev basis exists, and the envelope
  basis uses B2; only the claim that the measure-side construction literally specializes
  B2 is wrong. Respect the five-citation limit when adding the missing B1 support.
- **34–36:** correcting L5 does not resolve L6 or the separate infinitesimal-rigidity
  target. Contrary to the proposed fix, a retained in-scope partial target requires
  L2 to be partly built under the audit rules. Alternatively, explicitly separate
  the extra derivative-rigidity demand from the narrower L2 stage contract before
  retaining built. The RMT itself uses the strict Schwarz lemma for a noninjective map.
- **39–40:** countable-exception removability retains continuity and positive-radius
  disc hypotheses. Schwarz–Christoffel has local interval and individual-edge
  injectivity results, beyond the two examples listed by the red team; the missing
  assertion is global compactified-boundary injectivity.

The key analytic source check was
[Hungerbühler–Wasem, arXiv:1808.00997v2](https://arxiv.org/pdf/1808.00997v2),
Propositions 2.2 and 2.3 and their proofs, printed pages 7–10, read 24 September 2026.
Their statements have no basepoint-off-singularity condition. The additional conditions
in the pinned Lean interfaces limit their coverage; no source-paper error is alleged.

For the positive L5 correction, I checked the actual
[Jordan definitions](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/JordanCurve/Basic.lean),
[Approach.lean statements and assembly](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/Conformal/Jordan/Approach.lean),
and [inverse-cluster injectivity interface](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/Conformal/Inverse/BoundaryCluster.lean).
The closure theorem assumes an open, simply connected bounded domain with Jordan frontier,
and supplies both the holomorphic bijection inside and the homeomorphism on closures.
There is no unproved boundary-injectivity hypothesis. Prime ends remain expressly out of scope.

Source provenance was checked mechanically: all **9,055 Mathlib** and **5,489 Tau Ceti**
tracked Lean files match their Git blobs at the full pins listed in the JSON. This
establishes the source snapshot, not that I read every declaration. The public origins
are `leanprover-community/mathlib4` and `TauCetiProject/TauCeti` respectively.

A lexical scan of the Tau Ceti import closures found no uncommented `sorry`, `admit` or
`axiom` tokens in the 129 modules reachable from Jordan/Approach or the 66 reachable from
RiemannMapping/Existence. The latter closure contains no SchwarzPick module; Koebe’s
strict-Schwarz call was also read directly. These are source diagnostics, not kernel
checks or transitive Mathlib axiom audits.

Conformal has **107 Lean files**. Applying the repository header regex to raw lines yields
**1,083 matches**; its comment-aware scanner yields **1,065**. Either justifies “about
1,100”, but neither is an elaborated declaration count. The finding’s exact anonymous-
instance and theorem subtotals are not adopted.

**No Lean file was changed or compiled.** The pinned build artifacts are unavailable;
I do not inherit the red team’s reported compilation or import experiments as my own.

**PASS:** red-team checker; exact coverage of all 40 supplied finding IDs with no extras; two-file intake with zero problems. All 23 captured input blobs and both output guards matched fresh main `4cd736bbf09c8a9a7ee22fc77f6e6598c84e6b95`. The bot-confirmed claim and issue instructions were unchanged before publication.
