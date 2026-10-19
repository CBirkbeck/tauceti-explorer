# Independent review of K2SymbolsBrauer T.4

**Accepted as a complete target-level planning pass, with coverage remaining
`planned`.** The arbitrary-residue complete-DVR supplier is an explicit gap;
the three owner requests remain open. Acceptance does not supply those results
or certify an implementation.

Issue #10788; reviewer Codex, session `codex-lTFdvm`; 19 October 2026.
The input was written by Codex session `codex-AufC3B` for #10815, submitted in
#10949. This reviewer did not write that input. The current queue and input
restrict this job to T.4; the older embedded prompt's T.5–T.7 scope and
lemma-level instruction are superseded by that scope and `detail.json`.

## Inventory and corrections

Checked all 12 new nodes (4 lemmas, 6 theorems, 2 comparisons), 26 retained
target contracts, 28 pinned baseline entries, four planets, one gap and three
requests. No nodes were added or removed. Every new node keeps
`implementationStatus: unchecked`. The continuation imports existing public
identifiers and supplies proof completions; its `proofMap` describes their
consolidation at assembly.

Changes made by this review:

1. Refined the resultant citation to include the domain, splitting and
   degree-bound hypotheses and both degree indices. The norm calculation uses
   the theorem after mapping to a splitting field and taking the second index
   to be the other polynomial's degree.
2. Made the scalar towers and algebraicity hypothesis of `Place.restrict`
   explicit, and distinguished the finite-dimensionality hypothesis of its
   finite-fibre theorem. These native interfaces do not themselves require
   `IsFunctionField`.
3. Recorded the nontrivial-ring hypothesis of `degree_modByMonic_lt`. It is
   satisfied in every use over a field here. No baseline citation was removed
   or replaced; all 28 now record the independently checked source line.
4. Brought the suggested file into the current compact statement form: added
   the standard opening note, used `import Mathlib` with the two Tau Ceti
   imports, and removed numerical examples and the example merely restating
   native zero-divisor evaluation. The mathematical checks remain in the reader.
5. Named the proved local adapter `tame_argument_ord` and the direct
   specialization `weierstrass_eval_principal_reciprocity`. The pinned instance
   supports every affine Weierstrass function field, so the specialization
   does not need ellipticity. Its elliptic case is the requested existing
   milestone. The packet's comparison sketch and reader now say this exactly.
6. Synchronized the reader's Lean inventory and inherited-source discussion.
   The two general reciprocity theorems remain admitted, and the specialization
   inherits the admission of the general evaluation theorem.

## Node verdicts

All identifiers in this table have prefix `K2SymbolsBrauer:T.4/`. “Verified”
means that the mathematical planning statement and proof dependencies were
checked, including any recorded supplier gap.

| Node | Verdict | Check that determines the verdict |
| --- | --- | --- |
| `degree-filtration-generation` | verified | The Steinberg expansion has the stated signs. Mixed constant entries and the repeated-entry identity survive integrally; the supplied T.2 interface is skew commutativity. |
| `bass-tate-filtration-assembly` | verified | Quotient sections and descending finite-degree induction give exactness. Leading-coefficient specialization retracts constants; infinity is excluded from the direct sum. |
| `prime-to-p-detection` | verified | The existing GF.0 field construction is used with primes other than p. Finite presentation descends a zero relation; any simple norm tower gives its prime-to-p annihilator without using tower independence. |
| `tower-splitting-formula` | verified | Simple base change is iterated over a finite normal hull, with inseparable multiplicities. Its degree, rather than the degree of a possibly nonnormal E, annihilates tower differences. |
| `prime-degree-residue-descent` | verified | Both cases of ef=p, the four generated-symbol calculations and finite descent are covered. Ramification indices divide the prime-to-p degree, and Bézout replaces cancellation in a Milnor group. The DVR support remains conditional. |
| `constant-extension-completion` | verified | Finite normalization and the requested completion export supply field factors with multiplicity one, including inseparable constant extensions and infinity. Only the prime-degree residue square is used before Kato. |
| `kato-tower-comparison` | verified | The commuting square uses the norm with base E. Normal-hull torsion, prime-to-p detection and induction through the compositum of the first two prime-degree fields compare arbitrary towers. The compositum equals the top field only in total degree p². |
| `finite-transfer-base-change` | verified | Composition series give local Artinian module lengths. The two independent p-radicals example separates length p² from nilpotence index 2p−1. This general theorem follows Kato. |
| `complete-residue-descent` | verified | The componentwise lattice identities include the degrees of l_i/L_j; a residue compositum need not exhaust l_i. Kernel/cokernel multiplicities justify integer-length cancellation. Finite descent gives the required prime-to-p annihilators. Conditional on DVR.0–DVR.3. |
| `finite-normalization-residue` | verified | Finite integral closure justifies completion into fields with multiplicity one and unchanged residue fields. The plan does not assert this for every inseparable extension of an arbitrary DVR. |
| `integral-curve-reciprocity` | verified | Integral Kato norms and the preceding residue square permit pushdown to the projective line. Regular models suffice over imperfect constants. Suslin's torsion-quotient theorem is not used as the integral theorem. |
| `reciprocity-evaluation-compatibility` | corrected | The normed sign includes the residue degree; the residue argument has order zero. Disjointness gives the exact native evaluation quotient. Named local and Weierstrass adapters now match the reader and suggested file. |

