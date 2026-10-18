# Independent review of finite native root geometry, RS.1

**Accepted with corrections.** Issue #8952, job
`REV-FunctionFieldArithmeticPartII--RS.1`, reviewed on 2026-10-18 by Codex,
session `codex-MYEB4Z`. The planning author was the different session
`codex-iB2fkG`. The packet remains **complete** as one target-level planning
pass; its sole stage remains **planned**, with no implementation claim.

## Counts and changes

All 11 nodes were checked: 9 verified and 2 corrected. No node was added,
removed or split. The node kinds remain 3 constructions, 5 theorems,
2 comparisons and 1 application. The constructions have 18 API items and
now 13 discriminating tests (previously 12); there are 5 planets and
12 confirmed baseline declarations. One supplier request and two explicit
gaps remain. Two source findings are now independently confirmed.

The corrections are:

1. **AGV source attribution.** Appendix B.2 of the selected preprint has a
   false ordinary-product assertion on p.54. The packet already used the
   correct contracted product. Updated the source matches of
   `native-quotient-comparison` and `native-smooth-presentation` to distinguish
   the normalization/descent argument from the false assertion. The reader
   carries the same qualification.
2. **New finding E13 and its test.** Recorded the error with its locator,
   correction, counterexample, correction searches and independent verdict.
   For A=C, f=1, n=2, the finite chart has two points and its product with G_m
   has two connected components. The frame scheme has equation uz²=1 and is
   G_m. The invariant map (w,λ)↦(λw,λ^n) instead descends through the
   antidiagonal μ_n quotient to the correct frame scheme. Added
   `FiniteRoot.smoothPresentation_not_product` to the construction tests.
3. **Existing finding E12.** Independently reconfirmed the unbound exponent
   in Appendix B.2, p.53, items (2)–(3). Preserved the previous review in
   `reviewHistory` and installed this review's verdict. No mathematical
   target needed changing for this misprint.
4. **Version and ownership records.** Added the read preprint's URL, date,
   SHA-256 and reading scope to `sourceVersions`. Included the already-used
   upstream §§1.15–1.17 in the import/reading inventory and synchronized the
   reader. Both source findings are restricted to arXiv v2; journal text was
   not obtained. Added no quotation or source excerpt.
5. **Suggested-file consistency.** Updated both omission ledgers from four
   to five smooth-presentation tests. The Lean declaration bodies and
   statements are unchanged. Added the required top-level packet review,
   with a verdict and reason for every node.

## Per-node mathematical review

IDs in this table have prefix `FunctionFieldArithmeticPartII:RS.1/`.

| Node | Verdict | Reason |
| --- | --- | --- |
| `native-effective-descent` | Verified | Full QCoh descent supplies sections, φ, its inverse and all morphisms. Finite locally free rank-one descent and monoidal comparisons give root descent. Faithfulness proves the equations and uniqueness supplies refinement/base-change coherence. |
| `native-upstream-equivalence` | Verified | The categorical 2-pullback retains the power identification, section equation and base arrow. The line-section equivalence identifies every Hom set; scheme-test descent extends the comparison to stack bases. |
| `native-universal-root-comparison` | Verified | The second projection and structural 2-isomorphism recover the whole universal triple. The classifying property is a 2-Yoneda groupoid equivalence, retaining automorphisms. |
| `native-basechange-square` | Verified | Associativity and full faithfulness of the 2-pullback give the natural comparison and coherence for identity, composition and 2-cells. No flatness assumption is needed. |
| `native-quotient-comparison` | Corrected | Normalized frames form an fppf μ_n-torsor. Their right action gives inverse-weight coordinates for the left action on W; effective descent gives the inverse functor. Corrected its source attribution as described above. |
| `native-smooth-presentation` | Corrected | With φ coefficient q inverse, the equation is z^n=qf and the action is λ·(z,q)=(λz,λ^nq). The frame torsor is smooth in wild characteristic. The antidiagonal quotient comparison is correct; added its product counterexample test and E13 qualification. |
| `native-algebraicity` | Verified | The monic cover is finite free of rank n. Its map to the stack is a μ_n-torsor; its map to the base need not be one. The section equation cuts relative Isom spaces out as closed subschemes of finite torsors, proving finiteness without claiming flatness. |
| `native-coarse-space` | Verified | Reuses the parent's Hopf-invariant algebra equivalence. The universal property for arbitrary algebraic-space targets is explicitly conditional on the precise diagonalizable quotient request. Exact degree-zero invariants and AOV base change are used with the correct hypotheses. |
| `native-geometric-fibres` | Verified | The full zero fibre retains z with z^n=0. Imposing z=0 gives the intrinsic root gerbe; a frame neutralizes it. A smooth G_m presentation proves Bμ_n reduced even when μ_n is nonreduced; the full fibre is nonreduced for n>1. |
| `native-regularity` | Verified | The ambient localized polynomial ring is regular. For n≥2 at z=0, f is a regular parameter and z^n−qf has nonzero cotangent class, so its quotient is regular. Off z=0 eliminate q; for n=1 eliminate z. The actual smooth atlas justifies the stack assertion. |
| `native-dm-locus` | Verified | Stabilizers are trivial off V(s) and μ_n at geometric zeros. The unramified-diagonal criterion gives exactly invertibility of n along V(s). The dual-number tangent unit detects wild inertia. Stack-base conclusions are correctly relative. |

