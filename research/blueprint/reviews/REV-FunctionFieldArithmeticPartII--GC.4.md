# Independent review: high-degree Abel–Jacobi descent

**Accepted as a complete target-level planning pass.** GC.4 remains
**planned**, with two gaps and one supplier request. No geometric closure
or implementation is claimed. Reviewer: Codex, session `codex-g3TI1r`, job
`REV-FunctionFieldArithmeticPartII--GC.4`, 18 October 2026. This session did
not write the blueprint under review.

Reviewed: the [packet](../packets/FunctionFieldArithmeticPartII--GC.4.json),
[reader](../readmes/FunctionFieldArithmeticPartII--GC.4.md) and
[suggested signatures](../suggested/FunctionFieldArithmeticPartII--GC.4.lean).

| Inventory | Result |
| --- | --- |
| Nodes | 5: one definition, three constructions, one theorem |
| Node verdicts | 4 verified, 1 corrected |
| Imported parent GC.4 targets | 8, retained under their existing ids |
| Definition/construction API entries | 27: 6, 7, 7, 7 |
| Definition/construction tests | 21: 5, 6, 5, 5 |
| Planets | 4, all central constructions or the end theorem |
| Baseline declarations | 7 confirmed; none removed or replaced |
| Nodes, API entries or tests added/removed | 0 |
| Source findings | No new finding; inherited corrections respected |
| Open work | 2 gaps and 1 precise supplier request |

## Sources and node checks

