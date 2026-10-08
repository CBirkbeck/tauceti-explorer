# Independent review: arithmetic K-theory finite generation, revision 2

Job: `REV-ArithmeticKTheory--N.3-finite-generation~2` (#6986). Reviewer: Codex, session `codex-R33ncr`. Date: 2026-10-08. This reviewer did neither authoring job and is independent of both authoring sessions.

**Verdict: accepted.** Every correction requested by the first independent review is resolved. All five proposed names are actual typed declarations, and the unchanged suggested file elaborates at the pinned Mathlib commit with exactly five `sorry` warnings. The arithmetic specializations and naturality conditions that cannot yet be expressed are explicitly omitted under PROTOCOL §13, rather than replaced with invented carriers or proposition-valued fields. This accepts a target-level planning pass, with its full mathematical statements definitive; it asserts no implementation or closed coverage.

The second review corrects broad H.1 prerequisites to existing declaration-level suppliers and isolates the missing chain-coefficient hyperhomology comparison in the existing supplier gap. The reader is synchronized. All 26 baseline declarations are confirmed, and the single source issue is independently confirmed.

## Counts and scope

| Item | Result |
| --- | --- |
| Fresh nodes | 5: one comparison and four theorems |
| Per-node verdicts | 3 corrected, 2 verified; none unverifiable |
| Retained predecessor interfaces | 9; endpoint IDs preserved |
| New definitions / constructions | 0 / 0 |
| New definition API items / unit tests | 0 / 0; predecessor obligations stay with their owners |
| Planets | 3 appropriate theorem landmarks |
| Baseline declarations | 26 confirmed; 0 removed or replaced |
| Nodes added or split | 0 |
| Sources / source issues | 5 source records checked; 1 issue confirmed |
| Supplier requests / gaps | 5 / 2, still explicit |
| Coverage | 1 planned stage, 0 closed stages; packet complete |

Read the previous review and revision handoff, every fresh-node statement and prototype, retained predecessor interfaces, exact cross-roadmap supplier statements, stage targets, the reviewed library audit and confirmed finding `RT-AREA-ktheory-1/1`. The GlobalNumberFields and AlgebraicTopology upstream documents were read for interface standards. Function-field additions in the predecessor remain outside this number-field continuation.

## Prior review and per-node checks

The first review returned the work because the five proposed declarations were comments. Revision 2 now gives each name a typed theorem prototype and documents its essential omissions in the file, packet and reader. The seven proved baseline examples remain. The prior title correction to finitely generated K-groups and the principal-localization/finite-support correction are retained consistently in all three deliverables.

| Node suffix | Verdict and evidence |
| --- | --- |
| `relative-rank-homology-comparison` | **Corrected.** Kahn Corollary 2.3.7 and §§4.3.1–4.3.4, pp.12 and 17–18, together with Quillen Theorem 3, printed p.181, justify the cone shift and coefficient degree i−m. Checked negative-degree zero, rank-one augmented chains of two points, rank-two coinvariants, automorphism actions and transport of representatives. The prototype uses the actual inclusion chain cone and representation homology; subtraction occurs only in its guarded nonnegative branch. Ordinary H.1 inputs now cite precise nodes, while chain-coefficient hyperhomology remains an explicit extension. |
| `rank-homology-stability` | **Corrected.** Quillen's Stability, printed p.182, has the two stated bounds: surjectivity at n≥i and isomorphism at n≥i+1. The relative LES and exhaustive finite chains give the maps to full BQ. Its H.1 prerequisite now names the filtered-colimit and homology-comparison nodes. The prototype types all four conclusions on canonical inclusion maps. |
| `rank-filtration-homology-finite-type` | **Verified.** Finite Pic and the LowDegrees projective classification make each positive-rank class set finite. The integral Borel supplier covers every projective lattice, including nonfree ones. Rank zero is terminal up to equivalence; finite sums, Noetherian subgroups, quotients and exact extensions give induction, followed by degreewise stabilization. Arbitrary filtered colimits and rational finite dimension are not used to infer integral finite generation. The actual nerve/representation prototype records the missing arithmetic identifications. |
| `quillen-homotopy-finite-type` | **Corrected.** K.1 supplies direct sum and the shift K_n=π_(n+1)BQ. Read Serre III.1 Proposition 1, IV.3 Proposition 3 and V.1–2, printed pp.465–466, 479 and 489–491. The connected H-space has abelian finitely generated π₁ and trivial deck action on cover homology; the cover argument gives higher homotopy finite generation. No simply connected BQ hypothesis is imposed. CW structure, compactly generated products, natural-transformation homotopies and homology comparison now cite exact H.1 nodes. The prototype concludes finite generation of actual based homotopy groups. |
| `s-localization-finite-defect` | **Verified.** The imported torsion-class-group presentation gives B=A[1/s] with support exactly S, and `N.2/finite-support` supplies that localization sequence. Its finite-field end terms give finite defects for n≥2, even injectivity and odd surjectivity for n≥3. K₁ and K₀ use their separate existing owners. Checked the actual functor, basepoint equation and every cubical-loop representative in the prototype's middle-map compatibility; the residue-group identifications remain expressly omitted. |

These are target-level items. No routine subgroup, exact-sequence or parity argument needs a new node. No fresh definition or construction is introduced, so new definition API and three-test obligations do not arise. Acceptance checks discriminate the coefficient, degree, finite-S and integral-finiteness conventions. The three planets remain within the layer limit.

## Sources and source issue

All five public PDFs were independently downloaded and their SHA-256 hashes match the packet. Read Quillen §1 in full, printed pp.179–185 (PDF pp.187–193, scan headers 195–201); Kahn §§1.1–1.3, 2.1.4–2.4.1 and 4.1–4.3.4; Weibel IV.6.8–6.9, book p.325 (chapter PDF p.59); Putman–Studenmund's introduction, pp.2–4, and §2.1, pp.8–10; and the cited Serre propositions and proofs, including IV.6 Proposition 9, p.483, and the singular-complex regularity footnote in V.1. Every node's source locator matches its recorded version. Source URLs and hashes are in the packet; access dates now record this independent reading.

**ArithmeticKTheory/E27 — confirmed.** Visually checked Kahn §2.2.3, p.9, in arXiv v3 and checked the same formula in the independently downloaded January 2014 author copy. The latter matches its recorded hash. The augmentation is on the base category D, as also shown by §2.2.2 on that page; the displayed target using C is a misprint. It changes no statement in this packet. Added the required independent `sourceIssues.review` verdict. On 8 October the [arXiv history](https://arxiv.org/abs/1108.2441) still lists v3 as latest, and the [author listing](https://webusers.imj-prg.fr/~bruno.kahn/preprints/prep2.html) links the same January copy without a correction. No further mathematical source mistake was found in the passages checked. No source passage is reproduced in these deliverables.

## Pinned baseline verification

Independently read every declaration's actual statement at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 26 names exist, and their hypotheses and conventions support their recorded limited uses. Module paths below are relative to the relevant library; the packet gives complete paths.

| Declaration(s) | Pinned location and statement limit |
| --- | --- |
| `NumberField.RingOfIntegers` | `NumberTheory/NumberField/Basic.lean:104`: integral closure of Z, not S-integers. |
| `NumberField.RingOfIntegers.instFintypeClassGroup` | `NumberTheory/NumberField/ClassNumber.lean:58`: finite class group; the Pic bridge is separate. |
| `Module.Finite.iff_addGroup_fg` | `RingTheory/Finiteness/Defs.lean:140`: Z-module/additive finite-generation equivalence. |
| `Module.Finite.of_exact` | `RingTheory/Finiteness/Finsupp.lean:157`: requires exactness, surjectivity to the last module and finite end modules. The LES application uses the appropriate image/kernel and Noetherian subgroup finiteness. |
| `Set.integer` | `RingTheory/DedekindDomain/SInteger.lean:65`: valuation bounds outside S. |
| `IsDedekindDomain.finite_integer_classGroup` | Tau Ceti `RingTheory/DedekindDomain/SInteger/ClassGroup.lean:94`: transports finite class group without requiring finite S; does not identify K₀. |
| `Set.unit_fg_of_units` | Tau Ceti `RingTheory/DedekindDomain/SInteger/Unit.lean:207`: finite S and finitely generated base units; does not identify K₁. |
| `Ring.HasFiniteQuotients` | `RingTheory/Ideal/Quotient/HasFiniteQuotients/Basic.lean:31`, with the number-ring instance at `NumberTheory/NumberField/Basic.lean:323`: nonzero ideal quotients are finite. |
| `groupHomology` | `RepresentationTheory/Homological/GroupHomology/Basic.lean:230`: actual representation homology in natural-number degrees; no Steinberg or negative-degree convention. |
| `CategoryTheory.ObjectProperty.FullSubcategory`, `ι`, `ιOfLE` | `CategoryTheory/ObjectProperty/FullSubcategory.lean:39,59,133`: existing carriers and canonical inclusion functors; no Q-category. |
| `CategoryTheory.isIsomorphicSetoid` | `CategoryTheory/IsomorphismClasses.lean:37`: isomorphism classes of actual objects. |
| `CategoryTheory.nerve`, `nerveMap` | `AlgebraicTopology/SimplicialSet/Nerve.lean:37,55`: categorical nerve and functor-induced map. |
| `SSet.chainComplexMap`, `homology`, `homologyMap` | `AlgebraicTopology/SimplicialSet/Homology/Basic.lean:82,135,140`: actual simplicial chain/homology maps; singular comparison remains a supplier input. |
| `HomologicalComplex.homotopyCofiber` | `Algebra/Homology/HomotopyCofiber.lean:260`: chain cone, including natural-number complexes; no cellular comparison. |
| `HomologicalComplex.homology` | `Algebra/Homology/ShortComplex/HomologicalComplex.lean:90`: homology at a degree with the required homology instance. |
| `SSet.toTop` | `AlgebraicTopology/SingularSet.lean:67`: realization by left Kan extension. |
| `HomotopyGroup.Pi` | `Topology/Homotopy/HomotopyGroup.lean:457`: actual Fin-indexed cubical homotopy groups; group and commutativity bounds are respected. |
| `HSpace` | `Topology/Homotopy/HSpaces.lean:66`: multiplication and relative unit homotopies; not the Serre conclusion. |
| `HomotopyGroup.mapHom` | Tau Ceti `Topology/Homotopy/HomotopyGroup/Map.lean:222`: existing positive-dimensional based induced homomorphism. Its representative formula matches the prototype condition. |
| `GenLoop`, `GenLoop.boundary` | `Topology/Homotopy/HomotopyGroup.lean:97,140`: actual loops and boundary condition used in postcomposition. |

No baseline citation needed removal, replacement or a new near-miss node. The classical unit comparison and Dirichlet input remain in their existing supplier chain, rather than being assumed as K₁ finiteness.

## Closure, audit and ownership

Seven existing H.1 supplier nodes now replace the broad stage references for ordinary category/bar homology, groupoid decomposition, CW realization, products, natural homotopies and filtered-colimit homology. Their statements were read; these are planning imports, not implemented results. Their elementary realization dependencies do not return through arithmetic finite generation.

No H.1 node states the chain-coefficient hyperhomology/concentration comparison. Narrowed the remaining H.1 request to that exact input, with naturality and coefficient quasi-isomorphisms, and added it to the existing homotopy-scope gap and coverage remainder. H.2's cellular comparison and the early H.6 Serre theorem remain explicit requested extensions, rather than assertions about their current scope. ALS.2 finite CW type and the early ALS.5 integral orientation-duality contract remain routed through the existing Borel R.1 finiteness node. No other roadmap's objects are replanned.

The library audit confirms higher arithmetic K finite generation is absent and classical class-group/unit finiteness is available. The response to confirmed `RT-AREA-ktheory-1/1` is sound: Borel owns buildings, Steinberg modules, Solomon–Tits and arithmetic duality; this part owns rank assembly. Putman–Studenmund Theorem C and Proposition 2.1 require the norm-of-determinant orientation character to the (m−1)st power. Integral duality is applied after passing to a normal torsion-free finite-index subgroup in its kernel, then descended integrally. Nonfree lattices and central factors remain in the supplier contract. Finite CW type supplies constant-coefficient cohomology finiteness, not arbitrary Steinberg-coefficient homology without duality.

Questions for the orchestrator concern ownership only: assign declaration-level nodes for the H.1 chain-coefficient comparison, H.2 cellular comparison and early Serre extension, preserving an acyclic direction; resolve the early ALS contracts through Borel. These honest gaps do not invalidate complete target-level planning. No mathematical contradiction remains.

## Validation

- Packet checker: zero errors and zero warnings after corrections.
- `lean-check` on the unchanged suggested file: exit 0, exactly the five expected `sorry` warnings, all five named prototypes and seven baseline examples elaborated. Available memory was checked before compiling. The shared build uses the exact Mathlib pin.
- Tau Ceti statements were read at their exact pin. The shared Tau Ceti checkout is newer and its `mapHom` compiled module is absent; the file imports Mathlib only. No Tau Ceti-dependent compilation at a different commit is claimed.
- JSON, whitespace, deliverable scope and packet/signature name checks pass. All five implementation statuses remain `unchecked`.

Only the packet, reader, this report and this job's handoff change. The suggested file needs no further correction.
