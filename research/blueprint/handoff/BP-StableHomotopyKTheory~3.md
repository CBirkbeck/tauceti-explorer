# BP-StableHomotopyKTheory~3 — completed revision

Codex, session `codex-mPiTFV`; issue #7568; 2026-10-09.

The five prototype contracts requested by the completed independent review
REV-StableHomotopyKTheory~2 are now typed in the suggested file and described
consistently in the packet and reader. Packet status is `complete`. All 221
node IDs, kinds and planets are preserved, including the review's eight added
lemmas. The historical `review` and `reviewHistory` objects are unchanged; the
next independent reviewer replaces the verdict. Nothing is claimed implemented.

## What this round changed

1. **Derived colimits.** The old representable-vanishing statement is renamed
   `categoryHomology_representable_isZero`. The requested comparison is now a
   natural isomorphism from the category-homology functor to Mathlib's
   `Functor.leftDerived` of colimit, together with its naturality square.
   Colimit additivity is exposed separately. Mathlib requires projective
   resolutions in the diagram category: the suggested signature takes that
   instance explicitly, and its construction from free representables remains
   in the existing Gabriel–Zisman imports gap. The mathematical theorem has
   no additional projective-resolution assumption. Quillen §1, LNM p. 91
   (PDF 7), is the source of the comparison, rather than just the contraction.
2. **Maximal trees.** The general connected-category presentation now has a
   chosen wide subquiver of the symmetrified quiver and an arborescence, with
   actual root paths and edge loops. A bijection identifies group
   homomorphisms with arrow labels satisfying the identity, composition and
   tree-edge relations; a compatibility theorem fixes the generators as
   those loops. The multiplication relation is x_(f ≫ g)=x_g*x_f, matching
   Mathlib's path multiplication. The proof distinguishes the free groupoid
   on a quiver from the category localisation that imposes identity and
   composition relations. `SpanningTree.endIsFree` applies before that
   quotient. The edgeless tree of a one-object group retains its vertex.
   Source: Weibel IV Lemma 3.4 and its examples, IV.27–28.
3. **The chosen perfect subgroup.** The π₂ comparison now accepts any perfect
   normal subgroup P of G, transported along the actual equivalence
   π₁(BG) ≃* G. Its target is H₂(P;ℤ), using lifted integral coefficients in
   the universe of P. The π₁ comparison retains G/P and identifies the map
   with the quotient map. The fibre projection is explicitly a universal
   central extension of P, with the unique-lift property imported from the
   algebraic supplier. The P=G case remains, and a proper-subgroup example
   checks that P={1} retains π₁=G and gives trivial π₂ even for a nonperfect
   G. The universe extension of the supplier is still requested. Source:
   Weibel IV Proposition 1.7, its proof and Corollary 1.7.1, IV.6 in the
   recorded online chapter version.
4. **Segal components after completion.** The corrected K₀ test uses
   components of the completed zeroth space Ω|B A_C([1])|. It compares them
   multiplicatively with the existing algebraic Grothendieck group of
   isomorphism classes under sums. Separate API identifies the original
   component monoid, the completion map and its effect on generators. The
   zero and coproduct laws pin the operation to categorical sums. The module
   example uses a small category equivalent to the full subcategory of finite
   projective modules, and the added rank test turns ℕ into ℤ while preserving
   the completion map. Carlsson's isomorphism-only summing-functor category
   and the corrected use of Γ-space bar iteration are retained. Sources:
   Carlsson §1.2, Definition 1, Proposition 2 and Theorem 3, printed pp. 6–8;
   Bhatt–Scholze §12, Proposition 12.10, Corollary 12.12 and Definition 12.13,
   p. 58. The existing spectrum-structure gap is not closed by component API.
5. **Exact-couple tests.** All three requested packet names now precede
   typed examples. Zero E makes every i invertible and every page zero. The
   two-stage test fixes the standard bidegrees, negative-D-column vanishing
   and the two E columns, and asserts collapse from E² together with the
   short exact kernel/cokernel extension of the actual D term. It specifies
   boundary, inclusion and projection maps and asserts no splitting. The
   non-example has an exact couple with i²≠0; constant ℤ² with i(x,y)=(x,0),
   j(x,y)=(y,0), k(x,y)=(0,y) supplies the witness. The filtration conventions
   agree with Lurie §1.2.2, Construction 1.2.2.6 and Proposition 1.2.2.7,
   pp. 49–50. Coherent filtered-spectrum models remain a proof/interface gap.

