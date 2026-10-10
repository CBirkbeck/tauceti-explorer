# Independent review: ArithmeticStatistics ST.0

Accepted on 2026-10-10 by Codex, session `codex-DFmdwy`, for job
`REV-ArithmeticStatistics--ST.0` (#6310). The author session was different.
The packet records 29 verified and 11 corrected nodes; no nodes were added,
removed or left unverifiable. This accepts a complete **planning pass**. ST.0
remains **planned**, with five gaps and twelve supplier requests; it is not
closed and no declaration is claimed formalized.

The final packet has 40 target-level nodes: 15 constructions, 13 definitions,
nine theorems and three comparisons. Its definitions and constructions have
115 API items and 86 tests; counting the other node kinds gives 120 API items
and 93 tests. All 175 distinct routed targets remain accounted for: 53 developed
here and 122 imported. Every imported node owner resolves. The six planets are
central objects or constructions, and none was changed.

## Corrections made

1. Corrected the full Mathlib commit from the mistyped `082e…171cd…` to
   `082e2d37e8b0463410cdb532e111cd43d5a66174`. This is the commit used by the
   pinned shared build and the declaration sources actually read. Tau Ceti's
   pin remains `f790474821cf4256814db967cb154e7af3d0c369`.
2. Corrected BSW II's publication identifier to **Forum of Mathematics Pi 13
   (2025), e17**, in the source, version and source-issue records. Corrected
   the Hecke locator to **Shende–Tsimerman arXiv v1, Appendix A.4, p.38**;
   p.40 is bibliography. Corrected the Lipnowski–Tsimerman count locators to
   Introduction §0, Theorem 0.1, pp.1–2, and §4.4 Proposition 4.11, p.20.
   Identified the BSTTTZ download as the author preprint dated February 18,
   2017, without implying that the 2020 publication was compared.
3. Recorded and independently confirmed the omitted BSW I odd-prime caveat
   as `ArithmeticStatistics/E8004`. The mathematical nodes already had the
   correct restriction. Added independent verdicts to all three existing
   source issues; all four are confirmed with their version limits retained.
4. Replaced the genus-two example's unlisted zeta-function prerequisite by
   a direct effective-divisor/Riemann–Roch argument. The curve is smooth
   because its sextic and derivative are coprime. Enumeration gives zero
   points over F₃ and fourteen over F₉. There are seven rational effective
   degree-two divisors. The canonical class has four such divisors, and
   every other degree-two class has one, so #Pic²=7−4+1=4. Translation by
   the canonical class gives #J=4. This uses the named Picard and
   Riemann–Roch suppliers and yields an eight-element quotient and masses
   1/2, 3/8, 1/8 at bundle indices 0, 1, 3.
5. Added the existing
   `AbelianSchemesAndArithmeticModuliPartII:F5/finite-field-abelian-lang`
   node directly to the Picard quotient's prerequisites. Clarified the
   JacobianChallenge request: represent the Picard torsor and combine it
   with that Lang theorem and SF.3's finite-field Brauer comparison.
   Extended the ST.1 request to include the monic quotient-order
   interpretation of the Dedekind criterion. Expanded the existing
   finite-class-count gap to include the unpolarized class carrier: F3's
   rational-orbit classification alone does not prove its finiteness.
6. Made finite-place κ-acceptability distinct from the separately supplied
   real root stratum, matching its Lean carrier. Added the finite-modification
   API. Added the actual real Euclidean height on hypersurface classes, its
   squared-cutoff comparison and its Northcott signature. Made q>1 explicit
   for bundle tails and the parity-product candidate.
7. Added continuous-surjection automorphism postcomposition, evaluation and
   kernel APIs. The C₄→C₂ noninjectivity test now inhabits
   `ContinuousSurjections` with explicit discrete topologies. Strengthened
   the one-point permutation test to use `HasPermutationType`; strengthened
   the asymmetric Hecke test to reject the reversed Dirac pair. Added a
   restricted unweighted abelian-class count and its whole-family
   compatibility, so its singleton-versus-mass test refers to an actual
   native class rather than the unrelated inequality 1≠1/2.

These are target-level repairs and API refinements, not additional lemma nodes.
All implementation statuses remain `unchecked`. The seven groups of geometric
Lean omissions remain explicit; no opaque proposition substitutes for their
missing supplier types.

## Sources and independent numerical checks

All thirteen public downloads were read at the relevant locators and their
SHA-256 values matched the packet's version records. No restricted book was
used. Imported targets retain their accepted owners; their complete proofs
were not re-reviewed as part of this ST.0 job.

For local checks, evaluate the fixed-degree quadratic, cubic and quartic
integral discriminant polynomials on every residue tuple modulo p², including
leading-zero tuples. Count residues whose discriminant is not zero modulo p².
For the monic quartic check, fix the leading coefficient to one and also count
residues divisible by p but not p². Independent enumeration gave:

| Case | Numerator / denominator | Result |
|---|---:|---:|
| Binary degree 2, p=2 | 32 / 64 | 1/2 |
| Binary degree 3, p=2 | 96 / 256 | 3/8 |
| Binary degree 4, p=3 | 42768 / 59049 | 176/243 |
| Monic degree 4, p=3, valuation exactly 1 | 648 / 6561 | 8/81 |
| Monic degree 4, p=3, squarefree discriminant | 5022 / 6561 | 62/81 |

The t⁴ coefficient of the ABZ §6 generating function agrees with 8/81,
whereas its Theorem 6.8 valuation-one table on printed p.372 does not.
BSW II Appendix A, Propositions A.1–A.2, pp.53–55, independently gives the
same repaired three-stratum binary count; the printed special quartic factor
would give 1600/2187. These confirm E8001 and E8002 in the exact published
copies listed in the packet.

For the pointless curve check, enumerate x and y in F₃ and in
F₉=F₃[u]/(u²+1), and include the infinity equation y²=2. The counts are
0 and 14. The Riemann–Roch calculation above supplies the Jacobian cardinality
without a point-count/zeta theorem. Shende–Tsimerman v1 §4 p.33 omits the
normalizing cardinality in the joint-tail display; the singleton tail in this
example has probability 1/8, confirming E8003 for v1 only. No assertion is made
about the unmatched final Duke version. BSW I v3 §1.1 p.4 has the p=2
counterexample x²+1: one double root modulo 2, but discriminant divisible by 4
for every coefficient perturbation by 2. This confirms E8004 for v3 only.

Primary URLs and exact hashes are retained in `sources` and `sourceVersions`,
including the [ABZ author copy](https://drive.google.com/uc?export=download&id=1lZ2HQrPDEugaMn1J3ERpqDp9g6C-t6Vd),
[BSW II version of record](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf),
[Shende–Tsimerman v1](https://arxiv.org/pdf/1307.8237v1), and
[BSW I v3](https://arxiv.org/pdf/1611.09806v3).

## Baseline, suppliers and duplication

All fifteen baseline entries were independently confirmed by reading their
statements and surrounding API with `git show` at the exact pins. The saved
sources were then compared against those full commits; every file matched.
No citation was removed or replaced. The commit spelling was the only
baseline correction.

| Baseline declarations | Contract checked |
|---|---|
| `TauCeti.AlgebraicGeometry.AbelianVariety` | Native object, categorical isomorphisms and dimension in Basic and Hom/Iso |
| `TauCeti.WreathProduct`, `.map` | Existing semidirect product and base map retaining the top permutation |
| `TauCeti.normLE`, `.mem_normLE`, `.summatory` | Northcott finite carriers, inclusive real cutoffs and finite weighted sums |
| `Fintype.card`, `Set.ncard`, `ZMod` | Finite cardinality conventions; infinite ncard junk value; positive residue moduli |
| `MulAction.orbitRel`, `QuotientGroup.lift` | Existing orbit setoid and quotient universal property, including additive generation |
| `MeasureTheory.Measure.map` | Measurable pushforward; the proposed probability and marginal lemmas assume measurability |
| `Northcott` | Finiteness of every sublevel set |
| `Polynomial.discr` | Affine natDegree convention; it cannot replace the fixed-degree binary invariant |
| `ContinuousMonoidHom` | Homomorphism carrying actual continuity |

The reviewed library audit, accepted parent packet and current library source
were checked for duplication. Current TauCetiRoadmap was read at
`81207c7f16d5abf770f13a7d2bdcdb465c030787`, including the relevant README and
Suggested interfaces for AlgebraicVectorBundles, ArithmeticDirichletSeries,
JacobianChallenge and PolynomialGaloisGroups. Existing vector bundles,
permutation Galois actions, wreath products and summatory carriers are imported.
The needed projective-line splitting specialization is requested from its
geometric owner, and general squareclass equidistribution is not attributed
to the generic Dirichlet-series roadmap.

Cross-roadmap statements were checked in the existing packets or stage
specifications: SF.3's Picard–Brauer and degree-zero comparisons, Part II's
F3 rational orbits and F5 Lang/descent, A2 duality/polarizations, M6 rational
moduli comparisons, AA.2 quotient integration, AN.4 analytic interfaces,
RS.1's reduced multiplier, and IG.4's marked extensions and arithmetic
invariant. IG.4's prime-to unramified group is explicitly insufficient for
Wood's full group. The requests describe extensions that remain necessary,
not assertions that their suppliers already export them.

## Checks and assembly handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticStatistics--ST.0.json --json`
reports zero errors and zero warnings. `git diff --check` passes.
`lean-check` on the suggested file exits successfully at the exact pinned
Mathlib build, with **276 declaration-uses-sorry warnings and no other warnings
or errors**. Memory was checked before each invocation and comfortably exceeded
20 GB. No build, cache update or language server was started.

The reader document is outside this issue's deliverables and was not edited.
Assembly must synchronize the eleven corrected nodes and the source/version
records from this packet, especially the new APIs/tests, Lang prerequisite,
Riemann–Roch example and corrected locators. The existing reader also contains
four U+000C form-feed characters where displayed formulas should have the
literal LaTeX command `\frac`; replace those during synchronization.

The maintainer still needs to decide the existing ST.0 display split. The
parent's six planets and this part's six cannot all appear on one layer.
Either apply the packet's proposed two displayed sub-layers or select at most
six planets across both packets at assembly. This review makes no campaign,
data, layer-ownership or upstream edits. No further reviewer work remains.