The three construction APIs expose their equivalence, object/map equations,
compatibility and functoriality without requiring a user to unfold the
construction. Their tests distinguish lost automorphisms, missing nontrivial
lines/torsors, nonflat base change, wrong frame action, nilpotent deletion,
wild smoothness and the new product error. The five planets are central
objects or constructions rather than source locators. At target level, the
proof sketches do not require a new node for every routine descent equation
or coordinate elimination.

## Sources and versions checked

Read all node locators in the following public texts:

- [AGV, arXiv:math/0603151v2](https://arxiv.org/pdf/math/0603151v2),
  Appendix B.1–B.2, printed pp.52–54. Also rendered pp.53–54 to check E12
  and E13. The intrinsic nilpotent embedding on p.53 is correct and is
  kept distinct from the full fibre. No claim concerns the journal version.
- [Talpo–Vistoli, arXiv:1410.1164v2](https://arxiv.org/pdf/1410.1164v2),
  §3–§3.1, pp.12–16, especially Proposition 3.4, p.13, and Corollary 3.13,
  p.16. The rank-one chart gives independent support for the finite
  diagonalizable quotient; no infinite-index theorem is asserted here.
- [Abramovich–Olsson–Vistoli, version of record](https://www.numdam.org/item/10.5802/aif.2378.pdf),
  §2.3, Proposition 2.7 and proof, pp.1066–1067; Definition 3.1 and
  Theorem 3.2, p.1077; Corollaries 3.3–3.5 and the base-change proof,
  pp.1078–1079. Diagonalizable groups are linearly reductive in wild
  characteristic; the coarse base-change result presupposes a coarse space.
- Stacks, [Proposition 35.5.2, 023T](https://stacks.math.columbia.edu/tag/023T)
  and [Lemma 35.7.6, 05B2](https://stacks.math.columbia.edu/tag/05B2),
  with proofs; [§10.106, 00NN](https://stacks.math.columbia.edu/tag/00NN),
  especially Lemmas 10.106.3–10.106.4;
  [Lemma 10.163.10, 07NF](https://stacks.math.columbia.edu/tag/07NF);
  [§100.7, 04YE](https://stacks.math.columbia.edu/tag/04YE), Lemma 100.7.1,
  Definition 100.7.2 and Remark 100.7.3. These online locators have no fixed
  page numbers.

Downloaded PDF hashes agree with the packet. The current arXiv version list
still identifies AGV v2 as latest. Exact-title erratum/correction searches,
searches with the authors and scheme symbols, and Abramovich's public
paper-directory listings identified no correction. The Project Euclid journal
page served an access-block page; the Caltech author record supplied metadata
but no readable published text. This limitation is recorded with E13 and
prevents attributing either finding to the version of record. No restricted
source was needed.

## Pinned baseline and supplier closure

Read the actual declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The shared Mathlib source checkout
has the exact pinned HEAD. Tau Ceti's relevant file was byte-compared with its
raw file at the exact pin. All 12 citations are valid; none was removed or
replaced.

| Declaration | Source module and confirmed scope |
| --- | --- |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf` | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:78`: full category with all module maps; root arrows use its core. |
| `AlgebraicGeometry.Scheme.Modules.pullback` | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean:182`: native pullback for any scheme morphism; monoidal/descent properties are separate suppliers. |
| `AlgebraicGeometry.Scheme.fpqcTopology` | `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:75`: generated by the flat, jointly surjective quasi-compact covering families. |
| `AlgebraicGeometry.Scheme.fppfTopology` | Same module, line 53: generated by jointly surjective flat lfp families; the comparison to fpqc is present. |
| `AdjoinRoot` | `Mathlib/RingTheory/AdjoinRoot.lean:62`: quotient by the principal polynomial ideal over any commutative ring. |
| `AdjoinRoot.eval₂_root` | Same module, line 261: defining polynomial vanishes at its actual root with the actual coefficient map. |
| `Polynomial.Monic.free_adjoinRoot` | Same module, line 682: monicity gives a free module, including the degenerate coefficient ring. |
| `Polynomial.Monic.finite_adjoinRoot` | Same module, line 685: monicity also gives finiteness. |
| `AdjoinRoot.powerBasis'` | Same module, line 667: native root generator and dimension equal to natDegree; the positive-degree chart rank follows for a nontrivial coefficient ring. |
| `IsRegularRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:92`: Noetherian, with regular localizations at primes. |
| `IsRegularLocalRing` | Same module, line 51: Noetherian local with maximal-ideal spanFinrank equal to Krull dimension. |
| `Localization.Away` | `Mathlib/GroupTheory/MonoidLocalization/Away.lean:140`: localization at powers of one element; the ring structure is inherited in the ring use. |

Read every distinct direct supplier node statement and its relevant API in
the accepted parent, RS.0, SchemeAndStackFoundations and the R09.3 rank-descent
node; checked the accepted RS.2 consumer boundary. The RS.0 frame maps are
line-to-unit isomorphisms, while this reader's frame vectors point from the
unit to the line: inversion reconciles their coefficient conventions. There
is no cancellation of a zero or nilpotent section.

Read the reviewed library audit's SF.1, SF.3, SF.4 and R09.3–R09.5 entries;
there is no Part II audit entry. Screened both pinned and current Tau Ceti
(`a91d3aa`) interfaces. Existing sites, sheaves and polynomial/regular-ring
carriers are imports; no geometric root/coarse carrier was located.

Checked current public TauCetiRoadmap main at immutable commit
`350e970ce49f707a327909beac0b7b7c782cc7ee`: Scheme and stack foundations
§1.1, §§1.15–1.23, §3.4 and §4.13, plus the corresponding suggested-file
boundary. The provided checkout predates that document. Read nearby Algebraic
vector bundles and Jacobian challenge READMEs and inspected the relevant
suggested forms. AVB L0A/L0B owns native tensor sections and monoidal pullback;
SSF owns generic descent, stacks, torsors, contracted products and roots.
They are not new generic targets here. The public root API currently states
DM for globally invertible index; the atlas supplier's stronger criterion is
also compatible with this native locus comparison.

Upstream §1.17 explicitly excludes a general geometric-to-categorical quotient
criterion; §1.23's affine coarse theorem is for finite abstract groups. The
single **RS1-DIAGONALIZABLE-COARSE** request precisely names the extension
needed for nonreduced diagonalizable groups, all algebraic-space targets,
exact degree-zero pushforward and arbitrary base change. It is justified and
remains open, rather than being concealed by the invariant-ring computation.
**RS1-NATIVE-SIGNATURES** records the absent implemented geometric carriers.
The reader specifies their complete mathematical contracts and both omission
ledgers cover them. These honest boundaries permit acceptance with the stage
planned, not closed. No target or supplier file outside this review was edited.

## Validation and orchestrator notes

- `check_blueprint.py` on the packet: **0 errors, 0 warnings**, with the pinned
  declaration index; all 11 nodes have this review's checked verdict.
- Shared source-issue and version checks: passed for E12/E13 and the selected
  preprint record.
- `lean-check` on the suggested file at the pins: successful elaboration with
  exactly five proof-admission warnings and no other diagnostics. The only
  subsequent Lean edit changes a comment's test count; a repeat compilation
  is unnecessary. The file has 115 lines and no admitted data definition.
- Intake path/content validation, the admitted-data scan and `git diff --check`:
  passed for the five submitted files.

No blocking question remains. Assembly should use the current upstream owners,
retain the two precise boundaries, and carry E13 forward as a preprint-only
finding with its counterexample. Any collation against the journal version
must read that version before extending the finding's scope. This review does
not implement the supplier extension, alter upstream, or close RS.1.
