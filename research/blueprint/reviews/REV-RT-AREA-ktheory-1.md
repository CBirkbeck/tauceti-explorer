# Independent verification: RT-AREA-ktheory-1

Job REV-RT-AREA-ktheory-1, issue #1520. Codex — codex-hjdg0j, 2026-09-24.

**48 findings confirmed; finding 38 rejected.** The confirmations comprise 6 high,
32 medium and 10 low findings. Several confirmations have substantially corrected
scope or repairs. The companion [review JSON](../redteam/RT-AREA-ktheory-1.review.json)
contains an individual reason for every one of the 49 finding IDs. Its qualified
reasons, rather than the red team's unmodified fixes, are the repair contract.

I did not write RT-AREA-ktheory-1 (Claude Code — cc-39fac3). I read the entire
issue before and after the claim; comment 5809449098 confirmed this session's
claim comment 5809447399. Only this report and the named review JSON are changed.
This verifies a research/planning audit; it neither implements the repairs nor
asserts that the mathematical results have been formalized.

## Evidence and method

The repository reading baseline was commit
`86933de6a3b459117ad381c5312adcd200b398c4`. I read all 49 input finding records,
the eight campaign roadmaps, the cited integrated K/H decomposition nodes,
affected supplier contracts, and the reviewed library-coverage entries. In
particular, I checked the AlgebraicTopology Serre/Hurewicz contracts, CFT Layers
5/10/12/14, the quadratic-form symbol comparisons, the curve dictionary and
elliptic reciprocity scope, and the crystalline/logarithmic, scheme-K,
Iwasawa, derived-sheaf and p-adic regulator interfaces.

Dependency tests use the **assembled atlas**, including promoted `data/links`,
accepted `data/restructure` proposals and integrated decompositions. Reading
`data/atlas.json` alone omits real suppliers. The read-only assembly contained
2,608 stages and 7,361 distinct prerequisite edges. I checked missing imports
and reverse paths, then tested 46 compatible candidate additions together:
none creates a directed cycle. This is a check of candidate edges between
existing stages, not a claim that unimplemented node splits are already valid.
The eventual fixer must recheck the edited stage and packet graphs, including
parents, forwarding links and removal of obsolete edges. The proposed
S.5 → K.6 edge does create a cycle and is explicitly excluded.

The pinned libraries are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. I read the cited declarations and
surrounding hypotheses, checking the Git blob hash of each of the 25 files read
against its pinned tree. Whole-tree text searches checked the missing building,
plus/Whitehead, norm-residue, log-Witt, spectral and topological-K packages;
positive name matches were inspected rather than counted as coverage. The
library-coverage audit is supporting evidence, not a substitute for opening a
declaration. Existing results were not inferred from current upstream PRs.

I inspected the public source passages listed below. This is a verification of
the specified claims and omitted proof inputs, not a fresh proof extraction of
every paper cited by all eight roadmaps. A source's reference to an external
proof remains a work item for the fixer. In particular, a named theorem,
unread proof boundary or paper-routing status does not certify proof closure.

## Corrections that affect the fix job

1. **Finding 1: orientation matters.** The Steinberg module alone is not always
   the virtual dualizing module of GL_n(O). Use the orientation twist of
   Putman–Studenmund Theorem C or an orientation-preserving subgroup and a
   proved descent argument. Integral finite generation cannot be inferred
   from rational duality. R.1 supplies the arithmetic duality/finiteness
   interface; N.3 assembles the Q-rank-filtration argument.
2. **Findings 4, 16, 20 and 44: coordinate the early construction split.**
   Waldhausen additivity and relative S-delooping precede H.5:S-delooping.
   Generic spectra, smash products, module/EM and truncation comparisons
   belong to H.5:spectra. Keep the late K.3 cofinality dependency and K.5's
   Waldhausen input explicit when extracting the early Quillen prefix.
3. **Findings 8, 9 and 27: one owner per map or proof.** M.3 owns the degree-two
   Galois/Tate comparison; T.7 owns its Hilbert-symbol normalization adapters.
   T.5 owns the degree-two tame sequence and elementary K2 examples; N.6 owns
   certificate machinery, N.8 its examples, and B.3 the independent special-value
   check. Chern-language in T.7 denotes a comparison with imported classes,
   not a second construction.
4. **Findings 12–14 and 39: retain generality and coefficients.** Smoothness
   of a normalization is not automatic over imperfect fields. The BGK
   field statement needs its Cartier/field-extension interface, and the
   general-field cohomological Steinberg relation cannot be replaced by a
   local/global Tate theorem. The universal log Witt model must be compared
   with the Hyodo–Kato model; the odd-p source does not establish p=2.
5. **Findings 5, 22, 33 and 37: separate topology theorems.** Simply connected
   homological Whitehead, simple-space Whitehead, obstruction theory and
   Cartan–Serre have different hypotheses. Upstream Stage 5 already supplies
   a Serre spectral sequence with fibre monodromy; arbitrary twisted total-space
   coefficients are a separate extension. H.6 is the single rational-Hurewicz
   owner; L.1 imports the simple-space theorem after verifying simplicity.