The inherited contracts were read in the predecessor and against their full
statements in the reader. In particular simple transfer base change permits
arbitrary constant extensions before Kato, while general finite transfer base
change follows Kato. The generated-symbol four-case calculation retains the
norm of a uniformizer and its unit/sign correction. The order is
T.3:symbols → T.4 → T.3:localization-comparison; no consumer is used as a premise.

## Pinned baseline verification

Tau Ceti is `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib is
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The actual statements and relevant
section hypotheses were read, not inferred from declaration names. The Tau Ceti
files used by the shared pinned build match the pinned source files. Paths and
line numbers below are relative to each library; fully qualified names and
contract descriptions are also recorded in `baseline.declarations`.

| Declaration | Source at its pin | Result of checking the intended use |
| --- | --- | --- |
| `TauCeti.Place.finite_setOf_ord_ne_zero` | `TauCeti/FieldTheory/FunctionField/Place/Zeros.lean:461` | Explicit function-field hypothesis; finite support for each nonzero symbol entry. |
| `TauCeti.Place.ratFuncEquiv` | `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean:330` | Polynomial primes together with infinity. |
| `TauCeti.Place.heightOneSpectrumEquiv` | `TauCeti/FieldTheory/FunctionField/AffineModel/Prime.lean:140` | Affine finite-place bijection; order and degree comparisons are separate results. |
| `Ideal.sum_ramification_inertia_eq_finrank` | `Mathlib/RingTheory/RamificationInertia/Basic.lean:72` | Finite flat algebra formula, giving module rank; the integral-closure lattice is additional input. |
| `Algebra.norm` | `Mathlib/RingTheory/Norm/Defs.lean:61` | Determinant norm; default value outside the finite-free case is acknowledged. |
| `Algebra.norm_norm` | `Mathlib/RingTheory/Norm/Transitivity.lean:207` | Free-module scalar tower; applies to finite field towers. |
| `TauCeti.Divisor.eval_eq_prod_normResidue` | `TauCeti/FieldTheory/FunctionField/Divisor/Eval.lean:192` | Requires a unit at the divisor support. |
| `AlgebraicGeometry.Scheme.ord` | `Mathlib/AlgebraicGeometry/OrderOfVanishing.lean:52` | Locally Noetherian integral scheme; value zero outside codimension one. |
| `TauCeti.Place.adicOfIrreducibleResidueFieldEquiv` | `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean:259` | Polynomial quotient to native residue field, as a constant-field algebra equivalence. |
| `TauCeti.Place.isUniformizer_adicOfIrreducible` | `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean:246` | Irreducible polynomial is its finite-place uniformizer. |
| `TauCeti.Place.ord_infty` | `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean:125` | Negative rational-function degree. |
| `TauCeti.Place.isUniformizer_infty` | `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean:131` | Uses X⁻¹. |
| `TauCeti.Place.inftyResidueFieldEquiv` | `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean:199` | Constant field to infinity's residue field. |
| `TauCeti.Place.restrict` | `TauCeti/FieldTheory/FunctionField/Place/Extension/Basic.lean:283` | Algebraic ambient extension and compatible scalar towers; description refined. |
| `TauCeti.Place.finite_setOf_restrict_eq` | `TauCeti/FieldTheory/FunctionField/Place/Extension/Fibre.lean:316` | Finite-dimensional ambient extension; description refined. |
| `TauCeti.Place.normResidue` | `TauCeti/FieldTheory/FunctionField/Place/Residue.lean:140` | Norm of the residue of an order-zero unit. |
| `TauCeti.Divisor.principal` | `TauCeti/FieldTheory/FunctionField/Divisor/Principal.lean:134` | Native principal divisor of a unit, with the function-field witness. |
| `Algebra.norm_eq_prod_roots` | `Mathlib/RingTheory/Norm/Transitivity.lean:258` | Splitting hypothesis, root multiplicities and relative-degree exponent retained. |
| `Polynomial.resultant_eq_prod_eval` | `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:478` | Domain, splitting, degree bound and indexed resultant; description corrected. |
| `IntermediateField.adjoinRootEquivAdjoin` | `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:417` | Integral element gives the simple-extension quotient equivalence. |
| `Polynomial.modByMonic` | `Mathlib/Algebra/Polynomial/Div.lean:137` | Monic remainder; all uses have a monic polynomial. |
| `Polynomial.degree_modByMonic_lt` | `Mathlib/Algebra/Polynomial/Div.lean:147` | Monic divisor and nontrivial coefficient ring; description refined. |
| `WeierstrassCurve.Affine.isFunctionField` | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/Finrank.lean:183` | Applies without ellipticity. |
| `TauCeti.Divisor.eval` | `TauCeti/FieldTheory/FunctionField/Divisor/Eval.lean:118` | Total evaluation; the comparison is restricted to admissible support. |
| `TauCeti.Divisor.isUnitAtSupport_iff_disjoint` | `TauCeti/FieldTheory/FunctionField/Divisor/Eval.lean:310` | Exactly the disjointness condition needed for evaluation. |
| `TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable` | `TauCeti/RingTheory/IntegralClosure/PurelyInseparable.lean:167` | Finite-variable polynomial ring, its fraction field and a finite purely inseparable extension; no separability added. |
| `TauCeti.Place.normResidueOrOne` | `TauCeti/FieldTheory/FunctionField/Place/Residue.lean:153` | The default is bypassed by the proved order-zero adapter. |
| `TauCeti.Place.degree` | `TauCeti/FieldTheory/FunctionField/Place/Basic.lean:469` | Residue finrank; function-field finiteness is used for the classical interpretation. |

