# Independent review of arithmetic K-theory N.3

Job `REV-ArithmeticKTheory--N.3`, issue #6426. Reviewer: Codex, session `codex-zgeIIj`, independent of authoring session `codex-SwXUca` (#6474, PR #6557). Date: 2026-10-06.

**Verdict: needs_changes.** The seven mathematical statements and their proof outlines are sound after the corrections below. All fourteen baseline citations are confirmed. The suggested file does not meet PROTOCOL §13: every proposed arithmetic declaration, API signature and test is inside a block comment. Its executable native examples elaborate, but do not check those proposed signatures. A missing carrier is an honest limitation; it does not turn a comment into a typed declaration.

This is a completed review. The packet remains `complete`, its single stage remains `planned`, and no stage is closed. The precise H.1 request and recorded finite-type ownership gap are acceptable planning boundaries. The required revision is the typed suggested deliverable.

## Counts and scope

| Item | Result |
| --- | --- |
| Nodes reviewed | 7: five theorems, one construction, one lemma |
| Node verdicts | 4 verified, 3 corrected; all mathematical statements justified |
| Reused target endpoints | 6, retained under their existing parent IDs |
| Baseline declarations | 14 confirmed; none removed, replaced or added |
| Construction API / tests | 8 API entries / 5 discriminating tests |
| Planets | 2, within the six-per-layer limit |
| Nodes added / removed | 0 / 0 |
| Requests | 2 → 1: retained H.1; converted out-of-scope H.3 to a gap |
| Gaps | 0 → 2: unassigned finite-type extension; missing typed signatures |
| Source findings | 0 → 2 confirmed harmless misprints, scoped to Kahn v3 |

Reviewed the packet, suggested file, reader, accepted parent N.1 packet and review, supplier statements, reviewed library audit, and accepted RS-18/RS-33 ownership boundaries. Read the upstream AlgebraicTopology and GrothendieckEulerForms documents in full for topology and exact-category conventions. The reader and supplier packets are inputs outside this issue's editable deliverables.

## Sources and corrections

The three downloaded sources match the packet's SHA-256 values. The source records retain their public URLs and versions.