I read the published author-hosted version of Yun–Zhang,
[*Shtukas and the Taylor expansion of L-functions (II)*](https://math.mit.edu/~zyun/GZW_ramified_published.pdf),
Annals of Mathematics 189 (2019), 393–526, at all node locators:
Definition A.2, p. 515; §A.1.5, p. 517; Lemmas A.7–A.9 and proofs,
pp. 519–521. I also checked the surrounding conventions in Appendix A.1,
pp. 514–517, and the high-degree input to A.2.2/A.10, pp. 521–522.
The PDF hash agrees with the packet. The following are checks of the
proposed mathematics, stated independently of the source.

- **Quadratic coordinates.** The section coordinate is `(u, alpha²)`,
  while the full chart retains `alpha`. It is a polynomial map on native
  function spaces, rather than a linear map or an isomorphism. The five
  API lemmas preserve coefficient change and the weights `(2,1)`.
  Reducedness is necessary for the raw square-zero test. The dual-number
  examples distinguish this condition from a scheme open, and the sign
  example detects loss of the root coordinate.
- **Family fibre presentation.** The bound gives
  `deg L(-R) >= max(2g-1,1)`, so its first cohomology vanishes and the
  evaluation sequence is universally surjective. The ranks are
  `n=d-g+1`, `a=n-rho` and `rho`, with `a>=1`. The coherent inputs are
  [Stacks, Lemma 53.22.1](https://stacks.math.columbia.edu/tag/0E3A)
  and [Lemma 30.22.1 with Remark 30.22.2](https://stacks.math.columbia.edu/tag/07VJ),
  whose statements and proofs I read. A splitting gives the full quadratic
  chart. The excluded closed ideal contains the squared root coordinates;
  its support is the zero section, so its complementary open is punctured
  affine space. This does not identify the closed subscheme with the
  reduced zero section. The change-of-splitting formula has the correct
  minus sign. The degree-two closed-point test correctly counts residue
  degree, and the two nilpotent tests distinguish exclusion from retention.
- **Relative projective quotient.** The scalar action is 2-equivariant
  for the map to the section stack. It therefore defines the quotient map
  `h`, but does not supply a comparison `f h ≅ b q` on the quotient:
  the scalar torsor twists the Picard object. The actual two-fibre is
  still `C_b`. For nonempty `R`, the square-coordinate projective cover
  is finite flat and representable of degree `2^a`; it is branched, not a
  torsor. The cover and its proper relation justify properness, while the
  smooth atlas and stabilizers justify smoothness and the tame DM property
  in odd characteristic. On a weight-one chart every nontrivial intermediate
  sign character ramifies along a coordinate divisor. Pulling a connected
  finite étale cover back to projective space and using this ramification
  leaves only degree one. The empty case uses weight one throughout,
  avoiding artificial inertia. I read both proofs of projective simple
  connectivity in [SGA 1, Exposé XI, Proposition 1.1](https://arxiv.org/pdf/math/0206203v2),
  recomposed p. 219, original p. 285. Its export is precisely the retained
  `GC4-PROJECTIVE-PI1` request, not an available theorem silently assumed.
- **Chart descent line.** I read Appendix A's site conventions, p. 33,
  and Proposition A.0.7/Theorem A.0.8 with proofs, pp. 34–35, in
  [Abramovich–Corti–Vistoli, arXiv:math/0106211v1](https://arxiv.org/pdf/math/0106211v1).
  The locators use the 36-page preprint. A.0.8 applies to the proper tame
  DM map `Q_b -> T` and torsion coefficients. In degree zero, geometric
  simple connectivity identifies the counit on stalks. Smooth-local
  sections then prove lissity; constant stalk rank alone would not do so.
  The argument never needs exact averaging by two in the coefficient
  ring, so it does not inadvertently exclude `ell=2`. Tensor, morphism,
  coefficient and nonflat-base-change comparisons have the required
  normalization. The order-three Frobenius test correctly distinguishes
  geometric constancy from arithmetic triviality.
- **Effective descent.** Smooth surjectivity and geometrically connected
  fibres make pullbacks of connected finite étale covers connected; the
  resulting fundamental-group surjection gives full faithfulness on finite
  local systems. I read the scheme comparison and its pullback convention
  in [Stacks, Lemma 59.65.1 and Remark 59.65.3](https://stacks.math.columbia.edu/tag/0DV4).
  The local adic and stack extensions remain the named adapter gap.
  Unique comparisons glue the chart lines and force the triple cocycle.
  This proves the essential-image claim for arbitrary rank-one input,
  without using the parent end theorem as its own prerequisite. Normalized
  pairs have unique compatible isomorphisms; their underlying sheaves
  retain scalar automorphisms. The empty elliptic example correctly has
  actual fibre `G_m` and quotient `P^0`.

The three PDF hashes independently agree with the packet's SHA-256 fields.
No restricted source was needed. There are no source excerpts to remove.
The packet's empty `sourceIssues` records no new finding. The parent already
records the relevant source corrections: unshifted versus perverse
normalization at A.7, the nonreduced root fibre in §A.1.3, and branch inertia
versus global sign-valued monodromy in A.8. The present targets respect
these distinctions; duplicating those established findings is unnecessary.

## Correction and dependency closure

I clarified the end theorem's third proof step: double and triple overlaps
of a scheme atlas of an Artin stack may be algebraic spaces. The corrected
proof first takes étale scheme refinements, applies the cited scheme-chart
full-faithfulness argument there, and descends the unique comparisons.
The reader's narrative and repeated target proof now say the same thing.
No theorem statement, degree bound or API changed. The suggested Lean file
requires no change because the geometric proof is explicitly a README target.

I checked all eight imported GC.4 targets and their refinements, the direct
GC.0/GC.1/GC.3 suppliers and the accepted GC.5 consumer. The parent
`high-degree-descent` is a result being refined, never a proof input that
creates a cycle. The five-node order supplies coordinates, the family,
the proper quotient, the chart line, then effective gluing. It covers the
GC.4 evaluation, fibre, simple-connectivity and effective-descent targets.
Its `planned` status is appropriate; `closed` would be false.

The actual SF.1 two-fibre-product, quotient, algebraicity and morphism-property
statements and SF.3 curve-degree and Picard-stack statements supply planned
geometric interfaces. Those packets currently need changes; they are neither
accepted prerequisites nor available implementations. IG.0's accepted
adic-local-systems node is scheme-valued. Thus `GC4-LISSE-ADAPTER` correctly
retains finite-cover comparison on tame DM stacks, smooth descent on Artin
stacks, proper degree-zero base change and local adic coefficients. The
root-specific quotient argument replaces the parent's unspecified nonproper
Abel–Jacobi fibration step. `GC4-GEOMETRIC-SIGNATURES` honestly retains the
missing native geometric carriers. No generic theory is hidden in an
arbitrary carrier or an admitted data definition.

## Baseline and ownership

I read every cited declaration and its surrounding assumptions at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

| Module | Confirmed declarations and fit |
| --- | --- |
| `Mathlib/Algebra/Group/Basic.lean` | `mul_pow`: commutative-monoid weighted identity |
| `Mathlib/Algebra/Group/Hom/Defs.lean` | `map_pow`: coefficient homomorphisms preserve powers |
| `Mathlib/Algebra/GroupWithZero/Basic.lean` | `sq_eq_zero_iff`: reducedness is retained |
| `Mathlib/Algebra/DualNumber.lean` | `DualNumber`, `DualNumber.eps_pow_two`: actual square-zero carrier and element |
| `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean` | `TauCeti.AlgebraicGeometry.InvertibleSheaf`: existing line-bundle carrier |
| `TauCeti/AlgebraicGeometry/Cohomology/LongExactSequence.lean` | `TauCeti.AlgebraicGeometry.Scheme.Modules.sections_surjective`: short exact sequence and vanishing first cohomology give global-section surjectivity |

All seven citations fit; none was removed or replaced. The last theorem
does not supply relative base change by itself.

I read the reviewed FA.0/FA.1 entries of `data/library-coverage.json`.
Native divisor degree and function-field Riemann–Roch are existing work;
this packet does not reconstruct them. I inspected current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including its formal-divisor
Abel–Jacobi/linear-system and rigidified Picard interfaces. Those are not
root Picard stacks or stack-lisse descent. I read the complete current
AlgebraicVectorBundles and JacobianChallenge READMEs and relevant suggested
interfaces in TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`,
and searched the current roadmap tree for competing root/weighted/lisse
interfaces. Vector bundles and their section-representing total spaces
belong to AlgebraicVectorBundles; ordinary coherent curve and Picard theory
belongs to JacobianChallenge and its SF.3 extension. None is replanned here.
Open Mathlib PR searches for root stacks and lisse sheaves found no match;
public Zulip searches supplied no usable competing design. These searches
are limited evidence, not proof of absence from all ongoing work.

## Validation and handoff

`python3 scripts/check_blueprint.py` on the corrected packet reports
**zero errors and zero warnings**. The compact suggested file elaborated
successfully with `lean-check` in the existing pinned build after the memory
check. Its only warnings were the ten intended admitted proof declarations:
five coordinate API lemmas and five examples. The one definition has its
real body. This validates syntax and types of that subset, not the geometric
targets or any admitted proof. The 21 planned tests discriminate polynomial
weights, lost root coordinates, nilpotents, empty ramification, inertia,
Picard twisting, coefficient maps and normalization. Four planets fit the
layer limit and identify the family, quotient, descent line and end theorem.

No review work remains. Integration questions for the orchestrator are:

1. Route the generic stack-lisse adapter to the proposed
   EtaleDualityAndPerverseSheaves Part II extension; no provisional stage
   name should become a prerequisite before that owner is registered.
2. Export the all-dimension, all-characteristic scheme projective-space
   simple-connectivity theorem from IG.0, preserving the stated source.
3. Reconcile the parent and GC.5 nonproper-descent wording with this reviewed
   proper-quotient route, then instantiate geometric signatures when the
   actual supplier carriers are ready. All coverage remains planned.

These are explicit implementation/integration leaves, not unresolved
contradictions in the accepted planning pass. No scratch material is needed
to resume them; the packet, reader and this report contain the handoff.
