# BP-StableHomotopyKTheory~2 — revision handoff

Agent: Codex, session `codex-Rodm1k`; issue #7013; 2026-10-08.

## Completed revision

The reader now agrees with the independent review's corrected 213-node packet,
including all statements, hypotheses, proof outlines, API items, tests,
acceptance criteria, prerequisites, source locators and suggested homes. The
previous reader described 170 nodes and retained superseded mathematics. The
introduction, conventions, layer descriptions, ownership and dependency order
were rewritten around the current specifications. All 35 gaps, 15 requests,
15 source issues and 88 baseline imports are included in the reader.

All 213 node ids and the existing top-level `review` object are preserved.
The old `needs_changes` verdict remains for the next independent reviewer to
replace. No new mathematics was added after the reviewed packet had planned
every stage. Packet changes correct the summary count, the composition order
`nerveFunctor ⋙ SSet.toTop` in the first proof outline, source-reading provenance
and three source-issue descriptions. The latter are paraphrases; the findings'
corrections and independent dispositions are unchanged. The first source match
no longer describes the construction as a verbatim transcription.

Carlsson's reading record now refers to the public 35-page chapter, whose
printed page is its PDF page plus two, instead of an inaccessible full-volume
copy. Hatcher's uniqueness exercise is located in §4.3, and the obsolete claim
that Corollary 4.73 was unread is removed. The suggested Lean header now
accurately describes its five Tau Ceti compatibility forms and the explicit
symmetric-spectrum equivariance and morphism conditions already in the file.

## Review corrections retained and checked

- **H.1:** finite-factor products have their quotient/locally compact proof;
  compactly generated products remain a separate gap. `SingleObj` composition,
  fundamental-group multiplication and the bar differential agree with the
  actual pinned statements. The bar change inverts entries without reversing
  the tuple. Boundary-simplex, filtered-nerve, simplicial-covering,
  groupoid-Kan and local-cellular-chain inputs are present.
- **H.2:** the contractible-base Theorem B comparison is a map, not an
  unjustified equivalence of categories. Relative groups admit the stated
  based pairs. The homology double complex has the corrected variance. The
  connected-base fibration-realisation theorem is for bisimplicial sets with
  its canonical based fibre comparison; the π_*-Kan variant is separate.
  Properness, compactly generated weak Hausdorff hypotheses and the distinct
  Dold–Lashof and Strøm imports are visible.
- **H.3:** plus 3-cells kill a basis over the quotient group ring in the
  covering pair. Mapping-cylinder comparison avoids a circular proof. The
  proved universal property, uniqueness and functoriality retain their
  abelian-target hypotheses; the general property is a gap. Hurewicz with
  trivial action, principal fibrations, space Postnikov towers, obstruction
  lifting and the twisted-cover Serre argument are present. The UCE input is
  imported from T.1:classical. Rational primitive comparison uses the stated
  dimension argument, without an unplanned Milnor–Moore import.
- **H.4:** BGL⁺ being an H-space retains the general-target plus dependency.
  Integral homology equivalence and general local-coefficient acyclicity of a
  cofinal telescope are separate. CCMT uses the associative countable case
  and its adjunction. Free modules, ring-map/block-sum naturality, products of
  plus constructions and Segal homology are present.
- **H.5:spectra:** the shift index is π̂_(k+1)(sh X)=π̂_k(X).
  Naive connectivity only implies true connectivity. Stable equivalences
  precede true groups; cone signs and finite biproducts avoid the earlier
  cycles. EM cohomology uses suspension–evaluation. Cellular approximation,
  connective generation, EM uniqueness, module models, complex homotopy and
  shifts, true-group pairings, smash connectivity and SHC products are
  separate declarations. Spectrum Postnikov reconstruction by a homotopy
  limit belongs to H.6.
- **H.5:S-delooping:** K.4:construction supplies both the natural deloopings
  and π₁=K₀. The adjoint structure maps are identified with those deloopings.
  This stage assembles the symmetric spectrum and imports the space-level
  Q comparison; it does not claim an unconstructed Q spectrum.
