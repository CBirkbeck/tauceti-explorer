# Independent review of EllipticRegulators:ER.1

Accepted on 2026-10-06 by Codex, session `codex-mlKcrR`, for job
`REV-EllipticRegulators--ER.1` ([#6434](https://github.com/CBirkbeck/tauceti-explorer/issues/6434)).
The input plan was written by session `codex-5umW8m` for
[#6482](https://github.com/CBirkbeck/tauceti-explorer/issues/6482); this reviewer
did not write that plan. The packet records the reviewer as
`independent-review-REV-EllipticRegulators--ER.1`.

This is acceptance of a complete **planning pass**, with ER.1 coverage
`planned`. The five precise supplier requests remain open. Neither the
geometric dependency graph nor the suggested proofs are claimed complete.
There is no unresolved contradiction in the retained plan.

## Counts and scope

| Item | Input | Reviewed |
| --- | ---: | ---: |
| Local nodes | 7 | 7 |
| Definitions / constructions / theorem targets | 1 / 2 / 4 | 1 / 2 / 4 |
| Imported parent targets | 3 | 3 |
| API entries | 25 | 27 |
| Unit-test entries | 13 | 13 |
| Planets | 6 | 6 |
| Baseline declarations | 15 | 19 |
| Node source citations | 10 | 10 |
| Gaps / supplier requests | 0 / 5 | 0 / 5 |
| Source-issue entries | 0 | 0 |

All seven nodes have individual verdicts in `review.checked`. Six were
corrected and one was verified without modification. No nodes were added or
removed, so no `addedBy` annotation is needed. Target-level granularity is
appropriate: the coordinate formulas within a target are routine consequences
of its construction or integral matrix calculation. The actual analytic,
homological and comparison constructions are explicitly requested from their
owners, rather than hidden inside a scalar definition.

## Sources and hypotheses

The publicly accessible versions inspected were
[Brunault's thesis, arXiv:math/0602186v1](https://arxiv.org/pdf/math/0602186v1)
and [Dokchitser–de Jeu–Zagier, arXiv:math/0405040v2](https://arxiv.org/pdf/math/0405040v2).
The latter is the preprint, not the published journal version. The downloaded
PDF SHA256 digests agree with the packet:

- Brunault: `8fd73faba5db08328c2884d9f35b79bc528145428766444f3eb8097f3b494fb7`.
- DJZ: `a9d5c2cce63f2351991789add5ac9cd213b9783b9cbb0e648313e314eadb3ccf`.

I read Brunault §1.2, pp.20–27, including the formulas, Remarque 20 and
Proposition 26 with its proof; printed and PDF page numbers agree. Pages 22
and 26 were also checked visually. I read DJZ §3, pp.4–7, including (3.3),
(3.4), the integral anti-invariant homology discussion and Remark 3.14.
Every one of the ten packet excerpts matches the source at its locator.

| Node suffix | Citation checked | Scope of support |
| --- | --- | --- |
| `oriented-regulator-period-data` | Brunault Remarque 20, (1.40), p.22 | Actual integrals on an oriented basis and normalized coordinates. |
| `oriented-basis-transport` | Brunault (1.36), p.21; Remarque 20, (1.40), p.22 | Oriented basis choice; the explicit matrix formulas are derived in the proof sketch. |
| `conjugate-oriented-periods` | Brunault Remarque 20, (1.40), p.22; DJZ Remark 3.14, p.7 | Orientation and the full disjoint union of embedding components; the paired formulas follow by integration naturality. |
| `real-period-shape` | Brunault Remarque 20, (1.40)–(1.41), p.22 | Real nonzero modulus, with sign derived from the integral conjugation relation. |
| `primitive-real-regulator-cycles` | Brunault Remarque 20, p.22, (1.48), p.23; DJZ paragraph before (3.4), p.5 | Integral basis and integral anti-invariants; primitive kernels and index are explicit arithmetic deductions. |
| `exponential-conjugation-coordinates` | Brunault (1.36)–(1.37), p.21; Remarque 20, p.22 | Exponential presentation from which the coordinate identities follow. |
| `regulator-period-handoff` | Brunault Proposition 26, (1.64), p.26; Remarque 20, (1.40), p.22; DJZ Remark 3.14, p.7 | First normalized period one, and all-embedding rank conventions. |

The packet distinguishes a theorem stated in a source from a routine
consequence it derives. No passage about a real curve is used to assert a
geometric conjugation comparison at arbitrary complex embeddings without the
parent/C6 supplier contract. The real statements retain a real differential,
a primitive fixed cycle and the displayed integral conjugation relation.
`RegulatorPeriods` alone asserts only real independence and positive
orientation; a scalar example is not a claim of geometric realization.

There were no existing `sourceIssues` to adjudicate and I found no source
mistake in the inspected passages. In particular, the integral anti-cycle's
factor two and the distinction between all embeddings and infinite places are
preserved. No erratum is inferred from a difference in coordinate conventions.

## Pinned baseline verification

The exact pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
All original fifteen and four added entries were checked by reading their
declarations and ambient hypotheses at these exact pins. No original citation
needed removal or replacement.

| Declaration(s) | Pinned module | Confirmed boundary |
| --- | --- | --- |
| `PeriodPair`, `.lattice`, `.latticeBasis`, `.latticeEquivProd` | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean` | Real-independent ordered periods, their integral span and genuine integral coordinates. Orientation and geometric integration are additional inputs. |
| `UpperHalfPlane` | `Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean` | Strictly positive imaginary part. |
| `Matrix.SpecialLinearGroup` | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | Existing determinant-one matrix group, specialized here to two-by-two integer matrices. |
| `Function.Periodic.qParam`, `.norm_qParam`, `.norm_qParam_lt_one`, `.qParam_ne_zero` | `Mathlib/Analysis/Complex/Periodic.lean` | Exponential and exact norm; the strict bound requires positive real period parameter and positive imaginary part. ER.1 uses parameter one. |
| `NumberField.ComplexEmbedding.conjugate`, `.involutive_conjugate` | `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean` | Conjugation of actual field embeddings and its involution; not a curve/homology comparison. |
| `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank` | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` | For a number field, `r1 + 2*r2 = finrank ℚ K`. The geometric rank comparison is imported separately. |
| `AddCircle.prodFundamentalGroupMulEquiv` | `TauCeti/AlgebraicTopology/UniversalCover/Torus/FundamentalGroup.lean` | Fundamental group of two real circles with nonzero periods and chosen lifts. It does not supply singular first homology. |
| `WeierstrassCurve.Affine.invariantDifferential` | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean` | Algebraic Kähler differential given by inverse denominator times `D genericX`; no analytic pullback or regularity comparison follows just from this definition. |
| `ModularGroup.S`, `.T` (added) | `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean` | Existing matrices `(0,-1;1,0)` and `(1,1;0,1)`, including determinant-one proofs. |
| `Subgroup.closure` (added) | `Mathlib/Algebra/Group/Subgroup/Lattice.lean` | Generated subgroup; the displayed `to_additive` attribute supplies `AddSubgroup.closure`. |
| `Subgroup.index` (added) | `Mathlib/GroupTheory/Index.lean` | Cardinality of cosets, with infinite index represented by zero; `to_additive` supplies `AddSubgroup.index`. |

The last two packet references intentionally name the source declarations that
the baseline index recognizes. Their `provides` and `checked` fields explicitly
record the generated additive counterparts used in Lean. Those counterparts
also elaborate at the pin; they are not new ER.1 definitions.

The reviewed library audit (`AUDIT-28`, ER.1 entry in
`data/library-coverage.json`) agrees with this boundary: scalar period/lattice
and exponential APIs already exist, while the actual elliptic analytic
uniformization, singular integration and oriented pairing interface do not.
The reviewed plan reuses the former and requests the latter. I also read the
upstream AlgebraicTopology and UniversalCovers roadmaps to check the torus
supplier scope.

## Individual node findings and corrections

1. **Chosen oriented period data — corrected.** The structure has exactly an
   existing `PeriodPair` and positivity of the period ratio. Its API already
   covers coordinates, a constructor, extensionality, scaling and lattice
   interoperability. Added `scale_one` and `scale_mul`, making the nonzero
   scalar action explicit. The latter applies `c` and then `d`, producing
   `d*c`; the normalisation compatibility rescales the point by the same
   scalar as the differential. The five tests cover exact square values,
   identity scaling, compatibility and the forbidden negative orientation.

2. **Oriented basis transport — corrected.** For `M=(a,b;c,d)`, the period
   column is transformed by `J M J`, where `J` swaps coordinates. Therefore
   applying `N` and then `M` gives `M*N`, as stated, and inverse integer
   transport preserves the lattice. The denominator `c*tau+d` cannot vanish
   in the upper half-plane: if `c≠0` vanishing would make `tau` real, while
   if `c=0` determinant one forces `d≠0`. The imaginary-part formula gives
   orientation preservation. Strengthened the existing inverse test with
   the explicit `S` formulas for `tau` and every point coordinate, and the
   lattice test with `T`'s translation, unchanged coordinate and unchanged
   modulus. These distinguish plausible wrong entry-order conventions.

3. **Conjugate oriented periods — corrected.** Conjugation reverses
   orientation, so the second period must be negated. This gives
   `tau_bar=-conj(tau)` and `q_bar=conj(q)`, while point normalisation just
   conjugates. The lattice statement and involution follow from integral
   negation and conjugation. Strengthened the orientation test with the
   nonsymmetric datum `rebase(square,T)`: `tau=1+i` must become `-1+i`.
   Added basis transport as the direct prerequisite of this test datum.
   The four tests also check the square, involution and scalar conjugation.
   At a real embedding the conjugate-oriented basis need not equal the
   chosen real-adapted basis; the packet correctly says so.

4. **Real period shape — verified.** Dividing the stated conjugation relation
   by the nonzero real first period gives `2*Re(tau)=m`. Replacing the second
   cycle by itself plus `k` times the first changes `m` by `2k`, allowing
   reduction to zero or one. Substitution into the exponential gives positive
   or negative real `q` respectively, with its strict norm bound. Existence
   of the adapted geometric basis remains the C6/parent input, not a
   consequence asserted for every scalar pair.

5. **Primitive real regulator cycles — corrected.** Added real period shape
   as a direct prerequisite. Conjugation acts by `(u,v)↦(u+m*v,-v)`; its
   negative kernel solves `2u+m*v=0`. For `m=0` the primitive vector is
   `(0,1)`, and for `m=1` it is `(-1,2)`, giving normalized imaginary periods
   `i*y` and `2*i*y`. The latter must not be replaced by the rational vector
   `(-1/2,1)`. Strengthened `eigensublattice_index_two` from an even-coordinate
   characterization to include the actual subgroup index equal to two.
   Mapping the second coordinate modulo two is surjective and its kernel is
   the span of `(1,0),(-1,2)`, proving the two-coset assertion. Added the two
   pinned closure/index baselines rather than a private index definition.

6. **Multiplicative conjugation coordinates — corrected.** Conjugating
   `exp(2*pi*i*z)` gives point transport `x↦1/conj(x)`, whereas the paired
   modulus is `conj(q)`. A factor `q^n` becomes `conj(q)^(-n)`, so the
   inherited quotient map is well-defined. Added conjugate oriented periods
   as its direct modulus supplier. When `q>0` and `norm(x)^2=q`, the image
   is `x/q`; the second real circle is fixed in the quotient, not on its
   representatives. No new quotient/uniformization construction is planned.

7. **Regulator period handoff — corrected.** Actual integration followed by
   division by the first period gives periods exactly `1,tau`. Added
   conjugate oriented periods as the direct prerequisite used for paired
   bases. Each real embedding contributes rank one to each sign and a pair
   of nonreal embeddings contributes rank two to each sign; hence the rank
   per sign is `r1+2*r2=[F:ℚ]`. The normalized differential is inherited from
   the analytic/differential comparison, not chosen as an arbitrary matrix.
   The universal regulator/Chern/Deligne factor, including `2*pi`, is left
   to ER.2 as required.

These are the four added local dependency edges, two new API entries and
three strengthened existing tests. The suggested file also imports the
existing index module and replaces two misleading comment labels with the
actual supplier request and imported parent target. There were no other
mathematical corrections, removed source citations or new planets.

## Closure, owners and the confirmed red-team finding

I checked the three parent target statements in `EllipticRegulators.json`:
`complex-uniformisation`, `the-q-parameter-and-the-multiplicative-presentation`
and `all-embeddings-and-the-conjugation-action`. They are imports, not copies
of newly planned geometry. The five requests specify respectively:

- R12.1: actual analytic group uniformization, origin/group law and invariant
  differential compatibility. The current R12.1 part has no supplying nodes.
- C5: integral integration and its embedding/conjugation naturality before
  complexification. Its exact node `repair-proper-de-rham-betti` supplies the
  smooth proper complexified comparison isomorphism, which alone does not
  fulfill this stronger integral contract.
- C6: elliptic Hodge line, integration as an integral isomorphism to the
  period lattice, projected straight-path evaluation, polarized orientation
  and real/all-embedding naturality.
- Upstream AlgebraicTopology Stage 5: actual singular first homology of the
  torus, coordinate loops, matrix/homeomorphism naturality and transport.
- Upstream AlgebraicTopology Stage 6: oriented integral intersection pairing
  and the signs under preserving/reversing orientation.

Their `neededBy` lists identify the consumers, so a missing supplier result is
visible rather than assumed proved. These contracts and the routine scalar
arguments account for each target; ER.1 is `planned`, not `closed`.

I read confirmed finding `RT-AREA-ktheory-2/8` and its independent verification.
Both this packet and the existing ER.1 reader assign general de Rham–Betti
comparison to C5 and the elliptic Hodge/period acceptance computation to C6.
ER.1 retains choices of oriented periods, `q`, conjugation and regulator
normalization. PS.0 must reuse the same C6 elliptic computation. The packet's
`restructure` proposal correctly records that assembly must replace the parent
mixed comparison/deck-group alias with these genuine supplier contracts.
No general Hurewicz theorem is newly planned here, and a deck group is never
silently declared to be singular homology.

## Reader addendum and orchestrator follow-through

The ER.1 reader was read and checked, but it is not an editable deliverable
of this review issue. This report supplies the additions for assembly:

- Its API/baseline counts should become 27/19; nodes, tests and planets stay
  7/13/6. Include the two scalar-action laws and the strengthened `S`, `T`
  and nonsymmetric-conjugation tests from the reviewed suggested file.
- The index-two declaration must include
  `(AddSubgroup.closure ({(1,0),(-1,2)} : Set (ℤ × ℤ))).index = 2`, as well
  as the existing even-second-coordinate characterization. Its proof is the
  modulo-two kernel/coset calculation above.
- Include the four added direct dependencies and the accepted review
  boundary: five outstanding supplier contracts, no implementation claim.

Questions/actions for the orchestrator: route the five contracts to their
existing owners; apply the recorded parent/PS.0 ownership correction during
assembly; and carry this addendum into the reader when that path is authorized.
None requires a new mathematical owner or changes another packet in this PR.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticRegulators--ER.1.json`
reports zero errors and zero warnings. The suggested file elaborates through
`lean-check` at the exact pinned Mathlib with exit code zero and 52 warnings,
all for `sorry`. These are signature checks with planning placeholders, not
completed unit-test proofs. The shared Tau Ceti checkout was newer than the
Tau Ceti pin, so its baseline statements were read using `git show` at the
exact pin; the suggested file imports only pinned Mathlib modules and does not
rely on that newer Tau Ceti code. Packet declarations, API entries and all
13 labelled examples agree with the suggested file. `git diff --check` is
clean. The six planet names identify central definitions, constructions and
theorem targets; source locator text is not used as a planet name.
