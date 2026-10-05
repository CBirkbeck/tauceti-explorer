# REV-DESIGN-AbelianVarietiesIsogenousToNoJacobian

Refs #5049. Independent reviewer: Codex — codex-J6LwjP. Reviewed 2026-10-05.

**Verdict: accepted after corrections, at target level.** This accepts a complete planning pass, not proof closure or formal implementation. All 95 nodes are checked and corrected (every citation annotation was repaired); all 15 baseline citations are confirmed; all 14 source issues have an independent verdict. The 12 stages remain planned, none closed, with 27 explicit proof/interface gaps and 27 supplier requests. Both supplementary gates remain inactive and neither feeds the main arithmetic theorem.

Independence is established by the separate worker claims: [designer codex-rtOQ9t](https://github.com/CBirkbeck/tauceti-explorer/issues/4969#issuecomment-5984654165), [designer bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/4969#issuecomment-5984655325), and [reviewer claim](https://github.com/CBirkbeck/tauceti-explorer/issues/5049#issuecomment-5985629097). This session did not author the design and has not previously reviewed it. The original design handoff also names codex-rtOQ9t.

## Counts and scope

95 nodes: 5 definitions, 13 constructions, 38 theorems, 37 lemmas and 2 comparisons. 85 API items (5 added), 57 tests (3 added), and 36 planets. No node or baseline declaration was added or removed. The 95 implementation statuses remain unchecked. The 43 source-route items all have valid node coverage. All 18 definitions/constructions have at least three substantive tests; examples distinguish determinant domains, signs, characteristics, zero/positive dimension, parameter multiplicity, arithmetic level and local/global closure.

All stage targets are explicit nodes; every node has a prerequisite route into the pins, an actual supplier statement, or a named gap. The stage remaining lists specify the proof interiors or owner interfaces that prevent closure. This is the target-level review requested by the issue; these proof interiors were not split into speculative lemma nodes.

## Sources and read scope

The published Masser–Zannier paper was independently read in full, printed pp.635–674, including references. Every node locator/excerpt was checked against its cited passage. Short excerpts and their mathematical matching notes were replaced throughout; diagnostic and adapter statements are explicitly distinguished from theorems proved in that passage. The manuscript title and every auxiliary theorem used below were checked at the precise public version, rather than relying on the inherited extraction.

- [Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), David Masser and Umberto Zannier; Annals of Mathematics 191 (2020), no. 2, 635–674. SHA-256 `8b76bfac88374180701992e242d88f5d38fbe0b0cdb39c6c40c3c3fbbb874b60`. Read scope: Published pp.635–674, all 40 pages, §§1–5 and references personally read on 2026-10-04. External cited proofs remain separate source obligations.

- [Complex Analytic and Differential Geometry](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), Jean-Pierre Demailly; Author public manuscript, fetched 2026-10-04. SHA-256 `d7c7654a7417e8322e5dcf8fe8ec818b4c1a18cf280b41f2df5a871b776d89a1`. Read scope: Chapter II §8.2, (8.7)–(8.10), printed/PDF pp.118–121: theorem statements and their displayed simultaneous-induction/Chow proofs personally read; auxiliary chapters not audited.

- [A tubular variant of Runge’s method in all dimensions, with applications to integral points on Siegel modular varieties](https://msp.org/ant/2019/13-1/ant-v13-n1-p04-s.pdf), Samuel Le Fourn; Algebra & Number Theory 13 (2019), no.1; target pp.180–182. SHA-256 `12e8666d4a8cdf2b865000021d79582f6a4dc30ecf4c574a9831b26f1e7b82f0`. Read scope: §6, Definition–Proposition 6.3, 6.4(a,b), and 6.5, printed pp.180–182 (PDF pp.23–25) personally read; cited Namikawa/Satake proof interiors not read.

- [Cohomology of symplectic groups and Meyer’s signature theorem](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/paper1.pdf), Dave Benson, Caterina Campagnolo, Andrew Ranicki and Carmen Rovi; Author manuscript dated 9 October 2017. SHA-256 `002d79a072f1accbfe2089853e3eb92f77abc7742f88227618594c916f19cf90`. Read scope: Title/date p.1 and §2 p.3: symplectic matrix and Igusa subgroup definitions personally read. No cohomology theorem or theta transformation proof is imported.



The Annals article page was inspected and a bounded title/author correction search was performed; no correction link was found there. This is not an exhaustive claim that no correction exists. No visual collation of the PDF pages is claimed. Text extraction was checked for the equations used; the reciprocal map in (49) is corroborated by its displayed inverse and is not an additional erratum.

External proofs cited by MZ (including quantitative isogeny estimates, Cadoret/Pink/Serre, absolute Hodge, uniform blocks/functional transcendence, the arithmetic theta model, classical reduction and Schottky identities) were not independently read in full in this review. Their precisely identified proof leaves remain gaps. Demailly II(8.7) and II(8.10), including their displayed proofs on pp.118–121, were read; auxiliary chapters and the original Satake/Namikawa construction invoked by Le Fourn remain outside that read scope.

## Corrections

21 standalone statements and 8 direct prerequisite entries were corrected. In particular, logarithmic and modular-degree arguments now carry their integer/large-N hypotheses; period formulas use a principal polarization and a symplectic integral basis; all four Rosati matrix estimates spell out the full enlarged-domain hypotheses; specialization is restricted to the fixed arithmetic candidate family; and the Weil-pairing implication excludes dimension zero.

The small-isogeny hypersurface step now concerns geometric End=Z points. Principal polarizations are unique there, while the full projective-degree estimate remains an explicit proof obligation, distinct from a subgroup/fibre count. The candidate count first discards all nongeneric points, so this restriction preserves the source union bound. The many-class proof uses the same restriction and a common finite forgetful/regular parameter domain. Thinning subtracts the bad-box count with ε<γ before avoiding finitely many classes.

The CM conclusion now counts distinct moduli points. A parameter-tuple bound requires the explicitly finite forgetful/regular-map domain. An exceptional positive-dimensional fibre is excluded rather than falsely counted with bounded multiplicity. The source’s 2012 GRH/all-genus distinction and the separate quantitative CM-owner obligation are retained.

The theta subgroup is now defined by explicit principal congruence and diagonal divisibility conditions, checked in BCCR17 §2 p.3. Added four subgroup/membership/inclusion/transpose API items and three tests, including the genus-one shear in Γ(e) but outside Γ(e,2e). Added the reduced Siegel-domain membership API. Existing APIs and tests were retained.

Le Fourn 6.4 supplies the normal projective Satake space and boundary codimension. Demailly II(8.7) explicitly allows a complex-space ambient and gives extension under the strict local-dimension condition; II(8.10) gives Chow. These replace unsupported attribution of the global algebraicity diagnostic to MZ. The generic native statements remain unchanged; all 92 geometric omission entries were regenerated from the corrected packet.

The main theorem retains the published field bound 2^(16g⁴), genus g≥2, Hodge genericity, and avoidance of an arbitrary algebraic hypersurface. The no-Jacobian corollary retains g≥4. The rational fourfold consequence remains conditional as in this source. Neither unresolved supplementary torsion nor local analytic replacement is used as an input.

### Statement and dependency change ledger



| Node | Changes |
|---|---|
| `AbelianVarietiesIsogenousToNoJacobian:E0/elliptic-many-classes` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:E1/iterated-elimination` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:E1/small-isogeny-candidates` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-large-field` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-double-correspondence` | direct prerequisite LogicAndDefinabilityInNumberTheory:LD.6 |
| `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-modular-case` | direct prerequisite AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-large-field |
| `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-avoidance` | direct prerequisite AbelianVarietiesIsogenousToNoJacobian:MZ0/coefficient-descent; direct prerequisite AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-large-field |
| `AbelianVarietiesIsogenousToNoJacobian:I0/rational-analytic-trace` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:I0/entry-c-bounds` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:I0/entry-a-bounds` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:I0/entry-d-bounds` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:I0/entry-b-bounds` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:I0/period-height` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:G0/p-to-adelic` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:G0/endomorphism-specialization` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:MZ0/coefficient-descent` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:C0/small-isogeny-hypersurfaces` | statement; direct prerequisite AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge |
| `AbelianVarietiesIsogenousToNoJacobian:T0/finite-level-order-bound` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:A0/many-classes` | statement; direct prerequisite AbelianVarietiesIsogenousToNoJacobian:G0/genericity-grid-count; direct prerequisite AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge |
| `AbelianVarietiesIsogenousToNoJacobian:A0/avoid-finite-isogeny-classes` | direct prerequisite AbelianVarietiesIsogenousToNoJacobian:C1/counting-theorem |
| `AbelianVarietiesIsogenousToNoJacobian:A0/bounded-cm-count` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:A0/igusa-schottky` | statement |
| `AbelianVarietiesIsogenousToNoJacobian:T1/rational-torsion-cyclotomic` | statement |



Additional proof sketches changed in coefficient descent, generic small-isogeny counting, candidate union counting, many classes, finite-class thinning and CM multiplicity. Gap 13 now records polarization and projective-degree obligations; gaps 19/20 specify the finite-domain restrictions; gap 25 records the newly read comparison statements/proofs and the remaining owner exports. Their coverage remaining lists were synchronized. The LD.6 request now distinguishes its existing early counting interface from the missing uniform projected-block extension. E1’s scalar trace diagnostic uses |n| for arbitrary integers.

## Baseline and ownership

All 15 cited declarations were read in their Lean source files at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Source bytes were checked against the corresponding Git objects. Nothing was accepted on the basis of an index name alone. No citation was removed or replaced.



| Declaration | Module | Statement fit / limit |
|---|---|---|
| `mathlib:Polynomial.resultant` | `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` | Sylvester determinant with explicit degree parameters; specialization and nested-degree adapters remain required. |
| `mathlib:Polynomial.resultant_eq_zero_iff` | `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` | Over a field, vanishing iff at least one polynomial is nonzero and the pair is not coprime; use over the correct fraction field. |
| `mathlib:MvPolynomial.schwartz_zippel_totalDegree` | `Mathlib/Algebra/MvPolynomial/SchwartzZippel.lean` | Finite-grid zero-probability bound using total degree and grid size; convert its rational probability to cardinality. |
| `mathlib:MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` | `Mathlib/Combinatorics/Nullstellensatz.lean` | An evaluation-zero polynomial vanishes when each variable degree is below its finite grid cardinality. |
| `mathlib:Matrix.fromBlocks` | `Mathlib/Data/Matrix/Block.lean` | Actual four-block matrix constructor on sum indices; the signed block convention is retained. |
| `mathlib:Matrix.det_mul` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | Determinant of a product for finite square matrices; used after matching index types. |
| `mathlib:Matrix.mul_nonsing_inv` | `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean` | Right nonsingular inverse identity requires an invertible determinant; never applied to a singular denominator. |
| `mathlib:isLittleO_log_rpow_rpow_atTop` | `Mathlib/Analysis/SpecialFunctions/Pow/Asymptotics.lean` | For positive comparison power, any logarithmic real power is little-o; positivity and asymptotic range remain explicit. |
| `mathlib:Matrix.PosSemidef` | `Mathlib/LinearAlgebra/Matrix/PosDef.lean` | Hermitian matrix plus nonnegative quadratic form, specialized to real symmetric matrix order. |
| `mathlib:Matrix.PosDef.one` | `Mathlib/LinearAlgebra/Matrix/PosDef.lean` | Identity is positive definite with the required ordered-star/no-zero-divisor assumptions, satisfied over R. |
| `mathlib:Matrix.PosDef.add_posSemidef` | `Mathlib/LinearAlgebra/Matrix/PosDef.lean` | Adding a positive semidefinite matrix to a positive definite matrix preserves positivity. |
| `mathlib:Matrix.posSemidef_self_mul_conjTranspose` | `Mathlib/LinearAlgebra/Matrix/PosDef.lean` | The self times conjugate transpose is positive semidefinite; over R this is ww^t. |
| `mathlib:NumberField.InfinitePlace.IsPrimitiveRoot.nrRealPlaces_eq_zero_of_two_lt` | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` | A primitive root of order >2 in a number field forces zero real places; this proves only a necessary torsion test. |
| `tauceti:TauCeti.cholesky` | `TauCeti/LinearAlgebra/Matrix/Cholesky/Basic.lean` | Native positive-definite-matrix Cholesky factor with positive diagonal/lower triangular structure; no private factor is planned. |
| `tauceti:TauCeti.continuous_cholesky` | `TauCeti/LinearAlgebra/Matrix/Cholesky/Topology.lean` | Continuity of that same native Cholesky map; the geometric period realization still needs its owner adapter. |



The reviewed audit `data/library-coverage.json` was inspected at the immutable publication base. It has no dedicated NoJacobian layer entry. Relevant JacobianChallenge Layer E and AbelianSchemesAndArithmeticModuli A1–A6 entries distinguish built field-level abelian varieties, Hom/End, base change and affine Cartier duality from absent polarizations, Rosati, general quotient/torsion, complex uniformization and universal Siegel families. This packet imports the geometric owners; it does not rebuild that machinery. Native Cholesky and the polynomial/matrix support are baseline citations, not duplicate roadmap targets.

Upstream `content/tau-ceti/JacobianChallenge/README.md` and `content/tau-ceti/HodgeStructures/README.md` were read as the two nearby roadmap standards. The relative-Jacobian, canonical-polarization, effective weight-one and integral-lattice conventions agree with the supplier boundaries. The AlgebraicCurves introduction was read for the function-field/scheme ownership boundary; its entire document is not claimed read.

All 37 distinct direct external supplier identifiers were resolved and their actual stage/node statements read. The 27 requests are precise extensions/adapter contracts. Faltings R28.4 remains qualitative; CM.0/CM.2 remain nonquantitative; LD.6 does not already provide the projected-block and functional-transcendence adapters; C4 does not already export singular Remmert–Stein; C5 needs the Siegel boundary specialization. The accepted but unregistered Part II routes remain gaps, with no invented stage ids.



| Supplier checked | Kind |
|---|---|
| `AbelianSchemesAndArithmeticModuli:A2/rosati-involution` | node |
| `AbelianSchemesAndArithmeticModuli:A3` | stage |
| `AbelianSchemesAndArithmeticModuli:A5` | stage |
| `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module` | node |
| `AbelianSchemesAndArithmeticModuli:A6/degree-is-a-polynomial-function` | node |
| `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank` | node |
| `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity` | node |
| `AdelicAlgebraicGroups:AA.3` | stage |
| `AlgebraicModuliForArithmeticGeometry:R09.1` | stage |
| `AlgebraicModuliForArithmeticGeometry:R09.2` | stage |
| `ArakelovGeometryAndAbelianHeights:R35.3` | stage |
| `ArakelovGeometryAndAbelianHeights:R35.4` | stage |
| `ArithmeticGaloisRepresentations:R01.6` | stage |
| `AutomorphicBundles:B4` | stage |
| `AutomorphicBundles:B5` | stage |
| `ComplexComparisonPartII:C0` | stage |
| `ComplexComparisonPartII:C4` | stage |
| `ComplexMultiplicationAndExplicitReciprocity:CM.0` | stage |
| `ComplexMultiplicationAndExplicitReciprocity:CM.2` | stage |
| `FaltingsFinitenessAndIsogenyTheorems:R28.4` | stage |
| `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper` | node |
| `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-witnesses` | node |
| `InverseGaloisAndArithmeticFundamentalGroups:IG.2` | stage |
| `JacobianChallengePartII:JC1/principal-polarization` | node |
| `JacobianChallengePartII:JC1/relative-jacobian` | node |
| `LogicAndDefinabilityInNumberTheory:LD.6` | stage |
| `ModularCurvesPartII:R12.1` | stage |
| `ModularCurvesPartII:R13.4` | stage |
| `PELModuli:M2` | stage |
| `PELModuli:M5` | stage |
| `ShimuraCompactifications:C5` | stage |
| `ShimuraData:D1` | stage |
| `ShimuraData:D4` | stage |
| `ShimuraData:D5` | stage |
| `ShimuraVarieties:V0` | stage |
| `ShimuraVarieties:V2` | stage |
| `StableReductionPartII:MC.2/pointed-dm-theorem` | node |



## Independent source-issue verdicts



| Issue | Verdict | Reason |
|---|---|---|
| `AbelianVarietiesIsogenousToNoJacobian/E1` | confirmed | Confirmed on published p.653 by complexifying ρ as κ⊕κ̄. The self-trace differs by two; the scalar length uses |n| when n is any integer. |
| `AbelianVarietiesIsogenousToNoJacobian/E2` | confirmed | Confirmed on p.656: the referenced definition of v is (27); (50) occurs in the later Cholesky discussion. |
| `AbelianVarietiesIsogenousToNoJacobian/E3` | confirmed | Confirmed on p.661: denominator invertibility (40) and relation (42) imply period formula (41), not the domain inequalities (23). |
| `AbelianVarietiesIsogenousToNoJacobian/E4` | confirmed | Confirmed on p.669: the preceding choices are x̃_1,w̃_1, and the next sentence refers to τ̃_1; the repeated subscript zero is inconsistent. |
| `AbelianVarietiesIsogenousToNoJacobian/E5` | confirmed | Confirmed on p.666: substitution W=βD into (48) requires the closing parenthesis and the entire factor raised to G. The counting variable N is distinct from β. |
| `AbelianVarietiesIsogenousToNoJacobian/E6` | confirmed | Confirmed against the introduction p.641 and references pp.672–673: [26] is Isogeny estimates and [27] Endomorphism estimates. |
| `AbelianVarietiesIsogenousToNoJacobian/E7` | confirmed | Confirmed by block multiplication on p.661. The top-right block has a minus sign; multiplying by a denominator-kernel vector still proves the intended result. |
| `AbelianVarietiesIsogenousToNoJacobian/E8` | confirmed | Confirmed on p.645: M=3 gives 8>6. Summing over divisors first gives Σd floor(M/d)≤M², preserving the final bound. |
| `AbelianVarietiesIsogenousToNoJacobian/E9` | confirmed | Confirmed on p.655: rational Gram entries equal 2 Re of the complex entries. For Z[i] the complex determinant is zero while the rational determinant is four. |
| `AbelianVarietiesIsogenousToNoJacobian/E10` | confirmed | Confirmed as a proof gap on p.651. Permissibility must hold for every qualifying m; the displayed argument controls one m. The union bound proves 2d^4+1 and does not disprove 2d³+1. |
| `AbelianVarietiesIsogenousToNoJacobian/E11` | confirmed | Confirmed on pp.665–666: killing all coefficients of trace ≤W gives strict >W for a nonzero form. Merely ≥W does not contradict the upper bound at equality. |
| `AbelianVarietiesIsogenousToNoJacobian/E12` | confirmed | Confirmed on p.635: the printed phrase has the misplaced word following; this is grammatical and has no mathematical effect. |
| `AbelianVarietiesIsogenousToNoJacobian/E13` | confirmed | Confirmed for the globally closed pure analytic hypersurface interpretation. Independently read Demailly II(8.7),(8.10) and Le Fourn 6.4: G−g<G−1 for g≥2, then extension and Chow imply algebraicity. This does not rule out a separately proved local/germwise/nonclosed replacement. |
| `AbelianVarietiesIsogenousToNoJacobian/E14` | confirmed | Confirmed as a proof gap, not a disproof of the torsion conclusion. The p.666 complex quotient/Q-model inference does not establish the arithmetic fine-level comparison or its total degree. Positive-dimensional principally polarized rational full torsion forces μ_16 by Weil pairing; that necessary condition alone supplies no replacement degree proof. |



All eleven misprints, the one global-endpoint error and the two proof gaps are independently confirmed. E10 does not prove the sharper bound false; E14 does not disprove the supplementary conclusion or the main theorem. E13 concerns globally closed pure hypersurfaces for g≥2 and does not rule out a separately proved local/germwise/nonclosed formulation. No new paper erratum is asserted.

## Checks and limits

The indexed blueprint checker reports zero errors and zero warnings. The read-only assembler was replayed at base `550acd5d97804b879f9f9472201894ab402e01c8` with only this candidate and the actually required proposed supplier definitions in memory; no atlas data was written. Every required supplier pair is reachable, the own and scoped graphs are acyclic, every routed item has coverage, no own link is skipped and foreign mathematical payloads are preserved. The currently promoted-only assembly still has two pending supplier links; the combined supplier assembly resolves them without changing another roadmap.

```json

{
  "base": "550acd5d97804b879f9f9472201894ab402e01c8",
  "readerParityChecked": false,
  "readerReason": "Reader is outside review deliverables; changed statements require orchestrator regeneration before promotion.",
  "checker": {
    "packet": "Candidate.json",
    "roadmap": "AbelianVarietiesIsogenousToNoJacobian",
    "status": "complete",
    "nodes": 95,
    "kinds": {
      "definition": 5,
      "theorem": 38,
      "construction": 13,
      "lemma": 37,
      "comparison": 2
    },
    "apiItems": 85,
    "unitTests": 57,
    "planets": 36,
    "baselineDeclarations": 15,
    "prerequisites": {
      "node (blueprint)": 13,
      "stage": 90,
      "node (this packet)": 149,
      "baseline": 21
    },
    "gaps": 27,
    "requests": 27,
    "stagesInScope": 12,
    "stagesClosed": 0,
    "stagesPlanned": 12
  },
  "errors": [],
  "warnings": [],
  "routedItems": 43,
  "omittedNodes": 92,
  "nativeNodes": 3,
  "stageDAG": {
    "vertices": 3145,
    "edges": 8952,
    "acyclic": true
  },
  "ownNodeDAG": {
    "vertices": 95,
    "edges": 149,
    "acyclic": true
  },
  "scopedDAG": {
    "vertices": 3673,
    "edges": 10525,
    "acyclic": true
  },
  "requiredSupplierPairs": 89,
  "unresolved": [],
  "ownSkippedLinks": [],
  "currentAssemblyPendingLinks": [
    [
      "JacobianChallengePartII:JC1",
      "AbelianVarietiesIsogenousToNoJacobian:MZ0"
    ],
    [
      "StableReductionPartII:MC.2",
      "AbelianVarietiesIsogenousToNoJacobian:MZ0"
    ]
  ],
  "combinedSupplierAssemblyPendingLinks": [],
  "combinedSuppliers": [
    "JacobianChallengePartII",
    "StableReductionPartII"
  ],
  "foreignMathematicalPayloadsPreserved": true,
  "newEdgesIncidentOnlyToOwnRoadmap": true,
  "immutableReadPaths": 856,
  "immutableReadPathSha256": "d44654091c7504377a09efb76a14841e56f2770f4a6105b00e275d0f2b2ed80d"
}

```

The entire final suggested file elaborated serially using the already existing exact-pin Mathlib build. Fresh `free -g` reported 35 GiB available before the final compile. Lean ran with -j1, -M8192 and a 1200-second timeout, exited zero, and emitted only 17 admission warnings. No build environment, cache or dependency build was created. No Tau Ceti compilation was claimed. There is no running compiler or language server.

The file contains three native node signatures, ten API signatures and six admitted native examples. Its other 92 nodes are exact, named omissions with their mathematical statements, prerequisites and all API/test names. These comments are not typed geometric signatures. This limitation remains in the packet; neither elaboration nor review acceptance claims those missing geometric types exist.

```json

{
  "exitCode": 0,
  "errors": 0,
  "warnings": 17,
  "warningKind": "declaration uses admission only",
  "sourceSha256": "fb3e187fa1ccd12f6858c12f74cc33422caf0d53c714fbed6b25018939c3e5cf",
  "stdoutSha256": "f27220ea322b6f62c06307b30be2ce8e8ab782d013f5d2a42ea97e9c2b0cfbea",
  "stderrSha256": "bf838ad6d7bf98bb2c36bb2608059bb0915da329a5aed1e0c7d253a2d03834b0",
  "leanCommit": "6a10ac8c22beadecabdbb0919c2b50214762f91d",
  "mathlibCommit": "082e2d37e8b0463410cdb532e111cd43d5a66174",
  "tauSourceCommit": "f790474821cf4256814db967cb154e7af3d0c369",
  "tauCompiled": false,
  "tauReason": "Suggested file imports only the existing exact-pin Mathlib build; no Tau Ceti import or baseline Tau Ceti build is used.",
  "availableGiB": 35,
  "serialFlags": [
    "-j1",
    "-M8192"
  ],
  "timeoutSeconds": 1200,
  "elapsed": "0:01.10",
  "peakRssKiB": 2630608,
  "preflight": {
    "preflight": "serial existing pinned build",
    "availableGiB": 35,
    "packages": [
      "plausible",
      "LeanSearchClient",
      "importGraph",
      "proofwidgets",
      "aesop",
      "Qq",
      "batteries"
    ],
    "omitted": [
      "Cli: no compiled library directory; not in either checked import cone"
    ],
    "leanVersion": "Lean (version 4.34.0-rc2, x86_64-unknown-linux-gnu, commit 6a10ac8c22beadecabdbb0919c2b50214762f91d, Release)"
  },
  "normalization": "Only absolute compiler/scratch diagnostic paths replaced by $LEAN/$SCRATCH; other output preserved."
}

```

## Per-node review



| Node | Verdict and mathematical check |
|---|---|
| `AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-locus` | **corrected** — Canonical polarized relative Jacobians, reduced closure in the open moduli space, and unpolarized isogenies are kept distinct. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:MZ0/torelli-dimension` | **corrected** — Torelli dimension 3g−3 and the strict inequality for g≥4 agree with the introduction; image-dimension proof is gap 0. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:MZ0/compact-type-closure` | **corrected** — Compact-type component products are distinguished from generalized Jacobians with toric parts; degeneration proof is gap 0. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:MZ0/jacobian-hypersurface` | **corrected** — A proper hypersurface is chosen only for g≥4 and need not descend to Q. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:MZ0/minkowski-domain` | **corrected** — The closed reduced Siegel domain keeps its real-part and determinant inequalities; the classical reduction proof is gap 1. Its source excerpt and source-boundary annotation were checked and corrected in this review. Added a membership characterisation so users need not unfold the domain definition. |
| `AbelianVarietiesIsogenousToNoJacobian:MZ0/igusa-diagonal-estimates` | **corrected** — Both matrix comparisons and the ordered diagonal are retained with a dimension-dependent positive δ. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:MZ0/block-product-domain` | **corrected** — Block products preserve the diagonal matrix comparisons but not the ordered diagonal; this is a routine block specialization. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E0/elliptic-matrix` | **corrected** — The integer matrix determinant m and the bound 2m^(3/2) are the exact elliptic source statement. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E0/finite-subgroup-count` | **corrected** — The count is cumulative over subgroup orders ≤m, not just order m; its higher-dimensional proof remains gap 2. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E0/elliptic-many-classes` | **corrected** — Added N≥2 so the logarithmic denominator is defined and the source box count has its intended range. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E1/iterated-elimination` | **corrected** — Added m≥1; resultant nonvanishing still requires modular irreducibility and the explicit nesting adapter in gap 4. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E1/psi-square-sum` | **corrected** — The corrected divisor reordering gives M² and the second-moment sum gives M³ log M for M≥2. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E1/small-isogeny-candidates` | **corrected** — Specified the fixed real-curve polynomial in the pair (c,c̄); the invertible real-grid substitution preserves nonzero elimination polynomials. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-large-field` | **corrected** — Added sufficiently large N and floor((log N)^3)≥2 before invoking the small-isogeny lemma; the model field is a number field. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-double-correspondence` | **corrected** — Added the early definability supplier directly; the correspondence uses two matrices and both denominators, without a fixed determinant condition. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-block-images` | **corrected** — The empty algebraic part is claimed for the non-modular paired image, with vertical/horizontal components excluded, not for the matrix fibre. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-orbit-collapse` | **corrected** — Embeddings fix the coefficient field, the projected orbit has size ≫D̃, and ε<2/21 makes the exponent strictly smaller than one. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-modular-case` | **corrected** — Added the direct elliptic large-field/quantitative-estimate route; composing with conjugation reduces the modular case to the small-isogeny count. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E1/elliptic-avoidance` | **corrected** — Added coefficient descent and its direct large-field input; algebraic target points, components and isolated points are treated before counting. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E1/one-parameter-obstruction` | **corrected** — The single-offset obstruction retains ψ(m)≤d and a bound for each m; its branch-locus proof remains gap 6. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:E1/one-parameter-offset` | **corrected** — The simultaneous union bound is 2d^4+1. The sharper printed bound is an unresolved proof claim, not refuted by a union bound. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:I0/rational-analytic-trace` | **corrected** — Specified principal polarization and a symplectic integral basis; the rational Gram is 2 Re of the complex expression, including the CM test. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:I0/entry-c-bounds` | **corrected** — Expanded all domain hypotheses and the signed integral representation; the c bound follows from the positive trace term with corrected length. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:I0/entry-a-bounds` | **corrected** — Expanded all domain hypotheses; inverse-order reversal and the xc correction give the a bound. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:I0/entry-d-bounds` | **corrected** — Expanded all domain hypotheses; the κτ identity and inverse imaginary matrix give the d bound. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:I0/entry-b-bounds` | **corrected** — Expanded all domain hypotheses; the b−xd term and preceding bounds give the b bound. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:I0/off-diagonal-extraction` | **corrected** — The off-diagonal extraction is Z-linear, has zero diagonal blocks, and uses the product polarization for its Rosati norm bound. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:I0/short-independent-family` | **corrected** — The lattice covolume is √D of the real rational Gram; independent minimum witnesses are not claimed to form a Z-basis. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:I0/controlled-length-isogeny` | **corrected** — The two maps are isogenies of unpolarized abelian varieties; the degree product is bounded using dimension 2g and length exponent 4g. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:I0/period-height` | **corrected** — Specified the principally polarized period realization; only the lower imaginary comparisons are required and stable height uses max(1,h). Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:I0/denominator-invertible` | **corrected** — The signed block determinant and period relation imply denominator invertibility; the native statement has no geometric placeholder hypotheses. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:G0/p-generic-isogeny` | **corrected** — Finite field restrictions and commensurable lattices preserve openness, rather than equality of integral images. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:G0/p-to-adelic` | **corrected** — Specified positive-dimensional principally polarized A for the GSp convention; Cadoret's original proof remains the precise gap 9 input. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:G0/galois-to-hodge` | **corrected** — The full Mumford–Tate group follows using the absolute-Hodge comparison leaf, not End=Z alone. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:G0/serre-open-image` | **corrected** — Specified the principally polarized GSp convention and geometric End; retained exactly odd g or g=2,6, excluding g=4. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:G0/universal-open-monodromy` | **corrected** — The generic arithmetic family, geometric monodromy and cyclotomic similitude are separate parts of the open-image proof. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:G0/endomorphism-specialization` | **corrected** — Restricted to the fixed finite-cover/arithmetic parameter-family setup, geometric End, and N≥2; Masser's original specialization theorem remains gap 11. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:G0/frattini-specialization` | **corrected** — An open Frattini subgroup reduces a compact p-adic image to a finite quotient; full specialization image is supplied through the thin-set route. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:G0/genericity-grid-count` | **corrected** — The half-saving term remains in general dimension and is omitted only in the stated Serre range; excluded algebraic loci are counted separately. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:MZ0/coefficient-descent` | **corrected** — Specified a geometrically integral Q̄-defined ambient variety; descent contains the algebraic points rather than claiming that H itself descends. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:C0/fibre-field-bound` | **corrected** — The degree bound is asserted on the common regular finite-fibre domain; coarse moduli versus model fields remain separate in gap 12. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:C0/bounded-model-moduli` | **corrected** — Fine level-three lifting bounds a model field over the moduli field; the fixed-pairing cyclotomic component or similitude level must be tracked. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:C0/dual-small-isogeny-correspondence` | **corrected** — Principal duality reverses an arbitrary isogeny with equal degree; it does not make the original map polarization-preserving. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:C0/small-isogeny-hypersurfaces` | **corrected** — Restricted the hypersurface estimate to geometric End=Z points, where a principal polarization is unique; subgroup counts alone still do not prove projective degree (gap 13). Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:C0/candidate-count` | **corrected** — Count nongeneric points first; only then apply the corrected small-isogeny estimate. The union and all source exponents remain unchanged. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:C0/height-discriminant` | **corrected** — Stable Faltings height need not be nonnegative; the product Rosati discriminant bound remains a quantitative owner input with the fixed-family height adapter. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:C0/isogeny-degree-height` | **corrected** — The selected isogeny's degree has exponent 2gλ, with constants depending on the fixed arithmetic family. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:C0/log-threshold` | **corrected** — The logarithmic threshold requires ν>2gλ and sufficiently large N; floor rounding is absorbed only in that range. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:MZ0/period-matrix-correspondence` | **corrected** — The positive coordinate blocks and the signed rational representation are explicitly converted; det(cτ+d)≠0 is part of the actual native set. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:C1/correspondence-definability` | **corrected** — Restricted uniformization and the algebraic inverse image are definable; the fractional-linear projection is semialgebraic on its denominator domain. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:C1/galois-period-height` | **corrected** — The fixed coefficient/model fields are included in the orbit construction and the integral height has polynomial growth in D̃. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:C1/hodge-generic-zero-images` | **corrected** — It is the connected projected block, not the entire matrix fibre, that must be a point; the weakly-special dichotomy is an explicit shared-source leaf. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:C1/orbit-degree-collapse` | **corrected** — The bounded model/moduli degree adapter makes orbit cardinality comparable with D̃; ε<1/λ yields the bounded-degree conclusion. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:C1/counting-theorem` | **corrected** — The exceptional event is existential in each regular fibre; retained g≥2, γ<1/2 and the improved odd/2/6 range, with exact D bookkeeping. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/fourier-order` | **corrected** — Fourier order uses discrete trace support, the half-integral convention and ord(0)=∞; the definition does not assume integral order. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/order-superadditive` | **corrected** — Cancellation cannot lower the minimum trace in a product; only superadditivity is used. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/norm-form` | **corrected** — Normality, finite index, coset representatives and the left automorphy-factor convention are explicit; nonzero norms have weight nk. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/igusa-order-bound` | **corrected** — The full-group bound and the gamma/Minkowski constants match the source, with g≥2 and nonnegative weight. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/finite-level-order-bound` | **corrected** — Expanded g≥2, normal finite-index Λ, n=[Γ:Λ] and k≥0 so the finite-level bound is a complete standalone statement. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/theta-constants` | **corrected** — Replaced the unspecified congruence conditions by an explicit matrix definition checked in BCCR17 §2; the row characteristic and even-level conventions are retained. Its source excerpt and source-boundary annotation were checked and corrected in this review. Added the membership/congruence API; the theta-level definition also has subgroup, inclusion and transpose interfaces with three additional tests. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/theta-linear-combinations` | **corrected** — The common multiplier is an explicit transformation-law proof obligation; individual squared transformations alone are not treated as sufficient. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/fourier-index-count` | **corrected** — Positive semidefiniteness bounds each off-diagonal entry by diagonal data; the Fourier lattice and real bound are retained without incorrect rounding. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/theta-coefficient-kernel` | **corrected** — The kernel annihilates coefficients with trace ≤W, giving strict order >W and resolving the equality case in E11. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/theta-relation-vanishing` | **corrected** — The strict order comparison forces the relation to vanish identically; converting squared coordinates doubles its homogeneous degree. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/theta-projective-model` | **corrected** — The complex theta quotient and its Q coordinate model are separate from universal arithmetic full torsion; descent remains gap 18. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/generic-projection-degree` | **corrected** — Generic projection is birational to a hypersurface with preserved degree; this non-routine adapter is expressly gap 17, not an export of Hilbert projectivity alone. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/theta-numerical-degree` | **corrected** — The intermediate numerical formula and final 2^(16g^4−1) bound are retained as a planned arithmetic inequality, with its all-g proof gap. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T0/theta-degree-map` | **corrected** — The rational theta-ratio map is restricted to its regular nonempty domain; its arithmetic forgetful descent is a distinct obligation. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:A0/hypersurface-avoidance` | **corrected** — The main existence theorem keeps g≥2, Hodge genericity and model degree ≤2^(16g^4); neither supplementary gate is a prerequisite. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:A0/no-jacobian` | **corrected** — The no-Jacobian consequence requires g≥4 and also excludes compact-type products through the Torelli closure. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:A0/many-classes` | **corrected** — Added sufficiently large N and the common regular finite-multiplicity domain; a rational map may have no valid small-box candidates. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:A0/quadratic-approximation` | **corrected** — The reciprocal transformation has inverse ξ_j+1/(dn_j), stays near ξ for fixed large d, and uses Q(i), hence the factor two in the field bound. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:A0/avoid-finite-isogeny-classes` | **corrected** — Added the direct bad-box count and subtraction argument: choose 0<ε<γ so N^(G−ε) dominates discarded N^(G−γ) candidates. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:A0/dense-independent-set` | **corrected** — Recursive choices in a countable Euclidean basis use finite-class avoidance and preserve the uniform model-field bound. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:A0/unirational-count` | **corrected** — The unirational map is over Q and dominant; retained g=2,3,4,5 and improved γ<1 only for g=2,3,5. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:A0/rational-fourfold` | **corrected** — The rational fourfold consequence remains conditional on Q-unirationality, exactly as in the published source. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:A0/bounded-cm-count` | **corrected** — Corrected the uniformly bounded count to distinct CM moduli points; a parameter count needs an explicitly finite forgetful/regular-map domain and excludes exceptional fibres. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:A0/igusa-schottky` | **corrected** — Restricted the low-genus identity to 1≤g≤3; the genus-four assertion is the reduced zero locus in A_4, with external Schottky proof gap 21. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:A0/theta-product-factorization` | **corrected** — Block theta factorization uses normal convergence and the eighth/sixteenth power sums, with characteristics split by both blocks. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:A0/products-in-torelli-closure` | **corrected** — For genus splits 2+2 and 1+3 the low-genus identities force F_4=0; this gives Torelli closure membership, not a smooth-curve Jacobian. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:X0/newton-series` | **corrected** — The native total sum has a finite evaluation at each injective parameter; entire interpolation requires the displayed summable envelope. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:X0/coefficient-envelope` | **corrected** — Positive coefficient tolerances give locally uniform convergence; arbitrary values at accumulating parameters are not claimed interpolable. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:X0/elliptic-period-selection` | **corrected** — Rational translation/scaling preserve isogeny and choose distinct imaginary parameters; the strip gives the displayed j bound. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:X0/elliptic-interpolation-image` | **corrected** — The compact image is a real-analytic parametrized set meeting algebraic elliptic classes; neither embeddedness nor a global complex hypersurface is asserted. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:X0/symplectic-dense-selection` | **corrected** — Rational symplectic density plus real transitivity supplies neighbourhood selection; the original density/isogeny proof remains gap 23. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:X0/matrix-interpolation-image` | **corrected** — Continuous native Cholesky and real symmetric interpolation give positivity for real parameters; the compact image is kept separate from the false global endpoint. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T1/arithmetic-comparison-cover` | **corrected** — The arithmetic comparison cover specifies a universal polarized family, component field and level, but its target degree remains an unresolved gate. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T1/rational-torsion-cyclotomic` | **corrected** — Added g≥1; perfect equivariant Weil pairing forces a primitive sixteenth root only in positive dimension. Dimension zero is a counterexample without that hypothesis. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T1/full-degree-bookkeeping` | **corrected** — All model, coefficient, cyclotomic and torsion degrees must be counted once; φ(16)=8 is an upper bound for only the cyclotomic step. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:T1/supplementary-torsion-target` | **corrected** — The supplementary torsion target is explicitly unestablished and has no path into the main theorem. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:X1/satake-dimension-obstruction` | **corrected** — Replaced the unsupported MZ attribution by Le Fourn Definition–Proposition 6.4(a,b), p.181: boundary codimension g in the normal projective Satake space. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:X1/closed-hypersurface-algebraic` | **corrected** — Replaced the diagnostic-only attribution by Demailly II(8.7),(8.10) and Le Fourn 6.4; the theorem permits a singular complex-space ambient and requires strict local dimension. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:X1/no-global-interpolation-hypersurface` | **corrected** — Combining algebraicity of a globally closed hypersurface with the main avoidance theorem rules out a class-covering global endpoint for g≥2. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:X1/local-hypersurface-specification` | **corrected** — The local specification states its actual open domain, relative closedness and compatible equations; it does not assert existence. Its source excerpt and source-boundary annotation were checked and corrected in this review. |
| `AbelianVarietiesIsogenousToNoJacobian:X1/local-replacement-target` | **corrected** — A local/germwise replacement remains a distinct unresolved construction. Compactness and multiplying equations on different domains do not establish it. Its source excerpt and source-boundary annotation were checked and corrected in this review. |



## Orchestrator actions

1. Regenerate the definitive reader `research/blueprint/readmes/AbelianVarietiesIsogenousToNoJacobian.md` from the corrected definition/packet before publication. It is outside the four authorized review paths and was therefore not edited. Its 21 corrected statement copies, the changed CM heading, proof/API/test text and remaining/source-issue descriptions must agree with this packet; the exact corrections are recorded above and in the embedded ledger. Reader parity was deliberately not claimed.

2. The current promoted-only assembly has pending `JacobianChallengePartII:JC1 → MZ0` and `StableReductionPartII:MC.2 → MZ0`. Use the independent owner promotion/assembly workflow; adding their existing proposed definitions in a read-only audit resolves both. This review does not promote those suppliers.

3. Keep the 27 proof/interface follow-ups and the unresolved T1/X1 gates explicit. Register actual owner keys for the accepted quantitative/functional-transcendence/CM Part II routes, and the precise singular-space/boundary extensions, before treating those branches as closed. The reviewer has not reopened or re-planned the upstream owners.

## Durable replay evidence

The artifacts below are ordinary JSON/compiler logs and portable read-only validation helpers. They contain no local paths; decompression does not run Lean. Verify their lengths and hashes after base64/zlib decoding. For graph replay, recover Candidate.json, Candidate-roadmap.json and Published.lean from the four submitted deliverables, recover these helper/artifact files into a disk scratch directory, and run review-verify.py there with a clone plus the declaration index. It reads Git objects at the immutable base and assembles only in memory. It never publishes or builds libraries.

<!-- NO JACOBIAN INDEPENDENT REVIEW EVIDENCE

{
  "base": "550acd5d97804b879f9f9472201894ab402e01c8",
  "artifacts": {
    "baseline-receipt.json": {
      "bytes": 4137,
      "sha256": "d0a8e55690a940b1fc3cc34dcb0d364ecb9e2ebd9a2dc2337df40f401c2b374e",
      "encoding": "base64-zlib",
      "data": "eNrdl0tvGzcQx+/5FILPhsT3I7ckRoAASWo4PjUIFkNyaLNZLdVdyq5c9Lt3bNmNg1auBd18EKUVh0PMD/P479dXs9mf9JnNjkbMR69nR0tol30Jr09rvxnqskA/H3Fa9w2GdnS8NV3WtO7x1vrT1npxVoaL80us42bx4+Di7OHg4i1MJc57hOHBx3QJQptbH4x7KSKXWmtjFEbk3mhhA7fWZJQMldTKCo6a+eCMYElYIRMLKK0MqB88rsrwdtPwFMbSNuS4jWu834owpJKg4ccy4ER7X+/+n824VHe/vtH61/FeMDr8vbvBsXYl55cHxjP3HDCfrh6hmeLlNYztprspqxX2XasN+hO8GBF3A3rTX2AYYfHY0+LLvadf7xztwBOdkixaFV12CkFHb5PjlgeMQkSthEopgE4iZBGImrFaoOIqBQHKe3lQ3nixN56HfKm5wyvotw/QutVYU5fLMOETBfauLkMZoNWxxGnxed33U8O+x2GCdrMDkDWUNwhoDEXsHGJMkgkHBCEq56RPJoRoIGdCJ1gQyQjPknRCBsN0OgSQsc/iA20sf8zzWJdv+xq/T7sBnECjJLmzX9zZ7ghaG6sycDBGCuNkhky1YqVJMTnkJkQZuaIq4iJG0DYh0zlyjFKEZCSPhwStzB5BJ2zdct3vjvjWO4z/1Mc29BNsOC4pE/6ndzjLhOfgtFKQvPAWWeQ2Sy2pPoBzwyzwzJKTwVoduATJPVWPtVGyLPCwpur24EAMuqEOEzXKrgxXe/L4vD257mH8MFzhOOEOIBzROh0MhiQo2iQweeoVWUbHFGREF6OJqEVA49FIbUVQMfOQgkbn2CFABOfPAVKmj6W1Hn/p+nrRjat6vV2gndfVEx10gH4zlWnxZYWRGs379RBbIS40ca4Xb6bNckWdmNrGDjIUI6OicEipwQxPihMBBpGyhjkmfaB6UVbaaOmJWoTxKenIs4+0yHhQxdCg2iNVTuv0BZclYd4zS+jgCeYd8XvLonEuOqqHjNHIwIMSQmGCxKg9qBAod3KkjpkFux0t6LyyNJx9FtRgDolf++OHhin2A3EbTx3wpYDgXB/vVy0/o4CUutWLSw+h9B4ofsTfTdjn2+nSxTr8dj7CMNHmi0kWaZ6F5fN6GXB8X7BP8w8DKaxC9/QQcf5hOh3LsrRyhWe1tvkwniH0d3tT90inteva9U+osu0N9/r+0XWLn657elALkq7C8MxZcCRQM7ogwSYIIJwKyqLIELMnA65T9BJoPDmyBuOs4geJfM2fFCwN1hFbeX0O63f0PY+Xtcfp++bfPO4t/juN3t0fexKDcoxRkKRSE6l3TmpeZy7AGuut41FLIAkjICnhUGdruNXe0SPNpVtNZw5719mLQh1aGdZ1PXWHAqGxXmnUb3bp9xhiYs6wKDijumHBkmhxEkQ2hITqDETQJnBvgRQ7yKSc9SIzznMCdpiGE4+a8Ktvr/4G+YqtHw=="
    },
    "changes.json": {
      "bytes": 17199,
      "sha256": "48546579a6b531f631461e160a858f0a68fb505e53fad20d43123bb4f86d5783",
      "encoding": "base64-zlib",
      "data": "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"
    },
    "TargetWorklist.json": {
      "bytes": 40713,
      "sha256": "048efac57e91b5104bfbe670b70b781ceea23431c3de061a8e65331ad6a69797",
      "encoding": "base64-zlib",
      "data": "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"
    },
    "Review-Compilation.json": {
      "bytes": 1467,
      "sha256": "f0e73bb24ca399b6e6599ac95bc4665afebf15d052897a8d9eb8596303f9699a",
      "encoding": "base64-zlib",
      "data": "eNqNVMmO3DYQvc9XEA0fEmB6zEXr+OQ0EgfwEmTayCUwgiJZ6mZGLSokNUsM/3uKUs9oAuSQS7f4yKp6r+qRXy8Y2+CDSztvcXPN+OUMhOBDfF7eQxjccMiAqF8i791gCdxYND0ESM4PbIoYGdiTizEv/dA/buaY6KdgcH8EWVY5qNMKRVN3IIyxQnZVUzaG/uvCGKUKKQ103JbK1KLoNNpKy5KLplWtUVia7pw1WT+lF1llLSVHUFLqqquk4ZXitVZcozTYYAO6bqTlQnWllVBIhLbG1kjNDVWB56zUgzWr7hrVgK1srbu20VoaVdFvxRtetlrzVpSWSrZQAlqB3NRWlgqojmpUofmStUcYdv50cinnrEBwMI0hogjUQdB2zpS5lFyKoq5k1wq7xJ4gHXun13DeSJRW1dhoXlSqENxYXSqJQghjC2VLqCpRF0t4gmk/939N0NUtL+qikcJ0BelsRGF1W9VGi7LAGjplOclsnxNQ6Oh6zBPvoI/4hN8gRD/klPvpcMCY0LKODjJ3Gn1IcfYAS0dkZLSYyDf0ASZtRzewj4supifX2zds8OwzTGyHyZ3DmQ9MQ8TeDbjuzceZi9lu9mqhCHfgetA9vnM/EBtVLqPE4KD/qYfZv78TROD2TzHH5M+PjWjlhhZfFkHuhNlRaPxgZ8tLfr4VPYxxlr/h11xcifNYR4Tbmxjfz1Ul2Y1ssWwE7Hp3OOZ2f12qvYTO1NauUD8G6t2s7Ynef4rKicDcAjX7WVPGepiio7PnYII+kOX2CMEcd73DIa07S3ffBRiPKzgG77t7Zw+Y4ooCRj+uy1//Wr81pEQqiMeMfDmz8+SxNLfqmRzVv87jNWcXMZp6gPDIrAtokg+PefqJkSfQkVkCM0c0t3Tw7AOaB/67Sr5Pv2HI70xuZ9bKvrtbAFZcqeKKb4ORl+yhqf6oiu003A7+ftiSlaaH7WGYLjMbosr+7128ZDdIVSN+n5l8m6c8+HCC3v09P3+Zxy/Z7qCj76eET3rD62johTRH0guHwdPEDRvJ/JEFpMGZPPhH9urDj28/vX613928/bz7+Q3zcyfIj+OUGJmHLHOXDX/x7eIfEzKu3A=="
    },
    "Review-Verification.json": {
      "bytes": 3411,
      "sha256": "d262ca92c69a650a898cbbde963304dc4e54dcb4bfa91a584c77d265e224ff0f",
      "encoding": "base64-zlib",
      "data": "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"
    },
    "Review-Lean.stdout": {
      "bytes": 1481,
      "sha256": "f27220ea322b6f62c06307b30be2ce8e8ab782d013f5d2a42ea97e9c2b0cfbea",
      "encoding": "base64-zlib",
      "data": "eNqlkk2P0zAQhu/8ilHEAaS25KtpEk7Qw3LgALuIC0Ls2Jkmo7p2sJ1tK8R/X7t7RkLyxfKM533nscd/stnSQfE4+ayHzJFlVEAXdp71CDNrTQOIhdWQrSDDJ2SFQtEdfwz11TbkZpRHHMmF+Ec2K1wch4JY/ZlQPxBaOe0Vk/Yxx6fZWH9ncZ5iOFtjDmceRvLu1oCcmePm6++4CvQ+IAXznyEyJw7hcGsUHHvQBqQ5zawCo2Jh0V5hYEvSG3t9H449sAZiP5EFOZE8hsIXgiDUdHNVgfI7WcdGxyeI0PDm6SUB9aaqN/naynIFl7b51dTrRR+1Oeu1Yr1c1qNeVhEioEGDRY6ylWUpCAeSKAYh8q7oZCm2eVnUu6Y8dMWwgnsKXR29zf6+ev2wv//wbf/p3ZdFKHYTDZtI1Fdt3/ZwRqvDIHoIdgot+gi1OHLw6Iy118d/6uttor5L02/rRH3i/Zuqz5P0bZp+V6fp2zLt/l3i/Iu8SDXYJRoUiV+oKPNUgy5tiEVVpRr85zd8BnIF9/4="
    },
    "Review-Lean.stderr": {
      "bytes": 774,
      "sha256": "bf838ad6d7bf98bb2c36bb2608059bb0915da329a5aed1e0c7d253a2d03834b0",
      "encoding": "base64-zlib",
      "data": "eNp9kk1v2zAMhs/2ryCKDkgOTW2vTWPfgqDDCqxbsLS7KzYTK9FHJlL52K+f5GQr0AY5CSAfknr5MplYrYVpYI7SLIGlxqaCq/haz5AXWQbX3x7H3+FmlcPN8ygvC7ieTX6OXyZfb6d+riS12AwUCnOVJq+ErmsCPcLamob6FWSDh/s0mR2IUZ9JFqM0maKr0TDYBUymr8CtJFjZOSwtV1DefUqTRyU2hA30dkIpqJWt1/1Ts7bSuiIC6yC+sWmV5YM8S5PxFp1YIlArXChm3DOQ/BOK1vMDY8e+Ud6cuEawuMARi3p9Ic+WhTqTfxZ7qb0GhySbKJfww3eK4edsmI3eml2Cu56roLvn8LeXLlr4dPujD5tYuRBeMR0paY5UrYTUEROwcELjO/S+HJUPafLLKm9YuAMEm45L20muW4xIEcx8MttLSJg42wW/utlfpAorO7ovzcbzx3A4tf/xWXA2KNVIFH5GQbbhs4kgBuU2nmtMyqURiqBBFWLuFJ12bnU7+7eyu6wchmvaS442su+G/gXlfvjc"
    },
    "check-reviewed.json": {
      "bytes": 680,
      "sha256": "9edb490f69af857c43e7f52d95436144aff3861e88647091128448f3bfc9492b",
      "encoding": "base64-zlib",
      "data": "eNqNkUFPAjEQhe/7K5qeNCHCgihwM3rBgzGReCEchu64VHbb2unGGMN/t9MtZI8e+82beW+m20L8FkJI6toW/I9cpaeQDtQRQ3xKj4Tg1WG8bzp0Xpsw7os0fthjo8G8g9cYNNKabI3GdrSxL/YZlN3H6s0nWSNHaaq3ULXgeOy/enMbBQgdcZeyrWswYC4YWyHz5bx/H7Wp6LyDkBV+aKODjv4r0UuEDAe0HttIZouMlDUUfKeyspxl3mA8CgvvL8LWxcCUZFNmp94YnF4HbNl7kbN00XmDFJjN+wHSNWAwkdldT/ZA8Q4Gn1A14IETcLnMQ5xHj1+dJh1wsBjvLa4uH3I9DB2PVSPfZDIaisNBk+g/Lslvl7l8TsAblYOVanDsOM3ROUbe5oySE63Nm7KO28vpkD82lrCKeDKkr/ECJuGS75e8JHpvPU/e7tL7G7zRpu5JIU7FrvgDXAjDIw=="
    }
  },
  "helpers": {
    "immutable.py": "3c2368dc0c06aa56c565aa2e12625d7bc16eea59e49abd3287962205e7d42f84",
    "review-verify.py": "871eaa431f1721288988fe69574597e2bee896ddd0126903467be3ddda68bbbe"
  },
  "publicHashes": {
    "research/blueprint/packets/AbelianVarietiesIsogenousToNoJacobian.json": "9de60585cfbbd64b4668c4a9697e673e9f0307ba3e97085eff0c30d38a6f13c3",
    "research/blueprint/roadmaps/AbelianVarietiesIsogenousToNoJacobian.json": "2bf1f5bf267748898edb5c660f847da5daca1f83422fc4f0bb5cdb5b842d0414",
    "research/blueprint/suggested/AbelianVarietiesIsogenousToNoJacobian.lean": "fb3e187fa1ccd12f6858c12f74cc33422caf0d53c714fbed6b25018939c3e5cf"
  }
}

END NO JACOBIAN INDEPENDENT REVIEW EVIDENCE -->



### Replay helper: immutable.py



```python

"""Read the immutable audit tree without creating a repository snapshot."""
import fnmatch
import importlib.abc
import importlib.util
import io
from pathlib import Path
import subprocess
import sys

import os
REPO = Path(os.environ.get('TAUCETI_REPO', str(Path.cwd())))
BASE = os.environ.get('STABLE_VALIDATE_BASE', '47357504f05b53e03053da25871ed098e547d771')
TRACKED = set(subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', BASE], cwd=REPO, text=True).splitlines())
CACHE = {}
READS = set()
ORIGINAL = {name: getattr(Path, name) for name in ('read_text', 'read_bytes', 'exists', 'is_file', 'is_dir', 'glob', 'rglob', 'open', 'write_text', 'write_bytes')}

def relative(path):
    try:
        return str(path.resolve().relative_to(REPO.resolve()))
    except ValueError:
        return None

def blob(key):
    if key not in TRACKED:
        raise FileNotFoundError(key)
    READS.add(key)
    if key not in CACHE:
        CACHE[key] = subprocess.check_output(['git', 'show', BASE + ':' + key], cwd=REPO)
    return CACHE[key]

def read_text(path, encoding=None, errors=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['read_text'](path, encoding=encoding, errors=errors)
    return blob(key).decode(encoding or 'utf-8', errors or 'strict')

def read_bytes(path):
    key = relative(path)
    return ORIGINAL['read_bytes'](path) if key is None else blob(key)

def is_file(path):
    key = relative(path)
    return ORIGINAL['is_file'](path) if key is None else key in TRACKED

def is_dir(path):
    key = relative(path)
    return ORIGINAL['is_dir'](path) if key is None else any(s.startswith(key.rstrip('/') + '/') for s in TRACKED) or key == '.'

def exists(path):
    key = relative(path)
    return ORIGINAL['exists'](path) if key is None else is_file(path) or is_dir(path)

def glob(path, pattern, recursive=False):
    key = relative(path)
    if key is None:
        yield from ORIGINAL['rglob' if recursive else 'glob'](path, pattern)
        return
    prefix = '' if key == '.' else key.rstrip('/') + '/'
    for candidate in sorted(TRACKED):
        if not candidate.startswith(prefix):
            continue
        tail = candidate[len(prefix):]
        if fnmatch.fnmatch(tail, pattern) and (recursive or '/' not in tail):
            yield REPO / candidate

def open_path(path, mode='r', buffering=-1, encoding=None, errors=None, newline=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['open'](path, mode, buffering, encoding, errors, newline)
    if mode not in ('r', 'rb'):
        raise PermissionError('audit tree is read-only')
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode(encoding or 'utf-8', errors or 'strict'))

def write_text(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_text'](path, *args, **kwargs)

def write_bytes(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_bytes'](path, *args, **kwargs)

class Loader(importlib.abc.Loader):
    def __init__(self, key):
        self.key = key
    def create_module(self, spec):
        return None
    def exec_module(self, module):
        module.__file__ = str(REPO / self.key)
        exec(compile(blob(self.key), module.__file__, 'exec'), module.__dict__)

class Finder(importlib.abc.MetaPathFinder):
    def find_spec(self, fullname, path=None, target=None):
        key = 'scripts/' + fullname + '.py'
        if '.' not in fullname and key in TRACKED:
            return importlib.util.spec_from_loader(fullname, Loader(key))

def install():
    for name, function in [('read_text', read_text), ('read_bytes', read_bytes), ('exists', exists), ('is_file', is_file), ('is_dir', is_dir), ('glob', glob), ('rglob', lambda path, pattern: glob(path, pattern, True)), ('open', open_path), ('write_text', write_text), ('write_bytes', write_bytes)]:
        setattr(Path, name, function)
    sys.meta_path.insert(0, Finder())

```



### Replay helper: review-verify.py



```python

"""Read-only validation of this new roadmap against the immutable publication base."""
from pathlib import Path
import collections,copy,hashlib,json,os,re,sys
S=Path(sys.argv[1]).resolve();R=Path(os.environ['TAUCETI_REPO']).resolve()
RID='AbelianVarietiesIsogenousToNoJacobian'
BASE='550acd5d97804b879f9f9472201894ab402e01c8'
os.environ['STABLE_VALIDATE_BASE']=BASE
sys.path.insert(0,str(S));import immutable
immutable.install()
sys.path.insert(0,str(R/'scripts'))
import check_blueprint,blueprints,build
p=json.loads((S/'Candidate.json').read_text());d=json.loads((S/'Candidate-roadmap.json').read_text())
lean=(S/'Published.lean').read_text()
ids={n['id']:n for n in p['nodes']};ownstage={RID+':'+s['key'] for s in d['stages']}
assert len(ids)==95 and len(ownstage)==12
assert p['status']=='complete' and all(c['status']=='planned' and c['remaining'] for c in p['coverage'])
assert len(ids)<check_blueprint.NODE_BUDGET==300
assert all(n['implementationStatus']=='unchecked' for n in ids.values())
assert d['area']=='arithmeticgeometry' and d['parent'] is None
assert p['part'] is None and set(p['scope'])==ownstage
assert all(len(n.get('tests',[]))>=3 and n.get('api') and n.get('uses') for n in ids.values() if n['kind'] in {'definition','construction'})
assert {t['kind'] for n in ids.values() for t in n.get('tests',[])}<={'computation','degenerate','compatibility','characterisation','non-example'}
for n in ids.values():
 for a in n.get('api',[])+n.get('tests',[]):assert (a['name'] in lean or n['id'] in set(p['prototype']['nativeNodes']) and a['name'].split('.')[-1] in lean)
native=set(p['prototype']['nativeNodes']);omitted={x['nodeId'] for x in p['prototype']['omissions']}
assert native|omitted==set(ids) and not native&omitted and len(native)==3
assert lean.count('/- Omitted ')==len(omitted)==92
assert len(re.findall(r'\bexample\b',re.sub(r'/-.*?-/', '', lean.split('/- Omitted ')[0], flags=re.S)))==6
assert not re.search(r'def\s+\S+\s*:\s*Prop|\w+\s*:\s*Prop\s*\n',lean)
for text in [lean,json.dumps(p),json.dumps(d)]:
 assert not re.search(r'/(?:home|tmp|Users)/|file:'+chr(47)*2,text)
work=json.loads((S/'TargetWorklist.json').read_text())
routes={i['id'] for source in work for i in source['items']}
assert len(work)==1 and len(routes)==43
for source in work:
 assert hashlib.sha256((R/source['path']).read_bytes()).hexdigest()==source['sha256']
rc={x['id']:x for x in p['routedTargets']}
assert set(rc)==routes
assert all(x['nodes'] and set(x['nodes'])<=set(ids) for x in rc.values())
gapids={x for g in p['gaps'] for x in g['neededBy']}
assert all(g['detail'] and set(g['neededBy'])<=set(ids) for g in p['gaps'])
assert all(q['need'] and q['neededBy'] and set(q['neededBy'])<=set(ids) for q in p['requests'])
context=list(check_blueprint.world())
context[1].update({s:RID for s in ownstage});context[2].add(RID)
context[3].update({n:('blueprint',RID,'Candidate.json') for n in ids})
index=check_blueprint.load_index(os.environ['TAUCETI_INDEX'])
errors,warnings,summary=check_blueprint.check(S/'Candidate.json',index,tuple(context))
assert not errors and not warnings,(errors,warnings)
summary['packet']='Candidate.json'
packets,docs,definitions=blueprints.load_promoted(R)
assert not any(x[1]['roadmapId']==RID for x in packets)
# Add only proposed supplier roadmaps actually reached from this candidate.
defpool={x['id']:x for f in (R/'research/blueprint/roadmaps').glob('*.json') for x in [json.loads(f.read_text())]}
packpool={x['roadmapId']:(f.stem,x) for f in (R/'research/blueprint/packets').glob('*.json') for x in [json.loads(f.read_text())] if x.get('part') is None}
known={x['id'] for x in definitions};needed=set();queue=[p,d]
while queue:
 x=queue.pop()
 refs=[q for n in x.get('nodes',[]) for q in n.get('prerequisites',[])]+[q for st in x.get('stages',[]) for q in st.get('requires',[])]+[q['supplier'] for q in x.get('requests',[])]
 for q in refs:
  owner=context[1].get(q)
  if owner is None and q in context[3]:owner=context[3][q][1]
  if owner in defpool and owner not in known|needed|{RID}:
   needed.add(owner);queue.append(defpool[owner])
   if owner in packpool:queue.append(packpool[owner][1])
sp=[packpool[r] for r in sorted(needed) if r in packpool and not any(z[1]['roadmapId']==r for z in packets)]
sd=[defpool[r] for r in sorted(needed) if r not in known]
def assembly(candidate,supplier=False):
 build.load_promoted=lambda *args:(copy.deepcopy(packets+(sp if supplier else [])+([(RID,p)] if candidate else [])),copy.deepcopy({**docs,**({RID:'research/blueprint/readmes/'+RID+'.md'} if candidate else {})}),copy.deepcopy(definitions+(sd if supplier else [])+([d] if candidate else [])))
 return build.assemble(require_distances=False)[0]
current=assembly(True);currentown=next(r for r in current['roadmaps'] if r['id']==RID)
expectedPending=currentown.get('pendingLinks',[])
assert not currentown['blueprint']['skippedLinks'],currentown['blueprint']['skippedLinks']
a=assembly(True,True);b=assembly(False,True)
stages={s['id']:s for s in a['stages']};stageids=set(stages)|set(context[1])
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(ids)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks'), (ar[RID]['blueprint']['skippedLinks'],ar[RID].get('pendingLinks'))
# Suppliers gain the new consumer links. Their mathematical fields remain identical.
def payload(x):return {k:v for k,v in x.items() if k not in {'consumers','requires','prerequisites','stages','edges'}}
assert all(payload(ar[x])==payload(br[x]) for x in br)
bs={s['id']:s for s in b['stages']}
assert all(payload(stages[x])==payload(bs[x]) for x in bs)
se={(e['source'],e['target']) for e in a['stageEdges']}
oldse={(e['source'],e['target']) for e in b['stageEdges']}
assert oldse<=se and {e for e in se-oldse if not any(v.startswith(RID+':') for v in e)}==set()
def dag(vertices,edges):
 vertices=set(vertices)|{v for e in edges for v in e};out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for u,v in edges:
  if v not in out[u]:out[u].add(v);indeg[v]+=1
 todo=[v for v in vertices if not indeg[v]];count=0
 while todo:
  u=todo.pop();count+=1
  for v in out[u]:
   indeg[v]-=1
   if not indeg[v]:todo.append(v)
 assert count==len(vertices),[v for v,k in indeg.items() if k][:12]
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for f in sorted((R/folder).glob('*.json')):
  for n in json.loads(f.read_text()).get('nodes',[]):world.setdefault(n['id'],n)
world.update(ids)
todo=list(ids);seen=set();edges=set();baseline=set();unresolved=set()
while todo:
 n=todo.pop()
 if n in seen:continue
 seen.add(n)
 for q in world[n].get('prerequisites',[]):
  if q.startswith(('mathlib:','tauceti:')) and q not in stageids:baseline.add(q);continue
  edges.add((q,n))
  if q in world:todo.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,unresolved
edges|={(world[n]['parentStageId'],n) for n in seen if world[n].get('parentStageId')}
edges|={(q['supplier'],n) for q in p['requests'] for n in q['neededBy']}
def stageof(v):
 visited=set()
 while v in world and v not in visited:visited.add(v);v=world[v]['parentStageId']
 return v
required={(q,RID+':'+s['key']) for s in d['stages'] for q in s['requires']}
required|={(stageof(q),stageof(n)) for n in ids for q in ids[n]['prerequisites'] if q in world or q in stageids and not q.startswith(('mathlib:','tauceti:TauCeti.AlgebraicGeometry.'))}
required|={(stageof(q['supplier']),stageof(n)) for q in p['requests'] for n in q['neededBy']}
required={e for e in required if e[0]!=e[1]}
following=collections.defaultdict(set)
for u,v in se:following[u].add(v)
def reachable(u,v):
 todo=[u];seen=set()
 while todo:
  w=todo.pop()
  if w==v:return True
  if w not in seen:seen.add(w);todo.extend(following[w])
 return False
assert all(reachable(*e) for e in required),[e for e in required if not reachable(*e)]
comp=json.loads((S/'Review-Compilation.json').read_text())
assert comp['exitCode']==0 and comp['errors']==0 and comp['warnings']==17
assert comp['sourceSha256']==hashlib.sha256(lean.encode()).hexdigest()
assert comp['stdoutSha256']==hashlib.sha256((S/'Review-Lean.stdout').read_bytes()).hexdigest() and comp['stderrSha256']==hashlib.sha256((S/'Review-Lean.stderr').read_bytes()).hexdigest()
assert p['prototype']['compiled'] and not p['prototype']['geometricSignaturesCompiled']
assert p['prototype']['compilationReceipt']==comp
report={'base':BASE,'readerParityChecked':False,'readerReason':'Reader is outside review deliverables; changed statements require orchestrator regeneration before promotion.','checker':summary,'errors':errors,'warnings':warnings,'routedItems':43,'omittedNodes':92,'nativeNodes':3,'stageDAG':dag(stages,se),'ownNodeDAG':dag(ids,{(q,n) for n in ids for q in ids[n]['prerequisites'] if q in ids}),'scopedDAG':dag(stageids|seen,se|edges),'requiredSupplierPairs':len(required),'unresolved':[],'ownSkippedLinks':[],'currentAssemblyPendingLinks':expectedPending,'combinedSupplierAssemblyPendingLinks':[],'combinedSuppliers':sorted(needed),'foreignMathematicalPayloadsPreserved':True,'newEdgesIncidentOnlyToOwnRoadmap':True,'compilation':comp,'immutableReadPaths':len(immutable.READS),'immutableReadPathSha256':hashlib.sha256(json.dumps(sorted(immutable.READS)).encode()).hexdigest()}
print(json.dumps(report,indent=2))

```