The proposed supplier's supplementary audit was checked too: the spectral norm
statements supply an algebraic extension norm, uniqueness and finite-dimensional
completeness, without finite residue fields. They do not supply the normalized
integer value group or integral lattice. Native `Valuation.ord` and
`TauCeti.residueFieldEquivMaximalIdealGradedOfUniformizer` provide the stated
order and graded-piece interfaces. The post-pin
`TauCeti.Algebra.norm_quotient_mk` was read at current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; it must be reused by DVR.2 and is
not assumed available in the pinned Lean file.

## Sources and inherited findings

Every node's locator and `match` were checked in the public versions recorded
by the packet. The [author-hosted K-book draft](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)
is dated 29 August 2013; its hash matches the packet. The relevant checks are
III.6.1.4, III.6.5.3, Ex.III.6.2, III.7.1–7.6.4 and Ex.III.7.1–7.10
(combined PDF pp.240,244,251,253–258,265–266; draft pagination eight pages earlier).
Its first-slot residue convention is converted explicitly to the last-slot
convention used here. The polynomial filtration, simple-transfer formula and
Kato comparison are distinguished from the proof completions derived here.

In [Suslin's primary English scan](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=1759&what=fullteng),
§1, Lemmas 1.3–1.9 and Corollary 1.10 occupy printed pp.591–594/PDF pp.3–6;
§2, Lemmas 2.1–2.5 and Theorem 2.6 occupy pp.595–597/PDF pp.7–9. The switch
to groups modulo torsion is on p.594, after Corollary 1.10. Thus the reader's
integral reciprocity is correctly justified by its preceding integral norm
targets, with Suslin supplying the pushdown method.

The Stacks statements and their proofs were checked with the chapter PDF pages
and hashes in the packet: [02MJ](https://stacks.math.columbia.edu/tag/02MJ),
Lemma 10.121.8, Commutative Algebra p.295;
[04GH](https://stacks.math.columbia.edu/tag/04GH), Lemma 10.153.4, p.414;
[032W](https://stacks.math.columbia.edu/tag/032W), Lemma 10.162.8, pp.446–447;
[09E8](https://stacks.math.columbia.edu/tag/09E8), Remark 15.113.6, More on
Algebra p.334; and [09EM](https://stacks.math.columbia.edu/tag/09EM), Remark
15.116.1, pp.342–343. The finite separable scope of 09E8 is respected; complete
normalization uses the Nagata statement. None of these is misrepresented as
already stating the entire componentwise lattice identity derived in DVR.3.

The current packet has no `sourceIssues` entries. Inherited findings stay at
their predecessor identifiers; this review does not duplicate or amend them.
Their relevant public-draft uses were checked as follows:

| Finding | Review of its use in this continuation |
| --- | --- |
| E5 | Confirmed the overly restrictive generation assertion in Ex.III.6.2 (PDF p.251/draft p.243); the corrected two-entry reduction and repeated-entry case suffice. |
| E6 | Confirmed the symbol-length correction in the III.7.4 proof (PDF p.255/draft p.247). |
| E7 | Confirmed that the representative equality in III.7.4.1 is in F[t], not necessarily F (same page). |
| E8 | Confirmed that the final norm in III.7.6.4 has base E (PDF p.258/draft p.250). The author errata file was not freshly available; no new claim about that file is made. |
| E10 | Confirmed the scope limitation of Ex.III.7.7 (PDF p.265/draft p.257) for the completion step in Ex.III.7.9 (PDF p.266/draft p.258). The arbitrary-base simple formula is supplied explicitly. |
| E11 | Confirmed the convention issue in Ex.III.7.10 (PDF p.266/draft p.258) against III.7.3 (PDF p.254/draft p.246). The reader retains the specialization twist and repeated-uniformizer sign. |
| E13 | Independently checked the two-radical Artinian calculation. No restricted book edition was read or recertified. |

No additional definite source mistake was found. In particular, the
compositum assertion on draft p.250 is made for two towers of length two, where
it is valid; the continuation's longer-tower induction is an elaboration.
All repository descriptions are in our own words, with no source excerpts.

## API, tests, ownership and findings

The retained residue section has 4 API items and 4 tests; simple transfer has
9 and 5; the general norm has 8 and 4. These 21 API items and 13 tests cover
representatives, independence, projection, degree, low degrees, base change,
field equivalences, signs and inseparability. Each construction has at least
three tests that distinguish a plausible wrong construction. The four proposed
DVR contracts separately have 19 API items and 12 tests. The fierce
characteristic-two example catches a false separable-residue assumption, and
the two ramified quadratic extensions catch the false claim that the residue
compositum exhausts the extension residue. No new data definition is attempted
in Lean. The checker counts zero API/tests on the 12 new theorem/proof nodes
because these construction outlines belong to imported targets and the
explicit supplier brief.

The four planets name the central exact sequence, norm theorem, base-change
theorem and reciprocity theorem. The reviewed library audit for T.4 is
consistent with the plan: native place/order/support and norm infrastructure
are reused; Milnor transfer and general reciprocity are not implemented there.

Current read-only TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti were checked,
including relevant README/Suggested statements and the newer field-theory
directions. AlgebraicCurves owns finite normalization, place completion and
the regular-model dictionary. EllipticCurves owns its existing evaluation
milestone. LocalFieldsRamification's finite-residue hypotheses do not supply
the arbitrary-residue DVR contracts. The registered Temkin-style
`LocalFieldsRamificationPartII` keeps its GF.0–GF.6 direction; only its actual
GF.0 field construction is imported here. The distinct proposed DVR module
remains a routing gap.

| Confirmed red-team finding | Verdict within this job |
| --- | --- |
| RT-AREA-ktheory-1/12 | Addressed: T.4 exports integral Kato norms and all-degree reciprocity to M.4 without importing M.4 as a premise. |
| /28 and RS-28 | Addressed: pre-Kato simple base change and prime-degree residue square precede transitivity; general base change and norm–residue compatibility follow it. T.3's Quillen comparison imports the T.4 result and existing Quillen transfers. |
| /32 | Addressed: AlgebraicCurves 12A/B/D supply the point/place/residue/divisor dictionary; EllipticCurves Layer2 is an imported milestone with an explicit compatibility specialization. |
| /8, /9, /26, /27 | Outside T.4: the T.5/T.7 obligations remain with their separate jobs. This review makes no completion claim for them. |

## Remaining owner actions and checks

The maintainer must route the distinct arbitrary-residue complete-DVR Part II
module with its four exact contracts, obtain the three specified upstream
exports, and consolidate continuation targets at assembly. The finer
finite-normalization completion export belongs with AlgebraicCurves Layers2/5;
its Layer12 dictionary and EllipticCurves Layer2 compatibility retain their
existing owners. These are the precise recorded dependencies, not unresolved
contradictions in the accepted planning pass. Coverage must stay `planned`
until they are supplied.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.4.json`
  with the pinned declaration index: **0 errors, 0 warnings**.
- `python3 research/blueprint/intake.py check-files` on the five submitted
  deliverables: **0 problems**.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/K2SymbolsBrauer--T.4.lean`:
  passes; no admitted data definitions.
- `lean-check research/blueprint/suggested/K2SymbolsBrauer--T.4.lean` at the
  pins: exit 0, exactly two `sorry` warnings, for the general product and
  evaluation reciprocity targets. The local adapter is proved; the direct
  Weierstrass specialization depends on the admitted evaluation target.
- `git diff --check`: passes. The suggested file has 87 lines, well below the
  5,000-line limit. No upstream or other job's file was edited.