- **H.6:** E/m is functorial by derived smash. Function-spectrum p-completion
  is distinguished from its homotopy-limit comparison. SHC products and the
  lim¹ algebra are imported. Milnor uses lim¹π_(k+1); Boardman's obstruction
  uses r-cycles and finite outgoing differentials. Rational stable-stem
  finiteness, UCT splitting cases, coprime coefficients, Browder and Burklund
  tower refinements have their explicit proof boundaries.

## Confirmed red-team findings

| Finding | Disposition in the revised specifications |
| --- | --- |
| RT-AREA-ktheory-1/4 | K.4:construction owns Waldhausen additivity and natural deloopings; H.5:S-delooping imports and assembles them. The initial map is not a general group completion. |
| RT-AREA-ktheory-1/5 | H.3 owns the abelian-space, H-space fibre, obstruction/Postnikov and rational primitive comparisons. H.4 imports them; BorelRegulators:R.3 consumes rational Hurewicz. General-target plus remains a gap. |
| RT-AREA-ktheory-1/15 | H.2 has the connected-base bisimplicial fibration theorem and separate π_*-Kan form, with their quoted proof imports recorded as gaps. K.4:construction is its consumer. |
| RT-AREA-ktheory-1/16 | H.5:spectra specifies HA, HR/modules, HC with homotopy and shift comparison, ordinary cohomology and functorial truncations. KU/ku belongs to the topological K-theory consumer. |
| RT-AREA-ktheory-1/22 | Accepted RS-33's ownership boundaries are retained: existing nerve, realisation, local systems and AT2/5/8 machinery are imports. H.3's universal-cover argument handles the required total-space coefficient issue. |
| RT-AREA-ktheory-1/23 | H.6 owns generic exact couples and convergence; the proposed H.6 → SchemeKTheoryOperations:S.4 edge is retained. |
| RT-AREA-ktheory-1/30 | H.3 imports UCE recognition and H₂ identification from K2SymbolsBrauer:T.1:classical. The supplier statements were checked. |
| RT-AREA-ktheory-2/29 | H.6's multiplicative Moore nodes retain Burklund's bounds and compatible towers. H.6 → RefinedTraceMethods:RT.5 is proposed; proofs remain gaps. |

## Coverage and follow-up

| Stage | Nodes | Status |
| --- | ---: | --- |
| H.1 | 31 | planned |
| H.2 | 38 | planned |
| H.3 | 39 | planned |
| H.4 | 32 | planned |
| H.5 | 0 (aggregate) | planned |
| H.5:spectra | 40 | planned |
| H.5:S-delooping | 3 | planned |
| H.6 | 30 | planned |

Packet status is `complete` for this planning pass. No layer is `closed` and
every implementation status remains `unchecked`. The count is 24 definitions,
36 constructions, 65 lemmas, 82 theorems, four comparisons and two applications;
336 API items and 245 tests in total; 36 planets; 88 baseline citations. The
checker reports 328 API items and 244 tests because it counts those only on
definitions/constructions, excluding eight API items and one test on other
kinds of nodes.

After independent acceptance, follow-up planning must close the recorded gaps
and stage `remaining` lists. The packet and reader give all 35 gap details and
their `neededBy` nodes. The main boundaries are realisation/products and local
cellular homology (H.1); realisation/fibration/model proofs (H.2); the
non-abelian-target and general relative plus properties and Serre comparison
(H.3); Segal, local-coefficient group completion, CCMT and coherence (H.4);
model/EM/module/operadic and infinite-loop comparisons (H.5:spectra); the
supplier deloopings for spectrum assembly; and convergence, rationalisation
and multiplicative Moore proofs (H.6). Hyperhomology, cosimplicial descent,
Eilenberg–Moore, equivariant rank truncation and derived-completion comparisons
remain only where the coverage records explicitly assign their owners.

