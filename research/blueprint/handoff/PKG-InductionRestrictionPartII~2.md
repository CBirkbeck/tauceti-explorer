# PKG-InductionRestrictionPartII~2 — complete

Refs [#10390](https://github.com/CBirkbeck/tauceti-explorer/issues/10390).
Codex, session `codex-NjO3TM`, 18 October 2026.
Branch: `codex-NjO3TM-induction-restriction-package`.
Claim confirmed by the bot in [comment 6248142609](https://github.com/CBirkbeck/tauceti-explorer/issues/10390#issuecomment-6248142609).

## Deliverable and disposition

The package revision resolves the ownership defect in
[REV-PKG-InductionRestrictionPartII](../reviews/REV-PKG-InductionRestrictionPartII.md):
the 43 targets already owned by InverseGaloisAndArithmeticFundamentalGroups IG.3.4–IG.3.5
are supplier contracts, rather than targets planned a second time. The authoritative supplier
is [TauCetiRoadmap PR #850](https://github.com/TauCetiProject/TauCetiRoadmap/pull/850),
head `164e3b19e90ef83d80c3c51722ad429cedfc7f02`, read in full for those two sections.

- Rewrote the title, Summary, scope, conventions, exact supplier contracts, build guide,
  per-layer descriptions and downstream boundary around the remaining mathematics.
- Removed Layers RS.2 and RS.5 and the overlapping subsections of RS.0, RS.1 and RS.3.
  Kept the layer labels RS.0, RS.1, RS.3, RS.4, RS.6, because consumers cite their layers;
  renumbered their subsections without removed-target stubs.
- Preserved every retained packet target, API item and named Check, including all of RS.4,
  all of RS.6 and all thirty-one Table 2 values. The nineteen abelian rows still follow from
  the exterior-square formula, and the other rows remain explicit certification targets.
- Rewrote `Suggested.lean` to state only the retained targets expressible over pinned carriers,
  with light real-bodied definitions, native homology milestones and discriminating examples.
  No IG definition is redeclared to type its consumers. Their remaining statements, APIs and
  tests stay in the README, with the omitted-carrier targets named in the closing Lean comment.
- `metadata.toml` remains `topic = "math.GR"`. The packet, original reader and suggested file,
  previous reviews and `review.json` are untouched: this is a package revision, not its own
  independent acceptance verdict.

## Complete ownership map

These subsection numbers refer to the package before this revision.

| Removed targets | Imported owner and contract |
| --- | --- |
| RS.1.1–RS.1.3: lift commutator, oriented cycle, homological commutator | IG.3.4, **Commutators of lifts and the class map of a central extension**: `ReducedSchur.liftCommutator`, `commutingCycle`, `homologicalCommutator`, class map and sign/naturality |
| RS.1.5–RS.1.6: relations and reduced multiplier | IG.3.4, **The reduced Schur multiplier**: `ReducedSchur.schurRelations`, `reducedMultiplier` |
| RS.1.7 and RS.1.14: reduced cover and zero composite | IG.3.4, **Reduced Schur covers**: `ReducedSchur.ReducedCover`, its oriented kernel identification and zero homology composite |
| RS.1.8–RS.1.10: centralizer lifting, class bijection, marking | IG.3.4, **Conjugacy classes lift bijectively**: `ReducedSchur.classCompatibleMarking` and the individual-class bijection |
| RS.2.1 | IG.3.4, **Marked central extensions**: `ReducedSchur.MarkedExtension` |
| RS.2.2, RS.2.5–RS.2.7 | IG.3.4, **The universal marked extension**: `ReducedSchur.universalMarked` and its presentation/universal property |
| RS.2.3–RS.2.4 | IG.3.4, **The class degree map**: `ReducedSchur.classSet`, `classDegree`, `degree` |
| RS.2.8–RS.2.15 | IG.3.4, **The marked fibre product and the computation of U(G,c)**: `ReducedSchur.markedFiberProduct`, `universalEquivFiberProduct`, including the marking-preserving comparison |
| RS.2.16 | IG.3.4, **The kernel of the universal marked extension**: `ReducedSchur.universalKernel` |
| RS.3.1–RS.3.2 | IG.3.5, **Powers by units and the permutation of class degrees**: `ReducedSchur.unitPow`, `degreePermutation` |
| RS.3.3–RS.3.4 | IG.3.5, **Central power corrections**: `ReducedSchur.powerCorrection` and its cocycle |
| RS.3.5, RS.5.11 | IG.3.5, **The discrete action of units**: `ReducedSchur.unitAction` and change-of-model compatibility |
| RS.3.8 | IG.3.5, **The cyclotomic twist of a set**: `ReducedSchur.cyclotomicTwist` |
| RS.5.1–RS.5.10 | IG.3.4, **Coprime semidirect products and admissible inertia**: compatible covers, primary/complement comparison, equal-order inertia and compatible reduced quotients |

This is exactly the review's 43-target list. The additional RS.0 changes are:

- Old RS.0.1–RS.0.3 (evaluation, universal coefficients, class map) are IG.3.4's first contract.
  The unused free-abelianization and divisible-coefficient variants have no retained consumer
  after the marked-presentation comparison moves to IG, so they are not separate targets here.
- Old RS.0.5 (Schur-cover comparison) is IG.3.4 **Reduced Schur covers**, with representation-group
  existence supplied by RepresentationTheory/InductionRestriction Layer 7.
- Old RS.0.7's primary/complement splitting is imported from IG.3.4. Its additional
  Hall-coinvariant isomorphism stays here; it supplies RS.6.1.
- Old RS.0.8 (cyclic complement conjugacy) is imported from IG.4's coprime complement theorem;
  it has no retained construction to support after RS.5 moves.
- Positive-degree finiteness remains here beyond IG's degree-two assertion. Current Tau Ceti's
  homological transfer is consumed directly; its construction is not a new target.

## Surviving subsection map

| Old subsection | Revised subsection |
| --- | --- |
| RS.0.4: full five-term exactness and stem consequences | RS.0.1 |
| RS.0.6: positive-degree finite homology and annihilation | RS.0.2 |
| Additional Hall part of RS.0.7 | RS.0.3 |
| RS.1.4: commuting-pair power law | RS.1.1 |
| RS.1.11: local normalization | RS.1.2 |
| RS.1.12: local factors commute | RS.1.3 |
| RS.1.13: exact reduced-cover homology image | RS.1.4 |
| RS.3.6: kernel automorphisms | RS.3.1 |
| RS.3.7: finite-level action | RS.3.2 |
| RS.3.9: bounded degree slice | RS.3.3 |
| RS.3.10: power-fixed lattice | RS.3.4 |
| RS.3.11: degree orbit quotient | RS.3.5 |
| RS.4.1–RS.4.19, RS.6.1–RS.6.10 | Unchanged numbering |

## Mathematical checks and clarifications

| Statement or interface | Instances/argument checked | Result and disposition |
| --- | --- | --- |
| Five-term exactness | Split extensions, C4 to C2, D8 to C2 squared, noncentral S3 to C2; free-presentation kernels R contained in T | Kept the complete exactness target; the tail holds for arbitrary extensions. The proof must build its low-degree argument, not assume an unimplemented spectral sequence or Hopf API. |
| Hall coinvariants | Trivial complement; inversion on C3 squared; failure at C2 times C2 without coprimality | The norm acts on coinvariants by the index; inversion acts trivially on the exterior square. Current Tau Ceti supplies only the other transfer composite, so the norm identity remains part of this proof. |
| Power-law boundary | All 66 triples in S3 for which both entries commute with the third; all commuting pairs and n = 0 through 6 | The three-chain formula and telescoping are correct, including the unnormalized unit boundary. No commutativity between the first two entries is needed. |
| Kernel action and finite level | Noncommuting S3 cover coordinates at the inverse unit; exponent of the reduced cover divides group order squared | Multiplicativity is only asserted on the central kernel. The residues 2 and 11 in the C3 example are now explicitly finite-level residues of profinite units. |
| Degree slice | Empty class set; two coordinates with total 3 and bound 1; total 0 and bound 1 | Integer n and M are allowed in the general definition, matching Lean; counting specializations impose nonnegative bounds. |
| Square-times-torsion | 2,584 cases in 13 finite abelian products, r = 0 through 16 | Power-image membership equals square-times-torsion membership, including r = 0. |
| Threshold and fixed counts | 4,864 cases in the same groups, all odd q from 3 through 65, all b; q = 1 separately | Criterion and zero-or-torsion count hold. Added the q = 1 identity case to README and Lean; the valuation criterion retains q > 1. |
| Filtration and threshold | Odd groups, C8, C4 times C8, mixed odd/even products | Exhaustion and least-threshold definition require finite A. The span definition in Lean is the actual image subspace. |
| Parity and rank | 480 affine-coset cases for binary spaces of dimensions 1 through 5, random fixed-seed class/square columns and nested filtration spaces | Compatibility and obstruction give precisely the translated kernel; rank-nullity and nested histogram differences agree. General linear-algebra statements now match Lean's generality. |
| Weight enumerators | 12,960 coefficient checks, lower bounds 0 through 2 and excess totals 0 through 8 | The shifted weight and denominator (1 minus X squared) to the N give the exact bounded-degree counts. |
| Order-96 model | Enumerated A4, its abelianization cosets, the swap product, all products in the sum kernel and the outside conjugacy orbit | Base kernel order 48, total order 96, 12 outside involutions in one class generating the group. Removed the unsupported guess about its ordinary multiplier and relation-subgroup order; the reduced C2 target is unchanged. |
| Anti-diagonal models and table | Generation from products of outside involutions; odd-order conjugacy by squares; exterior-square formula; all 31 source values | Retained the formula and values. Arithmetic identification of each embedded type stays with ArithmeticStatistics ST.3, as a consumer of the abstract calculations. |

The finite enumerations were verification scripts in disposable scratch, not formal proofs or
new package APIs. Their bounds and results are recorded here so the Checks can be reproduced.
The roadmap still plans the proofs and the finite certificates.

## Sources and library audit

Read the public texts directly, without adding source passages to the repository:

- Wood, *Nonabelian Cohen–Lenstra moments*, [arXiv v2](https://arxiv.org/abs/1702.04644v2):
  section 2.3 p. 8; Definition 3.1 p. 9; Lemmas 3.3–3.4 pp. 10–11; section 4.1 pp. 17–19,
  especially Proposition 4.1, equations (5)–(6) and Remark 4.2; Table 2 p. 34; Appendix opening
  p. 35. The NSF journal download was unavailable this run. Previously reviewed journal page
  numbers remain, and the README now gives an explicit v2 locator crosswalk. No claim of a
  fresh journal-PDF check is made.
- Wood, *An algebraic lifting invariant*, [author copy](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf):
  section 2 and Theorem 2.5 pp. 2–4; section 4 pp. 6–8, especially equation (4) and Remark 4.1.
- Ellenberg–Venkatesh–Westerland, [arXiv v1](https://arxiv.org/abs/1212.0923v1), withdrawn:
  section 7.3 p. 34 and Example 9.3.2 p. 57. The README identifies the withdrawal.
- Liu–Wood–Zureick-Brown, [arXiv v2](https://arxiv.org/abs/1907.05002v2): section 12 pp. 47–48,
  the paragraph before Proposition 12.7 p. 50, Lemma 12.10 p. 53, and proof of Theorem 10.4 p. 54.
  Journal locators retained from the independent review have adjacent preprint locators.
- Löh, *Group Cohomology*, [2019 notes](https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf):
  transfer pp. 63–65, Hochschild–Serre and its action/naturality pp. 123–125, the low-degree
  Hopf argument pp. 129–131, Künneth p. 136, and cyclic homology p. 49. Printed pagination
  differs from PDF pagination by eight pages.

The threshold, binary linear algebra and weight identities are explicitly described as deductions
from the fixed-fiber equation, not as separately numbered theorems of Wood's paper.

Read `data/library-coverage.json`; it has no dedicated audit for this new Part II. Audited the
relevant declarations directly at Mathlib `082e2d3` and Tau Ceti `f790474`: group-extension fields,
native homology cycles/boundaries, H2 quotient, H1 abelianization comparison, cyclic homology,
functoriality, finite abelian structure, elementary-2 quotient and factor-set convention, homomorphism
fibers, finite-vector-space cardinality and rank-nullity. The current read-only roadmaps at
`0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine additions and Completed roadmaps,
and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were searched by mathematical object.
The cohomological five-term sequences in ProfiniteCohomology and LocalGaloisGroups do not already
supply the discrete integral homology sequence retained here. No remaining target was found there.

Current Tau Ceti's `RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean` supplies
`TauCeti.groupHomology.transfer` and `transfer_comp_map_subtype_id`, consumed in RS.0.2–RS.0.3.
Open Mathlib PR searches found no reduced-Schur target; PR #19582 concerns the group-extension/H2
classification already on the supplier side. Public Zulip archive searches yielded no additional
matching interface. These searches do not substitute for the local declaration audit.

## Downstream references needing their owners' edits

Only this job's deliverables were edited. The following old references should move:

- `research/blueprint/readmes/ArithmeticStatistics--ST.0.md` (nonabelian quadratic moment input),
  and `ArithmeticStatistics--ST.3.md` (nonabelian moment, kernel-to-field and G5 supplier text):
  `InductionRestrictionPartII:RS.1/reduced-multiplier` and `.../reduced-cover` become
  IG.3.4 **The reduced Schur multiplier** and **Reduced Schur covers**.
- `research/blueprint/packages/ArithmeticStatisticsPartV/README.md`: Scope and ownership,
  Exact supplier contracts, the nonabelian quadratic moment interface and its kernel-to-field
  application still name RS.1 and its old heading anchor for these two objects. Point them to
  IG.3.4. Its RS.3 cyclotomic action reference becomes IG.3.5; its RS.6.4–RS.6.6 certificate,
  parity algorithm and order-96 references remain valid.
- ArithmeticStatistics ST.3's `RS.4/involution-abelianization`, `RS.6/reduction-certificate` and
  `RS.6/order96-type` retain their owners and subsection numbers. The retained RS.4 and RS.6
  fixed-fiber and finite-calculation consumers also remain valid.
- The historical packet and original package handoff still contain the earlier RS.0–RS.6 ownership
  and numbering. Use the maps above when reconciling them; they are outside this job's edits.

The previous review's upstream note about IG's implicit finite-G torsion hypothesis is avoided at
this boundary by stating finite G explicitly for the universal-kernel contract. No upstream file
was changed. Issue #10389 is a concurrently claimed package-fix job with overlapping deliverables;
its adversarial report was absent from this checkout and it had no open PR at the pre-submission
check. Its independent review disposition is not changed by this revision.

## Validation

- `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`:
  **exit 0; 38 warnings, all declaration-uses-sorry; no errors or other warnings** at the pinned
  Mathlib/Tau Ceti build. Available memory before the final run: 76 GiB.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0, no offenders.
- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`:
  exit 0, zero errors and warnings; unchanged accepted packet has 109 nodes, 124 API items,
  96 unit tests and 30 planets. Its historical gaps were not edited.
- Scripted packet-to-package check: 66 retained nodes, all 47 retained API labels and all 39
  retained test labels present; 43 nodes are imported from IG by the ownership map.
- All 41 subsection references resolve; no RS.2 or RS.5 target references remain. All named
  Lean declarations occur in the README. Every definition has at least three prose Checks.
- Finite mathematical enumeration: all cases in the table above passed.
- `python3 research/blueprint/intake.py check-files` on all four deliverables: zero problems.
- `git diff --check`: clean.

The package revision is complete. Independent package review and the maintainer's downstream
retargeting are the subsequent steps; no second issue was claimed.