6. **Finding 26: use the correct set of primes.** The global sequence for
   K2(O_F,S) → K2(F) takes residues outside S. The relative sequence from
   O_F to O_F,S takes residues in S.
7. **Findings 31 and 36: correct actual mathematical assertions.** The
   double-origin counterexample is the affine plane. A Picard-group calculation
   disproves the copied line example. A weight-two regulator calculation does
   not determine higher-weight scalars; the all-weight universal-class
   comparison must precede the determinant factor.

## Existing imports that must be preserved

Finding 38 is rejected, rather than converted to a request for redundant edges:

| Needed input | Existing assembled route | Provenance |
| --- | --- | --- |
| Mixed-characteristic Hilbert symbol for L.3 | CFT Layer 5 → T.7 → L.3 | `data/links/tauceti_TauCetiRoadmap_ClassFieldTheory.json`, CFT-L68 |
| Finite/compact local duality for L.6 | CFT Layer 5 → ArithmeticGaloisDuality D7 → M.7 → L.6 | CFT-L57, accepted RS-08 forwarding |
| Global Brauer invariant input for T.7 | CFT Layer 10 → T.7 | CFT-L69 |
| Regular-curve/place dictionary for T.4 | AlgebraicCurves Layer 12 → T.4 | `data/links/tauceti_TauCetiRoadmap_AlgebraicCurves.json`, AC-L40 |

CFT Layer 5's contract includes the named mixed-characteristic Hilbert pairing,
Steinberg law, finite-module local duality and Euler characteristic. D7 explicitly
imports that finite theory before its compact/derived extension. A link-map row
saying no **direct** CFT use for L does not deny these paths.

Findings 27 and 32 remain confirmed for their other comparison/ownership gaps,
but their assertions that these particular CFT/curve imports are absent are
rejected within the reasons. Preserve their existing links and add only the
missing contracts. CFT Layer 14 is quadratic reciprocity; it is not an already
proved all-power-symbol comparison. Elliptic reciprocity is a special case of
the general proper-regular-curve theorem, not a substitute for it.

## Pinned declarations and relevant boundaries

The following are the main positive checks. Links point to the pinned commits,
not to a moving branch. Line numbers identify the definitions/statements read.