The 15 supplier requests are unchanged: K.4:construction;
KTheoryLowDegrees:U.1/Z.1; K2SymbolsBrauer:T.1:classical;
ArithmeticGaloisDuality:R02.1; EnhancedDerivedSheaves:E0/E5:abstract;
AlgebraicTopology stages 1–6 and 8; and UniversalCovers stage 2. Consult
`requests` for the exact supplier ids, hypotheses and consuming nodes rather
than treating this list as proof closure.

## External actions for the next owner

Only this issue's four deliverables were edited. Consumer pointers and atlas
edges therefore need their respective owners to make these changes:

- GeneralAlgebraicKTheory:K.3's adjunction use should cite
  `H.1/adjunction-homotopy-equivalence`.
- KTheoryLowDegrees:U.6's acyclic-map use should cite `H.3/acyclic-map`.
- KTheoryFiniteLocalFields:L.4's HA/HR uses should cite
  `H.5:spectra/eilenberg-maclane-spectrum` and
  `H.5:spectra/eilenberg-maclane-ring`; L.1's Weibel IV.1.8 use should cite
  `H.3/plus-hspace-recognition`.
- GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum should cite
  `H.2/levelwise-fibration-realisation` directly. Its parent stage is
  K.4:construction, not K.4:additivity.
- Record the packet's proposed edges H.3 → H.4/H.5:spectra,
  H.4 → H.5:spectra, AT6 → H.3/H.5:spectra,
  H.2 → K.4:construction, T.1:classical → H.3,
  H.3 → BorelRegulators:R.3 and H.6 → S.4/RT.5.
- The retained atlas E5:abstract → H.5:spectra edge has no use in the
  concrete spectrum definition. E5:abstract's operadic input belongs on the
  H.6 multiplicative-Moore refinement. E5:spectra-comparison consumes the
  concrete foundation and is never its prerequisite.
- Instantiate τ_≥0(KU)=ku in RefinedTraceMethods:RT.4:topological, where KU
  is constructed. Retain the three `upstreamNotes` for the exact-couple and
  local-coefficient cellular interfaces of Tau Ceti AlgebraicTopology.

## Source and validation record

All 15 public source PDFs were fetched again and matched the recorded SHA-256
values. Carlsson §§1.1–1.2 (printed pp. 3–9), Hatcher's plus and abelian-space
comparison passages (pp. 374, 412–413, 417–418, 420), Schwede's loop/shift,
EM-uniqueness and Postnikov passages (I pp. 23–24, 37; II pp. 265–266,
295–297), Nikolaus–Scholze Appendix C (pp. 160–162), Bhatt–Scholze §12
(pp. 56–58) and Burklund's introductory theorems (pp. 1–2) were re-read.
The packet retains the earlier detailed source-reading records and adds the
round-two provenance and selective re-read record. No source excerpt, source
file or private library path is committed. Unread proof imports remain the
explicit gaps; a matching PDF hash does not establish their proofs.

The 88 cited baseline declarations were checked in their files at the exact
pins, including Tau Ceti through the pinned Git object rather than its current
working-tree revision. Supplier statements and the accepted RS-33 boundaries,
reviewed audit, upstream AlgebraicTopology/UniversalCovers documents, atlas
scope and relevant links were checked.

Validation: `check_blueprint.py` reports zero errors and zero warnings. A
reconciliation check confirms all 213 reader statements and every API/test
statement agree with the packet; every node/API/test name is present in the
suggested file. The unchanged review, coverage, gaps and requests were compared
with the original packet. `git diff --check` passes.

The suggested file elaborates with `lean-check` at the pinned Mathlib (exit
code 0): no errors and only declaration-uses-`sorry` warnings. The shared build contains
the adic-space part of Tau Ceti, so this check uses Mathlib imports and the five
documented Tau Ceti compatibility forms. There are 127 comment-level signature
markers for interfaces not yet statable in that build. Elaboration validates
the proposed types that can be expressed there; it does not validate the
planned proofs or compile unavailable Tau Ceti topology imports.
