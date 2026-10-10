# BP-ArithmeticStatistics--ST.1 — submission handoff

Issue [#6353](https://github.com/CBirkbeck/tauceti-explorer/issues/6353). Worker: Codex, session `codex-22qwKl`, branch `codex-22qwKl-arithmetic-orbits`. The bot confirmed the claim against comment [6100939790](https://github.com/CBirkbeck/tauceti-explorer/issues/6353#issuecomment-6100939790). This run takes only this job.

## Result and coverage

This is a complete target-level planning pass under PROTOCOL §0, ready for independent review. The packet has `status: complete`; its only stage, `ArithmeticStatistics:ST.1`, is `planned`, with precise remaining obligations. The stage is not closed and nothing is claimed formalized. This submission is not a checkpoint.

Deliverables:

- [Packet](../packets/ArithmeticStatistics--ST.1.json): 33 new, additive targets, comprising 7 constructions, 7 definitions, 15 theorems and 4 comparisons; 42 API items, 42 unit tests and 20 pinned baseline declarations.
- [Reader](../readmes/ArithmeticStatistics--ST.1.md): approximately 9,890 words, with conventions, exact hypotheses, construction or proof sketches, prerequisites, consumer-derived APIs, examples and input obligations.
- [Suggested Lean file](../suggested/ArithmeticStatistics--ST.1.lean): native coordinate, algebra, lattice and norm interfaces for all 14 definition/construction nodes, their 42 API names and 42 named examples. Concrete theorem signatures include integral minor realization and fibre counting, Q-squared discriminant divisibility, odd weak-lift existence and orbit separation. The omission register identifies the other correspondence signatures whose carrier interfaces are absent.

The accepted parent packet `ArithmeticStatistics.json`, its reader and suggested file are unchanged. Its ST.1 correspondences, maximality criteria, binary quartic embedding, stabilizer and two-descent statements remain imports. Every new identifier uses the distinct `ArithmeticStatistics:ST.1/refinement-` prefix. Quartic invariant and height normalization stays in ST.0; asymptotic counting, density computation and sieve estimates stay in ST.2–ST.4.

No new planets are added. The six existing ST.1 planets are retained: Delone–Faddeev correspondence, Davenport–Heilbronn maximality criterion, parametrization of quartic rings, parametrization of quintic rings, binary quartic parametrization of 2-Selmer elements, and embedding into pairs of ternary quadratic forms. There is no restructuring or ownership move.

## Mathematical scope and conventions

The quartic refinement supplies the coefficient minors and their Plücker relation, the fixed-coefficient integral SL₂ fibres, the finite invariant-order index at nonzero discriminant, the rational étale cubic resolvent, and the monogenized-resolvent inverse for binary quartics. The fibre count retains all six coefficient labels and excludes zero minors. It does not quotient by automorphisms of the resulting quartic ring.

The quintic refinement specifies normalized integral multiplication on the coordinate additive group, the rank-six multiplication, the based fundamental-map datum, its nondegenerate trace-dual comparison, integral realization and minimal integral models. The sextic discriminant is `(16 Disc R)³`, including the factor16 before cubing. Homogeneity is degree5/10 for the nonconstant/constant quintic coefficients and degree12/24 for their sextic counterparts. The minimality statement uses the minimum absolute integral discriminant in the full rational orbit.

The symmetric-pencil refinement separates the signed determinant invariant from the parent ternary polynomial-coefficient convention. It defines the universal binary discriminant, bilinear common isotropy, the nonmonic order and fractional ideals, integral oriented triples and field norm pairs. The norm equation has exponent `n−3`; the scalar orientation is retained. Central quotient schemes are distinguished from quotients of point groups. The ideal dictionary uses `n≥3`; its missing degree2 negative-index convention is explicit.

The geometric statements distinguish existence, solubility and local solubility. The eight equivalent existence conditions and their common obstruction are stated. Fano planes retain vector and projective dimensions separately. The locally soluble cover set is a torsor under Sel₂ when nonempty, rather than a canonically identified group. Integral existence uses BGW Proposition34, and integral uniqueness is restricted to the odd good primes of Proposition35.

The weak-lift refinement specifies the strong/weak perturbation predicates, signed-minor Q, its relative character, Q² divisibility and integral marked absolute Q. Nonempty weak loci use odd squarefree moduli. Rational completions are not used to define integral marked Q. The even lift retains its flag and coprime constant-term domain; the universal q construction remains an input obligation. The genus-one comparison retains the full linear-group theta extension and the separate invariant-fixed stabilizer from the parent.

## Sources and limits of reading

All seven sources used in this pass are freely accessible. The packet records their public URLs, SHA-256 receipts, access date and the sections read. No private reference book was used, and no PDF or source passage is included in the repository.

- Bhargava, *Higher composition laws III*, Annals 159 (2004), pp.1329–1360: §2.3, §§3.6–3.9 and the relevant §§4.1–4.2 maximality cases. The invariant fibres and Corollary18 are used directly from this source.
- Bhargava, *Higher composition laws IV*, Annals 167 (2008), pp.53–94: multiplication and trace-dual constructions in §§4–7, Cayley maps in §8, Definitions10–11 in §9, integral realization and minimal-model proofs in §§10–11, and the relevant §12 maximality statement. The omitted nonétale rational case and the universal prime-reduction calculation are recorded as gaps.
- Wood, *Quartic rings associated to binary quartic forms*, arXiv:1007.5501v2 (31 March 2011): Theorem1.1 and §§2–5, with the relevant geometric comparison and specialization sections. Locators use this 15-page version, not unverified published pagination.
- Bhargava–Gross–Wang, *A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension*, arXiv:1310.7692v2 (24 February 2017): the order/ideal dictionaries, Picard and Fano comparisons, existence and solubility theorems, local/global Selmer arguments and Proposition34–35 constructions/proofs. Locators use this 42-page version.
- Bhargava–Shankar–Wang, *Squarefree values of polynomial discriminants I*, arXiv:1611.09806v3 (31 December 2021): the weak/strong definitions and the algebraic odd/even lift and orthogonal-slice constructions in §§2 and3. The tail estimates are outside this pass.
- The same authors, *Squarefree values of polynomial discriminants II*: author-hosted PDF dated 4 April 2025, especially §§3.1–3.5. Its receipt is distinct from the published receipts in the extraction; this pass does not assert a collation with those editions.
- Bhargava–Ho, *Coregular spaces and genus one curves*, arXiv:1306.4424v1 (19 June 2013), 82 pages: §§4.1–4.4, Theorems4.1,4.5,4.11,4.14 and the stabilizer remarks. Only the relevant degree2–5 field geometry was read; neither all representations in this paper nor a published-edition collation is claimed.

The packet imports the accepted parent and routed-paper convention corrections by their existing identifiers, paraphrased in its convention notes. This includes the quintic constant-coefficient index, quartic resolvent sign and fibre convention, the Wood table correction, the BGW coefficient16 consequence, and BSW II's empty weak prime2 locus and even-basis correction. It does not make fresh source-error verdicts. The routed quartic étale-resolvent need is covered from HCL III itself; a fresh reading or collation of the entire BSTTTZ paper is not claimed.

## Library and ownership checks

The reviewed library audit was read before construction, and ST.1-specific orbit dictionaries were searched in the pinned Tau Ceti sources. The baseline records Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each cited baseline declaration was read in its actual module. Norm and trace are used with finite free hypotheses, and the lattice completion reduction uses native `Submodule.smithNormalForm` over a PID.

Current upstream roadmaps were checked as well as the older atlas snapshot. OrthogonalSpinGroups Layer0 owns the generic orthogonal groups; IntegralLattices owns generic integral lattice theory; PolynomialGaloisGroups Layer4 owns universal resolvent polynomials, rather than integral sextic resolvent rings. The reader imports these owners and the packet records the source-file/catalogue adapters still needed. Near-area upstream style checks included ArithmeticDirichletSeries and Completed/Multiquadratic. The accepted ownership result and links mentioning ST.1 were consulted; no upward-tier dependency or duplicate ownership was introduced. ArithmeticStatistics remains in the tier14 AnalyticNumberTheory bundle.

## Exact follow-up obligations

The packet's six gaps and coverage record are authoritative. Resume with these inputs, rather than repeating this pass:

1. Supply exhaustive nonétale rank-five rational realization, which HCL IV p.84 omits, and check Lemma15's universal two-case prime reduction.
2. Provide rational symmetric-group closure and labelled trace-dual adapters: S₅ rank120 closure, its order20 fixed rank-six algebra, the fundamental-map comparison, and the S₄ finite-Galois-set adapter. Connect the parent quartic content/invariant-order carriers, and specify an extended index for the zero-discriminant boundary.
3. Assign and type generalized nodal Picard/Jacobian, augmented Fano and higher-genus two-cover/Selmer inputs, including the obstruction comparison and local Néron/norm-one-unit comparison. Smooth Picard and genus-one Selmer requests supply only part of these needs.
4. Provide restriction-of-scalars μ₂, central quotient and theta group schemes with descent. Source-qualify degree3–5 integral minimization and local Selmer model dictionaries separately from Bhargava–Ho's field geometry.
5. Construct the even q polynomial on the flag locus with universal denominator cancellation and its API/tests; define the negative-index ideal for the degree2 boundary.
6. Resolve the current OrthogonalSpinGroups catalogue/API adapter and convert native saturated-lattice basis completion to oriented coefficient matrices and isotropic markings. Generic SO, lattice theory and Smith normal form already have owners or baseline declarations.

There are four exact supplier requests: JacobianChallenge LayerD (relative Picard/Jacobian), JacobianChallenge LayerA (line bundles/divisors/degree), EllipticCurves Layer7 (genus-one Selmer), and `GeometryOfNumbersAndQuadraticArithmetic:GN.2` (integral ternary forms with4det=−1 for the Wood inverse). They do not request the generalized or higher-genus interfaces from suppliers that only cover smooth/genus-one cases.

## Verification

`python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticStatistics--ST.1.json` reports 0 errors and 0 warnings. Packet/reader/suggested-name consistency was checked for all 33 targets and all 84 API/test names; every test is an actual named-comment `example` in the suggested file. Small coefficient checks covered signed Q in dimensions3 and5, a sparse quintic coefficient, and weak discriminant divisibility at odd primes.

`lean-check research/blueprint/suggested/ArithmeticStatistics--ST.1.lean` finished with exit0 in the existing pinned build. It reported 81 warnings, all for declarations using `sorry`, and no errors or other warnings. Memory was checked first, and each compilation was sequential. No Lake project, cache download or library build was started. The successful elaboration checks signatures and examples, not their proofs; all implementation statuses remain unchecked.

No scratch file is required to continue. The packet contains source receipts, precise statements, requests and gaps; this note records the verification and edition limits. An independent reviewer should check this additive pass against the accepted parent and the indicated source passages before the open interfaces are assigned or the roadmap is packaged.