- [TauCeti/CategoryTheory/Exact/ExactStructure.lean:231](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/Exact/ExactStructure.lean#L231): ExactStructure; compare its axioms rather than creating a new carrier.
- [TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:162](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean#L162): ExactK0 with its essentially-small presentation.
- [TauCeti/Algebra/Category/ModuleCat/CartanMap.lean:195](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Category/ModuleCat/CartanMap.lean#L195): Finite-projective exact structure, essentially small and split.
- [Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean:37](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean#L37): Nerve; higher classifying-space comparisons remain work.
- [Mathlib/AlgebraicTopology/SingularSet.lean:67](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SingularSet.lean#L67): Geometric realization of simplicial sets.
- [TauCeti/AlgebraicTopology/LocalCoefficient.lean:41](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicTopology/LocalCoefficient.lean#L41): Local coefficient system; not yet twisted singular homology.
- [Mathlib/Topology/Homotopy/HSpaces.lean:66](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Homotopy/HSpaces.lean#L66): HSpace; does not assert all later associativity/simplicity theorems.
- [Mathlib/RingTheory/Bialgebra/Primitive.lean:46](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Bialgebra/Primitive.lean#L46): Primitive elements; the Milnor–Moore statement is a TODO.
- [TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean:46](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean#L46): S-unit finite-generation infrastructure, not the |S| rank correction.
- [Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:353](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean#L353): Ordinary-unit rank inputs for the finite-S argument.
- [Mathlib/NumberTheory/NumberField/ClassNumber.lean:58](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/ClassNumber.lean#L58): Finiteness of the number-field class group.
- [Mathlib/RingTheory/Finiteness/Projective.lean:28](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Finiteness/Projective.lean#L28): Finite-free retract for a finite projective module.
- [TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean:595](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Transvection.lean#L595): Finite-rank field generation; integer statement at line 584.
- [Mathlib/LinearAlgebra/Matrix/Transvection.lean:676](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Transvection.lean#L676): Transvection/diagonal factorization over a field.
- [TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean:148](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean#L148): SplitK0.finrankEquiv over a division ring, retaining smallness.
- [TauCeti/RepresentationTheory/CharacterTable/VirtualCharacter.lean:102](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/CharacterTable/VirtualCharacter.lean#L102): Virtual-character subgroup; not Green lifting.
- [Mathlib/Algebra/Module/ZLattice/Covolume.lean:72](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/ZLattice/Covolume.lean#L72): Covolume; formulas at 115 and 125 retain measure/lattice hypotheses.
- [Mathlib/NumberTheory/NumberField/Units/Regulator.lean:266](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/Regulator.lean#L266): Unit regulator, not the higher Borel regulator.
- [TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean:428](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean#L428): SL2(Z) reduction modulo d is surjective; not general SL1(D) approximation.

The additional inspected false positives/boundaries are the Clifford-algebra
Bott periodicity file; `Topology/Homotopy/Lifting.lean` (covering-map Hurewicz
fibrations); `RingTheory/DedekindDomain/SInteger.lean` (rank TODO);
`FieldTheory/FunctionField/Consequences/StrongApproximation.lean`; the type-A
root-subgroup Steinberg maps; and the quaternion Steinberg relation. These are
not the missing topological Bott, homology Hurewicz, arithmetic-group duality
or general cohomological symbol theorems.

## Public sources opened

All accessed 2026-09-24. Locators below are printed chapter/page numbers unless
explicitly marked PDF pages. Downloaded bytes were retained with SHA-256 hashes;
the URLs allow a fixer to retrieve the cited versions. Formula-heavy pages of
Borel 1977 (617–619) and Bloch–Kato (113) were also inspected as rendered images.

- [Kbook.II](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf): Example 8.2.4, p.77; Exercise 9.10(d), p.100.
- [Kbook.III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf): pp.14–15,31,37–38,50,52–53,59,64–65,71: BMS, Milnor-square sequences, UCE, local symbols, localization and Milnor norms.
- [Kbook.IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf): pp.6,8,14,38–39,50–51,59: plus/UCE, relative groups, H-space/group completion, Adams and finite generation.
- [Kbook.V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf): pp.6,8,20–22,60: projective-line splitting, relative S fibration, resolution and Laurent/Nil inputs.
- [Kbook.VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf): pp.12,16,45,47,49–53: real comparison, motivic/étale comparison, local/number-field and dyadic groups.
- [CFP](https://arxiv.org/pdf/1501.01307v2): arXiv:1501.01307v2, pp.1,4, especially §1.4. Its untwisted GL-duality assertion is corrected by the next source.
- [PutmanStudenmund](https://arxiv.org/pdf/1909.01217v4): arXiv:1909.01217v4, pp.2,4–5, Theorem C and the integral/rational coefficient distinction.
- [Hatcher](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf): Prop.4.72–4.74, printed pp.416–418 (PDF pages 425–427).
- [Borel1977](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0.pdf): Introduction p.615; §§1.6,2.1–2.4, pp.617–619.
- [Borel1974](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0.pdf): §10.2 p.263; §10.6 pp.265–266; §12.1 p.270.
- [Burgos](https://www.icmat.es/miembros/burgos/files/brbr.pdf): Introduction p.3; Cartan–Serre Thm.3.17 p.21; comparison Thm.10.9 p.95.
- [Totaro](https://www.math.ucla.edu/~totaro/papers/public_html/milnor.pdf): Printed pp.183–184, norm construction and reciprocity in the diagonal cycle comparison.
- [BlochKato](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf): Printed pp.112–114, differential symbol, Thm.2.1 and Lemma2.3.
- [BMS](https://www.numdam.org/item/PMIHES_1967__33__59_0.pdf): Printed pp.62,72–73,77,82–84,95; Thm.3.6, Appendix A and Cor.4.3.
- [Haine](https://math.berkeley.edu/~phaine/files/KFF.pdf): pp.8–10, Adams operations, Green lifting and §6.5–6.10.
- [CMM](https://arxiv.org/pdf/1803.10897v2): arXiv:1803.10897v2, p.35, proof of Prop.4.34.
- [AMMN](https://arxiv.org/pdf/2003.12541v2): arXiv:2003.12541v2, p.49, Examples 7.2–7.3 and the preceding comparison.
- [Buehler](https://arxiv.org/pdf/0811.1480): arXiv:0811.1480, pp.10–11, Prop.2.16 and its proof.
- [HesselholtMadsen](https://arxiv.org/pdf/math/9910186v2): arXiv:math/9910186v2, pp.4–5,47–48, universal log complex and Def.3.2.1/Prop.3.2.2.

The [K-book source page](https://sites.math.rutgers.edu/~weibel/Kbook.html)
identifies the separate chapter numbering. Its linked `Kbook.errata.pdf`
returned 404 on direct access during verification, despite a searchable cached
entry. Finding 31 therefore records the demonstrated chapter discrepancy rather
than claiming the error is absent from every errata list. VI.8.1's printed
field/integer-ring finiteness wording is another boundary: the repaired roadmap
must not assert finiteness of all positive even K-groups of a number field.

## Validation

- Every input finding has exactly one verdict; severity totals above match
  the original JSON. Finding 38 is the only rejected record.
- The 25 pinned source files read matched their expected Git blob hashes.
- Full assembled-graph reachability was checked; 46 compatible proposed
  existing-stage edges were tested together with no cycle. The S.5 → K.6
  cycle was identified and excluded.
- A fresh main snapshot at `1c21ef560726487d963821c03ed42d31abc32e41`
  had identical tracked reading inputs and no changes under `data/links`,
  `data/restructure` or `data/decompositions`; the findings were not made
  stale by an intervening promotion.
- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-ktheory-1.review.json`
  passed; `intake.py check-files` passed with 2 files and 0 problems.
- No Lean file is required by this review issue, and no Lean compilation
  is claimed. The fixes still require their own source closure, APIs, tests
  and graph validation when implemented.