Only the four obsolete coverage entries describing these five prototype
failures were removed. All other remaining work, all 45 gaps, all 14 supplier
requests, the restructuring and upstream notes, and all 17 source-issue
records are preserved. Seven newly read Mathlib interfaces are added to the
baseline, and the free-groupoid description now states categorical relations
without the ambiguous product order.

## Earlier corrections checked and retained

The current review's 35 corrected verdicts and eight added verdicts were
checked against their packet statements, hypotheses, proof outlines and
acceptance tests. They are unchanged; the Segal construction, counted among
the review's five unverifiable contracts, retains its accepted correction too.
The audit covers these mathematical boundaries:

- H.1 separates disk-boundary comparison from CW structure and retains the
  categorical-to-classical CW request. Strong local contractibility, closed
  subcomplex embeddings and compact finite-subcomplex containment are
  separate nodes rather than assumed API.
- H.2 separates the mapping-path equivalence from the fibration theorem,
  retains the full latching/intersection diagram and embedding hypotheses
  in gluing, and keeps the surjective all-basepoint quasifibration criterion.
  The contractible-base Theorem B argument is a comparison of spaces.
- H.3 retains nonempty acyclicity, abelian-target restrictions for the typed
  plus recognition/universal-property results, and the explicit gaps for
  general relative plus and Serre comparison. Integral universal coefficient
  short exact sequences carry no natural splitting.
- H.4 retains specialness as the hypothesis for the component monoid, the
  Core C level-one comparison, and the separate group-completion theorem.
- H.5:spectra retains Kan-level strict looping, correct symmetric-spectrum
  limits, positive suspension-spectrum levels, derived adjunction/free
  constructions, the zero-versus-nonzero coefficient distinction, the two
  Eilenberg–Mac Lane degrees and the ring identification on π₀. Stable
  homology comparison remains a gap.
- H.6 retains functorial rationalisation by a fixed derived smash, object-level
  coprime Moore decomposition, coherent point-set filtered models, and the
  uniform connectivity hypothesis for tower convergence. The four added
  p-completeness lemmas retain mod-p detection, exact closure, prime-power
  coefficients and a single uniform exponent bound.

The four added topology lemmas were checked again against Hatcher Proposition
4.64, p. 407, the Appendix subcomplex discussion and Proposition A.1,
pp. 519–520, and Proposition A.4, p. 522. The four added completion deductions
were checked against Schwede II §9.3, Remark 9.8 and Theorem 9.9,
pp. 303–304, together with their existing tower and Milnor prerequisites.
This revision does not claim a fresh proof audit of every inherited source.

## Handed red-team findings

| Finding | Retained disposition |
| --- | --- |
| RT-AREA-ktheory-1/4 | K.4:construction supplies additivity and relative S-deloopings; H.5:S-delooping only assembles the spectrum. Biexact products belong to K.7. Consumer and atlas edits remain with their owners. |
| RT-AREA-ktheory-1/5 | H.3 supplies H-space actions, abelian Whitehead, obstruction/Postnikov and rational Hurewicz; H.4 depends on H.3. The general-target plus property remains an explicit gap. |
| RT-AREA-ktheory-1/15 | H.2 supplies the connected-base and π_*-Kan fibration-realisation forms to K.4:construction, with imported proof gaps retained. |
| RT-AREA-ktheory-1/16 | H.5:spectra contains HA, HR and modules, chain-complex homotopy/shift comparison, cohomology and truncations. The KU/ku instance stays with its consumer. |
| RT-AREA-ktheory-1/22 | Accepted RS-33 imports nerve, realisation, local coefficients and AT2/5/8 machinery rather than re-planning them. The extension to twisted total-space coefficients remains explicit. |
| RT-AREA-ktheory-1/23 | H.6 owns exact couples, towers and convergence; the proposed edge to SchemeKTheoryOperations:S.4 is retained. The present round makes its exact-couple tests typed. |
| RT-AREA-ktheory-1/30 | UCE recognition and its H₂ kernel are imported from K2SymbolsBrauer:T.1:classical. The present round types the subgroup-sensitive result and retains the supplier's required universe extension. |
| RT-AREA-ktheory-2/29 | H.6 retains Burklund's bounds and compatible multiplicative Moore towers, with the proposed edge to RefinedTraceMethods:RT.5 and the proof gaps. |