| Source | Independently checked passages |
| --- | --- |
| [Quillen, finite generation](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf) | §1, source pp.179–185: Theorem 1 and Remark (2), relative rank sequence, stability, arithmetic input and complete finite-generation proof. Rendered p.182 confirms both bounds. One-based PDF page is source page + 8. |
| [Weibel, K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) | IV.1.12–1.18, pp.269–271; IV.6.3–6.3.3, pp.320–321; IV.6.8–6.9, p.325; Q/plus comparison IV.7; V.6.1, p.406; V.6.6–6.6.4, pp.409–410. Used the dated author-hosted combined draft. |
| [Kahn, Around Quillen's theorem A](https://arxiv.org/pdf/1108.2441v3) | §§4.1–4.3.4, pp.15–18, including rank one, Steinberg coefficients and the relative-sequence comparison. Rendered pp.16 and 18 confirm the two misprints. |

Corrections made:

1. Replaced the Kahn stability excerpt, which was not literal at the listed passage, with a literal excerpt from §4.3.4 and clarified its page range.
2. Corrected the transfer citation. IV.6.3.2 constructs restriction-of-scalars transfer on projective modules for finite-projective ring extensions. IV.6.3.3 concerns coherent-module G-transfer. Added IV.6.3 for invariance under natural isomorphisms of exact functors and added these passages to the source's reading record.
3. Removed the H.3 request and recorded its exact need as an unassigned Part II gap. RS-33 H.3 owns plus constructions; H.6 owns concrete spectra and completion. Neither currently supplies the generic connected H-space finite-type theorem. The parent criterion's H.6 edge remains outside this issue's edit scope and is explicitly covered by the gap. The existing Part II proposal is preserved.
4. Recorded the missing typed suggested declarations as a second gap and made the file's opening note explicitly identify its §13 defect. Defined the integer-linear localization shorthand used by the finite-defect signature instead of leaving `j` unbound. This repairs its mathematical register, not its missing typed prototype.
5. Added the degree-two test's supplier boundary: the K₂(ℤ) computation imports a node with an unread upper-bound input. Rational vanishing alone does not establish integral torsion.
6. Added and independently confirmed `ArithmeticKTheory/E25` and `/E26`. In Kahn v3, Proposition 4.2.4's proof uses the ambient generic fibre where the subsheaf's generic fibre is intended; the zero pure subsheaf gives an immediate counterexample to the printed equality. The preceding calculation supplies the intended correction. The Vogel paragraph has a spelling slip in “fibration.” Neither changes a mathematical result. Checked the latest arXiv history, the earlier author copy, author page, correction searches and existing register; no correction was located. No finding is attributed to an uninspected published version.

## Node and dependency review

1. **Finite-rank Q homology — verified.** Finite Pic plus rank/determinant classification makes each rank stratum a finite sum over all projective classes. The Borel supplier supplies integral Steinberg-homology finite generation, including nonfree lattices and rank one. The relative long exact sequence and Noetherian subgroups over Z give the induction. Rational finite dimension is insufficient here and is not substituted.

2. **Rank-filtration stability — corrected citation.** Relative homology for the rank m+1 pair vanishes in degree i when m≥i, giving surjectivity; vanishing also in degree i+1 when m≥i+1 gives injectivity. The same bounds into BQ use the precise filtered-union homology request. These are Q-filtration maps, not GL homological stability. Signed negative homology is zero.

3. **Stable Q homology finite type — verified.** Rank i+1 already computes stable degree-i homology. Thus a single finitely generated group supplies each stable group; an arbitrary filtered colimit of finitely generated groups is not assumed finitely generated. The downstream homotopy theorem allows nonzero π₁=K₀ and remains an explicit ownership gap.

4. **Finite localization defects — corrected register.** For finite S⊆T, the two outer residue terms in the localization segment are finite for n≥2. Their images bound the kernel and cokernel. Positive even finite-field K vanishing makes the inclusion injective. Degree one is excluded because its residue K₀ terms are Z. The parent finite-support supplier supplies finite localization, rather than merely its map to the fraction field.

5. **Specified rational equivalence — verified.** Flat rationalization kills the finite defects of the actual inclusion. `LinearEquiv.ofBijective` packages that particular map. The eight API entries provide evaluation, both inverse rules, uniqueness, empty-S transport, enlargement and field compatibility. The five tests check identity, composition on a nonzero degree-five space, the degree-one failure, an incorrect scalar multiple, and rational even vanishing with nonzero integral torsion. Their statements are sound; their arithmetic examples have not been elaborated.

6. **Forward-map identification — verified.** Evaluation of the native constructor and linear-map extensionality give the stated equality. A separate lemma node is appropriate because the next theorem consumes this API item.

7. **Extension/transfer coherence — corrected citation.** The finite-extension supplier gives finite projectivity and the simultaneous-localization base-change identification when T is exactly the primes above S. Tensor associativity and restriction-of-scalars base change give naturally isomorphic exact-functor composites, hence equal K-maps. Rationalization and the preceding identification give both squares. Ramification is allowed, including Q(i)/Q at 2; an arbitrary additional inverted upstairs prime is excluded.

The six reused endpoints cover integral finite generation, the Borel rank pattern, the separate S-unit degree-one formula, finite positive even groups of S-integer rings, infinite torsion positive even groups of fields, and the noncanonical free-plus-finite splitting. Their statements and parent proof interfaces were inspected. This review preserves their IDs and records their inherited supplier boundaries rather than redeveloping them.

An independent traversal of the seven nodes and six reused endpoints through current packet/decomposition prerequisites reached 574 IDs: 223 nodes, 329 baseline references and 22 stage leaves, with no node cycle. This is a graph check, not a fresh audit of every external baseline reference. Direct supplier contracts were read; stage leaves and supplier source gaps remain their owners' boundaries. In particular, use early Borel Steinberg finiteness and order ranks, not the Borel consequences that consume N.3. The H.1 homology request lies within RS-33's filtered-diagram/coefficient-comparison scope; its existing homotopy-colimit node does not already state this homology comparison.

The reviewed library audit supplies classical units and class-group arithmetic, not higher K-groups, Q-filtration homology or transfer. No baseline object is replanned. The two planets are central theorem/construction landmarks, and the target-level proofs need no additional lemma nodes.

## Baseline verification

Read every recorded statement at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Verified source-file equality against the exact Git objects. Names alone were not used as evidence.

| Declaration | Confirmed use and limits |
| --- | --- |
| `Set.integer` | Native S-integer subalgebra defined by valuation bounds outside S. |
| `IsDedekindDomain.HeightOneSpectrum` | Nonzero prime ideals indexing S. |
| `InfinitePlace.nrRealPlaces`, `nrComplexPlaces` | Native counts for the imported rank formulas. |
| `RingOfIntegers.instFintypeClassGroup` | Finite class group of O_F; Pic transport is separate. |
| `NumberField.Units.finrank_eq` | Actual Dirichlet finrank theorem, not merely the rank definition. |
| `Submodule.fg_of_fg_map_of_fg_inf_ker` | Finite generation from finite image and kernel intersection; Noetherian Z supplies subgroups. |
| `Module.Flat.lTensor_exact` | Flat tensoring preserves exactness of the actual linear maps. |
| `IsLocalization.flat` | Fraction-field localization supplies flat Q over Z. |
| `ClassGroup.equivPic` | Class-group/Pic equivalence for the finite-class argument. |
| `TensorProduct.AlgebraTensorModule.lTensor` | Native Q-linear tensor map, agreeing after scalar restriction with the Z-linear tensor map. |
| `LinearEquiv.ofBijective` | Preserves the specified forward map and supplies the inverse rules. |
| `Set.unit_fg_of_units` (Tau Ceti) | Finite S and finitely generated base units give finitely generated S-units; no K₁ identification. |
| `IsDedekindDomain.finite_integer_classGroup` (Tau Ceti) | Finite base class group implies finite S-integer class group; finite S is not required. |

## Required revision and integration notes

PROTOCOL §13 requires the proposed definitions, API lemmas, examples and named theorems as typed Lean declarations with `sorry` proofs. The file contains none of the seven proposed declarations as executable Lean. Its nine native helper examples establish only that the baseline vocabulary is usable. The parent comment-register precedent does not change this binding requirement.

A revision must use the owning Q/higher-K interfaces to supply actual typed prototypes, with omitted conditions explained where they cannot yet be stated. It must preserve the specified localization map, tensor products and transfers. It must not replace genuine arithmetic carriers by arbitrary modules, opaque K-types or proposition-valued stand-ins. If that carrier boundary prevents a compliant prototype, request a specific protocol decision with this concrete limitation. The comment register retains all names and mathematical intentions for that revision.

Questions/actions for the orchestrator:

- Assign the proposed generic finite-type H-space extension to a supplying node and reconcile the parent's obsolete H.6 request and prerequisite. BQ must be allowed a nonzero fundamental group.
- Include the reader in the revision's authorized deliverables. It still reports zero gaps/two requests and needs to reflect the corrected routing, transfer source and §13 limitation.
- During assembly, coalesce the same-roadmap homology refinements with `ArithmeticKTheory--N.3-finite-generation.json`: its generic rank stability is the same statement, and its conditional finite-type theorem supplies the arithmetic specializations here. Preserve consumer IDs through the chosen common interface. That sibling packet currently also has `needs_changes`; it is a proposed supplier, not a library implementation. The finite S⊆T refinement and specified rational-map coherence remain the distinct contributions here.

## Validation

- Blueprint checker: zero errors, zero warnings, using the pinned declaration index.
- `lean-check research/blueprint/suggested/ArithmeticKTheory--N.3.lean`: exit 0, only nine declaration-uses-`sorry` warnings. Available memory exceeded 20 GB. The build uses exactly the recorded Mathlib commit; imports are Mathlib only. Tau Ceti statements were verified at their source pin. The commented arithmetic signatures remain unchecked.
- JSON, whitespace and authorized-path checks pass. All seven nodes retain `implementationStatus: unchecked`. No implementation or closure is claimed.
