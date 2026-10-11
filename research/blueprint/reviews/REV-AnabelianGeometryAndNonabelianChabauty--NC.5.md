# Independent review of NC.5

**Accepted**, after in-place corrections, as a complete target-level planning
pass. NC.5 remains **planned**, with three gaps and four supplier requests; it is
not closed or formalised. Reviewer: Codex, session `codex-BfKo85`, issue
[#6303](https://github.com/CBirkbeck/tauceti-explorer/issues/6303),
2026-10-11. The input was written by session `codex-D23VzP`.

The packet's `review.checked` covers all 25 nodes: 18 verified and seven
corrected, with no added, removed or unverifiable nodes. The final plan contains
three definitions, six constructions, ten theorems, three comparisons and three
applications; 37 API items, 32 specified tests and five planets. One API item
and three tests were added. All ten original source findings are confirmed;
one additional, version-scoped finding is recorded as E511.

## Corrections

1. **Preheight projections.** Published BDMTV §3.3, p.905 assigns `s1` to the
   chosen complement `s(V_dR/Fil0)` and `s2` to `Fil0`. The input statement
   reversed them. Corrected the statement and Lean documentation while retaining
   both negative beta terms. In the native test, the first coordinate is the
   complement and the second is `Fil0`. Exchanging the projections gives 6
   rather than −2; the new `preheight_projection_order` test records this.
2. **Admissibility.** Nonvanishing already occurs in the opening paragraph of
   published §4.4, p.913, before the four displayed conditions. Corrected the
   attribution and docstring. Replaced the symmetric tensor test by
   `e1⊗e2+e2⊗e1`, which meets the eigenvalue, filtration and cup conditions and
   fails only antisymmetry. Added separate filtration and nonzero-cup tests.
   The latter uses an explicit linear test functional, not a claimed geometric
   cup pairing. Added the existing `TensorProduct.lift` prerequisite.
3. **Quotient API.** Added `DepthTwoHeightModule.lift_unique`, complementing
   `lift_mk`, to state uniqueness of the descended map explicitly. No new
   geometric target or alternate quotient implementation was introduced.
4. **Source metadata and locators.** The Kim–Tamagawa source is
   *The l-component of the unipotent Albanese map*; Corollary0.2 is on p.1,
   with its proof in §2, p.6. Corrected both. BD I Remark4.9 is on p.16, not
   p.17. The forward cycle-class properties on BDMTV p.913 precede Lemma4.7;
   that lemma itself states the converse. Corrected the forward locator.
5. **Divisor comparison.** BD I §6.3, p.25 explicitly constructs
   `E_Z=A_Z(b,x)^*(1)`. Replaced the ambiguous identification of `A_Z` itself
   with the divisor extension by the comparison of `E_Z` with
   `H_X(x−b,D_Z)`, followed by Tate-dual height symmetry. Both objects have
   identified grades `Qp,V,Qp(1)`. The extra `(−1)` in the arXiv v2 Theorem6.3
   display, p.26, conflicts with those definitions and its following proof;
   E511 records that misprint solely against this version. The publisher
   returned an access challenge, so no finding against the published display
   is asserted. The pointed `x=b` comparison remains an explicit G1 input.
6. **Review bookkeeping.** Fixed E501's contradictory search note: sequel
   Remark3.17 does record the converse correction. Added independent verdicts
   to all findings, source identifiers and version/access receipts. Removed
   the completed independent-review task from coverage's remaining list.

## Sources and findings

Downloaded the eight public sources named in the packet and independently
matched all eight SHA-256 receipts. Checked every node's cited theorem,
definition or surrounding argument; Annals locators use printed pages and the
three arXiv papers use PDF pages. No source passage or source file is committed.
The publisher's IMRN §4 Lemma4.2 proof was additionally checked for E506.

| Finding | Independent check and scope |
| --- | --- |
| E501 | Published Lemma4.7 pp.913–914 and sequel Remark3.17 p.16 confirm the invalid rational-correspondence converse. Keep only the forward implication. |
| E502 | Published pp.899,907 omit the input needed to identify full global finite cohomology. BD I §2.3 p.9 and Proposition5.5 pp.20–22 justify restricting to the Mordell–Weil image. |
| E503 | The local 13-adic theorem on p.929 needs the first model's good reduction away from13 on p.930 to justify the global assertion, including the prime2. |
| E504 | Published pp.907–908 give `h=hp+sumAway`, forcing negative correction values for `hp−h`; BD I Proposition5.5 p.21 uses that sign. |
| E505 | Zero is a symmetric cup-zero correspondence but violates the nontriviality condition preceding published Lemma2.4 p.900. |
| E506 | The automorphism quotient's identity coset is fixed. Both arXiv Lemma4.2 p.22 and the publisher proof need the singleton condition, on every twist, rather than an empty fixed locus. |
| E507 | Pinned `U1.m` line358 uses the wrong class's Hodge vector; `heights.m` line332 and the distinct published vectors on p.931 confirm the mismatch. The conclusion is an ED.6 replay obligation. |
| E508 | Published equation(30) p.916 fixes the derivative orientation; the residue recipe on p.918 reverses it and hence the sign for alternating `Z`. |
| E509 | Published equation(41) p.921 fixes ordered left/right transports; the limits in the p.923 display reverse them. |
| E510 | The p.909 basis description does not state the Hodge adaptation needed on pp.916–918. The actual worked basis on p.930 has it. |
| E511 | The arXiv v2 Theorem6.3 display p.26 adds an incompatible twist; §§6.2–6.3 pp.24–25 and the following proof determine the untwisted comparison. Published display unavailable. |

These findings do not assert failure of the published seven-point theorem.
Neither the Magma calculation nor a certified numerical replay was run.

## Baseline, suppliers and ownership

All 14 baseline declarations exist at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, and their statements provide the
native interfaces with the required conventions. None was removed or replaced.
The packet retains Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`;
it cites no Tau Ceti declaration in `baseline.declarations`.

| Declaration | Pinned module and line |
| --- | --- |
| `LinearMap.ker` | `Algebra/Module/Submodule/Ker`, 60 |
| `LinearMap.quotKerEquivOfSurjective` | `LinearAlgebra/Isomorphisms`, 47 |
| `TensorProduct` | `LinearAlgebra/TensorProduct/Defs`, 71 |
| `TensorProduct.map` | `LinearAlgebra/TensorProduct/Map`, 53 |
| `TensorProduct.comm` | `LinearAlgebra/TensorProduct/Basic`, 264 |
| `TensorProduct.lift` | `LinearAlgebra/TensorProduct/Basic`, 122 |
| `Submodule.mkQ` | `LinearAlgebra/Quotient/Defs`, 227 |
| `Submodule.liftQ` | `LinearAlgebra/Quotient/Basic`, 118 |
| `Module.Dual` | `LinearAlgebra/Dual/Defs`, 62 |
| `Set.Finite.image` | `Data/Set/Finite/Basic`, 568 |
| `Matrix.det` | `LinearAlgebra/Matrix/Determinant/Basic`, 60 |
| `MvPolynomial.eval` | `Algebra/MvPolynomial/Eval`, 256 |
| `AnalyticOnNhd` | `Analysis/Analytic/Basic`, 120 |
| `Padic` | `NumberTheory/Padics/PadicNumbers`, 531 |

Read the exact referenced NC.2/NC.3 path, quotient, twisting, exact-sequence
and comparison statements; A2/A6 rational NS/Rosati/rank statements; SF.3's
Tate-module/étale-H1 comparison; Selmer L0/L2/L4; period R06.2/R06.5;
Coleman L1; and the existing ED.6 model, arithmetic, class, matrix, chart and
completeness targets. Stage requests are precise where no exact supplier is
available. In particular, MC.0 cycle formalism alone does not supply the
relative-cohomology comparison, and the pending generic-height design has no
invented stage identifier.

RT-AREA-algebraicgeometry/8 is handled correctly: A2 owns rational NS and its
symmetric-Hom injection, A6 owns rank, and SF.3 supplies curve/Jacobian
cohomology conventions without becoming the NS owner. The rational descent
request is needed because an algebraically closed-field NS isomorphism does
not silently become one over Q. The 19 NC.5 paper routes and the additional
A2 retarget are preserved. Generic height items remain assigned to the
shared Part II, and ED.6 consumes NC.5 without a reverse prerequisite.

The reviewed library audit marks NC.5 unbuilt and its four targets absent.
Screened current Tau Ceti and the nine newer roadmaps for competing targets,
and read the relevant JacobianChallenge and AlgebraicVectorBundles readers.
Roadmap main was `070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti
was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing geometry is imported;
the real canonical-height machinery does not supply mixed-extension p-adic
heights. No upstream file was changed.

## Validation and remaining work

- `python3 scripts/check_blueprint.py research/blueprint/packets/AnabelianGeometryAndNonabelianChabauty--NC.5.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/suggested/AnabelianGeometryAndNonabelianChabauty--NC.5.lean`:
  exit0, 62 warnings, all `declaration uses sorry`, no errors. The file uses
  the existing pinned build. Proofs remain admitted.
- Every specified test has a matching Lean marker: 29 have native signatures
  and three twist tests are explicit geometric omissions at G1/G2. The
  separate zero-character counterexample is also present. No missing
  geometry is encoded as an opaque proposition or assumed comparison field.
- Exact arithmetic checks give the published class minor
  `det((10,−6),(−6,6))=24`, anchor determinant13440, the corrected 2×2 height
  determinant0, and the twenty-disc count `17+2+1`. Checked the new tensor
  tests isolate their intended conditions and the projection reversal gives6.
  These small checks do not certify the p-adic calculation.

The three retained gaps are native geometry and the pointed relative-cohomology
bridge (G1), the pending shared generic mixed-extension/height foundation (G2),
and corrected arithmetic/precision/root/matching certificates at ED.6 (G3).
The four requests remain with MC.0, RP.1, NC.4 and A2. No target is represented
as gap-free or already implemented.

## Questions and reader synchronization for the orchestrator

The reader is outside #6303's deliverables and was not edited. Before assembly
or packaging, synchronize
`research/blueprint/readmes/AnabelianGeometryAndNonabelianChabauty--NC.5.md`
from the accepted packet:

- In admissibility, retain the source's nonzero hypothesis, replace the
  symmetric test, add the filtration/cup tests and update the boundary to six
  tests.
- Add `DepthTwoHeightModule.lift_unique` and update its native API count to five.
- Correct preheight `s1`/`s2`, name the native complement/filtration frame and
  add the projection-order test.
- Correct the Kim–Tamagawa title and Corollary0.2 p.1 in both the node and
  bibliography; fix BD I Remark4.9 p.16 and the forward paragraph before
  BDMTV Lemma4.7 p.913.
- Make the Chow–Heegner comparison explicitly Tate dual, carry its
  normalization into G1, and include E511 with its preprint-only scope.
- Update totals to 37 APIs, 32 tests and eleven reviewed findings; remove the
  completed independent-review task from remaining work.

The maintainer should assign the exact relative-cohomology and pointed endpoint
bridge to its path/cycle owner, coordinate the shared-height stage with
[#3430](https://github.com/CBirkbeck/tauceti-explorer/issues/3430), and obtain
the published BD I Theorem6.3 display for collation. ED.6 must perform the
corrected class2 exceptional-disc replay before relying on its root lists.
These are downstream tasks already exposed by the accepted planning pass.