## Coverage and precise resumption point

| Stage | Nodes | Status |
| --- | ---: | --- |
| H.1 | 34 | planned |
| H.2 | 39 | planned |
| H.3 | 39 | planned |
| H.4 | 32 | planned |
| H.5 | 0, aggregate | planned |
| H.5:S-delooping | 3 | planned |
| H.5:spectra | 40 | planned |
| H.6 | 34 | planned |

There are 24 definitions, 36 constructions, 73 lemmas, 82 theorems, four
comparisons and two applications; 366 API items and 247 tests in total; 36
planets; 116 baseline declarations. The validator counts only APIs and tests
on definitions/constructions, reporting 345 API items and 246 tests. The
remaining 21 API items and one test belong to other node kinds.

No stage is closed. After independent acceptance, follow-up starts from the
packet's exact `gaps[].neededBy`, supplier requests and coverage `remaining`
lists: realisation/products and local homology (H.1); fibration, gluing and
model results (H.2); local-coefficient, general plus and Serre arguments
(H.3); Segal, coherence and group-completion proofs (H.4); spectrum, module,
operadic, EM and infinite-loop comparisons (H.5:spectra); supplied natural
S-deloopings (H.5:S-delooping); and coherent filtrations, convergence,
completion and multiplicative Moore proofs (H.6). A natural based plus map
and UCE lifts are still needed for the separate π₂ naturality node.

The 14 requests name K.4:construction; KTheoryLowDegrees U.1/Z.1;
K2SymbolsBrauer T.1:classical; ArithmeticGaloisDuality R02.1;
EnhancedDerivedSheaves E0/E5:abstract; Tau Ceti AlgebraicTopology stages
1, 2, 4, 5, 6 and 8; and UniversalCovers stage 2. Their exact hypotheses and
consumers are in the packet. The relevant GrothendieckEulerForms overlap was
checked: ordinary algebraic group completion and split K₀ are baseline imports,
while H.4 owns homotopy group completion. No supplier, consumer, atlas edge or
other packet was edited. Prior handoff consumer-pointer and atlas-edge actions
remain with those owners.

## Sources and validation

Seven public PDFs were obtained and matched their recorded SHA-256 values:
Quillen, Weibel IV, Carlsson's 35-page chapter, Hatcher, Schwede, Bhatt–Scholze
and Lurie. Their precise revision reading receipts are appended to `sources`
and included in the reader. Historical reading and source-version records are
retained. Unread imported proofs remain gaps; no book, extracted text or
source passage is committed. The private library index was checked, but no
private source was needed for this revision.

The accepted RS-33 result, library audit, relevant links, full upstream
AlgebraicTopology and UniversalCovers roadmaps, review report and supplier UCE
statements were read. The seven added Mathlib declarations and free-groupoid
quotient/tree statements were read at Mathlib 082e2d3. Earlier pinned Tau Ceti
baseline receipts remain intact; they are not replaced by working-tree claims.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/StableHomotopyKTheory.json`:
  zero errors and zero warnings; all eight stages planned.
- Packet/reader reconciliation checked the statement, hypotheses, proof steps,
  acceptance, prerequisites and API/test contracts of every one of the 221
  nodes. All 25 added API names correspond to actual typed declarations, and
  the five new or corrected test names precede typed examples. ID/kind/planet,
  review, gaps, requests, source issues and source hashes were compared with
  the original packet.
- `lean-check research/blueprint/suggested/StableHomotopyKTheory.lean`:
  exit 0, zero errors, 634 admitted-proof warnings and no other warnings.
  This is elaboration of proposed signatures, not proof validation. The
  shared build supplies Mathlib at the exact pin and the adic portion of
  Tau Ceti; the five existing, documented compatibility forms remain for
  unavailable Tau Ceti topology imports. Their replacement by pinned imports
  still requires the corresponding built topology modules.
- `git diff --check` passes. Only the issue's four authorised deliverables are
  changed, with no private absolute paths or source excerpts.

The next action is independent review of this completed revision, followed by
proof-gap and supplier work after acceptance. This run claims no second job.
